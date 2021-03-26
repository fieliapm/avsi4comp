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

majo_no_tabitabi_tv_01=FFMS2_VIDEO_SOURCE("src\anime\[Ohys-Raws] Majo no Tabitabi - 01 (AT-X 1280x720 x264 AAC).mp4")
majo_no_tabitabi_tv_02=FFMS2_VIDEO_SOURCE("src\anime\[Ohys-Raws] Majo no Tabitabi - 02 (AT-X 1280x720 x264 AAC).mp4")
majo_no_tabitabi_tv_03=FFMS2_VIDEO_SOURCE("src\anime\[Ohys-Raws] Majo no Tabitabi - 03 (AT-X 1280x720 x264 AAC).mp4")
majo_no_tabitabi_tv_04=FFMS2_VIDEO_SOURCE("src\anime\[Ohys-Raws] Majo no Tabitabi - 04 (AT-X 1280x720 x264 AAC).mp4")
majo_no_tabitabi_tv_05=FFMS2_VIDEO_SOURCE("src\anime\[Ohys-Raws] Majo no Tabitabi - 05 (AT-X 1280x720 x264 AAC).mp4")
majo_no_tabitabi_tv_06=FFMS2_VIDEO_SOURCE("src\anime\[Ohys-Raws] Majo no Tabitabi - 06 (AT-X 1280x720 x264 AAC).mp4")
majo_no_tabitabi_tv_07=FFMS2_VIDEO_SOURCE("src\anime\[Ohys-Raws] Majo no Tabitabi - 07 (AT-X 1280x720 x264 AAC).mp4")
majo_no_tabitabi_tv_08=FFMS2_VIDEO_SOURCE("src\anime\[Ohys-Raws] Majo no Tabitabi - 08 (AT-X 1280x720 x264 AAC).mp4")
majo_no_tabitabi_tv_08_cache02=FFMS2_VIDEO_SOURCE("src\anime\[Ohys-Raws] Majo no Tabitabi - 08 (AT-X 1280x720 x264 AAC).mp4")
majo_no_tabitabi_tv_08_cache03=FFMS2_VIDEO_SOURCE("src\anime\[Ohys-Raws] Majo no Tabitabi - 08 (AT-X 1280x720 x264 AAC).mp4")
majo_no_tabitabi_tv_09=FFMS2_VIDEO_SOURCE("src\anime\[Ohys-Raws] Majo no Tabitabi - 09 (AT-X 1280x720 x264 AAC).mp4")
majo_no_tabitabi_tv_10=FFMS2_VIDEO_SOURCE("src\anime\[Ohys-Raws] Majo no Tabitabi - 10 (AT-X 1280x720 x264 AAC).mp4")

#majo_no_tabitabi_tv_11=majo_no_tabitabi_tv_09
#majo_no_tabitabi_tv_12=majo_no_tabitabi_tv_09
#majo_no_tabitabi_tv_13=majo_no_tabitabi_tv_09

#majo_no_tabitabi_tv_clean_op_unstable=Trim(majo_no_tabitabi_tv_02,863,3019)
majo_no_tabitabi_tv_clean_op_from_02=Trim(majo_no_tabitabi_tv_03,1105,3261)
majo_no_tabitabi_tv_clean_op_from_07=Trim(majo_no_tabitabi_tv_07,3596,5753)
majo_no_tabitabi_tv_clean_op=Trim(majo_no_tabitabi_tv_08,936,3092)
majo_no_tabitabi_tv_clean_op_cache02=Trim(majo_no_tabitabi_tv_08_cache02,936,3092)
majo_no_tabitabi_tv_clean_op_cache03=Trim(majo_no_tabitabi_tv_08_cache03,936,3092)

######## Trim ########

