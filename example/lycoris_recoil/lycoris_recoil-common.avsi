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

lycoris_recoil_01=FFMS2_VIDEO_SOURCE("src\[Ohys-Raws] Lycoris Recoil (BS11 1280x720 x264 AAC)\[Ohys-Raws] Lycoris Recoil - 01 (BS11 1280x720 x264 AAC).mp4")
lycoris_recoil_02=FFMS2_VIDEO_SOURCE("src\[Ohys-Raws] Lycoris Recoil (BS11 1280x720 x264 AAC)\[Ohys-Raws] Lycoris Recoil - 02 (BS11 1280x720 x264 AAC).mp4")
lycoris_recoil_03=FFMS2_VIDEO_SOURCE("src\[Ohys-Raws] Lycoris Recoil (BS11 1280x720 x264 AAC)\[Ohys-Raws] Lycoris Recoil - 03 (BS11 1280x720 x264 AAC).mp4")
lycoris_recoil_04=FFMS2_VIDEO_SOURCE("src\[Ohys-Raws] Lycoris Recoil (BS11 1280x720 x264 AAC)\[Ohys-Raws] Lycoris Recoil - 04 (BS11 1280x720 x264 AAC).mp4")
lycoris_recoil_05=FFMS2_VIDEO_SOURCE("src\[Ohys-Raws] Lycoris Recoil (BS11 1280x720 x264 AAC)\[Ohys-Raws] Lycoris Recoil - 05 (BS11 1280x720 x264 AAC).mp4")
lycoris_recoil_06=FFMS2_VIDEO_SOURCE("src\[Ohys-Raws] Lycoris Recoil (BS11 1280x720 x264 AAC)\[Ohys-Raws] Lycoris Recoil - 06 (BS11 1280x720 x264 AAC).mp4")
lycoris_recoil_07=FFMS2_VIDEO_SOURCE("src\[Ohys-Raws] Lycoris Recoil (BS11 1280x720 x264 AAC)\[Ohys-Raws] Lycoris Recoil - 07 (BS11 1280x720 x264 AAC).mp4")
lycoris_recoil_08=FFMS2_VIDEO_SOURCE("src\[Ohys-Raws] Lycoris Recoil (BS11 1280x720 x264 AAC)\[Ohys-Raws] Lycoris Recoil - 08 (BS11 1280x720 x264 AAC).mp4")
lycoris_recoil_09=FFMS2_VIDEO_SOURCE("src\[Ohys-Raws] Lycoris Recoil (BS11 1280x720 x264 AAC)\[Ohys-Raws] Lycoris Recoil - 09 (BS11 1280x720 x264 AAC).mp4")
lycoris_recoil_10=FFMS2_VIDEO_SOURCE("src\[Ohys-Raws] Lycoris Recoil (BS11 1280x720 x264 AAC)\[Ohys-Raws] Lycoris Recoil - 10 (BS11 1280x720 x264 AAC).mp4")
lycoris_recoil_11=FFMS2_VIDEO_SOURCE("src\[Ohys-Raws] Lycoris Recoil (BS11 1280x720 x264 AAC)\[Ohys-Raws] Lycoris Recoil - 11 (BS11 1280x720 x264 AAC).mp4")
lycoris_recoil_12=FFMS2_VIDEO_SOURCE("src\[Ohys-Raws] Lycoris Recoil (BS11 1280x720 x264 AAC)\[Ohys-Raws] Lycoris Recoil - 12 (BS11 1280x720 x264 AAC).mp4")
lycoris_recoil_13=FFMS2_VIDEO_SOURCE("src\[Ohys-Raws] Lycoris Recoil (BS11 1280x720 x264 AAC)\[Ohys-Raws] Lycoris Recoil - 13 END (BS11 1280x720 x264 AAC).mp4")

lycoris_recoil_clean_op=Trim(lycoris_recoil_02,1727,3883)
lycoris_recoil_clean_ed=Trim(lycoris_recoil_01,32691,34524)
lycoris_recoil_final_ed=Trim(lycoris_recoil_13,30421,32254)

######## Trim ########

lycoris_recoil_clean_op_01=Trim(lycoris_recoil_clean_op,0,202)
lycoris_recoil_clean_op_02=Trim(lycoris_recoil_clean_op,203,460)
lycoris_recoil_clean_op_03=Trim(lycoris_recoil_clean_op,461,1051)
lycoris_recoil_clean_op_04=Trim(lycoris_recoil_clean_op,1052,1809)
lycoris_recoil_clean_op_05=Trim(lycoris_recoil_clean_op,1810,0)

