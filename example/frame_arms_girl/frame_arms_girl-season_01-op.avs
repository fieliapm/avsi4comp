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

Import("frame_arms_girl-season_01-common.avsi")

######## Function ########

### inherit start ###

LoadPlugin("..\plugins\MaskTools.dll")

function SUBTITLE_FX_FADE_IN_FADE_OUT_DOUBLE_HALO(clip clip,string text,int x,int y,int start_frame,int end_frame,int front_fade_count,int rear_fade_count,string "font",string "effects",int "size",int "text_color",int "halo_color",int "outside_halo_color",string "subtitle_mode"){
	before_start_frame=start_frame-front_fade_count
	after_end_frame=end_frame+rear_fade_count

	Assert(IsRGB32(clip),"SUBTITLE_FX_FADE_IN_FADE_OUT_DOUBLE_HALO(): clip only support RGB32 format")

	subtitle_rgb=_SUBTITLE_FX_PRE_OPAQUE(clip,outside_halo_color,text,x,y,before_start_frame,after_end_frame,font,effects,size,text_color,halo_color,subtitle_mode)
	subtitle_rgba=ColorKeyMask(ResetMask(subtitle_rgb),outside_halo_color,0)

	subtitle_alpha=ConvertToYV12(ShowAlpha(subtitle_rgba),matrix="Rec709")
	subtitle_alpha=Expand(Expand(subtitle_alpha))
	subtitle_alpha=ConvertToRGB32(Greyscale(subtitle_alpha),matrix="Rec709")

	subtitle_rgba=Mask(subtitle_rgba,subtitle_alpha)

	subtitle_rgba_faded_containing_parameter=ScriptClip(subtitle_rgba,"RGBAdjust(a=alpha_factor)")
	subtitle_rgba_faded=FrameEvaluate(subtitle_rgba_faded_containing_parameter,"alpha_factor=Spline(current_frame,"+String(before_start_frame)+",0.0,"+String(start_frame)+",1.0,"+String(end_frame)+",1.0,"+String(after_end_frame)+",0.0,cubic=false)")

	return _SUBTITLE_FX_POST(clip,subtitle_rgba_faded,before_start_frame,after_end_frame)
}

### inherit end ###

######## Pre Combine ########

fade_length=12

pip_length=127
kotobuki_nipper_pip_01=TRIM_MIDDLE_CLIP(frame_arms_girl_season_01_03_kotobuki_nipper,pip_length)
kotobuki_nipper_pip_02=TRIM_FIRST_CLIP(frame_arms_girl_season_01_06_bukiko_take_suenaga_mirai_and_explain,pip_length)
kotobuki_nipper_pip_01=ScriptClip(kotobuki_nipper_pip_01,"FAST_ZOOM(srcx=Width(),srcy=0.0,dstx=Width(),dsty=0.0+Spline(current_frame,0,Height()/8.0,Framecount()-1,0.0,cubic=false),factor=0.6)")
kotobuki_nipper_pip_02=ScriptClip(kotobuki_nipper_pip_02,"FAST_ZOOM(srcx=0.0,srcy=Height(),dstx=0.0,dsty=Height()-Spline(current_frame,0,Height()/8.0,Framecount()-1,0.0,cubic=false),factor=0.6)")
kotobuki_nipper_pip=Overlay(kotobuki_nipper_pip_01,kotobuki_nipper_pip_02,mode="Add")
kotobuki_nipper_pip=FrameEvaluate(kotobuki_nipper_pip,"OL_opacity_offset=Spline(current_frame,0,-1.0,16-fade_length,-1.0,16,0.0,Framecount()-1,0.0,cubic=false)")

######## Combine ########

# frame_arms_girl_season_01_clean_op_01 -3
# frame_arms_girl_season_01_clean_op_02 254/2278
# frame_arms_girl_season_01_clean_op_03 755/2779
# frame_arms_girl_season_01_clean_op_04 1063/3087/5427
# frame_arms_girl_season_01_clean_op_05 1573/3597/5937
# frame_arms_girl_season_01_clean_op_06 1820/3844/6184
# frame_arms_girl_season_01_clean_op_07 6530



