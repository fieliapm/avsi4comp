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



Import("shingeki_no_kyojin-tv-common.avsi")

######## TV (1920*1080) ########

shingeki_no_kyojin_tv_14=FFMS2_VIDEO_SOURCE("src\anime\(2013Q2) 進撃の巨人  第14話 「まだ目を見れない」 (MBS 1280x720 x264 AAC).mp4")
shingeki_no_kyojin_tv_15=FFMS2_VIDEO_SOURCE("src\anime\(2013Q2) 進撃の巨人  第15話 「特別作戦班」 (MBS 1280x720 x264 AAC).mp4")
shingeki_no_kyojin_tv_18=FFMS2_VIDEO_SOURCE("src\anime\(2013Q2) 進撃の巨人 第18話 「巨大樹の森」 (MBS 1280x720 x264 AAC).mp4")
shingeki_no_kyojin_tv_19=FFMS2_VIDEO_SOURCE("src\anime\(2013Q2) 進撃の巨人 第19話 「噛みつく」 (MBS 1280x720 x264 AAC).mp4")
shingeki_no_kyojin_tv_19_cache02=FFMS2_VIDEO_SOURCE("src\anime\(2013Q2) 進撃の巨人 第19話 「噛みつく」 (MBS 1280x720 x264 AAC).mp4")
shingeki_no_kyojin_tv_20=FFMS2_VIDEO_SOURCE("src\anime\(2013Q2) 進撃の巨人 第20話 「エルヴィン・スミス」 (MBS 1280x720 x264 AAC).mp4")
shingeki_no_kyojin_tv_21=FFMS2_VIDEO_SOURCE("src\anime\(2013Q2) 進撃の巨人 第21話 「鉄槌」 (MBS 1280x720 x264-10b AAC).mp4")
shingeki_no_kyojin_tv_21_cache02=FFMS2_VIDEO_SOURCE("src\anime\(2013Q2) 進撃の巨人 第21話 「鉄槌」 (MBS 1280x720 x264-10b AAC).mp4")
shingeki_no_kyojin_tv_22=FFMS2_VIDEO_SOURCE("src\anime\(2013Q2) 進撃の巨人 第22話 「敗者達」 (MBS 1280x720 x264-10b AAC).mp4")
shingeki_no_kyojin_tv_23=FFMS2_VIDEO_SOURCE("src\anime\(2013Q2) 進撃の巨人 第23話 「微笑み」 (MBS 1280x720 x264-10b AAC).mp4")
shingeki_no_kyojin_tv_24=FFMS2_VIDEO_SOURCE("src\anime\(2013Q2) 進撃の巨人 第24話 「慈悲」 (MBS 1280x720 x264-10b AAC).mp4")
shingeki_no_kyojin_tv_24_cache02=FFMS2_VIDEO_SOURCE("src\anime\(2013Q2) 進撃の巨人 第24話 「慈悲」 (MBS 1280x720 x264-10b AAC).mp4")
shingeki_no_kyojin_tv_25=FFMS2_VIDEO_SOURCE("src\anime\(2013Q2) 進撃の巨人 第25話 「壁」 (MBS 1280x720 x264-10b AAC).mp4")

shingeki_no_kyojin_tv_clean_op_02=Trim(shingeki_no_kyojin_tv_14,1200,3356)
shingeki_no_kyojin_tv_clean_ed_02=Trim(shingeki_no_kyojin_tv_14,32172,34326)

######## Trim ########

shingeki_no_kyojin_tv_clean_op_02_01=Trim(shingeki_no_kyojin_tv_clean_op_02,0,1087)
shingeki_no_kyojin_tv_clean_op_02_02=Trim(shingeki_no_kyojin_tv_clean_op_02,1088,1998)
shingeki_no_kyojin_tv_clean_op_02_03=Trim(shingeki_no_kyojin_tv_clean_op_02,1999,0)

shingeki_no_kyojin_tv_clean_ed_02_01=Trim(shingeki_no_kyojin_tv_clean_ed_02,0,838)
shingeki_no_kyojin_tv_clean_ed_02_02=Trim(shingeki_no_kyojin_tv_clean_ed_02,839,1503)
shingeki_no_kyojin_tv_clean_ed_02_03=Trim(shingeki_no_kyojin_tv_clean_ed_02,1504,0)



shingeki_no_kyojin_tv_14_eren_remember_mikasa_armin_protect_him=Trim(shingeki_no_kyojin_tv_14,10790,10936) #147 ed2
shingeki_no_kyojin_tv_14_eren_remember_104th_corps_graduates=Trim(shingeki_no_kyojin_tv_14,11079,11153) #75 op2
shingeki_no_kyojin_tv_14_mike_smile=Trim(shingeki_no_kyojin_tv_14,12679,12798) #120 op2_flash
shingeki_no_kyojin_tv_14_court=Trim(shingeki_no_kyojin_tv_14,24343,24528) #186
shingeki_no_kyojin_tv_14_levi_kick_eren_01=Trim(shingeki_no_kyojin_tv_14,26649,26681) #33
shingeki_no_kyojin_tv_14_levi_kick_eren_02=Trim(shingeki_no_kyojin_tv_14,26747,26787) #41 op2_review_02
shingeki_no_kyojin_tv_14_levi_kick_eren_03=Trim(shingeki_no_kyojin_tv_14,27519,27614) #96

shingeki_no_kyojin_tv_15_petra=Trim(shingeki_no_kyojin_tv_15,5836,6030) #195 op2_flash
shingeki_no_kyojin_tv_15_aruro=Trim(shingeki_no_kyojin_tv_15,6055,6166) #112 op2_flash
shingeki_no_kyojin_tv_15_eldo=Trim(shingeki_no_kyojin_tv_15,6263,6394) #132 op2_flash
shingeki_no_kyojin_tv_15_gunter=Trim(shingeki_no_kyojin_tv_15,6419,6526) #108 op2_flash
shingeki_no_kyojin_tv_15_levi=Trim(shingeki_no_kyojin_tv_15,7171,7251) #81
shingeki_no_kyojin_tv_15_petra_cleaning=Trim(shingeki_no_kyojin_tv_15,8913,9080) #168 op2_review_02
shingeki_no_kyojin_tv_15_mike_smell=Trim(shingeki_no_kyojin_tv_15,11536,11629) #94
shingeki_no_kyojin_tv_15_hanji_get_high=Trim(shingeki_no_kyojin_tv_15,15965,16117) #153
shingeki_no_kyojin_tv_15_hanji_catch_eren_s_hand=Trim(shingeki_no_kyojin_tv_15,16169,16236) #68
shingeki_no_kyojin_tv_15_hanji_do_experiment_01=Trim(shingeki_no_kyojin_tv_15,17445,17516) #72
shingeki_no_kyojin_tv_15_hanji_do_experiment_02=Trim(shingeki_no_kyojin_tv_15,18364,18573) #210
shingeki_no_kyojin_tv_15_hanji_talk_with_kyojin=Trim(shingeki_no_kyojin_tv_15,18574,18678) #105
shingeki_no_kyojin_tv_15_hanji_light_kyojin=Trim(shingeki_no_kyojin_tv_15,21523,21708) #186 ed2
shingeki_no_kyojin_tv_15_hanji_sit_down=Trim(shingeki_no_kyojin_tv_15,21937,22128) #192 op2_review_01
shingeki_no_kyojin_tv_15_hanji_cry=Trim(shingeki_no_kyojin_tv_15,30990,31061) #72

