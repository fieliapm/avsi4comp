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



Import("turn_a_gundam-common.avsi")

######## DVD (480P) ########

fpsnum=24000
fpsden=1001

turn_a_gundam_tv_clean_op_02=FFMS2_VIDEO_SOURCE("src\turn_a_gundam-tv\special\turn_a_gundam-tv-op-02.wmv",fpsnum=fpsnum,fpsden=fpsden)

#turn_a_gundam_tv_clean_op_02_title=Trim(turn_a_gundam_tv_clean_op_02,0,71)
turn_a_gundam_tv_clean_op_02_part01=Trim(turn_a_gundam_tv_clean_op_02,72,499)
turn_a_gundam_tv_clean_op_02_part02=Trim(turn_a_gundam_tv_clean_op_02,500,773)
turn_a_gundam_tv_clean_op_02_part03=Trim(turn_a_gundam_tv_clean_op_02,774,920)
turn_a_gundam_tv_clean_op_02_part04=Trim(turn_a_gundam_tv_clean_op_02,921,1067)
turn_a_gundam_tv_clean_op_02_part05=Trim(turn_a_gundam_tv_clean_op_02,1068,1203)
turn_a_gundam_tv_clean_op_02_part06=Trim(turn_a_gundam_tv_clean_op_02,1204,1341)
turn_a_gundam_tv_clean_op_02_part07=Trim(turn_a_gundam_tv_clean_op_02,1342,1579)
turn_a_gundam_tv_clean_op_02_part08=Trim(turn_a_gundam_tv_clean_op_02,1580,0)

######## BD (1080P) ########

turn_a_gundam_movie_02_cache01=FFMS2_VIDEO_SOURCE("src\turn_a_gundam-movie\bd-aac_2ch\turn_a_gundam-movie-bd-aac_2ch-02.mp4")
turn_a_gundam_movie_02_cache02=FFMS2_VIDEO_SOURCE("src\turn_a_gundam-movie\bd-aac_2ch\turn_a_gundam-movie-bd-aac_2ch-02.mp4")

turn_a_gundam_movie_02_gym_and_merrybell=Trim(turn_a_gundam_movie_02_cache01,519,793)
turn_a_gundam_movie_02_space=Trim(turn_a_gundam_movie_02_cache01,2925,3389)
turn_a_gundam_movie_02_turn_a_float=Trim(turn_a_gundam_movie_02_cache01,5878,5926)

turn_a_gundam_movie_02_kihel_and_harry_kiss_01=Trim(turn_a_gundam_movie_02_cache01,13286,13374)
turn_a_gundam_movie_02_kihel_and_harry_kiss_02=Trim(turn_a_gundam_movie_02_cache01,13375,13488)
turn_a_gundam_movie_02_kihel_and_harry_kiss_03=Trim(turn_a_gundam_movie_02_cache01,13489,13634)

turn_a_gundam_movie_02_turn_a_open_hand=Trim(turn_a_gundam_movie_02_cache01,27422,27650)

turn_a_gundam_movie_02_black_history_01=Trim(turn_a_gundam_movie_02_cache01,70716,70946)
turn_a_gundam_movie_02_black_history_02=Trim(turn_a_gundam_movie_02_cache02,71093,71382)
turn_a_gundam_movie_02_black_history_03=Trim(turn_a_gundam_movie_02_cache02,71383,71467)

turn_a_gundam_movie_02_turn_a_evade_01=Trim(turn_a_gundam_movie_02_cache01,72693,72843)
turn_a_gundam_movie_02_turn_a_evade_02=Trim(turn_a_gundam_movie_02_cache01,72844,72888)

turn_a_gundam_movie_02_turn_a_appearing=Trim(turn_a_gundam_movie_02_cache01,90113,90261)
turn_a_gundam_movie_02_turn_x_appearing=Trim(turn_a_gundam_movie_02_cache01,90926,91104)
turn_a_gundam_movie_02_turn_x_moonlight_butterfly=Trim(turn_a_gundam_movie_02_cache01,146507,146723)

turn_a_gundam_movie_02_turn_a_vs_turn_x_01=Trim(turn_a_gundam_movie_02_cache01,156243,156426)
turn_a_gundam_movie_02_turn_a_vs_turn_x_02=Trim(turn_a_gundam_movie_02_cache01,161972,162008)
turn_a_gundam_movie_02_turn_a_vs_turn_x_03=Trim(turn_a_gundam_movie_02_cache01,162244,162367)

