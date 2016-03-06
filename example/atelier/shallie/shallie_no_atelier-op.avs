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

function PSEUDO_COLOR_1(clip clip){
	return ColorYUV(clip,off_u=0.0,cont_u=-192.0,off_v=0.0,cont_v=-192.0)
}

function PSEUDO_COLOR_2(clip clip){
	return ColorYUV(clip,off_u=-24.0,cont_u=-192.0,off_v=16.0,cont_v=-192.0)
}

######## Game (1280*720) ########

shallie_no_atelier_op=SSRC(FFMS2_VIDEO_SOURCE("src\official\movie\【シャリーのアトリエ】オープニングムービー.720p.mp4"),48000)
shallie_no_atelier_teaser_movie=SSRC(FFMS2_VIDEO_SOURCE("src\official\movie\【シャリーのアトリエ】トレーラームービー.720p.mp4",fpsnum=30000,fpsden=1001),48000)
shallie_no_atelier_promotion_movie=SSRC(FFMS2_VIDEO_SOURCE("src\official\movie\【シャリーのアトリエ】プロモーションムービー.720p.mp4",fpsnum=30000,fpsden=1001),48000)
shallie_no_atelier_promotion_movie_cache02=SSRC(FFMS2_VIDEO_SOURCE("src\official\movie\【シャリーのアトリエ】プロモーションムービー.720p.mp4",fpsnum=30000,fpsden=1001),48000)
shallie_no_atelier_trailer_movie=SSRC(FFMS2_VIDEO_SOURCE("src\official\movie\【シャリーのアトリエ】ティザームービー.720p.mp4"),48000)
shallie_no_atelier_trailer_movie_cache02=SSRC(FFMS2_VIDEO_SOURCE("src\official\movie\【シャリーのアトリエ】ティザームービー.720p.mp4"),48000)

shallie_no_atelier_teaser_movie=ASSUME_30P(shallie_no_atelier_teaser_movie)
shallie_no_atelier_promotion_movie=ASSUME_30P(shallie_no_atelier_promotion_movie)
shallie_no_atelier_promotion_movie_cache02=ASSUME_30P(shallie_no_atelier_promotion_movie_cache02)

######## Trim ########

shallie_no_atelier_op_01=Trim(shallie_no_atelier_op,0,1824) #1825 op
shallie_no_atelier_op_02=Trim(shallie_no_atelier_op,1825,0) #1547 op

#shallie_no_atelier_teaser_movie_pre_01=Trim(shallie_no_atelier_teaser_movie,0,98)
#shallie_no_atelier_teaser_movie_pre_02=Trim(shallie_no_atelier_teaser_movie,99,210)
shallie_no_atelier_teaser_movie_pre_03=Trim(shallie_no_atelier_teaser_movie,211,323) #113
shallie_no_atelier_teaser_movie_pre_04=Trim(shallie_no_atelier_teaser_movie,324,379) #56
shallie_no_atelier_teaser_movie_01=Trim(shallie_no_atelier_teaser_movie,380,918) #539 op
shallie_no_atelier_teaser_movie_02=Trim(shallie_no_atelier_teaser_movie,919,1127) #209
shallie_no_atelier_teaser_movie_03=Trim(shallie_no_atelier_teaser_movie,1128,1321) #194
shallie_no_atelier_teaser_movie_04=Trim(shallie_no_atelier_teaser_movie,1322,1639) #318
shallie_no_atelier_teaser_movie_05=Trim(shallie_no_atelier_teaser_movie,1640,1883) #244 op
shallie_no_atelier_teaser_movie_06=Trim(shallie_no_atelier_teaser_movie,1884,2038) #155
shallie_no_atelier_teaser_movie_07=Trim(shallie_no_atelier_teaser_movie,2039,2604) #566
shallie_no_atelier_teaser_movie_08=Trim(shallie_no_atelier_teaser_movie,2605,3021) #417
shallie_no_atelier_teaser_movie_09=Trim(shallie_no_atelier_teaser_movie,3022,3070) #49
shallie_no_atelier_teaser_movie_post=Trim(shallie_no_atelier_teaser_movie,3071,0)

