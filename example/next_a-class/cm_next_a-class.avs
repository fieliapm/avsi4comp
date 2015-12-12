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

di_gi_charat_party_night=FFMS2_VIDEO_SOURCE("src\di_gi_charat-party_night\ƒfEƒWEƒLƒƒƒ‰ƒbƒg (Di Gi Charat)uParty™Nightv‚‰æ¿&‚‰¹¿.480p.flv")
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
	subtitle_ex=!is_title

	return SUBTITLE_NORMAL(clip,text,x,y,first_frame,last_frame,subtitle_font,subtitle_effects,size,subtitle_text_color,halo_color,subtitle_ex)
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



prologue_subtitle_01_first_frame=50
prologue_subtitle_01_last_frame=299
prologue_01=SUBTITLE_N(prologue_01,"20XX”N||V’ù’è“I’˜ìÜ–@ŠôŒÁÁ–Å—¹“ñŸ‘nì||‘S¢ŠE“I“ñ‘nŠˆ“®ˆöŸ‘–Œü‹@“®‰»ãSšz–Í®||ˆÈ‹K”ğŒx@“I’Êãh||’A‘½É˜¹“ï“¦–@–Ô",second_subtitle_x,second_subtitle_y,prologue_subtitle_01_first_frame,prologue_subtitle_01_last_frame,false)

prologue_subtitle_02_first_frame=0
prologue_subtitle_02_last_frame=249
prologue_02=SUBTITLE_N(prologue_02,"ˆ×—¹—LÁ‰„ã”“ñ‘nŠˆ“®||“ñ‘n“¯–GŒš‘¢—¹ˆÚ“®“ss||•ÛŒìÅŒã“I‘nì‰€’n||“¯–G¬ˆõ“I’†‰›‰ÌæÕœİŸİ—§ŸêyŠO||–ç”c•–±âxŒû”Àã‰İÔ||—RÅ’¸ë“Istaff‰íéj||•sĞ’n‚‘¬¾‘–",second_subtitle_x,second_subtitle_y,prologue_subtitle_02_first_frame,prologue_subtitle_02_last_frame,false)

prologue_subtitle_03_first_frame=250
prologue_subtitle_03_last_frame=499
prologue_02=SUBTITLE_N(prologue_02,"‘R§^”C‰íéj“Istaff‘\ãS¥E‹ÆæÎÔè||‘´‹Ál“I‰íéj‹Zp‹É­l”\’Çã||å«‘RŒx@\staffŸ“çk||’Aˆê”Êl–¯–ç•s“¾‘´–å§“ü||ˆöŸŠôŒÁŸ“—Ll”\™Òäo’†‰›‰ÌæÕ“I”M¥|||˜Všåj“I’†‰›‰ÌæÕ•Ö‘Q‘Q’n¬ˆ×™Bà",second_subtitle_x,second_subtitle_y,prologue_subtitle_03_first_frame,prologue_subtitle_03_last_frame,false)

prologue_subtitle_04_first_frame=500
prologue_02=SUBTITLE_N(prologue_02,"–^“V||ˆêˆÊ‰^Ÿ†‹É”w“I­—Nico||İVˆËX“ÁKTV||›”’˜©›ßˆÈ‘O¥‰ß(•ÊíˆÓ–¡ã)“Ià£‰Ìá¢˜Séz...",second_subtitle_x,second_subtitle_y,prologue_subtitle_04_first_frame,is_title=false)

prologue_02=FadeIn0(FadeOut(prologue_02,fade_length),fade_length)
prologue_blank_clip=BlankClip(prologue_01,length=24,color=color_black)
prologue=ConvertToYV12(prologue_01+prologue_blank_clip+prologue_02+prologue_blank_clip)



