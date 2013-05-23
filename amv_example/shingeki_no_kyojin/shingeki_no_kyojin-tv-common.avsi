Import("macro.avsi")

SetMemoryMax(64)

######## Function ########

global pencil_filter_matrix01="
0 0 0 -1 0
0 0 -2 0 1
0 -2 2 2 0
-1 0 2 0 0
0 1 0 0 0
"

global pencil_filter_matrix02="
0 0 0 1 0
0 0 -2 0 -1
0 -2 2 2 0
1 0 2 0 0
0 -1 0 0 0
"

global _pencil_filter_global_clip_count=0

function PENCIL_FILTER(clip clip){
	global _pencil_filter_global_clip_count=_pencil_filter_global_clip_count+1
	clip_b_name="pencil_clip_"+String(_pencil_filter_global_clip_count)

	clip_a=GeneralConvolution(clip,0,matrix=pencil_filter_matrix01)
	Eval("global "+clip_b_name+"=GeneralConvolution(clip,0,matrix=pencil_filter_matrix02)")
	return ScriptClip(clip_a,"Merge("+clip_b_name+",Spline(current_frame%12,0,0.0,6,1.0,12,0.0,cubic=false))")
}

function MULTIPASS_PENCIL_FILTER(clip clip,int count){
	return count>0?MULTIPASS_PENCIL_FILTER(PENCIL_FILTER(clip),count-1):clip
}

function MULTIPASS_BLUR(clip clip,int count){
	return count>0?MULTIPASS_BLUR(Blur(clip,1.0),count-1):clip
}

global paper_off_u=-25.0
global paper_off_v=10.0
global paper_cont_u=-128.0
global paper_cont_v=-128.0

function PSEUDO_COLOR_GRAY(clip clip){
	return Greyscale(clip)
}

function PSEUDO_COLOR_PAPER(clip clip){
	return ColorYUV(clip,off_u=paper_off_u,cont_u=paper_cont_u,off_v=paper_off_v,cont_v=paper_cont_v)
}

function PSEUDO_COLOR_GRAY_TO_PAPER(clip clip,int start_frame,int end_frame){
	return ScriptClip(clip,"ColorYUV(off_u=Spline(current_frame,-1,0.0,"+String(start_frame)+",0.0,"+String(end_frame)+",paper_off_u,Framecount(),paper_off_u,cubic=false), \
	cont_u=Spline(current_frame,-1,-256.0,"+String(start_frame)+",-256.0,"+String(end_frame)+",paper_cont_u,Framecount(),paper_cont_u,cubic=false), \
	off_v=Spline(current_frame,-1,0.0,"+String(start_frame)+",0.0,"+String(end_frame)+",paper_off_v,Framecount(),paper_off_v,cubic=false), \
	cont_v=Spline(current_frame,-1,-256.0,"+String(start_frame)+",-256.0,"+String(end_frame)+",paper_cont_v,Framecount(),paper_cont_v,cubic=false))")
}

global slow_motion_fps=6

function SLOW_MOTION_WITH_CLIP_SPEED(clip clip){
	return CLIP_SPEED(clip,1.0/Float(slow_motion_fps))
}

function SLOW_MOTION_WITH_CONVERT_FPS(clip clip){
	return SLOW_MOTION_BY_DIVISOR(clip,slow_motion_fps,true)
}

######## TV (1920*1080) ########

