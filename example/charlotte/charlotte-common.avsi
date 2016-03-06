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



######## TV (1920*1080) ########

charlotte_01=SSRC(FFMS2_VIDEO_SOURCE("src\anime\(2015Q3) Charlotte 第01話 「我他人を思う」 (Crunchyroll 1920x1080 x264 AAC).mp4"),48000)
charlotte_02=SSRC(FFMS2_VIDEO_SOURCE("src\anime\(2015Q3) Charlotte 第02話 「絶望の旋律」 (Crunchyroll 1920x1080 x264 AAC).mp4"),48000)
charlotte_03=SSRC(FFMS2_VIDEO_SOURCE("src\anime\(2015Q3) Charlotte 第03話 「恋と炎」 (Crunchyroll 1920x1080 x264 AAC).mp4"),48000)
charlotte_04=SSRC(FFMS2_VIDEO_SOURCE("src\anime\(2015Q3) Charlotte 第04話 「刹那の本気」 (Crunchyroll 1920x1080 x264 AAC).mp4"),48000)
charlotte_05=SSRC(FFMS2_VIDEO_SOURCE("src\anime\(2015Q3) Charlotte 第05話 「いつか聴いた音」 (Crunchyroll 1920x1080 x264 AAC).mp4"),48000)
charlotte_06=SSRC(FFMS2_VIDEO_SOURCE("src\anime\(2015Q3) Charlotte 第06話 「気づかなかった幸せ」 (Crunchyroll 1920x1080 x264 AAC).mp4"),48000)
charlotte_07=SSRC(FFMS2_VIDEO_SOURCE("src\anime\(2015Q3) Charlotte 第07話 「逃避行の果てに」 (Crunchyroll 1920x1080 x264 AAC).mp4"),48000)
charlotte_08=SSRC(FFMS2_VIDEO_SOURCE("src\anime\(2015Q3) Charlotte 第08話 「邂逅」 (Crunchyroll 1920x1080 x264 AAC).mp4"),48000)
charlotte_09=SSRC(FFMS2_VIDEO_SOURCE("src\anime\(2015Q3) Charlotte 第09話 「ここにない世界」 (Crunchyroll 1920x1080 x264 AAC).mp4"),48000)
charlotte_10=SSRC(FFMS2_VIDEO_SOURCE("src\anime\(2015Q3) Charlotte 第10話 「略奪」 (Crunchyroll 1920x1080 x264 AAC).mp4"),48000)
charlotte_11=SSRC(FFMS2_VIDEO_SOURCE("src\anime\(2015Q3) Charlotte 第11話 「シャーロット」 (Crunchyroll 1920x1080 x264 AAC).mp4"),48000)
charlotte_12=SSRC(FFMS2_VIDEO_SOURCE("src\anime\(2015Q3) Charlotte 第12話 「約束」 (Crunchyroll 1920x1080 x264 AAC).mp4"),48000)
charlotte_13=SSRC(FFMS2_VIDEO_SOURCE("src\anime\(2015Q3) Charlotte 第13話 「これからの記録」 (Crunchyroll 1920x1080 x264 AAC).mp4"),48000)

charlotte_clean_op=Trim(charlotte_13,361,2518)
charlotte_clean_ed=Trim(charlotte_11,32368,34524)

######## Trim ########

charlotte_clean_op_01=Trim(charlotte_clean_op,0,1160)
charlotte_clean_op_02=Trim(charlotte_clean_op,1161,1468)
charlotte_clean_op_03=Trim(charlotte_clean_op,1469,2004)
charlotte_clean_op_04=Trim(charlotte_clean_op,2005,0)



#charlotte_clean_ed_01=Trim(charlotte_clean_ed,0,0)



charlotte_01_yuu_on_cross_road=Trim(charlotte_01,561,692) #132
charlotte_01_yuu_see_comet=Trim(charlotte_01,1025,1116) #92
charlotte_01_yuu_laugh=Trim(charlotte_01,3231,3289) #59
charlotte_01_yuu_push_yumi_away=Trim(charlotte_01,8143,8249) #107 op
charlotte_01_yumi_talk_with_yuu=Trim(charlotte_01,9715,9947) #233
charlotte_01_mishima_laugh_like_a_cat=Trim(charlotte_01,9948,9992) #45 op spell
charlotte_01_key_coffee_01=Trim(charlotte_01,10554,10611) #58
charlotte_01_yumi_eat_sweet_pancake=Trim(charlotte_01,11344,11472) #129
charlotte_01_key_coffee_02=Trim(charlotte_01,11830,11982) #153 op
charlotte_01_nao_take_video_nearby_yuu=Trim(charlotte_01,14697,14724) #28
charlotte_01_yuu_run_away=Trim(charlotte_01,17117,17164) #48
charlotte_01_explosion_nearby_yuu=Trim(charlotte_01,17661,17697) #37
charlotte_01_joujirou_stand=Trim(charlotte_01,18166,18194) #29 op spell
charlotte_01_joujirou_push_glasses=Trim(charlotte_01,18195,18305) #111
charlotte_01_joujirou_ready_to_dash=Trim(charlotte_01,18306,18425) #120 op
charlotte_01_joujirou_dash_to_yuu=Trim(charlotte_01,18426,18509) #84
charlotte_01_joujirou_catch_yuu_in_air=Trim(charlotte_01,18567,18637) #71
charlotte_01_nao_kick_yuu=Trim(charlotte_01,20955,21114) #160 op
charlotte_01_ayumi_talk_with_yuu=Trim(charlotte_01,22623,22937) #315
charlotte_01_ayumi_show_omurice=Trim(charlotte_01,23549,23610) #62
charlotte_01_ayumi_watch_comet=Trim(charlotte_01,26235,26368) #134
charlotte_01_ayumi_exciting=Trim(charlotte_01,27273,27519) #247 op
charlotte_01_nao_call_frustrated_yuu=Trim(charlotte_01,30026,30122) #97
charlotte_01_yuu_open_carton=Trim(charlotte_01,31192,31290) #99
charlotte_01_nao_disappear_ahead_of_ayumi=Trim(charlotte_01,31593,31702) #110
charlotte_01_nao_appear_behind_ayumi=Trim(charlotte_01,31763,32005) #243
charlotte_01_ayumi_happy=Trim(charlotte_01,33877,34013) #137
charlotte_01_otosaka_family_pre=Trim(charlotte_01,34130,34158) #29
charlotte_01_otosaka_family=Trim(charlotte_01,34159,34265) #107 op

