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

	Assert(IsRGB32(clip),"SUBTITLE_FX_FADE_IN_FADE_OUT(): clip only support RGB32 format")

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

function STACK_SIX_2(clip clip1,clip clip2,clip clip3,clip clip4,clip clip5,clip clip6){
	clip_height=Height(clip1)
	result_clip=StackVertical(StackHorizontal(clip1,clip2,clip3),StackHorizontal(clip4,clip5,clip6))
	result_clip=AddBorders(result_clip,0,clip_height/2,0,clip_height/2)
	return RESIZE_TO_REF_CLIP(result_clip,clip1)
}

function STACK_SIX(clip clip1,clip clip2,clip clip3,clip clip4,clip clip5,clip clip6){
	clip_height=Height(clip1)
	clip_left=AddBorders(StackVertical(clip1,clip4),0,clip_height/2,0,clip_height/2)
	clip_center=StackVertical(clip2,BlankClip(clip2,color=color_black),clip5)
	clip_right=AddBorders(StackVertical(clip3,clip6),0,clip_height/2,0,clip_height/2)
	result_clip=StackHorizontal(clip_left,clip_center,clip_right)
	return RESIZE_TO_REF_CLIP(result_clip,clip1)
}

function CUT_IMAGE(clip clip,int left,int top,int right,int bottom){
	return AddBorders(Crop(clip,left,top,-right,-bottom),left,top,right,bottom)
}

######## Pre Combine ########

dissolve_length=12



syouko_walking_interval=48.0
syouko_walking_amplitude_prototype=8.0
syouko_walking_dissolve=24

syouko_walking_up_down_amplitude=2.0
syouko_walking_shake_amplitude=0.5
syouko_hair_amplitude=4.0
syouko_skirt_amplitude=6.0



#syouko_walking_loop_base=TRIM_FIRST_CLIP(Dissolve(seishun_buta_yarou_season_01_07_syouko_see_and_discuss_horizon,seishun_buta_yarou_season_01_02_syouko_see_and_discuss_horizon,syouko_walking_dissolve),Framecount(seishun_buta_yarou_season_01_07_syouko_see_and_discuss_horizon))
#syouko_walking_loop_base=FlipHorizontal(syouko_walking_loop_base)
#syouko_walking_loop=Loop(syouko_walking_loop_base,5,syouko_walking_dissolve)

syouko_walking_loop=STILL_FIRST_FRAME(FlipHorizontal(seishun_buta_yarou_season_01_07_syouko_see_and_discuss_horizon),400)

syouko_walking_prototype=ScriptClip(syouko_walking_loop,"FAST_ZOOM(dsty=(Float(Height())*0.5)+(syouko_walking_amplitude_prototype*Cos(FLOOR_BS(current_frame,2.0)*Pi()*2.0*2.0/syouko_walking_interval)),factor=1.0+(2.0*syouko_walking_amplitude_prototype/Float(Height())),extend=true)")



syouko_side_fg=character_syouko_side
syouko_side_fg_center_x=Width(syouko_side_fg)/2
syouko_side_fg_center_y=Height(syouko_side_fg)/2
syouko_side_fg_alpha=ShowAlpha(syouko_side_fg)
syouko_side_fg=CONVERT_BACK_TO_YV12(syouko_side_fg,matrix="Rec709")
#syouko_side_fg=Tweak(syouko_side_fg,hue=16.0,sat=0.4,bright=-48.0)
syouko_side_fg=ColorYUV(syouko_side_fg,gain_y=-64.0,off_u=-2.0,off_v=2.0,cont_u=-160.0,cont_v=-160.0)
syouko_side_fg=ConvertToRGB32(syouko_side_fg,matrix="Rec709")
syouko_side_fg=Mask(syouko_side_fg,syouko_side_fg_alpha)

syouko_side_fg_body_top=CUT_IMAGE(syouko_side_fg,446,0,0,Height(syouko_side_fg)-319)
syouko_side_fg_body_bottom=CUT_IMAGE(syouko_side_fg,446,319,0,453)
syouko_side_fg_hair=CUT_IMAGE(syouko_side_fg,522,0,0,694)
syouko_side_fg_skirt=CUT_IMAGE(syouko_side_fg,0,319,500,453)

