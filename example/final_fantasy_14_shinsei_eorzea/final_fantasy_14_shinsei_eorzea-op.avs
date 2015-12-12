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

######## Game (1280*720) ########

final_fantasy_14_shinsei_eorzea_game_op=GetChannel(SSRC(FFMS2_VIDEO_SOURCE("src\00001.dat",fpsnum=30000,fpsden=1001),48000),1,2)
final_fantasy_14_shinsei_eorzea_game_op_cache02=GetChannel(SSRC(FFMS2_VIDEO_SOURCE("src\00001.dat",fpsnum=30000,fpsden=1001),48000),1,2)

######## Trim ########

final_fantasy_14_shinsei_eorzea_game_op_01=Trim(final_fantasy_14_shinsei_eorzea_game_op,0,9661)
final_fantasy_14_shinsei_eorzea_game_op_02_01=Trim(final_fantasy_14_shinsei_eorzea_game_op,9662,10842)
final_fantasy_14_shinsei_eorzea_game_op_02_02=Trim(final_fantasy_14_shinsei_eorzea_game_op_cache02,10843,0)

######## Pre Combine ########

final_fantasy_14_shinsei_eorzea_game_op_01_00=Trim(final_fantasy_14_shinsei_eorzea_game_op_01,0,22)
final_fantasy_14_shinsei_eorzea_game_op_01_01=Trim(final_fantasy_14_shinsei_eorzea_game_op_01,23,0)



global fade_length=30*30+14
global fade_sub_length=30*5

final_fantasy_14_shinsei_eorzea_game_op_t02_layer01=TRIM_LAST_CLIP(final_fantasy_14_shinsei_eorzea_game_op_01_01,fade_length)
final_fantasy_14_shinsei_eorzea_game_op_t02_layer02=TRIM_FIRST_CLIP(final_fantasy_14_shinsei_eorzea_game_op_02_02,fade_length)

global overlay_width=Width(final_fantasy_14_shinsei_eorzea_game_op_t02_layer02)
global overlay_height=Height(final_fantasy_14_shinsei_eorzea_game_op_t02_layer02)

final_fantasy_14_shinsei_eorzea_game_op_t02_layer01=ScriptClip(FadeOut0(final_fantasy_14_shinsei_eorzea_game_op_t02_layer01,fade_sub_length-1),"FAST_ZOOM(srcx=0,srcy=0,dstx=0,dsty=0,factor=Spline(current_frame,-1,1.0,fade_sub_length-1,0.6,fade_length-1,0.6,cubic=false))")
final_fantasy_14_shinsei_eorzea_game_op_t02_layer02=ScriptClip(FadeIn0(final_fantasy_14_shinsei_eorzea_game_op_t02_layer02,fade_sub_length-1),"FAST_ZOOM(srcx=overlay_width,srcy=overlay_height,dstx=overlay_width,dsty=overlay_height,factor=Spline(current_frame,0,0.6,fade_length-fade_sub_length,0.6,fade_length,1.0,cubic=false))")

final_fantasy_14_shinsei_eorzea_game_op_t02=ConvertToYV12(Overlay(ConvertToRGB24(final_fantasy_14_shinsei_eorzea_game_op_t02_layer01),ConvertToRGB24(final_fantasy_14_shinsei_eorzea_game_op_t02_layer02),mode="Add",pc_range=true))

######## Combine ########

# final_fantasy_14_shinsei_eorzea_game_op_01 -23
# final_fantasy_14_shinsei_eorzea_game_op_02_02 8725



final_fantasy_14_shinsei_eorzea_game_op_t01=TRIM_FIRST_CLIP(final_fantasy_14_shinsei_eorzea_game_op_01_01,Framecount(final_fantasy_14_shinsei_eorzea_game_op_01_01)-fade_length)
final_fantasy_14_shinsei_eorzea_game_op_t03=Trim(final_fantasy_14_shinsei_eorzea_game_op_02_02,fade_length,0)

