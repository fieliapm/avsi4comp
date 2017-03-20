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

######## BD (1080P) ########

enable_multi_thread=false

koukaku_kidoutai_sac_2nd_op_bs=FFMS2_VIDEO_SOURCE("src\koukaku_kidoutai\koukaku_kidoutai_sac_2nd\special\koukaku_kidoutai_sac_2nd-tv-sp-op.mp4",enable_multi_thread=enable_multi_thread)

koukaku_kidoutai_sac_2nd_op_temp=FFMS2_VIDEO_SOURCE("src\koukaku_kidoutai\koukaku_kidoutai_sac_2nd\special\koukaku_kidoutai_sac_2nd-tv-sp-op-temporary.mp4",enable_multi_thread=enable_multi_thread)

koukaku_kidoutai_sac_2nd_tv_01=FFMS2_VIDEO_SOURCE("src\koukaku_kidoutai\koukaku_kidoutai_sac_2nd\koukaku_kidoutai_sac_2nd-tv-01.mp4",enable_multi_thread=enable_multi_thread)
koukaku_kidoutai_sac_2nd_tv_02=FFMS2_VIDEO_SOURCE("src\koukaku_kidoutai\koukaku_kidoutai_sac_2nd\koukaku_kidoutai_sac_2nd-tv-02.mp4",enable_multi_thread=enable_multi_thread)
koukaku_kidoutai_sac_2nd_tv_03=FFMS2_VIDEO_SOURCE("src\koukaku_kidoutai\koukaku_kidoutai_sac_2nd\koukaku_kidoutai_sac_2nd-tv-03.mp4",enable_multi_thread=enable_multi_thread)
koukaku_kidoutai_sac_2nd_tv_04=FFMS2_VIDEO_SOURCE("src\koukaku_kidoutai\koukaku_kidoutai_sac_2nd\koukaku_kidoutai_sac_2nd-tv-04.mp4",enable_multi_thread=enable_multi_thread)
koukaku_kidoutai_sac_2nd_tv_05=FFMS2_VIDEO_SOURCE("src\koukaku_kidoutai\koukaku_kidoutai_sac_2nd\koukaku_kidoutai_sac_2nd-tv-05.mp4",enable_multi_thread=enable_multi_thread)
koukaku_kidoutai_sac_2nd_tv_06=FFMS2_VIDEO_SOURCE("src\koukaku_kidoutai\koukaku_kidoutai_sac_2nd\koukaku_kidoutai_sac_2nd-tv-06.mp4",enable_multi_thread=enable_multi_thread)
koukaku_kidoutai_sac_2nd_tv_07=FFMS2_VIDEO_SOURCE("src\koukaku_kidoutai\koukaku_kidoutai_sac_2nd\koukaku_kidoutai_sac_2nd-tv-07.mp4",enable_multi_thread=enable_multi_thread)
koukaku_kidoutai_sac_2nd_tv_08=FFMS2_VIDEO_SOURCE("src\koukaku_kidoutai\koukaku_kidoutai_sac_2nd\koukaku_kidoutai_sac_2nd-tv-08.mp4",enable_multi_thread=enable_multi_thread)
koukaku_kidoutai_sac_2nd_tv_09=FFMS2_VIDEO_SOURCE("src\koukaku_kidoutai\koukaku_kidoutai_sac_2nd\koukaku_kidoutai_sac_2nd-tv-09.mp4",enable_multi_thread=enable_multi_thread)
koukaku_kidoutai_sac_2nd_tv_10=FFMS2_VIDEO_SOURCE("src\koukaku_kidoutai\koukaku_kidoutai_sac_2nd\koukaku_kidoutai_sac_2nd-tv-10.mp4",enable_multi_thread=enable_multi_thread)
koukaku_kidoutai_sac_2nd_tv_11=FFMS2_VIDEO_SOURCE("src\koukaku_kidoutai\koukaku_kidoutai_sac_2nd\koukaku_kidoutai_sac_2nd-tv-11.mp4",enable_multi_thread=enable_multi_thread)
koukaku_kidoutai_sac_2nd_tv_12=FFMS2_VIDEO_SOURCE("src\koukaku_kidoutai\koukaku_kidoutai_sac_2nd\koukaku_kidoutai_sac_2nd-tv-12.mp4",enable_multi_thread=enable_multi_thread)
koukaku_kidoutai_sac_2nd_tv_13=FFMS2_VIDEO_SOURCE("src\koukaku_kidoutai\koukaku_kidoutai_sac_2nd\koukaku_kidoutai_sac_2nd-tv-13.mp4",enable_multi_thread=enable_multi_thread)
koukaku_kidoutai_sac_2nd_tv_14=FFMS2_VIDEO_SOURCE("src\koukaku_kidoutai\koukaku_kidoutai_sac_2nd\koukaku_kidoutai_sac_2nd-tv-14.mp4",enable_multi_thread=enable_multi_thread)
koukaku_kidoutai_sac_2nd_tv_15=FFMS2_VIDEO_SOURCE("src\koukaku_kidoutai\koukaku_kidoutai_sac_2nd\koukaku_kidoutai_sac_2nd-tv-15.mp4",enable_multi_thread=enable_multi_thread)
koukaku_kidoutai_sac_2nd_tv_16=FFMS2_VIDEO_SOURCE("src\koukaku_kidoutai\koukaku_kidoutai_sac_2nd\koukaku_kidoutai_sac_2nd-tv-16.mp4",enable_multi_thread=enable_multi_thread)
koukaku_kidoutai_sac_2nd_tv_17=FFMS2_VIDEO_SOURCE("src\koukaku_kidoutai\koukaku_kidoutai_sac_2nd\koukaku_kidoutai_sac_2nd-tv-17.mp4",enable_multi_thread=enable_multi_thread)
koukaku_kidoutai_sac_2nd_tv_18=FFMS2_VIDEO_SOURCE("src\koukaku_kidoutai\koukaku_kidoutai_sac_2nd\koukaku_kidoutai_sac_2nd-tv-18.mp4",enable_multi_thread=enable_multi_thread)
koukaku_kidoutai_sac_2nd_tv_19=FFMS2_VIDEO_SOURCE("src\koukaku_kidoutai\koukaku_kidoutai_sac_2nd\koukaku_kidoutai_sac_2nd-tv-19.mp4",enable_multi_thread=enable_multi_thread)
#koukaku_kidoutai_sac_2nd_tv_20=FFMS2_VIDEO_SOURCE("src\koukaku_kidoutai\koukaku_kidoutai_sac_2nd\koukaku_kidoutai_sac_2nd-tv-20.mp4",enable_multi_thread=enable_multi_thread)
#koukaku_kidoutai_sac_2nd_tv_21=FFMS2_VIDEO_SOURCE("src\koukaku_kidoutai\koukaku_kidoutai_sac_2nd\koukaku_kidoutai_sac_2nd-tv-21.mp4",enable_multi_thread=enable_multi_thread)
#koukaku_kidoutai_sac_2nd_tv_22=FFMS2_VIDEO_SOURCE("src\koukaku_kidoutai\koukaku_kidoutai_sac_2nd\koukaku_kidoutai_sac_2nd-tv-22.mp4",enable_multi_thread=enable_multi_thread)
#koukaku_kidoutai_sac_2nd_tv_23=FFMS2_VIDEO_SOURCE("src\koukaku_kidoutai\koukaku_kidoutai_sac_2nd\koukaku_kidoutai_sac_2nd-tv-23.mp4",enable_multi_thread=enable_multi_thread)
#koukaku_kidoutai_sac_2nd_tv_24=FFMS2_VIDEO_SOURCE("src\koukaku_kidoutai\koukaku_kidoutai_sac_2nd\koukaku_kidoutai_sac_2nd-tv-24.mp4",enable_multi_thread=enable_multi_thread)
#koukaku_kidoutai_sac_2nd_tv_25=FFMS2_VIDEO_SOURCE("src\koukaku_kidoutai\koukaku_kidoutai_sac_2nd\koukaku_kidoutai_sac_2nd-tv-25.mp4",enable_multi_thread=enable_multi_thread)
koukaku_kidoutai_sac_2nd_tv_26=FFMS2_VIDEO_SOURCE("src\koukaku_kidoutai\koukaku_kidoutai_sac_2nd\koukaku_kidoutai_sac_2nd-tv-26.mp4",enable_multi_thread=enable_multi_thread)

