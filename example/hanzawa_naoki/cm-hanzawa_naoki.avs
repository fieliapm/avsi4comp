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



Import("..\..\avsi4comp\avsi4comp.avsi")

######## TV (1920*1080) ########

hanzawa_naoki_tv_09=FFMS2_VIDEO_SOURCE("src\hanzawa_naoki\【国内ドラマ】半沢直樹 第09話｢最終決戦! 出向をかけた金融庁検査｣(x264 720p aac).mp4")
hanzawa_naoki_tv_10=FFMS2_VIDEO_SOURCE("src\hanzawa_naoki\【国内ドラマ】半沢直樹 第10話終｢100倍返しなるか 最後に土下座するのは誰だ！｣(x264 720p aac).mp4")

######## Trim ########

hanzawa_naoki_tv_09_oowata_angry=Trim(hanzawa_naoki_tv_09,84750,85878)
hanzawa_naoki_tv_10_oowata_tell_hanzawa_try_it=Trim(hanzawa_naoki_tv_10,56150,58309)

######## Pre Combine ########

madoka_cida=ImageSource("src\P1200930.JPG",start=0,end=360-275,fps=Framerate(hanzawa_naoki_tv_09_oowata_angry))
hanzawa_naoki_tv_09_oowata_angry_overlay=ConvertToYV12(TRANSFORM(ConvertToRGB32(hanzawa_naoki_tv_09_oowata_angry),ConvertToRGB32(madoka_cida),dstx="1024",dsty="240",factor="0.12"))

hanzawa_naoki_tv_09_oowata_angry=OVERWRITE_RANGE(hanzawa_naoki_tv_09_oowata_angry,hanzawa_naoki_tv_09_oowata_angry_overlay,254,353)

######## Pre Combine - Subtitle ########

subtitle_x=50
subtitle_y=395
global subtitle_font="MS Gothic"
global subtitle_effects="b"
global subtitle_size=32
global subtitle_text_color=color_white
global subtitle_halo_color=color_black

function SUBTITLE_N(clip clip,string text,int "x",int "y",int "first_frame",int "last_frame",bool "is_title"){
	is_title=Default(is_title,false)

	x=is_title?(subtitle_clip_width/2)-(subtitle_size*StrLen(text)/4):x
	y=is_title?240:y

	return SUBTITLE_NORMAL(clip,text,x,y,first_frame,last_frame,subtitle_font,subtitle_effects,subtitle_size,subtitle_text_color,subtitle_halo_color)
}