lycoris_recoil_clean_ed_01=Trim(lycoris_recoil_clean_ed,0,1146)
lycoris_recoil_clean_ed_02_sum_up=Trim(lycoris_recoil_clean_ed,1147,1383)
lycoris_recoil_clean_ed_03=Trim(lycoris_recoil_clean_ed,1384,1526)
lycoris_recoil_clean_ed_04=Trim(lycoris_recoil_clean_ed,1527,0)

lycoris_recoil_final_ed_01=Trim(lycoris_recoil_final_ed,0,1117)
lycoris_recoil_final_ed_02_sum_up=Trim(lycoris_recoil_final_ed,1118,1387)
lycoris_recoil_final_ed_03=Trim(lycoris_recoil_final_ed,1388,0)



lycoris_recoil_01_chisato_ride_vespa_01=Trim(lycoris_recoil_01,1064,1093) #30
lycoris_recoil_01_chisato_ride_vespa_02=Trim(lycoris_recoil_01,1094,1225) #132
lycoris_recoil_01_lycoris=Trim(lycoris_recoil_01,1766,1805) #40 op
lycoris_recoil_01_chisato_ride_vespa_03=Trim(lycoris_recoil_01,2037,2083) #47 op
lycoris_recoil_01_takina_shoot_with_machine_gun=Trim(lycoris_recoil_01,4134,4168) #35
lycoris_recoil_01_fuki_punch_takina=Trim(lycoris_recoil_01,4787,4806) #20
lycoris_recoil_01_takina_open_door=Trim(lycoris_recoil_01,5925,6019) #95
lycoris_recoil_01_chisato_kirakira=Trim(lycoris_recoil_01,8804,8852) #49
lycoris_recoil_01_chisato_and_takina_walking=Trim(lycoris_recoil_01,11521,11723) #203
lycoris_recoil_01_chisato_and_takina_walking_under_sakura_tree=Trim(lycoris_recoil_01,13293,13402) #110
lycoris_recoil_01_takina_reload_bullet=Trim(lycoris_recoil_01,26145,26223) #79
lycoris_recoil_01_chisato_push_gun_down=Trim(lycoris_recoil_01,26224,26281) #58
lycoris_recoil_01_chisato_dodge_bullet=Trim(lycoris_recoil_01,28074,28133) #60 op
lycoris_recoil_01_chisato_shoot_terrorist=Trim(lycoris_recoil_01,28134,28270) #137 ed
lycoris_recoil_01_chisato_and_others_selfie=Trim(lycoris_recoil_01,31998,32063) #66 op

lycoris_recoil_02_walnut_show_explosion_to_robota=Trim(lycoris_recoil_02,827,1010) #184 ed
lycoris_recoil_02_walnut_and_robota_in_vr=Trim(lycoris_recoil_02,1189,1326) #138 op
lycoris_recoil_02_takina_take_band_aid_off=Trim(lycoris_recoil_02,5660,5856) #197
lycoris_recoil_02_chisato_prepare_weapon=Trim(lycoris_recoil_02,6323,6450) #128
lycoris_recoil_02_chisato_show_bentou=Trim(lycoris_recoil_02,8504,8554) #51
lycoris_recoil_02_takina_and_chisato_walk_across_gate=Trim(lycoris_recoil_02,9047,9225) #179
lycoris_recoil_02_takina_see_chisato_watch_lexus_lfa_and_exciting=Trim(lycoris_recoil_02,11156,11294) #139
lycoris_recoil_02_chisato_see_walnut_loose_control_of_car=Trim(lycoris_recoil_02,14788,14885) #98
lycoris_recoil_02_takina_shoot_drone_01=Trim(lycoris_recoil_02,16521,16563) #43
lycoris_recoil_02_takina_shoot_drone_02=Trim(lycoris_recoil_02,16564,16586) #23
lycoris_recoil_02_takina_shoot_drone_03=Trim(lycoris_recoil_02,16587,16668) #82 op
lycoris_recoil_02_takina_evade_bullet=Trim(lycoris_recoil_02,18696,18736) #41
lycoris_recoil_02_chisato_jump_up=Trim(lycoris_recoil_02,18850,18882) #33 ed
lycoris_recoil_02_chisato_jump_up_and_shoot=Trim(lycoris_recoil_02,18883,18911) #29
lycoris_recoil_02_chisato_run=Trim(lycoris_recoil_02,19812,19842) #31
lycoris_recoil_02_chisato_dodge_bullet=Trim(lycoris_recoil_02,20198,20232) #35
lycoris_recoil_02_chisato_shoot_under_bullet_rain_01=Trim(lycoris_recoil_02,20443,20467) #25
lycoris_recoil_02_chisato_shoot_under_bullet_rain_02=Trim(lycoris_recoil_02,20468,20481) #14
lycoris_recoil_02_walnut_get_shot=Trim(lycoris_recoil_02,23259,23305) #47
lycoris_recoil_02_mizuki_drink_beer=Trim(lycoris_recoil_02,25885,25955) #71 op
lycoris_recoil_02_chisato_pull_door_and_see_kurumi=Trim(lycoris_recoil_02,29790,29920) #131
lycoris_recoil_02_kurumi_get_shot_and_chisato_stunned=Trim(lycoris_recoil_02,32530,32595) #66

