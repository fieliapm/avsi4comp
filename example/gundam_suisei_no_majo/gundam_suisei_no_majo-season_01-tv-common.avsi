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

enable_multi_thread=false

gundam_suisei_no_majo_season_01_tv_01=FFMS2_VIDEO_SOURCE("src\[POPGO][Mobile_Suit_Gundam_The_Witch_from_Mercury][00-12][Webrip][MKV]\[POPGO][Mobile_Suit_Gundam_The_Witch_from_Mercury][01][1080p][HEVC][Webrip](F02E2B6B).mkv",enable_multi_thread=enable_multi_thread)
gundam_suisei_no_majo_season_01_tv_02=FFMS2_VIDEO_SOURCE("src\[POPGO][Mobile_Suit_Gundam_The_Witch_from_Mercury][00-12][Webrip][MKV]\[POPGO][Mobile_Suit_Gundam_The_Witch_from_Mercury][02][1080p][HEVC][Webrip](0307FF65).mkv",enable_multi_thread=enable_multi_thread)
gundam_suisei_no_majo_season_01_tv_03=FFMS2_VIDEO_SOURCE("src\[POPGO][Mobile_Suit_Gundam_The_Witch_from_Mercury][00-12][Webrip][MKV]\[POPGO][Mobile_Suit_Gundam_The_Witch_from_Mercury][03][1080p][HEVC][Webrip](466EA2CA).mkv",enable_multi_thread=enable_multi_thread)
gundam_suisei_no_majo_season_01_tv_04=FFMS2_VIDEO_SOURCE("src\[POPGO][Mobile_Suit_Gundam_The_Witch_from_Mercury][00-12][Webrip][MKV]\[POPGO][Mobile_Suit_Gundam_The_Witch_from_Mercury][04][1080p][HEVC][Webrip](94FFF15D).mkv",enable_multi_thread=enable_multi_thread)
gundam_suisei_no_majo_season_01_tv_05=FFMS2_VIDEO_SOURCE("src\[POPGO][Mobile_Suit_Gundam_The_Witch_from_Mercury][00-12][Webrip][MKV]\[POPGO][Mobile_Suit_Gundam_The_Witch_from_Mercury][05][1080p][HEVC][Webrip](42846E11).mkv",enable_multi_thread=enable_multi_thread)
gundam_suisei_no_majo_season_01_tv_06=FFMS2_VIDEO_SOURCE("src\[POPGO][Mobile_Suit_Gundam_The_Witch_from_Mercury][00-12][Webrip][MKV]\[POPGO][Mobile_Suit_Gundam_The_Witch_from_Mercury][06][1080p][HEVC][Webrip](1F80B77B).mkv",enable_multi_thread=enable_multi_thread)
gundam_suisei_no_majo_season_01_tv_07=FFMS2_VIDEO_SOURCE("src\[POPGO][Mobile_Suit_Gundam_The_Witch_from_Mercury][00-12][Webrip][MKV]\[POPGO][Mobile_Suit_Gundam_The_Witch_from_Mercury][07][1080p][HEVC][Webrip](11A76DDC).mkv",enable_multi_thread=enable_multi_thread)
gundam_suisei_no_majo_season_01_tv_08=FFMS2_VIDEO_SOURCE("src\[POPGO][Mobile_Suit_Gundam_The_Witch_from_Mercury][00-12][Webrip][MKV]\[POPGO][Mobile_Suit_Gundam_The_Witch_from_Mercury][08][1080p][HEVC][Webrip](0A80DAE1).mkv",enable_multi_thread=enable_multi_thread)
gundam_suisei_no_majo_season_01_tv_09=FFMS2_VIDEO_SOURCE("src\[POPGO][Mobile_Suit_Gundam_The_Witch_from_Mercury][00-12][Webrip][MKV]\[POPGO][Mobile_Suit_Gundam_The_Witch_from_Mercury][09][1080p][HEVC][Webrip](88C94C1D).mkv",enable_multi_thread=enable_multi_thread)
gundam_suisei_no_majo_season_01_tv_10=FFMS2_VIDEO_SOURCE("src\[POPGO][Mobile_Suit_Gundam_The_Witch_from_Mercury][00-12][Webrip][MKV]\[POPGO][Mobile_Suit_Gundam_The_Witch_from_Mercury][10][1080p][HEVC][Webrip](0BB4744C).mkv",enable_multi_thread=enable_multi_thread)
gundam_suisei_no_majo_season_01_tv_11=FFMS2_VIDEO_SOURCE("src\[POPGO][Mobile_Suit_Gundam_The_Witch_from_Mercury][00-12][Webrip][MKV]\[POPGO][Mobile_Suit_Gundam_The_Witch_from_Mercury][11][1080p][HEVC][Webrip](90E671C0).mkv",enable_multi_thread=enable_multi_thread)
gundam_suisei_no_majo_season_01_tv_12=FFMS2_VIDEO_SOURCE("src\[POPGO][Mobile_Suit_Gundam_The_Witch_from_Mercury][00-12][Webrip][MKV]\[POPGO][Mobile_Suit_Gundam_The_Witch_from_Mercury][12][1080p][HEVC][Webrip](92BC1B29).mkv",enable_multi_thread=enable_multi_thread)


