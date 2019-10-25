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

function SUBTITLE_RIPPLE(clip clip,string text,int x,int y,int start_frame,int num_frames,int size){
	ripple_speed=7.0
	ripple_start_amp=16

	text_half_width=StrLen(text)*size/4
	xcoord=x<0?subtitle_clip_width+x-text_half_width:x+text_half_width
	ycoord=y<0?subtitle_clip_height+y-(size/2):y+(size/2)
	xcoord=Round(xcoord*Width(clip)/subtitle_clip_width)
	ycoord=Round(ycoord*Height(clip)/subtitle_clip_height)

	return EffectRipples2(clip,start_frame,start_frame+num_frames,speed=ripple_speed,xcoord=xcoord,ycoord=ycoord,amp=ripple_start_amp,eamp=1)
}

### inherit end ###

######## Game (1920*1080) ########

function RYZA_NO_ATELIER_OP_MP4_REF_SOURCE(){
	ryza_no_atelier_op_mp4_ref=SSRC(FFmpegSource2("src\official\gallery\movie\主題歌は神田沙也加さん！『ライザのアトリエ』アバンタイトルムービー.360p.mp4",atrack=-1,fpsnum=30000,fpsden=1001,threads=1),48000)
	return Lanczos4Resize(ryza_no_atelier_op_mp4_ref,1280,720)
}

function RYZA_NO_ATELIER_OP_MP4_SOURCE(){
	ryza_no_atelier_op_mp4_video=FFVideoSource("src\official\gallery\movie\主題歌は神田沙也加さん！『ライザのアトリエ』アバンタイトルムービー.DASH-1080p.mp4",fpsnum=30000,fpsden=1001,threads=1,seekmode=-1)
	ryza_no_atelier_op_mp4_audio=SSRC(FFAudioSource("src\official\gallery\movie\主題歌は神田沙也加さん！『ライザのアトリエ』アバンタイトルムービー.DASH-128k.m4a"),48000)
	ryza_no_atelier_op_mp4=AudioDub(ryza_no_atelier_op_mp4_video,ryza_no_atelier_op_mp4_audio)
	return ryza_no_atelier_op_mp4
}

#ryza_no_atelier_op=RYZA_NO_ATELIER_OP_MP4_REF_SOURCE()
ryza_no_atelier_op=RYZA_NO_ATELIER_OP_MP4_SOURCE()



function RYZA_NO_ATELIER_TGS_STORY_TRAILER_MP4_REF_SOURCE(){
	ryza_no_atelier_tgs_story_trailer_mp4_ref=SSRC(FFmpegSource2("src\official\gallery\movie\『ライザのアトリエ』TGSストーリートレーラー.720p.mp4",atrack=-1,fpsnum=30000,fpsden=1001,threads=1),48000)
	return ryza_no_atelier_tgs_story_trailer_mp4_ref
}

function RYZA_NO_ATELIER_TGS_STORY_TRAILER_MP4_SOURCE(){
	ryza_no_atelier_tgs_story_trailer_mp4_video=FFVideoSource("src\official\gallery\movie\『ライザのアトリエ』TGSストーリートレーラー.DASH-1080p.mp4",fpsnum=30000,fpsden=1001,threads=1,seekmode=-1)
	ryza_no_atelier_tgs_story_trailer_mp4_audio=SSRC(FFAudioSource("src\official\gallery\movie\『ライザのアトリエ』TGSストーリートレーラー.DASH-128k.m4a"),48000)
	ryza_no_atelier_tgs_story_trailer_mp4=AudioDub(ryza_no_atelier_tgs_story_trailer_mp4_video,ryza_no_atelier_tgs_story_trailer_mp4_audio)
	return ryza_no_atelier_tgs_story_trailer_mp4
}

