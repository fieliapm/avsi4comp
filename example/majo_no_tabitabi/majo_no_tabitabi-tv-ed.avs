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

Import("majo_no_tabitabi-tv-common.avsi")

######## Function ########

### inherit start ###

Import("majo_no_tabitabi-tv-function.avsi")

### inherit end ###

function _SMOOTH_MASK(clip clip,int iter_count){
	clip=Expand(clip)
	clip=iter_count<=0?clip:_SMOOTH_MASK(clip,iter_count-1)
	return Inpand(clip)
}

function _SMOOTH_MASK2(clip clip,int iter_count){
	clip=Deflate(clip)
	clip=iter_count<=0?clip:_SMOOTH_MASK(clip,iter_count-1)
	return Inflate(clip)
}

function SMOOTH_MASK(clip clip,int iter_count){
	clip=CONVERT_BACK_TO_YV12(clip,matrix="Rec709")
	clip=_SMOOTH_MASK2(clip,iter_count)
	return ConvertToRGB32(Greyscale(clip),matrix="Rec709")
}

function CHROMA_MASK(clip clip,int color,int "tolerance"){
	clip_rgb32=ConvertToRGB32(clip,matrix="Rec709")
	mask_clip_rgb32=ShowAlpha(ColorKeyMask(ResetMask(ConvertToRGB32(SHOW_CHROMA(clip),matrix="Rec709")),color,tolerance))
	mask_clip_rgb32=SMOOTH_MASK(mask_clip_rgb32,1)
	return Mask(clip_rgb32,mask_clip_rgb32)
}

function CHROMA_MASK_2(clip clip,int color1,int color2,int "tolerance"){
	clip_rgb32=ConvertToRGB32(clip,matrix="Rec709")
	mask_clip_rgb32=ShowAlpha(ColorKeyMask(ColorKeyMask(ResetMask(ConvertToRGB32(SHOW_CHROMA(clip),matrix="Rec709")),color1,tolerance),color2,tolerance))
	mask_clip_rgb32=SMOOTH_MASK(mask_clip_rgb32,1)
	return Mask(clip_rgb32,mask_clip_rgb32)
}

function MERGE_WITHOUT_ALPHA(clip clip1,clip clip2){
	clip1_alpha=ShowAlpha(clip1)
	result=Merge(clip1,ConvertToRGB32(Greyscale(clip2),matrix="Rec709"))
	return Mask(result,clip1_alpha)
}

######## Pre Combine ########

### inherit start ###

fade_length=12

### inherit end ###

#background_color=$F7F7CE
#background=ConvertToRGB32(BlankClip(majo_no_tabitabi_tv_clean_ed,length=1000,color=background_color),matrix="Rec709")
background=ConvertToRGB32(FAST_ZOOM(majo_no_tabitabi_tv_clean_ed_01,srcx=Width(majo_no_tabitabi_tv_clean_ed),srcy=0,dstx=Width(majo_no_tabitabi_tv_clean_ed),dsty=0,factor=3.2),matrix="Rec709")

majo_no_tabitabi_tv_06_boat=majo_no_tabitabi_tv_06_boat_01+majo_no_tabitabi_tv_06_boat_02



# used
majo_no_tabitabi_tv_01_elaina_tears_loop_base=Trim(majo_no_tabitabi_tv_01_elaina_tears,0,57)
majo_no_tabitabi_tv_01_elaina_tears_loop=EXTEND_ANIMATION_CG(majo_no_tabitabi_tv_01_elaina_tears_loop_base,282)
majo_no_tabitabi_tv_01_elaina_tears_matte=CHROMA_MASK(majo_no_tabitabi_tv_01_elaina_tears_loop,$608A9A,26)

majo_no_tabitabi_tv_04_palace_extend=EXTEND_ANIMATION_CG(majo_no_tabitabi_tv_04_palace,282)
majo_no_tabitabi_tv_04_palace_scaled=SCALE_CG(majo_no_tabitabi_tv_04_palace_extend,Width(majo_no_tabitabi_tv_clean_ed)/2,Height(majo_no_tabitabi_tv_clean_ed)/2,1.0,1.2)

majo_no_tabitabi_tv_01_elaina_tears_matte=MERGE_WITHOUT_ALPHA(majo_no_tabitabi_tv_01_elaina_tears_matte,majo_no_tabitabi_tv_04_palace_scaled)
majo_no_tabitabi_tv_01_elaina_tears_matte=Layer(EXTEND_ANIMATION_CG(background,282),majo_no_tabitabi_tv_01_elaina_tears_matte)
majo_no_tabitabi_tv_01_elaina_tears_matte=CONVERT_BACK_TO_YV12(majo_no_tabitabi_tv_01_elaina_tears_matte,matrix="Rec709")



