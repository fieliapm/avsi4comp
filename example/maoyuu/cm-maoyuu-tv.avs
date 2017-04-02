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
prologue=SUBTITLE_N(prologue,"ããîIä≈àÍå¬ìåêº",subtitle_x,subtitle_y,25,90,false)
prologue=SUBTITLE_N(prologue,"öIà¢...à¢!",subtitle_x,subtitle_y,195,260,false)
prologue=SUBTITLE_N(prologue,"îáê•...?",subtitle_x,subtitle_y,355,375,false)
prologue=SUBTITLE_N(prologue,"îáê•â‰àÍíºå∂ëzî\òÙìIéñ",subtitle_x,subtitle_y,380,440,false)
prologue=SUBTITLE_N(prologue,"ê•â‰èäì≤ú€ìIèÓåi",subtitle_x,subtitle_y,480,515,false)
prologue=SUBTITLE_N(prologue,"îIìI...ì≤ú€...?",subtitle_x,subtitle_y,580,635,false)
prologue=SUBTITLE_N(prologue,"ê•ìI",subtitle_x,subtitle_y,675,685,false)
prologue=SUBTITLE_N(prologue,"ìﬂå¬ô‘òAö±ìIè„ñ óLèYõı,îIëzâﬂöv?",subtitle_x,subtitle_y,740,825,false)
prologue=SUBTITLE_N(prologue,"<--(íÜâõëÂõ{)",-60,75,740,825,false)
prologue=SUBTITLE_N(prologue,"àΩê•ëzâﬂëÂçuì∞ìIó°ñ óLèYõıöv?",subtitle_x,subtitle_y,875,975,false)
prologue=SUBTITLE_N(prologue,"(îáä‘òèÍìIñºéö)",second_subtitle_x,second_subtitle_y,875,975,false)
prologue=SUBTITLE_N(prologue,"ñÁãñóLîb...ú‰äYê‡èÌîáõıëzâﬂ...",subtitle_x,subtitle_y,1000,1065,false)
prologue=SUBTITLE_N(prologue,"õîîb?ïLËÌê•êaémöv!úkä˙ë“öv!",subtitle_x,subtitle_y,1067,1150,false)
prologue=SUBTITLE_N(prologue,"ê•îb...",subtitle_x,subtitle_y,1180,1200,false)
prologue=SUBTITLE_N(prologue,"â‰èAê•ëzô“â¡îáå¬äàìÆ",subtitle_x,subtitle_y,1235,1285,false)
prologue=SUBTITLE_N(prologue,"ç›Ê§èë‰oçHçÏôßó›îVå„,î\Á◊ï˙öÿóÕìIäàìÆ",subtitle_x,subtitle_y,1315,1385,false)
prologue=SUBTITLE_N(prologue,"èäà»,â‰ëzÊÓîIê‡",subtitle_x,subtitle_y,1420,1495,false)
prologue=SUBTITLE_N(prologue,"ÊÓâ‰àÍãNãéè•âÃîb,óEé“",subtitle_x,subtitle_y,1525,1580,false)
prologue=SUBTITLE_N(prologue,"à◊óπâï˙â‰òÏíòñ¿âóìÆñüâÃã»ìIìﬂï™ä¥ìÆ",subtitle_x,subtitle_y,1605,1670,false)
prologue=SUBTITLE_N(prologue,"ëzóvîIê¨à◊â‰ìIçá„ﬂ,‰oâ‰àÍãNçÇâÃ,ï™ãùâ‰ìIä¥ìÆ",subtitle_x,subtitle_y,1685,1815,false)
prologue=SUBTITLE_N(prologue,"ïsçsöv?",subtitle_x,subtitle_y,1905,1925,false)
prologue=SUBTITLE_N(prologue,"ïsçs!",subtitle_x,subtitle_y,1940,1955,false)
prologue=SUBTITLE_N(prologue,"ê‚õîöv?",subtitle_x,subtitle_y,1985,2005,false)
prologue=SUBTITLE_N(prologue,"ê‚õî!",subtitle_x,subtitle_y,2020,2040,false)
prologue=SUBTITLE_N(prologue,"ë¸àˆà◊úÜóLêlùëò™öv?",subtitle_x,subtitle_y,2070,2110,false)
prologue=SUBTITLE_N(prologue,"õî!",subtitle_x,subtitle_y,2115,2125,false)
prologue=SUBTITLE_N(prologue,"Ç∂Å[Å[Å[",subtitle_x,subtitle_y,2185,2245,false)
prologue=SUBTITLE_N(prologue,"üìóLï ìIóùóRöG!",subtitle_x,subtitle_y,2255,2275,false)
prologue=SUBTITLE_N(prologue,"ê^ìIöG!",subtitle_x,subtitle_y,2290,2305,false)
prologue=SUBTITLE_N(prologue,"â‰ä≈óL",subtitle_x,subtitle_y,2330,2350,false)
prologue=SUBTITLE_N(prologue,"à◊èYõıóvópîáõıñGéEìIï\èÓà¢!",subtitle_x,subtitle_y,2410,2480,false)
prologue=SUBTITLE_N(prologue,"â‰„„ï êlê‡,ô“â¡âÃÊèç’çDëúóLàÍç±êVãKíËìIûÈéq",subtitle_x,subtitle_y,2510,2605,false)
prologue=SUBTITLE_N(prologue,"ä≈îIçDëúîôïsËêêSìIûÈéqà¢",subtitle_x,subtitle_y,2660,2695,false)
prologue=SUBTITLE_N(prologue,"ìAèdêÈïzãKíËå„ä“ïsê•àÍûÈòé∏çT",subtitle_x,subtitle_y,2710,2755,false)
prologue=SUBTITLE_N(prologue,"ë≈ù{èdó˚îb",subtitle_x,subtitle_y,2770,2805,false)
prologue=SUBTITLE_N(prologue,"â∂,â‰èäímìπìIêVãKë•ê•îáûÈìI",subtitle_x,subtitle_y,2810,2902,false)
prologue=SUBTITLE_N(prologue,"ËcíËòVç[",subtitle_x,subtitle_y,2905,2920,false)
prologue=SUBTITLE_N(prologue,"â¬î\îb",subtitle_x,subtitle_y,2925,2935,false)
prologue=SUBTITLE_N(prologue,"íAê•üìóLîáç±ãKë•èAïsî\è•ìæ·∂ãª",subtitle_x,subtitle_y,2955,3075,false)
prologue=SUBTITLE_N(prologue,"ïséÁãKë•ìIçsà◊òaç¨ò™ìIíÅèò",subtitle_x,subtitle_y,3095,3155,false)
prologue=SUBTITLE_N(prologue,"òë≈ò™ë¥ëºêlå¥ñ{ä¥ìÆìûëzàÍâÃì¸ç∞ìIêSèÓ",subtitle_x,subtitle_y,3165,3280,false)
prologue=SUBTITLE_N(prologue,"èäà»staffçÀòãÍêSí˘íËîáç±ãKë•",subtitle_x,subtitle_y,3295,3340,false)
prologue=SUBTITLE_N(prologue,"ìﬂõıèA„„îIê‡ê‡ãKë•îb",subtitle_x,subtitle_y,3430,3475,false)
prologue=SUBTITLE_N(prologue,"Â´ëRâ‰ê•ïsï¯èYõıä˙ñ]",subtitle_x,subtitle_y,3515,3570,false)
prologue=ConvertToYV12(prologue)