lycoris_recoil_03_chisato_see_rain_on_train=Trim(lycoris_recoil_03,6970,7226) #257
lycoris_recoil_03_takina_shoot_target=Trim(lycoris_recoil_03,10923,10975) #53 op
lycoris_recoil_03_chisato_hug_takina_and_turn_01=Trim(lycoris_recoil_03,21975,22032) #58 op
lycoris_recoil_03_chisato_hug_takina_and_turn_02=Trim(lycoris_recoil_03,22033,22074) #42 op
lycoris_recoil_03_chisato_hug_takina_and_turn_03=Trim(lycoris_recoil_03,22075,22133) #59 op
lycoris_recoil_03_chisato_finger=Trim(lycoris_recoil_03,22700,22984) #285
lycoris_recoil_03_lycoris_01=Trim(lycoris_recoil_03,23160,23237) #78 ed
lycoris_recoil_03_lycoris_02=Trim(lycoris_recoil_03,23238,23305) #68 ed
lycoris_recoil_03_chisato_vs_fuki=Trim(lycoris_recoil_03,25797,25880) #84
lycoris_recoil_03_chisato_dodge_bullet=Trim(lycoris_recoil_03,27769,27782) #14
lycoris_recoil_03_bullet_01=Trim(lycoris_recoil_03,28273,28295) #23 op
lycoris_recoil_03_bullet_02=Trim(lycoris_recoil_03,28296,28318) #23 op
lycoris_recoil_03_takina_see_sunset_on_train=Trim(lycoris_recoil_03,31992,32157) #166

lycoris_recoil_04_chisato_see_takina_dodge_01=Trim(lycoris_recoil_04,4659,4767) #109
lycoris_recoil_04_chisato_oversee_takina_s_pantie=Trim(lycoris_recoil_04,4825,4896) #57
lycoris_recoil_04_chisato_see_takina_dodge_02=Trim(lycoris_recoil_04,4897,4957) #61
lycoris_recoil_04_chisato_lift_skirt_and_see_takina_s_pantie=Trim(lycoris_recoil_04,6231,6343) #113 op
lycoris_recoil_04_kurumi_shout_toward_fan=Trim(lycoris_recoil_04,8935,9125) #191
lycoris_recoil_04_takina_wear_clothes_01=Trim(lycoris_recoil_04,9802,9864) #63 op
lycoris_recoil_04_takina_wear_clothes_02=Trim(lycoris_recoil_04,9865,9906) #42 op
lycoris_recoil_04_takina_wear_clothes_03=Trim(lycoris_recoil_04,9907,9956) #50 op
lycoris_recoil_04_takina_see_sky=Trim(lycoris_recoil_04,14611,14723) #113
lycoris_recoil_04_bird_in_sky=Trim(lycoris_recoil_04,14795,14938) #144 op
lycoris_recoil_04_chisato_simulate_chinanago=Trim(lycoris_recoil_04,16986,17308) #323
lycoris_recoil_04_chisato_and_takina_in_aquarium=Trim(lycoris_recoil_04,18168,18662) #495 ed
lycoris_recoil_04_takina_sakana=Trim(lycoris_recoil_04,20831,20889) #59 op
lycoris_recoil_04_takina_sakana_and_chisato_chinanago=Trim(lycoris_recoil_04,20953,21038) #86 ed
lycoris_recoil_04_majima_shoot_with_machine_gun=Trim(lycoris_recoil_04,25147,25181) #35
lycoris_recoil_04_majima_evade_lycoris=Trim(lycoris_recoil_04,25942,26131) #190
lycoris_recoil_04_kurumi_and_mizuki_show_chisato_s_pantie=Trim(lycoris_recoil_04,30543,30757) #215
lycoris_recoil_04_takina_laugh=Trim(lycoris_recoil_04,30935,31268) #334 ed

