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

#shingeki_no_kyojin_tv_ed=FFMS2_VIDEO_SOURCE("..\shingeki_no_kyojin-tv-ed-01.avi")
shingeki_no_kyojin_tv_ed=TCPSource("localhost",22051,"None")

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
subtitle_y=400
global subtitle_font="MS Gothic"
global subtitle_effects="b"
global subtitle_size=28
global subtitle_text_color=OVERWRITE_COLOR_ALPHA(color_white,$3F)
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



cm_close_door_info=SUBTITLE_N(cm_close_door_info,"���ܗp�\�͊J��",is_title=true)
cm_close_door_info=ConvertToYV12(cm_close_door_info)

cm_dont_eat_food_info=SUBTITLE_N(cm_dont_eat_food_info,"�֎~���H",is_title=true)
cm_dont_eat_food_info=ConvertToYV12(cm_dont_eat_food_info)

cm_listen_staff_info=SUBTITLE_N(cm_listen_staff_info,"��n�H��l���w��",is_title=true)
cm_listen_staff_info=ConvertToYV12(cm_listen_staff_info)

cm_keep_quiet_info=SUBTITLE_N(cm_keep_quiet_info,"�s�v���ߌ���",is_title=true)
cm_keep_quiet_info=ConvertToYV12(cm_keep_quiet_info)



cm_close_door=SUBTITLE_N(cm_close_door,"������?",subtitle_x,subtitle_y,55,80,false)
cm_close_door=SUBTITLE_N(cm_close_door,"����ݚ��V�Y���S��!",subtitle_x,subtitle_y,95,140,false)
cm_close_door=SUBTITLE_N(cm_close_door,"��!?",subtitle_x,subtitle_y,150,170,false)
cm_close_door=SUBTITLE_N(cm_close_door,"�����\...",subtitle_x,subtitle_y,380,410,false)
cm_close_door=SUBTITLE_N(cm_close_door,"�ߌ�L50�č���!",subtitle_x,subtitle_y,420,510,false)
cm_close_door=SUBTITLE_N(cm_close_door,"������...",subtitle_x,subtitle_y,550,575,false)
cm_close_door=SUBTITLE_N(cm_close_door,"���l�S�q��!!!",subtitle_x,subtitle_y,725,750,false)
cm_close_door=SUBTITLE_WARNING(cm_close_door,"[�J�咆...]",second_subtitle_x,second_subtitle_y,1040,1595)
cm_close_door=ConvertToYV12(cm_close_door)

cm_dont_eat_food=SUBTITLE_N(cm_dont_eat_food,"�O�}!",subtitle_x,subtitle_y,45,70,false)
cm_dont_eat_food=SUBTITLE_N(cm_dont_eat_food,"�ċh��!�D�D�n�h��!䈘A���D�D�n�h��I(beep~)!",subtitle_x,subtitle_y,80,200,false)
cm_dont_eat_food=ConvertToYV12(cm_dont_eat_food)

cm_listen_staff=SUBTITLE_N(cm_listen_staff,"����m���v?",subtitle_x,subtitle_y,20,40,false)
cm_listen_staff=SUBTITLE_N(cm_listen_staff,"������N���P���m����!!!",subtitle_x,subtitle_y,45,90,false)
cm_listen_staff=SUBTITLE_N(cm_listen_staff,"�׏Y���A���s��H��l���I�b!!!",subtitle_x,subtitle_y,95,150,false)
cm_listen_staff=SUBTITLE_N(cm_listen_staff,"���v�J�n��,��b��!",subtitle_x,subtitle_y,175,220,false)
cm_listen_staff=SUBTITLE_N(cm_listen_staff,"�O�}...",subtitle_x,subtitle_y,240,260,false)
cm_listen_staff=SUBTITLE_N(cm_listen_staff,"�s�v...�s�v!",subtitle_x,subtitle_y,285,350,false)
cm_listen_staff=SUBTITLE_N(cm_listen_staff,"���鉺�����s��퐿�o��...",subtitle_x,subtitle_y,375,415,false)
cm_listen_staff=ConvertToYV12(cm_listen_staff)

cm_keep_quiet=SUBTITLE_N(cm_keep_quiet,"�j...����������!!!",subtitle_x,subtitle_y,5,65,false)
cm_keep_quiet=SUBTITLE_WARNING(cm_keep_quiet,"[�i���I�H��l��]",second_subtitle_x,second_subtitle_y,65,295)
cm_keep_quiet=ConvertToYV12(cm_keep_quiet)

