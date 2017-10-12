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



Import("..\..\avsi4comp\avsi4comp.avsi")

######## Game (1280*720) ########

#blue_reflection_op=SSRC(FFMS2_VIDEO_SOURCE("src\blue_reflection-movie\official\movie\【BLUE REFLECTION】オープニングムービー.720p.mp4"),48000)
#blue_reflection_concept_image_movie=SSRC(FFMS2_VIDEO_SOURCE("src\blue_reflection-movie\official\movie\【BLUE REFLECTION】コンセプトイメージムービー.720p.mp4"),48000)
#blue_reflection_promotion_movie_01=SSRC(FFMS2_VIDEO_SOURCE("src\blue_reflection-movie\official\movie\【BLUE REFLECTION】プロモーションムービー 第1弾.720p.mp4"),48000)
#blue_reflection_promotion_movie_02=SSRC(FFMS2_VIDEO_SOURCE("src\blue_reflection-movie\official\movie\【BLUE REFLECTION】プロモーションムービー 第2弾.720p.mp4"),48000)
#blue_reflection_tokuten_movie=SSRC(FFMS2_VIDEO_SOURCE("src\blue_reflection-movie\official\movie\【BLUE REFLECTION】初回封入特典 紹介映像.720p.mp4"),48000)
#blue_reflection_launch_movie=SSRC(FFMS2_VIDEO_SOURCE("src\blue_reflection-movie\official\movie\【BLUE REFLECTION】発売記念ムービー.720p.mp4"),48000)

#blue_reflection_promotion_movie_01_cache02=blue_reflection_promotion_movie_01

#blue_reflection_promotion_movie_02_cache02=blue_reflection_promotion_movie_02
#blue_reflection_promotion_movie_02_cache03=blue_reflection_promotion_movie_02

#blue_reflection_launch_movie_cache02=blue_reflection_launch_movie

######## Game (1920*1080) ########

blue_reflection_op_video=FFVideoSource("src\blue_reflection-movie\official\movie\【BLUE REFLECTION】オープニングムービー.DASH-1080p.mp4",threads=1,seekmode=-1)
blue_reflection_op_audio=SSRC(FFAudioSource("src\blue_reflection-movie\official\movie\【BLUE REFLECTION】オープニングムービー.DASH-128k.m4a"),48000)
blue_reflection_op=AudioDub(blue_reflection_op_video,blue_reflection_op_audio)
#blue_reflection_op=AudioDub(blue_reflection_op_video,blue_reflection_op)

blue_reflection_concept_image_movie_video=FFVideoSource("src\blue_reflection-movie\official\movie\【BLUE REFLECTION】コンセプトイメージムービー.DASH-1080p.mp4",threads=1,seekmode=-1)
blue_reflection_concept_image_movie_audio=SSRC(FFAudioSource("src\blue_reflection-movie\official\movie\【BLUE REFLECTION】コンセプトイメージムービー.DASH-128k.m4a"),48000)
blue_reflection_concept_image_movie=AudioDub(blue_reflection_concept_image_movie_video,blue_reflection_concept_image_movie_audio)
#blue_reflection_concept_image_movie=AudioDub(blue_reflection_concept_image_movie_video,blue_reflection_concept_image_movie)

blue_reflection_promotion_movie_01_video_path="src\blue_reflection-movie\official\movie\【BLUE REFLECTION】プロモーションムービー 第1弾.DASH-1080p.mp4"
blue_reflection_promotion_movie_01_audio_path="src\blue_reflection-movie\official\movie\【BLUE REFLECTION】プロモーションムービー 第1弾.DASH-128k.m4a"

blue_reflection_promotion_movie_01_video=FFVideoSource(blue_reflection_promotion_movie_01_video_path,threads=1,seekmode=-1)
blue_reflection_promotion_movie_01_audio=SSRC(FFAudioSource(blue_reflection_promotion_movie_01_audio_path),48000)
blue_reflection_promotion_movie_01=AudioDub(blue_reflection_promotion_movie_01_video,blue_reflection_promotion_movie_01_audio)
#blue_reflection_promotion_movie_01=AudioDub(blue_reflection_promotion_movie_01_video,blue_reflection_promotion_movie_01)

