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

Import("super_cub-tv-common.avsi")

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

fade_length=12



super_cub_tv_clean_op_04_ver01_scaled=FAST_ZOOM(ConvertToRGB32(super_cub_tv_clean_op_04_ver01,matrix="Rec709"),srcx=0.0,srcy=0.0,dstx=0.0,dsty=Height(super_cub_tv_clean_op_ver01)/8.0,factor=0.5)
super_cub_tv_clean_op_04_ver02_scaled=FAST_ZOOM(ConvertToRGB32(super_cub_tv_clean_op_04_ver02,matrix="Rec709"),srcx=Width(super_cub_tv_clean_op_ver01),srcy=Height(super_cub_tv_clean_op_ver01),dstx=Width(super_cub_tv_clean_op_ver01),dsty=Height(super_cub_tv_clean_op_ver01)*7.0/8.0,factor=0.5)
super_cub_tv_clean_op_04_bg=BlankClip(super_cub_tv_clean_op_04_ver01_scaled,color=color_deeppink)
super_cub_tv_clean_op_04_pbp=CONVERT_BACK_TO_YV12(Layer(Layer(super_cub_tv_clean_op_04_bg,super_cub_tv_clean_op_04_ver01_scaled),super_cub_tv_clean_op_04_ver02_scaled),matrix="Rec709")



super_cub_tv_clean_op_05_ver01_scaled=FAST_ZOOM(ConvertToRGB32(super_cub_tv_clean_op_05_ver01,matrix="Rec709"),srcx=0.0,srcy=0.0,dstx=0.0,dsty=Height(super_cub_tv_clean_op_ver01)/8.0,factor=0.5)
super_cub_tv_clean_op_05_ver02_scaled=FAST_ZOOM(ConvertToRGB32(super_cub_tv_clean_op_05_ver02,matrix="Rec709"),srcx=Width(super_cub_tv_clean_op_ver01),srcy=Height(super_cub_tv_clean_op_ver01),dstx=Width(super_cub_tv_clean_op_ver01),dsty=Height(super_cub_tv_clean_op_ver01)*7.0/8.0,factor=0.5)
super_cub_tv_clean_op_05_bg=BlankClip(super_cub_tv_clean_op_05_ver01_scaled,color=color_deeppink)
super_cub_tv_clean_op_05_pbp=CONVERT_BACK_TO_YV12(Layer(Layer(super_cub_tv_clean_op_05_bg,super_cub_tv_clean_op_05_ver01_scaled),super_cub_tv_clean_op_05_ver02_scaled),matrix="Rec709")

######## Combine ########

# super_cub_tv_clean_op_00 -22
# super_cub_tv_clean_op_01 2
# super_cub_tv_clean_op_02 572/2094
# super_cub_tv_clean_op_03 1348/2870/4249/4677
# super_cub_tv_clean_op_04 1755/3277/5274
# super_cub_tv_clean_op_05 2003/5998



# 2469 2495 (27), 2496 2512 (17)
# 2513 2535 (23), 2536 2552 (17)
# 2553 2573 (21), 2574 2587 (14)
# 2588 2611 (24), 2612 2628 (17)
# 2629 2655 (27)



op_music_start=22

super_cub_tv_clean_op_00_00=Trim(super_cub_tv_clean_op_00,0,op_music_start-1)
super_cub_tv_clean_op_00_01=Trim(super_cub_tv_clean_op_00,op_music_start,0)

