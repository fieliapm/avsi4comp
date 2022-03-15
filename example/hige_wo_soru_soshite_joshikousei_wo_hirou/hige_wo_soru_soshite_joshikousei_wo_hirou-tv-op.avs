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

Import("hige_wo_soru_soshite_joshikousei_wo_hirou-tv-common.avsi")

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

global _flip_decoration_clip_count=0
function FURAFURA_FLIP(clip a,clip b,int dir,clip decoration){
	global flip_length=12
	mask=BlankClip(a,length=flip_length,pixel_type="RGB24",color=color_white)
	mask_left=ScriptClip(mask,"FAST_ZOOM(srcx=0,dstx=Spline(current_frame,-1,Width(),flip_length,0,cubic=false))")
	mask_right=ScriptClip(mask,"FAST_ZOOM(srcx=0,dstx=Spline(current_frame,-1,-Width(),flip_length,0,cubic=false))")

	decoration_scaled=FAST_ZOOM(decoration,factor=2.0,width=Width(decoration)*2)
	
	global_clip_name="_flip_decoration_clip_"+String(_flip_decoration_clip_count)
	global _flip_decoration_clip_count=_flip_decoration_clip_count+1
	Eval("global "+global_clip_name+"=decoration_scaled")
	
	flip_a=TRIM_LAST_CLIP(a,flip_length)
	flip_b=TRIM_FIRST_CLIP(b,flip_length)
	flip_in=Overlay(flip_a,flip_b,mask=dir<0?mask_left:mask_right)
	flip_in=dir<0 \
		?ScriptClip(flip_in,"Overlay("+global_clip_name+",x=Round(Spline(current_frame,-1,Width(),flip_length,0,cubic=false)-1920/6),mask=ShowAlpha("+global_clip_name+"))") \
		:ScriptClip(flip_in,"Overlay("+global_clip_name+",x=Round(Spline(current_frame,-1,0,flip_length,Width(),cubic=false)-1920/6),mask=ShowAlpha("+global_clip_name+"))")
	return TRIM_FIRST_CLIP(a,Framecount(a)-flip_length)+flip_in+Trim(b,flip_length,0)
}

######## Pre Combine ########

fade_length=8



shadow=TRIM_ONE_FRAME(hige_wo_soru_soshite_joshikousei_wo_hirou_tv_clean_op_02,197) # 197-200
shadow_rgba=ConvertToRGB32(shadow,matrix="Rec709")
shadow_rgba=ColorKeyMask(shadow_rgba,$FAFAFA,15)

hashimoto_shadow=Crop(shadow_rgba,0,0,1920/6,0)
airi_shadow=Crop(shadow_rgba,1920*1/6,0,1920/6,0)
yoshida_shadow=Crop(shadow_rgba,1920*2/6,0,1920/6,0)
sayu_shadow=Crop(shadow_rgba,1920*3/6,0,1920/6,0)
yuzuha_shadow=Crop(shadow_rgba,1920*4/6,0,1920/6,0)
asami_shadow=Crop(shadow_rgba,1920*5/6,0,1920/6,0)



#a=BlankClip(hige_wo_soru_soshite_joshikousei_wo_hirou_tv_clean_op,length=134,color=color_black)
#b=BlankClip(hige_wo_soru_soshite_joshikousei_wo_hirou_tv_clean_op,length=134,color=color_white)



#furafura=TRIM_FIRST_CLIP(a,35)+TRIM_FIRST_CLIP(b,24)+TRIM_FIRST_CLIP(a,35) \
#	+Dissolve(TRIM_FIRST_CLIP(b,47),TRIM_FIRST_CLIP(a,30),TRIM_FIRST_CLIP(b,30),TRIM_FIRST_CLIP(a,30),TRIM_FIRST_CLIP(b,30),TRIM_FIRST_CLIP(a,29),TRIM_FIRST_CLIP(b,47),12)
furafura=TRIM_MIDDLE_CLIP(hige_wo_soru_soshite_joshikousei_wo_hirou_tv_07_sayu_clean_glass_02,35)+TRIM_MIDDLE_CLIP(hige_wo_soru_soshite_joshikousei_wo_hirou_tv_08_sayu_take_cotton_candy,24)+TRIM_FIRST_CLIP(hige_wo_soru_soshite_joshikousei_wo_hirou_tv_07_sayu_point_yoshida,35) \
	+FURAFURA_FLIP(FURAFURA_FLIP(FURAFURA_FLIP(FURAFURA_FLIP(FURAFURA_FLIP(FURAFURA_FLIP(TRIM_FIRST_CLIP(hige_wo_soru_soshite_joshikousei_wo_hirou_tv_01_sayu_cooking_01,47), \
		TRIM_MIDDLE_CLIP(hige_wo_soru_soshite_joshikousei_wo_hirou_tv_10_hashimoto_in_toyota_aqua_02,30),1,hashimoto_shadow), \
		TRIM_MIDDLE_CLIP(hige_wo_soru_soshite_joshikousei_wo_hirou_tv_13_asami_make_phone_call_under_tree,30),-1,asami_shadow), \
		TRIM_MIDDLE_CLIP(hige_wo_soru_soshite_joshikousei_wo_hirou_tv_02_airi_point_yoshida_then_move_finger_close_to_her_mouth,30),1,airi_shadow), \
		TRIM_FIRST_CLIP(hige_wo_soru_soshite_joshikousei_wo_hirou_tv_07_yuzuha_peep_in_back_of_monitor_02,30),-1,yuzuha_shadow), \
		TRIM_FIRST_CLIP(hige_wo_soru_soshite_joshikousei_wo_hirou_tv_02_yoshida_on_train_01,29),1,yoshida_shadow), \
		Trim(hige_wo_soru_soshite_joshikousei_wo_hirou_tv_02_sayu_show_smartphone,24,-47),-1,sayu_shadow)

