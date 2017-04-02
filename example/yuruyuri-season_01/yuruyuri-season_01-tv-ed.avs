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

yuruyuri_season_01_tv_clean_ed=FFMS2_VIDEO_SOURCE("src\anime\bd\special\yuruyuri-season_01-bd-vol02-ed.mp4")

yuruyuri_season_01_tv_clean_ed_part01=Trim(yuruyuri_season_01_tv_clean_ed,0,286)
yuruyuri_season_01_tv_clean_ed_part02=Trim(yuruyuri_season_01_tv_clean_ed,287,554)

yuruyuri_season_01_tv_clean_ed_part03=Trim(yuruyuri_season_01_tv_clean_ed,555,918)
yuruyuri_season_01_tv_clean_ed_part04=Trim(yuruyuri_season_01_tv_clean_ed,919,1154)
yuruyuri_season_01_tv_clean_ed_part05=Trim(yuruyuri_season_01_tv_clean_ed,1155,1340)
yuruyuri_season_01_tv_clean_ed_part06=Trim(yuruyuri_season_01_tv_clean_ed,1341,1452)

yuruyuri_season_01_tv_clean_ed_part07=Trim(yuruyuri_season_01_tv_clean_ed,1453,2040)
yuruyuri_season_01_tv_clean_ed_part08=Trim(yuruyuri_season_01_tv_clean_ed,2041,0)



yuruyuri_season_01_tv_01_cache01=FFMS2_VIDEO_SOURCE("src\anime\bd\yuruyuri-season_01-bd-01.mp4")
yuruyuri_season_01_tv_01_cache02=FFMS2_VIDEO_SOURCE("src\anime\bd\yuruyuri-season_01-bd-01.mp4")
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

yuruyuri_season_01_tv_01_akari_sister_room=Trim(yuruyuri_season_01_tv_01_cache01,6238,6779)

yuruyuri_season_01_tv_01_mirakurun_part01=Trim(yuruyuri_season_01_tv_01_cache01,14668,14828)
yuruyuri_season_01_tv_01_mirakurun_part02=Trim(yuruyuri_season_01_tv_01_cache02,14829,14906)
yuruyuri_season_01_tv_01_mirakurun_part03=Trim(yuruyuri_season_01_tv_01_cache01,14907,14954)
yuruyuri_season_01_tv_01_mirakurun_part04=Trim(yuruyuri_season_01_tv_01_cache02,14955,15000)
yuruyuri_season_01_tv_01_mirakurun_part05=Trim(yuruyuri_season_01_tv_01_cache01,15001,15228)
yuruyuri_season_01_tv_01_akkariin=Trim(yuruyuri_season_01_tv_01_cache01,25863,25904)

yuruyuri_season_01_tv_02_kyouko_dont_care=Trim(yuruyuri_season_01_tv_02,4220,4475)
yuruyuri_season_01_tv_02_chitose_suggest=Trim(yuruyuri_season_01_tv_02,5524,5616)
yuruyuri_season_01_tv_02_ayano_kyouko_sexual_attraction=Trim(yuruyuri_season_01_tv_02,6642,6927)
yuruyuri_season_01_tv_02_chitose_delusion=Trim(yuruyuri_season_01_tv_02,6928,7005)
yuruyuri_season_01_tv_02_kyouko_cry=Trim(yuruyuri_season_01_tv_02,9041,9173)
yuruyuri_season_01_tv_02_sakurako_vs_himawari_01=Trim(yuruyuri_season_01_tv_02,12187,12234)
yuruyuri_season_01_tv_02_sakurako_vs_himawari_02=Trim(yuruyuri_season_01_tv_02,12235,12306)
yuruyuri_season_01_tv_02_kyouko_eat_pudding=Trim(yuruyuri_season_01_tv_02,15877,15958)
yuruyuri_season_01_tv_02_himawari_and_sakurako_hug=Trim(yuruyuri_season_01_tv_02,19140,19332)
yuruyuri_season_01_tv_02_ayano_shock_01=Trim(yuruyuri_season_01_tv_02,20741,20806)
yuruyuri_season_01_tv_02_ayano_shock_02=Trim(yuruyuri_season_01_tv_02,20999,21068)
yuruyuri_season_01_tv_02_himawari_big_breast_01=Trim(yuruyuri_season_01_tv_02,22703,22965)
yuruyuri_season_01_tv_02_himawari_big_breast_02=Trim(yuruyuri_season_01_tv_02,22966,23205)
yuruyuri_season_01_tv_02_akari_and_chinatsu_small_breast=Trim(yuruyuri_season_01_tv_02,23206,23277)
yuruyuri_season_01_tv_02_himawari_thanks_to_sakurako=Trim(yuruyuri_season_01_tv_02,25019,25106)
yuruyuri_season_01_tv_02_kyouko_think_influence=Trim(yuruyuri_season_01_tv_02,28053,28164)

