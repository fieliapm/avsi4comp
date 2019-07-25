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

is_60p=true

Import("crystar-common.avsi")

######## Pre Combine ########

global frame_index_scale=is_60p?2:1

fade_length=30



crystar_wallpaper_show=ScriptClip(crystar_wallpaper,"FAST_ZOOM(srcx=0.8*Width(),srcy=0.4*Height(),dstx=0.8*Width(),dsty=0.4*Height(),factor=Pow(2.0,Spline(current_frame,0*frame_index_scale,0.0,Framecount()-1,4.0,cubic=false)),extend=true)")
#crystar_wallpaper_show=ScriptClip(crystar_wallpaper,"FAST_ZOOM(srcx=0.8*Width(),srcy=0.4*Height(),dstx=0.8*Width(),dsty=0.4*Height(),factor=1.0/Spline(current_frame,0*frame_index_scale,1.0,Framecount()-1,1.0/16.0,cubic=false),extend=true)")
crystar_wallpaper_show=CONVERT_BACK_TO_YV12(crystar_wallpaper_show,matrix="Rec709")
crystar_wallpaper_show_resized=RESIZE_TO_REF_CLIP(crystar_wallpaper_show,crystar_teaser_movie)



pencil_part=crystar_promotion_movie_05_pencil+crystar_promotion_movie_07_pencil+crystar_promotion_movie_12_pencil+crystar_promotion_movie_09_dialog

######## Combine ########

#                                  30p
# crystar_teaser_movie_01_tear      16/270
# crystar_teaser_movie_02_op       794

#                                          30p     60p
# crystar_promotion_movie_20_animation    6760    13519
# crystar_promotion_movie_21_title        7461    14921
# crystar_promotion_movie_22_rei_cry      7839    15677
# crystar_promotion_movie_23_slogan       8124    16248
# crystar_promotion_movie_24_pencil       8221    16442



crystar_ed_t01=BlankClip(crystar_teaser_movie,length=16,color=color_black)+Dissolve(TRIM_FIRST_CLIP(crystar_wallpaper_show_resized,254+fade_length),crystar_teaser_movie_01_tear,fade_length)+BlankClip(crystar_teaser_movie,length=22,color=color_black)+crystar_teaser_movie_02_op
crystar_ed_t02=TRIM_MIDDLE_CLIP(crystar_op_02_title,201*frame_index_scale)+TRIM_FIRST_CLIP(crystar_op_06,(189+166)*frame_index_scale)+TRIM_FIRST_CLIP(crystar_op_07,24*frame_index_scale) #580

crystar_ed_t03=TRIM_LAST_CLIP(crystar_system_guardian+crystar_system_guilt,(190+189+190+189)*frame_index_scale) #758

crystar_ed_t04=TRIM_LAST_CLIP(crystar_system_katharsis_01_menu+crystar_system_katharsis_02_animation,((19+145+25+190+23+141+26+164+25)+(154+36+152))*frame_index_scale) #758 1100
crystar_ed_t05=TRIM_FIRST_CLIP(crystar_character_rei_07_dialog,(37+154+36+117)*frame_index_scale) #686 344
crystar_ed_t06=TRIM_FIRST_CLIP(crystar_character_rei_05_game,(24+178+11+190+189+96)*frame_index_scale)

crystar_ed_t07=TRIM_MIDDLE_CLIP(crystar_action_kokoro,189*frame_index_scale)+TRIM_MIDDLE_CLIP(crystar_action_sen,190*frame_index_scale)+TRIM_MIDDLE_CLIP(crystar_action_777,(189+189)*frame_index_scale)
crystar_ed_t08=TRIM_FIRST_CLIP(crystar_character_rei_04_game,(190+189)*frame_index_scale)+TRIM_FIRST_CLIP(crystar_action_rei,((190+189+54)*frame_index_scale)-(is_60p?1:0)) #379 433

crystar_ed_t09=crystar_promotion_movie_20_animation+BlankClip(crystar_promotion_movie,length=Framecount(crystar_promotion_movie_21_title)-Framecount(pencil_part),color=color_black)+pencil_part+crystar_promotion_movie_22_rei_cry+crystar_promotion_movie_23_slogan+crystar_promotion_movie_24_pencil+BlankClip(crystar_promotion_movie,length=(59+12)*frame_index_scale,color=color_white)
crystar_ed_t10=TRIM_LAST_CLIP(crystar_character_rei_01_prologue,(189+189+190+189)*frame_index_scale)+BlankClip(crystar_character_rei,length=143*frame_index_scale,color=color_black)

