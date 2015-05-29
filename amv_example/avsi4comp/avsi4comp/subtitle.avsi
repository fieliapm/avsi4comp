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

function _HEAVY_HALO_SUBTITLE(clip clip,string text,int offset_x,int offset_y,int halo_width,int "x",int "y",int "first_frame",int "last_frame",string "font",string "effects",int "size",int "text_color",int "halo_color",int "line_margin",int "spc"){
	return offset_y>halo_width \
		?clip \
		:_HEAVY_HALO_SUBTITLE( \
			SubtitleEx(clip,text,x+offset_x,y+offset_y,first_frame,last_frame,font,effects,size,text_color,halo_color,line_margin,spc), \
			text,offset_x<halo_width?offset_x+1:-halo_width,offset_x<halo_width?offset_y:offset_y+1,halo_width,x,y,first_frame,last_frame,font,effects,size,text_color,halo_color,line_margin,spc)
}

function HEAVY_HALO_SUBTITLE(clip clip,string text,int "halo_width",int "x",int "y",int "first_frame",int "last_frame",string "font",string "effects",int "size",int "halo_color",int "line_margin",int "spc"){
	halo_width=Default(halo_width,1)
	x=Default(x,Round(Width(clip)*(-0.11)))
	y=Default(y,Round(Height(clip)*(-0.17)))
	halo_color=Default(halo_color,color_black)

	max_alpha=Float($FF)
	halo_alpha=GET_SUBTITLE_COLOR_A(halo_color)
	halo_alpha=$FF-Round(Pow(Float($FF-halo_alpha)/max_alpha,1.0/Float((halo_width*2)+1))*max_alpha)

	text_color=OVERWRITE_SUBTITLE_COLOR_ALPHA(color_black,$0)
	halo_color=OVERWRITE_SUBTITLE_COLOR_ALPHA(halo_color,halo_alpha)

	return _HEAVY_HALO_SUBTITLE(clip,text,-halo_width,-halo_width,halo_width,x,y,first_frame,last_frame,font,effects,size,text_color,halo_color,line_margin,spc)
}

function SUBTITLE_WITH_HEAVY_HALO(clip clip,string text,int "halo_width",int "x",int "y",int "first_frame",int "last_frame",string "font",string "effects",int "size",int "text_color",int "halo_color",int "line_margin",int "spc"){
	halo_color=Default(halo_color,color_black)

	subtitle_text=SubtitleEx(clip,text,x,y,first_frame,last_frame,font,effects,size,text_color,OVERWRITE_SUBTITLE_COLOR_ALPHA(halo_color,$0),line_margin,spc)
	return HEAVY_HALO_SUBTITLE(subtitle_text,text,halo_width,x,y,first_frame,last_frame,font,effects,size,halo_color,line_margin,spc)
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

	# Subtitle()
	subtitle_mask_standard=Subtitle(subtitle_bg,text,x,y,first_frame,last_frame,font,size,text_mask_color,halo_mask_color,spc=spc,lsp=line_margin)
	subtitle_rgb_standard=Subtitle(subtitle_bg,text,x,y,first_frame,last_frame,font,size,text_rgb_color,halo_rgb_color,spc=spc,lsp=line_margin)

	# SubtitleEx()
	#subtitle_mask_ex=SubtitleEx(subtitle_bg,text,x,y,first_frame,last_frame,font,effects,size,text_mask_color,halo_mask_color,line_margin,spc)
	#subtitle_rgb_ex=SubtitleEx(subtitle_bg,text,x,y,first_frame,last_frame,font,effects,size,text_rgb_color,halo_rgb_color,line_margin,spc)
	subtitle_mask_ex=SUBTITLE_WITH_HEAVY_HALO(subtitle_bg,text,subtitle_clip_halo_width,x,y,first_frame,last_frame,font,effects,size,text_mask_color,halo_mask_color,line_margin,spc)
	subtitle_rgb_ex=SUBTITLE_WITH_HEAVY_HALO(subtitle_bg,text,subtitle_clip_halo_width,x,y,first_frame,last_frame,font,effects,size,text_rgb_color,halo_rgb_color,line_margin,spc)

	subtitle_mask=subtitle_ex?subtitle_mask_ex:subtitle_mask_standard
	subtitle_rgb=subtitle_ex?subtitle_rgb_ex:subtitle_rgb_standard

	return Mask(subtitle_rgb,Greyscale(subtitle_mask))
}