syouko_walking_fg_hair=Zoom(syouko_side_fg_hair,srcx="526.0",srcy="52.0",dstx="526.0",dsty="52.0",angle="-syouko_hair_amplitude*(1.0+Cos(FLOOR_BS(n,2.0)*Pi()*2.0*2.0/syouko_walking_interval))")
syouko_walking_fg_skirt=Zoom(syouko_side_fg_skirt,srcx="500.0",srcy="319.0",dstx="500.0",dsty="319.0",angle="syouko_skirt_amplitude*(1.0+Cos(FLOOR_BS(n,2.0)*Pi()*2.0*2.0/syouko_walking_interval))")

syouko_walking_fg=Layer(Layer(syouko_walking_fg_skirt,syouko_walking_fg_hair),Layer(syouko_side_fg_body_bottom,syouko_side_fg_body_top))

syouko_walking_fg=Zoom(syouko_walking_fg,dstx="936.0",dsty="454.0+syouko_walking_up_down_amplitude*Cos(FLOOR_BS(n,2.0)*Pi()*2.0*2.0/syouko_walking_interval)",factor="0.65",angle="-5.0+syouko_walking_shake_amplitude*Cos(FLOOR_BS(n,2.0)*Pi()*2.0*2.0/syouko_walking_interval)",width=Width(seishun_buta_yarou_season_01_clean_ed_tomoe_02),height=Height(seishun_buta_yarou_season_01_clean_ed_tomoe_02))
syouko_walking_fg=Blur(syouko_walking_fg,1.58)

syouko_walking_bg=ConvertToRGB32(seishun_buta_yarou_season_01_clean_ed_tomoe_02,matrix="Rec709")
syouko_walking_fg_loop=Loop(syouko_walking_fg,Ceil(Framecount(syouko_walking_bg)/Framecount(syouko_walking_fg)))
syouko_walking=Layer(syouko_walking_bg,syouko_walking_fg_loop,"Add")
syouko_walking=CONVERT_BACK_TO_YV12(syouko_walking,matrix="Rec709")



seishun_buta_yarou_season_01_ed_stack_six_03_04_part1=STACK_SIX(TRIM_FIRST_CLIP(seishun_buta_yarou_season_01_clean_ed_mai_03,46)+TRIM_FIRST_CLIP(seishun_buta_yarou_season_01_clean_ed_mai_04,240)+TRIM_FIRST_CLIP(seishun_buta_yarou_season_01_clean_ed_rio_04,240), \
	TRIM_FIRST_CLIP(seishun_buta_yarou_season_01_clean_ed_tomoe_03,46)+TRIM_FIRST_CLIP(seishun_buta_yarou_season_01_clean_ed_tomoe_04,240)+TRIM_FIRST_CLIP(seishun_buta_yarou_season_01_clean_ed_nodoka_04,240), \
	TRIM_FIRST_CLIP(seishun_buta_yarou_season_01_clean_ed_rio_03,46)+TRIM_FIRST_CLIP(seishun_buta_yarou_season_01_clean_ed_rio_04,240)+TRIM_FIRST_CLIP(seishun_buta_yarou_season_01_clean_ed_kaede_04,240), \
	TRIM_FIRST_CLIP(seishun_buta_yarou_season_01_clean_ed_nodoka_03,46)+TRIM_FIRST_CLIP(seishun_buta_yarou_season_01_clean_ed_nodoka_04,240)+TRIM_FIRST_CLIP(seishun_buta_yarou_season_01_clean_ed_mai_04,240), \
	TRIM_FIRST_CLIP(seishun_buta_yarou_season_01_clean_ed_kaede_03,46)+TRIM_FIRST_CLIP(seishun_buta_yarou_season_01_clean_ed_kaede_04,240)+TRIM_FIRST_CLIP(seishun_buta_yarou_season_01_clean_ed_tomoe_04,240), \
	TRIM_FIRST_CLIP(seishun_buta_yarou_season_01_01_anime_interval,46))

