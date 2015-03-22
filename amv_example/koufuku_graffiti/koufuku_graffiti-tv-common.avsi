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



Import("..\avsi4comp\macro.avsi")

SetMemoryMax(64)

######## TV (1920*1080) ########

koufuku_graffiti_tv_01=SSRC(ASSUME_23_976P(FFMS2_VIDEO_SOURCE("src\anime\(2015Q1) 幸腹グラフィティ 第01話 「ほかほか、じゅわっ。」 (1280x720 x265 10bit AAC).mp4")),48000)
koufuku_graffiti_tv_02=SSRC(ASSUME_23_976P(FFMS2_VIDEO_SOURCE("src\anime\(2015Q1) 幸腹グラフィティ 第02話 「ふんわり、ゴガガガッ。」 (1280x720 x265 10bit AAC).mp4")),48000)
koufuku_graffiti_tv_03=SSRC(ASSUME_23_976P(FFMS2_VIDEO_SOURCE("src\anime\(2015Q1) 幸腹グラフィティ 第03話 「ショクショク、トロッ。」 (1280x720 x265 10bit AAC).mp4")),48000)
koufuku_graffiti_tv_04=SSRC(ASSUME_23_976P(FFMS2_VIDEO_SOURCE("src\anime\(2015Q1) 幸腹グラフィティ 第04話 「じんわり、バリリッ。」 (1280x720 x265 10bit AAC).mp4")),48000)
koufuku_graffiti_tv_05=SSRC(ASSUME_23_976P(FFMS2_VIDEO_SOURCE("src\anime\(2015Q1) 幸腹グラフィティ 第05話 「ぢゅるるんっ、ごくん。」 (1280x720 x265 10bit AAC).mp4")),48000)
koufuku_graffiti_tv_06=SSRC(FFMS2_VIDEO_SOURCE("src\anime\(2015Q1) 幸腹グラフィティ 第06話 「あつあつ、もちもち。」 (1280x720 x265 10bit AAC).mp4"),48000)
koufuku_graffiti_tv_07=SSRC(ASSUME_23_976P(FFMS2_VIDEO_SOURCE("src\anime\(2015Q1) 幸腹グラフィティ 第07話 「ジュー、プシーッ。」 (1280x720 x265 10bit AAC).mp4")),48000)
koufuku_graffiti_tv_08=SSRC(ASSUME_23_976P(FFMS2_VIDEO_SOURCE("src\anime\(2015Q1) 幸腹グラフィティ 第08話 「ほくほく、はぷっ。」 (1280x720 x265 10bit AAC).mp4")),48000)
koufuku_graffiti_tv_09=SSRC(ASSUME_23_976P(FFMS2_VIDEO_SOURCE("src\anime\(2015Q1) 幸腹グラフィティ 第09話 「グツグツ、へは……。」 (1280x720 x265 10bit AAC).mp4")),48000)
koufuku_graffiti_tv_10=SSRC(ASSUME_23_976P(FFMS2_VIDEO_SOURCE("src\anime\(2015Q1) 幸腹グラフィティ 第10話 「はもはも、みちちっ。」 (1280x720 x265 10bit AAC).mp4")),48000)

koufuku_graffiti_tv_clean_op=Trim(koufuku_graffiti_tv_01,695,2848)

######## Trim ########

koufuku_graffiti_tv_clean_op_01=Trim(koufuku_graffiti_tv_clean_op,0,826)
koufuku_graffiti_tv_clean_op_02=Trim(koufuku_graffiti_tv_clean_op,827,1351)
koufuku_graffiti_tv_clean_op_03=Trim(koufuku_graffiti_tv_clean_op,1352,1771)
koufuku_graffiti_tv_clean_op_04=Trim(koufuku_graffiti_tv_clean_op,1772,0)



