Import("shingeki_no_kyojin-tv-common-02.avsi")

######## Pre Combine ########

global fade_length=16

shingeki_no_kyojin_tv_clean_op_02_01_00=Trim(shingeki_no_kyojin_tv_clean_op_02_01,0,4)
shingeki_no_kyojin_tv_clean_op_02_01_01=Trim(shingeki_no_kyojin_tv_clean_op_02_01,5,0)

######## Combine ########

# beginning 66
# shingeki_no_kyojin_tv_clean_op_02_01 -5
# shingeki_no_kyojin_tv_clean_op_02_02 6455
# shingeki_no_kyojin_tv_clean_op_02_03 7695

# ha ha fade in 3 fade out 9



shingeki_no_kyojin_tv_op_01_t01=shingeki_no_kyojin_tv_clean_op_02_01_01
shingeki_no_kyojin_tv_op_01_t02=BlankClip(shingeki_no_kyojin_tv_clean_op_02,length=144,color=color_black)+BlankClip(shingeki_no_kyojin_tv_clean_op_02,length=73,color=color_white)+BlankClip(shingeki_no_kyojin_tv_clean_op_02,length=37,color=color_blue)+BlankClip(shingeki_no_kyojin_tv_clean_op_02,length=36,color=color_yellow) \
	+BlankClip(shingeki_no_kyojin_tv_clean_op_02,length=73,color=color_black)+BlankClip(shingeki_no_kyojin_tv_clean_op_02,length=73,color=color_white)+BlankClip(shingeki_no_kyojin_tv_clean_op_02,length=74,color=color_black)+BlankClip(shingeki_no_kyojin_tv_clean_op_02,length=36,color=color_white)+BlankClip(shingeki_no_kyojin_tv_clean_op_02,length=36,color=color_yellow) \
	+BlankClip(shingeki_no_kyojin_tv_clean_op_02,length=146,color=color_blue)

shingeki_no_kyojin_tv_op_01_t03=BlankClip(shingeki_no_kyojin_tv_clean_op_02,length=221,color=color_black)
shingeki_no_kyojin_tv_op_01_t04=BlankClip(shingeki_no_kyojin_tv_clean_op_02,length=292,color=color_yellow)

shingeki_no_kyojin_tv_op_01_t05=BlankClip(shingeki_no_kyojin_tv_clean_op_02,length=585,color=color_black)
shingeki_no_kyojin_tv_op_01_t06=BlankClip(shingeki_no_kyojin_tv_clean_op_02,length=292,color=color_white)
shingeki_no_kyojin_tv_op_01_t07=BlankClip(shingeki_no_kyojin_tv_clean_op_02,length=657,color=color_yellow)

shingeki_no_kyojin_tv_op_01_t08=BlankClip(shingeki_no_kyojin_tv_clean_op_02,length=585,color=color_black)
shingeki_no_kyojin_tv_op_01_t09=BlankClip(shingeki_no_kyojin_tv_clean_op_02,length=292,color=color_white)
shingeki_no_kyojin_tv_op_01_t10=BlankClip(shingeki_no_kyojin_tv_clean_op_02,length=476,color=color_yellow)

shingeki_no_kyojin_tv_op_01_t11=BlankClip(shingeki_no_kyojin_tv_clean_op_02,length=292,color=color_blue)
shingeki_no_kyojin_tv_op_01_t12=BlankClip(shingeki_no_kyojin_tv_clean_op_02,length=292,color=color_yellow)
shingeki_no_kyojin_tv_op_01_t13=BlankClip(shingeki_no_kyojin_tv_clean_op_02,length=512,color=color_black)
shingeki_no_kyojin_tv_op_01_t14=BlankClip(shingeki_no_kyojin_tv_clean_op_02,length=148,color=color_yellow)

shingeki_no_kyojin_tv_op_01_t15=shingeki_no_kyojin_tv_clean_op_02_02+BlankClip(shingeki_no_kyojin_tv_clean_op_02,length=37,color=color_yellow)
shingeki_no_kyojin_tv_op_01_t16=BlankClip(shingeki_no_kyojin_tv_clean_op_02,length=148,color=color_black)+BlankClip(shingeki_no_kyojin_tv_clean_op_02,length=72,color=color_white)+BlankClip(shingeki_no_kyojin_tv_clean_op_02,length=37,color=color_blue) \
	+BlankClip(shingeki_no_kyojin_tv_clean_op_02,length=35,color=color_yellow)+shingeki_no_kyojin_tv_clean_op_02_03+BlankClip(shingeki_no_kyojin_tv_clean_op_02,length=24*1,color=color_white)

