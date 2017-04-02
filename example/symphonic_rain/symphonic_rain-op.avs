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

#LoadLibrary("avslib")

######## Win32 Movie (640*480) ########

symphonic_rain_op_src=VOB_MPEG2_VIDEO_SOURCE("src\SRTE\SROP.d2v")
symphonic_rain_op_src=SSRC(AudioDub(symphonic_rain_op_src,FFAudioSource("src\SRTE\SROP Tc0 L2 2ch 44.1 192 DELAY 0ms.mp2")),48000)

######## Function ########

global screen_width=Width(symphonic_rain_op_src)
global screen_height=Height(symphonic_rain_op_src)
global frame_per_motion=3

global fade_length=20



function STILL_IMAGE_SOURCE(string filename){
	return AUDIO_DUB_TONE(ImageSource(filename,0,0,30.0,pixel_type="rgb32"),samplerate=48000,channels=2,type="Silence")
}

function RECONSTRUCT_ANIMATION_IMAGE(clip image,int frame_count){
	frame_index=frame_count-1
	cropped_image=Crop(image,0,screen_height*frame_index,screen_width,screen_height)
	return frame_count>1?RECONSTRUCT_ANIMATION_IMAGE(image,frame_index)+cropped_image:cropped_image
}

function ANIMATION_IMAGE_SOURCE(string filename,int frame_count){
	image=STILL_IMAGE_SOURCE(filename)
	return RECONSTRUCT_ANIMATION_IMAGE(image,frame_count)
}

function LOOP_ANIMATION_IMAGE(clip image,int frame_count){
	return EXTEND_ANIMATION_CG(AssumeFPS(SelectEvery(image,1,0,0,0),30.0),frame_count)
}



function MOVE_CG(clip cg,int dir_x,int dir_y){
	cg_frame_count=Framecount(cg)
	return Zoom(ConvertToRGB32(cg),dstx="Spline(n,0,320-(20*("+String(dir_x)+")),"+String(cg_frame_count)+",320+(20*("+String(dir_x)+")),cubic=false)",dsty="Spline(n,0,240-(20*("+String(dir_y)+")),"+String(cg_frame_count)+",240+(20*("+String(dir_y)+")),cubic=false)",factor="1.1")
}

function APPEAR_OVERLAY(clip bg,clip fg,int start_frame){
	overlay_length=25

	middle_frame=start_frame+(overlay_length-1)/2
	end_frame=start_frame+overlay_length-1

	fg_extend=BlankClip(fg,length=start_frame,color=color_black)+EXTEND_ANIMATION_CG(fg,overlay_length)
	result_clip=TRANSFORM(bg,fg_extend,factor="Spline(n,"+String(start_frame)+",1.2,"+String(end_frame)+",1.0,cubic=false)",opacity="Spline(n,0,1.0,"+String(start_frame)+",1.0,"+String(middle_frame)+",1.0,"+String(end_frame)+",0.0,cubic=false)")
	return OVERWRITE_RANGE(bg,result_clip,start_frame,end_frame)
}



global subtitle_clip_width=640
global subtitle_clip_height=480

subtitle_x=50
subtitle_y=400
global subtitle_front_fade_count=30
global subtitle_rear_fade_count=30
global subtitle_font="MS Gothic"
global subtitle_effects="b"
global subtitle_size=28
global subtitle_text_color=color_white
global subtitle_halo_color=color_black

global second_subtitle_text_color=color_lightskyblue

function RIPPLE_EFFECT(clip clip,int x,int y,int start_frame){
	ripple_effect_length=25
	end_frame=start_frame+ripple_effect_length-1

	Assert(IsRGB32(clip),"RIPPLE_EFFECT(): clip only support RGB32 format")

	clip_with_static_ripple=_SUBTITLE_FX_PRE(clip,"○",320,240-165,start_frame,end_frame,subtitle_font,"c",256,second_subtitle_text_color,OVERWRITE_SUBTITLE_COLOR_ALPHA(second_subtitle_text_color,$0))

	clip_with_faded_ripple=ScriptClip(clip_with_static_ripple,"RGBAdjust(a=Spline(current_frame,-1,1.0,"+String(start_frame)+",1.0,"+String(end_frame)+",0.0,Framecount(),0.0,cubic=false))")
	clip_with_ripple_effect=ScriptClip(clip_with_faded_ripple,"FAST_ZOOM(dstx="+String(x)+",dsty="+String(y)+",factor=Spline(current_frame,-1,0.01,"+String(start_frame)+",0.01,"+String(end_frame)+",5.0,Framecount(),5.0,cubic=false))")

	return _SUBTITLE_FX_POST(clip,clip_with_ripple_effect,start_frame,end_frame)
}

