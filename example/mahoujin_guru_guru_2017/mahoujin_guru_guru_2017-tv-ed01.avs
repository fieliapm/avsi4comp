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

Import("mahoujin_guru_guru_2017-tv-common.avsi")

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

global fade_length=12



global mahoujin_guru_guru_2017_tv_16_oppai_manjuu_loop_single=Dissolve(mahoujin_guru_guru_2017_tv_16_oppai_manjuu_pre,mahoujin_guru_guru_2017_tv_16_oppai_manjuu_pre_cache02,fade_length)

function OPPAI_MANJUU_LOOP(int count){
	return count>1?Dissolve(OPPAI_MANJUU_LOOP(count-1),mahoujin_guru_guru_2017_tv_16_oppai_manjuu_loop_single,fade_length):mahoujin_guru_guru_2017_tv_16_oppai_manjuu_loop_single
}

mahoujin_guru_guru_2017_tv_16_oppai_manjuu_loop=OPPAI_MANJUU_LOOP(6)

######## Combine ########

# mahoujin_guru_guru_2017_tv_clean_ed_01_pre                    0
# mahoujin_guru_guru_2017_tv_clean_ed_01_01_pre_loop            24
# mahoujin_guru_guru_2017_tv_clean_ed_01_01_to_02               1491/3011/4623
# mahoujin_guru_guru_2017_tv_clean_ed_01_02                     1495/3015/4627

# mahoujin_guru_guru_2017_tv_16_oppai_manjuu_loop               5313
# mahoujin_guru_guru_2017_tv_24_fireworks_and_the_end_digest    5774



### inherit start ###

ed_start=0

### inherit end ###

mahoujin_guru_guru_2017_tv_ed_01_t01=mahoujin_guru_guru_2017_tv_clean_ed_01_pre \
	+mahoujin_guru_guru_2017_tv_clean_ed_01_01_pre_loop+mahoujin_guru_guru_2017_tv_clean_ed_01_01_loop_sub1_pre+Loop(mahoujin_guru_guru_2017_tv_clean_ed_01_01_loop_sub1,1) \
	+mahoujin_guru_guru_2017_tv_clean_ed_01_01_loop_sub1_post+mahoujin_guru_guru_2017_tv_clean_ed_01_01_post_loop+mahoujin_guru_guru_2017_tv_clean_ed_01_01_to_02+mahoujin_guru_guru_2017_tv_clean_ed_01_02

#+mahoujin_guru_guru_2017_tv_clean_ed_01_01_pre_loop+mahoujin_guru_guru_2017_tv_clean_ed_01_01_loop_sub1_pre
mahoujin_guru_guru_2017_tv_ed_01_t02=TRIM_LAST_CLIP(Loop(mahoujin_guru_guru_2017_tv_clean_ed_01_01_loop_sub1,2)+mahoujin_guru_guru_2017_tv_clean_ed_01_01_loop_sub1_post,fade_length+936) \
	+mahoujin_guru_guru_2017_tv_clean_ed_01_01_post_loop+mahoujin_guru_guru_2017_tv_clean_ed_01_01_to_02+mahoujin_guru_guru_2017_tv_clean_ed_01_02

#+mahoujin_guru_guru_2017_tv_clean_ed_01_01_pre_loop+mahoujin_guru_guru_2017_tv_clean_ed_01_01_loop_sub2_pre
mahoujin_guru_guru_2017_tv_ed_01_t03=TRIM_LAST_CLIP(Loop(mahoujin_guru_guru_2017_tv_clean_ed_01_01_loop_sub2,2)+mahoujin_guru_guru_2017_tv_clean_ed_01_01_loop_sub2_post,fade_length+1028) \
	+mahoujin_guru_guru_2017_tv_clean_ed_01_01_post_loop+mahoujin_guru_guru_2017_tv_clean_ed_01_01_to_02+mahoujin_guru_guru_2017_tv_clean_ed_01_02+mahoujin_guru_guru_2017_tv_clean_ed_01_03