seishun_buta_yarou_season_01_ed_stack_six_03_04_part2=STACK_SIX(TRIM_FIRST_CLIP(seishun_buta_yarou_season_01_clean_ed_mai_03,46)+TRIM_FIRST_CLIP(seishun_buta_yarou_season_01_clean_ed_mai_04,240)+TRIM_FIRST_CLIP(seishun_buta_yarou_season_01_clean_ed_rio_04,240), \
	TRIM_FIRST_CLIP(seishun_buta_yarou_season_01_clean_ed_tomoe_03,46)+TRIM_FIRST_CLIP(seishun_buta_yarou_season_01_clean_ed_tomoe_04,240)+TRIM_FIRST_CLIP(seishun_buta_yarou_season_01_clean_ed_nodoka_04,240), \
	TRIM_FIRST_CLIP(seishun_buta_yarou_season_01_clean_ed_rio_03,46)+TRIM_FIRST_CLIP(seishun_buta_yarou_season_01_clean_ed_rio_04,240)+TRIM_FIRST_CLIP(seishun_buta_yarou_season_01_clean_ed_kaede_04,240), \
	TRIM_FIRST_CLIP(seishun_buta_yarou_season_01_clean_ed_nodoka_03,46)+TRIM_FIRST_CLIP(seishun_buta_yarou_season_01_clean_ed_nodoka_04,240)+TRIM_FIRST_CLIP(seishun_buta_yarou_season_01_clean_ed_mai_04,240), \
	TRIM_FIRST_CLIP(seishun_buta_yarou_season_01_clean_ed_kaede_03,46)+TRIM_FIRST_CLIP(seishun_buta_yarou_season_01_clean_ed_kaede_04,240)+TRIM_FIRST_CLIP(seishun_buta_yarou_season_01_clean_ed_tomoe_04,240), \
	TRIM_FIRST_CLIP(seishun_buta_yarou_season_01_02_anime_interval,46))

seishun_buta_yarou_season_01_ed_stack_six_03_04_part3=STACK_SIX(TRIM_FIRST_CLIP(seishun_buta_yarou_season_01_clean_ed_mai_02,26)+TRIM_FIRST_CLIP(seishun_buta_yarou_season_01_clean_ed_mai_03,46), \
	TRIM_FIRST_CLIP(seishun_buta_yarou_season_01_clean_ed_tomoe_02,26)+TRIM_FIRST_CLIP(seishun_buta_yarou_season_01_clean_ed_tomoe_03,46), \
	TRIM_FIRST_CLIP(seishun_buta_yarou_season_01_clean_ed_rio_02,26)+TRIM_FIRST_CLIP(seishun_buta_yarou_season_01_clean_ed_rio_03,46), \
	TRIM_FIRST_CLIP(seishun_buta_yarou_season_01_clean_ed_nodoka_02,26)+TRIM_FIRST_CLIP(seishun_buta_yarou_season_01_clean_ed_nodoka_03,46), \
	TRIM_FIRST_CLIP(seishun_buta_yarou_season_01_clean_ed_kaede_02,26)+TRIM_FIRST_CLIP(seishun_buta_yarou_season_01_clean_ed_kaede_03,46), \
	TRIM_FIRST_CLIP(seishun_buta_yarou_season_01_01_anime_interval,26+46))

seishun_buta_yarou_season_01_ed_stack_six_04_05_06=STACK_SIX(TRIM_FIRST_CLIP(seishun_buta_yarou_season_01_clean_ed_mai_04,145)+seishun_buta_yarou_season_01_clean_ed_mai_05+seishun_buta_yarou_season_01_clean_ed_mai_06, \
	TRIM_FIRST_CLIP(seishun_buta_yarou_season_01_clean_ed_tomoe_04,145)+seishun_buta_yarou_season_01_clean_ed_tomoe_05+seishun_buta_yarou_season_01_clean_ed_tomoe_06, \
	TRIM_FIRST_CLIP(seishun_buta_yarou_season_01_clean_ed_rio_04,145)+Trim(seishun_buta_yarou_season_01_clean_ed_rio_05,4,0)+seishun_buta_yarou_season_01_clean_ed_rio_06, \
	TRIM_FIRST_CLIP(seishun_buta_yarou_season_01_clean_ed_nodoka_04,145)+seishun_buta_yarou_season_01_clean_ed_nodoka_05+seishun_buta_yarou_season_01_clean_ed_nodoka_06, \
	TRIM_FIRST_CLIP(seishun_buta_yarou_season_01_clean_ed_kaede_04,145)+seishun_buta_yarou_season_01_clean_ed_kaede_05+seishun_buta_yarou_season_01_clean_ed_kaede_06, \
	seishun_buta_yarou_season_01_02_anime_interval)

