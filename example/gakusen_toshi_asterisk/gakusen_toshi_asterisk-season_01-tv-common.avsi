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

gakusen_toshi_asterisk_season_01_tv_01=FFMS2_VIDEO_SOURCE("src\anime\[Ohys-Raws] Gakusen Toshi Asterisk S1 (BD 1280x720 x264 AACx2)\Gakusen Toshi Asterisk - 01 (BD 1280x720 x264 AACx2).mp4")
gakusen_toshi_asterisk_season_01_tv_02=FFMS2_VIDEO_SOURCE("src\anime\[Ohys-Raws] Gakusen Toshi Asterisk S1 (BD 1280x720 x264 AACx2)\Gakusen Toshi Asterisk - 02 (BD 1280x720 x264 AACx2).mp4")
gakusen_toshi_asterisk_season_01_tv_03=FFMS2_VIDEO_SOURCE("src\anime\[Ohys-Raws] Gakusen Toshi Asterisk S1 (BD 1280x720 x264 AACx2)\Gakusen Toshi Asterisk - 03 (BD 1280x720 x264 AACx2).mp4")
gakusen_toshi_asterisk_season_01_tv_04=FFMS2_VIDEO_SOURCE("src\anime\[Ohys-Raws] Gakusen Toshi Asterisk S1 (BD 1280x720 x264 AACx2)\Gakusen Toshi Asterisk - 04 (BD 1280x720 x264 AACx2).mp4")
gakusen_toshi_asterisk_season_01_tv_05=FFMS2_VIDEO_SOURCE("src\anime\[Ohys-Raws] Gakusen Toshi Asterisk S1 (BD 1280x720 x264 AACx2)\Gakusen Toshi Asterisk - 05 (BD 1280x720 x264 AACx2).mp4")
gakusen_toshi_asterisk_season_01_tv_06=FFMS2_VIDEO_SOURCE("src\anime\[Ohys-Raws] Gakusen Toshi Asterisk S1 (BD 1280x720 x264 AACx2)\Gakusen Toshi Asterisk - 06 (BD 1280x720 x264 AACx2).mp4")
gakusen_toshi_asterisk_season_01_tv_07=FFMS2_VIDEO_SOURCE("src\anime\[Ohys-Raws] Gakusen Toshi Asterisk S1 (BD 1280x720 x264 AACx2)\Gakusen Toshi Asterisk - 07 (BD 1280x720 x264 AACx2).mp4")
gakusen_toshi_asterisk_season_01_tv_08=FFMS2_VIDEO_SOURCE("src\anime\[Ohys-Raws] Gakusen Toshi Asterisk S1 (BD 1280x720 x264 AACx2)\Gakusen Toshi Asterisk - 08 (BD 1280x720 x264 AACx2).mp4")
gakusen_toshi_asterisk_season_01_tv_09=FFMS2_VIDEO_SOURCE("src\anime\[Ohys-Raws] Gakusen Toshi Asterisk S1 (BD 1280x720 x264 AACx2)\Gakusen Toshi Asterisk - 09 (BD 1280x720 x264 AACx2).mp4")
gakusen_toshi_asterisk_season_01_tv_10=FFMS2_VIDEO_SOURCE("src\anime\[Ohys-Raws] Gakusen Toshi Asterisk S1 (BD 1280x720 x264 AACx2)\Gakusen Toshi Asterisk - 10 (BD 1280x720 x264 AACx2).mp4")
gakusen_toshi_asterisk_season_01_tv_11=FFMS2_VIDEO_SOURCE("src\anime\[Ohys-Raws] Gakusen Toshi Asterisk S1 (BD 1280x720 x264 AACx2)\Gakusen Toshi Asterisk - 11 (BD 1280x720 x264 AACx2).mp4")
gakusen_toshi_asterisk_season_01_tv_12=FFMS2_VIDEO_SOURCE("src\anime\[Ohys-Raws] Gakusen Toshi Asterisk S1 (BD 1280x720 x264 AACx2)\Gakusen Toshi Asterisk - 12 (BD 1280x720 x264 AACx2).mp4")