yuruyuri_season_01_tv_03_kyouko_delusion_strange_akari_01=Trim(yuruyuri_season_01_tv_03,6486,6745)
yuruyuri_season_01_tv_03_kyouko_delusion_strange_akari_02=Trim(yuruyuri_season_01_tv_03,6794,7176)
yuruyuri_season_01_tv_03_kyouko_thanks_to_yui=Trim(yuruyuri_season_01_tv_03,16353,16450)
yuruyuri_season_01_tv_03_little_kyouko_and_yui=Trim(yuruyuri_season_01_tv_03,20022,20702)

yuruyuri_season_01_tv_04_kyouko_kiss_ayano=Trim(yuruyuri_season_01_tv_04,1278,1370)
yuruyuri_season_01_tv_04_kyouko_kiss_chinatsu=Trim(yuruyuri_season_01_tv_04,6716,6866)
yuruyuri_season_01_tv_04_chinatsu_twinkle_01=Trim(yuruyuri_season_01_tv_04,7903,7944)
yuruyuri_season_01_tv_04_chinatsu_twinkle_02=Trim(yuruyuri_season_01_tv_04,7970,8011)
yuruyuri_season_01_tv_04_akkariin=Trim(yuruyuri_season_01_tv_04,9057,9176)
yuruyuri_season_01_tv_04_ayano_rise_up=Trim(yuruyuri_season_01_tv_04,11952,12230)
yuruyuri_season_01_tv_04_kyouko_and_ayako_draw=Trim(yuruyuri_season_01_tv_04,25657,25710)

yuruyuri_season_01_tv_06_kyouko_escape=Trim(yuruyuri_season_01_tv_06,9713,9860)

#yuruyuri_season_01_tv_08_chitose_tell_the_truth_01=Trim(yuruyuri_season_01_tv_08,9646,10099)
yuruyuri_season_01_tv_08_chitose_tell_the_truth_02=Trim(yuruyuri_season_01_tv_08,10202,10351)
yuruyuri_season_01_tv_08_kyouko_peko_chan=Trim(yuruyuri_season_01_tv_08,13581,13669)
yuruyuri_season_01_tv_08_chitose_hello=Trim(yuruyuri_season_01_tv_08,14435,14623)
yuruyuri_season_01_tv_08_chitsuru_delusion=Trim(yuruyuri_season_01_tv_08,20481,20756)
yuruyuri_season_01_tv_08_chitose_and_chitsuru_delusion=Trim(yuruyuri_season_01_tv_08,22450,22638)

yuruyuri_season_01_tv_09_rise_as_ghost=Trim(yuruyuri_season_01_tv_09,17611,17766)

yuruyuri_season_01_tv_10_kyouko_in_kiyomizudera=Trim(yuruyuri_season_01_tv_10,8177,8242)

yuruyuri_season_01_tv_11_chinatsu_bully_kyouko=Trim(yuruyuri_season_01_tv_11,5719,5885)

######## Pre Combine (1080P) ########

