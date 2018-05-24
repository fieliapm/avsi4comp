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



Import("frame_arms_girl-season_01-common-cross_process.avsi")

######## BD (1920*1080) ########

frame_arms_girl_season_01_clean_op=FFMS2_VIDEO_SOURCE("src\anime\[Beatrice-Raws] Frame Arms Girl [BDRip 1920x1080 x264 FLAC]\NC\[Beatrice-Raws] Frame Arms Girl (Creditless OP1) [BDRip 1920x1080 x264 FLAC].mkv",enable_multi_thread=enable_multi_thread)
#frame_arms_girl_season_01_clean_ed=FFMS2_VIDEO_SOURCE("src\anime\[Beatrice-Raws] Frame Arms Girl [BDRip 1920x1080 x264 FLAC]\NC\[Beatrice-Raws] Frame Arms Girl (Creditless ED1) [BDRip 1920x1080 x264 FLAC].mkv",enable_multi_thread=enable_multi_thread)

frame_arms_girl_season_01_01=FFMS2_VIDEO_SOURCE("src\anime\[Beatrice-Raws] Frame Arms Girl [BDRip 1920x1080 x264 FLAC]\[Beatrice-Raws] Frame Arms Girl 01 [BDRip 1920x1080 x264 FLAC].mkv",enable_multi_thread=enable_multi_thread)

frame_arms_girl_season_01_03=FFMS2_VIDEO_SOURCE("src\anime\[Beatrice-Raws] Frame Arms Girl [BDRip 1920x1080 x264 FLAC]\[Beatrice-Raws] Frame Arms Girl 03 [BDRip 1920x1080 x264 FLAC].mkv",enable_multi_thread=enable_multi_thread)
frame_arms_girl_season_01_04=FFMS2_VIDEO_SOURCE("src\anime\[Beatrice-Raws] Frame Arms Girl [BDRip 1920x1080 x264 FLAC]\[Beatrice-Raws] Frame Arms Girl 04 [BDRip 1920x1080 x264 FLAC].mkv",enable_multi_thread=enable_multi_thread)
frame_arms_girl_season_01_05=FFMS2_VIDEO_SOURCE("src\anime\[Beatrice-Raws] Frame Arms Girl [BDRip 1920x1080 x264 FLAC]\[Beatrice-Raws] Frame Arms Girl 05 [BDRip 1920x1080 x264 FLAC].mkv",enable_multi_thread=enable_multi_thread)
frame_arms_girl_season_01_06=FFMS2_VIDEO_SOURCE("src\anime\[Beatrice-Raws] Frame Arms Girl [BDRip 1920x1080 x264 FLAC]\[Beatrice-Raws] Frame Arms Girl 06 [BDRip 1920x1080 x264 FLAC].mkv",enable_multi_thread=enable_multi_thread)
frame_arms_girl_season_01_07=FFMS2_VIDEO_SOURCE("src\anime\[Beatrice-Raws] Frame Arms Girl [BDRip 1920x1080 x264 FLAC]\[Beatrice-Raws] Frame Arms Girl 07 [BDRip 1920x1080 x264 FLAC].mkv",enable_multi_thread=enable_multi_thread)
frame_arms_girl_season_01_08=FFMS2_VIDEO_SOURCE("src\anime\[Beatrice-Raws] Frame Arms Girl [BDRip 1920x1080 x264 FLAC]\[Beatrice-Raws] Frame Arms Girl 08 [BDRip 1920x1080 x264 FLAC].mkv",enable_multi_thread=enable_multi_thread)
frame_arms_girl_season_01_09=FFMS2_VIDEO_SOURCE("src\anime\[Beatrice-Raws] Frame Arms Girl [BDRip 1920x1080 x264 FLAC]\[Beatrice-Raws] Frame Arms Girl 09 [BDRip 1920x1080 x264 FLAC].mkv",enable_multi_thread=enable_multi_thread)
frame_arms_girl_season_01_10=FFMS2_VIDEO_SOURCE("src\anime\[Beatrice-Raws] Frame Arms Girl [BDRip 1920x1080 x264 FLAC]\[Beatrice-Raws] Frame Arms Girl 10 [BDRip 1920x1080 x264 FLAC].mkv",enable_multi_thread=enable_multi_thread)
frame_arms_girl_season_01_11=FFMS2_VIDEO_SOURCE("src\anime\[Beatrice-Raws] Frame Arms Girl [BDRip 1920x1080 x264 FLAC]\[Beatrice-Raws] Frame Arms Girl 11 [BDRip 1920x1080 x264 FLAC]rev.mkv",enable_multi_thread=enable_multi_thread)
frame_arms_girl_season_01_12=FFMS2_VIDEO_SOURCE("src\anime\[Beatrice-Raws] Frame Arms Girl [BDRip 1920x1080 x264 FLAC]\[Beatrice-Raws] Frame Arms Girl 12 [BDRip 1920x1080 x264 FLAC].mkv",enable_multi_thread=enable_multi_thread)

######## Trim ########

frame_arms_girl_season_01_clean_op_01=Trim(frame_arms_girl_season_01_clean_op,0,256)
frame_arms_girl_season_01_clean_op_02=Trim(frame_arms_girl_season_01_clean_op,257,757)
frame_arms_girl_season_01_clean_op_03=Trim(frame_arms_girl_season_01_clean_op,758,1065)
frame_arms_girl_season_01_clean_op_04=Trim(frame_arms_girl_season_01_clean_op,1066,1575)
frame_arms_girl_season_01_clean_op_05=Trim(frame_arms_girl_season_01_clean_op,1576,1822)
frame_arms_girl_season_01_clean_op_06=Trim(frame_arms_girl_season_01_clean_op,1823,1978)
frame_arms_girl_season_01_clean_op_07=Trim(frame_arms_girl_season_01_clean_op,1979,0)



#frame_arms_girl_season_01_clean_ed_01=Trim(frame_arms_girl_season_01_clean_ed,0,187)
#frame_arms_girl_season_01_clean_ed_02=Trim(frame_arms_girl_season_01_clean_ed,188,1317)
#frame_arms_girl_season_01_clean_ed_03=Trim(frame_arms_girl_season_01_clean_ed,1318,1670)
#frame_arms_girl_season_01_clean_ed_04=Trim(frame_arms_girl_season_01_clean_ed,1671,0)



