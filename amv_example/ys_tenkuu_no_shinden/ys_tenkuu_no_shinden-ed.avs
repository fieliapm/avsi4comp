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



Import("..\avsi4comp\macro.avsi")

#SetMemoryMax(64)

######## DVD (480P) ########

ys_special_collection_section_03=VOB_MPEG2_VIDEO_SOURCE("src\ys_special_collection\VTS_01_3.d2v",upConv=1)
ys_special_collection_section_03=AudioDub(ys_special_collection_section_03,WAVSource("src\ys_special_collection\VTS_01_3 Ta0 48K 16bit 2ch.wav"))

ys_tenkuu_no_shinden_ed_official=Trim(ys_special_collection_section_03,1439,9647)



ys_tenkuu_no_shinden_section_01=VOB_MPEG2_VIDEO_SOURCE("src\ys2e-ova-ys_tenkuu_no_shinden\VTS_01_1.d2v",upConv=1)
ys_tenkuu_no_shinden_section_02=VOB_MPEG2_VIDEO_SOURCE("src\ys2e-ova-ys_tenkuu_no_shinden\VTS_01_2.d2v",upConv=1)
ys_tenkuu_no_shinden_section_03=VOB_MPEG2_VIDEO_SOURCE("src\ys2e-ova-ys_tenkuu_no_shinden\VTS_01_3.d2v",upConv=1)
ys_tenkuu_no_shinden_section_04=VOB_MPEG2_VIDEO_SOURCE("src\ys2e-ova-ys_tenkuu_no_shinden\VTS_01_4.d2v",upConv=1)
ys_tenkuu_no_shinden_section_05=VOB_MPEG2_VIDEO_SOURCE("src\ys2e-ova-ys_tenkuu_no_shinden\VTS_01_5.d2v",upConv=1)

ys_tenkuu_no_shinden_section_01=AudioDub(ys_tenkuu_no_shinden_section_01,WAVSource("src\ys2e-ova-ys_tenkuu_no_shinden\VTS_01_1 T80 3_1ch 32Kbps 48KHz.wav"))
ys_tenkuu_no_shinden_section_02=AudioDub(ys_tenkuu_no_shinden_section_02,WAVSource("src\ys2e-ova-ys_tenkuu_no_shinden\VTS_01_2 T80 2_0ch 384Kbps 48KHz.wav"))
ys_tenkuu_no_shinden_section_03=AudioDub(ys_tenkuu_no_shinden_section_03,WAVSource("src\ys2e-ova-ys_tenkuu_no_shinden\VTS_01_3 T80 2_0ch 384Kbps 48KHz.wav"))
ys_tenkuu_no_shinden_section_04=AudioDub(ys_tenkuu_no_shinden_section_04,WAVSource("src\ys2e-ova-ys_tenkuu_no_shinden\VTS_01_4 T80 2_0ch 384Kbps 48KHz.wav"))
ys_tenkuu_no_shinden_section_05=AudioDub(ys_tenkuu_no_shinden_section_05,WAVSource("src\ys2e-ova-ys_tenkuu_no_shinden\VTS_01_5 T80 2_0ch 384Kbps 48KHz.wav"))

ys_tenkuu_no_shinden_section_01_title=Trim(ys_tenkuu_no_shinden_section_01,9973,10152)

######## Pre Combine ########

ys_tenkuu_no_shinden_ed_mute_official=BlankClip(ys_tenkuu_no_shinden_ed_official,length=27,color=color_black)+ys_tenkuu_no_shinden_ed_official
ys_tenkuu_no_shinden_section_01_title_extend=Loop(ys_tenkuu_no_shinden_section_01_title,150,152,152)+BlankClip(ys_tenkuu_no_shinden_ed_official,length=360,color=color_black)

######## Combine ########

#fade_length=12
#ys_tenkuu_no_shinden_ed_mute=ys_tenkuu_no_shinden_section_01+ys_tenkuu_no_shinden_section_02+ys_tenkuu_no_shinden_section_03+ys_tenkuu_no_shinden_section_04+ys_tenkuu_no_shinden_section_05

