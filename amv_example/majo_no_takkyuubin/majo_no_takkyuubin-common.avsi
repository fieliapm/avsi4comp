Import("..\avsi4comp\macro.avsi")

#SetMemoryMax(64)

######## Subtitle ########

subtitle_x=50
subtitle_y=400
global subtitle_front_fade_count=30
global subtitle_rear_fade_count=30
global subtitle_font="MS Gothic"
global subtitle_effects="bi"
global subtitle_size=28
global subtitle_text_color=OVERWRITE_COLOR_ALPHA(color_lightpink,$3F)
global subtitle_halo_color=color_midnightblue

function SUBTITLE_FX(clip clip,string text,float x,float y,int start_frame,int end_frame,bool "is_title"){
	is_title=Default(is_title,false)

	text_color=is_title?color_indianred:subtitle_text_color

	return SUBTITLE_FX_PULL_IN_PULL_OUT(clip,text,x,y,start_frame,end_frame,subtitle_front_fade_count,subtitle_rear_fade_count,subtitle_font,subtitle_effects,subtitle_size,text_color,subtitle_halo_color)
}

function SUBTITLE_N(clip clip,string text,int "x",int "y",int "first_frame",int "last_frame"){
	return SUBTITLE_NORMAL(clip,text,x,y,first_frame,last_frame,subtitle_font,subtitle_effects,subtitle_size,subtitle_text_color,subtitle_halo_color)
}

######## DVD (480P) ########

majo_no_takkyuubin_01=VOB_MPEG2_VIDEO_SOURCE("src\dvd\VTS_01_1.d2v",upConv=1)
majo_no_takkyuubin_01=AudioDub(majo_no_takkyuubin_01,WAVSource("src\dvd\VTS_01_1 T80 2_0ch 448Kbps 48KHz.wav"))

majo_no_takkyuubin_02=VOB_MPEG2_VIDEO_SOURCE("src\dvd\VTS_01_2.d2v",upConv=1)
majo_no_takkyuubin_02=AudioDub(majo_no_takkyuubin_02,WAVSource("src\dvd\VTS_01_2 T80 2_0ch 448Kbps 48KHz.wav"))

majo_no_takkyuubin_03=VOB_MPEG2_VIDEO_SOURCE("src\dvd\VTS_01_3.d2v",upConv=1)
majo_no_takkyuubin_03=AudioDub(majo_no_takkyuubin_03,WAVSource("src\dvd\VTS_01_3 T80 2_0ch 448Kbps 48KHz.wav"))

majo_no_takkyuubin_04=VOB_MPEG2_VIDEO_SOURCE("src\dvd\VTS_01_4.d2v",upConv=1)
majo_no_takkyuubin_04=AudioDub(majo_no_takkyuubin_04,WAVSource("src\dvd\VTS_01_4 T80 2_0ch 448Kbps 48KHz.wav"))

majo_no_takkyuubin_05=VOB_MPEG2_VIDEO_SOURCE("src\dvd\VTS_01_5.d2v",upConv=1)
majo_no_takkyuubin_05=AudioDub(majo_no_takkyuubin_05,WAVSource("src\dvd\VTS_01_5 T80 2_0ch 448Kbps 48KHz.wav"))

majo_no_takkyuubin_06=VOB_MPEG2_VIDEO_SOURCE("src\dvd\VTS_01_6.d2v",upConv=1)
majo_no_takkyuubin_06=AudioDub(majo_no_takkyuubin_06,WAVSource("src\dvd\VTS_01_6 T80 2_0ch 448Kbps 48KHz.wav"))

majo_no_takkyuubin_07=VOB_MPEG2_VIDEO_SOURCE("src\dvd\VTS_01_7.d2v",upConv=1)
majo_no_takkyuubin_07=AudioDub(majo_no_takkyuubin_07,WAVSource("src\dvd\VTS_01_7 T80 2_0ch 448Kbps 48KHz.wav"))

######## TRIM ########

majo_no_takkyuubin_01_mark=Trim(majo_no_takkyuubin_01,194,370)
majo_no_takkyuubin_01_mark=AUDIO_DUB_TONE(majo_no_takkyuubin_01_mark,samplerate=48000,channels=2,type="Silence")
majo_no_takkyuubin_01_op=Trim(majo_no_takkyuubin_01,13994,16895)
majo_no_takkyuubin_07_ed=Trim(majo_no_takkyuubin_07,5858,0)

