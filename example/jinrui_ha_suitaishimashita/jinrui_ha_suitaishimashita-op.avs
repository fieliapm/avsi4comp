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

jinrui_ha_suitaishimashita_tv_01=AssumeFPS(FFMS2_VIDEO_SOURCE("src\anime\人類は衰退しました 第01話 「妖精さんの、ひみつのこうじょう」 (TVS 1280x720 x264 AAC 10bit)ver2.mp4"),"ntsc_film")
jinrui_ha_suitaishimashita_tv_02=AssumeFPS(FFMS2_VIDEO_SOURCE("src\anime\人類は衰退しました 第02話 「妖精さんの、ひみつのこうじょう」 (TVS 1280x720 x264 AAC 10bit).mp4"),"ntsc_film")
jinrui_ha_suitaishimashita_tv_03=AssumeFPS(FFMS2_VIDEO_SOURCE("src\anime\人類は衰退しました 第03話 「妖精さんたちの、さぶかる」 (TVS 1280x720 x264 AAC 10bit).mp4"),"ntsc_film")
jinrui_ha_suitaishimashita_tv_04=AssumeFPS(FFMS2_VIDEO_SOURCE("src\anime\人類は衰退しました 第04話 「妖精さんたちの、さぶかる」 (TVS 1280x720 x264 AAC 10bit).mp4"),"ntsc_film")
jinrui_ha_suitaishimashita_tv_05=AssumeFPS(FFMS2_VIDEO_SOURCE("src\anime\人類は衰退しました 第05話 「妖精さんの、おさとがえり」 (MX 1280x720 x264 AAC 10bit).mp4"),"ntsc_film")
jinrui_ha_suitaishimashita_tv_06=AssumeFPS(FFMS2_VIDEO_SOURCE("src\anime\人類は衰退しました 第06話 「妖精さんの、おさとがえり」 (TVS 1280x720 x264 AAC 10bit).mp4"),"ntsc_film")
jinrui_ha_suitaishimashita_tv_07=AssumeFPS(FFMS2_VIDEO_SOURCE("src\anime\人類は衰退しました 第07話 「妖精さんの、じかんかつようじゅつ」 (TVS 1280x720 x264 AAC 10bit).mp4"),"ntsc_film")
jinrui_ha_suitaishimashita_tv_08=AssumeFPS(FFMS2_VIDEO_SOURCE("src\anime\人類は衰退しました 第08話 「妖精さんの、じかんかつようじゅつ」 (MX 1280x720 x264 AAC 10bit).mp4"),"ntsc_film")
jinrui_ha_suitaishimashita_tv_09=AssumeFPS(FFMS2_VIDEO_SOURCE("src\anime\人類は衰退しました 第09話 「妖精さんたちの、ひょうりゅうせいかつ」 (MX 1280x720 x264 AAC 10bit).mp4"),"ntsc_film")
jinrui_ha_suitaishimashita_tv_10=AssumeFPS(FFMS2_VIDEO_SOURCE("src\anime\人類は衰退しました 第10話 「妖精さんたちの、ちきゅう」 (MX 1280x720 x264 AAC 10bit).mp4"),"ntsc_film")
jinrui_ha_suitaishimashita_tv_11=AssumeFPS(FFMS2_VIDEO_SOURCE("src\anime\人類は衰退しました 第11話 「妖精さんの、ひみつのおちゃかい」 (MX 1280x720 x264 AAC 10bit).mp4"),"ntsc_film")
jinrui_ha_suitaishimashita_tv_12=AssumeFPS(FFMS2_VIDEO_SOURCE("src\anime\人類は衰退しました 第12話 「妖精さんの、ひみつのおちゃかい」 (MX 1280x720 x264 AAC 10bit).mp4"),"ntsc_film")



jinrui_ha_suitaishimashita_tv_clean_op=Trim(jinrui_ha_suitaishimashita_tv_01,3093,5250)

