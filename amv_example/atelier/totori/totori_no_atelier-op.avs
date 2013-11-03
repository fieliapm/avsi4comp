Import("..\..\avsi4comp\macro.avsi")

######## Function ########

function CROP_PV_DVD(clip clip){
	return Crop(clip,0,56,720,368)
}

function FIT_OP_WEB(clip clip){
	return RESIZE_TO_REF_CLIP(clip,totori_op_ps3)
}

######## PV DVD (480P) ########

totori_pv_dvd_title01_audio=WAVSource("src\VTS_01_1 T80 2_0ch 192Kbps 48KHz.wav")
totori_pv_dvd_title01=CROP_PV_DVD(VOB_MPEG2_VIDEO_SOURCE("src\VTS_01_1.d2v"))
totori_pv_dvd_title01=AudioDub(totori_pv_dvd_title01,totori_pv_dvd_title01_audio)

totori_pv_dvd_title01_cache01=CROP_PV_DVD(VOB_MPEG2_VIDEO_SOURCE("src\VTS_01_1.d2v"))
totori_pv_dvd_title01_cache01=AudioDub(totori_pv_dvd_title01_cache01,totori_pv_dvd_title01_audio)
totori_pv_dvd_title01_cache02=CROP_PV_DVD(VOB_MPEG2_VIDEO_SOURCE("src\VTS_01_1.d2v"))
totori_pv_dvd_title01_cache02=AudioDub(totori_pv_dvd_title01_cache02,totori_pv_dvd_title01_audio)
totori_pv_dvd_title01_cache03=CROP_PV_DVD(VOB_MPEG2_VIDEO_SOURCE("src\VTS_01_1.d2v"))
totori_pv_dvd_title01_cache03=AudioDub(totori_pv_dvd_title01_cache03,totori_pv_dvd_title01_audio)
totori_pv_dvd_title01_cache04=CROP_PV_DVD(VOB_MPEG2_VIDEO_SOURCE("src\VTS_01_1.d2v"))
totori_pv_dvd_title01_cache04=AudioDub(totori_pv_dvd_title01_cache04,totori_pv_dvd_title01_audio)
totori_pv_dvd_title01_cache05=CROP_PV_DVD(VOB_MPEG2_VIDEO_SOURCE("src\VTS_01_1.d2v"))
totori_pv_dvd_title01_cache05=AudioDub(totori_pv_dvd_title01_cache05,totori_pv_dvd_title01_audio)
totori_pv_dvd_title01_cache06=CROP_PV_DVD(VOB_MPEG2_VIDEO_SOURCE("src\VTS_01_1.d2v"))
totori_pv_dvd_title01_cache06=AudioDub(totori_pv_dvd_title01_cache06,totori_pv_dvd_title01_audio)
totori_pv_dvd_title01_cache07=CROP_PV_DVD(VOB_MPEG2_VIDEO_SOURCE("src\VTS_01_1.d2v"))
totori_pv_dvd_title01_cache07=AudioDub(totori_pv_dvd_title01_cache07,totori_pv_dvd_title01_audio)



totori_pv_dvd_title01_01=Trim(totori_pv_dvd_title01,0,1382)
totori_pv_dvd_title01_02_01=Trim(totori_pv_dvd_title01,1383,1634)
totori_pv_dvd_title01_02_02=Trim(totori_pv_dvd_title01,1635,2504)
totori_pv_dvd_title01_03_01=Trim(totori_pv_dvd_title01,2505,2567)
totori_pv_dvd_title01_03_02=Trim(totori_pv_dvd_title01,2568,3191)
totori_pv_dvd_title01_04=Trim(totori_pv_dvd_title01,3192,3383)
totori_pv_dvd_title01_05=Trim(totori_pv_dvd_title01,3384,0)



