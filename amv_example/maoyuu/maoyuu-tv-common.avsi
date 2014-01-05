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

maoyuu_tv_01=FFMS2_VIDEO_SOURCE("src\anime\[Zero-Raws] Maoyuu Maou Yuusha - 01 (MX 1280x720 x264 AAC).mp4")
maoyuu_tv_02=FFMS2_VIDEO_SOURCE("src\anime\[Zero-Raws] Maoyuu Maou Yuusha - 02 (MX 1280x720 x264 AAC).mp4")
maoyuu_tv_03=FFMS2_VIDEO_SOURCE("src\anime\[Zero-Raws] Maoyuu Maou Yuusha - 03 (MX 1280x720 x264 AAC).mp4")
maoyuu_tv_04=FFMS2_VIDEO_SOURCE("src\anime\[Zero-Raws] Maoyuu Maou Yuusha - 04 (MX 1280x720 x264 AAC).mp4")
maoyuu_tv_05=FFMS2_VIDEO_SOURCE("src\anime\[Zero-Raws] Maoyuu Maou Yuusha - 05 (MX 1280x720 x264 AAC).mp4")
maoyuu_tv_05_cache02=FFMS2_VIDEO_SOURCE("src\anime\[Zero-Raws] Maoyuu Maou Yuusha - 05 (MX 1280x720 x264 AAC).mp4")
maoyuu_tv_06=FFMS2_VIDEO_SOURCE("src\anime\[Zero-Raws] Maoyuu Maou Yuusha - 06 (MX 1280x720 x264 AAC).mp4")
maoyuu_tv_07=FFMS2_VIDEO_SOURCE("src\anime\[Zero-Raws] Maoyuu Maou Yuusha - 07 (MX 1280x720 x264 AAC).mp4")
maoyuu_tv_07_cache02=FFMS2_VIDEO_SOURCE("src\anime\[Zero-Raws] Maoyuu Maou Yuusha - 07 (MX 1280x720 x264 AAC).mp4")
maoyuu_tv_08=FFMS2_VIDEO_SOURCE("src\anime\[Zero-Raws] Maoyuu Maou Yuusha - 08 (MX 1280x720 x264 AAC).mp4")
maoyuu_tv_09=FFMS2_VIDEO_SOURCE("src\anime\[Zero-Raws] Maoyuu Maou Yuusha - 09 (MX 1280x720 x264 AAC).mp4")
maoyuu_tv_09_cache02=FFMS2_VIDEO_SOURCE("src\anime\[Zero-Raws] Maoyuu Maou Yuusha - 09 (MX 1280x720 x264 AAC).mp4")
maoyuu_tv_10=FFMS2_VIDEO_SOURCE("src\anime\[Zero-Raws] Maoyuu Maou Yuusha - 10 (MX 1280x720 x264 AAC).mp4")

maoyuu_tv_clean_op=Trim(maoyuu_tv_01,1868,4025)

######## Trim ########

maoyuu_tv_clean_op_01=Trim(maoyuu_tv_clean_op,0,288)
maoyuu_tv_clean_op_02=Trim(maoyuu_tv_clean_op,289,1049)
maoyuu_tv_clean_op_02_dance=Trim(maoyuu_tv_clean_op,1050,1130)
maoyuu_tv_clean_op_02_review=Trim(maoyuu_tv_clean_op,1131,1153)
maoyuu_tv_clean_op_03=Trim(maoyuu_tv_clean_op,1154,0)