op_music_start=3

frame_arms_girl_season_01_clean_op_01_00=Trim(frame_arms_girl_season_01_clean_op_01,0,op_music_start-1)
frame_arms_girl_season_01_clean_op_01_01=Trim(frame_arms_girl_season_01_clean_op_01,op_music_start,0)



frame_arms_girl_season_01_op_t01=frame_arms_girl_season_01_clean_op_01_01

frame_arms_girl_season_01_op_t02=frame_arms_girl_season_01_clean_op_02
frame_arms_girl_season_01_op_t03=frame_arms_girl_season_01_clean_op_03
frame_arms_girl_season_01_op_t04=TRIM_MIDDLE_CLIP(frame_arms_girl_season_01_03_stylet_and_gourai_evade_water,71)+TRIM_FIRST_CLIP(frame_arms_girl_season_01_01_baselard_fall_down_from_box,50)+TRIM_FIRST_CLIP(frame_arms_girl_season_01_04_jinrai_break_curtain,25+24)+TRIM_MIDDLE_CLIP(frame_arms_girl_season_01_04_jinrai_hide_after_nin_word,43)+TRIM_FIRST_CLIP(frame_arms_girl_season_01_12_hresvelgr_ater_fall_down,35) \
	+TRIM_MIDDLE_CLIP(frame_arms_girl_season_01_05_frame_arms_girls_on_robot_cleaner,79)+TRIM_MIDDLE_CLIP(frame_arms_girl_season_01_09_ao_see_frame_arms_girls_happy,50)+TRIM_MIDDLE_CLIP(frame_arms_girl_season_01_10_charging_kun_pull_red_session_base,20)+TRIM_LAST_CLIP(frame_arms_girl_season_01_05_architect_raise_vinegar,48)+TRIM_MIDDLE_CLIP(frame_arms_girl_season_01_01_gourai_open_album,65)
frame_arms_girl_season_01_op_t05=TRIM_FIRST_CLIP(frame_arms_girl_season_01_11_hresvelgr_ater_punch_gourai_kai_01,56)+TRIM_LAST_CLIP(frame_arms_girl_season_01_07_ao_stop_gourai_punch,23)+TRIM_MIDDLE_CLIP(frame_arms_girl_season_01_10_gourai_see_moon,47) \
	+TRIM_MIDDLE_CLIP(frame_arms_girl_season_01_05_architect_appear,52)+TRIM_FIRST_CLIP(frame_arms_girl_season_01_06_nipako_bow_to_stylet_gourai_architect_jinrai,23)+TRIM_MIDDLE_CLIP(frame_arms_girl_season_01_12_hresvelgr_ater_confused,46) \
	+TRIM_MIDDLE_CLIP(frame_arms_girl_season_01_10_hresvelgr_evade_gourai_kai_s_shoot,25)+TRIM_LAST_CLIP(frame_arms_girl_season_01_01_gourai_u_turn,34)+TRIM_FIRST_CLIP(frame_arms_girl_season_01_02_gourai_fire_smoothbore,16)+TRIM_LAST_CLIP(frame_arms_girl_season_01_05_gourai_circle_throw_jinrai,19)+TRIM_FIRST_CLIP(frame_arms_girl_season_01_05_gourai_take_violence_ram,62)+TRIM_MIDDLE_CLIP(frame_arms_girl_season_01_06_ao_and_frame_arms_girls_see_fireworks,55)

frame_arms_girl_season_01_op_t06=TRIM_FIRST_CLIP(frame_arms_girl_season_01_02_baselard_take_chopstick_and_knock_bowl,127)+FADE_OUT_WITH_BRIGHTNESS_OFFSET(TRIM_LAST_CLIP(frame_arms_girl_season_01_01_ao_watch_gourai_and_exciting,120),fade_length)