######## Combine ########

# seishun_buta_yarou_season_01_clean_ed_01 -8                                      | -6 (mai) -8 (tomoe) -8 (rio) -7 (nodoka) -7 (kaede)
# seishun_buta_yarou_season_01_clean_ed_02 496/976/2235/2714                       | 498 (mai) 496 (tomoe) 496 (rio) 496 (nodoka) 497 (kaede)
# seishun_buta_yarou_season_01_clean_ed_03 1472/3210/4469                          | 1472 (mai) 1471 (tomoe) 1472 (rio) 1472 (nodoka) 1472 (kaede)
# seishun_buta_yarou_season_01_clean_ed_04 1518/1758/3256/3496/4515/4755/4995/5235 | 1518 (mai) 1517 (tomoe) 1518 (rio) 1518 (nodoka) 1518 (kaede)
# seishun_buta_yarou_season_01_clean_ed_05 5380                                    | 5381 (mai) 5379 (tomoe) 5376 (rio) 5380 (nodoka) 5380 (kaede)
# seishun_buta_yarou_season_01_clean_ed_06 5483                                    | 5484 (mai) 5482 (tomoe) 5483 (rio) 5483 (nodoka) 5479 (kaede)



op_music_start=8

seishun_buta_yarou_season_01_ed_00=Trim(seishun_buta_yarou_season_01_clean_ed_mai_01,0,op_music_start-1)

seishun_buta_yarou_season_01_ed_t01=Trim(Trim(seishun_buta_yarou_season_01_clean_ed_mai_01,op_music_start,-496),0,122)+Trim(Trim(seishun_buta_yarou_season_01_clean_ed_tomoe_01,8,-496),123,241)+Trim(Trim(seishun_buta_yarou_season_01_clean_ed_rio_01,8,-496),242,361)+Trim(Trim(seishun_buta_yarou_season_01_clean_ed_nodoka_01,7,-496),362,436)+Trim(Trim(seishun_buta_yarou_season_01_clean_ed_kaede_01,7,-496),437,495)
seishun_buta_yarou_season_01_ed_t02=Dissolve(TRIM_FIRST_CLIP(seishun_buta_yarou_season_01_clean_ed_mai_02,180),TRIM_FIRST_CLIP(seishun_buta_yarou_season_01_clean_ed_tomoe_02,dissolve_length+300), \
	TRIM_FIRST_CLIP(seishun_buta_yarou_season_01_clean_ed_kaede_02,dissolve_length+180),TRIM_FIRST_CLIP(syouko_walking,dissolve_length+195),TRIM_FIRST_CLIP(seishun_buta_yarou_season_01_clean_ed_nodoka_02,dissolve_length+121),dissolve_length)
seishun_buta_yarou_season_01_ed_t03=seishun_buta_yarou_season_01_ed_stack_six_03_04_part1

seishun_buta_yarou_season_01_ed_t04=TRIM_LAST_CLIP(seishun_buta_yarou_season_01_02_syouko_introduce_herself_on_the_beach,237)

seishun_buta_yarou_season_01_ed_t05=Dissolve(TRIM_FIRST_CLIP(syouko_walking,180),TRIM_FIRST_CLIP(seishun_buta_yarou_season_01_clean_ed_nodoka_02,dissolve_length+299), \
	TRIM_FIRST_CLIP(seishun_buta_yarou_season_01_clean_ed_kaede_02,dissolve_length+180),TRIM_FIRST_CLIP(seishun_buta_yarou_season_01_clean_ed_rio_02,dissolve_length+195),TRIM_FIRST_CLIP(seishun_buta_yarou_season_01_clean_ed_mai_02,dissolve_length+121),dissolve_length)
