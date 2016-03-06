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



Import("..\..\..\avsi4comp\avsi4comp.avsi")

######## YouTube (640*480) ########

iris_no_atelier_grand_fantasm_op_360p=SSRC(ConvertToYUY2(FFMS2_VIDEO_SOURCE("src\iris_no_atelier-grand_fantasm-movie\youtube\Atelier Iris Grand Fantasm_OPENING.360p.mp4",fpsnum=30000,fpsden=1001)),48000)

iris_no_atelier_grand_fantasm_op_video=ConvertToYUY2(FFVideoSource("src\iris_no_atelier-grand_fantasm-movie\youtube\Atelier Iris Grand Fantasm_OPENING.DASH-480p.mp4",fpsnum=30000,fpsden=1001,seekmode=-1))
iris_no_atelier_grand_fantasm_op=AudioDub(iris_no_atelier_grand_fantasm_op_video,iris_no_atelier_grand_fantasm_op_360p)

iris_no_atelier_grand_fantasm_web_pv_01_youtube_360p=SSRC(ConvertToYUY2(FFMS2_VIDEO_SOURCE("src\iris_no_atelier-grand_fantasm-movie\youtube\Atelier Iris Grand Fantasm(PV) イリスのアトリエ グランファンタズム.360p.mp4")),48000)
iris_no_atelier_grand_fantasm_web_pv_01_youtube_360p=DeleteFrame(DeleteFrame(DeleteFrame(DeleteFrame(DeleteFrame(DeleteFrame(iris_no_atelier_grand_fantasm_web_pv_01_youtube_360p,6000),5001),4003),3001),2002),1001)

iris_no_atelier_grand_fantasm_web_pv_01_youtube_video=ConvertToYUY2(FFVideoSource("src\iris_no_atelier-grand_fantasm-movie\youtube\Atelier Iris Grand Fantasm(PV) イリスのアトリエ グランファンタズム.DASH-480p.mp4",fpsnum=30000,fpsden=1001,seekmode=-1),interlaced=true)
iris_no_atelier_grand_fantasm_web_pv_01_youtube=AudioDub(iris_no_atelier_grand_fantasm_web_pv_01_youtube_video,iris_no_atelier_grand_fantasm_web_pv_01_youtube_360p)

iris_no_atelier_grand_fantasm_web_pv_01_youtube_video_cache02=ConvertToYUY2(FFVideoSource("src\iris_no_atelier-grand_fantasm-movie\youtube\Atelier Iris Grand Fantasm(PV) イリスのアトリエ グランファンタズム.DASH-480p.mp4",fpsnum=30000,fpsden=1001,seekmode=-1),interlaced=true)
iris_no_atelier_grand_fantasm_web_pv_01_youtube_cache02=AudioDub(iris_no_atelier_grand_fantasm_web_pv_01_youtube_video_cache02,iris_no_atelier_grand_fantasm_web_pv_01_youtube_360p)

######## Official Web (320*240) ########

#iris_no_atelier_grand_fantasm_web_pv_01_path="src\iris_no_atelier-grand_fantasm-movie\official\movie\GF_webPV_01.wmv"
iris_no_atelier_grand_fantasm_web_pv_02_path="src\iris_no_atelier-grand_fantasm-movie\official\movie\PV_vol_2.wmv"

#iris_no_atelier_grand_fantasm_web_pv_01_path="src\iris_no_atelier-grand_fantasm-movie\official\movie\GF_webPV_01m.MP4"
#iris_no_atelier_grand_fantasm_web_pv_02_path="src\iris_no_atelier-grand_fantasm-movie\official\movie\PV_vol_2m.MP4"

iris_no_atelier_grand_fantasm_web_pv_01_path="src\iris_no_atelier-grand_fantasm-movie\official\movie\GF_webPV_01s.wmv"
#iris_no_atelier_grand_fantasm_web_pv_02_path="src\iris_no_atelier-grand_fantasm-movie\official\movie\PV_vol_2s.wmv"