# 25+22+26+24+26+20-10*5+12+10+10+13-3*3
omoide_shiritori_01=Merge(TRIM_MIDDLE_CLIP(hige_wo_soru_soshite_joshikousei_wo_hirou_tv_05_moon,25+22+26+24+26+20-10*5),Dissolve( \
		TRIM_FIRST_CLIP(hige_wo_soru_soshite_joshikousei_wo_hirou_tv_03_sayu_s_breast_is_grabbed,25), \
		TRIM_LAST_CLIP(hige_wo_soru_soshite_joshikousei_wo_hirou_tv_03_sayu_s_bra_and_pantie,22), \
		TRIM_FIRST_CLIP(hige_wo_soru_soshite_joshikousei_wo_hirou_tv_03_sayu_take_pantie,26), \
		TRIM_FIRST_CLIP(hige_wo_soru_soshite_joshikousei_wo_hirou_tv_03_sayu_show_bra_and_walking,24), \
		TRIM_LAST_CLIP(hige_wo_soru_soshite_joshikousei_wo_hirou_tv_03_sayu_wear_bra_and_pantie_and_is_grab,26), \
		TRIM_FIRST_CLIP(hige_wo_soru_soshite_joshikousei_wo_hirou_tv_09_sayu_wear_bra,20),10)) \
	+Dissolve( \
		TRIM_MIDDLE_CLIP(hige_wo_soru_soshite_joshikousei_wo_hirou_tv_09_sayu_masturbate_01,12), \
		TRIM_MIDDLE_CLIP(hige_wo_soru_soshite_joshikousei_wo_hirou_tv_03_sayu_and_kyouya_sex,10), \
		TRIM_MIDDLE_CLIP(hige_wo_soru_soshite_joshikousei_wo_hirou_tv_09_sayu_masturbate_03,10), \
		TRIM_FIRST_CLIP(hige_wo_soru_soshite_joshikousei_wo_hirou_tv_03_kyouya_lie_on_sayu_s_body,13),3)

# 23+39+35+56-5*3 「行かないで」「できるだけそばに」「似た者同士だ」「抱きしめたい」
shiritori_01=Dissolve( \
	TRIM_LAST_CLIP(hige_wo_soru_soshite_joshikousei_wo_hirou_tv_08_yuzuha_cry_02,23), \
	TRIM_MIDDLE_CLIP(hige_wo_soru_soshite_joshikousei_wo_hirou_tv_07_airi_run_finger_through_her_hair,39), \
	TRIM_FIRST_CLIP(hige_wo_soru_soshite_joshikousei_wo_hirou_tv_04_asami_run_finger_through_her_hair,35), \
	TRIM_LAST_CLIP(hige_wo_soru_soshite_joshikousei_wo_hirou_tv_02_sayu_stretch_out_her_hand,56),5)

# 25+22+26+24+26+20-10*5+12+10+10+13-3*3
omoide_shiritori_02=Merge(TRIM_FIRST_CLIP(hige_wo_soru_soshite_joshikousei_wo_hirou_tv_12_city_under_star_night_vertical,25+22+26+24+26+20-10*5),Dissolve( \
		TRIM_FIRST_CLIP(hige_wo_soru_soshite_joshikousei_wo_hirou_tv_10_hashimoto_see_front_side,25), \
		TRIM_LAST_CLIP(hige_wo_soru_soshite_joshikousei_wo_hirou_tv_04_airi_touch_her_ear,22), \
		TRIM_MIDDLE_CLIP(hige_wo_soru_soshite_joshikousei_wo_hirou_tv_06_asami_tear_under_star_night,26), \
		TRIM_FIRST_CLIP(hige_wo_soru_soshite_joshikousei_wo_hirou_tv_10_yuzuha_raise_hand,24), \
		TRIM_MIDDLE_CLIP(hige_wo_soru_soshite_joshikousei_wo_hirou_tv_07_yoshida_smoke_and_turn_back,26), \
		TRIM_FIRST_CLIP(hige_wo_soru_soshite_joshikousei_wo_hirou_tv_13_sayu_smile,20),10)) \
	+Dissolve( \
		TRIM_MIDDLE_CLIP(hige_wo_soru_soshite_joshikousei_wo_hirou_tv_10_cookbook,12), \
		TRIM_LAST_CLIP(hige_wo_soru_soshite_joshikousei_wo_hirou_tv_07_food,10), \
		TRIM_FIRST_CLIP(hige_wo_soru_soshite_joshikousei_wo_hirou_tv_05_snack,10), \
		TRIM_FIRST_CLIP(hige_wo_soru_soshite_joshikousei_wo_hirou_tv_13_cookbook_and_uniform_in_yoshida_s_home,13),3)

