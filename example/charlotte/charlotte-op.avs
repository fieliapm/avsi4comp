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

Import("charlotte-common.avsi")

### inherit end ###

######## Function ########

### inherit start ###

PSEUDO_RANDOM_SEED(361499553)

function SUBTITLE_FX_RANDOM_SCALE_OLD(clip clip,string text,int "x",int "y",int "first_frame",int "last_frame",string "font",string "effects",int "size",int "text_color",int "halo_color",string "subtitle_mode"){
	first_frame=Default(first_frame,0)
	last_frame=Default(last_frame,Framecount(clip)-1)

	Assert(IsRGB32(clip),"SUBTITLE_FX_RANDOM_SCALE(): clip only support RGB32 format")

	subtitle_rgba=_SUBTITLE_FX_PRE(clip,text,x,y,first_frame,last_frame+1,font,effects,size,text_color,halo_color,subtitle_mode)

	subtitle_rgba_random_zoomed=ScriptClip(subtitle_rgba,"FAST_ZOOM(dstx=PSEUDO_RANDOM(Round(Width()-((50*1.5)*2)))+(50*1.5),dsty=PSEUDO_RANDOM(Round(Height()-((50*1.5)*2)))+(50*1.5),factor=(Float(PSEUDO_RANDOM(65536))/65536.0*1.0)+0.5)")

	return _SUBTITLE_FX_POST(clip,subtitle_rgba_random_zoomed,first_frame,last_frame)
}

function SUBTITLE_FX_RANDOM_SCALE(clip clip,string text,int "x",int "y",int "first_frame",int "last_frame",string "font",string "effects",int "size",int "text_color",int "halo_color",string "subtitle_mode"){
	first_frame=Default(first_frame,0)
	last_frame=Default(last_frame,Framecount(clip)-1)

	Assert(IsYUV(clip),"SUBTITLE_FX_RANDOM_SCALE(): clip only support YUV format")

	subtitle_clip=_SUBTITLE_FX_PRE_OPAQUE(clip,color_black,text,x,y,first_frame,last_frame+1,font,effects,size,text_color,halo_color,subtitle_mode)

	subtitle_clip_random_zoomed=ScriptClip(subtitle_clip,"FAST_ZOOM(dstx=PSEUDO_RANDOM(Round(Width()-((50*1.5)*2)))+(50*1.5),dsty=PSEUDO_RANDOM(Round(Height()-((50*1.5)*2)))+(50*1.5),factor=(Float(PSEUDO_RANDOM(65536))/65536.0*1.0)+0.5)")

	subtitle_clip_random_zoomed_resized=RESIZE_TO_REF_CLIP(subtitle_clip_random_zoomed,clip)
	clip_with_subtitle=Overlay(clip,subtitle_clip_random_zoomed_resized,opacity=0.75,mode="Exclusion",pc_range=true)
	clip_with_subtitle=MergeChroma(clip_with_subtitle,clip)
	return clip_with_subtitle
	#return OVERWRITE_RANGE(clip,clip_with_subtitle,first_frame,last_frame)
}

# chromatic aberration
function DISPERSION(clip clip,float offset){
	clip_rgb=ConvertToRGB24(clip)
	clip_r=FAST_ZOOM(ShowRed(clip_rgb),factor=1.0+offset,extend=true)
	clip_g=ShowGreen(clip_rgb)
	clip_b=FAST_ZOOM(ShowBlue(clip_rgb),factor=1.0-offset,extend=true)
	return MergeRGB(clip_r,clip_g,clip_b,pixel_type="RGB24")
}

function CHARLOTTE_DISPERSION(clip clip){
	return DISPERSION(Tweak(clip,sat=0.8,bright=32.0),-0.005)
}

function CHARLOTTE_SCALE_WIPE_IN(clip clip,string mode,int wipe_direction,int scale_wipe_length){
	return SCALE_WIPE_IN(clip,mode,wipe_direction,10.0,scale_wipe_length)
}

function CHARLOTTE_SCALE_WIPE_OUT(clip clip,string mode,int wipe_direction,int scale_wipe_length){
	return SCALE_WIPE_OUT(clip,mode,wipe_direction,10.0,scale_wipe_length)
}

