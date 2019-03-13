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

Import("dennou_coil-tv-common.avsi")

######## TV (1920*1080) ########

densuke_walk_interval=ImageSource("src\densuke\densuke_walk_interval_%06d.png",0,23,24000.0/1001.0,pixel_type="rgb32")

######## Function ########

function MOVE_CG(clip cg,int dir_x,int dir_y,float move_offset,float scale){
	cg_frame_count=Framecount(cg)
	cg_width_half=Width(cg)/2
	cg_height_half=Height(cg)/2
	move_offset_half=move_offset*0.5

	return ScriptClip(cg,"FAST_ZOOM(dstx=Spline(current_frame,0,"+String(cg_width_half)+"-("+String(move_offset_half)+"*("+String(dir_x)+")),"+String(cg_frame_count)+","+String(cg_width_half)+"+("+String(move_offset_half)+"*("+String(dir_x)+")),cubic=false)," \
		+"dsty=Spline(current_frame,0,"+String(cg_height_half)+"-("+String(move_offset_half)+"*("+String(dir_y)+")),"+String(cg_frame_count)+","+String(cg_height_half)+"+("+String(move_offset_half)+"*("+String(dir_y)+")),cubic=false),factor="+String(scale)+",extend=true)")
}

######## Pre Combine ########

dissolve_length=24
dissolve_length_2=dissolve_length*2



# duration: 832~5228, total 4397 frame, need to loop 183 times plus 5 frames
densuke_walk=Loop(Loop(densuke_walk_interval,31)+TRIM_LAST_CLIP(densuke_walk_interval,1),5)+Loop(densuke_walk_interval,28)



dennou_coil_tv_clean_ed_02_extend=Loop(dennou_coil_tv_clean_ed_02,13,985,1019)



move_offset=Float(Width(dennou_coil_tv_clean_ed))*0.1

#dennou_coil_tv_01_illegal_see_obsolete_space_pan_left=MOVE_CG(STILL_MIDDLE_FRAME(dennou_coil_tv_01_illegal_see_obsolete_space,dissolve_length_2+1),1,0,move_offset,1.1)
dennou_coil_tv_02_fumie_talk_with_yasako_pan_left=MOVE_CG(TRIM_MIDDLE_CLIP(dennou_coil_tv_02_fumie_talk_with_yasako,dissolve_length_2+124),1,0,move_offset,1.1)
dennou_coil_tv_03_isako_watch_illegal_pan_left=MOVE_CG(STILL_MIDDLE_FRAME(dennou_coil_tv_03_isako_watch_illegal,dissolve_length_2+307),1,0,move_offset,1.1)
dennou_coil_tv_04_truck_right_cut_isako_tell_to_yasako_reverse=Reverse(dennou_coil_tv_04_truck_right_cut_isako_tell_to_yasako)
dennou_coil_tv_05_kenichi_control_search_maton_pan_left=MOVE_CG(STILL_LAST_FRAME(dennou_coil_tv_05_kenichi_control_search_maton,dissolve_length_2+78),1,0,move_offset,1.1)
dennou_coil_tv_07_isako_see_lighting_mark_pan_left=MOVE_CG(STILL_MIDDLE_FRAME(dennou_coil_tv_07_isako_see_lighting_mark,dissolve_length+77),1,0,move_offset,1.1)
dennou_coil_tv_08_kanna_s_mother_meet_kenichi_pan_left=MOVE_CG(TRIM_FIRST_CLIP(dennou_coil_tv_08_kanna_s_mother_meet_kenichi,dissolve_length_2+288),1,0,move_offset,1.1)
dennou_coil_tv_09_tamako_maintain_search_maton_pan_left=MOVE_CG(STILL_LAST_FRAME(dennou_coil_tv_09_tamako_maintain_search_maton,dissolve_length_2+77),1,0,move_offset,1.1)
dennou_coil_tv_10_truck_left_cut_yasako_and_nobuhiko_in_coil_domain_pan_left=MOVE_CG(TRIM_MIDDLE_CLIP(dennou_coil_tv_10_truck_left_cut_yasako_and_nobuhiko_in_coil_domain,dissolve_length+76),1,0,move_offset,1.1)
dennou_coil_tv_11_truck_right_cut_daikoku_city_under_water_reverse=Reverse(dennou_coil_tv_11_truck_right_cut_daikoku_city_under_water)
dennou_coil_tv_12_hair_field_pan_left=MOVE_CG(TRIM_LAST_CLIP(dennou_coil_tv_12_hair_field,dissolve_length_2+77),1,0,move_offset,1.1)
dennou_coil_tv_13_truck_left_cut_yasako_and_kenichi_see_denpa_touch_illegal_dinosaur_pan_left=MOVE_CG(TRIM_MIDDLE_CLIP(dennou_coil_tv_13_truck_left_cut_yasako_and_kenichi_see_denpa_touch_illegal_dinosaur,dissolve_length+77),1,0,move_offset,1.1)
dennou_coil_tv_17_truck_right_cut_library_reverse=Reverse(dennou_coil_tv_17_truck_right_cut_library)
dennou_coil_tv_18_truck_right_cut_daikoku_city_in_rain_and_yasako_hang_up_telephone_reverse=Reverse(dennou_coil_tv_18_truck_right_cut_daikoku_city_in_rain_and_yasako_hang_up_telephone)

