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

Import("spy_x_family-season_01-tv-common.avsi")

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

function SCALE_CG(clip cg,float center_x,float center_y,float scale_start,float scale_end){
	cg_frame_count=Framecount(cg)

	return ScriptClip(cg,"FAST_ZOOM(srcx="+String(center_x)+",srcy="+String(center_y)+",dstx="+String(center_x)+",dsty="+String(center_y)+",factor=Spline(current_frame,0,"+String(scale_start)+","+String(cg_frame_count)+","+String(scale_end)+"))")
}

function MOVE_CG(clip cg,int dir_x,int dir_y,float move_offset,float scale){
	cg_frame_count=Framecount(cg)
	cg_width_half=Width(cg)/2
	cg_height_half=Height(cg)/2
	move_offset_half=move_offset*0.5

	return ScriptClip(cg,"FAST_ZOOM(dstx=Spline(current_frame,0,"+String(cg_width_half)+"-("+String(move_offset_half)+"*("+String(dir_x)+")),"+String(cg_frame_count)+","+String(cg_width_half)+"+("+String(move_offset_half)+"*("+String(dir_x)+")),cubic=false)," \
		+"dsty=Spline(current_frame,0,"+String(cg_height_half)+"-("+String(move_offset_half)+"*("+String(dir_y)+")),"+String(cg_frame_count)+","+String(cg_height_half)+"+("+String(move_offset_half)+"*("+String(dir_y)+")),cubic=false),factor="+String(scale)+",extend=true)")
}

######## Pre Combine ########

fade_length=18

function WALKING_CURVE_Y(int n){
	frame_num=Floor(n/2.04)%8
	return frame_num==0?40: \
		frame_num==1?20: \
		frame_num==2?10: \
		frame_num==3?5: \
		frame_num==4?0: \
		frame_num==5?5: \
		frame_num==6?10: \
		frame_num==7?20:0
}

function WALKING_CURVE_X(int n){
	frame_num=Floor(n/2.04)%8
	return frame_num==0?0: \
		frame_num==1?-2: \
		frame_num==2?-4: \
		frame_num==3?-2: \
		frame_num==4?0: \
		frame_num==5?2: \
		frame_num==6?4: \
		frame_num==7?2:0
}

spy_x_family_season_01_tv_clean_ed_width=Width(spy_x_family_season_01_tv_clean_ed)

anya_stand_src=Trim(spy_x_family_season_01_tv_clean_ed_01,29,43)
anya_stand=Crop(anya_stand_src,spy_x_family_season_01_tv_clean_ed_width*3/8,0,-spy_x_family_season_01_tv_clean_ed_width*3/8,0)
anya_stand_rgba=ColorKeyMask(ConvertToRGB32(anya_stand,matrix="Rec709"),$000000,16)
anya_stand_rgba=AddBorders(anya_stand_rgba,spy_x_family_season_01_tv_clean_ed_width*3/8,0,spy_x_family_season_01_tv_clean_ed_width*3/8,0)
anya_stand_loop=Loop(anya_stand_rgba,1000)
anya_walking_simulation=ScriptClip(anya_stand_loop,"FAST_ZOOM(srcx=0,srcy=0,dstx=WALKING_CURVE_X(current_frame)-Width()*3/8,dsty=Height()/2+WALKING_CURVE_Y(current_frame))")

star_left=Crop(anya_stand_src,0,0,spy_x_family_season_01_tv_clean_ed_width*3/8,0)
star_right=Crop(anya_stand_src,spy_x_family_season_01_tv_clean_ed_width*5/8,0,0,0)
star_middle=BlankClip(anya_stand,color=$020202)
star=StackHorizontal(star_left,star_middle,star_right)
star=FlipHorizontal(star)
star_loop=Loop(star,1000)

#anya_walking_01=Trim(spy_x_family_season_01_tv_clean_ed_01,78,109)
#anya_walking_02=Trim(spy_x_family_season_01_tv_clean_ed_01,110,141)
#anya_walking_fixed_01=ConvertToRGB32(ScriptClip(anya_walking_01,"FAST_ZOOM(srcx=0,dstx=Spline(current_frame,0,0,Framecount(),150,cubic=false))"),matrix="Rec709")
#anya_walking_fixed_02=ConvertToRGB32(ScriptClip(anya_walking_02,"FAST_ZOOM(srcx=0,dstx=Spline(current_frame,0,150,Framecount(),150+144,cubic=false))"),matrix="Rec709")