frame_arms_girl_season_01_01_drone_fly_near_train=Trim(frame_arms_girl_season_01_01,2410,2466) #57
frame_arms_girl_season_01_01_drone_fly_near_building=Trim(frame_arms_girl_season_01_01,2521,2580) #60
frame_arms_girl_season_01_01_ao_sleeping=Trim(frame_arms_girl_season_01_01,2802,2861) #60
frame_arms_girl_season_01_01_ao_wake_up_01=Trim(frame_arms_girl_season_01_01,2862,3044) #183
frame_arms_girl_season_01_01_ao_wake_up_02=Trim(frame_arms_girl_season_01_01,3045,3122) #78
frame_arms_girl_season_01_01_ao_s_leg=Trim(frame_arms_girl_season_01_01,3623,3658) #36
frame_arms_girl_season_01_01_ao_watch_gourai_and_exciting=Trim(frame_arms_girl_season_01_01,5565,5762) #198 op
frame_arms_girl_season_01_01_ao_touch_gourai_s_face=Trim(frame_arms_girl_season_01_01,5763,5938) #176
frame_arms_girl_season_01_01_gourai_show_plug=Trim(frame_arms_girl_season_01_01,7351,7416) #66
frame_arms_girl_season_01_01_gourai_feel_climax=Trim(frame_arms_girl_season_01_01,7465,7503) #39
frame_arms_girl_season_01_01_gourai_suggest_nipper=Trim(frame_arms_girl_season_01_01,9169,9234) #66
frame_arms_girl_season_01_01_kotobuki_nipper=Trim(frame_arms_girl_season_01_01,9547,9576) #30
frame_arms_girl_season_01_01_gourai_shock=Trim(frame_arms_girl_season_01_01,9577,9640) #64
frame_arms_girl_season_01_01_assembly_order_tutorial=Trim(frame_arms_girl_season_01_01,11041,11277) #237
frame_arms_girl_season_01_01_ao_and_gourai_search_lost_part=Trim(frame_arms_girl_season_01_01,11681,11769) #89
frame_arms_girl_season_01_01_ao_stop_search_part_and_sit=Trim(frame_arms_girl_season_01_01,11893,12032) #140
frame_arms_girl_season_01_01_gourai_open_album=Trim(frame_arms_girl_season_01_01,14499,14568) #70 op
frame_arms_girl_season_01_01_gourai_take_fork=Trim(frame_arms_girl_season_01_01,15969,16053) #85

frame_arms_girl_season_01_01_package_opened=Trim(frame_arms_girl_season_01_01,17634,17680) #47
frame_arms_girl_season_01_01_stylet_attack_gourai=Trim(frame_arms_girl_season_01_01,17784,17823) #40 op
frame_arms_girl_season_01_01_gourai_kick_stylet=Trim(frame_arms_girl_season_01_01,17849,17870) #22
frame_arms_girl_season_01_01_baselard_fall_down_from_box=Trim(frame_arms_girl_season_01_01,19875,19956) #82 op
frame_arms_girl_season_01_01_baselard_watch_ahd_touch_gourai=Trim(frame_arms_girl_season_01_01,20113,20340) #228
frame_arms_girl_season_01_01_baselard_take_session_base=Trim(frame_arms_girl_season_01_01,23299,23388) #90
frame_arms_girl_season_01_01_install_item_on_gourai=Trim(frame_arms_girl_season_01_01,24179,24484) #306
frame_arms_girl_season_01_01_stylet_online=Trim(frame_arms_girl_season_01_01,24947,25186) #240
frame_arms_girl_season_01_01_gourai_online=Trim(frame_arms_girl_season_01_01,25187,25426) #240
frame_arms_girl_season_01_01_ao_watch_session=Trim(frame_arms_girl_season_01_01,25427,25474) #48 op
frame_arms_girl_season_01_01_gourai_enter_session=Trim(frame_arms_girl_season_01_01,25527,25588) #62
frame_arms_girl_season_01_01_stylet_fly_left_and_right=Trim(frame_arms_girl_season_01_01,25750,25782) #33 op
frame_arms_girl_season_01_01_gourai_target_stylet=Trim(frame_arms_girl_season_01_01,25865,25892) #28
frame_arms_girl_season_01_01_gourai_fire_smoothbore=Trim(frame_arms_girl_season_01_01,25893,25920) #28
frame_arms_girl_season_01_01_stylet_fire_machine_gun=Trim(frame_arms_girl_season_01_01,26074,26102) #29
frame_arms_girl_season_01_01_stylet_shoot_gourai_01=Trim(frame_arms_girl_season_01_01,26103,26126) #24
frame_arms_girl_season_01_01_stylet_shoot_gourai_02=Trim(frame_arms_girl_season_01_01,26475,26522) #48 op
frame_arms_girl_season_01_01_gourai_u_turn=Trim(frame_arms_girl_season_01_01,28047,28081) #35 op
frame_arms_girl_season_01_01_gourai_fire_to_stylet=Trim(frame_arms_girl_season_01_01,28242,28295) #54

frame_arms_girl_season_01_02_gourai_cook_rice=Trim(frame_arms_girl_season_01_02,3086,3193) #108
frame_arms_girl_season_01_02_ao_remove_rice_from_gourai_s_face=Trim(frame_arms_girl_season_01_02,3259,3328) #70
frame_arms_girl_season_01_02_stylet_clean_armor_and_baselard_sleeping=Trim(frame_arms_girl_season_01_02,3675,3792) #118
frame_arms_girl_season_01_02_stylet_pour_out_rice_on_her_head=Trim(frame_arms_girl_season_01_02,5035,5076) #42 op
frame_arms_girl_season_01_02_baselard_see_gourai_and_stylet_argue=Trim(frame_arms_girl_season_01_02,5637,5780) #144
frame_arms_girl_season_01_02_stylet_frustrated=Trim(frame_arms_girl_season_01_02,6335,6675) #341
frame_arms_girl_season_01_02_baselard_take_chopstick_and_knock_bowl=Trim(frame_arms_girl_season_01_02,8319,8507) #189 op
frame_arms_girl_season_01_02_baselard_host_session=Trim(frame_arms_girl_season_01_02,8524,8591) #68
frame_arms_girl_season_01_02_ao_and_baselard_see_stylet_and_gourai_in_session=Trim(frame_arms_girl_season_01_02,11137,11202) #66
frame_arms_girl_season_01_02_gourai_kiss_stylet_01=Trim(frame_arms_girl_season_01_02,11986,12057) #72
frame_arms_girl_season_01_02_gourai_kiss_stylet_02=Trim(frame_arms_girl_season_01_02,12081,12140) #60 ed recommend
frame_arms_girl_season_01_02_gourai_kiss_stylet_03=Trim(frame_arms_girl_season_01_02,12141,12188) #48
frame_arms_girl_season_01_02_gourai_kiss_stylet_04=Trim(frame_arms_girl_season_01_02,12189,12236) #48
frame_arms_girl_season_01_02_stylet_fly_in_room=Trim(frame_arms_girl_season_01_02,14974,15043) #70 op

