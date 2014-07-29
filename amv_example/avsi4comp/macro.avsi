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



#SetMemoryMax(64)

#Import("FFMS2.avsi")
#LoadPlugin("DGDecode.dll")
#LoadPlugin("zoom.dll")
#LoadPlugin("EffectsMany.dll")
#LoadPlugin("SubtitleEx.dll")

######## General ########

function UNDEFINED_(val "dummyArg"){
    Assert(!Defined(dummyArg),"UNDEFINED_(): cannot be called with any arguments.")
    return dummyArg
}

function MIN_(val a,val b){
	return (a<b)?a:b
}

function MAX_(val a,val b){
	return (a>b)?a:b
}

function CLAMP(val x,val low,val high){
	return MAX_(MIN_(x,high),low)
}

function EUCLIDEAN_MOD(int a,int b){
	return ((a%b)+b)%b
}

function ROUND_BS(val x,val n){
	return Round(x/n)*n
}

function CEIL_BS(val x,val n){
	return Ceil(x/n)*n
}

######## Random ########

global _next_pseudo_random_number=0

function PSEUDO_RANDOM_SEED(int seed){
	global _next_pseudo_random_number=seed
}

function PSEUDO_RANDOM(int "max"){
	#global _next_pseudo_random_number=(_next_pseudo_random_number*1664525)+1013904223
	next=(_next_pseudo_random_number*1103515245)+12345
	global _next_pseudo_random_number=next<0?next+$80000000:next # next mod pow(2,31), when next is signed int

	return Defined(max)?_next_pseudo_random_number%max:_next_pseudo_random_number
}

######## Array ########

global __ARRAY_DLM=","

function _ARRAY_FIRST_DELIMITER_LOCATION(string array){
	match=FindStr(array,__ARRAY_DLM)
	match=match>0?match:StrLen(array)+1
	return match
}

function _ARRAY_DELIMITER_LENGTH(){
	return StrLen(__ARRAY_DLM)
}

function ARRAY_FIRST(string array){
	match=_ARRAY_FIRST_DELIMITER_LOCATION(array)
	return Eval(LeftStr(array,match-1))
}

function ARRAY_REST(string array){
	match=_ARRAY_FIRST_DELIMITER_LOCATION(array)
	return MidStr(array,match+_ARRAY_DELIMITER_LENGTH())
}

function ARRAY_LEN(string array){
	return StrLen(array)>0?1+ARRAY_LEN(ARRAY_REST(array)):0
}

function ARRAY_FILL(val base,int count){
	element=String(base)
	return element+(count>1?__ARRAY_DLM+ARRAY_FILL(base,count-1):"")
}

######## Variant ########

function _LINEAR_VAR(float x,float start,float end){
	f_x=Float(x)
	f_start=Float(start)
	f_end=Float(end)
	return (f_x-f_start)/(f_end-f_start)
}

function LINEAR(float x,float start,float end){
	f_x=Float(x)
	f_start=Float(start)
	f_end=Float(end)
	return (f_end-f_start)*f_x+f_start
}

function EVALUATE_VAR(clip clip,string var,int zero_val_frame,int one_val_frame,bool "after_frame"){
	return FrameEvaluate(clip,var+"=CLAMP(_LINEAR_VAR(current_frame,"+String(zero_val_frame)+","+String(one_val_frame)+"),0.0,1.0)",after_frame=after_frame)
}

######## Apply Range ########

function OVERWRITE_RANGE(clip clip,clip new_clip,int start_frame,int end_frame){
	clip_conditional_half=ConditionalFilter(clip,clip,new_clip,"current_frame","<",String(start_frame))
	return ConditionalFilter(clip,clip,clip_conditional_half,"current_frame",">",String(end_frame))
}

function APPLY_RANGE(clip clip,int start_frame,int end_frame,string func){
	clip_filtered=ScriptClip(clip,func)
	return OVERWRITE_RANGE(clip,clip_filtered,start_frame,end_frame)
}

######## Color Component ########

function GET_COLOR_A(int color){
	divisor=$1000000
	alpha=color/divisor
	flag=(EUCLIDEAN_MOD(color,divisor)!=0)?1:0
	return color<0?$100+alpha-flag:alpha
}

function GET_COLOR_R(int color){
	return EUCLIDEAN_MOD(color,$1000000)/$10000
}

function GET_COLOR_G(int color){
	return EUCLIDEAN_MOD(color,$10000)/$100
}