function EXTEND_ONE_FRAME(clip clip){
        return clip+BlankClip(clip,length=1,color=color_black)
}

function UNDO_EXTEND_ONE_FRAME(clip clip){
        return Trim(clip,0,Framecount(clip)-2)
}

global subtitle_clip_width=1280
global subtitle_clip_height=720

subtitle_x=50*1.5
subtitle_y=395*1.5
global subtitle_front_fade_count=8
global subtitle_rear_fade_count=8
global subtitle_font="MS Gothic"
global subtitle_effects="b"
global subtitle_size=32*1.5
global subtitle_text_color=color_white
global subtitle_halo_color=color_black

function SUBTITLE_FX(clip clip,string text,float x,float y,int start_frame,int end_frame,bool "is_title"){
	is_title=Default(is_title,false)

	text_color=is_title?color_orange:subtitle_text_color

	return SUBTITLE_FX_FADE_IN_FADE_OUT(clip,text,Round(x),Round(y),start_frame,end_frame,subtitle_front_fade_count,subtitle_rear_fade_count,subtitle_font,subtitle_effects,Round(subtitle_size),text_color,subtitle_halo_color)
}

function SUBTITLE_FX_SPELL(clip clip,string text,int start_num_frames,int end_num_frames){
	font="MS Mincho"
	effects="c"
	size=64*1.5
	#text_color=OVERWRITE_SUBTITLE_COLOR_ALPHA(color_magenta,$40)
	#halo_color=OVERWRITE_SUBTITLE_COLOR_ALPHA(color_magenta,$40)
	text_color=color_white
	halo_color=color_black
	x=subtitle_clip_width/2
	y=(subtitle_clip_height/2)-(size/2)

	frame_count=Framecount(clip)
	clip_yv12=ConvertToYV12(clip)
	one_pass_clip=SUBTITLE_FX_RANDOM_SCALE(clip_yv12,text,Round(x),Round(y),0,start_num_frames-1,font,effects,Round(size),text_color,halo_color)
	one_pass_clip=EXTEND_ONE_FRAME(one_pass_clip)
	two_pass_clip=SUBTITLE_FX_RANDOM_SCALE(one_pass_clip,text,Round(x),Round(y),frame_count-end_num_frames,frame_count-1,font,effects,Round(size),text_color,halo_color)
	return UNDO_EXTEND_ONE_FRAME(two_pass_clip)
}

### inherit end ###

######## Pre Combine ########

### inherit start ###

