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

turn_a_gundam_tv_clean_ed_01=FFMS2_VIDEO_SOURCE("src\turn_a_gundam-tv\special\turn_a_gundam-tv-ed-01.wmv",fpsnum=fpsnum,fpsden=fpsden)

#turn_a_gundam_tv_clean_ed_01_title=Trim(turn_a_gundam_tv_clean_ed_01,0,71)
turn_a_gundam_tv_clean_ed_01_part01=Trim(turn_a_gundam_tv_clean_ed_01,72,973)
turn_a_gundam_tv_clean_ed_01_part02=Trim(turn_a_gundam_tv_clean_ed_01,974,0)

turn_a_gundam_tv_21_cache01=FFMS2_VIDEO_SOURCE("src\turn_a_gundam-tv\turn_a_gundam-tv-21.wmv",fpsnum=fpsnum,fpsden=fpsden)
turn_a_gundam_tv_21_cache02=FFMS2_VIDEO_SOURCE("src\turn_a_gundam-tv\turn_a_gundam-tv-21.wmv",fpsnum=fpsnum,fpsden=fpsden)

turn_a_gundam_tv_21_turn_a_washer_part01=Trim(turn_a_gundam_tv_21_cache01,29206,29498)
turn_a_gundam_tv_21_turn_a_washer_part02=Trim(turn_a_gundam_tv_21_cache01,29499,29548)
turn_a_gundam_tv_21_turn_a_washer_part03=Trim(turn_a_gundam_tv_21_cache01,29549,29811)
turn_a_gundam_tv_21_turn_a_washer_part04=Trim(turn_a_gundam_tv_21_cache02,29812,29878)
turn_a_gundam_tv_21_turn_a_washer_part05=Trim(turn_a_gundam_tv_21_cache01,29879,29967)
turn_a_gundam_tv_21_turn_a_washer_part06=Trim(turn_a_gundam_tv_21_cache01,29968,30134)
turn_a_gundam_tv_21_turn_a_washer_part07=Trim(turn_a_gundam_tv_21_cache01,30290,30395)
turn_a_gundam_tv_21_turn_a_washer_part08=Trim(turn_a_gundam_tv_21_cache01,30503,30621)

######## BD (1080P) ########

turn_a_gundam_movie_01_cache01=FFMS2_VIDEO_SOURCE("src\turn_a_gundam-movie\bd-aac_2ch\turn_a_gundam-movie-bd-aac_2ch-01.mp4")
turn_a_gundam_movie_01_cache02=FFMS2_VIDEO_SOURCE("src\turn_a_gundam-movie\bd-aac_2ch\turn_a_gundam-movie-bd-aac_2ch-01.mp4")

turn_a_gundam_movie_01_space=Trim(turn_a_gundam_movie_01_cache01,542,1068)
turn_a_gundam_movie_01_loran_in_space=Trim(turn_a_gundam_movie_01_cache01,1069,1359)
turn_a_gundam_movie_01_to_earth=Trim(turn_a_gundam_movie_01_cache02,1685,2109)
turn_a_gundam_movie_01_sochie_play_loran_and_kihel_return_item=Trim(turn_a_gundam_movie_01_cache01,4281,4584)
turn_a_gundam_movie_01_sochie_and_loran_in_festival=Trim(turn_a_gundam_movie_01_cache01,4721,5005)
turn_a_gundam_movie_01_loran_drive_to_airport=Trim(turn_a_gundam_movie_01_cache01,6073,6586)

turn_a_gundam_movie_01_sochie_run_01=Trim(turn_a_gundam_movie_01_cache01,8067,8282)
turn_a_gundam_movie_01_sochie_run_02=Trim(turn_a_gundam_movie_01_cache01,8692,8780)

