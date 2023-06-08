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

######## Pre Combine ########

fade_length=12

file_clip_01_a=TRIM_FIRST_CLIP(lycoris_recoil_04_takina_wear_clothes_01,18)
file_clip_01_b=TRIM_FIRST_CLIP(lycoris_recoil_04_takina_wear_clothes_02,18)
file_clip_01_c=TRIM_FIRST_CLIP(lycoris_recoil_04_takina_wear_clothes_03,18)
file_01=Trim(file_clip_01_a,0,-9)+Trim(file_clip_01_b,0,-9)+Trim(file_clip_01_c,0,-9) \
	+FAST_ZOOM(Trim(file_clip_01_a,9,-9)+Trim(file_clip_01_b,9,-9)+Trim(file_clip_01_c,9,-8),factor=2.0)

file_clip_02_a=TRIM_FIRST_CLIP(lycoris_recoil_03_chisato_hug_takina_and_turn_03,27)
file_clip_02_b=TRIM_FIRST_CLIP(lycoris_recoil_03_chisato_hug_takina_and_turn_02,27)
file_02=Trim(file_clip_02_a,0,-9)+Trim(file_clip_02_b,0,-9)+Trim(file_clip_02_a,9,-9) \
	+Trim(file_clip_02_b,9,-9)+Trim(file_clip_02_a,9+9,-9)+Trim(file_clip_02_b,9+9,-8)

cross_clip_01_a=TRIM_MIDDLE_CLIP(lycoris_recoil_09_chisato_take_photo,68)
cross_clip_01_b=TRIM_MIDDLE_CLIP(lycoris_recoil_09_chisato_see_camera,51)
cross_01=Trim(cross_clip_01_a,0,-12)+Trim(cross_clip_01_b,0,-12) \
	+Trim(cross_clip_01_a,12,-12)+Trim(cross_clip_01_b,12,-12) \
	+Trim(cross_clip_01_a,12+12,-12)+Trim(cross_clip_01_b,12+12,-12) \
	+Trim(cross_clip_01_a,12+12+12,-16)+Trim(cross_clip_01_b,12+12+12,-15) \
	+Trim(cross_clip_01_a,12+12+12+16,-16)

cross_clip_02_a=TRIM_FIRST_CLIP(lycoris_recoil_09_takina_see_sunset,68)
cross_clip_02_b=TRIM_FIRST_CLIP(lycoris_recoil_12_erika_shake_head,51)
cross_02=Trim(cross_clip_02_a,0,-12)+Trim(cross_clip_02_b,0,-12) \
	+Trim(cross_clip_02_a,12,-12)+Trim(cross_clip_02_b,12,-12) \
	+Trim(cross_clip_02_a,12+12,-12)+Trim(cross_clip_02_b,12+12,-12) \
	+Trim(cross_clip_02_a,12+12+12,-16)+Trim(cross_clip_02_b,12+12+12,-15) \
	+Trim(cross_clip_02_a,12+12+12+16,-16)

######## Combine ########

# lycoris_recoil_clean_op_01    -8
# lycoris_recoil_clean_op_02    195/1871
# lycoris_recoil_clean_op_03    453/2129
# lycoris_recoil_clean_op_04    1044/2720/4063
# lycoris_recoil_clean_op_05    4821



op_music_start=8

lycoris_recoil_clean_op_01_00=Trim(lycoris_recoil_clean_op_01,0,op_music_start-1)
lycoris_recoil_clean_op_01_01=Trim(lycoris_recoil_clean_op_01,op_music_start,0)

lycoris_recoil_op_t00=lycoris_recoil_02

lycoris_recoil_op_t01=lycoris_recoil_clean_op_01_01+lycoris_recoil_clean_op_02+lycoris_recoil_clean_op_03
lycoris_recoil_op_t021=lycoris_recoil_clean_op_04
lycoris_recoil_op_t02=TRIM_FIRST_CLIP(lycoris_recoil_06_majima_and_guys,61)+TRIM_FIRST_CLIP(lycoris_recoil_02_takina_shoot_drone_03,65)+TRIM_FIRST_CLIP(lycoris_recoil_11_chisato_catch_and_wrestle_majima,41)+TRIM_MIDDLE_CLIP(lycoris_recoil_01_lycoris,36)+TRIM_FIRST_CLIP(lycoris_recoil_05_chisato_shoot_at_zero_distance,20+30) \
	+TRIM_FIRST_CLIP(lycoris_recoil_11_takina_see_radio_tower_and_run,24)+TRIM_FIRST_CLIP(lycoris_recoil_08_little_chisato_dash_and_shoot,18)+TRIM_FIRST_CLIP(lycoris_recoil_01_chisato_dodge_bullet,56) \
	+file_01 \
	+TRIM_MIDDLE_CLIP(lycoris_recoil_11_majima_02,36)+TRIM_MIDDLE_CLIP(lycoris_recoil_11_majima_01,35)+TRIM_FIRST_CLIP(lycoris_recoil_10_mika_and_chisato_take_weapon_and_go,37) \
	+cross_01 \
	+TRIM_FIRST_CLIP(lycoris_recoil_09_takina_see_chisato_in_snow,94)+TRIM_MIDDLE_CLIP(lycoris_recoil_03_bullet_01,17)+TRIM_MIDDLE_CLIP(lycoris_recoil_03_bullet_02,16) \
	+TRIM_MIDDLE_CLIP(lycoris_recoil_07_lycoreco_cafe,69)

