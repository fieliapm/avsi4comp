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



Import("..\avsi4comp\macro.avsi")

#Import("Pantarheon3D.avsi")

SetMemoryMax(64)

######## Function ########

function OFFSET_PARALLAX(clip clip){
	return OFFSET_PARALLAX_OF_LEFT_RIGHT_3D_CLIP(clip,0.005)
}

######## YouTube (1280*720) ########

puzzle_and_dragons_z_op_digest=OFFSET_PARALLAX(MONO_CLIP_TO_LEFT_RIGHT_3D_CLIP(SSRC(FFMS2_VIDEO_SOURCE("src\puzzle_and_dragons_z-movie\official\パズドラＺオープニングムービーダイジェスト版.720p.mp4",fpsnum=30000,fpsden=1001),48000)))
puzzle_and_dragons_z_op_digest_3d=SSRC(FFMS2_VIDEO_SOURCE("src\puzzle_and_dragons_z-movie\official\パズドラＺオープニングムービーダイジェスト版.3D-720p.mp4",fpsnum=30000,fpsden=1001),48000)
puzzle_and_dragons_z_op_digest_3d=LeftRight3DReducedToLeftRight(puzzle_and_dragons_z_op_digest_3d)

puzzle_and_dragons_z_movie_guruguru_waza_retsuden=OFFSET_PARALLAX(MONO_CLIP_TO_LEFT_RIGHT_3D_CLIP(SSRC(FFMS2_VIDEO_SOURCE("src\puzzle_and_dragons_z-movie\official\クルクルわざ列伝.360p.mp4",fpsnum=30000,fpsden=1001),48000)))
puzzle_and_dragons_z_movie_legend_begin=OFFSET_PARALLAX(MONO_CLIP_TO_LEFT_RIGHT_3D_CLIP(SSRC(FFMS2_VIDEO_SOURCE("src\puzzle_and_dragons_z-movie\official\'伝説が始まる'篇.720p.mp4",fpsnum=30000,fpsden=1001),48000)))
puzzle_and_dragons_z_movie_pv_tgs_2013=OFFSET_PARALLAX(MONO_CLIP_TO_LEFT_RIGHT_3D_CLIP(SSRC(FFMS2_VIDEO_SOURCE("src\puzzle_and_dragons_z-movie\official\PV TGS 2013 ver..720p.mp4",fpsnum=30000,fpsden=1001),48000)))
puzzle_and_dragons_z_movie_pv_tgs_2013_cache02=OFFSET_PARALLAX(MONO_CLIP_TO_LEFT_RIGHT_3D_CLIP(SSRC(FFMS2_VIDEO_SOURCE("src\puzzle_and_dragons_z-movie\official\PV TGS 2013 ver..720p.mp4",fpsnum=30000,fpsden=1001),48000)))
puzzle_and_dragons_z_movie_paradox_vs_dragon_tamer=OFFSET_PARALLAX(MONO_CLIP_TO_LEFT_RIGHT_3D_CLIP(SSRC(FFMS2_VIDEO_SOURCE("src\puzzle_and_dragons_z-movie\official\PV第1弾 悪の組織パラドックスVS.ドラゴンテイマー篇.720p.mp4",fpsnum=30000,fpsden=1001),48000)))
puzzle_and_dragons_z_movie_arrival_on_3ds=OFFSET_PARALLAX(MONO_CLIP_TO_LEFT_RIGHT_3D_CLIP(SSRC(FFMS2_VIDEO_SOURCE("src\puzzle_and_dragons_z-movie\official\パズドラＺ'あのパズドラがニンテンドー3DSに登場篇'.720p.mp4",fpsnum=30000,fpsden=1001),48000)))



#puzzle_and_dragons_z_op_intro=FFMS2_VIDEO_SOURCE("src\puzzle_and_dragons_z-movie\non-official\Puzzle & Dragons Z (3DS) Opening Introduction & Gameplay Footage.720p.mp4")

######## Trim ########