######## Combine ########

# dennou_coil_tv_clean_ed_01 4
# dennou_coil_tv_clean_ed_02 5205 (5217)



dennou_coil_tv_ed_t01=BlankClip(dennou_coil_tv_clean_ed,length=4,color=color_black)+dennou_coil_tv_clean_ed_01
dennou_coil_tv_ed_t02=Dissolve(TRIM_MIDDLE_CLIP(dennou_coil_tv_04_truck_right_cut_isako_tell_to_yasako_reverse,dissolve_length+175),TRIM_MIDDLE_CLIP(dennou_coil_tv_06_truck_left_cut_kenichi_talk_with_yasako_and_fumie,dissolve_length_2+287),dissolve_length_2)
dennou_coil_tv_ed_t03=Dissolve(TRIM_MIDDLE_CLIP(dennou_coil_tv_14_truck_left_cut_sousuke_talk_with_kenichi_near_crossroads,dissolve_length_2+317),TRIM_MIDDLE_CLIP(dennou_coil_tv_24_truck_left_cut_shizue_hug_yasako,dissolve_length_2+316),TRIM_FIRST_CLIP(dennou_coil_tv_09_tamako_maintain_search_maton_pan_left,dissolve_length_2+77),dissolve_length_2)

dennou_coil_tv_ed_t04=TRIM_MIDDLE_CLIP(dennou_coil_tv_02_fumie_talk_with_yasako_pan_left,dissolve_length_2+124)

dennou_coil_tv_ed_t05=Dissolve(TRIM_MIDDLE_CLIP(dennou_coil_tv_10_truck_left_cut_yasako_and_kenichi_in_jinja_02,dissolve_length_2+307),TRIM_MIDDLE_CLIP(dennou_coil_tv_16_truck_left_cut_doll,dissolve_length_2+288),TRIM_MIDDLE_CLIP(dennou_coil_tv_19_truck_left_cut_yasako_and_fumie_in_sanae_s_room,dissolve_length_2+125),dissolve_length_2)
dennou_coil_tv_ed_t06=Dissolve(TRIM_FIRST_CLIP(dennou_coil_tv_03_isako_watch_illegal_pan_left,dissolve_length_2+307),TRIM_FIRST_CLIP(dennou_coil_tv_08_kanna_s_mother_meet_kenichi_pan_left,dissolve_length_2+288),dissolve_length_2)
dennou_coil_tv_ed_t07=Dissolve(TRIM_LAST_CLIP(dennou_coil_tv_23_truck_left_cut_2dot0_fly_in_front_of_house,dissolve_length_2+316),TRIM_MIDDLE_CLIP(dennou_coil_tv_17_truck_right_cut_library_reverse,dissolve_length_2+316),TRIM_FIRST_CLIP(dennou_coil_tv_05_kenichi_control_search_maton_pan_left,dissolve_length_2+78),dissolve_length_2)

