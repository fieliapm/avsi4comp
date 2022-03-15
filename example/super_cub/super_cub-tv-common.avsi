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

function FFMS2_VIDEO_SOURCE(string filename,int "vtrack",int "atrack",int "fpsnum",int "fpsden",bool "enable_multi_thread"){
	atrack=Default(atrack,-1)
	enable_multi_thread=Default(enable_multi_thread,false)

	threads=enable_multi_thread?-1:1

	return FFmpegSource2(filename,vtrack=vtrack,atrack=atrack,fpsnum=fpsnum,fpsden=fpsden,threads=threads)
}

super_cub_tv_01=FFMS2_VIDEO_SOURCE("src\[Moozzi2] Super Cub [ x265-10Bit Ver. ] - TV + Tokuten DVD\[Moozzi2] Super Cub - 01 (BD 1920x1080 x265-10Bit 2Audio).mkv")
super_cub_tv_02=FFMS2_VIDEO_SOURCE("src\[Moozzi2] Super Cub [ x265-10Bit Ver. ] - TV + Tokuten DVD\[Moozzi2] Super Cub - 02 (BD 1920x1080 x265-10Bit Flac).mkv")
super_cub_tv_03=FFMS2_VIDEO_SOURCE("src\[Moozzi2] Super Cub [ x265-10Bit Ver. ] - TV + Tokuten DVD\[Moozzi2] Super Cub - 03 (BD 1920x1080 x265-10Bit Flac).mkv")
super_cub_tv_04=FFMS2_VIDEO_SOURCE("src\[Moozzi2] Super Cub [ x265-10Bit Ver. ] - TV + Tokuten DVD\[Moozzi2] Super Cub - 04 (BD 1920x1080 x265-10Bit Flac).mkv")
super_cub_tv_05=FFMS2_VIDEO_SOURCE("src\[Moozzi2] Super Cub [ x265-10Bit Ver. ] - TV + Tokuten DVD\[Moozzi2] Super Cub - 05 (BD 1920x1080 x265-10Bit Flac).mkv")
super_cub_tv_06=FFMS2_VIDEO_SOURCE("src\[Moozzi2] Super Cub [ x265-10Bit Ver. ] - TV + Tokuten DVD\[Moozzi2] Super Cub - 06 (BD 1920x1080 x265-10Bit Flac).mkv")
super_cub_tv_07=FFMS2_VIDEO_SOURCE("src\[Moozzi2] Super Cub [ x265-10Bit Ver. ] - TV + Tokuten DVD\[Moozzi2] Super Cub - 07 (BD 1920x1080 x265-10Bit Flac).mkv")
super_cub_tv_08=FFMS2_VIDEO_SOURCE("src\[Moozzi2] Super Cub [ x265-10Bit Ver. ] - TV + Tokuten DVD\[Moozzi2] Super Cub - 08 (BD 1920x1080 x265-10Bit Flac).mkv")
super_cub_tv_09=FFMS2_VIDEO_SOURCE("src\[Moozzi2] Super Cub [ x265-10Bit Ver. ] - TV + Tokuten DVD\[Moozzi2] Super Cub - 09 (BD 1920x1080 x265-10Bit Flac).mkv")
super_cub_tv_10=FFMS2_VIDEO_SOURCE("src\[Moozzi2] Super Cub [ x265-10Bit Ver. ] - TV + Tokuten DVD\[Moozzi2] Super Cub - 10 (BD 1920x1080 x265-10Bit Flac).mkv")
super_cub_tv_11=FFMS2_VIDEO_SOURCE("src\[Moozzi2] Super Cub [ x265-10Bit Ver. ] - TV + Tokuten DVD\[Moozzi2] Super Cub - 11 (BD 1920x1080 x265-10Bit Flac).mkv")
super_cub_tv_12=FFMS2_VIDEO_SOURCE("src\[Moozzi2] Super Cub [ x265-10Bit Ver. ] - TV + Tokuten DVD\[Moozzi2] Super Cub - 12 END (BD 1920x1080 x265-10Bit 2Audio).mkv")

super_cub_tv_clean_op_ver01=FFMS2_VIDEO_SOURCE("src\[Moozzi2] Super Cub [ x265-10Bit Ver. ] - TV + Tokuten DVD\EXTRA\[Moozzi2] Super Cub [SP01] NCOP (BD 1920x1080 x265-10Bit Flac).mkv")
super_cub_tv_clean_op_ver02=FFMS2_VIDEO_SOURCE("src\[Moozzi2] Super Cub [ x265-10Bit Ver. ] - TV + Tokuten DVD\EXTRA\[Moozzi2] Super Cub [SP02] NCED - 01 (BD 1920x1080 x265-10Bit Flac).mkv")
super_cub_tv_clean_ed=FFMS2_VIDEO_SOURCE("src\[Moozzi2] Super Cub [ x265-10Bit Ver. ] - TV + Tokuten DVD\EXTRA\[Moozzi2] Super Cub [SP02] NCED - 02 (BD 1920x1080 x265-10Bit Flac).mkv")
super_cub_tv_clean_ed_cache02=FFMS2_VIDEO_SOURCE("src\[Moozzi2] Super Cub [ x265-10Bit Ver. ] - TV + Tokuten DVD\EXTRA\[Moozzi2] Super Cub [SP02] NCED - 02 (BD 1920x1080 x265-10Bit Flac).mkv")

