Import("maoyuu-tv-common.avsi")

######## Pre Combine ########

maoyuu_tv_01_onna_mahoutsukai_faster=CLIP_SPEED(maoyuu_tv_01_onna_mahoutsukai,2.4)
maoyuu_tv_10_young_maou_01_faster=CLIP_SPEED(maoyuu_tv_10_young_maou_01,1.3)
maoyuu_tv_10_young_chief_maid_01_faster=CLIP_SPEED(maoyuu_tv_10_young_chief_maid_01,1.9)



maoyuu_tv_09_red_bachelor_announce_02_short=TRIM_LAST_CLIP(maoyuu_tv_09_red_bachelor_announce_02,22)
maoyuu_tv_09_red_bachelor_announce_03_short=TRIM_FIRST_CLIP(maoyuu_tv_09_red_bachelor_announce_03,23)
maoyuu_tv_09_red_bachelor_announce_dissolve=Dissolve(maoyuu_tv_09_red_bachelor_announce_02_short,maoyuu_tv_09_red_bachelor_announce_03_short,10)



maoyuu_tv_09_red_bachelor_announce_overlay=Dissolve(TRIM_LAST_CLIP(maoyuu_tv_09_red_bachelor_announce_02,30),TRIM_FIRST_CLIP(maoyuu_tv_09_red_bachelor_announce_03,10),5)


function OVERLAY_BG_AND_CHAR_BLEND(clip bg_clip,string char_clip){
	return ScriptClip(bg_clip,"Overlay("+char_clip+",opacity=Spline(current_frame,0,0.0,10,0.0,20,0.5,Framecount()-1,0.5,cubic=false),mode="+DOUBLE_QUOTE_STRING("Blend")+")")
}

function OVERLAY_BG_AND_CHAR_ADD(clip bg_clip,string char_clip){
	bg_clip_darker=Tweak(bg_clip,bright=-70.0)
	return ScriptClip(bg_clip_darker,"Overlay("+char_clip+",opacity=Spline(current_frame,0,0.0,10,0.0,20,1.0,Framecount()-1,1.0,cubic=false),mode="+DOUBLE_QUOTE_STRING("Add")+")")
}

maoyuu_tv_04_chief_maid_touch_glasses_overlay=OVERLAY_BG_AND_CHAR_BLEND(maoyuu_tv_10_chief_maid_waiting_outside,"maoyuu_tv_04_chief_maid_touch_glasses")
maoyuu_tv_05_mazoku_musume_overlay=OVERLAY_BG_AND_CHAR_ADD(maoyuu_tv_05_kaimon_toshi,"maoyuu_tv_05_mazoku_musume")
maoyuu_tv_06_eastern_fortress_general_and_assistant_overlay=OVERLAY_BG_AND_CHAR_ADD(maoyuu_tv_05_eastern_fortress,"maoyuu_tv_06_eastern_fortress_general_and_assistant")
maoyuu_tv_09_maid_imouto_sleep_overlay=OVERLAY_BG_AND_CHAR_ADD(maoyuu_tv_04_windmill,"maoyuu_tv_09_maid_imouto_sleep")

maoyuu_tv_09_soumaou=TRIM_LAST_CLIP(maoyuu_tv_09_soumaou_01,146/2)+TRIM_FIRST_CLIP(maoyuu_tv_09_soumaou_02,146/2)
maoyuu_tv_09_soumaou_02_overlay=OVERLAY_BG_AND_CHAR_BLEND(maoyuu_tv_05_flag,"maoyuu_tv_09_soumaou")



function EXTEND_ZOOM(clip clip){
	return ScriptClip(clip,"FAST_ZOOM(dstx=Spline(current_frame,0,Width()*3.0/8.0,Framecount()-1,Width()*5.0/8.0),dsty=Height()*3.0/8.0,factor=Spline(current_frame,0,0.5,Framecount()-1,0.85),extend=true)")
}

function OVERLAY_BG_AND_CHAR_ADD_2(clip bg_clip,string char_clip){
	return ScriptClip(bg_clip,"Overlay("+char_clip+",opacity=Spline(current_frame,0,0.0,24,0.0,34,1.0,68,1.0,78,0.0,Framecount()-1,0.0,cubic=false),mode="+DOUBLE_QUOTE_STRING("Add")+")")
}

