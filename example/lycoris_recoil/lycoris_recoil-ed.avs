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

Import("lycoris_recoil-common.avsi")

######## Function ########

### inherit start ###

LoadPlugin("..\plugins\MaskTools.dll")

function DRAPE_CURVE(float n,float x1,float y1,float x2,float y2){
	t=Float(n-x1)/Float(x2-x1)
	return Pow(t,2.0)*Float(y2-y1)+Float(y1)
}

function GENERATE_DRAPE_ANIM(clip ref_clip,int length,float left,float top,float w,float h){
	length_2=length*2
	clip_width=Width(ref_clip)
	clip_height=Height(ref_clip)
	drape=ResetMask(BlankClip(ref_clip,length=length_2,pixel_type="RGB32",color=color_gray))
	drape_anim=Zoom(drape,srcx="0.0",srcy="0.0",dstx="CLAMP(DRAPE_CURVE(n,"+String(length_2)+","+String(left+w)+","+String(length)+","+String(left)+"),"+String(left)+","+String(left+w)+")",dsty=String(top),factorX="(CLAMP(DRAPE_CURVE(n,0,0,"+String(length)+","+String(w)+"),0,"+String(w)+")+CLAMP(DRAPE_CURVE(n,"+String(length_2)+","+String(-w)+","+String(length)+",0),"+String(-w)+",0))/"+String(Float(clip_width)),factorY=String(h/Float(clip_height)))
	return drape_anim
}

