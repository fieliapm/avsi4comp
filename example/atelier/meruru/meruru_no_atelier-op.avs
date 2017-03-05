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

######## PV Online (720P) ########

meruru_op=FFMS2_VIDEO_SOURCE("src\special\movie\a13-op.mp4",fpsnum=30,fpsden=1) # fps 30

meruru_op_01=Trim(meruru_op,0,2182)
meruru_op_02=Trim(meruru_op,2183,0)



meruru_dengeki_promotion_movie=AssumeFPS(FFMS2_VIDEO_SOURCE("src\special\movie\a13-dengeki_promotion_movie.mp4"),"ntsc_video")
meruru_dengeki_promotion_movie_cache02=AssumeFPS(FFMS2_VIDEO_SOURCE("src\special\movie\a13-dengeki_promotion_movie.mp4"),"ntsc_video")

meruru_dengeki_promotion_movie_01=Trim(meruru_dengeki_promotion_movie,0,211)
meruru_dengeki_promotion_movie_02=Trim(meruru_dengeki_promotion_movie,212,534)

meruru_dengeki_promotion_movie_03_01=Trim(meruru_dengeki_promotion_movie,535,696)
meruru_dengeki_promotion_movie_03_02=Trim(meruru_dengeki_promotion_movie_cache02,697,848)

meruru_dengeki_promotion_movie_04_01=Trim(meruru_dengeki_promotion_movie,849,1033)
meruru_dengeki_promotion_movie_04_02=Trim(meruru_dengeki_promotion_movie_cache02,1034,1182)
meruru_dengeki_promotion_movie_04_03=Trim(meruru_dengeki_promotion_movie,1183,1356)
meruru_dengeki_promotion_movie_04_04=Trim(meruru_dengeki_promotion_movie_cache02,1357,1445)

meruru_dengeki_promotion_movie_04_a=Dissolve(meruru_dengeki_promotion_movie_04_02,meruru_dengeki_promotion_movie_04_01,64)
meruru_dengeki_promotion_movie_04_b=Dissolve(meruru_dengeki_promotion_movie_04_04,meruru_dengeki_promotion_movie_04_03,47)

meruru_dengeki_promotion_movie_05=Trim(meruru_dengeki_promotion_movie,1446,1722)
meruru_dengeki_promotion_movie_06=Trim(meruru_dengeki_promotion_movie,1723,2176)
meruru_dengeki_promotion_movie_06_trimmed=Trim(meruru_dengeki_promotion_movie_06,0,424)

meruru_dengeki_promotion_movie_07_01=Trim(meruru_dengeki_promotion_movie,2177,2296)
meruru_dengeki_promotion_movie_07_02=Trim(meruru_dengeki_promotion_movie,2297,2375)
meruru_dengeki_promotion_movie_07_03=Trim(meruru_dengeki_promotion_movie_cache02,2376,3706)

meruru_dengeki_promotion_movie_08=Trim(meruru_dengeki_promotion_movie_cache02,3707,3797)
meruru_dengeki_promotion_movie_09=Trim(meruru_dengeki_promotion_movie,3798,0)



meruru_tvcm=FFMS2_VIDEO_SOURCE("src\special\movie\a13-tvcm.mp4",fpsnum=30000,fpsden=1001) # fps 30000/1001

meruru_tvcm_01=Trim(meruru_tvcm,0,29)
meruru_tvcm_02=Trim(meruru_tvcm,30,523)
meruru_tvcm_03=Trim(meruru_tvcm,524,709)
meruru_tvcm_04=Trim(meruru_tvcm,710,0)

######## PV Online (360P) ########

meruru_play_director_take_out_01=FFMS2_VIDEO_SOURCE("src\special\play\a13-director_take_out-01.flv",fpsnum=30000,fpsden=1001) # fps 30000/1001

#meruru_play_director_take_out_01_01=Trim(meruru_play_director_take_out_01,0,247)
meruru_play_director_take_out_01_02=Trim(meruru_play_director_take_out_01,248,1822) # framecount 1575
#meruru_play_director_take_out_01_03=Trim(meruru_play_director_take_out_01,1823,0)

