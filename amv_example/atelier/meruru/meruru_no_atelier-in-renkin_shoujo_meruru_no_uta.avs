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



Import("..\..\avsi4comp\macro.avsi")

######## Function ########

function MULTIPASS_BLUR(clip clip,int count){
	return count>0?MULTIPASS_BLUR(Blur(clip,1.0),count-1):clip
}

function SELF_OVERLAY(clip ref_clip,clip clip_bg,string clip_fg,string mode,float start_x,float start_y,float start_opacity,float end_x,float end_y,float end_opacity){
	clip_fg="AddBorders("+clip_fg+",2,2,2,2)"
	clip_bg=RESIZE_TO_REF_CLIP(clip_bg,ref_clip)
	clip_bg=MULTIPASS_BLUR(clip_bg,10)
	return LINEAR_MOVE(clip_bg,clip_fg,mode,0,Framecount(clip_bg)-1,start_x-1,start_y-1,start_opacity,end_x-1,end_y-1,end_opacity)
}

function DECORATE_CLIP(clip pre_clip,clip base_clip){
	dissolve_length=15
	return Dissolve(pre_clip,Trim(base_clip,Framecount(pre_clip)-dissolve_length,0),dissolve_length)
}

function TRIM_QUARTER_PATTERN_AND_FADEOUT(clip clip,int pattern_length){
	quarter_pattern_length=pattern_length/4-3
	return FADE_OUT_WITH_BRIGHTNESS_OFFSET_RGB24(TRIM_LAST_CLIP(clip,quarter_pattern_length),15)
}

######## PV Online (720P) ########

meruru_prologue_movie=FFMS2_VIDEO_SOURCE("src\special\movie\a13-prologue_movie.mp4") # fps 30

#meruru_prologue_movie_01=Trim(meruru_prologue_movie,0,6854)
meruru_prologue_movie_02=Trim(meruru_prologue_movie,6855,0)



meruru_store_promotion_movie=FFMS2_VIDEO_SOURCE("src\special\movie\a13-store_promotion_movie.mp4",fpsnum=30000,fpsden=1001) # fps 30000/1001
meruru_store_promotion_movie_cache02=FFMS2_VIDEO_SOURCE("src\special\movie\a13-store_promotion_movie.mp4",fpsnum=30000,fpsden=1001)

#meruru_store_promotion_movie_meruru_fight_01=Trim(meruru_store_promotion_movie,2143,2232)
meruru_store_promotion_movie_meruru_fight_02=Trim(meruru_store_promotion_movie,2233,2297)
meruru_store_promotion_movie_meruru_fight_03=Trim(meruru_store_promotion_movie,2298,2361)
meruru_store_promotion_movie_meruru_fight_04=Trim(meruru_store_promotion_movie,2362,2441)
meruru_store_promotion_movie_meruru_fight_05=Trim(meruru_store_promotion_movie,2442,2528)

meruru_store_promotion_movie_meruru_walking_01=Trim(meruru_store_promotion_movie_cache02,2529,2721)
meruru_store_promotion_movie_meruru_walking_02=Trim(meruru_store_promotion_movie_cache02,2722,2783)
meruru_store_promotion_movie_meruru_walking_03=Trim(meruru_store_promotion_movie_cache02,2784,2803)

######## PV Online (360P) ########

meruru_play_director_take_out_01=FFMS2_VIDEO_SOURCE("src\special\play\a13-director_take_out-01.flv",fpsnum=30000,fpsden=1001) # fps 30000/1001

#meruru_play_director_take_out_01_01=Trim(meruru_play_director_take_out_01,0,247)
meruru_play_director_take_out_01_02=Trim(meruru_play_director_take_out_01,248,1822) # framecount 1575
#meruru_play_director_take_out_01_03=Trim(meruru_play_director_take_out_01,1823,0)



meruru_play_director_take_out_02=FFMS2_VIDEO_SOURCE("src\special\play\a13-director_take_out-02.flv",fpsnum=30000,fpsden=1001) # fps 30000/1001

