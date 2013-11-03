Import("..\avsi4comp\macro.avsi")

#SetMemoryMax(64)

######## PS3 (1280*720) ########

fpsnum=30000
fpsden=1001

ico_hd_pv=FFMS2_VIDEO_SOURCE("src\ico_nico-movie\official\ico\ico_pv.wmv",fpsnum=fpsnum,fpsden=fpsden)
ico_hd_pv_tgs2011=FFMS2_VIDEO_SOURCE("src\ico_nico-movie\official\ico\ico_pv_tgs2011.wmv",fpsnum=fpsnum,fpsden=fpsden)

#ico_hd_gameplay_opening=FFMS2_VIDEO_SOURCE("src\ico_nico-movie\gameplay\vidyax2\ico-opening-720p.mp4")
ico_hd_gameplay_ending=SSRC(AssumeFPS(FFMS2_VIDEO_SOURCE("src\ico_nico-movie\gameplay\vidyax2\ico-ending-720p.mp4"),ico_hd_pv),48000)
ico_hd_gameplay_beach=SSRC(AssumeFPS(FFMS2_VIDEO_SOURCE("src\ico_nico-movie\gameplay\vidyax2\ico-beach-720p.mp4"),ico_hd_pv),48000)

#ico_hd_gameplay_01=FFMS2_VIDEO_SOURCE("src\ico_nico-movie\gameplay\huperion\ico-gameplay-01-720p.mp4")
#ico_hd_gameplay_02=FFMS2_VIDEO_SOURCE("src\ico_nico-movie\gameplay\huperion\ico-gameplay-02-720p.mp4")
#ico_hd_gameplay_03=FFMS2_VIDEO_SOURCE("src\ico_nico-movie\gameplay\huperion\ico-gameplay-03-720p.mp4")

######## TRIM ########

ico_hd_pv_01=Trim(ico_hd_pv,453,2056)
ico_hd_pv_02=Trim(ico_hd_pv,2057,2696)
ico_hd_pv_03=Trim(ico_hd_pv,2697,2990)
ico_hd_pv_04=Trim(ico_hd_pv,2991,3495)
ico_hd_pv_05=Trim(ico_hd_pv,3496,3866)

ico_hd_pv_tgs2011_01=Trim(ico_hd_pv_tgs2011,416,1279)
ico_hd_pv_tgs2011_02=Trim(ico_hd_pv_tgs2011,1280,1564)
ico_hd_pv_tgs2011_03_01=Trim(ico_hd_pv_tgs2011,1565,1695) #131
ico_hd_pv_tgs2011_03_02=Trim(ico_hd_pv_tgs2011,1696,1854)
ico_hd_pv_tgs2011_04=Trim(ico_hd_pv_tgs2011,1855,2068)
ico_hd_pv_tgs2011_05=Trim(ico_hd_pv_tgs2011,2069,2233)

ico_hd_gameplay_beach_01_beach=Trim(ico_hd_gameplay_beach,0,408) #409
ico_hd_gameplay_beach_02_boat=Trim(ico_hd_gameplay_beach,409,557) #149
ico_hd_gameplay_beach_03_ico_on_boat_01=Trim(ico_hd_gameplay_beach,558,617) #60
ico_hd_gameplay_beach_03_ico_on_boat_02=Trim(ico_hd_gameplay_beach,618,796) #179
ico_hd_gameplay_beach_04_ico_leave_boat=Trim(ico_hd_gameplay_beach,797,1020) #224
#ico_hd_gameplay_beach_05_ico_run_on_beach=Trim(ico_hd_gameplay_beach,1021,3644) #2624
ico_hd_gameplay_beach_06_ico_found_yurda_on_beach=Trim(ico_hd_gameplay_beach,3645,3724) #80
ico_hd_gameplay_beach_07_ico_watch=Trim(ico_hd_gameplay_beach,3725,3814) #90
ico_hd_gameplay_beach_08_yorda_wake_up=Trim(ico_hd_gameplay_beach,3815,4281) #467
#ico_hd_gameplay_beach_09_end=Trim(ico_hd_gameplay_beach,4282,0)

#ico_hd_gameplay_ending_yorda_wake_up=Trim(ico_hd_gameplay_ending,142,231) #90
#ico_hd_gameplay_ending_lightning_start_01=Trim(ico_hd_gameplay_ending,232,351) #120
ico_hd_gameplay_ending_lightning_start_02=Trim(ico_hd_gameplay_ending,352,441) #90
#ico_hd_gameplay_ending_yorda_hit_by_lightning=Trim(ico_hd_gameplay_ending,442,561) #120
ico_hd_gameplay_ending_black_yorda=Trim(ico_hd_gameplay_ending,1133,1312) #180

ico_hd_gameplay_ending_elevator=Trim(ico_hd_gameplay_ending,5124,5470) #347