frame_arms_girl_season_01_02_gourai_kirakira=Trim(frame_arms_girl_season_01_02,17774,17893) #120
frame_arms_girl_season_01_02_baselard_knock_robot_cleaner=Trim(frame_arms_girl_season_01_02,18166,18291) #126
frame_arms_girl_season_01_02_gourai_remind_ao_s_poem_note=Trim(frame_arms_girl_season_01_02,20490,20645) #156
frame_arms_girl_season_01_02_gourai_seek_ao_s_note=Trim(frame_arms_girl_season_01_02,20730,20849) #120
frame_arms_girl_season_01_02_stylet_laughing_and_rolling=Trim(frame_arms_girl_season_01_02,22000,22263) #264 ed recommend
frame_arms_girl_season_01_02_robot_cleaner_move_around=Trim(frame_arms_girl_season_01_02,23773,23891) #119
frame_arms_girl_season_01_02_gourai_embarassed=Trim(frame_arms_girl_season_01_02,24495,24662) #168
frame_arms_girl_season_01_02_gourai_feel_climax_01=Trim(frame_arms_girl_season_01_02,24705,24752) #48
frame_arms_girl_season_01_02_gourai_feel_climax_02=Trim(frame_arms_girl_season_01_02,24819,24958) #140
frame_arms_girl_season_01_02_gourai_stylet_baselard_run_toward_robot_cleaner=Trim(frame_arms_girl_season_01_02,25265,25308) #44
frame_arms_girl_season_01_02_gourai_try_to_catch_robot_cleaner=Trim(frame_arms_girl_season_01_02,25309,25348) #40
frame_arms_girl_season_01_02_stylet_and_baselard_catch_robot_cleaner=Trim(frame_arms_girl_season_01_02,25379,25409) #31
frame_arms_girl_season_01_02_baselard_catch_uncontrollable_robot_cleaner_01=Trim(frame_arms_girl_season_01_02,25598,25657) #60
frame_arms_girl_season_01_02_baselard_catch_uncontrollable_robot_cleaner_02=Trim(frame_arms_girl_season_01_02,25760,25814) #55 op
frame_arms_girl_season_01_02_baselard_online=Trim(frame_arms_girl_season_01_02,27226,27465) #240
frame_arms_girl_season_01_02_baselard_fly=Trim(frame_arms_girl_season_01_02,28100,28129) #30
frame_arms_girl_season_01_02_baselard_prepare_weapon=Trim(frame_arms_girl_season_01_02,28179,28223) #45
frame_arms_girl_season_01_02_baselard_show_weapon=Trim(frame_arms_girl_season_01_02,28261,28320) #60
frame_arms_girl_season_01_02_gourai_evade_baselard_s_attack=Trim(frame_arms_girl_season_01_02,28615,28659) #45
frame_arms_girl_season_01_02_gourai_fire_smoothbore=Trim(frame_arms_girl_season_01_02,29201,29217) #17 op
frame_arms_girl_season_01_02_gourai_see_explosion=Trim(frame_arms_girl_season_01_02,29245,29304) #60 op
frame_arms_girl_season_01_02_ao_show_vacuum_cleaner=Trim(frame_arms_girl_season_01_02,30060,30287) #228

frame_arms_girl_season_01_03_stylet_see_baselard_s_charging_kun=Trim(frame_arms_girl_season_01_03,2809,2903) #95
frame_arms_girl_season_01_03_stylet_mistake_dummy_for_baselard=Trim(frame_arms_girl_season_01_03,3279,3458) #180
frame_arms_girl_season_01_03_bukiko_talk_with_classmates=Trim(frame_arms_girl_season_01_03,4277,4411) #135
frame_arms_girl_season_01_03_stylet_bring_gourai_flying=Trim(frame_arms_girl_season_01_03,4759,4853) #95
frame_arms_girl_season_01_03_baselard_walk_across_corridor=Trim(frame_arms_girl_season_01_03,5526,5582) #57
frame_arms_girl_season_01_03_baselard_watch_faucet=Trim(frame_arms_girl_season_01_03,5739,5906) #168
frame_arms_girl_season_01_03_stylet_and_gourai_evade_water=Trim(frame_arms_girl_season_01_03,6121,6197) #77 op
frame_arms_girl_season_01_03_play_basketball=Trim(frame_arms_girl_season_01_03,6584,6615) #32
frame_arms_girl_season_01_03_stylet_and_gourai_fall_down=Trim(frame_arms_girl_season_01_03,6867,6906) #40
frame_arms_girl_season_01_03_stylet_and_gourai_fall_on_basketball=Trim(frame_arms_girl_season_01_03,6907,7010) #104
frame_arms_girl_season_01_03_bukiko_see_ao_leave=Trim(frame_arms_girl_season_01_03,7011,7178) #168
frame_arms_girl_season_01_03_bukiko_appear=Trim(frame_arms_girl_season_01_03,7563,7634) #72
frame_arms_girl_season_01_03_stylet_gourai_ao_scared=Trim(frame_arms_girl_season_01_03,7635,7670) #36
frame_arms_girl_season_01_03_bukiko_jump_to_table=Trim(frame_arms_girl_season_01_03,7671,7802) #132 op
frame_arms_girl_season_01_03_bukiko_watch_gourai_and_stylet_and_feel_excited=Trim(frame_arms_girl_season_01_03,7803,7955) #153
frame_arms_girl_season_01_03_bukiko_want_to_catch_gourai_and_stylet=Trim(frame_arms_girl_season_01_03,9021,9158) #138
frame_arms_girl_season_01_03_stylet_chase_baselard=Trim(frame_arms_girl_season_01_03,10549,10659) #111 op
frame_arms_girl_season_01_03_bukiko_show_gold_and_silver_nipper=Trim(frame_arms_girl_season_01_03,11170,11385) #216
frame_arms_girl_season_01_03_bukiko_show_kotobuki_nipper=Trim(frame_arms_girl_season_01_03,11386,11421) #36
frame_arms_girl_season_01_03_kotobuki_nipper=Trim(frame_arms_girl_season_01_03,11422,11781) #360 op
frame_arms_girl_season_01_03_ao_watch_kotobuki_nipper=Trim(frame_arms_girl_season_01_03,11782,11874) #93
frame_arms_girl_season_01_03_the_god_of_nipper=Trim(frame_arms_girl_season_01_03,12131,12168) #38
frame_arms_girl_season_01_03_gourai_baselard_stylet_sit_on_ao_and_ao_and_bukiko_walking=Trim(frame_arms_girl_season_01_03,13377,13570) #194

frame_arms_girl_season_01_03_ao_in_pool=Trim(frame_arms_girl_season_01_03,15304,15435) #132
frame_arms_girl_season_01_03_materia_black_and_white=Trim(frame_arms_girl_season_01_03,15493,15635) #143
frame_arms_girl_season_01_03_materia_white_s_leg=Trim(frame_arms_girl_season_01_03,15768,15814) #47 op
frame_arms_girl_season_01_03_materia_black_s_leg=Trim(frame_arms_girl_season_01_03,15815,15866) #52 op
frame_arms_girl_season_01_03_materia_black_and_white_scaring=Trim(frame_arms_girl_season_01_03,18666,18737) #72
frame_arms_girl_season_01_03_materia_black_and_white_online=Trim(frame_arms_girl_season_01_03,21154,21393) #240
frame_arms_girl_season_01_03_materia_black_and_white_enter_session=Trim(frame_arms_girl_season_01_03,21394,21543) #150
frame_arms_girl_season_01_03_materia_white_wield=Trim(frame_arms_girl_season_01_03,21940,21979) #40 op
frame_arms_girl_season_01_03_materia_black_throw=Trim(frame_arms_girl_season_01_03,22100,22147) #48 op
frame_arms_girl_season_01_03_materia_black_and_white_attack_gourai_and_stylet=Trim(frame_arms_girl_season_01_03,23186,23268) #83 op
frame_arms_girl_season_01_03_revolving_buster_cannon_user_manual=Trim(frame_arms_girl_season_01_03,23929,24051) #123
frame_arms_girl_season_01_03_gourai_get_revolving_buster_cannon=Trim(frame_arms_girl_season_01_03,25132,25457) #326
frame_arms_girl_season_01_03_materia_black_and_white_abuse_stylet=Trim(frame_arms_girl_season_01_03,26921,27262) #342
frame_arms_girl_season_01_03_gourai_fire_revolving_buster_cannon=Trim(frame_arms_girl_season_01_03,27573,27716) #144

