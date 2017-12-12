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



Import("new_game-tv-season_01-common-cross_process.avsi")
Import("new_game-tv-season_01-common-cross_process-11-op.avsi")

######## TV (1920*1080) ########

new_game_tv_season_01_01=FFMS2_VIDEO_SOURCE("src\anime\season_01\(2016Q3) NEW GAME! 第01話 「なんだかホントに入社した気分です！」 (AT-X 1280x720 x264 AAC).mp4")
new_game_tv_season_01_01_cache02=FFMS2_VIDEO_SOURCE("src\anime\season_01\(2016Q3) NEW GAME! 第01話 「なんだかホントに入社した気分です！」 (AT-X 1280x720 x264 AAC).mp4")
new_game_tv_season_01_02=FFMS2_VIDEO_SOURCE("src\anime\season_01\(2016Q3) NEW GAME! 第02話 「これが大人の飲み会・・・・・・」 (AT-X 1280x720 x264 AAC).mp4")
new_game_tv_season_01_03=FFMS2_VIDEO_SOURCE("src\anime\season_01\(2016Q3) NEW GAME! 第03話 「遅刻したらどうなるんだろう」 (AT-X 1280x720 x264 AAC).mp4")

new_game_tv_season_01_05=FFMS2_VIDEO_SOURCE("src\anime\season_01\(2016Q3) NEW GAME! 第05話 「そんなに泊まり込むんですか？」 (AT-X 1280x720 x264 AAC).mp4")
new_game_tv_season_01_06=FFMS2_VIDEO_SOURCE("src\anime\season_01\(2016Q3) NEW GAME! 第06話 「発売・・・ ・・・中止とか？」  (AT-X 1280x720 x264 AAC).mp4")
new_game_tv_season_01_07=FFMS2_VIDEO_SOURCE("src\anime\season_01\(2016Q3) NEW GAME! 第07話 「新人の教育はしっかりしてください」 (AT-X 1280x720 x264 AAC).mp4")
new_game_tv_season_01_08=FFMS2_VIDEO_SOURCE("src\anime\season_01\(2016Q3) NEW GAME! 第08話 「夏休みだぁああ！！」 (AT-X 1280x720 x264 AAC).mp4")
new_game_tv_season_01_09=FFMS2_VIDEO_SOURCE("src\anime\season_01\(2016Q3) NEW GAME! 第09話 「出勤しちゃいけないんですか？」 (AT-X 1280x720 x264 AAC).mp4")
new_game_tv_season_01_10=FFMS2_VIDEO_SOURCE("src\anime\season_01\(2016Q3) NEW GAME! 第10話 「正社員ってお給料を安くするための法の抜け穴・・・」 (AT-X 1280x720 x264 AAC).mp4")

new_game_tv_season_01_12=FFMS2_VIDEO_SOURCE("src\anime\season_01\(2016Q3) NEW GAME! 第12話 「ひとつ夢が叶いました！」 (AT-X 1280x720 x264 AAC).mp4")
new_game_tv_season_01_12_cache02=FFMS2_VIDEO_SOURCE("src\anime\season_01\(2016Q3) NEW GAME! 第12話 「ひとつ夢が叶いました！」 (AT-X 1280x720 x264 AAC).mp4")

new_game_tv_season_01_clean_op=Trim(new_game_tv_season_01_01,3237,5395)
new_game_tv_season_01_clean_ed=Trim(new_game_tv_season_01_02,29804,31959)

######## Trim ########

new_game_tv_season_01_clean_op_01=Trim(new_game_tv_season_01_clean_op,0,157)
new_game_tv_season_01_clean_op_02=Trim(new_game_tv_season_01_clean_op,158,583)
new_game_tv_season_01_clean_op_03=Trim(new_game_tv_season_01_clean_op,584,1143)
new_game_tv_season_01_clean_op_04=Trim(new_game_tv_season_01_clean_op,1144,1487)
new_game_tv_season_01_clean_op_05=Trim(new_game_tv_season_01_clean_op,1488,1973)
new_game_tv_season_01_clean_op_06=Trim(new_game_tv_season_01_clean_op,1974,0)



new_game_tv_season_01_clean_ed_01=Trim(new_game_tv_season_01_clean_ed,0,187)
new_game_tv_season_01_clean_ed_02=Trim(new_game_tv_season_01_clean_ed,188,1317)
new_game_tv_season_01_clean_ed_03=Trim(new_game_tv_season_01_clean_ed,1318,1670)
new_game_tv_season_01_clean_ed_04=Trim(new_game_tv_season_01_clean_ed,1671,0)



