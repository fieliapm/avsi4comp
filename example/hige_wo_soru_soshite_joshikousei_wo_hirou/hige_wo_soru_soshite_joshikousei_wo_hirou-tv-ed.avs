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

Import("hige_wo_soru_soshite_joshikousei_wo_hirou-tv-common.avsi")

######## Function ########

### inherit start ###

LoadPlugin("..\plugins\MaskTools.dll")

function SUBTITLE_FX_FADE_IN_FADE_OUT_DOUBLE_HALO(clip clip,string text,int x,int y,int start_frame,int end_frame,int front_fade_count,int rear_fade_count,string "font",string "effects",int "size",int "text_color",int "halo_color",int "outside_halo_color",string "subtitle_mode"){
	before_start_frame=start_frame-front_fade_count
	after_end_frame=end_frame+rear_fade_count

	Assert(IsRGB32(clip),"SUBTITLE_FX_FADE_IN_FADE_OUT_DOUBLE_HALO(): clip only support RGB32 format")

	subtitle_rgb=_SUBTITLE_FX_PRE_OPAQUE(clip,outside_halo_color,text,x,y,before_start_frame,after_end_frame,font,effects,size,text_color,halo_color,subtitle_mode)
	subtitle_rgba=ColorKeyMask(ResetMask(subtitle_rgb),outside_halo_color,0)

	subtitle_alpha=CONVERT_BACK_TO_YV12(ShowAlpha(subtitle_rgba),matrix="Rec709")
	subtitle_alpha=Expand(Expand(Expand(subtitle_alpha)))
	subtitle_alpha=ConvertToRGB32(Greyscale(subtitle_alpha),matrix="Rec709")

	subtitle_rgba=Mask(subtitle_rgba,subtitle_alpha)

	subtitle_rgba_faded_containing_parameter=ScriptClip(subtitle_rgba,"RGBAdjust(a=alpha_factor)")
	subtitle_rgba_faded=FrameEvaluate(subtitle_rgba_faded_containing_parameter,"alpha_factor=Spline(current_frame,"+String(before_start_frame)+",0.0,"+String(start_frame)+",1.0,"+String(end_frame)+",1.0,"+String(after_end_frame)+",0.0,cubic=false)")

	return _SUBTITLE_FX_POST(clip,subtitle_rgba_faded,before_start_frame,after_end_frame)
}

### inherit end ###

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



global pencil_filter_matrix01="
0 1 0 0 0
-1 0 2 0 0
0 -2 2 2 0
0 0 -2 0 1
0 0 0 -1 0
"

global pencil_filter_matrix02="
0 -1 0 0 0
1 0 2 0 0
0 -2 2 2 0
0 0 -2 0 -1
0 0 0 1 0
"

function PENCIL_FILTER(clip clip,int index){
	return GeneralConvolution(clip,0,matrix=index%2==0?pencil_filter_matrix01:pencil_filter_matrix02)
}

function MULTIPASS_PENCIL_FILTER(clip clip,int count){
	return count>0?MULTIPASS_PENCIL_FILTER(PENCIL_FILTER(clip,count),count-1):clip
}

function MULTIPASS_PENCIL_FILTER_DEFAULT(clip clip){
	clip=ConvertToRGB32(clip,matrix="Rec709")
	clip=MULTIPASS_PENCIL_FILTER(clip,2)
	clip=CONVERT_BACK_TO_YV12(clip,matrix="Rec709")
	BRIGHTNESS_OFFSET(clip,0.25)
}

function MULTIPASS_BLUR(clip clip,int count){
	return count>0?MULTIPASS_BLUR(Blur(clip,1.0),count-1):clip
}

######## Pre Combine ########

fade_length=12

######## Combine ########

# hige_wo_soru_soshite_joshikousei_wo_hirou_tv_clean_ed_00 1
# hige_wo_soru_soshite_joshikousei_wo_hirou_tv_clean_ed_01 163/1921 (wake up 435/2193)
# hige_wo_soru_soshite_joshikousei_wo_hirou_tv_clean_ed_02 982/2740
# hige_wo_soru_soshite_joshikousei_wo_hirou_tv_clean_ed_03 1355/3113/4526/5146



