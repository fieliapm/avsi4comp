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



Import("..\..\avsi4comp\avsi4comp.avsi")

######## PV (1280*720) ########

koe_no_katachi_theme_song_pv=SSRC(FFMS2_VIDEO_SOURCE("src\official\映画『聲の形』主題歌PV.720p.mp4"),48000)
koe_no_katachi_long_pv=SSRC(FFMS2_VIDEO_SOURCE("src\official\映画『聲の形』 ロングPV.720p.mp4"),48000)
koe_no_katachi_special_memory_program=SSRC(FFMS2_VIDEO_SOURCE("src\official\映画「聲の形」公開記念特番 ～映画「聲の形」ができるまで～ ロングバージョン.720p.mp4"),48000)
koe_no_katachi_tvcm_02=SSRC(FFMS2_VIDEO_SOURCE("src\official\映画『聲の形』 TVCM 2.720p.mp4"),48000)
koe_no_katachi_tvcm_01=SSRC(FFMS2_VIDEO_SOURCE("src\official\映画『聲の形』 TVCM 1.720p.mp4"),48000)
koe_no_katachi_trailer=SSRC(FFMS2_VIDEO_SOURCE("src\official\映画『聲の形』 本予告.720p.mp4"),48000)
koe_no_katachi_news=SSRC(FFMS2_VIDEO_SOURCE("src\official\映画『聲の形』 特報.720p.mp4"),48000)

koe_no_katachi_special_memory_program_find_notebook=Trim(koe_no_katachi_special_memory_program,34494,37810)
koe_no_katachi_special_memory_program_find_notebook=AssumeFPS(SelectEvery(koe_no_katachi_special_memory_program_find_notebook,5,0,2,3,4),24000,1001)

######## Trim ########

koe_no_katachi_theme_song_pv_01=Trim(koe_no_katachi_theme_song_pv,0,693)
koe_no_katachi_theme_song_pv_02=Trim(koe_no_katachi_theme_song_pv,694,1751)
koe_no_katachi_theme_song_pv_03_01=Trim(koe_no_katachi_theme_song_pv,1752,1997) #246
koe_no_katachi_theme_song_pv_03_02=Trim(koe_no_katachi_theme_song_pv,1998,2063) #66
koe_no_katachi_theme_song_pv_04_flower=Trim(koe_no_katachi_theme_song_pv,2064,2119)
koe_no_katachi_theme_song_pv_05=Trim(koe_no_katachi_theme_song_pv,2120,2249)
koe_no_katachi_theme_song_pv_06_fish=Trim(koe_no_katachi_theme_song_pv,2250,2286)
koe_no_katachi_theme_song_pv_07=Trim(koe_no_katachi_theme_song_pv,2287,2571)
koe_no_katachi_theme_song_pv_08_train=Trim(koe_no_katachi_theme_song_pv,2572,2620)
koe_no_katachi_theme_song_pv_09=Trim(koe_no_katachi_theme_song_pv,2621,2921)
koe_no_katachi_theme_song_pv_10=Trim(koe_no_katachi_theme_song_pv,2922,3179)
koe_no_katachi_theme_song_pv_11_01=Trim(koe_no_katachi_theme_song_pv,3180,3216) #37
koe_no_katachi_theme_song_pv_11_02=Trim(koe_no_katachi_theme_song_pv,3217,3288) #72
koe_no_katachi_theme_song_pv_12_promise=Trim(koe_no_katachi_theme_song_pv,3289,3382) #94
koe_no_katachi_theme_song_pv_13_title=Trim(koe_no_katachi_theme_song_pv,3383,3466)
#koe_no_katachi_theme_song_pv_14_post=Trim(koe_no_katachi_theme_song_pv,3467,0)

