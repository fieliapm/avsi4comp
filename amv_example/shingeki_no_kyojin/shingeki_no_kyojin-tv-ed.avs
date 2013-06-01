Import("shingeki_no_kyojin-tv-common.avsi")

######## Pre Combine ########

function MULTIPASS_PENCIL_FILTER_DEFAULT(clip clip){
	#clip_blur=MULTIPASS_BLUR(clip,1)
	return ConvertToYV12(MULTIPASS_PENCIL_FILTER(ConvertToRGB32(clip),2))
}

shingeki_no_kyojin_tv_02_eren_mikasa_armin_farmimg_extend=shingeki_no_kyojin_tv_02_eren_mikasa_armin_farmimg+shingeki_no_kyojin_tv_02_armin_grandfather_leave

######## Combine ########

# shingeki_no_kyojin_tv_clean_ed_01 16
# shingeki_no_kyojin_tv_clean_ed_02 6091
# shingeki_no_kyojin_tv_clean_ed_03 6219
# shingeki_no_kyojin_tv_clean_ed_04 6776

fade_length=24

shingeki_no_kyojin_tv_op_t01=BlankClip(shingeki_no_kyojin_tv_clean_ed,length=16,color=color_black)+shingeki_no_kyojin_tv_clean_ed_01
shingeki_no_kyojin_tv_op_t02=TRIM_MIDDLE_CLIP(MULTIPASS_PENCIL_FILTER_DEFAULT(shingeki_no_kyojin_tv_01_people_02),137)+TRIM_MIDDLE_CLIP(SLOW_MOTION_WITH_CONVERT_FPS(MULTIPASS_PENCIL_FILTER_DEFAULT(shingeki_no_kyojin_tv_01_eren_mikasa_armin)),136)+TRIM_MIDDLE_CLIP(MULTIPASS_PENCIL_FILTER_DEFAULT(shingeki_no_kyojin_tv_01_people_01),152)

shingeki_no_kyojin_tv_op_t03=TRIM_MIDDLE_CLIP(SLOW_MOTION_WITH_CONVERT_FPS(MULTIPASS_PENCIL_FILTER_DEFAULT(shingeki_no_kyojin_tv_01_jaeger_family_01)),136)+TRIM_MIDDLE_CLIP(SLOW_MOTION_WITH_CONVERT_FPS(MULTIPASS_PENCIL_FILTER_DEFAULT(shingeki_no_kyojin_tv_01_jaeger_family_02)),135) \
	+TRIM_MIDDLE_CLIP(SLOW_MOTION_WITH_CLIP_SPEED(MULTIPASS_PENCIL_FILTER_DEFAULT(CLIP_SPEED(shingeki_no_kyojin_tv_01_grisha_and_carla,2.8))),136)+TRIM_FIRST_CLIP(MULTIPASS_PENCIL_FILTER_DEFAULT(shingeki_no_kyojin_tv_03_lake),203)

shingeki_no_kyojin_tv_op_t04=TRIM_MIDDLE_CLIP(SLOW_MOTION_WITH_CONVERT_FPS(MULTIPASS_PENCIL_FILTER_DEFAULT(shingeki_no_kyojin_tv_02_eren_mikasa_armin_farmimg_extend)),271)+TRIM_MIDDLE_CLIP(SLOW_MOTION_WITH_CONVERT_FPS(MULTIPASS_PENCIL_FILTER_DEFAULT(shingeki_no_kyojin_tv_02_mikasa_push_bread_to_eren_mouth)),270)
shingeki_no_kyojin_tv_op_t05=PSEUDO_COLOR_GRAY(TRIM_MIDDLE_CLIP(SLOW_MOTION_WITH_CLIP_SPEED(MULTIPASS_PENCIL_FILTER_DEFAULT(shingeki_no_kyojin_tv_01_eren_no)),136)+TRIM_LAST_CLIP(SLOW_MOTION_WITH_CLIP_SPEED(MULTIPASS_PENCIL_FILTER_DEFAULT(CLIP_SPEED(shingeki_no_kyojin_tv_01_carla_cry,2.8))),136) \
	+TRIM_MIDDLE_CLIP(SLOW_MOTION_WITH_CLIP_SPEED(MULTIPASS_PENCIL_FILTER_DEFAULT(shingeki_no_kyojin_tv_01_kyojin_eat_carla)),118))+PSEUDO_COLOR_GRAY_TO_PAPER(TRIM_FIRST_CLIP(SLOW_MOTION_WITH_CLIP_SPEED(MULTIPASS_PENCIL_FILTER_DEFAULT(shingeki_no_kyojin_tv_01_blood_rain)),136),0,135)