#meruru_play_director_take_out_02_01=Trim(meruru_play_director_take_out_02,0,226)
#meruru_play_director_take_out_02_02=Trim(meruru_play_director_take_out_02,227,8589)
#meruru_play_director_take_out_02_02_01=Trim(meruru_play_director_take_out_02,227,590) # framecount 364 remainder 172
meruru_play_director_take_out_02_02_02=Trim(meruru_play_director_take_out_02,591,822) # framecount 232 remainder 40
meruru_play_director_take_out_02_02_03=Trim(meruru_play_director_take_out_02,823,1005) # framecount 183 remainder 87
meruru_play_director_take_out_02_02_04=Trim(meruru_play_director_take_out_02,1006,1275) # framecount 270 remainder 78
meruru_play_director_take_out_02_02_05=Trim(meruru_play_director_take_out_02,1276,1732) # framecount 457 remainder 73
meruru_play_director_take_out_02_02_06=Trim(meruru_play_director_take_out_02,1733,2488) # framecount 756 remainder 180
meruru_play_director_take_out_02_02_07=Trim(meruru_play_director_take_out_02,2489,2712) # framecount 224 remainder 32
meruru_play_director_take_out_02_02_08=Trim(meruru_play_director_take_out_02,2713,3034) # framecount 322 remainder 130
meruru_play_director_take_out_02_02_09=Trim(meruru_play_director_take_out_02,3035,3416) # framecount 382 remainder 190
meruru_play_director_take_out_02_02_10=Trim(meruru_play_director_take_out_02,3417,3794) # framecount 378 remainder 186
meruru_play_director_take_out_02_02_11=Trim(meruru_play_director_take_out_02,3795,4231) # framecount 437 remainder 53
meruru_play_director_take_out_02_02_12=Trim(meruru_play_director_take_out_02,4232,4661) # framecount 430 remainder 46
meruru_play_director_take_out_02_02_13=Trim(meruru_play_director_take_out_02,4662,5785) # framecount 1124 remainder 124
meruru_play_director_take_out_02_02_14=Trim(meruru_play_director_take_out_02,5786,6657) # framecount 872 remainder 104
meruru_play_director_take_out_02_02_15=Trim(meruru_play_director_take_out_02,6658,7197) # framecount 540 remainder 156
#meruru_play_director_take_out_02_02_16=Trim(meruru_play_director_take_out_02,7198,7414) # framecount 217 remainder 25
meruru_play_director_take_out_02_02_17=Trim(meruru_play_director_take_out_02,7415,8401) # framecount 987 remainder 27
#meruru_play_director_take_out_02_02_18=Trim(meruru_play_director_take_out_02,8402,8589) # framecount 188 remainder 92
#meruru_play_director_take_out_02_03=Trim(meruru_play_director_take_out_02,8590,0)

######## Pre Combine ########

meruru_store_promotion_movie_meruru_walking=meruru_store_promotion_movie_meruru_walking_01+meruru_store_promotion_movie_meruru_walking_03+meruru_store_promotion_movie_meruru_walking_02



pattern_length=192

pre_pattern_length=pattern_length/2
pre_pattern_interval=110

meruru_play_director_take_out_01_02_01=Trim(meruru_play_director_take_out_01_02,pre_pattern_interval*0,-pre_pattern_length)
meruru_play_director_take_out_01_02_02=Trim(meruru_play_director_take_out_01_02,pre_pattern_interval*1,-pre_pattern_length)
meruru_play_director_take_out_01_02_03=Trim(meruru_play_director_take_out_01_02,pre_pattern_interval*2,-pre_pattern_length)
meruru_play_director_take_out_01_02_04=Trim(meruru_play_director_take_out_01_02,pre_pattern_interval*3,-pre_pattern_length)
meruru_play_director_take_out_01_02_05=Trim(meruru_play_director_take_out_01_02,pre_pattern_interval*4,-pre_pattern_length)
meruru_play_director_take_out_01_02_06=Trim(meruru_play_director_take_out_01_02,pre_pattern_interval*5,-pre_pattern_length)
meruru_play_director_take_out_01_02_07=Trim(meruru_play_director_take_out_01_02,pre_pattern_interval*6,-pre_pattern_length)
meruru_play_director_take_out_01_02_08=Trim(meruru_play_director_take_out_01_02,pre_pattern_interval*7,-pre_pattern_length)
meruru_play_director_take_out_01_02_09=Trim(meruru_play_director_take_out_01_02,pre_pattern_interval*8,-pre_pattern_length)
meruru_play_director_take_out_01_02_10=Trim(meruru_play_director_take_out_01_02,pre_pattern_interval*9,-pre_pattern_length)
meruru_play_director_take_out_01_02_11=Trim(meruru_play_director_take_out_01_02,pre_pattern_interval*10,-pre_pattern_length)
meruru_play_director_take_out_01_02_12=Trim(meruru_play_director_take_out_01_02,pre_pattern_interval*11,-pre_pattern_length)
meruru_play_director_take_out_01_02_13=Trim(meruru_play_director_take_out_01_02,pre_pattern_interval*12,-pre_pattern_length)
meruru_play_director_take_out_01_02_14=Trim(meruru_play_director_take_out_01_02,pre_pattern_interval*13,-pre_pattern_length)