#new_game_tv_12=FFMS2_VIDEO_SOURCE("src\anime\(2016Q3) NEW GAME! 第12話 「ひとつ夢が叶いました！」 (AT-X 1280x720 x264 AAC).mp4")
#new_game_tv_12_cache02=FFMS2_VIDEO_SOURCE("src\anime\(2016Q3) NEW GAME! 第12話 「ひとつ夢が叶いました！」 (AT-X 1280x720 x264 AAC).mp4")

gakusen_toshi_asterisk_season_01_tv_clean_op=Trim(gakusen_toshi_asterisk_season_01_tv_02,2206,4362)

gakusen_toshi_asterisk_season_01_tv_clean_ed_rev01=Trim(gakusen_toshi_asterisk_season_01_tv_02,31528,33685)
gakusen_toshi_asterisk_season_01_tv_clean_ed_rev02=Trim(gakusen_toshi_asterisk_season_01_tv_05,31528,33685)
gakusen_toshi_asterisk_season_01_tv_clean_ed_rev03=Trim(gakusen_toshi_asterisk_season_01_tv_12,31348,33505)

######## Trim ########

gakusen_toshi_asterisk_season_01_tv_clean_ed_rev01_01=Trim(gakusen_toshi_asterisk_season_01_tv_clean_ed_rev01,0,1235)
gakusen_toshi_asterisk_season_01_tv_clean_ed_rev01_02=Trim(gakusen_toshi_asterisk_season_01_tv_clean_ed_rev01,1236,1267)
gakusen_toshi_asterisk_season_01_tv_clean_ed_rev01_03=Trim(gakusen_toshi_asterisk_season_01_tv_clean_ed_rev01,1268,1654)
gakusen_toshi_asterisk_season_01_tv_clean_ed_rev01_04=Trim(gakusen_toshi_asterisk_season_01_tv_clean_ed_rev01,1655,0)

gakusen_toshi_asterisk_season_01_tv_clean_ed_rev02_01=Trim(gakusen_toshi_asterisk_season_01_tv_clean_ed_rev02,0,1235)
gakusen_toshi_asterisk_season_01_tv_clean_ed_rev02_02=Trim(gakusen_toshi_asterisk_season_01_tv_clean_ed_rev02,1236,1267)
gakusen_toshi_asterisk_season_01_tv_clean_ed_rev02_03=Trim(gakusen_toshi_asterisk_season_01_tv_clean_ed_rev02,1268,1654)
gakusen_toshi_asterisk_season_01_tv_clean_ed_rev02_04=Trim(gakusen_toshi_asterisk_season_01_tv_clean_ed_rev02,1655,0)

gakusen_toshi_asterisk_season_01_tv_clean_ed_rev03_01=Trim(gakusen_toshi_asterisk_season_01_tv_clean_ed_rev03,0,1235)
gakusen_toshi_asterisk_season_01_tv_clean_ed_rev03_02=Trim(gakusen_toshi_asterisk_season_01_tv_clean_ed_rev03,1236,1267)
gakusen_toshi_asterisk_season_01_tv_clean_ed_rev03_03=Trim(gakusen_toshi_asterisk_season_01_tv_clean_ed_rev03,1268,1654)
gakusen_toshi_asterisk_season_01_tv_clean_ed_rev03_04=Trim(gakusen_toshi_asterisk_season_01_tv_clean_ed_rev03,1655,0)



gakusen_toshi_asterisk_season_01_tv_01_ayato_see_juris_wearing=Trim(gakusen_toshi_asterisk_season_01_tv_01,3772,3829) #42
gakusen_toshi_asterisk_season_01_tv_01_juris_shining=Trim(gakusen_toshi_asterisk_season_01_tv_01,5395,5510) #116
gakusen_toshi_asterisk_season_01_tv_01_juris_fire_to_ayato_01=Trim(gakusen_toshi_asterisk_season_01_tv_01,6669,6751) #83
gakusen_toshi_asterisk_season_01_tv_01_juris_fire_to_ayato_02=Trim(gakusen_toshi_asterisk_season_01_tv_01,6752,6828) #77
gakusen_toshi_asterisk_season_01_tv_01_claudia_explain=Trim(gakusen_toshi_asterisk_season_01_tv_01,18545,18942) #398 ed
gakusen_toshi_asterisk_season_01_tv_01_ayato_hear_explain=Trim(gakusen_toshi_asterisk_season_01_tv_01,18943,19118) #176 ed
gakusen_toshi_asterisk_season_01_tv_01_juris_in_fire_01_part01=Trim(gakusen_toshi_asterisk_season_01_tv_01,31036,31065) #30
gakusen_toshi_asterisk_season_01_tv_01_juris_in_fire_01_part02=Trim(gakusen_toshi_asterisk_season_01_tv_01,31066,31081) #16
gakusen_toshi_asterisk_season_01_tv_01_juris_in_fire_01_part03=Trim(gakusen_toshi_asterisk_season_01_tv_01,31082,31286) #205 ed
gakusen_toshi_asterisk_season_01_tv_01_juris_in_fire_02=Trim(gakusen_toshi_asterisk_season_01_tv_01,31287,31393) #107

