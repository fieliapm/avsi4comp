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

	subtitle_alpha=CONVERT_BACK_TO_YV12(ShowAlpha(subtitle_rgba),matrix="Rec709")
	subtitle_alpha=Expand(Expand(Expand(subtitle_alpha)))
	subtitle_alpha=ConvertToRGB32(Greyscale(subtitle_alpha),matrix="Rec709")

	subtitle_rgba=Mask(subtitle_rgba,subtitle_alpha)

	subtitle_rgba_faded_containing_parameter=ScriptClip(subtitle_rgba,"RGBAdjust(a=alpha_factor)")
	subtitle_rgba_faded=FrameEvaluate(subtitle_rgba_faded_containing_parameter,"alpha_factor=Spline(current_frame,"+String(before_start_frame)+",0.0,"+String(start_frame)+",1.0,"+String(end_frame)+",1.0,"+String(after_end_frame)+",0.0,cubic=false)")

	return _SUBTITLE_FX_POST(clip,subtitle_rgba_faded,before_start_frame,after_end_frame)
}

function POP_FLIP(clip clip_left,clip clip_right){
	clip_left=ConvertToRGB24(clip_left,matrix="Rec709")
	clip_right=ConvertToRGB24(clip_right,matrix="Rec709")
	clip_left_scaled=ScriptClip(clip_left,"FAST_ZOOM(srcx=0.0,srcy=0.0,dstx=0.0,dsty=0.0,factor=Spline(current_frame,-1,1.0,Framecount(),0.0,cubic=false))")
	clip_right_scaled=ScriptClip(clip_right,"FAST_ZOOM(srcx=Float(Width()),srcy=Float(Height()),dstx=Float(Width()),dsty=Float(Height()),factor=Spline(current_frame,-1,0.0,Framecount(),1.0,cubic=false))")
	clip_result=Overlay(clip_left_scaled,clip_right_scaled,mode="Add")
	return CONVERT_BACK_TO_YV12(clip_result,matrix="Rec709")
}

### inherit end ###

######## Game (1920*1080) ########

function LULUA_NO_ATELIER_OP_MP4_REF_SOURCE(){
	lulua_no_atelier_op_mp4_ref=SSRC(FFmpegSource2("src\non-official\�yPS4�z�����A�̃A�g���G�@�A�[�����h�̘B���p�m4 �I�[�v�j���O.720p.mp4",atrack=-1,fpsnum=30000,fpsden=1001,threads=1),48000)
	return lulua_no_atelier_op_mp4_ref
}

function LULUA_NO_ATELIER_OP_MP4_SOURCE(){
	lulua_no_atelier_op_mp4_video=FFVideoSource("src\non-official\�yPS4�z�����A�̃A�g���G�@�A�[�����h�̘B���p�m4 �I�[�v�j���O.DASH-1080p.mp4",fpsnum=30000,fpsden=1001,threads=1,seekmode=-1)
	lulua_no_atelier_op_mp4_audio=SSRC(FFAudioSource("src\non-official\�yPS4�z�����A�̃A�g���G�@�A�[�����h�̘B���p�m4 �I�[�v�j���O.DASH-128k.m4a"),48000)
	lulua_no_atelier_op_mp4=AudioDub(lulua_no_atelier_op_mp4_video,lulua_no_atelier_op_mp4_audio)
	return lulua_no_atelier_op_mp4
}

#lulua_no_atelier_op=LULUA_NO_ATELIER_OP_MP4_REF_SOURCE()
lulua_no_atelier_op=LULUA_NO_ATELIER_OP_MP4_SOURCE()



function LULUA_NO_ATELIER_PROMOTION_VIDEO_01_MP4_REF_SOURCE(){
	lulua_no_atelier_promotion_video_01_mp4_ref=SSRC(FFmpegSource2("src\official\3��20�������I�w�����A�̃A�g���G �`�A�[�����h�̘B���p�m�S�`�x�v�����[�V�����f����1�e�I.720p.mp4",atrack=-1,fpsnum=30000,fpsden=1001,threads=1),48000)
	return lulua_no_atelier_promotion_video_01_mp4_ref
}

