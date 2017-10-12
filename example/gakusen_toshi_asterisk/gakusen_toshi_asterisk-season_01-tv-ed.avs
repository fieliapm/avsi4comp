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

Import("gakusen_toshi_asterisk-season_01-tv-common.avsi")

LoadPlugin("..\plugins\medianblur.dll")

######## Function ########

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



global ratio_to_original_resolution=(720.0/1080.0)

function PLANAR_SHADING(clip clip){
	radius=10
	scaled_radius=Round(radius*ratio_to_original_resolution)
	return MedianBlur(clip,radiusy=scaled_radius,radiusu=scaled_radius,radiusv=scaled_radius)
}



global piece_fade_length=23

function GENERATE_PIECE_FADE_MASK(clip clip){
	piece=Dissolve(BlankClip(clip,length=piece_fade_length+1,width=120,height=108,pixel_type="RGB24",color=color_black),BlankClip(clip,length=piece_fade_length+1,width=120,height=108,pixel_type="RGB24",color=color_white),2)
	piece_even_line_part=StackHorizontal(Trim(piece,1,-piece_fade_length),Trim(piece,16,-piece_fade_length),Trim(piece,4,-piece_fade_length),Trim(piece,13,-piece_fade_length))
	piece_odd_line_part=StackHorizontal(Trim(piece,19,-piece_fade_length),Trim(piece,10,-piece_fade_length),Trim(piece,22,-piece_fade_length),Trim(piece,7,-piece_fade_length))
	piece_even_line=StackHorizontal(piece_even_line_part,piece_even_line_part,piece_even_line_part,piece_even_line_part)
	piece_odd_line=StackHorizontal(piece_odd_line_part,piece_odd_line_part,piece_odd_line_part,piece_odd_line_part)
	piece_dual_line=StackVertical(Crop(piece_even_line,0,0,1920,108),Crop(piece_odd_line,0,0,1920,108))
	piece_fade=Crop(StackVertical(piece_dual_line,piece_dual_line,piece_dual_line,piece_dual_line,piece_dual_line),0,0,1920,1080)

	return piece_fade
}

function _PIECE_FADE_TRANSITION(clip left,clip right){
	length=Framecount(right)

	Assert(length==piece_fade_length,"PIECE_FADE_TRANSITION(): length is not equal to "+String(piece_fade_length))

	mask=GENERATE_PIECE_FADE_MASK(right)
	mask=RESIZE_TO_REF_CLIP(mask,right)

	return Overlay(left,right,mask=mask,mode="Blend")
}

function PIECE_FADE_TRANSITION(clip left,clip right,int length){
	return TRANSITION(left,right,length,"_PIECE_FADE_TRANSITION(left,right)")
}



global piece_open_door_length=17

function GENERATE_PIECE_OPEN_DOOR_MASK(clip clip){
	piece=Dissolve(BlankClip(clip,length=piece_open_door_length+1,width=128,height=108,pixel_type="RGB24",color=color_black),BlankClip(clip,length=piece_open_door_length+1,width=128,height=108,pixel_type="RGB24",color=color_white),2)
	piece_even_line=StackHorizontal(Trim(piece,1,-piece_open_door_length),Trim(piece,3,-piece_open_door_length),Trim(piece,5,-piece_open_door_length),Trim(piece,7,-piece_open_door_length), \
		Trim(piece,9,-piece_open_door_length),Trim(piece,11,-piece_open_door_length),Trim(piece,13,-piece_open_door_length),Trim(piece,15,-piece_open_door_length))
	piece_odd_line=StackHorizontal(Trim(piece,2,-piece_open_door_length),Trim(piece,4,-piece_open_door_length),Trim(piece,6,-piece_open_door_length),Trim(piece,8,-piece_open_door_length), \
		Trim(piece,10,-piece_open_door_length),Trim(piece,12,-piece_open_door_length),Trim(piece,14,-piece_open_door_length),Trim(piece,16,-piece_open_door_length))
	piece_dual_line=StackVertical(Crop(piece_even_line,64,0,960,108),Crop(piece_odd_line,0,0,960,108))
	piece_left_side=Crop(StackVertical(piece_dual_line,piece_dual_line,piece_dual_line,piece_dual_line,piece_dual_line,piece_dual_line),0,54,960,1080)
	piece_open_door=StackHorizontal(piece_left_side,FlipHorizontal(piece_left_side))

	return piece_open_door
}

