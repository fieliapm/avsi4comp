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

Import("majo_no_tabitabi-tv-common.avsi")

######## Function ########

### inherit start ###

Import("majo_no_tabitabi-tv-function.avsi")

### inherit end ###

######## Pre Combine ########

fade_length=12



# Elaina conducting loop
loop_frame=52
elaina_conducting_loop=Dissolve(majo_no_tabitabi_tv_clean_op_06_elaina_conducting,majo_no_tabitabi_tv_clean_op_06_elaina_conducting_cache02,2)
elaina_conducting_loop=Loop(elaina_conducting_loop,116,2,loop_frame-1+2)
elaina_conducting_loop=CLIP_SPEED(elaina_conducting_loop,loop_frame/((1560+1561)/32.0/2.0),false)
elaina_conducting_forever=TRIM_FIRST_CLIP(BlankClip(majo_no_tabitabi_tv_clean_op,length=19,color=color_black)+elaina_conducting_loop,5683)



majo_no_tabitabi_tv_07_elaina_dress=majo_no_tabitabi_tv_07_elaina_dress_01+majo_no_tabitabi_tv_07_elaina_dress_02+majo_no_tabitabi_tv_07_elaina_dress_03 #148

######## Combine ########

# majo_no_tabitabi_tv_clean_op_01 12
# majo_no_tabitabi_tv_clean_op_02 219/2072
# majo_no_tabitabi_tv_clean_op_03 515/2075
# majo_no_tabitabi_tv_clean_op_04 806/2366
# majo_no_tabitabi_tv_clean_op_05 1194/2754/3925/4315
# majo_no_tabitabi_tv_clean_op_06 1585/3145/4706
# majo_no_tabitabi_tv_clean_op_07 1780/3340/4901
# majo_no_tabitabi_tv_clean_op_08 (1975/3535/5096) 5535

# majo_no_tabitabi_tv_clean_op_06_elaina_conducting_cache02 1726/3286/4847



majo_no_tabitabi_tv_op_t01=BlankClip(majo_no_tabitabi_tv_clean_op,length=12,color=color_black)+majo_no_tabitabi_tv_clean_op_01

majo_no_tabitabi_tv_op_t02=majo_no_tabitabi_tv_clean_op_02+majo_no_tabitabi_tv_clean_op_03

majo_no_tabitabi_tv_op_t03=TRIM_FIRST_CLIP(majo_no_tabitabi_tv_01_elaina_and_fran_see_fall,195)+MOVE_CG(TRIM_LAST_CLIP(majo_no_tabitabi_tv_08_sheila_see_elaina_wear_witch_dress,96),-1,0,Width(majo_no_tabitabi_tv_clean_op)/10.0,1.1)+TRIM_FIRST_CLIP(majo_no_tabitabi_tv_05_elaina_see_petal_02,49)+TRIM_LAST_CLIP(majo_no_tabitabi_tv_10_victorica_take_knife_on_leg,19)+TRIM_MIDDLE_CLIP(majo_no_tabitabi_tv_01_robetta,8)+TRIM_MIDDLE_CLIP(majo_no_tabitabi_tv_09_paper_on_elaina_s_leg,9)+TRIM_MIDDLE_CLIP(majo_no_tabitabi_tv_01_elaina_see_grass_fly,12)
majo_no_tabitabi_tv_op_t032=majo_no_tabitabi_tv_clean_op_04
#majo_no_tabitabi_tv_op_t03=Merge(majo_no_tabitabi_tv_op_t03,majo_no_tabitabi_tv_op_t032)