koufuku_graffiti_tv_01_ryou_turn_back=Trim(koufuku_graffiti_tv_01,3805,3840) #36
koufuku_graffiti_tv_01_grandmother_teach_ryou_cooking=Trim(koufuku_graffiti_tv_01,4041,4190) #110
koufuku_graffiti_tv_01_ryou_become_bad_bride=Trim(koufuku_graffiti_tv_01,4296,4373) #78
koufuku_graffiti_tv_01_ryou_hadaka_apron=Trim(koufuku_graffiti_tv_01,5948,6038) #91
koufuku_graffiti_tv_01_ryou_wait=Trim(koufuku_graffiti_tv_01,6160,6220) #61
koufuku_graffiti_tv_01_kirin_catch_ryou_s_scarf=Trim(koufuku_graffiti_tv_01,6656,6748) #93 op
koufuku_graffiti_tv_01_kirin_unhappy=Trim(koufuku_graffiti_tv_01,10004,10184) #181 op
koufuku_graffiti_tv_01_kirin_eat_too_fast=Trim(koufuku_graffiti_tv_01,10798,10875) #78
koufuku_graffiti_tv_01_kirin_upset=Trim(koufuku_graffiti_tv_01,12522,12574) #53
koufuku_graffiti_tv_01_ryou_agree=Trim(koufuku_graffiti_tv_01,12575,12614) #40
koufuku_graffiti_tv_01_kirin_wear_large_coat=Trim(koufuku_graffiti_tv_01,16408,16513) #106
koufuku_graffiti_tv_01_grandmother_touch_ryou_s_head=Trim(koufuku_graffiti_tv_01,17617,17775) #159
koufuku_graffiti_tv_01_kirin_feel_delicious=Trim(koufuku_graffiti_tv_01,20536,20627) #92
koufuku_graffiti_tv_01_kirin_feel_warm=Trim(koufuku_graffiti_tv_01,21022,21083) #62
koufuku_graffiti_tv_01_kirin_see_ryou_eat_inari_sushi=Trim(koufuku_graffiti_tv_01,21953,22081) #129 op
koufuku_graffiti_tv_01_ryou_push_grandmother=Trim(koufuku_graffiti_tv_01,22597,22693) #97
koufuku_graffiti_tv_01_ryou_laugh_to_kirin=Trim(koufuku_graffiti_tv_01,27469,27678) #210
koufuku_graffiti_tv_01_kirin_dash=Trim(koufuku_graffiti_tv_01,30118,30202) #85 op
koufuku_graffiti_tv_01_kirin_dash_across_gate=Trim(koufuku_graffiti_tv_01,30381,30528) #148 op
koufuku_graffiti_tv_01_kirin_open_box=Trim(koufuku_graffiti_tv_01,30820,30948) #129

koufuku_graffiti_tv_02_kirin_catch_ryou_s_scarf=Trim(koufuku_graffiti_tv_02,2849,2922) #74
koufuku_graffiti_tv_02_kirin_turn_around=Trim(koufuku_graffiti_tv_02,3370,3438) #69
koufuku_graffiti_tv_02_ryou_turn_her_head_back_01=Trim(koufuku_graffiti_tv_02,4167,4184) #18 op
koufuku_graffiti_tv_02_kirin_turn_on_flashlight=Trim(koufuku_graffiti_tv_02,4487,4579) #93
koufuku_graffiti_tv_02_kirin_shake_her_head=Trim(koufuku_graffiti_tv_02,5144,5249) #106
koufuku_graffiti_tv_02_ryou_turn_her_head_back_02=Trim(koufuku_graffiti_tv_02,7127,7149) #23
koufuku_graffiti_tv_02_kirin_high=Trim(koufuku_graffiti_tv_02,7200,7283) #84
koufuku_graffiti_tv_02_kirin_and_ryou_see_sakura_trees=Trim(koufuku_graffiti_tv_02,7356,7451) #96 op
koufuku_graffiti_tv_02_kirin_guruguru=Trim(koufuku_graffiti_tv_02,8253,8369) #117
koufuku_graffiti_tv_02_kirin_biribiri=Trim(koufuku_graffiti_tv_02,8721,8875) #155
koufuku_graffiti_tv_02_akira_dash=Trim(koufuku_graffiti_tv_02,9534,9593) #60
koufuku_graffiti_tv_02_akira_kiss_ryou=Trim(koufuku_graffiti_tv_02,9698,9745) #48 op
koufuku_graffiti_tv_02_akira_force_ryou_to_eat_cookie=Trim(koufuku_graffiti_tv_02,9795,9932) #138
koufuku_graffiti_tv_02_kirin_tilt_head=Trim(koufuku_graffiti_tv_02,10529,10588) #60
koufuku_graffiti_tv_02_ryou_and_kirin_see_sugar_prople=Trim(koufuku_graffiti_tv_02,12071,12175) #105
koufuku_graffiti_tv_02_ryou_and_her_family=Trim(koufuku_graffiti_tv_02,13733,13828) #96
koufuku_graffiti_tv_02_kirin_ask=Trim(koufuku_graffiti_tv_02,14465,14501) #37
koufuku_graffiti_tv_02_shiina_turn_her_head_back=Trim(koufuku_graffiti_tv_02,15144,15215) #72
koufuku_graffiti_tv_02_shiina_stand_up=Trim(koufuku_graffiti_tv_02,15646,15704) #59
koufuku_graffiti_tv_02_knife_array=Trim(koufuku_graffiti_tv_02,16446,16471) #26
koufuku_graffiti_tv_02_shiina_thumb_up=Trim(koufuku_graffiti_tv_02,19300,19371) #72 op
koufuku_graffiti_tv_02_akira_eat_wasabi=Trim(koufuku_graffiti_tv_02,20776,20866) #91
koufuku_graffiti_tv_02_akira_begin_to_eat=Trim(koufuku_graffiti_tv_02,21422,21512) #91
koufuku_graffiti_tv_02_ryou_turn_back=Trim(koufuku_graffiti_tv_02,24428,24475) #48
koufuku_graffiti_tv_02_kirin_see_sakura_tree=Trim(koufuku_graffiti_tv_02,24541,24612) #72
koufuku_graffiti_tv_02_yuki_see_kirin=Trim(koufuku_graffiti_tv_02,25321,25500) #180
koufuku_graffiti_tv_02_ryou_become_brilliant=Trim(koufuku_graffiti_tv_02,28164,28223) #60
koufuku_graffiti_tv_02_kirin_hug_ryou=Trim(koufuku_graffiti_tv_02,28561,28608) #48
koufuku_graffiti_tv_02_ryou_and_kirin_sketching=Trim(koufuku_graffiti_tv_02,29023,29367) #345
koufuku_graffiti_tv_02_ryou_close_to_kirin=Trim(koufuku_graffiti_tv_02,30466,30492) #27 op
koufuku_graffiti_tv_02_ryou_see_kirin_s_sketch=Trim(koufuku_graffiti_tv_02,31590,31673) #84 op

