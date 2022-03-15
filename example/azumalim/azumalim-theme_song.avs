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

Import("azumalim-common.avsi")

######## Pre Combine ########

fade_length=15

function PIP(clip bg,clip ovl,int begin_frame_count,int end_frame_count){
	scale=0.25
	border=32
	bg=ConvertToRGB32(bg,matrix="Rec709")
	ovl=ConvertToRGB32(ovl,matrix="Rec709")
	ovl_scaled=Zoom(ovl,srcx=String(Width(ovl)-border),srcy=String(Height(ovl)-border),dstx=String(Width(ovl)-border),dsty=String(Height(ovl)-border),factor="Spline(n,-1,1.0,"+String(begin_frame_count-1)+","+String(scale)+","+String(Framecount(ovl)-end_frame_count)+","+String(scale)+","+String(Framecount(ovl))+",1.0,cubic=false)")
	return CONVERT_BACK_TO_YV12(Layer(bg,ovl_scaled),matrix="Rec709")
}

######## Combine ########

# azumalim_mv_senpai_01    0

# azumalim_came_to_beach_teaser_01      0
# azumalim_bring_bike_home_teaser_03    314



azumalim_theme_song_t01=PIP(TRIM_FIRST_CLIP(ASSUME_30P(azumalim_came_to_beach_teaser_01+TRIM_FIRST_CLIP(azumalim_came_to_beach_teaser_02,9)+azumalim_bring_bike_home_teaser_03),Framecount(azumalim_mv_senpai_01)),RESIZE_TO_REF_CLIP(azumalim_mv_senpai_01,azumalim_came_to_beach),1,fade_length)
azumalim_theme_song_t02=RESIZE_TO_REF_CLIP(azumalim_mv_senpai_02,azumalim_came_to_beach)
azumalim_theme_song_t03=PIP(TRIM_FIRST_CLIP(RESIZE_TO_REF_CLIP(azumalim_stylish_repair_super_cub_c125_surround,azumalim_came_to_beach),Framecount(azumalim_mv_senpai_03_01))+TRIM_FIRST_CLIP(ASSUME_30P(azumalim_bring_bike_home_azumalim_feed_takoyaki_to_bike),Framecount(azumalim_mv_senpai_03_02))+TRIM_MIDDLE_CLIP(ASSUME_30P(azumalim_climbing_mountain_azumalim_with_view+azumalim_climbing_mountain_azumalim_see_view),Framecount(azumalim_mv_senpai_03_03))+TRIM_LAST_CLIP(ASSUME_30P(azumalim_washing_bike_azumalim_shoot_water_toward_camera),Framecount(azumalim_mv_senpai_03_04)), \
	RESIZE_TO_REF_CLIP(azumalim_mv_senpai_03_01+azumalim_mv_senpai_03_02+azumalim_mv_senpai_03_03+azumalim_mv_senpai_03_04,azumalim_came_to_beach),fade_length,fade_length)
azumalim_theme_song_t04=RESIZE_TO_REF_CLIP(azumalim_mv_senpai_04,azumalim_came_to_beach)
azumalim_theme_song_t05=RESIZE_TO_REF_CLIP(azumalim_mv_senpai_05,azumalim_came_to_beach)
azumalim_theme_song_t06=PIP(TRIM_FIRST_CLIP(RESIZE_TO_REF_CLIP(ASSUME_30P(azumalim_go_to_waterfall_azumalim_see_waterfall_and_turn_back),azumalim_came_to_beach),Framecount(azumalim_mv_senpai_06_01))+TRIM_FIRST_CLIP(ASSUME_30P(azumalim_washing_bike_azumalim_drink_cafe),Framecount(azumalim_mv_senpai_06_02))+TRIM_LAST_CLIP(RESIZE_TO_REF_CLIP(azumalim_first_slip_teaser,azumalim_came_to_beach),Framecount(azumalim_mv_senpai_06_03))+TRIM_FIRST_CLIP(RESIZE_TO_REF_CLIP(azumalim_stylish_repair_azumalim_explain_digest,azumalim_came_to_beach),Framecount(azumalim_mv_senpai_06_04))+TRIM_FIRST_CLIP(RESIZE_TO_REF_CLIP(azumalim_ranch_ride_bike_along_road_02,azumalim_came_to_beach)+ASSUME_30P(azumalim_came_to_beach_azumalim_show_noodles),Framecount(azumalim_mv_senpai_06_05)), \
	RESIZE_TO_REF_CLIP(azumalim_mv_senpai_06_01+azumalim_mv_senpai_06_02+azumalim_mv_senpai_06_03+azumalim_mv_senpai_06_04+azumalim_mv_senpai_06_05,azumalim_came_to_beach),fade_length,fade_length)