iris_no_atelier_grand_fantasm_web_pv_01=SSRC(ConvertToYUY2(FFMS2_VIDEO_SOURCE(iris_no_atelier_grand_fantasm_web_pv_01_path,fpsnum=30000,fpsden=1001)),48000)
iris_no_atelier_grand_fantasm_web_pv_02=SSRC(ConvertToYUY2(FFMS2_VIDEO_SOURCE(iris_no_atelier_grand_fantasm_web_pv_02_path,fpsnum=30000,fpsden=1001),interlaced=true),48000)
iris_no_atelier_grand_fantasm_web_pv_02_cache02=SSRC(ConvertToYUY2(FFMS2_VIDEO_SOURCE(iris_no_atelier_grand_fantasm_web_pv_02_path,fpsnum=30000,fpsden=1001),interlaced=true),48000)

iris_no_atelier_grand_fantasm_web_pv_01=RESIZE_TO_REF_CLIP(iris_no_atelier_grand_fantasm_web_pv_01,iris_no_atelier_grand_fantasm_op)
#iris_no_atelier_grand_fantasm_web_pv_02=RESIZE_TO_REF_CLIP(iris_no_atelier_grand_fantasm_web_pv_02,iris_no_atelier_grand_fantasm_op)
#iris_no_atelier_grand_fantasm_web_pv_02_cache02=RESIZE_TO_REF_CLIP(iris_no_atelier_grand_fantasm_web_pv_02_cache02,iris_no_atelier_grand_fantasm_op)

iris_no_atelier_grand_fantasm_web_pv_01_cache02=iris_no_atelier_grand_fantasm_web_pv_01



iris_no_atelier_grand_fantasm_web_pv_01=iris_no_atelier_grand_fantasm_web_pv_01_youtube # overwrite with youtube version
iris_no_atelier_grand_fantasm_web_pv_01_cache02=iris_no_atelier_grand_fantasm_web_pv_01_youtube_cache02 # overwrite with youtube version

######## Trim ########

op_single_music_start=98
op_single_music_start_overlap=10

#iris_no_atelier_grand_fantasm_op_00=Trim(iris_no_atelier_grand_fantasm_op,0,op_single_music_start-1)
iris_no_atelier_grand_fantasm_op_00=Trim(iris_no_atelier_grand_fantasm_op,0,op_single_music_start-1+op_single_music_start_overlap)
iris_no_atelier_grand_fantasm_op_01=Trim(iris_no_atelier_grand_fantasm_op,op_single_music_start,1129)
iris_no_atelier_grand_fantasm_op_02=Trim(iris_no_atelier_grand_fantasm_op,1130,0)



iris_no_atelier_grand_fantasm_web_pv_01_01_rotating_book=Trim(iris_no_atelier_grand_fantasm_web_pv_01_cache02,0,1029) #1030
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
iris_no_atelier_grand_fantasm_web_pv_02_02_title=Trim(iris_no_atelier_grand_fantasm_web_pv_02,898,1030) #133
iris_no_atelier_grand_fantasm_web_pv_02_03_text=Trim(iris_no_atelier_grand_fantasm_web_pv_02,1031,1189) #159
iris_no_atelier_grand_fantasm_web_pv_02_04_1_game_play=Trim(iris_no_atelier_grand_fantasm_web_pv_02,1190,3260) #2071
iris_no_atelier_grand_fantasm_web_pv_02_04_2_op=Trim(iris_no_atelier_grand_fantasm_web_pv_02,3261,4168)
iris_no_atelier_grand_fantasm_web_pv_02_05_1_game_play=Trim(iris_no_atelier_grand_fantasm_web_pv_02_cache02,4169,4778) #610
iris_no_atelier_grand_fantasm_web_pv_02_05_2_bg=Trim(iris_no_atelier_grand_fantasm_web_pv_02,4779,4832) #54
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
iris_no_atelier_grand_fantasm_op_t06=Dissolve(iris_no_atelier_grand_fantasm_web_pv_02_05_1_game_play,TRIM_MIDDLE_CLIP(iris_no_atelier_grand_fantasm_web_pv_01_01_rotating_book,220+dissolve_length),dissolve_length)
iris_no_atelier_grand_fantasm_op_t07=iris_no_atelier_grand_fantasm_op_02



