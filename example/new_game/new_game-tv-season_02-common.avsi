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



#Import("new_game-tv-common-cross_process.avsi")

######## TV (1920*1080) ########

new_game_tv_season_02_01=FFMS2_VIDEO_SOURCE("src\anime\season_02\(2017Q3) New Game!! 第01話 「恥ずかしいところを見られてしまいました・・・・・・」 (AT-X 1280x720 x264 AAC).mp4")
new_game_tv_season_02_02=FFMS2_VIDEO_SOURCE("src\anime\season_02\(2017Q3) NEW GAME!! 第02話 「これじゃあただのコスプレだにゃー！」 (AT-X 1280x720 x264 AAC).mp4")
new_game_tv_season_02_03=FFMS2_VIDEO_SOURCE("src\anime\season_02\(2017Q3) NEW GAME!! 第03話 「・・・・・・うー、恥ずかしい！」 (AT-X 1280x720 x264 AAC).mp4")
new_game_tv_season_02_04=FFMS2_VIDEO_SOURCE("src\anime\season_02\(2017Q3) NEW GAME!! 第04話 「この・・・にぶちんめ！」 (AT-X 1280x720 x264 AAC).mp4")
new_game_tv_season_02_05=FFMS2_VIDEO_SOURCE("src\anime\season_02\(2017Q3) NEW GAME!! 第05話 「や、変なとこ触らないでよ！」  (AT-X 1280x720 x264 AAC).mp4")
new_game_tv_season_02_06=FFMS2_VIDEO_SOURCE("src\anime\season_02\(2017Q3) NEW GAME!! 第06話 「あぁ・・・・・・すごいなあ・・・・・・」 (AT-X 1280x720 x264 AAC).mp4")
new_game_tv_season_02_07=FFMS2_VIDEO_SOURCE("src\anime\season_02\(2017Q3) NEW GAME!! 第07話 「凄く熱い視線を感じる」 (AT-X 1280x720 x264 AAC).mp4")
new_game_tv_season_02_08=FFMS2_VIDEO_SOURCE("src\anime\season_02\(2017Q3) NEW GAME!! 第08話 「メイド喫茶がいいと言ったんだよ」 (AT-X 1280x720 x264 AAC).mp4")
new_game_tv_season_02_09=FFMS2_VIDEO_SOURCE("src\anime\season_02\(2017Q3) NEW GAME!! 第09話 「シャツくらい着なよ！」 (AT-X 1280x720 x264 AAC).mp4")
new_game_tv_season_02_10=FFMS2_VIDEO_SOURCE("src\anime\season_02\(2017Q3) NEW GAME!! 第10話 「どんどんリアリティが薄くなっていくんだよ」 (AT-X 1280x720 x264 AAC).mp4")
new_game_tv_season_02_11=FFMS2_VIDEO_SOURCE("src\anime\season_02\(2017Q3) NEW GAME!! 第11話 「心に闇を抱えてるのか」 (AT-X 1280x720 x264 AAC).mp4")
new_game_tv_season_02_12=FFMS2_VIDEO_SOURCE("src\anime\season_02\(2017Q3) NEW GAME!! 第12話 「ぜひ買ってくださいね！」 (AT-X 1280x720 x264 AAC).mp4")

new_game_tv_season_02_clean_op=Trim(new_game_tv_season_02_02,960,3115)
new_game_tv_season_02_clean_ed_01=Trim(new_game_tv_season_02_02,32128,34285)

new_game_tv_season_02_another_op=Trim(new_game_tv_season_02_06,25526,26944)

######## Trim ########

new_game_tv_season_02_clean_op_01=Trim(new_game_tv_season_02_clean_op,0,335) #336
new_game_tv_season_02_clean_op_02=Trim(new_game_tv_season_02_clean_op,336,1135) #800
new_game_tv_season_02_clean_op_03=Trim(new_game_tv_season_02_clean_op,1136,1381) #246
new_game_tv_season_02_clean_op_04=Trim(new_game_tv_season_02_clean_op,1382,1535) #154
new_game_tv_season_02_clean_op_05=Trim(new_game_tv_season_02_clean_op,1536,1643) #108
new_game_tv_season_02_clean_op_06=Trim(new_game_tv_season_02_clean_op,1644,1785) #142
new_game_tv_season_02_clean_op_07=Trim(new_game_tv_season_02_clean_op,1786,0) #370



new_game_tv_season_02_clean_ed_01_01=Trim(new_game_tv_season_02_clean_ed_01,0,1080)
new_game_tv_season_02_clean_ed_01_02=Trim(new_game_tv_season_02_clean_ed_01,1081,0)