######## Trim ########

super_cub_tv_clean_op_00=Trim(super_cub_tv_clean_op_ver02,0,23)
super_cub_tv_clean_op_01=Trim(super_cub_tv_clean_op_ver02,24,593) #570
super_cub_tv_clean_op_02=Trim(super_cub_tv_clean_op_ver02,594,1369) #776
super_cub_tv_clean_op_03=Trim(super_cub_tv_clean_op_ver02,1370,1776) #407
super_cub_tv_clean_op_04_ver01=Trim(super_cub_tv_clean_op_ver01,1777,2024) #248
super_cub_tv_clean_op_04_ver02=Trim(super_cub_tv_clean_op_ver02,1777,2024) #248
super_cub_tv_clean_op_05_ver01=Trim(super_cub_tv_clean_op_ver01,2025,0) #183
super_cub_tv_clean_op_05_ver02=Trim(super_cub_tv_clean_op_ver02,2025,0) #183

#super_cub_tv_clean_op_06_elaina_conducting=Trim(super_cub_tv_clean_op,1714,1767) #54
#super_cub_tv_clean_op_06_elaina_conducting_cache02=Trim(super_cub_tv_clean_op,1714,1767) #54



super_cub_tv_clean_ed_00=Trim(super_cub_tv_clean_ed,0,23)
super_cub_tv_clean_ed_01=Trim(super_cub_tv_clean_ed,24,242) #219
super_cub_tv_clean_ed_02=Trim(super_cub_tv_clean_ed,243,461) #219
super_cub_tv_clean_ed_02_cache02=Trim(super_cub_tv_clean_ed_cache02,243,461) #219
super_cub_tv_clean_ed_03=Trim(super_cub_tv_clean_ed,462,633) #172
super_cub_tv_clean_ed_04=Trim(super_cub_tv_clean_ed,634,1174) #541
super_cub_tv_clean_ed_05=Trim(super_cub_tv_clean_ed,1175,2183) #1009
super_cub_tv_clean_ed_post=Trim(super_cub_tv_clean_ed,2184,0)



super_cub_tv_01_honda_motorcycles=Trim(super_cub_tv_01,9019,9114) #96 op
super_cub_tv_01_ojisan_walk_super_cub=Trim(super_cub_tv_01,10082,10201) #120
super_cub_tv_01_super_cub_front_mark=Trim(super_cub_tv_01,10490,10561) #72
super_cub_tv_01_super_cub_side_mark=Trim(super_cub_tv_01,10562,10621) #60

super_cub_tv_01_koguma_go_on_super_cub=Trim(super_cub_tv_01,11018,11137) #120
super_cub_tv_01_koguma_feel_wind_on_super_cub=Trim(super_cub_tv_01,11366,11509) #144
super_cub_tv_01_koguma_use_double_d_ring=Trim(super_cub_tv_01,15138,15191) #54

super_cub_tv_01_fit_overtake_super_cub=Trim(super_cub_tv_01,18717,18812) #96 op
super_cub_tv_01_truck_overtake_super_cub_01=Trim(super_cub_tv_01,18981,19032) #52
super_cub_tv_01_truck_overtake_super_cub_02=Trim(super_cub_tv_01,19033,19104) #72
super_cub_tv_01_koguma_see_super_cub_and_smile=Trim(super_cub_tv_01,20989,21114) #126 op
super_cub_tv_01_koguma_see_helmet_on_bed=Trim(super_cub_tv_01,23184,23375) #192
super_cub_tv_01_koguma_stretch=Trim(super_cub_tv_01,24814,25035) #222 op
super_cub_tv_01_koguma_smile=Trim(super_cub_tv_01,25492,25599) #108
super_cub_tv_01_koguma_flip_manual=Trim(super_cub_tv_01,27852,27989) #138

super_cub_tv_02_koguma_walk_super_cub=Trim(super_cub_tv_02,980,1243) #264
super_cub_tv_02_koguma_take_off_helmet=Trim(super_cub_tv_02,1244,1555) #312 60-150-250 op
super_cub_tv_02_koguma_see_mirror_and_touch_hair=Trim(super_cub_tv_02,3068,3199) #132 op
super_cub_tv_02_koguma_pat_super_cub_seat=Trim(super_cub_tv_02,3200,3343) #144
super_cub_tv_02_blackboard=Trim(super_cub_tv_02,10620,10715) #96
super_cub_tv_02_koguma_run_on_stair=Trim(super_cub_tv_02,11160,11279) #120 op
super_cub_tv_02_reiko_exciting=Trim(super_cub_tv_02,12996,13055) #60
super_cub_tv_02_post_office_cub=Trim(super_cub_tv_02,13820,13927) #108
super_cub_tv_02_choke_switch=Trim(super_cub_tv_02,19660,19743) #84
super_cub_tv_02_post_office_cub_exhaust=Trim(super_cub_tv_02,22102,22173) #72
super_cub_tv_02_reiko_grab_koguma_s_arm=Trim(super_cub_tv_02,24707,24745) #39
super_cub_tv_02_koguma_turn_back_and_see_store_s_mark=Trim(super_cub_tv_02,31926,31997) #72
super_cub_tv_02_koguma_smile_and_ride_away=Trim(super_cub_tv_02,32082,32369) #288 op
super_cub_tv_02_electricity_pole=Trim(super_cub_tv_02,32370,32465) #96

