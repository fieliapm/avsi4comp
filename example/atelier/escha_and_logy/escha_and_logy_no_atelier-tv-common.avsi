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



Import("..\..\..\avsi4comp\avsi4comp.avsi")

######## TV (1920*1080) ########

escha_and_logy_no_atelier_tv_01=FFMS2_VIDEO_SOURCE("src\anime\(2014Q2) エスカ＆ロジーのアトリエ〜黄昏の空の錬金術士〜 第01話 「ようこそアトリエへ！」 (MX 1280x720 x264-10b AAC).mp4")
escha_and_logy_no_atelier_tv_02=FFMS2_VIDEO_SOURCE("src\anime\(2014Q2) エスカ＆ロジーのアトリエ〜黄昏の空の錬金術士〜 第02話 「魔法使いってなんですか？」 (MX 1280x720 x264-10b AAC).mp4")
escha_and_logy_no_atelier_tv_03=FFMS2_VIDEO_SOURCE("src\anime\(2014Q2) エスカ＆ロジーのアトリエ〜黄昏の空の錬金術士〜 第03話 「私だって戦います！」 (1280x720 x264-10b AAC).mp4")
escha_and_logy_no_atelier_tv_04=FFMS2_VIDEO_SOURCE("src\anime\(2014Q2) エスカ＆ロジーのアトリエ〜黄昏の空の錬金術士〜 第04話 「たるです！しっぽです！」 (1280x720 x264-10b AAC).mp4")
escha_and_logy_no_atelier_tv_05=FFMS2_VIDEO_SOURCE("src\anime\(2014Q2) エスカ＆ロジーのアトリエ〜黄昏の空の錬金術士〜 第05話 「私、先輩になりました！」 (1280x720 x264-10b AAC).mp4")
escha_and_logy_no_atelier_tv_06=FFMS2_VIDEO_SOURCE("src\anime\(2014Q2) エスカ＆ロジーのアトリエ〜黄昏の空の錬金術士〜 第06話 「おいしいデザートど〜れだ？」 (1280x720 x264-10b AAC).mp4")
escha_and_logy_no_atelier_tv_07=FFMS2_VIDEO_SOURCE("src\anime\(2014Q2) エスカ＆ロジーのアトリエ〜黄昏の空の錬金術士〜 第07話 「なにがなんだかリンカさん！」 (1280x720 x264-10b AAC).mp4")
escha_and_logy_no_atelier_tv_08=FFMS2_VIDEO_SOURCE("src\anime\(2014Q2) エスカ＆ロジーのアトリエ〜黄昏の空の錬金術士〜 第08話 「アツアツ？温泉旅行です！」 (1280x720 x264-10b AAC).mp4")
escha_and_logy_no_atelier_tv_09=FFMS2_VIDEO_SOURCE("src\anime\(2014Q2) エスカ＆ロジーのアトリエ〜黄昏の空の錬金術士〜 第09話 「ガーン！ 夢がとられちゃう！」 (1280x720 x264-10b AAC).mp4")
escha_and_logy_no_atelier_tv_10=FFMS2_VIDEO_SOURCE("src\anime\(2014Q2) エスカ＆ロジーのアトリエ〜黄昏の空の錬金術士〜 第10話 「あきらめないで！」 (1280x720 x264-10b AAC).mp4")
escha_and_logy_no_atelier_tv_11=FFMS2_VIDEO_SOURCE("src\anime\(2014Q2) エスカ＆ロジーのアトリエ〜黄昏の空の錬金術士〜 第11話 「あこがれの未踏遺跡です！」 (1280x720 x264-10b AAC).mp4")
escha_and_logy_no_atelier_tv_12=FFMS2_VIDEO_SOURCE("src\anime\(2014Q2) エスカ＆ロジーのアトリエ〜黄昏の空の錬金術士〜 第12話 「私たちの約束です！」 (1280x720 x264-10b AAC).mp4")

escha_and_logy_no_atelier_tv_clean_op=Trim(escha_and_logy_no_atelier_tv_01,1819,3976)

######## Trim ########

escha_and_logy_no_atelier_tv_clean_op_00=Trim(escha_and_logy_no_atelier_tv_clean_op,0,94) # 95
escha_and_logy_no_atelier_tv_clean_op_01=Trim(escha_and_logy_no_atelier_tv_clean_op,95,596)
escha_and_logy_no_atelier_tv_clean_op_02=Trim(escha_and_logy_no_atelier_tv_clean_op,597,1068)
escha_and_logy_no_atelier_tv_clean_op_03=Trim(escha_and_logy_no_atelier_tv_clean_op,1069,1565)
escha_and_logy_no_atelier_tv_clean_op_04=Trim(escha_and_logy_no_atelier_tv_clean_op,1566,1976)
escha_and_logy_no_atelier_tv_clean_op_05=Trim(escha_and_logy_no_atelier_tv_clean_op,1977,0)