maoyuu_tv_10_young_maou_see_baby_yuusha_01_extend=BlankClip(maoyuu_tv_10_young_maou_see_baby_yuusha_01,length=136-Framecount(maoyuu_tv_10_young_maou_see_baby_yuusha_01),color=color_black)+maoyuu_tv_10_young_maou_see_baby_yuusha_01
maoyuu_tv_10_young_maou_see_baby_yuusha_01_extend_zoomed=EXTEND_ZOOM(maoyuu_tv_10_young_maou_see_baby_yuusha_01_extend)
maoyuu_tv_08_maou_enter_grave_overlay=OVERLAY_BG_AND_CHAR_ADD_2(TRIM_LAST_CLIP(maoyuu_tv_08_maou_enter_grave,136),"maoyuu_tv_10_young_maou_see_baby_yuusha_01_extend_zoomed")

######## Combine ########

# maoyuu_tv_clean_op_01 159
# maoyuu_tv_clean_op_02 448
# maoyuu_tv_clean_op_02_dance 3069
# maoyuu_tv_clean_op_02_review 3150
# maoyuu_tv_clean_op_03 5138

# section:
# maoyuu_tv_clean_op_02 = 289 360 431 528 544 / 562 708 776 815 / 833 958 984 1022 1050 1131 1154
#                         71 71 97 16 18 / 146 68 39 18 / 125 26 38 28 [81](dance) [5 6 6 6](review)
# maoyuu_tv_clean_op_03 = 1154 1194 1227 / 1293 1314 1348 1372 1402 / 1435 / 1571 1600 1686 1700 / 1715 1792 / 1849 1882 1928 1986 [2149](next clip)
#                         40 33 66 / 21 34 24 30 33 / 136 / 29 86[7,12,67] 14 15 / 77 57 / 33 46 58 [163](next clip)



fade_length=24

maoyuu_tv_op_t01=FADE_OUT_WITH_BRIGHTNESS_OFFSET_RGB24(TRIM_FIRST_CLIP(maoyuu_tv_01_yuusha_team,159),14)+maoyuu_tv_clean_op_01

maoyuu_tv_op_t02=maoyuu_tv_clean_op_02+TRIM_FIRST_CLIP(maoyuu_tv_02_maou_teach_student,81) \
	+TRIM_LAST_CLIP(maoyuu_tv_01_maou_oppai,5)+TRIM_MIDDLE_CLIP(maoyuu_tv_07_onna_kishi_oppai,6)+TRIM_MIDDLE_CLIP(maoyuu_tv_03_chief_maid_touch_maou_oppai_01,6)+TRIM_MIDDLE_CLIP(maoyuu_tv_08_grand_princess_fire_dragon_and_mazoku_musume_oppai,6)

maoyuu_tv_op_t03=TRIM_MIDDLE_CLIP(maoyuu_tv_07_yuusha_vs_onna_kishi_01,40)+TRIM_FIRST_CLIP(maoyuu_tv_07_yuusha_vs_onna_kishi_03,33)+TRIM_LAST_CLIP(maoyuu_tv_07_yuusha_vs_onna_kishi_02,66) \
	+TRIM_FIRST_CLIP(maoyuu_tv_04_onna_kishi_angry_02,21)+TRIM_MIDDLE_CLIP(maoyuu_tv_05_maou_bed_sport,34)+TRIM_MIDDLE_CLIP(maoyuu_tv_07_maou_and_onna_kishi_snatch_yuusha_04,24)+TRIM_MIDDLE_CLIP(maoyuu_tv_06_onna_kishi_and_people,30)+TRIM_MIDDLE_CLIP(maoyuu_tv_06_maou_and_people,33) \
	+TRIM_LAST_CLIP(maoyuu_tv_08_maou_enter_grave_overlay,136) \
	+TRIM_FIRST_CLIP(maoyuu_tv_02_maid_ane_and_imouto_cry,29)+Dissolve(TRIM_MIDDLE_CLIP(maoyuu_tv_04_maid_ane_talk_with_onna_kishi_02,19),TRIM_MIDDLE_CLIP(maoyuu_tv_07_maou_give_ring_to_maid_ane_02,79),12)+TRIM_LAST_CLIP(maoyuu_tv_02_maid_ane_run,14)+TRIM_FIRST_CLIP(maoyuu_tv_02_maid_imouto_run,15) \
	+TRIM_MIDDLE_CLIP(maoyuu_tv_06_yuusha_back,77)+TRIM_MIDDLE_CLIP(maoyuu_tv_05_yuusha_transported_and_leave_maou,57) \
	+TRIM_MIDDLE_CLIP(maoyuu_tv_05_kaimon_toshi_temple,33)+TRIM_MIDDLE_CLIP(maoyuu_tv_08_yuusha_and_young_merchant_below_aurora,46)+TRIM_FIRST_CLIP(maoyuu_tv_03_doumei_propaganda,58)

