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



######## BD (1920*1080) ########

plastic_memories_01=FFMS2_VIDEO_SOURCE("src\anime\[ANK-Raws] プラスティック・メモリーズ 01 (BDrip 1920x1080 HEVC-YUV420P10 FLAC).mkv")
plastic_memories_02=FFMS2_VIDEO_SOURCE("src\anime\[ANK-Raws] プラスティック・メモリーズ 02 (BDrip 1920x1080 HEVC-YUV420P10 FLAC).mkv")
plastic_memories_03=FFMS2_VIDEO_SOURCE("src\anime\[ANK-Raws] プラスティック・メモリーズ 03 (BDrip 1920x1080 HEVC-YUV420P10 FLAC).mkv")
plastic_memories_04=FFMS2_VIDEO_SOURCE("src\anime\[ANK-Raws] プラスティック・メモリーズ 04 (BDrip 1920x1080 HEVC-YUV420P10 FLAC).mkv")
plastic_memories_05=FFMS2_VIDEO_SOURCE("src\anime\[ANK-Raws] プラスティック・メモリーズ 05 (BDrip 1920x1080 HEVC-YUV420P10 FLAC).mkv")
plastic_memories_06=FFMS2_VIDEO_SOURCE("src\anime\[ANK-Raws] プラスティック・メモリーズ 06 (BDrip 1920x1080 HEVC-YUV420P10 FLAC).mkv")
plastic_memories_07=FFMS2_VIDEO_SOURCE("src\anime\[ANK-Raws] プラスティック・メモリーズ 07 (BDrip 1920x1080 HEVC-YUV420P10 FLAC).mkv")
plastic_memories_08=FFMS2_VIDEO_SOURCE("src\anime\[ANK-Raws] プラスティック・メモリーズ 08 (BDrip 1920x1080 HEVC-YUV420P10 FLAC).mkv")
plastic_memories_09=FFMS2_VIDEO_SOURCE("src\anime\[ANK-Raws] プラスティック・メモリーズ 09 (BDrip 1920x1080 HEVC-YUV420P10 FLAC).mkv")
plastic_memories_10=FFMS2_VIDEO_SOURCE("src\anime\[ANK-Raws] プラスティック・メモリーズ 10 (BDrip 1920x1080 HEVC-YUV420P10 FLAC).mkv")
plastic_memories_11=FFMS2_VIDEO_SOURCE("src\anime\[ANK-Raws] プラスティック・メモリーズ 11 (BDrip 1920x1080 HEVC-YUV420P10 FLAC).mkv")
plastic_memories_12=FFMS2_VIDEO_SOURCE("src\anime\[ANK-Raws] プラスティック・メモリーズ 12 (BDrip 1920x1080 HEVC-YUV420P10 FLAC).mkv")
plastic_memories_13=FFMS2_VIDEO_SOURCE("src\anime\[ANK-Raws] プラスティック・メモリーズ 13 (BDrip 1920x1080 HEVC-YUV420P10 FLAC).mkv")

plastic_memories_clean_op=FFMS2_VIDEO_SOURCE("src\anime\[ANK-Raws] プラスティック・メモリーズ (Creditless OP) (BDrip 1920x1080 HEVC-YUV420P10 FLAC).mkv")

######## Trim ########

plastic_memories_clean_op_pre=Trim(plastic_memories_clean_op,0,43)
#437
plastic_memories_clean_op_01_0=Trim(plastic_memories_clean_op,44,49) #6, script: 44r
plastic_memories_clean_op_01_1=Trim(plastic_memories_clean_op,50,106) #57, script: 50j 56e 71j 76e 87j 92e
plastic_memories_clean_op_02=Trim(plastic_memories_clean_op,107,303) # script: 107j
plastic_memories_clean_op_03=Trim(plastic_memories_clean_op,304,845)
plastic_memories_clean_op_04=Trim(plastic_memories_clean_op,846,1030)
plastic_memories_clean_op_05=Trim(plastic_memories_clean_op,1031,1165)
plastic_memories_clean_op_06=Trim(plastic_memories_clean_op,1166,1611)
plastic_memories_clean_op_07=Trim(plastic_memories_clean_op,1612,1864)
plastic_memories_clean_op_08_title=Trim(plastic_memories_clean_op,1865,1977)
plastic_memories_clean_op_09=Trim(plastic_memories_clean_op,1978,2046)
plastic_memories_clean_op_10_isla_emotion_13=Trim(plastic_memories_clean_op,2047,2180) #134
plastic_memories_clean_op_post=Trim(plastic_memories_clean_op,2181,0)