crystar_ed_mute=FRAME_RATE_2X(RESIZE_TO_REF_CLIP(crystar_ed_t01,crystar_promotion_movie),is_60p)+crystar_ed_t02+RESIZE_TO_REF_CLIP(crystar_ed_t03 \
	+crystar_ed_t04+crystar_ed_t05+crystar_ed_t06 \
	+crystar_ed_t07+crystar_ed_t08,crystar_promotion_movie) \
	+crystar_ed_t09+RESIZE_TO_REF_CLIP(crystar_ed_t10,crystar_promotion_movie)

######## Music ########

bgm_48khz=SSRC(WAVSource("src\iroduku_sekai_no_ashita_kara-ed-03.wav"),48000)
Normalize(AudioDub(crystar_ed_mute,bgm_48khz))



last++Normalize(crystar_promotion_movie_27_furyu)+BlankClip(crystar_promotion_movie,length=30*2*frame_index_scale,color=color_black)



ConvertToRGB32(matrix="Rec709")

thumbnail=Trim(1922*frame_index_scale,-30*5*frame_index_scale)

######## Subtitle ########

#global subtitle_heavy_halo_width=1
global subtitle_clip_width=1280
global subtitle_clip_height=720

subtitle_x=50*1.5
subtitle_y=389*1.5
global subtitle_front_fade_count=30
global subtitle_rear_fade_count=30
global subtitle_font="MS Mincho"
global subtitle_effects="b"
global subtitle_size=36*1.5
global subtitle_text_color=color_white
global subtitle_halo_color=color_black
global subtitle_outside_halo_color=color_gray10

global scan_mask=GENERATE_SCAN_MASK(crystar_promotion_movie,subtitle_front_fade_count*frame_index_scale)

function SUBTITLE_FX(clip clip,string text,float x,float y,int start_frame,int end_frame,bool "is_furigana",bool "is_title"){
	is_title=Default(is_title,false)
	is_furigana=Default(is_furigana,false)

	halo_color=is_title?color_dodgerblue:subtitle_halo_color

	subtitle_mode=is_furigana?"ex":"ex" #"ex_thick_reduce_memory"
	size=is_furigana?subtitle_size*0.5:subtitle_size
	y=is_furigana?y-size:y

	return SUBTITLE_FX_SCAN_IN_FADE_OUT_DOUBLE_HALO(clip,text,Round(x),Round(y),start_frame*frame_index_scale,end_frame*frame_index_scale,subtitle_front_fade_count*frame_index_scale,subtitle_rear_fade_count*frame_index_scale,subtitle_font,subtitle_effects,Round(size),subtitle_text_color,halo_color,subtitle_outside_halo_color,subtitle_mode)
}

SUBTITLE_FX("re-live//やなぎなぎ|- by fielia@AVISynth",-subtitle_x,subtitle_y-subtitle_size,8792,9076,is_title=true)

SUBTITLE_FX("                 み            わたし  なみだ ",subtitle_x,subtitle_y-subtitle_size*2,44,717,true)
SUBTITLE_FX("あなたが見ていた私の涙 ",subtitle_x,subtitle_y-subtitle_size*2,44,717)
SUBTITLE_FX("            あじ                そうぞう              ",subtitle_x,subtitle_y,757,1088,true)
SUBTITLE_FX("どんな味がするか想像できる?",subtitle_x,subtitle_y,757,1088)
SUBTITLE_FX(" の      こ                                     ",subtitle_x,subtitle_y-subtitle_size*2,1121,1285,true)
SUBTITLE_FX("飲み込んでいてくれたなら",subtitle_x,subtitle_y-subtitle_size*2,1121,1285)
SUBTITLE_FX("きっと",subtitle_x,subtitle_y,1311,1441)
SUBTITLE_FX("つた                                                          ",subtitle_x,subtitle_y-subtitle_size*2,1511,1710,true)
SUBTITLE_FX("伝わるはずだった ふたりのイデア",subtitle_x,subtitle_y-subtitle_size*2,1511,1710)
SUBTITLE_FX("        ちが   いのち とど        ",subtitle_x,subtitle_y,1713,1900,true)
SUBTITLE_FX("すれ違う命 届かず",subtitle_x,subtitle_y,1713,1900)
SUBTITLE_FX(" せ なか あ              と             ",subtitle_x,subtitle_y-subtitle_size*2,1913,2082,true)
SUBTITLE_FX("背中合わせに閉じてく",subtitle_x,subtitle_y-subtitle_size*2,1913,2082)
SUBTITLE_FX("たが        ゆめ",subtitle_x,subtitle_y,2105,2221,true)
SUBTITLE_FX("互いの夢",subtitle_x,subtitle_y,2105,2221)