koufuku_graffiti_tv_03_ryou_see_outside=Trim(koufuku_graffiti_tv_03,3281,3340) #60
koufuku_graffiti_tv_03_ryou_grab_pen=Trim(koufuku_graffiti_tv_03,4764,4793) #30
koufuku_graffiti_tv_03_ryou_and_classmates=Trim(koufuku_graffiti_tv_03,4929,5123) #195
koufuku_graffiti_tv_03_kirin_appear=Trim(koufuku_graffiti_tv_03,6627,6731) #105
koufuku_graffiti_tv_03_ryou_turn_back=Trim(koufuku_graffiti_tv_03,9357,9413) #57
koufuku_graffiti_tv_03_kirin_pull_down_shiina=Trim(koufuku_graffiti_tv_03,10485,10625) #141 op
koufuku_graffiti_tv_03_shiina_kirin_ryou_sit_around_table=Trim(koufuku_graffiti_tv_03,12884,13138) #255
koufuku_graffiti_tv_03_kirin_ryou_shiina_dig_rice=Trim(koufuku_graffiti_tv_03,14490,14609) #120
koufuku_graffiti_tv_03_sakura_and_moon=Trim(koufuku_graffiti_tv_03,17805,17888) #84
koufuku_graffiti_tv_03_ryou_kirin_shiina_watch_tv_drama=Trim(koufuku_graffiti_tv_03,19689,19904) #216 op
koufuku_graffiti_tv_03_kirin_shiina_guruguru=Trim(koufuku_graffiti_tv_03,21397,21652) #256
koufuku_graffiti_tv_03_ryou_show_omurice_01=Trim(koufuku_graffiti_tv_03,22504,22619) #116 op
koufuku_graffiti_tv_03_ryou_show_omurice_02=Trim(koufuku_graffiti_tv_03,23353,23478) #126 op
koufuku_graffiti_tv_03_ryou_show_omurice_03=Trim(koufuku_graffiti_tv_03,24522,24584) #63 op
koufuku_graffiti_tv_03_kirin_head_to_ryou=Trim(koufuku_graffiti_tv_03,27915,27965) #51