jinrui_ha_suitaishimashita_tv_clean_op_part01_dance_01=Trim(jinrui_ha_suitaishimashita_tv_clean_op,0,53) #54
jinrui_ha_suitaishimashita_tv_clean_op_part01_dance_02=Trim(jinrui_ha_suitaishimashita_tv_clean_op,54,104) #51
jinrui_ha_suitaishimashita_tv_clean_op_part01_dance_03=Trim(jinrui_ha_suitaishimashita_tv_clean_op,105,156) #51
jinrui_ha_suitaishimashita_tv_clean_op_part01_dance_04=Trim(jinrui_ha_suitaishimashita_tv_clean_op,157,199) #43
jinrui_ha_suitaishimashita_tv_clean_op_part01_dance_05=Trim(jinrui_ha_suitaishimashita_tv_clean_op,200,214) #14
jinrui_ha_suitaishimashita_tv_clean_op_part02=Trim(jinrui_ha_suitaishimashita_tv_clean_op,215,1137)
jinrui_ha_suitaishimashita_tv_clean_op_part03_pre=Trim(jinrui_ha_suitaishimashita_tv_clean_op,1138,1154)
jinrui_ha_suitaishimashita_tv_clean_op_part03_01=Trim(jinrui_ha_suitaishimashita_tv_clean_op,1155,1271) #117
jinrui_ha_suitaishimashita_tv_clean_op_part03_02=Trim(jinrui_ha_suitaishimashita_tv_clean_op,1272,1386)
jinrui_ha_suitaishimashita_tv_clean_op_part03_03=Trim(jinrui_ha_suitaishimashita_tv_clean_op,1387,1514) #128
jinrui_ha_suitaishimashita_tv_clean_op_part03_04=Trim(jinrui_ha_suitaishimashita_tv_clean_op,1515,1604)
jinrui_ha_suitaishimashita_tv_clean_op_part03_05=Trim(jinrui_ha_suitaishimashita_tv_clean_op,1605,1733) #129
jinrui_ha_suitaishimashita_tv_clean_op_part03_06=Trim(jinrui_ha_suitaishimashita_tv_clean_op,1734,1853)
jinrui_ha_suitaishimashita_tv_clean_op_part03_07=Trim(jinrui_ha_suitaishimashita_tv_clean_op,1854,1980) #127
jinrui_ha_suitaishimashita_tv_clean_op_part04=Trim(jinrui_ha_suitaishimashita_tv_clean_op,1981,2032)
jinrui_ha_suitaishimashita_tv_clean_op_part05=Trim(jinrui_ha_suitaishimashita_tv_clean_op,2033,0)



jinrui_ha_suitaishimashita_tv_01_fairy=Trim(jinrui_ha_suitaishimashita_tv_01,10402,10557) #
jinrui_ha_suitaishimashita_tv_01_minoxidil=Trim(jinrui_ha_suitaishimashita_tv_01,17664,17819)
jinrui_ha_suitaishimashita_tv_01_minoxidil_cm=Trim(jinrui_ha_suitaishimashita_tv_01,18096,18167)
jinrui_ha_suitaishimashita_tv_01_bread_suicide=Trim(jinrui_ha_suitaishimashita_tv_01,33110,33250)

jinrui_ha_suitaishimashita_tv_02_chicken_suicide_01=Trim(jinrui_ha_suitaishimashita_tv_02,27799,27870) #
jinrui_ha_suitaishimashita_tv_02_chicken_suicide_02=Trim(jinrui_ha_suitaishimashita_tv_02,27943,28011) #
jinrui_ha_suitaishimashita_tv_02_chicken_suicide_03=Trim(jinrui_ha_suitaishimashita_tv_02,28012,28095) #

jinrui_ha_suitaishimashita_tv_03_human_monument=Trim(jinrui_ha_suitaishimashita_tv_03,6722,6921) #
jinrui_ha_suitaishimashita_tv_03_comic_renaissance=Trim(jinrui_ha_suitaishimashita_tv_03,25606,25892) #

jinrui_ha_suitaishimashita_tv_04_comic_fx=Trim(jinrui_ha_suitaishimashita_tv_04,9669,9962)
jinrui_ha_suitaishimashita_tv_04_comic_watashi_vs_y=Trim(jinrui_ha_suitaishimashita_tv_04,14074,14254) #
jinrui_ha_suitaishimashita_tv_04_comic_sample=Trim(jinrui_ha_suitaishimashita_tv_04,14755,15090)
jinrui_ha_suitaishimashita_tv_04_comic_sketch=Trim(jinrui_ha_suitaishimashita_tv_04,30702,31016)

jinrui_ha_suitaishimashita_tv_05_pion_fight_01=Trim(jinrui_ha_suitaishimashita_tv_05,34323,34401) #
jinrui_ha_suitaishimashita_tv_05_pion_fight_02=Trim(jinrui_ha_suitaishimashita_tv_05,34402,34434)
jinrui_ha_suitaishimashita_tv_05_pion_fight_03=Trim(jinrui_ha_suitaishimashita_tv_05,34465,34476)

