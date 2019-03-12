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

Import("getsumento_heiki_miina-tv-common.avsi")

######## Function ########

### inherit start ###

LoadPlugin("..\plugins\MaskTools.dll")

function SUBTITLE_FX_FADE_IN_FADE_OUT_DOUBLE_HALO(clip clip,string text,int x,int y,int start_frame,int end_frame,int front_fade_count,int rear_fade_count,string "font",string "effects",int "size",int "text_color",int "halo_color",int "outside_halo_color",string "subtitle_mode"){
	before_start_frame=start_frame-front_fade_count
	after_end_frame=end_frame+rear_fade_count

	Assert(IsRGB32(clip),"SUBTITLE_FX_FADE_IN_FADE_OUT(): clip only support RGB32 format")

	subtitle_rgb=_SUBTITLE_FX_PRE_OPAQUE(clip,outside_halo_color,text,x,y,before_start_frame,after_end_frame,font,effects,size,text_color,halo_color,subtitle_mode)
	subtitle_rgba=ColorKeyMask(ResetMask(subtitle_rgb),outside_halo_color,0)

	subtitle_alpha=ConvertToYV12(ShowAlpha(subtitle_rgba),matrix="Rec709")
	subtitle_alpha=Expand(Expand(subtitle_alpha))
	subtitle_alpha=ConvertToRGB32(Greyscale(subtitle_alpha),matrix="Rec709")

	subtitle_rgba=Mask(subtitle_rgba,subtitle_alpha)

	subtitle_rgba_faded_containing_parameter=ScriptClip(subtitle_rgba,"RGBAdjust(a=alpha_factor)")
	subtitle_rgba_faded=FrameEvaluate(subtitle_rgba_faded_containing_parameter,"alpha_factor=Spline(current_frame,"+String(before_start_frame)+",0.0,"+String(start_frame)+",1.0,"+String(end_frame)+",1.0,"+String(after_end_frame)+",0.0,cubic=false)")

	return _SUBTITLE_FX_POST(clip,subtitle_rgba_faded,before_start_frame,after_end_frame)
}

### inherit end ###

function OVERLAY_AUDIO_ANALYSIS(clip clip){
	audio_analysis=Histogram(clip,"Stereo")
	size=MIN_(Width(clip),Height(clip))
	audio_analysis=Lanczos4Resize(audio_analysis,size,size)
	audio_analysis_rgb24=ConvertToRGB24(audio_analysis,matrix="Rec601")
	return Overlay(clip,audio_analysis_rgb24,x=(Width(clip)-Width(audio_analysis))/2,y=(Height(clip)-Height(audio_analysis))/2,mode="Add",pc_range=true)
}

function MOVE_CG(clip cg,int dir_x,int dir_y,float move_offset,float scale){
	cg_frame_count=Framecount(cg)
	cg_width_half=Width(cg)/2
	cg_height_half=Height(cg)/2
	move_offset_half=move_offset*0.5

	return ScriptClip(cg,"FAST_ZOOM(dstx=Spline(current_frame,0,"+String(cg_width_half)+"-("+String(move_offset_half)+"*("+String(dir_x)+")),"+String(cg_frame_count)+","+String(cg_width_half)+"+("+String(move_offset_half)+"*("+String(dir_x)+")),cubic=false)," \
		+"dsty=Spline(current_frame,0,"+String(cg_height_half)+"-("+String(move_offset_half)+"*("+String(dir_y)+")),"+String(cg_frame_count)+","+String(cg_height_half)+"+("+String(move_offset_half)+"*("+String(dir_y)+")),cubic=false),factor="+String(scale)+",extend=true)")
}

######## Pre Combine ########

fade_length=15

######## Combine ########

# getsumento_heiki_miina_tv_clean_ed_normal_verx_01 4
# getsumento_heiki_miina_tv_clean_ed_normal_verx_02 1064/2807/4202
# getsumento_heiki_miina_tv_clean_ed_normal_verx_03 1412/3155/4550
# getsumento_heiki_miina_tv_clean_ed_normal_verx_04 1584/3327/4722/5420

