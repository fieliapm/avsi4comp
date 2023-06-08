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

Import("hoshi_no_kirby_discovery-common.avsi")

### inherit end ###

######## Function ########

### inherit start ###

LoadPlugin("..\plugins\MaskTools.dll")

function SUBTITLE_FX_FADE_IN_FADE_OUT_DOUBLE_HALO(clip clip,string text,int x,int y,int start_frame,int end_frame,int front_fade_count,int rear_fade_count,string "font",string "effects",int "size",int "text_color",int "halo_color",int "outside_halo_color",string "subtitle_mode"){
	before_start_frame=start_frame-front_fade_count
	after_end_frame=end_frame+rear_fade_count

	Assert(IsRGB32(clip),"SUBTITLE_FX_FADE_IN_FADE_OUT_DOUBLE_HALO(): clip only support RGB32 format")

	subtitle_rgb=_SUBTITLE_FX_PRE_OPAQUE(clip,outside_halo_color,text,x,y,before_start_frame,after_end_frame,font,effects,size,text_color,halo_color,subtitle_mode)
	subtitle_rgba=ColorKeyMask(ResetMask(subtitle_rgb),outside_halo_color,0)

	subtitle_alpha=CONVERT_BACK_TO_YV12(ShowAlpha(subtitle_rgba),matrix="Rec709")
	subtitle_alpha=Expand(Expand(Expand(subtitle_alpha)))
	subtitle_alpha=ConvertToRGB32(Greyscale(subtitle_alpha),matrix="Rec709")

	subtitle_rgba=Mask(subtitle_rgba,subtitle_alpha)

	subtitle_rgba_faded_containing_parameter=ScriptClip(subtitle_rgba,"RGBAdjust(a=alpha_factor)")
	subtitle_rgba_faded=FrameEvaluate(subtitle_rgba_faded_containing_parameter,"alpha_factor=Spline(current_frame,"+String(before_start_frame)+",0.0,"+String(start_frame)+",1.0,"+String(end_frame)+",1.0,"+String(after_end_frame)+",0.0,cubic=false)")

	return _SUBTITLE_FX_POST(clip,subtitle_rgba_faded,before_start_frame,after_end_frame)
}

### inherit end ###

######## Pre Combine ########

fade_length=30

######## Combine ########

# kirby_discovery_theme_song_op      -329
# kirby_discovery_theme_song_ed01    -6
# kirby_discovery_theme_song_ed02    -5



ed02_music_start=5

kirby_discovery_theme_song_ed02_01=Trim(kirby_discovery_theme_song_ed02,ed02_music_start,0)



kirby_discovery_theme_song_mute=Dissolve(TRIM_FIRST_CLIP(kirby_discovery_theme_song_op_01,2498),Trim(kirby_discovery_theme_song_ed02_01,2498-fade_length,0),fade_length)+BlankClip(kirby_discovery_theme_song,length=30*2,color=color_black)

kirby_discovery_theme_song_mute

### export clip: kirby_discovery_theme_song_mute

### prefetch: 5,2

### ###

######## Subtitle ########

### inherit start ###

#global subtitle_heavy_halo_width=1
global subtitle_clip_width=1920
global subtitle_clip_height=1080

subtitle_x=50*2.25
subtitle_y2=395*2.25
subtitle_y=(50+30)*2.25
global subtitle_front_fade_count=10
global subtitle_rear_fade_count=10
global subtitle_font="MS Gothic"
global subtitle_effects="b"
global subtitle_size=30*2.25
global subtitle_text_color=color_white
global subtitle_halo_color=color_black
global subtitle_outside_halo_color=color_gray10

function SUBTITLE_FX(clip clip,string text,float x,float y,int start_frame,int end_frame,bool "is_furigana",bool "is_title"){
	is_title=Default(is_title,false)
	is_furigana=Default(is_furigana,false)

	text_color=is_title?color_black:subtitle_text_color
	halo_color=is_title?color_white:subtitle_halo_color
	outside_halo_color=is_title?color_gray90:subtitle_outside_halo_color

	subtitle_mode=is_furigana?"ex":"ex" #"ex_thick_reduce_memory"
	size=is_furigana?subtitle_size*0.5:subtitle_size
	y=is_furigana?y+size:y

	return SUBTITLE_FX_FADE_IN_FADE_OUT_DOUBLE_HALO(clip,text,Round(x),Round(y),start_frame,end_frame,subtitle_front_fade_count,subtitle_rear_fade_count,subtitle_font,subtitle_effects,Round(size),text_color,halo_color,outside_halo_color,subtitle_mode)
}

### inherit end ###

ConvertToRGB32(matrix="Rec709")

SUBTITLE_FX("WELCOME TO THE NEW WORLD!//NEICHEL|- by fielia@AVISynth",-subtitle_x,subtitle_y2-subtitle_size,5884,6212,is_title=true)