function SUBTITLE_FX_DRAPE_IN_DRAPE_OUT_DOUBLE_HALO(clip clip,string text,int x,int y,int start_frame,int end_frame,int front_fade_count,int rear_fade_count,string "font",string "effects",int "size",int "text_color",int "halo_color",int "outside_halo_color",string "subtitle_mode"){
	before_start_frame=start_frame-front_fade_count
	after_end_frame=end_frame+rear_fade_count

	Assert(IsRGB32(clip),"SUBTITLE_FX_DRAPE_IN_DRAPE_OUT_DOUBLE_HALO(): clip only support RGB32 format")

	subtitle_rgb=_SUBTITLE_FX_PRE_OPAQUE(clip,outside_halo_color,text,x,y,before_start_frame,after_end_frame,font,effects,size,text_color,halo_color,subtitle_mode)
	subtitle_rgba=ColorKeyMask(ResetMask(subtitle_rgb),outside_halo_color,0)

	subtitle_alpha=CONVERT_BACK_TO_YV12(ShowAlpha(subtitle_rgba),matrix="Rec709")
	subtitle_alpha=Expand(Expand(Expand(subtitle_alpha)))
	subtitle_alpha=ConvertToRGB32(Greyscale(subtitle_alpha),matrix="Rec709")

	subtitle_rgba=Mask(subtitle_rgba,subtitle_alpha)

	subtitle_rgba_faded_containing_parameter=ScriptClip(subtitle_rgba,"RGBAdjust(a=alpha_factor)")
	subtitle_rgba_faded=FrameEvaluate(subtitle_rgba_faded_containing_parameter,"alpha_factor=Spline(current_frame,"+String(start_frame-1)+",0.0,"+String(start_frame)+",1.0,"+String(end_frame)+",1.0,"+String(end_frame+1)+",0.0,cubic=false)")

	subtitle_clip_width=Width(subtitle_rgba_faded)
	drape_front=GENERATE_DRAPE_ANIM(subtitle_rgba_faded,front_fade_count,Abs(x),y,subtitle_clip_width-(Abs(x)*2),size*1.3)
	drape_rear=GENERATE_DRAPE_ANIM(subtitle_rgba_faded,rear_fade_count,Abs(x),y,subtitle_clip_width-(Abs(x)*2),size*1.3)
	drape=BlankClip(drape_front,length=before_start_frame,pixel_type="RGB32",color=color_gray) \
		+drape_front \
		+BlankClip(drape_front,length=(end_frame-rear_fade_count)-(start_frame+front_fade_count),pixel_type="RGB32",color=color_gray) \
		+drape_rear \
		+BlankClip(drape_rear,length=Framecount(subtitle_rgba_faded)-after_end_frame,pixel_type="RGB32",color=color_gray)

	subtitle_rgba_faded=Layer(subtitle_rgba_faded,drape)

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

function PSEUDO_COLOR_GRAY(clip clip){
	return ColorYUV(Blur(Blur(clip,1.58),1.58),gain_y=64.0,off_y=-64.0,off_u=16.0,cont_u=-256.0,off_v=-64.0,cont_v=-256.0)
	return ColorYUV(clip,gain_y=192.0,off_y=-32.0,off_u=12.0,cont_u=240.0,off_v=2.0,cont_v=-240.0)
}

######## Pre Combine ########

fade_length=4

lycoris_recoil_04_chisato_and_takina_in_aquarium_color=TRIM_FIRST_CLIP(lycoris_recoil_04_chisato_and_takina_in_aquarium,147+fade_length)
lycoris_recoil_04_chisato_and_takina_in_aquarium_gray=PSEUDO_COLOR_GRAY(Trim(lycoris_recoil_04_chisato_and_takina_in_aquarium,147-fade_length,0))
lycoris_recoil_04_chisato_and_takina_in_aquarium_color_to_gray=Dissolve(lycoris_recoil_04_chisato_and_takina_in_aquarium_color,lycoris_recoil_04_chisato_and_takina_in_aquarium_gray,fade_length*2)

######## Combine ########

# lycoris_recoil_clean_ed_01    325
# lycoris_recoil_clean_ed_02    ?
# lycoris_recoil_clean_ed_03    1709/5601
# lycoris_recoil_clean_ed_04    6184

# lycoris_recoil_final_ed_01    2254
# lycoris_recoil_final_ed_02    3338
# lycoris_recoil_final_ed_03    3608



lycoris_recoil_ed_t01=BlankClip(lycoris_recoil_13_chisato_hug_takina_on_beach,length=1,color=color_black)+TRIM_LAST_CLIP(lycoris_recoil_13_chisato_hug_takina_on_beach,324)

lycoris_recoil_ed_t02=lycoris_recoil_clean_ed_01+lycoris_recoil_clean_ed_02_sum_up \
	+FADE_IN_WITH_BRIGHTNESS_OFFSET(TRIM_LAST_CLIP(lycoris_recoil_04_takina_sakana_and_chisato_chinanago,31),fade_length*3)+TRIM_FIRST_CLIP(lycoris_recoil_05_takina_touch_chisato_s_breast,43)+TRIM_FIRST_CLIP(lycoris_recoil_06_chisato_see_takina_yoshi,43)+TRIM_FIRST_CLIP(lycoris_recoil_07_chisato_hug_takina,26) \
	+FADE_OUT_WITH_BRIGHTNESS_OFFSET(TRIM_FIRST_CLIP(lycoris_recoil_08_takina_see_chisato_handstand,78+17+50),fade_length*2)

lycoris_recoil_ed_t03=TRIM_LAST_CLIP(lycoris_recoil_05_ship_and_bird,68)+TRIM_FIRST_CLIP(lycoris_recoil_10_majima_announce,69)+TRIM_FIRST_CLIP(lycoris_recoil_03_lycoris_01,66)+FADE_OUT_WITH_BRIGHTNESS_OFFSET(TRIM_FIRST_CLIP(lycoris_recoil_03_lycoris_02,54),fade_length*2)

lycoris_recoil_ed_t04=TRIM_LAST_CLIP(lycoris_recoil_final_ed_01,1084)+lycoris_recoil_final_ed_02_sum_up+Dissolve(TRIM_FIRST_CLIP(lycoris_recoil_final_ed_03,420+fade_length),TRIM_LAST_CLIP(lycoris_recoil_10_enkuboku_analysis,fade_length+136),fade_length*2)

lycoris_recoil_ed_t05=FADE_OUT_WITH_BRIGHTNESS_OFFSET(FADE_IN_WITH_BRIGHTNESS_OFFSET(PSEUDO_COLOR_GRAY(TRIM_LAST_CLIP(lycoris_recoil_06_kurumi_lie_down_and_shake,135)+TRIM_FIRST_CLIP(lycoris_recoil_08_chisato_and_takina,136)+TRIM_FIRST_CLIP(lycoris_recoil_11_mizuki_and_kurumi_separate_in_lounge,135)+TRIM_FIRST_CLIP(lycoris_recoil_07_chisato_pat_mika,136)),fade_length*2),fade_length*2) \
	+FADE_OUT_WITH_BRIGHTNESS_OFFSET(TRIM_FIRST_CLIP(lycoris_recoil_13_chisato_tied_by_rope,67),fade_length*2)+TRIM_FIRST_CLIP(lycoris_recoil_02_chisato_jump_up,26)
lycoris_recoil_ed_t06=TRIM_LAST_CLIP(lycoris_recoil_05_ship_on_river_near_radio_tower,135)+TRIM_FIRST_CLIP(lycoris_recoil_02_walnut_show_explosion_to_robota,144)+TRIM_FIRST_CLIP(lycoris_recoil_01_chisato_shoot_terrorist,136)+FADE_OUT_WITH_BRIGHTNESS_OFFSET(TRIM_FIRST_CLIP(lycoris_recoil_09_artificial_heart,126),fade_length)
lycoris_recoil_ed_t07=FADE_OUT_WITH_BRIGHTNESS_OFFSET(FADE_IN_WITH_BRIGHTNESS_OFFSET(PSEUDO_COLOR_GRAY(TRIM_FIRST_CLIP(lycoris_recoil_12_chisato_catch_angered_takina,76)+TRIM_FIRST_CLIP(lycoris_recoil_12_chisato_kill_shinji,59)+TRIM_LAST_CLIP(lycoris_recoil_04_takina_laugh,126)),fade_length),fade_length) \
	+lycoris_recoil_clean_ed_03+FADE_IN_WITH_BRIGHTNESS_OFFSET(TRIM_FIRST_CLIP(lycoris_recoil_04_chisato_and_takina_in_aquarium_color_to_gray,147+126),fade_length*2) \
	+FADE_OUT_WITH_BRIGHTNESS_OFFSET(PSEUDO_COLOR_GRAY(TRIM_LAST_CLIP(lycoris_recoil_09_takina_turn_back_in_snow+lycoris_recoil_09_chisato_turn_back_in_snow,93)+TRIM_FIRST_CLIP(lycoris_recoil_09_takina_and_chisato_separate_in_snow,74)),fade_length*2)

lycoris_recoil_ed_t08=lycoris_recoil_clean_ed_04+BlankClip(lycoris_recoil_clean_ed,length=24*6,color=color_black)



lycoris_recoil_ed_mute=lycoris_recoil_ed_t01+lycoris_recoil_ed_t02+lycoris_recoil_ed_t03+lycoris_recoil_ed_t04+lycoris_recoil_ed_t05+lycoris_recoil_ed_t06+lycoris_recoil_ed_t07+lycoris_recoil_ed_t08

lycoris_recoil_ed_mute

### export clip: lycoris_recoil_ed_mute

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
global subtitle_outside_halo_color=color_crimson

function SUBTITLE_FX(clip clip,string text,float x,float y,int start_frame,int end_frame,bool "is_furigana",bool "is_title"){
	is_title=Default(is_title,false)
	is_furigana=Default(is_furigana,false)

	outside_halo_color=is_title?color_darkcyan:subtitle_outside_halo_color
	effects=subtitle_effects+(is_title?"":"")

	subtitle_mode=is_furigana?"ex":"ex" #"ex_thick_reduce_memory"
	size=is_furigana?subtitle_size*0.5:subtitle_size
	y=is_furigana?y-size:y

	return SUBTITLE_FX_DRAPE_IN_DRAPE_OUT_DOUBLE_HALO(clip,text,Round(x),Round(y),start_frame,end_frame,subtitle_front_fade_count,subtitle_rear_fade_count,subtitle_font,effects,Round(size),subtitle_text_color,subtitle_halo_color,outside_halo_color,subtitle_mode)
}

### inherit end ###

ConvertToRGB32(matrix="Rec709")

SUBTITLE_FX("花の塔//さユり - by fielia@AVISynth",-subtitle_x,subtitle_x,6229,6428,is_title=true)

SUBTITLE_FX("きみ     も                 まん が",subtitle_x,subtitle_y-subtitle_size*2,320,390,true)
SUBTITLE_FX("君が持ってきた漫画",subtitle_x,subtitle_y-subtitle_size*2,320,390)
SUBTITLE_FX("             し              な まえ        はな",subtitle_x,subtitle_y,387,464,true)
SUBTITLE_FX("くれた知らない名前のお花",subtitle_x,subtitle_y,387,464)
SUBTITLE_FX(" きょう              こ",subtitle_x,subtitle_y-subtitle_size*2,468,530,true)
SUBTITLE_FX("今日はまだ来ないかな?",subtitle_x,subtitle_y-subtitle_size*2,468,530)
SUBTITLE_FX("はじ           かんじょうし",subtitle_x,subtitle_y,526,611,true)
SUBTITLE_FX("初めての感情知ってしまった",subtitle_x,subtitle_y,526,611)

SUBTITLE_FX("まど    かざ        かい が                                      うちゅう   たび",subtitle_x,subtitle_y-subtitle_size*2,614,752,true)
SUBTITLE_FX("窓に飾った絵画をなぞってひとりで宇宙を旅して",subtitle_x,subtitle_y-subtitle_size*2,614,752)
SUBTITLE_FX("それだけでいいはずだったのに",subtitle_x,subtitle_y,749,881)

SUBTITLE_FX("きみ     て     にぎ",subtitle_x,subtitle_y-subtitle_size*2,899,1031,true)
SUBTITLE_FX("君の手を握ってしまったら",subtitle_x,subtitle_y-subtitle_size*2,899,1031)
SUBTITLE_FX(" こ どく     し                     まち",subtitle_x,subtitle_y,1035,1179,true)
SUBTITLE_FX("孤独を知らないこの街には",subtitle_x,subtitle_y,1035,1179)
SUBTITLE_FX("         に  ど     かえ",subtitle_x,subtitle_y-subtitle_size*2,1177,1436,true)
SUBTITLE_FX("もう二度と帰ってくることはできないのでしょう",subtitle_x,subtitle_y-subtitle_size*2,1177,1436)
SUBTITLE_FX("きみ     て      さ      の          ひかり   かげ     う",subtitle_x,subtitle_y,1441,1706,true)
SUBTITLE_FX("君が手を差し伸べた 光で影が生まれる",subtitle_x,subtitle_y,1441,1706)
SUBTITLE_FX("うた         き                      はなし   つづ",subtitle_x,subtitle_y-subtitle_size*2,1711,1849,true)
SUBTITLE_FX("歌って聞かせて この話の続き",subtitle_x,subtitle_y-subtitle_size*2,1711,1849)
SUBTITLE_FX(" つ          い          み                     ほし",subtitle_x,subtitle_y,1846,2067,true)
SUBTITLE_FX("連れて行って見たことない星まで",subtitle_x,subtitle_y,1846,2067)

### pass clip: lycoris_recoil_ed_mute

### prefetch: 5,2

### ###

SUBTITLE_FX("だれ     て     こえ    とど",subtitle_x,subtitle_y-subtitle_size*2,2249,2320,true)
SUBTITLE_FX("誰の手も声も届かない",subtitle_x,subtitle_y-subtitle_size*2,2249,2320)
SUBTITLE_FX("たか    そび     た         とう    うえ",subtitle_x,subtitle_y,2317,2393,true)
SUBTITLE_FX("高く聳え立った塔の上へ",subtitle_x,subtitle_y,2317,2393)
SUBTITLE_FX(" と",subtitle_x,subtitle_y-subtitle_size*2,2392,2459,true)
SUBTITLE_FX("飛ばすフウセンカズラ",subtitle_x,subtitle_y-subtitle_size*2,2392,2459)
SUBTITLE_FX("ぼく    きみ    わら         ほ",subtitle_x,subtitle_y,2456,2541,true)
SUBTITLE_FX("僕は君に笑って欲しいんだ",subtitle_x,subtitle_y,2456,2541)

SUBTITLE_FX(" み                     あな     だ せい    かい わ      す",subtitle_x,subtitle_y-subtitle_size*2,2544,2683,true)
SUBTITLE_FX("満たされない穴は惰性の会話や澄ましたポーズで",subtitle_x,subtitle_y-subtitle_size*2,2544,2683)
SUBTITLE_FX("                     う",subtitle_x,subtitle_y,2681,2791,true)
SUBTITLE_FX("これまでは埋めてきたけど",subtitle_x,subtitle_y,2681,2791)

SUBTITLE_FX("たいくつ     ひ  び      け  ち",subtitle_x,subtitle_y-subtitle_size*2,2795,2927,true)
SUBTITLE_FX("退屈な日々を蹴散らして",subtitle_x,subtitle_y-subtitle_size*2,2795,2927)
SUBTITLE_FX("きみ     ふたり            まちちゅう   およ",subtitle_x,subtitle_y,2930,3118,true)
SUBTITLE_FX("君と二人でこの街中を泳げたら",subtitle_x,subtitle_y,2930,3118)
SUBTITLE_FX("                             す てき",subtitle_x,subtitle_y-subtitle_size*2,3114,3333,true)
SUBTITLE_FX("それはどれだけ素敵なことでしょう?",subtitle_x,subtitle_y-subtitle_size*2,3114,3333)
SUBTITLE_FX(" だ                                 おお        こえ                きみ    つた",subtitle_x,subtitle_y,3336,3604,true)
SUBTITLE_FX("出したことないほど大きな声でやっと君に伝わる",subtitle_x,subtitle_y,3336,3604)
SUBTITLE_FX(" いびつ",subtitle_x,subtitle_y-subtitle_size*2,3606,3744,true)
SUBTITLE_FX(" 歪なくらいがさ きっとちょうどいいね",subtitle_x,subtitle_y-subtitle_size*2,3606,3744)
SUBTITLE_FX(" せ かい    はし    はし    むす",subtitle_x,subtitle_y,3741,3955,true)
SUBTITLE_FX("世界の端と端を結んで",subtitle_x,subtitle_y,3741,3955)

### pass clip: lycoris_recoil_ed_mute

### prefetch: 5,2

### ###

SUBTITLE_FX("まど    かざ        かい が                                      うちゅう   たび",subtitle_x,subtitle_y-subtitle_size*2,4169,4305,true)
SUBTITLE_FX("窓に飾った絵画をなぞってひとりで宇宙を旅して",subtitle_x,subtitle_y-subtitle_size*2,4169,4305)
SUBTITLE_FX("                         ふ  じ ゆう",subtitle_x,subtitle_y,4304,4432,true)
SUBTITLE_FX("それだけでも不自由ないけど",subtitle_x,subtitle_y,4304,4432)
SUBTITLE_FX("ぼく    えら",subtitle_x,subtitle_y-subtitle_size*2,4441,4503,true)
SUBTITLE_FX("僕は選んでみたいの",subtitle_x,subtitle_y-subtitle_size*2,4441,4503)
SUBTITLE_FX("たか な    こころ なぞ                そら",subtitle_x,subtitle_y,4496,4578,true)
SUBTITLE_FX("高鳴る心 謎だらけの空を",subtitle_x,subtitle_y,4496,4578)
SUBTITLE_FX("あんぜん                    いま   か      か",subtitle_x,subtitle_y-subtitle_size*2,4576,4774,true)
SUBTITLE_FX("安全なループを今 書き換えて!",subtitle_x,subtitle_y-subtitle_size*2,4576,4774)

SUBTITLE_FX("きみ     て     にぎ",subtitle_x,subtitle_y,4792,4923,true)
SUBTITLE_FX("君の手を握ってしまったら",subtitle_x,subtitle_y,4792,4923)
SUBTITLE_FX(" こ どく     し                     まち                 に  ど",subtitle_x,subtitle_y-subtitle_size*2,4928,5116,true)
SUBTITLE_FX("孤独を知らないこの街にはもう二度と",subtitle_x,subtitle_y-subtitle_size*2,4928,5116)
SUBTITLE_FX("かえ",subtitle_x,subtitle_y,5114,5329,true)
SUBTITLE_FX("帰ってくることはできないのでしょう",subtitle_x,subtitle_y,5114,5329)
SUBTITLE_FX("                    まよ               ひかり   かげ     み      ゆ",subtitle_x,subtitle_y-subtitle_size*2,5333,5601,true)
SUBTITLE_FX("いくらでも迷いながら光も影も見に行こう",subtitle_x,subtitle_y-subtitle_size*2,5333,5601)
SUBTITLE_FX("うた         き                    はなし   つづ",subtitle_x,subtitle_y,5603,5742,true)
SUBTITLE_FX("歌って聞かせてこの話の続き",subtitle_x,subtitle_y,5603,5742)
SUBTITLE_FX(" つ          い          み                     ほし",subtitle_x,subtitle_y-subtitle_size*2,5738,5957,true)
SUBTITLE_FX("連れて行って見たことない星まで",subtitle_x,subtitle_y-subtitle_size*2,5738,5957)
SUBTITLE_FX(" せ かい    はし    はし    むす",subtitle_x,subtitle_y,6008,6196,true)
SUBTITLE_FX("世界の端と端を結んで",subtitle_x,subtitle_y,6008,6196)

######## Preface ########

lycoris_recoil_13=FFMS2_VIDEO_SOURCE("src\[Ohys-Raws] Lycoris Recoil (BS11 1280x720 x264 AAC)\[Ohys-Raws] Lycoris Recoil - 13 END (BS11 1280x720 x264 AAC).mp4")
lycoris_recoil_13_chisato_hug_takina_on_beach=Trim(lycoris_recoil_13,29314,29669) #356
lycoris_recoil_ed_t01=BlankClip(lycoris_recoil_13_chisato_hug_takina_on_beach,length=1,color=color_black)+TRIM_LAST_CLIP(lycoris_recoil_13_chisato_hug_takina_on_beach,324)

######## Thumbnail ########

is_thumbnail=false

is_thumbnail?ConvertToRGB32(lycoris_recoil_ed_mute,matrix="Rec709"):last

######## Music ########

bgm_48khz=SSRC(WAVSource("src\01. 花の塔.wav"),48000)
AudioDub(bgm_48khz)
MixAudio(Normalize(lycoris_recoil_ed_t01,show=true),1.0,1.0)



thumbnail=Trim(5613,-24*5)



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