function _PIECE_OPEN_DOOR_TRANSITION(clip left,clip right){
	length=Framecount(right)

	Assert(length==piece_open_door_length,"PIECE_OPEN_DOOR_TRANSITION(): length is not equal to "+String(piece_open_door_length))

	mask=GENERATE_PIECE_OPEN_DOOR_MASK(right)
	mask=RESIZE_TO_REF_CLIP(mask,right)

	return Overlay(left,right,mask=mask,mode="Blend")
}

function PIECE_OPEN_DOOR_TRANSITION(clip left,clip right,int length){
	return TRANSITION(left,right,length,"_PIECE_OPEN_DOOR_TRANSITION(left,right)")
}

######## Pre Combine ########

fade_length=24



#gakusen_toshi_asterisk_season_01_tv_clean_ed_rev03_01_extend=Loop(gakusen_toshi_asterisk_season_01_tv_clean_ed_rev03_01,5,166,305)

gakusen_toshi_asterisk_season_01_tv_clean_ed_rev01_01_extend=Loop(Trim(gakusen_toshi_asterisk_season_01_tv_clean_ed_rev01_01,0,972),(1131-15)-972+fade_length,972,972)

gakusen_toshi_asterisk_season_01_tv_clean_ed_rev03_04_last_frame=Framecount(gakusen_toshi_asterisk_season_01_tv_clean_ed_rev03_04)-1
gakusen_toshi_asterisk_season_01_tv_clean_ed_rev03_04_extend=Loop(gakusen_toshi_asterisk_season_01_tv_clean_ed_rev03_04,1+fade_length,gakusen_toshi_asterisk_season_01_tv_clean_ed_rev03_04_last_frame,gakusen_toshi_asterisk_season_01_tv_clean_ed_rev03_04_last_frame)

######## Combine ########

# gakusen_toshi_asterisk_season_01_tv_clean_ed_rev01_01 15/573/1131
# gakusen_toshi_asterisk_season_01_tv_clean_ed_rev03_01 15/573/1131
# gakusen_toshi_asterisk_season_01_tv_clean_ed_rev03_02 4668/5226
# gakusen_toshi_asterisk_season_01_tv_clean_ed_rev03_03 4700/5258
# gakusen_toshi_asterisk_season_01_tv_clean_ed_rev03_04 5087/5645



gakusen_toshi_asterisk_season_01_tv_ed_t01=BlankClip(gakusen_toshi_asterisk_season_01_tv_clean_ed_rev03,length=15,color=color_black)
gakusen_toshi_asterisk_season_01_tv_ed_t02=Dissolve(gakusen_toshi_asterisk_season_01_tv_clean_ed_rev01_01_extend,gakusen_toshi_asterisk_season_01_tv_clean_ed_rev03_01,fade_length)
gakusen_toshi_asterisk_season_01_tv_ed_t03=PLANAR_SHADING(TRIM_MIDDLE_CLIP(gakusen_toshi_asterisk_season_01_tv_07_ayato_buff,32))+PIECE_OPEN_DOOR_TRANSITION(PIECE_OPEN_DOOR_TRANSITION(PIECE_FADE_TRANSITION(PLANAR_SHADING(TRIM_FIRST_CLIP(gakusen_toshi_asterisk_season_01_tv_03_juris_pull_up_skirt,106+20)), \
	PLANAR_SHADING(SCALE_CG(TRIM_LAST_CLIP(gakusen_toshi_asterisk_season_01_tv_02_saya_carry_cannon,23+109+17),0.5*Width(gakusen_toshi_asterisk_season_01_tv_02_saya_carry_cannon),0.5*Height(gakusen_toshi_asterisk_season_01_tv_02_saya_carry_cannon),1.0,1.1)),23), \
	PLANAR_SHADING(TRIM_MIDDLE_CLIP(gakusen_toshi_asterisk_season_01_tv_04_ayato_and_juris_fly_under_sunset,17+14+17)),17), \
	PLANAR_SHADING(TRIM_MIDDLE_CLIP(gakusen_toshi_asterisk_season_01_tv_06_kirin_and_kouichirou_non_fade_in_out,17+16)),17)+PLANAR_SHADING(TRIM_MIDDLE_CLIP(gakusen_toshi_asterisk_season_01_tv_03_little_juris_and_friends,18)) \
	+PLANAR_SHADING(TRIM_MIDDLE_CLIP(gakusen_toshi_asterisk_season_01_tv_05_ayato_stop_kouichirou_to_punish_kirin_02,18))+PLANAR_SHADING(TRIM_MIDDLE_CLIP(gakusen_toshi_asterisk_season_01_tv_11_claudia_get_crazy,18)) \
	+PLANAR_SHADING(TRIM_FIRST_CLIP(gakusen_toshi_asterisk_season_01_tv_10_saya_see_enemy_on_stage,18))+PLANAR_SHADING(TRIM_FIRST_CLIP(gakusen_toshi_asterisk_season_01_tv_09_ayato_limit_break,16)) \

