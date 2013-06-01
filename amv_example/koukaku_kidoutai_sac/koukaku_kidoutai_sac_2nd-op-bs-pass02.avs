Import("macro.avsi")

SetMemoryMax(64)

######## Pass-02 ########

#OpenDMLSource("koukaku_kidoutai_sac_2nd-op-bs-pass01.avi")
TCPSource("localhost")

######## Subtitle ########

global subtitle_clip_width=1920
global subtitle_clip_height=1080

global subtitle_x=50*2.25
global subtitle_y=400*2.25
#global subtitle_x=50
#global subtitle_y=400
global subtitle_front_fade_count=18
global subtitle_rear_fade_count=18
global subtitle_font="MS Gothic"
global subtitle_effects="bi"
global subtitle_size=24*2.25
#global subtitle_size=24
global subtitle_text_color=color_white
global subtitle_halo_color=OVERWRITE_COLOR_ALPHA(color_lime,$3F)
global subtitle_random_char_func="RANDOM_ASCII_CHAR"

function SUBTITLE_FX_1(clip clip,string text,float x,float y,int start_frame,int end_frame,bool "is_title"){
	is_title=Default(is_title,false)

	front_fade_count=is_title?title_subtitle_front_fade_count:subtitle_front_fade_count
	rear_fade_count=is_title?title_subtitle_rear_fade_count:subtitle_rear_fade_count
	size=is_title?title_subtitle_size:subtitle_size
	halo_color=is_title?OVERWRITE_COLOR_ALPHA(subtitle_halo_color,$0):subtitle_halo_color
	random_char_func=is_title?title_subtitle_random_char_func:subtitle_random_char_func

	return SUBTITLE_FX_RANDOM_STRING(clip,text,Round(x),Round(y),start_frame,end_frame,front_fade_count,rear_fade_count,subtitle_font,subtitle_effects,Round(size),subtitle_text_color,halo_color,random_char_func=random_char_func)
}

global second_subtitle_front_fade_count=24
global second_subtitle_rear_fade_count=24

function SUBTITLE_FX_2(clip clip,string text,float x,float y,int start_frame,int end_frame){
	return SUBTITLE_FX_FLY_IN_FLY_OUT(clip,text,Round(x),Round(y),start_frame,end_frame,second_subtitle_front_fade_count,second_subtitle_rear_fade_count,subtitle_font,subtitle_effects,Round(subtitle_size),subtitle_text_color,subtitle_halo_color)
}



global title_subtitle_front_fade_count=24
global title_subtitle_rear_fade_count=24
global title_subtitle_size=subtitle_size*2
global title_subtitle_random_char_func="RANDOM_JIS_CHAR"

title_01_01="rise//origa             "
title_01_02="    - by fielia@AVISynth"
title_02="íÜâõìÆâÊïî"
title_01_01_subtitle_x=(subtitle_clip_width/2)-(title_subtitle_size*StrLen(title_01_01)/4)
title_01_02_subtitle_x=(subtitle_clip_width/2)-(title_subtitle_size*StrLen(title_01_02)/4)
title_02_subtitle_x=(subtitle_clip_width/2)-(title_subtitle_size*StrLen(title_02)/4)
title_subtitle_y=subtitle_clip_height/2

SUBTITLE_FX_1(title_01_01,title_01_01_subtitle_x,title_subtitle_y-title_subtitle_size*2,7035,7509,true)
SUBTITLE_FX_1(title_01_02,title_01_02_subtitle_x,title_subtitle_y-title_subtitle_size*1,7035,7509,true)
SUBTITLE_FX_1(title_02,title_02_subtitle_x,title_subtitle_y+title_subtitle_size*2,7193,7509,true)



function REPEAT_SUBTITLE(clip clip,int start_frame){
	clip=SUBTITLE_FX_1(clip,"Save your tears",subtitle_x,subtitle_y,start_frame-5,start_frame+35)
	clip=SUBTITLE_FX_1(clip,"for the day",subtitle_x,subtitle_y,start_frame+36,start_frame+67)
	clip=SUBTITLE_FX_1(clip,"when our pain is far behind",subtitle_x,subtitle_y,start_frame+73,start_frame+146)
	clip=SUBTITLE_FX_1(clip,"on your feet",subtitle_x,subtitle_y,start_frame+149,start_frame+187)
	clip=SUBTITLE_FX_1(clip,"come with me",subtitle_x,subtitle_y,start_frame+189,start_frame+227)
	clip=SUBTITLE_FX_1(clip,"we are soldiers stand or die",subtitle_x,subtitle_y,start_frame+229,start_frame+308)

	clip=SUBTITLE_FX_1(clip,"Save your fears",subtitle_x,subtitle_y,start_frame+311,start_frame+346)
	clip=SUBTITLE_FX_1(clip,"take your place",subtitle_x,subtitle_y,start_frame+347,start_frame+385)
	clip=SUBTITLE_FX_1(clip,"save them for the judgement day",subtitle_x,subtitle_y,start_frame+386,start_frame+464)
	clip=SUBTITLE_FX_1(clip,"fast and free",subtitle_x,subtitle_y,start_frame+465,start_frame+504)
	clip=SUBTITLE_FX_1(clip,"follow me",subtitle_x,subtitle_y,start_frame+506,start_frame+543)
	clip=SUBTITLE_FX_1(clip,"time to make the sacrifice",subtitle_x,subtitle_y,start_frame+545,start_frame+656)
	clip=SUBTITLE_FX_1(clip,"we rise or fall",subtitle_x,subtitle_y,start_frame+657,start_frame+821)
	return clip
}

