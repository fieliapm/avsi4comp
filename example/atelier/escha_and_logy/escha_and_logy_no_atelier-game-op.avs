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

######## Game (1280*720) ########

escha_and_logy_no_atelier_game_op=SSRC(FFMS2_VIDEO_SOURCE("src\official-game\movie\【エスカ＆ロジー】オープニングムービー.720p.mp4",fpsnum=30000,fpsden=1001),48000)
escha_and_logy_no_atelier_game_trailer_movie=SSRC(FFMS2_VIDEO_SOURCE("src\official-game\movie\【エスカ＆ロジー】トレーラームービー.720p.mp4"),48000)
escha_and_logy_no_atelier_game_teaser_movie=SSRC(FFMS2_VIDEO_SOURCE("src\official-game\movie\【エスカ＆ロジー】ティザームービー.720p.mp4",fpsnum=30000,fpsden=1001),48000)

escha_and_logy_no_atelier_game_trailer_movie=ASSUME_29_97P(escha_and_logy_no_atelier_game_trailer_movie)

######## Trim ########

escha_and_logy_no_atelier_game_op_pre=Trim(escha_and_logy_no_atelier_game_op,0,313)
escha_and_logy_no_atelier_game_op_01=Trim(escha_and_logy_no_atelier_game_op,314,1420)
escha_and_logy_no_atelier_game_op_02=Trim(escha_and_logy_no_atelier_game_op,1421,1783)
escha_and_logy_no_atelier_game_op_03=Trim(escha_and_logy_no_atelier_game_op,1784,3130)
escha_and_logy_no_atelier_game_op_post=Trim(escha_and_logy_no_atelier_game_op,3131,0)

escha_and_logy_no_atelier_game_trailer_movie_pre=Trim(escha_and_logy_no_atelier_game_trailer_movie,0,306)
escha_and_logy_no_atelier_game_trailer_movie_01=Trim(escha_and_logy_no_atelier_game_trailer_movie,307,678) #372
escha_and_logy_no_atelier_game_trailer_movie_02=Trim(escha_and_logy_no_atelier_game_trailer_movie,679,1844) #1166
escha_and_logy_no_atelier_game_trailer_movie_03=Trim(escha_and_logy_no_atelier_game_trailer_movie,1845,2583) #739
escha_and_logy_no_atelier_game_trailer_movie_04=Trim(escha_and_logy_no_atelier_game_trailer_movie,2584,2955) #372
escha_and_logy_no_atelier_game_trailer_movie_05=Trim(escha_and_logy_no_atelier_game_trailer_movie,2956,3333) #378
escha_and_logy_no_atelier_game_trailer_movie_06=Trim(escha_and_logy_no_atelier_game_trailer_movie,3334,3705) #372
escha_and_logy_no_atelier_game_trailer_movie_07=Trim(escha_and_logy_no_atelier_game_trailer_movie,3706,3903) #198
escha_and_logy_no_atelier_game_trailer_movie_post=Trim(escha_and_logy_no_atelier_game_trailer_movie,3904,0)

######## Pre Combine ########

escha_and_logy_no_atelier_game_op_03_without_fade_out=Trim(escha_and_logy_no_atelier_game_op_03,0,1333)
escha_and_logy_no_atelier_game_op_01_flower=Trim(escha_and_logy_no_atelier_game_op_01,41,84)
escha_and_logy_no_atelier_game_op_01_flower_loop=Loop(escha_and_logy_no_atelier_game_op_01_flower,22,2+3,43-1)

trailer_01=escha_and_logy_no_atelier_game_trailer_movie_01+escha_and_logy_no_atelier_game_trailer_movie_02
trailer_02=escha_and_logy_no_atelier_game_trailer_movie_03+escha_and_logy_no_atelier_game_trailer_movie_04+escha_and_logy_no_atelier_game_trailer_movie_05+escha_and_logy_no_atelier_game_trailer_movie_06

######## Combine ########

# escha_and_logy_no_atelier_game_op_01 -38
# escha_and_logy_no_atelier_game_op_02 2634
# escha_and_logy_no_atelier_game_op_03 4921

# escha_and_logy_no_atelier_game_trailer_movie_01 1076 / 1449



escha_and_logy_no_atelier_game_op_01_00=Trim(escha_and_logy_no_atelier_game_op_01,0,37)
escha_and_logy_no_atelier_game_op_01_01=Trim(escha_and_logy_no_atelier_game_op_01,38,0)

fade_length=15