totori_pv_dvd_title01_character01_01=Trim(totori_pv_dvd_title01_cache01,1713,1775)
totori_pv_dvd_title01_character01_02=Trim(totori_pv_dvd_title01_cache01,1776,1873)
totori_pv_dvd_title01_character02_01=Trim(totori_pv_dvd_title01_cache02,1874,1929)
totori_pv_dvd_title01_character02_02=Trim(totori_pv_dvd_title01_cache02,1930,2026)
totori_pv_dvd_title01_character03_01=Trim(totori_pv_dvd_title01_cache03,2027,2060)
totori_pv_dvd_title01_character03_02=Trim(totori_pv_dvd_title01_cache03,2061,2112)
totori_pv_dvd_title01_character04_01=Trim(totori_pv_dvd_title01_cache04,2113,2159)
totori_pv_dvd_title01_character04_02=Trim(totori_pv_dvd_title01_cache04,2160,2207)
totori_pv_dvd_title01_character05_01=Trim(totori_pv_dvd_title01_cache05,2208,2262)
totori_pv_dvd_title01_character05_02=Trim(totori_pv_dvd_title01_cache05,2263,2316)
totori_pv_dvd_title01_character06_01=Trim(totori_pv_dvd_title01_cache06,2317,2384)
totori_pv_dvd_title01_character06_02=Trim(totori_pv_dvd_title01_cache06,2385,2441)
totori_pv_dvd_title01_character07_01=Trim(totori_pv_dvd_title01_cache07,2442,2470)
totori_pv_dvd_title01_character07_02=Trim(totori_pv_dvd_title01_cache07,2471,2504)

character_blend_mode="SoftLight"
character_appear_time=10
character_appear_offset=150
character_appear_interval=28

totori_character_01_rescaled=RESCALE(totori_pv_dvd_title01_character01_01+totori_pv_dvd_title01_character01_02+BlankClip(totori_pv_dvd_title01_01,length=1,color=color_white),0.889*0.75,0.75)
totori_character_02_rescaled=RESCALE(totori_pv_dvd_title01_character02_01+totori_pv_dvd_title01_character02_02+BlankClip(totori_pv_dvd_title01_01,length=1,color=color_white),0.889*0.75,0.75)
totori_character_03_rescaled=RESCALE(totori_pv_dvd_title01_character03_02+totori_pv_dvd_title01_character03_01+BlankClip(totori_pv_dvd_title01_01,length=1,color=color_white),0.889*0.75,0.75)
totori_character_04_rescaled=RESCALE(totori_pv_dvd_title01_character04_02+totori_pv_dvd_title01_character04_01+BlankClip(totori_pv_dvd_title01_01,length=1,color=color_white),0.889*0.75,0.75)
totori_character_05_rescaled=RESCALE(totori_pv_dvd_title01_character05_02+totori_pv_dvd_title01_character05_01+BlankClip(totori_pv_dvd_title01_01,length=1,color=color_white),0.889*0.75,0.75)
totori_character_06_rescaled=RESCALE(totori_pv_dvd_title01_character06_02+totori_pv_dvd_title01_character06_01+BlankClip(totori_pv_dvd_title01_01,length=1,color=color_white),0.889*0.75,0.75)
totori_character_07_rescaled=RESCALE(totori_pv_dvd_title01_character07_02+totori_pv_dvd_title01_character07_01+BlankClip(totori_pv_dvd_title01_01,length=1,color=color_white),0.889*0.75,0.75)

totori_character_01_rescaled_position_x=1040-Width(totori_character_01_rescaled)*0.5
totori_character_01_rescaled_position_y=360-Height(totori_character_01_rescaled)*0.5

totori_character_02_rescaled_position_x=960-Width(totori_character_02_rescaled)*0.5
totori_character_02_rescaled_position_y=180-Height(totori_character_02_rescaled)*0.5

totori_character_03_rescaled_position_x=640-Width(totori_character_03_rescaled)*0.5
totori_character_03_rescaled_position_y=135-Height(totori_character_03_rescaled)*0.5

totori_character_04_rescaled_position_x=320-Width(totori_character_04_rescaled)*0.5
totori_character_04_rescaled_position_y=180-Height(totori_character_04_rescaled)*0.5

totori_character_05_rescaled_position_x=960-Width(totori_character_05_rescaled)*0.5
totori_character_05_rescaled_position_y=540-Height(totori_character_05_rescaled)*0.5

totori_character_06_rescaled_position_x=640-Width(totori_character_06_rescaled)*0.5
totori_character_06_rescaled_position_y=585-Height(totori_character_06_rescaled)*0.5

totori_character_07_rescaled_position_x=320-Width(totori_character_07_rescaled)*0.5
totori_character_07_rescaled_position_y=540-Height(totori_character_07_rescaled)*0.5

######## PV Online (900*506) ########

#totori_op_ps3=SSRC(FFMS2_VIDEO_SOURCE("src\a12_opening_movie_high.f4v"),48000) # fps 24
#totori_op_ps3_01=Trim(totori_op_ps3,0,955)
#totori_op_ps3_02_01=Trim(totori_op_ps3,956,1389)
#totori_op_ps3_02_02=Trim(totori_op_ps3,1390,1609)
#totori_op_ps3_03=Trim(totori_op_ps3,1610,0)