majo_no_tabitabi_tv_clean_op_01=Trim(majo_no_tabitabi_tv_clean_op,0,206)
majo_no_tabitabi_tv_clean_op_02=Trim(majo_no_tabitabi_tv_clean_op,207,502)
majo_no_tabitabi_tv_clean_op_03=Trim(majo_no_tabitabi_tv_clean_op,503,793)
majo_no_tabitabi_tv_clean_op_04=Trim(majo_no_tabitabi_tv_clean_op,794,1181)
majo_no_tabitabi_tv_clean_op_05=Trim(majo_no_tabitabi_tv_clean_op,1182,1572)
majo_no_tabitabi_tv_clean_op_06=Trim(majo_no_tabitabi_tv_clean_op,1573,1767)
majo_no_tabitabi_tv_clean_op_07=Trim(majo_no_tabitabi_tv_clean_op,1768,1962)
majo_no_tabitabi_tv_clean_op_08=Trim(majo_no_tabitabi_tv_clean_op,1963,0)

majo_no_tabitabi_tv_clean_op_06_elaina_conducting=Trim(majo_no_tabitabi_tv_clean_op_cache02,1714,1767) #54
majo_no_tabitabi_tv_clean_op_06_elaina_conducting_cache02=Trim(majo_no_tabitabi_tv_clean_op_cache03,1714,1767) #54


majo_no_tabitabi_tv_01_season_variation_01=Trim(majo_no_tabitabi_tv_01,1634,1657) #24 op
majo_no_tabitabi_tv_01_season_variation_02=Trim(majo_no_tabitabi_tv_01,1658,1681) #24 op
majo_no_tabitabi_tv_01_season_variation_03=Trim(majo_no_tabitabi_tv_01,1682,1705) #24 op
majo_no_tabitabi_tv_01_season_variation_04=Trim(majo_no_tabitabi_tv_01,1706,1729) #24 op
majo_no_tabitabi_tv_01_book_variation_01=Trim(majo_no_tabitabi_tv_01,1730,1747) #18 op
majo_no_tabitabi_tv_01_book_variation_02=Trim(majo_no_tabitabi_tv_01,1748,1765) #18 op
majo_no_tabitabi_tv_01_book_variation_03=Trim(majo_no_tabitabi_tv_01,1766,1783) #18 op
majo_no_tabitabi_tv_01_book_variation_04=Trim(majo_no_tabitabi_tv_01,1784,1799) #16 op
majo_no_tabitabi_tv_01_weather_variation_01=Trim(majo_no_tabitabi_tv_01,1800,1823) #24
majo_no_tabitabi_tv_01_weather_variation_02=Trim(majo_no_tabitabi_tv_01,1824,1847) #24
majo_no_tabitabi_tv_01_weather_variation_03=Trim(majo_no_tabitabi_tv_01,1848,1867) #20
majo_no_tabitabi_tv_01_elaina_s_skirt=Trim(majo_no_tabitabi_tv_01,2030,2053)
majo_no_tabitabi_tv_01_elaina_s_badge=Trim(majo_no_tabitabi_tv_01,2054,2077)
majo_no_tabitabi_tv_01_elaina_s_face=Trim(majo_no_tabitabi_tv_01,2078,2144)
majo_no_tabitabi_tv_01_elaina_s_shoes=Trim(majo_no_tabitabi_tv_01,2145,2185)
majo_no_tabitabi_tv_01_elaina=Trim(majo_no_tabitabi_tv_01,2186,2294)
majo_no_tabitabi_tv_01_robetta=Trim(majo_no_tabitabi_tv_01,3234,3329) #96 op
majo_no_tabitabi_tv_01_robetta_harbor=Trim(majo_no_tabitabi_tv_01,3330,3365)
majo_no_tabitabi_tv_01_robetta_downtown=Trim(majo_no_tabitabi_tv_01,3396,3431)
majo_no_tabitabi_tv_01_elaina_fly_over_river=Trim(majo_no_tabitabi_tv_01,5323,5432)
majo_no_tabitabi_tv_01_elaina_fly_over_forest=Trim(majo_no_tabitabi_tv_01,5487,5540)
majo_no_tabitabi_tv_01_elaina_see_fran_play_with_bufferflies=Trim(majo_no_tabitabi_tv_01,5750,5839)
majo_no_tabitabi_tv_01_fran_play_with_bufferflies=Trim(majo_no_tabitabi_tv_01,5886,5949)
majo_no_tabitabi_tv_01_elaina_read_book_in_room=Trim(majo_no_tabitabi_tv_01,8564,8662)
majo_no_tabitabi_tv_01_birds_on_tree=Trim(majo_no_tabitabi_tv_01,9324,9388)
majo_no_tabitabi_tv_01_fran_call_elaina_when_she_read_book_under_tree=Trim(majo_no_tabitabi_tv_01,10370,10512)
majo_no_tabitabi_tv_01_wand_fly_in_rain=Trim(majo_no_tabitabi_tv_01,17452,17489)
majo_no_tabitabi_tv_01_elaina_see_grass_fly=Trim(majo_no_tabitabi_tv_01,17490,17523) #34 op
majo_no_tabitabi_tv_01_elaina_and_fran_see_fall=Trim(majo_no_tabitabi_tv_01,22754,23328) #575 op
majo_no_tabitabi_tv_01_grass_and_sky=Trim(majo_no_tabitabi_tv_01,25088,25244)
majo_no_tabitabi_tv_01_elaina_and_fran_read_book_on_swing=Trim(majo_no_tabitabi_tv_01,26249,26307) #59 op
majo_no_tabitabi_tv_01_elaina_see_fran_control_meteor=Trim(majo_no_tabitabi_tv_01,26552,26708) #157 op
majo_no_tabitabi_tv_01_elaina_attack_fran=Trim(majo_no_tabitabi_tv_01,26990,27078)
majo_no_tabitabi_tv_01_victorica_give_elaina_a_note=Trim(majo_no_tabitabi_tv_01,33119,33356)