function SPELL(string trim_func_01,clip clip_01,string trim_func_02,clip clip_02, \
		string trim_func_03_01,clip clip_03_01,string trim_func_03_02,clip clip_03_02,string trim_func_04_01,clip clip_04_01,string trim_func_04_02,clip clip_04_02, \
		string trim_func_05_01,clip clip_05_01,string trim_func_05_02,clip clip_05_02,string trim_func_06_01,clip clip_06_01,string trim_func_06_02,clip clip_06_02, \
		string trim_func_07_01,clip clip_07_01,string trim_func_07_02,clip clip_07_02,string trim_func_08_01,clip clip_08_01,string trim_func_08_02,clip clip_08_02){
	spell_clip=SUBTITLE_FX_SPELL(CHARLOTTE_SCALE_WIPE_OUT(FadeIn0(CHARLOTTE_DISPERSION(Apply(trim_func_01,clip_01,38)),11),"y",-1,4),"我他人を思う",11,4) \
		+SUBTITLE_FX_SPELL(CHARLOTTE_SCALE_WIPE_OUT(CHARLOTTE_SCALE_WIPE_IN(CHARLOTTE_DISPERSION(Apply(trim_func_02,clip_02,38)),"y",1,4),"y",-1,3),"絶望の旋律",4,3) \
		+SUBTITLE_FX_SPELL(CHARLOTTE_SCALE_WIPE_OUT(CHARLOTTE_SCALE_WIPE_IN(CHARLOTTE_DISPERSION(Apply(trim_func_03_01,clip_03_01,19)),"y",1,4),"x",1,4),"恋と炎",4,4) \
		+SUBTITLE_FX_SPELL(CHARLOTTE_SCALE_WIPE_OUT(CHARLOTTE_SCALE_WIPE_IN(CHARLOTTE_DISPERSION(Apply(trim_func_03_02,clip_03_02,23)),"x",-1,4),"y",-1,6),"刹那の本気",4,6) \
		+SUBTITLE_FX_SPELL(CHARLOTTE_SCALE_WIPE_OUT(CHARLOTTE_SCALE_WIPE_IN(CHARLOTTE_DISPERSION(Apply(trim_func_04_01,clip_04_01,11)),"y",1,3),"y",-1,5),"いつか聴いた音",3,5) \
		+SUBTITLE_FX_SPELL(CHARLOTTE_SCALE_WIPE_OUT(CHARLOTTE_SCALE_WIPE_IN(CHARLOTTE_DISPERSION(Apply(trim_func_04_02,clip_04_02,29)),"y",1,4),"y",-1,7),"気づかなかった幸せ",4,7) \
		+SUBTITLE_FX_SPELL(CHARLOTTE_SCALE_WIPE_OUT(CHARLOTTE_SCALE_WIPE_IN(CHARLOTTE_DISPERSION(Apply(trim_func_05_01,clip_05_01,7)),"y",1,3),"y",1,2),"逃避行の果てに",3,2) \
		+SUBTITLE_FX_SPELL(CHARLOTTE_SCALE_WIPE_OUT(CHARLOTTE_SCALE_WIPE_IN(CHARLOTTE_DISPERSION(Apply(trim_func_05_02,clip_05_02,28)),"y",-1,6),"x",1,5),"邂逅",6,5) \
		+SUBTITLE_FX_SPELL(CHARLOTTE_SCALE_WIPE_OUT(CHARLOTTE_SCALE_WIPE_IN(CHARLOTTE_DISPERSION(Apply(trim_func_06_01,clip_06_01,9)),"x",-1,4),"x",1,4),"ここにない世界",4,4) \
		+SUBTITLE_FX_SPELL(CHARLOTTE_SCALE_WIPE_OUT(CHARLOTTE_SCALE_WIPE_IN(CHARLOTTE_DISPERSION(Apply(trim_func_06_02,clip_06_02,24)),"x",-1,3),"x",1,4),"略奪",3,4) \
		+SUBTITLE_FX_SPELL(CHARLOTTE_SCALE_WIPE_OUT(CHARLOTTE_SCALE_WIPE_IN(CHARLOTTE_DISPERSION(Apply(trim_func_07_01,clip_07_01,29)),"x",1,6),"x",-1,14),"シャーロット",6,14) \
		+SUBTITLE_FX_SPELL(FADE_OUT_WITH_BRIGHTNESS_OFFSET(CHARLOTTE_SCALE_WIPE_IN(CHARLOTTE_DISPERSION(Apply(trim_func_07_02,clip_07_02,13)),"x",1,5),3),"約束",5,3) \
		+SUBTITLE_FX_SPELL(FADE_IN_WITH_BRIGHTNESS_OFFSET(CHARLOTTE_DISPERSION(Apply(trim_func_08_01,clip_08_01,19)),3),"これからの記録",3,8)
	return Dissolve(ConvertToYV12(spell_clip),Apply(trim_func_08_02,clip_08_02,29),8)
}

### inherit end ###

spell_01=SPELL("TRIM_MIDDLE_CLIP",charlotte_12_yuu_promise_nao_under_sunset,"TRIM_MIDDLE_CLIP",charlotte_02_nao_and_kazuki_s_genie,"TRIM_MIDDLE_CLIP",charlotte_07_yuu_kick_cups_toward_yumi_02,"TRIM_MIDDLE_CLIP",charlotte_07_yuu_kick_cups_toward_yumi_01,"TRIM_LAST_CLIP",charlotte_11_burned_witches,"TRIM_MIDDLE_CLIP",charlotte_11_tsutsumiuchi_see_comet_core, \
	"TRIM_MIDDLE_CLIP",charlotte_12_nao_and_yuu_make_deal_01,"TRIM_MIDDLE_CLIP",charlotte_09_nao_hold_yuu_s_hand_02,"TRIM_LAST_CLIP",charlotte_06_ayumi_use_collapse_02,"TRIM_FIRST_CLIP",charlotte_06_ayumi_fall_down_01,"TRIM_MIDDLE_CLIP",charlotte_02_nao_alone,"TRIM_MIDDLE_CLIP",charlotte_01_joujirou_stand,"TRIM_MIDDLE_CLIP",charlotte_08_yusa_and_dog,"TRIM_FIRST_CLIP",charlotte_05_nao_fishing)