#puzzle_and_dragons_z_op_digest_pre=Trim(puzzle_and_dragons_z_op_digest,0,45)
puzzle_and_dragons_z_op_digest_01=Trim(puzzle_and_dragons_z_op_digest,46,105) #60
puzzle_and_dragons_z_op_digest_02=Trim(puzzle_and_dragons_z_op_digest,106,345) #240
puzzle_and_dragons_z_op_digest_03=Trim(puzzle_and_dragons_z_op_digest,346,979) #634
puzzle_and_dragons_z_op_digest_04=Trim(puzzle_and_dragons_z_op_digest,980,1395) #416
#puzzle_and_dragons_z_op_digest_post=Trim(puzzle_and_dragons_z_op_digest,1396,0)

#puzzle_and_dragons_z_op_digest_3d_pre=Trim(puzzle_and_dragons_z_op_digest_3d,0,45)
puzzle_and_dragons_z_op_digest_3d_01=Trim(puzzle_and_dragons_z_op_digest_3d,46,105) #60
puzzle_and_dragons_z_op_digest_3d_02=Trim(puzzle_and_dragons_z_op_digest_3d,106,345) #240
puzzle_and_dragons_z_op_digest_3d_03=Trim(puzzle_and_dragons_z_op_digest_3d,346,979) #634
puzzle_and_dragons_z_op_digest_3d_04=Trim(puzzle_and_dragons_z_op_digest_3d,980,1395) #416
#puzzle_and_dragons_z_op_digest_3d_post=Trim(puzzle_and_dragons_z_op_digest_3d,1396,0)

#puzzle_and_dragons_z_movie_legend_begin_pre=Trim(puzzle_and_dragons_z_movie_legend_begin,0,44)
puzzle_and_dragons_z_movie_legend_begin_01=Trim(puzzle_and_dragons_z_movie_legend_begin,45,917) #873 op
puzzle_and_dragons_z_movie_legend_begin_02_anime=Trim(puzzle_and_dragons_z_movie_legend_begin,918,1454) #537
puzzle_and_dragons_z_movie_legend_begin_03=Trim(puzzle_and_dragons_z_movie_legend_begin,1455,1571) #117
puzzle_and_dragons_z_movie_legend_begin_04=Trim(puzzle_and_dragons_z_movie_legend_begin,1572,1679) #108
puzzle_and_dragons_z_movie_legend_begin_05=Trim(puzzle_and_dragons_z_movie_legend_begin,1680,1924) #245 op
puzzle_and_dragons_z_movie_legend_begin_03_04_05=Trim(puzzle_and_dragons_z_movie_legend_begin,1455,1924) #470
puzzle_and_dragons_z_movie_legend_begin_06_anime=Trim(puzzle_and_dragons_z_movie_legend_begin,1925,2051) #127
puzzle_and_dragons_z_movie_legend_begin_07=Trim(puzzle_and_dragons_z_movie_legend_begin,2052,2276) #225
puzzle_and_dragons_z_movie_legend_begin_08=Trim(puzzle_and_dragons_z_movie_legend_begin,2277,2537) #261
puzzle_and_dragons_z_movie_legend_begin_07_08=Trim(puzzle_and_dragons_z_movie_legend_begin,2052,2537) #486 op
puzzle_and_dragons_z_movie_legend_begin_09_anime=Trim(puzzle_and_dragons_z_movie_legend_begin,2538,2821) #284
puzzle_and_dragons_z_movie_legend_begin_09_anime_part=Trim(puzzle_and_dragons_z_movie_legend_begin,2660,2681) #22 op
puzzle_and_dragons_z_movie_legend_begin_10=Trim(puzzle_and_dragons_z_movie_legend_begin,2822,6655) #3834 op
puzzle_and_dragons_z_movie_legend_begin_11_anime=Trim(puzzle_and_dragons_z_movie_legend_begin,6656,7661) #1006
puzzle_and_dragons_z_movie_legend_begin_11_anime_part=Trim(puzzle_and_dragons_z_movie_legend_begin,7257,7264) #8 op
#puzzle_and_dragons_z_movie_legend_begin_post=Trim(puzzle_and_dragons_z_movie_legend_begin,7662,0)