shingeki_no_kyojin_tv_op_t06=TRIM_FIRST_CLIP(SLOW_MOTION_WITH_CONVERT_FPS(MULTIPASS_PENCIL_FILTER_DEFAULT(shingeki_no_kyojin_tv_01_chou_oogata_kyojin_outside_wall_maria)),143)+TRIM_FIRST_CLIP(SLOW_MOTION_WITH_CLIP_SPEED(MULTIPASS_PENCIL_FILTER_DEFAULT(shingeki_no_kyojin_tv_02_yoroi_no_kyojin_dash_01)),127) \
	+TRIM_FIRST_CLIP(SLOW_MOTION_WITH_CLIP_SPEED(MULTIPASS_PENCIL_FILTER_DEFAULT(CLIP_SPEED(shingeki_no_kyojin_tv_02_yoroi_no_kyojin_close_army,2.8))),134)+TRIM_MIDDLE_CLIP(SLOW_MOTION_WITH_CLIP_SPEED(MULTIPASS_PENCIL_FILTER_DEFAULT(CLIP_SPEED(shingeki_no_kyojin_tv_02_yoroi_no_kyojin_crash_wall_maria_02,2.8))),153)

shingeki_no_kyojin_tv_op_t07=Trim(SLOW_MOTION_WITH_CONVERT_FPS(shingeki_no_kyojin_tv_02_kyojin_history),72,-(136+135+136+135+136+135))+PSEUDO_COLOR_PAPER(TRIM_MIDDLE_CLIP(SLOW_MOTION_WITH_CLIP_SPEED(MULTIPASS_PENCIL_FILTER_DEFAULT(CLIP_SPEED(shingeki_no_kyojin_tv_02_resist_failed,3.0))),136)+TRIM_MIDDLE_CLIP(SLOW_MOTION_WITH_CLIP_SPEED(MULTIPASS_PENCIL_FILTER_DEFAULT(CLIP_SPEED(shingeki_no_kyojin_tv_06_mikasa_family,4.0))),135))

shingeki_no_kyojin_tv_op_t08=TRIM_MIDDLE_CLIP(SLOW_MOTION_WITH_CLIP_SPEED(CLIP_SPEED(shingeki_no_kyojin_tv_02_kyojin_medicine,2.2)),136+126+135+178)+TRIM_FIRST_CLIP(SLOW_MOTION_WITH_CLIP_SPEED(shingeki_no_kyojin_tv_02_the_key_fall),85)

shingeki_no_kyojin_tv_op_t09=PSEUDO_COLOR_PAPER(TRIM_MIDDLE_CLIP(MULTIPASS_PENCIL_FILTER_DEFAULT(shingeki_no_kyojin_tv_05_eren_mikasa_armin_in_class),17+116))+shingeki_no_kyojin_tv_clean_ed_02+shingeki_no_kyojin_tv_clean_ed_03
shingeki_no_kyojin_tv_op_t10=PSEUDO_COLOR_PAPER(TRIM_MIDDLE_CLIP(MULTIPASS_PENCIL_FILTER_DEFAULT(shingeki_no_kyojin_tv_04_104th_corps_graduates),271))+shingeki_no_kyojin_tv_clean_ed_04+BlankClip(shingeki_no_kyojin_tv_clean_ed,length=48,color=color_black)

shingeki_no_kyojin_tv_ed_mute=shingeki_no_kyojin_tv_op_t01+DOUBLE_FADE_WITH_BRIGHTNESS_OFFSET_RGB24(PSEUDO_COLOR_PAPER(shingeki_no_kyojin_tv_op_t02+shingeki_no_kyojin_tv_op_t03),PSEUDO_COLOR_GRAY(shingeki_no_kyojin_tv_op_t04),fade_length,fade_length)+shingeki_no_kyojin_tv_op_t05 \
	+DOUBLE_FADE_WITH_BRIGHTNESS_OFFSET_RGB24(DOUBLE_FADE_WITH_BRIGHTNESS_OFFSET_RGB24(PSEUDO_COLOR_PAPER(shingeki_no_kyojin_tv_op_t06),shingeki_no_kyojin_tv_op_t07,fade_length,fade_length),DOUBLE_FADE_WITH_BRIGHTNESS_OFFSET_RGB24(shingeki_no_kyojin_tv_op_t08,shingeki_no_kyojin_tv_op_t09,fade_length,fade_length),fade_length,fade_length)+shingeki_no_kyojin_tv_op_t10

######## Music ########

bgm_48khz=SSRC(WAVSource("src\shingeki_no_kyojin-tv-ed-01.wav"),48000)
AudioDub(shingeki_no_kyojin_tv_ed_mute,bgm_48khz)
#MixAudio(shingeki_no_kyojin_tv_ed_mute,bgm_48khz,3.0,0.5)

######## Subtitle ########

global subtitle_clip_width=1280
global subtitle_clip_height=720

