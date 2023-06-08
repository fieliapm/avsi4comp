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

Import("gundam_suisei_no_majo-season_01-tv-common.avsi")

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

function SCALE_CG(clip cg,float center_x,float center_y,float scale_start,float scale_end){
	cg_frame_count=Framecount(cg)

	return ScriptClip(cg,"FAST_ZOOM(srcx="+String(center_x)+",srcy="+String(center_y)+",dstx="+String(center_x)+",dsty="+String(center_y)+",factor=Spline(current_frame,0,"+String(scale_start)+","+String(cg_frame_count)+","+String(scale_end)+"))")
}

function MOVE_CG(clip cg,int dir_x,int dir_y,float move_offset,float scale){
	cg_frame_count=Framecount(cg)
	cg_width_half=Width(cg)/2
	cg_height_half=Height(cg)/2
	move_offset_half=move_offset*0.5

	return ScriptClip(cg,"FAST_ZOOM(dstx=Spline(current_frame,0,"+String(cg_width_half)+"-("+String(move_offset_half)+"*("+String(dir_x)+")),"+String(cg_frame_count)+","+String(cg_width_half)+"+("+String(move_offset_half)+"*("+String(dir_x)+")),cubic=false)," \
		+"dsty=Spline(current_frame,0,"+String(cg_height_half)+"-("+String(move_offset_half)+"*("+String(dir_y)+")),"+String(cg_frame_count)+","+String(cg_height_half)+"+("+String(move_offset_half)+"*("+String(dir_y)+")),cubic=false),factor="+String(scale)+",extend=true)")
}

######## Pre Combine ########

fade_length=18

######## Combine ########

# gundam_suisei_no_majo_season_01_tv_clean_op_01 19
# gundam_suisei_no_majo_season_01_tv_clean_op_02 303/438 1860/1995/2131/2266
# gundam_suisei_no_majo_season_01_tv_clean_op_03 399/534

# gundam_suisei_no_majo_season_01_tv_clean_op_04 574
# gundam_suisei_no_majo_season_01_tv_clean_op_05 1113

# gundam_suisei_no_majo_season_01_tv_clean_op_06 1379/3241
# gundam_suisei_no_majo_season_01_tv_clean_op_07 1656/3518
# gundam_suisei_no_majo_season_01_tv_clean_op_08 4130
# gundam_suisei_no_majo_season_01_tv_clean_op_09 4331



gundam_suisei_no_majo_season_01_tv_op_t01=BlankClip(gundam_suisei_no_majo_season_01_tv_clean_op,length=19,color=color_black)+gundam_suisei_no_majo_season_01_tv_clean_op_01
gundam_suisei_no_majo_season_01_tv_op_t02=gundam_suisei_no_majo_season_01_tv_clean_op_02+TRIM_LAST_CLIP(gundam_suisei_no_majo_season_01_tv_01_aerial_permet_01,39)+TRIM_LAST_CLIP(gundam_suisei_no_majo_season_01_tv_01_aerial_permet_02,68)+TRIM_FIRST_CLIP(gundam_suisei_no_majo_season_01_tv_01_aerial_funnel,28)+gundam_suisei_no_majo_season_01_tv_clean_op_03

gundam_suisei_no_majo_season_01_tv_op_t03=gundam_suisei_no_majo_season_01_tv_clean_op_04+gundam_suisei_no_majo_season_01_tv_clean_op_05
gundam_suisei_no_majo_season_01_tv_op_t04=TRIM_MIDDLE_CLIP(gundam_suisei_no_majo_season_01_tv_12_aerial_fight_with_lfrith_ur_thorn,142)+TRIM_MIDDLE_CLIP(gundam_suisei_no_majo_season_01_tv_12_aerial_fight_with_lfrith,101) \
	+TRIM_FIRST_CLIP(gundam_suisei_no_majo_season_01_tv_05_elan_see_suletta,9)+TRIM_MIDDLE_CLIP(gundam_suisei_no_majo_season_01_tv_04_guel_bow_to_suletta,8)+TRIM_FIRST_CLIP(gundam_suisei_no_majo_season_01_tv_10_elan_touch_suletta,8)+TRIM_FIRST_CLIP(gundam_suisei_no_majo_season_01_tv_03_guel_propose_to_suletta,9) \
	+TRIM_FIRST_CLIP(gundam_suisei_no_majo_season_01_tv_09_aerial_evade_from_ms_attack,61)+TRIM_FIRST_CLIP(gundam_suisei_no_majo_season_01_tv_06_elan_see_spirit,77)+TRIM_LAST_CLIP(gundam_suisei_no_majo_season_01_tv_06_spirit_surround_pharact,66)