dennou_coil_tv_ed_t08=Dissolve(TRIM_MIDDLE_CLIP(dennou_coil_tv_20_truck_left_cut_road_in_night_non_fade_in,dissolve_length_2+76),TRIM_MIDDLE_CLIP(dennou_coil_tv_13_truck_left_cut_yasako_and_kenichi_see_denpa_touch_illegal_dinosaur_pan_left,dissolve_length+77), \
	TRIM_LAST_CLIP(dennou_coil_tv_18_truck_right_cut_daikoku_city_in_rain_and_yasako_hang_up_telephone_reverse,dissolve_length+154), \
	TRIM_MIDDLE_CLIP(dennou_coil_tv_10_truck_left_cut_yasako_and_nobuhiko_in_coil_domain_pan_left,dissolve_length+76),TRIM_FIRST_CLIP(dennou_coil_tv_07_isako_see_lighting_mark_pan_left,dissolve_length+77), \
	TRIM_LAST_CLIP(dennou_coil_tv_15_truck_left_cut_yasako_and_takeru_see_jinja_non_fade_in,dissolve_length+77),TRIM_LAST_CLIP(dennou_coil_tv_25_truck_left_cut_mayumi_tell_yasako,dissolve_length+67),dissolve_length)

dennou_coil_tv_ed_t09=Dissolve(TRIM_LAST_CLIP(dennou_coil_tv_12_hair_field_pan_left,dissolve_length_2+77),TRIM_MIDDLE_CLIP(dennou_coil_tv_11_truck_right_cut_daikoku_city_under_water_reverse,dissolve_length_2+85),TRIM_LAST_CLIP(dennou_coil_tv_21_truck_left_cut_isako_use_computer,dissolve_length_2+145),TRIM_LAST_CLIP(dennou_coil_tv_22_truck_left_cut_car,dissolve_length_2+117+dissolve_length),dissolve_length_2)
dennou_coil_tv_ed_t10=Dissolve(TRIM_FIRST_CLIP(dennou_coil_tv_clean_ed_02_extend,1119),TRIM_MIDDLE_CLIP(dennou_coil_tv_26_yasako_meet_isako_in_torii_corridor_02,dissolve_length+155),TRIM_FIRST_CLIP(dennou_coil_tv_26_yasako_hug_illegal_densuke,dissolve_length+76),Trim(dennou_coil_tv_clean_ed_02_extend,1350-dissolve_length,0),dissolve_length)+BlankClip(dennou_coil_tv_clean_ed,length=24*7,color=color_black)



dennou_coil_tv_ed_densuke_walk_bg=Dissolve(dennou_coil_tv_ed_t02,dennou_coil_tv_ed_t03,dennou_coil_tv_ed_t04, \
	dennou_coil_tv_ed_t05,dennou_coil_tv_ed_t06,dennou_coil_tv_ed_t07,dennou_coil_tv_ed_t08, \
	dennou_coil_tv_ed_t09,dissolve_length_2)

dennou_coil_tv_ed_densuke_walk_bg=ConvertToRGB32(dennou_coil_tv_ed_densuke_walk_bg,matrix="Rec709")
dennou_coil_tv_ed_t01_rgb=ConvertToRGB32(dennou_coil_tv_ed_t01,matrix="Rec709")
dennou_coil_tv_ed_t10_rgb=ConvertToRGB32(dennou_coil_tv_ed_t10,matrix="Rec709")



dennou_coil_tv_ed_densuke_walk=Layer(dennou_coil_tv_ed_densuke_walk_bg,densuke_walk,op="Add")
dennou_coil_tv_ed_densuke_walk_work_in_progress=Layer(BlankClip(dennou_coil_tv_ed_densuke_walk_bg,color=color_blue),densuke_walk,op="Add")



dennou_coil_tv_ed_mute=Dissolve(dennou_coil_tv_ed_t01_rgb,dennou_coil_tv_ed_densuke_walk,dennou_coil_tv_ed_t10_rgb,dissolve_length)
dennou_coil_tv_ed_mute=Lanczos4Resize(dennou_coil_tv_ed_mute,1920,1080)
dennou_coil_tv_ed_mute