#koe_no_katachi_long_pv_pre=Trim(koe_no_katachi_long_pv,0,23)
koe_no_katachi_long_pv_shouya_talk_to_shouko_01=Trim(koe_no_katachi_long_pv,24,170) #147
#koe_no_katachi_long_pv_shouya_talk_to_shouko_02=Trim(koe_no_katachi_long_pv,171,285) #115
koe_no_katachi_long_pv_naoka_laugh=Trim(koe_no_katachi_long_pv,472,519) #48
koe_no_katachi_long_pv_shouko_introduce_self=Trim(koe_no_katachi_long_pv,568,655) #88
koe_no_katachi_long_pv_shouya_tease_shouko=Trim(koe_no_katachi_long_pv,656,725) #70
koe_no_katachi_long_pv_shouko_singing=Trim(koe_no_katachi_long_pv,726,763) #38
koe_no_katachi_long_pv_school=Trim(koe_no_katachi_long_pv,764,788) #25
koe_no_katachi_long_pv_shouko_read_book=Trim(koe_no_katachi_long_pv,789,816) #28
koe_no_katachi_long_pv_shouko_want_to_be_shouya_s_friend=Trim(koe_no_katachi_long_pv,817,904) #88
koe_no_katachi_long_pv_slogan_hate=Trim(koe_no_katachi_long_pv,905,947) #43
koe_no_katachi_long_pv_shouya_cover_ears=Trim(koe_no_katachi_long_pv,948,1056) #109
koe_no_katachi_long_pv_slogan_until_meet_again=Trim(koe_no_katachi_long_pv,1057,1100) #44
koe_no_katachi_long_pv_shouko_throw_piece_of_bread=Trim(koe_no_katachi_long_pv,1101,1215) #115
koe_no_katachi_long_pv_slogan_every_time_meet=Trim(koe_no_katachi_long_pv,1216,1241) #26
koe_no_katachi_long_pv_shouko_tell_to_shouya=Trim(koe_no_katachi_long_pv,1242,1286) #45
koe_no_katachi_long_pv_slogan_become_dear=Trim(koe_no_katachi_long_pv,1287,1317) #31
koe_no_katachi_long_pv_tomohiro_greet_shouko=Trim(koe_no_katachi_long_pv,1318,1365) #48
koe_no_katachi_long_pv_slogan_your_voice=Trim(koe_no_katachi_long_pv,1366,1399) #34
koe_no_katachi_long_pv_ponytail=Trim(koe_no_katachi_long_pv,1400,1683) #284
koe_no_katachi_long_pv_slogan_want_to_tell_you=Trim(koe_no_katachi_long_pv,1684,1726) #43
koe_no_katachi_long_pv_shouko_confess_her_love_to_shouya=Trim(koe_no_katachi_long_pv,1727,2045) #319
koe_no_katachi_long_pv_shouko_and_shouya_on_train_01=Trim(koe_no_katachi_long_pv,2046,2124) #79
#koe_no_katachi_long_pv_shouko_and_shouya_on_train_02=Trim(koe_no_katachi_long_pv,2125,2156) #32
koe_no_katachi_long_pv_shouko_happily_jump_to_bed=Trim(koe_no_katachi_long_pv,2157,2289) #133 ed
koe_no_katachi_long_pv_cast=Trim(koe_no_katachi_long_pv,2347,2663) #317 ed
koe_no_katachi_long_pv_shouya_carry_bicycle=Trim(koe_no_katachi_long_pv,2664,2762) #99
koe_no_katachi_long_pv_slogan_that_feeling=Trim(koe_no_katachi_long_pv,2921,2956) #36
koe_no_katachi_long_pv_shouko_run_01=Trim(koe_no_katachi_long_pv,2957,2979) #23
#koe_no_katachi_long_pv_shouko_run_02=Trim(koe_no_katachi_long_pv,2980,3011) #32
koe_no_katachi_long_pv_slogan_can_be_transmitted=Trim(koe_no_katachi_long_pv,3012,3047) #36
koe_no_katachi_long_pv_shouko_cry_on_bridge=Trim(koe_no_katachi_long_pv,3048,3100) #53
koe_no_katachi_long_pv_shouko_show_word_thanks=Trim(koe_no_katachi_long_pv,3101,3124) #24
koe_no_katachi_long_pv_palm_against_palm=Trim(koe_no_katachi_long_pv,3203,3231) #29
#koe_no_katachi_long_pv_shouya_see_shouko_in_tears=Trim(koe_no_katachi_long_pv,3232,3280) #49
#koe_no_katachi_long_pv_shouko_open_notebook=Trim(koe_no_katachi_long_pv,3281,3332) #52
koe_no_katachi_long_pv_shouko_moe=Trim(koe_no_katachi_long_pv,3333,3395) #63
koe_no_katachi_long_pv_shouya_cry=Trim(koe_no_katachi_long_pv,3396,3454) #59
#koe_no_katachi_long_pv_title=Trim(koe_no_katachi_long_pv,3455,3533)
#koe_no_katachi_long_pv_post=Trim(koe_no_katachi_long_pv,3534,0)