iris_no_atelier_grand_fantasm_op_mute=iris_no_atelier_grand_fantasm_op_t01+FADE_OUT_WITH_BRIGHTNESS_OFFSET(iris_no_atelier_grand_fantasm_op_t02,fade_length) \
	+iris_no_atelier_grand_fantasm_op_t03+iris_no_atelier_grand_fantasm_op_t04 \
	+Dissolve(iris_no_atelier_grand_fantasm_op_t05,FADE_OUT_WITH_BRIGHTNESS_OFFSET(iris_no_atelier_grand_fantasm_op_t06,fade_length),t05_t06_dissolve_length) \
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

SUBTITLE_FX("schwarzwei3 ～霧の向こうに繋がる世界～|    霜月はるか†Revo(Sound Horizon)|        - by fielia@AVISynth",subtitle_x,subtitle_y-subtitle_size*2,8775,9183,is_title=true)
SUBTITLE_FX("          1",subtitle_x+eszett_assemble_13_offset,subtitle_y-subtitle_size*2,8775,9183,is_title=true)



SUBTITLE_FX("光が欲しくて暗闇に手を伸ばす",subtitle_x,subtitle_y,391,695)
SUBTITLE_FX("目醒めを待っていたのは見知らぬ世界",subtitle_x,subtitle_y,708,995)

SUBTITLE_FX("――そして胸に揺らめく誰かの笑顔を",subtitle_x,subtitle_y,1008,1175)
SUBTITLE_FX("抱いたままに彷徨いながらも",subtitle_x,subtitle_y,1183,1333)
SUBTITLE_FX("進む男は行く手を遮る霧を",subtitle_x,subtitle_y,1339,1492)
SUBTITLE_FX("薙ぎ払う絆憶い出す……",subtitle_x,subtitle_y,1498,1622)

SUBTITLE_FX("              ゆめ",subtitle_x,subtitle_y,1656,1957,true)
SUBTITLE_FX("家路の幻像を描き空を越える物語",subtitle_x,subtitle_y,1656,1957)
SUBTITLE_FX("        night            breath",subtitle_x,subtitle_y,1962,2103,true)
SUBTITLE_FX("黒い宵...白い息...彼は詩う",subtitle_x,subtitle_y,1962,2103)
SUBTITLE_FX("                      Alice",subtitle_x,subtitle_y,2106,2373,true)
SUBTITLE_FX("無垢な蕾の愛娘へと……",subtitle_x,subtitle_y,2106,2373)

SUBTITLE_FX("想いを込めても言葉は時に無力で",subtitle_x,subtitle_y,2605,2905)
SUBTITLE_FX("行動した者だけが真実を掴む",subtitle_x,subtitle_y,2921,3212)

SUBTITLE_FX("――かくて胸に煌めく少女の決意は",subtitle_x,subtitle_y,3222,3389)
SUBTITLE_FX("櫂を手繰り彼方へ漕ぎ出し",subtitle_x,subtitle_y,3396,3545)
SUBTITLE_FX("虚像を映し相手を惑わす霧を",subtitle_x,subtitle_y,3553,3706)
SUBTITLE_FX("振り払う強さ手に入れる……",subtitle_x,subtitle_y,3712,3836)