majo_no_tabitabi_tv_02_elaina_introduce_herself=Trim(majo_no_tabitabi_tv_02,530,862) #333
majo_no_tabitabi_tv_02_elaina_see_country_for_mages=Trim(majo_no_tabitabi_tv_02,3547,3628)
majo_no_tabitabi_tv_02_elaina_see_gate_of_country_for_mages=Trim(majo_no_tabitabi_tv_02,4139,4274) #136 op
majo_no_tabitabi_tv_02_elaina_see_inside_of_country_for_mages=Trim(majo_no_tabitabi_tv_02,4521,4636) #116
majo_no_tabitabi_tv_02_elaina_fly_over_downtown_of_country_for_mages=Trim(majo_no_tabitabi_tv_02,4859,4929) #71
majo_no_tabitabi_tv_02_elaina_take_bath_01=Trim(majo_no_tabitabi_tv_02,12577,12639)
majo_no_tabitabi_tv_02_elaina_take_bath_02=Trim(majo_no_tabitabi_tv_02,12724,12893)
majo_no_tabitabi_tv_02_witches_training=Trim(majo_no_tabitabi_tv_02,16604,16795)
majo_no_tabitabi_tv_02_saya_and_elaina_flying=Trim(majo_no_tabitabi_tv_02,17886,17957)
majo_no_tabitabi_tv_02_saya_follow_elaina_fly_high=Trim(majo_no_tabitabi_tv_02,18300,18386) #87 op
majo_no_tabitabi_tv_02_elaina_see_saya_fly_under_rainbow=Trim(majo_no_tabitabi_tv_02,19124,19267)
majo_no_tabitabi_tv_02_elaina_talk_with_saya_on_bed=Trim(majo_no_tabitabi_tv_02,26375,26530)
majo_no_tabitabi_tv_02_elaina_gift_witch_hat_to_saya=Trim(majo_no_tabitabi_tv_02,28649,28777) #129
majo_no_tabitabi_tv_02_saya_see_elaina_call_her_witch_hat=Trim(majo_no_tabitabi_tv_02,29057,29146) #90 op
majo_no_tabitabi_tv_02_saya_cry_and_hug_elaina=Trim(majo_no_tabitabi_tv_02,29869,29987) #119 op
majo_no_tabitabi_tv_02_elaina_put_book_on_desk_and_blow_out_candle=Trim(majo_no_tabitabi_tv_02,30721,30848) #128 op