dennou_coil_tv_ed_densuke_walk_work_in_progress=Lanczos4Resize(dennou_coil_tv_ed_densuke_walk_work_in_progress,1920,1080)
dennou_coil_tv_ed_t01_work_in_progress=Lanczos4Resize(dennou_coil_tv_ed_t01_rgb,1920,1080)
dennou_coil_tv_ed_t10_work_in_progress=Lanczos4Resize(dennou_coil_tv_ed_t10_rgb,1920,1080)

work_in_progress_subtitle_x=Round(50*2.25)
work_in_progress_subtitle_y=Round(50*2.25)
work_in_progress_subtitle_font="MS Gothic"
work_in_progress_subtitle_size=Round(32*2.25)

dennou_coil_tv_ed_densuke_walk_work_in_progress=Subtitle(dennou_coil_tv_ed_densuke_walk_work_in_progress,"chroma key/クロマキー",work_in_progress_subtitle_x,work_in_progress_subtitle_y,font=work_in_progress_subtitle_font,size=work_in_progress_subtitle_size)
dennou_coil_tv_ed_t10_work_in_progress=Subtitle(dennou_coil_tv_ed_t10_work_in_progress,"rendering result/レンダリング結果",work_in_progress_subtitle_x,work_in_progress_subtitle_y,font=work_in_progress_subtitle_font,size=work_in_progress_subtitle_size)

dennou_coil_tv_ed_mute_work_in_progress=Dissolve(dennou_coil_tv_ed_t01_work_in_progress,dennou_coil_tv_ed_densuke_walk_work_in_progress,dennou_coil_tv_ed_t10_work_in_progress,dissolve_length)

### export clip: dennou_coil_tv_ed_mute_work_in_progress

### prefetch: 5,2

### ###

######## Subtitle ########

### inherit start ###

global subtitle_clip_width=1920
global subtitle_clip_height=1080

subtitle_x=50*2.25
subtitle_y=395*2.25
global subtitle_front_fade_count=24
global subtitle_rear_fade_count=24
global subtitle_font="MS Gothic"
global subtitle_effects="b"
global subtitle_size=32*2.25
global subtitle_text_color=color_white
global subtitle_halo_color=color_black

function EXTEND_ONE_FRAME(clip clip){
	return clip+BlankClip(clip,length=1,color=color_black)
}

function UNDO_EXTEND_ONE_FRAME(clip clip){
	return Trim(clip,0,Framecount(clip)-2)
}

function SUBTITLE_FX(clip clip,string text,float x,float y,int start_frame,int end_frame,bool "is_title"){
	is_title=Default(is_title,false)

	text_color=is_title?OVERWRITE_SUBTITLE_COLOR_ALPHA(subtitle_text_color,$C0):subtitle_text_color

	return SUBTITLE_FX_FADE_IN_FADE_OUT(clip,text,Round(x),Round(y),start_frame,end_frame,subtitle_front_fade_count,subtitle_rear_fade_count,subtitle_font,subtitle_effects,Round(subtitle_size),text_color,subtitle_halo_color,"ex_thick_reduce_memory")
}

### inherit end ###

SUBTITLE_FX("この道を進んだなら　いつかまた君に|逢えるだろう",subtitle_x,subtitle_y-subtitle_size*3,-1,301)
SUBTITLE_FX("遠く続いていく時の中で|今日を懐かしむ　きっとこの場所で",subtitle_x,subtitle_y-subtitle_size,313,683)

SUBTITLE_FX("微かに見える　空の欠片を　追いかけて",subtitle_x,subtitle_y-subtitle_size*2,717,977)
SUBTITLE_FX("光と影も　心に描いて　走るとき",subtitle_x,subtitle_y,1022,1300)