######## Trim ########

koukaku_kidoutai_sac_2nd_op_bs_01_01=Trim(koukaku_kidoutai_sac_2nd_op_bs,0,198)
koukaku_kidoutai_sac_2nd_op_bs_01_02=Trim(koukaku_kidoutai_sac_2nd_op_bs,199,214)
koukaku_kidoutai_sac_2nd_op_bs_02=Trim(koukaku_kidoutai_sac_2nd_op_bs,215,1147)
koukaku_kidoutai_sac_2nd_op_bs_03=Trim(koukaku_kidoutai_sac_2nd_op_bs,1148,0)



koukaku_kidoutai_sac_2nd_op_temp_01_01=Trim(koukaku_kidoutai_sac_2nd_op_temp,0,197)
koukaku_kidoutai_sac_2nd_op_temp_01_02=Trim(koukaku_kidoutai_sac_2nd_op_temp,198,213)
koukaku_kidoutai_sac_2nd_op_temp_02=Trim(koukaku_kidoutai_sac_2nd_op_temp,214,1158)
koukaku_kidoutai_sac_2nd_op_temp_03=Trim(koukaku_kidoutai_sac_2nd_op_temp,1159,1839)
#koukaku_kidoutai_sac_2nd_op_temp_04=Trim(koukaku_kidoutai_sac_2nd_op_temp,1840,0)



koukaku_kidoutai_sac_2nd_tv_01_motoko_hack=Trim(koukaku_kidoutai_sac_2nd_tv_01,4049,4874) #

koukaku_kidoutai_sac_2nd_tv_02_helicopter_cruise_01=Trim(koukaku_kidoutai_sac_2nd_tv_02,29150,29269)
koukaku_kidoutai_sac_2nd_tv_02_helicopter_cruise_02=Trim(koukaku_kidoutai_sac_2nd_tv_02,32908,33110) #

koukaku_kidoutai_sac_2nd_tv_03_motoko_steal_something=Trim(koukaku_kidoutai_sac_2nd_tv_03,3303,3555) # # 3389~3555
koukaku_kidoutai_sac_2nd_tv_03_candy_girls_01=Trim(koukaku_kidoutai_sac_2nd_tv_03,13018,13136)
koukaku_kidoutai_sac_2nd_tv_03_candy_girls_02=Trim(koukaku_kidoutai_sac_2nd_tv_03,15307,15437)

koukaku_kidoutai_sac_2nd_tv_04_helicopter_run_away=Trim(koukaku_kidoutai_sac_2nd_tv_04,8420,8627)
koukaku_kidoutai_sac_2nd_tv_04_motoko_watch_broken_helicopter=Trim(koukaku_kidoutai_sac_2nd_tv_04,20755,20944) #