gakusen_toshi_asterisk_season_01_tv_ed_t04=Dissolve(TRIM_FIRST_CLIP(gakusen_toshi_asterisk_season_01_tv_12_juris_touch_ayato_s_face,229),FADE_OUT_WITH_BRIGHTNESS_OFFSET(TRIM_LAST_CLIP(gakusen_toshi_asterisk_season_01_tv_09_saya_is_proud_and_juris_get_headache,fade_length+416),fade_length),fade_length)

gakusen_toshi_asterisk_season_01_tv_ed_t05=FADE_IN_WITH_BRIGHTNESS_OFFSET(PLANAR_SHADING(TRIM_FIRST_CLIP(gakusen_toshi_asterisk_season_01_tv_07_kirin_show_sword_skill,309)),fade_length)+PLANAR_SHADING(TRIM_LAST_CLIP(gakusen_toshi_asterisk_season_01_tv_08_saya_teach_kirin_swimming,102))+PLANAR_SHADING(TRIM_LAST_CLIP(gakusen_toshi_asterisk_season_01_tv_08_kirin_see_saya_buy_gun,147))
gakusen_toshi_asterisk_season_01_tv_ed_t06=FADE_OUT_WITH_BRIGHTNESS_OFFSET(TRIM_FIRST_CLIP(gakusen_toshi_asterisk_season_01_tv_01_claudia_explain+gakusen_toshi_asterisk_season_01_tv_01_ayato_hear_explain,fade_length+540),fade_length)
gakusen_toshi_asterisk_season_01_tv_ed_t07=FadeIn0(PLANAR_SHADING(TRIM_MIDDLE_CLIP(gakusen_toshi_asterisk_season_01_tv_08_kirin_and_saya_see_pool_under_sunset,139)),fade_length,color_coral) \
	+PLANAR_SHADING(TRIM_MIDDLE_CLIP(gakusen_toshi_asterisk_season_01_tv_12_camilla_see_ernesta_excited,32))+PIECE_OPEN_DOOR_TRANSITION(PIECE_OPEN_DOOR_TRANSITION(PIECE_FADE_TRANSITION(PLANAR_SHADING(TRIM_FIRST_CLIP(gakusen_toshi_asterisk_season_01_tv_12_sylvia_watch_festa,106+20)), \
	PLANAR_SHADING(TRIM_MIDDLE_CLIP(gakusen_toshi_asterisk_season_01_tv_01_juris_in_fire_01_part03,23+109+17)),23), \
	PLANAR_SHADING(TRIM_MIDDLE_CLIP(Reverse(gakusen_toshi_asterisk_season_01_tv_10_irene_suck_priscilla_s_blood),17+14+17)),17), \
	PLANAR_SHADING(TRIM_FIRST_CLIP(gakusen_toshi_asterisk_season_01_tv_02_chain_surround_ayato,17+16)),17)+PLANAR_SHADING(MOVE_CG(TRIM_MIDDLE_CLIP(gakusen_toshi_asterisk_season_01_tv_08_eishirou_and_claudia_see_festa_schedule,18),-1,0,0.1*Width(gakusen_toshi_asterisk_season_01_tv_08_eishirou_and_claudia_see_festa_schedule),1.1)) \
	+PLANAR_SHADING(TRIM_LAST_CLIP(gakusen_toshi_asterisk_season_01_tv_10_irene_take_scythe,18))+PLANAR_SHADING(TRIM_MIDDLE_CLIP(gakusen_toshi_asterisk_season_01_tv_06_ayato_and_kirin_training_run,18)) \
	+PLANAR_SHADING(TRIM_MIDDLE_CLIP(gakusen_toshi_asterisk_season_01_tv_11_priscilla_see_moon,18))+TRIM_FIRST_CLIP(gakusen_toshi_asterisk_season_01_tv_05_ernesta_smile,16)