gundam_suisei_no_majo_season_01_tv_clean_op=Trim(gundam_suisei_no_majo_season_01_tv_02,1714,3860)

######## Trim ########

gundam_suisei_no_majo_season_01_tv_clean_op_01=Trim(gundam_suisei_no_majo_season_01_tv_clean_op,0,283)
gundam_suisei_no_majo_season_01_tv_clean_op_02=Trim(gundam_suisei_no_majo_season_01_tv_clean_op,284,379)
gundam_suisei_no_majo_season_01_tv_clean_op_03=Trim(gundam_suisei_no_majo_season_01_tv_clean_op,380,419)

gundam_suisei_no_majo_season_01_tv_clean_op_04=Trim(gundam_suisei_no_majo_season_01_tv_clean_op,420,958)
gundam_suisei_no_majo_season_01_tv_clean_op_05=Trim(gundam_suisei_no_majo_season_01_tv_clean_op,959,1224)

gundam_suisei_no_majo_season_01_tv_clean_op_06=Trim(gundam_suisei_no_majo_season_01_tv_clean_op,1225,1501)
gundam_suisei_no_majo_season_01_tv_clean_op_07=Trim(gundam_suisei_no_majo_season_01_tv_clean_op,1502,1639)
gundam_suisei_no_majo_season_01_tv_clean_op_08=Trim(gundam_suisei_no_majo_season_01_tv_clean_op,1640,1840)
gundam_suisei_no_majo_season_01_tv_clean_op_09=Trim(gundam_suisei_no_majo_season_01_tv_clean_op,1841,0)


gundam_suisei_no_majo_season_01_tv_01_aerial_permet_01=Trim(gundam_suisei_no_majo_season_01_tv_01,28759,28843) #85 op
gundam_suisei_no_majo_season_01_tv_01_aerial_permet_02=Trim(gundam_suisei_no_majo_season_01_tv_01,28844,28953) #110 op
gundam_suisei_no_majo_season_01_tv_01_aerial_funnel=Trim(gundam_suisei_no_majo_season_01_tv_01,28978,29067) #90 op

gundam_suisei_no_majo_season_01_tv_02_ms_surround_aerial=Trim(gundam_suisei_no_majo_season_01_tv_02,4639,4806) #168 op
gundam_suisei_no_majo_season_01_tv_02_miorine_play_mobile_game=Trim(gundam_suisei_no_majo_season_01_tv_02,16166,16311) #146 op

gundam_suisei_no_majo_season_01_tv_03_miorine_hit_suletta=Trim(gundam_suisei_no_majo_season_01_tv_03,957,1151) #195
gundam_suisei_no_majo_season_01_tv_03_miorine_tell_suletta_off=Trim(gundam_suisei_no_majo_season_01_tv_03,11251,11340) #90 op
gundam_suisei_no_majo_season_01_tv_03_aerial_funnel=Trim(gundam_suisei_no_majo_season_01_tv_03,25907,26009) #103 op
gundam_suisei_no_majo_season_01_tv_03_guel_propose_to_suletta=Trim(gundam_suisei_no_majo_season_01_tv_03,32039,32177) #139 op

gundam_suisei_no_majo_season_01_tv_04_guel_bow_to_suletta=Trim(gundam_suisei_no_majo_season_01_tv_04,6500,6532) #33 op
gundam_suisei_no_majo_season_01_tv_04_ms_fire_to_resist=Trim(gundam_suisei_no_majo_season_01_tv_04,18735,18820) #86 op
gundam_suisei_no_majo_season_01_tv_04_miorine_talk_with_suletta=Trim(gundam_suisei_no_majo_season_01_tv_04,21246,21695) #450 op

gundam_suisei_no_majo_season_01_tv_05_earth_students_dorm=Trim(gundam_suisei_no_majo_season_01_tv_05,8538,8721) #184 op
gundam_suisei_no_majo_season_01_tv_05_aerial_walking=Trim(gundam_suisei_no_majo_season_01_tv_05,17072,17252) #181 op
gundam_suisei_no_majo_season_01_tv_05_elan_see_suletta=Trim(gundam_suisei_no_majo_season_01_tv_05,17675,17818) #144 op