charlotte_02_nao_listen_music=Trim(charlotte_02,5422,5462) #41
charlotte_02_joujirou_dash_to_sandwitch=Trim(charlotte_02,7237,7338) #102 op
charlotte_02_joujirou_dash_across_school_restaurant=Trim(charlotte_02,7592,7654) #63
charlotte_02_joujirou_get_hurt=Trim(charlotte_02,7876,8014) #139
charlotte_02_student_association=Trim(charlotte_02,10261,10528) #268 op
charlotte_02_kumagami_walk_01=Trim(charlotte_02,10708,10756) #49
charlotte_02_kumagami_walk_02=Trim(charlotte_02,10757,10816) #60 op
charlotte_02_nao_and_yuu_chase_suspicious_student=Trim(charlotte_02,13286,13363) #78
charlotte_02_udou_shoot_toward_nao=Trim(charlotte_02,18177,18223) #47
charlotte_02_joujirou_catch_arrow=Trim(charlotte_02,18228,18277) #50
charlotte_02_nao_and_yuu_sit_on_train=Trim(charlotte_02,20771,20853) #83
charlotte_02_little_nao_happy=Trim(charlotte_02,21564,21611) #48
charlotte_02_nao_s_mother_smile=Trim(charlotte_02,21612,21776) #165 op
charlotte_02_nao_alone=Trim(charlotte_02,25732,25886) #155 op spell
charlotte_02_nao_and_kazuki_s_genie=Trim(charlotte_02,25918,26138) #221 op spell
charlotte_02_feather_around_nao=Trim(charlotte_02,28124,28225) #102
charlotte_02_nao_and_yuu_look_at_sea=Trim(charlotte_02,28599,28753) #155
charlotte_02_sunset=Trim(charlotte_02,29084,29173) #90
charlotte_02_ayumi_watch_comet_and_exciting=Trim(charlotte_02,31936,32271) #336

charlotte_03_school_restaurant=Trim(charlotte_03,4072,4172) #101
charlotte_03_joujirou_and_yuu_in_school_restaurant=Trim(charlotte_03,5294,5499) #206 op
charlotte_03_nao_chase_suspicious_person=Trim(charlotte_03,10460,10524) #65
charlotte_03_joujirou_and_yuu_chase_suspicious_person=Trim(charlotte_03,10618,10669) #52
charlotte_03_joujirou_hit_suspicious_person=Trim(charlotte_03,10753,10784) #32 op spell
charlotte_03_yuu_get_hurt=Trim(charlotte_03,10785,10842) #58
charlotte_03_nao_sit_up=Trim(charlotte_03,11145,11205) #61
charlotte_03_nao_kick_joujirou_01=Trim(charlotte_03,12830,13064) #235
charlotte_03_yusa_smile_01=Trim(charlotte_03,14792,14850) #59
charlotte_03_yusa_smile_02=Trim(charlotte_03,15700,15798) #99
charlotte_03_nao_kick_joujirou_02=Trim(charlotte_03,16202,16253) #52
charlotte_03_yusa_eat_marshmallow=Trim(charlotte_03,17313,17359) #47 op
charlotte_03_misa_possess_yusa_s_body=Trim(charlotte_03,18045,18115) #71
charlotte_03_misa_angry=Trim(charlotte_03,18297,18384) #88 op
charlotte_03_misa_use_fire_01=Trim(charlotte_03,18471,18513) #43
charlotte_03_fire_01=Trim(charlotte_03,18514,18541) #28
charlotte_03_misa_use_fire_02=Trim(charlotte_03,18542,18559) #18 op spell
charlotte_03_fire_02=Trim(charlotte_03,18560,18612) #53
charlotte_03_misa_stop_fire=Trim(charlotte_03,18808,18919) #112
charlotte_03_misa_show_fire_ability=Trim(charlotte_03,20580,20655) #76
charlotte_03_yusa_stand_ahead_of_car_and_people=Trim(charlotte_03,22981,23180) #200 op
charlotte_03_misa_use_fire_03=Trim(charlotte_03,23742,23794) #53
charlotte_03_misa_use_fire_on_kouta=Trim(charlotte_03,23795,23835) #41
charlotte_03_joujirou_hit_person=Trim(charlotte_03,24692,24706) #15
charlotte_03_nao_kick_producer=Trim(charlotte_03,24923,24945) #23
charlotte_03_shou_cry_ahead_of_misa=Trim(charlotte_03,28900,29006) #107 op
charlotte_03_ayumi_exciting=Trim(charlotte_03,31946,32017) #72