######## Subtitle FX ########

global subtitle_clip_width=856
global subtitle_clip_height=480



function _SUBTITLE_NORMAL(clip clip,string text,int "x",int "y",int "first_frame",int "last_frame",string "font",string "effects",int "size",int "text_color",int "halo_color",bool "subtitle_ex"){
	subtitle_bg=SUBTITLE_CLIP_BASE(clip,width=subtitle_clip_width,height=subtitle_clip_height)
	subtitle_rgba=SUBTITLE_CLIP(subtitle_bg,text,x,y,first_frame,last_frame,font,effects,size,text_color,halo_color,subtitle_ex=subtitle_ex)
	subtitle_rgba_resized=RESIZE_TO_REF_CLIP(subtitle_rgba,clip)
	return Layer(clip,subtitle_rgba_resized,"Add")
}

function SUBTITLE_ZOOM(clip clip,string text,int "x",int "y",int "first_frame",int "last_frame",string "font",string "effects",int "size",int "text_color",int "halo_color",bool "subtitle_ex",float "srcx",float "srcy",float "dstx",float "dsty",float "factorX",float "factorY",float "factor"){
	subtitle_bg=SUBTITLE_CLIP_BASE(clip,width=subtitle_clip_width,height=subtitle_clip_height)
	subtitle_rgba=SUBTITLE_CLIP(subtitle_bg,text,x,y,first_frame,last_frame,font,effects,size,text_color,halo_color,subtitle_ex=subtitle_ex)
	subtitle_rgba_zoomed=FAST_ZOOM(subtitle_rgba,srcx,srcy,dstx,dsty,factorX,factorY,factor)
	subtitle_rgba_resized=RESIZE_TO_REF_CLIP(subtitle_rgba_zoomed,clip)
	return Layer(clip,subtitle_rgba_resized,"Add")
}

function SUBTITLE_PULL(clip clip,string text,int "x",int "y",int "first_frame",int "last_frame",string "font",string "effects",int "size",int "text_color",int "halo_color",bool "subtitle_ex",float "pull_ratio_x",float "pull_ratio_y"){
	subtitle_bg=SUBTITLE_CLIP_BASE(clip,width=subtitle_clip_width,height=subtitle_clip_height)
	subtitle_rgba=SUBTITLE_CLIP(subtitle_bg,text,x,y,first_frame,last_frame,font,effects,size,text_color,halo_color,subtitle_ex=subtitle_ex)
	subtitle_rgba_pulled=PULL_IN_OUT(subtitle_rgba,pull_ratio_x,pull_ratio_y)
	subtitle_rgba_resized=RESIZE_TO_REF_CLIP(subtitle_rgba_pulled,clip)
	return Layer(clip,subtitle_rgba_resized,"Add")
}



function SUBTITLE_NORMAL(clip clip,string text,int "x",int "y",int "first_frame",int "last_frame",string "font",string "effects",int "size",int "text_color",int "halo_color",bool "subtitle_ex"){
	first_frame=Default(first_frame,0)
	last_frame=Default(last_frame,Framecount(clip)-1)

	clip_rgba=ConvertToRGB32(clip)
	clip_with_subtitle=_SUBTITLE_NORMAL(clip_rgba,text,x,y,first_frame,last_frame,font,effects,size,text_color,halo_color,subtitle_ex)
	return OVERWRITE_RANGE(clip_rgba,clip_with_subtitle,first_frame,last_frame)
}

