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
Import("shingeki_no_kyojin-tv-common-01.avsi")

######## Source ########

#shingeki_no_kyojin_tv_ed_01=FFMS2_VIDEO_SOURCE("..\shingeki_no_kyojin-tv-ed-01.avi")
shingeki_no_kyojin_tv_ed_01=TCPSource("localhost",22051,"None")

######## Pre Combine ########

audio_amp=2.3

cm_close_door=shingeki_no_kyojin_tv_01_cm_chou_oogata_kyojin_open_door
cm_close_door_info=shingeki_no_kyojin_tv_01_info_01
cm_dont_eat_food=shingeki_no_kyojin_tv_02_cm_mikasa_push_bread_to_eren_mouth
cm_dont_eat_food_info=shingeki_no_kyojin_tv_01_info_02
cm_listen_staff=shingeki_no_kyojin_tv_01_cm_eren_dont_listen
cm_listen_staff_info=shingeki_no_kyojin_tv_01_info_01
cm_keep_quiet=shingeki_no_kyojin_tv_07_cm_kyojin_eren_punch_kyojin_02
cm_keep_quiet_info=shingeki_no_kyojin_tv_01_info_02
cm_ending=shingeki_no_kyojin_tv_01_cm_cruel_world

######## Pre Combine - Subtitle ########

subtitle_x=50
subtitle_y=395
global subtitle_font="MS Gothic"
global subtitle_effects="b"
global subtitle_size=32
global subtitle_text_color=OVERWRITE_SUBTITLE_COLOR_ALPHA(color_white,$C0)
global subtitle_halo_color=color_black

second_subtitle_x=-50
second_subtitle_y=50

function SUBTITLE_N(clip clip,string text,int "x",int "y",int "first_frame",int "last_frame",bool "is_title"){
	is_title=Default(is_title,false)

	halo_color=is_title?color_red:subtitle_halo_color
	size=is_title?subtitle_size*2:subtitle_size
	x=is_title?(subtitle_clip_width/2)-(size*StrLen(text)/4):x
	y=is_title?240:y

	return SUBTITLE_NORMAL(clip,text,x,y,first_frame,last_frame,subtitle_font,subtitle_effects,size,subtitle_text_color,halo_color)
}

function SUBTITLE_WARNING(clip clip,string text,int "x",int "y",int "first_frame",int "last_frame"){
	halo_color=color_red
	size=Round(subtitle_size*1.2)

	return SUBTITLE_FX_SMOOTH_BLINK(clip,text,x,y,first_frame,last_frame,subtitle_font,subtitle_effects,size,subtitle_text_color,halo_color,min_opacity=0.2,max_opacity=1.0)
}



cm_close_door_info=ConvertToRGB32(cm_close_door_info)
cm_close_door_info=SUBTITLE_N(cm_close_door_info,"¿Üp\ÍJå",is_title=true)

cm_dont_eat_food_info=ConvertToRGB32(cm_dont_eat_food_info)
cm_dont_eat_food_info=SUBTITLE_N(cm_dont_eat_food_info,"Ö~ùH",is_title=true)

cm_listen_staff_info=ConvertToRGB32(cm_listen_staff_info)
cm_listen_staff_info=SUBTITLE_N(cm_listen_staff_info,"ããnHìlõw¦",is_title=true)

cm_keep_quiet_info=ConvertToRGB32(cm_keep_quiet_info)
cm_keep_quiet_info=SUBTITLE_N(cm_keep_quiet_info,"svåãßÜ",is_title=true)



