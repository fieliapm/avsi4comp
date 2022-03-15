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

function RYZA_NO_ATELIER_2_OP_MP4_REF_SOURCE(){
	ryza_no_atelier_2_op_mp4_ref=SSRC(FFmpegSource2("src\official\movie\movie\『ライザのアトリエ２』アバンタイトルムービー.720p.mp4",atrack=-1,fpsnum=30000,fpsden=1001,threads=1),48000)
	return ryza_no_atelier_2_op_mp4_ref
}

function RYZA_NO_ATELIER_2_OP_MP4_SOURCE(){
	ryza_no_atelier_2_op_mp4_video=FFVideoSource("src\official\movie\movie\『ライザのアトリエ２』アバンタイトルムービー.DASH-1080p.mp4",fpsnum=30000,fpsden=1001,threads=1,seekmode=-1)
	ryza_no_atelier_2_op_mp4_audio=SSRC(FFAudioSource("src\official\movie\movie\『ライザのアトリエ２』アバンタイトルムービー.DASH-128k.m4a"),48000)
	ryza_no_atelier_2_op_mp4=AudioDub(ryza_no_atelier_2_op_mp4_video,ryza_no_atelier_2_op_mp4_audio)
	return ryza_no_atelier_2_op_mp4
}

#ryza_no_atelier_2_op=RYZA_NO_ATELIER_2_OP_MP4_REF_SOURCE()
#ryza_no_atelier_2_op_cache02=ryza_no_atelier_2_op

ryza_no_atelier_2_op=RYZA_NO_ATELIER_2_OP_MP4_SOURCE()
ryza_no_atelier_2_op_cache02=RYZA_NO_ATELIER_2_OP_MP4_SOURCE()



function RYZA_NO_ATELIER_2_PROMOTION_MOVIE_MP4_REF_SOURCE(){
	ryza_no_atelier_promotion_movie_mp4_ref=SSRC(FFmpegSource2("src\official\movie\movie\『ライザのアトリエ２』 プロモーションムービー.720p.mp4",atrack=-1,fpsnum=30000,fpsden=1001,threads=1),48000)
	return ryza_no_atelier_promotion_movie_mp4_ref
}

function RYZA_NO_ATELIER_2_PROMOTION_MOVIE_MP4_SOURCE(){
	ryza_no_atelier_2_promotion_movie_mp4_video=FFVideoSource("src\official\movie\movie\『ライザのアトリエ２』 プロモーションムービー.DASH-1080p.mp4",fpsnum=30000,fpsden=1001,threads=1,seekmode=-1)
	ryza_no_atelier_2_promotion_movie_mp4_audio=SSRC(FFAudioSource("src\official\movie\movie\『ライザのアトリエ２』 プロモーションムービー.DASH-128k.m4a"),48000)
	ryza_no_atelier_2_promotion_movie_mp4=AudioDub(ryza_no_atelier_2_promotion_movie_mp4_video,ryza_no_atelier_2_promotion_movie_mp4_audio)
	return ryza_no_atelier_2_promotion_movie_mp4
}

ryza_no_atelier_2_promotion_movie=RYZA_NO_ATELIER_2_PROMOTION_MOVIE_MP4_REF_SOURCE()
ryza_no_atelier_2_promotion_movie_cache02=ryza_no_atelier_2_promotion_movie
ryza_no_atelier_2_promotion_movie_cache03=ryza_no_atelier_2_promotion_movie
ryza_no_atelier_2_promotion_movie_cache04=ryza_no_atelier_2_promotion_movie

ryza_no_atelier_2_promotion_movie=RYZA_NO_ATELIER_2_PROMOTION_MOVIE_MP4_SOURCE()
ryza_no_atelier_2_promotion_movie_cache02=RYZA_NO_ATELIER_2_PROMOTION_MOVIE_MP4_SOURCE()
ryza_no_atelier_2_promotion_movie_cache03=RYZA_NO_ATELIER_2_PROMOTION_MOVIE_MP4_SOURCE()
ryza_no_atelier_2_promotion_movie_cache04=RYZA_NO_ATELIER_2_PROMOTION_MOVIE_MP4_SOURCE()



function RYZA_NO_ATELIER_2_SPECIAL_MOVIE_MP4_REF_SOURCE(){
	ryza_no_atelier_promotion_movie_mp4_ref=SSRC(FFmpegSource2("src\official\movie\movie\『ライザのアトリエ2』 スペシャルムービー.720p.mp4",atrack=-1,fpsnum=30000,fpsden=1001,threads=1),48000)
	return ryza_no_atelier_promotion_movie_mp4_ref
}

