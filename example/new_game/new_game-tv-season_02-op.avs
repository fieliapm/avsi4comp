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

Import("..\..\avsi4comp\avsi4comp.avsi")

### inherit end ###

Import("new_game-tv-season_02-common.avsi")

######## Function ########

function MOVE_CG(clip cg,int dir_x,int dir_y,float move_offset,float scale){
	cg_frame_count=Framecount(cg)
	cg_width_half=Width(cg)/2
	cg_height_half=Height(cg)/2
	move_offset_half=move_offset*0.5

	return ScriptClip(cg,"FAST_ZOOM(dstx=Spline(current_frame,0,"+String(cg_width_half)+"-("+String(move_offset_half)+"*("+String(dir_x)+")),"+String(cg_frame_count)+","+String(cg_width_half)+"+("+String(move_offset_half)+"*("+String(dir_x)+")),cubic=false)," \
		+"dsty=Spline(current_frame,0,"+String(cg_height_half)+"-("+String(move_offset_half)+"*("+String(dir_y)+")),"+String(cg_frame_count)+","+String(cg_height_half)+"+("+String(move_offset_half)+"*("+String(dir_y)+")),cubic=false),factor="+String(scale)+",extend=true)")
}

######## Pre Combine ########

fade_length=12



new_game_title_fade_length=8
new_game_title_rgb32=ConvertToRGB32(new_game_tv_season_02_12_new_game_title,matrix="Rec709")
new_game_title_mask=ShowAlpha(ColorKeyMask(new_game_title_rgb32,color_white,96))
new_game_title_rgba32=Mask(new_game_title_rgb32,FadeIn0(FadeOut0(new_game_title_mask,new_game_title_fade_length),new_game_title_fade_length))

new_game_another_op_title_start=496
new_game_title_extend_rgba32=BlankClip(new_game_title_rgb32,length=new_game_another_op_title_start,color=color_black)+new_game_title_rgba32
new_game_tv_season_02_another_op_with_title_rgb32=Layer(ConvertToRGB32(new_game_tv_season_02_another_op,matrix="Rec709"),new_game_title_extend_rgba32)
new_game_tv_season_02_another_op_with_title=OVERWRITE_RANGE(new_game_tv_season_02_another_op,ConvertToYV12(new_game_tv_season_02_another_op_with_title_rgb32,matrix="Rec709"),new_game_another_op_title_start,new_game_another_op_title_start+(Framecount(new_game_title_rgb32)-1))



new_game_tv_season_02_08_rin_wako_shizuku_pick_casting_voice_01_moving=MOVE_CG(TRIM_FIRST_CLIP(new_game_tv_season_02_08_rin_wako_shizuku_pick_casting_voice_01,62),1,0,128.0,1.1)



pip_length=112
peco_pip_01=TRIM_MIDDLE_CLIP(new_game_tv_season_02_11_peco_game_play_01,pip_length)
peco_pip_02=TRIM_FIRST_CLIP(new_game_tv_season_02_03_huge_fire_effect,pip_length)
peco_pip_01=ScriptClip(peco_pip_01,"FAST_ZOOM(srcx=Width(),srcy=0.0,dstx=Width(),dsty=0.0+Spline(current_frame,0,Height()/8.0,Framecount()-1,0.0,cubic=false),factor=0.6)")
peco_pip_02=ScriptClip(peco_pip_02,"FAST_ZOOM(srcx=0.0,srcy=Height(),dstx=0.0,dsty=Height()-Spline(current_frame,0,Height()/8.0,Framecount()-1,0.0,cubic=false),factor=0.6)")
peco_pip=Overlay(peco_pip_01,peco_pip_02,mode="Add")
peco_pip=FrameEvaluate(peco_pip,"OL_opacity_offset=Spline(current_frame,0,-1.0,36-fade_length,-1.0,36,0.0,Framecount()-1,0.0,cubic=false)")

######## Combine ########

# new_game_tv_season_02_clean_op_01 9
# new_game_tv_season_02_clean_op_02 345/2055
# new_game_tv_season_02_clean_op_03 1145/2855
# new_game_tv_season_02_clean_op_04 4449/5041
# new_game_tv_season_02_clean_op_05 4603/5195
# new_game_tv_season_02_clean_op_06 4711/5303
# new_game_tv_season_02_clean_op_07 5576

# new_game_tv_season_02_another_op_with_title -19



