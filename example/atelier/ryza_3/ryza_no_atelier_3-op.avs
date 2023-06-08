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

Import("..\..\..\avsi4comp\avsi4comp.avsi")

### inherit end ###

######## Function ########

### inherit start ###

LoadPlugin("..\..\plugins\MaskTools.dll")

function SUBTITLE_FX_FADE_IN_FADE_OUT_DOUBLE_HALO(clip clip,string text,int x,int y,int start_frame,int end_frame,int front_fade_count,int rear_fade_count,string "font",string "effects",int "size",int "text_color",int "halo_color",int "outside_halo_color",string "subtitle_mode"){
	before_start_frame=start_frame-front_fade_count
	after_end_frame=end_frame+rear_fade_count

	Assert(IsRGB32(clip),"SUBTITLE_FX_FADE_IN_FADE_OUT_DOUBLE_HALO(): clip only support RGB32 format")

	subtitle_rgb=_SUBTITLE_FX_PRE_OPAQUE(clip,outside_halo_color,text,x,y,before_start_frame,after_end_frame,font,effects,size,text_color,halo_color,subtitle_mode)
	subtitle_rgba=ColorKeyMask(ResetMask(subtitle_rgb),outside_halo_color,0)

	subtitle_alpha=CONVERT_BACK_TO_YV12(ShowAlpha(subtitle_rgba),matrix="Rec709")
	subtitle_alpha=Expand(Expand(Expand(subtitle_alpha)))
	subtitle_alpha=ConvertToRGB32(Greyscale(subtitle_alpha),matrix="Rec709")

	subtitle_rgba=Mask(subtitle_rgba,subtitle_alpha)

	subtitle_rgba_faded_containing_parameter=ScriptClip(subtitle_rgba,"RGBAdjust(a=alpha_factor)")
	subtitle_rgba_faded=FrameEvaluate(subtitle_rgba_faded_containing_parameter,"alpha_factor=Spline(current_frame,"+String(before_start_frame)+",0.0,"+String(start_frame)+",1.0,"+String(end_frame)+",1.0,"+String(after_end_frame)+",0.0,cubic=false)")

	return _SUBTITLE_FX_POST(clip,subtitle_rgba_faded,before_start_frame,after_end_frame)
}

### inherit end ###

######## Game (1920*1080) ########

function RYZA_NO_ATELIER_3_OP_MP4_REF_SOURCE(){
	ryza_no_atelier_3_op_mp4_ref=SSRC(FFmpegSource2("src\official\movies\pv\『ライザのアトリエ３』アバンタイトルムービー.720p.mp4",atrack=-1,fpsnum=30000,fpsden=1001,threads=1),48000)
	return ryza_no_atelier_3_op_mp4_ref
}

function RYZA_NO_ATELIER_3_OP_MP4_SOURCE(){
	ryza_no_atelier_3_op_mp4_video=FFVideoSource("src\official\movies\pv\『ライザのアトリエ３』アバンタイトルムービー.DASH-1080p.mp4",fpsnum=30000,fpsden=1001,threads=1,seekmode=-1)
	ryza_no_atelier_3_op_mp4_audio=SSRC(FFAudioSource("src\official\movies\pv\『ライザのアトリエ３』アバンタイトルムービー.DASH-128k.m4a"),48000)
	ryza_no_atelier_3_op_mp4=AudioDub(ryza_no_atelier_3_op_mp4_video,ryza_no_atelier_3_op_mp4_audio)
	return ryza_no_atelier_3_op_mp4
}

#ryza_no_atelier_3_op=RYZA_NO_ATELIER_3_OP_MP4_REF_SOURCE()
#ryza_no_atelier_3_op_cache02=ryza_no_atelier_3_op

ryza_no_atelier_3_op=RYZA_NO_ATELIER_3_OP_MP4_SOURCE()
ryza_no_atelier_3_op_cache02=RYZA_NO_ATELIER_3_OP_MP4_SOURCE()