frame_arms_girl_season_01_04_jinrai_jump_over_building=Trim(frame_arms_girl_season_01_04,2954,3046) #93
frame_arms_girl_season_01_04_jinrai_break_curtain=Trim(frame_arms_girl_season_01_04,3089,3140) #52 op
frame_arms_girl_season_01_04_jinrai_like_date_masamune=Trim(frame_arms_girl_season_01_04,4573,4830) #258
frame_arms_girl_season_01_04_jinrai_s_charging_kun_see_park=Trim(frame_arms_girl_season_01_04,6316,6393) #78 op
frame_arms_girl_season_01_04_ao_cry=Trim(frame_arms_girl_season_01_04,6394,6573) #180
frame_arms_girl_season_01_04_ninja_dart_hit_ao=Trim(frame_arms_girl_season_01_04,6638,6674) #37
frame_arms_girl_season_01_04_jinrai_online=Trim(frame_arms_girl_season_01_04,7989,8228) #240
frame_arms_girl_season_01_04_jinrai_fast_move=Trim(frame_arms_girl_season_01_04,8337,8360) #24 op
frame_arms_girl_season_01_04_jinrai_shadow_clone=Trim(frame_arms_girl_season_01_04,8994,9062) #69
frame_arms_girl_season_01_04_jinrai_shadow_clone_and_move_forward=Trim(frame_arms_girl_season_01_04,9479,9520) #42 op
frame_arms_girl_season_01_04_jinrai_s_charging_kun_sumo=Trim(frame_arms_girl_season_01_04,13317,13388) #72
frame_arms_girl_season_01_04_jinrai_prepare_for_sumo=Trim(frame_arms_girl_season_01_04,13389,13608) #220
frame_arms_girl_season_01_04_baselard_host_sumo_jinrai_vs_gourai=Trim(frame_arms_girl_season_01_04,13784,13885) #102
frame_arms_girl_season_01_04_jinrai_and_gourai_become_tornado=Trim(frame_arms_girl_season_01_04,14269,14460) #192
frame_arms_girl_season_01_04_gourai_charging_kun_push_jinrai_charging_kun_down=Trim(frame_arms_girl_season_01_04,16126,16182) #57

frame_arms_girl_season_01_04_jinrai_climb=Trim(frame_arms_girl_season_01_04,20011,20130) #120
frame_arms_girl_season_01_04_jinrai_hide_after_nin_word=Trim(frame_arms_girl_season_01_04,23432,23479) #48 op
frame_arms_girl_season_01_04_jinrai_close_window=Trim(frame_arms_girl_season_01_04,23480,23515) #36
frame_arms_girl_season_01_04_baselard_show_her_room=Trim(frame_arms_girl_season_01_04,23904,23942) #39
frame_arms_girl_season_01_04_baselard_hold_robot_cleaner=Trim(frame_arms_girl_season_01_04,24866,25094) #229
frame_arms_girl_season_01_04_stylet_s_room=Trim(frame_arms_girl_season_01_04,26287,26352) #66
frame_arms_girl_season_01_04_materia_s_room=Trim(frame_arms_girl_season_01_04,27324,27572) #249
frame_arms_girl_season_01_04_frame_arms_girls_kirakira=Trim(frame_arms_girl_season_01_04,29967,30050) #84 ed recommend
frame_arms_girl_season_01_04_ao_chase_frame_arms_girls=Trim(frame_arms_girl_season_01_04,30282,30449) #168 op

frame_arms_girl_season_01_05_gourai_circle_throw_jinrai=Trim(frame_arms_girl_season_01_05,3404,3425) #22 op
frame_arms_girl_season_01_05_architect_appear=Trim(frame_arms_girl_season_01_05,4166,4225) #60 op
frame_arms_girl_season_01_05_ao_confused=Trim(frame_arms_girl_season_01_05,4662,4733) #72
frame_arms_girl_season_01_05_baselard_explain_materia_and_architect=Trim(frame_arms_girl_season_01_05,5151,5436) #286
frame_arms_girl_season_01_05_ao_happy=Trim(frame_arms_girl_season_01_05,5989,6210) #222
frame_arms_girl_season_01_05_architect_clone_fire=Trim(frame_arms_girl_season_01_05,6520,6552) #33
frame_arms_girl_season_01_05_gourai_take_violence_ram=Trim(frame_arms_girl_season_01_05,7518,7582) #65 op
frame_arms_girl_season_01_05_architect_full_armor_01=Trim(frame_arms_girl_season_01_05,8878,8919) #42
frame_arms_girl_season_01_05_architect_full_armor_02=Trim(frame_arms_girl_season_01_05,8920,9001) #82
frame_arms_girl_season_01_05_architect_is_kissed=Trim(frame_arms_girl_season_01_05,13541,13600) #60
frame_arms_girl_season_01_05_architect_disappear=Trim(frame_arms_girl_season_01_05,14783,14998) #216 op
frame_arms_girl_season_01_05_ao_open_architect_box_01=Trim(frame_arms_girl_season_01_05,16045,16140) #96
frame_arms_girl_season_01_05_ao_open_architect_box_02=Trim(frame_arms_girl_season_01_05,16141,16232) #92

frame_arms_girl_season_01_05_ao_cut_green_pepper=Trim(frame_arms_girl_season_01_05,17227,17262) #36
frame_arms_girl_season_01_05_frame_arms_girls_on_robot_cleaner=Trim(frame_arms_girl_season_01_05,18109,18190) #82 op
frame_arms_girl_season_01_05_robot_cleaner_random_move_in_ao_s_room=Trim(frame_arms_girl_season_01_05,18717,18776) #60
frame_arms_girl_season_01_05_gourai_jinrai_baselard_stylet_online=Trim(frame_arms_girl_season_01_05,19560,19714) #155
frame_arms_girl_season_01_05_frame_arms_girls_ready_set_go=Trim(frame_arms_girl_season_01_05,22767,22874) #108
frame_arms_girl_season_01_05_robot_cleaner_random_move_in_park=Trim(frame_arms_girl_season_01_05,23891,23986) #96
frame_arms_girl_season_01_05_baselard_and_stylet_fly_down=Trim(frame_arms_girl_season_01_05,24806,24895) #90
frame_arms_girl_season_01_05_stylet_get_wet=Trim(frame_arms_girl_season_01_05,27290,27397) #108
frame_arms_girl_season_01_05_baselard_get_wet=Trim(frame_arms_girl_season_01_05,27398,27505) #108
frame_arms_girl_season_01_05_architect_raise_vinegar=Trim(frame_arms_girl_season_01_05,28082,28165) #84 op
frame_arms_girl_season_01_05_ao_cry_for_cooking_failure=Trim(frame_arms_girl_season_01_05,28779,29026) #248

