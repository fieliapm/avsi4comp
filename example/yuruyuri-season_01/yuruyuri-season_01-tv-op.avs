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



Import("..\..\avsi4comp\avsi4comp.avsi")

######## BD (1080P) ########

yuruyuri_season_01_tv_clean_op=FFMS2_VIDEO_SOURCE("src\anime\bd\special\yuruyuri-season_01-bd-vol01-op.mp4")

yuruyuri_season_01_tv_clean_op_part01=Trim(yuruyuri_season_01_tv_clean_op,0,257)
yuruyuri_season_01_tv_clean_op_part02_akkariin_src=Trim(yuruyuri_season_01_tv_clean_op,258,275)
yuruyuri_season_01_tv_clean_op_part03=Trim(yuruyuri_season_01_tv_clean_op,276,436)
yuruyuri_season_01_tv_clean_op_part04_akkariin_src=Trim(yuruyuri_season_01_tv_clean_op,437,465)
yuruyuri_season_01_tv_clean_op_part05=Trim(yuruyuri_season_01_tv_clean_op,466,663)
yuruyuri_season_01_tv_clean_op_part06_akkariin_src=Trim(yuruyuri_season_01_tv_clean_op,664,672)
yuruyuri_season_01_tv_clean_op_part07=Trim(yuruyuri_season_01_tv_clean_op,673,696)
yuruyuri_season_01_tv_clean_op_part08_akkariin_src=Trim(yuruyuri_season_01_tv_clean_op,697,814)
yuruyuri_season_01_tv_clean_op_part09=Trim(yuruyuri_season_01_tv_clean_op,815,1848)
yuruyuri_season_01_tv_clean_op_part10=Trim(yuruyuri_season_01_tv_clean_op,1849,0)



yuruyuri_season_01_tv_01=FFMS2_VIDEO_SOURCE("src\anime\bd\yuruyuri-season_01-bd-01.mp4")
yuruyuri_season_01_tv_02=FFMS2_VIDEO_SOURCE("src\anime\bd\yuruyuri-season_01-bd-02.mp4")
yuruyuri_season_01_tv_03=FFMS2_VIDEO_SOURCE("src\anime\bd\yuruyuri-season_01-bd-03.mp4")
yuruyuri_season_01_tv_04=FFMS2_VIDEO_SOURCE("src\anime\bd\yuruyuri-season_01-bd-04.mp4")
yuruyuri_season_01_tv_05=FFMS2_VIDEO_SOURCE("src\anime\bd\yuruyuri-season_01-bd-05.mp4")
yuruyuri_season_01_tv_06=FFMS2_VIDEO_SOURCE("src\anime\bd\yuruyuri-season_01-bd-06.mp4")
yuruyuri_season_01_tv_07=FFMS2_VIDEO_SOURCE("src\anime\bd\yuruyuri-season_01-bd-07.mp4")
yuruyuri_season_01_tv_08=FFMS2_VIDEO_SOURCE("src\anime\bd\yuruyuri-season_01-bd-08.mp4")
yuruyuri_season_01_tv_09=FFMS2_VIDEO_SOURCE("src\anime\bd\yuruyuri-season_01-bd-09.mp4")
yuruyuri_season_01_tv_10=FFMS2_VIDEO_SOURCE("src\anime\bd\yuruyuri-season_01-bd-10.mp4")
yuruyuri_season_01_tv_11=FFMS2_VIDEO_SOURCE("src\anime\bd\yuruyuri-season_01-bd-11.mp4")
yuruyuri_season_01_tv_12=FFMS2_VIDEO_SOURCE("src\anime\bd\yuruyuri-season_01-bd-12.mp4")

yuruyuri_season_01_tv_01_title_call=Trim(yuruyuri_season_01_tv_01,6,214)
yuruyuri_season_01_tv_01_akari_weak_sense_of_presence=Trim(yuruyuri_season_01_tv_01,31675,31891)

yuruyuri_season_01_tv_01_kyouko_touch_panty=Trim(yuruyuri_season_01_tv_01,5651,5789)
yuruyuri_season_01_tv_01_akari_moe=Trim(yuruyuri_season_01_tv_01,7923,8114)
yuruyuri_season_01_tv_01_club_entrance=Trim(yuruyuri_season_01_tv_01,8793,9082)
yuruyuri_season_01_tv_01_kyouko_act_as_mirakurun=Trim(yuruyuri_season_01_tv_01,15253,15492)

yuruyuri_season_01_tv_02_kyouko_turn=Trim(yuruyuri_season_01_tv_02,5747,5888)
yuruyuri_season_01_tv_02_himawari_hold_sakurako=Trim(yuruyuri_season_01_tv_02,13327,13524)
yuruyuri_season_01_tv_02_sakurako_beat_himawari_breast=Trim(yuruyuri_season_01_tv_02,23641,23711)

