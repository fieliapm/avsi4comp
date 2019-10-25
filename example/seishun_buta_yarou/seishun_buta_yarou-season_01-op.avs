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

Import("seishun_buta_yarou-season_01-common.avsi")

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

function MOTION_CURVE_INTERPOLATION(float x,float x0,float y0,float x1,float y1,float x2,float y2){
	x=Float(x)
	x0=Float(x0)
	y0=Float(y0)
	x1=Float(x1)
	y1=Float(y1)
	x2=Float(x2)
	y2=Float(y2)

	t=x<x1?(x-x0)/(x1-x0):(x-x1)/(x2-x1)

	return x<x0?y0:x>=x2?y2:(x<x1?CUBIC_BEZIER_CURVE(t,y0,(2.0*y0+1.0*y1)/3.0,(1.0*y0+3.0*y1)/4.0,y1):CUBIC_BEZIER_CURVE(t,y1,y2,y2,y2))
}

function MOTION_CURVE_EXP_CONVERGENCE(float x,float c,float x1,float y1,float x2,float y2){
	x=Float(x)
	x1=Float(x1)
	y1=Float(y1)
	x2=Float(x2)
	y2=Float(y2)

	t=(x-x1)/(x2-x1)
	return Pow(c,t*10.0)*(y1-y2)+y2
}

global picture_border=16

function ADD_PICTURE_BORDER(clip clip){
	return AddBorders(clip,picture_border,picture_border,picture_border,picture_border,color=OVERWRITE_COLOR_ALPHA(color_white,$FF))
}

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

dissolve_length_18=18
dissolve_length_12=12
dissolve_length_10=10
dissolve_length_24=24
dissolve_length_30=30

# pic part

dissolve_length_pic_part=4

clip_width=Width(seishun_buta_yarou_season_01_clean_op)
clip_height=Height(seishun_buta_yarou_season_01_clean_op)

pic_zero_frame=609

#pic_part_base_1=TRIM_FIRST_CLIP(seishun_buta_yarou_season_01_clean_op_03,124+dissolve_length_pic_part+67) #195
pic_part_base_1_1=seishun_buta_yarou_season_01_04_tomoe_meet_sakuta_and_yuuma_in_restaurant_staff_room
pic_part_base_1_2=Loop(TRIM_FIRST_CLIP(seishun_buta_yarou_season_01_04_tomoe_turn_back_in_restaurant_staff_room,1),84)

#pic_part_base_2_test=Trim(seishun_buta_yarou_season_01_clean_op_03,195+47,-(dissolve_length_18+126+dissolve_length_pic_part+68)) #216
pic_part_base_2=TRIM_LAST_CLIP(seishun_buta_yarou_season_01_09_syouko_and_kaede_hold_cats,dissolve_length_18+126+dissolve_length_pic_part+68) #216

pic_part_base=Dissolve(TRIM_FIRST_CLIP(pic_part_base_1_1,124+dissolve_length_pic_part),SCALE_CG(TRIM_MIDDLE_CLIP(CLIP_SPEED(seishun_buta_yarou_season_01_06_yokohama,0.5,true),dissolve_length_pic_part+67),0.7*Width(seishun_buta_yarou_season_01_clean_op),0.7*Height(seishun_buta_yarou_season_01_clean_op),1.0,1.1),dissolve_length_pic_part) \
	+Dissolve(MOVE_CG(TRIM_MIDDLE_CLIP(seishun_buta_yarou_season_01_01_shichirigahama_railroad_crossing,47+dissolve_length_18),-1,0,Width(seishun_buta_yarou_season_01_clean_op)/10.0,1.1),Dissolve(TRIM_FIRST_CLIP(pic_part_base_2,dissolve_length_18+126+dissolve_length_pic_part),SCALE_CG(TRIM_MIDDLE_CLIP(CLIP_SPEED(seishun_buta_yarou_season_01_06_enoshima,0.5,true),dissolve_length_pic_part+68),0.3*Width(seishun_buta_yarou_season_01_clean_op),0.3*Height(seishun_buta_yarou_season_01_clean_op),1.0,1.1),dissolve_length_pic_part),dissolve_length_18)

# pic part 1

pic10_start=720-pic_zero_frame
pic10_middle=731-pic_zero_frame
pic10_end=741-pic_zero_frame
pic11_start=744-pic_zero_frame
pic12_start=759-pic_zero_frame
pic13_start=776-pic_zero_frame
pic14_start=792-pic_zero_frame
pic1_end=803-pic_zero_frame

pic10_source=BlankClip(seishun_buta_yarou_season_01_clean_op,length=111,color=color_black)+pic_part_base_1_2 #195 viewable:84
pic11_source=BlankClip(seishun_buta_yarou_season_01_clean_op,length=pic11_start,color=color_black)+Trim(seishun_buta_yarou_season_01_12_nodoka_crouch,80,-(pic1_end-pic11_start+1)) #60
pic12_source=BlankClip(seishun_buta_yarou_season_01_clean_op,length=pic12_start,color=color_black)+TRIM_FIRST_CLIP(seishun_buta_yarou_season_01_03_rio_stir_coffee_and_walk,pic1_end-pic12_start+1) #45
pic13_source=BlankClip(seishun_buta_yarou_season_01_clean_op,length=pic13_start,color=color_black)+Trim(seishun_buta_yarou_season_01_10_kaede_wear_uniform,84,-(pic1_end-pic13_start+1)) #28
pic14_source=BlankClip(seishun_buta_yarou_season_01_clean_op,length=pic14_start,color=color_black)+Trim(seishun_buta_yarou_season_01_10_mai_turn_back_and_show_smart_phone,49,-(pic1_end-pic14_start+1)) #12