frame_arms_girl_season_01_06_ao_naked_and_architect_have_new_room=Trim(frame_arms_girl_season_01_06,2538,2609) #72
frame_arms_girl_season_01_06_ao_see_architect_s_room=Trim(frame_arms_girl_season_01_06,4243,4645) #403
frame_arms_girl_season_01_06_ao_wear_yukata=Trim(frame_arms_girl_season_01_06,4837,4932) #96 op
frame_arms_girl_season_01_06_ao_turn_head_and_jinrai_jump=Trim(frame_arms_girl_season_01_06,5833,5964) #132
frame_arms_girl_season_01_06_jinrai_criticize_ao_wear=Trim(frame_arms_girl_season_01_06,7138,7229) #92
frame_arms_girl_season_01_06_jinrai_crawl=Trim(frame_arms_girl_season_01_06,7290,7307) #18
frame_arms_girl_season_01_06_ao_feel_itchy=Trim(frame_arms_girl_season_01_06,7332,7355) #24 op
frame_arms_girl_season_01_06_jinrai_cut_ao_s_pantie_01=Trim(frame_arms_girl_season_01_06,7425,7448) #24
frame_arms_girl_season_01_06_jinrai_cut_ao_s_pantie_02=Trim(frame_arms_girl_season_01_06,7449,7459) #11
frame_arms_girl_season_01_06_ao_feel_climax=Trim(frame_arms_girl_season_01_06,7460,7495) #36
frame_arms_girl_season_01_06_ao_feel_pantie_is_gone=Trim(frame_arms_girl_season_01_06,7550,7621) #72
frame_arms_girl_season_01_06_ao_see_broken_pantie=Trim(frame_arms_girl_season_01_06,8704,8952) #249
frame_arms_girl_season_01_06_ao_frustrated=Trim(frame_arms_girl_season_01_06,9523,9594) #72
frame_arms_girl_season_01_06_jinrai_pressured_by_weights=Trim(frame_arms_girl_season_01_06,11235,11612) #378
frame_arms_girl_season_01_06_jinrai_harakiri=Trim(frame_arms_girl_season_01_06,11650,11714) #65
frame_arms_girl_season_01_06_ao_happily_take_food=Trim(frame_arms_girl_season_01_06,12011,12074) #64
frame_arms_girl_season_01_06_ao_open_mouth=Trim(frame_arms_girl_season_01_06,12619,12666) #48
frame_arms_girl_season_01_06_ao_eat_takoyaki=Trim(frame_arms_girl_season_01_06,12667,12810) #144
frame_arms_girl_season_01_06_ao_and_frame_arms_girls_see_fireworks=Trim(frame_arms_girl_season_01_06,13960,14031) #72 op
frame_arms_girl_season_01_06_gourai_see_fireworks=Trim(frame_arms_girl_season_01_06,14326,14535) #210
frame_arms_girl_season_01_06_materia_white_and_black_fondle_ao_s_ass=Trim(frame_arms_girl_season_01_06,15447,15546) #100

frame_arms_girl_season_01_06_baselard_sit_on_robot_cleaner=Trim(frame_arms_girl_season_01_06,16655,16750) #96
frame_arms_girl_season_01_06_jinrai_write_slogan=Trim(frame_arms_girl_season_01_06,16910,16985) #76
frame_arms_girl_season_01_06_architect_charging=Trim(frame_arms_girl_season_01_06,16986,17075) #90
frame_arms_girl_season_01_06_gourai_use_charging_kun_to_make_phone_call=Trim(frame_arms_girl_season_01_06,17247,17447) #201
frame_arms_girl_season_01_06_bukiko_apply_color_to_tank_model=Trim(frame_arms_girl_season_01_06,17634,17813) #180 op
frame_arms_girl_season_01_06_gourai_architect_jinrai_stylet_ride_robot_cleaner=Trim(frame_arms_girl_season_01_06,19698,19745) #48
frame_arms_girl_season_01_06_baselard_materia_black_white_plan_bad_thing=Trim(frame_arms_girl_season_01_06,19842,19901) #60
frame_arms_girl_season_01_06_jinrai_and_architect_hold_hands=Trim(frame_arms_girl_season_01_06,22082,22291) #210
frame_arms_girl_season_01_06_baselard_materia_black_white_doing_bad_thing=Trim(frame_arms_girl_season_01_06,22967,23092) #126
frame_arms_girl_season_01_06_gourai_stylet_architect_jinrai_pop_head=Trim(frame_arms_girl_season_01_06,23756,23809) #54 op
frame_arms_girl_season_01_06_bukiko_talk_ghost_story=Trim(frame_arms_girl_season_01_06,23888,24007) #120
frame_arms_girl_season_01_06_architect_evade_books=Trim(frame_arms_girl_season_01_06,24421,24490) #70
frame_arms_girl_season_01_06_ghost_nipper=Trim(frame_arms_girl_season_01_06,27047,27427) #381
frame_arms_girl_season_01_06_ghost_nipper_cut_gourai=Trim(frame_arms_girl_season_01_06,27868,27963) #96
frame_arms_girl_season_01_06_bukiko_take_suenaga_mirai_and_explain=Trim(frame_arms_girl_season_01_06,28593,28844) #252 op
frame_arms_girl_season_01_06_nipako=Trim(frame_arms_girl_season_01_06,29680,29871) #192
frame_arms_girl_season_01_06_nipako_bow_to_stylet_gourai_architect_jinrai=Trim(frame_arms_girl_season_01_06,30040,30159) #120 op

frame_arms_girl_season_01_07_stylet_pull_baselard_back=Trim(frame_arms_girl_season_01_07,4458,4528) #71
frame_arms_girl_season_01_07_gourai_escape_from_materia_black_and_white=Trim(frame_arms_girl_season_01_07,5459,5537) #79
frame_arms_girl_season_01_07_baselard_ride_robot_cleaner_and_hit_cartons=Trim(frame_arms_girl_season_01_07,7058,7111) #54 op
frame_arms_girl_season_01_07_baselard_ride_robot_cleaner_and_search=Trim(frame_arms_girl_season_01_07,7965,8139) #175
frame_arms_girl_season_01_07_hresvelgr_search_and_found=Trim(frame_arms_girl_season_01_07,9220,9393) #174
frame_arms_girl_season_01_07_hresvelgr_online=Trim(frame_arms_girl_season_01_07,11152,11457) #306
frame_arms_girl_season_01_07_hresvelgr_fire_01=Trim(frame_arms_girl_season_01_07,12128,12197) #70 op
frame_arms_girl_season_01_07_hresvelgr_fire_02=Trim(frame_arms_girl_season_01_07,12385,12440) #56
frame_arms_girl_season_01_07_hresvelgr_stop_gourai_s_attack=Trim(frame_arms_girl_season_01_07,13762,13815) #54
frame_arms_girl_season_01_07_hresvelgr_ready_to_finish_gourai=Trim(frame_arms_girl_season_01_07,14272,14365) #94 op
frame_arms_girl_season_01_07_hresvelgr_break_window=Trim(frame_arms_girl_season_01_07,14967,15062) #96

