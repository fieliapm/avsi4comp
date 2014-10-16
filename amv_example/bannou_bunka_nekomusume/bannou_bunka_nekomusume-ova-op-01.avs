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



Import("bannou_bunka_nekomusume-ova-common.avsi")

######## Pre Combine ########

bannou_bunka_nekomusume_ova_origin_op_01_02_looped=Loop(bannou_bunka_nekomusume_ova_origin_op_01_02,3,22+2,112-1)

bannou_bunka_nekomusume_ova_origin_op_01_02_looped=Loop(bannou_bunka_nekomusume_ova_origin_op_01_02_looped,0,280+2,288-2) # 9 -5
bannou_bunka_nekomusume_ova_origin_op_01_02_looped=Loop(bannou_bunka_nekomusume_ova_origin_op_01_02_looped,0,271+2,279-3) # 9 -4
bannou_bunka_nekomusume_ova_origin_op_01_02_looped=Loop(bannou_bunka_nekomusume_ova_origin_op_01_02_looped,0,261+2,270-3) # 10 -5
bannou_bunka_nekomusume_ova_origin_op_01_02_looped=Loop(bannou_bunka_nekomusume_ova_origin_op_01_02_looped,0,253+2,260-2) # 8 -4
bannou_bunka_nekomusume_ova_origin_op_01_02_looped=Loop(bannou_bunka_nekomusume_ova_origin_op_01_02_looped,0,244+2,252-3) # 9 -4
bannou_bunka_nekomusume_ova_origin_op_01_02_looped=Loop(bannou_bunka_nekomusume_ova_origin_op_01_02_looped,0,234+2,243-3) # 10 -5
bannou_bunka_nekomusume_ova_origin_op_01_02_looped=Loop(bannou_bunka_nekomusume_ova_origin_op_01_02_looped,0,226+2,233-2) # 8 -4
bannou_bunka_nekomusume_ova_origin_op_01_02_looped=Loop(bannou_bunka_nekomusume_ova_origin_op_01_02_looped,0,217+2,225-2) # 9 -5

######## Combine ########

# beginning 13
# bannou_bunka_nekomusume_ova_origin_op_01_01 284
# bannou_bunka_nekomusume_ova_origin_op_01_02 570
# bannou_bunka_nekomusume_ova_origin_op_01_03 1142
# bannou_bunka_nekomusume_ova_origin_op_01_04 4755



bannou_bunka_nekomusume_ova_op_01_t01=BlankClip(bannou_bunka_nekomusume_ova_origin_op_01,length=13,color=color_black)+TRIM_FIRST_CLIP(bannou_bunka_nekomusume_ova_01_snow_city,271)+bannou_bunka_nekomusume_ova_origin_op_01_01+bannou_bunka_nekomusume_ova_origin_op_01_02_looped

bannou_bunka_nekomusume_ova_op_01_t02=bannou_bunka_nekomusume_ova_origin_op_01_03
bannou_bunka_nekomusume_ova_op_01_t03=TRIM_MIDDLE_CLIP(bannou_bunka_nekomusume_ova_03_robot_come_into_basketball_court,71)+TRIM_FIRST_CLIP(bannou_bunka_nekomusume_ova_01_kyouko_and_arisa_thumb_up,48)+TRIM_FIRST_CLIP(bannou_bunka_nekomusume_ova_03_nukunuku_evade_blade,92)+TRIM_MIDDLE_CLIP(bannou_bunka_nekomusume_ova_02_beach,57)
bannou_bunka_nekomusume_ova_op_01_t04=TRIM_LAST_CLIP(bannou_bunka_nekomusume_ova_01_nukunuku_ride_bicycle_across_building,161) \
	+TRIM_MIDDLE_CLIP(bannou_bunka_nekomusume_ova_03_nukunuku_jump_to_catch_ball_01,39)+TRIM_MIDDLE_CLIP(bannou_bunka_nekomusume_ova_02_nukunuku_climb_tree,35)+TRIM_LAST_CLIP(bannou_bunka_nekomusume_ova_01_nukunuku_prepare_to_land,44) \
	+TRIM_FIRST_CLIP(bannou_bunka_nekomusume_ova_02_nukunuku_and_yoshimi_splash_water_on_ryuunosuke,161)+TRIM_FIRST_CLIP(bannou_bunka_nekomusume_ova_01_nukunuku_stop_bicycle,144)

