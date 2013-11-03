Import("..\avsi4comp\macro.avsi")

SetMemoryMax(64)

######## Source Function ########

function FFMS2_VIDEO_SOURCE_ALIGN_1920X1080(string filename){
	return Lanczos4Resize(FFMS2_VIDEO_SOURCE(filename),1920,1080)
}

######## Source Cut ########

kobato_tv_01_cache01=FFMS2_VIDEO_SOURCE_ALIGN_1920X1080("src\anime-tv-01\kobato-tv-01.mp4")
kobato_tv_01_cache02=FFMS2_VIDEO_SOURCE_ALIGN_1920X1080("src\anime-tv-01\kobato-tv-01.mp4")
kobato_tv_02=FFMS2_VIDEO_SOURCE_ALIGN_1920X1080("src\anime-tv-01\kobato-tv-02.mp4")
kobato_tv_03_cache01=FFMS2_VIDEO_SOURCE_ALIGN_1920X1080("src\anime-tv-01\kobato-tv-03.mp4")
kobato_tv_03_cache02=FFMS2_VIDEO_SOURCE_ALIGN_1920X1080("src\anime-tv-01\kobato-tv-03.mp4")
kobato_tv_04=FFMS2_VIDEO_SOURCE_ALIGN_1920X1080("src\anime-tv-01\kobato-tv-04.mp4")
kobato_tv_05=FFMS2_VIDEO_SOURCE_ALIGN_1920X1080("src\anime-tv-01\kobato-tv-05.mp4")
kobato_tv_06=FFMS2_VIDEO_SOURCE_ALIGN_1920X1080("src\anime-tv-01\kobato-tv-06.mp4")
kobato_tv_07=FFMS2_VIDEO_SOURCE_ALIGN_1920X1080("src\anime-tv-01\kobato-tv-07.mp4")
kobato_tv_08=FFMS2_VIDEO_SOURCE_ALIGN_1920X1080("src\anime-tv-02\kobato-tv-08.mp4")
kobato_tv_09=FFMS2_VIDEO_SOURCE_ALIGN_1920X1080("src\anime-tv-02\kobato-tv-09.mp4")
kobato_tv_10=FFMS2_VIDEO_SOURCE_ALIGN_1920X1080("src\anime-tv-02\kobato-tv-10.mp4")
kobato_tv_11=FFMS2_VIDEO_SOURCE_ALIGN_1920X1080("src\anime-tv-02\kobato-tv-11.mp4")
kobato_tv_12=FFMS2_VIDEO_SOURCE_ALIGN_1920X1080("src\anime-tv-02\kobato-tv-12.mp4")
kobato_tv_13=FFMS2_VIDEO_SOURCE_ALIGN_1920X1080("src\anime-tv-02\kobato-tv-13.mp4")
kobato_tv_14=FFMS2_VIDEO_SOURCE_ALIGN_1920X1080("src\anime-tv-02\kobato-tv-14.mp4")
kobato_tv_15=FFMS2_VIDEO_SOURCE_ALIGN_1920X1080("src\anime-tv-03\kobato-tv-15.mp4")
kobato_tv_16=FFMS2_VIDEO_SOURCE_ALIGN_1920X1080("src\anime-tv-03\kobato-tv-16.mp4")
kobato_tv_17_cache01=FFMS2_VIDEO_SOURCE_ALIGN_1920X1080("src\anime-tv-03\kobato-tv-17.mp4")
kobato_tv_17_cache02=FFMS2_VIDEO_SOURCE_ALIGN_1920X1080("src\anime-tv-03\kobato-tv-17.mp4")
kobato_tv_18=FFMS2_VIDEO_SOURCE_ALIGN_1920X1080("src\anime-tv-03\kobato-tv-18.mp4")
kobato_tv_19=FFMS2_VIDEO_SOURCE_ALIGN_1920X1080("src\anime-tv-03\kobato-tv-19.mp4")
kobato_tv_20_cache01=FFMS2_VIDEO_SOURCE_ALIGN_1920X1080("src\anime-tv-03\kobato-tv-20.mp4")
kobato_tv_20_cache02=FFMS2_VIDEO_SOURCE_ALIGN_1920X1080("src\anime-tv-03\kobato-tv-20.mp4")
kobato_tv_21=FFMS2_VIDEO_SOURCE_ALIGN_1920X1080("src\anime-tv-03\kobato-tv-21.mp4")
kobato_tv_22_cache01=FFMS2_VIDEO_SOURCE_ALIGN_1920X1080("src\anime-tv-03\kobato-tv-22.mp4")
kobato_tv_22_cache02=FFMS2_VIDEO_SOURCE_ALIGN_1920X1080("src\anime-tv-03\kobato-tv-22.mp4")
kobato_tv_23=FFMS2_VIDEO_SOURCE_ALIGN_1920X1080("src\anime-tv-04\kobato-tv-23.mp4")
kobato_tv_24=FFMS2_VIDEO_SOURCE_ALIGN_1920X1080("src\anime-tv-04\kobato-tv-24.mp4")