new_game_tv_season_02_op_t01=BlankClip(new_game_tv_season_02_clean_op,length=9,color=color_black)+new_game_tv_season_02_clean_op_01
new_game_tv_season_02_op_t02=new_game_tv_season_02_clean_op_02+new_game_tv_season_02_clean_op_03
new_game_tv_season_02_op_t03=TRIM_FIRST_CLIP(new_game_tv_season_02_08_hifumi_nervous_and_jumping,154)+TRIM_FIRST_CLIP(new_game_tv_season_02_05_aoba_yun_hajime_discuss_character_ability_02,52)+TRIM_FIRST_CLIP(new_game_tv_season_02_06_nene_aoba_hotaru_succeeded,56) \
	+TRIM_FIRST_CLIP(new_game_tv_season_02_11_momiji_and_aoba_bring_donuts_for_tsubame_and_nene,80)+TRIM_FIRST_CLIP(new_game_tv_season_02_08_rin_wako_shizuku_pick_casting_voice_01_moving,62)+TRIM_FIRST_CLIP(new_game_tv_season_02_12_kou_introduce_aoba,73)+TRIM_FIRST_CLIP(new_game_tv_season_02_06_aoba_draw_peco_illustration,168)+TRIM_FIRST_CLIP(new_game_tv_season_02_07_momiji_say_baka_poi,19)

new_game_tv_season_02_op_t04=TRIM_MIDDLE_CLIP(new_game_tv_season_02_04_peco_story_02+new_game_tv_season_02_04_peco_story_03,71)+TRIM_FIRST_CLIP(new_game_tv_season_02_06_peco_merchandise,68)+TRIM_FIRST_CLIP(peco_pip,112)+TRIM_MIDDLE_CLIP(new_game_tv_season_02_11_nene_angry,23)

new_game_tv_season_02_op_t05=TRIM_MIDDLE_CLIP(new_game_tv_season_02_07_wako_nervous,14)+TRIM_FIRST_CLIP(new_game_tv_season_02_08_aoba_moe_moe_kyun,127)+TRIM_MIDDLE_CLIP(new_game_tv_season_02_10_hajime_play_with_yun_s_sister_and_brother,88)+TRIM_FIRST_CLIP(new_game_tv_season_02_02_aoba_s_legs,41) \
	+TRIM_FIRST_CLIP(new_game_tv_season_02_03_hifumi_try_different_clothes,227)+TRIM_FIRST_CLIP(new_game_tv_season_02_01_hedgehog_walk_on_hifumi_s_breast_02,29)
new_game_tv_season_02_op_t06=TRIM_MIDDLE_CLIP(new_game_tv_season_02_05_yun_cut_vegetables,65)+TRIM_FIRST_CLIP(new_game_tv_season_02_04_hifumi_prepare_support_suit_04,53)+TRIM_MIDDLE_CLIP(new_game_tv_season_02_02_aoba_cosplay_cat,39)+TRIM_MIDDLE_CLIP(new_game_tv_season_02_04_hajime_disappointed_move_tank,36)+TRIM_FIRST_CLIP(new_game_tv_season_02_12_kou_say_goodbye_to_everyone_02,53) \
new_game_tv_season_02_op_t07=TRIM_FIRST_CLIP(new_game_tv_season_02_06_nene_aoba_hotaru_in_cafe_restaurant,154)+TRIM_MIDDLE_CLIP(new_game_tv_season_02_03_nene_move_her_legs,52)+TRIM_FIRST_CLIP(new_game_tv_season_02_09_momiji_naked,56) \
	+TRIM_MIDDLE_CLIP(new_game_tv_season_02_07_nene_s_legs_02,80)+TRIM_MIDDLE_CLIP(new_game_tv_season_02_01_nene_write_program_and_disappointed,62)+TRIM_FIRST_CLIP(new_game_tv_season_02_09_momiji_lie,73)+TRIM_MIDDLE_CLIP(new_game_tv_season_02_10_nene_moving_finger_01+new_game_tv_season_02_10_nene_moving_finger_02,168)+TRIM_FIRST_CLIP(new_game_tv_season_02_08_hifumi_despise,29)

