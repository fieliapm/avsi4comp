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

Import("plastic_memories-common.avsi")

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

dissolve_length=10



# script overlay

# 437
plastic_memories_clean_op_01_02_original=TRIM_FIRST_CLIP(plastic_memories_clean_op_01_0+Loop(plastic_memories_clean_op_01_1,8),437)+plastic_memories_clean_op_02
plastic_memories_clean_op_01_02_original=ConvertToRGB32(plastic_memories_clean_op_01_02_original,matrix="Rec709")

# 0 232 (232 245 258 272 286) 305 378 437
script_overlay=TRIM_MIDDLE_CLIP(plastic_memories_12_isla_recycle_sarah,13)+TRIM_MIDDLE_CLIP(plastic_memories_08_andie_recycle_derek,13)+TRIM_FIRST_CLIP(plastic_memories_01_edward_bid_farewell_to_parents,14)+Trim(plastic_memories_02_max_repair_car,88,-14)+TRIM_MIDDLE_CLIP(plastic_memories_08_isla_see_mirabel_show_doll,19) \
	+TRIM_FIRST_CLIP(plastic_memories_01_isla_bless_nina,73)+TRIM_LAST_CLIP(plastic_memories_04_marcia_hug_souta,59+1)
script_overlay=ConvertToRGB32(BlankClip(plastic_memories_clean_op,length=232,color=color_black)+script_overlay,matrix="Rec709")

plastic_memories_clean_op_01_02=Overlay(plastic_memories_clean_op_01_02_original,script_overlay,mode="Add",pc_range=true)
plastic_memories_clean_op_01_02=OVERWRITE_RANGE(plastic_memories_clean_op_01_02_original,plastic_memories_clean_op_01_02,232,437)
plastic_memories_clean_op_01_02=CONVERT_BACK_TO_YV12(plastic_memories_clean_op_01_02,matrix="Rec709")



# isla emotion

isla_emotion_last=TRIM_LAST_CLIP(plastic_memories_clean_op_08_title,73)+plastic_memories_clean_op_10_isla_emotion_13
isla_emotion_last=ConvertToRGB32(isla_emotion_last,matrix="Rec709")
isla_emotion_last=ScriptClip(isla_emotion_last,"FAST_ZOOM(srcx=Width(),srcy=Height(),dstx=Width(),dsty=Height(),factor=Spline(current_frame,0,0.5,73,0.5,122,0.5,134,1.0,Framecount(),1.0,cubic=false))")

empty=BlankClip(plastic_memories_clean_op,length=136,color=color_black)
offset=BlankClip(plastic_memories_clean_op,length=6,color=color_black)
row_01=StackHorizontal(isla_emotion_02,Loop(offset,1)+isla_emotion_03,Loop(offset,2)+isla_emotion_04,Loop(offset,3)+isla_emotion_05)
row_02=StackHorizontal(Loop(offset,4)+isla_emotion_06,Loop(offset,5)+isla_emotion_07,Loop(offset,6)+isla_emotion_08,Loop(offset,7)+isla_emotion_09)
row_03=StackHorizontal(Loop(offset,8)+isla_emotion_10,Loop(offset,9)+isla_emotion_11,empty,empty)
row_04=StackHorizontal(Loop(offset,10)+isla_emotion_12,Loop(offset,11)+isla_emotion_13,empty,empty)
isla_emotion_variance_bg=RESIZE_TO_REF_CLIP(StackVertical(row_01,row_02,row_03,row_04),plastic_memories_clean_op)
isla_emotion_variance_bg=ConvertToRGB32(isla_emotion_variance_bg,matrix="Rec709")

isla_emotion_variance=Layer(isla_emotion_variance_bg,isla_emotion_last,op="Add")
isla_emotion_variance=CONVERT_BACK_TO_YV12(isla_emotion_variance,matrix="Rec709")

######## Combine ########