### inherit start ###

ed_start=163

### inherit end ###

hige_wo_soru_soshite_joshikousei_wo_hirou_tv_ed_t01=BlankClip(hige_wo_soru_soshite_joshikousei_wo_hirou_tv_clean_ed,length=ed_start,color=color_black)+hige_wo_soru_soshite_joshikousei_wo_hirou_tv_clean_ed_01+hige_wo_soru_soshite_joshikousei_wo_hirou_tv_clean_ed_02
hige_wo_soru_soshite_joshikousei_wo_hirou_tv_ed_t02=MOVE_CG(STILL_MIDDLE_FRAME(MULTIPASS_PENCIL_FILTER_DEFAULT(hige_wo_soru_soshite_joshikousei_wo_hirou_tv_08_sayu_watch_yoshida_01),272),1,0,Width(hige_wo_soru_soshite_joshikousei_wo_hirou_tv_clean_ed)/10.0,1.1)+MOVE_CG(STILL_MIDDLE_FRAME(MULTIPASS_PENCIL_FILTER_DEFAULT(hige_wo_soru_soshite_joshikousei_wo_hirou_tv_08_yoshida_watch_sayu_01),150),1,0,Width(hige_wo_soru_soshite_joshikousei_wo_hirou_tv_clean_ed)/10.0,1.1)+MOVE_CG(STILL_FIRST_FRAME(MULTIPASS_PENCIL_FILTER_DEFAULT(hige_wo_soru_soshite_joshikousei_wo_hirou_tv_08_yoshida_grab_sayu_s_arm),144),-1,0,Width(hige_wo_soru_soshite_joshikousei_wo_hirou_tv_clean_ed)/10.0,1.1)

hige_wo_soru_soshite_joshikousei_wo_hirou_tv_ed_t03=STILL_FIRST_FRAME(hige_wo_soru_soshite_joshikousei_wo_hirou_tv_13_op_07,272)
#hige_wo_soru_soshite_joshikousei_wo_hirou_tv_ed_t032=TRIM_FIRST_CLIP(hige_wo_soru_soshite_joshikousei_wo_hirou_tv_clean_ed_01,272)
#hige_wo_soru_soshite_joshikousei_wo_hirou_tv_ed_t03=Merge(hige_wo_soru_soshite_joshikousei_wo_hirou_tv_ed_t03,hige_wo_soru_soshite_joshikousei_wo_hirou_tv_ed_t032)