yuruyuri_season_01_tv_03_beautiful_chinatsu=Trim(yuruyuri_season_01_tv_03,6056,6161)
yuruyuri_season_01_tv_03_kyouko_and_yui_sleep=Trim(yuruyuri_season_01_tv_03,28637,29004)

yuruyuri_season_01_tv_04_kyouko_defeat_ayano=Trim(yuruyuri_season_01_tv_04,914,1033)
yuruyuri_season_01_tv_04_kyouko_draw_heart=Trim(yuruyuri_season_01_tv_04,25261,25368)
yuruyuri_season_01_tv_04_ayako_draw_star=Trim(yuruyuri_season_01_tv_04,25369,25512)
#yuruyuri_season_01_tv_04_chitose_draw_words_01=Trim(yuruyuri_season_01_tv_04,26031,26084)
yuruyuri_season_01_tv_04_chitose_draw_words_02=Trim(yuruyuri_season_01_tv_04,26277,26456)
yuruyuri_season_01_tv_04_chinatsu_draw_words=Trim(yuruyuri_season_01_tv_04,26457,26534)

yuruyuri_season_01_tv_05_mirakurun_vs_rival=Trim(yuruyuri_season_01_tv_05,6681,7284)
yuruyuri_season_01_tv_05_kyouko_cosplay=Trim(yuruyuri_season_01_tv_05,10469,10684)
yuruyuri_season_01_tv_05_akari_missile=Trim(yuruyuri_season_01_tv_05,21079,21195)
yuruyuri_season_01_tv_05_akkariin=Trim(yuruyuri_season_01_tv_05,21665,21890)
yuruyuri_season_01_tv_05_chinatsu_kiss_akari=Trim(yuruyuri_season_01_tv_05,30678,30791)
yuruyuri_season_01_tv_05_broken_akari_01=Trim(yuruyuri_season_01_tv_05,31698,31786)
yuruyuri_season_01_tv_05_broken_akari_02=Trim(yuruyuri_season_01_tv_05,31787,31888)

yuruyuri_season_01_tv_06_mirakurun_open_leg=Trim(yuruyuri_season_01_tv_06,18319,18471)
yuruyuri_season_01_tv_06_mari_take_mirakurun=Trim(yuruyuri_season_01_tv_06,23620,23692)
yuruyuri_season_01_tv_06_chinatsu_and_mari_hug=Trim(yuruyuri_season_01_tv_06,28889,29119)

yuruyuri_season_01_tv_07_kyouko_and_chinatsu_walking=Trim(yuruyuri_season_01_tv_07,17862,18023)
yuruyuri_season_01_tv_07_sakurako_and_himawari_eating=Trim(yuruyuri_season_01_tv_07,21196,21686)
yuruyuri_season_01_tv_07_akari_new_year=Trim(yuruyuri_season_01_tv_07,24550,24831)

yuruyuri_season_01_tv_08_kyouko_samurai_hair=Trim(yuruyuri_season_01_tv_08,15074,15253)
yuruyuri_season_01_tv_08_chitose_and_chitsuru_dry_hair=Trim(yuruyuri_season_01_tv_08,28638,28799)

yuruyuri_season_01_tv_09_chinatsu_and_ghost=Trim(yuruyuri_season_01_tv_09,8124,8252)
#yuruyuri_season_01_tv_09_chinatsu_sleep_on_yui_leg_01=Trim(yuruyuri_season_01_tv_09,16244,16295)
yuruyuri_season_01_tv_09_chinatsu_sleep_on_yui_leg_02=Trim(yuruyuri_season_01_tv_09,16296,16405)
yuruyuri_season_01_tv_09_nana_handsome=Trim(yuruyuri_season_01_tv_09,20714,20881)
yuruyuri_season_01_tv_09_rise_moe=Trim(yuruyuri_season_01_tv_09,25866,26029)

yuruyuri_season_01_tv_10_kyouko_throw_pillow=Trim(yuruyuri_season_01_tv_10,29094,29177)
yuruyuri_season_01_tv_10_2nd_grade_classmates=Trim(yuruyuri_season_01_tv_10,31353,31436)

yuruyuri_season_01_tv_11_kyouko_fall_off=Trim(yuruyuri_season_01_tv_11,16817,16894)
yuruyuri_season_01_tv_11_students_union=Trim(yuruyuri_season_01_tv_11,24180,24260)

yuruyuri_season_01_tv_12_dog_akari=Trim(yuruyuri_season_01_tv_12,7129,7291)
yuruyuri_season_01_tv_12_chinatsu_cosplay_mirakurun=Trim(yuruyuri_season_01_tv_12,13479,13750)
yuruyuri_season_01_tv_12_himawari_cosplay_rival=Trim(yuruyuri_season_01_tv_12,13896,14021)
yuruyuri_season_01_tv_12_kyouko_and_mirakurun_chinatsu_hug=Trim(yuruyuri_season_01_tv_12,14659,14784)
yuruyuri_season_01_tv_12_kyouko_dempsey_roll=Trim(yuruyuri_season_01_tv_12,15084,15119)
yuruyuri_season_01_tv_12_akari_rolling=Trim(yuruyuri_season_01_tv_12,19641,19736)
yuruyuri_season_01_tv_12_bloody_chitose=Trim(yuruyuri_season_01_tv_12,28785,28852)