azumalim_theme_song_t07=RESIZE_TO_REF_CLIP(azumalim_mv_senpai_07,azumalim_came_to_beach)
azumalim_theme_song_t08=PIP(TRIM_MIDDLE_CLIP(RESIZE_TO_REF_CLIP(azumalim_touring_to_unknown_city_azumalim_point_sunset+azumalim_touring_to_unknown_city_azumalim_hide_behind_stone,azumalim_came_to_beach),Framecount(azumalim_mv_senpai_08_01))+TRIM_LAST_CLIP(ASSUME_30P(azumalim_washing_bike_azumalim_wash_bike),Framecount(azumalim_mv_senpai_08_02))+TRIM_FIRST_CLIP(ASSUME_30P(azumalim_came_to_beach_azumalim_stand_on_beach),Framecount(azumalim_mv_senpai_08_03))+TRIM_FIRST_CLIP(ASSUME_30P(azumalim_climbing_mountain_azumalim_wear_swimsuit_on_beach+azumalim_climbing_mountain_azumalim_wear_swimsuit_on_beach_still_frame),Framecount(azumalim_mv_senpai_08_04)), \
	RESIZE_TO_REF_CLIP(azumalim_mv_senpai_08_01+azumalim_mv_senpai_08_02+azumalim_mv_senpai_08_03+azumalim_mv_senpai_08_04,azumalim_came_to_beach),fade_length,fade_length)
azumalim_theme_song_t09=RESIZE_TO_REF_CLIP(azumalim_mv_senpai_09,azumalim_came_to_beach)+RESIZE_TO_REF_CLIP(BlankClip(azumalim_mv_senpai,length=30*1,color=color_black),azumalim_came_to_beach)



azumalim_theme_song_mute=azumalim_theme_song_t01+azumalim_theme_song_t02+azumalim_theme_song_t03+azumalim_theme_song_t04+azumalim_theme_song_t05 \
	+azumalim_theme_song_t06+azumalim_theme_song_t07+azumalim_theme_song_t08+azumalim_theme_song_t09

azumalim_theme_song_mute

### export clip: azumalim_theme_song_mute

### prefetch: 5,2

### ###

######## Subtitle ########

### inherit start ###

Import("azumalim-common-cross_process.avsi")

#global subtitle_heavy_halo_width=1
global subtitle_clip_width=1920
global subtitle_clip_height=1080

subtitle_x=50*2.25
subtitle_y=395*2.25
global subtitle_front_fade_count=30
global subtitle_rear_fade_count=15
global subtitle_font="MS Gothic"
global subtitle_effects="b"
global subtitle_size=33*2.25
global subtitle_text_color=color_white
global subtitle_halo_color=color_black
global subtitle_outside_halo_color=color_gray10

global scan_mask=GENERATE_SCAN_MASK(azumalim_mv_senpai,subtitle_front_fade_count)

