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



#LoadPlugin("zoom.dll")
#Import("Pantarheon3D.avsi")
#Import("FFMS2.avsi")
#LoadPlugin("DGDecode.dll")

######## General ########

function UNDEFINED_(val "dummyArg"){
    Assert(!Defined(dummyArg),"UNDEFINED_(): cannot be called with any argument")
    return dummyArg
}

function MIN_(val a,val b){
	return a<b?a:b
}

function MAX_(val a,val b){
	return a>b?a:b
}

function CLAMP(val x,val low,val high){
	return MAX_(low,MIN_(high,x))
}

function EUCLIDEAN_MOD(int a,int b){
	return ((a%b)+b)%b
}

function FLOOR_BS(val x,val n){
	return Floor(Float(x)/n)*n
}

function CEIL_BS(val x,val n){
	return Ceil(Float(x)/n)*n
}

function ROUND_BS(val x,val n){
	return Round(Float(x)/n)*n
}

######## Random ########

function PSEUDO_RANDOM_SEED(int seed){
	global _next_pseudo_random_number=seed
}

function PSEUDO_RANDOM(int "max"){
	#global _next_pseudo_random_number=(_next_pseudo_random_number*1664525)+1013904223
	next=(_next_pseudo_random_number*1103515245)+12345
	global _next_pseudo_random_number=next<0?next+$80000000:next # next mod pow(2,31), when next is signed int

	return Defined(max)?_next_pseudo_random_number%max:_next_pseudo_random_number
}

PSEUDO_RANDOM_SEED(Int(Value(Time("%S"))))

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

######## Linear Interpolation ########

function INVERSE_LERP(float x,float start,float end){
	f_x=Float(x)
	f_start=Float(start)
	f_end=Float(end)
	return (f_x-f_start)/(f_end-f_start)
}

function LERP(float t,float start,float end){
	f_t=Float(t)
	f_start=Float(start)
	f_end=Float(end)
	return ((1.0-f_t)*f_start)+(f_t*f_end)
}

function INVERSE_LERP_CLAMPED(float x,float start,float end){
	return CLAMP(INVERSE_LERP(x,start,end),0.0,1.0)
}

function EVALUATE_LERP_PARAMETER(clip clip,string parameter_name,int zero_val_frame,int one_val_frame,bool "after_frame"){
	return FrameEvaluate(clip,parameter_name+"=INVERSE_LERP_CLAMPED(current_frame,"+String(zero_val_frame)+","+String(one_val_frame)+")",after_frame=after_frame)
}

######## Apply Range ########

function OVERWRITE_RANGE(clip clip,clip new_clip,int start_frame,int end_frame){
	clip_conditional_half=ConditionalFilter(clip,clip,new_clip,"current_frame","<",String(start_frame))
	return ConditionalFilter(clip,clip,clip_conditional_half,"current_frame",">",String(end_frame))
}

function APPLY_RANGE(clip clip,int start_frame,int end_frame,string expression){
	clip
	clip_filtered=Eval(expression)
	return OVERWRITE_RANGE(clip,clip_filtered,start_frame,end_frame)
}

######## Color Component ########

function GET_COLOR_A_2(int color){
	divisor=$1000000
	alpha=color/divisor
	flag=EUCLIDEAN_MOD(color,divisor)!=0?1:0
	return color<0?$100+alpha-flag:alpha
}