blue_reflection_promotion_movie_01_video_cache02=FFVideoSource(blue_reflection_promotion_movie_01_video_path,threads=1,seekmode=-1)
blue_reflection_promotion_movie_01_audio_cache02=SSRC(FFAudioSource(blue_reflection_promotion_movie_01_audio_path),48000)
blue_reflection_promotion_movie_01_cache02=AudioDub(blue_reflection_promotion_movie_01_video_cache02,blue_reflection_promotion_movie_01_audio_cache02)
#blue_reflection_promotion_movie_01_cache02=AudioDub(blue_reflection_promotion_movie_01_video_cache02,blue_reflection_promotion_movie_01)

blue_reflection_promotion_movie_02_video_path="src\blue_reflection-movie\official\movie\【BLUE REFLECTION】プロモーションムービー 第2弾.DASH-1080p.mp4"
blue_reflection_promotion_movie_02_audio_path="src\blue_reflection-movie\official\movie\【BLUE REFLECTION】プロモーションムービー 第2弾.DASH-128k.m4a"

blue_reflection_promotion_movie_02_video=FFVideoSource(blue_reflection_promotion_movie_02_video_path,threads=1,seekmode=-1)
blue_reflection_promotion_movie_02_audio=SSRC(FFAudioSource(blue_reflection_promotion_movie_02_audio_path),48000)
blue_reflection_promotion_movie_02=AudioDub(blue_reflection_promotion_movie_02_video,blue_reflection_promotion_movie_02_audio)
#blue_reflection_promotion_movie_02=AudioDub(blue_reflection_promotion_movie_02_video,blue_reflection_promotion_movie_02)

blue_reflection_promotion_movie_02_video_cache02=FFVideoSource(blue_reflection_promotion_movie_02_video_path,threads=1,seekmode=-1)
blue_reflection_promotion_movie_02_audio_cache02=SSRC(FFAudioSource(blue_reflection_promotion_movie_02_audio_path),48000)
blue_reflection_promotion_movie_02_cache02=AudioDub(blue_reflection_promotion_movie_02_video_cache02,blue_reflection_promotion_movie_02_audio_cache02)
#blue_reflection_promotion_movie_02_cache02=AudioDub(blue_reflection_promotion_movie_02_video_cache02,blue_reflection_promotion_movie_02)

blue_reflection_promotion_movie_02_video_cache03=FFVideoSource(blue_reflection_promotion_movie_02_video_path,threads=1,seekmode=-1)
blue_reflection_promotion_movie_02_audio_cache03=SSRC(FFAudioSource(blue_reflection_promotion_movie_02_audio_path),48000)
blue_reflection_promotion_movie_02_cache03=AudioDub(blue_reflection_promotion_movie_02_video_cache03,blue_reflection_promotion_movie_02_audio_cache03)
#blue_reflection_promotion_movie_02_cache03=AudioDub(blue_reflection_promotion_movie_02_video_cache03,blue_reflection_promotion_movie_02)

#blue_reflection_tokuten_movie_video=FFVideoSource("src\blue_reflection-movie\official\movie\【BLUE REFLECTION】初回封入特典 紹介映像.DASH-720p.mp4",threads=1,seekmode=-1)
#blue_reflection_tokuten_movie_audio=SSRC(FFAudioSource("src\blue_reflection-movie\official\movie\【BLUE REFLECTION】初回封入特典 紹介映像.DASH-128k.m4a"),48000)
#blue_reflection_tokuten_movie=AudioDub(blue_reflection_tokuten_movie_video,blue_reflection_tokuten_movie_audio)
#blue_reflection_tokuten_movie=AudioDub(blue_reflection_tokuten_movie_video,blue_reflection_tokuten_movie)

blue_reflection_launch_movie_video_path="src\blue_reflection-movie\official\movie\【BLUE REFLECTION】発売記念ムービー.DASH-1080p.mp4"
blue_reflection_launch_movie_audio_path="src\blue_reflection-movie\official\movie\【BLUE REFLECTION】発売記念ムービー.DASH-128k.m4a"

