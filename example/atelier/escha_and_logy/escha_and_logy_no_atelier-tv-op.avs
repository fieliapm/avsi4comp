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



Import("escha_and_logy_no_atelier-tv-common.avsi")

######## Pre Combine ########

LoadVirtualDubPlugin("..\..\plugins\msu_oldcinema_20.vdf","MSU_OldCinema")

function OLD_CINEMA(clip clip){
	return MSU_OldCinema(ConvertToRGB32(clip),255,255,255,0,0,0,30,70,15,3,30,10,30,150,0,2,100)
}



escha_and_logy_no_atelier_tv_clean_op_05_last_frame=Framecount(escha_and_logy_no_atelier_tv_clean_op_05)-1
escha_and_logy_no_atelier_tv_clean_op_05_extend=Loop(escha_and_logy_no_atelier_tv_clean_op_05,24*3,escha_and_logy_no_atelier_tv_clean_op_05_last_frame,escha_and_logy_no_atelier_tv_clean_op_05_last_frame)

######## Combine ########

# start1 30
# start2 363
# escha_and_logy_no_atelier_tv_clean_op_01 611
# escha_and_logy_no_atelier_tv_clean_op_04 4882
# escha_and_logy_no_atelier_tv_clean_op_05 6599



fade_length=12

escha_and_logy_no_atelier_tv_op_t01=BlankClip(escha_and_logy_no_atelier_tv_clean_op,length=30,color=color_black)+FadeIn0(ConvertToYV12(OLD_CINEMA(TRIM_MIDDLE_CLIP(escha_and_logy_no_atelier_tv_04_escha_and_miria_perform_alchemy_01,124)+TRIM_LAST_CLIP(escha_and_logy_no_atelier_tv_04_escha_and_miria_perform_alchemy_00,209-Framecount(escha_and_logy_no_atelier_tv_clean_op_00)))),fade_length*2)+escha_and_logy_no_atelier_tv_clean_op_00
escha_and_logy_no_atelier_tv_op_t02=TRIM_LAST_CLIP(escha_and_logy_no_atelier_tv_09_mural_in_ruin,124)+FADE_OUT_WITH_BRIGHTNESS_OFFSET_RGB24(TRIM_MIDDLE_CLIP(escha_and_logy_no_atelier_tv_06_apple_tree,124),fade_length*2)

escha_and_logy_no_atelier_tv_op_t03=escha_and_logy_no_atelier_tv_clean_op_01+escha_and_logy_no_atelier_tv_clean_op_02+escha_and_logy_no_atelier_tv_clean_op_03
escha_and_logy_no_atelier_tv_op_t04=TRIM_FIRST_CLIP(escha_and_logy_no_atelier_tv_02_escha_find_flower,124)+TRIM_FIRST_CLIP(escha_and_logy_no_atelier_tv_06_faul_ask_escha,140)+TRIM_LAST_CLIP(escha_and_logy_no_atelier_tv_05_homunculus_round_lucille,148)+TRIM_MIDDLE_CLIP(escha_and_logy_no_atelier_tv_11_airship_dash,109)+TRIM_FIRST_CLIP(escha_and_logy_no_atelier_tv_08_escha_swear_that_she_must_go_to_ruin_in_sky,62)

escha_and_logy_no_atelier_tv_op_t05=TRIM_MIDDLE_CLIP(escha_and_logy_no_atelier_tv_12_airship_lift_off,124)+TRIM_LAST_CLIP(escha_and_logy_no_atelier_tv_10_escha_and_logy_look_at_the_scenery,125)

escha_and_logy_no_atelier_tv_op_t06=TRIM_MIDDLE_CLIP(escha_and_logy_no_atelier_tv_10_harry_ask_katla,62)+TRIM_FIRST_CLIP(escha_and_logy_no_atelier_tv_10_reyfer_escape_from_dragon,62)+TRIM_FIRST_CLIP(escha_and_logy_no_atelier_tv_02_wilbell_use_wind_magic_01,62)+TRIM_LAST_CLIP(escha_and_logy_no_atelier_tv_11_linca_training,62)+TRIM_LAST_CLIP(escha_and_logy_no_atelier_tv_03_threia_launch_machine,62)+TRIM_FIRST_CLIP(escha_and_logy_no_atelier_tv_10_micie,74)+TRIM_MIDDLE_CLIP(escha_and_logy_no_atelier_tv_08_nio_lucille_marion_linca_wilbell_escha_in_pool,114)
escha_and_logy_no_atelier_tv_op_t07=TRIM_FIRST_CLIP(escha_and_logy_no_atelier_tv_11_ruin_in_sky,62)+TRIM_LAST_CLIP(escha_and_logy_no_atelier_tv_01_clone_and_faul_see_windmill,62)+TRIM_LAST_CLIP(escha_and_logy_no_atelier_tv_07_linca_3_say_goodbye_to_linca_1,62)+TRIM_MIDDLE_CLIP(escha_and_logy_no_atelier_tv_07_linca_3_attack_to_linca_1_and_linca_8,58)+TRIM_LAST_CLIP(escha_and_logy_no_atelier_tv_04_katla_lift_apple,128)+TRIM_LAST_CLIP(escha_and_logy_no_atelier_tv_12_wilbell_use_fire_magic,126)