seishun_buta_yarou_season_01_ed_t06=seishun_buta_yarou_season_01_ed_stack_six_03_04_part2

seishun_buta_yarou_season_01_ed_t07=MOVE_CG(STILL_FIRST_FRAME(seishun_buta_yarou_season_01_06_enoshima_sea_candle_under_sunset,237),0,1,Height(seishun_buta_yarou_season_01_clean_op)/10.0,1.1)

seishun_buta_yarou_season_01_ed_t08=TRIM_FIRST_CLIP(syouko_walking,120)+TRIM_FIRST_CLIP(seishun_buta_yarou_season_01_clean_ed_kaede_02,120) \
	+TRIM_FIRST_CLIP(seishun_buta_yarou_season_01_clean_ed_nodoka_02,60)+TRIM_FIRST_CLIP(seishun_buta_yarou_season_01_clean_ed_rio_02,60) \
	+TRIM_FIRST_CLIP(seishun_buta_yarou_season_01_clean_ed_tomoe_02,50)+TRIM_FIRST_CLIP(seishun_buta_yarou_season_01_clean_ed_mai_02,60)+seishun_buta_yarou_season_01_ed_stack_six_03_04_part3

seishun_buta_yarou_season_01_ed_t09=Dissolve(TRIM_FIRST_CLIP(seishun_buta_yarou_season_01_clean_ed_mai_04,120),TRIM_FIRST_CLIP(seishun_buta_yarou_season_01_clean_ed_tomoe_04,dissolve_length+120),TRIM_FIRST_CLIP(seishun_buta_yarou_season_01_clean_ed_rio_04,dissolve_length+120),TRIM_FIRST_CLIP(seishun_buta_yarou_season_01_clean_ed_nodoka_04,dissolve_length+120), \
	TRIM_FIRST_CLIP(seishun_buta_yarou_season_01_clean_ed_kaede_04,dissolve_length+120),TRIM_FIRST_CLIP(FlipHorizontal(seishun_buta_yarou_season_01_12_syouko_press_her_hair),dissolve_length+120),dissolve_length)+seishun_buta_yarou_season_01_ed_stack_six_04_05_06+BlankClip(seishun_buta_yarou_season_01_clean_ed_mai_v1,length=24*7,color=color_black)



seishun_buta_yarou_season_01_ed_mute=seishun_buta_yarou_season_01_ed_t01+seishun_buta_yarou_season_01_ed_t02+seishun_buta_yarou_season_01_ed_t03 \
	+seishun_buta_yarou_season_01_ed_t04+seishun_buta_yarou_season_01_ed_t05+seishun_buta_yarou_season_01_ed_t06 \
	+seishun_buta_yarou_season_01_ed_t07+seishun_buta_yarou_season_01_ed_t08+seishun_buta_yarou_season_01_ed_t09

seishun_buta_yarou_season_01_ed_mute

### export clip: seishun_buta_yarou_season_01_ed_mute,seishun_buta_yarou_season_01_ed_00

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
global subtitle_halo_color=color_black

mai_color=color_skyblue
tomoe_color=color_yellowgreen
rio_color=color_pink
nodoka_color=color_mediumaquamarine
kaede_color=color_orange
syouko_color=color_mediumpurple
three_color=color_gray
all_color=color_gray10

function SUBTITLE_FX(clip clip,string text,float x,float y,int start_frame,int end_frame,int subtitle_color,bool "is_furigana",bool "is_title"){
	is_title=Default(is_title,false)
	is_furigana=Default(is_furigana,false)

	text_color=is_title?color_gold:subtitle_text_color
	halo_color=is_title?color_deepskyblue:subtitle_halo_color
	outside_halo_color=is_title?color_royalblue:subtitle_color

	#subtitle_mode=is_furigana?"ex":"ex_thick_reduce_memory"
	subtitle_mode="ex"
	size=is_furigana?subtitle_size*0.5:subtitle_size
	y=is_furigana?y-size:y

	return SUBTITLE_FX_FADE_IN_FADE_OUT_DOUBLE_HALO(clip,text,Round(x),Round(y),start_frame,end_frame,subtitle_front_fade_count,subtitle_rear_fade_count,subtitle_font,subtitle_effects,Round(size),text_color,halo_color,outside_halo_color,subtitle_mode)
}