#totori_launch=SSRC(FFMS2_VIDEO_SOURCE("src\a12_launch_high.f4v"),48000) # fps 30
#totori_launch_01=Trim(totori_launch,0,1383)
#totori_launch_02_01=Trim(totori_launch,1384,1635)
#totori_launch_02_02=Trim(totori_launch,1636,2506)
#totori_launch_03_01=Trim(totori_launch,2507,2569)
#totori_launch_03_02=Trim(totori_launch,2570,3194)
#totori_launch_04=Trim(totori_launch,3195,3386)
#totori_launch_05=Trim(totori_launch,3387,0)

totori_image_trailer=SSRC(FFMS2_VIDEO_SOURCE("src\A12_image_trailer_high.f4v",fpsnum=30000,fpsden=1001),48000) # fps 30000/1001
totori_image_trailer_01=Trim(totori_image_trailer,0,1032)
totori_image_trailer_02=Trim(totori_image_trailer,1033,1286)
totori_image_trailer_03=Trim(totori_image_trailer,1287,0)

totori_final_image_trailer=SSRC(FFMS2_VIDEO_SOURCE("src\a12_finalimagetrailer_high.f4v"),48000) # fps 30
totori_final_image_trailer_01=Trim(totori_final_image_trailer,0,461)
totori_final_image_trailer_02=Trim(totori_final_image_trailer,462,931)
totori_final_image_trailer_03=Trim(totori_final_image_trailer,932,1392)
totori_final_image_trailer_04=Trim(totori_final_image_trailer,1393,1965)
totori_final_image_trailer_05=Trim(totori_final_image_trailer,1966,2881)
totori_final_image_trailer_06=Trim(totori_final_image_trailer,2882,3286)
totori_final_image_trailer_07=Trim(totori_final_image_trailer,3287,0)

totori_pv01=SSRC(FFMS2_VIDEO_SOURCE("src\a12_pv01_high.f4v"),48000) # fps 30
totori_pv01_01=Trim(totori_pv01,0,226)
totori_pv01_02=Trim(totori_pv01,227,463)
totori_pv01_03_01=Trim(totori_pv01,464,2602)
totori_pv01_03_02=Trim(totori_pv01,2603,2874)
totori_pv01_04=Trim(totori_pv01,2875,0)



func="ColorYUV(off_u=-32.0,cont_u=-256.0,off_v=32.0,cont_v=-256.0)"
totori_pv01_03_01=APPLY_RANGE(totori_pv01_03_01,1406,1481,func)
totori_pv01_03_01=APPLY_RANGE(totori_pv01_03_01,1808,1850,func)
totori_pv01_03_01=APPLY_RANGE(totori_pv01_03_01,1998,2044,func)

######## PS3 (720P) ########

global totori_op_ps3=FFMS2_VIDEO_SOURCE("src\totori-op-ps3.mp4") # fps 24000/1001
totori_op_ps3_01=Trim(totori_op_ps3,0,957)
totori_op_ps3_02_01=Trim(totori_op_ps3,958,1391)
totori_op_ps3_02_02=Trim(totori_op_ps3,1392,1611)
totori_op_ps3_03=Trim(totori_op_ps3,1612,0)

######## Combine ########

# totori_pv01_01 398 @ discard
# totori_op_ps3_01 595
# totori_pv01_03_01 2567
# totori_pv_dvd_title01_03_01 5299
# totori_launch_03_01 5298

totori_op_t01=FIT_OP_WEB(BlankClip(totori_final_image_trailer,length=114,color=color_black)+AssumeFPS(totori_image_trailer_02,totori_final_image_trailer)+totori_pv01_01)
totori_op_t02=ChangeFPS(totori_op_ps3_01+totori_op_ps3_02_01,totori_final_image_trailer)
totori_op_t03=FIT_OP_WEB(Trim(totori_final_image_trailer_03,231,0)+totori_pv01_03_01)

