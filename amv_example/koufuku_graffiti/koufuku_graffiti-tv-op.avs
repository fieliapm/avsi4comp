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

function MOVE_CG(clip cg,int dir_x,int dir_y,float move_offset,float scale){
	cg_frame_count=Framecount(cg)
	cg_width_half=Width(cg)/2
	cg_height_half=Height(cg)/2
	move_offset_half=move_offset*0.5

	return ScriptClip(cg,"FAST_ZOOM(dstx=Spline(current_frame,0,"+String(cg_width_half)+"-("+String(move_offset_half)+"*("+String(dir_x)+")),"+String(cg_frame_count)+","+String(cg_width_half)+"+("+String(move_offset_half)+"*("+String(dir_x)+")),cubic=false)," \
		+"dsty=Spline(current_frame,0,"+String(cg_height_half)+"-("+String(move_offset_half)+"*("+String(dir_y)+")),"+String(cg_frame_count)+","+String(cg_height_half)+"+("+String(move_offset_half)+"*("+String(dir_y)+")),cubic=false),factor="+String(scale)+",extend=true)")
}

######## Pre Combine ########

fade_length=12

koufuku_graffiti_tv_05_shiina_s_mother_bring_cookie=koufuku_graffiti_tv_05_shiina_s_mother_bring_cookie_01+koufuku_graffiti_tv_05_shiina_s_mother_bring_cookie_02

koufuku_graffiti_tv_03_ryou_kirin_shiina_watch_tv_drama_first_last=TRIM_FIRST_CLIP(koufuku_graffiti_tv_03_ryou_kirin_shiina_watch_tv_drama,70)+TRIM_LAST_CLIP(koufuku_graffiti_tv_03_ryou_kirin_shiina_watch_tv_drama,70)

koufuku_graffiti_tv_07_tsuyuko_talk_with_ryou_and_cat_sleep_on_roof_moving=MOVE_CG(TRIM_MIDDLE_CLIP(koufuku_graffiti_tv_07_tsuyuko_talk_with_ryou_and_cat_sleep_on_roof,131),-1,0,128.0,1.1)
koufuku_graffiti_tv_02_ryou_see_kirin_s_sketch_moving=MOVE_CG(TRIM_MIDDLE_CLIP(koufuku_graffiti_tv_02_ryou_see_kirin_s_sketch,79),1,0,128.0,1.1)
koufuku_graffiti_tv_06_ryou_sleep_on_grandmother_s_leg_moving=MOVE_CG(TRIM_MIDDLE_CLIP(koufuku_graffiti_tv_06_ryou_sleep_on_grandmother_s_leg,87),0,1,72.0,1.1)

koufuku_graffiti_tv_04_ryou_fly_to_dream_01=TRIM_FIRST_CLIP(koufuku_graffiti_tv_04_ryou_fly_to_dream,105)
koufuku_graffiti_tv_04_ryou_fly_to_dream_02=Trim(koufuku_graffiti_tv_04_ryou_fly_to_dream,105,-4)
koufuku_graffiti_tv_04_ryou_fly_to_dream_03=Trim(koufuku_graffiti_tv_04_ryou_fly_to_dream,105+4,-5)

######## Combine ########

# koufuku_graffiti_tv_clean_op_01 11
# koufuku_graffiti_tv_clean_op_02 2198
# koufuku_graffiti_tv_clean_op_03 5277
# koufuku_graffiti_tv_clean_op_04 6181



koufuku_graffiti_tv_op_t01=BlankClip(koufuku_graffiti_tv_clean_op,length=11,color=color_black)+koufuku_graffiti_tv_clean_op_01
koufuku_graffiti_tv_op_t02=TRIM_FIRST_CLIP(koufuku_graffiti_tv_05_shiina_s_mother_bring_cookie,141)+TRIM_LAST_CLIP(koufuku_graffiti_tv_01_kirin_see_ryou_eat_inari_sushi,113)+TRIM_MIDDLE_CLIP(koufuku_graffiti_tv_02_ryou_turn_her_head_back_01,17)+TRIM_FIRST_CLIP(koufuku_graffiti_tv_09_kirin_cry_and_punished_by_mother,17) \
	+TRIM_MIDDLE_CLIP(koufuku_graffiti_tv_03_ryou_kirin_shiina_watch_tv_drama_first_last,140)+TRIM_FIRST_CLIP(koufuku_graffiti_tv_08_ryou_and_classmates,78)+TRIM_MIDDLE_CLIP(koufuku_graffiti_tv_07_tsuyuko_talk_with_ryou_and_cat_sleep_on_roof_moving,131)