super_cub_tv_op_t01=BlankClip(super_cub_tv_clean_op_ver01,length=2,color=color_black)+super_cub_tv_clean_op_01
#super_cub_tv_op_t01=super_cub_tv_clean_op_00_01+super_cub_tv_clean_op_01
super_cub_tv_op_t02=super_cub_tv_clean_op_02
super_cub_tv_op_t03=TRIM_MIDDLE_CLIP(super_cub_tv_06_koguma_shift_gear_down,32)+TRIM_FIRST_CLIP(super_cub_tv_01_fit_overtake_super_cub,90)+TRIM_FIRST_CLIP(super_cub_tv_04_koguma_wet,48)+TRIM_MIDDLE_CLIP(super_cub_tv_09_shii_sit_and_feel_happy,46) \
	+TRIM_LAST_CLIP(super_cub_tv_05_reiko_ride_post_office_cub_pass_rally_curve_04,36)+TRIM_LAST_CLIP(super_cub_tv_05_post_office_cub_jump,32)+TRIM_MIDDLE_CLIP(super_cub_tv_05_reiko_press_post_office_cub,31)+TRIM_MIDDLE_CLIP(super_cub_tv_10_koguma_use_rear_wheel_to_splash_snow_toward_reiko_02,54)+TRIM_MIDDLE_CLIP(super_cub_tv_10_reiko_and_koguma_ride_in_snow_field,38) \
	+TRIM_MIDDLE_CLIP(super_cub_tv_06_koguma_refuel,32)+TRIM_FIRST_CLIP(super_cub_tv_01_koguma_see_super_cub_and_smile,87)+TRIM_LAST_CLIP(super_cub_tv_12_little_cub,53)+TRIM_FIRST_CLIP(super_cub_tv_11_koguma_see_shii_ride_bicycle,76)
#super_cub_tv_op_t032=super_cub_tv_clean_op_03+super_cub_tv_clean_op_04_ver02
#super_cub_tv_op_t03=Merge(super_cub_tv_op_t03,super_cub_tv_op_t032)

super_cub_tv_op_t04=FADE_OUT_WITH_BRIGHTNESS_OFFSET(TRIM_FIRST_CLIP(super_cub_tv_06_koguma_see_dm_and_lie_down,91),fade_length)

super_cub_tv_op_t05=TRIM_LAST_CLIP(super_cub_tv_02_koguma_run_on_stair,86)+TRIM_MIDDLE_CLIP(super_cub_tv_05_reiko_tweak_post_office_cub,54)+TRIM_MIDDLE_CLIP(super_cub_tv_07_shii_turn_back_and_smile,42) \
	+TRIM_FIRST_CLIP(super_cub_tv_03_toolbox,44)+TRIM_FIRST_CLIP(super_cub_tv_04_koguma_s_motorcycle_license,49)+TRIM_FIRST_CLIP(super_cub_tv_04_koguma_lie_down_under_super_cub,54)+TRIM_MIDDLE_CLIP(super_cub_tv_04_koguma_kicking,46) \
	+Dissolve(Dissolve(Dissolve(Dissolve(SCALE_CG(TRIM_MIDDLE_CLIP(super_cub_tv_07_flower,44),0.5*Width(super_cub_tv_clean_op_ver01),0.5*Height(super_cub_tv_clean_op_ver01),1.0,1.1), \
		MOVE_CG(TRIM_FIRST_CLIP(super_cub_tv_06_koguma_ride_in_hakone_yumoto_01,57),1,0,Width(super_cub_tv_clean_op_ver01)/10.0,1.1),17), \
		MOVE_CG(TRIM_MIDDLE_CLIP(super_cub_tv_12_biwa_lake_night,52),0,1,Height(super_cub_tv_clean_op_ver01)/10.0,1.1),17), \
		MOVE_CG(TRIM_MIDDLE_CLIP(super_cub_tv_06_koguma_ride_toward_enoshima,55),-1,0,Width(super_cub_tv_clean_op_ver01)/10.0,1.1),14), \
		MOVE_CG(TRIM_MIDDLE_CLIP(super_cub_tv_12_sakaikou,44),0,-1,Height(super_cub_tv_clean_op_ver01)/10.0,1.1),17) \
	+TRIM_MIDDLE_CLIP(super_cub_tv_01_honda_motorcycles,47)+TRIM_MIDDLE_CLIP(super_cub_tv_02_koguma_see_mirror_and_touch_hair,108)+FADE_OUT_WITH_BRIGHTNESS_OFFSET(TRIM_MIDDLE_CLIP(super_cub_tv_06_koguma_sit_and_see_seashore,59),fade_length)