gakusen_toshi_asterisk_season_01_tv_02_juris_attack_assassin=Trim(gakusen_toshi_asterisk_season_01_tv_02,20507,20595) #89
gakusen_toshi_asterisk_season_01_tv_02_saya_carry_cannon=Trim(gakusen_toshi_asterisk_season_01_tv_02,20873,21073) #201 ed
gakusen_toshi_asterisk_season_01_tv_02_saya_launch_cannon=Trim(gakusen_toshi_asterisk_season_01_tv_02,21160,21239) #80
gakusen_toshi_asterisk_season_01_tv_02_chain_surround_ayato=Trim(gakusen_toshi_asterisk_season_01_tv_02,25838,26017) #180 ed
gakusen_toshi_asterisk_season_01_tv_02_claudia_take_shower=Trim(gakusen_toshi_asterisk_season_01_tv_02,30728,30781) #54
gakusen_toshi_asterisk_season_01_tv_02_claudia_wear_bathrobe=Trim(gakusen_toshi_asterisk_season_01_tv_02,31265,31377) #113

gakusen_toshi_asterisk_season_01_tv_03_claudia_sexy_01=Trim(gakusen_toshi_asterisk_season_01_tv_03,5396,5434) #39
gakusen_toshi_asterisk_season_01_tv_03_claudia_sexy_02=Trim(gakusen_toshi_asterisk_season_01_tv_03,6809,6910) #102
gakusen_toshi_asterisk_season_01_tv_03_claudia_close_to_ayato=Trim(gakusen_toshi_asterisk_season_01_tv_03,9129,9163) #35
gakusen_toshi_asterisk_season_01_tv_03_juris_wear_dress_01=Trim(gakusen_toshi_asterisk_season_01_tv_03,9892,9950) #59
gakusen_toshi_asterisk_season_01_tv_03_juris_wear_dress_02=Trim(gakusen_toshi_asterisk_season_01_tv_03,9951,10009) #59
gakusen_toshi_asterisk_season_01_tv_03_juris_pull_up_skirt=Trim(gakusen_toshi_asterisk_season_01_tv_03,10386,10511) #126 ed
gakusen_toshi_asterisk_season_01_tv_03_juris_see_hamburger=Trim(gakusen_toshi_asterisk_season_01_tv_03,11696,11743) #48
gakusen_toshi_asterisk_season_01_tv_03_juris_run=Trim(gakusen_toshi_asterisk_season_01_tv_03,18949,18973) #25
gakusen_toshi_asterisk_season_01_tv_03_juris_catch_ayato_s_shirt=Trim(gakusen_toshi_asterisk_season_01_tv_03,21239,21315) #77
gakusen_toshi_asterisk_season_01_tv_03_juris_embarassing_and_point_to_ayato=Trim(gakusen_toshi_asterisk_season_01_tv_03,21316,21434) #119
gakusen_toshi_asterisk_season_01_tv_03_little_juris_run_away=Trim(gakusen_toshi_asterisk_season_01_tv_03,23550,23603) #54
gakusen_toshi_asterisk_season_01_tv_03_little_juris_in_lane=Trim(gakusen_toshi_asterisk_season_01_tv_03,23604,23682) #79
gakusen_toshi_asterisk_season_01_tv_03_little_juris_s_friends=Trim(gakusen_toshi_asterisk_season_01_tv_03,23891,23959) #69
gakusen_toshi_asterisk_season_01_tv_03_little_juris_and_friends=Trim(gakusen_toshi_asterisk_season_01_tv_03,24419,24625) #207 ed

