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

	subtitle_alpha=ConvertToYV12(ShowAlpha(subtitle_rgba),matrix="Rec709")
	subtitle_alpha=Expand(Expand(subtitle_alpha))
	subtitle_alpha=ConvertToRGB32(Greyscale(subtitle_alpha),matrix="Rec709")

	subtitle_rgba=Mask(subtitle_rgba,subtitle_alpha)

	subtitle_rgba_faded_containing_parameter=ScriptClip(subtitle_rgba,"RGBAdjust(a=alpha_factor)")
	subtitle_rgba_faded=FrameEvaluate(subtitle_rgba_faded_containing_parameter,"alpha_factor=Spline(current_frame,"+String(before_start_frame)+",0.0,"+String(start_frame)+",1.0,"+String(end_frame)+",1.0,"+String(after_end_frame)+",0.0,cubic=false)")

	return _SUBTITLE_FX_POST(clip,subtitle_rgba_faded,before_start_frame,after_end_frame)
}

### inherit end ###

######## Game (1280*720) ########

totori_no_atelier_ed=SSRC(FFMS2_VIDEO_SOURCE("src\a12-ed.mp4"),48000)

totori_cm_30sec=SSRC(FFMS2_VIDEO_SOURCE("src\A12_CM_30sec.f4v"),48000)

######## Trim ########

#totori_cm_30sec_pre=Trim(totori_cm_30sec,0,30)
totori_cm_30sec_01=Trim(totori_cm_30sec,31,740)
totori_cm_30sec_02=Trim(totori_cm_30sec,741,868)
#totori_cm_30sec_post=Trim(totori_cm_30sec,869,0)

######## Pre Combine ########

fade_length=15

totori_no_atelier_ed_01=Trim(totori_no_atelier_ed,0,9049)
totori_no_atelier_ed_02=Trim(totori_no_atelier_ed,9050,0)

totori_no_atelier_ed_02_rgba=ConvertToRGB32(totori_no_atelier_ed_02,matrix="Rec709")
totori_no_atelier_ed_02_rgba=ResetMask(totori_no_atelier_ed_02_rgba)
totori_no_atelier_ed_02_rgba=ColorKeyMask(totori_no_atelier_ed_02_rgba,color_black,24)

totori_no_atelier_ed_02_mask=ConvertToYV12(ShowAlpha(totori_no_atelier_ed_02_rgba),matrix="Rec709")
totori_no_atelier_ed_02_mask=Expand(Expand(totori_no_atelier_ed_02_mask))
totori_no_atelier_ed_02_mask=ConvertToRGB32(Greyscale(totori_no_atelier_ed_02_mask),matrix="Rec709")

totori_no_atelier_ed_02_rgba=Mask(totori_no_atelier_ed_02_rgba,totori_no_atelier_ed_02_mask)

totori_cm_30sec_cropped=Crop(totori_cm_30sec_01+totori_cm_30sec_02,0,60,0,-60)
totori_cm_30sec_tweaked=ColorYUV(totori_cm_30sec_cropped,off_u=-16.0,cont_u=-192.0,off_v=16.0,cont_v=-192.0)
totori_cm_30sec_faded=FadeOut(FadeIn(totori_cm_30sec_tweaked,fade_length),fade_length)
totori_cm_30sec_rgba=ConvertToRGB32(totori_cm_30sec_faded,matrix="Rec601")
totori_cm_30sec_resized_rgba=RESIZE_TO_REF_CLIP(totori_cm_30sec_rgba,totori_no_atelier_ed_02_rgba)
totori_cm_30sec_extend_rgba=totori_cm_30sec_resized_rgba+BlankClip(totori_cm_30sec_resized_rgba,length=Framecount(totori_no_atelier_ed_02_rgba)-Framecount(totori_cm_30sec_resized_rgba),color=color_black)

totori_no_atelier_ed_02_overlay_rgba=Layer(totori_cm_30sec_extend_rgba,totori_no_atelier_ed_02_rgba)

totori_no_atelier_ed_02_overlay=ConvertToYV12(totori_no_atelier_ed_02_overlay_rgba,matrix="Rec709")

######## Combine ########

# totori_no_atelier_ed 12



totori_no_atelier_ed_t01=BlankClip(totori_no_atelier_ed_01,length=12,color=color_black)+totori_no_atelier_ed_01
totori_no_atelier_ed_t02=totori_no_atelier_ed_02_overlay+BlankClip(totori_no_atelier_ed_01,length=30*9,color=color_black)

totori_no_atelier_ed_mute=totori_no_atelier_ed_t01+totori_no_atelier_ed_t02

totori_no_atelier_ed_mute

### export clip: totori_no_atelier_ed_mute

### prefetch: 5,2

### ###

######## Subtitle ########