#super_cub_tv_op_t05=super_cub_tv_clean_op_02
#super_cub_tv_op_t05=Merge(super_cub_tv_op_t05,super_cub_tv_op_t052)
super_cub_tv_op_t06=TRIM_FIRST_CLIP(Loop(super_cub_tv_11_koguma_shift_gear_up,3,0,0),32)+TRIM_FIRST_CLIP(super_cub_tv_03_koguma_ride_super_cub_across_flower_sea_01,90)+TRIM_MIDDLE_CLIP(super_cub_tv_09_reiko_move_leg_and_skirt,48)+TRIM_MIDDLE_CLIP(super_cub_tv_03_wind_blow_into_koguma_s_skirt_02,46) \
	+TRIM_MIDDLE_CLIP(super_cub_tv_07_super_cub_exhaust,36)+TRIM_MIDDLE_CLIP(super_cub_tv_10_reiko_ride_and_jump,32)+TRIM_LAST_CLIP(super_cub_tv_10_koguma_ride_and_jump,31)+TRIM_MIDDLE_CLIP(super_cub_tv_11_koguma_carry_shii_by_super_cub,54)+TRIM_MIDDLE_CLIP(super_cub_tv_12_seagull_flying_over_sea,38) \
	+TRIM_MIDDLE_CLIP(super_cub_tv_08_koguma_park_super_cub,32)+TRIM_FIRST_CLIP(super_cub_tv_12_koguma_and_reiko_see_shii_touch_sakura_rain,87)+TRIM_LAST_CLIP(super_cub_tv_07_ct110,53)+TRIM_MIDDLE_CLIP(super_cub_tv_04_koguma_shake_skirt,76)
#super_cub_tv_op_t062=super_cub_tv_clean_op_03+super_cub_tv_clean_op_04_ver01
#super_cub_tv_op_t06=Merge(super_cub_tv_op_t06,super_cub_tv_op_t062)

super_cub_tv_op_t07=TRIM_FIRST_CLIP(super_cub_tv_04_koguma_release_oil_drain_plug,179)+TRIM_MIDDLE_CLIP(super_cub_tv_02_koguma_take_off_helmet,209)+TRIM_FIRST_CLIP(super_cub_tv_09_koguma_ride_under_tasogare,190)+TRIM_FIRST_CLIP(Loop(super_cub_tv_05_reiko_park_post_office_cub,7,0,0),178)

super_cub_tv_op_t08=TRIM_MIDDLE_CLIP(super_cub_tv_05_koguma_and_reiko_eat_near_cub,90)+TRIM_MIDDLE_CLIP(super_cub_tv_06_koguma_and_reiko_in_onsen,48)+TRIM_MIDDLE_CLIP(super_cub_tv_06_classmates_eat_kaiseki,46) \
	+TRIM_LAST_CLIP(super_cub_tv_08_shii_ride_bicycle_and_lead_koguma_and_reiko,36)+TRIM_FIRST_CLIP(super_cub_tv_08_shii_failed_to_cover_her_mother,32)+TRIM_MIDDLE_CLIP(super_cub_tv_08_koguma_grab_reiko_s_hand_02,31)+TRIM_MIDDLE_CLIP(super_cub_tv_03_koguma_ride_super_cub_in_country,54)+TRIM_MIDDLE_CLIP(super_cub_tv_11_koguma_drift_super_cub,38+21) \
	+super_cub_tv_clean_op_03
