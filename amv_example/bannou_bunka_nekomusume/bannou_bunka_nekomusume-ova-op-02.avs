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



limited_font=subtitle_font
limited_effects=subtitle_effects
limited_size=44
limited_text_color=color_pink
limited_halo_color=subtitle_halo_color

mosaic_area_size=Round(limited_size*3)
mosaic_01_x=125
mosaic_01_y=320
mosaic_02_x=220
mosaic_02_y=245

mask_base=BlankClip(bannou_bunka_nekomusume_ova_origin_op_02_01,color=color_black)
mask=Overlay(mask_base,BlankClip(bannou_bunka_nekomusume_ova_origin_op_02_01,width=mosaic_area_size,height=mosaic_area_size,color=color_white),x=Round(mosaic_01_x*1.5),y=Round(mosaic_01_y*1.5),opacity=1.0)
mask=Overlay(mask,BlankClip(bannou_bunka_nekomusume_ova_origin_op_02_01,width=mosaic_area_size,height=mosaic_area_size,color=color_white),x=Round(mosaic_02_x*1.5),y=Round(mosaic_02_y*1.5),opacity=1.0)
bannou_bunka_nekomusume_ova_origin_op_02_01_mosaic=MOSAIC_MASK(bannou_bunka_nekomusume_ova_origin_op_02_01,mask,24.0)
bannou_bunka_nekomusume_ova_origin_op_02_01_mosaic=SUBTITLE_NORMAL(bannou_bunka_nekomusume_ova_origin_op_02_01_mosaic,"禁",mosaic_01_x+(limited_size/2),mosaic_01_y+(limited_size/2),font=limited_font,effects=limited_effects,size=limited_size,text_color=limited_text_color,halo_color=limited_halo_color)
bannou_bunka_nekomusume_ova_origin_op_02_01_mosaic=SUBTITLE_NORMAL(bannou_bunka_nekomusume_ova_origin_op_02_01_mosaic,"禁",mosaic_02_x+(limited_size/2),mosaic_02_y+(limited_size/2),font=limited_font,effects=limited_effects,size=limited_size,text_color=limited_text_color,halo_color=limited_halo_color)

bannou_bunka_nekomusume_ova_origin_op_02_01_mosaic=OVERWRITE_RANGE(bannou_bunka_nekomusume_ova_origin_op_02_01,ConvertToYV12(bannou_bunka_nekomusume_ova_origin_op_02_01_mosaic),1105,1178)

######## Combine ########

# bannou_bunka_nekomusume_ova_origin_op_02_01 7
# bannou_bunka_nekomusume_ova_origin_op_02_03 5069
# bannou_bunka_nekomusume_ova_origin_op_02_04 5393



bannou_bunka_nekomusume_ova_origin_op_02_t01=BlankClip(bannou_bunka_nekomusume_ova_origin_op_02,length=7,color=color_black)+bannou_bunka_nekomusume_ova_origin_op_02_01_mosaic
bannou_bunka_nekomusume_ova_origin_op_02_t02=bannou_bunka_nekomusume_ova_origin_op_02_02
bannou_bunka_nekomusume_ova_origin_op_02_t03=TRIM_FIRST_CLIP(bannou_bunka_nekomusume_ova_05_waitress_nukunuku_wake_up_02,72)+TRIM_MIDDLE_CLIP(bannou_bunka_nekomusume_ova_04_kyusaku_forget_eimi,94) \
	+TRIM_MIDDLE_CLIP(bannou_bunka_nekomusume_ova_04_akiko_say_goodbye_on_car,72)+TRIM_MIDDLE_CLIP(bannou_bunka_nekomusume_ova_06_nukunuku_let_yarn_ball_go_02,94)+TRIM_MIDDLE_CLIP(bannou_bunka_nekomusume_ova_05_nukunuku_collide_truck,41)

bannou_bunka_nekomusume_ova_origin_op_02_t04=TRIM_FIRST_CLIP(bannou_bunka_nekomusume_ova_06_nukunuku_make_scarf,84+67)

