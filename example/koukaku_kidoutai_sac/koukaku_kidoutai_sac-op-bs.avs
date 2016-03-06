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

Import("..\..\avsi4comp\avsi4comp.avsi")

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

function CHANGE_120P_TO_30P(clip clip){
	return SelectEvery(clip,4,1)
}

function CHANGE_120P_TO_24P(clip clip){
	return SelectEvery(clip,5,2)
}

function CHANGE_24P_TO_30P(clip clip){
	return SelectEvery(clip,4,0,1,2,3,3)
}

### inherit start ###

function CHANGE_30P_TO_120P(clip clip){
	return SelectEvery(clip,1,0,0,0,0)
}

function CHANGE_24P_TO_120P(clip clip){
	return SelectEvery(clip,1,0,0,0,0,0)
}

### inherit end ###

######## BD (1080P) ########

fpsnum=120000
fpsden=1001

enable_multi_thread=false

koukaku_kidoutai_sac_op_bs=FFMS2_VIDEO_SOURCE("src\koukaku_kidoutai\koukaku_kidoutai_sac\special\koukaku_kidoutai_sac-tv-sp-op.mp4",fpsnum=fpsnum,fpsden=fpsden,enable_multi_thread=enable_multi_thread)

koukaku_kidoutai_sac_op_bs_01_29p=CHANGE_120P_TO_30P(Trim(koukaku_kidoutai_sac_op_bs,2,10758)) #10757
koukaku_kidoutai_sac_op_bs_02_29p=CHANGE_120P_TO_30P(Trim(koukaku_kidoutai_sac_op_bs,10759,11038)) #280



koukaku_kidoutai_sac_op_temp=FFMS2_VIDEO_SOURCE("src\koukaku_kidoutai\koukaku_kidoutai_sac\special\koukaku_kidoutai_sac-tv-sp-op-temporary.mp4",fpsnum=fpsnum,fpsden=fpsden,enable_multi_thread=enable_multi_thread)

koukaku_kidoutai_sac_op_temp_01_29p=CHANGE_120P_TO_30P(Trim(koukaku_kidoutai_sac_op_temp,3,358)) #356
koukaku_kidoutai_sac_op_temp_02_29p=CHANGE_120P_TO_30P(Trim(koukaku_kidoutai_sac_op_temp,359,1038)) #680
koukaku_kidoutai_sac_op_temp_02_23p=CHANGE_120P_TO_24P(Trim(koukaku_kidoutai_sac_op_temp,1039,3168)) #2130
koukaku_kidoutai_sac_op_temp_03_23p=CHANGE_120P_TO_24P(Trim(koukaku_kidoutai_sac_op_temp,3169,4528)) #1360
koukaku_kidoutai_sac_op_temp_04_23p=CHANGE_120P_TO_24P(Trim(koukaku_kidoutai_sac_op_temp,4529,5858)) #1330
koukaku_kidoutai_sac_op_temp_05_title_29p=CHANGE_120P_TO_30P(Trim(koukaku_kidoutai_sac_op_temp,5859,7358)) #1492
koukaku_kidoutai_sac_op_temp_06_23p=CHANGE_120P_TO_24P(Trim(koukaku_kidoutai_sac_op_temp,7359,7912)) #554
koukaku_kidoutai_sac_op_temp_07_23p=CHANGE_120P_TO_24P(Trim(koukaku_kidoutai_sac_op_temp,7913,9147)) #1235
koukaku_kidoutai_sac_op_temp_08_23p=CHANGE_120P_TO_24P(Trim(koukaku_kidoutai_sac_op_temp,9148,11037)) #1890



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

koukaku_kidoutai_sac_tv_01_op=Trim(koukaku_kidoutai_sac_tv_01,2,10766) #10765 (too more duplicate frames at 4498~4502)

koukaku_kidoutai_sac_tv_01_motoko_fight_against_terrorist_01=CHANGE_120P_TO_24P(Trim(koukaku_kidoutai_sac_tv_01,16143,16377)) #235 op
koukaku_kidoutai_sac_tv_01_motoko_fight_against_terrorist_02=CHANGE_120P_TO_24P(Trim(koukaku_kidoutai_sac_tv_01,16378,16472)) #95 op
koukaku_kidoutai_sac_tv_01_motoko_fight_against_terrorist_03=CHANGE_120P_TO_24P(Trim(koukaku_kidoutai_sac_tv_01,16473,16588)) #116 op
koukaku_kidoutai_sac_tv_01_motoko_fight_against_terrorist_04=CHANGE_120P_TO_24P(Trim(koukaku_kidoutai_sac_tv_01,16589,16638)) #50 op
koukaku_kidoutai_sac_tv_01_motoko_fight_against_terrorist_05=CHANGE_120P_TO_24P(Trim(koukaku_kidoutai_sac_tv_01,16639,16938)) #300 op
koukaku_kidoutai_sac_tv_01_togusa_dash_and_hide=CHANGE_120P_TO_24P(Trim(koukaku_kidoutai_sac_tv_01,48413,48708)) #296
koukaku_kidoutai_sac_tv_01_batou_land_and_hide=CHANGE_120P_TO_24P(Trim(koukaku_kidoutai_sac_tv_01,49038,49603)) #566
koukaku_kidoutai_sac_tv_01_geisha_hostage_people=CHANGE_120P_TO_24P(Trim(koukaku_kidoutai_sac_tv_01,51428,51938)) #511

koukaku_kidoutai_sac_tv_02_haw206_turn_back=CHANGE_120P_TO_24P(Trim(koukaku_kidoutai_sac_tv_02,14819,16422)) #1604
koukaku_kidoutai_sac_tv_02_haw206_fire_01=CHANGE_120P_TO_24P(Trim(koukaku_kidoutai_sac_tv_02,17163,17272)) #110
koukaku_kidoutai_sac_tv_02_haw206_fire_02=CHANGE_120P_TO_24P(Trim(koukaku_kidoutai_sac_tv_02,17273,17657)) #385
koukaku_kidoutai_sac_tv_02_haw206_break_gate=CHANGE_120P_TO_24P(Trim(koukaku_kidoutai_sac_tv_02,22959,23727)) #769
koukaku_kidoutai_sac_tv_02_all_tachikoma_follow_haw206=CHANGE_120P_TO_24P(Trim(koukaku_kidoutai_sac_tv_02,53799,54968)) #1170 op
koukaku_kidoutai_sac_tv_02_haw206_is_under_attack=CHANGE_120P_TO_24P(Trim(koukaku_kidoutai_sac_tv_02,79438,79833)) #396
koukaku_kidoutai_sac_tv_02_helicopter_turn_back=CHANGE_120P_TO_24P(Trim(koukaku_kidoutai_sac_tv_02,83688,83973)) #286

koukaku_kidoutai_sac_tv_03_batou_and_tokusa_dash_inside_01=CHANGE_120P_TO_24P(Trim(koukaku_kidoutai_sac_tv_03,88616,88966)) #351 op
koukaku_kidoutai_sac_tv_03_batou_and_tokusa_dash_inside_02=CHANGE_120P_TO_24P(Trim(koukaku_kidoutai_sac_tv_03,88967,89275)) #309 op

koukaku_kidoutai_sac_tv_04_laughing_man_broadcast=CHANGE_120P_TO_24P(Trim(koukaku_kidoutai_sac_tv_04,160362,162481)) #2480
koukaku_kidoutai_sac_tv_04_laughing_man_icon=CHANGE_120P_TO_24P(Trim(koukaku_kidoutai_sac_tv_04,164602,165216)) #615 op
koukaku_kidoutai_sac_tv_04_laughing_man_icon_shutdown=CHANGE_120P_TO_24P(Trim(koukaku_kidoutai_sac_tv_04,165217,165321)) #105 op
#koukaku_kidoutai_sac_tv_04_laughing_man_icon_after_shutdown=CHANGE_120P_TO_24P(Trim(koukaku_kidoutai_sac_tv_04,165322,165451)) #130

