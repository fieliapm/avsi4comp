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

spy_x_family_season_01_tv_01=FFMS2_VIDEO_SOURCE("src\[Ohys-Raws] Spy x Family (TX 1280x720 x264 AAC)\[Ohys-Raws] Spy x Family - 01 (TX 1280x720 x264 AAC).mp4")
spy_x_family_season_01_tv_02=FFMS2_VIDEO_SOURCE("src\[Ohys-Raws] Spy x Family (TX 1280x720 x264 AAC)\[Ohys-Raws] Spy x Family - 02 (TX 1280x720 x264 AAC).mp4")
spy_x_family_season_01_tv_03=FFMS2_VIDEO_SOURCE("src\[Ohys-Raws] Spy x Family (TX 1280x720 x264 AAC)\[Ohys-Raws] Spy x Family - 03 (TX 1280x720 x264 AAC).mp4")
spy_x_family_season_01_tv_04=FFMS2_VIDEO_SOURCE("src\[Ohys-Raws] Spy x Family (TX 1280x720 x264 AAC)\[Ohys-Raws] Spy x Family - 04 (TX 1280x720 x264 AAC).mp4")
spy_x_family_season_01_tv_05=FFMS2_VIDEO_SOURCE("src\[Ohys-Raws] Spy x Family (TX 1280x720 x264 AAC)\[Ohys-Raws] Spy x Family - 05 (TX 1280x720 x264 AAC).mp4")
spy_x_family_season_01_tv_06=FFMS2_VIDEO_SOURCE("src\[Ohys-Raws] Spy x Family (TX 1280x720 x264 AAC)\[Ohys-Raws] Spy x Family - 06 (TX 1280x720 x264 AAC).mp4")
spy_x_family_season_01_tv_07=FFMS2_VIDEO_SOURCE("src\[Ohys-Raws] Spy x Family (TX 1280x720 x264 AAC)\[Ohys-Raws] Spy x Family - 07 (TX 1280x720 x264 AAC).mp4")
spy_x_family_season_01_tv_08=FFMS2_VIDEO_SOURCE("src\[Ohys-Raws] Spy x Family (TX 1280x720 x264 AAC)\[Ohys-Raws] Spy x Family - 08 (TX 1280x720 x264 AAC).mp4")
spy_x_family_season_01_tv_09=FFMS2_VIDEO_SOURCE("src\[Ohys-Raws] Spy x Family (TX 1280x720 x264 AAC)\[Ohys-Raws] Spy x Family - 09 (TX 1280x720 x264 AAC).mp4")
spy_x_family_season_01_tv_10=FFMS2_VIDEO_SOURCE("src\[Ohys-Raws] Spy x Family (TX 1280x720 x264 AAC)\[Ohys-Raws] Spy x Family - 10 (TX 1280x720 x264 AAC).mp4")
spy_x_family_season_01_tv_11=FFMS2_VIDEO_SOURCE("src\[Ohys-Raws] Spy x Family (TX 1280x720 x264 AAC)\[Ohys-Raws] Spy x Family - 11 (TX 1280x720 x264 AAC).mp4")
spy_x_family_season_01_tv_12=FFMS2_VIDEO_SOURCE("src\[Ohys-Raws] Spy x Family (TX 1280x720 x264 AAC)\[Ohys-Raws] Spy x Family - 12 END (TX 1280x720 x264 AAC).mp4")


spy_x_family_season_01_tv_clean_op=Trim(spy_x_family_season_01_tv_02,0,2156)
spy_x_family_season_01_tv_clean_ed=Trim(spy_x_family_season_01_tv_03,32606,34762)
spy_x_family_season_01_tv_clean_ed_sp=Trim(spy_x_family_season_01_tv_01,31693,33024)

######## Trim ########

