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
Import("shingeki_no_kyojin-tv-common-01.avsi")

######## Pre Combine ########

global fade_length=16

shingeki_no_kyojin_tv_op_beginning=DOUBLE_FADE_WITH_BRIGHTNESS_OFFSET_RGB24( \
	PSEUDO_COLOR_GRAY(DOUBLE_FADE_WITH_BRIGHTNESS_OFFSET_RGB24( \
	DOUBLE_FADE_WITH_BRIGHTNESS_OFFSET_RGB24(FadeIn0(TRIM_LAST_CLIP(shingeki_no_kyojin_tv_02_shiganshina_broken_02,128),fade_length),TRIM_MIDDLE_CLIP(shingeki_no_kyojin_tv_01_mikasa_pick_wood,127),fade_length,fade_length), \
	TRIM_MIDDLE_CLIP(shingeki_no_kyojin_tv_02_kyojin_conquer_field,128),fade_length,fade_length)), \
	PSEUDO_COLOR_GRAY_TO_PAPER(TRIM_MIDDLE_CLIP(shingeki_no_kyojin_tv_01_grisha_s_key_02,52),fade_length,51), \
	fade_length,fade_length)



function OVERLAY_BG_AND_CHAR_BLEND(clip bg_clip,string char_clip){
	return ScriptClip(bg_clip,"Overlay("+char_clip+",opacity=Spline(current_frame,0,0.0,64-fade_length/2,0.0,64+fade_length/2,0.7,Framecount()-1,0.7,cubic=false),mode="+DOUBLE_QUOTE_STRING("Blend")+")")
}

shingeki_no_kyojin_tv_10_dot_pixis_plan=OVERLAY_BG_AND_CHAR_BLEND(shingeki_no_kyojin_tv_10_dot_pixis_talking_01,"shingeki_no_kyojin_tv_10_eren_watch_his_kyojin")

######## Combine ########

# beginning 66
# shingeki_no_kyojin_tv_clean_op_01_01 501
# shingeki_no_kyojin_tv_clean_op_01_04 6247
# shingeki_no_kyojin_tv_clean_op_01_05 7277



shingeki_no_kyojin_tv_op_01_t01=BlankClip(shingeki_no_kyojin_tv_clean_op_01,length=66,color=color_black)+shingeki_no_kyojin_tv_op_beginning+shingeki_no_kyojin_tv_clean_op_01_01
shingeki_no_kyojin_tv_op_01_t02=shingeki_no_kyojin_tv_clean_op_01_02+shingeki_no_kyojin_tv_clean_op_01_03
shingeki_no_kyojin_tv_op_01_t03=TRIM_MIDDLE_CLIP(shingeki_no_kyojin_tv_03_eren_dash,126)+TRIM_MIDDLE_CLIP(shingeki_no_kyojin_tv_05_soldiers_moving_forward,127) \
	+TRIM_LAST_CLIP(shingeki_no_kyojin_tv_04_eren_dash_around_02,63)+TRIM_MIDDLE_CLIP(shingeki_no_kyojin_tv_04_sasha_dash_downward_02,64)+TRIM_FIRST_CLIP(shingeki_no_kyojin_tv_13_armin_ask_kyojin_eren_move_stone,159)

shingeki_no_kyojin_tv_op_01_t04=TRIM_MIDDLE_CLIP(shingeki_no_kyojin_tv_01_survey_corps_attack_kyojin_02,64)+TRIM_MIDDLE_CLIP(shingeki_no_kyojin_tv_12_annie_jean_connie_run_away,64)+TRIM_LAST_CLIP(shingeki_no_kyojin_tv_04_eren_dash_around_01,64)+TRIM_MIDDLE_CLIP(shingeki_no_kyojin_tv_03_sasha_starve_02,31)
shingeki_no_kyojin_tv_op_01_t05=TRIM_LAST_CLIP(shingeki_no_kyojin_tv_07_mikasa_iaido_01,64)+TRIM_FIRST_CLIP(shingeki_no_kyojin_tv_07_mikasa_iaido_02+shingeki_no_kyojin_tv_07_mikasa_iaido_03,64)+TRIM_FIRST_CLIP(shingeki_no_kyojin_tv_06_yumir_lean_on_historia,127)

shingeki_no_kyojin_tv_op_01_t06=TRIM_MIDDLE_CLIP(shingeki_no_kyojin_tv_04_annie_fight_to_eren_01,32)+TRIM_MIDDLE_CLIP(shingeki_no_kyojin_tv_04_annie_fight_to_eren_02,32)+TRIM_MIDDLE_CLIP(shingeki_no_kyojin_tv_03_vertical_maneuvering_equipment_training,63) \
	+TRIM_MIDDLE_CLIP(shingeki_no_kyojin_tv_04_annie_and_bertolt_attack_training_02,32)+TRIM_MIDDLE_CLIP(shingeki_no_kyojin_tv_04_annie_and_bertolt_attack_training_01,32)+TRIM_FIRST_CLIP(shingeki_no_kyojin_tv_08_jean_landing,64) \
	+TRIM_MIDDLE_CLIP(shingeki_no_kyojin_tv_04_chou_oogata_kyojin_appear_behind_eren,32)+TRIM_MIDDLE_CLIP(shingeki_no_kyojin_tv_04_sasha_dash_downward_01,32)+Trim(shingeki_no_kyojin_tv_04_eren_falling,25,-63) \
	+TRIM_MIDDLE_CLIP(shingeki_no_kyojin_tv_08_ready_01,32)+TRIM_MIDDLE_CLIP(shingeki_no_kyojin_tv_08_ready_02,32)+TRIM_MIDDLE_CLIP(shingeki_no_kyojin_tv_08_elevator,63)