#ico_hd_gameplay_ending_yorda_let_ico_go_01=Trim(ico_hd_gameplay_ending,5775,5894) #120
ico_hd_gameplay_ending_yorda_let_ico_go_02=Trim(ico_hd_gameplay_ending,5895,6284) #390
#ico_hd_gameplay_ending_yorda_let_ico_go_03=Trim(ico_hd_gameplay_ending,6285,6374) #90
#ico_hd_gameplay_ending_yorda_let_ico_go_04=Trim(ico_hd_gameplay_ending,6375,6645) #271

#ico_hd_gameplay_ending_ico_on_boat=Trim(ico_hd_gameplay_ending,8734,9148) #415

#ico_hd_gameplay_ending_endroll_ico_escape_01=Trim(ico_hd_gameplay_ending,9183,9270)
ico_hd_gameplay_ending_endroll_ico_escape_02=Trim(ico_hd_gameplay_ending,9271,10225) #955
#ico_hd_gameplay_ending_endroll_ico_escape_03=Trim(ico_hd_gameplay_ending,10226,10356)

######## Pre Combine ########

ico_hd_pv_tgs2011_03_01_remake=TRIM_LAST_CLIP(ico_hd_gameplay_beach_06_ico_found_yurda_on_beach,72)+TRIM_FIRST_CLIP(ico_hd_gameplay_beach_03_ico_on_boat_01,59)
ico_hd_pv_tgs2011_03_remake=TRIM_MIDDLE_CLIP(ico_hd_pv_tgs2011_03_01_remake,Framecount(ico_hd_pv_tgs2011_03_01))+ico_hd_pv_tgs2011_03_02

######## Combine ########

# ico_hd_pv_01 -120
# ico_hd_pv_02 4073
# ico_hd_pv_03 4713
# ico_hd_pv_04 5007
# ico_hd_pv_05 7187

# ico_hd_pv_tgs2011_02 2132
# ico_hd_pv_tgs2011_03_01 2417
# ico_hd_pv_tgs2011_03_02 2548
# ico_hd_pv_tgs2011_04 2995
# ico_hd_pv_tgs2011_05 3209

fade_out_length=59

ico_ed_t01=Trim(ico_hd_pv_01,120,0)
ico_ed_t02=TRIM_LAST_CLIP(ico_hd_pv_tgs2011_01+ico_hd_pv_tgs2011_02,289+144+215+144+144-3)
ico_ed_t03=ico_hd_pv_tgs2011_03_remake+TRIM_LAST_CLIP(ico_hd_gameplay_beach_03_ico_on_boat_02,144)+TRIM_LAST_CLIP(ico_hd_gameplay_beach_04_ico_leave_boat,144)+TRIM_FIRST_CLIP(ico_hd_pv_tgs2011_04+ico_hd_pv_tgs2011_05,144+72+143+1)

#ico_ed_t04=BlankClip(ico_hd_pv,length=144,color=color_white)+BlankClip(ico_hd_pv,length=144,color=color_black)+BlankClip(ico_hd_pv,length=144,color=color_white)+BlankClip(ico_hd_pv,length=143,color=color_black)+BlankClip(ico_hd_pv,length=143,color=color_white)
ico_ed_t04=TRIM_FIRST_CLIP(BlankClip(ico_hd_pv,length=1,color=color_black)+ico_hd_gameplay_ending_endroll_ico_escape_02,144+144+144+143+143)

ico_ed_t05=ico_hd_pv_02+ico_hd_pv_03+ico_hd_pv_04+TRIM_MIDDLE_CLIP(ico_hd_gameplay_beach_07_ico_watch,73)+TRIM_MIDDLE_CLIP(ico_hd_gameplay_ending_black_yorda,144)+TRIM_MIDDLE_CLIP(ico_hd_gameplay_ending_lightning_start_02,72)+FadeOut0(TRIM_FIRST_CLIP(ico_hd_gameplay_beach_02_boat,143),fade_out_length)
ico_ed_t06=TRIM_MIDDLE_CLIP(ico_hd_gameplay_ending_elevator,288)+TRIM_MIDDLE_CLIP(ico_hd_gameplay_ending_yorda_let_ico_go_02,288)
ico_ed_t07=TRIM_LAST_CLIP(ico_hd_gameplay_beach_01_beach,288)+TRIM_MIDDLE_CLIP(ico_hd_gameplay_beach_08_yorda_wake_up,379)+ico_hd_pv_05+BlankClip(ico_hd_pv,length=420,color=color_black)

ico_ed_mute=ico_ed_t01+ico_ed_t02+ico_ed_t03+Letterbox(FADE_OUT_WITH_BRIGHTNESS_OFFSET_RGB24(ico_ed_t04,36),72,72)+ico_ed_t05+ico_ed_t06+ico_ed_t07

######## Music ########

bgm_48khz=SSRC(WAVSource("src\ico-ost-16.wav"),48000)
AudioDub(ico_ed_mute,bgm_48khz)

######## Subtitle ########

global subtitle_clip_width=1280
global subtitle_clip_height=720