SUBTITLE_FX("その笑った顔が勇気をくれる",subtitle_x,subtitle_y-subtitle_size,1310,1456)
SUBTITLE_FX("何気ない言葉だけで",subtitle_x,subtitle_y,1454,1622)
SUBTITLE_FX("君が涙の日は　飛んでいくから",subtitle_x,subtitle_y-subtitle_size,1627,1763)
SUBTITLE_FX("いつでも　どんなときも",subtitle_x,subtitle_y,1761,1948)
SUBTITLE_FX("道は続いてる",subtitle_x,subtitle_y-subtitle_size,1970,2076)

SUBTITLE_FX("多分ね　見失っても　迷ったりしても|無駄じゃない",subtitle_x,subtitle_y-subtitle_size*3,2145,2447)
SUBTITLE_FX("今はね　あの痛みが　教えてくれる|君の言葉の　その温かさ",subtitle_x,subtitle_y-subtitle_size,2452,2835)

SUBTITLE_FX("特別なことなんてないのに　毎日は",subtitle_x,subtitle_y-subtitle_size*2,2864,3112)
SUBTITLE_FX("季節の中で　出逢いも別れも　連れてくる",subtitle_x,subtitle_y,3171,3450)

SUBTITLE_FX("その笑った顔が勇気をくれる",subtitle_x,subtitle_y-subtitle_size,3459,3605)
SUBTITLE_FX("あの時　見上げた空",subtitle_x,subtitle_y,3604,3767)
SUBTITLE_FX("並んだ影が長く夕陽に伸びて",subtitle_x,subtitle_y-subtitle_size,3775,3912)
SUBTITLE_FX("明日まで届いていた",subtitle_x,subtitle_y,3910,4096)
SUBTITLE_FX("道は続いてる",subtitle_x,subtitle_y-subtitle_size,4120,4327)

SUBTITLE_FX("踏み出す一歩目は　小さくていい",subtitle_x,subtitle_y-subtitle_size,4774,4910)
SUBTITLE_FX("大きな勇気がいるから",subtitle_x,subtitle_y,4908,5065)
SUBTITLE_FX("もしも不安な日は　半分もらおう",subtitle_x,subtitle_y-subtitle_size,5081,5215)
SUBTITLE_FX("あの時　してくれたように",subtitle_x,subtitle_y,5214,5381)

SUBTITLE_FX("その笑った顔が勇気をくれる",subtitle_x,subtitle_y-subtitle_size,5386,5523)
SUBTITLE_FX("何気ない言葉だけで",subtitle_x,subtitle_y,5521,5689)
SUBTITLE_FX("君が涙の日は　飛んでいくから",subtitle_x,subtitle_y-subtitle_size,5694,5829)
SUBTITLE_FX("いつでも　どんなときも　揺るがない手と手",subtitle_x,subtitle_y,5828,6099)
SUBTITLE_FX("道は続いてる",subtitle_x,subtitle_y-subtitle_size,6115,6245)

SUBTITLE_FX("繋がっている",subtitle_x,subtitle_y,6269,6417)

SUBTITLE_FX("空の欠片//池田綾子|- by fielia@AVISynth",-subtitle_x,subtitle_x,6477,6686,true)



dennou_coil_tv_ed_pre=BlankClip(last,length=25,color=color_black)
dennou_coil_tv_ed_pre=EXTEND_ONE_FRAME(dennou_coil_tv_ed_pre)
dennou_coil_tv_ed_pre=SUBTITLE_FX(dennou_coil_tv_ed_pre,"この道を進んだなら　いつかまた君に|逢えるだろう",subtitle_x,subtitle_y-subtitle_size*3,24,326)
dennou_coil_tv_ed_pre=UNDO_EXTEND_ONE_FRAME(dennou_coil_tv_ed_pre)

######## Thumbnail ########

is_thumbnail=false

is_thumbnail?dennou_coil_tv_ed_mute_work_in_progress:last

######## Music ########

bgm_48khz=SSRC(WAVSource("src\dennou_coil-oped-cd-02.wav"),48000)
AudioDub(bgm_48khz)



thumbnail=Trim(5157,-24*5)



AUDIO_DUB_TONE(dennou_coil_tv_ed_pre,samplerate=48000,channels=2,type="Silence")++last



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
