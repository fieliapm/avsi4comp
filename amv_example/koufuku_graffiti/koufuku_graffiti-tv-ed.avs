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



Import("koufuku_graffiti-tv-common.avsi")

######## Function ########

function _FLIP_TRANSITION(clip left,clip right,int dir_x,int dir_y){
	length=Framecount(right)

	mask_base=BlankClip(right,color=color_black)
	mask_overlay=BlankClip(right,color=color_white)
	mask_width=Width(right)
	mask_height=Height(right)
	mask_frame_count=Framecount(right)

	mask=TRANSFORM(mask_base,mask_overlay,srcx="0",srcy="0",dstx="Spline(n,-1,"+String(-mask_width*dir_x)+","+String(mask_frame_count)+",0,cubic=false)",dsty="Spline(n,-1,"+String(-mask_height*dir_y)+","+String(mask_frame_count)+",0,cubic=false)")
	return Overlay(left,right,mask=mask,mode="Blend")
}

function FLIP_TRANSITION(clip left,clip right,int length,int dir_x,int dir_y){
	return TRANSITION(left,right,length,"_FLIP_TRANSITION(left,right,"+String(dir_x)+","+String(dir_y)+")")
}

######## Pre Combine ########

transition_length=8

transition_temp=FLIP_TRANSITION(MOVE_CG(TRIM_MIDDLE_CLIP(koufuku_graffiti_tv_01_water_on_fish,67+transition_length),-1,0,128.0,1.1),MOVE_CG(TRIM_MIDDLE_CLIP(koufuku_graffiti_tv_09_tenpura,60+transition_length),0,-1,128.0,1.1),transition_length,1,1)
transition_temp=FLIP_TRANSITION(transition_temp,MOVE_CG(TRIM_MIDDLE_CLIP(koufuku_graffiti_tv_08_french_dish,60+transition_length),1,0,128.0,1.1),transition_length,-1,1)
transition_temp=FLIP_TRANSITION(transition_temp,MOVE_CG(TRIM_MIDDLE_CLIP(koufuku_graffiti_tv_09_oden_05,53+transition_length),0,1,128.0,1.1),transition_length,-1,-1)
transition_result=FLIP_TRANSITION(transition_temp,koufuku_graffiti_tv_clean_ed_05,transition_length,1,-1)

koufuku_graffiti_tv_06_ryou_and_kirin_imagine_word=koufuku_graffiti_tv_06_ryou_and_kirin_imagine_word_03_curry+koufuku_graffiti_tv_06_ryou_and_kirin_imagine_word_04_sukiyaki

######## Combine ########

# koufuku_graffiti_tv_clean_ed_01 10
# koufuku_graffiti_tv_clean_ed_02 287
# koufuku_graffiti_tv_clean_ed_03 841 (2631)
# koufuku_graffiti_tv_clean_ed_04 4728
# koufuku_graffiti_tv_clean_ed_05 5487

# koufuku_graffiti_tv_12_ed_00 1800
# koufuku_graffiti_tv_12_ed_01 1814
# koufuku_graffiti_tv_12_ed_02 2096
# koufuku_graffiti_tv_12_ed_03 2627
# koufuku_graffiti_tv_12_ed_04 3092

fade_length=8

koufuku_graffiti_tv_ed_t01=BlankClip(koufuku_graffiti_tv_clean_ed,length=10,color=color_black)+koufuku_graffiti_tv_clean_ed_01

koufuku_graffiti_tv_ed_t02=koufuku_graffiti_tv_clean_ed_02
koufuku_graffiti_tv_ed_t03=koufuku_graffiti_tv_clean_ed_03+BlankClip(koufuku_graffiti_tv_clean_op,length=12,color=color_white) #79+111+69+69+120+17
koufuku_graffiti_tv_ed_t04=TRIM_FIRST_CLIP(koufuku_graffiti_tv_12_kirin_eat_around_world,137)+TRIM_FIRST_CLIP(koufuku_graffiti_tv_04_ryou_dash_in_dream,69)+TRIM_MIDDLE_CLIP(koufuku_graffiti_tv_04_ryou_bite_food_chan,68)+TRIM_LAST_CLIP(koufuku_graffiti_tv_05_ryou_and_kirin_imagine_summer,137)+TRIM_FIRST_CLIP(koufuku_graffiti_tv_06_ryou_and_kirin_imagine_word,102-14-5) #137+137+137+102