majo_no_tabitabi_tv_op_t04=FADE_IN_WITH_BRIGHTNESS_OFFSET(TRIM_LAST_CLIP(majo_no_tabitabi_tv_06_saya_want_elaina_to_promise,196),fade_length)+TRIM_LAST_CLIP(majo_no_tabitabi_tv_03_elaina_revert_broken_teapot,99)+TRIM_FIRST_CLIP(majo_no_tabitabi_tv_04_mirarose_call_swords,47)+TRIM_FIRST_CLIP(majo_no_tabitabi_tv_01_season_variation_01,12)+TRIM_FIRST_CLIP(majo_no_tabitabi_tv_01_season_variation_02,11)+TRIM_FIRST_CLIP(majo_no_tabitabi_tv_01_season_variation_03,14)+TRIM_FIRST_CLIP(majo_no_tabitabi_tv_01_season_variation_04,12)
majo_no_tabitabi_tv_op_t042=majo_no_tabitabi_tv_clean_op_05
#majo_no_tabitabi_tv_op_t04=Merge(majo_no_tabitabi_tv_op_t04,majo_no_tabitabi_tv_op_t042)

majo_no_tabitabi_tv_op_t05=TRIM_MIDDLE_CLIP(majo_no_tabitabi_tv_10_town_of_freedom_qunorts_03,97)+TRIM_MIDDLE_CLIP(majo_no_tabitabi_tv_08_elaina_s_dolphin_neckless,44)+TRIM_FIRST_CLIP(majo_no_tabitabi_tv_clean_op_06_elaina_conducting,54) \
	+TRIM_MIDDLE_CLIP(majo_no_tabitabi_tv_02_saya_follow_elaina_fly_high,73)+TRIM_MIDDLE_CLIP(majo_no_tabitabi_tv_01_elaina_and_fran_read_book_on_swing,26)+TRIM_FIRST_CLIP(majo_no_tabitabi_tv_08_elaina_read_book,48)+TRIM_LAST_CLIP(majo_no_tabitabi_tv_08_elaina_sleep_on_book,48)
majo_no_tabitabi_tv_op_t052=majo_no_tabitabi_tv_clean_op_06+majo_no_tabitabi_tv_clean_op_07
#majo_no_tabitabi_tv_op_t05=Merge(majo_no_tabitabi_tv_op_t05,majo_no_tabitabi_tv_op_t052)

majo_no_tabitabi_tv_op_t06=FADE_OUT_WITH_BRIGHTNESS_OFFSET(TRIM_MIDDLE_CLIP(majo_no_tabitabi_tv_09_elaina_follow_red_ray,97),fade_length)

majo_no_tabitabi_tv_op_t07=TRIM_LAST_CLIP(majo_no_tabitabi_tv_01_elaina_see_fran_control_meteor,98)+TRIM_FIRST_CLIP(majo_no_tabitabi_tv_07_elaina_dress,98)+TRIM_MIDDLE_CLIP(majo_no_tabitabi_tv_06_saya_release_water_cylinder,69)+TRIM_MIDDLE_CLIP(majo_no_tabitabi_tv_05_elaina_fly_along_river,29)
majo_no_tabitabi_tv_op_t072=TRIM_FIRST_CLIP(majo_no_tabitabi_tv_clean_op_02,Framecount(majo_no_tabitabi_tv_clean_op_02)-2)
#majo_no_tabitabi_tv_op_t07=Merge(majo_no_tabitabi_tv_op_t07,majo_no_tabitabi_tv_op_t072)

majo_no_tabitabi_tv_op_t08=majo_no_tabitabi_tv_clean_op_04

majo_no_tabitabi_tv_op_t09=FADE_IN_WITH_BRIGHTNESS_OFFSET(TRIM_MIDDLE_CLIP(majo_no_tabitabi_tv_10_victorica_fran_sheila_in_front_of_windmill,196),fade_length)+TRIM_FIRST_CLIP(majo_no_tabitabi_tv_07_saya_raise_hand_in_front_of_wall,99)+TRIM_MIDDLE_CLIP(majo_no_tabitabi_tv_04_elaina_control_hole_dragging,47)+TRIM_FIRST_CLIP(majo_no_tabitabi_tv_01_book_variation_01,12)+TRIM_FIRST_CLIP(majo_no_tabitabi_tv_01_book_variation_02,11)+TRIM_FIRST_CLIP(majo_no_tabitabi_tv_01_book_variation_03,14)+TRIM_FIRST_CLIP(majo_no_tabitabi_tv_01_book_variation_04,12)
majo_no_tabitabi_tv_op_t092=majo_no_tabitabi_tv_clean_op_05
#majo_no_tabitabi_tv_op_t09=Merge(majo_no_tabitabi_tv_op_t09,majo_no_tabitabi_tv_op_t092)