######## Pre Combine ########

overlay_clip=meruru_dengeki_promotion_movie_06_trimmed
meruru_play_director_take_out_01_02_rescaled=RESCALE(meruru_play_director_take_out_01_02,1.0,1.0)

overlay_clip_blend_mode="Blend"
overlay_clip_position_offset_start=180
overlay_clip_position_offset_end=overlay_clip_position_offset_start-90
overlay_clip_position_x=640-Width(meruru_play_director_take_out_01_02_rescaled)*0.5
overlay_clip_position_y=360-Height(meruru_play_director_take_out_01_02_rescaled)*0.5

overlay_clip_start=46
overlay_clip_group_interval=54
overlay_clip_offset_01=14
overlay_clip_offset_02=27
overlay_clip_offset_03=36
overlay_clip_disappear=17

overlay_clip_trim_interval=110

overlay_clip_01_01_time=overlay_clip_start+overlay_clip_group_interval*0
overlay_clip_01_02_time=overlay_clip_start+overlay_clip_group_interval*0+overlay_clip_offset_01
overlay_clip_01_03_time=overlay_clip_start+overlay_clip_group_interval*0+overlay_clip_offset_02
overlay_clip_01_04_time=overlay_clip_start+overlay_clip_group_interval*0+overlay_clip_offset_03

overlay_clip_02_01_time=overlay_clip_start+overlay_clip_group_interval*1
overlay_clip_02_02_time=overlay_clip_start+overlay_clip_group_interval*1+overlay_clip_offset_01
overlay_clip_02_03_time=overlay_clip_start+overlay_clip_group_interval*1+overlay_clip_offset_02
overlay_clip_02_04_time=overlay_clip_start+overlay_clip_group_interval*1+overlay_clip_offset_03

overlay_clip_03_01_time=overlay_clip_start+overlay_clip_group_interval*2
overlay_clip_03_02_time=overlay_clip_start+overlay_clip_group_interval*2+overlay_clip_offset_01
overlay_clip_03_03_time=overlay_clip_start+overlay_clip_group_interval*2+overlay_clip_offset_02
overlay_clip_03_04_time=overlay_clip_start+overlay_clip_group_interval*2+overlay_clip_offset_03

overlay_clip_trim01=Trim(meruru_play_director_take_out_01_02_rescaled,overlay_clip_trim_interval*0,0)
overlay_clip_trim02=Trim(meruru_play_director_take_out_01_02_rescaled,overlay_clip_trim_interval*1,0)
overlay_clip_trim03=Trim(meruru_play_director_take_out_01_02_rescaled,overlay_clip_trim_interval*2,0)
overlay_clip_trim04=Trim(meruru_play_director_take_out_01_02_rescaled,overlay_clip_trim_interval*3,0)
overlay_clip_trim05=Trim(meruru_play_director_take_out_01_02_rescaled,overlay_clip_trim_interval*4,0)
overlay_clip_trim06=Trim(meruru_play_director_take_out_01_02_rescaled,overlay_clip_trim_interval*5,0)
overlay_clip_trim07=Trim(meruru_play_director_take_out_01_02_rescaled,overlay_clip_trim_interval*6,0)
overlay_clip_trim08=Trim(meruru_play_director_take_out_01_02_rescaled,overlay_clip_trim_interval*7,0)
overlay_clip_trim09=Trim(meruru_play_director_take_out_01_02_rescaled,overlay_clip_trim_interval*8,0)
overlay_clip_trim10=Trim(meruru_play_director_take_out_01_02_rescaled,overlay_clip_trim_interval*9,0)
overlay_clip_trim11=Trim(meruru_play_director_take_out_01_02_rescaled,overlay_clip_trim_interval*10,0)
overlay_clip_trim12=Trim(meruru_play_director_take_out_01_02_rescaled,overlay_clip_trim_interval*11,0)

