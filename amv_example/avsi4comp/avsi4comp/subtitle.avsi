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
	default_size=28
	SubtitleEx(clip,text,firstframe=first_frame,lastframe=last_frame,font=subtitle_font,size=Round(default_size*Float(Height(clip))/480.0),textcolor=text_color,halocolor=halo_color)
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
	return HEAVY_HALO_SUBTITLE(subtitle_text,text,halo_width,x,y,first_frame,last_frame,font,effects,size,halo_color_per_pass,line_margin,spc)
}

######## Subtitle Clip ########

global subtitle_clip_halo_width=0

function SUBTITLE_CLIP_BASE(clip ref_clip,int "length",int "width",int "height"){
	return BlankClip(ref_clip,length=length,width=width,height=height,pixel_type="RGB32",color=color_black)
}

function SUBTITLE_CLIP(clip subtitle_bg,string text,int "x",int "y",int "first_frame",int "last_frame",string "font",string "effects",int "size",int "text_color",int "halo_color",int "line_margin",int "spc",bool "subtitle_ex"){
	text_rgb_color=Defined(text_color)?OVERWRITE_COLOR_ALPHA(text_color,$0):text_color
	halo_rgb_color=Defined(halo_color)?OVERWRITE_COLOR_ALPHA(halo_color,$0):halo_color
	text_alpha=Defined(text_color)?GET_SUBTITLE_COLOR_A(text_color):$FF
	halo_alpha=Defined(halo_color)?GET_SUBTITLE_COLOR_A(halo_color):$FF
	text_mask_color=ASSIGN_COLOR_RGB(text_alpha,text_alpha,text_alpha)
	halo_mask_color=ASSIGN_COLOR_RGB(halo_alpha,halo_alpha,halo_alpha)
	subtitle_ex=Default(subtitle_ex,true)

	subtitle_bg_rgb=BlankClip(subtitle_bg,color=halo_rgb_color)

	# Subtitle()
	subtitle_mask_standard=Subtitle(subtitle_bg,text,x,y,first_frame,last_frame,font,size,text_mask_color,halo_mask_color,spc=spc,lsp=line_margin)
	subtitle_rgb_standard=Subtitle(subtitle_bg_rgb,text,x,y,first_frame,last_frame,font,size,text_rgb_color,halo_rgb_color,spc=spc,lsp=line_margin)

	# SubtitleEx()
	#subtitle_mask_ex=SubtitleEx(subtitle_bg,text,x,y,first_frame,last_frame,font,effects,size,text_mask_color,halo_mask_color,line_margin,spc)
	#subtitle_rgb_ex=SubtitleEx(subtitle_bg_rgb,text,x,y,first_frame,last_frame,font,effects,size,text_rgb_color,halo_rgb_color,line_margin,spc)
	subtitle_mask_ex=SUBTITLE_WITH_HEAVY_HALO(subtitle_bg,text,subtitle_clip_halo_width,x,y,first_frame,last_frame,font,effects,size,text_mask_color,halo_mask_color,line_margin,spc)
	subtitle_rgb_ex=SUBTITLE_WITH_HEAVY_HALO(subtitle_bg_rgb,text,subtitle_clip_halo_width,x,y,first_frame,last_frame,font,effects,size,text_rgb_color,halo_rgb_color,line_margin,spc)

	subtitle_mask=subtitle_ex?subtitle_mask_ex:subtitle_mask_standard
	subtitle_rgb=subtitle_ex?subtitle_rgb_ex:subtitle_rgb_standard

	return Mask(subtitle_rgb,Greyscale(subtitle_mask))
}

######## Subtitle FX ########

global subtitle_clip_width=856
global subtitle_clip_height=480



function _SUBTITLE_FX_PRE(clip clip_rgba,string text,int "x",int "y",int "first_frame",int "last_frame",string "font",string "effects",int "size",int "text_color",int "halo_color",bool "subtitle_ex"){
	subtitle_bg=SUBTITLE_CLIP_BASE(clip_rgba,width=subtitle_clip_width,height=subtitle_clip_height)
	return SUBTITLE_CLIP(subtitle_bg,text,x,y,first_frame,last_frame,font,effects,size,text_color,halo_color,subtitle_ex=subtitle_ex)
}

