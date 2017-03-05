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



Import("..\..\avsi4comp\avsi4comp.avsi")
Import("shingeki_no_kyojin-tv-common.avsi")

######## Source ########

#shingeki_no_kyojin_tv_op_01=FFMS2_VIDEO_SOURCE("..\shingeki_no_kyojin-tv-op-01.avi")
#shingeki_no_kyojin_tv_op_02=FFMS2_VIDEO_SOURCE("..\shingeki_no_kyojin-tv-op-02.avi")

shingeki_no_kyojin_tv_op_01=TCPSource("localhost",22051,"None")
shingeki_no_kyojin_tv_op_02=TCPSource("localhost",22052,"None")

######## Combine ########

# shingeki_no_kyojin_tv_op_01 0
# shingeki_no_kyojin_tv_op_02 7599 (without beginning 5 frame) 7594 (with beginning 5 frame)

fade_length=24
inter_movement_length=210-5

shingeki_no_kyojin_tv_op_suite_mute=TRIM_FIRST_CLIP(shingeki_no_kyojin_tv_op_01,Framecount(shingeki_no_kyojin_tv_op_01)-24) \
	++BlankClip(shingeki_no_kyojin_tv_16_wall_gate_open,length=inter_movement_length-Framecount(shingeki_no_kyojin_tv_16_wall_gate_open),color=color_black)+FADE_OUT_WITH_BRIGHTNESS_OFFSET_RGB24(FadeIn0(shingeki_no_kyojin_tv_16_wall_gate_open,fade_length),fade_length) \
	++shingeki_no_kyojin_tv_op_02

shingeki_no_kyojin_tv_op_suite_title=BlankClip(shingeki_no_kyojin_tv_op_01,length=24*9,color=color_black)

######## Music ########

bgm_48khz=SSRC(WAVSource("src\shingeki_no_kyojin-tv-op-cd-01.wav")+WAVSource("src\shingeki_no_kyojin-tv-op-cd-02.wav"),48000)
AudioDub(shingeki_no_kyojin_tv_op_suite_mute,bgm_48khz)

######## Subtitle ########

global subtitle_clip_width=1280
global subtitle_clip_height=720

subtitle_x=428*1.5
subtitle_y=240*1.5
global subtitle_front_fade_count=24
global subtitle_rear_fade_count=24
global subtitle_font="MS Gothic"
global subtitle_effects="bc"
global subtitle_size=32*1.5
global subtitle_text_color=color_white
global subtitle_halo_color=OVERWRITE_SUBTITLE_COLOR_ALPHA(color_black,$C0)

function SUBTITLE_FX(clip clip,string text,float x,float y,int start_frame,int end_frame,bool "is_title"){
	is_title=Default(is_title,false)

	halo_color=is_title?OVERWRITE_COLOR_ALPHA(color_orangered,$3F):subtitle_halo_color
	size=is_title?subtitle_size:subtitle_size*0.8

	return SUBTITLE_FX_SMEAR_IN_SMEAR_OUT(clip,text,Round(x),Round(y),start_frame,end_frame,subtitle_front_fade_count,subtitle_rear_fade_count,subtitle_font,subtitle_effects,Round(size),subtitle_text_color,halo_color)
}

shingeki_no_kyojin_tv_op_suite_title=SUBTITLE_FX(shingeki_no_kyojin_tv_op_suite_title,"組曲《自由への進撃》 第1楽章~第2楽章|Linked Horizon||- by fielia@AVISynth",subtitle_x,subtitle_y-subtitle_size,24*2,24*7,true)



ConvertToYV12(shingeki_no_kyojin_tv_op_suite_title)++last

######## Post Processing ########

ConvertToYV12()
#ConvertToYUY2()
#ConvertToRGB24()

TCPServer()
