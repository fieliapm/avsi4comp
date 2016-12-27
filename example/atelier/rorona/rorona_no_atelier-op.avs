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



Import("..\..\..\avsi4comp\avsi4comp.avsi")

######## Function ########

function CROP_PV_DVD(clip clip){
	return Crop(clip,0,58,720,364)
}

function FIT_OP_WEB(clip clip){
	return RESIZE_TO_REF_CLIP(clip,rorona_op_web)
}

######## Source ########

global rorona_op_web=SSRC(FFMS2_VIDEO_SOURCE("src\movie\A11_OP_web.flv",fpsnum=24000,fpsden=1001),48000)

rorona_pv_dvd_01_audio=WAVSource("src\dvd\VTS_01_1 T80 2_0ch 192Kbps 48KHz.wav")
rorona_pv_dvd_01=AudioDub(CROP_PV_DVD(VOB_MPEG2_VIDEO_SOURCE("src\dvd\VTS_01_1.d2v")),rorona_pv_dvd_01_audio)
rorona_pv_dvd_01_cache02=AudioDub(CROP_PV_DVD(VOB_MPEG2_VIDEO_SOURCE("src\dvd\VTS_01_1.d2v")),rorona_pv_dvd_01_audio)

rorona_pv_dvd_03_audio=WAVSource("src\dvd\VTS_03_1 T80 2_0ch 192Kbps 48KHz.wav")
rorona_pv_dvd_03=AudioDub(CROP_PV_DVD(VOB_MPEG2_VIDEO_SOURCE("src\dvd\VTS_03_1.d2v")),rorona_pv_dvd_03_audio)
rorona_pv_dvd_03_cache02=AudioDub(CROP_PV_DVD(VOB_MPEG2_VIDEO_SOURCE("src\dvd\VTS_03_1.d2v")),rorona_pv_dvd_03_audio)
rorona_pv_dvd_03_cache03=AudioDub(CROP_PV_DVD(VOB_MPEG2_VIDEO_SOURCE("src\dvd\VTS_03_1.d2v")),rorona_pv_dvd_03_audio)
rorona_pv_dvd_03_cache04=AudioDub(CROP_PV_DVD(VOB_MPEG2_VIDEO_SOURCE("src\dvd\VTS_03_1.d2v")),rorona_pv_dvd_03_audio)
rorona_pv_dvd_03_cache05=AudioDub(CROP_PV_DVD(VOB_MPEG2_VIDEO_SOURCE("src\dvd\VTS_03_1.d2v")),rorona_pv_dvd_03_audio)

######## Opening ########
                                              # ntsc_film
rorona_op_web_01=Trim(rorona_op_web,0,980)    # 0~980
rorona_op_web_02=Trim(rorona_op_web,981,1439) # 981~1439

rorona_op_web_01=ChangeFPS(rorona_op_web_01,rorona_pv_dvd_01)
rorona_op_web_02=ChangeFPS(rorona_op_web_02,rorona_pv_dvd_01)

######## PV Demo ########

rorona_demo_01=Trim(rorona_pv_dvd_01,1606,1735) # source is to 1832 but trim to 1735
rorona_demo_02=Trim(rorona_pv_dvd_03,2274,2918)

######## PV Story ########

rorona_story_01=Trim(rorona_pv_dvd_01,0,1163)
rorona_story_02=Trim(rorona_pv_dvd_03,0,1047)

filter_expression="ColorYUV(off_u=-32.0,cont_u=-256.0,off_v=32.0,cont_v=-256.0)"
rorona_story_01_post_processed=APPLY_RANGE(APPLY_RANGE(rorona_story_01,378,518,filter_expression),680,859,filter_expression)
rorona_story=Dissolve(rorona_story_01_post_processed,rorona_story_02,130)

#PV-01
rorona_op_pv_01=Dissolve(rorona_demo_02,rorona_story,127)

######## PV Gallery ########

rorona_gallery_01=Trim(rorona_pv_dvd_01,1833,2075)
rorona_gallery_02=Trim(rorona_pv_dvd_01_cache02,3226,3386)
rorona_gallery_03=Trim(rorona_pv_dvd_03,2159,2273)

rorona_gallery_t01=DOUBLE_FADE_WITH_BRIGHTNESS_OFFSET_RGB24(rorona_gallery_03,rorona_gallery_02,30,30)

#PV-02
rorona_op_pv_02=Dissolve(rorona_gallery_t01,rorona_gallery_01,39)+rorona_demo_01

######## PV Character ########

rorona_character_01=Trim(rorona_pv_dvd_03_cache02,1308,1748)
rorona_character_02=Trim(rorona_pv_dvd_03_cache03,1749,2158)
rorona_character_03=Trim(rorona_pv_dvd_03_cache04,2919,3391)
rorona_character_04=Trim(rorona_pv_dvd_03_cache05,3392,3891)