function RYZA_NO_ATELIER_3_PROMOTION_MOVIE_01_MP4_REF_SOURCE(){
	ryza_no_atelier_promotion_movie_01_mp4_ref=SSRC(FFmpegSource2("src\official\movies\pv\『ライザのアトリエ３』プロモーションムービー第1弾.720p.mp4",atrack=-1,fpsnum=30000,fpsden=1001,threads=1),48000)
	return ryza_no_atelier_promotion_movie_01_mp4_ref
}

function RYZA_NO_ATELIER_3_PROMOTION_MOVIE_01_MP4_SOURCE(){
	ryza_no_atelier_3_promotion_movie_01_mp4_video=FFVideoSource("src\official\movies\pv\『ライザのアトリエ３』プロモーションムービー第1弾.DASH-1080p.mp4",fpsnum=30000,fpsden=1001,threads=1,seekmode=-1)
	ryza_no_atelier_3_promotion_movie_01_mp4_audio=SSRC(FFAudioSource("src\official\movies\pv\『ライザのアトリエ３』プロモーションムービー第1弾.DASH-128k.m4a"),48000)
	ryza_no_atelier_3_promotion_movie_01_mp4=AudioDub(ryza_no_atelier_3_promotion_movie_01_mp4_video,ryza_no_atelier_3_promotion_movie_01_mp4_audio)
	return ryza_no_atelier_3_promotion_movie_01_mp4
}

#ryza_no_atelier_3_promotion_movie_01=RYZA_NO_ATELIER_3_PROMOTION_MOVIE_01_MP4_REF_SOURCE()
#ryza_no_atelier_3_promotion_movie_01_cache02=ryza_no_atelier_3_promotion_movie_01

ryza_no_atelier_3_promotion_movie_01=RYZA_NO_ATELIER_3_PROMOTION_MOVIE_01_MP4_SOURCE()
ryza_no_atelier_3_promotion_movie_01_cache02=RYZA_NO_ATELIER_3_PROMOTION_MOVIE_01_MP4_SOURCE()



function RYZA_NO_ATELIER_3_PROMOTION_MOVIE_02_MP4_REF_SOURCE(){
	ryza_no_atelier_promotion_movie_02_mp4_ref=SSRC(FFmpegSource2("src\official\movies\pv\『ライザのアトリエ３』プロモーションムービー第2弾.720p.mp4",atrack=-1,fpsnum=30000,fpsden=1001,threads=1),48000)
	return ryza_no_atelier_promotion_movie_02_mp4_ref
}

function RYZA_NO_ATELIER_3_PROMOTION_MOVIE_02_MP4_SOURCE(){
	ryza_no_atelier_3_promotion_movie_02_mp4_video=FFVideoSource("src\official\movies\pv\『ライザのアトリエ３』プロモーションムービー第2弾.DASH-1080p.mp4",fpsnum=30000,fpsden=1001,threads=1,seekmode=-1)
	ryza_no_atelier_3_promotion_movie_02_mp4_audio=SSRC(FFAudioSource("src\official\movies\pv\『ライザのアトリエ３』プロモーションムービー第2弾.DASH-128k.m4a"),48000)
	ryza_no_atelier_3_promotion_movie_02_mp4=AudioDub(ryza_no_atelier_3_promotion_movie_02_mp4_video,ryza_no_atelier_3_promotion_movie_02_mp4_audio)
	return ryza_no_atelier_3_promotion_movie_02_mp4
}

#ryza_no_atelier_3_promotion_movie_02=RYZA_NO_ATELIER_3_PROMOTION_MOVIE_02_MP4_REF_SOURCE()
#ryza_no_atelier_3_promotion_movie_02_cache02=ryza_no_atelier_3_promotion_movie_02
#ryza_no_atelier_3_promotion_movie_02_cache03=ryza_no_atelier_3_promotion_movie_02

ryza_no_atelier_3_promotion_movie_02=RYZA_NO_ATELIER_3_PROMOTION_MOVIE_02_MP4_SOURCE()
ryza_no_atelier_3_promotion_movie_02_cache02=RYZA_NO_ATELIER_3_PROMOTION_MOVIE_02_MP4_SOURCE()
ryza_no_atelier_3_promotion_movie_02_cache03=RYZA_NO_ATELIER_3_PROMOTION_MOVIE_02_MP4_SOURCE()