pic10=AddBorders(ADD_PICTURE_BORDER(Crop(ConvertToRGB32(pic10_source,matrix="Rec709"),clip_width*2/9,0,-clip_width*4/9,0)),clip_width*2/3,0,0,0)
pic11=AddBorders(ADD_PICTURE_BORDER(Crop(ConvertToRGB32(pic11_source,matrix="Rec709"),clip_width*2/8,0,-clip_width*4/8,0)),clip_width*3/4,0,0,0)
pic12=AddBorders(ADD_PICTURE_BORDER(Crop(ConvertToRGB32(pic12_source,matrix="Rec709"),clip_width*3/8,0,-clip_width*3/8,0)),0,0,clip_width*3/4,0)
pic13=AddBorders(ADD_PICTURE_BORDER(Crop(ConvertToRGB32(pic13_source,matrix="Rec709"),0,clip_height/4,0,-clip_height/4)),0,0,0,clip_height/2)
pic14=AddBorders(ADD_PICTURE_BORDER(Crop(ConvertToRGB32(pic14_source,matrix="Rec709"),0,clip_height/4,0,-clip_height/4)),0,clip_height/2,0,0)

motion_pic10=ScriptClip(pic10,"FAST_ZOOM(srcx=Float(picture_border)+clip_width,srcy=Float(picture_border)+clip_height*3.0/4.0,dsty=clip_height*3.0/4.0,dstx=current_frame<=pic10_middle?MOTION_CURVE_EXP_CONVERGENCE(current_frame,0.6,pic10_start,clip_width+clip_width/3.0+picture_border,pic10_middle,clip_width):MOTION_CURVE_EXP_CONVERGENCE(current_frame,0.75,pic10_middle,clip_width,pic10_end,clip_width-clip_width*3.0/4.0),factor=current_frame<=pic10_middle?1.0:MOTION_CURVE_EXP_CONVERGENCE(current_frame,0.75,pic10_middle,1.0,pic10_end,0.65))")

motion_pic11=ScriptClip(pic11,"FAST_ZOOM(srcx=Float(picture_border),srcy=Float(picture_border),dstx=0.0,dsty=MOTION_CURVE_INTERPOLATION(current_frame,pic11_start,clip_height+picture_border,pic11_start+5,clip_height/16.0,pic11_start+20,0))")
motion_pic12=ScriptClip(pic12,"FAST_ZOOM(srcx=Float(picture_border),srcy=Float(picture_border),dstx=0.0,dsty=MOTION_CURVE_INTERPOLATION(current_frame,pic12_start,-(clip_height+picture_border),pic12_start+5,-clip_height/16.0,pic12_start+20,0))")
motion_pic13=ScriptClip(pic13,"FAST_ZOOM(srcx=Float(picture_border),srcy=Float(picture_border),dstx=MOTION_CURVE_INTERPOLATION(current_frame,pic13_start,clip_width+picture_border,pic13_start+5,clip_width/32.0,pic13_start+20,0),dsty=0.0)")
motion_pic14=ScriptClip(pic14,"FAST_ZOOM(srcx=Float(picture_border),srcy=Float(picture_border),dstx=MOTION_CURVE_INTERPOLATION(current_frame,pic14_start,-(clip_width+picture_border),pic14_start+5,-clip_width/32.0,pic14_start+20,0),dsty=0.0)")

pic_part_1=Layer(ConvertToRGB32(pic_part_base,matrix="Rec709"),motion_pic10)
pic_part_1=Layer(pic_part_1,motion_pic13)
pic_part_1=Layer(pic_part_1,motion_pic12)
pic_part_1=Layer(pic_part_1,motion_pic14)
pic_part_1=Layer(pic_part_1,motion_pic11)
pic_part_1=CONVERT_BACK_TO_YV12(pic_part_1,matrix="Rec709")
pic_part_1=OVERWRITE_RANGE(pic_part_base,pic_part_1,pic10_start,pic1_end)

# pic part 2

pic20_start=982-pic_zero_frame
pic20_middle=993-pic_zero_frame
pic20_end=1003-pic_zero_frame
pic21_start=1006-pic_zero_frame
pic22_start=1022-pic_zero_frame
pic23_start=1038-pic_zero_frame
pic24_start=1055-pic_zero_frame
pic2_end=1066-pic_zero_frame

