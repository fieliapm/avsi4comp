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



Import("..\..\avsi4comp\macro.avsi")

######## Game (1280*720) ########

sophie_no_atelier_op=SSRC(FFMS2_VIDEO_SOURCE("src\official\movie\11_19発売予定！【ソフィーのアトリエ】オープニングムービー.720p.mp4"),48000)
sophie_no_atelier_teaser_movie=SSRC(FFMS2_VIDEO_SOURCE("src\official\movie\11_19発売予定！【ソフィーのアトリエ】ティザームービー Full Ver..720p.mp4"),48000)
sophie_no_atelier_promotion_movie_01=SSRC(FFMS2_VIDEO_SOURCE("src\official\movie\11_19発売予定！【ソフィーのアトリエ】プロモーションムービー.720p.mp4"),48000)
sophie_no_atelier_promotion_movie_02=SSRC(FFMS2_VIDEO_SOURCE("src\official\movie\11_19発売予定！【ソフィーのアトリエ】プロモーションムービー第２弾.720p.mp4"),48000)

######## Trim ########

sophie_no_atelier_op_01=Trim(sophie_no_atelier_op,0,1489)
sophie_no_atelier_op_02=Trim(sophie_no_atelier_op,1490,1958)
sophie_no_atelier_op_03=Trim(sophie_no_atelier_op,1959,0)

#sophie_no_atelier_teaser_movie_pre=Trim(sophie_no_atelier_teaser_movie,0,195)
sophie_no_atelier_teaser_movie_01=Trim(sophie_no_atelier_teaser_movie,196,334) #139
sophie_no_atelier_teaser_movie_02=Trim(sophie_no_atelier_teaser_movie,335,1719) #1385 op
sophie_no_atelier_teaser_movie_03=Trim(sophie_no_atelier_teaser_movie,1720,2065) #346 op
#sophie_no_atelier_teaser_movie_post=Trim(sophie_no_atelier_teaser_movie,2066,0)

#sophie_no_atelier_promotion_movie_01_pre_01=Trim(sophie_no_atelier_promotion_movie_01,0,89)
#sophie_no_atelier_promotion_movie_01_pre_02=Trim(sophie_no_atelier_promotion_movie_01,90,268) #179
sophie_no_atelier_promotion_movie_01_past_atelier=Trim(sophie_no_atelier_promotion_movie_01,269,943) #675 op
sophie_no_atelier_promotion_movie_01_01=Trim(sophie_no_atelier_promotion_movie_01,944,973) #30 op
sophie_no_atelier_promotion_movie_01_02=Trim(sophie_no_atelier_promotion_movie_01,974,1045) #72 op
sophie_no_atelier_promotion_movie_01_03=Trim(sophie_no_atelier_promotion_movie_01,1046,1688) #643 op
sophie_no_atelier_promotion_movie_01_04=Trim(sophie_no_atelier_promotion_movie_01,1689,1812) #124 op
sophie_no_atelier_promotion_movie_01_05=Trim(sophie_no_atelier_promotion_movie_01,1813,2123) #311 op
#sophie_no_atelier_promotion_movie_01_post=Trim(sophie_no_atelier_promotion_movie_01,2124,0)

#sophie_no_atelier_promotion_movie_02_pre=Trim(sophie_no_atelier_promotion_movie_02,0,181)
sophie_no_atelier_promotion_movie_02_01=Trim(sophie_no_atelier_promotion_movie_02,182,759)
sophie_no_atelier_promotion_movie_02_02=Trim(sophie_no_atelier_promotion_movie_02,760,1382)
sophie_no_atelier_promotion_movie_02_03=Trim(sophie_no_atelier_promotion_movie_02,1383,2388)
#sophie_no_atelier_promotion_movie_02_04=Trim(sophie_no_atelier_promotion_movie_02,2389,2750)
#sophie_no_atelier_promotion_movie_02_post=Trim(sophie_no_atelier_promotion_movie_02,2751,0)

######## Pre Combine ########

fade_length=15

sophie_no_atelier_op_03_extend=Loop(sophie_no_atelier_op_03,175,669,669)

sophie_no_atelier_promotion_movie_01_past_atelier_faster=CLIP_SPEED(sophie_no_atelier_promotion_movie_01_past_atelier,Float(Framecount(sophie_no_atelier_promotion_movie_01_past_atelier))/484.0,true)

######## Combine ########