### inherit end ###

ConvertToRGB32(matrix="Rec709")

SUBTITLE_FX("不可思議のカルテ//桜島麻衣(瀬戸麻沙美)  |古賀朋絵(東山奈央)    |双葉理央(種崎敦美)    |豊浜のどか(内田真礼)  |梓川かえで(久保ユリカ)|牧之原翔子(水瀬いのり)||- by fielia@AVISynth",-subtitle_x,subtitle_y-subtitle_size*7,3765,3945,all_color,is_title=true)

SUBTITLE_FX("                 み        しょうたい",subtitle_x,subtitle_y,117,229,tomoe_color,is_furigana=true)
SUBTITLE_FX("あなたの見てる正体",subtitle_x,subtitle_y,117,229,tomoe_color)
SUBTITLE_FX("だれ     よ",subtitle_x,subtitle_y-subtitle_size*2,237,354,rio_color,is_furigana=true)
SUBTITLE_FX("誰も読めないカルテ",subtitle_x,subtitle_y-subtitle_size*2,237,354,rio_color)
SUBTITLE_FX(" ふ  か  し  ぎ    し",subtitle_x,subtitle_y,356,474,three_color,is_furigana=true)
SUBTITLE_FX("不可思議 知りたいだけ",subtitle_x,subtitle_y,356,474,three_color)

SUBTITLE_FX("うそ      げんじつ",subtitle_x,subtitle_y-subtitle_size*2,492,656,mai_color,is_furigana=true)
SUBTITLE_FX("嘘も 現実も",subtitle_x,subtitle_y-subtitle_size*2,492,656,mai_color)
SUBTITLE_FX("                  しんじつ                  ほんとう",subtitle_x,subtitle_y,672,954,tomoe_color,is_furigana=true)
SUBTITLE_FX("どっちも 真実だったの 本当よ",subtitle_x,subtitle_y,672,954,tomoe_color)
SUBTITLE_FX(" きょう",subtitle_x,subtitle_y-subtitle_size*2,970,1140,kaede_color,is_furigana=true)
SUBTITLE_FX("今日もひとりごと",subtitle_x,subtitle_y-subtitle_size*2,970,1140,kaede_color)
SUBTITLE_FX("                 む  り",subtitle_x,subtitle_y,1150,1315,syouko_color,is_furigana=true)
SUBTITLE_FX("なんにも無理をしないで",subtitle_x,subtitle_y,1150,1315,syouko_color)
SUBTITLE_FX("                                                          あい",subtitle_x,subtitle_y,1345,1470,nodoka_color,is_furigana=true)
SUBTITLE_FX("                       わたし愛されたい",subtitle_x,subtitle_y,1345,1470,nodoka_color)

SUBTITLE_FX(" う  や  む  や                     かる     めまい",subtitle_x,subtitle_y-subtitle_size*2,1494,1612,all_color,is_furigana=true)
SUBTITLE_FX("有耶無耶 さよなら 軽い眩暈",subtitle_x,subtitle_y-subtitle_size*2,1494,1612,all_color)
SUBTITLE_FX("                           げんしょうかい",subtitle_x,subtitle_y,1614,1727,all_color,is_furigana=true)
SUBTITLE_FX("あなたのいない現象界",subtitle_x,subtitle_y,1614,1727,all_color)
SUBTITLE_FX("だれ     よ",subtitle_x,subtitle_y-subtitle_size*2,1735,1855,all_color,is_furigana=true)
SUBTITLE_FX("誰も読めないカルテ",subtitle_x,subtitle_y-subtitle_size*2,1735,1855,all_color)
SUBTITLE_FX(" じ  い しき  あふ     だ",subtitle_x,subtitle_y,1854,1968,all_color,is_furigana=true)
SUBTITLE_FX("自意識 溢れ出して",subtitle_x,subtitle_y,1854,1968,all_color)