koukaku_kidoutai_sac_2nd_tv_05_motoko_vs_hideo_01=Trim(koukaku_kidoutai_sac_2nd_tv_05,30836,31034) #
koukaku_kidoutai_sac_2nd_tv_05_motoko_vs_hideo_02=Trim(koukaku_kidoutai_sac_2nd_tv_05,31102,31203) #

koukaku_kidoutai_sac_2nd_tv_06_memory=Trim(koukaku_kidoutai_sac_2nd_tv_06,23552,23622)
koukaku_kidoutai_sac_2nd_tv_06_ruriko_jump=Trim(koukaku_kidoutai_sac_2nd_tv_06,27414,27647) #

koukaku_kidoutai_sac_2nd_tv_07_helicopter_lift_off=Trim(koukaku_kidoutai_sac_2nd_tv_07,12910,13097) #

koukaku_kidoutai_sac_2nd_tv_08_tachikoma_jump=Trim(koukaku_kidoutai_sac_2nd_tv_08,31065,31189) #

koukaku_kidoutai_sac_2nd_tv_09_bomb=Trim(koukaku_kidoutai_sac_2nd_tv_09,3780,4027)
koukaku_kidoutai_sac_2nd_tv_09_tachikoma_hack=Trim(koukaku_kidoutai_sac_2nd_tv_09,17642,17862)
koukaku_kidoutai_sac_2nd_tv_09_motoko_hack_kazundo_01=Trim(koukaku_kidoutai_sac_2nd_tv_09,19217,19431) #
koukaku_kidoutai_sac_2nd_tv_09_motoko_hack_kazundo_02=Trim(koukaku_kidoutai_sac_2nd_tv_09,22957,24059)

koukaku_kidoutai_sac_2nd_tv_10_togusa_family=Trim(koukaku_kidoutai_sac_2nd_tv_10,32769,32974) #

koukaku_kidoutai_sac_2nd_tv_11_motoko_jump=Trim(koukaku_kidoutai_sac_2nd_tv_11,3411,3528) #
koukaku_kidoutai_sac_2nd_tv_11_motoko_roll=Trim(koukaku_kidoutai_sac_2nd_tv_11,3529,3692) #
koukaku_kidoutai_sac_2nd_tv_11_motoko_watch_street=Trim(koukaku_kidoutai_sac_2nd_tv_11,7636,7897) #

koukaku_kidoutai_sac_2nd_tv_12_togusa_hack=Trim(koukaku_kidoutai_sac_2nd_tv_12,5510,5903)
koukaku_kidoutai_sac_2nd_tv_12_hideo_summon_terrorist=Trim(koukaku_kidoutai_sac_2nd_tv_12,15372,15570)
koukaku_kidoutai_sac_2nd_tv_12_terrorist_suicide=Trim(koukaku_kidoutai_sac_2nd_tv_12,31752,31911) #

koukaku_kidoutai_sac_2nd_tv_13_terrorist_suicide_01=Trim(koukaku_kidoutai_sac_2nd_tv_13,3469,3556)
koukaku_kidoutai_sac_2nd_tv_13_terrorist_suicide_02=Trim(koukaku_kidoutai_sac_2nd_tv_13,3763,3779)
koukaku_kidoutai_sac_2nd_tv_13_terrorist_suicide_03=Trim(koukaku_kidoutai_sac_2nd_tv_13,3877,4017)
koukaku_kidoutai_sac_2nd_tv_13_terrorist_suicide_04=Trim(koukaku_kidoutai_sac_2nd_tv_13,8004,8171)
koukaku_kidoutai_sac_2nd_tv_13_kaori_change_gitai=Trim(koukaku_kidoutai_sac_2nd_tv_13,24846,25181) #
koukaku_kidoutai_sac_2nd_tv_13_paz_vs_kaori=Trim(koukaku_kidoutai_sac_2nd_tv_13,30427,30643) #

koukaku_kidoutai_sac_2nd_tv_14_saitou_vs_motoko_01=Trim(koukaku_kidoutai_sac_2nd_tv_14,26444,26537)
koukaku_kidoutai_sac_2nd_tv_14_saitou_vs_motoko_02=Trim(koukaku_kidoutai_sac_2nd_tv_14,27593,27723) #

koukaku_kidoutai_sac_2nd_tv_15_tachikoma_talking_on_network=Trim(koukaku_kidoutai_sac_2nd_tv_15,7713,7975)
koukaku_kidoutai_sac_2nd_tv_15_tachikoma_and_asuda=Trim(koukaku_kidoutai_sac_2nd_tv_15,32467,32609) #

koukaku_kidoutai_sac_2nd_tv_16_human_and_cyber=Trim(koukaku_kidoutai_sac_2nd_tv_16,9999,10489)
koukaku_kidoutai_sac_2nd_tv_16_section_9_meeting=Trim(koukaku_kidoutai_sac_2nd_tv_16,19443,20009)
koukaku_kidoutai_sac_2nd_tv_16_niihamasi=Trim(koukaku_kidoutai_sac_2nd_tv_16,32600,32682) #

koukaku_kidoutai_sac_2nd_tv_17_taiwan_01=Trim(koukaku_kidoutai_sac_2nd_tv_17,9838,9938) #
koukaku_kidoutai_sac_2nd_tv_17_taiwan_02=Trim(koukaku_kidoutai_sac_2nd_tv_17,10257,10316) #
koukaku_kidoutai_sac_2nd_tv_17_taiwan_03=Trim(koukaku_kidoutai_sac_2nd_tv_17,10813,11028) #
koukaku_kidoutai_sac_2nd_tv_17_taiwan_04_yuan_shan_hotel=Trim(koukaku_kidoutai_sac_2nd_tv_17,16471,16570)
koukaku_kidoutai_sac_2nd_tv_17_taiwan_05_to_cks_airport=Trim(koukaku_kidoutai_sac_2nd_tv_17,24226,24314)
koukaku_kidoutai_sac_2nd_tv_17_taiwan_06_cks_airport=Trim(koukaku_kidoutai_sac_2nd_tv_17,31713,31775)

