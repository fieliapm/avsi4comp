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



MP_Pipeline("""

### inherit start ###

Import("..\..\avsi4comp\avsi4comp.avsi")

Import("new_game-tv-season_01-common-cross_process-11-op.avsi")

### inherit end ###

######## Pre Combine ########

######## Combine ########

# new_game_tv_season_01_11_fairies_story_3_op 0



new_game_tv_season_01_11_op_t01=new_game_tv_season_01_11_fairies_story_3_op



new_game_tv_season_01_11_op_mute=new_game_tv_season_01_11_op_t01

new_game_tv_season_01_11_op_mute

### export clip: new_game_tv_season_01_11_op_mute

### prefetch: 5,2

### ###

######## Subtitle ########

### inherit start ###

#global subtitle_heavy_halo_width=1
global subtitle_clip_width=1920
global subtitle_clip_height=1080

subtitle_x=50*2.25
subtitle_y=395*2.25
global subtitle_front_fade_count=8
global subtitle_rear_fade_count=8
global subtitle_font="MS Gothic"
global subtitle_effects="b"
global subtitle_size=32*2.25
global subtitle_text_color=color_white
global subtitle_halo_color=color_darkcyan

function SUBTITLE_FX(clip clip,string text,float x,float y,int start_frame,int end_frame,bool "is_title"){
	is_title=Default(is_title,false)

	halo_color=is_title?color_mediumpurple:subtitle_halo_color

	return SUBTITLE_FX_FADE_IN_FADE_OUT(clip,text,Round(x),Round(y),start_frame,end_frame,subtitle_front_fade_count,subtitle_rear_fade_count,subtitle_font,subtitle_effects,Round(subtitle_size),subtitle_text_color,halo_color,"ex_thick_reduce_memory")
}

### inherit end ###

ConvertToRGB32(matrix="Rec709")

SUBTITLE_FX("皎潔が招くほら",subtitle_x,subtitle_y-subtitle_size,382,470)
SUBTITLE_FX("終わりの園",subtitle_x,subtitle_y,475,551)
SUBTITLE_FX("(醤油)",subtitle_x,subtitle_x,532,572)
SUBTITLE_FX("破壊されし色語る",subtitle_x,subtitle_y-subtitle_size,558,653)
SUBTITLE_FX("絶望の夜",subtitle_x,subtitle_y,657,744)

SUBTITLE_FX("打開せんと向かう",subtitle_x,subtitle_y-subtitle_size,750,836)
SUBTITLE_FX("いばらの道",subtitle_x,subtitle_y,842,919)
SUBTITLE_FX("(西洋)",subtitle_x,subtitle_x,900,941)
SUBTITLE_FX("血潮舞う戦いが",subtitle_x,subtitle_y-subtitle_size,925,1020)
SUBTITLE_FX("待ち受けていようと...も",subtitle_x,subtitle_y,1026,1208)

SUBTITLE_FX("掲げよう",subtitle_x,subtitle_y-subtitle_size,1209,1285)
SUBTITLE_FX("祈りの羽を",subtitle_x,subtitle_y,1286,1392)
SUBTITLE_FX("散らばった",subtitle_x,subtitle_y-subtitle_size,1394,1477)
SUBTITLE_FX("魔法の混迷",subtitle_x,subtitle_y,1476,1577)

SUBTITLE_FX("咲かせよう",subtitle_x,subtitle_y-subtitle_size,1576,1656)
SUBTITLE_FX("平和の花を",subtitle_x,subtitle_y,1653,1759)
SUBTITLE_FX("痛みさえ",subtitle_x,subtitle_y-subtitle_size,1761,1841)
SUBTITLE_FX("勇気と力へ",subtitle_x,subtitle_y,1843,2029)

SUBTITLE_FX("祈りの羽//en|- by fielia@AVISynth",subtitle_x,subtitle_x,1950,2100,true)

######## Thumbnail ########

is_thumbnail=false

is_thumbnail?new_game_tv_season_01_11_op_mute:last

######## Music ########

bgm_48khz=Normalize(new_game_tv_season_01_11_fairies_story_3_op)
AudioDub(bgm_48khz)



thumbnail=Trim(1285,-24*5)



ConvertToRGB32(new_game_tv_season_01_11_fairies_story_3_op_trademark,matrix="Rec709")++last



is_thumbnail?thumbnail:last

""")

######## Post Processing ########

ConvertToYV12(matrix="Rec709")
#ConvertToYUY2(matrix="Rec709")
#ConvertToRGB24()

TCPServer(22051)