charlotte_04_yusa_appear=Trim(charlotte_04,4439,4620) #182 op
charlotte_04_yusa_nakanaori_01=Trim(charlotte_04,6757,6821) #65
charlotte_04_yusa_nakanaori_02=Trim(charlotte_04,6822,6843) #22
charlotte_04_yusa_nakanaori_03=Trim(charlotte_04,6844,6864) #21
charlotte_04_yusa_nakanaori_04=Trim(charlotte_04,6865,6885) #21
charlotte_04_yusa_nakanaori_05=Trim(charlotte_04,6886,6948) #63
charlotte_04_yusa_nakanaori_06=Trim(charlotte_04,6949,6978) #30 op spell
charlotte_04_yusa_shock=Trim(charlotte_04,9180,9258) #79
charlotte_04_nao_show_newspaper=Trim(charlotte_04,10593,10711) #119
charlotte_04_misa_use_fire=Trim(charlotte_04,14654,14788) #135
charlotte_04_misa_think_it_is_good=Trim(charlotte_04,16911,17072) #162
charlotte_04_nao_cheer_up=Trim(charlotte_04,17763,17904) #142 op
charlotte_04_throw_baseball=Trim(charlotte_04,18047,18136) #90
charlotte_04_yusa_reisei_in_baseball_field=Trim(charlotte_04,18858,18934) #77 op spell
charlotte_04_arifumi_control_baseball_01=Trim(charlotte_04,19322,19348) #27
charlotte_04_arifumi_control_baseball_02=Trim(charlotte_04,19349,19371) #23
charlotte_04_return_to_home_plate=Trim(charlotte_04,23085,23131) #47
charlotte_04_joujirou_run_toward_first_base_01=Trim(charlotte_04,24421,24464) #44
charlotte_04_joujirou_run_toward_first_base_02=Trim(charlotte_04,24465,24524) #60
charlotte_04_joujirou_almost_dead=Trim(charlotte_04,24804,24914) #111
charlotte_04_misa_prepare_to_hit_baseball=Trim(charlotte_04,24915,25038) #124 op
charlotte_04_misa_hit_baseball=Trim(charlotte_04,25102,25137) #36 op
charlotte_04_yuu_hit_baseball=Trim(charlotte_04,27183,27228) #46
charlotte_04_misa_run_toward_home_plate=Trim(charlotte_04,27731,27764) #34 op
charlotte_04_misa_touch_home_plate=Trim(charlotte_04,27778,27818) #41

charlotte_05_nao_ask_misa_to_cancel=Trim(charlotte_05,4470,4573) #104
charlotte_05_nao_show_book=Trim(charlotte_05,4771,4830) #60
charlotte_05_misa_catch_joujirou=Trim(charlotte_05,5798,6025) #228
charlotte_05_nao_and_yuu_buy_food=Trim(charlotte_05,6696,6841) #146
charlotte_05_yuu_suggest_nao_to_eat_vegetable=Trim(charlotte_05,7189,7360) #172
charlotte_05_yusa_smile_to_joujirou=Trim(charlotte_05,7361,7446) #86
charlotte_05_joujirou_feel_happy_while_with_yusa=Trim(charlotte_05,7512,7628) #117
charlotte_05_nao_yuu_joujirou_yusa_hiking=Trim(charlotte_05,8348,8451) #104
charlotte_05_nao_eat_corn=Trim(charlotte_05,10253,10291) #39
charlotte_05_yusa_feel_delicious=Trim(charlotte_05,10646,10717) #72
charlotte_05_nao_feel_delicious=Trim(charlotte_05,10917,10966) #50
charlotte_05_joujirou_feel_delicious=Trim(charlotte_05,10967,11044) #78
charlotte_05_misa_kick_joujiroua_and_play_game=Trim(charlotte_05,12504,12615) #112
charlotte_05_misa_play_game=Trim(charlotte_05,12616,12669) #54
charlotte_05_yuu_see_nao_alone=Trim(charlotte_05,13038,13091) #54
charlotte_05_yuu_listen_to_music_and_shock=Trim(charlotte_05,13827,13907) #81
charlotte_05_yuu_listen_to_music=Trim(charlotte_05,13908,13972) #65
charlotte_05_yuu_on_field_01=Trim(charlotte_05,13973,14062) #90 op
charlotte_05_yuu_on_field_02=Trim(charlotte_05,14063,14179) #117 op
charlotte_05_nao_punch_and_praise_yuu=Trim(charlotte_05,14260,14508) #249
charlotte_05_nao_and_yuu_see_night_scene=Trim(charlotte_05,14509,14865) #357 op
charlotte_05_nao_and_yuu_talking_in_forest=Trim(charlotte_05,15173,15427) #255 op
charlotte_05_yuu_dream_ayumi_and_shunsuke=Trim(charlotte_05,16192,16335) #144
charlotte_05_nao_fishing=Trim(charlotte_05,16761,16830) #70 op spell
charlotte_05_joujirou_give_fish_to_yusa=Trim(charlotte_05,17479,17621) #143
charlotte_05_yusa_and_nao_see_bucket=Trim(charlotte_05,18217,18324) #108
charlotte_05_joujirou_gachimuchi=Trim(charlotte_05,18974,19141) #168 op
charlotte_05_misa_in_bucket_01=Trim(charlotte_05,20848,20905) #58
charlotte_05_misa_in_bucket_02=Trim(charlotte_05,20906,20980) #75
charlotte_05_saitou_fly=Trim(charlotte_05,24519,24548) #30
charlotte_05_saitou_landing=Trim(charlotte_05,24647,24693) #47
charlotte_05_saitou_fly_high=Trim(charlotte_05,25352,25397) #46
charlotte_05_saitou_on_sky=Trim(charlotte_05,25510,25575) #66
charlotte_05_yuu_control_saitou_on_sky=Trim(charlotte_05,25692,25781) #90
charlotte_05_saitou_falling_01=Trim(charlotte_05,25839,25874) #36
charlotte_05_saitou_falling_02=Trim(charlotte_05,26040,26104) #65 op spell
charlotte_05_saitou_falling_03=Trim(charlotte_05,26105,26164) #60
charlotte_05_nao_see_camera_on_tree=Trim(charlotte_05,26583,26758) #176
charlotte_05_misa_use_fire=Trim(charlotte_05,27331,27426) #96
charlotte_05_saitou_see_sky=Trim(charlotte_05,27675,27840) #166
charlotte_05_yuu_eat_noodles_and_feel_delicious=Trim(charlotte_05,29074,29121) #48
charlotte_05_ayumi_sick=Trim(charlotte_05,31785,31853) #69

