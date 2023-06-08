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

Import("arte-tv-common.avsi")

######## Function ########

### inherit start ###

LoadPlugin("..\plugins\MaskTools.dll")

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

### inherit end ###

function MOVE_CG(clip cg,int dir_x,int dir_y,float move_offset,float scale){
	cg_frame_count=Framecount(cg)
	cg_width_half=Width(cg)/2
	cg_height_half=Height(cg)/2
	move_offset_half=move_offset*0.5

	return ScriptClip(cg,"FAST_ZOOM(dstx=Spline(current_frame,0,"+String(cg_width_half)+"-("+String(move_offset_half)+"*("+String(dir_x)+")),"+String(cg_frame_count)+","+String(cg_width_half)+"+("+String(move_offset_half)+"*("+String(dir_x)+")),cubic=false)," \
		+"dsty=Spline(current_frame,0,"+String(cg_height_half)+"-("+String(move_offset_half)+"*("+String(dir_y)+")),"+String(cg_frame_count)+","+String(cg_height_half)+"+("+String(move_offset_half)+"*("+String(dir_y)+")),cubic=false),factor="+String(scale)+",extend=true)")
}

######## Pre Combine ########

dissolve_length=8

######## Combine ########

# arte_tv_clean_op_01 4
# arte_tv_clean_op_02 495
# arte_tv_clean_op_03 596/2480
# arte_tv_clean_op_04 1654/3538/5456
# arte_tv_clean_op_05 1685/3569/4939/5487
# arte_tv_clean_op_06 2250/6052



arte_tv_op_t01=BlankClip(arte_tv_clean_op,length=4,color=color_black)+arte_tv_clean_op_01+MOVE_CG(TRIM_MIDDLE_CLIP(arte_tv_01_firenze_downtown,69),0,-1,Height(arte_tv_clean_op)/10.0,1.1)+MOVE_CG(TRIM_MIDDLE_CLIP(arte_tv_02_leo_draw_maria,69),-1,0,Width(arte_tv_clean_op)/10.0,1.1)+TRIM_LAST_CLIP(arte_tv_02_firenze_dawn,136)+TRIM_MIDDLE_CLIP(arte_tv_08_venezia_01,69)+arte_tv_clean_op_02

arte_tv_op_t02=arte_tv_clean_op_03+arte_tv_clean_op_04
arte_tv_op_t03=TRIM_MIDDLE_CLIP(arte_tv_08_arte_draw_on_ship,16)+TRIM_MIDDLE_CLIP(arte_tv_11_arte_draw_sofia_in_night,18)+TRIM_MIDDLE_CLIP(arte_tv_09_arte_draw_in_church,42)+TRIM_MIDDLE_CLIP(arte_tv_11_arte_draw_sofia_s_portrait,27)+TRIM_MIDDLE_CLIP(arte_tv_11_arte_draw_katarina_s_portrait,32) \
	+TRIM_LAST_CLIP(arte_tv_06_sky_with_sunshine,19+25)+TRIM_MIDDLE_CLIP(arte_tv_09_katarina_and_arte_play_hoop_rolling,44+40) \
	+TRIM_MIDDLE_CLIP(arte_tv_04_arte_walk_in_firenze_street,26)+TRIM_LAST_CLIP(arte_tv_09_arte_stand_at_riverside_of_night_venezia_01,17+21+22)+TRIM_MIDDLE_CLIP(arte_tv_08_arte_pray,18+42) \
	+TRIM_MIDDLE_CLIP(arte_tv_11_katarina_see_artist_working,45)+TRIM_LAST_CLIP(arte_tv_01_arte_cute,75)+TRIM_LAST_CLIP(arte_tv_07_ruthanna_in_back_of_horse_drawn_vehicle,36)