koukaku_kidoutai_sac_tv_05_nasumi_make_drink_for_motoko=CHANGE_120P_TO_24P(Trim(koukaku_kidoutai_sac_tv_05,76503,77142)) #640 op
koukaku_kidoutai_sac_tv_05_nasumi_and_ran_sleeping=CHANGE_120P_TO_24P(Trim(koukaku_kidoutai_sac_tv_05,106042,106387)) #346
koukaku_kidoutai_sac_tv_05_send_via_computer=CHANGE_120P_TO_24P(Trim(koukaku_kidoutai_sac_tv_05,163938,164342)) #405

koukaku_kidoutai_sac_tv_06_motoko_kick_police_01=CHANGE_120P_TO_24P(Trim(koukaku_kidoutai_sac_tv_06,42485,42720)) #236 op
koukaku_kidoutai_sac_tv_06_motoko_kick_police_02=CHANGE_120P_TO_24P(Trim(koukaku_kidoutai_sac_tv_06,45145,45520)) #376 op
koukaku_kidoutai_sac_tv_06_bigger_terrorist_attack_motoko=CHANGE_120P_TO_24P(Trim(koukaku_kidoutai_sac_tv_06,86125,86494)) #370

koukaku_kidoutai_sac_tv_07_tachikoma_shoot_silk_01=CHANGE_120P_TO_24P(Trim(koukaku_kidoutai_sac_tv_07,52218,52457)) #240
koukaku_kidoutai_sac_tv_07_tachikoma_shoot_silk_02=CHANGE_120P_TO_24P(Trim(koukaku_kidoutai_sac_tv_07,52458,52537)) #80
koukaku_kidoutai_sac_tv_07_tachikoma_shoot_silk_03=CHANGE_120P_TO_24P(Trim(koukaku_kidoutai_sac_tv_07,52538,52742)) #205
koukaku_kidoutai_sac_tv_07_motoko_fight_against_girl_01=CHANGE_120P_TO_24P(Trim(koukaku_kidoutai_sac_tv_07,81047,81417)) #371 op
koukaku_kidoutai_sac_tv_07_motoko_fight_against_girl_02=CHANGE_120P_TO_24P(Trim(koukaku_kidoutai_sac_tv_07,81963,82457)) #495 op

koukaku_kidoutai_sac_tv_08_nasumi_see_girl_inside_01=CHANGE_120P_TO_24P(Trim(koukaku_kidoutai_sac_tv_08,25618,26592)) #975
koukaku_kidoutai_sac_tv_08_nasumi_see_girl_inside_02=CHANGE_120P_TO_24P(Trim(koukaku_kidoutai_sac_tv_08,27498,29828)) #2331 op
koukaku_kidoutai_sac_tv_08_jameson=CHANGE_120P_TO_24P(Trim(koukaku_kidoutai_sac_tv_08,43333,46587)) #3256
koukaku_kidoutai_sac_tv_08_tachikoma_and_batou_land=CHANGE_120P_TO_24P(Trim(koukaku_kidoutai_sac_tv_08,101794,102107)) #314
koukaku_kidoutai_sac_tv_08_tachikoma_shoot_missile=CHANGE_120P_TO_24P(Trim(koukaku_kidoutai_sac_tv_08,107208,107813)) #606
koukaku_kidoutai_sac_tv_08_motoko_smile=CHANGE_120P_TO_24P(Trim(koukaku_kidoutai_sac_tv_08,158248,158552)) #305

koukaku_kidoutai_sac_tv_09_laughing_man_mark_built_with_table=CHANGE_120P_TO_24P(Trim(koukaku_kidoutai_sac_tv_09,71578,73492)) #1915 op
koukaku_kidoutai_sac_tv_09_motoko_interrupted_01=CHANGE_120P_TO_24P(Trim(koukaku_kidoutai_sac_tv_09,154158,154482)) #325
koukaku_kidoutai_sac_tv_09_motoko_interrupted_02=CHANGE_120P_TO_24P(Trim(koukaku_kidoutai_sac_tv_09,154483,154717)) #235

koukaku_kidoutai_sac_tv_10_tachikoma_found_electronic_component_01=CHANGE_120P_TO_24P(Trim(koukaku_kidoutai_sac_tv_10,69826,70419)) #594
koukaku_kidoutai_sac_tv_10_tachikoma_found_electronic_component_02=CHANGE_120P_TO_24P(Trim(koukaku_kidoutai_sac_tv_10,70420,70845)) #426
koukaku_kidoutai_sac_tv_10_war_casualty_01=CHANGE_120P_TO_24P(Trim(koukaku_kidoutai_sac_tv_10,93315,93645)) #331 op
koukaku_kidoutai_sac_tv_10_war_casualty_02=CHANGE_120P_TO_24P(Trim(koukaku_kidoutai_sac_tv_10,93646,93940)) #295 op

koukaku_kidoutai_sac_tv_11_togusa_walking_in_lab_01=CHANGE_120P_TO_24P(Trim(koukaku_kidoutai_sac_tv_11,64956,66214)) #1259 op
koukaku_kidoutai_sac_tv_11_togusa_walking_in_lab_02=CHANGE_120P_TO_24P(Trim(koukaku_kidoutai_sac_tv_11,66215,67290)) #1076
koukaku_kidoutai_sac_tv_11_guard_throw_togusa_01=CHANGE_120P_TO_24P(Trim(koukaku_kidoutai_sac_tv_11,129921,130199)) #279
koukaku_kidoutai_sac_tv_11_guard_throw_togusa_02=CHANGE_120P_TO_24P(Trim(koukaku_kidoutai_sac_tv_11,130200,130605)) #406

koukaku_kidoutai_sac_tv_12_miki_take_tachikoma_01=CHANGE_120P_TO_24P(Trim(koukaku_kidoutai_sac_tv_12,61001,61895)) #895
koukaku_kidoutai_sac_tv_12_miki_take_tachikoma_02=CHANGE_120P_TO_24P(Trim(koukaku_kidoutai_sac_tv_12,64941,66554)) #1614 op
koukaku_kidoutai_sac_tv_12_tachikoma_walk_around_garden=CHANGE_120P_TO_24P(Trim(koukaku_kidoutai_sac_tv_12,74155,74755)) #601
koukaku_kidoutai_sac_tv_12_tachikoma_cry=CHANGE_120P_TO_24P(Trim(koukaku_kidoutai_sac_tv_12,81866,84114)) #2249
koukaku_kidoutai_sac_tv_12_motoko_take_tear=CHANGE_120P_TO_24P(Trim(koukaku_kidoutai_sac_tv_12,133731,134104)) #374

koukaku_kidoutai_sac_tv_13_submaring_float=CHANGE_120P_TO_24P(Trim(koukaku_kidoutai_sac_tv_13,38992,40065)) #1074
koukaku_kidoutai_sac_tv_13_tachikoma_under_attack=CHANGE_120P_TO_24P(Trim(koukaku_kidoutai_sac_tv_13,121651,121906)) #256
koukaku_kidoutai_sac_tv_13_soldier_attack_in_back_of_body=CHANGE_120P_TO_24P(Trim(koukaku_kidoutai_sac_tv_13,127411,127705)) #295
koukaku_kidoutai_sac_tv_13_all_soldier_fall_down=CHANGE_120P_TO_24P(Trim(koukaku_kidoutai_sac_tv_13,140546,140751)) #206
koukaku_kidoutai_sac_tv_13_eka_s_daughter_kick_togusa_and_saitou=CHANGE_120P_TO_24P(Trim(koukaku_kidoutai_sac_tv_13,150691,151225)) #535 op
koukaku_kidoutai_sac_tv_13_eka_s_daughter_kick_batou=CHANGE_120P_TO_24P(Trim(koukaku_kidoutai_sac_tv_13,151226,151450)) #225 op