# plastic_memories_clean_op_01_0 30
# plastic_memories_clean_op_01_1 36
# plastic_memories_clean_op_02 467
# plastic_memories_clean_op_03 664/2594
# plastic_memories_clean_op_04 1206/3136
# plastic_memories_clean_op_05 1391/3321/4560
# plastic_memories_clean_op_06 1526/3456/4695/4986
# plastic_memories_clean_op_07 1972/3902/5432
# plastic_memories_clean_op_08_title 2225/4155/5685
# plastic_memories_clean_op_09 2338/5798
# plastic_memories_clean_op_10 2407/5867/5940



plastic_memories_op_t01=BlankClip(plastic_memories_clean_op,length=30,color=color_black)+plastic_memories_clean_op_01_02
plastic_memories_op_t02=plastic_memories_clean_op_03+plastic_memories_clean_op_04+plastic_memories_clean_op_05
plastic_memories_op_t03=plastic_memories_clean_op_06+MOVE_CG(TRIM_MIDDLE_CLIP(plastic_memories_10_hourglass,103),1,0,Width(plastic_memories_clean_op)/10.0,1.1)+Trim(plastic_memories_06_isla_disappointed_past_and_present,40,-14)+FADE_IN_WITH_BRIGHTNESS_OFFSET(Trim(plastic_memories_06_isla_disappointed_past_and_present,138-9,-19),dissolve_length/2) \
	+SCALE_CG(TRIM_LAST_CLIP(plastic_memories_04_marcia_tsukasa_isla_face_window,117),0.5*Width(plastic_memories_clean_op),0.5*Height(plastic_memories_clean_op),1.1,1.0)+TRIM_FIRST_CLIP(plastic_memories_06_isla_kirakira_and_smile,113) \
	+TRIM_MIDDLE_CLIP(plastic_memories_10_terminal_service_one_members,69)+MOVE_CG(TRIM_MIDDLE_CLIP(plastic_memories_12_isla_stand_under_sunset,75),0,1,Height(plastic_memories_clean_op)/10.0,1.1)+FADE_OUT_WITH_BRIGHTNESS_OFFSET(TRIM_FIRST_CLIP(plastic_memories_03_isla_stand_against_wall_02,112),dissolve_length)

plastic_memories_op_t04=FADE_IN_WITH_BRIGHTNESS_OFFSET(MOVE_CG(TRIM_LAST_CLIP(plastic_memories_12_tsukasa_sleep_on_isla_s_leg_01,140),-1,0,Width(plastic_memories_clean_op)/10.0,1.1),dissolve_length)+MOVE_CG(TRIM_FIRST_CLIP(plastic_memories_13_isla_and_tsukasa_sit_together_under_sun_rise,147),1,0,Width(plastic_memories_clean_op)/10.0,1.1) \
	+TRIM_LAST_CLIP(plastic_memories_05_reflection_of_michiru_zack_tsukasa,69)+TRIM_MIDDLE_CLIP(plastic_memories_05_michiru_and_zack_receive_phone_call_in_lane,78)+TRIM_FIRST_CLIP(plastic_memories_05_sherry_and_yasutaka_search_criminal,108) \
	+TRIM_FIRST_CLIP(plastic_memories_04_michiru_touch_bow_tie,18)+TRIM_FIRST_CLIP(plastic_memories_02_michiru_see_city_night_01,18)+TRIM_FIRST_CLIP(plastic_memories_02_michiru_thinking_01,37)+TRIM_FIRST_CLIP(plastic_memories_02_michiru_thinking_02,38) \
	+TRIM_MIDDLE_CLIP(plastic_memories_08_eru_and_andie_in_matsuri,8)+TRIM_MIDDLE_CLIP(plastic_memories_08_olivia_and_eru_in_matsuri,32)+TRIM_MIDDLE_CLIP(plastic_memories_08_eru_alone,34) \
	+TRIM_MIDDLE_CLIP(plastic_memories_07_isla_see_building_in_ferris_wheel,27)+Trim(plastic_memories_10_isla_make_sarah_and_antonio_together,60+1-27,-27)+TRIM_FIRST_CLIP(plastic_memories_06_isla_fall_down_and_get_wet,27)+TRIM_MIDDLE_CLIP(plastic_memories_06_isla_and_eru_dress_in_bar,27)+TRIM_FIRST_CLIP(plastic_memories_03_isla_cannot_change_clothes,27)