function LULUA_NO_ATELIER_PROMOTION_VIDEO_01_MP4_SOURCE(){
	lulua_no_atelier_promotion_video_01_mp4_video=FFVideoSource("src\official\3��20�������I�w�����A�̃A�g���G �`�A�[�����h�̘B���p�m�S�`�x�v�����[�V�����f����1�e�I.DASH-1080p.mp4",fpsnum=30000,fpsden=1001,threads=1,seekmode=-1)
	lulua_no_atelier_promotion_video_01_mp4_audio=SSRC(FFAudioSource("src\official\3��20�������I�w�����A�̃A�g���G �`�A�[�����h�̘B���p�m�S�`�x�v�����[�V�����f����1�e�I.DASH-128k.m4a"),48000)
	lulua_no_atelier_promotion_video_01_mp4=AudioDub(lulua_no_atelier_promotion_video_01_mp4_video,lulua_no_atelier_promotion_video_01_mp4_audio)
	return lulua_no_atelier_promotion_video_01_mp4
}

#lulua_no_atelier_promotion_video_01=LULUA_NO_ATELIER_PROMOTION_VIDEO_01_MP4_REF_SOURCE()
lulua_no_atelier_promotion_video_01=LULUA_NO_ATELIER_PROMOTION_VIDEO_01_MP4_SOURCE()



function LULUA_NO_ATELIER_PROMOTION_VIDEO_02_MP4_REF_SOURCE(){
	lulua_no_atelier_promotion_video_02_mp4_ref=SSRC(FFmpegSource2("src\official\3��20�������w�����A�̃A�g���G �`�A�[�����h�̘B���p�m�S�`�x�v�����[�V�����f����2�e.720p.mp4",atrack=-1,fpsnum=30000,fpsden=1001,threads=1),48000)
	return lulua_no_atelier_promotion_video_02_mp4_ref
}

function LULUA_NO_ATELIER_PROMOTION_VIDEO_02_MP4_SOURCE(){
	lulua_no_atelier_promotion_video_02_mp4_video=FFVideoSource("src\official\3��20�������w�����A�̃A�g���G �`�A�[�����h�̘B���p�m�S�`�x�v�����[�V�����f����2�e.DASH-1080p.mp4",fpsnum=30000,fpsden=1001,threads=1,seekmode=-1)
	lulua_no_atelier_promotion_video_02_mp4_audio=SSRC(FFAudioSource("src\official\3��20�������w�����A�̃A�g���G �`�A�[�����h�̘B���p�m�S�`�x�v�����[�V�����f����2�e.DASH-128k.m4a"),48000)
	lulua_no_atelier_promotion_video_02_mp4=AudioDub(lulua_no_atelier_promotion_video_02_mp4_video,lulua_no_atelier_promotion_video_02_mp4_audio)
	return lulua_no_atelier_promotion_video_02_mp4
}

#lulua_no_atelier_promotion_video_02=LULUA_NO_ATELIER_PROMOTION_VIDEO_02_MP4_REF_SOURCE()
lulua_no_atelier_promotion_video_02=LULUA_NO_ATELIER_PROMOTION_VIDEO_02_MP4_SOURCE()

######## Trim ########

#lulua_no_atelier_op_pre=Trim(lulua_no_atelier_op,0,11)
lulua_no_atelier_op_01=Trim(lulua_no_atelier_op,12,488)
lulua_no_atelier_op_02=Trim(lulua_no_atelier_op,489,1160)
lulua_no_atelier_op_03=Trim(lulua_no_atelier_op,1161,1415)
lulua_no_atelier_op_04=Trim(lulua_no_atelier_op,1416,1648)
lulua_no_atelier_op_05=Trim(lulua_no_atelier_op,1649,2031)
lulua_no_atelier_op_06=Trim(lulua_no_atelier_op,2032,2328)
#lulua_no_atelier_op_post=Trim(lulua_no_atelier_op,2329,0)

lulua_no_atelier_promotion_video_01_01=Trim(lulua_no_atelier_promotion_video_01,0,2330) #2331 op
lulua_no_atelier_promotion_video_01_02_title=Trim(lulua_no_atelier_promotion_video_01,2331,2485) #155
lulua_no_atelier_promotion_video_01_03=Trim(lulua_no_atelier_promotion_video_01,2486,2723) #238 op
#lulua_no_atelier_promotion_video_01_04_sale=Trim(lulua_no_atelier_promotion_video_01,2724,3463)
lulua_no_atelier_promotion_video_01_05_puni=Trim(lulua_no_atelier_promotion_video_01,3464,0)