arte_tv_op_t04=TRIM_FIRST_CLIP(arte_tv_08_arte_fall_into_sea,61)+TRIM_FIRST_CLIP(arte_tv_08_arte_drown,69)+TRIM_FIRST_CLIP(arte_tv_08_arte_and_yuri_take_gondola,60)+TRIM_MIDDLE_CLIP(arte_tv_10_arte_run_toward_gimo_and_katarina,40)

arte_tv_op_t05=TRIM_MIDDLE_CLIP(arte_tv_08_leo_and_arte_in_dream,125)+TRIM_MIDDLE_CLIP(arte_tv_01_arte_polish_canvas,71)+TRIM_LAST_CLIP(arte_tv_06_arte_breath,30)+TRIM_MIDDLE_CLIP(arte_tv_06_arte_carry_heavy_box,60) \
	+TRIM_MIDDLE_CLIP(arte_tv_06_arte_lying,25)+TRIM_MIDDLE_CLIP(arte_tv_06_angelo_see_arte_lying,57+56)+TRIM_MIDDLE_CLIP(arte_tv_06_arte_sleep,51)+TRIM_MIDDLE_CLIP(arte_tv_03_firenze_festival,69) \
	+MOVE_CG(TRIM_LAST_CLIP(arte_tv_03_arte_frustrated,69),0,1,Height(arte_tv_clean_op)/10.0,1.1)+MOVE_CG(TRIM_MIDDLE_CLIP(arte_tv_11_arte_see_huge_painting,64),-1,0,Width(arte_tv_clean_op)/10.0,1.1)+TRIM_FIRST_CLIP(arte_tv_12_arte_considering,72)+TRIM_LAST_CLIP(arte_tv_11_arte_tears,69) \
	+TRIM_FIRST_CLIP(arte_tv_04_arte_see_sky,70)+TRIM_MIDDLE_CLIP(arte_tv_08_arte_draw_in_grassland,63)+TRIM_FIRST_CLIP(arte_tv_07_arte_climb,107)+TRIM_FIRST_CLIP(arte_tv_11_firenze,15)+TRIM_FIRST_CLIP(arte_tv_08_venezia_02,16)
arte_tv_op_t06=TRIM_MIDDLE_CLIP(arte_tv_05_veronica_training_arte_02,16)+TRIM_FIRST_CLIP(arte_tv_08_gondola_in_river,18)+TRIM_MIDDLE_CLIP(arte_tv_08_arte_dress_and_take_gondola,42)+TRIM_MIDDLE_CLIP(arte_tv_10_gimo_tell_katarina,27+32) \
	+TRIM_MIDDLE_CLIP(arte_tv_03_leo_carry_arte_and_run_away,19+25)+TRIM_LAST_CLIP(arte_tv_03_arte_hide_front_hair,44+40) \
	+TRIM_MIDDLE_CLIP(arte_tv_10_murano_island_port,26)+TRIM_LAST_CLIP(arte_tv_10_katarina_and_gimo,17+21+22)+TRIM_MIDDLE_CLIP(arte_tv_05_maria,18+42) \
	+TRIM_FIRST_CLIP(arte_tv_12_katarina_see_outside,45)+TRIM_LAST_CLIP(arte_tv_10_sofia_hug_katarina,75)+TRIM_MIDDLE_CLIP(arte_tv_12_katarina_see_her_portrait,36)

arte_tv_op_t07=TRIM_LAST_CLIP(arte_tv_11_arte_against_wind,121)+TRIM_MIDDLE_CLIP(arte_tv_07_artist_industry,137)+TRIM_MIDDLE_CLIP(arte_tv_12_fresco_02,137)+FADE_OUT_WITH_BRIGHTNESS_OFFSET(TRIM_LAST_CLIP(arte_tv_05_arte_see_ubertino_s_painting_digest,145),dissolve_length)
arte_tv_op_t08=FADE_IN_WITH_BRIGHTNESS_OFFSET(TRIM_FIRST_CLIP(arte_tv_11_katarina_see_arte_sketching,137),dissolve_length)+TRIM_LAST_CLIP(arte_tv_04_leo_and_arte_walk,128)

