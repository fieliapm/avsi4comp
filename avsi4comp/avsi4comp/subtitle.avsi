################################################################################
#
# avsi4comp - A set of AviSynth functions to help video compositing and editing
# Copyright (C) 2010-present Himawari Tachibana <fieliapm@gmail.com>
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.
#
################################################################################



#LoadPlugin("SubtitleEx.dll")
#LoadPlugin("EffectsMany.dll")

######## Subtitle ########

######## Test ########

function SUBTITLE_TEST(clip clip,string text,int "first_frame",int "last_frame",int "text_color",int "halo_color"){
	default_size=32
	SubtitleEx(clip,text,firstframe=first_frame,lastframe=last_frame,font=subtitle_font,size=Round(default_size*Float(Height(clip))/480.0),textcolor=text_color,halocolor=halo_color)
}

######## Thick Halo ########

function SUBTITLE_WITH_THICK_HALO(clip clip,string text,int "x",int "y",int "first_frame",int "last_frame",string "font",string "effects",int "size",int "text_color",int "halo_color",int "line_margin",int "spc"){
	effects=Default(effects,"b")
	text_color=Default(text_color,color_white)
	halo_color=Default(halo_color,color_black)

	subtitle_text=SubtitleEx(clip,text,x,y,first_frame,last_frame,font,effects,size,text_color,OVERWRITE_SUBTITLE_COLOR_ALPHA(text_color,$0),line_margin,spc)
	return SubtitleEx(subtitle_text,text,x,y,first_frame,last_frame,font,effects+"lg",size,halo_color,halo_color,line_margin,spc)
}

function SUBTITLE_WITH_THICK_HALO_REDUCE_MEMORY(clip clip,string text,int "x",int "y",int "first_frame",int "last_frame",string "font",string "effects",int "size",int "text_color",int "halo_color",int "line_margin",int "spc"){
	return ScriptClip(clip,"SUBTITLE_WITH_THICK_HALO("+THREE_DOUBLE_QUOTE_STRING(text)+"," \
		+OPTIONAL_ARG_TO_STRING(x)+","+OPTIONAL_ARG_TO_STRING(y)+","+OPTIONAL_ARG_TO_STRING(first_frame)+","+OPTIONAL_ARG_TO_STRING(last_frame)+"," \
		+OPTIONAL_STRING_ARG(font)+","+OPTIONAL_STRING_ARG(effects)+","+OPTIONAL_ARG_TO_STRING(size)+","+OPTIONAL_ARG_TO_STRING(text_color)+","+OPTIONAL_ARG_TO_STRING(halo_color)+"," \
		+OPTIONAL_ARG_TO_STRING(line_margin)+","+OPTIONAL_ARG_TO_STRING(spc)+")")
}

######## Heavy Halo ########

function _GET_HALO_COLOR_PER_PASS(int halo_width,int halo_color){
	max_alpha=Float($FF)
	halo_alpha=GET_SUBTITLE_COLOR_A(halo_color)
	halo_alpha_per_pass=$FF-Round(Pow(Float($FF-halo_alpha)/max_alpha,1.0/Float((halo_width*2)+1))*max_alpha)

	return OVERWRITE_SUBTITLE_COLOR_ALPHA(halo_color,halo_alpha_per_pass)
}

function _HEAVY_HALO_SUBTITLE(clip clip,string text,int offset_x,int offset_y,int halo_width,int "x",int "y",int "first_frame",int "last_frame",string "font",string "effects",int "size",int "text_color",int "halo_color_per_pass",int "line_margin",int "spc"){
	return offset_y>halo_width \
		?clip \
		:_HEAVY_HALO_SUBTITLE( \
			offset_x==0&&offset_y==0 \
				?clip \
				:SubtitleEx(clip,text,x+offset_x,y+offset_y,first_frame,last_frame,font,effects,size,text_color,halo_color_per_pass,line_margin,spc), \
			text,offset_x<halo_width?offset_x+1:-halo_width,offset_x<halo_width?offset_y:offset_y+1,halo_width,x,y,first_frame,last_frame,font,effects,size,text_color,halo_color_per_pass,line_margin,spc)
}

