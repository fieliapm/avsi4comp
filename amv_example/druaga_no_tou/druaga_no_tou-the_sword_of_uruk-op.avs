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

######## TV (720P) ########

fpsnum=30000
fpsden=1001

druaga_no_tou_the_sword_of_uruk_tv_01=FFMS2_VIDEO_SOURCE("src\anime\bs4-1280_720\druaga_no_tou-the_sword_of_uruk\druaga_no_tou-the_sword_of_uruk-tv-01.mp4",fpsnum=fpsnum,fpsden=fpsden)
druaga_no_tou_the_sword_of_uruk_tv_02=FFMS2_VIDEO_SOURCE("src\anime\bs4-1280_720\druaga_no_tou-the_sword_of_uruk\druaga_no_tou-the_sword_of_uruk-tv-02.mp4",fpsnum=fpsnum,fpsden=fpsden)
druaga_no_tou_the_sword_of_uruk_tv_03=FFMS2_VIDEO_SOURCE("src\anime\bs4-1280_720\druaga_no_tou-the_sword_of_uruk\druaga_no_tou-the_sword_of_uruk-tv-03.mp4",fpsnum=fpsnum,fpsden=fpsden)
druaga_no_tou_the_sword_of_uruk_tv_04=FFMS2_VIDEO_SOURCE("src\anime\bs4-1280_720\druaga_no_tou-the_sword_of_uruk\druaga_no_tou-the_sword_of_uruk-tv-04.mp4",fpsnum=fpsnum,fpsden=fpsden)
druaga_no_tou_the_sword_of_uruk_tv_04_cache02=FFMS2_VIDEO_SOURCE("src\anime\bs4-1280_720\druaga_no_tou-the_sword_of_uruk\druaga_no_tou-the_sword_of_uruk-tv-04.mp4",fpsnum=fpsnum,fpsden=fpsden)
druaga_no_tou_the_sword_of_uruk_tv_05=FFMS2_VIDEO_SOURCE("src\anime\bs4-1280_720\druaga_no_tou-the_sword_of_uruk\druaga_no_tou-the_sword_of_uruk-tv-05.mp4",fpsnum=fpsnum,fpsden=fpsden)
druaga_no_tou_the_sword_of_uruk_tv_06=FFMS2_VIDEO_SOURCE("src\anime\bs4-1280_720\druaga_no_tou-the_sword_of_uruk\druaga_no_tou-the_sword_of_uruk-tv-06.mp4",fpsnum=fpsnum,fpsden=fpsden)
druaga_no_tou_the_sword_of_uruk_tv_07=FFMS2_VIDEO_SOURCE("src\anime\bs4-1280_720\druaga_no_tou-the_sword_of_uruk\druaga_no_tou-the_sword_of_uruk-tv-07.mp4",fpsnum=fpsnum,fpsden=fpsden)
druaga_no_tou_the_sword_of_uruk_tv_08=FFMS2_VIDEO_SOURCE("src\anime\bs4-1280_720\druaga_no_tou-the_sword_of_uruk\druaga_no_tou-the_sword_of_uruk-tv-08.mp4",fpsnum=fpsnum,fpsden=fpsden)
druaga_no_tou_the_sword_of_uruk_tv_09=FFMS2_VIDEO_SOURCE("src\anime\bs4-1280_720\druaga_no_tou-the_sword_of_uruk\druaga_no_tou-the_sword_of_uruk-tv-09.mp4",fpsnum=fpsnum,fpsden=fpsden)
druaga_no_tou_the_sword_of_uruk_tv_10=FFMS2_VIDEO_SOURCE("src\anime\bs4-1280_720\druaga_no_tou-the_sword_of_uruk\druaga_no_tou-the_sword_of_uruk-tv-10.mp4",fpsnum=fpsnum,fpsden=fpsden)
druaga_no_tou_the_sword_of_uruk_tv_11=FFMS2_VIDEO_SOURCE("src\anime\bs4-1280_720\druaga_no_tou-the_sword_of_uruk\druaga_no_tou-the_sword_of_uruk-tv-11.mp4",fpsnum=fpsnum,fpsden=fpsden)
druaga_no_tou_the_sword_of_uruk_tv_12=FFMS2_VIDEO_SOURCE("src\anime\bs4-1280_720\druaga_no_tou-the_sword_of_uruk\druaga_no_tou-the_sword_of_uruk-tv-12.mp4",fpsnum=fpsnum,fpsden=fpsden)



druaga_no_tou_the_sword_of_uruk_tv_op=Trim(druaga_no_tou_the_sword_of_uruk_tv_07,1492,4187)