SUBTITLE_FX_1("I'm a soldier, ÑxÑ~ÑpÑâÑyÑÑ Ñë",subtitle_x,subtitle_y,644,715)
SUBTITLE_FX_2("               znachit ya",subtitle_x,subtitle_y-subtitle_size,644,715)
SUBTITLE_FX_1("ÑI ÑÄÑÑÑrÑuÑÑÑâÑyÑ{ Ñy ÑÉÑÖÑtÑéÑë",subtitle_x,subtitle_y,723,794)
SUBTITLE_FX_2("I otvyetchik i sud'ya",subtitle_x,subtitle_y-subtitle_size*2,723,794)
SUBTITLE_FX_1("Ñ` ÑÉÑÑÑÄÑê Ñ~Ñp ÑtÑrÑÖÑá Ñ{ÑÄÑ~ÑàÑpÑá ÑÄÑsÑ~Ñë",subtitle_x,subtitle_y,802,926)
SUBTITLE_FX_2("Ya stoyu na dvukh kontsakh ognya",subtitle_x,subtitle_y-subtitle_size,802,926)
SUBTITLE_FX_1("ÑOÑsÑyÑqÑpÑë ÑrÑyÑÇÑpÑwÑy,|ÑÄÑqÑsÑÄÑ~ÑëÑë ÑÉÑ}ÑuÑÇÑÑÑé Ñy ÑwÑyÑxÑ~Ñé",subtitle_x,subtitle_y-subtitle_size,960,1110)
SUBTITLE_FX_2("Ogibaya virazhi,|obgonyaya smyert' i zhizn'",subtitle_x,subtitle_y-subtitle_size*3,960,1110)
SUBTITLE_FX_1("Ñ` ÑqÑuÑsÑÖ ÑÉÑÇÑpÑxÑyÑÑÑéÑÉÑë ÑÉ ÑÑÑuÑ~ÑéÑê Ñ|ÑwÑy",subtitle_x,subtitle_y,1118,1242)
SUBTITLE_FX_2("Ya byegu srazit'sya s tyen'yu lzhi",subtitle_x,subtitle_y-subtitle_size,1118,1242)
SUBTITLE_FX_1("ÑRÑ{ÑÄÑ|ÑéÑ{ÑÄ Ñq Ñ~ÑyÑÑÑuÑz Ñ~Ñu ÑÅÑ|ÑvÑ| ÑÄÑqÑ}ÑpÑ~",subtitle_x,subtitle_y,1253,1400)
SUBTITLE_FX_2("Skol'ko b nityey nye plyol obman",subtitle_x,subtitle_y-subtitle_size*2,1253,1400)
SUBTITLE_FX_1("ÑPÑÄÑ{ÑpÑwÑuÑÑ Ñ|ÑyÑ{ ÑÉÑrÑuÑÑÑp ÑyÑÉÑÑÑyÑ~Ñp",subtitle_x,subtitle_y,1413,1597)
SUBTITLE_FX_2("Pokazhyet lik svyeta istina",subtitle_x,subtitle_y-subtitle_size,1413,1597)

REPEAT_SUBTITLE(1613)

SUBTITLE_FX_1("I'm a soldier, born to stand",subtitle_x,subtitle_y,2615,2686)
SUBTITLE_FX_1("in this waking hell I am",subtitle_x,subtitle_y,2694,2765)
SUBTITLE_FX_1("witnessing more than I can compute",subtitle_x,subtitle_y,2773,2890)

SUBTITLE_FX_1("pray myself we don't forget",subtitle_x,subtitle_y,2930,3001)
SUBTITLE_FX_1("lies, betrayed and the oppressed",subtitle_x,subtitle_y,3009,3080)
SUBTITLE_FX_1("please give me the strength to be the truth",subtitle_x,subtitle_y,3088,3216)

SUBTITLE_FX_1("people facing the fire together",subtitle_x,subtitle_y,3226,3378)
SUBTITLE_FX_1("if we don't, we'll lose all we have found",subtitle_x,subtitle_y,3383,3557)

REPEAT_SUBTITLE(3584)