global subtitle_clip_font="MS Gothic"
global subtitle_clip_effects="bc"
global subtitle_clip_font_size=45
global subtitle_clip_text_color=color_pink
global subtitle_clip_halo_color=color_white

global subtitle_clip_text_x=subtitle_clip_width/2
global subtitle_clip_text_y=subtitle_clip_height/2-subtitle_clip_font_size/2

global subtitle_clip_footage_text_x=856-50
global subtitle_clip_footage_text_y=395
global subtitle_clip_footage_font_size=32

function SUBTITLE_CENTER(clip clip,string text,bool "is_footage"){
	is_footage=Default(is_footage,false)
	x=is_footage?subtitle_clip_footage_text_x-(subtitle_clip_footage_font_size*StrLen(text)/2):subtitle_clip_text_x-(subtitle_clip_font_size*StrLen(text)/4)
	y=is_footage?subtitle_clip_footage_text_y:subtitle_clip_text_y
	effects=is_footage?"b":subtitle_clip_effects
	size=is_footage?subtitle_clip_footage_font_size:subtitle_clip_font_size

	return SUBTITLE_NORMAL(clip,text,x,y,font=subtitle_clip_font,effects=effects,size=size,text_color=subtitle_clip_text_color,halo_color=subtitle_clip_halo_color,subtitle_mode="standard")
}

subtitle_clip_length=96
omake_clip_part01=BlankClip(yuruyuri_season_01_tv_clean_ed_part01,length=subtitle_clip_length,pixel_type="RGB32",color=color_black)
omake_clip_part01=ConvertToYV12(SUBTITLE_CENTER(omake_clip_part01,"どうしてあかりんの出番がある?"))
omake_clip_part02=BlankClip(yuruyuri_season_01_tv_clean_ed_part02,length=subtitle_clip_length,pixel_type="RGB32",color=color_black)
omake_clip_part02=ConvertToYV12(SUBTITLE_CENTER(omake_clip_part02,"それは......"))
omake_clip_part03=yuruyuri_season_01_tv_01_akari_sister_room
omake_clip_part04=BlankClip(yuruyuri_season_01_tv_clean_ed_part04,length=subtitle_clip_length,pixel_type="RGB32",color=color_black)
omake_clip_part04=SUBTITLE_CENTER(omake_clip_part04,"＼ｱｯｶﾘｰﾝ／")
omake_clip_part04=SUBTITLE_CENTER(omake_clip_part04,"----------")
omake_clip_part04=SUBTITLE_CENTER(omake_clip_part04,"                   <-禁止!")
omake_clip_part04=ConvertToYV12(SUBTITLE_CENTER(omake_clip_part04,"シスコン 赤座あかね より",true))
omake_clip=omake_clip_part01+omake_clip_part02+omake_clip_part03+omake_clip_part04



function _FLIP_PAGE(clip left,clip right){
	length=Framecount(left)
	left_height=Height(left)

	return ConvertToYV12(TRANSFORM(ConvertToRGB32(left),ConvertToRGB32(right),srcx="0",srcy="0",dstx="0",dsty="-Float("+String(left_height)+")*Pow("+String(length)+"-1-n,2)/Pow("+String(length)+"-1,2)"))
}

function FLIP_PAGE(clip left,clip right,int length){
	return TRANSITION(left,right,length,"_FLIP_PAGE(left,right)")
}

function FLIP_PAGE_2(clip clip1,clip clip2,int num_frames){
	clip2_start=Framecount(clip1)-num_frames
	clip1_extend=clip1+BlankClip(clip1,length=Framecount(clip2)-num_frames)
	clip2_extend=BlankClip(clip2,length=clip2_start)+clip2
	clip1_height=Height(clip1)
	return ConvertToYV12(TRANSFORM(ConvertToRGB32(clip1_extend),ConvertToRGB32(clip2_extend),srcx="0",srcy="0",dstx="0",dsty="n<"+String(clip2_start)+"?-"+String(clip1_height)+":(n>"+String(clip2_start)+"+"+String(num_frames)+"-1?0:-Int(Float("+String(clip1_height)+")/Pow("+String(num_frames)+"-1,2)*Pow("+String(clip2_start)+"+"+String(num_frames)+"-1-n,2)))"))
}