function SUBTITLE_FX_SMOOTH_BLINK(clip clip,string text,int "x",int "y",int "first_frame",int "last_frame",string "font",string "effects",int "size",int "text_color",int "halo_color",bool "subtitle_ex",float "blink_interval",float "min_opacity",float "max_opacity"){
	text_color=Default(text_color,color_white)
	halo_color=Default(halo_color,color_black)
	first_frame=Default(first_frame,0)
	last_frame=Default(last_frame,Framecount(clip)-1)
	blink_interval=Default(blink_interval,Framerate(clip))
	min_opacity=Default(min_opacity,0.0)
	max_opacity=Default(max_opacity,1.0)

	clip_rgba=ConvertToRGB32(clip)
	clip_containing_var=ScriptClip(clip_rgba,"_SUBTITLE_NORMAL("+THREE_DOUBLE_QUOTE_STRING(text)+","+OPTIONAL_ARG_TO_STRING(x)+","+OPTIONAL_ARG_TO_STRING(y)+","+OPTIONAL_ARG_TO_STRING(first_frame)+","+OPTIONAL_ARG_TO_STRING(last_frame)+","+OPTIONAL_STRING_ARG(font)+","+OPTIONAL_STRING_ARG(effects)+","+OPTIONAL_ARG_TO_STRING(size)+",SCALE_SUBTITLE_COLOR_ALPHA("+OPTIONAL_ARG_TO_STRING(text_color)+",alpha_factor),SCALE_SUBTITLE_COLOR_ALPHA("+OPTIONAL_ARG_TO_STRING(halo_color)+",alpha_factor),"+OPTIONAL_ARG_TO_STRING(subtitle_ex)+")")
	clip_with_subtitle=FrameEvaluate(clip_containing_var,"alpha_factor=Spline(-Cos((current_frame-("+OPTIONAL_ARG_TO_STRING(first_frame)+"))*Pi()*2.0/("+OPTIONAL_ARG_TO_STRING(blink_interval)+")),-1.0,"+OPTIONAL_ARG_TO_STRING(min_opacity)+",1.0,"+OPTIONAL_ARG_TO_STRING(max_opacity)+",cubic=false)")
	return OVERWRITE_RANGE(clip_rgba,clip_with_subtitle,first_frame,last_frame)
}

function SUBTITLE_FX_FADE_IN_FADE_OUT(clip clip,string text,int x,int y,int start_frame,int end_frame,int front_fade_count,int rear_fade_count,string font,string effects,int size,int text_color,int halo_color,bool "subtitle_ex"){
	before_start_frame=start_frame-front_fade_count
	after_end_frame=end_frame+rear_fade_count

	clip_rgba=ConvertToRGB32(clip)
	clip_containing_var=ScriptClip(clip_rgba,"_SUBTITLE_NORMAL("+THREE_DOUBLE_QUOTE_STRING(text)+","+String(x)+","+String(y)+","+String(before_start_frame)+","+String(after_end_frame)+","+DOUBLE_QUOTE_STRING(font)+","+DOUBLE_QUOTE_STRING(effects)+","+String(size)+",SCALE_SUBTITLE_COLOR_ALPHA("+String(text_color)+",alpha_factor),SCALE_SUBTITLE_COLOR_ALPHA("+String(halo_color)+",alpha_factor),"+OPTIONAL_ARG_TO_STRING(subtitle_ex)+")")
	clip_with_subtitle=FrameEvaluate(clip_containing_var,"alpha_factor=Spline(current_frame,"+String(before_start_frame)+",0.0,"+String(start_frame)+",1.0,"+String(end_frame)+",1.0,"+String(after_end_frame)+",0.0,cubic=false)")
	return OVERWRITE_RANGE(clip_rgba,clip_with_subtitle,before_start_frame,after_end_frame)
}