escha_and_logy_no_atelier_tv_op_t08=TRIM_MIDDLE_CLIP(escha_and_logy_no_atelier_tv_07_marion_protect_linca_8,62)+TRIM_MIDDLE_CLIP(escha_and_logy_no_atelier_tv_12_kuu_touch_flameu_s_leg,62)+TRIM_MIDDLE_CLIP(escha_and_logy_no_atelier_tv_08_fire_fairy_fly_around_escha_and_others,124)+TRIM_LAST_CLIP(escha_and_logy_no_atelier_tv_03_wilbell_draw_magic_circle,62)+TRIM_MIDDLE_CLIP(escha_and_logy_no_atelier_tv_03_fairy_raise_hand,62)+Dissolve(TRIM_LAST_CLIP(escha_and_logy_no_atelier_tv_06_escha_see_ruin_in_sky,62+fade_length/2),TRIM_MIDDLE_CLIP(escha_and_logy_no_atelier_tv_09_escha_in_rain,40+fade_length/2),fade_length)
escha_and_logy_no_atelier_tv_op_t09=TRIM_LAST_CLIP(escha_and_logy_no_atelier_tv_10_logy_hug_escha,123)+TRIM_FIRST_CLIP(escha_and_logy_no_atelier_tv_12_flameu_sit_up,140)+TRIM_MIDDLE_CLIP(escha_and_logy_no_atelier_tv_12_flameu_leave_from_human,55)+TRIM_LAST_CLIP(escha_and_logy_no_atelier_tv_11_clone_take_apple_seed,62)+TRIM_LAST_CLIP(escha_and_logy_no_atelier_tv_11_nio_remember_ayesha_call_her,118)

escha_and_logy_no_atelier_tv_op_t10=escha_and_logy_no_atelier_tv_clean_op_04+TRIM_LAST_CLIP(escha_and_logy_no_atelier_tv_09_duke_and_colland_fight,109)+TRIM_MIDDLE_CLIP(escha_and_logy_no_atelier_tv_01_escha_wake_up_02,62)+TRIM_MIDDLE_CLIP(escha_and_logy_no_atelier_tv_01_escha_wake_up_03,62)+TRIM_MIDDLE_CLIP(escha_and_logy_no_atelier_tv_11_kuu_transform,187)

escha_and_logy_no_atelier_tv_op_t11=TRIM_FIRST_CLIP(escha_and_logy_no_atelier_tv_01_desert,124)+TRIM_LAST_CLIP(escha_and_logy_no_atelier_tv_06_logy_perform_alchemy,125)+TRIM_MIDDLE_CLIP(escha_and_logy_no_atelier_tv_08_wilbell_show_magic_fireworks_02,62)+TRIM_FIRST_CLIP(escha_and_logy_no_atelier_tv_08_linca_and_marion_angry_to_wilbell,62)+TRIM_LAST_CLIP(escha_and_logy_no_atelier_tv_05_awin_hug_logy_who_is_thinking,125)
escha_and_logy_no_atelier_tv_op_t12=TRIM_MIDDLE_CLIP(escha_and_logy_no_atelier_tv_02_escha_and_logy_round_fire,124)+TRIM_MIDDLE_CLIP(escha_and_logy_no_atelier_tv_01_homunculus,124)+FADE_OUT_WITH_BRIGHTNESS_OFFSET_RGB24(TRIM_FIRST_CLIP(escha_and_logy_no_atelier_tv_04_escha_lift_book,125),fade_length)+BlankClip(escha_and_logy_no_atelier_tv_clean_op,length=15,color=color_white)+escha_and_logy_no_atelier_tv_clean_op_05_extend