shingeki_no_kyojin_tv_01=FFMS2_VIDEO_SOURCE("src\anime\(2013Q2) 進撃の巨人 第01話 「二千年後の君へ」 (1280x720 x264 AAC Hi10p).mp4")
shingeki_no_kyojin_tv_02=FFMS2_VIDEO_SOURCE("src\anime\進撃の巨人 第02話 「その日」 (MBS 1280x720 x264 AAC).mp4")
shingeki_no_kyojin_tv_02=Loop(shingeki_no_kyojin_tv_02,0,3237,3476)
#shingeki_no_kyojin_tv_02=AUDIO_DUB_TONE(shingeki_no_kyojin_tv_02,samplerate=48000,channels=2,type="Silence")
shingeki_no_kyojin_tv_03=FFMS2_VIDEO_SOURCE("src\anime\(2013Q2) 進撃の巨人  第03話 「絶望の中で鈍く光る --人類の再起①-- 」 (MBS 1280x720 x264 AAC).mp4")
shingeki_no_kyojin_tv_04=FFMS2_VIDEO_SOURCE("src\anime\(2013Q2) 進撃の巨人  第04話 「解散式の夜」 (MBS 1280x720 x264 AAC).mp4")
shingeki_no_kyojin_tv_05=FFMS2_VIDEO_SOURCE("src\anime\(2013Q2) 進撃の巨人  第05話 「初陣 --トロスト区攻防戦①--」 (MBS 1280x720 x264 AAC).mp4")
shingeki_no_kyojin_tv_06=FFMS2_VIDEO_SOURCE("src\anime\(2013Q2) 進撃の巨人  第06話 「少女が見た世界」 (MBS 1280x720 x264 AAC).mp4")
shingeki_no_kyojin_tv_07=FFMS2_VIDEO_SOURCE("src\anime\(2013Q2) 進撃の巨人  第07話 「小さな刃」 (MBS 1280x720 x264 AAC).mp4")

shingeki_no_kyojin_tv_clean_op=Trim(shingeki_no_kyojin_tv_03,0,2205)
shingeki_no_kyojin_tv_clean_ed=Trim(shingeki_no_kyojin_tv_03,32244,34399)

######## TRIM ########

shingeki_no_kyojin_tv_clean_op_01=Trim(shingeki_no_kyojin_tv_clean_op,0,288)

shingeki_no_kyojin_tv_clean_ed_01=Trim(shingeki_no_kyojin_tv_clean_ed,0,1538)
shingeki_no_kyojin_tv_clean_ed_02=Trim(shingeki_no_kyojin_tv_clean_ed,1539,1666)
shingeki_no_kyojin_tv_clean_ed_03=Trim(shingeki_no_kyojin_tv_clean_ed,1667,1952)
shingeki_no_kyojin_tv_clean_ed_04=Trim(shingeki_no_kyojin_tv_clean_ed,1953,0)