plastic_memories_op_t05=TRIM_MIDDLE_CLIP(plastic_memories_08_tsukasa_find_in_many_people_01,88)+TRIM_FIRST_CLIP(plastic_memories_07_tsukasa_fall_and_hit_isla_breast,30)+TRIM_FIRST_CLIP(plastic_memories_10_isla_hold_key_holder_tightly,18)+TRIM_FIRST_CLIP(plastic_memories_05_tsukasa_want_to_shoot_marcia_and_isla_run_to_marcia,18) \
	+TRIM_MIDDLE_CLIP(plastic_memories_06_beam_pass_by_isla,62)+TRIM_MIDDLE_CLIP(plastic_memories_06_marcia_is_dying,30)+TRIM_MIDDLE_CLIP(plastic_memories_06_souta_catch_tsukasa_and_cry,16)+TRIM_FIRST_CLIP(plastic_memories_06_marcia_is_dying_and_tears,29) \
	+TRIM_MIDDLE_CLIP(plastic_memories_11_isla_see_sunset_02,12)+TRIM_MIDDLE_CLIP(plastic_memories_11_isla_see_sunset_01,36)+Trim(plastic_memories_01_isla_meet_tsukasa_in_elevator,60+1-23,-23) \
	+TRIM_MIDDLE_CLIP(plastic_memories_03_isla_charge,22)+TRIM_MIDDLE_CLIP(plastic_memories_06_isla_alone_and_snow_falling,33)+TRIM_MIDDLE_CLIP(plastic_memories_03_isla_leave,29) \
	+TRIM_FIRST_CLIP(plastic_memories_06_isla_shine,103)+TRIM_FIRST_CLIP(plastic_memories_02_tsukasa_clean_isla_s_nose_bleed,14)+FADE_IN_WITH_BRIGHTNESS_OFFSET(TRIM_LAST_CLIP(plastic_memories_02_tsukasa_clean_isla_s_nose_bleed,19),dissolve_length/2) \
	+TRIM_MIDDLE_CLIP(plastic_memories_09_tsukasa_go_to_stair_and_sit_near_michiru,117)+TRIM_MIDDLE_CLIP(plastic_memories_06_isla_tears_and_kaduki_leave,113)

plastic_memories_op_t06=TRIM_MIDDLE_CLIP(plastic_memories_05_michiru_and_her_father_in_church,146)+MOVE_CG(TRIM_MIDDLE_CLIP(plastic_memories_07_isla_and_tsukasa_see_people_in_amusement,73),-1,0,Width(plastic_memories_clean_op)/10.0,1.1)+TRIM_MIDDLE_CLIP(plastic_memories_10_isla_cry_and_catch_tsukasa_s_hand,73)

plastic_memories_op_t07=TRIM_MIDDLE_CLIP(plastic_memories_09_michiru_cry,27)+TRIM_MIDDLE_CLIP(plastic_memories_09_zack_play_gameboy,27)+TRIM_MIDDLE_CLIP(plastic_memories_01_isla_water_plant,27)+TRIM_FIRST_CLIP(plastic_memories_05_kaduki_and_shinonome_discussing,27)+TRIM_MIDDLE_CLIP(plastic_memories_05_shinya_see_computer_screen,27) \
	+TRIM_MIDDLE_CLIP(plastic_memories_12_terminal_service_one_members,88)+FADE_OUT_WITH_BRIGHTNESS_OFFSET(SCALE_CG(TRIM_MIDDLE_CLIP(plastic_memories_12_thank_isla_sign_board,30),0.5*Width(plastic_memories_clean_op),0.5*Height(plastic_memories_clean_op),1.0,1.1),dissolve_length) \
	+FADE_IN_WITH_BRIGHTNESS_OFFSET(TRIM_MIDDLE_CLIP(plastic_memories_01_isla_see_outside_in_elevator,18+18+62+30),dissolve_length)+TRIM_MIDDLE_CLIP(plastic_memories_01_isla_tears_in_elevator,16+29)