blue_reflection_launch_movie_video=FFVideoSource(blue_reflection_launch_movie_video_path,threads=1,seekmode=-1)
blue_reflection_launch_movie_audio=SSRC(FFAudioSource(blue_reflection_launch_movie_audio_path),48000)
blue_reflection_launch_movie=AudioDub(blue_reflection_launch_movie_video,blue_reflection_launch_movie_audio)
#blue_reflection_launch_movie=AudioDub(blue_reflection_launch_movie_video,blue_reflection_launch_movie)

blue_reflection_launch_movie_video_cache02=FFVideoSource(blue_reflection_launch_movie_video_path,threads=1,seekmode=-1)
blue_reflection_launch_movie_audio_cache02=SSRC(FFAudioSource(blue_reflection_launch_movie_audio_path),48000)
blue_reflection_launch_movie_cache02=AudioDub(blue_reflection_launch_movie_video_cache02,blue_reflection_launch_movie_audio_cache02)
#blue_reflection_launch_movie_cache02=AudioDub(blue_reflection_launch_movie_video_cache02,blue_reflection_launch_movie)

######## Trim ########

blue_reflection_op_01=Trim(blue_reflection_op,0,564)
blue_reflection_op_02=Trim(blue_reflection_op,565,1727)
blue_reflection_op_03=Trim(blue_reflection_op,1728,2425)
blue_reflection_op_04=Trim(blue_reflection_op,2426,3413)
blue_reflection_op_05=Trim(blue_reflection_op,3414,0)

#blue_reflection_concept_image_movie_01_real=Trim(blue_reflection_concept_image_movie,0,303)
blue_reflection_concept_image_movie_02_illustration=Trim(blue_reflection_concept_image_movie,304,458) #155 op
#blue_reflection_concept_image_movie_03_real=Trim(blue_reflection_concept_image_movie,459,534)
blue_reflection_concept_image_movie_04_illustration=Trim(blue_reflection_concept_image_movie,535,694) #160 op
blue_reflection_concept_image_movie_05_illustration=Trim(blue_reflection_concept_image_movie,695,980) #286 op
#blue_reflection_concept_image_movie_06_real=Trim(blue_reflection_concept_image_movie,981,1276)
blue_reflection_concept_image_movie_07_illustration=Trim(blue_reflection_concept_image_movie,1277,1373) #97 op
#blue_reflection_concept_image_movie_08_real=Trim(blue_reflection_concept_image_movie,1374,1520)
blue_reflection_concept_image_movie_09_illustration=Trim(blue_reflection_concept_image_movie,1521,1798) #278 op
#blue_reflection_concept_image_movie_10_real=Trim(blue_reflection_concept_image_movie,1799,2670)
#blue_reflection_concept_image_movie_11_post=Trim(blue_reflection_concept_image_movie,2671,0)

blue_reflection_promotion_movie_01_01_title=Trim(blue_reflection_promotion_movie_01,0,531)
blue_reflection_promotion_movie_01_02=Trim(blue_reflection_promotion_movie_01,532,817) #286 op
blue_reflection_promotion_movie_01_03=Trim(blue_reflection_promotion_movie_01,818,1097) #280 op
blue_reflection_promotion_movie_01_04=Trim(blue_reflection_promotion_movie_01_cache02,1098,1384) #287 op
blue_reflection_promotion_movie_01_05=Trim(blue_reflection_promotion_movie_01,1385,1709) #325 op
blue_reflection_promotion_movie_01_06_part01=Trim(blue_reflection_promotion_movie_01,1710,1955) #246 op
blue_reflection_promotion_movie_01_06_part02=Trim(blue_reflection_promotion_movie_01,1956,1973) #18 op
blue_reflection_promotion_movie_01_07_title=Trim(blue_reflection_promotion_movie_01,1974,2107) #134
blue_reflection_promotion_movie_01_post=Trim(blue_reflection_promotion_movie_01,2108,0)