druaga_no_tou_the_sword_of_uruk_tv_op_01=Trim(druaga_no_tou_the_sword_of_uruk_tv_op,0,341)
druaga_no_tou_the_sword_of_uruk_tv_op_02=Trim(druaga_no_tou_the_sword_of_uruk_tv_op,342,933)
druaga_no_tou_the_sword_of_uruk_tv_op_03=Trim(druaga_no_tou_the_sword_of_uruk_tv_op,934,1344)
druaga_no_tou_the_sword_of_uruk_tv_op_04=Trim(druaga_no_tou_the_sword_of_uruk_tv_op,1345,2443)
druaga_no_tou_the_sword_of_uruk_tv_op_05=Trim(druaga_no_tou_the_sword_of_uruk_tv_op,2444,0)



druaga_no_tou_the_sword_of_uruk_tv_01_kaaya_in_pool=Trim(druaga_no_tou_the_sword_of_uruk_tv_01,1416,1578) ## #163
druaga_no_tou_the_sword_of_uruk_tv_01_ki_transform_small=Trim(druaga_no_tou_the_sword_of_uruk_tv_01,11325,11545) #221
druaga_no_tou_the_sword_of_uruk_tv_01_memory_01=Trim(druaga_no_tou_the_sword_of_uruk_tv_01,18690,19462) ## #773
druaga_no_tou_the_sword_of_uruk_tv_01_meskia_city=Trim(druaga_no_tou_the_sword_of_uruk_tv_01,19484,19931) ## #448
druaga_no_tou_the_sword_of_uruk_tv_01_memory_02=Trim(druaga_no_tou_the_sword_of_uruk_tv_01,20058,20269) #212

druaga_no_tou_the_sword_of_uruk_tv_02_ki_attack_fatina_asshole_01=Trim(druaga_no_tou_the_sword_of_uruk_tv_02,12664,12738) ## #75
druaga_no_tou_the_sword_of_uruk_tv_02_ki_attack_fatina_asshole_02=Trim(druaga_no_tou_the_sword_of_uruk_tv_02,12739,12813) ## #75
druaga_no_tou_the_sword_of_uruk_tv_02_ki_legend_01=Trim(druaga_no_tou_the_sword_of_uruk_tv_02,18133,18259) #127
druaga_no_tou_the_sword_of_uruk_tv_02_ki_legend_02=Trim(druaga_no_tou_the_sword_of_uruk_tv_02,18260,18400) ## #141
druaga_no_tou_the_sword_of_uruk_tv_02_ki_legend_03=Trim(druaga_no_tou_the_sword_of_uruk_tv_02,18401,18535) #135
druaga_no_tou_the_sword_of_uruk_tv_02_kelb_vs_uragon_01=Trim(druaga_no_tou_the_sword_of_uruk_tv_02,23997,24091) ## #95
druaga_no_tou_the_sword_of_uruk_tv_02_kelb_vs_uragon_02=Trim(druaga_no_tou_the_sword_of_uruk_tv_02,24092,24298) #207
druaga_no_tou_the_sword_of_uruk_tv_02_jil_and_utu_run_away=Trim(druaga_no_tou_the_sword_of_uruk_tv_02,28391,28546) ## #156
druaga_no_tou_the_sword_of_uruk_tv_02_hecate_make_soldier_sleep=Trim(druaga_no_tou_the_sword_of_uruk_tv_02,30360,30529) ## #170
druaga_no_tou_the_sword_of_uruk_tv_02_fatina_change_clothes=Trim(druaga_no_tou_the_sword_of_uruk_tv_02,31083,31248) #166
druaga_no_tou_the_sword_of_uruk_tv_02_church_broken=Trim(druaga_no_tou_the_sword_of_uruk_tv_02,33683,33902) #220
druaga_no_tou_the_sword_of_uruk_tv_02_fatina_jump_to_jil_01=Trim(druaga_no_tou_the_sword_of_uruk_tv_02,35129,35206) #78
druaga_no_tou_the_sword_of_uruk_tv_02_fatina_jump_to_jil_02=Trim(druaga_no_tou_the_sword_of_uruk_tv_02,35207,35268) #62
druaga_no_tou_the_sword_of_uruk_tv_02_fatina_jump_to_jil_03=Trim(druaga_no_tou_the_sword_of_uruk_tv_02,35269,35542) ## #274
druaga_no_tou_the_sword_of_uruk_tv_02_fatina_use_machine_gun=Trim(druaga_no_tou_the_sword_of_uruk_tv_02,37058,37226) ## #169
druaga_no_tou_the_sword_of_uruk_tv_02_elevator_01=Trim(druaga_no_tou_the_sword_of_uruk_tv_02,40159,40263) #105
druaga_no_tou_the_sword_of_uruk_tv_02_elevator_02=Trim(druaga_no_tou_the_sword_of_uruk_tv_02,41362,41498) #137