shingeki_no_kyojin_tv_16_jean_watch_connie=Trim(shingeki_no_kyojin_tv_16,4426,4575) #150
shingeki_no_kyojin_tv_16_yumir_historia_sasha=Trim(shingeki_no_kyojin_tv_16_cache02,4576,4691) #116 op2_review_01
shingeki_no_kyojin_tv_16_reiner_annie_bertolt=Trim(shingeki_no_kyojin_tv_16,4692,4817) #126 op2_review_01
shingeki_no_kyojin_tv_16_jean_ask_marco=Trim(shingeki_no_kyojin_tv_16_cache02,5064,5112) #49 op2_review_01
shingeki_no_kyojin_tv_16_fire_and_people=Trim(shingeki_no_kyojin_tv_16,7216,7377) #162 op2
shingeki_no_kyojin_tv_16_annie_armin_connie=Trim(shingeki_no_kyojin_tv_16,9299,9430) #132 op2_review_01
shingeki_no_kyojin_tv_16_levi_go=Trim(shingeki_no_kyojin_tv_16,10799,10849) #51 op2_review_01
shingeki_no_kyojin_tv_16_levi_squad_ride_horse_in_field=Trim(shingeki_no_kyojin_tv_16,10850,10947) #98
shingeki_no_kyojin_tv_16_annie_armin_sasha_connie_near_wall=Trim(shingeki_no_kyojin_tv_16,11434,11505) #72 op2_review_01
shingeki_no_kyojin_tv_16_jean_talk_with_friend=Trim(shingeki_no_kyojin_tv_16_cache02,11998,12231) #234  op2_review_01
shingeki_no_kyojin_tv_16_reiner_bertolt_historia_yumir=Trim(shingeki_no_kyojin_tv_16,12587,12641) #55  op2_review_01
shingeki_no_kyojin_tv_16_levi_squad_ride_horse_into_forest=Trim(shingeki_no_kyojin_tv_16,13676,13743) #68
shingeki_no_kyojin_tv_16_104th_corps_graduates_see_other_people_leave_01=Trim(shingeki_no_kyojin_tv_16,18208,18320) #113
shingeki_no_kyojin_tv_16_104th_corps_graduates_see_other_people_leave_02=Trim(shingeki_no_kyojin_tv_16,18321,18380) #60
shingeki_no_kyojin_tv_16_104th_corps_graduates_see_other_people_leave_03=Trim(shingeki_no_kyojin_tv_16,18381,18448) #68
shingeki_no_kyojin_tv_16_104th_corps_graduates_see_other_people_leave_04=Trim(shingeki_no_kyojin_tv_16,18449,18568) #120
shingeki_no_kyojin_tv_16_104th_corps_graduates_see_other_people_leave_05=Trim(shingeki_no_kyojin_tv_16,18569,18664) #96 ed2
shingeki_no_kyojin_tv_16_104th_corps_graduates_see_other_people_leave_06=Trim(shingeki_no_kyojin_tv_16,18665,18784) #120
shingeki_no_kyojin_tv_16_104th_corps_graduates_see_other_people_leave_07=Trim(shingeki_no_kyojin_tv_16,18785,18903) #119
shingeki_no_kyojin_tv_16_104th_corps_graduates_see_other_people_leave_08=Trim(shingeki_no_kyojin_tv_16,18904,19070) #167
shingeki_no_kyojin_tv_16_104th_corps_graduates_see_other_people_leave_09=Trim(shingeki_no_kyojin_tv_16,19071,19141) #71 ed2
shingeki_no_kyojin_tv_16_104th_corps_graduates_see_other_people_leave_10=Trim(shingeki_no_kyojin_tv_16,19142,19206) #65
shingeki_no_kyojin_tv_16_104th_corps_graduates_see_other_people_leave_11=Trim(shingeki_no_kyojin_tv_16,19207,19265) #59
shingeki_no_kyojin_tv_16_104th_corps_graduates_see_other_people_leave_12=Trim(shingeki_no_kyojin_tv_16,19266,19325) #60
shingeki_no_kyojin_tv_16_kyojin_eat_jean_and_friends=Trim(shingeki_no_kyojin_tv_16,19326,19415) #90
shingeki_no_kyojin_tv_16_104th_corps_graduates_salute_to_erwin=Trim(shingeki_no_kyojin_tv_16,20517,21060) #544
shingeki_no_kyojin_tv_16_levi_squad_discuss=Trim(shingeki_no_kyojin_tv_16,22937,23141) #205 ed2
shingeki_no_kyojin_tv_16_people_ride_horse_in_sunset_field=Trim(shingeki_no_kyojin_tv_16,24330,24416) #87
shingeki_no_kyojin_tv_16_104th_corps_graduates=Trim(shingeki_no_kyojin_tv_16,25532,25627) #96
shingeki_no_kyojin_tv_16_wings_of_freedom=Trim(shingeki_no_kyojin_tv_16,26852,26929) #78 op2
shingeki_no_kyojin_tv_16_survey_corps=Trim(shingeki_no_kyojin_tv_16,27141,27260) #120
shingeki_no_kyojin_tv_16_survey_corps_and_eren=Trim(shingeki_no_kyojin_tv_16,27141,27326) #186 op2
shingeki_no_kyojin_tv_16_bell=Trim(shingeki_no_kyojin_tv_16,30490,30561) #72
shingeki_no_kyojin_tv_16_bell_cache02=Trim(shingeki_no_kyojin_tv_16_cache02,30490,30561) #72
shingeki_no_kyojin_tv_16_people_take_sword=Trim(shingeki_no_kyojin_tv_16_cache02,31382,31423) #42 op2_review_01
shingeki_no_kyojin_tv_16_erwin_bring_survey_corps=Trim(shingeki_no_kyojin_tv_16,31913,32003) #91

