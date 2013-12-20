Import("shingeki_no_kyojin-tv-common.avsi")

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

######## TV (1920*1080) ########

shingeki_no_kyojin_tv_02=FFMS2_VIDEO_SOURCE("src\anime\進撃の巨人 第02話 「その日」 (MBS 1280x720 x264 AAC).mp4")
shingeki_no_kyojin_tv_02=Loop(shingeki_no_kyojin_tv_02,0,3237,3476)
#shingeki_no_kyojin_tv_02=AUDIO_DUB_TONE(shingeki_no_kyojin_tv_02,samplerate=48000,channels=2,type="Silence")
shingeki_no_kyojin_tv_03=FFMS2_VIDEO_SOURCE("src\anime\(2013Q2) 進撃の巨人  第03話 「絶望の中で鈍く光る --人類の再起①-- 」 (MBS 1280x720 x264 AAC).mp4")
shingeki_no_kyojin_tv_04=FFMS2_VIDEO_SOURCE("src\anime\(2013Q2) 進撃の巨人  第04話 「解散式の夜」 (MBS 1280x720 x264 AAC).mp4")
shingeki_no_kyojin_tv_05=FFMS2_VIDEO_SOURCE("src\anime\(2013Q2) 進撃の巨人  第05話 「初陣 --トロスト区攻防戦①--」 (MBS 1280x720 x264 AAC).mp4")
shingeki_no_kyojin_tv_07=FFMS2_VIDEO_SOURCE("src\anime\(2013Q2) 進撃の巨人  第07話 「小さな刃」 (MBS 1280x720 x264 AAC).mp4")
shingeki_no_kyojin_tv_08=FFMS2_VIDEO_SOURCE("src\anime\(2013Q2) 進撃の巨人  第08話 「心臓の鼓動が聞こえる」 (MBS 1280x720 x264 AAC).mp4")
shingeki_no_kyojin_tv_09=FFMS2_VIDEO_SOURCE("src\anime\(2013Q2) 進撃の巨人  第09話 「左腕の行方」 (MBS 1280x720 x264 AAC).mp4")
shingeki_no_kyojin_tv_10=FFMS2_VIDEO_SOURCE("src\anime\(2013Q2) 進撃の巨人  第10話 「応える」 (MBS 1280x720 x264 AAC).mp4")
shingeki_no_kyojin_tv_10_cache02=FFMS2_VIDEO_SOURCE("src\anime\(2013Q2) 進撃の巨人  第10話 「応える」 (MBS 1280x720 x264 AAC).mp4")
shingeki_no_kyojin_tv_11=FFMS2_VIDEO_SOURCE("src\anime\(2013Q2) 進撃の巨人  第11話 「偶像」 (MBS 1280x720 x264 AAC).mp4")
shingeki_no_kyojin_tv_12=FFMS2_VIDEO_SOURCE("src\anime\(2013Q2) 進撃の巨人  第12話 「傷」 (MBS 1280x720 x264 AAC).mp4")
shingeki_no_kyojin_tv_13=FFMS2_VIDEO_SOURCE("src\anime\(2013Q2) 進撃の巨人  第13話 「原初的欲求」 (MBS 1280x720 x264 AAC).mp4")
shingeki_no_kyojin_tv_13_5=FFMS2_VIDEO_SOURCE("src\anime\(2013Q2) 進撃の巨人  第13.5話 「あの日から」 (MBS 1280x720 x264 AAC).mp4")

shingeki_no_kyojin_tv_clean_op_01=Trim(shingeki_no_kyojin_tv_03,0,2205)
shingeki_no_kyojin_tv_clean_ed_01=Trim(shingeki_no_kyojin_tv_03,32244,34399)

######## Trim ########