maoyuu_tv_op_t04=TRIM_FIRST_CLIP(maoyuu_tv_01_onna_mahoutsukai_faster,163)

maoyuu_tv_op_t05=TRIM_FIRST_CLIP(maoyuu_tv_04_chief_maid_touch_glasses_overlay,71)+TRIM_FIRST_CLIP(maoyuu_tv_09_maid_imouto_sleep_overlay,71)+TRIM_FIRST_CLIP(maoyuu_tv_06_eastern_fortress_general_and_assistant_overlay,97)+TRIM_FIRST_CLIP(maoyuu_tv_07_archduke_fire_dragon,16)+TRIM_MIDDLE_CLIP(maoyuu_tv_06_fairy,18) \
	+TRIM_FIRST_CLIP(maoyuu_tv_09_soumaou_02_overlay,146)+TRIM_FIRST_CLIP(maoyuu_tv_05_mazoku_musume_overlay,68)+TRIM_LAST_CLIP(maoyuu_tv_02_maou_and_yuusha_transport,39)+TRIM_MIDDLE_CLIP(maoyuu_tv_04_maid_imouto_dance,18) \
	+TRIM_MIDDLE_CLIP(maoyuu_tv_05_maou_and_yuusha_dance_03,125+26)+TRIM_MIDDLE_CLIP(maoyuu_tv_05_maou_and_yuusha_dance_01,38)+TRIM_MIDDLE_CLIP(maoyuu_tv_05_maou_and_yuusha_dance_02,28)+maoyuu_tv_clean_op_02_dance+maoyuu_tv_clean_op_02_review

maoyuu_tv_op_t06=TRIM_MIDDLE_CLIP(maoyuu_tv_03_shuraba,40)+TRIM_FIRST_CLIP(maoyuu_tv_02_maid_imouto_image_money,33)+TRIM_MIDDLE_CLIP(maoyuu_tv_10_grand_princess_fire_dragon_tail,66) \
	+TRIM_LAST_CLIP(maoyuu_tv_01_maou_kiss_yuusha_pillow_01,21)+TRIM_MIDDLE_CLIP(maoyuu_tv_01_maou_kiss_yuusha_pillow_02,34)+TRIM_MIDDLE_CLIP(maoyuu_tv_08_grand_princess_fire_dragon_and_party_staff_01,24)+TRIM_MIDDLE_CLIP(maoyuu_tv_10_onna_mahoutsukai_use_magic_to_grand_princess_fire_dragon,30)+TRIM_MIDDLE_CLIP(maoyuu_tv_08_maou_meet_onna_mahoutsukai,33) \
	+TRIM_MIDDLE_CLIP(maoyuu_tv_06_onna_kishi_use_stone_wall,136) \
	+TRIM_FIRST_CLIP(maoyuu_tv_03_maou_show_armor,29)+Dissolve(TRIM_MIDDLE_CLIP(maoyuu_tv_07_iron_country,19),TRIM_MIDDLE_CLIP(maoyuu_tv_07_typesetting_03,79),12)+TRIM_MIDDLE_CLIP(maoyuu_tv_06_shitsuji_eye,14)+TRIM_FIRST_CLIP(maoyuu_tv_06_shitsuji_beaten_by_onna_kishi,15) \
	+TRIM_MIDDLE_CLIP(maoyuu_tv_10_young_maou_01_faster,77)+TRIM_MIDDLE_CLIP(maoyuu_tv_10_young_chief_maid_01_faster,57) \
	+TRIM_MIDDLE_CLIP(maoyuu_tv_09_clock_tower,33)+TRIM_MIDDLE_CLIP(maoyuu_tv_09_yuusha_monitoring,46)+TRIM_MIDDLE_CLIP(maoyuu_tv_09_light_spirit,58)

maoyuu_tv_op_t07=TRIM_MIDDLE_CLIP(maoyuu_tv_02_maou_and_yuusha_in_field,158)+TRIM_LAST_CLIP(maoyuu_tv_07_maou_brush_yuusha_hair,140)+TRIM_LAST_CLIP(maoyuu_tv_01_maou_point_to_the_other_side_of_the_hill,145)

