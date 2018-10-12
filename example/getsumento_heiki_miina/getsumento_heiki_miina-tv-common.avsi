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



######## TV (1280*720) ########

getsumento_heiki_miina_tv_01=FFMS2_VIDEO_SOURCE("src\anime\x264\getsumento_heiki_miina-tv-01.mp4")
getsumento_heiki_miina_tv_02=FFMS2_VIDEO_SOURCE("src\anime\x264\getsumento_heiki_miina-tv-02.mp4")
getsumento_heiki_miina_tv_03=FFMS2_VIDEO_SOURCE("src\anime\x264\getsumento_heiki_miina-tv-03.mp4")
getsumento_heiki_miina_tv_04=FFMS2_VIDEO_SOURCE("src\anime\x264\getsumento_heiki_miina-tv-04.mp4")
getsumento_heiki_miina_tv_05=FFMS2_VIDEO_SOURCE("src\anime\x264\getsumento_heiki_miina-tv-05.mp4")
getsumento_heiki_miina_tv_06=FFMS2_VIDEO_SOURCE("src\anime\x264\getsumento_heiki_miina-tv-06.mp4")
getsumento_heiki_miina_tv_07=FFMS2_VIDEO_SOURCE("src\anime\x264\getsumento_heiki_miina-tv-07.mp4")
getsumento_heiki_miina_tv_08=FFMS2_VIDEO_SOURCE("src\anime\x264\getsumento_heiki_miina-tv-08.mp4")
getsumento_heiki_miina_tv_09=FFMS2_VIDEO_SOURCE("src\anime\x264\getsumento_heiki_miina-tv-09.mp4")
getsumento_heiki_miina_tv_10=FFMS2_VIDEO_SOURCE("src\anime\x264\getsumento_heiki_miina-tv-10.mp4")
getsumento_heiki_miina_tv_11=FFMS2_VIDEO_SOURCE("src\anime\x264\getsumento_heiki_miina-tv-11.mp4",fpsnum=24000,fpsden=1001)

getsumento_heiki_miina_tv_clean_op=Trim(getsumento_heiki_miina_tv_02,0,1915)
getsumento_heiki_miina_tv_clean_ed_normal_ver1=Trim(getsumento_heiki_miina_tv_01,30807,32724)
getsumento_heiki_miina_tv_clean_ed_normal_ver2=Trim(getsumento_heiki_miina_tv_10,30807,32724)
getsumento_heiki_miina_tv_clean_ed_last=Trim(getsumento_heiki_miina_tv_11,30815,32726)

######## Trim ########

getsumento_heiki_miina_tv_clean_op_01=Trim(getsumento_heiki_miina_tv_clean_op,0,1059)
getsumento_heiki_miina_tv_clean_op_02=Trim(getsumento_heiki_miina_tv_clean_op,1161,1468)
getsumento_heiki_miina_tv_clean_op_03=Trim(getsumento_heiki_miina_tv_clean_op,1469,2004)
getsumento_heiki_miina_tv_clean_op_04=Trim(getsumento_heiki_miina_tv_clean_op,2005,0)



getsumento_heiki_miina_tv_clean_ed_normal_ver1_01=Trim(getsumento_heiki_miina_tv_clean_ed_normal_ver1,0,1059)
getsumento_heiki_miina_tv_clean_ed_normal_ver1_02=Trim(getsumento_heiki_miina_tv_clean_ed_normal_ver1,1060,1407)
getsumento_heiki_miina_tv_clean_ed_normal_ver1_03=Trim(getsumento_heiki_miina_tv_clean_ed_normal_ver1,1408,1579)
getsumento_heiki_miina_tv_clean_ed_normal_ver1_04=Trim(getsumento_heiki_miina_tv_clean_ed_normal_ver1,1580,0)

getsumento_heiki_miina_tv_clean_ed_normal_ver2_01=Trim(getsumento_heiki_miina_tv_clean_ed_normal_ver2,0,1059)
getsumento_heiki_miina_tv_clean_ed_normal_ver2_02=Trim(getsumento_heiki_miina_tv_clean_ed_normal_ver2,1060,1407)
getsumento_heiki_miina_tv_clean_ed_normal_ver2_03=Trim(getsumento_heiki_miina_tv_clean_ed_normal_ver2,1408,1579)
getsumento_heiki_miina_tv_clean_ed_normal_ver2_04=Trim(getsumento_heiki_miina_tv_clean_ed_normal_ver2,1580,0)

