Import("..\avsi4comp\macro.avsi")

SetMemoryMax(64)

######## Function ########

function FFMS2_VIDEO_SOURCE_AUDIO_16BIT(string filename,int "atrack"){
	return ConvertAudioTo16bit(FFMS2_VIDEO_SOURCE(filename,atrack=atrack,enable_multi_thread=false))
}

function PSEUDO_COLOR_GRAY(clip clip){
	return ColorYUV(clip,gain_y=192.0,off_y=-32.0,off_u=12.0,cont_u=-240.0,off_v=2.0,cont_v=-240.0)
}

######## BD (1080P) ########

cowboy_bebop_tv_24=FFMS2_VIDEO_SOURCE_AUDIO_16BIT("src\anime-bd\cowboy_bebop-tv-bd-24.mkv")
cowboy_bebop_tv_25=FFMS2_VIDEO_SOURCE_AUDIO_16BIT("src\anime-bd\cowboy_bebop-tv-bd-25.mkv")
cowboy_bebop_tv_26=FFMS2_VIDEO_SOURCE_AUDIO_16BIT("src\anime-bd\cowboy_bebop-tv-bd-26.mkv")

cowboy_bebop_tv_24_faye_memory_01=Trim(cowboy_bebop_tv_24,18883,18941) #
cowboy_bebop_tv_24_faye_memory_02=Trim(cowboy_bebop_tv_24,18942,18988) #
cowboy_bebop_tv_24_faye_memory_03=Trim(cowboy_bebop_tv_24,19137,19171) #
cowboy_bebop_tv_24_little_faye=Trim(cowboy_bebop_tv_24,26958,27004) #
cowboy_bebop_tv_24_edward=Trim(cowboy_bebop_tv_24,31687,31818) #
cowboy_bebop_tv_24_ein=Trim(cowboy_bebop_tv_24,31945,31968) #

cowboy_bebop_tv_25_city_01=Trim(cowboy_bebop_tv_25,2375,2505) #
cowboy_bebop_tv_25_city_02=Trim(cowboy_bebop_tv_25,2506,2643) #
cowboy_bebop_tv_25_julia_in_rain=Trim(cowboy_bebop_tv_25,2644,2726)
cowboy_bebop_tv_25_julia_at_home=Trim(cowboy_bebop_tv_25,2984,3173)
cowboy_bebop_tv_25_bar_outside=Trim(cowboy_bebop_tv_25,6236,6474) #
cowboy_bebop_tv_25_bar_inside=Trim(cowboy_bebop_tv_25,6705,6908) #
cowboy_bebop_tv_25_spike_help_jet=Trim(cowboy_bebop_tv_25,8984,9030) #
cowboy_bebop_tv_25_spike_sit=Trim(cowboy_bebop_tv_25,10801,10883)
cowboy_bebop_tv_25_julia_turn_back=Trim(cowboy_bebop_tv_25,10979,11037) #
cowboy_bebop_tv_25_julia_see_spike=Trim(cowboy_bebop_tv_25,11038,11241)
cowboy_bebop_tv_25_spike_throw_smoke=Trim(cowboy_bebop_tv_25,11242,11253)
cowboy_bebop_tv_25_spike_walk_in_rain=Trim(cowboy_bebop_tv_25,11254,11265) #
cowboy_bebop_tv_25_julia_talk_with_spike=Trim(cowboy_bebop_tv_25,11266,11372)
cowboy_bebop_tv_25_gun_in_rose=Trim(cowboy_bebop_tv_25,11392,11405) #
cowboy_bebop_tv_25_spike_talk_with_julia=Trim(cowboy_bebop_tv_25,11406,11464)
cowboy_bebop_tv_25_note=Trim(cowboy_bebop_tv_25,11524,11576)
cowboy_bebop_tv_25_julia_and_spike_near_window=Trim(cowboy_bebop_tv_25,11577,11947) #
cowboy_bebop_tv_25_flower=Trim(cowboy_bebop_tv_25,11948,12102)
cowboy_bebop_tv_25_spike_take_note_to_julia=Trim(cowboy_bebop_tv_25,12186,12268) #
cowboy_bebop_tv_25_vicious_point_gun_to_julia=Trim(cowboy_bebop_tv_25,12651,13040) #
cowboy_bebop_tv_25_gun=Trim(cowboy_bebop_tv_25,13041,13097) #
cowboy_bebop_tv_25_julia=Trim(cowboy_bebop_tv_25,13098,13121)
cowboy_bebop_tv_25_vicious=Trim(cowboy_bebop_tv_25,13122,13283)
cowboy_bebop_tv_25_paper_01=Trim(cowboy_bebop_tv_25,13348,13387) #
cowboy_bebop_tv_25_paper_02=Trim(cowboy_bebop_tv_25,13388,13492)
cowboy_bebop_tv_25_vicious_caught_01=Trim(cowboy_bebop_tv_25,13493,13599) #
cowboy_bebop_tv_25_faye_in_airport_01=Trim(cowboy_bebop_tv_25,14017,14117)
cowboy_bebop_tv_25_faye_in_airport_02=Trim(cowboy_bebop_tv_25,15169,15335) #
cowboy_bebop_tv_25_faye_enter_aircraft=Trim(cowboy_bebop_tv_25,15516,15599) #
cowboy_bebop_tv_25_julia_drive_car=Trim(cowboy_bebop_tv_25,16652,16669) #
cowboy_bebop_tv_25_faye_shoot_01=Trim(cowboy_bebop_tv_25,16957,16992)
cowboy_bebop_tv_25_faye_shoot_02=Trim(cowboy_bebop_tv_25,17458,17511) #
cowboy_bebop_tv_25_faye_take_gun=Trim(cowboy_bebop_tv_25,17616,17673)
cowboy_bebop_tv_25_faye_talk_with_julia=Trim(cowboy_bebop_tv_25,18010,18212) #
cowboy_bebop_tv_25_julia_and_faye_on_car=Trim(cowboy_bebop_tv_25,19264,19368)
cowboy_bebop_tv_25_faye_talking_with_jet=Trim(cowboy_bebop_tv_25,24110,24240)
cowboy_bebop_tv_25_maintain_gun=Trim(cowboy_bebop_tv_25,26030,26100) #
cowboy_bebop_tv_25_vicious_caught_02=Trim(cowboy_bebop_tv_25,28365,28418)
cowboy_bebop_tv_25_julia_in_cemetery=Trim(cowboy_bebop_tv_25,28509,28544)
cowboy_bebop_tv_25_swordfish2_fly=Trim(cowboy_bebop_tv_25,29069,29152) #
cowboy_bebop_tv_25_vicious_use_sword=Trim(cowboy_bebop_tv_25,30266,30324) #
cowboy_bebop_tv_25_julia_point_gun_to_spike=Trim(cowboy_bebop_tv_25,32153,32260)