# sophie_no_atelier_op_01 2
# sophie_no_atelier_op_02 6042
# sophie_no_atelier_op_03 6991

# sophie_no_atelier_promotion_movie_02_01 2542
# sophie_no_atelier_promotion_movie_02_02 3120
# sophie_no_atelier_promotion_movie_02_03 3983 (3743)



sophie_no_atelier_op_t01=BlankClip(sophie_no_atelier_op,length=2,color=color_black)+sophie_no_atelier_op_01
sophie_no_atelier_op_t02=FADE_IN_WITH_BRIGHTNESS_OFFSET_RGB24(TRIM_LAST_CLIP(sophie_no_atelier_teaser_movie_02,475+575),fade_length)
sophie_no_atelier_op_t03=sophie_no_atelier_promotion_movie_02_01+sophie_no_atelier_promotion_movie_02_02
sophie_no_atelier_op_t04=TRIM_FIRST_CLIP(sophie_no_atelier_teaser_movie_03,240)+sophie_no_atelier_promotion_movie_02_03
sophie_no_atelier_op_t05=TRIM_FIRST_CLIP(sophie_no_atelier_promotion_movie_01_03,541)
sophie_no_atelier_op_t06=TRIM_MIDDLE_CLIP(sophie_no_atelier_promotion_movie_01_01,28)+TRIM_MIDDLE_CLIP(sophie_no_atelier_promotion_movie_01_past_atelier_faster,484)
sophie_no_atelier_op_t07=sophie_no_atelier_op_02+TRIM_MIDDLE_CLIP(sophie_no_atelier_promotion_movie_01_02+sophie_no_atelier_promotion_movie_01_04+sophie_no_atelier_promotion_movie_01_05,480)+sophie_no_atelier_op_03_extend+BlankClip(sophie_no_atelier_op,length=30*5,color=color_black)

sophie_no_atelier_op_mute=sophie_no_atelier_op_t01+sophie_no_atelier_op_t02+sophie_no_atelier_op_t03+sophie_no_atelier_op_t04+sophie_no_atelier_op_t05+sophie_no_atelier_op_t06+sophie_no_atelier_op_t07

######## Music ########

bgm_48khz=SSRC(WAVSource("src\sophie_no_atelier-vocal_album-02.wav"),48000)
AudioDub(sophie_no_atelier_op_mute,bgm_48khz)



thumbnail=Trim(7082,-30*5)

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
global subtitle_text_color=color_forestgreen
global subtitle_halo_color=color_white

function SUBTITLE_FX(clip clip,string text,float x,float y,int start_frame,int end_frame,bool "is_title"){
	is_title=Default(is_title,false)

	text_color=is_title?OVERWRITE_COLOR_ALPHA(subtitle_text_color,$3F):subtitle_text_color

	return SUBTITLE_FX_FADE_IN_FADE_OUT(clip,text,Round(x),Round(y),start_frame,end_frame,subtitle_front_fade_count,subtitle_rear_fade_count,subtitle_font,subtitle_effects,Round(subtitle_size),text_color,subtitle_halo_color)
}

SUBTITLE_FX("Phronesis//RURUTIA|- by fielia@AVISynth",subtitle_x,subtitle_y-subtitle_size,7611,7834,true)

SUBTITLE_FX("ひとりで悩んでた夢の探し方",subtitle_x,subtitle_y,10,209)
SUBTITLE_FX("あなたは分かるかな",subtitle_x,subtitle_y,231,325)
SUBTITLE_FX("ねえ、わたし何を叶えたいの？",subtitle_x,subtitle_y,341,522)

SUBTITLE_FX("（答えはどこにあるの？）",subtitle_x,subtitle_x,481,627)
SUBTITLE_FX("見つけたい--",subtitle_x,subtitle_y,651,758)
SUBTITLE_FX("（一緒に探してほしい）",subtitle_x,subtitle_x,721,868)

SUBTITLE_FX("一から始めるよ",subtitle_x,subtitle_y,841,926)

SUBTITLE_FX("ぐるぐるっと釜を混ぜたら",subtitle_x,subtitle_y,927,1053)
SUBTITLE_FX("うまれる知らない知識",subtitle_x,subtitle_y,1062,1174)
SUBTITLE_FX("まっしろなページ手繰って",subtitle_x,subtitle_y,1181,1289)
SUBTITLE_FX("ひとつずつ大切に綴ろう",subtitle_x,subtitle_y,1302,1482)