koufuku_graffiti_tv_ed_t05=koufuku_graffiti_tv_12_ed_00+koufuku_graffiti_tv_12_ed_01 #61+60+60+42+60 (start from 1819)

koufuku_graffiti_tv_ed_t06=koufuku_graffiti_tv_12_ed_02 #61+60+136+61+60+136+15 (start from 2102)
koufuku_graffiti_tv_ed_t07=koufuku_graffiti_tv_12_ed_03 #453 (start from 2631)
koufuku_graffiti_tv_ed_t08=koufuku_graffiti_tv_12_ed_04+TRIM_MIDDLE_CLIP(koufuku_graffiti_tv_08_food_become_more_and_more,37) #149+137+137+137 (start from 3084)

#(start from 3644)
koufuku_graffiti_tv_ed_t09=TRIM_MIDDLE_CLIP(koufuku_graffiti_tv_10_yuki_like_kirin,94)+TRIM_FIRST_CLIP(koufuku_graffiti_tv_10_yuki_eat_pizza,43) \
	+TRIM_MIDDLE_CLIP(koufuku_graffiti_tv_01_ryou_become_bad_bride,69)+TRIM_FIRST_CLIP(koufuku_graffiti_tv_09_kirin_and_ryou_say_goodbye,68) \
	+TRIM_LAST_CLIP(koufuku_graffiti_tv_01_ryou_hadaka_apron,77)+TRIM_MIDDLE_CLIP(koufuku_graffiti_tv_03_sakura_rain_01,47) \
	+TRIM_MIDDLE_CLIP(koufuku_graffiti_tv_11_vampire_ryou,18)+TRIM_MIDDLE_CLIP(koufuku_graffiti_tv_12_530_meal,17)+TRIM_MIDDLE_CLIP(koufuku_graffiti_tv_12_296_make,17)+TRIM_MIDDLE_CLIP(koufuku_graffiti_tv_02_ryou_become_brilliant,42) \
	+TRIM_MIDDLE_CLIP(koufuku_graffiti_tv_04_ryou_walk_in_dream,56)
koufuku_graffiti_tv_ed_t10=TRIM_LAST_CLIP(koufuku_graffiti_tv_03_drama_character_eat_omurice,137)+TRIM_LAST_CLIP(koufuku_graffiti_tv_11_ryou_and_kirin_fondle_shiina_god,137)+TRIM_MIDDLE_CLIP(koufuku_graffiti_tv_02_akira_force_ryou_to_eat_cookie,137)+TRIM_FIRST_CLIP(koufuku_graffiti_tv_07_kirin_catch_fired_sanma,111)+FADE_IN_WITH_BRIGHTNESS_OFFSET_RGB24(TRIM_MIDDLE_CLIP(koufuku_graffiti_tv_06_summer_sky,14),fade_length)

koufuku_graffiti_tv_ed_t11=koufuku_graffiti_tv_clean_ed_04
koufuku_graffiti_tv_ed_t12=transition_result+BlankClip(koufuku_graffiti_tv_clean_op,length=24*5,color=color_black)



koufuku_graffiti_tv_ed_mute=koufuku_graffiti_tv_ed_t01 \
	+koufuku_graffiti_tv_ed_t02+koufuku_graffiti_tv_ed_t03+koufuku_graffiti_tv_ed_t04 \
	+koufuku_graffiti_tv_ed_t05 \
	+koufuku_graffiti_tv_ed_t06+koufuku_graffiti_tv_ed_t07+koufuku_graffiti_tv_ed_t08 \
	+koufuku_graffiti_tv_ed_t09+koufuku_graffiti_tv_ed_t10 \
	+koufuku_graffiti_tv_ed_t11+koufuku_graffiti_tv_ed_t12

######## Music ########

bgm_48khz=SSRC(WAVSource("src\koufuku_graffiti-tv-ed-01.wav"),48000)

bgm_48khz_nico=SSRC(FFMS2_VIDEO_SOURCE("src\koufuku_graffiti-tv-ed-miku.mp4"),48000) # for uploading to nicovideo
bgm_48khz_nico=Trim(bgm_48khz_nico,47,0)

AudioDub(koufuku_graffiti_tv_ed_mute,bgm_48khz)
#AudioDub(koufuku_graffiti_tv_ed_mute,bgm_48khz_nico)