######## Win32 CG (640*480) ########

wallpaper_dpcwp04=STILL_IMAGE_SOURCE("src\dpc_plus\wallpaper\dpcwp04.jpg")



bg_cg_shopping_street_a=ANIMATION_IMAGE_SOURCE("src\SRTE\EvBG\sran181a.png",4)
bg_cg_trattoria_restaurant_d=ANIMATION_IMAGE_SOURCE("src\SRTE\EvBG\sran244d.png",4)
bg_cg_tortinita_home_front_d=ANIMATION_IMAGE_SOURCE("src\SRTE\EvBG\sran276d.png",4)
bg_cg_liselsia_home_front_d=ANIMATION_IMAGE_SOURCE("src\SRTE\EvBG\sran316d.png",4)
bg_cg_train_a=ANIMATION_IMAGE_SOURCE("src\SRTE\EvBG\sran350a.png",8)



bg_cg_music_college=STILL_IMAGE_SOURCE("src\SRTE\EvBG\srbg010.bmp") #
bg_cg_corridor=STILL_IMAGE_SOURCE("src\SRTE\EvBG\srbg021.bmp") #
bg_cg_piano_room_01=STILL_IMAGE_SOURCE("src\SRTE\EvBG\srbg030.bmp") #
bg_cg_piano_room_02=STILL_IMAGE_SOURCE("src\SRTE\EvBG\srbg040.bmp") #
bg_cg_college_restaurant=STILL_IMAGE_SOURCE("src\SRTE\EvBG\srbg050.bmp") #
bg_cg_new_classroom=STILL_IMAGE_SOURCE("src\SRTE\EvBG\srbg063.bmp") #
bg_cg_lounge=STILL_IMAGE_SOURCE("src\SRTE\EvBG\srbg080.bmp") #
bg_cg_old_classroom=STILL_IMAGE_SOURCE("src\SRTE\EvBG\srbg100.bmp") #
bg_cg_stage_backside=STILL_IMAGE_SOURCE("src\SRTE\EvBG\srbg140.bmp") #
bg_cg_new_downtown=STILL_IMAGE_SOURCE("src\SRTE\EvBG\srbg160.bmp") #
bg_cg_shopping_street=STILL_IMAGE_SOURCE("src\SRTE\EvBG\srbg180.bmp")
bg_cg_opera_inside=STILL_IMAGE_SOURCE("src\SRTE\EvBG\srbg210.bmp") #
bg_cg_church=STILL_IMAGE_SOURCE("src\SRTE\EvBG\srbg233.bmp") #
bg_cg_trattoria_restaurant=STILL_IMAGE_SOURCE("src\SRTE\EvBG\srbg240.bmp") #
bg_cg_trattoria_restaurant_inside=STILL_IMAGE_SOURCE("src\SRTE\EvBG\srbg250.bmp") #
bg_cg_chris_room=STILL_IMAGE_SOURCE("src\SRTE\EvBG\srbg260.bmp") #
bg_cg_tortinita_home_front=STILL_IMAGE_SOURCE("src\SRTE\EvBG\srbg270.bmp")
bg_cg_tortinita_home_inside=STILL_IMAGE_SOURCE("src\SRTE\EvBG\srbg283.bmp")
bg_cg_tortinita_room=STILL_IMAGE_SOURCE("src\SRTE\EvBG\srbg293.bmp") #
bg_cg_falsita_room=STILL_IMAGE_SOURCE("src\SRTE\EvBG\srbg303.bmp") #
bg_cg_liselsia_home_front=STILL_IMAGE_SOURCE("src\SRTE\EvBG\srbg310.bmp")
bg_cg_library=STILL_IMAGE_SOURCE("src\SRTE\EvBG\srbg320.bmp") #
bg_cg_hospital=STILL_IMAGE_SOURCE("src\SRTE\EvBG\srbg330.bmp")
bg_cg_train=STILL_IMAGE_SOURCE("src\SRTE\EvBG\srbg350.bmp")



