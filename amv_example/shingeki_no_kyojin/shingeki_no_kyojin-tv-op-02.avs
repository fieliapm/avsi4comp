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

Import("..\avsi4comp\macro.avsi")

### inherit end ###

Import("shingeki_no_kyojin-tv-common-02.avsi")

######## Function ########

function PBP_ONE_CLIP(clip clip,int dir_x,int dir_y,float factor){
	clip_width=Width(clip)
	clip_height=Height(clip)

	return Zoom(ConvertToRGB32(clip),dstx=String((clip_width*0.5)*(1.0+((1.0-factor)*Float(dir_x)))),dsty="(("+String(clip_height)+")*0.5)*(1.0+((1.0-("+String(factor)+"))*("+String(dir_y)+")*Spline(n,0,1.0,"+String(Framecount(clip))+",0.5,cubic=false)))",factor=String(factor))
}

function PBP_EFFECT(clip clip1,clip clip2,int dir_x,int dir_y,float factor){
	clip1_width=Width(clip1)
	clip1_height=Height(clip1)
	clip2_width=Width(clip2)
	clip2_height=Height(clip2)

	clip1_zoomed=PBP_ONE_CLIP(clip1,-dir_x,-dir_y,factor)
	clip2_zoomed=PBP_ONE_CLIP(clip2,dir_x,dir_y,factor)
	return Overlay(clip1_zoomed,clip2_zoomed,mode="Add")
}

######## Pre Combine ########

global fade_length=16

global fast_fade_length=3

shingeki_no_kyojin_tv_clean_op_02_01_00=Trim(shingeki_no_kyojin_tv_clean_op_02_01,0,4)
shingeki_no_kyojin_tv_clean_op_02_01_01=Trim(shingeki_no_kyojin_tv_clean_op_02_01,5,0)



flash_base=TRIM_FIRST_CLIP(shingeki_no_kyojin_tv_16_survey_corps_and_eren,fade_length+146)
flash_base_00=TRIM_FIRST_CLIP(flash_base,fade_length)
flash_base_01=Trim(flash_base,fade_length,-146)
flash_overlay_00=BlankClip(shingeki_no_kyojin_tv_clean_op_02,length=6,color=color_black)

flash_overlay_01=TRIM_LAST_CLIP(shingeki_no_kyojin_tv_15_petra,18)
flash_overlay_02=TRIM_MIDDLE_CLIP(shingeki_no_kyojin_tv_15_aruro,18)
flash_overlay_03=TRIM_MIDDLE_CLIP(shingeki_no_kyojin_tv_15_eldo,18)
flash_overlay_04=TRIM_MIDDLE_CLIP(shingeki_no_kyojin_tv_15_gunter,19)
flash_overlay_05=TRIM_MIDDLE_CLIP(shingeki_no_kyojin_tv_14_mike_smile,18)
flash_overlay_06=TRIM_MIDDLE_CLIP(shingeki_no_kyojin_tv_24_hanji_thread_megata_no_kyojin,18)

flash_overlay_99=BlankClip(shingeki_no_kyojin_tv_clean_op_02,length=31,color=color_black)
flash_overlay=flash_overlay_00+flash_overlay_01+flash_overlay_02+flash_overlay_03+flash_overlay_04+flash_overlay_05+flash_overlay_06+flash_overlay_99
flash_cut=flash_base_00+ScriptClip(flash_base_01,"Overlay(flash_overlay,opacity=Spline(current_frame, \
	0,0.0, \
	6,0.0,6+3,0.6,6+8,0.6,6+17,0.0, \
	24,0.0,24+3,0.6,24+8,0.6,24+17,0.0, \
	42,0.0,42+3,0.6,42+8,0.6,42+17,0.0, \
	60,0.0,60+3,0.6,60+8,0.6,60+17,0.0, \
	79,0.0,79+3,0.6,79+8,0.6,79+17,0.0, \
	97,0.0,97+3,0.6,97+8,0.6,97+17,0.0, \
	Framecount()-1,0.0, \
	cubic=false))")



global review_01_01=TRIM_MIDDLE_CLIP(shingeki_no_kyojin_tv_16_annie_armin_connie,12)
global review_01_02=TRIM_MIDDLE_CLIP(shingeki_no_kyojin_tv_16_yumir_historia_sasha,12)
global review_01_03=TRIM_MIDDLE_CLIP(shingeki_no_kyojin_tv_16_reiner_annie_bertolt,12)
global review_01_04=TRIM_MIDDLE_CLIP(shingeki_no_kyojin_tv_16_jean_ask_marco,12)

global review_01_05=TRIM_MIDDLE_CLIP(shingeki_no_kyojin_tv_16_annie_armin_sasha_connie_near_wall,12)
global review_01_06=TRIM_MIDDLE_CLIP(shingeki_no_kyojin_tv_16_jean_talk_with_friend,12)
global review_01_07=TRIM_MIDDLE_CLIP(shingeki_no_kyojin_tv_16_reiner_bertolt_historia_yumir,12)
global review_01_08=TRIM_MIDDLE_CLIP(shingeki_no_kyojin_tv_16_people_take_sword,12)