plastic_memories_op_t08=TRIM_LAST_CLIP(plastic_memories_01_isla_tears_and_turn_back_01,88)+TRIM_FIRST_CLIP(plastic_memories_01_isla_tears_and_turn_back_02,30)+SCALE_CG(Trim(CLIP_SPEED(plastic_memories_13_isla_last_smile,2.0,true),88/2-9,-18),0.5*Width(plastic_memories_clean_op),0.5*Height(plastic_memories_clean_op),1.5,1.5)+TRIM_LAST_CLIP(plastic_memories_01_isla_tears_and_turn_back_02,18) \
	+TRIM_LAST_CLIP(plastic_memories_13_isla_and_tsukasa_kiss_01,62)+TRIM_MIDDLE_CLIP(plastic_memories_13_isla_and_tsukasa_kiss_02,30)+TRIM_MIDDLE_CLIP(plastic_memories_13_ring,16)+TRIM_LAST_CLIP(plastic_memories_13_isla_and_tsukasa_hold_hands,29) \
	+TRIM_FIRST_CLIP(plastic_memories_08_tsukasa_hug_isla,12)+TRIM_LAST_CLIP(plastic_memories_08_tsukasa_hug_isla_under_fireworks,36)+TRIM_MIDDLE_CLIP(plastic_memories_11_become_couple_in_diary,23) \
	+TRIM_MIDDLE_CLIP(plastic_memories_11_isla_catch_tsukasa_s_hand_near_river,22)+TRIM_MIDDLE_CLIP(plastic_memories_11_isla_see_river,33)+TRIM_MIDDLE_CLIP(plastic_memories_11_omurice_day_in_diary_02,29) \
	+plastic_memories_clean_op_07+plastic_memories_clean_op_08_title+plastic_memories_clean_op_09
plastic_memories_op_t09=isla_emotion_variance+BlankClip(plastic_memories_clean_op,length=24*7,color=color_black)



plastic_memories_op_mute=plastic_memories_op_t01+plastic_memories_op_t02+plastic_memories_op_t03 \
	+plastic_memories_op_t04+plastic_memories_op_t05+plastic_memories_op_t06 \
	+plastic_memories_op_t07+plastic_memories_op_t08+plastic_memories_op_t09

plastic_memories_op_mute

### export clip: plastic_memories_op_mute

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
global subtitle_font="MS Mincho"
global subtitle_effects="b"
global subtitle_size=33*2.25
global subtitle_text_color=color_white
global subtitle_halo_color=color_skyblue
global subtitle_outside_halo_color=color_deepskyblue

function SUBTITLE_FX(clip clip,string text,float x,float y,int start_frame,int end_frame,bool "is_furigana",bool "is_title"){
	is_title=Default(is_title,false)
	is_furigana=Default(is_furigana,false)

	halo_color=is_title?color_red:subtitle_halo_color
	outside_halo_color=is_title?color_slateblue:subtitle_outside_halo_color

	subtitle_mode=is_furigana?"ex":"ex" #"ex_thick_reduce_memory"
	size=is_furigana?subtitle_size*0.5:subtitle_size
	y=is_furigana?y-size:y

	return SUBTITLE_FX_FADE_IN_FADE_OUT_DOUBLE_HALO(clip,text,Round(x),Round(y),start_frame,end_frame,subtitle_front_fade_count,subtitle_rear_fade_count,subtitle_font,subtitle_effects,Round(size),subtitle_text_color,halo_color,outside_halo_color,subtitle_mode)
}

### inherit end ###

ConvertToRGB32(matrix="Rec709")

SUBTITLE_FX("Ring of Fortune//ç≤ÅXñÿåbóú|- by fielia@AVISynth",-subtitle_x,subtitle_y-subtitle_size,335,554,is_title=true)

