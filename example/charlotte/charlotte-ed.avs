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

Import("charlotte-common.avsi")

### inherit end ###

######## Function ########

function SCALE_CG(clip cg,float center_x,float center_y,float scale_start){
	cg_frame_count=Framecount(cg)

	return ScriptClip(cg,"FAST_ZOOM(srcx="+String(center_x)+",srcy="+String(center_y)+",dstx="+String(center_x)+",dsty="+String(center_y)+",factor=Spline(current_frame,0,"+String(scale_start)+","+String(cg_frame_count)+",1.0))")
}

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

last_dissolve_length=61
charlotte_clean_ed_06_extend=Dissolve(charlotte_clean_ed_06,MOVE_CG(STILL_LAST_FRAME(charlotte_13_nao_smile,78+last_dissolve_length),0,1,108.0,1.1),last_dissolve_length)

charlotte_02_nao_and_yuu_look_at_sea_scaling=SCALE_CG(STILL_MIDDLE_FRAME(charlotte_02_nao_and_yuu_look_at_sea,354),1440.0,540.0,2.0)
charlotte_05_nao_yuu_joujirou_yusa_hiking_03_moving=MOVE_CG(STILL_MIDDLE_FRAME(charlotte_05_nao_yuu_joujirou_yusa_hiking_03,354),1,0,192.0,1.1)

charlotte_04_nao_and_yuu_discuss_in_baseball_field_moving=MOVE_CG(STILL_LAST_FRAME(charlotte_04_nao_and_yuu_discuss_in_baseball_field,354),0,1,108.0,1.1)

charlotte_05_nao_fishing_scaling=SCALE_CG(STILL_MIDDLE_FRAME(charlotte_05_nao_fishing,354),960.0,540.0,2.0)
charlotte_02_nao_show_bentou_to_yuu_scaling=SCALE_CG(STILL_LAST_FRAME(charlotte_02_nao_show_bentou_to_yuu,354),240.0,135.0,2.0)
charlotte_02_little_nao_happy_moving=MOVE_CG(STILL_FRAME(charlotte_02_little_nao_happy,4,45),0,-1,108.0,1.1)

charlotte_03_nao_talk_near_port_scaling=SCALE_CG(STILL_MIDDLE_FRAME(charlotte_03_nao_talk_near_port,354),1440.0,540.0,2.0)

######## Combine ########

# charlotte_clean_ed_01 22
# charlotte_clean_ed_02 745
# charlotte_clean_ed_03 3576 or 5391
# charlotte_clean_ed_04 5658
# charlotte_clean_ed_05 6188
# charlotte_clean_ed_06 6808



charlotte_ed_t01=BlankClip(charlotte_clean_ed,length=22,color=color_black)+charlotte_clean_ed_01+STILL_MIDDLE_FRAME(charlotte_02_nao_listen_music,354)

charlotte_ed_t02=charlotte_clean_ed_02+STILL_FIRST_FRAME(charlotte_11_nao_wake_up,354)
charlotte_ed_t03=STILL_FRAME(charlotte_09_nao_ask_yuu_not_to_buy,55,267)+STILL_FRAME(charlotte_13_nao_cry,44,87)
charlotte_ed_t04=charlotte_02_nao_and_yuu_look_at_sea_scaling+charlotte_05_nao_yuu_joujirou_yusa_hiking_03_moving

charlotte_ed_t05=charlotte_04_nao_and_yuu_discuss_in_baseball_field_moving

charlotte_ed_t06=STILL_FIRST_FRAME(charlotte_06_nao_discuss_with_yuu,354)+STILL_LAST_FRAME(charlotte_10_nao_smile_to_yuu,354)
charlotte_ed_t07=charlotte_clean_ed_03+TRIM_MIDDLE_CLIP(charlotte_08_nao_see_yusa_s_pv,87)
charlotte_ed_t08=charlotte_05_nao_fishing_scaling+charlotte_02_nao_show_bentou_to_yuu_scaling+charlotte_02_little_nao_happy_moving

charlotte_ed_t09=STILL_FRAME(charlotte_12_nao_stand_up_and_leave,134,354)+STILL_MIDDLE_FRAME(charlotte_01_nao_appear_behind_ayumi,354)

charlotte_ed_t10=TRIM_FIRST_CLIP(charlotte_07_nao_see_night_sky,267)
charlotte_ed_t11=charlotte_clean_ed_04+charlotte_clean_ed_05
charlotte_ed_t12=charlotte_03_nao_talk_near_port_scaling+charlotte_clean_ed_06_extend+BlankClip(charlotte_clean_op,length=24*13,color=color_black)