ys_tenkuu_no_shinden_ed_mute=ys_tenkuu_no_shinden_ed_mute_official+ys_tenkuu_no_shinden_section_01_title_extend

######## Music ########

bgm_48khz=ResampleAudio(AssumeSampleRate(WAVSource("src\perfect_collection_ys-cd02-07.wav"),44133),48000)
AudioDub(ys_tenkuu_no_shinden_ed_mute,bgm_48khz)

######## Subtitle ########

global subtitle_clip_width=640
global subtitle_clip_height=480

subtitle_x=50
subtitle_y=400
global subtitle_front_fade_count=15
global subtitle_rear_fade_count=30
global subtitle_font="MS Gothic"
global subtitle_effects="bi"
global subtitle_size=28
global subtitle_text_color=OVERWRITE_COLOR_ALPHA(color_aliceblue,$3F)
global subtitle_halo_color=color_black

function SUBTITLE_FX(clip clip,string text,float x,float y,int start_frame,int end_frame,bool "is_title"){
	is_title=Default(is_title,false)

	text_color=is_title?OVERWRITE_COLOR_ALPHA(color_gold,$3F):subtitle_text_color

	return SUBTITLE_FX_SLIDE_IN_WATER_OUT(clip,text,x,y,start_frame,end_frame,subtitle_front_fade_count,subtitle_rear_fade_count,subtitle_font,subtitle_effects,subtitle_size,text_color,subtitle_halo_color)
}

SUBTITLE_FX("Endless History//南翔子|- by fielia@AVISynth",subtitle_x,subtitle_y-subtitle_size,7725,8238,true)

SUBTITLE_FX("When I take the truth",subtitle_x,subtitle_y,904,1038)
SUBTITLE_FX("When I take the dream",subtitle_x,subtitle_y,1050,1185)
SUBTITLE_FX("空を 染める 朝燒け",subtitle_x,subtitle_y,1186,1454)
SUBTITLE_FX("Make me try again",subtitle_x,subtitle_y,1490,1625)
SUBTITLE_FX("Make me fly again",subtitle_x,subtitle_y,1637,1774)
SUBTITLE_FX("遠い 時の 旅人",subtitle_x,subtitle_y,1775,2047)

SUBTITLE_FX("風の中に 浮かびあがる 女神よ",subtitle_x,subtitle_y,2149,2437)
SUBTITLE_FX("幻でも それは真実の やすらぎだろう",subtitle_x,subtitle_y,2443,2746)

SUBTITLE_FX("追いかけて 傷ついて",subtitle_x,subtitle_y,3322,3605)
SUBTITLE_FX("命 賭けて つかんだ",subtitle_x,subtitle_y,3606,3879)

SUBTITLE_FX("人はいつも 夢のために 死ねるよ",subtitle_x,subtitle_y,3982,4268)
SUBTITLE_FX("傷だらけの 腕の中に 今 愛を感じる",subtitle_x,subtitle_y,4274,4575)

SUBTITLE_FX("よみがえる記憶の 地平に",subtitle_x,subtitle_y,5300,5577)
SUBTITLE_FX("新しい歴史を 刻む",subtitle_x,subtitle_y,5595,5894)

SUBTITLE_FX("風の中に 浮かびあがる 女神よ",subtitle_x,subtitle_y,6401,6691)
SUBTITLE_FX("幻でも それは永遠の やすらぎだろう",subtitle_x,subtitle_y,6692,6984)

SUBTITLE_FX("人はいつも 夢のために 生きてる",subtitle_x,subtitle_y,6985,7269)
SUBTITLE_FX("傷だらけの 腕の中に 今 愛を感じる",subtitle_x,subtitle_y,7279,7607)



ys_tenkuu_no_shinden_section_01_title++ConvertToYUY2(last)

######## Post Processing ########

#### restore interlace ####
Bob()

#### restore aspect ratio ####
Lanczos4Resize(640,480)

ConvertToYV12()
#ConvertToYUY2()
#ConvertToRGB24()