shingeki_no_kyojin_tv_clean_op_01_01=Trim(shingeki_no_kyojin_tv_clean_op_01,0,364)
shingeki_no_kyojin_tv_clean_op_01_02=Trim(shingeki_no_kyojin_tv_clean_op_01,365,871)
shingeki_no_kyojin_tv_clean_op_01_03=Trim(shingeki_no_kyojin_tv_clean_op_01,872,1127)
shingeki_no_kyojin_tv_clean_op_01_04=Trim(shingeki_no_kyojin_tv_clean_op_01,1128,2093)
shingeki_no_kyojin_tv_clean_op_01_05=Trim(shingeki_no_kyojin_tv_clean_op_01,2094,0)

shingeki_no_kyojin_tv_clean_ed_01_01=Trim(shingeki_no_kyojin_tv_clean_ed_01,0,1538)
shingeki_no_kyojin_tv_clean_ed_01_02=Trim(shingeki_no_kyojin_tv_clean_ed_01,1539,1666)
shingeki_no_kyojin_tv_clean_ed_01_03=Trim(shingeki_no_kyojin_tv_clean_ed_01,1667,1952)
shingeki_no_kyojin_tv_clean_ed_01_04=Trim(shingeki_no_kyojin_tv_clean_ed_01,1953,0)



shingeki_no_kyojin_tv_01_survey_corps_attack_kyojin_01=Trim(shingeki_no_kyojin_tv_01,2446,2574) #129 op1
shingeki_no_kyojin_tv_01_survey_corps_attack_kyojin_02=Trim(shingeki_no_kyojin_tv_01,2575,2677) #102 op1

shingeki_no_kyojin_tv_01_field_01=Trim(shingeki_no_kyojin_tv_01,5651,5763) #113
shingeki_no_kyojin_tv_01_mikasa_watch_eren=Trim(shingeki_no_kyojin_tv_01,5824,5895) #72
shingeki_no_kyojin_tv_01_field_02=Trim(shingeki_no_kyojin_tv_01,5896,6387) #492
shingeki_no_kyojin_tv_01_mikasa_pick_wood=Trim(shingeki_no_kyojin_tv_01,6490,6633) #144 op1
shingeki_no_kyojin_tv_01_people_01=Trim(shingeki_no_kyojin_tv_01,7087,7302) #216 ed1
shingeki_no_kyojin_tv_01_eren_and_mikasa_walk_back_to_shiganshina=Trim(shingeki_no_kyojin_tv_01,7399,7554) #156
shingeki_no_kyojin_tv_01_people_02=Trim(shingeki_no_kyojin_tv_01,9520,9780) #261 ed1
shingeki_no_kyojin_tv_01_shiganshina=Trim(shingeki_no_kyojin_tv_01,11726,11824) #66
shingeki_no_kyojin_tv_01_mikasa_throw_eren=Trim(shingeki_no_kyojin_tv_01,17224,17327) #104
shingeki_no_kyojin_tv_01_grisha_and_carla=Trim(shingeki_no_kyojin_tv_01,18325,18392) #68 ed1
shingeki_no_kyojin_tv_01_jaeger_family_01=Trim(shingeki_no_kyojin_tv_01,18440,18582) #143 ed1
shingeki_no_kyojin_tv_01_jaeger_family_02=Trim(shingeki_no_kyojin_tv_01,18927,19113) #187 ed1
shingeki_no_kyojin_tv_01_grisha_s_key_01=Trim(shingeki_no_kyojin_tv_01,20764,20826) #63
shingeki_no_kyojin_tv_01_grisha_s_key_02=Trim(shingeki_no_kyojin_tv_01,20886,20964) #79 op1

shingeki_no_kyojin_tv_01_armin_catched_01=Trim(shingeki_no_kyojin_tv_01,21763,21864) #102
shingeki_no_kyojin_tv_01_armin_catched_02=Trim(shingeki_no_kyojin_tv_01,22009,22156) #148

shingeki_no_kyojin_tv_01_eren_dash=Trim(shingeki_no_kyojin_tv_01,22414,22445) #32
shingeki_no_kyojin_tv_01_mikasa_dash=Trim(shingeki_no_kyojin_tv_01,22581,22642) #62