mahoujin_guru_guru_2017_tv_ed_01_t04=Dissolve(TRIM_FIRST_CLIP(mahoujin_guru_guru_2017_tv_16_oppai_manjuu_loop,fade_length+461+fade_length-Framecount(mahoujin_guru_guru_2017_tv_24_nike_invike_kukuri_again_01)),FADE_OUT_WITH_BRIGHTNESS_OFFSET(mahoujin_guru_guru_2017_tv_24_nike_invike_kukuri_again_01,fade_length),fade_length) \
	+FADE_IN_WITH_BRIGHTNESS_OFFSET(mahoujin_guru_guru_2017_tv_24_fireworks_and_the_end_digest,fade_length)+BlankClip(mahoujin_guru_guru_2017_tv_clean_ed_01,length=24*2,color=color_black)



mahoujin_guru_guru_2017_tv_ed_01_mute=Dissolve(mahoujin_guru_guru_2017_tv_ed_01_t01,mahoujin_guru_guru_2017_tv_ed_01_t02,mahoujin_guru_guru_2017_tv_ed_01_t03,mahoujin_guru_guru_2017_tv_ed_01_t04,fade_length)

mahoujin_guru_guru_2017_tv_ed_01_mute

### export clip: mahoujin_guru_guru_2017_tv_ed_01_mute

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
global subtitle_size=64 #28*2.25
global subtitle_text_color=color_white
global subtitle_halo_color=color_black
global subtitle_outside_halo_color=color_gray10

function SUBTITLE_FX(clip clip,string text,float x,float y,int start_frame,int end_frame,bool "is_furigana",bool "is_title"){
	is_title=Default(is_title,false)
	is_furigana=Default(is_furigana,false)

	outside_halo_color=is_title?color_red:subtitle_outside_halo_color
	effects=subtitle_effects+(is_title?"":"")

	subtitle_mode=is_furigana?"ex":"ex" #"ex_thick_reduce_memory"
	size=is_furigana?subtitle_size*0.5:subtitle_size
	y=is_furigana?y-size:y

	return SUBTITLE_FX_FADE_IN_FADE_OUT_DOUBLE_HALO(clip,text,Round(x),Round(y),start_frame,end_frame,subtitle_front_fade_count,subtitle_rear_fade_count,subtitle_font,effects,Round(size),subtitle_text_color,subtitle_halo_color,outside_halo_color,subtitle_mode)
}

### inherit end ###

ConvertToRGB32(matrix="Rec709")

SUBTITLE_FX("Round&Round&Round|//TECHNOBOYS PULCRAFT GREEN-FUND|feat. ボンジュール鈴木|- by fielia@AVISynth",-subtitle_x,subtitle_x,5761,5898,is_title=true)

SUBTITLE_FX("                                    ||||ゆめ                あま",subtitle_x,subtitle_y-subtitle_size*2,195,350,true)
SUBTITLE_FX("くるりプライマリー||夢みたいに甘いホリックがRound & Round",subtitle_x,subtitle_y-subtitle_size*2,195,350)
SUBTITLE_FX("いっしょ    のぞ     こ        めいきゅう   おく",subtitle_x,subtitle_y-subtitle_size*8,355,495,true)
SUBTITLE_FX("一緒に覗き込んだ迷宮の奥へFind & Find",subtitle_x,subtitle_y-subtitle_size*8,355,495)

SUBTITLE_FX("                                    まわ                                かな",subtitle_x,subtitle_y,545,685,true)
SUBTITLE_FX("ココロのオルゴール回すほどにドキドキ奏でるよ",subtitle_x,subtitle_y,545,685)
SUBTITLE_FX(" う             さいしょ                                            むす",subtitle_x,subtitle_y-subtitle_size*8,695,835,true)
SUBTITLE_FX("生まれて最初にもらったプレゼントを結んだメロディー",subtitle_x,subtitle_y-subtitle_size*8,695,835)

SUBTITLE_FX("めぐ                                                                    ||||むね    おく                     き",subtitle_x,subtitle_y-subtitle_size*2,835,975,true)
SUBTITLE_FX("巡るラビリンス、かくれてるよチャンス||胸の奥がダンス、聴こえちゃうね",subtitle_x,subtitle_y-subtitle_size*2,835,975)
SUBTITLE_FX("たど                                ゆめ    なん",subtitle_x,subtitle_y-subtitle_size*8,980,1055,true)
SUBTITLE_FX("辿るジュブナイル、夢へ何マイル？",subtitle_x,subtitle_y-subtitle_size*8,980,1055)

SUBTITLE_FX("                                                         も よう||||うた                おど                えが",subtitle_x,subtitle_y-subtitle_size*2,1145,1395,true)
SUBTITLE_FX("まるでシンメトリーのハートの模様||歌うように踊るように描くの",subtitle_x,subtitle_y-subtitle_size*2,1145,1395)