flip_page_length=8

yuruyuri_season_01_tv_01_mirakurun_temp=FLIP_PAGE(TRIM_MIDDLE_CLIP(yuruyuri_season_01_tv_01_mirakurun_part01,23),TRIM_MIDDLE_CLIP(yuruyuri_season_01_tv_01_mirakurun_part02,23),flip_page_length)
yuruyuri_season_01_tv_01_mirakurun_temp=FLIP_PAGE(yuruyuri_season_01_tv_01_mirakurun_temp,TRIM_MIDDLE_CLIP(yuruyuri_season_01_tv_01_mirakurun_part03,23),flip_page_length)
yuruyuri_season_01_tv_01_mirakurun_temp=FLIP_PAGE(yuruyuri_season_01_tv_01_mirakurun_temp,TRIM_MIDDLE_CLIP(yuruyuri_season_01_tv_01_mirakurun_part04,23),flip_page_length)
yuruyuri_season_01_tv_01_mirakurun_temp=FLIP_PAGE(yuruyuri_season_01_tv_01_mirakurun_temp,TRIM_FIRST_CLIP(yuruyuri_season_01_tv_01_mirakurun_part05,23),flip_page_length)
yuruyuri_season_01_tv_01_mirakurun=FLIP_PAGE(yuruyuri_season_01_tv_01_mirakurun_temp,TRIM_LAST_CLIP(yuruyuri_season_01_tv_01_mirakurun_part05,46),flip_page_length)
Assert(Framecount(yuruyuri_season_01_tv_01_mirakurun)==121,"mirakurun must have 121 framecount")

yuruyuri_season_01_tv_ed_t99=FLIP_PAGE(TRIM_MIDDLE_CLIP(yuruyuri_season_01_tv_08_chitose_hello,121+flip_page_length),yuruyuri_season_01_tv_01_mirakurun,flip_page_length)



yuruyuri_season_01_tv_clean_ed_01=yuruyuri_season_01_tv_clean_ed_part01+yuruyuri_season_01_tv_clean_ed_part02
yuruyuri_season_01_tv_clean_ed_02=yuruyuri_season_01_tv_clean_ed_part03+yuruyuri_season_01_tv_clean_ed_part04+yuruyuri_season_01_tv_clean_ed_part05+yuruyuri_season_01_tv_clean_ed_part06
yuruyuri_season_01_tv_clean_ed_03=yuruyuri_season_01_tv_clean_ed_part07
yuruyuri_season_01_tv_clean_ed_04=yuruyuri_season_01_tv_clean_ed_part08

yuruyuri_season_01_tv_04_akkariin_extend=Loop(yuruyuri_season_01_tv_04_akkariin,2,0,0)

######## Combine ########

# yuruyuri_season_01_tv_clean_ed_01 -1
# yuruyuri_season_01_tv_clean_ed_02 2190
# yuruyuri_season_01_tv_clean_ed_03 4420
# yuruyuri_season_01_tv_clean_ed_04 5129

timing_offset=13