getsumento_heiki_miina_tv_clean_ed_last_01=Trim(getsumento_heiki_miina_tv_clean_ed_last,0,354)
getsumento_heiki_miina_tv_clean_ed_last_02=Trim(getsumento_heiki_miina_tv_clean_ed_last,355,1010)
getsumento_heiki_miina_tv_clean_ed_last_03=Trim(getsumento_heiki_miina_tv_clean_ed_last,1011,1668)
getsumento_heiki_miina_tv_clean_ed_last_04=Trim(getsumento_heiki_miina_tv_clean_ed_last,1669,0)



getsumento_heiki_miina_tv_01_luna_television=Trim(getsumento_heiki_miina_tv_01,3735,3804) #70
getsumento_heiki_miina_tv_01_moon_01=Trim(getsumento_heiki_miina_tv_01,10679,10727) #49
getsumento_heiki_miina_tv_01_explosion=Trim(getsumento_heiki_miina_tv_01,14980,15097) #118
getsumento_heiki_miina_tv_01_tsukishiro_miina_transform=Trim(getsumento_heiki_miina_tv_01,22267,22845) #579
getsumento_heiki_miina_tv_01_moon_02=Trim(getsumento_heiki_miina_tv_01,23127,23162) #36
getsumento_heiki_miina_tv_01_moon_base=Trim(getsumento_heiki_miina_tv_01,23163,23193) #31 s
getsumento_heiki_miina_tv_01_moon_base_slot=Trim(getsumento_heiki_miina_tv_01,23194,23352) #159
getsumento_heiki_miina_tv_01_moon_base_factory=Trim(getsumento_heiki_miina_tv_01,23353,23441) #89
getsumento_heiki_miina_tv_01_moon_base_revolver=Trim(getsumento_heiki_miina_tv_01,23850,24081) #232
getsumento_heiki_miina_tv_01_surround_moon=Trim(getsumento_heiki_miina_tv_01,24155,24194) #40 s
getsumento_heiki_miina_tv_01_steam=Trim(getsumento_heiki_miina_tv_01,24195,24228) #34
getsumento_heiki_miina_tv_01_program=Trim(getsumento_heiki_miina_tv_01,24229,24258) #30
getsumento_heiki_miina_tv_01_moon_base_cannon=Trim(getsumento_heiki_miina_tv_01,24259,24420) #162
getsumento_heiki_miina_tv_01_carrot_weapon_fly_away_from_moon=Trim(getsumento_heiki_miina_tv_01,24631,24700) #70
getsumento_heiki_miina_tv_01_tsukishiro_miina_attach_carrot_weapon=Trim(getsumento_heiki_miina_tv_01,25159,25363) #205 s
getsumento_heiki_miina_tv_01_nanashi_ask_freeze_tsukishiro_miina=Trim(getsumento_heiki_miina_tv_01,25483,25618) #136
getsumento_heiki_miina_tv_01_tsukishiro_miina_cannot_control_flying=Trim(getsumento_heiki_miina_tv_01,25726,25976) # 251 op
getsumento_heiki_miina_tv_01_tsukishiro_miina_use_carrot_rocket_hammer=Trim(getsumento_heiki_miina_tv_01,28373,28465) #93

getsumento_heiki_miina_tv_02_library=Trim(getsumento_heiki_miina_tv_02,4977,5179) #203 s
getsumento_heiki_miina_tv_02_tsukishiro_miina_use_carrot_machine_gun=Trim(getsumento_heiki_miina_tv_02,28653,28733) #81
getsumento_heiki_miina_tv_02_tsukishiro_miina_win=Trim(getsumento_heiki_miina_tv_02,29349,29464) #116 op

getsumento_heiki_miina_tv_03_hazemi_nakoru_cheer_01=Trim(getsumento_heiki_miina_tv_03,7118,7153) #36 op
getsumento_heiki_miina_tv_03_hazemi_nakoru_cheer_02=Trim(getsumento_heiki_miina_tv_03,7154,7211) #58
getsumento_heiki_miina_tv_03_shiodome_suisan_cheerleading=Trim(getsumento_heiki_miina_tv_03,19788,19926) #139
getsumento_heiki_miina_tv_03_shiodome_suisan_cheerleading_hover_01=Trim(getsumento_heiki_miina_tv_03,21028,21079) #52
getsumento_heiki_miina_tv_03_shiodome_suisan_cheerleading_hover_02=Trim(getsumento_heiki_miina_tv_03,21288,21383) #96
getsumento_heiki_miina_tv_03_shiodome_suisan_cheerleading_hover_03=Trim(getsumento_heiki_miina_tv_03,21748,21907) #160 op