new_game_tv_season_01_01_aoba_twin_tail=Trim(new_game_tv_season_01_01,55,96) #42 ed
new_game_tv_season_01_01_aoba_and_many_people_get_off_train=Trim(new_game_tv_season_01_01,418,537) #120
new_game_tv_season_01_01_aoba_in_many_people=Trim(new_game_tv_season_01_01,538,603) #66
new_game_tv_season_01_01_aoba_is_in_panic_01=Trim(new_game_tv_season_01_01,1207,1284) #78
new_game_tv_season_01_01_aoba_is_in_panic_02=Trim(new_game_tv_season_01_01,1285,1347) #63
new_game_tv_season_01_01_aoba_dogeza=Trim(new_game_tv_season_01_01,3101,3168) #68
new_game_tv_season_01_01_aoba_see_pantie=Trim(new_game_tv_season_01_01,6712,6772) #61
new_game_tv_season_01_01_aoba_meet_kou=Trim(new_game_tv_season_01_01,7121,7287) #167 op
new_game_tv_season_01_01_aoba_drink_bitter_coffee=Trim(new_game_tv_season_01_01,8070,8181) #112
new_game_tv_season_01_01_kou_feel_disappoint=Trim(new_game_tv_season_01_01,9168,9285) #118
new_game_tv_season_01_01_kou_tease_aoba=Trim(new_game_tv_season_01_01,10329,10466) #138
new_game_tv_season_01_01_aoba_bow=Trim(new_game_tv_season_01_01,10467,10581) #115
new_game_tv_season_01_01_hajime_research_character_action=Trim(new_game_tv_season_01_01,11142,11259) #118 op
new_game_tv_season_01_01_hifumi_walk_across_seat=Trim(new_game_tv_season_01_01,11894,11985) #92
new_game_tv_season_01_01_aoba_follow_cat=Trim(new_game_tv_season_01_01,12543,12665) #123
new_game_tv_season_01_01_umiko_shoot_shizuku=Trim(new_game_tv_season_01_01,14138,14208) #71 op
new_game_tv_season_01_01_aoba_and_hifumi_nervous=Trim(new_game_tv_season_01_01,16340,16441) #102
new_game_tv_season_01_01_aoba_shine=Trim(new_game_tv_season_01_01,20666,20773) #108
new_game_tv_season_01_01_hifumi_hesitated=Trim(new_game_tv_season_01_01,20774,20989) #216
new_game_tv_season_01_01_hajime_shy_and_angry=Trim(new_game_tv_season_01_01,22713,22826) #114
new_game_tv_season_01_01_kou_pull_aoba_away=Trim(new_game_tv_season_01_01,24591,24660) #70
new_game_tv_season_01_01_aoba_sexy=Trim(new_game_tv_season_01_01,25282,25329) #48
new_game_tv_season_01_01_aoba_in_viewfinder=Trim(new_game_tv_season_01_01,25515,25634) #120 #middle
new_game_tv_season_01_01_kou_take_photo_of_aoba=Trim(new_game_tv_season_01_01,25927,26046) #120
new_game_tv_season_01_01_hifumi_show_dessert=Trim(new_game_tv_season_01_01,26724,26813) #90
new_game_tv_season_01_01_hifumi_hajime_yun_aoba_eat_dessert=Trim(new_game_tv_season_01_01,26856,27170) #315 ed
new_game_tv_season_01_01_sakura_night=Trim(new_game_tv_season_01_01_cache02,30445,30753) #309 op
new_game_tv_season_01_01_kou_under_sakura_rain=Trim(new_game_tv_season_01_01,30754,30825) #72