yuruyuri_season_01_tv_ed_t01=Trim(yuruyuri_season_01_tv_clean_ed_01,1,0)
yuruyuri_season_01_tv_ed_t02=TRIM_MIDDLE_CLIP(yuruyuri_season_01_tv_02_kyouko_dont_care,124)+yuruyuri_season_01_tv_ed_t99
yuruyuri_season_01_tv_ed_t03=TRIM_MIDDLE_CLIP(yuruyuri_season_01_tv_02_himawari_big_breast_01,121)+TRIM_MIDDLE_CLIP(yuruyuri_season_01_tv_02_himawari_big_breast_02,121)
yuruyuri_season_01_tv_ed_t04=TRIM_MIDDLE_CLIP(yuruyuri_season_01_tv_02_kyouko_cry,122)+TRIM_MIDDLE_CLIP(yuruyuri_season_01_tv_03_kyouko_thanks_to_yui,61) \
	+TRIM_MIDDLE_CLIP(yuruyuri_season_01_tv_04_chinatsu_twinkle_01,15)+TRIM_MIDDLE_CLIP(yuruyuri_season_01_tv_04_chinatsu_twinkle_02,15)+TRIM_MIDDLE_CLIP(yuruyuri_season_01_tv_04_kyouko_and_ayako_draw,30)+TRIM_MIDDLE_CLIP(yuruyuri_season_01_tv_01_akkariin,15)+TRIM_MIDDLE_CLIP(yuruyuri_season_01_tv_02_sakurako_vs_himawari_01,15)+TRIM_MIDDLE_CLIP(yuruyuri_season_01_tv_02_sakurako_vs_himawari_02,30-timing_offset)
yuruyuri_season_01_tv_ed_t05=TRIM_MIDDLE_CLIP(yuruyuri_season_01_tv_06_kyouko_escape,121)+TRIM_LAST_CLIP(yuruyuri_season_01_tv_11_chinatsu_bully_kyouko,121+timing_offset)+TRIM_MIDDLE_CLIP(yuruyuri_season_01_tv_04_kyouko_kiss_chinatsu,121-timing_offset)+TRIM_MIDDLE_CLIP(yuruyuri_season_01_tv_02_ayano_kyouko_sexual_attraction,121+timing_offset)
yuruyuri_season_01_tv_ed_t06=TRIM_LAST_CLIP(yuruyuri_season_01_tv_08_chitsuru_delusion,122)+TRIM_LAST_CLIP(yuruyuri_season_01_tv_08_chitose_and_chitsuru_delusion,119)
yuruyuri_season_01_tv_ed_t07=yuruyuri_season_01_tv_clean_ed_02
yuruyuri_season_01_tv_ed_t08=Trim(yuruyuri_season_01_tv_03_kyouko_delusion_strange_akari_01,100,-122)+Trim(yuruyuri_season_01_tv_03_kyouko_delusion_strange_akari_02,190,-(121+timing_offset))+TRIM_MIDDLE_CLIP(yuruyuri_season_01_tv_08_chitose_tell_the_truth_02,121-timing_offset)+TRIM_LAST_CLIP(yuruyuri_season_01_tv_03_little_kyouko_and_yui,121+timing_offset)
yuruyuri_season_01_tv_ed_t09=TRIM_MIDDLE_CLIP(yuruyuri_season_01_tv_02_chitose_suggest,61)+TRIM_MIDDLE_CLIP(yuruyuri_season_01_tv_02_kyouko_eat_pudding,60)+TRIM_MIDDLE_CLIP(yuruyuri_season_01_tv_02_akari_and_chinatsu_small_breast,61)+TRIM_MIDDLE_CLIP(yuruyuri_season_01_tv_04_kyouko_kiss_ayano,60) \
	+TRIM_MIDDLE_CLIP(yuruyuri_season_01_tv_02_ayano_shock_01,61)+TRIM_MIDDLE_CLIP(yuruyuri_season_01_tv_02_ayano_shock_02,60)+TRIM_MIDDLE_CLIP(yuruyuri_season_01_tv_08_kyouko_peko_chan,61)+TRIM_MIDDLE_CLIP(yuruyuri_season_01_tv_09_rise_as_ghost,121)