super_cub_tv_03_koguma_ride_super_cub_and_turn_right=Trim(super_cub_tv_03,1065,1352) #288
super_cub_tv_03_koguma_park_super_cub=Trim(super_cub_tv_03,1791,1994) #204
super_cub_tv_03_reiko_and_koguma_s_leg=Trim(super_cub_tv_03,6447,6566) #120
super_cub_tv_03_reiko_grab_koguma_s_arm=Trim(super_cub_tv_03,8092,8283) #192
super_cub_tv_03_reiko_break_wind_shield=Trim(super_cub_tv_03,10488,10619) #132
super_cub_tv_03_toolbox=Trim(super_cub_tv_03,10921,10968) #48 op
super_cub_tv_03_koguma_nod=Trim(super_cub_tv_03,11065,11147) #83
super_cub_tv_03_reiko_see_koguma_close_rear_box=Trim(super_cub_tv_03,13304,13471) #168
super_cub_tv_03_super_cub_with_rear_box_equipped=Trim(super_cub_tv_03,13472,13543) #72
super_cub_tv_03_koguma_ride_super_cub_in_country=Trim(super_cub_tv_03,15639,15746) #108 op
super_cub_tv_03_wind_blow_into_koguma_s_skirt_01=Trim(super_cub_tv_03,15939,15974) #36
super_cub_tv_03_heavy_motorcycle=Trim(super_cub_tv_03,16641,16676)
super_cub_tv_03_heavy_motorcycle_rider=Trim(super_cub_tv_03,16677,16724)
super_cub_tv_03_koguma_disappointed_but_reiko_excited=Trim(super_cub_tv_03,22651,22950)
super_cub_tv_03_koguma_see_mirror=Trim(super_cub_tv_03,25085,25180)
super_cub_tv_03_wind_blow_into_koguma_s_skirt_02=Trim(super_cub_tv_03,25735,25782) #48 op
super_cub_tv_03_koguma_happy=Trim(super_cub_tv_03,25903,25998)
super_cub_tv_03_koguma_ride_super_cub_across_flower_sea_01=Trim(super_cub_tv_03,26801,26896) #96 op
super_cub_tv_03_koguma_ride_super_cub_across_flower_sea_02=Trim(super_cub_tv_03,26897,26968) #72
super_cub_tv_03_koguma_s_skirt_and_super_cub_mark=Trim(super_cub_tv_03,26969,27064)
super_cub_tv_03_koguma_smile_in_flower_sea=Trim(super_cub_tv_03,27065,27147)
super_cub_tv_03_koguma_ride_super_cub_across_flower_sea_toward_mountain=Trim(super_cub_tv_03,27148,27291)

super_cub_tv_04_koguma_shake_skirt=Trim(super_cub_tv_04,6038,6121) #84 op
super_cub_tv_04_koguma_wear_helmet_and_reiko_see_something=Trim(super_cub_tv_04,6452,6765)
super_cub_tv_04_koguma_and_reiko_see_something=Trim(super_cub_tv_04,6765,6861)
super_cub_tv_04_koguma_take_off_helmet=Trim(super_cub_tv_04,7677,7904) #228
super_cub_tv_04_change_engine_oil=Trim(super_cub_tv_04,8376,8435)
super_cub_tv_04_koguma_grab_quilt=Trim(super_cub_tv_04,10880,10983)
super_cub_tv_04_koguma_s_motorcycle_license=Trim(super_cub_tv_04,11512,11613) #102 op
super_cub_tv_04_koguma_ride_super_cub_along_mountain=Trim(super_cub_tv_04,12761,12844)
super_cub_tv_04_koguma_ride_super_cub_and_pass_curve=Trim(super_cub_tv_04,12905,12988)
super_cub_tv_04_koguma_walk_in_school=Trim(super_cub_tv_04,13679,13804)
super_cub_tv_04_koguma_pat_super_cub_seat=Trim(super_cub_tv_04,17342,17425)
super_cub_tv_04_koguma_kicking=Trim(super_cub_tv_04,17973,18044) #72 op
super_cub_tv_04_sunset_and_mountain=Trim(super_cub_tv_04,18768,18839) #72
super_cub_tv_04_check_engine_oil=Trim(super_cub_tv_04,20261,20452)
super_cub_tv_04_koguma_wet=Trim(super_cub_tv_04,21916,21991) #76 op
super_cub_tv_04_sunset_and_forest=Trim(super_cub_tv_04,23305,23376)
super_cub_tv_04_koguma_hug_raincoat=Trim(super_cub_tv_04,24430,24537)
super_cub_tv_04_koguma_ride_super_cub_in_rain_01=Trim(super_cub_tv_04,25286,25369) #84 #
super_cub_tv_04_koguma_ride_super_cub_in_rain_02=Trim(super_cub_tv_04,25370,25465) #96 #
super_cub_tv_04_koguma_shake_raincoat=Trim(super_cub_tv_04,25694,25837)
super_cub_tv_04_koguma_see_rain=Trim(super_cub_tv_04,26096,26142)
super_cub_tv_04_toolbox=Trim(super_cub_tv_04,27300,27447) #148
super_cub_tv_04_koguma_lie_down_under_super_cub=Trim(super_cub_tv_04,27448,27519) #72 op
super_cub_tv_04_koguma_failed_to_release_oil_drain_plug=Trim(super_cub_tv_04,27832,28206) #375
super_cub_tv_04_koguma_release_oil_drain_plug=Trim(super_cub_tv_04,28848,29075) #228 op
super_cub_tv_04_koguma_change_engine_oil=Trim(super_cub_tv_04,29498,29569)
super_cub_tv_04_koguma_bow=Trim(super_cub_tv_04,30292,30440)
super_cub_tv_04_reiko_introduce_her_home=Trim(super_cub_tv_04,32499,32656)