SUBTITLE_FX(" Ç–Ç©ÇË                      ÇÊ ÇºÇÁ     Ç©Ç»ÇΩ",subtitle_x,subtitle_y,11,262,true)
SUBTITLE_FX(" åıÇÇ†Ç¬ÇﬂÇƒ ñÈãÛÇÃîﬁï˚Ç÷",subtitle_x,subtitle_y,11,262)

SUBTITLE_FX("                    Ç®Ç‡     Ç≈",subtitle_x,subtitle_y-subtitle_size*2,663,776,true)
SUBTITLE_FX("Ç≥ÇÊÇ»ÇÁÇÃëzÇ¢èoÇ",subtitle_x,subtitle_y-subtitle_size*2,663,776)
SUBTITLE_FX(" Ç–Ç∆Ç›                      Ç›             Ç‰Çﬂ  Ç∆Ç®",subtitle_x,subtitle_y,800,952,true)
SUBTITLE_FX(" ìµÇ…ÇΩÇΩÇ¶Çƒ å©Ç¬ÇﬂÇÈñ≤ âìÇ≠",subtitle_x,subtitle_y,800,952)
SUBTITLE_FX("Ç±ÇÌ",subtitle_x,subtitle_y-subtitle_size*2,948,1078,true)
SUBTITLE_FX("âÛÇÍÇƒÇµÇ‹Ç§ Ç§ÇΩÇ©ÇΩÇÃÉÅÉÇÉäÅ[",subtitle_x,subtitle_y-subtitle_size*2,948,1078)
SUBTITLE_FX("Ç≥Ç—           Ç»Ç›Çæ              Ç”",subtitle_x,subtitle_y,1081,1208,true)
SUBTITLE_FX("é‚ÇµÇ≥ÇÃó‹ ÇªÇ¡Ç∆ê@Ç±Ç§",subtitle_x,subtitle_y,1081,1208)		

SUBTITLE_FX(" ÇÃ              Çƒ     Ç©ÇÒÇÁÇÒÇµÇ·  Ç‚Ç≥",subtitle_x,subtitle_y-subtitle_size*2,1211,1381,true)
SUBTITLE_FX("êLÇŒÇµÇΩéËÇÕäœóóé‘ óDÇµÇ≠Ç∆ÇÁÇ¶Çƒ",subtitle_x,subtitle_y-subtitle_size*2,1211,1381)
SUBTITLE_FX(" Çﬂ  Ç¥                    Ç´ Ç®Ç≠     Ç©ÇØÇÁ",subtitle_x,subtitle_y,1383,1507,true)
SUBTITLE_FX("ñ⁄äoÇﬂÇªÇ§Ç» ãLâØÇÃåáï–",subtitle_x,subtitle_y,1383,1507)
SUBTITLE_FX("                       Ç´                         Ç¢ÇÃ",subtitle_x,subtitle_y-subtitle_size*2,1529,1649,true)
SUBTITLE_FX("Ç§Ç¬ÇﬁÇ¢Çƒ è¡Ç¶ÇƒÇŸÇµÇ¢Ç∆ãFÇÈÇØÇ«",subtitle_x,subtitle_y-subtitle_size*2,1529,1649)