isla_emotion_02=Trim(plastic_memories_02,6578,6712) #134
isla_emotion_03=Trim(plastic_memories_03,3367,3500) #134
isla_emotion_04=Trim(plastic_memories_04,3055,3188) #134
isla_emotion_05=Trim(plastic_memories_05,2023,2158) #136
isla_emotion_06=Trim(plastic_memories_06,2023,2158) #136
isla_emotion_07=Trim(plastic_memories_07,4350,4482) #133
isla_emotion_08=Trim(plastic_memories_08,33217,33351) #135
isla_emotion_09=Trim(plastic_memories_09,5044,5178) #135
isla_emotion_10=Trim(plastic_memories_10,2959,3092) #134
isla_emotion_11=Trim(plastic_memories_11,3463,3596) #134
isla_emotion_12=Trim(plastic_memories_12,4302,4434) #133
isla_emotion_13=Trim(plastic_memories_13,4734,4867) #134



plastic_memories_01_isla_see_outside_in_elevator=Trim(plastic_memories_01,730,891) #162 op
plastic_memories_01_isla_tears_in_elevator=Trim(plastic_memories_01,892,963) #72 op
plastic_memories_01_isla_tears_and_turn_back_01=Trim(plastic_memories_01,1019,1180) #162 op
plastic_memories_01_isla_tears_and_turn_back_02=Trim(plastic_memories_01,1181,1238) #58 op
plastic_memories_01_isla_meet_tsukasa_in_elevator=Trim(plastic_memories_01,1325,1528) #204 op
plastic_memories_01_isla_walking_01=Trim(plastic_memories_01,5995,6102)
plastic_memories_01_isla_walking_02=Trim(plastic_memories_01,6142,6216)
plastic_memories_01_isla_tears_and_turn_back_03=Trim(plastic_memories_01,6217,6265) #49
plastic_memories_01_isla_catch_hand=Trim(plastic_memories_01,7323,7370)
plastic_memories_01_isla_stand_up=Trim(plastic_memories_01,7419,7460)
plastic_memories_01_isla_stand_up_and_see_tsukasa=Trim(plastic_memories_01,7461,7514)
plastic_memories_01_isla_deny=Trim(plastic_memories_01,7975,8100)
plastic_memories_01_dispatch_giftia_recycle_vehicle=Trim(plastic_memories_01,9317,9388) #72
plastic_memories_01_isla_talking_in_vehicle=Trim(plastic_memories_01,11165,11290)
plastic_memories_01_isla_keep_silence=Trim(plastic_memories_01,11372,11441)
plastic_memories_01_isla_s_diary=Trim(plastic_memories_01,11530,11806) #p
plastic_memories_01_michiru_throw_signature_to_tsukasa=Trim(plastic_memories_01,12075,12180)
plastic_memories_01_zack_is_good_at_socializing=Trim(plastic_memories_01,12573,12816)
plastic_memories_01_open_recycle_box_01=Trim(plastic_memories_01,13053,13106) #54
plastic_memories_01_open_recycle_box_02=Trim(plastic_memories_01,13107,13157) #51
plastic_memories_01_edward_bid_farewell_to_parents=Trim(plastic_memories_01,13158,13510) #353 op
plastic_memories_01_drive_giftia_recycle_vehicle_back=Trim(plastic_memories_01,14251,14335)
plastic_memories_01_zack_stretch_his_body=Trim(plastic_memories_01,16532,16612)
plastic_memories_01_isla_run_away=Trim(plastic_memories_01,17886,17949)
plastic_memories_01_isla_jump_down_01=Trim(plastic_memories_01,18177,18224)
plastic_memories_01_isla_jump_down_02=Trim(plastic_memories_01,18225,18314)
plastic_memories_01_isla_jump_down_03=Trim(plastic_memories_01,18315,18446)
plastic_memories_01_isla_jump_down_04=Trim(plastic_memories_01,18447,18554)
plastic_memories_01_isla_fall_down_01=Trim(plastic_memories_01,18555,18591)
plastic_memories_01_isla_fall_down_02=Trim(plastic_memories_01,18592,18657)
plastic_memories_01_water_plant=Trim(plastic_memories_01,22052,22105)
plastic_memories_01_isla_water_plant=Trim(plastic_memories_01,22106,22168) #63 op
plastic_memories_01_isla_s_eye=Trim(plastic_memories_01,22722,22835)
plastic_memories_01_tsukasa_remember_isla_tears_and_turn_back=Trim(plastic_memories_01,22873,22905)
plastic_memories_01_michiru_and_zack_talk_to_tsukasa_and_isla_on_stair=Trim(plastic_memories_01,23985,24062)
plastic_memories_01_chidu_see_nina=Trim(plastic_memories_01,24964,25203)
plastic_memories_01_isla_take_bath=Trim(plastic_memories_01,26816,26848)
plastic_memories_01_nina_help_isla_dry_hair=Trim(plastic_memories_01,27409,27681)
plastic_memories_01_nina_chidu_tsukasa_isla_eat_afternoon_tea=Trim(plastic_memories_01,30648,30725)
plastic_memories_01_isla_shutdown_nina=Trim(plastic_memories_01,32539,32608)
plastic_memories_01_isla_bless_nina=Trim(plastic_memories_01,32609,32686) #78 op
plastic_memories_01_nina_smile=Trim(plastic_memories_01,32687,32806)