cm_close_door=ConvertToRGB32(cm_close_door)
cm_close_door=SUBTITLE_N(cm_close_door,"õ¹?",subtitle_x,subtitle_y,55,80,false)
cm_close_door=SUBTITLE_N(cm_close_door,"êÝ¡æVYõS¢!",subtitle_x,subtitle_y,95,140,false)
cm_close_door=SUBTITLE_N(cm_close_door,"ï!?",subtitle_x,subtitle_y,150,170,false)
cm_close_door=SUBTITLE_N(cm_close_door,"õÂ\...",subtitle_x,subtitle_y,380,410,false)
cm_close_door=SUBTITLE_N(cm_close_door,"ßÂåL50Ä¢!",subtitle_x,subtitle_y,420,510,false)
cm_close_door=SUBTITLE_N(cm_close_door,"¥¼ì...",subtitle_x,subtitle_y,550,575,false)
cm_close_door=SUBTITLE_N(cm_close_door,"làSq¢!!!",subtitle_x,subtitle_y,725,750,false)
cm_close_door=SUBTITLE_WARNING(cm_close_door,"[Jå...]",second_subtitle_x,second_subtitle_y,1040,1595)

cm_dont_eat_food=ConvertToRGB32(cm_dont_eat_food)
cm_dont_eat_food=SUBTITLE_N(cm_dont_eat_food,"O}!",subtitle_x,subtitle_y,45,70,false)
cm_dont_eat_food=SUBTITLE_N(cm_dont_eat_food,"Äh¢!DDnh¢!äAõDDnhäI(beep~)!",subtitle_x,subtitle_y,80,200,false)

cm_listen_staff=ConvertToRGB32(cm_listen_staff)
cm_listen_staff=SUBTITLE_N(cm_listen_staff,"ém¹v?",subtitle_x,subtitle_y,20,40,false)
cm_listen_staff=SUBTITLE_N(cm_listen_staff,"õæîäêNPèêm!!!",subtitle_x,subtitle_y,45,90,false)
cm_listen_staff=SUBTITLE_N(cm_listen_staff,"×YõA¥sããHìlõIb!!!",subtitle_x,subtitle_y,95,150,false)
cm_listen_staff=SUBTITLE_N(cm_listen_staff,"õvJn¹,ããb¢!",subtitle_x,subtitle_y,175,220,false)
cm_listen_staff=SUBTITLE_N(cm_listen_staff,"O}...",subtitle_x,subtitle_y,240,260,false)
cm_listen_staff=SUBTITLE_N(cm_listen_staff,"sv...sv!",subtitle_x,subtitle_y,285,350,false)
cm_listen_staff=SUBTITLE_N(cm_listen_staff,"éºäìsðí¿o...",subtitle_x,subtitle_y,375,415,false)

cm_keep_quiet=ConvertToRGB32(cm_keep_quiet)
cm_keep_quiet=SUBTITLE_N(cm_keep_quiet,"j...¢¢¢¢¢!!!",subtitle_x,subtitle_y,5,65,false)
cm_keep_quiet=SUBTITLE_WARNING(cm_keep_quiet,"[iIHìlõ]",second_subtitle_x,second_subtitle_y,65,295)