function SUBTITLE_FX_OFFSET_FADE_IN_FADE_OUT(clip clip,string text,int x,int y,int start_frame,int end_frame,int front_fade_count,int rear_fade_count,string font,string effects,int size,int text_color,int halo_color,bool "subtitle_ex",float "appear_offset"){
	appear_offset=Default(appear_offset,size*2.0)

	before_start_frame=start_frame-front_fade_count
	after_end_frame=end_frame+rear_fade_count

	clip_rgba=ConvertToRGB32(clip)
	clip_containing_var=ScriptClip(clip_rgba,"SUBTITLE_ZOOM("+THREE_DOUBLE_QUOTE_STRING(text)+","+String(x)+","+String(y)+","+String(before_start_frame)+","+String(after_end_frame)+","+DOUBLE_QUOTE_STRING(font)+","+DOUBLE_QUOTE_STRING(effects)+","+String(size)+",SCALE_SUBTITLE_COLOR_ALPHA("+String(text_color)+",alpha_factor),SCALE_SUBTITLE_COLOR_ALPHA("+String(halo_color)+",alpha_factor),"+OPTIONAL_ARG_TO_STRING(subtitle_ex)+",srcx=0,dstx=dstx)")
	clip_containing_var=FrameEvaluate(clip_containing_var,"dstx=Spline(current_frame,"+String(start_frame)+",0.0,"+String(end_frame)+","+String(appear_offset)+")")
	clip_with_subtitle=FrameEvaluate(clip_containing_var,"alpha_factor=Spline(current_frame,"+String(before_start_frame)+",0.0,"+String(start_frame)+",1.0,"+String(end_frame)+",1.0,"+String(after_end_frame)+",0.0,cubic=false)")
	return OVERWRITE_RANGE(clip_rgba,clip_with_subtitle,before_start_frame,after_end_frame)
}

function SUBTITLE_FX_FLY_IN_FLY_OUT(clip clip,string text,int x,int y,int start_frame,int end_frame,int front_fade_count,int rear_fade_count,string "font",string "effects",int "size",int "text_color",int "halo_color",bool "subtitle_ex"){
	before_start_frame=start_frame-front_fade_count
	after_end_frame=end_frame+rear_fade_count

	clip_rgba=ConvertToRGB32(clip)
	clip_containing_var=ScriptClip(clip_rgba,"SUBTITLE_ZOOM("+THREE_DOUBLE_QUOTE_STRING(text)+","+String(x)+","+String(y)+","+String(before_start_frame)+","+String(after_end_frame)+","+OPTIONAL_STRING_ARG(font)+","+OPTIONAL_STRING_ARG(effects)+","+OPTIONAL_ARG_TO_STRING(size)+","+OPTIONAL_ARG_TO_STRING(text_color)+","+OPTIONAL_ARG_TO_STRING(halo_color)+","+OPTIONAL_ARG_TO_STRING(subtitle_ex)+",srcx=0,dstx=dstx)")
	clip_with_subtitle=FrameEvaluate(clip_containing_var,"dstx=subtitle_clip_width*Pow(Spline(current_frame,"+String(before_start_frame)+",1.0,"+String(start_frame)+",0.0,"+String(end_frame)+",0.0,"+String(after_end_frame)+",-1.0,cubic=false),3.0)")
	return OVERWRITE_RANGE(clip_rgba,clip_with_subtitle,before_start_frame,after_end_frame)
}

function SUBTITLE_FX_PULL_IN_PULL_OUT(clip clip,string text,int x,int y,int start_frame,int end_frame,int front_fade_count,int rear_fade_count,string "font",string "effects",int "size",int "text_color",int "halo_color",bool "subtitle_ex"){
	before_start_frame=start_frame-front_fade_count
	after_end_frame=end_frame+rear_fade_count

	clip_rgba=ConvertToRGB32(clip)
	clip_containing_var=ScriptClip(clip_rgba,"SUBTITLE_PULL("+THREE_DOUBLE_QUOTE_STRING(text)+","+String(x)+","+String(y)+","+String(before_start_frame)+","+String(after_end_frame)+","+OPTIONAL_STRING_ARG(font)+","+OPTIONAL_STRING_ARG(effects)+","+OPTIONAL_ARG_TO_STRING(size)+","+OPTIONAL_ARG_TO_STRING(text_color)+","+OPTIONAL_ARG_TO_STRING(halo_color)+","+OPTIONAL_ARG_TO_STRING(subtitle_ex)+",pull_ratio_x=pull_ratio_x)")
	clip_with_subtitle=FrameEvaluate(clip_containing_var,"pull_ratio_x=Spline(current_frame,"+String(before_start_frame)+",-1.0,"+String(start_frame)+",0.0,"+String(end_frame)+",0.0,"+String(after_end_frame)+",1.0,cubic=false)")
	return OVERWRITE_RANGE(clip_rgba,clip_with_subtitle,before_start_frame,after_end_frame)
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
	subtitle_rgba_resized=RESIZE_TO_REF_CLIP(subtitle_rgba_slow_motion,clip)
	clip_with_subtitle=Layer(clip_rgba,subtitle_rgba_resized,"Add")
	return OVERWRITE_RANGE(clip_rgba,clip_with_subtitle,before_start_frame,after_end_frame)
}