######## Pre Combine (1080P) ########

#### Title Call ####

func="ColorYUV(off_u=-32.0*_parameter,cont_u=-256.0*_parameter,off_v=32.0*_parameter,cont_v=-256.0*_parameter)"

disappear_interval=80
yuruyuri_season_01_tv_01_title_call_static_mute=KillAudio(Loop(Trim(yuruyuri_season_01_tv_01_title_call,95,95),Framecount(yuruyuri_season_01_tv_01_akari_weak_sense_of_presence)))

yuruyuri_season_01_tv_01_title_call_akari_disappear_mute=Dissolve(KillAudio(yuruyuri_season_01_tv_01_title_call),TRIM_FIRST_CLIP(yuruyuri_season_01_tv_01_title_call_static_mute,disappear_interval),disappear_interval)
yuruyuri_season_01_tv_01_title_call_akari_disappear=AudioDub(yuruyuri_season_01_tv_01_title_call_akari_disappear_mute,KillVideo(yuruyuri_season_01_tv_01_title_call))

yuruyuri_season_01_tv_01_title_call_akari_cry=AudioDub(yuruyuri_season_01_tv_01_title_call_static_mute,KillVideo(yuruyuri_season_01_tv_01_akari_weak_sense_of_presence))
yuruyuri_season_01_tv_01_title_call_akari_cry_containing_parameter=ScriptClip(yuruyuri_season_01_tv_01_title_call_akari_cry,func)
yuruyuri_season_01_tv_01_title_call_akari_cry=FrameEvaluate(yuruyuri_season_01_tv_01_title_call_akari_cry_containing_parameter,"_parameter=Spline(current_frame,179,0.0,180,0.0,195,1.0,196,1.0,false)") 

yuruyuri_season_01_tv_01_title_call_mtv_version=yuruyuri_season_01_tv_01_title_call_akari_disappear+yuruyuri_season_01_tv_01_title_call_akari_cry

yuruyuri_season_01_tv_01_title_call_mtv_version=Normalize(yuruyuri_season_01_tv_01_title_call_mtv_version)

#### akkariin in part02 ####

yuruyuri_season_01_tv_clean_op_part02_block_width=Width(yuruyuri_season_01_tv_clean_op_part02_akkariin_src)/8
yuruyuri_season_01_tv_clean_op_part02_block_height=Height(yuruyuri_season_01_tv_clean_op_part02_akkariin_src)
yuruyuri_season_01_tv_clean_op_part02_block07=Crop(yuruyuri_season_01_tv_clean_op_part02_akkariin_src,yuruyuri_season_01_tv_clean_op_part02_block_width*6,0,yuruyuri_season_01_tv_clean_op_part02_block_width,yuruyuri_season_01_tv_clean_op_part02_block_height)
yuruyuri_season_01_tv_clean_op_part02_block08=Crop(yuruyuri_season_01_tv_clean_op_part02_akkariin_src,yuruyuri_season_01_tv_clean_op_part02_block_width*7,0,yuruyuri_season_01_tv_clean_op_part02_block_width,yuruyuri_season_01_tv_clean_op_part02_block_height)
yuruyuri_season_01_tv_clean_op_part02_akkariin=StackHorizontal(FlipHorizontal(yuruyuri_season_01_tv_clean_op_part02_block08),yuruyuri_season_01_tv_clean_op_part02_block07,yuruyuri_season_01_tv_clean_op_part02_block07,yuruyuri_season_01_tv_clean_op_part02_block07,yuruyuri_season_01_tv_clean_op_part02_block07,yuruyuri_season_01_tv_clean_op_part02_block07,yuruyuri_season_01_tv_clean_op_part02_block07,yuruyuri_season_01_tv_clean_op_part02_block08)

#### akkariin in part04 ####

yuruyuri_season_01_tv_clean_op_part04_loop_frame=4
yuruyuri_season_01_tv_clean_op_part04_clip=Trim(yuruyuri_season_01_tv_clean_op_part04_akkariin_src,0,yuruyuri_season_01_tv_clean_op_part04_loop_frame)
yuruyuri_season_01_tv_clean_op_part04_clip_extend=Loop(yuruyuri_season_01_tv_clean_op_part04_clip,Framecount(yuruyuri_season_01_tv_clean_op_part04_akkariin_src)-(Framecount(yuruyuri_season_01_tv_clean_op_part04_clip)*2)+1,yuruyuri_season_01_tv_clean_op_part04_loop_frame,yuruyuri_season_01_tv_clean_op_part04_loop_frame)
yuruyuri_season_01_tv_clean_op_part04_akkariin=yuruyuri_season_01_tv_clean_op_part04_clip_extend+Reverse(FlipVertical(yuruyuri_season_01_tv_clean_op_part04_clip))