function _SUBTITLE_FX_POST(clip clip_rgba,clip subtitle_rgba,int first_frame,int last_frame){
	subtitle_rgba_resized=RESIZE_TO_REF_CLIP(subtitle_rgba,clip_rgba)
	clip_with_subtitle=Layer(clip_rgba,subtitle_rgba_resized,"Add")
	return OVERWRITE_RANGE(clip_rgba,clip_with_subtitle,first_frame,last_frame)
	#return ApplyRange(clip_rgba,first_frame,last_frame,"Layer",subtitle_rgba_resized,"Add")
}



function SUBTITLE_NORMAL(clip clip,string text,int "x",int "y",int "first_frame",int "last_frame",string "font",string "effects",int "size",int "text_color",int "halo_color",bool "subtitle_ex"){
	first_frame=Default(first_frame,0)
	last_frame=Default(last_frame,Framecount(clip)-1)

	clip_rgba=ConvertToRGB32(clip)
	subtitle_rgba=_SUBTITLE_FX_PRE(clip_rgba,text,x,y,first_frame,last_frame,font,effects,size,text_color,halo_color,subtitle_ex)
	return _SUBTITLE_FX_POST(clip_rgba,subtitle_rgba,first_frame,last_frame)
}

function SUBTITLE_FX_SMOOTH_BLINK(clip clip,string text,int "x",int "y",int "first_frame",int "last_frame",string "font",string "effects",int "size",int "text_color",int "halo_color",bool "subtitle_ex",float "blink_interval",float "min_opacity",float "max_opacity"){
	first_frame=Default(first_frame,0)
	last_frame=Default(last_frame,Framecount(clip)-1)
	blink_interval=Default(blink_interval,Framerate(clip))
	min_opacity=Default(min_opacity,0.0)
	max_opacity=Default(max_opacity,1.0)

	clip_rgba=ConvertToRGB32(clip)
	subtitle_rgba=_SUBTITLE_FX_PRE(clip_rgba,text,x,y,first_frame,last_frame,font,effects,size,text_color,halo_color,subtitle_ex)

	subtitle_rgba_blink_containing_var=ScriptClip(subtitle_rgba,"RGBAdjust(a=alpha_factor)")
	subtitle_rgba_blink=FrameEvaluate(subtitle_rgba_blink_containing_var,"alpha_factor=Spline(-Cos((current_frame-("+OPTIONAL_ARG_TO_STRING(first_frame)+"))*Pi()*2.0/("+OPTIONAL_ARG_TO_STRING(blink_interval)+")),-1.0,"+OPTIONAL_ARG_TO_STRING(min_opacity)+",1.0,"+OPTIONAL_ARG_TO_STRING(max_opacity)+",cubic=false)")

	return _SUBTITLE_FX_POST(clip_rgba,subtitle_rgba_blink,first_frame,last_frame)
}

function SUBTITLE_FX_FADE_IN_FADE_OUT(clip clip,string text,int x,int y,int start_frame,int end_frame,int front_fade_count,int rear_fade_count,string "font",string "effects",int "size",int "text_color",int "halo_color",bool "subtitle_ex"){
	before_start_frame=start_frame-front_fade_count
	after_end_frame=end_frame+rear_fade_count

	clip_rgba=ConvertToRGB32(clip)
	subtitle_rgba=_SUBTITLE_FX_PRE(clip_rgba,text,x,y,before_start_frame,after_end_frame,font,effects,size,text_color,halo_color,subtitle_ex)

	subtitle_rgba_faded_containing_var=ScriptClip(subtitle_rgba,"RGBAdjust(a=alpha_factor)")
	subtitle_rgba_faded=FrameEvaluate(subtitle_rgba_faded_containing_var,"alpha_factor=Spline(current_frame,"+String(before_start_frame)+",0.0,"+String(start_frame)+",1.0,"+String(end_frame)+",1.0,"+String(after_end_frame)+",0.0,cubic=false)")

	return _SUBTITLE_FX_POST(clip_rgba,subtitle_rgba_faded,before_start_frame,after_end_frame)
}