function RYZA_NO_ATELIER_3_STORY_TRAILER_MP4_REF_SOURCE(){
	ryza_no_atelier_story_trailer_mp4_ref=SSRC(FFmpegSource2("src\official\movies\pv\『ライザのアトリエ３』ストーリートレーラー.720p.mp4",atrack=-1,fpsnum=30000,fpsden=1001,threads=1),48000)
	return ryza_no_atelier_story_trailer_mp4_ref
}

function RYZA_NO_ATELIER_3_STORY_TRAILER_MP4_SOURCE(){
	ryza_no_atelier_3_story_trailer_mp4_video=FFVideoSource("src\official\movies\pv\『ライザのアトリエ３』ストーリートレーラー.DASH-1080p.mp4",fpsnum=30000,fpsden=1001,threads=1,seekmode=-1)
	ryza_no_atelier_3_story_trailer_mp4_audio=SSRC(FFAudioSource("src\official\movies\pv\『ライザのアトリエ３』ストーリートレーラー.DASH-128k.m4a"),48000)
	ryza_no_atelier_3_story_trailer_mp4=AudioDub(ryza_no_atelier_3_story_trailer_mp4_video,ryza_no_atelier_3_story_trailer_mp4_audio)
	return ryza_no_atelier_3_story_trailer_mp4
}

ryza_no_atelier_3_story_trailer=RYZA_NO_ATELIER_3_STORY_TRAILER_MP4_REF_SOURCE()

ryza_no_atelier_3_story_trailer=RYZA_NO_ATELIER_3_STORY_TRAILER_MP4_SOURCE()



function RYZA_NO_ATELIER_3_BOS_BRUNNEN_INTRO_MOVIE_MP4_REF_SOURCE(){
	ryza_no_atelier_promotion_movie_mp4_ref=SSRC(FFmpegSource2("src\official\movies\pv\『ライザのアトリエ３』ボオス・ブルネン紹介ムービー.720p.mp4",atrack=-1,fpsnum=30000,fpsden=1001,threads=1),48000)
	return ryza_no_atelier_promotion_movie_mp4_ref
}

function RYZA_NO_ATELIER_3_BOS_BRUNNEN_INTRO_MOVIE_MP4_SOURCE(){
	ryza_no_atelier_3_bos_bruunen_intro_movie_mp4_video=FFVideoSource("src\official\movies\pv\『ライザのアトリエ３』ボオス・ブルネン紹介ムービー.DASH-1080p.mp4",fpsnum=30000,fpsden=1001,threads=1,seekmode=-1)
	ryza_no_atelier_3_bos_bruunen_intro_movie_mp4_audio=SSRC(FFAudioSource("src\official\movies\pv\『ライザのアトリエ３』ボオス・ブルネン紹介ムービー.DASH-128k.m4a"),48000)
	ryza_no_atelier_3_bos_bruunen_intro_movie_mp4=AudioDub(ryza_no_atelier_3_bos_bruunen_intro_movie_mp4_video,ryza_no_atelier_3_bos_bruunen_intro_movie_mp4_audio)
	return ryza_no_atelier_3_bos_bruunen_intro_movie_mp4
}

#ryza_no_atelier_3_bos_bruunen_intro_movie=RYZA_NO_ATELIER_3_BOS_BRUNNEN_INTRO_MOVIE_MP4_REF_SOURCE()

ryza_no_atelier_3_bos_bruunen_intro_movie=RYZA_NO_ATELIER_3_BOS_BRUNNEN_INTRO_MOVIE_MP4_SOURCE()

######## Trim ########

ryza_no_atelier_3_op_pre=Trim(ryza_no_atelier_3_op,0,29)
ryza_no_atelier_3_op_01_cache02=Trim(ryza_no_atelier_3_op_cache02,30,733)
ryza_no_atelier_3_op_01=Trim(ryza_no_atelier_3_op,30,733)
ryza_no_atelier_3_op_02=Trim(ryza_no_atelier_3_op,734,1980)
ryza_no_atelier_3_op_03=Trim(ryza_no_atelier_3_op,1981,2408)
ryza_no_atelier_3_op_04=Trim(ryza_no_atelier_3_op,2409,2932)
ryza_no_atelier_3_op_05=Trim(ryza_no_atelier_3_op,2933,3684)
ryza_no_atelier_3_op_post=Trim(ryza_no_atelier_3_op,3685,0)