######## Pre Combine (480P) ########

sekai_meisaku_gekijou=SEKAI_MEISAKU_GEKIJOU_CLIP(turn_a_gundam_tv_clean_op_02_part01,18)

turn_a_gundam_tv_clean_op_02_part07_extend=Loop(turn_a_gundam_tv_clean_op_02_part07,25,237,237)
turn_a_gundam_tv_clean_op_02_part08_extend=Loop(turn_a_gundam_tv_clean_op_02_part08,120,411,411)

turn_a_gundam_tv_clean_op_02_01=sekai_meisaku_gekijou+turn_a_gundam_tv_clean_op_02_part01
turn_a_gundam_tv_clean_op_02_02=turn_a_gundam_tv_clean_op_02_part02+turn_a_gundam_tv_clean_op_02_part03+turn_a_gundam_tv_clean_op_02_part04+turn_a_gundam_tv_clean_op_02_part05+turn_a_gundam_tv_clean_op_02_part06+turn_a_gundam_tv_clean_op_02_part07_extend
turn_a_gundam_tv_clean_op_02_03=turn_a_gundam_tv_clean_op_02_part08_extend
turn_a_gundam_tv_clean_op_02_01_resized=RESIZE_TO_REF_CLIP(turn_a_gundam_tv_clean_op_02_01,turn_a_gundam_movie_02_gym_and_merrybell)
turn_a_gundam_tv_clean_op_02_02_resized=RESIZE_TO_REF_CLIP(turn_a_gundam_tv_clean_op_02_02,turn_a_gundam_movie_02_gym_and_merrybell)
turn_a_gundam_tv_clean_op_02_03_resized=RESIZE_TO_REF_CLIP(turn_a_gundam_tv_clean_op_02_03,turn_a_gundam_movie_02_gym_and_merrybell)

######## Pre Combine (1080P) ########

turn_a_gundam_movie_02_kihel_and_harry_kiss=turn_a_gundam_movie_02_kihel_and_harry_kiss_01+TRIM_FIRST_CLIP(turn_a_gundam_movie_02_kihel_and_harry_kiss_02,67)+turn_a_gundam_movie_02_kihel_and_harry_kiss_03
turn_a_gundam_movie_02_turn_a_evade=TRIM_FIRST_CLIP(turn_a_gundam_movie_02_turn_a_evade_01,133)+turn_a_gundam_movie_02_turn_a_evade_02
turn_a_gundam_movie_02_turn_a_vs_turn_x=TRIM_FIRST_CLIP(turn_a_gundam_movie_02_turn_a_vs_turn_x_01,133)+TRIM_FIRST_CLIP(turn_a_gundam_movie_02_turn_a_vs_turn_x_02+turn_a_gundam_movie_02_turn_a_vs_turn_x_03,133)



fade_length=48
blank_clip_length=Framecount(turn_a_gundam_movie_02_black_history_01)-fade_length
overlay_clip_base=BlankClip(turn_a_gundam_movie_02_gym_and_merrybell,length=blank_clip_length,color=color_black)+turn_a_gundam_movie_02_black_history_03
overlay_clip_base_rgb32=ConvertToRGB32(overlay_clip_base)
turn_a_gundam_movie_02_black_history_01_rgb32=ConvertToRGB32(turn_a_gundam_movie_02_black_history_01)
overlay_clip_rgb32=TRANSFORM(overlay_clip_base_rgb32,turn_a_gundam_movie_02_black_history_01_rgb32,factor="(n>blank_clip_length)?1.0-0.5*Float(n-blank_clip_length)/Float(fade_length):1.0",angle="(n>blank_clip_length)?n-blank_clip_length:0.0",opacity="CLAMP(1.0-Float(n-blank_clip_length)/Float(fade_length),0.0,1.0)")
turn_a_gundam_movie_02_black_history=ConvertToYV12(overlay_clip_rgb32)+turn_a_gundam_movie_02_black_history_02

######## Combine ########

# turn_a_gundam_tv_clean_op_02_part01 18
# turn_a_gundam_tv_clean_op_02_part02 1036
# turn_a_gundam_tv_clean_op_02_part08 4025