event_cg_tortinita_drink_tea=STILL_IMAGE_SOURCE("src\SRTE\EvBG\srbg500.bmp") #
event_cg_tortinita_eating=STILL_IMAGE_SOURCE("src\SRTE\EvBG\srbg504.bmp")
event_cg_chris_hug_tortinita=STILL_IMAGE_SOURCE("src\SRTE\EvBG\srbg512.bmp") # part03
global event_cg_tortinita_act_as_arietta_01=STILL_IMAGE_SOURCE("src\SRTE\EvBG\srbg518.bmp") #
global event_cg_tortinita_act_as_arietta_02=STILL_IMAGE_SOURCE("src\SRTE\EvBG\srbg519.bmp") #
event_cg_tortinita_and_chris_in_park=STILL_IMAGE_SOURCE("src\SRTE\EvBG\srbg522.bmp") #
event_cg_tortinita_talk_with_chris=STILL_IMAGE_SOURCE("src\SRTE\EvBG\srbg594.bmp")

event_cg_phorni_singing_in_street=STILL_IMAGE_SOURCE("src\SRTE\EvBG\srbg516.bmp")
event_cg_phorni_writing=STILL_IMAGE_SOURCE("src\SRTE\EvBG\srbg525.bmp") # part03
global event_cg_phorni_touch_01=STILL_IMAGE_SOURCE("src\SRTE\EvBG\srbg527.bmp") #
global event_cg_phorni_touch_02=STILL_IMAGE_SOURCE("src\SRTE\EvBG\srbg528.bmp") #
event_cg_phorni_kiss_chris=STILL_IMAGE_SOURCE("src\SRTE\EvBG\srbg529.bmp") #
event_cg_phorni_climb_01=STILL_IMAGE_SOURCE("src\SRTE\EvBG\srbg531.bmp")
event_cg_phorni_climb_02=STILL_IMAGE_SOURCE("src\SRTE\EvBG\srbg532.bmp")
event_cg_phorni_climb_03=STILL_IMAGE_SOURCE("src\SRTE\EvBG\srbg533.bmp")

global event_cg_arietta_and_phorni=STILL_IMAGE_SOURCE("src\SRTE\EvBG\srbg535.bmp") #
global event_cg_arietta_wake_up=STILL_IMAGE_SOURCE("src\SRTE\EvBG\srbg538.bmp") #
event_cg_arietta_watch_chris_playing_piano=STILL_IMAGE_SOURCE("src\SRTE\EvBG\srbg539.bmp") #
event_cg_arietta_read_mail=STILL_IMAGE_SOURCE("src\SRTE\EvBG\srbg593.bmp") # part03
event_cg_arietta_and_chris_walking=STILL_IMAGE_SOURCE("src\SRTE\EvBG\srbg598.bmp") # part03

event_cg_falsita_in_rain=STILL_IMAGE_SOURCE("src\SRTE\EvBG\srbg543.bmp") #
event_cg_falsita_eating=STILL_IMAGE_SOURCE("src\SRTE\EvBG\srbg547.bmp") #
event_cg_falsita_before_h=STILL_IMAGE_SOURCE("src\SRTE\EvBG\srbg553.bmp") #
event_cg_falsita_after_h=STILL_IMAGE_SOURCE("src\SRTE\EvBG\srbg595.bmp") # part03

event_cg_liselsia_cry_then_eat=STILL_IMAGE_SOURCE("src\SRTE\EvBG\srbg564.bmp") #
event_cg_liselsia_is_punished=STILL_IMAGE_SOURCE("src\SRTE\EvBG\srbg569.bmp") # part03
event_cg_liselsia_get_hurt=STILL_IMAGE_SOURCE("src\SRTE\EvBG\srbg572.bmp")
event_cg_liselsia_faint=STILL_IMAGE_SOURCE("src\SRTE\EvBG\srbg580.bmp") #
global event_cg_liselsia_in_hospital_01=STILL_IMAGE_SOURCE("src\SRTE\EvBG\srbg582.bmp") #
global event_cg_liselsia_in_hospital_02=STILL_IMAGE_SOURCE("src\SRTE\EvBG\srbg584.bmp") #
event_cg_liselsia_in_hospital_happy=STILL_IMAGE_SOURCE("src\SRTE\EvBG\srbg597.bmp") # part03



global character_cg_tortinita_shock=STILL_IMAGE_SOURCE("src\SRTE\EvCG\srchr012.png") #
global character_cg_tortinita_angry=STILL_IMAGE_SOURCE("src\SRTE\EvCG\srchr013.png") #
global character_cg_tortinita_happy=STILL_IMAGE_SOURCE("src\SRTE\EvCG\srchr014.png") #