overlay_clip=LINEAR_MOVE(overlay_clip,"overlay_clip_trim01",overlay_clip_blend_mode,overlay_clip_01_01_time,overlay_clip_01_01_time+overlay_clip_disappear,overlay_clip_position_x-overlay_clip_position_offset_start,overlay_clip_position_y-overlay_clip_position_offset_start,1.0,overlay_clip_position_x-overlay_clip_position_offset_end,overlay_clip_position_y-overlay_clip_position_offset_end,0.0,overwrite=true)
overlay_clip=LINEAR_MOVE(overlay_clip,"overlay_clip_trim02",overlay_clip_blend_mode,overlay_clip_01_02_time,overlay_clip_01_02_time+overlay_clip_disappear,overlay_clip_position_x+overlay_clip_position_offset_start,overlay_clip_position_y-overlay_clip_position_offset_start,1.0,overlay_clip_position_x+overlay_clip_position_offset_end,overlay_clip_position_y-overlay_clip_position_offset_end,0.0,overwrite=true)
overlay_clip=LINEAR_MOVE(overlay_clip,"overlay_clip_trim03",overlay_clip_blend_mode,overlay_clip_01_03_time,overlay_clip_01_03_time+overlay_clip_disappear,overlay_clip_position_x-overlay_clip_position_offset_start,overlay_clip_position_y+overlay_clip_position_offset_start,1.0,overlay_clip_position_x-overlay_clip_position_offset_end,overlay_clip_position_y+overlay_clip_position_offset_end,0.0,overwrite=true)
overlay_clip=LINEAR_MOVE(overlay_clip,"overlay_clip_trim04",overlay_clip_blend_mode,overlay_clip_01_04_time,overlay_clip_01_04_time+overlay_clip_disappear,overlay_clip_position_x+overlay_clip_position_offset_start,overlay_clip_position_y+overlay_clip_position_offset_start,1.0,overlay_clip_position_x+overlay_clip_position_offset_end,overlay_clip_position_y+overlay_clip_position_offset_end,0.0,overwrite=true)

overlay_clip=LINEAR_MOVE(overlay_clip,"overlay_clip_trim05",overlay_clip_blend_mode,overlay_clip_02_01_time,overlay_clip_02_01_time+overlay_clip_disappear,overlay_clip_position_x-overlay_clip_position_offset_start,overlay_clip_position_y-overlay_clip_position_offset_start,1.0,overlay_clip_position_x-overlay_clip_position_offset_end,overlay_clip_position_y-overlay_clip_position_offset_end,0.0,overwrite=true)
overlay_clip=LINEAR_MOVE(overlay_clip,"overlay_clip_trim06",overlay_clip_blend_mode,overlay_clip_02_02_time,overlay_clip_02_02_time+overlay_clip_disappear,overlay_clip_position_x+overlay_clip_position_offset_start,overlay_clip_position_y-overlay_clip_position_offset_start,1.0,overlay_clip_position_x+overlay_clip_position_offset_end,overlay_clip_position_y-overlay_clip_position_offset_end,0.0,overwrite=true)
overlay_clip=LINEAR_MOVE(overlay_clip,"overlay_clip_trim07",overlay_clip_blend_mode,overlay_clip_02_03_time,overlay_clip_02_03_time+overlay_clip_disappear,overlay_clip_position_x-overlay_clip_position_offset_start,overlay_clip_position_y+overlay_clip_position_offset_start,1.0,overlay_clip_position_x-overlay_clip_position_offset_end,overlay_clip_position_y+overlay_clip_position_offset_end,0.0,overwrite=true)
overlay_clip=LINEAR_MOVE(overlay_clip,"overlay_clip_trim08",overlay_clip_blend_mode,overlay_clip_02_04_time,overlay_clip_02_04_time+overlay_clip_disappear,overlay_clip_position_x+overlay_clip_position_offset_start,overlay_clip_position_y+overlay_clip_position_offset_start,1.0,overlay_clip_position_x+overlay_clip_position_offset_end,overlay_clip_position_y+overlay_clip_position_offset_end,0.0,overwrite=true)