#super_cub_tv_op_t082=Trim(super_cub_tv_clean_op_03,32,0)+BlankClip(super_cub_tv_clean_op_ver01,length=21,color=color_black)+super_cub_tv_clean_op_03
#super_cub_tv_op_t08=Merge(super_cub_tv_op_t08,super_cub_tv_op_t082)
super_cub_tv_op_t09=TRIM_LAST_CLIP(super_cub_tv_12_reiko_shii_koguma_ride_cubs_over_hill,32+87)+TRIM_FIRST_CLIP(super_cub_tv_12_reiko_shii_koguma_ride_cubs,71)+FADE_OUT_WITH_BRIGHTNESS_OFFSET(super_cub_tv_clean_op_04_pbp,fade_length)

super_cub_tv_op_t10=TRIM_FIRST_CLIP(super_cub_tv_01_koguma_stretch,198)+TRIM_MIDDLE_CLIP(super_cub_tv_02_koguma_smile_and_ride_away,202)+TRIM_FIRST_CLIP(super_cub_tv_12_super_cub_and_ct110_in_sakura_rain,76)+super_cub_tv_clean_op_05_pbp+BlankClip(super_cub_tv_clean_op_ver01,length=24*5,color=color_black)



super_cub_tv_op_mute=super_cub_tv_op_t01+super_cub_tv_op_t02+super_cub_tv_op_t03+super_cub_tv_op_t04 \
	+super_cub_tv_op_t05+super_cub_tv_op_t06+super_cub_tv_op_t07 \
	+super_cub_tv_op_t08+super_cub_tv_op_t09+super_cub_tv_op_t10

super_cub_tv_op_mute

### export clip: super_cub_tv_op_mute

### prefetch: 5,2

### ###

######## Subtitle ########

### inherit start ###

#global subtitle_heavy_halo_width=1
global subtitle_clip_width=1920
global subtitle_clip_height=1080

subtitle_x=50*2.25
subtitle_y=395*2.25
global subtitle_front_fade_count=12
global subtitle_rear_fade_count=12
global subtitle_font="MS Gothic"
global subtitle_effects="b"
global subtitle_size=33*2.25
global subtitle_text_color=color_white
global subtitle_halo_color=color_black
global subtitle_outside_halo_color=color_gray10

function SUBTITLE_FX(clip clip,string text,float x,float y,int start_frame,int end_frame,bool "is_furigana",bool "is_title"){
	is_title=Default(is_title,false)
	is_furigana=Default(is_furigana,false)

	outside_halo_color=is_title?color_deeppink:subtitle_outside_halo_color

	subtitle_mode=is_furigana?"ex":"ex" #"ex_thick_reduce_memory"
	size=is_furigana?subtitle_size*0.5:subtitle_size
	y=is_furigana?y-size:y

	return is_furigana?SUBTITLE_FX_FADE_IN_FADE_OUT_DOUBLE_HALO(clip,text,Round(x),Round(y),start_frame,end_frame,subtitle_front_fade_count,subtitle_rear_fade_count,subtitle_font,subtitle_effects,Round(size),subtitle_text_color,subtitle_halo_color,outside_halo_color,subtitle_mode) \
		:SUBTITLE_FX_FADE_IN_FADE_OUT_DOUBLE_HALO(clip,text,Round(x),Round(y),start_frame,end_frame,subtitle_front_fade_count,subtitle_rear_fade_count,subtitle_font,subtitle_effects,Round(size),subtitle_text_color,subtitle_halo_color,outside_halo_color,subtitle_mode)
}

function SUBTITLE_N(clip clip,string text,float y,int start_frame,int end_frame,bool "is_title"){
	is_title=Default(is_title,false)

	x=subtitle_clip_width/2
	fade_count=1

	outside_halo_color=is_title?color_darkturquoise:subtitle_outside_halo_color

	return SUBTITLE_FX_FADE_IN_FADE_OUT_DOUBLE_HALO(clip,text,Round(x),Round(y),start_frame,end_frame,fade_count,fade_count,subtitle_font,subtitle_effects+"c",Round(subtitle_size),subtitle_text_color,subtitle_halo_color,outside_halo_color,"ex")
}

### inherit end ###

ConvertToRGB32(matrix="Rec709")