function SUBTITLE_FX(clip clip,string text,float x,float y,int start_frame,int end_frame,bool "is_furigana",bool "is_title"){
	is_title=Default(is_title,false)
	is_furigana=Default(is_furigana,false)

	text_color=is_title?color_violet:subtitle_text_color

	subtitle_mode=is_furigana?"ex":"ex" #"ex_thick_reduce_memory"
	size=is_furigana?subtitle_size*0.5:subtitle_size
	y=is_furigana?y-size:y

	return SUBTITLE_FX_SCAN_IN_FADE_OUT_DOUBLE_HALO(clip,text,Round(x),Round(y),start_frame,end_frame,subtitle_front_fade_count,subtitle_rear_fade_count,subtitle_font,subtitle_effects,Round(size),text_color,subtitle_halo_color,subtitle_outside_halo_color,subtitle_mode)
}

### inherit end ###

ConvertToRGB32(matrix="Rec709")

#SUBTITLE_FX("人類みなセンパイ!//アズマリム|4K UHD|- by バイク少年 fielia@AVISynth",-subtitle_x,subtitle_y-subtitle_size*2,7845,8034,is_title=true)
SUBTITLE_FX("人類みなセンパイ!//アズマリム||- by バイク少年 fielia@AVISynth",-subtitle_x,subtitle_y-subtitle_size*2,7845,8034,is_title=true)

# python:
#
# import timecode
# timecode.Timecode('30','00:00:00.000').frames-1

SUBTITLE_FX(" きょう     なん            あいさつ",subtitle_x,subtitle_y-subtitle_size*2,392,493,true)
SUBTITLE_FX("今日も何だっけ挨拶おつおつおー！",subtitle_x,subtitle_y-subtitle_size*2,392,493)
SUBTITLE_FX(" き                 わす",subtitle_x,subtitle_y,493,581,true)
SUBTITLE_FX("決めたって忘れちゃったおつおつおー！",subtitle_x,subtitle_y,493,581)
SUBTITLE_FX("                 あ",subtitle_x,subtitle_y-subtitle_size*2,581,679,true)
SUBTITLE_FX("それでも会えたからいいじゃないか",subtitle_x,subtitle_y-subtitle_size*2,581,679)
SUBTITLE_FX("         あ              き  も         だい じ",subtitle_x,subtitle_y,679,780,true)
SUBTITLE_FX("うん会いたい気持ちが大事です",subtitle_x,subtitle_y,679,780)
SUBTITLE_FX(" あ                 つぎ                 し",subtitle_x,subtitle_y-subtitle_size*2,780,865,true)
SUBTITLE_FX("会いたいの次はきっと知りたいですよね",subtitle_x,subtitle_y-subtitle_size*2,780,865)
SUBTITLE_FX("じんるい    こう き しん    しん か",subtitle_x,subtitle_y,865,982,true)
SUBTITLE_FX("人類は好奇心で進化してきたっぽいよ",subtitle_x,subtitle_y,865,982)
SUBTITLE_FX("            ただ                おも",subtitle_x,subtitle_y-subtitle_size*2,982,1061,true)
SUBTITLE_FX("だから正しいって思うのです",subtitle_x,subtitle_y-subtitle_size*2,982,1061)
SUBTITLE_FX(" し              し                                   へん",subtitle_x,subtitle_y,1061,1164,true)
SUBTITLE_FX("知りたい知られたい これって変じゃないよね？",subtitle_x,subtitle_y,1061,1164)

SUBTITLE_FX("                                  たの",subtitle_x,subtitle_y-subtitle_size*2,1164,1270,true)
SUBTITLE_FX("あーいぃ～ねぇ～ 楽しくなってきた",subtitle_x,subtitle_y-subtitle_size*2,1164,1270)
SUBTITLE_FX("つか                        おど",subtitle_x,subtitle_y,1270,1353,true)
SUBTITLE_FX("疲れないうちに踊っちゃお",subtitle_x,subtitle_y,1270,1353)
SUBTITLE_FX("                                 じょうず",subtitle_x,subtitle_y-subtitle_size*2,1353,1460,true)
SUBTITLE_FX("あーいぃ～ねぇ～ 上手になれるかな？",subtitle_x,subtitle_y-subtitle_size*2,1353,1460)
SUBTITLE_FX("らったらった もっとぶんぶん！",subtitle_x,subtitle_y,1462,1510)
SUBTITLE_FX("らったらった もっとぶんぶん！",subtitle_x,subtitle_y-subtitle_size*2,1510,1557)
SUBTITLE_FX(" て      ふ     まわ",subtitle_x,subtitle_y,1557,1610,true)
SUBTITLE_FX("手を振り回そう！",subtitle_x,subtitle_y,1557,1610)