maoyuu_tv_01_yuusha_team=Trim(maoyuu_tv_01,695,925) ## #231
maoyuu_tv_01_yuusha_leave_team_01=Trim(maoyuu_tv_01,1257,1421) #165
maoyuu_tv_01_yuusha_leave_team_02=Trim(maoyuu_tv_01,1422,1529) #108
maoyuu_tv_01_maou_oppai=Trim(maoyuu_tv_01,6768,6799) ## #32
maoyuu_tv_01_become_my_property_i_refuse_01=Trim(maoyuu_tv_01,8105,8384) #280 #cm
maoyuu_tv_01_become_my_property_i_refuse_02=Trim(maoyuu_tv_01,8385,8624) #240 #cm
maoyuu_tv_01_become_my_property_i_refuse_03=Trim(maoyuu_tv_01,8625,8716) #92 #cm
maoyuu_tv_01_onna_mahoutsukai=Trim(maoyuu_tv_01,8919,9347) ## #429
maoyuu_tv_01_yuusha_memory=Trim(maoyuu_tv_01,16026,16254) ## #229
maoyuu_tv_01_island_view=Trim(maoyuu_tv_01,19733,19926) #194
maoyuu_tv_01_explain_the_other_side_of_the_hill=Trim(maoyuu_tv_01,20407,23978) #cm
maoyuu_tv_01_see_the_other_side_of_the_hill=Trim(maoyuu_tv_01,21125,21241) #117
maoyuu_tv_01_go_to_the_other_side_of_the_hill_01=Trim(maoyuu_tv_01,25116,25178) #63
maoyuu_tv_01_go_to_the_other_side_of_the_hill_02=Trim(maoyuu_tv_01,25179,25301) #123
maoyuu_tv_01_maou_point_to_the_other_side_of_the_hill=Trim(maoyuu_tv_01,25716,25868) ## #153
maoyuu_tv_01_maou_and_everyone_point_to_the_other_side_of_the_hill=Trim(maoyuu_tv_01,26025,26184) #160
maoyuu_tv_01_maou_kiss_yuusha_pillow_01=Trim(maoyuu_tv_01,30840,30948) ## #109
maoyuu_tv_01_maou_kiss_yuusha_pillow_02=Trim(maoyuu_tv_01,31249,31414) ## #166 #cm

maoyuu_tv_02_maid_ane_and_imouto_run_01=Trim(maoyuu_tv_02,228,348) #121
maoyuu_tv_02_maid_ane_run=Trim(maoyuu_tv_02,349,393) ## #45
maoyuu_tv_02_maid_imouto_run=Trim(maoyuu_tv_02,394,444) ## #51
maoyuu_tv_02_maid_ane_and_imouto_run_02=Trim(maoyuu_tv_02,445,572) #128
maoyuu_tv_02_maou_and_yuusha_transport=Trim(maoyuu_tv_02,3256,3327) ## #72
maoyuu_tv_02_sky=Trim(maoyuu_tv_02,3588,3632) #45
maoyuu_tv_02_maou_and_yuusha_in_field=Trim(maoyuu_tv_02,4170,4372) ## #203
maoyuu_tv_02_maou_lift_hand_in_bed=Trim(maoyuu_tv_02,7741,7819) #79
maoyuu_tv_02_maou_shy=Trim(maoyuu_tv_02,11918,11977) #60
maoyuu_tv_02_yuusha_sleep_on_maou_leg=Trim(maoyuu_tv_02,14405,14650) #246 #cm
maoyuu_tv_02_maou_kiss_yuusha_sleeping_on_leg_01=Trim(maoyuu_tv_02,15140,15283) #144 #cm
maoyuu_tv_02_maou_kiss_yuusha_sleeping_on_leg_02=Trim(maoyuu_tv_02,15284,15344) #61 #cm
maoyuu_tv_02_maou_kiss_yuusha_sleeping_on_leg_03=Trim(maoyuu_tv_02,15345,15413) #69 #cm
maoyuu_tv_02_maid_ane_and_imouto_catched=Trim(maoyuu_tv_02,16289,16419) #131
maoyuu_tv_02_maid_ane_and_imouto_cry=Trim(maoyuu_tv_02,20816,20935) ## #120
maoyuu_tv_02_sky=Trim(maoyuu_tv_02,24229,24294) #66
maoyuu_tv_02_yuusha_touch_maid_imouto_head=Trim(maoyuu_tv_02,24877,24969) #93
maoyuu_tv_02_maou_teach_maid_ane_and_imouto_memory=Trim(maoyuu_tv_02,24970,25063) #combo #94
maoyuu_tv_02_maid_imouto_image_money=Trim(maoyuu_tv_02,25064,25329) ## #266
maoyuu_tv_02_maou_teach_student=Trim(maoyuu_tv_02,26836,26969) ## #134
maoyuu_tv_02_mazoku_vs_human=Trim(maoyuu_tv_02,27525,27677) #152 #cm