ryza_no_atelier_3_promotion_movie_01_pre=Trim(ryza_no_atelier_3_promotion_movie_01,0,29) #30
ryza_no_atelier_3_promotion_movie_01_01=Trim(ryza_no_atelier_3_promotion_movie_01_cache02,30,279) #250 op
ryza_no_atelier_3_promotion_movie_01_02=Trim(ryza_no_atelier_3_promotion_movie_01_cache02,280,443) #164 op
ryza_no_atelier_3_promotion_movie_01_03_title=Trim(ryza_no_atelier_3_promotion_movie_01,444,592) #149
ryza_no_atelier_3_promotion_movie_01_04=Trim(ryza_no_atelier_3_promotion_movie_01,593,977) #385 op
ryza_no_atelier_3_promotion_movie_01_05=Trim(ryza_no_atelier_3_promotion_movie_01,978,1354) #377 op
ryza_no_atelier_3_promotion_movie_01_06=Trim(ryza_no_atelier_3_promotion_movie_01,1355,1517) #163 op
ryza_no_atelier_3_promotion_movie_01_07=Trim(ryza_no_atelier_3_promotion_movie_01,1518,2023) #506 op
ryza_no_atelier_3_promotion_movie_01_08=Trim(ryza_no_atelier_3_promotion_movie_01,2024,2962) #939 op
ryza_no_atelier_3_promotion_movie_01_09_title=Trim(ryza_no_atelier_3_promotion_movie_01,2963,3262)
ryza_no_atelier_3_promotion_movie_01_10=Trim(ryza_no_atelier_3_promotion_movie_01,3263,3493) #231 op
ryza_no_atelier_3_promotion_movie_01_post=Trim(ryza_no_atelier_3_promotion_movie_01,3494,0)

ryza_no_atelier_3_promotion_movie_02_pre=Trim(ryza_no_atelier_3_promotion_movie_02,0,29) #30
ryza_no_atelier_3_promotion_movie_02_01=Trim(ryza_no_atelier_3_promotion_movie_02_cache02,30,179) #150 op
ryza_no_atelier_3_promotion_movie_02_02_title=Trim(ryza_no_atelier_3_promotion_movie_02,180,289) #110
ryza_no_atelier_3_promotion_movie_02_03=Trim(ryza_no_atelier_3_promotion_movie_02_cache02,290,571) #282 op
ryza_no_atelier_3_promotion_movie_02_04=Trim(ryza_no_atelier_3_promotion_movie_02,572,1018) #447 op
ryza_no_atelier_3_promotion_movie_02_05=Trim(ryza_no_atelier_3_promotion_movie_02,1019,1666) #648 op
ryza_no_atelier_3_promotion_movie_02_06=Trim(ryza_no_atelier_3_promotion_movie_02_cache03,1667,2217) #551 op
ryza_no_atelier_3_promotion_movie_02_07=Trim(ryza_no_atelier_3_promotion_movie_02,2218,3153) #936 op
ryza_no_atelier_3_promotion_movie_02_08_title=Trim(ryza_no_atelier_3_promotion_movie_02,3154,3330)
ryza_no_atelier_3_promotion_movie_02_post=Trim(ryza_no_atelier_3_promotion_movie_02,3331,0)

######## Pre Combine ########

fade_length=10

#ryza_no_atelier_teaser_trailer_02_01_faded=CONVERT_BACK_TO_YV12(FADE_OUT_WITH_BRIGHTNESS_OFFSET(ConvertToRGB24(TRIM_FIRST_CLIP(ryza_no_atelier_teaser_trailer_02_01,239),matrix="Rec709"),fade_length,false),matrix="Rec709")

######## Combine ########

# ryza_no_atelier_3_op_01 -9
# ryza_no_atelier_3_op_02 695/3789
# ryza_no_atelier_3_op_03 1942/5036/6892
# ryza_no_atelier_3_op_04 2370/5464/7474
# ryza_no_atelier_3_op_05 2894/5988/8153