SUBTITLE_FX("Ç´Ç›     Ç›                                 Ç±Ç¶",subtitle_x,subtitle_y,1648,1795,true)
SUBTITLE_FX("åNÇ™å©Ç¬ÇØÇƒÇ≠ÇÍÇΩÇ±ÇÃê∫Ç",subtitle_x,subtitle_y,1648,1795)
SUBTITLE_FX("Ç§Ç≤     Çæ          Ç∆ÇØÇ¢     ÇÕÇË   Çπ Ç©Ç¢                Ç¢ÇÎ",subtitle_x,subtitle_y-subtitle_size*2,1797,1963,true)
SUBTITLE_FX("ìÆÇ´èoÇµÇΩéûåvÇÃêj ê¢äEÇÕÇ‚Ç™ÇƒêFÇ√Ç¢Çƒ",subtitle_x,subtitle_y-subtitle_size*2,1797,1963)
SUBTITLE_FX("                               Ç±Ç±ÇÎ  Ç©Ç™Ç‚    Çæ",subtitle_x,subtitle_y,1966,2112,true)
SUBTITLE_FX("ÉvÉâÉXÉeÉBÉbÉNÇ»êSÇ™ãPÇ´èoÇ∑ÇÊ",subtitle_x,subtitle_y,1966,2112)
SUBTITLE_FX("ÇÌÇ∑",subtitle_x,subtitle_y-subtitle_size*2,2112,2226,true)
SUBTITLE_FX("ñYÇÍÇ»Ç¢Ç≈ Ç®Ç⁄Ç¶ÇƒÇ¢Çƒ",subtitle_x,subtitle_y-subtitle_size*2,2112,2226)
SUBTITLE_FX("                    ÇﬂÇÆ     Ç†          Ç–",subtitle_x,subtitle_y,2235,2475,true)
SUBTITLE_FX("Ç¢Ç¬Ç©Ç‹ÇΩèÑÇËâÔÇ¶ÇÈì˙Ç‹Ç≈ Ç∏Ç¡Ç∆",subtitle_x,subtitle_y,2235,2475)

SUBTITLE_FX("Ç‰Ç§ ÇÆ       Ç∆Ç‡   Ç–Ç©ÇË",subtitle_x,subtitle_y-subtitle_size*2,2598,2703,true)
SUBTITLE_FX("ó[ïÈÇÍ ìîÇÈåı",subtitle_x,subtitle_y-subtitle_size*2,2598,2703)
SUBTITLE_FX("ÇøÇ¢                          ÇÃÇ⁄                  ÇªÇÁ",subtitle_x,subtitle_y,2730,2882,true)
SUBTITLE_FX("è¨Ç≥Ç»ÉSÉìÉhÉâ è„Ç¡ÇƒÇ‰Ç≠ ãÛÇ÷",subtitle_x,subtitle_y,2730,2882)
SUBTITLE_FX(" Ç∆Ç»ÇË   Ç∑ÇÌ      Ç´Ç›",subtitle_x,subtitle_y-subtitle_size*2,2878,3010,true)
SUBTITLE_FX(" ó◊Ç…ç¿ÇÈ åNÇÃÇ Ç≠Ç‡ÇËÇ…",subtitle_x,subtitle_y-subtitle_size*2,2878,3010)
SUBTITLE_FX("                 Ç»Ç›Çæ   ÇŸÇŸ    Ç¬ÇΩ",subtitle_x,subtitle_y,3012,3137,true)
SUBTITLE_FX("Ç»Ç∫Ç©Ç» ó‹Ç™ñjÇì`Ç§",subtitle_x,subtitle_y,3012,3137)

### pass clip: plastic_memories_op_mute

### prefetch: 5,2

### ###

SUBTITLE_FX("ÇﬂÇÆ    Ç‹ÇÌ    Ç©ÇÒÇÁÇÒÇµÇ·  ÇµÇ∏         Ç‰",subtitle_x,subtitle_x+subtitle_size,3140,3311,true)
SUBTITLE_FX("èÑÇËâÙÇÈäœóóé‘ ê√Ç©Ç…óhÇÁÇÍÇƒ",subtitle_x,subtitle_x+subtitle_size,3140,3311)
SUBTITLE_FX("ÇﬁÇÀ    Ç®Ç≠       ÇÕ      Ç≥",subtitle_x,subtitle_y,3313,3435,true)
SUBTITLE_FX("ãπÇÃâúÇ™ í£ÇËóÙÇØÇªÇ§Ç≈",subtitle_x,subtitle_y,3313,3435)
SUBTITLE_FX("Ç‹Ç«    ÇªÇ∆  Ç»Ç™        Ç≠Ç‡   Ç›  Ç†",subtitle_x,subtitle_y-subtitle_size*2,3457,3579,true)
SUBTITLE_FX("ëãÇÃäO ó¨ÇÍÇÈâ_ å©è„Ç∞ÇƒÇΩ",subtitle_x,subtitle_y-subtitle_size*2,3457,3579)