blue_reflection_promotion_movie_02_01_title=Trim(blue_reflection_promotion_movie_02,0,379)
blue_reflection_promotion_movie_02_02=Trim(blue_reflection_promotion_movie_02_cache03,380,1094) #715 op
blue_reflection_promotion_movie_02_03=Trim(blue_reflection_promotion_movie_02_cache03,1095,1535) #441 op
blue_reflection_promotion_movie_02_04=Trim(blue_reflection_promotion_movie_02,1536,1884) #349 op 
blue_reflection_promotion_movie_02_05=Trim(blue_reflection_promotion_movie_02,1885,2325) #441 op
blue_reflection_promotion_movie_02_06=Trim(blue_reflection_promotion_movie_02_cache02,2326,2469) #144 op
blue_reflection_promotion_movie_02_07=Trim(blue_reflection_promotion_movie_02,2470,2983) #514 op
blue_reflection_promotion_movie_02_08=Trim(blue_reflection_promotion_movie_02,2984,3390) #407 op
blue_reflection_promotion_movie_02_09=Trim(blue_reflection_promotion_movie_02,3391,3566) #176 op
blue_reflection_promotion_movie_02_post=Trim(blue_reflection_promotion_movie_02,3567,0)

blue_reflection_launch_movie_01=Trim(blue_reflection_launch_movie,0,294) #295
blue_reflection_launch_movie_02_title=Trim(blue_reflection_launch_movie,295,598)
blue_reflection_launch_movie_03=Trim(blue_reflection_launch_movie,599,2254) #1656 op
blue_reflection_launch_movie_04=Trim(blue_reflection_launch_movie_cache02,2255,3098) #844 op
blue_reflection_launch_movie_05=Trim(blue_reflection_launch_movie,3099,3239) #141
blue_reflection_launch_movie_post=Trim(blue_reflection_launch_movie,3240,0)

######## Pre Combine ########

fade_length=15



blue_reflection_concept_image_movie_concat=blue_reflection_concept_image_movie_02_illustration+blue_reflection_concept_image_movie_04_illustration+blue_reflection_concept_image_movie_05_illustration \
	+FADE_OUT_WITH_BRIGHTNESS_OFFSET(FADE_IN_WITH_BRIGHTNESS_OFFSET(blue_reflection_concept_image_movie_07_illustration,fade_length),fade_length)+blue_reflection_concept_image_movie_09_illustration



blue_reflection_promotion_movie_01_concat=blue_reflection_promotion_movie_01_02+blue_reflection_promotion_movie_01_03+blue_reflection_promotion_movie_01_05



blue_reflection_promotion_movie_02_concat=blue_reflection_promotion_movie_02_04+blue_reflection_promotion_movie_02_05+blue_reflection_promotion_movie_02_07 \
	+blue_reflection_promotion_movie_02_08+blue_reflection_promotion_movie_02_06+blue_reflection_promotion_movie_02_09 \
	+FADE_IN_WITH_BRIGHTNESS_OFFSET(blue_reflection_promotion_movie_02_02,fade_length)+blue_reflection_promotion_movie_02_03

blue_reflection_promotion_movie_02_concat_30p=ASSUME_30P(blue_reflection_promotion_movie_02_concat)
blue_reflection_promotion_movie_02_concat_30p_framecount=Framecount(blue_reflection_promotion_movie_02_concat_30p)
#blue_reflection_promotion_movie_02_concat_30p_last_frame=blue_reflection_promotion_movie_02_concat_30p_framecount-1

blue_reflection_promotion_movie_02_concat_30p_extend_dissolve_length=7
blue_reflection_promotion_movie_02_concat_30p_extend=blue_reflection_promotion_movie_02_concat_30p+BlankClip(blue_reflection_op,length=(1385+666+1153-blue_reflection_promotion_movie_02_concat_30p_framecount)+blue_reflection_promotion_movie_02_concat_30p_extend_dissolve_length,color=color_white)
#blue_reflection_promotion_movie_02_concat_30p_extend=Loop(blue_reflection_promotion_movie_02_concat_30p,(1385+666+1153-blue_reflection_promotion_movie_02_concat_30p_last_frame)+blue_reflection_promotion_movie_02_concat_30p_extend_dissolve_length,blue_reflection_promotion_movie_02_concat_30p_last_frame,blue_reflection_promotion_movie_02_concat_30p_last_frame)



blue_reflection_promotion_movie_01_06_30p=ASSUME_30P(blue_reflection_promotion_movie_01_06_part01)
blue_reflection_promotion_movie_01_06_30p_framecount=Framecount(blue_reflection_promotion_movie_01_06_30p)



#blue_reflection_launch_movie_03_trimmed=Loop(blue_reflection_launch_movie_03,0,1253,1371)