escha_and_logy_no_atelier_tv_01_little_escha_not_happy=Trim(escha_and_logy_no_atelier_tv_01,231,367) #137
escha_and_logy_no_atelier_tv_01_little_escha_hear_clone_tell_story=Trim(escha_and_logy_no_atelier_tv_01,1597,1679) #83
escha_and_logy_no_atelier_tv_01_apple_orchard=Trim(escha_and_logy_no_atelier_tv_01,4168,4250) #83
escha_and_logy_no_atelier_tv_01_escha_s_home=Trim(escha_and_logy_no_atelier_tv_01,4251,4305) #55
escha_and_logy_no_atelier_tv_01_escha_wake_up_01=Trim(escha_and_logy_no_atelier_tv_01,4753,4794) #42
escha_and_logy_no_atelier_tv_01_escha_wake_up_02=Trim(escha_and_logy_no_atelier_tv_01,4795,4888) #94 op
escha_and_logy_no_atelier_tv_01_escha_wake_up_03=Trim(escha_and_logy_no_atelier_tv_01,5015,5083) #69 op
escha_and_logy_no_atelier_tv_01_town=Trim(escha_and_logy_no_atelier_tv_01,5084,5197) #114
escha_and_logy_no_atelier_tv_01_escha_raise_head=Trim(escha_and_logy_no_atelier_tv_01,5758,5811) #54
escha_and_logy_no_atelier_tv_01_escha_see_airship=Trim(escha_and_logy_no_atelier_tv_01,5812,5929) #118
escha_and_logy_no_atelier_tv_01_bird_s_eye_view_of_town=Trim(escha_and_logy_no_atelier_tv_01,6024,6093) #70
escha_and_logy_no_atelier_tv_01_sword_fall_down=Trim(escha_and_logy_no_atelier_tv_01,9575,9614) #40
escha_and_logy_no_atelier_tv_01_escha_logy_marion_see_alchemy_cauldron=Trim(escha_and_logy_no_atelier_tv_01,13281,13395) #115
escha_and_logy_no_atelier_tv_01_escha_take_apple_pie=Trim(escha_and_logy_no_atelier_tv_01,13505,13566) #62
escha_and_logy_no_atelier_tv_01_homunculus=Trim(escha_and_logy_no_atelier_tv_01,15670,15803) #134 op
escha_and_logy_no_atelier_tv_01_desert=Trim(escha_and_logy_no_atelier_tv_01,18202,18360) #159 op
escha_and_logy_no_atelier_tv_01_escha_and_logy_see_apple_orchard=Trim(escha_and_logy_no_atelier_tv_01,19419,19538) #120
escha_and_logy_no_atelier_tv_01_escha_and_logy_meet_clone=Trim(escha_and_logy_no_atelier_tv_01,20994,21209) #216
escha_and_logy_no_atelier_tv_01_clone_show_windmill=Trim(escha_and_logy_no_atelier_tv_01,22913,23032) #120
escha_and_logy_no_atelier_tv_01_logy_kill_monster=Trim(escha_and_logy_no_atelier_tv_01,25785,25841) #57
escha_and_logy_no_atelier_tv_01_clone_and_faul_see_windmill=Trim(escha_and_logy_no_atelier_tv_01,28979,29058) #80 op

escha_and_logy_no_atelier_tv_02_marion_show_map_01=Trim(escha_and_logy_no_atelier_tv_02,5500,5559) #60
escha_and_logy_no_atelier_tv_02_marion_show_map_02=Trim(escha_and_logy_no_atelier_tv_02,5560,5674) #115
escha_and_logy_no_atelier_tv_02_airship=Trim(escha_and_logy_no_atelier_tv_02,6487,6595) #109
escha_and_logy_no_atelier_tv_02_escha_hug_duke=Trim(escha_and_logy_no_atelier_tv_02,12842,12930) #89
escha_and_logy_no_atelier_tv_02_escha_find_flower=Trim(escha_and_logy_no_atelier_tv_02,15965,16107) #143 op
escha_and_logy_no_atelier_tv_02_escha_and_logy_round_fire=Trim(escha_and_logy_no_atelier_tv_02,17070,17316) #247 op
escha_and_logy_no_atelier_tv_02_ruin=Trim(escha_and_logy_no_atelier_tv_02,18535,18618) #84
escha_and_logy_no_atelier_tv_02_wilbell_throw_broom=Trim(escha_and_logy_no_atelier_tv_02,21488,21640) #153
escha_and_logy_no_atelier_tv_02_wilbell_nio_escha_logy_walk_in_ruin=Trim(escha_and_logy_no_atelier_tv_02,24382,24473) #92
escha_and_logy_no_atelier_tv_02_wilbell_use_wind_magic_01=Trim(escha_and_logy_no_atelier_tv_02,27148,27218) #71 op
escha_and_logy_no_atelier_tv_02_wilbell_use_wind_magic_02=Trim(escha_and_logy_no_atelier_tv_02,27344,27413) #70
escha_and_logy_no_atelier_tv_02_escha_make_water_clean=Trim(escha_and_logy_no_atelier_tv_02,29970,30087) #118

