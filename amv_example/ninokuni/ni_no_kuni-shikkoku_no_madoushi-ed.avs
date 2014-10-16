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



Import("..\avsi4comp\macro.avsi")

#SetMemoryMax(64)

######## PV Online (640*360) ########

video_fps="ntsc_video"

ninokuni_ds_cm_pv=AssumeFPS(FFMS2_VIDEO_SOURCE("src\official\ninokuni_ds_cm_pv_h.flv"),video_fps)
ninokuni_ds_pv=AssumeFPS(FFMS2_VIDEO_SOURCE("src\official\ninokuni_ds_pv_h.flv"),video_fps)
ninokuni_ds_pv2=AssumeFPS(FFMS2_VIDEO_SOURCE("src\official\ninokuni_ds_pv2_h.flv"),video_fps)
ninokuni_ds_pv2_cache02=AssumeFPS(FFMS2_VIDEO_SOURCE("src\official\ninokuni_ds_pv2_h.flv"),video_fps)
ninokuni_ds_tgs_2010=AssumeFPS(FFMS2_VIDEO_SOURCE("src\famitsutube\ni_no_kuni-shikkoku_no_madoushi-tgs_2010.flv"),video_fps)

######## PV Online (854*478) ########

_ninokuni_tgs_2009=AssumeFPS(FFMS2_VIDEO_SOURCE("src\famitsutube\ni_no_kuni-tgs_2009.flv"),video_fps)
global ninokuni_tgs_2009=AddBorders(_ninokuni_tgs_2009,0,0,2,2)

######## Trim ########

#ninokuni_ds_cm_pv_01_anime_01=Trim(ninokuni_ds_cm_pv,0,118)
ninokuni_ds_cm_pv_01_anime_02=Trim(ninokuni_ds_cm_pv,119,179)
ninokuni_ds_cm_pv_01_anime_03=Trim(ninokuni_ds_cm_pv,180,206)
#ninokuni_ds_cm_pv_01_anime_04=Trim(ninokuni_ds_cm_pv,207,294)
ninokuni_ds_cm_pv_01_anime_05=Trim(ninokuni_ds_cm_pv,295,317)
ninokuni_ds_cm_pv_02_demo=Trim(ninokuni_ds_cm_pv,318,387)
ninokuni_ds_cm_pv_03_distribution=Trim(ninokuni_ds_cm_pv,388,449)
ninokuni_ds_cm_pv_04_blank=Trim(ninokuni_ds_cm_pv,450,0)

#ninokuni_ds_pv_01_level5_logo=Trim(ninokuni_ds_pv,0,328)
ninokuni_ds_pv_02_scroll=Trim(ninokuni_ds_pv,329,1347)
#ninokuni_ds_pv_03_ninokuni_logo=Trim(ninokuni_ds_pv,1348,1600)
#ninokuni_ds_pv_04_anime_01=Trim(ninokuni_ds_pv,1601,1819)
ninokuni_ds_pv_04_anime_02=Trim(ninokuni_ds_pv,1820,2046)
ninokuni_ds_pv_05_magic_master_01=Trim(ninokuni_ds_pv,2047,3270)
ninokuni_ds_pv_05_magic_master_02=Trim(ninokuni_ds_pv,3271,5737)
ninokuni_ds_pv_05_magic_master_03=Trim(ninokuni_ds_pv,5738,5971)
ninokuni_ds_pv_05_magic_master_04=Trim(ninokuni_ds_pv,5972,6978)
#ninokuni_ds_pv_06_anime_01=Trim(ninokuni_ds_pv,6979,7069)
ninokuni_ds_pv_06_anime_02=Trim(ninokuni_ds_pv,7070,7226)
ninokuni_ds_pv_07_anime_demo=Trim(ninokuni_ds_pv,7227,7618)
#ninokuni_ds_pv_08_anime_01=Trim(ninokuni_ds_pv,7619,7809)
#ninokuni_ds_pv_08_anime_02=Trim(ninokuni_ds_pv,7810,8154)
ninokuni_ds_pv_09_ninokuni_logo=Trim(ninokuni_ds_pv,8155,8278)
#ninokuni_ds_pv_10_anime=Trim(ninokuni_ds_pv,8279,8513)
ninokuni_ds_pv_11_distribution=Trim(ninokuni_ds_pv,8514,0)