function RYZA_NO_ATELIER_2_SPECIAL_MOVIE_MP4_SOURCE(){
	ryza_no_atelier_2_special_movie_mp4_video=FFVideoSource("src\official\movie\movie\『ライザのアトリエ2』 スペシャルムービー.DASH-1080p.mp4",fpsnum=30000,fpsden=1001,threads=1,seekmode=-1)
	ryza_no_atelier_2_special_movie_mp4_audio=SSRC(FFAudioSource("src\official\movie\movie\『ライザのアトリエ2』 スペシャルムービー.DASH-128k.m4a"),48000)
	ryza_no_atelier_2_special_movie_mp4=AudioDub(ryza_no_atelier_2_special_movie_mp4_video,ryza_no_atelier_2_special_movie_mp4_audio)
	return ryza_no_atelier_2_special_movie_mp4
}

#ryza_no_atelier_2_special_movie=RYZA_NO_ATELIER_2_SPECIAL_MOVIE_MP4_REF_SOURCE()
#ryza_no_atelier_2_special_movie_cache02=ryza_no_atelier_2_special_movie

ryza_no_atelier_2_special_movie=RYZA_NO_ATELIER_2_SPECIAL_MOVIE_MP4_SOURCE()
ryza_no_atelier_2_special_movie_cache02=RYZA_NO_ATELIER_2_SPECIAL_MOVIE_MP4_SOURCE()

######## Trim ########

ryza_no_atelier_2_op_01_cache02=Trim(ryza_no_atelier_2_op_cache02,0,599)
ryza_no_atelier_2_op_01=Trim(ryza_no_atelier_2_op,0,599)
ryza_no_atelier_2_op_02=Trim(ryza_no_atelier_2_op,600,1402)
ryza_no_atelier_2_op_03=Trim(ryza_no_atelier_2_op,1403,2122)
ryza_no_atelier_2_op_04_01=Trim(ryza_no_atelier_2_op,2123,2276)
ryza_no_atelier_2_op_04_02=Trim(ryza_no_atelier_2_op,2277,2967)
ryza_no_atelier_2_op_05=Trim(ryza_no_atelier_2_op,2968,3131)
ryza_no_atelier_2_op_06=Trim(ryza_no_atelier_2_op,3132,3921)
ryza_no_atelier_2_op_post=Trim(ryza_no_atelier_2_op,3922,0)

ryza_no_atelier_2_promotion_movie_01=Trim(ryza_no_atelier_2_promotion_movie,0,499) #500 op
ryza_no_atelier_2_promotion_movie_02_title=Trim(ryza_no_atelier_2_promotion_movie,500,600)
ryza_no_atelier_2_promotion_movie_03=Trim(ryza_no_atelier_2_promotion_movie_cache02,601,1029) #429 op
ryza_no_atelier_2_promotion_movie_04_light=Trim(ryza_no_atelier_2_promotion_movie,1030,1103) #74 op
ryza_no_atelier_2_promotion_movie_05_01_cache02=Trim(ryza_no_atelier_2_promotion_movie_cache04,1104,1131) #28 op
ryza_no_atelier_2_promotion_movie_05_01=Trim(ryza_no_atelier_2_promotion_movie_cache03,1104,1131) #28 op
ryza_no_atelier_2_promotion_movie_05_02=Trim(ryza_no_atelier_2_promotion_movie_cache03,1132,1143) #12 op
ryza_no_atelier_2_promotion_movie_06_slogan=Trim(ryza_no_atelier_2_promotion_movie,1146,1963) #818 op
ryza_no_atelier_2_promotion_movie_07_op=Trim(ryza_no_atelier_2_promotion_movie,1964,2652) #689 op
ryza_no_atelier_2_promotion_movie_08_op=Trim(ryza_no_atelier_2_promotion_movie,2653,2885) #233 op
ryza_no_atelier_2_promotion_movie_09_op=Trim(ryza_no_atelier_2_promotion_movie,2886,3279) #394 op
ryza_no_atelier_2_promotion_movie_10_title=Trim(ryza_no_atelier_2_promotion_movie_cache02,3280,3565) #286 op
ryza_no_atelier_2_promotion_movie_11=Trim(ryza_no_atelier_2_promotion_movie_cache02,3566,4000) #435 op
#ryza_no_atelier_2_promotion_movie_post=Trim(ryza_no_atelier_2_promotion_movie,4001,0)