new_game_tv_season_02_01_aoba_shock=Trim(new_game_tv_season_02_01,1060,1080) #21
new_game_tv_season_02_01_kou_s_pantie=Trim(new_game_tv_season_02_01,2059,2237) #179
new_game_tv_season_02_01_hajime_be_cool=Trim(new_game_tv_season_02_01,3741,3803) #63
new_game_tv_season_02_01_aoba_tell_hifumi_to_not_nervous=Trim(new_game_tv_season_02_01,4471,4599) #129
new_game_tv_season_02_01_umiko_show_gun=Trim(new_game_tv_season_02_01,6545,6666) #122
new_game_tv_season_02_01_hifumi_smile=Trim(new_game_tv_season_02_01,7551,7598) #48
new_game_tv_season_02_01_shizuku_feel_hifumi_so_cute=Trim(new_game_tv_season_02_01,7599,7712) #114
new_game_tv_season_02_01_shizuku_take_photo_of_hifumi=Trim(new_game_tv_season_02_01,8559,8724) #166
new_game_tv_season_02_01_nene_open_mouth=Trim(new_game_tv_season_02_01,11513,11584) #72
new_game_tv_season_02_01_umiko_feed_nene=Trim(new_game_tv_season_02_01,11678,11791) #114 op
new_game_tv_season_02_01_program_error=Trim(new_game_tv_season_02_01,13074,13457) #384
new_game_tv_season_02_01_nene_write_program_and_disappointed=Trim(new_game_tv_season_02_01,13639,13722) #84 candidate
new_game_tv_season_02_01_umiko_read_program=Trim(new_game_tv_season_02_01,13989,14094) #106
new_game_tv_season_02_01_nene_write_program_and_happy=Trim(new_game_tv_season_02_01,14507,14606) #100
new_game_tv_season_02_01_program_code=Trim(new_game_tv_season_02_01,14984,15133) #150
new_game_tv_season_02_01_nene_touch_her_face=Trim(new_game_tv_season_02_01,15623,15757) #135
new_game_tv_season_02_01_hifumi_lie_on_sofa=Trim(new_game_tv_season_02_01,16016,16201) #186
new_game_tv_season_02_01_hedgehog_walk_on_hifumi_s_breast_01=Trim(new_game_tv_season_02_01,16202,16291) #90
new_game_tv_season_02_01_hedgehog_walk_on_hifumi_s_breast_02=Trim(new_game_tv_season_02_01,16292,16339) #48 op
new_game_tv_season_02_01_hifumi_nervous=Trim(new_game_tv_season_02_01,21628,21689) #62
new_game_tv_season_02_01_umiko_point_gun_to_shizuku=Trim(new_game_tv_season_02_01,23084,23273) #190
new_game_tv_season_02_01_aoba_s_eye_is_shining_under_sakura_rain=Trim(new_game_tv_season_02_01,31806,31978) #173 op

new_game_tv_season_02_02_killer_move=Trim(new_game_tv_season_02_02,4573,4672) #100
new_game_tv_season_02_02_hifumi_make_a_fist=Trim(new_game_tv_season_02_02,7305,7368) #64 candidate
new_game_tv_season_02_02_aoba_cosplay_dog=Trim(new_game_tv_season_02_02,7680,7746) #67
new_game_tv_season_02_02_aoba_cosplay_dairy_cattle=Trim(new_game_tv_season_02_02,7747,7827) #81
new_game_tv_season_02_02_aoba_cosplay_cat=Trim(new_game_tv_season_02_02,7828,7911) #84 op
new_game_tv_season_02_02_aoba_stand_up=Trim(new_game_tv_season_02_02,8132,8179) #48
new_game_tv_season_02_02_aoba_surprised=Trim(new_game_tv_season_02_02,8329,8364) #36
new_game_tv_season_02_02_aoba_curious=Trim(new_game_tv_season_02_02,10088,10249) #162
new_game_tv_season_02_02_hajime_watch_tv_01=Trim(new_game_tv_season_02_02,10460,10531) #72
new_game_tv_season_02_02_hajime_watch_tv_02=Trim(new_game_tv_season_02_02,10532,10591) #60
new_game_tv_season_02_02_hifumi_excited_and_hajime_hold_chocolate=Trim(new_game_tv_season_02_02,12074,12156) #83
new_game_tv_season_02_02_pencil=Trim(new_game_tv_season_02_02,14649,14750) #102
new_game_tv_season_02_02_eraser=Trim(new_game_tv_season_02_02,14751,14858) #108
new_game_tv_season_02_02_aoba_act_as_pencil_and_eraser=Trim(new_game_tv_season_02_02,14859,15122) #264
new_game_tv_season_02_02_aoba_s_legs=Trim(new_game_tv_season_02_02,15463,15630) #168 op
new_game_tv_season_02_02_aoba_get_idea=Trim(new_game_tv_season_02_02,15715,15807) #93
new_game_tv_season_02_02_kou_see_kuma_character=Trim(new_game_tv_season_02_02,19072,19204) #133
new_game_tv_season_02_02_aoba_thinking=Trim(new_game_tv_season_02_02,20345,20440) #96
new_game_tv_season_02_02_aoba_cry_01=Trim(new_game_tv_season_02_02,24545,24700) #156
new_game_tv_season_02_02_aoba_cry_02=Trim(new_game_tv_season_02_02,24785,24928) #144
new_game_tv_season_02_02_kou_and_rin_talking_on_roof=Trim(new_game_tv_season_02_02,27089,27262) #174
new_game_tv_season_02_02_aoba_s_eye_is_shining=Trim(new_game_tv_season_02_02,29353,29472) #120
new_game_tv_season_02_02_aoba_and_kou_high_five_01=Trim(new_game_tv_season_02_02,31921,32007) #87
new_game_tv_season_02_02_aoba_and_kou_high_five_02=Trim(new_game_tv_season_02_02,32008,32127) #120 op