cm_ending=ConvertToRGB32(cm_ending)
cm_ending=SUBTITLE_N(cm_ending,"ämü\ÛôÂlI",subtitle_x,subtitle_y,25,80,false)
cm_ending=SUBTITLE_N(cm_ending,"Aá\Å|ÅåöIàSq,ÌæÕAð½QèÎ¹",subtitle_x,subtitle_y,85,175,false)
cm_ending=SUBTITLE_N(cm_ending,"ï!?",subtitle_x,subtitle_y,200,215,false)
cm_ending=SUBTITLE_WARNING(cm_ending,"[ÅåöIàSq]",second_subtitle_x,second_subtitle_y,255,430)
cm_ending=SUBTITLE_N(cm_ending,"¨¢!¿àzåf,IÝ²Yõ!",subtitle_x,subtitle_y,575,665,false)
cm_ending=SUBTITLE_N(cm_ending,"ÓÓ...",subtitle_x,subtitle_y,695,715,false)
cm_ending=SUBTITLE_N(cm_ending,"êm...ÒÝßç²...",subtitle_x,subtitle_y,740,795,false)
cm_ending=SUBTITLE_N(cm_ending,"äA!O}!IìêèvDD¥Ì¢!!!",subtitle_x,subtitle_y,810,930,false)
cm_ending=SUBTITLE_N(cm_ending,"lÆçz¥Ì...",subtitle_x,subtitle_y,1235,1275,false)
cm_ending=SUBTITLE_N(cm_ending,"sv¢!!!!!!",subtitle_x,subtitle_y,1535,1630,false)
cm_ending=SUBTITLE_N(cm_ending,"<--(êm)",-150,250,1620,1725,false)
cm_ending=SUBTITLE_N(cm_ending,"<--(êm)",-80,290,1730,1825,false)
cm_ending=SUBTITLE_N(cm_ending,"<--(êm)",-80,290,1895,1960,false)
cm_ending=SUBTITLE_N(cm_ending,"<--(êm)",400,250,2015,2070,false)
cm_ending=SUBTITLE_N(cm_ending,"Âó,lìIñzN¹...",subtitle_x,subtitle_y,2425,2505,false)
cm_ending=SUBTITLE_N(cm_ending,"¥Ì¥hÚj¹I °|",subtitle_x,subtitle_y,2625,2690,false)
cm_ending=SUBTITLE_N(cm_ending,"ÈyêmíPè½I üJ",subtitle_x,subtitle_y,2745,2855,false)



shingeki_no_kyojin_tv_01_cm_next_03=ConvertToRGB32(shingeki_no_kyojin_tv_01_cm_next_03)
shingeki_no_kyojin_tv_01_cm_next_03=SUBTITLE_N(shingeki_no_kyojin_tv_01_cm_next_03,"     g@Ì|î     |\\{ÞIÌ\\",(subtitle_clip_width/2)-(subtitle_size*20/4),230,is_title=false)
shingeki_no_kyojin_tv_01_cm_next_03=ConvertToYV12(shingeki_no_kyojin_tv_01_cm_next_03)

cm_next=shingeki_no_kyojin_tv_01_cm_next_01 \
	++AudioDub(TRIM_LAST_CLIP(shingeki_no_kyojin_tv_07_cm_mikasa_iaido+shingeki_no_kyojin_tv_07_kyojin_eren_punch_kyojin_01,Framecount(shingeki_no_kyojin_tv_01_cm_next_02)),shingeki_no_kyojin_tv_01_cm_next_02) \
	++shingeki_no_kyojin_tv_01_cm_next_03

cm_next=ConvertToRGB32(cm_next)
cm_next=SUBTITLE_N(cm_next,"g@Ì|î7Ëá¢S",subtitle_x,subtitle_y,40,75,false)
cm_next=SUBTITLE_N(cm_next,"O}wç­SVß§©Ù",subtitle_x,subtitle_y,95,130,false)
cm_next=SUBTITLE_N(cm_next,"REVO²ãNìLV^n,®Snâ]¹",subtitle_x,subtitle_y,140,210,false)
cm_next=SUBTITLE_N(cm_next,"¯×REVOÀIäA",subtitle_x,subtitle_y,230,265,false)
cm_next=SUBTITLE_N(cm_next,"¹IMOGè,üREVOöo¹äIãµV",subtitle_x,subtitle_y,270,335,false)

######## Combine ########

cm_shingeki_no_kyojin_tv_01=Amplify(cm_close_door++cm_close_door_info,audio_amp)++cm_dont_eat_food++Amplify(cm_dont_eat_food_info \
	++cm_listen_staff++cm_listen_staff_info++cm_keep_quiet++cm_keep_quiet_info++cm_ending,audio_amp)

cm_shingeki_no_kyojin_tv_01_next=Amplify(cm_next,audio_amp)

ConvertToYV12(cm_shingeki_no_kyojin_tv_01)++shingeki_no_kyojin_tv_ed_01++ConvertToYV12(cm_shingeki_no_kyojin_tv_01_next)

######## Post Processing ########

ConvertToYV12()
#ConvertToYUY2()
#ConvertToRGB24()

TCPServer()