koukaku_kidoutai_sac_2nd_tv_18_berlin_siegessaeule=Trim(koukaku_kidoutai_sac_2nd_tv_18,2873,3064) #
koukaku_kidoutai_sac_2nd_tv_18_church_01=Trim(koukaku_kidoutai_sac_2nd_tv_18,18190,18341)
koukaku_kidoutai_sac_2nd_tv_18_church_02=Trim(koukaku_kidoutai_sac_2nd_tv_18,19215,19294)
koukaku_kidoutai_sac_2nd_tv_18_church_03=Trim(koukaku_kidoutai_sac_2nd_tv_18,32673,32887)

koukaku_kidoutai_sac_2nd_tv_19_hack_hideo=Trim(koukaku_kidoutai_sac_2nd_tv_19,16469,16776) #
koukaku_kidoutai_sac_2nd_tv_19_motoko_hack=Trim(koukaku_kidoutai_sac_2nd_tv_19,19668,19752)

#koukaku_kidoutai_sac_2nd_tv_20_candy_girl=Trim(koukaku_kidoutai_sac_2nd_tv_20,18381,18427)
#koukaku_kidoutai_sac_2nd_tv_20_batou_target_hideo=Trim(koukaku_kidoutai_sac_2nd_tv_20,32289,32390)
#koukaku_kidoutai_sac_2nd_tv_20_batou_angry=Trim(koukaku_kidoutai_sac_2nd_tv_20,32953,33023)

#koukaku_kidoutai_sac_2nd_tv_21_batou_vs_hideo=Trim(koukaku_kidoutai_sac_2nd_tv_21,2897,2960)
#koukaku_kidoutai_sac_2nd_tv_21_section_9_retreat=Trim(koukaku_kidoutai_sac_2nd_tv_21,14867,14978)
#koukaku_kidoutai_sac_2nd_tv_21_section_9_is_bombed=Trim(koukaku_kidoutai_sac_2nd_tv_21,15734,15810)

#koukaku_kidoutai_sac_2nd_tv_22_kazundo_in_elevator=Trim(koukaku_kidoutai_sac_2nd_tv_22,14966,15283)

#koukaku_kidoutai_sac_2nd_tv_23_ship=Trim(koukaku_kidoutai_sac_2nd_tv_23,11868,11968)
#koukaku_kidoutai_sac_2nd_tv_23_airplane=Trim(koukaku_kidoutai_sac_2nd_tv_23,12326,12408)
#koukaku_kidoutai_sac_2nd_tv_23_hideo_as_crow=Trim(koukaku_kidoutai_sac_2nd_tv_23,25558,25917)

#koukaku_kidoutai_sac_2nd_tv_24_proto_seek=Trim(koukaku_kidoutai_sac_2nd_tv_24,25138,25325)
#koukaku_kidoutai_sac_2nd_tv_24_proto_is_hacked=Trim(koukaku_kidoutai_sac_2nd_tv_24,27735,27813)

#koukaku_kidoutai_sac_2nd_tv_25_dejima_is_under_attack=Trim(koukaku_kidoutai_sac_2nd_tv_25,15296,15414)

koukaku_kidoutai_sac_2nd_tv_26_satellite=Trim(koukaku_kidoutai_sac_2nd_tv_26,14492,14574) #
koukaku_kidoutai_sac_2nd_tv_26_fuchikoma_in_temple=Trim(koukaku_kidoutai_sac_2nd_tv_26,32159,32266)

######## Pre Combine ########

koukaku_kidoutai_sac_2nd_op_bs_03_last_non_black_frame=1057
koukaku_kidoutai_sac_2nd_op_bs_03_extend=Loop(koukaku_kidoutai_sac_2nd_op_bs_03,670,koukaku_kidoutai_sac_2nd_op_bs_03_last_non_black_frame,koukaku_kidoutai_sac_2nd_op_bs_03_last_non_black_frame)

koukaku_kidoutai_sac_2nd_tv_05_motoko_vs_hideo=TRIM_FIRST_CLIP(koukaku_kidoutai_sac_2nd_tv_05_motoko_vs_hideo_01,157-Framecount(koukaku_kidoutai_sac_2nd_tv_05_motoko_vs_hideo_02))+koukaku_kidoutai_sac_2nd_tv_05_motoko_vs_hideo_02
koukaku_kidoutai_sac_2nd_tv_11_motoko_jump_and_roll=TRIM_FIRST_CLIP(koukaku_kidoutai_sac_2nd_tv_11_motoko_jump,78)+Trim(koukaku_kidoutai_sac_2nd_tv_11_motoko_roll,34,-79)
koukaku_kidoutai_sac_2nd_tv_17_taiwan=koukaku_kidoutai_sac_2nd_tv_17_taiwan_01+koukaku_kidoutai_sac_2nd_tv_17_taiwan_02+koukaku_kidoutai_sac_2nd_tv_17_taiwan_03

fade_length=12

t50_section01_length=120
t50=DOUBLE_FADE_WITH_BRIGHTNESS_OFFSET_RGB24(TRIM_LAST_CLIP(koukaku_kidoutai_sac_2nd_tv_14_saitou_vs_motoko_02,t50_section01_length),TRIM_MIDDLE_CLIP(koukaku_kidoutai_sac_2nd_tv_15_tachikoma_and_asuda,145-t50_section01_length),fade_length,fade_length)