shingeki_no_kyojin_tv_01_armin_stare_blankly=Trim(shingeki_no_kyojin_tv_01,23071,23146) #76
shingeki_no_kyojin_tv_01_armin_talk=Trim(shingeki_no_kyojin_tv_01,23926,24066) #141
shingeki_no_kyojin_tv_01_eren_mikasa_armin=Trim(shingeki_no_kyojin_tv_01,24731,24869) #139 ed1

shingeki_no_kyojin_tv_01_armin_run_away=Trim(shingeki_no_kyojin_tv_01,25815,25928) #114
shingeki_no_kyojin_tv_01_eren_watch_chou_oogata_kyojin=Trim(shingeki_no_kyojin_tv_01,26094,26230) #137
shingeki_no_kyojin_tv_01_chou_oogata_kyojin_appear=Trim(shingeki_no_kyojin_tv_01,26598,26704) #107 op1
shingeki_no_kyojin_tv_01_chou_oogata_kyojin_outside_wall_maria=Trim(shingeki_no_kyojin_tv_01,27529,27672) #144 ed1

shingeki_no_kyojin_tv_01_eren_run_01=Trim(shingeki_no_kyojin_tv_01,28870,28977) #108
shingeki_no_kyojin_tv_01_eren_run_02=Trim(shingeki_no_kyojin_tv_01,29024,29116) #93
shingeki_no_kyojin_tv_01_carla_angry=Trim(shingeki_no_kyojin_tv_01,30442,30508) #67
shingeki_no_kyojin_tv_01_carla_cry=Trim(shingeki_no_kyojin_tv_01,32016,32085) #70 ed1
shingeki_no_kyojin_tv_01_hannes_take_eren_and_mikasa_away=Trim(shingeki_no_kyojin_tv_01,32086,32165) #80
shingeki_no_kyojin_tv_01_eren_no=Trim(shingeki_no_kyojin_tv_01,32747,32840) #94 ed1
shingeki_no_kyojin_tv_01_kyojin_eat_carla=Trim(shingeki_no_kyojin_tv_01,33408,33455) #48 ed1
shingeki_no_kyojin_tv_01_blood_rain=Trim(shingeki_no_kyojin_tv_01,33456,33523) #68 ed1

shingeki_no_kyojin_tv_01_info_01=Trim(shingeki_no_kyojin_tv_01,17958,18050)
shingeki_no_kyojin_tv_01_info_02=Trim(shingeki_no_kyojin_tv_01,18051,18144)
shingeki_no_kyojin_tv_01_cm_chou_oogata_kyojin_open_door=Trim(shingeki_no_kyojin_tv_01,25929,27528)
shingeki_no_kyojin_tv_01_cm_eren_dont_listen=Trim(shingeki_no_kyojin_tv_01,30358,30813)
shingeki_no_kyojin_tv_01_cm_cruel_world=Trim(shingeki_no_kyojin_tv_01,31223,34324)

shingeki_no_kyojin_tv_01_cm_next_01=Trim(shingeki_no_kyojin_tv_01,34325,34368)
shingeki_no_kyojin_tv_01_cm_next_02=Trim(shingeki_no_kyojin_tv_01,34369,34620) #252
shingeki_no_kyojin_tv_01_cm_next_03=Trim(shingeki_no_kyojin_tv_01,34621,34680)