new_game_tv_season_02_03_hifumi_try_different_clothes=Trim(new_game_tv_season_02_03,322,673) #352 op
new_game_tv_season_02_03_hifumi_nervous_and_go_away=Trim(new_game_tv_season_02_03,1145,1226) #82
new_game_tv_season_02_03_aoba_make_hifumi_have_question=Trim(new_game_tv_season_02_03,5145,5336) #192
new_game_tv_season_02_03_aoba_and_hifumi_eat_pasta_with_crab=Trim(new_game_tv_season_02_03,10960,11144) #185
new_game_tv_season_02_03_hifumi_make_aoba_frustrated=Trim(new_game_tv_season_02_03,13211,13429) #219
new_game_tv_season_02_03_kou_yun_aoba_see_hifumi_sleeping=Trim(new_game_tv_season_02_03,14332,14414) #83
new_game_tv_season_02_03_hifumi_want_to_sleeping=Trim(new_game_tv_season_02_03,14415,14596) #182
new_game_tv_season_02_03_nene_write_program_in_library=Trim(new_game_tv_season_02_03,14885,14943) #59
new_game_tv_season_02_03_nene_quest_program_error=Trim(new_game_tv_season_02_03,15043,15088) #46
new_game_tv_season_02_03_nene_frustrated=Trim(new_game_tv_season_02_03,15089,15147) #59
new_game_tv_season_02_03_peco_program_error=Trim(new_game_tv_season_02_03,15426,15472) #47
new_game_tv_season_02_03_umiko_frustrated=Trim(new_game_tv_season_02_03,15473,15539) #67
new_game_tv_season_02_03_nene_read_cpp_programming_tutorial_book=Trim(new_game_tv_season_02_03,15540,15617) #78
new_game_tv_season_02_03_nene_typing=Trim(new_game_tv_season_02_03,15618,15683) #66
new_game_tv_season_02_03_umiko_typing_01=Trim(new_game_tv_season_02_03,15896,15945) #50
new_game_tv_season_02_03_fire_effect=Trim(new_game_tv_season_02_03,15957,16014) #58
new_game_tv_season_02_03_peco_on_fire=Trim(new_game_tv_season_02_03,16087,16194) #108
new_game_tv_season_02_03_shizuku_make_umiko_angry=Trim(new_game_tv_season_02_03,17948,18085) #138
new_game_tv_season_02_03_umiko_typing_02=Trim(new_game_tv_season_02_03,18356,18494) #139
new_game_tv_season_02_03_huge_fire_effect=Trim(new_game_tv_season_02_03,18513,18652) #140 op
new_game_tv_season_02_03_cpp_programming_tutorial_book=Trim(new_game_tv_season_02_03,18776,18828) #53
new_game_tv_season_02_03_umiko_say_nene_s_program_good=Trim(new_game_tv_season_02_03,19098,19256) #159
new_game_tv_season_02_03_umiko_say_nene_s_program_bad=Trim(new_game_tv_season_02_03,19257,19393) #137
new_game_tv_season_02_03_umiko_see_shizuku_love_01=Trim(new_game_tv_season_02_03,22571,22661) #91
new_game_tv_season_02_03_umiko_see_shizuku_love_02=Trim(new_game_tv_season_02_03,23406,23621) #216
new_game_tv_season_02_03_umiko_flick_shizuku_s_forehead=Trim(new_game_tv_season_02_03,24187,24359) #173
new_game_tv_season_02_03_shizuku_is_hitted_and_lie_down=Trim(new_game_tv_season_02_03,24360,24425) #66 op
new_game_tv_season_02_03_shizuku_tear_for_forehead_hurt=Trim(new_game_tv_season_02_03,24665,24697) #33
new_game_tv_season_02_03_shizuku_forehead_hurt=Trim(new_game_tv_season_02_03,24791,24957) #167
new_game_tv_season_02_03_hifumi_give_food_to_shizuku=Trim(new_game_tv_season_02_03,25661,25798) #138
new_game_tv_season_02_03_shizuku_feed_umiko=Trim(new_game_tv_season_02_03,27653,27715) #63
new_game_tv_season_02_03_umiko_make_everyone_shock=Trim(new_game_tv_season_02_03,28306,28427) #122
new_game_tv_season_02_03_nene_say_one_more_thing=Trim(new_game_tv_season_02_03,29204,29238) #35
new_game_tv_season_02_03_nene_move_her_legs=Trim(new_game_tv_season_02_03,31534,31838) #305 op
new_game_tv_season_02_03_nene_proud=Trim(new_game_tv_season_02_03,32002,32126) #125

