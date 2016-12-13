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

hanzawa_naoki_tv_09=FFMS2_VIDEO_SOURCE("src\hanzawa_naoki\�y�����h���}�z���򒼎� ��09�b��ŏI����! �o�������������Z�������(x264 720p aac).mp4")
hanzawa_naoki_tv_10=FFMS2_VIDEO_SOURCE("src\hanzawa_naoki\�y�����h���}�z���򒼎� ��10�b�I�100�{�Ԃ��Ȃ邩 �Ō�ɓy��������̂͒N���I�(x264 720p aac).mp4")

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
hanzawa_naoki_tv_10_oowata_tell_hanzawa_try_it=SUBTITLE_N(hanzawa_naoki_tv_10_oowata_tell_hanzawa_try_it,"����",subtitle_x,subtitle_y,85,105,false)
hanzawa_naoki_tv_10_oowata_tell_hanzawa_try_it=SUBTITLE_N(hanzawa_naoki_tv_10_oowata_tell_hanzawa_try_it,"��ґz�v�݉�揍՝���,����...",subtitle_x,subtitle_y,140,260,false)
hanzawa_naoki_tv_10_oowata_tell_hanzawa_try_it=SUBTITLE_N(hanzawa_naoki_tv_10_oowata_tell_hanzawa_try_it,"�A樉䓧�I�꓅���@�b",subtitle_x,subtitle_y,265,360,false)
hanzawa_naoki_tv_10_oowata_tell_hanzawa_try_it=SUBTITLE_N(hanzawa_naoki_tv_10_oowata_tell_hanzawa_try_it,"�k�Țd��,��?",subtitle_x,subtitle_y,450,510,false)
hanzawa_naoki_tv_10_oowata_tell_hanzawa_try_it=SUBTITLE_N(hanzawa_naoki_tv_10_oowata_tell_hanzawa_try_it,"�x����,�c�m�����U�݌ҊԞP��",subtitle_x,subtitle_y,560,660,false)
hanzawa_naoki_tv_10_oowata_tell_hanzawa_try_it=SUBTITLE_N(hanzawa_naoki_tv_10_oowata_tell_hanzawa_try_it,"�̈ӊJ���p�O�ʓI��������������|�J3DS��Pokemon XY�o���ߌ��ܘҍ�������|���ᢌ��A���p����I��F���w�S�Ўq|�ڒ�,���I�O��,�j�I���,�Ћ�����",subtitle_x,subtitle_y-(subtitle_size*3),700,980,false)
hanzawa_naoki_tv_10_oowata_tell_hanzawa_try_it=SUBTITLE_N(hanzawa_naoki_tv_10_oowata_tell_hanzawa_try_it,"���L,�s���I���@�b,�N�N�N�N�N...",subtitle_x,subtitle_y,990,1130,false)
hanzawa_naoki_tv_10_oowata_tell_hanzawa_try_it=SUBTITLE_N(hanzawa_naoki_tv_10_oowata_tell_hanzawa_try_it,"�ȑj�~��I�b�A�����ň� ����������...",subtitle_x,subtitle_y,1245,1350,false)
hanzawa_naoki_tv_10_oowata_tell_hanzawa_try_it=SUBTITLE_N(hanzawa_naoki_tv_10_oowata_tell_hanzawa_try_it,"�햱",subtitle_x,subtitle_y,1445,1465,false)
hanzawa_naoki_tv_10_oowata_tell_hanzawa_try_it=SUBTITLE_N(hanzawa_naoki_tv_10_oowata_tell_hanzawa_try_it,"�׊��ݑ�ƖʑO����㵐J�_���I��揍�?",subtitle_x,subtitle_y,1540,1670,false)
hanzawa_naoki_tv_10_oowata_tell_hanzawa_try_it=SUBTITLE_N(hanzawa_naoki_tv_10_oowata_tell_hanzawa_try_it,"������A�v���",subtitle_x,subtitle_y,1775,1825,false)
hanzawa_naoki_tv_10_oowata_tell_hanzawa_try_it=SUBTITLE_N(hanzawa_naoki_tv_10_oowata_tell_hanzawa_try_it,"��v����...",subtitle_x,subtitle_y,1870,1910,false)
hanzawa_naoki_tv_10_oowata_tell_hanzawa_try_it=SUBTITLE_N(hanzawa_naoki_tv_10_oowata_tell_hanzawa_try_it,"�p��S�{���!!!!!",subtitle_x,subtitle_y,1970,2010,false)
hanzawa_naoki_tv_10_oowata_tell_hanzawa_try_it=SUBTITLE_N(hanzawa_naoki_tv_10_oowata_tell_hanzawa_try_it,"���L�Z���y",subtitle_x,subtitle_y,2090,2135,false)

hanzawa_naoki_tv_09_oowata_angry=SUBTITLE_N(hanzawa_naoki_tv_09_oowata_angry,"(�s�v�V��)",subtitle_x,subtitle_y,0,120,true)
hanzawa_naoki_tv_09_oowata_angry=SUBTITLE_N(hanzawa_naoki_tv_09_oowata_angry,"�ŋߗL�ꑥ����",subtitle_x,subtitle_y,20,70,false)
hanzawa_naoki_tv_09_oowata_angry=SUBTITLE_N(hanzawa_naoki_tv_09_oowata_angry,"�䐥�c�{",subtitle_x,subtitle_y,110,130,false)
hanzawa_naoki_tv_09_oowata_angry=SUBTITLE_N(hanzawa_naoki_tv_09_oowata_angry,"��a�c�搶,�^�I�����]",subtitle_x,subtitle_y,155,250,false)
hanzawa_naoki_tv_09_oowata_angry=SUBTITLE_N(hanzawa_naoki_tv_09_oowata_angry,"""��c�הs�I"�����`"����������|"���{���"���҉���揍ՓI�ҕo�엹""",subtitle_x,subtitle_y-subtitle_size,275,360,false)
hanzawa_naoki_tv_09_oowata_angry=SUBTITLE_N(hanzawa_naoki_tv_09_oowata_angry,"�v,�A��������",subtitle_x,subtitle_y,370,440,false)
hanzawa_naoki_tv_09_oowata_angry=SUBTITLE_N(hanzawa_naoki_tv_09_oowata_angry,"""����������!!! ��I"�����`"...""",subtitle_x,subtitle_y,845,885,false)
hanzawa_naoki_tv_09_oowata_angry=SUBTITLE_N(hanzawa_naoki_tv_09_oowata_angry,"(���������K��)",subtitle_x,subtitle_y,855,Framecount(hanzawa_naoki_tv_09_oowata_angry)-1,true)

######## Combine ########

Trim(hanzawa_naoki_tv_10_oowata_tell_hanzawa_try_it++hanzawa_naoki_tv_09_oowata_angry,70,3100)

######## Post Processing ########

ConvertToYV12()
#ConvertToYUY2()
#ConvertToRGB24()

TCPServer()