#ninokuni_ds_pv2_01_level5_logo=Trim(ninokuni_ds_pv2,0,365)
ninokuni_ds_pv2_02_anime=Trim(ninokuni_ds_pv2,366,912)
ninokuni_ds_pv2_03_ninokuni_logo=Trim(ninokuni_ds_pv2,913,1097)
ninokuni_ds_pv2_04_anime=Trim(ninokuni_ds_pv2,1098,1563)
ninokuni_ds_pv2_05_demo=Trim(ninokuni_ds_pv2,1564,2542)
ninokuni_ds_pv2_06_anime_01=Trim(ninokuni_ds_pv2,2543,3128)
#ninokuni_ds_pv2_06_anime_02=Trim(ninokuni_ds_pv2,3129,3404)
ninokuni_ds_pv2_07_demo=Trim(ninokuni_ds_pv2,3405,3704)
ninokuni_ds_pv2_08_anime=Trim(ninokuni_ds_pv2,3705,3764)
ninokuni_ds_pv2_09_comment=Trim(ninokuni_ds_pv2,3765,3843)
ninokuni_ds_pv2_10_ninokuni_logo=Trim(ninokuni_ds_pv2,3844,4000)
ninokuni_ds_pv2_11_anime=Trim(ninokuni_ds_pv2_cache02,4001,4193)
ninokuni_ds_pv2_12_distribution=Trim(ninokuni_ds_pv2,4194,0)

ninokuni_ds_tgs_2010_01_level5_logo=Trim(ninokuni_ds_tgs_2010,0,404)
ninokuni_ds_tgs_2010_02_anime_01=Trim(ninokuni_ds_tgs_2010,405,1294)
ninokuni_ds_tgs_2010_02_anime_02=Trim(ninokuni_ds_tgs_2010,1295,1380)
ninokuni_ds_tgs_2010_03_anime_ninokuni_logo=Trim(ninokuni_ds_tgs_2010,1381,1776)
ninokuni_ds_tgs_2010_04_anime=Trim(ninokuni_ds_tgs_2010,1777,2088)
ninokuni_ds_tgs_2010_05_demo=Trim(ninokuni_ds_tgs_2010,2089,2879)
#ninokuni_ds_tgs_2010_06_anime_01=Trim(ninokuni_ds_tgs_2010,2880,3203)
#ninokuni_ds_tgs_2010_06_anime_02=Trim(ninokuni_ds_tgs_2010,3204,3506)
ninokuni_ds_tgs_2010_07_demo=Trim(ninokuni_ds_tgs_2010,3507,3785)
ninokuni_ds_tgs_2010_08_ninokuni_logo_deluxe=Trim(ninokuni_ds_tgs_2010,3786,3929)
#ninokuni_ds_tgs_2010_09_anime=Trim(ninokuni_ds_tgs_2010,3930,3989)
ninokuni_ds_tgs_2010_10_comment=Trim(ninokuni_ds_tgs_2010,3990,4161)
ninokuni_ds_tgs_2010_11_distribution=Trim(ninokuni_ds_tgs_2010,4162,0)

ninokuni_tgs_2009_01_level5_logo=Trim(ninokuni_tgs_2009,0,208)
ninokuni_tgs_2009_02_anime=Trim(ninokuni_tgs_2009,209,1550)
ninokuni_tgs_2009_03_ninokuni_logo_extend=Trim(ninokuni_tgs_2009,1551,2217)
ninokuni_tgs_2009_04_anime_01=Trim(ninokuni_tgs_2009,2218,2627)
ninokuni_tgs_2009_04_anime_02=Trim(ninokuni_tgs_2009,2628,2961)
ninokuni_tgs_2009_05_anime_demo=Trim(ninokuni_tgs_2009,2962,3499)
ninokuni_tgs_2009_06_anime=Trim(ninokuni_tgs_2009,3500,3776)
ninokuni_tgs_2009_07_comment=Trim(ninokuni_tgs_2009,3777,3896)
ninokuni_tgs_2009_08_demo_01=Trim(ninokuni_tgs_2009,3897,4237)
ninokuni_tgs_2009_08_demo_02=Trim(ninokuni_tgs_2009,4238,4798)
ninokuni_tgs_2009_09_anime_demo_anime_01=Trim(ninokuni_tgs_2009,4799,5544)
ninokuni_tgs_2009_09_anime_demo_anime_02=Trim(ninokuni_tgs_2009,5545,5690)
ninokuni_tgs_2009_09_anime_demo_anime_03=Trim(ninokuni_tgs_2009,5691,6467)
ninokuni_tgs_2009_10_anime_comment=Trim(ninokuni_tgs_2009,6468,6619)
ninokuni_tgs_2009_11_ninokuni_logo=Trim(ninokuni_tgs_2009,6620,6765)
ninokuni_tgs_2009_12_anime=Trim(ninokuni_tgs_2009,6766,6939)
ninokuni_tgs_2009_13_distribution=Trim(ninokuni_tgs_2009,6940,0)

######## Pre Combine ########