majo_no_tabitabi_tv_03_elaina_introduce_herself=Trim(majo_no_tabitabi_tv_03,849,1104) #333 op
majo_no_tabitabi_tv_03_girl_in_flower_sea=Trim(majo_no_tabitabi_tv_03,3932,3997) #66
majo_no_tabitabi_tv_03_elaina_try_to_take_flower_back=Trim(majo_no_tabitabi_tv_03,6645,6802) #158
majo_no_tabitabi_tv_03_elaina_write_note=Trim(majo_no_tabitabi_tv_03,9322,9374) #53
majo_no_tabitabi_tv_03_flower_eat_people=Trim(majo_no_tabitabi_tv_03,9854,9997)
majo_no_tabitabi_tv_03_ink_fall_onto_note=Trim(majo_no_tabitabi_tv_03,10063,10123) #61 op
majo_no_tabitabi_tv_03_elaina_land_in_village=Trim(majo_no_tabitabi_tv_03,16520,16596)
majo_no_tabitabi_tv_03_elaina_kirakira=Trim(majo_no_tabitabi_tv_03,17114,17214)
majo_no_tabitabi_tv_03_elaina_revert_broken_teapot=Trim(majo_no_tabitabi_tv_03,25777,25895) #119 op

majo_no_tabitabi_tv_04_elaina_reach_empty_country=Trim(majo_no_tabitabi_tv_04,3500,3618)
majo_no_tabitabi_tv_04_elaina_feel_cold=Trim(majo_no_tabitabi_tv_04,4456,4740) #285 op
majo_no_tabitabi_tv_04_elaina_see_palace=Trim(majo_no_tabitabi_tv_04,4741,4920)
majo_no_tabitabi_tv_04_elaina_fly_onto_palace_stair=Trim(majo_no_tabitabi_tv_04,4921,5112)
majo_no_tabitabi_tv_04_elaina_walk_across_barrier=Trim(majo_no_tabitabi_tv_04,5333,5439) #107
majo_no_tabitabi_tv_04_palace=Trim(majo_no_tabitabi_tv_04,5559,5612)
majo_no_tabitabi_tv_04_elaina_walk_toward_palace_entry=Trim(majo_no_tabitabi_tv_04,5613,5720)
majo_no_tabitabi_tv_04_elaina_use_fire_to_break_door=Trim(majo_no_tabitabi_tv_04,6046,6105)
majo_no_tabitabi_tv_04_elaina_walk_in_palace=Trim(majo_no_tabitabi_tv_04,6442,6512)
majo_no_tabitabi_tv_04_elaina_use_zoom_in_len=Trim(majo_no_tabitabi_tv_04,10284,10365) #82
majo_no_tabitabi_tv_04_moon=Trim(majo_no_tabitabi_tv_04,14214,14321)
majo_no_tabitabi_tv_04_elaina_jump_onto_bed=Trim(majo_no_tabitabi_tv_04,15095,15238) #144 op
majo_no_tabitabi_tv_04_empty_country_morning=Trim(majo_no_tabitabi_tv_04,15640,15735)
majo_no_tabitabi_tv_04_elaina_see_mirarose_cooking=Trim(majo_no_tabitabi_tv_04,15976,16057)
majo_no_tabitabi_tv_04_bacon=Trim(majo_no_tabitabi_tv_04,17221,17407) #187
majo_no_tabitabi_tv_04_automatically_drag_hole=Trim(majo_no_tabitabi_tv_04,18524,18656) #133
majo_no_tabitabi_tv_04_automatically_move_soil=Trim(majo_no_tabitabi_tv_04,18686,18754) #69
majo_no_tabitabi_tv_04_automatically_place_soil=Trim(majo_no_tabitabi_tv_04,18784,18841) #58
majo_no_tabitabi_tv_04_elaina_control_hole_dragging=Trim(majo_no_tabitabi_tv_04,18842,18933) #92 op
majo_no_tabitabi_tv_04_moon_and_palace_roof=Trim(majo_no_tabitabi_tv_04,21122,21130)
majo_no_tabitabi_tv_04_mirarose_call_swords=Trim(majo_no_tabitabi_tv_04,26743,26813) #71 op
majo_no_tabitabi_tv_04_mirarose_make_swords_fly_toward=Trim(majo_no_tabitabi_tv_04,26944,26983) #40
majo_no_tabitabi_tv_04_javalier_s_head_fly_over_elaina=Trim(majo_no_tabitabi_tv_04,28032,28099)
majo_no_tabitabi_tv_04_elaina_leave_empty_country=Trim(majo_no_tabitabi_tv_04,32115,32366)