new_game_tv_season_02_04_hajime_moody_01=Trim(new_game_tv_season_02_04,3569,3683) #115
new_game_tv_season_02_04_hajime_moody_02=Trim(new_game_tv_season_02_04,4308,4403) #96
new_game_tv_season_02_04_hajime_hug_yun=Trim(new_game_tv_season_02_04,8637,8714) #78
new_game_tv_season_02_04_yun_and_yun_s_brother_see_hajime_lift_up_yun_s_sister=Trim(new_game_tv_season_02_04,9154,9298) #145 op
new_game_tv_season_02_04_moon_ranger_singing_01=Trim(new_game_tv_season_02_04,10566,10633) #68
new_game_tv_season_02_04_moon_ranger_singing_02=Trim(new_game_tv_season_02_04,10700,10812) #113
new_game_tv_season_02_04_hifumi_prepare_support_suit_01=Trim(new_game_tv_season_02_04,11838,11869) #32
new_game_tv_season_02_04_hifumi_prepare_support_suit_02=Trim(new_game_tv_season_02_04,11870,11896) #27
new_game_tv_season_02_04_hifumi_prepare_support_suit_03=Trim(new_game_tv_season_02_04,11897,11920) #24
new_game_tv_season_02_04_hifumi_prepare_support_suit_04=Trim(new_game_tv_season_02_04,11921,12040) #120 op
new_game_tv_season_02_04_hajime_close_to_yun=Trim(new_game_tv_season_02_04,12977,13119) #143
new_game_tv_season_02_04_hifumi_nene_aoba_mega_ryuushi_requiem_shoot=Trim(new_game_tv_season_02_04,13257,13304) #48 candidate
new_game_tv_season_02_04_kou_s_hair_is_moving=Trim(new_game_tv_season_02_04,14724,14900) #177
new_game_tv_season_02_04_hifumi_smile=Trim(new_game_tv_season_02_04,16473,16613) #141
new_game_tv_season_02_04_rin_shock=Trim(new_game_tv_season_02_04,16831,16887) #57
new_game_tv_season_02_04_rin_nervous=Trim(new_game_tv_season_02_04,17128,17313) #186
new_game_tv_season_02_04_hifumi_feel_bad=Trim(new_game_tv_season_02_04,17753,17962) #210
new_game_tv_season_02_04_hifumi_talk_with_kou_and_rin_happy_than_moody=Trim(new_game_tv_season_02_04,18692,18915) #224
new_game_tv_season_02_04_hifumi_thankful=Trim(new_game_tv_season_02_04,20410,20517) #108 candidate
new_game_tv_season_02_04_hifumi_want_to_sleep_and_called_by_umiko=Trim(new_game_tv_season_02_04,20661,20973) #313
new_game_tv_season_02_04_hifumi_moody=Trim(new_game_tv_season_02_04,21595,21721) #127
new_game_tv_season_02_04_peco_story_01=Trim(new_game_tv_season_02_04,22016,22105) #90
new_game_tv_season_02_04_peco_story_02=Trim(new_game_tv_season_02_04,22202,22261) #60 op
new_game_tv_season_02_04_peco_story_03=Trim(new_game_tv_season_02_04,22262,22285) #24 op
new_game_tv_season_02_04_peco_story_04=Trim(new_game_tv_season_02_04,22286,22410) #125
new_game_tv_season_02_04_peco_story_05=Trim(new_game_tv_season_02_04,22411,22529) #119
new_game_tv_season_02_04_peco_game_play=Trim(new_game_tv_season_02_04,22554,22673) #120
new_game_tv_season_02_04_hajime_disappointed_move_tank=Trim(new_game_tv_season_02_04,24027,24107) #81 op
new_game_tv_season_02_04_aoba_encourage_disappointed_hajime=Trim(new_game_tv_season_02_04,24108,24311) #204
new_game_tv_season_02_04_umiko_angry=Trim(new_game_tv_season_02_04,25744,25861) #118
new_game_tv_season_02_04_hifumi_s_legs=Trim(new_game_tv_season_02_04,27863,27994) #132
new_game_tv_season_02_04_umiko_angrily_catch_shizuku_s_arms=Trim(new_game_tv_season_02_04,30222,30327) #106
new_game_tv_season_02_04_hifumi_nervous=Trim(new_game_tv_season_02_04,30754,30831) #78

new_game_tv_season_02_05_hifumi_make_a_fist=Trim(new_game_tv_season_02_05,600,718) #119
new_game_tv_season_02_05_hifumi_nervous_and_ask_yun=Trim(new_game_tv_season_02_05,851,911) #61
new_game_tv_season_02_05_hifumi_frustrated=Trim(new_game_tv_season_02_05,6370,6482) #113
new_game_tv_season_02_05_hifumi_cry=Trim(new_game_tv_season_02_05,6483,6566) #84
new_game_tv_season_02_05_aoba_see_yun_moody=Trim(new_game_tv_season_02_05,6567,6800) #234
new_game_tv_season_02_05_yun_and_hajime_moody=Trim(new_game_tv_season_02_05,7229,7298) #70
new_game_tv_season_02_05_yun_cut_vegetables=Trim(new_game_tv_season_02_05,8232,8321) #90 op
new_game_tv_season_02_05_hifumi_punish_yun_01=Trim(new_game_tv_season_02_05,11348,11443) #96
new_game_tv_season_02_05_hifumi_punish_yun_02=Trim(new_game_tv_season_02_05,11444,11502) #59
new_game_tv_season_02_05_hifumi_punish_yun_03=Trim(new_game_tv_season_02_05,11503,11514) #12
new_game_tv_season_02_05_hifumi_punish_yun_04=Trim(new_game_tv_season_02_05,11515,11743) #229 op
new_game_tv_season_02_05_aoba_see_hifumi_and_yun_nervous=Trim(new_game_tv_season_02_05,11854,11973) #120
new_game_tv_season_02_05_aoba_yun_hajime_discuss_character_ability_01=Trim(new_game_tv_season_02_05,14316,14533) #218
new_game_tv_season_02_05_aoba_yun_hajime_discuss_character_ability_02=Trim(new_game_tv_season_02_05,14534,14640) #107 op
new_game_tv_season_02_05_aoba_yun_hajime_discuss_character_ability_03=Trim(new_game_tv_season_02_05,15401,15519) #119
new_game_tv_season_02_05_peco_as_fish=Trim(new_game_tv_season_02_05,16199,16283) #85
new_game_tv_season_02_05_peco_drown=Trim(new_game_tv_season_02_05,16412,16693) #282
new_game_tv_season_02_05_aoba_beg=Trim(new_game_tv_season_02_05,18126,18191) #66
new_game_tv_season_02_05_hifumi_forgive=Trim(new_game_tv_season_02_05,18192,18245) #54
new_game_tv_season_02_05_queen_angry=Trim(new_game_tv_season_02_05,22193,22471) #279
new_game_tv_season_02_05_queen_command_kuma_to_catch_peco=Trim(new_game_tv_season_02_05,22472,22579) #108
new_game_tv_season_02_05_yun_hifumi_aoba_hajime_working=Trim(new_game_tv_season_02_05,24337,24450) #114
new_game_tv_season_02_05_aoba_happy=Trim(new_game_tv_season_02_05,24701,24736) #36
new_game_tv_season_02_05_nene_aoba_hotaru_graduate_photo=Trim(new_game_tv_season_02_05,25975,26079) #105 op
new_game_tv_season_02_05_hotaru_kiss_aoba_photo=Trim(new_game_tv_season_02_05,26188,26255) #68
new_game_tv_season_02_05_hotaru_kiss_aoba=Trim(new_game_tv_season_02_05,26724,26771) #48
new_game_tv_season_02_05_hotaru_kiss_nene=Trim(new_game_tv_season_02_05,26980,27021) #42
new_game_tv_season_02_05_demon_aoba_catch_hotaru_s_breast_01=Trim(new_game_tv_season_02_05,27346,27462) #117
new_game_tv_season_02_05_demon_aoba_catch_hotaru_s_breast_02=Trim(new_game_tv_season_02_05,27463,27522) #60
new_game_tv_season_02_05_nene_catch_aoba_s_breast=Trim(new_game_tv_season_02_05,28145,28156) #12
new_game_tv_season_02_05_hotaru_dizzy=Trim(new_game_tv_season_02_05,28288,28383) #96 candidate
new_game_tv_season_02_05_aoba_talk_near_window=Trim(new_game_tv_season_02_05,29628,29725) #98
new_game_tv_season_02_05_aoba_see_outside_near_window=Trim(new_game_tv_season_02_05,29768,29946) #179