gakusen_toshi_asterisk_season_01_tv_04_juris_raise_sword=Trim(gakusen_toshi_asterisk_season_01_tv_04,10916,11088) #173 ed
gakusen_toshi_asterisk_season_01_tv_04_ayato_take_juris=Trim(gakusen_toshi_asterisk_season_01_tv_04,18313,18369) #57
gakusen_toshi_asterisk_season_01_tv_04_ayato_and_juris_fly_under_sunset=Trim(gakusen_toshi_asterisk_season_01_tv_04,24156,24250) #95 ed

gakusen_toshi_asterisk_season_01_tv_05_kirin_skipping=Trim(gakusen_toshi_asterisk_season_01_tv_05,8891,9075) #185
gakusen_toshi_asterisk_season_01_tv_05_kirin_embarassing=Trim(gakusen_toshi_asterisk_season_01_tv_05,9097,9198) #102
gakusen_toshi_asterisk_season_01_tv_05_kirin_thanks_to_ayato=Trim(gakusen_toshi_asterisk_season_01_tv_05,9489,9603) #115
gakusen_toshi_asterisk_season_01_tv_05_ernesta_excited=Trim(gakusen_toshi_asterisk_season_01_tv_05,15170,15378) #209
gakusen_toshi_asterisk_season_01_tv_05_ernesta_smile=Trim(gakusen_toshi_asterisk_season_01_tv_05,17040,17062) #23 ed
gakusen_toshi_asterisk_season_01_tv_05_ernesta_watch_ayato=Trim(gakusen_toshi_asterisk_season_01_tv_05,17355,17462) #108
gakusen_toshi_asterisk_season_01_tv_05_ernesta_and_camilla_leave_seidoukan_academy=Trim(gakusen_toshi_asterisk_season_01_tv_05,21706,21908) #203
gakusen_toshi_asterisk_season_01_tv_05_ernesta_raise_hand=Trim(gakusen_toshi_asterisk_season_01_tv_05,22348,22439) #92
gakusen_toshi_asterisk_season_01_tv_05_ayato_stop_kouichirou_to_punish_kirin_01=Trim(gakusen_toshi_asterisk_season_01_tv_05,23506,23558) #53
gakusen_toshi_asterisk_season_01_tv_05_ayato_stop_kouichirou_to_punish_kirin_02=Trim(gakusen_toshi_asterisk_season_01_tv_05,23639,23812) #174 ed

gakusen_toshi_asterisk_season_01_tv_06_kirin_sad_01=Trim(gakusen_toshi_asterisk_season_01_tv_06,199,312) #114
gakusen_toshi_asterisk_season_01_tv_06_juris_tsundere=Trim(gakusen_toshi_asterisk_season_01_tv_06,4275,4409) #135
gakusen_toshi_asterisk_season_01_tv_06_kirin_sad_02=Trim(gakusen_toshi_asterisk_season_01_tv_06,4825,4928) #104
gakusen_toshi_asterisk_season_01_tv_06_kirin_and_kouichirou=Trim(gakusen_toshi_asterisk_season_01_tv_06,8984,9124) #141
gakusen_toshi_asterisk_season_01_tv_06_kirin_and_kouichirou_non_fade_in_out=Trim(gakusen_toshi_asterisk_season_01_tv_06,8993,9115) #123 ed
gakusen_toshi_asterisk_season_01_tv_06_ayato_and_kirin_training_run=Trim(gakusen_toshi_asterisk_season_01_tv_06,21137,21177) #41 ed
gakusen_toshi_asterisk_season_01_tv_06_ayato_and_kirin_training_using_sword=Trim(gakusen_toshi_asterisk_season_01_tv_06,21178,21213) #36
gakusen_toshi_asterisk_season_01_tv_06_ayato_and_kirin_return_sword_to_sheath=Trim(gakusen_toshi_asterisk_season_01_tv_06,29974,30080) #107