#final_fantasy_14_shinsei_eorzea_game_op_mute=Dissolve(final_fantasy_14_shinsei_eorzea_game_op_01_01,final_fantasy_14_shinsei_eorzea_game_op_02_02,fade_length)
final_fantasy_14_shinsei_eorzea_game_op_mute=final_fantasy_14_shinsei_eorzea_game_op_t01+final_fantasy_14_shinsei_eorzea_game_op_t02+final_fantasy_14_shinsei_eorzea_game_op_t03

######## Music ########

bgm_48khz=SSRC(WAVSource("src\final_fantasy_vocal_collection-10.wav"),48000)
AudioDub(final_fantasy_14_shinsei_eorzea_game_op_mute,bgm_48khz)



thumbnail=Trim(3498,-30*5)

######## Subtitle ########

global subtitle_clip_width=1280
global subtitle_clip_height=720

subtitle_x=50*1.5
subtitle_y=400*1.5
global subtitle_front_fade_count=15
global subtitle_rear_fade_count=15
global subtitle_font="Ms Mincho"
global subtitle_effects="b"
global subtitle_size=24*1.5
global subtitle_text_color=color_white
global subtitle_halo_color=color_deeppink

second_subtitle_x=50*1.5
second_subtitle_y=50*1.5

function SUBTITLE_FX(clip clip,string text,float x,float y,int start_frame,int end_frame,bool "is_title"){
	is_title=Default(is_title,false)

	halo_color=is_title?color_deepskyblue:subtitle_halo_color

	return SUBTITLE_FX_FADE_IN_FADE_OUT(clip,text,Round(x),Round(y),start_frame,end_frame,subtitle_front_fade_count,subtitle_rear_fade_count,subtitle_font,subtitle_effects,Round(subtitle_size),subtitle_text_color,halo_color)
}

SUBTITLE_FX("Answers//Susan Calloway|- by fielia@AVISynth",-subtitle_x,subtitle_y-subtitle_size,12575,12775,true)

SUBTITLE_FX("I close my eyes. Tell us why must we suffer.",subtitle_x,subtitle_y,9,405)
SUBTITLE_FX("Release your hands for your will drags us under.",subtitle_x,subtitle_y,419,805)
SUBTITLE_FX("My legs grow tired. Tell us where must we wander.",subtitle_x,subtitle_y,827,1220)
SUBTITLE_FX("How can we carry on with redemption beyond us?",subtitle_x,subtitle_y,1237,1608)

SUBTITLE_FX("To all of my children in whom life flows adundant.",subtitle_x,subtitle_y,1931,2232)
SUBTITLE_FX("To all of my children to whom death hath passed his judgment.",subtitle_x,subtitle_y,2262,2574)
SUBTITLE_FX("The soul yearns for honor. and the flesh the heredfter.",subtitle_x,subtitle_y,2599,2910)
SUBTITLE_FX("Look to those who walked before to lead those who walk after.",subtitle_x,subtitle_y,2936,3233)

SUBTITLE_FX("Shining is the Land's light of justice.",subtitle_x,subtitle_y,3449,3644)
SUBTITLE_FX("Ever flows the Land's well of purpose.",subtitle_x,subtitle_y,3721,3907)
SUBTITLE_FX("Walk free, walk free, walk free, believe...",subtitle_x,subtitle_y,3968,4316)
SUBTITLE_FX("The Land's alive, so believe.",subtitle_x,subtitle_y,4330,4654)

SUBTITLE_FX("    feel      face        teach   fear",subtitle_x,subtitle_y,4712,4965)
SUBTITLE_FX("Suffer me Lonely me Weakness me Evil me",second_subtitle_x,second_subtitle_y,4712,4965)
SUBTITLE_FX("      feel        face       teach     speak",subtitle_x,subtitle_y,4983,5235)
SUBTITLE_FX("although me one must me stumble me listen me",second_subtitle_x,second_subtitle_y,4983,5235)
SUBTITLE_FX("         speak    tell         tell         hope",subtitle_x,subtitle_y,5251,5506)
SUBTITLE_FX("Although we we might them we must them land of hope",second_subtitle_x,second_subtitle_y,5251,5506)
SUBTITLE_FX("    hope        wish       wish        roam",subtitle_x,subtitle_y,5521,5775)
SUBTITLE_FX("Mother hope father with every wish has a home",second_subtitle_x,second_subtitle_y,5521,5775)
SUBTITLE_FX("        roam      roam      roam         swim",subtitle_x,subtitle_y,5791,6044)
SUBTITLE_FX("we must go go listen go suffer home sanctum leap",second_subtitle_x,second_subtitle_y,5791,6044)
SUBTITLE_FX("    speak     sleep           sleep on",subtitle_x,subtitle_y,6059,6339)
SUBTITLE_FX("And as we wander sleep answer sleep on",second_subtitle_x,second_subtitle_y,6059,6339)