charlotte_06_nao_thinking=Trim(charlotte_06,4651,4777) #127
charlotte_06_nyusa_eating_and_thinking=Trim(charlotte_06,4778,4846) #69
charlotte_06_nao_turn_eyes=Trim(charlotte_06,4973,5000) #28
charlotte_06_nao_watch_yusa_eating=Trim(charlotte_06,5274,5415) #142
charlotte_06_nao_watch_yusa_then_turn_back=Trim(charlotte_06,5538,5720) #183
charlotte_06_yusa_eating=Trim(charlotte_06,5976,6071) #96
charlotte_06_nao_kick_joujirou_to_outside_01=Trim(charlotte_06,6547,6579) #33
charlotte_06_nao_kick_joujirou_to_outside_02=Trim(charlotte_06,6580,6622) #43 op
charlotte_06_nao_kick_joujirou_to_outside_03=Trim(charlotte_06,6623,6668) #46
charlotte_06_nao_yuu_yusa_walk_across_road=Trim(charlotte_06,7458,7581) #124
charlotte_06_yusa_not_happy=Trim(charlotte_06,7856,8010) #155
charlotte_06_oikawa_nomura_konishi_around_ayumi=Trim(charlotte_06,10986,11070) #85 op
charlotte_06_konishi_hate=Trim(charlotte_06,12120,12144) #25 op
charlotte_06_ayumi_suppose_nao_is_yuu_s_girlfriend=Trim(charlotte_06,12548,12764) #217
charlotte_06_nao_stop_ayumi_nose_bleed=Trim(charlotte_06,13029,13124) #96
charlotte_06_yusa_and_ayumi_happy=Trim(charlotte_06,14259,14365) #107
charlotte_06_ayumi_and_yusa_feel_delicious=Trim(charlotte_06,14840,14933) #94
charlotte_06_yusa_tell_everyone_she_should_go_to_work=Trim(charlotte_06,15172,15452) #281
charlotte_06_nao_catch_yuu=Trim(charlotte_06,16203,16376) #174
charlotte_06_ayumi_feel_interesting=Trim(charlotte_06,16790,16886) #97
charlotte_06_ayumi_turn_on_tv=Trim(charlotte_06,17385,17467) #83 op
charlotte_06_ayumi_suppose_nao_and_yuu_are_couple=Trim(charlotte_06,19052,19102) #51
charlotte_06_nao_ask_yuu_to_watch_ayumi=Trim(charlotte_06,20290,20370) #81
charlotte_06_ayumi_forget_dream_content=Trim(charlotte_06,21032,21274) #243
charlotte_06_joujirou_imitate_yusa=Trim(charlotte_06,22592,22848) #257
charlotte_06_yuu_discourage_ayumi=Trim(charlotte_06,23817,24098) #282
charlotte_06_ayumi_hide_behind_wall=Trim(charlotte_06,24099,24203) #105
charlotte_06_ayumi_get_across_window=Trim(charlotte_06,24523,24602) #80 op
charlotte_06_oikawa_catch_ayumi=Trim(charlotte_06,27209,27255) #47
charlotte_06_nomura_hit_oikawa=Trim(charlotte_06,27256,27346) #91
charlotte_06_nomura_stop_oikawa=Trim(charlotte_06,27501,27643) #143
charlotte_06_nao_climb_chain_link_fence=Trim(charlotte_06,27910,27956) #47 op
charlotte_06_konishi_stand_ahead_of_ayumi=Trim(charlotte_06,28063,28128) #66
charlotte_06_konishi_walk_toward_ayumi=Trim(charlotte_06,29144,29231) #88
charlotte_06_nao_yuu_joujirou_yusa_running=Trim(charlotte_06,29455,29505) #51
charlotte_06_konishi_appear_01=Trim(charlotte_06,29801,29881) #81
charlotte_06_konishi_appear_02=Trim(charlotte_06,29882,29918) #37
charlotte_06_ayumi_use_collapse_01=Trim(charlotte_06,30339,30361) #23
charlotte_06_ayumi_use_collapse_02=Trim(charlotte_06,30362,30426) #65 op spell
charlotte_06_konishi_escape_from_collapse=Trim(charlotte_06,30484,30547) #64
charlotte_06_ayumi_fall_down_01=Trim(charlotte_06,30548,30642) #95 op spell
charlotte_06_ayumi_fall_down_02=Trim(charlotte_06,30643,30731) #89
charlotte_06_yuu_dig_ruin_01=Trim(charlotte_06,31574,31643) #70
charlotte_06_yuu_dig_ruin_02=Trim(charlotte_06,31751,31808) #58