plastic_memories_02_snow=Trim(plastic_memories_02,2904,3036)
plastic_memories_02_tsukasa_wear_high_school_uniform=Trim(plastic_memories_02,3037,3104)
plastic_memories_02_tsukasa_go_to_interview=Trim(plastic_memories_02,3291,3497)
plastic_memories_02_max_repair_car=Trim(plastic_memories_02,6817,6958) #142 op
plastic_memories_02_tsukasa_run_and_isla_stunned=Trim(plastic_memories_02,7653,7691)
plastic_memories_02_isla_frustrated_and_run_away=Trim(plastic_memories_02,7764,7828)
plastic_memories_02_tsukasa_clean_isla_s_nose_bleed=Trim(plastic_memories_02,8166,8303) #138 op
plastic_memories_02_kaduki_and_yasutaka=Trim(plastic_memories_02,15137,15190)
plastic_memories_02_tsukasa_start_computer_01=Trim(plastic_memories_02,15500,15540)
plastic_memories_02_tsukasa_start_computer_02=Trim(plastic_memories_02,15541,15628)
plastic_memories_02_isla_swimming=Trim(plastic_memories_02,15871,15963)
plastic_memories_02_isla_swimming_across_gate=Trim(plastic_memories_02,16652,16759)
plastic_memories_02_isla_bind_rope_but_hook_her_foot=Trim(plastic_memories_02,17883,17996)
plastic_memories_02_isla_swimming_up=Trim(plastic_memories_02,18123,18194)
plastic_memories_02_tsukasa_see_isla_float_in_water=Trim(plastic_memories_02,18195,18278)
plastic_memories_02_michiru_s_apartment=Trim(plastic_memories_02,23236,23303)
plastic_memories_02_michiru_see_city_night_01=Trim(plastic_memories_02,23304,23359) #56 op
plastic_memories_02_michiru_thinking_01=Trim(plastic_memories_02,23360,23407) #48 op
plastic_memories_02_michiru_thinking_02=Trim(plastic_memories_02,23480,23527) #48 op
plastic_memories_02_michiru_see_city_night_02=Trim(plastic_memories_02,23528,23613) #86
plastic_memories_02_flower_pot=Trim(plastic_memories_02,26137,26213)
plastic_memories_02_michiru_teach_tsukasa=Trim(plastic_memories_02,26698,26886)
plastic_memories_02_michiru_stop_her_step=Trim(plastic_memories_02,27669,27752)
plastic_memories_02_michiru_turn_back_and_say_sorry=Trim(plastic_memories_02,27849,27902) #54
plastic_memories_02_tsukasa_see_michiru_walk_away=Trim(plastic_memories_02,27903,27974) #72
plastic_memories_02_tsukasa_peep_isla=Trim(plastic_memories_02,31422,31463) #42 p2

