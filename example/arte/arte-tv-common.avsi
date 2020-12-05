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

arte_tv_01=FFMS2_VIDEO_SOURCE("src\anime\Arte S01 1080p WEBRip AAC x265-EMBER\[EMBER] Arte - 01.mkv")
arte_tv_02=FFMS2_VIDEO_SOURCE("src\anime\Arte S01 1080p WEBRip AAC x265-EMBER\[EMBER] Arte - 02.mkv")
arte_tv_03=FFMS2_VIDEO_SOURCE("src\anime\Arte S01 1080p WEBRip AAC x265-EMBER\[EMBER] Arte - 03 .mkv")
arte_tv_04=FFMS2_VIDEO_SOURCE("src\anime\Arte S01 1080p WEBRip AAC x265-EMBER\[EMBER] Arte - 04 .mkv")
arte_tv_05=FFMS2_VIDEO_SOURCE("src\anime\Arte S01 1080p WEBRip AAC x265-EMBER\[EMBER] Arte - 05 .mkv")
arte_tv_06=FFMS2_VIDEO_SOURCE("src\anime\Arte S01 1080p WEBRip AAC x265-EMBER\[EMBER] Arte - 06 .mkv")
arte_tv_07=FFMS2_VIDEO_SOURCE("src\anime\Arte S01 1080p WEBRip AAC x265-EMBER\[EMBER] Arte - 07.mkv")
arte_tv_08=FFMS2_VIDEO_SOURCE("src\anime\Arte S01 1080p WEBRip AAC x265-EMBER\[EMBER] Arte - 08.mkv")
arte_tv_09=FFMS2_VIDEO_SOURCE("src\anime\Arte S01 1080p WEBRip AAC x265-EMBER\[EMBER] Arte - 09.mkv")
arte_tv_10=FFMS2_VIDEO_SOURCE("src\anime\Arte S01 1080p WEBRip AAC x265-EMBER\[EMBER] Arte - 10.mkv")
arte_tv_11=FFMS2_VIDEO_SOURCE("src\anime\Arte S01 1080p WEBRip AAC x265-EMBER\[EMBER] Arte - 11.mkv")
arte_tv_12=FFMS2_VIDEO_SOURCE("src\anime\Arte S01 1080p WEBRip AAC x265-EMBER\[EMBER] Arte - 12.mkv")

arte_tv_clean_op=Trim(arte_tv_01,1824,3980)

######## Trim ########

arte_tv_clean_op_01=Trim(arte_tv_clean_op,0,147)
arte_tv_clean_op_02=Trim(arte_tv_clean_op,148,248)
arte_tv_clean_op_03=Trim(arte_tv_clean_op,249,1306)
arte_tv_clean_op_04=Trim(arte_tv_clean_op,1307,1337)
arte_tv_clean_op_05=Trim(arte_tv_clean_op,1338,1902)
arte_tv_clean_op_06=Trim(arte_tv_clean_op,1903,0)



arte_tv_01_arte_sketching=Trim(arte_tv_01,1024,1124)
arte_tv_01_arte_watch_bird_and_smile=Trim(arte_tv_01,1284,1343)
arte_tv_01_arte_ask_maid_silent=Trim(arte_tv_01,1560,1661)
arte_tv_01_arte_cute=Trim(arte_tv_01,1734,1823) #90 op
arte_tv_01_arte_sketch_bird=Trim(arte_tv_01,4322,4387)
arte_tv_01_sketch_papers=Trim(arte_tv_01,4487,4519)
arte_tv_01_arte_practice_drawing=Trim(arte_tv_01,6631,6810)
arte_tv_01_firenze_downtown=Trim(arte_tv_01,7855,7932) #78 op
arte_tv_01_workshop=Trim(arte_tv_01,7933,8034)3
arte_tv_01_arte_cut_her_hair=Trim(arte_tv_01,10628,10669)
arte_tv_01_arte_grab_her_hair=Trim(arte_tv_01,10724,10951)
arte_tv_01_arte_want_to_cut_her_breast=Trim(arte_tv_01,10994,11194)
arte_tv_01_leo_sit_in_front_of_window=Trim(arte_tv_01,12560,12658) #99 op
arte_tv_01_arte_polish_canvas=Trim(arte_tv_01,20504,20599) #96 op
arte_tv_01_firenze_dawn=Trim(arte_tv_01,20819,20944) #126
arte_tv_01_arte_prepare_to_leave_home=Trim(arte_tv_01,27314,27544)
arte_tv_01_leo_draw_maria=Trim(arte_tv_01,28127,28207) #81
arte_tv_01_rain=Trim(arte_tv_01,29894,29965)
arte_tv_01_bird_fly_to_sky=Trim(arte_tv_01,31222,31269) #48 op
arte_tv_01_firenze_skyline=Trim(arte_tv_01,31270,31305)
arte_tv_01_firenze_river_side=Trim(arte_tv_01,31306,31341)
arte_tv_01_arte_see_firenze=Trim(arte_tv_01,31342,31665)