kobato_tv_01_falling=Trim(kobato_tv_01_cache01,0,312)
kobato_tv_op_01=Trim(kobato_tv_01_cache02,1441,2876)
kobato_tv_op_02=Trim(kobato_tv_01_cache01,2877,3596)
kobato_tv_01_park_01=Trim(kobato_tv_01_cache01,313,396)
kobato_tv_01_park_02=Trim(kobato_tv_01_cache02,397,480)
kobato_tv_01_park_03=Trim(kobato_tv_01_cache01,481,564)
kobato_tv_01_sakura_snow_01=Trim(kobato_tv_01_cache01,23930,24304)
kobato_tv_01_sakura_snow_02=Trim(kobato_tv_01_cache02,25049,25260)
kobato_tv_02_kobato_useless=Trim(kobato_tv_02,15069,15190)
kobato_tv_02_kobato_kiyokazu_wrong=Trim(kobato_tv_02,15311,15346)
kobato_tv_03_chitose=Trim(kobato_tv_03_cache01,5319,5516)
kobato_tv_03_chiho_chise=Trim(kobato_tv_03_cache02,23818,23943)
kobato_tv_04_kohaku_water_magic=Trim(kobato_tv_04,13862,14005)
kobato_tv_05_kobato_hotaru=Trim(kobato_tv_05,30766,30903)
kobato_tv_06_marina_toshihiko_kobato=Trim(kobato_tv_06,11632,11737)
kobato_tv_07_takashi=Trim(kobato_tv_07,29450,29557)
kobato_tv_08_chiho_chise_afraid=Trim(kobato_tv_08,23680,23923)
kobato_tv_09_chitose_sayaka_festival=Trim(kobato_tv_09,31652,31771)
kobato_tv_10_kiyokazu_shame=Trim(kobato_tv_10,32482,32558)
kobato_tv_11_yumi_hiroyasu=Trim(kobato_tv_11,6501,6698)
kobato_tv_11_kobato_maid=Trim(kobato_tv_11,7760,7943)
kobato_tv_12_world=Trim(kobato_tv_12,6243,6842)
kobato_tv_12_ioryogi_ribbon=Trim(kobato_tv_12,15353,15478)
kobato_tv_12_ioryogi_kobato_meet=Trim(kobato_tv_12,23622,24029)
kobato_tv_13_kobato_kohaku_sing=Trim(kobato_tv_13,25476,26120)
kobato_tv_14_little_kiyokazu=Trim(kobato_tv_14,18037,18085)
kobato_tv_15_kohaku_shuuichirou=Trim(kobato_tv_15,14828,15140)
kobato_tv_16_chitose_chiho_chise=Trim(kobato_tv_16,1191,1339)
kobato_tv_16_sayaka=Trim(kobato_tv_16,10781,10870)
kobato_tv_17_kimihiro=Trim(kobato_tv_17_cache01,7421,7589)
kobato_tv_17_black_mokona=Trim(kobato_tv_17_cache02,17867,17944)
kobato_tv_18_miyata=Trim(kobato_tv_18,15117,15293)
kobato_tv_19_snow=Trim(kobato_tv_19,28198,28632)
kobato_tv_20_tsubasa_main_character=Trim(kobato_tv_20_cache01,11357,11446)
kobato_tv_20_shaoran_kobato_01=Trim(kobato_tv_20_cache01,19907,19966)
kobato_tv_20_shaoran_kobato_02=Trim(kobato_tv_20_cache01,24601,24702)
kobato_tv_20_kurogane_fai=Trim(kobato_tv_20_cache02,25025,25324)
kobato_tv_21_kazuto=Trim(kobato_tv_21,26308,26397)
kobato_tv_22_kobato_memory=Trim(kobato_tv_22_cache02,140,751)
kobato_tv_22_touya=Trim(kobato_tv_22_cache01,12724,12799)
kobato_tv_22_ginsei_genko_zuishou=Trim(kobato_tv_22_cache01,22125,22178)
kobato_tv_22_ioryogi_memory=Trim(kobato_tv_22_cache01,22313,23471)
kobato_tv_23_disappear=Trim(kobato_tv_23,32011,32898)
kobato_tv_24_kobato_cry=Trim(kobato_tv_24,30808,30926)
kobato_tv_24_the_end=Trim(kobato_tv_24,34872,0)