frame_arms_girl_season_01_op_t07=TRIM_MIDDLE_CLIP(frame_arms_girl_season_01_08_shouwa_memorial_park_fountain,16)+TRIM_MIDDLE_CLIP(frame_arms_girl_season_01_09_frame_arms_girls_meeting_01,17)+TRIM_MIDDLE_CLIP(frame_arms_girl_season_01_12_ao_and_frame_arms_girls_celebrate_christmas,15)+TRIM_MIDDLE_CLIP(frame_arms_girl_season_01_01_stylet_attack_gourai,31)+TRIM_FIRST_CLIP(frame_arms_girl_season_01_04_ao_chase_frame_arms_girls,42) \
	+TRIM_LAST_CLIP(frame_arms_girl_season_01_02_baselard_catch_uncontrollable_robot_cleaner_02,51)+TRIM_FIRST_CLIP(frame_arms_girl_season_01_11_hresvelgr_fly_away,72)+TRIM_MIDDLE_CLIP(frame_arms_girl_season_01_07_bukiko_hold_gourai_box,5)+TRIM_MIDDLE_CLIP(frame_arms_girl_season_01_08_ao_s_mother_and_father,8) \
	+TRIM_FIRST_CLIP(frame_arms_girl_season_01_11_income_notification,13)+Trim(frame_arms_girl_season_01_10_stylet_surrounded_by_loach,31-(14/2),-14)+TRIM_LAST_CLIP(frame_arms_girl_season_01_02_stylet_pour_out_rice_on_her_head,41)+TRIM_MIDDLE_CLIP(frame_arms_girl_season_01_09_frame_arms_girls_surprised,52) \
	+TRIM_LAST_CLIP(frame_arms_girl_season_01_07_many_drones,48)+TRIM_MIDDLE_CLIP(frame_arms_girl_season_01_06_ao_wear_yukata,76)
frame_arms_girl_season_01_op_t08=TRIM_MIDDLE_CLIP(frame_arms_girl_season_01_10_jinrai_as_ashita_no_jou,33)+TRIM_LAST_CLIP(frame_arms_girl_season_01_11_ao_appear_in_video,39)+TRIM_LAST_CLIP(frame_arms_girl_season_01_07_baselard_ride_robot_cleaner_and_hit_cartons,45)+Trim(frame_arms_girl_season_01_06_bukiko_apply_color_to_tank_model,110-(21/2),-21) \
	+TRIM_MIDDLE_CLIP(frame_arms_girl_season_01_11_frame_arms_girls_in_onsen,61)+TRIM_MIDDLE_CLIP(frame_arms_girl_season_01_08_ao_and_gourai_talk_in_shouwa_memorial_park,29)+TRIM_FIRST_CLIP(frame_arms_girl_season_01_04_jinrai_s_charging_kun_see_park,22)+TRIM_MIDDLE_CLIP(frame_arms_girl_season_01_01_stylet_fly_left_and_right,29)+FADE_OUT_WITH_BRIGHTNESS_OFFSET(TRIM_MIDDLE_CLIP(frame_arms_girl_season_01_08_hresvelgr_fire,29),fade_length)
frame_arms_girl_season_01_op_t09=frame_arms_girl_season_01_clean_op_04
frame_arms_girl_season_01_op_t10=TRIM_FIRST_CLIP(frame_arms_girl_season_01_07_hresvelgr_fire_01,56)+TRIM_MIDDLE_CLIP(frame_arms_girl_season_01_10_hresvelgr_pole_vault_to_ao,23)+TRIM_MIDDLE_CLIP(frame_arms_girl_season_01_06_gourai_stylet_architect_jinrai_pop_head,47) \
	+TRIM_MIDDLE_CLIP(frame_arms_girl_season_01_07_gourai_embarassed,52)+TRIM_LAST_CLIP(frame_arms_girl_season_01_12_ao_fall_down,23)+TRIM_LAST_CLIP(frame_arms_girl_season_01_12_gourai_cry_02,46) \
	+TRIM_MIDDLE_CLIP(frame_arms_girl_season_01_03_materia_white_s_leg,25)+TRIM_MIDDLE_CLIP(frame_arms_girl_season_01_03_materia_black_s_leg,34)+TRIM_MIDDLE_CLIP(frame_arms_girl_season_01_08_ao_and_gourai_under_tree_02,16)+TRIM_MIDDLE_CLIP(frame_arms_girl_season_01_06_ao_feel_itchy,19)+TRIM_LAST_CLIP(frame_arms_girl_season_01_02_stylet_fly_in_room,62)+TRIM_LAST_CLIP(frame_arms_girl_season_01_09_gourai_feed_ao,55)