# used
majo_no_tabitabi_tv_02_elaina_see_inside_of_country_for_mages_loop_base=CLIP_SPEED(Trim(majo_no_tabitabi_tv_02_elaina_see_inside_of_country_for_mages,35,104),0.5,true)
majo_no_tabitabi_tv_02_elaina_see_inside_of_country_for_mages_loop=EXTEND_ANIMATION_CG(majo_no_tabitabi_tv_02_elaina_see_inside_of_country_for_mages_loop_base,133)
majo_no_tabitabi_tv_02_elaina_see_inside_of_country_for_mages_matte=CHROMA_MASK(majo_no_tabitabi_tv_02_elaina_see_inside_of_country_for_mages_loop,$887E9A,30)
majo_no_tabitabi_tv_02_elaina_see_inside_of_country_for_mages_matte=Invert(majo_no_tabitabi_tv_02_elaina_see_inside_of_country_for_mages_matte,"A")

majo_no_tabitabi_tv_10_birds_on_sky_extend=EXTEND_ANIMATION_CG(majo_no_tabitabi_tv_10_birds_on_sky,133)
majo_no_tabitabi_tv_10_birds_on_sky_scaled=SCALE_CG(majo_no_tabitabi_tv_10_birds_on_sky_extend,Width(majo_no_tabitabi_tv_clean_ed)/2,Height(majo_no_tabitabi_tv_clean_ed)/2,1.0,1.2)

majo_no_tabitabi_tv_02_elaina_see_inside_of_country_for_mages_matte=MERGE_WITHOUT_ALPHA(majo_no_tabitabi_tv_02_elaina_see_inside_of_country_for_mages_matte,majo_no_tabitabi_tv_10_birds_on_sky_scaled)
majo_no_tabitabi_tv_02_elaina_see_inside_of_country_for_mages_matte=Layer(EXTEND_ANIMATION_CG(background,133),majo_no_tabitabi_tv_02_elaina_see_inside_of_country_for_mages_matte)
majo_no_tabitabi_tv_02_elaina_see_inside_of_country_for_mages_matte=CONVERT_BACK_TO_YV12(majo_no_tabitabi_tv_02_elaina_see_inside_of_country_for_mages_matte,matrix="Rec709")



# used
majo_no_tabitabi_tv_02_elaina_see_saya_loop_base=Trim(majo_no_tabitabi_tv_02_elaina_see_saya,0,53)
majo_no_tabitabi_tv_02_elaina_see_saya_loop=EXTEND_ANIMATION_CG(majo_no_tabitabi_tv_02_elaina_see_saya_loop_base,250)
majo_no_tabitabi_tv_02_elaina_see_saya_loop_matte=CHROMA_MASK(majo_no_tabitabi_tv_02_elaina_see_saya_loop,$6288A6,19)

majo_no_tabitabi_tv_10_town_of_freedom_qunorts_02_extend=EXTEND_ANIMATION_CG(majo_no_tabitabi_tv_10_town_of_freedom_qunorts_02,250)
majo_no_tabitabi_tv_10_town_of_freedom_qunorts_02_scaled=MOVE_CG(majo_no_tabitabi_tv_10_town_of_freedom_qunorts_02_extend,-1,0,Width(majo_no_tabitabi_tv_clean_ed)/10.0,1.1)

majo_no_tabitabi_tv_02_elaina_see_saya_loop_matte=MERGE_WITHOUT_ALPHA(majo_no_tabitabi_tv_02_elaina_see_saya_loop_matte,majo_no_tabitabi_tv_10_town_of_freedom_qunorts_02_scaled)
majo_no_tabitabi_tv_02_elaina_see_saya_loop_matte=Layer(EXTEND_ANIMATION_CG(background,250),majo_no_tabitabi_tv_02_elaina_see_saya_loop_matte)
majo_no_tabitabi_tv_02_elaina_see_saya_loop_matte=CONVERT_BACK_TO_YV12(majo_no_tabitabi_tv_02_elaina_see_saya_loop_matte,matrix="Rec709")



# used
majo_no_tabitabi_tv_03_elaina_fly_under_rain_loop_base=Trim(majo_no_tabitabi_tv_03_elaina_fly_under_rain,0,47)
majo_no_tabitabi_tv_03_elaina_fly_under_rain_loop=EXTEND_ANIMATION_CG(majo_no_tabitabi_tv_03_elaina_fly_under_rain_loop_base,361)
majo_no_tabitabi_tv_03_elaina_fly_under_rain_matte=CHROMA_MASK(majo_no_tabitabi_tv_03_elaina_fly_under_rain_loop,$76839E,12)

majo_no_tabitabi_tv_01_robetta_extend=EXTEND_ANIMATION_CG(majo_no_tabitabi_tv_01_robetta,361)
majo_no_tabitabi_tv_01_robetta_scaled=MOVE_CG(majo_no_tabitabi_tv_01_robetta_extend,1,0,Width(majo_no_tabitabi_tv_clean_ed)/10.0,1.1)