SUBTITLE_FX("                                           ÇÊ      Çª",subtitle_x,subtitle_y,3577,3723,true)
SUBTITLE_FX("Ç∏Ç¡Ç∆Ç±ÇÃÇ‹Ç‹Ç”ÇΩÇË äÒÇËìYÇ¡Çƒ",subtitle_x,subtitle_y,3577,3723)
SUBTITLE_FX("Ç§ÇÒÇﬂÇ¢     ÇÌ    Ç≠     Ç©Ç¶          Ç®Ç‡                    Ç¬Ç»",subtitle_x,subtitle_x+subtitle_size,3727,3892,true)
SUBTITLE_FX("â^ñΩÇÃó÷ åJÇËï‘ÇπÇŒ ëzÇ¢ÇÕÇ‚Ç™ÇƒåqÇ™ÇÈÇÊ",subtitle_x,subtitle_x+subtitle_size,3727,3892)
SUBTITLE_FX("Ç±ÇΩ        Ç≥Ç™       Ç› ÇÁÇ¢    ÇÀÇ™    Ç¬Ç√",subtitle_x,subtitle_y,3897,4042,true)
SUBTITLE_FX("ìöÇ¶ÇíTÇµ ñ¢óàÇ÷äËÇ¢ë±ÇØÇÈ",subtitle_x,subtitle_y,3897,4042)
SUBTITLE_FX("Ç‹ÇÊ                  ÇµÇÒ",subtitle_x,subtitle_y-subtitle_size*2,4042,4162,true)
SUBTITLE_FX("ñ¿ÇÌÇ»Ç¢Ç≈ êMÇ∂ÇƒÇ¢Çƒ",subtitle_x,subtitle_y-subtitle_size*2,4042,4162)
SUBTITLE_FX("Ç®Ç‡     Ç≈     ÇŸÇÒÇ‡ÇÃ",subtitle_x,subtitle_y,4165,4305,true)
SUBTITLE_FX("ëzÇ¢èoÇÕñ{ï®Ç…Ç»ÇÈÇ©ÇÁ",subtitle_x,subtitle_y,4165,4305)

SUBTITLE_FX("Ç±ÇÌ                   Ç´ Ç®Ç≠",subtitle_x,subtitle_y,4553,4675,true)
SUBTITLE_FX("âÛÇÍÇªÇ§Ç» ãLâØÇÃÇ∑Ç◊Çƒ",subtitle_x,subtitle_y,4553,4675)
SUBTITLE_FX("                       Ç´                         Ç¢ÇÃ",subtitle_x,subtitle_y-subtitle_size*2,4697,4818,true)
SUBTITLE_FX("Ç§Ç¬ÇﬁÇ¢Çƒ è¡Ç¶Ç ÇÊÇ§Ç…Ç∆ãFÇÈÇØÇ«",subtitle_x,subtitle_y-subtitle_size*2,4697,4818)

SUBTITLE_FX("Ç±ÇÒ Ç‚   Ç‰Çﬂ     Ç∂ Ç©ÇÒ     Ç®          Ç¬",subtitle_x,subtitle_y,4817,4962,true)
SUBTITLE_FX("ç°ñÈ ñ≤ÇÃéûä‘ÇÕèIÇÌÇËçêÇ∞ÇÈ",subtitle_x,subtitle_y,4817,4962)
SUBTITLE_FX("Ç±ÇÌ                   Çπ Ç©Ç¢            Ç‚Ç≥        Ç¢ÇÎ",subtitle_x,subtitle_y-subtitle_size*2,4967,5108,true)
SUBTITLE_FX("ï|Ç≠Ç»Ç¢ÇÊ ê¢äEÇÕÇ‹ÇæóDÇµÇ≠êFÇ√Ç¢ÇƒÇÈÇ©ÇÁ",subtitle_x,subtitle_y-subtitle_size*2,4967,5108)