shallie_no_atelier_promotion_movie_pre=Trim(shallie_no_atelier_promotion_movie,0,272)
shallie_no_atelier_promotion_movie_01=Trim(shallie_no_atelier_promotion_movie_cache02,273,900) #628 op
#shallie_no_atelier_promotion_movie_02=Trim(shallie_no_atelier_promotion_movie,901,1132) #232
shallie_no_atelier_promotion_movie_03=Trim(shallie_no_atelier_promotion_movie,1133,1992) #860 op
shallie_no_atelier_promotion_movie_04=Trim(shallie_no_atelier_promotion_movie,1993,2762) #770 op
shallie_no_atelier_promotion_movie_05=Trim(shallie_no_atelier_promotion_movie,2763,2823) #61 op
shallie_no_atelier_promotion_movie_06=Trim(shallie_no_atelier_promotion_movie,2824,3450) #627 op
#shallie_no_atelier_promotion_movie_07=Trim(shallie_no_atelier_promotion_movie,3451,3826) #376
shallie_no_atelier_promotion_movie_post=Trim(shallie_no_atelier_teaser_movie,3827,0)

shallie_no_atelier_trailer_movie_00=Trim(shallie_no_atelier_trailer_movie,0,83) #84
shallie_no_atelier_trailer_movie_01=Trim(shallie_no_atelier_trailer_movie,84,643) #560 op
shallie_no_atelier_trailer_movie_02=Trim(shallie_no_atelier_trailer_movie,644,1210) #567 op
#shallie_no_atelier_trailer_movie_03=Trim(shallie_no_atelier_trailer_movie,1211,1268) #58
#shallie_no_atelier_trailer_movie_04=Trim(shallie_no_atelier_trailer_movie,1269,1514) #246
shallie_no_atelier_trailer_movie_05=Trim(shallie_no_atelier_trailer_movie_cache02,1515,1619) #105 op
shallie_no_atelier_trailer_movie_06=Trim(shallie_no_atelier_trailer_movie,1620,1873) #254 op
shallie_no_atelier_trailer_movie_post=Trim(shallie_no_atelier_trailer_movie,1874,0)

######## Pre Combine ########

fade_length=15

shallie_no_atelier_trailer_movie_01_extend=Loop(shallie_no_atelier_trailer_movie_01,696-Framecount(shallie_no_atelier_trailer_movie_01)+1,411,411)

shallie_no_atelier_trailer_movie_02=TRIM_FIRST_CLIP(shallie_no_atelier_trailer_movie_02,561)
trailer_movie=CLIP_SPEED(Dissolve(shallie_no_atelier_trailer_movie_02,PSEUDO_COLOR_2(shallie_no_atelier_trailer_movie_05),PSEUDO_COLOR_1(shallie_no_atelier_trailer_movie_06),fade_length),0.5,true)

######## Combine ########

# shallie_no_atelier_op_01 696
# shallie_no_atelier_op_02 5721
# shallie_no_atelier_end   8918



shallie_no_atelier_op_t01=shallie_no_atelier_trailer_movie_01_extend
shallie_no_atelier_op_t02=Dissolve(shallie_no_atelier_op_01,PSEUDO_COLOR_1(FADE_OUT_WITH_BRIGHTNESS_OFFSET_RGB24(shallie_no_atelier_teaser_movie_05,fade_length*2)),Framecount(shallie_no_atelier_teaser_movie_05)-234)
shallie_no_atelier_op_t03=PSEUDO_COLOR_1(FADE_IN_WITH_BRIGHTNESS_OFFSET_RGB24(TRIM_MIDDLE_CLIP(shallie_no_atelier_teaser_movie_01,457),fade_length*2)+TRIM_MIDDLE_CLIP(shallie_no_atelier_promotion_movie_05+shallie_no_atelier_promotion_movie_06,457+229))
shallie_no_atelier_op_t04=PSEUDO_COLOR_1(FADE_OUT_WITH_BRIGHTNESS_OFFSET_RGB24(TRIM_LAST_CLIP(shallie_no_atelier_promotion_movie_01,(fade_length*4)+457),fade_length*2))
shallie_no_atelier_op_t05=PSEUDO_COLOR_1(FADE_IN_WITH_BRIGHTNESS_OFFSET_RGB24(TRIM_LAST_CLIP(shallie_no_atelier_promotion_movie_03+shallie_no_atelier_promotion_movie_04,457+457+452),fade_length*2))
shallie_no_atelier_op_t06=shallie_no_atelier_op_02
shallie_no_atelier_op_t07=FadeOut(trailer_movie,fade_length)+BlankClip(shallie_no_atelier_op,length=30*7,color=color_black) # 5:06

shallie_no_atelier_op_mute=shallie_no_atelier_op_t01+shallie_no_atelier_op_t02+Dissolve(shallie_no_atelier_op_t03,shallie_no_atelier_op_t04,fade_length*4)+shallie_no_atelier_op_t05+Dissolve(shallie_no_atelier_op_t06,shallie_no_atelier_op_t07,fade_length*5)

######## Music ########

bgm_48khz=SSRC(WAVSource("src\shallie_no_atelier-vocal_album-02.wav"),48000)
AudioDub(shallie_no_atelier_op_mute,bgm_48khz)