spy_x_family_season_01_tv_clean_ed_sp_01=Trim(spy_x_family_season_01_tv_clean_ed_sp,0,61)
spy_x_family_season_01_tv_clean_ed_sp_02=Trim(spy_x_family_season_01_tv_clean_ed_sp,62,586)
spy_x_family_season_01_tv_clean_ed_sp_03=Trim(spy_x_family_season_01_tv_clean_ed_sp,587,1109) #523
spy_x_family_season_01_tv_clean_ed_sp_04=Trim(spy_x_family_season_01_tv_clean_ed_sp,1110,0)

spy_x_family_season_01_tv_clean_ed_01=Trim(spy_x_family_season_01_tv_clean_ed,0,585)
spy_x_family_season_01_tv_clean_ed_02=Trim(spy_x_family_season_01_tv_clean_ed,586,650)
spy_x_family_season_01_tv_clean_ed_03=Trim(spy_x_family_season_01_tv_clean_ed,651,959)
spy_x_family_season_01_tv_clean_ed_04=Trim(spy_x_family_season_01_tv_clean_ed,960,1336)
spy_x_family_season_01_tv_clean_ed_05=Trim(spy_x_family_season_01_tv_clean_ed,1337,1397)
spy_x_family_season_01_tv_clean_ed_06=Trim(spy_x_family_season_01_tv_clean_ed,1398,0)



spy_x_family_season_01_tv_01_loid_see_anya=Trim(spy_x_family_season_01_tv_01,12788,12931) #144
spy_x_family_season_01_tv_01_anya_turn_back_and_see_researchers=Trim(spy_x_family_season_01_tv_01,20282,20385) #104
spy_x_family_season_01_tv_01_tram=Trim(spy_x_family_season_01_tv_01,29616,29747) #132
spy_x_family_season_01_tv_01_anya_and_loid_take_tram=Trim(spy_x_family_season_01_tv_01,29748,29945) #198 ed
spy_x_family_season_01_tv_01_loid_hold_anya_high_01=Trim(spy_x_family_season_01_tv_01,31192,31335) #144 ed
spy_x_family_season_01_tv_01_loid_hold_anya_high_02=Trim(spy_x_family_season_01_tv_01,31336,31395) #60

spy_x_family_season_01_tv_02_yor_prepare_cafe_and_discuss_with_colleague=Trim(spy_x_family_season_01_tv_02,4337,4444) #108
spy_x_family_season_01_tv_02_loid_remember_yor_s_personal_data=Trim(spy_x_family_season_01_tv_02,14886,15047) #162
spy_x_family_season_01_tv_02_anya_wakuwaku=Trim(spy_x_family_season_01_tv_02,16737,16820) #84
spy_x_family_season_01_tv_02_anya_feel_lonely=Trim(spy_x_family_season_01_tv_02,17103,17189) #87
spy_x_family_season_01_tv_02_loid_and_yor_see_anya_feel_lonely=Trim(spy_x_family_season_01_tv_02,17190,17569) #380
spy_x_family_season_01_tv_02_yor_waiting_in_street=Trim(spy_x_family_season_01_tv_02,21052,21147) #96 ed
spy_x_family_season_01_tv_02_loid_give_yor_ring_01=Trim(spy_x_family_season_01_tv_02,34299,34382) #84
spy_x_family_season_01_tv_02_loid_give_yor_ring_02=Trim(spy_x_family_season_01_tv_02,34383,34502) #120 ed

spy_x_family_season_01_tv_03_anya_odekeke=Trim(spy_x_family_season_01_tv_03,14913,15057) #145 ed
spy_x_family_season_01_tv_03_loid_yor_anya_take_photo=Trim(spy_x_family_season_01_tv_03,21568,21671) #104
spy_x_family_season_01_tv_03_loid_yor_anya_see_city=Trim(spy_x_family_season_01_tv_03,24113,24179) #67
spy_x_family_season_01_tv_03_anya_say_people_look_like_bits_of_trash=Trim(spy_x_family_season_01_tv_03,24180,24358) #179 ed