hanzawa_naoki_tv_10_oowata_tell_hanzawa_try_it=ConvertToRGB32(hanzawa_naoki_tv_10_oowata_tell_hanzawa_try_it)
hanzawa_naoki_tv_10_oowata_tell_hanzawa_try_it=SUBTITLE_N(hanzawa_naoki_tv_10_oowata_tell_hanzawa_try_it,"///",530,80,726,783,false)
hanzawa_naoki_tv_10_oowata_tell_hanzawa_try_it=SUBTITLE_N(hanzawa_naoki_tv_10_oowata_tell_hanzawa_try_it,"對了",subtitle_x,subtitle_y,85,105,false)
hanzawa_naoki_tv_10_oowata_tell_hanzawa_try_it=SUBTITLE_N(hanzawa_naoki_tv_10_oowata_tell_hanzawa_try_it,"我還想要在歌謠祭搗亂,所以...",subtitle_x,subtitle_y,140,260,false)
hanzawa_naoki_tv_10_oowata_tell_hanzawa_try_it=SUBTITLE_N(hanzawa_naoki_tv_10_oowata_tell_hanzawa_try_it,"就讓我透露一套方法巴",subtitle_x,subtitle_y,265,360,false)
hanzawa_naoki_tv_10_oowata_tell_hanzawa_try_it=SUBTITLE_N(hanzawa_naoki_tv_10_oowata_tell_hanzawa_try_it,"很簡單よ,ね?",subtitle_x,subtitle_y,450,510,false)
hanzawa_naoki_tv_10_oowata_tell_hanzawa_try_it=SUBTITLE_N(hanzawa_naoki_tv_10_oowata_tell_hanzawa_try_it,"休息時,把麥克風藏在股間霸占",subtitle_x,subtitle_y,560,660,false)
hanzawa_naoki_tv_10_oowata_tell_hanzawa_try_it=SUBTITLE_N(hanzawa_naoki_tv_10_oowata_tell_hanzawa_try_it,"故意開大門用外面的強光掩飾會場状態|開3DS玩Pokemon XY與大聲喧嘩來混淆視聽|若被發現就動用會場的基友圍毆抓耙子|接著,女的督前面,男的督後面,威脅他們",subtitle_x,subtitle_y-(subtitle_size*3),700,980,false)
hanzawa_naoki_tv_10_oowata_tell_hanzawa_try_it=SUBTITLE_N(hanzawa_naoki_tv_10_oowata_tell_hanzawa_try_it,"完畢,不錯的方法巴,ククククク...",subtitle_x,subtitle_y,990,1130,false)
hanzawa_naoki_tv_10_oowata_tell_hanzawa_try_it=SUBTITLE_N(hanzawa_naoki_tv_10_oowata_tell_hanzawa_try_it,"可以阻止我的話就試試看阿 阿哈哈哈哈...",subtitle_x,subtitle_y,1245,1350,false)
hanzawa_naoki_tv_10_oowata_tell_hanzawa_try_it=SUBTITLE_N(hanzawa_naoki_tv_10_oowata_tell_hanzawa_try_it,"常務",subtitle_x,subtitle_y,1445,1465,false)
hanzawa_naoki_tv_10_oowata_tell_hanzawa_try_it=SUBTITLE_N(hanzawa_naoki_tv_10_oowata_tell_hanzawa_try_it,"袮敢在大家面前這樣羞辱神聖的歌謠祭?",subtitle_x,subtitle_y,1540,1670,false)
hanzawa_naoki_tv_10_oowata_tell_hanzawa_try_it=SUBTITLE_N(hanzawa_naoki_tv_10_oowata_tell_hanzawa_try_it,"被做了就要做回去",subtitle_x,subtitle_y,1775,1825,false)
hanzawa_naoki_tv_10_oowata_tell_hanzawa_try_it=SUBTITLE_N(hanzawa_naoki_tv_10_oowata_tell_hanzawa_try_it,"我要對袮...",subtitle_x,subtitle_y,1870,1910,false)
hanzawa_naoki_tv_10_oowata_tell_hanzawa_try_it=SUBTITLE_N(hanzawa_naoki_tv_10_oowata_tell_hanzawa_try_it,"用一百倍奉還!!!!!",subtitle_x,subtitle_y,1970,2010,false)
hanzawa_naoki_tv_10_oowata_tell_hanzawa_try_it=SUBTITLE_N(hanzawa_naoki_tv_10_oowata_tell_hanzawa_try_it,"請記住這點",subtitle_x,subtitle_y,2090,2135,false)

hanzawa_naoki_tv_09_oowata_angry=ConvertToRGB32(hanzawa_naoki_tv_09_oowata_angry)
hanzawa_naoki_tv_09_oowata_angry=SUBTITLE_N(hanzawa_naoki_tv_09_oowata_angry,"(不久之後)",subtitle_x,subtitle_y,0,120,true)
hanzawa_naoki_tv_09_oowata_angry=SUBTITLE_N(hanzawa_naoki_tv_09_oowata_angry,"最近有一則留言",subtitle_x,subtitle_y,20,70,false)
hanzawa_naoki_tv_09_oowata_angry=SUBTITLE_N(hanzawa_naoki_tv_09_oowata_angry,"我是田宮",subtitle_x,subtitle_y,110,130,false)
hanzawa_naoki_tv_09_oowata_angry=SUBTITLE_N(hanzawa_naoki_tv_09_oowata_angry,"大和田先生,真的非常抱歉",subtitle_x,subtitle_y,155,250,false)
hanzawa_naoki_tv_09_oowata_angry=SUBTITLE_N(hanzawa_naoki_tv_09_oowata_angry,"""我把袮敗的"小圓汁"金字塔幹走|"加倍奉還"給參加歌謠祭的來賓們了""",subtitle_x,subtitle_y-subtitle_size,275,360,false)
hanzawa_naoki_tv_09_oowata_angry=SUBTITLE_N(hanzawa_naoki_tv_09_oowata_angry,"嘛,就只説這些",subtitle_x,subtitle_y,370,440,false)
hanzawa_naoki_tv_09_oowata_angry=SUBTITLE_N(hanzawa_naoki_tv_09_oowata_angry,"""阿阿阿阿阿!!! 我的"小圓汁"...""",subtitle_x,subtitle_y,845,885,false)
hanzawa_naoki_tv_09_oowata_angry=SUBTITLE_N(hanzawa_naoki_tv_09_oowata_angry,"(請遵守會場規則)",subtitle_x,subtitle_y,855,Framecount(hanzawa_naoki_tv_09_oowata_angry)-1,true)

######## Combine ########

Trim(hanzawa_naoki_tv_10_oowata_tell_hanzawa_try_it++hanzawa_naoki_tv_09_oowata_angry,70,3100)

######## Post Processing ########

ConvertToYV12()
#ConvertToYUY2()
#ConvertToRGB24()

TCPServer()