shingeki_no_kyojin_tv_17_survey_corps_go_outside=Trim(shingeki_no_kyojin_tv_17,4475,4534) #60
shingeki_no_kyojin_tv_17_survey_corps_attack_kyojin_01=Trim(shingeki_no_kyojin_tv_17,4717,4768) #52
shingeki_no_kyojin_tv_17_survey_corps_attack_kyojin_02=Trim(shingeki_no_kyojin_tv_17,4769,4831) #63 op2
shingeki_no_kyojin_tv_17_survey_corps_attack_kyojin_03=Trim(shingeki_no_kyojin_tv_17,4855,4918) #64 op2
shingeki_no_kyojin_tv_17_survey_corps_attack_kyojin_04=Trim(shingeki_no_kyojin_tv_17,4919,5008) #90 op2
shingeki_no_kyojin_tv_17_levi_squad_dash_forward=Trim(shingeki_no_kyojin_tv_17,5442,5537) #96 op2
shingeki_no_kyojin_tv_17_survey_corps_newbie_ride_horse_01=Trim(shingeki_no_kyojin_tv_17,6032,6066) #35
shingeki_no_kyojin_tv_17_survey_corps_newbie_ride_horse_02=Trim(shingeki_no_kyojin_tv_17,6067,6092) #26
shingeki_no_kyojin_tv_17_survey_corps_newbie_ride_horse_03=Trim(shingeki_no_kyojin_tv_17,6093,6117) #25
shingeki_no_kyojin_tv_17_survey_corps_dash_forward=Trim(shingeki_no_kyojin_tv_17,6449,6508) #60
shingeki_no_kyojin_tv_17_reiner_armin_jean_riding_horse_01=Trim(shingeki_no_kyojin_tv_17,6706,6763) #58
shingeki_no_kyojin_tv_17_reiner_armin_jean_riding_horse_02=Trim(shingeki_no_kyojin_tv_17,6764,6834) #71
shingeki_no_kyojin_tv_17_survey_corps_invent_formation=Trim(shingeki_no_kyojin_tv_17,6941,7480) #540
shingeki_no_kyojin_tv_17_crow_fly=Trim(shingeki_no_kyojin_tv_17,7892,7939) #48 op2
shingeki_no_kyojin_tv_17_erwin_squad_ride_horse_in_field=Trim(shingeki_no_kyojin_tv_17,8786,8875) #90 op2
shingeki_no_kyojin_tv_17_erwin_turn_direction=Trim(shingeki_no_kyojin_tv_17,8984,9103) #120
shingeki_no_kyojin_tv_17_kyojin_attack_sasha=Trim(shingeki_no_kyojin_tv_17,9442,9536) #95 op2
shingeki_no_kyojin_tv_17_kyojin_follow_sasha=Trim(shingeki_no_kyojin_tv_17,9596,9659) #64 op2
shingeki_no_kyojin_tv_17_armin_ride_horse_in_field=Trim(shingeki_no_kyojin_tv_17,11257,11472) #216 op2
shingeki_no_kyojin_tv_17_armin_shoot_flare_gun=Trim(shingeki_no_kyojin_tv_17,11549,11700) #152 op2
shingeki_no_kyojin_tv_17_strange_behavior_kyojin_run=Trim(shingeki_no_kyojin_tv_17,11815,11933) #119 op2
shingeki_no_kyojin_tv_17_soldier_cut_kyojin_leg=Trim(shingeki_no_kyojin_tv_17,12618,12714) #97 op2
shingeki_no_kyojin_tv_17_megata_no_kyojin_dash=Trim(shingeki_no_kyojin_tv_17,14160,14190) #31
shingeki_no_kyojin_tv_17_megata_no_kyojin_throw_soldier=Trim(shingeki_no_kyojin_tv_17,14647,14748) #102
shingeki_no_kyojin_tv_17_megata_no_kyojin_stomp_armin=Trim(shingeki_no_kyojin_tv_17,15879,15991) #113
shingeki_no_kyojin_tv_17_megata_no_kyojin_found_armin=Trim(shingeki_no_kyojin_tv_17,17691,17808) #118
shingeki_no_kyojin_tv_17_reiner_armin_follow_megata_no_kyojin=Trim(shingeki_no_kyojin_tv_17,19055,19280) #226 op2
shingeki_no_kyojin_tv_17_jean_shoot_flare_gun=Trim(shingeki_no_kyojin_tv_17,19583,19681) #99
shingeki_no_kyojin_tv_17_kyojin_attack_survey_corps_cg=Trim(shingeki_no_kyojin_tv_17,19984,20147) #164
shingeki_no_kyojin_tv_17_reiner_armin_jean_follow_megata_no_kyojin=Trim(shingeki_no_kyojin_tv_17,22995,23176) #182 ed2
shingeki_no_kyojin_tv_17_armin_think_mikasa_levi_s_attack=Trim(shingeki_no_kyojin_tv_17,27029,27196) #168 ed2
shingeki_no_kyojin_tv_17_megata_no_kyojin_attack_jean=Trim(shingeki_no_kyojin_tv_17,27537,27578) #42 op2
shingeki_no_kyojin_tv_17_armin_fall_down=Trim(shingeki_no_kyojin_tv_17,27769,27864) #96 ed2
shingeki_no_kyojin_tv_17_jean_evade_megata_no_kyojin_01=Trim(shingeki_no_kyojin_tv_17,28423,28445) #23
shingeki_no_kyojin_tv_17_jean_evade_megata_no_kyojin_02=Trim(shingeki_no_kyojin_tv_17,28446,28526) #81
shingeki_no_kyojin_tv_17_megata_no_kyojin_stop_attack=Trim(shingeki_no_kyojin_tv_17,28965,29000) #36
shingeki_no_kyojin_tv_17_reiner_attack_megata_no_kyojin_01=Trim(shingeki_no_kyojin_tv_17,29960,30037) #78
shingeki_no_kyojin_tv_17_reiner_attack_megata_no_kyojin_02=Trim(shingeki_no_kyojin_tv_17,30038,30079) #42
shingeki_no_kyojin_tv_17_reiner_escape_from_megata_no_kyojin_s_hand=Trim(shingeki_no_kyojin_tv_17,30783,30823) #41 op2_review_02