gakusen_toshi_asterisk_season_01_tv_07_ayato_buff=Trim(gakusen_toshi_asterisk_season_01_tv_07,7146,7204) #59 ed
gakusen_toshi_asterisk_season_01_tv_07_ayato_limited=Trim(gakusen_toshi_asterisk_season_01_tv_07,7875,7922) #48
gakusen_toshi_asterisk_season_01_tv_07_naked_kirin_sit_down=Trim(gakusen_toshi_asterisk_season_01_tv_07,8839,9016) #178
gakusen_toshi_asterisk_season_01_tv_07_little_kirin_is_hijacked=Trim(gakusen_toshi_asterisk_season_01_tv_07,10222,10268) #47
gakusen_toshi_asterisk_season_01_tv_07_little_kirin_see_father_go_to_jail=Trim(gakusen_toshi_asterisk_season_01_tv_07,10331,10434) #104
gakusen_toshi_asterisk_season_01_tv_07_naked_kirin_duck_sitting=Trim(gakusen_toshi_asterisk_season_01_tv_07,12276,12334) #59
gakusen_toshi_asterisk_season_01_tv_07_kirin_talk_with_kouichirou=Trim(gakusen_toshi_asterisk_season_01_tv_07,14404,14573) #170
gakusen_toshi_asterisk_season_01_tv_07_kirin_hold_kouichirou_s_punch=Trim(gakusen_toshi_asterisk_season_01_tv_07,15538,15732) #195
gakusen_toshi_asterisk_season_01_tv_07_kirin_using_sword_skill=Trim(gakusen_toshi_asterisk_season_01_tv_07,18922,19005) #84
gakusen_toshi_asterisk_season_01_tv_07_kirin_show_sword_skill=Trim(gakusen_toshi_asterisk_season_01_tv_07,19489,19865) #377 ed
gakusen_toshi_asterisk_season_01_tv_07_kirin_buff=Trim(gakusen_toshi_asterisk_season_01_tv_07,19866,20013) #148
gakusen_toshi_asterisk_season_01_tv_07_ayato_use_lance_skill=Trim(gakusen_toshi_asterisk_season_01_tv_07,20751,20817) #67
gakusen_toshi_asterisk_season_01_tv_07_ayato_hold_kouichirou_to_punish_kirin=Trim(gakusen_toshi_asterisk_season_01_tv_07,25299,25415) #117
gakusen_toshi_asterisk_season_01_tv_07_cunning_claudia=Trim(gakusen_toshi_asterisk_season_01_tv_07,26106,26195) #90

gakusen_toshi_asterisk_season_01_tv_08_saya_and_kirin_discuss=Trim(gakusen_toshi_asterisk_season_01_tv_08,9270,9679) #410
gakusen_toshi_asterisk_season_01_tv_08_kirin_see_saya_buy_gun=Trim(gakusen_toshi_asterisk_season_01_tv_08,13717,13875) #159 ed
gakusen_toshi_asterisk_season_01_tv_08_saya_teach_kirin_swimming=Trim(gakusen_toshi_asterisk_season_01_tv_08,16237,16354) #118 ed
gakusen_toshi_asterisk_season_01_tv_08_kirin_and_saya_see_pool_under_sunset=Trim(gakusen_toshi_asterisk_season_01_tv_08,25200,25390) #191 ed
gakusen_toshi_asterisk_season_01_tv_08_saya_talk_with_kirin_under_sunset=Trim(gakusen_toshi_asterisk_season_01_tv_08,26844,27017) #174
gakusen_toshi_asterisk_season_01_tv_08_eishirou_and_claudia_see_festa_schedule=Trim(gakusen_toshi_asterisk_season_01_tv_08,32729,32902) #174 ed

gakusen_toshi_asterisk_season_01_tv_09_juris_and_ayato_hear_festa_rule=Trim(gakusen_toshi_asterisk_season_01_tv_09,5639,5694) #56
gakusen_toshi_asterisk_season_01_tv_09_juris_saya_kirin_see_ayato_open_meal_box=Trim(gakusen_toshi_asterisk_season_01_tv_09,11169,11331) #163
gakusen_toshi_asterisk_season_01_tv_09_saya_is_proud_and_juris_get_headache=Trim(gakusen_toshi_asterisk_season_01_tv_09,11623,12081) #459 ed
gakusen_toshi_asterisk_season_01_tv_09_introduce_juris=Trim(gakusen_toshi_asterisk_season_01_tv_09,16785,16929) #145 candidate
gakusen_toshi_asterisk_season_01_tv_09_ayato_limit_break=Trim(gakusen_toshi_asterisk_season_01_tv_09,18492,18534) #43 ed
gakusen_toshi_asterisk_season_01_tv_09_ayato_dash=Trim(gakusen_toshi_asterisk_season_01_tv_09,18883,18934) #52