bannou_bunka_nekomusume_ova_origin_op_02_t05=TRIM_MIDDLE_CLIP(bannou_bunka_nekomusume_ova_06_nukunuku_and_eimi_take_a_break_in_space,94)+TRIM_MIDDLE_CLIP(bannou_bunka_nekomusume_ova_06_satellite_hammer_throw_nukunuku,72)+TRIM_LAST_CLIP(bannou_bunka_nekomusume_ova_04_arisa_and_kyouko_play_poker,99)+TRIM_MIDDLE_CLIP(bannou_bunka_nekomusume_ova_05_nukunuku_ride_bicycle,68) \
	+TRIM_MIDDLE_CLIP(bannou_bunka_nekomusume_ova_06_nukunuku_and_eimi_burst_01,94)+TRIM_MIDDLE_CLIP(bannou_bunka_nekomusume_ova_05_target_family_restaurant,72)+TRIM_MIDDLE_CLIP(bannou_bunka_nekomusume_ova_05_waitress_nukunuku_say_welcome,161)
bannou_bunka_nekomusume_ova_origin_op_02_t06=TRIM_MIDDLE_CLIP(bannou_bunka_nekomusume_ova_06_nukunuku_feel_sorry_01,21)+TRIM_MIDDLE_CLIP(bannou_bunka_nekomusume_ova_06_nukunuku_is_under_attack_02,63) \
	+TRIM_MIDDLE_CLIP(bannou_bunka_nekomusume_ova_05_waitress_nukunuku_turn_back,20)+TRIM_MIDDLE_CLIP(bannou_bunka_nekomusume_ova_04_eimi_hug_ryuunosuke,62) \
	+TRIM_MIDDLE_CLIP(bannou_bunka_nekomusume_ova_05_nukunuku_ride_bicycle_and_embarassing,21)+TRIM_MIDDLE_CLIP(bannou_bunka_nekomusume_ova_06_akiko_cry,119)+TRIM_MIDDLE_CLIP(bannou_bunka_nekomusume_ova_05_waitress_nukunuku_angry,48)
bannou_bunka_nekomusume_ova_origin_op_02_t07=TRIM_MIDDLE_CLIP(bannou_bunka_nekomusume_ova_04_nukunuku_hide_tsurigane_manjuu,166)+TRIM_MIDDLE_CLIP(bannou_bunka_nekomusume_ova_05_waitress_nukunuku_serve_coffee,166)+TRIM_FIRST_CLIP(bannou_bunka_nekomusume_ova_04_eimi_tear_her_pants_02,41)

bannou_bunka_nekomusume_ova_origin_op_02_t08=TRIM_FIRST_CLIP(bannou_bunka_nekomusume_ova_04_building_broken,84)+TRIM_MIDDLE_CLIP(bannou_bunka_nekomusume_ova_04_nukunuku_jump_onto_robot,83)+TRIM_MIDDLE_CLIP(bannou_bunka_nekomusume_ova_05_waitress_arisa_keep_shooting,83)+TRIM_FIRST_CLIP(bannou_bunka_nekomusume_ova_05_waitress_kyouko_shooted_and_feel_happy,41)+TRIM_MIDDLE_CLIP(bannou_bunka_nekomusume_ova_05_waitress_nukunuku_drunk_and_run_03,42) \
	+TRIM_MIDDLE_CLIP(bannou_bunka_nekomusume_ova_06_nukunuku_is_targeted,41)+TRIM_MIDDLE_CLIP(bannou_bunka_nekomusume_ova_06_missile_fire,42)+TRIM_MIDDLE_CLIP(bannou_bunka_nekomusume_ova_06_eimi_counter_01,83)+TRIM_MIDDLE_CLIP(bannou_bunka_nekomusume_ova_05_waitress_nukunuku_evade,41)+TRIM_MIDDLE_CLIP(bannou_bunka_nekomusume_ova_05_waitress_nukunuku_jump_back,42) \
	+TRIM_MIDDLE_CLIP(bannou_bunka_nekomusume_ova_06_satellite_transform_02,83)+TRIM_MIDDLE_CLIP(bannou_bunka_nekomusume_ova_06_satellite_transform_05,84) \
	+TRIM_MIDDLE_CLIP(bannou_bunka_nekomusume_ova_05_waitress_nukunuku_happy,5)+TRIM_MIDDLE_CLIP(bannou_bunka_nekomusume_ova_04_bomb_shock_kyusaku,5)+TRIM_MIDDLE_CLIP(bannou_bunka_nekomusume_ova_06_satomi_sad,5)+TRIM_LAST_CLIP(bannou_bunka_nekomusume_ova_04_ryuunosuke_give_flower_to_akiko,5)