lulua_no_atelier_promotion_video_02_01=Trim(lulua_no_atelier_promotion_video_02,0,1834) #1835 op
lulua_no_atelier_promotion_video_02_02=Trim(lulua_no_atelier_promotion_video_02,1835,2497) #663 op
lulua_no_atelier_promotion_video_02_03=Trim(lulua_no_atelier_promotion_video_02,2498,4057) #1560 op
#lulua_no_atelier_promotion_video_02_04_sale=Trim(lulua_no_atelier_promotion_video_02,4058,4568)
lulua_no_atelier_promotion_video_02_05_puni=Trim(lulua_no_atelier_promotion_video_02,4569,0)

######## Pre Combine ########

fade_length=30

######## Combine ########

# lulua_no_atelier_op_01 2
# lulua_no_atelier_op_02 479
# lulua_no_atelier_op_03 6791
# lulua_no_atelier_op_04 7046
# lulua_no_atelier_op_05 7279
# lulua_no_atelier_op_06 7662



lulua_no_atelier_op_t01=BlankClip(lulua_no_atelier_op,length=2,color=color_black)+lulua_no_atelier_op_01+lulua_no_atelier_op_02
lulua_no_atelier_op_t02=TRIM_LAST_CLIP(lulua_no_atelier_promotion_video_02_01,1006+480)
lulua_no_atelier_op_t03=TRANSITION(TRIM_FIRST_CLIP(lulua_no_atelier_promotion_video_01_01,1087+1008),lulua_no_atelier_promotion_video_02_02,Framecount(lulua_no_atelier_promotion_video_02_02)-490,"POP_FLIP(left,right)")
lulua_no_atelier_op_t04=FADE_IN_WITH_BRIGHTNESS_OFFSET(TRIM_FIRST_CLIP(lulua_no_atelier_promotion_video_01_03+lulua_no_atelier_promotion_video_02_03,586+983),fade_length,false)
lulua_no_atelier_op_t05=lulua_no_atelier_op_03+lulua_no_atelier_op_04+lulua_no_atelier_op_05+lulua_no_atelier_op_06+BlankClip(lulua_no_atelier_op,length=30*4,color=color_black)

lulua_no_atelier_op_mute=lulua_no_atelier_op_t01+lulua_no_atelier_op_t02+lulua_no_atelier_op_t03+lulua_no_atelier_op_t04+lulua_no_atelier_op_t05

lulua_no_atelier_op_mute

### export clip: lulua_no_atelier_op_mute

### prefetch: 5,2

### ###

######## Subtitle ########

### inherit start ###

global subtitle_clip_width=1920
global subtitle_clip_height=1080

subtitle_x=50*2.25
subtitle_y=395*2.25
global subtitle_front_fade_count=15
global subtitle_rear_fade_count=15
global subtitle_font="MS Gothic"
global subtitle_effects="b"
global subtitle_size=33*2.25
global subtitle_text_color=color_white
global subtitle_halo_color=color_black
global subtitle_outside_halo_color=color_hotpink

function SUBTITLE_FX(clip clip,string text,float x,float y,int start_frame,int end_frame,bool "is_furigana",bool "is_title"){
	is_title=Default(is_title,false)
	is_furigana=Default(is_furigana,false)

	text_color=is_title?color_gold:subtitle_text_color

	subtitle_mode=is_furigana?"ex":"ex" #"ex_thick_reduce_memory"
	size=is_furigana?subtitle_size*0.5:subtitle_size
	y=is_furigana?y-size:y

	return SUBTITLE_FX_FADE_IN_FADE_OUT_DOUBLE_HALO(clip,text,Round(x),Round(y),start_frame,end_frame,subtitle_front_fade_count,subtitle_rear_fade_count,subtitle_font,subtitle_effects,Round(size),text_color,subtitle_halo_color,subtitle_outside_halo_color,subtitle_mode)
}

### inherit end ###

ConvertToRGB32(matrix="Rec709")

SUBTITLE_FX("Presea//�R�{���H�q|- by fielia@AVISynth",-subtitle_x,subtitle_y-subtitle_size,130,349,is_title=true)