cm_ending=SUBTITLE_N(cm_ending,"��m�����\�ێ���l�I����",subtitle_x,subtitle_y,25,80,false)
cm_ending=SUBTITLE_N(cm_ending,"�A��\�œ|�ő���I�S�q,��揍ՏA�𕗕��Q�Η�",subtitle_x,subtitle_y,85,175,false)
cm_ending=SUBTITLE_N(cm_ending,"��!?",subtitle_x,subtitle_y,200,215,false)
cm_ending=SUBTITLE_WARNING(cm_ending,"[�ő���I�S�q]",second_subtitle_x,second_subtitle_y,255,430)
cm_ending=SUBTITLE_N(cm_ending,"����!�����z��f,�I�݊��Y��!",subtitle_x,subtitle_y,575,665,false)
cm_ending=SUBTITLE_N(cm_ending,"�ӎ�...",subtitle_x,subtitle_y,695,715,false)
cm_ending=SUBTITLE_N(cm_ending,"�m����...�ҍݓ��...",subtitle_x,subtitle_y,740,795,false)
cm_ending=SUBTITLE_N(cm_ending,"䈘A!�O�}!�I����v�D�D���̈�!!!",subtitle_x,subtitle_y,810,930,false)
cm_ending=SUBTITLE_N(cm_ending,"�l�Ɩ�z����...",subtitle_x,subtitle_y,1235,1275,false)
cm_ending=SUBTITLE_N(cm_ending,"�s�v��!!!!!!",subtitle_x,subtitle_y,1535,1630,false)
cm_ending=SUBTITLE_N(cm_ending,"<--(�m����)",-150,250,1620,1725,false)
cm_ending=SUBTITLE_N(cm_ending,"<--(�m����)",-80,290,1730,1825,false)
cm_ending=SUBTITLE_N(cm_ending,"<--(�m����)",-80,290,1895,1960,false)
cm_ending=SUBTITLE_N(cm_ending,"<--(�m����)",400,250,2015,2070,false)
cm_ending=SUBTITLE_N(cm_ending,"������,�l��I����z�N��...",subtitle_x,subtitle_y,2425,2505,false)
cm_ending=SUBTITLE_N(cm_ending,"���̏����h�ڔj���I ���|",subtitle_x,subtitle_y,2625,2690,false)
cm_ending=SUBTITLE_N(cm_ending,"�ȋy�m������P�舽�����I ���J",subtitle_x,subtitle_y,2745,2855,false)
cm_ending=ConvertToYV12(cm_ending)



shingeki_no_kyojin_tv_01_cm_next_03=SUBTITLE_N(shingeki_no_kyojin_tv_01_cm_next_03,"     �g�@�̋|��     |�\�\�����{�ޓI�́\�\",(subtitle_clip_width/2)-(subtitle_size*20/4),230,is_title=false)
shingeki_no_kyojin_tv_01_cm_next_03=ConvertToYV12(shingeki_no_kyojin_tv_01_cm_next_03)

cm_next=shingeki_no_kyojin_tv_01_cm_next_01 \
	++AudioDub(TRIM_LAST_CLIP(shingeki_no_kyojin_tv_07_cm_mikasa_iaido+shingeki_no_kyojin_tv_07_kyojin_eren_punch_kyojin_01,Framecount(shingeki_no_kyojin_tv_01_cm_next_02)),shingeki_no_kyojin_tv_01_cm_next_02) \
	++shingeki_no_kyojin_tv_01_cm_next_03

cm_next=SUBTITLE_N(cm_next,"�g�@�̋|��7����ᢚS",subtitle_x,subtitle_y,40,75,false)
cm_next=SUBTITLE_N(cm_next,"�O�}�w����筚S�V�ߎ�����",subtitle_x,subtitle_y,95,130,false)
cm_next=SUBTITLE_N(cm_next,"REVO���N��L�V�^�n,���S�n��]��",subtitle_x,subtitle_y,140,210,false)
cm_next=SUBTITLE_N(cm_next,"����REVO���I䈘A",subtitle_x,subtitle_y,230,265,false)
cm_next=SUBTITLE_N(cm_next,"�����I�M�O�G��,��REVO���o���I㵔V��",subtitle_x,subtitle_y,270,335,false)
cm_next=ConvertToYV12(cm_next)

######## Combine ########

cm_shingeki_no_kyojin_tv_01=Amplify(cm_close_door++cm_close_door_info,audio_amp)++cm_dont_eat_food++Amplify(cm_dont_eat_food_info \
	++cm_listen_staff++cm_listen_staff_info++cm_keep_quiet++cm_keep_quiet_info++cm_ending,audio_amp)

cm_shingeki_no_kyojin_tv_01_next=Amplify(cm_next,audio_amp)

cm_shingeki_no_kyojin_tv_01++shingeki_no_kyojin_tv_ed++cm_shingeki_no_kyojin_tv_01_next

######## Post Processing ########

ConvertToYV12()
#ConvertToYUY2()
#ConvertToRGB24()

TCPServer()