spy_x_family_season_01_tv_04_people_enter_eden_academy=Trim(spy_x_family_season_01_tv_04,3159,3276) #118
spy_x_family_season_01_tv_04_loid_yor_anya_walking=Trim(spy_x_family_season_01_tv_04,10313,10393) #81
spy_x_family_season_01_tv_04_anya_stroke_dairy_cattle=Trim(spy_x_family_season_01_tv_04,13195,13302) #108
spy_x_family_season_01_tv_04_loid_yor_anya_happy=Trim(spy_x_family_season_01_tv_04,17684,17813) #137 ed
spy_x_family_season_01_tv_04_anya_cry_01=Trim(spy_x_family_season_01_tv_04,26577,26672) #130
spy_x_family_season_01_tv_04_anya_cry_02=Trim(spy_x_family_season_01_tv_04,26757,26852) #96 ed

spy_x_family_season_01_tv_05_loid_hold_anya_high=Trim(spy_x_family_season_01_tv_05,9358,9449) #92
spy_x_family_season_01_tv_05_castle=Trim(spy_x_family_season_01_tv_05,11610,11689) #80
spy_x_family_season_01_tv_05_anya_open_arms=Trim(spy_x_family_season_01_tv_05,11834,11890) #57
spy_x_family_season_01_tv_05_army_surround_castle=Trim(spy_x_family_season_01_tv_05,17623,17746) #124
spy_x_family_season_01_tv_05_loid_see_franky_kidnap_anya_yor=Trim(spy_x_family_season_01_tv_05,21704,21790) #87
spy_x_family_season_01_tv_05_rail_and_balloon=Trim(spy_x_family_season_01_tv_05,23235,23338) #104
spy_x_family_season_01_tv_05_castle_and_fireworks=Trim(spy_x_family_season_01_tv_05,30720,30869) #150
spy_x_family_season_01_tv_05_anya_and_loid_see_fireworks=Trim(spy_x_family_season_01_tv_05,30924,31064) #141 ed
spy_x_family_season_01_tv_05_anya_and_loid_see_lake=Trim(spy_x_family_season_01_tv_05,31486,31577) #92
spy_x_family_season_01_tv_05_anya_and_loid_see_lake_and_shooting_star=Trim(spy_x_family_season_01_tv_05,31752,31901) #150
spy_x_family_season_01_tv_05_loid_hug_anya=Trim(spy_x_family_season_01_tv_05,31902,32006) #105 ed

spy_x_family_season_01_tv_06_eden_academy=Trim(spy_x_family_season_01_tv_06,8930,9254) #325 ed
spy_x_family_season_01_tv_06_eden_academy_students=Trim(spy_x_family_season_01_tv_06,9255,9598) #344
spy_x_family_season_01_tv_06_eden_academy_award_rule=Trim(spy_x_family_season_01_tv_06,9599,9844) #246
spy_x_family_season_01_tv_06_anya_wear_suit_01=Trim(spy_x_family_season_01_tv_06,10532,10549) #18
spy_x_family_season_01_tv_06_anya_wear_suit_02=Trim(spy_x_family_season_01_tv_06,10550,10564) #15
spy_x_family_season_01_tv_06_anya_wear_suit_03=Trim(spy_x_family_season_01_tv_06,10565,10612) #48 ed
spy_x_family_season_01_tv_06_eden_academy_clock_tower=Trim(spy_x_family_season_01_tv_06,30788,30850) #63

spy_x_family_season_01_tv_07_eden_acadeny_bus=Trim(spy_x_family_season_01_tv_07,5464,5607) #144 ed
spy_x_family_season_01_tv_07_anya_cry_01=Trim(spy_x_family_season_01_tv_07,17721,17792) #72
spy_x_family_season_01_tv_07_anya_cry_02=Trim(spy_x_family_season_01_tv_07,19099,19205) #107 ed
spy_x_family_season_01_tv_07_anya_dizzy=Trim(spy_x_family_season_01_tv_07,21414,21850) #437