SUBTITLE_FX("�䂫     ��          ��",subtitle_x,subtitle_y-subtitle_size*2,361,482,true)
SUBTITLE_FX("��𕪂��č炢�Ă���",subtitle_x,subtitle_y-subtitle_size*2,361,482)
SUBTITLE_FX("        �͂�",subtitle_x,subtitle_y,484,598,true)
SUBTITLE_FX("���̉Ԃ̂悤��",subtitle_x,subtitle_y,484,598)
SUBTITLE_FX("����                  ����",subtitle_x,subtitle_y-subtitle_size*2,605,729,true)
SUBTITLE_FX("�������V�s �F���̂���",subtitle_x,subtitle_y-subtitle_size*2,605,729)
SUBTITLE_FX(" ��      ��",subtitle_x,subtitle_y,730,846,true)
SUBTITLE_FX("������������ �����",subtitle_x,subtitle_y,730,846)

SUBTITLE_FX("��                     ��  ��",subtitle_x,subtitle_y-subtitle_size*2,873,973,true)
SUBTITLE_FX("�͂񂾃C�g����J��",subtitle_x,subtitle_y-subtitle_size*2,873,973)
SUBTITLE_FX("�܂�            ���  ����",subtitle_x,subtitle_y,974,1136,true)
SUBTITLE_FX("��肽���� �f��",subtitle_x,subtitle_y,974,1136)

SUBTITLE_FX("���� ��         ����  ����",subtitle_x,subtitle_y-subtitle_size*2,1144,1268,true)
SUBTITLE_FX("�������鐺 ����",subtitle_x,subtitle_y-subtitle_size*2,1144,1268)
SUBTITLE_FX("�ق�     ��     ���  �͂�",subtitle_x,subtitle_y,1266,1394,true)
SUBTITLE_FX("���̍~��� �y��",subtitle_x,subtitle_y,1266,1394)
SUBTITLE_FX("                �Ƃ�       ���������",subtitle_x,subtitle_y-subtitle_size*2,1393,1529,true)
SUBTITLE_FX("���Ȃ��ɓ͂����",subtitle_x,subtitle_y-subtitle_size*2,1393,1529)
SUBTITLE_FX("                �˂�",subtitle_x,subtitle_y,1532,1634,true)
SUBTITLE_FX("�킽���̊肢",subtitle_x,subtitle_y,1532,1634)

SUBTITLE_FX("�Ȃ�            ����  �Ƃ�",subtitle_x,subtitle_y-subtitle_size*2,1632,1757,true)
SUBTITLE_FX("���������� ����",subtitle_x,subtitle_y-subtitle_size*2,1632,1757)
SUBTITLE_FX("��       ������ ����",subtitle_x,subtitle_y,1757,1884,true)
SUBTITLE_FX("�q�����J ����",subtitle_x,subtitle_y,1757,1884)
SUBTITLE_FX("                        ��������",subtitle_x,subtitle_y-subtitle_size*2,1883,2020,true)
SUBTITLE_FX("�������悤�ɐ��d�˂���",subtitle_x,subtitle_y-subtitle_size*2,1883,2020)
SUBTITLE_FX("��                   �� �炢",subtitle_x,subtitle_y,2022,2219,true)
SUBTITLE_FX("��肾���� ������",subtitle_x,subtitle_y,2022,2219)

### pass clip: lulua_no_atelier_op_mute

### prefetch: 5,2

### ###

SUBTITLE_FX("�䂫     ��             �݂�",subtitle_x,subtitle_y-subtitle_size*2,2630,2748,true)
SUBTITLE_FX("��ɖ�����铹��",subtitle_x,subtitle_y-subtitle_size*2,2630,2748)
SUBTITLE_FX(" ��          ��",subtitle_x,subtitle_y,2751,2863,true)
SUBTITLE_FX("���ł�z�̂悤��",subtitle_x,subtitle_y,2751,2863)
SUBTITLE_FX("               �Ȃ݂� ����",subtitle_x,subtitle_y-subtitle_size*2,2874,2997,true)
SUBTITLE_FX("�₳������ ���ɂ̂���",subtitle_x,subtitle_y-subtitle_size*2,2874,2997)
SUBTITLE_FX(" ���̂�      ��",subtitle_x,subtitle_y,2997,3179,true)
SUBTITLE_FX("����֔�΂��Ă݂悤",subtitle_x,subtitle_y,2997,3179)

