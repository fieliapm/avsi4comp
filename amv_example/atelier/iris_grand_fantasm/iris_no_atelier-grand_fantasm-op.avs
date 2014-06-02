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

#SetMemoryMax(64)

######## YouTube (640*480) ########

iris_no_atelier_grand_fantasm_op=SSRC(FFMS2_VIDEO_SOURCE("src\iris_no_atelier-grand_fantasm-movie\youtube\Atelier Iris Grand Fantasm_OPENING.360p.mp4",fpsnum=30000,fpsden=1001),48000)

iris_no_atelier_grand_fantasm_op_video=FFVideoSource("src\iris_no_atelier-grand_fantasm-movie\youtube\Atelier Iris Grand Fantasm_OPENING.DASH-480p.mp4",fpsnum=30000,fpsden=1001,seekmode=-1)
iris_no_atelier_grand_fantasm_op=AudioDub(iris_no_atelier_grand_fantasm_op_video,iris_no_atelier_grand_fantasm_op)

#iris_no_atelier_grand_fantasm_web_pv_01_youtube=FFMS2_VIDEO_SOURCE("src\iris_no_atelier-grand_fantasm-movie\youtube\Atelier Iris Grand Fantasm(PV) ƒCƒŠƒX‚ÌƒAƒgƒŠƒG ƒOƒ‰ƒ“ƒtƒ@ƒ“ƒ^ƒYƒ€.360p.mp4")

######## Official Web (320*240) ########

#iris_no_atelier_grand_fantasm_web_pv_01_path="src\iris_no_atelier-grand_fantasm-movie\official\GF_webPV_01m.MP4"
#iris_no_atelier_grand_fantasm_web_pv_02_path="src\iris_no_atelier-grand_fantasm-movie\official\PV_vol_2m.MP4"

iris_no_atelier_grand_fantasm_web_pv_01_path="src\iris_no_atelier-grand_fantasm-movie\official\GF_webPV_01s.wmv"
iris_no_atelier_grand_fantasm_web_pv_02_path="src\iris_no_atelier-grand_fantasm-movie\official\PV_vol_2s.wmv"

iris_no_atelier_grand_fantasm_web_pv_01=SSRC(FFMS2_VIDEO_SOURCE(iris_no_atelier_grand_fantasm_web_pv_01_path,fpsnum=30000,fpsden=1001),48000)
iris_no_atelier_grand_fantasm_web_pv_02=SSRC(FFMS2_VIDEO_SOURCE(iris_no_atelier_grand_fantasm_web_pv_02_path,fpsnum=30000,fpsden=1001),48000)
iris_no_atelier_grand_fantasm_web_pv_01=RESIZE_TO_REF_CLIP(iris_no_atelier_grand_fantasm_web_pv_01,iris_no_atelier_grand_fantasm_op)
iris_no_atelier_grand_fantasm_web_pv_02=RESIZE_TO_REF_CLIP(iris_no_atelier_grand_fantasm_web_pv_02,iris_no_atelier_grand_fantasm_op)

iris_no_atelier_grand_fantasm_web_pv_02_cache02=SSRC(FFMS2_VIDEO_SOURCE(iris_no_atelier_grand_fantasm_web_pv_02_path,fpsnum=30000,fpsden=1001),48000)
iris_no_atelier_grand_fantasm_web_pv_02_cache02=RESIZE_TO_REF_CLIP(iris_no_atelier_grand_fantasm_web_pv_02_cache02,iris_no_atelier_grand_fantasm_op)

######## Trim ########

op_single_music_start=98
op_single_music_start_overlap=10

#iris_no_atelier_grand_fantasm_op_00=Trim(iris_no_atelier_grand_fantasm_op,0,op_single_music_start-1)
iris_no_atelier_grand_fantasm_op_00=Trim(iris_no_atelier_grand_fantasm_op,0,op_single_music_start-1+op_single_music_start_overlap)
iris_no_atelier_grand_fantasm_op_01=Trim(iris_no_atelier_grand_fantasm_op,op_single_music_start,1129)
iris_no_atelier_grand_fantasm_op_02=Trim(iris_no_atelier_grand_fantasm_op,1130,0)