yuruyuri_season_01_tv_ed_t10=TRIM_LAST_CLIP(yuruyuri_season_01_tv_02_himawari_and_sakurako_hug,121)+TRIM_LAST_CLIP(yuruyuri_season_01_tv_02_himawari_thanks_to_sakurako,61) \
	+TRIM_FIRST_CLIP(yuruyuri_season_01_tv_02_kyouko_think_influence,15)+TRIM_LAST_CLIP(yuruyuri_season_01_tv_02_kyouko_think_influence,15)+TRIM_FIRST_CLIP(yuruyuri_season_01_tv_02_chitose_delusion,30)+TRIM_FIRST_CLIP(yuruyuri_season_01_tv_04_ayano_rise_up,15)+TRIM_LAST_CLIP(yuruyuri_season_01_tv_04_ayano_rise_up,15)+TRIM_MIDDLE_CLIP(yuruyuri_season_01_tv_10_kyouko_in_kiyomizudera,30-timing_offset)
yuruyuri_season_01_tv_ed_t11=yuruyuri_season_01_tv_clean_ed_03
yuruyuri_season_01_tv_ed_t12=TRIM_MIDDLE_CLIP(yuruyuri_season_01_tv_04_akkariin_extend,121)
yuruyuri_season_01_tv_ed_t13=yuruyuri_season_01_tv_clean_ed_04

fade_length=12

yuruyuri_season_01_tv_ed_temp=yuruyuri_season_01_tv_ed_t01+yuruyuri_season_01_tv_ed_t02
yuruyuri_season_01_tv_ed_temp=yuruyuri_season_01_tv_ed_temp+yuruyuri_season_01_tv_ed_t03
yuruyuri_season_01_tv_ed_temp=yuruyuri_season_01_tv_ed_temp+yuruyuri_season_01_tv_ed_t04
yuruyuri_season_01_tv_ed_temp=yuruyuri_season_01_tv_ed_temp+yuruyuri_season_01_tv_ed_t05
yuruyuri_season_01_tv_ed_temp=yuruyuri_season_01_tv_ed_temp+yuruyuri_season_01_tv_ed_t06
yuruyuri_season_01_tv_ed_temp=yuruyuri_season_01_tv_ed_temp+yuruyuri_season_01_tv_ed_t07
yuruyuri_season_01_tv_ed_temp=yuruyuri_season_01_tv_ed_temp+yuruyuri_season_01_tv_ed_t08
yuruyuri_season_01_tv_ed_temp=yuruyuri_season_01_tv_ed_temp+DOUBLE_FADE_WITH_BRIGHTNESS_OFFSET(yuruyuri_season_01_tv_ed_t09,yuruyuri_season_01_tv_ed_t10,fade_length,fade_length)
yuruyuri_season_01_tv_ed_temp=yuruyuri_season_01_tv_ed_temp+yuruyuri_season_01_tv_ed_t11
yuruyuri_season_01_tv_ed_temp=yuruyuri_season_01_tv_ed_temp+yuruyuri_season_01_tv_ed_t12
yuruyuri_season_01_tv_ed_temp=yuruyuri_season_01_tv_ed_temp+yuruyuri_season_01_tv_ed_t13

yuruyuri_season_01_tv_op_mute=yuruyuri_season_01_tv_ed_temp

######## Music ########

bgm_48khz=SSRC(WAVSource("src\yuruyuri-season_01-ed-01.wav"),48000)
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

function SUBTITLE_FX(clip clip,string text,float x,float y,int start_frame,int end_frame,bool "is_title"){
	is_title=Default(is_title,false)

	halo_color=is_title?color_hotpink:subtitle_halo_color

	return SUBTITLE_FX_SLIDE_IN_WATER_OUT(clip,text,x,y,start_frame,end_frame,subtitle_front_fade_count,subtitle_rear_fade_count,subtitle_font,subtitle_effects,subtitle_size,subtitle_text_color,halo_color)
}

function SUBTITLE_N(clip clip,string text,float x,float y,int start_frame,int end_frame){
	return SUBTITLE_NORMAL(clip,text,x,y,start_frame,end_frame,subtitle_font,subtitle_effects,subtitle_size,subtitle_text_color,subtitle_halo_color)
}

ConvertToRGB32()