#puzzle_and_dragons_z_movie_pv_tgs_2013_pre=Trim(puzzle_and_dragons_z_movie_pv_tgs_2013,0,43)
puzzle_and_dragons_z_movie_pv_tgs_2013_01=Trim(puzzle_and_dragons_z_movie_pv_tgs_2013,44,583) #540 op
puzzle_and_dragons_z_movie_pv_tgs_2013_02_anime=Trim(puzzle_and_dragons_z_movie_pv_tgs_2013,584,988) #405
puzzle_and_dragons_z_movie_pv_tgs_2013_03=Trim(puzzle_and_dragons_z_movie_pv_tgs_2013,989,1443) #455 op
puzzle_and_dragons_z_movie_pv_tgs_2013_04_anime=Trim(puzzle_and_dragons_z_movie_pv_tgs_2013,1444,1703) #260
puzzle_and_dragons_z_movie_pv_tgs_2013_05=Trim(puzzle_and_dragons_z_movie_pv_tgs_2013,1704,2189) #486 op
puzzle_and_dragons_z_movie_pv_tgs_2013_06_anime=Trim(puzzle_and_dragons_z_movie_pv_tgs_2013,2190,2379) #190
puzzle_and_dragons_z_movie_pv_tgs_2013_06_anime_part=Trim(puzzle_and_dragons_z_movie_pv_tgs_2013_cache02,2287,2355) #69 op
puzzle_and_dragons_z_movie_pv_tgs_2013_07=Trim(puzzle_and_dragons_z_movie_pv_tgs_2013,2380,2742) #363 op
puzzle_and_dragons_z_movie_pv_tgs_2013_08=Trim(puzzle_and_dragons_z_movie_pv_tgs_2013,2743,2922) #180
puzzle_and_dragons_z_movie_pv_tgs_2013_09_anime=Trim(puzzle_and_dragons_z_movie_pv_tgs_2013,2923,3033) #111
puzzle_and_dragons_z_movie_pv_tgs_2013_10=Trim(puzzle_and_dragons_z_movie_pv_tgs_2013,3034,3137) #104 op
puzzle_and_dragons_z_movie_pv_tgs_2013_11=Trim(puzzle_and_dragons_z_movie_pv_tgs_2013,3138,6477) #3340 op
puzzle_and_dragons_z_movie_pv_tgs_2013_12_anime=Trim(puzzle_and_dragons_z_movie_pv_tgs_2013,6478,6715) #238
puzzle_and_dragons_z_movie_pv_tgs_2013_13=Trim(puzzle_and_dragons_z_movie_pv_tgs_2013,6716,7250) #535
puzzle_and_dragons_z_movie_pv_tgs_2013_13_5=Trim(puzzle_and_dragons_z_movie_pv_tgs_2013,7251,7278) #28
puzzle_and_dragons_z_movie_pv_tgs_2013_14_anime=Trim(puzzle_and_dragons_z_movie_pv_tgs_2013,7279,7334) #56 op
puzzle_and_dragons_z_movie_pv_tgs_2013_14_light=Trim(puzzle_and_dragons_z_movie_pv_tgs_2013,7335,7347) #13
puzzle_and_dragons_z_movie_pv_tgs_2013_15=Trim(puzzle_and_dragons_z_movie_pv_tgs_2013,7348,8369) #1028 op
puzzle_and_dragons_z_movie_pv_tgs_2013_16_anime=Trim(puzzle_and_dragons_z_movie_pv_tgs_2013,8370,8706) #337
puzzle_and_dragons_z_movie_pv_tgs_2013_17=Trim(puzzle_and_dragons_z_movie_pv_tgs_2013,8707,8815) #109 op
puzzle_and_dragons_z_movie_pv_tgs_2013_18_anime=Trim(puzzle_and_dragons_z_movie_pv_tgs_2013,8816,9466) #651
#puzzle_and_dragons_z_movie_pv_tgs_2013_post=Trim(puzzle_and_dragons_z_movie_pv_tgs_2013,9467,0)

#puzzle_and_dragons_z_movie_paradox_vs_dragon_tamer_pre=Trim(puzzle_and_dragons_z_movie_paradox_vs_dragon_tamer,0,45)
puzzle_and_dragons_z_movie_paradox_vs_dragon_tamer_01=Trim(puzzle_and_dragons_z_movie_paradox_vs_dragon_tamer,46,2729) #2684
puzzle_and_dragons_z_movie_paradox_vs_dragon_tamer_02_title=Trim(puzzle_and_dragons_z_movie_paradox_vs_dragon_tamer,2730,3036) #307
#puzzle_and_dragons_z_movie_paradox_vs_dragon_tamer_post=Trim(puzzle_and_dragons_z_movie_paradox_vs_dragon_tamer,3037,0)