global character_cg_arietta_shock=STILL_IMAGE_SOURCE("src\SRTE\EvCG\srchr022.png") #
global character_cg_arietta_sad=STILL_IMAGE_SOURCE("src\SRTE\EvCG\srchr024.png") #
global character_cg_arietta_cry=STILL_IMAGE_SOURCE("src\SRTE\EvCG\srchr026.png") #

global character_cg_falsita_happy=STILL_IMAGE_SOURCE("src\SRTE\EvCG\srchr040.png")
global character_cg_falsita_huh=STILL_IMAGE_SOURCE("src\SRTE\EvCG\srchr042.png") #
global character_cg_falsita_shame=STILL_IMAGE_SOURCE("src\SRTE\EvCG\srchr043.png") #
global character_cg_falsita_angry=STILL_IMAGE_SOURCE("src\SRTE\EvCG\srchr047.png") #

global character_cg_liselsia_happy=STILL_IMAGE_SOURCE("src\SRTE\EvCG\srchr070.png") #
global character_cg_liselsia_sad=STILL_IMAGE_SOURCE("src\SRTE\EvCG\srchr076.png") #
global character_cg_liselsia_relax=STILL_IMAGE_SOURCE("src\SRTE\EvCG\srchr077.png") #

global character_cg_phorni_angry=STILL_IMAGE_SOURCE("src\SRTE\EvCG\srchr091.png")
global character_cg_phorni_happy=STILL_IMAGE_SOURCE("src\SRTE\EvCG\srchr093.png")
global character_cg_phorni_shame=STILL_IMAGE_SOURCE("src\SRTE\EvCG\srchr096.png")
global character_cg_phorni_singing=STILL_IMAGE_SOURCE("src\SRTE\EvCG\srchr128.png")

character_cg_height=Height(character_cg_tortinita_shock)

######## Trim ########

symphonic_rain_op_title=Trim(symphonic_rain_op_src,690,942)
symphonic_rain_op_src_01=Trim(symphonic_rain_op_src,0,1769)
symphonic_rain_op_src_02=Trim(symphonic_rain_op_src,1770,4238)
symphonic_rain_op_src_03=Trim(symphonic_rain_op_src,4239,0)

######## Pre Combine ########

title_cg=Zoom(EXTEND_ANIMATION_CG(wallpaper_dpcwp04,165+(fade_length*2)),srcx="410",srcy="Spline(n,0,350,165-1+(fade_length*2),310,cubic=false)",factor="Spline(n,0,0.84,165-1+(fade_length*2),0.79,cubic=false)",width=640,height=480)
title_cg=EffectRipples2(title_cg,165,speed=10.0)
title_cg=ConvertToYV12(title_cg)

title_text=Loop(symphonic_rain_op_title,1+(286+fade_length-fade_length)-Framecount(symphonic_rain_op_title),133,133)
title_text=ColorYUV(title_text,gain_y=-512.0,off_y=256.0)
#title_text=Overlay(BlankClip(title_text,color=color_white),title_text,mask=Levels(Greyscale(title_text),32,1.0,63,0,511,coring=false),mode="Blend")



#bg_animation_trattoria_shop_d=LOOP_ANIMATION_IMAGE(bg_cg_trattoria_restaurant_d,206+fade_length)
bg_animation_tortinita_home_front_d=Zoom(LOOP_ANIMATION_IMAGE(bg_cg_tortinita_home_front_d,211+(fade_length/2)),dstx="Spline(n,0,280,206,320,cubic=false)",dsty="Spline(n,0,195,206,220,cubic=false)",factor="Spline(n,0,1.2,206,1.1,cubic=false)")
bg_animation_train_a=Zoom(LOOP_ANIMATION_IMAGE(bg_cg_train_a,206+fade_length),dstx="Spline(n,0,340,206,300,cubic=false)",dsty="screen_height/2",factor="Spline(n,0,1.1,206,1.2,cubic=false)")
bg_animation_liselsia_home_front_d=Zoom(LOOP_ANIMATION_IMAGE(bg_cg_liselsia_home_front_d,206+fade_length),dstx="Spline(n,0,300,206,340,cubic=false)",dsty="Spline(n,0,195,206,220,cubic=false)",factor="Spline(n,0,1.2,206,1.1,cubic=false)")
bg_animation_shopping_street_a=Zoom(LOOP_ANIMATION_IMAGE(bg_cg_shopping_street_a,206+fade_length),dstx="Spline(n,0,300,206,260,cubic=false)",dsty="screen_height/2",factor="Spline(n,0,1.1,206,1.2,cubic=false)")