majo_no_tabitabi_tv_05_elaina_open_book=Trim(majo_no_tabitabi_tv_05,464,643)
majo_no_tabitabi_tv_05_elaina_see_magician_school=Trim(majo_no_tabitabi_tv_05,4962,5069)
majo_no_tabitabi_tv_05_elaina_fly_and_swing_her_leg=Trim(majo_no_tabitabi_tv_05,6054,6196)
majo_no_tabitabi_tv_05_students_surround_elaina=Trim(majo_no_tabitabi_tv_05,7818,7889)
majo_no_tabitabi_tv_05_students_fly_to_catch_elaina=Trim(majo_no_tabitabi_tv_05,8706,8750) #45 op
majo_no_tabitabi_tv_05_elaina_fly_along_river=Trim(majo_no_tabitabi_tv_05,8818,8868) #51 op
majo_no_tabitabi_tv_05_elaina_falling=Trim(majo_no_tabitabi_tv_05,9248,9282) #35
majo_no_tabitabi_tv_05_elaina_catch_broom_and_fly_away=Trim(majo_no_tabitabi_tv_05,9308,9331) #24
majo_no_tabitabi_tv_05_students_surround_and_follow_elaina=Trim(majo_no_tabitabi_tv_05,9694,9765)
majo_no_tabitabi_tv_05_elaina_want_to_leave_students=Trim(majo_no_tabitabi_tv_05,10434,10675)
majo_no_tabitabi_tv_05_students_see_elaina_meet_fran=Trim(majo_no_tabitabi_tv_05,11055,11159)
majo_no_tabitabi_tv_05_fran_and_elaina_traning_students=Trim(majo_no_tabitabi_tv_05,20207,20275)
majo_no_tabitabi_tv_05_fran_and_elaina_teach_magic_01=Trim(majo_no_tabitabi_tv_05,23161,23208) #48
majo_no_tabitabi_tv_05_fran_and_elaina_teach_magic_02=Trim(majo_no_tabitabi_tv_05,23425,23475) #51
majo_no_tabitabi_tv_05_fran_and_elaina_fly_together=Trim(majo_no_tabitabi_tv_05,23958,24040)
majo_no_tabitabi_tv_05_fran_and_elaina_see_sunset=Trim(majo_no_tabitabi_tv_05,24041,24913) #873 op
majo_no_tabitabi_tv_05_elaina_see_petal_01=Trim(majo_no_tabitabi_tv_05,29398,29516)
majo_no_tabitabi_tv_05_elaina_see_petal_02=Trim(majo_no_tabitabi_tv_05,29517,29587) #71 op
majo_no_tabitabi_tv_05_elaina_see_fran_release_petal=Trim(majo_no_tabitabi_tv_05,29588,29688)