#ryza_no_atelier_tgs_story_trailer=RYZA_NO_ATELIER_TGS_STORY_TRAILER_MP4_REF_SOURCE()
#ryza_no_atelier_tgs_story_trailer_cache02=RYZA_NO_ATELIER_TGS_STORY_TRAILER_MP4_REF_SOURCE()
#ryza_no_atelier_tgs_story_trailer_cache03=ryza_no_atelier_tgs_story_trailer
#ryza_no_atelier_tgs_story_trailer_cache04=ryza_no_atelier_tgs_story_trailer
#ryza_no_atelier_tgs_story_trailer_cache05=ryza_no_atelier_tgs_story_trailer

ryza_no_atelier_tgs_story_trailer=RYZA_NO_ATELIER_TGS_STORY_TRAILER_MP4_SOURCE()
ryza_no_atelier_tgs_story_trailer_cache02=RYZA_NO_ATELIER_TGS_STORY_TRAILER_MP4_SOURCE()
ryza_no_atelier_tgs_story_trailer_cache03=RYZA_NO_ATELIER_TGS_STORY_TRAILER_MP4_SOURCE()
ryza_no_atelier_tgs_story_trailer_cache04=RYZA_NO_ATELIER_TGS_STORY_TRAILER_MP4_SOURCE()
ryza_no_atelier_tgs_story_trailer_cache05=RYZA_NO_ATELIER_TGS_STORY_TRAILER_MP4_SOURCE()



function RYZA_NO_ATELIER_PROMOTION_MOVIE_MP4_REF_SOURCE(){
	ryza_no_atelier_promotion_movie_mp4_ref=SSRC(FFmpegSource2("src\official\gallery\movie\『ライザのアトリエ』プロモーションムービー.720p.mp4",atrack=-1,fpsnum=30000,fpsden=1001,threads=1),48000)
	return ryza_no_atelier_promotion_movie_mp4_ref
}

function RYZA_NO_ATELIER_PROMOTION_MOVIE_MP4_SOURCE(){
	ryza_no_atelier_promotion_movie_mp4_video=FFVideoSource("src\official\gallery\movie\『ライザのアトリエ』プロモーションムービー.DASH-1080p.mp4",fpsnum=30000,fpsden=1001,threads=1,seekmode=-1)
	ryza_no_atelier_promotion_movie_mp4_audio=SSRC(FFAudioSource("src\official\gallery\movie\『ライザのアトリエ』プロモーションムービー.DASH-128k.m4a"),48000)
	ryza_no_atelier_promotion_movie_mp4=AudioDub(ryza_no_atelier_promotion_movie_mp4_video,ryza_no_atelier_promotion_movie_mp4_audio)
	return ryza_no_atelier_promotion_movie_mp4
}

#ryza_no_atelier_promotion_movie=RYZA_NO_ATELIER_PROMOTION_MOVIE_MP4_REF_SOURCE()
ryza_no_atelier_promotion_movie=RYZA_NO_ATELIER_PROMOTION_MOVIE_MP4_SOURCE()



function RYZA_NO_ATELIER_TEASER_TRAILER_MP4_REF_SOURCE(){
	ryza_no_atelier_teaser_trailer_mp4_ref=SSRC(FFmpegSource2("src\official\gallery\movie\Gust New Project：ティザートレーラー.720p.mp4",atrack=-1,fpsnum=30000,fpsden=1001,threads=1),48000)
	return ryza_no_atelier_teaser_trailer_mp4_ref
}

function RYZA_NO_ATELIER_TEASER_TRAILER_MP4_SOURCE(){
	ryza_no_atelier_teaser_trailer_mp4_video=FFVideoSource("src\official\gallery\movie\Gust New Project：ティザートレーラー.DASH-1080p.mp4",fpsnum=30000,fpsden=1001,threads=1,seekmode=-1)
	ryza_no_atelier_teaser_trailer_mp4_audio=SSRC(FFAudioSource("src\official\gallery\movie\Gust New Project：ティザートレーラー.DASH-128k.m4a"),48000)
	ryza_no_atelier_teaser_trailer_mp4=AudioDub(ryza_no_atelier_teaser_trailer_mp4_video,ryza_no_atelier_teaser_trailer_mp4_audio)
	return ryza_no_atelier_teaser_trailer_mp4
}

