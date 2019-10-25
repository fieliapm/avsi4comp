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

function SUBTITLE_FX_ASTRAL_CHAIN_DOUBLE_HALO(clip clip,string text,int x,int y,int start_frame,int end_frame,int front_fade_count,int rear_fade_count,string font,string effects,int size,int text_color,int halo_color,int outside_halo_color,string "subtitle_mode",string "random_char_func",string "exclude_char_set"){
	random_char_func=Default(random_char_func,"RANDOM_ASCII_CHAR")

	before_start_frame=start_frame-front_fade_count
	after_end_frame=end_frame+rear_fade_count

	Assert(IsRGB32(clip),"SUBTITLE_FX_ASTRAL_CHAIN_DOUBLE_HALO(): clip only support RGB32 format")

	subtitle_bg=BlankClip(clip,width=subtitle_clip_width,height=subtitle_clip_height,color=outside_halo_color)

	random_text="RANDOM_STRING_OUT_OF_FRAME_RANGE("+THREE_DOUBLE_QUOTE_STRING(text)+",current_frame,"+String(start_frame)+","+String(end_frame)+","+DOUBLE_QUOTE_STRING(random_char_func)+","+OPTIONAL_STRING_ARG_CONTAIN_DOUBLE_QUOTE_CHAR(exclude_char_set)+")"
	subtitle_rgba=ScriptClip(subtitle_bg,"RENDER_SUBTITLE("+random_text+","+String(x)+","+String(y)+","+String(before_start_frame)+","+String(after_end_frame)+","+DOUBLE_QUOTE_STRING(font)+","+DOUBLE_QUOTE_STRING(effects)+","+String(size)+","+String(text_color)+","+String(halo_color)+",subtitle_mode="+OPTIONAL_STRING_ARG(subtitle_mode)+")")
	subtitle_rgba=FrameEvaluate(subtitle_rgba,"PSEUDO_RANDOM_SEED(current_frame)")

	subtitle_rgba=ColorKeyMask(ResetMask(subtitle_rgba),outside_halo_color,0)

	subtitle_alpha=CONVERT_BACK_TO_YV12(ShowAlpha(subtitle_rgba),matrix="Rec709")
	subtitle_alpha=Expand(Expand(Expand(subtitle_alpha)))
	subtitle_alpha=ConvertToRGB32(Greyscale(subtitle_alpha),matrix="Rec709")

	subtitle_rgba=Mask(subtitle_rgba,subtitle_alpha)

	subtitle_rgba_faded_containing_parameter=ScriptClip(subtitle_rgba,"RGBAdjust(a=alpha_factor)")
	subtitle_rgba_faded=FrameEvaluate(subtitle_rgba_faded_containing_parameter,"alpha_factor=Spline(current_frame,"+String(before_start_frame)+",0.0,"+String(start_frame)+",1.0,"+String(end_frame)+",1.0,"+String(after_end_frame)+",0.0,cubic=false)")

	subtitle_rgba_slow_motion=SLOW_MOTION_TO_FPS(subtitle_rgba_faded,10,true,linear=false)

	return _SUBTITLE_FX_POST(clip,subtitle_rgba_slow_motion,before_start_frame,after_end_frame)
}