#### akkariin in part06 ####

yuruyuri_season_01_tv_clean_op_part06_block_width=Width(yuruyuri_season_01_tv_clean_op_part06_akkariin_src)/5
yuruyuri_season_01_tv_clean_op_part06_block_height=Height(yuruyuri_season_01_tv_clean_op_part06_akkariin_src)
yuruyuri_season_01_tv_clean_op_part06_block01=Crop(yuruyuri_season_01_tv_clean_op_part06_akkariin_src,yuruyuri_season_01_tv_clean_op_part06_block_width*0,0,yuruyuri_season_01_tv_clean_op_part06_block_width,yuruyuri_season_01_tv_clean_op_part06_block_height)
yuruyuri_season_01_tv_clean_op_part06_block05=Crop(yuruyuri_season_01_tv_clean_op_part06_akkariin_src,yuruyuri_season_01_tv_clean_op_part06_block_width*4,0,yuruyuri_season_01_tv_clean_op_part06_block_width,yuruyuri_season_01_tv_clean_op_part06_block_height)
yuruyuri_season_01_tv_clean_op_part06_akkariin=StackHorizontal(yuruyuri_season_01_tv_clean_op_part06_block01,yuruyuri_season_01_tv_clean_op_part06_block01,yuruyuri_season_01_tv_clean_op_part06_block05,yuruyuri_season_01_tv_clean_op_part06_block05,yuruyuri_season_01_tv_clean_op_part06_block05)

#### akkariin in part08 ####

texture_loop=204
yuruyuri_season_01_tv_clean_op_part08_block_x=130
yuruyuri_season_01_tv_clean_op_part08_block_width=540
yuruyuri_season_01_tv_clean_op_part08_block_height=Height(yuruyuri_season_01_tv_clean_op_part08_akkariin_src)
yuruyuri_season_01_tv_clean_op_part08_block00=Crop(yuruyuri_season_01_tv_clean_op_part08_akkariin_src,yuruyuri_season_01_tv_clean_op_part08_block_x+(texture_loop*3),0,yuruyuri_season_01_tv_clean_op_part08_block_width,yuruyuri_season_01_tv_clean_op_part08_block_height)
yuruyuri_season_01_tv_clean_op_part08_akkariin=Overlay(yuruyuri_season_01_tv_clean_op_part08_akkariin_src,yuruyuri_season_01_tv_clean_op_part08_block00,x=yuruyuri_season_01_tv_clean_op_part08_block_x,y=0)

#### akkariin combine ####

yuruyuri_season_01_tv_clean_op_01=yuruyuri_season_01_tv_clean_op_part01+yuruyuri_season_01_tv_clean_op_part02_akkariin+yuruyuri_season_01_tv_clean_op_part03+yuruyuri_season_01_tv_clean_op_part04_akkariin+yuruyuri_season_01_tv_clean_op_part05+yuruyuri_season_01_tv_clean_op_part06_akkariin+yuruyuri_season_01_tv_clean_op_part07
yuruyuri_season_01_tv_clean_op_02=yuruyuri_season_01_tv_clean_op_part08_akkariin+yuruyuri_season_01_tv_clean_op_part09
yuruyuri_season_01_tv_clean_op_03=yuruyuri_season_01_tv_clean_op_part10

######## Combine ########

# yuruyuri_season_01_tv_clean_op_01 33
# yuruyuri_season_01_tv_clean_op_02 2220
# yuruyuri_season_01_tv_clean_op_03 5115

dissolve_length=12
yuruyuri_season_01_tv_op_t01=Dissolve(BlankClip(yuruyuri_season_01_tv_clean_op_01,length=33+dissolve_length,color=color_white),yuruyuri_season_01_tv_clean_op_01,dissolve_length)
yuruyuri_season_01_tv_op_t02=TRIM_LAST_CLIP(yuruyuri_season_01_tv_07_kyouko_and_chinatsu_walking,122)+TRIM_MIDDLE_CLIP(yuruyuri_season_01_tv_03_beautiful_chinatsu,12)+TRIM_FIRST_CLIP(yuruyuri_season_01_tv_02_himawari_hold_sakurako,120)+Trim(yuruyuri_season_01_tv_12_himawari_cosplay_rival,80,-12) \
	+TRIM_MIDDLE_CLIP(yuruyuri_season_01_tv_04_kyouko_draw_heart,66)+TRIM_MIDDLE_CLIP(yuruyuri_season_01_tv_04_ayako_draw_star,66)+TRIM_MIDDLE_CLIP(yuruyuri_season_01_tv_04_chitose_draw_words_02,66)+TRIM_MIDDLE_CLIP(yuruyuri_season_01_tv_04_chinatsu_draw_words,56)