super_cub_tv_05_reiko_park_post_office_cub=Trim(super_cub_tv_05,737,908) #172 op
super_cub_tv_05_reiko_tweak_post_office_cub=Trim(super_cub_tv_05,1275,1346) #72 op
super_cub_tv_05_koguma_walk_super_cub_and_enter_reiko_s_home=Trim(super_cub_tv_05,4125,4284) #160
super_cub_tv_05_reiko_rub_pillar=Trim(super_cub_tv_05,5810,5907)
super_cub_tv_05_reiko_eat_okonomiyaki=Trim(super_cub_tv_05,6022,6183)
super_cub_tv_05_fuji_mountain=Trim(super_cub_tv_05,6933,7040) #108
super_cub_tv_05_reiko_walk_toward_post_office_cub=Trim(super_cub_tv_05,7113,7232)
super_cub_tv_05_reiko_lead_truck_back=Trim(super_cub_tv_05,7341,7460)
super_cub_tv_05_reiko_tell_and_turn_back=Trim(super_cub_tv_05,8202,8279)
super_cub_tv_05_reiko_shift_gear_up=Trim(super_cub_tv_05,8658,8675) #18
super_cub_tv_05_post_office_cub_back=Trim(super_cub_tv_05,8808,8855)
super_cub_tv_05_post_office_cub_engine=Trim(super_cub_tv_05,8952,8987)
super_cub_tv_05_sky_view_from_helmet=Trim(super_cub_tv_05,9516,9599)
super_cub_tv_05_reiko_lie_down_near_post_office_cub=Trim(super_cub_tv_05,9600,9671)
super_cub_tv_05_reiko_watch_post_office_cub_fade_reiko_read_book=Trim(super_cub_tv_05,11197,11430) #234
super_cub_tv_05_honda_ct110_web_page=Trim(super_cub_tv_05,12293,12376)
super_cub_tv_05_fuji_mountain_under_sunset=Trim(super_cub_tv_05,15255,15314) #60
super_cub_tv_05_reiko_ride_post_office_cub_on_rally_road=Trim(super_cub_tv_05,15567,15614) #48
super_cub_tv_05_reiko_ride_post_office_cub_pass_rally_curve_01=Trim(super_cub_tv_05,21312,21419) #108
super_cub_tv_05_reiko_ride_post_office_cub_pass_rally_curve_02=Trim(super_cub_tv_05,21420,21515) #96
super_cub_tv_05_reiko_ride_post_office_cub_pass_rally_curve_03=Trim(super_cub_tv_05,21564,21683) #120
super_cub_tv_05_post_office_cub_jump=Trim(super_cub_tv_05,22026,22061) #36 op
super_cub_tv_05_reiko_press_post_office_cub=Trim(super_cub_tv_05,22062,22137) #76 op
super_cub_tv_05_reiko_ride_post_office_cub_pass_rally_curve_04=Trim(super_cub_tv_05,24163,24236) #74 op
super_cub_tv_05_post_office_cub_leak_engine_oil=Trim(super_cub_tv_05,24953,25024) #36
super_cub_tv_05_koguma_and_reiko_eat_near_cub=Trim(super_cub_tv_05,27073,27192) #120 op
super_cub_tv_05_reiko_stand_near_post_office_cub_and_see_sunset=Trim(super_cub_tv_05,30421,30526)
super_cub_tv_05_koguma_and_reiko_discuss_near_super_cub=Trim(super_cub_tv_05,32157,32264) #108
super_cub_tv_05_super_cub_engine=Trim(super_cub_tv_05,32421,32569)