# 23+39+35+56-5*3 「すごく綺麗」「今ならわかるよ」「欲張りでいい」「一緒にいよう」
shiritori_02=Dissolve( \
	TRIM_MIDDLE_CLIP(hige_wo_soru_soshite_joshikousei_wo_hirou_tv_05_sayu_with_make_up_applied,23), \
	TRIM_FIRST_CLIP(hige_wo_soru_soshite_joshikousei_wo_hirou_tv_04_asami_turn_back_and_point,39), \
	Trim(hige_wo_soru_soshite_joshikousei_wo_hirou_tv_04_airi_touch_beer_mug,120,-35), \
	TRIM_FIRST_CLIP(hige_wo_soru_soshite_joshikousei_wo_hirou_tv_07_yuzuha_stretch_out_her_hand,56),5)



koukai=STILL_FIRST_FRAME(hige_wo_soru_soshite_joshikousei_wo_hirou_tv_13_op_01,5)+STILL_FIRST_FRAME(hige_wo_soru_soshite_joshikousei_wo_hirou_tv_13_op_02,6) \
	+STILL_FIRST_FRAME(hige_wo_soru_soshite_joshikousei_wo_hirou_tv_13_op_03,5)+STILL_FIRST_FRAME(hige_wo_soru_soshite_joshikousei_wo_hirou_tv_13_op_04,6) \
	+STILL_FIRST_FRAME(hige_wo_soru_soshite_joshikousei_wo_hirou_tv_13_op_05,5)+STILL_FIRST_FRAME(hige_wo_soru_soshite_joshikousei_wo_hirou_tv_13_op_06,6) \
	+STILL_FIRST_FRAME(hige_wo_soru_soshite_joshikousei_wo_hirou_tv_13_op_07,5)+STILL_FIRST_FRAME(hige_wo_soru_soshite_joshikousei_wo_hirou_tv_13_op_08,6) \
	+STILL_FIRST_FRAME(hige_wo_soru_soshite_joshikousei_wo_hirou_tv_13_op_09,5)+STILL_FIRST_FRAME(hige_wo_soru_soshite_joshikousei_wo_hirou_tv_13_op_10,6) \
	+STILL_FIRST_FRAME(hige_wo_soru_soshite_joshikousei_wo_hirou_tv_clean_ed_02,5)+STILL_FRAME(hige_wo_soru_soshite_joshikousei_wo_hirou_tv_clean_ed_02,144,6) \
	+SCALE_CG(STILL_FRAME(hige_wo_soru_soshite_joshikousei_wo_hirou_tv_clean_ed_02,279,67),0.5*Width(hige_wo_soru_soshite_joshikousei_wo_hirou_tv_clean_op),0.5*Height(hige_wo_soru_soshite_joshikousei_wo_hirou_tv_clean_op),1.2,1.0)

######## Combine ########

# hige_wo_soru_soshite_joshikousei_wo_hirou_tv_clean_op_01 1
# hige_wo_soru_soshite_joshikousei_wo_hirou_tv_clean_op_02 345/1950/5804
# hige_wo_soru_soshite_joshikousei_wo_hirou_tv_clean_op_03 615
# hige_wo_soru_soshite_joshikousei_wo_hirou_tv_clean_op_04 885/2189
# hige_wo_soru_soshite_joshikousei_wo_hirou_tv_clean_op_05 1150/2454
# hige_wo_soru_soshite_joshikousei_wo_hirou_tv_clean_op_06 1297/2601
# hige_wo_soru_soshite_joshikousei_wo_hirou_tv_clean_op_07 1420/2791/4932
# hige_wo_soru_soshite_joshikousei_wo_hirou_tv_clean_op_08 1549/2920/5061
# hige_wo_soru_soshite_joshikousei_wo_hirou_tv_clean_op_09 1687/3058/5199
# hige_wo_soru_soshite_joshikousei_wo_hirou_tv_clean_op_10 1803/3174/5315

# hige_wo_soru_soshite_joshikousei_wo_hirou_tv_clean_op_11 2090/5938/6005
# hige_wo_soru_soshite_joshikousei_wo_hirou_tv_clean_op_12 6089



hige_wo_soru_soshite_joshikousei_wo_hirou_tv_op_t01=BlankClip(hige_wo_soru_soshite_joshikousei_wo_hirou_tv_clean_op,length=1,color=color_black)+hige_wo_soru_soshite_joshikousei_wo_hirou_tv_clean_op_01+hige_wo_soru_soshite_joshikousei_wo_hirou_tv_clean_op_02