new_game_tv_season_01_02_kou_wear_pants=Trim(new_game_tv_season_01_02,5278,5313) #36
new_game_tv_season_01_02_hajime_show_magic_wand=Trim(new_game_tv_season_01_02,5798,5963) #166
new_game_tv_season_01_02_hifumi_sit_down=Trim(new_game_tv_season_01_02,6968,6994) #27 ed
new_game_tv_season_01_02_shizuku_catch_cat_s_hand_and_wave=Trim(new_game_tv_season_01_02,8661,8918) #258 op
new_game_tv_season_01_02_aoba_watch_hifumi_and_hifumi_scared=Trim(new_game_tv_season_01_02,9928,10092) #165
new_game_tv_season_01_02_sound_on_and_hifumi_and_aoba_in_panic=Trim(new_game_tv_season_01_02,10135,10216) #82
new_game_tv_season_01_02_hifumi_is_misunderstood=Trim(new_game_tv_season_01_02,11706,11849) #144
new_game_tv_season_01_02_hifumi_take_money_01=Trim(new_game_tv_season_01_02,12660,12757) #98 op
new_game_tv_season_01_02_hifumi_take_money_02=Trim(new_game_tv_season_01_02,13203,13290) #88
new_game_tv_season_01_02_aoba_force_hifumi_smile=Trim(new_game_tv_season_01_02,13793,13888) #96
new_game_tv_season_01_02_aoba_is_similar_to_hedgehog=Trim(new_game_tv_season_01_02,14936,15031) #96
new_game_tv_season_01_02_hifumi_excited=Trim(new_game_tv_season_01_02,15032,15121) #90 ed
new_game_tv_season_01_02_hifumi_smile_to_aoba=Trim(new_game_tv_season_01_02,15296,15415) #120
new_game_tv_season_01_02_hifumi_frustrated=Trim(new_game_tv_season_01_02,15917,15975) #59
new_game_tv_season_01_02_nekomimi_village_in_game=Trim(new_game_tv_season_01_02,18061,18216) #156
new_game_tv_season_01_02_hifumi_aoba_yun_hajime_eat_afternoon_tea=Trim(new_game_tv_season_01_02,18344,18561) #218 op
new_game_tv_season_01_02_yun_is_drunk_but_hifumi_is_ok=Trim(new_game_tv_season_01_02,21169,21479) #311
new_game_tv_season_01_02_hajime_disappointed_and_kou_blame_to_hajime=Trim(new_game_tv_season_01_02,22715,22829) #115
new_game_tv_season_01_02_different_reaction_in_social_drinking_01=Trim(new_game_tv_season_01_02,24070,24153) #84
new_game_tv_season_01_02_different_reaction_in_social_drinking_02=Trim(new_game_tv_season_01_02,24307,24363) #57
new_game_tv_season_01_02_rin_is_drunk=Trim(new_game_tv_season_01_02,25864,26006) #143 op
new_game_tv_season_01_02_waitress_come_and_hifumi_and_aoba_shock=Trim(new_game_tv_season_01_02,28258,28289) #32
new_game_tv_season_01_02_rin_aoba_kou_in_bar=Trim(new_game_tv_season_01_02,29319,29477) #159
new_game_tv_season_01_02_shaker=Trim(new_game_tv_season_01_02,29706,29731) #26
new_game_tv_season_01_02_aoba_see_cocktail=Trim(new_game_tv_season_01_02,29732,29803) #72 ed

new_game_tv_season_01_03_aoba_sleeping=Trim(new_game_tv_season_01_03,135,242) #108 ed
new_game_tv_season_01_03_kou_force_aoba_wear_pantie_only=Trim(new_game_tv_season_01_03,3717,3802) #86
new_game_tv_season_01_03_yun_shake_aoba_s_hand=Trim(new_game_tv_season_01_03,5193,5372) #180
new_game_tv_season_01_03_yun_aoba_run_01=Trim(new_game_tv_season_01_03,5965,6012) #48
new_game_tv_season_01_03_yun_aoba_run_02=Trim(new_game_tv_season_01_03,6016,6057) #42
new_game_tv_season_01_03_yun_aoba_run_03=Trim(new_game_tv_season_01_03,6061,6096) #36
new_game_tv_season_01_03_yun_aoba_run_04=Trim(new_game_tv_season_01_03,6100,6159) #60
new_game_tv_season_01_03_aoba_cannot_run=Trim(new_game_tv_season_01_03,6160,6290) #131
new_game_tv_season_01_03_yun_stretch_out_hand=Trim(new_game_tv_season_01_03,6345,6524) #180 op
new_game_tv_season_01_03_aoba_stretch_out_hand=Trim(new_game_tv_season_01_03,6525,6668) #144
new_game_tv_season_01_03_yun_catch_aoba_s_hand=Trim(new_game_tv_season_01_03,6669,6777) #109 op
new_game_tv_season_01_03_alba_fall_down_01=Trim(new_game_tv_season_01_03,6796,6847) #52
new_game_tv_season_01_03_alba_fall_down_02=Trim(new_game_tv_season_01_03,6848,6891) #44
new_game_tv_season_01_03_hifumi_nervous=Trim(new_game_tv_season_01_03,10138,10257) #120
new_game_tv_season_01_03_modeling=Trim(new_game_tv_season_01_03,11352,11483) #132
new_game_tv_season_01_03_aoba_excited=Trim(new_game_tv_season_01_03,11733,11768) #36
new_game_tv_season_01_03_hajime_show_monster_animation=Trim(new_game_tv_season_01_03,13281,13370) #90 op
new_game_tv_season_01_03_yun_feel_too_more_work=Trim(new_game_tv_season_01_03,14021,14159) #139
new_game_tv_season_01_03_cat_dawdle_01=Trim(new_game_tv_season_01_03,14970,15036) #67
new_game_tv_season_01_03_cat_dawdle_02=Trim(new_game_tv_season_01_03,15141,15281) #141
new_game_tv_season_01_03_shizuku_give_cat_to_aoba=Trim(new_game_tv_season_01_03,15775,15997) #223
new_game_tv_season_01_03_aoba_confused=Trim(new_game_tv_season_01_03,21623,21678) #56
new_game_tv_season_01_03_aoba_near_river_in_night=Trim(new_game_tv_season_01_03,26016,26099) #84
new_game_tv_season_01_03_aoba_s_leg=Trim(new_game_tv_season_01_03,28034,28536) #503 op
new_game_tv_season_01_03_aoba_imagine_character=Trim(new_game_tv_season_01_03,28537,28776) #240
new_game_tv_season_01_03_nene_ask=Trim(new_game_tv_season_01_03,29156,29371) #216
new_game_tv_season_01_03_nene_lie_on_bed=Trim(new_game_tv_season_01_03,29624,29755) #132 ed
new_game_tv_season_01_03_aoba_refuse=Trim(new_game_tv_season_01_03,32820,33007) #188