koe_no_katachi_special_memory_program_find_notebook_turn_back_01=Trim(koe_no_katachi_special_memory_program_find_notebook,288,357) #70
koe_no_katachi_special_memory_program_find_notebook_turn_back_02=Trim(koe_no_katachi_special_memory_program_find_notebook,358,403) #46
koe_no_katachi_special_memory_program_find_notebook_show_notebook=Trim(koe_no_katachi_special_memory_program_find_notebook,404,575) #172
#koe_no_katachi_special_memory_program_find_notebook_open_notebook=Trim(koe_no_katachi_special_memory_program_find_notebook,576,646) #71
koe_no_katachi_special_memory_program_find_notebook_shouya_rob_book=Trim(koe_no_katachi_special_memory_program_find_notebook,647,914) #268
#koe_no_katachi_special_memory_program_find_notebook_shouko_jump_into_river=Trim(koe_no_katachi_special_memory_program_find_notebook,915,1202) #288
koe_no_katachi_special_memory_program_find_notebook_find_book_in_river=Trim(koe_no_katachi_special_memory_program_find_notebook,1203,2020) #818
#koe_no_katachi_special_memory_program_find_notebook_shouya_scream_to_shouko=Trim(koe_no_katachi_special_memory_program_find_notebook,2021,2169) #149
koe_no_katachi_special_memory_program_find_notebook_shouko_thanks_to_shouya_01=Trim(koe_no_katachi_special_memory_program_find_notebook,2170,2623) #454
#koe_no_katachi_special_memory_program_find_notebook_shouko_thanks_to_shouya_02=Trim(koe_no_katachi_special_memory_program_find_notebook,2624,0) #29

koe_no_katachi_tvcm_02_shouko_nervous=Trim(koe_no_katachi_tvcm_02,88,113) #26
#koe_no_katachi_tvcm_02_shouya_and_shouko_walking=Trim(koe_no_katachi_tvcm_02,196,221) #26
koe_no_katachi_tvcm_02_shouko_cry=Trim(koe_no_katachi_tvcm_02,263,293) #31

koe_no_katachi_tvcm_01_shouya_catch_shouko=Trim(koe_no_katachi_tvcm_01,99,137) #39
koe_no_katachi_tvcm_01_shouko_suicide=Trim(koe_no_katachi_tvcm_01,237,255) #19
koe_no_katachi_tvcm_01_shouya_prevent_shouko_from_falling=Trim(koe_no_katachi_tvcm_01,256,298) #43

koe_no_katachi_trailer_shouko_catch_hand=Trim(koe_no_katachi_trailer,100,135) #36
koe_no_katachi_trailer_naoka_watch_shouya=Trim(koe_no_katachi_trailer,361,380) #20
koe_no_katachi_trailer_shouya_fall=Trim(koe_no_katachi_trailer,469,538) #70
koe_no_katachi_trailer_shouya_awake=Trim(koe_no_katachi_trailer,903,939) #37
koe_no_katachi_trailer_shouko_smile=Trim(koe_no_katachi_trailer,985,1047) #63
koe_no_katachi_trailer_shouko_take_notebook=Trim(koe_no_katachi_trailer,1128,1161) #34 ed
koe_no_katachi_trailer_shouya_see_shouko_suicide_01=Trim(koe_no_katachi_trailer,1241,1262) #22
#koe_no_katachi_trailer_shouya_see_shouko_suicide_02=Trim(koe_no_katachi_trailer,1263,1331) #69

koe_no_katachi_news_slogan_she_is_as_needle_which_hurt_self=Trim(koe_no_katachi_news,184,244) #61 ed
koe_no_katachi_news_jump_into_water=Trim(koe_no_katachi_news,245,323) #79 ed
koe_no_katachi_news_hand_catch_hand=Trim(koe_no_katachi_news,458,481) #24
koe_no_katachi_news_slogan_want_to_see_you_again=Trim(koe_no_katachi_news,482,518) #37 ed
koe_no_katachi_news_shouko_in_tears=Trim(koe_no_katachi_news,519,575) #57 ed

######## Pre Combine ########

fade_length=18