plastic_memories_03_isla_charge=Trim(plastic_memories_03,258,313) #56 op
plastic_memories_03_michiru_stunned=Trim(plastic_memories_03,16994,17041)
plastic_memories_03_isla_cannot_change_clothes=Trim(plastic_memories_03,24587,24658) #72 op
plastic_memories_03_isla_and_tsukasa_in_elevator_01=Trim(plastic_memories_03,25344,25382) #39 p2
plastic_memories_03_isla_and_tsukasa_in_elevator_02=Trim(plastic_memories_03,25440,25640) #201
plastic_memories_03_tsukasa_see_isla_wear_glasses=Trim(plastic_memories_03,27191,27378)
plastic_memories_03_tsukasa_and_isla_see_ferris_wheel=Trim(plastic_memories_03,27510,27688) #178
plastic_memories_03_isla_leave=Trim(plastic_memories_03,29621,29692) #72 op
plastic_memories_03_street_light_switched_on=Trim(plastic_memories_03,29693,29773) #81
plastic_memories_03_tsukasa_alone_01=Trim(plastic_memories_03,29774,29833)
plastic_memories_03_tsukasa_alone_02=Trim(plastic_memories_03,29834,29923) #90 p
plastic_memories_03_isla_stand_against_wall_01=Trim(plastic_memories_03,30257,30352) #96
plastic_memories_03_isla_stand_against_wall_02=Trim(plastic_memories_03,30425,30556) #132 op
plastic_memories_03_tsukasa_talk_with_isla=Trim(plastic_memories_03,31301,31492)
plastic_memories_03_tsukasa_talk_with_isla=Trim(plastic_memories_03,32171,32368)

plastic_memories_04_isla_change_clothes=Trim(plastic_memories_04,381,474)
plastic_memories_04_marcia_pour_tea=Trim(plastic_memories_04,8270,8413) #144 p
plastic_memories_04_marcia_tsukasa_isla_face_window=Trim(plastic_memories_04,16422,16685) #264 op
plastic_memories_04_michiru_control_tsukasa_s_hand=Trim(plastic_memories_04,23911,24000)
plastic_memories_04_michiru_touch_bow_tie=Trim(plastic_memories_04,25607,25726) #120 op
plastic_memories_04_tsukasa_michiru_isla_zack_celebrate_souta_s_borthday=Trim(plastic_memories_04,28217,28276) #60
plastic_memories_04_marcia_hug_souta=Trim(plastic_memories_04,31184,31302) #119 op

plastic_memories_05_isla_turn_eyes_right=Trim(plastic_memories_05,4776,4829)
plastic_memories_05_kaduki_make_phone_call=Trim(plastic_memories_05,5052,5213)
plastic_memories_05_shinya_see_computer_screen=Trim(plastic_memories_05,6075,6220) #146 op
plastic_memories_05_yasutaka_walk_in_lane=Trim(plastic_memories_05,8082,8129)
plastic_memories_05_sherry_drive=Trim(plastic_memories_05,8184,8231) #p
plastic_memories_05_kaduki_and_shinonome_discussing=Trim(plastic_memories_05,12690,12893) #204 op
plastic_memories_05_reflection_of_michiru_zack_tsukasa=Trim(plastic_memories_05,16232,16303) #72 op
plastic_memories_05_michiru_and_her_father_in_church=Trim(plastic_memories_05,17559,17711) #153 op
plastic_memories_05_kaduki_run_toward_michiru_and_her_father=Trim(plastic_memories_05,17784,17903)
plastic_memories_05_michiru_s_father_become_wanderer=Trim(plastic_memories_05,18606,18657)
plastic_memories_05_security_shoot_michiru_s_father=Trim(plastic_memories_05,19337,19377)
plastic_memories_05_michiru_cry=Trim(plastic_memories_05,19594,19692)
plastic_memories_05_souta_in_rain=Trim(plastic_memories_05,20779,20874)
plastic_memories_05_sherry_and_yasutaka_search_criminal=Trim(plastic_memories_05,21285,21428) #144 op
plastic_memories_05_isla_hold_sword=Trim(plastic_memories_05,24593,24639)
plastic_memories_05_marcia_become_wanderer=Trim(plastic_memories_05,24820,24854)
plastic_memories_05_marcia_hit_isla_away=Trim(plastic_memories_05,24855,24875)
plastic_memories_05_wanderer_marcia_watch_souta=Trim(plastic_memories_05,24971,25000)
plastic_memories_05_wanderer_marcia_catch_souta_and_jump_to_roof=Trim(plastic_memories_05,25077,25122)
plastic_memories_05_michiru_and_zack_receive_phone_call_in_lane=Trim(plastic_memories_05,25450,25554) #105 op
plastic_memories_05_tsukasa_hug_isla=Trim(plastic_memories_05,26240,26404)
plastic_memories_05_isla_try_to_call_tsukasa_back=Trim(plastic_memories_05,29004,29128)
plastic_memories_05_tsukasa_point_gun_to_marcia_and_souta=Trim(plastic_memories_05,31262,31297)
plastic_memories_05_tsukasa_want_to_shoot_marcia_and_isla_run_to_marcia=Trim(plastic_memories_05,31738,31773) #36 op