function GET_COLOR_B(int color){
	return EUCLIDEAN_MOD(color,$100)
}

function CONVERT_BETWEEN_NORMAL_AND_SUBTITLE_COLOR_A(int a){
	return $FF-a
}

function GET_SUBTITLE_COLOR_A(int color){
	return CONVERT_BETWEEN_NORMAL_AND_SUBTITLE_COLOR_A(GET_COLOR_A(color))
}

function ASSIGN_COLOR_RGB(int r,int g,int b,int "a"){
	a=Default(a,$0)

	a_clamp=CLAMP(Int(a),$0,$FF)
	r_clamp=CLAMP(Int(r),$0,$FF)
	g_clamp=CLAMP(Int(g),$0,$FF)
	b_clamp=CLAMP(Int(b),$0,$FF)

	return (((((a_clamp*$100)+r_clamp)*$100)+g_clamp)*$100)+b_clamp
}

function OVERWRITE_COLOR_ALPHA_SLOW(int rgb,int "a"){
	return ASSIGN_COLOR_RGB(GET_COLOR_R(rgb),GET_COLOR_G(rgb),GET_COLOR_B(rgb),a)
}

function OVERWRITE_COLOR_ALPHA(int rgb,int "a"){
	a=Default(a,$0)

	divisor=$1000000
	a_clamp=CLAMP(Int(a),$0,$FF)
	rgb_clamp=EUCLIDEAN_MOD(rgb,divisor)
	return (a_clamp*divisor)+rgb_clamp
}

function OVERWRITE_SUBTITLE_COLOR_ALPHA(int rgb,int a){
	return OVERWRITE_COLOR_ALPHA(rgb,CONVERT_BETWEEN_NORMAL_AND_SUBTITLE_COLOR_A(a))
}

function SCALE_COLOR_ALPHA(int color,float factor){
	a=GET_COLOR_A(color)
	a_scaled=Round(Float(a)*factor)
	return OVERWRITE_COLOR_ALPHA(color,a_scaled)
}

function SCALE_SUBTITLE_COLOR_ALPHA(int color,float factor){
	a=GET_SUBTITLE_COLOR_A(color)
	a_scaled=Round(Float(a)*factor)
	return OVERWRITE_SUBTITLE_COLOR_ALPHA(color,a_scaled)
}

function COLOR_RGB_LINEAR(float x,int color1,int color2){
	color1_r=GET_COLOR_R(color1)
	color1_g=GET_COLOR_G(color1)
	color1_b=GET_COLOR_B(color1)
	color1_a=GET_COLOR_A(color1)

	color2_r=GET_COLOR_R(color2)
	color2_g=GET_COLOR_G(color2)
	color2_b=GET_COLOR_B(color2)
	color2_a=GET_COLOR_A(color2)

	return ASSIGN_COLOR_RGB(Round(LINEAR(x,color1_r,color2_r)),Round(LINEAR(x,color1_g,color2_g)),Round(LINEAR(x,color1_b,color2_b)),Round(LINEAR(x,color1_a,color2_a)))
}

######## String ########

function DOUBLE_QUOTE(){
	return Chr(34)
}

function DOUBLE_QUOTE_STRING(string str){
	return DOUBLE_QUOTE()+str+DOUBLE_QUOTE()
}

function THREE_DOUBLE_QUOTE_STRING(string str){
	return DOUBLE_QUOTE()+DOUBLE_QUOTE()+DOUBLE_QUOTE()+str+DOUBLE_QUOTE()+DOUBLE_QUOTE()+DOUBLE_QUOTE()
}

function OPTIONAL_ARG_TO_STRING(val "value"){
	return Defined(value)?String(value):"UNDEFINED_()"
}

function OPTIONAL_STRING_ARG(string "str"){
	return Defined(str)?DOUBLE_QUOTE_STRING(str):"UNDEFINED_()"
}

function RANDOM_STRING(string ref_string,string random_char_func){
	length=StrLen(ref_string)
	ref_char=LeftStr(ref_string,1)
	return length>0?(ref_char=="|"?ref_char:Apply(random_char_func))+RANDOM_STRING(RightStr(ref_string,length-1),random_char_func):""
}

function RANDOM_STRING_OUT_OF_FRAME_RANGE(string text,int current_frame,int start_frame,int end_frame,string random_char_func){
	return (current_frame<start_frame||current_frame>end_frame)?RANDOM_STRING(text,random_char_func):text
}