cowboy_bebop_tv_26_spike_in_rain=Trim(cowboy_bebop_tv_26,828,887) #
cowboy_bebop_tv_26_vicious_and_julia_sleep=Trim(cowboy_bebop_tv_26,1236,1253) #
cowboy_bebop_tv_26_spike_recover=Trim(cowboy_bebop_tv_26,1254,1271) #
cowboy_bebop_tv_26_julia_see_spike_recover=Trim(cowboy_bebop_tv_26,1272,1289)
cowboy_bebop_tv_26_julia_hug_spike=Trim(cowboy_bebop_tv_26,1576,1778) #
cowboy_bebop_tv_26_traffic_light=Trim(cowboy_bebop_tv_26,3261,3305) #
cowboy_bebop_tv_26_julia_and_spike_on_car=Trim(cowboy_bebop_tv_26,3377,3460) #
cowboy_bebop_tv_26_jet_talk_with_faye_01=Trim(cowboy_bebop_tv_26,7221,7524)
cowboy_bebop_tv_26_jet_talk_with_faye_02=Trim(cowboy_bebop_tv_26,7525,7697) #
cowboy_bebop_tv_26_jet_catch_faye=Trim(cowboy_bebop_tv_26,7800,8032) #
cowboy_bebop_tv_26_spike_shoot_enemy=Trim(cowboy_bebop_tv_26,9593,9634) #
cowboy_bebop_tv_26_julia_get_killed=Trim(cowboy_bebop_tv_26,10050,10169) #
cowboy_bebop_tv_26_jet_smoke=Trim(cowboy_bebop_tv_26,15012,15196) #
cowboy_bebop_tv_26_faye_shoot_spike=Trim(cowboy_bebop_tv_26,19943,20056) #
cowboy_bebop_tv_26_spike_drive_aircraft=Trim(cowboy_bebop_tv_26,20647,20712) #
cowboy_bebop_tv_26_spike_sex_with_julia=Trim(cowboy_bebop_tv_26,21077,21122) #
cowboy_bebop_tv_26_vicious_and_spike=Trim(cowboy_bebop_tv_26,21203,21223) #
cowboy_bebop_tv_26_vicious_take_sword=Trim(cowboy_bebop_tv_26,21278,21336) #
cowboy_bebop_tv_26_spike_vs_vicious=Trim(cowboy_bebop_tv_26,25697,25738) #