lycoris_recoil_05_ship_and_bird=Trim(lycoris_recoil_05,7598,7704) #107 ed
lycoris_recoil_05_ship_on_river_near_radio_tower=Trim(lycoris_recoil_05,7848,8026) #179 ed
lycoris_recoil_05_chisato_and_takina_selfie_with_old_man=Trim(lycoris_recoil_05,12916,12959) #44
lycoris_recoil_05_takina_touch_chisato_s_breast=Trim(lycoris_recoil_05,15803,15893) #91 ed
lycoris_recoil_05_kurumi_throw_drone=Trim(lycoris_recoil_05,18938,18988) #51 op
lycoris_recoil_05_takina_dash_and_shoot_back=Trim(lycoris_recoil_05,20573,20599) #27
lycoris_recoil_05_chisato_run_under_sky=Trim(lycoris_recoil_05,22690,22773) #84
lycoris_recoil_05_takina_get_shot_01=Trim(lycoris_recoil_05,25210,25231) #22
lycoris_recoil_05_takina_get_shot_02=Trim(lycoris_recoil_05,25232,25325) #94
lycoris_recoil_05_chisato_run_jump_and_shoot=Trim(lycoris_recoil_05,25528,25681) #154 op
lycoris_recoil_05_chisato_jump_down_and_shoot=Trim(lycoris_recoil_05,25713,25792) #80
lycoris_recoil_05_chisato_shoot_at_zero_distance=Trim(lycoris_recoil_05,25940,25997) #58 op
lycoris_recoil_05_takina_lie_on_chisato_s_breast=Trim(lycoris_recoil_05,32058,32109) #52 op

lycoris_recoil_06_chisato_victory=Trim(lycoris_recoil_06,5768,5819) #52
lycoris_recoil_06_kurumi_lie_down_and_shake=Trim(lycoris_recoil_06,7321,7457) #137 ed
lycoris_recoil_06_download=Trim(lycoris_recoil_06,12491,12561) #71
lycoris_recoil_06_kurumi_roll_down=Trim(lycoris_recoil_06,20884,20910) #27 op
lycoris_recoil_06_majima_and_guys=Trim(lycoris_recoil_06,23364,23428) #65 op
lycoris_recoil_06_majima_shoot=Trim(lycoris_recoil_06,24820,24872) #53
lycoris_recoil_06_kurumi_show_majima_and_guys=Trim(lycoris_recoil_06,30774,30881) #108
lycoris_recoil_06_takina_yoshi=Trim(lycoris_recoil_06,32567,32590) #24
lycoris_recoil_06_chisato_see_takina_yoshi=Trim(lycoris_recoil_06,32591,32690) #100 op ed

lycoris_recoil_07_chisato_show_imagine_majima=Trim(lycoris_recoil_07,1715,1762) #48
lycoris_recoil_07_chisato_thinking=Trim(lycoris_recoil_07,5591,5685) #95
lycoris_recoil_07_lycoreco_cafe=Trim(lycoris_recoil_07,5971,6041) #71 op
lycoris_recoil_07_mizuki_and_kurumi_see_chisato_hug_takina=Trim(lycoris_recoil_07,7491,7784) #294
lycoris_recoil_07_chisato_hug_takina=Trim(lycoris_recoil_07,7785,7939) #155 ed
lycoris_recoil_07_chisato_akuma=Trim(lycoris_recoil_07,10589,10659) #71
lycoris_recoil_07_chisato_mission_start_01=Trim(lycoris_recoil_07,19659,19735) #77
lycoris_recoil_07_chisato_mission_start_02=Trim(lycoris_recoil_07,19736,19759) #24 op
lycoris_recoil_07_chisato_mission_start_03=Trim(lycoris_recoil_07,19760,19817) #58
lycoris_recoil_07_wine=Trim(lycoris_recoil_07,20441,20499) #59
lycoris_recoil_07_takina_hit_chisato_s_ass=Trim(lycoris_recoil_07,22138,22208) #71 op
lycoris_recoil_07_shinji_close_to_mika_01=Trim(lycoris_recoil_07,25838,25923) #86 op
lycoris_recoil_07_shinji_close_to_mika_02=Trim(lycoris_recoil_07,25924,25968) #45
lycoris_recoil_07_chisato_pat_mika=Trim(lycoris_recoil_07,29023,29297) #275 ed