majo_no_tabitabi_tv_06_boat_01=Trim(majo_no_tabitabi_tv_06,54,97) #44
majo_no_tabitabi_tv_06_boat_02=Trim(majo_no_tabitabi_tv_06,98,145) #48
majo_no_tabitabi_tv_06_elaina_read_info=Trim(majo_no_tabitabi_tv_06,266,372)
majo_no_tabitabi_tv_06_entry_of_land_of_truth_tellers=Trim(majo_no_tabitabi_tv_06,373,540)
majo_no_tabitabi_tv_06_land_of_truth_tellers=Trim(majo_no_tabitabi_tv_06,1513,1581)
majo_no_tabitabi_tv_06_saya_falling=Trim(majo_no_tabitabi_tv_06,9573,9674) #102
majo_no_tabitabi_tv_06_saya_use_magic=Trim(majo_no_tabitabi_tv_06,9761,9796) #36 op
majo_no_tabitabi_tv_06_palace=Trim(majo_no_tabitabi_tv_06,14433,14480)
majo_no_tabitabi_tv_06_palace_corridor=Trim(majo_no_tabitabi_tv_06,14481,14540)
majo_no_tabitabi_tv_06_eihemia_draw_magic_circle=Trim(majo_no_tabitabi_tv_06,15473,15650) #178 op
majo_no_tabitabi_tv_06_king_s_sword_spin=Trim(majo_no_tabitabi_tv_06,15757,15851) #95
majo_no_tabitabi_tv_06_elaina_saya_eihemia_walk_in_palace_corridor_01=Trim(majo_no_tabitabi_tv_06,21204,21297) #94
majo_no_tabitabi_tv_06_elaina_saya_eihemia_walk_in_palace_corridor_02=Trim(majo_no_tabitabi_tv_06,21357,21692) #336
majo_no_tabitabi_tv_06_elaina_block_sword_wave=Trim(majo_no_tabitabi_tv_06,23952,23991)
majo_no_tabitabi_tv_06_saya_release_water_cylinder=Trim(majo_no_tabitabi_tv_06,24083,24153) #71 op
majo_no_tabitabi_tv_06_saya_kirakira=Trim(majo_no_tabitabi_tv_06,25232,25266)
majo_no_tabitabi_tv_06_guards_surround_elaina_saya_eihemia=Trim(majo_no_tabitabi_tv_06,25722,25892)
majo_no_tabitabi_tv_06_saya_help_elaina_wear_necklace=Trim(majo_no_tabitabi_tv_06,30492,30563) #72 op
majo_no_tabitabi_tv_06_saya_want_elaina_to_promise=Trim(majo_no_tabitabi_tv_06,31130,31332) #203 op
majo_no_tabitabi_tv_06_saya_and_elaina_make_deal=Trim(majo_no_tabitabi_tv_06,31668,31811) #144

majo_no_tabitabi_tv_07_victorica_take_knife=Trim(majo_no_tabitabi_tv_07,1572,1660)
majo_no_tabitabi_tv_07_saya_s_dolphin_neckless=Trim(majo_no_tabitabi_tv_07,7375,7408) #34
majo_no_tabitabi_tv_07_saya_see_wall=Trim(majo_no_tabitabi_tv_07,7709,7929)
majo_no_tabitabi_tv_07_saya_raise_hand_in_front_of_wall=Trim(majo_no_tabitabi_tv_07,10201,10365) #165 op
majo_no_tabitabi_tv_07_saya_raise_hand_in_front_of_wall_under_sky=Trim(majo_no_tabitabi_tv_07,10366,10413) #48
majo_no_tabitabi_tv_07_saya_fly_over_wall=Trim(majo_no_tabitabi_tv_07,10820,10962) #143
majo_no_tabitabi_tv_07_elaina_see_country_of_wall=Trim(majo_no_tabitabi_tv_07,11518,11613)
majo_no_tabitabi_tv_07_wall=Trim(majo_no_tabitabi_tv_07,13829,13909) #81
majo_no_tabitabi_tv_07_elaina_see_remain_wall=Trim(majo_no_tabitabi_tv_07,15926,16015) #90
majo_no_tabitabi_tv_07_elaina_buy_block_of_wall=Trim(majo_no_tabitabi_tv_07,16757,16842) #86 op
majo_no_tabitabi_tv_07_grape_field=Trim(majo_no_tabitabi_tv_07,17071,17135)
majo_no_tabitabi_tv_07_grape=Trim(majo_no_tabitabi_tv_07,17136,17182)
majo_no_tabitabi_tv_07_old_man_see_grape=Trim(majo_no_tabitabi_tv_07,17352,17434)
majo_no_tabitabi_tv_07_elaina_see_village_with_grape_field=Trim(majo_no_tabitabi_tv_07,18499,18715)
majo_no_tabitabi_tv_07_elaina_suggest_cute_girl_stomp_grape=Trim(majo_no_tabitabi_tv_07,21286,21522)
majo_no_tabitabi_tv_07_elaina_dress_01=Trim(majo_no_tabitabi_tv_07,22454,22475) #22/148 op
majo_no_tabitabi_tv_07_elaina_dress_02=Trim(majo_no_tabitabi_tv_07,22500,22520) #21/148 op
majo_no_tabitabi_tv_07_elaina_dress_03=Trim(majo_no_tabitabi_tv_07,22548,22652) #105/148 op
majo_no_tabitabi_tv_07_elaina_ready_to_stomp_grape=Trim(majo_no_tabitabi_tv_07,25409,25473)
majo_no_tabitabi_tv_07_elaina_angrily_stomp_grape=Trim(majo_no_tabitabi_tv_07,25510,25545)
majo_no_tabitabi_tv_07_elaina_drunk_and_use_magic=Trim(majo_no_tabitabi_tv_07,29974,30055) #82 op

