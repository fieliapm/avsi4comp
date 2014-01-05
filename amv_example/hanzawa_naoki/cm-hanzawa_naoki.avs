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

SetMemoryMax(64)

######## TV (1920*1080) ########

hanzawa_naoki_tv_09=FFMS2_VIDEO_SOURCE("src\hanzawa_naoki\y‘“àƒhƒ‰ƒ}z”¼‘ò’¼÷ ‘æ09˜b¢ÅIŒˆí! oŒü‚ğ‚©‚¯‚½‹à—Z’¡ŒŸ¸£(x264 720p aac).mp4")
hanzawa_naoki_tv_10=FFMS2_VIDEO_SOURCE("src\hanzawa_naoki\y‘“àƒhƒ‰ƒ}z”¼‘ò’¼÷ ‘æ10˜bI¢100”{•Ô‚µ‚È‚é‚© ÅŒã‚É“y‰ºÀ‚·‚é‚Ì‚Í’N‚¾I£(x264 720p aac).mp4")

######## Trim ########

hanzawa_naoki_tv_09_oowata_angry=Trim(hanzawa_naoki_tv_09,84750,85878)
hanzawa_naoki_tv_10_oowata_tell_hanzawa_try_it=Trim(hanzawa_naoki_tv_10,56150,58309)

######## Pre Combine ########

madoka_cida=ImageSource("src\P1200930.JPG",start=0,end=360-275,fps=Framerate(hanzawa_naoki_tv_09_oowata_angry))
hanzawa_naoki_tv_09_oowata_angry_overlay=ConvertToYV12(TRANSFORM(hanzawa_naoki_tv_09_oowata_angry,madoka_cida,dstx="1024",dsty="240",factor="0.12"))

hanzawa_naoki_tv_09_oowata_angry=OVERWRITE_RANGE(hanzawa_naoki_tv_09_oowata_angry,hanzawa_naoki_tv_09_oowata_angry_overlay,254,353)

######## Pre Combine - Subtitle ########

subtitle_x=50
subtitle_y=400
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



hanzawa_naoki_tv_10_oowata_tell_hanzawa_try_it=SUBTITLE_N(hanzawa_naoki_tv_10_oowata_tell_hanzawa_try_it,"///",530,80,726,783,false)
hanzawa_naoki_tv_10_oowata_tell_hanzawa_try_it=SUBTITLE_N(hanzawa_naoki_tv_10_oowata_tell_hanzawa_try_it,"›”—¹",subtitle_x,subtitle_y,85,105,false)
hanzawa_naoki_tv_10_oowata_tell_hanzawa_try_it=SUBTITLE_N(hanzawa_naoki_tv_10_oowata_tell_hanzawa_try_it,"‰äŠÒ‘z—vİ‰ÌæÕ‘˜ª,ŠˆÈ...",subtitle_x,subtitle_y,140,260,false)
hanzawa_naoki_tv_10_oowata_tell_hanzawa_try_it=SUBTITLE_N(hanzawa_naoki_tv_10_oowata_tell_hanzawa_try_it,"Aæ¨‰ä“§˜Iˆê“…•û–@”b",subtitle_x,subtitle_y,265,360,false)
hanzawa_naoki_tv_10_oowata_tell_hanzawa_try_it=SUBTITLE_N(hanzawa_naoki_tv_10_oowata_tell_hanzawa_try_it,"œkŠÈšd‚æ,‚Ë?",subtitle_x,subtitle_y,450,510,false)
hanzawa_naoki_tv_10_oowata_tell_hanzawa_try_it=SUBTITLE_N(hanzawa_naoki_tv_10_oowata_tell_hanzawa_try_it,"‹x‘§,”cêm•—åUİŒÒŠÔPè",subtitle_x,subtitle_y,560,660,false)
hanzawa_naoki_tv_10_oowata_tell_hanzawa_try_it=SUBTITLE_N(hanzawa_naoki_tv_10_oowata_tell_hanzawa_try_it,"ŒÌˆÓŠJ‘å–å—pŠO–Ê“I‹­Œõ‰†ü˜ğêó‘Ô|ŠJ3DSŠßPokemon XYäo‘åãßŒ–‰Ü˜Ò¬ŸÀ‹ãã|á”íá¢Œ»A“®—p˜ğê“IŠî—Fš¡ŸwSãĞq|Ú’˜,—“I“Â‘O–Ê,’j“I“ÂŒã–Ê,ˆĞ‹º‘¼˜ì",subtitle_x,subtitle_y-(subtitle_size*3),700,980,false)
hanzawa_naoki_tv_10_oowata_tell_hanzawa_try_it=SUBTITLE_N(hanzawa_naoki_tv_10_oowata_tell_hanzawa_try_it,"Š®•L,•sö“I•û–@”b,ƒNƒNƒNƒNƒN...",subtitle_x,subtitle_y,990,1130,false)
hanzawa_naoki_tv_10_oowata_tell_hanzawa_try_it=SUBTITLE_N(hanzawa_naoki_tv_10_oowata_tell_hanzawa_try_it,"‰ÂˆÈ‘j~‰ä“I˜bAŠÅˆ¢ ˆ¢™û™û™û™û...",subtitle_x,subtitle_y,1245,1350,false)
hanzawa_naoki_tv_10_oowata_tell_hanzawa_try_it=SUBTITLE_N(hanzawa_naoki_tv_10_oowata_tell_hanzawa_try_it,"í–±",subtitle_x,subtitle_y,1445,1465,false)
hanzawa_naoki_tv_10_oowata_tell_hanzawa_try_it=SUBTITLE_N(hanzawa_naoki_tv_10_oowata_tell_hanzawa_try_it,"å×Š¸İ‘å‰Æ–Ê‘O”‡éãµJ_¹“I‰ÌæÕ?",subtitle_x,subtitle_y,1540,1670,false)
hanzawa_naoki_tv_10_oowata_tell_hanzawa_try_it=SUBTITLE_N(hanzawa_naoki_tv_10_oowata_tell_hanzawa_try_it,"”í˜ô—¹A—v˜ô‰ñ‹",subtitle_x,subtitle_y,1775,1825,false)
hanzawa_naoki_tv_10_oowata_tell_hanzawa_try_it=SUBTITLE_N(hanzawa_naoki_tv_10_oowata_tell_hanzawa_try_it,"‰ä—v›”å×...",subtitle_x,subtitle_y,1870,1910,false)
hanzawa_naoki_tv_10_oowata_tell_hanzawa_try_it=SUBTITLE_N(hanzawa_naoki_tv_10_oowata_tell_hanzawa_try_it,"—pˆê•S”{•òŠÒ!!!!!",subtitle_x,subtitle_y,1970,2010,false)
hanzawa_naoki_tv_10_oowata_tell_hanzawa_try_it=SUBTITLE_N(hanzawa_naoki_tv_10_oowata_tell_hanzawa_try_it,"¿‹LZ”‡êy",subtitle_x,subtitle_y,2090,2135,false)