druaga_no_tou_the_sword_of_uruk_tv_03_secretary_coopa=Trim(druaga_no_tou_the_sword_of_uruk_tv_03,7311,7498) #188
druaga_no_tou_the_sword_of_uruk_tv_03_melt_bullshit=Trim(druaga_no_tou_the_sword_of_uruk_tv_03,12500,12693) ## #194
druaga_no_tou_the_sword_of_uruk_tv_03_tentacle_x_fatina_01=Trim(druaga_no_tou_the_sword_of_uruk_tv_03,17656,17690) ## #35
druaga_no_tou_the_sword_of_uruk_tv_03_tentacle_x_fatina_02=Trim(druaga_no_tou_the_sword_of_uruk_tv_03,17691,17774) ## #84
druaga_no_tou_the_sword_of_uruk_tv_03_roper_power_plant=Trim(druaga_no_tou_the_sword_of_uruk_tv_03,22135,22295) ## #161
druaga_no_tou_the_sword_of_uruk_tv_03_roper_to_soccer_field_01=Trim(druaga_no_tou_the_sword_of_uruk_tv_03,27571,27690) #120
druaga_no_tou_the_sword_of_uruk_tv_03_roper_to_soccer_field_02=Trim(druaga_no_tou_the_sword_of_uruk_tv_03,27691,27788) #98
druaga_no_tou_the_sword_of_uruk_tv_03_roper_dig_tunnel=Trim(druaga_no_tou_the_sword_of_uruk_tv_03,31642,31759) #118
druaga_no_tou_the_sword_of_uruk_tv_03_ki_use_protective_magic_01=Trim(druaga_no_tou_the_sword_of_uruk_tv_03,33275,33423) #149
druaga_no_tou_the_sword_of_uruk_tv_03_ki_use_protective_magic_02=Trim(druaga_no_tou_the_sword_of_uruk_tv_03,33424,33572) #149
druaga_no_tou_the_sword_of_uruk_tv_03_ki_victory=Trim(druaga_no_tou_the_sword_of_uruk_tv_03,34456,34568) #113
druaga_no_tou_the_sword_of_uruk_tv_03_melt_attack=Trim(druaga_no_tou_the_sword_of_uruk_tv_03,36134,36198) #65

druaga_no_tou_the_sword_of_uruk_tv_04_gremica_in_pool_01=Trim(druaga_no_tou_the_sword_of_uruk_tv_04,10827,10914) ## #88
druaga_no_tou_the_sword_of_uruk_tv_04_gremica_in_pool_02=Trim(druaga_no_tou_the_sword_of_uruk_tv_04,11008,11156) #149
druaga_no_tou_the_sword_of_uruk_tv_04_jil_wield_sword=Trim(druaga_no_tou_the_sword_of_uruk_tv_04,13185,13302) #118
druaga_no_tou_the_sword_of_uruk_tv_04_kelb_ride_horse_01=Trim(druaga_no_tou_the_sword_of_uruk_tv_04,16763,16882) #120
druaga_no_tou_the_sword_of_uruk_tv_04_kelb_ride_horse_02=Trim(druaga_no_tou_the_sword_of_uruk_tv_04,16883,16955) #73
#druaga_no_tou_the_sword_of_uruk_tv_04_ki_explain=Trim(druaga_no_tou_the_sword_of_uruk_tv_04,19437,19980) #544
druaga_no_tou_the_sword_of_uruk_tv_04_ki_explain_short=Trim(druaga_no_tou_the_sword_of_uruk_tv_04,19714,19885) ## #172
druaga_no_tou_the_sword_of_uruk_tv_04_jil_open_stair_01=Trim(druaga_no_tou_the_sword_of_uruk_tv_04,34754,34864) #111
druaga_no_tou_the_sword_of_uruk_tv_04_jil_open_stair_02=Trim(druaga_no_tou_the_sword_of_uruk_tv_04_cache02,35068,35170) #103

druaga_no_tou_the_sword_of_uruk_tv_05_jil_fatina_utu_fall=Trim(druaga_no_tou_the_sword_of_uruk_tv_05,4808,5037) #230
druaga_no_tou_the_sword_of_uruk_tv_05_girl_party_in_pool=Trim(druaga_no_tou_the_sword_of_uruk_tv_05,21449,21488) ## #40
druaga_no_tou_the_sword_of_uruk_tv_05_ki_use_trace_magic=Trim(druaga_no_tou_the_sword_of_uruk_tv_05,27671,27868) #198
druaga_no_tou_the_sword_of_uruk_tv_05_utu_kill_monster=Trim(druaga_no_tou_the_sword_of_uruk_tv_05,30195,30286) ## #92
druaga_no_tou_the_sword_of_uruk_tv_05_gilgamesh_and_shadow=Trim(druaga_no_tou_the_sword_of_uruk_tv_05,39758,39903) #146

druaga_no_tou_the_sword_of_uruk_tv_06_neeba_push_kaaya=Trim(druaga_no_tou_the_sword_of_uruk_tv_06,15559,15663) ## #105
druaga_no_tou_the_sword_of_uruk_tv_06_mite_the_fool_attack=Trim(druaga_no_tou_the_sword_of_uruk_tv_06,26622,26859) #238
druaga_no_tou_the_sword_of_uruk_tv_06_four_knights=Trim(druaga_no_tou_the_sword_of_uruk_tv_06,31224,31398) ## #175