turn_a_gundam_movie_01_guin_and_loran_handshake=Trim(turn_a_gundam_movie_01_cache01,16081,16403)
turn_a_gundam_movie_01_loran_festival=Trim(turn_a_gundam_movie_01_cache01,18133,18269)
turn_a_gundam_movie_01_sochie_and_loran_adult=Trim(turn_a_gundam_movie_01_cache01,19686,20343)
turn_a_gundam_movie_01_sochie_slap_loran=Trim(turn_a_gundam_movie_01_cache01,33675,33885)
turn_a_gundam_movie_01_keith_talk_with_loran=Trim(turn_a_gundam_movie_01_cache01,37331,38293)
turn_a_gundam_movie_01_loran_ride_bicycle=Trim(turn_a_gundam_movie_01_cache01,41255,41349)
turn_a_gundam_movie_01_kihel_talk_with_loran=Trim(turn_a_gundam_movie_01_cache01,46281,46537)
turn_a_gundam_movie_01_joseph_drive=Trim(turn_a_gundam_movie_01_cache01,51273,51740)
turn_a_gundam_movie_01_kihel_stand=Trim(turn_a_gundam_movie_01_cache01,54995,55323)
turn_a_gundam_movie_01_dianna_appear=Trim(turn_a_gundam_movie_01_cache01,58901,59168)
turn_a_gundam_movie_01_lily=Trim(turn_a_gundam_movie_01_cache01,133961,134205)
turn_a_gundam_movie_01_gavane_and_sochie=Trim(turn_a_gundam_movie_01_cache01,144778,144971)

turn_a_gundam_movie_01_harry_01=Trim(turn_a_gundam_movie_01_cache01,147166,147434)
#turn_a_gundam_movie_01_harry_02=Trim(turn_a_gundam_movie_01_cache01,147761,147837)
#turn_a_gundam_movie_01_harry_03=Trim(turn_a_gundam_movie_01_cache01,148101,148196)
turn_a_gundam_movie_01_harry_04=Trim(turn_a_gundam_movie_01_cache01,148374,148457)

######## Pre Combine (480P) ########

sekai_meisaku_gekijou=SEKAI_MEISAKU_GEKIJOU_CLIP(turn_a_gundam_tv_clean_ed_01_part01,48)



turn_a_gundam_tv_clean_ed_01=turn_a_gundam_tv_clean_ed_01_part01+turn_a_gundam_tv_clean_ed_01_part02

mask_base=BlankClip(turn_a_gundam_tv_clean_ed_01,color=color_black)
mask_with_var=ScriptClip(mask_base,"Overlay(BlankClip(turn_a_gundam_tv_clean_ed_01_part01,width=32,height=32,color=color_white),x=mask_x,y=mask_y,opacity=mask_opacity)")
mask_with_var=FrameEvaluate(mask_with_var,"mask_x=Round(Spline(current_frame,0,280,1031,280,1085,320,1157,320,1205,280,1313,280,1361,320,1469,320,1505,360,Framecount()-1,360,cubic=false))")
mask_with_var=FrameEvaluate(mask_with_var,"mask_y=Round(Spline(current_frame,0,165,1031,165,1085,150,1157,150,1205,165,1313,165,1361,150,Framecount()-1,150,cubic=false))")
mask=FrameEvaluate(mask_with_var,"mask_opacity=current_frame>=1031?1.0:0.0")

turn_a_gundam_tv_clean_ed_01_mosaic=MOSAIC_MASK(turn_a_gundam_tv_clean_ed_01,mask,8.0)



turn_a_gundam_tv_21_turn_a_washer_clip_length=68
turn_a_gundam_tv_21_turn_a_washer=TRIM_LAST_CLIP(turn_a_gundam_tv_21_turn_a_washer_part01,turn_a_gundam_tv_21_turn_a_washer_clip_length*2)+TRIM_LAST_CLIP(turn_a_gundam_tv_21_turn_a_washer_part03,turn_a_gundam_tv_21_turn_a_washer_clip_length)+TRIM_MIDDLE_CLIP(Dissolve(turn_a_gundam_tv_21_turn_a_washer_part02,turn_a_gundam_tv_21_turn_a_washer_part04,24),turn_a_gundam_tv_21_turn_a_washer_clip_length) \
	+TRIM_MIDDLE_CLIP(turn_a_gundam_tv_21_turn_a_washer_part05,turn_a_gundam_tv_21_turn_a_washer_clip_length)+TRIM_MIDDLE_CLIP(turn_a_gundam_tv_21_turn_a_washer_part06,turn_a_gundam_tv_21_turn_a_washer_clip_length)+TRIM_MIDDLE_CLIP(turn_a_gundam_tv_21_turn_a_washer_part07,turn_a_gundam_tv_21_turn_a_washer_clip_length)+TRIM_MIDDLE_CLIP(turn_a_gundam_tv_21_turn_a_washer_part08,48)