spell_01

### prefetch: 5,2

### ###

spell_02=SPELL("TRIM_LAST_CLIP",charlotte_10_time_leap,"TRIM_MIDDLE_CLIP",charlotte_13_yuu_open_shield_and_thinking,"TRIM_MIDDLE_CLIP",charlotte_01_mishima_laugh_like_a_cat,"TRIM_FIRST_CLIP",charlotte_03_joujirou_hit_suspicious_person,"TRIM_MIDDLE_CLIP",charlotte_04_yusa_reisei_in_baseball_field,"TRIM_MIDDLE_CLIP",charlotte_04_yusa_nakanaori_06, \
	"TRIM_MIDDLE_CLIP",charlotte_08_sara_on_couch,"TRIM_MIDDLE_CLIP",charlotte_09_sara_singing_02,"TRIM_MIDDLE_CLIP",charlotte_13_girl_cure_old_man,"TRIM_FIRST_CLIP",charlotte_11_kumagami_scream,"TRIM_MIDDLE_CLIP",charlotte_10_glass_broken_behind_konishi,"TRIM_FIRST_CLIP",charlotte_03_misa_use_fire_02,"TRIM_FIRST_CLIP",charlotte_07_yuu_eat_danko_02,"TRIM_LAST_CLIP",charlotte_05_saitou_falling_02)

### export clip: spell_02

### prefetch: 5,2

### ###

######## Function ########

function SUBTITLE_RIPPLE(clip clip,int start_frame,int end_frame,bool is_spell){
	num_frames=32
	ripple_speed=7.0
	ripple_start_amp=16

	ass_align=113
	ass_font_size=72
	ass_preline_duration=16
	ass_time_shift=-6

	ripple_start_frame=start_frame-(ass_preline_duration)+ass_time_shift
	ycoord=is_spell?ass_align+(ass_font_size/2):Height(clip)-(ass_align+(ass_font_size/2))
	return EffectRipples2(clip,ripple_start_frame,ripple_start_frame+num_frames,speed=ripple_speed,xcoord=Width(clip)/2,ycoord=ycoord,amp=ripple_start_amp,eamp=1)
}

function SCALE_OUT(clip clip,int num_frames){
	scale_out_clip=ScriptClip(clip,"FAST_ZOOM(factor=Spline(current_frame,0,1.0,Framecount()-("+String(num_frames)+"),1.0,Framecount(),0.0))")
	OVERWRITE_RANGE(clip,scale_out_clip,Framecount(clip)-num_frames,Framecount(clip)-1)
}

######## Pre Combine ########

fade_length=12

blank_out=BlankClip(charlotte_clean_op,length=2,color=color_black)

charlotte_08_sara_sing_for_kazuki_02_trimmed=SCALE_OUT(TRIM_FIRST_CLIP(charlotte_08_sara_sing_for_kazuki_02,79),19)
charlotte_02_nao_s_mother_smile_trimmed=SCALE_OUT(TRIM_FIRST_CLIP(charlotte_02_nao_s_mother_smile,149),19)

######## Combine ########

# charlotte_clean_op_01 0
# charlotte_clean_op_02 3386
# charlotte_clean_op_03 6763
# charlotte_clean_op_04 7606