maoyuu_tv_03_lake_map_and_transport_01=Trim(maoyuu_tv_03,4293,4335) #43
maoyuu_tv_03_lake_map_and_transport_02=Trim(maoyuu_tv_03,4336,4406) #71
maoyuu_tv_03_lake_map_and_transport_03=Trim(maoyuu_tv_03,4407,4556) #150
maoyuu_tv_03_church_view=Trim(maoyuu_tv_03,6094,6273) #180
maoyuu_tv_03_shuraba=Trim(maoyuu_tv_03,9154,9227) ## #74
maoyuu_tv_03_church_map=Trim(maoyuu_tv_03,16813,16971) #159
maoyuu_tv_03_maou_vs_onna_kishi_01=Trim(maoyuu_tv_03,18801,18934) #134
maoyuu_tv_03_maou_vs_onna_kishi_02=Trim(maoyuu_tv_03,18935,19084) #150
maoyuu_tv_03_mazoku_and_human_boundry_map=Trim(maoyuu_tv_03,20790,20915) #126
maoyuu_tv_03_doumei_map=Trim(maoyuu_tv_03,21619,21755) #137
maoyuu_tv_03_doumei_propaganda=Trim(maoyuu_tv_03,22794,22857) ## #64
maoyuu_tv_03_girl_collection=Trim(maoyuu_tv_03,22970,23051) #82
maoyuu_tv_03_yuusha_orz=Trim(maoyuu_tv_03,23334,23549) #216
maoyuu_tv_03_maou_show_armor=Trim(maoyuu_tv_03,27996,28054) ## #59
maoyuu_tv_03_maou_have_doubt_about_her_oppai_01=Trim(maoyuu_tv_03,28739,29029) #291
maoyuu_tv_03_maou_have_doubt_about_her_oppai_02=Trim(maoyuu_tv_03,29030,29077) #48
maoyuu_tv_03_maou_have_doubt_about_her_oppai_03=Trim(maoyuu_tv_03,29078,29248) #171
maoyuu_tv_03_chief_maid_touch_maou_oppai_01=Trim(maoyuu_tv_03,29638,29672) ## #35 #cm
maoyuu_tv_03_chief_maid_touch_maou_oppai_02=Trim(maoyuu_tv_03,29673,29814) #142 #cm
maoyuu_tv_03_chief_maid_touch_maou_oppai_03=Trim(maoyuu_tv_03,29815,29877) #63 #cm
maoyuu_tv_03_chief_maid_touch_maou_oppai_04=Trim(maoyuu_tv_03,29878,29949) #72 #cm

maoyuu_tv_04_chief_maid_touch_glasses=Trim(maoyuu_tv_04,456,521) ## #66
maoyuu_tv_04_onna_kishi_angry_01=Trim(maoyuu_tv_04,3515,3559) #45
maoyuu_tv_04_onna_kishi_angry_02=Trim(maoyuu_tv_04,3560,3585) ## #26
maoyuu_tv_04_onna_kishi_break_sword=Trim(maoyuu_tv_04,4150,4174) #25
maoyuu_tv_04_chief_maid_talk_about_maou_oppai=Trim(maoyuu_tv_04,4831,4942) #112
maoyuu_tv_04_chief_maid_say_maou_oppai_is_useless=Trim(maoyuu_tv_04,5158,5202) #45
maoyuu_tv_04_ghost_01=Trim(maoyuu_tv_04,6665,6734) #70
maoyuu_tv_04_great_land_map=Trim(maoyuu_tv_04,8327,8482) #156
maoyuu_tv_04_ghost_02=Trim(maoyuu_tv_04,10948,11019) #72
maoyuu_tv_04_chief_maid_control_ghost=Trim(maoyuu_tv_04,11020,11067) #48
maoyuu_tv_04_young_merchant_kiss=Trim(maoyuu_tv_04,16330,16396) #67
maoyuu_tv_04_windmill=Trim(maoyuu_tv_04,17493,17633) ## #141
maoyuu_tv_04_yuusha_meet_fairy=Trim(maoyuu_tv_04,19644,19699) #56
maoyuu_tv_04_yuusha_vs_archduke_fire_dragon=Trim(maoyuu_tv_04,19700,19759) #60
maoyuu_tv_04_grand_princess_fire_dragon=Trim(maoyuu_tv_04,19760,19867) #108
maoyuu_tv_04_onna_mahoutsukai_in_library=Trim(maoyuu_tv_04,19868,19993) #126
maoyuu_tv_04_maou_cry_01=Trim(maoyuu_tv_04,20497,20664) #168 #cm
maoyuu_tv_04_maou_cry_02=Trim(maoyuu_tv_04,20665,20850) #186 #cm
maoyuu_tv_04_maou_teatime=Trim(maoyuu_tv_04,21479,21556) #78 #cm
maoyuu_tv_04_maid_imouto_dance=Trim(maoyuu_tv_04,26032,26091) ## #60
maoyuu_tv_04_winter_country_map=Trim(maoyuu_tv_04,26524,26595) #72
maoyuu_tv_04_byakuya_country_map=Trim(maoyuu_tv_04,26857,26928) #72
maoyuu_tv_04_maid_ane_talk_with_onna_kishi_01=Trim(maoyuu_tv_04,29985,30092) #108
maoyuu_tv_04_maid_ane_talk_with_onna_kishi_02=Trim(maoyuu_tv_04,30329,30652) ## #324
maoyuu_tv_04_maid_ane_talk_with_onna_kishi_03=Trim(maoyuu_tv_04,30653,30736) #84
maoyuu_tv_04_maid_ane_learn_memory_01=Trim(maoyuu_tv_04,31401,31447) #47
maoyuu_tv_04_maid_ane_learn_memory_02=Trim(maoyuu_tv_04,31448,31508) #61
maoyuu_tv_04_maid_ane_learn_memory_03=Trim(maoyuu_tv_04,31509,31568) #combo #60
maoyuu_tv_04_maid_ane_and_imouto_cry_memory_01=Trim(maoyuu_tv_04,31791,31843) #53
maoyuu_tv_04_maid_ane_and_imouto_cry_memory_02=Trim(maoyuu_tv_04,31844,31887) #combo #44
maoyuu_tv_04_maid_ane_have_doubt_being_human=Trim(maoyuu_tv_04,31888,32005) #118