majo_no_tabitabi_tv_op_t10=TRIM_FIRST_CLIP(majo_no_tabitabi_tv_02_elaina_see_gate_of_country_for_mages,97)+TRIM_MIDDLE_CLIP(majo_no_tabitabi_tv_05_students_fly_to_catch_elaina,44)+TRIM_LAST_CLIP(majo_no_tabitabi_tv_07_elaina_drunk_and_use_magic,54) \
	+TRIM_FIRST_CLIP(majo_no_tabitabi_tv_02_saya_see_elaina_call_her_witch_hat,73)+TRIM_MIDDLE_CLIP(majo_no_tabitabi_tv_06_saya_use_magic,26)+TRIM_FIRST_CLIP(majo_no_tabitabi_tv_04_elaina_jump_onto_bed,48)+TRIM_FIRST_CLIP(majo_no_tabitabi_tv_06_saya_help_elaina_wear_necklace,48)
majo_no_tabitabi_tv_op_t102=majo_no_tabitabi_tv_clean_op_06+majo_no_tabitabi_tv_clean_op_07
#majo_no_tabitabi_tv_op_t10=Merge(majo_no_tabitabi_tv_op_t10,majo_no_tabitabi_tv_op_t102)

majo_no_tabitabi_tv_op_t11=TRIM_LAST_CLIP(majo_no_tabitabi_tv_09_elaina_see_estelle_s_blood,99+97)+TRIM_LAST_CLIP(majo_no_tabitabi_tv_06_eihemia_draw_magic_circle,98)+FADE_OUT_WITH_BRIGHTNESS_OFFSET(TRIM_FIRST_CLIP(majo_no_tabitabi_tv_02_saya_cry_and_hug_elaina,96),fade_length)

majo_no_tabitabi_tv_op_t12=FADE_IN_WITH_BRIGHTNESS_OFFSET(TRIM_FIRST_CLIP(majo_no_tabitabi_tv_04_elaina_feel_cold,196),fade_length)+TRIM_FIRST_CLIP(majo_no_tabitabi_tv_09_elaina_tears,99)+TRIM_FIRST_CLIP(majo_no_tabitabi_tv_07_elaina_buy_block_of_wall,47)+TRIM_MIDDLE_CLIP(majo_no_tabitabi_tv_03_elaina_introduce_herself,12+11+14+11) #48
majo_no_tabitabi_tv_op_t122=TRIM_FIRST_CLIP(majo_no_tabitabi_tv_clean_op_05,Framecount(majo_no_tabitabi_tv_clean_op_05)-1)
#majo_no_tabitabi_tv_op_t12=Merge(majo_no_tabitabi_tv_op_t12,majo_no_tabitabi_tv_op_t122)

majo_no_tabitabi_tv_op_t13=majo_no_tabitabi_tv_clean_op_05
majo_no_tabitabi_tv_op_t14=majo_no_tabitabi_tv_clean_op_06+majo_no_tabitabi_tv_clean_op_07+FADE_OUT_WITH_BRIGHTNESS_OFFSET(TRIM_MIDDLE_CLIP(majo_no_tabitabi_tv_03_ink_fall_onto_note,50),fade_length)