SUBTITLE_FX("Ç‹ÇŸÇ§ÇÃÇ©Ç∫//åFìcà©âπ|- by fielia@AVISynth",-subtitle_x,subtitle_y-subtitle_size,5625,5911,is_title=true)

SUBTITLE_FX("ÇÕÇ∂            ÇøÇ¢        ÇΩÇ— Ç∂   Ç‡Ç≠ÇƒÇ´ Çø",subtitle_x,subtitle_y,570,758,true)
SUBTITLE_FX("èâÇﬂÇƒÇÃè¨Ç≥Ç»ó∑òH ñ⁄ìIínÇ»ÇÁÇ¢ÇÁÇ»Ç¢ÇÊ",subtitle_x,subtitle_y,570,758)
SUBTITLE_FX("Ç»Ç…           ÇÌÇΩÇµ   ÇŸÇŸ     Çƒ Ç‹ÇÀ                        Ç©Ç∫     Ç”",subtitle_x,subtitle_y-subtitle_size*2,760,945,true)
SUBTITLE_FX("âΩÇ‡Ç»Ç¢éÑÇÃñjÇ…éËèµÇ´Ç∑ÇÈÇÊÇ§Ç…ïóÇ™êÅÇ≠",subtitle_x,subtitle_y-subtitle_size*2,760,945)

SUBTITLE_FX(" ÇÊ     Ç›Çø  Ç‹ÇÌ    Ç›Çø                   ÇØÇµÇ´     Ç†Ç¥",subtitle_x,subtitle_y,950,1136,true)
SUBTITLE_FX("äÒÇËìπ âÒÇËìπ Ç¢Ç¬Ç‡ÇÃåiêFÇ‡ëNÇ‚Ç©Ç…",subtitle_x,subtitle_y,950,1136)
SUBTITLE_FX("Ç›Ç¨ Çƒ                           Ç»ÇÒ Ç«         ÇﬁÇÀ    ÇÕÇ∏",subtitle_x,subtitle_y-subtitle_size*2,1140,1344,true)
SUBTITLE_FX("âEéËÇÇ–ÇÀÇÈÇΩÇ— âΩìxÇ≈Ç‡ãπÇ™íeÇﬁÇ©ÇÁ",subtitle_x,subtitle_y-subtitle_size*2,1140,1344)

SUBTITLE_FX("                       Ç†         Ç©Ç®     Ç†",subtitle_x,subtitle_y,1360,1471,true)
SUBTITLE_FX("Ç≥Ç† ÉMÉAÇè„Ç∞ÇƒäÁÇè„Ç∞Çƒ",subtitle_x,subtitle_y,1360,1471)
SUBTITLE_FX("                     ÇÃ             Ç›Çø",subtitle_x,subtitle_y-subtitle_size*2,1474,1574,true)
SUBTITLE_FX("Ç«Ç±Ç‹Ç≈Ç‡êLÇ—ÇƒÇ≠ìπÇæÇ¡Çƒ",subtitle_x,subtitle_y-subtitle_size*2,1474,1574)
SUBTITLE_FX(" Ç´ÇÃÇ§         Ç∑Ç±    Ç∆Ç®",subtitle_x,subtitle_y,1569,1661,true)
SUBTITLE_FX("çì˙ÇÊÇËè≠ÇµâìÇ≠Ç‹Ç≈",subtitle_x,subtitle_y,1569,1661)
SUBTITLE_FX("                    Ç±ÇÌ",subtitle_x,subtitle_y-subtitle_size*2,1665,1765,true)
SUBTITLE_FX("Ç´Ç›Ç∆Ç»ÇÁï|Ç≠Ç»Ç¢Ç«Ç±ÇæÇ¡Çƒ",subtitle_x,subtitle_y-subtitle_size*2,1665,1765)
SUBTITLE_FX(" ÇÌÇΩÇµ                   Ç¬Ç≠            Ç©Ç∫",subtitle_x,subtitle_y,1759,1952,true)
SUBTITLE_FX(" éÑÇ–Ç∆ÇËÇ≈ÇÕçÏÇÍÇ»Ç¢ïóÇæ",subtitle_x,subtitle_y,1759,1952)