yuruyuri_season_01_tv_op_t03=TRIM_FIRST_CLIP(yuruyuri_season_01_tv_05_mirakurun_vs_rival,306)+TRIM_MIDDLE_CLIP(yuruyuri_season_01_tv_12_chinatsu_cosplay_mirakurun,262)+TRIM_MIDDLE_CLIP(yuruyuri_season_01_tv_12_kyouko_and_mirakurun_chinatsu_hug,66)
yuruyuri_season_01_tv_op_t04=TRIM_FIRST_CLIP(yuruyuri_season_01_tv_11_kyouko_fall_off,65)+TRIM_LAST_CLIP(yuruyuri_season_01_tv_10_kyouko_throw_pillow,66)+TRIM_FIRST_CLIP(yuruyuri_season_01_tv_08_kyouko_samurai_hair,65)+TRIM_FIRST_CLIP(yuruyuri_season_01_tv_12_kyouko_dempsey_roll,29)+TRIM_FIRST_CLIP(yuruyuri_season_01_tv_02_kyouko_turn,111)
yuruyuri_season_01_tv_op_t05=yuruyuri_season_01_tv_clean_op_02
yuruyuri_season_01_tv_op_t06=TRIM_MIDDLE_CLIP(yuruyuri_season_01_tv_01_kyouko_act_as_mirakurun,68)+TRIM_LAST_CLIP(yuruyuri_season_01_tv_01_kyouko_touch_panty,66)+TRIM_MIDDLE_CLIP(yuruyuri_season_01_tv_04_kyouko_defeat_ayano,65)+TRIM_MIDDLE_CLIP(yuruyuri_season_01_tv_06_mari_take_mirakurun,66)
yuruyuri_season_01_tv_op_t07=TRIM_LAST_CLIP(yuruyuri_season_01_tv_05_akari_missile,65)+TRIM_LAST_CLIP(yuruyuri_season_01_tv_01_akari_moe,66)+TRIM_FIRST_CLIP(yuruyuri_season_01_tv_05_akkariin,65)+TRIM_FIRST_CLIP(yuruyuri_season_01_tv_07_akari_new_year,66) \
	+TRIM_MIDDLE_CLIP(yuruyuri_season_01_tv_05_chinatsu_kiss_akari,33)+TRIM_LAST_CLIP(yuruyuri_season_01_tv_05_broken_akari_01,33)+TRIM_LAST_CLIP(yuruyuri_season_01_tv_05_broken_akari_02,65)
yuruyuri_season_01_tv_op_t08=TRIM_MIDDLE_CLIP(yuruyuri_season_01_tv_12_akari_rolling,65)+TRIM_FIRST_CLIP(yuruyuri_season_01_tv_12_dog_akari,66)+TRIM_FIRST_CLIP(yuruyuri_season_01_tv_06_mirakurun_open_leg,66)+TRIM_MIDDLE_CLIP(yuruyuri_season_01_tv_12_bloody_chitose,33) \
	+TRIM_MIDDLE_CLIP(yuruyuri_season_01_tv_09_chinatsu_and_ghost,66)+TRIM_MIDDLE_CLIP(yuruyuri_season_01_tv_02_sakurako_beat_himawari_breast,66)
yuruyuri_season_01_tv_op_t09=TRIM_MIDDLE_CLIP(yuruyuri_season_01_tv_11_students_union,65)+TRIM_MIDDLE_CLIP(yuruyuri_season_01_tv_10_2nd_grade_classmates,66)+TRIM_MIDDLE_CLIP(yuruyuri_season_01_tv_03_kyouko_and_yui_sleep,65)+TRIM_MIDDLE_CLIP(yuruyuri_season_01_tv_08_chitose_and_chitsuru_dry_hair,66) \
	+TRIM_LAST_CLIP(yuruyuri_season_01_tv_06_chinatsu_and_mari_hug,66)+TRIM_MIDDLE_CLIP(yuruyuri_season_01_tv_09_chinatsu_sleep_on_yui_leg_02,66)+TRIM_LAST_CLIP(yuruyuri_season_01_tv_05_kyouko_cosplay,66)+TRIM_LAST_CLIP(yuruyuri_season_01_tv_07_sakurako_and_himawari_eating,66) \
	+TRIM_MIDDLE_CLIP(yuruyuri_season_01_tv_09_rise_moe,65)+TRIM_FIRST_CLIP(yuruyuri_season_01_tv_09_nana_handsome,66)+TRIM_LAST_CLIP(yuruyuri_season_01_tv_01_club_entrance,66)