ninokuni_ds_cm_pv_01_anime=ninokuni_ds_cm_pv_01_anime_03+ninokuni_ds_cm_pv_01_anime_05+ninokuni_ds_cm_pv_01_anime_02+ninokuni_ds_pv_04_anime_02
ninokuni_ds_pv_02_scroll_trimmed=Trim(ninokuni_ds_pv_02_scroll,390,0)
ninokuni_ds_pv2_02_anime_trimmed=Trim(ninokuni_ds_pv2_02_anime,0,524)



overlay_clip_blend_mode="Add"
ninokuni_ds_pv2_08_anime_start=30
ninokuni_ds_pv2_11_anime_start=60

overlay_clip=ninokuni_tgs_2009_02_anime
overlay_clip=Trim(overlay_clip,40,0)
ninokuni_ds_pv2_08_anime_rescaled=RESCALE(ninokuni_ds_pv2_08_anime,0.667,0.667)
ninokuni_ds_pv2_11_anime_rescaled=RESCALE(ninokuni_ds_pv2_11_anime,0.667,0.667)
overlay_clip=LINEAR_MOVE(overlay_clip,"ninokuni_ds_pv2_08_anime_rescaled",overlay_clip_blend_mode,ninokuni_ds_pv2_08_anime_start,Framecount(ninokuni_ds_pv2_08_anime)-1,0,0,1.0,100,100,0.0)
overlay_clip=LINEAR_MOVE(overlay_clip,"ninokuni_ds_pv2_11_anime_rescaled",overlay_clip_blend_mode,ninokuni_ds_pv2_11_anime_start,Framecount(ninokuni_ds_pv2_11_anime)-1,427,0,1.0,227,200,0.0)

######## Combine ########

function RESIZE_TO_480P(clip clip){
	return RESIZE_TO_REF_CLIP(clip,ninokuni_tgs_2009)
}

ninokuni_shikkoku_no_madoushi_ed_t01=BlankClip(ninokuni_tgs_2009,length=35,color=color_black)+RESIZE_TO_480P(ninokuni_ds_pv2_07_demo)
ninokuni_shikkoku_no_madoushi_ed_t02=RESIZE_TO_480P(FADE_IN_WITH_BRIGHTNESS_OFFSET_RGB24(ninokuni_ds_pv_02_scroll_trimmed,15))+ninokuni_tgs_2009_04_anime_01+RESIZE_TO_480P(ninokuni_ds_tgs_2010_02_anime_02)
ninokuni_shikkoku_no_madoushi_ed_t03=Dissolve(RESIZE_TO_480P(ninokuni_ds_tgs_2010_02_anime_01),RESIZE_TO_480P(ninokuni_ds_pv2_03_ninokuni_logo),FadeOut(ninokuni_tgs_2009_04_anime_02,15,color_black),32)
ninokuni_shikkoku_no_madoushi_ed_t04=RESIZE_TO_480P(ninokuni_ds_pv2_05_demo+ninokuni_ds_pv_06_anime_02)
ninokuni_shikkoku_no_madoushi_ed_t05=Dissolve(RESIZE_TO_480P(ninokuni_ds_pv2_06_anime_01+ninokuni_ds_cm_pv_01_anime),ninokuni_tgs_2009_07_comment,25)
ninokuni_shikkoku_no_madoushi_ed_t06=RESIZE_TO_480P(ninokuni_ds_tgs_2010_04_anime)+Dissolve(overlay_clip,RESIZE_TO_480P(ninokuni_ds_tgs_2010_10_comment),90)
ninokuni_shikkoku_no_madoushi_ed_t07=RESIZE_TO_480P(ninokuni_ds_pv2_02_anime_trimmed+CLIP_SPEED(ninokuni_ds_tgs_2010_08_ninokuni_logo_deluxe,0.5,true))+BlankClip(ninokuni_tgs_2009,length=90,color=color_black)

ninokuni_shikkoku_no_madoushi_ed_mute=ninokuni_shikkoku_no_madoushi_ed_t01+ninokuni_shikkoku_no_madoushi_ed_t02+ninokuni_shikkoku_no_madoushi_ed_t03 \
	+DOUBLE_FADE_WITH_BRIGHTNESS_OFFSET_RGB24(ninokuni_shikkoku_no_madoushi_ed_t04,ninokuni_shikkoku_no_madoushi_ed_t05,15,15)+ninokuni_shikkoku_no_madoushi_ed_t06+ninokuni_shikkoku_no_madoushi_ed_t07

######## Music ########

bgm_48khz=SSRC(WAVSource("src\ni_no_kuni-shikkoku_no_madoushi-ost-21.wav"),48000)
AudioDub(ninokuni_shikkoku_no_madoushi_ed_mute,bgm_48khz)

######## Subtitle ########

subtitle_x=50
subtitle_y=400
global subtitle_front_fade_count=15
global subtitle_rear_fade_count=30
global subtitle_font="MS Gothic"
global subtitle_effects="bi"
global subtitle_size=28
global subtitle_text_color=OVERWRITE_COLOR_ALPHA(color_gold,$3F)
global subtitle_halo_color=color_black