thumbnail=Trim(6633,-30*5)

######## Subtitle ########

#global subtitle_clip_width=1280
#global subtitle_clip_height=720

subtitle_x=50
subtitle_y=400
global subtitle_front_fade_count=15
global subtitle_rear_fade_count=15
global subtitle_font="MS Gothic"
global subtitle_effects="b"
global subtitle_size=24
global subtitle_text_color=color_brown
global subtitle_halo_color=color_white

function SUBTITLE_FX(clip clip,string text,float x,float y,int start_frame,int end_frame,bool "is_title"){
	is_title=Default(is_title,false)

	text_color=is_title?OVERWRITE_COLOR_ALPHA(subtitle_text_color,$3F):subtitle_text_color

	return SUBTITLE_FX_FADE_IN_FADE_OUT(clip,text,Round(x),Round(y),start_frame,end_frame,subtitle_front_fade_count,subtitle_rear_fade_count,subtitle_font,subtitle_effects,Round(subtitle_size),text_color,subtitle_halo_color)
}

SUBTITLE_FX("Rusty Sky//matryoshka|- by fielia@AVISynth",-subtitle_x,subtitle_y-subtitle_size,696,1101,true)

SUBTITLE_FX("Golden clouds are sailing in the sky",subtitle_x,subtitle_y,1149,1403)
SUBTITLE_FX("I'm standing on thin ice",subtitle_x,subtitle_y,1418,1589)

SUBTITLE_FX("Black night is coming from above",subtitle_x,subtitle_y,1606,1708)
SUBTITLE_FX("No one can escape",subtitle_x,subtitle_y,1719,1776)
SUBTITLE_FX("Nowhere to hide anymore",subtitle_x,subtitle_y,1779,1858)
SUBTITLE_FX("We'll fall into an endless sleep",subtitle_x,subtitle_y,1879,2047)

SUBTITLE_FX("A gentle breeze touches my cheeks",subtitle_x,subtitle_y,2055,2259)
SUBTITLE_FX("Thin ice mirrors the sky burning",subtitle_x,subtitle_y-subtitle_size,2260,2496)

SUBTITLE_FX("We know the world slowly makes all be back to the start",subtitle_x,subtitle_y,2775,2977)
SUBTITLE_FX("All of our wounds need to heal more or to get worse",subtitle_x,subtitle_y,3002,3197)
SUBTITLE_FX("Invisible forces lead us to where we belong",subtitle_x,subtitle_y,3233,3427)
SUBTITLE_FX("We're looking for reasons to resist or to surrender",subtitle_x,subtitle_y,3459,3692)

SUBTITLE_FX("I pluck nails stuck deeply in my feet",subtitle_x,subtitle_y,4348,4609)
SUBTITLE_FX("to try to walk again",subtitle_x,subtitle_y,4618,4779)

SUBTITLE_FX("Black night is coming from above",subtitle_x,subtitle_y,4806,4908)
SUBTITLE_FX("No one can escape",subtitle_x,subtitle_y,4919,4974)
SUBTITLE_FX("Nowhere to hide anymore",subtitle_x,subtitle_y,4977,5056)
SUBTITLE_FX("We'll fall into an endless sleep",subtitle_x,subtitle_y,5078,5248)

SUBTITLE_FX("A gentle breeze touches my cheeks",subtitle_x,subtitle_y,5255,5466)
SUBTITLE_FX("I feel I'm helpless",subtitle_x,subtitle_y-subtitle_size,5462,5608)
SUBTITLE_FX("Time won't stop",subtitle_x,subtitle_y,5604,5715)

SUBTITLE_FX("We know the world slowly makes all be back to the start",subtitle_x,subtitle_y,5976,6177)
SUBTITLE_FX("All of our wounds need to heal more or to get worse",subtitle_x,subtitle_y,6201,6425)
SUBTITLE_FX("Invisible forces lead us to where we belong",subtitle_x,subtitle_y,6432,6627)
SUBTITLE_FX("We're looking for reasons to resist or to surrender",subtitle_x,subtitle_y,6658,6891)

SUBTITLE_FX("Fading light",subtitle_x,subtitle_y,7087,7176)
SUBTITLE_FX("You're so far away",subtitle_x,subtitle_y,7187,7282)
SUBTITLE_FX("We're burning and frozen",subtitle_x,subtitle_y,7302,7411)
SUBTITLE_FX("I walk to you",subtitle_x,subtitle_y,7419,7508)



#thumbnail

######## Post Processing ########

ConvertToYV12()
#ConvertToYUY2()
#ConvertToRGB24()

TCPServer()