arte_tv_02_firenze_dawn=Trim(arte_tv_02,744,923) #180 op
arte_tv_02_firenze_downtown=Trim(arte_tv_02,924,1031)
arte_tv_02_leo_dip_palette=Trim(arte_tv_02,1236,1268) #33 op
arte_tv_02_leo_draw_maria=Trim(arte_tv_02,1269,1346) #78 op
arte_tv_02_angelo_and_arte_talk_near_river_side=Trim(arte_tv_02,20309,20410) #102 op
arte_tv_02_firenze_sunset=Trim(arte_tv_02,29410,29514) #105

arte_tv_03_firenze_festival=Trim(arte_tv_03,955,1074) #120 op
arte_tv_03_arte_hide_front_hair=Trim(arte_tv_03,5646,5885) #240 op
arte_tv_03_autopsy=Trim(arte_tv_03,10082,10267) #186
arte_tv_03_leo_carry_arte_and_run_away=Trim(arte_tv_03,12668,12739) #72 op
arte_tv_03_firenze=Trim(arte_tv_03,19376,19447)
arte_tv_03_arte_sketching=Trim(arte_tv_03,19448,19579)
arte_tv_03_river=Trim(arte_tv_03,19580,19699)
arte_tv_03_arte_frustrated=Trim(arte_tv_03,22264,22431) #168 op
arte_tv_03_arte_see_river_side=Trim(arte_tv_03,25627,25722) #96

arte_tv_04_arte_walk_in_firenze_street=Trim(arte_tv_04,1657,1740) #84 op
arte_tv_04_leo_and_arte_walk=Trim(arte_tv_04,7128,7265) #138 op
arte_tv_04_veronica_s_home=Trim(arte_tv_04,7668,7799)
arte_tv_04_arte_greet_veronica_01=Trim(arte_tv_04,8307,8345) #39 op
arte_tv_04_arte_greet_veronica_02=Trim(arte_tv_04,8346,8372) #27 op
arte_tv_04_arte_greet_veronica_03=Trim(arte_tv_04,8373,8471) #99 op
arte_tv_04_veronica_catch_arte_s_hand_01=Trim(arte_tv_04,14355,14414)
arte_tv_04_veronica_catch_arte_s_hand_02=Trim(arte_tv_04,14415,14588)
arte_tv_04_veronica_see_firenze=Trim(arte_tv_04,15946,16089) #144
arte_tv_04_firenze_night=Trim(arte_tv_04,20110,20199)
arte_tv_04_arte_see_sky=Trim(arte_tv_04,32165,32272) #108 op

arte_tv_05_chimney=Trim(arte_tv_05,7188,7253)
arte_tv_05_arte_walk_across_factory=Trim(arte_tv_05,7284,7352)
arte_tv_05_arte_find_in_factory_zone=Trim(arte_tv_05,7557,7616)
arte_tv_05_arte_see_ubertino_s_home=Trim(arte_tv_05,7617,7733)
arte_tv_05_arte_see_ubertino_s_painting=Trim(arte_tv_05,8025,8438)
arte_tv_05_arte_see_ubertino_s_painting_digest=Trim(arte_tv_05,8085,8282) #198 op
arte_tv_05_arte_greet=Trim(arte_tv_05,13956,14141)
arte_tv_05_veronica_training_arte_01=Trim(arte_tv_05,14523,14555)
arte_tv_05_veronica_training_arte_02=Trim(arte_tv_05,14556,14636) #81 op
arte_tv_05_arte_show_lace_sample=Trim(arte_tv_05,17096,17206)
arte_tv_05_ubertino_s_painting=Trim(arte_tv_05,19403,19564) #162 p
arte_tv_05_maria=Trim(arte_tv_05,28305,28400) #96 op
arte_tv_05_ubertino_catch_leo_s_master_s_hand=Trim(arte_tv_05,30249,30314)
arte_tv_05_ubertino_deal_with_leo_s_master=Trim(arte_tv_05,30315,30422)
arte_tv_05_ubertino_and_leo=Trim(arte_tv_05,31422,31553)