escha_and_logy_no_atelier_game_op_t01=escha_and_logy_no_atelier_game_op_01_01
escha_and_logy_no_atelier_game_op_t02=escha_and_logy_no_atelier_game_op_02
escha_and_logy_no_atelier_game_op_t03=BlankClip(escha_and_logy_no_atelier_game_op,length=17,color=color_black)+trailer_01
escha_and_logy_no_atelier_game_op_t04=trailer_02+TRIM_FIRST_CLIP(escha_and_logy_no_atelier_game_trailer_movie_07,10+63+fade_length)
escha_and_logy_no_atelier_game_op_t05=escha_and_logy_no_atelier_game_op_03_without_fade_out+FadeOut(escha_and_logy_no_atelier_game_op_01_flower_loop,30*12)+BlankClip(escha_and_logy_no_atelier_game_op,length=30*2,color=color_black)

escha_and_logy_no_atelier_game_op_mute=escha_and_logy_no_atelier_game_op_t01+escha_and_logy_no_atelier_game_op_t02+escha_and_logy_no_atelier_game_op_t03+Dissolve(escha_and_logy_no_atelier_game_op_t04,escha_and_logy_no_atelier_game_op_t05,fade_length)

######## Music ########

bgm_48khz=SSRC(WAVSource("src\escha_and_logy_no_atelier-vocal_album-02.wav"),48000)
AudioDub(escha_and_logy_no_atelier_game_op_mute,bgm_48khz)



thumbnail=Trim(5161,-30*5)

######## Subtitle ########

#global subtitle_clip_width=1280
#global subtitle_clip_height=720

subtitle_x=50
subtitle_y=400
global subtitle_front_fade_count=15
global subtitle_rear_fade_count=15
global subtitle_font="MS Gothic"
global subtitle_effects="b"
global subtitle_size=28
global subtitle_text_color=color_dodgerblue
global subtitle_halo_color=color_white

function SUBTITLE_FX(clip clip,string text,float x,float y,int start_frame,int end_frame,bool "is_title"){
	is_title=Default(is_title,false)

	text_color=is_title?OVERWRITE_COLOR_ALPHA(subtitle_text_color,$3F):subtitle_text_color

	return SUBTITLE_FX_FADE_IN_FADE_OUT(clip,text,Round(x),Round(y),start_frame,end_frame,subtitle_front_fade_count,subtitle_rear_fade_count,subtitle_font,subtitle_effects,Round(subtitle_size),text_color,subtitle_halo_color)
}

SUBTITLE_FX("ミルク色の峠//チリヌルヲワカ|- by fielia@AVISynth",subtitle_x,subtitle_y-subtitle_size,5756,6075,true)

SUBTITLE_FX("ミルク色に染まる冬の峠は",subtitle_x,subtitle_y,687,877)
SUBTITLE_FX("心配せずとも春を連れて来る",subtitle_x,subtitle_y,878,1071)

SUBTITLE_FX("今も枯れずに",subtitle_x,subtitle_y,1072,1159)
SUBTITLE_FX("キミの胸で育っているから",subtitle_x,subtitle_y,1166,1337)
SUBTITLE_FX("もう止められない",subtitle_x,subtitle_y,1339,1447)

SUBTITLE_FX("思わぬ奇跡がもうすでに始まっている",subtitle_x,subtitle_y,1448,1679)
SUBTITLE_FX("誰もが皆叶えられる",subtitle_x,subtitle_y,1682,1863)

SUBTITLE_FX("紅茶色に染まる秋の谷は",subtitle_x,subtitle_y,2260,2447)
SUBTITLE_FX("あふれるほどの実りをもたらす",subtitle_x,subtitle_y,2448,2635)

SUBTITLE_FX("今も覚めずに",subtitle_x,subtitle_y,2637,2720)
SUBTITLE_FX("きみの中で続きを待ってる",subtitle_x,subtitle_y,2732,2901)
SUBTITLE_FX("もう行くしかない",subtitle_x,subtitle_y,2902,3008)

SUBTITLE_FX("消えない幻もうすでに手に入れてる",subtitle_x,subtitle_y,3009,3237)
SUBTITLE_FX("誰もが皆辿り着ける",subtitle_x,subtitle_y,3240,3410)

SUBTITLE_FX("解けない魔法もうすでに始まってる…",subtitle_x,subtitle_y,4187,4445)

SUBTITLE_FX("消えない幻もうすでに手に入れてる",subtitle_x,subtitle_y,4563,4793)
SUBTITLE_FX("誰もが皆辿り着ける",subtitle_x,subtitle_y,4796,4934)
SUBTITLE_FX("思わぬ奇跡がもうすでに始まっている",subtitle_x,subtitle_y,4935,5168)
SUBTITLE_FX("誰もが皆叶えられる",subtitle_x,subtitle_y,5170,5357)



AUDIO_DUB_TONE(escha_and_logy_no_atelier_game_op_01_00,samplerate=48000,channels=2,type="Silence")++ConvertToYV12(last)



#thumbnail

######## Post Processing ########

ConvertToYV12()
#ConvertToYUY2()
#ConvertToRGB24()

TCPServer()