rorona_character_01_rescaled=RESCALE(rorona_character_01,0.5,0.5)
rorona_character_02_rescaled=RESCALE(rorona_character_02,0.5,0.5)
rorona_character_03_rescaled=RESCALE(rorona_character_03,0.5,0.5)
rorona_character_04_rescaled=RESCALE(rorona_character_04,0.5,0.5)

rorona_character_01_framecount=Framecount(rorona_character_01_rescaled)

bg=BlankClip(rorona_pv_dvd_01,length=rorona_character_01_framecount,color=color_black)
bg=Overlay(bg,rorona_character_03_rescaled,x=0,y=202,opacity=1.0)
bg=Overlay(bg,rorona_character_04_rescaled,x=360,y=0,opacity=1.0)

rorona_character_t01=LINEAR_MOVE(bg,"rorona_character_02_rescaled","Add",0,rorona_character_01_framecount,270,182,1.0,360,91,1.0)

#PV-Character
rorona_character=LINEAR_MOVE(rorona_character_t01,"rorona_character_01_rescaled","Add",0,rorona_character_01_framecount,90,0,1.0,0,91,1.0)

######## Combine ########

#                   ntsc_video
# rorona_op_web_01  3
# rorona_op_web_02  4781
# rorona_story_02   2772
# rorona_gallery_03 4171
# rorona_demo_02    1220

rorona_op_t01=BlankClip(rorona_op_web_01,length=3,color=color_black)+rorona_op_web_01
rorona_op_t02=Dissolve(rorona_op_t01,FIT_OP_WEB(rorona_op_pv_01),9)
rorona_op_t03=Dissolve(rorona_op_t02,FIT_OP_WEB(rorona_character),85)
rorona_op_t04=Dissolve(rorona_op_t03,FIT_OP_WEB(rorona_op_pv_02),5)
rorona_op_mute=DOUBLE_FADE_WITH_BRIGHTNESS_OFFSET_RGB24(rorona_op_t04,rorona_op_web_02,15,15)+BlankClip(rorona_op_web_01,length=180,color=color_white)

######## Music ########

bgm_48khz=SSRC(WAVSource("src\rorona_no_atelier-ost-01-01.wav"),48000)
AudioDub(rorona_op_mute,bgm_48khz)

######## Subtitle ########

subtitle_x=50
subtitle_y=400
global subtitle_front_fade_count=15
global subtitle_rear_fade_count=30
global subtitle_font="MS Gothic"
global subtitle_effects="bi"
global subtitle_size=28
global subtitle_text_color=OVERWRITE_COLOR_ALPHA(color_gold,$2F)
global subtitle_halo_color=color_black

function SUBTITLE_FX(clip clip,string text,float x,float y,int start_frame,int end_frame,bool "is_title"){
	is_title=Default(is_title,false)

	halo_color=is_title?color_firebrick:subtitle_halo_color

	return SUBTITLE_FX_SLIDE_IN_WATER_OUT(clip,text,x,y,start_frame,end_frame,subtitle_front_fade_count,subtitle_rear_fade_count,subtitle_font,subtitle_effects,subtitle_size,subtitle_text_color,halo_color)
}

SUBTITLE_FX("Falling, The Star Light//éRñ{î¸îHéq|- by fielia@AVISynth",subtitle_x,subtitle_y-subtitle_size,60,150,true)

SUBTITLE_FX("îﬁï˚Ç…åıÇÈêØÇÕ âìÇ≠â ÇƒÇ»Ç´ñ¢óàÇ",subtitle_x,subtitle_y,243,500)
SUBTITLE_FX("é¶Ç∑Ç´ÇÁÇﬂÇ´ ç~ÇËíçÇ¨ÇæÇ∑",subtitle_x,subtitle_y,500,900)
SUBTITLE_FX("Ç‡ÇµÇ‡Ç±ÇÃãπÇÃíÜ ñÇñ@Ç™èhÇÈÇ»ÇÁ",subtitle_x,subtitle_y,1210,1460)
SUBTITLE_FX("âΩÇäêÇ¶ÇÊÇ§Ç©Ç» ñ≤ àÏÇÍèoÇ∑",subtitle_x,subtitle_y,1460,1800)

SUBTITLE_FX("îﬁï˚Ç…â‡Çﬁñ∂ÇÕ âìÇ¢ãLâØÇÃã∑ä‘Ç≈",subtitle_x,subtitle_y,4270,4530)
SUBTITLE_FX("íQÇ≠Ç¥ÇÌÇﬂÇ´ åı ç∑ÇµçûÇﬁÇÊ",subtitle_x,subtitle_y,4530,4770)
SUBTITLE_FX("ócÇ¢ì˙Ç…é∏Ç≠ÇµÇΩ Ç†Ç»ÇΩÇÃïÛï®",subtitle_x,subtitle_y,4780,5010)
SUBTITLE_FX("ëÅÇ≠ìÕÇØÇΩÇ¢Ç» ñ≤ â ÇƒÇµÇ»Ç≠",subtitle_x,subtitle_y,5010,5300)

######## Post Processing ########

ConvertToYV12()
#ConvertToYUY2()
#ConvertToRGB24()

TCPServer()
