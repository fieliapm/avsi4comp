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

Import("maoyuu-tv-common.avsi")

######## Function ########

subtitle_x=50
subtitle_y=395
global subtitle_font="MS Gothic"
global subtitle_effects="b"
global subtitle_size=32
global subtitle_text_color=OVERWRITE_SUBTITLE_COLOR_ALPHA(color_gold,$C0)
global subtitle_halo_color=color_black

second_subtitle_x=-50
second_subtitle_y=50

function SUBTITLE_N(clip clip,string text,int "x",int "y",int "first_frame",int "last_frame",bool "is_title"){
	is_title=Default(is_title,false)

	text_color=is_title?OVERWRITE_SUBTITLE_COLOR_ALPHA(color_red,$C0):subtitle_text_color
	halo_color=is_title?OVERWRITE_SUBTITLE_COLOR_ALPHA(subtitle_text_color,$FF):subtitle_halo_color
	size=is_title?subtitle_size*2:subtitle_size
	x=is_title?(subtitle_clip_width/2)-(size*StrLen(text)/4):x
	y=is_title?(subtitle_clip_height/2)-(size/2):y

	return SUBTITLE_NORMAL(clip,text,x,y,first_frame,last_frame,subtitle_font,subtitle_effects,size,text_color,halo_color)
}

function SUBTITLE_WARNING(clip clip,string text,int "x",int "y",int "first_frame",int "last_frame"){
	text_color=OVERWRITE_SUBTITLE_COLOR_ALPHA(color_red,$C0)
	halo_color=OVERWRITE_SUBTITLE_COLOR_ALPHA(subtitle_text_color,$FF)
	size=Round(subtitle_size*1.1)

	return SUBTITLE_FX_SMOOTH_BLINK(clip,text,x,y,first_frame,last_frame,subtitle_font,subtitle_effects,size,text_color,halo_color,min_opacity=0.2,max_opacity=1.0)
}

### inherit end ###

prologue=maoyuu_tv_01_explain_the_other_side_of_the_hill

######## Pre Combine ########