arte_tv_op_t09=TRIM_MIDDLE_CLIP(arte_tv_04_arte_greet_veronica_01,16)+TRIM_MIDDLE_CLIP(arte_tv_04_arte_greet_veronica_02,18)+TRIM_LAST_CLIP(arte_tv_04_arte_greet_veronica_03,42)+TRIM_FIRST_CLIP(arte_tv_07_arte_teach_darcia,27+32) \
	+TRIM_FIRST_CLIP(arte_tv_01_bird_fly_to_sky,19+25)+TRIM_LAST_CLIP(arte_tv_02_angelo_and_arte_talk_near_river_side,44+40) \
	+TRIM_FIRST_CLIP(arte_tv_12_canvas,26+17+21+22)+TRIM_LAST_CLIP(arte_tv_07_ruthanna_turn_back,18)+TRIM_FIRST_CLIP(arte_tv_09_arte_and_daphne_see_church_fresco,42) \
	+TRIM_MIDDLE_CLIP(arte_tv_01_leo_sit_in_front_of_window,45+35)+TRIM_FIRST_CLIP(arte_tv_08_arte_fall,52)+TRIM_MIDDLE_CLIP(arte_tv_02_leo_dip_palette,7)
arte_tv_op_t10=arte_tv_clean_op_05+arte_tv_clean_op_06+BlankClip(arte_tv_clean_op,length=24*7,color=color_black)



arte_tv_op_mute=arte_tv_op_t01+arte_tv_op_t02+arte_tv_op_t03+arte_tv_op_t04 \
	+arte_tv_op_t05+arte_tv_op_t06+arte_tv_op_t07+arte_tv_op_t08+arte_tv_op_t09+arte_tv_op_t10

arte_tv_op_mute

### export clip: arte_tv_op_mute

### prefetch: 5,2

### ###

######## Subtitle ########

### inherit start ###

#global subtitle_heavy_halo_width=1
global subtitle_clip_width=1920
global subtitle_clip_height=1080

subtitle_x=50*2.25
subtitle_y=395*2.25
global subtitle_front_fade_count=8
global subtitle_rear_fade_count=8
global subtitle_font="MS Mincho"
global subtitle_effects="b"
global subtitle_size=30*2.25
global subtitle_text_color=color_white
global subtitle_halo_color=color_forestgreen
global subtitle_outside_halo_color=color_green

function SUBTITLE_FX(clip clip,string text,float x,float y,int start_frame,int end_frame,bool "is_furigana",bool "is_title"){
	is_title=Default(is_title,false)
	is_furigana=Default(is_furigana,false)

	halo_color=is_title?color_darkred:subtitle_halo_color
	outside_halo_color=is_title?color_red:subtitle_outside_halo_color

	subtitle_mode=is_furigana?"ex":"ex" #"ex_thick_reduce_memory"
	size=is_furigana?subtitle_size*0.5:subtitle_size
	y=is_furigana?y-size:y

	return SUBTITLE_FX_FADE_IN_FADE_OUT_DOUBLE_HALO(clip,text,Round(x),Round(y),start_frame,end_frame,subtitle_front_fade_count,subtitle_rear_fade_count,subtitle_font,subtitle_effects,Round(size),subtitle_text_color,halo_color,outside_halo_color,subtitle_mode)
}

### inherit end ###

ConvertToRGB32(matrix="Rec709")

SUBTITLE_FX("�N���[�o�[//��{�^��|- by fielia@AVISynth",-subtitle_x,subtitle_y-subtitle_size,290,494,is_title=true)