majo_no_tabitabi_tv_03_elaina_fly_under_rain_matte=MERGE_WITHOUT_ALPHA(majo_no_tabitabi_tv_03_elaina_fly_under_rain_matte,majo_no_tabitabi_tv_01_robetta_scaled)
majo_no_tabitabi_tv_03_elaina_fly_under_rain_matte=Layer(EXTEND_ANIMATION_CG(background,361),majo_no_tabitabi_tv_03_elaina_fly_under_rain_matte)
majo_no_tabitabi_tv_03_elaina_fly_under_rain_matte=CONVERT_BACK_TO_YV12(majo_no_tabitabi_tv_03_elaina_fly_under_rain_matte,matrix="Rec709")



# confirm
#majo_no_tabitabi_tv_03_elaina_s_leg #length:91
majo_no_tabitabi_tv_03_elaina_s_leg_matte=ColorKeyMask(ConvertToRGB32(majo_no_tabitabi_tv_03_elaina_s_leg,matrix="Rec709"),$221B15,40)



# used
majo_no_tabitabi_tv_03_elaina_s_hair_loop_base=Trim(majo_no_tabitabi_tv_03_elaina_s_hair,0,143)
majo_no_tabitabi_tv_03_elaina_s_hair_loop=EXTEND_ANIMATION_CG(majo_no_tabitabi_tv_03_elaina_s_hair_loop_base,283)
majo_no_tabitabi_tv_03_elaina_s_hair_matte=CHROMA_MASK(majo_no_tabitabi_tv_03_elaina_s_hair_loop,$8A78D5,41)

majo_no_tabitabi_tv_10_town_of_freedom_qunorts_02_extend=EXTEND_ANIMATION_CG(majo_no_tabitabi_tv_10_town_of_freedom_qunorts_02,283)
majo_no_tabitabi_tv_10_town_of_freedom_qunorts_02_scaled=SCALE_CG(majo_no_tabitabi_tv_10_town_of_freedom_qunorts_02_extend,Width(majo_no_tabitabi_tv_clean_ed)/2,Height(majo_no_tabitabi_tv_clean_ed)/2,1.2,1.0)

majo_no_tabitabi_tv_03_elaina_s_hair_matte=MERGE_WITHOUT_ALPHA(majo_no_tabitabi_tv_03_elaina_s_hair_matte,majo_no_tabitabi_tv_10_town_of_freedom_qunorts_02_scaled)
majo_no_tabitabi_tv_03_elaina_s_hair_matte=Layer(EXTEND_ANIMATION_CG(background,283),majo_no_tabitabi_tv_03_elaina_s_hair_matte)
majo_no_tabitabi_tv_03_elaina_s_hair_matte=CONVERT_BACK_TO_YV12(majo_no_tabitabi_tv_03_elaina_s_hair_matte,matrix="Rec709")



# pending
#majo_no_tabitabi_tv_05_fran_and_elaina_talk_under_sunset #length:311
a=CHROMA_MASK(majo_no_tabitabi_tv_05_fran_and_elaina_talk_under_sunset,$848091,35) # not yet
#a=ColorKeyMask(ConvertToRGB32(majo_no_tabitabi_tv_05_fran_and_elaina_talk_under_sunset,matrix="Rec709"),$FB8758,120)
a=Invert(a,"A")
#a=ColorKeyMask(ConvertToRGB32(majo_no_tabitabi_tv_05_fran_and_elaina_talk_under_sunset,matrix="Rec709"),$85B7D3,40)

#majo_no_tabitabi_tv_01_robetta_extend=EXTEND_ANIMATION_CG(majo_no_tabitabi_tv_01_robetta,361)
#majo_no_tabitabi_tv_01_robetta_scaled=MOVE_CG(majo_no_tabitabi_tv_01_robetta_extend,1,0,Width(majo_no_tabitabi_tv_clean_ed)/10.0,1.1)

#a2=MERGE_WITHOUT_ALPHA(a2,majo_no_tabitabi_tv_01_robetta_scaled)



# used
majo_no_tabitabi_tv_05_elaina_fly_over_grass_loop_base=Trim(majo_no_tabitabi_tv_05_elaina_fly_over_grass,0,95)
majo_no_tabitabi_tv_05_elaina_fly_over_grass_loop=EXTEND_ANIMATION_CG(majo_no_tabitabi_tv_05_elaina_fly_over_grass_loop_base,179)
majo_no_tabitabi_tv_05_elaina_fly_over_grass_matte=CHROMA_MASK(majo_no_tabitabi_tv_05_elaina_fly_over_grass_loop,$39A317,60)

majo_no_tabitabi_tv_01_robetta_extend=EXTEND_ANIMATION_CG(majo_no_tabitabi_tv_01_robetta,179)
majo_no_tabitabi_tv_01_robetta_scaled=MOVE_CG(majo_no_tabitabi_tv_01_robetta_extend,1,0,Width(majo_no_tabitabi_tv_clean_ed)/10.0,1.1)