bannou_bunka_nekomusume_ova_origin_op_02_t09=TRIM_FIRST_CLIP(bannou_bunka_nekomusume_ova_06_nukunuku_cheer_up,21)+TRIM_MIDDLE_CLIP(bannou_bunka_nekomusume_ova_04_nukunuku_suddenly_appear,63) \
	+Trim(bannou_bunka_nekomusume_ova_05_waitress_nukunuku_hear_mouse_running,25,-20)+TRIM_LAST_CLIP(bannou_bunka_nekomusume_ova_05_waitress_nukunuku_lick_akiko,62) \
	+TRIM_MIDDLE_CLIP(bannou_bunka_nekomusume_ova_04_nukunuku_evade_eimi_s_attack,22)+TRIM_MIDDLE_CLIP(bannou_bunka_nekomusume_ova_06_ryuunosuke_and_satomi_happy,119)+TRIM_MIDDLE_CLIP(bannou_bunka_nekomusume_ova_06_nukunuku_throw_oil_drum,47)
bannou_bunka_nekomusume_ova_origin_op_02_t10=TRIM_FIRST_CLIP(bannou_bunka_nekomusume_ova_06_akiko_angry_to_kyusaku,72)+TRIM_MIDDLE_CLIP(bannou_bunka_nekomusume_ova_05_kyouko_bother_arisa_repair_weapon,94) \
	+TRIM_MIDDLE_CLIP(bannou_bunka_nekomusume_ova_06_nukunuku_guruguru,72)+TRIM_LAST_CLIP(bannou_bunka_nekomusume_ova_06_ryuunosuke_and_satomi_laugh,94)
bannou_bunka_nekomusume_ova_origin_op_02_t11=bannou_bunka_nekomusume_ova_origin_op_02_03+bannou_bunka_nekomusume_ova_origin_op_02_04+BlankClip(bannou_bunka_nekomusume_ova_origin_op_02,length=24*4,color=color_black)



bannou_bunka_nekomusume_ova_op_02_mute=bannou_bunka_nekomusume_ova_origin_op_02_t01+bannou_bunka_nekomusume_ova_origin_op_02_t02+bannou_bunka_nekomusume_ova_origin_op_02_t03 \
	+bannou_bunka_nekomusume_ova_origin_op_02_t04 \
	+bannou_bunka_nekomusume_ova_origin_op_02_t05+bannou_bunka_nekomusume_ova_origin_op_02_t06+bannou_bunka_nekomusume_ova_origin_op_02_t07 \
	+bannou_bunka_nekomusume_ova_origin_op_02_t08 \
	+bannou_bunka_nekomusume_ova_origin_op_02_t09+bannou_bunka_nekomusume_ova_origin_op_02_t10++bannou_bunka_nekomusume_ova_origin_op_02_t11

######## Music ########

bgm_48khz=SSRC(WAVSource("src\bannou_bunka_nekomusume-ova-sutamani_series-14.wav"),48000)
AudioDub(bannou_bunka_nekomusume_ova_op_02_mute,bgm_48khz)



thumbnail=Trim(2730,-24*5)

######## Subtitle ########

function SUBTITLE_FX(clip clip,string text,float x,float y,int start_frame,int end_frame,bool "is_furigana",bool "is_title"){
	is_title=Default(is_title,false)
	is_furigana=Default(is_furigana,false)

	text_color=is_title?color_pink:subtitle_text_color
	size=is_furigana?subtitle_size*0.5:subtitle_size
	y=is_furigana?y-size:y

	return SUBTITLE_FX_FADE_IN_FADE_OUT(clip,text,Round(x),Round(y),start_frame,end_frame,subtitle_front_fade_count,subtitle_rear_fade_count,subtitle_font,subtitle_effects,Round(size),text_color,subtitle_halo_color)
}



SUBTITLE_FX("夢 Hurry up//林原めぐみ|- by fielia@AVISynth",subtitle_x,subtitle_y-subtitle_size,5569,5730,is_title=true)