charlotte_07_yuu_catch_doctor_s_clothes=Trim(charlotte_07,748,883) #136
charlotte_07_telescope_and_rain=Trim(charlotte_07,2142,2231) #90 op
charlotte_07_yuu_eat_instant_noddles_01=Trim(charlotte_07,5912,6013) #102
charlotte_07_yuu_eat_instant_noddles_02=Trim(charlotte_07,6014,6066) #53
charlotte_07_joujirou_slip=Trim(charlotte_07,7324,7393) #70
charlotte_07_misa_distressed=Trim(charlotte_07,8108,8253) #146
charlotte_07_many_cups_on_ground=Trim(charlotte_07,9340,9435) #96
charlotte_07_yumi_ask_yuu_to_go_outside_01=Trim(charlotte_07,10168,10499) #332
charlotte_07_yumi_ask_yuu_to_go_outside_02=Trim(charlotte_07,12102,12354) #253 op
charlotte_07_yuu_kick_cups_toward_yumi_01=Trim(charlotte_07,12737,12804) #68 op spell
charlotte_07_yuu_kick_cups_toward_yumi_02=Trim(charlotte_07,12805,12844) #40 op spell
charlotte_07_yamanote_train=Trim(charlotte_07,14760,14834) #75 op
charlotte_07_train_across_river=Trim(charlotte_07,15021,15086) #66
charlotte_07_yuu_leave_station=Trim(charlotte_07,15289,15369) #81
charlotte_07_yuu_eat_pizza=Trim(charlotte_07,15591,15672) #82
charlotte_07_angel_beats_01=Trim(charlotte_07,15673,15704) #32
charlotte_07_angel_beats_02=Trim(charlotte_07,15705,15747) #43

charlotte_trademark=Trim(charlotte_07,17383,17454) #72

charlotte_07_street=Trim(charlotte_07,17455,17517) #63 op
charlotte_07_yuu_eat_danko_01=Trim(charlotte_07,17821,17927) #107
charlotte_07_yuu_crazy_on_tps=Trim(charlotte_07,18642,18731) #90
charlotte_07_yuu_stab_street_thug=Trim(charlotte_07,22127,22197) #71
charlotte_07_yuu_grab_needle=Trim(charlotte_07,23700,23858) #159 op
charlotte_07_yuu_laugh_coldly_pre=Trim(charlotte_07,24294,24312) #19
charlotte_07_yuu_laugh_coldly=Trim(charlotte_07,24313,24347) #35
charlotte_07_yuu_eat_danko_02=Trim(charlotte_07,24520,24553) #34 op spell
charlotte_07_yuu_beat_everyone_then_stand_up_pre=Trim(charlotte_07,24554,24584) #31
charlotte_07_yuu_beat_everyone_then_stand_up=Trim(charlotte_07,24585,24728) #144
charlotte_07_yuu_catch_nao=Trim(charlotte_07,27285,27355) #71
charlotte_07_nao_say_condition=Trim(charlotte_07,28432,28571) #140
charlotte_07_yuu_cry_and_eat_omurice=Trim(charlotte_07,31026,31238) #213