cowboy_bebop_tv_ed=FFMS2_VIDEO_SOURCE_AUDIO_16BIT("src\anime-bd\cowboy_bebop-tv-bd-sp-01.mkv",atrack=2)
cowboy_bebop_tv_ed=RESIZE_TO_REF_CLIP(AddBorders(cowboy_bebop_tv_ed,0,180,0,180),cowboy_bebop_tv_26)

cowboy_bebop_tv_ed_01=Trim(cowboy_bebop_tv_ed,0,354)
cowboy_bebop_tv_ed_02=Trim(cowboy_bebop_tv_ed,355,928) #574
cowboy_bebop_tv_ed_03=Trim(cowboy_bebop_tv_ed,929,1217) #289
cowboy_bebop_tv_ed_04=Trim(cowboy_bebop_tv_ed,1218,1935) #718
cowboy_bebop_tv_ed_05=Trim(cowboy_bebop_tv_ed,1936,2079) #144
cowboy_bebop_tv_ed_06=Trim(cowboy_bebop_tv_ed,2080,0)

######## Pre Combine ########

startup_base=BlankClip(cowboy_bebop_tv_ed,length=210,color=color_black)
startup=ScriptClip(startup_base,"BRIGHTNESS_OFFSET(Spline(current_frame,0,0.0,24,0.0,25,1.0,31,0.0,38,0.0,39,0.5,48,0.0,60,0.0,185,1.0,210,1.0,cubic=false))")

######## Combine ########

# cowboy_bebop_tv_ed_01	118
# cowboy_bebop_tv_ed_02 760
# cowboy_bebop_tv_ed_03 4140
# cowboy_bebop_tv_ed_04 5003
# cowboy_bebop_tv_ed_05 8598

cowboy_bebop_ed_t01=Dissolve(startup,cowboy_bebop_tv_ed_01,Framecount(startup_base)-118)+PSEUDO_COLOR_GRAY(STILL_MIDDLE_FRAME(cowboy_bebop_tv_25_city_01,287))

cowboy_bebop_ed_t02=cowboy_bebop_tv_ed_02
cowboy_bebop_ed_t03=STILL_MIDDLE_FRAME(cowboy_bebop_tv_26_traffic_light,73)+STILL_MIDDLE_FRAME(cowboy_bebop_tv_26_spike_in_rain,144)+STILL_MIDDLE_FRAME(cowboy_bebop_tv_26_vicious_and_julia_sleep,144)+STILL_MIDDLE_FRAME(cowboy_bebop_tv_26_spike_recover,143)+STILL_MIDDLE_FRAME(cowboy_bebop_tv_26_julia_hug_spike,144)
cowboy_bebop_ed_t04=STILL_LAST_FRAME(cowboy_bebop_tv_25_bar_outside,143)+STILL_MIDDLE_FRAME(cowboy_bebop_tv_25_bar_inside,144)
cowboy_bebop_ed_t05=STILL_MIDDLE_FRAME(cowboy_bebop_tv_25_faye_talk_with_julia,144)+STILL_FIRST_FRAME(cowboy_bebop_tv_25_faye_enter_aircraft,144)+STILL_MIDDLE_FRAME(cowboy_bebop_tv_26_jet_catch_faye,144)+STILL_LAST_FRAME(cowboy_bebop_tv_26_faye_shoot_spike,143)+STILL_MIDDLE_FRAME(cowboy_bebop_tv_24_little_faye,144)

cowboy_bebop_ed_t06=STILL_LAST_FRAME(cowboy_bebop_tv_24_faye_memory_01,144)+STILL_MIDDLE_FRAME(cowboy_bebop_tv_24_faye_memory_02,144)+STILL_MIDDLE_FRAME(cowboy_bebop_tv_24_ein,144)+STILL_LAST_FRAME(cowboy_bebop_tv_24_edward,144)