majo_no_takkyuubin_01_kiki_run_across_river=Trim(majo_no_takkyuubin_01,1781,1960) # #180
majo_no_takkyuubin_01_kiki_turn=Trim(majo_no_takkyuubin_01,8524,8714) # #191
majo_no_takkyuubin_01_kiki_talk_with_friends=Trim(majo_no_takkyuubin_01,10945,11027) # #83
majo_no_takkyuubin_01_kiki_talk_with_mother=Trim(majo_no_takkyuubin_01,11029,11322) # #294
majo_no_takkyuubin_01_kiki_on_train=Trim(majo_no_takkyuubin_01,23164,23342) #179
majo_no_takkyuubin_01_kiki_leave_train=Trim(majo_no_takkyuubin_01,24470,24794) # #325
majo_no_takkyuubin_01_kiki_and_common_gull_fly=Trim(majo_no_takkyuubin_01,25118,25234) #117
majo_no_takkyuubin_01_kiki_fly_across_city=Trim(majo_no_takkyuubin_01,26206,26310) #105

majo_no_takkyuubin_02_tombo_nanpa_kiki=Trim(majo_no_takkyuubin_02,4115,4254) #140
majo_no_takkyuubin_02_park=Trim(majo_no_takkyuubin_02,5928,6196) # #269
majo_no_takkyuubin_02_osono_give_pacifier_to_kiki=Trim(majo_no_takkyuubin_02,9527,9626) #100
majo_no_takkyuubin_02_kiki_send_pacifier=Trim(majo_no_takkyuubin_02,10007,10185) #179
majo_no_takkyuubin_02_kiki_run_from_toilet_01=Trim(majo_no_takkyuubin_02,20524,20669) #146
majo_no_takkyuubin_02_kiki_run_from_toilet_02=Trim(majo_no_takkyuubin_02,20670,20814) #145
majo_no_takkyuubin_02_fukuo_and_osono_make_bread=Trim(majo_no_takkyuubin_02,21708,21984) # #277
majo_no_takkyuubin_02_kiki_clean_room_01=Trim(majo_no_takkyuubin_02,25040,25155) #116
majo_no_takkyuubin_02_kiki_clean_room_02=Trim(majo_no_takkyuubin_02,25157,25320) #164

majo_no_takkyuubin_03_kiki_fly_high=Trim(majo_no_takkyuubin_03,1138,1444) # #307
majo_no_takkyuubin_03_kiki_fallen=Trim(majo_no_takkyuubin_03,5442,5611) #170
majo_no_takkyuubin_03_ket_play_jiji=Trim(majo_no_takkyuubin_03,10181,10378) #191
majo_no_takkyuubin_03_ursula_painting_01=Trim(majo_no_takkyuubin_03,14666,14935) #270
majo_no_takkyuubin_03_ursula_painting_02=Trim(majo_no_takkyuubin_03,15131,15303) #173
majo_no_takkyuubin_03_jefferson_touch_jiji=Trim(majo_no_takkyuubin_03,18235,18477) #243
majo_no_takkyuubin_03_kiki_give_cat_to_jefferson=Trim(majo_no_takkyuubin_03,21684,22033) #350
majo_no_takkyuubin_03_kiki_do_nothing_01=Trim(majo_no_takkyuubin_03,25374,25543) #170
majo_no_takkyuubin_03_kiki_do_nothing_02=Trim(majo_no_takkyuubin_03,25776,25978) # #203

majo_no_takkyuubin_04_kiki_fly_high_speed=Trim(majo_no_takkyuubin_04,3179,3267) #89
majo_no_takkyuubin_04_kiki_pick_wood=Trim(majo_no_takkyuubin_04,8785,8936) #152
majo_no_takkyuubin_04_kiki_put_wood_into_kiln=Trim(majo_no_takkyuubin_04,9237,9366) #130
majo_no_takkyuubin_04_tombo_and_fukuo_waiting_for_kiki=Trim(majo_no_takkyuubin_04,18120,18366) # #247
majo_no_takkyuubin_04_kiki_cooking=Trim(majo_no_takkyuubin_04,24750,25099) # #350
majo_no_takkyuubin_04_jiji_and_lily_01=Trim(majo_no_takkyuubin_04,27157,27245) #89
majo_no_takkyuubin_04_jiji_and_lily_02=Trim(majo_no_takkyuubin_04,27367,27425) #59