majo_no_tabitabi_tv_08_elaina_s_leg=Trim(majo_no_tabitabi_tv_08,387,482)
majo_no_tabitabi_tv_08_elaina_eat_bread=Trim(majo_no_tabitabi_tv_08,4488,4641) #154
majo_no_tabitabi_tv_08_elaina_see_doll_near_window=Trim(majo_no_tabitabi_tv_08,8344,8397) #54
majo_no_tabitabi_tv_08_elaina_see_doll_in_store=Trim(majo_no_tabitabi_tv_08,8710,8803)
majo_no_tabitabi_tv_08_elaina_take_witch_hat=Trim(majo_no_tabitabi_tv_08,10694,10764)
majo_no_tabitabi_tv_08_elaina_take_bath=Trim(majo_no_tabitabi_tv_08,12010,12105)
majo_no_tabitabi_tv_08_elaina_write_note=Trim(majo_no_tabitabi_tv_08,12153,12305)
majo_no_tabitabi_tv_08_elaina_read_book=Trim(majo_no_tabitabi_tv_08,12440,12529) #90 op
majo_no_tabitabi_tv_08_elaina_sleep_on_book=Trim(majo_no_tabitabi_tv_08,12530,12601) #72 op
majo_no_tabitabi_tv_08_elaina_see_her_short_hair=Trim(majo_no_tabitabi_tv_08,13877,14023) #147
majo_no_tabitabi_tv_08_elaina_roll_down_to_ground=Trim(majo_no_tabitabi_tv_08,15245,15312)
majo_no_tabitabi_tv_08_elaina_s_dolphin_neckless=Trim(majo_no_tabitabi_tv_08,17056,17104) #49 op
majo_no_tabitabi_tv_08_sheila_see_elaina_wear_witch_dress=Trim(majo_no_tabitabi_tv_08,17337,17457) #121 op
majo_no_tabitabi_tv_08_doll_auction=Trim(majo_no_tabitabi_tv_08,22431,22477)
majo_no_tabitabi_tv_08_elaina_use_magic_to_break_auction=Trim(majo_no_tabitabi_tv_08,24218,24303)
majo_no_tabitabi_tv_08_elaina_stomp_doll_s_head=Trim(majo_no_tabitabi_tv_08,25629,25711)
majo_no_tabitabi_tv_08_elaina_use_magic=Trim(majo_no_tabitabi_tv_08,28118,28258)
majo_no_tabitabi_tv_08_saya_s_dolphin_neckless=Trim(majo_no_tabitabi_tv_08,30340,30384) #45

