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

######## Function ########

function ROTATE_CG(clip cg,float center_x,float center_y,float angle_start,float angle_end,float scale){
	cg_frame_count=Framecount(cg)

	return ConvertToYV12(Zoom(ConvertToRGB32(cg),srcx=String(center_x),srcy=String(center_y),factor=String(scale),angle="Spline(n,0,"+String(angle_start)+","+String(cg_frame_count)+","+String(angle_end)+")"))
}

function SCALE_CG(clip cg,float center_x,float center_y,float scale_start,float scale_end){
	cg_frame_count=Framecount(cg)

	return ScriptClip(cg,"FAST_ZOOM(srcx="+String(center_x)+",srcy="+String(center_y)+",dstx="+String(center_x)+",dsty="+String(center_y)+",factor=Spline(current_frame,0,"+String(scale_start)+","+String(cg_frame_count)+","+String(scale_end)+"))")
}

function MOVE_CG(clip cg,int dir_x,int dir_y,float move_offset,float scale){
	cg_frame_count=Framecount(cg)
	cg_width_half=Width(cg)/2
	cg_height_half=Height(cg)/2
	move_offset_half=move_offset*0.5

	return ScriptClip(cg,"FAST_ZOOM(dstx=Spline(current_frame,0,"+String(cg_width_half)+"-("+String(move_offset_half)+"*("+String(dir_x)+")),"+String(cg_frame_count)+","+String(cg_width_half)+"+("+String(move_offset_half)+"*("+String(dir_x)+")),cubic=false)," \
		+"dsty=Spline(current_frame,0,"+String(cg_height_half)+"-("+String(move_offset_half)+"*("+String(dir_y)+")),"+String(cg_frame_count)+","+String(cg_height_half)+"+("+String(move_offset_half)+"*("+String(dir_y)+")),cubic=false),factor="+String(scale)+",extend=true)")
}

function FORWARD_REVERSE_LOOP_VIDEO(clip clip){
	return clip+Reverse(clip)
}

######## Pre Combine ########

fade_length=12

pip_length=167+fade_length
fairies_story_3_pip_01=TRIM_FIRST_CLIP(new_game_tv_08_game_event_sofia_meet_thieves_02,pip_length)
fairies_story_3_pip_02=STILL_LAST_FRAME(new_game_tv_06_village_in_game,pip_length)
fairies_story_3_pip_01=ScriptClip(fairies_story_3_pip_01,"FAST_ZOOM(srcx=0.0,srcy=0.0,dstx=0.0,dsty=0.0+Spline(current_frame,0,Height()/8.0,Framecount()-1,0.0,cubic=false),factor=0.6)")
fairies_story_3_pip_02=ScriptClip(fairies_story_3_pip_02,"FAST_ZOOM(srcx=Width(fairies_story_3_pip_02),srcy=Height(fairies_story_3_pip_02),dstx=Width(fairies_story_3_pip_02),dsty=Height(fairies_story_3_pip_02)-Spline(current_frame,0,Height()/8.0,Framecount()-1,0.0,cubic=false),factor=0.6)")
fairies_story_3_pip=Overlay(fairies_story_3_pip_01,fairies_story_3_pip_02,mode="Add")
fairies_story_3_pip=FrameEvaluate(fairies_story_3_pip,"OL_opacity_offset=Spline(current_frame,0,-1.0,39-fade_length,-1.0,39,0.0,Framecount()-1,0.0,cubic=false)")

new_game_tv_04_rin_and_kou_lie_in_sauna_pre=new_game_tv_04_kou_ero+new_game_tv_04_rin_ero
new_game_tv_04_rin_and_kou_lie_in_sauna_extend=new_game_tv_04_rin_and_kou_lie_in_sauna_pre+MOVE_CG(STILL_MIDDLE_FRAME(new_game_tv_04_rin_and_kou_lie_in_sauna,244-Framecount(new_game_tv_04_rin_and_kou_lie_in_sauna_pre)),0,-1,72.0,1.1)

