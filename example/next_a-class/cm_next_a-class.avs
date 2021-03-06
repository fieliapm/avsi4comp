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

######## Anime Online (1080P) ########

next_a_class_full_jp=FFMS2_VIDEO_SOURCE("src\next_a-class\anime\full\japanese\next_a-class_full_jp_1080p.mp4")

next_a_class_full_jp_01_countdown=Trim(next_a_class_full_jp,0,143)
next_a_class_full_jp_02_see_movie=Trim(next_a_class_full_jp,144,566)
next_a_class_full_jp_03_follow_raamen_truck=Trim(next_a_class_full_jp,567,7533)
next_a_class_full_jp_04_find_fujiwara_toufu_ten=Trim(next_a_class_full_jp,7534,8134)
next_a_class_full_jp_05_title_01=Trim(next_a_class_full_jp,8135,8245)
next_a_class_full_jp_05_title_02=Trim(next_a_class_full_jp,8246,8381)
next_a_class_full_jp_06_staff=Trim(next_a_class_full_jp,8382,0)

######## Anime Online (480P) ########

di_gi_charat_party_night=FFMS2_VIDEO_SOURCE("src\di_gi_charat-party_night\デ・ジ・キャラット (Di Gi Charat)「Party☆Night」高画質&高音質.480p.flv")
di_gi_charat_party_night_thumbnail=Trim(di_gi_charat_party_night,2288,2913)

initial_d_stage01_bgm=FFMS2_VIDEO_SOURCE("src\initial_d\DAVE SIMON _ I NEED YOUR LOVE.480p.flv")
initial_d_stage01_bgm_thumbnail=Trim(initial_d_stage01_bgm,322,0)

######## Anime Online (720P) ########

initial_d_stage05_op_ed=FFMS2_VIDEO_SOURCE("src\initial_d\Initial D Fifth Stage OP y ED HD.720p.mp4")
initial_d_stage05_op_thumbnail=Trim(initial_d_stage05_op_ed,0,315)

######## Pre Combine ########

fade_length=24

prologue_01=FadeOut(Trim(next_a_class_full_jp_02_see_movie,0,337),fade_length)
prologue_02=BlankClip(next_a_class_full_jp_02_see_movie,length=750,color=color_black)

next_a_class_full_jp_05_modified_title_01=BlankClip(next_a_class_full_jp_05_title_01,color=color_black)
next_a_class_full_jp_05_modified_title_02=BlankClip(next_a_class_full_jp_05_title_02,color=color_black)

initial_d_stage01_bgm_thumbnail=ConvertFPS(initial_d_stage01_bgm_thumbnail,next_a_class_full_jp)
initial_d_stage05_op_thumbnail=ConvertFPS(initial_d_stage05_op_thumbnail,next_a_class_full_jp)
initial_d_thumbnail=AddBorders(initial_d_stage05_op_thumbnail,0,0,640,360)
initial_d_thumbnail_overlay_x=Width(initial_d_thumbnail)-Width(initial_d_stage01_bgm_thumbnail)
initial_d_thumbnail_overlay_y=Height(initial_d_thumbnail)-Height(initial_d_stage01_bgm_thumbnail)
initial_d_thumbnail=Overlay(initial_d_thumbnail,initial_d_stage01_bgm_thumbnail,initial_d_thumbnail_overlay_x,initial_d_thumbnail_overlay_y,mode="Blend")
initial_d_thumbnail=AudioDub(initial_d_thumbnail,initial_d_stage01_bgm_thumbnail)

######## Pre Combine - Subtitle ########

subtitle_x=50
subtitle_y=400
global subtitle_font="MS Gothic"
global subtitle_effects="bi"
global subtitle_size=28
global subtitle_text_color=color_white
global subtitle_halo_color=color_purple

second_subtitle_x=subtitle_x
second_subtitle_y=50

function SUBTITLE_N(clip clip,string text,int x,int y,int "first_frame",int "last_frame",bool "is_title"){
	is_title=Default(is_title,false)

	halo_color=is_title?color_blue:subtitle_halo_color
	size=is_title?title_subtitle_size:subtitle_size
	subtitle_mode=is_title?"standard":"ex"

	return SUBTITLE_NORMAL(clip,text,x,y,first_frame,last_frame,subtitle_font,subtitle_effects,size,subtitle_text_color,halo_color,subtitle_mode)
}

function SUBTITLE_WARNING(clip clip,string text,int x,int y,int "first_frame",int "last_frame"){
	halo_color=color_red
	size=Round(subtitle_size*1.5)
	return SUBTITLE_FX_SMOOTH_BLINK(clip,text,x,y,first_frame,last_frame,subtitle_font,subtitle_effects,size,subtitle_text_color,halo_color,min_opacity=0.2,max_opacity=1.0)
}