majo_no_tabitabi_tv_05_elaina_fly_over_grass_matte=MERGE_WITHOUT_ALPHA(majo_no_tabitabi_tv_05_elaina_fly_over_grass_matte,majo_no_tabitabi_tv_01_robetta_scaled)
majo_no_tabitabi_tv_05_elaina_fly_over_grass_matte=Layer(EXTEND_ANIMATION_CG(background,179),majo_no_tabitabi_tv_05_elaina_fly_over_grass_matte)
majo_no_tabitabi_tv_05_elaina_fly_over_grass_matte=CONVERT_BACK_TO_YV12(majo_no_tabitabi_tv_05_elaina_fly_over_grass_matte,matrix="Rec709")



# used
majo_no_tabitabi_tv_06_saya_behind_elaina_s_hair_loop_base=Trim(majo_no_tabitabi_tv_06_saya_behind_elaina_s_hair,0,68)
majo_no_tabitabi_tv_06_saya_behind_elaina_s_hair_loop=EXTEND_ANIMATION_CG(majo_no_tabitabi_tv_06_saya_behind_elaina_s_hair_loop_base,23)
majo_no_tabitabi_tv_06_saya_behind_elaina_s_hair_matte=CHROMA_MASK(majo_no_tabitabi_tv_06_saya_behind_elaina_s_hair_loop,$7F819E,19)

majo_no_tabitabi_tv_04_moon_extend=EXTEND_ANIMATION_CG(majo_no_tabitabi_tv_04_moon,23)
majo_no_tabitabi_tv_04_moon_scaled=MOVE_CG(majo_no_tabitabi_tv_04_moon_extend,1,0,Width(majo_no_tabitabi_tv_clean_ed)/10.0,1.1)

majo_no_tabitabi_tv_06_saya_behind_elaina_s_hair_matte=MERGE_WITHOUT_ALPHA(majo_no_tabitabi_tv_06_saya_behind_elaina_s_hair_matte,majo_no_tabitabi_tv_04_moon_scaled)
majo_no_tabitabi_tv_06_saya_behind_elaina_s_hair_matte=Layer(EXTEND_ANIMATION_CG(background,23),majo_no_tabitabi_tv_06_saya_behind_elaina_s_hair_matte)
majo_no_tabitabi_tv_06_saya_behind_elaina_s_hair_matte=CONVERT_BACK_TO_YV12(majo_no_tabitabi_tv_06_saya_behind_elaina_s_hair_matte,matrix="Rec709")



# used
majo_no_tabitabi_tv_07_elaina_s_ponytail_loop_base=Trim(majo_no_tabitabi_tv_07_elaina_s_ponytail,0,-1)
majo_no_tabitabi_tv_07_elaina_s_ponytail_loop=EXTEND_ANIMATION_CG(majo_no_tabitabi_tv_07_elaina_s_ponytail_loop_base,357)
majo_no_tabitabi_tv_07_elaina_s_ponytail_matte=CHROMA_MASK(majo_no_tabitabi_tv_07_elaina_s_ponytail_loop,$059CFB,80)

majo_no_tabitabi_tv_06_boat_extend=EXTEND_ANIMATION_CG(majo_no_tabitabi_tv_06_boat,357)
majo_no_tabitabi_tv_06_boat_scaled=MOVE_CG(majo_no_tabitabi_tv_06_boat_extend,-1,0,Width(majo_no_tabitabi_tv_clean_ed)/10.0,1.1)

majo_no_tabitabi_tv_07_elaina_s_ponytail_matte=MERGE_WITHOUT_ALPHA(majo_no_tabitabi_tv_07_elaina_s_ponytail_matte,majo_no_tabitabi_tv_06_boat_scaled)
majo_no_tabitabi_tv_07_elaina_s_ponytail_matte=Layer(EXTEND_ANIMATION_CG(background,357),majo_no_tabitabi_tv_07_elaina_s_ponytail_matte)
majo_no_tabitabi_tv_07_elaina_s_ponytail_matte=CONVERT_BACK_TO_YV12(majo_no_tabitabi_tv_07_elaina_s_ponytail_matte,matrix="Rec709")



# used
majo_no_tabitabi_tv_08_elaina_s_coat_loop_base=Trim(majo_no_tabitabi_tv_08_elaina_s_coat,12,83)
majo_no_tabitabi_tv_08_elaina_s_coat_loop=EXTEND_ANIMATION_CG(majo_no_tabitabi_tv_08_elaina_s_coat_loop_base,276)
majo_no_tabitabi_tv_08_elaina_s_coat_matte=CHROMA_MASK(majo_no_tabitabi_tv_08_elaina_s_coat_loop,$4E89DB,50)

majo_no_tabitabi_tv_06_palace_corridor_extend=EXTEND_ANIMATION_CG(TRIM_FIRST_CLIP(majo_no_tabitabi_tv_06_palace_corridor,1),276)
majo_no_tabitabi_tv_06_palace_corridor_scaled=MOVE_CG(majo_no_tabitabi_tv_06_palace_corridor_extend,1,0,Width(majo_no_tabitabi_tv_clean_ed)/10.0,1.1)