new_game_tv_season_02_06_hajime_punch=Trim(new_game_tv_season_02_06,707,847) #141
new_game_tv_season_02_06_hajime_carry_boxing_glove=Trim(new_game_tv_season_02_06,1552,1816) #265
new_game_tv_season_02_06_peco_advertisement_01=Trim(new_game_tv_season_02_06,2611,2632) #22 candidate
new_game_tv_season_02_06_peco_advertisement_02=Trim(new_game_tv_season_02_06,2633,2659) #27
new_game_tv_season_02_06_peco_advertisement_03=Trim(new_game_tv_season_02_06,2660,2692) #33
new_game_tv_season_02_06_nene_lie_on_bed=Trim(new_game_tv_season_02_06,3387,3613) #227
new_game_tv_season_02_06_nene_tell_to_hotaru_then_aoba_appear_in_back_of_nene=Trim(new_game_tv_season_02_06,4431,4586) #156
new_game_tv_season_02_06_nene_aoba_hotaru_in_cafe_restaurant=Trim(new_game_tv_season_02_06,4670,4849) #180 op
new_game_tv_season_02_06_aoba_and_hotaru_see_nene_conceal_something=Trim(new_game_tv_season_02_06,4850,4974) #125
new_game_tv_season_02_06_aoba_and_hotaru_see_nene_eat_quickly=Trim(new_game_tv_season_02_06,5394,5508) #114
new_game_tv_season_02_06_hotaru_and_nene_send_message=Trim(new_game_tv_season_02_06,5605,5825) #221
new_game_tv_season_02_06_hotaru_laugh_to_nene=Trim(new_game_tv_season_02_06,6276,6396) #121
new_game_tv_season_02_06_hotaru_and_aoba_play_game=Trim(new_game_tv_season_02_06,9642,9808) #167
new_game_tv_season_02_06_nene_aoba_hotaru_succeeded=Trim(new_game_tv_season_02_06,10002,10059) #58 op
new_game_tv_season_02_06_peco_merchandise=Trim(new_game_tv_season_02_06,12438,12510) #73 op
new_game_tv_season_02_06_yun_see_hajime_punch=Trim(new_game_tv_season_02_06,13537,13685) #149
new_game_tv_season_02_06_yun_show_teapot=Trim(new_game_tv_season_02_06,14375,14530) #156
new_game_tv_season_02_06_hifumi_bring_pancake=Trim(new_game_tv_season_02_06,14531,14662) #132
new_game_tv_season_02_06_peco_design_illustration=Trim(new_game_tv_season_02_06,20564,20707) #144
new_game_tv_season_02_06_aoba_draw_peco_illustration=Trim(new_game_tv_season_02_06,25131,25400) #270 op
new_game_tv_season_02_06_kou_s_peco_illustration=Trim(new_game_tv_season_02_06,29215,29400) #186