#puzzle_and_dragons_z_movie_arrival_on_3ds_pre=Trim(puzzle_and_dragons_z_movie_arrival_on_3ds,0,44)
puzzle_and_dragons_z_movie_arrival_on_3ds_01=Trim(puzzle_and_dragons_z_movie_arrival_on_3ds,45,1049) #1005
puzzle_and_dragons_z_movie_arrival_on_3ds_02_title=Trim(puzzle_and_dragons_z_movie_arrival_on_3ds,1050,1359) #310
#puzzle_and_dragons_z_movie_arrival_on_3ds_post=Trim(puzzle_and_dragons_z_movie_arrival_on_3ds,1360,0)

######## Pre Combine ########

puzzle_and_dragons_z_movie_pv_tgs_2013_01_speed_up=CLIP_SPEED(puzzle_and_dragons_z_movie_pv_tgs_2013_01,Float(Framecount(puzzle_and_dragons_z_movie_pv_tgs_2013_01))/405.0,false)

last_part_patch_fade_length=Framecount(puzzle_and_dragons_z_movie_pv_tgs_2013_06_anime_part)+Framecount(puzzle_and_dragons_z_movie_pv_tgs_2013_14_anime)-103
last_part_patch=Dissolve(puzzle_and_dragons_z_movie_pv_tgs_2013_06_anime_part,puzzle_and_dragons_z_movie_pv_tgs_2013_14_anime,last_part_patch_fade_length)

puzzle_and_dragons_z_op_digest_3d_04_last_frame=Framecount(puzzle_and_dragons_z_op_digest_3d_04)-1
puzzle_and_dragons_z_op_digest_3d_04_extend=Loop(puzzle_and_dragons_z_op_digest_3d_04,30*7,puzzle_and_dragons_z_op_digest_3d_04_last_frame,puzzle_and_dragons_z_op_digest_3d_04_last_frame)

######## Combine ########

# puzzle_and_dragons_z_op_digest_01 13
# puzzle_and_dragons_z_op_digest_02 1539
# puzzle_and_dragons_z_op_digest_03 6384
# puzzle_and_dragons_z_op_digest_04 7121



fade_length=15

puzzle_and_dragons_z_op_t01=BlankClip(puzzle_and_dragons_z_op_digest_3d,length=13,color=color_black)+puzzle_and_dragons_z_op_digest_3d_01+TRIM_FIRST_CLIP(puzzle_and_dragons_z_movie_pv_tgs_2013_01_speed_up,405)

puzzle_and_dragons_z_op_t02=TRIM_MIDDLE_CLIP(puzzle_and_dragons_z_movie_pv_tgs_2013_11,367+366+328)
puzzle_and_dragons_z_op_t03=puzzle_and_dragons_z_op_digest_3d_02
puzzle_and_dragons_z_op_t04=TRIM_FIRST_CLIP(puzzle_and_dragons_z_movie_legend_begin_07_08,371)+TRIM_LAST_CLIP(puzzle_and_dragons_z_movie_pv_tgs_2013_03,274)

puzzle_and_dragons_z_op_t05=TRIM_MIDDLE_CLIP(puzzle_and_dragons_z_movie_legend_begin_05+puzzle_and_dragons_z_movie_legend_begin_11_anime_part+puzzle_and_dragons_z_movie_legend_begin_09_anime_part,275)

puzzle_and_dragons_z_op_t06_t07=TRIM_MIDDLE_CLIP(puzzle_and_dragons_z_movie_legend_begin_10,367+367+367+206)
puzzle_and_dragons_z_op_t08=TRIM_MIDDLE_CLIP(puzzle_and_dragons_z_movie_pv_tgs_2013_15,366+275)

puzzle_and_dragons_z_op_t09=TRIM_LAST_CLIP(puzzle_and_dragons_z_movie_legend_begin_01,367+367)