plastic_memories_06_ferris_wheel_with_sakura=Trim(plastic_memories_06,2558,2599)
plastic_memories_06_isla_tears_and_kaduki_leave=Trim(plastic_memories_06,2959,3078) #120 op
plastic_memories_06_kaduki_damage=Trim(plastic_memories_06,3204,3263)
plastic_memories_06_isla_cry=Trim(plastic_memories_06,3264,3395)
plastic_memories_06_isla_sit_down=Trim(plastic_memories_06,3396,3491)
plastic_memories_06_isla_and_kaduki_sit_in_amusement_park=Trim(plastic_memories_06,3564,3659)
plastic_memories_06_ferris_wheel_with_cloud=Trim(plastic_memories_06,3732,3923)
plastic_memories_06_isla_alone_and_snow_falling=Trim(plastic_memories_06,4206,4349) #144 op
plastic_memories_06_beam_pass_by_isla=Trim(plastic_memories_06,5709,5772) #64 op
plastic_memories_06_marcia_is_dying=Trim(plastic_memories_06,5820,5885) #66 op
plastic_memories_06_marcia_is_dying_and_tears=Trim(plastic_memories_06,5886,5987) #102 op
plastic_memories_06_marcia_fall_down=Trim(plastic_memories_06,6034,6079) #46
plastic_memories_06_tsukasa_and_isla_see_marcia_fall_down=Trim(plastic_memories_06,6080,6233) #154
plastic_memories_06_isla_fall_down=Trim(plastic_memories_06,6426,6509)
plastic_memories_06_isla_s_sword_fall=Trim(plastic_memories_06,6510,6620)
plastic_memories_06_isla_disappointed_past_and_present=Trim(plastic_memories_06,8248,8428) #181 op
plastic_memories_06_isla_boil_water=Trim(plastic_memories_06,11700,11831)
plastic_memories_06_isla_bring_tea_and_fall_down=Trim(plastic_memories_06,18450,18491)
plastic_memories_06_isla_fall_down_and_get_wet=Trim(plastic_memories_06,18492,18563) #72 op
plastic_memories_06_isla_and_eru_dress_in_bar=Trim(plastic_memories_06,19690,19749) #60 op
plastic_memories_06_souta_catch_tsukasa_and_cry=Trim(plastic_memories_06,23284,23447) #164 op
plastic_memories_06_isla_shine=Trim(plastic_memories_06,30842,30961) #120 op
plastic_memories_06_isla_kirakira_and_smile=Trim(plastic_memories_06,31650,31793) #144 op

plastic_memories_07_isla_frustrated=Trim(plastic_memories_07,8057,8107)
plastic_memories_07_isla_frustrated_and_tsukasa_appease_her=Trim(plastic_memories_07,8108,8353)
plastic_memories_07_isla_wear_cute_clothes=Trim(plastic_memories_07,21581,21679)
plastic_memories_07_isla_and_tsukasa_see_people_in_amusement=Trim(plastic_memories_07,23351,23825) #475 op
plastic_memories_07_isla_see_building_in_ferris_wheel=Trim(plastic_memories_07,25884,25955) #72 op
plastic_memories_07_tsukasa_fall_and_hit_isla_breast=Trim(plastic_memories_07,26755,26830) #76 op