#ryza_no_atelier_teaser_trailer=RYZA_NO_ATELIER_TEASER_TRAILER_MP4_REF_SOURCE()
ryza_no_atelier_teaser_trailer=RYZA_NO_ATELIER_TEASER_TRAILER_MP4_SOURCE()

######## Trim ########

ryza_no_atelier_op_01=Trim(ryza_no_atelier_op,0,1975)
ryza_no_atelier_op_02=Trim(ryza_no_atelier_op,1976,2452)
ryza_no_atelier_op_03=Trim(ryza_no_atelier_op,2453,3135)
ryza_no_atelier_op_post=Trim(ryza_no_atelier_op,3136,0)

ryza_no_atelier_tgs_story_trailer_01_prologue=Trim(ryza_no_atelier_tgs_story_trailer_cache04,0,833) #834 op

#1591
ryza_no_atelier_tgs_story_trailer_02_introduction_01=Trim(ryza_no_atelier_tgs_story_trailer_cache03,834,1339) #506 op
ryza_no_atelier_tgs_story_trailer_02_introduction_02=Trim(ryza_no_atelier_tgs_story_trailer_cache05,1340,1572) #233
ryza_no_atelier_tgs_story_trailer_02_introduction_03=Trim(ryza_no_atelier_tgs_story_trailer_cache05,1573,1767) #195
ryza_no_atelier_tgs_story_trailer_02_introduction_04=Trim(ryza_no_atelier_tgs_story_trailer_cache03,1768,2034) #267 op
ryza_no_atelier_tgs_story_trailer_02_introduction_05=Trim(ryza_no_atelier_tgs_story_trailer_cache03,2035,2424) #390 op

ryza_no_atelier_tgs_story_trailer_03_discussion=Trim(ryza_no_atelier_tgs_story_trailer,2425,3233) #809
ryza_no_atelier_tgs_story_trailer_03_04_transition=Trim(ryza_no_atelier_tgs_story_trailer,3234,3259) #26 op
ryza_no_atelier_tgs_story_trailer_04_gameplay=Trim(ryza_no_atelier_tgs_story_trailer,3260,3897) #638 op
ryza_no_atelier_tgs_story_trailer_05_title=Trim(ryza_no_atelier_tgs_story_trailer,3898,4571) #674
ryza_no_atelier_tgs_story_trailer_06_slogan=Trim(ryza_no_atelier_tgs_story_trailer_cache02,4572,4964) #393 op
ryza_no_atelier_tgs_story_trailer_post=Trim(ryza_no_atelier_tgs_story_trailer,4965,0)

ryza_no_atelier_promotion_movie_01_begin_journey=Trim(ryza_no_atelier_promotion_movie,0,156) #157
ryza_no_atelier_promotion_movie_02_title=Trim(ryza_no_atelier_promotion_movie,157,276) #120
ryza_no_atelier_promotion_movie_02_03_transition=Trim(ryza_no_atelier_promotion_movie,277,285) #9
ryza_no_atelier_promotion_movie_02_character=Trim(ryza_no_atelier_promotion_movie,286,1008) #723
ryza_no_atelier_promotion_movie_03_staff_and_system=Trim(ryza_no_atelier_promotion_movie,1009,2188) #1180 op
ryza_no_atelier_promotion_movie_04_dark=Trim(ryza_no_atelier_promotion_movie,2189,2635) #447 op
ryza_no_atelier_promotion_movie_05_title=Trim(ryza_no_atelier_promotion_movie,2636,2860) #225
ryza_no_atelier_promotion_movie_post=Trim(ryza_no_atelier_promotion_movie,2861,0)

ryza_no_atelier_teaser_trailer_01=Trim(ryza_no_atelier_teaser_trailer,0,14)
ryza_no_atelier_teaser_trailer_02_01=Trim(ryza_no_atelier_teaser_trailer,15,362) #348 op
ryza_no_atelier_teaser_trailer_02_02=Trim(ryza_no_atelier_teaser_trailer,363,806) #444 op
ryza_no_atelier_teaser_trailer_03=Trim(ryza_no_atelier_teaser_trailer,807,0)

