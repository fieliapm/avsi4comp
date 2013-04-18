Import("macro.avsi")

#SetMemoryMax(64)

######## DVD (480P) ########

majo_no_takkyuubin_01=VOB_MPEG2_VIDEO_SOURCE("src\dvd\VTS_01_1.d2v")
majo_no_takkyuubin_01_mark=Trim(majo_no_takkyuubin_01,194,370)

majo_no_takkyuubin_07=VOB_MPEG2_VIDEO_SOURCE("src\dvd\VTS_01_7.d2v")
majo_no_takkyuubin_07_ed=Trim(majo_no_takkyuubin_07,5858,0)

######## Pre Combine (480P) ########

majo_no_takkyuubin_01_mark=AUDIO_DUB_TONE(majo_no_takkyuubin_01_mark,samplerate=48000,channels=2,type="Silence")

######## Combine ########

majo_no_takkyuubin_ed_mute=majo_no_takkyuubin_07_ed

######## Music ########

#bgm_48khz=ResampleAudio(AssumeSampleRate(WAVSource("src\yuming-1974_10_05-misslim-03.wav"),44042),48000)
#bgm_48khz_delayed=DelayAudio(bgm_48khz,2.248)

bgm_48khz=ResampleAudio(AssumeSampleRate(WAVSource("src\majo_no_takkyuubin-ost-21.wav"),43738),48000)
bgm_48khz_delayed=DelayAudio(bgm_48khz,2.211)

AudioDub(majo_no_takkyuubin_ed_mute,bgm_48khz_delayed)

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

SUBTITLE_FX("やさしさに包まれたなら|album version//荒井由実|- by fielia@AVISynth",subtitle_x,subtitle_y-(subtitle_size*2),80,287,true)

SUBTITLE_FX("小さい頃は神さまがいて",subtitle_x,subtitle_y,357,600)
SUBTITLE_FX("不思議に夢をかなえてくれた",subtitle_x,subtitle_y-subtitle_size,632,879)
SUBTITLE_FX("やさしい気持で目覚めた朝は",subtitle_x,subtitle_y,907,1152)
SUBTITLE_FX("おとなになっても奇蹟はおこるよ",subtitle_x,subtitle_y-subtitle_size,1181,1455)

SUBTITLE_FX("カーテンを開いて 静かな木洩れ陽の",subtitle_x,subtitle_y,1472,1718)
SUBTITLE_FX("やさしさに包まれたなら きっと",subtitle_x,subtitle_y-subtitle_size,1742,1984)
SUBTITLE_FX("目にうつる全てのことは メッセージ",subtitle_x,subtitle_y,1991,2281)

SUBTITLE_FX("小さい頃は神さまがいて",subtitle_x,subtitle_y,2547,2787)
SUBTITLE_FX("毎日愛を届けてくれた",subtitle_x,subtitle_y-subtitle_size,2823,3069)
SUBTITLE_FX("心の奥にしまい忘れた",subtitle_x,subtitle_y,3098,3348)
SUBTITLE_FX("大切な箱 ひらくときは今",subtitle_x,subtitle_y-subtitle_size,3372,3647)

SUBTITLE_FX("雨上がりの庭で くちなしの香りの",subtitle_x,subtitle_y,3666,3920)
SUBTITLE_FX("やさしさに包まれたなら きっと",subtitle_x,subtitle_y-subtitle_size,3941,4182)
SUBTITLE_FX("目にうつる全てのことは メッセージ",subtitle_x,subtitle_y,4189,4486)

SUBTITLE_FX("カーテンを開いて 静かな木洩れ陽の",subtitle_x,subtitle_y,4552,4800)
SUBTITLE_FX("やさしさに包まれたなら きっと",subtitle_x,subtitle_y-subtitle_size,4823,5064)
SUBTITLE_FX("目にうつる全てのことは メッセージ",subtitle_x,subtitle_y,5071,5436)



majo_no_takkyuubin_01_mark++ConvertToYV12(FADE_IN_WITH_BRIGHTNESS_OFFSET(last,30))

######## Post Processing ########

#### restore interlace ####
DoubleWeave()

#### restore aspect ratio ####
Lanczos4Resize(856,480)

ConvertToYV12()
#ConvertToYUY2()
#ConvertToRGB24()