function REPEAT_SUBTITLE_01(clip clip,int start_frame){
	clip=SUBTITLE_FX(clip,"私の夢達 乗せて 銀河を走るコースター",subtitle_x,subtitle_y,start_frame-5,start_frame+161)
	clip=SUBTITLE_FX(clip,"スピードぐんぐん上げて",subtitle_x,subtitle_y,start_frame+162,start_frame+251)
	clip=SUBTITLE_FX(clip,"どこまでも走り続けるから",subtitle_x,subtitle_y,start_frame+252,start_frame+354)

	clip=SUBTITLE_FX(clip,"Get up しっかり明日を",subtitle_x,subtitle_y,start_frame+355,start_frame+418)
	clip=SUBTITLE_FX(clip,"見つめてアクセルを踏まなきゃ、今日も",subtitle_x,subtitle_y,start_frame+422,start_frame+521)
	clip=SUBTITLE_FX(clip,"Get up にっくき雲河を",subtitle_x,subtitle_y,start_frame+522,start_frame+584)
	clip=SUBTITLE_FX(clip,"スルリと抜けてゆくわ",subtitle_x,subtitle_y,start_frame+589,start_frame+679)
	return clip
}

function REPEAT_SUBTITLE_02(clip clip,int start_frame){
	clip=SUBTITLE_FX(clip,"Get up しっかり瞳を",subtitle_x,subtitle_y,start_frame-5,start_frame+58)
	clip=SUBTITLE_FX(clip,"開けて行き先を見つけるの、そうよ",subtitle_x,subtitle_y,start_frame+63,start_frame+161)
	clip=SUBTITLE_FX(clip,"Get up すっきり晴れてる",subtitle_x,subtitle_y,start_frame+162,start_frame+224)
	clip=SUBTITLE_FX(clip,"未来へ急げ Hurry up!",subtitle_x,subtitle_y,start_frame+229,start_frame+317)
	return clip
}



SUBTITLE_FX("キラリと光る流れ星",subtitle_x,subtitle_y,684,770)
SUBTITLE_FX("見上げた空に見つけても",subtitle_x,subtitle_y,777,849)
SUBTITLE_FX("            とな",subtitle_x,subtitle_y,850,966,true)
SUBTITLE_FX("願いが唱えきれなかった",subtitle_x,subtitle_y,851,966)
SUBTITLE_FX("あれもしたいし こうしたい…",subtitle_x,subtitle_y,1016,1103)
SUBTITLE_FX("あれこれと欲張りな My heart",subtitle_x,subtitle_y,1111,1182)
SUBTITLE_FX("        あふ        こぼ",subtitle_x,subtitle_y,1183,1298,true)
SUBTITLE_FX("夢が溢れて零れ出す",subtitle_x,subtitle_y,1183,1298)

REPEAT_SUBTITLE_01(1347)

SUBTITLE_FX("遠く無限に広がった",subtitle_x,subtitle_y,2222,2310)
SUBTITLE_FX("宇宙にも負けないくらい",subtitle_x,subtitle_y,2316,2387)
SUBTITLE_FX("パワーを持って 旅をするの",subtitle_x,subtitle_y,2388,2500)
SUBTITLE_FX("ゴールに着いたその日から",subtitle_x,subtitle_y,2555,2641)
SUBTITLE_FX("次のターゲットを目指し",subtitle_x,subtitle_y,2658,2719)
SUBTITLE_FX("また走り出す どこまでも",subtitle_x,subtitle_y,2720,2833)

SUBTITLE_FX("時々 嵐の渦に",subtitle_x,subtitle_y,2882,2964)
SUBTITLE_FX("ハートがびしょ濡れになり",subtitle_x,subtitle_y,2965,3047)
SUBTITLE_FX("幾つも涙の粒を落としても",subtitle_x,subtitle_y,3048,3180)
SUBTITLE_FX("くじ",subtitle_x,subtitle_y,3188,3240,true)
SUBTITLE_FX("挫けたりしないよ",subtitle_x,subtitle_y,3188,3240)

REPEAT_SUBTITLE_02(3245)

REPEAT_SUBTITLE_01(4383)

REPEAT_SUBTITLE_02(5074)



bannou_bunka_nekomusume_ova_04_eyecatch++ConvertToYV12(last)



#thumbnail

######## Post Processing ########

ConvertToYV12()
#ConvertToYUY2()
#ConvertToRGB24()