hanzawa_naoki_tv_09_oowata_angry=SUBTITLE_N(hanzawa_naoki_tv_09_oowata_angry,"(•s‹v”VŒã)",subtitle_x,subtitle_y,0,120,true)
hanzawa_naoki_tv_09_oowata_angry=SUBTITLE_N(hanzawa_naoki_tv_09_oowata_angry,"Å‹ß—Lˆê‘¥—¯Œ¾",subtitle_x,subtitle_y,20,70,false)
hanzawa_naoki_tv_09_oowata_angry=SUBTITLE_N(hanzawa_naoki_tv_09_oowata_angry,"‰ä¥“c‹{",subtitle_x,subtitle_y,110,130,false)
hanzawa_naoki_tv_09_oowata_angry=SUBTITLE_N(hanzawa_naoki_tv_09_oowata_angry,"‘å˜a“cæ¶,^“I”ñí•øŸ]",subtitle_x,subtitle_y,155,250,false)
hanzawa_naoki_tv_09_oowata_angry=SUBTITLE_N(hanzawa_naoki_tv_09_oowata_angry,"""‰ä”cå×”s“I"¬š¢`"‹àš“ƒŠ²‘–|"‰Á”{•òŠÒ"‹‹™Ò‰Á‰ÌæÕ“I˜Ò•o˜ì—¹""",subtitle_x,subtitle_y-subtitle_size,275,360,false)
hanzawa_naoki_tv_09_oowata_angry=SUBTITLE_N(hanzawa_naoki_tv_09_oowata_angry,"šv,A‘üà”‡±",subtitle_x,subtitle_y,370,440,false)
hanzawa_naoki_tv_09_oowata_angry=SUBTITLE_N(hanzawa_naoki_tv_09_oowata_angry,"""ˆ¢ˆ¢ˆ¢ˆ¢ˆ¢!!! ‰ä“I"¬š¢`"...""",subtitle_x,subtitle_y,845,885,false)
hanzawa_naoki_tv_09_oowata_angry=SUBTITLE_N(hanzawa_naoki_tv_09_oowata_angry,"(¿…ç˜ğê‹K‘¥)",subtitle_x,subtitle_y,855,Framecount(hanzawa_naoki_tv_09_oowata_angry)-1,true)

######## Combine ########

Trim(hanzawa_naoki_tv_10_oowata_tell_hanzawa_try_it++hanzawa_naoki_tv_09_oowata_angry,70,3100)

######## Post Processing ########

ConvertToYV12()
#ConvertToYUY2()
#ConvertToRGB24()