SUBTITLE_FX("Ç´Ç›     Ç›                                 Ç±Ç∆ ÇŒ",subtitle_x,subtitle_y,5108,5252,true)
SUBTITLE_FX("åNÇ™å©Ç¬ÇØÇƒÇ≠ÇÍÇΩÇ±ÇÃåæótÇ",subtitle_x,subtitle_y,5108,5252)
SUBTITLE_FX("Ç§ÇÒÇﬂÇ¢     ÇÌ    Ç≠     Ç©Ç¶          Ç®Ç‡                    Ç¬Ç»",subtitle_x,subtitle_y-subtitle_size*2,5257,5422,true)
SUBTITLE_FX("â^ñΩÇÃó÷ åJÇËï‘ÇπÇŒ ëzÇ¢ÇÕÇ‚Ç™ÇƒåqÇ™ÇÈÇÊ",subtitle_x,subtitle_y-subtitle_size*2,5257,5422)
SUBTITLE_FX("                               Ç±Ç±ÇÎ    Ç›",subtitle_x,subtitle_y,5426,5572,true)
SUBTITLE_FX("ÉvÉâÉXÉeÉBÉbÉNÇ»êSÇ™ñûÇΩÇ≥ÇÍÇƒÇ¢Ç≠",subtitle_x,subtitle_y,5426,5572)
SUBTITLE_FX("ÇÌÇ∑",subtitle_x,subtitle_y-subtitle_size*2,5571,5690,true)
SUBTITLE_FX("ñYÇÍÇ»Ç¢ÇÊ Ç®Ç⁄Ç¶ÇƒÇÈÇÊ",subtitle_x,subtitle_y-subtitle_size*2,5571,5690)
SUBTITLE_FX("                    ÇﬂÇÆ     Ç†          Ç–",subtitle_x,subtitle_y,5694,5937,true)
SUBTITLE_FX("Ç¢Ç¬Ç©Ç‹ÇΩèÑÇËâÔÇ¶ÇÈì˙Ç‹Ç≈ Ç∏Ç¡Ç∆",subtitle_x,subtitle_y,5694,5937)



function EXTEND_ONE_FRAME(clip clip){
	return clip+BlankClip(clip,length=1,color=color_black)
}

function UNDO_EXTEND_ONE_FRAME(clip clip){
	return Trim(clip,0,-Framecount(clip)+1)
}

plastic_memories_op_pre_length=1
plastic_memories_op_pre=BlankClip(last,length=plastic_memories_op_pre_length,color=color_black)
plastic_memories_op_pre=EXTEND_ONE_FRAME(plastic_memories_op_pre)
plastic_memories_op_pre=SUBTITLE_FX(plastic_memories_op_pre," Ç–Ç©ÇË                      ÇÊ ÇºÇÁ     Ç©Ç»ÇΩ",subtitle_x,subtitle_y,plastic_memories_op_pre_length+11,plastic_memories_op_pre_length+262,true)
plastic_memories_op_pre=SUBTITLE_FX(plastic_memories_op_pre," åıÇÇ†Ç¬ÇﬂÇƒ ñÈãÛÇÃîﬁï˚Ç÷",subtitle_x,subtitle_y,plastic_memories_op_pre_length+11,plastic_memories_op_pre_length+262)
plastic_memories_op_pre=UNDO_EXTEND_ONE_FRAME(plastic_memories_op_pre)

######## Thumbnail ########

is_thumbnail=false

is_thumbnail?ConvertToRGB32(plastic_memories_op_mute,matrix="Rec709"):last

######## Music ########

bgm_48khz=SSRC(WAVSource("src\01 Ring of Fortune.wav"),48000)
Normalize(AudioDub(bgm_48khz))



thumbnail=Trim(1560,-24*5)



AUDIO_DUB_TONE(plastic_memories_op_pre,samplerate=48000,channels=2,type="Silence")++last



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