SUBTITLE_FX("                                     わたし                               じゅもん",subtitle_x,subtitle_y-subtitle_size*8,1470,1600,true)
SUBTITLE_FX("ふしぎファンタジー 私だけのナイショの呪文…マジック？",subtitle_x,subtitle_y-subtitle_size*8,1470,1600)
SUBTITLE_FX("Find your magic.",-subtitle_x,subtitle_y-subtitle_size*5,1595,1630)
SUBTITLE_FX("おも     だ             おも     で     かく",subtitle_x,subtitle_y,1615,1750,true)
SUBTITLE_FX("思い出せない思い出に隠れたシークレット",subtitle_x,subtitle_y,1615,1750)
SUBTITLE_FX("Around, Around",-subtitle_x,subtitle_y-subtitle_size*5,1745,1780)
SUBTITLE_FX("                                       と けいまわ        こと ば",subtitle_x,subtitle_y-subtitle_size*8,1760,1890,true)
SUBTITLE_FX("くるりプライマリー 時計回りの言葉はレトリック？",subtitle_x,subtitle_y-subtitle_size*8,1760,1890)
SUBTITLE_FX("Look a rhetoric.",-subtitle_x,subtitle_y-subtitle_size*5,1885,1920)
SUBTITLE_FX(" たからばこ   はい                            ||||                だい じ    かんじょう           つな         て      し",subtitle_x,subtitle_y-subtitle_size*2,1910,2090,true)
SUBTITLE_FX(" 宝箱に入りきらないのは||とっても大事な感情だって繋いだ手が知ってた",subtitle_x,subtitle_y-subtitle_size*2,1910,2090)

### pass clip: mahoujin_guru_guru_2017_tv_ed_01_mute

### prefetch: 5,2

### ###

SUBTITLE_FX("たど                                ゆめ    なん",subtitle_x,subtitle_y-subtitle_size*8,2210,2285,true)
SUBTITLE_FX("辿るジュブナイル、夢へ何マイル？",subtitle_x,subtitle_y-subtitle_size*8,2210,2285)

SUBTITLE_FX("                                                                                    わら",subtitle_x,subtitle_y,2360,2500,true)
SUBTITLE_FX("おしゃまなビスクドールそんなふうにクスクス笑ってたいな",subtitle_x,subtitle_y,2360,2500)
SUBTITLE_FX("さわ                         か                     おも    つづ",subtitle_x,subtitle_y-subtitle_size*8,2505,2655,true)
SUBTITLE_FX("触ってないのに変わっていく想い綴っていくんだ",subtitle_x,subtitle_y-subtitle_size*8,2505,2655)

SUBTITLE_FX("                                         さ まよ                |||| ち  ず      の                  み らい     む",subtitle_x,subtitle_y-subtitle_size*2,2665,2910,true)
SUBTITLE_FX("いつでもストーリーを彷徨ってるよ||地図に載ってない未来に向かうの",subtitle_x,subtitle_y-subtitle_size*2,2665,2910)

SUBTITLE_FX("                                                              はじ",subtitle_x,subtitle_y-subtitle_size*8,2990,3120,true)
SUBTITLE_FX("ふしぎファンタジー いつのまにか始まってる…エピック",subtitle_x,subtitle_y-subtitle_size*8,2990,3155)
SUBTITLE_FX("Find your epic.",-subtitle_x,subtitle_y-subtitle_size*5,3115,3155)
SUBTITLE_FX("めぐ     あ              で  あ     まえ     か",subtitle_x,subtitle_y,3135,3275,true)
SUBTITLE_FX("巡り合うのは出会う前に交わすエンゲージ",subtitle_x,subtitle_y,3135,3275)
SUBTITLE_FX("Around, Around",-subtitle_x,subtitle_y-subtitle_size*5,3265,3300)
SUBTITLE_FX("                                       ふたり かな        こと ば",subtitle_x,subtitle_y-subtitle_size*8,3285,3410,true)
SUBTITLE_FX("くるりプライマリー 二人奏でる言葉はもうリリック？",subtitle_x,subtitle_y-subtitle_size*8,3285,3410)
SUBTITLE_FX("Find your lyric.",-subtitle_x,subtitle_y-subtitle_size*5,3405,3440)
SUBTITLE_FX(" ものがたり   えが                            ||||                さいしょ   いっしょう            お                              し",subtitle_x,subtitle_y-subtitle_size*2,3430,3595,true)
SUBTITLE_FX(" 物語に描ききれないのに||ほんとに最初の一章だって終わってないって知ってた？",subtitle_x,subtitle_y-subtitle_size*2,3430,3595)