global intro_subtitle_front_fade_count=24
global intro_subtitle_rear_fade_count=24
global intro_subtitle_text_color=color_white
global intro_subtitle_halo_color=color_darkcyan

function SUBTITLE_FX(clip clip,string text,float x,float y,int start_frame,int end_frame){
	return SUBTITLE_FX_OFFSET_FADE_IN_FADE_OUT(clip,text,x,y,start_frame,end_frame,intro_subtitle_front_fade_count,intro_subtitle_rear_fade_count,subtitle_font,subtitle_effects,subtitle_size,intro_subtitle_text_color,intro_subtitle_halo_color)
}



prologue_01=ConvertToRGB32(prologue_01)

prologue_subtitle_01_first_frame=50
prologue_subtitle_01_last_frame=299
prologue_01=SUBTITLE_N(prologue_01,"20XX年||新訂定的著作權法幾乎消滅了二次創作||全世界的二創活動因此走向機動化經營模式||以規避警察的通緝||但多數仍難逃法網",second_subtitle_x,second_subtitle_y,prologue_subtitle_01_first_frame,prologue_subtitle_01_last_frame,false)

prologue_02=ConvertToRGB32(prologue_02)

prologue_subtitle_02_first_frame=0
prologue_subtitle_02_last_frame=249
prologue_02=SUBTITLE_N(prologue_02,"為了有效延續二創活動||二創同萌建造了移動都市||保護最後的創作園地||同萌成員的中央歌謠祭除在此設立據點外||也把服務窗口搬上貨車||由最頂尖的staff駕駛||不斷地高速疾走",second_subtitle_x,second_subtitle_y,prologue_subtitle_02_first_frame,prologue_subtitle_02_last_frame,false)

prologue_subtitle_03_first_frame=250
prologue_subtitle_03_last_frame=499
prologue_02=SUBTITLE_N(prologue_02,"然而擔任駕駛的staff曾經是職業賽車手||其驚人的駕駛技術極少人能追上||雖然警察拿staff沒輒||但一般人民也不得其門而入||因此幾乎沒有人能參與中央歌謠祭的熱唱|||老字號的中央歌謠祭便漸漸地成為傳説",second_subtitle_x,second_subtitle_y,prologue_subtitle_03_first_frame,prologue_subtitle_03_last_frame,false)

prologue_subtitle_04_first_frame=500
prologue_02=SUBTITLE_N(prologue_02,"某天||一位運氣極背的少女Nico||在新依X特KTV||對著自已以前唱過(別種意味上)的爛歌發牢騷...",second_subtitle_x,second_subtitle_y,prologue_subtitle_04_first_frame,is_title=false)

prologue_02=FadeIn0(FadeOut(prologue_02,fade_length),fade_length)
prologue_blank_clip=BlankClip(prologue_01,length=24,color=color_black)
prologue=ConvertToYV12(prologue_01+prologue_blank_clip+prologue_02+prologue_blank_clip)


di_gi_charat_party_night_thumbnail=ConvertToRGB32(di_gi_charat_party_night_thumbnail)

di_gi_charat_party_night_thumbnail=SUBTITLE_N(di_gi_charat_party_night_thumbnail,"(3人) Hold me baby ノリノリparty",subtitle_x,subtitle_y,50,149,false)
di_gi_charat_party_night_thumbnail=SUBTITLE_N(di_gi_charat_party_night_thumbnail,"(真田アサミ) 瞳まで輝いて",subtitle_x,subtitle_y,151,236,false)
di_gi_charat_party_night_thumbnail=SUBTITLE_N(di_gi_charat_party_night_thumbnail,"(3人) Touch me baby are you ready ok?",subtitle_x,subtitle_y,241,341,false)
di_gi_charat_party_night_thumbnail=SUBTITLE_N(di_gi_charat_party_night_thumbnail,"(氷上恭子) 楽しもう君も",subtitle_x,subtitle_y,343,432,false)
di_gi_charat_party_night_thumbnail=SUBTITLE_N(di_gi_charat_party_night_thumbnail,"(3人) Hold me baby 踊ろうよSunday",subtitle_x,subtitle_y,433,535,false)
di_gi_charat_party_night_thumbnail=SUBTITLE_N(di_gi_charat_party_night_thumbnail,"(沢城みゆき) ステップを踏みましょう",subtitle_x,subtitle_y,536,625,false)

di_gi_charat_party_night_thumbnail=AddBorders(di_gi_charat_party_night_thumbnail,108,0,108,0)
di_gi_charat_party_night_thumbnail=RESIZE_TO_REF_CLIP(ConvertFPS(di_gi_charat_party_night_thumbnail,next_a_class_full_jp),next_a_class_full_jp)
di_gi_charat_party_night_thumbnail=ConvertToYV12(di_gi_charat_party_night_thumbnail)