shingeki_no_kyojin_tv_02_kyojin_history=Trim(shingeki_no_kyojin_tv_02,0,1019) #1020 ed1
shingeki_no_kyojin_tv_02_shiganshina_broken_01=Trim(shingeki_no_kyojin_tv_02,3643,3729) #87
shingeki_no_kyojin_tv_02_eren_punch_hannes=Trim(shingeki_no_kyojin_tv_02,6393,6437) #45
shingeki_no_kyojin_tv_02_shiganshina_broken_02=Trim(shingeki_no_kyojin_tv_02,7307,7516) #210 op1
shingeki_no_kyojin_tv_02_yoroi_no_kyojin_dash_01=Trim(shingeki_no_kyojin_tv_02,13526,13595) #70 ed1
shingeki_no_kyojin_tv_02_yoroi_no_kyojin_dash_02=Trim(shingeki_no_kyojin_tv_02,13843,13938) #96
shingeki_no_kyojin_tv_02_yoroi_no_kyojin_close_army=Trim(shingeki_no_kyojin_tv_02,14132,14203) #72 ed1
shingeki_no_kyojin_tv_02_yoroi_no_kyojin_dash_03=Trim(shingeki_no_kyojin_tv_02,14354,14427) #74
shingeki_no_kyojin_tv_02_yoroi_no_kyojin_crash_wall_maria_01=Trim(shingeki_no_kyojin_tv_02,14459,14498) #40 op1
shingeki_no_kyojin_tv_02_yoroi_no_kyojin_crash_wall_maria_02=Trim(shingeki_no_kyojin_tv_02,14499,14570) #72 ed1
shingeki_no_kyojin_tv_02_eren_angry=Trim(shingeki_no_kyojin_tv_02,19298,19352) #55

shingeki_no_kyojin_tv_02_kyojin_medicine_01=Trim(shingeki_no_kyojin_tv_02,20503,20579)
shingeki_no_kyojin_tv_02_kyojin_medicine_02=Trim(shingeki_no_kyojin_tv_02,20740,20785)
shingeki_no_kyojin_tv_02_kyojin_medicine_03=Trim(shingeki_no_kyojin_tv_02,20849,20949)
shingeki_no_kyojin_tv_02_kyojin_medicine_04=Trim(shingeki_no_kyojin_tv_02,20983,21015)
shingeki_no_kyojin_tv_02_kyojin_medicine_05=Trim(shingeki_no_kyojin_tv_02,21031,21048)
shingeki_no_kyojin_tv_02_kyojin_medicine_06=Trim(shingeki_no_kyojin_tv_02,21057,21079)
shingeki_no_kyojin_tv_02_kyojin_medicine_07=Trim(shingeki_no_kyojin_tv_02,21088,21094)
shingeki_no_kyojin_tv_02_kyojin_medicine=shingeki_no_kyojin_tv_02_kyojin_medicine_01+shingeki_no_kyojin_tv_02_kyojin_medicine_02+shingeki_no_kyojin_tv_02_kyojin_medicine_03 #224 ed1

shingeki_no_kyojin_tv_02_the_key_01=Trim(shingeki_no_kyojin_tv_02,20820,20848) #29
shingeki_no_kyojin_tv_02_the_key_02=Trim(shingeki_no_kyojin_tv_02,20950,20970) #21
shingeki_no_kyojin_tv_02_the_key_fall=Trim(shingeki_no_kyojin_tv_02,21130,21169) #40 ed1
shingeki_no_kyojin_tv_02_eren_found_the_key_01=Trim(shingeki_no_kyojin_tv_02,21678,21736) #59
shingeki_no_kyojin_tv_02_eren_found_the_key_02=Trim(shingeki_no_kyojin_tv_02,21857,21961) #105
shingeki_no_kyojin_tv_02_mikasa_punch_eren=Trim(shingeki_no_kyojin_tv_02,26392,26465) #74

shingeki_no_kyojin_tv_02_mikasa_push_bread_to_eren_mouth_01=Trim(shingeki_no_kyojin_tv_02,27453,27496) #44
shingeki_no_kyojin_tv_02_mikasa_push_bread_to_eren_mouth_02=Trim(shingeki_no_kyojin_tv_02,27528,27622) #95
shingeki_no_kyojin_tv_02_mikasa_push_bread_to_eren_mouth_03=Trim(shingeki_no_kyojin_tv_02,27623,27777) #155
shingeki_no_kyojin_tv_02_mikasa_push_bread_to_eren_mouth=shingeki_no_kyojin_tv_02_mikasa_push_bread_to_eren_mouth_01+shingeki_no_kyojin_tv_02_mikasa_push_bread_to_eren_mouth_02+shingeki_no_kyojin_tv_02_mikasa_push_bread_to_eren_mouth_03 #294 ed1
shingeki_no_kyojin_tv_02_cm_mikasa_push_bread_to_eren_mouth=Trim(shingeki_no_kyojin_tv_02,27453,27777)