frame_arms_girl_season_01_op_t11=TRIM_FIRST_CLIP(kotobuki_nipper_pip,127)+TRIM_MIDDLE_CLIP(frame_arms_girl_season_01_09_stylet_and_baselard_make_medicine,126)
frame_arms_girl_season_01_op_t12=TRIM_FIRST_CLIP(frame_arms_girl_season_01_08_hresvelgr_wield,127)+TRIM_MIDDLE_CLIP(frame_arms_girl_season_01_12_frame_arms_girls_listen_architect_sing,126)+TRIM_MIDDLE_CLIP(frame_arms_girl_season_01_10_hresvelgr_and_gourai_kai_fighting,127)+TRIM_FIRST_CLIP(frame_arms_girl_season_01_11_gourai_memory,126)
frame_arms_girl_season_01_op_t13=TRIM_FIRST_CLIP(frame_arms_girl_season_01_11_hresvelgr_ater_fire,126)+TRIM_MIDDLE_CLIP(frame_arms_girl_season_01_03_bukiko_jump_to_table,127)+TRIM_MIDDLE_CLIP(frame_arms_girl_season_01_12_gourai_kai_full_armor_versus_hresvelgr_ater_in_front_of_earth,111) \
	+TRIM_MIDDLE_CLIP(frame_arms_girl_season_01_05_architect_disappear,63)+TRIM_FIRST_CLIP(frame_arms_girl_season_01_02_gourai_see_explosion,59)+TRIM_MIDDLE_CLIP(frame_arms_girl_season_01_03_stylet_chase_baselard,84)+FADE_OUT_WITH_BRIGHTNESS_OFFSET(TRIM_MIDDLE_CLIP(frame_arms_girl_season_01_01_ao_watch_session,43),fade_length)

frame_arms_girl_season_01_op_t14=TRIM_FIRST_CLIP(frame_arms_girl_season_01_07_hresvelgr_ready_to_finish_gourai,71)+TRIM_FIRST_CLIP(frame_arms_girl_season_01_12_frame_arms_girls_ricocheted,50)+TRIM_MIDDLE_CLIP(frame_arms_girl_season_01_01_stylet_shoot_gourai_02,25)+TRIM_MIDDLE_CLIP(frame_arms_girl_season_01_03_materia_white_wield,24)+TRIM_FIRST_CLIP(frame_arms_girl_season_01_03_materia_black_throw,43)+TRIM_MIDDLE_CLIP(frame_arms_girl_season_01_04_jinrai_shadow_clone_and_move_forward,35) \
	+TRIM_MIDDLE_CLIP(frame_arms_girl_season_01_03_materia_black_and_white_attack_gourai_and_stylet,79)+TRIM_LAST_CLIP(frame_arms_girl_season_01_09_architect_gourai_kai_jinrai_ride_robot_cleaner,50)+TRIM_LAST_CLIP(frame_arms_girl_season_01_04_jinrai_fast_move,20)+TRIM_FIRST_CLIP(frame_arms_girl_season_01_10_gourai_fire,48)+TRIM_LAST_CLIP(frame_arms_girl_season_01_08_gourai_kai_move,65)
frame_arms_girl_season_01_op_t15=frame_arms_girl_season_01_clean_op_05+frame_arms_girl_season_01_clean_op_06+FADE_OUT_WITH_BRIGHTNESS_OFFSET(Trim(frame_arms_girl_season_01_12_gourai_kai_full_armor_01,10,-(55+135)),5)
frame_arms_girl_season_01_op_t16=frame_arms_girl_season_01_clean_op_07+BlankClip(frame_arms_girl_season_01_clean_op,length=24*2,color=color_black)