######## Combine ########

# spy_x_family_season_01_tv_clean_ed_01 -2
# spy_x_family_season_01_tv_clean_ed_02 
# spy_x_family_season_01_tv_clean_ed_03 615
# spy_x_family_season_01_tv_clean_ed_04 885/2189
# spy_x_family_season_01_tv_clean_ed_05 1150/2454
# spy_x_family_season_01_tv_clean_ed_06 1396/4208/4731

# spy_x_family_season_01_tv_clean_ed_sp_02 2186
# spy_x_family_season_01_tv_clean_ed_sp_04 2711
# spy_x_family_season_01_tv_clean_ed_sp_03 3005



op_music_start=2

spy_x_family_season_01_tv_clean_ed_01_00=Trim(spy_x_family_season_01_tv_clean_ed_01,0,-op_music_start)
spy_x_family_season_01_tv_clean_ed_01_01=Trim(spy_x_family_season_01_tv_clean_ed_01,op_music_start,0)



spy_x_family_season_01_tv_ed_t01=spy_x_family_season_01_tv_clean_ed_01_01+spy_x_family_season_01_tv_clean_ed_02+spy_x_family_season_01_tv_clean_ed_03+spy_x_family_season_01_tv_clean_ed_04+spy_x_family_season_01_tv_clean_ed_05
spy_x_family_season_01_tv_ed_t02=FADE_IN_WITH_BRIGHTNESS_OFFSET(TRIM_MIDDLE_CLIP(spy_x_family_season_01_tv_01_anya_and_loid_take_tram,136),fade_length)+TRIM_FIRST_CLIP(spy_x_family_season_01_tv_04_anya_cry_02,65)+TRIM_FIRST_CLIP(spy_x_family_season_01_tv_07_anya_cry_02,82) \
	+TRIM_FIRST_CLIP(spy_x_family_season_01_tv_02_loid_give_yor_ring_02,115)+TRIM_LAST_CLIP(spy_x_family_season_01_tv_01_loid_hold_anya_high_01,65)+TRIM_FIRST_CLIP(spy_x_family_season_01_tv_04_loid_yor_anya_happy,98) \
spy_x_family_season_01_tv_ed_t03=TRIM_FIRST_CLIP(spy_x_family_season_01_tv_03_anya_odekeke,114)+FADE_OUT_WITH_BRIGHTNESS_OFFSET(TRIM_MIDDLE_CLIP(spy_x_family_season_01_tv_07_eden_acadeny_bus,115),fade_length)

spy_x_family_season_01_tv_ed_t04=FADE_OUT_WITH_BRIGHTNESS_OFFSET(spy_x_family_season_01_tv_clean_ed_sp_02,fade_length)
spy_x_family_season_01_tv_ed_t05=FADE_OUT_WITH_BRIGHTNESS_OFFSET(FADE_IN_WITH_BRIGHTNESS_OFFSET(TRIM_FIRST_CLIP(spy_x_family_season_01_tv_12_yor_and_anya_happy,72),fade_length),fade_length)+spy_x_family_season_01_tv_clean_ed_sp_04
spy_x_family_season_01_tv_ed_t06=spy_x_family_season_01_tv_clean_ed_sp_03

spy_x_family_season_01_tv_ed_t04_t05_t06_anya_walking=CONVERT_BACK_TO_YV12(Layer(ConvertToRGB32(spy_x_family_season_01_tv_ed_t04+spy_x_family_season_01_tv_ed_t05+spy_x_family_season_01_tv_ed_t06,matrix="Rec709"),anya_walking_simulation),matrix="Rec709")

spy_x_family_season_01_tv_ed_t04_t05_framecount=Framecount(spy_x_family_season_01_tv_ed_t04+spy_x_family_season_01_tv_ed_t05)
spy_x_family_season_01_tv_ed_t04_t05_anya_walking=TRIM_FIRST_CLIP(spy_x_family_season_01_tv_ed_t04_t05_t06_anya_walking,spy_x_family_season_01_tv_ed_t04_t05_framecount)
spy_x_family_season_01_tv_ed_t04_t05_anya_walking=FADE_OUT_WITH_BRIGHTNESS_OFFSET(FADE_IN_WITH_BRIGHTNESS_OFFSET(spy_x_family_season_01_tv_ed_t04_t05_anya_walking,fade_length),fade_length)