SUBTITLE_FX_1("ÑHÑp Ñ}ÑuÑâÑÑÑÄÑê Ñ~ÑpÑ{ÑÇÑpÑz ÑÅÑÇÑÄÑÅÑpÑÉÑÑÑy",subtitle_x,subtitle_y,5194,5353)
SUBTITLE_FX_2("Za myechtoyu nakray propasti",subtitle_x,subtitle_y-subtitle_size,5194,5353)
SUBTITLE_FX_1("ÑLÑyÑäÑé ÑÑÑÄÑ|ÑéÑ{ÑÄ ÑÑÑpÑ{ Ñ}ÑÄÑwÑ~ÑÄ Ñ}ÑyÑÇ ÑÉÑÅÑpÑÉÑÑÑy",subtitle_x,subtitle_y,5355,5541)
SUBTITLE_FX_2("Lish' tol'ko tak mozhno mir spasti",subtitle_x,subtitle_y-subtitle_size*2,5355,5541)

SUBTITLE_FX_1("ÑSÑç Ñ~Ñu ÑÅÑ|ÑpÑâÑé,",subtitle_x,subtitle_y,5550,5586)
SUBTITLE_FX_2("Ty nye plach',",subtitle_x,subtitle_y-subtitle_size,5550,5586)
SUBTITLE_FX_1("ÑRÑ|ÑvÑxÑç ÑÉÑÅÑÇÑëÑâÑé,",subtitle_x,subtitle_y,5587,5622)
SUBTITLE_FX_2("Slyozy spryach',",subtitle_x,subtitle_y-subtitle_size*2,5587,5622)
SUBTITLE_FX_1("ÑBÑuÑtÑé Ñ~ÑpÑÉÑÑÑpÑ~ÑuÑÑ Ñ~ÑÄÑrÑçÑz ÑtÑuÑ~Ñé",subtitle_x,subtitle_y,5623,5699)
SUBTITLE_FX_2("Ved' nastanyet novyy den'",subtitle_x,subtitle_y-subtitle_size,5623,5699)
SUBTITLE_FX_1("ÑSÑrÑÄÑz ÑÄÑsÑÄÑ~Ñé",subtitle_x,subtitle_y,5703,5737)
SUBTITLE_FX_2("Tvoy ogon'",subtitle_x,subtitle_y-subtitle_size*2,5703,5737)
SUBTITLE_FX_1("ÑRÑÄÑsÑÇÑuÑrÑpÑÑÑé",subtitle_x,subtitle_y,5742,5780)
SUBTITLE_FX_2("Sogryevat'",subtitle_x,subtitle_y-subtitle_size,5742,5780)
SUBTITLE_FX_1("ÑAÑÖÑtÑuÑÑ ÑÑÑçÑÉÑëÑâÑy ÑÉÑuÑÇÑtÑuÑà",subtitle_x,subtitle_y,5781,5863)
SUBTITLE_FX_2("Budyet tysyachi syerdets",subtitle_x,subtitle_y-subtitle_size*2,5781,5863)
SUBTITLE_FX_1("Ñ@ ÑÉÑuÑzÑâÑpÑÉ ÑÅÑÄÑtÑ~ÑyÑ}ÑyÑÉÑé",subtitle_x,subtitle_y,5866,5937)
SUBTITLE_FX_2("A syeychas podnimis'",subtitle_x,subtitle_y-subtitle_size,5866,5937)
SUBTITLE_FX_1("ÑRÑÅÑÇÑëÑâÑé ÑÅÑÄÑtÑpÑ|ÑéÑäÑu ÑqÑÄÑ|Ñé Ñy ÑÉÑÑÑÇÑpÑá",subtitle_x,subtitle_y,5938,6018)
SUBTITLE_FX_2("Spryach' podal'shye bol' i strakh",subtitle_x,subtitle_y-subtitle_size*2,5938,6018)
SUBTITLE_FX_1("ÑPÑÄÑqÑuÑtÑyÑÑ ÑÑÑÄÑÑ, Ñ{ÑÑÑÄ ÑÅÑÇÑpÑr",subtitle_x,subtitle_y,6019,6096)
SUBTITLE_FX_2("Pobyedit tot, kto prav",subtitle_x,subtitle_y-subtitle_size,6019,6096)
SUBTITLE_FX_1("ÑHÑ~ÑpÑz, ÑâÑÑÑÄ ÑrÑÉÑv Ñr ÑÑÑrÑÄÑyÑá ÑÇÑÖÑ{ÑpÑá",subtitle_x,subtitle_y,6097,6176)
SUBTITLE_FX_2("Znay, chto vsyo v tvoikh rukakh",subtitle_x,subtitle_y-subtitle_size*2,6097,6176)

REPEAT_SUBTITLE(6185)

######## Post Processing ########

ConvertToYV12()
#ConvertToYUY2()
#ConvertToRGB24()