turn_a_gundam_tv_op_02_t01_dissolve_length=24
turn_a_gundam_tv_op_02_t01=Dissolve(turn_a_gundam_tv_clean_op_02_01_resized,TRIM_FIRST_CLIP(turn_a_gundam_movie_02_space,309+turn_a_gundam_tv_op_02_t01_dissolve_length),turn_a_gundam_tv_op_02_t01_dissolve_length)
turn_a_gundam_tv_op_02_t02=TRIM_LAST_CLIP(turn_a_gundam_movie_02_gym_and_merrybell,264)+Dissolve(Dissolve(turn_a_gundam_movie_02_turn_a_float,turn_a_gundam_tv_clean_op_02_02_resized,32),TRIM_FIRST_CLIP(turn_a_gundam_movie_02_kihel_and_harry_kiss,282),20)
turn_a_gundam_tv_op_02_t03=TRIM_FIRST_CLIP(turn_a_gundam_movie_02_black_history,532)
turn_a_gundam_tv_op_02_t04=TRIM_FIRST_CLIP(turn_a_gundam_movie_02_turn_x_appearing,133)+TRIM_FIRST_CLIP(turn_a_gundam_movie_02_turn_x_moonlight_butterfly,197)
turn_a_gundam_tv_op_02_t05=turn_a_gundam_movie_02_turn_a_vs_turn_x+TRIM_LAST_CLIP(turn_a_gundam_movie_02_turn_a_appearing,133)+TRIM_MIDDLE_CLIP(turn_a_gundam_movie_02_turn_a_open_hand,197)
turn_a_gundam_tv_op_02_t06=Dissolve(turn_a_gundam_movie_02_turn_a_evade,turn_a_gundam_tv_clean_op_02_03_resized,13)

double_fade_length=12
turn_a_gundam_tv_op_02_temp=turn_a_gundam_tv_op_02_t01+turn_a_gundam_tv_op_02_t02
turn_a_gundam_tv_op_02_temp=DOUBLE_FADE_WITH_BRIGHTNESS_OFFSET(turn_a_gundam_tv_op_02_temp,turn_a_gundam_tv_op_02_t03,double_fade_length,double_fade_length)
turn_a_gundam_tv_op_02_temp=DOUBLE_FADE_WITH_BRIGHTNESS_OFFSET(turn_a_gundam_tv_op_02_temp,turn_a_gundam_tv_op_02_t04,double_fade_length,double_fade_length)
turn_a_gundam_tv_op_02_temp=DOUBLE_FADE_WITH_BRIGHTNESS_OFFSET(turn_a_gundam_tv_op_02_temp,turn_a_gundam_tv_op_02_t05,double_fade_length,double_fade_length)
turn_a_gundam_tv_op_02_temp=DOUBLE_FADE_WITH_BRIGHTNESS_OFFSET(turn_a_gundam_tv_op_02_temp,turn_a_gundam_tv_op_02_t06,double_fade_length,double_fade_length)

turn_a_gundam_tv_op_02_mute=turn_a_gundam_tv_op_02_temp

######## Music ########

bgm_48khz=SSRC(WAVSource("src\turn_a_gundam-tv-op-02-01.wav"),48000)
AudioDub(turn_a_gundam_tv_op_02_mute,bgm_48khz)

######## Subtitle ########

ConvertToRGB32()

SUBTITLE_FX("Century Color//RAY-GUNS|- by fielia@AVISynth",subtitle_x,subtitle_y-subtitle_size,2402,2637,is_title=true)

SUBTITLE_FX("Century Color Million Color",subtitle_x,subtitle_y,25,101)

SUBTITLE_FX("Ô‚¢ Ô‚¢ ‰Ô‚Ñ‚ç‚æ",subtitle_x,subtitle_y,166,243)
SUBTITLE_FX("Â‚¢ Â‚¢ ‰Hª‚É‚È‚ê",subtitle_x,subtitle_y,298,378)
SUBTITLE_FX("‚ ‚È‚½‚Ì–¢—ˆõ‚ß‚Ä—•(‚ ‚¢)‚µ‚Ä|¶‚Ü‚ê•Ï‚í‚Á‚Ä‚ä‚­...",subtitle_x,subtitle_y-subtitle_size,430,636)