######## Pre Combine ########

fade_length=12

kobato_tv_01_falling_01_01=Trim(kobato_tv_01_falling,0,80)
kobato_tv_01_falling_01_02=Trim(kobato_tv_01_falling,81,0)

kobato_tv_op_01_extend=Dissolve(kobato_tv_01_falling_01_02,kobato_tv_op_01,92)

kobato_tv_01_sakura_snow_01_start_dissolved=FADE_IN_WITH_BRIGHTNESS_OFFSET_RGB24(kobato_tv_01_sakura_snow_01,fade_length)
kobato_tv_01_sakura_snow=Dissolve(kobato_tv_01_sakura_snow_01_start_dissolved,kobato_tv_01_sakura_snow_02,12)

kobato_tv_01_park_dissolve_interval=8
kobato_tv_01_park=Dissolve(kobato_tv_01_park_01,kobato_tv_01_park_02,kobato_tv_01_park_03,kobato_tv_01_park_dissolve_interval)

kobato_tv_24_kobato_cry_trimmed=TRIM_MIDDLE_CLIP(kobato_tv_24_kobato_cry,69)

kiyokazu_interval=-36
kiyokazu=Dissolve(Trim(kobato_tv_14_little_kiyokazu,0,kiyokazu_interval),Trim(kobato_tv_02_kobato_useless,69,kiyokazu_interval),8)+kobato_tv_02_kobato_kiyokazu_wrong+Trim(kobato_tv_10_kiyokazu_shame,0,kiyokazu_interval*3/2)

kobato_tv_12_world_trimmed=Trim(kobato_tv_12_world,24,0)

kobato_tv_19_snow_end_faded=FADE_OUT_WITH_BRIGHTNESS_OFFSET_RGB24(kobato_tv_19_snow,fade_length)

kobato_tv_24_the_end_extend=Dissolve(kobato_tv_24_the_end,BlankClip(kobato_tv_24_the_end,length=312,color=color_white),24)

######## Combine ########

# kobato_tv_01_falling -81
# kobato_tv_op_01 140
# kobato_tv_op_02 5891

kobato_tv_op_t00=kobato_tv_op_01_extend+Dissolve(kobato_tv_01_sakura_snow,kobato_tv_01_park,10)

kobato_tv_op_main_character=Dissolve(kobato_tv_24_kobato_cry_trimmed,kobato_tv_04_kohaku_water_magic,8)