bannou_bunka_nekomusume_ova_op_01_t05=TRIM_FIRST_CLIP(bannou_bunka_nekomusume_ova_03_chibi_nuku_launch_gun,140)+TRIM_MIDDLE_CLIP(bannou_bunka_nekomusume_ova_03_nukunuku_want_to_persue_akiko_and_kyuusaku,139)

bannou_bunka_nekomusume_ova_op_01_t06=TRIM_MIDDLE_CLIP(bannou_bunka_nekomusume_ova_02_kyouko_drive_boat_and_close_to_ryuunosuke,69)+TRIM_LAST_CLIP(bannou_bunka_nekomusume_ova_01_nukunuku_face_helicopter_s_attack,70)+TRIM_LAST_CLIP(bannou_bunka_nekomusume_ova_02_nukunuku_swim_under_sea_01,70)+TRIM_LAST_CLIP(bannou_bunka_nekomusume_ova_03_robot_appear,70) \
	+TRIM_LAST_CLIP(bannou_bunka_nekomusume_ova_02_nukunuku_take_off_her_clothes,69)+TRIM_FIRST_CLIP(bannou_bunka_nekomusume_ova_03_kyouko_fall,70)+TRIM_LAST_CLIP(bannou_bunka_nekomusume_ova_01_armor_target_nukunuku,70)+TRIM_FIRST_CLIP(bannou_bunka_nekomusume_ova_02_dress_fly,55)
bannou_bunka_nekomusume_ova_op_01_t07=TRIM_MIDDLE_CLIP(bannou_bunka_nekomusume_ova_03_nukunuku_throw_ball_to_robot,71)+TRIM_MIDDLE_CLIP(bannou_bunka_nekomusume_ova_02_kyouko_and_yoshimi_get_hurt,48)+TRIM_MIDDLE_CLIP(bannou_bunka_nekomusume_ova_01_nukunuku_catch_armor,91)+TRIM_MIDDLE_CLIP(bannou_bunka_nekomusume_ova_02_nukunuku_ryuunosuke_yoshimi_go_03,57)
bannou_bunka_nekomusume_ova_op_01_t08=TRIM_LAST_CLIP(bannou_bunka_nekomusume_ova_02_arisa_kyouko_nukunuku_pull_ryuunosuke,161)+TRIM_FIRST_CLIP(bannou_bunka_nekomusume_ova_01_helicopter_search_car,118)+TRIM_LAST_CLIP(bannou_bunka_nekomusume_ova_01_nukunuku_throw_wood,161)+TRIM_LAST_CLIP(bannou_bunka_nekomusume_ova_03_nukunuku_ryuunosuke_kyuusaku_escape_from_home,145)

bannou_bunka_nekomusume_ova_op_01_t09=TRIM_MIDDLE_CLIP(bannou_bunka_nekomusume_ova_03_arisa_talk_with_kyouko,139)+TRIM_FIRST_CLIP(bannou_bunka_nekomusume_ova_01_nukunuku_fold_up_quilt,139)+TRIM_FIRST_CLIP(bannou_bunka_nekomusume_ova_02_akiko_and_yoshimi_wear_dress,139)+TRIM_LAST_CLIP(bannou_bunka_nekomusume_ova_03_kyouko_begin_to_fall,126)

bannou_bunka_nekomusume_ova_op_01_t10=bannou_bunka_nekomusume_ova_origin_op_01_04+BlankClip(bannou_bunka_nekomusume_ova_origin_op_01,length=24*5,color=color_black)



bannou_bunka_nekomusume_ova_op_01_mute=bannou_bunka_nekomusume_ova_op_01_t01 \
	+bannou_bunka_nekomusume_ova_op_01_t02+bannou_bunka_nekomusume_ova_op_01_t03+bannou_bunka_nekomusume_ova_op_01_t04 \
	+bannou_bunka_nekomusume_ova_op_01_t05 \
	+bannou_bunka_nekomusume_ova_op_01_t06+bannou_bunka_nekomusume_ova_op_01_t07+bannou_bunka_nekomusume_ova_op_01_t08 \
	+bannou_bunka_nekomusume_ova_op_01_t09 \
	+bannou_bunka_nekomusume_ova_op_01_t10

######## Music ########

bgm_48khz=SSRC(WAVSource("src\bannou_bunka_nekomusume-ova-sutamani_series-03.wav"),48000)
AudioDub(bannou_bunka_nekomusume_ova_op_01_mute,bgm_48khz)