arte_tv_06_arte_pray_in_front_of_church=Trim(arte_tv_06,810,863) #54
arte_tv_06_angelo_talk_with_arte_in_plaza=Trim(arte_tv_06,981,1154)
arte_tv_06_church_inside=Trim(arte_tv_06,1536,1685)
arte_tv_06_painter_guild=Trim(arte_tv_06,9991,10128) #138 p
arte_tv_06_leo_teach_arte_fresco=Trim(arte_tv_06,12469,12564)
arte_tv_06_building=Trim(arte_tv_06,13675,13722)
arte_tv_06_leo_and_arte_see_building_under_construction=Trim(arte_tv_06,13723,13836)
arte_tv_06_leo_see_tools_in_corridor=Trim(arte_tv_06,15145,15228)
arte_tv_06_leo_inspect_tools_then_see_outside=Trim(arte_tv_06,15229,15294)
arte_tv_06_arte_breath=Trim(arte_tv_06,16231,16296) #66 op
arte_tv_06_arte_shout=Trim(arte_tv_06,16297,16398) #102
arte_tv_06_arte_doya=Trim(arte_tv_06,16549,16608) #60
arte_tv_06_food=Trim(arte_tv_06,16927,16986)
arte_tv_06_master_discuss_painting=Trim(arte_tv_06,17269,17436)
arte_tv_06_prick_hole=Trim(arte_tv_06,17437,17484)
arte_tv_06_put_sketch_on_wall=Trim(arte_tv_06,17485,17532)
arte_tv_06_paint_edge=Trim(arte_tv_06,17533,17586)
arte_tv_06_arte_carry_heavy_box=Trim(arte_tv_06,18436,18519) #84 op
arte_tv_06_arte_refuse_other_s_help=Trim(arte_tv_06,18640,18753)
arte_tv_06_sky_with_sunshine=Trim(arte_tv_06,19255,19314) #60 op
arte_tv_06_angelo_see_arte_uncomfortable=Trim(arte_tv_06,19417,19470)
arte_tv_06_arte_uncomfortable=Trim(arte_tv_06,19510,19623)
arte_tv_06_angelo_see_arte_lying=Trim(arte_tv_06,19624,19959) #336 op
arte_tv_06_arte_lying=Trim(arte_tv_06,20068,20121) #54 op
arte_tv_06_arte_sleep=Trim(arte_tv_06,21367,21432) #66 op
arte_tv_06_arte_and_angelo_walk_and_talk=Trim(arte_tv_06,23291,23740)
arte_tv_06_leo_hold_arte=Trim(arte_tv_06,27641,27700)
arte_tv_06_arte_play_with_others=Trim(arte_tv_06,29713,29856)

arte_tv_07_plaza=Trim(arte_tv_07,4419,4550)
arte_tv_07_arte_teach_darcia=Trim(arte_tv_07,4551,4808) #258 op
arte_tv_07_the_top_artist=Trim(arte_tv_07,9393,9740) #348 p
arte_tv_07_arte_happily_walking=Trim(arte_tv_07,12570,12647)
arte_tv_07_ruthanna_turn_back=Trim(arte_tv_07,14862,14951) #90 op
arte_tv_07_arte_make_bread=Trim(arte_tv_07,15150,15191)
arte_tv_07_artist_industry=Trim(arte_tv_07,22516,22713) #198 op
arte_tv_07_arte_climb=Trim(arte_tv_07,22714,22839) #126 op
arte_tv_07_veronica_talk_with_arte=Trim(arte_tv_07,25194,25367)
arte_tv_07_ruthanna_in_back_of_horse_drawn_vehicle=Trim(arte_tv_07,31119,31214) #96 op