SUBTITLE_FX("よご       からだ                           あら        ",subtitle_x,subtitle_y-subtitle_size*2,3071,3721,true)
SUBTITLE_FX("汚れた体をカタルシスで洗って",subtitle_x,subtitle_y-subtitle_size*2,3071,3721)
SUBTITLE_FX(" い                 よう    ここ ち     ひた                ",subtitle_x,subtitle_y,3787,4117,true)
SUBTITLE_FX("生きている様な心地に浸っていた",subtitle_x,subtitle_y,3787,4117)
SUBTITLE_FX("しん                                          ",subtitle_x,subtitle_y-subtitle_size*2,4151,4326,true)
SUBTITLE_FX("信じているの アレセイア",subtitle_x,subtitle_y-subtitle_size*2,4151,4326)
SUBTITLE_FX("いずれ",subtitle_x,subtitle_y,4342,4466)
SUBTITLE_FX(" お        いのち    み  あ                     ",subtitle_x,subtitle_y-subtitle_size*2,4497,4695,true)
SUBTITLE_FX("終わる命に見合うのならば",subtitle_x,subtitle_y-subtitle_size*2,4497,4695)
SUBTITLE_FX(" ふさわ                                     ",subtitle_x,subtitle_y,4697,4883,true)
SUBTITLE_FX("相応しいはじまりだって",subtitle_x,subtitle_y,4697,4883)
SUBTITLE_FX("あっていいでしょう",subtitle_x,subtitle_y-subtitle_size*2,4900,4986)
SUBTITLE_FX("だれ         わたし               ",subtitle_x,subtitle_y,4996,5251,true)
SUBTITLE_FX("誰にも 私にだって",subtitle_x,subtitle_y,4996,5251)

SUBTITLE_FX("さき     い         ",subtitle_x,subtitle_y-subtitle_size*2,5933,6022,true)
SUBTITLE_FX("先に行って",subtitle_x,subtitle_y-subtitle_size*2,5933,6022)
SUBTITLE_FX(" お                         ",subtitle_x,subtitle_y,6030,6120,true)
SUBTITLE_FX("置いてかないで",subtitle_x,subtitle_y,6030,6120)
SUBTITLE_FX("                 い         ",subtitle_x,subtitle_y-subtitle_size*2,6125,6225,true)
SUBTITLE_FX("どちらも言えず",subtitle_x,subtitle_y-subtitle_size*2,6125,6225)
SUBTITLE_FX("わら          おこ        ",subtitle_x,subtitle_y,6314,6407,true)
SUBTITLE_FX("笑って 怒って",subtitle_x,subtitle_y,6314,6407)
SUBTITLE_FX("           かんじょう       なが                  おな    ",subtitle_x,subtitle_y-subtitle_size*2,6410,6625,true)
SUBTITLE_FX("どんな感情でも流れるのは 同じ",subtitle_x,subtitle_y-subtitle_size*2,6410,6625)
SUBTITLE_FX(" なみだ       ",subtitle_x,subtitle_y,6618,6661,true)
SUBTITLE_FX(" 涙だけ",subtitle_x,subtitle_y,6618,6661)

SUBTITLE_FX("つた                                                          ",subtitle_x,subtitle_y-subtitle_size*2,6770,6967,true)
SUBTITLE_FX("伝わるはずだった ふたりのイデア",subtitle_x,subtitle_y-subtitle_size*2,6770,6967)
SUBTITLE_FX("        ちが   いのち とど        ",subtitle_x,subtitle_y,6971,7158,true)
SUBTITLE_FX("すれ違う命 届かず",subtitle_x,subtitle_y,6971,7158)
SUBTITLE_FX(" せ なか あ             さぐ        ",subtitle_x,subtitle_y-subtitle_size*2,7172,7345,true)
SUBTITLE_FX("背中合わせに探った",subtitle_x,subtitle_y-subtitle_size*2,7172,7345)
SUBTITLE_FX("たが         て     ",subtitle_x,subtitle_y,7363,7463,true)
SUBTITLE_FX("互いの手を",subtitle_x,subtitle_y,7363,7463)
SUBTITLE_FX("つな                ",subtitle_x,subtitle_y-subtitle_size*2,7458,7546,true)
SUBTITLE_FX("繋げなくとも",subtitle_x,subtitle_y-subtitle_size*2,7458,7546)
SUBTITLE_FX("        ゆび    さき ひとしずく   あい     お         ",subtitle_x,subtitle_y,7550,7819,true)
SUBTITLE_FX("その指の先 一滴の愛が落ちる",subtitle_x,subtitle_y,7550,7819)
SUBTITLE_FX("つぎ   まぶた   ひら        つた                ",subtitle_x,subtitle_y-subtitle_size*2,7835,8176,true)
SUBTITLE_FX("次に瞼を開けば伝えられる",subtitle_x,subtitle_y-subtitle_size*2,7835,8176)
SUBTITLE_FX("だい す                 ",subtitle_x,subtitle_y,8216,8496,true)
SUBTITLE_FX("大好きよ、と",subtitle_x,subtitle_y,8216,8496)



#thumbnail

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