next_a_class_full_jp_03_follow_raamen_truck=ConvertToRGB32(next_a_class_full_jp_03_follow_raamen_truck)

original_subtitle=false

intro_length=24*4
next_a_class_full_jp_03_follow_raamen_truck=SUBTITLE_FX(next_a_class_full_jp_03_follow_raamen_truck,"Nico ニコ|甲斐クニコ|CV:沢城みゆき",550,300,211,211+intro_length)
next_a_class_full_jp_03_follow_raamen_truck=SUBTITLE_FX(next_a_class_full_jp_03_follow_raamen_truck,"Gatsu ガツ|我那覇毅|CV:津田健次郎",500,250,550,550+intro_length)
next_a_class_full_jp_03_follow_raamen_truck=SUBTITLE_FX(next_a_class_full_jp_03_follow_raamen_truck,"Makito マキト|粕谷マキト|CV:鈴村健一",250,200,530,530+intro_length)
next_a_class_full_jp_03_follow_raamen_truck=SUBTITLE_FX(next_a_class_full_jp_03_follow_raamen_truck,(original_subtitle?"Old Man|オヤジ":"Staff|蕭劍龍")+"|CV:岸野幸正",50,150,5772,5772+intro_length)

next_a_class_full_jp_03_follow_raamen_truck=SUBTITLE_FX(next_a_class_full_jp_03_follow_raamen_truck,original_subtitle?"":"NCU ACG Song Festival|中央歌謠祭屋台",100,350,370,370+36)

next_a_class_full_jp_03_follow_raamen_truck=SUBTITLE_N(next_a_class_full_jp_03_follow_raamen_truck,original_subtitle?"什麼爛片...":"什麼爛歌...",subtitle_x,subtitle_y,22,57,false)
next_a_class_full_jp_03_follow_raamen_truck=SUBTITLE_N(next_a_class_full_jp_03_follow_raamen_truck,"(違規停放的自行車已經撤去)",second_subtitle_x,second_subtitle_y,93,151,false)
next_a_class_full_jp_03_follow_raamen_truck=SUBTITLE_N(next_a_class_full_jp_03_follow_raamen_truck,"衰到爆",subtitle_x,subtitle_y,169,211,false)
next_a_class_full_jp_03_follow_raamen_truck=SUBTITLE_N(next_a_class_full_jp_03_follow_raamen_truck,"今天,今天的我...",subtitle_x,subtitle_y,212,281,false)
next_a_class_full_jp_03_follow_raamen_truck=SUBTITLE_N(next_a_class_full_jp_03_follow_raamen_truck,"這是...",subtitle_x,subtitle_y,318,340,false)