arte_tv_08_arte_prepare_baggage=Trim(arte_tv_08,6634,6669) #36 p
arte_tv_08_yuri_and_arte_in_horse_drawn_vehicle=Trim(arte_tv_08,8374,8517)
arte_tv_08_travel_altar_01=Trim(arte_tv_08,8683,8780) #98
arte_tv_08_arte_draw_in_grassland=Trim(arte_tv_08,9726,9803) #78 op
arte_tv_08_horse_drawn_vehicle_in_grassland=Trim(arte_tv_08,9804,9853) #50
arte_tv_08_leo_and_arte_in_dream=Trim(arte_tv_08,10028,10165) #138 op
arte_tv_08_yuri_and_arte_see_sea=Trim(arte_tv_08,10484,10591) #108
arte_tv_08_yuri_and_friend_fencing=Trim(arte_tv_08,12824,12889)
arte_tv_08_ship_in_sea=Trim(arte_tv_08,13956,14045)
arte_tv_08_arte_draw_on_ship=Trim(arte_tv_08,14124,14255) #132 op
arte_tv_08_seagull_in_sky=Trim(arte_tv_08,14712,14789) #78
arte_tv_08_arte_fall_from_ship=Trim(arte_tv_08,15672,15728) #57
arte_tv_08_arte_fall=Trim(arte_tv_08,15729,15794) #66 op
arte_tv_08_arte_fall_into_sea=Trim(arte_tv_08,15843,15932) #90 op
arte_tv_08_arte_drown=Trim(arte_tv_08,15933,16088) #156 op
arte_tv_08_arte_see_venezia=Trim(arte_tv_08,21342,21480) #139
arte_tv_08_venezia_building_01=Trim(arte_tv_08,21481,21516)
arte_tv_08_venezia_building_02=Trim(arte_tv_08,21517,21558)
arte_tv_08_venezia_building_03=Trim(arte_tv_08,21559,21600)
arte_tv_08_venezia_01=Trim(arte_tv_08,21679,21816) #138 op
arte_tv_08_venezia_port=Trim(arte_tv_08,22183,22224)
arte_tv_08_arte_and_yuri_see_venezia=Trim(arte_tv_08,22321,22416)
arte_tv_08_arte_and_yuri_take_gondola=Trim(arte_tv_08,23059,23163) #105 op
arte_tv_08_gondola=Trim(arte_tv_08,23473,23580)
arte_tv_08_venezia_02=Trim(arte_tv_08,24886,25029) #144 op
arte_tv_08_arte_dress_and_take_gondola=Trim(arte_tv_08,25138,25197) #60 op
arte_tv_08_gondola_in_river=Trim(arte_tv_08,25687,25758) #72 op
arte_tv_08_faliero_home=Trim(arte_tv_08,25759,25896)
arte_tv_08_venezia_view_from_faliero_home=Trim(arte_tv_08,26701,26748)
arte_tv_08_travel_altar_02=Trim(arte_tv_08,27928,27969)
arte_tv_08_arte_pray=Trim(arte_tv_08,27970,28041) #72 op
arte_tv_08_katarina=Trim(arte_tv_08,29674,29725)
arte_tv_08_katarina_want_to_sleep=Trim(arte_tv_08,32035,32121)

arte_tv_09_katarina_leave_father_and_mother=Trim(arte_tv_09,5682,6029)
arte_tv_09_arte_stand_at_riverside_of_night_venezia_01=Trim(arte_tv_09,9366,9491) #126 op
arte_tv_09_arte_stand_at_riverside_of_night_venezia_02=Trim(arte_tv_09,9492,9587)
arte_tv_09_venezia=Trim(arte_tv_09,10788,10835)
arte_tv_09_faliero_home=Trim(arte_tv_09,10836,10877)
arte_tv_09_church_fresco=Trim(arte_tv_09,11778,11939)
arte_tv_09_arte_and_daphne_see_church_fresco=Trim(arte_tv_09,11982,12041) #60 op
arte_tv_09_arte_draw_in_church=Trim(arte_tv_09,12273,12344) #72 op
arte_tv_09_katarina_and_arte_play_hoop_rolling=Trim(arte_tv_09,18628,18741) #114 op
arte_tv_09_yuri_s_home=Trim(arte_tv_09,25234,25293)
arte_tv_09_sketch=Trim(arte_tv_09,28607,28678)