majo_no_tabitabi_tv_08_elaina_s_coat_matte=MERGE_WITHOUT_ALPHA(majo_no_tabitabi_tv_08_elaina_s_coat_matte,majo_no_tabitabi_tv_06_palace_corridor_scaled)
majo_no_tabitabi_tv_08_elaina_s_coat_matte=Layer(EXTEND_ANIMATION_CG(background,276),majo_no_tabitabi_tv_08_elaina_s_coat_matte)
majo_no_tabitabi_tv_08_elaina_s_coat_matte=CONVERT_BACK_TO_YV12(majo_no_tabitabi_tv_08_elaina_s_coat_matte,matrix="Rec709")



# used
majo_no_tabitabi_tv_08_elaina_s_leg_loop_base=Trim(majo_no_tabitabi_tv_08_elaina_s_leg,10,89)
majo_no_tabitabi_tv_08_elaina_s_leg_loop=EXTEND_ANIMATION_CG(majo_no_tabitabi_tv_08_elaina_s_leg_loop_base,187)
majo_no_tabitabi_tv_08_elaina_s_leg_matte=CHROMA_MASK_2(majo_no_tabitabi_tv_08_elaina_s_leg_loop,$509658,$9F813D,45)

majo_no_tabitabi_tv_06_palace_extend=EXTEND_ANIMATION_CG(TRIM_FIRST_CLIP(majo_no_tabitabi_tv_06_palace,1),187)
majo_no_tabitabi_tv_06_palace_scaled=MOVE_CG(majo_no_tabitabi_tv_06_palace_extend,-1,0,Width(majo_no_tabitabi_tv_clean_ed)/10.0,1.1)

majo_no_tabitabi_tv_08_elaina_s_leg_matte=MERGE_WITHOUT_ALPHA(majo_no_tabitabi_tv_08_elaina_s_leg_matte,majo_no_tabitabi_tv_06_palace_scaled)
majo_no_tabitabi_tv_08_elaina_s_leg_matte=Layer(EXTEND_ANIMATION_CG(background,187),majo_no_tabitabi_tv_08_elaina_s_leg_matte)
majo_no_tabitabi_tv_08_elaina_s_leg_matte=CONVERT_BACK_TO_YV12(majo_no_tabitabi_tv_08_elaina_s_leg_matte,matrix="Rec709")



# used
majo_no_tabitabi_tv_09_elaina_walk_in_lane_loop_base=Trim(majo_no_tabitabi_tv_09_elaina_walk_in_lane,0,124)
majo_no_tabitabi_tv_09_elaina_walk_in_lane_loop=EXTEND_ANIMATION_CG(majo_no_tabitabi_tv_09_elaina_walk_in_lane_loop_base,281)
majo_no_tabitabi_tv_09_elaina_walk_in_lane_matte=CHROMA_MASK(majo_no_tabitabi_tv_09_elaina_walk_in_lane_loop,$868091,20)
majo_no_tabitabi_tv_09_elaina_walk_in_lane_matte=Invert(majo_no_tabitabi_tv_09_elaina_walk_in_lane_matte,"A")

majo_no_tabitabi_tv_04_palace_extend=EXTEND_ANIMATION_CG(majo_no_tabitabi_tv_04_palace,281)
majo_no_tabitabi_tv_04_palace_scaled=SCALE_CG(majo_no_tabitabi_tv_04_palace_extend,Width(majo_no_tabitabi_tv_clean_ed)/2,Height(majo_no_tabitabi_tv_clean_ed)/2,1.0,1.2)

majo_no_tabitabi_tv_09_elaina_walk_in_lane_matte=MERGE_WITHOUT_ALPHA(majo_no_tabitabi_tv_09_elaina_walk_in_lane_matte,majo_no_tabitabi_tv_04_palace_scaled)
majo_no_tabitabi_tv_09_elaina_walk_in_lane_matte=Layer(EXTEND_ANIMATION_CG(background,281),majo_no_tabitabi_tv_09_elaina_walk_in_lane_matte)
majo_no_tabitabi_tv_09_elaina_walk_in_lane_matte=CONVERT_BACK_TO_YV12(majo_no_tabitabi_tv_09_elaina_walk_in_lane_matte,matrix="Rec709")



# used
majo_no_tabitabi_tv_12_elaina_eat_apple_loop_base=Trim(majo_no_tabitabi_tv_12_elaina_eat_apple,24,47)
majo_no_tabitabi_tv_12_elaina_eat_apple_loop=EXTEND_ANIMATION_CG(majo_no_tabitabi_tv_12_elaina_eat_apple_loop_base,234)
majo_no_tabitabi_tv_12_elaina_eat_apple_matte=ColorKeyMask(ColorKeyMask(ConvertToRGB32(majo_no_tabitabi_tv_12_elaina_eat_apple_loop,matrix="Rec709"),$000000,90),$808080,30)