lycoris_recoil_08_takina_catch_dishes=Trim(lycoris_recoil_08,6720,6839) #120
lycoris_recoil_08_chisato_kung_fu=Trim(lycoris_recoil_08,7833,7928) #96
lycoris_recoil_08_chisato_and_takina_high_five=Trim(lycoris_recoil_08,8662,8752) #91
lycoris_recoil_08_takina_see_shit=Trim(lycoris_recoil_08,9811,9881) #71 op
lycoris_recoil_08_chisato_handstand=Trim(lycoris_recoil_08,12424,12518) #95 op
lycoris_recoil_08_takina_see_chisato_handstand=Trim(lycoris_recoil_08,12564,12742) #179 ed
lycoris_recoil_08_little_chisato_dash_and_shoot=Trim(lycoris_recoil_08,21890,21912) #23 op
lycoris_recoil_08_little_chisato=Trim(lycoris_recoil_08,21968,22011) #44
lycoris_recoil_08_little_chisato_s_eye=Trim(lycoris_recoil_08,22270,22328) #59
lycoris_recoil_08_little_chisato_shoot=Trim(lycoris_recoil_08,22628,22698) #71
lycoris_recoil_08_majima_show_alan_institute_icon=Trim(lycoris_recoil_08,23415,23478) #64
lycoris_recoil_08_takina_walk_to_chisato_on_bench=Trim(lycoris_recoil_08,27579,27637) #59
lycoris_recoil_08_takina_and_chisato_on_bench=Trim(lycoris_recoil_08,27775,28373) #599
lycoris_recoil_08_chisato_and_takina=Trim(lycoris_recoil_08,28374,28588) #215 ed
lycoris_recoil_08_chisato_embarassing_and_takina_laugh=Trim(lycoris_recoil_08,29854,30045) #192 op
lycoris_recoil_08_chisato_s_heart_is_breaking=Trim(lycoris_recoil_08,32431,32520) #90

lycoris_recoil_09_chisato_s_heart_is_broken=Trim(lycoris_recoil_09,5074,5198) #125
lycoris_recoil_09_car_out_of_control=Trim(lycoris_recoil_09,8746,8805) #60
lycoris_recoil_09_chisato_sit_as_aniki=Trim(lycoris_recoil_09,9377,9564) #188
lycoris_recoil_09_fujifilm_x100=Trim(lycoris_recoil_09,9676,9731) #56
lycoris_recoil_09_fuki_drag_sakura_away=Trim(lycoris_recoil_09,11923,11996) #74
lycoris_recoil_09_chisato_see_camera=Trim(lycoris_recoil_09,14995,15077) #83 op
lycoris_recoil_09_artificial_heart=Trim(lycoris_recoil_09,16612,16749) #138 ed
lycoris_recoil_09_chisato_on_wheelchair=Trim(lycoris_recoil_09,19221,19303) #83
lycoris_recoil_09_chisato_take_photo=Trim(lycoris_recoil_09,21252,21339) #88 op
lycoris_recoil_09_alan_institute_icon_and_gun=Trim(lycoris_recoil_09,22520,22566) #47
lycoris_recoil_09_chisato_and_takina_play_arcade=Trim(lycoris_recoil_09,27050,27097) #48
lycoris_recoil_09_chisato_and_takina_play_claw_machine=Trim(lycoris_recoil_09,27098,27138) #41
lycoris_recoil_09_takina_see_sunset=Trim(lycoris_recoil_09,28362,28444) #83 op
lycoris_recoil_09_takina_see_chisato_in_snow=Trim(lycoris_recoil_09,31423,31524) #102 op
lycoris_recoil_09_takina_turn_back_in_snow=Trim(lycoris_recoil_09,31585,31679) #95 ed
lycoris_recoil_09_chisato_turn_back_in_snow=Trim(lycoris_recoil_09,31680,31714) #35 ed
lycoris_recoil_09_takina_and_chisato_separate_in_snow=Trim(lycoris_recoil_09,31715,31815) #101 ed