######## Combine ########

# blue_reflection_op_01 956
# blue_reflection_op_02 1521
# blue_reflection_op_03 5888
# blue_reflection_op_04 8896
# blue_reflection_op_05 10217



blue_reflection_op_t01=FADE_IN_WITH_BRIGHTNESS_OFFSET(ASSUME_30P(blue_reflection_concept_image_movie_concat),fade_length)
blue_reflection_op_t02=blue_reflection_op_01+blue_reflection_op_02

blue_reflection_op_t03=blue_reflection_promotion_movie_02_concat_30p_extend
blue_reflection_op_t04=blue_reflection_op_03

blue_reflection_op_t05=FADE_OUT_WITH_BRIGHTNESS_OFFSET(TRIM_LAST_CLIP(ASSUME_30P(blue_reflection_launch_movie_04),749),fade_length)
blue_reflection_op_t06=FADE_OUT_WITH_BRIGHTNESS_OFFSET(FADE_IN_WITH_BRIGHTNESS_OFFSET(TRIM_FIRST_CLIP(ASSUME_30P(blue_reflection_launch_movie_03),21+896),fade_length),fade_length)

blue_reflection_op_t07=FADE_OUT_WITH_BRIGHTNESS_OFFSET(TRIM_FIRST_CLIP(ASSUME_30P(blue_reflection_promotion_movie_01_concat),644),fade_length)+blue_reflection_op_04
#blue_reflection_op_t08=FADE_OUT_WITH_BRIGHTNESS_OFFSET(TRIM_FIRST_CLIP(ASSUME_30P(blue_reflection_promotion_movie_01_06_part01+blue_reflection_promotion_movie_01_06_part02+blue_reflection_promotion_movie_01_07_title),333),fade_length)
blue_reflection_op_t08=TRIM_FIRST_CLIP(ASSUME_30P(blue_reflection_promotion_movie_01_04),333-blue_reflection_promotion_movie_01_06_30p_framecount)+blue_reflection_promotion_movie_01_06_30p
blue_reflection_op_t09=blue_reflection_op_05+BlankClip(blue_reflection_op,length=30*6,color=color_black)

blue_reflection_op_mute=Dissolve(blue_reflection_op_t01,blue_reflection_op_t02,20) \
	+Dissolve(blue_reflection_op_t03,blue_reflection_op_t04,blue_reflection_promotion_movie_02_concat_30p_extend_dissolve_length) \
	+blue_reflection_op_t05+blue_reflection_op_t06 \
	+blue_reflection_op_t07+blue_reflection_op_t08+blue_reflection_op_t09

######## Music ########

bgm_48khz=SSRC(WAVSource("src\blue_reflection-official_soundtrack-cd01-26.wav"),48000)
AudioDub(blue_reflection_op_mute,bgm_48khz)



thumbnail=Trim(9450,-30*5)

######## Subtitle ########

global subtitle_clip_width=1920
global subtitle_clip_height=1080

subtitle_x=50*2.25
subtitle_y=395*2.25
global subtitle_front_fade_count=15
global subtitle_rear_fade_count=15
global subtitle_font="MS Gothic"
global subtitle_effects="b"
global subtitle_size=32*2.25
global subtitle_text_color=$1E90C0
global subtitle_halo_color=color_white

function SUBTITLE_FX(clip clip,string text,float x,float y,int start_frame,int end_frame,bool "is_furigana",bool "is_title"){
	is_furigana=Default(is_furigana,false)
	is_title=Default(is_title,false)

	text_color=is_title?OVERWRITE_SUBTITLE_COLOR_ALPHA(subtitle_text_color,$C0):subtitle_text_color

	subtitle_mode=is_furigana?"ex":"ex_thick_reduce_memory"
	size=is_furigana?subtitle_size*0.5:subtitle_size
	y=is_furigana?y-size:y

	return SUBTITLE_FX_FADE_IN_FADE_OUT(clip,text,Round(x),Round(y),start_frame,end_frame,subtitle_front_fade_count,subtitle_rear_fade_count,subtitle_font,subtitle_effects,Round(size),text_color,subtitle_halo_color,subtitle_mode)
}

ConvertToRGB32()