#frame_arms_girl_season_01_op_t04=Merge(frame_arms_girl_season_01_op_t04,frame_arms_girl_season_01_clean_op_04)
#frame_arms_girl_season_01_op_t05=Merge(frame_arms_girl_season_01_op_t05,frame_arms_girl_season_01_clean_op_05+frame_arms_girl_season_01_clean_op_06+BlankClip(frame_arms_girl_season_01_clean_op,length=55,color=color_red))
#frame_arms_girl_season_01_op_t07=Merge(frame_arms_girl_season_01_op_t07,frame_arms_girl_season_01_clean_op_02)
#frame_arms_girl_season_01_op_t08=Merge(frame_arms_girl_season_01_op_t08,frame_arms_girl_season_01_clean_op_03)
#frame_arms_girl_season_01_op_t10=Merge(frame_arms_girl_season_01_op_t10,frame_arms_girl_season_01_clean_op_05+frame_arms_girl_season_01_clean_op_06+BlankClip(frame_arms_girl_season_01_clean_op,length=55,color=color_red))
#frame_arms_girl_season_01_op_t14=Merge(frame_arms_girl_season_01_op_t14,frame_arms_girl_season_01_clean_op_04)



frame_arms_girl_season_01_op_mute=frame_arms_girl_season_01_op_t01+frame_arms_girl_season_01_op_t02+frame_arms_girl_season_01_op_t03+frame_arms_girl_season_01_op_t04+frame_arms_girl_season_01_op_t05 \
	+frame_arms_girl_season_01_op_t06+frame_arms_girl_season_01_op_t07+frame_arms_girl_season_01_op_t08+frame_arms_girl_season_01_op_t09+frame_arms_girl_season_01_op_t10 \
	+frame_arms_girl_season_01_op_t11+frame_arms_girl_season_01_op_t12+frame_arms_girl_season_01_op_t13 \
	+frame_arms_girl_season_01_op_t14+frame_arms_girl_season_01_op_t15+frame_arms_girl_season_01_op_t16

frame_arms_girl_season_01_op_mute

### export clip: frame_arms_girl_season_01_op_mute,frame_arms_girl_season_01_clean_op_01_00

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
global subtitle_text_color=color_hotpink
global subtitle_halo_color=color_white
global subtitle_outside_halo_color=color_black

function SUBTITLE_FX(clip clip,string text,float x,float y,int start_frame,int end_frame,bool "is_furigana",bool "is_title"){
	is_title=Default(is_title,false)
	is_furigana=Default(is_furigana,false)

	text_color=is_title?OVERWRITE_SUBTITLE_COLOR_ALPHA(subtitle_text_color,$C0):subtitle_text_color

	subtitle_mode=is_furigana?"ex":"ex_thick_reduce_memory"
	size=is_furigana?subtitle_size*0.5:subtitle_size
	y=is_furigana?y-size:y

	return SUBTITLE_FX_FADE_IN_FADE_OUT_DOUBLE_HALO(clip,text,Round(x),Round(y),start_frame,end_frame,subtitle_front_fade_count,subtitle_rear_fade_count,subtitle_font,subtitle_effects,Round(size),text_color,subtitle_halo_color,subtitle_outside_halo_color,subtitle_mode)
}

function SUBTITLE_N(clip clip,string text,int y,int start_frame,int end_frame,bool "is_title"){
	is_title=Default(is_title,false)

	x=subtitle_clip_width/2
	fade_count=1

	text_color=is_title?OVERWRITE_SUBTITLE_COLOR_ALPHA(subtitle_text_color,$C0):subtitle_text_color

	return SUBTITLE_FX_FADE_IN_FADE_OUT_DOUBLE_HALO(clip,text,x,y,start_frame,end_frame,fade_count,fade_count,subtitle_font,subtitle_effects+"c",Round(subtitle_size),text_color,subtitle_halo_color,subtitle_outside_halo_color,"ex_thick_reduce_memory")
}

### inherit end ###

ConvertToRGB32(matrix="Rec709")