yuruyuri_season_01_tv_op_t10=yuruyuri_season_01_tv_clean_op_03+BlankClip(yuruyuri_season_01_tv_clean_op_01,length=72,color=color_black)

fade_length=12
yuruyuri_season_01_tv_op_temp=yuruyuri_season_01_tv_op_t01+yuruyuri_season_01_tv_op_t02
yuruyuri_season_01_tv_op_temp=yuruyuri_season_01_tv_op_temp+yuruyuri_season_01_tv_op_t03
yuruyuri_season_01_tv_op_temp=DOUBLE_FADE_WITH_BRIGHTNESS_OFFSET(yuruyuri_season_01_tv_op_temp,FADE_OUT_WITH_BRIGHTNESS_OFFSET(yuruyuri_season_01_tv_op_t04,fade_length),fade_length,fade_length)
yuruyuri_season_01_tv_op_temp=yuruyuri_season_01_tv_op_temp+yuruyuri_season_01_tv_op_t05
yuruyuri_season_01_tv_op_temp=yuruyuri_season_01_tv_op_temp+yuruyuri_season_01_tv_op_t06
yuruyuri_season_01_tv_op_temp=DOUBLE_FADE_WITH_BRIGHTNESS_OFFSET(yuruyuri_season_01_tv_op_temp,yuruyuri_season_01_tv_op_t07,fade_length,fade_length)
yuruyuri_season_01_tv_op_temp=DOUBLE_FADE_WITH_BRIGHTNESS_OFFSET(yuruyuri_season_01_tv_op_temp,yuruyuri_season_01_tv_op_t08,fade_length,fade_length)
yuruyuri_season_01_tv_op_temp=DOUBLE_FADE_WITH_BRIGHTNESS_OFFSET(yuruyuri_season_01_tv_op_temp,FADE_OUT_WITH_BRIGHTNESS_OFFSET(yuruyuri_season_01_tv_op_t09,fade_length),fade_length,fade_length)
yuruyuri_season_01_tv_op_temp=yuruyuri_season_01_tv_op_temp+yuruyuri_season_01_tv_op_t10

yuruyuri_season_01_tv_op_mute=yuruyuri_season_01_tv_op_temp

######## Music ########

bgm_48khz=SSRC(WAVSource("src\yuruyuri-season_01-op-cd-01.wav"),48000)
AudioDub(yuruyuri_season_01_tv_op_mute,bgm_48khz)

######## Subtitle ########

subtitle_x=50
subtitle_y=395
global subtitle_front_fade_count=12
global subtitle_rear_fade_count=24
global subtitle_font="MS Gothic"
global subtitle_effects="bi"
global subtitle_size=32
global subtitle_text_color=OVERWRITE_SUBTITLE_COLOR_ALPHA(color_pink,$D0)
global subtitle_halo_color=color_black

function SUBTITLE_FX(clip clip,string text,float x,float y,int start_frame,int end_frame,bool "is_second_subtitle",bool "is_title"){
	is_second_subtitle=Default(is_second_subtitle,false)
	is_title=Default(is_title,false)

	text_color=is_second_subtitle?OVERWRITE_SUBTITLE_COLOR_ALPHA(color_hotpink,$D0):subtitle_text_color
	halo_color=is_title?color_hotpink:subtitle_halo_color

	return SUBTITLE_FX_SLIDE_IN_WATER_OUT(clip,text,x,y,start_frame,end_frame,subtitle_front_fade_count,subtitle_rear_fade_count,subtitle_font,subtitle_effects,subtitle_size,text_color,halo_color)
}

ConvertToRGB32()

SUBTITLE_FX("ゆりゆららららゆるゆり大事件//七森中☆ごらく部|- by fielia@AVISynth",subtitle_x,subtitle_y-subtitle_size,3703,3900,is_title=true)

SUBTITLE_FX("ゆりゆららららゆるゆり",subtitle_x,subtitle_y,73,138)
SUBTITLE_FX("ゆりゆららららゆるゆり",subtitle_x,subtitle_y,139,203)
SUBTITLE_FX("ゆりゆららららゆるゆり 大事件",subtitle_x,subtitle_y,204,309)

SUBTITLE_FX("てんてこまいの今日明日大爆発",subtitle_x,subtitle_y,730,782)
SUBTITLE_FX("そんで身長伸びないやああどうしよ",subtitle_x,subtitle_y,783,849)

SUBTITLE_FX("甘いもの食べすぎテーマパーク",subtitle_x,subtitle_y,858,914)
SUBTITLE_FX("ほいじゃ隠せよ乙女でどうじゃろ",subtitle_x,subtitle_y,915,984)

SUBTITLE_FX("部活動本番",subtitle_x,subtitle_y,994,1058)
SUBTITLE_FX("しめしめ無遅刻",subtitle_x,subtitle_y,1059,1124)
SUBTITLE_FX("「本業学業」なにそれ?",subtitle_x,subtitle_y,1125,1189)
SUBTITLE_FX("そんなのぜんぜんぜんぜんぜんぜん食べれない",subtitle_x,subtitle_y,1190,1258)