function HEAVY_HALO_SUBTITLE(clip clip,string text,int halo_width,int "x",int "y",int "first_frame",int "last_frame",string "font",string "effects",int "size",int "halo_color_per_pass",int "line_margin",int "spc"){
	x=Default(x,Int(Width(clip)*(-0.11)))
	y=Default(y,Int(Height(clip)*(-0.17)))
	halo_color_per_pass=Default(halo_color_per_pass,color_black)

	text_color=OVERWRITE_SUBTITLE_COLOR_ALPHA(halo_color_per_pass,$0)

	return _HEAVY_HALO_SUBTITLE(clip,text,-halo_width,-halo_width,halo_width,x,y,first_frame,last_frame,font,effects,size,text_color,halo_color_per_pass,line_margin,spc)
}

function SUBTITLE_WITH_HEAVY_HALO(clip clip,string text,int "halo_width",int "x",int "y",int "first_frame",int "last_frame",string "font",string "effects",int "size",int "text_color",int "halo_color",int "line_margin",int "spc"){
	halo_width=Default(halo_width,1)
	halo_color=Default(halo_color,color_black)

	halo_color_per_pass=_GET_HALO_COLOR_PER_PASS(halo_width,halo_color)

	subtitle_text=SubtitleEx(clip,text,x,y,first_frame,last_frame,font,effects,size,text_color,halo_color_per_pass,line_margin,spc)
	#return HEAVY_HALO_SUBTITLE(subtitle_text,text,halo_width,x,y,first_frame,last_frame,font,effects,size,halo_color_per_pass,line_margin,spc)
	return halo_width<1 \
		?subtitle_text \
		:ScriptClip(subtitle_text,"HEAVY_HALO_SUBTITLE("+THREE_DOUBLE_QUOTE_STRING(text)+","+String(halo_width)+"," \
			+OPTIONAL_ARG_TO_STRING(x)+","+OPTIONAL_ARG_TO_STRING(y)+","+OPTIONAL_ARG_TO_STRING(first_frame)+","+OPTIONAL_ARG_TO_STRING(last_frame)+"," \
			+OPTIONAL_STRING_ARG(font)+","+OPTIONAL_STRING_ARG(effects)+","+OPTIONAL_ARG_TO_STRING(size)+","+OPTIONAL_ARG_TO_STRING(halo_color_per_pass)+"," \
			+OPTIONAL_ARG_TO_STRING(line_margin)+","+OPTIONAL_ARG_TO_STRING(spc)+")")
}

######## Render Subtitle ########

global subtitle_heavy_halo_width=0

function RENDER_SUBTITLE(clip clip,string text,int "x",int "y",int "first_frame",int "last_frame",string "font",string "effects",int "size",int "text_color",int "halo_color",int "line_margin",int "spc",string "subtitle_mode"){
	subtitle_mode=Default(subtitle_mode,"ex")

	# Subtitle()
	clip_with_subtitle_standard=Subtitle(clip,text,x,y,first_frame,last_frame,font,size,text_color,halo_color,spc=spc,lsp=line_margin)

	# SubtitleEx() normal (default)
	clip_with_subtitle_ex=SubtitleEx(clip,text,x,y,first_frame,last_frame,font,effects,size,text_color,halo_color,line_margin,spc)

	# SubtitleEx() thick halo
	clip_with_subtitle_ex_thick=SUBTITLE_WITH_THICK_HALO(clip,text,x,y,first_frame,last_frame,font,effects,size,text_color,halo_color,line_margin,spc)

	# SubtitleEx() thick halo reduce memory
	clip_with_subtitle_ex_thick_reduce_memory=SUBTITLE_WITH_THICK_HALO_REDUCE_MEMORY(clip,text,x,y,first_frame,last_frame,font,effects,size,text_color,halo_color,line_margin,spc)

	# SubtitleEx() heavy halo
	clip_with_subtitle_ex_heavy=SUBTITLE_WITH_HEAVY_HALO(clip,text,subtitle_heavy_halo_width,x,y,first_frame,last_frame,font,effects,size,text_color,halo_color,line_margin,spc)

	return Eval("clip_with_subtitle_"+subtitle_mode)
}

