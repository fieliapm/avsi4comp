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

Import("..\avsi4comp\macro.avsi")

### inherit end ###

Import("shingeki_no_kyojin-tv-common-02.avsi")

######## Pre Combine ########

LoadVirtualDubPlugin("..\plugins\msu_oldcinema_20.vdf","MSU_OldCinema")

function OLD_CINEMA(clip clip){
	return MSU_OldCinema(ConvertToRGB32(clip),255,255,255,0,0,0,30,70,15,3,30,10,30,150,0,2,100)
}



fade_length=12

shingeki_no_kyojin_tv_16_104th_corps_graduates_see_other_people_leave=TRIM_MIDDLE_CLIP(shingeki_no_kyojin_tv_16_104th_corps_graduates_see_other_people_leave_09,63)+TRIM_MIDDLE_CLIP(shingeki_no_kyojin_tv_16_104th_corps_graduates_see_other_people_leave_05,62)

######## Combine ########

# shingeki_no_kyojin_tv_clean_ed_02_01 26
# shingeki_no_kyojin_tv_clean_ed_02_02
# shingeki_no_kyojin_tv_clean_ed_02_03 4305



shingeki_no_kyojin_tv_ed_02_t01=BlankClip(shingeki_no_kyojin_tv_clean_ed_02,length=26,color=color_black)+shingeki_no_kyojin_tv_clean_ed_02_01+shingeki_no_kyojin_tv_clean_ed_02_02
shingeki_no_kyojin_tv_ed_02_t02=TRIM_FIRST_CLIP(shingeki_no_kyojin_tv_22_levi_cut_megata_no_kyojin_s_arm_and_eye,120)+TRIM_FIRST_CLIP(shingeki_no_kyojin_tv_17_armin_fall_down,62)+TRIM_MIDDLE_CLIP(shingeki_no_kyojin_tv_25_mikasa_cut_megata_no_kyojin_s_hand_01,55)

shingeki_no_kyojin_tv_ed_02_t03=TRIM_MIDDLE_CLIP(shingeki_no_kyojin_tv_15_hanji_light_kyojin,125)+TRIM_MIDDLE_CLIP(shingeki_no_kyojin_tv_16_levi_squad_discuss,94)+TRIM_MIDDLE_CLIP(shingeki_no_kyojin_tv_24_mikasa_attack_megata_no_kyojin_01,31)+TRIM_MIDDLE_CLIP(shingeki_no_kyojin_tv_17_reiner_armin_jean_follow_megata_no_kyojin,125)+TRIM_LAST_CLIP(shingeki_no_kyojin_tv_18_levi_order_petra_forward_message,120) \
shingeki_no_kyojin_tv_ed_02_t04=TRIM_MIDDLE_CLIP(shingeki_no_kyojin_tv_14_eren_remember_mikasa_armin_protect_him,125)+TRIM_FIRST_CLIP(shingeki_no_kyojin_tv_17_armin_think_mikasa_levi_s_attack,94)+TRIM_MIDDLE_CLIP(shingeki_no_kyojin_tv_16_104th_corps_graduates_see_other_people_leave,125)+TRIM_LAST_CLIP(shingeki_no_kyojin_tv_24_hanji_ready_to_catch_megata_no_kyojin,67)
shingeki_no_kyojin_tv_ed_02_t05=TRIM_MIDDLE_CLIP(shingeki_no_kyojin_tv_22_levi_cut_megata_no_kyojin_leg_and_nape,125)+TRIM_FIRST_CLIP(shingeki_no_kyojin_tv_21_mikasa_get_mad_04,125)+TRIM_MIDDLE_CLIP(shingeki_no_kyojin_tv_18_forest_inside,126)+TRIM_MIDDLE_CLIP(shingeki_no_kyojin_tv_19_megata_no_kyojin_dash,62) \
	+TRIM_LAST_CLIP(shingeki_no_kyojin_tv_23_annie_training_with_her_father,94)+TRIM_FIRST_CLIP(shingeki_no_kyojin_tv_20_levi_and_mike_try_to_take_annie_out_04,94)

shingeki_no_kyojin_tv_ed_02_t06=TRIM_LAST_CLIP(shingeki_no_kyojin_tv_20_eldo_say_there_may_be_spy_in_survey_corps,125)+TRIM_MIDDLE_CLIP(shingeki_no_kyojin_tv_21_kyojin_eren_punch_megata_no_kyojin_01,125)+TRIM_MIDDLE_CLIP(shingeki_no_kyojin_tv_21_mikasa_cannot_kill_megata_no_kyojin,125)+TRIM_FIRST_CLIP(shingeki_no_kyojin_tv_21_annie_disappear,125)
shingeki_no_kyojin_tv_ed_02_t07=TRIM_MIDDLE_CLIP(shingeki_no_kyojin_tv_19_eren_stuck_in_kyojin_body_02,125)+TRIM_LAST_CLIP(shingeki_no_kyojin_tv_25_wall_secret,125)

shingeki_no_kyojin_tv_ed_02_t08=TRIM_MIDDLE_CLIP(shingeki_no_kyojin_tv_21_petra_auruo_cut_megata_no_kyojin_s_arm,125)+TRIM_LAST_CLIP(shingeki_no_kyojin_tv_18_megata_no_kyojin_kill_soldier,131)
shingeki_no_kyojin_tv_ed_02_t09=shingeki_no_kyojin_tv_clean_ed_02_03+BlankClip(shingeki_no_kyojin_tv_clean_ed_02,length=24*1,color=color_black)