SUBTITLE_FX(" こ どう   せ かいぞう",subtitle_x,subtitle_y-subtitle_size*2,2230,2395,syouko_color,is_furigana=true)
SUBTITLE_FX("鼓動 世界像",subtitle_x,subtitle_y-subtitle_size*2,2230,2395,syouko_color)
SUBTITLE_FX("             か      あ                   いた",subtitle_x,subtitle_y,2409,2695,nodoka_color,is_furigana=true)
SUBTITLE_FX("いつも噛み合わないの 痛くて",subtitle_x,subtitle_y,2409,2695,nodoka_color)
SUBTITLE_FX("まい よ",subtitle_x,subtitle_y-subtitle_size*2,2707,2876,kaede_color,is_furigana=true)
SUBTITLE_FX("毎夜ねがいごと",subtitle_x,subtitle_y-subtitle_size*2,2707,2876,kaede_color)
SUBTITLE_FX("               うたが",subtitle_x,subtitle_y,2887,3053,rio_color,is_furigana=true)
SUBTITLE_FX("なんにも疑わないで",subtitle_x,subtitle_y,2887,3053,rio_color)
SUBTITLE_FX("                                       ま          と      あ",subtitle_x,subtitle_y,3082,3206,mai_color,is_furigana=true)
SUBTITLE_FX("                   混ざり融け合いたい",subtitle_x,subtitle_y,3082,3206,mai_color)

### pass clip: seishun_buta_yarou_season_01_ed_mute,seishun_buta_yarou_season_01_ed_00

### prefetch: 5,2

### ###
 
SUBTITLE_FX("                      わか               り ゆう  そんざい",subtitle_x,subtitle_y-subtitle_size*2,3233,3350,all_color,is_furigana=true)
SUBTITLE_FX("たわいない 判らない 理由 存在",subtitle_x,subtitle_y-subtitle_size*2,3233,3350,all_color)
SUBTITLE_FX("                のこ    こうかい",subtitle_x,subtitle_y,3352,3466,all_color,is_furigana=true)
SUBTITLE_FX("あなたと残す後悔",subtitle_x,subtitle_y,3352,3466,all_color)
SUBTITLE_FX("だれ     よ",subtitle_x,subtitle_y-subtitle_size*2,3473,3595,all_color,is_furigana=true)
SUBTITLE_FX("誰も読めないカルテ",subtitle_x,subtitle_y-subtitle_size*2,3473,3595,all_color)
SUBTITLE_FX(" ふ  ゆ かい   く     かえ",subtitle_x,subtitle_y,3592,3704,all_color,is_furigana=true)
SUBTITLE_FX("不愉快 繰り返して",subtitle_x,subtitle_y,3592,3704,all_color)

SUBTITLE_FX("ただ        ゆめ",subtitle_x,subtitle_y-subtitle_size*2,3968,4075,syouko_color,is_furigana=true)
SUBTITLE_FX("正しい夢は",subtitle_x,subtitle_y-subtitle_size*2,3968,4075,syouko_color)
SUBTITLE_FX("                                      こえ",subtitle_x,subtitle_y-subtitle_size*2,4088,4197,kaede_color,is_furigana=true)
SUBTITLE_FX("           かなしい声は",subtitle_x,subtitle_y-subtitle_size*2,4088,4197,kaede_color)
SUBTITLE_FX("うつく",subtitle_x-subtitle_size*0.5*0.5,subtitle_y,4207,4259,nodoka_color,is_furigana=true)
SUBTITLE_FX("美しい？",subtitle_x,subtitle_y,4207,4259,nodoka_color)
SUBTITLE_FX("                 うたが",subtitle_x,subtitle_y,4267,4321,rio_color,is_furigana=true)
SUBTITLE_FX("         疑わしい？",subtitle_x,subtitle_y,4267,4321,rio_color)
SUBTITLE_FX("                                       うらや",subtitle_x,subtitle_y,4327,4379,tomoe_color,is_furigana=true)
SUBTITLE_FX("                    羨ましい？",subtitle_x,subtitle_y,4327,4379,tomoe_color)
SUBTITLE_FX("ねえ、",subtitle_x,subtitle_y-subtitle_size*2,4379,4434,mai_color)
SUBTITLE_FX("      どれ？",subtitle_x,subtitle_y-subtitle_size*2,4440,4468,all_color)

