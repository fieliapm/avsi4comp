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

Import("new_game-tv-common.avsi")

######## Pre Combine ########

fade_length=12

pip_length=74
fairies_story_3_pip_01=TRIM_FIRST_CLIP(new_game_tv_07_modeling_sofia,pip_length)
fairies_story_3_pip_02=TRIM_LAST_CLIP(new_game_tv_08_game_event_sofia_meet_thieves_01,pip_length)
fairies_story_3_pip_01=ScriptClip(fairies_story_3_pip_01,"FAST_ZOOM(srcx=0.0,srcy=0.0,dstx=0.0,dsty=0.0+Spline(current_frame,0,Height()/8.0,Framecount()-1,0.0,cubic=false),factor=0.6)")
fairies_story_3_pip_02=ScriptClip(fairies_story_3_pip_02,"FAST_ZOOM(srcx=Width(fairies_story_3_pip_02),srcy=Height(fairies_story_3_pip_02),dstx=Width(fairies_story_3_pip_02),dsty=Height(fairies_story_3_pip_02)-Spline(current_frame,0,Height()/8.0,Framecount()-1,0.0,cubic=false),factor=0.6)")
fairies_story_3_pip=Overlay(fairies_story_3_pip_01,fairies_story_3_pip_02,mode="Add")
fairies_story_3_pip=FrameEvaluate(fairies_story_3_pip,"OL_opacity_offset=Spline(current_frame,0,-1.0,39-fade_length,-1.0,39,0.0,Framecount()-1,0.0,cubic=false)")

######## Combine ########

# new_game_tv_clean_op_01 17
# new_game_tv_clean_op_04 2626
# new_game_tv_clean_op_05 4504
# new_game_tv_clean_op_06 5269



new_game_tv_op_t01=BlankClip(new_game_tv_clean_op,length=17,color=color_black)+new_game_tv_clean_op_01+new_game_tv_clean_op_02

new_game_tv_op_t02=new_game_tv_clean_op_03
new_game_tv_op_t03=TRIM_MIDDLE_CLIP(new_game_tv_11_hifumi_cosplay,69)+TRIM_MIDDLE_CLIP(new_game_tv_03_yun_stretch_out_hand,70)+TRIM_LAST_CLIP(new_game_tv_09_nene_imitate_dandy,69)+TRIM_LAST_CLIP(new_game_tv_07_yun_happy,70)+TRIM_MIDDLE_CLIP(new_game_tv_05_hajime_nyan,65) \
new_game_tv_op_t04=TRIM_FIRST_CLIP(new_game_tv_02_hifumi_aoba_yun_hajime_eat_afternoon_tea,70)+TRIM_FIRST_CLIP(new_game_tv_11_kou_another_style_talk,70)+TRIM_MIDDLE_CLIP(new_game_tv_10_aoba_run_in_train,70)+TRIM_LAST_CLIP(new_game_tv_02_shizuku_catch_cat_s_hand_and_wave,69) \
	+TRIM_LAST_CLIP(new_game_tv_05_rin_angry,70)+TRIM_LAST_CLIP(new_game_tv_01_hajime_research_character_action,70)+TRIM_MIDDLE_CLIP(new_game_tv_02_hifumi_take_money_01,70)+TRIM_LAST_CLIP(new_game_tv_07_nene_lie_on_bed,74)

new_game_tv_op_t05=TRIM_MIDDLE_CLIP(new_game_tv_02_rin_is_drunk,139)+TRIM_LAST_CLIP(new_game_tv_01_aoba_meet_kou,140)

new_game_tv_op_t06=TRIM_MIDDLE_CLIP(new_game_tv_08_nene_jump,69)+TRIM_MIDDLE_CLIP(new_game_tv_04_rin_and_kou_wear_pantie_only_and_lie,70)+TRIM_LAST_CLIP(new_game_tv_06_yun_take_care_of_sister_and_brother,70)+TRIM_FIRST_CLIP(new_game_tv_07_umiko_change_gun,71)
new_game_tv_op_t07=new_game_tv_clean_op_04
new_game_tv_op_t08=TRIM_FIRST_CLIP(new_game_tv_01_umiko_shoot_shizuku,69)+TRIM_MIDDLE_CLIP(new_game_tv_08_nene_watch_figure_and_kirakira,70)+TRIM_MIDDLE_CLIP(new_game_tv_04_hajime_show_lightsaber,70)+TRIM_FIRST_CLIP(new_game_tv_12_karen_cosplay_03,69) \
	+TRIM_LAST_CLIP(new_game_tv_06_kou_stand_after_wall,70)+TRIM_LAST_CLIP(new_game_tv_09_yun_love_love,70)+TRIM_LAST_CLIP(new_game_tv_10_umiko_and_tired_programmer,69)+TRIM_MIDDLE_CLIP(new_game_tv_08_shizuku_take_photo_with_nene_and_aoba_02,74)