SUBTITLE_FX("どうしてこうなっちゃうの（センパイ！）",subtitle_x,subtitle_y-subtitle_size*2,1611,1696)
SUBTITLE_FX("これからにドキドキしちゃうんだな（センパイ！）",subtitle_x,subtitle_y,1696,1787)
SUBTITLE_FX("わけ",subtitle_x,subtitle_y-subtitle_size*2,1787,1847,true)
SUBTITLE_FX("訳わからないけど",subtitle_x,subtitle_y-subtitle_size*2,1787,1847)
SUBTITLE_FX("            はじ",subtitle_x,subtitle_y,1847,1942,true)
SUBTITLE_FX("スキが始まりたがってさ",subtitle_x,subtitle_y,1847,1942)
SUBTITLE_FX("かっ て                 きざ",subtitle_x,subtitle_y-subtitle_size*2,1942,2024,true)
SUBTITLE_FX("勝手なリズム刻むよ very good!",subtitle_x,subtitle_y-subtitle_size*2,1942,2024)
SUBTITLE_FX("ほんとう     じ ぶん",subtitle_x,subtitle_y,2024,2072,true)
SUBTITLE_FX("本当の自分（センパイ！）",subtitle_x,subtitle_y,2024,2072)
SUBTITLE_FX("ぜん ぶ  だ",subtitle_x,subtitle_y-subtitle_size*2,2072,2135,true)
SUBTITLE_FX("全部出せてるのかな",subtitle_x,subtitle_y-subtitle_size*2,2072,2135)
SUBTITLE_FX("                                                ちか",subtitle_x,subtitle_y,2135,2227,true)
SUBTITLE_FX("もうちょっとね（ハイ！）近づきたいから",subtitle_x,subtitle_y,2135,2227)
SUBTITLE_FX(" よ                              き",subtitle_x,subtitle_y-subtitle_size*2,2227,2322,true)
SUBTITLE_FX("呼んだらすぐに「来ちゃって」と",subtitle_x,subtitle_y-subtitle_size*2,2227,2322)
SUBTITLE_FX(" い                い                い                い",subtitle_x,subtitle_y,2322,2372,true)
SUBTITLE_FX("言いたい 言いたい 言いたい 言ったら",subtitle_x,subtitle_y,2322,2372)
SUBTITLE_FX("             き",subtitle_x,subtitle_y-subtitle_size*2,2372,2430,true)
SUBTITLE_FX("こっち来てください",subtitle_x,subtitle_y-subtitle_size*2,2372,2430)
SUBTITLE_FX("くださいな",subtitle_x,subtitle_y,2483,2533)
SUBTITLE_FX("センパーイ！",subtitle_x,subtitle_y-subtitle_size*2,2595,2706)

### pass clip: azumalim_theme_song_mute

### prefetch: 5,2

### ###