# getsumento_heiki_miina_tv_clean_ed_last_01 1768/3163
# getsumento_heiki_miina_tv_clean_ed_last_02 2123/3518
# getsumento_heiki_miina_tv_clean_ed_last_03 2779/4174
# getsumento_heiki_miina_tv_clean_ed_last_04 5530



getsumento_heiki_miina_tv_ed_t01=BlankClip(getsumento_heiki_miina_tv_clean_ed_normal_ver1,length=4,color=color_black)+getsumento_heiki_miina_tv_clean_ed_normal_ver1_01
getsumento_heiki_miina_tv_ed_t02=getsumento_heiki_miina_tv_clean_ed_normal_ver1_02+TRIM_LAST_CLIP(getsumento_heiki_miina_tv_01_tsukishiro_miina_cannot_control_flying,172)+TRIM_MIDDLE_CLIP(getsumento_heiki_miina_tv_10_shiwasu_miina_announce,160)
getsumento_heiki_miina_tv_ed_t03=TRIM_FIRST_CLIP(getsumento_heiki_miina_tv_08_tsukishiro_miina_figure,24)+getsumento_heiki_miina_tv_clean_ed_last_01

getsumento_heiki_miina_tv_ed_t04=getsumento_heiki_miina_tv_clean_ed_last_02+getsumento_heiki_miina_tv_clean_ed_last_03+TRIM_FIRST_CLIP(getsumento_heiki_miina_tv_08_tsukishiro_miina_fly_high,51)
getsumento_heiki_miina_tv_ed_t05=TRIM_FIRST_CLIP(getsumento_heiki_miina_tv_05_cherry_missile,33)+TRIM_MIDDLE_CLIP(getsumento_heiki_miina_tv_06_hazemi_kanchi_see_hazemi_nakoru_under_sunset,141)+TRIM_MIDDLE_CLIP(getsumento_heiki_miina_tv_06_tsukishiro_miina_use_carrot_torpedo,33)+TRIM_MIDDLE_CLIP(getsumento_heiki_miina_tv_04_mutsumune_escartin_lie_on_bed,141)

getsumento_heiki_miina_tv_ed_t06=TRIM_FIRST_CLIP(getsumento_heiki_miina_tv_03_hazemi_nakoru_cheer_01,33)+TRIM_MIDDLE_CLIP(getsumento_heiki_miina_tv_09_ootsuki_tsukishiro_tamamushi_minaduki_miina_see_alien,87)+TRIM_LAST_CLIP(getsumento_heiki_miina_tv_09_tamamushi_minaduki_satsuki_miina_and_alien_in_space,88)+TRIM_MIDDLE_CLIP(getsumento_heiki_miina_tv_03_shiodome_suisan_cheerleading_hover_03,87)+FADE_OUT_WITH_BRIGHTNESS_OFFSET(TRIM_LAST_CLIP(getsumento_heiki_miina_tv_11_all_miina_appear_in_front_of_moon,71),fade_length)

getsumento_heiki_miina_tv_ed_t07=getsumento_heiki_miina_tv_clean_ed_normal_ver2_02+getsumento_heiki_miina_tv_clean_ed_normal_ver1_03+FADE_OUT_WITH_BRIGHTNESS_OFFSET(getsumento_heiki_miina_tv_clean_ed_normal_ver1_04,fade_length)+TRIM_MIDDLE_CLIP(getsumento_heiki_miina_tv_10_nishiwa_sumire_call_fleet,30)+TRIM_FIRST_CLIP(getsumento_heiki_miina_tv_07_spoluna_entry_02,87)+TRIM_LAST_CLIP(getsumento_heiki_miina_tv_02_tsukishiro_miina_win,76)
getsumento_heiki_miina_tv_ed_t08=TRIM_MIDDLE_CLIP(getsumento_heiki_miina_tv_05_takanashi_yuu_cute,55)+TRIM_LAST_CLIP(getsumento_heiki_miina_tv_11_sanae_tsutsuzi_transform_to_satsuki_miina_and_fly_toward_sky,87)+TRIM_FIRST_CLIP(getsumento_heiki_miina_tv_07_tsukishiro_miina_use_carrot_missile,76)+TRIM_MIDDLE_CLIP(getsumento_heiki_miina_tv_04_ootsuki_miina_see_rainbow_bridge,59)+getsumento_heiki_miina_tv_clean_ed_last_04+BlankClip(getsumento_heiki_miina_tv_clean_ed_normal_ver1,length=24*3,color=color_black)