new_game_tv_season_02_07_nene_s_legs_01=Trim(new_game_tv_season_02_07,724,781) #58
new_game_tv_season_02_07_nene_s_legs_02=Trim(new_game_tv_season_02_07,4164,4274) #111 op
new_game_tv_season_02_07_nene_fall_into_trap_and_killed_by_umiko=Trim(new_game_tv_season_02_07,5793,6066) #274 ed
new_game_tv_season_02_07_nene_make_a_fist=Trim(new_game_tv_season_02_07,7134,7315) #182
new_game_tv_season_02_07_nene_ganbarimasu=Trim(new_game_tv_season_02_07,9898,10095) #198
new_game_tv_season_02_07_shizuku_and_wako_drink_beer=Trim(new_game_tv_season_02_07,12253,12474) #222
new_game_tv_season_02_07_cat=Trim(new_game_tv_season_02_07,15192,15240) #49
new_game_tv_season_02_07_aoba_hifumi_hajime_yun_see_wako_nervous=Trim(new_game_tv_season_02_07,16949,17029) #81
new_game_tv_season_02_07_wako_nervous=Trim(new_game_tv_season_02_07,17030,17060) #31 op
new_game_tv_season_02_07_aoba_open_arms=Trim(new_game_tv_season_02_07,21300,21413) #114
new_game_tv_season_02_07_hifumi_kindy=Trim(new_game_tv_season_02_07,22112,22183) #72
new_game_tv_season_02_07_hifumi_see_aoba_and_excited=Trim(new_game_tv_season_02_07,22184,22339) #156
new_game_tv_season_02_07_momiji_say_baka_poi=Trim(new_game_tv_season_02_07,22934,22981) #48 op
new_game_tv_season_02_07_momiji_suppose_aoba_s_suit_is_school_uniform=Trim(new_game_tv_season_02_07,24810,24965) #156
new_game_tv_season_02_07_momiji_see_aoba_s_peco_illustration=Trim(new_game_tv_season_02_07,26127,26276) #150 op
new_game_tv_season_02_07_momiji_see_aoba_shining=Trim(new_game_tv_season_02_07,27624,27725) #102
new_game_tv_season_02_07_momiji_with_fire_surrounding=Trim(new_game_tv_season_02_07,30050,30163) #114
new_game_tv_season_02_07_aoba_see_momiji_endure_and_pushed_by_tsubame=Trim(new_game_tv_season_02_07,30401,30555) #155

new_game_tv_season_02_08_aoba_cosplay_maid_01=Trim(new_game_tv_season_02_08,6242,6263) #22
new_game_tv_season_02_08_aoba_cosplay_maid_02=Trim(new_game_tv_season_02_08,6264,6290) #27
new_game_tv_season_02_08_aoba_cosplay_maid_03=Trim(new_game_tv_season_02_08,6291,6319) #29
new_game_tv_season_02_08_aoba_cosplay_maid_04=Trim(new_game_tv_season_02_08,6320,6430) #111
new_game_tv_season_02_08_aoba_maid_nyan=Trim(new_game_tv_season_02_08,7222,7341) #120
new_game_tv_season_02_08_aoba_apply_magic_to_tea=Trim(new_game_tv_season_02_08,7942,8044) #103
new_game_tv_season_02_08_aoba_moe_moe_kyun=Trim(new_game_tv_season_02_08,8330,8485) #156 op
new_game_tv_season_02_08_hifumi_despise=Trim(new_game_tv_season_02_08,9273,9313) #41 op
new_game_tv_season_02_08_momiji_cosplay_maid=Trim(new_game_tv_season_02_08,10255,10350) #96
new_game_tv_season_02_08_aoba_feel_delicious=Trim(new_game_tv_season_02_08,12212,12315) #104
new_game_tv_season_02_08_rin_wako_shizuku_pick_casting_voice_01=Trim(new_game_tv_season_02_08,16603,16780) #178 op
new_game_tv_season_02_08_rin_wako_shizuku_pick_casting_voice_02=Trim(new_game_tv_season_02_08,16781,16999) #219
new_game_tv_season_02_08_momiji_show_onigiri=Trim(new_game_tv_season_02_08,20007,20169) #163
new_game_tv_season_02_08_aoba_eat_onigiri=Trim(new_game_tv_season_02_08,20602,20792) #191
new_game_tv_season_02_08_hifumi_nervous_and_jumping=Trim(new_game_tv_season_02_08,24264,24485) #222 op
new_game_tv_season_02_08_tsubame_show_handmade_food=Trim(new_game_tv_season_02_08,25900,25964) #65
new_game_tv_season_02_08_hifumi_catch_cat=Trim(new_game_tv_season_02_08,28871,28967) #97
new_game_tv_season_02_08_aoba_and_momiji_walking_along_street=Trim(new_game_tv_season_02_08,30217,30319) #103
new_game_tv_season_02_08_hifumi_nervous=Trim(new_game_tv_season_02_08,31930,32001) #72

new_game_tv_season_02_09_insect_five_fight_against_bad_guy=Trim(new_game_tv_season_02_09,431,517) #87
new_game_tv_season_02_09_yun_see_hajime_explain_to_aki=Trim(new_game_tv_season_02_09,5042,5240) #199
new_game_tv_season_02_09_hajime_show_her_photo=Trim(new_game_tv_season_02_09,8416,8509) #94
new_game_tv_season_02_09_yun_watch_hajime_questioningly=Trim(new_game_tv_season_02_09,9655,9789) #135
new_game_tv_season_02_09_yun_become_fashioner=Trim(new_game_tv_season_02_09,10284,10517) #234
new_game_tv_season_02_09_yun_punch_hajime=Trim(new_game_tv_season_02_09,10758,10924) #167
new_game_tv_season_02_09_hajime_long_hair=Trim(new_game_tv_season_02_09,14013,14120) #108
new_game_tv_season_02_09_hajime_and_yun_refute_aoba=Trim(new_game_tv_season_02_09,14824,14936) #113
new_game_tv_season_02_09_rhythm_game=Trim(new_game_tv_season_02_09,15338,15570) #233
new_game_tv_season_02_09_tsubame_see_momiji_painting=Trim(new_game_tv_season_02_09,18366,18434) #69 op
new_game_tv_season_02_09_nene_shock=Trim(new_game_tv_season_02_09,21330,21419) #90
new_game_tv_season_02_09_umiko_praise_nene=Trim(new_game_tv_season_02_09,22544,22687) #144
new_game_tv_season_02_09_momiji_naked=Trim(new_game_tv_season_02_09,24598,24679) #82 op
new_game_tv_season_02_09_tsubame_blame_naked_momiji=Trim(new_game_tv_season_02_09,24708,24786) #79
new_game_tv_season_02_09_momiji_lie=Trim(new_game_tv_season_02_09,27297,27383) #87 op
new_game_tv_season_02_09_momiji_and_tsubame_scared=Trim(new_game_tv_season_02_09,28905,28955) #51
new_game_tv_season_02_09_momiji_and_tsubame_shock=Trim(new_game_tv_season_02_09,29351,29458) #108
new_game_tv_season_02_09_momiji_touch_hair=Trim(new_game_tv_season_02_09,31990,32127) #138