koufuku_graffiti_tv_op_t03=TRIM_MIDDLE_CLIP(koufuku_graffiti_tv_03_ryou_show_omurice_01,99)+TRIM_FIRST_CLIP(koufuku_graffiti_tv_03_ryou_show_omurice_02,79)+TRIM_FIRST_CLIP(koufuku_graffiti_tv_03_ryou_show_omurice_03,54) \
	+TRIM_FIRST_CLIP(koufuku_graffiti_tv_04_ryou_disappointed_02,42)+TRIM_MIDDLE_CLIP(koufuku_graffiti_tv_01_kirin_catch_ryou_s_scarf,70)+TRIM_MIDDLE_CLIP(koufuku_graffiti_tv_10_yuki_run_in_pizza_world_02,79)+TRIM_MIDDLE_CLIP(koufuku_graffiti_tv_02_ryou_see_kirin_s_sketch_moving,79) \
	+TRIM_LAST_CLIP(koufuku_graffiti_tv_02_kirin_and_ryou_see_sakura_trees,91)+TRIM_MIDDLE_CLIP(koufuku_graffiti_tv_04_ryou_fly_to_dream_01,105) \
	+BlankClip(koufuku_graffiti_tv_clean_op,length=2,color=color_white)+Trim(koufuku_graffiti_tv_05_kirin_ready_to_fight,8,-4) \
	+TRIM_MIDDLE_CLIP(koufuku_graffiti_tv_04_ryou_fly_to_dream_02,4)+Trim(koufuku_graffiti_tv_05_kirin_ready_to_fight,27,-5)+TRIM_MIDDLE_CLIP(koufuku_graffiti_tv_04_ryou_fly_to_dream_03,5) \
	+BlankClip(koufuku_graffiti_tv_clean_op,length=2,color=color_white)+Trim(koufuku_graffiti_tv_05_kirin_ready_to_fight,15,-3)
koufuku_graffiti_tv_op_t04=koufuku_graffiti_tv_clean_op_02+TRIM_FIRST_CLIP(koufuku_graffiti_tv_01_kirin_dash,77)+TRIM_FIRST_CLIP(koufuku_graffiti_tv_07_tsuyuko_order_01,30) \
	+TRIM_MIDDLE_CLIP(koufuku_graffiti_tv_02_akira_kiss_ryou,14)+TRIM_MIDDLE_CLIP(koufuku_graffiti_tv_07_kirin_cooking,9) \
	+TRIM_MIDDLE_CLIP(koufuku_graffiti_tv_06_shiina_see_sunshine,9)+TRIM_MIDDLE_CLIP(koufuku_graffiti_tv_05_shiina_s_mother_sit_near_fan,8)
koufuku_graffiti_tv_op_t05=TRIM_FIRST_CLIP(koufuku_graffiti_tv_07_train_departure,35)+TRIM_FIRST_CLIP(koufuku_graffiti_tv_09_kirin_dash_to_ryou,105)+TRIM_MIDDLE_CLIP(koufuku_graffiti_tv_10_yuki_cry,35)+TRIM_MIDDLE_CLIP(koufuku_graffiti_tv_06_ryou_sleep_on_grandmother_s_leg_moving,87)+TRIM_FIRST_CLIP(koufuku_graffiti_tv_02_ryou_close_to_kirin,17) \
	+TRIM_MIDDLE_CLIP(koufuku_graffiti_tv_04_camera_toward_ryou_from_soup,35)+TRIM_LAST_CLIP(koufuku_graffiti_tv_08_ryou_feel_delicious,79)+TRIM_FIRST_CLIP(koufuku_graffiti_tv_09_kirin_catch_ryou_s_hand,96)+TRIM_MIDDLE_CLIP(koufuku_graffiti_tv_02_shiina_thumb_up,70)