SUBTITLE_FX("I find your magic. You find my lyric.||Because, we are always near.",subtitle_x,subtitle_y-subtitle_size*10,3585,3800)
SUBTITLE_FX("We can feel each other's heart.",subtitle_x,subtitle_y,3805,3905)

### pass clip: mahoujin_guru_guru_2017_tv_ed_01_mute

### prefetch: 5,2

### ###

SUBTITLE_FX(" きょう       あす     きょうかいせん                               つづ",subtitle_x,subtitle_y-subtitle_size*8,3915,4035,true)
SUBTITLE_FX("今日と明日の境界線ここからどこまで続くんだろ？",subtitle_x,subtitle_y-subtitle_size*8,3915,4035)
SUBTITLE_FX(" き                                                 まわ",subtitle_x,subtitle_y,4060,4170,true)
SUBTITLE_FX("気づかないままじゃグルグル回っちゃう",subtitle_x,subtitle_y,4060,4170)
SUBTITLE_FX("                 で                 おも                 つ      だ",subtitle_x,subtitle_y-subtitle_size*8,4200,4320,true)
SUBTITLE_FX("ココから出たいなと思ってたら連れ出してくれた",subtitle_x,subtitle_y-subtitle_size*8,4200,4320)
SUBTITLE_FX("こい    あい     か        しゅんかん   だれ             ま",subtitle_x,subtitle_y,4355,4545,true)
SUBTITLE_FX("恋が愛に変わる瞬間…誰だって待ってる",subtitle_x,subtitle_y,4355,4545)

SUBTITLE_FX("                                     わたし                               じゅもん",subtitle_x,subtitle_y-subtitle_size*8,4600,4735,true)
SUBTITLE_FX("ふしぎファンタジー 私だけのナイショの呪文…マジック？",subtitle_x,subtitle_y-subtitle_size*8,4600,4735)
SUBTITLE_FX("Find your magic.",-subtitle_x,subtitle_y-subtitle_size*5,4725,4760)
SUBTITLE_FX("おも     だ             おも     で     かく",subtitle_x,subtitle_y,4750,4880,true)
SUBTITLE_FX("思い出せない思い出に隠れたシークレット",subtitle_x,subtitle_y,4750,4880)
SUBTITLE_FX("Around, Around",-subtitle_x,subtitle_y-subtitle_size*5,4875,4910)
SUBTITLE_FX("                                       と けいまわ        こと ば",subtitle_x,subtitle_y-subtitle_size*8,4895,5030,true)
SUBTITLE_FX("くるりプライマリー 時計回りの言葉はレトリック？",subtitle_x,subtitle_y-subtitle_size*8,4895,5030)
SUBTITLE_FX("Look a rhetoric.",-subtitle_x,subtitle_y-subtitle_size*5,5020,5055)
SUBTITLE_FX(" たからばこ   はい                            ||||                だい じ    かんじょう           つな         て      し",subtitle_x,subtitle_y-subtitle_size*2,5040,5215,true)
SUBTITLE_FX(" 宝箱に入りきらないのは||とっても大事な感情だって繋いだ手が知ってた",subtitle_x,subtitle_y-subtitle_size*2,5040,5215)

SUBTITLE_FX("I find your magic. You find my lyric.",subtitle_x,subtitle_y-subtitle_size*8,5270,5395)
SUBTITLE_FX("Because, we are always near. You are always dear.",subtitle_x,subtitle_y,5400,5560)

######## Thumbnail ########

is_thumbnail=false

is_thumbnail?ConvertToRGB32(mahoujin_guru_guru_2017_tv_ed_01_mute,matrix="Rec709"):last

######## Music ########

Import("mahoujin_guru_guru_2017-tv-common-cross_process.avsi")

bgm_48khz=Trim(SSRC(mahoujin_guru_guru_2017_tv_clean_ed_01_audio_v,48000),740,0)
#MixAudio(bgm_48khz,1.0,0.5)
AudioDub(bgm_48khz)



thumbnail=Trim(1352,-24*5)



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