maoyuu_tv_05_doumei_map=Trim(maoyuu_tv_05,0,50) #51
maoyuu_tv_05_doumei_port=Trim(maoyuu_tv_05,51,180) #130
maoyuu_tv_05_flag=Trim(maoyuu_tv_05,251,415) ## #165
maoyuu_tv_05_byakuya_country_map=Trim(maoyuu_tv_05,5358,5411) #54
maoyuu_tv_05_kaimon_toshi=Trim(maoyuu_tv_05,6651,6799) ## #149
maoyuu_tv_05_kaimon_toshi_downtown=Trim(maoyuu_tv_05,7284,7376) #93
maoyuu_tv_05_mazoku_musume=Trim(maoyuu_tv_05_cache02,7757,7816) ## #60
maoyuu_tv_05_eastern_fortress=Trim(maoyuu_tv_05,8166,8298) ## #133
maoyuu_tv_05_yuusha_and_mazoku_musume=Trim(maoyuu_tv_05,8299,8377) #79
maoyuu_tv_05_kaimon_toshi_temple=Trim(maoyuu_tv_05,8776,8812) ## #37
maoyuu_tv_05_battleship_01=Trim(maoyuu_tv_05,10792,10895) #104
maoyuu_tv_05_battleship_02=Trim(maoyuu_tv_05,10896,10980) #85
maoyuu_tv_05_winter_king_sr_dead=Trim(maoyuu_tv_05,12421,12757) #337
maoyuu_tv_05_onna_kishi_talk_with_maou=Trim(maoyuu_tv_05,13083,13180) #98
maoyuu_tv_05_winter_king=Trim(maoyuu_tv_05,13873,14000) #128
maoyuu_tv_05_maou_lies=Trim(maoyuu_tv_05,17314,17397) #84
maoyuu_tv_05_onna_kishi_show_sword=Trim(maoyuu_tv_05,18291,18410) #120
maoyuu_tv_05_maou_deny=Trim(maoyuu_tv_05,18703,18870) #168
maoyuu_tv_05_onna_kishi_forgive_yuusha_01=Trim(maoyuu_tv_05,19782,19889) #108
maoyuu_tv_05_onna_kishi_forgive_yuusha_02=Trim(maoyuu_tv_05,19890,19961) #72
maoyuu_tv_05_maid_imouto_scare=Trim(maoyuu_tv_05,20737,20796) #60
maoyuu_tv_05_yuusha_doll=Trim(maoyuu_tv_05,21153,21200) #48
maoyuu_tv_05_maou_see_yuusha_pillow=Trim(maoyuu_tv_05,23229,23321) #93 #cm
maoyuu_tv_05_maou_hug_yuusha_pillow=Trim(maoyuu_tv_05,23597,23776) ## #180
maoyuu_tv_05_maou_shy=Trim(maoyuu_tv_05,24175,24270) #96
maoyuu_tv_05_maou_beat_yuusha_with_yuusha_pillow_01=Trim(maoyuu_tv_05,24271,24516) #246 #cm
maoyuu_tv_05_maou_beat_yuusha_with_yuusha_pillow_02=Trim(maoyuu_tv_05,25023,25190) #168 #cm
maoyuu_tv_05_yuusha_say_maou_is_punipuni_01=Trim(maoyuu_tv_05,26038,26541) #504
maoyuu_tv_05_yuusha_say_maou_is_punipuni_02=Trim(maoyuu_tv_05,26542,27061) #520 #cm
maoyuu_tv_05_maou_bed_sport=Trim(maoyuu_tv_05,27062,27166) ## #105 #cm
maoyuu_tv_05_maou_and_yuusha_dance_01=Trim(maoyuu_tv_05,29557,29647) ## #91
maoyuu_tv_05_maou_and_yuusha_dance_02=Trim(maoyuu_tv_05,29648,29738) ## #91
maoyuu_tv_05_maou_and_yuusha_dance_03=Trim(maoyuu_tv_05,29739,29917) ## #179
maoyuu_tv_05_yuusha_transport=Trim(maoyuu_tv_05,31470,31565) #96
maoyuu_tv_05_yuusha_transported_and_leave_maou=Trim(maoyuu_tv_05,31566,31648) ## #83