frame_arms_girl_season_01_07_architect_see_jinrai=Trim(frame_arms_girl_season_01_07,16688,16813) #126
frame_arms_girl_season_01_07_gourai_imagine_full_armor=Trim(frame_arms_girl_season_01_07,18504,18659) #156
frame_arms_girl_season_01_07_ao_stop_gourai_punch=Trim(frame_arms_girl_season_01_07,19671,19818) #148 op
frame_arms_girl_season_01_07_gourai_embarassed=Trim(frame_arms_girl_season_01_07,21548,21619) #72 op
frame_arms_girl_season_01_07_cu_poche_gourai_baselard_stylet=Trim(frame_arms_girl_season_01_07,22629,22747) #119
frame_arms_girl_season_01_07_bukiko_make_plastic_parts=Trim(frame_arms_girl_season_01_07,23332,23427) #96
frame_arms_girl_season_01_07_cu_poche_materia_white_light_toward_materia_black_and_ao_press_face=Trim(frame_arms_girl_season_01_07,23428,23649) #222
frame_arms_girl_season_01_07_cu_poche_stylet_baselard_gourai_architect_see_top_secret_document=Trim(frame_arms_girl_season_01_07,23902,24153) #252
frame_arms_girl_season_01_07_cu_poche_gourai_architect_see_stylet_angry_to_baselard=Trim(frame_arms_girl_season_01_07,24190,24366) #177
frame_arms_girl_season_01_07_cu_poche_jinrai_on_mold=Trim(frame_arms_girl_season_01_07,25789,25930) #142
frame_arms_girl_season_01_07_bukiko_hold_gourai_box=Trim(frame_arms_girl_season_01_07,26867,26926) #60 op
frame_arms_girl_season_01_07_gourai_stand_up=Trim(frame_arms_girl_season_01_07,28575,28706) #132
frame_arms_girl_season_01_07_many_drones_fly_to_ao_s_home=Trim(frame_arms_girl_season_01_07,30106,30165) #60
frame_arms_girl_season_01_07_many_drones=Trim(frame_arms_girl_season_01_07,30166,30237) #72 op

frame_arms_girl_season_01_08_gourai_kai_move=Trim(frame_arms_girl_season_01_08,2368,2436) #69 op
frame_arms_girl_season_01_08_hresvelgr_fire=Trim(frame_arms_girl_season_01_08,2437,2582) #146 op
frame_arms_girl_season_01_08_hresvelgr_wield=Trim(frame_arms_girl_season_01_08,2620,2763) #144 op
frame_arms_girl_season_01_08_baselard_host_go_go_gourai_kai_event=Trim(frame_arms_girl_season_01_08,6704,6784) #81
frame_arms_girl_season_01_08_frame_arms_girls_see_architect_sing=Trim(frame_arms_girl_season_01_08,11615,11714) #100

frame_arms_girl_season_01_08_shouwa_memorial_park_entry=Trim(frame_arms_girl_season_01_08,19527,19681) #155
frame_arms_girl_season_01_08_shouwa_memorial_park_fountain=Trim(frame_arms_girl_season_01_08,20147,20203) #57 op
frame_arms_girl_season_01_08_ao_and_gourai_talk_in_shouwa_memorial_park=Trim(frame_arms_girl_season_01_08,21096,21497) #402 op
frame_arms_girl_season_01_08_ao_s_mother_and_father=Trim(frame_arms_girl_season_01_08,23841,23930) #90 op
frame_arms_girl_season_01_08_little_girl_see_ao_and_raise_hand=Trim(frame_arms_girl_season_01_08,24965,25139) #175
frame_arms_girl_season_01_08_ao_and_gourai_under_tree_01=Trim(frame_arms_girl_season_01_08,28099,28212) #114
frame_arms_girl_season_01_08_ao_and_gourai_under_tree_02=Trim(frame_arms_girl_season_01_08,28650,28793) #144 op
frame_arms_girl_season_01_08_jinrai_laugh_but_architect_stylet_baselard_bored=Trim(frame_arms_girl_season_01_08,30167,30266) #100

frame_arms_girl_season_01_09_stylet_see_baselard_touch_sicked_ao=Trim(frame_arms_girl_season_01_09,2983,3052) #70
frame_arms_girl_season_01_09_frame_arms_girls_meeting_01=Trim(frame_arms_girl_season_01_09,4361,4450) #90 op
frame_arms_girl_season_01_09_gourai_kai_online=Trim(frame_arms_girl_season_01_09,4637,4806) #170
frame_arms_girl_season_01_09_architect_gourai_kai_jinrai_ride_robot_cleaner=Trim(frame_arms_girl_season_01_09,5388,5459) #72 op
frame_arms_girl_season_01_09_ao_see_strange_ingredients=Trim(frame_arms_girl_season_01_09,5785,5832) #48
frame_arms_girl_season_01_09_ao_frustrated_due_to_strange_ingredients=Trim(frame_arms_girl_season_01_09,5977,6203) #227
frame_arms_girl_season_01_09_stylet_imitate_chicken=Trim(frame_arms_girl_season_01_09,6382,6546) #165
frame_arms_girl_season_01_09_jinrai_plug_scallion_into_ao_s_ass=Trim(frame_arms_girl_season_01_09,7967,8062) #96
frame_arms_girl_season_01_09_stylet_and_baselard_make_medicine=Trim(frame_arms_girl_season_01_09,9081,9254) #174 op
frame_arms_girl_season_01_09_materia_black_and_white_ride_snakes=Trim(frame_arms_girl_season_01_09,9974,10108) #135 ed recommend
frame_arms_girl_season_01_09_materia_show_lizards=Trim(frame_arms_girl_season_01_09,10450,10611) #162
frame_arms_girl_season_01_09_frame_arms_girls_meeting_02=Trim(frame_arms_girl_season_01_09,11274,12035) #762
frame_arms_girl_season_01_09_frame_arms_girls_set_off=Trim(frame_arms_girl_season_01_09,12784,12951) #168
frame_arms_girl_season_01_09_gourai_feed_ao=Trim(frame_arms_girl_season_01_09,13378,13470) #93 op
frame_arms_girl_season_01_09_gourai_talk_with_sicked_ao=Trim(frame_arms_girl_season_01_09,14167,14298) #132
frame_arms_girl_season_01_09_other_frame_arms_girls_see_gourai_talk_with_sicked_ao=Trim(frame_arms_girl_season_01_09,14299,14918) #620

frame_arms_girl_season_01_09_gourai_see_baselard_and_stylet_tease_ao=Trim(frame_arms_girl_season_01_09,17039,17167) #129
frame_arms_girl_season_01_09_jinrai_suddenly_appear=Trim(frame_arms_girl_season_01_09,17960,18019) #60
frame_arms_girl_season_01_09_baselard_stylet_ao_gourai_jinrai_see_elephants=Trim(frame_arms_girl_season_01_09,18426,18533) #108
frame_arms_girl_season_01_09_baselard_stylet_ao_gourai_jinrai_eat_in_zoo=Trim(frame_arms_girl_season_01_09,18779,18850) #72
frame_arms_girl_season_01_09_stylet_baselard_gourai_ao_jinrai_get_wet=Trim(frame_arms_girl_season_01_09,19109,19228) #120
frame_arms_girl_season_01_09_stylet_baselard_ao_architect_gourai_jinrai_eat_lunch=Trim(frame_arms_girl_season_01_09,21591,21710) #120