shingeki_no_kyojin_tv_op_01_t07=TRIM_LAST_CLIP(shingeki_no_kyojin_tv_05_eren_angry_dash,128+127)
shingeki_no_kyojin_tv_op_01_t08=TRIM_MIDDLE_CLIP(shingeki_no_kyojin_tv_03_sasha_run,128)+TRIM_FIRST_CLIP(shingeki_no_kyojin_tv_04_eren_watch_chou_oogata_kyojin,127)+TRIM_LAST_CLIP(shingeki_no_kyojin_tv_03_historia_as_godness,128)+TRIM_MIDDLE_CLIP(shingeki_no_kyojin_tv_13_annie_regret,127)

shingeki_no_kyojin_tv_op_01_t09=TRIM_MIDDLE_CLIP(shingeki_no_kyojin_tv_01_survey_corps_attack_kyojin_01,127)+TRIM_LAST_CLIP(shingeki_no_kyojin_tv_09_levi_kill_kyojin_02,64)+TRIM_LAST_CLIP(shingeki_no_kyojin_tv_09_hanji_evade,64)+TRIM_LAST_CLIP(shingeki_no_kyojin_tv_11_eren_dash_01,127+128)
shingeki_no_kyojin_tv_op_01_t10=TRIM_LAST_CLIP(shingeki_no_kyojin_tv_03_sasha_starve_01,31)+TRIM_MIDDLE_CLIP(shingeki_no_kyojin_tv_03_sasha_starve_03,32)+TRIM_MIDDLE_CLIP(shingeki_no_kyojin_tv_09_eren_mad_01,32)+TRIM_MIDDLE_CLIP(shingeki_no_kyojin_tv_09_eren_mad_02,32) \
	+TRIM_MIDDLE_CLIP(shingeki_no_kyojin_tv_08_jean_dash_01,32)+TRIM_FIRST_CLIP(shingeki_no_kyojin_tv_08_jean_dash_02,32)+TRIM_MIDDLE_CLIP(shingeki_no_kyojin_tv_09_hanji_dash,32)+TRIM_MIDDLE_CLIP(shingeki_no_kyojin_tv_09_levi_kill_kyojin_01,32)

shingeki_no_kyojin_tv_op_01_t11=TRIM_MIDDLE_CLIP(shingeki_no_kyojin_tv_13_kyojin_eren_move_stone_01,63)+TRIM_MIDDLE_CLIP(shingeki_no_kyojin_tv_13_kyojin_eren_move_stone_02,64)+TRIM_MIDDLE_CLIP(shingeki_no_kyojin_tv_13_mikasa_help_kyojin_eren_move_stone_04,63)+TRIM_MIDDLE_CLIP(shingeki_no_kyojin_tv_13_kyojin_eren_move_stone_03,96)
shingeki_no_kyojin_tv_op_01_t12=TRIM_MIDDLE_CLIP(shingeki_no_kyojin_tv_07_kyojin_eren_step_kyojin_01,127+128)+TRIM_LAST_CLIP(shingeki_no_kyojin_tv_07_kyojin_eren_step_kyojin_01,127+128)

shingeki_no_kyojin_tv_op_01_t13=TRIM_FIRST_CLIP(shingeki_no_kyojin_tv_07_mikasa_attack,127)+TRIM_FIRST_CLIP(shingeki_no_kyojin_tv_10_dot_pixis_plan,127)+TRIM_LAST_CLIP(shingeki_no_kyojin_tv_12_rico_angry,128)+TRIM_FIRST_CLIP(shingeki_no_kyojin_tv_08_eren_rebirth,125)
shingeki_no_kyojin_tv_op_01_t14=TRIM_FIRST_CLIP(shingeki_no_kyojin_tv_10_armin_devote_his_life_to_human_01,61)+TRIM_MIDDLE_CLIP(shingeki_no_kyojin_tv_05_eren_evade_chou_oogata_kyojin,64)+TRIM_MIDDLE_CLIP(shingeki_no_kyojin_tv_12_armin_cut_kyojin_eren,134)
shingeki_no_kyojin_tv_op_01_t15=shingeki_no_kyojin_tv_clean_op_01_04+TRIM_MIDDLE_CLIP(shingeki_no_kyojin_tv_01_chou_oogata_kyojin_appear,35)+TRIM_MIDDLE_CLIP(shingeki_no_kyojin_tv_02_yoroi_no_kyojin_crash_wall_maria_01,16)+TRIM_LAST_CLIP(shingeki_no_kyojin_tv_17_megata_no_kyojin_jump,13)+shingeki_no_kyojin_tv_clean_op_01_05+BlankClip(shingeki_no_kyojin_tv_clean_op_01,length=24,color=color_black)



