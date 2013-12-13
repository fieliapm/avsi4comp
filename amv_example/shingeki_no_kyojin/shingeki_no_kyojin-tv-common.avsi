Import("..\avsi4comp\macro.avsi")

SetMemoryMax(64)

######## Function ########

global slow_motion_fps=6

function SLOW_MOTION_WITH_CLIP_SPEED(clip clip){
	return CLIP_SPEED(clip,1.0/Float(slow_motion_fps),true)
}

function SLOW_MOTION_WITH_CONVERT_FPS(clip clip){
	return SLOW_MOTION_BY_DIVISOR(clip,slow_motion_fps,true)
}

######## TV (1920*1080) ########

shingeki_no_kyojin_tv_01=FFMS2_VIDEO_SOURCE("src\anime\(2013Q2) 進撃の巨人  第01話 「二千年後の君へ」 (MBS 1280x720 x264 AAC).mp4")
shingeki_no_kyojin_tv_01_cache02=FFMS2_VIDEO_SOURCE("src\anime\(2013Q2) 進撃の巨人  第01話 「二千年後の君へ」 (MBS 1280x720 x264 AAC).mp4")
shingeki_no_kyojin_tv_06=FFMS2_VIDEO_SOURCE("src\anime\(2013Q2) 進撃の巨人  第06話 「少女が見た世界」 (MBS 1280x720 x264 AAC).mp4")
shingeki_no_kyojin_tv_17=FFMS2_VIDEO_SOURCE("src\anime\(2013Q2) 進撃の巨人  第17話 「女型の巨人」 (MBS 1280x720 x264 AAC).mp4")

shingeki_no_kyojin_tv_01_kyojin_catch_carla_01=Trim(shingeki_no_kyojin_tv_01,32841,32950) #110 op2
shingeki_no_kyojin_tv_01_kyojin_catch_carla_02=Trim(shingeki_no_kyojin_tv_01_cache02,32951,33052) #102 op2