######## Audio ########

function AUDIO_DUB_TONE(clip clip,int "frequency",int "samplerate",int "channels",string "type",float "level"){
	tone=Tone(length=Float(Framecount(clip))/Float(Framerate(clip)),frequency=frequency,samplerate=samplerate,channels=channels,type=type,level=level)
	return AudioDub(clip,tone)
}

######## Color Channel ########

function SHOW_CHROMA(clip clip){
	return YToUV(UToY(clip),VToY(clip))
}

######## Trim ########

function TRIM_FIRST_CLIP(clip clip,int length){
	return Trim(clip,0,-length)
}

function TRIM_MIDDLE_CLIP(clip clip,int length){
	return Trim(clip,(Framecount(clip)-length)/2,-length)
}

function TRIM_LAST_CLIP(clip clip,int length){
	return Trim(clip,Framecount(clip)-length,0)
}

function LOOP_STILL_FRAME(clip clip,int loop_count){
	Assert(Framecount(clip)==1,"must be still frame")
	return Loop(clip,loop_count,0,0)
}

function STILL_FRAME(clip clip,int frame_index,int loop_count){
	return LOOP_STILL_FRAME(Trim(clip,frame_index,-1),loop_count)
}

function STILL_FIRST_FRAME(clip clip,int loop_count){
	return LOOP_STILL_FRAME(TRIM_FIRST_CLIP(clip,1),loop_count)
}

function STILL_MIDDLE_FRAME(clip clip,int loop_count){
	return LOOP_STILL_FRAME(TRIM_MIDDLE_CLIP(clip,1),loop_count)
}

function STILL_LAST_FRAME(clip clip,int loop_count){
	return LOOP_STILL_FRAME(TRIM_LAST_CLIP(clip,1),loop_count)
}

function EXTEND_ANIMATION_CG(clip cg,int frame_count){
	cg_frame_count=Framecount(cg)
	return TRIM_FIRST_CLIP(Loop(cg,CEIL_BS(Float(frame_count),cg_frame_count)),frame_count)
}

function _ANIMATION_CG_VARY(string animation_cg_set,int dissolve_length,string cg_length_array){
	first_animation_cg_vary=EXTEND_ANIMATION_CG(ARRAY_FIRST(animation_cg_set),ARRAY_FIRST(cg_length_array)+dissolve_length)
	return ARRAY_LEN(animation_cg_set)>1?Dissolve(first_animation_cg_vary,_ANIMATION_CG_VARY(ARRAY_REST(animation_cg_set),dissolve_length,ARRAY_REST(cg_length_array)),dissolve_length):first_animation_cg_vary
}

function ANIMATION_CG_VARY(string animation_cg_set,int dissolve_length,string cg_length_array,bool "strip"){
	strip=Default(strip,true)

	animation_cg_vary_result=_ANIMATION_CG_VARY(animation_cg_set,dissolve_length,cg_length_array)
	return strip?Trim(animation_cg_vary_result,dissolve_length/2,dissolve_length-Framecount(animation_cg_vary_result)):animation_cg_vary_result
}

######## Field Based Processing ########

function PROGRESSIVE_TO_INTERLACE(clip clip){
	return SelectEvery(DoubleWeave(ComplementParity(clip)),4,1)
}

######## FPS ########

function CONVERT_24P_TO_60P_PATTERN_AAIBB(clip clip){
	clip_even=SelectEven(clip)
	clip_odd=SelectOdd(clip)
	clip_even_last_frame=TRIM_LAST_CLIP(clip_even,1)
	clip_interpolation=Merge(clip_even,clip_odd+clip_even_last_frame,0.5)
	return Interleave(clip_even,clip_even,clip_interpolation,clip_odd,clip_odd)
}

function ASSUME_FPS_SYNC_AUDIO(clip clip,int numerator,int "denominator"){
	return AssumeFPS(clip,numerator,denominator,sync_audio=true)
}

function ASSUME_SCALED_FPS_SYNC_AUDIO(clip clip,int "multiplier",int "divisor"){
	return AssumeScaledFPS(clip,multiplier,divisor,sync_audio=true)
}

function ASSUME_30P(clip clip){
	return ASSUME_FPS_SYNC_AUDIO(clip,30,1)
}