######## Subtitle Clip ########

function SUBTITLE_CLIP_BASE(clip ref_clip,int "length",int "width",int "height"){
	return BlankClip(ref_clip,length=length,width=width,height=height,pixel_type="RGB32",color=color_black)
}

function RENDER_SUBTITLE_CLIP(clip subtitle_bg,string text,int "x",int "y",int "first_frame",int "last_frame",string "font",string "effects",int "size",int "text_color",int "halo_color",int "line_margin",int "spc",string "subtitle_mode"){
	text_rgb_color=Defined(text_color)?OVERWRITE_SUBTITLE_COLOR_ALPHA(text_color,$FF):text_color
	halo_rgb_color=Defined(halo_color)?OVERWRITE_SUBTITLE_COLOR_ALPHA(halo_color,$FF):halo_color
	text_alpha=Defined(text_color)?GET_SUBTITLE_COLOR_A(text_color):$FF
	halo_alpha=Defined(halo_color)?GET_SUBTITLE_COLOR_A(halo_color):$FF
	text_mask_color=ASSIGN_COLOR_RGB(text_alpha,text_alpha,text_alpha)
	halo_mask_color=ASSIGN_COLOR_RGB(halo_alpha,halo_alpha,halo_alpha)

	subtitle_bg_rgb=BlankClip(subtitle_bg,color=halo_rgb_color)

	subtitle_mask=RENDER_SUBTITLE(subtitle_bg,text,x,y,first_frame,last_frame,font,effects,size,text_mask_color,halo_mask_color,line_margin,spc,subtitle_mode)
	subtitle_rgb=RENDER_SUBTITLE(subtitle_bg_rgb,text,x,y,first_frame,last_frame,font,effects,size,text_rgb_color,halo_rgb_color,line_margin,spc,subtitle_mode)

	return Mask(subtitle_rgb,Greyscale(subtitle_mask))
}

######## Subtitle FX ########

global subtitle_clip_width=856
global subtitle_clip_height=480



function _SUBTITLE_FX_PRE_OPAQUE(clip clip,int bg_color,string text,int "x",int "y",int "first_frame",int "last_frame",string "font",string "effects",int "size",int "text_color",int "halo_color",string "subtitle_mode"){
	subtitle_bg=BlankClip(clip,width=subtitle_clip_width,height=subtitle_clip_height,color=bg_color)
	return RENDER_SUBTITLE(subtitle_bg,text,x,y,first_frame,last_frame,font,effects,size,text_color,halo_color,subtitle_mode=subtitle_mode)
}

function _SUBTITLE_FX_PRE(clip clip,string text,int "x",int "y",int "first_frame",int "last_frame",string "font",string "effects",int "size",int "text_color",int "halo_color",string "subtitle_mode"){
	subtitle_bg=SUBTITLE_CLIP_BASE(clip,width=subtitle_clip_width,height=subtitle_clip_height)
	return RENDER_SUBTITLE_CLIP(subtitle_bg,text,x,y,first_frame,last_frame,font,effects,size,text_color,halo_color,subtitle_mode=subtitle_mode)
}

function _SUBTITLE_FX_POST(clip clip,clip subtitle_rgba,int first_frame,int last_frame){
	subtitle_rgba_resized=RESIZE_TO_REF_CLIP(subtitle_rgba,clip)
	#clip_with_subtitle=Layer(clip,subtitle_rgba_resized,"Add")
	#return OVERWRITE_RANGE(clip,clip_with_subtitle,first_frame,last_frame)
	return ApplyRange(clip,first_frame,last_frame,"Layer",subtitle_rgba_resized,"Add")
}



