Import("..\..\avsi4comp\macro.avsi")

######## PV Online (720P) ########

meruru_prologue_movie=AssumeFPS(FFMS2_VIDEO_SOURCE("src\special\movie\a13-prologue_movie.mp4"),"ntsc_video")

######## PV DVD (480P) ########

######## PS3 (720P) ########

######## Combine ########

meruru_ed_mute=BlankClip(meruru_prologue_movie,length=330,color=color_black)+meruru_prologue_movie

######## Music ########

bgm_48khz=SSRC(WAVSource("src\meruru_no_atelier-ost-01-05.wav"),48000)
AudioDub(meruru_ed_mute,bgm_48khz)

######## Subtitle ########

######## Post Processing ########

ConvertToYV12()
#ConvertToYUY2()
#ConvertToRGB24()