SUBTITLE_FX("すこ    やす         め  と",subtitle_x,subtitle_y,2791,2890,true)
SUBTITLE_FX("少し休んで目閉じておつおつおー！",subtitle_x,subtitle_y,2791,2890)
SUBTITLE_FX("こえ        つた",subtitle_x,subtitle_y-subtitle_size*2,2890,2978,true)
SUBTITLE_FX("声でも伝われよおつおつおー！",subtitle_x,subtitle_y-subtitle_size*2,2890,2978)
SUBTITLE_FX("                 あ",subtitle_x,subtitle_y,2978,3074,true)
SUBTITLE_FX("そろそろ会いたいねそうじゃないか",subtitle_x,subtitle_y,2978,3074)
SUBTITLE_FX("         あ                             こい",subtitle_x,subtitle_y-subtitle_size*2,3074,3180,true)
SUBTITLE_FX("はい会いたくなるのは恋ですか？",subtitle_x,subtitle_y-subtitle_size*2,3074,3180)
SUBTITLE_FX("こい",subtitle_x,subtitle_y,3180,3281,true)
SUBTITLE_FX("恋なんてまだのまだそんなことは",subtitle_x,subtitle_y,3180,3281)
SUBTITLE_FX(" お                  お                                              む  り",subtitle_x,subtitle_y-subtitle_size*2,3281,3388,true)
SUBTITLE_FX("置いといて置いといちゃヤダヤダけど無理か…",subtitle_x,subtitle_y-subtitle_size*2,3281,3388)
SUBTITLE_FX("                                    おも",subtitle_x,subtitle_y,3388,3470,true)
SUBTITLE_FX("だけどやめないって思うのです",subtitle_x,subtitle_y,3388,3470)
SUBTITLE_FX(" と              と",subtitle_x,subtitle_y-subtitle_size*2,3470,3561,true)
SUBTITLE_FX("止めない止まらない これってう～ん…なのかな",subtitle_x,subtitle_y-subtitle_size*2,3470,3561)

SUBTITLE_FX("                                                   むちゅう   よる",subtitle_x,subtitle_y,3561,3674,true)
SUBTITLE_FX("あーいぃ～ねぇ～ ゲームに夢中な夜",subtitle_x,subtitle_y,3561,3674)
SUBTITLE_FX(" じ かんわす        あそ",subtitle_x,subtitle_y-subtitle_size*2,3674,3743,true)
SUBTITLE_FX("時間忘れて遊んじゃえ",subtitle_x,subtitle_y-subtitle_size*2,3674,3743)
SUBTITLE_FX("                                  かたいた",subtitle_x,subtitle_y,3743,3858,true)
SUBTITLE_FX("あーいぃ～ねぇ～ 肩痛くなっても",subtitle_x,subtitle_y,3743,3858)
SUBTITLE_FX("らったらった もっとがんがん！",subtitle_x,subtitle_y-subtitle_size*2,3858,3904)
SUBTITLE_FX("らったらった もっとがんがん！",subtitle_x,subtitle_y,3904,3949)
SUBTITLE_FX("ハマるべきでしょ！",subtitle_x,subtitle_y-subtitle_size*2,3949,4010)

SUBTITLE_FX("いつもこうなっちゃうの（センパイ！）",subtitle_x,subtitle_y,4010,4094)
SUBTITLE_FX("ときめいてジタバタしちゃうんだな（センパイ！）",subtitle_x,subtitle_y-subtitle_size*2,4094,4192)
SUBTITLE_FX("だれ",subtitle_x,subtitle_y,4192,4244,true)
SUBTITLE_FX("誰のせいかなんて",subtitle_x,subtitle_y,4192,4244)
SUBTITLE_FX(" こころ   おく     か",subtitle_x,subtitle_y-subtitle_size*2,4244,4340,true)
SUBTITLE_FX(" 心の奥に書いてある",subtitle_x,subtitle_y-subtitle_size*2,4244,4340)
SUBTITLE_FX(" よ                  な",subtitle_x,subtitle_y,4340,4420,true)
SUBTITLE_FX("読まれたら泣いちゃうよ top secret!",subtitle_x,subtitle_y,4340,4420)
SUBTITLE_FX("                     じ ぶん",subtitle_x,subtitle_y-subtitle_size*2,4420,4483,true)
SUBTITLE_FX("ちっちゃな自分（センパイ！）",subtitle_x,subtitle_y-subtitle_size*2,4420,4483)
SUBTITLE_FX(" き",subtitle_x,subtitle_y,4483,4529,true)
SUBTITLE_FX("気にしてほしいけど",subtitle_x,subtitle_y,4483,4529)
SUBTITLE_FX("そういうのは（ハイ！）わざとじゃなくてさ",subtitle_x,subtitle_y-subtitle_size*2,4529,4628)
SUBTITLE_FX(" し ぜん    ほう",subtitle_x,subtitle_y,4628,4712,true)
SUBTITLE_FX("自然な方がアガると",subtitle_x,subtitle_y,4628,4712)
SUBTITLE_FX(" い                い                い                い",subtitle_x,subtitle_y-subtitle_size*2,4712,4774,true)
SUBTITLE_FX("言いたい 言いたい 言いたい 言ったら",subtitle_x,subtitle_y-subtitle_size*2,4712,4774)
SUBTITLE_FX(" うなず",subtitle_x,subtitle_y,4774,4834,true)
SUBTITLE_FX(" 頷いてください",subtitle_x,subtitle_y,4774,4834)
SUBTITLE_FX("くださいね",subtitle_x,subtitle_y-subtitle_size*2,4889,4917)
SUBTITLE_FX("センパーイ！",subtitle_x,subtitle_y,5001,5106)