function SUBTITLE_FX_OFFSET_FADE_IN_FADE_OUT(clip clip,string text,int x,int y,int start_frame,int end_frame,int front_fade_count,int rear_fade_count,string "font",string "effects",int "size",int "text_color",int "halo_color",bool "subtitle_ex",float "appear_offset"){
	appear_offset=Default(appear_offset,size*2.0)

	before_start_frame=start_frame-front_fade_count
	after_end_frame=end_frame+rear_fade_count

	clip_rgba=ConvertToRGB32(clip)
	subtitle_rgba=_SUBTITLE_FX_PRE(clip_rgba,text,x,y,before_start_frame,after_end_frame,font,effects,size,text_color,halo_color,subtitle_ex)

	subtitle_rgba_faded_containing_var=ScriptClip(subtitle_rgba,"RGBAdjust(a=alpha_factor)")
	subtitle_rgba_faded=FrameEvaluate(subtitle_rgba_faded_containing_var,"alpha_factor=Spline(current_frame,"+String(before_start_frame)+",0.0,"+String(start_frame)+",1.0,"+String(end_frame)+",1.0,"+String(after_end_frame)+",0.0,cubic=false)")
	subtitle_rgba_zoomed_containing_var=ScriptClip(subtitle_rgba_faded,"FAST_ZOOM(srcx=0.0,dstx=dstx)")
	subtitle_rgba_zoomed=FrameEvaluate(subtitle_rgba_zoomed_containing_var,"dstx=Spline(current_frame,"+String(start_frame)+",0.0,"+String(end_frame)+","+String(appear_offset)+",cubic=false)")

	return _SUBTITLE_FX_POST(clip_rgba,subtitle_rgba_zoomed,before_start_frame,after_end_frame)
}

function SUBTITLE_FX_FLY_IN_FLY_OUT(clip clip,string text,int x,int y,int start_frame,int end_frame,int front_fade_count,int rear_fade_count,string "font",string "effects",int "size",int "text_color",int "halo_color",bool "subtitle_ex"){
	before_start_frame=start_frame-front_fade_count
	after_end_frame=end_frame+rear_fade_count

	clip_rgba=ConvertToRGB32(clip)
	subtitle_rgba=_SUBTITLE_FX_PRE(clip_rgba,text,x,y,before_start_frame,after_end_frame,font,effects,size,text_color,halo_color,subtitle_ex)

	subtitle_rgba_zoomed_containing_var=ScriptClip(subtitle_rgba,"FAST_ZOOM(srcx=0.0,dstx=dstx)")
	subtitle_rgba_zoomed=FrameEvaluate(subtitle_rgba_zoomed_containing_var,"dstx=subtitle_clip_width*Pow(Spline(current_frame,"+String(before_start_frame)+",1.0,"+String(start_frame)+",0.0,"+String(end_frame)+",0.0,"+String(after_end_frame)+",-1.0,cubic=false),3.0)")

	return _SUBTITLE_FX_POST(clip_rgba,subtitle_rgba_zoomed,before_start_frame,after_end_frame)
}

function SUBTITLE_FX_PULL_IN_PULL_OUT(clip clip,string text,int x,int y,int start_frame,int end_frame,int front_fade_count,int rear_fade_count,string "font",string "effects",int "size",int "text_color",int "halo_color",bool "subtitle_ex"){
	before_start_frame=start_frame-front_fade_count
	after_end_frame=end_frame+rear_fade_count

	clip_rgba=ConvertToRGB32(clip)
	subtitle_rgba=_SUBTITLE_FX_PRE(clip_rgba,text,x,y,before_start_frame,after_end_frame,font,effects,size,text_color,halo_color,subtitle_ex)

	subtitle_rgba_pulled_containing_var=ScriptClip(subtitle_rgba,"PULL_IN_OUT(pull_ratio_x=pull_ratio_x)")
	subtitle_rgba_pulled=FrameEvaluate(subtitle_rgba_pulled_containing_var,"pull_ratio_x=Spline(current_frame,"+String(before_start_frame)+",-1.0,"+String(start_frame)+",0.0,"+String(end_frame)+",0.0,"+String(after_end_frame)+",1.0,cubic=false)")

	return _SUBTITLE_FX_POST(clip_rgba,subtitle_rgba_pulled,before_start_frame,after_end_frame)
}