koe_no_katachi_long_pv_shouko_happily_jump_to_bed_last_frame=Framecount(koe_no_katachi_long_pv_shouko_happily_jump_to_bed)-1
koe_no_katachi_long_pv_shouko_happily_jump_to_bed_extend=Loop(koe_no_katachi_long_pv_shouko_happily_jump_to_bed,138-koe_no_katachi_long_pv_shouko_happily_jump_to_bed_last_frame,koe_no_katachi_long_pv_shouko_happily_jump_to_bed_last_frame,koe_no_katachi_long_pv_shouko_happily_jump_to_bed_last_frame)

koe_no_katachi_long_pv_cast_last_frame=Framecount(koe_no_katachi_long_pv_cast)-1
koe_no_katachi_long_pv_cast_extend=Loop(koe_no_katachi_long_pv_cast,(37+72+94+120)-koe_no_katachi_long_pv_cast_last_frame,koe_no_katachi_long_pv_cast_last_frame,koe_no_katachi_long_pv_cast_last_frame)

long_pv_combine_01=koe_no_katachi_long_pv_shouko_introduce_self \
	+koe_no_katachi_long_pv_shouya_tease_shouko \
	+koe_no_katachi_long_pv_shouko_singing \
	+koe_no_katachi_long_pv_shouko_want_to_be_shouya_s_friend \
	+koe_no_katachi_long_pv_school \
	+koe_no_katachi_long_pv_shouko_read_book \
	+koe_no_katachi_long_pv_shouya_talk_to_shouko_01 \
	+koe_no_katachi_long_pv_naoka_laugh \
	+koe_no_katachi_long_pv_slogan_hate \
	+koe_no_katachi_long_pv_shouya_cover_ears \
	+koe_no_katachi_long_pv_slogan_until_meet_again \
	+koe_no_katachi_long_pv_shouko_throw_piece_of_bread \
	+koe_no_katachi_long_pv_slogan_every_time_meet \
	+koe_no_katachi_long_pv_shouko_tell_to_shouya \
	+koe_no_katachi_long_pv_slogan_become_dear \
	+koe_no_katachi_long_pv_tomohiro_greet_shouko \
	+koe_no_katachi_long_pv_slogan_your_voice \
	+koe_no_katachi_long_pv_ponytail \
	+koe_no_katachi_long_pv_slogan_want_to_tell_you \
	+koe_no_katachi_long_pv_shouko_confess_her_love_to_shouya \
	+koe_no_katachi_long_pv_shouko_and_shouya_on_train_01

long_pv_combine_02=koe_no_katachi_long_pv_shouya_carry_bicycle \
	+koe_no_katachi_long_pv_slogan_that_feeling \
	+koe_no_katachi_long_pv_shouko_run_01 \
	+koe_no_katachi_long_pv_slogan_can_be_transmitted \
	+koe_no_katachi_long_pv_shouko_cry_on_bridge \
	+koe_no_katachi_long_pv_shouko_show_word_thanks \
	+koe_no_katachi_long_pv_palm_against_palm \
	+koe_no_katachi_news_shouko_in_tears \
	+koe_no_katachi_trailer_shouko_take_notebook \
	+koe_no_katachi_long_pv_shouko_moe \
	+koe_no_katachi_long_pv_shouya_cry

koe_no_katachi_special_memory_program_find_notebook_combine=koe_no_katachi_special_memory_program_find_notebook_show_notebook \
	+koe_no_katachi_special_memory_program_find_notebook_shouya_rob_book \
	+koe_no_katachi_special_memory_program_find_notebook_find_book_in_river \
	+koe_no_katachi_special_memory_program_find_notebook_shouko_thanks_to_shouya_01

other_combine=koe_no_katachi_tvcm_01_shouya_catch_shouko \
	+koe_no_katachi_tvcm_02_shouko_cry \
	+koe_no_katachi_trailer_shouko_catch_hand \
	+koe_no_katachi_trailer_shouya_awake \
	+koe_no_katachi_trailer_shouya_fall \
	+koe_no_katachi_trailer_shouya_see_shouko_suicide_01 \
	+koe_no_katachi_tvcm_02_shouko_nervous \
	+koe_no_katachi_trailer_naoka_watch_shouya \
	+koe_no_katachi_trailer_shouko_smile \
	+koe_no_katachi_tvcm_01_shouko_suicide \
	+koe_no_katachi_tvcm_01_shouya_prevent_shouko_from_falling \
	+koe_no_katachi_news_hand_catch_hand