lycoris_recoil_op_t031=lycoris_recoil_clean_op_02
lycoris_recoil_op_t03=TRIM_FIRST_CLIP(lycoris_recoil_04_bird_in_sky,60+33+34)+FADE_OUT_WITH_BRIGHTNESS_OFFSET(TRIM_LAST_CLIP(lycoris_recoil_08_chisato_embarassing_and_takina_laugh,131),fade_length)

lycoris_recoil_op_t041=lycoris_recoil_clean_op_03
lycoris_recoil_op_t04=TRIM_FIRST_CLIP(lycoris_recoil_06_chisato_see_takina_yoshi,72)+TRIM_MIDDLE_CLIP(lycoris_recoil_08_takina_see_shit,24)+TRIM_FIRST_CLIP(lycoris_recoil_04_takina_sakana,32) \
	+TRIM_LAST_CLIP(lycoris_recoil_10_chisato_wear_wafuku_02,75)+TRIM_FIRST_CLIP(lycoris_recoil_04_chisato_lift_skirt_and_see_takina_s_pantie,20)+TRIM_MIDDLE_CLIP(lycoris_recoil_08_chisato_handstand,40) \
	+TRIM_LAST_CLIP(lycoris_recoil_05_chisato_run_jump_and_shoot,133)+TRIM_FIRST_CLIP(lycoris_recoil_11_vibration_analysis,165) \
	+TRIM_FIRST_CLIP(lycoris_recoil_10_chisato_wear_wafuku_01,12)+TRIM_FIRST_CLIP(lycoris_recoil_13_chisato_in_farm,9)+TRIM_FIRST_CLIP(lycoris_recoil_13_chisato_see_lake_on_ship,9)

lycoris_recoil_op_t051=lycoris_recoil_clean_op_04
lycoris_recoil_op_t05=TRIM_FIRST_CLIP(lycoris_recoil_07_takina_hit_chisato_s_ass,61)+TRIM_MIDDLE_CLIP(lycoris_recoil_02_mizuki_drink_beer,65)+TRIM_FIRST_CLIP(lycoris_recoil_01_chisato_ride_vespa_03,41)+TRIM_FIRST_CLIP(lycoris_recoil_12_kurumi_swimming_in_vr,36)+TRIM_FIRST_CLIP(lycoris_recoil_05_kurumi_throw_drone,20+30)\
	+TRIM_FIRST_CLIP(lycoris_recoil_06_kurumi_roll_down,24)+TRIM_FIRST_CLIP(lycoris_recoil_07_chisato_mission_start_02,18)+TRIM_FIRST_CLIP(lycoris_recoil_03_chisato_hug_takina_and_turn_01,56) \
	+file_02 \
	+TRIM_FIRST_CLIP(lycoris_recoil_05_takina_lie_on_chisato_s_breast,36)+TRIM_LAST_CLIP(lycoris_recoil_01_chisato_and_others_selfie,35)+TRIM_FIRST_CLIP(lycoris_recoil_03_takina_shoot_target,37) \
	+cross_02 \
	+TRIM_FIRST_CLIP(lycoris_recoil_07_shinji_close_to_mika_01,72)

lycoris_recoil_op_t06=FADE_OUT_WITH_BRIGHTNESS_OFFSET(TRIM_LAST_CLIP(lycoris_recoil_13_chisato_hug_takina_on_beach,128+128),fade_length) \
	+FADE_IN_WITH_BRIGHTNESS_OFFSET(TRIM_MIDDLE_CLIP(lycoris_recoil_13_mika_kill_shinji,127),fade_length)+TRIM_MIDDLE_CLIP(lycoris_recoil_12_chisato_stop_and_hug_takina,128) \
	+TRIM_LAST_CLIP(lycoris_recoil_02_walnut_and_robota_in_vr,103+26)

lycoris_recoil_op_t07=lycoris_recoil_clean_op_04+lycoris_recoil_clean_op_05+BlankClip(lycoris_recoil_clean_op,length=24*5,color=color_black)