### pass clip: azumalim_theme_song_mute

### prefetch: 5,2

### ###

SUBTITLE_FX("                    こうはい            げん し  じ だい",subtitle_x,subtitle_y-subtitle_size*2,5200,5281,true)
SUBTITLE_FX("センパイも後輩だった原始時代",subtitle_x,subtitle_y-subtitle_size*2,5200,5281)
SUBTITLE_FX("ひと",subtitle_x,subtitle_y,5281,5391,true)
SUBTITLE_FX("人はみなセンパイになるのです",subtitle_x,subtitle_y,5281,5391)
SUBTITLE_FX("つな                                                                          いっしょ",subtitle_x,subtitle_y-subtitle_size*2,5391,5550,true)
SUBTITLE_FX("繋がっちゃたセンパイとずっとね ずっとね一緒に",subtitle_x,subtitle_y-subtitle_size*2,5391,5550)
SUBTITLE_FX("                                    いっしょ",subtitle_x,subtitle_y,5550,5639,true)
SUBTITLE_FX("ワクワクしたいな（一緒に）",subtitle_x,subtitle_y,5550,5639)
SUBTITLE_FX("                    いっしょ",subtitle_x,subtitle_y-subtitle_size*2,5639,5684,true)
SUBTITLE_FX("したいな（一緒にね）",subtitle_x,subtitle_y-subtitle_size*2,5639,5684)
SUBTITLE_FX("げんだい    こうはい        ねが            ねが",subtitle_x,subtitle_y,5684,5780,true)
SUBTITLE_FX("現代の後輩のお願い（お願い）",subtitle_x,subtitle_y,5684,5780)
SUBTITLE_FX(" き                      き",subtitle_x,subtitle_y-subtitle_size*2,5780,5831,true)
SUBTITLE_FX("聞いてよね（聞いてよね）",subtitle_x,subtitle_y-subtitle_size*2,5780,5831)
SUBTITLE_FX("そしたらずっと",subtitle_x,subtitle_y,5831,5875)
SUBTITLE_FX("        かん        いっしょ     い",subtitle_x,subtitle_y-subtitle_size*2,5875,6032,true)
SUBTITLE_FX("いい感じで一緒に居られそうだから",subtitle_x,subtitle_y-subtitle_size*2,5875,6032)

### pass clip: azumalim_theme_song_mute

### prefetch: 5,2

### ###

