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

shin_rorona_no_atelier_ed=SSRC(FFMS2_VIDEO_SOURCE("src\non-official\新・ロロナのアトリエ はじまりの物語 ~アーランドの錬金術士~ エンディング2.720p.mp4",fpsnum=30000,fpsden=1001),48000)

######## Trim ########

ed_music_start=2

shin_rorona_no_atelier_ed_00=Trim(shin_rorona_no_atelier_ed,0,ed_music_start-1)
shin_rorona_no_atelier_ed_01=Trim(shin_rorona_no_atelier_ed,ed_music_start,0)

######## Pre Combine ########

######## Combine ########

# shin_rorona_no_atelier_ed -2



shin_rorona_no_atelier_ed_t01=shin_rorona_no_atelier_ed_01+BlankClip(shin_rorona_no_atelier_ed,length=30*2,color=color_black)

shin_rorona_no_atelier_ed_mute=shin_rorona_no_atelier_ed_t01

######## Music ########

bgm_48khz=SSRC(WAVSource("src\shin_rorona_no_atelier-ost-03-01.wav"),48000)
AudioDub(shin_rorona_no_atelier_ed_mute,bgm_48khz)



thumbnail=Trim(6895,-30*5)

######## Subtitle ########

#global subtitle_clip_width=1280
#global subtitle_clip_height=720

subtitle_x=subtitle_clip_width/2
subtitle_y=395
global subtitle_front_fade_count=15
global subtitle_rear_fade_count=15
global subtitle_font="MS Gothic"
global subtitle_effects="bc"
global subtitle_size=32
global subtitle_text_color=color_firebrick
global subtitle_halo_color=color_gold

function SUBTITLE_FX(clip clip,string text,float x,float y,int start_frame,int end_frame,bool "is_title"){
	is_title=Default(is_title,false)

	text_color=is_title?OVERWRITE_SUBTITLE_COLOR_ALPHA(subtitle_text_color,$C0):subtitle_text_color
	effects=is_title?"b":subtitle_effects
	x=is_title?-50:x

	return SUBTITLE_FX_FADE_IN_FADE_OUT(clip,text,Round(x),Round(y),start_frame,end_frame,subtitle_front_fade_count,subtitle_rear_fade_count,subtitle_font,effects,Round(subtitle_size),text_color,subtitle_halo_color)
}

SUBTITLE_FX("もしも時を跳べたら//霜月はるか|- by fielia@AVISynth",subtitle_x,subtitle_y-subtitle_size,53,402,true)

SUBTITLE_FX("閉じたままの日記帳",subtitle_x,subtitle_y-subtitle_size,526,671)
SUBTITLE_FX("書きかけてやめたページ",subtitle_x,subtitle_y,678,857)

SUBTITLE_FX("あの日夢見た自分に",subtitle_x,subtitle_y-subtitle_size,874,1014)
SUBTITLE_FX("まだ少し届かないけど",subtitle_x,subtitle_y,1026,1197)

SUBTITLE_FX("ひとつひとつ積み上げて",subtitle_x,subtitle_y-subtitle_size,1201,1369)
SUBTITLE_FX("たとえ遠回りでも",subtitle_x,subtitle_y,1375,1537)
SUBTITLE_FX("無駄なものは何もない",subtitle_x,subtitle_y-subtitle_size,1549,1715)
SUBTITLE_FX("いつかたどりつくから きっと",subtitle_x,subtitle_y,1724,1965)

SUBTITLE_FX("もしも時を跳べたなら",subtitle_x,subtitle_y-subtitle_size,2006,2152)
SUBTITLE_FX("あの頃に何を伝えよう",subtitle_x,subtitle_y,2160,2330)
SUBTITLE_FX("迷うけれど大丈夫",subtitle_x,subtitle_y-subtitle_size,2334,2501)
SUBTITLE_FX("道はいまも続いてる",subtitle_x,subtitle_y,2509,2706)

SUBTITLE_FX("君のくれた砂時計",subtitle_x,subtitle_y-subtitle_size,2792,2931)
SUBTITLE_FX("いつか見た夢に似てる",subtitle_x,subtitle_y,2944,3123)

SUBTITLE_FX("はるか刻の彼方から",subtitle_x,subtitle_y-subtitle_size,3141,3284)
SUBTITLE_FX("訪れたその旅人",subtitle_x,subtitle_y,3293,3464)

SUBTITLE_FX("ひとりだけじゃ届かない",subtitle_x,subtitle_y-subtitle_size,3467,3635)
SUBTITLE_FX("高い壁の向こうへ",subtitle_x,subtitle_y,3642,3803)
SUBTITLE_FX("手と手重ね飛び越えよう",subtitle_x,subtitle_y-subtitle_size,3817,3987)
SUBTITLE_FX("いつもそばにいるから ずっと",subtitle_x,subtitle_y,3991,4232)

SUBTITLE_FX("もしも時を跳べたなら",subtitle_x,subtitle_y-subtitle_size,4273,4419)
SUBTITLE_FX("未来へと何を届けよう",subtitle_x,subtitle_y,4426,4594)
SUBTITLE_FX("胸に宿る思い出を",subtitle_x,subtitle_y-subtitle_size,4600,4771)
SUBTITLE_FX("笑顔宿す旋律を",subtitle_x,subtitle_y,4775,4978)

SUBTITLE_FX("ずっとずっと変わらない",subtitle_x,subtitle_y-subtitle_size,5559,5728)
SUBTITLE_FX("夢を抱きしめたまま",subtitle_x,subtitle_y,5734,5896)
SUBTITLE_FX("もっともっと変わりたい",subtitle_x,subtitle_y-subtitle_size,5909,6076)
SUBTITLE_FX("だから好きになるんだ もっと",subtitle_x,subtitle_y,6083,6324)

SUBTITLE_FX("遠い時代 遠い国",subtitle_x,subtitle_y-subtitle_size,6366,6510)
SUBTITLE_FX("響きあういくつものメロディ",subtitle_x,subtitle_y,6518,6686)
SUBTITLE_FX("空に架かるきらめきは",subtitle_x,subtitle_y-subtitle_size,6692,6859)
SUBTITLE_FX("時を越えて",subtitle_x,subtitle_y,6868,6948)

SUBTITLE_FX("果てしなくつながったストーリー",subtitle_x,subtitle_y-subtitle_size,6954,7118)
SUBTITLE_FX("それぞれの二度とないステージ",subtitle_x,subtitle_y,7128,7294)
SUBTITLE_FX("どんなことが起こるんだろう",subtitle_x,subtitle_y-subtitle_size,7304,7474)
SUBTITLE_FX("開くドアの向こう側",subtitle_x,subtitle_y,7478,7682)



AUDIO_DUB_TONE(shin_rorona_no_atelier_ed_00,samplerate=48000,channels=2,type="Silence")++ConvertToYV12(last)



#thumbnail

######## Post Processing ########

ConvertToYV12()
#ConvertToYUY2()
#ConvertToRGB24()

TCPServer()