SUBTITLE_FX("紡いだレシピの分だけ",subtitle_x,subtitle_y,1482,1642)
SUBTITLE_FX("（きっと）",subtitle_x,subtitle_x,1611,1656)
SUBTITLE_FX("わたしは知る",subtitle_x,subtitle_y,1651,1712)
SUBTITLE_FX("探さなくてもここにある",subtitle_x,subtitle_y,1720,1878)
SUBTITLE_FX("夢のかたちを",subtitle_x,subtitle_y,1890,2027)

SUBTITLE_FX("Lalala…",subtitle_x,subtitle_x,1961,2148)
SUBTITLE_FX("Lalala…",subtitle_x,subtitle_x,2202,2376)
SUBTITLE_FX("夢を歌おう",subtitle_x,subtitle_y,2371,2520)

SUBTITLE_FX("あなたの叶えたい夢を聞きたいな",subtitle_x,subtitle_y,2572,2766)
SUBTITLE_FX("わたしが手伝うよ",subtitle_x,subtitle_y,2792,2886)
SUBTITLE_FX("何になって何をしたいの？",subtitle_x,subtitle_y,2901,3068)

SUBTITLE_FX("（願いはどこにあるの？）",subtitle_x,subtitle_x,3021,3168)
SUBTITLE_FX("見つけたい--",subtitle_x,subtitle_y,3191,3287)
SUBTITLE_FX("（一緒に叶えてゆこう）",subtitle_x,subtitle_x,3261,3407)

SUBTITLE_FX("百まで頑張るよ",subtitle_x,subtitle_y,3381,3463)

SUBTITLE_FX("さらさらっと囁く声に",subtitle_x,subtitle_y,3465,3592)
SUBTITLE_FX("教わる知らない手順",subtitle_x,subtitle_y,3601,3713)
SUBTITLE_FX("まっくろな煤を拭って",subtitle_x,subtitle_y,3720,3832)
SUBTITLE_FX("ひとつずつ慎重に繋いでく",subtitle_x,subtitle_y,3841,4087)

SUBTITLE_FX("結んだ願いの分だけ",subtitle_x,subtitle_y,4501,4658)
SUBTITLE_FX("（やっと）",subtitle_x,subtitle_x,4630,4675)
SUBTITLE_FX("わたしは知る",subtitle_x,subtitle_y,4670,4727)
SUBTITLE_FX("あなたの夢に隠れてる",subtitle_x,subtitle_y,4741,4897)
SUBTITLE_FX("涙の数を",subtitle_x,subtitle_y,4910,5017)

SUBTITLE_FX("滲んでいたページの中の思い出",subtitle_x,subtitle_y,5030,5195)
SUBTITLE_FX("いつか掠れ消える",subtitle_x,subtitle_y,5191,5378)
SUBTITLE_FX("それで良いの？",subtitle_x,subtitle_y,5390,5470)

SUBTITLE_FX("結んだ願いの分だけ",subtitle_x,subtitle_y,5550,5722)
SUBTITLE_FX("わたしの夢と重なるよ",subtitle_x,subtitle_y,5791,5945)
SUBTITLE_FX("叶えよう",subtitle_x,subtitle_y,5960,6032)

SUBTITLE_FX("紡いだレシピの分だけ",subtitle_x,subtitle_y,6031,6191)
SUBTITLE_FX("（きっと）",subtitle_x,subtitle_x,6161,6206)
SUBTITLE_FX("わたしは知る",subtitle_x,subtitle_y,6201,6256)
SUBTITLE_FX("笑い合える明日を作る",subtitle_x,subtitle_y,6271,6428)
SUBTITLE_FX("夢のかたちを",subtitle_x,subtitle_y,6441,6571)

SUBTITLE_FX("Lalala…",subtitle_x,subtitle_x,6511,6698)
SUBTITLE_FX("Lalala…",subtitle_x,subtitle_x,6751,6933)
SUBTITLE_FX("Lalala…",subtitle_x,subtitle_x,6991,7178)
SUBTITLE_FX("Lalala…",subtitle_x,subtitle_x,7231,7406)
SUBTITLE_FX("夢を歌おう",subtitle_x,subtitle_y,7401,7553)



#thumbnail

######## Post Processing ########

ConvertToYV12()
#ConvertToYUY2()
#ConvertToRGB24()

TCPServer()