SUBTITLE_FX("マイペースでいきましょう//七森中☆ごらく部|- by 赤座あかね & fielia@AVISynth",subtitle_x,subtitle_y-subtitle_size,375,497,true)

SUBTITLE_FX("いつもミラクル......",subtitle_x,subtitle_y-subtitle_size,32,238)
SUBTITLE_N("ミラクル",subtitle_x,subtitle_y,239,249)
SUBTITLE_N("ミラ",subtitle_x,subtitle_y,250,256)
SUBTITLE_N("    ミラ",subtitle_x,subtitle_y,257,264)
SUBTITLE_N("        ミ",subtitle_x,subtitle_y,265,268)
SUBTITLE_N("          ミ",subtitle_x,subtitle_y,269,271)
SUBTITLE_N("            ミ",subtitle_x,subtitle_y,272,275)
SUBTITLE_N("              ミ",subtitle_x,subtitle_y,276,279)
SUBTITLE_FX("妄想中",subtitle_x,subtitle_y-subtitle_size,286,311)

SUBTITLE_FX("朝からギリギリ 朝飯モリモリ",subtitle_x,subtitle_y,553,615)
SUBTITLE_FX("髪型なんて気にしない",subtitle_x,subtitle_y,616,666)
SUBTITLE_N("                     ない",subtitle_x,subtitle_y,667,672)
SUBTITLE_FX("棚ぼた ぼたもち 餅つき 餅つけ",subtitle_x,subtitle_y,674,734)
SUBTITLE_FX("食いしん坊でいきますよ",subtitle_x,subtitle_y,735,790)
SUBTITLE_N("                       よ",subtitle_x,subtitle_y,791,796)
SUBTITLE_FX("いきなりむちゃぶり ちゃっかりねたふり",subtitle_x,subtitle_y,916,977)
SUBTITLE_FX("うけないくらいじゃくじけない",subtitle_x,subtitle_y,978,1030)
SUBTITLE_N("                             ない",subtitle_x,subtitle_y,1031,1036)
SUBTITLE_FX("ちょっぴり強がり なんでもアリアリ?!",subtitle_x,subtitle_y,1038,1097)
SUBTITLE_FX("根拠はないけど大丈夫",subtitle_x,subtitle_y,1098,1153)

SUBTITLE_FX("寂しい時はすぐ 会いにいくから",subtitle_x,subtitle_y,1157,1261)
SUBTITLE_FX("隠し事はなしだよ",subtitle_x,subtitle_y,1279,1340)
SUBTITLE_FX("「ひとりじゃやっぱりつまんない|みんなでいこうよレッツゴー」",subtitle_x,subtitle_y-subtitle_size,1341,1450)

SUBTITLE_FX("いつもミラクル 信じてミラクル|心は晴れ晴れ満開",subtitle_x,subtitle_y-subtitle_size,1451,1571)
SUBTITLE_FX("今日も明日も ごゆるりゆるゆり",subtitle_x,subtitle_y,1572,1628)
SUBTITLE_FX("いつでもマイペースでいきましょう",subtitle_x,subtitle_y,1629,1693)
SUBTITLE_FX("いまミラクル 迷わずミラクル|愛して咲かせて☆満開",subtitle_x,subtitle_y-subtitle_size,1694,1814)
SUBTITLE_FX("君と毎日 会えるこの奇跡|大好き思いきり伝えるよ",subtitle_x,subtitle_y-subtitle_size,1815,1939)