function GET_COLOR_A(int color){
	divisor=$1000000
	return EUCLIDEAN_MOD((color-EUCLIDEAN_MOD(color,divisor))/divisor,$100)
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

function COLOR_LERP(float t,int color1,int color2){
	color1_r=GET_COLOR_R(color1)
	color1_g=GET_COLOR_G(color1)
	color1_b=GET_COLOR_B(color1)
	color1_a=GET_COLOR_A(color1)

	color2_r=GET_COLOR_R(color2)
	color2_g=GET_COLOR_G(color2)
	color2_b=GET_COLOR_B(color2)
	color2_a=GET_COLOR_A(color2)

	return ASSIGN_COLOR_RGB(Round(LERP(t,color1_r,color2_r)),Round(LERP(t,color1_g,color2_g)),Round(LERP(t,color1_b,color2_b)),Round(LERP(t,color1_a,color2_a)))
}

######## String ########

function _GENERATE_CHAR_SET(int ord_value){
	return (ord_value>1?_GENERATE_CHAR_SET(ord_value-1):"")+Chr(ord_value)
}

global __ASCII_CHAR_SET=_GENERATE_CHAR_SET(255)

function ORD_(string char){
	Assert(StrLen(char)==1,"ORD_(): string length is not equal to 1")
	return FindStr(__ASCII_CHAR_SET,char)
}

function IS_CONTROL_CHAR(string char){
	ord_value=ORD_(char)
	return ord_value<$20||ord_value==$7F
}

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

function OPTIONAL_STRING_ARG_CONTAIN_DOUBLE_QUOTE_CHAR(string "str"){
	return Defined(str)?THREE_DOUBLE_QUOTE_STRING(str):"UNDEFINED_()"
}

function RANDOM_STRING(string ref_string,string random_char_func,string "exclude_char_set"){
	exclude_char_set=Default(exclude_char_set,"|")

	length=StrLen(ref_string)
	ref_char=LeftStr(ref_string,1)
	is_exclude_char=FindStr(exclude_char_set,ref_char)>0
	return (IS_CONTROL_CHAR(ref_char)||is_exclude_char?ref_char:Apply(random_char_func))+(length>1?RANDOM_STRING(RightStr(ref_string,length-1),random_char_func,exclude_char_set):"")
}

function RANDOM_STRING_OUT_OF_FRAME_RANGE(string text,int current_frame,int start_frame,int end_frame,string random_char_func,string "exclude_char_set"){
	return current_frame<start_frame||current_frame>end_frame?RANDOM_STRING(text,random_char_func,exclude_char_set):text
}

######## Audio ########

function AUDIO_DUB_TONE(clip clip,int "frequency",int "samplerate",int "channels",string "type",float "level"){
	tone=Tone(length=Float(Framecount(clip))/Float(Framerate(clip)),frequency=frequency,samplerate=samplerate,channels=channels,type=type,level=level)
	return AudioDub(clip,tone)
}

######## Pixel Type ########

function _DEFINE_TRY_IS_PIXEL_TYPE(string pixel_type){
	Eval("function TRY_IS_"+pixel_type+"(clip clip){
	Try{
		result=Is"+pixel_type+"(clip)
	}Catch(err_msg){
		result=false
	}
	return result
}")
}

_DEFINE_TRY_IS_PIXEL_TYPE("YV24")
_DEFINE_TRY_IS_PIXEL_TYPE("YV16")
_DEFINE_TRY_IS_PIXEL_TYPE("YV411")
_DEFINE_TRY_IS_PIXEL_TYPE("Y8")

function GET_PIXEL_TYPE(clip clip){
	return IsRGB32(clip)?"RGB32" \
		:IsRGB24(clip)?"RGB24" \
		:IsYUY2(clip)?"YUY2" \
		:IsYV12(clip)?"YV12" \
		:TRY_IS_YV24(clip)?"YV24" \
		:TRY_IS_YV16(clip)?"YV16" \
		:TRY_IS_YV411(clip)?"YV411" \
		:TRY_IS_Y8(clip)?"Y8" \
		:Assert(false,"GET_PIXEL_TYPE(): cannot identify clip pixel type")
}

function CONVERT_TO_PIXEL_TYPE(clip clip,string pixel_type){
	return Eval("ConvertTo"+pixel_type+"(clip)")
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

function TRIM_ONE_FRAME(clip clip,int frame_index){
	return Trim(clip,frame_index,-1)
}

function LOOP_ONE_FRAME(clip clip,int loop_count){
	Assert(Framecount(clip)==1,"LOOP_ONE_FRAME(): clip frame count is not equal to 1")
	return Loop(clip,loop_count,0,0)
}

function STILL_FRAME(clip clip,int frame_index,int loop_count){
	return LOOP_ONE_FRAME(TRIM_ONE_FRAME(clip,frame_index),loop_count)
}

function STILL_FIRST_FRAME(clip clip,int loop_count){
	return LOOP_ONE_FRAME(TRIM_FIRST_CLIP(clip,1),loop_count)
}

function STILL_MIDDLE_FRAME(clip clip,int loop_count){
	return LOOP_ONE_FRAME(TRIM_MIDDLE_CLIP(clip,1),loop_count)
}

function STILL_LAST_FRAME(clip clip,int loop_count){
	return LOOP_ONE_FRAME(TRIM_LAST_CLIP(clip,1),loop_count)
}

function EXTEND_ANIMATION_CG(clip cg,int frame_count){
	cg_frame_count=Framecount(cg)
	return TRIM_FIRST_CLIP(Loop(cg,Ceil(Float(frame_count)/Float(cg_frame_count))),frame_count)
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

function BOB_PRESERVE_ORIGINAL_FIELD(clip clip,float "b",float "c",float "height"){
	b=Default(b,0.0)
	c=Default(c,0.5)

	return Bob(clip,b,c,height)
}

function BOB_AND_KEEP_PARITY(clip interlaced_clip,float "b",float "c",float "height"){
	interlaced_clip_parity=GetParity(interlaced_clip)
	bob_deinterlaced_clip=BOB_PRESERVE_ORIGINAL_FIELD(interlaced_clip,b,c,height)
	return interlaced_clip_parity?AssumeTFF(bob_deinterlaced_clip):AssumeBFF(bob_deinterlaced_clip)
}

function PROGRESSIVE_TO_INTERLACED(clip clip){
	return SelectEvery(DoubleWeave(ComplementParity(clip)),4,1)
}

function FILTER_INTERLACED_VIDEO(clip source_clip,string expression){
	BOB_AND_KEEP_PARITY(source_clip)
	filtered_clip=Eval(expression)
	return PROGRESSIVE_TO_INTERLACED(filtered_clip)
}

######## FPS ########

function CONVERT_24P_TO_60P_PATTERN_AAIBB(clip clip){
	clip_even=SelectEven(clip)
	clip_odd=SelectOdd(clip)
	clip_even_last_frame=TRIM_LAST_CLIP(clip_even,1)
	clip_interpolation=Merge(clip_even,clip_odd+clip_even_last_frame,0.5)
	return Interleave(clip_even,clip_even,clip_interpolation,clip_odd,clip_odd)
}

function ASSUME_FPS_SYNC_AUDIO(clip clip,val numerator,val "denominator"){
	clip_audiorate=Audiorate(clip)
	return ResampleAudio(AssumeFPS(clip,numerator,denominator,sync_audio=true),clip_audiorate)
}

function ASSUME_SCALED_FPS_SYNC_AUDIO(clip clip,int "multiplier",int "divisor"){
	clip_audiorate=Audiorate(clip)
	return ResampleAudio(AssumeScaledFPS(clip,multiplier,divisor,sync_audio=true),clip_audiorate)
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
	return Apply(fps*3.0<Framerate(clip)*2.0?"ChangeFPS":"ConvertFPS",clip,fps)
}

function CLIP_SPEED(clip clip,float speed,bool smooth){
	frame_rate=Framerate(clip)
	speeded_clip=ASSUME_FPS_SYNC_AUDIO(clip,frame_rate*speed)
	return Apply(smooth?"CONVERT_FPS_AUTO_HQ":"ChangeFPS",speeded_clip,frame_rate)
}

function SLOW_MOTION_TO_FPS(clip clip,float fps,bool smooth,bool "linear"){
	clip_slowed_down=ChangeFPS(clip,fps,linear=linear)
	return Apply(smooth?"CONVERT_FPS_AUTO_HQ":"ChangeFPS",clip_slowed_down,Framerate(clip))
}

function SLOW_MOTION_BY_DIVISOR(clip clip,int fps_divisor,bool smooth,bool "linear"){
	return SLOW_MOTION_TO_FPS(clip,Framerate(clip)/fps_divisor,smooth,linear=linear)
}

######## Transform & Resize ########

function RESIZE_TO_REF_CLIP(clip clip,clip ref_clip){
	w=Width(ref_clip)
	h=Height(ref_clip)
	return Lanczos4Resize(clip,w,h)
}

function FAST_ZOOM(clip clip,float "srcx",float "srcy",float "dstx",float "dsty",float "factorX",float "factorY",float "factor",int "width",int "height",string "resize_func",bool "extend"){
	border_size=8
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

	border_size_x=extend?0:CEIL_BS(Float(border_size)/factorX,border_size)
	border_size_y=extend?0:CEIL_BS(Float(border_size)/factorY,border_size)

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

	Assert(IsRGB32(base_clip),"TRANSFORM(): base_clip only support RGB32 format")
	Assert(IsRGB32(overlay_clip),"TRANSFORM(): overlay_clip only support RGB32 format")

	base_clip_width=Width(base_clip)
	base_clip_height=Height(base_clip)
	global_clip_name="_transform_overlay_clip_zoomed_"+String(_transform_overlay_clip_count)
	global _transform_overlay_clip_count=_transform_overlay_clip_count+1
	Eval("global "+global_clip_name+"=Zoom(overlay_clip,srcx,srcy,dstx,dsty,factorX,factorY,factor,angle,base_clip_width,base_clip_height,show)")
	result_clip_containing_parameter=ScriptClip(base_clip,"Layer("+global_clip_name+","+DOUBLE_QUOTE_STRING("Add")+",level=Round(256.0*("+opacity+")))")
	return FrameEvaluate(result_clip_containing_parameter,"global n=current_frame")
}



# deprecated

function RESCALE(clip clip,float scale_x,float scale_y){
	return Lanczos4Resize(clip,ROUND_BS(Float(Width(clip))*scale_x,4),ROUND_BS(Float(Height(clip))*scale_y,4))
}

# deprecated

function LINEAR_MOVE(clip clip,string overlay_clip,string mode,int start_frame,int end_frame,float start_x,float start_y,float start_opacity,float end_x,float end_y,float end_opacity,bool "extend",bool "overwrite"){
	extend=Default(extend,false)
	overwrite=Default(overwrite,false)

	overlay_clip_extend=(extend?"BlankClip("+overlay_clip+",length="+String(start_frame)+",color=color_white)+":"")+overlay_clip

	result_clip_containing_parameter=ScriptClip(clip,"Overlay("+overlay_clip_extend+",x=Round(LERP(_parameter,"+String(start_x)+","+String(end_x)+")),y=Round(LERP(_parameter,"+String(start_y)+","+String(end_y)+")),opacity=LERP(_parameter,"+String(start_opacity)+","+String(end_opacity)+"),mode="+DOUBLE_QUOTE_STRING(mode)+")")
	result_clip=EVALUATE_LERP_PARAMETER(result_clip_containing_parameter,"_parameter",start_frame,end_frame)

	return overwrite?OVERWRITE_RANGE(clip,result_clip,start_frame,end_frame):result_clip
}

######## Transition ########

function TRANSITION(clip clip_left,clip clip_right,int length,string expression){
	left=TRIM_LAST_CLIP(clip_left,length)
	right=TRIM_FIRST_CLIP(clip_right,length)
	transition_clip_video=TRIM_FIRST_CLIP(clip_left,Framecount(clip_left)-length)+Eval(expression)+Trim(clip_right,length,0)
	transition_clip_audio=Dissolve(clip_left,clip_right,length)
	return AudioDub(transition_clip_video,transition_clip_audio)
}

######## Fade ########

function BRIGHTNESS_OFFSET(clip clip,float offset){
	offset_level=Round(offset*255.0)
	return Levels(clip,0,1.0,255,offset_level,offset_level+255,coring=false)
}

function _FADE_WITH_BRIGHTNESS_OFFSET(clip clip,int start_frame,int end_frame,bool is_fade_in){
	zero_val_frame=is_fade_in?end_frame:start_frame
	one_val_frame=is_fade_in?start_frame:end_frame

	clip_faded_containing_parameter=ScriptClip(clip,"BRIGHTNESS_OFFSET(_parameter)")
	return EVALUATE_LERP_PARAMETER(clip_faded_containing_parameter,"_parameter",zero_val_frame,one_val_frame)
}

function FADE_WITH_BRIGHTNESS_OFFSET(clip clip,int start_frame,int end_frame,bool is_fade_in,bool "internal_rgb"){
	internal_rgb=Default(internal_rgb,true)

	clip_pixel_type=GET_PIXEL_TYPE(clip)
	is_clip_rgb=IsRGB(clip)
	clip_rgb=(!internal_rgb)||is_clip_rgb?clip:ConvertToRGB24(clip)

	clip_rgb_faded=_FADE_WITH_BRIGHTNESS_OFFSET(clip_rgb,start_frame,end_frame,is_fade_in)

	clip_faded=is_clip_rgb?clip_rgb_faded:CONVERT_TO_PIXEL_TYPE(clip_rgb_faded,clip_pixel_type)
	return OVERWRITE_RANGE(clip,clip_faded,start_frame+(is_fade_in?0:1),end_frame-(is_fade_in?1:0))
}

function FADE_IN_WITH_BRIGHTNESS_OFFSET(clip clip,int num_frames,bool "internal_rgb"){
	return FADE_WITH_BRIGHTNESS_OFFSET(clip,0,num_frames,true,internal_rgb)
}

function FADE_OUT_WITH_BRIGHTNESS_OFFSET(clip clip,int num_frames,bool "internal_rgb"){
	last_frame=Framecount(clip)-1
	return FADE_WITH_BRIGHTNESS_OFFSET(clip,last_frame-num_frames,last_frame,false,internal_rgb)
}

function DOUBLE_FADE_WITH_BRIGHTNESS_OFFSET(clip clip1,clip clip2,int num_frames_before,int num_frames_after,bool "internal_rgb"){
	return FADE_OUT_WITH_BRIGHTNESS_OFFSET(clip1,num_frames_before,internal_rgb)+FADE_IN_WITH_BRIGHTNESS_OFFSET(clip2,num_frames_after,internal_rgb)
}

function DOUBLE_FADE(clip clip1,clip clip2,int num_frames_before,int num_frames_after,int color){
	return FadeOut(clip1,num_frames_before,color)+FadeIn0(clip2,num_frames_after,color)
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

function PIXEL_SMEAR(clip clip,float "smear_ratio_x",float "smear_ratio_y"){
	smear_ratio_x=Default(smear_ratio_x,0.0)
	smear_ratio_y=Default(smear_ratio_y,0.0)

	smear_x=smear_ratio_x*Float(Width(clip))
	smear_y=smear_ratio_y*Float(Height(clip))

	clip_zoomed=FAST_ZOOM(clip,0.0,0.0,-smear_x,-smear_y,extend=true)
	return FAST_ZOOM(clip_zoomed,0.0,0.0,smear_x,smear_y,extend=true)
}

function PIXEL_SMEAR_FX(clip clip,string mode,int smear_direction,int start_frame,int end_frame,bool is_in){
	Assert(mode=="x"||mode=="y","PIXEL_SMEAR_FX(): invalid mode")

	smear_ratio=Float(Sign(smear_direction))
	zero_val_frame=is_in?end_frame:start_frame
	one_val_frame=is_in?start_frame:end_frame

	clip_pixel_smeared_containing_parameter=ScriptClip(clip,"PIXEL_SMEAR(smear_ratio_"+mode+"=_parameter*("+String(smear_ratio)+"))")
	clip_pixel_smeared=EVALUATE_LERP_PARAMETER(clip_pixel_smeared_containing_parameter,"_parameter",zero_val_frame,one_val_frame)
	return OVERWRITE_RANGE(clip,clip_pixel_smeared,start_frame+(is_in?0:1),end_frame-(is_in?1:0))
}

function PIXEL_SMEAR_IN(clip clip,string mode,int smear_direction,int num_frames){
	return PIXEL_SMEAR_FX(clip,mode,smear_direction,0,num_frames,true)
}

function PIXEL_SMEAR_OUT(clip clip,string mode,int smear_direction,int num_frames){
	last_frame=Framecount(clip)-1
	return PIXEL_SMEAR_FX(clip,mode,smear_direction,last_frame-num_frames,last_frame,false)
}

function SCALE_WIPE(clip clip,float "wipe_ratio_x",float "wipe_ratio_y",float "scale_factor_x",float "scale_factor_y"){
	wipe_ratio_x=Default(wipe_ratio_x,0.0)
	wipe_ratio_y=Default(wipe_ratio_y,0.0)
	scale_factor_x=Default(scale_factor_x,1.0)
	scale_factor_y=Default(scale_factor_y,1.0)

	clip_width=Float(Width(clip))
	clip_height=Float(Height(clip))
	wipe_x=wipe_ratio_x*clip_width
	wipe_y=wipe_ratio_y*clip_height
	offset_x=wipe_ratio_x<0.0?clip_width:0.0
	offset_y=wipe_ratio_y<0.0?clip_height:0.0

	Assert(IsRGB32(clip),"SCALE_WIPE(): clip only support RGB32 format")

	clip_mask=FAST_ZOOM(BlankClip(clip,color=color_white),0.0,0.0,wipe_x,wipe_y)
	clip_origin=Mask(clip,clip_mask)
	clip_scaled=FAST_ZOOM(clip,0.0,0.0,(offset_x+wipe_x)*(1.0-scale_factor_x),(offset_y+wipe_y)*(1.0-scale_factor_y),scale_factor_x,scale_factor_y)
	return Layer(clip_scaled,clip_origin,"Add")
}

function SCALE_WIPE_FX(clip clip,string mode,int wipe_direction,float scale_factor,int start_frame,int end_frame,bool is_in){
	Assert(mode=="x"||mode=="y","SCALE_WIPE_FX(): invalid mode")

	wipe_ratio=Float(Sign(wipe_direction))
	zero_val_frame=is_in?end_frame:start_frame
	one_val_frame=is_in?start_frame:end_frame

	clip_pixel_type=GET_PIXEL_TYPE(clip)
	is_clip_rgb32=IsRGB32(clip)
	clip_rgb32=is_clip_rgb32?clip:ConvertToRGB32(clip)

	clip_rgb32_scale_wiped_containing_parameter=ScriptClip(clip_rgb32,"SCALE_WIPE(wipe_ratio_"+mode+"=_parameter*("+String(wipe_ratio)+"),scale_factor_"+mode+"=LERP(_parameter,1.0,"+String(scale_factor)+"))")
	clip_rgb32_scale_wiped=EVALUATE_LERP_PARAMETER(clip_rgb32_scale_wiped_containing_parameter,"_parameter",zero_val_frame,one_val_frame)

	clip_scale_wiped=is_clip_rgb32?clip_rgb32_scale_wiped:CONVERT_TO_PIXEL_TYPE(clip_rgb32_scale_wiped,clip_pixel_type)
	return OVERWRITE_RANGE(clip,clip_scale_wiped,start_frame+(is_in?0:1),end_frame-(is_in?1:0))
}

function SCALE_WIPE_IN(clip clip,string mode,int wipe_direction,float scale_factor,int num_frames){
	return SCALE_WIPE_FX(clip,mode,wipe_direction,scale_factor,0,num_frames,true)
}

function SCALE_WIPE_OUT(clip clip,string mode,int wipe_direction,float scale_factor,int num_frames){
	last_frame=Framecount(clip)-1
	return SCALE_WIPE_FX(clip,mode,wipe_direction,scale_factor,last_frame-num_frames,last_frame,false)
}

######## Stereoscopy ########

function APPLY_FILTER_TO_LEFT_RIGHT_3D_CLIP(clip clip,string expression){
	LeftRight3DToLeft(clip)
	clip_left_filtered=Eval(expression)

	LeftRight3DToRight(clip)
	clip_right_filtered=Eval(expression)

	return LeftRight3D(clip_left_filtered,clip_right_filtered)
}

function OFFSET_PARALLAX_OF_LEFT_RIGHT_3D_CLIP(clip clip,float parallax_ratio_offset){
	clip_left=LeftRight3DToLeft(clip)
	clip_right=LeftRight3DToRight(clip)

	clip_width=Width(clip_left)
	parallax_ratio_offset_half=parallax_ratio_offset*0.5

	clip_left_cropped=FAST_ZOOM(clip_left,dstx=Float(clip_width)*(0.5-parallax_ratio_offset))
	clip_right_cropped=FAST_ZOOM(clip_right,dstx=Float(clip_width)*(0.5+parallax_ratio_offset))

	clip_left_offset=FAST_ZOOM(clip_left_cropped,dstx=Float(clip_width)*(0.5+parallax_ratio_offset_half))
	clip_right_offset=FAST_ZOOM(clip_right_cropped,dstx=Float(clip_width)*(0.5-parallax_ratio_offset_half))

	return LeftRight3D(clip_left_offset,clip_right_offset)
}

function MONO_CLIP_TO_LEFT_RIGHT_3D_CLIP(clip clip){
	return LeftRight3D(clip,clip)
}

######## Source ########

function FFMS2_VIDEO_SOURCE(string filename,int "vtrack",int "atrack",int "fpsnum",int "fpsden",bool "enable_multi_thread"){
	atrack=Default(atrack,-1)
	enable_multi_thread=Default(enable_multi_thread,false)

	threads=enable_multi_thread?-1:1

	return FFmpegSource2(filename,vtrack=vtrack,atrack=atrack,fpsnum=fpsnum,fpsden=fpsden,threads=threads)
}

function VOB_MPEG2_VIDEO_SOURCE(string filename,int "upConv",int "info"){
	return DGDecode_MPEG2Source(filename,upConv=upConv,info=info)
}