koufuku_graffiti_tv_op_t06=TRIM_MIDDLE_CLIP(koufuku_graffiti_tv_10_yuki_walking,140)+TRIM_FIRST_CLIP(koufuku_graffiti_tv_09_akira_ryou_kirin_worship_to_god,139)
koufuku_graffiti_tv_op_t07=TRIM_MIDDLE_CLIP(koufuku_graffiti_tv_08_ryou_walking_and_kirin_skipping,140)+TRIM_LAST_CLIP(koufuku_graffiti_tv_08_kirin_talk_with_her_mother,139) \
	+TRIM_FIRST_CLIP(koufuku_graffiti_tv_03_kirin_pull_down_shiina,139)+TRIM_MIDDLE_CLIP(koufuku_graffiti_tv_09_ryou_feel_delicious,140) \
	+TRIM_FIRST_CLIP(koufuku_graffiti_tv_01_kirin_unhappy,139)+TRIM_LAST_CLIP(koufuku_graffiti_tv_04_ryou_walk_in_rain,70) \
	+TRIM_MIDDLE_CLIP(koufuku_graffiti_tv_06_grandmother_and_ryou_sit_near_fan,140)+TRIM_MIDDLE_CLIP(koufuku_graffiti_tv_10_yuki_alone_01,70)+TRIM_MIDDLE_CLIP(koufuku_graffiti_tv_05_wind_chime_night,69)

koufuku_graffiti_tv_op_t08=TRIM_FIRST_CLIP(koufuku_graffiti_tv_09_kirin_hug_ryou_from_back,139)+TRIM_MIDDLE_CLIP(koufuku_graffiti_tv_04_ryou_walk_in_supermarket_02,140) \
	+TRIM_MIDDLE_CLIP(koufuku_graffiti_tv_07_shiina_s_mother_and_ryou_walking_across_garden,139)+TRIM_FIRST_CLIP(koufuku_graffiti_tv_05_shiina_s_pond_02,105)
koufuku_graffiti_tv_op_t09=koufuku_graffiti_tv_clean_op_03+TRIM_FIRST_CLIP(koufuku_graffiti_tv_08_ryou_happy_running,112)+TRIM_MIDDLE_CLIP(koufuku_graffiti_tv_10_ryou_and_kirin_hear_yuki_talking_with_mobile_phone,96) \
	+TRIM_FIRST_CLIP(koufuku_graffiti_tv_01_kirin_dash_across_gate,139)+TRIM_MIDDLE_CLIP(koufuku_graffiti_tv_04_ryou_shout,70)+TRIM_MIDDLE_CLIP(koufuku_graffiti_tv_06_kirin_fly_to_heaven,67) \
	+koufuku_graffiti_tv_clean_op_04+BlankClip(koufuku_graffiti_tv_clean_op,length=24*7,color=color_black)



koufuku_graffiti_tv_op_mute=koufuku_graffiti_tv_op_t01+FADE_IN_WITH_BRIGHTNESS_OFFSET_RGB24(koufuku_graffiti_tv_op_t02,fade_length) \
	+koufuku_graffiti_tv_op_t03+koufuku_graffiti_tv_op_t04+koufuku_graffiti_tv_op_t05 \
	+DOUBLE_FADE_WITH_BRIGHTNESS_OFFSET_RGB24(DOUBLE_FADE_WITH_BRIGHTNESS_OFFSET_RGB24(FADE_IN_WITH_BRIGHTNESS_OFFSET_RGB24(koufuku_graffiti_tv_op_t06,fade_length),koufuku_graffiti_tv_op_t07,fade_length,fade_length), \
	koufuku_graffiti_tv_op_t08,fade_length,fade_length)+koufuku_graffiti_tv_op_t09

######## Music ########

bgm_48khz=SSRC(WAVSource("src\koufuku_graffiti-tv-op-01.wav"),48000)

bgm_48khz_nico=SSRC(FFMS2_VIDEO_SOURCE("src\koufuku_graffiti-tv-op-miku.mp4"),48000) # for uploading to nicovideo
bgm_48khz_nico=Trim(bgm_48khz_nico,2,0)

AudioDub(koufuku_graffiti_tv_op_mute,bgm_48khz)
#AudioDub(koufuku_graffiti_tv_op_mute,bgm_48khz_nico)



thumbnail=Trim(6181,-24*5)

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

function SUBTITLE_FX(clip clip,string text,float x,float y,int start_frame,int end_frame,bool "is_title"){
	is_title=Default(is_title,false)

	text_color=is_title?color_pink:subtitle_text_color

	return SUBTITLE_FX_FADE_IN_FADE_OUT(clip,text,Round(x),Round(y),start_frame,end_frame,subtitle_front_fade_count,subtitle_rear_fade_count,subtitle_font,subtitle_effects,Round(subtitle_size),text_color,subtitle_halo_color)
}