charlotte_op_t01=charlotte_clean_op_01
charlotte_op_t02=AUDIO_DUB_TONE(last,samplerate=48000,channels=2,type="Silence")
charlotte_op_t03=FADE_IN_WITH_BRIGHTNESS_OFFSET(TRIM_FIRST_CLIP(charlotte_10_shunsuke_kumagami_see_city,77),fade_length)+TRIM_LAST_CLIP(charlotte_08_yusa_singing,84)+TRIM_FIRST_CLIP(charlotte_13_yuu_jump_down,65)+TRIM_FIRST_CLIP(charlotte_11_nao_punched_02,71) \
	+TRIM_LAST_CLIP(charlotte_06_oikawa_nomura_konishi_around_ayumi,58)+TRIM_FIRST_CLIP(charlotte_04_misa_hit_baseball,20)+blank_out+TRIM_MIDDLE_CLIP(charlotte_01_key_coffee_02,23)+TRIM_MIDDLE_CLIP(charlotte_08_sara_walk_nearby_yuu_02,23)+TRIM_MIDDLE_CLIP(charlotte_12_yusa_hug_parent,37) \
	+TRIM_MIDDLE_CLIP(charlotte_12_medoki_shichino_maedomari,76)+TRIM_MIDDLE_CLIP(charlotte_05_nao_and_yuu_see_night_scene,80)

charlotte_op_t04=TRIM_LAST_CLIP(charlotte_03_joujirou_and_yuu_in_school_restaurant,154)+TRIM_LAST_CLIP(charlotte_13_yuu_touch_eye_then_break_glass,148)

charlotte_op_t05=FADE_IN_WITH_BRIGHTNESS_OFFSET(TRIM_MIDDLE_CLIP(charlotte_07_telescope_and_rain,77),fade_length)+TRIM_MIDDLE_CLIP(charlotte_13_yuu_see_explosion,92) \
	+blank_out+TRIM_MIDDLE_CLIP(charlotte_07_street,58)+FADE_OUT_WITH_BRIGHTNESS_OFFSET(TRIM_MIDDLE_CLIP(charlotte_12_nao_and_yuu_make_deal_02,152),fade_length)
charlotte_op_t06=FADE_IN_WITH_BRIGHTNESS_OFFSET(TRIM_MIDDLE_CLIP(charlotte_13_shunsuke_see_airplane,79),fade_length)+TRIM_FIRST_CLIP(charlotte_07_yumi_ask_yuu_to_go_outside_02,75)+TRIM_LAST_CLIP(charlotte_12_misa_eat_soba_and_cry,78)+TRIM_LAST_CLIP(charlotte_05_yuu_on_field_01,38)+TRIM_LAST_CLIP(charlotte_05_yuu_on_field_02,40) \
	+TRIM_MIDDLE_CLIP(charlotte_05_nao_and_yuu_talking_in_forest,152)+TRIM_MIDDLE_CLIP(charlotte_12_shunsuke_not_reconciled,77)+TRIM_FIRST_CLIP(charlotte_08_sara_sing_for_kazuki_02_trimmed,79)
charlotte_op_t07=charlotte_clean_op_02
charlotte_op_t08=FADE_IN_WITH_BRIGHTNESS_OFFSET(TRIM_FIRST_CLIP(charlotte_09_nao_with_casual_wear,77),fade_length)+TRIM_LAST_CLIP(charlotte_02_joujirou_dash_to_sandwitch,84)+TRIM_MIDDLE_CLIP(charlotte_11_yuu_use_collapse_02,65)+TRIM_MIDDLE_CLIP(charlotte_01_joujirou_ready_to_dash,71) \
	+TRIM_MIDDLE_CLIP(charlotte_02_kumagami_walk_02,58)+TRIM_MIDDLE_CLIP(charlotte_06_konishi_hate,20)+blank_out+TRIM_MIDDLE_CLIP(charlotte_04_misa_run_toward_home_plate,23)+TRIM_MIDDLE_CLIP(charlotte_06_nao_kick_joujirou_to_outside_02,23)+TRIM_LAST_CLIP(charlotte_04_nao_cheer_up,37) \
	+TRIM_FIRST_CLIP(charlotte_06_ayumi_turn_on_tv,76)+TRIM_LAST_CLIP(charlotte_12_yusa_show_risotto,80)
charlotte_op_t09=FADE_OUT_WITH_BRIGHTNESS_OFFSET(TRIM_FIRST_CLIP(charlotte_13_courageous_girl_stand_ahead_of_yuu_02,154),fade_length)

