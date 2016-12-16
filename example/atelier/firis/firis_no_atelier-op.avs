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

#firis_no_atelier_op=SSRC(FFMS2_VIDEO_SOURCE("src\official\movie\【フィリスのアトリエ】オープニングムービー.720p.mp4",fpsnum=30000,fpsden=1001),48000)
#firis_no_atelier_promotion_video_01=SSRC(FFMS2_VIDEO_SOURCE("src\official\movie\【フィリスのアトリエ】プロモーションビデオ第一弾.720p.mp4"),48000)
#firis_no_atelier_promotion_video_02=SSRC(FFMS2_VIDEO_SOURCE("src\official\movie\【フィリスのアトリエ】プロモーションビデオ第二弾.720p.mp4"),48000)

#firis_no_atelier_promotion_video_01_cache02=firis_no_atelier_promotion_video_01
#firis_no_atelier_promotion_video_02_cache02=firis_no_atelier_promotion_video_02

#firis_no_atelier_niconico_live_event=SSRC(FFMS2_VIDEO_SOURCE("src\official\niconico_live\【フィリスのアトリエ】7月22日ニコニコ生放送内紹介映像「イベント」編.720p.mp4",fpsnum=30000,fpsden=1001),48000)
firis_no_atelier_niconico_live_field=SSRC(FFMS2_VIDEO_SOURCE("src\official\niconico_live\【フィリスのアトリエ】7月22日ニコニコ生放送内紹介映像「フィールド」編.720p.mp4",fpsnum=30000,fpsden=1001),48000)

######## Game (1920*1080) ########

firis_no_atelier_op_video=FFVideoSource("src\official\movie\【フィリスのアトリエ】オープニングムービー.DASH-1080p.mp4",fpsnum=30000,fpsden=1001,seekmode=-1)
firis_no_atelier_op_audio=SSRC(FFAudioSource("src\official\movie\【フィリスのアトリエ】オープニングムービー.DASH-128k.m4a"),48000)
firis_no_atelier_op=AudioDub(firis_no_atelier_op_video,firis_no_atelier_op_audio)
#firis_no_atelier_op=AudioDub(firis_no_atelier_op_video,firis_no_atelier_op)

firis_no_atelier_promotion_video_01_video_path="src\official\movie\【フィリスのアトリエ】プロモーションビデオ第一弾.DASH-1080p.mp4"
firis_no_atelier_promotion_video_01_audio_path="src\official\movie\【フィリスのアトリエ】プロモーションビデオ第一弾.DASH-128k.m4a"

firis_no_atelier_promotion_video_01_video=FFVideoSource(firis_no_atelier_promotion_video_01_video_path,seekmode=-1)
firis_no_atelier_promotion_video_01_audio=SSRC(FFAudioSource(firis_no_atelier_promotion_video_01_audio_path),48000)
firis_no_atelier_promotion_video_01=AudioDub(firis_no_atelier_promotion_video_01_video,firis_no_atelier_promotion_video_01_audio)
#firis_no_atelier_promotion_video_01=AudioDub(firis_no_atelier_promotion_video_01_video,firis_no_atelier_promotion_video_01)

firis_no_atelier_promotion_video_01_video_cache02=FFVideoSource(firis_no_atelier_promotion_video_01_video_path,seekmode=-1)
firis_no_atelier_promotion_video_01_audio_cache02=SSRC(FFAudioSource(firis_no_atelier_promotion_video_01_audio_path),48000)
firis_no_atelier_promotion_video_01_cache02=AudioDub(firis_no_atelier_promotion_video_01_video_cache02,firis_no_atelier_promotion_video_01_audio_cache02)
#firis_no_atelier_promotion_video_01_cache02=AudioDub(firis_no_atelier_promotion_video_01_video_cache02,firis_no_atelier_promotion_video_01_cache02)

firis_no_atelier_promotion_video_02_video_path="src\official\movie\【フィリスのアトリエ】プロモーションビデオ第二弾.DASH-1080p.mp4"
firis_no_atelier_promotion_video_02_audio_path="src\official\movie\【フィリスのアトリエ】プロモーションビデオ第二弾.DASH-128k.m4a"