######## Pre Combine ########

fade_length=30

ryza_no_atelier_teaser_trailer_02_01_faded=CONVERT_BACK_TO_YV12(FADE_OUT_WITH_BRIGHTNESS_OFFSET(ConvertToRGB24(TRIM_FIRST_CLIP(ryza_no_atelier_teaser_trailer_02_01,239),matrix="Rec709"),fade_length,false),matrix="Rec709")

######## Combine ########

# ryza_no_atelier_op_01 3
# ryza_no_atelier_op_02 6355
# ryza_no_atelier_op_03 7071

# ryza_no_atelier_tgs_story_trailer_04_gameplay 1984

# ryza_no_atelier_promotion_movie_03_staff_and_system 3957



ryza_no_atelier_op_t01=BlankClip(ryza_no_atelier_op,length=3,color=color_black)+ryza_no_atelier_op_01+TRIM_LAST_CLIP(ryza_no_atelier_tgs_story_trailer_03_04_transition,5)
ryza_no_atelier_op_t02=Dissolve(ryza_no_atelier_tgs_story_trailer_04_gameplay,TRIM_LAST_CLIP(ryza_no_atelier_tgs_story_trailer_06_slogan,fade_length+342),fade_length)
#ryza_no_atelier_op_t02=Dissolve(ryza_no_atelier_tgs_story_trailer_04_gameplay,TRIM_MIDDLE_CLIP(ryza_no_atelier_tgs_story_trailer_02_introduction_02+ryza_no_atelier_tgs_story_trailer_02_introduction_03,fade_length+342),fade_length)
ryza_no_atelier_op_t03=TRIM_LAST_CLIP(ryza_no_atelier_tgs_story_trailer_02_introduction_01,455)+TRIM_LAST_CLIP(ryza_no_atelier_tgs_story_trailer_02_introduction_04+ryza_no_atelier_tgs_story_trailer_02_introduction_05,538)+ryza_no_atelier_promotion_movie_03_staff_and_system
ryza_no_atelier_op_t04=Dissolve(ryza_no_atelier_promotion_movie_04_dark,TRIM_LAST_CLIP(ryza_no_atelier_tgs_story_trailer_01_prologue,fade_length+292+479),fade_length)
ryza_no_atelier_op_t05=ryza_no_atelier_op_02+(false?ryza_no_atelier_teaser_trailer_02_01+ryza_no_atelier_teaser_trailer_02_02:TRIM_FIRST_CLIP(ryza_no_atelier_teaser_trailer_02_01_faded,239)+ryza_no_atelier_op_03)
ryza_no_atelier_op_t06=BlankClip(ryza_no_atelier_op,length=30*3,color=color_black)

ryza_no_atelier_op_mute=ryza_no_atelier_op_t01+ryza_no_atelier_op_t02+ryza_no_atelier_op_t03+ryza_no_atelier_op_t04+ryza_no_atelier_op_t05+ryza_no_atelier_op_t06

ryza_no_atelier_op_mute

### export clip: ryza_no_atelier_op_mute

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
global subtitle_size=33*2.25
global subtitle_text_color=color_white
global subtitle_halo_color=color_black
global subtitle_outside_halo_color=color_dodgerblue

function SUBTITLE_FX(clip clip,string text,float x,float y,int start_frame,int end_frame,bool "is_furigana",bool "is_title"){
	is_title=Default(is_title,false)
	is_furigana=Default(is_furigana,false)

	outside_halo_color=is_title?color_gold:subtitle_outside_halo_color

	subtitle_mode=is_furigana?"ex":"ex" #"ex_thick_reduce_memory"
	size=is_furigana?subtitle_size*0.5:subtitle_size
	y=is_furigana?y-size:y

	return SUBTITLE_FX_FADE_IN_FADE_OUT_DOUBLE_HALO(clip,text,Round(x),Round(y),start_frame,end_frame,subtitle_front_fade_count,subtitle_rear_fade_count,subtitle_font,subtitle_effects,Round(size),subtitle_text_color,subtitle_halo_color,outside_halo_color,subtitle_mode)
}