SUBTITLE_FX("かた              ねむ",subtitle_x,subtitle_y,4492,4608,all_color,is_furigana=true)
SUBTITLE_FX("語れない 眠れない トロイメライ",subtitle_x,subtitle_y,4492,4608,all_color)
SUBTITLE_FX("                 み        しょうたい",subtitle_x,subtitle_y-subtitle_size*2,4611,4725,all_color,is_furigana=true)
SUBTITLE_FX("あなたの見てる正体",subtitle_x,subtitle_y-subtitle_size*2,4611,4725,all_color)
SUBTITLE_FX("だれ     よ",subtitle_x,subtitle_y,4732,4852,all_color,is_furigana=true)
SUBTITLE_FX("誰も読めないカルテ",subtitle_x,subtitle_y,4732,4852,all_color)
SUBTITLE_FX(" ふ  か  し  ぎ    し",subtitle_x,subtitle_y-subtitle_size*2,4851,4966,all_color,is_furigana=true)
SUBTITLE_FX("不可思議 知りたいだけ",subtitle_x,subtitle_y-subtitle_size*2,4851,4966,all_color)

SUBTITLE_FX(" お",subtitle_x,subtitle_y,4971,5088,all_color,is_furigana=true)
SUBTITLE_FX("終わらないことはないトロイメライ",subtitle_x,subtitle_y,4971,5088,all_color)
SUBTITLE_FX("                また   きょうかい",subtitle_x,subtitle_y-subtitle_size*2,5091,5206,all_color,is_furigana=true)
SUBTITLE_FX("あなたと跨ぐ境界",subtitle_x,subtitle_y-subtitle_size*2,5091,5206,all_color)
SUBTITLE_FX("だれ     よ",subtitle_x,subtitle_y,5212,5331,all_color,is_furigana=true)
SUBTITLE_FX("誰も読めないカルテ",subtitle_x,subtitle_y,5212,5331,all_color)
SUBTITLE_FX(" ししゅんき   きずぐち  むね",subtitle_x,subtitle_y-subtitle_size*2,5330,5450,all_color,is_furigana=true)
SUBTITLE_FX("思春期 疵口 胸のうち",subtitle_x,subtitle_y-subtitle_size*2,5330,5450,all_color)
SUBTITLE_FX(" ふ  か  し  ぎ    し",subtitle_x,subtitle_y,5450,5570,all_color,is_furigana=true)
SUBTITLE_FX("不可思議 知りたいだけ",subtitle_x,subtitle_y,5450,5570,all_color)

######## Thumbnail ########

is_thumbnail=false

is_thumbnail?ConvertToRGB32(seishun_buta_yarou_season_01_ed_mute,matrix="Rec709"):last

######## Music ########

bgm_48khz=SSRC(WAVSource("src\seishun_buta_yarou-season_01-ed-01.wav"),48000)
Normalize(AudioDub(bgm_48khz))



thumbnail=Trim(5380,-24*5)



seishun_buta_yarou_season_01_ed_00_extend=BlankClip(seishun_buta_yarou_season_01_ed_00,length=6,color=color_black)+seishun_buta_yarou_season_01_ed_00
AUDIO_DUB_TONE(ConvertToRGB32(seishun_buta_yarou_season_01_ed_00_extend,matrix="Rec709"),samplerate=48000,channels=2,type="Silence")++last

pre_frame_count=Framecount(seishun_buta_yarou_season_01_ed_00_extend)
SUBTITLE_FX("かた              ねむ",subtitle_x,subtitle_y-subtitle_size*2,-2+pre_frame_count,113+pre_frame_count,mai_color,is_furigana=true)
SUBTITLE_FX("語れない 眠れない トロイメライ",subtitle_x,subtitle_y-subtitle_size*2,-2+pre_frame_count,113+pre_frame_count,mai_color)



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