escha_and_logy_no_atelier_tv_03_ruin_outside=Trim(escha_and_logy_no_atelier_tv_03,7389,7550) #162
escha_and_logy_no_atelier_tv_03_ruin_inside_01=Trim(escha_and_logy_no_atelier_tv_03,14768,14832) #65
escha_and_logy_no_atelier_tv_03_ruin_inside_02=Trim(escha_and_logy_no_atelier_tv_03,14833,14867) #35
escha_and_logy_no_atelier_tv_03_threia_launch_machine=Trim(escha_and_logy_no_atelier_tv_03,15457,15558) #102 op
escha_and_logy_no_atelier_tv_03_machine_launched=Trim(escha_and_logy_no_atelier_tv_03,15559,15600) #42
escha_and_logy_no_atelier_tv_03_ruin_inside_03=Trim(escha_and_logy_no_atelier_tv_03,16454,16544) #91
escha_and_logy_no_atelier_tv_03_escha_watch_robot_appear=Trim(escha_and_logy_no_atelier_tv_03,17268,17345) #78
escha_and_logy_no_atelier_tv_03_robot_walk=Trim(escha_and_logy_no_atelier_tv_03,17346,17427) #82
escha_and_logy_no_atelier_tv_03_robot_attack=Trim(escha_and_logy_no_atelier_tv_03,17865,17923) #59
escha_and_logy_no_atelier_tv_03_wilbell_show_pumpkin_bomb=Trim(escha_and_logy_no_atelier_tv_03,18736,18798) #63
escha_and_logy_no_atelier_tv_03_robot_angry=Trim(escha_and_logy_no_atelier_tv_03,19631,19811) #181
escha_and_logy_no_atelier_tv_03_robot_walt_to_use_machine_gun=Trim(escha_and_logy_no_atelier_tv_03,20869,20962) #94
escha_and_logy_no_atelier_tv_03_linca_and_awin_appear=Trim(escha_and_logy_no_atelier_tv_03,21181,21268) #88
escha_and_logy_no_atelier_tv_03_wilbell_draw_magic_circle=Trim(escha_and_logy_no_atelier_tv_03,22756,22819) #64 op
escha_and_logy_no_atelier_tv_03_linca_cut_robot_s_leg=Trim(escha_and_logy_no_atelier_tv_03,23066,23145) #80
escha_and_logy_no_atelier_tv_03_wilbell_call_fairy=Trim(escha_and_logy_no_atelier_tv_03,23357,23421) #65
escha_and_logy_no_atelier_tv_03_fairy_raise_hand=Trim(escha_and_logy_no_atelier_tv_03,23890,23984) #95 op
escha_and_logy_no_atelier_tv_03_awin_control_airship=Trim(escha_and_logy_no_atelier_tv_03,28423,28491) #69
escha_and_logy_no_atelier_tv_03_airship_lift_off_01=Trim(escha_and_logy_no_atelier_tv_03,28492,28556) #65
escha_and_logy_no_atelier_tv_03_airship_lift_off_02=Trim(escha_and_logy_no_atelier_tv_03,28557,28603) #47
escha_and_logy_no_atelier_tv_03_airship_lift_off_03=Trim(escha_and_logy_no_atelier_tv_03,28604,28697) #94
escha_and_logy_no_atelier_tv_03_airship_fly_away=Trim(escha_and_logy_no_atelier_tv_03,28731,28828) #98