plastic_memories_08_isla_see_mirabel_show_doll=Trim(plastic_memories_08,1334,1464) #131 op
plastic_memories_08_andie_recycle_derek=Trim(plastic_memories_08,9722,9769) #48 op
plastic_memories_08_olivia_and_eru_drinking=Trim(plastic_memories_08,13528,13596) #69 p
plastic_memories_08_olivia_and_eru_in_matsuri=Trim(plastic_memories_08,13597,13662) #66 op
plastic_memories_08_enoshima=Trim(plastic_memories_08,20126,20245)
plastic_memories_08_matsuri=Trim(plastic_memories_08,20733,20816)
plastic_memories_08_eru_and_andie_in_matsuri=Trim(plastic_memories_08,20817,20847) #31 op
plastic_memories_08_eru_turn_back=Trim(plastic_memories_08,25595,25843) #249
plastic_memories_08_fireworks_after_tsukasa=Trim(plastic_memories_08,25970,26021)
plastic_memories_08_fireworks=Trim(plastic_memories_08,26022,26111)
plastic_memories_08_eru_alone=Trim(plastic_memories_08,26490,26651) #162 op
plastic_memories_08_tsukasa_run_under_fireworks=Trim(plastic_memories_08,27014,27335)
plastic_memories_08_tsukasa_find_in_many_people_01=Trim(plastic_memories_08,27448,27546) #99 op
plastic_memories_08_tsukasa_find_in_many_people_02=Trim(plastic_memories_08,27547,27715)
plastic_memories_08_enoshima_under_fireworks=Trim(plastic_memories_08,27716,27877)
plastic_memories_08_fireworks_after_tsukasa_and_isla=Trim(plastic_memories_08,28843,28914) #79 p
plastic_memories_08_tsukasa_catch_isla_s_hand_to_see_fireworks=Trim(plastic_memories_08,29220,29326)
plastic_memories_08_isla_tears=Trim(plastic_memories_08,29894,30131)
plastic_memories_08_tsukasa_hug_isla=Trim(plastic_memories_08,30178,30243) #66 p
plastic_memories_08_tsukasa_hug_isla_under_fireworks=Trim(plastic_memories_08,30859,30981) #123

plastic_memories_09_michiru_tears=Trim(plastic_memories_09,14818,14907) #90
plastic_memories_09_michiru_cry=Trim(plastic_memories_09,15054,15131) #78 op
plastic_memories_09_zack_play_gameboy=Trim(plastic_memories_09,16354,16635) #282 op
plastic_memories_09_michiru_sit_on_stair=Trim(plastic_memories_09,27170,27253)
plastic_memories_09_michiru_sit_on_stair_and_tears=Trim(plastic_memories_09,27254,27415)
plastic_memories_09_tsukasa_go_to_stair_and_sit_near_michiru=Trim(plastic_memories_09,27837,27979) #143 op

plastic_memories_10_giftia_recycle_vehicle=Trim(plastic_memories_10,13611,13682) #p
plastic_memories_10_hourglass_and_menu=Trim(plastic_memories_10,15437,15493)
plastic_memories_10_tsukasa_see_hourglass_01=Trim(plastic_memories_10,15494,15745)
plastic_memories_10_isla_talk_with_mafia=Trim(plastic_memories_10,17771,17836)
plastic_memories_10_mafia_stroke_isla=Trim(plastic_memories_10,17878,17955)
plastic_memories_10_isla_make_sarah_and_antonio_together=Trim(plastic_memories_10,19891,20061) #171 op
plastic_memories_10_hourglass=Trim(plastic_memories_10,20763,20870) #108 op
plastic_memories_10_hourglass_shadow=Trim(plastic_memories_10,20871,21329)
plastic_memories_10_tsukasa_see_hourglass_02=Trim(plastic_memories_10,22046,22123)
plastic_memories_10_isla_sarah_antonio_in_flower_field=Trim(plastic_memories_10,22598,22765)
plastic_memories_10_isla_tears=Trim(plastic_memories_10,27294,27359)
plastic_memories_10_isla_hold_key_holder_tightly=Trim(plastic_memories_10,27360,27426) #67 op
plastic_memories_10_isla_and_kaduki_stand=Trim(plastic_memories_10,28078,28209)
plastic_memories_10_terminal_service_one_members=Trim(plastic_memories_10,28466,28544) #79 op
plastic_memories_10_kaduki_see_isla_nervous=Trim(plastic_memories_10,28545,28655)
plastic_memories_10_isla_s_body=Trim(plastic_memories_10,29266,29374)
plastic_memories_10_isla_cry_and_explain=Trim(plastic_memories_10,30613,31056)
plastic_memories_10_isla_cry_and_catch_tsukasa_s_hand=Trim(plastic_memories_10,31402,31581) #180 op
plastic_memories_10_isla_tears_and_smile=Trim(plastic_memories_10,32083,32196)