shingeki_no_kyojin_tv_02_eren_mikasa_armin_farmimg=Trim(shingeki_no_kyojin_tv_02,28037,28159) #123 ed1

shingeki_no_kyojin_tv_02_armin_grandfather_leave_01=Trim(shingeki_no_kyojin_tv_02,28396,28448) #53
shingeki_no_kyojin_tv_02_armin_grandfather_leave_02=Trim(shingeki_no_kyojin_tv_02,28449,28561) #113
shingeki_no_kyojin_tv_02_armin_grandfather_leave=shingeki_no_kyojin_tv_02_armin_grandfather_leave_01+shingeki_no_kyojin_tv_02_armin_grandfather_leave_02 #166 ed1

shingeki_no_kyojin_tv_02_resist_failed=Trim(shingeki_no_kyojin_tv_02,28818,28892) #75 ed1
shingeki_no_kyojin_tv_02_kyojin_conquer_field=Trim(shingeki_no_kyojin_tv_02,28893,29121) #229 op1

shingeki_no_kyojin_tv_03_sasha_run=Trim(shingeki_no_kyojin_tv_03,8171,8355) #185 op1
shingeki_no_kyojin_tv_03_sasha_starve_01=Trim(shingeki_no_kyojin_tv_03,14674,14750) #77 op1
shingeki_no_kyojin_tv_03_sasha_starve_02=Trim(shingeki_no_kyojin_tv_03,14751,14781) #31 op1
shingeki_no_kyojin_tv_03_sasha_starve_03=Trim(shingeki_no_kyojin_tv_03,14836,14890) #55 op1
shingeki_no_kyojin_tv_03_historia_as_godness=Trim(shingeki_no_kyojin_tv_03,15084,15223) #140 op1
shingeki_no_kyojin_tv_03_vertical_maneuvering_equipment_training=Trim(shingeki_no_kyojin_tv_03,17159,17254) #96 op1
shingeki_no_kyojin_tv_03_lake=Trim(shingeki_no_kyojin_tv_03,27560,27846) #287 ed1
shingeki_no_kyojin_tv_03_eren_dash=Trim(shingeki_no_kyojin_tv_03,31837,31964) #128 op1

shingeki_no_kyojin_tv_04_annie_and_bertolt_attack_training_01=Trim(shingeki_no_kyojin_tv_04,5123,5156) #34 op1
shingeki_no_kyojin_tv_04_annie_and_bertolt_attack_training_02=Trim(shingeki_no_kyojin_tv_04,5157,5206) #50 op1
shingeki_no_kyojin_tv_04_annie_fight_to_eren_01=Trim(shingeki_no_kyojin_tv_04,10542,10574) #33 op1
shingeki_no_kyojin_tv_04_annie_fight_to_eren_02=Trim(shingeki_no_kyojin_tv_04,10575,10635) #61 op1
shingeki_no_kyojin_tv_04_104th_corps_graduates_01=Trim(shingeki_no_kyojin_tv_04,19714,19941) #228
shingeki_no_kyojin_tv_04_104th_corps_graduates_02=Trim(shingeki_no_kyojin_tv_04,19942,20001) #60
shingeki_no_kyojin_tv_04_104th_corps_graduates=shingeki_no_kyojin_tv_04_104th_corps_graduates_01+shingeki_no_kyojin_tv_04_104th_corps_graduates_02 #288 ed1
shingeki_no_kyojin_tv_04_chou_oogata_kyojin_appear_behind_eren=Trim(shingeki_no_kyojin_tv_04,29795,29845) #51 op1
shingeki_no_kyojin_tv_04_eren_falling=Trim(shingeki_no_kyojin_tv_04,30273,30372) #100 op1
shingeki_no_kyojin_tv_04_sasha_dash_downward_01=Trim(shingeki_no_kyojin_tv_04,30547,30578) #32 op1
shingeki_no_kyojin_tv_04_sasha_dash_downward_02=Trim(shingeki_no_kyojin_tv_04,30579,30668) #90 op1
shingeki_no_kyojin_tv_04_sasha_dash_downward_03=Trim(shingeki_no_kyojin_tv_04,30669,30689) #21
shingeki_no_kyojin_tv_04_eren_dash_around_01=Trim(shingeki_no_kyojin_tv_04,31725,31814) #90 op1
shingeki_no_kyojin_tv_04_eren_dash_around_02=Trim(shingeki_no_kyojin_tv_04,31815,31893) #79 op1
shingeki_no_kyojin_tv_04_eren_watch_chou_oogata_kyojin=Trim(shingeki_no_kyojin_tv_04,31986,32173) #188 op1

