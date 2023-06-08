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



#MP_Pipeline("""

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

gundam_x_ed_01_next=gundam_x_clean_ed_01_01+gundam_x_01_next+gundam_x_02_next+gundam_x_03_next+gundam_x_04_next+gundam_x_05_next+gundam_x_06_next+gundam_x_07_next+gundam_x_08_next+gundam_x_09_next+gundam_x_10_next+gundam_x_11_next+gundam_x_12_next+gundam_x_13_next
gundam_x_ed_01_next_scaled=Zoom(ConvertToRGB32(gundam_x_ed_01_next,matrix="Rec601"),srcx="120.0",srcy="140.0",dstx="120.0",dsty="140.0",factor="Spline(n,0,1.0,40,0.51,10000,0.51,cubic=false)")

space_bg=Trim(Dissolve(gundam_x_clean_ed_01_02_moon,gundam_x_clean_ed_01_02_moon,gundam_x_clean_ed_01_02_moon,gundam_x_clean_ed_01_02_moon,dissolve_length),0,0)
space_bg_rgba=ConvertToRGB32(space_bg,matrix="Rec601")

space_and_next=CONVERT_BACK_TO_YV12(Layer(space_bg_rgba,gundam_x_ed_01_next_scaled,op="Add"),matrix="Rec601")

######## Combine ########

# gundam_x_title             24
# gundam_x_clean_ed_01_01    423



gundam_x_ed_01_t01=BlankClip(gundam_x_clean_ed_01,length=24,color=color_black)+EXTEND_ANIMATION_CG(gundam_x_title,399)+gundam_x_clean_ed_01_01+TRIM_FIRST_CLIP(space_and_next,5368)

gundam_x_01_tifa_slogan_last_frame=Framecount(gundam_x_01_tifa_slogan)-1
gundam_x_ed_01_t02=Loop(gundam_x_01_tifa_slogan,144-gundam_x_01_tifa_slogan_last_frame,gundam_x_01_tifa_slogan_last_frame,gundam_x_01_tifa_slogan_last_frame)+FadeOut(EXTEND_ANIMATION_CG(gundam_x_title,144+fade_length),fade_length)+BlankClip(gundam_x_clean_ed_01,length=24*6,color=color_black)



gundam_x_ed_01_mute=gundam_x_ed_01_t01+gundam_x_ed_01_t02



gundam_x_ed_01_mute

### export clip: gundam_x_ed_01_mute,gundam_x_ed_01_t01,gundam_x_01_tifa_slogan,gundam_x_title

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
global subtitle_size=22*2.25
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

SUBTITLE_FX("HUMAN TOUCH//Warren Wiebe|- by fielia@AVISynth",-subtitle_x,subtitle_y-subtitle_size,113,337,is_title=true)

SUBTITLE_FX("Can I find the words to tell you",subtitle_x,subtitle_y-subtitle_size,450,550)
SUBTITLE_FX("How I live between the walls of steel and stones",subtitle_x,subtitle_y,580,710)
SUBTITLE_FX("How I close my eyes to find some kind of repture",subtitle_x,subtitle_y-subtitle_size,758,908)
SUBTITLE_FX("In a world where you can feel so alone",subtitle_x,subtitle_y,935,1079)

SUBTITLE_FX("Inside I'm full of light and laughter",subtitle_x,subtitle_y-subtitle_size,1117,1250)
SUBTITLE_FX("There's a flame that burns in me",subtitle_x,subtitle_y,1291,1356)
SUBTITLE_FX("I need a way to set it free",subtitle_x,subtitle_y-subtitle_size,1375,1469)

SUBTITLE_FX("When you find love in your heart",subtitle_x,subtitle_y,1478,1597)
SUBTITLE_FX("You can believe from the start",subtitle_x,subtitle_y-subtitle_size,1654,1775)
SUBTITLE_FX("Dreams they come true",subtitle_x,subtitle_y,1833,1894)
SUBTITLE_FX("It all comes to you, oh all at once",subtitle_x,subtitle_y-subtitle_size,1916,2023)
SUBTITLE_FX("If you believe in human touch",subtitle_x,subtitle_y,2032,2170)

### pass clip: gundam_x_ed_01_mute,gundam_x_ed_01_t01,gundam_x_01_tifa_slogan,gundam_x_title

### prefetch: 5,2

### ###

