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

Import("astral_chain-common-function.avsi")

### inherit end ###

Import("astral_chain-common.avsi")

######## Pre Combine ########

fade_length=15

astral_chain_introduction_op=astral_chain_introduction_op_01+astral_chain_introduction_op_04
astral_chain_introduction_combine=astral_chain_introduction_scene+astral_chain_introduction_legion

astral_chain_cm_02_extend=astral_chain_cm_02+astral_chain_cm_03
astral_chain_cm_01_04=astral_chain_cm_01_legion+astral_chain_cm_04

######## Combine ########

# astral_chain_op_00 -32
# astral_chain_op_01 0
# astral_chain_op_02 665/2537
# astral_chain_op_03 1358/3230/4598/5030
# astral_chain_op_04 5629

# astral_chain_introduction_op_01 2508

# astral_chain_cm_02 1368



astral_chain_op_t01=astral_chain_op_01
astral_chain_op_t02=astral_chain_op_02+TRIM_FIRST_CLIP(Trim(ASSUME_30P(astral_chain_cm_02_extend),8,0),599)
astral_chain_op_t03=TRIM_MIDDLE_CLIP(ASSUME_30P(astral_chain_introduction_prologue_02),580)
astral_chain_op_t04=Trim(ASSUME_30P(astral_chain_introduction_op),29,-(693+599))
astral_chain_op_t05=FADE_IN_WITH_BRIGHTNESS_OFFSET(TRIM_FIRST_CLIP(ASSUME_30P(astral_chain_cm_01_04),506+263),fade_length,false)
astral_chain_op_t06=FADE_OUT_WITH_BRIGHTNESS_OFFSET(TRIM_FIRST_CLIP(ASSUME_30P(astral_chain_cm_05),25),fade_length,false)+FADE_OUT_WITH_BRIGHTNESS_OFFSET(TRIM_FIRST_CLIP(ASSUME_30P(astral_chain_introduction_combine),407),fade_length,false)+astral_chain_op_03
astral_chain_op_t07=astral_chain_op_04+BlankClip(astral_chain_op,length=30*6,color=color_black)



astral_chain_op_mute=astral_chain_op_t01+astral_chain_op_t02+astral_chain_op_t03+astral_chain_op_t04+astral_chain_op_t05+astral_chain_op_t06+astral_chain_op_t07

astral_chain_op_mute

### export clip: astral_chain_op_mute,astral_chain_op_00

### prefetch: 5,2

### ###

######## Subtitle ########

### inherit start ###

global subtitle_clip_width=1920
global subtitle_clip_height=1080

subtitle_x=50*2.25
subtitle_y=405*2.25
global subtitle_front_fade_count=30
global subtitle_rear_fade_count=30
global subtitle_font="MS Gothic"
global subtitle_effects="b"
global subtitle_size=21*2.25
global subtitle_text_color=color_white
global subtitle_halo_color=color_black
global subtitle_outside_halo_color=color_magenta
global subtitle_random_char_func="RANDOM_JIS_KANA_CHAR"

function SUBTITLE_FX(clip clip,string text,float x,float y,int start_frame,int end_frame,int singer,bool "is_title"){
	is_title=Default(is_title,false)

	outside_halo_color=singer==1?color_dodgerblue \
		:singer==2?color_red \
		:singer==3?subtitle_outside_halo_color \
		:Assert(false,"SUBTITLE_FX(): invalid singer")
	outside_halo_color=is_title?color_orangered:outside_halo_color

	return SUBTITLE_FX_ASTRAL_CHAIN_DOUBLE_HALO(clip,text,Round(x),Round(y),start_frame,end_frame,subtitle_front_fade_count,subtitle_rear_fade_count,subtitle_font,subtitle_effects,Round(subtitle_size),subtitle_text_color,subtitle_halo_color,outside_halo_color,"ex",subtitle_random_char_func)
}

### inherit end ###

ConvertToRGB32(matrix="Rec709")

#SUBTITLE_FX("Savior//青山ウィリアム & Beverly|- by fielia@AVISynth",-subtitle_x,subtitle_y-subtitle_size,78,369,3,is_title=true)
SUBTITLE_FX("Savior//青山ウィリアム & Beverly|- by fielia@AVISynth",-subtitle_x,subtitle_y-subtitle_size,5918,6130,3,is_title=true)

SUBTITLE_FX("The sky turns red swallowing up each and every being in this town",subtitle_x,subtitle_y-subtitle_size,659,813,1)
SUBTITLE_FX("Hopes, hearts, everything is falling down",subtitle_x,subtitle_y,817,926,1)
SUBTITLE_FX("Far away in the skyline",subtitle_x,subtitle_y-subtitle_size,943,1014,2)
SUBTITLE_FX("A crowd of apparitions crawling around",subtitle_x,subtitle_y,1006,1086,2)
SUBTITLE_FX("It's calling, it's calling",subtitle_x,subtitle_y-subtitle_size,1078,1151,2)
SUBTITLE_FX("Growing louder",subtitle_x,subtitle_y,1160,1241,2)

SUBTITLE_FX("Are we the future of this burning hell?",subtitle_x,subtitle_y-subtitle_size,1241,1364,1)