majo_no_takkyuubin_05_kiki_on_stair_01=Trim(majo_no_takkyuubin_05,116,321) # #206
majo_no_takkyuubin_05_kiki_on_stair_02=Trim(majo_no_takkyuubin_05,612,788) #177
majo_no_takkyuubin_05_tombo_and_kiki_ride=Trim(majo_no_takkyuubin_05,5455,5606) #152
majo_no_takkyuubin_05_tombo_and_kiki_talk_01=Trim(majo_no_takkyuubin_05,10617,11020) # #404
majo_no_takkyuubin_05_tombo_and_kiki_talk_02=Trim(majo_no_takkyuubin_05,11648,12307) #660
majo_no_takkyuubin_05_kiki_walk_back_home=Trim(majo_no_takkyuubin_05,14621,14829) #660
majo_no_takkyuubin_05_kiki_cannot_fly_01=Trim(majo_no_takkyuubin_05,19963,20128) #166
majo_no_takkyuubin_05_kiki_cannot_fly_02=Trim(majo_no_takkyuubin_05,20323,20450) #128
majo_no_takkyuubin_05_kiki_cannot_fly_03=Trim(majo_no_takkyuubin_05,21557,21660) #104
majo_no_takkyuubin_05_ursula_meet_kiki=Trim(majo_no_takkyuubin_05,26412,26660) #249

majo_no_takkyuubin_06_ursula_bring_kiki_to_forest=Trim(majo_no_takkyuubin_06,1815,1966) #152
majo_no_takkyuubin_06_ursula_and_kiki_hitchhike=Trim(majo_no_takkyuubin_06,3828,3973) #146
majo_no_takkyuubin_06_ursula_s_painting=Trim(majo_no_takkyuubin_06,6150,6470) #321
majo_no_takkyuubin_06_ursula_and_kiki_watch_painting=Trim(majo_no_takkyuubin_06,7809,8048) # #240
majo_no_takkyuubin_06_kiki_as_model=Trim(majo_no_takkyuubin_06,10088,10401) #314
majo_no_takkyuubin_06_ursula_cooking=Trim(majo_no_takkyuubin_06,10553,10690) #138
majo_no_takkyuubin_06_ursula_and_kiki_on_bed=Trim(majo_no_takkyuubin_06,11869,12168) # #300
majo_no_takkyuubin_06_kiki_and_madame_and_barsa=Trim(majo_no_takkyuubin_06,18739,18887) # #149
majo_no_takkyuubin_06_tombo_falling=Trim(majo_no_takkyuubin_06,22074,22268) #195
majo_no_takkyuubin_06_kiki_run=Trim(majo_no_takkyuubin_06,22595,22722) #128
majo_no_takkyuubin_06_kiki_fly_using_brush_01=Trim(majo_no_takkyuubin_06,25852,25940) #89
majo_no_takkyuubin_06_kiki_fly_using_brush_02=Trim(majo_no_takkyuubin_06,26517,26656) #140
majo_no_takkyuubin_06_tombo_toward_clock_tower=Trim(majo_no_takkyuubin_06,27195,27312) #118

majo_no_takkyuubin_07_kiki_fly_over_road_01=Trim(majo_no_takkyuubin_07,847,906) #60
majo_no_takkyuubin_07_kiki_fly_over_road_02=Trim(majo_no_takkyuubin_07,907,1006) #100
majo_no_takkyuubin_07_kiki_try_to_catch_tombo_01=Trim(majo_no_takkyuubin_07,3070,3221) #152
majo_no_takkyuubin_07_kiki_try_to_catch_tombo_02=Trim(majo_no_takkyuubin_07,3365,3508) #144
majo_no_takkyuubin_07_kiki_try_to_catch_tombo_03=Trim(majo_no_takkyuubin_07,3941,3994) #54
majo_no_takkyuubin_07_kiki_catched_tombo=Trim(majo_no_takkyuubin_07,4532,4621) #90
majo_no_takkyuubin_07_kiki_and_tombo_landing=Trim(majo_no_takkyuubin_07,4743,4854) #112
majo_no_takkyuubin_07_osono_is_giving_birth=Trim(majo_no_takkyuubin_07,5336,5497) #162
majo_no_takkyuubin_07_kiki_stare_blankly=Trim(majo_no_takkyuubin_07,5558,5857) # #300