shingeki_no_kyojin_tv_05_chou_oogata_kyojin_smash=Trim(shingeki_no_kyojin_tv_05,3655,3764) #110
shingeki_no_kyojin_tv_05_eren_evade_chou_oogata_kyojin=Trim(shingeki_no_kyojin_tv_05,3927,4052) #126 op1
shingeki_no_kyojin_tv_05_eren_mikasa_armin_in_class=Trim(shingeki_no_kyojin_tv_05,20210,20571) #362 ed1
shingeki_no_kyojin_tv_05_soldiers_moving_forward=Trim(shingeki_no_kyojin_tv_05,24657,24820) #164 op1
shingeki_no_kyojin_tv_05_eren_angry_dash=Trim(shingeki_no_kyojin_tv_05,26587,26845) #259 op1
shingeki_no_kyojin_tv_05_soldiers_are_catched=Trim(shingeki_no_kyojin_tv_05,27111,27155) #45

shingeki_no_kyojin_tv_06_yumir_lean_on_historia=Trim(shingeki_no_kyojin_tv_06,4209,4412) #204 op1
shingeki_no_kyojin_tv_06_mikasa_salute=Trim(shingeki_no_kyojin_tv_06,13280,13457) #178
shingeki_no_kyojin_tv_06_mikasa_family_01=Trim(shingeki_no_kyojin_tv_06,26617,26676) #60
shingeki_no_kyojin_tv_06_mikasa_family_02=Trim(shingeki_no_kyojin_tv_06,26677,26730) #54
shingeki_no_kyojin_tv_06_mikasa_family=shingeki_no_kyojin_tv_06_mikasa_family_01+shingeki_no_kyojin_tv_06_mikasa_family_02 #114 ed1

shingeki_no_kyojin_tv_07_mikasa_look_at_rain=Trim(shingeki_no_kyojin_tv_07,6613,6672) #60
shingeki_no_kyojin_tv_07_mikasa_attack=Trim(shingeki_no_kyojin_tv_07,17690,17899) #210 op1
shingeki_no_kyojin_tv_07_mikasa_iaido_01=Trim(shingeki_no_kyojin_tv_07,22483,22554) #72 op1
shingeki_no_kyojin_tv_07_mikasa_iaido_02=Trim(shingeki_no_kyojin_tv_07,22555,22601) #47 op1
shingeki_no_kyojin_tv_07_mikasa_iaido_03=Trim(shingeki_no_kyojin_tv_07,22602,22661) #60 op1
shingeki_no_kyojin_tv_07_cm_mikasa_iaido=Trim(shingeki_no_kyojin_tv_07,22027,22601) #575 cm1
shingeki_no_kyojin_tv_07_kyojin_eren_punch_kyojin_01=Trim(shingeki_no_kyojin_tv_07,25009,25186) #178 cm1
shingeki_no_kyojin_tv_07_kyojin_eren_step_kyojin_01=Trim(shingeki_no_kyojin_tv_07,25833,26173) #341 op1
shingeki_no_kyojin_tv_07_kyojin_eren_step_kyojin_02=Trim(shingeki_no_kyojin_tv_07,25174,26269) #96
shingeki_no_kyojin_tv_07_cm_kyojin_eren_punch_kyojin_02=Trim(shingeki_no_kyojin_tv_07,27934,28235) #301 cm1