hige_wo_soru_soshite_joshikousei_wo_hirou_tv_ed_t04=MOVE_CG(STILL_FIRST_FRAME(hige_wo_soru_soshite_joshikousei_wo_hirou_tv_13_op_01,132),1,0,Width(hige_wo_soru_soshite_joshikousei_wo_hirou_tv_clean_ed)/10.0,1.1)+MOVE_CG(STILL_FIRST_FRAME(hige_wo_soru_soshite_joshikousei_wo_hirou_tv_13_op_02,203),0,1,Height(hige_wo_soru_soshite_joshikousei_wo_hirou_tv_clean_ed)/10.0,1.1)+MOVE_CG(STILL_FIRST_FRAME(hige_wo_soru_soshite_joshikousei_wo_hirou_tv_13_op_03,212),-1,0,Width(hige_wo_soru_soshite_joshikousei_wo_hirou_tv_clean_ed)/10.0,1.1)
#hige_wo_soru_soshite_joshikousei_wo_hirou_tv_ed_t042=Trim(hige_wo_soru_soshite_joshikousei_wo_hirou_tv_clean_ed_01,272,0)
#hige_wo_soru_soshite_joshikousei_wo_hirou_tv_ed_t04=Merge(hige_wo_soru_soshite_joshikousei_wo_hirou_tv_ed_t04,hige_wo_soru_soshite_joshikousei_wo_hirou_tv_ed_t042)
hige_wo_soru_soshite_joshikousei_wo_hirou_tv_ed_t05=STILL_FIRST_FRAME(hige_wo_soru_soshite_joshikousei_wo_hirou_tv_13_op_04,144)+STILL_FIRST_FRAME(hige_wo_soru_soshite_joshikousei_wo_hirou_tv_13_op_05,135)+STILL_FIRST_FRAME(hige_wo_soru_soshite_joshikousei_wo_hirou_tv_13_op_08,94)
#hige_wo_soru_soshite_joshikousei_wo_hirou_tv_ed_t052=hige_wo_soru_soshite_joshikousei_wo_hirou_tv_clean_ed_02
#hige_wo_soru_soshite_joshikousei_wo_hirou_tv_ed_t05=Merge(hige_wo_soru_soshite_joshikousei_wo_hirou_tv_ed_t05,hige_wo_soru_soshite_joshikousei_wo_hirou_tv_ed_t052)
hige_wo_soru_soshite_joshikousei_wo_hirou_tv_ed_t06=MOVE_CG(STILL_FIRST_FRAME(MULTIPASS_PENCIL_FILTER_DEFAULT(hige_wo_soru_soshite_joshikousei_wo_hirou_tv_13_sayu_s_embarassed_face),272),1,0,Width(hige_wo_soru_soshite_joshikousei_wo_hirou_tv_clean_ed)/10.0,1.1)+MOVE_CG(STILL_LAST_FRAME(MULTIPASS_PENCIL_FILTER_DEFAULT(hige_wo_soru_soshite_joshikousei_wo_hirou_tv_13_yoshida_s_embarassed_face),150),-1,0,Width(hige_wo_soru_soshite_joshikousei_wo_hirou_tv_clean_ed)/10.0,1.1)+TRIM_MIDDLE_CLIP(MULTIPASS_PENCIL_FILTER_DEFAULT(hige_wo_soru_soshite_joshikousei_wo_hirou_tv_12_sayu_lean_on_yoshida_and_see_star_01),144)

hige_wo_soru_soshite_joshikousei_wo_hirou_tv_ed_t07=STILL_FIRST_FRAME(hige_wo_soru_soshite_joshikousei_wo_hirou_tv_13_op_06,272)

hige_wo_soru_soshite_joshikousei_wo_hirou_tv_ed_t08=MOVE_CG(STILL_FIRST_FRAME(hige_wo_soru_soshite_joshikousei_wo_hirou_tv_13_op_09,278),0,-1,Height(hige_wo_soru_soshite_joshikousei_wo_hirou_tv_clean_ed)/10.0,1.1)+MOVE_CG(STILL_FIRST_FRAME(hige_wo_soru_soshite_joshikousei_wo_hirou_tv_13_op_10,297),0,1,Height(hige_wo_soru_soshite_joshikousei_wo_hirou_tv_clean_ed)/10.0,1.1)
hige_wo_soru_soshite_joshikousei_wo_hirou_tv_ed_t09=MOVE_CG(STILL_LAST_FRAME(MULTIPASS_PENCIL_FILTER_DEFAULT(hige_wo_soru_soshite_joshikousei_wo_hirou_tv_13_sayu_hug_yoshida),272),0,-1,Height(hige_wo_soru_soshite_joshikousei_wo_hirou_tv_clean_ed)/10.0,1.1)+MOVE_CG(STILL_LAST_FRAME(MULTIPASS_PENCIL_FILTER_DEFAULT(hige_wo_soru_soshite_joshikousei_wo_hirou_tv_13_sayu_stand_by_yoshida_s_side),150),1,0,Width(hige_wo_soru_soshite_joshikousei_wo_hirou_tv_clean_ed)/10.0,1.1)+SCALE_CG(FADE_OUT_WITH_BRIGHTNESS_OFFSET(STILL_MIDDLE_FRAME(MULTIPASS_PENCIL_FILTER_DEFAULT(hige_wo_soru_soshite_joshikousei_wo_hirou_tv_12_sayu_lean_on_yoshida),198),fade_length),0.5*Width(hige_wo_soru_soshite_joshikousei_wo_hirou_tv_clean_ed),0.5*Height(hige_wo_soru_soshite_joshikousei_wo_hirou_tv_clean_ed),1.0,1.2)

