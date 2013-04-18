Import("macro.avsi")

#SetMemoryMax(64)

######## PV Online (720P) ########

ayesha_op=AssumeFPS(FFMS2_VIDEO_SOURCE("src\special\movie\【アーシャのアトリエ】オープニングムービー.720p.mp4"),"ntsc_video")
ayesha_design_movie=AssumeFPS(FFMS2_VIDEO_SOURCE("src\special\movie\【アーシャのアトリエ】ティザームービー.720p.mp4"),ayesha_op)
ayesha_design_movie_cache02=AssumeFPS(FFMS2_VIDEO_SOURCE("src\special\movie\【アーシャのアトリエ】ティザームービー.720p.mp4"),ayesha_op)
ayesha_promotion_movie=AssumeFPS(FFMS2_VIDEO_SOURCE("src\special\movie\【アーシャのアトリエ】プロモーションムービー.720p.mp4"),ayesha_op)
ayesha_promotion_movie_cache02=AssumeFPS(FFMS2_VIDEO_SOURCE("src\special\movie\【アーシャのアトリエ】プロモーションムービー.720p.mp4"),ayesha_op)



#ayesha_op_00=Trim(ayesha_op,0,160)
ayesha_op_01=Trim(ayesha_op,161,2427)
ayesha_op_02=Trim(ayesha_op,2428,3473)
#ayesha_op_03=Trim(ayesha_op,3474,0)

ayesha_design_movie_01=Trim(ayesha_design_movie,0,1216)
ayesha_design_movie_02_01=Trim(ayesha_design_movie_cache02,1217,1502)
#ayesha_design_movie_02_02=Trim(ayesha_design_movie,1503,0)

#ayesha_promotion_movie_00=Trim(ayesha_promotion_movie,0,194)
ayesha_promotion_movie_01=Trim(ayesha_promotion_movie,195,343)
ayesha_promotion_movie_02=Trim(ayesha_promotion_movie,344,777)
ayesha_promotion_movie_03_01=Trim(ayesha_promotion_movie,778,1831)
ayesha_promotion_movie_03_02=Trim(ayesha_promotion_movie,1832,1934)
ayesha_promotion_movie_04_01=Trim(ayesha_promotion_movie,1935,2517)
ayesha_promotion_movie_04_02=Trim(ayesha_promotion_movie,2518,2800)
ayesha_promotion_movie_04_03=Trim(ayesha_promotion_movie,2801,3094)
ayesha_promotion_movie_05=Trim(ayesha_promotion_movie_cache02,3095,3797)
#ayesha_promotion_movie_06=Trim(ayesha_promotion_movie,3798,0)

######## Pre Combine ########

function STACK_2_2(clip clip){
	stack_clip=StackVertical(StackHorizontal(clip,clip),StackHorizontal(clip,clip))
	return RESIZE_TO_REF_CLIP(stack_clip,clip)
}

function EXTEND_ZOOM(clip clip){
	return ScriptClip(clip,"FAST_ZOOM(dstx=Spline(current_frame,0,Width()/4.0,Framecount()-1,Width()*5.0/8.0),dsty=Spline(current_frame,0,Height()/4.0,Framecount()-1,Height()*5.0/8.0),factor=Spline(current_frame,0,0.5,Framecount()-1,0.75),extend=true)")
}

function PARALLAX(clip clip,float dstx,float dsty,float dstz,float factor,float "srcx",float "srcy"){
	clip_width=Width(clip)
	clip_height=Height(clip)
	clip_half_width=Float(clip_width)*0.5
	clip_half_height=Float(clip_height)*0.5

	dstz=CLAMP(dstz,0.0001,100.0)
	distance_factor=1.0/dstz
	return FAST_ZOOM(clip,srcx,srcy,(dstx*distance_factor)+clip_half_width,(dsty*distance_factor)+clip_half_height,factor=factor*distance_factor)
}

function PARALLAX_FLY(clip clip_bg,clip clip_fg){
	clip_bg=TRIM_FIRST_CLIP(clip_bg,Framecount(clip_fg))
	clip_bg=ConvertToRGB32(clip_bg)
	clip_fg=ConvertToRGB32(clip_fg)
	clip_fg1=ScriptClip(clip_fg,"PARALLAX(Spline(current_frame,0,800.0,Framecount()-1,000.0),400.0,Spline(current_frame,0,3.0,Framecount()-1,-1.1),0.5)")
	clip_fg2=ScriptClip(clip_fg,"PARALLAX(Spline(current_frame,0,000.0,Framecount()-1,-800.0),-400.0,Spline(current_frame,0,4.0,Framecount()-1,0.1),0.5)")
	clip_fg3=ScriptClip(clip_fg,"PARALLAX(Spline(current_frame,0,000.0,Framecount()-1,-800.0),400.0,Spline(current_frame,0,5.0,Framecount()-1,1.1),0.5)")
	clip_fg4=ScriptClip(clip_fg,"PARALLAX(Spline(current_frame,0,800.0,Framecount()-1,000.0),-400.0,Spline(current_frame,0,6.0,Framecount()-1,2.1),0.5)")
	clip_bg=Layer(clip_bg,clip_fg1,"Add")
	clip_bg=Layer(clip_bg,clip_fg2,"Add")
	clip_bg=Layer(clip_bg,clip_fg3,"Add")
	clip_bg=Layer(clip_bg,clip_fg4,"Add")
	return ConvertToYV12(clip_bg)
}