SUBTITLE_FX("�����悤     ��  ��                                �� ����   �����ɂ�",subtitle_x,subtitle_y-subtitle_size*2,609,872,true)
SUBTITLE_FX("���z���ڊo�߂��� �͂��܂�ߍ���1��",subtitle_x,subtitle_y-subtitle_size*2,609,872)
SUBTITLE_FX("                    ��� ��        ��      ��     �Ђ�",subtitle_x,subtitle_y,881,1116,true)
SUBTITLE_FX("��邱�Ƃ��R�ς� �������މɂ��Ȃ�",subtitle_x,subtitle_y,881,1116)

SUBTITLE_FX("�܂�     ��               ����    ����             �Ȃ݂�   ����            �̂�",subtitle_x,subtitle_y-subtitle_size*2,1133,1398,true)
SUBTITLE_FX("�����J���Ă� ������Ă� �܂̖����܂��c���Ă�",subtitle_x,subtitle_y-subtitle_size*2,1133,1398)
SUBTITLE_FX(" �� ����      ����       ��  ��                               ����        ����     ��",subtitle_x,subtitle_y,1408,1657,true)
SUBTITLE_FX("�����̉F�������グ��N���[�o�[ �傫������f����",subtitle_x,subtitle_y,1408,1657)

SUBTITLE_FX(" �܂��ɂ��킽��    ��                ��          ��              ��  ��",subtitle_x,subtitle_y-subtitle_size*2,1669,1822,true)
SUBTITLE_FX(" �����������܂�� ���܂�ς���Ėڊo�߂�",subtitle_x,subtitle_y-subtitle_size*2,1669,1822)
SUBTITLE_FX("                       �� ����",subtitle_x,subtitle_y,1815,1939,true)
SUBTITLE_FX("���͂悤 ���@���͂�����",subtitle_x,subtitle_y,1815,1939)
SUBTITLE_FX("                    �Ȃ�     ��                   ���݂���             ��",subtitle_x,subtitle_y-subtitle_size*2,1944,2097,true)
SUBTITLE_FX("���ǂ��ŉ����N������� �_�l�����Ēm��Ȃ�",subtitle_x,subtitle_y-subtitle_size*2,1944,2097)
SUBTITLE_FX("���肦�Ȃ����ƂȂ�ĂȂ���",subtitle_x,subtitle_y,2090,2250)
 
SUBTITLE_FX("                     ��             �ɂ��イ�悶����       ��",subtitle_x,subtitle_y-subtitle_size*2,2492,2755,true)
SUBTITLE_FX("���Ȃ��ɂ���Ȃ� 24���Ԃ��ᑫ��Ȃ�",subtitle_x,subtitle_y-subtitle_size*2,2492,2755)
SUBTITLE_FX("�ǂ�                �˂�          ��� ��         �킷",subtitle_x,subtitle_y,2767,3001,true)
SUBTITLE_FX("�D�̂悤�ɖ����� �����Ă��Y���",subtitle_x,subtitle_y,2767,3001)

SUBTITLE_FX("����                     ���������                  ��                     �Ђ�",subtitle_x,subtitle_y-subtitle_size*2,3019,3279,true)
SUBTITLE_FX("���������Ă� �󕨂��� ���������Ă��ꂽ�l��������",subtitle_x,subtitle_y-subtitle_size*2,3019,3279)
SUBTITLE_FX(" �� ����      ����                                                                 ��",subtitle_x,subtitle_y,3292,3540,true)
SUBTITLE_FX("�����̉F���ւƂт����N���[�o�[ �ł��Ȃ��𒴂��Ă���",subtitle_x,subtitle_y,3292,3540)