subtitle_x=50*1.5
subtitle_y=400*1.5
global subtitle_front_fade_count=24
global subtitle_rear_fade_count=24
global subtitle_font="MS Gothic"
global subtitle_effects="bi"
global subtitle_size=28*1.5
global subtitle_text_color=color_white
global subtitle_halo_color=OVERWRITE_COLOR_ALPHA(color_black,$3F)

function SUBTITLE_FX(clip clip,string text,float x,float y,int start_frame,int end_frame,bool "is_title"){
	is_title=Default(is_title,false)

	text_color=is_title?color_gold:subtitle_text_color

	return SUBTITLE_FX_OFFSET_FADE_IN_FADE_OUT(clip,text,Round(x),Round(y),start_frame,end_frame,subtitle_front_fade_count,subtitle_rear_fade_count,subtitle_font,subtitle_effects,Round(subtitle_size),text_color,subtitle_halo_color)
}

SUBTITLE_FX("美しき残酷な世界//日笠陽子|- by fielia@AVISynth",subtitle_x,subtitle_y-subtitle_size,6776,6976,true)

SUBTITLE_FX("その夢は こころの居場所",subtitle_x,subtitle_y,358,470)
SUBTITLE_FX("生命(いのち)より 壊れやすきもの",subtitle_x,subtitle_y,477,601)
SUBTITLE_FX("何度でも 捨てては見つけ",subtitle_x,subtitle_y,629,732)
SUBTITLE_FX("安らかに さぁ眠れ",subtitle_x,subtitle_y,740,883)
SUBTITLE_FX("脈打つ衝動に 願いは犯され",subtitle_x,subtitle_y,900,1152)
SUBTITLE_FX("忘れてしまうほど また想い出すよ",subtitle_x,subtitle_y,1171,1406)

SUBTITLE_FX("この 美しき残酷な世界では",subtitle_x,subtitle_y,1416,1552)
SUBTITLE_FX("まだ生きていること「何故」と問うばかりで…",subtitle_x,subtitle_y,1561,1684)
SUBTITLE_FX("嗚呼ボクたちは この強さ 弱さで",subtitle_x,subtitle_y,1687,1817)
SUBTITLE_FX("何を護るのだろう もう理性など",subtitle_x,subtitle_y,1823,1952)
SUBTITLE_FX("無いならば",subtitle_x,subtitle_y,1958,2043)

SUBTITLE_FX("あの空は 切ないのだろう",subtitle_x,subtitle_y,2593,2708)
SUBTITLE_FX("舞い上がる 灰と蜃気楼",subtitle_x,subtitle_y,2711,2827)
SUBTITLE_FX("温かい 言葉に凍え",subtitle_x,subtitle_y,2864,2969)
SUBTITLE_FX("人知れず さぁ眠れ",subtitle_x,subtitle_y,2974,3115)
SUBTITLE_FX("ねばつく幻想に 嘆きは隠され",subtitle_x,subtitle_y,3134,3395)
SUBTITLE_FX("千切ってしまうほど また絡みつくよ",subtitle_x,subtitle_y,3404,3645)

SUBTITLE_FX("この 美しき残酷な世界では",subtitle_x,subtitle_y,3651,3786)
SUBTITLE_FX("ただ死んでゆくこと「待て」と乞うばかりで…",subtitle_x,subtitle_y,3795,3916)
SUBTITLE_FX("嗚呼ボクたちは 風見鶏 飛べずに",subtitle_x,subtitle_y,3922,4051)
SUBTITLE_FX("真実は嘘より 綺麗かどうか",subtitle_x,subtitle_y,4056,4188)
SUBTITLE_FX("分からない",subtitle_x,subtitle_y,4192,4275)

SUBTITLE_FX("もしもボクら歌ならば",subtitle_x,subtitle_y,5300,5385)
SUBTITLE_FX("あの風に 帆を上げ",subtitle_x,subtitle_y,5436,5549)
SUBTITLE_FX("迷わずにただ 誰かの元へ",subtitle_x,subtitle_y,5555,5679)
SUBTITLE_FX("希望 届けに行くのに",subtitle_x,subtitle_y,5690,5867)

SUBTITLE_FX("この 美しき残酷な世界では",subtitle_x,subtitle_y,5952,6087)
SUBTITLE_FX("まだ生きていること「何故」と問うばかりで…",subtitle_x,subtitle_y,6096,6218)
SUBTITLE_FX("嗚呼ボクたちは この強さ 弱さで",subtitle_x,subtitle_y,6223,6351)
SUBTITLE_FX("何を護るのだろう もう理性など",subtitle_x,subtitle_y,6358,6489)
SUBTITLE_FX("無いならば",subtitle_x,subtitle_y,6494,6586)

######## Post Processing ########

ConvertToYV12()
#ConvertToYUY2()
#ConvertToRGB24()