majo_no_tabitabi_tv_op_t15=FADE_IN_WITH_BRIGHTNESS_OFFSET(TRIM_FIRST_CLIP(majo_no_tabitabi_tv_05_fran_and_elaina_see_sunset,97+98+97),fade_length)+TRIM_LAST_CLIP(majo_no_tabitabi_tv_02_elaina_put_book_on_desk_and_blow_out_candle,97)
majo_no_tabitabi_tv_op_t16=majo_no_tabitabi_tv_clean_op_08+BlankClip(majo_no_tabitabi_tv_clean_op,length=24*4,color=color_black)



majo_no_tabitabi_tv_op_mute=majo_no_tabitabi_tv_op_t01+majo_no_tabitabi_tv_op_t02+majo_no_tabitabi_tv_op_t03+majo_no_tabitabi_tv_op_t04+majo_no_tabitabi_tv_op_t05 \
	+majo_no_tabitabi_tv_op_t06+majo_no_tabitabi_tv_op_t07+majo_no_tabitabi_tv_op_t08+majo_no_tabitabi_tv_op_t09+majo_no_tabitabi_tv_op_t10 \
	+majo_no_tabitabi_tv_op_t11+majo_no_tabitabi_tv_op_t12+majo_no_tabitabi_tv_op_t13+majo_no_tabitabi_tv_op_t14 \
	+majo_no_tabitabi_tv_op_t15+majo_no_tabitabi_tv_op_t16



elaina_conducting_forever_pip=Lanczos4Resize(elaina_conducting_forever,Width(majo_no_tabitabi_tv_clean_op)/4,Height(majo_no_tabitabi_tv_clean_op)/4)
majo_no_tabitabi_tv_op_mute_with_elaina_conducting_forever=Overlay(majo_no_tabitabi_tv_op_mute,elaina_conducting_forever_pip,Width(majo_no_tabitabi_tv_clean_op)*3/4,Height(majo_no_tabitabi_tv_clean_op)*3/4,mode="Blend")
majo_no_tabitabi_tv_op_mute=OVERWRITE_RANGE(majo_no_tabitabi_tv_op_mute,majo_no_tabitabi_tv_op_mute_with_elaina_conducting_forever,1726+54,4846)



majo_no_tabitabi_tv_op_mute

### export clip: majo_no_tabitabi_tv_op_mute

### prefetch: 5,2

### ###

######## Subtitle ########

### inherit start ###

#global subtitle_heavy_halo_width=1
global subtitle_clip_width=1920
global subtitle_clip_height=1080

subtitle_x=50*2.25
subtitle_y=395*2.25
global subtitle_front_fade_count=12
global subtitle_rear_fade_count=12
global subtitle_font="MS Mincho"
global subtitle_effects="b"
global subtitle_size=33*2.25
global subtitle_text_color=color_white
global subtitle_halo_color=color_black
global subtitle_outside_halo_color=color_gray10

function SUBTITLE_FX(clip clip,string text,float x,float y,int start_frame,int end_frame,bool "is_furigana",bool "is_title"){
	is_title=Default(is_title,false)
	is_furigana=Default(is_furigana,false)

	outside_halo_color=is_title?color_deepskyblue:subtitle_outside_halo_color

	subtitle_mode=is_furigana?"ex":"ex" #"ex_thick_reduce_memory"
	size=is_furigana?subtitle_size*0.5:subtitle_size
	y=is_furigana?y-size:y

	return is_furigana?SUBTITLE_FX_FADE_IN_FADE_OUT_DOUBLE_HALO(clip,text,Round(x),Round(y),start_frame,end_frame,subtitle_front_fade_count,subtitle_rear_fade_count,subtitle_font,subtitle_effects,Round(size),subtitle_text_color,subtitle_halo_color,outside_halo_color,subtitle_mode) \
		:SUBTITLE_FX_RANDOM_APPEAR_FADE_OUT_DOUBLE_HALO(clip,text,Round(x),Round(y),start_frame,end_frame,subtitle_front_fade_count,subtitle_rear_fade_count,subtitle_font,subtitle_effects,Round(size),subtitle_text_color,subtitle_halo_color,outside_halo_color,subtitle_mode)
}

### inherit end ###