maoyuu_tv_06_maid_ane_memory_01=Trim(maoyuu_tv_06,4567,4616) #combo #50
maoyuu_tv_06_maid_ane_memory_02=Trim(maoyuu_tv_06,4617,4663) #combo #47
maoyuu_tv_06_maid_ane_memory_03=Trim(maoyuu_tv_06,4664,4716) #combo #53
maoyuu_tv_06_maid_ane_memory_04=Trim(maoyuu_tv_06,4717,4755) #combo #39
maoyuu_tv_06_kaimon_toshi_map=Trim(maoyuu_tv_06,6816,6879) #64
maoyuu_tv_06_yuusha_as_mazoku=Trim(maoyuu_tv_06,7470,7570) #101
maoyuu_tv_06_fairy=Trim(maoyuu_tv_06,8206,8262) ## #57
maoyuu_tv_06_shitsuji_eye=Trim(maoyuu_tv_06,11090,11105) ## #16
maoyuu_tv_06_shitsuji_beaten_by_onna_kishi=Trim(maoyuu_tv_06,11417,11461) ## #55
maoyuu_tv_06_onna_kishi_bring_army=Trim(maoyuu_tv_06,15261,15380) #120
maoyuu_tv_06_cuttlefish=Trim(maoyuu_tv_06,15710,15815) #106
maoyuu_tv_06_fishman=Trim(maoyuu_tv_06,16051,16099) #49
maoyuu_tv_06_eastern_fortress_general_and_assistant=Trim(maoyuu_tv_06,21252,21446) ## #195
maoyuu_tv_06_yuusha_transport=Trim(maoyuu_tv_06,22099,22113) #15
maoyuu_tv_06_yuusha_back=Trim(maoyuu_tv_06,22393,22477) ## #85
maoyuu_tv_06_maou_jealousy=Trim(maoyuu_tv_06,22624,22693) #70
maoyuu_tv_06_onna_kishi_vs_ice_general=Trim(maoyuu_tv_06,24516,24546) #31
maoyuu_tv_06_onna_kishi_use_stone_wall=Trim(maoyuu_tv_06,24905,25070) #166
maoyuu_tv_06_yuusha_hug_sad_maou=Trim(maoyuu_tv_06,27573,27735) #163
maoyuu_tv_06_winter_king_cheers=Trim(maoyuu_tv_06,28515,28574) #60
maoyuu_tv_06_onna_kishi_and_people=Trim(maoyuu_tv_06,31316,31399) ## #84
maoyuu_tv_06_maou_and_people=Trim(maoyuu_tv_06,31400,31471) ## #72
maoyuu_tv_06_shitsuji=Trim(maoyuu_tv_06,31769,31836) #68