hige_wo_soru_soshite_joshikousei_wo_hirou_tv_op_t02=hige_wo_soru_soshite_joshikousei_wo_hirou_tv_clean_op_03+hige_wo_soru_soshite_joshikousei_wo_hirou_tv_clean_op_04
hige_wo_soru_soshite_joshikousei_wo_hirou_tv_op_t03=hige_wo_soru_soshite_joshikousei_wo_hirou_tv_clean_op_05+hige_wo_soru_soshite_joshikousei_wo_hirou_tv_clean_op_06
hige_wo_soru_soshite_joshikousei_wo_hirou_tv_op_t04=hige_wo_soru_soshite_joshikousei_wo_hirou_tv_clean_op_07+hige_wo_soru_soshite_joshikousei_wo_hirou_tv_clean_op_08
hige_wo_soru_soshite_joshikousei_wo_hirou_tv_op_t05=hige_wo_soru_soshite_joshikousei_wo_hirou_tv_clean_op_09+hige_wo_soru_soshite_joshikousei_wo_hirou_tv_clean_op_10

#TRIM_FIRST_CLIP(hige_wo_soru_soshite_joshikousei_wo_hirou_tv_clean_op_10,147)
#BlankClip(hige_wo_soru_soshite_joshikousei_wo_hirou_tv_clean_op,length=73,color=color_blue)+
hige_wo_soru_soshite_joshikousei_wo_hirou_tv_op_t06=TRIM_MIDDLE_CLIP(hige_wo_soru_soshite_joshikousei_wo_hirou_tv_08_sayu_stand_on_road,67-1)+TRIM_MIDDLE_CLIP(hige_wo_soru_soshite_joshikousei_wo_hirou_tv_11_yoshida_grab_sayu_back,12+12+12+12)+TRIM_MIDDLE_CLIP(hige_wo_soru_soshite_joshikousei_wo_hirou_tv_09_sayu_and_yuuko_walk_home_together,6+10)+FADE_OUT_WITH_BRIGHTNESS_OFFSET(TRIM_FIRST_CLIP(hige_wo_soru_soshite_joshikousei_wo_hirou_tv_13_sayu_probe_from_quilt,35),fade_length)

hige_wo_soru_soshite_joshikousei_wo_hirou_tv_op_t07=furafura
hige_wo_soru_soshite_joshikousei_wo_hirou_tv_op_t08=TRIM_MIDDLE_CLIP(hige_wo_soru_soshite_joshikousei_wo_hirou_tv_06_asami_and_sayu_sit_in_park_01,23)+TRIM_MIDDLE_CLIP(hige_wo_soru_soshite_joshikousei_wo_hirou_tv_08_sayu_and_yoshida_see_fireworks_02,48)+TRIM_MIDDLE_CLIP(hige_wo_soru_soshite_joshikousei_wo_hirou_tv_06_kyouya_push_sayu_down_01,76) \
	+TRIM_MIDDLE_CLIP(hige_wo_soru_soshite_joshikousei_wo_hirou_tv_03_yuzuha_turn_back_and_point_yoshida,58)+TRIM_LAST_CLIP(hige_wo_soru_soshite_joshikousei_wo_hirou_tv_01_sayu_rolling_on_bed,63)+TRIM_LAST_CLIP(hige_wo_soru_soshite_joshikousei_wo_hirou_tv_04_asami_sit_on_bed,41)+Trim(hige_wo_soru_soshite_joshikousei_wo_hirou_tv_01_sayu_turn_back_her_head_then_tear,16,-28)
hige_wo_soru_soshite_joshikousei_wo_hirou_tv_op_t09=omoide_shiritori_01+shiritori_01+TRIM_MIDDLE_CLIP(hige_wo_soru_soshite_joshikousei_wo_hirou_tv_01_sayu_and_her_boyfriend,68)+TRIM_FIRST_CLIP(hige_wo_soru_soshite_joshikousei_wo_hirou_tv_10_sayu_hold_yoshida_s_hand_against_breast,48) \
	+TRIM_MIDDLE_CLIP(hige_wo_soru_soshite_joshikousei_wo_hirou_tv_06_sayu_tear_and_turn_front,19)+TRIM_MIDDLE_CLIP(hige_wo_soru_soshite_joshikousei_wo_hirou_tv_09_yuuko_stand_on_edge_of_roof_and_turn_back,34+33)+TRIM_FIRST_CLIP(hige_wo_soru_soshite_joshikousei_wo_hirou_tv_09_sayu_sleep_with_tear,34)+TRIM_MIDDLE_CLIP(hige_wo_soru_soshite_joshikousei_wo_hirou_tv_12_sayu_s_mother_and_issa_see_sayu,35)

hige_wo_soru_soshite_joshikousei_wo_hirou_tv_op_t10=TRIM_FIRST_CLIP(hige_wo_soru_soshite_joshikousei_wo_hirou_tv_04_asami_see_happy_sayu,134)+TRIM_LAST_CLIP(hige_wo_soru_soshite_joshikousei_wo_hirou_tv_10_yoshida_touch_sayu_s_head_then_sayu_hug_yoshida_on_bed,128) \
	+TRIM_LAST_CLIP(hige_wo_soru_soshite_joshikousei_wo_hirou_tv_11_sayu_cry,135)+TRIM_FIRST_CLIP(hige_wo_soru_soshite_joshikousei_wo_hirou_tv_08_sayu_wear_yukata_03,133) \
	+TRIM_MIDDLE_CLIP(hige_wo_soru_soshite_joshikousei_wo_hirou_tv_11_sayu_take_hourglass,139)+TRIM_FIRST_CLIP(koukai,133)