spy_x_family_season_01_tv_ed_t06_anya_walking=Trim(spy_x_family_season_01_tv_ed_t04_t05_t06_anya_walking,spy_x_family_season_01_tv_ed_t04_t05_framecount,0)
spy_x_family_season_01_tv_ed_t06_anya_walking=Overlay(spy_x_family_season_01_tv_ed_t06_anya_walking,star_loop,mode="Add")
spy_x_family_season_01_tv_ed_t06_anya_walking=FADE_OUT_WITH_BRIGHTNESS_OFFSET(FADE_IN_WITH_BRIGHTNESS_OFFSET(spy_x_family_season_01_tv_ed_t06_anya_walking,fade_length),fade_length)

spy_x_family_season_01_tv_ed_t07=FADE_OUT_WITH_BRIGHTNESS_OFFSET(TRIM_FIRST_CLIP(spy_x_family_season_01_tv_11_damian_see_anya_bring_dog,146),fade_length)

spy_x_family_season_01_tv_ed_t08=FADE_IN_WITH_BRIGHTNESS_OFFSET(TRIM_FIRST_CLIP(spy_x_family_season_01_tv_06_eden_academy,155),fade_length)+TRIM_MIDDLE_CLIP(spy_x_family_season_01_tv_08_yuri_is_secret_police_02,132) \
	+TRIM_FIRST_CLIP(spy_x_family_season_01_tv_12_loid_yor_anya_darkside,121)+FADE_OUT_WITH_BRIGHTNESS_OFFSET(TRIM_MIDDLE_CLIP(spy_x_family_season_01_tv_03_anya_say_people_look_like_bits_of_trash,108),fade_length)+TRIM_FIRST_CLIP(spy_x_family_season_01_tv_06_anya_wear_suit_03,18)

spy_x_family_season_01_tv_ed_t09=TRIM_FIRST_CLIP(spy_x_family_season_01_tv_10_yor_and_anya_jogging,136)+TRIM_LAST_CLIP(spy_x_family_season_01_tv_02_yor_waiting_in_street,65)+TRIM_FIRST_CLIP(spy_x_family_season_01_tv_05_loid_hug_anya,82) \
	+TRIM_MIDDLE_CLIP(spy_x_family_season_01_tv_09_yor_and_loid_walking_under_sunset,115)+FADE_OUT_WITH_BRIGHTNESS_OFFSET(TRIM_FIRST_CLIP(spy_x_family_season_01_tv_05_anya_and_loid_see_fireworks,125),fade_length)
spy_x_family_season_01_tv_ed_t10=spy_x_family_season_01_tv_clean_ed_06+BlankClip(spy_x_family_season_01_tv_clean_ed,length=24*3,color=color_black)



spy_x_family_season_01_tv_ed_mute=spy_x_family_season_01_tv_ed_t01+spy_x_family_season_01_tv_ed_t02+spy_x_family_season_01_tv_ed_t03 \
	+spy_x_family_season_01_tv_ed_t04_t05_anya_walking+spy_x_family_season_01_tv_ed_t06_anya_walking+spy_x_family_season_01_tv_ed_t07 \
	+spy_x_family_season_01_tv_ed_t08+spy_x_family_season_01_tv_ed_t09+spy_x_family_season_01_tv_ed_t10

spy_x_family_season_01_tv_ed_mute

### export clip: spy_x_family_season_01_tv_ed_mute,spy_x_family_season_01_tv_clean_ed_01_00

### prefetch: 5,2

### ###

######## Subtitle ########

### inherit start ###

#global subtitle_heavy_halo_width=1
global subtitle_clip_width=1920
global subtitle_clip_height=1080