hige_wo_soru_soshite_joshikousei_wo_hirou_tv_ed_t10=hige_wo_soru_soshite_joshikousei_wo_hirou_tv_clean_ed_03+BlankClip(hige_wo_soru_soshite_joshikousei_wo_hirou_tv_clean_ed,length=24*3,color=color_black)



hige_wo_soru_soshite_joshikousei_wo_hirou_tv_ed_mute=hige_wo_soru_soshite_joshikousei_wo_hirou_tv_ed_t01+hige_wo_soru_soshite_joshikousei_wo_hirou_tv_ed_t02+hige_wo_soru_soshite_joshikousei_wo_hirou_tv_ed_t03 \
	+hige_wo_soru_soshite_joshikousei_wo_hirou_tv_ed_t04+hige_wo_soru_soshite_joshikousei_wo_hirou_tv_ed_t05+hige_wo_soru_soshite_joshikousei_wo_hirou_tv_ed_t06+hige_wo_soru_soshite_joshikousei_wo_hirou_tv_ed_t07 \
	+hige_wo_soru_soshite_joshikousei_wo_hirou_tv_ed_t08+hige_wo_soru_soshite_joshikousei_wo_hirou_tv_ed_t09+hige_wo_soru_soshite_joshikousei_wo_hirou_tv_ed_t10

hige_wo_soru_soshite_joshikousei_wo_hirou_tv_ed_mute

### export clip: hige_wo_soru_soshite_joshikousei_wo_hirou_tv_ed_mute

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

	outside_halo_color=is_title?color_darkturquoise:subtitle_outside_halo_color
	effects=subtitle_effects+(is_title?"c":"")

	subtitle_mode=is_furigana?"ex":"ex" #"ex_thick_reduce_memory"
	size=is_furigana?subtitle_size*0.5:subtitle_size
	y=is_furigana?y-size:y

	return SUBTITLE_FX_FADE_IN_FADE_OUT_DOUBLE_HALO(clip,text,Round(x),Round(y),start_frame,end_frame,subtitle_front_fade_count,subtitle_rear_fade_count,subtitle_font,effects,Round(size),subtitle_text_color,subtitle_halo_color,outside_halo_color,subtitle_mode)
}

function SUBTITLE_N(clip clip,string text,float y,int start_frame,int end_frame,bool "is_title"){
	is_title=Default(is_title,false)

	x=subtitle_clip_width/2
	fade_count=1

	outside_halo_color=is_title?color_darkturquoise:subtitle_outside_halo_color

	return SUBTITLE_FX_FADE_IN_FADE_OUT_DOUBLE_HALO(clip,text,Round(x),Round(y),start_frame,end_frame,fade_count,fade_count,subtitle_font,subtitle_effects+"c",Round(subtitle_size),subtitle_text_color,subtitle_halo_color,outside_halo_color,"ex")
}

### inherit end ###

ConvertToRGB32(matrix="Rec709")

SUBTITLE_FX("Plastic Smile//石原夏織|- by fielia@AVISynth",Width()/2,Height()/2,202,404,is_title=true)

SUBTITLE_FX("なに げ                         わら",subtitle_x,subtitle_y-subtitle_size*2,423,564,true)
SUBTITLE_FX("何気ないフリして笑いながら",subtitle_x,subtitle_y-subtitle_size*2,423,564)
SUBTITLE_FX("                                             と まど",subtitle_x,subtitle_y,565,702,true)
SUBTITLE_FX("ほんとうは ねえ すごく戸惑ってる",subtitle_x,subtitle_y,565,702)