hige_wo_soru_soshite_joshikousei_wo_hirou_tv_op_t11=TRIM_MIDDLE_CLIP(hige_wo_soru_soshite_joshikousei_wo_hirou_tv_10_sayu_and_yoshida_stand_in_park,134)+FADE_OUT_WITH_BRIGHTNESS_OFFSET(TRIM_FIRST_CLIP(hige_wo_soru_soshite_joshikousei_wo_hirou_tv_06_sayu_and_asami_walk_under_sunset,134),fade_length)

hige_wo_soru_soshite_joshikousei_wo_hirou_tv_op_t12=TRIM_FIRST_CLIP(hige_wo_soru_soshite_joshikousei_wo_hirou_tv_09_sayu_and_yuuko_sit_in_the_corner_of_classroom,34)+TRIM_LAST_CLIP(hige_wo_soru_soshite_joshikousei_wo_hirou_tv_09_yuuko_jump,41)+TRIM_FIRST_CLIP(hige_wo_soru_soshite_joshikousei_wo_hirou_tv_09_issa_catch_sayu_in_front_of_home,59) \
	+TRIM_LAST_CLIP(hige_wo_soru_soshite_joshikousei_wo_hirou_tv_09_sayu_is_stricken,34)+TRIM_FIRST_CLIP(CLIP_SPEED(hige_wo_soru_soshite_joshikousei_wo_hirou_tv_09_someone_bring_sayu_home,4.5,true),41)+TRIM_LAST_CLIP(hige_wo_soru_soshite_joshikousei_wo_hirou_tv_03_kyouya_cum_in_sayu_s_inside,59) \
	+TRIM_FIRST_CLIP(hige_wo_soru_soshite_joshikousei_wo_hirou_tv_01_yoshida_see_sayu_sit_in_lane,33)+TRIM_LAST_CLIP(hige_wo_soru_soshite_joshikousei_wo_hirou_tv_01_sayu_stand_up,37)+TRIM_LAST_CLIP(hige_wo_soru_soshite_joshikousei_wo_hirou_tv_01_yoshida_read_news_and_see_sayu_s_pantie,64) \
	+TRIM_FIRST_CLIP(hige_wo_soru_soshite_joshikousei_wo_hirou_tv_08_yoshida_grab_sayu_s_arm,16)+Trim(hige_wo_soru_soshite_joshikousei_wo_hirou_tv_05_airi_apply_make_up_to_sayu,20,-17)+TRIM_MIDDLE_CLIP(hige_wo_soru_soshite_joshikousei_wo_hirou_tv_08_sayu_hide_behind_yuzuha,17)+TRIM_MIDDLE_CLIP(hige_wo_soru_soshite_joshikousei_wo_hirou_tv_11_asami_hug_sayu,17)+TRIM_LAST_CLIP(hige_wo_soru_soshite_joshikousei_wo_hirou_tv_10_sayu_grab_her_breast,40)+Trim(CLIP_SPEED(hige_wo_soru_soshite_joshikousei_wo_hirou_tv_13_sayu_grab_yoshida_s_hand,2.0,true),6,-24)

hige_wo_soru_soshite_joshikousei_wo_hirou_tv_op_t13=omoide_shiritori_02+shiritori_02+TRIM_FIRST_CLIP(hige_wo_soru_soshite_joshikousei_wo_hirou_tv_03_sayu_sad,68)+TRIM_MIDDLE_CLIP(hige_wo_soru_soshite_joshikousei_wo_hirou_tv_03_yuzuha_open_hands_and_tell_sayu,48) \
	+TRIM_FIRST_CLIP(hige_wo_soru_soshite_joshikousei_wo_hirou_tv_09_sayu_leave_yoshida_then_run_away,19+34+33)+TRIM_MIDDLE_CLIP(hige_wo_soru_soshite_joshikousei_wo_hirou_tv_11_sayu_and_yoshida_in_cafe_shop,34+33)+TRIM_LAST_CLIP(hige_wo_soru_soshite_joshikousei_wo_hirou_tv_05_yoshida_turn_back,34)+TRIM_MIDDLE_CLIP(hige_wo_soru_soshite_joshikousei_wo_hirou_tv_11_sayu_see_outside_on_lexus_es,34)