SUBTITLE_FX("              ゆめ                  door",subtitle_x,subtitle_y,3869,4169,true)
SUBTITLE_FX("迷いの幻夢を抜ける扉を探す物語",subtitle_x,subtitle_y,3869,4169)
SUBTITLE_FX("        worm              mist",subtitle_x,subtitle_y,4175,4316,true)
SUBTITLE_FX("黒い蟲...白い霧...彼女は挑む",subtitle_x,subtitle_y,4175,4316)
SUBTITLE_FX("                         malice",subtitle_x,subtitle_y,4319,4586,true)
SUBTITLE_FX("無慈悲な森の悪意へと……",subtitle_x,subtitle_y,4319,4586)

SUBTITLE_FX("                                                  story",subtitle_x,subtitle_y,6398,6545,true)
SUBTITLE_FX("出会いの数だけ...繋がる冒険譚…",subtitle_x,subtitle_y,6398,6545)
SUBTITLE_FX("      gust                             atelier",subtitle_x,subtitle_y,6557,6703,true,is_title=true)
SUBTITLE_FX("一陣の風           箱庭",subtitle_x,subtitle_y,6557,6703,is_title=true)
SUBTITLE_FX("        に乗って...    に届くだろう…",subtitle_x,subtitle_y,6557,6703)
SUBTITLE_FX("                独り",subtitle_x,subtitle_y,6715,6863,true)
SUBTITLE_FX("出会えるよ何時か...||嗚呼...孤独じゃないから…",subtitle_x,subtitle_y-subtitle_size*2,6715,6863)
SUBTITLE_FX("            みち",subtitle_x,subtitle_y-subtitle_size*2,6873,7147,true)
SUBTITLE_FX("困難な途でも...今日が最低でも...||笑うならきっと……",subtitle_x,subtitle_y-subtitle_size*2,6873,7147)

SUBTITLE_FX("                                              彼ら",subtitle_x,subtitle_y,7175,7340,true)
SUBTITLE_FX("――やがて胸に旗めく冒険者達の願いは",subtitle_x,subtitle_y,7175,7340)
SUBTITLE_FX("翼を広げて世界を廻り",subtitle_x,subtitle_y,7343,7490)
SUBTITLE_FX("散らばる希望を集め全てを隔てる霧を",subtitle_x,subtitle_y,7491,7657)
SUBTITLE_FX("吹き払う光解き放つ……",subtitle_x,subtitle_y,7663,7786)

SUBTITLE_FX("              ゆめ                    とわ",subtitle_x,subtitle_y,7822,8121,true)
SUBTITLE_FX("白夜の幻想のような永遠を紡ぐ物語",subtitle_x,subtitle_y,7822,8121)
SUBTITLE_FX("        edge               ash        ぼく",subtitle_x,subtitle_y,8127,8268,true)
SUBTITLE_FX("黒い刃...白い灰...運命は還える",subtitle_x,subtitle_y,8127,8268)
SUBTITLE_FX("  きみ                iris",subtitle_x,subtitle_y,8272,8549,true)
SUBTITLE_FX("女神の瞳の虹彩へと……",subtitle_x,subtitle_y,8272,8549)

SUBTITLE_FX("""霜月はるか:"そんな歌詞で大丈夫か?"|Revo:"大丈夫だ、問題ない"""",subtitle_x,subtitle_x,6557,6703)



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



Dissolve(iris_no_atelier_grand_fantasm_op_00,ConvertToYUY2(last),op_single_music_start_overlap)

SUBTITLE_FX("Die er Sie, kleine Schwarzwei3.",subtitle_x,subtitle_x,op_single_music_start+7,op_single_music_start+77)
SUBTITLE_FX("                             1",subtitle_x+eszett_assemble_13_offset,subtitle_x,op_single_music_start+7,op_single_music_start+77)



#thumbnail

######## Post Processing ########

#### restore interlace ####
Bob(AssumeTFF())

ConvertToYV12()
#ConvertToYUY2()
#ConvertToRGB24()

TCPServer()