ConvertToRGB32(matrix="Rec709")

SUBTITLE_FX("リテラチュア//上田麗奈|この神MVを作る人は誰でしょうか？そう、私です！|- by fielia@AVISynth",-subtitle_x,subtitle_y-subtitle_size*2,5341,5536,is_title=true)

SUBTITLE_FX(" いろど                       げんそう",subtitle_x,subtitle_y,208,296,true)
SUBTITLE_FX(" 彩られていけば幻想が",subtitle_x,subtitle_y,208,296)
SUBTITLE_FX("カタチあるものになるように",subtitle_x,subtitle_y-subtitle_size*2,305,394)
SUBTITLE_FX("えが                        かな",subtitle_x,subtitle_y,397,511,true)
SUBTITLE_FX("描いてゆける　叶えてゆけるんだ",subtitle_x,subtitle_y,397,511)
SUBTITLE_FX("やさ         ふ         かぜ        ふる                めく",subtitle_x,subtitle_y-subtitle_size*2,512,685,true)
SUBTITLE_FX("優しく吹いた風が　古いページ捲るように",subtitle_x,subtitle_y-subtitle_size*2,512,685)
SUBTITLE_FX(" ふ     かえ",subtitle_x,subtitle_y,689,739,true)
SUBTITLE_FX("振り返るけど",subtitle_x,subtitle_y,689,739)		

SUBTITLE_FX("「ううん、いいのよ」",subtitle_x,subtitle_y-subtitle_size*2,744,788)

SUBTITLE_FX(" し                                          で  あ     わか       はなし",subtitle_x,subtitle_y,797,978,true)
SUBTITLE_FX("知らないことだらけの　出会い別れの話",subtitle_x,subtitle_y,797,978)
SUBTITLE_FX("にじ",subtitle_x,subtitle_y-subtitle_size*2,1000,1147,true)
SUBTITLE_FX("滲むインクをそっとなぞった",subtitle_x,subtitle_y-subtitle_size*2,1000,1147)

SUBTITLE_FX("         い",subtitle_x,subtitle_y,1190,1225,true)
SUBTITLE_FX("どこ行くの？",subtitle_x,subtitle_y,1190,1225)
SUBTITLE_FX("      すこ    とお",subtitle_x,subtitle_y-subtitle_size*2,1223,1287,true)
SUBTITLE_FX("...少し遠くまで",subtitle_x,subtitle_y-subtitle_size*2,1223,1287)
SUBTITLE_FX(" お                             ゆめ",subtitle_x,subtitle_y,1286,1371,true)
SUBTITLE_FX("置いてきたものは夢に",subtitle_x,subtitle_y,1286,1371)
SUBTITLE_FX(" す                 えら",subtitle_x,subtitle_y-subtitle_size*2,1381,1445,true)
SUBTITLE_FX("好きだから選ぶ",subtitle_x,subtitle_y-subtitle_size*2,1381,1445)
SUBTITLE_FX("えら               わたし",subtitle_x,subtitle_y,1445,1572,true)
SUBTITLE_FX("選びながら私になってゆく",subtitle_x,subtitle_y,1445,1572)

SUBTITLE_FX("             あ                         やくそく",subtitle_x,subtitle_y-subtitle_size*2,1578,1689,true)
SUBTITLE_FX("「また会いましょう、約束だから」",subtitle_x,subtitle_y-subtitle_size*2,1578,1689)
SUBTITLE_FX("                         ほほえ",subtitle_x,subtitle_y,1688,1765,true)
SUBTITLE_FX("あなたはそう微笑んだ",subtitle_x,subtitle_y,1688,1765)
SUBTITLE_FX("             あ                          こ ゆび",subtitle_x,subtitle_y-subtitle_size*2,1773,1885,true)
SUBTITLE_FX("「また会いましょう」小指のまじない",subtitle_x,subtitle_y-subtitle_size*2,1773,1885)
SUBTITLE_FX("だれ        こえ             め      さ",subtitle_x,subtitle_y,1885,1983,true)
SUBTITLE_FX("誰かの声がして目が覚めた",subtitle_x,subtitle_y,1885,1983)