maoyuu_tv_07_winter_country=Trim(maoyuu_tv_07,933,1011) #79
maoyuu_tv_07_yuusha_vs_onna_kishi_long=Trim(maoyuu_tv_07,4716,5148) #433 #cm
maoyuu_tv_07_yuusha_vs_onna_kishi_01=Trim(maoyuu_tv_07,4716,4758) ## #43
maoyuu_tv_07_yuusha_vs_onna_kishi_02=Trim(maoyuu_tv_07,4759,4843) ## #85
maoyuu_tv_07_yuusha_vs_onna_kishi_03=Trim(maoyuu_tv_07,4844,4982) ## #139
maoyuu_tv_07_yuusha_vs_onna_kishi_04=Trim(maoyuu_tv_07,4983,5039) #57
maoyuu_tv_07_yuusha_vs_onna_kishi_05=Trim(maoyuu_tv_07,5040,5066) #27
maoyuu_tv_07_yuusha_vs_onna_kishi_06=Trim(maoyuu_tv_07,5067,5148) #82
maoyuu_tv_07_onna_kishi_naked=Trim(maoyuu_tv_07,6159,6261) #103
maoyuu_tv_07_onna_kishi_oppai=Trim(maoyuu_tv_07,6262,6328) ## #67
maoyuu_tv_07_maou_brush_yuusha_hair=Trim(maoyuu_tv_07,10682,10843) ## #162
maoyuu_tv_07_archduke_fire_dragon=Trim(maoyuu_tv_07,11141,11212) ## #72
maoyuu_tv_07_yuusha_and_eastern_fortress_general_eat_food_01=Trim(maoyuu_tv_07,14840,15335) #396 #cm
maoyuu_tv_07_yuusha_and_eastern_fortress_general_eat_food_02=Trim(maoyuu_tv_07,15336,15433) #98 #cm
maoyuu_tv_07_grand_princess_fire_dragon=Trim(maoyuu_tv_07,15434,15499) #66
maoyuu_tv_07_grand_princess_fire_dragon_hug_yuusha=Trim(maoyuu_tv_07,15861,15956) #96
maoyuu_tv_07_iron_country=Trim(maoyuu_tv_07_cache02,19479,19562) ## #84
maoyuu_tv_07_typesetting_01=Trim(maoyuu_tv_07,20211,20340) #130
maoyuu_tv_07_typesetting_02=Trim(maoyuu_tv_07,20341,20402) #62
maoyuu_tv_07_typesetting_03=Trim(maoyuu_tv_07,20459,20569) ## #111
maoyuu_tv_07_maou_jump_and_stop_onna_kishi=Trim(maoyuu_tv_07,22926,23093) #168
maoyuu_tv_07_chief_maid_close_door=Trim(maoyuu_tv_07,23668,23857) #190 #cm
maoyuu_tv_07_maou_and_onna_kishi_snatch_yuusha_01=Trim(maoyuu_tv_07,24658,24737) #80
maoyuu_tv_07_maou_and_onna_kishi_snatch_yuusha_02=Trim(maoyuu_tv_07,25197,25314) #118
maoyuu_tv_07_maou_and_onna_kishi_snatch_yuusha_03=Trim(maoyuu_tv_07,25673,25924) #252
maoyuu_tv_07_maou_and_onna_kishi_snatch_yuusha_04=Trim(maoyuu_tv_07,26391,26486) ## #96
maoyuu_tv_07_maou_give_ring_to_maid_ane_01=Trim(maoyuu_tv_07,28493,28532) #40
maoyuu_tv_07_maou_give_ring_to_maid_ane_02=Trim(maoyuu_tv_07,28533,28672) ## #140
maoyuu_tv_07_maou_give_ring_to_maid_ane_03=Trim(maoyuu_tv_07,28673,28800) #128
maoyuu_tv_07_byakuya_country_map_audio_01=Trim(maoyuu_tv_07,29992,30052) #61
maoyuu_tv_07_byakuya_country_map_audio_02=Trim(maoyuu_tv_07,30053,30114) #62
maoyuu_tv_07_byakuya_country_map_audio=maoyuu_tv_07_byakuya_country_map_audio_01+maoyuu_tv_07_byakuya_country_map_audio_02 #123