ryza_no_atelier_2_special_movie_01=Trim(ryza_no_atelier_2_special_movie,0,623) #624 op
ryza_no_atelier_2_special_movie_02=Trim(ryza_no_atelier_2_special_movie,624,1834) #1211 op
ryza_no_atelier_2_special_movie_03_title=Trim(ryza_no_atelier_2_special_movie,1835,2145)
ryza_no_atelier_2_special_movie_04=Trim(ryza_no_atelier_2_special_movie_cache02,2146,2376) #231 op
#ryza_no_atelier_2_special_movie_post=Trim(ryza_no_atelier_2_special_movie,2377,0)

######## Pre Combine ########

fade_length=15

#ryza_no_atelier_teaser_trailer_02_01_faded=CONVERT_BACK_TO_YV12(FADE_OUT_WITH_BRIGHTNESS_OFFSET(ConvertToRGB24(TRIM_FIRST_CLIP(ryza_no_atelier_teaser_trailer_02_01,239),matrix="Rec709"),fade_length,false),matrix="Rec709")

######## Combine ########

# ryza_no_atelier_2_op_01 -65
# ryza_no_atelier_2_op_02 535/(3468)
# ryza_no_atelier_2_op_03 1338/(4260)
# ryza_no_atelier_2_op_04_01 2058
# ryza_no_atelier_2_op_04_02 2212/5050/7063
# ryza_no_atelier_2_op_05 2903/5741/8253
# ryza_no_atelier_2_op_05 3067/8808

# ryza_no_atelier_2_promotion_movie_07_op 5059



op_music_start=65

ryza_no_atelier_2_op_t00=Trim(ryza_no_atelier_2_op_01_cache02,0,op_music_start-1)
ryza_no_atelier_2_op_t01=Trim(ryza_no_atelier_2_op_01,op_music_start,0)
ryza_no_atelier_2_op_t02=ryza_no_atelier_2_op_02
ryza_no_atelier_2_op_t03=ryza_no_atelier_2_op_03
ryza_no_atelier_2_op_t04=ryza_no_atelier_2_op_04_01+ryza_no_atelier_2_op_04_02
ryza_no_atelier_2_op_t05=FADE_OUT_WITH_BRIGHTNESS_OFFSET(TRIM_FIRST_CLIP(ryza_no_atelier_2_promotion_movie_03+ryza_no_atelier_2_promotion_movie_10_title,565),fade_length)

ryza_no_atelier_2_op_t06=TRIM_LAST_CLIP(ryza_no_atelier_2_promotion_movie_01+ryza_no_atelier_2_promotion_movie_04_light+ryza_no_atelier_2_special_movie_04,792)
ryza_no_atelier_2_op_t07=TRIM_LAST_CLIP(ryza_no_atelier_2_promotion_movie_06_slogan,790+9)
ryza_no_atelier_2_op_t08=TRIM_FIRST_CLIP(ryza_no_atelier_2_promotion_movie_07_op+ryza_no_atelier_2_promotion_movie_08_op,691-9+214)
ryza_no_atelier_2_op_t09=TRIM_LAST_CLIP(ryza_no_atelier_2_promotion_movie_05_01_cache02+ryza_no_atelier_2_promotion_movie_05_01+ryza_no_atelier_2_promotion_movie_05_02+ryza_no_atelier_2_special_movie_01,685)+TRIM_FIRST_CLIP(ryza_no_atelier_2_promotion_movie_11,423)
ryza_no_atelier_2_op_t10=TRIM_FIRST_CLIP(ryza_no_atelier_2_special_movie_02,1190)+ryza_no_atelier_2_op_05
ryza_no_atelier_2_op_t11=TRIM_FIRST_CLIP(ryza_no_atelier_2_promotion_movie_09_op,391)+ryza_no_atelier_2_op_06+BlankClip(ryza_no_atelier_2_op,length=30*2,color=color_black)

ryza_no_atelier_2_op_mute=ryza_no_atelier_2_op_t01+ryza_no_atelier_2_op_t02+ryza_no_atelier_2_op_t03+ryza_no_atelier_2_op_t04+ryza_no_atelier_2_op_t05 \
	+ryza_no_atelier_2_op_t06+ryza_no_atelier_2_op_t07+ryza_no_atelier_2_op_t08+ryza_no_atelier_2_op_t09+ryza_no_atelier_2_op_t10+ryza_no_atelier_2_op_t11

