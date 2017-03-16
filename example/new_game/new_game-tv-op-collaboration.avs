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
Import("new_game-tv-common.avsi")

######## Source ########

#new_game_tv_11_op=FFMS2_VIDEO_SOURCE("..\new_game-tv-11-op.avi")
#new_game_tv_op=FFMS2_VIDEO_SOURCE("..\new_game-tv-op.avi")

new_game_tv_11_op=TCPSource("localhost",22051,"None")
new_game_tv_op=TCPSource("localhost",22052,"None")

######## Function ########

#global subtitle_heavy_halo_width=1
global subtitle_clip_width=428
global subtitle_clip_height=240

subtitle_x=50*0.5
subtitle_y=395*0.5
global subtitle_front_fade_count=24
global subtitle_rear_fade_count=24
global subtitle_font="MS Gothic"
global subtitle_effects="b"
global subtitle_size=32*0.5
global subtitle_text_color=color_white
global subtitle_halo_color=color_darkcyan

function SUBTITLE_N(clip clip,string text,int "x",int "y",int "first_frame",int "last_frame",bool "is_title"){
	is_title=Default(is_title,false)
	x=Default(x,subtitle_clip_width/2)

	halo_color=is_title?color_red:subtitle_halo_color
	size=is_title?subtitle_size*2:subtitle_size
	y=is_title?subtitle_clip_height/2:y

	return SUBTITLE_NORMAL(clip,text,x,y,first_frame,last_frame,subtitle_font,subtitle_effects+"c",Round(size),subtitle_text_color,halo_color)
}

######## Combine ########

# new_game_tv_11_op 0



aoba_yun_hajime_watch_fairies_story_3_01=TRIM_FIRST_CLIP(new_game_tv_11_aoba_yun_hajime_watch_fairies_story_3_and_excited,75)
aoba_yun_hajime_watch_fairies_story_3_01=SUBTITLE_N(aoba_yun_hajime_watch_fairies_story_3_01,"à¢~~~",y=Round(subtitle_y),first_frame=10,last_frame=40)

aoba_yun_hajime_watch_fairies_story_3_04=new_game_tv_11_aoba_yun_hajime_watch_fairies_story_3
aoba_yun_hajime_watch_fairies_story_3_04=SUBTITLE_N(aoba_yun_hajime_watch_fairies_story_3_04,"îáûÈà¢",y=Round(subtitle_y),first_frame=15,last_frame=40)
aoba_yun_hajime_watch_fairies_story_3_04=SUBTITLE_N(aoba_yun_hajime_watch_fairies_story_3_04,"ä≈íòé©å»ô“‰oìIóVùEñ ê¢",y=Round(subtitle_y),first_frame=50,last_frame=130)
aoba_yun_hajime_watch_fairies_story_3_04=SUBTITLE_N(aoba_yun_hajime_watch_fairies_story_3_04,"å¥ò“ê•îáéÌä¥ÊS",y=Round(subtitle_y),first_frame=140,last_frame=215)

aoba_yun_hajime_watch_fairies_story_3=ConvertToYV12(aoba_yun_hajime_watch_fairies_story_3_01) \
	++new_game_tv_11_hajime_watch_fairies_story_3+new_game_tv_11_yun_watch_fairies_story_3+ConvertToYV12(aoba_yun_hajime_watch_fairies_story_3_04)



umiko_and_tired_programmer_01=new_game_tv_10_umiko_and_tired_programmer
umiko_and_tired_programmer_02=new_game_tv_10_umiko_say_there_is_more_bug_than_expected

umiko_and_tired_programmer_01=SUBTITLE_N(umiko_and_tired_programmer_01,"ìﬂå¬...",y=Round(subtitle_y),first_frame=55,last_frame=80)
umiko_and_tired_programmer_02=SUBTITLE_N(umiko_and_tired_programmer_02,"àˆà◊ POH8 âëËíˆéÆ·˘ìI bug ëæëΩ|ëÂâ∆ìsó›ö”óπ",y=Round(subtitle_y-subtitle_size),first_frame=10,last_frame=105)



umiko_and_tired_programmer=ConvertToYV12(umiko_and_tired_programmer_01++umiko_and_tired_programmer_02)



new_game_tv_op_sp=new_game_tv_11_op++Normalize(aoba_yun_hajime_watch_fairies_story_3)++Trim(new_game_tv_op,0,5603)++Normalize(umiko_and_tired_programmer)

new_game_tv_op_sp

######## Post Processing ########

ConvertToYV12()
#ConvertToYUY2()
#ConvertToRGB24

TCPServer()