maoyuu_tv_08_maou_house=Trim(maoyuu_tv_08,117,212) #96
maoyuu_tv_08_maid_imouto_almost_fall_off=Trim(maoyuu_tv_08,792,968) #177
maoyuu_tv_08_aurora_01=Trim(maoyuu_tv_08,9523,9702) #180
maoyuu_tv_08_aurora_02=Trim(maoyuu_tv_08,9703,9774) #72
maoyuu_tv_08_yuusha_and_young_merchant_below_aurora=Trim(maoyuu_tv_08,10121,10168) ## #48
maoyuu_tv_08_grand_princess_fire_dragon_and_party_staff_01=Trim(maoyuu_tv_08,12751,12917) ## #167
maoyuu_tv_08_grand_princess_fire_dragon_and_party_staff_02=Trim(maoyuu_tv_08,12918,13078) #161
maoyuu_tv_08_maou_meet_onna_mahoutsukai=Trim(maoyuu_tv_08,13558,13656) ## #99
maoyuu_tv_08_party=Trim(maoyuu_tv_08,13968,14110) #143 #cm
maoyuu_tv_08_grand_princess_fire_dragon_pour_wine_for_young_merchant=Trim(maoyuu_tv_08,14111,14230) #120 #cm
maoyuu_tv_08_grand_princess_fire_dragon_and_mazoku_musume_oppai=Trim(maoyuu_tv_08,14722,14793) ## #72
maoyuu_tv_08_aurora_03=Trim(maoyuu_tv_08,14917,15036) #120
maoyuu_tv_08_maou_castle_outside=Trim(maoyuu_tv_08,16590,16671) #82
maoyuu_tv_08_maou_castle_inside=Trim(maoyuu_tv_08,17227,17307) #81
maoyuu_tv_08_maou_enter_grave=Trim(maoyuu_tv_08,18576,18743) ## #168
maoyuu_tv_08_onna_kishi_cry=Trim(maoyuu_tv_08,21565,21710) #146
maoyuu_tv_08_onna_kishi_laugh=Trim(maoyuu_tv_08,23083,23165) #83
maoyuu_tv_08_letter=Trim(maoyuu_tv_08,27756,28043) #288
maoyuu_tv_08_ring=Trim(maoyuu_tv_08,28381,28474) #94
maoyuu_tv_08_maid_ane_and_imouto_hug=Trim(maoyuu_tv_08,31778,31849) #72

maoyuu_tv_09_winter_country_capital_city=Trim(maoyuu_tv_09,5047,5104) #58
maoyuu_tv_09_winter_country_capital_city_plaza=Trim(maoyuu_tv_09,5105,5154) #50
maoyuu_tv_09_maid_ane_memory_01=Trim(maoyuu_tv_09,6033,6107) #combo #75
maoyuu_tv_09_maid_ane_memory_02=Trim(maoyuu_tv_09,6108,6179) #combo #72
maoyuu_tv_09_maid_ane_memory_03=Trim(maoyuu_tv_09,6180,6239) #combo #60
maoyuu_tv_09_maid_ane_memory_04=Trim(maoyuu_tv_09,6240,6308) #combo #69
maoyuu_tv_09_maid_ane_memory_05=Trim(maoyuu_tv_09,6309,6373) #combo #65
maoyuu_tv_09_maid_ane_memory_06=Trim(maoyuu_tv_09,6477,6520) #combo #44
maoyuu_tv_09_maid_imouto_sleep=Trim(maoyuu_tv_09,6633,6716) #84
maoyuu_tv_09_maid_ane_memory_07=Trim(maoyuu_tv_09,6717,6872) #combo #156
maoyuu_tv_09_clock_tower=Trim(maoyuu_tv_09,7560,7633) ## #74
maoyuu_tv_09_yuusha_monitoring=Trim(maoyuu_tv_09,9608,9671) ## #64
maoyuu_tv_09_maid_ane_cry=Trim(maoyuu_tv_09,9672,9788) #117
maoyuu_tv_09_chief_maid_waiting=Trim(maoyuu_tv_09,9958,10026) #69
maoyuu_tv_09_central_church_team=Trim(maoyuu_tv_09,10959,11043) #85
maoyuu_tv_09_red_bachelor_hurt=Trim(maoyuu_tv_09,13777,13816) #40
maoyuu_tv_09_red_bachelor_angry=Trim(maoyuu_tv_09,14937,15019) #83
maoyuu_tv_09_red_bachelor_announce_01=Trim(maoyuu_tv_09,17678,17718) #41
maoyuu_tv_09_red_bachelor_announce_02=Trim(maoyuu_tv_09,17940,18127) ## #188
maoyuu_tv_09_red_bachelor_announce_03=Trim(maoyuu_tv_09_cache02,18246,18311) ## #66
maoyuu_tv_09_loli=Trim(maoyuu_tv_09,19096,19257) #162
maoyuu_tv_09_red_bachelor_announce_04=Trim(maoyuu_tv_09,22810,23061) #252
maoyuu_tv_09_red_bachelor_announce_to_people=Trim(maoyuu_tv_09,23302,23529) ## #228
maoyuu_tv_09_soumaou_01=Trim(maoyuu_tv_09,29507,29621) ## #115
maoyuu_tv_09_soumaou_02=Trim(maoyuu_tv_09,29622,29741) ## #120
maoyuu_tv_09_light_spirit=Trim(maoyuu_tv_09,32758,32877) ## #120
maoyuu_tv_09_every_yuusha=Trim(maoyuu_tv_09,33172,33399) #228