getsumento_heiki_miina_tv_04_nanashi_angry=Trim(getsumento_heiki_miina_tv_04,4120,4209) #90
getsumento_heiki_miina_tv_04_mutsumune_escartin_lie_on_bed=Trim(getsumento_heiki_miina_tv_04,5782,5928) #147 op
getsumento_heiki_miina_tv_04_camera_under_water=Trim(getsumento_heiki_miina_tv_04,6424,6479) #56
getsumento_heiki_miina_tv_04_city_skyline=Trim(getsumento_heiki_miina_tv_04,6570,6677) #108 s
getsumento_heiki_miina_tv_04_mutsumune_escartin_and_tsukuda_miina_as_cinderella=Trim(getsumento_heiki_miina_tv_04,7846,8029) #184
getsumento_heiki_miina_tv_04_tsukuda_miina_in_mascot=Trim(getsumento_heiki_miina_tv_04,9221,9364) #144
getsumento_heiki_miina_tv_04_tsukuda_miina_pull_pantie=Trim(getsumento_heiki_miina_tv_04,10769,10840) #72
getsumento_heiki_miina_tv_04_koushuu_suiren_spike_volleyball_01=Trim(getsumento_heiki_miina_tv_04,14016,14095) #80
getsumento_heiki_miina_tv_04_koushuu_suiren_spike_volleyball_02=Trim(getsumento_heiki_miina_tv_04,14096,14158) #63
getsumento_heiki_miina_tv_04_drop_bra=Trim(getsumento_heiki_miina_tv_04,15065,15113) #49
getsumento_heiki_miina_tv_04_tsukuda_miina_excited=Trim(getsumento_heiki_miina_tv_04,18270,18425) #156
getsumento_heiki_miina_tv_04_ootsuki_miina_see_rainbow_bridge=Trim(getsumento_heiki_miina_tv_04,28708,28790) #83 op

getsumento_heiki_miina_tv_05_takanashi_yuu_cute=Trim(getsumento_heiki_miina_tv_05,5189,5254) #66 op
getsumento_heiki_miina_tv_05_tamamushi_miina_launch_cherry_missile=Trim(getsumento_heiki_miina_tv_05,27535,27643) #109
getsumento_heiki_miina_tv_05_cherry_missile=Trim(getsumento_heiki_miina_tv_05,27644,27688) #45 op

getsumento_heiki_miina_tv_06_tsukuda_miina_fall=Trim(getsumento_heiki_miina_tv_06,3441,3488) #48
getsumento_heiki_miina_tv_06_hazemi_kanchi_see_hazemi_nakoru_under_sunset=Trim(getsumento_heiki_miina_tv_06,9738,9881) #144 op
getsumento_heiki_miina_tv_06_kiryuu_daisuke_drink_osake=Trim(getsumento_heiki_miina_tv_06,17651,17915) #265
getsumento_heiki_miina_tv_06_tsukishiro_miina_use_carrot_torpedo=Trim(getsumento_heiki_miina_tv_06,26419,26467) #49 op
getsumento_heiki_miina_tv_06_koushuu_suiren_take_off_helmet=Trim(getsumento_heiki_miina_tv_06,28040,28145) #106

getsumento_heiki_miina_tv_07_spoluna_entry_01=Trim(getsumento_heiki_miina_tv_07,6952,7059) #108 s
getsumento_heiki_miina_tv_07_armory=Trim(getsumento_heiki_miina_tv_07,10837,10900) #64
getsumento_heiki_miina_tv_07_tank=Trim(getsumento_heiki_miina_tv_07,18174,18232) #59
getsumento_heiki_miina_tv_07_tank_under_attack=Trim(getsumento_heiki_miina_tv_07,23250,23461) #212 s
getsumento_heiki_miina_tv_07_tsukishiro_miina_use_carrot_missile=Trim(getsumento_heiki_miina_tv_07,24003,24087) #85 op
getsumento_heiki_miina_tv_07_satsuki_miina_use_rpg=Trim(getsumento_heiki_miina_tv_07,27252,27369) #118
getsumento_heiki_miina_tv_07_sanae_tsutsuzi_clean_tank=Trim(getsumento_heiki_miina_tv_07,28058,28284) #227 s
getsumento_heiki_miina_tv_07_spoluna_entry_02=Trim(getsumento_heiki_miina_tv_07,28810,28942) #133 op