op_music_start=9

ryza_no_atelier_3_op_t00=Trim(ryza_no_atelier_3_op_01_cache02,0,op_music_start-1)
ryza_no_atelier_3_op_t01=Trim(ryza_no_atelier_3_op_01,op_music_start,0)+ryza_no_atelier_3_op_02+ryza_no_atelier_3_op_03
ryza_no_atelier_3_op_t02=TRIM_FIRST_CLIP(ryza_no_atelier_3_promotion_movie_02_04+ryza_no_atelier_3_promotion_movie_01_04,524+288)

ryza_no_atelier_3_op_t03=FADE_OUT_WITH_BRIGHTNESS_OFFSET(TRIM_FIRST_CLIP(ryza_no_atelier_3_promotion_movie_02_05,607),fade_length)

ryza_no_atelier_3_op_t04=FADE_IN_WITH_BRIGHTNESS_OFFSET(Trim(ryza_no_atelier_3_promotion_movie_01_05+ryza_no_atelier_3_promotion_movie_01_06+ryza_no_atelier_3_promotion_movie_01_07+ryza_no_atelier_3_promotion_movie_01_01,15,-1247),fade_length)+TRIM_FIRST_CLIP(ryza_no_atelier_3_promotion_movie_02_07,428)
ryza_no_atelier_3_op_t05=TRIM_FIRST_CLIP(ryza_no_atelier_3_promotion_movie_01_08,524+288+127)

ryza_no_atelier_3_op_t06=TRIM_LAST_CLIP(ryza_no_atelier_3_promotion_movie_02_06,616-127)

#ryza_no_atelier_3_op_t07=TRIM_FIRST_CLIP(+ryza_no_atelier_3_promotion_movie_02_01+ryza_no_atelier_3_promotion_movie_02_03,428)+TRIM_LAST_CLIP(ryza_no_atelier_3_promotion_movie_01_02,154)
ryza_no_atelier_3_op_t07=FADE_OUT_WITH_BRIGHTNESS_OFFSET(TRIM_FIRST_CLIP(+ryza_no_atelier_3_promotion_movie_02_01+ryza_no_atelier_3_promotion_movie_01_02+ryza_no_atelier_3_promotion_movie_02_03,428+154),fade_length)
ryza_no_atelier_3_op_t08=ryza_no_atelier_3_op_04+FADE_OUT_WITH_BRIGHTNESS_OFFSET(FADE_IN_WITH_BRIGHTNESS_OFFSET(TRIM_MIDDLE_CLIP(ryza_no_atelier_3_promotion_movie_01_10,155),fade_length),fade_length)+ryza_no_atelier_3_op_05+BlankClip(ryza_no_atelier_3_op,length=30*1,color=color_black)


ryza_no_atelier_3_op_mute=ryza_no_atelier_3_op_t01+ryza_no_atelier_3_op_t02+ryza_no_atelier_3_op_t03 \
	+ryza_no_atelier_3_op_t04+ryza_no_atelier_3_op_t05+ryza_no_atelier_3_op_t06 \
	+ryza_no_atelier_3_op_t07+ryza_no_atelier_3_op_t08

ryza_no_atelier_3_op_mute



ConvertToRGB32(matrix="Rec709")
ryza_no_atelier_3_op_t00=ConvertToRGB32(ryza_no_atelier_3_op_t00,matrix="Rec709")

### export clip: ryza_no_atelier_3_op_mute,ryza_no_atelier_3_op_t00

### prefetch: 5,2

### ###

######## Subtitle ########

### inherit start ###

global subtitle_clip_width=1920
global subtitle_clip_height=1080

subtitle_x=50*2.25
subtitle_y=395*2.25
global subtitle_front_fade_count=15
global subtitle_rear_fade_count=15
global subtitle_font="MS Gothic"
global subtitle_effects="b"
global subtitle_size=30*2.25
global subtitle_text_color=color_white
global subtitle_halo_color=color_black
global subtitle_outside_halo_color=color_deepskyblue