gundam_suisei_no_majo_season_01_tv_06_earth_students_dorm=Trim(gundam_suisei_no_majo_season_01_tv_06,4326,4502) #177 op
gundam_suisei_no_majo_season_01_tv_06_aerial=Trim(gundam_suisei_no_majo_season_01_tv_06,7478,7551) #74
gundam_suisei_no_majo_season_01_tv_06_chuatury_squat_and_see_nika_thinking=Trim(gundam_suisei_no_majo_season_01_tv_06,7914,8047) #134 op
gundam_suisei_no_majo_season_01_tv_06_elan_see_spirit=Trim(gundam_suisei_no_majo_season_01_tv_06,26178,26285) #108 op
gundam_suisei_no_majo_season_01_tv_06_spirit_surround_pharact=Trim(gundam_suisei_no_majo_season_01_tv_06,26322,26484) #163 op

gundam_suisei_no_majo_season_01_tv_07_incubation_party=Trim(gundam_suisei_no_majo_season_01_tv_07,4925,5100) #176 op
gundam_suisei_no_majo_season_01_tv_07_miorine_beat_suletta=Trim(gundam_suisei_no_majo_season_01_tv_07,5582,5627) #46 op
gundam_suisei_no_majo_season_01_tv_07_elan_talk_with_suletta=Trim(gundam_suisei_no_majo_season_01_tv_07,15973,16185) #213
gundam_suisei_no_majo_season_01_tv_07_miorine_see_fundraising=Trim(gundam_suisei_no_majo_season_01_tv_07,30557,30600) #44 op

gundam_suisei_no_majo_season_01_tv_08_earth_students_discuss=Trim(gundam_suisei_no_majo_season_01_tv_08,13300,13416) #117 op
gundam_suisei_no_majo_season_01_tv_08_suletta_and_miorine_ride_bike_01=Trim(gundam_suisei_no_majo_season_01_tv_08,29723,29773) #51 op
gundam_suisei_no_majo_season_01_tv_08_suletta_and_miorine_ride_bike_02=Trim(gundam_suisei_no_majo_season_01_tv_08,29774,30069) #296
gundam_suisei_no_majo_season_01_tv_08_suletta_see_star_night_on_bike=Trim(gundam_suisei_no_majo_season_01_tv_08,30186,30263) #78 op
gundam_suisei_no_majo_season_01_tv_08_miorine_lay_on_suletta_s_back=Trim(gundam_suisei_no_majo_season_01_tv_08,30264,30443) #180 op

gundam_suisei_no_majo_season_01_tv_09_earth_students_in_classroom=Trim(gundam_suisei_no_majo_season_01_tv_09,9163,9293) #131 op
gundam_suisei_no_majo_season_01_tv_09_guel_stand_on_path_under_sunset=Trim(gundam_suisei_no_majo_season_01_tv_09,11829,11964) #136 op
gundam_suisei_no_majo_season_01_tv_09_aerial_evade_from_ms_attack=Trim(gundam_suisei_no_majo_season_01_tv_09,27696,27770) #75 op

gundam_suisei_no_majo_season_01_tv_10_students_see_suletta_control_robot=Trim(gundam_suisei_no_majo_season_01_tv_10,6230,6258) #29 op
gundam_suisei_no_majo_season_01_tv_10_suletta_control_robot=Trim(gundam_suisei_no_majo_season_01_tv_10,6259,6326) #68 op
gundam_suisei_no_majo_season_01_tv_10_sophie_show_gund_cm_to_norea=Trim(gundam_suisei_no_majo_season_01_tv_10,18271,18438) #168 op
gundam_suisei_no_majo_season_01_tv_10_elan_touch_suletta=Trim(gundam_suisei_no_majo_season_01_tv_10,23550,23595) #46 op

gundam_suisei_no_majo_season_01_tv_11_earth_students_take_launch=Trim(gundam_suisei_no_majo_season_01_tv_11,9393,9558) #166 op
gundam_suisei_no_majo_season_01_tv_11_miorine_hug_suletta_01=Trim(gundam_suisei_no_majo_season_01_tv_11,22994,23158) #165 op
gundam_suisei_no_majo_season_01_tv_11_miorine_hug_suletta_02=Trim(gundam_suisei_no_majo_season_01_tv_11,23620,23896) #277
gundam_suisei_no_majo_season_01_tv_11_suletta_hug_miorine=Trim(gundam_suisei_no_majo_season_01_tv_11,24504,24653) #150 op

gundam_suisei_no_majo_season_01_tv_12_aerial_fight_with_lfrith=Trim(gundam_suisei_no_majo_season_01_tv_12,26303,26417) #115 op
gundam_suisei_no_majo_season_01_tv_12_aerial_fight_with_lfrith_ur_thorn=Trim(gundam_suisei_no_majo_season_01_tv_12,27034,27206) #173 op
gundam_suisei_no_majo_season_01_tv_12_miorine_and_suletta_in_front_of_aerial=Trim(gundam_suisei_no_majo_season_01_tv_12,34051,34188) #138 op