gakusen_toshi_asterisk_season_01_tv_ed_t08=PLANAR_SHADING(TRIM_MIDDLE_CLIP(gakusen_toshi_asterisk_season_01_tv_04_juris_raise_sword,139))+gakusen_toshi_asterisk_season_01_tv_clean_ed_rev03_02+gakusen_toshi_asterisk_season_01_tv_clean_ed_rev03_03
gakusen_toshi_asterisk_season_01_tv_ed_t09=Dissolve(gakusen_toshi_asterisk_season_01_tv_clean_ed_rev03_04_extend,BlankClip(gakusen_toshi_asterisk_season_01_tv_clean_ed_rev03,length=24*8,color=color_white),fade_length)



gakusen_toshi_asterisk_season_01_tv_ed_mute=gakusen_toshi_asterisk_season_01_tv_ed_t01+gakusen_toshi_asterisk_season_01_tv_ed_t02+gakusen_toshi_asterisk_season_01_tv_ed_t03 \
	+gakusen_toshi_asterisk_season_01_tv_ed_t04 \
	+Dissolve(gakusen_toshi_asterisk_season_01_tv_ed_t05,gakusen_toshi_asterisk_season_01_tv_ed_t06,fade_length)+gakusen_toshi_asterisk_season_01_tv_ed_t07 \
	+gakusen_toshi_asterisk_season_01_tv_ed_t08+gakusen_toshi_asterisk_season_01_tv_ed_t09

gakusen_toshi_asterisk_season_01_tv_ed_mute

### export clip: gakusen_toshi_asterisk_season_01_tv_ed_mute

### prefetch: 5,2

### ###

######## Subtitle ########

### inherit start ###

global subtitle_clip_width=1920
global subtitle_clip_height=1080

subtitle_x=50*2.25
subtitle_y=395*2.25
global subtitle_front_fade_count=24
global subtitle_rear_fade_count=24
global subtitle_font="MS Gothic"
global subtitle_effects="b"
global subtitle_size=32*2.25
global subtitle_text_color=color_white
global subtitle_halo_color=color_deepskyblue #color_deepskyblue/color_royalblue

function SUBTITLE_FX(clip clip,string text,float x,float y,int start_frame,int end_frame,bool "is_title"){
	is_title=Default(is_title,false)

	text_color=is_title?OVERWRITE_SUBTITLE_COLOR_ALPHA(subtitle_text_color,$C0):subtitle_text_color

	return SUBTITLE_FX_FADE_IN_FADE_OUT(clip,text,Round(x),Round(y),start_frame,end_frame,subtitle_front_fade_count,subtitle_rear_fade_count,subtitle_font,subtitle_effects,Round(subtitle_size),text_color,subtitle_halo_color,"ex_thick_reduce_memory")
}

### inherit end ###

ConvertToRGB32()

SUBTITLE_FX("Waiting for the rain//ç‚ñ{ê^àª|- by fielia@AVISynth",-subtitle_x,subtitle_y-subtitle_size,155,436,true)

SUBTITLE_FX("I'm waiting for the rain",subtitle_x,subtitle_y,594,672)
SUBTITLE_FX("I'm bracing for the thunder",subtitle_x,subtitle_y,734,814)
SUBTITLE_FX("A twig that wouldn't sway",subtitle_x,subtitle_y-subtitle_size,872,943)
SUBTITLE_FX("In the wind",subtitle_x,subtitle_y,973,1023)

SUBTITLE_FX("Awaken from a dream",subtitle_x,subtitle_y,1151,1229)
SUBTITLE_FX("Arising from a slumber",subtitle_x,subtitle_y,1290,1377)
SUBTITLE_FX("I'm far away from home",subtitle_x,subtitle_y-subtitle_size,1431,1501)
SUBTITLE_FX("On my own",subtitle_x,subtitle_y,1532,1581)

SUBTITLE_FX("Hear my yearning",subtitle_x,subtitle_y-subtitle_size,1680,1809)
SUBTITLE_FX("See the crimson flame",subtitle_x,subtitle_y,1820,1919)
SUBTITLE_FX("Like a ruby",subtitle_x,subtitle_y-subtitle_size,1942,2004)
SUBTITLE_FX("It's the hope",subtitle_x,subtitle_y,2012,2077)
SUBTITLE_FX("In my eye",subtitle_x,subtitle_y-subtitle_size,2081,2213)