SUBTITLE_FX("リフレクト//さよならポニーテール|- by fielia@AVISynth",-subtitle_x,subtitle_y-subtitle_size,10248,10437,is_title=true)

SUBTITLE_FX("名前のまだない物語　駆け抜けたわたしたちの季節",subtitle_x,subtitle_y-subtitle_size,1524,1831)
SUBTITLE_FX("青い光の乱反射で　手をふるきみが見えなかったよ",subtitle_x,subtitle_y,1845,2177)

SUBTITLE_FX("せめぎ合いもっときらめいて|自分を超えてゆくから",subtitle_x,subtitle_y-subtitle_size*3,2188,2512)
SUBTITLE_FX("           さなぎ",subtitle_x,subtitle_y,2521,2732,true)
SUBTITLE_FX("甘えた蛹を脱ぎ捨てて　準備はできた",subtitle_x,subtitle_y,2521,2732)

SUBTITLE_FX("リフレクト　今願いをつないで",subtitle_x,subtitle_y-subtitle_size*2,2730,2881)
SUBTITLE_FX("きっと明日を変えてみせる",subtitle_x,subtitle_y,2897,3034)
SUBTITLE_FX("いつか約束の地できみと　笑顔で会いたいから",subtitle_x,subtitle_y-subtitle_size,3041,3355)
SUBTITLE_FX("やっぱり夕暮れは寂しいね",subtitle_x,subtitle_y,3394,3545)
SUBTITLE_FX("思い出が増えすぎたから",subtitle_x,subtitle_y-subtitle_size,3561,3699)
SUBTITLE_FX("振り返る一瞬の刹那を抱いて　今日も走るのさ",subtitle_x,subtitle_y,3707,4138)

SUBTITLE_FX("心に影が積もる日々に　雨の中答えを探していた",subtitle_x,subtitle_y-subtitle_size,4728,5033)
SUBTITLE_FX("強さの意味もわからずに　校庭に立ち尽くしてたよ",subtitle_x,subtitle_y,5050,5383)

SUBTITLE_FX("弱さならもっと思い知り　そこからはじめればいい",subtitle_x,subtitle_y-subtitle_size,5393,5718)
SUBTITLE_FX("ハリボテの自我を蹴破って　わたしになった",subtitle_x,subtitle_y,5726,5937)

SUBTITLE_FX("リフレクト　まだヒーローになれないけど",subtitle_x,subtitle_y-subtitle_size,5935,6088)
SUBTITLE_FX("きみの笑顔　ずっと守るから",subtitle_x,subtitle_y,6101,6238)
SUBTITLE_FX("いつか夢から目覚めても　わたしを、忘れないでね",subtitle_x,subtitle_y-subtitle_size,6245,6556)
SUBTITLE_FX("ずっとバカを言い合っていたいよね",subtitle_x,subtitle_y,6600,6748)
SUBTITLE_FX("永遠につづきそうな夜に",subtitle_x,subtitle_y-subtitle_size,6765,6905)
SUBTITLE_FX("戻らないありふれた輝く日々の　キラ星たちよ",subtitle_x,subtitle_y,6912,7314)

SUBTITLE_FX("手に掴めば逃げる砂の一秒",subtitle_x,subtitle_y-subtitle_size,7329,7496)
SUBTITLE_FX("行方は風の幻",subtitle_x,subtitle_y,7504,7720)

SUBTITLE_FX("リフレクト　今願いをつないで",subtitle_x,subtitle_y-subtitle_size,8245,8396)
SUBTITLE_FX("きっと明日を変えてみせる",subtitle_x,subtitle_y,8411,8551)
SUBTITLE_FX("いつか約束の地できみと　笑顔で会いたいから",subtitle_x,subtitle_y-subtitle_size,8557,8874)
SUBTITLE_FX("やっぱり夕暮れは寂しいね",subtitle_x,subtitle_y,8909,9064)
SUBTITLE_FX("思い出が増え過ぎたから",subtitle_x,subtitle_y-subtitle_size,9075,9214)
SUBTITLE_FX("振り返る一瞬の刹那を抱いて　今日も走るのさ",subtitle_x,subtitle_y,9221,9655)



#thumbnail

######## Post Processing ########

ConvertToYV12()
#ConvertToYUY2()
#ConvertToRGB24()

TCPServer()