SUBTITLE_FX("バルティア ヴェイロミ",subtitle_x,subtitle_y-subtitle_size,314,526)
SUBTITLE_FX("STRANGE HORIZON. READY TO GO.",subtitle_x,subtitle_y,314,526,true)
SUBTITLE_FX("リナヴォ ヌゥワァ",subtitle_x,subtitle_y-subtitle_size,537,748)
SUBTITLE_FX("FEAST YOUR EYES ON A NEW WORLD!",subtitle_x,subtitle_y,537,748,true)

SUBTITLE_FX("ソラヌティロ ルナマチョリナノワラトヴィオ",subtitle_x,subtitle_y-subtitle_size,758,973)
SUBTITLE_FX("A NEW DREAMLAND. A PLACE WHERE YOU'LL LAUGH AND SMILE.",subtitle_x,subtitle_y,758,973,true)
SUBTITLE_FX("マリファトォネ モナラティフォデルノディルナァ",subtitle_x,subtitle_y-subtitle_size,984,1192)
SUBTITLE_FX("ALONG THE WAY, STUFF YOUR BELLY AND NAP AWHILE.",subtitle_x,subtitle_y,984,1192,true)
SUBTITLE_FX("ナムヨチャフェレリィオ ウェグラリオテヌワ",subtitle_x,subtitle_y-subtitle_size,1202,1414)
SUBTITLE_FX("NO ONE CAN HOLD YOU BACK. NEW FIELDS FULL OF MYSTERY.",subtitle_x,subtitle_y,1202,1414,true)
SUBTITLE_FX("ワラノヴァラヴェルア トゥオレシア",subtitle_x,subtitle_y-subtitle_size,1421,1582)
SUBTITLE_FX("THE SKY's OPENED UP, AND THERE'S SO MUCH TO SEE.",subtitle_x,subtitle_y,1421,1582,true)

SUBTITLE_FX("ラァニンウェ",subtitle_x,subtitle_y-subtitle_size,1622,1693)
SUBTITLE_FX("RUNNING WILD!",subtitle_x,subtitle_y,1622,1693,true)
SUBTITLE_FX("タリラヌユゥロゥントゥ ヌゥファウォルヌウィ",subtitle_x,subtitle_y-subtitle_size,1697,1837)
SUBTITLE_FX("JUST LET YOUR HEART TAKE THE WHEEL AND SHOW YOU THE WAY.",subtitle_x,subtitle_y,1697,1837,true)
SUBTITLE_FX("サァアセロ",subtitle_x,subtitle_y-subtitle_size,1841,1912)
SUBTITLE_FX("FRESH SPRING BREEZE!",subtitle_x,subtitle_y,1841,1912,true)
SUBTITLE_FX("イラグルノウメルゥノファ レイアゥワァヌゥワァ",subtitle_x,subtitle_y-subtitle_size,1916,2227)
SUBTITLE_FX("ADVENTURE IS AWAITING YOU IN THE FIELDS OF A NEW WORLD!",subtitle_x,subtitle_y,1916,2227,true)

### pass clip: kirby_discovery_theme_song_mute

### prefetch: 5,2

### ###

SUBTITLE_FX("エウロォニ ナァオゥチア",subtitle_x,subtitle_y-subtitle_size,2713,2921)
SUBTITLE_FX("STRANGE EMOTION. WHAT DO YOU FEEL?",subtitle_x,subtitle_y,2713,2921,true)
SUBTITLE_FX("ロシラィ フゥワァ",subtitle_x,subtitle_y-subtitle_size,2932,3147)
SUBTITLE_FX("THE ROARING OCEAN OF A NEW WORLD!",subtitle_x,subtitle_y,2932,3147,true)

SUBTITLE_FX("ウェナルディエオ マァチャスロォラウェイアボニディ",subtitle_x,subtitle_y-subtitle_size,3157,3365)
SUBTITLE_FX("DON'T BE AFRAID. FACE YOUR FEARS-YOU'LL HUNGER FOR MORE.",subtitle_x,subtitle_y,3157,3365,true)
SUBTITLE_FX("ノルドゥワルファリ ノッキュオゥソドゥワドュウテ",subtitle_x,subtitle_y-subtitle_size,3376,3588)
SUBTITLE_FX("THE TENSION BUILDS: PLUNGE AHEAD ON THIS THRILLING TOUR.",subtitle_x,subtitle_y,3376,3588,true)
SUBTITLE_FX("ウィルマレィリレリィオ ウィルロォマレイラミィ",subtitle_x,subtitle_y-subtitle_size,3598,3813)
SUBTITLE_FX("THINK OF THE FRIENDS YOU'VE MADE, ALL OF THEM LIVING FREE.",subtitle_x,subtitle_y,3598,3813,true)
SUBTITLE_FX("セレナルゥムワティア ラファツェル",subtitle_x,subtitle_y-subtitle_size,3820,3975)
SUBTITLE_FX("THEIR CARES HAVE BEEN WASHED AWAY BY A WILD SEA.",subtitle_x,subtitle_y,3820,3975,true)