### inherit start ###

#global subtitle_heavy_halo_width=1
global subtitle_clip_width=1280
global subtitle_clip_height=720

global subtitle_x_side=50*1.5
subtitle_x=subtitle_clip_width/2
subtitle_y=395*1.5
global subtitle_front_fade_count=15
global subtitle_rear_fade_count=15
global subtitle_font="MS Gothic"
global subtitle_effects="bc"
global subtitle_size=35*1.5
global subtitle_text_color=color_white
global subtitle_halo_color=color_slateblue
global subtitle_outside_halo_color=color_black

function SUBTITLE_FX(clip clip,string text,float x,float y,int start_frame,int end_frame,bool "is_furigana",bool "is_second_furigana",bool "is_title"){
	is_title=Default(is_title,false)
	is_second_furigana=Default(is_second_furigana,false)
	is_furigana=Default(is_furigana,false)

	text_color=is_title?OVERWRITE_SUBTITLE_COLOR_ALPHA(subtitle_text_color,$FF):subtitle_text_color
	text_color=is_second_furigana?color_pink:text_color
	effects=is_title?"b":subtitle_effects
	x=is_title?-subtitle_x_side:x

	subtitle_mode=is_furigana?"ex":"ex_thick_reduce_memory"
	size=is_furigana?subtitle_size*0.5:subtitle_size
	y=is_furigana?y-size:y

	return SUBTITLE_FX_FADE_IN_FADE_OUT_DOUBLE_HALO(clip,text,Round(x),Round(y),start_frame,end_frame,subtitle_front_fade_count,subtitle_rear_fade_count,subtitle_font,effects,Round(size),text_color,subtitle_halo_color,subtitle_outside_halo_color,subtitle_mode)
}

### inherit end ###

ConvertToRGB32(matrix="Rec709")

SUBTITLE_FX("まど     あ           あさ     へ  や     まね     い         ",subtitle_x,subtitle_y-subtitle_size*2,755,1080,true,true)
SUBTITLE_FX("窓を開けて 朝を部屋に招き入れる",subtitle_x,subtitle_y-subtitle_size*2,755,1080)
SUBTITLE_FX("しお    かお    むね                   す      こ             ",subtitle_x,subtitle_y,1088,1436,true,true)
SUBTITLE_FX("潮の香り胸に もっと吸い込んだら",subtitle_x,subtitle_y,1088,1436)

SUBTITLE_FX(" きのう               かる    あし と         ある        ",subtitle_x,subtitle_y-subtitle_size*2,1444,1764,true,true)
SUBTITLE_FX("昨日よりも 軽い足取りで歩こう",subtitle_x,subtitle_y-subtitle_size*2,1444,1764)
SUBTITLE_FX("なが    なが    みち      いっ ぽ                   いっしょ    ",subtitle_x,subtitle_y,1774,2158,true,true)
SUBTITLE_FX("長い長い道を 一歩ずつ ほら一緒に",subtitle_x,subtitle_y,1774,2158)

SUBTITLE_FX(" し              ば しょ                      とお         ゆ         ",subtitle_x,subtitle_y-subtitle_size*2,2158,2472,true,true)
SUBTITLE_FX("知らない場所へ このまま遠くへ行こう",subtitle_x,subtitle_y-subtitle_size*2,2158,2472)
SUBTITLE_FX("たから    ち  ず                                    す てき         ",subtitle_x,subtitle_y,2481,2918,true,true)
SUBTITLE_FX("宝の地図はなくても きっと素敵だよ",subtitle_x,subtitle_y,2481,2918)

SUBTITLE_FX("から                                      おも                        ",subtitle_x,subtitle_y-subtitle_size*2,3691,4010,true,true)
SUBTITLE_FX("空っぽだった ポーチが重くなってゆく",subtitle_x,subtitle_y-subtitle_size*2,3691,4010)
SUBTITLE_FX("こし    うえ     は         かな        おと     き     ",subtitle_x,subtitle_y,4023,4371,true,true)
SUBTITLE_FX("腰の上で跳ねて奏でる音を聴く",subtitle_x,subtitle_y,4023,4371)

SUBTITLE_FX("ふね    わた        かい ろ        ば しゃ     ふ      こ         へいげん    ",subtitle_x,subtitle_y-subtitle_size*2,4386,4716,true,true)
SUBTITLE_FX("船で渡った海路も 馬車で踏み越えた平原も",subtitle_x,subtitle_y-subtitle_size*2,4386,4716)
SUBTITLE_FX("とお     す         ふうけい                              おぼ                    ",subtitle_x,subtitle_y,4730,5165,true,true)
SUBTITLE_FX("通り過ぎた風景を ひとつひとつ覚えています",subtitle_x,subtitle_y,4730,5165)