ayesha_design_movie_02_01_trimmed=TRIM_FIRST_CLIP(ayesha_design_movie_02_01,160)
ayesha_design_movie_02_01_extend=ayesha_design_movie_02_01_trimmed+STACK_2_2(ayesha_design_movie_02_01_trimmed)+EXTEND_ZOOM(ayesha_design_movie_02_01_trimmed)+PARALLAX_FLY(ayesha_design_movie_01,ayesha_design_movie_02_01_trimmed)

######## Combine ########

# ayesha_op_02 5304
# ayesha_op_t02 3420
# ayesha_op_t03	4699

dissolve_length=10

ayesha_op_t01=Dissolve(ayesha_op_01,Trim(ayesha_design_movie_01,64-dissolve_length,0),dissolve_length)
ayesha_op_t02=Dissolve(ayesha_promotion_movie_01+ayesha_promotion_movie_02,ayesha_promotion_movie_05,7)
ayesha_op_t03=Dissolve(TRIM_FIRST_CLIP(ayesha_design_movie_02_01_extend,605+dissolve_length),ayesha_op_02,dissolve_length)

ayesha_op_mute=ayesha_op_t01+ayesha_op_t02+ayesha_op_t03

######## Music ########

bgm_48khz=SSRC(WAVSource("src\ayesha_no_atelier-vocal_album-01.wav"),48000)
bgm_48khz_delayed=DelayAudio(bgm_48khz,1.470)
AudioDub(ayesha_op_mute,bgm_48khz_delayed)

######## Subtitle ########

global subtitle_clip_width=1280
global subtitle_clip_height=720

subtitle_x=50*1.5
subtitle_y=400*1.5
global subtitle_front_fade_count=30
global subtitle_rear_fade_count=30
global subtitle_font="MS Gothic"
global subtitle_effects="bi"
global subtitle_size=28*1.5
global subtitle_session01_text_color=color_black
global subtitle_session01_halo_color=OVERWRITE_COLOR_ALPHA(color_white,$7F)
global subtitle_session02_text_color=color_white
global subtitle_session02_halo_color=OVERWRITE_COLOR_ALPHA(color_black,$7F)

function SUBTITLE_FX(clip clip,string text,float x,float y,int start_frame,int end_frame,bool is_session_01){
	text_color=is_session_01?subtitle_session01_text_color:subtitle_session02_text_color
	halo_color=is_session_01?subtitle_session01_halo_color:subtitle_session02_halo_color

	return SUBTITLE_FX_OFFSET_FADE_IN_FADE_OUT(clip,text,Round(x),Round(y),start_frame,end_frame,subtitle_front_fade_count,subtitle_rear_fade_count,subtitle_font,subtitle_effects,Round(subtitle_size),text_color,halo_color)
}

SUBTITLE_FX("花標//野見山睦未|- by fielia@AVISynth",subtitle_x,subtitle_y-subtitle_size,382,702,true)

SUBTITLE_FX("繋ごうとした指は空振り",subtitle_x,subtitle_y,1035,1266,true)
SUBTITLE_FX("掴んだ風はあの日と同じ匂いがした",subtitle_x,subtitle_y,1355,1644,true)

SUBTITLE_FX("咲いたばかりの小さな花に 導かれてくままに",subtitle_x,subtitle_y,1675,2007,true)
SUBTITLE_FX("わたしは歩き出す",subtitle_x,subtitle_y,2026,2214,true)

SUBTITLE_FX("遠いどこかへと 辿り着くように",subtitle_x,subtitle_y,2266,2541,false)
SUBTITLE_FX("やがてあなたへと 辿り着くように",subtitle_x,subtitle_y,2585,2860,false)

SUBTITLE_FX("そして約束が始まる",subtitle_x,subtitle_y,2904,3102,false)

SUBTITLE_FX("止まったままの懐中時計",subtitle_x,subtitle_y,3434,3666,false)
SUBTITLE_FX("大切に抱えて過ごしている日々にも",subtitle_x,subtitle_y,3754,4043,false)
SUBTITLE_FX("新しい出来事がいくらでも起こり続けるから",subtitle_x,subtitle_y,4074,4400,false)
SUBTITLE_FX("振り返らず歩く",subtitle_x,subtitle_y,4422,4610,false)

SUBTITLE_FX("遠いどこかへと 辿り着くように",subtitle_x,subtitle_y,4664,4936,false)
SUBTITLE_FX("やがてあなたへと 辿り着くように",subtitle_x,subtitle_y,4982,5258,false)

SUBTITLE_FX("続く花標",subtitle_x,subtitle_y,5302,5417,false)

SUBTITLE_FX("そして約束が始まる",subtitle_x,subtitle_y,5940,6142,false)

######## Post Processing ########

ConvertToYV12()
#ConvertToYUY2()
#ConvertToRGB24()