function SUBTITLE_FX(clip clip,string text,float x,float y,int start_frame,int end_frame,bool "is_furigana",bool "is_title"){
	is_title=Default(is_title,false)
	is_furigana=Default(is_furigana,false)

	outside_halo_color=is_title?color_gold:subtitle_outside_halo_color

	subtitle_mode=is_furigana?"ex":"ex" #"ex_thick_reduce_memory"
	size=is_furigana?subtitle_size*0.5:subtitle_size
	y=is_furigana?y-size:y

	return SUBTITLE_FX_FADE_IN_FADE_OUT_DOUBLE_HALO(clip,text,Round(x),Round(y),start_frame,end_frame,subtitle_front_fade_count,subtitle_rear_fade_count,subtitle_font,subtitle_effects,Round(size),subtitle_text_color,subtitle_halo_color,outside_halo_color,subtitle_mode)
}

### inherit end ###

SUBTITLE_FX("あの夏の隠れ家//reche|- by fielia@AVISynth",-subtitle_x,subtitle_x,320,583,is_title=true)

SUBTITLE_FX("Dazzling days, forevermore.",subtitle_x,subtitle_y-subtitle_size,9,142)
SUBTITLE_FX("The rainbow-colored summer begins.",subtitle_x,subtitle_y,149,320)

SUBTITLE_FX("ほおづえ                                       く     かえ     ひ  び",subtitle_x,subtitle_y,692,997,true)
SUBTITLE_FX("頬杖つきながら あくびを繰り返す日々に",subtitle_x,subtitle_y,692,997)
SUBTITLE_FX("すこ             な                                       あさ     す",subtitle_x,subtitle_y-subtitle_size*2,997,1307,true)
SUBTITLE_FX("少しずつ慣れてゆき いくつもの朝が過ぎてく",subtitle_x,subtitle_y-subtitle_size*2,997,1307)
SUBTITLE_FX(" ひ  ざ         つよ          くも ま     かぜ    なが",subtitle_x,subtitle_y,1308,1610,true)
SUBTITLE_FX("日差しが強まり 雲間に風が流れて",subtitle_x,subtitle_y,1308,1610)
SUBTITLE_FX(" みなも      ゆ         かげ                       え がお       せ かい    ひら",subtitle_x,subtitle_y-subtitle_size*2,1618,1933,true)
SUBTITLE_FX("水面に揺れる影 いたずらな笑顔に 世界が開いた",subtitle_x,subtitle_y-subtitle_size*2,1618,1933)
 
SUBTITLE_FX("うんめい           ひかり   すじ                           じ ぶん    えら    つか     と",subtitle_x,subtitle_y,1935,2159,true)
SUBTITLE_FX("運命のその光の筋のまんなかに 自分で選び掴み取れる",subtitle_x,subtitle_y,1935,2159)
SUBTITLE_FX("いた             き ぼう             な     なに       またた",subtitle_x,subtitle_y-subtitle_size*2,2158,2367,true)
SUBTITLE_FX("痛みとか希望という名の何かが瞬いて",subtitle_x,subtitle_y-subtitle_size*2,2158,2367)

SUBTITLE_FX("        なつ    かく     が       さわ              なに     し         ぼく",subtitle_x,subtitle_y,2367,2548,true)
SUBTITLE_FX("あの夏の隠れ家は 騒がしく 何も知らぬ僕たちを",subtitle_x,subtitle_y,2367,2548)
SUBTITLE_FX("        しず       たたず      せ かい    そとがわ   いざな",subtitle_x,subtitle_y-subtitle_size*2,2547,2700,true)
SUBTITLE_FX("ただ静かに佇み 世界の外側へ誘う",subtitle_x,subtitle_y-subtitle_size*2,2547,2700)
SUBTITLE_FX("             ま     はし     だ       こた                 み",subtitle_x,subtitle_y,2702,2889,true)
SUBTITLE_FX("いつの間に走り出す 答えはまだ見つからないけれど",subtitle_x,subtitle_y,2702,2889)
SUBTITLE_FX(" て      の         おも      わす",subtitle_x,subtitle_y-subtitle_size*2,2890,3037,true)
SUBTITLE_FX("手を伸ばす想い 忘れないで",subtitle_x,subtitle_y-subtitle_size*2,2890,3037)
SUBTITLE_FX("        さき      あす      しん",subtitle_x,subtitle_y,3043,3276,true)
SUBTITLE_FX("その先の明日を信じて",subtitle_x,subtitle_y,3043,3276)