SUBTITLE_FX("Tiny Tiny//村川梨衣|- by fielia@AVISynth",-subtitle_x,subtitle_y-subtitle_size,72,198,is_title=true)
#SUBTITLE_FX("Tiny Tiny//村川梨衣|- by fielia@AVISynth",-subtitle_x,subtitle_y-subtitle_size,6521,6684,is_title=true)

SUBTITLE_FX("きらきらきら　輝きを見逃さないで",subtitle_x,subtitle_y-subtitle_size,251,365)
SUBTITLE_FX("あなたのそばに　いつもいるよ",subtitle_x,subtitle_y,374,478)
SUBTITLE_FX("それってきっとね　考え方次第なんだ",subtitle_x,subtitle_y-subtitle_size,503,618)
SUBTITLE_FX("探すんじゃなくて　気づけばいいんだよ",subtitle_x,subtitle_y,625,728)

SUBTITLE_FX("「当たり前」の裏側に　隠れてる「優しさ」",subtitle_x,subtitle_y-subtitle_size,752,883)
SUBTITLE_FX("毎日を彩る光",subtitle_x,subtitle_y,886,1022)

SUBTITLE_FX("                                 かけら",subtitle_x,subtitle_y-subtitle_size,1061,1179,true)
SUBTITLE_FX("Tiny Days 奇跡の欠片で",subtitle_x,subtitle_y-subtitle_size,1061,1179)
SUBTITLE_FX("Tiny Days 世界はできてる",subtitle_x,subtitle_y,1187,1306)
SUBTITLE_FX("無意味に見えたものに　あなたもわたしも",subtitle_x,subtitle_y-subtitle_size,1308,1439)
SUBTITLE_FX("守られていたり　知らずに愛されてるの",subtitle_x,subtitle_y,1436,1566)
SUBTITLE_FX("Tiny Heart 溢れだす想い",subtitle_x,subtitle_y-subtitle_size,1567,1686)
SUBTITLE_FX("Tiny Heart すべてにありがとう",subtitle_x,subtitle_y,1693,1811)
SUBTITLE_FX("いつまでもいつまでも　忘れたりしない",subtitle_x,subtitle_y-subtitle_size,1815,1945)
SUBTITLE_FX("この気持ち　大切にずっと",subtitle_x,subtitle_y,1946,2097)

SUBTITLE_FX("きらきらきら　輝きに気づいた時",subtitle_x,subtitle_y-subtitle_size,2274,2389)
SUBTITLE_FX("切なくなったの　どうしてだろう？",subtitle_x,subtitle_y,2395,2504)
SUBTITLE_FX("それってきっとね　儚さを知ったからなんだ",subtitle_x,subtitle_y-subtitle_size,2526,2642)
SUBTITLE_FX("また　少しだけ　大人になったよ",subtitle_x,subtitle_y,2648,2751)

SUBTITLE_FX("当たり前のものなんて　何ひとつないから",subtitle_x,subtitle_y-subtitle_size,2776,2908)
SUBTITLE_FX("全部が特別の一部",subtitle_x,subtitle_y,2909,3044)

### pass clip: frame_arms_girl_season_01_op_mute,frame_arms_girl_season_01_clean_op_01_00

### prefetch: 5,2

### ###

SUBTITLE_FX("Tiny Days 奇跡に抱かれて",subtitle_x,subtitle_y-subtitle_size,3084,3202)
SUBTITLE_FX("Tiny Days 誰もが生きてる",subtitle_x,subtitle_y,3211,3329)
SUBTITLE_FX("永遠じゃないことが　教えてくれたの",subtitle_x,subtitle_y-subtitle_size,3333,3462)
SUBTITLE_FX("勇気と弱さを　強さに変えてゆくこと",subtitle_x,subtitle_y,3459,3590)
SUBTITLE_FX("Tiny Heart 幸せの場所は",subtitle_x,subtitle_y-subtitle_size,3591,3708)
SUBTITLE_FX("Tiny Heart ココロが知ってる",subtitle_x,subtitle_y,3716,3837)
SUBTITLE_FX("どこまでもどこまでも　続いてる道を",subtitle_x,subtitle_y-subtitle_size,3839,3969)
SUBTITLE_FX("歩いてく　まっすぐにずっと",subtitle_x,subtitle_y,3970,4121)