shingeki_no_kyojin_tv_01_field_01=Trim(shingeki_no_kyojin_tv_01,5893,6005) #113
shingeki_no_kyojin_tv_01_mikasa_watch_eren=Trim(shingeki_no_kyojin_tv_01,6066,6137) #72
shingeki_no_kyojin_tv_01_field_02=Trim(shingeki_no_kyojin_tv_01,6138,6629) #492
shingeki_no_kyojin_tv_01_mikasa_pick_wood=Trim(shingeki_no_kyojin_tv_01,6732,6875) #144
shingeki_no_kyojin_tv_01_people_01=Trim(shingeki_no_kyojin_tv_01,7329,7544) # #216
shingeki_no_kyojin_tv_01_eren_and_mikasa_walk_back_to_shiganshina=Trim(shingeki_no_kyojin_tv_01,7641,7796) #156
shingeki_no_kyojin_tv_01_people_02=Trim(shingeki_no_kyojin_tv_01,9762,10022) # #261
shingeki_no_kyojin_tv_01_shiganshina=Trim(shingeki_no_kyojin_tv_01,11968,12066) #66
shingeki_no_kyojin_tv_01_mikasa_throw_eren=Trim(shingeki_no_kyojin_tv_01,17466,17569) #104
shingeki_no_kyojin_tv_01_grisha_and_carla=Trim(shingeki_no_kyojin_tv_01,18567,18634) # #68
shingeki_no_kyojin_tv_01_jaeger_family_01=Trim(shingeki_no_kyojin_tv_01,18682,18823) # #142
shingeki_no_kyojin_tv_01_jaeger_family_02=Trim(shingeki_no_kyojin_tv_01,19168,19354) # #187
shingeki_no_kyojin_tv_01_grisha_s_key_01=Trim(shingeki_no_kyojin_tv_01,21006,21068) #63
shingeki_no_kyojin_tv_01_grisha_s_key_02=Trim(shingeki_no_kyojin_tv_01,21127,21206) #80
shingeki_no_kyojin_tv_01_armin_catched_01=Trim(shingeki_no_kyojin_tv_01,22004,22106) #103
shingeki_no_kyojin_tv_01_armin_catched_02=Trim(shingeki_no_kyojin_tv_01,22250,22397) #148
shingeki_no_kyojin_tv_01_eren_dash=Trim(shingeki_no_kyojin_tv_01,22656,22687) #32
shingeki_no_kyojin_tv_01_mikasa_dash=Trim(shingeki_no_kyojin_tv_01,22823,22884) #62
shingeki_no_kyojin_tv_01_armin_stare_blankly=Trim(shingeki_no_kyojin_tv_01,23313,23388) #76
shingeki_no_kyojin_tv_01_armin_talk=Trim(shingeki_no_kyojin_tv_01,24168,24308) #141
shingeki_no_kyojin_tv_01_eren_mikasa_armin=Trim(shingeki_no_kyojin_tv_01,24973,25111) # #139
shingeki_no_kyojin_tv_01_armin_run_away=Trim(shingeki_no_kyojin_tv_01,26057,26170) #114
shingeki_no_kyojin_tv_01_eren_watch_chou_oogata_kyojin=Trim(shingeki_no_kyojin_tv_01,26336,26472) #137
shingeki_no_kyojin_tv_01_chou_oogata_kyojin_outside_wall_maria=Trim(shingeki_no_kyojin_tv_01,27771,27914) # #144
shingeki_no_kyojin_tv_01_eren_run_01=Trim(shingeki_no_kyojin_tv_01,29112,29219) #108
shingeki_no_kyojin_tv_01_eren_run_02=Trim(shingeki_no_kyojin_tv_01,29266,29358) #93
shingeki_no_kyojin_tv_01_carla_angry=Trim(shingeki_no_kyojin_tv_01,30684,30750) #67
shingeki_no_kyojin_tv_01_carla_cry=Trim(shingeki_no_kyojin_tv_01,32258,32327) # #70
shingeki_no_kyojin_tv_01_hannes_take_eren_and_mikasa_away=Trim(shingeki_no_kyojin_tv_01,32328,32407) #80
shingeki_no_kyojin_tv_01_eren_no=Trim(shingeki_no_kyojin_tv_01,32989,33082) # #94
shingeki_no_kyojin_tv_01_kyojin_eat_carla=Trim(shingeki_no_kyojin_tv_01,33650,33697) # #48
shingeki_no_kyojin_tv_01_blood_rain=Trim(shingeki_no_kyojin_tv_01,33698,33765) # #68

shingeki_no_kyojin_tv_01_info_01=Trim(shingeki_no_kyojin_tv_01,18200,18291)
shingeki_no_kyojin_tv_01_info_02=Trim(shingeki_no_kyojin_tv_01,18292,18386)
shingeki_no_kyojin_tv_01_cm_chou_oogata_kyojin_open_door=Trim(shingeki_no_kyojin_tv_01,26171,27770)
shingeki_no_kyojin_tv_01_cm_eren_dont_listen=Trim(shingeki_no_kyojin_tv_01,30600,31055)
shingeki_no_kyojin_tv_01_cm_cruel_world=Trim(shingeki_no_kyojin_tv_01,31465,34566)

shingeki_no_kyojin_tv_01_cm_next_01=Trim(shingeki_no_kyojin_tv_01,34567,34609)
shingeki_no_kyojin_tv_01_cm_next_02=Trim(shingeki_no_kyojin_tv_01,34610,34861) #252
shingeki_no_kyojin_tv_01_cm_next_03=Trim(shingeki_no_kyojin_tv_01,34862,34921)