thumbnail=Trim(1050,-24*5)

######## Subtitle ########

#global subtitle_clip_width=1280
#global subtitle_clip_height=720

subtitle_x=50
subtitle_y=400
global subtitle_front_fade_count=8
global subtitle_rear_fade_count=8
global subtitle_font="MS Gothic"
global subtitle_effects="b"
global subtitle_size=28
global subtitle_text_color=color_white
global subtitle_halo_color=color_black

function SUBTITLE_FX(clip clip,string text,float x,float y,int start_frame,int end_frame,int "who_sing",bool "is_furigana",bool "is_title"){
	who_sing=Default(who_sing,0)
	is_furigana=Default(is_furigana,false)
	is_title=Default(is_title,false)

	text_color=is_title?color_pink:subtitle_text_color
	halo_color=who_sing==1?color_orangered:(who_sing==2?color_purple:(who_sing==3?color_deeppink:subtitle_halo_color))
	size=is_furigana?subtitle_size*0.5:subtitle_size
	y=is_furigana?y-size:y

	return SUBTITLE_FX_FADE_IN_FADE_OUT(clip,text,Round(x),Round(y),start_frame,end_frame,subtitle_front_fade_count,subtitle_rear_fade_count,subtitle_font,subtitle_effects,Round(size),text_color,halo_color)
}

SUBTITLE_FX("笑顔になる//      と      (        と          )|- by fielia@AVISynth",subtitle_x,subtitle_y-subtitle_size,5494,5738,is_title=true)
SUBTITLE_FX("            リョウ         佐藤利奈",subtitle_x,subtitle_y-subtitle_size,5494,5738,1)
SUBTITLE_FX("                    きりん           大亀あすか",subtitle_x,subtitle_y-subtitle_size,5494,5738,2)

SUBTITLE_FX("コトコトコトコトコト",subtitle_x,subtitle_y,307,366,1)
SUBTITLE_FX("グツグツグツグツ…グゥ",subtitle_x,subtitle_y,367,435,2)
SUBTITLE_FX("こころ躍る",subtitle_x,subtitle_y,444,562,1)
SUBTITLE_FX("           ハッピーハッピークッキング",subtitle_x,subtitle_y,444,562,3)

SUBTITLE_FX("タコタコウインナー パクリ",subtitle_x,subtitle_y,564,623,2)
SUBTITLE_FX("タコタコヤキ ハフリ",subtitle_x,subtitle_y,624,686,1)
SUBTITLE_FX("次が迷うよ",subtitle_x,subtitle_y,701,837,2)
SUBTITLE_FX("           どっち?どっち?シンキング",subtitle_x,subtitle_y,701,837,3)

SUBTITLE_FX("シルクのような",subtitle_x,subtitle_y,846,987,1)
SUBTITLE_FX("               クリームシチュー",subtitle_x,subtitle_y,846,987,2)
SUBTITLE_FX("どうぞどうぞ今すぐ",subtitle_x,subtitle_y,1026,1093,1)
SUBTITLE_FX("はやくはやくまだかな",subtitle_x,subtitle_y,1094,1161,2)
SUBTITLE_FX("さぁ 始めましょうか",subtitle_x,subtitle_y,1162,1289,3)

SUBTITLE_FX("貴方      と食べる",subtitle_x,subtitle_y-subtitle_size,1300,1435,1)
SUBTITLE_FX("    リョウと食べる",subtitle_x,subtitle_y,1300,1435,2)
SUBTITLE_FX("                   ご飯が",subtitle_x,subtitle_y,1300,1435,3)
SUBTITLE_FX("笑顔になる 大好きなの",subtitle_x,subtitle_y,1438,1570,3)
SUBTITLE_FX("ほら",subtitle_x,subtitle_y,1574,1718,1)
SUBTITLE_FX("     もう",subtitle_x,subtitle_y,1574,1718,2)
SUBTITLE_FX("          いやーん 待てない!",subtitle_x,subtitle_y,1574,1718,3)
SUBTITLE_FX("「シアワセ いただきます!」",subtitle_x,subtitle_y,1719,1819,3)