pic20_source=BlankClip(seishun_buta_yarou_season_01_clean_op,length=195+47,color=color_black)+pic_part_base_2 #216 viewable:85
#pic20_source=BlankClip(seishun_buta_yarou_season_01_clean_op,length=195+47+131,color=color_black)+pic_part_base_2 #216 viewable:85
pic21_source=BlankClip(seishun_buta_yarou_season_01_clean_op,length=pic21_start,color=color_black)+TRIM_FIRST_CLIP(seishun_buta_yarou_season_01_10_nodoka_dancing_and_singing_and_pass_mic_to_uduki,pic2_end-pic21_start+1) #61
pic22_source=BlankClip(seishun_buta_yarou_season_01_clean_op,length=pic22_start,color=color_black)+TRIM_LAST_CLIP(seishun_buta_yarou_season_01_09_mai_wear_fashioned,pic2_end-pic22_start+1) #45
pic23_source=BlankClip(seishun_buta_yarou_season_01_clean_op,length=pic23_start,color=color_black)+TRIM_LAST_CLIP(seishun_buta_yarou_season_01_07_tomoe_wear_yukata_and_open_door,pic2_end-pic23_start+1) #29
pic24_source=BlankClip(seishun_buta_yarou_season_01_clean_op,length=pic24_start,color=color_black)+TRIM_MIDDLE_CLIP(seishun_buta_yarou_season_01_08_rio_cry_01,pic2_end-pic24_start+1) #12

pic20=AddBorders(ADD_PICTURE_BORDER(Crop(ConvertToRGB32(pic20_source,matrix="Rec709"),clip_width*2/3,0,0,0)),0,0,clip_width*2/3,0)
pic21=AddBorders(ADD_PICTURE_BORDER(Crop(ConvertToRGB32(pic21_source,matrix="Rec709"),0,0,0,-clip_height/2)),0,clip_height/2,0,0)
pic22=AddBorders(ADD_PICTURE_BORDER(Crop(ConvertToRGB32(pic22_source,matrix="Rec709"),0,clip_height/4,0,-clip_height/4)),0,0,0,clip_height/2)
pic23=AddBorders(ADD_PICTURE_BORDER(Crop(ConvertToRGB32(pic23_source,matrix="Rec709"),clip_width*3/8,0,-clip_width*3/8,0)),clip_width*3/4,0,0,0)
pic24=AddBorders(ADD_PICTURE_BORDER(Crop(ConvertToRGB32(pic24_source,matrix="Rec709"),clip_width*3/8,0,-clip_width*3/8,0)),0,0,clip_width*3/4,0)

motion_pic20=ScriptClip(pic20,"FAST_ZOOM(srcx=Float(picture_border),srcy=Float(picture_border)+clip_height/4.0,dsty=clip_height/4.0,dstx=current_frame<=pic20_middle?MOTION_CURVE_EXP_CONVERGENCE(current_frame,0.6,pic20_start,-(clip_width/3.0+picture_border),pic20_middle,0):MOTION_CURVE_EXP_CONVERGENCE(current_frame,0.75,pic20_middle,0,pic20_end,clip_width*3.0/4.0),factor=current_frame<=pic20_middle?1.0:MOTION_CURVE_EXP_CONVERGENCE(current_frame,0.75,pic20_middle,1.0,pic20_end,0.65))")

motion_pic21=ScriptClip(pic21,"FAST_ZOOM(srcx=Float(picture_border),srcy=Float(picture_border),dstx=MOTION_CURVE_INTERPOLATION(current_frame,pic21_start,-(clip_width+picture_border),pic21_start+5,-clip_width/32.0,pic21_start+20,0),dsty=0.0)")
motion_pic22=ScriptClip(pic22,"FAST_ZOOM(srcx=Float(picture_border),srcy=Float(picture_border),dstx=MOTION_CURVE_INTERPOLATION(current_frame,pic22_start,clip_width+picture_border,pic22_start+5,clip_width/32.0,pic22_start+20,0),dsty=0.0)")
motion_pic23=ScriptClip(pic23,"FAST_ZOOM(srcx=Float(picture_border),srcy=Float(picture_border),dstx=0.0,dsty=MOTION_CURVE_INTERPOLATION(current_frame,pic23_start,-(clip_height+picture_border),pic23_start+5,-clip_height/16.0,pic23_start+20,0))")
motion_pic24=ScriptClip(pic24,"FAST_ZOOM(srcx=Float(picture_border),srcy=Float(picture_border),dstx=0.0,dsty=MOTION_CURVE_INTERPOLATION(current_frame,pic24_start,clip_height+picture_border,pic24_start+5,clip_height/16.0,pic24_start+20,0))")

pic_part_2=Layer(ConvertToRGB32(pic_part_base,matrix="Rec709"),motion_pic20)
pic_part_2=Layer(pic_part_2,motion_pic21)
pic_part_2=Layer(pic_part_2,motion_pic22)
pic_part_2=Layer(pic_part_2,motion_pic23)
pic_part_2=Layer(pic_part_2,motion_pic24)
pic_part_2=CONVERT_BACK_TO_YV12(pic_part_2,matrix="Rec709")
pic_part=OVERWRITE_RANGE(pic_part_1,pic_part_2,pic20_start,pic2_end)


######## Combine ########