ryza_no_atelier_2_op_mute

### export clip: ryza_no_atelier_2_op_mute,ryza_no_atelier_2_op_t00

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
global subtitle_outside_halo_color=color_crimson

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

ConvertToRGB32(matrix="Rec709")



SUBTITLE_FX("Somewhen, Somewhere…//Clammbon(クラムボン)|- by fielia@AVISynth",-subtitle_x,subtitle_y-subtitle_size,8859,9152,is_title=true)

SUBTITLE_FX("たか                 た     なつぐも    よう        むね    たか        おさ",subtitle_x,subtitle_y-subtitle_size*2,536,871,true)
SUBTITLE_FX("高くそびえ立つ夏雲の様に　胸の高まり抑えきれずに",subtitle_x,subtitle_y-subtitle_size*2,536,871)
SUBTITLE_FX(" わたし  みちび   あら         せ かい                 せ なか     お             かん",subtitle_x,subtitle_y,932,1270,true)
SUBTITLE_FX(" 私を導く新たな世界がほら　背中を押すのを感じた",subtitle_x,subtitle_y,932,1270)

SUBTITLE_FX("かな                                ゆめ       あきら                            ひ  び",subtitle_x,subtitle_y-subtitle_size*2,1330,1671,true)
SUBTITLE_FX("叶いそうもなかった夢や　諦めそうになった日々を",subtitle_x,subtitle_y-subtitle_size*2,1330,1671)
SUBTITLE_FX(" か          ゆ             しん                         ひ      こ どう     て  ぐ      よ",subtitle_x,subtitle_y,1727,2090,true)
SUBTITLE_FX("変えて行けると信じてた　あの日の鼓動　手繰り寄せて",subtitle_x,subtitle_y,1727,2090)

SUBTITLE_FX("                    きら                     て     あふ",subtitle_x,subtitle_y-subtitle_size*2,2203,2443,true)
SUBTITLE_FX("いくつもの煌めき　この手に溢れそうなくらい",subtitle_x,subtitle_y-subtitle_size*2,2203,2443)
SUBTITLE_FX("ぬく                             き",subtitle_x,subtitle_y,2449,2591,true)
SUBTITLE_FX("温もりはここに　消えない",subtitle_x,subtitle_y,2449,2591)
SUBTITLE_FX("                                                 え がお     で  あ",subtitle_x,subtitle_y-subtitle_size*2,2595,2862,true)
SUBTITLE_FX("いつかみたいにまた　その笑顔に出逢えたなら",subtitle_x,subtitle_y-subtitle_size*2,2595,2862)
SUBTITLE_FX("     お                                     はじ                             ま",subtitle_x,subtitle_y,2889,3150,true)
SUBTITLE_FX("「終わり」じゃない　「始まり」がきっと待っている",subtitle_x,subtitle_y,2889,3150)

SUBTITLE_FX("かざ む          か             かげ     の",subtitle_x,subtitle_y,3470,3641,true)
SUBTITLE_FX("風向きが変わる　影が伸びてゆく",subtitle_x,subtitle_y,3470,3641)
SUBTITLE_FX("                             い                     こえ",subtitle_x,subtitle_y-subtitle_size*2,3665,3802,true)
SUBTITLE_FX("「もうそろそろ行こう」って声がする",subtitle_x,subtitle_y-subtitle_size*2,3665,3802)
SUBTITLE_FX(" きのう          み          きょう    わたし",subtitle_x,subtitle_y,3862,4014,true)
SUBTITLE_FX("昨日まで見てた今日の私が",subtitle_x,subtitle_y,3862,4014)
SUBTITLE_FX("  あす       せ かい                     み",subtitle_x,subtitle_y-subtitle_size*2,4009,4200,true)
SUBTITLE_FX("明日の世界をちゃんと見つめてる",subtitle_x,subtitle_y-subtitle_size*2,4009,4200)

SUBTITLE_FX("        ころ         な                             いま                だい じ",subtitle_x,subtitle_y,4253,4592,true)
SUBTITLE_FX("あの頃には無かったことも　今はどれも大事なこと",subtitle_x,subtitle_y,4253,4592)
SUBTITLE_FX("                                                    ||             ば しょ        もど",subtitle_x,subtitle_y-subtitle_size*3,4643,4976,true)
SUBTITLE_FX("つまづきそうになったらまた||　この場所まで戻ってもいい",subtitle_x,subtitle_y-subtitle_size*4,4643,4976)