overlay_clip=LINEAR_MOVE(overlay_clip,"overlay_clip_trim09",overlay_clip_blend_mode,overlay_clip_03_01_time,overlay_clip_03_01_time+overlay_clip_disappear,overlay_clip_position_x-overlay_clip_position_offset_start,overlay_clip_position_y-overlay_clip_position_offset_start,1.0,overlay_clip_position_x-overlay_clip_position_offset_end,overlay_clip_position_y-overlay_clip_position_offset_end,0.0,overwrite=true)
overlay_clip=LINEAR_MOVE(overlay_clip,"overlay_clip_trim10",overlay_clip_blend_mode,overlay_clip_03_02_time,overlay_clip_03_02_time+overlay_clip_disappear,overlay_clip_position_x+overlay_clip_position_offset_start,overlay_clip_position_y-overlay_clip_position_offset_start,1.0,overlay_clip_position_x+overlay_clip_position_offset_end,overlay_clip_position_y-overlay_clip_position_offset_end,0.0,overwrite=true)
overlay_clip=LINEAR_MOVE(overlay_clip,"overlay_clip_trim11",overlay_clip_blend_mode,overlay_clip_03_03_time,overlay_clip_03_03_time+overlay_clip_disappear,overlay_clip_position_x-overlay_clip_position_offset_start,overlay_clip_position_y+overlay_clip_position_offset_start,1.0,overlay_clip_position_x-overlay_clip_position_offset_end,overlay_clip_position_y+overlay_clip_position_offset_end,0.0,overwrite=true)
overlay_clip=LINEAR_MOVE(overlay_clip,"overlay_clip_trim12",overlay_clip_blend_mode,overlay_clip_03_04_time,overlay_clip_03_04_time+overlay_clip_disappear,overlay_clip_position_x+overlay_clip_position_offset_start,overlay_clip_position_y+overlay_clip_position_offset_start,1.0,overlay_clip_position_x+overlay_clip_position_offset_end,overlay_clip_position_y+overlay_clip_position_offset_end,0.0,overwrite=true)

######## Combine ########

# meruru_op_01 20
# meruru_op_02 5767

meruru_op_t01=BlankClip(meruru_op,length=20,color=color_black)+meruru_op_01
meruru_op_t02=Dissolve(meruru_dengeki_promotion_movie_05,meruru_dengeki_promotion_movie_08,meruru_dengeki_promotion_movie_07_01,28)
meruru_op_t03=Dissolve(meruru_dengeki_promotion_movie_07_03,FADE_OUT_WITH_BRIGHTNESS_OFFSET_RGB24(overlay_clip,15),23)
meruru_op_t04=meruru_dengeki_promotion_movie_04_b+meruru_dengeki_promotion_movie_04_a
meruru_op_t05=meruru_tvcm_02+Dissolve(meruru_tvcm_03,meruru_dengeki_promotion_movie_03_01,meruru_dengeki_promotion_movie_03_02,38)
meruru_op_t06=meruru_op_02

meruru_op_mute=meruru_op_t01+AssumeFPS(Dissolve(meruru_op_t02,meruru_op_t03,5)+DOUBLE_FADE_WITH_BRIGHTNESS_OFFSET_RGB24(meruru_op_t04,meruru_op_t05,15,15),meruru_op)+meruru_op_t06

######## Music ########

bgm_48khz=SSRC(WAVSource("src\meruru_no_atelier-ost-01-01.wav"),48000)
AudioDub(meruru_op_mute,bgm_48khz)

######## Subtitle ########

subtitle_x=50
subtitle_y=395
global subtitle_front_fade_count=15
global subtitle_rear_fade_count=30
global subtitle_font="MS Gothic"
global subtitle_effects="bi"
global subtitle_size=32
global subtitle_text_color=OVERWRITE_SUBTITLE_COLOR_ALPHA(color_pink,$D0)
global subtitle_halo_color=color_black