charlotte_ed_mute=charlotte_ed_t01 \
	+charlotte_ed_t02+charlotte_ed_t03+charlotte_ed_t04 \
	+charlotte_ed_t05 \
	+charlotte_ed_t06+charlotte_ed_t07+charlotte_ed_t08 \
	+charlotte_ed_t09 \
	+charlotte_ed_t10+charlotte_ed_t11+charlotte_ed_t12

charlotte_ed_mute

### export clip: charlotte_ed_mute

### prefetch: 5,2

### ###

######## Subtitle ########

### inherit start ###

#global subtitle_heavy_halo_width=1
global subtitle_clip_width=1920
global subtitle_clip_height=1080

subtitle_x=50*2.25
subtitle_y=395*2.25
global subtitle_front_fade_count=8
global subtitle_rear_fade_count=8
global subtitle_font="MS Gothic"
global subtitle_effects="b"
global subtitle_size=32*2.25
global subtitle_text_color=color_white
global subtitle_halo_color=color_black

function SUBTITLE_FX(clip clip,string text,float x,float y,int start_frame,int end_frame,bool "is_title"){
	is_title=Default(is_title,false)

	halo_color=is_title?color_purple:subtitle_halo_color
	return SUBTITLE_FX_FADE_IN_FADE_OUT(clip,text,Round(x),Round(y),start_frame,end_frame,subtitle_front_fade_count,subtitle_rear_fade_count,subtitle_font,subtitle_effects,Round(subtitle_size),subtitle_text_color,halo_color,"ex_thick_reduce_memory")
}

### inherit end ###

ConvertToRGB32()

SUBTITLE_FX("Œ©“n‚¹‚éêŠ‚É¡’©‚Í’H‚è’…‚­",subtitle_x,subtitle_y,749,920)
SUBTITLE_FX("‰“‚­ü˜H‚ªL‚Ñ‚é",subtitle_x,subtitle_y,927,1051)
SUBTITLE_FX("‚±‚Ñ‚è‚Â‚¢‚½“y‚©‚©‚Æ‚©‚ç—‚Æ‚µ",subtitle_x,subtitle_y,1104,1268)
SUBTITLE_FX("•à‚¢‚½‹——£‚ğ‘ª‚Á‚Ä‚İ‚½‚è",subtitle_x,subtitle_y,1269,1446)

SUBTITLE_FX("‘O”¯‚ğ—h‚ç‚·‚æ‚¤‚É•—‚ª‹­‚­‚¢‚½‚ç",subtitle_x,subtitle_y,1457,1634)
SUBTITLE_FX("‚à‚¤‰½‚à–À‚í‚È‚¢",subtitle_x,subtitle_y,1635,1770)

SUBTITLE_FX("¢ŠE‚Ì‰Ê‚Ä‚³‚¦–l‚ç‚Í’m‚ç‚È‚¢",subtitle_x,subtitle_y,1777,1955)
SUBTITLE_FX("”ß‚µ‚Ü‚¸¶‚«‚ép‚à‚Á‚Ä‚È‚¢",subtitle_x,subtitle_y,1956,2131)
SUBTITLE_FX("–Úw‚·‚±‚Ìæ‚É‘Ò‚Á‚Ä‚é—E‹C",subtitle_x,subtitle_y,2132,2308)
SUBTITLE_FX("‚»‚ê‚ğè‚É‚µ‚½‚çI‚í‚é–²‚ğŒ©‚½",subtitle_x,subtitle_y,2309,2516)

SUBTITLE_FX("F‚ñ‚Èˆ¥AŒJ‚è•Ô‚µ‚Ä‚«‚½",subtitle_x,subtitle_y,2874,3044)
SUBTITLE_FX("•À‚Ô”’‚¢•‚Í“¯‚¶",subtitle_x,subtitle_y,3051,3174)
SUBTITLE_FX("‘å‚°‚³‚ÈƒoƒbƒO‚Ü‚¾‚©‚ç‚Á‚Û‚¾‚¯‚Ç",subtitle_x,subtitle_y,3228,3394)
SUBTITLE_FX("‚½‚¢‚µ‚Ä‚¢‚é‚à‚Ì‚È‚ñ‚©‚È‚©‚Á‚½",subtitle_x,subtitle_y,3395,3574)