koufuku_graffiti_tv_04_ryou_walk_in_dream=Trim(koufuku_graffiti_tv_04,337,397) #61
koufuku_graffiti_tv_04_ryou_dash_in_dream=Trim(koufuku_graffiti_tv_04,687,773) #87
koufuku_graffiti_tv_04_kirin_cry_and_dash=Trim(koufuku_graffiti_tv_04,4094,4149) #56
koufuku_graffiti_tv_04_kirin_turn_back_and_take_mobile_phone=Trim(koufuku_graffiti_tv_04,5769,5864) #96
koufuku_graffiti_tv_04_ryou_turn_back_to_ask_shiina=Trim(koufuku_graffiti_tv_04,6237,6334) #98
koufuku_graffiti_tv_04_ryou_disappointed_01=Trim(koufuku_graffiti_tv_04,7623,7670) #48
koufuku_graffiti_tv_04_ryou_disappointed_02=Trim(koufuku_graffiti_tv_04,7875,7922) #48 op
koufuku_graffiti_tv_04_ryou_shake_ass=Trim(koufuku_graffiti_tv_04,9311,9358) #48
koufuku_graffiti_tv_04_camera_toward_ryou_from_soup=Trim(koufuku_graffiti_tv_04,10253,10300) #48 op
koufuku_graffiti_tv_04_ryou_guruguru=Trim(koufuku_graffiti_tv_04,12108,12197) #90
koufuku_graffiti_tv_04_ryou_see_rain=Trim(koufuku_graffiti_tv_04,12528,12575) #48
koufuku_graffiti_tv_04_ryou_walk_in_rain=Trim(koufuku_graffiti_tv_04,13055,13144) #90 op
koufuku_graffiti_tv_04_watanabe_dash_to_ryou=Trim(koufuku_graffiti_tv_04,13957,13986) #30
koufuku_graffiti_tv_04_grandmother_make_meal_for_ryou=Trim(koufuku_graffiti_tv_04,19417,19512) #96
koufuku_graffiti_tv_04_ryou_watch_meal=Trim(koufuku_graffiti_tv_04,19513,19581) #69
koufuku_graffiti_tv_04_supermarket_manager=Trim(koufuku_graffiti_tv_04,20763,20810) #48
koufuku_graffiti_tv_04_ryou_walk_in_supermarket_01=Trim(koufuku_graffiti_tv_04,20986,21047) #62
koufuku_graffiti_tv_04_ryou_walk_in_supermarket_02=Trim(koufuku_graffiti_tv_04,21246,21473) #228 op
koufuku_graffiti_tv_04_ryou_watch_food_in_supermarket_01=Trim(koufuku_graffiti_tv_04,21474,21532) #59
koufuku_graffiti_tv_04_ryou_walk_in_supermarket_03=Trim(koufuku_graffiti_tv_04,21533,21604) #72
koufuku_graffiti_tv_04_ryou_watch_food_in_supermarket_02=Trim(koufuku_graffiti_tv_04,21695,21765) #71
koufuku_graffiti_tv_04_ryou_walk_in_supermarket_04=Trim(koufuku_graffiti_tv_04,21766,21861) #96
koufuku_graffiti_tv_04_ryou_take_photo_with_mobile_phone=Trim(koufuku_graffiti_tv_04,22514,22573) #60
koufuku_graffiti_tv_04_ryou_fly_to_dream=Trim(koufuku_graffiti_tv_04,25074,25211) #138 op
koufuku_graffiti_tv_04_ryou_bite_food_chan=Trim(koufuku_graffiti_tv_04,25282,25629) #348
koufuku_graffiti_tv_04_ryou_see_grandmother_cooking_01=Trim(koufuku_graffiti_tv_04,26174,26245) #72
koufuku_graffiti_tv_04_ryou_see_grandmother_cooking_02=Trim(koufuku_graffiti_tv_04,26246,26401) #156
koufuku_graffiti_tv_04_kirin_happy=Trim(koufuku_graffiti_tv_04,27358,27453) #96
koufuku_graffiti_tv_04_ryou_bingo=Trim(koufuku_graffiti_tv_04,30939,31010) #72
koufuku_graffiti_tv_04_ryou_smile=Trim(koufuku_graffiti_tv_04,31403,31468) #66
koufuku_graffiti_tv_04_ryou_shout=Trim(koufuku_graffiti_tv_04,31498,31581) #84 op