super_cub_tv_06_reiko_and_koguma_s_leg=Trim(super_cub_tv_06,4902,5044) #143 #
super_cub_tv_06_koguma_see_dm_and_lie_down=Trim(super_cub_tv_06,6001,6132) #132 op
super_cub_tv_06_koguma_kick_rock_01=Trim(super_cub_tv_06,8107,8190)
super_cub_tv_06_koguma_kick_rock_02=Trim(super_cub_tv_06,8191,8220)
super_cub_tv_06_rock_hit_super_cub=Trim(super_cub_tv_06,8221,8268)
super_cub_tv_06_koguma_wear_coat=Trim(super_cub_tv_06,9133,9228)
super_cub_tv_06_koguma_read_map=Trim(super_cub_tv_06,9229,9552) #324 #
super_cub_tv_06_koguma_refuel=Trim(super_cub_tv_06,11640,11699) #60 op
super_cub_tv_06_koguma_ride_super_cub_across_torii=Trim(super_cub_tv_06,13254,13397) #144
super_cub_tv_06_koguma_read_map_near_super_cub=Trim(super_cub_tv_06,14770,14848) #79 #
super_cub_tv_06_reiko_use_phone_in_front_of_buddha=Trim(super_cub_tv_06,15042,15372)
super_cub_tv_06_koguma_shift_gear_down=Trim(super_cub_tv_06,16472,16519) #48 op
super_cub_tv_06_koguma_see_cloud_sea=Trim(super_cub_tv_06,17727,17846) #120
super_cub_tv_06_fuji_mountain=Trim(super_cub_tv_06,17919,17990)
super_cub_tv_06_koguma_ride_in_hakone_yumoto_01=Trim(super_cub_tv_06,18325,18396) #72 op
super_cub_tv_06_koguma_ride_in_hakone_yumoto_02=Trim(super_cub_tv_06,18397,18540) #144
super_cub_tv_06_koguma_stop_super_cub=Trim(super_cub_tv_06,19164,19283)
super_cub_tv_06_koguma_ride_on_shounan_bridge=Trim(super_cub_tv_06,20376,20483)
super_cub_tv_06_koguma_ride_in_front_of_kamakura_high_school_station=Trim(super_cub_tv_06,20832,20927) #96
super_cub_tv_06_koguma_sit_and_see_seashore=Trim(super_cub_tv_06,21371,21489) #119 op
super_cub_tv_06_koguma_sit_on_beach_and_kicking=Trim(super_cub_tv_06,21827,21969) #143
super_cub_tv_06_koguma_sit_on_beach_and_turn_back=Trim(super_cub_tv_06,22018,22101)
super_cub_tv_06_koguma_ride_super_cub_in_front_of_torii=Trim(super_cub_tv_06,22493,22600) #108
super_cub_tv_06_koguma_reach_hotel_with_bus=Trim(super_cub_tv_06,22844,22999)
super_cub_tv_06_reiko_grin=Trim(super_cub_tv_06,24242,24319)
super_cub_tv_06_koguma_grin=Trim(super_cub_tv_06,24320,24384)
super_cub_tv_06_onsen=Trim(super_cub_tv_06,25075,25122)
super_cub_tv_06_koguma_and_reiko_in_onsen=Trim(super_cub_tv_06,25123,25271) #149 op
super_cub_tv_06_classmates_eat_kaiseki=Trim(super_cub_tv_06,26751,26810) #60 op
super_cub_tv_06_koguma_eat_kaiseki=Trim(super_cub_tv_06,26811,26930)
super_cub_tv_06_reiko_hug_koguma=Trim(super_cub_tv_06,28778,28825)
super_cub_tv_06_reiko_hug_koguma_and_koguma_ride_along_beach=Trim(super_cub_tv_06,28826,28898)
super_cub_tv_06_reiko_smile_in_front_of_sea=Trim(super_cub_tv_06,28899,28963)
super_cub_tv_06_koguma_smile_in_front_of_sea=Trim(super_cub_tv_06,28964,29035)
super_cub_tv_06_koguma_ride_toward_enoshima=Trim(super_cub_tv_06,29036,29131) #96 op

super_cub_tv_07_paddy=Trim(super_cub_tv_07,72,179)
super_cub_tv_07_super_cub_exhaust=Trim(super_cub_tv_07,1176,1283) #108 op
super_cub_tv_07_river=Trim(super_cub_tv_07,1692,1787)
super_cub_tv_07_wind_blow_into_koguma_s_skirt=Trim(super_cub_tv_07,1848,1919)
super_cub_tv_07_ct110=Trim(super_cub_tv_07,2841,2912) #72 op
super_cub_tv_07_ct110_dashboard=Trim(super_cub_tv_07,2985,3056) #72 #
super_cub_tv_07_koguma_take_ginkgo_leaf_from_reiko_s_neck=Trim(super_cub_tv_07,3923,4078)
super_cub_tv_07_flower=Trim(super_cub_tv_07,9156,9263) #108 op
super_cub_tv_07_koguma_grab_reiko_s_arm=Trim(super_cub_tv_07,11502,11615)
super_cub_tv_07_koguma_and_reiko_discuss_near_ct110=Trim(super_cub_tv_07,13784,13953) #170
super_cub_tv_07_reiko_introduce_ramen_box=Trim(super_cub_tv_07,18076,18220)
super_cub_tv_07_koguma_install_ramen_box=Trim(super_cub_tv_07,19837,19956)
super_cub_tv_07_koguma_start_up_super_cub=Trim(super_cub_tv_07,21848,21943)
super_cub_tv_07_super_cub_with_ramen_box_equipped=Trim(super_cub_tv_07,26349,26420)
super_cub_tv_07_shii_smile=Trim(super_cub_tv_07,27819,27913) #95
super_cub_tv_07_shii_turn_back_and_smile=Trim(super_cub_tv_07,32496,32537) #42 op