charlotte_08_yusa_fan_angry=Trim(charlotte_08,2951,3043) #93
charlotte_08_yusa_daijoubu_01=Trim(charlotte_08,3563,3657) #95
charlotte_08_yusa_daijoubu_02=Trim(charlotte_08,3658,3699) #42
charlotte_08_yusa_daijoubu_03=Trim(charlotte_08,3700,3749) #50
charlotte_08_yusa_daijoubu_04=Trim(charlotte_08,3750,3796) #47
charlotte_08_joujirou_show_ticket=Trim(charlotte_08,4346,4449) #104
charlotte_08_yusa_show_new_pv=Trim(charlotte_08,4824,5003) #180
charlotte_08_yusa_embarrassing=Trim(charlotte_08,6469,6603) #135
charlotte_08_joujirou_jump_high=Trim(charlotte_08,6634,6673) #40
charlotte_08_yusa_singing=Trim(charlotte_08,7230,7376) #147 op
charlotte_08_yusa_and_dog=Trim(charlotte_08,8338,8469) #132 op spell
charlotte_08_joujirou_kirakira=Trim(charlotte_08,9652,9760) #109
charlotte_08_yusa_happy_then_frustrated=Trim(charlotte_08,9839,10137) #299
charlotte_08_yusa_thinking=Trim(charlotte_08,12532,12656) #125
charlotte_08_nao_watch_misa=Trim(charlotte_08,13619,13714) #96
charlotte_08_sara_walk_nearby_yuu_01=Trim(charlotte_08,14338,14450) #113
charlotte_08_sara_walk_nearby_yuu_02=Trim(charlotte_08,14451,14477) #27 op
charlotte_08_sara_with_feather=Trim(charlotte_08,15175,15372) #198
charlotte_08_sara_introduce_herself=Trim(charlotte_08,16641,16802) #162
charlotte_08_sara_pay_respect_to_ayumi=Trim(charlotte_08,19338,19463) #126
charlotte_08_sara_and_yuu_on_train=Trim(charlotte_08,22682,22860) #179
charlotte_08_sara_kirakira=Trim(charlotte_08,22915,23005) #91
charlotte_08_sara_eat_raamen_and_kiss_bowl=Trim(charlotte_08,23152,23403) #252 op
charlotte_08_sara_on_couch=Trim(charlotte_08,24577,24762) #186 op spell
charlotte_08_people_laugh_at_sara=Trim(charlotte_08,25245,25544) #300
charlotte_08_sara_sing_for_kazuki_01=Trim(charlotte_08,29913,30098) #186
charlotte_08_sara_sing_for_kazuki_02=Trim(charlotte_08,30552,30683) #132 op
charlotte_08_kazuki_calm_down=Trim(charlotte_08,30769,30804) #36
charlotte_08_sara_is_captured=Trim(charlotte_08,33012,33071) #60

charlotte_09_nao_with_casual_wear=Trim(charlotte_09,2879,3004) #126 op
charlotte_09_nao_exciting=Trim(charlotte_09,3713,3894) #182
charlotte_09_nao_hold_yuu_s_hand_01=Trim(charlotte_09,4687,4713) #27
charlotte_09_nao_hold_yuu_s_hand_02=Trim(charlotte_09,4748,4845) #98 op spell
charlotte_09_nao_get_smart_phone_case_01=Trim(charlotte_09,5500,5556) #57
charlotte_09_nao_get_smart_phone_case_02=Trim(charlotte_09,5557,5636) #80
charlotte_09_nao_get_smart_phone_case_03=Trim(charlotte_09,5637,5723) #87 op
charlotte_09_nao_wave_hand_and_yuu_surprised=Trim(charlotte_09,7925,8019) #95
charlotte_09_sara_singing_01=Trim(charlotte_09,8393,8452) #60
charlotte_09_sara_singing_02=Trim(charlotte_09,8453,8499) #47 op spell
charlotte_09_sara_singing_03=Trim(charlotte_09,8500,8595) #96
charlotte_09_yuu_s_memory=Trim(charlotte_09,9341,9400) #60
charlotte_09_yuu_cover_ayumi_s_mouth=Trim(charlotte_09,12920,12979) #60
charlotte_09_kumagami_tell_yuu=Trim(charlotte_09,13997,14200) #204
charlotte_09_ayumi_curious=Trim(charlotte_09,14296,14355) #60
charlotte_09_scan_ayumi_s_body=Trim(charlotte_09,17250,17304) #55
charlotte_09_yuu_hit_locked_door=Trim(charlotte_09,18635,18802) #168
charlotte_09_tsutsumiuchi_see_camera=Trim(charlotte_09,20421,20518) #98
charlotte_09_medoki_hypnotize_guard=Trim(charlotte_09,21403,21480) #78
charlotte_09_maedomari_hold_sleeping_medoki=Trim(charlotte_09,21571,21708) #138
charlotte_09_yuu_running_in_lab=Trim(charlotte_09,22033,22210) #178
charlotte_09_shichino_pass_through_door=Trim(charlotte_09,23008,23090) #83
charlotte_09_yuu_pass_through_wall=Trim(charlotte_09,24130,24206) #77 op
charlotte_09_shunsuke_use_time_leap=Trim(charlotte_09,25020,25083) #64
charlotte_09_nao_think_yuu_is_different_to_shunsuke=Trim(charlotte_09,27738,28016) #279
charlotte_09_kumagami_yuu_nao_walking_in_secret_base=Trim(charlotte_09,29428,29587) #160
charlotte_09_shunsuke_hear_yuu_coming=Trim(charlotte_09,30513,30664) #152 op
charlotte_09_shunsuke_touch_nao_s_head=Trim(charlotte_09,31222,31433) #212