koufuku_graffiti_tv_05_kirin_ready_to_fight=Trim(koufuku_graffiti_tv_05,320,379) #60 op
koufuku_graffiti_tv_05_kirin_jump_toward_bamboos=Trim(koufuku_graffiti_tv_05,410,456) #47
koufuku_graffiti_tv_05_summer_scene_sunflower=Trim(koufuku_graffiti_tv_05,3126,3154) #29
koufuku_graffiti_tv_05_summer_scene_sun=Trim(koufuku_graffiti_tv_05,3155,3178) #24
koufuku_graffiti_tv_05_summer_scene_sailing_ship=Trim(koufuku_graffiti_tv_05,3179,3214) #36
koufuku_graffiti_tv_05_summer_scene_beach=Trim(koufuku_graffiti_tv_05,3239,3262) #24
koufuku_graffiti_tv_05_kirin_scream_01=Trim(koufuku_graffiti_tv_05,4485,4538) #54
koufuku_graffiti_tv_05_kirin_scream_02=Trim(koufuku_graffiti_tv_05,5010,5093) #84
koufuku_graffiti_tv_05_ryou_and_kirin_imagine_summer=Trim(koufuku_graffiti_tv_05,5922,6131) #210
koufuku_graffiti_tv_05_wind_chime_day=Trim(koufuku_graffiti_tv_05,6264,6311) #48
koufuku_graffiti_tv_05_kirin_wear_swimsuit=Trim(koufuku_graffiti_tv_05,7855,7944) #90
koufuku_graffiti_tv_05_kirin_wear_swimsuit_and_talk_with_ryou=Trim(koufuku_graffiti_tv_05,8020,8199) #180
koufuku_graffiti_tv_05_shiina_s_garden=Trim(koufuku_graffiti_tv_05,8459,8478) #20
koufuku_graffiti_tv_05_shiina_s_pond_01=Trim(koufuku_graffiti_tv_05,11193,11278) #86
koufuku_graffiti_tv_05_shiina_s_pond_02=Trim(koufuku_graffiti_tv_05,11362,11485) #124 op
koufuku_graffiti_tv_05_shiina_s_pond_03=Trim(koufuku_graffiti_tv_05,11618,11743) #126
koufuku_graffiti_tv_05_shiina_s_pond_04=Trim(koufuku_graffiti_tv_05,11744,11779) #36
koufuku_graffiti_tv_05_shiina_s_mother_bring_cookie_01=Trim(koufuku_graffiti_tv_05,14336,14395) #60 op
koufuku_graffiti_tv_05_shiina_s_mother_bring_cookie_02=Trim(koufuku_graffiti_tv_05,14396,14500) #105 op
koufuku_graffiti_tv_05_ryou_and_kirin_discuss_ghost_pre=Trim(koufuku_graffiti_tv_05,17125,17220) #96
koufuku_graffiti_tv_05_ryou_and_kirin_discuss_ghost=Trim(koufuku_graffiti_tv_05,17221,17436) #216
koufuku_graffiti_tv_05_ryou_and_kirin_run_away_in_bamboos=Trim(koufuku_graffiti_tv_05,18190,18268) #79
koufuku_graffiti_tv_05_kirin_curious=Trim(koufuku_graffiti_tv_05,19243,19308) #66
koufuku_graffiti_tv_05_ryou_and_kirin_get_hyperthermia=Trim(koufuku_graffiti_tv_05,20231,20290) #60
koufuku_graffiti_tv_05_shiina_s_mother_punish_shiina=Trim(koufuku_graffiti_tv_05,21482,21559) #78
koufuku_graffiti_tv_05_ryou_and_kirin_show_soup=Trim(koufuku_graffiti_tv_05,22424,22561) #138
koufuku_graffiti_tv_05_tsuyuko_grind_sesame=Trim(koufuku_graffiti_tv_05,22962,23027) #66
koufuku_graffiti_tv_05_kirin_and_ryou_watch_scallion_stack=Trim(koufuku_graffiti_tv_05,23806,23859) #54
koufuku_graffiti_tv_05_kirin_ready_to_eat_soumen=Trim(koufuku_graffiti_tv_05,24790,24849) #60
koufuku_graffiti_tv_05_shiina_s_mother_sit_near_fan=Trim(koufuku_graffiti_tv_05,25090,25131) #42 op
koufuku_graffiti_tv_05_river=Trim(koufuku_graffiti_tv_05,25744,25791) #48
koufuku_graffiti_tv_05_kirin_eat_soumen=Trim(koufuku_graffiti_tv_05,25979,26073) #95
koufuku_graffiti_tv_05_shiina_kirin_ryou_watch_fireworks=Trim(koufuku_graffiti_tv_05,29729,29794) #66
koufuku_graffiti_tv_05_everyone_eat_Watermelon=Trim(koufuku_graffiti_tv_05,29999,30172) #174
koufuku_graffiti_tv_05_wind_chime_night=Trim(koufuku_graffiti_tv_05,31794,31887) #94 op