iris_no_atelier_grand_fantasm_web_pv_01_01_rotating_book=Trim(iris_no_atelier_grand_fantasm_web_pv_01,0,1029) #1030
iris_no_atelier_grand_fantasm_web_pv_01_02_text=Trim(iris_no_atelier_grand_fantasm_web_pv_01,1030,1157) #128
iris_no_atelier_grand_fantasm_web_pv_01_03_op=Trim(iris_no_atelier_grand_fantasm_web_pv_01,1158,1630)
iris_no_atelier_grand_fantasm_web_pv_01_04_main_character=Trim(iris_no_atelier_grand_fantasm_web_pv_01,1631,1912) #282
iris_no_atelier_grand_fantasm_web_pv_01_05_game_play=Trim(iris_no_atelier_grand_fantasm_web_pv_01,1913,2852) #940
iris_no_atelier_grand_fantasm_web_pv_01_06_op=Trim(iris_no_atelier_grand_fantasm_web_pv_01,2853,2969) #117
iris_no_atelier_grand_fantasm_web_pv_01_07_game_play=Trim(iris_no_atelier_grand_fantasm_web_pv_01,2970,3525) #556
iris_no_atelier_grand_fantasm_web_pv_01_08_1_game_play=Trim(iris_no_atelier_grand_fantasm_web_pv_01,3526,3996) #471
iris_no_atelier_grand_fantasm_web_pv_01_08_2_op=Trim(iris_no_atelier_grand_fantasm_web_pv_01,3997,4301)
iris_no_atelier_grand_fantasm_web_pv_01_09_sell=Trim(iris_no_atelier_grand_fantasm_web_pv_01,4302,5020)
iris_no_atelier_grand_fantasm_web_pv_01_10_omake=Trim(iris_no_atelier_grand_fantasm_web_pv_01,5021,6223) #1203
iris_no_atelier_grand_fantasm_web_pv_01_11_trademark=Trim(iris_no_atelier_grand_fantasm_web_pv_01,6224,0)



iris_no_atelier_grand_fantasm_web_pv_02_01_rotating_book=Trim(iris_no_atelier_grand_fantasm_web_pv_02,0,897) #898
iris_no_atelier_grand_fantasm_web_pv_02_02_title=Trim(iris_no_atelier_grand_fantasm_web_pv_02,898,1038) #141
iris_no_atelier_grand_fantasm_web_pv_02_03_text=Trim(iris_no_atelier_grand_fantasm_web_pv_02,1039,1189) #151
iris_no_atelier_grand_fantasm_web_pv_02_04_1_game_play=Trim(iris_no_atelier_grand_fantasm_web_pv_02,1190,3260) #2071
iris_no_atelier_grand_fantasm_web_pv_02_04_2_op=Trim(iris_no_atelier_grand_fantasm_web_pv_02,3261,4168)
iris_no_atelier_grand_fantasm_web_pv_02_05_1_game_play=Trim(iris_no_atelier_grand_fantasm_web_pv_02_cache02,4169,4777) #609
iris_no_atelier_grand_fantasm_web_pv_02_05_2_bg=Trim(iris_no_atelier_grand_fantasm_web_pv_02,4778,4832) #55
iris_no_atelier_grand_fantasm_web_pv_02_05_3_op_sell=Trim(iris_no_atelier_grand_fantasm_web_pv_02,4833,0)

######## Pre Combine ########

t05_t06_dissolve_length=36
dissolve_length=30
fade_length=30

######## Combine ########

# iris_no_atelier_grand_fantasm_op_00 -98
# iris_no_atelier_grand_fantasm_op_02 7197
#
# iris_no_atelier_grand_fantasm_web_pv_01_04_main_character 2615
# iris_no_atelier_grand_fantasm_web_pv_02_05_1_game_play 6367 (6403)



iris_no_atelier_grand_fantasm_op_t01=iris_no_atelier_grand_fantasm_op_01
iris_no_atelier_grand_fantasm_op_t02=TRIM_FIRST_CLIP(iris_no_atelier_grand_fantasm_web_pv_02_04_1_game_play,1583)

iris_no_atelier_grand_fantasm_op_t03=iris_no_atelier_grand_fantasm_web_pv_01_04_main_character+iris_no_atelier_grand_fantasm_web_pv_01_05_game_play+iris_no_atelier_grand_fantasm_web_pv_01_06_op
iris_no_atelier_grand_fantasm_op_t04=iris_no_atelier_grand_fantasm_web_pv_01_07_game_play+Dissolve(iris_no_atelier_grand_fantasm_web_pv_01_08_1_game_play,iris_no_atelier_grand_fantasm_web_pv_02_03_text,Framecount(iris_no_atelier_grand_fantasm_web_pv_02_03_text)-39)