### pass clip: ryza_no_atelier_2_op_mute,ryza_no_atelier_2_op_t00

### prefetch: 5,2

### ###

SUBTITLE_FX("                    きら             だ                          て     そら",subtitle_x,subtitle_y,5042,5281,true)
SUBTITLE_FX("いくつもの煌めき　抱きしめたこの手を空に",subtitle_x,subtitle_y,5042,5281)
SUBTITLE_FX("ぬく                             き",subtitle_x,subtitle_y-subtitle_size*2,5286,5427,true)
SUBTITLE_FX("温もりはいつも　消えない",subtitle_x,subtitle_y-subtitle_size*2,5286,5427)
SUBTITLE_FX("                     ど  こ             きみ     あ          ひ      く",subtitle_x,subtitle_y,5432,5697,true)
SUBTITLE_FX("いつかまた何処かで　君に逢える日が来るまで",subtitle_x,subtitle_y,5432,5697)
SUBTITLE_FX("     お                                     はじ                つむ",subtitle_x,subtitle_y-subtitle_size*2,5727,5941,true)
SUBTITLE_FX("「終わり」じゃなく　「始まり」を紡いでく",subtitle_x,subtitle_y-subtitle_size*2,5727,5941)

SUBTITLE_FX("                 と                     おも     だ",subtitle_x,subtitle_y,5946,6164,true)
SUBTITLE_FX("まぶたを閉じればすぐ思い出す",subtitle_x,subtitle_y,5946,6164)
SUBTITLE_FX("なに",subtitle_x,subtitle_y-subtitle_size*2,6167,6358,true)
SUBTITLE_FX("何よりもかけがえのないストーリー",subtitle_x,subtitle_y-subtitle_size*2,6167,6358)
SUBTITLE_FX("わす",subtitle_x,subtitle_y,6363,6660,true)
SUBTITLE_FX("忘れはしない　ねえいつだって　そばにいるよ",subtitle_x,subtitle_y,6363,6660)

SUBTITLE_FX("                    きら                     て     あふ",subtitle_x,subtitle_y-subtitle_size*2,7054,7294,true)
SUBTITLE_FX("いくつもの煌めき　この手に溢れそうなくらい",subtitle_x,subtitle_y-subtitle_size*2,7054,7294)
SUBTITLE_FX("ぬく                             け",subtitle_x,subtitle_y,7303,7445,true)
SUBTITLE_FX("温もりはここに　消さない",subtitle_x,subtitle_y,7303,7445)
SUBTITLE_FX("                                                 え がお     で  あ",subtitle_x,subtitle_y-subtitle_size*2,7451,7738,true)
SUBTITLE_FX("いつかみたいにまた　その笑顔に出逢えたなら",subtitle_x,subtitle_y-subtitle_size*2,7451,7738)
SUBTITLE_FX("     お                                     はじ                 か",subtitle_x,subtitle_y,7749,7934,true)
SUBTITLE_FX("「終わり」じゃない　「始まり」に替える",subtitle_x,subtitle_y,7749,7934)

SUBTITLE_FX("                     ど  こ             きみ     あ          ひ      く",subtitle_x,subtitle_y-subtitle_size*2,7946,8210,true)
SUBTITLE_FX("いつかまた何処かで　君に逢える日が来るまで",subtitle_x,subtitle_y-subtitle_size*2,7946,8210)
SUBTITLE_FX("     お                                     はじ                            かさ",subtitle_x,subtitle_y,8240,8504,true)
SUBTITLE_FX("「終わり」じゃなく　「始まり」をずっと重ねてく",subtitle_x,subtitle_y,8240,8504)

######## Thumbnail ########

is_thumbnail=false

is_thumbnail?ConvertToRGB32(ryza_no_atelier_2_op_mute,matrix="Rec709"):last

######## Music ########

bgm_48khz=SSRC(WAVSource("src\ryza_no_atelier_2-ost-cd01-01.wav"),48000)
Normalize(AudioDub(bgm_48khz))



#thumbnail=Trim(1502,-30*5)
thumbnail=Trim(8253,-30*5)



AUDIO_DUB_TONE(ConvertToRGB32(ryza_no_atelier_2_op_t00,matrix="Rec709"),samplerate=48000,channels=2,type="Silence")++last



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