overlay_clip_01_source=DECORATE_CLIP(meruru_play_director_take_out_01_02_01,TRIM_LAST_CLIP(meruru_play_director_take_out_02_02_02,pattern_length)) \
	+DECORATE_CLIP(meruru_play_director_take_out_01_02_02,TRIM_LAST_CLIP(meruru_play_director_take_out_02_02_08,pattern_length)) \
	+DECORATE_CLIP(meruru_play_director_take_out_01_02_03,TRIM_LAST_CLIP(meruru_play_director_take_out_02_02_05,pattern_length*2)) \
	+DECORATE_CLIP(meruru_play_director_take_out_01_02_04,TRIM_LAST_CLIP(meruru_play_director_take_out_02_02_04,pattern_length)) \
	+DECORATE_CLIP(meruru_play_director_take_out_01_02_05,TRIM_LAST_CLIP(meruru_play_director_take_out_02_02_09,pattern_length)) \
	+DECORATE_CLIP(meruru_play_director_take_out_01_02_06,TRIM_LAST_CLIP(meruru_play_director_take_out_02_02_06,pattern_length*3)) \
	+DECORATE_CLIP(meruru_play_director_take_out_01_02_07,TRIM_LAST_CLIP(meruru_play_director_take_out_02_02_07,pattern_length))

overlay_clip_02_source=DECORATE_CLIP(meruru_play_director_take_out_01_02_08,TRIM_LAST_CLIP(meruru_play_director_take_out_02_02_10,pattern_length)) \
	+TRIM_LAST_CLIP(meruru_play_director_take_out_02_02_03,pattern_length/2) \
	+DECORATE_CLIP(meruru_play_director_take_out_01_02_09,TRIM_LAST_CLIP(meruru_play_director_take_out_02_02_13,pattern_length*5)) \
	+DECORATE_CLIP(meruru_play_director_take_out_01_02_10,TRIM_LAST_CLIP(meruru_play_director_take_out_02_02_17,pattern_length*5))

overlay_clip_03_source=DECORATE_CLIP(meruru_play_director_take_out_01_02_11,TRIM_LAST_CLIP(meruru_play_director_take_out_02_02_14,pattern_length*4)) \
	+DECORATE_CLIP(meruru_play_director_take_out_01_02_12,TRIM_LAST_CLIP(meruru_play_director_take_out_02_02_15,pattern_length*2))

overlay_clip_04_source=DECORATE_CLIP(meruru_play_director_take_out_01_02_13,TRIM_LAST_CLIP(meruru_play_director_take_out_02_02_11,pattern_length*2)) \
	+DECORATE_CLIP(meruru_play_director_take_out_01_02_14,TRIM_LAST_CLIP(meruru_play_director_take_out_02_02_12,pattern_length*2))

#TRIM_LAST_CLIP(meruru_play_director_take_out_02_02_16,pattern_length)
#TRIM_LAST_CLIP(meruru_play_director_take_out_02_02_18,pattern_length/2)

overlay_clip_blend_mode="Blend"
overlay_clip_move_offset_x=16*8
overlay_clip_move_offset_y=9*8
overlay_clip_01=SELF_OVERLAY(meruru_store_promotion_movie,overlay_clip_01_source,"overlay_clip_01_source",overlay_clip_blend_mode,320-overlay_clip_move_offset_x,180-overlay_clip_move_offset_y,0.7,320+overlay_clip_move_offset_x,180+overlay_clip_move_offset_y,0.9)
overlay_clip_02=SELF_OVERLAY(meruru_store_promotion_movie,overlay_clip_02_source,"overlay_clip_02_source",overlay_clip_blend_mode,320+overlay_clip_move_offset_x,180-overlay_clip_move_offset_y,0.9,320-overlay_clip_move_offset_x,180+overlay_clip_move_offset_y,0.7)
overlay_clip_03=SELF_OVERLAY(meruru_store_promotion_movie,overlay_clip_03_source,"overlay_clip_03_source",overlay_clip_blend_mode,320+overlay_clip_move_offset_x,180+overlay_clip_move_offset_y,0.9,320-overlay_clip_move_offset_x,180-overlay_clip_move_offset_y,0.7)
overlay_clip_04=SELF_OVERLAY(meruru_store_promotion_movie,overlay_clip_04_source,"overlay_clip_04_source",overlay_clip_blend_mode,320-overlay_clip_move_offset_x,180+overlay_clip_move_offset_y,0.7,320+overlay_clip_move_offset_x,180-overlay_clip_move_offset_y,0.9)