# seishun_buta_yarou_season_01_clean_op_01 61
# seishun_buta_yarou_season_01_clean_op_02 473
# seishun_buta_yarou_season_01_clean_op_03 609/2659
# seishun_buta_yarou_season_01_clean_op_04 1465/1498/3515
# seishun_buta_yarou_season_01_clean_op_05 1527/3544/4619/4884
# seishun_buta_yarou_season_01_clean_op_06 1793/3810/5150
# seishun_buta_yarou_season_01_clean_op_07 2062/5419
# seishun_buta_yarou_season_01_clean_op_08 2324/5681



seishun_buta_yarou_season_01_op_t01=BlankClip(seishun_buta_yarou_season_01_clean_op,length=11,color=color_black)+FADE_OUT_WITH_BRIGHTNESS_OFFSET(FadeIn0(TRIM_MIDDLE_CLIP(seishun_buta_yarou_season_01_11_shichirigahama_scenery,50),dissolve_length_10),dissolve_length_10)+seishun_buta_yarou_season_01_clean_op_01+FADE_OUT_WITH_BRIGHTNESS_OFFSET(TRIM_LAST_CLIP(seishun_buta_yarou_season_01_01_playboy_bunny_walk_in_library,98+67),dissolve_length_10)+seishun_buta_yarou_season_01_clean_op_02

seishun_buta_yarou_season_01_op_t02=seishun_buta_yarou_season_01_clean_op_03
seishun_buta_yarou_season_01_op_t03=TRIM_LAST_CLIP(seishun_buta_yarou_season_01_09_nodoka_stomp_sakuta_s_foot,9)+TRIM_MIDDLE_CLIP(seishun_buta_yarou_season_01_08_sakuta_see_rio_fan_yuuma,9)+TRIM_MIDDLE_CLIP(seishun_buta_yarou_season_01_10_mai_and_nodoka_swap_body_digest,15)+TRIM_MIDDLE_CLIP(seishun_buta_yarou_season_01_06_enoshima_jinja_hetsumiya_01,9)+TRIM_MIDDLE_CLIP(seishun_buta_yarou_season_01_03_fuji_mountain_and_high_school_roof,9)+TRIM_MIDDLE_CLIP(seishun_buta_yarou_season_01_04_tomoe_fall_down_on_sakuta,11)
seishun_buta_yarou_season_01_op_t04=TRIM_FIRST_CLIP(seishun_buta_yarou_season_01_13_syouko_meet_sakuta_in_rain,124)+TRIM_MIDDLE_CLIP(seishun_buta_yarou_season_01_12_cat_jump_onto_table,64)+TRIM_FIRST_CLIP(seishun_buta_yarou_season_01_06_enoshima_jinja_entry,48)+TRIM_FIRST_CLIP(seishun_buta_yarou_season_01_10_sakuta_s_father_stand_up,11)+TRIM_MIDDLE_CLIP(seishun_buta_yarou_season_01_12_sakuta_s_mother_get_mad_01,8)+TRIM_FIRST_CLIP(seishun_buta_yarou_season_01_02_mai_s_mother_discard_mai,11) \
	+Dissolve(Dissolve(TRIM_FIRST_CLIP(seishun_buta_yarou_season_01_06_tomoe_shout_she_love_sakuta,114+dissolve_length_24),TRIM_LAST_CLIP(seishun_buta_yarou_season_01_05_tomoe_in_beach_under_sunset,dissolve_length_24+65+dissolve_length_30),dissolve_length_24),TRIM_FIRST_CLIP(seishun_buta_yarou_season_01_08_enoshima_dentetsu,dissolve_length_30+36),dissolve_length_30)
seishun_buta_yarou_season_01_op_t05=Trim(seishun_buta_yarou_season_01_12_syouko_and_sakuta_see_sea_01,182,-24)+Trim(seishun_buta_yarou_season_01_03_mai_point_sakuta,85,-9)+Dissolve(TRIM_FIRST_CLIP(seishun_buta_yarou_season_01_12_syouko_s_skirt,57+dissolve_length_18),TRIM_FIRST_CLIP(seishun_buta_yarou_season_01_06_tomoe_and_sakuta_hide_rain_in_beach,dissolve_length_18+18),dissolve_length_18) \
	+TRIM_MIDDLE_CLIP(seishun_buta_yarou_season_01_07_yuuma_dribble_basketball,58)+TRIM_MIDDLE_CLIP(seishun_buta_yarou_season_01_04_tomoe_disappointed,13)+Trim(seishun_buta_yarou_season_01_13_nodoka_show_mai_s_profile,48,-8)+Trim(seishun_buta_yarou_season_01_12_syouko_press_her_hair,90,-8)+TRIM_MIDDLE_CLIP(seishun_buta_yarou_season_01_07_rio_see_yuuma_play_basketball,8)+TRIM_MIDDLE_CLIP(seishun_buta_yarou_season_01_11_kaede_see_mirror,8)+Trim(seishun_buta_yarou_season_01_04_mai_feed_sakuta,42,-9)+TRIM_FIRST_CLIP(seishun_buta_yarou_season_01_02_tomoe_kick_sakuta_s_ass_02,24) \
	+TRIM_MIDDLE_CLIP(seishun_buta_yarou_season_01_10_nodoka_dancing_and_singing,66)

