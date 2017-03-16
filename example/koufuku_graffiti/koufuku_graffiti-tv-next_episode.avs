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
Import("koufuku_graffiti-tv-common.avsi")

######## Pre Combine ########

fade_length=5

koufuku_graffiti_tv_12_end_last_frame=Framecount(koufuku_graffiti_tv_12_end)-1
koufuku_graffiti_tv_12_end_extend=Loop(koufuku_graffiti_tv_12_end,24*6,koufuku_graffiti_tv_12_end_last_frame,koufuku_graffiti_tv_12_end_last_frame)

######## Combine ########

# koufuku_graffiti_tv_01_next_episode_01 -5
# koufuku_graffiti_tv_01_next_episode_12 5446

koufuku_graffiti_tv_01_next_episode_01_00=Trim(koufuku_graffiti_tv_01_next_episode_01,0,4)
koufuku_graffiti_tv_01_next_episode_01_01=Trim(koufuku_graffiti_tv_01_next_episode_01,5,0)

koufuku_graffiti_tv_next_episode_t01=Dissolve(koufuku_graffiti_tv_01_next_episode_01_01,koufuku_graffiti_tv_02_next_episode_01,koufuku_graffiti_tv_03_next_episode_01,fade_length+1)
koufuku_graffiti_tv_next_episode_t02=Dissolve(koufuku_graffiti_tv_04_next_episode_01,koufuku_graffiti_tv_05_next_episode_01,koufuku_graffiti_tv_06_next_episode_01,fade_length)
koufuku_graffiti_tv_next_episode_t03=Dissolve(koufuku_graffiti_tv_07_next_episode_01,koufuku_graffiti_tv_08_next_episode_01,koufuku_graffiti_tv_09_next_episode_01,fade_length+1)
koufuku_graffiti_tv_next_episode_t04=Dissolve(koufuku_graffiti_tv_10_next_episode_01,koufuku_graffiti_tv_11_next_episode_01,koufuku_graffiti_tv_12_end_extend,fade_length)



koufuku_graffiti_tv_next_episode_mute=Dissolve(koufuku_graffiti_tv_next_episode_t01,koufuku_graffiti_tv_next_episode_t02,koufuku_graffiti_tv_next_episode_t03,koufuku_graffiti_tv_next_episode_t04,fade_length)

######## Music ########

bgm_48khz=SSRC(WAVSource("src\koufuku_graffiti-tv-ed-03.wav"),48000)
AudioDub(koufuku_graffiti_tv_next_episode_mute,bgm_48khz)

AUDIO_DUB_TONE(koufuku_graffiti_tv_01_next_episode_01_00,samplerate=48000,channels=2,type="Silence")++last



thumbnail=Trim(0,-24*5)

######## Subtitle ########

#global subtitle_heavy_halo_width=1
global subtitle_clip_width=1920
global subtitle_clip_height=1080

subtitle_x=50*2.25
subtitle_y=390*2.25
global subtitle_front_fade_count=8
global subtitle_rear_fade_count=8
global subtitle_font="MS Gothic"
global subtitle_effects="bc"
global subtitle_size=40*2.25
global subtitle_text_color=color_white
global subtitle_halo_color=color_black

function SUBTITLE_FX(clip clip,string text,float x,float y,int start_frame,int end_frame,bool "is_title"){
	is_title=Default(is_title,false)

	text_color=is_title?color_pink:subtitle_text_color
	effects=is_title?"b":subtitle_effects
	size=is_title?20*2.25:subtitle_size
	y=is_title?y+(subtitle_size*2)-(size*2):y

	return SUBTITLE_FX_FADE_IN_FADE_OUT(clip,text,Round(x),Round(y),start_frame,end_frame,subtitle_front_fade_count,subtitle_rear_fade_count,subtitle_font,effects,Round(size),text_color,subtitle_halo_color,"ex_thick")
}

koufuku_graffiti_tv_next_episode_frame_count=Framecount()

SUBTITLE_FX("♪しあわせグラフィティ//リョウ&きりん(佐藤利奈&大亀あすか)|- by fielia@AVISynth",-subtitle_x,subtitle_y-subtitle_size,0,koufuku_graffiti_tv_next_episode_frame_count,true)

SUBTITLE_FX("次回||ふたしなめ||『中央歌謡グラフィティ』",subtitle_clip_width/2,100*2.25,0,koufuku_graffiti_tv_next_episode_frame_count)



#thumbnail

######## Post Processing ########

ConvertToYV12()
#ConvertToYUY2()
#ConvertToRGB24()

TCPServer()