gundam_suisei_no_majo_season_01_tv_op_t05=TRIM_FIRST_CLIP(gundam_suisei_no_majo_season_01_tv_07_incubation_party,68)+TRIM_FIRST_CLIP(gundam_suisei_no_majo_season_01_tv_07_miorine_see_fundraising,28)+TRIM_MIDDLE_CLIP(gundam_suisei_no_majo_season_01_tv_07_miorine_beat_suletta,39) \
	+TRIM_FIRST_CLIP(gundam_suisei_no_majo_season_01_tv_03_miorine_tell_suletta_off,68)+TRIM_FIRST_CLIP(gundam_suisei_no_majo_season_01_tv_10_students_see_suletta_control_robot,28)+TRIM_MIDDLE_CLIP(gundam_suisei_no_majo_season_01_tv_10_suletta_control_robot,40)
gundam_suisei_no_majo_season_01_tv_op_t06=TRIM_FIRST_CLIP(gundam_suisei_no_majo_season_01_tv_02_miorine_play_mobile_game,68)+TRIM_FIRST_CLIP(gundam_suisei_no_majo_season_01_tv_06_chuatury_squat_and_see_nika_thinking,28)+TRIM_FIRST_CLIP(gundam_suisei_no_majo_season_01_tv_11_earth_students_take_launch,39) \
	+TRIM_MIDDLE_CLIP(gundam_suisei_no_majo_season_01_tv_10_sophie_show_gund_cm_to_norea,68+28+40)

gundam_suisei_no_majo_season_01_tv_op_t07=MOVE_CG(TRIM_FIRST_CLIP(gundam_suisei_no_majo_season_01_tv_08_earth_students_discuss,67),0,1,Width(gundam_suisei_no_majo_season_01_tv_clean_op)/10.0,1.1)+MOVE_CG(TRIM_LAST_CLIP(gundam_suisei_no_majo_season_01_tv_09_earth_students_in_classroom,67),1,0,Width(gundam_suisei_no_majo_season_01_tv_clean_op)/10.0,1.1) \
	+MOVE_CG(TRIM_FIRST_CLIP(gundam_suisei_no_majo_season_01_tv_06_earth_students_dorm,68),0,-1,Width(gundam_suisei_no_majo_season_01_tv_clean_op)/10.0,1.1)+MOVE_CG(TRIM_LAST_CLIP(gundam_suisei_no_majo_season_01_tv_05_earth_students_dorm,68),-1,0,Width(gundam_suisei_no_majo_season_01_tv_clean_op)/10.0,1.1)+TRIM_MIDDLE_CLIP(gundam_suisei_no_majo_season_01_tv_04_miorine_talk_with_suletta,17+17)
gundam_suisei_no_majo_season_01_tv_op_t08=TRIM_LAST_CLIP(gundam_suisei_no_majo_season_01_tv_11_miorine_hug_suletta_01,136)+TRIM_FIRST_CLIP(gundam_suisei_no_majo_season_01_tv_11_suletta_hug_miorine,135) \
	+TRIM_FIRST_CLIP(gundam_suisei_no_majo_season_01_tv_08_miorine_lay_on_suletta_s_back,135)+TRIM_FIRST_CLIP(gundam_suisei_no_majo_season_01_tv_08_suletta_see_star_night_on_bike,68)+TRIM_FIRST_CLIP(gundam_suisei_no_majo_season_01_tv_08_suletta_and_miorine_ride_bike_01,30)+FADE_OUT_WITH_BRIGHTNESS_OFFSET(TRIM_FIRST_CLIP(gundam_suisei_no_majo_season_01_tv_02_ms_surround_aerial,31),fade_length)