iris_no_atelier_grand_fantasm_op_t05=Dissolve(TRIM_MIDDLE_CLIP(iris_no_atelier_grand_fantasm_web_pv_01_10_omake,1067),Trim(iris_no_atelier_grand_fantasm_web_pv_02_01_rotating_book,120,-(280+dissolve_length+t05_t06_dissolve_length)),dissolve_length)
iris_no_atelier_grand_fantasm_op_t06=Dissolve(iris_no_atelier_grand_fantasm_web_pv_02_05_1_game_play,TRIM_MIDDLE_CLIP(iris_no_atelier_grand_fantasm_web_pv_01_01_rotating_book,221+dissolve_length),dissolve_length)
iris_no_atelier_grand_fantasm_op_t07=iris_no_atelier_grand_fantasm_op_02



iris_no_atelier_grand_fantasm_op_mute=iris_no_atelier_grand_fantasm_op_t01+FADE_OUT_WITH_BRIGHTNESS_OFFSET_RGB24(iris_no_atelier_grand_fantasm_op_t02,fade_length) \
	+iris_no_atelier_grand_fantasm_op_t03+iris_no_atelier_grand_fantasm_op_t04 \
	+Dissolve(iris_no_atelier_grand_fantasm_op_t05,FADE_OUT_WITH_BRIGHTNESS_OFFSET_RGB24(iris_no_atelier_grand_fantasm_op_t06,fade_length),t05_t06_dissolve_length) \
	+iris_no_atelier_grand_fantasm_op_t07

######## Music ########

bgm_48khz=SSRC(WAVSource("src\iris_no_atelier-grand_fantasm-op-03.wav"),48000)

AudioDub(iris_no_atelier_grand_fantasm_op_mute,bgm_48khz)



thumbnail=Trim(8300,-30*5)

######## Subtitle ########

global subtitle_clip_width=640
global subtitle_clip_height=480

global subtitle_x=50
global subtitle_y=400
global subtitle_front_fade_count=10
global subtitle_rear_fade_count=10
global subtitle_font="MS Gothic"
global subtitle_effects="b"
global subtitle_size=28
global subtitle_text_color=color_white
global subtitle_halo_color=color_black

eszett_assemble_13_offset=-subtitle_size/5

function SUBTITLE_FX(clip clip,string text,float x,float y,int start_frame,int end_frame,bool "is_furigana",bool "is_title"){
	is_title=Default(is_title,false)
	is_furigana=Default(is_furigana,false)

	text_color=is_title?color_gold:subtitle_text_color
	size=is_furigana?subtitle_size*0.5:subtitle_size
	y=is_furigana?y-size:y

	return SUBTITLE_FX_FADE_IN_FADE_OUT(clip,text,Round(x),Round(y),start_frame,end_frame,subtitle_front_fade_count,subtitle_rear_fade_count,subtitle_font,subtitle_effects,Round(size),text_color,subtitle_halo_color)
}

SUBTITLE_FX("schwarzwei3 `–¶‚ÌŒü‚±‚¤‚ÉŒq‚ª‚é¢ŠE`|    ‘šŒ‚Í‚é‚©õRevo(Sound Horizon)|        - by fielia@AVISynth",subtitle_x,subtitle_y-subtitle_size*2,8775,9183,is_title=true)
SUBTITLE_FX("          1",subtitle_x+eszett_assemble_13_offset,subtitle_y-subtitle_size*2,8775,9183,is_title=true)



SUBTITLE_FX("Œõ‚ª—~‚µ‚­‚ÄˆÃˆÅ‚Éè‚ğL‚Î‚·",subtitle_x,subtitle_y,391,695)
SUBTITLE_FX("–ÚÁ‚ß‚ğ‘Ò‚Á‚Ä‚¢‚½‚Ì‚ÍŒ©’m‚ç‚Ê¢ŠE",subtitle_x,subtitle_y,708,995)

SUBTITLE_FX("\\‚»‚µ‚Ä‹¹‚É—h‚ç‚ß‚­’N‚©‚ÌÎŠç‚ğ",subtitle_x,subtitle_y,1008,1175)
SUBTITLE_FX("•ø‚¢‚½‚Ü‚Ü‚Éœfœr‚¢‚È‚ª‚ç‚à",subtitle_x,subtitle_y,1183,1333)
SUBTITLE_FX("i‚Ş’j‚Ís‚­è‚ğÕ‚é–¶‚ğ",subtitle_x,subtitle_y,1339,1492)
SUBTITLE_FX("“ã‚¬•¥‚¤ãJ‰¯‚¢o‚·cc",subtitle_x,subtitle_y,1498,1622)