new_game_tv_season_02_op_t08=TRIM_LAST_CLIP(new_game_tv_season_02_04_yun_and_yun_s_brother_see_hajime_lift_up_yun_s_sister,139)+TRIM_FIRST_CLIP(new_game_tv_season_02_07_momiji_see_aoba_s_peco_illustration,116)+TRIM_FIRST_CLIP(new_game_tv_season_02_11_nene_and_tsubame_succeeded,147)+TRIM_LAST_CLIP(new_game_tv_season_02_05_hifumi_punish_yun_04,189)+FADE_OUT_WITH_BRIGHTNESS_OFFSET(TRIM_FIRST_CLIP(new_game_tv_season_02_02_aoba_and_kou_high_five_02,83),fade_length)

new_game_tv_season_02_op_t09=FADE_IN_WITH_BRIGHTNESS_OFFSET(TRIM_MIDDLE_CLIP(new_game_tv_season_02_10_rin_and_kou_eating,154),fade_length)+TRIM_FIRST_CLIP(new_game_tv_season_02_09_tsubame_see_momiji_painting,52)+TRIM_FIRST_CLIP(new_game_tv_season_02_03_shizuku_is_hitted_and_lie_down,56) \
	+TRIM_MIDDLE_CLIP(new_game_tv_season_02_12_rin_catch_kou,80)+TRIM_FIRST_CLIP(new_game_tv_season_02_01_umiko_feed_nene,62)+TRIM_MIDDLE_CLIP(new_game_tv_season_02_11_rin_catch_her_hand,138)+FADE_OUT_WITH_BRIGHTNESS_OFFSET(TRIM_FIRST_CLIP(new_game_tv_season_02_12_kou_hug_aoba,50),fade_length)
new_game_tv_season_02_op_t10=new_game_tv_season_02_clean_op_04+new_game_tv_season_02_clean_op_05+new_game_tv_season_02_clean_op_06+Dissolve(TRIM_FIRST_CLIP(new_game_tv_season_02_01_aoba_s_eye_is_shining_under_sakura_rain,72+fade_length),TRIM_MIDDLE_CLIP(new_game_tv_season_02_05_nene_aoba_hotaru_graduate_photo,59+fade_length),new_game_tv_season_02_clean_op_07,fade_length)+BlankClip(new_game_tv_season_02_clean_op,length=24*4,color=color_black)



new_game_tv_season_02_op_mute=new_game_tv_season_02_op_t01+new_game_tv_season_02_op_t02+new_game_tv_season_02_op_t03 \
	+new_game_tv_season_02_op_t04 \
	+new_game_tv_season_02_op_t05+new_game_tv_season_02_op_t06+new_game_tv_season_02_op_t07 \
	+new_game_tv_season_02_op_t08 \
	+new_game_tv_season_02_op_t09+new_game_tv_season_02_op_t10



new_game_tv_season_02_another_op_with_title_trimmed=Trim(new_game_tv_season_02_another_op_with_title,19,0)
new_game_tv_season_02_another_op_mute_rest=Trim(new_game_tv_season_02_op_mute,Framecount(new_game_tv_season_02_another_op_with_title_trimmed),0)
new_game_tv_season_02_another_op_mute=new_game_tv_season_02_another_op_with_title_trimmed+new_game_tv_season_02_another_op_mute_rest

######## Post Combine ########

op_pip_length=Framecount(new_game_tv_season_02_another_op_with_title_trimmed)
op_pip_01=ScriptClip(ConvertToRGB32(new_game_tv_season_02_another_op_mute,matrix="Rec709"),"FAST_ZOOM(srcx=0.0,srcy=0.0,dstx=0.0,dsty=0.0,factor=0.9)")
op_pip_02=ScriptClip(ConvertToRGB32(new_game_tv_season_02_op_mute,matrix="Rec709"),"FAST_ZOOM(srcx=Width(),srcy=Height(),dstx=Width(),dsty=Height(),factor=Spline(current_frame,0,0.3,"+String(op_pip_length-fade_length)+",0.3,"+String(op_pip_length)+",1.0,Framecount()-1,1.0,cubic=false))")
op_pip=OVERWRITE_RANGE(new_game_tv_season_02_op_mute,ConvertToYV12(Layer(op_pip_01,op_pip_02,op="Add"),matrix="Rec709"),0,op_pip_length)



is_pip_op=true
is_another_op=false

is_pip_op?op_pip:(is_another_op?new_game_tv_season_02_another_op_mute:new_game_tv_season_02_op_mute)

### export clip: new_game_tv_season_02_op_mute

### prefetch: 5,2

### ###

######## Subtitle ########

### inherit start ###

#global subtitle_heavy_halo_width=1
global subtitle_clip_width=428
global subtitle_clip_height=240