SUBTITLE_FX("桜咲き",subtitle_x,subtitle_y,1268,1332)
SUBTITLE_FX("桜散り",subtitle_x,subtitle_y,1333,1403)
SUBTITLE_FX("明日もいい日と歌うよ (歌うよ)",subtitle_x,subtitle_y,1404,1531)

SUBTITLE_FX("君が好き",subtitle_x,subtitle_y,1532,1596)
SUBTITLE_FX("君がいい",subtitle_x,subtitle_y,1597,1666)
SUBTITLE_FX("明日もいたいと思うよ (となりに)",subtitle_x,subtitle_y,1667,1809)

SUBTITLE_FX("最終手段で居眠り",subtitle_x,subtitle_y,1810,1880)

SUBTITLE_FX("ゆりゆららららゆるゆり",subtitle_x,subtitle_y,1881,1946)
SUBTITLE_FX("ゆりゆららららゆるゆり",subtitle_x,subtitle_y,1947,2012)
SUBTITLE_FX("ゆりゆららららゆるゆり 大事件",subtitle_x,subtitle_y,2013,2120)

SUBTITLE_FX("いろはにほへとでおみくじGet you!あいらびゅー",subtitle_x,subtitle_y,2188,2285)
SUBTITLE_FX("にゃん!にゃん!老にゃん!若にゃん!男にゃ!女ん!",subtitle_x,subtitle_y,2286,2339)

SUBTITLE_FX("必死に密着を発射で必中授業中",subtitle_x,subtitle_y,2340,2404)
SUBTITLE_FX("でもねあらららチョークがミサイル",subtitle_x,subtitle_y,2405,2472)

SUBTITLE_FX("虎穴に入らない",subtitle_x,subtitle_y,2484,2549)
SUBTITLE_FX("雨ならハレルヤ",subtitle_x,subtitle_y,2550,2614)
SUBTITLE_FX("「カラオケ割高」なにそれ?",subtitle_x,subtitle_y,2615,2679)
SUBTITLE_FX("そんなのぜったいぜったいぜったい食べれない!!",subtitle_x,subtitle_y,2680,2750)

SUBTITLE_FX("桜咲き",subtitle_x,subtitle_y,2759,2823)
SUBTITLE_FX("桜散り",subtitle_x,subtitle_y,2824,2893)
SUBTITLE_FX("明日もいい日と歌うよ (歌うよ)",subtitle_x,subtitle_y,2894,3021)

SUBTITLE_FX("君が好き",subtitle_x,subtitle_y,3022,3087)
SUBTITLE_FX("君がいい",subtitle_x,subtitle_y,3088,3156)
SUBTITLE_FX("明日もいたいと思うよ (となりに)",subtitle_x,subtitle_y,3157,3300)

SUBTITLE_FX("近所のワンコと格闘",subtitle_x,subtitle_y,3301,3370)

SUBTITLE_FX("ゆりゆららららゆるゆり",subtitle_x,subtitle_y,3371,3436)
SUBTITLE_FX("ゆりゆららららゆるゆり",subtitle_x,subtitle_y,3437,3502)
SUBTITLE_FX("ゆりゆららららゆるゆり 大事件",subtitle_x,subtitle_y,3503,3606)

SUBTITLE_FX("チャイムが目覚まし",subtitle_x,subtitle_y,4029,4094)
SUBTITLE_FX("KIRA☆KIRA☆TSUN-DELE",subtitle_x,subtitle_y,4095,4156)
SUBTITLE_FX("「生クリーム惑星」なにそれ?",subtitle_x,subtitle_y,4157,4224)
SUBTITLE_FX("それならほんとにほんとにほんとにやめれない!|やめれない!!",subtitle_x,subtitle_y-subtitle_size,4225,4362)

SUBTITLE_FX("桜咲き",subtitle_x,subtitle_y,4370,4433)
SUBTITLE_FX("桜散り",subtitle_x,subtitle_y,4434,4504)
SUBTITLE_FX("明日もいい日と歌うよ (歌うよ)",subtitle_x,subtitle_y,4505,4631)

SUBTITLE_FX("君が好き",subtitle_x,subtitle_y,4632,4697)
SUBTITLE_FX("君がいい",subtitle_x,subtitle_y,4698,4766)
SUBTITLE_FX("明日もいたいと思うよ (となりに)",subtitle_x,subtitle_y,4767,4910)

SUBTITLE_FX("最終手段で居眠り",subtitle_x,subtitle_y,4911,4977)
SUBTITLE_FX("近所のワンコと格闘",subtitle_x,subtitle_y,4978,5042)
SUBTITLE_FX("革命起こして卒業",subtitle_x,subtitle_y,5043,5113)