prologue=ConvertToRGB32(prologue)
prologue=SUBTITLE_N(prologue,"IÅêÂ¼",subtitle_x,subtitle_y,25,90,false)
prologue=SUBTITLE_N(prologue,"I¢...¢!",subtitle_x,subtitle_y,195,260,false)
prologue=SUBTITLE_N(prologue,"¥...?",subtitle_x,subtitle_y,355,375,false)
prologue=SUBTITLE_N(prologue,"¥äê¼¶z\ôI",subtitle_x,subtitle_y,380,440,false)
prologue=SUBTITLE_N(prologue,"¥ä²ÛIîi",subtitle_x,subtitle_y,480,515,false)
prologue=SUBTITLE_N(prologue,"II...²Û...?",subtitle_x,subtitle_y,580,635,false)
prologue=SUBTITLE_N(prologue,"¥I",subtitle_x,subtitle_y,675,685,false)
prologue=SUBTITLE_N(prologue,"ßÂÔA±IãÊLYõ,Izßv?",subtitle_x,subtitle_y,740,825,false)
prologue=SUBTITLE_N(prologue,"<--(å{)",-60,75,740,825,false)
prologue=SUBTITLE_N(prologue,"½¥zßåu°I¡ÊLYõv?",subtitle_x,subtitle_y,875,975,false)
prologue=SUBTITLE_N(prologue,"(ÔðêI¼)",second_subtitle_x,second_subtitle_y,875,975,false)
prologue=SUBTITLE_N(prologue,"çLb...äYàíõzß...",subtitle_x,subtitle_y,1000,1065,false)
prologue=SUBTITLE_N(prologue,"b?Lèí¥amv!kúÒv!",subtitle_x,subtitle_y,1067,1150,false)
prologue=SUBTITLE_N(prologue,"¥b...",subtitle_x,subtitle_y,1180,1200,false)
prologue=SUBTITLE_N(prologue,"äA¥zÒÁÂ®",subtitle_x,subtitle_y,1235,1285,false)
prologue=SUBTITLE_N(prologue,"Ýæ¤äoHì§ÝVã,\ç×úØÍI®",subtitle_x,subtitle_y,1315,1385,false)
prologue=SUBTITLE_N(prologue,"È,äzæîIà",subtitle_x,subtitle_y,1420,1495,false)
prologue=SUBTITLE_N(prologue,"æîäêN¥Ìb,EÒ",subtitle_x,subtitle_y,1525,1580,false)
prologue=SUBTITLE_N(prologue,"×¹ðúäìÀ®ÌÈIßª´®",subtitle_x,subtitle_y,1605,1670,false)
prologue=SUBTITLE_N(prologue,"zvI¬×äIãß,äoäêNÌ,ªäI´®",subtitle_x,subtitle_y,1685,1815,false)
prologue=SUBTITLE_N(prologue,"ssv?",subtitle_x,subtitle_y,1905,1925,false)
prologue=SUBTITLE_N(prologue,"ss!",subtitle_x,subtitle_y,1940,1955,false)
prologue=SUBTITLE_N(prologue,"âv?",subtitle_x,subtitle_y,1985,2005,false)
prologue=SUBTITLE_N(prologue,"â!",subtitle_x,subtitle_y,2020,2040,false)
prologue=SUBTITLE_N(prologue,"üö×Llªv?",subtitle_x,subtitle_y,2070,2110,false)
prologue=SUBTITLE_N(prologue,"!",subtitle_x,subtitle_y,2115,2125,false)
prologue=SUBTITLE_N(prologue,"¶[[[",subtitle_x,subtitle_y,2185,2245,false)
prologue=SUBTITLE_N(prologue,"LÊIRG!",subtitle_x,subtitle_y,2255,2275,false)
prologue=SUBTITLE_N(prologue,"^IG!",subtitle_x,subtitle_y,2290,2305,false)
prologue=SUBTITLE_N(prologue,"äÅL",subtitle_x,subtitle_y,2330,2350,false)
prologue=SUBTITLE_N(prologue,"×YõvpõGEI\î¢!",subtitle_x,subtitle_y,2410,2480,false)
prologue=SUBTITLE_N(prologue,"äããÊlà,ÒÁÌæÕDLê±VKèIéq",subtitle_x,subtitle_y,2510,2605,false)
prologue=SUBTITLE_N(prologue,"ÅIDsèSIéq¢",subtitle_x,subtitle_y,2660,2695,false)
prologue=SUBTITLE_N(prologue,"AdézKèãÒs¥êéð¸T",subtitle_x,subtitle_y,2710,2755,false)
prologue=SUBTITLE_N(prologue,"Å{dûb",subtitle_x,subtitle_y,2770,2805,false)
prologue=SUBTITLE_N(prologue,"¶,äm¹IVK¥¥éI",subtitle_x,subtitle_y,2810,2902,false)
prologue=SUBTITLE_N(prologue,"ècèV[",subtitle_x,subtitle_y,2905,2920,false)
prologue=SUBTITLE_N(prologue,"Â\b",subtitle_x,subtitle_y,2925,2935,false)
prologue=SUBTITLE_N(prologue,"A¥L±K¥As\¥¾á¶»",subtitle_x,subtitle_y,2955,3075,false)
prologue=SUBTITLE_N(prologue,"sçK¥Is×a¬ªI",subtitle_x,subtitle_y,3095,3155,false)
prologue=SUBTITLE_N(prologue,"ðÅª´¼l´{´®zêÌü°ISî",subtitle_x,subtitle_y,3165,3280,false)
prologue=SUBTITLE_N(prologue,"ÈstaffËðêSùè±K¥",subtitle_x,subtitle_y,3295,3340,false)
prologue=SUBTITLE_N(prologue,"ßõAããIààK¥b",subtitle_x,subtitle_y,3430,3475,false)
prologue=SUBTITLE_N(prologue,"å«Rä¥søYõú]",subtitle_x,subtitle_y,3515,3570,false)
prologue=ConvertToYV12(prologue)

prologue

### prefetch: 5,2

### ###