#overlay_clip_01=RESIZE_TO_REF_CLIP(overlay_clip_01_source,meruru_store_promotion_movie)
#overlay_clip_02=RESIZE_TO_REF_CLIP(overlay_clip_02_source,meruru_store_promotion_movie)
#overlay_clip_03=RESIZE_TO_REF_CLIP(overlay_clip_03_source,meruru_store_promotion_movie)
#overlay_clip_04=RESIZE_TO_REF_CLIP(overlay_clip_04_source,meruru_store_promotion_movie)

######## Combine ########

meruru_in_renkin_shoujo_meruru_no_uta_t01=BlankClip(meruru_store_promotion_movie,length=25,color=color_black)+Dissolve(meruru_store_promotion_movie_meruru_walking,TRIM_MIDDLE_CLIP(meruru_store_promotion_movie_meruru_fight_05,40),20)
meruru_in_renkin_shoujo_meruru_no_uta_t02=overlay_clip_01+TRIM_QUARTER_PATTERN_AND_FADEOUT(meruru_store_promotion_movie_meruru_fight_02,pattern_length)+overlay_clip_02+TRIM_QUARTER_PATTERN_AND_FADEOUT(meruru_store_promotion_movie_meruru_fight_03,pattern_length)+overlay_clip_03+TRIM_QUARTER_PATTERN_AND_FADEOUT(meruru_store_promotion_movie_meruru_fight_04,pattern_length)+overlay_clip_04
meruru_in_renkin_shoujo_meruru_no_uta_t03=AssumeFPS(meruru_prologue_movie_02,meruru_store_promotion_movie)

meruru_in_renkin_shoujo_meruru_no_uta_mute=meruru_in_renkin_shoujo_meruru_no_uta_t01+Dissolve(meruru_in_renkin_shoujo_meruru_no_uta_t02,meruru_in_renkin_shoujo_meruru_no_uta_t03,64) # 64 or 21?

######## Music ########

bgm_48khz=SSRC(WAVSource("src\meruru_no_atelier-ost-01-04.wav"),48000)
AudioDub(meruru_in_renkin_shoujo_meruru_no_uta_mute,bgm_48khz)

######## Subtitle ########

subtitle_x=50
subtitle_y=400
global subtitle_front_fade_count=15
global subtitle_rear_fade_count=30
global subtitle_font="MS Gothic"
global subtitle_effects="bi"
global subtitle_size=28
global subtitle_text_color=OVERWRITE_COLOR_ALPHA(color_pink,$2F)
global subtitle_halo_color=color_black

function SUBTITLE_FX(clip clip,string text,float x,float y,int start_frame,int end_frame,bool "is_title"){
	is_title=Default(is_title,false)

	halo_color=is_title?color_firebrick:subtitle_halo_color

	return SUBTITLE_FX_SLIDE_IN_WATER_OUT(clip,text,x,y,start_frame,end_frame,subtitle_front_fade_count,subtitle_rear_fade_count,subtitle_font,subtitle_effects,subtitle_size,subtitle_text_color,halo_color)
}

SUBTITLE_FX("˜B‹à­—ƒƒ‹ƒ‹‚Ì‚¤‚½//^—ŠG|- by fielia@AVISynth",subtitle_x,subtitle_y-subtitle_size,4927,5118,true)

SUBTITLE_FX("ƒƒ‹ƒ‹ƒƒŒ ƒƒ‹ƒ‹ƒƒ‰ƒƒ‰ ƒƒƒƒŠƒƒƒ",subtitle_x,subtitle_y,34,245)

SUBTITLE_FX("‚¤‚Á‚©‚è–ò‚Ü‚¿‚ª‚¦ ‚â‚Á‚Ï‚è”š”­",subtitle_x,subtitle_y,322,504)
SUBTITLE_FX("‚½‚Ü‚É‚Í‚»‚ñ‚È“ú‚à‚ ‚é‚¯‚Ç",subtitle_x,subtitle_y,515,693)
SUBTITLE_FX("‚ª‚Á‚©‚è‚È‚ñ‚Ä‚µ‚È‚¢‚í ‚ ‚Á‚³‚è•œŠˆ",subtitle_x,subtitle_y,706,887)
SUBTITLE_FX("‚µ‚ß‚«‚èŒµç Šæ’£‚ê„",subtitle_x,subtitle_y,897,1045)

SUBTITLE_FX("‚Ş‚ç‚ª‚é“G‚ğ ‚±‚Ì¢‚Ìˆ«‚ğ",subtitle_x,subtitle_y,1101,1278)
SUBTITLE_FX("˜B‹àp‚Å‚±‚ç‚µ‚ß‚é",subtitle_x,subtitle_y,1293,1427)