shingeki_no_kyojin_tv_ed_02_mute=shingeki_no_kyojin_tv_ed_02_t01+ConvertToYV12(OLD_CINEMA(shingeki_no_kyojin_tv_ed_02_t02 \
	+FadeIn0(shingeki_no_kyojin_tv_ed_02_t03,fade_length)+FADE_OUT_WITH_BRIGHTNESS_OFFSET(shingeki_no_kyojin_tv_ed_02_t04,fade_length)+DOUBLE_FADE_WITH_BRIGHTNESS_OFFSET(shingeki_no_kyojin_tv_ed_02_t05, \
	shingeki_no_kyojin_tv_ed_02_t06,fade_length,fade_length)+FADE_OUT_WITH_BRIGHTNESS_OFFSET(shingeki_no_kyojin_tv_ed_02_t07,fade_length) \
	+shingeki_no_kyojin_tv_ed_02_t08))+shingeki_no_kyojin_tv_ed_02_t09

shingeki_no_kyojin_tv_ed_02_mute

### prefetch: 5,2

### ###

""")

######## Music ########

bgm_48khz=SSRC(WAVSource("src\shingeki_no_kyojin-tv-ed-02-01.wav"),48000)
AudioDub(bgm_48khz)



thumbnail=Trim(4450,-24*5)

######## Subtitle ########

global subtitle_clip_width=1280
global subtitle_clip_height=720

subtitle_x=50*1.5
subtitle_y=400*1.5
global subtitle_front_fade_count=24
global subtitle_rear_fade_count=24
global subtitle_font="MS Gothic"
global subtitle_effects="bi"
global subtitle_size=24*1.5
global subtitle_text_color=color_white
global subtitle_halo_color=color_orangered

function SUBTITLE_FX(clip clip,string text,float x,float y,int start_frame,int end_frame,bool "is_kana",bool "is_title"){
	is_kana=Default(is_kana,false)
	is_title=Default(is_title,false)

	halo_color=is_title?OVERWRITE_COLOR_ALPHA(color_orangered,$3F):subtitle_halo_color
	size=is_kana?subtitle_size*0.5:subtitle_size

	return SUBTITLE_FX_FLY_IN_FLY_OUT(clip,text,Round(x),Round(y),start_frame,end_frame,subtitle_front_fade_count,subtitle_rear_fade_count,subtitle_font,subtitle_effects,Round(size),subtitle_text_color,halo_color)
}

SUBTITLE_FX("great escape//cinema staff|- by fielia@AVISynth",-subtitle_x,subtitle_y-subtitle_size,4835,4930,is_title=true)

SUBTITLE_FX("例えば俺が俺じゃないとして、お前はお前だと言いきれるのか?",subtitle_x,subtitle_y,357,606)
SUBTITLE_FX("砂の器を壊して、こぼれた心を拾って集められるか?",subtitle_x,subtitle_y-(subtitle_size*2),607,857)

SUBTITLE_FX("誰かの呼ぶ声が耳鳴りに変わった。",subtitle_x,subtitle_y,858,1073)
SUBTITLE_FX("時が止まったみたいだ。さあ、目を覚ませ。",subtitle_x,subtitle_y-(subtitle_size*2),1077,1266)

SUBTITLE_FX("                                                 はやて",subtitle_x,subtitle_y-(subtitle_size/2),1269,1513,is_kana=true)
SUBTITLE_FX("深い闇を俺は抜け出した。疾風みたいに逃げ出した。",subtitle_x,subtitle_y,1269,1513)
SUBTITLE_FX("生きた屍みたいだった俺達は、壁の外へ。",subtitle_x,subtitle_y-(subtitle_size*2),1519,1755)

SUBTITLE_FX("例えば世界に光が無いとして、お前はお前を見つけられるか?",subtitle_x,subtitle_y,1756,2005)
SUBTITLE_FX("スローモーションで映った景色のピースを数えて繋げられるか?",subtitle_x,subtitle_y-(subtitle_size*2),2007,2255)

SUBTITLE_FX("誰かの泣き声が地響きに変わった。",subtitle_x,subtitle_y,2257,2472)
SUBTITLE_FX("ゼロから始めよう。さらば、最後の夜。",subtitle_x,subtitle_y-(subtitle_size*2),2475,2667)

SUBTITLE_FX("長い夢を俺は抜け出した。赤い身体で逃げ出した。",subtitle_x,subtitle_y,2668,2914)
SUBTITLE_FX("          けだもの",subtitle_x,subtitle_y-(subtitle_size/2)-(subtitle_size*2),2918,3156,is_kana=true)
SUBTITLE_FX("飢えた獣みたいだった、俺達の目。",subtitle_x,subtitle_y-(subtitle_size*2),2918,3156)

SUBTITLE_FX("嵐の彼方へ踏み込み、手を伸ばし、",subtitle_x,subtitle_y,3294,3539)
SUBTITLE_FX("               やいば",subtitle_x,subtitle_y-(subtitle_size/2)-(subtitle_size*2),3543,4042,is_kana=true)
SUBTITLE_FX("刺さった刃をおもいきり抜いて言った。「俺はお前だ」",subtitle_x,subtitle_y-(subtitle_size*2),3543,4042)

SUBTITLE_FX("                                                 はやて",subtitle_x,subtitle_y-(subtitle_size/2),4044,4289,is_kana=true)
SUBTITLE_FX("深い闇を俺は抜け出した。疾風みたいに逃げ出した。",subtitle_x,subtitle_y,4044,4289)
SUBTITLE_FX("生きた屍みたいだった俺達は、壁の外へ。",subtitle_x,subtitle_y-(subtitle_size*2),4294,4523)
SUBTITLE_FX("また会おうぜ、地図にない場所で。",subtitle_x,subtitle_y,4524,4675)



#thumbnail

######## Post Processing ########

ConvertToYV12()
#ConvertToYUY2()
#ConvertToRGB24()

TCPServer()