jinrui_ha_suitaishimashita_tv_06_poineer_and_voyager_01=Trim(jinrui_ha_suitaishimashita_tv_06,29831,29926)
jinrui_ha_suitaishimashita_tv_06_poineer_and_voyager_02=Trim(jinrui_ha_suitaishimashita_tv_06,29927,30027)
jinrui_ha_suitaishimashita_tv_06_poineer_and_voyager_03=Trim(jinrui_ha_suitaishimashita_tv_06,30108,30266) #
jinrui_ha_suitaishimashita_tv_06_poineer_and_voyager_04=Trim(jinrui_ha_suitaishimashita_tv_06,30451,30560)
jinrui_ha_suitaishimashita_tv_06_poineer_and_voyager_05=Trim(jinrui_ha_suitaishimashita_tv_06,30585,30635)

jinrui_ha_suitaishimashita_tv_07_multiple_watashi_talk=Trim(jinrui_ha_suitaishimashita_tv_07,31454,31645) #

jinrui_ha_suitaishimashita_tv_08_multiple_watashi_laugh=Trim(jinrui_ha_suitaishimashita_tv_08,28853,28900) #

jinrui_ha_suitaishimashita_tv_09_lake=Trim(jinrui_ha_suitaishimashita_tv_09,6748,6864) #
jinrui_ha_suitaishimashita_tv_09_train=Trim(jinrui_ha_suitaishimashita_tv_09,19364,19545) #

jinrui_ha_suitaishimashita_tv_10_avg=Trim(jinrui_ha_suitaishimashita_tv_10,7474,9619)
jinrui_ha_suitaishimashita_tv_10_super_robot=Trim(jinrui_ha_suitaishimashita_tv_10,28633,28886) #

jinrui_ha_suitaishimashita_tv_11_watashi_run=Trim(jinrui_ha_suitaishimashita_tv_11,28341,28463) #

jinrui_ha_suitaishimashita_tv_12_watashi_no_memory_01=Trim(jinrui_ha_suitaishimashita_tv_12,34966,35458) #
jinrui_ha_suitaishimashita_tv_12_watashi_no_memory_02=Trim(jinrui_ha_suitaishimashita_tv_12,35459,36110) #

######## Pre Combine ########

function STACK_2_2(clip clip){
	stack_clip=StackVertical(StackHorizontal(clip,clip),StackHorizontal(clip,clip))
	return RESIZE_TO_REF_CLIP(stack_clip,clip)
}



jinrui_ha_suitaishimashita_tv_clean_op_part01=jinrui_ha_suitaishimashita_tv_clean_op_part01_dance_01+jinrui_ha_suitaishimashita_tv_clean_op_part01_dance_02+jinrui_ha_suitaishimashita_tv_clean_op_part01_dance_03+jinrui_ha_suitaishimashita_tv_clean_op_part01_dance_04+jinrui_ha_suitaishimashita_tv_clean_op_part01_dance_05

jinrui_ha_suitaishimashita_tv_clean_op_part01_stack_interval=51
jinrui_ha_suitaishimashita_tv_clean_op_part01_stack=TRIM_FIRST_CLIP(jinrui_ha_suitaishimashita_tv_clean_op_part01_dance_01,jinrui_ha_suitaishimashita_tv_clean_op_part01_stack_interval) \
	+STACK_2_2(TRIM_FIRST_CLIP(jinrui_ha_suitaishimashita_tv_clean_op_part01_dance_01,jinrui_ha_suitaishimashita_tv_clean_op_part01_stack_interval)) \
	+STACK_2_2(STACK_2_2(TRIM_FIRST_CLIP(jinrui_ha_suitaishimashita_tv_clean_op_part01_dance_01,jinrui_ha_suitaishimashita_tv_clean_op_part01_stack_interval))) \
	+STACK_2_2(STACK_2_2(STACK_2_2(TRIM_FIRST_CLIP(jinrui_ha_suitaishimashita_tv_clean_op_part01_dance_01,43))))



jinrui_ha_suitaishimashita_tv_clean_op_part03_short=jinrui_ha_suitaishimashita_tv_clean_op_part03_pre+jinrui_ha_suitaishimashita_tv_clean_op_part03_01+TRIM_FIRST_CLIP(jinrui_ha_suitaishimashita_tv_clean_op_part03_03,118)+TRIM_FIRST_CLIP(jinrui_ha_suitaishimashita_tv_clean_op_part03_05,118)+TRIM_FIRST_CLIP(jinrui_ha_suitaishimashita_tv_clean_op_part03_07,118)