koufuku_graffiti_tv_06_summer_sky=Trim(koufuku_graffiti_tv_06,3948,3983) #36
koufuku_graffiti_tv_06_shiina_see_sunshine=Trim(koufuku_graffiti_tv_06,3984,4019) #36 op
koufuku_graffiti_tv_06_kirin_in_mobile_phone_camera=Trim(koufuku_graffiti_tv_06,6281,6322) #42
koufuku_graffiti_tv_06_kirin_imagine_unagi=Trim(koufuku_graffiti_tv_06,6734,6814) #81
koufuku_graffiti_tv_06_ryou_show_unazyuu=Trim(koufuku_graffiti_tv_06,9279,9434) #156
koufuku_graffiti_tv_06_ryou_and_kirin_imagine_word_01=Trim(koufuku_graffiti_tv_06,13250,13273) #24
koufuku_graffiti_tv_06_ryou_and_kirin_imagine_word_02=Trim(koufuku_graffiti_tv_06,13274,13303) #30
koufuku_graffiti_tv_06_ryou_and_kirin_imagine_word_03=Trim(koufuku_graffiti_tv_06,13304,13351) #48
koufuku_graffiti_tv_06_ryou_and_kirin_imagine_word_04=Trim(koufuku_graffiti_tv_06,13352,13399) #48
koufuku_graffiti_tv_06_kirin_scream_in_bathroom=Trim(koufuku_graffiti_tv_06,13824,13936) #113
koufuku_graffiti_tv_06_ryou_and_kirin_shower_01=Trim(koufuku_graffiti_tv_06,14581,14606) #26
koufuku_graffiti_tv_06_ryou_and_kirin_shower_02=Trim(koufuku_graffiti_tv_06,14643,14666) #24
koufuku_graffiti_tv_06_grandmother_and_ryou_sit_near_fan=Trim(koufuku_graffiti_tv_06,16681,16848) #168 op
koufuku_graffiti_tv_06_ryou_in_pool=Trim(koufuku_graffiti_tv_06,18013,18120) #108
koufuku_graffiti_tv_06_ryou_open_freezer_01=Trim(koufuku_graffiti_tv_06,19240,19287) #48
koufuku_graffiti_tv_06_ryou_open_freezer_02=Trim(koufuku_graffiti_tv_06,19456,19481) #26
koufuku_graffiti_tv_06_ryou_open_freezer_03=Trim(koufuku_graffiti_tv_06,19641,19776) #136
koufuku_graffiti_tv_06_kirin_want_to_touch_breast_01=Trim(koufuku_graffiti_tv_06,23647,23802) #156
koufuku_graffiti_tv_06_kirin_want_to_touch_breast_02=Trim(koufuku_graffiti_tv_06,23929,24000) #72
koufuku_graffiti_tv_06_kirin_face_to_fan=Trim(koufuku_graffiti_tv_06,25042,25227) #186
koufuku_graffiti_tv_06_kirin_fly_to_heaven=Trim(koufuku_graffiti_tv_06,25829,25900) #72 op
koufuku_graffiti_tv_06_ryou_sleep_on_grandmother_s_leg=Trim(koufuku_graffiti_tv_06,30125,30304) #180 op
koufuku_graffiti_tv_06_kirin_fan_sleeping_ryou=Trim(koufuku_graffiti_tv_06,30725,30859) #135
koufuku_graffiti_tv_06_shiina_angry=Trim(koufuku_graffiti_tv_06,31676,31741) #66

koufuku_graffiti_tv_07_shiina_kirin_ryou_s_leg=Trim(koufuku_graffiti_tv_07,4350,4447) #98
koufuku_graffiti_tv_07_kirin_frustrated=Trim(koufuku_graffiti_tv_07,6224,6316) #93
koufuku_graffiti_tv_07_shiina_find_material=Trim(koufuku_graffiti_tv_07,8548,8658) #111
koufuku_graffiti_tv_07_chief_worship_to_tsuyuko=Trim(koufuku_graffiti_tv_07,9508,9656) #149
koufuku_graffiti_tv_07_shiina_s_mother_and_ryou_walking_across_garden=Trim(koufuku_graffiti_tv_07,14359,14517) #159 op
koufuku_graffiti_tv_07_shiina_and_kirin_grill_sanma=Trim(koufuku_graffiti_tv_07,18451,18528) #78
koufuku_graffiti_tv_07_tsuyuko_say_grilled_sanma_is_bad=Trim(koufuku_graffiti_tv_07,21994,22055) #62
koufuku_graffiti_tv_07_tsuyuko_talk_with_ryou_and_cat_sleep_on_roof=Trim(koufuku_graffiti_tv_07,23117,23252) #136 op
koufuku_graffiti_tv_07_shiina_and_kirin_scared_by_fire=Trim(koufuku_graffiti_tv_07,23869,23919) #51
koufuku_graffiti_tv_07_kirin_nervous=Trim(koufuku_graffiti_tv_07,24588,24618) #31
koufuku_graffiti_tv_07_kirin_catch_fired_sanma=Trim(koufuku_graffiti_tv_07,24731,24871) #141
koufuku_graffiti_tv_07_kirin_lost_dish=Trim(koufuku_graffiti_tv_07,25575,25618) #44
koufuku_graffiti_tv_07_shiina_is_squirted_with_water=Trim(koufuku_graffiti_tv_07,25786,25857) #72
koufuku_graffiti_tv_07_tsuyuko_god=Trim(koufuku_graffiti_tv_07,26229,26282) #54
koufuku_graffiti_tv_07_kirin_break_dishes=Trim(koufuku_graffiti_tv_07,26346,26465) #120
koufuku_graffiti_tv_07_tsuyuko_order_01=Trim(koufuku_graffiti_tv_07,26670,26775) #106 op
koufuku_graffiti_tv_07_tsuyuko_order_02=Trim(koufuku_graffiti_tv_07,26776,26839) #64
koufuku_graffiti_tv_07_kirin_run_toward_ryou_at_home=Trim(koufuku_graffiti_tv_07,28728,28792) #65
koufuku_graffiti_tv_07_kirin_cooking=Trim(koufuku_graffiti_tv_07,29874,29939) #66 op
koufuku_graffiti_tv_07_ryou_hug_kirin_01=Trim(koufuku_graffiti_tv_07,30957,30992) #36
koufuku_graffiti_tv_07_ryou_hug_kirin_02=Trim(koufuku_graffiti_tv_07,30993,31042) #50
koufuku_graffiti_tv_07_train_departure=Trim(koufuku_graffiti_tv_07,31788,31892) #105 op