koukaku_kidoutai_sac_tv_14_porn=CHANGE_120P_TO_24P(Trim(koukaku_kidoutai_sac_tv_14,27380,28034)) #655
koukaku_kidoutai_sac_tv_14_fem_show_shotgun=CHANGE_120P_TO_24P(Trim(koukaku_kidoutai_sac_tv_14,71856,72149)) #294
koukaku_kidoutai_sac_tv_14_fem_reload_bullet=CHANGE_120P_TO_24P(Trim(koukaku_kidoutai_sac_tv_14,72926,73635)) #710 op
koukaku_kidoutai_sac_tv_14_togusa_turn_helicopter_back=CHANGE_120P_TO_24P(Trim(koukaku_kidoutai_sac_tv_14,94120,95074)) #955
koukaku_kidoutai_sac_tv_14_maid_attack_fem=CHANGE_120P_TO_24P(Trim(koukaku_kidoutai_sac_tv_14,125861,125999)) #139
koukaku_kidoutai_sac_tv_14_fem_kick_maid_01=CHANGE_120P_TO_24P(Trim(koukaku_kidoutai_sac_tv_14,126000,126104)) #105 op
koukaku_kidoutai_sac_tv_14_fem_kick_maid_02=CHANGE_120P_TO_24P(Trim(koukaku_kidoutai_sac_tv_14,126105,126334)) #230 op
koukaku_kidoutai_sac_tv_14_motoko_catch_fem=CHANGE_120P_TO_24P(Trim(koukaku_kidoutai_sac_tv_14,135776,136044)) #269

koukaku_kidoutai_sac_tv_15_tachikoma_read_book=CHANGE_120P_TO_24P(Trim(koukaku_kidoutai_sac_tv_15,64836,66694)) #1859 op
koukaku_kidoutai_sac_tv_15_tachikoma_discuss=CHANGE_120P_TO_24P(Trim(koukaku_kidoutai_sac_tv_15,82976,83554)) #579

koukaku_kidoutai_sac_tv_16_batou_punch=CHANGE_120P_TO_24P(Trim(koukaku_kidoutai_sac_tv_16,45668,45817)) #150 op
koukaku_kidoutai_sac_tv_16_batou_evade_punch=CHANGE_120P_TO_24P(Trim(koukaku_kidoutai_sac_tv_16,47423,47602)) #180 op

koukaku_kidoutai_sac_tv_17_seymour_and_daisuke=CHANGE_120P_TO_24P(Trim(koukaku_kidoutai_sac_tv_17,28955,30178)) #1224 op
koukaku_kidoutai_sac_tv_17_swat_coming=CHANGE_120P_TO_24P(Trim(koukaku_kidoutai_sac_tv_17,70895,71329)) #435

koukaku_kidoutai_sac_tv_18_yuu_take_truck=CHANGE_120P_TO_24P(Trim(koukaku_kidoutai_sac_tv_18,95534,96242)) #709
koukaku_kidoutai_sac_tv_18_helicopter_s_wind_push_fisher=CHANGE_120P_TO_24P(Trim(koukaku_kidoutai_sac_tv_18,133018,133242)) #225
koukaku_kidoutai_sac_tv_18_assassin=CHANGE_120P_TO_24P(Trim(koukaku_kidoutai_sac_tv_18,140924,141703)) #780 op

koukaku_kidoutai_sac_tv_19_cruzkowa_evade_bullet=CHANGE_120P_TO_24P(Trim(koukaku_kidoutai_sac_tv_19,91561,91710)) #150
koukaku_kidoutai_sac_tv_19_cruzkowa_attack_tugusa=CHANGE_120P_TO_24P(Trim(koukaku_kidoutai_sac_tv_19,91711,91905)) #195
koukaku_kidoutai_sac_tv_19_togusa_vs_cruzkkowa=CHANGE_120P_TO_24P(Trim(koukaku_kidoutai_sac_tv_19,92230,92620)) #391
koukaku_kidoutai_sac_tv_19_explode_in_back_of_truck_01=CHANGE_120P_TO_24P(Trim(koukaku_kidoutai_sac_tv_19,94380,94550)) #171
koukaku_kidoutai_sac_tv_19_explode_in_back_of_truck_02=CHANGE_120P_TO_24P(Trim(koukaku_kidoutai_sac_tv_19,94551,94605)) #55
koukaku_kidoutai_sac_tv_19_explode_in_back_of_truck_03=CHANGE_120P_TO_24P(Trim(koukaku_kidoutai_sac_tv_19,94606,94845)) #240
koukaku_kidoutai_sac_tv_19_cruzkowa_attack_motoko=CHANGE_120P_TO_24P(Trim(koukaku_kidoutai_sac_tv_19,149445,150114)) #670 op

koukaku_kidoutai_sac_tv_26_cyber_world_01=CHANGE_120P_TO_24P(Trim(koukaku_kidoutai_sac_tv_26,3,572)) #570 op
koukaku_kidoutai_sac_tv_26_cyber_world_02=CHANGE_120P_TO_24P(Trim(koukaku_kidoutai_sac_tv_26,573,1047)) #475 op
koukaku_kidoutai_sac_tv_26_cyber_world_03=CHANGE_120P_TO_24P(Trim(koukaku_kidoutai_sac_tv_26,1048,2417)) #1370 op
koukaku_kidoutai_sac_tv_26_motoko_talk_with_aoi_aka_laughing_man=CHANGE_120P_TO_24P(Trim(koukaku_kidoutai_sac_tv_26,113148,114157)) #1010
koukaku_kidoutai_sac_tv_26_aoi_explain_stand_alone_complex=CHANGE_120P_TO_24P(Trim(koukaku_kidoutai_sac_tv_26,133228,134032)) #805 op
koukaku_kidoutai_sac_tv_26_motoko_see_helicopter_get_close=CHANGE_120P_TO_24P(Trim(koukaku_kidoutai_sac_tv_26,158888,159232)) #345

######## Pre Combine ########

### inherit start ###

fade_length_24p=12

### inherit end ###

koukaku_kidoutai_sac_op_temp_05_title_rgb32_29p=ConvertToRGB32(koukaku_kidoutai_sac_op_temp_05_title_29p)
#title_with_reset_alpha_29p=ResetMask(koukaku_kidoutai_sac_op_temp_05_title_rgb32_29p)
#title_with_mask_29p=ColorKeyMask(title_with_reset_alpha_29p,color_black,$F)
adjust_scale=3.0
title_mask_29p=RGBAdjust(Greyscale(koukaku_kidoutai_sac_op_temp_05_title_rgb32_29p),adjust_scale,adjust_scale,adjust_scale)
title_with_mask_29p=Mask(koukaku_kidoutai_sac_op_temp_05_title_rgb32_29p,title_mask_29p)

koukaku_kidoutai_sac_tv_26_cyber_world=koukaku_kidoutai_sac_tv_26_cyber_world_01+koukaku_kidoutai_sac_tv_26_cyber_world_02+koukaku_kidoutai_sac_tv_26_cyber_world_03
koukaku_kidoutai_sac_tv_26_cyber_world_29p=CHANGE_24P_TO_30P(koukaku_kidoutai_sac_tv_26_cyber_world)
koukaku_kidoutai_sac_tv_26_cyber_world_trimmed_29p=ConvertToRGB32(TRIM_FIRST_CLIP(koukaku_kidoutai_sac_tv_26_cyber_world_29p,Framecount(koukaku_kidoutai_sac_op_temp_05_title_29p)))