di_gi_charat_party_night_thumbnail=SUBTITLE_N(di_gi_charat_party_night_thumbnail,"(3l) Hold me baby ƒmƒŠƒmƒŠparty",subtitle_x,subtitle_y,50,149,false)
di_gi_charat_party_night_thumbnail=SUBTITLE_N(di_gi_charat_party_night_thumbnail,"(^“cƒAƒTƒ~) “µ‚Ü‚Å‹P‚¢‚Ä",subtitle_x,subtitle_y,151,236,false)
di_gi_charat_party_night_thumbnail=SUBTITLE_N(di_gi_charat_party_night_thumbnail,"(3l) Touch me baby are you ready ok?",subtitle_x,subtitle_y,241,341,false)
di_gi_charat_party_night_thumbnail=SUBTITLE_N(di_gi_charat_party_night_thumbnail,"(•Xã‹±q) Šy‚µ‚à‚¤ŒN‚à",subtitle_x,subtitle_y,343,432,false)
di_gi_charat_party_night_thumbnail=SUBTITLE_N(di_gi_charat_party_night_thumbnail,"(3l) Hold me baby —x‚ë‚¤‚æSunday",subtitle_x,subtitle_y,433,535,false)
di_gi_charat_party_night_thumbnail=SUBTITLE_N(di_gi_charat_party_night_thumbnail,"(‘òé‚İ‚ä‚«) ƒXƒeƒbƒv‚ğ“¥‚İ‚Ü‚µ‚å‚¤",subtitle_x,subtitle_y,536,625,false)

di_gi_charat_party_night_thumbnail=AddBorders(di_gi_charat_party_night_thumbnail,108,0,108,0)
di_gi_charat_party_night_thumbnail=RESIZE_TO_REF_CLIP(ConvertFPS(di_gi_charat_party_night_thumbnail,next_a_class_full_jp),next_a_class_full_jp)
di_gi_charat_party_night_thumbnail=ConvertToYV12(di_gi_charat_party_night_thumbnail)



original_subtitle=false

intro_length=24*4
next_a_class_full_jp_03_follow_raamen_truck=SUBTITLE_FX(next_a_class_full_jp_03_follow_raamen_truck,"Nico ƒjƒR|b”ãƒNƒjƒR|CV:‘òé‚İ‚ä‚«",550,300,211,211+intro_length)
next_a_class_full_jp_03_follow_raamen_truck=SUBTITLE_FX(next_a_class_full_jp_03_follow_raamen_truck,"Gatsu ƒKƒc|‰ä“ß”e‹B|CV:’Ã“cŒ’Ÿ˜Y",500,250,550,550+intro_length)
next_a_class_full_jp_03_follow_raamen_truck=SUBTITLE_FX(next_a_class_full_jp_03_follow_raamen_truck,"Makito ƒ}ƒLƒg|””’Jƒ}ƒLƒg|CV:—é‘ºŒ’ˆê",250,200,530,530+intro_length)
next_a_class_full_jp_03_follow_raamen_truck=SUBTITLE_FX(next_a_class_full_jp_03_follow_raamen_truck,(original_subtitle?"Old Man|ƒIƒ„ƒW":"Staff|åJ™˜—´")+"|CV:Šİ–ìK³",50,150,5772,5772+intro_length)

next_a_class_full_jp_03_follow_raamen_truck=SUBTITLE_FX(next_a_class_full_jp_03_follow_raamen_truck,original_subtitle?"":"NCU ACG Song Festival|’†‰›‰ÌæÕ‰®‘ä",100,350,370,370+36)

next_a_class_full_jp_03_follow_raamen_truck=SUBTITLE_N(next_a_class_full_jp_03_follow_raamen_truck,original_subtitle?"Y›õà£•Ğ...":"Y›õà£‰Ì...",subtitle_x,subtitle_y,22,57,false)
next_a_class_full_jp_03_follow_raamen_truck=SUBTITLE_N(next_a_class_full_jp_03_follow_raamen_truck,"(ˆá‹K’â•ú“I©sÔ›ßãS“P‹)",second_subtitle_x,second_subtitle_y,93,151,false)
next_a_class_full_jp_03_follow_raamen_truck=SUBTITLE_N(next_a_class_full_jp_03_follow_raamen_truck,"Š“”š",subtitle_x,subtitle_y,169,211,false)
next_a_class_full_jp_03_follow_raamen_truck=SUBTITLE_N(next_a_class_full_jp_03_follow_raamen_truck,"¡“V,¡“V“I‰ä...",subtitle_x,subtitle_y,212,281,false)
next_a_class_full_jp_03_follow_raamen_truck=SUBTITLE_N(next_a_class_full_jp_03_follow_raamen_truck,"”‡¥...",subtitle_x,subtitle_y,318,340,false)