puzzle_and_dragons_z_op_t10=TRIM_LAST_CLIP(puzzle_and_dragons_z_movie_pv_tgs_2013_05,457)+TRIM_FIRST_CLIP(puzzle_and_dragons_z_movie_pv_tgs_2013_17,92)+TRIM_FIRST_CLIP(puzzle_and_dragons_z_movie_pv_tgs_2013_10,92)

puzzle_and_dragons_z_op_t11=TRIM_LAST_CLIP(puzzle_and_dragons_z_movie_pv_tgs_2013_07,362)+puzzle_and_dragons_z_op_digest_3d_03
puzzle_and_dragons_z_op_t12=last_part_patch+puzzle_and_dragons_z_op_digest_3d_04_extend



puzzle_and_dragons_z_op_mute=puzzle_and_dragons_z_op_t01 \
	+puzzle_and_dragons_z_op_t02+puzzle_and_dragons_z_op_t03+puzzle_and_dragons_z_op_t04 \
	+puzzle_and_dragons_z_op_t05 \
	+puzzle_and_dragons_z_op_t06_t07+DOUBLE_FADE_WITH_BRIGHTNESS_OFFSET(puzzle_and_dragons_z_op_t08, \
	puzzle_and_dragons_z_op_t09,fade_length,fade_length) \
	+puzzle_and_dragons_z_op_t10 \
	+puzzle_and_dragons_z_op_t11+puzzle_and_dragons_z_op_t12

######## Music ########

bgm_48khz=SSRC(WAVSource("src\nakagawa_shouko-2014_04_02-9lives-cd-03.wav"),48000)
AudioDub(puzzle_and_dragons_z_op_mute,bgm_48khz)



thumbnail=Trim(6564,-30*5)

######## Subtitle ########

subtitle_x=50
subtitle_y=400
global subtitle_front_fade_count=30
global subtitle_rear_fade_count=30
global subtitle_font="MS Gothic"
global subtitle_effects="b"
global subtitle_size=28
global subtitle_text_color=color_white
global subtitle_halo_color=color_black

function SUBTITLE_FX(clip clip,string text,float x,float y,int start_frame,int end_frame,bool "is_title"){
	is_title=Default(is_title,false)

	text_color=is_title?color_gold:subtitle_text_color
	halo_color=is_title?color_firebrick:subtitle_halo_color

	#return SUBTITLE_FX_PULL_IN_PULL_OUT(clip,text,x,y,start_frame,end_frame,subtitle_front_fade_count,subtitle_rear_fade_count,subtitle_font,subtitle_effects,subtitle_size,text_color,halo_color)
	return APPLY_FILTER_TO_LEFT_RIGHT_3D_CLIP(clip,"SUBTITLE_FX_PULL_IN_PULL_OUT("+DOUBLE_QUOTE_STRING(text)+","+String(x)+","+String(y)+","+String(start_frame)+","+String(end_frame)+",subtitle_front_fade_count,subtitle_rear_fade_count,subtitle_font,subtitle_effects,subtitle_size,"+String(text_color)+","+String(halo_color)+")")
}

SUBTITLE_FX("さかさま世界//中川翔子|- by fielia@AVISynth",subtitle_x,subtitle_y-subtitle_size,7395,7650,true)

SUBTITLE_FX("きっと誰かが こんな風に呟くだろう",subtitle_x,subtitle_y,472,647)
SUBTITLE_FX("どうして失くしながら 歩き続けるの?",subtitle_x,subtitle_y-subtitle_size,655,832)
SUBTITLE_FX("きっと僕らは こんな風に言い放つのさ",subtitle_x,subtitle_y,839,1015)
SUBTITLE_FX("理由なんてないし 知りたいとも思わない",subtitle_x,subtitle_y-subtitle_size,1033,1201)

SUBTITLE_FX("問いかけじゃなくて 答えを出してくなら",subtitle_x,subtitle_y,1205,1390)
SUBTITLE_FX("この世界の全てを 映しだした夜露の",subtitle_x,subtitle_y-subtitle_size,1399,1573)
SUBTITLE_FX("滴のようなパズル いま解き明かせ",subtitle_x,subtitle_y,1576,1738)