new_game_tv_season_01_04_shizuku_take_photo_of_aoba=Trim(new_game_tv_season_01_04,4050,4271) #222
new_game_tv_season_01_04_kou_wear_pantie_and_seen_by_rin=Trim(new_game_tv_season_01_04,5938,6123) #186
new_game_tv_season_01_04_kou_face_upward=Trim(new_game_tv_season_01_04,8043,8137) #95
new_game_tv_season_01_04_rin_wear_pantie_only=Trim(new_game_tv_season_01_04,12964,13155) #192 op
new_game_tv_season_01_04_kou_despise_rin=Trim(new_game_tv_season_01_04,13433,13554) #122
new_game_tv_season_01_04_rin_catch_kou_and_feel_nervous=Trim(new_game_tv_season_01_04,13555,13626) #72

new_game_tv_season_01_04_rin_and_kou_wear_pantie_only_and_lie=Trim(new_game_tv_season_01_04,14659,14799) #141 op
new_game_tv_season_01_04_rin_and_aoba_in_panic=Trim(new_game_tv_season_01_04,14950,15081) #132
new_game_tv_season_01_04_hajime_excited=Trim(new_game_tv_season_01_04,15479,15595) #117
new_game_tv_season_01_04_aoba_get_salary=Trim(new_game_tv_season_01_04,16210,16524) #315
new_game_tv_season_01_04_hajime_show_lightsaber=Trim(new_game_tv_season_01_04,17828,18085) #258 op
new_game_tv_season_01_04_hajime_show_figure=Trim(new_game_tv_season_01_04,20984,21103) #120
new_game_tv_season_01_04_rin_catch_kou_s_face=Trim(new_game_tv_season_01_04,24136,24268) #133
new_game_tv_season_01_04_shutdown=Trim(new_game_tv_season_01_04,27916,27939) #24 #middle
new_game_tv_season_01_04_kou_ero=Trim(new_game_tv_season_01_04,32324,32371) #48 ed
new_game_tv_season_01_04_rin_ero=Trim(new_game_tv_season_01_04,32372,32419) #48 ed
new_game_tv_season_01_04_rin_and_kou_lie_in_sauna=Trim(new_game_tv_season_01_04,32420,32491) #72 ed
new_game_tv_season_01_04_rin_throw_pillow=Trim(new_game_tv_season_01_04,33830,33893) #64

new_game_tv_season_01_05_tweak_animation=Trim(new_game_tv_season_01_05,0,95) #96 op
new_game_tv_season_01_05_animation_demo_idle=Trim(new_game_tv_season_01_05,400,525) #126
new_game_tv_season_01_05_yun_show_moe=Trim(new_game_tv_season_01_05,747,842) #96
new_game_tv_season_01_05_yun_make_aoba_cry=Trim(new_game_tv_season_01_05,1427,1571) #145
new_game_tv_season_01_05_animation_demo_walk=Trim(new_game_tv_season_01_05,1820,1957) #138
new_game_tv_season_01_05_hajime_cry=Trim(new_game_tv_season_01_05,9021,9092) #72
new_game_tv_season_01_05_hajime_nyan=Trim(new_game_tv_season_01_05,10095,10160) #66 op
new_game_tv_season_01_05_hajime_cry_and_run_away=Trim(new_game_tv_season_01_05,11286,11412) #127 ed
new_game_tv_season_01_05_yun_puyopuyo=Trim(new_game_tv_season_01_05,14987,15040) #54
new_game_tv_season_01_05_hajime_appear=Trim(new_game_tv_season_01_05,19818,19900) #83
new_game_tv_season_01_05_rin_angry=Trim(new_game_tv_season_01_05,20769,20960) #192 op
new_game_tv_season_01_05_rin_and_kou_in_photo_01=Trim(new_game_tv_season_01_05,24839,25042) #204
new_game_tv_season_01_05_aoba_embarassed=Trim(new_game_tv_season_01_05,26066,26155) #90
new_game_tv_season_01_05_rin_and_kou_in_photo_02=Trim(new_game_tv_season_01_05,28847,28996) #150 ed
new_game_tv_season_01_05_hifumi_frustrated=Trim(new_game_tv_season_01_05,29647,29750) #104