seishun_buta_yarou_season_01_op_t06=TRIM_LAST_CLIP(seishun_buta_yarou_season_01_10_shibuya,66)+TRIM_FIRST_CLIP(seishun_buta_yarou_season_01_08_syouko_and_kaede_see_rio_sit_in_front_of_fan,66)+TRIM_LAST_CLIP(seishun_buta_yarou_season_01_13_kanazawa_station,67)+TRIM_MIDDLE_CLIP(seishun_buta_yarou_season_01_07_sakuta_see_saki_angry,70)

seishun_buta_yarou_season_01_op_t07=pic_part \
	+Dissolve(Dissolve(MOVE_CG(TRIM_MIDDLE_CLIP(seishun_buta_yarou_season_01_12_kaede_hide,24+dissolve_length_12),0,1,Height(seishun_buta_yarou_season_01_clean_op)/10.0,1.1),MOVE_CG(TRIM_FIRST_CLIP(seishun_buta_yarou_season_01_01_sakuta_under_shichirigahama_sunset,dissolve_length_12+30+dissolve_length_12),-1,0,Width(seishun_buta_yarou_season_01_clean_op)/10.0,1.1),MOVE_CG(TRIM_LAST_CLIP(seishun_buta_yarou_season_01_03_mai_and_sakuta_walk_along_road,dissolve_length_12+102+dissolve_length_18),0,-1,Height(seishun_buta_yarou_season_01_clean_op)/10.0,1.1),dissolve_length_12),TRIM_LAST_CLIP(seishun_buta_yarou_season_01_10_sweet_bullet_jump,dissolve_length_18+133),dissolve_length_18) \
	+Dissolve(TRIM_MIDDLE_CLIP(seishun_buta_yarou_season_01_06_tomoe_happily_splash_water,32+dissolve_length_10),TRIM_FIRST_CLIP(seishun_buta_yarou_season_01_10_sakuta_and_nodoka_see_kaede_happily_run_away,dissolve_length_10+25),dissolve_length_10)
seishun_buta_yarou_season_01_op_t08=seishun_buta_yarou_season_01_clean_op_04
seishun_buta_yarou_season_01_op_t09=seishun_buta_yarou_season_01_clean_op_05 \
	+Dissolve(Dissolve(TRIM_FIRST_CLIP(seishun_buta_yarou_season_01_08_dawn_of_enoshima,114+dissolve_length_24),TRIM_LAST_CLIP(seishun_buta_yarou_season_01_11_kotomi_talk_with_sakuta,dissolve_length_24+65+dissolve_length_30),dissolve_length_24),TRIM_FIRST_CLIP(seishun_buta_yarou_season_01_05_nana_and_sakuta_see_tomoe_fall_into_sea,dissolve_length_30+36),dissolve_length_30)

seishun_buta_yarou_season_01_op_t10=TRIM_MIDDLE_CLIP(seishun_buta_yarou_season_01_08_yuuma_rio_sakuta_see_enoshima_fireworks,258)+FADE_OUT_WITH_BRIGHTNESS_OFFSET(TRIM_MIDDLE_CLIP(seishun_buta_yarou_season_01_02_rio_explain_schroedinger_s_cat,282),dissolve_length_10)

seishun_buta_yarou_season_01_op_t11=TRIM_MIDDLE_CLIP(seishun_buta_yarou_season_01_12_kaede_cry,124)+TRIM_LAST_CLIP(seishun_buta_yarou_season_01_05_sakuta_see_yuuma_and_rio_then_close_door_then_rio_open_door,64)+TRIM_MIDDLE_CLIP(seishun_buta_yarou_season_01_09_mai_pull_skirt,48)+TRIM_MIDDLE_CLIP(seishun_buta_yarou_season_01_04_rena_hinaki_aya_wave,11)+TRIM_FIRST_CLIP(seishun_buta_yarou_season_01_09_saki_dislike,8)+TRIM_MIDDLE_CLIP(seishun_buta_yarou_season_01_07_yuuma_shoot_backetball,11-1)
seishun_buta_yarou_season_01_op_t12=TRIM_FIRST_CLIP(seishun_buta_yarou_season_01_11_sakuta_hug_kaede,124)+TRIM_MIDDLE_CLIP(seishun_buta_yarou_season_01_01_shichirigahama_station,64)+TRIM_FIRST_CLIP(seishun_buta_yarou_season_01_05_yousuke_punch_sakuta,48)+TRIM_MIDDLE_CLIP(seishun_buta_yarou_season_01_11_kaede_sakuta_mai_nodoka_eat_together,11)+TRIM_MIDDLE_CLIP(seishun_buta_yarou_season_01_03_mai_walk_in_night_street,8)+TRIM_MIDDLE_CLIP(seishun_buta_yarou_season_01_05_tomoe_take_picture_with_sakuta,11) \
	+seishun_buta_yarou_season_01_clean_op_06
seishun_buta_yarou_season_01_op_t13=seishun_buta_yarou_season_01_clean_op_07+seishun_buta_yarou_season_01_clean_op_08