SUBTITLE_FX(" Ç‘  Ç´ ÇÊÇ§   ÇÌÇΩÇµ    Ç≈  Ç´       Ç∆Ç‡ÇΩÇø           ÇΩÇ©ÇÁÇ‡ÇÃ",subtitle_x,subtitle_y,2093,2278,true)
SUBTITLE_FX("ïsäÌópÇ»éÑÇ…èoóàÇΩ óFíBÇ∆Ç¢Ç§ïÛï®",subtitle_x,subtitle_y,2093,2278)
SUBTITLE_FX("                     Ç¶ Ç™Ç®    Ç¢Ç‹    Ç‹Ç¶       Ç∂ÇÂÇ§Ç∏",subtitle_x,subtitle_y-subtitle_size*2,2283,2464,true)
SUBTITLE_FX("Ç¨Ç±ÇøÇ»Ç¢èŒäÁÇ‡ç°ÇÕëOÇÊÇËè„éËÇ…Ç»ÇÍÇΩÇ©Ç»",subtitle_x,subtitle_y-subtitle_size*2,2283,2464)

SUBTITLE_FX("Ç≥Ç©Ç›Çø              Ç›Çø Ç†Ç´ÇÁ",subtitle_x,subtitle_y,2471,2659,true)
SUBTITLE_FX("ç‚ìπ Ç¢ÇŒÇÁìπ í˙ÇﬂÇÈÇŒÇ©ÇËÇ∂Ç·Ç¬Ç‹ÇÁÇ»Ç¢",subtitle_x,subtitle_y,2471,2659)
SUBTITLE_FX(" Ç´ÇÃÇ§      Ç±                   Ç»ÇÒ Ç«         Ç¢Ç´    ÇÕÇ∏",subtitle_x,subtitle_y-subtitle_size*2,2663,2865,true)
SUBTITLE_FX("çì˙ÇâzÇ¶ÇÈÇΩÇﬂ âΩìxÇ≈Ç‡ëßÇíeÇ‹ÇπÇƒ",subtitle_x,subtitle_y-subtitle_size*2,2663,2865)

SUBTITLE_FX("                       Ç†         Ç±Ç¶     Ç†",subtitle_x,subtitle_y,2881,2992,true)
SUBTITLE_FX("Ç≥Ç† ÉMÉAÇè„Ç∞Çƒê∫Çè„Ç∞Çƒ",subtitle_x,subtitle_y,2881,2992)
SUBTITLE_FX(" Ç†ÇΩÇÁ        Çπ Ç©Ç¢     Ç∆      Ç±",subtitle_x,subtitle_y-subtitle_size*2,2995,3093,true)
SUBTITLE_FX(" êVÇµÇ¢ê¢äEÇ…îÚÇ—çûÇÒÇ≈",subtitle_x,subtitle_y-subtitle_size*2,2995,3093)
SUBTITLE_FX(" ÇÕ                 ÇªÇÁ            Ç≥Ç´",subtitle_x,subtitle_y,3090,3181,true)
SUBTITLE_FX("â ÇƒÇÃÇ»Ç¢ãÛÇÃÇªÇÃêÊÇ÷",subtitle_x,subtitle_y,3090,3181)
SUBTITLE_FX("             Çπ                      Ç∆      ÇÃ",subtitle_x,subtitle_y-subtitle_size*2,3186,3286,true)
SUBTITLE_FX("Ç´Ç›ÇÃîwÇ…Ç–ÇÁÇËÇ∆îÚÇ—èÊÇ¡Çƒ",subtitle_x,subtitle_y-subtitle_size*2,3186,3286)
SUBTITLE_FX(" ÇÌÇΩÇµ                   Ç¶Ç™            Ç‰Çﬂ",subtitle_x,subtitle_y,3281,3453,true)
SUBTITLE_FX(" éÑÇ–Ç∆ÇËÇ≈ÇÕï`ÇØÇ»Ç¢ñ≤Ç",subtitle_x,subtitle_y,3281,3453)