SUBTITLE_FX("Now open your eyes while our plight is repeated.",subtitle_x,subtitle_y,6576,6891)
SUBTITLE_FX("Stell deaf to our cries, lost in hope we lie defeated.",subtitle_x,subtitle_y,6910,7234)
SUBTITLE_FX("Our souls have been torn and our bodies forsaken.",subtitle_x,subtitle_y,7250,7557)
SUBTITLE_FX("Bearing sins of the past. for our future is taken.",subtitle_x,subtitle_y,7588,7910)

SUBTITLE_FX("War, born of strife, these trials persuade us not.",subtitle_x,subtitle_y,7948,8210)
SUBTITLE_FX("Feel what? Learn what?",second_subtitle_x,second_subtitle_y,8128,8290)
SUBTITLE_FX("Words without sound, these lies betray our thoughts.",subtitle_x,subtitle_y,8306,8584)
SUBTITLE_FX("Mired by your plague of doubt, the Land, she mourns.",subtitle_x,subtitle_y,8667,8930)
SUBTITLE_FX("See what? Hear what?",second_subtitle_x,second_subtitle_y,8847,9006)
SUBTITLE_FX("Judgment binds all we hold to a memory of scorn.",subtitle_x,subtitle_y,9001,9339)
SUBTITLE_FX("Tell us why, given life, we are meant to die.|helpless in our cryies?",subtitle_x,subtitle_y-subtitle_size,9360,9800)

SUBTITLE_FX("weakness suffer grovel reason",subtitle_x,subtitle_y,9836,10090)
SUBTITLE_FX("       we     we     we     we",second_subtitle_x,second_subtitle_y,9836,10090)
SUBTITLE_FX("follow struggle wander listen",subtitle_x,subtitle_y,10105,10360)
SUBTITLE_FX("     we       we     we     we",second_subtitle_x,second_subtitle_y,10105,10360)
SUBTITLE_FX("whisper shoulder addle weather",subtitle_x,subtitle_y,10375,10630)
SUBTITLE_FX("      we       we    we    please",second_subtitle_x,second_subtitle_y,10375,10630)
SUBTITLE_FX("answer answer answer together",subtitle_x,subtitle_y,10644,10970)
SUBTITLE_FX("     you    me",second_subtitle_x,second_subtitle_y,10644,10970)

SUBTITLE_FX("Thy life is a riddle, to bear rapture and sorrow.",subtitle_x,subtitle_y,10983,11301)
SUBTITLE_FX("To listen, to suffer, to entrust unto tomorrow.",subtitle_x,subtitle_y,11320,11633)
SUBTITLE_FX("In one fleeting moment, from the land doth life flow.",subtitle_x,subtitle_y,11656,11972)
SUBTITLE_FX("Yet in one fleeting moment for anew it doth grow.",subtitle_x,subtitle_y,11993,12315)
SUBTITLE_FX("In the same fleeting moment",subtitle_x,subtitle_y,12331,12464)
SUBTITLE_FX("thou must live, Die And Know.",subtitle_x,subtitle_y,12470,12690)



AUDIO_DUB_TONE(final_fantasy_14_shinsei_eorzea_game_op_01_00,samplerate=48000,channels=2,type="Silence")++ConvertToYV12(last)



#thumbnail

######## Post Processing ########

ConvertToYV12()
#ConvertToYUY2()
#ConvertToRGB24()

TCPServer()