shingeki_no_kyojin_tv_02_kyojin_history=Trim(shingeki_no_kyojin_tv_02,0,1019) # #1020
shingeki_no_kyojin_tv_02_shiganshina_broken_01=Trim(shingeki_no_kyojin_tv_02,3643,3729) #87
shingeki_no_kyojin_tv_02_eren_punch_hannes=Trim(shingeki_no_kyojin_tv_02,6393,6437) #45
shingeki_no_kyojin_tv_02_shiganshina_broken_02=Trim(shingeki_no_kyojin_tv_02,7307,7516) #210
shingeki_no_kyojin_tv_02_yoroi_no_kyojin_dash_01=Trim(shingeki_no_kyojin_tv_02,13526,13595) # #70
shingeki_no_kyojin_tv_02_yoroi_no_kyojin_dash_02=Trim(shingeki_no_kyojin_tv_02,13843,13938) #96
shingeki_no_kyojin_tv_02_yoroi_no_kyojin_close_army=Trim(shingeki_no_kyojin_tv_02,14132,14203) # #72
shingeki_no_kyojin_tv_02_yoroi_no_kyojin_dash_03=Trim(shingeki_no_kyojin_tv_02,14354,14427) #74
shingeki_no_kyojin_tv_02_yoroi_no_kyojin_crash_wall_maria_01=Trim(shingeki_no_kyojin_tv_02,14459,14498) #40
shingeki_no_kyojin_tv_02_yoroi_no_kyojin_crash_wall_maria_02=Trim(shingeki_no_kyojin_tv_02,14499,14570) # #72
shingeki_no_kyojin_tv_02_eren_angry=Trim(shingeki_no_kyojin_tv_02,19298,19352) #55

shingeki_no_kyojin_tv_02_kyojin_medicine_01=Trim(shingeki_no_kyojin_tv_02,20503,20579)
shingeki_no_kyojin_tv_02_kyojin_medicine_02=Trim(shingeki_no_kyojin_tv_02,20740,20785)
shingeki_no_kyojin_tv_02_kyojin_medicine_03=Trim(shingeki_no_kyojin_tv_02,20849,20949)
shingeki_no_kyojin_tv_02_kyojin_medicine_04=Trim(shingeki_no_kyojin_tv_02,20983,21015)
shingeki_no_kyojin_tv_02_kyojin_medicine_05=Trim(shingeki_no_kyojin_tv_02,21031,21048)
shingeki_no_kyojin_tv_02_kyojin_medicine_06=Trim(shingeki_no_kyojin_tv_02,21057,21079)
shingeki_no_kyojin_tv_02_kyojin_medicine_07=Trim(shingeki_no_kyojin_tv_02,21088,21094)
shingeki_no_kyojin_tv_02_kyojin_medicine=shingeki_no_kyojin_tv_02_kyojin_medicine_01+shingeki_no_kyojin_tv_02_kyojin_medicine_02+shingeki_no_kyojin_tv_02_kyojin_medicine_03 # #224

shingeki_no_kyojin_tv_02_the_key_01=Trim(shingeki_no_kyojin_tv_02,20820,20848) #29
shingeki_no_kyojin_tv_02_the_key_02=Trim(shingeki_no_kyojin_tv_02,20950,20970) #21
shingeki_no_kyojin_tv_02_the_key_fall=Trim(shingeki_no_kyojin_tv_02,21130,21169) # #40
shingeki_no_kyojin_tv_02_eren_found_the_key_01=Trim(shingeki_no_kyojin_tv_02,21678,21736) #59
shingeki_no_kyojin_tv_02_eren_found_the_key_02=Trim(shingeki_no_kyojin_tv_02,21857,21961) #105
shingeki_no_kyojin_tv_02_mikasa_punch_eren=Trim(shingeki_no_kyojin_tv_02,26392,26465) #74