frame_arms_girl_season_01_09_frame_arms_girls_in_school=Trim(frame_arms_girl_season_01_09,23436,24129) #694
frame_arms_girl_season_01_09_frame_arms_girls_in_school_jinrai_01=Trim(frame_arms_girl_season_01_09,23436,23491) #56
frame_arms_girl_season_01_09_frame_arms_girls_in_school_jinrai_02=Trim(frame_arms_girl_season_01_09,23492,23608) #117
frame_arms_girl_season_01_09_frame_arms_girls_in_school_gourai_01=Trim(frame_arms_girl_season_01_09,23609,23625) #17
frame_arms_girl_season_01_09_frame_arms_girls_in_school_gourai_02=Trim(frame_arms_girl_season_01_09,23626,23702) #77
frame_arms_girl_season_01_09_frame_arms_girls_in_school_stylet=Trim(frame_arms_girl_season_01_09,23703,23810) #108
frame_arms_girl_season_01_09_frame_arms_girls_in_school_baselard=Trim(frame_arms_girl_season_01_09,23811,23890) #80
frame_arms_girl_season_01_09_frame_arms_girls_in_school_architect=Trim(frame_arms_girl_season_01_09,23891,23986) #96
frame_arms_girl_season_01_09_frame_arms_girls_in_school_materia_black_and_white=Trim(frame_arms_girl_season_01_09,23987,24129) #143

frame_arms_girl_season_01_09_architect_gourai_ao_baselard_jinrai_stylet_at_beach=Trim(frame_arms_girl_season_01_09,24166,24331) #166
frame_arms_girl_season_01_09_materia_black_and_white_at_beach=Trim(frame_arms_girl_season_01_09,24332,24421) #90
frame_arms_girl_season_01_09_frame_arms_girls_at_beach=Trim(frame_arms_girl_season_01_09,24422,24483) #62
frame_arms_girl_season_01_09_ao_jinrai_baselard_architect_gourai_stylet_cosplay_maid=Trim(frame_arms_girl_season_01_09,24484,24696) #213
frame_arms_girl_season_01_09_materia_black_and_white_cosplay_sm_queen=Trim(frame_arms_girl_season_01_09,24697,24767) #71
frame_arms_girl_season_01_09_architect_gourai_ao_see_jinrai_stylet_baselard_take_materia_black_and_white_away=Trim(frame_arms_girl_season_01_09,24768,24827) #60
frame_arms_girl_season_01_09_frame_arms_girls_join_athletic_meet=Trim(frame_arms_girl_season_01_09,24828,25029) #202
frame_arms_girl_season_01_09_frame_arms_girls_join_matsuri=Trim(frame_arms_girl_season_01_09,25030,25221) #192
frame_arms_girl_season_01_09_frame_arms_girls_band=Trim(frame_arms_girl_season_01_09,25222,25434) #213
frame_arms_girl_season_01_09_frame_arms_girls_celebrate_christmas=Trim(frame_arms_girl_season_01_09,25435,25698) #264
frame_arms_girl_season_01_09_frame_arms_girls_new_year=Trim(frame_arms_girl_season_01_09,25699,25818) #120
frame_arms_girl_season_01_09_frame_arms_girls_graduate=Trim(frame_arms_girl_season_01_09,26536,26679) #144
frame_arms_girl_season_01_09_frame_arms_girls_surprised=Trim(frame_arms_girl_season_01_09,27097,27156) #60 op
frame_arms_girl_season_01_09_frame_arms_girls_encourage=Trim(frame_arms_girl_season_01_09,27738,27875) #138
frame_arms_girl_season_01_09_ao_see_frame_arms_girls_happy=Trim(frame_arms_girl_season_01_09,30218,30289) #72 op

frame_arms_girl_season_01_10_stylet_surrounded_by_loach=Trim(frame_arms_girl_season_01_10,5072,5350) #279 op
frame_arms_girl_season_01_10_jinrai_imagine_ao_sumo=Trim(frame_arms_girl_season_01_10,8468,8559) #92
frame_arms_girl_season_01_10_pot_ingredients=Trim(frame_arms_girl_season_01_10,10278,10361) #84
frame_arms_girl_season_01_10_ao_see_loach_moving=Trim(frame_arms_girl_season_01_10,10362,10453) #92
frame_arms_girl_season_01_10_ao_discuss_pot_with_frame_arms_girls=Trim(frame_arms_girl_season_01_10,10705,10809) #105
frame_arms_girl_season_01_10_frame_arms_girls_find_red_session_base=Trim(frame_arms_girl_season_01_10,14670,14771) #102
frame_arms_girl_season_01_10_charging_kun_pull_red_session_base=Trim(frame_arms_girl_season_01_10,15475,15522) #48 op

frame_arms_girl_season_01_10_frame_arms_girls_fix_red_session_base=Trim(frame_arms_girl_season_01_10,17692,17775) #84
frame_arms_girl_season_01_10_jinrai_as_ashita_no_jou=Trim(frame_arms_girl_season_01_10,18235,18294) #60 op
frame_arms_girl_season_01_10_stylet_see_hresvelgr_suddenly_appear=Trim(frame_arms_girl_season_01_10,18954,19276) #323
frame_arms_girl_season_01_10_hresvelgr_pole_vault_to_ao=Trim(frame_arms_girl_season_01_10,21862,21897) #36 op
frame_arms_girl_season_01_10_gourai_attack_hresvelgr_on_ao_01=Trim(frame_arms_girl_season_01_10,22629,22647) #19
frame_arms_girl_season_01_10_gourai_attack_hresvelgr_on_ao_02=Trim(frame_arms_girl_season_01_10,22648,22701) #54
frame_arms_girl_season_01_10_gourai_kai_evade_hresvelgr_s_shoot=Trim(frame_arms_girl_season_01_10,24313,24372) #60
frame_arms_girl_season_01_10_hresvelgr_evade_gourai_kai_s_shoot=Trim(frame_arms_girl_season_01_10,24520,24551) #32 op
frame_arms_girl_season_01_10_stylet_feel_climax=Trim(frame_arms_girl_season_01_10,24868,24917) #50
frame_arms_girl_season_01_10_hresvelgr_and_gourai_kai_fighting=Trim(frame_arms_girl_season_01_10,25504,25631) #128 op
frame_arms_girl_season_01_10_hresvelgr_attack_and_gourai_kai_defend=Trim(frame_arms_girl_season_01_10,26884,27024) #141
frame_arms_girl_season_01_10_gourai_kai_angry=Trim(frame_arms_girl_season_01_10,27575,27738) #164
frame_arms_girl_season_01_10_hresvelgr_get_beryl_smasher=Trim(frame_arms_girl_season_01_10,28168,28293) #126
frame_arms_girl_season_01_10_hresvelgr_make_tornado=Trim(frame_arms_girl_season_01_10,28442,28573) #132
frame_arms_girl_season_01_10_hresvelgr_use_beryl_smasher=Trim(frame_arms_girl_season_01_10,28646,28789) #144
frame_arms_girl_season_01_10_gourai_fire=Trim(frame_arms_girl_season_01_10,28790,28849) #60 op
frame_arms_girl_season_01_10_ao_s_room_lost_electronic_power=Trim(frame_arms_girl_season_01_10,29178,29273) #96
frame_arms_girl_season_01_10_hresvelgr_leave=Trim(frame_arms_girl_season_01_10,29496,29603) #108
frame_arms_girl_season_01_10_architect_sleeping=Trim(frame_arms_girl_season_01_10,30000,30047) #48
frame_arms_girl_season_01_10_gourai_see_moon=Trim(frame_arms_girl_season_01_10,30245,30304) #60 op

