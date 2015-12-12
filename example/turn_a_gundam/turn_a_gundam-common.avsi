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

######## ê¢äEñºçÏåÄèÍ ########

global subtitle_clip_width=640
global subtitle_clip_height=480

subtitle_x=50
subtitle_y=400
global subtitle_front_fade_count=12
global subtitle_rear_fade_count=24
global subtitle_font="MS Gothic"
global subtitle_effects="bi"
global subtitle_size=28
global subtitle_text_color=OVERWRITE_COLOR_ALPHA(color_lightgrey,$1F)
global subtitle_halo_color=color_black

second_subtitle_x=50
second_subtitle_y=50

function SUBTITLE_FX(clip clip,string text,float x,float y,int start_frame,int end_frame,int "rear_fade_count",bool "is_second_subtitle",bool "is_title"){
	rear_fade_count=Default(rear_fade_count,subtitle_rear_fade_count)
	is_second_subtitle=Default(is_second_subtitle,false)
	is_title=Default(is_title,false)

	text_color=is_second_subtitle?OVERWRITE_COLOR_ALPHA(color_gray,$1F):subtitle_text_color
	halo_color=is_title?color_blue:subtitle_halo_color

	return SUBTITLE_FX_SLIDE_IN_WATER_OUT(clip,text,x,y,start_frame,end_frame,subtitle_front_fade_count,rear_fade_count,subtitle_font,subtitle_effects,subtitle_size,text_color,halo_color)
}



global subtitle_clip_font="MS Gothic"
global subtitle_clip_effects="bc"
global subtitle_clip_font_size=80
global subtitle_clip_text_color=color_silver
global subtitle_clip_halo_color=color_blue

global subtitle_clip_text_x=subtitle_clip_width/2
global subtitle_clip_text_y=subtitle_clip_height/2-subtitle_clip_font_size/2

function SUBTITLE_CENTER(clip clip,string text){
	x=subtitle_clip_text_x-(subtitle_clip_font_size*StrLen(text)/4)
	y=subtitle_clip_text_y

	return SUBTITLE_NORMAL(clip,text,x,y,font=subtitle_clip_font,effects=subtitle_clip_effects,size=subtitle_clip_font_size,text_color=subtitle_clip_text_color,halo_color=subtitle_clip_halo_color,subtitle_ex=false)
}

function SEKAI_MEISAKU_GEKIJOU_CLIP(clip ref_clip,int length){
	sekai_meisaku_gekijou_bg=BlankClip(ref_clip,length=length,color=color_black)
	sekai_meisaku_gekijou=SUBTITLE_CENTER(sekai_meisaku_gekijou_bg,"ê¢äEñºçÏåÄèÍ")
	return ConvertToYV12(sekai_meisaku_gekijou)
}