cowboy_bebop_ed_t07=STILL_MIDDLE_FRAME(cowboy_bebop_tv_26_jet_smoke,144)+STILL_MIDDLE_FRAME(cowboy_bebop_tv_25_vicious_caught_01,144)+STILL_MIDDLE_FRAME(cowboy_bebop_tv_25_spike_help_jet,144)+STILL_MIDDLE_FRAME(cowboy_bebop_tv_26_vicious_and_spike,144)
cowboy_bebop_ed_t08=cowboy_bebop_tv_ed_03
cowboy_bebop_ed_t09=STILL_MIDDLE_FRAME(cowboy_bebop_tv_26_julia_and_spike_on_car,142)+STILL_MIDDLE_FRAME(cowboy_bebop_tv_26_vicious_take_sword,144)+STILL_MIDDLE_FRAME(cowboy_bebop_tv_25_julia_and_spike_near_window,144)+STILL_MIDDLE_FRAME(cowboy_bebop_tv_25_spike_take_note_to_julia,144)
cowboy_bebop_ed_t10=cowboy_bebop_tv_ed_04

cowboy_bebop_ed_t11=STILL_FRAME(cowboy_bebop_tv_25_swordfish2_fly,56,144)+STILL_MIDDLE_FRAME(cowboy_bebop_tv_25_maintain_gun,144)+STILL_MIDDLE_FRAME(cowboy_bebop_tv_26_spike_sex_with_julia,144)+STILL_LAST_FRAME(cowboy_bebop_tv_26_julia_get_killed,144)
cowboy_bebop_ed_t12=STILL_LAST_FRAME(cowboy_bebop_tv_25_gun_in_rose,144)+STILL_LAST_FRAME(cowboy_bebop_tv_25_vicious_use_sword,144)+STILL_MIDDLE_FRAME(cowboy_bebop_tv_26_spike_shoot_enemy,144)+STILL_MIDDLE_FRAME(cowboy_bebop_tv_25_vicious_point_gun_to_julia,143)
cowboy_bebop_ed_t13=STILL_MIDDLE_FRAME(cowboy_bebop_tv_25_spike_walk_in_rain,144)+STILL_MIDDLE_FRAME(cowboy_bebop_tv_25_gun,144)+STILL_MIDDLE_FRAME(cowboy_bebop_tv_25_julia_drive_car,144)+STILL_LAST_FRAME(cowboy_bebop_tv_25_paper_01,143)
cowboy_bebop_ed_t14=STILL_MIDDLE_FRAME(cowboy_bebop_tv_25_faye_in_airport_01,144)+STILL_MIDDLE_FRAME(cowboy_bebop_tv_24_faye_memory_03,144)+STILL_MIDDLE_FRAME(cowboy_bebop_tv_25_faye_shoot_02,144)+STILL_MIDDLE_FRAME(cowboy_bebop_tv_26_jet_talk_with_faye_02,143)
cowboy_bebop_ed_t15=STILL_MIDDLE_FRAME(cowboy_bebop_tv_26_spike_drive_aircraft,144)+STILL_MIDDLE_FRAME(cowboy_bebop_tv_25_julia_turn_back,144)+STILL_FIRST_FRAME(cowboy_bebop_tv_26_spike_vs_vicious,144)+STILL_MIDDLE_FRAME(cowboy_bebop_tv_25_city_02,144)

cowboy_bebop_ed_t16=cowboy_bebop_tv_ed_05+cowboy_bebop_tv_ed_06+BlankClip(cowboy_bebop_tv_ed,length=24,color=color_black)

cowboy_bebop_ed_mute=cowboy_bebop_ed_t01 \
	+cowboy_bebop_ed_t02+PSEUDO_COLOR_GRAY(cowboy_bebop_ed_t03+cowboy_bebop_ed_t04+cowboy_bebop_ed_t05 \
	+cowboy_bebop_ed_t06 \
	+cowboy_bebop_ed_t07)+cowboy_bebop_ed_t08+PSEUDO_COLOR_GRAY(cowboy_bebop_ed_t09)+cowboy_bebop_ed_t10 \
	+PSEUDO_COLOR_GRAY(cowboy_bebop_ed_t11+cowboy_bebop_ed_t12+cowboy_bebop_ed_t13+cowboy_bebop_ed_t14+cowboy_bebop_ed_t15) \
	+cowboy_bebop_ed_t16

######## Music ########