kobato_tv_op_people_01_interval=-13
kobato_tv_op_people_01=Trim(kobato_tv_07_takashi,9,kobato_tv_op_people_01_interval)+Trim(kobato_tv_21_kazuto,11,kobato_tv_op_people_01_interval)+Trim(kobato_tv_18_miyata,80,kobato_tv_op_people_01_interval)+Trim(kobato_tv_22_ginsei_genko_zuishou,0,kobato_tv_op_people_01_interval)+Trim(kobato_tv_06_marina_toshihiko_kobato,85,kobato_tv_op_people_01_interval*4/3)

kobato_tv_op_people_02_interval=-38
kobato_tv_op_people_02_dissolve_interval=4

kobato_tv_17_black_mokona_rescaled=RESCALE(kobato_tv_17_black_mokona,0.5,0.5)
kobato_tv_22_touya_rescaled=RESCALE(kobato_tv_22_touya,0.5,0.5)
kobato_tv_crossover_other_t01=LINEAR_MOVE(kobato_tv_17_kimihiro,"kobato_tv_17_black_mokona_rescaled","Blend",0,-kobato_tv_op_people_02_interval-1,90,90,1.0,0,0,1.0)
kobato_tv_crossover_other=LINEAR_MOVE(kobato_tv_crossover_other_t01,"kobato_tv_22_touya_rescaled","Blend",0,-kobato_tv_op_people_02_interval-1,0,450,1.0,0,540,1.0)

kobato_tv_op_people_02=Dissolve(Trim(kobato_tv_16_sayaka,0,kobato_tv_op_people_02_interval), \
	Trim(kobato_tv_03_chitose,0,kobato_tv_op_people_02_interval), \
	Trim(kobato_tv_03_chiho_chise,55,kobato_tv_op_people_02_interval), \
	Trim(kobato_tv_11_yumi_hiroyasu,117,kobato_tv_op_people_02_interval), \
	Trim(kobato_tv_15_kohaku_shuuichirou,125,kobato_tv_op_people_02_interval), \
	Trim(kobato_tv_20_shaoran_kobato_02,9,kobato_tv_op_people_02_interval), \
	Trim(kobato_tv_20_kurogane_fai,0,kobato_tv_op_people_02_interval), \
	Trim(kobato_tv_crossover_other,0,kobato_tv_op_people_02_interval),kobato_tv_op_people_02_dissolve_interval)

kobato_tv_op_t01=kobato_tv_op_main_character+kobato_tv_op_people_01+kobato_tv_op_people_02
kobato_tv_op_t02=Trim(kobato_tv_12_ioryogi_kobato_meet,273,0)+kiyokazu
kobato_tv_op_t03=kobato_tv_05_kobato_hotaru+Trim(kobato_tv_13_kobato_kohaku_sing,208,480)

kobato_tv_op_people_03_interval=-34
kobato_tv_op_people_03=Trim(kobato_tv_16_chitose_chiho_chise,0,kobato_tv_op_people_03_interval*2)+Trim(kobato_tv_09_chitose_sayaka_festival,0,kobato_tv_op_people_03_interval*2)+Trim(kobato_tv_08_chiho_chise_afraid,0,kobato_tv_op_people_03_interval*4) \
	+Trim(kobato_tv_12_ioryogi_ribbon,66,kobato_tv_op_people_03_interval)+Trim(kobato_tv_20_tsubasa_main_character,0,kobato_tv_op_people_03_interval)+Trim(kobato_tv_20_shaoran_kobato_01,0,kobato_tv_op_people_03_interval)+Trim(kobato_tv_11_kobato_maid,0,kobato_tv_op_people_03_interval*3)

kobato_tv_op_t04=DOUBLE_FADE_WITH_BRIGHTNESS_OFFSET_RGB24(kobato_tv_op_t01,kobato_tv_op_t02,fade_length,fade_length)
kobato_tv_op_t04=DOUBLE_FADE_WITH_BRIGHTNESS_OFFSET_RGB24(kobato_tv_op_t04,kobato_tv_op_t03,fade_length,fade_length)
kobato_tv_op_t04=DOUBLE_FADE_WITH_BRIGHTNESS_OFFSET_RGB24(kobato_tv_op_t04,kobato_tv_op_people_03,fade_length,fade_length)