SUBTITLE_FX("                         じ ぶん",subtitle_x,subtitle_y-subtitle_size*2,700,840,true)
SUBTITLE_FX("ありのままの自分のままで",subtitle_x,subtitle_y-subtitle_size*2,700,840)
SUBTITLE_FX("                    おも",subtitle_x,subtitle_y,837,975,true)
SUBTITLE_FX("いいなんて思えずいたから",subtitle_x,subtitle_y,837,975)

SUBTITLE_FX(" おくびょう    と                              とびら いま",subtitle_x,subtitle_y-subtitle_size*2,978,1125,true)
SUBTITLE_FX(" 臆病に閉じてた ココロの扉 今",subtitle_x,subtitle_y-subtitle_size*2,978,1125)
SUBTITLE_FX("                              やさ             り ゆう",subtitle_x,subtitle_y,1124,1261,true)
SUBTITLE_FX("そっとひらいて 優しさの理由を",subtitle_x,subtitle_y,1124,1261)
SUBTITLE_FX("さぐ",subtitle_x,subtitle_y-subtitle_size*2,1257,1348,true)
SUBTITLE_FX("探ってみたくなる",subtitle_x,subtitle_y-subtitle_size*2,1257,1348)

SUBTITLE_FX("             で  あ           はじ         し          き  も",subtitle_x,subtitle_y,1349,1493,true)
SUBTITLE_FX("キミに出会って 初めて知った気持ち",subtitle_x,subtitle_y,1349,1493)
SUBTITLE_FX("いま                         い",subtitle_x,subtitle_y-subtitle_size*2,1491,1624,true)
SUBTITLE_FX("今はまだうまく言えないけど",subtitle_x,subtitle_y-subtitle_size*2,1491,1624)
SUBTITLE_FX("きず                                         き",subtitle_x,subtitle_y,1625,1776,true)
SUBTITLE_FX("傷ついていることにさえ気づけずにいた",subtitle_x,subtitle_y,1625,1776)
SUBTITLE_FX(" じ ぶん                               か",subtitle_x,subtitle_y-subtitle_size*2,1775,1999,true)
SUBTITLE_FX("自分でもすこしずつ 変わってゆけるかな Ah",subtitle_x,subtitle_y-subtitle_size*2,1775,1999)

SUBTITLE_FX(" き たい         お",subtitle_x,subtitle_y,2180,2322,true)
SUBTITLE_FX("期待して落ちこむくらいならば",subtitle_x,subtitle_y,2180,2322)
SUBTITLE_FX(" え がお             す",subtitle_x,subtitle_y-subtitle_size*2,2322,2457,true)
SUBTITLE_FX("笑顔でやり過ごせばいいやって",subtitle_x,subtitle_y-subtitle_size*2,2322,2457)

SUBTITLE_FX("                              いっ ぽ  ひ",subtitle_x,subtitle_y,2455,2595,true)
SUBTITLE_FX("いつからだろう 一歩引くクセ",subtitle_x,subtitle_y,2455,2595)
SUBTITLE_FX(" み      つ            な",subtitle_x,subtitle_y-subtitle_size*2,2593,2733,true)
SUBTITLE_FX("身に付けて 慣れてしまってた",subtitle_x,subtitle_y-subtitle_size*2,2593,2733)

SUBTITLE_FX("                     ゆ",subtitle_x,subtitle_y,2736,2882,true)
SUBTITLE_FX("いとしさに揺らめく ココロのざわめきが",subtitle_x,subtitle_y,2736,2882)
SUBTITLE_FX("ただ                      だい じ",subtitle_x,subtitle_y-subtitle_size*2,2882,3019,true)
SUBTITLE_FX("正しさよりも 大事にしたいコト",subtitle_x,subtitle_y-subtitle_size*2,2882,3019)
SUBTITLE_FX("おし",subtitle_x,subtitle_y,3016,3106,true)
SUBTITLE_FX("教えてくれるから",subtitle_x,subtitle_y,3016,3106)