new_game_tv_season_01_06_hajime_run_out=Trim(new_game_tv_season_01_06,1279,1473) #195
new_game_tv_season_01_06_aoba_confused=Trim(new_game_tv_season_01_06,1695,1831) #137
new_game_tv_season_01_06_aoba_refine_character_setting=Trim(new_game_tv_season_01_06,4530,4587) #58
new_game_tv_season_01_06_kou_catch_aoba_s_twin_tail=Trim(new_game_tv_season_01_06,4834,4913) #80
new_game_tv_season_01_06_kou_stand_after_wall=Trim(new_game_tv_season_01_06,5861,6007) #147 op
new_game_tv_season_01_06_village_in_game=Trim(new_game_tv_season_01_06,7835,7899) #65 ed
new_game_tv_season_01_06_hajime_as_leader=Trim(new_game_tv_season_01_06,9080,9263) #184
new_game_tv_season_01_06_aoba_and_sofia_character_design_paper=Trim(new_game_tv_season_01_06,10156,10536) #381
new_game_tv_season_01_06_aoba_lie_on_sofa=Trim(new_game_tv_season_01_06,11102,11263) #162
new_game_tv_season_01_06_yun_play_game=Trim(new_game_tv_season_01_06,12177,12295) #119 ed
new_game_tv_season_01_06_yun_take_care_of_sister_and_brother=Trim(new_game_tv_season_01_06,12679,12999) #321 op
new_game_tv_season_01_06_hifumi_laugh=Trim(new_game_tv_season_01_06,13065,13228) #164
new_game_tv_season_01_06_kou_s_ass_while_sleeping=Trim(new_game_tv_season_01_06,13419,13490) #72
new_game_tv_season_01_06_aoba_is_grooming=Trim(new_game_tv_season_01_06,14179,14424) #246

new_game_tv_season_01_06_intermission_sofia=Trim(new_game_tv_season_01_06,15177,15249) #73

new_game_tv_season_01_06_nene_kirakira=Trim(new_game_tv_season_01_06,18696,18837) #142
new_game_tv_season_01_06_magical_girl_transform=Trim(new_game_tv_season_01_06,20161,20304) #146 op
new_game_tv_season_01_06_hajime_as_director=Trim(new_game_tv_season_01_06,24483,24548) #66
new_game_tv_season_01_06_yun_and_aoba_shock=Trim(new_game_tv_season_01_06,25820,26024) #205
new_game_tv_season_01_06_kou_scare_aoba=Trim(new_game_tv_season_01_06,27426,27459) #34
new_game_tv_season_01_06_aoba_strip_clothes_01=Trim(new_game_tv_season_01_06,27569,27642) #74
new_game_tv_season_01_06_aoba_strip_clothes_02=Trim(new_game_tv_season_01_06,27643,27712) #70 op
new_game_tv_season_01_06_aoba_strip_clothes_03=Trim(new_game_tv_season_01_06,27713,27776) #64
new_game_tv_season_01_06_aoba_strip_clothes_04=Trim(new_game_tv_season_01_06,27777,27822) #46
new_game_tv_season_01_06_aoba_watched_by_kou=Trim(new_game_tv_season_01_06,27946,28101) #156 ed
new_game_tv_season_01_06_aoba_s_kuma_sleeping_bag=Trim(new_game_tv_season_01_06,28945,29061) #117 #middle
new_game_tv_season_01_06_aoba_scare_kou=Trim(new_game_tv_season_01_06,29825,29925) #101
new_game_tv_season_01_06_aoba_sleeping=Trim(new_game_tv_season_01_06,30825,30881) #57