### pass clip: ryza_no_atelier_3_op_mute,ryza_no_atelier_3_op_t00

### prefetch: 5,2

### ###

SUBTITLE_FX("たび だ     なか ま           うつ             けしき     なか",subtitle_x,subtitle_y-subtitle_size*2,3785,4092,true)
SUBTITLE_FX("旅立つ仲間たち 移りゆく景色の中で",subtitle_x,subtitle_y-subtitle_size*2,3785,4092)
SUBTITLE_FX("すこ              ひまわり        そら     む              め  ぶ",subtitle_x,subtitle_y,4091,4404,true)
SUBTITLE_FX("少しずつ向日葵が 空に向かって芽吹いていく",subtitle_x,subtitle_y,4091,4404)
SUBTITLE_FX("はな    ばな                                  わけ",subtitle_x,subtitle_y-subtitle_size*2,4402,4698,true)
SUBTITLE_FX("離れ離れでも さよならの訳じゃなくて",subtitle_x,subtitle_y-subtitle_size*2,4402,4698)
SUBTITLE_FX("おな                 み           おな                まも      かな            ねが",subtitle_x,subtitle_y,4711,5026,true)
SUBTITLE_FX("同じものを見てる 同じものを守る 叶えたい願い",subtitle_x,subtitle_y,4711,5026)

SUBTITLE_FX("まぶ             め     ほそ        ゆめ             ば しょ",subtitle_x,subtitle_y-subtitle_size*2,5029,5178,true)
SUBTITLE_FX("眩しさに目を細めた夢のあの場所に",subtitle_x,subtitle_y-subtitle_size*2,5029,5178)
SUBTITLE_FX("                           あこが    だ",subtitle_x,subtitle_y,5175,5251,true)
SUBTITLE_FX("まばゆいほどの憧れ抱き",subtitle_x,subtitle_y,5175,5251)
SUBTITLE_FX(" て      の           あさつゆ    なか    いっ ぽ   ふ      だ",subtitle_x,subtitle_y-subtitle_size*2,5254,5460,true)
SUBTITLE_FX("手を伸ばし 朝露の中を一歩 踏み出して",subtitle_x,subtitle_y-subtitle_size*2,5254,5460)

SUBTITLE_FX("        なつ    かく     が       すこ               おとな             ぼく",subtitle_x,subtitle_y,5461,5643,true)
SUBTITLE_FX("あの夏の隠れ家は 少しずつ 大人になる僕たちを",subtitle_x,subtitle_y,5461,5643)
SUBTITLE_FX("        やさ         だ                                   むか",subtitle_x,subtitle_y-subtitle_size*2,5640,5794,true)
SUBTITLE_FX("ただ優しく抱きしめ おかえりと迎え入れていく",subtitle_x,subtitle_y-subtitle_size*2,5640,5794)
SUBTITLE_FX("                    はし     だ       こた                 み",subtitle_x,subtitle_y,5793,5984,true)
SUBTITLE_FX("そしてまた走り出す 答えはまだ見つからないけれど",subtitle_x,subtitle_y,5793,5984)
SUBTITLE_FX("                    ねが      わす",subtitle_x,subtitle_y-subtitle_size*2,5985,6133,true)
SUBTITLE_FX("どうかその願い 忘れないで",subtitle_x,subtitle_y-subtitle_size*2,5985,6133)
SUBTITLE_FX("         み      あした     しん",subtitle_x,subtitle_y,6136,6382,true)
SUBTITLE_FX("まだ見ぬ明日を信じて",subtitle_x,subtitle_y,6136,6382)

### pass clip: ryza_no_atelier_3_op_mute,ryza_no_atelier_3_op_t00

### prefetch: 5,2

### ###