function ASSUME_29_97P(clip clip){
	return ASSUME_FPS_SYNC_AUDIO(clip,30000,1001)
}

function ASSUME_25P(clip clip){
	return ASSUME_FPS_SYNC_AUDIO(clip,25,1)
}

function ASSUME_24P(clip clip){
	return ASSUME_FPS_SYNC_AUDIO(clip,24,1)
}

function ASSUME_23_976P(clip clip){
	return ASSUME_FPS_SYNC_AUDIO(clip,24000,1001)
}

######## Speed ########

function CONVERT_FPS_AUTO_HQ(clip,fps){
	return (Framerate(clip)/fps<=3.0/2.0)?ConvertFPS(clip,fps):ChangeFPS(clip,fps)
}

function CLIP_SPEED(clip clip,float speed,bool smooth){
	frame_rate=Framerate(clip)
	speeded_clip=AssumeFPS(clip,frame_rate*speed)
	return Apply(smooth?"CONVERT_FPS_AUTO_HQ":"ChangeFPS",speeded_clip,frame_rate)
}

function SLOW_MOTION_TO_FPS(clip clip,float fps,bool smooth){
	clip_slowed_down=ChangeFPS(clip,fps)
	return Apply(smooth?"CONVERT_FPS_AUTO_HQ":"ChangeFPS",clip_slowed_down,Framerate(clip))
}

function SLOW_MOTION_BY_DIVISOR(clip clip,int fps_divisor,bool smooth){
	return SLOW_MOTION_TO_FPS(clip,Framerate(clip)/fps_divisor,smooth)
}

######## Fade ########

function BRIGHTNESS_OFFSET(clip clip,float offset){
	offset_level=Round(offset*255.0)
	return Levels(clip,0,1.0,255,offset_level,offset_level+255,coring=false)
}

function FADE_WITH_BRIGHTNESS_OFFSET(clip clip,int start_frame,int end_frame,bool is_fade_out){
	zero_val_frame=is_fade_out?start_frame:end_frame
	one_val_frame=is_fade_out?end_frame:start_frame
	clip_faded_containing_var=ScriptClip(clip,"BRIGHTNESS_OFFSET(_var)")
	clip_faded=EVALUATE_VAR(clip_faded_containing_var,"_var",zero_val_frame,one_val_frame)
	return OVERWRITE_RANGE(clip,clip_faded,start_frame,end_frame)
}

function FADE_IN_WITH_BRIGHTNESS_OFFSET(clip clip,int num_frames){
	return FADE_WITH_BRIGHTNESS_OFFSET(clip,0,num_frames-1,false)
}

function FADE_OUT_WITH_BRIGHTNESS_OFFSET(clip clip,int num_frames){
	return FADE_WITH_BRIGHTNESS_OFFSET(clip,Framecount(clip)-num_frames,Framecount(clip)-1,true)
}

function DOUBLE_FADE_WITH_BRIGHTNESS_OFFSET(clip clip1,clip clip2,int num_frames_before,int num_frames_after){
	return FADE_OUT_WITH_BRIGHTNESS_OFFSET(clip1,num_frames_before)+FADE_IN_WITH_BRIGHTNESS_OFFSET(clip2,num_frames_after)
}

function FADE_IN_WITH_BRIGHTNESS_OFFSET_RGB24(clip clip,int num_frames){
	return ConvertToYV12(FADE_IN_WITH_BRIGHTNESS_OFFSET(ConvertToRGB24(clip),num_frames))
}

function FADE_OUT_WITH_BRIGHTNESS_OFFSET_RGB24(clip clip,int num_frames){
	return ConvertToYV12(FADE_OUT_WITH_BRIGHTNESS_OFFSET(ConvertToRGB24(clip),num_frames))
}

function DOUBLE_FADE_WITH_BRIGHTNESS_OFFSET_RGB24(clip clip1,clip clip2,int num_frames_before,int num_frames_after){
	return ConvertToYV12(DOUBLE_FADE_WITH_BRIGHTNESS_OFFSET(ConvertToRGB24(clip1),ConvertToRGB24(clip2),num_frames_before,num_frames_after))
}

function DOUBLE_FADE(clip clip1,clip clip2,int num_frames_before,int num_frames_after,int color){
	return FadeOut(clip1,num_frames_before,color)+FadeIn0(clip2,num_frames_after,color)
}

######## Transform & Resize ########