function SUBTITLE_FX_RIPPLE(clip clip,string text,float x,float y,int start_frame,int end_frame){
	return SUBTITLE_RIPPLE(clip,text,Round(x),Round(y),start_frame-subtitle_front_fade_count,subtitle_front_fade_count*2,Round(subtitle_size))
}

### inherit end ###

ConvertToRGB32(matrix="Rec709")



SUBTITLE_FX_RIPPLE("虹色の夏//神田沙也加",-subtitle_x,subtitle_y-subtitle_size/2,7219,7464)

SUBTITLE_FX_RIPPLE("The sunlight it warmly shines on me.",subtitle_x,subtitle_x,505,625)
SUBTITLE_FX_RIPPLE("We can go everywhere.",subtitle_x,subtitle_y,632,741)
SUBTITLE_FX_RIPPLE("The whole world is so gentle with me.",subtitle_x,subtitle_x,745,860)
SUBTITLE_FX_RIPPLE("Life is good, Life is fun.",subtitle_x,subtitle_y,871,970)

SUBTITLE_FX_RIPPLE("陽射しの向こうに　希望が溢れてる",subtitle_x,subtitle_y-subtitle_size*2,991,1207)
SUBTITLE_FX_RIPPLE("そんな空想を　毎日描いてる",subtitle_x,subtitle_y,1228,1435)
SUBTITLE_FX_RIPPLE("屋根裏の部屋　退屈を憂いた日々から",subtitle_x,subtitle_y-subtitle_size*2,1434,1674)
SUBTITLE_FX_RIPPLE("飛び出せるようにと",subtitle_x,subtitle_y,1675,1795)
SUBTITLE_FX_RIPPLE("未来への地図探してた",subtitle_x,subtitle_y-subtitle_size*2,1793,1968)

SUBTITLE_FX_RIPPLE("雲間を縫って　大空に羽ばたく",subtitle_x,subtitle_y,1975,2208)
SUBTITLE_FX_RIPPLE("果てしない海を越えて　見つけた光",subtitle_x,subtitle_y-subtitle_size*2,2213,2562)

SUBTITLE_FX_RIPPLE("小川のせせらぎ　灯火のゆらめき",subtitle_x,subtitle_y-subtitle_size*2,2970,3192)
SUBTITLE_FX_RIPPLE("大地の轟き　星たちの煌めき",subtitle_x,subtitle_y,3209,3412)
SUBTITLE_FX_RIPPLE("世界の全て　この手で掴めそうな気がして",subtitle_x,subtitle_y-subtitle_size*2,3411,3653)
SUBTITLE_FX_RIPPLE("一歩踏み出したら　思わず涙が零れた",subtitle_x,subtitle_y,3652,3944)

SUBTITLE_FX_RIPPLE("虹色の夏　鮮やかに輝く",subtitle_x,subtitle_y-subtitle_size*2,3948,4186)
SUBTITLE_FX_RIPPLE("痛みも苦しみさえも包み込む",subtitle_x,subtitle_y,4191,4424)
SUBTITLE_FX_RIPPLE("仲間たちの声　胸の奥に響く",subtitle_x,subtitle_y-subtitle_size*2,4428,4668)
SUBTITLE_FX_RIPPLE("曇りのない優しさが　心に触れる",subtitle_x,subtitle_y,4671,4996)

SUBTITLE_FX_RIPPLE("地平線の彼方が　暗い夜の闇に覆われて",subtitle_x,subtitle_y-subtitle_size*2,4999,5384)
SUBTITLE_FX_RIPPLE("何も見えなくて　うつ向きそうになっても",subtitle_x,subtitle_y,5388,5630)
SUBTITLE_FX_RIPPLE("君さえいれば　進んでゆけるから",subtitle_x,subtitle_y-subtitle_size*2,5631,5843)