function SUBTITLE_FX_SLIDE_IN_WATER_OUT(clip clip,string text,int x,int y,int start_frame,int end_frame,int front_fade_count,int rear_fade_count,string "font",string "effects",int "size",int "text_color",int "halo_color",bool "subtitle_ex",float "appear_offset"){
	appear_offset=Default(appear_offset,size*1.5)

	before_start_frame=start_frame-front_fade_count
	after_end_frame=end_frame+rear_fade_count

	clip_rgba=ConvertToRGB32(clip)
	subtitle_rgba=_SUBTITLE_FX_PRE(clip_rgba,text,x,y,before_start_frame,after_end_frame,font,effects,size,text_color,halo_color,subtitle_ex)

	subtitle_rgba_faded_containing_var=ScriptClip(subtitle_rgba,"RGBAdjust(a=alpha_factor)")
	subtitle_rgba_faded=FrameEvaluate(subtitle_rgba_faded_containing_var,"alpha_factor=Spline(current_frame,"+String(before_start_frame)+",0.0,"+String(start_frame)+",1.0,"+String(end_frame)+",1.0,"+String(after_end_frame)+",0.0,cubic=false)")
	subtitle_rgba_zoomed_containing_var=ScriptClip(subtitle_rgba_faded,"FAST_ZOOM(srcx=0.0,srcy=0.0,dstx=dstx,dsty=dsty)")
	subtitle_rgba_zoomed_containing_var=FrameEvaluate(subtitle_rgba_zoomed_containing_var,"dstx=Spline(current_frame,"+String(before_start_frame)+","+String(-appear_offset)+","+String(start_frame)+",0.0,"+String(end_frame)+",0.0,"+String(after_end_frame)+","+String(appear_offset)+",cubic=false)")
	subtitle_rgba_zoomed=FrameEvaluate(subtitle_rgba_zoomed_containing_var,"dsty=Spline(current_frame,"+String(before_start_frame)+","+String(-appear_offset)+","+String(start_frame)+",0.0,"+String(end_frame)+",0.0,"+String(after_end_frame)+",0.0,cubic=false)")

	subtitle_rgba_with_fx=EffectWater(subtitle_rgba_zoomed,end_frame,after_end_frame,amp=1,eamp=100)

	return _SUBTITLE_FX_POST(clip_rgba,subtitle_rgba_with_fx,before_start_frame,after_end_frame)
}



function RANDOM_JIS_CHAR(){
	return Chr(PSEUDO_RANDOM($E0-$A1)+$A1)
}

function RANDOM_ASCII_CHAR(){
	ascii_code=PSEUDO_RANDOM($7E-$21)+$21
	ascii_code=ascii_code+(ascii_code>=$7C?1:0)
	return Chr(ascii_code)
}

function SUBTITLE_FX_RANDOM_STRING(clip clip,string text,int x,int y,int start_frame,int end_frame,int front_fade_count,int rear_fade_count,string font,string effects,int size,int text_color,int halo_color,bool "subtitle_ex",string "random_char_func"){
	random_char_func=Default(random_char_func,"RANDOM_ASCII_CHAR")

	before_start_frame=start_frame-front_fade_count
	after_end_frame=end_frame+rear_fade_count

	clip_rgba=ConvertToRGB32(clip)
	subtitle_bg=SUBTITLE_CLIP_BASE(clip_rgba,width=subtitle_clip_width,height=subtitle_clip_height)

	random_text="RANDOM_STRING_OUT_OF_FRAME_RANGE("+THREE_DOUBLE_QUOTE_STRING(text)+",current_frame,"+String(start_frame)+","+String(end_frame)+","+DOUBLE_QUOTE_STRING(random_char_func)+")"
	subtitle_rgba_containing_var=ScriptClip(subtitle_bg,"SUBTITLE_CLIP("+random_text+","+String(x)+","+String(y)+","+String(before_start_frame)+","+String(after_end_frame)+","+DOUBLE_QUOTE_STRING(font)+","+DOUBLE_QUOTE_STRING(effects)+","+String(size)+",SCALE_SUBTITLE_COLOR_ALPHA("+String(text_color)+",alpha_factor),SCALE_SUBTITLE_COLOR_ALPHA("+String(halo_color)+",alpha_factor),subtitle_ex="+OPTIONAL_ARG_TO_STRING(subtitle_ex)+")")
	subtitle_rgba=FrameEvaluate(subtitle_rgba_containing_var,"alpha_factor=Spline(current_frame,"+String(before_start_frame)+",0.0,"+String(start_frame)+",1.0,"+String(end_frame)+",1.0,"+String(after_end_frame)+",0.0,cubic=false)")
	subtitle_rgba=FrameEvaluate(subtitle_rgba,"PSEUDO_RANDOM_SEED(current_frame)")

	subtitle_rgba_slow_motion=SLOW_MOTION_TO_FPS(subtitle_rgba,10,true)

	return _SUBTITLE_FX_POST(clip_rgba,subtitle_rgba_slow_motion,before_start_frame,after_end_frame)
}