### pass clip: hige_wo_soru_soshite_joshikousei_wo_hirou_tv_ed_mute

### prefetch: 5,2

### ###

SUBTITLE_FX("             で  あ                               とくべつ",subtitle_x,subtitle_y-subtitle_size*2,3107,3248,true)
SUBTITLE_FX("キミに出会って ありふれた特別を",subtitle_x,subtitle_y-subtitle_size*2,3107,3248)
SUBTITLE_FX("                    かさ",subtitle_x,subtitle_y,3248,3380,true)
SUBTITLE_FX("ひとつずつ重ねてゆくたび",subtitle_x,subtitle_y,3248,3380)
SUBTITLE_FX("                             せ かい    いろ     さ",subtitle_x,subtitle_y-subtitle_size*2,3381,3533,true)
SUBTITLE_FX("モノクロだった世界に色が差してゆく",subtitle_x,subtitle_y-subtitle_size*2,3381,3533)
SUBTITLE_FX(" ぶ  き よう     じ ぶん           か",subtitle_x,subtitle_y,3532,3748,true)
SUBTITLE_FX("不器用な自分でも 変わってゆけそうで",subtitle_x,subtitle_y,3532,3748)

SUBTITLE_FX("                        そら                げんじつ み",subtitle_x,subtitle_y-subtitle_size*2,3960,4081,true)
SUBTITLE_FX("クリアすぎる空はどこか現実味がなくて",subtitle_x,subtitle_y-subtitle_size*2,3960,4081)
SUBTITLE_FX("まい ご     くも                                   ただよ",subtitle_x,subtitle_y,4080,4240,true)
SUBTITLE_FX("迷子の雲みたいにフワフワと漂ってた",subtitle_x,subtitle_y,4080,4240)
SUBTITLE_FX("こた        いま",subtitle_x,subtitle_y-subtitle_size*2,4238,4389,true)
SUBTITLE_FX("答えは今もまだ わからないままだけれど",subtitle_x,subtitle_y-subtitle_size*2,4238,4389)
SUBTITLE_FX(" ひがり    さ",subtitle_x,subtitle_y,4389,4502,true)
SUBTITLE_FX(" 光が射すほうへ",subtitle_x,subtitle_y,4389,4502)

SUBTITLE_FX("             で  あ           はじ         し",subtitle_x,subtitle_y-subtitle_size*2,4517,4663,true)
SUBTITLE_FX("キミに出会って 初めて知ったんだよ",subtitle_x,subtitle_y-subtitle_size*2,4517,4663)
SUBTITLE_FX("                                       ひかり",subtitle_x,subtitle_y,4660,4795,true)
SUBTITLE_FX("まっすぐであたたかな光",subtitle_x,subtitle_y,4660,4795)
SUBTITLE_FX("             か  こ          い  み                む  だ",subtitle_x,subtitle_y-subtitle_size*2,4796,4943,true)
SUBTITLE_FX("どんな過去にも意味はある 無駄じゃないって",subtitle_x,subtitle_y-subtitle_size*2,4796,4943)
SUBTITLE_FX("おも                  しん                   て      の",subtitle_x,subtitle_y,4941,5123,true)
SUBTITLE_FX("思いたくて 信じたくて 手を伸ばしてみるよ",subtitle_x,subtitle_y,4941,5123)

SUBTITLE_FX("             で  あ                               とくべつ",subtitle_x,subtitle_y-subtitle_size*2,5139,5282,true)
SUBTITLE_FX("キミに出会って ありふれた特別を",subtitle_x,subtitle_y-subtitle_size*2,5139,5282)
SUBTITLE_FX("                    かさ",subtitle_x,subtitle_y,5280,5415,true)
SUBTITLE_FX("ひとつずつ重ねあえたキセキは",subtitle_x,subtitle_y,5280,5415)
SUBTITLE_FX("                ひろ     せ かい",subtitle_x,subtitle_y-subtitle_size*2,5415,5566,true)
SUBTITLE_FX("こんなに広い世界のどこにいてもずっと",subtitle_x,subtitle_y-subtitle_size*2,5415,5566)
SUBTITLE_FX(" か                                       つつ",subtitle_x,subtitle_y,5565,5791,true)
SUBTITLE_FX("変わらないぬくもりで 包んでくれるから…さあ",subtitle_x,subtitle_y,5565,5791)