thumbnail=Trim(2115,-118)

######## Subtitle ########

global subtitle_clip_width=640
global subtitle_clip_height=480

global subtitle_x=50
global subtitle_y=400
global subtitle_front_fade_count=8
global subtitle_rear_fade_count=8
global subtitle_font="MS Gothic"
global subtitle_effects="b"
global subtitle_size=28
global subtitle_text_color=OVERWRITE_COLOR_ALPHA(color_white,$3F)
global subtitle_halo_color=color_black

function SUBTITLE_FX(clip clip,string text,float x,float y,int start_frame,int end_frame,bool "is_furigana",bool "is_title"){
	is_title=Default(is_title,false)
	is_furigana=Default(is_furigana,false)

	text_color=is_title?color_pink:subtitle_text_color
	size=is_furigana?subtitle_size*0.5:subtitle_size
	y=is_furigana?y-size:y

	return SUBTITLE_FX_FADE_IN_FADE_OUT(clip,text,Round(x),Round(y),start_frame,end_frame,subtitle_front_fade_count,subtitle_rear_fade_count,subtitle_font,subtitle_effects,Round(size),text_color,subtitle_halo_color)
}



SUBTITLE_FX("私にハッピーバースデイ//林原めぐみ|- by fielia@AVISynth",subtitle_x,subtitle_y-subtitle_size,862,1120,is_title=true)



function REPEAT_SUBTITLE(clip clip,int start_frame){
	clip=SUBTITLE_FX(clip,"出逢う時はいつでも happy birthday",subtitle_x,subtitle_y,start_frame-5,start_frame+133)
	clip=SUBTITLE_FX(clip,"新品の私が手を振る",subtitle_x,subtitle_y,start_frame+155,start_frame+272)
	clip=SUBTITLE_FX(clip,"天使が微笑んでる happy birthday",subtitle_x,subtitle_y,start_frame+274,start_frame+415)
	clip=SUBTITLE_FX(clip,"今すぐに逢いたいの 気ままなあなたに",subtitle_x,subtitle_y,start_frame+435,start_frame+583)
	return clip
}



SUBTITLE_FX("取り巻く secret 謎めく hysteric",subtitle_x,subtitle_y,1138,1266)
SUBTITLE_FX("踊れよ clap your hands 今日からは",subtitle_x,subtitle_y,1278,1388)
SUBTITLE_FX("不思議な my body 目を伏せないで",subtitle_x,subtitle_y,1417,1545)
SUBTITLE_FX("洒落た process 始まりね",subtitle_x,subtitle_y,1555,1681)

SUBTITLE_FX("風受けて 髪揺れる 何もかもが眩しい",subtitle_x,subtitle_y,1683,1947)

REPEAT_SUBTITLE(1954)

SUBTITLE_FX("煌めく mistery 焦れてる history",subtitle_x,subtitle_y,2811,2940)
SUBTITLE_FX("全てが jumping up 今日からは",subtitle_x,subtitle_y,2950,3062)
SUBTITLE_FX("輝く my body 待ち焦がれてる",subtitle_x,subtitle_y,3090,3217)
SUBTITLE_FX("slim な恋の始まりね",subtitle_x,subtitle_y,3229,3355)

SUBTITLE_FX("窓越しの光だって 勇気をくれる気がする",subtitle_x,subtitle_y,3356,3618)

SUBTITLE_FX("鏡の中笑って happy birthday",subtitle_x,subtitle_y,3622,3762)
SUBTITLE_FX("思うまま飛び立つのよ moving heart",subtitle_x,subtitle_y,3784,3900)
SUBTITLE_FX("胸騒ぎの予感は happy birthday",subtitle_x,subtitle_y,3901,4039)
SUBTITLE_FX("憧れじゃ届かない 気ままなあなたに",subtitle_x,subtitle_y,4062,4212)

SUBTITLE_FX("気まぐれを着飾って 外に出ようよ 今すぐ",subtitle_x,subtitle_y,4750,5012)

REPEAT_SUBTITLE(5021)



bannou_bunka_nekomusume_ova_02_eyecatch++ConvertToYV12(last)



#thumbnail

######## Post Processing ########

ConvertToYV12()
#ConvertToYUY2()
#ConvertToRGB24()

TCPServer()