shingeki_no_kyojin_tv_02_mikasa_push_bread_to_eren_mouth_01=Trim(shingeki_no_kyojin_tv_02,27453,27496) #44
shingeki_no_kyojin_tv_02_mikasa_push_bread_to_eren_mouth_02=Trim(shingeki_no_kyojin_tv_02,27528,27622) #95
shingeki_no_kyojin_tv_02_mikasa_push_bread_to_eren_mouth_03=Trim(shingeki_no_kyojin_tv_02,27623,27777) #155
shingeki_no_kyojin_tv_02_mikasa_push_bread_to_eren_mouth=shingeki_no_kyojin_tv_02_mikasa_push_bread_to_eren_mouth_01+shingeki_no_kyojin_tv_02_mikasa_push_bread_to_eren_mouth_02+shingeki_no_kyojin_tv_02_mikasa_push_bread_to_eren_mouth_03 # #294
shingeki_no_kyojin_tv_02_cm_mikasa_push_bread_to_eren_mouth=Trim(shingeki_no_kyojin_tv_02,27453,27777)

shingeki_no_kyojin_tv_02_eren_mikasa_armin_farmimg=Trim(shingeki_no_kyojin_tv_02,28037,28159) # #123

shingeki_no_kyojin_tv_02_armin_grandfather_leave_01=Trim(shingeki_no_kyojin_tv_02,28396,28448) #53
shingeki_no_kyojin_tv_02_armin_grandfather_leave_02=Trim(shingeki_no_kyojin_tv_02,28449,28561) #113
shingeki_no_kyojin_tv_02_armin_grandfather_leave=shingeki_no_kyojin_tv_02_armin_grandfather_leave_01+shingeki_no_kyojin_tv_02_armin_grandfather_leave_02 # #166

shingeki_no_kyojin_tv_02_resist_failed=Trim(shingeki_no_kyojin_tv_02,28818,28892) # #75
shingeki_no_kyojin_tv_02_kyojin_conquer_field=Trim(shingeki_no_kyojin_tv_02,28893,29121) #229

shingeki_no_kyojin_tv_03_lake=Trim(shingeki_no_kyojin_tv_03,27560,27846) # #287
shingeki_no_kyojin_tv_03_eren_move=Trim(shingeki_no_kyojin_tv_03,31837,31964) #128

shingeki_no_kyojin_tv_04_104th_corps_graduates_01=Trim(shingeki_no_kyojin_tv_04,19714,19941) #228
shingeki_no_kyojin_tv_04_104th_corps_graduates_02=Trim(shingeki_no_kyojin_tv_04,19942,20001) #60
shingeki_no_kyojin_tv_04_104th_corps_graduates=shingeki_no_kyojin_tv_04_104th_corps_graduates_01+shingeki_no_kyojin_tv_04_104th_corps_graduates_02 # #288

shingeki_no_kyojin_tv_05_eren_mikasa_armin_in_class=Trim(shingeki_no_kyojin_tv_05,20210,20571) # #362

shingeki_no_kyojin_tv_06_mikasa_family_01=Trim(shingeki_no_kyojin_tv_06,26617,26676) #60
shingeki_no_kyojin_tv_06_mikasa_family_02=Trim(shingeki_no_kyojin_tv_06,26677,26730) #54
shingeki_no_kyojin_tv_06_mikasa_family=shingeki_no_kyojin_tv_06_mikasa_family_01+shingeki_no_kyojin_tv_06_mikasa_family_02 # #114

shingeki_no_kyojin_tv_07_cm_mikasa_iaido=Trim(shingeki_no_kyojin_tv_07,22027,22601) #575
shingeki_no_kyojin_tv_07_cm_kyojin_eren_punch_kyojin_01=Trim(shingeki_no_kyojin_tv_07,25009,25186) #178
shingeki_no_kyojin_tv_07_cm_kyojin_eren_punch_kyojin_02=Trim(shingeki_no_kyojin_tv_07,27934,28235) #