shingeki_no_kyojin_tv_18_historia_bring_horses=Trim(shingeki_no_kyojin_tv_18,9161,9253) #93 op2
shingeki_no_kyojin_tv_18_historia_cry=Trim(shingeki_no_kyojin_tv_18,10247,10495) #249 op2
shingeki_no_kyojin_tv_18_armin_jean_reiner_love_historia=Trim(shingeki_no_kyojin_tv_18,10594,10718) #125
shingeki_no_kyojin_tv_18_armin_squad_horse_dash_01=Trim(shingeki_no_kyojin_tv_18,10951,11246) #296
shingeki_no_kyojin_tv_18_armin_squad_horse_dash_02=Trim(shingeki_no_kyojin_tv_18,11319,11460) #142 op2
shingeki_no_kyojin_tv_18_levi_squad_horse_dash_01=Trim(shingeki_no_kyojin_tv_18,12141,12201) #61
shingeki_no_kyojin_tv_18_levi_squad_horse_dash_02=Trim(shingeki_no_kyojin_tv_18,12595,12642) #48
shingeki_no_kyojin_tv_18_levi_order_petra_forward_message=Trim(shingeki_no_kyojin_tv_18,12817,12948) #132 ed2
shingeki_no_kyojin_tv_18_levi_squad_horse_dash_03=Trim(shingeki_no_kyojin_tv_18,12949,13008) #60
shingeki_no_kyojin_tv_18_levi_order_eren_shoot_flare_gun=Trim(shingeki_no_kyojin_tv_18,13396,13532) #137
shingeki_no_kyojin_tv_18_solder_attack_megata_no_kyojin_01=Trim(shingeki_no_kyojin_tv_18,14429,14476) #48 op2
shingeki_no_kyojin_tv_18_solder_attack_megata_no_kyojin_02=Trim(shingeki_no_kyojin_tv_18,14534,14617) #84 op2
shingeki_no_kyojin_tv_18_solder_attack_megata_no_kyojin_03=Trim(shingeki_no_kyojin_tv_18,14966,15010) #45 op2
shingeki_no_kyojin_tv_18_megate_no_kyojin_jump=Trim(shingeki_no_kyojin_tv_18,15141,15199) #59
shingeki_no_kyojin_tv_18_megata_no_kyojin_play_yoyo_01=Trim(shingeki_no_kyojin_tv_18,15778,15885) #108
shingeki_no_kyojin_tv_18_megata_no_kyojin_play_yoyo_02=Trim(shingeki_no_kyojin_tv_18,15886,15969) #84
shingeki_no_kyojin_tv_18_megata_no_kyojin_play_yoyo_03=Trim(shingeki_no_kyojin_tv_18,15970,16023) #54
shingeki_no_kyojin_tv_18_soldier_ride_horse_and_escape=Trim(shingeki_no_kyojin_tv_18,16309,16404) #96
shingeki_no_kyojin_tv_18_megata_no_kyojin_kick_soldier=Trim(shingeki_no_kyojin_tv_18,16543,16587) #45
shingeki_no_kyojin_tv_18_soldier_ride_horse_in_field=Trim(shingeki_no_kyojin_tv_18,16606,16707) #102
shingeki_no_kyojin_tv_18_soldier_ride_horse_in_field_with_mark=Trim(shingeki_no_kyojin_tv_18,17162,17426) #265
shingeki_no_kyojin_tv_18_erwin_bring_survey_corps_into_forest=Trim(shingeki_no_kyojin_tv_18,18958,19029) #72
shingeki_no_kyojin_tv_18_survey_corps_go_into_forest=Trim(shingeki_no_kyojin_tv_18,19222,19293) #72
shingeki_no_kyojin_tv_18_sasha_ask_squad_leader=Trim(shingeki_no_kyojin_tv_18,19294,19617) #324
shingeki_no_kyojin_tv_18_forest_edge_01=Trim(shingeki_no_kyojin_tv_18,19714,19906) #193 op2
shingeki_no_kyojin_tv_18_forest_edge_02=Trim(shingeki_no_kyojin_tv_18,20369,20578) #cannot use
shingeki_no_kyojin_tv_18_connie_and_mikasa_ride_horse_near_forest_edge=Trim(shingeki_no_kyojin_tv_18,21259,21330) #72
shingeki_no_kyojin_tv_18_kyojin_run=Trim(shingeki_no_kyojin_tv_18,24498,24568) #71
shingeki_no_kyojin_tv_18_levi_squad_ride_horse_in_forest_01=Trim(shingeki_no_kyojin_tv_18,25158,25265) #108
shingeki_no_kyojin_tv_18_forest_inside=Trim(shingeki_no_kyojin_tv_18,25976,26107) #132 ed2
shingeki_no_kyojin_tv_18_levi_squad_ride_horse_in_forest_02=Trim(shingeki_no_kyojin_tv_18,26108,26335) #228 op2
shingeki_no_kyojin_tv_18_levi_squad_ride_horse_in_forest_03=Trim(shingeki_no_kyojin_tv_18,29255,29347) #93
shingeki_no_kyojin_tv_18_soldier_ready_to_attack_megata_kyojin=Trim(shingeki_no_kyojin_tv_18,29407,29464) #58
shingeki_no_kyojin_tv_18_megata_no_kyojin_pest_soldier=Trim(shingeki_no_kyojin_tv_18,29619,29705) #87
shingeki_no_kyojin_tv_18_megata_no_kyojin_try_to_catch_eren=Trim(shingeki_no_kyojin_tv_18,29804,30049) #246 op2
shingeki_no_kyojin_tv_18_eldo_gunter_escape=Trim(shingeki_no_kyojin_tv_18,30180,30277) #98
shingeki_no_kyojin_tv_18_soldier_follow_megata_no_kyojin=Trim(shingeki_no_kyojin_tv_18,30377,30460) #84
shingeki_no_kyojin_tv_18_megata_no_kyojin_kill_soldier=Trim(shingeki_no_kyojin_tv_18,30514,30703) #190 ed2
shingeki_no_kyojin_tv_18_megata_no_kyojin_watch_eren=Trim(shingeki_no_kyojin_tv_18,30704,30799) #96
shingeki_no_kyojin_tv_18_megata_no_kyojin_follow_levi_squad=Trim(shingeki_no_kyojin_tv_18,30998,31063) #66

shingeki_no_kyojin_tv_19_levi_squad_ride_horse_in_forest=Trim(shingeki_no_kyojin_tv_19,10012,10083) #72
shingeki_no_kyojin_tv_19_megata_no_kyojin_try_to_catch_soldier=Trim(shingeki_no_kyojin_tv_19,10128,10199) #72
shingeki_no_kyojin_tv_19_eren_transform_to_kyojin=Trim(shingeki_no_kyojin_tv_19,16165,16222) #58
shingeki_no_kyojin_tv_19_eren_stuck_in_kyojin_body_01=Trim(shingeki_no_kyojin_tv_19,16451,16546) #96
shingeki_no_kyojin_tv_19_eren_stuck_in_kyojin_body_02=Trim(shingeki_no_kyojin_tv_19,16547,16690) #144 ed2
shingeki_no_kyojin_tv_19_levi_squad_ready_to_kill_eren=Trim(shingeki_no_kyojin_tv_19,16962,17069) #108
shingeki_no_kyojin_tv_19_petra=Trim(shingeki_no_kyojin_tv_19,17070,17107) #38 op2_review_01
shingeki_no_kyojin_tv_19_eldo=Trim(shingeki_no_kyojin_tv_19_cache02,17108,17148) #41 op2_review_01
shingeki_no_kyojin_tv_19_aruro=Trim(shingeki_no_kyojin_tv_19,17149,17184) #36 op2_review_01
shingeki_no_kyojin_tv_19_gunter=Trim(shingeki_no_kyojin_tv_19_cache02,17185,17227) #43 op2_review_01
shingeki_no_kyojin_tv_19_eren_ask_everyone_shut_up=Trim(shingeki_no_kyojin_tv_19,19365,19412) #48 op2
shingeki_no_kyojin_tv_19_levi_squad_surround_stucked_eren=Trim(shingeki_no_kyojin_tv_19,19461,19578) #118
shingeki_no_kyojin_tv_19_hanji_happy_dash=Trim(shingeki_no_kyojin_tv_19,19579,19627) #49 op2
shingeki_no_kyojin_tv_19_hanji_drool=Trim(shingeki_no_kyojin_tv_19,19730,19816) #87
shingeki_no_kyojin_tv_19_eren_s_hand_stick_on_kyojin_body=Trim(shingeki_no_kyojin_tv_19,20487,20534) #48
shingeki_no_kyojin_tv_19_petra_tell_to_eren=Trim(shingeki_no_kyojin_tv_19,26522,26710) #189
shingeki_no_kyojin_tv_19_megata_no_kyojin_protect_her_nape=Trim(shingeki_no_kyojin_tv_19,27122,27173) #52 op2
shingeki_no_kyojin_tv_19_megata_no_kyojin_throw_soldier=Trim(shingeki_no_kyojin_tv_19,27535,27578) #44
shingeki_no_kyojin_tv_19_megata_no_kyojin_dash=Trim(shingeki_no_kyojin_tv_19,27816,27911) #96 ed2
shingeki_no_kyojin_tv_19_megata_no_kyojin_hit_trap=Trim(shingeki_no_kyojin_tv_19,29182,29277) #96
shingeki_no_kyojin_tv_19_erwin_order_survey_corps_to_catch_megata_no_kyojin=Trim(shingeki_no_kyojin_tv_19,29422,29484) #63
shingeki_no_kyojin_tv_19_megata_no_kyojin_is_under_attack=Trim(shingeki_no_kyojin_tv_19,29497,29727) #231 op2
shingeki_no_kyojin_tv_19_levi_leave_horse=Trim(shingeki_no_kyojin_tv_19,30230,30371) #142
shingeki_no_kyojin_tv_19_megata_no_kyojin_is_catched_01=Trim(shingeki_no_kyojin_tv_19,30502,30619) #118
shingeki_no_kyojin_tv_19_megata_no_kyojin_is_catched_02=Trim(shingeki_no_kyojin_tv_19,31239,31354) #116