SUBTITLE_FX("—¼•G‚ğ’n‚É’…‚­‚Æ‚Ü‚½•—‚ª‚´‚í‚ß‚¢‚Ä",subtitle_x,subtitle_y,3583,3759)
SUBTITLE_FX("–l‚Ì”w’†‚ğ‰Ÿ‚·",subtitle_x,subtitle_y,3760,3894)

### pass clip: charlotte_ed_mute

### prefetch: 5,2

### ###

SUBTITLE_FX("‹ó‚ª•Ï‚í‚è‰Ê‚Ä–l‚ç‚Í–°‚é",subtitle_x,subtitle_y,3903,4078)
SUBTITLE_FX("–¾“ú‚Ö‚Ì‰Ë‚¯‹´‚È‚ñ‚Æ‚©“n‚Á‚Ä",subtitle_x,subtitle_y,4081,4256)
SUBTITLE_FX("–{“–‚Ì‹­‚³‚ğ’N‚à‚Á‚Ä‚È‚¢",subtitle_x,subtitle_y,4257,4433)
SUBTITLE_FX("–ÚŠo‚ß‚½‚ç‚·‚®‚É¡“ú‚à•à‚«o‚»‚¤",subtitle_x,subtitle_y,4434,4647)

SUBTITLE_FX("‚»‚ë‚»‚ë‚²”Ñ‚Ìx“x‚ğ‚µ‚È‚«‚á",subtitle_x,subtitle_y,4687,4855)
SUBTITLE_FX("“|‚ê‚Ä‚µ‚Ü‚¤‘O‚É",subtitle_x,subtitle_y,4867,4992)
SUBTITLE_FX("…‚ğŒC‚Å‚·‚­‚Á‚Äˆù‚ñ‚¾",subtitle_x,subtitle_y,4993,5158)
SUBTITLE_FX("‚¾‚ç‚µ‚È‚­‚È‚é",subtitle_x,subtitle_y,5160,5247)
SUBTITLE_FX("‚Ğ‚Æ‚è‚¾‚Æ",subtitle_x,subtitle_y,5248,5316)

SUBTITLE_FX("‘O”¯‚ğ—h‚ç‚·‚Ù‚Ç•—‚ª‹­‚­‚¢‚½‚ç",subtitle_x,subtitle_y,5397,5573)
SUBTITLE_FX("‚±‚±‚ğ—£‚ê‚é‡}",subtitle_x,subtitle_y,5574,5703)

SUBTITLE_FX("¢ŠE‚Ì‰Ê‚Ä‚³‚¦–l‚ç‚Í’m‚ç‚È‚¢",subtitle_x,subtitle_y,5717,5894)
SUBTITLE_FX("”ß‚µ‚Ü‚¸¶‚«‚ép‚à‚Á‚Ä‚È‚¢",subtitle_x,subtitle_y,5896,6071)
SUBTITLE_FX("–Úw‚·‚±‚Ìæ‚É‘Ò‚Á‚Ä‚é—E‹C",subtitle_x,subtitle_y,6072,6248)
SUBTITLE_FX("‚»‚ê‚ğè‚É‚µ‚½‚çI‚í‚é–²‚ğŒ©‚½",subtitle_x,subtitle_y,6249,6425)
SUBTITLE_FX("‹ó‚ª•Ï‚í‚è‰Ê‚Ä¯‚Í„‚Á‚Ä‚ä‚­",subtitle_x,subtitle_y,6426,6601)
SUBTITLE_FX("–ÚŠo‚ß‚½‚ç‚·‚®‚É¡“ú‚à•à‚«o‚»‚¤",subtitle_x,subtitle_y,6603,6810)

SUBTITLE_FX("Ü‚¯—‚¿‚È‚¢—ƒ//‘½“cˆ¨|- by fielia@AVISynth",-subtitle_x,subtitle_y-subtitle_size,6987,7257,true)

######## Thumbnail ########

is_thumbnail=false

is_thumbnail?charlotte_ed_mute:last

######## Music ########

bgm_48khz=SSRC(WAVSource("src\charlotte-op-ed-02.wav"),48000)
AudioDub(bgm_48khz)



thumbnail=Trim(6068,-24*5)
is_thumbnail?thumbnail:last

""")

######## Post Processing ########

ConvertToYV12()
#ConvertToYUY2()
#ConvertToRGB24()

TCPServer()