plastic_memories_11_isla_write_diary=Trim(plastic_memories_11,1002,1061) #p
plastic_memories_11_become_couple_in_diary=Trim(plastic_memories_11,1154,1259) #106 op
plastic_memories_11_isla_fall_down_and_expose_pantie=Trim(plastic_memories_11,5003,5122)
plastic_memories_11_isla_shy=Trim(plastic_memories_11,6845,6904) #60 op
plastic_memories_11_tsukasa_and_isla_thinking=Trim(plastic_memories_11,11983,12024) #p
plastic_memories_11_tsukasa_thinking=Trim(plastic_memories_11,12025,12104)
plastic_memories_11_isla_thinking=Trim(plastic_memories_11,12105,12164)
plastic_memories_11_michiru_flick_isla_s_forehead=Trim(plastic_memories_11,17080,17136)
plastic_memories_11_isla_prepare_food_for_antonio=Trim(plastic_memories_11,22131,22190)
plastic_memories_11_isla_see_sunset_01=Trim(plastic_memories_11,24151,24240) #90 op
plastic_memories_11_isla_see_sunset_02=Trim(plastic_memories_11,24295,24342) #48 op
plastic_memories_11_isla_and_tsukasa_walk_in_city_night=Trim(plastic_memories_11,25303,25444)
plastic_memories_11_isla_and_river_light=Trim(plastic_memories_11,25445,25516) #72 p
plastic_memories_11_isla_and_tsukasa_walk_along_river=Trim(plastic_memories_11,25577,25876)
plastic_memories_11_isla_catch_tsukasa_s_hand_near_river=Trim(plastic_memories_11,26591,26710) #120 op
plastic_memories_11_isla_see_river=Trim(plastic_memories_11,27734,27841) #108 op
plastic_memories_11_omurice_day_in_diary_01=Trim(plastic_memories_11,31010,31141)
plastic_memories_11_omurice_day_in_diary_02=Trim(plastic_memories_11,32164,32367) #204 op