shingeki_no_kyojin_tv_20_eldo_say_there_may_be_spy_in_survey_corps=Trim(shingeki_no_kyojin_tv_20,10388,10550) #163 ed2
shingeki_no_kyojin_tv_20_eren_remember_megata_no_kyojin_kill_soldiers=Trim(shingeki_no_kyojin_tv_20,12417,12526) #110
shingeki_no_kyojin_tv_20_armin_says_leaders_are_too_smart_to_understand=Trim(shingeki_no_kyojin_tv_20,14474,14713) #240
shingeki_no_kyojin_tv_20_erwin_order_soldiers=Trim(shingeki_no_kyojin_tv_20,14714,14889) #176
shingeki_no_kyojin_tv_20_erwin_order_soldiers_to_shoot=Trim(shingeki_no_kyojin_tv_20,15316,15359) #44
shingeki_no_kyojin_tv_20_fire_special_target_capture_weapon=Trim(shingeki_no_kyojin_tv_20,15384,15410) #27 op2
shingeki_no_kyojin_tv_20_megata_no_kyojin_is_catched=Trim(shingeki_no_kyojin_tv_20,15471,15669) #199
shingeki_no_kyojin_tv_20_levi_and_mike_try_to_take_annie_out_01=Trim(shingeki_no_kyojin_tv_20,16003,16078) #76
shingeki_no_kyojin_tv_20_levi_and_mike_try_to_take_annie_out_02=Trim(shingeki_no_kyojin_tv_20,16079,16101) #23
shingeki_no_kyojin_tv_20_levi_and_mike_try_to_take_annie_out_03=Trim(shingeki_no_kyojin_tv_20,16111,16208) #98
shingeki_no_kyojin_tv_20_levi_and_mike_try_to_take_annie_out_04=Trim(shingeki_no_kyojin_tv_20,16209,16334) #126 ed2
shingeki_no_kyojin_tv_20_levi_and_mike_try_to_take_annie_out_05=Trim(shingeki_no_kyojin_tv_20,16335,16406) #72
shingeki_no_kyojin_tv_20_megata_no_kyojin_scream=Trim(shingeki_no_kyojin_tv_20,19458,19489) #32
shingeki_no_kyojin_tv_20_petra_eren=Trim(shingeki_no_kyojin_tv_20,19676,19706) #31 op2_review02
shingeki_no_kyojin_tv_20_jean_armin=Trim(shingeki_no_kyojin_tv_20,19707,19736) #30 op2_review02
shingeki_no_kyojin_tv_20_historia=Trim(shingeki_no_kyojin_tv_20,19737,19767) #31 op2_review02
shingeki_no_kyojin_tv_20_reiner_connie=Trim(shingeki_no_kyojin_tv_20,19768,19803) #36 op2_review02
shingeki_no_kyojin_tv_20_sasha_mikasa=Trim(shingeki_no_kyojin_tv_20,19804,19872) #69 op2_review02
shingeki_no_kyojin_tv_20_soldiers_follow_kyojin=Trim(shingeki_no_kyojin_tv_20,20941,21004) #64
shingeki_no_kyojin_tv_20_deep_forest=Trim(shingeki_no_kyojin_tv_20,22036,22155) #120
shingeki_no_kyojin_tv_20_kyojin_run_01=Trim(shingeki_no_kyojin_tv_20,22156,22211) #56
shingeki_no_kyojin_tv_20_kyojin_run_02=Trim(shingeki_no_kyojin_tv_20,22378,22419) #42
shingeki_no_kyojin_tv_20_soldiers_attack_running_kyojin_01=Trim(shingeki_no_kyojin_tv_20,22507,22539) #33
shingeki_no_kyojin_tv_20_soldiers_attack_running_kyojin_02=Trim(shingeki_no_kyojin_tv_20,22540,22602) #63
shingeki_no_kyojin_tv_20_soldiers_attack_running_kyojin_03=Trim(shingeki_no_kyojin_tv_20,22603,22637) #35
shingeki_no_kyojin_tv_20_levi_kill_many_kyojin=Trim(shingeki_no_kyojin_tv_20,22985,23075) #91 op2
shingeki_no_kyojin_tv_20_kyojin_surround_megata_no_kyojin=Trim(shingeki_no_kyojin_tv_20,23250,23343) #94
shingeki_no_kyojin_tv_20_soldiers_and_kyojin_surround_megata_no_kyojin=Trim(shingeki_no_kyojin_tv_20,23508,23560) #53
shingeki_no_kyojin_tv_20_eldo_and_gunter_retreat=Trim(shingeki_no_kyojin_tv_20,28698,28816) #119
shingeki_no_kyojin_tv_20_levi_squad_retreat_01=Trim(shingeki_no_kyojin_tv_20,28947,29306) #360
shingeki_no_kyojin_tv_20_levi_squad_retreat_02=Trim(shingeki_no_kyojin_tv_20,29307,29431) #125
shingeki_no_kyojin_tv_20_annie_move_in_forest_01=Trim(shingeki_no_kyojin_tv_20,31085,31176) #92
shingeki_no_kyojin_tv_20_levi_squad_move_in_forest=Trim(shingeki_no_kyojin_tv_20,31237,31272) #36
shingeki_no_kyojin_tv_20_annie_kill_gunter_01=Trim(shingeki_no_kyojin_tv_20,31432,31503) #72 op2_fast_flash
shingeki_no_kyojin_tv_20_annie_kill_gunter_02=Trim(shingeki_no_kyojin_tv_20,31504,31530) #27 op2_fast_flash
shingeki_no_kyojin_tv_20_annie_move_in_forest_02=Trim(shingeki_no_kyojin_tv_20,31943,32098) #156 op2