getsumento_heiki_miina_tv_ed_mute=getsumento_heiki_miina_tv_ed_t01+getsumento_heiki_miina_tv_ed_t02+getsumento_heiki_miina_tv_ed_t03 \
	+getsumento_heiki_miina_tv_ed_t04+getsumento_heiki_miina_tv_ed_t05 \
	+getsumento_heiki_miina_tv_ed_t06 \
	+getsumento_heiki_miina_tv_ed_t07+getsumento_heiki_miina_tv_ed_t08

######## Music Analysis ########

### inherit start ###
 
bgm_path="src\getsumento_heiki_miina-ed-01.wav"

### inherit end ###

bgm_44khz=WAVSource(bgm_path)
AudioDub(getsumento_heiki_miina_tv_ed_mute,bgm_44khz)
#APPLY_RANGE(1064,4201,"OVERLAY_AUDIO_ANALYSIS()")
APPLY_RANGE(1064,5772,"OVERLAY_AUDIO_ANALYSIS()")

### export clip: getsumento_heiki_miina_tv_ed_mute

### prefetch: 5,2

### ###

######## Subtitle ########

### inherit start ###

#global subtitle_heavy_halo_width=1
global subtitle_clip_width=1920
global subtitle_clip_height=1080

subtitle_x=50*2.25
#subtitle_y=395*2.25
subtitle_y=390*2.25
global subtitle_front_fade_count=12
global subtitle_rear_fade_count=12
global subtitle_font="MS Gothic"
global subtitle_effects="b"
#global subtitle_size=32*2.25
global subtitle_size=35*2.25
global subtitle_text_color=color_white
global subtitle_halo_color=color_black
global subtitle_outside_halo_color=color_orange

function EXTEND_ONE_FRAME(clip clip){
	return clip+BlankClip(clip,length=1,color=color_black)
}

function UNDO_EXTEND_ONE_FRAME(clip clip){
	return Trim(clip,0,Framecount(clip)-2)
}

function SUBTITLE_FX(clip clip,string text,float x,float y,int start_frame,int end_frame,bool "is_furigana",bool "is_title"){
	is_title=Default(is_title,false)
	is_furigana=Default(is_furigana,false)

	text_color=is_title?OVERWRITE_SUBTITLE_COLOR_ALPHA(subtitle_outside_halo_color,$FF):subtitle_text_color
	halo_color=is_title?OVERWRITE_SUBTITLE_COLOR_ALPHA(subtitle_text_color,$FF):subtitle_halo_color
	outside_halo_color=is_title?OVERWRITE_SUBTITLE_COLOR_ALPHA(subtitle_halo_color,$FF):subtitle_outside_halo_color

	subtitle_mode=is_furigana?"ex":"ex_thick_reduce_memory"
	size=is_furigana?subtitle_size*0.5:subtitle_size
	y=is_furigana?y-size:y

	return SUBTITLE_FX_FADE_IN_FADE_OUT_DOUBLE_HALO(clip,text,Round(x),Round(y),start_frame,end_frame,subtitle_front_fade_count,subtitle_rear_fade_count,subtitle_font,subtitle_effects,Round(size),text_color,halo_color,outside_halo_color,subtitle_mode)
}