function SUBTITLE_FX(clip clip,string text,float x,float y,int start_frame,int end_frame,bool "is_second_subtitle",bool "is_title"){
	is_second_subtitle=Default(is_second_subtitle,false)
	is_title=Default(is_title,false)

	size=is_second_subtitle?28:subtitle_size
	text_color=is_second_subtitle?OVERWRITE_SUBTITLE_COLOR_ALPHA(color_navajowhite,$D0):subtitle_text_color
	halo_color=is_title?color_firebrick:subtitle_halo_color

	return SUBTITLE_FX_SLIDE_IN_WATER_OUT(clip,text,x,y,start_frame,end_frame,subtitle_front_fade_count,subtitle_rear_fade_count,subtitle_font,subtitle_effects,size,text_color,halo_color)
}



title_x=50
title_y=345

SUBTITLE_FX("Cadena//éRñ{î¸îHéq|- by fielia@AVISynth",title_x,title_y-subtitle_size,6193,6343,is_title=true)



SUBTITLE_FX("Ç†ÇÃì˙ âÆç™ó†ïîâÆÇ≈ äJÇ¢ÇƒÇΩäGñ{",subtitle_x,subtitle_y,889,1089)
SUBTITLE_FX("ã‡êFÇÃèÒÇ©Ç¥Ç∑ ñÇñ@égÇ¢",subtitle_x,subtitle_y,1104,1304)
SUBTITLE_FX("Ç∏Ç¡Ç∆ ë“Çøè≈Ç™ÇÍÇƒÇΩ êØÇ∆åéÇÃñÈ",subtitle_x,subtitle_y,1332,1536)
SUBTITLE_FX("è¨Ç≥Ç»ñ≤ éÑÇ…Ç‡ äêÇ¶ÇÁÇÍÇÈÇ∆",subtitle_x,subtitle_y,1550,1728)

SUBTITLE_FX("Ç¢Ç¬Ç©âHÇŒÇΩÇ≠",subtitle_x,subtitle_y,1737,1847)
SUBTITLE_FX("ç°ÇÕâìÇ≠â Çƒñ≥Ç≠ÇƒÇ‡",subtitle_x,subtitle_y,1855,1973)
SUBTITLE_FX("ãPÇ´ÇæÇ∑ í©èƒÇØÇÃîﬁï˚",subtitle_x,subtitle_y,1981,2188)
SUBTITLE_FX("îÚÇ—óßÇ¬âHÇÃâπ",subtitle_x,subtitle_y,2197,2392)
SUBTITLE_FX("ëÒÇ©ÇÍÇΩëÂínÇ÷",subtitle_x,subtitle_y,2411,2575)

SUBTITLE_FX("íµÇÀÇÈ í˚ÇÃâπÇ™ èÈñÂÇ…ãøÇ≠",subtitle_x,subtitle_y,2629,2829)
SUBTITLE_FX("ã‚ÇêgÇ…ìZÇ§ àŸçëÇÃãRém",subtitle_x,subtitle_y,2844,3041)
SUBTITLE_FX("Ç∏Ç¡Ç∆ ì≤ÇÍÇƒÇ¢ÇΩ ñlÇÃÇ±ÇÃéËÇ…ÇÕ",subtitle_x,subtitle_y,3060,3262)
SUBTITLE_FX("ìÕÇ©Ç»Ç¢ñ≤ÇæÇ¡Çƒ ï™Ç©Ç¡ÇƒÇ¢ÇƒÇ‡",subtitle_x,subtitle_y,3276,3453)

SUBTITLE_FX("Ç¢Ç¬Ç©ãÏÇØÇ‰Ç≠",subtitle_x,subtitle_y,3465,3572)
SUBTITLE_FX("ç°ÇÕé„Ç≠ócÇ≠Ç∆Ç‡",subtitle_x,subtitle_y,3582,3699)
SUBTITLE_FX("ãPÇ´ÇæÇ∑ éÈÇ…êıÇ‹ÇÈínïΩ",subtitle_x,subtitle_y,3708,3911)
SUBTITLE_FX("çèÇ‹ÇÍÇÈë´ê’",subtitle_x,subtitle_y,3923,4125)
SUBTITLE_FX("Ç‹Çæå©Ç ínÇéwÇµÇƒ",subtitle_x,subtitle_y,4139,4304)