jinrui_ha_suitaishimashita_tv_clean_op_part03=jinrui_ha_suitaishimashita_tv_clean_op_part03_01 \
	+jinrui_ha_suitaishimashita_tv_clean_op_part03_02 \
	+jinrui_ha_suitaishimashita_tv_clean_op_part03_03 \
	+jinrui_ha_suitaishimashita_tv_clean_op_part03_04 \
	+jinrui_ha_suitaishimashita_tv_clean_op_part03_05 \
	+jinrui_ha_suitaishimashita_tv_clean_op_part03_06 \
	+jinrui_ha_suitaishimashita_tv_clean_op_part03_07



jinrui_ha_suitaishimashita_tv_02_chicken_suicide=jinrui_ha_suitaishimashita_tv_02_chicken_suicide_01+jinrui_ha_suitaishimashita_tv_02_chicken_suicide_02+jinrui_ha_suitaishimashita_tv_02_chicken_suicide_03

######## Combine ########

# jinrui_ha_suitaishimashita_tv_clean_op_part01 25
# jinrui_ha_suitaishimashita_tv_clean_op_part03 3228

fade_length=8

jinrui_ha_suitaishimashita_tv_op_t01=BlankClip(jinrui_ha_suitaishimashita_tv_clean_op,length=25,color=color_black)+jinrui_ha_suitaishimashita_tv_clean_op_part01+jinrui_ha_suitaishimashita_tv_clean_op_part02
jinrui_ha_suitaishimashita_tv_op_t02=jinrui_ha_suitaishimashita_tv_clean_op_part03_short

jinrui_ha_suitaishimashita_tv_op_t03=TRIM_FIRST_CLIP(jinrui_ha_suitaishimashita_tv_09_train,58)+TRIM_MIDDLE_CLIP(jinrui_ha_suitaishimashita_tv_09_lake,59)+TRIM_LAST_CLIP(jinrui_ha_suitaishimashita_tv_11_watashi_run,118) \
	+TRIM_MIDDLE_CLIP(jinrui_ha_suitaishimashita_tv_01_fairy,117)+TRIM_MIDDLE_CLIP(jinrui_ha_suitaishimashita_tv_10_super_robot,118) \
	+TRIM_MIDDLE_CLIP(jinrui_ha_suitaishimashita_tv_06_poineer_and_voyager_03,58)+TRIM_LAST_CLIP(jinrui_ha_suitaishimashita_tv_05_pion_fight_01,59)+TRIM_MIDDLE_CLIP(jinrui_ha_suitaishimashita_tv_04_comic_watashi_vs_y,117)

jinrui_ha_suitaishimashita_tv_op_t04=DOUBLE_FADE_WITH_BRIGHTNESS_OFFSET_RGB24(TRIM_MIDDLE_CLIP(jinrui_ha_suitaishimashita_tv_03_human_monument,176),TRIM_MIDDLE_CLIP(jinrui_ha_suitaishimashita_tv_02_chicken_suicide,176),fade_length,fade_length) \
	+TRIM_MIDDLE_CLIP(jinrui_ha_suitaishimashita_tv_07_multiple_watashi_talk,176)+FADE_OUT_WITH_BRIGHTNESS_OFFSET_RGB24(TRIM_MIDDLE_CLIP(jinrui_ha_suitaishimashita_tv_03_comic_renaissance,131),fade_length)

jinrui_ha_suitaishimashita_tv_op_t05=jinrui_ha_suitaishimashita_tv_clean_op_part01_stack+TRIM_FIRST_CLIP(jinrui_ha_suitaishimashita_tv_08_multiple_watashi_laugh,18)
jinrui_ha_suitaishimashita_tv_op_t06=jinrui_ha_suitaishimashita_tv_clean_op_part03+jinrui_ha_suitaishimashita_tv_clean_op_part04+TRIM_LAST_CLIP(jinrui_ha_suitaishimashita_tv_12_watashi_no_memory_01,62)

parameter_t07=40
jinrui_ha_suitaishimashita_tv_op_t07=Dissolve(TRIM_FIRST_CLIP(jinrui_ha_suitaishimashita_tv_12_watashi_no_memory_02,Framecount(jinrui_ha_suitaishimashita_tv_12_watashi_no_memory_02)-parameter_t07),jinrui_ha_suitaishimashita_tv_clean_op_part05,56-parameter_t07)+BlankClip(jinrui_ha_suitaishimashita_tv_clean_op,length=24*6,color=color_black)