majo_no_tabitabi_tv_07_grape_extend=EXTEND_ANIMATION_CG(TRIM_LAST_CLIP(majo_no_tabitabi_tv_07_grape,1),234)
majo_no_tabitabi_tv_07_grape_scaled=MOVE_CG(majo_no_tabitabi_tv_07_grape_extend,1,0,Width(majo_no_tabitabi_tv_clean_ed)/10.0,1.1)

majo_no_tabitabi_tv_12_elaina_eat_apple_matte=MERGE_WITHOUT_ALPHA(majo_no_tabitabi_tv_12_elaina_eat_apple_matte,majo_no_tabitabi_tv_07_grape_scaled)
majo_no_tabitabi_tv_12_elaina_eat_apple_matte=Layer(EXTEND_ANIMATION_CG(background,234),majo_no_tabitabi_tv_12_elaina_eat_apple_matte)
majo_no_tabitabi_tv_12_elaina_eat_apple_matte=CONVERT_BACK_TO_YV12(majo_no_tabitabi_tv_12_elaina_eat_apple_matte,matrix="Rec709")



majo_no_tabitabi_tv_11_elaina_lick_mirror_loop_base=Trim(majo_no_tabitabi_tv_11_elaina_lick_mirror,281,290)
majo_no_tabitabi_tv_11_elaina_lick_mirror_loop=EXTEND_ANIMATION_CG(majo_no_tabitabi_tv_11_elaina_lick_mirror_loop_base,24*10)

######## Combine ########

# majo_no_tabitabi_tv_clean_ed_01 16
# majo_no_tabitabi_tv_clean_ed_02 281/2080
# majo_no_tabitabi_tv_clean_ed_03 642/2441/3332
# majo_no_tabitabi_tv_clean_ed_04 1079/3792
# majo_no_tabitabi_tv_clean_ed_05 1360/4073
# majo_no_tabitabi_tv_clean_ed_06 1643/4356
# majo_no_tabitabi_tv_clean_ed_07 1830/4676

# majo_no_tabitabi_tv_clean_op_06_elaina_conducting_cache02 1726/3286/4847



majo_no_tabitabi_tv_ed_t01=BlankClip(majo_no_tabitabi_tv_clean_ed,length=16,color=color_black)+majo_no_tabitabi_tv_clean_ed_01
majo_no_tabitabi_tv_ed_t02=majo_no_tabitabi_tv_clean_ed_02+majo_no_tabitabi_tv_clean_ed_03
majo_no_tabitabi_tv_ed_t03=TRIM_FIRST_CLIP(majo_no_tabitabi_tv_09_elaina_walk_in_lane_matte,281)+TRIM_FIRST_CLIP(majo_no_tabitabi_tv_03_elaina_s_hair_matte,283)+TRIM_FIRST_CLIP(majo_no_tabitabi_tv_08_elaina_s_leg_matte,187)

majo_no_tabitabi_tv_ed_t04=TRIM_FIRST_CLIP(majo_no_tabitabi_tv_02_elaina_see_saya_loop_matte,250)

majo_no_tabitabi_tv_ed_t05=TRIM_FIRST_CLIP(majo_no_tabitabi_tv_03_elaina_fly_under_rain_matte,361)+TRIM_FIRST_CLIP(majo_no_tabitabi_tv_08_elaina_s_coat_matte,276)
majo_no_tabitabi_tv_ed_t06=TRIM_FIRST_CLIP(majo_no_tabitabi_tv_05_elaina_fly_over_grass_matte,179)

majo_no_tabitabi_tv_ed_t07=TRIM_FIRST_CLIP(majo_no_tabitabi_tv_01_elaina_tears_matte,282)+TRIM_FIRST_CLIP(majo_no_tabitabi_tv_12_elaina_eat_apple_matte,234)+TRIM_FIRST_CLIP(majo_no_tabitabi_tv_07_elaina_s_ponytail_matte,357)+TRIM_FIRST_CLIP(majo_no_tabitabi_tv_06_saya_behind_elaina_s_hair_matte,23)
majo_no_tabitabi_tv_ed_t08=majo_no_tabitabi_tv_clean_ed_04+majo_no_tabitabi_tv_clean_ed_05+majo_no_tabitabi_tv_clean_ed_06+TRIM_FIRST_CLIP(majo_no_tabitabi_tv_02_elaina_see_inside_of_country_for_mages_matte,133)
majo_no_tabitabi_tv_ed_t09=majo_no_tabitabi_tv_clean_ed_07 #+BlankClip(majo_no_tabitabi_tv_clean_ed,length=24*4,color=color_black)