next_a_class_full_jp_03_follow_raamen_truck=SUBTITLE_N(next_a_class_full_jp_03_follow_raamen_truck,original_subtitle?"好沒勁的路":"好沒勁的KTV",subtitle_x,subtitle_y,505,542,false)
next_a_class_full_jp_03_follow_raamen_truck=SUBTITLE_N(next_a_class_full_jp_03_follow_raamen_truck,"是嘛?",subtitle_x,subtitle_y,543,561,false)
next_a_class_full_jp_03_follow_raamen_truck=SUBTITLE_N(next_a_class_full_jp_03_follow_raamen_truck,original_subtitle?"習慣的話就很方便悠":"有些歌還算可以拉",subtitle_x,subtitle_y,562,593,false)
next_a_class_full_jp_03_follow_raamen_truck=SUBTITLE_N(next_a_class_full_jp_03_follow_raamen_truck,original_subtitle?""""City Sharing"""":"""像是"賣鶏的小攤"""",subtitle_x,subtitle_y,594,625,false)
next_a_class_full_jp_03_follow_raamen_truck=SUBTITLE_N(next_a_class_full_jp_03_follow_raamen_truck,original_subtitle?"(城市會隨著時間變換街道構造)":"(假面Wizard OP)",second_subtitle_x,second_subtitle_y,594,625,false)
next_a_class_full_jp_03_follow_raamen_truck=SUBTITLE_N(next_a_class_full_jp_03_follow_raamen_truck,original_subtitle?"繁忙過頭了阿,這座城市":"但是大都太冷門了阿,這些歌",subtitle_x,subtitle_y,626,689,false)
next_a_class_full_jp_03_follow_raamen_truck=SUBTITLE_N(next_a_class_full_jp_03_follow_raamen_truck,original_subtitle?"Transpoter54!":"流動式KTV!",subtitle_x,subtitle_y,805,837,false)
next_a_class_full_jp_03_follow_raamen_truck=SUBTITLE_N(next_a_class_full_jp_03_follow_raamen_truck,"マキト,換我開",subtitle_x,subtitle_y,851,882,false)
next_a_class_full_jp_03_follow_raamen_truck=SUBTITLE_N(next_a_class_full_jp_03_follow_raamen_truck,"阿?",subtitle_x,subtitle_y,883,898,false)
next_a_class_full_jp_03_follow_raamen_truck=SUBTITLE_N(next_a_class_full_jp_03_follow_raamen_truck,"追阿!",subtitle_x,subtitle_y,912,928,false)

next_a_class_full_jp_03_follow_raamen_truck=SUBTITLE_N(next_a_class_full_jp_03_follow_raamen_truck,original_subtitle?"夢幻拉麺屋台?":"夢幻歌謠祭屋台?",subtitle_x,subtitle_y,1110,1152,false)
next_a_class_full_jp_03_follow_raamen_truck=SUBTITLE_N(next_a_class_full_jp_03_follow_raamen_truck,"拜託!好不容易找到的",subtitle_x,subtitle_y,1153,1184,false)
next_a_class_full_jp_03_follow_raamen_truck=SUBTITLE_N(next_a_class_full_jp_03_follow_raamen_truck,"不要讓它溜了阿!",subtitle_x,subtitle_y,1185,1229,false)
next_a_class_full_jp_03_follow_raamen_truck=SUBTITLE_N(next_a_class_full_jp_03_follow_raamen_truck,"是這個阿,",subtitle_x,subtitle_y,1230,1252,false)
next_a_class_full_jp_03_follow_raamen_truck=SUBTITLE_N(next_a_class_full_jp_03_follow_raamen_truck,original_subtitle?"多變都市計劃開始前":"自從新著作權法消滅二次創作後",subtitle_x,subtitle_y,1253,1297,false)
next_a_class_full_jp_03_follow_raamen_truck=SUBTITLE_N(next_a_class_full_jp_03_follow_raamen_truck,original_subtitle?"就飛馳街道的夢幻拉麺屋台":"中央歌謠祭服務窗口便機動化",subtitle_x,subtitle_y,1298,1345,false)
next_a_class_full_jp_03_follow_raamen_truck=SUBTITLE_N(next_a_class_full_jp_03_follow_raamen_truck,original_subtitle?"追上它的人才有資格享用到的究極美味":"追上它的人才有資格熱唱究極動漫歌曲",subtitle_x,subtitle_y,1346,1396,false)
next_a_class_full_jp_03_follow_raamen_truck=SUBTITLE_N(next_a_class_full_jp_03_follow_raamen_truck,"奔馳的都市傳説",subtitle_x,subtitle_y,1397,1429,false)
next_a_class_full_jp_03_follow_raamen_truck=SUBTITLE_N(next_a_class_full_jp_03_follow_raamen_truck,"愛死它了!",subtitle_x,subtitle_y,1430,1452,false)
next_a_class_full_jp_03_follow_raamen_truck=SUBTITLE_N(next_a_class_full_jp_03_follow_raamen_truck,"那是奔馳的博物館阿",subtitle_x,subtitle_y,1453,1492,false)
next_a_class_full_jp_03_follow_raamen_truck=SUBTITLE_N(next_a_class_full_jp_03_follow_raamen_truck,"不,是奔馳的瀕臨絶種動物!",subtitle_x,subtitle_y,1493,1530,false)
next_a_class_full_jp_03_follow_raamen_truck=SUBTITLE_N(next_a_class_full_jp_03_follow_raamen_truck,"絶對要追上它,拜託!",subtitle_x,subtitle_y,1531,1575,false)
next_a_class_full_jp_03_follow_raamen_truck=SUBTITLE_N(next_a_class_full_jp_03_follow_raamen_truck,"不然的話,我的今天就会這麼悲慘地結束了(吸哭吸哭)",subtitle_x,subtitle_y,1576,1669,false)
next_a_class_full_jp_03_follow_raamen_truck=SUBTITLE_N(next_a_class_full_jp_03_follow_raamen_truck,"(19點整)",subtitle_x,subtitle_y,1714,1748,false)
next_a_class_full_jp_03_follow_raamen_truck=SUBTITLE_N(next_a_class_full_jp_03_follow_raamen_truck,original_subtitle?"(7號街和10號街即將互換)":"(中央歌謠祭即將停止入場)",subtitle_x,subtitle_y,1749,1804,false)
next_a_class_full_jp_03_follow_raamen_truck=SUBTITLE_N(next_a_class_full_jp_03_follow_raamen_truck,original_subtitle?"不妙,區域變換開始了!":"不妙,staff快要實施管制了!",subtitle_x,subtitle_y,1805,1863,false)
next_a_class_full_jp_03_follow_raamen_truck=SUBTITLE_N(next_a_class_full_jp_03_follow_raamen_truck,"哇阿!?",subtitle_x,subtitle_y,1864,1886,false)
next_a_class_full_jp_03_follow_raamen_truck=SUBTITLE_N(next_a_class_full_jp_03_follow_raamen_truck,"那又怎樣!",subtitle_x,subtitle_y,1887,1925,false)
next_a_class_full_jp_03_follow_raamen_truck=SUBTITLE_N(next_a_class_full_jp_03_follow_raamen_truck,"賣走〜!",subtitle_x,subtitle_y,1955,1997,false)

next_a_class_full_jp_03_follow_raamen_truck=SUBTITLE_N(next_a_class_full_jp_03_follow_raamen_truck,"(今天也辛苦了)",subtitle_x,subtitle_y,2291,2329,false)
next_a_class_full_jp_03_follow_raamen_truck=SUBTITLE_N(next_a_class_full_jp_03_follow_raamen_truck,original_subtitle?"(為了努力過的祢,為了明天)":"(為了愛唱歌的祢,為了歌頌明天)",subtitle_x,subtitle_y,2330,2398,false)
next_a_class_full_jp_03_follow_raamen_truck=SUBTITLE_N(next_a_class_full_jp_03_follow_raamen_truck,original_subtitle?"(鶴龜飲料,好想讓祢喝喝看!)":"(就讓樺達潤喉糖,來替祢潤喉!)",subtitle_x,subtitle_y,2399,2475,false)

next_a_class_full_jp_03_follow_raamen_truck=SUBTITLE_N(next_a_class_full_jp_03_follow_raamen_truck,"果然不行阿...",subtitle_x,subtitle_y,2518,2559,false)
next_a_class_full_jp_03_follow_raamen_truck=SUBTITLE_N(next_a_class_full_jp_03_follow_raamen_truck,"對不起,讓祢們攪進奇怪的事情了",subtitle_x,subtitle_y,2578,2649,false)
next_a_class_full_jp_03_follow_raamen_truck=SUBTITLE_N(next_a_class_full_jp_03_follow_raamen_truck,"阿列?",subtitle_x,subtitle_y,2676,2693,false)
next_a_class_full_jp_03_follow_raamen_truck=SUBTITLE_N(next_a_class_full_jp_03_follow_raamen_truck,original_subtitle?"這裡上boost...動力限制也...":"...不停下來給我點歌嘛,歌謠祭staff給我記住...",subtitle_x,subtitle_y,2723,2790,false)
next_a_class_full_jp_03_follow_raamen_truck=SUBTITLE_N(next_a_class_full_jp_03_follow_raamen_truck,original_subtitle?"拿得到M code的情報阿,它的identify code...":"拿得到本次歌單阿,能交到歌謠祭staff的朋友真好...",subtitle_x,subtitle_y,2791,2862,false)
next_a_class_full_jp_03_follow_raamen_truck=SUBTITLE_N(next_a_class_full_jp_03_follow_raamen_truck,"那,那個...",subtitle_x,subtitle_y,2863,2893,false)

next_a_class_full_jp_03_follow_raamen_truck=SUBTITLE_N(next_a_class_full_jp_03_follow_raamen_truck,"阿!!!",subtitle_x,subtitle_y,3115,3150,false)
next_a_class_full_jp_03_follow_raamen_truck=SUBTITLE_N(next_a_class_full_jp_03_follow_raamen_truck,"來巴!",subtitle_x,subtitle_y,3204,3221,false)
next_a_class_full_jp_03_follow_raamen_truck=SUBTITLE_N(next_a_class_full_jp_03_follow_raamen_truck,"戰鬥再開!",subtitle_x,subtitle_y,3309,3349,false)

next_a_class_full_jp_03_follow_raamen_truck=SUBTITLE_N(next_a_class_full_jp_03_follow_raamen_truck,original_subtitle?"(Dream Island,禁止進入)":"(中央歌謠舞踏会籌備中,禁止進入)",second_subtitle_x,second_subtitle_y,3470,3515,false)
next_a_class_full_jp_03_follow_raamen_truck=SUBTITLE_N(next_a_class_full_jp_03_follow_raamen_truck,"衝阿!",subtitle_x,subtitle_y,3561,3583,false)
next_a_class_full_jp_03_follow_raamen_truck=SUBTITLE_N(next_a_class_full_jp_03_follow_raamen_truck,"哈哈!追上祢了巴",subtitle_x,subtitle_y,3712,3757,false)
next_a_class_full_jp_03_follow_raamen_truck=SUBTITLE_N(next_a_class_full_jp_03_follow_raamen_truck,"祢這破爛博物館!",subtitle_x,subtitle_y,3758,3787,false)
next_a_class_full_jp_03_follow_raamen_truck=SUBTITLE_N(next_a_class_full_jp_03_follow_raamen_truck,original_subtitle?"這個一定要拍照上傳阿!":"這個一定要發Pu上傳實況阿!",subtitle_x,subtitle_y,3788,3830,false)
next_a_class_full_jp_03_follow_raamen_truck=SUBTITLE_N(next_a_class_full_jp_03_follow_raamen_truck,original_subtitle?"拉麺3碗!":"我要唱萌歌!",subtitle_x,subtitle_y,3831,3855,false)
next_a_class_full_jp_03_follow_raamen_truck=SUBTITLE_N(next_a_class_full_jp_03_follow_raamen_truck,original_subtitle?"加滷蛋!":"像Party Night這樣的! <--(剛剛不是才在嫌歌爛??)",subtitle_x,subtitle_y,3856,3894,false)
next_a_class_full_jp_03_follow_raamen_truck=SUBTITLE_N(next_a_class_full_jp_03_follow_raamen_truck,"絶對不讓祢溜掉!",subtitle_x,subtitle_y,4006,4039,false)
next_a_class_full_jp_03_follow_raamen_truck=SUBTITLE_N(next_a_class_full_jp_03_follow_raamen_truck,"お,おい...!",subtitle_x,subtitle_y,4040,4063,false)
next_a_class_full_jp_03_follow_raamen_truck=SUBTITLE_N(next_a_class_full_jp_03_follow_raamen_truck,"別看不起人!",subtitle_x,subtitle_y,4116,4139,false)
next_a_class_full_jp_03_follow_raamen_truck=SUBTITLE_N(next_a_class_full_jp_03_follow_raamen_truck,"猴塞雷!",subtitle_x,subtitle_y,4140,4161,false)
next_a_class_full_jp_03_follow_raamen_truck=SUBTITLE_N(next_a_class_full_jp_03_follow_raamen_truck,"上阿!",subtitle_x,subtitle_y,4162,4181,false)
next_a_class_full_jp_03_follow_raamen_truck=SUBTITLE_N(next_a_class_full_jp_03_follow_raamen_truck,"厄?",subtitle_x,subtitle_y,4233,4248,false)

next_a_class_full_jp_03_follow_raamen_truck=SUBTITLE_N(next_a_class_full_jp_03_follow_raamen_truck,"阿阿阿〜〜〜!!!",subtitle_x,subtitle_y,4445,4528,false)
next_a_class_full_jp_03_follow_raamen_truck=SUBTITLE_N(next_a_class_full_jp_03_follow_raamen_truck,"沒救拉!",subtitle_x,subtitle_y,4529,4551,false)
next_a_class_full_jp_03_follow_raamen_truck=SUBTITLE_N(next_a_class_full_jp_03_follow_raamen_truck,"要死拉!",subtitle_x,subtitle_y,4552,4578,false)
next_a_class_full_jp_03_follow_raamen_truck=SUBTITLE_N(next_a_class_full_jp_03_follow_raamen_truck,"果然阿...",subtitle_x,subtitle_y,4579,4600,false)
next_a_class_full_jp_03_follow_raamen_truck=SUBTITLE_N(next_a_class_full_jp_03_follow_raamen_truck,"厄?",subtitle_x,subtitle_y,4601,4620,false)
next_a_class_full_jp_03_follow_raamen_truck=SUBTITLE_N(next_a_class_full_jp_03_follow_raamen_truck,original_subtitle?"連累到祢們,對不起":"為了唱歌連累到祢們,對不起",subtitle_x,subtitle_y,4630,4675,false)
next_a_class_full_jp_03_follow_raamen_truck=SUBTITLE_N(next_a_class_full_jp_03_follow_raamen_truck,"現在才説這種話?",subtitle_x,subtitle_y,4676,4715,false)
next_a_class_full_jp_03_follow_raamen_truck=SUBTITLE_N(next_a_class_full_jp_03_follow_raamen_truck,"嘛,去巴",subtitle_x,subtitle_y,4716,4746,false)
next_a_class_full_jp_03_follow_raamen_truck=SUBTITLE_N(next_a_class_full_jp_03_follow_raamen_truck,"盡力而為",subtitle_x,subtitle_y,4758,4791,false)
next_a_class_full_jp_03_follow_raamen_truck=SUBTITLE_N(next_a_class_full_jp_03_follow_raamen_truck,"落地瞬間馬力全開!",subtitle_x,subtitle_y,4802,4841,false)
next_a_class_full_jp_03_follow_raamen_truck=SUBTITLE_N(next_a_class_full_jp_03_follow_raamen_truck,"油門催落去!",subtitle_x,subtitle_y,4842,4871,false)
next_a_class_full_jp_03_follow_raamen_truck=SUBTITLE_N(next_a_class_full_jp_03_follow_raamen_truck,"恩!",subtitle_x,subtitle_y,4876,4887,false)
next_a_class_full_jp_03_follow_raamen_truck=SUBTITLE_N(next_a_class_full_jp_03_follow_raamen_truck,original_subtitle?"衝阿!":"衝阿!旋風衝鋒!",subtitle_x,subtitle_y,5110,5169,false)
next_a_class_full_jp_03_follow_raamen_truck=SUBTITLE_N(next_a_class_full_jp_03_follow_raamen_truck,original_subtitle?"":"     ---------",subtitle_x,subtitle_y,5110,5169,false)

next_a_class_full_jp_03_follow_raamen_truck=SUBTITLE_N(next_a_class_full_jp_03_follow_raamen_truck,"追到了",subtitle_x,subtitle_y,5635,5675,false)
next_a_class_full_jp_03_follow_raamen_truck=SUBTITLE_N(next_a_class_full_jp_03_follow_raamen_truck,"歡迎光臨!",subtitle_x,subtitle_y,5846,5872,false)
next_a_class_full_jp_03_follow_raamen_truck=SUBTITLE_N(next_a_class_full_jp_03_follow_raamen_truck,original_subtitle?"點些什?":"點什麼歌?",subtitle_x,subtitle_y,5873,5902,false)

next_a_class_full_jp_03_follow_raamen_truck=SUBTITLE_N(next_a_class_full_jp_03_follow_raamen_truck,"我要開動拉!",subtitle_x,subtitle_y,6058,6117,false)
next_a_class_full_jp_03_follow_raamen_truck=SUBTITLE_N(next_a_class_full_jp_03_follow_raamen_truck,original_subtitle?"美味...":"好歌配美味...",subtitle_x,subtitle_y,6210,6249,false)
next_a_class_full_jp_03_follow_raamen_truck=SUBTITLE_N(next_a_class_full_jp_03_follow_raamen_truck,"恩〜這湯頭太讚拉!",subtitle_x,subtitle_y,6286,6332,false)
next_a_class_full_jp_03_follow_raamen_truck=SUBTITLE_N(next_a_class_full_jp_03_follow_raamen_truck,"�至Q",subtitle_x,subtitle_y,6333,6357,false)
next_a_class_full_jp_03_follow_raamen_truck=SUBTITLE_N(next_a_class_full_jp_03_follow_raamen_truck,original_subtitle?"M159型 6.2L V8 DOHC 32氣門!?":"超高性能排歌電腦 立體全像投影設備 無限聲道環繞音響!?",subtitle_x,subtitle_y,6358,6456,false)
next_a_class_full_jp_03_follow_raamen_truck=SUBTITLE_N(next_a_class_full_jp_03_follow_raamen_truck,"多虧了客官",subtitle_x,subtitle_y,6457,6511,false)
next_a_class_full_jp_03_follow_raamen_truck=SUBTITLE_N(next_a_class_full_jp_03_follow_raamen_truck,original_subtitle?"看來可以喝上久違的美酒了阿":"看來可以唱到久違的ACG好歌了阿",subtitle_x,subtitle_y,6512,6587,false)
next_a_class_full_jp_03_follow_raamen_truck=SUBTITLE_N(next_a_class_full_jp_03_follow_raamen_truck,"話説回來阿",subtitle_x,subtitle_y,6612,6640,false)
next_a_class_full_jp_03_follow_raamen_truck=SUBTITLE_N(next_a_class_full_jp_03_follow_raamen_truck,original_subtitle?"俺有道想當下酒菜的極品,非它不可捏":"吾輩有個想配歌唱的極品活動,非它不可捏",subtitle_x,subtitle_y,6681,6796,false)
next_a_class_full_jp_03_follow_raamen_truck=SUBTITLE_N(next_a_class_full_jp_03_follow_raamen_truck,"寧災某?",subtitle_x,subtitle_y,6833,6880,false)
next_a_class_full_jp_03_follow_raamen_truck=SUBTITLE_N(next_a_class_full_jp_03_follow_raamen_truck,original_subtitle?"夢幻豆腐店":"夢幻豆腐店出品的parapara舞曲",subtitle_x,subtitle_y,6897,6966,false)

next_a_class_full_jp_03_follow_raamen_truck=SUBTITLE_WARNING(next_a_class_full_jp_03_follow_raamen_truck,original_subtitle?"":"[禁止飲食]",second_subtitle_x,second_subtitle_y,0,57)
next_a_class_full_jp_03_follow_raamen_truck=SUBTITLE_WARNING(next_a_class_full_jp_03_follow_raamen_truck,original_subtitle?"":"[請勿擅入或置物於禁區,否則...]",second_subtitle_x,second_subtitle_y,152,281)
next_a_class_full_jp_03_follow_raamen_truck=SUBTITLE_WARNING(next_a_class_full_jp_03_follow_raamen_truck,original_subtitle?"":"[禁止械鬥與飆車追逐等疑似格鬥行為]",second_subtitle_x,second_subtitle_y,1253,1447)
next_a_class_full_jp_03_follow_raamen_truck=SUBTITLE_WARNING(next_a_class_full_jp_03_follow_raamen_truck,original_subtitle?"":"[禁止使用手機發Pu與上傳圖片]",second_subtitle_x,second_subtitle_y,3788,3855)
next_a_class_full_jp_03_follow_raamen_truck=SUBTITLE_WARNING(next_a_class_full_jp_03_follow_raamen_truck,original_subtitle?"":"[不是説了,場内禁止飲食! (+-_-)凸]",second_subtitle_x,second_subtitle_y,5903,5989)

next_a_class_full_jp_03_follow_raamen_truck=ConvertToYV12(next_a_class_full_jp_03_follow_raamen_truck)



global title_subtitle_size=subtitle_size*3

title_01="中央歌謠舞踏会"
title_02="2012.12.23"
title_01_subtitle_x=(subtitle_clip_width/2)-(title_subtitle_size*StrLen(title_01)/4)
title_02_subtitle_x=(subtitle_clip_width/2)-(title_subtitle_size*StrLen(title_02)/4)
title_subtitle_y=subtitle_clip_height/2
title_colorkey_tolerance=$7F

function REPLACE_COLORKEY_TO_PLASMA(clip clip,int color,int tolerance){
	clip_plasma=EffectPlasma(clip,tint=2,speed=16)
	clip_with_reset_alpha=ResetMask(clip)
	clip_with_colorkey=ColorKeyMask(clip_with_reset_alpha,color,tolerance)
	return Layer(clip_plasma,clip_with_colorkey,op="Add")
}

next_a_class_full_jp_05_modified_title_01=ConvertToRGB32(next_a_class_full_jp_05_modified_title_01)
next_a_class_full_jp_05_modified_title_01=SUBTITLE_N(next_a_class_full_jp_05_modified_title_01,title_01,title_01_subtitle_x,title_subtitle_y-(title_subtitle_size/2),is_title=true)
next_a_class_full_jp_05_modified_title_01=AudioDub(next_a_class_full_jp_05_modified_title_01,next_a_class_full_jp_05_title_01)
next_a_class_full_jp_05_modified_title_02=ConvertToRGB32(next_a_class_full_jp_05_modified_title_02)
next_a_class_full_jp_05_modified_title_02=SUBTITLE_N(next_a_class_full_jp_05_modified_title_02,title_02,title_02_subtitle_x,title_subtitle_y-(title_subtitle_size/2),is_title=true)
next_a_class_full_jp_05_modified_title_02=AudioDub(next_a_class_full_jp_05_modified_title_02,next_a_class_full_jp_05_title_02)
next_a_class_full_jp_05_modified_title=next_a_class_full_jp_05_modified_title_01+next_a_class_full_jp_05_modified_title_02

next_a_class_full_jp_05_modified_title=REPLACE_COLORKEY_TO_PLASMA(next_a_class_full_jp_05_modified_title,color_blue,title_colorkey_tolerance)
next_a_class_full_jp_05_modified_title=ScriptClip(next_a_class_full_jp_05_modified_title,"RGBAdjust(r=bright,g=bright,b=bright)")
next_a_class_full_jp_05_modified_title=FrameEvaluate(next_a_class_full_jp_05_modified_title,"bright=Spline(current_frame,0,0.0,73,1.0,162,1.0,186,0.0,Framecount()-1,0.0,cubic=false)")
next_a_class_full_jp_05_modified_title=ConvertToYV12(next_a_class_full_jp_05_modified_title)



initial_d_thumbnail=ConvertToRGB32(initial_d_thumbnail)
initial_d_thumbnail=SUBTITLE_N(initial_d_thumbnail,"[夢幻豆腐店(自家用)]",subtitle_x,subtitle_y,is_title=false)
initial_d_thumbnail=ConvertToYV12(initial_d_thumbnail)

######## Combine ########

t01=FadeIn(di_gi_charat_party_night_thumbnail,fade_length)
t02=initial_d_thumbnail

cm_next_a_class=next_a_class_full_jp_01_countdown+prologue++t01++next_a_class_full_jp_03_follow_raamen_truck++t02++next_a_class_full_jp_04_find_fujiwara_toufu_ten+next_a_class_full_jp_05_modified_title+next_a_class_full_jp_06_staff

cm_next_a_class

######## Post Processing ########

ConvertToYV12()
#ConvertToYUY2()
#ConvertToRGB24()

TCPServer()