escha_and_logy_no_atelier_tv_op_mute=DOUBLE_FADE_WITH_BRIGHTNESS_OFFSET_RGB24(escha_and_logy_no_atelier_tv_op_t01,escha_and_logy_no_atelier_tv_op_t02,fade_length*2,fade_length*2) \
	+escha_and_logy_no_atelier_tv_op_t03+DOUBLE_FADE_WITH_BRIGHTNESS_OFFSET_RGB24(DOUBLE_FADE_WITH_BRIGHTNESS_OFFSET_RGB24(escha_and_logy_no_atelier_tv_op_t04, \
	escha_and_logy_no_atelier_tv_op_t05,fade_length,fade_length), \
	escha_and_logy_no_atelier_tv_op_t06,fade_length,fade_length)+escha_and_logy_no_atelier_tv_op_t07 \
	+DOUBLE_FADE_WITH_BRIGHTNESS_OFFSET_RGB24(escha_and_logy_no_atelier_tv_op_t08,ConvertToYV12(OLD_CINEMA(escha_and_logy_no_atelier_tv_op_t09)),fade_length,fade_length) \
	+DOUBLE_FADE_WITH_BRIGHTNESS_OFFSET_RGB24(escha_and_logy_no_atelier_tv_op_t10, \
	+escha_and_logy_no_atelier_tv_op_t11,fade_length,fade_length)+escha_and_logy_no_atelier_tv_op_t12

######## Music ########

bgm_48khz=SSRC(WAVSource("src\escha_and_logy_no_atelier-ost-the_animation-01.wav"),48000)
AudioDub(escha_and_logy_no_atelier_tv_op_mute,bgm_48khz)



thumbnail=Trim(4303,-24*5)

######## Subtitle ########

global subtitle_clip_width=1280
global subtitle_clip_height=720

subtitle_x=50*1.5
subtitle_y=395*1.5
global subtitle_front_fade_count=12
global subtitle_rear_fade_count=12
global subtitle_font="MS Gothic"
global subtitle_effects="b"
global subtitle_size=32*1.5
global subtitle_text_color=color_dodgerblue
global subtitle_halo_color=color_white

second_subtitle_x=50*1.5
second_subtitle_y=50*1.5

function SUBTITLE_FX(clip clip,string text,float x,float y,int start_frame,int end_frame,bool "is_second_subtitle",bool "is_title"){
	is_second_subtitle=Default(is_second_subtitle,false)
	is_title=Default(is_title,false)

	text_color=is_second_subtitle?OVERWRITE_SUBTITLE_COLOR_ALPHA(subtitle_text_color,$C0):subtitle_text_color
	text_color=is_title?OVERWRITE_SUBTITLE_COLOR_ALPHA(subtitle_text_color,$C0):subtitle_text_color

	return SUBTITLE_FX_FADE_IN_FADE_OUT(clip,text,Round(x),Round(y),start_frame,end_frame,subtitle_front_fade_count,subtitle_rear_fade_count,subtitle_font,subtitle_effects,Round(subtitle_size),text_color,subtitle_halo_color,"ex_thick_reduce_memory")
}

SUBTITLE_FX("ƒAƒXƒCƒ//‘Ίμ—ί|- by fielia@AVISynth",subtitle_x,subtitle_y-subtitle_size,6583,6818,is_title=true)

SUBTITLE_FX("“Ή‚π’Κ‚θ”²‚―‚Δ‚­•—‚ª",subtitle_x,subtitle_y,616,706)
SUBTITLE_FX("’m‚η‚Θ‚Ά‚θ‚π‰^‚ρ‚Ε‚­‚ι",subtitle_x,subtitle_y,741,844)
SUBTITLE_FX("Xp‚ΙΟ‚ΰ‚ιβ‚µ‚³",subtitle_x,subtitle_y,865,955)
SUBTITLE_FX("θ‚πq‚Ά‚Ε‹σ‚Φ‚Ζ—·—§‚Α‚Δ‚­",subtitle_x,subtitle_y,991,1145)

SUBTITLE_FX("‰_‚Ι‰B‚κ‚½‹σ‚Μό‚±‚¤‚Ι‰½‚©‚ª‘Ò‚Α‚Δ‚Ά‚ι‚Μ",second_subtitle_x,second_subtitle_y,1107,1217,true)
SUBTITLE_FX("‚«‚Α‚Ζ",subtitle_x,subtitle_y,1212,1268)
SUBTITLE_FX("‚»‚±‚Ι„‚Μ’m‚η‚Θ‚ΆΆE‚ªL‚ª‚Α‚Δ‚Ά‚ι ‚Ύ‚©‚η",second_subtitle_x,second_subtitle_y,1231,1346,true)
SUBTITLE_FX("‚ ‚Μ“ϊ–²©‚½|‚±‚±‚Ζ‚Να‚¤‚Η‚±‚©‰“‚Άκ‚π–Ϊw‚µ‚Δ",subtitle_x,subtitle_y-subtitle_size,1356,1573)