majo_no_tabitabi_tv_ed_mute=majo_no_tabitabi_tv_ed_t01+majo_no_tabitabi_tv_ed_t02+majo_no_tabitabi_tv_ed_t03 \
	+majo_no_tabitabi_tv_ed_t04+majo_no_tabitabi_tv_ed_t05+majo_no_tabitabi_tv_ed_t06 \
	+majo_no_tabitabi_tv_ed_t07+majo_no_tabitabi_tv_ed_t08+majo_no_tabitabi_tv_ed_t09

majo_no_tabitabi_tv_ed_mute

### export clip: majo_no_tabitabi_tv_ed_mute,majo_no_tabitabi_tv_11_elaina_lick_mirror_loop

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
global subtitle_outside_halo_color=color_gray10

function SUBTITLE_FX(clip clip,string text,float x,float y,int start_frame,int end_frame,bool "is_furigana",bool "is_title"){
	is_title=Default(is_title,false)
	is_furigana=Default(is_furigana,false)

	outside_halo_color=is_title?color_deepskyblue:subtitle_outside_halo_color

	subtitle_mode=is_furigana?"ex":"ex" #"ex_thick_reduce_memory"
	size=is_furigana?subtitle_size*0.5:subtitle_size
	y=is_furigana?y-size:y

	return is_furigana?SUBTITLE_FX_FADE_IN_FADE_OUT_DOUBLE_HALO(clip,text,Round(x),Round(y),start_frame,end_frame,subtitle_front_fade_count,subtitle_rear_fade_count,subtitle_font,subtitle_effects,Round(size),subtitle_text_color,subtitle_halo_color,outside_halo_color,subtitle_mode) \
		:SUBTITLE_FX_RANDOM_APPEAR_FADE_OUT_DOUBLE_HALO(clip,text,Round(x),Round(y),start_frame,end_frame,subtitle_front_fade_count,subtitle_rear_fade_count,subtitle_font,subtitle_effects,Round(size),subtitle_text_color,subtitle_halo_color,outside_halo_color,subtitle_mode)
}

### inherit end ###

ConvertToRGB32(matrix="Rec709")

SUBTITLE_FX("灰色のサーガ//ChouCho|この神MVを作る人は誰でしょうか？そう、私です！|- by fielia@AVISynth",-subtitle_x,subtitle_y-subtitle_size*2,4710,4921,is_title=true)

SUBTITLE_FX("つき あ          て              こ みち    とお     ぬ",subtitle_x,subtitle_y,275,455,true)
SUBTITLE_FX("月明かり照らす　小道を通り抜け",subtitle_x,subtitle_y,275,455)
SUBTITLE_FX("やさ            うら        かく        あま    どく",subtitle_x,subtitle_y-subtitle_size*2,457,629,true)
SUBTITLE_FX("優しさの裏に　隠れた甘い毒に",subtitle_x,subtitle_y-subtitle_size*2,457,629)
SUBTITLE_FX("まど",subtitle_x,subtitle_y,629,717,true)
SUBTITLE_FX("惑わされないよう",subtitle_x,subtitle_y,629,717)
SUBTITLE_FX("まも                        まも    つよ",subtitle_x,subtitle_y-subtitle_size*2,721,879,true)
SUBTITLE_FX("守りたいもの　守る強さ",subtitle_x,subtitle_y-subtitle_size*2,721,879)
SUBTITLE_FX("           かなら    て      い             しん",subtitle_x,subtitle_y,879,1073,true)
SUBTITLE_FX("いつか必ず手に入れると信じて",subtitle_x,subtitle_y,879,1073)		

SUBTITLE_FX(" あたら         あす           ゆ",subtitle_x,subtitle_y-subtitle_size*2,1067,1168,true)
SUBTITLE_FX(" 新しい明日へ　行くよ",subtitle_x,subtitle_y-subtitle_size*2,1067,1168)
SUBTITLE_FX(" よろこ       ぜつぼう     こ             いそ            さき",subtitle_x,subtitle_y,1161,1349,true)
SUBTITLE_FX(" 喜びも絶望も超えて　急ぐその先へ",subtitle_x,subtitle_y,1161,1349)
SUBTITLE_FX("             し",subtitle_x,subtitle_y-subtitle_size*2,1348,1416,true)
SUBTITLE_FX("ただ「知りたい」から",subtitle_x,subtitle_y-subtitle_size*2,1348,1416)
SUBTITLE_FX(" で  あ         まな        えら    みち        つづ",subtitle_x,subtitle_y,1419,1554,true)
SUBTITLE_FX("出会い　学び　選ぶ道で　綴る",subtitle_x,subtitle_y,1419,1554)
SUBTITLE_FX(" わたし          ものがたり   だれ     み",subtitle_x,subtitle_y-subtitle_size*2,1551,1759,true)
SUBTITLE_FX(" 私だけの物語　誰も見たことのない",subtitle_x,subtitle_y-subtitle_size*2,1551,1759)
SUBTITLE_FX("       いち",subtitle_x,subtitle_y,1760,1853,true)
SUBTITLE_FX("その1ページを",subtitle_x,subtitle_y,1760,1853)