# deprecated implementation

function _SUBTITLE_FX_CLIP_SLIDE_IN_WATER_OUT(clip clip,string text,int x,int y,int start_frame,int end_frame,int front_fade_count,int rear_fade_count,string font,string effects,int size,int text_color,int halo_color,bool "subtitle_ex",float "appear_offset"){
	before_start_frame=start_frame-front_fade_count
	after_end_frame=end_frame+rear_fade_count

	appear_offset=Default(appear_offset,size*1.5)

	command_part01_topleft_x="Round("+String(x)+"-LINEAR(1.0-_var1,0,"+String(appear_offset)+")+LINEAR(_var2,0,"+String(appear_offset)+"))"
	command_part01_topleft_y="Round("+String(y)+"-LINEAR(1.0-_var1,0,"+String(appear_offset)+"))"
	command_part01_first_frame=String(before_start_frame)
	command_part01_last_frame=String(after_end_frame)
	command_part01_size="Round("+String(size)+")"

	clear_text_color=OVERWRITE_COLOR_ALPHA(text_color,$FF)
	clear_halo_color=OVERWRITE_COLOR_ALPHA(halo_color,$FF)

	command_part01="SUBTITLE_CLIP("+THREE_DOUBLE_QUOTE_STRING(text)+","+command_part01_topleft_x+","+command_part01_topleft_y+","+command_part01_first_frame+","+command_part01_last_frame+","+DOUBLE_QUOTE_STRING(font)+","+DOUBLE_QUOTE_STRING(effects)+","+command_part01_size+","
	command_part02="text_color=COLOR_RGB_LINEAR(_var1-_var2,"+String(clear_text_color)+","+String(text_color)+"),"
	command_part03="halo_color=COLOR_RGB_LINEAR(_var1-_var2,"+String(clear_halo_color)+","+String(halo_color)+"),"
	command_part04="subtitle_ex="+OPTIONAL_ARG_TO_STRING(subtitle_ex)+")"

	subtitle_bg=SUBTITLE_CLIP_BASE(clip,width=subtitle_clip_width,height=subtitle_clip_height)

	subtitle_rgba_containing_var1_var2=ScriptClip(subtitle_bg,command_part01+command_part02+command_part03+command_part04)
	subtitle_rgba_containing_var1=EVALUATE_VAR(subtitle_rgba_containing_var1_var2,"_var2",end_frame,after_end_frame)
	subtitle_rgba=EVALUATE_VAR(subtitle_rgba_containing_var1,"_var1",before_start_frame,start_frame)

	subtitle_rgba_with_fx=EffectWater(subtitle_rgba,end_frame,after_end_frame,amp=1,eamp=100)
	return RESIZE_TO_REF_CLIP(subtitle_rgba_with_fx,clip)
}

function SUBTITLE_FX_SLIDE_IN_WATER_OUT(clip clip,string text,int x,int y,int start_frame,int end_frame,int front_fade_count,int rear_fade_count,string font,string effects,int size,int text_color,int halo_color,bool "subtitle_ex",float "appear_offset"){
	before_start_frame=start_frame-front_fade_count
	after_end_frame=end_frame+rear_fade_count

	subtitle_rgba=_SUBTITLE_FX_CLIP_SLIDE_IN_WATER_OUT(clip,text,x,y,start_frame,end_frame,front_fade_count,rear_fade_count,font,effects,size,text_color,halo_color,subtitle_ex,appear_offset)

	return ApplyRange(ConvertToRGB32(clip),before_start_frame,after_end_frame,"Layer",subtitle_rgba,"Add")
}