######## Combine ########

# koe_no_katachi_theme_song_pv_01        0
# koe_no_katachi_theme_song_pv_02        3150 (764)
# koe_no_katachi_theme_song_pv_03
# koe_no_katachi_theme_song_pv_04_flower 4520
# koe_no_katachi_theme_song_pv_05
# koe_no_katachi_theme_song_pv_06_fish   4706
# koe_no_katachi_theme_song_pv_07
# koe_no_katachi_theme_song_pv_08_train  5028
# koe_no_katachi_theme_song_pv_09
# koe_no_katachi_theme_song_pv_10
# koe_no_katachi_theme_song_pv_11
# koe_no_katachi_theme_song_pv_12_promise
# koe_no_katachi_theme_song_pv_13_title  8347



koe_no_katachi_theme_song_t01=koe_no_katachi_theme_song_pv_01+FADE_OUT_WITH_BRIGHTNESS_OFFSET(TRIM_FIRST_CLIP(koe_no_katachi_news_jump_into_water,70),fade_length)

#koe_no_katachi_theme_song_t02=BlankClip(koe_no_katachi_theme_song_pv,length=1058,color=color_white)+BlankClip(koe_no_katachi_theme_song_pv,length=66,color=color_blue)
#koe_no_katachi_theme_song_t03=BlankClip(koe_no_katachi_theme_song_pv,length=281,color=color_black)+BlankClip(koe_no_katachi_theme_song_pv,length=281,color=color_white)
#koe_no_katachi_theme_song_t04=BlankClip(koe_no_katachi_theme_song_pv,length=281,color=color_black)+BlankClip(koe_no_katachi_theme_song_pv,length=281,color=color_white)
koe_no_katachi_theme_song_t02_t03_t04=FADE_OUT_WITH_BRIGHTNESS_OFFSET(TRIM_FIRST_CLIP(long_pv_combine_01+long_pv_combine_02,1058+66+281+281+281+281),fade_length)

koe_no_katachi_theme_song_t05=FadeOut(TRIM_FIRST_CLIP(koe_no_katachi_long_pv_shouko_happily_jump_to_bed_extend,138-1),fade_length)

koe_no_katachi_theme_song_t06=koe_no_katachi_theme_song_pv_02
koe_no_katachi_theme_song_t07=koe_no_katachi_theme_song_pv_03_01+koe_no_katachi_theme_song_pv_03_02+koe_no_katachi_theme_song_pv_04_flower+koe_no_katachi_theme_song_pv_05+koe_no_katachi_theme_song_pv_06_fish
koe_no_katachi_theme_song_t08=koe_no_katachi_theme_song_pv_07+koe_no_katachi_theme_song_pv_08_train+koe_no_katachi_theme_song_pv_09

koe_no_katachi_theme_song_t09=koe_no_katachi_theme_song_pv_10+FADE_OUT_WITH_BRIGHTNESS_OFFSET(TRIM_FIRST_CLIP(koe_no_katachi_long_pv_cast_extend,37+72+94+120),fade_length)
#koe_no_katachi_theme_song_t10=BlankClip(koe_no_katachi_theme_song_pv,length=281,color=color_black)+BlankClip(koe_no_katachi_theme_song_pv,length=280,color=color_white)

#koe_no_katachi_theme_song_t11=BlankClip(koe_no_katachi_theme_song_pv,length=281,color=color_black)+BlankClip(koe_no_katachi_theme_song_pv,length=280,color=color_white)
#koe_no_katachi_theme_song_t12=BlankClip(koe_no_katachi_theme_song_pv,length=281,color=color_black)+BlankClip(koe_no_katachi_theme_song_pv,length=281,color=color_white)
koe_no_katachi_theme_song_t10_t11_t12=FADE_OUT_WITH_BRIGHTNESS_OFFSET(TRIM_FIRST_CLIP(koe_no_katachi_special_memory_program_find_notebook_combine,281+280+281+280+281+281),fade_length)

koe_no_katachi_theme_song_t13=TRIM_FIRST_CLIP(other_combine,421)
koe_no_katachi_theme_song_t14=TRIM_FIRST_CLIP(koe_no_katachi_news_slogan_she_is_as_needle_which_hurt_self,50)+koe_no_katachi_theme_song_pv_11_02+TRIM_FIRST_CLIP(koe_no_katachi_news_slogan_want_to_see_you_again,30)+koe_no_katachi_theme_song_pv_12_promise+koe_no_katachi_theme_song_pv_11_01+koe_no_katachi_theme_song_pv_13_title+BlankClip(koe_no_katachi_theme_song_pv,length=24*11,color=color_black)



