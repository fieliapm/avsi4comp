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

######## Function ########

######## OBS (1920*1080) ########

slides_mp4=FFmpegSource2("src\2021-07-13-03-32-21.mp4",atrack=-1,fpsnum=60000,fpsden=1001,threads=1)

######## GH5 (1920*1080) ########

camera_mp4_01=FFmpegSource2("src\P1222011.MP4",atrack=-1,fpsnum=60000,fpsden=1001,threads=1)
camera_mp4_02=FFmpegSource2("src\P1222012.MP4",atrack=-1,fpsnum=60000,fpsden=1001,threads=1)

camera_mp4=camera_mp4_01+camera_mp4_02

######## Trim ########

slides_start=2593
slides_end=94658

slides=BlankClip(slides_mp4,length=2196,color=color_black)+slides_mp4
slides=BlankClip(slides_mp4,length=slides_start,color=color_black)+Trim(slides,slides_start,slides_end)

######## Pre Combine ########

fade_length=60



camera_scaled=Crop(camera_mp4,0,0,-1920/4,0)
camera_scaled=Lanczos4Resize(camera_scaled,Width(camera_scaled)/4,Height(camera_scaled)/4)
slides_overlay=Overlay(slides,camera_scaled,Width(slides)*13/16,Height(slides)*0/8)

######## Combine ########

# camera_mp4    0
# slides_mp4    2196



talk_t01=Dissolve(Trim(camera_mp4,0,slides_start-1+fade_length),Trim(slides_overlay,slides_start,0),fade_length)
talk=Dissolve(talk_t01,Trim(camera_mp4,Framecount(slides)-fade_length,0),fade_length)

talk=FADE_OUT_WITH_BRIGHTNESS_OFFSET(FADE_IN_WITH_BRIGHTNESS_OFFSET(talk,fade_length*2),fade_length*2)

######## Music ########

AudioDub(talk,FadeOut0(FadeIn0(camera_mp4,fade_length*2),fade_length*2))



ConvertToRGB32(matrix="Rec709")

######## Subtitle ########

#global subtitle_heavy_halo_width=1
global subtitle_clip_width=1920
global subtitle_clip_height=1080

subtitle_x=50*2.25
subtitle_y=393*2.25
global subtitle_front_fade_count=60
global subtitle_rear_fade_count=60
global subtitle_font="MS Gothic"
global subtitle_effects="b"
global subtitle_size=32*2.25
global subtitle_text_color=color_white
global subtitle_halo_color=color_black
global subtitle_random_char_func="RANDOM_JIS_CHAR"

function SUBTITLE_FX(clip clip,string text,float x,float y,int start_frame,int end_frame,bool "is_title"){
	is_title=Default(is_title,false)

	halo_color=is_title?color_pink:subtitle_halo_color

	return SUBTITLE_FX_RANDOM_STRING(clip,text,Round(x),Round(y),start_frame,end_frame,subtitle_front_fade_count,subtitle_rear_fade_count,subtitle_font,subtitle_effects,Round(subtitle_size),subtitle_text_color,halo_color,"ex_thick",subtitle_random_char_func)
}

SUBTITLE_FX("Discover Insane Possibility of Go Slice Usage|from Runtime Source Code",-subtitle_x,subtitle_x,740,1090,true)

SUBTITLE_FX("- edited by fielia@AVISynth",-subtitle_x,subtitle_y,94500,94800)

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