maoyuu_tv_op_t08=TRIM_FIRST_CLIP(maoyuu_tv_05_maou_hug_yuusha_pillow,128)+TRIM_MIDDLE_CLIP(maoyuu_tv_01_yuusha_memory,141)+TRIM_MIDDLE_CLIP(maoyuu_tv_03_lake_map_and_transport_03,134)+TRIM_LAST_CLIP(maoyuu_tv_10_maou_sleeping_01,144)

# combo 45 35 / 4 4 5 / 4 5 5 / 4 4 5 5 / 4 4 5 5
maoyuu_tv_op_t09=TRIM_MIDDLE_CLIP(maoyuu_tv_09_red_bachelor_announce_to_people,45)+TRIM_MIDDLE_CLIP(maoyuu_tv_09_red_bachelor_announce_dissolve,35) \
	+TRIM_MIDDLE_CLIP(maoyuu_tv_04_maid_ane_and_imouto_cry_memory_02,4)+TRIM_MIDDLE_CLIP(maoyuu_tv_02_maou_teach_maid_ane_and_imouto_memory,4)+TRIM_MIDDLE_CLIP(maoyuu_tv_04_maid_ane_learn_memory_03,5) \
	+TRIM_MIDDLE_CLIP(maoyuu_tv_06_maid_ane_memory_01,4)+TRIM_MIDDLE_CLIP(maoyuu_tv_06_maid_ane_memory_02,5)+TRIM_MIDDLE_CLIP(maoyuu_tv_06_maid_ane_memory_03,5) \
	+TRIM_MIDDLE_CLIP(maoyuu_tv_06_maid_ane_memory_04,4)+TRIM_MIDDLE_CLIP(maoyuu_tv_09_maid_ane_memory_01,4)+TRIM_MIDDLE_CLIP(maoyuu_tv_09_maid_ane_memory_02,5)+TRIM_MIDDLE_CLIP(maoyuu_tv_09_maid_ane_memory_03,5) \
	+TRIM_MIDDLE_CLIP(maoyuu_tv_09_maid_ane_memory_04,4)+TRIM_MIDDLE_CLIP(maoyuu_tv_09_maid_ane_memory_05,4)+TRIM_MIDDLE_CLIP(maoyuu_tv_09_maid_ane_memory_06,5)+TRIM_LAST_CLIP(maoyuu_tv_09_maid_ane_memory_07,5)

maoyuu_tv_op_t10=maoyuu_tv_clean_op_03+BlankClip(maoyuu_tv_clean_op,length=72,color=color_black)



maoyuu_tv_op_mute=maoyuu_tv_op_t01+maoyuu_tv_op_t02+maoyuu_tv_op_t03+FADE_OUT_WITH_BRIGHTNESS_OFFSET_RGB24(maoyuu_tv_op_t04,fade_length/2)+maoyuu_tv_op_t05+maoyuu_tv_op_t06+DOUBLE_FADE_WITH_BRIGHTNESS_OFFSET_RGB24(FADE_IN_WITH_BRIGHTNESS_OFFSET_RGB24(maoyuu_tv_op_t07,fade_length),maoyuu_tv_op_t08,fade_length,fade_length)+maoyuu_tv_op_t09+maoyuu_tv_op_t10

######## Music ########

bgm_48khz=SSRC(WAVSource("src\maoyuu-tv-op-01.wav"),48000)
AudioDub(maoyuu_tv_op_mute,bgm_48khz)

######## Subtitle ########

subtitle_x=-50
subtitle_y=50
subtitle_front_fade_count=24
subtitle_rear_fade_count=24
subtitle_font="MS Gothic"
subtitle_effects="b"
subtitle_size=28
subtitle_text_color=OVERWRITE_COLOR_ALPHA(color_red,$3F)
subtitle_halo_color=color_gold

SUBTITLE_FX_PULL_IN_PULL_OUT("- by fielia & niwa0daisuke@AVISynth",subtitle_x,subtitle_y,231,406,subtitle_front_fade_count,subtitle_rear_fade_count,subtitle_font,subtitle_effects,subtitle_size,subtitle_text_color,subtitle_halo_color)

#LoadPlugin("VSFilter.dll")
TextSub("maoyuu-op.ass")

######## Post Processing ########

ConvertToYV12()
#ConvertToYUY2()
#ConvertToRGB24()