hige_wo_soru_soshite_joshikousei_wo_hirou_tv_op_t14=TRIM_FIRST_CLIP(hige_wo_soru_soshite_joshikousei_wo_hirou_tv_06_sayu_hug_asami_in_park,134)+TRIM_FIRST_CLIP(hige_wo_soru_soshite_joshikousei_wo_hirou_tv_12_sayu_lean_on_yoshida_and_see_star_02,134)+TRIM_FIRST_CLIP(hige_wo_soru_soshite_joshikousei_wo_hirou_tv_12_sayu_lean_on_yoshida_and_see_star_03,134) \
	+TRIM_MIDDLE_CLIP(hige_wo_soru_soshite_joshikousei_wo_hirou_tv_09_sayu_hug_yoshida,12)+TRIM_FIRST_CLIP(hige_wo_soru_soshite_joshikousei_wo_hirou_tv_08_sayu_and_yuzuha_in_karaoke_01,12)+TRIM_FIRST_CLIP(hige_wo_soru_soshite_joshikousei_wo_hirou_tv_06_asami_rub_sayu_s_head,12)+Trim(hige_wo_soru_soshite_joshikousei_wo_hirou_tv_05_airi_hug_sayu_03,60,-12)+Trim(hige_wo_soru_soshite_joshikousei_wo_hirou_tv_04_sayu_and_asami_welcome_yoshida,100,-(6+13)) \
	+hige_wo_soru_soshite_joshikousei_wo_hirou_tv_clean_op_11+STILL_LAST_FRAME(hige_wo_soru_soshite_joshikousei_wo_hirou_tv_clean_op_11,20)+hige_wo_soru_soshite_joshikousei_wo_hirou_tv_clean_op_12+BlankClip(hige_wo_soru_soshite_joshikousei_wo_hirou_tv_clean_ed,length=24*6,color=color_black)



hige_wo_soru_soshite_joshikousei_wo_hirou_tv_op_mute=hige_wo_soru_soshite_joshikousei_wo_hirou_tv_op_t01+hige_wo_soru_soshite_joshikousei_wo_hirou_tv_op_t02 \
	+hige_wo_soru_soshite_joshikousei_wo_hirou_tv_op_t03+hige_wo_soru_soshite_joshikousei_wo_hirou_tv_op_t04 \
	+hige_wo_soru_soshite_joshikousei_wo_hirou_tv_op_t05+hige_wo_soru_soshite_joshikousei_wo_hirou_tv_op_t06 \
	+hige_wo_soru_soshite_joshikousei_wo_hirou_tv_op_t07+hige_wo_soru_soshite_joshikousei_wo_hirou_tv_op_t08+hige_wo_soru_soshite_joshikousei_wo_hirou_tv_op_t09 \
	+hige_wo_soru_soshite_joshikousei_wo_hirou_tv_op_t10+hige_wo_soru_soshite_joshikousei_wo_hirou_tv_op_t11 \
	+hige_wo_soru_soshite_joshikousei_wo_hirou_tv_op_t12+hige_wo_soru_soshite_joshikousei_wo_hirou_tv_op_t13+hige_wo_soru_soshite_joshikousei_wo_hirou_tv_op_t14

hige_wo_soru_soshite_joshikousei_wo_hirou_tv_op_mute

### export clip: hige_wo_soru_soshite_joshikousei_wo_hirou_tv_op_mute

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
global subtitle_size=23*2.25
global subtitle_text_color=color_white
global subtitle_halo_color=color_black
global subtitle_outside_halo_color=color_gray10

function SUBTITLE_FX(clip clip,string text,float x,float y,int start_frame,int end_frame,bool "is_furigana",bool "is_title"){
	is_title=Default(is_title,false)
	is_furigana=Default(is_furigana,false)

	outside_halo_color=is_title?color_darkturquoise:subtitle_outside_halo_color

	subtitle_mode=is_furigana?"ex":"ex" #"ex_thick_reduce_memory"
	size=is_furigana?subtitle_size*0.5:subtitle_size
	y=is_furigana?y-size:y

	return SUBTITLE_FX_FADE_IN_FADE_OUT_DOUBLE_HALO(clip,text,Round(x),Round(y),start_frame,end_frame,subtitle_front_fade_count,subtitle_rear_fade_count,subtitle_font,subtitle_effects,Round(size),subtitle_text_color,subtitle_halo_color,outside_halo_color,subtitle_mode)
}

### inherit end ###

ConvertToRGB32(matrix="Rec709")

SUBTITLE_FX("おもいでしりとり//DIALOGUE+|- by fielia@AVISynth",-subtitle_x,subtitle_y-subtitle_size,384,548,is_title=true)

SUBTITLE_FX("ほし    ねが                              あい",subtitle_x,subtitle_y-subtitle_size*2,43,172,true)
SUBTITLE_FX("星に願いを できるだけ愛を おもいでしりとり",subtitle_x,subtitle_y-subtitle_size*2,43,172)
SUBTITLE_FX("こと ば     つな        こた                  いま     き せつ                てんびん    よう",subtitle_x,subtitle_y,168,341,true)
SUBTITLE_FX("言葉を繋いで答えになれ 今、季節はまるで天秤の様に",subtitle_x,subtitle_y,168,341)

SUBTITLE_FX("                なに げ             えら        かえ    みち",subtitle_x,subtitle_y-subtitle_size*2,611,743,true)
SUBTITLE_FX("いつもの何気ないを選んだ帰り道",subtitle_x,subtitle_y-subtitle_size*2,611,743)
SUBTITLE_FX(" み おぼ         お                                       さが",subtitle_x,subtitle_y,740,878,true)
SUBTITLE_FX("見覚えは置いといて アタラシイ探し",subtitle_x,subtitle_y,740,878)