arte_tv_10_arte_and_katarina_talk=Trim(arte_tv_10,4498,4617)
arte_tv_10_katarina_and_gimo=Trim(arte_tv_10,9382,9453) #72 op
arte_tv_10_buona_hold_katarina_s_shouder=Trim(arte_tv_10,14458,14592)
arte_tv_10_murano_island=Trim(arte_tv_10,23724,23813) #90 p
arte_tv_10_murano_island_port=Trim(arte_tv_10,23814,23909) #96 op
arte_tv_10_murano_grassland=Trim(arte_tv_10,24831,24902)
arte_tv_10_arte_run_toward_gimo_and_katarina=Trim(arte_tv_10,25119,25178) #60 op
arte_tv_10_katarina_talk_with_gimo=Trim(arte_tv_10,25596,25784)
arte_tv_10_gimo_tell_katarina=Trim(arte_tv_10,26370,26513) #144 op
arte_tv_10_katarina_tears=Trim(arte_tv_10,27207,27416)
arte_tv_10_sofia_hug_katarina=Trim(arte_tv_10,31918,32025) #108 op

arte_tv_11_venezia_and_faliero_home=Trim(arte_tv_11,744,911) #p
arte_tv_11_arte_draw_sofia_s_portrait=Trim(arte_tv_11,912,1019) #108 op
arte_tv_11_katarina_see_artist_working=Trim(arte_tv_11,5013,5066) #54 op
arte_tv_11_arte_see_huge_painting=Trim(arte_tv_11,5859,5930) #72 op
arte_tv_11_arte_draw_katarina_s_portrait=Trim(arte_tv_11,9084,9137) #p
arte_tv_11_arte_draw_sofia_in_night=Trim(arte_tv_11,10494,10565) #72 op
arte_tv_11_arte_walk_across_bridge=Trim(arte_tv_11,11909,11992)
arte_tv_11_moon=Trim(arte_tv_11,12608,12655) #48
arte_tv_11_arte_against_wind=Trim(arte_tv_11,13803,13928) #126 op
arte_tv_11_sketch=Trim(arte_tv_11,14338,14409)
arte_tv_11_arte_tears=Trim(arte_tv_11,14794,14889) #96 op
arte_tv_11_firenze=Trim(arte_tv_11,15058,15153) #96 op
arte_tv_11_katarina_see_arte_sketching=Trim(arte_tv_11,23597,23824) #228 op
arte_tv_11_katarina_arte_imagine_painting=Trim(arte_tv_11,24827,25066)
arte_tv_11_katarina_s_portrait=Trim(arte_tv_11,25619,25738)
arte_tv_11_venezia_view_from_yuri_s_home=Trim(arte_tv_11,30566,30733)

arte_tv_12_venezia=Trim(arte_tv_12,744,821)
arte_tv_12_faliero_home=Trim(arte_tv_12,822,869)
arte_tv_12_fireplace=Trim(arte_tv_12,7893,7949)
arte_tv_12_sofia_s_portrait=Trim(arte_tv_12,10890,11090) #201 p
arte_tv_12_sofia_s_portrait_hand_part=Trim(arte_tv_12,11187,11246)
arte_tv_12_sofia_s_portrait_face_part=Trim(arte_tv_12,11247,11330)
arte_tv_12_venezia_night=Trim(arte_tv_12,12093,12152) #60
arte_tv_12_arte_considering=Trim(arte_tv_12,12153,12260) #108 op
arte_tv_12_katarina_s_room=Trim(arte_tv_12,14331,14402)
arte_tv_12_katarina_see_outside=Trim(arte_tv_12,14403,14480) #78 op
arte_tv_12_katarina_see_her_portrait=Trim(arte_tv_12,17292,17353) #62 op
arte_tv_12_katarina_s_portrait=Trim(arte_tv_12,17354,17419) #66
arte_tv_12_firenze=Trim(arte_tv_12,18062,18121)
arte_tv_12_fresco_01=Trim(arte_tv_12,20766,20909) #144
arte_tv_12_arte_draw_fresco_night=Trim(arte_tv_12,22662,22775)
arte_tv_12_arte_draw_fresco_day=Trim(arte_tv_12,23075,23128)
arte_tv_12_all_people_help_drawing_fresco_night_01=Trim(arte_tv_12,26762,26833)
arte_tv_12_all_people_help_drawing_fresco_night_02=Trim(arte_tv_12,26906,27025)
arte_tv_12_fresco_02=Trim(arte_tv_12,30095,30286) #192 op
arte_tv_12_fresco_03=Trim(arte_tv_12,30731,30778) #48
arte_tv_12_canvas=Trim(arte_tv_12,34382,34598) #217 op