### pass clip: majo_no_tabitabi_tv_op_mute

### prefetch: 5,2

### ###

SUBTITLE_FX(" き たい                                 み  む",subtitle_x,subtitle_y-subtitle_size*2,2072,2245,true)
SUBTITLE_FX("期待されていること　見向きさえされないこと",subtitle_x,subtitle_y-subtitle_size*2,2072,2245)
SUBTITLE_FX("                 い",subtitle_x,subtitle_y,2250,2297,true)
SUBTITLE_FX("どちらが良いの？",subtitle_x,subtitle_y,2250,2297)
SUBTITLE_FX("「...ううん、どちらも」",subtitle_x,subtitle_y-subtitle_size*2,2304,2349)

SUBTITLE_FX("うれ             ふ あん           わたし           ひっ し",subtitle_x,subtitle_y,2360,2541,true)
SUBTITLE_FX("嬉しいし不安だし　私だって必死だし",subtitle_x,subtitle_y,2360,2541)
SUBTITLE_FX("しゅじんこう",subtitle_x,subtitle_y-subtitle_size*2,2559,2709,true)
SUBTITLE_FX("主人公になれていますか？",subtitle_x,subtitle_y-subtitle_size*2,2559,2709)

SUBTITLE_FX("あめ     ふ         ひと        ひと",subtitle_x,subtitle_y,2748,2847,true)
SUBTITLE_FX("雨が降る　一つ、一つずつ",subtitle_x,subtitle_y,2748,2847)
SUBTITLE_FX("だれ                 せ かい",subtitle_x,subtitle_y-subtitle_size*2,2847,2934,true)
SUBTITLE_FX("誰もいない世界みたい",subtitle_x,subtitle_y-subtitle_size*2,2847,2934)
SUBTITLE_FX("まんげつ     み",subtitle_x,subtitle_y,2943,3047,true)
SUBTITLE_FX("満月も見ないフリしながら",subtitle_x,subtitle_y,2943,3047)
SUBTITLE_FX("  あす       ま",subtitle_x,subtitle_y-subtitle_size*2,3041,3131,true)
SUBTITLE_FX("明日を待っている",subtitle_x,subtitle_y-subtitle_size*2,3041,3131)

SUBTITLE_FX("    しん                    かな",subtitle_x,subtitle_y,3136,3249,true)
SUBTITLE_FX("「信じるだけで叶えられるわ」",subtitle_x,subtitle_y,3136,3249)
SUBTITLE_FX(" ひとり                  せ      お",subtitle_x,subtitle_y-subtitle_size*2,3248,3325,true)
SUBTITLE_FX("一人はそう、背を押した",subtitle_x,subtitle_y-subtitle_size*2,3248,3325)
SUBTITLE_FX("    しん                    たす",subtitle_x,subtitle_y,3332,3444,true)
SUBTITLE_FX("「信じるだけで助けられるわ」",subtitle_x,subtitle_y,3332,3444)
SUBTITLE_FX(" ひとり                             ねが",subtitle_x,subtitle_y-subtitle_size*2,3443,3549,true)
SUBTITLE_FX("一人はそう、まるで願うように",subtitle_x,subtitle_y-subtitle_size*2,3443,3549)

SUBTITLE_FX("            あお    そら    うえ",subtitle_x,subtitle_y,3560,3757,true)
SUBTITLE_FX("やがて青い空の上で",subtitle_x,subtitle_y,3560,3757)
SUBTITLE_FX("ほし    わら",subtitle_x,subtitle_y-subtitle_size*2,3755,3906,true)
SUBTITLE_FX("星は笑う",subtitle_x,subtitle_y-subtitle_size*2,3755,3906)

### pass clip: majo_no_tabitabi_tv_op_mute