new_game_tv_season_01_07_modeling_sofia=Trim(new_game_tv_season_01_07,124,244) #121 op
new_game_tv_season_01_07_asset_error=Trim(new_game_tv_season_01_07,1349,1461) #113
new_game_tv_season_01_07_umiko_shoot_kou=Trim(new_game_tv_season_01_07,5795,5910) #116 ed
new_game_tv_season_01_07_aoba_kirakira=Trim(new_game_tv_season_01_07,10526,10596) #71
new_game_tv_season_01_07_umiko_smell_bullet=Trim(new_game_tv_season_01_07,11635,11824) #190
new_game_tv_season_01_07_kou_feel_wind=Trim(new_game_tv_season_01_07,15141,15285) #145
new_game_tv_season_01_07_aoba_wear_army_suit=Trim(new_game_tv_season_01_07,16079,16210) #132
new_game_tv_season_01_07_umiko_shoot_target=Trim(new_game_tv_season_01_07,16770,16802) #33
new_game_tv_season_01_07_umiko_change_gun=Trim(new_game_tv_season_01_07,16828,16926) #99 op
new_game_tv_season_01_07_umiko_vs_kou=Trim(new_game_tv_season_01_07,18107,18187) #81
new_game_tv_season_01_07_umiko_and_kou_shoot_to_each_other=Trim(new_game_tv_season_01_07,18285,18439) #155
new_game_tv_season_01_07_hajime_watch_hifumi_s_breast=Trim(new_game_tv_season_01_07,19839,20099) #261
new_game_tv_season_01_07_hifumi_do_physical_examination_and_become_nervous=Trim(new_game_tv_season_01_07,20988,21235) #248
new_game_tv_season_01_07_aoba_frustrated_during_physical_examination=Trim(new_game_tv_season_01_07,21958,22032) #75
new_game_tv_season_01_07_aoba_nervous_during_physical_examination=Trim(new_game_tv_season_01_07,23291,23374) #84
new_game_tv_season_01_07_umiko_draw_blood_by_herself=Trim(new_game_tv_season_01_07,25436,25556) #121
new_game_tv_season_01_07_yun_happy=Trim(new_game_tv_season_01_07,26454,26587) #134 op
new_game_tv_season_01_07_yun_stuck=Trim(new_game_tv_season_01_07,26588,26740) #153
new_game_tv_season_01_07_yun_touch_hajime_s_waist=Trim(new_game_tv_season_01_07,27200,27325) #126
new_game_tv_season_01_07_umiko_pull_gun_toward_shizuku=Trim(new_game_tv_season_01_07,28580,28707) #128
new_game_tv_season_01_07_kou_sleep_on_rin_s_leg=Trim(new_game_tv_season_01_07,29189,29332) #144
new_game_tv_season_01_07_nene_lie_on_bed=Trim(new_game_tv_season_01_07,32909,33184) #276 op

new_game_tv_season_01_08_nene_jump=Trim(new_game_tv_season_01_08,5416,5493) #78 op
new_game_tv_season_01_08_umiko_make_nene_nervous=Trim(new_game_tv_season_01_08,6709,6805) #97 ed
new_game_tv_season_01_08_nene_watch_figure_and_kirakira=Trim(new_game_tv_season_01_08,8356,8437) #82 op
new_game_tv_season_01_08_umiko_catch_nene=Trim(new_game_tv_season_01_08,9985,10075) #91
new_game_tv_season_01_08_game_hang=Trim(new_game_tv_season_01_08,11582,11708) #127
new_game_tv_season_01_08_shizuku_take_photo_with_nene_and_aoba_01=Trim(new_game_tv_season_01_08,14263,14352) #90
new_game_tv_season_01_08_shizuku_take_photo_with_nene_and_aoba_02=Trim(new_game_tv_season_01_08,14353,14448) #96 op
new_game_tv_season_01_08_nene_love=Trim(new_game_tv_season_01_08,15244,15345) #102
new_game_tv_season_01_08_nene_take_purin=Trim(new_game_tv_season_01_08,17214,17298) #85
new_game_tv_season_01_08_game_event_sofia_meet_thieves_01=Trim(new_game_tv_season_01_08,17461,17565) #105 op
new_game_tv_season_01_08_game_event_sofia_meet_thieves_02=Trim(new_game_tv_season_01_08,17566,17769) #204 ed
new_game_tv_season_01_08_game_event_sofia_meet_thieves_03=Trim(new_game_tv_season_01_08,17873,18105) #233
new_game_tv_season_01_08_game_event_sofia_meet_thieves_04=Trim(new_game_tv_season_01_08,18193,18276) #84
new_game_tv_season_01_08_nene_scared_01=Trim(new_game_tv_season_01_08,22814,22912) #99
new_game_tv_season_01_08_nene_scared_02=Trim(new_game_tv_season_01_08,24144,24260) #117
new_game_tv_season_01_08_rin_see_purin_and_smile=Trim(new_game_tv_season_01_08,26656,26733) #78 ed