shingeki_no_kyojin_tv_21_armin_remember_eren_become_kyojin=Trim(shingeki_no_kyojin_tv_21,9823,9910) #88
shingeki_no_kyojin_tv_21_annie_move_in_forest_01=Trim(shingeki_no_kyojin_tv_21,9911,9967) #57
shingeki_no_kyojin_tv_21_annie_move_in_forest_02=Trim(shingeki_no_kyojin_tv_21,9968,10011) #44
shingeki_no_kyojin_tv_21_annie_evade=Trim(shingeki_no_kyojin_tv_21,10592,10672) #81
shingeki_no_kyojin_tv_21_annie_disappear=Trim(shingeki_no_kyojin_tv_21,10968,11099) #132 ed2
shingeki_no_kyojin_tv_21_thunder_01=Trim(shingeki_no_kyojin_tv_21,11441,11464) #24
shingeki_no_kyojin_tv_21_thunder_02=Trim(shingeki_no_kyojin_tv_21,11465,11487) #23 op2_review_02
shingeki_no_kyojin_tv_21_levi_squad_member_see_annie_transform_to_megata_no_kyojin_again_01=Trim(shingeki_no_kyojin_tv_21,11488,11541) #54
shingeki_no_kyojin_tv_21_levi_squad_member_see_annie_transform_to_megata_no_kyojin_again_02=Trim(shingeki_no_kyojin_tv_21,11542,11601) #60
shingeki_no_kyojin_tv_21_megata_no_kyojin_follow_levi_squad_01=Trim(shingeki_no_kyojin_tv_21,11653,11761) #109
shingeki_no_kyojin_tv_21_megata_no_kyojin_follow_levi_squad_02=Trim(shingeki_no_kyojin_tv_21,11762,11855) #94
shingeki_no_kyojin_tv_21_megata_no_kyojin_follow_levi_squad_03=Trim(shingeki_no_kyojin_tv_21,12557,12616) #60
shingeki_no_kyojin_tv_21_petra_auruo_eldo_fight_with_megata_no_kyojin_01=Trim(shingeki_no_kyojin_tv_21,13560,13616) #57
shingeki_no_kyojin_tv_21_petra_auruo_eldo_fight_with_megata_no_kyojin_02=Trim(shingeki_no_kyojin_tv_21,13648,13696) #49 op2
shingeki_no_kyojin_tv_21_petra_auruo_eldo_fight_with_megata_no_kyojin_03=Trim(shingeki_no_kyojin_tv_21,13697,13719) #23 op2
shingeki_no_kyojin_tv_21_petra_auruo_eldo_fight_with_megata_no_kyojin_04=Trim(shingeki_no_kyojin_tv_21,13720,13762) #43 op2
shingeki_no_kyojin_tv_21_petra_auruo_eldo_fight_with_megata_no_kyojin_05=Trim(shingeki_no_kyojin_tv_21,13763,13789) #27 op2
shingeki_no_kyojin_tv_21_eldo_pass_through_front_of_megata_no_kyojin=Trim(shingeki_no_kyojin_tv_21,14338,14382) #45
shingeki_no_kyojin_tv_21_petra_auruo_cut_megata_no_kyojin_s_arm=Trim(shingeki_no_kyojin_tv_21,14578,14716) #139 ed2
shingeki_no_kyojin_tv_21_eldo_cut_megata_no_kyojin_s_arm=Trim(shingeki_no_kyojin_tv_21,14717,14742) #26
shingeki_no_kyojin_tv_21_megata_no_kyojin_s_arm_is_cutted=Trim(shingeki_no_kyojin_tv_21,14926,14959) #34
shingeki_no_kyojin_tv_21_petra_auruo_eldo_try_to_cut_megata_no_kyojin_head=Trim(shingeki_no_kyojin_tv_21,15410,15527) #118 op2
shingeki_no_kyojin_tv_21_megata_no_kyojin_eat_eldo_01=Trim(shingeki_no_kyojin_tv_21,16807,16839) #33 op2_fast_flash
shingeki_no_kyojin_tv_21_megata_no_kyojin_eat_eldo_02=Trim(shingeki_no_kyojin_tv_21,16924,17023) #100 op2_fast_flash
shingeki_no_kyojin_tv_21_eren_turn_back_to_help_petra_auruo=Trim(shingeki_no_kyojin_tv_21,17024,17115) #92 op2
shingeki_no_kyojin_tv_21_petra_escape=Trim(shingeki_no_kyojin_tv_21,17147,17195) #49 op2
shingeki_no_kyojin_tv_21_megata_no_kyojin_dash_to_petra=Trim(shingeki_no_kyojin_tv_21,17560,17590) #31 op2_fast_flash
shingeki_no_kyojin_tv_21_megata_no_kyojin_stomp_petra_01=Trim(shingeki_no_kyojin_tv_21,17608,17633) #26 op2_fast_flash
shingeki_no_kyojin_tv_21_megata_no_kyojin_stomp_petra_02=Trim(shingeki_no_kyojin_tv_21,17634,17681) #48 op2_fast_flash
shingeki_no_kyojin_tv_21_aruro_try_to_kill_megata_no_kyojin=Trim(shingeki_no_kyojin_tv_21,17916,17946) #31 op2_fast_flash
shingeki_no_kyojin_tv_21_megata_no_kyojin_kick_aruro=Trim(shingeki_no_kyojin_tv_21,18182,18199) #18 op2_fast_flash
shingeki_no_kyojin_tv_21_eldo_killed=Trim(shingeki_no_kyojin_tv_21,18662,18689) #28
shingeki_no_kyojin_tv_21_petra_killed=Trim(shingeki_no_kyojin_tv_21,18690,18720) #31
shingeki_no_kyojin_tv_21_aruro_killed=Trim(shingeki_no_kyojin_tv_21,18781,18815) #35
shingeki_no_kyojin_tv_21_eren_transform_to_kyojin_01=Trim(shingeki_no_kyojin_tv_21,18851,18874) #24
shingeki_no_kyojin_tv_21_eren_transform_to_kyojin_02=Trim(shingeki_no_kyojin_tv_21,18875,18935) #61
shingeki_no_kyojin_tv_21_kyojin_eren=Trim(shingeki_no_kyojin_tv_21,19075,19149) #75
shingeki_no_kyojin_tv_21_kyojin_eren_and_megata_no_kyojin_fight_01=Trim(shingeki_no_kyojin_tv_21,20124,20225) #102
shingeki_no_kyojin_tv_21_kyojin_eren_and_megata_no_kyojin_fight_02=Trim(shingeki_no_kyojin_tv_21,20360,20407) #48
shingeki_no_kyojin_tv_21_kyojin_eren_punch_megata_no_kyojin_01=Trim(shingeki_no_kyojin_tv_21,20784,20939) #156 ed2
shingeki_no_kyojin_tv_21_levi_see_gunter_killed=Trim(shingeki_no_kyojin_tv_21,21287,21358) #72 op2
shingeki_no_kyojin_tv_21_levi_see_eldo_killed=Trim(shingeki_no_kyojin_tv_21_cache02,21371,21441) #71 op2
shingeki_no_kyojin_tv_21_levi_see_aruro_killed=Trim(shingeki_no_kyojin_tv_21,21553,21624) #72 op2
shingeki_no_kyojin_tv_21_levi_see_petra_killed=Trim(shingeki_no_kyojin_tv_21_cache02,21931,21999) #69 op2
shingeki_no_kyojin_tv_21_kyojin_eren_and_megata_no_kyojin_fight_03=Trim(shingeki_no_kyojin_tv_21,22372,22427) #56 op2
shingeki_no_kyojin_tv_21_kyojin_eren_punch_megata_no_kyojin_02=Trim(shingeki_no_kyojin_tv_21,22916,22961) #46
shingeki_no_kyojin_tv_21_kyojin_eren_punch_megata_no_kyojin_03=Trim(shingeki_no_kyojin_tv_21,23347,23419) #73
shingeki_no_kyojin_tv_21_eren_remember_petra_killed=Trim(shingeki_no_kyojin_tv_21,24597,24704) #108
shingeki_no_kyojin_tv_21_kyojin_eren_and_megata_no_kyojin_fight_04=Trim(shingeki_no_kyojin_tv_21,25712,25828) #117
shingeki_no_kyojin_tv_21_kyojin_eren_and_megata_no_kyojin_fight_05=Trim(shingeki_no_kyojin_tv_21,25980,26150) #171
shingeki_no_kyojin_tv_21_kyojin_eren_in_megata_no_kyojin_s_eye=Trim(shingeki_no_kyojin_tv_21,26326,26347) #22 op2_review_02
shingeki_no_kyojin_tv_21_kyojin_eren_and_megata_no_kyojin_fight_06=Trim(shingeki_no_kyojin_tv_21,26430,26513) #84 op2
shingeki_no_kyojin_tv_21_megata_no_kyojin_punch_kyojin_eren=Trim(shingeki_no_kyojin_tv_21,26595,26669) #75 op2_review_02
shingeki_no_kyojin_tv_21_kyojin_eren_bite_megata_no_kyojin_s_arm=Trim(shingeki_no_kyojin_tv_21,26718,26741) #24 op2_review_02
shingeki_no_kyojin_tv_21_kyojin_eren_punch_megata_no_kyojin_04=Trim(shingeki_no_kyojin_tv_21,26742,26814) #73 op2_review_02
shingeki_no_kyojin_tv_21_megata_no_kyojin_bite_kyojin_eren=Trim(shingeki_no_kyojin_tv_21,28398,28476) #79
shingeki_no_kyojin_tv_21_mikasa_move_in_forest=Trim(shingeki_no_kyojin_tv_21,28555,28620) #66
shingeki_no_kyojin_tv_21_megata_no_kyojin_eat_eren_01=Trim(shingeki_no_kyojin_tv_21,28658,28681) #24
shingeki_no_kyojin_tv_21_megata_no_kyojin_eat_eren_02=Trim(shingeki_no_kyojin_tv_21,28682,28705) #24
shingeki_no_kyojin_tv_21_mikasa_get_mad_01=Trim(shingeki_no_kyojin_tv_21,29430,29489) #60
shingeki_no_kyojin_tv_21_mikasa_get_mad_02=Trim(shingeki_no_kyojin_tv_21,29490,29588) #99 op2
shingeki_no_kyojin_tv_21_mikasa_get_mad_03=Trim(shingeki_no_kyojin_tv_21,29623,29996) #374 op2
shingeki_no_kyojin_tv_21_mikasa_get_mad_04=Trim(shingeki_no_kyojin_tv_21,30068,30198) #131 ed2
shingeki_no_kyojin_tv_21_mikasa_cannot_kill_megata_no_kyojin=Trim(shingeki_no_kyojin_tv_21,30345,30471) #127 ed2

