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



MP_Pipeline("""

### inherit start ###

Import("..\avsi4comp\macro.avsi")

### inherit end ###

######## Function ########

function MOVE_CG(clip cg,int dir_x,int dir_y,float move_offset,float scale){
	cg_frame_count=Framecount(cg)
	cg_width_half=Width(cg)/2
	cg_height_half=Height(cg)/2
	move_offset_half=move_offset*0.5

	return ScriptClip(cg,"FAST_ZOOM(dstx=Spline(current_frame,0,"+String(cg_width_half)+"-("+String(move_offset_half)+"*("+String(dir_x)+")),"+String(cg_frame_count)+","+String(cg_width_half)+"+("+String(move_offset_half)+"*("+String(dir_x)+")),cubic=false)," \
		+"dsty=Spline(current_frame,0,"+String(cg_height_half)+"-("+String(move_offset_half)+"*("+String(dir_y)+")),"+String(cg_frame_count)+","+String(cg_height_half)+"+("+String(move_offset_half)+"*("+String(dir_y)+")),cubic=false),factor="+String(scale)+",extend=true)")
}

######## BD (1080P) ########

fpsnum=120000
fpsden=1001

enable_multi_thread=false

koukaku_kidoutai_sac_op_bs=FFMS2_VIDEO_SOURCE("src\koukaku_kidoutai\koukaku_kidoutai_sac\special\koukaku_kidoutai_sac-tv-sp-op.mp4",fpsnum=fpsnum,fpsden=fpsden,enable_multi_thread=enable_multi_thread)

koukaku_kidoutai_sac_op_bs_01=Trim(koukaku_kidoutai_sac_op_bs,0,10759) #10760
koukaku_kidoutai_sac_op_bs_02=Trim(koukaku_kidoutai_sac_op_bs,10760,0) #280



koukaku_kidoutai_sac_op_temp=FFMS2_VIDEO_SOURCE("src\koukaku_kidoutai\koukaku_kidoutai_sac\special\koukaku_kidoutai_sac-tv-sp-op-temporary.mp4",fpsnum=fpsnum,fpsden=fpsden,enable_multi_thread=enable_multi_thread)

koukaku_kidoutai_sac_op_temp_01=Trim(koukaku_kidoutai_sac_op_temp,0,358)
koukaku_kidoutai_sac_op_temp_02=Trim(koukaku_kidoutai_sac_op_temp,359,3168)
koukaku_kidoutai_sac_op_temp_03=Trim(koukaku_kidoutai_sac_op_temp,3169,4528)
koukaku_kidoutai_sac_op_temp_04=Trim(koukaku_kidoutai_sac_op_temp,4529,5866)
koukaku_kidoutai_sac_op_temp_05_title=Trim(koukaku_kidoutai_sac_op_temp,5867,7358) #1492
koukaku_kidoutai_sac_op_temp_06=Trim(koukaku_kidoutai_sac_op_temp,7359,7912)
koukaku_kidoutai_sac_op_temp_07=Trim(koukaku_kidoutai_sac_op_temp,7913,9147)
koukaku_kidoutai_sac_op_temp_08=Trim(koukaku_kidoutai_sac_op_temp,9148,0)



koukaku_kidoutai_sac_tv_01=FFMS2_VIDEO_SOURCE("src\koukaku_kidoutai\koukaku_kidoutai_sac\koukaku_kidoutai_sac-tv-01.mp4",fpsnum=fpsnum,fpsden=fpsden,enable_multi_thread=enable_multi_thread)
koukaku_kidoutai_sac_tv_02=FFMS2_VIDEO_SOURCE("src\koukaku_kidoutai\koukaku_kidoutai_sac\koukaku_kidoutai_sac-tv-02.mp4",fpsnum=fpsnum,fpsden=fpsden,enable_multi_thread=enable_multi_thread)
koukaku_kidoutai_sac_tv_03=FFMS2_VIDEO_SOURCE("src\koukaku_kidoutai\koukaku_kidoutai_sac\koukaku_kidoutai_sac-tv-03.mp4",fpsnum=fpsnum,fpsden=fpsden,enable_multi_thread=enable_multi_thread)
koukaku_kidoutai_sac_tv_04=FFMS2_VIDEO_SOURCE("src\koukaku_kidoutai\koukaku_kidoutai_sac\koukaku_kidoutai_sac-tv-04.mp4",fpsnum=fpsnum,fpsden=fpsden,enable_multi_thread=enable_multi_thread)
koukaku_kidoutai_sac_tv_05=FFMS2_VIDEO_SOURCE("src\koukaku_kidoutai\koukaku_kidoutai_sac\koukaku_kidoutai_sac-tv-05.mp4",fpsnum=fpsnum,fpsden=fpsden,enable_multi_thread=enable_multi_thread)
koukaku_kidoutai_sac_tv_06=FFMS2_VIDEO_SOURCE("src\koukaku_kidoutai\koukaku_kidoutai_sac\koukaku_kidoutai_sac-tv-06.mp4",fpsnum=fpsnum,fpsden=fpsden,enable_multi_thread=enable_multi_thread)
koukaku_kidoutai_sac_tv_07=FFMS2_VIDEO_SOURCE("src\koukaku_kidoutai\koukaku_kidoutai_sac\koukaku_kidoutai_sac-tv-07.mp4",fpsnum=fpsnum,fpsden=fpsden,enable_multi_thread=enable_multi_thread)
koukaku_kidoutai_sac_tv_08=FFMS2_VIDEO_SOURCE("src\koukaku_kidoutai\koukaku_kidoutai_sac\koukaku_kidoutai_sac-tv-08.mp4",fpsnum=fpsnum,fpsden=fpsden,enable_multi_thread=enable_multi_thread)
koukaku_kidoutai_sac_tv_09=FFMS2_VIDEO_SOURCE("src\koukaku_kidoutai\koukaku_kidoutai_sac\koukaku_kidoutai_sac-tv-09.mp4",fpsnum=fpsnum,fpsden=fpsden,enable_multi_thread=enable_multi_thread)
koukaku_kidoutai_sac_tv_10=FFMS2_VIDEO_SOURCE("src\koukaku_kidoutai\koukaku_kidoutai_sac\koukaku_kidoutai_sac-tv-10.mp4",fpsnum=fpsnum,fpsden=fpsden,enable_multi_thread=enable_multi_thread)
koukaku_kidoutai_sac_tv_11=FFMS2_VIDEO_SOURCE("src\koukaku_kidoutai\koukaku_kidoutai_sac\koukaku_kidoutai_sac-tv-11.mp4",fpsnum=fpsnum,fpsden=fpsden,enable_multi_thread=enable_multi_thread)
koukaku_kidoutai_sac_tv_12=FFMS2_VIDEO_SOURCE("src\koukaku_kidoutai\koukaku_kidoutai_sac\koukaku_kidoutai_sac-tv-12.mp4",fpsnum=fpsnum,fpsden=fpsden,enable_multi_thread=enable_multi_thread)
koukaku_kidoutai_sac_tv_13=FFMS2_VIDEO_SOURCE("src\koukaku_kidoutai\koukaku_kidoutai_sac\koukaku_kidoutai_sac-tv-13.mp4",fpsnum=fpsnum,fpsden=fpsden,enable_multi_thread=enable_multi_thread)
koukaku_kidoutai_sac_tv_14=FFMS2_VIDEO_SOURCE("src\koukaku_kidoutai\koukaku_kidoutai_sac\koukaku_kidoutai_sac-tv-14.mp4",fpsnum=fpsnum,fpsden=fpsden,enable_multi_thread=enable_multi_thread)
koukaku_kidoutai_sac_tv_15=FFMS2_VIDEO_SOURCE("src\koukaku_kidoutai\koukaku_kidoutai_sac\koukaku_kidoutai_sac-tv-15.mp4",fpsnum=fpsnum,fpsden=fpsden,enable_multi_thread=enable_multi_thread)
koukaku_kidoutai_sac_tv_16=FFMS2_VIDEO_SOURCE("src\koukaku_kidoutai\koukaku_kidoutai_sac\koukaku_kidoutai_sac-tv-16.mp4",fpsnum=fpsnum,fpsden=fpsden,enable_multi_thread=enable_multi_thread)
koukaku_kidoutai_sac_tv_17=FFMS2_VIDEO_SOURCE("src\koukaku_kidoutai\koukaku_kidoutai_sac\koukaku_kidoutai_sac-tv-17.mp4",fpsnum=fpsnum,fpsden=fpsden,enable_multi_thread=enable_multi_thread)
koukaku_kidoutai_sac_tv_18=FFMS2_VIDEO_SOURCE("src\koukaku_kidoutai\koukaku_kidoutai_sac\koukaku_kidoutai_sac-tv-18.mp4",fpsnum=fpsnum,fpsden=fpsden,enable_multi_thread=enable_multi_thread)
koukaku_kidoutai_sac_tv_19=FFMS2_VIDEO_SOURCE("src\koukaku_kidoutai\koukaku_kidoutai_sac\koukaku_kidoutai_sac-tv-19.mp4",fpsnum=fpsnum,fpsden=fpsden,enable_multi_thread=enable_multi_thread)
#koukaku_kidoutai_sac_tv_20=FFMS2_VIDEO_SOURCE("src\koukaku_kidoutai\koukaku_kidoutai_sac\koukaku_kidoutai_sac-tv-20.mp4",fpsnum=fpsnum,fpsden=fpsden,enable_multi_thread=enable_multi_thread)
#koukaku_kidoutai_sac_tv_21=FFMS2_VIDEO_SOURCE("src\koukaku_kidoutai\koukaku_kidoutai_sac\koukaku_kidoutai_sac-tv-21.mp4",fpsnum=fpsnum,fpsden=fpsden,enable_multi_thread=enable_multi_thread)
#koukaku_kidoutai_sac_tv_22=FFMS2_VIDEO_SOURCE("src\koukaku_kidoutai\koukaku_kidoutai_sac\koukaku_kidoutai_sac-tv-22.mp4",fpsnum=fpsnum,fpsden=fpsden,enable_multi_thread=enable_multi_thread)
#koukaku_kidoutai_sac_tv_23=FFMS2_VIDEO_SOURCE("src\koukaku_kidoutai\koukaku_kidoutai_sac\koukaku_kidoutai_sac-tv-23.mp4",fpsnum=fpsnum,fpsden=fpsden,enable_multi_thread=enable_multi_thread)
#koukaku_kidoutai_sac_tv_24=FFMS2_VIDEO_SOURCE("src\koukaku_kidoutai\koukaku_kidoutai_sac\koukaku_kidoutai_sac-tv-24.mp4",fpsnum=fpsnum,fpsden=fpsden,enable_multi_thread=enable_multi_thread)
#koukaku_kidoutai_sac_tv_25=FFMS2_VIDEO_SOURCE("src\koukaku_kidoutai\koukaku_kidoutai_sac\koukaku_kidoutai_sac-tv-25.mp4",fpsnum=fpsnum,fpsden=fpsden,enable_multi_thread=enable_multi_thread)
koukaku_kidoutai_sac_tv_26=FFMS2_VIDEO_SOURCE("src\koukaku_kidoutai\koukaku_kidoutai_sac\koukaku_kidoutai_sac-tv-26.mp4",fpsnum=fpsnum,fpsden=fpsden,enable_multi_thread=enable_multi_thread)

koukaku_kidoutai_sac_tv_01_op=Trim(koukaku_kidoutai_sac_tv_01,0,10766)

koukaku_kidoutai_sac_tv_01_motoko_fight_against_terrorist_01=Trim(koukaku_kidoutai_sac_tv_01,16143,16377) #235 op
koukaku_kidoutai_sac_tv_01_motoko_fight_against_terrorist_02=Trim(koukaku_kidoutai_sac_tv_01,16378,16472) #95 op
koukaku_kidoutai_sac_tv_01_motoko_fight_against_terrorist_03=Trim(koukaku_kidoutai_sac_tv_01,16473,16588) #116 op
koukaku_kidoutai_sac_tv_01_motoko_fight_against_terrorist_04=Trim(koukaku_kidoutai_sac_tv_01,16589,16638) #50 op
koukaku_kidoutai_sac_tv_01_motoko_fight_against_terrorist_05=Trim(koukaku_kidoutai_sac_tv_01,16639,16938) #300 op
koukaku_kidoutai_sac_tv_01_togusa_dash_and_hide=Trim(koukaku_kidoutai_sac_tv_01,48413,48708) #296
koukaku_kidoutai_sac_tv_01_batou_land_and_hide=Trim(koukaku_kidoutai_sac_tv_01,49038,49603) #566
koukaku_kidoutai_sac_tv_01_geisha_hostage_people=Trim(koukaku_kidoutai_sac_tv_01,51428,51938) #511

koukaku_kidoutai_sac_tv_02_haw206_turn_back=Trim(koukaku_kidoutai_sac_tv_02,14819,16422) #1604
koukaku_kidoutai_sac_tv_02_haw206_fire_01=Trim(koukaku_kidoutai_sac_tv_02,17163,17272) #110
koukaku_kidoutai_sac_tv_02_haw206_fire_02=Trim(koukaku_kidoutai_sac_tv_02,17273,17657) #385
koukaku_kidoutai_sac_tv_02_haw206_break_gate=Trim(koukaku_kidoutai_sac_tv_02,22959,23727) #769
koukaku_kidoutai_sac_tv_02_all_tachikoma_follow_haw206=Trim(koukaku_kidoutai_sac_tv_02,53799,54968) #1170 op
koukaku_kidoutai_sac_tv_02_haw206_is_under_attack=Trim(koukaku_kidoutai_sac_tv_02,79438,79833) #396
koukaku_kidoutai_sac_tv_02_helicopter_turn_back=Trim(koukaku_kidoutai_sac_tv_02,83688,83973) #286

koukaku_kidoutai_sac_tv_03_batou_and_tokusa_dash_inside_01=Trim(koukaku_kidoutai_sac_tv_03,88616,88966) #351 op
koukaku_kidoutai_sac_tv_03_batou_and_tokusa_dash_inside_02=Trim(koukaku_kidoutai_sac_tv_03,88967,89275) #309 op

koukaku_kidoutai_sac_tv_04_laughing_man_broadcast=Trim(koukaku_kidoutai_sac_tv_04,160362,162481) #2480
koukaku_kidoutai_sac_tv_04_laughing_man_icon=Trim(koukaku_kidoutai_sac_tv_04,164602,165216) #615 op
koukaku_kidoutai_sac_tv_04_laughing_man_icon_shutdown=Trim(koukaku_kidoutai_sac_tv_04,165217,165321) #105 op
#koukaku_kidoutai_sac_tv_04_laughing_man_icon_after_shutdown=Trim(koukaku_kidoutai_sac_tv_04,165322,165451) #130

koukaku_kidoutai_sac_tv_05_nasumi_make_drink_for_motoko=Trim(koukaku_kidoutai_sac_tv_05,76503,77142) #640 op
koukaku_kidoutai_sac_tv_05_nasumi_and_ran_sleeping=Trim(koukaku_kidoutai_sac_tv_05,106042,106387) #346
koukaku_kidoutai_sac_tv_05_send_via_computer=Trim(koukaku_kidoutai_sac_tv_05,163938,164342) #405

koukaku_kidoutai_sac_tv_06_motoko_kick_police_01=Trim(koukaku_kidoutai_sac_tv_06,42485,42720) #236 op
koukaku_kidoutai_sac_tv_06_motoko_kick_police_02=Trim(koukaku_kidoutai_sac_tv_06,45145,45520) #376 op
koukaku_kidoutai_sac_tv_06_bigger_terrorist_attack_motoko=Trim(koukaku_kidoutai_sac_tv_06,86125,86494) #370

koukaku_kidoutai_sac_tv_07_tachikoma_shoot_silk_01=Trim(koukaku_kidoutai_sac_tv_07,52218,52457) #240
koukaku_kidoutai_sac_tv_07_tachikoma_shoot_silk_02=Trim(koukaku_kidoutai_sac_tv_07,52458,52537) #80
koukaku_kidoutai_sac_tv_07_tachikoma_shoot_silk_03=Trim(koukaku_kidoutai_sac_tv_07,52538,52742) #205
koukaku_kidoutai_sac_tv_07_motoko_fight_against_girl_01=Trim(koukaku_kidoutai_sac_tv_07,81047,81417) #371 op
koukaku_kidoutai_sac_tv_07_motoko_fight_against_girl_02=Trim(koukaku_kidoutai_sac_tv_07,81963,82457) #495 op

koukaku_kidoutai_sac_tv_08_nasumi_see_girl_inside_01=Trim(koukaku_kidoutai_sac_tv_08,25618,26592) #975
koukaku_kidoutai_sac_tv_08_nasumi_see_girl_inside_02=Trim(koukaku_kidoutai_sac_tv_08,27498,29828) #2331 op
koukaku_kidoutai_sac_tv_08_jameson=Trim(koukaku_kidoutai_sac_tv_08,43333,46587) #3256
koukaku_kidoutai_sac_tv_08_tachikoma_and_batou_land=Trim(koukaku_kidoutai_sac_tv_08,101794,102107) #314
koukaku_kidoutai_sac_tv_08_tachikoma_shoot_missile=Trim(koukaku_kidoutai_sac_tv_08,107208,107813) #606
koukaku_kidoutai_sac_tv_08_motoko_smile=Trim(koukaku_kidoutai_sac_tv_08,158248,158552) #305

koukaku_kidoutai_sac_tv_09_laughing_man_mark_built_with_table=Trim(koukaku_kidoutai_sac_tv_09,71578,73492) #1915 op
koukaku_kidoutai_sac_tv_09_motoko_interrupted_01=Trim(koukaku_kidoutai_sac_tv_09,154158,154482) #325
koukaku_kidoutai_sac_tv_09_motoko_interrupted_02=Trim(koukaku_kidoutai_sac_tv_09,154483,154717) #235

koukaku_kidoutai_sac_tv_10_tachikoma_found_electronic_component_01=Trim(koukaku_kidoutai_sac_tv_10,69826,70419) #594
koukaku_kidoutai_sac_tv_10_tachikoma_found_electronic_component_02=Trim(koukaku_kidoutai_sac_tv_10,70420,70845) #426
koukaku_kidoutai_sac_tv_10_war_casualty_01=Trim(koukaku_kidoutai_sac_tv_10,93315,93645) #331 op
koukaku_kidoutai_sac_tv_10_war_casualty_02=Trim(koukaku_kidoutai_sac_tv_10,93646,93940) #295 op

koukaku_kidoutai_sac_tv_11_togusa_walking_in_lab_01=Trim(koukaku_kidoutai_sac_tv_11,64956,66214) #1259 op
koukaku_kidoutai_sac_tv_11_togusa_walking_in_lab_02=Trim(koukaku_kidoutai_sac_tv_11,66215,67290) #1076
koukaku_kidoutai_sac_tv_11_guard_throw_togusa_01=Trim(koukaku_kidoutai_sac_tv_11,129921,130199) #279
koukaku_kidoutai_sac_tv_11_guard_throw_togusa_02=Trim(koukaku_kidoutai_sac_tv_11,130200,130605) #406

koukaku_kidoutai_sac_tv_12_miki_take_tachikoma_01=Trim(koukaku_kidoutai_sac_tv_12,61001,61895) #895
koukaku_kidoutai_sac_tv_12_miki_take_tachikoma_02=Trim(koukaku_kidoutai_sac_tv_12,64941,66554) #1614 op
koukaku_kidoutai_sac_tv_12_tachikoma_walk_around_garden=Trim(koukaku_kidoutai_sac_tv_12,74155,74755) #601
koukaku_kidoutai_sac_tv_12_tachikoma_cry=Trim(koukaku_kidoutai_sac_tv_12,81866,84114) #2249
koukaku_kidoutai_sac_tv_12_motoko_take_tear=Trim(koukaku_kidoutai_sac_tv_12,133731,134104) #374

koukaku_kidoutai_sac_tv_13_submaring_float=Trim(koukaku_kidoutai_sac_tv_13,38992,40065) #1074
koukaku_kidoutai_sac_tv_13_tachikoma_under_attack=Trim(koukaku_kidoutai_sac_tv_13,121651,121906) #256
koukaku_kidoutai_sac_tv_13_soldier_attack_in_back_of_body=Trim(koukaku_kidoutai_sac_tv_13,127411,127705) #295
koukaku_kidoutai_sac_tv_13_all_soldier_fall_down=Trim(koukaku_kidoutai_sac_tv_13,140546,140751) #206
koukaku_kidoutai_sac_tv_13_eka_s_daughter_kick_togusa_and_saitou=Trim(koukaku_kidoutai_sac_tv_13,150691,151225) #535 op
koukaku_kidoutai_sac_tv_13_eka_s_daughter_kick_batou=Trim(koukaku_kidoutai_sac_tv_13,151226,151450) #225 op

koukaku_kidoutai_sac_tv_14_porn=Trim(koukaku_kidoutai_sac_tv_14,27380,28034) #655
koukaku_kidoutai_sac_tv_14_fem_show_shotgun=Trim(koukaku_kidoutai_sac_tv_14,71856,72149) #294
koukaku_kidoutai_sac_tv_14_fem_reload_bullet=Trim(koukaku_kidoutai_sac_tv_14,72926,73635) #710 op
koukaku_kidoutai_sac_tv_14_togusa_turn_helicopter_back=Trim(koukaku_kidoutai_sac_tv_14,94120,95074) #955
koukaku_kidoutai_sac_tv_14_maid_attack_fem=Trim(koukaku_kidoutai_sac_tv_14,125861,125999) #139
koukaku_kidoutai_sac_tv_14_fem_kick_maid_01=Trim(koukaku_kidoutai_sac_tv_14,126000,126104) #105 op
koukaku_kidoutai_sac_tv_14_fem_kick_maid_02=Trim(koukaku_kidoutai_sac_tv_14,126105,126334) #230 op
koukaku_kidoutai_sac_tv_14_motoko_catch_fem=Trim(koukaku_kidoutai_sac_tv_14,135776,136044) #269

koukaku_kidoutai_sac_tv_15_tachikoma_read_book=Trim(koukaku_kidoutai_sac_tv_15,64836,66694) #1859 op
koukaku_kidoutai_sac_tv_15_tachikoma_discuss=Trim(koukaku_kidoutai_sac_tv_15,82976,83554) #579

koukaku_kidoutai_sac_tv_16_batou_punch=Trim(koukaku_kidoutai_sac_tv_16,45668,45817) #150 op
koukaku_kidoutai_sac_tv_16_batou_evade_punch=Trim(koukaku_kidoutai_sac_tv_16,47423,47602) #180 op

koukaku_kidoutai_sac_tv_17_seymour_and_daisuke=Trim(koukaku_kidoutai_sac_tv_17,28955,30178) #1224 op
koukaku_kidoutai_sac_tv_17_swat_coming=Trim(koukaku_kidoutai_sac_tv_17,70895,71329) #435

koukaku_kidoutai_sac_tv_18_yuu_take_truck=Trim(koukaku_kidoutai_sac_tv_18,95534,96242) #709
koukaku_kidoutai_sac_tv_18_helicopter_s_wind_push_fisher=Trim(koukaku_kidoutai_sac_tv_18,133018,133242) #225
koukaku_kidoutai_sac_tv_18_assassin=Trim(koukaku_kidoutai_sac_tv_18,140924,141703) #780 op

koukaku_kidoutai_sac_tv_19_cruzkowa_evade_bullet=Trim(koukaku_kidoutai_sac_tv_19,91561,91710) #150
koukaku_kidoutai_sac_tv_19_cruzkowa_attack_tugusa=Trim(koukaku_kidoutai_sac_tv_19,91711,91905) #195
koukaku_kidoutai_sac_tv_19_togusa_vs_cruzkkowa=Trim(koukaku_kidoutai_sac_tv_19,92230,92620) #391
koukaku_kidoutai_sac_tv_19_explode_in_back_of_truck_01=Trim(koukaku_kidoutai_sac_tv_19,94380,94550) #171
koukaku_kidoutai_sac_tv_19_explode_in_back_of_truck_02=Trim(koukaku_kidoutai_sac_tv_19,94551,94605) #55
koukaku_kidoutai_sac_tv_19_explode_in_back_of_truck_03=Trim(koukaku_kidoutai_sac_tv_19,94606,94845) #240
koukaku_kidoutai_sac_tv_19_cruzkowa_attack_motoko=Trim(koukaku_kidoutai_sac_tv_19,149445,150114) #670 op

koukaku_kidoutai_sac_tv_26_cyber_world_01=Trim(koukaku_kidoutai_sac_tv_26,0,572) #573 op
koukaku_kidoutai_sac_tv_26_cyber_world_02=Trim(koukaku_kidoutai_sac_tv_26,573,1047) #475 op
koukaku_kidoutai_sac_tv_26_cyber_world_03=Trim(koukaku_kidoutai_sac_tv_26,1048,2417) #1370 op
koukaku_kidoutai_sac_tv_26_motoko_talk_with_aoi_aka_laughing_man=Trim(koukaku_kidoutai_sac_tv_26,113148,114157) #1010
koukaku_kidoutai_sac_tv_26_aoi_explain_stand_alone_complex=Trim(koukaku_kidoutai_sac_tv_26,133228,134032) #805 op
koukaku_kidoutai_sac_tv_26_motoko_see_helicopter_get_close=Trim(koukaku_kidoutai_sac_tv_26,158888,159232) #345

######## Pre Combine ########

### inherit start ###

time_ratio=4
fade_length=15

### inherit end ###

koukaku_kidoutai_sac_op_temp_05_title_rgb32=ConvertToRGB32(koukaku_kidoutai_sac_op_temp_05_title)
#title_with_reset_alpha=ResetMask(koukaku_kidoutai_sac_op_temp_05_title_rgb32)
#title_with_mask=ColorKeyMask(title_with_reset_alpha,color_black,$F)
adjust_scale=3.0
title_mask=RGBAdjust(Greyscale(koukaku_kidoutai_sac_op_temp_05_title_rgb32),adjust_scale,adjust_scale,adjust_scale)
title_with_mask=Mask(koukaku_kidoutai_sac_op_temp_05_title_rgb32,title_mask)

koukaku_kidoutai_sac_tv_26_cyber_world=koukaku_kidoutai_sac_tv_26_cyber_world_01+koukaku_kidoutai_sac_tv_26_cyber_world_02+koukaku_kidoutai_sac_tv_26_cyber_world_03
koukaku_kidoutai_sac_tv_26_cyber_world_trimmed=ConvertToRGB32(TRIM_FIRST_CLIP(koukaku_kidoutai_sac_tv_26_cyber_world,Framecount(koukaku_kidoutai_sac_op_temp_05_title)))

title=ConvertToYV12(Layer(koukaku_kidoutai_sac_tv_26_cyber_world_trimmed,title_with_mask,"Add"))



koukaku_kidoutai_sac_tv_14_fem_kick_maid=koukaku_kidoutai_sac_tv_14_fem_kick_maid_01+koukaku_kidoutai_sac_tv_14_fem_kick_maid_02
koukaku_kidoutai_sac_tv_14_fem_kick_maid_fade_out=FadeOut(koukaku_kidoutai_sac_tv_14_fem_kick_maid,fade_length*2*time_ratio)
koukaku_kidoutai_sac_op_temp_02_overlay=Overlay(koukaku_kidoutai_sac_op_temp_02,koukaku_kidoutai_sac_tv_14_fem_kick_maid_fade_out,mode="Add")
koukaku_kidoutai_sac_op_temp_02_overlay=OVERWRITE_RANGE(koukaku_kidoutai_sac_op_temp_02,koukaku_kidoutai_sac_op_temp_02_overlay,0,Framecount(koukaku_kidoutai_sac_tv_14_fem_kick_maid_fade_out)-1)



koukaku_kidoutai_sac_tv_15_tachikoma_read_book_moving=MOVE_CG(koukaku_kidoutai_sac_tv_15_tachikoma_read_book,1,0,192.0,1.1)
koukaku_kidoutai_sac_tv_10_war_casualty_01_moving=MOVE_CG(koukaku_kidoutai_sac_tv_10_war_casualty_01,0,1,108.0,1.1)
koukaku_kidoutai_sac_tv_10_war_casualty=koukaku_kidoutai_sac_tv_10_war_casualty_01_moving+koukaku_kidoutai_sac_tv_10_war_casualty_02



koukaku_kidoutai_sac_tv_01_motoko_fight_against_terrorist=koukaku_kidoutai_sac_tv_01_motoko_fight_against_terrorist_01+koukaku_kidoutai_sac_tv_01_motoko_fight_against_terrorist_02+koukaku_kidoutai_sac_tv_01_motoko_fight_against_terrorist_03+koukaku_kidoutai_sac_tv_01_motoko_fight_against_terrorist_04+koukaku_kidoutai_sac_tv_01_motoko_fight_against_terrorist_05
koukaku_kidoutai_sac_tv_03_batou_and_tokusa_dash_inside=koukaku_kidoutai_sac_tv_03_batou_and_tokusa_dash_inside_01+koukaku_kidoutai_sac_tv_03_batou_and_tokusa_dash_inside_02
laughing_man_icon=koukaku_kidoutai_sac_tv_04_laughing_man_icon+koukaku_kidoutai_sac_tv_04_laughing_man_icon_shutdown
koukaku_kidoutai_sac_tv_06_motoko_kick_police=koukaku_kidoutai_sac_tv_06_motoko_kick_police_01+koukaku_kidoutai_sac_tv_06_motoko_kick_police_02
koukaku_kidoutai_sac_tv_07_motoko_fight_against_girl=koukaku_kidoutai_sac_tv_07_motoko_fight_against_girl_01+koukaku_kidoutai_sac_tv_07_motoko_fight_against_girl_02
koukaku_kidoutai_sac_tv_13_eka_s_daughter_kick=koukaku_kidoutai_sac_tv_13_eka_s_daughter_kick_togusa_and_saitou+koukaku_kidoutai_sac_tv_13_eka_s_daughter_kick_batou

######## Combine ########

#                               (29.97fps)
# koukaku_kidoutai_sac_op_bs_01	617
# koukaku_kidoutai_sac_op_temp_01 531
# koukaku_kidoutai_sac_op_temp_02 *
# koukaku_kidoutai_sac_op_temp_03 3821
# koukaku_kidoutai_sac_op_temp_04 *
# koukaku_kidoutai_sac_op_temp_05_title 5357
# koukaku_kidoutai_sac_op_temp_06 *
# koukaku_kidoutai_sac_op_temp_07 7419.5
# koukaku_kidoutai_sac_op_temp_08 8245



koukaku_kidoutai_sac_op_t01=BlankClip(koukaku_kidoutai_sac_op_bs,length=11*time_ratio,color=color_black)+TRIM_FIRST_CLIP(koukaku_kidoutai_sac_tv_26_aoi_explain_stand_alone_complex,173*time_ratio)+TRIM_MIDDLE_CLIP(koukaku_kidoutai_sac_tv_09_laughing_man_mark_built_with_table,174*time_ratio)+TRIM_LAST_CLIP(koukaku_kidoutai_sac_tv_15_tachikoma_read_book_moving,173*time_ratio)
koukaku_kidoutai_sac_op_t02=Dissolve(Dissolve(koukaku_kidoutai_sac_op_temp_01,koukaku_kidoutai_sac_op_bs_01,15),laughing_man_icon,Framecount(laughing_man_icon)-(158*time_ratio))
koukaku_kidoutai_sac_op_t03=FADE_IN_WITH_BRIGHTNESS_OFFSET(TRIM_MIDDLE_CLIP(koukaku_kidoutai_sac_tv_12_miki_take_tachikoma_02,173*time_ratio),fade_length*2*time_ratio)+TRIM_LAST_CLIP(koukaku_kidoutai_sac_tv_08_nasumi_see_girl_inside_02,183*time_ratio)+koukaku_kidoutai_sac_op_temp_03+koukaku_kidoutai_sac_op_temp_04
koukaku_kidoutai_sac_op_t04=koukaku_kidoutai_sac_op_temp_02_overlay+FADE_OUT_WITH_BRIGHTNESS_OFFSET(TRIM_MIDDLE_CLIP(koukaku_kidoutai_sac_tv_17_seymour_and_daisuke,159*time_ratio),fade_length*2*time_ratio)
koukaku_kidoutai_sac_op_t05=title+koukaku_kidoutai_sac_op_temp_06
koukaku_kidoutai_sac_op_t06=TRIM_LAST_CLIP(koukaku_kidoutai_sac_tv_13_eka_s_daughter_kick,180*time_ratio)+TRIM_MIDDLE_CLIP(koukaku_kidoutai_sac_tv_02_all_tachikoma_follow_haw206,194*time_ratio)+TRIM_MIDDLE_CLIP(koukaku_kidoutai_sac_tv_06_motoko_kick_police,151*time_ratio)
koukaku_kidoutai_sac_op_t07=TRIM_MIDDLE_CLIP(koukaku_kidoutai_sac_tv_11_togusa_walking_in_lab_01,172*time_ratio)+TRIM_LAST_CLIP(koukaku_kidoutai_sac_tv_01_motoko_fight_against_terrorist,194*time_ratio)+TRIM_LAST_CLIP(koukaku_kidoutai_sac_tv_03_batou_and_tokusa_dash_inside,151*time_ratio)
koukaku_kidoutai_sac_op_t08=TRIM_FIRST_CLIP(koukaku_kidoutai_sac_tv_18_assassin,173*time_ratio)+TRIM_MIDDLE_CLIP(koukaku_kidoutai_sac_tv_07_motoko_fight_against_girl,193*time_ratio)+TRIM_FIRST_CLIP(koukaku_kidoutai_sac_tv_19_cruzkowa_attack_motoko,143*time_ratio)
koukaku_kidoutai_sac_op_t09=koukaku_kidoutai_sac_op_temp_07+TRIM_MIDDLE_CLIP(koukaku_kidoutai_sac_tv_16_batou_punch+koukaku_kidoutai_sac_tv_16_batou_evade_punch,65*time_ratio)+TRIM_LAST_CLIP(koukaku_kidoutai_sac_tv_05_nasumi_make_drink_for_motoko,151*time_ratio)
koukaku_kidoutai_sac_op_t10=TRIM_MIDDLE_CLIP(koukaku_kidoutai_sac_tv_14_fem_reload_bullet,172*time_ratio)+Dissolve(TRIM_LAST_CLIP(koukaku_kidoutai_sac_tv_10_war_casualty,(129+fade_length)*time_ratio),koukaku_kidoutai_sac_op_temp_08,fade_length*time_ratio)+BlankClip(koukaku_kidoutai_sac_op_bs,length=30*4*time_ratio,color=color_black)



koukaku_kidoutai_sac_op_bs_mute=koukaku_kidoutai_sac_op_t01++koukaku_kidoutai_sac_op_t02++koukaku_kidoutai_sac_op_t03++koukaku_kidoutai_sac_op_t04 \
	++koukaku_kidoutai_sac_op_t05++koukaku_kidoutai_sac_op_t06++koukaku_kidoutai_sac_op_t07++koukaku_kidoutai_sac_op_t08++koukaku_kidoutai_sac_op_t09++koukaku_kidoutai_sac_op_t10

koukaku_kidoutai_sac_op_bs_mute

### export clip: koukaku_kidoutai_sac_op_bs_mute

### prefetch: 5,2

### ###

######## Subtitle ########

### inherit start ###

global subtitle_clip_halo_width=1
global subtitle_clip_width=1920
global subtitle_clip_height=1080

global subtitle_x=50*2.25
global subtitle_y=400*2.25
global subtitle_front_fade_count=20*time_ratio
global subtitle_rear_fade_count=20*time_ratio
global subtitle_font="MS Gothic"
global subtitle_effects="bi"
global subtitle_size=24*2.25
global subtitle_text_color=color_white
global subtitle_halo_color=OVERWRITE_COLOR_ALPHA(color_dodgerblue,$3F)
global subtitle_random_char_func="RANDOM_ASCII_CHAR"

function SUBTITLE_FX_1(clip clip,string text,float x,float y,int start_frame,int end_frame,bool "is_title"){
	is_title=Default(is_title,false)

	halo_color=is_title?OVERWRITE_COLOR_ALPHA(subtitle_halo_color,$0):subtitle_halo_color

	return SUBTITLE_FX_RANDOM_STRING(clip,text,Round(x),Round(y),start_frame,end_frame,subtitle_front_fade_count,subtitle_rear_fade_count,subtitle_font,subtitle_effects,Round(subtitle_size),subtitle_text_color,halo_color,random_char_func=subtitle_random_char_func)
}

function SUBTITLE_FX_2(clip clip,string text,float x,float y,int start_frame,int end_frame){
	return SUBTITLE_FX_FADE_IN_FADE_OUT(clip,text,Round(x),Round(y),start_frame,end_frame,subtitle_front_fade_count,subtitle_rear_fade_count,subtitle_font,subtitle_effects,Round(subtitle_size),subtitle_text_color,subtitle_halo_color)
}

### inherit end ###

SUBTITLE_FX_1("inner universe//origa|- by fielia@AVISynth",subtitle_x,subtitle_y-subtitle_size,184*time_ratio,531*time_ratio,true)

SUBTITLE_FX_1("Ñ@Ñ~ÑsÑuÑ|Ñç Ñy ÑtÑuÑ}ÑÄÑ~Ñç Ñ{ÑÇÑÖÑwÑyÑ|Ñy Ñ~ÑpÑtÑÄ Ñ}Ñ~ÑÄÑz",subtitle_x,subtitle_y,698*time_ratio,847*time_ratio)
SUBTITLE_FX_2("Angely i demony kruzhili nado mnoj",subtitle_x,subtitle_y-subtitle_size,698*time_ratio,847*time_ratio)
SUBTITLE_FX_1("ÑQÑpÑxÑqÑyÑrÑpÑ|Ñy ÑÑÑuÑÇÑ~ÑyÑy Ñy ÑxÑrÑvÑxÑtÑ~ÑçÑu ÑÅÑÖÑÑÑy",subtitle_x,subtitle_y,872*time_ratio,1019*time_ratio)
SUBTITLE_FX_2("Razbivali ternii i zvyozdnye puti",subtitle_x,subtitle_y-subtitle_size,872*time_ratio,1019*time_ratio)
SUBTITLE_FX_1("ÑNÑu ÑxÑ~ÑpÑuÑÑ ÑÉÑâÑpÑÉÑÑÑéÑë ÑÑÑÄÑ|ÑéÑ{ÑÄ ÑÑÑÄÑÑ,",subtitle_x,subtitle_y,1033*time_ratio,1177*time_ratio)
SUBTITLE_FX_2("Ne znaet schast'ya tol'ko tot,",subtitle_x,subtitle_y-subtitle_size,1033*time_ratio,1177*time_ratio)
SUBTITLE_FX_1("ÑKÑÑÑÄ ÑuÑsÑÄ ÑxÑÄÑrÑp ÑÅÑÄÑ~ÑëÑÑÑé Ñ~Ñu ÑÉÑ}ÑÄÑs...",subtitle_x,subtitle_y,1208*time_ratio,1389*time_ratio)
SUBTITLE_FX_2("Kto ego zova ponyat' ne smog...",subtitle_x,subtitle_y-subtitle_size,1208*time_ratio,1389*time_ratio)

SUBTITLE_FX_2("Mana du vortes, mana du vortes",subtitle_x,subtitle_x,1392*time_ratio,1560*time_ratio)
SUBTITLE_FX_2("Aeria gloris, aeria gloris",subtitle_x,subtitle_x,1565*time_ratio,1730*time_ratio)
SUBTITLE_FX_2("Mana du vortes, mana du vortes",subtitle_x,subtitle_x,1737*time_ratio,1905*time_ratio)
SUBTITLE_FX_2("Aeria gloris, aeria gloris",subtitle_x,subtitle_x,1909*time_ratio,2086*time_ratio)

SUBTITLE_FX_1("I am Calling Calling now, Spirits rise and falling",subtitle_x,subtitle_y,2049*time_ratio,2424*time_ratio)
SUBTITLE_FX_1("ÑRÑÄÑqÑÄÑz ÑÄÑÉÑÑÑpÑÑÑéÑÉÑë ÑtÑÄÑ|ÑéÑäÑu...",subtitle_x,subtitle_y,2446*time_ratio,2592*time_ratio)
SUBTITLE_FX_2("Soboj ostat'sya dol'she...",subtitle_x,subtitle_y-subtitle_size,2446*time_ratio,2592*time_ratio)
SUBTITLE_FX_1("Calling Calling, in the depth of longing",subtitle_x,subtitle_y,2598*time_ratio,2946*time_ratio)
SUBTITLE_FX_1("ÑRÑÄÑqÑÄÑz ÑÄÑÉÑÑÑpÑÑÑéÑÉÑë ÑtÑÄÑ|ÑéÑäÑu...",subtitle_x,subtitle_y,2962*time_ratio,3229*time_ratio)
SUBTITLE_FX_2("Soboj ostat'sya dol'she...",subtitle_x,subtitle_y-subtitle_size,2962*time_ratio,3229*time_ratio)

SUBTITLE_FX_2("Mana du vortes, mana du vortes",subtitle_x,subtitle_x,3115*time_ratio,3281*time_ratio)
SUBTITLE_FX_2("Aeria gloris, aeria gloris",subtitle_x,subtitle_x,3290*time_ratio,3468*time_ratio)

SUBTITLE_FX_1("Stand alone... Where was life when it had a meaning...",subtitle_x,subtitle_y,3799*time_ratio,4048*time_ratio)
SUBTITLE_FX_1("Stand alone... Nothing's real anymore and...",subtitle_x,subtitle_y-subtitle_size*2,4144*time_ratio,4327*time_ratio)

### pass clip: koukaku_kidoutai_sac_op_bs_mute

### prefetch: 5,2

### ###

SUBTITLE_FX_1("...ÑAÑuÑÉÑ{ÑÄÑ~ÑuÑâÑ~ÑçÑz ÑqÑuÑs...",subtitle_x,subtitle_y,4320*time_ratio,4519*time_ratio)
SUBTITLE_FX_2("...Beskonechnyj beg...",subtitle_x,subtitle_y-subtitle_size,4320*time_ratio,4519*time_ratio)
SUBTITLE_FX_1("ÑPÑÄÑ{Ñp ÑwÑyÑrÑp|Ñë Ñ}ÑÄÑsÑÖ ÑÉÑÑÑpÑÇÑpÑÑÑéÑÉÑë Ñ~Ñp Ñ|ÑuÑÑÑÖ Ñ~Ñu ÑÖÑÅÑpÑÉÑÑÑé,",subtitle_x,subtitle_y-subtitle_size,4526*time_ratio,4897*time_ratio)
SUBTITLE_FX_2("Poka zhiva|ya mogu starat'sya na letu ne upast',",subtitle_x,subtitle_y-subtitle_size*3,4526*time_ratio,4897*time_ratio)
SUBTITLE_FX_1("ÑNÑu ÑÇÑpÑxÑÖÑâÑyÑÑÑéÑÉÑë Ñ}ÑuÑâÑÑÑpÑÑÑé... Ñ|ÑêÑqÑyÑÑÑé...",subtitle_x,subtitle_y,4911*time_ratio,5264*time_ratio)
SUBTITLE_FX_2("Ne razuchit'sya mechtat'... lyubit'...",subtitle_x,subtitle_y-subtitle_size,4911*time_ratio,5264*time_ratio)
SUBTITLE_FX_1("...ÑAÑuÑÉÑ{ÑÄÑ~ÑuÑâÑ~ÑçÑz ÑqÑuÑs...",subtitle_x,subtitle_y,5268*time_ratio,5465*time_ratio)
SUBTITLE_FX_2("...Beskonechnyj beg...",subtitle_x,subtitle_y-subtitle_size,5268*time_ratio,5465*time_ratio)

SUBTITLE_FX_1("Calling Calling now, For the place of knowing",subtitle_x,subtitle_y-subtitle_size*2,5354*time_ratio,5704*time_ratio)
SUBTITLE_FX_1("There's more than what can be linked",subtitle_x,subtitle_y,5720*time_ratio,5863*time_ratio)
SUBTITLE_FX_1("Calling Calling now, Never will I look away",subtitle_x,subtitle_y,5872*time_ratio,6222*time_ratio)
SUBTITLE_FX_1("For what life has left for me",subtitle_x,subtitle_y,6236*time_ratio,6385*time_ratio)
SUBTITLE_FX_1("Yearning Yearning, for what's left of loving",subtitle_x,subtitle_y,6388*time_ratio,6737*time_ratio)

SUBTITLE_FX_1("ÑRÑÄÑqÑÄÑz ÑÄÑÉÑÑÑpÑÑÑéÑÉÑë ÑtÑÄÑ|ÑéÑäÑu...",subtitle_x,subtitle_y,6752*time_ratio,6895*time_ratio)
SUBTITLE_FX_2("Soboj ostat'sya dol'she...",subtitle_x,subtitle_y-subtitle_size,6752*time_ratio,6895*time_ratio)
SUBTITLE_FX_1("Calling Calling now, Spirits rise and falling",subtitle_x,subtitle_y,6905*time_ratio,7254*time_ratio)
SUBTITLE_FX_1("ÑRÑÄÑqÑÄÑz ÑÄÑÉÑÑÑpÑÑÑéÑÉÑë ÑtÑÄÑ|ÑéÑäÑu...",subtitle_x,subtitle_y,7270*time_ratio,7413*time_ratio)
SUBTITLE_FX_2("Soboj ostat'sya dol'she...",subtitle_x,subtitle_y-subtitle_size,7270*time_ratio,7413*time_ratio)
SUBTITLE_FX_1("Calling Calling, in the depth of longing",subtitle_x,subtitle_y,7421*time_ratio,7778*time_ratio)
SUBTITLE_FX_1("ÑRÑÄÑqÑÄÑz ÑÄÑÉÑÑÑpÑÑÑéÑÉÑë ÑtÑÄÑ|ÑéÑäÑu...",subtitle_x,subtitle_y,7786*time_ratio,8063*time_ratio)
SUBTITLE_FX_2("Soboj ostat'sya dol'she...",subtitle_x,subtitle_y-subtitle_size,7786*time_ratio,8063*time_ratio)

SUBTITLE_FX_2("Mana du vortes, mana du vortes",subtitle_x,subtitle_x,7942*time_ratio,8105*time_ratio)
SUBTITLE_FX_2("Aeria gloris, aeria gloris",subtitle_x,subtitle_x,8111*time_ratio,8277*time_ratio)
SUBTITLE_FX_2("Mana du vortes, mana du vortes",subtitle_x,subtitle_x,8283*time_ratio,8449*time_ratio)
SUBTITLE_FX_2("Aeria gloris, aeria gloris",subtitle_x,subtitle_x,8458*time_ratio,8637*time_ratio)

######## Thumbnail ########

is_thumbnail=false

is_thumbnail?koukaku_kidoutai_sac_op_bs_mute:last

######## Music ########

bgm_48khz=SSRC(WAVSource("src\koukaku_kidoutai_sac-ost1-11.wav"),48000)
AudioDub(bgm_48khz)



thumbnail=Trim(8967,-30*5*time_ratio)
is_thumbnail?thumbnail:last

""")

######## Post Processing ########

ConvertToYV12()
#ConvertToYUY2()
#ConvertToRGB24()

TCPServer()