charlotte_op_t10=FADE_IN_WITH_BRIGHTNESS_OFFSET(TRIM_FIRST_CLIP(charlotte_03_misa_angry,77),fade_length)+TRIM_MIDDLE_CLIP(charlotte_11_medoki_ask_yuu,76)+TRIM_MIDDLE_CLIP(charlotte_06_ayumi_get_across_window,77)+TRIM_FIRST_CLIP(charlotte_01_yuu_push_yumi_away,77) \
	+TRIM_LAST_CLIP(charlotte_04_yusa_appear,76)+TRIM_MIDDLE_CLIP(charlotte_05_joujirou_gachimuchi,77)+TRIM_LAST_CLIP(charlotte_10_yusa_is_found,77)+TRIM_MIDDLE_CLIP(charlotte_07_yuu_grab_needle,77) \
	+Trim(charlotte_01_ayumi_exciting,130,-77)+FADE_OUT_WITH_BRIGHTNESS_OFFSET(TRIM_FIRST_CLIP(charlotte_03_yusa_stand_ahead_of_car_and_people,76),fade_length)
charlotte_op_t11=FADE_IN_WITH_BRIGHTNESS_OFFSET(TRIM_MIDDLE_CLIP(charlotte_11_ayumi_call_shunsuke_brother,154),fade_length)+TRIM_MIDDLE_CLIP(charlotte_01_nao_kick_yuu,153)+TRIM_LAST_CLIP(charlotte_08_sara_eat_raamen_and_kiss_bowl,154)+TRIM_FIRST_CLIP(charlotte_02_nao_s_mother_smile_trimmed,149)

charlotte_op_t12=AUDIO_DUB_TONE(spell_02,samplerate=48000,channels=2,type="Silence")
charlotte_op_t13=FADE_IN_WITH_BRIGHTNESS_OFFSET(TRIM_MIDDLE_CLIP(charlotte_04_misa_prepare_to_hit_baseball,77),fade_length)+TRIM_LAST_CLIP(charlotte_10_shunsuke_leave_from_yuu_ayumi,84)+TRIM_FIRST_CLIP(charlotte_09_yuu_pass_through_wall,65)+TRIM_FIRST_CLIP(charlotte_03_shou_cry_ahead_of_misa,71) \
	+TRIM_FIRST_CLIP(charlotte_07_yamanote_train,58)+TRIM_MIDDLE_CLIP(charlotte_03_yusa_eat_marshmallow,20)+blank_out+TRIM_MIDDLE_CLIP(charlotte_06_nao_climb_chain_link_fence,23)+TRIM_LAST_CLIP(charlotte_13_yuu_control_rock_toward_people,23)+TRIM_MIDDLE_CLIP(charlotte_13_yuu_under_moon,37) \
	+TRIM_LAST_CLIP(charlotte_09_nao_get_smart_phone_case_03,76)+FADE_OUT_WITH_BRIGHTNESS_OFFSET(TRIM_LAST_CLIP(charlotte_09_shunsuke_hear_yuu_coming,78),fade_length)
charlotte_op_t14=charlotte_clean_op_03+FADE_OUT_WITH_BRIGHTNESS_OFFSET(TRIM_MIDDLE_CLIP(charlotte_01_otosaka_family,80),fade_length)
charlotte_op_t15=Dissolve(TRIM_FIRST_CLIP(charlotte_02_student_association,227+fade_length),charlotte_clean_op_04,fade_length)+BlankClip(charlotte_clean_op,length=24*5,color=color_black)



charlotte_op_mute=charlotte_op_t01+charlotte_op_t02+charlotte_op_t03+charlotte_op_t04 \
	+charlotte_op_t05+charlotte_op_t06+charlotte_op_t07+charlotte_op_t08+charlotte_op_t09 \
	+charlotte_op_t10+charlotte_op_t11 \
	+charlotte_op_t12+charlotte_op_t13+charlotte_op_t14+charlotte_op_t15

charlotte_op_mute

######## Subtitle ########

#ConvertToRGB32()