shingeki_no_kyojin_tv_08_mikasa_dash_and_kill_kyojin=Trim(shingeki_no_kyojin_tv_08,8814,8982) #169
shingeki_no_kyojin_tv_08_jean_dash_01=Trim(shingeki_no_kyojin_tv_08,9441,9504) #64 op1
shingeki_no_kyojin_tv_08_jean_dash_02=Trim(shingeki_no_kyojin_tv_08,9505,9554) #50 op1
shingeki_no_kyojin_tv_08_jean_and_marco_evade=Trim(shingeki_no_kyojin_tv_08,10225,10294) #70
shingeki_no_kyojin_tv_08_jean_landing=Trim(shingeki_no_kyojin_tv_08,10557,10636) #80 op1
shingeki_no_kyojin_tv_08_kyojin_eren_punch_kyojin_near_jean=Trim(shingeki_no_kyojin_tv_08,13338,13387) #50
shingeki_no_kyojin_tv_08_kyojin_eren_punch_kyojin_01=Trim(shingeki_no_kyojin_tv_08,14771,14823) #53
shingeki_no_kyojin_tv_08_kyojin_eren_punch_kyojin_02=Trim(shingeki_no_kyojin_tv_08,14824,14937) #114
shingeki_no_kyojin_tv_08_kyojin_eren_wrest_kyojin_01=Trim(shingeki_no_kyojin_tv_08,15315,15422) #108
shingeki_no_kyojin_tv_08_kyojin_eren_wrest_kyojin_02=Trim(shingeki_no_kyojin_tv_08,15423,15443) #32
shingeki_no_kyojin_tv_08_kyojin_eren_wrest_kyojin_03=Trim(shingeki_no_kyojin_tv_08,15444,15501) #58
shingeki_no_kyojin_tv_08_elevator=Trim(shingeki_no_kyojin_tv_08,20425,20496) #72 op1
shingeki_no_kyojin_tv_08_ready_01=Trim(shingeki_no_kyojin_tv_08,21294,21358) #65 op1
shingeki_no_kyojin_tv_08_ready_02=Trim(shingeki_no_kyojin_tv_08,21359,21421) #63 op1
shingeki_no_kyojin_tv_08_everyone_attack=Trim(shingeki_no_kyojin_tv_08,22031,22197) #167
shingeki_no_kyojin_tv_08_kyojin_eren_angry=Trim(shingeki_no_kyojin_tv_08,27294,27377) #84
shingeki_no_kyojin_tv_08_eren_rebirth=Trim(shingeki_no_kyojin_tv_08,28879,29030) #152 op1
shingeki_no_kyojin_tv_08_armin_s_fingers_lace_with_eren_01=Trim(shingeki_no_kyojin_tv_08,31589,31681) #93
shingeki_no_kyojin_tv_08_armin_s_fingers_lace_with_eren_02=Trim(shingeki_no_kyojin_tv_08,31682,31741) #60

shingeki_no_kyojin_tv_09_levi_kill_kyojin_01=Trim(shingeki_no_kyojin_tv_09,6369,6417) #49 op1
shingeki_no_kyojin_tv_09_hanji_dash=Trim(shingeki_no_kyojin_tv_09,7071,7125) #55 op1
shingeki_no_kyojin_tv_09_hanji_evade=Trim(shingeki_no_kyojin_tv_09,7408,7479) #72 op1
shingeki_no_kyojin_tv_09_levi_kill_kyojin_02=Trim(shingeki_no_kyojin_tv_09,7943,8014) #72 op1
shingeki_no_kyojin_tv_09_eren_mad_01=Trim(shingeki_no_kyojin_tv_09,16520,16555) #36 op1
shingeki_no_kyojin_tv_09_eren_mad_02=Trim(shingeki_no_kyojin_tv_09,16556,16639) #84 op1
shingeki_no_kyojin_tv_09_eren_mad=shingeki_no_kyojin_tv_09_eren_mad_01+shingeki_no_kyojin_tv_09_eren_mad_02 #120