super_cub_tv_08_shii_ride_bicycle_and_lead_koguma_and_reiko=Trim(super_cub_tv_08,6763,6906) #144 op
super_cub_tv_08_shii_feel_proud=Trim(super_cub_tv_08,10445,10536)
super_cub_tv_08_shii_and_her_father_serve_koguma_and_reiko=Trim(super_cub_tv_08,10765,10920)
super_cub_tv_08_shii_say_goodbye_to_reiko_and_koguma=Trim(super_cub_tv_08,15455,15609) #155 #
super_cub_tv_08_koguma_grab_reiko_s_hand_01=Trim(super_cub_tv_08,17841,18008)
super_cub_tv_08_koguma_grab_reiko_s_hand_02=Trim(super_cub_tv_08,18087,18194) #108 op
super_cub_tv_08_koguma_test_turn_signal=Trim(super_cub_tv_08,21571,21786)
super_cub_tv_08_koguma_park_super_cub=Trim(super_cub_tv_08,22631,22738) #108 op
super_cub_tv_08_shii_failed_to_cover_her_mother=Trim(super_cub_tv_08,27616,27699) #84 op
super_cub_tv_08_koguma_ride_super_cub_and_wait_for_green_light=Trim(super_cub_tv_08,31506,31649) #144

super_cub_tv_09_wind_blow_into_koguma_s_skirt_01=Trim(super_cub_tv_09,1667,1738)
super_cub_tv_09_reiko_move_leg_and_skirt=Trim(super_cub_tv_09,5622,5681) #60 op
super_cub_tv_09_shii_sit_down=Trim(super_cub_tv_09,6413,6508)
super_cub_tv_09_reiko_stroke_shii=Trim(super_cub_tv_09,7806,8016)
super_cub_tv_09_shii_hug_reiko_and_reiko_ride_ct110=Trim(super_cub_tv_09,14544,14599)
super_cub_tv_09_shii_hug_reiko_riding=Trim(super_cub_tv_09,14600,14659)
super_cub_tv_09_wind_blow_into_koguma_s_skirt_02=Trim(super_cub_tv_09,17578,17649)
super_cub_tv_09_shii_sit_and_feel_happy=Trim(super_cub_tv_09,18109,18162) #54 op
super_cub_tv_09_reiko_move_leg_with_new_sock=Trim(super_cub_tv_09,18163,18215) #53
super_cub_tv_09_shii_feel_curious=Trim(super_cub_tv_09,20165,20234)
super_cub_tv_09_reiko_check_parts_of_super_cub=Trim(super_cub_tv_09,26550,26747)
super_cub_tv_09_reiko_and_koguma_ride_around_avalokitesvara=Trim(super_cub_tv_09,31086,31228) #143 #
super_cub_tv_09_koguma_ride_under_tasogare=Trim(super_cub_tv_09,32464,32655) #192 op

super_cub_tv_10_shii_ride_in_forest_01=Trim(super_cub_tv_10,2070,2177)
super_cub_tv_10_shii_ride_in_forest_02=Trim(super_cub_tv_10,2178,2321)
super_cub_tv_10_koguma_use_foot_to_stop_super_cub_in_snow=Trim(super_cub_tv_10,9473,9520)
super_cub_tv_10_koguma_install_snow_chain=Trim(super_cub_tv_10,12455,12538)
super_cub_tv_10_reiko_install_snow_chain=Trim(super_cub_tv_10,12539,12622)
super_cub_tv_10_reiko_and_koguma_ride_in_snow_forest=Trim(super_cub_tv_10,13642,13701)
super_cub_tv_10_winter_sun=Trim(super_cub_tv_10,13702,13749) #48
super_cub_tv_10_reiko_and_koguma_ride_toward_snow_field=Trim(super_cub_tv_10,14824,14960)
super_cub_tv_10_reiko_and_koguma_ride_in_snow_field=Trim(super_cub_tv_10,15189,15248) #60 op
super_cub_tv_10_reiko_see_koguma_slip=Trim(super_cub_tv_10,15321,15356)
super_cub_tv_10_reiko_ride_and_jump=Trim(super_cub_tv_10,16167,16274) #108 op
super_cub_tv_10_reiko_and_koguma_ride_in_snow_field_and_leave_tire_track=Trim(super_cub_tv_10,16407,16502)
super_cub_tv_10_koguma_ride_and_jump=Trim(super_cub_tv_10,16539,16586) #48 op
super_cub_tv_10_koguma_fall_and_feel_happy=Trim(super_cub_tv_10,16587,16658) #72
super_cub_tv_10_reiko_ride_left_right=Trim(super_cub_tv_10,16659,16730)
super_cub_tv_10_fly_coat_under_sun=Trim(super_cub_tv_10,17283,17330) #48 #
super_cub_tv_10_koguma_and_reiko_ride_and_jump=Trim(super_cub_tv_10,17619,17738)
super_cub_tv_10_koguma_and_reiko_eat_in_snow_field=Trim(super_cub_tv_10,18779,19018)
super_cub_tv_10_reiko_throw_snow_toward_koguma=Trim(super_cub_tv_10,20003,20086)
super_cub_tv_10_koguma_use_rear_wheel_to_splash_snow_toward_reiko_01=Trim(super_cub_tv_10,20255,20296) #42
super_cub_tv_10_koguma_use_rear_wheel_to_splash_snow_toward_reiko_02=Trim(super_cub_tv_10,20417,20576) #160 op
super_cub_tv_10_koguma_and_reiko_lie_down_in_snow_field=Trim(super_cub_tv_10,20852,21031)
super_cub_tv_10_shii_serve_koguma_and_reiko=Trim(super_cub_tv_10,22931,23074) #144
super_cub_tv_10_koguma_see_snow_falling=Trim(super_cub_tv_10,24368,24463) #96 #
super_cub_tv_10_shii_see_snow_falling_behind_window=Trim(super_cub_tv_10,24608,24679) #72
super_cub_tv_10_reiko_see_snow_falling_behind_window=Trim(super_cub_tv_10,24680,24751) #72
super_cub_tv_10_reiko_ride_in_forest_and_feel_happy=Trim(super_cub_tv_10,29817,29912)
super_cub_tv_10_shii_stuck_in_river_01=Trim(super_cub_tv_10,32440,32541)
super_cub_tv_10_shii_stuck_in_river_02=Trim(super_cub_tv_10,32542,32655)