loop_join_length=6
new_game_tv_12_aoba_catch_kou_s_hand_01_loop_base=Trim(new_game_tv_12_aoba_catch_kou_s_hand_01,17,-(40+loop_join_length))
new_game_tv_12_aoba_catch_kou_s_hand_01_loop_base_cache02=Trim(new_game_tv_12_aoba_catch_kou_s_hand_01_cache02,17,-(40+loop_join_length))
new_game_tv_12_aoba_catch_kou_s_hand_01_loop=Dissolve(new_game_tv_12_aoba_catch_kou_s_hand_01_loop_base,new_game_tv_12_aoba_catch_kou_s_hand_01_loop_base_cache02,new_game_tv_12_aoba_catch_kou_s_hand_01_loop_base,new_game_tv_12_aoba_catch_kou_s_hand_01_loop_base_cache02,new_game_tv_12_aoba_catch_kou_s_hand_01_loop_base,loop_join_length)

######## Combine ########

# new_game_tv_clean_ed_01 17
# new_game_tv_clean_ed_03 4853
# new_game_tv_clean_ed_04 5504



new_game_tv_ed_t01=BlankClip(new_game_tv_clean_ed,length=17,color=color_black)+new_game_tv_clean_ed_01

new_game_tv_ed_t02=new_game_tv_clean_ed_02
new_game_tv_ed_t03=TRIM_FIRST_CLIP(new_game_tv_04_rin_and_kou_lie_in_sauna_extend,244)+MOVE_CG(STILL_FIRST_FRAME(new_game_tv_09_yun_hajime_hifumi_aoba_after_bath,239),-1,0,128.0,1.1)

new_game_tv_ed_t04=SCALE_CG(EXTEND_ANIMATION_CG(FORWARD_REVERSE_LOOP_VIDEO(Trim(new_game_tv_11_nene_kirakira,53,0)),239),960.0,360.0,1.3,1.0)

new_game_tv_ed_t05=SCALE_CG(STILL_LAST_FRAME(new_game_tv_02_aoba_see_cocktail,238),320.0,360.0,1.0,1.3)+ROTATE_CG(EXTEND_ANIMATION_CG(FORWARD_REVERSE_LOOP_VIDEO(Trim(new_game_tv_11_kou_another_style_01,56,57)),239),640.0,360.0,-10.0,10.0,1.3)
new_game_tv_ed_t06=MOVE_CG(STILL_MIDDLE_FRAME(new_game_tv_02_hifumi_sit_down,238),1,0,128.0,1.1)+MOVE_CG(TRIM_FIRST_CLIP(new_game_tv_12_aoba_catch_kou_s_hand_01_loop,179),0,1,72.0,1.1)+FADE_OUT_WITH_BRIGHTNESS_OFFSET_RGB24(ROTATE_CG(EXTEND_ANIMATION_CG(FORWARD_REVERSE_LOOP_VIDEO(Trim(new_game_tv_12_aoba_catch_kou_s_hand_02,0,92)),112),640.0,360.0,10.0,-10.0,1.3),fade_length)
new_game_tv_ed_t07=MOVE_CG(TRIM_FIRST_CLIP(new_game_tv_01_hifumi_hajime_yun_aoba_eat_dessert,245),1,0,128.0,1.1)+MOVE_CG(STILL_FRAME(new_game_tv_07_umiko_shoot_kou,47,239),-1,0,128.0,1.1)

new_game_tv_ed_t08=SCALE_CG(STILL_FIRST_FRAME(new_game_tv_01_aoba_twin_tail,239),320.0,360.0,1.3,1.0)
new_game_tv_ed_t09=ROTATE_CG(TRIM_FIRST_CLIP(new_game_tv_06_aoba_watched_by_kou,119),640.0,360.0,-10.0,10.0,1.3)+TRIM_MIDDLE_CLIP(new_game_tv_05_rin_and_kou_in_photo_02,120)+MOVE_CG(STILL_MIDDLE_FRAME(new_game_tv_10_little_aoba_keep_nene_s_safe,178),0,-1,72.0,1.1)+SCALE_CG(STILL_LAST_FRAME(new_game_tv_08_rin_see_purin_and_smile,172),640.0,360.0,1.0,1.3)