new_game_tv_op_t09=TRIM_FIRST_CLIP(new_game_tv_03_aoba_s_leg,139)+TRIM_MIDDLE_CLIP(new_game_tv_09_hifumi_take_shower_01,140)
new_game_tv_op_t10=TRIM_LAST_CLIP(new_game_tv_09_hajime_research_character_action,66)+TRIM_MIDDLE_CLIP(new_game_tv_10_demon_aoba,74)+TRIM_MIDDLE_CLIP(new_game_tv_06_aoba_strip_clothes_02,65)+TRIM_MIDDLE_CLIP(new_game_tv_12_seiyuu_demo_magical_girl,70)+TRIM_MIDDLE_CLIP(new_game_tv_04_rin_wear_pantie_only,70)

new_game_tv_op_t11=TRIM_MIDDLE_CLIP(new_game_tv_11_tgs_makuhari_messe_outside,35)+TRIM_MIDDLE_CLIP(new_game_tv_11_tgs_makuhari_messe_inside_01,35)+TRIM_MIDDLE_CLIP(new_game_tv_12_kou_see_upside,70)+TRIM_MIDDLE_CLIP(new_game_tv_10_aoba_watch_nene_fly,73)+TRIM_LAST_CLIP(new_game_tv_03_yun_catch_aoba_s_hand,70)+TRIM_LAST_CLIP(new_game_tv_06_magical_girl_transform,66)
new_game_tv_op_t12=Dissolve(new_game_tv_clean_op_05,FADE_OUT_WITH_BRIGHTNESS_OFFSET_RGB24(TRIM_MIDDLE_CLIP(new_game_tv_12_kou_and_aoba_watch_fairies_story_3_poster,fade_length+76),fade_length),fade_length)
new_game_tv_op_t13=TRIM_FIRST_CLIP(new_game_tv_05_tweak_animation,66)+TRIM_FIRST_CLIP(fairies_story_3_pip,74) \
	+Dissolve(TRIM_LAST_CLIP(new_game_tv_01_sakura_night,63+fade_length),new_game_tv_clean_op_06,fade_length)+BlankClip(new_game_tv_clean_op,length=24*5,color=color_black)



new_game_tv_op_mute=new_game_tv_op_t01 \
	+new_game_tv_op_t02+new_game_tv_op_t03+new_game_tv_op_t04 \
	+new_game_tv_op_t05 \
	+new_game_tv_op_t06+new_game_tv_op_t07+new_game_tv_op_t08 \
	+new_game_tv_op_t09+new_game_tv_op_t10 \
	+new_game_tv_op_t11+new_game_tv_op_t12+new_game_tv_op_t13

new_game_tv_op_mute

### export clip: new_game_tv_op_mute

### prefetch: 5,2

### ###

######## Subtitle ########

### inherit start ###

#global subtitle_clip_halo_width=1
global subtitle_clip_width=428
global subtitle_clip_height=240

subtitle_x=50*0.5
subtitle_y=400*0.5
global subtitle_front_fade_count=24
global subtitle_rear_fade_count=24
global subtitle_font="MS Gothic"
global subtitle_effects="b"
global subtitle_size=28*0.5
global subtitle_text_color=color_white
global subtitle_halo_color=color_darkcyan
global subtitle_mosaic_factor=64

function SUBTITLE_FX(clip clip,string text,float x,float y,int start_frame,int end_frame,bool "is_title"){
	is_title=Default(is_title,false)

	halo_color=is_title?color_mediumpurple:subtitle_halo_color

	return SUBTITLE_FX_MOSAIC_FADE_IN_MOSAIC_FADE_OUT(clip,text,Round(x),Round(y),start_frame,end_frame,subtitle_front_fade_count,subtitle_rear_fade_count,subtitle_font,subtitle_effects,Round(subtitle_size),subtitle_text_color,halo_color)
}