new_game_tv_season_02_10_peco_mini_game_play=Trim(new_game_tv_season_02_10,300,507) #208 candidate
new_game_tv_season_02_10_tsubame_happy=Trim(new_game_tv_season_02_10,651,719) #69
new_game_tv_season_02_10_hajime_thinking_and_get_idea=Trim(new_game_tv_season_02_10,3736,3969) #234
new_game_tv_season_02_10_hajime_take_papers_and_pen=Trim(new_game_tv_season_02_10,5452,5493) #42
new_game_tv_season_02_10_hajime_see_momiji_and_tsubame_quarrel=Trim(new_game_tv_season_02_10,7376,7484) #109
new_game_tv_season_02_10_nene_see_ball_jumping_across_maze=Trim(new_game_tv_season_02_10,9119,9160) #42
new_game_tv_season_02_10_tsubame_scared_by_umiko=Trim(new_game_tv_season_02_10,9161,9259) #99
new_game_tv_season_02_10_umiko_introduce_survival_game_to_tsubame=Trim(new_game_tv_season_02_10,9732,9926) #195
new_game_tv_season_02_10_programmers_busying=Trim(new_game_tv_season_02_10,13717,13818) #102
new_game_tv_season_02_10_nene_walking=Trim(new_game_tv_season_02_10,14380,14483) #104
new_game_tv_season_02_10_tsubame_see_fish_broken=Trim(new_game_tv_season_02_10,15726,15797) #72
new_game_tv_season_02_10_nene_moving_finger_01=Trim(new_game_tv_season_02_10,16384,16632) #249 op
new_game_tv_season_02_10_nene_moving_finger_02=Trim(new_game_tv_season_02_10,16633,16805) #173 op
new_game_tv_season_02_10_tsubame_see_nene_jumping=Trim(new_game_tv_season_02_10,17334,17504) #171
new_game_tv_season_02_10_nene_fall_backward=Trim(new_game_tv_season_02_10,17730,17772) #43
new_game_tv_season_02_10_umiko_hold_nene_s_chair=Trim(new_game_tv_season_02_10,17773,17863) #91
new_game_tv_season_02_10_nene_fall_backward=Trim(new_game_tv_season_02_10,19965,20079) #115
new_game_tv_season_02_10_kou_see_sunset=Trim(new_game_tv_season_02_10,21704,21823) #120
new_game_tv_season_02_10_hajime_give_sword_to_yun=Trim(new_game_tv_season_02_10,23403,23476) #74
new_game_tv_season_02_10_aoba_and_nene_walking_along_street=Trim(new_game_tv_season_02_10,24998,25141) #144
new_game_tv_season_02_10_hajime_play_with_yun_s_sister_and_brother=Trim(new_game_tv_season_02_10,25702,25810) #109 op
new_game_tv_season_02_10_rin_and_kou_eating=Trim(new_game_tv_season_02_10,26832,27005) #174 op
new_game_tv_season_02_10_rin_s_new_watch=Trim(new_game_tv_season_02_10,29849,29906) #58
new_game_tv_season_02_10_kou_show_pantie=Trim(new_game_tv_season_02_10,31826,31891) #66