kobato_tv_22_ioryogi_memory_trimmed=Trim(kobato_tv_22_ioryogi_memory,500,-Framecount(kobato_tv_12_world_trimmed))
kobato_tv_22_ioryogi_memory_rescaled=RESCALE(kobato_tv_22_ioryogi_memory_trimmed,0.75,0.75)
kobato_tv_12_world_mix=LINEAR_MOVE(kobato_tv_12_world_trimmed,"kobato_tv_22_ioryogi_memory_rescaled","Luma",0,Framecount(kobato_tv_12_world_trimmed)-1,480,0,0.75,0,270,0.75)

kobato_tv_23_disappear_mix_bg=BlankClip(kobato_tv_23_disappear,color=color_black)
kobato_tv_22_kobato_memory_rescaled=RESCALE(kobato_tv_22_kobato_memory,0.5,0.5)
kobato_tv_23_disappear_rescaled=RESCALE(kobato_tv_23_disappear,0.75,0.75)
kobato_tv_23_disappear_mix_t01=LINEAR_MOVE(kobato_tv_23_disappear_mix_bg,"kobato_tv_22_kobato_memory_rescaled","Add",0,Framecount(kobato_tv_22_kobato_memory)-1,135,0,0.75,0,135,0.5)
kobato_tv_23_disappear_mix=LINEAR_MOVE(kobato_tv_23_disappear_mix_t01,"kobato_tv_23_disappear_rescaled","Add",0,Framecount(kobato_tv_22_kobato_memory)-1,240,270,0.75,480,270,1.0)

kobato_tv_op_t05=Dissolve(kobato_tv_12_world_mix,kobato_tv_23_disappear_mix,36)
kobato_tv_op_t05=Dissolve(kobato_tv_op_t05,kobato_tv_19_snow_end_faded,75)

kobato_tv_op_t06=Dissolve(kobato_tv_op_02,kobato_tv_24_the_end_extend,51)

kobato_tv_op_t99=DOUBLE_FADE_WITH_BRIGHTNESS_OFFSET_RGB24(kobato_tv_op_t00,kobato_tv_op_t04,fade_length,fade_length)
kobato_tv_op_mute=DOUBLE_FADE_WITH_BRIGHTNESS_OFFSET_RGB24(kobato_tv_op_t99,kobato_tv_op_t05,fade_length,fade_length)+kobato_tv_op_t06

######## Music ########

bgm_48khz=SSRC(WAVSource("src\kobato-tv-op-01.wav"),48000)
AudioDub(kobato_tv_op_mute,bgm_48khz)

######## Subtitle ########

subtitle_x=50
subtitle_y=400
global subtitle_front_fade_count=12
global subtitle_rear_fade_count=24
global subtitle_font="MS Gothic"
global subtitle_effects="bi"
global subtitle_size=28
global subtitle_text_color=color_pink
global subtitle_halo_color=color_red

function SUBTITLE_FX(clip clip,string text,float x,float y,int start_frame,int end_frame,bool "is_title"){
	is_title=Default(is_title,false)

	halo_color=is_title?color_purple:subtitle_halo_color

	return SUBTITLE_FX_SLIDE_IN_WATER_OUT(clip,text,x,y,start_frame,end_frame,subtitle_front_fade_count,subtitle_rear_fade_count,subtitle_font,subtitle_effects,subtitle_size,subtitle_text_color,halo_color)
}

SUBTITLE_FX("マジックナンバー//坂本真綾|- by fielia@AVISynth",subtitle_x,subtitle_y-subtitle_size,4928,5066,true)

SUBTITLE_FX("どうすればいいんだっけ",subtitle_x,subtitle_y,326,390)
SUBTITLE_FX("あたりまえのことっていつも難しいな",subtitle_x,subtitle_y,394,596)
SUBTITLE_FX("嬉しいとき笑って",subtitle_x,subtitle_y,599,664)
SUBTITLE_FX("好きなときに歌いたいだけなのに",subtitle_x,subtitle_y,667,839)