escha_and_logy_no_atelier_tv_04_escha_cry=Trim(escha_and_logy_no_atelier_tv_04,551,631) #81
escha_and_logy_no_atelier_tv_04_linca_write_report=Trim(escha_and_logy_no_atelier_tv_04,7583,7623) #41
escha_and_logy_no_atelier_tv_04_escha_s_tail=Trim(escha_and_logy_no_atelier_tv_04,8367,8407) #41
escha_and_logy_no_atelier_tv_04_escha_push_taru=Trim(escha_and_logy_no_atelier_tv_04,8408,8533) #126
escha_and_logy_no_atelier_tv_04_wilbell_touch_escha_s_tail=Trim(escha_and_logy_no_atelier_tv_04,8575,8666) #92
escha_and_logy_no_atelier_tv_04_clean_house_01=Trim(escha_and_logy_no_atelier_tv_04,10062,10103) #42
escha_and_logy_no_atelier_tv_04_clean_house_02=Trim(escha_and_logy_no_atelier_tv_04,10104,10170) #67
escha_and_logy_no_atelier_tv_04_katla_think_money=Trim(escha_and_logy_no_atelier_tv_04,11854,11990) #137
escha_and_logy_no_atelier_tv_04_katla_want_to_buy_escha_s_tail=Trim(escha_and_logy_no_atelier_tv_04,12824,12964) #141
escha_and_logy_no_atelier_tv_04_katla_and_wilbell_want_to_buy_escha_s_tail_01=Trim(escha_and_logy_no_atelier_tv_04,13171,13334) #164
escha_and_logy_no_atelier_tv_04_katla_and_wilbell_want_to_buy_escha_s_tail_02=Trim(escha_and_logy_no_atelier_tv_04,13959,14041) #83
escha_and_logy_no_atelier_tv_04_katla_lift_apple=Trim(escha_and_logy_no_atelier_tv_04,14042,14216) #175 op
escha_and_logy_no_atelier_tv_04_homunculus_carry_apple=Trim(escha_and_logy_no_atelier_tv_04,14217,14520) #304
escha_and_logy_no_atelier_tv_04_escha_make_tail=Trim(escha_and_logy_no_atelier_tv_04,14521,14609) #89
escha_and_logy_no_atelier_tv_04_package_tail=Trim(escha_and_logy_no_atelier_tv_04,14610,14672) #63
escha_and_logy_no_atelier_tv_04_homunculus_carry_tail=Trim(escha_and_logy_no_atelier_tv_04,14673,14898) #226
escha_and_logy_no_atelier_tv_04_logy_draw_table=Trim(escha_and_logy_no_atelier_tv_04,18091,18197) #107
escha_and_logy_no_atelier_tv_04_escha_watch_miria_perform_alchemy=Trim(escha_and_logy_no_atelier_tv_04,19650,19756) #107
escha_and_logy_no_atelier_tv_04_escha_and_miria_perform_alchemy_00=Trim(escha_and_logy_no_atelier_tv_04,19811,20015) #205 op
escha_and_logy_no_atelier_tv_04_miria_s_face_is_invisible=Trim(escha_and_logy_no_atelier_tv_04,20016,20128) #113
escha_and_logy_no_atelier_tv_04_alchemy_book=Trim(escha_and_logy_no_atelier_tv_04,20129,20192) #113
escha_and_logy_no_atelier_tv_04_escha_lift_book=Trim(escha_and_logy_no_atelier_tv_04,20193,20360) #168 op
escha_and_logy_no_atelier_tv_04_clone_show_library=Trim(escha_and_logy_no_atelier_tv_04,21165,21244) #80
escha_and_logy_no_atelier_tv_04_escha_and_miria_perform_alchemy_01=Trim(escha_and_logy_no_atelier_tv_04,23512,23678) #167 op
escha_and_logy_no_atelier_tv_04_escha_and_miria_perform_alchemy_02=Trim(escha_and_logy_no_atelier_tv_04,23679,23761) #83
escha_and_logy_no_atelier_tv_04_escha_and_miria_perform_alchemy_03=Trim(escha_and_logy_no_atelier_tv_04,23762,23809) #48
escha_and_logy_no_atelier_tv_04_wilbell_apply_magic_to_tail=Trim(escha_and_logy_no_atelier_tv_04,24833,25018) #186

escha_and_logy_no_atelier_tv_04_tail_jump_into_linca_s_bra=Trim(escha_and_logy_no_atelier_tv_04,25504,25663) #160
escha_and_logy_no_atelier_tv_04_tail_jump_into_linca_s_bra_01=Trim(escha_and_logy_no_atelier_tv_04,25504,25524) #21
escha_and_logy_no_atelier_tv_04_tail_jump_into_linca_s_bra_02=Trim(escha_and_logy_no_atelier_tv_04,25525,25545) #21
escha_and_logy_no_atelier_tv_04_tail_jump_into_linca_s_bra_03=Trim(escha_and_logy_no_atelier_tv_04,25546,25570) #25
escha_and_logy_no_atelier_tv_04_tail_jump_into_linca_s_bra_04=Trim(escha_and_logy_no_atelier_tv_04,25571,25596) #26
escha_and_logy_no_atelier_tv_04_tail_jump_into_linca_s_bra_05=Trim(escha_and_logy_no_atelier_tv_04,25597,25663) #67

escha_and_logy_no_atelier_tv_04_wilbell_become_rabbit=Trim(escha_and_logy_no_atelier_tv_04,26608,26649) #42
escha_and_logy_no_atelier_tv_04_escha_catch_tail=Trim(escha_and_logy_no_atelier_tv_04,27356,27591) #236