seishun_buta_yarou_season_01_op_t14=TRIM_MIDDLE_CLIP(seishun_buta_yarou_season_01_02_enoshima_dentetsu_train_inside,72)+TRIM_LAST_CLIP(seishun_buta_yarou_season_01_06_enoshima_street,66)+TRIM_MIDDLE_CLIP(seishun_buta_yarou_season_01_08_enoshima_fireworks,66)+TRIM_FIRST_CLIP(seishun_buta_yarou_season_01_08_kamakura_koukou_mae_station,57) \
	+SCALE_CG(TRIM_FIRST_CLIP(seishun_buta_yarou_season_01_13_sakuta_and_kaede_leave_hospital,207),0.5*Width(seishun_buta_yarou_season_01_clean_op),0.5*Height(seishun_buta_yarou_season_01_clean_op),1.0,1.1)+seishun_buta_yarou_season_01_13_syouko_turn_back_in_beach+BlankClip(seishun_buta_yarou_season_01_clean_op,length=24*4-Framecount(seishun_buta_yarou_season_01_13_syouko_turn_back_in_beach),color=color_black)



#seishun_buta_yarou_season_01_op_t03=Merge(seishun_buta_yarou_season_01_op_t03,seishun_buta_yarou_season_01_clean_op_04+BlankClip(seishun_buta_yarou_season_01_clean_op,length=4,color=color_black)+seishun_buta_yarou_season_01_clean_op_04)
#seishun_buta_yarou_season_01_op_t04=Merge(seishun_buta_yarou_season_01_op_t04,seishun_buta_yarou_season_01_clean_op_05+seishun_buta_yarou_season_01_clean_op_06)
#seishun_buta_yarou_season_01_op_t05=Merge(seishun_buta_yarou_season_01_op_t05,seishun_buta_yarou_season_01_clean_op_07+BlankClip(seishun_buta_yarou_season_01_clean_op,length=66,color=color_blue))
#seishun_buta_yarou_season_01_op_t07=Merge(seishun_buta_yarou_season_01_op_t07,seishun_buta_yarou_season_01_clean_op_03)
#seishun_buta_yarou_season_01_op_t09=Merge(seishun_buta_yarou_season_01_op_t09,seishun_buta_yarou_season_01_clean_op_05+seishun_buta_yarou_season_01_clean_op_06)
#seishun_buta_yarou_season_01_op_t11=Merge(seishun_buta_yarou_season_01_op_t11,TRIM_FIRST_CLIP(seishun_buta_yarou_season_01_clean_op_05,265))
#seishun_buta_yarou_season_01_op_t12=Merge(seishun_buta_yarou_season_01_op_t12,seishun_buta_yarou_season_01_clean_op_05+seishun_buta_yarou_season_01_clean_op_06)



seishun_buta_yarou_season_01_op_mute=seishun_buta_yarou_season_01_op_t01+seishun_buta_yarou_season_01_op_t02+seishun_buta_yarou_season_01_op_t03+seishun_buta_yarou_season_01_op_t04+seishun_buta_yarou_season_01_op_t05 \
	+seishun_buta_yarou_season_01_op_t06+seishun_buta_yarou_season_01_op_t07+seishun_buta_yarou_season_01_op_t08+seishun_buta_yarou_season_01_op_t09 \
	+seishun_buta_yarou_season_01_op_t10+seishun_buta_yarou_season_01_op_t11+seishun_buta_yarou_season_01_op_t12+seishun_buta_yarou_season_01_op_t13+seishun_buta_yarou_season_01_op_t14

seishun_buta_yarou_season_01_op_mute

### export clip: seishun_buta_yarou_season_01_op_mute

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
global subtitle_size=33*2.25
global subtitle_text_color=color_white
global subtitle_halo_color=color_deepskyblue
global subtitle_outside_halo_color=color_royalblue

function SUBTITLE_FX(clip clip,string text,float x,float y,int start_frame,int end_frame,bool "is_furigana",bool "is_title"){
	is_title=Default(is_title,false)
	is_furigana=Default(is_furigana,false)

	text_color=is_title?color_gold:subtitle_text_color

	#subtitle_mode=is_furigana?"ex":"ex_thick_reduce_memory"
	subtitle_mode="ex"
	size=is_furigana?subtitle_size*0.5:subtitle_size
	y=is_furigana?y-size:y

	return SUBTITLE_FX_FADE_IN_FADE_OUT_DOUBLE_HALO(clip,text,Round(x),Round(y),start_frame,end_frame,subtitle_front_fade_count,subtitle_rear_fade_count,subtitle_font,subtitle_effects,Round(size),text_color,subtitle_halo_color,subtitle_outside_halo_color,subtitle_mode)
}

### inherit end ###

ConvertToRGB32(matrix="Rec709")

SUBTITLE_FX("君のせい//the peggies|- by fielia@AVISynth",-subtitle_x,subtitle_y-subtitle_size,406,571,is_title=true)