SUBTITLE_FX("すな    うえ    あしあと  たど    さき    なみ     き     ",subtitle_x,subtitle_y-subtitle_size*2,5196,5575,true,true)
SUBTITLE_FX("砂の上の足跡 辿る先は波に消え",subtitle_x,subtitle_y-subtitle_size*2,5196,5575)
SUBTITLE_FX("なが       なみだ   あじ                          ",subtitle_x,subtitle_y,5584,5924,true,true)
SUBTITLE_FX("                              うみかぜ            ",subtitle_x,subtitle_y,5584,5924,true)
SUBTITLE_FX("流れた涙の味は 海風みたい",subtitle_x,subtitle_y,5584,5924)

### pass clip: totori_no_atelier_ed_mute

### prefetch: 5,2

### ###

SUBTITLE_FX("                 ゆ                            な     かお    ",subtitle_x,subtitle_y-subtitle_size*2,5928,6177,true,true)
SUBTITLE_FX("                                   みなも                     ",subtitle_x,subtitle_y-subtitle_size*2,5928,6177,true)
SUBTITLE_FX("ゆらゆら揺られる 水面の泣き顔と",subtitle_x,subtitle_y-subtitle_size*2,5928,6177)
SUBTITLE_FX("ひとみ    あ                ほほえ                  ",subtitle_x,subtitle_y,6184,6432,true,true)
SUBTITLE_FX("瞳を合わせて 微笑んでみる",subtitle_x,subtitle_y,6184,6432)

SUBTITLE_FX(" ひ                  えがお       おも         ふ      だ         ",subtitle_x,subtitle_y-subtitle_size*2,6441,6684,true,true)
SUBTITLE_FX("引きつった笑顔に 思わず吹き出して",subtitle_x,subtitle_y-subtitle_size*2,6441,6684)
SUBTITLE_FX("かお     あ                       あさ     き         ",subtitle_x,subtitle_y,6688,6980,true,true)
SUBTITLE_FX("顔を上げてみたら 朝が来てた",subtitle_x,subtitle_y,6688,6980)

SUBTITLE_FX("あめ     う                つぼみ        しずく            の      こ         ",subtitle_x,subtitle_y-subtitle_size*2,6998,7326,true,true)
SUBTITLE_FX("雨に打たれてた蕾 その雫さえも飲み込んで",subtitle_x,subtitle_y-subtitle_size*2,6998,7326)
SUBTITLE_FX(" さ             はな    まぶ            あす       て         あか                    ",subtitle_x,subtitle_y,7339,7780,true,true)
SUBTITLE_FX("咲かせた花の眩しさ 明日を照らす灯りになるの",subtitle_x,subtitle_y,7339,7780)

SUBTITLE_FX("すな    うえ    あしあと  なみ     き                 さき    ",subtitle_x,subtitle_y-subtitle_size*2,7811,8185,true,true)
SUBTITLE_FX("砂の上の足跡 波に消えたその先を",subtitle_x,subtitle_y-subtitle_size*2,7811,8185)
SUBTITLE_FX("わたし   ある                                  とお             ",subtitle_x,subtitle_y,8196,8610,true,true)
SUBTITLE_FX("私は歩いていこう ずっと遠くまで",subtitle_x,subtitle_y,8196,8610)

SUBTITLE_FX(" し              ば しょ      みち                        つづ    ",subtitle_x,subtitle_y-subtitle_size*2,8559,8876,true,true)
SUBTITLE_FX("知らない場所へ 道はどこまでも続く",subtitle_x,subtitle_y-subtitle_size*2,8559,8876)
SUBTITLE_FX("たから    ち  ず                                    す てき         ",subtitle_x,subtitle_y,8883,9325,true,true)
SUBTITLE_FX("宝の地図はなくても きっと素敵だよ",subtitle_x,subtitle_y,8883,9325)

SUBTITLE_FX("Dia//mao|- by fielia@AVISynth",subtitle_x,subtitle_y-subtitle_size,9703,10146,is_title=true)

######## Thumbnail ########

is_thumbnail=false

is_thumbnail?ConvertToRGB32(totori_no_atelier_ed_mute,matrix="Rec709"):last

######## Music ########

bgm_48khz=SSRC(WAVSource("src\totori_no_atelier-ost-02-31.wav"),48000)
AudioDub(bgm_48khz)



thumbnail=Trim(855,-30*5)



is_thumbnail?thumbnail:last

""")

######## Post Processing ########

ConvertToYV12(matrix="Rec709")
#ConvertToYUY2(matrix="Rec709")
#ConvertToRGB24()

#ConvertAudioTo8bit()
#ConvertAudioTo16bit()
ConvertAudioTo24bit()
#ConvertAudioTo32bit()
#ConvertAudioToFloat()

TCPServer()