### inherit end ###

ConvertToRGB32(matrix="Rec709")

SUBTITLE_FX("ゆめ",subtitle_x,subtitle_y-subtitle_size*2,9,98,true)
SUBTITLE_FX("夢みたいなことがしたくて",subtitle_x,subtitle_y-subtitle_size*2,9,98)
SUBTITLE_FX("                                     ひ  び",subtitle_x,subtitle_y,96,184,true)
SUBTITLE_FX("だけどなんとなくの日々に",subtitle_x,subtitle_y,96,184)
SUBTITLE_FX("さようなら はじめよう",subtitle_x,subtitle_y-subtitle_size*2,184,272)
SUBTITLE_FX("ぼく    つく",subtitle_x,subtitle_y,271,341,true)
SUBTITLE_FX("僕の作るストーリー",subtitle_x,subtitle_y,271,341)

SUBTITLE_FX("ゆう き      だ            ふ",subtitle_x,subtitle_y-subtitle_size*2,385,539,true)
SUBTITLE_FX("勇気を出して 触れてみてごらんよ",subtitle_x,subtitle_y-subtitle_size*2,385,539)
SUBTITLE_FX(" せ かい     い がい      ひろ",subtitle_x,subtitle_y,559,761,true)
SUBTITLE_FX("世界は意外と 広いものだから いつか",subtitle_x,subtitle_y,559,761)
SUBTITLE_FX("                    ゆめ                   ひ                   しん",subtitle_x,subtitle_y-subtitle_size*2,767,1034,true)
SUBTITLE_FX("かなえたい夢が かなう日がくると 信じていて",subtitle_x,subtitle_y-subtitle_size*2,767,1034)

SUBTITLE_FX("                        げんじつ    いま",subtitle_x,subtitle_y,1056,1144,true)
SUBTITLE_FX("うそみたいな現実を今",subtitle_x,subtitle_y,1056,1144)
SUBTITLE_FX(" い",subtitle_x,subtitle_y-subtitle_size*2,1143,1230,true)
SUBTITLE_FX("生きてるキミのように",subtitle_x,subtitle_y-subtitle_size*2,1143,1230)
SUBTITLE_FX("なりたくて あこがれた",subtitle_x,subtitle_y,1230,1319)
SUBTITLE_FX("            まぶ     す",subtitle_x,subtitle_y-subtitle_size*2,1318,1386,true)
SUBTITLE_FX("キミは眩し過ぎた",subtitle_x,subtitle_y-subtitle_size*2,1318,1386)

SUBTITLE_FX("ゆめ",subtitle_x,subtitle_y,1404,1494,true)
SUBTITLE_FX("夢みたいなことがしたくて",subtitle_x,subtitle_y,1404,1494)
SUBTITLE_FX("                                     ひ  び",subtitle_x,subtitle_y-subtitle_size*2,1491,1576,true)
SUBTITLE_FX("だけどなんとなくの日々に",subtitle_x,subtitle_y-subtitle_size*2,1491,1576)
SUBTITLE_FX("さようなら はじめよう",subtitle_x,subtitle_y,1579,1666)
SUBTITLE_FX("ぼく    つく",subtitle_x,subtitle_y-subtitle_size*2,1666,1737,true)
SUBTITLE_FX("僕の作るストーリー",subtitle_x,subtitle_y-subtitle_size*2,1666,1737)

SUBTITLE_FX(" お                   ぼく",subtitle_x,subtitle_y,1737,2038,true)
SUBTITLE_FX("終わらない 僕のストーリー",subtitle_x,subtitle_y,1737,2038)