""")

prologue=AudioDub(last,maoyuu_tv_01_explain_the_other_side_of_the_hill)

######## Game ########

puzzle_and_dragons_gameplay=FFMS2_VIDEO_SOURCE("src\puzzle_and_dragon\pYhSY@RÁµXyV@Ò.480p.flv",fpsnum=30000,fpsden=1001)
puzzle_and_dragons_gameplay_short=Trim(puzzle_and_dragons_gameplay,754,1185)

lovetra_sweet_pv=FFMS2_VIDEO_SOURCE("src\lovetra-web_resource\movie\lovetra_sweet-pv-720p.mp4")
lovetra_sweet_pv_short=Trim(lovetra_sweet_pv,2728,2890)

######## Pre Combine ########

global map_audio=maoyuu_tv_07_byakuya_country_map_audio
function OVERWRITE_MAP_AUDIO(clip clip){
	return TRIM_FIRST_CLIP(AudioDub(clip,map_audio),Framecount(map_audio))
}

cm_kaimon_toshi_map=OVERWRITE_MAP_AUDIO(maoyuu_tv_06_kaimon_toshi_map)
cm_winter_country_map=OVERWRITE_MAP_AUDIO(maoyuu_tv_04_winter_country_map)
cm_church_map=OVERWRITE_MAP_AUDIO(maoyuu_tv_03_church_map)
cm_mazoku_attack_map=OVERWRITE_MAP_AUDIO(maoyuu_tv_10_mazoku_attack_map)
cm_doumei_map=OVERWRITE_MAP_AUDIO(maoyuu_tv_03_doumei_map)
cm_mazoku_and_human_boundry_map=OVERWRITE_MAP_AUDIO(maoyuu_tv_03_mazoku_and_human_boundry_map)
cm_lake_map=OVERWRITE_MAP_AUDIO(maoyuu_tv_10_lake_map_01)
cm_mazoku_vs_human=OVERWRITE_MAP_AUDIO(maoyuu_tv_02_mazoku_vs_human)



maoyuu_tv_01_become_my_property_i_refuse=maoyuu_tv_01_become_my_property_i_refuse_01+maoyuu_tv_01_become_my_property_i_refuse_02+Invert(maoyuu_tv_01_become_my_property_i_refuse_03)
maou_kiss_yuusha=maoyuu_tv_02_yuusha_sleep_on_maou_leg+maoyuu_tv_02_maou_kiss_yuusha_sleeping_on_leg_01+maoyuu_tv_02_maou_kiss_yuusha_sleeping_on_leg_02+maoyuu_tv_02_maou_kiss_yuusha_sleeping_on_leg_03
maou_catch_yuusha_pillow=maoyuu_tv_05_maou_see_yuusha_pillow+maoyuu_tv_01_maou_kiss_yuusha_pillow_02
maoyuu_tv_03_chief_maid_touch_maou_oppai=maoyuu_tv_03_chief_maid_touch_maou_oppai_01+maoyuu_tv_03_chief_maid_touch_maou_oppai_02+maoyuu_tv_03_chief_maid_touch_maou_oppai_03+maoyuu_tv_03_chief_maid_touch_maou_oppai_04
maoyuu_tv_04_maou_cry=maoyuu_tv_04_maou_cry_01+maoyuu_tv_04_maou_cry_02
maoyuu_tv_05_maou_beat_yuusha_with_yuusha_pillow=maoyuu_tv_05_maou_beat_yuusha_with_yuusha_pillow_01+maoyuu_tv_05_maou_beat_yuusha_with_yuusha_pillow_02
maoyuu_tv_07_yuusha_and_eastern_fortress_general_eat_food=maoyuu_tv_07_yuusha_and_eastern_fortress_general_eat_food_01+Invert(maoyuu_tv_07_yuusha_and_eastern_fortress_general_eat_food_02)
maoyuu_tv_08_party=maoyuu_tv_08_party+maoyuu_tv_08_grand_princess_fire_dragon_pour_wine_for_young_merchant

#prologue=maoyuu_tv_01_explain_the_other_side_of_the_hill
do_not_eat_food_01=maoyuu_tv_07_yuusha_and_eastern_fortress_general_eat_food
do_not_eat_food_02=maoyuu_tv_08_party
light_off_01=maoyuu_tv_10_onna_mahoutsukai_use_magic_to_grand_princess_fire_dragon
light_off_02=maou_kiss_yuusha
close_door=maoyuu_tv_07_chief_maid_close_door
pass_mic=maou_catch_yuusha_pillow
keep_quiet_01=maoyuu_tv_05_winter_king_sr_dead
keep_quiet_02=maoyuu_tv_03_chief_maid_touch_maou_oppai
do_not_fight=maoyuu_tv_05_maou_beat_yuusha_with_yuusha_pillow

refuse=maoyuu_tv_01_become_my_property_i_refuse+maoyuu_tv_05_yuusha_say_maou_is_punipuni_02+maoyuu_tv_05_maou_bed_sport
to_be_continued=maoyuu_tv_04_maou_cry+maoyuu_tv_04_maou_teatime



puzzle_and_dragons_gameplay_short=SSRC(RESIZE_TO_REF_CLIP(ConvertFPS(puzzle_and_dragons_gameplay_short,map_audio),map_audio),48000)
lovetra_sweet_pv_short=SSRC(ConvertFPS(lovetra_sweet_pv_short,map_audio),48000)

######## Pre Combine - Subtitle ########

cm_kaimon_toshi_map=ConvertToRGB32(cm_kaimon_toshi_map)
cm_kaimon_toshi_map=SUBTITLE_N(cm_kaimon_toshi_map,"1.Ö~ùH",is_title=true)
cm_kaimon_toshi_map=ConvertToYV12(cm_kaimon_toshi_map)

cm_winter_country_map=ConvertToRGB32(cm_winter_country_map)
cm_winter_country_map=SUBTITLE_N(cm_winter_country_map,"2.¿Ü»¢ºx",is_title=true)
cm_winter_country_map=ConvertToYV12(cm_winter_country_map)

cm_church_map=ConvertToRGB32(cm_church_map)
cm_church_map=SUBTITLE_N(cm_church_map,"3.ç¬èèå,AZ3Pçêé",is_title=true)
cm_church_map=ConvertToYV12(cm_church_map)

cm_mazoku_attack_map=ConvertToRGB32(cm_mazoku_attack_map)
cm_mazoku_attack_map=SUBTITLE_N(cm_mazoku_attack_map,"4.sPèêm",is_title=true)
cm_mazoku_attack_map=ConvertToYV12(cm_mazoku_attack_map)

cm_doumei_map=ConvertToRGB32(cm_doumei_map)
cm_doumei_map=SUBTITLE_N(cm_doumei_map,"5.ÜåãßÜäoú©",is_title=true)
cm_doumei_map=ConvertToYV12(cm_doumei_map)

cm_mazoku_and_human_boundry_map=ConvertToRGB32(cm_mazoku_and_human_boundry_map)
cm_mazoku_and_human_boundry_map=SUBTITLE_N(cm_mazoku_and_human_boundry_map,"à®K¥I¤ð...",is_title=true)
cm_mazoku_and_human_boundry_map=ConvertToYV12(cm_mazoku_and_human_boundry_map)

cm_lake_map=ConvertToRGB32(cm_lake_map)
cm_lake_map=SUBTITLE_N(cm_lake_map,"vÈö¸a§Æ\,¥...",is_title=true)
cm_lake_map=ConvertToYV12(cm_lake_map)

cm_mazoku_vs_human=ConvertToRGB32(cm_mazoku_vs_human)
cm_mazoku_vs_human=SUBTITLE_N(cm_mazoku_vs_human,"låDÌæÕ¦Jn",is_title=true)
cm_mazoku_vs_human=SUBTITLE_N(cm_mazoku_vs_human,"--------              ",is_title=true)
cm_mazoku_vs_human=ConvertToYV12(cm_mazoku_vs_human)



do_not_eat_food_01=ConvertToRGB32(do_not_eat_food_01)
do_not_eat_food_01=SUBTITLE_WARNING(do_not_eat_food_01,"[staffVê,È°à×ÙIÎ´ö]",second_subtitle_x,second_subtitle_y,430,590)
do_not_eat_food_01=SUBTITLE_N(do_not_eat_food_01,"¾ü¡f~~~",subtitle_x,subtitle_y,1,60,false)
do_not_eat_food_01=SUBTITLE_N(do_not_eat_food_01,"òì{÷ùNÒkð¬`ë",subtitle_x,subtitle_y,65,155,false)
do_not_eat_food_01=SUBTITLE_N(do_not_eat_food_01,"RãuÁIðºãê",subtitle_x,subtitle_y,205,285,false)
do_not_eat_food_01=SUBTITLE_N(do_not_eat_food_01,"û¢!¾_¹!",subtitle_x,subtitle_y,325,365,false)
do_not_eat_food_01=SUBTITLE_N(do_not_eat_food_01,"Ý¡h¢!",subtitle_x,subtitle_y,375,410,false)
do_not_eat_food_01=SUBTITLE_N(do_not_eat_food_01,"¢...ßÂ...ID",subtitle_x,subtitle_y,430,490,false)
do_not_eat_food_01=SUBTITLE_N(do_not_eat_food_01,"V±Ò¹",subtitle_x,subtitle_y,525,542,false)
do_not_eat_food_01=SUBTITLE_N(do_not_eat_food_01,""""V±Ò¹"¥YõÓv¢!""",subtitle_x,subtitle_y,545,580,false)
do_not_eat_food_01=ConvertToYV12(do_not_eat_food_01)

do_not_eat_food_02=ConvertToRGB32(do_not_eat_food_02)
do_not_eat_food_02=SUBTITLE_N(do_not_eat_food_02,"v¥¸æù¿iðêIb,ðístaffàG!",subtitle_x,subtitle_y,30,90,false)
do_not_eat_food_02=SUBTITLE_N(do_not_eat_food_02,"õõìåÅ!",subtitle_x,subtitle_y,105,135,false)
do_not_eat_food_02=SUBTITLE_N(do_not_eat_food_02,"s£¹ù¿ÄiêIb|Ââisã¥çK¥G(E)",subtitle_x,subtitle_y-subtitle_size,145,260,false)
do_not_eat_food_02=ConvertToYV12(do_not_eat_food_02)

light_off_01=ConvertToRGB32(light_off_01)
light_off_01=SUBTITLE_N(light_off_01,"ö×ç²¥Ìç²ßP&D|ÈíHìlõp@èÙÂ¹",subtitle_x,subtitle_y-subtitle_size,5,120,false)
light_off_01=ConvertToYV12(light_off_01)

light_off_02=ConvertToRGB32(light_off_02)
light_off_02=SUBTITLE_WARNING(light_off_02,"[úMõs×¯»¢ºx]",second_subtitle_x,second_subtitle_y,5,515)
light_off_02=SUBTITLE_N(light_off_02,"æîäzIêéé é îîI",subtitle_x,subtitle_y,10,70,false)
light_off_02=SUBTITLE_N(light_off_02,"ÔÚçk_î",subtitle_x,subtitle_y,85,130,false)
light_off_02=SUBTITLE_N(light_off_02,"¥v?sð¾ãô¹v?",subtitle_x,subtitle_y,145,200,false)
light_off_02=SUBTITLE_N(light_off_02,"NÒk®",subtitle_x,subtitle_y,215,235,false)
light_off_02=SUBTITLE_N(light_off_02,"ßÂ...EÒ...",subtitle_x,subtitle_y,260,310,false)
light_off_02=SUBTITLE_N(light_off_02,"Yõ?",subtitle_x,subtitle_y,370,380,false)
light_off_02=SUBTITLE_N(light_off_02,"EÒ...",subtitle_x,subtitle_y,415,435,false)
light_off_02=SUBTITLE_N(light_off_02,"¤...",subtitle_x,subtitle_y,470,490,false)
light_off_02=ConvertToYV12(light_off_02)

close_door=ConvertToRGB32(close_door)
close_door=SUBTITLE_WARNING(close_door,"[3P¿ç¬èèå]",second_subtitle_x,second_subtitle_y,5,185)
close_door=SUBTITLE_N(close_door,"3ÂlêNèNåÒ¤xtªb~~~",subtitle_x,subtitle_y,5,75,false)
close_door=ConvertToYV12(close_door)

pass_mic=ConvertToRGB32(pass_mic)
pass_mic=SUBTITLE_WARNING(pass_mic,"[p÷éPèêmIãµpplay]",second_subtitle_x,second_subtitle_y,95,255)
pass_mic=SUBTITLE_N(pass_mic,"(êm)-->",60,280,5,90,false)
pass_mic=SUBTITLE_N(pass_mic,"<--(êm)",-90,240,95,255,false)
pass_mic=SUBTITLE_N(pass_mic,"êm¾¾¥¢äIà",subtitle_x,subtitle_y,15,75,false)
pass_mic=SUBTITLE_N(pass_mic,"êm~~~êm~~~",subtitle_x,subtitle_y-subtitle_size,95,255,false)
pass_mic=SUBTITLE_N(pass_mic,"¿Y¹b,á¶Â\õ§v¬n",subtitle_x,subtitle_y,135,203,false)
pass_mic=SUBTITLE_N(pass_mic,"¶,äá¶Í§×",subtitle_x,subtitle_y,205,255,false)
pass_mic=ConvertToYV12(pass_mic)

keep_quiet_01=ConvertToRGB32(keep_quiet_01)
keep_quiet_01=SUBTITLE_WARNING(keep_quiet_01,"[èÏw¾åãß,íHìlõh{¹]",second_subtitle_x,second_subtitle_y,125,330)
keep_quiet_01=SUBTITLE_N(keep_quiet_01,"ö¹JA¥8äÝ1!!!",subtitle_x,subtitle_y,3,40,false)
keep_quiet_01=SUBTITLE_N(keep_quiet_01,"I¥ÝåãßYõf!!!!!",subtitle_x,subtitle_y,55,80,false)
keep_quiet_01=ConvertToYV12(keep_quiet_01)

keep_quiet_02=ConvertToRGB32(keep_quiet_02)
keep_quiet_02=SUBTITLE_WARNING(keep_quiet_02,"[Üåãßú©,á¢¶«ézï¿âèÎÊmTä]",second_subtitle_x,second_subtitle_y,5,305)
keep_quiet_02=SUBTITLE_N(keep_quiet_02,"¢,¶¢¢!I¥ÝôYõ!?",subtitle_x,subtitle_y,10,75,false)
keep_quiet_02=SUBTITLE_N(keep_quiet_02,"_ÂIsßKinectIug|àÕ©ÂèôÌ",subtitle_x,subtitle_y-subtitle_size,80,175,false)
keep_quiet_02=SUBTITLE_N(keep_quiet_02,"Ê÷xÊRsÐúÁ",subtitle_x,subtitle_y,200,240,false)
keep_quiet_02=SUBTITLE_N(keep_quiet_02,"v¹~~~!!!",subtitle_x,subtitle_y,245,265,false)
keep_quiet_02=ConvertToYV12(keep_quiet_02)

refuse=ConvertToRGB32(refuse)
refuse=SUBTITLE_N(refuse,"üEÒà®±K¥ã",subtitle_x,subtitle_y,40,90,false)
refuse=SUBTITLE_N(refuse,"äÄê½S¿",subtitle_x,subtitle_y,110,155,false)
refuse=SUBTITLE_N(refuse,"IzàYõ,äIÌF¢!",subtitle_x,subtitle_y,180,235,false)
refuse=SUBTITLE_N(refuse,"æîäè¡èêNÒÁÌæÕb!EÒ!",subtitle_x,subtitle_y,375,445,false)
refuse=SUBTITLE_N(refuse,"äâ!!!",subtitle_x,subtitle_y,500,515,false)
refuse=SUBTITLE_N(refuse,"×YõL¹K¥Òss¢!",subtitle_x,subtitle_y,620,650,false)
refuse=SUBTITLE_N(refuse,"Iâ`å¹s!",subtitle_x,subtitle_y,655,675,false)
refuse=SUBTITLE_N(refuse,"â`å¹s¥Yõ¢!",subtitle_x,subtitle_y,685,725,false)
refuse=SUBTITLE_N(refuse,"ä¾¾ßãSkwÍûÌ¹à",subtitle_x,subtitle_y,740,785,false)
refuse=SUBTITLE_N(refuse,"IÂ...ìssÊ÷¤!",subtitle_x,subtitle_y,795,850,false)
refuse=SUBTITLE_N(refuse,"ìss...",subtitle_x,subtitle_y,900,920,false)
refuse=SUBTITLE_N(refuse,"ìss¥v...",subtitle_x,subtitle_y,950,980,false)
refuse=SUBTITLE_N(refuse,"à¹ìssv!",subtitle_x,subtitle_y,995,1025,false)
refuse=SUBTITLE_N(refuse,"¥ÂæË{v!ÂæË{...",subtitle_x,subtitle_y,1030,1089,false)
refuse=SUBTITLE_N(refuse,"É...Iv¢...",subtitle_x,subtitle_y,1090,1120,false)
refuse=SUBTITLE_N(refuse,"äÂ¥úsLô°O^®¸ìI",subtitle_x,subtitle_y,1135,1235,false)
refuse=ConvertToYV12(refuse)

do_not_fight=ConvertToRGB32(do_not_fight)
do_not_fight=SUBTITLE_WARNING(do_not_fight,"[Ö~Æ\ié¦s×,p¤løCK¯]",second_subtitle_x,second_subtitle_y,12,410)
do_not_fight=SUBTITLE_N(do_not_fight,"²Yõ",subtitle_x,subtitle_y,85,105,false)
do_not_fight=SUBTITLE_N(do_not_fight,"Äàìss,ÄàlÆìssÊ÷¤¢!",subtitle_x,subtitle_y,120,235,false)
do_not_fight=SUBTITLE_N(do_not_fight,"ÌæÕüvz¥AÂÈ¹¢|ÇI¥s¥â`å¹s!",subtitle_x,subtitle_y-subtitle_size,255,365,false)
do_not_fight=SUBTITLE_N(do_not_fight,"sÂ\ßõÈdb",subtitle_x,subtitle_y,375,410,false)
do_not_fight=ConvertToYV12(do_not_fight)

to_be_continued=ConvertToRGB32(to_be_continued)
to_be_continued=SUBTITLE_WARNING(to_be_continued,"[Æ\h¡ü:113]",second_subtitle_x,second_subtitle_y,5,350)
to_be_continued=SUBTITLE_N(to_be_continued,"ÈEÒÒ¥sæîä¥Ìjj~~~",subtitle_x,subtitle_y,10,88,false)
to_be_continued=SUBTITLE_N(to_be_continued,"D,D,¡VÒ¥õêyx§b",subtitle_x,subtitle_y,90,165,false)
to_be_continued=SUBTITLE_N(to_be_continued,"ê¼ïßIbð¶aIG",subtitle_x,subtitle_y,175,225,false)
to_be_continued=SUBTITLE_N(to_be_continued,"äm¹¹,êyÌIîA`õI¹",subtitle_x,subtitle_y,265,335,false)
to_be_continued=SUBTITLE_N(to_be_continued,"èí,¼ì\s\ÒÁRuÞûIÌæÕ?",subtitle_x,subtitle_y,365,430,false)
to_be_continued=ConvertToYV12(to_be_continued)



puzzle_and_dragons_gameplay_short=ConvertToRGB32(puzzle_and_dragons_gameplay_short)
puzzle_and_dragons_gameplay_short=SUBTITLE_WARNING(puzzle_and_dragons_gameplay_short,"[Î´ö³ÝßPuzzle & Dragons...]",second_subtitle_x,second_subtitle_y,5,340)
puzzle_and_dragons_gameplay_short=ConvertToYV12(puzzle_and_dragons_gameplay_short)

######## Combine ########

cm_maoyuu_tv=prologue \
	++cm_kaimon_toshi_map++do_not_eat_food_01++do_not_eat_food_02 \
	++cm_winter_country_map++puzzle_and_dragons_gameplay_short++light_off_01++light_off_02 \
	++cm_church_map++close_door \
	++cm_mazoku_attack_map++pass_mic \
	++cm_doumei_map++keep_quiet_01++lovetra_sweet_pv_short++keep_quiet_02 \
	++cm_mazoku_and_human_boundry_map++refuse++do_not_fight \
	++cm_lake_map++to_be_continued++cm_mazoku_vs_human \
	++BlankClip(map_audio,length=72,color=color_black)

cm_maoyuu_tv

######## Post Processing ########

ConvertToYV12()
#ConvertToYUY2()
#ConvertToRGB24()

TCPServer()