getsumento_heiki_miina_tv_08_tsukishiro_miina_figure=Trim(getsumento_heiki_miina_tv_08,4317,4352) #36 op
getsumento_heiki_miina_tv_08_hazemi_kanchi_time_traveling=Trim(getsumento_heiki_miina_tv_08,14906,14977) #72
getsumento_heiki_miina_tv_08_tsukishiro_miina_fly_high=Trim(getsumento_heiki_miina_tv_08,16648,16711) #64 op
getsumento_heiki_miina_tv_08_minaduki_miina_launch_tomato_missile=Trim(getsumento_heiki_miina_tv_08,25947,26040) #94

getsumento_heiki_miina_tv_09_tank_with_pantie=Trim(getsumento_heiki_miina_tv_09,9820,9889) #70
getsumento_heiki_miina_tv_09_satsuki_miina_take_photo_toward_tank_with_pantie=Trim(getsumento_heiki_miina_tv_09,9961,10055) #95
getsumento_heiki_miina_tv_09_ootsuki_tsukishiro_tamamushi_minaduki_miina_see_alien=Trim(getsumento_heiki_miina_tv_09,11881,12036) #156 op
getsumento_heiki_miina_tv_09_tamamushi_minaduki_satsuki_miina_and_alien_in_space=Trim(getsumento_heiki_miina_tv_09,25728,25823) #96 op

getsumento_heiki_miina_tv_10_ootsuki_miina_surfing=Trim(getsumento_heiki_miina_tv_10,3076,3157) #82
getsumento_heiki_miina_tv_10_nishiwa_sumire_call_fleet=Trim(getsumento_heiki_miina_tv_10,12126,12197) #72 op
getsumento_heiki_miina_tv_10_shiwasu_miina_evade_alien_s_attack=Trim(getsumento_heiki_miina_tv_10,23777,23841) #65 s
getsumento_heiki_miina_tv_10_shiwasu_miina_announce=Trim(getsumento_heiki_miina_tv_10,26133,26331) #199 op

getsumento_heiki_miina_tv_11_tsukishiro_miina_drill_space_ship=Trim(getsumento_heiki_miina_tv_11,18827,18865) #39
getsumento_heiki_miina_tv_11_tsukishiro_miina_bring_koushuu_suiren_away_from_space_ship=Trim(getsumento_heiki_miina_tv_11,19789,19930) #142
getsumento_heiki_miina_tv_11_sanae_tsutsuzi_transform_to_satsuki_miina_and_fly_toward_sky=Trim(getsumento_heiki_miina_tv_11,21323,21449) #127 op
getsumento_heiki_miina_tv_11_shimotsuki_kisaragi_miina_fly_near_space_ship=Trim(getsumento_heiki_miina_tv_11,25211,25330) #120
getsumento_heiki_miina_tv_11_all_miina_appear_in_front_of_moon=Trim(getsumento_heiki_miina_tv_11,25608,25694) #87 op
getsumento_heiki_miina_tv_11_all_miina_in_front_of_moon=Trim(getsumento_heiki_miina_tv_11,26225,26296) #72
getsumento_heiki_miina_tv_11_tsukishiro_ootsuki_miina_shoot_flagship_01=Trim(getsumento_heiki_miina_tv_11,29090,29201) #112
getsumento_heiki_miina_tv_11_tsukishiro_ootsuki_miina_shoot_flagship_02=Trim(getsumento_heiki_miina_tv_11,29202,29243) #42
getsumento_heiki_miina_tv_11_tsukishiro_ootsuki_miina_see_explosion=Trim(getsumento_heiki_miina_tv_11,29429,29484) #56
getsumento_heiki_miina_tv_11_other_miina_see_explosion=Trim(getsumento_heiki_miina_tv_11,29485,29597) #113