### pass clip: super_cub_tv_op_mute

### prefetch: 5,2

### ###

SUBTITLE_FX("             Ç›      ÇÌÇΩÇµ",subtitle_x,subtitle_y-subtitle_size*2,3542,3694,true)
SUBTITLE_FX("Ç´Ç›Ç∆å©ÇÈ éÑÇÕÇ‡Ç§Ç–Ç∆ÇËÇ∂Ç·Ç»Ç¢",subtitle_x,subtitle_y-subtitle_size*2,3542,3694)
SUBTITLE_FX(" ÇÕ          Ç–       Ç†Çﬂ     Ç–       Ç¢ÇÎ                    Ç©Ç∫    Ç‹Ç∆",subtitle_x,subtitle_y,3697,3957,true)
SUBTITLE_FX("ê∞ÇÍÇÃì˙Ç‡ âJÇÃì˙Ç‡ êFÇ∆ÇËÇ«ÇËÇÃïóÇìZÇ¢Ç»Ç™ÇÁ",subtitle_x,subtitle_y,3697,3957)

SUBTITLE_FX("             Ç†         Ç©Ç®     Ç†",subtitle_x,subtitle_y-subtitle_size*2,4286,4374,true)
SUBTITLE_FX("ÉMÉAÇè„Ç∞ÇƒäÁÇè„Ç∞Çƒ",subtitle_x,subtitle_y-subtitle_size*2,4286,4374)
SUBTITLE_FX("                     ÇÃ             Ç›Çø",subtitle_x,subtitle_y,4375,4475,true)
SUBTITLE_FX("Ç«Ç±Ç‹Ç≈Ç‡êLÇ—ÇƒÇ≠ìπÇæÇ¡Çƒ",subtitle_x,subtitle_y,4375,4475)
SUBTITLE_FX(" Ç´ÇÃÇ§         Ç∑Ç±    Ç∆Ç®",subtitle_x,subtitle_y-subtitle_size*2,4470,4561,true)
SUBTITLE_FX("çì˙ÇÊÇËè≠ÇµâìÇ≠Ç‹Ç≈",subtitle_x,subtitle_y-subtitle_size*2,4470,4561)
SUBTITLE_FX("                    Ç±ÇÌ",subtitle_x,subtitle_y,4565,4675,true)
SUBTITLE_FX("Ç´Ç›Ç∆Ç»ÇÁï|Ç≠Ç»Ç¢",subtitle_x,subtitle_y,4565,4675)

SUBTITLE_FX("                       Ç†         Ç±Ç¶     Ç†",subtitle_x,subtitle_y-subtitle_size*2,4689,4800,true)
SUBTITLE_FX("Ç≥Ç† ÉMÉAÇè„Ç∞Çƒê∫Çè„Ç∞Çƒ",subtitle_x,subtitle_y-subtitle_size*2,4689,4800)
SUBTITLE_FX(" Ç†ÇΩÇÁ        Çπ Ç©Ç¢     Ç∆      Ç±",subtitle_x,subtitle_y,4803,4900,true)
SUBTITLE_FX(" êVÇµÇ¢ê¢äEÇ…îÚÇ—çûÇÒÇ≈",subtitle_x,subtitle_y,4803,4900)
SUBTITLE_FX(" ÇÕ                 ÇªÇÁ            Ç≥Ç´",subtitle_x,subtitle_y-subtitle_size*2,4898,4989,true)
SUBTITLE_FX("â ÇƒÇÃÇ»Ç¢ãÛÇÃÇªÇÃêÊÇ÷",subtitle_x,subtitle_y-subtitle_size*2,4898,4989)
SUBTITLE_FX("             Çπ                      Ç∆      ÇÃ",subtitle_x,subtitle_y,4993,5094,true)
SUBTITLE_FX("Ç´Ç›ÇÃîwÇ…Ç–ÇÁÇËÇ∆îÚÇ—èÊÇ¡Çƒ",subtitle_x,subtitle_y,4993,5094)