function RESIZE_TO_REF_CLIP(clip clip,clip ref_clip){
	w=Width(ref_clip)
	h=Height(ref_clip)
	return Lanczos4Resize(clip,w,h)
}

function FAST_ZOOM(clip clip,float "srcx",float "srcy",float "dstx",float "dsty",float "factorX",float "factorY",float "factor",int "width",int "height",string "resize_func",bool "extend"){
	border_size=4
	clip_width=Width(clip)
	clip_height=Height(clip)

	srcx=Default(srcx,Float(clip_width)*0.5)
	srcy=Default(srcy,Float(clip_height)*0.5)
	target_width=Default(width,clip_width)
	target_height=Default(height,clip_height)
	dstx=Default(dstx,Float(target_width)*0.5)
	dsty=Default(dsty,Float(target_height)*0.5)
	factorX=Default(factor,Default(factorX,1.0))
	factorY=Default(factor,Default(factorY,1.0))
	resize_func=Default(resize_func,"Lanczos4Resize")
	extend=Default(extend,false)

	Assert(factorX>0.0,"FAST_ZOOM(): factorX is not greater than 0.0")
	Assert(factorY>0.0,"FAST_ZOOM(): factorY is not greater than 0.0")

	border_size_x=extend?0:Ceil(Float(border_size)/factorX)
	border_size_y=extend?0:Ceil(Float(border_size)/factorY)

	clip_with_border=AddBorders(clip,border_size_x,border_size_y,border_size_x,border_size_y)
	src_left=(srcx+border_size_x)-(dstx/factorX) # source_px=((target_px-dstx)/factorX)+(srcx+border_size_x)
	src_top=(srcy+border_size_y)-(dsty/factorY) # source_py=((target_py-dsty)/factorY)+(srcy+border_size_y)
	src_width=Float(target_width)/factorX
	src_height=Float(target_height)/factorY
	return Eval(resize_func+"(clip_with_border,target_width,target_height,src_left=src_left,src_top=src_top,src_width=src_width,src_height=src_height)")
}

global _transform_overlay_clip_count=0
function TRANSFORM(clip base_clip,clip overlay_clip,string "srcx",string "srcy",string "dstx",string "dsty",string "factorX",string "factorY",string "factor",string "angle",bool "show",string "opacity"){
	opacity=Default(opacity,"1.0")

	base_clip_rgb32=ConvertToRGB32(base_clip)
	base_clip_rgb32_width=Width(base_clip_rgb32)
	base_clip_rgb32_height=Height(base_clip_rgb32)
	overlay_clip_rgb32=ConvertToRGB32(overlay_clip)
	global_clip_name="_transform_overlay_clip_zoomed_"+String(_transform_overlay_clip_count)
	global _transform_overlay_clip_count=_transform_overlay_clip_count+1
	Eval("global "+global_clip_name+"=Zoom(overlay_clip_rgb32,srcx,srcy,dstx,dsty,factorX,factorY,factor,angle,base_clip_rgb32_width,base_clip_rgb32_height,show)")
	result_clip_containing_var=ScriptClip(base_clip_rgb32,"Layer("+global_clip_name+","+DOUBLE_QUOTE_STRING("Add")+",level=Round(256.0*("+opacity+")))")
	return FrameEvaluate(result_clip_containing_var,"global n=current_frame")
}



# deprecated

function RESCALE(clip clip,float scale_x,float scale_y){
	return Lanczos4Resize(clip,ROUND_BS(Float(Width(clip))*scale_x,4),ROUND_BS(Float(Height(clip))*scale_y,4))
}

# deprecated

function LINEAR_MOVE(clip clip,string overlay_clip,string mode,int start_frame,int end_frame,float start_x,float start_y,float start_opacity,float end_x,float end_y,float end_opacity,bool "extend",bool "overwrite"){
	extend=Default(extend,false)
	overwrite=Default(overwrite,false)

	overlay_clip_extend=((extend==true)?"BlankClip("+overlay_clip+",length="+String(start_frame)+",color=color_white)+":"")+overlay_clip

	result_clip_containing_var=ScriptClip(clip,"Overlay("+overlay_clip_extend+",x=Round(LINEAR(_var,"+String(start_x)+","+String(end_x)+")),y=Round(LINEAR(_var,"+String(start_y)+","+String(end_y)+")),opacity=LINEAR(_var,"+String(start_opacity)+","+String(end_opacity)+"),mode="+DOUBLE_QUOTE_STRING(mode)+")")
	result_clip=EVALUATE_VAR(result_clip_containing_var,"_var",start_frame,end_frame)

	return (overwrite==true)?OVERWRITE_RANGE(clip,result_clip,start_frame,end_frame):result_clip
}