function SUBTITLE_FX(clip clip,string text,float x,float y,int start_frame,int end_frame,bool "is_title"){
	is_title=Default(is_title,false)

	halo_color=is_title?color_firebrick:subtitle_halo_color

	return SUBTITLE_FX_SLIDE_IN_WATER_OUT(clip,text,x,y,start_frame,end_frame,subtitle_front_fade_count,subtitle_rear_fade_count,subtitle_font,subtitle_effects,subtitle_size,subtitle_text_color,halo_color)
}

SUBTITLE_FX("êSÇÃÇ©ÇØÇÁ//ñÉàﬂ|- by fielia@AVISynth",subtitle_x,subtitle_y-subtitle_size,7190,7435,true)

SUBTITLE_FX("îíÇ¢órâ_ í«Ç¢Ç©ÇØÇƒëñÇ¡ÇΩ",subtitle_x,subtitle_y,330,622)
SUBTITLE_FX("Ç¢Ç¬Ç©Ç†ÇÃãÛÇ… ìÕÇ´ÇªÇ§Ç»ãCÇ™ÇµÇƒ",subtitle_x,subtitle_y,642,927)

SUBTITLE_FX("ó‹ÇÃ ÇµÇ∏Ç≠ÇÕ",subtitle_x,subtitle_y,953,1095)
SUBTITLE_FX("äÛñ]ÇÃó∆Ç∆",subtitle_x,subtitle_y,1110,1233)
SUBTITLE_FX("ã≥Ç¶Çƒ Ç≠ÇÍÇΩÇÊ",subtitle_x,subtitle_y,1238,1387)

SUBTITLE_FX("âÔÇ¢ÇΩÇ¢ Ç‡Ç§àÍìx ã≠Ç≠ï¯Ç´ÇµÇﬂÇƒ",subtitle_x,subtitle_y,1430,1738)
SUBTITLE_FX("êSÇÃÇ©ÇØÇÁÇ å©Ç¬ÇØÇÈó∑Ç…Ç≈ÇÊÇ§",subtitle_x,subtitle_y,1748,2047)
SUBTITLE_FX("îﬂÇµÇ›ÇÃå¸Ç±Ç§ä›ÇÃ êVÇµÇ¢ê¢äEÇ÷",subtitle_x,subtitle_y,2060,2472)

SUBTITLE_FX("óyÇ©êÃÇ©ÇÁ Ç¬Ç»Ç™ÇÍÇΩ„JÇ…",subtitle_x,subtitle_y,2805,3102)
SUBTITLE_FX("ñΩëIÇŒÇÍÇƒ ê∂Ç‹ÇÍÇÈÇ∆Ç¢Ç§äÔê’",subtitle_x,subtitle_y,3123,3418)

SUBTITLE_FX("ê‚ñ]ÇÃó‹",subtitle_x,subtitle_y,3442,3583)
SUBTITLE_FX("ã~Ç§åıÇ",subtitle_x,subtitle_y,3596,3717)
SUBTITLE_FX("Ç†Ç»ÇΩÇ™ è∆ÇÁÇµÇΩ",subtitle_x,subtitle_y,3720,3889)

SUBTITLE_FX("Ç‹Ç‘ÇΩï¬Ç∂ÇÍÇŒ ïÇÇ©Ç‘Ç†ÇÃèŒäÁ",subtitle_x,subtitle_y,3921,4207)
SUBTITLE_FX("àÍêlÇ≈Ç‡ïΩãCÇ≥ Ç†Ç»ÇΩÇÕÇ±Ç±Ç…Ç¢ÇÈÇ©ÇÁ",subtitle_x,subtitle_y,4227,4532)
SUBTITLE_FX("ñ¢óàÇ÷Ç∆ë±Ç≠ìπÇ ñlÇÕç° êiÇﬁÇÊ",subtitle_x,subtitle_y,4539,4954)

SUBTITLE_FX("âÔÇ¢ÇΩÇ¢ Ç‡Ç§àÍìx ã≠Ç≠ï¯Ç´ÇµÇﬂÇƒ",subtitle_x,subtitle_y,5621,5923)
SUBTITLE_FX("êSÇÃÇ©ÇØÇÁÇ å©Ç¬ÇØÇÈó∑Ç…èoÇÊÇ§",subtitle_x,subtitle_y,5926,6223)
SUBTITLE_FX("Ç†ÇÃåıÇ…ïÔÇ‹ÇÍÇΩ êVÇµÇ¢ê¢äEÇ÷",subtitle_x,subtitle_y,6229,6640)

######## Post Processing ########

ConvertToYV12()
#ConvertToYUY2()
#ConvertToRGB24()

TCPServer()