function SUBTITLE_NORMAL(clip clip,string text,int "x",int "y",int "first_frame",int "last_frame",string "font",string "effects",int "size",int "text_color",int "halo_color",string "subtitle_mode"){
	first_frame=Default(first_frame,0)
	last_frame=Default(last_frame,Framecount(clip)-1)

	Assert(IsRGB32(clip),"SUBTITLE_NORMAL(): clip only support RGB32 format")

	subtitle_rgba=_SUBTITLE_FX_PRE(clip,text,x,y,first_frame,last_frame,font,effects,size,text_color,halo_color,subtitle_mode)
	return _SUBTITLE_FX_POST(clip,subtitle_rgba,first_frame,last_frame)
}

function SUBTITLE_FX_SMOOTH_BLINK(clip clip,string text,int "x",int "y",int "first_frame",int "last_frame",string "font",string "effects",int "size",int "text_color",int "halo_color",string "subtitle_mode",float "blink_interval",float "min_opacity",float "max_opacity"){
	first_frame=Default(first_frame,0)
	last_frame=Default(last_frame,Framecount(clip)-1)
	blink_interval=Default(blink_interval,Framerate(clip))
	min_opacity=Default(min_opacity,0.0)
	max_opacity=Default(max_opacity,1.0)

	Assert(IsRGB32(clip),"SUBTITLE_FX_SMOOTH_BLINK(): clip only support RGB32 format")

	subtitle_rgba=_SUBTITLE_FX_PRE(clip,text,x,y,first_frame,last_frame,font,effects,size,text_color,halo_color,subtitle_mode)

	subtitle_rgba_blink_containing_parameter=ScriptClip(subtitle_rgba,"RGBAdjust(a=alpha_factor)")
	subtitle_rgba_blink=FrameEvaluate(subtitle_rgba_blink_containing_parameter,"alpha_factor=Spline(-Cos((current_frame-("+OPTIONAL_ARG_TO_STRING(first_frame)+"))*Pi()*2.0/("+OPTIONAL_ARG_TO_STRING(blink_interval)+")),-1.0,"+OPTIONAL_ARG_TO_STRING(min_opacity)+",1.0,"+OPTIONAL_ARG_TO_STRING(max_opacity)+",cubic=false)")

	return _SUBTITLE_FX_POST(clip,subtitle_rgba_blink,first_frame,last_frame)
}

function SUBTITLE_FX_FADE_IN_FADE_OUT(clip clip,string text,int x,int y,int start_frame,int end_frame,int front_fade_count,int rear_fade_count,string "font",string "effects",int "size",int "text_color",int "halo_color",string "subtitle_mode"){
	before_start_frame=start_frame-front_fade_count
	after_end_frame=end_frame+rear_fade_count

	Assert(IsRGB32(clip),"SUBTITLE_FX_FADE_IN_FADE_OUT(): clip only support RGB32 format")

	subtitle_rgba=_SUBTITLE_FX_PRE(clip,text,x,y,before_start_frame,after_end_frame,font,effects,size,text_color,halo_color,subtitle_mode)

	subtitle_rgba_faded_containing_parameter=ScriptClip(subtitle_rgba,"RGBAdjust(a=alpha_factor)")
	subtitle_rgba_faded=FrameEvaluate(subtitle_rgba_faded_containing_parameter,"alpha_factor=Spline(current_frame,"+String(before_start_frame)+",0.0,"+String(start_frame)+",1.0,"+String(end_frame)+",1.0,"+String(after_end_frame)+",0.0,cubic=false)")

	return _SUBTITLE_FX_POST(clip,subtitle_rgba_faded,before_start_frame,after_end_frame)
}