druaga_no_tou_the_sword_of_uruk_tv_07_ahmey_in_pool=Trim(druaga_no_tou_the_sword_of_uruk_tv_07,12530,12643) ## #114
druaga_no_tou_the_sword_of_uruk_tv_07_ahmey_with_girl_clothes=Trim(druaga_no_tou_the_sword_of_uruk_tv_07,14825,14994) ## #170
druaga_no_tou_the_sword_of_uruk_tv_07_cumu_and_his_sister=Trim(druaga_no_tou_the_sword_of_uruk_tv_07,19056,19163) ## #108
druaga_no_tou_the_sword_of_uruk_tv_07_hecate_and_pazuzu=Trim(druaga_no_tou_the_sword_of_uruk_tv_07,19164,19379) ## #216

druaga_no_tou_the_sword_of_uruk_tv_08_jil_evade=Trim(druaga_no_tou_the_sword_of_uruk_tv_08,13795,13903) ## #109
druaga_no_tou_the_sword_of_uruk_tv_08_jil_and_neeba_escape=Trim(druaga_no_tou_the_sword_of_uruk_tv_08,20765,21260) ## #496
druaga_no_tou_the_sword_of_uruk_tv_08_two_knights=Trim(druaga_no_tou_the_sword_of_uruk_tv_08,26086,26175) ## #90
druaga_no_tou_the_sword_of_uruk_tv_08_neeba_vs_gremica=Trim(druaga_no_tou_the_sword_of_uruk_tv_08,28240,28340) ## #101
druaga_no_tou_the_sword_of_uruk_tv_08_world=Trim(druaga_no_tou_the_sword_of_uruk_tv_08,37415,37633) #219

druaga_no_tou_the_sword_of_uruk_tv_09_walk_across_gate=Trim(druaga_no_tou_the_sword_of_uruk_tv_09,14315,14494) ## #180
druaga_no_tou_the_sword_of_uruk_tv_09_shadow_gilgamesh_on_chair=Trim(druaga_no_tou_the_sword_of_uruk_tv_09,17308,17500) #193
druaga_no_tou_the_sword_of_uruk_tv_09_coopa_and_kaaya_in_jail=Trim(druaga_no_tou_the_sword_of_uruk_tv_09,28665,29451) #787
druaga_no_tou_the_sword_of_uruk_tv_09_shadow_gilgamesh_do_handstand_01=Trim(druaga_no_tou_the_sword_of_uruk_tv_09,36462,36584) #123
druaga_no_tou_the_sword_of_uruk_tv_09_shadow_gilgamesh_do_handstand_02=Trim(druaga_no_tou_the_sword_of_uruk_tv_09,36585,36706) ## #122
druaga_no_tou_the_sword_of_uruk_tv_09_mite_the_fool_open_gate_01=Trim(druaga_no_tou_the_sword_of_uruk_tv_09,40784,40858) #75
druaga_no_tou_the_sword_of_uruk_tv_09_mite_the_fool_open_gate_02=Trim(druaga_no_tou_the_sword_of_uruk_tv_09,40859,40959) ## #101

druaga_no_tou_the_sword_of_uruk_tv_10_gilgamesh_take_stick=Trim(druaga_no_tou_the_sword_of_uruk_tv_10,5373,5596) #224
druaga_no_tou_the_sword_of_uruk_tv_10_girl_party_see_romantic=Trim(druaga_no_tou_the_sword_of_uruk_tv_10,24474,24623) ## #150
druaga_no_tou_the_sword_of_uruk_tv_10_alla_want_to_see_romantic=Trim(druaga_no_tou_the_sword_of_uruk_tv_10,24729,24826) ## #98
druaga_no_tou_the_sword_of_uruk_tv_10_coopa_become_high=Trim(druaga_no_tou_the_sword_of_uruk_tv_10,27717,27753) ## #37
druaga_no_tou_the_sword_of_uruk_tv_10_coopa_hug_melt=Trim(druaga_no_tou_the_sword_of_uruk_tv_10,27879,28152) ## #274
druaga_no_tou_the_sword_of_uruk_tv_10_fatina_power_max=Trim(druaga_no_tou_the_sword_of_uruk_tv_10,30721,30830) ## #110

druaga_no_tou_the_sword_of_uruk_tv_11_jil_wield_sword=Trim(druaga_no_tou_the_sword_of_uruk_tv_11,13446,13538) #93
druaga_no_tou_the_sword_of_uruk_tv_11_kaaya_power_up_jil=Trim(druaga_no_tou_the_sword_of_uruk_tv_11,22561,22991) ## #431
druaga_no_tou_the_sword_of_uruk_tv_11_tower_gun=Trim(druaga_no_tou_the_sword_of_uruk_tv_11,40697,40980) ## #284