frame_arms_girl_season_01_11_gourai_kai_move_back_then_fire=Trim(frame_arms_girl_season_01_11,2752,2836) #85
frame_arms_girl_season_01_11_hresvelgr_fire=Trim(frame_arms_girl_season_01_11,3290,3364) #75
frame_arms_girl_season_01_11_hresvelgr_finish_gourai_kai=Trim(frame_arms_girl_season_01_11,3887,3905) #19
frame_arms_girl_season_01_11_income_notification=Trim(frame_arms_girl_season_01_11,4333,4354) #22 op
frame_arms_girl_season_01_11_ao_appear_in_video=Trim(frame_arms_girl_season_01_11,4380,4421) #42 op
frame_arms_girl_season_01_11_ao_smile=Trim(frame_arms_girl_season_01_11,5805,5933) #129
frame_arms_girl_season_01_11_hresvelgr_fly_away=Trim(frame_arms_girl_season_01_11,6413,6514) #102 op
frame_arms_girl_season_01_11_charging_kun_clean_floor=Trim(frame_arms_girl_season_01_11,7274,7621) #348
frame_arms_girl_season_01_11_materia_white_serious=Trim(frame_arms_girl_season_01_11,8660,8695) #36
frame_arms_girl_season_01_11_materia_black_serious=Trim(frame_arms_girl_season_01_11,8696,8731) #36
frame_arms_girl_season_01_11_ao_see_hresvelgr_fly=Trim(frame_arms_girl_season_01_11,10074,10209) #136
frame_arms_girl_season_01_11_gourai_memory=Trim(frame_arms_girl_season_01_11,10792,10935) #144 op
frame_arms_girl_season_01_11_hresvelgr_fly_high=Trim(frame_arms_girl_season_01_11,11986,12137) #152

frame_arms_girl_season_01_11_materia_imagine_ao_wet_and_naked=Trim(frame_arms_girl_season_01_11,15666,15881) #216
frame_arms_girl_season_01_11_onsen=Trim(frame_arms_girl_season_01_11,16802,16846) #45
frame_arms_girl_season_01_11_suenaga_mirai_figure_in_onsen=Trim(frame_arms_girl_season_01_11,16958,17020) #63
frame_arms_girl_season_01_11_charging_kun_become_seat_in_onsen=Trim(frame_arms_girl_season_01_11,18048,18093) #46
frame_arms_girl_season_01_11_frame_arms_girls_in_onsen=Trim(frame_arms_girl_season_01_11,18878,18961) #84 op
frame_arms_girl_season_01_11_materia_white_take_bath_in_onsen=Trim(frame_arms_girl_season_01_11,18962,19033) #72
frame_arms_girl_season_01_11_charging_kun_drooling=Trim(frame_arms_girl_season_01_11,19106,19177) #72
frame_arms_girl_season_01_11_baselard_ride_duck=Trim(frame_arms_girl_season_01_11,19178,19249) #72
frame_arms_girl_season_01_11_materia_black_catch_stylet_s_breast=Trim(frame_arms_girl_season_01_11,19250,19321) #72
frame_arms_girl_season_01_11_architect_dizzy=Trim(frame_arms_girl_season_01_11,19550,19675) #126
frame_arms_girl_season_01_11_gourai_want_serious_response=Trim(frame_arms_girl_season_01_11,20776,20919) #144
frame_arms_girl_season_01_11_frame_arms_girls_take_a_break=Trim(frame_arms_girl_season_01_11,23519,23656) #138
frame_arms_girl_season_01_11_hresvelgr_ater_punch_gourai_kai_01=Trim(frame_arms_girl_season_01_11,29385,29442) #58 op
frame_arms_girl_season_01_11_hresvelgr_ater_punch_gourai_kai_02=Trim(frame_arms_girl_season_01_11,29443,29493) #51
frame_arms_girl_season_01_11_hresvelgr_ater_fire=Trim(frame_arms_girl_season_01_11,29954,30089) #136 op

frame_arms_girl_season_01_12_frame_arms_girls_ricocheted=Trim(frame_arms_girl_season_01_12,2135,2186) #52 op
frame_arms_girl_season_01_12_gourai_kai_dash_and_jump=Trim(frame_arms_girl_season_01_12,2722,2770) #49
frame_arms_girl_season_01_12_frame_arms_girls_prepare_weapon=Trim(frame_arms_girl_season_01_12,3939,3998) #60
frame_arms_girl_season_01_12_gourai_kai_full_armor_00=Trim(frame_arms_girl_season_01_12,5916,5975) #60
frame_arms_girl_season_01_12_gourai_kai_full_armor_01=Trim(frame_arms_girl_season_01_12,5976,6215) #240 op
frame_arms_girl_season_01_12_gourai_kai_full_armor_versus_hresvelgr_ater_in_front_of_earth=Trim(frame_arms_girl_season_01_12,6854,7040) #187 op
frame_arms_girl_season_01_12_gourai_kai_full_armor_dog_fight_with_hresvelgr_ater=Trim(frame_arms_girl_season_01_12,7231,7310) #80
frame_arms_girl_season_01_12_gourai_kai_full_armor_fight_with_hresvelgr_ater=Trim(frame_arms_girl_season_01_12,7449,7538) #90
frame_arms_girl_season_01_12_drone_catch_gourai=Trim(frame_arms_girl_season_01_12,9752,9816) #65
frame_arms_girl_season_01_12_ao_fall_down=Trim(frame_arms_girl_season_01_12,9839,9889) #51 op
frame_arms_girl_season_01_12_hresvelgr_ater_fall_down=Trim(frame_arms_girl_season_01_12,10012,10050) #39 op
frame_arms_girl_season_01_12_hresvelgr_ater_in_ao_s_hand=Trim(frame_arms_girl_season_01_12,10471,10658) #188
frame_arms_girl_season_01_12_gourai_cry_01=Trim(frame_arms_girl_season_01_12,10855,10914) #60
frame_arms_girl_season_01_12_gourai_cry_02=Trim(frame_arms_girl_season_01_12,10915,11022) #108 op
frame_arms_girl_season_01_12_gourai_warm_up=Trim(frame_arms_girl_season_01_12,12632,12679) #48

frame_arms_girl_season_01_12_ao_see_snow_01=Trim(frame_arms_girl_season_01_12,14954,15030) #77
frame_arms_girl_season_01_12_ao_see_snow_02=Trim(frame_arms_girl_season_01_12,15031,15108) #78
frame_arms_girl_season_01_12_hresvelgr_ater_confused=Trim(frame_arms_girl_season_01_12,15160,15207) #48 op
frame_arms_girl_season_01_12_frame_arms_girls_on_roof=Trim(frame_arms_girl_season_01_12,15836,16051) #216
frame_arms_girl_season_01_12_shouwa_memorial_park_night=Trim(frame_arms_girl_season_01_12,18159,18230) #72
frame_arms_girl_season_01_12_frame_arms_girls_listen_architect_sing=Trim(frame_arms_girl_season_01_12,18394,18579) #186 op
frame_arms_girl_season_01_12_ao_and_frame_arms_girls_celebrate_christmas=Trim(frame_arms_girl_season_01_12,19232,19394) #163 op
frame_arms_girl_season_01_12_ao_and_materia_white_black_stylet_baselard_gourai_in_vr_space=Trim(frame_arms_girl_season_01_12,25651,25905) #255