shingeki_no_kyojin_tv_22_mikasa_disturb_megata_no_kyojin=Trim(shingeki_no_kyojin_tv_22,6973,7078) #106
shingeki_no_kyojin_tv_22_levi_ready_to_stop_megata_no_kyojin=Trim(shingeki_no_kyojin_tv_22,7421,7504) #84
shingeki_no_kyojin_tv_22_levi_cut_megata_no_kyojin_s_arm_and_eye=Trim(shingeki_no_kyojin_tv_22,7721,7899) #179 ed2
shingeki_no_kyojin_tv_22_levi_ready_to_cut_megata_no_kyojin_again=Trim(shingeki_no_kyojin_tv_22,7990,8042) #53
shingeki_no_kyojin_tv_22_levi_cut_megata_no_kyojin_leg_and_nape=Trim(shingeki_no_kyojin_tv_22,8043,8173) #131 ed2
shingeki_no_kyojin_tv_22_levi_cut_megata_no_kyojin_every_part=Trim(shingeki_no_kyojin_tv_22,8300,8589) #290
shingeki_no_kyojin_tv_22_levi_cut_megata_no_kyojin_every_part_short_ver=Trim(shingeki_no_kyojin_tv_22,8494,8589) #96 op2
shingeki_no_kyojin_tv_22_survey_corps_retreat_in_field_01=Trim(shingeki_no_kyojin_tv_22,17388,17477) #90
shingeki_no_kyojin_tv_22_survey_corps_retreat_in_field_02=Trim(shingeki_no_kyojin_tv_22,17785,17864) #80
shingeki_no_kyojin_tv_22_mikasa_watch_eren_on_vehicle=Trim(shingeki_no_kyojin_tv_22,18033,18140) #108
shingeki_no_kyojin_tv_22_survey_corps_retreat_in_field_03=Trim(shingeki_no_kyojin_tv_22,18794,18857) #64 op2
shingeki_no_kyojin_tv_22_soldier_turn_back_to_save_friend=Trim(shingeki_no_kyojin_tv_22,19522,19668) #147 op2
shingeki_no_kyojin_tv_22_mikasa_kill_kyojin=Trim(shingeki_no_kyojin_tv_22,20495,20518) #24
shingeki_no_kyojin_tv_22_petra_s_body_is_dropped_01=Trim(shingeki_no_kyojin_tv_22,22265,22324) #60 op2
shingeki_no_kyojin_tv_22_petra_s_body_is_dropped_02=Trim(shingeki_no_kyojin_tv_22,22325,22394) #70
shingeki_no_kyojin_tv_22_petra_s_body_is_dropped_03=Trim(shingeki_no_kyojin_tv_22,22395,22463) #69
shingeki_no_kyojin_tv_22_vehicle_is_speed_up_in_field=Trim(shingeki_no_kyojin_tv_22,22584,22709) #126

shingeki_no_kyojin_tv_23_annie_training_with_her_father=Trim(shingeki_no_kyojin_tv_23,2476,2619) #144 ed2
shingeki_no_kyojin_tv_23_military_police_brigade_corrupt=Trim(shingeki_no_kyojin_tv_23,7416,7559) #144
shingeki_no_kyojin_tv_23_marlowe_wish_to_make_military_police_brigade_better=Trim(shingeki_no_kyojin_tv_23,9109,9204) #96 op2
shingeki_no_kyojin_tv_23_hitch_laugh_on_the_ground=Trim(shingeki_no_kyojin_tv_23,9300,9474) #175
shingeki_no_kyojin_tv_23_annie_stop_senior_mp_to_beat_marlowe=Trim(shingeki_no_kyojin_tv_23,14114,14221) #108
shingeki_no_kyojin_tv_23_hitch_threat_senior_mp=Trim(shingeki_no_kyojin_tv_23,14486,14523) #38 op2
shingeki_no_kyojin_tv_23_mikasa_ready_to_fight_with_annie_01=Trim(shingeki_no_kyojin_tv_23,30007,30081) #75 op2
shingeki_no_kyojin_tv_23_mikasa_ready_to_fight_with_annie_02=Trim(shingeki_no_kyojin_tv_23,30082,30177) #96
shingeki_no_kyojin_tv_23_annie_laugh=Trim(shingeki_no_kyojin_tv_23,30369,30452) #84 op2
shingeki_no_kyojin_tv_23_soldiers_surround_annie=Trim(shingeki_no_kyojin_tv_23,31424,31470) #47