shingeki_no_kyojin_tv_op_02_mute=shingeki_no_kyojin_tv_op_01_t01+shingeki_no_kyojin_tv_op_01_t02 \
	+shingeki_no_kyojin_tv_op_01_t03+shingeki_no_kyojin_tv_op_01_t04 \
	+shingeki_no_kyojin_tv_op_01_t05+shingeki_no_kyojin_tv_op_01_t06+shingeki_no_kyojin_tv_op_01_t07 \
	+shingeki_no_kyojin_tv_op_01_t08+shingeki_no_kyojin_tv_op_01_t09+shingeki_no_kyojin_tv_op_01_t10 \
	+shingeki_no_kyojin_tv_op_01_t11+shingeki_no_kyojin_tv_op_01_t12+shingeki_no_kyojin_tv_op_01_t13+shingeki_no_kyojin_tv_op_01_t14 \
	+shingeki_no_kyojin_tv_op_01_t15+shingeki_no_kyojin_tv_op_01_t16

######## Music ########

bgm_48khz=SSRC(WAVSource("src\shingeki_no_kyojin-tv-op-cd-02.wav"),48000)
AudioDub(shingeki_no_kyojin_tv_op_02_mute,bgm_48khz)
#MixAudio(shingeki_no_kyojin_tv_op_02_mute,bgm_48khz,5.5,1.0)

a=last

#shingeki_no_kyojin_tv_clean_op_02_01_00++a

#thumbnail=Trim(3288,-24*5)

######## Subtitle ########

global subtitle_clip_width=1280
global subtitle_clip_height=720

subtitle_x=50*1.5
subtitle_y=400*1.5
global subtitle_front_fade_count=24
global subtitle_rear_fade_count=24
global subtitle_font="MS Gothic"
global subtitle_effects="b"
global subtitle_size=28*1.5
global subtitle_text_color=color_white
global subtitle_halo_color=OVERWRITE_COLOR_ALPHA(color_black,$3F)

function SUBTITLE_FX(clip clip,string text,float x,float y,int start_frame,int end_frame,bool "is_title"){
	is_title=Default(is_title,false)

	halo_color=is_title?OVERWRITE_COLOR_ALPHA(color_orangered,$3F):subtitle_halo_color
	size=is_title?subtitle_size:subtitle_size*0.8

	return SUBTITLE_FX_PULL_IN_PULL_OUT(clip,text,Round(x),Round(y),start_frame,end_frame,subtitle_front_fade_count,subtitle_rear_fade_count,subtitle_font,subtitle_effects,Round(size),subtitle_text_color,halo_color)
}

SUBTITLE_FX("Ž©—R‚Ì—ƒ//Linked Horizon|- by fielia@AVISynth",-subtitle_x,subtitle_x,565,821,true)

SUBTITLE_FX("Angriff auf die Titanen.",subtitle_x,65*1*1.5,4688,5480) # 4688,4748
SUBTITLE_FX("Der Junge von einst wird bald zum Schwert greifen.",subtitle_x,65*2*1.5,4775,5480) # 4775,4907
SUBTITLE_FX("""                                                     "      """,subtitle_x,(65*3-5)*1.5,4979,5480) # 4979,5098
SUBTITLE_FX("Wer nur seine Machtlosigkeit beklagt, kann nichts verandern.",subtitle_x,65*3*1.5,4979,5480) # 4979,5098
SUBTITLE_FX("Der Junge von einst wird bald das schwarze Schwert ergreifen.",subtitle_x,65*4*1.5,5108,5480) # 5108,5224
SUBTITLE_FX("Hass und Zorn sind eine zweischneidige Klinge.",subtitle_x,65*5*1.5,5237,5480) # 5237,5330
SUBTITLE_FX("""                                              "           """,subtitle_x,(65*6-5)*1.5,5355,5480) # 5355,5480
SUBTITLE_FX("Bald, eines Tages, wird er dem Schicksal die Zahne zeigen.",subtitle_x,65*6*1.5,5355,5480) # 5355,5480



#LoadPlugin("VSFilter.dll")
#TextSub("shingeki_no_kyojin-tv-op-02.ass")


#shingeki_no_kyojin_tv_clean_op_02_01_00+a

a
#thumbnail
#shingeki_no_kyojin_tv_clean_op_02

######## Post Processing ########

ConvertToYV12()
#ConvertToYUY2()
#ConvertToRGB24()