SUBTITLE_FX("              ‚ä‚ß",subtitle_x,subtitle_y,1656,1957,true)
SUBTITLE_FX("‰Æ˜H‚ÌŒ¶‘œ‚ğ•`‚«‹ó‚ğ‰z‚¦‚é•¨Œê",subtitle_x,subtitle_y,1656,1957)
SUBTITLE_FX("        night            breath",subtitle_x,subtitle_y,1962,2103,true)
SUBTITLE_FX("•‚¢ª...”’‚¢‘§...”Ş‚Í‚¤",subtitle_x,subtitle_y,1962,2103)
SUBTITLE_FX("                      Alice",subtitle_x,subtitle_y,2106,2373,true)
SUBTITLE_FX("–³C‚ÈåQ‚Ìˆ¤–º‚Ö‚Æcc",subtitle_x,subtitle_y,2106,2373)

SUBTITLE_FX("‘z‚¢‚ğ‚ß‚Ä‚àŒ¾—t‚Í‚É–³—Í‚Å",subtitle_x,subtitle_y,2605,2905)
SUBTITLE_FX("s“®‚µ‚½Ò‚¾‚¯‚ª^À‚ğ’Í‚Ş",subtitle_x,subtitle_y,2921,3212)

SUBTITLE_FX("\\‚©‚­‚Ä‹¹‚ÉàŠ‚ß‚­­—‚ÌŒˆˆÓ‚Í",subtitle_x,subtitle_y,3222,3389)
SUBTITLE_FX("ŸD‚ğèŒJ‚è”Ş•û‚Ö‘†‚¬o‚µ",subtitle_x,subtitle_y,3396,3545)
SUBTITLE_FX("‹•‘œ‚ğ‰f‚µ‘Šè‚ğ˜f‚í‚·–¶‚ğ",subtitle_x,subtitle_y,3553,3706)
SUBTITLE_FX("U‚è•¥‚¤‹­‚³è‚É“ü‚ê‚écc",subtitle_x,subtitle_y,3712,3836)

SUBTITLE_FX("              ‚ä‚ß                  door",subtitle_x,subtitle_y,3869,4169,true)
SUBTITLE_FX("–À‚¢‚ÌŒ¶–²‚ğ”²‚¯‚é”à‚ğ’T‚·•¨Œê",subtitle_x,subtitle_y,3869,4169)
SUBTITLE_FX("        worm              mist",subtitle_x,subtitle_y,4175,4316,true)
SUBTITLE_FX("•‚¢å³...”’‚¢–¶...”Ş—‚Í’§‚Ş",subtitle_x,subtitle_y,4175,4316)
SUBTITLE_FX("                         malice",subtitle_x,subtitle_y,4319,4586,true)
SUBTITLE_FX("–³œ”ß‚ÈX‚Ìˆ«ˆÓ‚Ö‚Æcc",subtitle_x,subtitle_y,4319,4586)

SUBTITLE_FX("                                                  story",subtitle_x,subtitle_y,6398,6545,true)
SUBTITLE_FX("o‰ï‚¢‚Ì”‚¾‚¯...Œq‚ª‚é–`Œ¯æc",subtitle_x,subtitle_y,6398,6545)
SUBTITLE_FX("      gust                             atelier",subtitle_x,subtitle_y,6557,6703,true,is_title=true)
SUBTITLE_FX("ˆêw‚Ì•—           ” ’ë",subtitle_x,subtitle_y,6557,6703,is_title=true)
SUBTITLE_FX("        ‚Éæ‚Á‚Ä...    ‚É“Í‚­‚¾‚ë‚¤c",subtitle_x,subtitle_y,6557,6703)
SUBTITLE_FX("                “Æ‚è",subtitle_x,subtitle_y,6715,6863,true)
SUBTITLE_FX("o‰ï‚¦‚é‚æ‰½‚©...||šjŒÄ...ŒÇ“Æ‚¶‚á‚È‚¢‚©‚çc",subtitle_x,subtitle_y-subtitle_size*2,6715,6863)
SUBTITLE_FX("            ‚İ‚¿",subtitle_x,subtitle_y-subtitle_size*2,6873,7147,true)
SUBTITLE_FX("¢“ï‚È“r‚Å‚à...¡“ú‚ªÅ’á‚Å‚à...||Î‚¤‚È‚ç‚«‚Á‚Æcc",subtitle_x,subtitle_y-subtitle_size*2,6873,7147)