SUBTITLE_FX("さかさま世界 たった一つじゃない",subtitle_x,subtitle_y-subtitle_size,1777,1957)
SUBTITLE_FX("僕らはいつも 泣いてばかりじゃない",subtitle_x,subtitle_y,1961,2140)
SUBTITLE_FX("目に見えないものだけ 信じてみるよ",subtitle_x,subtitle_y-subtitle_size,2143,2325)
SUBTITLE_FX("何度でも つぎの奇跡へ",subtitle_x,subtitle_y,2338,2531)

SUBTITLE_FX("そして誰もが もう一度夢見るだろう",subtitle_x,subtitle_y,2692,2871)
SUBTITLE_FX("どうして出会えたのに 探し続けるの?",subtitle_x,subtitle_y-subtitle_size,2877,3055)
SUBTITLE_FX("そして僕らは 何度だって笑い飛ばす",subtitle_x,subtitle_y,3059,3228)
SUBTITLE_FX("何もかもがきっと この路の上にある",subtitle_x,subtitle_y-subtitle_size,3253,3422)

SUBTITLE_FX("見せかけじゃなくて 生き抜いてやりたいなら",subtitle_x,subtitle_y,3426,3617)
SUBTITLE_FX("あの夜空の果てまで 彩られた花火の",subtitle_x,subtitle_y-subtitle_size,3621,3795)
SUBTITLE_FX("一瞬のように 最後まで燃え尽くせ",subtitle_x,subtitle_y,3799,3985)

SUBTITLE_FX("さかさま世界 たった一人じゃない",subtitle_x,subtitle_y-subtitle_size,3998,4180)
SUBTITLE_FX("僕らはみんな 変わり続けたいのさ",subtitle_x,subtitle_y,4183,4362)
SUBTITLE_FX("手に負えないものほど 欲しくなるんだ",subtitle_x,subtitle_y-subtitle_size,4366,4555)
SUBTITLE_FX("どこまでも",subtitle_x,subtitle_y,4561,4604)

SUBTITLE_FX("僕らの辞書に「終わり」はいらない",subtitle_x,subtitle_y-subtitle_size,4641,4824)
SUBTITLE_FX("毎日は加速する こんがらがったまま",subtitle_x,subtitle_y,4835,5014)
SUBTITLE_FX("旅立ちの向こうに 自由の旗ひるがえる",subtitle_x,subtitle_y-subtitle_size,5018,5216)
SUBTITLE_FX("その目で見て その手で掴め",subtitle_x,subtitle_y,5217,5396)

SUBTITLE_FX("さかさま世界 たった一つじゃない",subtitle_x,subtitle_y,6015,6195)
SUBTITLE_FX("僕らはいつも 泣いてばかりじゃない",subtitle_x,subtitle_y-subtitle_size,6196,6377)
SUBTITLE_FX("さかさま世界 たった一人じゃない",subtitle_x,subtitle_y,6381,6564)
SUBTITLE_FX("僕らはみんな 変わり続けたいのさ",subtitle_x,subtitle_y-subtitle_size,6566,6746)
SUBTITLE_FX("目に見えないものだけ 信じてみるよ",subtitle_x,subtitle_y,6748,6929)
SUBTITLE_FX("何度でも つぎの奇跡へ",subtitle_x,subtitle_y-subtitle_size,6942,7132)



introduction_3d=BlankClip(puzzle_and_dragons_z_op_digest_3d,length=30*14,color=color_black)
introduction_3d=SUBTITLE_FX(introduction_3d,"このムービーはアナグリフ式3Dです。|最高の3D視聴体験を得るために、|レッド/シアンの3Dメガネを着用してください。||
本片為紅藍3D立體版影片。|請配戴紅藍3D立體眼鏡以獲得最佳3D觀賞體驗。||
This movie is in anaglyph 3D format.|Please wear red/cyan 3D glasses|to get the best 3D viewing experience.",subtitle_x,subtitle_x,30*2,30*12)

introduction_3d++last



#ConvertToRGB32(thumbnail)

LeftRight3DToRCAnaglyph()

######## Post Processing ########

ConvertToYV12()
#ConvertToYUY2()
#ConvertToRGB24()

TCPServer()