SUBTITLE_FX("もぐもぐもぐもぐもぐ",subtitle_x,subtitle_y,2096,2156,1)
SUBTITLE_FX("ガツガツガツガツ…ガッツ！",subtitle_x,subtitle_y,2157,2220,2)
SUBTITLE_FX("たのしいです",subtitle_x,subtitle_y,2234,2351,1)
SUBTITLE_FX("             毎日フェスタ",subtitle_x,subtitle_y,2234,2351,3)

SUBTITLE_FX("エビエビ天ぷら じゅわり",subtitle_x,subtitle_y,2354,2413,2)
SUBTITLE_FX("タマタマ玉子 ちゅる",subtitle_x,subtitle_y,2414,2476,1)
SUBTITLE_FX("期待しちゃう",subtitle_x,subtitle_y,2491,2635,2)
SUBTITLE_FX("             まだまだこれから",subtitle_x,subtitle_y,2491,2635,3)

SUBTITLE_FX("琥珀のような",subtitle_x,subtitle_y,2636,2790,1)
SUBTITLE_FX("             ナベヤキうどん",subtitle_x,subtitle_y,2636,2790,2)
SUBTITLE_FX("ペコリペコリお腹が",subtitle_x,subtitle_y,2816,2884,1)
SUBTITLE_FX("ぐるりぐるり泣いてる",subtitle_x,subtitle_y,2885,2951,2)
SUBTITLE_FX("そろそろ待てないわ",subtitle_x,subtitle_y,2952,3086,3)

SUBTITLE_FX("もっとも  っと",subtitle_x,subtitle_y-subtitle_size,3089,3223,2)
SUBTITLE_FX("        もっと",subtitle_x,subtitle_y,3089,3223,1)
SUBTITLE_FX("               おいしくなれ",subtitle_x,subtitle_y,3089,3223,3)
SUBTITLE_FX("貴方ともっと 近づきたい",subtitle_x,subtitle_y,3227,3363,3)
SUBTITLE_FX("ほら",subtitle_x,subtitle_y,3364,3502,2)
SUBTITLE_FX("     もう",subtitle_x,subtitle_y,3364,3502,1)
SUBTITLE_FX("          いやーん 待てない!",subtitle_x,subtitle_y,3364,3502,3)
SUBTITLE_FX("    ほしみっつ",subtitle_x,subtitle_y,3509,3621,3,is_furigana=true)
SUBTITLE_FX("「☆☆☆ いただきます!」",subtitle_x,subtitle_y,3509,3621,3)

SUBTITLE_FX("例えるならショートケーキに",subtitle_x,subtitle_y,3655,3791,1)
SUBTITLE_FX("                           苺がない",subtitle_x,subtitle_y,3655,3791,2)
SUBTITLE_FX("美味しいけど寂しい",subtitle_x,subtitle_y,3792,3928,1)
SUBTITLE_FX("                   どっちも欠けちゃいけないの",subtitle_x,subtitle_y,3792,3928,2)
SUBTITLE_FX("運命のように",subtitle_x,subtitle_y,3929,4036,1)
SUBTITLE_FX("             調和する",subtitle_x,subtitle_y,3929,4036,2)
SUBTITLE_FX("つまり      ふたり",subtitle_x,subtitle_y,4037,4108,1)
SUBTITLE_FX("       同じ        ともに",subtitle_x,subtitle_y,4037,4108,2)
SUBTITLE_FX("響きあうハーモニー",subtitle_x,subtitle_y,4129,4245,3)

SUBTITLE_FX("貴方      と食べる",subtitle_x,subtitle_y-subtitle_size,4734,4869,1)
SUBTITLE_FX("    リョウと食べる",subtitle_x,subtitle_y,4734,4869,2)
SUBTITLE_FX("                   ご飯が",subtitle_x,subtitle_y,4734,4869,3)
SUBTITLE_FX("笑顔になる 大好きなの",subtitle_x,subtitle_y,4871,5006,3)
SUBTITLE_FX("ほら",subtitle_x,subtitle_y,5008,5143,1)
SUBTITLE_FX("     もう",subtitle_x,subtitle_y,5008,5143,2)
SUBTITLE_FX("          はぁ。 終わる",subtitle_x,subtitle_y,5008,5143,3)
SUBTITLE_FX("満腹で「ごちそうさま!」",subtitle_x,subtitle_y,5153,5248,3)



#thumbnail

######## Post Processing ########

ConvertToYV12()
#ConvertToYUY2()
#ConvertToRGB24()

TCPServer()