koufuku_graffiti_tv_08_kirin_punch_volleyball=Trim(koufuku_graffiti_tv_08,3305,3352) #48
koufuku_graffiti_tv_08_ryou_hit_by_basketball=Trim(koufuku_graffiti_tv_08,4338,4436) #99
koufuku_graffiti_tv_08_ryou_fell=Trim(koufuku_graffiti_tv_08,4437,4526) #90
koufuku_graffiti_tv_08_ryou_hit_by_red_balls=Trim(koufuku_graffiti_tv_08,4527,4628) #102
koufuku_graffiti_tv_08_ryou_and_classmates=Trim(koufuku_graffiti_tv_08,7981,8079) #99 op
koufuku_graffiti_tv_08_ryou_cry=Trim(koufuku_graffiti_tv_08,8825,8932) #108
koufuku_graffiti_tv_08_ryou_and_grandmother_eat_bentou=Trim(koufuku_graffiti_tv_08,8933,9148) #216
koufuku_graffiti_tv_08_ryou_warm_herself=Trim(koufuku_graffiti_tv_08,10332,10379) #48
koufuku_graffiti_tv_08_kirin_warm_herself=Trim(koufuku_graffiti_tv_08,10380,10415) #36
koufuku_graffiti_tv_08_ryou_walking_and_kirin_skipping=Trim(koufuku_graffiti_tv_08,10542,10709) #168 op
koufuku_graffiti_tv_08_kirin_skipping=Trim(koufuku_graffiti_tv_08,10710,10919) #210
koufuku_graffiti_tv_08_kirin_sleepy=Trim(koufuku_graffiti_tv_08,11457,11540) #84
koufuku_graffiti_tv_08_kirin_talk_with_her_mother=Trim(koufuku_graffiti_tv_08,13253,13459) #207 op
koufuku_graffiti_tv_08_food_become_more_and_more=Trim(koufuku_graffiti_tv_08,15864,15911) #48
koufuku_graffiti_tv_08_kirin_want_to_make_bentou=Trim(koufuku_graffiti_tv_08,17064,17588) #525
koufuku_graffiti_tv_08_ryou_turn_back=Trim(koufuku_graffiti_tv_08,18645,18758) #114
koufuku_graffiti_tv_08_ryou_happy_running=Trim(koufuku_graffiti_tv_08,19671,19790) #120 op
koufuku_graffiti_tv_08_ryou_peep_at_kirin=Trim(koufuku_graffiti_tv_08,20863,20934) #72
koufuku_graffiti_tv_08_ryou_feel_delicious=Trim(koufuku_graffiti_tv_08,28293,28430) #138 op
koufuku_graffiti_tv_08_ryou_say_goodbye_to_classmates=Trim(koufuku_graffiti_tv_08,28896,28973) #78