subtitle_x=50*0.5
subtitle_y=395*0.5
global subtitle_front_fade_count=24
global subtitle_rear_fade_count=24
global subtitle_font="MS Gothic"
global subtitle_effects="b"
global subtitle_size=32*0.5
global subtitle_text_color=color_white
global subtitle_halo_color=color_darkcyan
global subtitle_mosaic_factor=64

function SUBTITLE_FX(clip clip,string text,float x,float y,int start_frame,int end_frame,bool "is_title_color",bool "is_title_size"){
	is_title_color=Default(is_title_color,false)
	is_title_size=Default(is_title_size,false)

	halo_color=is_title_color?color_mediumpurple:subtitle_halo_color
	size=is_title_size?subtitle_size*0.875:subtitle_size

	return SUBTITLE_FX_MOSAIC_IN_MOSAIC_OUT(clip,text,Round(x),Round(y),start_frame,end_frame,subtitle_front_fade_count,subtitle_rear_fade_count,subtitle_font,subtitle_effects,Round(size),subtitle_text_color,halo_color)
}

function SUBTITLE_N(clip clip,string text,int "x",int "y",int "first_frame",int "last_frame",bool "is_title"){
	is_title=Default(is_title,false)
	x=Default(x,subtitle_clip_width/2)

	halo_color=is_title?color_red:subtitle_halo_color
	size=is_title?subtitle_size*2:subtitle_size
	y=is_title?subtitle_clip_height/2:y

	return SUBTITLE_NORMAL(clip,text,x,y,first_frame,last_frame,subtitle_font,subtitle_effects+"c",Round(size),subtitle_text_color,halo_color)
}

### inherit end ###

ConvertToRGB32(matrix="Rec709")

SUBTITLE_FX("���JSTEP BY STEP�Ői�߁I",subtitle_x,subtitle_y-subtitle_size,3,84)
SUBTITLE_FX("STEP OUT�@�����A��яo���I",subtitle_x,subtitle_y,84,148)
SUBTITLE_FX("���^�V�F",subtitle_x,subtitle_y-subtitle_size,143,183)
SUBTITLE_FX("�J�ԍőO���A�㏸��",subtitle_x,subtitle_y,181,323)

SUBTITLE_FX("�ڊo�܂��̉��Ɓ@�ꏏ�ɉ�ɍs����",subtitle_x,subtitle_y-subtitle_size,620,752)
SUBTITLE_FX("�V�������̎n�܂�",subtitle_x,subtitle_y,752,839)
SUBTITLE_FX("���͂悤�I",subtitle_x,subtitle_y-subtitle_size,842,882)
SUBTITLE_FX("�������������ƁA���",subtitle_x,subtitle_y,883,1004)
SUBTITLE_FX("�݂�ȂƁA�����A�s����",subtitle_x,subtitle_y-subtitle_size,1014,1108)

SUBTITLE_FX("�ӂ��A�y�₩��",subtitle_x,subtitle_y,1137,1203)
SUBTITLE_FX("�����A�P����",subtitle_x,subtitle_y-subtitle_size,1204,1262)
SUBTITLE_FX("�炫�ւ��]",subtitle_x,subtitle_y,1256,1300)
SUBTITLE_FX("����������",subtitle_x,subtitle_y-subtitle_size,1298,1335)
SUBTITLE_FX("�ڂ݂��Ⴂ���Ȃ��I",subtitle_x,subtitle_y,1331,1382)

SUBTITLE_FX("���JSTEP BY STEP�Ői�߁I",subtitle_x,subtitle_y-subtitle_size,1383,1465)
SUBTITLE_FX("STEP BY STEP�A��яo���I",subtitle_x,subtitle_y,1465,1537)
SUBTITLE_FX("�J�Ԑ錾�I�@���ɍ�������I",subtitle_x,subtitle_y-subtitle_size,1541,1646)
SUBTITLE_FX("���JSTEP BY STEP�@������x�I",subtitle_x,subtitle_y,1647,1729)
SUBTITLE_FX("STEP BY STEP�@�܂��܂�",subtitle_x,subtitle_y-subtitle_size,1728,1792)
SUBTITLE_FX("�������̖�����",subtitle_x,subtitle_y,1787,1859)
SUBTITLE_FX("�J�ԑO���A�����悹�āc�c�㏸���I",subtitle_x,subtitle_y-subtitle_size,1861,2034)

### pass clip: new_game_tv_season_02_op_mute