SUBTITLE_FX("ツンツン デレデレ 鼻血がドバドバ",subtitle_x,subtitle_y,2189,2248)
SUBTITLE_FX("妄想モードに突入よ",subtitle_x,subtitle_y,2249,2301)
SUBTITLE_N("                   よ",subtitle_x,subtitle_y,2302,2307)
SUBTITLE_FX("ムラムラ ホラホラ 脱いだらすごいの",subtitle_x,subtitle_y,2310,2369)
SUBTITLE_FX("お色気勝負はだめですよ～",subtitle_x,subtitle_y,2370,2427)
SUBTITLE_N("                         よ",subtitle_x,subtitle_y,2428,2433)
SUBTITLE_FX("失敗ばっかり ガッカリ しょんぼり",subtitle_x,subtitle_y,2552,2612)
SUBTITLE_FX("めげずにせ～のでいきますよ",subtitle_x,subtitle_y,2613,2666)
SUBTITLE_N("                           よ",subtitle_x,subtitle_y,2667,2672)
SUBTITLE_FX("つっこみ 追い込み 剃り込み 盛り込み",subtitle_x,subtitle_y,2673,2733)
SUBTITLE_FX("主役はやっぱり私です～～～!!",subtitle_x,subtitle_y,2734,2791)

SUBTITLE_FX("足りないことばかりいつでも妄想",subtitle_x,subtitle_y,2793,2907)
SUBTITLE_FX("止められないくらいに",subtitle_x,subtitle_y,2916,2978)
SUBTITLE_FX("「一に妄想 二に妄想|三四はなくて五に妄想」",subtitle_x,subtitle_y-subtitle_size,2979,3085)

SUBTITLE_FX("そうよ!ミラクル くじけずミラクル|恋して夢みて全開",subtitle_x,subtitle_y-subtitle_size,3086,3206)
SUBTITLE_FX("ずっとずっとね まったりゆるゆり",subtitle_x,subtitle_y,3207,3263)
SUBTITLE_FX("一緒にマイペースでいきましょう",subtitle_x,subtitle_y,3264,3328)
SUBTITLE_FX("ほらミラクル キタコレ!ミラクル|愛してばっちり☆満開",subtitle_x,subtitle_y-subtitle_size,3329,3449)
SUBTITLE_FX("君にドキドキ この胸溢れる|想いを伝えてもいいですか",subtitle_x,subtitle_y-subtitle_size,3450,3576)

SUBTITLE_FX("さみしい時はすぐ 会いに来てよね",subtitle_x,subtitle_y,4126,4235)
SUBTITLE_FX("隠し事できないよ",subtitle_x,subtitle_y,4248,4307)
SUBTITLE_FX("「ひとりじゃやっぱりつまんない|みんなで集まれレッツゴー」",subtitle_x,subtitle_y-subtitle_size,4308,4418)

SUBTITLE_FX("いつもミラクル 感じるミラクル|ほんとに大事な存在",subtitle_x,subtitle_y-subtitle_size,4419,4539)
SUBTITLE_FX("今日も明日も ごゆるりゆるゆり",subtitle_x,subtitle_y,4540,4595)
SUBTITLE_FX("一緒にマイペースでいきましょう",subtitle_x,subtitle_y,4596,4661)
SUBTITLE_FX("いまミラクル 迷わずミラクル|愛して咲かせて☆満開",subtitle_x,subtitle_y-subtitle_size,4662,4781)
SUBTITLE_FX("君と毎日 会えるこの奇跡|大好き思いきり伝えるよ",subtitle_x,subtitle_y-subtitle_size,4782,4908)



hint_blink_string="MTV author's room"
hint_blink_string_x=-50
hint_blink_string_y=50
hint_blink_string_first_frame=subtitle_clip_length*2+24
hint_blink_string_last_frame=hint_blink_string_first_frame+Framecount(omake_clip_part03)-48

omake_clip=ConvertToRGB32(omake_clip)
omake_clip=SUBTITLE_FX_SMOOTH_BLINK(omake_clip,hint_blink_string,hint_blink_string_x,hint_blink_string_y,hint_blink_string_first_frame,hint_blink_string_last_frame,subtitle_font,subtitle_effects,subtitle_size,color_yellow,subtitle_halo_color,min_opacity=0.2,max_opacity=0.9)



last++omake_clip

######## Post Processing ########

ConvertToYV12()
#ConvertToYUY2()
#ConvertToRGB24()

TCPServer()
