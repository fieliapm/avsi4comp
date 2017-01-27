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



Import("majo_no_takkyuubin-common.avsi")

######## Pre Combine ########

######## Combine ########

majo_no_takkyuubin_ed_mute=majo_no_takkyuubin_07_ed

######## Music ########

#bgm_48khz=ResampleAudio(AssumeSampleRate(WAVSource("src\yuming-1974_10_05-misslim-03.wav"),44042),48000)
#bgm_48khz_delayed=DelayAudio(bgm_48khz,2.248)

bgm_48khz=ResampleAudio(AssumeSampleRate(WAVSource("src\majo_no_takkyuubin-ost-21.wav"),43738),48000)
bgm_48khz_delayed=DelayAudio(bgm_48khz,2.211)

AudioDub(majo_no_takkyuubin_ed_mute,bgm_48khz_delayed)

######## Subtitle ########

function APPLY_SUBTITLE(clip clip){
	clip

	SUBTITLE_FX("やさしさに包まれたなら|album version//荒井由実|- by fielia@AVISynth",subtitle_x,subtitle_y-(subtitle_size*2),80,287,true)

	SUBTITLE_FX("小さい頃は神さまがいて",subtitle_x,subtitle_y,357,600)
	SUBTITLE_FX("不思議に夢をかなえてくれた",subtitle_x,subtitle_y-subtitle_size,632,879)
	SUBTITLE_FX("やさしい気持で目覚めた朝は",subtitle_x,subtitle_y,907,1152)
	SUBTITLE_FX("おとなになっても奇蹟はおこるよ",subtitle_x,subtitle_y-subtitle_size,1181,1455)

	SUBTITLE_FX("カーテンを開いて 静かな木洩れ陽の",subtitle_x,subtitle_y,1472,1718)
	SUBTITLE_FX("やさしさに包まれたなら きっと",subtitle_x,subtitle_y-subtitle_size,1742,1984)
	SUBTITLE_FX("目にうつる全てのことは メッセージ",subtitle_x,subtitle_y,1991,2281)

	SUBTITLE_FX("小さい頃は神さまがいて",subtitle_x,subtitle_y,2547,2787)
	SUBTITLE_FX("毎日愛を届けてくれた",subtitle_x,subtitle_y-subtitle_size,2823,3069)
	SUBTITLE_FX("心の奥にしまい忘れた",subtitle_x,subtitle_y,3098,3348)
	SUBTITLE_FX("大切な箱 ひらくときは今",subtitle_x,subtitle_y-subtitle_size,3372,3647)

	SUBTITLE_FX("雨上がりの庭で くちなしの香りの",subtitle_x,subtitle_y,3666,3920)
	SUBTITLE_FX("やさしさに包まれたなら きっと",subtitle_x,subtitle_y-subtitle_size,3941,4182)
	SUBTITLE_FX("目にうつる全てのことは メッセージ",subtitle_x,subtitle_y,4189,4486)

	SUBTITLE_FX("カーテンを開いて 静かな木洩れ陽の",subtitle_x,subtitle_y,4552,4800)
	SUBTITLE_FX("やさしさに包まれたなら きっと",subtitle_x,subtitle_y-subtitle_size,4823,5064)
	SUBTITLE_FX("目にうつる全てのことは メッセージ",subtitle_x,subtitle_y,5071,5436)

	return last
}

FILTER_INTERLACED_VIDEO("APPLY_SUBTITLE()")



majo_no_takkyuubin_01_mark++ConvertToYUY2(FADE_IN_WITH_BRIGHTNESS_OFFSET(last,30))

######## Post Processing ########

is_deinterlace=false # select interlace/deinterlace

#### restore interlace ####
is_deinterlace?BOB_PRESERVE_ORIGINAL_FIELD():last

#### restore aspect ratio ####
Lanczos4Resize(856,480)

ConvertToYV12(interlaced=!is_deinterlace)
#ConvertToYUY2()
#ConvertToRGB24()

TCPServer()