SUBTITLE_FX("It's a fight for our paradise",subtitle_x,subtitle_y,1357,1446,3)
SUBTITLE_FX("Fight for our lives",subtitle_x,subtitle_y-subtitle_size,1447,1497,3)
SUBTITLE_FX("So keep holding on, keep holding on",subtitle_x,subtitle_y,1499,1589,3)
SUBTITLE_FX("Until we break the spell",subtitle_x,subtitle_y-subtitle_size,1581,1642,3)
SUBTITLE_FX("Free yourself, reach for the light in darkness and despair",subtitle_x,subtitle_y,1645,1786,3)
SUBTITLE_FX("If there comes a time when you're falling down",subtitle_x,subtitle_y-subtitle_size,1790,1902,3)
SUBTITLE_FX("I'll be your savior",subtitle_x,subtitle_y,1905,2003,3)

### pass clip: astral_chain_op_mute,astral_chain_op_00

### prefetch: 5,2

### ###

SUBTITLE_FX("The eyes of the living dead, the lies, the cries without a single sound",subtitle_x,subtitle_y-subtitle_size,2531,2688,2)
SUBTITLE_FX("Cold hearts, everything is falling down",subtitle_x,subtitle_y,2690,2800,2)
SUBTITLE_FX("[The] War is on, our faiths are gone",subtitle_x,subtitle_y-subtitle_size,2811,2887,1)
SUBTITLE_FX("Another reminiscence haunting us all",subtitle_x,subtitle_y,2879,2958,1)
SUBTITLE_FX("It's calling, it's calling",subtitle_x,subtitle_y-subtitle_size,2950,3022,1)
SUBTITLE_FX("Over and over",subtitle_x,subtitle_y,3032,3112,1)

SUBTITLE_FX("Are we the future of this burning hell?",subtitle_x,subtitle_y-subtitle_size,3111,3229,2)

SUBTITLE_FX("It's a fight for our paradise",subtitle_x,subtitle_y,3229,3317,3)
SUBTITLE_FX("Fight for our lives",subtitle_x,subtitle_y-subtitle_size,3319,3369,3)
SUBTITLE_FX("So keep holding on, keep holding on",subtitle_x,subtitle_y,3371,3461,3)
SUBTITLE_FX("Until we break the spell",subtitle_x,subtitle_y-subtitle_size,3453,3514,3)
SUBTITLE_FX("Free yourself, reach for the light in darkness and despair",subtitle_x,subtitle_y,3517,3657,3)
SUBTITLE_FX("If there comes a time when you're falling down",subtitle_x,subtitle_y-subtitle_size,3661,3776,3)
SUBTITLE_FX("I'll be your savior",subtitle_x,subtitle_y,3777,3902,3)

### pass clip: astral_chain_op_mute,astral_chain_op_00

### prefetch: 5,2

### ###

SUBTITLE_FX("Don't need to be afraid",subtitle_x,subtitle_y,4355,4419,1)
SUBTITLE_FX("Don't need to look away",subtitle_x,subtitle_y-subtitle_size,4426,4486,1)
SUBTITLE_FX("You'll never be alone, let's show them that we're here to stay",subtitle_x,subtitle_y,4478,4622,1)

SUBTITLE_FX("Fight for our paradise",subtitle_x,subtitle_y-subtitle_size,4615,4685,2)
SUBTITLE_FX("Fight for our lives",subtitle_x,subtitle_y,4687,4739,2)
SUBTITLE_FX("So keep holding on, keep holding on",subtitle_x,subtitle_y-subtitle_size,4739,4830,2)
SUBTITLE_FX("Until we break the spell",subtitle_x,subtitle_y,4821,4884,2)
SUBTITLE_FX("Let the truth reveal itself",subtitle_x,subtitle_y-subtitle_size,4886,4958,3)
SUBTITLE_FX("[And] bring this chaos to an end",subtitle_x,subtitle_y,4950,5050,3)

SUBTITLE_FX("Fight for our paradise",subtitle_x,subtitle_y-subtitle_size,5046,5118,3)
SUBTITLE_FX("Fight for our lives",subtitle_x,subtitle_y,5117,5168,3)
SUBTITLE_FX("So keep holding on, keep holding on",subtitle_x,subtitle_y-subtitle_size,5170,5260,3)
SUBTITLE_FX("Until we break the spell",subtitle_x,subtitle_y,5252,5314,3)
SUBTITLE_FX("Free yourself, reach for the light in darkness and despair",subtitle_x,subtitle_y-subtitle_size,5317,5457,3)
SUBTITLE_FX("If there comes a time when you're falling down",subtitle_x,subtitle_y,5461,5576,3)
SUBTITLE_FX("I'll be your savior",subtitle_x,subtitle_y-subtitle_size,5577,5701,3)
SUBTITLE_FX("I'll be your savior",subtitle_x,subtitle_y,5721,5847,3)

######## Thumbnail ########

is_thumbnail=false

is_thumbnail?ConvertToRGB32(astral_chain_op_mute,matrix="Rec709"):last

######## Music ########

bgm_48khz=SSRC(WAVSource("src\astral_chain-platinum_sound_selection-01.wav"),48000)
Normalize(AudioDub(bgm_48khz))



thumbnail=Trim(78,-148)



AUDIO_DUB_TONE(ConvertToRGB32(astral_chain_op_00,matrix="Rec709"),samplerate=48000,channels=2,type="Silence")++last



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
