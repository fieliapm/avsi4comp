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

#turn_a_gundam_movie_02_turn_a_rush=Trim(turn_a_gundam_movie_02_cache01,8330,8358)


#turn_a_gundam_movie_01_kihel_family=Trim(turn_a_gundam_movie_01_cache01,12407,12584)

##turn_a_gundam_movie_01_wodom_landing=Trim(turn_a_gundam_movie_01_cache01,21618,21684)
##turn_a_gundam_movie_01_get_off_turn_a=Trim(turn_a_gundam_movie_01_cache01,25954,26013)
#turn_a_gundam_movie_01_sochie_shy=Trim(turn_a_gundam_movie_01_cache01,26138,26173)
##turn_a_gundam_movie_01_get_on_turn_a_again=Trim(turn_a_gundam_movie_01_cache01,29858,30156)
##turn_a_gundam_movie_01_kihel_sit_down=Trim(turn_a_gundam_movie_01_cache01,46810,46904)


#turn_a_gundam_movie_01_loran_meet_dianna=Trim(turn_a_gundam_movie_01_cache01,57177,57289)


#function OFFSET_STRING_CODE(string text,bool positive_offset){
#	text_length=StrLen(text)
#	text_length>1?{
#		first_char=LeftStr(text,1)
#		rest_text=MidStr(text,2)
#		first_char_ascii=ord(first_char)
#		first_char_ascii=positive_offset?first_char_ascii+1:first_char_ascii-1
#		
#	}:{
#		asd
#	}
#}





function SUBTITLE_FX2(clip clip,string text,float x,float y,int start_frame,int end_frame,int front_fade_count,int rear_fade_count,float size,int text_color,int halo_color){
	SUBTITLE_TEST(clip,text,first_frame=start_frame,last_frame=end_frame,text_color=text_color,halo_color=halo_color)
}




#b=BlankClip(turn_a_gundam_clean_op_01_part01,length=Framecount(turn_a_gundam_clean_op_01_part01),color=color_pink)

#c=Overlay(b,Zoom(ConvertToRGB32(turn_a_gundam_clean_op_01_part01),factorX="n/100",factorY="n/100",angle="n"))

#c=turn_a_gundam_clean_op_01_part05

#z=ConvertToRGB24(c)
#z2=ConvertToRGB24(c)

filter_string2="""
SubtitleEx(RANDOM_JIS_STRING(10)+" ‰Ô‚Ì‰Å"+String(current_frame),y=Framecount(last)/2,size=70,font="MS UI Gothic")
SubtitleEx(RANDOM_JIS_STRING(10)+" ‚³‚¿"+String(current_frame),y=Framecount(last)/2+100,size=70,font="MS Gothic")
"""

#z=ScriptClip(z,"Levels(0,1.0,255,0+cf,255+cf)",after_frame=true)
#z=FrameEvaluate(z,"cf=current_frame<=255?current_frame:255",after_frame=true)
#z=ScriptClip(z,filter_string2,after_frame=true)

#z2=FrameEvaluate(z2,"cf=current_frame<=255?current_frame+1:255",after_frame=true)
#z2=ScriptClip(z2,filter_string2,after_frame=true)

#z22=Trim(z2,100,0)


#z3=FrameEvaluate(z2,"cf=current_frame<=255?current_frame+1:255",after_frame=true)
#z3=ScriptClip(z22,filter_string2,after_frame=true)






#turn_a_gundam_op_01_mute=FADE_WITH_BRIGHTNESS_OFFSET(c,0,255,true)

#turn_a_gundam_op_01_mute=ScriptClip(c,"ColorYUV(off_y=current_frame<=255?current_frame:255,opt="+DOUBLE_QUOTE_STRING("")+")")

#turn_a_gundam_op_01_mute=FADE_OUT_WITH_BRIGHTNESS_OFFSET(z,170,false)


TCPServer()