super_cub_tv_11_koguma_drift_super_cub=Trim(super_cub_tv_11,2608,2679) #72 op
super_cub_tv_11_koguma_carry_shii=Trim(super_cub_tv_11,7120,7209)
super_cub_tv_11_koguma_put_shii_into_super_cub_basket=Trim(super_cub_tv_11,7210,7341) #132
super_cub_tv_11_koguma_shift_gear_up=Trim(super_cub_tv_11,7732,7761) #30 op
super_cub_tv_11_koguma_carry_shii_by_super_cub=Trim(super_cub_tv_11,7763,7821) #59 op
super_cub_tv_11_shii_take_bath=Trim(super_cub_tv_11,11383,11538) #156
super_cub_tv_11_shii_take_back_pantie_from_koguma=Trim(super_cub_tv_11,14619,14714) #96
super_cub_tv_11_reiko_shii_koguma_eating=Trim(super_cub_tv_11,17732,18046) #315
super_cub_tv_11_shii_grab_koguma_s_arm=Trim(super_cub_tv_11,21735,22070) #336
super_cub_tv_11_shii_cry_and_grab_koguma_01=Trim(super_cub_tv_11,22233,22364) #132
super_cub_tv_11_shii_cry_and_grab_koguma_02=Trim(super_cub_tv_11,22365,22508) #144
super_cub_tv_11_electricity_pole=Trim(super_cub_tv_11,25578,25670)
super_cub_tv_11_shii_run_and_grab_koguma_s_hand=Trim(super_cub_tv_11,30422,30553)
super_cub_tv_11_koguma_s_hair_flying=Trim(super_cub_tv_11,30626,30727)
super_cub_tv_11_koguma_see_shii_ride_bicycle=Trim(super_cub_tv_11,31253,31348) #96 op