druaga_no_tou_the_sword_of_uruk_tv_12_weapon_against_earth_quake=Trim(druaga_no_tou_the_sword_of_uruk_tv_12,4562,4614) ## #53
druaga_no_tou_the_sword_of_uruk_tv_12_weapon_against_god=Trim(druaga_no_tou_the_sword_of_uruk_tv_12,4615,4779) #165
druaga_no_tou_the_sword_of_uruk_tv_12_kaaya_take_off_clothes_01=Trim(druaga_no_tou_the_sword_of_uruk_tv_12,8936,9081) #146
druaga_no_tou_the_sword_of_uruk_tv_12_kaaya_take_off_clothes_02=Trim(druaga_no_tou_the_sword_of_uruk_tv_12,9082,9186) #105
druaga_no_tou_the_sword_of_uruk_tv_12_elevator=Trim(druaga_no_tou_the_sword_of_uruk_tv_12,11295,11472) #178
druaga_no_tou_the_sword_of_uruk_tv_12_jil_and_kaaya_01=Trim(druaga_no_tou_the_sword_of_uruk_tv_12,11593,11830) #238
druaga_no_tou_the_sword_of_uruk_tv_12_jil_and_kaaya_02=Trim(druaga_no_tou_the_sword_of_uruk_tv_12,12615,12785) ## #171
druaga_no_tou_the_sword_of_uruk_tv_12_succubus=Trim(druaga_no_tou_the_sword_of_uruk_tv_12,20680,20743) ## #64
druaga_no_tou_the_sword_of_uruk_tv_12_coopa_pull_everyone=Trim(druaga_no_tou_the_sword_of_uruk_tv_12,36164,36283) ## #120
druaga_no_tou_the_sword_of_uruk_tv_12_ki_attack_gilgamesh_asshole=Trim(druaga_no_tou_the_sword_of_uruk_tv_12,38845,38933) ## #89
druaga_no_tou_the_sword_of_uruk_tv_12_meskia_city=Trim(druaga_no_tou_the_sword_of_uruk_tv_12,38934,39118) #185
druaga_no_tou_the_sword_of_uruk_tv_12_kelb_and_ethana_get_married=Trim(druaga_no_tou_the_sword_of_uruk_tv_12,39888,40002) ## #115
druaga_no_tou_the_sword_of_uruk_tv_12_girl_party_catch_flower=Trim(druaga_no_tou_the_sword_of_uruk_tv_12,40062,40136) #75
druaga_no_tou_the_sword_of_uruk_tv_12_utu_catch_flower=Trim(druaga_no_tou_the_sword_of_uruk_tv_12,40137,40208) #72

######## Pre Combine ########

fade_length=15

druaga_no_tou_the_sword_of_uruk_tv_04_jil_open_stair=Dissolve(TRIM_LAST_CLIP(druaga_no_tou_the_sword_of_uruk_tv_04_jil_open_stair_01,90+fade_length),TRIM_FIRST_CLIP(druaga_no_tou_the_sword_of_uruk_tv_04_jil_open_stair_02,90),fade_length)

#druaga_no_tou_the_sword_of_uruk_tv_03_secretary_coopa_faster=CLIP_SPEED(druaga_no_tou_the_sword_of_uruk_tv_03_secretary_coopa,2.0,true)
druaga_no_tou_the_sword_of_uruk_tv_07_ahmey_with_girl_clothes_faster=CLIP_SPEED(druaga_no_tou_the_sword_of_uruk_tv_07_ahmey_with_girl_clothes,1.8,true)

######## Combine ########

# druaga_no_tou_the_sword_of_uruk_tv_op_01 321
# druaga_no_tou_the_sword_of_uruk_tv_op_02 663
# druaga_no_tou_the_sword_of_uruk_tv_op_03 3304
# druaga_no_tou_the_sword_of_uruk_tv_op_04 5845
# druaga_no_tou_the_sword_of_uruk_tv_op_05 7105

# section:
# druaga_no_tou_the_sword_of_uruk_tv_op_03 = 934 / 979 1012 1051 / 1140 1176 1216 1259 / 1301 1310 1319 1329 1345
#                                            45 / 33 39 89 / 36 40 43 42 / 9 9 10 16

druaga_no_tou_the_sword_of_uruk_tv_op_t01=BlankClip(druaga_no_tou_the_sword_of_uruk_tv_op,length=17,color=color_black)+FADE_OUT_WITH_BRIGHTNESS_OFFSET_RGB24(TRIM_LAST_CLIP(druaga_no_tou_the_sword_of_uruk_tv_01_meskia_city,304),fade_length)+druaga_no_tou_the_sword_of_uruk_tv_op_01
druaga_no_tou_the_sword_of_uruk_tv_op_t02=druaga_no_tou_the_sword_of_uruk_tv_op_02
druaga_no_tou_the_sword_of_uruk_tv_op_t03=druaga_no_tou_the_sword_of_uruk_tv_op_03