subtitle_x=50*2.25
subtitle_y=395*2.25
global subtitle_front_fade_count=12
global subtitle_rear_fade_count=12
global subtitle_font="MS Gothic"
global subtitle_effects="b"
global subtitle_size=32*2.25
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
	y=is_furigana?y-size:y

	return SUBTITLE_FX_FADE_IN_FADE_OUT_DOUBLE_HALO(clip,text,Round(x),Round(y),start_frame,end_frame,subtitle_front_fade_count,subtitle_rear_fade_count,subtitle_font,subtitle_effects,Round(size),text_color,halo_color,outside_halo_color,subtitle_mode)
}

### inherit end ###

ConvertToRGB32(matrix="Rec709")

SUBTITLE_FX("喜劇//星野源|- by fielia@AVISynth",-subtitle_x,subtitle_x,5292,5489,is_title=true)

SUBTITLE_FX(" あらそ    あ           こわ",subtitle_x,subtitle_y-subtitle_size*2,52,124,true)
SUBTITLE_FX(" 争い合って 壊れかかった",subtitle_x,subtitle_y-subtitle_size*2,52,124)
SUBTITLE_FX("            ちゃ め     ほし",subtitle_x,subtitle_y,120,200,true)
SUBTITLE_FX("このお茶目な星で",subtitle_x,subtitle_y,120,200)
SUBTITLE_FX(" う          お          ひ                   もの",subtitle_x,subtitle_y-subtitle_size*2,201,337,true)
SUBTITLE_FX("生まれ落ちた日から よそ者",subtitle_x,subtitle_y-subtitle_size*2,201,337)
SUBTITLE_FX(" なみだか      は",subtitle_x,subtitle_y,331,420,true)
SUBTITLE_FX(" 涙枯れ果てた",subtitle_x,subtitle_y,331,420)
SUBTITLE_FX("かえ             ば しょ    ゆめ    なか",subtitle_x,subtitle_y-subtitle_size*2,430,582,true)
SUBTITLE_FX("帰りゆく場所は夢の中",subtitle_x,subtitle_y-subtitle_size*2,430,582)

SUBTITLE_FX("こぼ     お           さき     で  あ",subtitle_x,subtitle_y,578,649,true)
SUBTITLE_FX("零れ落ちた 先で出会った",subtitle_x,subtitle_y,578,649)
SUBTITLE_FX("         ひ みつ    かか",subtitle_x,subtitle_y-subtitle_size*2,651,723,true)
SUBTITLE_FX("ただ秘密を抱え",subtitle_x,subtitle_y-subtitle_size*2,651,723)
SUBTITLE_FX(" ふ つう",subtitle_x,subtitle_y,724,858,true)
SUBTITLE_FX("普通のふりをした あなたと",subtitle_x,subtitle_y,724,858)
SUBTITLE_FX("さが   あきら",subtitle_x,subtitle_y-subtitle_size*2,853,943,true)
SUBTITLE_FX("探し諦めた",subtitle_x,subtitle_y-subtitle_size*2,853,943)
SUBTITLE_FX(" わたし    い  ば しょ    つく",subtitle_x,subtitle_y,951,1133,true)
SUBTITLE_FX(" 私の居場所は作るものだった",subtitle_x,subtitle_y,951,1133)

SUBTITLE_FX("         ひ  か",subtitle_x,subtitle_y-subtitle_size*2,1149,1197,true)
SUBTITLE_FX("あの日交わした",subtitle_x,subtitle_y-subtitle_size*2,1149,1197)
SUBTITLE_FX(" ち     まさ",subtitle_x,subtitle_y,1213,1265,true)
SUBTITLE_FX("血に勝るもの",subtitle_x,subtitle_y,1213,1265)
SUBTITLE_FX(" こころ           けいやく",subtitle_x,subtitle_y-subtitle_size*2,1273,1388,true)
SUBTITLE_FX(" 心たちの契約を",subtitle_x,subtitle_y-subtitle_size*2,1273,1388)