koe_no_katachi_theme_song_mute=koe_no_katachi_theme_song_t01 \
	+koe_no_katachi_theme_song_t02_t03_t04 \
	+koe_no_katachi_theme_song_t05 \
	+koe_no_katachi_theme_song_t06+koe_no_katachi_theme_song_t07+koe_no_katachi_theme_song_t08 \
	+koe_no_katachi_theme_song_t09 \
	+koe_no_katachi_theme_song_t10_t11_t12 \
	+koe_no_katachi_theme_song_t13+koe_no_katachi_theme_song_t14

######## Music ########

bgm_48khz=SSRC(WAVSource("src\aiko-2016_09_21-koi_wo_shita_no_wa-01.wav"),48000)
AudioDub(koe_no_katachi_theme_song_mute,bgm_48khz)



thumbnail=Trim(4586,-24*5)

######## Subtitle ########

global subtitle_clip_width=1920
global subtitle_clip_height=1080

subtitle_x=50*2.25
subtitle_y=395*2.25
global subtitle_front_fade_count=12
global subtitle_rear_fade_count=12
global subtitle_font="MS Gothic"
global subtitle_effects="b"
global subtitle_size=32*2.25
global subtitle_text_color=color_white
global subtitle_halo_color=color_black

function SUBTITLE_FX(clip clip,string text,float x,float y,int start_frame,int end_frame,bool "is_furigana",bool "is_denormal_kasi",bool "is_title"){
	is_title=Default(is_title,false)
	is_denormal_kasi=Default(is_denormal_kasi,false)
	is_furigana=Default(is_furigana,false)

	text_color=is_denormal_kasi?OVERWRITE_SUBTITLE_COLOR_ALPHA(color_pink,$80):subtitle_text_color
	halo_color=is_denormal_kasi?color_black:subtitle_halo_color
	text_color=is_title?OVERWRITE_SUBTITLE_COLOR_ALPHA(color_black,$C0):text_color
	halo_color=is_title?color_pink:halo_color

	subtitle_mode=is_furigana?"ex":"ex_thick_reduce_memory"
	size=is_furigana?subtitle_size*0.5:subtitle_size
	y=is_furigana?y-size:y
	front_fade_count=is_title?238-214:subtitle_front_fade_count
	rear_fade_count=is_title?1:subtitle_rear_fade_count

	return SUBTITLE_FX_FADE_IN_FADE_OUT(clip,text,Round(x),Round(y),start_frame,end_frame,front_fade_count,rear_fade_count,subtitle_font,subtitle_effects,Round(size),text_color,halo_color,subtitle_mode)
}

ConvertToRGB32()

SUBTITLE_FX("あーーーー",subtitle_x,subtitle_y-subtitle_size*2,24,86,is_denormal_kasi=true)
SUBTITLE_FX("こい",subtitle_x,subtitle_y,100,252,true,is_denormal_kasi=true)
SUBTITLE_FX("恋をしたのは",subtitle_x,subtitle_y,100,252,is_denormal_kasi=true)

SUBTITLE_FX("aiko//恋をしたのは|- by fielia@AVISynth",-subtitle_x,subtitle_y-subtitle_size,238,274,is_title=true)

SUBTITLE_FX("いま ふ             あめ    とお         は",subtitle_x,subtitle_y,756,920,true)
SUBTITLE_FX("今降るこの雨　遠くは晴れている",subtitle_x,subtitle_y,756,920)
SUBTITLE_FX("                         あ",subtitle_x,subtitle_y-subtitle_size*2,927,1040,true)
SUBTITLE_FX("だからすぐに逢えるね",subtitle_x,subtitle_y-subtitle_size*2,927,1040)
SUBTITLE_FX(" や         かわ                    ほし     ふ                     ねが",subtitle_x,subtitle_y,1041,1295,true)
SUBTITLE_FX("止めば乾いてそして星が降るから　お願い",subtitle_x,subtitle_y,1041,1295)