new_game_tv_season_02_11_tsubame_happy=Trim(new_game_tv_season_02_11,215,272) #58
new_game_tv_season_02_11_nene_angry=Trim(new_game_tv_season_02_11,701,791) #91 op
new_game_tv_season_02_11_tsubame_shock_01=Trim(new_game_tv_season_02_11,3516,3536) #21
new_game_tv_season_02_11_tsubame_shock_02=Trim(new_game_tv_season_02_11,3537,3644) #108
new_game_tv_season_02_11_nene_shock=Trim(new_game_tv_season_02_11,4078,4154) #77
new_game_tv_season_02_11_kou_doubt_that_umiko_blame_nene=Trim(new_game_tv_season_02_11,5490,5585) #96
new_game_tv_season_02_11_cat_eat_momiji_s_hand=Trim(new_game_tv_season_02_11,6829,7092) #264
new_game_tv_season_02_11_momiji_nervous=Trim(new_game_tv_season_02_11,7522,7625) #104
new_game_tv_season_02_11_kou_blame_momiji=Trim(new_game_tv_season_02_11,8769,8923) #155
new_game_tv_season_02_11_kou_and_momiji_see_nene_happy=Trim(new_game_tv_season_02_11,11058,11171) #114
new_game_tv_season_02_11_umiko_say_nene_idling=Trim(new_game_tv_season_02_11,11172,11267) #96
new_game_tv_season_02_11_nene_hold_tsubame_s_hand=Trim(new_game_tv_season_02_11,14892,15047) #156
new_game_tv_season_02_11_momiji_and_aoba_bring_donuts_for_tsubame_and_nene=Trim(new_game_tv_season_02_11,17622,17741) #120 op
new_game_tv_season_02_11_nene_is_sleep_talking=Trim(new_game_tv_season_02_11,18426,18491) #66
new_game_tv_season_02_11_nene_wake_up_and_hear_umiko_confirmed=Trim(new_game_tv_season_02_11,18492,18767) #276
new_game_tv_season_02_11_nene_happy=Trim(new_game_tv_season_02_11,18768,18816) #49
new_game_tv_season_02_11_nene_hug_tsubame=Trim(new_game_tv_season_02_11,19201,19355) #155
new_game_tv_season_02_11_nene_and_tsubame_succeeded=Trim(new_game_tv_season_02_11,20612,20767) #156 op
new_game_tv_season_02_11_rin_sad=Trim(new_game_tv_season_02_11,21752,22208) #457
new_game_tv_season_02_11_tsubame_as_cat=Trim(new_game_tv_season_02_11,22800,22888) #89
new_game_tv_season_02_11_nene_as_dog=Trim(new_game_tv_season_02_11,22889,22960) #72
new_game_tv_season_02_11_kou_call_momiji_near_her_ear=Trim(new_game_tv_season_02_11,25755,25824) #70
new_game_tv_season_02_11_kou_catch_aoba_and_momiji_s_hand_then_raise_hand=Trim(new_game_tv_season_02_11,26976,27047) #72
new_game_tv_season_02_11_aoba_and_momiji_nervous=Trim(new_game_tv_season_02_11,27546,27698) #153
new_game_tv_season_02_11_peco_game_play_01=Trim(new_game_tv_season_02_11,28507,28674) #168 op
new_game_tv_season_02_11_peco_game_play_02=Trim(new_game_tv_season_02_11,28891,29112) #222
new_game_tv_season_02_11_peco_game_play_03=Trim(new_game_tv_season_02_11,29827,30042) #216
new_game_tv_season_02_11_kou_see_aoba_and_momiji_quarrel=Trim(new_game_tv_season_02_11,31567,31650) #84
new_game_tv_season_02_11_rin_catch_her_hand=Trim(new_game_tv_season_02_11,31806,32091) #286 op

new_game_tv_season_02_12_peco_announcement_before=Trim(new_game_tv_season_02_12,2880,2943) #64
new_game_tv_season_02_12_peco_announcement=Trim(new_game_tv_season_02_12,4866,4908) #43
new_game_tv_season_02_12_kou_watch_toward_aoba=Trim(new_game_tv_season_02_12,6443,6520) #78
new_game_tv_season_02_12_aoba_s_eye_is_shining=Trim(new_game_tv_season_02_12,6521,6567) #47
new_game_tv_season_02_12_kou_reach_hand=Trim(new_game_tv_season_02_12,6568,6621) #54
new_game_tv_season_02_12_kou_introduce_aoba=Trim(new_game_tv_season_02_12,6622,6729) #108 op
new_game_tv_season_02_12_rin_kindy=Trim(new_game_tv_season_02_12,8205,8251) #47
new_game_tv_season_02_12_social_drinking=Trim(new_game_tv_season_02_12,11155,11392) #238
new_game_tv_season_02_12_shizuku_shake_wako=Trim(new_game_tv_season_02_12,12377,12455) #79
new_game_tv_season_02_12_shizuku_shake_wako_and_nene_tsubame_feel_relieved=Trim(new_game_tv_season_02_12,12456,12532) #77
new_game_tv_season_02_12_shizuku_hug_wako_and_feel_excited=Trim(new_game_tv_season_02_12,12804,12971) #168
new_game_tv_season_02_12_rin_is_drunk=Trim(new_game_tv_season_02_12,13696,13814) #119
new_game_tv_season_02_12_rin_catch_kou=Trim(new_game_tv_season_02_12,14704,14810) #107 op
new_game_tv_season_02_12_kou_catch_rin_01=Trim(new_game_tv_season_02_12,15688,15732) #45
new_game_tv_season_02_12_kou_catch_rin_02=Trim(new_game_tv_season_02_12,15733,15840) #108
new_game_tv_season_02_12_aoba_hug_cat_and_cry=Trim(new_game_tv_season_02_12,18250,18296) #47
new_game_tv_season_02_12_aoba_imagine_pantie=Trim(new_game_tv_season_02_12,20318,20508) #191
new_game_tv_season_02_12_aoba_pull_momiji=Trim(new_game_tv_season_02_12,22784,22931) #148
new_game_tv_season_02_12_kou_hug_aoba=Trim(new_game_tv_season_02_12,25374,25446) #73 op
new_game_tv_season_02_12_kou_see_everyone=Trim(new_game_tv_season_02_12,28500,28631) #132
new_game_tv_season_02_12_kou_say_goodbye_to_everyone_01=Trim(new_game_tv_season_02_12,28632,28684) #53
new_game_tv_season_02_12_kou_say_goodbye_to_everyone_02=Trim(new_game_tv_season_02_12,28685,28788) #104 op
new_game_tv_season_02_12_peco_open_sale_01=Trim(new_game_tv_season_02_12,33486,33530) #45
new_game_tv_season_02_12_peco_open_sale_02=Trim(new_game_tv_season_02_12,33531,33678) #148
new_game_tv_season_02_12_peco_package=Trim(new_game_tv_season_02_12,34752,34871) #120

new_game_tv_season_02_12_new_game_title=Trim(new_game_tv_season_02_12,34872,34955) #84 op
new_game_tv_season_02_12_new_game_title_fade_out=Trim(new_game_tv_season_02_12,34956,35005) #50