SUBTITLE_FX(" て     つな    かえ               きょう     なに た",subtitle_x,subtitle_y,1395,1524,true)
SUBTITLE_FX("手を繋ぎ帰ろうか 今日は何食べようか",subtitle_x,subtitle_y,1395,1524)
SUBTITLE_FX("                                                      きみ    はな",subtitle_x,subtitle_y-subtitle_size*2,1526,1685,true)
SUBTITLE_FX("「こんなことがあった」って 君と話したかったんだ",subtitle_x,subtitle_y-subtitle_size*2,1526,1685)
SUBTITLE_FX("             ひ       きみ             き げき",subtitle_x,subtitle_y,1679,1785,true)
SUBTITLE_FX("いつの日も 君となら喜劇よ",subtitle_x,subtitle_y,1679,1785)
SUBTITLE_FX("おど    きし                      わら    ころ",subtitle_x,subtitle_y-subtitle_size*2,1787,1955,true)
SUBTITLE_FX("踊る軋むベッドで 笑い転げたままで",subtitle_x,subtitle_y-subtitle_size*2,1787,1955)
SUBTITLE_FX("                せいかつ",subtitle_x,subtitle_y,1950,2106,true)
SUBTITLE_FX("ふざけた生活はつづくさ",subtitle_x,subtitle_y,1950,2106)

### pass clip: spy_x_family_season_01_tv_ed_mute,spy_x_family_season_01_tv_clean_ed_01_00

### prefetch: 5,2

### ###

SUBTITLE_FX("おと                   い         そだ",subtitle_x,subtitle_y-subtitle_size*2,2178,2250,true)
SUBTITLE_FX("劣ってると 言われ育った",subtitle_x,subtitle_y-subtitle_size*2,2178,2250)
SUBTITLE_FX("                        ほし",subtitle_x,subtitle_y,2246,2327,true)
SUBTITLE_FX("このいかれた星で",subtitle_x,subtitle_y,2246,2327)
SUBTITLE_FX(" ふ つう                           き",subtitle_x,subtitle_y-subtitle_size*2,2327,2461,true)
SUBTITLE_FX("普通のふりをして 気づいた",subtitle_x,subtitle_y-subtitle_size*2,2327,2461)
SUBTITLE_FX("だれ     き",subtitle_x,subtitle_y,2457,2545,true)
SUBTITLE_FX("誰が決めつけた",subtitle_x,subtitle_y,2457,2545)
SUBTITLE_FX(" わたし  ひかり             ここ",subtitle_x,subtitle_y-subtitle_size*2,2555,2731,true)
SUBTITLE_FX(" 私の光はただ此処にあった",subtitle_x,subtitle_y-subtitle_size*2,2555,2731)

SUBTITLE_FX("         ひ",subtitle_x,subtitle_y,2752,2800,true)
SUBTITLE_FX("あの日ほどけた",subtitle_x,subtitle_y,2752,2800)
SUBTITLE_FX("あわ    のろ",subtitle_x,subtitle_y-subtitle_size*2,2817,2867,true)
SUBTITLE_FX("淡い呪いに",subtitle_x,subtitle_y-subtitle_size*2,2817,2867)
SUBTITLE_FX(" こころ",subtitle_x,subtitle_y,2875,2990,true)
SUBTITLE_FX(" 心からのさよならを",subtitle_x,subtitle_y,2875,2990)

SUBTITLE_FX("かお あ         かえ               さ     ほこ    はなばな",subtitle_x,subtitle_y-subtitle_size*2,2996,3125,true)
SUBTITLE_FX("顔上げて帰ろうか 咲き誇る花々",subtitle_x,subtitle_y-subtitle_size*2,2996,3125)
SUBTITLE_FX("                 き れい                          きみ    はな",subtitle_x,subtitle_y,3128,3286,true)
SUBTITLE_FX("「こんな綺麗なんだ」って 君と話したかったんだ",subtitle_x,subtitle_y,3128,3286)
SUBTITLE_FX("             ひ       きみ             き せき",subtitle_x,subtitle_y-subtitle_size*2,3280,3386,true)
SUBTITLE_FX("どんな日も 君といる奇跡を",subtitle_x,subtitle_y-subtitle_size*2,3280,3386)
SUBTITLE_FX(" いのちつな                         つた",subtitle_x,subtitle_y,3389,3557,true)
SUBTITLE_FX(" 命繋ぐキッチンで 伝えきれないままで",subtitle_x,subtitle_y,3389,3557)
SUBTITLE_FX("                せいかつ",subtitle_x,subtitle_y-subtitle_size*2,3552,3675,true)
SUBTITLE_FX("ふざけた生活はつづく",subtitle_x,subtitle_y-subtitle_size*2,3552,3675)