subtitle_x=50*1.5
subtitle_y=400*1.5
global subtitle_front_fade_count=30
global subtitle_rear_fade_count=30
global subtitle_font="MS Gothic"
global subtitle_effects="bi"
global subtitle_size=24*1.5
global subtitle_text_color=color_white
global subtitle_halo_color=OVERWRITE_COLOR_ALPHA(color_black,$3F)

function SUBTITLE_FX(clip clip,string text,float x,float y,int start_frame,int end_frame,bool "is_title"){
	is_title=Default(is_title,false)

	text_color=is_title?OVERWRITE_COLOR_ALPHA(subtitle_halo_color,$0):subtitle_text_color
	halo_color=is_title?OVERWRITE_COLOR_ALPHA(subtitle_text_color,$3F):subtitle_halo_color

	return SUBTITLE_FX_OFFSET_FADE_IN_FADE_OUT(clip,text,Round(x),Round(y),start_frame,end_frame,subtitle_front_fade_count,subtitle_rear_fade_count,subtitle_font,subtitle_effects,Round(subtitle_size),text_color,halo_color)
}

SUBTITLE_FX("ICO -You were there-//Steven Geraghty|- by fielia@AVISynth",subtitle_x,subtitle_y-subtitle_size,617,820,true)

SUBTITLE_FX("The island bathes in the sun's bright rays",subtitle_x,subtitle_y,895,1033)
SUBTITLE_FX("Distant hills wear a shroud of grey",subtitle_x,subtitle_y,1036,1161)
SUBTITLE_FX("A lonely breeze whispers in the trees",subtitle_x,subtitle_y,1179,1321)
SUBTITLE_FX("Sole witness to history",subtitle_x,subtitle_y,1326,1451)

SUBTITLE_FX("Fleeting memories rise",subtitle_x,subtitle_y,1480,1594)
SUBTITLE_FX("From the shadows of my mind",subtitle_x,subtitle_y,1614,1738)
SUBTITLE_FX("""Sing "nonomori" - endless corridors""",subtitle_x,subtitle_y,1750,1881)
SUBTITLE_FX("""Say "nonomori" - hopeless warriors""",subtitle_x,subtitle_y,1893,2097)
SUBTITLE_FX("You were there",subtitle_x,subtitle_y,2109,2241)
SUBTITLE_FX("You were there",subtitle_x,subtitle_y,2251,2385)

SUBTITLE_FX("Am I forever dreaming",subtitle_x,subtitle_y,2415,2529)
SUBTITLE_FX("How to define the way I'm feeling",subtitle_x,subtitle_y,2559,2673)

SUBTITLE_FX("You were there",subtitle_x,subtitle_y,2702,2817)
SUBTITLE_FX("Countless visions they haunt me in my sleep",subtitle_x,subtitle_y,2839,2960)
SUBTITLE_FX("You were there",subtitle_x,subtitle_y,2990,3105)
SUBTITLE_FX("Though forgotten all promises we keep",subtitle_x,subtitle_y,3127,3284)

SUBTITLE_FX("Slaves to our destiny",subtitle_x,subtitle_y,4069,4184)
SUBTITLE_FX("I recall a melody",subtitle_x,subtitle_y,4201,4327)
SUBTITLE_FX("""Sing "nonomori" - seasons lit with gold""",subtitle_x,subtitle_y,4340,4471)
SUBTITLE_FX("""Say "nonomori" - legends yet untold""",subtitle_x,subtitle_y,4484,4687)
SUBTITLE_FX("You were there",subtitle_x,subtitle_y,4699,4831)
SUBTITLE_FX("You were there",subtitle_x,subtitle_y,4842,4975)

SUBTITLE_FX("Happiness follows sorrow",subtitle_x,subtitle_y,5004,5119)
SUBTITLE_FX("Only believing in tomorrow",subtitle_x,subtitle_y,5148,5263)

SUBTITLE_FX("You were there",subtitle_x,subtitle_y,5292,5407)
SUBTITLE_FX("Countless visions they haunt me in my sleep",subtitle_x,subtitle_y,5428,5550)
SUBTITLE_FX("You were there",subtitle_x,subtitle_y,5579,5695)
SUBTITLE_FX("Though forgotten all promises we keep",subtitle_x,subtitle_y,5710,5874)

SUBTITLE_FX("The island bathes in the sun's bright rays",subtitle_x,subtitle_y,5926,6068)
SUBTITLE_FX("Distant hills wear a shroud of grey",subtitle_x,subtitle_y,6071,6201)
SUBTITLE_FX("A lonely breeze whispers in the trees",subtitle_x,subtitle_y,6221,6355)
SUBTITLE_FX("Sole key to this mystery",subtitle_x,subtitle_y,6360,6599)

SUBTITLE_FX("我不能放開這個人的手|    因為,那似乎等於放棄了自己的靈魂",subtitle_clip_width/6,subtitle_y-subtitle_size,7333,7462)



AUDIO_DUB_TONE(Trim(ico_hd_pv_01,0,119),samplerate=48000,channels=2,type="Silence")++ConvertToYV12(last)

######## Post Processing ########

ConvertToYV12()
#ConvertToYUY2()
#ConvertToRGB24()