maoyuu_tv_10_mazoku_attack_map=Trim(maoyuu_tv_10,4017,4160) #144
maoyuu_tv_10_central_church_conquer_map=Trim(maoyuu_tv_10,5051,5360) #310
maoyuu_tv_10_maid_imouto_take_pie=Trim(maoyuu_tv_10,6498,6576) #79
maoyuu_tv_10_central_church=Trim(maoyuu_tv_10,7672,7908) #237
maoyuu_tv_10_ice_country_map=Trim(maoyuu_tv_10,10943,11134) #192
maoyuu_tv_10_southen_country_map=Trim(maoyuu_tv_10,11898,12041) #144
maoyuu_tv_10_poet=Trim(maoyuu_tv_10,12171,12302) #132
maoyuu_tv_10_doumei_to_lake_map=Trim(maoyuu_tv_10,15346,15453) #108
maoyuu_tv_10_economy_map=Trim(maoyuu_tv_10,15809,15942) #134
maoyuu_tv_10_central_country_map=Trim(maoyuu_tv_10,17276,17324) #49
maoyuu_tv_10_lake_map_01=Trim(maoyuu_tv_10,18630,18713) #84
maoyuu_tv_10_lake_building=Trim(maoyuu_tv_10,18714,18845) #132
maoyuu_tv_10_lake_map_02=Trim(maoyuu_tv_10,22933,22993) #61
maoyuu_tv_10_onna_mahoutsukai_use_magic_to_grand_princess_fire_dragon=Trim(maoyuu_tv_10,23970,24101) ## #132 #cm
maoyuu_tv_10_grand_princess_fire_dragon_tail=Trim(maoyuu_tv_10,24826,25146) ## #321
maoyuu_tv_10_young_chief_maid_01=Trim(maoyuu_tv_10,26170,26285) ## #116
maoyuu_tv_10_young_maou_01=Trim(maoyuu_tv_10,26286,26393) ## #108
maoyuu_tv_10_maou_sleeping_01=Trim(maoyuu_tv_10,26614,26850) ## #237
maoyuu_tv_10_maou_sleeping_02=Trim(maoyuu_tv_10,26851,26947) #97
maoyuu_tv_10_chief_maid_waiting_outside=Trim(maoyuu_tv_10,27089,27181) ## #93
maoyuu_tv_10_young_maou_02=Trim(maoyuu_tv_10,27437,27509) #73
maoyuu_tv_10_young_chief_maid_02=Trim(maoyuu_tv_10,27510,27567) #58
maoyuu_tv_10_young_maou_see_baby_yuusha_01=Trim(maoyuu_tv_10,27830,27952) ## #123
maoyuu_tv_10_young_maou_see_baby_yuusha_02=Trim(maoyuu_tv_10,28395,28622) #228
maoyuu_tv_10_central_vs_southen_war_map=Trim(maoyuu_tv_10,30132,30287) #156