next_a_class_full_jp_03_follow_raamen_truck=SUBTITLE_N(next_a_class_full_jp_03_follow_raamen_truck,original_subtitle?"DŸ“™¤“I˜H":"DŸ“™¤“IKTV",subtitle_x,subtitle_y,505,542,false)
next_a_class_full_jp_03_follow_raamen_truck=SUBTITLE_N(next_a_class_full_jp_03_follow_raamen_truck,"¥šv?",subtitle_x,subtitle_y,543,561,false)
next_a_class_full_jp_03_follow_raamen_truck=SUBTITLE_N(next_a_class_full_jp_03_follow_raamen_truck,original_subtitle?"KŠµ“I˜bAœk•û•Ö—I":"—L±‰ÌŠÒZ‰ÂˆÈf",subtitle_x,subtitle_y,562,593,false)
next_a_class_full_jp_03_follow_raamen_truck=SUBTITLE_N(next_a_class_full_jp_03_follow_raamen_truck,original_subtitle?""""City Sharing"""":"""‘œ¥"æÌŒ{“I¬¸"""",subtitle_x,subtitle_y,594,625,false)
next_a_class_full_jp_03_follow_raamen_truck=SUBTITLE_N(next_a_class_full_jp_03_follow_raamen_truck,original_subtitle?"(és˜ğç¬’˜ŠÔÌŠ·ŠX“¹\‘¢)":"(˜ï–ÊWizard OP)",second_subtitle_x,second_subtitle_y,594,625,false)
next_a_class_full_jp_03_follow_raamen_truck=SUBTITLE_N(next_a_class_full_jp_03_follow_raamen_truck,original_subtitle?"”É–Z‰ß“ª—¹ˆ¢,”‡Àés":"’A¥‘å“s‘¾—â–å—¹ˆ¢,”‡±‰Ì",subtitle_x,subtitle_y,626,689,false)
next_a_class_full_jp_03_follow_raamen_truck=SUBTITLE_N(next_a_class_full_jp_03_follow_raamen_truck,original_subtitle?"Transpoter54!":"—¬“®®KTV!",subtitle_x,subtitle_y,805,837,false)
next_a_class_full_jp_03_follow_raamen_truck=SUBTITLE_N(next_a_class_full_jp_03_follow_raamen_truck,"ƒ}ƒLƒg,Š·‰äŠJ",subtitle_x,subtitle_y,851,882,false)
next_a_class_full_jp_03_follow_raamen_truck=SUBTITLE_N(next_a_class_full_jp_03_follow_raamen_truck,"ˆ¢?",subtitle_x,subtitle_y,883,898,false)
next_a_class_full_jp_03_follow_raamen_truck=SUBTITLE_N(next_a_class_full_jp_03_follow_raamen_truck,"’Çˆ¢!",subtitle_x,subtitle_y,912,928,false)

next_a_class_full_jp_03_follow_raamen_truck=SUBTITLE_N(next_a_class_full_jp_03_follow_raamen_truck,original_subtitle?"–²Œ¶f–Ë‰®‘ä?":"–²Œ¶‰ÌæÕ‰®‘ä?",subtitle_x,subtitle_y,1110,1152,false)
next_a_class_full_jp_03_follow_raamen_truck=SUBTITLE_N(next_a_class_full_jp_03_follow_raamen_truck,"`‘õ!D•s—eˆÕQ““I",subtitle_x,subtitle_y,1153,1184,false)
next_a_class_full_jp_03_follow_raamen_truck=SUBTITLE_N(next_a_class_full_jp_03_follow_raamen_truck,"•s—væ¨›€—­—¹ˆ¢!",subtitle_x,subtitle_y,1185,1229,false)
next_a_class_full_jp_03_follow_raamen_truck=SUBTITLE_N(next_a_class_full_jp_03_follow_raamen_truck,"¥”‡ŒÂˆ¢,",subtitle_x,subtitle_y,1230,1252,false)
next_a_class_full_jp_03_follow_raamen_truck=SUBTITLE_N(next_a_class_full_jp_03_follow_raamen_truck,original_subtitle?"‘½Ì“ssŒvŠcŠJn‘O":"©œnV’˜ìÜ–@Á–Å“ñŸ‘nìŒã",subtitle_x,subtitle_y,1253,1297,false)
next_a_class_full_jp_03_follow_raamen_truck=SUBTITLE_N(next_a_class_full_jp_03_follow_raamen_truck,original_subtitle?"A”ò’yŠX“¹“I–²Œ¶f–Ë‰®‘ä":"’†‰›‰ÌæÕ•–±âxŒû•Ö‹@“®‰»",subtitle_x,subtitle_y,1298,1345,false)
next_a_class_full_jp_03_follow_raamen_truck=SUBTITLE_N(next_a_class_full_jp_03_follow_raamen_truck,original_subtitle?"’Çã›€“IlË—L‘Ši‹—p““I‹†‹É”ü–¡":"’Çã›€“IlË—L‘Ši”M¥‹†‹É“®–Ÿ‰Ì‹È",subtitle_x,subtitle_y,1346,1396,false)
next_a_class_full_jp_03_follow_raamen_truck=SUBTITLE_N(next_a_class_full_jp_03_follow_raamen_truck,"–z’y“I“ss™Bà",subtitle_x,subtitle_y,1397,1429,false)
next_a_class_full_jp_03_follow_raamen_truck=SUBTITLE_N(next_a_class_full_jp_03_follow_raamen_truck,"ˆ¤€›€—¹!",subtitle_x,subtitle_y,1430,1452,false)
next_a_class_full_jp_03_follow_raamen_truck=SUBTITLE_N(next_a_class_full_jp_03_follow_raamen_truck,"“ß¥–z’y“I”•¨ŠÙˆ¢",subtitle_x,subtitle_y,1453,1492,false)
next_a_class_full_jp_03_follow_raamen_truck=SUBTITLE_N(next_a_class_full_jp_03_follow_raamen_truck,"•s,¥–z’y“I•m—Õâí“®•¨!",subtitle_x,subtitle_y,1493,1530,false)
next_a_class_full_jp_03_follow_raamen_truck=SUBTITLE_N(next_a_class_full_jp_03_follow_raamen_truck,"â›”—v’Çã›€,`‘õ!",subtitle_x,subtitle_y,1531,1575,false)
next_a_class_full_jp_03_follow_raamen_truck=SUBTITLE_N(next_a_class_full_jp_03_follow_raamen_truck,"•s‘R“I˜b,‰ä“I¡“VA‰ï”‡›õ”ßœÌ’nŒ‹‘©—¹(‹zšL‹zšL)",subtitle_x,subtitle_y,1576,1669,false)
next_a_class_full_jp_03_follow_raamen_truck=SUBTITLE_N(next_a_class_full_jp_03_follow_raamen_truck,"(19êy®)",subtitle_x,subtitle_y,1714,1748,false)
next_a_class_full_jp_03_follow_raamen_truck=SUBTITLE_N(next_a_class_full_jp_03_follow_raamen_truck,original_subtitle?"(7åjŠX˜a10åjŠX‘¦›’ŒİŠ·)":"(’†‰›‰ÌæÕ‘¦›’’â~“üê)",subtitle_x,subtitle_y,1749,1804,false)
next_a_class_full_jp_03_follow_raamen_truck=SUBTITLE_N(next_a_class_full_jp_03_follow_raamen_truck,original_subtitle?"•s–­,™½ˆæÌŠ·ŠJn—¹!":"•s–­,staff‰õ—v›‰{ŠÇ§—¹!",subtitle_x,subtitle_y,1805,1863,false)
next_a_class_full_jp_03_follow_raamen_truck=SUBTITLE_N(next_a_class_full_jp_03_follow_raamen_truck,"™õˆ¢!?",subtitle_x,subtitle_y,1864,1886,false)
next_a_class_full_jp_03_follow_raamen_truck=SUBTITLE_N(next_a_class_full_jp_03_follow_raamen_truck,"“ß–”œƒé!",subtitle_x,subtitle_y,1887,1925,false)
next_a_class_full_jp_03_follow_raamen_truck=SUBTITLE_N(next_a_class_full_jp_03_follow_raamen_truck,"æÌ‘–`!",subtitle_x,subtitle_y,1955,1997,false)

next_a_class_full_jp_03_follow_raamen_truck=SUBTITLE_N(next_a_class_full_jp_03_follow_raamen_truck,"(¡“V–çh‹ê—¹)",subtitle_x,subtitle_y,2291,2329,false)
next_a_class_full_jp_03_follow_raamen_truck=SUBTITLE_N(next_a_class_full_jp_03_follow_raamen_truck,original_subtitle?"(ˆ×—¹“w—Í‰ß“I”I,ˆ×—¹–¾“V)":"(ˆ×—¹ˆ¤¥‰Ì“I”I,ˆ×—¹‰Ìèñ–¾“V)",subtitle_x,subtitle_y,2330,2398,false)
next_a_class_full_jp_03_follow_raamen_truck=SUBTITLE_N(next_a_class_full_jp_03_follow_raamen_truck,original_subtitle?"(’ßêˆù—¿,D‘zæ¨”IŠ…Š…ŠÅ!)":"(Aæ¨Š’’BA“œ,˜Ò‘Ö”IA!)",subtitle_x,subtitle_y,2399,2475,false)

next_a_class_full_jp_03_follow_raamen_truck=SUBTITLE_N(next_a_class_full_jp_03_follow_raamen_truck,"‰Ê‘R•ssˆ¢...",subtitle_x,subtitle_y,2518,2559,false)
next_a_class_full_jp_03_follow_raamen_truck=SUBTITLE_N(next_a_class_full_jp_03_follow_raamen_truck,"›”•s‹N,æ¨”I˜ì˜iŠï‰ö“I–î—¹",subtitle_x,subtitle_y,2578,2649,false)
next_a_class_full_jp_03_follow_raamen_truck=SUBTITLE_N(next_a_class_full_jp_03_follow_raamen_truck,"ˆ¢—ñ?",subtitle_x,subtitle_y,2676,2693,false)
next_a_class_full_jp_03_follow_raamen_truck=SUBTITLE_N(next_a_class_full_jp_03_follow_raamen_truck,original_subtitle?"”‡—¡ãboost...“®—ÍŒÀ§–ç...":"...•s’â‰º˜Ò‹‹‰äêy‰Ìšv,‰ÌæÕstaff‹‹‰ä‹LZ...",subtitle_x,subtitle_y,2723,2790,false)
next_a_class_full_jp_03_follow_raamen_truck=SUBTITLE_N(next_a_class_full_jp_03_follow_raamen_truck,original_subtitle?"\“¾“M code“Iî•ñˆ¢,›€“Iidentify code...":"\“¾“–{Ÿ‰Ìšdˆ¢,”\Œğ“‰ÌæÕstaff“I•ü—F^D...",subtitle_x,subtitle_y,2791,2862,false)
next_a_class_full_jp_03_follow_raamen_truck=SUBTITLE_N(next_a_class_full_jp_03_follow_raamen_truck,"“ß,“ßŒÂ...",subtitle_x,subtitle_y,2863,2893,false)

next_a_class_full_jp_03_follow_raamen_truck=SUBTITLE_N(next_a_class_full_jp_03_follow_raamen_truck,"ˆ¢!!!",subtitle_x,subtitle_y,3115,3150,false)
next_a_class_full_jp_03_follow_raamen_truck=SUBTITLE_N(next_a_class_full_jp_03_follow_raamen_truck,"˜Ò”b!",subtitle_x,subtitle_y,3204,3221,false)
next_a_class_full_jp_03_follow_raamen_truck=SUBTITLE_N(next_a_class_full_jp_03_follow_raamen_truck,"Dé¦ÄŠJ!",subtitle_x,subtitle_y,3309,3349,false)

next_a_class_full_jp_03_follow_raamen_truck=SUBTITLE_N(next_a_class_full_jp_03_follow_raamen_truck,original_subtitle?"(Dream Island,‹Ö~i“ü)":"(’†‰›‰Ìæ•‘“¥‰ïâÔ”õ’†,‹Ö~i“ü)",second_subtitle_x,second_subtitle_y,3470,3515,false)
next_a_class_full_jp_03_follow_raamen_truck=SUBTITLE_N(next_a_class_full_jp_03_follow_raamen_truck,"Õˆ¢!",subtitle_x,subtitle_y,3561,3583,false)
next_a_class_full_jp_03_follow_raamen_truck=SUBTITLE_N(next_a_class_full_jp_03_follow_raamen_truck,"™û™û!’Çã”I—¹”b",subtitle_x,subtitle_y,3712,3757,false)
next_a_class_full_jp_03_follow_raamen_truck=SUBTITLE_N(next_a_class_full_jp_03_follow_raamen_truck,"”I”‡”jà£”•¨ŠÙ!",subtitle_x,subtitle_y,3758,3787,false)
next_a_class_full_jp_03_follow_raamen_truck=SUBTITLE_N(next_a_class_full_jp_03_follow_raamen_truck,original_subtitle?"”‡ŒÂˆê’è—v”Æã™Bˆ¢!":"”‡ŒÂˆê’è—vá¢Puã™B›‰‹µˆ¢!",subtitle_x,subtitle_y,3788,3830,false)
next_a_class_full_jp_03_follow_raamen_truck=SUBTITLE_N(next_a_class_full_jp_03_follow_raamen_truck,original_subtitle?"f–Ë3˜q!":"‰ä—v¥–G‰Ì!",subtitle_x,subtitle_y,3831,3855,false)
next_a_class_full_jp_03_follow_raamen_truck=SUBTITLE_N(next_a_class_full_jp_03_follow_raamen_truck,original_subtitle?"‰ÁàB’`!":"‘œParty Night”‡é“I! <--(„„•s¥ËİŒ™‰Ìà£??)",subtitle_x,subtitle_y,3856,3894,false)
next_a_class_full_jp_03_follow_raamen_truck=SUBTITLE_N(next_a_class_full_jp_03_follow_raamen_truck,"â›”•sæ¨”I—­{!",subtitle_x,subtitle_y,4006,4039,false)
next_a_class_full_jp_03_follow_raamen_truck=SUBTITLE_N(next_a_class_full_jp_03_follow_raamen_truck,"‚¨,‚¨‚¢...!",subtitle_x,subtitle_y,4040,4063,false)
next_a_class_full_jp_03_follow_raamen_truck=SUBTITLE_N(next_a_class_full_jp_03_follow_raamen_truck,"•ÊŠÅ•s‹Nl!",subtitle_x,subtitle_y,4116,4139,false)
next_a_class_full_jp_03_follow_raamen_truck=SUBTITLE_N(next_a_class_full_jp_03_follow_raamen_truck,"àËÇ—‹!",subtitle_x,subtitle_y,4140,4161,false)
next_a_class_full_jp_03_follow_raamen_truck=SUBTITLE_N(next_a_class_full_jp_03_follow_raamen_truck,"ãˆ¢!",subtitle_x,subtitle_y,4162,4181,false)
next_a_class_full_jp_03_follow_raamen_truck=SUBTITLE_N(next_a_class_full_jp_03_follow_raamen_truck,"–ï?",subtitle_x,subtitle_y,4233,4248,false)

next_a_class_full_jp_03_follow_raamen_truck=SUBTITLE_N(next_a_class_full_jp_03_follow_raamen_truck,"ˆ¢ˆ¢ˆ¢```!!!",subtitle_x,subtitle_y,4445,4528,false)
next_a_class_full_jp_03_follow_raamen_truck=SUBTITLE_N(next_a_class_full_jp_03_follow_raamen_truck,"Ÿ“‹~f!",subtitle_x,subtitle_y,4529,4551,false)
next_a_class_full_jp_03_follow_raamen_truck=SUBTITLE_N(next_a_class_full_jp_03_follow_raamen_truck,"—v€f!",subtitle_x,subtitle_y,4552,4578,false)
next_a_class_full_jp_03_follow_raamen_truck=SUBTITLE_N(next_a_class_full_jp_03_follow_raamen_truck,"‰Ê‘Rˆ¢...",subtitle_x,subtitle_y,4579,4600,false)
next_a_class_full_jp_03_follow_raamen_truck=SUBTITLE_N(next_a_class_full_jp_03_follow_raamen_truck,"–ï?",subtitle_x,subtitle_y,4601,4620,false)
next_a_class_full_jp_03_follow_raamen_truck=SUBTITLE_N(next_a_class_full_jp_03_follow_raamen_truck,original_subtitle?"˜A—İ“”I˜ì,›”•s‹N":"ˆ×—¹¥‰Ì˜A—İ“”I˜ì,›”•s‹N",subtitle_x,subtitle_y,4630,4675,false)
next_a_class_full_jp_03_follow_raamen_truck=SUBTITLE_N(next_a_class_full_jp_03_follow_raamen_truck,"Œ»İËà”‡í˜b?",subtitle_x,subtitle_y,4676,4715,false)
next_a_class_full_jp_03_follow_raamen_truck=SUBTITLE_N(next_a_class_full_jp_03_follow_raamen_truck,"šv,‹”b",subtitle_x,subtitle_y,4716,4746,false)
next_a_class_full_jp_03_follow_raamen_truck=SUBTITLE_N(next_a_class_full_jp_03_follow_raamen_truck,"á¶—Í§ˆ×",subtitle_x,subtitle_y,4758,4791,false)
next_a_class_full_jp_03_follow_raamen_truck=SUBTITLE_N(next_a_class_full_jp_03_follow_raamen_truck,"—’nuŠÔ”n—Í‘SŠJ!",subtitle_x,subtitle_y,4802,4841,false)
next_a_class_full_jp_03_follow_raamen_truck=SUBTITLE_N(next_a_class_full_jp_03_follow_raamen_truck,"–û–åÃ—‹!",subtitle_x,subtitle_y,4842,4871,false)
next_a_class_full_jp_03_follow_raamen_truck=SUBTITLE_N(next_a_class_full_jp_03_follow_raamen_truck,"‰¶!",subtitle_x,subtitle_y,4876,4887,false)
next_a_class_full_jp_03_follow_raamen_truck=SUBTITLE_N(next_a_class_full_jp_03_follow_raamen_truck,original_subtitle?"Õˆ¢!":"Õˆ¢!ù•—Õ–N!",subtitle_x,subtitle_y,5110,5169,false)
next_a_class_full_jp_03_follow_raamen_truck=SUBTITLE_N(next_a_class_full_jp_03_follow_raamen_truck,original_subtitle?"":"     ---------",subtitle_x,subtitle_y,5110,5169,false)

next_a_class_full_jp_03_follow_raamen_truck=SUBTITLE_N(next_a_class_full_jp_03_follow_raamen_truck,"’Ç“—¹",subtitle_x,subtitle_y,5635,5675,false)
next_a_class_full_jp_03_follow_raamen_truck=SUBTITLE_N(next_a_class_full_jp_03_follow_raamen_truck,"ŸcŒ}Œõ—Õ!",subtitle_x,subtitle_y,5846,5872,false)
next_a_class_full_jp_03_follow_raamen_truck=SUBTITLE_N(next_a_class_full_jp_03_follow_raamen_truck,original_subtitle?"êy±Y?":"êyY›õ‰Ì?",subtitle_x,subtitle_y,5873,5902,false)

next_a_class_full_jp_03_follow_raamen_truck=SUBTITLE_N(next_a_class_full_jp_03_follow_raamen_truck,"‰ä—vŠJ“®f!",subtitle_x,subtitle_y,6058,6117,false)
next_a_class_full_jp_03_follow_raamen_truck=SUBTITLE_N(next_a_class_full_jp_03_follow_raamen_truck,original_subtitle?"”ü–¡...":"D‰Ì”z”ü–¡...",subtitle_x,subtitle_y,6210,6249,false)
next_a_class_full_jp_03_follow_raamen_truck=SUBTITLE_N(next_a_class_full_jp_03_follow_raamen_truck,"‰¶`”‡“’“ª‘¾æ«f!",subtitle_x,subtitle_y,6286,6332,false)
next_a_class_full_jp_03_follow_raamen_truck=SUBTITLE_N(next_a_class_full_jp_03_follow_raamen_truck,"úŠQ",subtitle_x,subtitle_y,6333,6357,false)
next_a_class_full_jp_03_follow_raamen_truck=SUBTITLE_N(next_a_class_full_jp_03_follow_raamen_truck,original_subtitle?"M159Œ^ 6.2L V8 DOHC 32Ÿ†–å!?":"’´‚«”\”r‰Ì“däI —§é“‘S‘œ“Š‰eİ”õ –³ŒÀãß“¹ŠÂã…‰¹‹¿!?",subtitle_x,subtitle_y,6358,6456,false)
next_a_class_full_jp_03_follow_raamen_truck=SUBTITLE_N(next_a_class_full_jp_03_follow_raamen_truck,"‘½åk—¹‹qŠ¯",subtitle_x,subtitle_y,6457,6511,false)
next_a_class_full_jp_03_follow_raamen_truck=SUBTITLE_N(next_a_class_full_jp_03_follow_raamen_truck,original_subtitle?"ŠÅ˜Ò‰ÂˆÈŠ…ã‹vˆá“I”üğ—¹ˆ¢":"ŠÅ˜Ò‰ÂˆÈ¥“‹vˆá“IACGD‰Ì—¹ˆ¢",subtitle_x,subtitle_y,6512,6587,false)
next_a_class_full_jp_03_follow_raamen_truck=SUBTITLE_N(next_a_class_full_jp_03_follow_raamen_truck,"˜bà‰ñ˜Òˆ¢",subtitle_x,subtitle_y,6612,6640,false)
next_a_class_full_jp_03_follow_raamen_truck=SUBTITLE_N(next_a_class_full_jp_03_follow_raamen_truck,original_subtitle?"‰´—L“¹‘zác‰ºğØ“I‹É•i,”ñ›€•s‰Âs":"Œá”y—LŒÂ‘z”z‰Ì¥“I‹É•iŠˆ“®,”ñ›€•s‰Âs",subtitle_x,subtitle_y,6681,6796,false)
next_a_class_full_jp_03_follow_raamen_truck=SUBTITLE_N(next_a_class_full_jp_03_follow_raamen_truck,"”JĞ–^?",subtitle_x,subtitle_y,6833,6880,false)
next_a_class_full_jp_03_follow_raamen_truck=SUBTITLE_N(next_a_class_full_jp_03_follow_raamen_truck,original_subtitle?"–²Œ¶“¤•…“X":"–²Œ¶“¤•…“Xo•i“Iparapara•‘‹È",subtitle_x,subtitle_y,6897,6966,false)

next_a_class_full_jp_03_follow_raamen_truck=SUBTITLE_WARNING(next_a_class_full_jp_03_follow_raamen_truck,original_subtitle?"":"[‹Ö~ˆùH]",second_subtitle_x,second_subtitle_y,0,57)
next_a_class_full_jp_03_follow_raamen_truck=SUBTITLE_WARNING(next_a_class_full_jp_03_follow_raamen_truck,original_subtitle?"":"[¿–Ü¡“üˆ½’u•¨‰—‹Ö™½,”Û‘¥...]",second_subtitle_x,second_subtitle_y,152,281)
next_a_class_full_jp_03_follow_raamen_truck=SUBTITLE_WARNING(next_a_class_full_jp_03_follow_raamen_truck,original_subtitle?"":"[‹Ö~ŠBé¦äoéIÔ’Ç’€“™‹^—Šié¦sˆ×]",second_subtitle_x,second_subtitle_y,1253,1447)
next_a_class_full_jp_03_follow_raamen_truck=SUBTITLE_WARNING(next_a_class_full_jp_03_follow_raamen_truck,original_subtitle?"":"[‹Ö~g—pè‹@á¢Puäoã™Bš¤•Ğ]",second_subtitle_x,second_subtitle_y,3788,3855)
next_a_class_full_jp_03_follow_raamen_truck=SUBTITLE_WARNING(next_a_class_full_jp_03_follow_raamen_truck,original_subtitle?"":"[•s¥à—¹,ê“à‹Ö~ˆùH! (+-_-)“Ê]",second_subtitle_x,second_subtitle_y,5903,5989)

next_a_class_full_jp_03_follow_raamen_truck=ConvertToYV12(next_a_class_full_jp_03_follow_raamen_truck)



global title_subtitle_size=subtitle_size*3

title_01="’†‰›‰Ìæ•‘“¥‰ï"
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

next_a_class_full_jp_05_modified_title_01=SUBTITLE_N(next_a_class_full_jp_05_modified_title_01,title_01,title_01_subtitle_x,title_subtitle_y-(title_subtitle_size/2),is_title=true)
next_a_class_full_jp_05_modified_title_01=AudioDub(next_a_class_full_jp_05_modified_title_01,next_a_class_full_jp_05_title_01)
next_a_class_full_jp_05_modified_title_02=SUBTITLE_N(next_a_class_full_jp_05_modified_title_02,title_02,title_02_subtitle_x,title_subtitle_y-(title_subtitle_size/2),is_title=true)
next_a_class_full_jp_05_modified_title_02=AudioDub(next_a_class_full_jp_05_modified_title_02,next_a_class_full_jp_05_title_02)
next_a_class_full_jp_05_modified_title=next_a_class_full_jp_05_modified_title_01+next_a_class_full_jp_05_modified_title_02

next_a_class_full_jp_05_modified_title=REPLACE_COLORKEY_TO_PLASMA(next_a_class_full_jp_05_modified_title,color_blue,title_colorkey_tolerance)
next_a_class_full_jp_05_modified_title=ScriptClip(next_a_class_full_jp_05_modified_title,"RGBAdjust(r=bright,g=bright,b=bright)")
next_a_class_full_jp_05_modified_title=FrameEvaluate(next_a_class_full_jp_05_modified_title,"bright=Spline(current_frame,0,0.0,73,1.0,162,1.0,186,0.0,Framecount()-1,0.0,cubic=false)")
next_a_class_full_jp_05_modified_title=ConvertToYV12(next_a_class_full_jp_05_modified_title)



initial_d_thumbnail=SUBTITLE_N(initial_d_thumbnail,"[–²Œ¶“¤•…“X(©‰Æ—p)]",subtitle_x,subtitle_y,is_title=false)
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