function SUBTITLE_N(clip clip,string text,int "x",int "y",int "first_frame",int "last_frame",bool "is_title"){
	is_title=Default(is_title,false)
	x=Default(x,subtitle_clip_width/2)

	halo_color=is_title?color_red:subtitle_halo_color
	size=is_title?subtitle_size*2:subtitle_size
	y=is_title?subtitle_clip_height/2:y

	return SUBTITLE_NORMAL(clip,text,x,y,first_frame,last_frame,subtitle_font,subtitle_effects+"c",Round(size),subtitle_text_color,halo_color)
}

### inherit end ###

SUBTITLE_FX("めぐりめぐってEveryone",subtitle_x,subtitle_y-subtitle_size,312,383)
SUBTITLE_FX("何かが待っているのかな?",subtitle_x,subtitle_y,382,451)
SUBTITLE_FX("強くなれる",subtitle_x,subtitle_y-subtitle_size,452,490)
SUBTITLE_FX("そう君は1人じゃないよ",subtitle_x,subtitle_y,486,560)
SUBTITLE_FX("Stand up★",subtitle_x,subtitle_y-subtitle_size,556,591)

SUBTITLE_FX("何気ないような朝がきた",subtitle_x,subtitle_y-subtitle_size,874,946)
SUBTITLE_FX("おふとんが いとしいな",subtitle_x,subtitle_y,945,1020)
SUBTITLE_FX("楽しい1日になるよ",subtitle_x,subtitle_y-subtitle_size,1015,1086)
SUBTITLE_FX("走り出しそう",subtitle_x,subtitle_y,1084,1141)

SUBTITLE_FX("遠い日々 変わってった景色",subtitle_x,subtitle_y-subtitle_size,1154,1268)
SUBTITLE_FX("さぁ大切な場所手に入れたら",subtitle_x,subtitle_y,1265,1438)

SUBTITLE_FX("めぐりめぐってEveryone",subtitle_x,subtitle_y-subtitle_size,1498,1569)
SUBTITLE_FX("何かが待っているはずだ",subtitle_x,subtitle_y,1568,1636)
SUBTITLE_FX("強くなれるよ 1人じゃない",subtitle_x,subtitle_y-subtitle_size,1637,1706)
SUBTITLE_FX("イマジネーション越えよう!",subtitle_x,subtitle_y,1708,1777)

SUBTITLE_FX("めぐりめぐるよEveryday",subtitle_x,subtitle_y-subtitle_size,1777,1847)
SUBTITLE_FX("勇気をもっと掴んだら",subtitle_x,subtitle_y,1847,1915)
SUBTITLE_FX("笑顔をぎゅっと詰め込んで",subtitle_x,subtitle_y-subtitle_size,1917,1986)
SUBTITLE_FX("熱いキモチでのっていこう!",subtitle_x,subtitle_y,1987,2058)

### pass clip: new_game_tv_op_mute

### prefetch: 5,2

### ###

SUBTITLE_FX("一緒に過ごせるあの場所",subtitle_x,subtitle_y-subtitle_size,2339,2409)
SUBTITLE_FX("到着まであと少し",subtitle_x,subtitle_y,2410,2483)
SUBTITLE_FX("はなまるな1日にしよう",subtitle_x,subtitle_y-subtitle_size,2479,2550)
SUBTITLE_FX("全力だそう",subtitle_x,subtitle_y,2548,2606)

SUBTITLE_FX("嬉しいこと悔しいこともぜんぜんぶ",subtitle_x,subtitle_y-subtitle_size,2618,2756)
SUBTITLE_FX("力に変えて前向いたら",subtitle_x,subtitle_y,2757,2901)

SUBTITLE_FX("めぐりめぐってEveryone",subtitle_x,subtitle_y-subtitle_size,2962,3034)
SUBTITLE_FX("何かが待っているのかな?",subtitle_x,subtitle_y,3032,3101)
SUBTITLE_FX("強くなれる",subtitle_x,subtitle_y-subtitle_size,3102,3141)
SUBTITLE_FX("そう君は1人じゃないよ",subtitle_x,subtitle_y,3137,3210)
SUBTITLE_FX("Stand up★",subtitle_x,subtitle_y-subtitle_size,3206,3241)