SUBTITLE_FX("ゆう き      だ",subtitle_x,subtitle_y-subtitle_size*2,2128,2280,true)
SUBTITLE_FX("勇気を出して はじめてごらんよ",subtitle_x,subtitle_y-subtitle_size*2,2128,2280)
SUBTITLE_FX("ひと     い がい      つよ",subtitle_x,subtitle_y,2302,2512,true)
SUBTITLE_FX("人は意外と 強いものだから いつか",subtitle_x,subtitle_y,2302,2512)
SUBTITLE_FX("                    ゆめ                   ひ      く           しん",subtitle_x,subtitle_y-subtitle_size*2,2511,2776,true)
SUBTITLE_FX("かなえたい夢が かなう日が来ると 信じていて",subtitle_x,subtitle_y-subtitle_size*2,2511,2776)

### pass clip: getsumento_heiki_miina_tv_ed_mute

### prefetch: 5,2

### ###

SUBTITLE_FX("                        げんじつ    いま",subtitle_x,subtitle_y,2800,2888,true)
SUBTITLE_FX("うそみたいな現実を今",subtitle_x,subtitle_y,2800,2888)
SUBTITLE_FX(" い",subtitle_x,subtitle_y-subtitle_size*2,2887,2974,true)
SUBTITLE_FX("生きてるキミのように",subtitle_x,subtitle_y-subtitle_size*2,2887,2974)
SUBTITLE_FX("なりたくて あこがれた",subtitle_x,subtitle_y,2974,3062)
SUBTITLE_FX("            まぶ     す",subtitle_x,subtitle_y-subtitle_size*2,3061,3129,true)
SUBTITLE_FX("キミは眩し過ぎた",subtitle_x,subtitle_y-subtitle_size*2,3061,3129)
SUBTITLE_FX("ゆめ",subtitle_x,subtitle_y,3148,3236,true)
SUBTITLE_FX("夢みたいなことがしたくて",subtitle_x,subtitle_y,3148,3236)
SUBTITLE_FX("                                     ひ  び",subtitle_x,subtitle_y-subtitle_size*2,3235,3320,true)
SUBTITLE_FX("だけどなんとなくの日々に",subtitle_x,subtitle_y-subtitle_size*2,3235,3320)
SUBTITLE_FX("さようなら はじめよう",subtitle_x,subtitle_y,3322,3410)
SUBTITLE_FX("ぼく    つく",subtitle_x,subtitle_y-subtitle_size*2,3410,3481,true)
SUBTITLE_FX("僕の作るストーリー",subtitle_x,subtitle_y-subtitle_size*2,3410,3481)

SUBTITLE_FX(" お                   ぼく",subtitle_x,subtitle_y,3480,3777,true)
SUBTITLE_FX("終わらない 僕のストーリー",subtitle_x,subtitle_y,3480,3777)
SUBTITLE_FX("ビューティフル・ストーリー",subtitle_x,subtitle_y,3829,3943)

SUBTITLE_FX("                        げんじつ    いま",subtitle_x,subtitle_y,4194,4283,true)
SUBTITLE_FX("うそみたいな現実を今",subtitle_x,subtitle_y,4194,4283)
SUBTITLE_FX(" い",subtitle_x,subtitle_y-subtitle_size*2,4281,4368,true)
SUBTITLE_FX("生きてるキミのように",subtitle_x,subtitle_y-subtitle_size*2,4281,4368)
SUBTITLE_FX("なりたくて あこがれた",subtitle_x,subtitle_y,4368,4457)
SUBTITLE_FX("            まぶ     す",subtitle_x,subtitle_y-subtitle_size*2,4456,4524,true)
SUBTITLE_FX("キミは眩し過ぎた",subtitle_x,subtitle_y-subtitle_size*2,4456,4524)