SUBTITLE_FX(" ��  ��         �͂�",subtitle_x,subtitle_y-subtitle_size*2,3203,3310,true)
SUBTITLE_FX("��܂����Ԃ͂���",subtitle_x,subtitle_y-subtitle_size*2,3203,3310)
SUBTITLE_FX("���",subtitle_x,subtitle_y,3324,3435,true)
SUBTITLE_FX("�΂������Ȃ��̂���",subtitle_x,subtitle_y,3324,3435)
SUBTITLE_FX("                  ����       ��",subtitle_x,subtitle_y-subtitle_size*2,3448,3549,true)
SUBTITLE_FX("�����񂾖����Ɍ�����",subtitle_x,subtitle_y-subtitle_size*2,3448,3549)
SUBTITLE_FX(" ��     �ق�",subtitle_x,subtitle_y,3548,3718,true)
SUBTITLE_FX("�炫�ւ��Ă��邩��",subtitle_x,subtitle_y,3548,3718)

SUBTITLE_FX("�܂�    �䂤 ��       �Ђ�",subtitle_x,subtitle_y-subtitle_size*2,3717,3842,true)
SUBTITLE_FX("�X�̗[��� �L��",subtitle_x,subtitle_y-subtitle_size*2,3717,3842)
SUBTITLE_FX("�₳        ����      �ق�",subtitle_x,subtitle_y,3841,3968,true)
SUBTITLE_FX("�D�������� ����",subtitle_x,subtitle_y,3841,3968)
SUBTITLE_FX("                               ���������",subtitle_x,subtitle_y-subtitle_size*2,3969,4104,true)
SUBTITLE_FX("���Ȃ��Ƃ���Ȃ���",subtitle_x,subtitle_y-subtitle_size*2,3969,4104)
SUBTITLE_FX("                 ��",subtitle_x,subtitle_y,4106,4208,true)
SUBTITLE_FX("�킽�������Ă�",subtitle_x,subtitle_y,4106,4208)

SUBTITLE_FX("               �Ђ��� ����",subtitle_x,subtitle_y-subtitle_size*2,4209,4332,true)
SUBTITLE_FX("���ڂ��� ����",subtitle_x,subtitle_y-subtitle_size*2,4209,4332)
SUBTITLE_FX("��         �� �ڂ�   ���Ȃ�",subtitle_x,subtitle_y,4332,4458,true)
SUBTITLE_FX("�a������] �ޕ�",subtitle_x,subtitle_y,4332,4458)
SUBTITLE_FX("����                ��������",subtitle_x,subtitle_y-subtitle_size*2,4458,4596,true)
SUBTITLE_FX("�x��悤�ɉe�d�˂���",subtitle_x,subtitle_y-subtitle_size*2,4458,4596)
SUBTITLE_FX("��     ��            �� �炢",subtitle_x,subtitle_y,4597,4802,true)
SUBTITLE_FX("���o���� ������",subtitle_x,subtitle_y,4597,4802)

### pass clip: lulua_no_atelier_op_mute

### prefetch: 5,2

### ###

SUBTITLE_FX("����             ��              ��",subtitle_x,subtitle_y-subtitle_size*2,5226,5332,true)
SUBTITLE_FX("�C�Ђ������킢�����",subtitle_x,subtitle_y-subtitle_size*2,5226,5332)
SUBTITLE_FX(" ��         ���݂͂�",subtitle_x,subtitle_y,5347,5464,true)
SUBTITLE_FX("�L�т��������Ȃ���",subtitle_x,subtitle_y,5347,5464)
SUBTITLE_FX(" ��      ��",subtitle_x,subtitle_y-subtitle_size*2,5471,5567,true)
SUBTITLE_FX("�삯�o����킽����",subtitle_x,subtitle_y-subtitle_size*2,5471,5567)
SUBTITLE_FX("              �݂�    ��",subtitle_x,subtitle_y,5568,5765,true)
SUBTITLE_FX("������ ���͌q���邩��",subtitle_x,subtitle_y,5568,5765)