######## Pre Combine (1080P) ########

turn_a_gundam_movie_01_sochie_run=turn_a_gundam_movie_01_sochie_run_01+turn_a_gundam_movie_01_sochie_run_02

turn_a_gundam_movie_01_guin_and_loran_handshake_last_frame=Framecount(turn_a_gundam_movie_01_guin_and_loran_handshake)-1
turn_a_gundam_movie_01_guin_and_loran_handshake_extend=Loop(turn_a_gundam_movie_01_guin_and_loran_handshake,100,turn_a_gundam_movie_01_guin_and_loran_handshake_last_frame,turn_a_gundam_movie_01_guin_and_loran_handshake_last_frame)

turn_a_gundam_movie_01_loran=turn_a_gundam_movie_01_loran_ride_bicycle+turn_a_gundam_movie_01_loran_festival
turn_a_gundam_movie_01_harry=turn_a_gundam_movie_01_harry_01+turn_a_gundam_movie_01_harry_04

######## Combine ########

dissolve_length=24
turn_a_gundam_tv_ed_01_t01=Dissolve(TRIM_LAST_CLIP(turn_a_gundam_movie_01_space,167)+TRIM_MIDDLE_CLIP(turn_a_gundam_movie_01_loran_in_space,138+dissolve_length),TRIM_MIDDLE_CLIP(turn_a_gundam_movie_01_to_earth,259+dissolve_length),dissolve_length)
turn_a_gundam_tv_ed_01_t02=TRIM_MIDDLE_CLIP(turn_a_gundam_movie_01_sochie_play_loran_and_kihel_return_item,297)+TRIM_MIDDLE_CLIP(turn_a_gundam_movie_01_sochie_and_loran_in_festival,278)+TRIM_MIDDLE_CLIP(turn_a_gundam_movie_01_sochie_run,278)+TRIM_FIRST_CLIP(turn_a_gundam_movie_01_loran_drive_to_airport,338)
turn_a_gundam_tv_ed_01_t03=TRIM_MIDDLE_CLIP(turn_a_gundam_movie_01_kihel_stand,272)+TRIM_FIRST_CLIP(turn_a_gundam_movie_01_guin_and_loran_handshake_extend,272*5/4)
turn_a_gundam_tv_ed_01_t04=RESIZE_TO_REF_CLIP(turn_a_gundam_tv_21_turn_a_washer,turn_a_gundam_movie_01_space)
turn_a_gundam_tv_ed_01_t05=TRIM_FIRST_CLIP(turn_a_gundam_movie_01_sochie_and_loran_adult,287)+TRIM_FIRST_CLIP(turn_a_gundam_movie_01_keith_talk_with_loran,272)+TRIM_FIRST_CLIP(turn_a_gundam_movie_01_lily,135)+TRIM_LAST_CLIP(turn_a_gundam_movie_01_gavane_and_sochie,135)+TRIM_FIRST_CLIP(turn_a_gundam_movie_01_joseph_drive,337)
turn_a_gundam_tv_ed_01_t06=TRIM_MIDDLE_CLIP(turn_a_gundam_movie_01_harry,272)+TRIM_MIDDLE_CLIP(turn_a_gundam_movie_01_kihel_talk_with_loran,204)+TRIM_FIRST_CLIP(turn_a_gundam_movie_01_sochie_slap_loran,203)
turn_a_gundam_tv_ed_01_t07=turn_a_gundam_movie_01_dianna_appear+TRIM_MIDDLE_CLIP(turn_a_gundam_movie_01_loran,204+dissolve_length)
turn_a_gundam_tv_ed_01_t08=RESIZE_TO_REF_CLIP(turn_a_gundam_tv_clean_ed_01_mosaic,turn_a_gundam_movie_01_space)+BlankClip(turn_a_gundam_movie_01_space,length=96,color=color_black)