majo_no_tabitabi_tv_09_elaina_sit_in_front_of_bell_tower=Trim(majo_no_tabitabi_tv_09,587,874) #288
majo_no_tabitabi_tv_09_elaina_hungry=Trim(majo_no_tabitabi_tv_09,875,1042) #168
majo_no_tabitabi_tv_09_paper_on_elaina_s_leg=Trim(majo_no_tabitabi_tv_09,1737,1779) #43 op
majo_no_tabitabi_tv_09_elaina_see_too_much_money=Trim(majo_no_tabitabi_tv_09,4076,4168) #93
majo_no_tabitabi_tv_09_estelle_and_selena_photo=Trim(majo_no_tabitabi_tv_09,6752,6992) #241
majo_no_tabitabi_tv_09_estelle_and_elaina_see_time_machine=Trim(majo_no_tabitabi_tv_09,10187,10372) #186
majo_no_tabitabi_tv_09_elaina_see_estelle_s_blood=Trim(majo_no_tabitabi_tv_09,10829,11103) #275 op
majo_no_tabitabi_tv_09_elaina_see_estelle_launch_time_machine=Trim(majo_no_tabitabi_tv_09,13670,13711) #42
majo_no_tabitabi_tv_09_estelle_hug_selena=Trim(majo_no_tabitabi_tv_09,18071,18166)
majo_no_tabitabi_tv_09_elaina_follow_red_ray=Trim(majo_no_tabitabi_tv_09,22214,22355) #142 op
majo_no_tabitabi_tv_09_estelle_angrily_attack_selena=Trim(majo_no_tabitabi_tv_09,26353,26435)
majo_no_tabitabi_tv_09_elaina_tears=Trim(majo_no_tabitabi_tv_09,31327,31440) #114 op

majo_no_tabitabi_tv_10_sheila_see_saya_fly_away=Trim(majo_no_tabitabi_tv_10,1519,1584)
majo_no_tabitabi_tv_10_students_see_sheila_sit_on_broom=Trim(majo_no_tabitabi_tv_10,4949,5054)
majo_no_tabitabi_tv_10_birds_on_sky=Trim(majo_no_tabitabi_tv_10,6025,6324) #300
majo_no_tabitabi_tv_10_victorica_and_fran_fly_under_moon=Trim(majo_no_tabitabi_tv_10,6867,7015)
majo_no_tabitabi_tv_10_victorica_and_fran_walk_in_ruin=Trim(majo_no_tabitabi_tv_10,7757,7846)
majo_no_tabitabi_tv_10_victorica_fran_sheila_in_street=Trim(majo_no_tabitabi_tv_10,10144,10223)
majo_no_tabitabi_tv_10_victorica_fran_sheila_in_front_of_windmill=Trim(majo_no_tabitabi_tv_10,10844,11069) #226 op
majo_no_tabitabi_tv_10_victorica_fran_sheila_lie_on_grass=Trim(majo_no_tabitabi_tv_10,11184,11279)
majo_no_tabitabi_tv_10_victorica_show_knife_on_leg=Trim(majo_no_tabitabi_tv_10,11802,11931) #130
majo_no_tabitabi_tv_10_take_knife_on_leg=Trim(majo_no_tabitabi_tv_10,11932,11958) #27
majo_no_tabitabi_tv_10_victorica_take_knife_on_leg=Trim(majo_no_tabitabi_tv_10,11959,11984) #26 op
majo_no_tabitabi_tv_10_birds_fly_over_sea=Trim(majo_no_tabitabi_tv_10,12190,12258)
majo_no_tabitabi_tv_10_town_of_freedom_qunorts_01=Trim(majo_no_tabitabi_tv_10,12351,12494)
majo_no_tabitabi_tv_10_town_of_freedom_qunorts_02=Trim(majo_no_tabitabi_tv_10,12543,12626)
majo_no_tabitabi_tv_10_robbed_witch=Trim(majo_no_tabitabi_tv_10,15141,15202)
majo_no_tabitabi_tv_10_robbed_witch_tears=Trim(majo_no_tabitabi_tv_10,15203,15257)
majo_no_tabitabi_tv_10_fran_drink_coffee=Trim(majo_no_tabitabi_tv_10,20000,20117)
majo_no_tabitabi_tv_10_fran_take_knife=Trim(majo_no_tabitabi_tv_10,24908,24948) #41
majo_no_tabitabi_tv_10_sheila_take_knife=Trim(majo_no_tabitabi_tv_10,24949,24989) #41
majo_no_tabitabi_tv_10_town_of_freedom_qunorts_03=Trim(majo_no_tabitabi_tv_10,30421,30571) #151 op