jinrui_ha_suitaishimashita_tv_op_mute=jinrui_ha_suitaishimashita_tv_op_t01+DOUBLE_FADE_WITH_BRIGHTNESS_OFFSET_RGB24(DOUBLE_FADE_WITH_BRIGHTNESS_OFFSET_RGB24(jinrui_ha_suitaishimashita_tv_op_t02,jinrui_ha_suitaishimashita_tv_op_t03,fade_length,fade_length),jinrui_ha_suitaishimashita_tv_op_t04,fade_length,fade_length)+jinrui_ha_suitaishimashita_tv_op_t05+jinrui_ha_suitaishimashita_tv_op_t06+jinrui_ha_suitaishimashita_tv_op_t07

######## Music ########

bgm_48khz=SSRC(WAVSource("src\jinrui_ha_suitaishimashita-op-cd-01.wav"),48000)
AudioDub(jinrui_ha_suitaishimashita_tv_op_mute,bgm_48khz)

######## Subtitle ########

subtitle_x=50
subtitle_y=400
global subtitle_front_fade_count=12
global subtitle_rear_fade_count=24
global subtitle_font="MS Gothic"
global subtitle_effects="bi"
global subtitle_size=28
global subtitle_text_color=OVERWRITE_COLOR_ALPHA(color_pink,$2F)
global subtitle_halo_color=color_black

function SUBTITLE_FX(clip clip,string text,float x,float y,int start_frame,int end_frame,bool "is_title"){
	is_title=Default(is_title,false)

	text_color=is_title?color_gold:subtitle_text_color

	return SUBTITLE_FX_SLIDE_IN_WATER_OUT(clip,text,x,y,start_frame,end_frame,subtitle_front_fade_count,subtitle_rear_fade_count,subtitle_font,subtitle_effects,subtitle_size,text_color,subtitle_halo_color)
}

SUBTITLE_FX("リアルワールド//nano.RIPE|- by fielia@AVISynth",subtitle_x,subtitle_y-subtitle_size,242,418,true)

SUBTITLE_FX("目が覚めたならきみが笑ってそんな世界が続くと思ってた",subtitle_x,subtitle_y,471,703)
SUBTITLE_FX("当たり前には少し足りない歪んだ視界から見てた青い夜",subtitle_x,subtitle_y,706,932)

SUBTITLE_FX("何度目の朝で打ち明けた恋のように",subtitle_x,subtitle_y,933,1057)
SUBTITLE_FX("少し酸っぱいままで出掛けたら",subtitle_x,subtitle_y,1058,1157)

SUBTITLE_FX("近付いてくぼくらデリケート 淡い夢を見せてあげよう",subtitle_x,subtitle_y,1158,1317)
SUBTITLE_FX("たまにはいいことあるかも",subtitle_x,subtitle_y,1318,1405)
SUBTITLE_FX("ご褒美にはチョコレート 甘い夢を見れたら",subtitle_x,subtitle_y,1406,1534)
SUBTITLE_FX("それがすべてだなんて笑ってみよう",subtitle_x,subtitle_y,1535,1631)

SUBTITLE_FX("曖昧だって大体だって続く気がして夜空を仰いだ",subtitle_x,subtitle_y,1645,1878)
SUBTITLE_FX("なんとなくから見えた景色が新しい世界へほらね導くよ",subtitle_x,subtitle_y,1880,2109)

SUBTITLE_FX("回り続けるこの星はだれのもの?",subtitle_x,subtitle_y,2110,2231)
SUBTITLE_FX("難しいハナシなら食後にして",subtitle_x,subtitle_y,2232,2332)

SUBTITLE_FX("近付いてくぼくらのデリケート 淡い夢を見せてあげよう",subtitle_x,subtitle_y,3205,3366)
SUBTITLE_FX("たまにはいいことあるかも",subtitle_x,subtitle_y,3367,3453)
SUBTITLE_FX("ご褒美にはチョコレート 甘い夢を見れたら",subtitle_x,subtitle_y,3454,3581)
SUBTITLE_FX("それがすべてだなんて笑い飛ばそう",subtitle_x,subtitle_y,3582,3673)

SUBTITLE_FX("あの丘まで進めストレート 見えない音に耳傾け",subtitle_x,subtitle_y,3674,3836)
SUBTITLE_FX("聴こえた?手招きする声",subtitle_x,subtitle_y,3837,3922)
SUBTITLE_FX("いくつかのバリケード壊せ 知れば知るほど",subtitle_x,subtitle_y,3923,4051)
SUBTITLE_FX("わからなくもなるくらい不思議な世界",subtitle_x,subtitle_y,4052,4150)

######## Post Processing ########

ConvertToYV12()
#ConvertToYUY2()
#ConvertToRGB24()

TCPServer()