SUBTITLE_FX(" きのう              きょう    しあわ",subtitle_x,subtitle_y-subtitle_size*2,879,1028,true)
SUBTITLE_FX("昨日よりも今日は幸せなはずなのにね",subtitle_x,subtitle_y-subtitle_size*2,879,1028)
SUBTITLE_FX("         み                 わす                                      よくばり",subtitle_x,subtitle_y,1025,1145,true)
SUBTITLE_FX("よく見なくちゃ忘れちゃう やっかいで欲張りだ",subtitle_x,subtitle_y,1025,1145)

SUBTITLE_FX("ぬく            ひつよう                   て さぐ         ふ あん",subtitle_x,subtitle_y-subtitle_size*2,1141,1289,true)
SUBTITLE_FX("温もりが必要だったり 手探りで不安になったり",subtitle_x,subtitle_y-subtitle_size*2,1141,1289)
SUBTITLE_FX("                       むずか",subtitle_x,subtitle_y,1289,1385,true)
SUBTITLE_FX("どうしよう、難しいや",subtitle_x,subtitle_y,1289,1385)

SUBTITLE_FX("ring ring you",subtitle_x,subtitle_y-subtitle_size*4,1389,1418)
SUBTITLE_FX("ほし    ねが                              あい",subtitle_x,subtitle_y-subtitle_size*2,1412,1547,true)
SUBTITLE_FX("星に願いを できるだけ愛を おもいでしりとり",subtitle_x,subtitle_y-subtitle_size*2,1412,1547)
SUBTITLE_FX("    うれ                                                                                 み              て     つな",subtitle_x,subtitle_y,1543,1681,true)
SUBTITLE_FX("「嬉しい」「いつもありがとね」「ねえちゃんと見て」「手を繋ぎたい」",subtitle_x,subtitle_y,1543,1681)
SUBTITLE_FX("                                    むね                                 はかな    やじるし",subtitle_x,subtitle_y-subtitle_size*2,1682,1803,true)
SUBTITLE_FX("どこにいたってこの胸にいるよ けどまだ儚い矢印",subtitle_x,subtitle_y-subtitle_size*2,1682,1803)
SUBTITLE_FX(" ものがたり   ひも と                   いま     き せつ                てんびん    よう",subtitle_x,subtitle_y,1799,2023,true)
SUBTITLE_FX(" 物語を紐解いていけ 今、季節はまるで天秤の様に",subtitle_x,subtitle_y,1799,2023)

SUBTITLE_FX("                 た                                            た",subtitle_x,subtitle_y-subtitle_size*2,2183,2306,true)
SUBTITLE_FX("あっちを立てりゃきっと こっちが立たない",subtitle_x,subtitle_y-subtitle_size*2,2183,2306)
SUBTITLE_FX("                まよ     こ        けっきょくおくびょう    い  じ      ぱ",subtitle_x,subtitle_y,2301,2447,true)
SUBTITLE_FX("フラフラ迷い込んで結局 臆病で意地っ張りだ",subtitle_x,subtitle_y,2301,2447)

SUBTITLE_FX("だん ど                                                       こえ",subtitle_x,subtitle_y-subtitle_size*2,2448,2593,true)
SUBTITLE_FX("段取りがおぼつかないから うまく声もかけれないから",subtitle_x,subtitle_y-subtitle_size*2,2448,2593)
SUBTITLE_FX("                               い      き                                                 とお                ほどとお",subtitle_x,subtitle_y,2592,2765,true)
SUBTITLE_FX("ちゃんとしよう 言い聞かせたっていつもイメージ通りからは程遠いな",subtitle_x,subtitle_y,2592,2765)
SUBTITLE_FX("     し",subtitle_x,subtitle_y-subtitle_size*2,2758,2777,true)
SUBTITLE_FX("…知らない。",subtitle_x,subtitle_y-subtitle_size*2,2758,2777)

### pass clip: hige_wo_soru_soshite_joshikousei_wo_hirou_tv_op_mute

### prefetch: 5,2

### ###

SUBTITLE_FX("ほし    ねが                              あい",subtitle_x,subtitle_y,2784,2919,true)
SUBTITLE_FX("星に願いを できるだけ愛を おもいでしりとり",subtitle_x,subtitle_y,2784,2919)
SUBTITLE_FX("     い                                                                  に     ものどう し              だ",subtitle_x,subtitle_y-subtitle_size*2,2911,3052,true)
SUBTITLE_FX("「行かないで」「できるだけそばに」「似た者同士だ」「抱きしめたい」",subtitle_x,subtitle_y-subtitle_size*2,2911,3052)
SUBTITLE_FX("むね     し      つ                   かいけつさく   みちび    だ",subtitle_x,subtitle_y,3052,3174,true)
SUBTITLE_FX("胸を締め付ける その解決策を導き出せるのかは",subtitle_x,subtitle_y,3052,3174)
SUBTITLE_FX("                                                さき   はなし こわ",subtitle_x,subtitle_y-subtitle_size*2,3167,3392,true)
SUBTITLE_FX("ごめん…もうちょっとだけ先の話 壊れないで ふたつのバランスだけは",subtitle_x,subtitle_y-subtitle_size*2,3167,3392)