character_animation_tortinita_01=ANIMATION_CG_VARY("character_cg_tortinita_happy,character_cg_tortinita_shock,character_cg_tortinita_angry",fade_length/2,"5+51,52,52*2+fade_length/2")
character_animation_arietta_01=ANIMATION_CG_VARY("character_cg_arietta_shock,character_cg_arietta_sad,character_cg_arietta_cry",fade_length/2,"fade_length/2+51,52,52*2+fade_length/2")
character_animation_falsita_01=ANIMATION_CG_VARY("character_cg_falsita_huh,character_cg_falsita_angry,character_cg_falsita_shame",fade_length/2,"fade_length/2+51,52,52*2+fade_length/2")
character_animation_liselsia_01=ANIMATION_CG_VARY("character_cg_liselsia_happy,character_cg_liselsia_sad,character_cg_liselsia_relax",fade_length/2,"fade_length/2+51,52,52*2+fade_length/2")



tortinita_in_home=TRANSFORM(bg_animation_tortinita_home_front_d,character_animation_tortinita_01,dstx="Spline(n,0,270,206,250,cubic=false)",dsty="screen_height-character_cg_height/2",factor="Spline(n,0,1.15,206,1.05,cubic=false)",angle="Spline(n,0,3,206,-3,cubic=false)")
tortinita_in_home=Blur(EffectRain(tortinita_in_home,type="med",red=200,green=200,blue=200,vary="constv",initop=5,finop=90),0.7)
tortinita_in_home=ConvertToYV12(tortinita_in_home)

falsita_on_train=TRANSFORM(bg_animation_train_a,character_animation_falsita_01,dstx="Spline(n,0,470,206,490,cubic=false)",dsty="screen_height-character_cg_height/2+50",factor="Spline(n,0,1.2,206,1.3,cubic=false)",angle="Spline(n,0,-3,206,3,cubic=false)")
falsita_on_train=ConvertToYV12(falsita_on_train)

liselsia_in_front_of_house=TRANSFORM(bg_animation_liselsia_home_front_d,character_animation_liselsia_01,dstx="Spline(n,0,470,206,450,cubic=false)",dsty="screen_height-character_cg_height/2",factor="Spline(n,0,1.05,206,1.15,cubic=false)",angle="Spline(n,0,3,206,-3,cubic=false)")
liselsia_in_front_of_house=Blur(EffectRain(liselsia_in_front_of_house,type="med",red=200,green=200,blue=200,vary="constv",initop=5,finop=90),0.7)
liselsia_in_front_of_house=ConvertToYV12(liselsia_in_front_of_house)

arietta_in_shopping_street=TRANSFORM(bg_animation_shopping_street_a,character_animation_arietta_01,dstx="Spline(n,0,190,206,210,cubic=false)",dsty="screen_height-character_cg_height/2",factor="Spline(n,0,1.15,206,1.05,cubic=false)",angle="Spline(n,0,-3,206,3,cubic=false)")
arietta_in_shopping_street=ConvertToYV12(arietta_in_shopping_street)



event_animation_phorni_touch=MOVE_CG(ANIMATION_CG_VARY("event_cg_phorni_touch_01,event_cg_phorni_touch_02",fade_length/2,"(fade_length/2)+52,52*2"),0,-1)
event_animation_phorni_touch=ConvertToYV12(event_animation_phorni_touch)

event_animation_tortinita_act_as_arietta=ANIMATION_CG_VARY("event_cg_tortinita_act_as_arietta_01,event_cg_tortinita_act_as_arietta_02",fade_length,"(fade_length/2)+52,52+(fade_length/2)")
event_animation_tortinita_01=Dissolve( \
	MOVE_CG(EXTEND_ANIMATION_CG(event_cg_tortinita_drink_tea,52+(fade_length/2)),-1,0), \
	MOVE_CG(EXTEND_ANIMATION_CG(event_cg_tortinita_and_chris_in_park,52+fade_length),0,1), \
	MOVE_CG(event_animation_tortinita_act_as_arietta,1,0), \
	fade_length)
event_animation_tortinita_01=ConvertToYV12(event_animation_tortinita_01)

event_animation_falsita_01=Dissolve( \
	MOVE_CG(EXTEND_ANIMATION_CG(event_cg_falsita_in_rain,52+fade_length),-1,0), \
	MOVE_CG(EXTEND_ANIMATION_CG(event_cg_falsita_eating,52+fade_length),0,1), \
	MOVE_CG(EXTEND_ANIMATION_CG(event_cg_falsita_before_h,52*2+fade_length),1,0), \
	fade_length)