function SUBTITLE_FX_OFFSET_FADE_IN_FADE_OUT(clip clip,string text,int x,int y,int start_frame,int end_frame,int front_fade_count,int rear_fade_count,string "font",string "effects",int "size",int "text_color",int "halo_color",string "subtitle_mode",float "appear_offset"){
	appear_offset=Default(appear_offset,size*2.0)

	before_start_frame=start_frame-front_fade_count
	after_end_frame=end_frame+rear_fade_count

	Assert(IsRGB32(clip),"SUBTITLE_FX_OFFSET_FADE_IN_FADE_OUT(): clip only support RGB32 format")

	subtitle_rgba=_SUBTITLE_FX_PRE(clip,text,x,y,before_start_frame,after_end_frame,font,effects,size,text_color,halo_color,subtitle_mode)

	subtitle_rgba_faded_containing_parameter=ScriptClip(subtitle_rgba,"RGBAdjust(a=alpha_factor)")
	subtitle_rgba_faded=FrameEvaluate(subtitle_rgba_faded_containing_parameter,"alpha_factor=Spline(current_frame,"+String(before_start_frame)+",0.0,"+String(start_frame)+",1.0,"+String(end_frame)+",1.0,"+String(after_end_frame)+",0.0,cubic=false)")
	subtitle_rgba_zoomed_containing_parameter=ScriptClip(subtitle_rgba_faded,"FAST_ZOOM(srcx=0.0,dstx=dstx)")
	subtitle_rgba_zoomed=FrameEvaluate(subtitle_rgba_zoomed_containing_parameter,"dstx=Spline(current_frame,"+String(start_frame)+",0.0,"+String(end_frame)+","+String(appear_offset)+",cubic=false)")

	return _SUBTITLE_FX_POST(clip,subtitle_rgba_zoomed,before_start_frame,after_end_frame)
}

function SUBTITLE_FX_MOSAIC_IN_MOSAIC_OUT(clip clip,string text,int x,int y,int start_frame,int end_frame,int front_fade_count,int rear_fade_count,string "font",string "effects",int "size",int "text_color",int "halo_color",string "subtitle_mode",float "min_mosaic_factor",float "max_mosaic_factor"){
	min_mosaic_factor=Default(min_mosaic_factor,1.0)
	max_mosaic_factor=Default(max_mosaic_factor,size)

	min_mosaic_factor_pow=Log(min_mosaic_factor)/Log(2.0)
	max_mosaic_factor_pow=Log(max_mosaic_factor)/Log(2.0)

	before_start_frame=start_frame-front_fade_count
	after_end_frame=end_frame+rear_fade_count

	Assert(IsRGB32(clip),"SUBTITLE_FX_MOSAIC_IN_MOSAIC_OUT(): clip only support RGB32 format")

	subtitle_rgba=_SUBTITLE_FX_PRE(clip,text,x,y,before_start_frame,after_end_frame,font,effects,size,text_color,halo_color,subtitle_mode)

	subtitle_rgba_mosaic_containing_parameter=ScriptClip(subtitle_rgba,"MOSAIC_ALL(mosaic_factor)")
	subtitle_rgba_mosaic=FrameEvaluate(subtitle_rgba_mosaic_containing_parameter,"mosaic_factor=Pow(2.0,Spline(current_frame,"+String(before_start_frame)+","+String(max_mosaic_factor_pow)+","+String(start_frame)+","+String(min_mosaic_factor_pow)+","+String(end_frame)+","+String(min_mosaic_factor_pow)+","+String(after_end_frame)+","+String(max_mosaic_factor_pow)+",cubic=false))")
	subtitle_rgba_faded_containing_parameter=ScriptClip(subtitle_rgba_mosaic,"RGBAdjust(a=alpha_factor)")
	subtitle_rgba_faded=FrameEvaluate(subtitle_rgba_faded_containing_parameter,"alpha_factor=Spline(current_frame,"+String(before_start_frame)+",0.0,"+String(start_frame)+",1.0,"+String(end_frame)+",1.0,"+String(after_end_frame)+",0.0,cubic=false)")

	return _SUBTITLE_FX_POST(clip,subtitle_rgba_faded,before_start_frame,after_end_frame)
}