SUBTITLE_FX("なん ど          さ                     はな                  いま   つぼみ",subtitle_x,subtitle_y-subtitle_size*2,6884,7108,true)
SUBTITLE_FX("何度でも咲きほころぶ花のように 今は蕾のままでも",subtitle_x,subtitle_y-subtitle_size*2,6884,7108)
SUBTITLE_FX("                      めぐ",subtitle_x,subtitle_y,7109,7253,true)
SUBTITLE_FX("めくるめく 巡りあう",subtitle_x,subtitle_y,7109,7253)
SUBTITLE_FX("たど     つ       とき      なか",subtitle_x,subtitle_y-subtitle_size*2,7264,7442,true)
SUBTITLE_FX("辿り着く時間の中",subtitle_x,subtitle_y-subtitle_size*2,7264,7442)

SUBTITLE_FX("ぼく            かく     が                             もり     こ  も      び     なか",subtitle_x,subtitle_y,7473,7652,true)
SUBTITLE_FX("僕たちの隠れ家は いつまでも 森の木漏れ日の中で",subtitle_x,subtitle_y,7473,7652)
SUBTITLE_FX("                        やさ                           か",subtitle_x,subtitle_y-subtitle_size*2,7649,7807,true)
SUBTITLE_FX("あたたかさと優しさ なんにも変わらないまま",subtitle_x,subtitle_y-subtitle_size*2,7649,7807)
SUBTITLE_FX(" と                   くや              なが     お          きのう      き せき",subtitle_x,subtitle_y,7805,7993,true)
SUBTITLE_FX("飛べなくて 悔しくて 流れ落ちた昨日の軌跡は",subtitle_x,subtitle_y,7805,7993)
SUBTITLE_FX(" て      い         かぎ     す        なみだ",subtitle_x,subtitle_y-subtitle_size*2,7994,8147,true)
SUBTITLE_FX("手に入れた鍵と捨てた涙",subtitle_x,subtitle_y-subtitle_size*2,7994,8147)
SUBTITLE_FX("                     き  も                                   にじいろ    なつ",subtitle_x,subtitle_y,8149,8516,true)
SUBTITLE_FX("もどかしい気持ちはもういらない 虹色の夏がはじまる",subtitle_x,subtitle_y,8149,8516)



function EXTEND_ONE_FRAME(clip clip){
	return clip+BlankClip(clip,length=1,color=color_black)
}

function UNDO_EXTEND_ONE_FRAME(clip clip){
	return Trim(clip,0,-Framecount(clip)+1)
}

ryza_no_atelier_3_op_t00_length=Framecount(ryza_no_atelier_3_op_t00)
ryza_no_atelier_3_op_t00=EXTEND_ONE_FRAME(ryza_no_atelier_3_op_t00)
ryza_no_atelier_3_op_t00=SUBTITLE_FX(ryza_no_atelier_3_op_t00,"Dazzling days, forevermore.",subtitle_x,subtitle_y-subtitle_size,ryza_no_atelier_3_op_t00_length+9,ryza_no_atelier_3_op_t00_length+142)
ryza_no_atelier_3_op_t00=UNDO_EXTEND_ONE_FRAME(ryza_no_atelier_3_op_t00)

######## Thumbnail ########

is_thumbnail=false

is_thumbnail?ConvertToRGB32(ryza_no_atelier_3_op_mute,matrix="Rec709"):last

######## Music ########

bgm_48khz=SSRC(WAVSource("src\ryza_no_atelier_3-ost-cd01-01.wav"),48000)
AudioDub(bgm_48khz)



thumbnail=Trim(8438+25,-30*5)



AUDIO_DUB_TONE(ConvertToRGB32(ryza_no_atelier_3_op_t00,matrix="Rec709"),samplerate=48000,channels=2,type="Silence")++last



is_thumbnail?thumbnail:last

""")

######## Post Processing ########

#ConvertToRGB24()
#ConvertBackToYUY2(matrix="Rec709")
CONVERT_BACK_TO_YV12(matrix="Rec709")

#ConvertAudioTo8bit()
#ConvertAudioTo16bit()
ConvertAudioTo24bit()
#ConvertAudioTo32bit()
#ConvertAudioToFloat()

TCPServer()