escha_and_logy_no_atelier_tv_05_escha_eat_cream=Trim(escha_and_logy_no_atelier_tv_05,295,509) #215
escha_and_logy_no_atelier_tv_05_lucille_watch_figure=Trim(escha_and_logy_no_atelier_tv_05,9309,9428) #120
escha_and_logy_no_atelier_tv_05_katla_frustrated=Trim(escha_and_logy_no_atelier_tv_05,9855,9917) #63
escha_and_logy_no_atelier_tv_05_lucille_see_homunculus=Trim(escha_and_logy_no_atelier_tv_05,10534,10814) #281 op
escha_and_logy_no_atelier_tv_05_homunculus_working=Trim(escha_and_logy_no_atelier_tv_05,12131,12187) #57
escha_and_logy_no_atelier_tv_05_homunculus_close_to_lucille=Trim(escha_and_logy_no_atelier_tv_05,12353,12398) #46
escha_and_logy_no_atelier_tv_05_homunculus_round_lucille=Trim(escha_and_logy_no_atelier_tv_05,12597,13073) #477 op
escha_and_logy_no_atelier_tv_05_homunculus_talk=Trim(escha_and_logy_no_atelier_tv_05,13074,13322) #249
escha_and_logy_no_atelier_tv_05_escha_logy_lucille_linca_walk=Trim(escha_and_logy_no_atelier_tv_05,15378,15551) #174
escha_and_logy_no_atelier_tv_05_homunculus_see_lucille_walk_away=Trim(escha_and_logy_no_atelier_tv_05,16202,16290) #89
escha_and_logy_no_atelier_tv_05_lucille_too_tired=Trim(escha_and_logy_no_atelier_tv_05,18949,19064) #116
escha_and_logy_no_atelier_tv_05_nio_give_medicine_book_to_escha=Trim(escha_and_logy_no_atelier_tv_05,23077,23111) #35
escha_and_logy_no_atelier_tv_05_lucille_become_healthy=Trim(escha_and_logy_no_atelier_tv_05,23416,23567) #152
escha_and_logy_no_atelier_tv_05_linca_and_logy_take_sword=Trim(escha_and_logy_no_atelier_tv_05,24348,24604) #257
escha_and_logy_no_atelier_tv_05_lucille_read_letter=Trim(escha_and_logy_no_atelier_tv_05,26866,26927) #62
escha_and_logy_no_atelier_tv_05_escha_see_lucille_cry=Trim(escha_and_logy_no_atelier_tv_05,27707,27814) #108
escha_and_logy_no_atelier_tv_05_escha_welcome_lucille_to_apple_house=Trim(escha_and_logy_no_atelier_tv_05,28163,28281) #119
escha_and_logy_no_atelier_tv_05_awin_hug_logy_who_is_thinking=Trim(escha_and_logy_no_atelier_tv_05,29161,29339) #179 op
escha_and_logy_no_atelier_tv_05_marion_and_threia_drink_beer=Trim(escha_and_logy_no_atelier_tv_05,29340,29847) #508
escha_and_logy_no_atelier_tv_05_homunculus_go_to_meet_lucille=Trim(escha_and_logy_no_atelier_tv_05,31305,31400) #96

escha_and_logy_no_atelier_tv_06_escha_see_ruin_in_sky=Trim(escha_and_logy_no_atelier_tv_06,269,362) #94 op
escha_and_logy_no_atelier_tv_06_faul_ask_escha=Trim(escha_and_logy_no_atelier_tv_06,3805,4018) #214 op
escha_and_logy_no_atelier_tv_06_logy_perform_alchemy=Trim(escha_and_logy_no_atelier_tv_06,5109,5272) #164 op
escha_and_logy_no_atelier_tv_06_apple_tree=Trim(escha_and_logy_no_atelier_tv_06,6905,7036) #132 op
escha_and_logy_no_atelier_tv_06_apple_house_bombed=Trim(escha_and_logy_no_atelier_tv_06,16053,16100) #48
escha_and_logy_no_atelier_tv_06_escha_read_book=Trim(escha_and_logy_no_atelier_tv_06,19143,19262) #120