new_game_tv_ed_t10=MOVE_CG(STILL_FIRST_FRAME(new_game_tv_06_yun_play_game,246),0,1,72.0,1.1)+MOVE_CG(STILL_FRAME(new_game_tv_03_nene_lie_on_bed,91,112),1,0,128.0,1.1)+TRIM_FIRST_CLIP(new_game_tv_02_hifumi_excited,53)+TRIM_LAST_CLIP(new_game_tv_10_shizuku_loop_sweet_and_salty,22)+TRIM_MIDDLE_CLIP(new_game_tv_08_umiko_make_nene_nervous,22)+FADE_OUT_WITH_BRIGHTNESS_OFFSET_RGB24(TRIM_LAST_CLIP(new_game_tv_05_hajime_cry_and_run_away,23),fade_length)
new_game_tv_ed_t11=Dissolve(new_game_tv_clean_ed_03,FADE_OUT_WITH_BRIGHTNESS_OFFSET_RGB24(MOVE_CG(STILL_MIDDLE_FRAME(new_game_tv_03_aoba_sleeping,fade_length+131),-1,0,128.0,1.1),fade_length),fade_length)
new_game_tv_ed_t12=Dissolve(TRIM_FIRST_CLIP(fairies_story_3_pip,167+fade_length),new_game_tv_clean_ed_04,fade_length)+BlankClip(new_game_tv_clean_ed,length=24*4,color=color_black)



new_game_tv_ed_mute=new_game_tv_ed_t01 \
	+new_game_tv_ed_t02+new_game_tv_ed_t03 \
	+new_game_tv_ed_t04 \
	+new_game_tv_ed_t05+new_game_tv_ed_t06+new_game_tv_ed_t07 \
	+new_game_tv_ed_t08+new_game_tv_ed_t09 \
	+new_game_tv_ed_t10+new_game_tv_ed_t11+new_game_tv_ed_t12

new_game_tv_ed_mute

### export clip: new_game_tv_ed_mute

### prefetch: 5,2

### ###

######## Subtitle ########

### inherit start ###

#global subtitle_clip_halo_width=1
global subtitle_clip_width=428
global subtitle_clip_height=240

subtitle_x=50*0.5
subtitle_y=395*0.5
global subtitle_front_fade_count=24
global subtitle_rear_fade_count=24
global subtitle_font="MS Gothic"
global subtitle_effects="b"
global subtitle_size=32*0.5
global subtitle_text_color=color_white
global subtitle_halo_color=color_darkcyan
global subtitle_mosaic_factor=64