SUBTITLE_FX("めぐりめぐるよEveryday",subtitle_x,subtitle_y-subtitle_size,3241,3313)
SUBTITLE_FX("青い季節は輝いて",subtitle_x,subtitle_y,3312,3380)
SUBTITLE_FX("わくわくが溢れてくよ",subtitle_x,subtitle_y-subtitle_size,3381,3451)
SUBTITLE_FX("限界塗り替えていこう!",subtitle_x,subtitle_y,3451,3522)

### pass clip: new_game_tv_op_mute

### prefetch: 5,2

### ###

SUBTITLE_FX("ユメのユメのユメの先",subtitle_x,subtitle_y,4148,4219)
SUBTITLE_FX("ジャンプをしたその先も",subtitle_x,subtitle_y-subtitle_size,4218,4287)
SUBTITLE_FX("同じ想い重ねて進んでいこう!",subtitle_x,subtitle_y,4289,4438)

SUBTITLE_FX("めぐりめぐってEveryone",subtitle_x,subtitle_y-subtitle_size,4496,4568)
SUBTITLE_FX("何かが待っているはずだ",subtitle_x,subtitle_y,4566,4636)
SUBTITLE_FX("強くなれるよ 1人じゃない",subtitle_x,subtitle_y-subtitle_size,4637,4705)
SUBTITLE_FX("イマジネーション越えよう!",subtitle_x,subtitle_y,4707,4776)

SUBTITLE_FX("めぐりめぐるよEveryday",subtitle_x,subtitle_y-subtitle_size,4776,4847)
SUBTITLE_FX("勇気をもっと掴んだら",subtitle_x,subtitle_y,4846,4914)
SUBTITLE_FX("笑顔をぎゅっと詰めこんで",subtitle_x,subtitle_y-subtitle_size,4916,4986)
SUBTITLE_FX("熱いキモチでのっていこう!",subtitle_x,subtitle_y,4986,5057)

# start_frame 5270 or 5345
SUBTITLE_FX("SAKURAスキップ//fourfolium|    (涼風青葉(CV:高田憂希),滝本ひふみ(CV:山口愛),|    篠田はじめ(CV:戸田めぐみ),飯島ゆん(CV:竹尾歩美))|- by                                fielia@AVISynth",subtitle_x,subtitle_x,5270,5418,true)
SUBTITLE_FX("     寫程式編輯影音的遊戲程式設計師",subtitle_x,subtitle_x+subtitle_size*3,5270,5418,false)

######## Preface ########

Import("new_game-tv-common-cross_process.avsi")

kyou_mo_ichinichi_ganbaruzoi_audio=FadeIn0(FadeOut0(Normalize(new_game_tv_04_aoba_kyou_mo_ichinichi_ganbaruzoi_full),3),3)
kyou_mo_ichinichi_ganbaruzoi=AudioDub(new_game_tv_04_aoba_kyou_mo_ichinichi_ganbaruzoi_full,kyou_mo_ichinichi_ganbaruzoi_audio)

kyou_mo_ichinichi_ganbaruzoi=SUBTITLE_N(kyou_mo_ichinichi_ganbaruzoi,"今日も一日がんばるぞい",first_frame=107,last_frame=158)

######## Thumbnail ########

is_thumbnail=false

is_thumbnail?ConvertToRGB32(new_game_tv_op_mute):last

######## Music ########

bgm_48khz=SSRC(WAVSource("src\01 - SAKURA SKIP.wav"),48000)
#bgm_48khz=SSRC(WAVSource("src\1.SAKURAスキップ(TVアニメ「NEW GAME!」　OPテーマ).wav"),48000)
AudioDub(bgm_48khz)



thumbnail=Trim(2850,-24*5)
#thumbnail=Trim(3690,-24*5)



kyou_mo_ichinichi_ganbaruzoi++Trim(17,0)



is_thumbnail?thumbnail:last

""")

######## Post Processing ########

ConvertToYV12()
#ConvertToYUY2()
#ConvertToRGB24()

TCPServer(22052)