bgm_48khz=SSRC(WAVSource("src\cowboy_bebop-vitaminless-01.wav"),48000)
AudioDub(cowboy_bebop_ed_mute,bgm_48khz)

######## Subtitle ########

global subtitle_clip_width=640
global subtitle_clip_height=480

subtitle_x=50
subtitle_y=400
#global subtitle_front_fade_count=24
#global subtitle_rear_fade_count=24
global subtitle_font="MS Gothic"
global subtitle_effects="bi"
global subtitle_size=28
global subtitle_text_color=color_white
global subtitle_halo_color=color_black

function SUBTITLE_N(clip clip,string text,float x,float y,int start_frame,int end_frame,bool "is_title"){
	is_title=Default(is_title,false)

	text_color=is_title?color_mediumpurple:subtitle_text_color

	return SUBTITLE_NORMAL(clip,text,x,y,start_frame,end_frame,subtitle_font,subtitle_effects,subtitle_size,text_color,subtitle_halo_color,false)
}

SUBTITLE_N("THE REAL FOLK BLUES//山根麻衣",subtitle_x,subtitle_y-subtitle_size,8022,8597,true)
SUBTITLE_N("- by fielia@AVISynth",subtitle_x,subtitle_y,8022,8597,true)

SUBTITLE_N("愛してたと嘆くには",subtitle_x,subtitle_y-subtitle_size,760,903)
SUBTITLE_N("あまりにも時は過ぎてしまった",subtitle_x,subtitle_y,760,1045)
SUBTITLE_N("まだ心のほころびを",subtitle_x,subtitle_y-subtitle_size,1046,1191)
SUBTITLE_N("癒せぬまま 風が吹いてる",subtitle_x,subtitle_y,1046,1333)

SUBTITLE_N("ひとつの目で明日を見て",subtitle_x,subtitle_y-subtitle_size,1407,1550)
SUBTITLE_N("ひとつの目で昨日を見つめてる",subtitle_x,subtitle_y,1407,1694)
SUBTITLE_N("君の愛の揺りかごで",subtitle_x,subtitle_y-subtitle_size,1695,1837)
SUBTITLE_N("もう一度 安らかに眠れたら",subtitle_x,subtitle_y,1695,1981)

SUBTITLE_N("乾いた瞳で誰か泣いてくれ",subtitle_x,subtitle_y,1982,2268)

SUBTITLE_N("THE REAL FOLK BLUES",subtitle_x,subtitle_y-subtitle_size,2125,2412)
SUBTITLE_N("本当の悲しみが知りたいだけ",subtitle_x,subtitle_y,2269,2556)
SUBTITLE_N("泥の河に浸かった人生も悪くはない",subtitle_x,subtitle_y-subtitle_size,2413,2843)
SUBTITLE_N("一度きりで 終わるなら",subtitle_x,subtitle_y,2701,3131)

SUBTITLE_N("希望に満ちた絶望と",subtitle_x,subtitle_y-subtitle_size,3564,3707)
SUBTITLE_N("罠が仕掛けられてるこのチャンス",subtitle_x,subtitle_y,3564,3851)
SUBTITLE_N("何がよくて悪いのか",subtitle_x,subtitle_y-subtitle_size,3852,3995)
SUBTITLE_N("コインの表と裏みたいだ",subtitle_x,subtitle_y,3852,4139)

SUBTITLE_N("どれだけ生きれば いやされるのだろう",subtitle_x,subtitle_y,4140,4428)

SUBTITLE_N("THE REAL FOLK BLUES",subtitle_x,subtitle_y-subtitle_size,4285,4570)
SUBTITLE_N("本当の歓びが知りたいだけ",subtitle_x,subtitle_y,4429,4714)
SUBTITLE_N("光るものの全てが黄金とは限らない",subtitle_x,subtitle_y-subtitle_size,4571,5002)

SUBTITLE_N("THE REAL FOLK BLUES",subtitle_x,subtitle_y,4859,5144)
SUBTITLE_N("本当の悲しみが知りたいだけ",subtitle_x,subtitle_y-subtitle_size,5003,5288)
SUBTITLE_N("泥の河に浸かった人生も悪くはない",subtitle_x,subtitle_y,5145,5576)
SUBTITLE_N("一度きりで 終わるなら",subtitle_x,subtitle_y-subtitle_size,5433,5864)

######## Post Processing ########

ConvertToYV12()
#ConvertToYUY2()
#ConvertToRGB24()