shingeki_no_kyojin_tv_10_eren_get_out_from_kyojin=Trim(shingeki_no_kyojin_tv_10,8250,8345) #96
shingeki_no_kyojin_tv_10_eren_watch_his_kyojin=Trim(shingeki_no_kyojin_tv_10_cache02,10034,10165) #132 op1
shingeki_no_kyojin_tv_10_armin_thinking_about_eren=Trim(shingeki_no_kyojin_tv_10,16361,16451) #111
shingeki_no_kyojin_tv_10_armin_devote_his_life_to_human_01=Trim(shingeki_no_kyojin_tv_10,23941,24123) #183 op1
shingeki_no_kyojin_tv_10_armin_devote_his_life_to_human_02=Trim(shingeki_no_kyojin_tv_10,24547,24635) #89
shingeki_no_kyojin_tv_10_dot_pixis_talking_01=Trim(shingeki_no_kyojin_tv_10,27198,27429) #232 op1
shingeki_no_kyojin_tv_10_dot_pixis_talking_02=Trim(shingeki_no_kyojin_tv_10,30283,30370) #88

shingeki_no_kyojin_tv_11_eren_dash_01=Trim(shingeki_no_kyojin_tv_11,30446,30871) #426 op1
shingeki_no_kyojin_tv_11_eren_dash_02=Trim(shingeki_no_kyojin_tv_11,30872,30875) #4
shingeki_no_kyojin_tv_11_kyojin_eren_punch_mikasa=Trim(shingeki_no_kyojin_tv_11,32051,32098) #48

shingeki_no_kyojin_tv_12_rico_angry=Trim(shingeki_no_kyojin_tv_12,14690,14834) #145 op1
shingeki_no_kyojin_tv_12_armin_cut_kyojin_eren=Trim(shingeki_no_kyojin_tv_12,23267,23418) #152 op1
shingeki_no_kyojin_tv_12_annie_jean_connie_run_away=Trim(shingeki_no_kyojin_tv_12,26282,26358) #77 op1

shingeki_no_kyojin_tv_13_jean_dash=Trim(shingeki_no_kyojin_tv_13,10651,10824) #174
shingeki_no_kyojin_tv_13_kyojin_eren_move_stone_01=Trim(shingeki_no_kyojin_tv_13,11605,11670) #66 op1
shingeki_no_kyojin_tv_13_kyojin_eren_move_stone_02=Trim(shingeki_no_kyojin_tv_13,11671,11787) #117 op1
shingeki_no_kyojin_tv_13_kyojin_eren_move_stone_03=Trim(shingeki_no_kyojin_tv_13,11788,11907) #120 op1
shingeki_no_kyojin_tv_13_mikasa_help_kyojin_eren_move_stone_04=Trim(shingeki_no_kyojin_tv_13,17487,17570) #87 op1
shingeki_no_kyojin_tv_13_kyojin_eren_move_stone_05=Trim(shingeki_no_kyojin_tv_13,17571,17630) #60
shingeki_no_kyojin_tv_13_kyojin_eren_move_stone_06=Trim(shingeki_no_kyojin_tv_13,17631,17702) #72
shingeki_no_kyojin_tv_13_armin_ask_kyojin_eren_move_stone=Trim(shingeki_no_kyojin_tv_13,17703,17951) #249 op1
shingeki_no_kyojin_tv_13_annie_regret=Trim(shingeki_no_kyojin_tv_13,26950,27078) # 129 op1