new_game_tv_season_01_09_nene_tweak_camera_to_see_npc_s_pantie=Trim(new_game_tv_season_01_09,559,654) #96
new_game_tv_season_01_09_hajime_research_character_action=Trim(new_game_tv_season_01_09,6691,6764) #74 op
new_game_tv_season_01_09_hajime_research_character_action_make_yun_angry=Trim(new_game_tv_season_01_09,6866,7125) #260
new_game_tv_season_01_09_yun_love_love=Trim(new_game_tv_season_01_09,7126,7443) #318 op
new_game_tv_season_01_09_hajime_imitate_dandy=Trim(new_game_tv_season_01_09,9522,9696) #175
new_game_tv_season_01_09_yun_imitate_dandy=Trim(new_game_tv_season_01_09,10017,10241) #225
new_game_tv_season_01_09_nene_imitate_dandy=Trim(new_game_tv_season_01_09,10446,10658) #213 op
new_game_tv_season_01_09_umiko_see_nene_nervous=Trim(new_game_tv_season_01_09,13270,13377) #108
new_game_tv_season_01_09_kou_feed_rin=Trim(new_game_tv_season_01_09,15997,16304) #308
new_game_tv_season_01_09_nene_thumb_up=Trim(new_game_tv_season_01_09,19232,19321) #90
new_game_tv_season_01_09_kou_take_shower=Trim(new_game_tv_season_01_09,20453,20536) #84
new_game_tv_season_01_09_hifumi_see_others_splash_water=Trim(new_game_tv_season_01_09,27063,27317) #255
new_game_tv_season_01_09_hifumi_take_shower_01=Trim(new_game_tv_season_01_09,28103,28246) #144 op
new_game_tv_season_01_09_hifumi_take_shower_02=Trim(new_game_tv_season_01_09,28247,28294) #48
new_game_tv_season_01_09_yun_hajime_hifumi_aoba_after_bath=Trim(new_game_tv_season_01_09,28384,28468) #85 ed
new_game_tv_season_01_09_shizuku_gift_cream_puffs=Trim(new_game_tv_season_01_09,32150,32221) #72
new_game_tv_season_01_09_nene_move_seat=Trim(new_game_tv_season_01_09,33372,33587) #216
new_game_tv_season_01_09_umiko_lick=Trim(new_game_tv_season_01_09,33783,33926) #144

new_game_tv_season_01_10_aoba_run_in_train=Trim(new_game_tv_season_01_10,929,1036) #108 op
new_game_tv_season_01_10_aoba_s_eyes_are_covered=Trim(new_game_tv_season_01_10,4317,4366) #50
new_game_tv_season_01_10_demon_aoba=Trim(new_game_tv_season_01_10,8401,8568) #168 op
new_game_tv_season_01_10_nene_unhappy=Trim(new_game_tv_season_01_10,9322,9429) #108
new_game_tv_season_01_10_umiko_and_tired_programmer=Trim(new_game_tv_season_01_10,10457,10609) #153 op sp
new_game_tv_season_01_10_umiko_say_there_is_more_bug_than_expected=Trim(new_game_tv_season_01_10,10966,11080) #115 sp
new_game_tv_season_01_10_shizuku_loop_sweet_and_salty=Trim(new_game_tv_season_01_10,15515,15715) #201 ed
new_game_tv_season_01_10_hifumi_watch_hedgehog=Trim(new_game_tv_season_01_10,16797,16927) #131
new_game_tv_season_01_10_little_nene_see_aoba_coming=Trim(new_game_tv_season_01_10,19132,19398) #267
new_game_tv_season_01_10_little_aoba_keep_nene_s_safe=Trim(new_game_tv_season_01_10,19399,19477) #79 ed
new_game_tv_season_01_10_nene_fly_in_front_of_aoba=Trim(new_game_tv_season_01_10,26839,26934) #96
new_game_tv_season_01_10_aoba_watch_nene_fly=Trim(new_game_tv_season_01_10,26935,27030) #96 op
new_game_tv_season_01_10_aoba_watch_nene_fall_down=Trim(new_game_tv_season_01_10,27031,27198) #168
new_game_tv_season_01_10_umiko_angry_and_nene_scared=Trim(new_game_tv_season_01_10,30068,30209) #142
new_game_tv_season_01_10_nene_scared=Trim(new_game_tv_season_01_10,30210,30330) #121

new_game_tv_season_01_11_tgs_ticket=Trim(new_game_tv_season_01_11,0,71) #72
new_game_tv_season_01_11_nene_kirakira=Trim(new_game_tv_season_01_11,1596,1660) #65 ed
new_game_tv_season_01_11_tgs_makuhari_messe_outside=Trim(new_game_tv_season_01_11,2823,2874) #52 op
new_game_tv_season_01_11_tgs_makuhari_messe_inside_01=Trim(new_game_tv_season_01_11,2875,2934) #60 op
new_game_tv_season_01_11_tgs_makuhari_messe_inside_02=Trim(new_game_tv_season_01_11,2935,2995) #61

