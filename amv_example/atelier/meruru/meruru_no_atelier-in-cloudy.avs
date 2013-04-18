Import("macro.avsi")

######## PV Online (720P) ########

meruru_play_planner_at_take_out=AssumeFPS(FFMS2_VIDEO_SOURCE("src\special\play\a13-planner_at_take_out.flv"),"ntsc_video")

meruru_play_planner_at_take_out_01=Trim(meruru_play_planner_at_take_out,0,317)
meruru_play_planner_at_take_out_02=Trim(meruru_play_planner_at_take_out,318,10277)
meruru_play_planner_at_take_out_03=Trim(meruru_play_planner_at_take_out,10278,0)

######## Combine ########

meruru_ed_mute=meruru_play_planner_at_take_out_02

######## Music ########

bgm_48khz=SSRC(WAVSource("src\meruru_no_atelier-ost-01-02.wav"),48000)
AudioDub(meruru_ed_mute,bgm_48khz)

######## Subtitle ########

######## Post Processing ########

ConvertToYV12()
#ConvertToYUY2()
#ConvertToRGB24()