function SUBTITLE_FX_FLY_IN_FLY_OUT(clip clip,string text,int x,int y,int start_frame,int end_frame,int front_fade_count,int rear_fade_count,string "font",string "effects",int "size",int "text_color",int "halo_color",string "subtitle_mode"){
	before_start_frame=start_frame-front_fade_count
	after_end_frame=end_frame+rear_fade_count

	Assert(IsRGB32(clip),"SUBTITLE_FX_FLY_IN_FLY_OUT(): clip only support RGB32 format")

	subtitle_rgba=_SUBTITLE_FX_PRE(clip,text,x,y,before_start_frame,after_end_frame,font,effects,size,text_color,halo_color,subtitle_mode)

	subtitle_rgba_zoomed_containing_parameter=ScriptClip(subtitle_rgba,"FAST_ZOOM(srcx=0.0,dstx=dstx)")
	subtitle_rgba_zoomed=FrameEvaluate(subtitle_rgba_zoomed_containing_parameter,"dstx=Float(Width())*Pow(Spline(current_frame,"+String(before_start_frame)+",1.0,"+String(start_frame)+",0.0,"+String(end_frame)+",0.0,"+String(after_end_frame)+",-1.0,cubic=false),3.0)")

	return _SUBTITLE_FX_POST(clip,subtitle_rgba_zoomed,before_start_frame,after_end_frame)
}

function SUBTITLE_FX_SMEAR_IN_SMEAR_OUT(clip clip,string text,int x,int y,int start_frame,int end_frame,int front_fade_count,int rear_fade_count,string "font",string "effects",int "size",int "text_color",int "halo_color",string "subtitle_mode"){
	before_start_frame=start_frame-front_fade_count
	after_end_frame=end_frame+rear_fade_count

	Assert(IsRGB32(clip),"SUBTITLE_FX_SMEAR_IN_SMEAR_OUT(): clip only support RGB32 format")

	subtitle_rgba=_SUBTITLE_FX_PRE(clip,text,x,y,before_start_frame,after_end_frame,font,effects,size,text_color,halo_color,subtitle_mode)

	subtitle_rgba_smeared_containing_parameter=ScriptClip(subtitle_rgba,"PIXEL_SMEAR(smear_ratio_x=smear_ratio_x)")
	subtitle_rgba_smeared=FrameEvaluate(subtitle_rgba_smeared_containing_parameter,"smear_ratio_x=Spline(current_frame,"+String(before_start_frame)+",-1.0,"+String(start_frame)+",0.0,"+String(end_frame)+",0.0,"+String(after_end_frame)+",1.0,cubic=false)")

	return _SUBTITLE_FX_POST(clip,subtitle_rgba_smeared,before_start_frame,after_end_frame)
}

function SUBTITLE_FX_SLIDE_IN_WATER_OUT(clip clip,string text,int x,int y,int start_frame,int end_frame,int front_fade_count,int rear_fade_count,string "font",string "effects",int "size",int "text_color",int "halo_color",string "subtitle_mode",float "appear_offset"){
	appear_offset=Default(appear_offset,size*1.5)

	before_start_frame=start_frame-front_fade_count
	after_end_frame=end_frame+rear_fade_count

	Assert(IsRGB32(clip),"SUBTITLE_FX_SLIDE_IN_WATER_OUT(): clip only support RGB32 format")

	subtitle_rgba=_SUBTITLE_FX_PRE(clip,text,x,y,before_start_frame,after_end_frame,font,effects,size,text_color,halo_color,subtitle_mode)

	subtitle_rgba_faded_containing_parameter=ScriptClip(subtitle_rgba,"RGBAdjust(a=alpha_factor)")
	subtitle_rgba_faded=FrameEvaluate(subtitle_rgba_faded_containing_parameter,"alpha_factor=Spline(current_frame,"+String(before_start_frame)+",0.0,"+String(start_frame)+",1.0,"+String(end_frame)+",1.0,"+String(after_end_frame)+",0.0,cubic=false)")
	subtitle_rgba_zoomed_containing_parameter=ScriptClip(subtitle_rgba_faded,"FAST_ZOOM(srcx=0.0,srcy=0.0,dstx=dstx,dsty=dsty)")
	subtitle_rgba_zoomed_containing_parameter=FrameEvaluate(subtitle_rgba_zoomed_containing_parameter,"dstx=Spline(current_frame,"+String(before_start_frame)+","+String(-appear_offset)+","+String(start_frame)+",0.0,"+String(end_frame)+",0.0,"+String(after_end_frame)+","+String(appear_offset)+",cubic=false)")
	subtitle_rgba_zoomed=FrameEvaluate(subtitle_rgba_zoomed_containing_parameter,"dsty=Spline(current_frame,"+String(before_start_frame)+","+String(-appear_offset)+","+String(start_frame)+",0.0,"+String(end_frame)+",0.0,"+String(after_end_frame)+",0.0,cubic=false)")

	subtitle_rgba_with_fx=EffectWater(subtitle_rgba_zoomed,end_frame,after_end_frame,amp=1,eamp=100)

	return _SUBTITLE_FX_POST(clip,subtitle_rgba_with_fx,before_start_frame,after_end_frame)
}