escha_and_logy_no_atelier_tv_07_escha_hit_linca_8_ass=Trim(escha_and_logy_no_atelier_tv_07,4428,4455) #28
escha_and_logy_no_atelier_tv_07_escha_push_linca_8=Trim(escha_and_logy_no_atelier_tv_07,6764,6882) #119
escha_and_logy_no_atelier_tv_07_wilbell_pack_broom_up=Trim(escha_and_logy_no_atelier_tv_07,8336,8460) #125
escha_and_logy_no_atelier_tv_07_linca_1_attack_wilbell=Trim(escha_and_logy_no_atelier_tv_07,8762,8862) #101
escha_and_logy_no_atelier_tv_07_linca_1_raise_sword_up=Trim(escha_and_logy_no_atelier_tv_07,9059,9123) #65
escha_and_logy_no_atelier_tv_07_linca_3_drink_beer=Trim(escha_and_logy_no_atelier_tv_07,12496,12763) #268
escha_and_logy_no_atelier_tv_07_marion_protect_linca_8=Trim(escha_and_logy_no_atelier_tv_07,18976,19081) #106 op
escha_and_logy_no_atelier_tv_07_linca_3_ask_linca_8_to_drink=Trim(escha_and_logy_no_atelier_tv_07,22609,22805) #197
escha_and_logy_no_atelier_tv_07_wilbell_use_wind_magic_to_attack_linca_1=Trim(escha_and_logy_no_atelier_tv_07,23133,23190) #58
escha_and_logy_no_atelier_tv_07_linca_3_attack_to_linca_1_and_linca_8=Trim(escha_and_logy_no_atelier_tv_07,24804,24862) #59 op
escha_and_logy_no_atelier_tv_07_linca_3_say_goodbye_to_linca_1=Trim(escha_and_logy_no_atelier_tv_07,31276,31342) #67 op

escha_and_logy_no_atelier_tv_08_marion_ask_people_to_travel=Trim(escha_and_logy_no_atelier_tv_08,6606,6698) #93
escha_and_logy_no_atelier_tv_08_escha_swear_that_she_must_go_to_ruin_in_sky=Trim(escha_and_logy_no_atelier_tv_08,9086,9176) #91 op
escha_and_logy_no_atelier_tv_08_escha_cover_her_big_breast=Trim(escha_and_logy_no_atelier_tv_08,12745,12783) #39
escha_and_logy_no_atelier_tv_08_linca_nio_lucille_escha_wilbell_marion_in_pool=Trim(escha_and_logy_no_atelier_tv_08,14336,14508) #173
escha_and_logy_no_atelier_tv_08_fire_fairy_apear=Trim(escha_and_logy_no_atelier_tv_08,17801,17919) #119
escha_and_logy_no_atelier_tv_08_wilbell_draw_magic_circle=Trim(escha_and_logy_no_atelier_tv_08,19698,19762) #65
escha_and_logy_no_atelier_tv_08_wilbell_turn_back_in_flame=Trim(escha_and_logy_no_atelier_tv_08,19918,19945) #28
escha_and_logy_no_atelier_tv_08_linca_and_marion_angry_to_wilbell=Trim(escha_and_logy_no_atelier_tv_08,19996,20097) #102 op
escha_and_logy_no_atelier_tv_08_escha_logy_awin_fly_back_to_town=Trim(escha_and_logy_no_atelier_tv_08,23539,23707) #169
escha_and_logy_no_atelier_tv_08_logy_and_awin_see_escha_perform_alchemy=Trim(escha_and_logy_no_atelier_tv_08,25452,25575) #124
escha_and_logy_no_atelier_tv_08_wilbell_show_magic_fireworks_01=Trim(escha_and_logy_no_atelier_tv_08,26199,26327) #129
escha_and_logy_no_atelier_tv_08_wilbell_show_magic_fireworks_02=Trim(escha_and_logy_no_atelier_tv_08,26328,26452) #125 op
escha_and_logy_no_atelier_tv_08_fire_fairy_fly_around_escha_and_others=Trim(escha_and_logy_no_atelier_tv_08,28019,28170) #152 op
escha_and_logy_no_atelier_tv_08_nio_lucille_marion_linca_wilbell_escha_in_pool=Trim(escha_and_logy_no_atelier_tv_08,30808,30925) #118 op
escha_and_logy_no_atelier_tv_08_escha_throw_soap_to_logy=Trim(escha_and_logy_no_atelier_tv_08,31494,31541) #48

escha_and_logy_no_atelier_tv_09_mural_in_ruin=Trim(escha_and_logy_no_atelier_tv_09,5258,5392) #135 op
escha_and_logy_no_atelier_tv_09_keithgrif_s_notebook=Trim(escha_and_logy_no_atelier_tv_09,8573,8736) #164
escha_and_logy_no_atelier_tv_09_escha_in_rain=Trim(escha_and_logy_no_atelier_tv_09,12534,12604) #71 op
escha_and_logy_no_atelier_tv_09_duke_and_colland_fight=Trim(escha_and_logy_no_atelier_tv_09,28334,28451) #118 op

