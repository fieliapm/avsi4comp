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



Import("..\..\..\avsi4comp\avsi4comp.avsi")

######## Function ########

LoadPlugin("..\..\plugins\MaskTools.dll")

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

######## Character ########

ryza_character_illustration=AUDIO_DUB_TONE(ImageSource("src\character\ryza\illust.png",0,267,30000.0/1001.0,pixel_type="rgb32"),samplerate=48000,channels=2,type="Silence")

######## Pre Combine ########

fade_length=50

bg=BlankClip(ryza_character_illustration,width=1920,height=1080,pixel_type="RGB32",color=color_deepskyblue)
#ryza_no_atelier_gate_of_truth=TRANSFORM(bg,ryza_character_illustration,srcx="0.625*Width(ryza_character_illustration)",srcy="0.47*Height(ryza_character_illustration)",dstx="0.5*Width(bg)",dsty="0.47*Height(bg)",factor="Pow(2.0,Spline(n,0,-1.0,Framecount()-1,4.0,cubic=false))")
ryza_no_atelier_gate_of_truth=ScriptClip(bg,"Layer(FAST_ZOOM(ryza_character_illustration,srcx=0.625*Width(ryza_character_illustration),srcy=0.47*Height(ryza_character_illustration),dstx=0.5*Width(bg),dsty=0.47*Height(bg),factor=Pow(2.0,Spline(current_frame,0,-1.0,Framecount()-1,4.0,cubic=false)),width=Width(bg),height=Height(bg)),"+DOUBLE_QUOTE_STRING("Add")+")")

######## Music ########

bgm_48khz=SSRC(WAVSource("src\ryza_no_atelier-ost-cd01-01.wav"),48000)

ryza_no_atelier_gate_of_truth_audio=AudioDub(ryza_no_atelier_gate_of_truth,bgm_48khz)
#ryza_no_atelier_gate_of_truth_audio=Normalize(ryza_no_atelier_gate_of_truth_audio)
ryza_no_atelier_gate_of_truth_audio=FadeOut0(ryza_no_atelier_gate_of_truth_audio,fade_length)

ryza_no_atelier_gate_of_truth=AudioDub(ryza_no_atelier_gate_of_truth,ryza_no_atelier_gate_of_truth_audio)

######## Combine ########

ryza_no_atelier_gate_of_truth=FADE_OUT_WITH_BRIGHTNESS_OFFSET(ryza_no_atelier_gate_of_truth,fade_length)

ryza_no_atelier_gate_of_truth

######## Subtitle ########

### inherit start ###

global subtitle_clip_width=1920
global subtitle_clip_height=1080

subtitle_x=50*2.25
subtitle_y=395*2.25
global subtitle_front_fade_count=15
global subtitle_rear_fade_count=15
global subtitle_font="MS Gothic"
global subtitle_effects="b"
global subtitle_size=33*2.25
global subtitle_text_color=color_white
global subtitle_halo_color=color_black
global subtitle_outside_halo_color=color_dodgerblue

function SUBTITLE_FX(clip clip,string text,float x,float y,int start_frame,int end_frame,bool "is_furigana",bool "is_title"){
	is_title=Default(is_title,false)
	is_furigana=Default(is_furigana,false)

	outside_halo_color=is_title?color_gold:subtitle_outside_halo_color

	subtitle_mode=is_furigana?"ex":"ex" #"ex_thick_reduce_memory"
	size=is_furigana?subtitle_size*0.5:subtitle_size
	y=is_furigana?y-size:y

	return SUBTITLE_FX_FADE_IN_FADE_OUT_DOUBLE_HALO(clip,text,Round(x),Round(y),start_frame,end_frame,subtitle_front_fade_count,subtitle_rear_fade_count,subtitle_font,subtitle_effects,Round(size),subtitle_text_color,subtitle_halo_color,outside_halo_color,subtitle_mode)
}

SUBTITLE_FX("ê^óùÇÃî‡",-subtitle_x,subtitle_y,27,199,is_title=true)

######## Post Processing ########

#ConvertToRGB24()
#ConvertBackToYUY2(matrix="Rec709")
CONVERT_BACK_TO_YV12(matrix="Rec709")

#ConvertAudioTo8bit()
#ConvertAudioTo16bit()
ConvertAudioTo24bit()
#ConvertAudioTo32bit()
#ConvertAudioToFloat()

TCPServer()