druaga_no_tou_the_sword_of_uruk_tv_op_t04=TRIM_FIRST_CLIP(druaga_no_tou_the_sword_of_uruk_tv_02_fatina_use_machine_gun,162)+TRIM_LAST_CLIP(druaga_no_tou_the_sword_of_uruk_tv_02_hecate_make_soldier_sleep,160) \
	+TRIM_MIDDLE_CLIP(druaga_no_tou_the_sword_of_uruk_tv_04_ki_explain_short,161)+TRIM_FIRST_CLIP(druaga_no_tou_the_sword_of_uruk_tv_08_jil_evade,81)+TRIM_MIDDLE_CLIP(druaga_no_tou_the_sword_of_uruk_tv_05_utu_kill_monster,80)+TRIM_FIRST_CLIP(druaga_no_tou_the_sword_of_uruk_tv_10_coopa_hug_melt,81)

druaga_no_tou_the_sword_of_uruk_tv_op_t05=TRIM_MIDDLE_CLIP(druaga_no_tou_the_sword_of_uruk_tv_12_jil_and_kaaya_02,161)+TRIM_LAST_CLIP(druaga_no_tou_the_sword_of_uruk_tv_02_fatina_jump_to_jil_03,160)
druaga_no_tou_the_sword_of_uruk_tv_op_t06=TRIM_MIDDLE_CLIP(druaga_no_tou_the_sword_of_uruk_tv_03_roper_power_plant,156)+TRIM_FIRST_CLIP(druaga_no_tou_the_sword_of_uruk_tv_09_shadow_gilgamesh_do_handstand_02,41)+TRIM_MIDDLE_CLIP(druaga_no_tou_the_sword_of_uruk_tv_12_ki_attack_gilgamesh_asshole,40)+TRIM_LAST_CLIP(druaga_no_tou_the_sword_of_uruk_tv_02_kelb_vs_uragon_01,85) \
	+TRIM_MIDDLE_CLIP(druaga_no_tou_the_sword_of_uruk_tv_02_jil_and_utu_run_away,156)+TRIM_FIRST_CLIP(druaga_no_tou_the_sword_of_uruk_tv_03_melt_bullshit,40)+TRIM_MIDDLE_CLIP(druaga_no_tou_the_sword_of_uruk_tv_12_weapon_against_earth_quake,40)+TRIM_LAST_CLIP(druaga_no_tou_the_sword_of_uruk_tv_12_succubus,34)

druaga_no_tou_the_sword_of_uruk_tv_op_t07=TRIM_MIDDLE_CLIP(druaga_no_tou_the_sword_of_uruk_tv_10_fatina_power_max,45) \
	+TRIM_LAST_CLIP(druaga_no_tou_the_sword_of_uruk_tv_03_tentacle_x_fatina_01,33)+TRIM_FIRST_CLIP(druaga_no_tou_the_sword_of_uruk_tv_03_tentacle_x_fatina_02,39)+TRIM_FIRST_CLIP(druaga_no_tou_the_sword_of_uruk_tv_07_ahmey_with_girl_clothes_faster,89) \
	+TRIM_LAST_CLIP(druaga_no_tou_the_sword_of_uruk_tv_05_girl_party_in_pool,36)+TRIM_MIDDLE_CLIP(druaga_no_tou_the_sword_of_uruk_tv_07_ahmey_in_pool,40)+TRIM_MIDDLE_CLIP(druaga_no_tou_the_sword_of_uruk_tv_04_gremica_in_pool_01,43)+TRIM_MIDDLE_CLIP(druaga_no_tou_the_sword_of_uruk_tv_01_kaaya_in_pool,42) \
	+TRIM_MIDDLE_CLIP(druaga_no_tou_the_sword_of_uruk_tv_08_two_knights,9)+TRIM_MIDDLE_CLIP(druaga_no_tou_the_sword_of_uruk_tv_06_neeba_push_kaaya,9)+TRIM_MIDDLE_CLIP(druaga_no_tou_the_sword_of_uruk_tv_10_girl_party_see_romantic,10)+TRIM_MIDDLE_CLIP(druaga_no_tou_the_sword_of_uruk_tv_10_alla_want_to_see_romantic,16)

druaga_no_tou_the_sword_of_uruk_tv_op_t08=TRIM_MIDDLE_CLIP(druaga_no_tou_the_sword_of_uruk_tv_09_walk_across_gate,162)+TRIM_MIDDLE_CLIP(druaga_no_tou_the_sword_of_uruk_tv_04_jil_open_stair,161) \
	+TRIM_MIDDLE_CLIP(druaga_no_tou_the_sword_of_uruk_tv_08_jil_and_neeba_escape,161)+TRIM_MIDDLE_CLIP(druaga_no_tou_the_sword_of_uruk_tv_07_cumu_and_his_sister,80)+TRIM_LAST_CLIP(druaga_no_tou_the_sword_of_uruk_tv_08_neeba_vs_gremica,81)+TRIM_LAST_CLIP(druaga_no_tou_the_sword_of_uruk_tv_12_kelb_and_ethana_get_married,80) \
	+TRIM_MIDDLE_CLIP(druaga_no_tou_the_sword_of_uruk_tv_09_mite_the_fool_open_gate_02,80)