######## Filter ########

function MOSAIC_ALL(clip clip,float mosaic_factor){
	clip_resized=FAST_ZOOM(clip,factor=1.0/mosaic_factor,resize_func="BilinearResize",extend=true)
	return FAST_ZOOM(clip_resized,factor=mosaic_factor,resize_func="PointResize",extend=true)
}

function MOSAIC_MASK(clip clip,clip mask,float mosaic_factor){
	clip_mosaic=MOSAIC_ALL(clip,mosaic_factor)
	return Overlay(clip,clip_mosaic,mask=mask,mode="Blend")
}

function PULL_IN_OUT(clip clip,float "pull_ratio_x",float "pull_ratio_y"){
	pull_ratio_x=Default(pull_ratio_x,0.0)
	pull_ratio_y=Default(pull_ratio_y,0.0)

	pull_x=pull_ratio_x*Width(clip)
	pull_y=pull_ratio_y*Height(clip)

	clip_zoomed=FAST_ZOOM(clip,0,0,-pull_x,-pull_y,extend=true)
	return FAST_ZOOM(clip_zoomed,0,0,pull_x,pull_y,extend=true)
}

######## Source ########

function FFMS2_VIDEO_SOURCE(string filename,int "vtrack",int "atrack",int "fpsnum",int "fpsden",bool "enable_multi_thread"){
	atrack=Default(atrack,-1)
	enable_multi_thread=Default(enable_multi_thread,false)

	threads=enable_multi_thread?-1:1

	return FFmpegSource2(filename,vtrack=vtrack,atrack=atrack,fpsnum=fpsnum,fpsden=fpsden,threads=threads)
}

function FFMS2_VIDEO_SOURCE_RGB24(string filename,int "vtrack",int "atrack",int "fpsnum",int "fpsden",bool "enable_multi_thread"){
	return ConvertToRGB24(FFMS2_VIDEO_SOURCE(filename,vtrack,atrack,fpsnum,fpsden,enable_multi_thread))
}

function VOB_MPEG2_VIDEO_SOURCE(string filename,int "upConv",int "info"){
	return DGDecode_MPEG2Source(filename,upConv=upConv,info=info)
}

function VOB_MPEG2_VIDEO_SOURCE_CROPPED(string filename,int "upConv",int "info"){
	return Crop(VOB_MPEG2_VIDEO_SOURCE(filename,upConv=upConv,info=info),0,60,720,360)
}

######## Subtitle ########

function SUBTITLE_TEST(clip clip,string text,int "first_frame",int "last_frame",int "text_color",int "halo_color"){
	default_size=28
	SubtitleEx(clip,text,firstframe=first_frame,lastframe=last_frame,font=subtitle_font,size=Round(default_size*Float(Height(clip))/480.0),textcolor=text_color,halocolor=halo_color)
}



function SUBTITLE_CLIP_BASE(clip ref_clip,int "length",int "width",int "height"){
	return BlankClip(ref_clip,length=length,width=width,height=height,pixel_type="RGB32",color=color_black)
}

function SUBTITlE_CLIP(clip subtitle_bg,string text,int "x",int "y",int "first_frame",int "last_frame",string "font",string "effects",int "size",int "text_color",int "halo_color",int "line_margin",int "spc",bool "subtitle_ex"){
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
	subtitle_mask_ex=SubtitleEx(subtitle_bg,text,x,y,first_frame,last_frame,font,effects,size,text_mask_color,halo_mask_color,line_margin,spc)
	subtitle_rgb_ex=SubtitleEx(subtitle_bg,text,x,y,first_frame,last_frame,font,effects,size,text_rgb_color,halo_rgb_color,line_margin,spc)

	subtitle_mask=subtitle_ex?subtitle_mask_ex:subtitle_mask_standard
	subtitle_rgb=subtitle_ex?subtitle_rgb_ex:subtitle_rgb_standard

	return Mask(subtitle_rgb,Greyscale(subtitle_mask))
}



global subtitle_clip_width=856
global subtitle_clip_height=480