double_fade_length=24
turn_a_gundam_tv_ed_01_temp=Dissolve(turn_a_gundam_tv_ed_01_t01,turn_a_gundam_tv_ed_01_t02,dissolve_length)
turn_a_gundam_tv_ed_01_temp=DOUBLE_FADE_WITH_BRIGHTNESS_OFFSET_RGB24(turn_a_gundam_tv_ed_01_temp,turn_a_gundam_tv_ed_01_t03,double_fade_length,double_fade_length)
turn_a_gundam_tv_ed_01_temp=DOUBLE_FADE_WITH_BRIGHTNESS_OFFSET_RGB24(turn_a_gundam_tv_ed_01_temp,turn_a_gundam_tv_ed_01_t04,double_fade_length,double_fade_length)
turn_a_gundam_tv_ed_01_temp=DOUBLE_FADE_WITH_BRIGHTNESS_OFFSET_RGB24(turn_a_gundam_tv_ed_01_temp,turn_a_gundam_tv_ed_01_t05,double_fade_length,double_fade_length)
turn_a_gundam_tv_ed_01_temp=DOUBLE_FADE_WITH_BRIGHTNESS_OFFSET_RGB24(turn_a_gundam_tv_ed_01_temp,turn_a_gundam_tv_ed_01_t06,double_fade_length,double_fade_length)
turn_a_gundam_tv_ed_01_temp=DOUBLE_FADE_WITH_BRIGHTNESS_OFFSET_RGB24(turn_a_gundam_tv_ed_01_temp,Dissolve(turn_a_gundam_tv_ed_01_t07,turn_a_gundam_tv_ed_01_t08,dissolve_length),double_fade_length,double_fade_length)

turn_a_gundam_tv_ed_01_mute=turn_a_gundam_tv_ed_01_temp

######## Music ########

bgm_48khz=SSRC(WAVSource("src\turn_a_gundam-tv-ed-01-01.wav"),48000)
AudioDub(turn_a_gundam_tv_ed_01_mute,bgm_48khz)

######## Subtitle ########

SUBTITLE_FX("AURA//’J‘ºVi|- by fielia@AVISynth",subtitle_x,subtitle_y-subtitle_size,6497,6862,is_title=true)

SUBTITLE_FX("”÷”M‚ª‚³‚ß‚È‚¢‚Ü‚Ü",subtitle_x,subtitle_y,558,654)
SUBTITLE_FX("‚¤‚Â‚Ş‚­­”N‚Ì“µ‚Í",subtitle_x,subtitle_y,695,827)
SUBTITLE_FX("S‚ÌŠC‚İ‚Â‚ß‚Ä",subtitle_x,subtitle_y,850,968)
SUBTITLE_FX("Ã‚©‚É‚Ù‚Ù‚¦‚ñ‚Å‚é",subtitle_x,subtitle_y,988,1077)

SUBTITLE_FX("¶‚Ü‚ê‚­‚é‚à‚Ì Á‚¦‚Ä‚ä‚­‚à‚Ì",subtitle_x,subtitle_y,1125,1238)
SUBTITLE_FX("‚·‚×‚Ä‚Íh–½‚ÌUq‚Ì•",subtitle_x,subtitle_y,1249,1388)
SUBTITLE_FX("ÁÜ‚ÌˆÅ‚ğ“Ë‚«”²‚¯‚İ‚¦‚Ä‚­‚é",subtitle_x,subtitle_y,1402,1547)
SUBTITLE_FX("‚»‚ê‚ªŒõ‚Ì^À",subtitle_x,subtitle_y,1548,1715)

SUBTITLE_FX("AURA –é–¾‚¯‚Æ‚Æ‚à‚É",subtitle_x,subtitle_y,1751,1865)
SUBTITLE_FX("‚±‚Ì”¯‚ğ‚ä‚ç‚·‚à‚Ì‚Í‰½",subtitle_x,subtitle_y,1878,2006)
SUBTITLE_FX("AURA ’nã‚Ì•—‚Í",subtitle_x,subtitle_y,2023,2136)
SUBTITLE_FX("_‚ª‚à‚½‚ç‚µ‚½—­‘§‚©",subtitle_x,subtitle_y,2149,2319)