SUBTITLE_FX("きみ              きみ              きみ               わたし",subtitle_x,subtitle_y,64,160,true)
SUBTITLE_FX("君のせい 君のせい 君のせいで私",subtitle_x,subtitle_y,64,160)
SUBTITLE_FX("おくびょう",subtitle_x-subtitle_size*0.5*0.5,subtitle_y-subtitle_size*2,189,253,true)
SUBTITLE_FX("臆病でかっこつかない",subtitle_x,subtitle_y-subtitle_size*2,189,253)
SUBTITLE_FX("きみ",subtitle_x,subtitle_y,271,312,true)
SUBTITLE_FX("君のせいだよ",subtitle_x,subtitle_y,271,312)

SUBTITLE_FX("すこ     の         まえがみ    かく            きみ     め",subtitle_x,subtitle_y-subtitle_size*2,604,758,true)
SUBTITLE_FX("少し伸びた前髪に隠れてる君の目",subtitle_x,subtitle_y-subtitle_size*2,604,758)
SUBTITLE_FX("                         み                                  き",subtitle_x,subtitle_y,754,854,true)
SUBTITLE_FX("ちょっとどこ見てんの？こっちに来て！",subtitle_x,subtitle_y,754,854)
SUBTITLE_FX("きみ   わたし    むちゅう                      むずか       こと    ひと",subtitle_x,subtitle_y-subtitle_size*2,870,1109,true)
SUBTITLE_FX("君が私を夢中にさせるのに難しい事は一つもない",subtitle_x,subtitle_y-subtitle_size*2,870,1109)

SUBTITLE_FX("ゆうがた    えき                  なみ    おと",subtitle_x,subtitle_y,1126,1251,true)
SUBTITLE_FX("夕方の駅のホーム 波の音",subtitle_x,subtitle_y,1126,1251)
SUBTITLE_FX("だま   わたし    み  す",subtitle_x,subtitle_y-subtitle_size*2,1259,1367,true)
SUBTITLE_FX("黙る私を見透かしたように",subtitle_x,subtitle_y-subtitle_size*2,1259,1367)
SUBTITLE_FX("            ふう    わら",subtitle_x,subtitle_y,1376,1462,true)
SUBTITLE_FX("そんな風に笑わないで",subtitle_x,subtitle_y,1376,1462)

SUBTITLE_FX("きみ              きみ              きみ               わたし",subtitle_x,subtitle_y-subtitle_size*2,1520,1615,true)
SUBTITLE_FX("君のせい 君のせい 君のせいで私",subtitle_x,subtitle_y-subtitle_size*2,1520,1615)
SUBTITLE_FX("おくびょう",subtitle_x-subtitle_size*0.5*0.5,subtitle_y,1643,1707,true)
SUBTITLE_FX("臆病でかっこつかない",subtitle_x,subtitle_y,1643,1707)
SUBTITLE_FX("こんなはずじゃないのに",subtitle_x,subtitle_y-subtitle_size*2,1709,1768)
SUBTITLE_FX("きみ              きみ              きみ               わたし",subtitle_x,subtitle_y,1784,1899,true)
SUBTITLE_FX("君のせい 君のせい 君のせいで私",subtitle_x,subtitle_y,1784,1899)
SUBTITLE_FX("だれ        きら",subtitle_x,subtitle_y-subtitle_size*2,1908,1993,true)
SUBTITLE_FX("誰かを嫌いになるの？",subtitle_x,subtitle_y-subtitle_size*2,1908,1993)
SUBTITLE_FX("            よる    むなさわ",subtitle_x,subtitle_y,2053,2161,true)
SUBTITLE_FX("こんな夜は胸騒ぎしかしないよ",subtitle_x,subtitle_y,2053,2161)
SUBTITLE_FX("                                    かま",subtitle_x,subtitle_y-subtitle_size*2,2172,2242,true)
SUBTITLE_FX("ハートのマシンガン構えて",subtitle_x,subtitle_y-subtitle_size*2,2172,2242)
SUBTITLE_FX(" よ ゆう                        きみ    ねら     う",subtitle_x,subtitle_y,2238,2387,true)
SUBTITLE_FX("余裕ぶっこいてる君に狙い撃ちするのさ",subtitle_x,subtitle_y,2238,2387)

### pass clip: seishun_buta_yarou_season_01_op_mute

### prefetch: 5,2

### ###

SUBTITLE_FX("いま    すこ    いた    きつ  かく",subtitle_x,subtitle_y-subtitle_size*2,2656,2785,true)
SUBTITLE_FX("今も少し痛む傷 隠してる",subtitle_x,subtitle_y-subtitle_size*2,2656,2785)
SUBTITLE_FX("せいふく ぬ                  み",subtitle_x,subtitle_y,2779,2905,true)
SUBTITLE_FX("制服脱いだって見えやしないほんとのこころ",subtitle_x,subtitle_y,2779,2905)
SUBTITLE_FX(" ふたり なら        ある             びみょう           きょ り かん",subtitle_x,subtitle_y-subtitle_size*2,2920,3074,true)
SUBTITLE_FX("二人並んで歩いても微妙すぎる距離感",subtitle_x,subtitle_y-subtitle_size*2,2920,3074)
SUBTITLE_FX("            ちか づ",subtitle_x,subtitle_y,3067,3158,true)
SUBTITLE_FX("もっと近付いてよ",subtitle_x,subtitle_y,3067,3158)