firis_no_atelier_promotion_video_02_video=FFVideoSource(firis_no_atelier_promotion_video_02_video_path,seekmode=-1)
firis_no_atelier_promotion_video_02_audio=SSRC(FFAudioSource(firis_no_atelier_promotion_video_02_audio_path),48000)
firis_no_atelier_promotion_video_02=AudioDub(firis_no_atelier_promotion_video_02_video,firis_no_atelier_promotion_video_02_audio)
#firis_no_atelier_promotion_video_02=AudioDub(firis_no_atelier_promotion_video_02_video,firis_no_atelier_promotion_video_02)

firis_no_atelier_promotion_video_02_video_cache02=FFVideoSource(firis_no_atelier_promotion_video_02_video_path,seekmode=-1)
firis_no_atelier_promotion_video_02_audio_cache02=SSRC(FFAudioSource(firis_no_atelier_promotion_video_02_audio_path),48000)
firis_no_atelier_promotion_video_02_cache02=AudioDub(firis_no_atelier_promotion_video_02_video_cache02,firis_no_atelier_promotion_video_02_audio_cache02)
#firis_no_atelier_promotion_video_02_cache02=AudioDub(firis_no_atelier_promotion_video_02_video_cache02,firis_no_atelier_promotion_video_02_cache02)

######## Trim ########

firis_no_atelier_promotion_video_01=ASSUME_29_97P(firis_no_atelier_promotion_video_01)
firis_no_atelier_promotion_video_01_cache02=ASSUME_29_97P(firis_no_atelier_promotion_video_01_cache02)
firis_no_atelier_promotion_video_02=ASSUME_29_97P(firis_no_atelier_promotion_video_02)
firis_no_atelier_promotion_video_02_cache02=ASSUME_29_97P(firis_no_atelier_promotion_video_02_cache02)

firis_no_atelier_op_01=Trim(firis_no_atelier_op,0,1335)
firis_no_atelier_op_02=Trim(firis_no_atelier_op,1336,1643)
firis_no_atelier_op_03=Trim(firis_no_atelier_op,1644,2399)
firis_no_atelier_op_04=Trim(firis_no_atelier_op,2400,2664)
firis_no_atelier_op_05=Trim(firis_no_atelier_op,2665,0)

#firis_no_atelier_promotion_video_01_pre=Trim(firis_no_atelier_promotion_video_01,0,90)
firis_no_atelier_promotion_video_01_01=Trim(firis_no_atelier_promotion_video_01_cache02,91,688) #598 op
firis_no_atelier_promotion_video_01_02=Trim(firis_no_atelier_promotion_video_01,689,1094) #406 op
#firis_no_atelier_promotion_video_01_03=Trim(firis_no_atelier_promotion_video_01,1095,1383) #289
firis_no_atelier_promotion_video_01_04=Trim(firis_no_atelier_promotion_video_01,1384,2087) #704 op
firis_no_atelier_promotion_video_01_05=Trim(firis_no_atelier_promotion_video_01,2088,2355) #268 op
#firis_no_atelier_promotion_video_01_post=Trim(firis_no_atelier_promotion_video_01,2356,0)

#firis_no_atelier_promotion_video_02_pre=Trim(firis_no_atelier_promotion_video_02,0,26)
firis_no_atelier_promotion_video_02_01=Trim(firis_no_atelier_promotion_video_02,27,225) #199
firis_no_atelier_promotion_video_02_02=Trim(firis_no_atelier_promotion_video_02_cache02,226,697) #472 op
firis_no_atelier_promotion_video_02_03=Trim(firis_no_atelier_promotion_video_02,698,716) #19 op
firis_no_atelier_promotion_video_02_04=Trim(firis_no_atelier_promotion_video_02,717,1558) #842 op
firis_no_atelier_promotion_video_02_05=Trim(firis_no_atelier_promotion_video_02,1559,1962) #404 op
firis_no_atelier_promotion_video_02_06=Trim(firis_no_atelier_promotion_video_02,1963,2158) #196
#firis_no_atelier_promotion_video_02_post=Trim(firis_no_atelier_promotion_video_02,2159,0)