SUBTITLE_FX("いちまいいちまい ふ         いろ    ちが    しゃしん            よう",subtitle_x,subtitle_y-subtitle_size*2,1296,1872,true)
SUBTITLE_FX("一枚一枚増える色の違う写真めくる様に",subtitle_x,subtitle_y-subtitle_size*2,1296,1872)

SUBTITLE_FX("つた                    こと    いま   むかし               おな",subtitle_x,subtitle_y,1882,2403,true)
SUBTITLE_FX("伝えたかった事は今も昔もずっと同じままだよ",subtitle_x,subtitle_y,1882,2403)
SUBTITLE_FX("Darling",subtitle_x,subtitle_y-subtitle_size*2,2409,2447)
SUBTITLE_FX("まよ                ある                                               みちしるべ",subtitle_x,subtitle_x+subtitle_size,2442,3018,true)
SUBTITLE_FX("迷わぬよう歩いていけるたったひとつの道標",subtitle_x,subtitle_x+subtitle_size,2442,3018)

SUBTITLE_FX("        まえ む",subtitle_x,subtitle_y,3145,3298,true)
SUBTITLE_FX("ねぇ前向いて　あたしはここにいるでしょ？",subtitle_x,subtitle_y,3145,3298)
SUBTITLE_FX("                     な",subtitle_x,subtitle_y-subtitle_size*2,3313,3425,true)
SUBTITLE_FX("だからもう泣かないで",subtitle_x,subtitle_y-subtitle_size*2,3313,3425)
SUBTITLE_FX("こころ    わ         とき    とくべつ     ひ  び",subtitle_x-subtitle_size*0.5*0.5,subtitle_y,3427,3682,true)
SUBTITLE_FX("心が割れた時も特別な日々をくれた",subtitle_x,subtitle_y,3427,3682)

SUBTITLE_FX(" さ さい     か     ちが        あかいろ             ひ     ろう か     しろいろ",subtitle_x,subtitle_y-subtitle_size*2,3682,4260,true)
SUBTITLE_FX("些細に掛け違えた赤色　あの日の廊下の白色",subtitle_x,subtitle_y-subtitle_size*2,3682,4260)

SUBTITLE_FX("はじ            さい ご     いま     ま     はな            きざ    おく",subtitle_x,subtitle_y,4268,4789,true)
SUBTITLE_FX("初めても最後も今も舞う花びらに刻み送るよ",subtitle_x,subtitle_y,4268,4789)
SUBTITLE_FX("Darling",subtitle_x,subtitle_y-subtitle_size*2,4795,4835)
SUBTITLE_FX(" お         あめ    うつ     ふたり      せ かい    だれ     し",subtitle_x,subtitle_y,4831,5372,true)
SUBTITLE_FX("落ちる雨に映る二人　世界は誰も知らない",subtitle_x,subtitle_y,4831,5372)

SUBTITLE_FX("あーーーー",subtitle_x,subtitle_y-subtitle_size*2,5375,5440,is_denormal_kasi=true)
SUBTITLE_FX("こい                                         な                 なん ど  め",subtitle_x,subtitle_y,5444,5661,true)
SUBTITLE_FX("恋をしたのはいつからか泣いたのは何度目か",subtitle_x,subtitle_y,5444,5661)
SUBTITLE_FX("かぞ            よる     あ                 こま",subtitle_x,subtitle_x+subtitle_size,5663,5911,true)
SUBTITLE_FX("数えると夜が明けるわ　困るな...",subtitle_x,subtitle_x+subtitle_size,5663,5911)
SUBTITLE_FX("Darling",subtitle_x,subtitle_y,5918,6022,is_denormal_kasi=true)

SUBTITLE_FX("つた                    こと    いま   むかし               おな",subtitle_x,subtitle_y,6513,7036,true)
SUBTITLE_FX("伝えたかった事は今も昔もずっと同じままだよ",subtitle_x,subtitle_y,6513,7036)
SUBTITLE_FX("Darling",subtitle_x,subtitle_y-subtitle_size*2,7041,7080)
SUBTITLE_FX("まよ                ある                                               みちしるべ",subtitle_x,subtitle_y,7075,7655,true)
SUBTITLE_FX("迷わぬよう歩いていけるたったひとつの道標",subtitle_x,subtitle_y,7075,7655)



#thumbnail

######## Post Processing ########

ConvertToYV12()
#ConvertToYUY2()
#ConvertToRGB24()

TCPServer()