event_animation_falsita_01=ConvertToYV12(event_animation_falsita_01)

event_animation_liselsia_in_hospital=ANIMATION_CG_VARY("event_cg_liselsia_in_hospital_01,event_cg_liselsia_in_hospital_02",fade_length,"(fade_length/2)+52,52+(fade_length/2)")
event_animation_liselsia_01=Dissolve( \
	MOVE_CG(EXTEND_ANIMATION_CG(event_cg_liselsia_cry_then_eat,52+fade_length),-1,0), \
	MOVE_CG(EXTEND_ANIMATION_CG(event_cg_liselsia_faint,52+fade_length),0,1), \
	MOVE_CG(event_animation_liselsia_in_hospital,1,0), \
	fade_length)
event_animation_liselsia_01=ConvertToYV12(event_animation_liselsia_01)

event_animation_phorni_get_back_into_arietta=ANIMATION_CG_VARY("event_cg_arietta_and_phorni,event_cg_arietta_wake_up",fade_length,"(fade_length/2)+52,52+(fade_length/2)")
event_animation_arietta_01=Dissolve( \
	MOVE_CG(event_animation_phorni_get_back_into_arietta,0,1), \
	MOVE_CG(EXTEND_ANIMATION_CG(event_cg_arietta_watch_chris_playing_piano,52+fade_length),-1,0), \
	MOVE_CG(EXTEND_ANIMATION_CG(event_cg_phorni_kiss_chris,52+(fade_length/2)),1,1), \
	fade_length)
event_animation_arietta_01=ConvertToYV12(event_animation_arietta_01)



symphonic_rain_pre_op=MOVE_CG(EXTEND_ANIMATION_CG(bg_cg_music_college,7),-1,0)+MOVE_CG(EXTEND_ANIMATION_CG(bg_cg_corridor,7),0,-1)+MOVE_CG(EXTEND_ANIMATION_CG(bg_cg_piano_room_01,19),1,0)+MOVE_CG(EXTEND_ANIMATION_CG(bg_cg_piano_room_02,19),0,1)+MOVE_CG(EXTEND_ANIMATION_CG(bg_cg_college_restaurant,103),1,1) \
	+MOVE_CG(EXTEND_ANIMATION_CG(bg_cg_new_classroom,7),-1,0)+MOVE_CG(EXTEND_ANIMATION_CG(bg_cg_old_classroom,6),0,-1)+MOVE_CG(EXTEND_ANIMATION_CG(bg_cg_lounge,19),1,0)+MOVE_CG(EXTEND_ANIMATION_CG(bg_cg_stage_backside,20),0,1)+MOVE_CG(EXTEND_ANIMATION_CG(bg_cg_new_downtown,103),-1,1)
symphonic_rain_pre_op=ConvertToYV12(symphonic_rain_pre_op)

symphonic_rain_in_op=MOVE_CG(EXTEND_ANIMATION_CG(bg_cg_trattoria_restaurant,7),-1,0)+MOVE_CG(EXTEND_ANIMATION_CG(bg_cg_trattoria_restaurant_inside,7),0,-1)+MOVE_CG(EXTEND_ANIMATION_CG(bg_cg_chris_room,19),1,0)+MOVE_CG(EXTEND_ANIMATION_CG(bg_cg_library,19),0,1)+MOVE_CG(EXTEND_ANIMATION_CG(bg_cg_church,26),-1,-1) \
	+MOVE_CG(EXTEND_ANIMATION_CG(bg_cg_tortinita_room,19),1,-1)+MOVE_CG(EXTEND_ANIMATION_CG(bg_cg_falsita_room,19),1,1)+MOVE_CG(EXTEND_ANIMATION_CG(bg_cg_opera_inside,206),-1,1)
symphonic_rain_in_op=ConvertToYV12(symphonic_rain_in_op)