SUBTITLE_FX(" ���������イ   ���                      ����    �Ȃ�     ��",subtitle_x,subtitle_y-subtitle_size*2,3553,3707,true)
SUBTITLE_FX("���E���ɏ΂�ꂽ���� �N�ɉ�������ꂽ����",subtitle_x,subtitle_y-subtitle_size*2,3553,3707)
SUBTITLE_FX("                ����",subtitle_x,subtitle_y,3700,3823,true)
SUBTITLE_FX("���Ȃ����M���Ă��ꂽ��",subtitle_x,subtitle_y,3700,3823)
SUBTITLE_FX("����    ����    ����                          ���݂���           ���傤��",subtitle_x,subtitle_y-subtitle_size*2,3829,3979,true)
SUBTITLE_FX("�N���N�ɗ����邩�Ȃ�� �_�l�����Ƌ����Ȃ�",subtitle_x,subtitle_y-subtitle_size*2,3829,3979)
SUBTITLE_FX(" ��         �Ђ�     ��",subtitle_x,subtitle_y,3973,4132,true)
SUBTITLE_FX("�D���Ȑl���D���ɂȂ��",subtitle_x,subtitle_y,3973,4132)

### pass clip: arte_tv_op_mute

### prefetch: 5,2

### ###

SUBTITLE_FX("����    ���",subtitle_x,subtitle_y-subtitle_size*2,4146,4383,true)
SUBTITLE_FX("�������΂��肶��Ȃ���� ������킩���Ă�",subtitle_x,subtitle_y-subtitle_size*2,4146,4383)
SUBTITLE_FX("�ł��� ���ނ����ɂȂ�����",subtitle_x,subtitle_y,4385,4517)
SUBTITLE_FX("                   �� ����",subtitle_x,subtitle_y-subtitle_size*2,4519,4668,true)
SUBTITLE_FX("����͂� �������",subtitle_x,subtitle_y-subtitle_size*2,4519,4668)

SUBTITLE_FX(" �܂��ɂ��킽��    ��                ��          ��              ��  ��",subtitle_x,subtitle_y-subtitle_size*2,4924,5076,true)
SUBTITLE_FX(" �����������܂�� ���܂�ς���Ėڊo�߂�",subtitle_x,subtitle_y-subtitle_size*2,4924,5076)
SUBTITLE_FX("                       �� ����",subtitle_x,subtitle_y,5069,5193,true)
SUBTITLE_FX("���͂悤 ���@���͂�����",subtitle_x,subtitle_y,5069,5193)
SUBTITLE_FX(" �킽��            ��                               ���݂���",subtitle_x,subtitle_y-subtitle_size*2,5199,5350,true)
SUBTITLE_FX(" ���������m�肽�����Ƃ��� �_�l���킩���ĂȂ�",subtitle_x,subtitle_y-subtitle_size*2,5199,5350)
SUBTITLE_FX("                  ����     ��",subtitle_x,subtitle_y,5344,5472,true)
SUBTITLE_FX("���͂悤 ��������",subtitle_x,subtitle_y,5344,5472)

SUBTITLE_FX("�܂��ɂ� ���傤      ��                ��          ��              ��  ��",subtitle_x,subtitle_y-subtitle_size*2,5487,5624,true)
SUBTITLE_FX("�������������܂�� ���܂�ς���Ėڊo�߂�",subtitle_x,subtitle_y-subtitle_size*2,5487,5624)
SUBTITLE_FX("                       �� ����",subtitle_x,subtitle_y,5618,5740,true)
SUBTITLE_FX("���͂悤 ���@���͂�����",subtitle_x,subtitle_y,5618,5740)
SUBTITLE_FX("                    �Ȃ�     ��                   ���݂���             ��",subtitle_x,subtitle_y-subtitle_size*2,5747,5898,true)
SUBTITLE_FX("���ǂ��ŉ����N������� �_�l�����Ēm��Ȃ�",subtitle_x,subtitle_y-subtitle_size*2,5747,5898)
SUBTITLE_FX("���肦�Ȃ����ƂȂ�ĂȂ���",subtitle_x,subtitle_y,5891,6055)

######## Thumbnail ########

is_thumbnail=false

is_thumbnail?ConvertToRGB32(arte_tv_op_mute,matrix="Rec709"):last

######## Music ########

bgm_48khz=SSRC(WAVSource("src\01 clover.wav"),48000)
AudioDub(bgm_48khz)



thumbnail=Trim(1414,-24*5)



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