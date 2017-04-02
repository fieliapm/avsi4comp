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

fade_length=12

######## Combine ########

koufuku_graffiti_tv_sponser_t01=Loop(koufuku_graffiti_tv_04_ryou_bite_food_chan,13)



koufuku_graffiti_tv_sponser_mute=koufuku_graffiti_tv_sponser_t01

######## Music ########

bgm_48khz=SSRC(WAVSource("src\koufuku_graffiti-tv-ed-02.wav"),48000)
AudioDub(koufuku_graffiti_tv_sponser_mute,bgm_48khz)



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

ConvertToRGB32()

koufuku_graffiti_tv_sponser_frame_count=Framecount(koufuku_graffiti_tv_sponser_mute)

SUBTITLE_FX("ô‚²‚Í‚ñ‚Ì—ûK//ƒŠƒ‡ƒE&‚«‚è‚ñ(²“¡—˜“Ş&‘å‹T‚ ‚·‚©)|- by fielia@AVISynth",-subtitle_x,subtitle_y-subtitle_size,0,koufuku_graffiti_tv_sponser_frame_count,true)

SUBTITLE_FX("’ñ‹Ÿ||’†‰›“®‰æ•”||ô’‹‚²‚Í‚ñ‚ğH‚×‚æ‚¤‚æô",subtitle_clip_width/2,100*2.25,0,koufuku_graffiti_tv_sponser_frame_count)



#thumbnail

######## Post Processing ########

ConvertToYV12()
#ConvertToYUY2()
#ConvertToRGB24()

TCPServer()