SUBTITLE_FX("‚Ü‚Â–Ñ‚ğ”G‚ç‚µ‚½‚Ü‚Ü",subtitle_x,subtitle_y,2882,2975)
SUBTITLE_FX("‚İ‚ ‚°‚é­”N‚Ì“µ‚Í",subtitle_x,subtitle_y,3018,3146)
SUBTITLE_FX("‰“‚¢‚ ‚Ì“ú‚©‚·‚ß‚Ä",subtitle_x,subtitle_y,3170,3288)
SUBTITLE_FX("–¾“ú‚ğ‚İ‚Â‚ß‚Ä‚¢‚é",subtitle_x,subtitle_y,3306,3386)

SUBTITLE_FX("¶‚Ü‚ê‚­‚é‚à‚Ì Á‚¦‚Ä‚ä‚­‚à‚Ì",subtitle_x,subtitle_y,3437,3550)
SUBTITLE_FX("‚·‚×‚Ä‚Íh–½‚ÌUq‚Ì•",subtitle_x,subtitle_y,3557,3695)
SUBTITLE_FX("ÁÜ‚ÌˆÅ‚ğ“Ë‚«”²‚¯‚İ‚¦‚Ä‚­‚é",subtitle_x,subtitle_y,3705,3849)
SUBTITLE_FX("‚»‚ê‚ª–½‚Ì^À",subtitle_x,subtitle_y,3850,4026)

SUBTITLE_FX("AURA –é–¾‚¯‚Æ‚Æ‚à‚É",subtitle_x,subtitle_y,4052,4165)
SUBTITLE_FX("–Y‚ê‹‚ç‚ê‚é¯‚É•ù‚®",subtitle_x,subtitle_y,4179,4313)
SUBTITLE_FX("AURA Šã‚Ìˆ¤‚Í",subtitle_x,subtitle_y,4324,4436)
SUBTITLE_FX("¬‚³‚È‚»‚Ìè‚Ì’†‚É‚ ‚é",subtitle_x,subtitle_y,4445,4597)

SUBTITLE_FX("AURA –é–¾‚¯‚Æ‚Æ‚à‚É",subtitle_x,subtitle_y,4731,4846)
SUBTITLE_FX("–Y‚ê‹‚ç‚ê‚é¯‚É•ù‚®",subtitle_x,subtitle_y,4858,4994)
SUBTITLE_FX("AURA Šã‚Ìˆ¤‚Í",subtitle_x,subtitle_y,5002,5114)
SUBTITLE_FX("¬‚³‚È‚»‚Ìè‚Ì’†‚É‚ ‚é",subtitle_x,subtitle_y,5119,5290)

SUBTITLE_FX("Oh~~~~~~",subtitle_x,subtitle_y,5339,5767)
SUBTITLE_FX("Uh~~~~~~",subtitle_x,subtitle_y,5800,5830)
SUBTITLE_FX("Oh~~~~~~",subtitle_x,subtitle_y,5856,6236)
SUBTITLE_FX("Uh~~~~~~",subtitle_x,subtitle_y,6277,6380)



turn_a_washer_blink_string="ƒ^[ƒ“A‚Ì³‚µ‚¢g‚¢•û"
turn_a_washer_blink_string_x=-second_subtitle_x
turn_a_washer_blink_string_y=second_subtitle_y
turn_a_washer_blink_string_first_frame=2402
turn_a_washer_blink_string_last_frame=2855

SUBTITLE_FX_SMOOTH_BLINK(turn_a_washer_blink_string,turn_a_washer_blink_string_x,turn_a_washer_blink_string_y,turn_a_washer_blink_string_first_frame,turn_a_washer_blink_string_last_frame,subtitle_font,subtitle_effects,subtitle_size,color_lightgrey,subtitle_halo_color,min_opacity=0.2,max_opacity=0.9)



RESIZE_TO_REF_CLIP(sekai_meisaku_gekijou,turn_a_gundam_movie_01_space)++ConvertToYV12(last)

######## Post Processing ########

ConvertToYV12()
#ConvertToYUY2()
#ConvertToRGB24()

TCPServer()