SUBTITLE_FX("��� ��         ����  ����",subtitle_x,subtitle_y-subtitle_size*2,5801,5925,true)
SUBTITLE_FX("�鍐���鐺 �߂�",subtitle_x,subtitle_y-subtitle_size*2,5801,5925)
SUBTITLE_FX("�䂫     ��     ����  ����",subtitle_x,subtitle_y,5925,6052,true)
SUBTITLE_FX("��̍~�钩 �Â�",subtitle_x,subtitle_y,5925,6052)
SUBTITLE_FX("                �Ƃ�       ���������",subtitle_x,subtitle_y-subtitle_size*2,6053,6188,true)
SUBTITLE_FX("���Ȃ��ɓ͂����",subtitle_x,subtitle_y-subtitle_size*2,6053,6188)
SUBTITLE_FX("                �˂�",subtitle_x,subtitle_y,6192,6294,true)
SUBTITLE_FX("�킽���̊肢",subtitle_x,subtitle_y,6192,6294)

SUBTITLE_FX("�Ȃ�                 ��  ��   ����",subtitle_x,subtitle_y-subtitle_size*2,6293,6417,true)
SUBTITLE_FX("���������̓��X ����",subtitle_x,subtitle_y-subtitle_size*2,6293,6417)
SUBTITLE_FX("��         �� ���  ��",subtitle_x,subtitle_y,6416,6543,true)
SUBTITLE_FX("�q�������w ����",subtitle_x,subtitle_y,6416,6543)
SUBTITLE_FX("                        ��������",subtitle_x,subtitle_y-subtitle_size*2,6543,6677,true)
SUBTITLE_FX("�������悤�ɐ��d�˂���",subtitle_x,subtitle_y-subtitle_size*2,6543,6677)
SUBTITLE_FX("��",subtitle_x,subtitle_y,6682,6785,true)
SUBTITLE_FX("���邩��",subtitle_x,subtitle_y,6682,6785)

SUBTITLE_FX("�Ƃ�  ������",subtitle_x,subtitle_y-subtitle_size*2,6784,6907,true)
SUBTITLE_FX("���̋� �����",subtitle_x,subtitle_y-subtitle_size*2,6784,6907)
SUBTITLE_FX("�₳       ���ɂ� �܂�",subtitle_x,subtitle_y,6906,7033,true)
SUBTITLE_FX("�D������ �~��",subtitle_x,subtitle_y,6906,7033)
SUBTITLE_FX("                               ���������",subtitle_x,subtitle_y-subtitle_size*2,7033,7167,true)
SUBTITLE_FX("���Ȃ��Ƃ���Ȃ���",subtitle_x,subtitle_y-subtitle_size*2,7033,7167)
SUBTITLE_FX("                 ��",subtitle_x,subtitle_y,7171,7275,true)
SUBTITLE_FX("�킽�������Ă�",subtitle_x,subtitle_y,7171,7275)

SUBTITLE_FX("                 �� ����  ����",subtitle_x,subtitle_y-subtitle_size*2,7274,7398,true)
SUBTITLE_FX("���ڂ��Ί� �M��",subtitle_x,subtitle_y-subtitle_size*2,7274,7398)
SUBTITLE_FX("��        ����      �Ȃ�",subtitle_x,subtitle_y,7397,7525,true)
SUBTITLE_FX("�a�����F�� �i��",subtitle_x,subtitle_y,7397,7525)
SUBTITLE_FX("����                ��������",subtitle_x,subtitle_y-subtitle_size*2,7524,7661,true)
SUBTITLE_FX("�x��悤�ɉe�d�˂���",subtitle_x,subtitle_y-subtitle_size*2,7524,7661)
SUBTITLE_FX("��     ��            �� �炢",subtitle_x,subtitle_y,7663,7869,true)
SUBTITLE_FX("���o���� ������",subtitle_x,subtitle_y,7663,7869)

######## Thumbnail ########

is_thumbnail=false

is_thumbnail?ConvertToRGB32(lulua_no_atelier_op_mute,matrix="Rec709"):last

######## Music ########

bgm_48khz=SSRC(WAVSource("src\lulua_no_atelier-ost-cd03-01.wav"),48000)
AudioDub(bgm_48khz)
Normalize()



thumbnail=Trim(190,-30*5)
#thumbnail=Trim(7046,-30*5)



is_thumbnail?thumbnail:last

""")

######## Post Processing ########

#ConvertToRGB24()
#ConvertBackToYUY2(matrix="Rec709")
CONVERT_BACK_TO_YV12(matrix="Rec709")

#ConvertAudioTo8bit()
#ConvertAudioTo16bit()
ConvertAudioTo24bit()
#ConvertAudioTo32bit()
#ConvertAudioToFloat()

TCPServer()