escha_and_logy_no_atelier_tv_10_airport=Trim(escha_and_logy_no_atelier_tv_10,3065,3176) #112
escha_and_logy_no_atelier_tv_10_harry_ask_katla=Trim(escha_and_logy_no_atelier_tv_10,9539,9605) #67 op
escha_and_logy_no_atelier_tv_10_escha_and_logy_look_at_the_scenery=Trim(escha_and_logy_no_atelier_tv_10,14053,14292) #240 op
escha_and_logy_no_atelier_tv_10_micie=Trim(escha_and_logy_no_atelier_tv_10,14977,15149) #173 op
escha_and_logy_no_atelier_tv_10_airship_bombed=Trim(escha_and_logy_no_atelier_tv_10,15712,15788) #77
escha_and_logy_no_atelier_tv_10_logy_hug_escha=Trim(escha_and_logy_no_atelier_tv_10,19203,19557) #355 op
escha_and_logy_no_atelier_tv_10_reyfer_escape_from_dragon=Trim(escha_and_logy_no_atelier_tv_10,25000,25070) #71 op
escha_and_logy_no_atelier_tv_10_airship_lift_off=Trim(escha_and_logy_no_atelier_tv_10,29438,29521) #84
escha_and_logy_no_atelier_tv_10_airship_engine_start_up=Trim(escha_and_logy_no_atelier_tv_10,29522,29633) #112

escha_and_logy_no_atelier_tv_11_airship_dash=Trim(escha_and_logy_no_atelier_tv_11,272,385) #114 op
escha_and_logy_no_atelier_tv_11_ruin_in_sky=Trim(escha_and_logy_no_atelier_tv_11,1989,2085) #97 op
escha_and_logy_no_atelier_tv_11_kuu_transform=Trim(escha_and_logy_no_atelier_tv_11,9419,9659) #241 op
escha_and_logy_no_atelier_tv_11_kuu_attack=Trim(escha_and_logy_no_atelier_tv_11,10884,10952) #69
escha_and_logy_no_atelier_tv_11_kuu_follow_airship=Trim(escha_and_logy_no_atelier_tv_11,11742,11811) #70
escha_and_logy_no_atelier_tv_11_jigsaw=Trim(escha_and_logy_no_atelier_tv_11,15110,15170) #61
escha_and_logy_no_atelier_tv_11_illustration_flameu_cheer_girl_up=Trim(escha_and_logy_no_atelier_tv_11,16376,16486) #111
escha_and_logy_no_atelier_tv_11_flameu_image_barren_land=Trim(escha_and_logy_no_atelier_tv_11,17164,17638) #475

escha_and_logy_no_atelier_tv_11_clone_take_apple_seed=Trim(escha_and_logy_no_atelier_tv_11,18200,18292) #93 op1
escha_and_logy_no_atelier_tv_11_clone_take_apple_seed_01=Trim(escha_and_logy_no_atelier_tv_11,18200,18257) #58
escha_and_logy_no_atelier_tv_11_clone_take_apple_seed_02=Trim(escha_and_logy_no_atelier_tv_11,18258,18292) #35

escha_and_logy_no_atelier_tv_11_illustration_flameu_cheer_girl_up=Trim(escha_and_logy_no_atelier_tv_11,20217,20360) #144
escha_and_logy_no_atelier_tv_11_illustration_flameu_help_girl_plant_01=Trim(escha_and_logy_no_atelier_tv_11,20875,21138) #264
escha_and_logy_no_atelier_tv_11_illustration_flameu_help_girl_plant_02=Trim(escha_and_logy_no_atelier_tv_11,21139,21205) #67
escha_and_logy_no_atelier_tv_11_illustration_flameu_help_girl_plant_03=Trim(escha_and_logy_no_atelier_tv_11,21206,21256) #51
escha_and_logy_no_atelier_tv_11_illustration_flameu_and_girl_failed_to_plant=Trim(escha_and_logy_no_atelier_tv_11,21350,21472) #123
escha_and_logy_no_atelier_tv_11_illustration_flameu_tell_people_=Trim(escha_and_logy_no_atelier_tv_11,21627,21980) #354
escha_and_logy_no_atelier_tv_11_illustration_flameu_and_girl_failed_to_plant=Trim(escha_and_logy_no_atelier_tv_11,21981,22189) #209
escha_and_logy_no_atelier_tv_11_illustration_human_leave_flameu=Trim(escha_and_logy_no_atelier_tv_11,22190,22556) #367
escha_and_logy_no_atelier_tv_11_illustration_flameu_cry=Trim(escha_and_logy_no_atelier_tv_11,22557,22712) #156
escha_and_logy_no_atelier_tv_11_illustration_girl_cheer_flameu_up=Trim(escha_and_logy_no_atelier_tv_11,25183,25272) #90
escha_and_logy_no_atelier_tv_11_illustration_girl_tell_people=Trim(escha_and_logy_no_atelier_tv_11,25273,25350) #78
escha_and_logy_no_atelier_tv_11_illustration_girl_bring_flameu=Trim(escha_and_logy_no_atelier_tv_11,25351,25572) #222
escha_and_logy_no_atelier_tv_11_illustration_happy_end=Trim(escha_and_logy_no_atelier_tv_11,25572,25686) #115
escha_and_logy_no_atelier_tv_11_nio_remember_ayesha_call_her=Trim(escha_and_logy_no_atelier_tv_11,28279,28498) #220 op
escha_and_logy_no_atelier_tv_11_clone_memory_01=Trim(escha_and_logy_no_atelier_tv_11,28800,28920) #121
escha_and_logy_no_atelier_tv_11_clone_memory_02=Trim(escha_and_logy_no_atelier_tv_11,28921,28990) #70
escha_and_logy_no_atelier_tv_11_clone_memory_03=Trim(escha_and_logy_no_atelier_tv_11,28991,29118) #128
escha_and_logy_no_atelier_tv_11_linca_training=Trim(escha_and_logy_no_atelier_tv_11,30752,30833) #82 op