title_29p=ConvertToYV12(Layer(koukaku_kidoutai_sac_tv_26_cyber_world_trimmed_29p,title_with_mask_29p,"Add"))



koukaku_kidoutai_sac_tv_14_fem_kick_maid=koukaku_kidoutai_sac_tv_14_fem_kick_maid_01+koukaku_kidoutai_sac_tv_14_fem_kick_maid_02
koukaku_kidoutai_sac_tv_14_fem_kick_maid_fade_out=FadeOut(koukaku_kidoutai_sac_tv_14_fem_kick_maid,fade_length_24p*2)
koukaku_kidoutai_sac_tv_14_fem_kick_maid_fade_out_29p=CHANGE_24P_TO_30P(koukaku_kidoutai_sac_tv_14_fem_kick_maid_fade_out)
koukaku_kidoutai_sac_op_temp_02_overlay_29p=Overlay(koukaku_kidoutai_sac_op_temp_02_29p,koukaku_kidoutai_sac_tv_14_fem_kick_maid_fade_out_29p,mode="Add")
koukaku_kidoutai_sac_op_temp_02_overlay_29p=OVERWRITE_RANGE(koukaku_kidoutai_sac_op_temp_02_29p,koukaku_kidoutai_sac_op_temp_02_overlay_29p,0,Framecount(koukaku_kidoutai_sac_tv_14_fem_kick_maid_fade_out_29p)-1)



koukaku_kidoutai_sac_tv_15_tachikoma_read_book_moving=MOVE_CG(koukaku_kidoutai_sac_tv_15_tachikoma_read_book,1,0,192.0,1.1)
koukaku_kidoutai_sac_tv_10_war_casualty_01_moving=MOVE_CG(koukaku_kidoutai_sac_tv_10_war_casualty_01,0,1,108.0,1.1)
koukaku_kidoutai_sac_tv_10_war_casualty=koukaku_kidoutai_sac_tv_10_war_casualty_01_moving+koukaku_kidoutai_sac_tv_10_war_casualty_02



koukaku_kidoutai_sac_tv_01_motoko_fight_against_terrorist=koukaku_kidoutai_sac_tv_01_motoko_fight_against_terrorist_01+koukaku_kidoutai_sac_tv_01_motoko_fight_against_terrorist_02+koukaku_kidoutai_sac_tv_01_motoko_fight_against_terrorist_03+koukaku_kidoutai_sac_tv_01_motoko_fight_against_terrorist_04+koukaku_kidoutai_sac_tv_01_motoko_fight_against_terrorist_05
koukaku_kidoutai_sac_tv_03_batou_and_tokusa_dash_inside=koukaku_kidoutai_sac_tv_03_batou_and_tokusa_dash_inside_01+koukaku_kidoutai_sac_tv_03_batou_and_tokusa_dash_inside_02
laughing_man_icon=koukaku_kidoutai_sac_tv_04_laughing_man_icon+koukaku_kidoutai_sac_tv_04_laughing_man_icon_shutdown
laughing_man_icon_29p=CHANGE_24P_TO_30P(laughing_man_icon)
koukaku_kidoutai_sac_tv_06_motoko_kick_police=koukaku_kidoutai_sac_tv_06_motoko_kick_police_01+koukaku_kidoutai_sac_tv_06_motoko_kick_police_02
koukaku_kidoutai_sac_tv_07_motoko_fight_against_girl=koukaku_kidoutai_sac_tv_07_motoko_fight_against_girl_01+koukaku_kidoutai_sac_tv_07_motoko_fight_against_girl_02
koukaku_kidoutai_sac_tv_13_eka_s_daughter_kick=koukaku_kidoutai_sac_tv_13_eka_s_daughter_kick_togusa_and_saitou+koukaku_kidoutai_sac_tv_13_eka_s_daughter_kick_batou

######## Combine ########

#                                 (119.88fps)
# koukaku_kidoutai_sac_op_bs_01	2469
# koukaku_kidoutai_sac_op_temp_01 2125
# koukaku_kidoutai_sac_op_temp_02 *
# koukaku_kidoutai_sac_op_temp_03 15286
# koukaku_kidoutai_sac_op_temp_04 *
# koukaku_kidoutai_sac_op_temp_05_title 21421
# koukaku_kidoutai_sac_op_temp_06 *
# koukaku_kidoutai_sac_op_temp_07 29676
# koukaku_kidoutai_sac_op_temp_08 32981



koukaku_kidoutai_sac_op_bs_t01_23p=BlankClip(koukaku_kidoutai_sac_tv_26_aoi_explain_stand_alone_complex,length=9,color=color_black)+TRIM_FIRST_CLIP(koukaku_kidoutai_sac_tv_26_aoi_explain_stand_alone_complex,138)+TRIM_MIDDLE_CLIP(koukaku_kidoutai_sac_tv_09_laughing_man_mark_built_with_table,139)+TRIM_LAST_CLIP(koukaku_kidoutai_sac_tv_15_tachikoma_read_book_moving,139)
koukaku_kidoutai_sac_op_bs_t02_29p=Dissolve(Dissolve(koukaku_kidoutai_sac_op_temp_01_29p,koukaku_kidoutai_sac_op_bs_01_29p,Framecount(koukaku_kidoutai_sac_op_temp_01_29p)-86),laughing_man_icon_29p,Framecount(laughing_man_icon_29p)-159)
koukaku_kidoutai_sac_op_bs_t03_23p=FADE_IN_WITH_BRIGHTNESS_OFFSET_RGB24(TRIM_MIDDLE_CLIP(koukaku_kidoutai_sac_tv_12_miki_take_tachikoma_02,138),fade_length_24p*2)+TRIM_LAST_CLIP(koukaku_kidoutai_sac_tv_08_nasumi_see_girl_inside_02,147)+koukaku_kidoutai_sac_op_temp_03_23p+koukaku_kidoutai_sac_op_temp_04_23p
koukaku_kidoutai_sac_op_bs_t04_29p=koukaku_kidoutai_sac_op_temp_02_overlay_29p
koukaku_kidoutai_sac_op_bs_t04_23p=koukaku_kidoutai_sac_op_temp_02_23p+FADE_OUT_WITH_BRIGHTNESS_OFFSET_RGB24(TRIM_MIDDLE_CLIP(koukaku_kidoutai_sac_tv_17_seymour_and_daisuke,127),fade_length_24p*2)
koukaku_kidoutai_sac_op_bs_t05_29p=title_29p
koukaku_kidoutai_sac_op_bs_t05_23p=koukaku_kidoutai_sac_op_temp_06_23p
koukaku_kidoutai_sac_op_bs_t06_23p=TRIM_LAST_CLIP(koukaku_kidoutai_sac_tv_13_eka_s_daughter_kick,143)+TRIM_MIDDLE_CLIP(koukaku_kidoutai_sac_tv_02_all_tachikoma_follow_haw206,155)+TRIM_LAST_CLIP(koukaku_kidoutai_sac_tv_06_motoko_kick_police,121)
koukaku_kidoutai_sac_op_bs_t07_23p=TRIM_MIDDLE_CLIP(koukaku_kidoutai_sac_tv_11_togusa_walking_in_lab_01,138)+TRIM_LAST_CLIP(koukaku_kidoutai_sac_tv_01_motoko_fight_against_terrorist,155)+TRIM_LAST_CLIP(koukaku_kidoutai_sac_tv_03_batou_and_tokusa_dash_inside,121)
koukaku_kidoutai_sac_op_bs_t08_23p=TRIM_FIRST_CLIP(koukaku_kidoutai_sac_tv_18_assassin,138)+TRIM_MIDDLE_CLIP(koukaku_kidoutai_sac_tv_07_motoko_fight_against_girl,155)+TRIM_FIRST_CLIP(koukaku_kidoutai_sac_tv_19_cruzkowa_attack_motoko,114)
koukaku_kidoutai_sac_op_bs_t09_23p=koukaku_kidoutai_sac_op_temp_07_23p+TRIM_MIDDLE_CLIP(koukaku_kidoutai_sac_tv_16_batou_punch+koukaku_kidoutai_sac_tv_16_batou_evade_punch,52)+TRIM_LAST_CLIP(koukaku_kidoutai_sac_tv_05_nasumi_make_drink_for_motoko,121)
koukaku_kidoutai_sac_op_bs_t10_23p=TRIM_MIDDLE_CLIP(koukaku_kidoutai_sac_tv_14_fem_reload_bullet,138)+Dissolve(TRIM_LAST_CLIP(koukaku_kidoutai_sac_tv_10_war_casualty,103+fade_length_24p),koukaku_kidoutai_sac_op_temp_08_23p,fade_length_24p)+BlankClip(koukaku_kidoutai_sac_op_temp_08_23p,length=24*5,color=color_black)