charlotte_10_little_shunsuke_yuu_ayumi_eat_breakfast=Trim(charlotte_10,690,853) #164
charlotte_10_little_kumagami_and_shunsuke_open_door=Trim(charlotte_10,2635,2694) #60
charlotte_10_found_little_kumagami_and_shunsuke_open_door=Trim(charlotte_10,2695,2784) #90
charlotte_10_little_medoki_shichino_maedomari_talking=Trim(charlotte_10,3958,4143) #186
charlotte_10_little_shunsuke_yuu_ayumi_eat_cake=Trim(charlotte_10,6533,6603) #71
charlotte_10_shunsuke_kumagami_see_city=Trim(charlotte_10,11046,11265) #220 op
charlotte_10_shunsuke_kumagami_see_city_post=Trim(charlotte_10,11266,11326) #61
charlotte_10_kumagami_get_wet_and_shunsuke_laugh=Trim(charlotte_10,13467,13661) #195
charlotte_10_kumagami_get_wet_and_shunsuke_laugh_post=Trim(charlotte_10,13662,13697) #36
charlotte_10_shunsuke_leave_from_yuu_ayumi=Trim(charlotte_10,15304,15493) #190 op
charlotte_10_book_fly=Trim(charlotte_10,19071,19086) #16
charlotte_10_time_leap=Trim(charlotte_10,20597,20668) #72 op spell
charlotte_10_nao_yusa_joujirou_become_junior_high_school_student=Trim(charlotte_10,26115,26204) #90
charlotte_10_joujirou_is_catched_away=Trim(charlotte_10,27561,27677) #117
charlotte_10_yusa_is_found=Trim(charlotte_10,27972,28065) #95 op
charlotte_10_medoki_run_away=Trim(charlotte_10,29203,29237) #35
charlotte_10_glass_broken_behind_konishi=Trim(charlotte_10,30441,30493) #53 op spell
charlotte_10_kumagami_and_medoki_surprised=Trim(charlotte_10,32019,32131) #113

charlotte_11_ayumi_suprised=Trim(charlotte_11,927,966) #40
charlotte_11_tsutsumiuchi_see_comet_core=Trim(charlotte_11,4150,4240) #91 op spell
charlotte_11_comet_core=Trim(charlotte_11,4241,4562) #322
charlotte_11_burned_witches=Trim(charlotte_11,4782,5112) #331 op spell
charlotte_11_tsutsumiuchi_depreciate_yuu=Trim(charlotte_11,6385,6545) #161
charlotte_11_ayumi_call_shunsuke_brother=Trim(charlotte_11,7570,7828) #259 op
charlotte_11_ayumi_happy_and_yuu_shock=Trim(charlotte_11,7829,7898) #70
charlotte_11_shichino_pass_through_wall=Trim(charlotte_11,8407,8437) #31
charlotte_11_medoki_ask_yuu=Trim(charlotte_11,9398,9534) #137 op
charlotte_11_terrorist=Trim(charlotte_11,13536,13587) #52
charlotte_11_strong_terrorist_punch_kumagami_01=Trim(charlotte_11,14606,14636) #31
charlotte_11_strong_terrorist_punch_kumagami_02=Trim(charlotte_11,14637,14710) #74
charlotte_11_kumagami_s_face_full_with_blood=Trim(charlotte_11,15510,15717) #208
charlotte_11_kumagami_scream=Trim(charlotte_11,15912,15959) #48 op spell
charlotte_11_terrorist_search_hidden_nao=Trim(charlotte_11,16906,16989) #84
charlotte_11_nao_punched_01=Trim(charlotte_11,17115,17139) #25
charlotte_11_nao_punched_02=Trim(charlotte_11,17140,17219) #80 op
charlotte_11_nao_with_under_dress_only=Trim(charlotte_11,21874,21944) #71
charlotte_11_yuu_scream_to_shunsuke=Trim(charlotte_11,23319,23484) #166
charlotte_11_yuu_collapse_base=Trim(charlotte_11,23773,23874) #102
charlotte_11_shunsuke_hug_yuu_to_stop_collapse=Trim(charlotte_11,23893,23947) #55
charlotte_11_furuki_tell_yuu=Trim(charlotte_11,26585,26696) #112
charlotte_11_ninja_terrorist_running=Trim(charlotte_11,27400,27423) #24
charlotte_11_ninja_terrorist_jump=Trim(charlotte_11,27446,27491) #46
charlotte_11_yuu_control_tubes=Trim(charlotte_11,28356,28437) #82
charlotte_11_ninja_terrorist_stab_yuu=Trim(charlotte_11,28438,28505) #68
charlotte_11_yuu_use_collapse_01=Trim(charlotte_11,28557,28590) #34
charlotte_11_yuu_use_collapse_02=Trim(charlotte_11,28744,28891) #148 op
charlotte_11_shunsuke_running=Trim(charlotte_11,30745,30819) #75
charlotte_11_kumagami_use_body_to_cover_nao=Trim(charlotte_11,31265,31346) #82 op
charlotte_11_shunsuke_hug_dead_kumagami=Trim(charlotte_11,32082,32181) #100