totori_op_t04=FIT_OP_WEB(Trim(AssumeFPS(totori_image_trailer_01,totori_final_image_trailer),16,643))
totori_op_t04=LINEAR_MOVE(totori_op_t04,"totori_character_01_rescaled",character_blend_mode,406-character_appear_time,406,totori_character_01_rescaled_position_x-character_appear_offset,totori_character_01_rescaled_position_y,0.0,totori_character_01_rescaled_position_x,totori_character_01_rescaled_position_y,1.0,extend=true)
totori_op_t04=LINEAR_MOVE(totori_op_t04,"totori_character_02_rescaled",character_blend_mode,458+character_appear_interval*0-character_appear_time,458+character_appear_interval*0,totori_character_02_rescaled_position_x-character_appear_offset,totori_character_02_rescaled_position_y+character_appear_offset,0.0,totori_character_02_rescaled_position_x,totori_character_02_rescaled_position_y,1.0,extend=true)
totori_op_t04=LINEAR_MOVE(totori_op_t04,"totori_character_03_rescaled",character_blend_mode,458+character_appear_interval*1-character_appear_time,458+character_appear_interval*1,totori_character_03_rescaled_position_x,totori_character_03_rescaled_position_y+character_appear_offset,0.0,totori_character_03_rescaled_position_x,totori_character_03_rescaled_position_y,1.0,extend=true)
totori_op_t04=LINEAR_MOVE(totori_op_t04,"totori_character_04_rescaled",character_blend_mode,458+character_appear_interval*2-character_appear_time,458+character_appear_interval*2,totori_character_04_rescaled_position_x+character_appear_offset,totori_character_04_rescaled_position_y+character_appear_offset,0.0,totori_character_04_rescaled_position_x,totori_character_04_rescaled_position_y,1.0,extend=true)
totori_op_t04=LINEAR_MOVE(totori_op_t04,"totori_character_05_rescaled",character_blend_mode,458+character_appear_interval*3-character_appear_time,458+character_appear_interval*3,totori_character_05_rescaled_position_x-character_appear_offset,totori_character_05_rescaled_position_y-character_appear_offset,0.0,totori_character_05_rescaled_position_x,totori_character_05_rescaled_position_y,1.0,extend=true)
totori_op_t04=LINEAR_MOVE(totori_op_t04,"totori_character_06_rescaled",character_blend_mode,458+character_appear_interval*4-character_appear_time,458+character_appear_interval*4,totori_character_06_rescaled_position_x,totori_character_06_rescaled_position_y-character_appear_offset,0.0,totori_character_06_rescaled_position_x,totori_character_06_rescaled_position_y,1.0,extend=true)
totori_op_t04=LINEAR_MOVE(totori_op_t04,"totori_character_07_rescaled",character_blend_mode,458+character_appear_interval*5-character_appear_time,458+character_appear_interval*5,totori_character_07_rescaled_position_x+character_appear_offset,totori_character_07_rescaled_position_y-character_appear_offset,0.0,totori_character_07_rescaled_position_x,totori_character_07_rescaled_position_y,1.0,extend=true)

totori_op_t05=FIT_OP_WEB(AssumeFPS(totori_pv_dvd_title01_03_01+totori_pv_dvd_title01_03_02+totori_pv_dvd_title01_04,totori_final_image_trailer))
#totori_op_t05=FIT_OP_WEB(totori_launch_03_01+totori_launch_03_02+totori_launch_04)

totori_op_t06=FIT_OP_WEB(Dissolve(totori_final_image_trailer_04,totori_final_image_trailer_05,10))

totori_op_mute=Dissolve(Dissolve(DOUBLE_FADE_WITH_BRIGHTNESS_OFFSET_RGB24(totori_op_t01+FADE_IN_WITH_BRIGHTNESS_OFFSET_RGB24(totori_op_t02,30),totori_op_t03,20,20),totori_op_t04,30),totori_op_t05,5)+totori_op_t06

######## Music ########

bgm_48khz=SSRC(WAVSource("src\totori_no_atelier-ost-01-01.wav"),48000)
AudioDub(totori_op_mute,bgm_48khz)

######## Subtitle ########

subtitle_x=50
subtitle_y=400
global subtitle_front_fade_count=15
global subtitle_rear_fade_count=30
global subtitle_font="MS Gothic"
global subtitle_effects="bi"
global subtitle_size=28
global subtitle_text_color=OVERWRITE_COLOR_ALPHA(color_aliceblue,$2F)
global subtitle_halo_color=color_black

function SUBTITLE_FX(clip clip,string text,float x,float y,int start_frame,int end_frame,bool "is_title"){
	is_title=Default(is_title,false)

	halo_color=is_title?color_cornflowerblue:subtitle_halo_color

	return SUBTITLE_FX_SLIDE_IN_WATER_OUT(clip,text,x,y,start_frame,end_frame,subtitle_front_fade_count,subtitle_rear_fade_count,subtitle_font,subtitle_effects,subtitle_size,subtitle_text_color,halo_color)
}