prologue

### prefetch: 5,2

### ###

""")

prologue=AudioDub(last,maoyuu_tv_01_explain_the_other_side_of_the_hill)

######## Game ########

puzzle_and_dragons_gameplay=FFMS2_VIDEO_SOURCE("src\puzzle_and_dragon\ÉpÉYÉãÅïÉhÉâÉSÉìÉYÅ@ÉÄÉâÉRè¡ÇµÉXÉyÉVÉÉÉãÅ@Åôèâãâï“Åô.480p.flv",fpsnum=30000,fpsden=1001)
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
cm_kaimon_toshi_map=SUBTITLE_N(cm_kaimon_toshi_map,"1.ã÷é~à˘êH",is_title=true)
cm_kaimon_toshi_map=ConvertToYV12(cm_kaimon_toshi_map)

cm_winter_country_map=ConvertToRGB32(cm_winter_country_map)
cm_winter_country_map=SUBTITLE_N(cm_winter_country_map,"2.êøñ‹êªë¢çÇó∫ìx",is_title=true)
cm_winter_country_map=ConvertToYV12(cm_winter_country_map)

cm_church_map=ConvertToRGB32(cm_church_map)
cm_church_map=SUBTITLE_N(cm_church_map,"3.Á¨éËËêñÂ,èAéZ3PñÁàÍûÈ",is_title=true)
cm_church_map=ConvertToYV12(cm_church_map)

cm_mazoku_attack_map=ConvertToRGB32(cm_mazoku_attack_map)
cm_mazoku_attack_map=SUBTITLE_N(cm_mazoku_attack_map,"4.ïsûPêËÍmçéïó",is_title=true)
cm_mazoku_attack_map=ConvertToYV12(cm_mazoku_attack_map)

cm_doumei_map=ConvertToRGB32(cm_doumei_map)
cm_doumei_map=SUBTITLE_N(cm_doumei_map,"5.ñ‹ëÂ„ﬂåñâ‹‰oà˙ã©",is_title=true)
cm_doumei_map=ConvertToYV12(cm_doumei_map)

cm_mazoku_and_human_boundry_map=ConvertToRGB32(cm_mazoku_and_human_boundry_map)
cm_mazoku_and_human_boundry_map=SUBTITLE_N(cm_mazoku_and_human_boundry_map,"ê‡äÆãKë•ìIñÇâ§ò...",is_title=true)
cm_mazoku_and_human_boundry_map=ConvertToYV12(cm_mazoku_and_human_boundry_map)

cm_lake_map=ConvertToRGB32(cm_lake_map)
cm_lake_map=SUBTITLE_N(cm_lake_map,"ïvç»àˆé∏òaéßâ∆ñ\,âóê•...",is_title=true)
cm_lake_map=ConvertToYV12(cm_lake_map)

cm_mazoku_vs_human=ConvertToRGB32(cm_mazoku_vs_human)
cm_mazoku_vs_human=SUBTITLE_N(cm_mazoku_vs_human,"êlñÇëÂùDâÃÊèç’ë¶õíäJén",is_title=true)
cm_mazoku_vs_human=SUBTITLE_N(cm_mazoku_vs_human,"--------              ",is_title=true)
cm_mazoku_vs_human=ConvertToYV12(cm_mazoku_vs_human)



do_not_eat_food_01=ConvertToRGB32(do_not_eat_food_01)
do_not_eat_food_01=SUBTITLE_WARNING(do_not_eat_food_01,"[staffîVàÍ,à»ï∞‡ñà◊ûŸìIâŒó¥åˆèó]",second_subtitle_x,second_subtitle_y,430,590)
do_not_eat_food_01=SUBTITLE_N(do_not_eat_food_01,"ëæî¸ñ°ùf~~~",subtitle_x,subtitle_y,1,60,false)
do_not_eat_food_01=SUBTITLE_N(do_not_eat_food_01,"îáâÚñÏå{ì˜ô˘ãNò“úkòï¨è`ñÎ",subtitle_x,subtitle_y,65,155,false)
do_not_eat_food_01=SUBTITLE_N(do_not_eat_food_01,"ëRå„çáíòîáôuó¡ìIéâ∫„Í",subtitle_x,subtitle_y,205,285,false)
do_not_eat_food_01=SUBTITLE_N(do_not_eat_food_01,"ô˚à¢!ëæñ_óπ!",subtitle_x,subtitle_y,325,365,false)
do_not_eat_food_01=SUBTITLE_N(do_not_eat_food_01,"ç›îáó°ãhäÖà¢!",subtitle_x,subtitle_y,375,410,false)
do_not_eat_food_01=SUBTITLE_N(do_not_eat_food_01,"à¢...ìﬂå¬...îIçD",subtitle_x,subtitle_y,430,490,false)
do_not_eat_food_01=SUBTITLE_N(do_not_eat_food_01,"ìVî±ò“óπ",subtitle_x,subtitle_y,525,542,false)
do_not_eat_food_01=SUBTITLE_N(do_not_eat_food_01,""""ìVî±ò“óπ"ê•èYõıà”évà¢!""",subtitle_x,subtitle_y,545,580,false)
do_not_eat_food_01=ConvertToYV12(do_not_eat_food_01)

do_not_eat_food_02=ConvertToRGB32(do_not_eat_food_02)
do_not_eat_food_02=SUBTITLE_N(do_not_eat_food_02,"óvê•ä∏õÊà˘óøêiòèÍäÖìIòb,òîÌstaff‡ñéÄöG!",subtitle_x,subtitle_y,30,90,false)
do_not_eat_food_02=SUBTITLE_N(do_not_eat_food_02,"úÉõıîáõıñÏÂ≈!",subtitle_x,subtitle_y,105,135,false)
do_not_eat_food_02=SUBTITLE_N(do_not_eat_food_02,"ïsä£óπà˘óøçƒêièÍìIòb|â¬‚iïsè„ê•èÖéÁãKë•öG(éEüÜ)",subtitle_x,subtitle_y-subtitle_size,145,260,false)
do_not_eat_food_02=ConvertToYV12(do_not_eat_food_02)

light_off_01=ConvertToRGB32(light_off_01)
light_off_01=SUBTITLE_N(light_off_01,"àˆà◊çÑçÑÁ≤è•âÃÁ≤äﬂP&D|èäà»îÌçHçÏêlàıópñÇñ@ËêãŸï¬óπ",subtitle_x,subtitle_y-subtitle_size,5,120,false)
light_off_01=ConvertToYV12(light_off_01)

light_off_02=ConvertToRGB32(light_off_02)
light_off_02=SUBTITLE_WARNING(light_off_02,"[ï˙ëMåıçsà◊éãìØêªë¢çÇó∫ìx]",second_subtitle_x,second_subtitle_y,5,515)
light_off_02=SUBTITLE_N(light_off_02,"ÊÓâ‰ëzìIàÍûÈÈ†È†ìÓìÓìI",subtitle_x,subtitle_y,10,70,false)
light_off_02=SUBTITLE_N(light_off_02,"îáô‘ë⁄ñÁúkè_ìÓ",subtitle_x,subtitle_y,85,130,false)
light_off_02=SUBTITLE_N(light_off_02,"ê•öv?ïsòëæ„Ùóπöv?",subtitle_x,subtitle_y,145,200,false)
light_off_02=SUBTITLE_N(light_off_02,"êáãNò“úkòÆïû",subtitle_x,subtitle_y,215,235,false)
light_off_02=SUBTITLE_N(light_off_02,"ìﬂå¬...óEé“...",subtitle_x,subtitle_y,260,310,false)
light_off_02=SUBTITLE_N(light_off_02,"èYõı?",subtitle_x,subtitle_y,370,380,false)
light_off_02=SUBTITLE_N(light_off_02,"óEé“...",subtitle_x,subtitle_y,415,435,false)
light_off_02=SUBTITLE_N(light_off_02,"ñÇâ§...",subtitle_x,subtitle_y,470,490,false)
light_off_02=ConvertToYV12(light_off_02)

close_door=ConvertToRGB32(close_door)
close_door=SUBTITLE_WARNING(close_door,"[3PéûêøÁ¨éËËêñÂ]",second_subtitle_x,second_subtitle_y,5,185)
close_door=SUBTITLE_N(close_door,"3å¬êlàÍãNËêãNñÂò“ã§ìxètè™îb~~~",subtitle_x,subtitle_y,5,75,false)
close_door=ConvertToYV12(close_door)

pass_mic=ConvertToRGB32(pass_mic)
pass_mic=SUBTITLE_WARNING(pass_mic,"[ópì˜ÈìûPêËÍmçéïóìI„µípplay]",second_subtitle_x,second_subtitle_y,95,255)
pass_mic=SUBTITLE_N(pass_mic,"(Ímçéïó)-->",60,280,5,90,false)
pass_mic=SUBTITLE_N(pass_mic,"<--(Ímçéïó)",-90,240,95,255,false)
pass_mic=SUBTITLE_N(pass_mic,"Ímçéïóñæñæê•õ¢âóâ‰ìIê‡",subtitle_x,subtitle_y,15,75,false)
pass_mic=SUBTITLE_N(pass_mic,"Ímçéïó~~~Ímçéïó~~~",subtitle_x,subtitle_y-subtitle_size,95,255,false)
pass_mic=SUBTITLE_N(pass_mic,"êøñYóπîb,·∂â¬î\âıéßêvë¨ín",subtitle_x,subtitle_y,135,203,false)
pass_mic=SUBTITLE_N(pass_mic,"â∂,â‰·∂óÕéßà◊",subtitle_x,subtitle_y,205,255,false)
pass_mic=ConvertToYV12(pass_mic)

keep_quiet_01=ConvertToRGB32(keep_quiet_01)
keep_quiet_01=SUBTITLE_WARNING(keep_quiet_01,"[ËœîwëæëÂ„ﬂ,îÌçHçÏêlàıãhù{óπ]",second_subtitle_x,second_subtitle_y,125,330)
keep_quiet_01=SUBTITLE_N(keep_quiet_01,"åˆìπôJèAê•8‰›1!!!",subtitle_x,subtitle_y,3,40,false)
keep_quiet_01=SUBTITLE_N(keep_quiet_01,"îIê•ç›ëÂ„ﬂèYõıùf!!!!!",subtitle_x,subtitle_y,55,80,false)
keep_quiet_01=ConvertToYV12(keep_quiet_01)

keep_quiet_02=ConvertToRGB32(keep_quiet_02)
keep_quiet_02=SUBTITLE_WARNING(keep_quiet_02,"[ñ‹ëÂ„ﬂà˙ã©,·¢ê∂ê´ÈzèÔêøó‚ËŒí ímíÜçTë‰]",second_subtitle_x,second_subtitle_y,5,305)
keep_quiet_02=SUBTITLE_N(keep_quiet_02,"à¢,â∂à¢à¢!îIîáê•ç›òÙèYõı!?",subtitle_x,subtitle_y,10,75,false)
keep_quiet_02=SUBTITLE_N(keep_quiet_02,"îáô_å¬åéîIìsüìäﬂKinectìIÉâÉuÅôÉgÉå|‡’é©ï¬ËêòÙâÃ",subtitle_x,subtitle_y-subtitle_size,80,175,false)
keep_quiet_02=SUBTITLE_N(keep_quiet_02,"ë ì˜ìxâ ëRïsù–˙ùâ¡",subtitle_x,subtitle_y,200,240,false)
keep_quiet_02=SUBTITLE_N(keep_quiet_02,"óvãéóπ~~~!!!",subtitle_x,subtitle_y,245,265,false)
keep_quiet_02=ConvertToYV12(keep_quiet_02)

refuse=ConvertToRGB32(refuse)
refuse=SUBTITLE_N(refuse,"å¸óEé“ê‡äÆîáç±ãKë•å„",subtitle_x,subtitle_y,40,90,false)
refuse=SUBTITLE_N(refuse,"â‰çƒàÍéüêΩêSêøãÅ",subtitle_x,subtitle_y,110,155,false)
refuse=SUBTITLE_N(refuse,"îIëzê‡èYõı,â‰ìIâÃóFà¢!",subtitle_x,subtitle_y,180,235,false)
refuse=SUBTITLE_N(refuse,"ÊÓâ‰éËå°éËàÍãNãéô“â¡âÃÊèç’îb!óEé“!",subtitle_x,subtitle_y,375,445,false)
refuse=SUBTITLE_N(refuse,"â‰ãëê‚!!!",subtitle_x,subtitle_y,500,515,false)
refuse=SUBTITLE_N(refuse,"à◊èYõıóLóπãKë•ä“ïsçsà¢!",subtitle_x,subtitle_y,620,650,false)
refuse=SUBTITLE_N(refuse,"îIîá‚úí`ëÂâπís!",subtitle_x,subtitle_y,655,675,false)
refuse=SUBTITLE_N(refuse,"‚úí`ëÂâπísê•èYõıà¢!",subtitle_x,subtitle_y,685,725,false)
refuse=SUBTITLE_N(refuse,"â‰ñæñæõﬂ„SúkìwóÕó˚âÃóπê‡",subtitle_x,subtitle_y,740,785,false)
refuse=SUBTITLE_N(refuse,"îIîáå¬...îÏìsìsë ì˜ñÇâ§!",subtitle_x,subtitle_y,795,850,false)
refuse=SUBTITLE_N(refuse,"îÏìsìs...",subtitle_x,subtitle_y,900,920,false)
refuse=SUBTITLE_N(refuse,"îÏìsìsê•öv...",subtitle_x,subtitle_y,950,980,false)
refuse=SUBTITLE_N(refuse,"çÑçÑê‡óπîÏìsìsöv!",subtitle_x,subtitle_y,995,1025,false)
refuse=SUBTITLE_N(refuse,"ê•îáå¬ÊÀö{öv!îáå¬ÊÀö{...",subtitle_x,subtitle_y,1030,1089,false)
refuse=SUBTITLE_N(refuse,"í…...öIóvà¢...",subtitle_x,subtitle_y,1090,1120,false)
refuse=SUBTITLE_N(refuse,"â‰â¬ê•ñàì˙ìsóLòÙè∞ëOâ^ìÆå∏îÏìI",subtitle_x,subtitle_y,1135,1235,false)
refuse=ConvertToYV12(refuse)

do_not_fight=ConvertToRGB32(do_not_fight)
do_not_fight=SUBTITLE_WARNING(do_not_fight,"[ã÷é~â∆ñ\ìôäiÈ¶çsà◊,ópà§êlï¯ñçäCKñíìØ]",second_subtitle_x,second_subtitle_y,12,410)
do_not_fight=SUBTITLE_N(do_not_fight,"ä≤èYõı",subtitle_x,subtitle_y,85,105,false)
do_not_fight=SUBTITLE_N(do_not_fight,"çƒê‡îÏìsìs,çƒê‡êlâ∆îÏìsìsë ì˜ñÇâ§à¢!",subtitle_x,subtitle_y,120,235,false)
do_not_fight=SUBTITLE_N(do_not_fight,"âÃÊèç’ë¸óvëzè•èAâ¬à»óπà¢|ä«îIê•ïsê•‚úí`ëÂâπís!",subtitle_x,subtitle_y-subtitle_size,255,365,false)
do_not_fight=SUBTITLE_N(do_not_fight,"ïsâ¬î\ìﬂõıä»ödîb",subtitle_x,subtitle_y,375,410,false)
do_not_fight=ConvertToYV12(do_not_fight)

to_be_continued=ConvertToRGB32(to_be_continued)
to_be_continued=SUBTITLE_WARNING(to_be_continued,"[â∆ñ\ñhé°õìê¸:113]",second_subtitle_x,second_subtitle_y,5,350)
to_be_continued=SUBTITLE_N(to_be_continued,"èäà»óEé“ä“ê•ïsÊÓâ‰ãéè•âÃöjöj~~~",subtitle_x,subtitle_y,10,88,false)
to_be_continued=SUBTITLE_N(to_be_continued,"çD,çD,ç°ìVä“ê•âıÍyãéãxëßîb",subtitle_x,subtitle_y,90,165,false)
to_be_continued=SUBTITLE_N(to_be_continued,"àÍíºìÔâﬂìIòbòê∂ïaìIöG",subtitle_x,subtitle_y,175,225,false)
to_be_continued=SUBTITLE_N(to_be_continued,"â‰ímìπóπ,ÍyâÃìIéñèÓèAù`ëıîIóπ",subtitle_x,subtitle_y,265,335,false)
to_be_continued=SUBTITLE_N(to_be_continued,"ãÜËÌ,ëºòÏî\ïsî\èáóòô“â¡éRãuîﬁï˚ìIâÃÊèç’?",subtitle_x,subtitle_y,365,430,false)
to_be_continued=ConvertToYV12(to_be_continued)



puzzle_and_dragons_gameplay_short=ConvertToRGB32(puzzle_and_dragons_gameplay_short)
puzzle_and_dragons_gameplay_short=SUBTITLE_WARNING(puzzle_and_dragons_gameplay_short,"[âŒó¥åˆèóê≥ç›äﬂPuzzle & Dragons...]",second_subtitle_x,second_subtitle_y,5,340)
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