koukaku_kidoutai_sac_2nd_tv_16_niihamasi_trimmed=TRIM_MIDDLE_CLIP(koukaku_kidoutai_sac_2nd_tv_16_niihamasi,79)
koukaku_kidoutai_sac_2nd_tv_16_niihamasi_trimmed_last_frame=Framecount(koukaku_kidoutai_sac_2nd_tv_16_niihamasi_trimmed)-1
koukaku_kidoutai_sac_2nd_tv_16_niihamasi_trimmed_expression="Pow(1.0-(Float(n)/Float(koukaku_kidoutai_sac_2nd_tv_16_niihamasi_trimmed_last_frame)),3.0)"
koukaku_kidoutai_sac_2nd_tv_16_niihamasi_zoomed=ConvertToYV12(Zoom(ConvertToRGB32(koukaku_kidoutai_sac_2nd_tv_16_niihamasi_trimmed), \
	factor="1.0+(6.0*"+koukaku_kidoutai_sac_2nd_tv_16_niihamasi_trimmed_expression+")", \
	angle="45.0*"+koukaku_kidoutai_sac_2nd_tv_16_niihamasi_trimmed_expression))

mask_base=BlankClip(koukaku_kidoutai_sac_2nd_tv_13_kaori_change_gitai,color=color_black)
mask_with_parameter=ScriptClip(mask_base,"Overlay(BlankClip(koukaku_kidoutai_sac_2nd_tv_13_kaori_change_gitai,width=128,height=128,color=color_white),x=mask_x,y=mask_y,opacity=mask_opacity)")
mask_with_parameter=FrameEvaluate(mask_with_parameter,"mask_x=Round(Spline(current_frame,0,1150,200,1150,227,1150,254,1290,Framecount()-1,1290,cubic=false))")
mask_with_parameter=FrameEvaluate(mask_with_parameter,"mask_y=Round(Spline(current_frame,0,680,200,680,227,680,254,660,Framecount()-1,660,cubic=false))")
mask=FrameEvaluate(mask_with_parameter,"mask_opacity=current_frame>=200?1.0:0.0")
koukaku_kidoutai_sac_2nd_tv_13_kaori_change_gitai_mosaic=MOSAIC_MASK(koukaku_kidoutai_sac_2nd_tv_13_kaori_change_gitai,mask,24.0)

######## Combine ########

# koukaku_kidoutai_sac_2nd_op_bs_01_01 -38
# koukaku_kidoutai_sac_2nd_op_bs_01_02 634
# koukaku_kidoutai_sac_2nd_op_bs_02 650
# koukaku_kidoutai_sac_2nd_op_bs_03 6155
# koukaku_kidoutai_sac_2nd_op_temp_01_02 2604
# koukaku_kidoutai_sac_2nd_op_temp_02 2620
# koukaku_kidoutai_sac_2nd_op_temp_03 3565

koukaku_kidoutai_sac_2nd_op_bs_t01=DOUBLE_FADE_WITH_BRIGHTNESS_OFFSET_RGB24(Trim(koukaku_kidoutai_sac_2nd_op_bs_01_01,38,0),FADE_OUT_WITH_BRIGHTNESS_OFFSET_RGB24(TRIM_FIRST_CLIP(koukaku_kidoutai_sac_2nd_tv_01_motoko_hack,172+158+143),fade_length*2),fade_length,fade_length)+koukaku_kidoutai_sac_2nd_op_bs_01_02
koukaku_kidoutai_sac_2nd_op_bs_t02=koukaku_kidoutai_sac_2nd_op_bs_02+TRIM_LAST_CLIP(koukaku_kidoutai_sac_2nd_tv_26_satellite,13)
koukaku_kidoutai_sac_2nd_op_bs_t03=koukaku_kidoutai_sac_2nd_tv_11_motoko_jump_and_roll+TRIM_MIDDLE_CLIP(koukaku_kidoutai_sac_2nd_tv_13_paz_vs_kaori,158) \
	+TRIM_LAST_CLIP(koukaku_kidoutai_sac_2nd_tv_06_ruriko_jump,158)+koukaku_kidoutai_sac_2nd_tv_05_motoko_vs_hideo+koukaku_kidoutai_sac_2nd_tv_16_niihamasi_zoomed
koukaku_kidoutai_sac_2nd_op_bs_t04=FADE_OUT_WITH_BRIGHTNESS_OFFSET_RGB24(TRIM_FIRST_CLIP(koukaku_kidoutai_sac_2nd_tv_17_taiwan,299),fade_length)+koukaku_kidoutai_sac_2nd_op_temp_01_02
koukaku_kidoutai_sac_2nd_op_bs_t05=koukaku_kidoutai_sac_2nd_op_temp_02+koukaku_kidoutai_sac_2nd_op_temp_03+TRIM_FIRST_CLIP(koukaku_kidoutai_sac_2nd_tv_08_tachikoma_jump,30)
koukaku_kidoutai_sac_2nd_op_bs_t06=TRIM_FIRST_CLIP(koukaku_kidoutai_sac_2nd_tv_07_helicopter_lift_off,157)+TRIM_FIRST_CLIP(koukaku_kidoutai_sac_2nd_tv_02_helicopter_cruise_02,158) \
	+TRIM_MIDDLE_CLIP(koukaku_kidoutai_sac_2nd_tv_04_motoko_watch_broken_helicopter,157)+TRIM_LAST_CLIP(koukaku_kidoutai_sac_2nd_tv_03_motoko_steal_something,158) \
	+Trim(koukaku_kidoutai_sac_2nd_tv_13_kaori_change_gitai_mosaic,105,-157)+TRIM_MIDDLE_CLIP(koukaku_kidoutai_sac_2nd_tv_10_togusa_family,158)