global review_01_09=TRIM_MIDDLE_CLIP(shingeki_no_kyojin_tv_19_petra,12)
global review_01_10=TRIM_MIDDLE_CLIP(shingeki_no_kyojin_tv_19_eldo,12)
global review_01_11=TRIM_MIDDLE_CLIP(shingeki_no_kyojin_tv_19_aruro,12)
global review_01_12=TRIM_MIDDLE_CLIP(shingeki_no_kyojin_tv_19_gunter,12)

global review_01_13=TRIM_MIDDLE_CLIP(shingeki_no_kyojin_tv_15_hanji_sit_down,12)
global review_01_14=TRIM_FIRST_CLIP(shingeki_no_kyojin_tv_16_levi_go,12)
global review_01_15=TRIM_MIDDLE_CLIP(shingeki_no_kyojin_tv_25_annie_cry,21)

review_01=ANIMATION_CG_VARY("review_01_01,review_01_02,review_01_03,review_01_04,
	review_01_05,review_01_06,review_01_07,review_01_08,
	review_01_09,review_01_10,review_01_11,review_01_12,
	review_01_13,review_01_14,review_01_15", \
	fast_fade_length, \
	"9,9,9,10,9,9,9,9,
	9,9,9,10,9,9,19")

fast_flash_cut=TRIM_FIRST_CLIP(shingeki_no_kyojin_tv_20_annie_kill_gunter_01,3)+TRIM_FIRST_CLIP(shingeki_no_kyojin_tv_21_megata_no_kyojin_eat_eldo_01,3)+TRIM_FIRST_CLIP(shingeki_no_kyojin_tv_21_aruro_try_to_kill_megata_no_kyojin,3) \
	+TRIM_FIRST_CLIP(shingeki_no_kyojin_tv_20_annie_kill_gunter_02,3)+TRIM_FIRST_CLIP(shingeki_no_kyojin_tv_21_megata_no_kyojin_eat_eldo_02,3)+TRIM_FIRST_CLIP(shingeki_no_kyojin_tv_21_megata_no_kyojin_kick_aruro,3) \
	+TRIM_MIDDLE_CLIP(shingeki_no_kyojin_tv_20_annie_kill_gunter_01,3)+TRIM_MIDDLE_CLIP(shingeki_no_kyojin_tv_21_megata_no_kyojin_eat_eldo_01,3)+TRIM_MIDDLE_CLIP(shingeki_no_kyojin_tv_21_aruro_try_to_kill_megata_no_kyojin,3) \
	+TRIM_MIDDLE_CLIP(shingeki_no_kyojin_tv_21_megata_no_kyojin_stomp_petra_01,10) \
	+TRIM_MIDDLE_CLIP(shingeki_no_kyojin_tv_20_annie_kill_gunter_02,3)+TRIM_MIDDLE_CLIP(shingeki_no_kyojin_tv_21_megata_no_kyojin_eat_eldo_02,3)+TRIM_MIDDLE_CLIP(shingeki_no_kyojin_tv_21_megata_no_kyojin_kick_aruro,3) \
	+TRIM_LAST_CLIP(shingeki_no_kyojin_tv_20_annie_kill_gunter_01,3)+TRIM_LAST_CLIP(shingeki_no_kyojin_tv_21_megata_no_kyojin_eat_eldo_01,3)+TRIM_LAST_CLIP(shingeki_no_kyojin_tv_21_aruro_try_to_kill_megata_no_kyojin,3) \
	+TRIM_LAST_CLIP(shingeki_no_kyojin_tv_20_annie_kill_gunter_02,3)+TRIM_LAST_CLIP(shingeki_no_kyojin_tv_21_megata_no_kyojin_eat_eldo_02,3)+TRIM_LAST_CLIP(shingeki_no_kyojin_tv_21_megata_no_kyojin_kick_aruro,3) \
	+TRIM_FIRST_CLIP(shingeki_no_kyojin_tv_21_megata_no_kyojin_stomp_petra_02,10)



shingeki_no_kyojin_tv_16_bell_trimmed=TRIM_FIRST_CLIP(CLIP_SPEED(shingeki_no_kyojin_tv_16_bell,1.0/3.0,true),110+fade_length)
shingeki_no_kyojin_tv_16_bell_slow_motion_scaled=ConvertToYV12(Zoom(ConvertToRGB32(shingeki_no_kyojin_tv_16_bell_trimmed),factor="Spline(n,0,1.0,Framecount(shingeki_no_kyojin_tv_16_bell_trimmed)-1,1.3)"))

shingeki_no_kyojin_tv_16_bell_cache02_trimmed=TRIM_LAST_CLIP(CLIP_SPEED(shingeki_no_kyojin_tv_16_bell_cache02,1.0/3.0,true),146+(fade_length/2))
shingeki_no_kyojin_tv_16_bell_slow_motion_moving=ConvertToYV12(Zoom(ConvertToRGB32(shingeki_no_kyojin_tv_16_bell_cache02_trimmed),dstx="Spline(n,0,640-128,Framecount(shingeki_no_kyojin_tv_16_bell_cache02_trimmed)-1,640+128)",dsty="Spline(n,0,360-72,Framecount(shingeki_no_kyojin_tv_16_bell_cache02_trimmed)-1,360+72)",factor="1.2"))
shingeki_no_kyojin_tv_17_crow_fly_slow_motion=TRIM_MIDDLE_CLIP(SLOW_MOTION_WITH_CLIP_SPEED(shingeki_no_kyojin_tv_17_crow_fly),146+(fade_length/2))
shingeki_no_kyojin_tv_16_bell_and_crow=Merge(shingeki_no_kyojin_tv_17_crow_fly_slow_motion,shingeki_no_kyojin_tv_16_bell_slow_motion_moving)



shingeki_no_kyojin_tv_06_mikasa_in_rain_slow_motion=TRIM_FIRST_CLIP(SLOW_MOTION_WITH_CLIP_SPEED(shingeki_no_kyojin_tv_06_mikasa_in_rain),146+146)
shingeki_no_kyojin_tv_25_bird_fly_slow_motion=BlankClip(shingeki_no_kyojin_tv_clean_op_02,length=146,color=color_black)+FadeIn0(TRIM_FIRST_CLIP(SLOW_MOTION_WITH_CONVERT_FPS(shingeki_no_kyojin_tv_25_bird_fly_02),146),fade_length)
mikasa_in_rain=PBP_EFFECT(shingeki_no_kyojin_tv_25_bird_fly_slow_motion,shingeki_no_kyojin_tv_06_mikasa_in_rain_slow_motion,1,1,0.7)
mikasa_in_rain=ConvertToYV12(mikasa_in_rain)



levi_see_partner_killed=TRIM_MIDDLE_CLIP(shingeki_no_kyojin_tv_21_levi_see_gunter_killed,36+(fade_length/2))+TRIM_MIDDLE_CLIP(shingeki_no_kyojin_tv_21_levi_see_eldo_killed,37)+TRIM_MIDDLE_CLIP(shingeki_no_kyojin_tv_21_levi_see_aruro_killed,36)+TRIM_MIDDLE_CLIP(shingeki_no_kyojin_tv_21_levi_see_petra_killed,37)

eren_s_painful_experience_01=PBP_EFFECT(Trim(SLOW_MOTION_WITH_CLIP_SPEED(shingeki_no_kyojin_tv_24_eren_is_frustrated_01),480,-(146+(fade_length/2))),TRIM_FIRST_CLIP(SLOW_MOTION_WITH_CONVERT_FPS(shingeki_no_kyojin_tv_16_fire_and_people),146+(fade_length/2)),1,-1,0.7)
eren_s_painful_experience_01=ConvertToYV12(eren_s_painful_experience_01)

eren_s_painful_experience_02=PBP_EFFECT(TRIM_FIRST_CLIP(SLOW_MOTION_WITH_CONVERT_FPS(shingeki_no_kyojin_tv_24_eren_is_frustrated_02),146+(fade_length/2)),TRIM_FIRST_CLIP(SLOW_MOTION_WITH_CONVERT_FPS(levi_see_partner_killed),146+(fade_length/2)),1,1,0.7)
eren_s_painful_experience_02=ConvertToYV12(eren_s_painful_experience_02)

eren_s_painful_experience_03=Dissolve(TRIM_LAST_CLIP(shingeki_no_kyojin_tv_01_kyojin_catch_carla_01,73+(fade_length/2)),TRIM_MIDDLE_CLIP(shingeki_no_kyojin_tv_01_kyojin_catch_carla_02,73+(fade_length/2)+Floor(fast_fade_length/2.0)),fade_length)

eren_angry_and_transform=Dissolve(shingeki_no_kyojin_tv_24_eren_s_eye,shingeki_no_kyojin_tv_24_eren_angry_and_transform,fast_fade_length)



global review_02_01=TRIM_FIRST_CLIP(shingeki_no_kyojin_tv_21_kyojin_eren_punch_megata_no_kyojin_04,12)
global review_02_02=TRIM_FIRST_CLIP(shingeki_no_kyojin_tv_21_megata_no_kyojin_punch_kyojin_eren,12)
global review_02_03=TRIM_MIDDLE_CLIP(shingeki_no_kyojin_tv_15_petra_cleaning,12)

global review_02_04=TRIM_LAST_CLIP(shingeki_no_kyojin_tv_21_kyojin_eren_punch_megata_no_kyojin_04,12)
global review_02_05=TRIM_LAST_CLIP(shingeki_no_kyojin_tv_21_megata_no_kyojin_punch_kyojin_eren,12)
global review_02_06=TRIM_MIDDLE_CLIP(shingeki_no_kyojin_tv_17_reiner_escape_from_megata_no_kyojin_s_hand,12)

global review_02_07=TRIM_FIRST_CLIP(shingeki_no_kyojin_tv_24_megata_no_kyojin_kick_kyojin_eren,12)
global review_02_08=TRIM_MIDDLE_CLIP(shingeki_no_kyojin_tv_24_megata_no_kyojin_kick_kyojin_eren,12)
global review_02_09=TRIM_LAST_CLIP(shingeki_no_kyojin_tv_24_megata_no_kyojin_kick_kyojin_eren,12)
global review_02_10=TRIM_MIDDLE_CLIP(shingeki_no_kyojin_tv_14_levi_kick_eren_02,12)

global review_02_11=TRIM_MIDDLE_CLIP(shingeki_no_kyojin_tv_21_kyojin_eren_bite_megata_no_kyojin_s_arm,12)
global review_02_12=TRIM_MIDDLE_CLIP(shingeki_no_kyojin_tv_20_sasha_mikasa,12)

global review_02_13=TRIM_MIDDLE_CLIP(shingeki_no_kyojin_tv_20_petra_eren,12)
global review_02_14=TRIM_MIDDLE_CLIP(shingeki_no_kyojin_tv_20_jean_armin,12)
global review_02_15=TRIM_MIDDLE_CLIP(shingeki_no_kyojin_tv_20_historia,12)
global review_02_16=TRIM_MIDDLE_CLIP(shingeki_no_kyojin_tv_20_reiner_connie,12)

review_02_01=ANIMATION_CG_VARY("review_02_01,review_02_02,review_02_03,
	review_02_04,review_02_05,review_02_06,
	review_02_07,review_02_08,review_02_09,review_02_10,
	review_02_11,review_02_12,
	review_02_13,review_02_14,review_02_15,review_02_16", \
	fast_fade_length, \
	"5+Ceil(fast_fade_length/2.0),4,9,5,4,9,
	5,4,5,9,5,9,
	9,9,9,10")

review_02_02=TRIM_MIDDLE_CLIP(shingeki_no_kyojin_tv_25_kyojin_eren_catch_megata_no_kyojin,22)+TRIM_MIDDLE_CLIP(shingeki_no_kyojin_tv_21_thunder_02,5)+TRIM_LAST_CLIP(shingeki_no_kyojin_tv_21_kyojin_eren_in_megata_no_kyojin_s_eye,11)

######## Combine ########

# shingeki_no_kyojin_tv_clean_op_02_01 -5
# shingeki_no_kyojin_tv_clean_op_02_02 6455
# shingeki_no_kyojin_tv_clean_op_02_03 7695

# ha ha fade in 3 fade out 9



shingeki_no_kyojin_tv_op_01_t01=shingeki_no_kyojin_tv_clean_op_02_01_01
shingeki_no_kyojin_tv_op_01_t02=TRIM_LAST_CLIP(shingeki_no_kyojin_tv_21_mikasa_get_mad_03,144)+TRIM_LAST_CLIP(shingeki_no_kyojin_tv_21_eren_turn_back_to_help_petra_auruo,73)+TRIM_LAST_CLIP(shingeki_no_kyojin_tv_17_survey_corps_attack_kyojin_02,37)+TRIM_FIRST_CLIP(shingeki_no_kyojin_tv_18_solder_attack_megata_no_kyojin_02,36) \
	+TRIM_MIDDLE_CLIP(shingeki_no_kyojin_tv_20_levi_kill_many_kyojin,73)+TRIM_LAST_CLIP(shingeki_no_kyojin_tv_17_soldier_cut_kyojin_leg,73)+TRIM_MIDDLE_CLIP(shingeki_no_kyojin_tv_17_survey_corps_attack_kyojin_04,74)+TRIM_MIDDLE_CLIP(shingeki_no_kyojin_tv_18_solder_attack_megata_no_kyojin_01,36)+TRIM_MIDDLE_CLIP(shingeki_no_kyojin_tv_18_solder_attack_megata_no_kyojin_03,36) \
	+TRIM_LAST_CLIP(shingeki_no_kyojin_tv_16_wings_of_freedom,38+13)+Dissolve(TRIM_MIDDLE_CLIP(shingeki_no_kyojin_tv_18_historia_cry,22+fade_length),TRIM_FIRST_CLIP(shingeki_no_kyojin_tv_17_levi_squad_dash_forward,74),fade_length)

shingeki_no_kyojin_tv_op_01_t03=Dissolve(TRIM_MIDDLE_CLIP(shingeki_no_kyojin_tv_23_annie_laugh,74),FADE_OUT_WITH_BRIGHTNESS_OFFSET_RGB24(flash_cut,fade_length),fade_length)
shingeki_no_kyojin_tv_op_01_t04=TRIM_MIDDLE_CLIP(shingeki_no_kyojin_tv_17_reiner_armin_follow_megata_no_kyojin,146)+TRIM_LAST_CLIP(shingeki_no_kyojin_tv_19_megata_no_kyojin_is_under_attack,109)+TRIM_FIRST_CLIP(shingeki_no_kyojin_tv_23_mikasa_ready_to_fight_with_annie_01,37)

shingeki_no_kyojin_tv_op_01_t05=TRIM_MIDDLE_CLIP(shingeki_no_kyojin_tv_17_armin_ride_horse_in_field,146)+TRIM_MIDDLE_CLIP(shingeki_no_kyojin_tv_17_armin_shoot_flare_gun,146) \
	+TRIM_MIDDLE_CLIP(shingeki_no_kyojin_tv_18_armin_squad_horse_dash_02,73)+TRIM_MIDDLE_CLIP(shingeki_no_kyojin_tv_17_strange_behavior_kyojin_run,73)+TRIM_LAST_CLIP(shingeki_no_kyojin_tv_18_historia_bring_horses,73)+TRIM_LAST_CLIP(shingeki_no_kyojin_tv_17_kyojin_attack_sasha,74)
shingeki_no_kyojin_tv_op_01_t06=TRIM_LAST_CLIP(shingeki_no_kyojin_tv_24_jean_try_to_cut_megata_no_kyojin_nape_01,36)+TRIM_MIDDLE_CLIP(shingeki_no_kyojin_tv_19_eren_ask_everyone_shut_up,37)+TRIM_LAST_CLIP(shingeki_no_kyojin_tv_19_megata_no_kyojin_protect_her_nape,36)+TRIM_FIRST_CLIP(shingeki_no_kyojin_tv_19_hanji_happy_dash,37) \
	+TRIM_MIDDLE_CLIP(shingeki_no_kyojin_tv_17_kyojin_follow_sasha,36)+TRIM_MIDDLE_CLIP(shingeki_no_kyojin_tv_17_megata_no_kyojin_attack_jean,37)+TRIM_MIDDLE_CLIP(shingeki_no_kyojin_tv_24_mikasa_attack_megata_no_kyojin_04,36)+TRIM_FIRST_CLIP(shingeki_no_kyojin_tv_25_annie_freeze_herself,37)

shingeki_no_kyojin_tv_op_01_t07=TRIM_MIDDLE_CLIP(shingeki_no_kyojin_tv_18_levi_squad_ride_horse_in_forest_02,127)+TRIM_FIRST_CLIP(shingeki_no_kyojin_tv_17_survey_corps_attack_kyojin_03,19) \
	+TRIM_LAST_CLIP(shingeki_no_kyojin_tv_18_megata_no_kyojin_try_to_catch_eren,127)+TRIM_FIRST_CLIP(shingeki_no_kyojin_tv_20_fire_special_target_capture_weapon,19) \
	+TRIM_LAST_CLIP(shingeki_no_kyojin_tv_22_soldier_turn_back_to_save_friend,127)+TRIM_LAST_CLIP(shingeki_no_kyojin_tv_21_petra_escape,19) \
	+TRIM_MIDDLE_CLIP(shingeki_no_kyojin_tv_23_hitch_threat_senior_mp,37)+TRIM_MIDDLE_CLIP(shingeki_no_kyojin_tv_23_marlowe_wish_to_make_military_police_brigade_better,36) \
	+TRIM_MIDDLE_CLIP(shingeki_no_kyojin_tv_21_petra_auruo_eldo_fight_with_megata_no_kyojin_02,19)+TRIM_MIDDLE_CLIP(shingeki_no_kyojin_tv_21_petra_auruo_eldo_fight_with_megata_no_kyojin_03,18)+TRIM_LAST_CLIP(shingeki_no_kyojin_tv_21_petra_auruo_eldo_fight_with_megata_no_kyojin_04,18)+TRIM_LAST_CLIP(shingeki_no_kyojin_tv_21_petra_auruo_eldo_fight_with_megata_no_kyojin_05,18) \
	+TRIM_FIRST_CLIP(shingeki_no_kyojin_tv_22_levi_cut_megata_no_kyojin_every_part_short_ver,73)

shingeki_no_kyojin_tv_op_01_t08=TRIM_FIRST_CLIP(shingeki_no_kyojin_tv_24_mikasa_follow_megata_no_kyojin,147)+TRIM_MIDDLE_CLIP(shingeki_no_kyojin_tv_24_soldiers_attack_megata_no_kyojin_01,146)+TRIM_MIDDLE_CLIP(shingeki_no_kyojin_tv_24_megata_no_kyojin_kick_mikasa,146)+TRIM_FIRST_CLIP(shingeki_no_kyojin_tv_24_soldiers_attack_megata_no_kyojin_02,146)
shingeki_no_kyojin_tv_op_01_t09=TRIM_FIRST_CLIP(shingeki_no_kyojin_tv_24_megata_no_kyojin_follow_jean_armin,73)+TRIM_FIRST_CLIP(shingeki_no_kyojin_tv_21_petra_auruo_eldo_try_to_cut_megata_no_kyojin_head,73)+TRIM_MIDDLE_CLIP(shingeki_no_kyojin_tv_21_mikasa_get_mad_02,73)+TRIM_MIDDLE_CLIP(shingeki_no_kyojin_tv_25_annie_s_father_hug_annie,73)

shingeki_no_kyojin_tv_op_01_t10=TRIM_FIRST_CLIP(shingeki_no_kyojin_tv_20_annie_move_in_forest_02,146)+review_01

shingeki_no_kyojin_tv_op_01_t11=TRIM_MIDDLE_CLIP(shingeki_no_kyojin_tv_21_kyojin_eren_and_megata_no_kyojin_fight_03,36)+TRIM_MIDDLE_CLIP(shingeki_no_kyojin_tv_21_kyojin_eren_and_megata_no_kyojin_fight_06,73)+fast_flash_cut

shingeki_no_kyojin_tv_op_01_t12=Dissolve(TRIM_MIDDLE_CLIP(shingeki_no_kyojin_tv_22_petra_s_body_is_dropped_01,36+(fade_length/2)),shingeki_no_kyojin_tv_16_bell_slow_motion_scaled,shingeki_no_kyojin_tv_16_bell_and_crow,fade_length)
shingeki_no_kyojin_tv_op_01_t13=TRIM_FIRST_CLIP(mikasa_in_rain,146+146)
shingeki_no_kyojin_tv_op_01_t14=DOUBLE_FADE_WITH_BRIGHTNESS_OFFSET_RGB24(Dissolve(TRIM_FIRST_CLIP(eren_s_painful_experience_01,146+(fade_length/2)),TRIM_FIRST_CLIP(eren_s_painful_experience_02,146+(fade_length/2)),fade_length), \
	Dissolve(TRIM_FIRST_CLIP(eren_s_painful_experience_03,146+Floor(fast_fade_length/2.0)),TRIM_FIRST_CLIP(eren_angry_and_transform,74+fast_fade_length),fast_fade_length),fade_length,fade_length)

shingeki_no_kyojin_tv_op_01_t15=review_02_01+review_02_02

shingeki_no_kyojin_tv_op_01_t16=shingeki_no_kyojin_tv_clean_op_02_02+TRIM_LAST_CLIP(shingeki_no_kyojin_tv_25_kyojin_eren_scream_02,37)
shingeki_no_kyojin_tv_op_01_t17=TRIM_LAST_CLIP(shingeki_no_kyojin_tv_18_forest_edge_01,148)+TRIM_FIRST_CLIP(shingeki_no_kyojin_tv_17_erwin_squad_ride_horse_in_field,72)+FADE_OUT_WITH_BRIGHTNESS_OFFSET_RGB24(TRIM_FIRST_CLIP(shingeki_no_kyojin_tv_22_survey_corps_retreat_in_field_03,37),fade_length) \
	+TRIM_FIRST_CLIP(shingeki_no_kyojin_tv_25_kyojin_eren_get_mad_02,35)+shingeki_no_kyojin_tv_clean_op_02_03+BlankClip(shingeki_no_kyojin_tv_clean_op_02,length=24*1,color=color_white)



shingeki_no_kyojin_tv_op_02_mute=shingeki_no_kyojin_tv_op_01_t01+shingeki_no_kyojin_tv_op_01_t02 \
	+shingeki_no_kyojin_tv_op_01_t03+DOUBLE_FADE_WITH_BRIGHTNESS_OFFSET_RGB24(shingeki_no_kyojin_tv_op_01_t04, \
	shingeki_no_kyojin_tv_op_01_t05,fade_length,fade_length)+DOUBLE_FADE_WITH_BRIGHTNESS_OFFSET_RGB24(shingeki_no_kyojin_tv_op_01_t06, \
	FADE_OUT_WITH_BRIGHTNESS_OFFSET_RGB24(shingeki_no_kyojin_tv_op_01_t07,fade_length),fade_length,fade_length) \
	+shingeki_no_kyojin_tv_op_01_t08+FADE_OUT_WITH_BRIGHTNESS_OFFSET_RGB24(shingeki_no_kyojin_tv_op_01_t09,fade_length) \
	+shingeki_no_kyojin_tv_op_01_t10+shingeki_no_kyojin_tv_op_01_t11 \
	+FadeOut0(shingeki_no_kyojin_tv_op_01_t12,fade_length)+FadeOut0(FadeIn0(shingeki_no_kyojin_tv_op_01_t13,fade_length),fade_length)+Dissolve(FadeIn0(shingeki_no_kyojin_tv_op_01_t14,fade_length),shingeki_no_kyojin_tv_op_01_t15,fast_fade_length) \
	+DOUBLE_FADE_WITH_BRIGHTNESS_OFFSET_RGB24(shingeki_no_kyojin_tv_op_01_t16,shingeki_no_kyojin_tv_op_01_t17,fade_length,fade_length)

shingeki_no_kyojin_tv_op_02_mute

### export clip: shingeki_no_kyojin_tv_clean_op_02_01_00

### prefetch: 5,2

### ###

last

""")

######## Music ########

bgm_48khz=SSRC(WAVSource("src\shingeki_no_kyojin-tv-op-cd-02.wav"),48000)
AudioDub(bgm_48khz)



thumbnail=Trim(1886,-24*5)

######## Subtitle ########

global subtitle_clip_width=1280
global subtitle_clip_height=720

subtitle_x=50*1.5
subtitle_y=400*1.5
global subtitle_front_fade_count=24
global subtitle_rear_fade_count=24
global subtitle_font="MS Gothic"
global subtitle_effects="b"
global subtitle_size=24*1.5
global subtitle_text_color=color_white
global subtitle_halo_color=color_black

function SUBTITLE_FX(clip clip,string text,float x,float y,int start_frame,int end_frame,bool is_fade_fx,bool "is_kana",bool "is_title"){
	is_kana=Default(is_kana,false)
	is_title=Default(is_title,false)

	halo_color=is_title?OVERWRITE_COLOR_ALPHA(color_orangered,$3F):subtitle_halo_color
	size=is_kana?subtitle_size*0.5:subtitle_size

	return is_fade_fx? \
		SUBTITLE_FX_FADE_IN_FADE_OUT(clip,text,Round(x),Round(y),start_frame,end_frame,subtitle_front_fade_count,subtitle_rear_fade_count,subtitle_font,subtitle_effects,Round(size),subtitle_text_color,halo_color) \
		: \
		SUBTITLE_FX_FLY_IN_FLY_OUT(clip,text,Round(x),Round(y),start_frame,end_frame,subtitle_front_fade_count,subtitle_rear_fade_count,subtitle_font,subtitle_effects,Round(size),subtitle_text_color,halo_color)
}

SUBTITLE_FX("自由の翼//Linked Horizon|- by fielia@AVISynth",-subtitle_x,subtitle_y-subtitle_size,7731,7840,false,is_title=true)



SUBTITLE_FX("O mein Freund!",subtitle_x,subtitle_y,1,21,false)
SUBTITLE_FX("Jetzt hier ist ein Sieg.",subtitle_x,subtitle_y-(subtitle_size*2),22,94,false)
SUBTITLE_FX("Dies ist der erste Gloria.",subtitle_x,subtitle_y,97,171,false)
SUBTITLE_FX("O mein Freund!",subtitle_x,subtitle_y-(subtitle_size*2),172,191,false)
SUBTITLE_FX("""                        "       "             """,subtitle_x,subtitle_y-5,192,322,false)
SUBTITLE_FX("Feiern wir dieser Sieg fur den nachsten Kampf!",subtitle_x,subtitle_y,192,322,false)



SUBTITLE_FX("「無意味な死であった」",subtitle_x,subtitle_y,673,746,false)
SUBTITLE_FX("と...言わせない",subtitle_x,subtitle_y-(subtitle_size*2),747,802,false)
SUBTITLE_FX("                 ひとり",subtitle_x,subtitle_y-(subtitle_size/2),806,936,false,is_kana=true)
SUBTITLE_FX("最後の《一矢》になるまで......",subtitle_x,subtitle_y,806,936,false)

SUBTITLE_FX("Der feind ist grausam... Wir bringen...",subtitle_x,subtitle_x,930,1002,false)
SUBTITLE_FX("Der feind ist riesig... Wir springen...",subtitle_x,subtitle_y-(subtitle_size*2),1003,1077,false)

SUBTITLE_FX("""                                         "                """,subtitle_x,subtitle_y-subtitle_size-5,1076,1330,false)
SUBTITLE_FX("         Gloria            Sieg        Flugel der Freiheit",subtitle_x,subtitle_y-subtitle_size,1076,1330,false)
SUBTITLE_FX("両手には《鋼刃》 唄うのは《凱歌》 背中には《自由の翼》",subtitle_x,subtitle_y,1076,1330,false)
SUBTITLE_FX("                                  Ringe der Torheit",subtitle_x,subtitle_y-subtitle_size-(subtitle_size*2),1362,1622,false)
SUBTITLE_FX("握り締めた決意を左胸に 斬り裂くのは《愚行の螺旋》",subtitle_x,subtitle_y-(subtitle_size*2),1362,1622,false)
SUBTITLE_FX("""        "                """,subtitle_x,subtitle_y-subtitle_size-5,1654,1811,false)
SUBTITLE_FX("      Flugel der Freiheit",subtitle_x,subtitle_y-subtitle_size,1654,1811,false)
SUBTITLE_FX("蒼穹を舞う 自由の翼",subtitle_x,subtitle_y,1654,1811,false)



SUBTITLE_FX("鳥は飛ぶ為に其の殻を破ってきた 無様に地を這う為じゃないだろ?",subtitle_x,subtitle_y,2318,2610,false)
SUBTITLE_FX("お前の翼は何の為にある 籠の中の空は狭過ぎるだろ?",subtitle_x,subtitle_y-(subtitle_size*2),2611,2907,false)

SUBTITLE_FX("Die Freiheit und der Tod. Die beiden sind Zwillinge.",subtitle_x,subtitle_y,2912,3052,false)
SUBTITLE_FX("Die Freiheit oder der Tod?",subtitle_x,subtitle_y-(subtitle_size*2),3059,3121,false)
SUBTITLE_FX("Unser Freund ist ein!",subtitle_x,subtitle_y,3122,3193,false)

SUBTITLE_FX("何の為に生まれて来たのかなんて... 小難しい事は解らないけど...",subtitle_x,subtitle_y-(subtitle_size*2),3196,3461,false)
SUBTITLE_FX("例え其れが過ちだったとしても... 何の為に生きているかは判る...",subtitle_x,subtitle_y,3487,3717,false)
SUBTITLE_FX("其れは... 理屈じゃない... 存在... 故の『自由』!",subtitle_x,subtitle_y-(subtitle_size*2),3718,3869,false)



SUBTITLE_FX("""      "                """,subtitle_x,subtitle_y-5,5240,5315,true)
SUBTITLE_FX("Die Flugel der Freiheit.",subtitle_x,subtitle_y,5240,5315,true)



SUBTITLE_FX("隠された真実は 衝撃の嚆矢だ",subtitle_x,subtitle_y,5790,5935,true)
SUBTITLE_FX("                                       Titanen",subtitle_x,subtitle_y-subtitle_size-(subtitle_size*2),5937,6081,true)
SUBTITLE_FX("                              やみ                 ひかり",subtitle_x,subtitle_y-(subtitle_size/2)-(subtitle_size*2),5937,6081,true,is_kana=true)
SUBTITLE_FX("鎖された其の《深層》と 《表層》に潜む《巨人達》",subtitle_x,subtitle_y-(subtitle_size*2),5937,6081,true)
SUBTITLE_FX("崩れ然る固定観念 迷いを抱きながら 其れでも尚 『自由』へ進め!!!",subtitle_x,subtitle_y,6082,6320,true)

SUBTITLE_FX("Rechter Weg? Linker Weg? Na, ein Weg welcher ist?",subtitle_x,subtitle_x,6301,6373,false)
SUBTITLE_FX("Der Feind? Der Freund? Mensch, Sie welche sind?",subtitle_x,subtitle_y-(subtitle_size*2),6374,6447,false)

SUBTITLE_FX("       Instrument          Licht        Horizont der Freiheit",subtitle_x,subtitle_y-subtitle_size,6448,6703,false)
SUBTITLE_FX("両手には《戦意》 唄うのは《希望》 背中には《自由の地平線》",subtitle_x,subtitle_y,6448,6703,false)
SUBTITLE_FX("""                                             "         """,subtitle_x,subtitle_y-subtitle_size-5-(subtitle_size*2),6734,6994,false)
SUBTITLE_FX("                            Hinterfront der Moglichkeit",subtitle_x,subtitle_y-subtitle_size-(subtitle_size*2),6734,6994,false)
SUBTITLE_FX("世界を繋ぐ鎖を各々胸に 奏でるのは《可能性の背面》",subtitle_x,subtitle_y-(subtitle_size*2),6734,6994,false)
SUBTITLE_FX("""        "                """,subtitle_x,subtitle_y-subtitle_size-5,7026,7184,false)
SUBTITLE_FX("      Flugel der Freiheit",subtitle_x,subtitle_y-subtitle_size,7026,7184,false)
SUBTITLE_FX("蒼穹を舞え 自由の翼",subtitle_x,subtitle_y,7026,7184,false)



SUBTITLE_FX("O mein Freund!",subtitle_x,subtitle_x,7387,7406,false)
SUBTITLE_FX("Jetzt hier ist ein Sieg.",subtitle_x,subtitle_x+(subtitle_size*2),7407,7471,false)
SUBTITLE_FX("Dies ist der erste Gloria.",subtitle_x,subtitle_x,7472,7532,false)
SUBTITLE_FX("O mein Freund!",subtitle_x,subtitle_x+(subtitle_size*2),7533,7551,false)
SUBTITLE_FX("""                        "       "             """,subtitle_x,subtitle_x-5,7552,7653,false)
SUBTITLE_FX("Feiern wir dieser Sieg fur den nachsten",subtitle_x,subtitle_x,7552,7653,false)
SUBTITLE_FX("Der Feind ist riesig... Wir springen...",subtitle_x,subtitle_x+(subtitle_size*2),7654,7725,false)
SUBTITLE_FX("""      "                """,subtitle_x,subtitle_x-5,7726,7772,false)
SUBTITLE_FX("Die Flugel der Freiheit!",subtitle_x,subtitle_x,7726,7772,false)



AUDIO_DUB_TONE(shingeki_no_kyojin_tv_clean_op_02_01_00,samplerate=48000,channels=2,type="Silence")++ConvertToYV12(last)



#thumbnail

######## Post Processing ########

ConvertToYV12()
#ConvertToYUY2()
#ConvertToRGB24()

TCPServer(22052)