### pass clip: spy_x_family_season_01_tv_ed_mute,spy_x_family_season_01_tv_clean_ed_01_00

### prefetch: 5,2

### ###

SUBTITLE_FX(" し ごと あ           あゆ    とも",subtitle_x,subtitle_y,3693,3817,true)
SUBTITLE_FX("仕事明けに 歩む共に",subtitle_x,subtitle_y,3693,3817)
SUBTITLE_FX("あさ ひ     のぼ",subtitle_x,subtitle_y-subtitle_size*2,3825,3935,true)
SUBTITLE_FX("朝陽が登るわ ああ",subtitle_x,subtitle_y-subtitle_size*2,3825,3935)
SUBTITLE_FX("                               た",subtitle_x,subtitle_y,3956,4074,true)
SUBTITLE_FX("ありがとうでは 足りないから",subtitle_x,subtitle_y,3956,4074)
SUBTITLE_FX(" て     つな",subtitle_x,subtitle_y-subtitle_size*2,4076,4190,true)
SUBTITLE_FX("手を繋ぎ",subtitle_x,subtitle_y-subtitle_size*2,4076,4190)

SUBTITLE_FX("                    かえ               きょう     なに た",subtitle_x,subtitle_y,4203,4336,true)
SUBTITLE_FX("さあうちに帰ろうか 今日は何食べようか",subtitle_x,subtitle_y,4203,4336)
SUBTITLE_FX("                                                      きみ    はな",subtitle_x,subtitle_y-subtitle_size*2,4338,4497,true)
SUBTITLE_FX("「こんなことがあった」って 君と話したかったんだ",subtitle_x,subtitle_y-subtitle_size*2,4338,4497)
SUBTITLE_FX("             ひ       きみ             き げき",subtitle_x,subtitle_y,4491,4598,true)
SUBTITLE_FX("いつの日も 君となら喜劇よ",subtitle_x,subtitle_y,4491,4598)
SUBTITLE_FX("おど    きし                      わら    ころ",subtitle_x,subtitle_y-subtitle_size*2,4598,4785,true)
SUBTITLE_FX("踊る軋むベッドで 笑い転げたままで",subtitle_x,subtitle_y-subtitle_size*2,4598,4785)

SUBTITLE_FX("えいえん    さが                                   く",subtitle_x,subtitle_y,4728,4859,true)
SUBTITLE_FX("永遠を探そうか できるだけ暮らそうか",subtitle_x,subtitle_y,4728,4859)
SUBTITLE_FX("                                              きみ    はな",subtitle_x,subtitle_y-subtitle_size*2,4861,5020,true)
SUBTITLE_FX("どんなことがあったって 君と話したかったんだ",subtitle_x,subtitle_y-subtitle_size*2,4861,5020)
SUBTITLE_FX("                      きみ             き げき",subtitle_x,subtitle_y,5014,5120,true)
SUBTITLE_FX("いつまでも 君となら喜劇よ",subtitle_x,subtitle_y,5014,5120)
SUBTITLE_FX(" わ          あ          ひ  び       わら    ころ        さき",subtitle_x,subtitle_y-subtitle_size*2,5121,5289,true)
SUBTITLE_FX("分かち合えた日々に 笑い転げた先に",subtitle_x,subtitle_y-subtitle_size*2,5121,5289)
SUBTITLE_FX("                せいかつ",subtitle_x,subtitle_y,5284,5450,true)
SUBTITLE_FX("ふざけた生活はつづくさ",subtitle_x,subtitle_y,5284,5450)

######## Thumbnail ########

is_thumbnail=false

is_thumbnail?ConvertToRGB32(spy_x_family_season_01_tv_ed_mute,matrix="Rec709"):last

######## Music ########

bgm_48khz=SSRC(WAVSource("src\01. 喜劇.wav"),48000)
AudioDub(bgm_48khz)



thumbnail=Trim(4912,-24*5)



AUDIO_DUB_TONE(ConvertToRGB32(spy_x_family_season_01_tv_clean_ed_01_00,matrix="Rec709"),samplerate=48000,channels=2,type="Silence")++last



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