firis_no_atelier_niconico_live_field_pre=Trim(firis_no_atelier_niconico_live_field,0,76)
firis_no_atelier_niconico_live_field_01=Trim(firis_no_atelier_niconico_live_field,77,390) #314
firis_no_atelier_niconico_live_field_02_menu=Trim(firis_no_atelier_niconico_live_field,391,497) #107
firis_no_atelier_niconico_live_field_03=Trim(firis_no_atelier_niconico_live_field,498,1326) #829
firis_no_atelier_niconico_live_field_04_menu=Trim(firis_no_atelier_niconico_live_field,1327,1442) #116
firis_no_atelier_niconico_live_field_05=Trim(firis_no_atelier_niconico_live_field,1443,2299) #857
firis_no_atelier_niconico_live_field_06_dissolve=Trim(firis_no_atelier_niconico_live_field,2300,2388) #89
firis_no_atelier_niconico_live_field_07=Trim(firis_no_atelier_niconico_live_field,2389,3089) #701
firis_no_atelier_niconico_live_field_08_loading=Trim(firis_no_atelier_niconico_live_field,3090,3151) #62
firis_no_atelier_niconico_live_field_09=Trim(firis_no_atelier_niconico_live_field,3152,3623) #472 op
firis_no_atelier_niconico_live_field_10_dissolve=Trim(firis_no_atelier_niconico_live_field,3624,3652) #29
firis_no_atelier_niconico_live_field_11=Trim(firis_no_atelier_niconico_live_field,3653,4957) #1305 op
firis_no_atelier_niconico_live_field_post=Trim(firis_no_atelier_niconico_live_field,4958,0)

######## Pre Combine ########

fade_length=15

firis_no_atelier_niconico_live_field_11_resized=RESIZE_TO_REF_CLIP(firis_no_atelier_niconico_live_field_11,firis_no_atelier_op)
firis_no_atelier_niconico_live_field_09_resized=RESIZE_TO_REF_CLIP(firis_no_atelier_niconico_live_field_09,firis_no_atelier_op)

######## Combine ########

# firis_no_atelier_op_01 51
# firis_no_atelier_op_02
# firis_no_atelier_op_03
# firis_no_atelier_op_04 7154
# firis_no_atelier_op_05



firis_no_atelier_op_t01=BlankClip(firis_no_atelier_op,length=51,color=color_black)+firis_no_atelier_op_01
firis_no_atelier_op_t02=firis_no_atelier_op_02+Dissolve(firis_no_atelier_op_03,TRIM_LAST_CLIP(firis_no_atelier_promotion_video_01_02,fade_length+342),fade_length)
firis_no_atelier_op_t03=TRIM_MIDDLE_CLIP(firis_no_atelier_niconico_live_field_11_resized,885)+TRIM_FIRST_CLIP(firis_no_atelier_niconico_live_field_09_resized,387)+TRIM_FIRST_CLIP(firis_no_atelier_promotion_video_02_03+firis_no_atelier_promotion_video_02_04,56+774)
firis_no_atelier_op_t04=TRIM_FIRST_CLIP(firis_no_atelier_promotion_video_02_02,83+388)
firis_no_atelier_op_t05=TRIM_LAST_CLIP(firis_no_atelier_promotion_video_01_01,fade_length+442)
firis_no_atelier_op_t06=FADE_IN_WITH_BRIGHTNESS_OFFSET_RGB24(TRIM_FIRST_CLIP(firis_no_atelier_promotion_video_01_04+firis_no_atelier_promotion_video_01_05,443+332+249-(Framecount(firis_no_atelier_promotion_video_02_05)-322)),fade_length)
firis_no_atelier_op_t07=firis_no_atelier_promotion_video_02_05+firis_no_atelier_op_04+firis_no_atelier_op_05

firis_no_atelier_op_mute=firis_no_atelier_op_t01+firis_no_atelier_op_t02+firis_no_atelier_op_t03+Dissolve(firis_no_atelier_op_t04,firis_no_atelier_op_t05,fade_length)+firis_no_atelier_op_t06+firis_no_atelier_op_t07

######## Music ########

bgm_48khz=SSRC(WAVSource("src\firis_no_atelier-vocal_album-02.wav"),48000)
AudioDub(firis_no_atelier_op_mute,bgm_48khz)



thumbnail=Trim(1779,-30*5)

######## Subtitle ########

#global subtitle_clip_width=1280
#global subtitle_clip_height=720