SUBTITLE_FX("ゆりゆららららゆるゆり",subtitle_x,subtitle_y,5114,5179)
SUBTITLE_FX("ゆりゆららららゆるゆり",subtitle_x,subtitle_y,5180,5245)
SUBTITLE_FX("ゆりゆららららゆるゆり 大事件",subtitle_x,subtitle_y,5246,5348)



second_subtitle_x=50
second_subtitle_y=50

SUBTITLE_FX("(桜咲き)",second_subtitle_x,second_subtitle_y,1301,1365,true)
SUBTITLE_FX("(桜散り)",second_subtitle_x,second_subtitle_y,1366,1403,true)

SUBTITLE_FX("(君が好き)",second_subtitle_x,second_subtitle_y,1564,1628,true)
SUBTITLE_FX("(君がいい)",second_subtitle_x,second_subtitle_y,1629,1666,true)

SUBTITLE_FX("(桜咲き)",second_subtitle_x,second_subtitle_y,2791,2856,true)
SUBTITLE_FX("(桜散り)",second_subtitle_x,second_subtitle_y,2857,2893,true)

SUBTITLE_FX("(君が好き)",second_subtitle_x,second_subtitle_y,3054,3119,true)
SUBTITLE_FX("(君がいい)",second_subtitle_x,second_subtitle_y,3120,3156,true)

SUBTITLE_FX("(桜咲き)",second_subtitle_x,second_subtitle_y,4402,4467,true)
SUBTITLE_FX("(桜散り)",second_subtitle_x,second_subtitle_y,4468,4504,true)

SUBTITLE_FX("(君が好き)",second_subtitle_x,second_subtitle_y,4666,4730,true)
SUBTITLE_FX("(君がいい)",second_subtitle_x,second_subtitle_y,4731,4766,true)



akkariin_blink_string="＼ｱｯｶﾘｰﾝ／"
akkariin_blink_string_x=-second_subtitle_x
akkariin_blink_string_y=second_subtitle_y
akkariin_blink_string_first_frame=40
akkariin_blink_string_last_frame=2450

SUBTITLE_FX_SMOOTH_BLINK(akkariin_blink_string,akkariin_blink_string_x,akkariin_blink_string_y,akkariin_blink_string_first_frame,akkariin_blink_string_last_frame,subtitle_font,subtitle_effects,subtitle_size,color_white,subtitle_halo_color,min_opacity=0.2,max_opacity=0.9)



global title_call_subtitle_size=56
title_call_subtitle_x=428
title_call_subtitle_y=370

function SUBTITLE_N(clip clip,string text,float x,float y,int start_frame,int end_frame,bool "is_title_call"){
	is_title_call=Default(is_title_call,false)

	x=is_title_call?x-(title_call_subtitle_size*StrLen(text)/4):x
	size=is_title_call?title_call_subtitle_size:subtitle_size

	return SUBTITLE_NORMAL(clip,text,x,y,start_frame,end_frame,subtitle_font,subtitle_effects,size,subtitle_text_color,subtitle_halo_color)
}

yuruyuri_season_01_tv_01_title_call_mtv_version=ConvertToRGB32(yuruyuri_season_01_tv_01_title_call_mtv_version)
yuruyuri_season_01_tv_01_title_call_mtv_version=SUBTITLE_N(yuruyuri_season_01_tv_01_title_call_mtv_version,akkariin_blink_string,title_call_subtitle_x,title_call_subtitle_y,45,95,true)
yuruyuri_season_01_tv_01_title_call_mtv_version=SUBTITLE_N(yuruyuri_season_01_tv_01_title_call_mtv_version,"は〜〜〜い",subtitle_x,subtitle_y,100,125)
yuruyuri_season_01_tv_01_title_call_mtv_version=SUBTITLE_N(yuruyuri_season_01_tv_01_title_call_mtv_version,"ゆるゆり、始まるよ〜〜〜",subtitle_x,subtitle_y,135,200)
yuruyuri_season_01_tv_01_title_call_mtv_version=SUBTITLE_N(yuruyuri_season_01_tv_01_title_call_mtv_version,"わっ",subtitle_x,subtitle_y,225,235+15)
yuruyuri_season_01_tv_01_title_call_mtv_version=SUBTITLE_N(yuruyuri_season_01_tv_01_title_call_mtv_version,"わたしの......",subtitle_x,subtitle_y,265,290)
yuruyuri_season_01_tv_01_title_call_mtv_version=SUBTITLE_N(yuruyuri_season_01_tv_01_title_call_mtv_version,"わたしの存在感〜〜〜！！！",subtitle_x,subtitle_y,320,395)



yuruyuri_season_01_tv_01_title_call_mtv_version++last

######## Post Processing ########

ConvertToYV12()
#ConvertToYUY2()
#ConvertToRGB24()

TCPServer()