symphonic_rain_op_part_03=ConvertToRGB32(symphonic_rain_op_src_03)
symphonic_rain_op_part_03=APPEAR_OVERLAY(symphonic_rain_op_part_03,ConvertToRGB32(event_cg_liselsia_is_punished),828)
symphonic_rain_op_part_03=APPEAR_OVERLAY(symphonic_rain_op_part_03,ConvertToRGB32(event_cg_arietta_read_mail),879)
symphonic_rain_op_part_03=APPEAR_OVERLAY(symphonic_rain_op_part_03,ConvertToRGB32(event_cg_chris_hug_tortinita),931)
symphonic_rain_op_part_03=APPEAR_OVERLAY(symphonic_rain_op_part_03,ConvertToRGB32(event_cg_phorni_writing),1034)
symphonic_rain_op_part_03=APPEAR_OVERLAY(symphonic_rain_op_part_03,ConvertToRGB32(event_cg_falsita_after_h),1085)
symphonic_rain_op_part_03=APPEAR_OVERLAY(symphonic_rain_op_part_03,ConvertToRGB32(event_cg_liselsia_in_hospital_happy),1137)
symphonic_rain_op_part_03=ConvertToYV12(symphonic_rain_op_part_03)
last_overlay=ConvertToYV12(Zoom(ConvertToRGB32(EXTEND_ANIMATION_CG(event_cg_arietta_and_chris_walking,141+(fade_length/2))),factor="Spline(n,0,1.2,141+(fade_length/2),1.0,cubic=false)"))
symphonic_rain_op_part_03=Dissolve(TRIM_FIRST_CLIP(symphonic_rain_op_part_03,1239+(fade_length/2)),last_overlay,fade_length)



ripple_clip=BlankClip(symphonic_rain_op_src,length=234+(fade_length/2),pixel_type="RGB32",color=color_black)
ripple_clip=RIPPLE_EFFECT(ripple_clip,320,240,0)
ripple_clip=RIPPLE_EFFECT(ripple_clip,320-200,240,7)
ripple_clip=RIPPLE_EFFECT(ripple_clip,320+200,240,15)
ripple_clip=RIPPLE_EFFECT(ripple_clip,320,240-200,35)
ripple_clip=RIPPLE_EFFECT(ripple_clip,320,240+200,56)
ripple_clip=RIPPLE_EFFECT(ripple_clip,320,240,111)
ripple_clip=RIPPLE_EFFECT(ripple_clip,320+200,240+200,118)
ripple_clip=RIPPLE_EFFECT(ripple_clip,320-200,240-200,126)
ripple_clip=RIPPLE_EFFECT(ripple_clip,320-200,240+200,149)
ripple_clip=RIPPLE_EFFECT(ripple_clip,320+200,240-200,172)
ripple_clip=ConvertToYV12(ripple_clip)

######## Combine ########

# symphonic_rain_op_src_01 324
# symphonic_rain_op_src_02 4151
# symphonic_rain_op_src_03 6620



symphonic_rain_op_t00=BlankClip(symphonic_rain_op_src,length=29,color=color_black)
symphonic_rain_op_t01=Dissolve(symphonic_rain_pre_op,symphonic_rain_op_src_01,15)
symphonic_rain_op_t02=Dissolve(TRIM_FIRST_CLIP(tortinita_in_home,211+(fade_length/2)),TRIM_FIRST_CLIP(falsita_on_train,206+fade_length),TRIM_FIRST_CLIP(liselsia_in_front_of_house,205+fade_length),TRIM_FIRST_CLIP(arietta_in_shopping_street,155+fade_length),TRIM_FIRST_CLIP(event_animation_phorni_touch,141+(fade_length/2)),fade_length)
symphonic_rain_op_t03=symphonic_rain_in_op
symphonic_rain_op_t04=Dissolve(TRIM_FIRST_CLIP(event_animation_tortinita_01,206+(fade_length/2)),TRIM_FIRST_CLIP(event_animation_falsita_01,206+fade_length),TRIM_FIRST_CLIP(event_animation_liselsia_01,205+fade_length),TRIM_FIRST_CLIP(event_animation_arietta_01,200+(fade_length/2)),fade_length)
symphonic_rain_op_t05=symphonic_rain_op_src_02
symphonic_rain_op_t06=TRIM_FIRST_CLIP(symphonic_rain_op_part_03,1380)
symphonic_rain_op_t07=Dissolve(ripple_clip,TRIM_FIRST_CLIP(title_cg,165+(fade_length*2)),TRIM_FIRST_CLIP(title_text,286+fade_length-fade_length),BlankClip(symphonic_rain_op_src,length=150,color=color_white),fade_length)