SUBTITLE_FX_RIPPLE("動き出す針　優しく時を刻む",subtitle_x,subtitle_y,5869,6103)
SUBTITLE_FX_RIPPLE("風のベール纏って走り出す",subtitle_x,subtitle_y-subtitle_size*2,6110,6347)

SUBTITLE_FX_RIPPLE("虹色の夏　鮮やかに輝き",subtitle_x,subtitle_y,6348,6547)
SUBTITLE_FX_RIPPLE("ただひとつだけの夢を目指して",subtitle_x,subtitle_y-subtitle_size*2,6544,6708)
SUBTITLE_FX_RIPPLE("どこまでも飛んでゆく",subtitle_x,subtitle_y,6708,7191)



SUBTITLE_FX("虹色の夏//神田沙也加|- by fielia@AVISynth",-subtitle_x,subtitle_y-subtitle_size,7219,7464,is_title=true)

SUBTITLE_FX("The sunlight it warmly shines on me.",subtitle_x,subtitle_x,505,625)
SUBTITLE_FX("We can go everywhere.",subtitle_x,subtitle_y,632,741)
SUBTITLE_FX("The whole world is so gentle with me.",subtitle_x,subtitle_x,745,860)
SUBTITLE_FX("Life is good, Life is fun.",subtitle_x,subtitle_y,871,970)

SUBTITLE_FX(" ひ  ざ          む                  き ぼう    あふ",subtitle_x,subtitle_y-subtitle_size*2,991,1207,true)
SUBTITLE_FX("陽射しの向こうに　希望が溢れてる",subtitle_x,subtitle_y-subtitle_size*2,991,1207)
SUBTITLE_FX("            くうそう        まいにちえが",subtitle_x,subtitle_y,1228,1435,true)
SUBTITLE_FX("そんな空想を　毎日描いてる",subtitle_x,subtitle_y,1228,1435)
SUBTITLE_FX(" や  ね うら     へ  や     たいくつ    うれ         ひ  び",subtitle_x,subtitle_y-subtitle_size*2,1434,1674,true)
SUBTITLE_FX("屋根裏の部屋　退屈を憂いた日々から",subtitle_x,subtitle_y-subtitle_size*2,1434,1674)
SUBTITLE_FX(" と      だ",subtitle_x,subtitle_y,1675,1795,true)
SUBTITLE_FX("飛び出せるようにと",subtitle_x,subtitle_y,1675,1795)
SUBTITLE_FX(" あした          ち  ず さが",subtitle_x,subtitle_y-subtitle_size*2,1793,1968,true)
SUBTITLE_FX("未来への地図探してた",subtitle_x,subtitle_y-subtitle_size*2,1793,1968)

SUBTITLE_FX("くも ま      ぬ             おおぞら     は",subtitle_x,subtitle_y,1975,2208,true)
SUBTITLE_FX("雲間を縫って　大空に羽ばたく",subtitle_x,subtitle_y,1975,2208)
SUBTITLE_FX(" は                 うみ     こ              み            ひかり",subtitle_x,subtitle_y-subtitle_size*2,2213,2562,true)
SUBTITLE_FX("果てしない海を越えて　見つけた光",subtitle_x,subtitle_y-subtitle_size*2,2213,2562)

SUBTITLE_FX(" お がわ                       ともしび",subtitle_x,subtitle_y-subtitle_size*2,2970,3192,true)
SUBTITLE_FX("小川のせせらぎ　灯火のゆらめき",subtitle_x,subtitle_y-subtitle_size*2,2970,3192)
SUBTITLE_FX("だい ち    とどろ       ほし            きら",subtitle_x,subtitle_y,3209,3412,true)
SUBTITLE_FX("大地の轟き　星たちの煌めき",subtitle_x,subtitle_y,3209,3412)
SUBTITLE_FX(" せ かい    すべ                 て     つか                 き",subtitle_x,subtitle_y-subtitle_size*2,3411,3653,true)
SUBTITLE_FX("世界の全て　この手で掴めそうな気がして",subtitle_x,subtitle_y-subtitle_size*2,3411,3653)
SUBTITLE_FX("いっ ぽ  ふ      だ                 おも       なみだ   こぼ",subtitle_x,subtitle_y,3652,3944,true)
SUBTITLE_FX("一歩踏み出したら　思わず涙が零れた",subtitle_x,subtitle_y,3652,3944)