######## Thumbnail ########

is_thumbnail=false

is_thumbnail?ConvertToRGB32(hige_wo_soru_soshite_joshikousei_wo_hirou_tv_ed_mute,matrix="Rec709"):last

######## Music ########

bgm_48khz=SSRC(WAVSource("src\01.Plastic Smile.wav"),48000)
AudioDub(bgm_48khz)



thumbnail=Trim(5772,-24*5)



######## Preface ########

Import("hige_wo_soru_soshite_joshikousei_wo_hirou-tv-common-cross_process.avsi")

hige_wo_soru_soshite_joshikousei_wo_hirou_tv_13_epilogue_audio=BlankClip(last,length=Framecount(hige_wo_soru_soshite_joshikousei_wo_hirou_tv_13_epilogue)-ed_start,color=color_black)+TRIM_FIRST_CLIP(ed_start)
hige_wo_soru_soshite_joshikousei_wo_hirou_tv_13_epilogue=MixAudio(hige_wo_soru_soshite_joshikousei_wo_hirou_tv_13_epilogue,hige_wo_soru_soshite_joshikousei_wo_hirou_tv_13_epilogue_audio,1.0,1.0)

hige_wo_soru_soshite_joshikousei_wo_hirou_tv_13_epilogue=ConvertToRGB32(hige_wo_soru_soshite_joshikousei_wo_hirou_tv_13_epilogue,matrix="Rec709")

hige_wo_soru_soshite_joshikousei_wo_hirou_tv_13_epilogue=SUBTITLE_N(hige_wo_soru_soshite_joshikousei_wo_hirou_tv_13_epilogue,"おい!",subtitle_y,360,375)
hige_wo_soru_soshite_joshikousei_wo_hirou_tv_13_epilogue=SUBTITLE_N(hige_wo_soru_soshite_joshikousei_wo_hirou_tv_13_epilogue,"こんな時間に何やってんだ?",subtitle_y,385,430)
hige_wo_soru_soshite_joshikousei_wo_hirou_tv_13_epilogue=SUBTITLE_N(hige_wo_soru_soshite_joshikousei_wo_hirou_tv_13_epilogue,"家に帰れ、家に!",subtitle_y,435,475)
hige_wo_soru_soshite_joshikousei_wo_hirou_tv_13_epilogue=SUBTITLE_N(hige_wo_soru_soshite_joshikousei_wo_hirou_tv_13_epilogue,"帰る家はあるんだけど、とっても遠いの。",subtitle_y,550,630)
hige_wo_soru_soshite_joshikousei_wo_hirou_tv_13_epilogue=SUBTITLE_N(hige_wo_soru_soshite_joshikousei_wo_hirou_tv_13_epilogue,"だから",subtitle_y,670,690)
hige_wo_soru_soshite_joshikousei_wo_hirou_tv_13_epilogue=SUBTITLE_N(hige_wo_soru_soshite_joshikousei_wo_hirou_tv_13_epilogue,"おじさん、泊めてよ!",subtitle_y,735,775)

hige_wo_soru_soshite_joshikousei_wo_hirou_tv_ed_pre=ConvertToRGB32(hige_wo_soru_soshite_joshikousei_wo_hirou_tv_13_title,matrix="Rec709")++hige_wo_soru_soshite_joshikousei_wo_hirou_tv_13_epilogue

hige_wo_soru_soshite_joshikousei_wo_hirou_tv_ed_pre++Trim(ed_start,0)



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