SUBTITLE_FX("Pilgrimage//éRñ{î¸îHéq|- by fielia@AVISynth",subtitle_x,subtitle_y-subtitle_size,420,520,true)

SUBTITLE_FX("ãLâØÇíHÇÍÇŒ ãCîzÇæÇØÇ™ïYÇ§",subtitle_x,subtitle_y,866,1090)
SUBTITLE_FX("ãÛÇå©è„Ç∞ÇÍÇŒ âìÇ≠ê∫Ç™Ç∑ÇÈ",subtitle_x,subtitle_y,1096,1325)
SUBTITLE_FX("Ç†ÇÍÇÕ ïóÇÃí≤Ç◊ Ç‚ÇÌÇÁÇ≠ óUÇ¢èoÇ∑",subtitle_x,subtitle_y,1333,1548)
SUBTITLE_FX("Ç†ÇÍÇÕ êÖÇÃçÅÇË óyÇ©Ç»ÇÈ ìπïW",subtitle_x,subtitle_y,1561,1770)

SUBTITLE_FX("Ç≥Ç†ó∑Ç…èoÇÊÇ§ ñYÇÍÇ»Ç¢Ç§ÇøÇ…",subtitle_x,subtitle_y,1786,1975)
SUBTITLE_FX("ÇÌÇΩÇµ Ç‹ÇæíTÇµë±ÇØÇΩÇ¢",subtitle_x,subtitle_y,1985,2122)
SUBTITLE_FX("îﬁï˚ÇÃínïΩê¸Ç™ âìÇÃÇ≠ëOÇ…",subtitle_x,subtitle_y,2128,2333)

SUBTITLE_FX("ëÂé˜Ç…èoâÔÇ¶ÇŒ èÑÇÈéûä‘ÇñYÇÍÇƒ",subtitle_x,subtitle_y,2573,2794)
SUBTITLE_FX("ê√Ç©Ç…äÒÇËìYÇ¢ âìÇ¢ê∫ÇíÆÇ≠",subtitle_x,subtitle_y,2799,3024)
SUBTITLE_FX("ÇªÇÍÇÕ êXÇÃëßêÅ âJÇçêÇ∞ÇÈ Ç≥Ç≥Ç‚Ç´",subtitle_x,subtitle_y,3034,3250)
SUBTITLE_FX("ÇªÇÍÇÕ à≈ÇÃíQÇ´ ôãìﬂÇ…å©ÇΩ å∂âe",subtitle_x,subtitle_y,3260,3473)

SUBTITLE_FX("ÇÀÇ¶ íNÇÃÇΩÇﬂÇ…ó∑ÇÇµÇƒÇ¢ÇÈÇÃÅH",subtitle_x,subtitle_y,3490,3683)
SUBTITLE_FX("ÇªÇµÇƒ Ç»Ç∫îYÇ›ë±ÇØÇÈÇÃÅH",subtitle_x,subtitle_y,3690,3825)
SUBTITLE_FX("ìöÇ¶ÇÕï™Ç©ÇÁÇ Ç‹Ç‹ ìµÇï¬Ç∂ÇΩ",subtitle_x,subtitle_y,3833,4040)

SUBTITLE_FX("ÇŸÇÁï‡Ç´èoÇªÇ§ ó‹Çê@Ç¢ÇΩÇÁ",subtitle_x,subtitle_y,4728,4920)
SUBTITLE_FX("ñ⁄ÇÃëOÇ…çLÇ™ÇÈê¢äEÇÕ",subtitle_x,subtitle_y,4930,5120)
SUBTITLE_FX("Ç‹ÇŒÇ‰Ç¢åıï˙Ç¬ ñ¢ímÇ»ÇÈëÂínÇÊ",subtitle_x,subtitle_y,5126,5349)
SUBTITLE_FX("Ç≥Ç†ó∑Ç…èoÇÊÇ§ ñYÇÍÇ»Ç¢Ç§ÇøÇ…",subtitle_x,subtitle_y,5356,5545)
SUBTITLE_FX("ÇÌÇΩÇµ ç°íTÇµÇ…çsÇ´ÇΩÇ¢",subtitle_x,subtitle_y,5555,5689)
SUBTITLE_FX("îﬁï˚ÇÃínïΩê¸Ç™ âìÇÃÇ≠ëOÇ…",subtitle_x,subtitle_y,5697,5915)

######## Post Processing ########

ConvertToYV12()
#ConvertToYUY2()
#ConvertToRGB24()