lycoris_recoil_10_chisato_wear_wafuku_01=Trim(lycoris_recoil_10,19894,19970) #77 op
lycoris_recoil_10_enkuboku_analysis=Trim(lycoris_recoil_10,21447,21654) #208 ed
lycoris_recoil_10_chisato_wear_wafuku_02=Trim(lycoris_recoil_10,25874,25960) #87 op
lycoris_recoil_10_majima_announce=Trim(lycoris_recoil_10,27322,27452) #131 ed
lycoris_recoil_10_mika_and_chisato_take_weapon_and_go=Trim(lycoris_recoil_10,32608,32691) #84 op

lycoris_recoil_11_takina_see_majima_in_screen_on_bus=Trim(lycoris_recoil_11,946,992) #47
lycoris_recoil_11_mizuki_and_kurumi_separate_in_lounge=Trim(lycoris_recoil_11,5036,5178) #143 ed
lycoris_recoil_11_vibration_analysis=Trim(lycoris_recoil_11,8351,8782) #432 op
lycoris_recoil_11_image_matching=Trim(lycoris_recoil_11,8835,8953) #119
lycoris_recoil_11_kurumi_shout_out=Trim(lycoris_recoil_11,10269,10363) #95
lycoris_recoil_11_mizuki_push_kurumi_and_luggage=Trim(lycoris_recoil_11,11035,11142) #108
lycoris_recoil_11_majima_01=Trim(lycoris_recoil_11,12367,12401) #35 op
lycoris_recoil_11_majima_02=Trim(lycoris_recoil_11,12402,12466) #65 op
lycoris_recoil_11_takina_see_radio_tower_and_run=Trim(lycoris_recoil_11,16346,16392) #47 op
lycoris_recoil_11_chisato_jump_outside_of_redio_tower=Trim(lycoris_recoil_11,24515,24615) #101
lycoris_recoil_11_chisato_catch_and_wrestle_majima=Trim(lycoris_recoil_11,30194,30238) #45 op
lycoris_recoil_11_chisato_dodge_bullet=Trim(lycoris_recoil_11,32313,32335) #23
lycoris_recoil_11_chisato_and_takina_see_majima=Trim(lycoris_recoil_11,32596,32618) #23

lycoris_recoil_12_chisato_disable_majima_s_ears=Trim(lycoris_recoil_12,1080,1134) #55
lycoris_recoil_12_chisato_catch_angered_takina=Trim(lycoris_recoil_12,10350,10427) #78 ed
lycoris_recoil_12_chisato_kill_shinji=Trim(lycoris_recoil_12,11752,11822) #71 ed
lycoris_recoil_12_chisato_stop_and_hug_takina=Trim(lycoris_recoil_12,14659,14987) #328 op
lycoris_recoil_12_chisato_hug_takina=Trim(lycoris_recoil_12,15131,15327) #197
lycoris_recoil_12_erika_shake_head=Trim(lycoris_recoil_12,20592,20650) #59 op
lycoris_recoil_12_kurumi_swimming_in_vr=Trim(lycoris_recoil_12,25019,25065) #47 op
lycoris_recoil_12_swimming_to_robota=Trim(lycoris_recoil_12,25066,25136) #71

lycoris_recoil_13_chisato_evade_majima_shooting=Trim(lycoris_recoil_13,5836,5903) #68
lycoris_recoil_13_mika_kill_shinji=Trim(lycoris_recoil_13,11285,11431) #147 op
lycoris_recoil_13_chisato_vs_majima=Trim(lycoris_recoil_13,13793,13872) #80
lycoris_recoil_13_chisato_lie_down_and_shoot=Trim(lycoris_recoil_13,15695,15801) #107
lycoris_recoil_13_takina_run_on_glass=Trim(lycoris_recoil_13,15986,16006) #21
lycoris_recoil_13_takina_run_on_glass_and_pull_rope=Trim(lycoris_recoil_13,16133,16169) #37
lycoris_recoil_13_chisato_tied_by_rope=Trim(lycoris_recoil_13,16556,16651) #96 ed
lycoris_recoil_13_chisato_and_takina_tied_and_jump=Trim(lycoris_recoil_13,23613,23809) #197
lycoris_recoil_13_chisato_in_farm=Trim(lycoris_recoil_13,26490,26546) #57 op
lycoris_recoil_13_chisato_see_lake_on_ship=Trim(lycoris_recoil_13,26547,26614) #68 op
lycoris_recoil_13_mika_remove_letter=Trim(lycoris_recoil_13,28688,28734) #47
lycoris_recoil_13_chisato_hug_takina_on_beach=Trim(lycoris_recoil_13,29314,29669) #356 op ed