koukaku_kidoutai_sac_2nd_op_bs_t07=TRIM_FIRST_CLIP(koukaku_kidoutai_sac_2nd_tv_19_hack_hideo,157)+TRIM_MIDDLE_CLIP(koukaku_kidoutai_sac_2nd_tv_09_motoko_hack_kazundo_01,158)
koukaku_kidoutai_sac_2nd_op_bs_t08=TRIM_MIDDLE_CLIP(koukaku_kidoutai_sac_2nd_tv_18_berlin_siegessaeule,158)+Trim(koukaku_kidoutai_sac_2nd_tv_11_motoko_watch_street,60,-158) \
	+TRIM_FIRST_CLIP(koukaku_kidoutai_sac_2nd_tv_12_terrorist_suicide,158)+t50
koukaku_kidoutai_sac_2nd_op_bs_t09=koukaku_kidoutai_sac_2nd_op_bs_03_extend

koukaku_kidoutai_sac_2nd_op_bs_mute=koukaku_kidoutai_sac_2nd_op_bs_t01+koukaku_kidoutai_sac_2nd_op_bs_t02+koukaku_kidoutai_sac_2nd_op_bs_t03+koukaku_kidoutai_sac_2nd_op_bs_t04+koukaku_kidoutai_sac_2nd_op_bs_t05 \
	+DOUBLE_FADE_WITH_BRIGHTNESS_OFFSET_RGB24(DOUBLE_FADE_WITH_BRIGHTNESS_OFFSET_RGB24(koukaku_kidoutai_sac_2nd_op_bs_t06,koukaku_kidoutai_sac_2nd_op_bs_t07,fade_length,fade_length),koukaku_kidoutai_sac_2nd_op_bs_t08,fade_length,fade_length)+koukaku_kidoutai_sac_2nd_op_bs_t09

koukaku_kidoutai_sac_2nd_op_bs_mute

### export clip: koukaku_kidoutai_sac_2nd_op_bs_mute

### prefetch: 5,2

### ###

######## Subtitle ########

### inherit start ###

#global subtitle_heavy_halo_width=1
global subtitle_clip_width=1920
global subtitle_clip_height=1080

global subtitle_x=50*2.25
global subtitle_y=400*2.25
global subtitle_front_fade_count=18
global subtitle_rear_fade_count=18
global subtitle_font="MS Gothic"
global subtitle_effects="bi"
global subtitle_size=24*2.25
global subtitle_text_color=color_white
global subtitle_halo_color=OVERWRITE_SUBTITLE_COLOR_ALPHA(color_lime,$C0)
global subtitle_random_char_func="RANDOM_ASCII_CHAR"

function SUBTITLE_FX_1(clip clip,string text,float x,float y,int start_frame,int end_frame,bool "is_title"){
	is_title=Default(is_title,false)

	front_fade_count=is_title?title_subtitle_front_fade_count:subtitle_front_fade_count
	rear_fade_count=is_title?title_subtitle_rear_fade_count:subtitle_rear_fade_count
	size=is_title?title_subtitle_size:subtitle_size
	halo_color=is_title?OVERWRITE_SUBTITLE_COLOR_ALPHA(subtitle_halo_color,$FF):subtitle_halo_color
	random_char_func=is_title?title_subtitle_random_char_func:subtitle_random_char_func

	return SUBTITLE_FX_RANDOM_STRING(clip,text,Round(x),Round(y),start_frame,end_frame,front_fade_count,rear_fade_count,subtitle_font,subtitle_effects,Round(size),subtitle_text_color,halo_color,"ex_thick",random_char_func)
}

global second_subtitle_front_fade_count=24
global second_subtitle_rear_fade_count=24

function SUBTITLE_FX_2(clip clip,string text,float x,float y,int start_frame,int end_frame){
	return SUBTITLE_FX_FLY_IN_FLY_OUT(clip,text,Round(x),Round(y),start_frame,end_frame,second_subtitle_front_fade_count,second_subtitle_rear_fade_count,subtitle_font,subtitle_effects,Round(subtitle_size),subtitle_text_color,subtitle_halo_color,"ex_thick")
}

### inherit end ###

global title_subtitle_front_fade_count=24
global title_subtitle_rear_fade_count=24
global title_subtitle_size=subtitle_size*2
global title_subtitle_random_char_func="RANDOM_JIS_CHAR"

title_01_01="rise//origa             "
title_01_02="    - by fielia@AVISynth"
title_02="íÜâõìÆâÊïî"
title_01_01_subtitle_x=(subtitle_clip_width/2)-(title_subtitle_size*StrLen(title_01_01)/4)
title_01_02_subtitle_x=(subtitle_clip_width/2)-(title_subtitle_size*StrLen(title_01_02)/4)
title_02_subtitle_x=(subtitle_clip_width/2)-(title_subtitle_size*StrLen(title_02)/4)
title_subtitle_y=subtitle_clip_height/2

SUBTITLE_FX_1(title_01_01,title_01_01_subtitle_x,title_subtitle_y-title_subtitle_size*2,7035,7509,true)
SUBTITLE_FX_1(title_01_02,title_01_02_subtitle_x,title_subtitle_y-title_subtitle_size*1,7035,7509,true)
SUBTITLE_FX_1(title_02,title_02_subtitle_x,title_subtitle_y+title_subtitle_size*2,7193,7509,true)

### inherit start ###