koukaku_kidoutai_sac_op_bs_part01_23p=koukaku_kidoutai_sac_op_bs_t01_23p
koukaku_kidoutai_sac_op_bs_part02_29p=koukaku_kidoutai_sac_op_bs_t02_29p
koukaku_kidoutai_sac_op_bs_part03_23p=koukaku_kidoutai_sac_op_bs_t03_23p
koukaku_kidoutai_sac_op_bs_part04_29p=koukaku_kidoutai_sac_op_bs_t04_29p
koukaku_kidoutai_sac_op_bs_part05_23p=koukaku_kidoutai_sac_op_bs_t04_23p
koukaku_kidoutai_sac_op_bs_part06_29p=koukaku_kidoutai_sac_op_bs_t05_29p
koukaku_kidoutai_sac_op_bs_part07_23p=koukaku_kidoutai_sac_op_bs_t05_23p+koukaku_kidoutai_sac_op_bs_t06_23p \
	+koukaku_kidoutai_sac_op_bs_t07_23p+koukaku_kidoutai_sac_op_bs_t08_23p+koukaku_kidoutai_sac_op_bs_t09_23p+koukaku_kidoutai_sac_op_bs_t10_23p

koukaku_kidoutai_sac_op_bs_part02_29p

### export clip: koukaku_kidoutai_sac_op_bs_part01_23p,koukaku_kidoutai_sac_op_bs_part02_29p,koukaku_kidoutai_sac_op_bs_part03_23p,koukaku_kidoutai_sac_op_bs_part04_29p,koukaku_kidoutai_sac_op_bs_part05_23p,koukaku_kidoutai_sac_op_bs_part06_29p,koukaku_kidoutai_sac_op_bs_part07_23p

### prefetch: 5,2

### ###

######## Subtitle ########

### inherit start ###

global time_ratio_30p=4

global subtitle_clip_halo_width=1
global subtitle_clip_width=1920
global subtitle_clip_height=1080

global subtitle_x=50*2.25
global subtitle_y=400*2.25
global subtitle_front_fade_count=20
global subtitle_rear_fade_count=20
global subtitle_font="MS Gothic"
global subtitle_effects="bi"
global subtitle_size=24*2.25
global subtitle_text_color=color_white
global subtitle_halo_color=OVERWRITE_COLOR_ALPHA(color_dodgerblue,$3F)
global subtitle_random_char_func="RANDOM_ASCII_CHAR"

function EXTEND_ONE_FRAME(clip clip){
	return clip+BlankClip(clip,length=1,color=color_black)
}

function UNDO_EXTEND_ONE_FRAME(clip clip){
	return Trim(clip,0,Framecount(clip)-2)
}

function REMAP_30P_SUBTITLE_TIME(int frame_index_30p,int session_start_120p,bool is_24p_session){
	time_ratio = is_24p_session?5.0:4.0
	return Floor(((frame_index_30p*time_ratio_30p)-session_start_120p)/time_ratio)
}

function REMAP_30P_SUBTITLE_LENGTH(int frame_count_30p,bool is_24p_session){
	time_ratio = is_24p_session?5.0:4.0
	return Round((frame_count_30p*time_ratio_30p)/time_ratio)
}

function SUBTITLE_FX_1(clip clip,string text,float x,float y,int start_frame,int end_frame,int session_start_120p,bool is_24p_session,bool "is_title"){
	is_title=Default(is_title,false)

	halo_color=is_title?OVERWRITE_COLOR_ALPHA(subtitle_halo_color,$0):subtitle_halo_color

	start_frame=REMAP_30P_SUBTITLE_TIME(start_frame,session_start_120p,is_24p_session)
	end_frame=REMAP_30P_SUBTITLE_TIME(end_frame,session_start_120p,is_24p_session)
	front_fade_count=REMAP_30P_SUBTITLE_LENGTH(subtitle_front_fade_count,is_24p_session)
	rear_fade_count=REMAP_30P_SUBTITLE_LENGTH(subtitle_rear_fade_count,is_24p_session)

	#return clip
	#return SUBTITLE_TEST(clip,text,start_frame-front_fade_count,end_frame+rear_fade_count)
	return SUBTITLE_FX_RANDOM_STRING(clip,text,Round(x),Round(y),start_frame,end_frame,front_fade_count,rear_fade_count,subtitle_font,subtitle_effects,Round(subtitle_size),subtitle_text_color,halo_color,random_char_func=subtitle_random_char_func)
}

function SUBTITLE_FX_2(clip clip,string text,float x,float y,int start_frame,int end_frame,int session_start_120p,bool is_24p_session){
	start_frame=REMAP_30P_SUBTITLE_TIME(start_frame,session_start_120p,is_24p_session)
	end_frame=REMAP_30P_SUBTITLE_TIME(end_frame,session_start_120p,is_24p_session)
	front_fade_count=REMAP_30P_SUBTITLE_LENGTH(subtitle_front_fade_count,is_24p_session)
	rear_fade_count=REMAP_30P_SUBTITLE_LENGTH(subtitle_rear_fade_count,is_24p_session)

	#return clip
	#return SUBTITLE_TEST(clip,text,start_frame-front_fade_count,end_frame+rear_fade_count)
	return SUBTITLE_FX_FADE_IN_FADE_OUT(clip,text,Round(x),Round(y),start_frame,end_frame,front_fade_count,rear_fade_count,subtitle_font,subtitle_effects,Round(subtitle_size),subtitle_text_color,subtitle_halo_color)
}

### inherit end ###



#koukaku_kidoutai_sac_op_bs_part01_23p

part01_start=0
koukaku_kidoutai_sac_op_bs_part01_23p=EXTEND_ONE_FRAME(koukaku_kidoutai_sac_op_bs_part01_23p)

koukaku_kidoutai_sac_op_bs_part01_23p=SUBTITLE_FX_1(koukaku_kidoutai_sac_op_bs_part01_23p,"inner universe//origa|- by fielia@AVISynth",subtitle_x,subtitle_y-subtitle_size,184,444,part01_start,true,true)

koukaku_kidoutai_sac_op_bs_part01_23p=UNDO_EXTEND_ONE_FRAME(koukaku_kidoutai_sac_op_bs_part01_23p)



#koukaku_kidoutai_sac_op_bs_part02_29p

part02_start=2125
koukaku_kidoutai_sac_op_bs_part02_29p=EXTEND_ONE_FRAME(koukaku_kidoutai_sac_op_bs_part02_29p)