function _SUBTITLE_NORMAL(clip clip,string text,int "x",int "y",int "first_frame",int "last_frame",string "font",string "effects",int "size",int "text_color",int "halo_color",bool "subtitle_ex"){
	subtitle_bg=SUBTITLE_CLIP_BASE(clip,width=subtitle_clip_width,height=subtitle_clip_height)
	subtitle_rgba=SUBTITlE_CLIP(subtitle_bg,text,x,y,first_frame,last_frame,font,effects,size,text_color,halo_color,subtitle_ex=subtitle_ex)
	subtitle_rgba_resized=RESIZE_TO_REF_CLIP(subtitle_rgba,clip)
	return Layer(clip,subtitle_rgba_resized,"Add")
}

function SUBTITLE_ZOOM(clip clip,string text,int "x",int "y",int "first_frame",int "last_frame",string "font",string "effects",int "size",int "text_color",int "halo_color",bool "subtitle_ex",float "srcx",float "srcy",float "dstx",float "dsty",float "factorX",float "factorY",float "factor"){
	subtitle_bg=SUBTITLE_CLIP_BASE(clip,width=subtitle_clip_width,height=subtitle_clip_height)
	subtitle_rgba=SUBTITlE_CLIP(subtitle_bg,text,x,y,first_frame,last_frame,font,effects,size,text_color,halo_color,subtitle_ex=subtitle_ex)
	subtitle_rgba_zoomed=FAST_ZOOM(subtitle_rgba,srcx,srcy,dstx,dsty,factorX,factorY,factor)
	subtitle_rgba_resized=RESIZE_TO_REF_CLIP(subtitle_rgba_zoomed,clip)
	return Layer(clip,subtitle_rgba_resized,"Add")
}

function SUBTITLE_PULL(clip clip,string text,int "x",int "y",int "first_frame",int "last_frame",string "font",string "effects",int "size",int "text_color",int "halo_color",bool "subtitle_ex",float "pull_ratio_x",float "pull_ratio_y"){
	subtitle_bg=SUBTITLE_CLIP_BASE(clip,width=subtitle_clip_width,height=subtitle_clip_height)
	subtitle_rgba=SUBTITlE_CLIP(subtitle_bg,text,x,y,first_frame,last_frame,font,effects,size,text_color,halo_color,subtitle_ex=subtitle_ex)
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
	ascii_code=ascii_code+((ascii_code>=$7C)?1:0)
	return Chr(ascii_code)
}

function SUBTITLE_FX_RANDOM_STRING(clip clip,string text,int x,int y,int start_frame,int end_frame,int front_fade_count,int rear_fade_count,string font,string effects,int size,int text_color,int halo_color,bool "subtitle_ex",string "random_char_func"){
	random_char_func=Default(random_char_func,"RANDOM_ASCII_CHAR")

	before_start_frame=start_frame-front_fade_count
	after_end_frame=end_frame+rear_fade_count

	clip_rgba=ConvertToRGB32(clip)
	subtitle_bg=SUBTITLE_CLIP_BASE(clip_rgba,width=subtitle_clip_width,height=subtitle_clip_height)

	random_text="RANDOM_STRING_OUT_OF_FRAME_RANGE("+THREE_DOUBLE_QUOTE_STRING(text)+",current_frame,"+String(start_frame)+","+String(end_frame)+","+DOUBLE_QUOTE_STRING(random_char_func)+")"
	subtitle_rgba_containing_var=ScriptClip(subtitle_bg,"SUBTITlE_CLIP("+random_text+","+String(x)+","+String(y)+","+String(before_start_frame)+","+String(after_end_frame)+","+DOUBLE_QUOTE_STRING(font)+","+DOUBLE_QUOTE_STRING(effects)+","+String(size)+",SCALE_SUBTITLE_COLOR_ALPHA("+String(text_color)+",alpha_factor),SCALE_SUBTITLE_COLOR_ALPHA("+String(halo_color)+",alpha_factor),subtitle_ex="+OPTIONAL_ARG_TO_STRING(subtitle_ex)+")")
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

	command_part01="SUBTITlE_CLIP("+THREE_DOUBLE_QUOTE_STRING(text)+","+command_part01_topleft_x+","+command_part01_topleft_y+","+command_part01_first_frame+","+command_part01_last_frame+","+DOUBLE_QUOTE_STRING(font)+","+DOUBLE_QUOTE_STRING(effects)+","+command_part01_size+","
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
