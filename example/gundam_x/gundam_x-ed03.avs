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

Import("gundam_x-common.avsi")

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

######## Pre Combine ########

fade_length=12

dissolve_length=48

gundam_x_ed_03_next=gundam_x_27_next+gundam_x_28_next+gundam_x_29_next+gundam_x_30_next+gundam_x_31_next+gundam_x_32_next+gundam_x_33_next+gundam_x_34_next+gundam_x_35_next+gundam_x_36_next+gundam_x_37_next+gundam_x_38_next
gundam_x_ed_03_next=gundam_x_clean_ed_03_01+TRIM_LAST_CLIP(gundam_x_ed_03_next,5220-Framecount(gundam_x_clean_ed_03_01))
gundam_x_ed_03_next_scaled=Zoom(ConvertToRGB32(gundam_x_ed_03_next,matrix="Rec601"),srcx="110.0",srcy="140.0",dstx="110.0",dsty="140.0",factor="Spline(n,0,1.0,35,0.51,10000,0.51,cubic=false)")

space_bg=Trim(Dissolve(gundam_x_clean_ed_03_02,gundam_x_clean_ed_03_02,gundam_x_clean_ed_03_02,gundam_x_clean_ed_03_02,dissolve_length),0,0)
space_bg_rgba=ConvertToRGB32(space_bg,matrix="Rec601")

space_and_next=CONVERT_BACK_TO_YV12(Layer(space_bg_rgba,gundam_x_ed_03_next_scaled,op="Add"),matrix="Rec601")

######## Combine ########

# gundam_x_clean_ed_03_01    20



gundam_x_ed_03_t01=BlankClip(gundam_x_clean_ed_03,length=20,color=color_black)+gundam_x_clean_ed_03_01+TRIM_FIRST_CLIP(space_and_next,5220)
gundam_x_ed_03_t02=TRIM_FIRST_CLIP(gundam_x_39_moon,99)+FadeOut(EXTEND_ANIMATION_CG(gundam_x_title,99*2+fade_length),fade_length)+BlankClip(gundam_x_clean_ed_03,length=24*6,color=color_black)
gundam_x_ed_03_t021=TRIM_FIRST_CLIP(gundam_x_39_moon,99*2)



gundam_x_ed_03_mute=gundam_x_ed_03_t01+gundam_x_ed_03_t02
gundam_x_ed_03_alter_mute=gundam_x_ed_03_t01+gundam_x_ed_03_t021



gundam_x_ed_03_mute

### export clip: gundam_x_ed_03_mute,gundam_x_ed_03_alter_mute,gundam_x_ed_03_t01,gundam_x_title

### prefetch: 5,2

### ###

######## Subtitle ########

### inherit start ###

#global subtitle_heavy_halo_width=1
global subtitle_clip_width=1440
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
global subtitle_outside_halo_color=color_black

function SUBTITLE_FX(clip clip,string text,float x,float y,int start_frame,int end_frame,bool "is_furigana",bool "is_title"){
	is_title=Default(is_title,false)
	is_furigana=Default(is_furigana,false)

	outside_halo_color=is_title?color_crimson:subtitle_outside_halo_color
	effects=subtitle_effects+(is_title?"":"")

	subtitle_mode=is_furigana?"ex":"ex" #"ex_thick_reduce_memory"
	size=is_furigana?subtitle_size*0.5:subtitle_size
	y=is_furigana?y-size:y

	return SUBTITLE_FX_FADE_IN_FADE_OUT_DOUBLE_HALO(clip,text,Round(x),Round(y),start_frame,end_frame,subtitle_front_fade_count,subtitle_rear_fade_count,subtitle_font,effects,Round(size),subtitle_text_color,subtitle_halo_color,outside_halo_color,subtitle_mode)
}

### inherit end ###

ConvertToRGB32(matrix="Rec601")

SUBTITLE_FX("銀色Horizon//中瀬聡美|- by fielia@AVISynth",-subtitle_x,subtitle_y-subtitle_size,5276,5500,is_title=true)

SUBTITLE_FX("おな     よ ぞら    した  べつべつ     ば しょ",subtitle_x,subtitle_y-subtitle_size*2,385,649,true)
SUBTITLE_FX("同じ夜空の下 別々な場所",subtitle_x,subtitle_y-subtitle_size*2,385,649)
SUBTITLE_FX("いま  きみ              なに",subtitle_x,subtitle_y,668,848,true)
SUBTITLE_FX("今 君のため 何ができるか",subtitle_x,subtitle_y,668,848)
SUBTITLE_FX(" かんが",subtitle_x,subtitle_y-subtitle_size*2,881,990,true)
SUBTITLE_FX(" 考えてるの",subtitle_x,subtitle_y-subtitle_size*2,881,990)

SUBTITLE_FX("                おも              おも     た",subtitle_x,subtitle_y,1034,1298,true)
SUBTITLE_FX("どんなに想っても 想い足りない",subtitle_x,subtitle_y,1034,1298)
SUBTITLE_FX(" こころ   なか     わたし    よ",subtitle_x,subtitle_y-subtitle_size*2,1319,1487,true)
SUBTITLE_FX(" 心の中で 私を呼んで",subtitle_x,subtitle_y-subtitle_size*2,1319,1487)
SUBTITLE_FX("             と",subtitle_x,subtitle_y,1488,1624,true)
SUBTITLE_FX("すぐに飛んでゆくから",subtitle_x,subtitle_y,1488,1624)