### pass clip: majo_no_tabitabi_tv_ed_mute,majo_no_tabitabi_tv_11_elaina_lick_mirror_loop

### prefetch: 5,2

### ### 

SUBTITLE_FX(" かぐわ       かお    はなびら     さ",subtitle_x,subtitle_y,2075,2252,true)
SUBTITLE_FX(" 芳しく香る花弁　避けるように",subtitle_x,subtitle_y,2075,2252)
SUBTITLE_FX(" め     まえ    うつ         き れい    こと ば",subtitle_x,subtitle_y-subtitle_size*2,2255,2428,true)
SUBTITLE_FX("目の前に映る　綺麗な言葉たちに",subtitle_x,subtitle_y-subtitle_size*2,2255,2428)
SUBTITLE_FX("まど                                しんじつ     み きわ",subtitle_x,subtitle_y,2427,2702,true)
SUBTITLE_FX("惑わされないよう　真実を見極めるため",subtitle_x,subtitle_y,2427,2702)

SUBTITLE_FX(" お     かぜ     む         かぜ     み かた            すす",subtitle_x,subtitle_y-subtitle_size*2,2889,3073,true)
SUBTITLE_FX("追い風も向かい風も味方にして進もう",subtitle_x,subtitle_y-subtitle_size*2,2889,3073)
SUBTITLE_FX(" よ そく ふ のう     み らい き     ひら",subtitle_x,subtitle_y,3075,3278,true)
SUBTITLE_FX("予測不能な未来切り拓き",subtitle_x,subtitle_y,3075,3278)

SUBTITLE_FX("かな            のぞ            かな                つよ",subtitle_x,subtitle_y-subtitle_size*2,3405,3566,true)
SUBTITLE_FX("叶えたい望みを　叶えられる強さ",subtitle_x,subtitle_y-subtitle_size*2,3405,3566)
SUBTITLE_FX("           かなら    て      い             しん",subtitle_x,subtitle_y,3568,3770,true)
SUBTITLE_FX("いつか必ず手に入れると信じて",subtitle_x,subtitle_y,3568,3770)

SUBTITLE_FX(" あたら         あす           ゆ",subtitle_x,subtitle_y-subtitle_size*2,3780,3880,true)
SUBTITLE_FX(" 新しい明日へ　行くよ",subtitle_x,subtitle_y-subtitle_size*2,3780,3880)
SUBTITLE_FX("かな           しあわ        こ             いの            さき",subtitle_x,subtitle_y,3875,4062,true)
SUBTITLE_FX("悲しみも幸せも超えて　祈るその先へ",subtitle_x,subtitle_y,3875,4062)
SUBTITLE_FX("             し",subtitle_x,subtitle_y-subtitle_size*2,4060,4129,true)
SUBTITLE_FX("まだ「知りたい」から",subtitle_x,subtitle_y-subtitle_size*2,4060,4129)
SUBTITLE_FX(" で  あ         わか         く     かえ            きざ",subtitle_x,subtitle_y,4132,4266,true)
SUBTITLE_FX("出会い　別れ　繰り返して　刻む",subtitle_x,subtitle_y,4132,4266)
SUBTITLE_FX(" わたし          ものがたり   だれ     み",subtitle_x,subtitle_y-subtitle_size*2,4264,4472,true)
SUBTITLE_FX(" 私だけの物語　誰も見たことのない",subtitle_x,subtitle_y-subtitle_size*2,4264,4472)
SUBTITLE_FX("けつまつ                       いち",subtitle_x,subtitle_y,4476,4672,true)
SUBTITLE_FX("結末となる　その1ページを",subtitle_x,subtitle_y,4476,4672)

######## Thumbnail ########

is_thumbnail=false

is_thumbnail?ConvertToRGB32(majo_no_tabitabi_tv_ed_mute,matrix="Rec709"):last

######## Music ########

bgm_48khz=SSRC(WAVSource("src\majo_no_tabitabi-ed-01.wav"),48000)
Normalize(AudioDub(bgm_48khz))



thumbnail=Trim(4917-24*5/2,-24*5)



majo_no_tabitabi_tv_11_elaina_lick_mirror_loop=ConvertToRGB32(majo_no_tabitabi_tv_11_elaina_lick_mirror_loop,matrix="Rec709")
majo_no_tabitabi_tv_11_elaina_lick_mirror_loop_audio=FadeOut0(Trim(1075,-Framecount(majo_no_tabitabi_tv_11_elaina_lick_mirror_loop)),fade_length)
majo_no_tabitabi_tv_11_elaina_lick_mirror_post=AudioDub(majo_no_tabitabi_tv_11_elaina_lick_mirror_loop,majo_no_tabitabi_tv_11_elaina_lick_mirror_loop_audio)
last++majo_no_tabitabi_tv_11_elaina_lick_mirror_post++BlankClip(last,length=24*1,color=color_black)



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