function RANDOM_JIS_CHAR(){
	return Chr(PSEUDO_RANDOM($E0-$A1)+$A1)
}

function RANDOM_JIS_KANA_CHAR(){
	return Chr(PSEUDO_RANDOM($DE-$A6)+$A6)
}

function RANDOM_ASCII_CHAR(){
	ascii_code=PSEUDO_RANDOM($7E-$21)+$21
	ascii_code=ascii_code+(ascii_code>=$7C?1:0)
	return Chr(ascii_code)
}

function SUBTITLE_FX_RANDOM_STRING(clip clip,string text,int x,int y,int start_frame,int end_frame,int front_fade_count,int rear_fade_count,string font,string effects,int size,int text_color,int halo_color,string "subtitle_mode",string "random_char_func",string "exclude_char_set"){
	random_char_func=Default(random_char_func,"RANDOM_ASCII_CHAR")

	before_start_frame=start_frame-front_fade_count
	after_end_frame=end_frame+rear_fade_count

	Assert(IsRGB32(clip),"SUBTITLE_FX_RANDOM_STRING(): clip only support RGB32 format")

	subtitle_bg=SUBTITLE_CLIP_BASE(clip,width=subtitle_clip_width,height=subtitle_clip_height)

	random_text="RANDOM_STRING_OUT_OF_FRAME_RANGE("+THREE_DOUBLE_QUOTE_STRING(text)+",current_frame,"+String(start_frame)+","+String(end_frame)+","+DOUBLE_QUOTE_STRING(random_char_func)+","+OPTIONAL_STRING_ARG_CONTAIN_DOUBLE_QUOTE_CHAR(exclude_char_set)+")"
	subtitle_rgba_containing_parameter=ScriptClip(subtitle_bg,"RENDER_SUBTITLE_CLIP("+random_text+","+String(x)+","+String(y)+","+String(before_start_frame)+","+String(after_end_frame)+","+DOUBLE_QUOTE_STRING(font)+","+DOUBLE_QUOTE_STRING(effects)+","+String(size)+",SCALE_SUBTITLE_COLOR_ALPHA("+String(text_color)+",alpha_factor),SCALE_SUBTITLE_COLOR_ALPHA("+String(halo_color)+",alpha_factor),subtitle_mode="+OPTIONAL_STRING_ARG(subtitle_mode)+")")
	subtitle_rgba=FrameEvaluate(subtitle_rgba_containing_parameter,"alpha_factor=Spline(current_frame,"+String(before_start_frame)+",0.0,"+String(start_frame)+",1.0,"+String(end_frame)+",1.0,"+String(after_end_frame)+",0.0,cubic=false)")
	subtitle_rgba=FrameEvaluate(subtitle_rgba,"PSEUDO_RANDOM_SEED(current_frame)")

	subtitle_rgba_slow_motion=SLOW_MOTION_TO_FPS(subtitle_rgba,10,true,linear=false)

	return _SUBTITLE_FX_POST(clip,subtitle_rgba_slow_motion,before_start_frame,after_end_frame)
}