### prefetch: 5,2

### ###

SUBTITLE_FX("�t�����������Ďv���o��������",subtitle_x,subtitle_y-subtitle_size,2329,2463)
SUBTITLE_FX("�w�L�т��Ă͓]��ł�",subtitle_x,subtitle_y,2460,2550)
SUBTITLE_FX("�����ǂ�",subtitle_x,subtitle_y-subtitle_size,2552,2591)
SUBTITLE_FX("�����Ƃ����܂ł����@������A",subtitle_x,subtitle_y,2592,2711)
SUBTITLE_FX("�ł�Ȃ������Ă�����",subtitle_x,subtitle_y-subtitle_size,2725,2816)

SUBTITLE_FX("�u���v�́u�ڕW�v��",subtitle_x,subtitle_y,2847,2911)
SUBTITLE_FX("�͂��A�ȃs���`��",subtitle_x,subtitle_y-subtitle_size,2913,2971)
SUBTITLE_FX("�h�����₯��",subtitle_x,subtitle_y,2967,3011)
SUBTITLE_FX("�E�C�o����GO",subtitle_x,subtitle_y-subtitle_size,3007,3045)
SUBTITLE_FX("���ڂ񂶂Ⴂ���Ȃ�!",subtitle_x,subtitle_y,3040,3092)

SUBTITLE_FX("���JSTEP BY STEP�@���ł�",subtitle_x,subtitle_y-subtitle_size,3093,3174)
SUBTITLE_FX("STEP BY STEP�A�݂�Ȃ�",subtitle_x,subtitle_y,3175,3246)
SUBTITLE_FX("�{�C�錾�I�@�S�͎͂~�߂��Ȃ�",subtitle_x,subtitle_y-subtitle_size,3250,3355)
SUBTITLE_FX("���JSTEP BY STEP�@�������",subtitle_x,subtitle_y,3357,3438)
SUBTITLE_FX("STEP BY STEP�@�ꏏ�Ȃ�",subtitle_x,subtitle_y-subtitle_size,3438,3501)
SUBTITLE_FX("��щz���Ė����ցI",subtitle_x,subtitle_y,3498,3570)
SUBTITLE_FX("���C�O���I",subtitle_x,subtitle_y-subtitle_size,3571,3606)
SUBTITLE_FX("��]�悹�āc�c�㏸���I",subtitle_x,subtitle_y,3600,3742)

### pass clip: new_game_tv_season_02_op_mute

### prefetch: 5,2

### ###

SUBTITLE_FX("���Ƃ��J�~��ŉԂ͎U���ā@�΂̗t�F�Â���",subtitle_x,subtitle_y-subtitle_size,3744,3906)
SUBTITLE_FX("�~�̕��ɓ��������ł�",subtitle_x,subtitle_y,3907,4021)
SUBTITLE_FX("�h�����ƁA��߂�������",subtitle_x,subtitle_y-subtitle_size,4023,4094)
SUBTITLE_FX("�����؂�Ȃ��܂�",subtitle_x,subtitle_y,4097,4161)
SUBTITLE_FX("���̏t��҂�",subtitle_x,subtitle_y-subtitle_size,4171,4272)
SUBTITLE_FX("�ڂ݂�",subtitle_x,subtitle_y,4245,4290)
SUBTITLE_FX("�ς��ق�",subtitle_x,subtitle_y-subtitle_size,4278,4357)
SUBTITLE_FX("�����Ȃ���",subtitle_x,subtitle_y,4359,4432)

SUBTITLE_FX("������DAY BY DAY�@��������",subtitle_x,subtitle_y-subtitle_size,4441,4524)
SUBTITLE_FX("ONE BY ONE�@�ԊJ��",subtitle_x,subtitle_y,4524,4593)
SUBTITLE_FX("�V�������҂�",subtitle_x,subtitle_y-subtitle_size,4598,4664)
SUBTITLE_FX("�ӂ����ł䂭",subtitle_x,subtitle_y,4664,4723)
SUBTITLE_FX("DAY BY DAY�@���̓���",subtitle_x,subtitle_y-subtitle_size,4722,4789)
SUBTITLE_FX("GO MY WAY�@���^�V�F",subtitle_x,subtitle_y,4788,4850)

SUBTITLE_FX("�������Y���",subtitle_x,subtitle_y-subtitle_size,4845,4916)
SUBTITLE_FX("�����A�炯�I",subtitle_x,subtitle_y,4910,4995)