subtitle_x=50
subtitle_y=395
global subtitle_front_fade_count=15
global subtitle_rear_fade_count=15
global subtitle_font="MS Gothic"
global subtitle_effects="b"
global subtitle_size=32
global subtitle_text_color=color_darkcyan
global subtitle_halo_color=color_white

function SUBTITLE_FX(clip clip,string text,float x,float y,int start_frame,int end_frame,bool "is_title"){
	is_title=Default(is_title,false)

	text_color=is_title?OVERWRITE_COLOR_ALPHA(subtitle_text_color,$3F):subtitle_text_color

	return SUBTITLE_FX_FADE_IN_FADE_OUT(clip,text,Round(x),Round(y),start_frame,end_frame,subtitle_front_fade_count,subtitle_rear_fade_count,subtitle_font,subtitle_effects,Round(subtitle_size),text_color,subtitle_halo_color)
}

SUBTITLE_FX("flora//南壽あさ子|- by fielia@AVISynth",subtitle_x,subtitle_y-subtitle_size,7053,7275,true)

SUBTITLE_FX("悲しいだれかの声がきこえたら",subtitle_x,subtitle_y,482,692)
SUBTITLE_FX("わたしの胸は疼く",subtitle_x,subtitle_y,711,903)
SUBTITLE_FX("それでも瞳を閉じてしまったら",subtitle_x,subtitle_y-subtitle_size,924,1140)
SUBTITLE_FX("こころの海は渇いていく",subtitle_x,subtitle_y,1146,1352)

SUBTITLE_FX("愛されたいと願うときには",subtitle_x,subtitle_y,1388,1568)
SUBTITLE_FX("名もない花を 愛しましょう",subtitle_x,subtitle_y,1608,1799)

SUBTITLE_FX("flora",subtitle_x,subtitle_y-subtitle_size,1810,1918)
SUBTITLE_FX("ここから 一緒にゆこう わたしと",subtitle_x,subtitle_y,1920,2246)
SUBTITLE_FX("あたらしい船をだす",subtitle_x,subtitle_y-subtitle_size,2252,2397)

SUBTITLE_FX("いつかはだれもが塵になるとしても",subtitle_x,subtitle_y,2779,2993)
SUBTITLE_FX("どこかでまた出会うわ",subtitle_x,subtitle_y,3008,3200)
SUBTITLE_FX("いまでもあなたが好きよ さみしくはないわ",subtitle_x,subtitle_y-subtitle_size,3221,3438)
SUBTITLE_FX("あなたの海はひろいから",subtitle_x,subtitle_y,3441,3639)

SUBTITLE_FX("はるか彼方で 波がさわぐときは",subtitle_x,subtitle_y-subtitle_size,3683,3896)
SUBTITLE_FX("なにができるの いまのわたし",subtitle_x,subtitle_y,3905,4094)

SUBTITLE_FX("flora",subtitle_x,subtitle_y-subtitle_size,4106,4216)
SUBTITLE_FX("ここから 空に唄おう わたしと",subtitle_x,subtitle_y,4216,4545)
SUBTITLE_FX("ゆこう 旅はここから",subtitle_x,subtitle_y-subtitle_size,4548,4760)
SUBTITLE_FX("今からでも遅すぎることはない",subtitle_x,subtitle_y,4763,5035)

SUBTITLE_FX("花のひとひら 雲のはざまに",subtitle_x,subtitle_y-subtitle_size,5357,5576)
SUBTITLE_FX("浮かんで消えて あの子のもとへ",subtitle_x,subtitle_y,5580,5793)

SUBTITLE_FX("flora",subtitle_x,subtitle_y-subtitle_size,5793,5903)
SUBTITLE_FX("ここから まあたらしい世界へ",subtitle_x,subtitle_y,5905,6232)
SUBTITLE_FX("ゆこう そうよ今から",subtitle_x,subtitle_y-subtitle_size,6235,6446)
SUBTITLE_FX("旅に出ようよ",subtitle_x,subtitle_y,6450,6564)

SUBTITLE_FX("水平線を 地平をこえて",subtitle_x,subtitle_y-subtitle_size,6568,6705)
SUBTITLE_FX("しらないだれかのために",subtitle_x,subtitle_y,6706,6853)



#thumbnail

######## Post Processing ########

ConvertToYV12()
#ConvertToYUY2()
#ConvertToRGB24()

TCPServer()
