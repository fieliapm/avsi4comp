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



######## Function ########

LoadPlugin("..\plugins\MaskTools.dll")

function RANDOM_APPEAR_CHAR(string ref_char,int current_frame,int start_frame,int end_frame){
	space=StrLen(ref_char)==2?"@":" "
	threshold=PSEUDO_RANDOM(12)
	count_down=start_frame-current_frame
	return count_down>threshold?space:ref_char
}

function RANDOM_APPEAR_CHAR_INIT(int current_frame,int start_frame,int end_frame){
	PSEUDO_RANDOM_SEED(start_frame)
}

function _FILTER_STRING(string ref_string,int current_frame,int start_frame,int end_frame,string char_func,string exclude_char_set){
	length=StrLen(ref_string)
	ref_char=LeftStr(ref_string,1)
	char_length=ORD_(ref_char)<$80?1:2
	ref_char=LeftStr(ref_string,char_length)
	is_exclude_char=FindStr(exclude_char_set,ref_char)>0
	skip=char_length==1?(IS_CONTROL_CHAR(ref_char)||is_exclude_char):false
	return (skip?ref_char:Apply(char_func,ref_char,current_frame,start_frame,end_frame))+(length>char_length?_FILTER_STRING(RightStr(ref_string,length-char_length),current_frame,start_frame,end_frame,char_func,exclude_char_set):"")
}

function FILTER_STRING(string ref_string,int current_frame,int start_frame,int end_frame,string before_filter_func,string char_func,string "exclude_char_set"){
	exclude_char_set=Default(exclude_char_set,"| ")

	Apply(before_filter_func,current_frame,start_frame,end_frame)

	return _FILTER_STRING(ref_string,current_frame,start_frame,end_frame,char_func,exclude_char_set)
}

function FILTER_STRING_OUT_OF_FRAME_RANGE(string text,int current_frame,int start_frame,int end_frame,string before_filter_func,string char_func,string "exclude_char_set"){
	return current_frame<start_frame||current_frame>end_frame?FILTER_STRING(text,current_frame,start_frame,end_frame,before_filter_func,char_func,exclude_char_set):text
}

function SUBTITLE_FX_RANDOM_APPEAR_FADE_OUT_DOUBLE_HALO(clip clip,string text,int x,int y,int start_frame,int end_frame,int front_fade_count,int rear_fade_count,string "font",string "effects",int "size",int "text_color",int "halo_color",int "outside_halo_color",string "subtitle_mode"){
	before_start_frame=start_frame-front_fade_count
	after_end_frame=end_frame+rear_fade_count

	before_filter_func="RANDOM_APPEAR_CHAR_INIT"
	char_func="RANDOM_APPEAR_CHAR"

	Assert(IsRGB32(clip),"SUBTITLE_FX_RANDOM_APPEAR_FADE_OUT_DOUBLE_HALO(): clip only support RGB32 format")

	subtitle_bg=BlankClip(clip,width=subtitle_clip_width,height=subtitle_clip_height,color=outside_halo_color)

	random_text="FILTER_STRING_OUT_OF_FRAME_RANGE("+THREE_DOUBLE_QUOTE_STRING(text)+",current_frame,"+String(start_frame)+","+String(end_frame)+","+DOUBLE_QUOTE_STRING(before_filter_func)+","+DOUBLE_QUOTE_STRING(char_func)+")"
	subtitle_rgb=ScriptClip(subtitle_bg,"RENDER_SUBTITLE("+random_text+","+String(x)+","+String(y)+","+String(before_start_frame)+","+String(after_end_frame)+","+DOUBLE_QUOTE_STRING(font)+","+DOUBLE_QUOTE_STRING(effects)+","+String(size)+","+String(text_color)+","+String(halo_color)+",subtitle_mode="+OPTIONAL_STRING_ARG(subtitle_mode)+")")
	subtitle_rgba=ColorKeyMask(ResetMask(subtitle_rgb),outside_halo_color,0)

	subtitle_alpha=CONVERT_BACK_TO_YV12(ShowAlpha(subtitle_rgba),matrix="Rec709")
	subtitle_alpha=Expand(Expand(Expand(subtitle_alpha)))
	subtitle_alpha=ConvertToRGB32(Greyscale(subtitle_alpha),matrix="Rec709")

	subtitle_rgba=Mask(subtitle_rgba,subtitle_alpha)

	subtitle_rgba_faded_containing_parameter=ScriptClip(subtitle_rgba,"RGBAdjust(a=alpha_factor)")
	subtitle_rgba_faded=FrameEvaluate(subtitle_rgba_faded_containing_parameter,"alpha_factor=Spline(current_frame,"+String(before_start_frame)+",0.0,"+String(before_start_frame+1)+",1.0,"+String(end_frame)+",1.0,"+String(after_end_frame)+",0.0,cubic=false)")

	return _SUBTITLE_FX_POST(clip,subtitle_rgba_faded,before_start_frame,after_end_frame)
}