SUBTITLE_FX("                                              ”Ş‚ç",subtitle_x,subtitle_y,7175,7340,true)
SUBTITLE_FX("\\‚â‚ª‚Ä‹¹‚ÉŠø‚ß‚­–`Œ¯Ò’B‚ÌŠè‚¢‚Í",subtitle_x,subtitle_y,7175,7340)
SUBTITLE_FX("—ƒ‚ğL‚°‚Ä¢ŠE‚ğ‰ô‚è",subtitle_x,subtitle_y,7343,7490)
SUBTITLE_FX("U‚ç‚Î‚éŠó–]‚ğW‚ß‘S‚Ä‚ğŠu‚Ä‚é–¶‚ğ",subtitle_x,subtitle_y,7491,7657)
SUBTITLE_FX("‚«•¥‚¤Œõ‰ğ‚«•ú‚Âcc",subtitle_x,subtitle_y,7663,7786)

SUBTITLE_FX("              ‚ä‚ß                    ‚Æ‚í",subtitle_x,subtitle_y,7822,8121,true)
SUBTITLE_FX("”’–é‚ÌŒ¶‘z‚Ì‚æ‚¤‚È‰i‰“‚ğ–a‚®•¨Œê",subtitle_x,subtitle_y,7822,8121)
SUBTITLE_FX("        edge               ash        ‚Ú‚­",subtitle_x,subtitle_y,8127,8268,true)
SUBTITLE_FX("•‚¢n...”’‚¢ŠD...‰^–½‚ÍŠÒ‚¦‚é",subtitle_x,subtitle_y,8127,8268)
SUBTITLE_FX("  ‚«‚İ                iris",subtitle_x,subtitle_y,8272,8549,true)
SUBTITLE_FX("—_‚Ì“µ‚Ì“øÊ‚Ö‚Æcc",subtitle_x,subtitle_y,8272,8549)

SUBTITLE_FX("""‘šŒ‚Í‚é‚©:"‚»‚ñ‚È‰ÌŒ‚Å‘åä•v‚©?"|Revo:"‘åä•v‚¾A–â‘è‚È‚¢"""",subtitle_x,subtitle_x,6557,6703)



function REPEAT_SUBTITLE(clip clip,int start_frame){
	clip=SUBTITLE_FX(clip,"Ich ergibst Fahneneid",subtitle_x,subtitle_x,start_frame-5,start_frame+66)
	clip=SUBTITLE_FX(clip,"das es wahr ist valchietus",subtitle_x,subtitle_x,start_frame+74,start_frame+145)
	clip=SUBTITLE_FX(clip,"Ich gieren! Ich morden!",subtitle_x,subtitle_x,start_frame+153,start_frame+226)
	clip=SUBTITLE_FX(clip,"Die er Eid gute Wahl Zeiten.",subtitle_x,subtitle_x,start_frame+232,start_frame+307)
	return clip
}

REPEAT_SUBTITLE(90)

REPEAT_SUBTITLE(8469)
SUBTITLE_FX("Ich ergibst Atelier",subtitle_x,subtitle_x,8780,8850)
SUBTITLE_FX("das es wahr ist Alchemie.",subtitle_x,subtitle_x,8859,8927)
SUBTITLE_FX("Ich gieren! Ich morden!",subtitle_x,subtitle_x,8938,9008)
SUBTITLE_FX("Die er Sie Morgen Schwarzwei3.",subtitle_x,subtitle_x,9017,9094)
SUBTITLE_FX("                            1",subtitle_x+eszett_assemble_13_offset,subtitle_x,9017,9094)



Dissolve(iris_no_atelier_grand_fantasm_op_00,ConvertToYV12(last),op_single_music_start_overlap)

SUBTITLE_FX("Die er Sie, kleine Schwarzwei3.",subtitle_x,subtitle_x,op_single_music_start+7,op_single_music_start+77)
SUBTITLE_FX("                             1",subtitle_x+eszett_assemble_13_offset,subtitle_x,op_single_music_start+7,op_single_music_start+77)



#thumbnail

######## Post Processing ########

ConvertToYV12()
#ConvertToYUY2()
#ConvertToRGB24()