SUBTITLE_FX("幸せについて私が知っている5つの方法//坂本真綾|- by fielia@AVISynth",-subtitle_x,subtitle_x,6472,6562,true)

SUBTITLE_FX(""""幸せ"という気持ちに最初に気づいた人が""",subtitle_x,subtitle_y,137,272)
SUBTITLE_FX("名前をつけたのかな それは",subtitle_x,subtitle_y,287,369)
SUBTITLE_FX("誰かに伝えたいほど不思議でとても愛しい",subtitle_x,subtitle_y,383,514)
SUBTITLE_FX("そんな感情だから",subtitle_x,subtitle_y,529,599)
SUBTITLE_FX("成層圏の彼方まで舞い上がってしまうくらいに",subtitle_x,subtitle_y,609,837)

SUBTITLE_FX("""目に見えない"幸せ"は 心のどこかからやって来るの""",subtitle_x,subtitle_y,841,1118)
SUBTITLE_FX("少し恥ずかしがりやな そのしっぽ 離さないでね",subtitle_x,subtitle_y,1119,1469)

SUBTITLE_FX(""""淋しい"という気持ちに最初に気づいた人は""",subtitle_x,subtitle_y,1498,1633)
SUBTITLE_FX("恋をしていたのかな きっと",subtitle_x,subtitle_y,1647,1730)
SUBTITLE_FX("誰か大切な人にとなりにいて欲しくて",subtitle_x,subtitle_y,1743,1875)
SUBTITLE_FX("大好きになったから",subtitle_x,subtitle_y,1892,1962)
SUBTITLE_FX("エメラルドグリーンの海に飛び込んでしまいたいほど",subtitle_x,subtitle_y,1970,2200)

SUBTITLE_FX("""手にとれない"幸せ"は 誰かと一緒にいると分かるの""",subtitle_x,subtitle_y,2202,2479)
SUBTITLE_FX("こぼれそうなその笑顔 うれしくて 触れたいくらい",subtitle_x,subtitle_y,2481,2833)

SUBTITLE_FX("会いたい日は 会いたいって言おうよ",subtitle_x,subtitle_y,2864,2976)
SUBTITLE_FX("泣きたい夜は 声あげて泣こう",subtitle_x,subtitle_y,3002,3112)
SUBTITLE_FX("美味しい時は 美味しいって言おうよ",subtitle_x,subtitle_y,3143,3252)
SUBTITLE_FX("大好きな君に",subtitle_x,subtitle_y,3256,3425)

SUBTITLE_FX("そしていつか たくさんのハッピーを",subtitle_x,subtitle_y,3661,3805)
SUBTITLE_FX("クッキーみたいに バラまいて 誰かのこと",subtitle_x,subtitle_y,3811,3948)
SUBTITLE_FX("もっと幸せにできたなら 私も幸せになれる",subtitle_x,subtitle_y,3953,4304)
SUBTITLE_FX("もっと きっと もっと",subtitle_x,subtitle_y,4310,4615)

SUBTITLE_FX("""目に見えない"幸せ"は 心のどこかからやって来るの""",subtitle_x,subtitle_y,4747,5024)
SUBTITLE_FX("少し恥ずかしがりやな そのしっぽ 離さずいてね",subtitle_x,subtitle_y,5026,5389)

SUBTITLE_FX("会いたい日は 会いたいって言おうよ",subtitle_x,subtitle_y,5410,5526)
SUBTITLE_FX("泣きたい夜は 声あげて泣こう",subtitle_x,subtitle_y,5548,5658)
SUBTITLE_FX("美味しい時は 美味しいって言おうよ",subtitle_x,subtitle_y,5689,5798)
SUBTITLE_FX("大好きな君に",subtitle_x,subtitle_y,5803,5936)
SUBTITLE_FX("もっと素直になれたなら",subtitle_x,subtitle_y,5949,6175)
SUBTITLE_FX("""幸せな日は "幸せ"って言おうよ""",subtitle_x,subtitle_y,6176,6286)
SUBTITLE_FX("大好きな君に",subtitle_x,subtitle_y,6291,6501)



#thumbnail

######## Post Processing ########

ConvertToYV12()
#ConvertToYUY2()
#ConvertToRGB24()

TCPServer()