lycoris_recoil_op_mute=lycoris_recoil_op_t01+lycoris_recoil_op_t02+lycoris_recoil_op_t03+lycoris_recoil_op_t04+lycoris_recoil_op_t05+lycoris_recoil_op_t06+lycoris_recoil_op_t07

lycoris_recoil_op_mute

### export clip: lycoris_recoil_op_mute,lycoris_recoil_clean_op_01_00

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
global subtitle_size=30*2.25
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

SUBTITLE_FX("ALIVE//ClariS - by fielia@AVISynth",-subtitle_x,subtitle_x,263,422,is_title=true)

SUBTITLE_FX("ねが          ゆうかん    せんたく       み らい    いま て",subtitle_x,subtitle_y,37,263,true)
SUBTITLE_FX("願った 勇敢な選択の 未来を今照らしてく",subtitle_x,subtitle_y,37,263)

SUBTITLE_FX(" り  こ てき   かんじょう                                              み",subtitle_x,subtitle_y-subtitle_size*2,447,580,true)
SUBTITLE_FX("利己的な感情 ぶつけあっちゃ (まだ) 見えないね",subtitle_x,subtitle_y-subtitle_size*2,447,580)
SUBTITLE_FX(" に          き     ぶん    きょ り      う                         たび     で",subtitle_x,subtitle_y,580,717,true)
SUBTITLE_FX("逃げて来た分の距離を埋める (ほら) 旅に出よう",subtitle_x,subtitle_y,580,717)

SUBTITLE_FX("さい は                    み",subtitle_x,subtitle_y-subtitle_size*2,718,851,true)
SUBTITLE_FX("最果てなんて 見られなくても",subtitle_x,subtitle_y-subtitle_size*2,718,851)
SUBTITLE_FX(" いのち    も             いま     い",subtitle_x,subtitle_y,850,1009,true)
SUBTITLE_FX(" 命を燃やして今を生きていくだけだから",subtitle_x,subtitle_y,850,1009)

SUBTITLE_FX("ねが          そんざい   しょうめい",subtitle_x,subtitle_y-subtitle_size*2,1013,1099,true)
SUBTITLE_FX("願った 存在の証明を",subtitle_x,subtitle_y-subtitle_size*2,1013,1099)
SUBTITLE_FX("こえ    ふる        つづ           ふ",subtitle_x,subtitle_y,1100,1288,true)
SUBTITLE_FX("声を震わせ続けて 振りかざしてきたから",subtitle_x,subtitle_y,1100,1288)
SUBTITLE_FX("こうかい     い                て      と      あ             くら     か  こ",subtitle_x,subtitle_y-subtitle_size*2,1292,1450,true)
SUBTITLE_FX("後悔は要らない 手を取り合って (暗い過去だって)",subtitle_x,subtitle_y-subtitle_size*2,1292,1450)
SUBTITLE_FX(" う      と         すす",subtitle_x,subtitle_y,1443,1545,true)
SUBTITLE_FX("受け止めて進んでいく",subtitle_x,subtitle_y,1443,1545)
SUBTITLE_FX("しめ            こた    えら",subtitle_x,subtitle_y-subtitle_size*2,1545,1668,true)
SUBTITLE_FX("示された答え選ぶより",subtitle_x,subtitle_y-subtitle_size*2,1545,1668)
SUBTITLE_FX(" あたら       ゆめ     め  ざ",subtitle_x,subtitle_y,1667,1804,true)
SUBTITLE_FX(" 新しい夢を目指すから (ずっと)",subtitle_x,subtitle_y,1667,1804)
SUBTITLE_FX("まぶ        みち    ある",subtitle_x,subtitle_y-subtitle_size*2,1795,1942,true)
SUBTITLE_FX("眩しい道を歩いていこう",subtitle_x,subtitle_y-subtitle_size*2,1795,1942)

### pass clip: lycoris_recoil_op_mute,lycoris_recoil_clean_op_01_00

### prefetch: 5,2

### ###

SUBTITLE_FX("                 ひ         みち                                    ゆめ",subtitle_x,subtitle_y,2122,2255,true)
SUBTITLE_FX("リスクを秘めた道にだって (きっと) 夢はある",subtitle_x,subtitle_y,2122,2255)
SUBTITLE_FX(" ふたり                  か のうせい                     み",subtitle_x,subtitle_y-subtitle_size*2,2255,2395,true)
SUBTITLE_FX("二人しかない可能性を (ほら) 見つけよう",subtitle_x,subtitle_y-subtitle_size*2,2255,2395)

SUBTITLE_FX("さい は                   いま     み",subtitle_x,subtitle_y,2393,2525,true)
SUBTITLE_FX("最果てよりも 今を見つめて",subtitle_x,subtitle_y,2393,2525)
SUBTITLE_FX("            けつまつ             か",subtitle_x,subtitle_y-subtitle_size*2,2527,2687,true)
SUBTITLE_FX("どんな結末もまだ変えていけるはずだから",subtitle_x,subtitle_y-subtitle_size*2,2527,2687)