plastic_memories_12_isla_sleep_and_tears_01=Trim(plastic_memories_12,108,227)
plastic_memories_12_isla_sleep_and_tears_02=Trim(plastic_memories_12,228,276)
plastic_memories_12_tsukasa_hug_isla_on_bed=Trim(plastic_memories_12,822,953)
plastic_memories_12_isla_eat_then_say_ok=Trim(plastic_memories_12,2069,2278)
plastic_memories_12_terminal_service_one_members=Trim(plastic_memories_12,7054,7146) #93 op
plastic_memories_12_isla_smile_in_company=Trim(plastic_memories_12,7228,7371)
plastic_memories_12_isla_smile_when_date_01=Trim(plastic_memories_12,8905,8946)
plastic_memories_12_isla_smile_when_date_02=Trim(plastic_memories_12,9124,9192)
plastic_memories_12_isla_grab_dress=Trim(plastic_memories_12,9427,9504)
plastic_memories_12_isla_kirakira=Trim(plastic_memories_12,9577,9642)
plastic_memories_12_tsukasa_sleep_on_isla_s_leg_01=Trim(plastic_memories_12,9849,10178) #330 op
plastic_memories_12_tsukasa_sleep_on_isla_s_leg_02=Trim(plastic_memories_12,10395,10592) #198 p
plastic_memories_12_isla_turn_back_and_smile=Trim(plastic_memories_12,11706,11771) #66 p
plastic_memories_12_isla_stand_under_sunset=Trim(plastic_memories_12,11772,11867) #96 op
plastic_memories_12_isla_walk_to_tsukasa_under_sunset=Trim(plastic_memories_12,12712,12843)
plastic_memories_12_tsukasa_turn_head_away=Trim(plastic_memories_12,20671,20740)
plastic_memories_12_michiru_sad=Trim(plastic_memories_12,20741,20806)
plastic_memories_12_isla_hug_tsukasa_01=Trim(plastic_memories_12,21960,21994)
plastic_memories_12_isla_hug_tsukasa_02=Trim(plastic_memories_12,21995,22028)
plastic_memories_12_isla_hug_tsukasa_from_back=Trim(plastic_memories_12,22932,22991)
plastic_memories_12_isla_and_tsukasa_sit_together_01=Trim(plastic_memories_12,23166,23324)
plastic_memories_12_isla_and_tsukasa_sit_together_02=Trim(plastic_memories_12,23391,23612)
plastic_memories_12_isla_recycle_sarah=Trim(plastic_memories_12,24837,24896) #60 op
plastic_memories_12_isla_happy=Trim(plastic_memories_12,26553,26648)
plastic_memories_12_thank_isla_sign_board=Trim(plastic_memories_12,28466,28519) #54 op
plastic_memories_12_tsukasa_carry_isla=Trim(plastic_memories_12,30773,31054)
plastic_memories_12_isla_talk_near_tsukasa_s_head=Trim(plastic_memories_12,31055,31306)
plastic_memories_12_isla_say_bless_sentence_to_tsukasa=Trim(plastic_memories_12,31865,31984)
plastic_memories_12_isla_s_hair=Trim(plastic_memories_12,31985,32128)

plastic_memories_13_isla_and_tsukasa_sit_together=Trim(plastic_memories_13,743,832)
plastic_memories_13_isla_and_tsukasa_sit_together_and_see_sun_rise=Trim(plastic_memories_13,1923,2066)
plastic_memories_13_isla_and_tsukasa_sit_together_under_sun_rise=Trim(plastic_memories_13,2211,2366) #156 op
plastic_memories_13_isla_stand_and_see_outside=Trim(plastic_memories_13,7083,7165)
plastic_memories_13_isla_s_face=Trim(plastic_memories_13,7166,7261) #96 p
plastic_memories_13_isla_stand_and_tell=Trim(plastic_memories_13,10084,10227)
plastic_memories_13_tsukasa_and_isla_go_to_amusement_park=Trim(plastic_memories_13,12600,12746) #p
plastic_memories_13_isla_cute=Trim(plastic_memories_13,15174,15227) #54
plastic_memories_13_isla_and_tsukasa_decide_play_until_isla_terminated=Trim(plastic_memories_13,15522,15653)
plastic_memories_13_street_light_switched_on=Trim(plastic_memories_13,15654,15750) #97
plastic_memories_13_tsukasa_and_isla_01=Trim(plastic_memories_13,17872,17931) #60 p
plastic_memories_13_tsukasa_and_isla_02=Trim(plastic_memories_13,17932,17991) #60 p
plastic_memories_13_ring=Trim(plastic_memories_13,23887,23988) #102 op
plastic_memories_13_isla_show_ring=Trim(plastic_memories_13,23989,24144)
plastic_memories_13_isla_last_smile=Trim(plastic_memories_13,25865,25984) #120 op
plastic_memories_13_tsukasa_help_isla_wear_ring_01=Trim(plastic_memories_13,26189,26266)
plastic_memories_13_tsukasa_help_isla_wear_ring_02=Trim(plastic_memories_13,26267,26326)
plastic_memories_13_isla_and_tsukasa_kiss_01=Trim(plastic_memories_13,26633,26750) #118 op
plastic_memories_13_isla_and_tsukasa_kiss_02=Trim(plastic_memories_13,26751,26797) #47 op
plastic_memories_13_isla_and_tsukasa_hold_hands=Trim(plastic_memories_13,26798,26854) #57 op