function REPEAT_SUBTITLE(clip clip,int start_frame){
	clip=SUBTITLE_FX_1(clip,"Save your tears",subtitle_x,subtitle_y,start_frame-5,start_frame+35)
	clip=SUBTITLE_FX_1(clip,"for the day",subtitle_x,subtitle_y,start_frame+36,start_frame+67)
	clip=SUBTITLE_FX_1(clip,"when our pain is far behind",subtitle_x,subtitle_y,start_frame+73,start_frame+146)
	clip=SUBTITLE_FX_1(clip,"on your feet",subtitle_x,subtitle_y,start_frame+149,start_frame+187)
	clip=SUBTITLE_FX_1(clip,"come with me",subtitle_x,subtitle_y,start_frame+189,start_frame+227)
	clip=SUBTITLE_FX_1(clip,"we are soldiers stand or die",subtitle_x,subtitle_y,start_frame+229,start_frame+308)

	clip=SUBTITLE_FX_1(clip,"Save your fears",subtitle_x,subtitle_y,start_frame+311,start_frame+346)
	clip=SUBTITLE_FX_1(clip,"take your place",subtitle_x,subtitle_y,start_frame+347,start_frame+385)
	clip=SUBTITLE_FX_1(clip,"save them for the judgement day",subtitle_x,subtitle_y,start_frame+386,start_frame+464)
	clip=SUBTITLE_FX_1(clip,"fast and free",subtitle_x,subtitle_y,start_frame+465,start_frame+504)
	clip=SUBTITLE_FX_1(clip,"follow me",subtitle_x,subtitle_y,start_frame+506,start_frame+543)
	clip=SUBTITLE_FX_1(clip,"time to make the sacrifice",subtitle_x,subtitle_y,start_frame+545,start_frame+656)
	clip=SUBTITLE_FX_1(clip,"we rise or fall",subtitle_x,subtitle_y,start_frame+657,start_frame+821)
	return clip
}

### inherit end ###

SUBTITLE_FX_1("I'm a soldier, ÑxÑ~ÑpÑâÑyÑÑ Ñë",subtitle_x,subtitle_y,644,715)
SUBTITLE_FX_2("               znachit ya",subtitle_x,subtitle_y-subtitle_size,644,715)
SUBTITLE_FX_1("ÑI ÑÄÑÑÑrÑuÑÑÑâÑyÑ{ Ñy ÑÉÑÖÑtÑéÑë",subtitle_x,subtitle_y,723,794)
SUBTITLE_FX_2("I otvyetchik i sud'ya",subtitle_x,subtitle_y-subtitle_size*2,723,794)
SUBTITLE_FX_1("Ñ` ÑÉÑÑÑÄÑê Ñ~Ñp ÑtÑrÑÖÑá Ñ{ÑÄÑ~ÑàÑpÑá ÑÄÑsÑ~Ñë",subtitle_x,subtitle_y,802,926)
SUBTITLE_FX_2("Ya stoyu na dvukh kontsakh ognya",subtitle_x,subtitle_y-subtitle_size,802,926)
SUBTITLE_FX_1("ÑOÑsÑyÑqÑpÑë ÑrÑyÑÇÑpÑwÑy,|ÑÄÑqÑsÑÄÑ~ÑëÑë ÑÉÑ}ÑuÑÇÑÑÑé Ñy ÑwÑyÑxÑ~Ñé",subtitle_x,subtitle_y-subtitle_size,960,1110)
SUBTITLE_FX_2("Ogibaya virazhi,|obgonyaya smyert' i zhizn'",subtitle_x,subtitle_y-subtitle_size*3,960,1110)
SUBTITLE_FX_1("Ñ` ÑqÑuÑsÑÖ ÑÉÑÇÑpÑxÑyÑÑÑéÑÉÑë ÑÉ ÑÑÑuÑ~ÑéÑê Ñ|ÑwÑy",subtitle_x,subtitle_y,1118,1242)
SUBTITLE_FX_2("Ya byegu srazit'sya s tyen'yu lzhi",subtitle_x,subtitle_y-subtitle_size,1118,1242)
SUBTITLE_FX_1("ÑRÑ{ÑÄÑ|ÑéÑ{ÑÄ Ñq Ñ~ÑyÑÑÑuÑz Ñ~Ñu ÑÅÑ|ÑvÑ| ÑÄÑqÑ}ÑpÑ~",subtitle_x,subtitle_y,1253,1400)
SUBTITLE_FX_2("Skol'ko b nityey nye plyol obman",subtitle_x,subtitle_y-subtitle_size*2,1253,1400)
SUBTITLE_FX_1("ÑPÑÄÑ{ÑpÑwÑuÑÑ Ñ|ÑyÑ{ ÑÉÑrÑuÑÑÑp ÑyÑÉÑÑÑyÑ~Ñp",subtitle_x,subtitle_y,1413,1597)
SUBTITLE_FX_2("Pokazhyet lik svyeta istina",subtitle_x,subtitle_y-subtitle_size,1413,1597)

REPEAT_SUBTITLE(1613)

SUBTITLE_FX_1("I'm a soldier, born to stand",subtitle_x,subtitle_y,2615,2686)
SUBTITLE_FX_1("in this waking hell I am",subtitle_x,subtitle_y,2694,2765)
SUBTITLE_FX_1("witnessing more than I can compute",subtitle_x,subtitle_y,2773,2890)

SUBTITLE_FX_1("pray myself we don't forget",subtitle_x,subtitle_y,2930,3001)
SUBTITLE_FX_1("lies, betrayed and the oppressed",subtitle_x,subtitle_y,3009,3080)
SUBTITLE_FX_1("please give me the strength to be the truth",subtitle_x,subtitle_y,3088,3216)