function SUBTITLE_FX_FADE_IN_FADE_OUT_DOUBLE_HALO(clip clip,string text,int x,int y,int start_frame,int end_frame,int front_fade_count,int rear_fade_count,string "font",string "effects",int "size",int "text_color",int "halo_color",int "outside_halo_color",string "subtitle_mode"){
	before_start_frame=start_frame-front_fade_count
	after_end_frame=end_frame+rear_fade_count

	Assert(IsRGB32(clip),"SUBTITLE_FX_FADE_IN_FADE_OUT_DOUBLE_HALO(): clip only support RGB32 format")

	subtitle_rgb=_SUBTITLE_FX_PRE_OPAQUE(clip,outside_halo_color,text,x,y,before_start_frame,after_end_frame,font,effects,size,text_color,halo_color,subtitle_mode)
	subtitle_rgba=ColorKeyMask(ResetMask(subtitle_rgb),outside_halo_color,0)

	subtitle_alpha=CONVERT_BACK_TO_YV12(ShowAlpha(subtitle_rgba),matrix="Rec709")
	subtitle_alpha=Expand(Expand(Expand(subtitle_alpha)))
	subtitle_alpha=ConvertToRGB32(Greyscale(subtitle_alpha),matrix="Rec709")

	subtitle_rgba=Mask(subtitle_rgba,subtitle_alpha)

	subtitle_rgba_faded_containing_parameter=ScriptClip(subtitle_rgba,"RGBAdjust(a=alpha_factor)")
	subtitle_rgba_faded=FrameEvaluate(subtitle_rgba_faded_containing_parameter,"alpha_factor=Spline(current_frame,"+String(before_start_frame)+",0.0,"+String(start_frame)+",1.0,"+String(end_frame)+",1.0,"+String(after_end_frame)+",0.0,cubic=false)")

	return _SUBTITLE_FX_POST(clip,subtitle_rgba_faded,before_start_frame,after_end_frame)
}



function MOVE_CG(clip cg,int dir_x,int dir_y,float move_offset,float scale){
	cg_frame_count=Framecount(cg)
	cg_width_half=Width(cg)/2
	cg_height_half=Height(cg)/2
	move_offset_half=move_offset*0.5

	return ScriptClip(cg,"FAST_ZOOM(dstx=Spline(current_frame,0,"+String(cg_width_half)+"-("+String(move_offset_half)+"*("+String(dir_x)+")),"+String(cg_frame_count)+","+String(cg_width_half)+"+("+String(move_offset_half)+"*("+String(dir_x)+")),cubic=false)," \
		+"dsty=Spline(current_frame,0,"+String(cg_height_half)+"-("+String(move_offset_half)+"*("+String(dir_y)+")),"+String(cg_frame_count)+","+String(cg_height_half)+"+("+String(move_offset_half)+"*("+String(dir_y)+")),cubic=false),factor="+String(scale)+",extend=true)")
}