SUBTITLE_FX("都会の空見上げて",subtitle_x,subtitle_y-subtitle_size,4807,4870)
SUBTITLE_FX("まばらな星数えて",subtitle_x,subtitle_y,4869,4932)
SUBTITLE_FX("さみしく思う時もあるね",subtitle_x,subtitle_y-subtitle_size,4931,5033)
SUBTITLE_FX("でも目に見えないだけ",subtitle_x,subtitle_y,5060,5120)
SUBTITLE_FX("そこにいるよ",subtitle_x,subtitle_y-subtitle_size,5114,5169)
SUBTITLE_FX("遠くから届く　輝きは...",subtitle_x,subtitle_y,5171,5392)

SUBTITLE_FX("                                 かけら",subtitle_x,subtitle_y-subtitle_size,5423,5542,true)
SUBTITLE_FX("Tiny Days 奇跡の欠片で",subtitle_x,subtitle_y-subtitle_size,5423,5542)
SUBTITLE_FX("Tiny Days 世界はできてる",subtitle_x,subtitle_y,5549,5671)
SUBTITLE_FX("無意味に見えたものに　あなたも　わたしも",subtitle_x,subtitle_y-subtitle_size,5671,5800)
SUBTITLE_FX("守られていたり　知らずに愛されてるの",subtitle_x,subtitle_y,5798,5932)
SUBTITLE_FX("Tiny... 溢れ出す想い",subtitle_x,subtitle_y-subtitle_size,5929,6051)
SUBTITLE_FX("Tiny Heart　すべてにありがとう",subtitle_x,subtitle_y,6056,6176)
SUBTITLE_FX("いつまでもいつまでも　忘れたりしない",subtitle_x,subtitle_y-subtitle_size,6179,6308)
SUBTITLE_FX("この気持ち　大切にずっと",subtitle_x,subtitle_y,6309,6461)

######## Postface ########

Import("frame_arms_girl-season_01-common-cross_process.avsi")

ao_talk_nonsense_audio=FadeIn0(FadeOut0(Normalize(frame_arms_girl_season_01_02_ao_talk_nonsense),3),3)
ao_talk_nonsense=AudioDub(frame_arms_girl_season_01_02_ao_talk_nonsense,ao_talk_nonsense_audio)

ao_talk_nonsense=ConvertToRGB32(ao_talk_nonsense,matrix="Rec709")
ao_talk_nonsense=SUBTITLE_N(ao_talk_nonsense,"不 不 不",Round(subtitle_y),4,29)
ao_talk_nonsense=SUBTITLE_N(ao_talk_nonsense,"這樣的觀念是不對的",Round(subtitle_y),33,122)
ao_talk_nonsense=SUBTITLE_N(ao_talk_nonsense,"不要太看重得與失",Round(subtitle_y),129,170)
ao_talk_nonsense=SUBTITLE_N(ao_talk_nonsense,"而是要享受這個過程",Round(subtitle_y),179,242)

######## Thumbnail ########

is_thumbnail=false

is_thumbnail?ConvertToRGB32(frame_arms_girl_season_01_op_mute,matrix="Rec709"):last

######## Music ########

bgm_48khz=SSRC(WAVSource("src\frame_arms_girl-season_01-op-01.wav"),48000)
AudioDub(bgm_48khz)



thumbnail=Trim(914,-24*5)
#thumbnail=Trim(6530,-24*5)



AUDIO_DUB_TONE(ConvertToRGB32(frame_arms_girl_season_01_clean_op_01_00,matrix="Rec709"),samplerate=48000,channels=2,type="Silence")++Trim(last,0,6710)++ao_talk_nonsense



is_thumbnail?thumbnail:last

""")

######## Post Processing ########

ConvertToYV12(matrix="Rec709")
#ConvertToYUY2(matrix="Rec709")
#ConvertToRGB24()

#ConvertAudioTo8bit()
#ConvertAudioTo16bit()
ConvertAudioTo24bit()
#ConvertAudioTo32bit()
#ConvertAudioToFloat()

TCPServer()