shingeki_no_kyojin_tv_op_01_mute=shingeki_no_kyojin_tv_op_01_t01+shingeki_no_kyojin_tv_op_01_t02+FADE_IN_WITH_BRIGHTNESS_OFFSET_RGB24(shingeki_no_kyojin_tv_op_01_t03,fade_length) \
	+shingeki_no_kyojin_tv_op_01_t04+FADE_OUT_WITH_BRIGHTNESS_OFFSET_RGB24(shingeki_no_kyojin_tv_op_01_t05,fade_length) \
	+shingeki_no_kyojin_tv_op_01_t06+shingeki_no_kyojin_tv_op_01_t07+FADE_OUT_WITH_BRIGHTNESS_OFFSET_RGB24(FADE_IN_WITH_BRIGHTNESS_OFFSET_RGB24(shingeki_no_kyojin_tv_op_01_t08,fade_length),fade_length) \
	+shingeki_no_kyojin_tv_op_01_t09+DOUBLE_FADE_WITH_BRIGHTNESS_OFFSET_RGB24(shingeki_no_kyojin_tv_op_01_t10, \
	+DOUBLE_FADE_WITH_BRIGHTNESS_OFFSET_RGB24(shingeki_no_kyojin_tv_op_01_t11,shingeki_no_kyojin_tv_op_01_t12,fade_length,fade_length),fade_length,fade_length) \
	+FADE_OUT_WITH_BRIGHTNESS_OFFSET_RGB24(FADE_IN_WITH_BRIGHTNESS_OFFSET_RGB24(shingeki_no_kyojin_tv_op_01_t13,fade_length),fade_length)+FADE_OUT_WITH_BRIGHTNESS_OFFSET_RGB24(shingeki_no_kyojin_tv_op_01_t14,fade_length)+shingeki_no_kyojin_tv_op_01_t15

######## Music ########

bgm_48khz=SSRC(WAVSource("src\shingeki_no_kyojin-tv-op-cd-01.wav"),48000)
AudioDub(shingeki_no_kyojin_tv_op_01_mute,bgm_48khz)



thumbnail=Trim(3288,-24*5)

######## Subtitle ########

global subtitle_clip_width=1280
global subtitle_clip_height=720

subtitle_x=50*1.5
subtitle_y=400*1.5
global subtitle_front_fade_count=24
global subtitle_rear_fade_count=24
global subtitle_font="MS Gothic"
global subtitle_effects="b"
global subtitle_size=28*1.5
global subtitle_text_color=color_white
global subtitle_halo_color=OVERWRITE_COLOR_ALPHA(color_black,$3F)

function SUBTITLE_FX(clip clip,string text,float x,float y,int start_frame,int end_frame,bool "is_title"){
	is_title=Default(is_title,false)

	halo_color=is_title?OVERWRITE_COLOR_ALPHA(color_orangered,$3F):subtitle_halo_color
	size=is_title?subtitle_size:subtitle_size*0.8

	return SUBTITLE_FX_SMEAR_IN_SMEAR_OUT(clip,text,Round(x),Round(y),start_frame,end_frame,subtitle_front_fade_count,subtitle_rear_fade_count,subtitle_font,subtitle_effects,Round(size),subtitle_text_color,halo_color)
}

SUBTITLE_FX("çgò@ÇÃã|ñÓ//Linked Horizon|- by fielia@AVISynth",-subtitle_x,subtitle_x,565,821,true)

SUBTITLE_FX("Angriff auf die Titanen.",subtitle_x,65*1*1.5,4688,5480) # 4688,4748
SUBTITLE_FX("Der Junge von einst wird bald zum Schwert greifen.",subtitle_x,65*2*1.5,4775,5480) # 4775,4907
SUBTITLE_FX("""                                                     "      """,subtitle_x,(65*3-5)*1.5,4979,5480) # 4979,5098
SUBTITLE_FX("Wer nur seine Machtlosigkeit beklagt, kann nichts verandern.",subtitle_x,65*3*1.5,4979,5480) # 4979,5098
SUBTITLE_FX("Der Junge von einst wird bald das schwarze Schwert ergreifen.",subtitle_x,65*4*1.5,5108,5480) # 5108,5224
SUBTITLE_FX("Hass und Zorn sind eine zweischneidige Klinge.",subtitle_x,65*5*1.5,5237,5480) # 5237,5330
SUBTITLE_FX("""                                              "           """,subtitle_x,(65*6-5)*1.5,5355,5480) # 5355,5480
SUBTITLE_FX("Bald, eines Tages, wird er dem Schicksal die Zahne zeigen.",subtitle_x,65*6*1.5,5355,5480) # 5355,5480



#LoadPlugin("VSFilter.dll")
TextSub("shingeki_no_kyojin-tv-op-01.ass")



#thumbnail

######## Post Processing ########

ConvertToYV12()
#ConvertToYUY2()
#ConvertToRGB24()

TCPServer(22051)