### pass clip: ryza_no_atelier_op_mute

### prefetch: 5,2

### ###

SUBTITLE_FX("にじいろ    なつ    あざ           かがや",subtitle_x,subtitle_y-subtitle_size*2,3948,4186,true)
SUBTITLE_FX("虹色の夏　鮮やかに輝く",subtitle_x,subtitle_y-subtitle_size*2,3948,4186)
SUBTITLE_FX("いた        くる                    つつ     こ",subtitle_x,subtitle_y,4191,4424,true)
SUBTITLE_FX("痛みも苦しみさえも包み込む",subtitle_x,subtitle_y,4191,4424)
SUBTITLE_FX("なか ま             こえ    むね    おく    ひび",subtitle_x,subtitle_y-subtitle_size*2,4428,4668,true)
SUBTITLE_FX("仲間たちの声　胸の奥に響く",subtitle_x,subtitle_y-subtitle_size*2,4428,4668)
SUBTITLE_FX("くも                やさ               こころ    ふ",subtitle_x,subtitle_y,4671,4996,true)
SUBTITLE_FX("曇りのない優しさが　心に触れる",subtitle_x,subtitle_y,4671,4996)

SUBTITLE_FX(" ち へいせん     かなた         くら    よる    やみ    おお",subtitle_x,subtitle_y-subtitle_size*2,4999,5384,true)
SUBTITLE_FX("地平線の彼方が　暗い夜の闇に覆われて",subtitle_x,subtitle_y-subtitle_size*2,4999,5384)
SUBTITLE_FX("なに     み                              む",subtitle_x,subtitle_y,5388,5630,true)
SUBTITLE_FX("何も見えなくて　うつ向きそうになっても",subtitle_x,subtitle_y,5388,5630)
SUBTITLE_FX("きみ                        すす",subtitle_x,subtitle_y-subtitle_size*2,5631,5843,true)
SUBTITLE_FX("君さえいれば　進んでゆけるから",subtitle_x,subtitle_y-subtitle_size*2,5631,5843)

SUBTITLE_FX("うご     だ     はり    やさ        とき    きざ",subtitle_x,subtitle_y,5869,6103,true)
SUBTITLE_FX("動き出す針　優しく時を刻む",subtitle_x,subtitle_y,5869,6103)
SUBTITLE_FX("かぜ                まと        はし     だ",subtitle_x,subtitle_y-subtitle_size*2,6110,6347,true)
SUBTITLE_FX("風のベール纏って走り出す",subtitle_x,subtitle_y-subtitle_size*2,6110,6347)

SUBTITLE_FX("にじいろ    なつ    あざ           かがや",subtitle_x,subtitle_y,6348,6547,true)
SUBTITLE_FX("虹色の夏　鮮やかに輝き",subtitle_x,subtitle_y,6348,6547)
SUBTITLE_FX("                                ゆめ     め  ざ",subtitle_x,subtitle_y-subtitle_size*2,6544,6708,true)
SUBTITLE_FX("ただひとつだけの夢を目指して",subtitle_x,subtitle_y-subtitle_size*2,6544,6708)
SUBTITLE_FX("                     と",subtitle_x,subtitle_y,6708,7191,true)
SUBTITLE_FX("どこまでも飛んでゆく",subtitle_x,subtitle_y,6708,7191)

######## Thumbnail ########

is_thumbnail=false

is_thumbnail?ConvertToRGB32(ryza_no_atelier_op_mute,matrix="Rec709"):last

######## Music ########

bgm_48khz=SSRC(WAVSource("src\ryza_no_atelier-ost-cd01-01.wav"),48000)
AudioDub(bgm_48khz)
#Normalize()



#thumbnail=Trim(1705,-30*5)
#thumbnail=Trim(1802,-30*5)
thumbnail=Trim(7121,-30*5)



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