### prefetch: 5,2

### ###

SUBTITLE_FX("ほん     み                 よる",subtitle_x,subtitle_y,3918,4018,true)
SUBTITLE_FX("本で見たような夜だった",subtitle_x,subtitle_y,3918,4018)
SUBTITLE_FX("あめ     や         ほほ",subtitle_x,subtitle_y-subtitle_size*2,4017,4107,true)
SUBTITLE_FX("雨は止み　頬をつたう",subtitle_x,subtitle_y-subtitle_size*2,4017,4107)
SUBTITLE_FX("あさ     き         わす",subtitle_x,subtitle_y,4114,4218,true)
SUBTITLE_FX("朝が来た　忘れないでいてね",subtitle_x,subtitle_y,4114,4218)
SUBTITLE_FX("たび",subtitle_x,subtitle_y-subtitle_size*2,4212,4304,true)
SUBTITLE_FX("旅のリテラチュア",subtitle_x,subtitle_y-subtitle_size*2,4212,4304)

SUBTITLE_FX("         い",subtitle_x,subtitle_y,4311,4347,true)
SUBTITLE_FX("どこ行くの？",subtitle_x,subtitle_y,4311,4347)
SUBTITLE_FX("      すこ    とお",subtitle_x,subtitle_y-subtitle_size*2,4344,4407,true)
SUBTITLE_FX("...少し遠くまで",subtitle_x,subtitle_y-subtitle_size*2,4344,4407)
SUBTITLE_FX(" お                             ゆめ",subtitle_x,subtitle_y,4407,4495,true)
SUBTITLE_FX("置いてきたものは夢に",subtitle_x,subtitle_y,4407,4495)
SUBTITLE_FX(" す                 えら",subtitle_x,subtitle_y-subtitle_size*2,4502,4566,true)
SUBTITLE_FX("好きだから選ぶ",subtitle_x,subtitle_y-subtitle_size*2,4502,4566)
SUBTITLE_FX("えら               わたし",subtitle_x,subtitle_y,4565,4693,true)
SUBTITLE_FX("選びながら私になってゆく",subtitle_x,subtitle_y,4565,4693)

SUBTITLE_FX("             あ                         やくそく",subtitle_x,subtitle_y-subtitle_size*2,4699,4811,true)
SUBTITLE_FX("「また会いましょう、約束だから」",subtitle_x,subtitle_y-subtitle_size*2,4699,4811)
SUBTITLE_FX("                         ほほえ",subtitle_x,subtitle_y,4809,4887,true)
SUBTITLE_FX("あなたはそう微笑んだ",subtitle_x,subtitle_y,4809,4887)
SUBTITLE_FX("             あ                          こ ゆび",subtitle_x,subtitle_y-subtitle_size*2,4893,5007,true)
SUBTITLE_FX("「また会いましょう」小指のまじない",subtitle_x,subtitle_y-subtitle_size*2,4893,5007)
SUBTITLE_FX("だれ        しん             い",subtitle_x,subtitle_y,5005,5118,true)
SUBTITLE_FX("誰かを信じても良いのかな",subtitle_x,subtitle_y,5005,5118)

######## Thumbnail ########

is_thumbnail=false

is_thumbnail?ConvertToRGB32(elaina_conducting_forever,matrix="Rec709"):last

######## Music ########

bgm_48khz=SSRC(WAVSource("src\majo_no_tabitabi-op-01.wav"),48000)
Normalize(AudioDub(bgm_48khz))



thumbnail=Trim(1726,-24*5)



is_thumbnail?thumbnail:last

""")

######## Post Processing ########

#ConvertToRGB24()
#ConvertBackToYUY2(matrix="Rec709")
CONVERT_BACK_TO_YV12(matrix="Rec709")

#ConvertAudioTo8bit()
#ConvertAudioTo16bit()
ConvertAudioTo24bit()
#ConvertAudioTo32bit()
#ConvertAudioToFloat()

TCPServer()