druaga_no_tou_the_sword_of_uruk_tv_op_t09=TRIM_FIRST_CLIP(druaga_no_tou_the_sword_of_uruk_tv_01_memory_01,161+161+160+161)+TRIM_LAST_CLIP(druaga_no_tou_the_sword_of_uruk_tv_11_kaaya_power_up_jil,161)+TRIM_LAST_CLIP(druaga_no_tou_the_sword_of_uruk_tv_06_four_knights,161)

druaga_no_tou_the_sword_of_uruk_tv_op_t10=TRIM_MIDDLE_CLIP(druaga_no_tou_the_sword_of_uruk_tv_07_hecate_and_pazuzu,161)+TRIM_LAST_CLIP(druaga_no_tou_the_sword_of_uruk_tv_02_ki_legend_02,115)+TRIM_LAST_CLIP(druaga_no_tou_the_sword_of_uruk_tv_02_ki_attack_fatina_asshole_01,41)+TRIM_FIRST_CLIP(druaga_no_tou_the_sword_of_uruk_tv_02_ki_attack_fatina_asshole_02,43)
druaga_no_tou_the_sword_of_uruk_tv_op_t11=druaga_no_tou_the_sword_of_uruk_tv_op_04+TRIM_MIDDLE_CLIP(druaga_no_tou_the_sword_of_uruk_tv_10_coopa_become_high,28)+TRIM_FIRST_CLIP(druaga_no_tou_the_sword_of_uruk_tv_12_coopa_pull_everyone,80) \
	+TRIM_LAST_CLIP(druaga_no_tou_the_sword_of_uruk_tv_11_tower_gun,53)+druaga_no_tou_the_sword_of_uruk_tv_op_05+BlankClip(druaga_no_tou_the_sword_of_uruk_tv_op,length=90,color=color_black)

druaga_no_tou_the_sword_of_uruk_tv_op_mute=druaga_no_tou_the_sword_of_uruk_tv_op_t01+druaga_no_tou_the_sword_of_uruk_tv_op_t02+druaga_no_tou_the_sword_of_uruk_tv_op_t03+druaga_no_tou_the_sword_of_uruk_tv_op_t04 \
	+DOUBLE_FADE_WITH_BRIGHTNESS_OFFSET_RGB24(druaga_no_tou_the_sword_of_uruk_tv_op_t05,druaga_no_tou_the_sword_of_uruk_tv_op_t06,fade_length,fade_length)+druaga_no_tou_the_sword_of_uruk_tv_op_t07+druaga_no_tou_the_sword_of_uruk_tv_op_t08 \
	+druaga_no_tou_the_sword_of_uruk_tv_op_t09+FADE_IN_WITH_BRIGHTNESS_OFFSET_RGB24(druaga_no_tou_the_sword_of_uruk_tv_op_t10,fade_length)+druaga_no_tou_the_sword_of_uruk_tv_op_t11

######## Music ########

bgm_48khz=SSRC(WAVSource("src\druaga_no_tou-the_sword_of_uruk-op-01.wav"),48000)
AudioDub(druaga_no_tou_the_sword_of_uruk_tv_op_mute,bgm_48khz)

######## Subtitle ########

subtitle_x=50
subtitle_y=400
global subtitle_front_fade_count=30
global subtitle_rear_fade_count=30
global subtitle_font="MS Gothic"
global subtitle_effects="bi"
global subtitle_size=28
global subtitle_text_color=OVERWRITE_COLOR_ALPHA(color_white,$3F)
global subtitle_halo_color=color_black

function SUBTITLE_FX(clip clip,string text,float x,float y,int start_frame,int end_frame,bool "is_title"){
	is_title=Default(is_title,false)

	text_color=is_title?OVERWRITE_COLOR_ALPHA(color_skyblue,$3F):subtitle_text_color

	return SUBTITLE_FX_SMEAR_IN_SMEAR_OUT(clip,text,x,y,start_frame,end_frame,subtitle_front_fade_count,subtitle_rear_fade_count,subtitle_font,subtitle_effects,subtitle_size,text_color,subtitle_halo_color)
}

SUBTITLE_FX("Questions?//中村優|- by fielia@AVISynth",subtitle_x,subtitle_y-subtitle_size,341,583,true)

SUBTITLE_FX("ボクらはすっかりヤラれちゃって",subtitle_x,subtitle_y,657,737)
SUBTITLE_FX("ハンパな笑顔貼りつけてる",subtitle_x,subtitle_y-subtitle_size,738,831)
SUBTITLE_FX("この世界の石コロ",subtitle_x,subtitle_y,849,950)