gakusen_toshi_asterisk_season_01_tv_10_ernesta_cute=Trim(gakusen_toshi_asterisk_season_01_tv_10,4349,4464) #116
gakusen_toshi_asterisk_season_01_tv_10_irene_kick_street_ruffian=Trim(gakusen_toshi_asterisk_season_01_tv_10,8193,8239) #47
gakusen_toshi_asterisk_season_01_tv_10_priscilla_push_irene_s_head=Trim(gakusen_toshi_asterisk_season_01_tv_10,10333,10497) #165
gakusen_toshi_asterisk_season_01_tv_10_saya_see_enemy_on_stage=Trim(gakusen_toshi_asterisk_season_01_tv_10,15062,15120) #59 ed
gakusen_toshi_asterisk_season_01_tv_10_saya_try_to_catch_kirin_s_breast=Trim(gakusen_toshi_asterisk_season_01_tv_10,17774,17806) #33
gakusen_toshi_asterisk_season_01_tv_10_juris_raise_hand=Trim(gakusen_toshi_asterisk_season_01_tv_10,18930,19030) #101
gakusen_toshi_asterisk_season_01_tv_10_ayato_fondle_juris_s_head=Trim(gakusen_toshi_asterisk_season_01_tv_10,23828,23976) #149
gakusen_toshi_asterisk_season_01_tv_10_irene_take_scythe=Trim(gakusen_toshi_asterisk_season_01_tv_10,25347,25460) #114 ed
gakusen_toshi_asterisk_season_01_tv_10_irene_suck_priscilla_s_blood=Trim(gakusen_toshi_asterisk_season_01_tv_10,28521,28609) #89 ed

gakusen_toshi_asterisk_season_01_tv_11_irene_and_priscilla_talk_with_ayato=Trim(gakusen_toshi_asterisk_season_01_tv_11,9353,9610) #258
gakusen_toshi_asterisk_season_01_tv_11_dirk_see_irene_and_priscilla=Trim(gakusen_toshi_asterisk_season_01_tv_11,18732,18848) #117
gakusen_toshi_asterisk_season_01_tv_11_claudia_sleeping=Trim(gakusen_toshi_asterisk_season_01_tv_11,24423,24507) #85
gakusen_toshi_asterisk_season_01_tv_11_claudia_get_crazy=Trim(gakusen_toshi_asterisk_season_01_tv_11,24790,24842) #53 ed
gakusen_toshi_asterisk_season_01_tv_11_claudia_crazily_wield_sword_toward_ayato=Trim(gakusen_toshi_asterisk_season_01_tv_11,24937,25011) #75
gakusen_toshi_asterisk_season_01_tv_11_priscilla_see_moon=Trim(gakusen_toshi_asterisk_season_01_tv_11,31340,31408) #69 ed

gakusen_toshi_asterisk_season_01_tv_12_irene_suck_priscilla_s_blood=Trim(gakusen_toshi_asterisk_season_01_tv_12,4132,4288) #157
gakusen_toshi_asterisk_season_01_tv_12_camilla_see_ernesta_excited=Trim(gakusen_toshi_asterisk_season_01_tv_12,24494,24591) #98 ed
gakusen_toshi_asterisk_season_01_tv_12_sylvia_watch_festa=Trim(gakusen_toshi_asterisk_season_01_tv_12,24829,24986) #158 ed
gakusen_toshi_asterisk_season_01_tv_12_sylvia_run_away=Trim(gakusen_toshi_asterisk_season_01_tv_12,24987,25049) #63
gakusen_toshi_asterisk_season_01_tv_12_juris_touch_ayato_s_face=Trim(gakusen_toshi_asterisk_season_01_tv_12,29231,29476) #246 ed
gakusen_toshi_asterisk_season_01_tv_12_kirin_saya_claudia_juris_surround_ayato=Trim(gakusen_toshi_asterisk_season_01_tv_12,31034,31164) #131