koufuku_graffiti_tv_09_ryou_point_up=Trim(koufuku_graffiti_tv_09,3900,3990) #91
koufuku_graffiti_tv_09_kirin_watch_tv_and_laugh=Trim(koufuku_graffiti_tv_09,4867,4938) #72
koufuku_graffiti_tv_09_shiina_close_to_ryou_s_ear=Trim(koufuku_graffiti_tv_09,5368,5406) #39
koufuku_graffiti_tv_09_ryou_sit_on_ground=Trim(koufuku_graffiti_tv_09,5556,5627) #72
koufuku_graffiti_tv_09_ryou_feel_delicious=Trim(koufuku_graffiti_tv_09,10112,10255) #144 op
koufuku_graffiti_tv_09_uncle_touch_kirin_s_head=Trim(koufuku_graffiti_tv_09,10942,11109) #168
koufuku_graffiti_tv_09_kirin_frustrated=Trim(koufuku_graffiti_tv_09,12046,12117) #72
koufuku_graffiti_tv_09_kirin_cry_and_punished_by_mother=Trim(koufuku_graffiti_tv_09,12341,12404) #64 op
koufuku_graffiti_tv_09_kirin_dash_across_gate=Trim(koufuku_graffiti_tv_09,15053,15109) #57
koufuku_graffiti_tv_09_kirin_dash_to_ryou=Trim(koufuku_graffiti_tv_09,15311,15423) #113 op
koufuku_graffiti_tv_09_kirin_catch_ryou_s_hand=Trim(koufuku_graffiti_tv_09,15671,15826) #156 op
koufuku_graffiti_tv_09_kirin_hug_ryou_from_back=Trim(koufuku_graffiti_tv_09,16603,16758) #156 op
koufuku_graffiti_tv_09_ryou_show_soba_to_kirin=Trim(koufuku_graffiti_tv_09,17461,17604) #144
koufuku_graffiti_tv_09_kirin_pick_up_soba_for_ryou=Trim(koufuku_graffiti_tv_09,20308,20343) #36
koufuku_graffiti_tv_09_akira_hug_ryou=Trim(koufuku_graffiti_tv_09,22373,22516) #144
koufuku_graffiti_tv_09_akira_ryou_kirin_worship_to_god=Trim(koufuku_graffiti_tv_09,23995,24198) #204 op
koufuku_graffiti_tv_09_kirin_and_ryou_say_goodbye=Trim(koufuku_graffiti_tv_09,31618,31689) #72
koufuku_graffiti_tv_09_kirin_run_away=Trim(koufuku_graffiti_tv_09,31690,31785) #96

koufuku_graffiti_tv_10_yuki_fell_down=Trim(koufuku_graffiti_tv_10,3936,3971) #36
koufuku_graffiti_tv_10_ryou_and_kirin_scared=Trim(koufuku_graffiti_tv_10,6814,6846) #33
koufuku_graffiti_tv_10_yuki_cry=Trim(koufuku_graffiti_tv_10,9321,9392) #72 op
koufuku_graffiti_tv_10_ryou_and_kirin_hear_yuki_talking_with_mobile_phone=Trim(koufuku_graffiti_tv_10,10360,10467) #108 op
koufuku_graffiti_tv_10_kirin_fell=Trim(koufuku_graffiti_tv_10,10869,10908) #40
koufuku_graffiti_tv_10_kirin_landing=Trim(koufuku_graffiti_tv_10,10944,10983) #40
koufuku_graffiti_tv_10_yuki_alone_01=Trim(koufuku_graffiti_tv_10,14515,14586) #72 op
koufuku_graffiti_tv_10_yuki_alone_02=Trim(koufuku_graffiti_tv_10,14671,14718) #48
koufuku_graffiti_tv_10_yuki_like_kirin=Trim(koufuku_graffiti_tv_10,16052,16183) #132
koufuku_graffiti_tv_10_yuki_kirin_ryou_discuss_pizza=Trim(koufuku_graffiti_tv_10,17672,17806) #135
koufuku_graffiti_tv_10_yuki_give_pizza_away_to_ryou_and_kirin=Trim(koufuku_graffiti_tv_10,18644,19030) #387
koufuku_graffiti_tv_10_pizza_material_01=Trim(koufuku_graffiti_tv_10,24919,25116) #198
koufuku_graffiti_tv_10_yuki_run_in_pizza_world_01=Trim(koufuku_graffiti_tv_10,25117,25230) #114
koufuku_graffiti_tv_10_pizza_material_02=Trim(koufuku_graffiti_tv_10,25231,25443) #213
koufuku_graffiti_tv_10_yuki_run_in_pizza_world_02=Trim(koufuku_graffiti_tv_10,25444,25526) #83 op
koufuku_graffiti_tv_10_yuki_walking=Trim(koufuku_graffiti_tv_10,28585,28752) #168 op