SUBTITLE_FX("成長してるつもりでも",subtitle_x,subtitle_y-subtitle_size,978,1057)
SUBTITLE_FX("がんばっちゃってる友達には",subtitle_x,subtitle_y,1060,1152)
SUBTITLE_FX("敵わないってポツリ",subtitle_x,subtitle_y-subtitle_size,1170,1272)

SUBTITLE_FX("見上げる空はキレイだけれど",subtitle_x,subtitle_y,1301,1458)
SUBTITLE_FX("空はボクを見てくれてるかな?",subtitle_x,subtitle_y-subtitle_size,1461,1599)

SUBTITLE_FX("止まない Question",subtitle_x,subtitle_y,1663,1714)
SUBTITLE_FX("消えない Question",subtitle_x,subtitle_y-subtitle_size,1743,1794)
SUBTITLE_FX("コタエアワセなんか出来ない Oh,no!!",subtitle_x,subtitle_y,1824,1958)
SUBTITLE_FX("知らない Question",subtitle_x,subtitle_y-subtitle_size,1983,2036)
SUBTITLE_FX("登れない Question",subtitle_x,subtitle_y,2058,2114)
SUBTITLE_FX("知りたがりの子供のまま",subtitle_x,subtitle_y-subtitle_size,2143,2236)
SUBTITLE_FX("まだ笑っていたい",subtitle_x,subtitle_y,2254,2316)

SUBTITLE_FX("自分を信じりゃいいんだって",subtitle_x,subtitle_y,2707,2787)
SUBTITLE_FX("言うけどそうなに簡単じゃないよね?",subtitle_x,subtitle_y-subtitle_size,2788,2919)
SUBTITLE_FX("みんなどうなの?",subtitle_x,subtitle_y,2937,3000)

SUBTITLE_FX("ボクの好きとか嫌いなんて",subtitle_x,subtitle_y-subtitle_size,3028,3108)
SUBTITLE_FX("たとえば天気のいい悪いで",subtitle_x,subtitle_y,3109,3200)
SUBTITLE_FX("コロコロ変わるし",subtitle_x,subtitle_y-subtitle_size,3220,3320)

SUBTITLE_FX("悔シ涙のカッコ悪さを",subtitle_x,subtitle_y,3349,3507)
SUBTITLE_FX("クシャクシャにしてポケットに突っ込む",subtitle_x,subtitle_y-subtitle_size,3511,3650)

SUBTITLE_FX("止まない Question",subtitle_x,subtitle_y,3711,3764)
SUBTITLE_FX("足りない Question",subtitle_x,subtitle_y-subtitle_size,3792,3844)
SUBTITLE_FX("宿題はまだまだ続く Oh,no!!",subtitle_x,subtitle_y,3871,4007)
SUBTITLE_FX("見えない Question",subtitle_x,subtitle_y-subtitle_size,4034,4084)
SUBTITLE_FX("届かない Question",subtitle_x,subtitle_y,4107,4167)
SUBTITLE_FX("油性ペンで書き続けた答え",subtitle_x,subtitle_y-subtitle_size,4195,4327)
SUBTITLE_FX("消えてない",subtitle_x,subtitle_y,4330,4370)
SUBTITLE_FX("あんなに遠くから",subtitle_x,subtitle_y,4423,4547)

SUBTITLE_FX("月を見ていた",subtitle_x,subtitle_y,5479,5530)
SUBTITLE_FX("とてもキレイだ",subtitle_x,subtitle_y-subtitle_size,5560,5612)
SUBTITLE_FX("ボクもいつか満ちるのかな?",subtitle_x,subtitle_y,5639,5733)

SUBTITLE_FX("止まない Question",subtitle_x,subtitle_y,5842,5893)
SUBTITLE_FX("消えない Question",subtitle_x,subtitle_y-subtitle_size,5921,5974)
SUBTITLE_FX("コタエアワセなんか出来ない Oh,no!!",subtitle_x,subtitle_y,6002,6138)
SUBTITLE_FX("知らない Question",subtitle_x,subtitle_y-subtitle_size,6162,6215)
SUBTITLE_FX("登れない Question",subtitle_x,subtitle_y,6237,6296)
SUBTITLE_FX("知りたがりの子供のまま",subtitle_x,subtitle_y-subtitle_size,6322,6419)
SUBTITLE_FX("まだ笑っていたい",subtitle_x,subtitle_y,6433,6497)

SUBTITLE_FX("まだまだ笑ってたいんだ",subtitle_x,subtitle_y,6555,6667)
SUBTITLE_FX("答えは それだけさ",subtitle_x,subtitle_y,6714,6823)

######## Post Processing ########

ConvertToYV12()
#ConvertToYUY2()
#ConvertToRGB24()

TCPServer()