SUBTITLE_FX("If you go away",subtitle_x,subtitle_y,2216,2258)
SUBTITLE_FX("And I don't see you anymore",subtitle_x,subtitle_y-subtitle_size,2287,2355)
SUBTITLE_FX("I still wouldn't sway",subtitle_x,subtitle_y,2355,2393)
SUBTITLE_FX("But I'd be",subtitle_x,subtitle_y-subtitle_size,2395,2451)
SUBTITLE_FX("Missing you",subtitle_x,subtitle_y,2446,2496)
SUBTITLE_FX("Now don't be afraid",subtitle_x,subtitle_y-subtitle_size,2495,2537)
SUBTITLE_FX("You the flower couldn't sting",subtitle_x,subtitle_y,2569,2629)
SUBTITLE_FX("You can hide in my shade",subtitle_x,subtitle_y-subtitle_size,2630,2673)
SUBTITLE_FX("Or maybe I...",subtitle_x,subtitle_y,2674,2776)
SUBTITLE_FX("Could I be safe",subtitle_x,subtitle_y-subtitle_size,2778,2817)
SUBTITLE_FX("In yours?",subtitle_x,subtitle_y,2847,3028)

SUBTITLE_FX("A moment left to bloom",subtitle_x,subtitle_y,3454,3530)
SUBTITLE_FX("I wither by the morning",subtitle_x,subtitle_y,3593,3674)
SUBTITLE_FX("Can we be staying here",subtitle_x,subtitle_y-subtitle_size,3732,3797)
SUBTITLE_FX("For a while",subtitle_x,subtitle_y,3833,3874)

SUBTITLE_FX("Hear my yearning",subtitle_x,subtitle_y-subtitle_size,3981,4109)
SUBTITLE_FX("See my raging light",subtitle_x,subtitle_y,4120,4225)
SUBTITLE_FX("It's my token that we won't",subtitle_x,subtitle_y-subtitle_size,4243,4378)
SUBTITLE_FX("Say goodbye",subtitle_x,subtitle_y,4382,4514)

SUBTITLE_FX("If you go away",subtitle_x,subtitle_y-subtitle_size,4518,4564)
SUBTITLE_FX("And I don't see you anymore",subtitle_x,subtitle_y,4590,4657)
SUBTITLE_FX("I still wouldn't sway",subtitle_x,subtitle_y-subtitle_size,4657,4695)
SUBTITLE_FX("But I'd be",subtitle_x,subtitle_y,4697,4753)
SUBTITLE_FX("Missing you",subtitle_x,subtitle_y-subtitle_size,4747,4793)
SUBTITLE_FX("Now don't be afraid",subtitle_x,subtitle_y,4797,4840)
SUBTITLE_FX("You the flower couldn't sting",subtitle_x,subtitle_y-subtitle_size,4870,4931)
SUBTITLE_FX("You can hide in my shade",subtitle_x,subtitle_y,4931,4975)
SUBTITLE_FX("Or maybe I...",subtitle_x,subtitle_y-subtitle_size,4976,5077)

SUBTITLE_FX("Would go away",subtitle_x,subtitle_y,5079,5116)
SUBTITLE_FX("And I don't see you anymore",subtitle_x,subtitle_y-subtitle_size,5147,5215)
SUBTITLE_FX("I still wouldn't sway",subtitle_x,subtitle_y,5215,5256)
SUBTITLE_FX("But I'd be",subtitle_x,subtitle_y-subtitle_size,5255,5312)
SUBTITLE_FX("Missing you",subtitle_x,subtitle_y,5306,5350)
SUBTITLE_FX("Now don't be afraid",subtitle_x,subtitle_y-subtitle_size,5354,5398)
SUBTITLE_FX("We are lasting yet awhile",subtitle_x,subtitle_y,5429,5494)
SUBTITLE_FX("I will give you a day",subtitle_x,subtitle_y-subtitle_size,5490,5535)
SUBTITLE_FX("Or maybe I...",subtitle_x,subtitle_y,5534,5634)
SUBTITLE_FX("Could I have one",subtitle_x,subtitle_y-subtitle_size,5638,5680)
SUBTITLE_FX("Of yours?",subtitle_x,subtitle_y,5707,5848)

SUBTITLE_FX("I'm waiting for the rain...",subtitle_x,subtitle_y,5896,6012)

######## Thumbnail ########

is_thumbnail=false

is_thumbnail?ConvertToRGB32(gakusen_toshi_asterisk_season_01_tv_ed_mute):last

######## Music ########

#bgm_48khz=SSRC(WAVSource("src\sakamoto_maaya-2015_09_30-follow_me_up-10.wav"),48000)
bgm_96khz=WAVSource("src\sakamoto_maaya-2015_09_30-follow_me_up-10.wav")
AudioDub(bgm_96khz)



thumbnail=Trim(5557,-24*5)



is_thumbnail?thumbnail:last

""")

######## Post Processing ########

ConvertToYV12()
#ConvertToYUY2()
#ConvertToRGB24()

TCPServer()