SUBTITLE_FX("‚ä‚é‚³‚È‚¢ ”R‚¦‚ëƒƒ‰ƒƒ‰ƒƒ‹ƒ‹ƒpƒ“ƒ`",subtitle_x,subtitle_y,1472,1655)
SUBTITLE_FX("ŒÄ‚Î‚ê‚È‚­‚Ä‚à‚©‚¯‚Â‚¯‚é",subtitle_x,subtitle_y,1664,1846)
SUBTITLE_FX("‚É‚ª‚³‚È‚¢ ‚­‚¾‚¯ƒƒŒƒƒŒƒƒ‹ƒ‹ƒLƒbƒN",subtitle_x,subtitle_y,1856,2036)
SUBTITLE_FX("íŸ–³”s ˜B‹à­—ƒƒ‹ƒ‹",subtitle_x,subtitle_y,2047,2384)

SUBTITLE_FX("‚Û‚Á‚±‚è‚¨• ‚ªo‚Ä‚à ‚Î‚Á‚¿‚è‚¨‚Ü‚©‚¹",subtitle_x,subtitle_y,2576,2758)
SUBTITLE_FX("‚Ç‚ñ‚È”Y‚İ‚àS”z‚²–³—p",subtitle_x,subtitle_y,2768,2948)
SUBTITLE_FX("‚Ò‚Á‚©‚èƒŒƒVƒs‚Ğ‚ç‚ß‚« ‚·‚Á‚©‚è‰ğŒˆ",subtitle_x,subtitle_y,2960,3141)
SUBTITLE_FX("‚»‚ê‚ª¶‚«‚ª‚¢ ‹P‚¯„",subtitle_x,subtitle_y,3151,3310)

SUBTITLE_FX("‚Ş‚è‚ß‚È—ö‚à ‚¾‚ß‚°‚È–²‚à",subtitle_x,subtitle_y,3354,3535)
SUBTITLE_FX("˜B‹àp‚Å‚©‚È‚¦‚Ü‚·",subtitle_x,subtitle_y,3547,3685)

SUBTITLE_FX("‚Í‚È‚³‚È‚¢ ŒN‚ÆƒƒŠƒƒŠƒƒ‹ƒ‹ƒnƒbƒO",subtitle_x,subtitle_y,3726,3908)
SUBTITLE_FX("Œ¾‚í‚ê‚È‚­‚Ä‚à‚¿‚á‚ñ‚Æ‚â‚é",subtitle_x,subtitle_y,3919,4100)
SUBTITLE_FX("‚Æ‚Ü‚ç‚È‚¢ ŒN‚àƒƒƒƒƒƒ‹ƒ‹ƒLƒbƒX",subtitle_x,subtitle_y,4110,4290)
SUBTITLE_FX("‘å’_•s“G ˜B‹à­—ƒƒ‹ƒ‹",subtitle_x,subtitle_y,4301,4637)

SUBTITLE_FX("‚·‚İ‚æ‚¢‘‚ğ ‚İ‚ñ‚È‚Ì–¾“ú‚ğ",subtitle_x,subtitle_y,5319,5500)
SUBTITLE_FX("˜B‹àp‚Å‚Â‚­‚è‚¾‚·",subtitle_x,subtitle_y,5513,5648)

SUBTITLE_FX("‚­‚¶‚¯‚È‚¢ Œ³‹Cƒƒ‹ƒƒ‹ƒƒ‹ƒ‹ƒKƒbƒc",subtitle_x,subtitle_y,5741,5920)
SUBTITLE_FX("–é‚àQ‚È‚¢‚Å’‹Q‚µ‚Ä",subtitle_x,subtitle_y,5932,6113)
SUBTITLE_FX("‚Í‚Ä‚µ‚È‚¢ –²‚ªƒƒ‹ƒƒ‹ƒƒ‹ƒ‹ƒhƒŠ[ƒ€",subtitle_x,subtitle_y,6124,6305)
SUBTITLE_FX("”N’†–³‹x ˜B‹à­—ƒƒ‹ƒ‹",subtitle_x,subtitle_y,6315,6652)

SUBTITLE_FX("ƒƒ‰ƒ‰ƒƒŠƒŠƒƒ‹ƒ‹ƒƒŒƒŒƒƒƒƒ ƒƒ‹ƒ‹",subtitle_x,subtitle_y,6746,6905)

######## Post Processing ########

ConvertToYV12()
#ConvertToYUY2()
#ConvertToRGB24()