#SUBTITLE_FX("Bravely You//Lia|- by fielia@AVISynth",-subtitle_x,subtitle_x,7695,7780,true)
SUBTITLE_RIPPLE(7695,7780,false)

SUBTITLE_RIPPLE(166,303,false)
SUBTITLE_RIPPLE(319,504,false)

SUBTITLE_RIPPLE(550,846,false)
SUBTITLE_RIPPLE(857,1126,false)

SUBTITLE_RIPPLE(1165,1201,true)
SUBTITLE_RIPPLE(1204,1239,true)
SUBTITLE_RIPPLE(1241,1279,true)
SUBTITLE_RIPPLE(1280,1316,true)
SUBTITLE_RIPPLE(1318,1355,true)
SUBTITLE_RIPPLE(1356,1394,true)
SUBTITLE_RIPPLE(1395,1431,true)
SUBTITLE_RIPPLE(1433,1472,true)

SUBTITLE_RIPPLE(1465,1533,false)
SUBTITLE_RIPPLE(1542,1766,false)
SUBTITLE_RIPPLE(1772,1841,false)
SUBTITLE_RIPPLE(1849,2163,false)

SUBTITLE_RIPPLE(2391,2529,false)
SUBTITLE_RIPPLE(2543,2758,false)

SUBTITLE_RIPPLE(2773,3072,false)
SUBTITLE_RIPPLE(3081,3383,false)

SUBTITLE_RIPPLE(3389,3426,true)
SUBTITLE_RIPPLE(3427,3464,true)
SUBTITLE_RIPPLE(3466,3503,true)
SUBTITLE_RIPPLE(3504,3542,true)
SUBTITLE_RIPPLE(3543,3580,true)
SUBTITLE_RIPPLE(3581,3618,true)
SUBTITLE_RIPPLE(3619,3656,true)
SUBTITLE_RIPPLE(3658,3698,true)

SUBTITLE_RIPPLE(3690,3759,false)
SUBTITLE_RIPPLE(3764,3992,false)
SUBTITLE_RIPPLE(3998,4064,false)
SUBTITLE_RIPPLE(4073,4386,false)

SUBTITLE_RIPPLE(4460,4532,false)
SUBTITLE_RIPPLE(4538,4609,false)
SUBTITLE_RIPPLE(4612,4684,false)
SUBTITLE_RIPPLE(4691,4764,false)
SUBTITLE_RIPPLE(4769,4838,false)
SUBTITLE_RIPPLE(4845,4915,false)
SUBTITLE_RIPPLE(4922,4992,false)
SUBTITLE_RIPPLE(4996,5233,false)

SUBTITLE_RIPPLE(5844,5881,true)
SUBTITLE_RIPPLE(5882,5919,true)
SUBTITLE_RIPPLE(5922,5958,true)
SUBTITLE_RIPPLE(5959,5997,true)
SUBTITLE_RIPPLE(5998,6035,true)
SUBTITLE_RIPPLE(6036,6073,true)
SUBTITLE_RIPPLE(6075,6111,true)
SUBTITLE_RIPPLE(6112,6152,true)

SUBTITLE_RIPPLE(6145,6217,false)
SUBTITLE_RIPPLE(6219,6448,false)
SUBTITLE_RIPPLE(6451,6523,false)
SUBTITLE_RIPPLE(6528,6757,false)

SUBTITLE_RIPPLE(6759,6828,false)
SUBTITLE_RIPPLE(6835,7061,false)
SUBTITLE_RIPPLE(7066,7135,false)
SUBTITLE_RIPPLE(7144,7457,false)

#LoadPlugin("VSFilter.dll")
TextSub("charlotte-op.ass")

######## Thumbnail ########

is_thumbnail=false

is_thumbnail?charlotte_op_mute:last

######## Music ########

bgm_48khz=SSRC(WAVSource("src\charlotte-op-ed-01.wav"),48000)
AudioDub(bgm_48khz)



thumbnail=Trim(3462,-24*5)
is_thumbnail?thumbnail:last

""")

######## Post Processing ########

ConvertToYV12()
#ConvertToYUY2()
#ConvertToRGB24()

TCPServer()