charlotte_12_shichino_angry_then_stop_by_medoki=Trim(charlotte_12,4328,4496) #169
charlotte_12_shunsuke_sit_on_roof=Trim(charlotte_12,6154,6249) #96
charlotte_12_city=Trim(charlotte_12,7275,7320) #46
charlotte_12_yusa_show_risotto=Trim(charlotte_12,10441,10543) #103 op
charlotte_12_yusa_feed_rice_to_yuu=Trim(charlotte_12,10749,10980) #232
charlotte_12_yusa_see_parent=Trim(charlotte_12,14779,14831) #53
charlotte_12_yusa_hug_parent=Trim(charlotte_12,14832,14877) #46 op
charlotte_12_misa_eat_soba_and_cry=Trim(charlotte_12,15869,16241) #373 op
charlotte_12_misa_cry=Trim(charlotte_12,16282,16386) #105
charlotte_12_yuu_make_rehabilitation=Trim(charlotte_12,18706,18787) #82
charlotte_12_shunsuke_sit_and_discouraged=Trim(charlotte_12,19058,19175) #118
charlotte_12_nao_eat_pocky_turn_back=Trim(charlotte_12,23496,23582) #87
charlotte_12_nao_and_yuu_argue=Trim(charlotte_12,24951,25105) #155
charlotte_12_nao_and_yuu_make_deal_01=Trim(charlotte_12,26346,26403) #58 op spell
charlotte_12_nao_and_yuu_make_deal_02=Trim(charlotte_12,26404,26674) #271 op
charlotte_12_nao_open_arms=Trim(charlotte_12,26675,26740) #66
charlotte_12_yuu_promise_nao_under_sunset=Trim(charlotte_12,27459,27528) #70 op spell
charlotte_12_yuu_promise_nao_under_sunset_post=Trim(charlotte_12,27529,27570) #42
charlotte_12_shunsuke_not_reconciled=Trim(charlotte_12,27994,28150) #157 op
charlotte_12_medoki_shichino_maedomari=Trim(charlotte_12,29347,29478) #132 op
charlotte_12_yuu_meet_misa_and_joujirou=Trim(charlotte_12,29994,30277) #284
charlotte_12_yusa_cry=Trim(charlotte_12,32079,32178) #100

charlotte_13_airplane=Trim(charlotte_13,107,173) #67
charlotte_13_shunsuke_see_airplane=Trim(charlotte_13,174,278) #105 op
charlotte_13_shunsuke_walk_back=Trim(charlotte_13,279,360) #82
charlotte_13_yuu_use_fire_and_query_english_word=Trim(charlotte_13,4219,4363) #145
charlotte_13_yuu_break_car_door=Trim(charlotte_13,5279,5368) #90
charlotte_13_ability_map=Trim(charlotte_13,6387,6450) #64
charlotte_13_yuu_dash_across_room=Trim(charlotte_13,6950,7025) #76
charlotte_13_freeze=Trim(charlotte_13,8427,8464) #38
charlotte_13_yuu_make_phone_call_under_moonlight=Trim(charlotte_13,8842,9084) #243
charlotte_13_telescope_ability=Trim(charlotte_13,9754,9829) #76
charlotte_13_yuu_open_shield=Trim(charlotte_13,12165,12226) #62
charlotte_13_yuu_scale_shield=Trim(charlotte_13,12361,12390) #30
charlotte_13_girl_cure_old_man=Trim(charlotte_13,12843,12942) #100 op spell
charlotte_13_yuu_touch_eye_then_break_glass=Trim(charlotte_13,13650,13804) #155 op
charlotte_13_yuu_control_rock_toward_people=Trim(charlotte_13,15215,15253) #39 op
charlotte_13_yuu_control_rock_backward_01=Trim(charlotte_13,15279,15288) #10
charlotte_13_yuu_control_rock_backward_02=Trim(charlotte_13,15289,15355) #67
charlotte_13_yuu_burn_people=Trim(charlotte_13,16805,16828) #24
charlotte_13_yuu_hurt_people=Trim(charlotte_13,16829,16852) #24
charlotte_13_yuu_open_shield_and_thinking=Trim(charlotte_13,17155,17194) #40 op spell
charlotte_13_yuu_promise_nao_under_sunset=Trim(charlotte_13,17842,18001) #160
charlotte_13_yuu_see_explosion=Trim(charlotte_13,18528,18651) #124 op
charlotte_13_bomber_frozen=Trim(charlotte_13,18890,18989) #100
charlotte_13_yuu_freeze_bomber=Trim(charlotte_13,18990,19071) #82
charlotte_13_yuu_break_wall_and_say_hello=Trim(charlotte_13,19880,19938) #59
charlotte_13_yuu_jump_down=Trim(charlotte_13,20175,20242) #68 op
charlotte_13_yuu_drag_person_and_fall_down=Trim(charlotte_13,20741,20972) #232
charlotte_13_yuu_bring_word_cards=Trim(charlotte_13,22649,22742) #94
charlotte_13_yuu_make_person_float=Trim(charlotte_13,22958,22998) #41
charlotte_13_yuu_corrode_bullet=Trim(charlotte_13,23133,23232) #100
charlotte_13_yuu_stop_bullet=Trim(charlotte_13,23521,23656) #136
charlotte_13_yuu_under_moon=Trim(charlotte_13,24613,24661) #49 op
charlotte_13_courageous_girl_stand_ahead_of_yuu_01=Trim(charlotte_13,25620,25744) #125
charlotte_13_courageous_girl_stand_ahead_of_yuu_02=Trim(charlotte_13,27054,27273) #220 op
charlotte_13_nao_cry=Trim(charlotte_13,32542,32674) #133