SUBTITLE_FX("I see wanting in your eyes",subtitle_x,subtitle_y-subtitle_size,2342,2449)
SUBTITLE_FX("And I wonder will I always think of you",subtitle_x,subtitle_y,2486,2612)
SUBTITLE_FX("Do we simply find ourselves awaking",subtitle_x,subtitle_y-subtitle_size,2663,2812)
SUBTITLE_FX("As angles touched the heartstrings of our souls",subtitle_x,subtitle_y,2845,2979)

SUBTITLE_FX("We can find a way to break the madness",subtitle_x,subtitle_y-subtitle_size,3028,3156)
SUBTITLE_FX("Take my hand and come with me",subtitle_x,subtitle_y,3190,3264)
SUBTITLE_FX("To a place where we can feel",subtitle_x,subtitle_y-subtitle_size,3283,3367)

SUBTITLE_FX("When you find love in your heart",subtitle_x,subtitle_y,3382,3498)
SUBTITLE_FX("The light in your eye is a star",subtitle_x,subtitle_y-subtitle_size,3553,3675)
SUBTITLE_FX("Change that you feel",subtitle_x,subtitle_y,3735,3799)
SUBTITLE_FX("Helps you to heal from all the rest",subtitle_x,subtitle_y-subtitle_size,3824,3925)
SUBTITLE_FX("If you believe in human touch",subtitle_x,subtitle_y,3934,4043)

### pass clip: gundam_x_ed_01_mute,gundam_x_ed_01_t01,gundam_x_01_tifa_slogan,gundam_x_title

### prefetch: 5,2

### ###

SUBTITLE_FX("Tell me that your love will live forever",subtitle_x,subtitle_y-subtitle_size,4444,4570)
SUBTITLE_FX("Take your hand and touch my face",subtitle_x,subtitle_y,4606,4675)
SUBTITLE_FX("Oh, the warmth of your sweet embrace",subtitle_x,subtitle_y-subtitle_size,4694,4804)

SUBTITLE_FX("When you find love in your heart",subtitle_x,subtitle_y,4814,4910)
SUBTITLE_FX("Nothing can tear it apart",subtitle_x,subtitle_y-subtitle_size,4980,5100)
SUBTITLE_FX("Not man or steel",subtitle_x,subtitle_y,5158,5225)
SUBTITLE_FX("Nothing is real except for love",subtitle_x,subtitle_y-subtitle_size,5247,5355)
SUBTITLE_FX("If you believe in human touch",subtitle_x,subtitle_y,5358,5493)
SUBTITLE_FX("If you believe in human touch",subtitle_x,subtitle_y-subtitle_size,5513,5740)

######## Postface ########

######## Preface ########

Import("gundam_x-common-cross_process.avsi")

gundam_x_01_tifa_slogan_patched=AudioDub(gundam_x_01_tifa_slogan,TRIM_FIRST_CLIP(BlankClip(gundam_x_02_tifa_anata_ni_chikara_wo,length=3,color=color_black)+gundam_x_02_tifa_anata_ni_chikara_wo,90))
tifa_slogan_audio=AUDIO_DUB_TONE(BlankClip(gundam_x_ed_01_t01,color=color_black),samplerate=48000,channels=2,type="Silence")+Normalize(gundam_x_01_tifa_slogan_patched)

######## Thumbnail ########

is_thumbnail=false

is_thumbnail?ConvertToRGB32(gundam_x_ed_01_mute,matrix="Rec601"):last

######## Music ########

bgm_48khz=SSRC(WAVSource("src\gundam_x_ost-side1-20.wav"),48000)
AudioDub(bgm_48khz)
MixAudio(tifa_slogan_audio,1.0,1.0)
Normalize()



#thumbnail=Trim(423,-24*5)
#thumbnail=Trim(464,-24*5)
thumbnail=Trim(5832,-24*5)
gundam_x_title_thumb=ConvertToRGB32(EXTEND_ANIMATION_CG(gundam_x_title,Framecount(thumbnail)),matrix="Rec601")
gundam_x_title_thumb=FAST_ZOOM(gundam_x_title_thumb,srcx=0.0,srcy=Height(gundam_x_title_thumb),dstx=0.0,dsty=Height(gundam_x_title_thumb),factor=0.25)
thumbnail=Layer(thumbnail,gundam_x_title_thumb,op="Add")



is_thumbnail?thumbnail:last

#""")

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