SUBTITLE_FX("ラァロウォ",subtitle_x,subtitle_y-subtitle_size,4017,4095)
SUBTITLE_FX("LAUGHING LOUD!",subtitle_x,subtitle_y,4017,4095,true)
SUBTITLE_FX("ナリニィヌミィウオドォヌ ワァティネェロ",subtitle_x,subtitle_y-subtitle_size,4099,4236)
SUBTITLE_FX("EVEN IF YOU'RE FAR APART, THEY'RE RIGHT BY YOUR SIDE.",subtitle_x,subtitle_y,4099,4236,true)
SUBTITLE_FX("レリパァ",subtitle_x,subtitle_y-subtitle_size,4240,4314)
SUBTITLE_FX("HEARTS FILL OF LOVE!",subtitle_x,subtitle_y,4240,4314,true)
SUBTITLE_FX("ワッレラルヴウェルブ プラリネィハゥア ヌゥワァ",subtitle_x,subtitle_y-subtitle_size,4318,4464)
SUBTITLE_FX("EVERYONE IS WELCOME TO LIVE IN THIS NEW WORLD.",subtitle_x,subtitle_y,4318,4464,true)

### pass clip: kirby_discovery_theme_song_mute

### prefetch: 5,2

### ###

SUBTITLE_FX("ラァニンウェ",subtitle_x,subtitle_y-subtitle_size,4468,4530)
SUBTITLE_FX("RUNNING WILD!",subtitle_x,subtitle_y,4468,4530,true)
SUBTITLE_FX("タリラヌユゥロゥントゥ ヌゥファウォルヌウィ",subtitle_x,subtitle_y-subtitle_size,4533,4671)
SUBTITLE_FX("JUST LET YOUR HEART TAKE THE WHEEL AND SHOW YOU THE WAY.",subtitle_x,subtitle_y,4533,4671,true)
SUBTITLE_FX("サァワアセロ",subtitle_x,subtitle_y-subtitle_size,4675,4746)
SUBTITLE_FX("FRESH SPRING BREEZE!",subtitle_x,subtitle_y,4675,4746,true)
SUBTITLE_FX("イラグルノウメルゥノファ レイアゥワァウ",subtitle_x,subtitle_y-subtitle_size,4750,4917)
SUBTITLE_FX("ADVENTURE IS AWAITING YOU IN THE FIELDS OF A-",subtitle_x,subtitle_y,4750,4917,true)

SUBTITLE_FX("ロミティルパウムロォ リラリィラァ",subtitle_x,subtitle_y-subtitle_size,4972,5166)
SUBTITLE_FX("OPEN HEARTS ALREADY FLUTTERING FREE AND RIDING THE BREEZE.",subtitle_x,subtitle_y,4972,5166,true)
SUBTITLE_FX("ワッレラルヴウェルブ プラリネィハゥア",subtitle_x,subtitle_y-subtitle_size,5188,5313)
SUBTITLE_FX("NOTHUNG BUT LOVE TO SHARE WITH EVERYONE WE KNOW. WHOA!",subtitle_x,subtitle_y,5188,5313,true)
SUBTITLE_FX("ヌゥワァ",subtitle_x,subtitle_y-subtitle_size,5317,5778)
SUBTITLE_FX("NEW WORLD",subtitle_x,subtitle_y,5317,5778,true)
 
######## Thumbnail ########

is_thumbnail=false

is_thumbnail?ConvertToRGB32(kirby_discovery_theme_song_mute,matrix="Rec709"):last

######## Music ########

AudioDub(kirby_discovery_track_75)



thumbnail_01=Trim(192,-30*5)
thumbnail_02=Trim(1168,-30*5)
#thumbnail=Trim(1566,-30*5)
#thumbnail=Trim(1613,-30*5)
thumbnail=StackVertical(thumbnail_01,thumbnail_02)



ConvertToRGB32(kirby_discovery_theme_song_op_00,matrix="Rec709")++last



is_thumbnail?thumbnail:last

""")

######## Post Processing ########

#ConvertToRGB24()
#ConvertBackToYUY2(matrix="Rec709")
CONVERT_BACK_TO_YV12(matrix="Rec709")

#ConvertAudioTo8bit()
#ConvertAudioTo16bit()
ConvertAudioTo24bit()
#ConvertAudioTo32bit()
#ConvertAudioToFloat()

TCPServer()