SUBTITLE_FX("どうして",subtitle_x,subtitle_y,6032,6077)
SUBTITLE_FX("いつもこうなっちゃうの",subtitle_x,subtitle_y-subtitle_size*2,6077,6156)
SUBTITLE_FX("ときめいてジタバタしちゃうんだな",subtitle_x,subtitle_y,6156,6247)
SUBTITLE_FX("だれ",subtitle_x,subtitle_y-subtitle_size*2,6247,6309,true)
SUBTITLE_FX("誰のせいかなんて",subtitle_x,subtitle_y-subtitle_size*2,6247,6309)
SUBTITLE_FX(" こころ   おく     か",subtitle_x,subtitle_y,6309,6393,true)
SUBTITLE_FX(" 心の奥に書いてある",subtitle_x,subtitle_y,6309,6393)
SUBTITLE_FX(" よ                  な",subtitle_x,subtitle_y-subtitle_size*2,6393,6480,true)
SUBTITLE_FX("読まれたら泣いちゃうよ top secret!",subtitle_x,subtitle_y-subtitle_size*2,6393,6480)
SUBTITLE_FX("ねぇセンパイ！センパイ！",subtitle_x,subtitle_y,6480,6534)

SUBTITLE_FX("わぁこうなっちゃった！（センパイ！）",subtitle_x,subtitle_y-subtitle_size*2,6534,6591)
SUBTITLE_FX("これからにドキドキしちゃうんだな（センパイ！）",subtitle_x,subtitle_y,6591,6682)
SUBTITLE_FX("わけ",subtitle_x,subtitle_y-subtitle_size*2,6682,6743,true)
SUBTITLE_FX("訳わからないけど",subtitle_x,subtitle_y-subtitle_size*2,6682,6743)
SUBTITLE_FX("            はじ",subtitle_x,subtitle_y,6743,6830,true)
SUBTITLE_FX("スキが始まりたがってさ",subtitle_x,subtitle_y,6743,6830)
SUBTITLE_FX("かっ て                 きざ",subtitle_x,subtitle_y-subtitle_size*2,6830,6920,true)
SUBTITLE_FX("勝手なリズム刻むよ very good!",subtitle_x,subtitle_y-subtitle_size*2,6830,6920)
SUBTITLE_FX("ほんとう     じ ぶん",subtitle_x,subtitle_y,6920,6976,true)
SUBTITLE_FX("本当の自分（センパイ！）",subtitle_x,subtitle_y,6920,6976)
SUBTITLE_FX("ぜん ぶ  だ",subtitle_x,subtitle_y-subtitle_size*2,6976,7028,true)
SUBTITLE_FX("全部出せてるのかな",subtitle_x,subtitle_y-subtitle_size*2,6976,7028)
SUBTITLE_FX("                                                ちか",subtitle_x,subtitle_y,7028,7123,true)
SUBTITLE_FX("もうちょっとね（ハイ！）近づきたいから",subtitle_x,subtitle_y,7028,7123)
SUBTITLE_FX(" よ                              き",subtitle_x,subtitle_y-subtitle_size*2,7123,7210,true)
SUBTITLE_FX("呼んだらすぐに「来ちゃって」と",subtitle_x,subtitle_y-subtitle_size*2,7123,7210)
SUBTITLE_FX(" い                い                い",subtitle_x,subtitle_y,7210,7250,true)
SUBTITLE_FX("言いたい 言いたい 言いたい",subtitle_x,subtitle_y,7210,7250)
SUBTITLE_FX(" い                          き",subtitle_x,subtitle_y-subtitle_size*2,7250,7331,true)
SUBTITLE_FX("言ったらこっち来てください",subtitle_x,subtitle_y-subtitle_size*2,7250,7331)
SUBTITLE_FX("くださいな",subtitle_x,subtitle_y,7388,7417)
SUBTITLE_FX("                              おし",subtitle_x,subtitle_y-subtitle_size*2,7479,7623,true)
SUBTITLE_FX("センパイのこと 教えてください",subtitle_x,subtitle_y-subtitle_size*2,7479,7623)
SUBTITLE_FX("くださいね！",subtitle_x,subtitle_y,7623,7701)

######## Thumbnail ########

is_thumbnail=false

is_thumbnail?ConvertToRGB32(azumalim_theme_song_mute,matrix="Rec709"):last

######## Music ########

AudioDub(azumalim_mv_senpai)



thumbnail=Trim(6919,-30*5)



BlankClip(last,length=30*1,color=color_black)++last



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