SUBTITLE_FX("���JSTEP BY STEP�Ői�߁I",subtitle_x,subtitle_y-subtitle_size,5033,5115)
SUBTITLE_FX("STEP BY STEP�A�Ƃт���I",subtitle_x,subtitle_y,5114,5185)
SUBTITLE_FX("�J�Ԑ錾!�@���ɍ炩���܂��傤�I",subtitle_x,subtitle_y-subtitle_size,5190,5296)
SUBTITLE_FX("���JSTEP BY STEP�@���ꂩ���",subtitle_x,subtitle_y,5296,5378)
SUBTITLE_FX("STEP BY STEP�@���x�ł�",subtitle_x,subtitle_y-subtitle_size,5377,5441)
SUBTITLE_FX("�T�N���T�N������",subtitle_x,subtitle_y,5436,5510)
SUBTITLE_FX("�J�ԑO���A�����悹�āc�c",subtitle_x,subtitle_y-subtitle_size,5511,5601)
SUBTITLE_FX("�݂�ȂƎ���q����������A�����㏸���I",subtitle_x,subtitle_y,5601,5812)

SUBTITLE_FX("STEP by STEP UP��������//fourfolium|    (�����t(CV:���c�J��),��{�Ђӂ�(CV:�R����),|    �c�͂���(CV:�˓c�߂���),�ѓ����(CV:�|������))|- by                                fielia@AVISynth",subtitle_x,subtitle_x,5817,5945,true,true)
SUBTITLE_FX("|||     �������ҏS�e���I�V�E�����݌v�t",subtitle_x,subtitle_x,5817,5945,false,true)

######## Preface ########

Import("new_game-tv-season_01-common-cross_process.avsi")

kyou_mo_ichinichi_ganbaruzoi_audio=FadeIn0(FadeOut0(Normalize(new_game_tv_season_01_04_aoba_kyou_mo_ichinichi_ganbaruzoi_full),3),3)
kyou_mo_ichinichi_ganbaruzoi=AudioDub(new_game_tv_season_01_04_aoba_kyou_mo_ichinichi_ganbaruzoi_full,kyou_mo_ichinichi_ganbaruzoi_audio)

kyou_mo_ichinichi_ganbaruzoi=ConvertToRGB32(kyou_mo_ichinichi_ganbaruzoi,matrix="Rec709")
kyou_mo_ichinichi_ganbaruzoi=SUBTITLE_N(kyou_mo_ichinichi_ganbaruzoi,"�������������΂邼��",y=Round(subtitle_y),first_frame=107,last_frame=158)



function EXTEND_ONE_FRAME(clip clip){
	return clip+BlankClip(clip,length=1,color=color_black)
}

function UNDO_EXTEND_ONE_FRAME(clip clip){
	return Trim(clip,0,Framecount(clip)-2)
}

kyou_mo_ichinichi_ganbaruzoi_length=Framecount(kyou_mo_ichinichi_ganbaruzoi)
kyou_mo_ichinichi_ganbaruzoi=EXTEND_ONE_FRAME(kyou_mo_ichinichi_ganbaruzoi)
kyou_mo_ichinichi_ganbaruzoi=SUBTITLE_FX(kyou_mo_ichinichi_ganbaruzoi,"���JSTEP BY STEP�Ői�߁I",subtitle_x,subtitle_y-subtitle_size,kyou_mo_ichinichi_ganbaruzoi_length-9+3,kyou_mo_ichinichi_ganbaruzoi_length-9+84)
kyou_mo_ichinichi_ganbaruzoi=UNDO_EXTEND_ONE_FRAME(kyou_mo_ichinichi_ganbaruzoi)

######## Thumbnail ########

is_thumbnail=false

is_thumbnail?ConvertToRGB32(new_game_tv_season_02_op_mute,matrix="Rec709"):last

######## Music ########

bgm_48khz=SSRC(WAVSource("src\01.STEP by STEP UP��������.wav"),48000)
AudioDub(bgm_48khz)



thumbnail=Trim(1145,1337) # 8.0497 sec
#thumbnail=Trim(5041,-24*5) # 5.005 sec



kyou_mo_ichinichi_ganbaruzoi++Trim(9,0)



is_thumbnail?thumbnail:last

""")

######## Post Processing ########

ConvertToYV12(matrix="Rec709")
#ConvertToYUY2(matrix="Rec709")
#ConvertToRGB24()

TCPServer()