function SUBTITLE_FX(clip clip,string text,float x,float y,int start_frame,int end_frame,bool "is_title_color",bool "is_title_size"){
	is_title_color=Default(is_title_color,false)
	is_title_size=Default(is_title_size,false)

	halo_color=is_title_color?color_mediumpurple:subtitle_halo_color
	size=is_title_size?subtitle_size*0.875:subtitle_size

	return SUBTITLE_FX_MOSAIC_IN_MOSAIC_OUT(clip,text,Round(x),Round(y),start_frame,end_frame,subtitle_front_fade_count,subtitle_rear_fade_count,subtitle_font,subtitle_effects,Round(size),subtitle_text_color,halo_color)
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

SUBTITLE_FX("日曜日が少し物足りないワケ",subtitle_x,subtitle_y-subtitle_size,328,448)
SUBTITLE_FX("一番星、キラキラ光って気付いた",subtitle_x,subtitle_y,448,567)
SUBTITLE_FX("待ちきれない明日へのキモチ",subtitle_x,subtitle_y-subtitle_size,566,672)
SUBTITLE_FX("それはきっと、そうきっと",subtitle_x,subtitle_y,667,731)
SUBTITLE_FX("恋するキモチ",subtitle_x,subtitle_y-subtitle_size,731,795)

SUBTITLE_FX("みんな集合の場所で",subtitle_x,subtitle_y,812,902)
SUBTITLE_FX("どっと笑ったり、泣いたり疲れたり",subtitle_x,subtitle_y-subtitle_size,903,1039)
SUBTITLE_FX("ドキドキな毎日に",subtitle_x,subtitle_y,1052,1143)
SUBTITLE_FX("ワクワクがワークする",subtitle_x,subtitle_y-subtitle_size,1148,1305)

SUBTITLE_FX("月曜日が町にやってくる",subtitle_x,subtitle_y,1328,1389)
SUBTITLE_FX("桜舞う電車に飛び乗る",subtitle_x,subtitle_y-subtitle_size,1386,1448)
SUBTITLE_FX("Newマークな期待を",subtitle_x,subtitle_y,1446,1500)
SUBTITLE_FX("ぎゅうぎゅうまで詰め込んで",subtitle_x,subtitle_y-subtitle_size,1506,1555)
SUBTITLE_FX("さぁ、Let's Go!",subtitle_x,subtitle_y,1550,1578)

SUBTITLE_FX("どんな出会いがやってくる?",subtitle_x,subtitle_y-subtitle_size,1573,1626)
SUBTITLE_FX("Level UPで強くなれるかな?",subtitle_x,subtitle_y,1625,1687)

SUBTITLE_FX("NEWGAMEをNow Loading…",subtitle_x,subtitle_y-subtitle_size,1685,1737)
SUBTITLE_FX("Now Loading… ",subtitle_x,subtitle_y,1737,1765)
SUBTITLE_FX("              Now Loading…",subtitle_x,subtitle_y,1760,1786)
SUBTITLE_FX("                            Now Loading…",subtitle_x,subtitle_y,1781,1831)

### pass clip: new_game_tv_ed_mute

### prefetch: 5,2

### ###

SUBTITLE_FX("日曜日が少し物足りないワケ",subtitle_x,subtitle_y,2057,2178)
SUBTITLE_FX("ちっちゃなころの遠足の前みたいに",subtitle_x,subtitle_y-subtitle_size,2177,2300)
SUBTITLE_FX("いつの間にか浮かぶこのキモチ",subtitle_x,subtitle_y,2296,2400)
SUBTITLE_FX("それはきっと、そうきっと",subtitle_x,subtitle_y-subtitle_size,2396,2460)
SUBTITLE_FX("大好きのマジック",subtitle_x,subtitle_y,2460,2524)

SUBTITLE_FX("そうさつらい時だって",subtitle_x,subtitle_y-subtitle_size,2541,2632)
SUBTITLE_FX("手と手とりあって、力を合わせたら",subtitle_x,subtitle_y,2632,2772)
SUBTITLE_FX("どんな高い壁だって",subtitle_x,subtitle_y-subtitle_size,2781,2874)
SUBTITLE_FX("ワクワクでジャンプする",subtitle_x,subtitle_y,2878,3034)

SUBTITLE_FX("月曜日が町にやってくる",subtitle_x,subtitle_y-subtitle_size,3057,3118)
SUBTITLE_FX("サクラサク電車走り出す",subtitle_x,subtitle_y,3116,3178)
SUBTITLE_FX("Newステージはボスラッシュ?それとも超ダッシュ?",subtitle_x,subtitle_y-subtitle_size,3175,3283)
SUBTITLE_FX("さぁ、アップデート",subtitle_x,subtitle_y,3279,3307)

SUBTITLE_FX("どんな希望を持ってくる?",subtitle_x,subtitle_y-subtitle_size,3303,3356)
SUBTITLE_FX("Skill UPで上手くやれるかな?",subtitle_x,subtitle_y,3355,3416)

SUBTITLE_FX("NEWGAMEをNow Loading…",subtitle_x,subtitle_y-subtitle_size,3414,3467)
SUBTITLE_FX("Now Loading…",subtitle_x,subtitle_y,3467,3494)
SUBTITLE_FX("              Now Loading…",subtitle_x,subtitle_y,3489,3516)
SUBTITLE_FX("                            Now Loading…",subtitle_x,subtitle_y,3511,3554)

### pass clip: new_game_tv_ed_mute

### prefetch: 5,2

### ###

SUBTITLE_FX("だって夢にまで見た世界で",subtitle_x,subtitle_y-subtitle_size,3788,3897)
SUBTITLE_FX("だってまだまだ夢の途中",subtitle_x,subtitle_y,3907,4013)
SUBTITLE_FX("だって最強の仲間がいて",subtitle_x,subtitle_y-subtitle_size,4026,4127)
SUBTITLE_FX("最高の幸せをNow Loading",subtitle_x,subtitle_y,4129,4319)

SUBTITLE_FX("月曜日が町にやってくる",subtitle_x,subtitle_y-subtitle_size,4368,4430)
SUBTITLE_FX("みんなと一緒にやってくる",subtitle_x,subtitle_y,4429,4489)
SUBTITLE_FX("Newストーリー携えて、Newフェイスな私に",subtitle_x,subtitle_y-subtitle_size,4487,4597)
SUBTITLE_FX("さぁ、アップデート",subtitle_x,subtitle_y,4592,4619)

SUBTITLE_FX("どんな世界がやってくる?",subtitle_x,subtitle_y-subtitle_size,4615,4670)
SUBTITLE_FX("最高な世界ができるかな?",subtitle_x,subtitle_y,4666,4729)

SUBTITLE_FX("NEWGAMEはNow Loading…",subtitle_x,subtitle_y-subtitle_size,4726,4778)
SUBTITLE_FX("Now Loading…",subtitle_x,subtitle_y,4778,4806)
SUBTITLE_FX("              Now Loading…",subtitle_x,subtitle_y,4801,4828)
SUBTITLE_FX("                            Now Complete!",subtitle_x,subtitle_y,4823,4853)

### pass clip: new_game_tv_ed_mute

### prefetch: 5,2

### ###

SUBTITLE_FX("さぁはじまりがやってくる",subtitle_x,subtitle_y-subtitle_size,4852,4905)
SUBTITLE_FX("目覚ましの音が響いたら",subtitle_x,subtitle_y,4904,4967)
SUBTITLE_FX("Newマークな期待を",subtitle_x,subtitle_y-subtitle_size,4965,5021)
SUBTITLE_FX("Newウィークに詰め込んで",subtitle_x,subtitle_y,5024,5073)
SUBTITLE_FX("さぁ、Let's Go!",subtitle_x,subtitle_y-subtitle_size,5068,5097)

SUBTITLE_FX("どんな奇跡がやってくる?",subtitle_x,subtitle_y,5092,5144)
SUBTITLE_FX("…いや、きっと奇跡は作ってく!",subtitle_x,subtitle_y-subtitle_size,5144,5205)

SUBTITLE_FX("NEWGAMEはNow Loading…",subtitle_x,subtitle_y,5202,5254)
SUBTITLE_FX("Now Loading…",subtitle_x,subtitle_y-subtitle_size,5255,5283)
SUBTITLE_FX("              Now Loading…",subtitle_x,subtitle_y-subtitle_size,5278,5305)
SUBTITLE_FX("Now Loading and Go!",subtitle_x,subtitle_y,5300,5401)

SUBTITLE_FX("Now Loading!!!!//fourfolium|    (涼風青葉(CV:高田憂希),滝本ひふみ(CV:山口愛),|    篠田はじめ(CV:戸田めぐみ),飯島ゆん(CV:竹尾歩美))|- by                                fielia@AVISynth",subtitle_x,subtitle_x,5695,5814,true,true)
SUBTITLE_FX("|||     寫程式編輯影音的遊戲程式設計師",subtitle_x,subtitle_x,5695,5814,false,true)

######## Preface ########

Import("new_game-tv-common-cross_process.avsi")

kyou_mo_ichinichi_ganbaruzoi_audio=FadeIn0(FadeOut0(Normalize(new_game_tv_04_aoba_kyou_mo_ichinichi_ganbaruzoi_full),3),3)
kyou_mo_ichinichi_ganbaruzoi=AudioDub(new_game_tv_04_aoba_kyou_mo_ichinichi_ganbaruzoi_full,kyou_mo_ichinichi_ganbaruzoi_audio)

kyou_mo_ichinichi_ganbaruzoi=SUBTITLE_N(kyou_mo_ichinichi_ganbaruzoi,"今日も一日がんばるぞい",y=Round(subtitle_y),first_frame=107,last_frame=158)

######## Thumbnail ########

is_thumbnail=false

is_thumbnail?ConvertToRGB32(new_game_tv_ed_mute):last

######## Music ########

bgm_48khz=SSRC(WAVSource("src\01 - Now Loading!!!!.wav"),48000)
AudioDub(bgm_48khz)



thumbnail=Trim(4853,-24*5)



kyou_mo_ichinichi_ganbaruzoi++Trim(17,0)



is_thumbnail?thumbnail:last

""")

######## Post Processing ########

ConvertToYV12()
#ConvertToYUY2()
#ConvertToRGB24()

TCPServer()