SUBTITLE_FX_1("people facing the fire together",subtitle_x,subtitle_y,3226,3378)
SUBTITLE_FX_1("if we don't, we'll lose all we have found",subtitle_x,subtitle_y,3383,3557)

REPEAT_SUBTITLE(3584)

### pass clip: koukaku_kidoutai_sac_2nd_op_bs_mute

### prefetch: 5,2

### ###

SUBTITLE_FX_1("ÑHÑp Ñ}ÑuÑâÑÑÑÄÑê Ñ~ÑpÑ{ÑÇÑpÑz ÑÅÑÇÑÄÑÅÑpÑÉÑÑÑy",subtitle_x,subtitle_y,5194,5353)
SUBTITLE_FX_2("Za myechtoyu nakray propasti",subtitle_x,subtitle_y-subtitle_size,5194,5353)
SUBTITLE_FX_1("ÑLÑyÑäÑé ÑÑÑÄÑ|ÑéÑ{ÑÄ ÑÑÑpÑ{ Ñ}ÑÄÑwÑ~ÑÄ Ñ}ÑyÑÇ ÑÉÑÅÑpÑÉÑÑÑy",subtitle_x,subtitle_y,5355,5541)
SUBTITLE_FX_2("Lish' tol'ko tak mozhno mir spasti",subtitle_x,subtitle_y-subtitle_size*2,5355,5541)

SUBTITLE_FX_1("ÑSÑç Ñ~Ñu ÑÅÑ|ÑpÑâÑé,",subtitle_x,subtitle_y,5550,5586)
SUBTITLE_FX_2("Ty nye plach',",subtitle_x,subtitle_y-subtitle_size,5550,5586)
SUBTITLE_FX_1("ÑRÑ|ÑvÑxÑç ÑÉÑÅÑÇÑëÑâÑé,",subtitle_x,subtitle_y,5587,5622)
SUBTITLE_FX_2("Slyozy spryach',",subtitle_x,subtitle_y-subtitle_size*2,5587,5622)
SUBTITLE_FX_1("ÑBÑuÑtÑé Ñ~ÑpÑÉÑÑÑpÑ~ÑuÑÑ Ñ~ÑÄÑrÑçÑz ÑtÑuÑ~Ñé",subtitle_x,subtitle_y,5623,5699)
SUBTITLE_FX_2("Ved' nastanyet novyy den'",subtitle_x,subtitle_y-subtitle_size,5623,5699)
SUBTITLE_FX_1("ÑSÑrÑÄÑz ÑÄÑsÑÄÑ~Ñé",subtitle_x,subtitle_y,5703,5737)
SUBTITLE_FX_2("Tvoy ogon'",subtitle_x,subtitle_y-subtitle_size*2,5703,5737)
SUBTITLE_FX_1("ÑRÑÄÑsÑÇÑuÑrÑpÑÑÑé",subtitle_x,subtitle_y,5742,5780)
SUBTITLE_FX_2("Sogryevat'",subtitle_x,subtitle_y-subtitle_size,5742,5780)
SUBTITLE_FX_1("ÑAÑÖÑtÑuÑÑ ÑÑÑçÑÉÑëÑâÑy ÑÉÑuÑÇÑtÑuÑà",subtitle_x,subtitle_y,5781,5863)
SUBTITLE_FX_2("Budyet tysyachi syerdets",subtitle_x,subtitle_y-subtitle_size*2,5781,5863)
SUBTITLE_FX_1("Ñ@ ÑÉÑuÑzÑâÑpÑÉ ÑÅÑÄÑtÑ~ÑyÑ}ÑyÑÉÑé",subtitle_x,subtitle_y,5866,5937)
SUBTITLE_FX_2("A syeychas podnimis'",subtitle_x,subtitle_y-subtitle_size,5866,5937)
SUBTITLE_FX_1("ÑRÑÅÑÇÑëÑâÑé ÑÅÑÄÑtÑpÑ|ÑéÑäÑu ÑqÑÄÑ|Ñé Ñy ÑÉÑÑÑÇÑpÑá",subtitle_x,subtitle_y,5938,6018)
SUBTITLE_FX_2("Spryach' podal'shye bol' i strakh",subtitle_x,subtitle_y-subtitle_size*2,5938,6018)
SUBTITLE_FX_1("ÑPÑÄÑqÑuÑtÑyÑÑ ÑÑÑÄÑÑ, Ñ{ÑÑÑÄ ÑÅÑÇÑpÑr",subtitle_x,subtitle_y,6019,6096)
SUBTITLE_FX_2("Pobyedit tot, kto prav",subtitle_x,subtitle_y-subtitle_size,6019,6096)
SUBTITLE_FX_1("ÑHÑ~ÑpÑz, ÑâÑÑÑÄ ÑrÑÉÑv Ñr ÑÑÑrÑÄÑyÑá ÑÇÑÖÑ{ÑpÑá",subtitle_x,subtitle_y,6097,6176)
SUBTITLE_FX_2("Znay, chto vsyo v tvoikh rukakh",subtitle_x,subtitle_y-subtitle_size*2,6097,6176)

REPEAT_SUBTITLE(6185)

######## Thumbnail ########

is_thumbnail=false

is_thumbnail?koukaku_kidoutai_sac_2nd_op_bs_mute:last

######## Music ########

bgm_48khz=SSRC(WAVSource("src\koukaku_kidoutai_sac-ost2-02.wav"),48000)
AudioDub(bgm_48khz)



thumbnail=Trim(6399,-24*5)
is_thumbnail?thumbnail:last

""")

######## Post Processing ########

ConvertToYV12()
#ConvertToYUY2()
#ConvertToRGB24()

TCPServer()