SUBTITLE_FX("ぎんいろ                だい ち      は",subtitle_x,subtitle_y-subtitle_size*2,1622,1805,true)
SUBTITLE_FX("銀色Horizon 大地の果て",subtitle_x,subtitle_y-subtitle_size*2,1622,1805)
SUBTITLE_FX("きみ     あ",subtitle_x,subtitle_y,1805,1971,true)
SUBTITLE_FX("君に会えるなら こわくはない",subtitle_x,subtitle_y,1805,1971)
SUBTITLE_FX("             せ かい      やみ    つつ",subtitle_x,subtitle_y-subtitle_size*2,1977,2150,true)
SUBTITLE_FX("たとえ世界が 闇に包まれても",subtitle_x,subtitle_y-subtitle_size*2,1977,2150)
SUBTITLE_FX("いつかたどりつくよ I'm with you",subtitle_x,subtitle_y,2153,2316)

### pass clip: gundam_x_ed_03_mute,gundam_x_ed_03_alter_mute,gundam_x_ed_03_t01,gundam_x_title

### prefetch: 5,2

### ###

SUBTITLE_FX("はじ         み      え がお  わす",subtitle_x,subtitle_y-subtitle_size*2,2411,2675,true)
SUBTITLE_FX("初めて見た笑顔 忘れられない",subtitle_x,subtitle_y-subtitle_size*2,2411,2675)
SUBTITLE_FX("            とき          おも     だ",subtitle_x,subtitle_y,2695,2862,true)
SUBTITLE_FX("つらい時には 思い出すのよ",subtitle_x,subtitle_y,2695,2862)
SUBTITLE_FX("             の      こ",subtitle_x,subtitle_y-subtitle_size*2,2865,3001,true)
SUBTITLE_FX("それで乗り越えられる",subtitle_x,subtitle_y-subtitle_size*2,2865,3001)

SUBTITLE_FX("ぎんいろ                                ほし",subtitle_x,subtitle_y,2990,3178,true)
SUBTITLE_FX("銀色Horizon きらめく星",subtitle_x,subtitle_y,2990,3178)
SUBTITLE_FX("きみ    いま",subtitle_x,subtitle_y-subtitle_size*2,3182,3346,true)
SUBTITLE_FX("君は今どこで みつめている",subtitle_x,subtitle_y-subtitle_size*2,3182,3346)
SUBTITLE_FX("         ちきゅう     まわ    つづ",subtitle_x,subtitle_y,3354,3530,true)
SUBTITLE_FX("この地球が 廻り続けるよに",subtitle_x,subtitle_y,3354,3530)
SUBTITLE_FX("            あい                  きみ",subtitle_x,subtitle_y-subtitle_size*2,3531,3694,true)
SUBTITLE_FX("ずっと愛している 君を",subtitle_x,subtitle_y-subtitle_size*2,3531,3694)

SUBTITLE_FX("ぎんいろ                だい ち      は",subtitle_x,subtitle_y,4297,4480,true)
SUBTITLE_FX("銀色Horizon 大地の果て",subtitle_x,subtitle_y,4297,4480)
SUBTITLE_FX("きみ     あ",subtitle_x,subtitle_y-subtitle_size*2,4479,4646,true)
SUBTITLE_FX("君に会えるなら こわくはない",subtitle_x,subtitle_y-subtitle_size*2,4479,4646)
SUBTITLE_FX("             せ かい      やみ    つつ",subtitle_x,subtitle_y,4650,4828,true)
SUBTITLE_FX("たとえ世界が 闇に包まれても",subtitle_x,subtitle_y,4650,4828)
SUBTITLE_FX("                                    きみ",subtitle_x,subtitle_y-subtitle_size*2,4828,4987,true)
SUBTITLE_FX("いつかたどりつくよ君に",subtitle_x,subtitle_y-subtitle_size*2,4828,4987)
SUBTITLE_FX("             だ",subtitle_x,subtitle_y,4989,5215,true)
SUBTITLE_FX("そして抱きしめたい I'm with you",subtitle_x,subtitle_y,4989,5215)

######## Postface ######## 

######## Preface ########

Import("gundam_x-common-cross_process.avsi")

gundam_x_39_moon_patched=Normalize(Trim(gundam_x_38_moon_slogan,5,0))
gundam_x_39_moon_patched_audio=AUDIO_DUB_TONE(BlankClip(gundam_x_ed_03_t01,color=color_black),samplerate=48000,channels=2,type="Silence")+gundam_x_39_moon_patched

######## Thumbnail ########

is_thumbnail=false

is_thumbnail?ConvertToRGB32(gundam_x_ed_03_alter_mute,matrix="Rec601"):last

######## Music ########

bgm_48khz=SSRC(WAVSource("src\gundam_x_ost-side3-08.wav"),48000)
AudioDub(bgm_48khz)
MixAudio(gundam_x_39_moon_patched_audio,1.0,1.0)
Normalize()



thumbnail=Trim(5276,-24*5)
gundam_x_title_thumb=ConvertToRGB32(EXTEND_ANIMATION_CG(gundam_x_title,Framecount(thumbnail)),matrix="Rec601")
gundam_x_title_thumb=FAST_ZOOM(gundam_x_title_thumb,srcx=0.0,srcy=Height(gundam_x_title_thumb),dstx=0.0,dsty=Height(gundam_x_title_thumb),factor=0.25)
thumbnail=Layer(thumbnail,gundam_x_title_thumb,op="Add")



is_thumbnail?thumbnail:last

""")

######## Post Processing ########

#ConvertToRGB24()
#ConvertBackToYUY2(matrix="Rec601")
CONVERT_BACK_TO_YV12(matrix="Rec601")

#ConvertAudioTo8bit()
#ConvertAudioTo16bit()
ConvertAudioTo24bit()
#ConvertAudioTo32bit()
#ConvertAudioToFloat()

TCPServer()