koukaku_kidoutai_sac_op_bs_part02_29p=SUBTITLE_FX_1(koukaku_kidoutai_sac_op_bs_part02_29p,"Ñ@Ñ~ÑsÑuÑ|Ñç Ñy ÑtÑuÑ}ÑÄÑ~Ñç Ñ{ÑÇÑÖÑwÑyÑ|Ñy Ñ~ÑpÑtÑÄ Ñ}Ñ~ÑÄÑz",subtitle_x,subtitle_y,698,847,part02_start,false)
koukaku_kidoutai_sac_op_bs_part02_29p=SUBTITLE_FX_2(koukaku_kidoutai_sac_op_bs_part02_29p,"Angely i demony kruzhili nado mnoj",subtitle_x,subtitle_y-subtitle_size,698,847,part02_start,false)
koukaku_kidoutai_sac_op_bs_part02_29p=SUBTITLE_FX_1(koukaku_kidoutai_sac_op_bs_part02_29p,"ÑQÑpÑxÑqÑyÑrÑpÑ|Ñy ÑÑÑuÑÇÑ~ÑyÑy Ñy ÑxÑrÑvÑxÑtÑ~ÑçÑu ÑÅÑÖÑÑÑy",subtitle_x,subtitle_y,872,1019,part02_start,false)
koukaku_kidoutai_sac_op_bs_part02_29p=SUBTITLE_FX_2(koukaku_kidoutai_sac_op_bs_part02_29p,"Razbivali ternii i zvyozdnye puti",subtitle_x,subtitle_y-subtitle_size,872,1019,part02_start,false)
koukaku_kidoutai_sac_op_bs_part02_29p=SUBTITLE_FX_1(koukaku_kidoutai_sac_op_bs_part02_29p,"ÑNÑu ÑxÑ~ÑpÑuÑÑ ÑÉÑâÑpÑÉÑÑÑéÑë ÑÑÑÄÑ|ÑéÑ{ÑÄ ÑÑÑÄÑÑ,",subtitle_x,subtitle_y,1033,1177,part02_start,false)
koukaku_kidoutai_sac_op_bs_part02_29p=SUBTITLE_FX_2(koukaku_kidoutai_sac_op_bs_part02_29p,"Ne znaet schast'ya tol'ko tot,",subtitle_x,subtitle_y-subtitle_size,1033,1177,part02_start,false)
koukaku_kidoutai_sac_op_bs_part02_29p=SUBTITLE_FX_1(koukaku_kidoutai_sac_op_bs_part02_29p,"ÑKÑÑÑÄ ÑuÑsÑÄ ÑxÑÄÑrÑp ÑÅÑÄÑ~ÑëÑÑÑé Ñ~Ñu ÑÉÑ}ÑÄÑs...",subtitle_x,subtitle_y,1208,1389,part02_start,false)
koukaku_kidoutai_sac_op_bs_part02_29p=SUBTITLE_FX_2(koukaku_kidoutai_sac_op_bs_part02_29p,"Kto ego zova ponyat' ne smog...",subtitle_x,subtitle_y-subtitle_size,1208,1389,part02_start,false)

koukaku_kidoutai_sac_op_bs_part02_29p=SUBTITLE_FX_2(koukaku_kidoutai_sac_op_bs_part02_29p,"Mana du vortes, mana du vortes",subtitle_x,subtitle_x,1392,1560,part02_start,false)
koukaku_kidoutai_sac_op_bs_part02_29p=SUBTITLE_FX_2(koukaku_kidoutai_sac_op_bs_part02_29p,"Aeria gloris, aeria gloris",subtitle_x,subtitle_x,1565,1730,part02_start,false)
koukaku_kidoutai_sac_op_bs_part02_29p=SUBTITLE_FX_2(koukaku_kidoutai_sac_op_bs_part02_29p,"Mana du vortes, mana du vortes",subtitle_x,subtitle_x,1737,1905,part02_start,false)
koukaku_kidoutai_sac_op_bs_part02_29p=SUBTITLE_FX_2(koukaku_kidoutai_sac_op_bs_part02_29p,"Aeria gloris, aeria gloris",subtitle_x,subtitle_x,1909,2086,part02_start,false)

koukaku_kidoutai_sac_op_bs_part02_29p=SUBTITLE_FX_1(koukaku_kidoutai_sac_op_bs_part02_29p,"I am Calling Calling now, Spirits rise and falling",subtitle_x,subtitle_y,2049,2424,part02_start,false)
koukaku_kidoutai_sac_op_bs_part02_29p=SUBTITLE_FX_1(koukaku_kidoutai_sac_op_bs_part02_29p,"ÑRÑÄÑqÑÄÑz ÑÄÑÉÑÑÑpÑÑÑéÑÉÑë ÑtÑÄÑ|ÑéÑäÑu...",subtitle_x,subtitle_y,2446,2592,part02_start,false)
koukaku_kidoutai_sac_op_bs_part02_29p=SUBTITLE_FX_2(koukaku_kidoutai_sac_op_bs_part02_29p,"Soboj ostat'sya dol'she...",subtitle_x,subtitle_y-subtitle_size,2446,2592,part02_start,false)
koukaku_kidoutai_sac_op_bs_part02_29p=SUBTITLE_FX_1(koukaku_kidoutai_sac_op_bs_part02_29p,"Calling Calling, in the depth of longing",subtitle_x,subtitle_y,2598,2946,part02_start,false)
koukaku_kidoutai_sac_op_bs_part02_29p=SUBTITLE_FX_1(koukaku_kidoutai_sac_op_bs_part02_29p,"ÑRÑÄÑqÑÄÑz ÑÄÑÉÑÑÑpÑÑÑéÑÉÑë ÑtÑÄÑ|ÑéÑäÑu...",subtitle_x,subtitle_y,2962,3229,part02_start,false)
koukaku_kidoutai_sac_op_bs_part02_29p=SUBTITLE_FX_2(koukaku_kidoutai_sac_op_bs_part02_29p,"Soboj ostat'sya dol'she...",subtitle_x,subtitle_y-subtitle_size,2962,3229,part02_start,false)

koukaku_kidoutai_sac_op_bs_part02_29p=SUBTITLE_FX_2(koukaku_kidoutai_sac_op_bs_part02_29p,"Mana du vortes, mana du vortes",subtitle_x,subtitle_x,3115,3281,part02_start,false)
koukaku_kidoutai_sac_op_bs_part02_29p=SUBTITLE_FX_2(koukaku_kidoutai_sac_op_bs_part02_29p,"Aeria gloris, aeria gloris",subtitle_x,subtitle_x,3290,3468,part02_start,false)

koukaku_kidoutai_sac_op_bs_part02_29p=UNDO_EXTEND_ONE_FRAME(koukaku_kidoutai_sac_op_bs_part02_29p)

### export clip: koukaku_kidoutai_sac_op_bs_part01_23p,koukaku_kidoutai_sac_op_bs_part02_29p,koukaku_kidoutai_sac_op_bs_part03_23p,koukaku_kidoutai_sac_op_bs_part04_29p,koukaku_kidoutai_sac_op_bs_part05_23p,koukaku_kidoutai_sac_op_bs_part06_29p,koukaku_kidoutai_sac_op_bs_part07_23p

### prefetch: 5,2

### ###



#koukaku_kidoutai_sac_op_bs_part03_23p

part03_start=13861
koukaku_kidoutai_sac_op_bs_part03_23p=EXTEND_ONE_FRAME(koukaku_kidoutai_sac_op_bs_part03_23p)

koukaku_kidoutai_sac_op_bs_part03_23p=SUBTITLE_FX_2(koukaku_kidoutai_sac_op_bs_part03_23p,"Aeria gloris, aeria gloris",subtitle_x,subtitle_x,3290,3468,part03_start,true)