spy_x_family_season_01_tv_08_yuri_asking=Trim(spy_x_family_season_01_tv_08,10378,10519) #142
spy_x_family_season_01_tv_08_city=Trim(spy_x_family_season_01_tv_08,24136,24257) #122
spy_x_family_season_01_tv_08_yuri_waking_in_street=Trim(spy_x_family_season_01_tv_08,24258,24365) #108
spy_x_family_season_01_tv_08_yuri_is_secret_police_01=Trim(spy_x_family_season_01_tv_08,26031,26186) #156
spy_x_family_season_01_tv_08_yuri_is_secret_police_02=Trim(spy_x_family_season_01_tv_08,26187,26618) #432 ed

spy_x_family_season_01_tv_09_yor_slap_yuri=Trim(spy_x_family_season_01_tv_09,5916,5981) #66
spy_x_family_season_01_tv_09_anya_sleeping=Trim(spy_x_family_season_01_tv_09,11436,11561) #126
spy_x_family_season_01_tv_09_yor_sleeping=Trim(spy_x_family_season_01_tv_09,11562,11693) #132
spy_x_family_season_01_tv_09_loid_read_book=Trim(spy_x_family_season_01_tv_09,11694,11735) #42
spy_x_family_season_01_tv_09_anya_take_bus=Trim(spy_x_family_season_01_tv_09,17178,17285) #108
spy_x_family_season_01_tv_09_yor_discuss_with_colleague=Trim(spy_x_family_season_01_tv_09,20473,20588) #116
spy_x_family_season_01_tv_09_yor_and_loid_walking_under_sunset=Trim(spy_x_family_season_01_tv_09,31493,31636) #144 ed

spy_x_family_season_01_tv_10_henry_make_tea=Trim(spy_x_family_season_01_tv_10,1362,1413) #52
spy_x_family_season_01_tv_10_henry_hear_music=Trim(spy_x_family_season_01_tv_10,4858,5025) #168
spy_x_family_season_01_tv_10_yor_and_anya_jogging=Trim(spy_x_family_season_01_tv_10,11366,11512) #147 ed
spy_x_family_season_01_tv_10_yor_and_anya_see_sunset=Trim(spy_x_family_season_01_tv_10,13309,13380) #72

spy_x_family_season_01_tv_11_anya_target_star=Trim(spy_x_family_season_01_tv_11,3606,3941) #336
spy_x_family_season_01_tv_11_anya_shake_her_leg=Trim(spy_x_family_season_01_tv_11,4219,4301) #83
spy_x_family_season_01_tv_11_anya_planning_cheat=Trim(spy_x_family_season_01_tv_11,5043,5360) #318
spy_x_family_season_01_tv_11_anya_jump_into_pool=Trim(spy_x_family_season_01_tv_11,15513,15764) #252
spy_x_family_season_01_tv_11_anya_get_star=Trim(spy_x_family_season_01_tv_11,17998,18213) #216
spy_x_family_season_01_tv_11_everyone_see_anya_walking=Trim(spy_x_family_season_01_tv_11,22084,22371) #288
spy_x_family_season_01_tv_11_becky_and_anya_walking=Trim(spy_x_family_season_01_tv_11,22954,23127) #174
spy_x_family_season_01_tv_11_damian_see_anya_bring_dog=Trim(spy_x_family_season_01_tv_11,28771,28973) #203 ed

spy_x_family_season_01_tv_12_loid_yor_anya_darkside=Trim(spy_x_family_season_01_tv_12,7149,7367) #219 ed
spy_x_family_season_01_tv_12_anya_exciting_in_aquarium=Trim(spy_x_family_season_01_tv_12,13489,13530) #42
spy_x_family_season_01_tv_12_anya_dash_in_aquarium=Trim(spy_x_family_season_01_tv_12,13531,13722) #192
spy_x_family_season_01_tv_12_yor_and_anya_happy=Trim(spy_x_family_season_01_tv_12,26343,26414) #72 ed
spy_x_family_season_01_tv_12_anya_drag_penguin_doll=Trim(spy_x_family_season_01_tv_12,29968,30092) #125