SUBTITLE_FX("いつか願いは叶うと",subtitle_x,subtitle_y,872,972)
SUBTITLE_FX("でもいつかってどれくらい?",subtitle_x,subtitle_y,988,1065)
SUBTITLE_FX("待ちきれないよ",subtitle_x,subtitle_y,1068,1151)

SUBTITLE_FX("123!の合図で両手広げて|全身にひかりを集めて",subtitle_x,subtitle_y-subtitle_size,1156,1415)
SUBTITLE_FX("どこにあるの 教えて私にできること",subtitle_x,subtitle_y,1416,1569)
SUBTITLE_FX("めいっぱい傷ついて せいいっぱい走って",subtitle_x,subtitle_y,1566,1701)
SUBTITLE_FX("何十回転んで 泣いて それでもまだ",subtitle_x,subtitle_y,1703,1865)
SUBTITLE_FX("あきれるくらい 明日を信じてる",subtitle_x,subtitle_y,1871,2074)

SUBTITLE_FX("ひとりになりたくて",subtitle_x,subtitle_y,2379,2445)
SUBTITLE_FX("少しだけ遠回りした 帰りの道",subtitle_x,subtitle_y,2448,2651)
SUBTITLE_FX("会いたい人の顔",subtitle_x,subtitle_y,2654,2719)
SUBTITLE_FX("いくつか浮かんで 雲の中に消えた",subtitle_x,subtitle_y,2722,2888)

SUBTITLE_FX("あの日交わしたことばが",subtitle_x,subtitle_y,2928,3025)
SUBTITLE_FX("今ごろスッとしみ込んで",subtitle_x,subtitle_y,3043,3122)
SUBTITLE_FX("少し痛いよ",subtitle_x,subtitle_y,3120,3206)

SUBTITLE_FX("123! ひとつずつ扉たたいて|もう一回胸に問いかけて",subtitle_x,subtitle_y-subtitle_size,3210,3470)
SUBTITLE_FX("探してるの 本当に私がしたいこと",subtitle_x,subtitle_y,3471,3624)
SUBTITLE_FX("めいっぱい背伸びした反動でよろけて",subtitle_x,subtitle_y,3622,3756)
SUBTITLE_FX("何十回振り出しに戻って クタクタでも",subtitle_x,subtitle_y,3758,3919)
SUBTITLE_FX("そんな自分も 好きでいてあげたい",subtitle_x,subtitle_y,3923,4111)

SUBTITLE_FX("苦しくて 苦しくて",subtitle_x,subtitle_y,4135,4263)
SUBTITLE_FX("息ができなくなるときも",subtitle_x,subtitle_y,4267,4381)
SUBTITLE_FX("止まれない 止まりたくない|ぜんぶ見届けるまで",subtitle_x,subtitle_y-subtitle_size,4410,4720)

SUBTITLE_FX("123!の合図で空を見上げて|同じ星きみも見てて",subtitle_x,subtitle_y-subtitle_size,5471,5731)
SUBTITLE_FX("感じてるよ ひとりだけどひとりじゃないって",subtitle_x,subtitle_y,5733,5886)
SUBTITLE_FX("めいいっぱい傷ついて せいいっぱい走って",subtitle_x,subtitle_y,5882,6016)
SUBTITLE_FX("何十回転んで 泣いて それでもまだ",subtitle_x,subtitle_y,6019,6181)
SUBTITLE_FX("あきれるくらい 明日を信じてる",subtitle_x,subtitle_y,6186,6390)



AUDIO_DUB_TONE(kobato_tv_01_falling_01_01,samplerate=48000,channels=2,type="Silence")++ConvertToYV12(last)

######## Post Processing ########

ConvertToYV12()
#ConvertToYUY2()
#ConvertToRGB24()