escha_and_logy_no_atelier_tv_12_wilbell_land=Trim(escha_and_logy_no_atelier_tv_12,481,666) #186
escha_and_logy_no_atelier_tv_12_airship_lift_off=Trim(escha_and_logy_no_atelier_tv_12,830,983) #154 op
escha_and_logy_no_atelier_tv_12_airship_fly_to_ruin=Trim(escha_and_logy_no_atelier_tv_12,1140,1252) #113
escha_and_logy_no_atelier_tv_12_kuu_transform=Trim(escha_and_logy_no_atelier_tv_12,7194,7285) #92
escha_and_logy_no_atelier_tv_12_kuu_get_bombed=Trim(escha_and_logy_no_atelier_tv_12,8161,8238) #78
escha_and_logy_no_atelier_tv_12_wilbell_use_wind_magic_01=Trim(escha_and_logy_no_atelier_tv_12,10844,11010) #167
escha_and_logy_no_atelier_tv_12_wilbell_use_wind_magic_02=Trim(escha_and_logy_no_atelier_tv_12,11099,11152) #54
escha_and_logy_no_atelier_tv_12_wilbell_use_fire_magic=Trim(escha_and_logy_no_atelier_tv_12,11450,11703) #254 op
escha_and_logy_no_atelier_tv_12_flameu_sit_up=Trim(escha_and_logy_no_atelier_tv_12,13036,13220) #185 op
escha_and_logy_no_atelier_tv_12_kuu_touch_flameu_s_leg=Trim(escha_and_logy_no_atelier_tv_12,13865,13944) #80 op
escha_and_logy_no_atelier_tv_12_flameu_leave_from_human=Trim(escha_and_logy_no_atelier_tv_12,18651,18724) #74 op
escha_and_logy_no_atelier_tv_12_illustration_flameu_cry=Trim(escha_and_logy_no_atelier_tv_12,18725,18776) #52
escha_and_logy_no_atelier_tv_12_flameu_move_ruin_to_sky_01=Trim(escha_and_logy_no_atelier_tv_12,18777,18852) #76
escha_and_logy_no_atelier_tv_12_clone_take_apple_seed=Trim(escha_and_logy_no_atelier_tv_12,18853,18906) #54
escha_and_logy_no_atelier_tv_12_flameu_move_ruin_to_sky_02=Trim(escha_and_logy_no_atelier_tv_12,18907,18966) #60
escha_and_logy_no_atelier_tv_12_escha_jump_to_logy_01=Trim(escha_and_logy_no_atelier_tv_12,21656,21714) #59
escha_and_logy_no_atelier_tv_12_escha_jump_to_logy_02=Trim(escha_and_logy_no_atelier_tv_12,21715,21736) #22
escha_and_logy_no_atelier_tv_12_escha_jump_to_logy_03=Trim(escha_and_logy_no_atelier_tv_12,21737,21777) #41
escha_and_logy_no_atelier_tv_12_apple_orchard=Trim(escha_and_logy_no_atelier_tv_12,24085,24180) #96
escha_and_logy_no_atelier_tv_12_escha_and_logy_run_close_to_flameu_and_clone=Trim(escha_and_logy_no_atelier_tv_12,24918,24976) #59
escha_and_logy_no_atelier_tv_12_first_apple_tree=Trim(escha_and_logy_no_atelier_tv_12,25290,25396) #107
escha_and_logy_no_atelier_tv_12_hunam_round_flameu=Trim(escha_and_logy_no_atelier_tv_12,27496,27790) #296
escha_and_logy_no_atelier_tv_12_logy_take_airship_and_leave=Trim(escha_and_logy_no_atelier_tv_12,32537,32702) #166
escha_and_logy_no_atelier_tv_12_new_apple_flower=Trim(escha_and_logy_no_atelier_tv_12,33553,33802) #250
escha_and_logy_no_atelier_tv_12_shallistera_and_shallotte=Trim(escha_and_logy_no_atelier_tv_12,33803,33920) #118 op