gundam_suisei_no_majo_season_01_tv_op_t09=gundam_suisei_no_majo_season_01_tv_clean_op_06+gundam_suisei_no_majo_season_01_tv_clean_op_07+TRIM_FIRST_CLIP(gundam_suisei_no_majo_season_01_tv_04_ms_fire_to_resist,66) \
	+TRIM_FIRST_CLIP(gundam_suisei_no_majo_season_01_tv_12_miorine_and_suletta_in_front_of_aerial,135)+TRIM_LAST_CLIP(gundam_suisei_no_majo_season_01_tv_09_guel_stand_on_path_under_sunset,135) \
	+TRIM_MIDDLE_CLIP(gundam_suisei_no_majo_season_01_tv_05_aerial_walking,61)+FADE_OUT_WITH_BRIGHTNESS_OFFSET(TRIM_FIRST_CLIP(gundam_suisei_no_majo_season_01_tv_03_aerial_funnel,77),fade_length)+gundam_suisei_no_majo_season_01_tv_clean_op_08
gundam_suisei_no_majo_season_01_tv_op_t10=gundam_suisei_no_majo_season_01_tv_clean_op_09+BlankClip(gundam_suisei_no_majo_season_01_tv_clean_op,length=24*1,color=color_black)



gundam_suisei_no_majo_season_01_tv_op_mute=gundam_suisei_no_majo_season_01_tv_op_t01+gundam_suisei_no_majo_season_01_tv_op_t02 \
	+gundam_suisei_no_majo_season_01_tv_op_t03+gundam_suisei_no_majo_season_01_tv_op_t04 \
	+gundam_suisei_no_majo_season_01_tv_op_t05+gundam_suisei_no_majo_season_01_tv_op_t06 \
	+gundam_suisei_no_majo_season_01_tv_op_t07+gundam_suisei_no_majo_season_01_tv_op_t08 \
	+gundam_suisei_no_majo_season_01_tv_op_t09+gundam_suisei_no_majo_season_01_tv_op_t10

gundam_suisei_no_majo_season_01_tv_op_mute

### export clip: gundam_suisei_no_majo_season_01_tv_op_mute

### prefetch: 5,2

### ###

######## Subtitle ########

### inherit start ###

#global subtitle_heavy_halo_width=1
global subtitle_clip_width=1920
global subtitle_clip_height=1080

subtitle_x=50*2.25
subtitle_y=395*2.25
global subtitle_front_fade_count=24
global subtitle_rear_fade_count=8
global subtitle_font="MS Mincho"
global subtitle_effects="b"
global subtitle_size=32*2.25
global subtitle_text_color=color_white
global subtitle_halo_color=color_black
global subtitle_outside_halo_color=color_gray10

function SUBTITLE_FX(clip clip,string text,float x,float y,int start_frame,int end_frame,bool "is_furigana",bool "is_title"){
	is_title=Default(is_title,false)
	is_furigana=Default(is_furigana,false)

	text_color=is_title?color_white:subtitle_text_color
	halo_color=is_title?color_black:subtitle_halo_color
	outside_halo_color=is_title?color_aqua:subtitle_outside_halo_color

	subtitle_mode=is_furigana?"ex":"ex" #"ex_thick_reduce_memory"
	size=is_furigana?subtitle_size*0.5:subtitle_size
	y=is_furigana?y-size:y

	return !is_title?clip:SUBTITLE_FX_FADE_IN_FADE_OUT_DOUBLE_HALO(clip,text,Round(x),Round(y),start_frame,end_frame,subtitle_front_fade_count,subtitle_rear_fade_count,subtitle_font,subtitle_effects,Round(size),text_color,halo_color,outside_halo_color,subtitle_mode)
}

### inherit end ###

ConvertToRGB32(matrix="Rec709")

SUBTITLE_FX("èjïü//YOASOBI|- by fielia@AVISynth",-subtitle_x,subtitle_x,4399,4564,is_title=true)

#LoadPlugin("VSFilter.dll")
TextSub("gundam_suisei_no_majo-season_01-tv-op.ass")

######## Thumbnail ########

is_thumbnail=false

is_thumbnail?ConvertToRGB32(gundam_suisei_no_majo_season_01_tv_op_mute,matrix="Rec709"):last

######## Music ########

bgm_48khz=SSRC(WAVSource("src\èjïü.wav"),48000)
Normalize(AudioDub(bgm_48khz))



thumbnail=Trim(4331,-24*5)



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