SUBTITLE_FX("ちか          そんざい   しょうめい",subtitle_x,subtitle_y,2686,2777,true)
SUBTITLE_FX("誓った 存在の証明を",subtitle_x,subtitle_y,2686,2777)
SUBTITLE_FX(" ひとり      み             そら       む  だ                      し",subtitle_x,subtitle_y-subtitle_size*2,2775,2966,true)
SUBTITLE_FX("一人で見てきた空も 無駄じゃないと知ったから",subtitle_x,subtitle_y-subtitle_size*2,2775,2966)
SUBTITLE_FX("かんたん                               て      と      あ             とお     み らい",subtitle_x,subtitle_y,2968,3129,true)
SUBTITLE_FX("簡単じゃなくていい 手を取り合って (遠い未来だって)",subtitle_x,subtitle_y,2968,3129)
SUBTITLE_FX(" う      と         すす",subtitle_x,subtitle_y-subtitle_size*2,3120,3222,true)
SUBTITLE_FX("受け止めて進んでいく",subtitle_x,subtitle_y-subtitle_size*2,3120,3222)
SUBTITLE_FX("しめ            こた    えら",subtitle_x,subtitle_y,3222,3343,true)
SUBTITLE_FX("示された答え選ぶより",subtitle_x,subtitle_y,3222,3343)
SUBTITLE_FX("まぶ        みち    ある",subtitle_x,subtitle_y-subtitle_size*2,3342,3517,true)
SUBTITLE_FX("眩しい道を歩いていこう",subtitle_x,subtitle_y-subtitle_size*2,3342,3517)

### pass clip: lycoris_recoil_op_mute,lycoris_recoil_clean_op_01_00

### prefetch: 5,2

### ###

SUBTITLE_FX(" ふ  が  い              な           つめ        かぜ    よる",subtitle_x,subtitle_y,3670,3799,true)
SUBTITLE_FX("不甲斐なくて泣いた 冷たい風の夜",subtitle_x,subtitle_y,3670,3799)
SUBTITLE_FX("        つよ                        ねが",subtitle_x,subtitle_y-subtitle_size*2,3800,3935,true)
SUBTITLE_FX("ただ強くなりたいと願った",subtitle_x,subtitle_y-subtitle_size*2,3800,3935)

SUBTITLE_FX("そんざい   しょうめい",subtitle_x,subtitle_y,4053,4117,true)
SUBTITLE_FX("存在の証明を",subtitle_x,subtitle_y,4053,4117)
SUBTITLE_FX("こえ    ふる        つづ           ふ",subtitle_x,subtitle_y-subtitle_size*2,4119,4308,true)
SUBTITLE_FX("声を震わせ続けて 振りかざしてきたから",subtitle_x,subtitle_y-subtitle_size*2,4119,4308)
SUBTITLE_FX("こうかい     い                て      と      あ             くら     か  こ",subtitle_x,subtitle_y,4311,4467,true)
SUBTITLE_FX("後悔は要らない 手を取り合って (暗い過去だって)",subtitle_x,subtitle_y,4311,4467)
SUBTITLE_FX(" う      と         すす",subtitle_x,subtitle_y-subtitle_size*2,4462,4565,true)
SUBTITLE_FX("受け止めて進んでいく",subtitle_x,subtitle_y-subtitle_size*2,4462,4565)
SUBTITLE_FX("しめ            こた    えら",subtitle_x,subtitle_y,4564,4686,true)
SUBTITLE_FX("示された答え選ぶより",subtitle_x,subtitle_y,4564,4686)
SUBTITLE_FX(" あたら       ゆめ     め  ざ",subtitle_x,subtitle_y-subtitle_size*2,4686,4822,true)
SUBTITLE_FX(" 新しい夢を目指すから (ずっと)",subtitle_x,subtitle_y-subtitle_size*2,4686,4822)
SUBTITLE_FX("まぶ        みち    ある",subtitle_x,subtitle_y,4813,4957,true)
SUBTITLE_FX("眩しい道を歩いていこう",subtitle_x,subtitle_y,4813,4957)

######## Thumbnail ########

is_thumbnail=false

is_thumbnail?ConvertToRGB32(lycoris_recoil_op_mute,matrix="Rec709"):last

######## Music ########

bgm_48khz=SSRC(WAVSource("src\01. ALIVE.wav"),48000)
Normalize(AudioDub(bgm_48khz))



thumbnail=Trim(4575,-24*5)



AUDIO_DUB_TONE(ConvertToRGB32(lycoris_recoil_clean_op_01_00,matrix="Rec709"),samplerate=48000,channels=2,type="Silence")++last



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