SUBTITLE_FX("せいかつ    つづ                  すき ま                  お",subtitle_x,subtitle_y,3583,3720,true)
SUBTITLE_FX("生活が続いてって 隙間でこぼれ落ちた",subtitle_x,subtitle_y,3583,3720)
SUBTITLE_FX("       ひかり                          な まえ     つ",subtitle_x,subtitle_y-subtitle_size*2,3719,3854,true)
SUBTITLE_FX("この光はなんだっけ 名前を付けなくちゃ",subtitle_x,subtitle_y-subtitle_size*2,3719,3854)
SUBTITLE_FX("                                  かんたん     き",subtitle_x,subtitle_y,3853,3972,true)
SUBTITLE_FX("どれがいいかな？ 簡単に決められない",subtitle_x,subtitle_y,3853,3972)
SUBTITLE_FX("            いまこうかい                                                                              ほん と",subtitle_x,subtitle_y-subtitle_size*2,3969,4199,true)
SUBTITLE_FX("だけど今後悔はしたくないってことだけはわかってるよ 本当だよ",subtitle_x,subtitle_y-subtitle_size*2,3969,4199)

SUBTITLE_FX("ほし    ねが                              あい                         かんが",subtitle_x,subtitle_y,4390,4524,true)
SUBTITLE_FX("星に願いを できるだけ愛を 「いっぱい考えてさ」",subtitle_x,subtitle_y,4390,4524)
SUBTITLE_FX("ほし    ねが                              あい          さが     だ",subtitle_x,subtitle_y-subtitle_size*2,4524,4700,true)
SUBTITLE_FX("星に願いを できるだけ愛を 「探し出したんだ」",subtitle_x,subtitle_y-subtitle_size*2,4524,4700)
SUBTITLE_FX("ほし    ねが                              あい                       き          ほ",subtitle_x,subtitle_y,4658,4784,true)
SUBTITLE_FX("星に願いを できるだけ愛を 「だから聞いて欲しいです」",subtitle_x,subtitle_y,4658,4784)
SUBTITLE_FX("こと ば     つな        こた                               い",subtitle_x,subtitle_y-subtitle_size*2,4777,4909,true)
SUBTITLE_FX("言葉を繋いで答えになれ やっと言えるんだ",subtitle_x,subtitle_y-subtitle_size*2,4777,4909)
SUBTITLE_FX("     す",subtitle_x,subtitle_y,4900,4919,true)
SUBTITLE_FX("「好きです。」",subtitle_x,subtitle_y,4900,4919)

SUBTITLE_FX("ほし    ねが                              あい",subtitle_x,subtitle_y-subtitle_size*2,4925,5059,true)
SUBTITLE_FX("星に願いを できるだけ愛を おもいでしりとり",subtitle_x,subtitle_y-subtitle_size*2,4925,5059)
SUBTITLE_FX("                 き れい        いま                                よく ば                         いっしょ",subtitle_x,subtitle_y,5051,5194,true)
SUBTITLE_FX("「すごく綺麗」「今ならわかるよ」「欲張りでいい」「一緒にいよう」",subtitle_x,subtitle_y,5051,5194)
SUBTITLE_FX("                                    むね                  さい ご     もん じ     つな",subtitle_x,subtitle_y-subtitle_size*2,5195,5316,true)
SUBTITLE_FX("どこにいたってこの胸にいるよ 最後の文字に繋ぐまで",subtitle_x,subtitle_y-subtitle_size*2,5195,5316)
SUBTITLE_FX(" ものがたり   ひも と                   いま     き せつ     か",subtitle_x,subtitle_y,5311,5459,true)
SUBTITLE_FX(" 物語を紐解いていけ 今、季節は変わろうとして",subtitle_x,subtitle_y,5311,5459)
SUBTITLE_FX("        てんびん    つぎ                    さが",subtitle_x,subtitle_y-subtitle_size*2,5454,5604,true)
SUBTITLE_FX("この天秤は次のバランス探す",subtitle_x,subtitle_y-subtitle_size*2,5454,5604)
SUBTITLE_FX("とど                とど",subtitle_x,subtitle_y,5646,5872,true)
SUBTITLE_FX("届くかな…届けるんだ！",subtitle_x,subtitle_y,5646,5872)

######## Thumbnail ########

is_thumbnail=false

is_thumbnail?ConvertToRGB32(hige_wo_soru_soshite_joshikousei_wo_hirou_tv_op_mute,matrix="Rec709"):last

######## Music ########

bgm_48khz=SSRC(WAVSource("src\01. おもいでしりとり.wav"),48000)
#bgm_96khz=WAVSource("src\01. おもいでしりとり.wav")
AudioDub(bgm_48khz)



thumbnail=Trim(1420,-24*5)



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