SUBTITLE_FX("Ç¢Ç¬Ç©Ç†Ç»ÇΩÇ‡",subtitle_x,subtitle_y,4812,4926)
SUBTITLE_FX("íNÇ©Çì±Ç≠åıÇ…",subtitle_x,subtitle_y,4931,5048)
SUBTITLE_FX("ãPÇ´ÇæÇ∑ â ÇƒÇµÇ»Ç¢ã‚âÕ",subtitle_x,subtitle_y,5056,5277)

SUBTITLE_FX("ÇªÇµÇƒíNÇ‡Ç™",subtitle_x,subtitle_y,5299,5412)
SUBTITLE_FX("í‘ÇÈè¨Ç≥Ç»ï®åÍ",subtitle_x,subtitle_y,5416,5533)
SUBTITLE_FX("åÍÇÍèWÇ®Ç§ Ç±ÇÃãÛÇÃâ∫Ç≈",subtitle_x,subtitle_y,5541,5748)
SUBTITLE_FX("åJÇËï‘Ç∑ê˘ó•",subtitle_x,subtitle_y,5758,5958)
SUBTITLE_FX("åqÇ™ÇÈñ≤óyÇ©",subtitle_x,subtitle_y,5973,6192)



second_subtitle_x=50
second_subtitle_y=50

SUBTITLE_FX("Ah Raise your hands high|Ah Keep your eyes bright",second_subtitle_x,second_subtitle_y,27,235,true)
SUBTITLE_FX("Ah Sing your song loud|Ah Fly so high",second_subtitle_x,second_subtitle_y,243,443,true)
SUBTITLE_FX("Ah Kick up your heels|Ah Don't cry don't sigh",second_subtitle_x,second_subtitle_y,459,670,true)
SUBTITLE_FX("Ah See my eyes now|Ah Show your light",second_subtitle_x,second_subtitle_y,675,873,true)

SUBTITLE_FX("Raise your hands high|Keep your eyes bright",second_subtitle_x,second_subtitle_y,2197,2298,true)
SUBTITLE_FX("Sing your song loud|Seek light in night",second_subtitle_x,second_subtitle_y,2305,2405,true)
SUBTITLE_FX("Hold my hands tight|See my eyes now|Ah Fly so high",second_subtitle_x,second_subtitle_y,2411,2612,true)

SUBTITLE_FX("Raise your hands high|Keep your eyes bright",second_subtitle_x,second_subtitle_y,3923,4024,true)
SUBTITLE_FX("Sing your song loud|Seek light in night",second_subtitle_x,second_subtitle_y,4031,4131,true)
SUBTITLE_FX("Hold my hands tight|See my eyes now|Ah Fly so high",second_subtitle_x,second_subtitle_y,4139,4340,true)

SUBTITLE_FX("Ah Kick up your heels|Ah Don't cry don't sigh",second_subtitle_x,second_subtitle_y,4355,4565,true)
SUBTITLE_FX("Ah See my eyes now|Ah Show your light",second_subtitle_x,second_subtitle_y,4571,4770,true)

SUBTITLE_FX("Raise your hands high|Keep your eyes bright",second_subtitle_x,second_subtitle_y,5758,5858,true)
SUBTITLE_FX("Sing your song loud|Seek light in night",second_subtitle_x,second_subtitle_y,5863,5965,true)
SUBTITLE_FX("Hold my hands tight|See my eyes now",second_subtitle_x,second_subtitle_y,5973,6073,true)
SUBTITLE_FX("So high so bright|So loud so tight|Ah Fly so high",second_subtitle_x,second_subtitle_y,6081,6280,true)

######## Post Processing ########

ConvertToYV12()
#ConvertToYUY2()
#ConvertToRGB24()

TCPServer()