koukaku_kidoutai_sac_op_bs_part03_23p=SUBTITLE_FX_1(koukaku_kidoutai_sac_op_bs_part03_23p,"Stand alone... Where was life when it had a meaning...",subtitle_x,subtitle_y,3799,4048,part03_start,true)
koukaku_kidoutai_sac_op_bs_part03_23p=SUBTITLE_FX_1(koukaku_kidoutai_sac_op_bs_part03_23p,"Stand alone... Nothing's real anymore and...",subtitle_x,subtitle_y-subtitle_size*2,4144,4327,part03_start,true)

koukaku_kidoutai_sac_op_bs_part03_23p=SUBTITLE_FX_1(koukaku_kidoutai_sac_op_bs_part03_23p,"...ÑAÑuÑÉÑ{ÑÄÑ~ÑuÑâÑ~ÑçÑz ÑqÑuÑs...",subtitle_x,subtitle_y,4320,4519,part03_start,true)
koukaku_kidoutai_sac_op_bs_part03_23p=SUBTITLE_FX_2(koukaku_kidoutai_sac_op_bs_part03_23p,"...Beskonechnyj beg...",subtitle_x,subtitle_y-subtitle_size,4320,4519,part03_start,true)

koukaku_kidoutai_sac_op_bs_part03_23p=UNDO_EXTEND_ONE_FRAME(koukaku_kidoutai_sac_op_bs_part03_23p)



#koukaku_kidoutai_sac_op_bs_part04_29p

part04_start=17976
koukaku_kidoutai_sac_op_bs_part04_29p=EXTEND_ONE_FRAME(koukaku_kidoutai_sac_op_bs_part04_29p)

koukaku_kidoutai_sac_op_bs_part04_29p=SUBTITLE_FX_1(koukaku_kidoutai_sac_op_bs_part04_29p,"...ÑAÑuÑÉÑ{ÑÄÑ~ÑuÑâÑ~ÑçÑz ÑqÑuÑs...",subtitle_x,subtitle_y,4320,4519,part04_start,false)
koukaku_kidoutai_sac_op_bs_part04_29p=SUBTITLE_FX_2(koukaku_kidoutai_sac_op_bs_part04_29p,"...Beskonechnyj beg...",subtitle_x,subtitle_y-subtitle_size,4320,4519,part04_start,false)
koukaku_kidoutai_sac_op_bs_part04_29p=SUBTITLE_FX_1(koukaku_kidoutai_sac_op_bs_part04_29p,"ÑPÑÄÑ{Ñp ÑwÑyÑrÑp|Ñë Ñ}ÑÄÑsÑÖ ÑÉÑÑÑpÑÇÑpÑÑÑéÑÉÑë Ñ~Ñp Ñ|ÑuÑÑÑÖ Ñ~Ñu ÑÖÑÅÑpÑÉÑÑÑé,",subtitle_x,subtitle_y-subtitle_size,4526,4897,part04_start,false)
koukaku_kidoutai_sac_op_bs_part04_29p=SUBTITLE_FX_2(koukaku_kidoutai_sac_op_bs_part04_29p,"Poka zhiva|ya mogu starat'sya na letu ne upast',",subtitle_x,subtitle_y-subtitle_size*3,4526,4897,part04_start,false)

koukaku_kidoutai_sac_op_bs_part04_29p=UNDO_EXTEND_ONE_FRAME(koukaku_kidoutai_sac_op_bs_part04_29p)



#koukaku_kidoutai_sac_op_bs_part05_23p

part05_start=18656
koukaku_kidoutai_sac_op_bs_part05_23p=EXTEND_ONE_FRAME(koukaku_kidoutai_sac_op_bs_part05_23p)

koukaku_kidoutai_sac_op_bs_part05_23p=SUBTITLE_FX_1(koukaku_kidoutai_sac_op_bs_part05_23p,"ÑPÑÄÑ{Ñp ÑwÑyÑrÑp|Ñë Ñ}ÑÄÑsÑÖ ÑÉÑÑÑpÑÇÑpÑÑÑéÑÉÑë Ñ~Ñp Ñ|ÑuÑÑÑÖ Ñ~Ñu ÑÖÑÅÑpÑÉÑÑÑé,",subtitle_x,subtitle_y-subtitle_size,4526,4897,part05_start,true)
koukaku_kidoutai_sac_op_bs_part05_23p=SUBTITLE_FX_2(koukaku_kidoutai_sac_op_bs_part05_23p,"Poka zhiva|ya mogu starat'sya na letu ne upast',",subtitle_x,subtitle_y-subtitle_size*3,4526,4897,part05_start,true)
koukaku_kidoutai_sac_op_bs_part05_23p=SUBTITLE_FX_1(koukaku_kidoutai_sac_op_bs_part05_23p,"ÑNÑu ÑÇÑpÑxÑÖÑâÑyÑÑÑéÑÉÑë Ñ}ÑuÑâÑÑÑpÑÑÑé... Ñ|ÑêÑqÑyÑÑÑé...",subtitle_x,subtitle_y,4911,5264,part05_start,true)
koukaku_kidoutai_sac_op_bs_part05_23p=SUBTITLE_FX_2(koukaku_kidoutai_sac_op_bs_part05_23p,"Ne razuchit'sya mechtat'... lyubit'...",subtitle_x,subtitle_y-subtitle_size,4911,5264,part05_start,true)
koukaku_kidoutai_sac_op_bs_part05_23p=SUBTITLE_FX_1(koukaku_kidoutai_sac_op_bs_part05_23p,"...ÑAÑuÑÉÑ{ÑÄÑ~ÑuÑâÑ~ÑçÑz ÑqÑuÑs...",subtitle_x,subtitle_y,5268,5465,part05_start,true)
koukaku_kidoutai_sac_op_bs_part05_23p=SUBTITLE_FX_2(koukaku_kidoutai_sac_op_bs_part05_23p,"...Beskonechnyj beg...",subtitle_x,subtitle_y-subtitle_size,5268,5465,part05_start,true)

koukaku_kidoutai_sac_op_bs_part05_23p=SUBTITLE_FX_1(koukaku_kidoutai_sac_op_bs_part05_23p,"Calling Calling now, For the place of knowing",subtitle_x,subtitle_y-subtitle_size*2,5354-3,5704,part05_start,true)

koukaku_kidoutai_sac_op_bs_part05_23p=UNDO_EXTEND_ONE_FRAME(koukaku_kidoutai_sac_op_bs_part05_23p)



#koukaku_kidoutai_sac_op_bs_part06_29p

part06_start=21421
koukaku_kidoutai_sac_op_bs_part06_29p=EXTEND_ONE_FRAME(koukaku_kidoutai_sac_op_bs_part06_29p)

koukaku_kidoutai_sac_op_bs_part06_29p=SUBTITLE_FX_1(koukaku_kidoutai_sac_op_bs_part06_29p,"...ÑAÑuÑÉÑ{ÑÄÑ~ÑuÑâÑ~ÑçÑz ÑqÑuÑs...",subtitle_x,subtitle_y,5268,5465,part06_start,false)
koukaku_kidoutai_sac_op_bs_part06_29p=SUBTITLE_FX_2(koukaku_kidoutai_sac_op_bs_part06_29p,"...Beskonechnyj beg...",subtitle_x,subtitle_y-subtitle_size,5268,5465,part06_start,false)

koukaku_kidoutai_sac_op_bs_part06_29p=SUBTITLE_FX_1(koukaku_kidoutai_sac_op_bs_part06_29p,"Calling Calling now, For the place of knowing",subtitle_x,subtitle_y-subtitle_size*2,5354-3,5704,part06_start,false)
koukaku_kidoutai_sac_op_bs_part06_29p=SUBTITLE_FX_1(koukaku_kidoutai_sac_op_bs_part06_29p,"There's more than what can be linked",subtitle_x,subtitle_y,5720,5863,part06_start,false)