SUBTITLE_FX("ゆめ",subtitle_x,subtitle_y,4543,4632,true)
SUBTITLE_FX("夢みたいなことがしたくて",subtitle_x,subtitle_y,4543,4632)
SUBTITLE_FX("                                     ひ  び",subtitle_x,subtitle_y-subtitle_size*2,4631,4717,true)
SUBTITLE_FX("だけどなんとなくの日々に",subtitle_x,subtitle_y-subtitle_size*2,4631,4717)
SUBTITLE_FX("さようなら はじめよう",subtitle_x,subtitle_y,4717,4805)
SUBTITLE_FX("ぼく    つく",subtitle_x,subtitle_y-subtitle_size*2,4805,4873,true)
SUBTITLE_FX("僕の作るストーリー",subtitle_x,subtitle_y-subtitle_size*2,4805,4873)

SUBTITLE_FX(" お                   ぼく",subtitle_x,subtitle_y,4876,5173,true)
SUBTITLE_FX("終わらない 僕のストーリー",subtitle_x,subtitle_y,4876,5173)

SUBTITLE_FX("                                  ゆめ",subtitle_x,subtitle_y,5246,5384,true)
SUBTITLE_FX("いつか かなえたい夢が",subtitle_x,subtitle_y,5246,5384)
SUBTITLE_FX("             ひ      く           しん",subtitle_x,subtitle_y-subtitle_size*2,5388,5564,true)
SUBTITLE_FX("かなう日が来ると 信じていて",subtitle_x,subtitle_y-subtitle_size*2,5388,5564)

#SUBTITLE_FX("ビューティフル・ストーリー",subtitle_x,subtitle_y,5574,5690)

#SUBTITLE_FX("ビューティフル・ストーリー//井上麻里奈  |                            中田ヤスタカ|- by fielia@AVISynth",-subtitle_x,subtitle_x,5544,5741,is_title=true)
SUBTITLE_FX("- by fielia@AVISynth||ビューティフル・ストーリー//井上麻里奈  |                            中田ヤスタカ",-subtitle_x,subtitle_y-subtitle_size*3,5574,5741,is_title=true)

######## Post Combine ########

getsumento_heiki_miina_tv_ed_pre_length=5
getsumento_heiki_miina_tv_ed_pre=BlankClip(last,length=getsumento_heiki_miina_tv_ed_pre_length,color=color_black)
getsumento_heiki_miina_tv_ed_pre=EXTEND_ONE_FRAME(getsumento_heiki_miina_tv_ed_pre)
getsumento_heiki_miina_tv_ed_pre=SUBTITLE_FX(getsumento_heiki_miina_tv_ed_pre,"ゆめ",subtitle_x,subtitle_y-subtitle_size*2,getsumento_heiki_miina_tv_ed_pre_length+9,getsumento_heiki_miina_tv_ed_pre_length+98,true)
getsumento_heiki_miina_tv_ed_pre=SUBTITLE_FX(getsumento_heiki_miina_tv_ed_pre,"夢みたいなことがしたくて",subtitle_x,subtitle_y-subtitle_size*2,getsumento_heiki_miina_tv_ed_pre_length+9,getsumento_heiki_miina_tv_ed_pre_length+98)
getsumento_heiki_miina_tv_ed_pre=UNDO_EXTEND_ONE_FRAME(getsumento_heiki_miina_tv_ed_pre)

######## Thumbnail ########

is_thumbnail=false

is_thumbnail?ConvertToRGB32(getsumento_heiki_miina_tv_ed_mute,matrix="Rec709"):last

######## Music ########

bgm_48khz=SSRC(WAVSource(bgm_path),48000)
AudioDub(bgm_48khz)



thumbnail=Trim(316,-24*5)
#thumbnail=Trim(5544,-24*5)



AUDIO_DUB_TONE(getsumento_heiki_miina_tv_ed_pre,samplerate=48000,channels=2,type="Silence")++last



is_thumbnail?thumbnail:last

""")

######## Post Processing ########

ConvertToYV12(matrix="Rec709")
#ConvertToYUY2(matrix="Rec709")
#ConvertToRGB24()

#ConvertAudioTo8bit()
#ConvertAudioTo16bit()
ConvertAudioTo24bit()
#ConvertAudioTo32bit()
#ConvertAudioToFloat()

TCPServer()