SUBTITLE_FX("ŒJ‚è•Ô‚·‹Gß’B‚ª|S‚Æg‘Ì‚ğô‚Á‚Ä‚­‚ê‚é",subtitle_x,subtitle_y-subtitle_size,770,1020)
SUBTITLE_FX("‚ ‚È‚½‚Ì’†‚É‚ ‚éŒû‚ğ‚¢‚½‚í‚è|[‚­–ü‚µ‡‚¢‚È‚ª‚ç",subtitle_x,subtitle_y-subtitle_size,1035,1316)

SUBTITLE_FX("‚Ù‚ñ‚Ì‚¿‚¢‚³‚Èƒcƒ{ƒ~ ‚Ó‚½‚è‚Åˆç‚Ä‚é",subtitle_x,subtitle_y,1335,1474)
SUBTITLE_FX("—•(‚ ‚¢)‚¾‚¯‚Å‚¢‚¢ ‰i‰“(‚¸‚Á)‚Æ...",subtitle_x,subtitle_y,1480,1576)

SUBTITLE_FX("‚»‚µ‚Ä Ô‚¢ Ô‚¢ ‰Ô‚Ñ‚ç‚ª",subtitle_x,subtitle_y,1598,1698)
SUBTITLE_FX("Â‚¢ Â‚¢ ‰Hª‚É‚È‚é",subtitle_x,subtitle_y,1750,1828)
SUBTITLE_FX("‚ ‚È‚½‚Ìè‚Ì‚Ê‚­‚à‚èM‚¶‚Ä|‹ƒ‚¢‚Ä ‹ƒ‚¢‚Ä –²–a‚¢‚Å‚¢‚½",subtitle_x,subtitle_y-subtitle_size,1884,2090)
SUBTITLE_FX("¶‚Ü‚ê•Ï‚í‚ê‚é‚Ü‚Å...",subtitle_x,subtitle_y,2111,2184)

SUBTITLE_FX("‚±‚ñ‚È‘å‚«‚È¢ŠE‚Å –l‚ç‚Ío‰ï‚Á‚½",subtitle_x,subtitle_y,2921,3060)
SUBTITLE_FX("•à‚«‘±‚¯‚é ‚½‚ß‚É...",subtitle_x,subtitle_y,3065,3167)

SUBTITLE_FX("‚¾‚©‚ç Ô‚¢ Ô‚¢ ‰Ô‚Ñ‚ç‚ª",subtitle_x,subtitle_y,3250,3350)
SUBTITLE_FX("Â‚¢ Â‚¢ ‰Hª‚É‚È‚é",subtitle_x,subtitle_y,3402,3479)
SUBTITLE_FX("–¼‚à‚È‚«–¢—ˆ’n}‚ğ’T‚µ‚Ä|‹­‚­ ‹­‚­ –²–a‚¢‚Å‚¢‚½",subtitle_x,subtitle_y-subtitle_size,3535,3745)
SUBTITLE_FX("¶‚Ü‚ê•Ï‚í‚ê‚é‚Ü‚Å...",subtitle_x,subtitle_y,3762,3834)

SUBTITLE_FX("Na Na Na Century Color",subtitle_x,subtitle_y,3865,3992)
SUBTITLE_FX("Na Na Na Million Color",subtitle_x,subtitle_y,3998,4124)
SUBTITLE_FX("Na Na Na Century Color",subtitle_x,subtitle_y,4130,4257)
SUBTITLE_FX("Na Na Na Million Color",subtitle_x,subtitle_y,4262,4384)

SUBTITLE_FX("TURNS!!!",subtitle_x,subtitle_y,4387,4420)



SUBTITLE_FX("[Uh..Century Color]",second_subtitle_x,second_subtitle_y,225,298,is_second_subtitle=true)
SUBTITLE_FX("[Uh..Million Color]",second_subtitle_x,second_subtitle_y,357,430,is_second_subtitle=true)

SUBTITLE_FX("[Uh..Century Color]",second_subtitle_x,second_subtitle_y,1679,1750,is_second_subtitle=true)
SUBTITLE_FX("[Uh..Million Color]",second_subtitle_x,second_subtitle_y,1810,1884,is_second_subtitle=true)

SUBTITLE_FX("[Uh..Century Color]",second_subtitle_x,second_subtitle_y,3330,3402,is_second_subtitle=true)
SUBTITLE_FX("[Uh..Million Color]",second_subtitle_x,second_subtitle_y,3462,3535,is_second_subtitle=true)

######## Post Processing ########

ConvertToYV12()
#ConvertToYUY2()
#ConvertToRGB24()

TCPServer()