shingeki_no_kyojin_tv_24_annie_transform_to_megata_no_kyojin=Trim(shingeki_no_kyojin_tv_24,924,1039) #116
shingeki_no_kyojin_tv_24_megata_no_kyojin_stomp_armin_mikasa_eren=Trim(shingeki_no_kyojin_tv_24,9120,9167) #48
shingeki_no_kyojin_tv_24_megata_no_kyojin_kick_kyojin_eren=Trim(shingeki_no_kyojin_tv_24,15910,16069) #160 op2_review_02
shingeki_no_kyojin_tv_24_mikasa_say_world_is_zankoku=Trim(shingeki_no_kyojin_tv_24,17777,17872) #96
shingeki_no_kyojin_tv_24_mikasa_attack_megata_no_kyojin_01=Trim(shingeki_no_kyojin_tv_24,18898,18965) #68 ed2
shingeki_no_kyojin_tv_24_mikasa_attack_megata_no_kyojin_02=Trim(shingeki_no_kyojin_tv_24,18966,19022) #57
shingeki_no_kyojin_tv_24_mikasa_attack_megata_no_kyojin_03=Trim(shingeki_no_kyojin_tv_24,19023,19085) #63
shingeki_no_kyojin_tv_24_mikasa_attack_megata_no_kyojin_04=Trim(shingeki_no_kyojin_tv_24,19622,19693) #72 op2
shingeki_no_kyojin_tv_24_soldiers_attack_megata_no_kyojin_01=Trim(shingeki_no_kyojin_tv_24,23152,23304) #153 op2
shingeki_no_kyojin_tv_24_mikasa_return_to_attack_megata_no_kyojin_01=Trim(shingeki_no_kyojin_tv_24,23522,23592) #71
shingeki_no_kyojin_tv_24_mikasa_return_to_attack_megata_no_kyojin_02=Trim(shingeki_no_kyojin_tv_24,23593,23695) #103
shingeki_no_kyojin_tv_24_eren_is_frustrated_01=Trim(shingeki_no_kyojin_tv_24,24799,24914) #116 op2
shingeki_no_kyojin_tv_24_stone_fly_to_armin_jean=Trim(shingeki_no_kyojin_tv_24,24915,24991) #77
shingeki_no_kyojin_tv_24_eren_is_frustrated_02=Trim(shingeki_no_kyojin_tv_24_cache02,25470,25751) #282 op2
shingeki_no_kyojin_tv_24_soldiers_attack_megata_no_kyojin_02=Trim(shingeki_no_kyojin_tv_24,26156,26346) #191 op2
shingeki_no_kyojin_tv_24_jean_try_to_cut_megata_no_kyojin_nape_01=Trim(shingeki_no_kyojin_tv_24,26508,26572) #65 op2
shingeki_no_kyojin_tv_24_jean_try_to_cut_megata_no_kyojin_nape_02=Trim(shingeki_no_kyojin_tv_24,26573,26629) #57
shingeki_no_kyojin_tv_24_megata_no_kyojin_follow_jean_armin=Trim(shingeki_no_kyojin_tv_24,26771,26889) #119 op2
shingeki_no_kyojin_tv_24_hanji_ready_to_catch_megata_no_kyojin=Trim(shingeki_no_kyojin_tv_24,27111,27194) #84 ed2
shingeki_no_kyojin_tv_24_fire_special_target_capture_weapon=Trim(shingeki_no_kyojin_tv_24,27321,27347) #27
shingeki_no_kyojin_tv_24_hanji_thread_megata_no_kyojin=Trim(shingeki_no_kyojin_tv_24,28591,28830) #240 op2_flash
shingeki_no_kyojin_tv_24_mikasa_follow_megata_no_kyojin=Trim(shingeki_no_kyojin_tv_24,29605,29774) #170 op2
shingeki_no_kyojin_tv_24_levi_squad_member_killed=Trim(shingeki_no_kyojin_tv_24,29775,29809) #35
shingeki_no_kyojin_tv_24_eren_s_eye=Trim(shingeki_no_kyojin_tv_24,29890,29919) #30 op2
shingeki_no_kyojin_tv_24_mikasa_shoot_cable=Trim(shingeki_no_kyojin_tv_24,30220,30283) #64
shingeki_no_kyojin_tv_24_megata_no_kyojin_kick_mikasa=Trim(shingeki_no_kyojin_tv_24,30284,30463) #180 op2
shingeki_no_kyojin_tv_24_eren_angry_and_transform=Trim(shingeki_no_kyojin_tv_24_cache02,30696,30791) #96 op2
shingeki_no_kyojin_tv_24_kyojin_eren_dash=Trim(shingeki_no_kyojin_tv_24,32037,32092) #56

shingeki_no_kyojin_tv_25_kyojin_eren_follow_megata_no_kyojin=Trim(shingeki_no_kyojin_tv_25,6915,6970) #56
shingeki_no_kyojin_tv_25_armin_jean_go_to_see_kyojin_eren_and_megata_no_kyojin=Trim(shingeki_no_kyojin_tv_25,12755,12812) #58
shingeki_no_kyojin_tv_25_kyojin_eren_punch_megata_no_kyojin=Trim(shingeki_no_kyojin_tv_25,13390,13456) #67
shingeki_no_kyojin_tv_25_annie_s_father_hug_annie=Trim(shingeki_no_kyojin_tv_25,14211,14306) #96 op2
shingeki_no_kyojin_tv_25_kyojin_eren_get_mad_01=Trim(shingeki_no_kyojin_tv_25,15065,15110) #46
shingeki_no_kyojin_tv_25_kyojin_eren_get_mad_02=Trim(shingeki_no_kyojin_tv_25,15111,15322) #212 op2
shingeki_no_kyojin_tv_25_kyojin_eren_catch_megata_no_kyojin=Trim(shingeki_no_kyojin_tv_25,15372,15440) #69 op2_review_02
shingeki_no_kyojin_tv_25_kyojin_eren_angry=Trim(shingeki_no_kyojin_tv_25,16751,16827) #77
shingeki_no_kyojin_tv_25_mikasa_cut_megata_no_kyojin_s_hand_01=Trim(shingeki_no_kyojin_tv_25,17497,17565) #69 ed2
shingeki_no_kyojin_tv_25_mikasa_cut_megata_no_kyojin_s_hand_02=Trim(shingeki_no_kyojin_tv_25,17609,17655) #47
shingeki_no_kyojin_tv_25_kyojin_eren_scream_01=Trim(shingeki_no_kyojin_tv_25,18508,18551) #44
shingeki_no_kyojin_tv_25_kyojin_eren_scream_02=Trim(shingeki_no_kyojin_tv_25,19299,19346) #48 op2
shingeki_no_kyojin_tv_25_annie_cry=Trim(shingeki_no_kyojin_tv_25,19750,19815) #66 op2_review_01
shingeki_no_kyojin_tv_25_annie_start_to_freeze=Trim(shingeki_no_kyojin_tv_25,20109,20165) #57
shingeki_no_kyojin_tv_25_annie_freeze_herself=Trim(shingeki_no_kyojin_tv_25,20334,20385) #52 op2
shingeki_no_kyojin_tv_25_mikasa_catch_eren_s_hand=Trim(shingeki_no_kyojin_tv_25,28690,28859) #170
shingeki_no_kyojin_tv_25_bird_fly_01=Trim(shingeki_no_kyojin_tv_25,29770,29913) #144
shingeki_no_kyojin_tv_25_bird_fly_02=Trim(shingeki_no_kyojin_tv_25,30067,30230) #164 op2
shingeki_no_kyojin_tv_25_wall_secret=Trim(shingeki_no_kyojin_tv_25,34106,34236) #131 ed2