super_cub_tv_12_shii_and_reiko_see_koguma_arriving=Trim(super_cub_tv_12,2015,2098)
super_cub_tv_12_super_cub_and_ct110_behind_window=Trim(super_cub_tv_12,5390,5551) #162
super_cub_tv_12_koguma_reiko_shii_pass_hakushu=Trim(super_cub_tv_12,7650,7743)
super_cub_tv_12_ct110_on_road=Trim(super_cub_tv_12,7827,7886)
super_cub_tv_12_shii_see_reiko_and_koguma_check_motorcycle=Trim(super_cub_tv_12,8480,8743)
super_cub_tv_12_koguma_reiko_shii_pass_naraijuku=Trim(super_cub_tv_12,11543,11662)
super_cub_tv_12_koguma_reiko_shii_in_tea_house=Trim(super_cub_tv_12,11831,11991)
super_cub_tv_12_shii_want_to_pee=Trim(super_cub_tv_12,12508,12579)
super_cub_tv_12_shii_cut_bread=Trim(super_cub_tv_12,13627,13708)
super_cub_tv_12_shii_spread_cream=Trim(super_cub_tv_12,13842,13901)
super_cub_tv_12_salmon_on_bread=Trim(super_cub_tv_12,13950,14021)
super_cub_tv_12_ct110_on_nagoya_road=Trim(super_cub_tv_12,15086,15145)
super_cub_tv_12_koguma_reiko_shii_pass_nagoya=Trim(super_cub_tv_12,15146,15289)
super_cub_tv_12_koguma_reiko_shii_pass_owari_bridge=Trim(super_cub_tv_12,15398,15493)
super_cub_tv_12_lake=Trim(super_cub_tv_12,15863,15910)
super_cub_tv_12_koguma_reiko_shii_pass_biwa_lake=Trim(super_cub_tv_12,15971,16111)
super_cub_tv_12_biwa_lake_night=Trim(super_cub_tv_12,16183,16266) #84 op
super_cub_tv_12_koguma_push_naked_reiko_into_bathroom=Trim(super_cub_tv_12,16747,16878)
super_cub_tv_12_koguma_see_shii_view_biwa_lake=Trim(super_cub_tv_12,16939,17034)
super_cub_tv_12_biwa_lake_morning=Trim(super_cub_tv_12,17035,17106) #72
super_cub_tv_12_koguma_reiko_shii_see_biwa_lake_morning=Trim(super_cub_tv_12,17707,17850)
super_cub_tv_12_koguma_reiko_shii_pass_torii_in_lake=Trim(super_cub_tv_12,18027,18098)
super_cub_tv_12_koguma_reiko_shii_ride_out_of_tunnel=Trim(super_cub_tv_12,18287,18394)
super_cub_tv_12_koguma_reiko_shii_pass_tsuruga_mihara=Trim(super_cub_tv_12,18551,18670)
super_cub_tv_12_super_cub_and_ct110=Trim(super_cub_tv_12,18755,18802)
super_cub_tv_12_koguma_reiko_shii_see_seashore=Trim(super_cub_tv_12,18911,19102)
super_cub_tv_12_person_on_surf_board=Trim(super_cub_tv_12,19547,19630)
super_cub_tv_12_seagull_flying_over_sea=Trim(super_cub_tv_12,20243,20290) #48 op
super_cub_tv_12_reiko_and_shii_see_shibayama_port=Trim(super_cub_tv_12,20339,20379)
super_cub_tv_12_tottori_sand_dunes=Trim(super_cub_tv_12,20679,20762)
super_cub_tv_12_koguma_reiko_shii_pass_tottori_sand_dunes=Trim(super_cub_tv_12,20811,20906)
super_cub_tv_12_windmill=Trim(super_cub_tv_12,20967,21014) #48
super_cub_tv_12_koguma_reiko_shii_pass_windmills=Trim(super_cub_tv_12,21015,21110)
super_cub_tv_12_reiko_shii_want_to_take_photo_of_koguma=Trim(super_cub_tv_12,21323,21400)
super_cub_tv_12_blurred_koguma_photo=Trim(super_cub_tv_12,21401,21437)
super_cub_tv_12_shii_take_photo_with_koguma_grabbing_reiko=Trim(super_cub_tv_12,21438,21474)
super_cub_tv_12_reiko_carry_fish=Trim(super_cub_tv_12,21475,21511)
super_cub_tv_12_reiko_take_photo_with_shii_and_koguma=Trim(super_cub_tv_12,21512,21572)
super_cub_tv_12_shii_take_photo_with_reiko_koguma_crab=Trim(super_cub_tv_12,21699,21782)
super_cub_tv_12_shii_and_koguma_see_reiko_take_crab=Trim(super_cub_tv_12,21830,21890)
super_cub_tv_12_sakaikou=Trim(super_cub_tv_12,21891,21950) #60 op
super_cub_tv_12_koguma_reiko_shii_see_kanmon_bridge=Trim(super_cub_tv_12,22295,22388)
super_cub_tv_12_ship_under_kanmon_bridge=Trim(super_cub_tv_12,22647,22718)
super_cub_tv_12_reiko_and_shii_ride_in_kanmon_tunnel=Trim(super_cub_tv_12,22955,23014)
super_cub_tv_12_koguma_ride_in_kanmon_tunnel=Trim(super_cub_tv_12,23015,23074)
super_cub_tv_12_koguma_reiko_shii_see_exit_of_kanmon_tunnel=Trim(super_cub_tv_12,23075,23122)
super_cub_tv_12_super_cub_out_of_kanmon_tunnel=Trim(super_cub_tv_12,23123,23170)
super_cub_tv_12_koguma_reiko_shii_ride_out_of_kanmon_tunnel=Trim(super_cub_tv_12,23171,23273)
super_cub_tv_12_reiko_ride_and_shii_sit_on_rear=Trim(super_cub_tv_12,24263,24322)
super_cub_tv_12_koguma_reiko_shii_see_sakura=Trim(super_cub_tv_12,25192,25287)
super_cub_tv_12_sakura_rain_fall_on_super_cub=Trim(super_cub_tv_12,25360,25443) #84 #
super_cub_tv_12_koguma_and_reiko_see_shii_touch_sakura_rain=Trim(super_cub_tv_12,25444,25551) #108 op
super_cub_tv_12_koguma_and_reiko_see_cubs_in_sakura_rain=Trim(super_cub_tv_12,26056,26223)
super_cub_tv_12_shii_catch_sakura=Trim(super_cub_tv_12,27287,27406) #120
super_cub_tv_12_super_cub_and_ct110_in_sakura_rain=Trim(super_cub_tv_12,27503,27610) #108 op
super_cub_tv_12_sakura_rain_under_sun=Trim(super_cub_tv_12,27611,27682)
super_cub_tv_12_sakura_in_front_of_mountain=Trim(super_cub_tv_12,27683,27826)
super_cub_tv_12_little_cub=Trim(super_cub_tv_12,28942,29013) #72 op
super_cub_tv_12_reiko_and_koguma_see_shii_run_to_little_cub=Trim(super_cub_tv_12,29734,29877)
super_cub_tv_12_shii_touch_little_cub=Trim(super_cub_tv_12,30460,30543)
super_cub_tv_12_reiko_shii_koguma_ride_cubs_over_hill=Trim(super_cub_tv_12,30792,30959) #168 op
super_cub_tv_12_super_cub_moving_in_sakura_rain=Trim(super_cub_tv_12,30960,31067)
super_cub_tv_12_reiko_shii_koguma_ride_cubs_along_mountain=Trim(super_cub_tv_12,32058,32201)
super_cub_tv_12_reiko_shii_koguma_ride_cubs=Trim(super_cub_tv_12,32202,32285) #84 op
super_cub_tv_12_reiko_shii_koguma_ride_cubs_to_far_side=Trim(super_cub_tv_12,32394,32537) #144