SUBTITLE_FX("“ψ‚Μ‹΄‚π–Ύ“ϊ‚Φ‚Ζ‰Λ‚―‚Δ",subtitle_x,subtitle_y,1577,1698)
SUBTITLE_FX("–ι‚Μζ‚π©‚Β‚ί‚Δ‘–‚ι",subtitle_x,subtitle_y,1703,1822)
SUBTITLE_FX("π“ϊ‚Ι‘«‚πζ‚η‚κ‚»‚¤‚Ε‚ΰ",subtitle_x,subtitle_y,1842,1956)
SUBTITLE_FX("γ‚λ‚π©‚½‚θ‚Ν‚ΰ‚¤‚µ‚Θ‚Ά‚ζ",subtitle_x,subtitle_y,1959,2075)
SUBTITLE_FX("—ά‚Μ‚Ι‚¶‚ή‰©¨F",subtitle_x,subtitle_y,2076,2195)
SUBTITLE_FX("–Ά—‚π’T‚·„‚ΜF",subtitle_x,subtitle_y,2200,2318)
SUBTITLE_FX("•|‚ª‚η‚Θ‚Ά‚Ε”ΰJ‚―‚Ξ",subtitle_x,subtitle_y,2341,2462)
SUBTITLE_FX("‚έ‚ρ‚Θ‚ª‘Ò‚Α‚Δ‚ι",subtitle_x,subtitle_y,2487,2643)

SUBTITLE_FX("‘O‚πό‚Ά‚Δ•ΰ‚«o‚Ή‚Ξ",subtitle_x,subtitle_y,2918,3007)
SUBTITLE_FX("π“ϊ‚ζ‚θ‘‚­‰ί‚¬‚Δ‚­iF",subtitle_x,subtitle_y,3044,3145)
SUBTITLE_FX("‰_‚Μζ‚π©‚Β‚ί‚Θ‚ª‚η",subtitle_x,subtitle_y,3168,3256)
SUBTITLE_FX("ι‚Ά‹σ‚Φ‚Ζ‰e‚ª—n‚―‚ρ‚Ε‚­",subtitle_x,subtitle_y,3292,3449)

SUBTITLE_FX("‚Η‚±‚Ι„‚Μ’m‚η‚Θ‚ΆiF‚ª‰B‚κ‚Δ‚Ά‚ι‚ρ‚Ύ‚λ‚¤",second_subtitle_x,second_subtitle_y,3907,4021,true)
SUBTITLE_FX("’T‚µ‹‚ί‚½“‚¦‚ª‚»‚±‚Ι‚ ‚ι‚ΖM‚¶‚Δ‚Ά‚Ά‚Μ‚©‚Θ",second_subtitle_x,second_subtitle_y,4031,4144,true)
SUBTITLE_FX("‚ ‚Μ“ϊ¶‚ά‚κ‚½¬‚³‚Θ‘z‚Ά‚ªFες‚Ή‚ι‘O‚Ιc",second_subtitle_x,second_subtitle_y,4156,4304,true)

SUBTITLE_FX("„‚Μ‚Θ‚©‚Ι©‚Β‚―‚½F",subtitle_x,subtitle_y,4378,4499)
SUBTITLE_FX("‹C‚Γ‚©‚Θ‚Άƒtƒ‚π‚µ‚Δ‚Ά‚½F",subtitle_x,subtitle_y,4501,4623)
SUBTITLE_FX("‹ƒ‚«‚Ύ‚µ‚»‚¤‚Θ‰_‚Μ„Τ‚π",subtitle_x,subtitle_y,4641,4756)
SUBTITLE_FX("’Η‚Ά‚©‚―‚ι‚ζ‚¤‚Ιθ‚πL‚Ξ‚µ‚Δ",subtitle_x,subtitle_y,4759,4874)

SUBTITLE_FX("“Ν‚―–Ύ“ϊ‚Φ‚Μ‘z‚Ά‹σ‚Φ",subtitle_x,subtitle_y,4876,4995)
SUBTITLE_FX("—Όθ‚©‚ημ‚κ‚Δ‚­‚ι–²",subtitle_x,subtitle_y,5001,5119)
SUBTITLE_FX("‚έ‚ρ‚Θ‚Ζκ‚Ι‚¦‚Δ‚Ά‚±‚¤",subtitle_x,subtitle_y,5139,5266)
SUBTITLE_FX("σ–]‚Ιό‚©‚Α‚Δ",subtitle_x,subtitle_y,5287,5433)
SUBTITLE_FX("‰©¨‚Μ‹σ‚Φ",second_subtitle_x,second_subtitle_y,5411,5556)
SUBTITLE_FX("–Ύ“ϊF‚Μ‹σ‚Φ",subtitle_x,subtitle_y,5536,5797)
SUBTITLE_FX("‹σ‚Φcc",subtitle_x,subtitle_y,6199,6327)



ConvertToYV12(last)++escha_and_logy_no_atelier_tv_12_shallistera_and_shallotte



#thumbnail

######## Post Processing ########

ConvertToYV12()
#ConvertToYUY2()
#ConvertToRGB24()

TCPServer()