symphonic_rain_op_mute=symphonic_rain_op_t00+symphonic_rain_op_t01+FADE_OUT_WITH_BRIGHTNESS_OFFSET(FadeIn0(symphonic_rain_op_t02,fade_length),fade_length) \
	+FADE_OUT_WITH_BRIGHTNESS_OFFSET(symphonic_rain_op_t03,fade_length*5) \
	+FadeOut0(FADE_IN_WITH_BRIGHTNESS_OFFSET(symphonic_rain_op_t04,fade_length),fade_length)+symphonic_rain_op_t05+FadeOut0(symphonic_rain_op_t06,fade_length) \
	+symphonic_rain_op_t07

######## Music ########

bgm_48khz=SSRC(WAVSource("src\for_ritz-01.wav"),48000)
AudioDub(symphonic_rain_op_mute,bgm_48khz)



thumbnail=Trim(2114,-30*5)

######## Subtitle ########

function SUBTITLE_FX(clip clip,string text,float x,float y,int start_frame,int end_frame,bool "is_title"){
	is_title=Default(is_title,false)

	text_color=is_title?second_subtitle_text_color:subtitle_text_color

	return SUBTITLE_FX_FADE_IN_FADE_OUT(clip,text,x,y,start_frame,end_frame,subtitle_front_fade_count,subtitle_rear_fade_count,subtitle_font,subtitle_effects,subtitle_size,text_color,subtitle_halo_color)
}

ConvertToRGB32()

SUBTITLE_FX("空の向こうに//岡崎律子|- by fielia@AVISynth",-subtitle_x,subtitle_y-subtitle_size,8490,8685,true)

SUBTITLE_FX("それぞれのかなしみがあって",subtitle_x,subtitle_y,648,825)
SUBTITLE_FX("イエナイナミダがある",subtitle_x,subtitle_y,860,981)
SUBTITLE_FX("In the rain",subtitle_x,subtitle_y,1014,1144)

SUBTITLE_FX("見えるものと 見えぬもの",subtitle_x,subtitle_y,1262,1405)
SUBTITLE_FX("静かに瞳を凝らして",subtitle_x,subtitle_y,1467,1599)
SUBTITLE_FX("帰る場所はどこにある?",subtitle_x,subtitle_y,1676,1816)
SUBTITLE_FX("心は迷子のまま",subtitle_x,subtitle_y,1881,2020)

SUBTITLE_FX("それぞれのかなしみがあって",subtitle_x,subtitle_y,2088,2270)
SUBTITLE_FX("イエナイナミダがある",subtitle_x,subtitle_y,2298,2440)
SUBTITLE_FX("いつか雲間から降りそそぐ",subtitle_x,subtitle_y,2505,2680)
SUBTITLE_FX("光はあるだろうか",subtitle_x,subtitle_y,2710,2844)
SUBTITLE_FX("Even in the rain",subtitle_x,subtitle_y,2864,3002)

SUBTITLE_FX("どれが本当 どれが嘘",subtitle_x,subtitle_y,3321,3450)
SUBTITLE_FX("そんなことにも迷う",subtitle_x,subtitle_y,3522,3666)
SUBTITLE_FX("信じる それとも疑う",subtitle_x,subtitle_y,3727,3875)
SUBTITLE_FX("心は振子のよう",subtitle_x,subtitle_y,3938,4085)

SUBTITLE_FX("それぞれの行く先があって",subtitle_x,subtitle_y,4144,4337)
SUBTITLE_FX("ココロに秘密の場所",subtitle_x,subtitle_y,4356,4507)
SUBTITLE_FX("だれも知らぬ朝 降りそそぐ",subtitle_x,subtitle_y,4562,4744)
SUBTITLE_FX("光は来るだろうか",subtitle_x,subtitle_y,4768,4903)
SUBTITLE_FX("Even in the rain",subtitle_x,subtitle_y,4922,5083)

SUBTITLE_FX("それぞれに幸せがあるの",subtitle_x,subtitle_y,6203,6387)
SUBTITLE_FX("ココロはそこへ向かう",subtitle_x,subtitle_y,6414,6548)
SUBTITLE_FX("きっと この胸に降りそそぐ",subtitle_x,subtitle_y,6619,6805)
SUBTITLE_FX("光はあると思う",subtitle_x,subtitle_y,6826,6965)
SUBTITLE_FX("In the rain",subtitle_x,subtitle_y-subtitle_size,6979,7155)
SUBTITLE_FX("In the rain",subtitle_x,subtitle_y,7185,7378)



#thumbnail

######## Post Processing ########

ConvertToYV12()
#ConvertToYUY2()
#ConvertToRGB24()

TCPServer()