SUBTITLE_FX("さいてい    こと ば  い",subtitle_x,subtitle_y-subtitle_size*2,3174,3302,true)
SUBTITLE_FX("最低な言葉言ってみたりした",subtitle_x,subtitle_y-subtitle_size*2,3174,3302)
SUBTITLE_FX("                       おんな    こ",subtitle_x,subtitle_y,3309,3417,true)
SUBTITLE_FX("カワイソウな女の子ってやつに",subtitle_x,subtitle_y,3309,3417)
SUBTITLE_FX("                             よ ぼうせん",subtitle_x,subtitle_y-subtitle_size*2,3428,3513,true)
SUBTITLE_FX("ならないための予防線",subtitle_x,subtitle_y-subtitle_size*2,3428,3513)

SUBTITLE_FX("きみ              きみ              きみ               わたし",subtitle_x,subtitle_y,3536,3631,true)
SUBTITLE_FX("君のせい 君のせい 君のせいで私",subtitle_x,subtitle_y,3536,3631)
SUBTITLE_FX("わす                    こと",subtitle_x,subtitle_y-subtitle_size*2,3659,3722,true)
SUBTITLE_FX("忘れられない事ばっか",subtitle_x,subtitle_y-subtitle_size*2,3659,3722)
SUBTITLE_FX(" ふ                     こま",subtitle_x,subtitle_y,3726,3789,true)
SUBTITLE_FX("増えていって困るなぁ",subtitle_x,subtitle_y,3726,3789)
SUBTITLE_FX("きみ              きみ              きみ                いま",subtitle_x,subtitle_y-subtitle_size*2,3800,3896,true)
SUBTITLE_FX("君のせい 君のせい 君のせいで今ね",subtitle_x,subtitle_y-subtitle_size*2,3800,3896)
SUBTITLE_FX("わたし    き れい",subtitle_x-subtitle_size*0.5*0.5,subtitle_y,3925,4012,true)
SUBTITLE_FX("私は綺麗になるの",subtitle_x,subtitle_y,3925,4012)

SUBTITLE_FX("きみ                    いや             い               いま",subtitle_x,subtitle_y-subtitle_size*2,4611,4706,true)
SUBTITLE_FX("君じゃなきゃ嫌だって言いたい 今すぐ",subtitle_x,subtitle_y-subtitle_size*2,4611,4706)
SUBTITLE_FX("                        よる                               ま",subtitle_x,subtitle_y,4735,4860,true)
SUBTITLE_FX("ひとりきりの夜とずっと ここで待っていたんだよ",subtitle_x,subtitle_y,4735,4860)

SUBTITLE_FX("きみ              きみ              きみ               わたし",subtitle_x,subtitle_y-subtitle_size*2,4876,4971,true)
SUBTITLE_FX("君のせい 君のせい 君のせいで私",subtitle_x,subtitle_y-subtitle_size*2,4876,4971)
SUBTITLE_FX("おくびょう",subtitle_x-subtitle_size*0.5*0.5,subtitle_y,4998,5064,true)
SUBTITLE_FX("臆病でかっこつかない",subtitle_x,subtitle_y,4998,5064)
SUBTITLE_FX("こんなはずじゃないのに",subtitle_x,subtitle_y-subtitle_size*2,5066,5124)
SUBTITLE_FX("きみ              きみ              きみ               わたし",subtitle_x,subtitle_y,5140,5236,true)
SUBTITLE_FX("君のせい 君のせい 君のせいで私",subtitle_x,subtitle_y,5140,5236)
SUBTITLE_FX("だれ        きら",subtitle_x,subtitle_y-subtitle_size*2,5264,5350,true)
SUBTITLE_FX("誰かを嫌いになるの？",subtitle_x,subtitle_y-subtitle_size*2,5264,5350)
SUBTITLE_FX("            よる    むなさわ",subtitle_x,subtitle_y,5409,5518,true)
SUBTITLE_FX("こんな夜は胸騒ぎしかしないよ",subtitle_x,subtitle_y,5409,5518)
SUBTITLE_FX("                                    かま",subtitle_x,subtitle_y-subtitle_size*2,5528,5599,true)
SUBTITLE_FX("ハートのマシンガン構えて",subtitle_x,subtitle_y-subtitle_size*2,5528,5599)
SUBTITLE_FX(" よ ゆう                        きみ    ねら     う",subtitle_x,subtitle_y,5595,5747,true)
SUBTITLE_FX("余裕ぶっこいてる君に狙い撃ちするのさ",subtitle_x,subtitle_y,5595,5747)

######## Thumbnail ########

is_thumbnail=false

is_thumbnail?ConvertToRGB32(seishun_buta_yarou_season_01_op_mute,matrix="Rec709"):last

######## Music ########

bgm_48khz=SSRC(WAVSource("src\seishun_buta_yarou-season_01-op-01.wav"),48000)
Normalize(AudioDub(bgm_48khz))



thumbnail=Trim(947,-24*5)



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