SUBTITLE_FX(" Ç‹ ÇŸÇ§                Ç©Ç∫ ÇÌÇΩÇµ    Ç¬      Çæ",subtitle_x,subtitle_y-subtitle_size*2,5089,5265,true)
SUBTITLE_FX("ñÇñ@ÇÃÇÊÇ§Ç»ïó éÑÇòAÇÍèoÇµÇΩ",subtitle_x,subtitle_y-subtitle_size*2,5089,5265)
SUBTITLE_FX("                         Ç¢               Ç©Ç∫     Ç”",subtitle_x,subtitle_y,5279,5483,true)
SUBTITLE_FX("Ç«Ç±Ç÷ÇæÇ¡ÇƒçsÇØÇÈÇÊ ïóÇÃêÅÇ≠Ç‹Ç‹",subtitle_x,subtitle_y,5279,5483)

######## Preface ########

Import("super_cub-tv-common-cross_process.avsi")

######## Thumbnail ########

is_thumbnail=false

is_thumbnail?ConvertToRGB32(super_cub_tv_op_mute,matrix="Rec709"):last

######## Music ########

bgm_48khz=SSRC(WAVSource("src\01.Ç‹ÇŸÇ§ÇÃÇ©Ç∫.wav"),48000)
AudioDub(bgm_48khz)



######## Thumbnail ########

thumbnail=Trim(4677,-thumbnail_length)

function EXTEND_ONE_FRAME(clip clip){
	return clip+BlankClip(clip,length=1,color=color_black)
}

function UNDO_EXTEND_ONE_FRAME(clip clip){
	return Trim(clip,0,-Framecount(clip)+1)
}

honda_super_cub_c125_start=64
honda_super_cub_c125=ConvertToRGB32(ImageSource("src\price\super_cub-c125-price.png",0,thumbnail_length-honda_super_cub_c125_start-1,thumbnail_frame_rate,pixel_type="rgb24"))
honda_super_cub_c125_overlay=BlankClip(honda_super_cub_c125,length=honda_super_cub_c125_start,color=color_black)+honda_super_cub_c125

thumbnail=Layer(thumbnail,FAST_ZOOM(super_cub_tv_01_super_cub_cost_10000_jpy_overlay,srcx=0.0,srcy=0.0,dstx=Width(thumbnail)/2,dsty=0.0,factor=0.5))
thumbnail=Layer(thumbnail,FAST_ZOOM(azumalim_hitori_cub_umi_thumbnail_overlay,srcx=0.0,srcy=0.0,dstx=Width(thumbnail)/2,dsty=Height(thumbnail)/2,factor=1.5/2.0,width=Width(thumbnail),height=Height(thumbnail)))
thumbnail=Layer(thumbnail,FAST_ZOOM(honda_super_cub_c125_overlay,srcx=0.0,srcy=0.0,dstx=0.0,dsty=Height(thumbnail)/2,factor=1.5/2.0,width=Width(thumbnail),height=Height(thumbnail)))

thumbnail=EXTEND_ONE_FRAME(thumbnail)
thumbnail=SUBTITLE_N(thumbnail,"\10000",subtitle_x,super_cub_tv_01_super_cub_cost_10000_jpy_start,thumbnail_length-1)
thumbnail=SUBTITLE_N(thumbnail,"\407000",subtitle_y,azumalim_hitori_cub_umi_start,thumbnail_length-1)
thumbnail=UNDO_EXTEND_ONE_FRAME(thumbnail)



super_cub_tv_01_koguma_start_up_super_cub++super_cub_tv_12_chapter++Trim(2,0)



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