koukaku_kidoutai_sac_op_bs_part06_29p=UNDO_EXTEND_ONE_FRAME(koukaku_kidoutai_sac_op_bs_part06_29p)

### export clip: koukaku_kidoutai_sac_op_bs_part01_23p,koukaku_kidoutai_sac_op_bs_part02_29p,koukaku_kidoutai_sac_op_bs_part03_23p,koukaku_kidoutai_sac_op_bs_part04_29p,koukaku_kidoutai_sac_op_bs_part05_23p,koukaku_kidoutai_sac_op_bs_part06_29p,koukaku_kidoutai_sac_op_bs_part07_23p

### prefetch: 5,2

### ###



#koukaku_kidoutai_sac_op_bs_part07_23p

part07_start=22921
koukaku_kidoutai_sac_op_bs_part07_23p=EXTEND_ONE_FRAME(koukaku_kidoutai_sac_op_bs_part07_23p)

koukaku_kidoutai_sac_op_bs_part07_23p=SUBTITLE_FX_1(koukaku_kidoutai_sac_op_bs_part07_23p,"There's more than what can be linked",subtitle_x,subtitle_y,5720,5863,part07_start,true)
koukaku_kidoutai_sac_op_bs_part07_23p=SUBTITLE_FX_1(koukaku_kidoutai_sac_op_bs_part07_23p,"Calling Calling now, Never will I look away",subtitle_x,subtitle_y,5872,6222,part07_start,true)
koukaku_kidoutai_sac_op_bs_part07_23p=SUBTITLE_FX_1(koukaku_kidoutai_sac_op_bs_part07_23p,"For what life has left for me",subtitle_x,subtitle_y,6236,6385,part07_start,true)
koukaku_kidoutai_sac_op_bs_part07_23p=SUBTITLE_FX_1(koukaku_kidoutai_sac_op_bs_part07_23p,"Yearning Yearning, for what's left of loving",subtitle_x,subtitle_y,6388,6737,part07_start,true)

koukaku_kidoutai_sac_op_bs_part07_23p=SUBTITLE_FX_1(koukaku_kidoutai_sac_op_bs_part07_23p,"ÑRÑÄÑqÑÄÑz ÑÄÑÉÑÑÑpÑÑÑéÑÉÑë ÑtÑÄÑ|ÑéÑäÑu...",subtitle_x,subtitle_y,6752,6895,part07_start,true)
koukaku_kidoutai_sac_op_bs_part07_23p=SUBTITLE_FX_2(koukaku_kidoutai_sac_op_bs_part07_23p,"Soboj ostat'sya dol'she...",subtitle_x,subtitle_y-subtitle_size,6752,6895,part07_start,true)
koukaku_kidoutai_sac_op_bs_part07_23p=SUBTITLE_FX_1(koukaku_kidoutai_sac_op_bs_part07_23p,"Calling Calling now, Spirits rise and falling",subtitle_x,subtitle_y,6905,7254,part07_start,true)
koukaku_kidoutai_sac_op_bs_part07_23p=SUBTITLE_FX_1(koukaku_kidoutai_sac_op_bs_part07_23p,"ÑRÑÄÑqÑÄÑz ÑÄÑÉÑÑÑpÑÑÑéÑÉÑë ÑtÑÄÑ|ÑéÑäÑu...",subtitle_x,subtitle_y,7270,7413,part07_start,true)
koukaku_kidoutai_sac_op_bs_part07_23p=SUBTITLE_FX_2(koukaku_kidoutai_sac_op_bs_part07_23p,"Soboj ostat'sya dol'she...",subtitle_x,subtitle_y-subtitle_size,7270,7413,part07_start,true)
koukaku_kidoutai_sac_op_bs_part07_23p=SUBTITLE_FX_1(koukaku_kidoutai_sac_op_bs_part07_23p,"Calling Calling, in the depth of longing",subtitle_x,subtitle_y,7421,7778,part07_start,true)
koukaku_kidoutai_sac_op_bs_part07_23p=SUBTITLE_FX_1(koukaku_kidoutai_sac_op_bs_part07_23p,"ÑRÑÄÑqÑÄÑz ÑÄÑÉÑÑÑpÑÑÑéÑÉÑë ÑtÑÄÑ|ÑéÑäÑu...",subtitle_x,subtitle_y,7786,8063,part07_start,true)
koukaku_kidoutai_sac_op_bs_part07_23p=SUBTITLE_FX_2(koukaku_kidoutai_sac_op_bs_part07_23p,"Soboj ostat'sya dol'she...",subtitle_x,subtitle_y-subtitle_size,7786,8063,part07_start,true)

koukaku_kidoutai_sac_op_bs_part07_23p=SUBTITLE_FX_2(koukaku_kidoutai_sac_op_bs_part07_23p,"Mana du vortes, mana du vortes",subtitle_x,subtitle_x,7942,8105,part07_start,true)
koukaku_kidoutai_sac_op_bs_part07_23p=SUBTITLE_FX_2(koukaku_kidoutai_sac_op_bs_part07_23p,"Aeria gloris, aeria gloris",subtitle_x,subtitle_x,8111,8277,part07_start,true)
koukaku_kidoutai_sac_op_bs_part07_23p=SUBTITLE_FX_2(koukaku_kidoutai_sac_op_bs_part07_23p,"Mana du vortes, mana du vortes",subtitle_x,subtitle_x,8283,8449,part07_start,true)
koukaku_kidoutai_sac_op_bs_part07_23p=SUBTITLE_FX_2(koukaku_kidoutai_sac_op_bs_part07_23p,"Aeria gloris, aeria gloris",subtitle_x,subtitle_x,8458,8637,part07_start,true)

koukaku_kidoutai_sac_op_bs_part07_23p=UNDO_EXTEND_ONE_FRAME(koukaku_kidoutai_sac_op_bs_part07_23p)

######## Thumbnail ########

is_thumbnail=false

koukaku_kidoutai_sac_op_bs_part02_29p=is_thumbnail?ConvertToRGB32(last):koukaku_kidoutai_sac_op_bs_part02_29p

######## Merge ########

koukaku_kidoutai_sac_op_bs_mute=CHANGE_24P_TO_120P(koukaku_kidoutai_sac_op_bs_part01_23p)+CHANGE_30P_TO_120P(koukaku_kidoutai_sac_op_bs_part02_29p) \
	+CHANGE_24P_TO_120P(koukaku_kidoutai_sac_op_bs_part03_23p)+CHANGE_30P_TO_120P(koukaku_kidoutai_sac_op_bs_part04_29p)+CHANGE_24P_TO_120P(koukaku_kidoutai_sac_op_bs_part05_23p) \
	+CHANGE_30P_TO_120P(koukaku_kidoutai_sac_op_bs_part06_29p)+CHANGE_24P_TO_120P(koukaku_kidoutai_sac_op_bs_part07_23p)

koukaku_kidoutai_sac_op_bs_mute

######## Music ########

bgm_48khz=SSRC(WAVSource("src\koukaku_kidoutai_sac-ost1-11.wav"),48000)
AudioDub(bgm_48khz)



thumbnail=Trim(8965,-30*5*time_ratio_30p)
is_thumbnail?thumbnail:last

""")

######## Post Processing ########

ConvertToYV12()
#ConvertToYUY2()
#ConvertToRGB24()



LoadPlugin("..\plugins\DeDup.dll")
#DupMC(log="koukaku_kidoutai_sac-op-bs.dup.txt")
DeDup(threshold=0.01,maxcopies=12,maxdrops=5,log="koukaku_kidoutai_sac-op-bs.dup.txt",times="koukaku_kidoutai_sac-op-bs.times.txt")



TCPServer()