new_game_tv_season_01_11_hifumi_cosplay=Trim(new_game_tv_season_01_11,6186,6255) #70 op
new_game_tv_season_01_11_hifumi_cosplay_shock=Trim(new_game_tv_season_01_11,6655,6696) #42
new_game_tv_season_01_11_aoba_yun_hajime_watch_fairies_story_3_and_excited=Trim(new_game_tv_season_01_11,7274,7614) #341
new_game_tv_season_01_11_hajime_watch_fairies_story_3=Trim(new_game_tv_season_01_11,7872,7937) #66
new_game_tv_season_01_11_yun_watch_fairies_story_3=Trim(new_game_tv_season_01_11,7938,8003) #66
new_game_tv_season_01_11_aoba_yun_hajime_watch_fairies_story_3=Trim(new_game_tv_season_01_11,8004,8229) #226
new_game_tv_season_01_11_hifumi_cosplay_play_fairies_story_3=Trim(new_game_tv_season_01_11,9315,9521) #207
new_game_tv_season_01_11_aoba_another_style_try_01=Trim(new_game_tv_season_01_11,10306,10433) #128
new_game_tv_season_01_11_aoba_another_style_try_02=Trim(new_game_tv_season_01_11,10464,10579) #116
new_game_tv_season_01_11_aoba_another_style_try_03=Trim(new_game_tv_season_01_11,10613,10789) #177
new_game_tv_season_01_11_aoba_another_style_try_04=Trim(new_game_tv_season_01_11,10846,10952) #107
new_game_tv_season_01_11_aoba_another_style=Trim(new_game_tv_season_01_11,11118,11211) #94
new_game_tv_season_01_11_kou_another_style_01=Trim(new_game_tv_season_01_11,16300,16362) #63 ed
new_game_tv_season_01_11_kou_another_style_02=Trim(new_game_tv_season_01_11,16363,16444) #82
new_game_tv_season_01_11_kou_another_style_old=Trim(new_game_tv_season_01_11,17597,17681) #85
new_game_tv_season_01_11_kou_another_style_talk=Trim(new_game_tv_season_01_11,18618,18778) #161 op
new_game_tv_season_01_11_nene_finger_to_umiko=Trim(new_game_tv_season_01_11,20566,20613) #48
new_game_tv_season_01_11_nene_imagine_umiko_angry=Trim(new_game_tv_season_01_11,22587,22692) #106
new_game_tv_season_01_11_umiko_take_energy_drink=Trim(new_game_tv_season_01_11,23778,23835) #58
new_game_tv_season_01_11_umiko_open_energy_drink=Trim(new_game_tv_season_01_11,24763,24925) #163
new_game_tv_season_01_11_kou_wear_her_hair_down=Trim(new_game_tv_season_01_11,26984,27162) #179
new_game_tv_season_01_11_henkyou_station=Trim(new_game_tv_season_01_11,33710,33926) #217

new_game_tv_season_01_12_kou_see_upside=Trim(new_game_tv_season_01_12,588,696) #109 op
new_game_tv_season_01_12_kou_and_aoba_watch_fairies_story_3_poster=Trim(new_game_tv_season_01_12,1050,1200) #151 op
new_game_tv_season_01_12_karen_cosplay_01=Trim(new_game_tv_season_01_12,6121,6145) #25
new_game_tv_season_01_12_karen_cosplay_02=Trim(new_game_tv_season_01_12,6146,6253) #108
new_game_tv_season_01_12_karen_cosplay_03=Trim(new_game_tv_season_01_12,6254,6385) #132 op
new_game_tv_season_01_12_karen_cosplay_04=Trim(new_game_tv_season_01_12,7181,7232) #52
new_game_tv_season_01_12_hajime_and_nene_tokuten=Trim(new_game_tv_season_01_12,9913,10035) #123
new_game_tv_season_01_12_nene_disappointed=Trim(new_game_tv_season_01_12,10686,10793) #108
new_game_tv_season_01_12_hajime_and_nene_nervous=Trim(new_game_tv_season_01_12,11925,12048) #124
new_game_tv_season_01_12_umiko_make_nene_scared=Trim(new_game_tv_season_01_12,13000,13089) #90
new_game_tv_season_01_12_hifumi_take_signature_board=Trim(new_game_tv_season_01_12,19279,19394) #116
new_game_tv_season_01_12_seiyuu_sign=Trim(new_game_tv_season_01_12,19438,19539) #102
new_game_tv_season_01_12_seiyuu_demo_magical_girl=Trim(new_game_tv_season_01_12,19776,19850) #75 op
new_game_tv_season_01_12_hifumi_nervous_and_aoba_excited=Trim(new_game_tv_season_01_12,19851,19916) #66
new_game_tv_season_01_12_nene_do_not_like_gun=Trim(new_game_tv_season_01_12,23631,23711) #81
new_game_tv_season_01_12_nene_kirakira_watch_umiko=Trim(new_game_tv_season_01_12,25056,25198) #143
new_game_tv_season_01_12_aoba_catch_kou_s_hand_01=Trim(new_game_tv_season_01_12,30644,30762) #119 ed
new_game_tv_season_01_12_aoba_catch_kou_s_hand_01_cache02=Trim(new_game_tv_season_01_12_cache02,30644,30762) #119 ed
new_game_tv_season_01_12_aoba_catch_kou_s_hand_02=Trim(new_game_tv_season_01_12,30786,30887) #102 ed

new_game_tv_season_01_12_appendix_title=Trim(new_game_tv_season_01_12,32729,32823) #95
new_game_tv_season_01_12_appendix=Trim(new_game_tv_season_01_12,32824,33726) #903
new_game_tv_season_01_12_appendix_shutdown=Trim(new_game_tv_season_01_12,33727,33735) #9
