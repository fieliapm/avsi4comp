Import("macro.avsi")

SetMemoryMax(64)

######## BD (1080P) ########

yuruyuri_season_02_tv_01=FFMS2_VIDEO_SOURCE("src\anime\ゆるゆり♪♪ 第01話 「帰ってきた主人公」 (TX 1280x720 x264 AAC 10bit).mp4")
yuruyuri_season_02_tv_02=FFMS2_VIDEO_SOURCE("src\anime\ゆるゆり♪♪ 第02話 「ゆるゆりなる日々なるなり」 (TX 1280x720 x264 AAC 10bit).mp4")
yuruyuri_season_02_tv_03=FFMS2_VIDEO_SOURCE("src\anime\ゆるゆり♪♪ 第03話 「チョコと涙と女と女と磯辺揚げ」 (TX 1280x720 x264 AAC 10bit).mp4")
yuruyuri_season_02_tv_04=FFMS2_VIDEO_SOURCE("src\anime\ゆるゆり♪♪ 第04話 「ひっちゅ」 (TX 1280x720 x264 AAC 10bit).mp4")
yuruyuri_season_02_tv_05=FFMS2_VIDEO_SOURCE("src\anime\ゆるゆり♪♪ 第05話 「日本の夏 ゆるめの夏」 (TX 1280x720 x264 AAC 10bit).mp4")
yuruyuri_season_02_tv_06=FFMS2_VIDEO_SOURCE("src\anime\ゆるゆり♪♪ 第06話 「【速報】ゆるゆり完売」 (TX 1280x720 x264 AAC 10bit).mp4")
yuruyuri_season_02_tv_07=FFMS2_VIDEO_SOURCE("src\anime\ゆるゆり♪♪ 第07話 「姉妹事情あれこれそれどれ」 (TX 1280x720 x264 AAC 10bit).mp4")
yuruyuri_season_02_tv_08=FFMS2_VIDEO_SOURCE("src\anime\ゆるゆり♪♪ 第08話 「ちなつ無双」 (TX 1280x720 x264 AAC 10bit).mp4")
yuruyuri_season_02_tv_09=FFMS2_VIDEO_SOURCE("src\anime\ゆるゆり♪♪ 第09話 「何かありそうで何もなさそうな日」 (TX 1280x720 x264 AAC 10bit).mp4")
yuruyuri_season_02_tv_10=FFMS2_VIDEO_SOURCE("src\anime\ゆるゆり♪♪ 第10話 「修学旅行R」 (TX 1280x720 x264 AAC 10bit).mp4")
yuruyuri_season_02_tv_11=FFMS2_VIDEO_SOURCE("src\anime\ゆるゆり♪♪ 第11話 「時をかけるあかり」 (TX 1280x720 x264 AAC 10bit).mp4")
yuruyuri_season_02_tv_12=FFMS2_VIDEO_SOURCE("src\anime\ゆるゆり♪♪ 第12話 「さようなら主人公、また会う日まで」 (TX 1280x720 x264 AAC 10bit).mp4")



yuruyuri_season_02_tv_clean_op=Trim(yuruyuri_season_02_tv_01,623,2780)

yuruyuri_season_02_tv_clean_op_part01=Trim(yuruyuri_season_02_tv_clean_op,0,1073)
yuruyuri_season_02_tv_clean_op_part02=Trim(yuruyuri_season_02_tv_clean_op,1074,1368)
yuruyuri_season_02_tv_clean_op_part03=Trim(yuruyuri_season_02_tv_clean_op,1369,1949)
yuruyuri_season_02_tv_clean_op_part04=Trim(yuruyuri_season_02_tv_clean_op,1950,2085)
yuruyuri_season_02_tv_clean_op_part05=Trim(yuruyuri_season_02_tv_clean_op,2086,0)



yui_tenkousei_mute=ImageSource("src/main.jpg",start=0,end=300,fps=Framerate(yuruyuri_season_02_tv_clean_op))



yuruyuri_season_02_tv_01_akari_title_call=Trim(yuruyuri_season_02_tv_01,0,622)
yuruyuri_season_02_tv_01_akari_back=Trim(yuruyuri_season_02_tv_01,3021,3138)
yuruyuri_season_02_tv_01_akari_kawaii=Trim(yuruyuri_season_02_tv_01,4893,5021) #
yuruyuri_season_02_tv_01_akari_handsome=Trim(yuruyuri_season_02_tv_01,7735,7809)
yuruyuri_season_02_tv_01_akkariin=Trim(yuruyuri_season_02_tv_01,10647,10899)
yuruyuri_season_02_tv_01_magical_girl_akari=Trim(yuruyuri_season_02_tv_01,12556,12681)
yuruyuri_season_02_tv_01_akari_god=Trim(yuruyuri_season_02_tv_01,14108,14225)

yuruyuri_season_02_tv_01_mirakurun_anime=Trim(yuruyuri_season_02_tv_01,27042,29842)

yuruyuri_season_02_tv_02_eat_crab=Trim(yuruyuri_season_02_tv_02,4001,4090)
yuruyuri_season_02_tv_02_kyouko_play_morra=Trim(yuruyuri_season_02_tv_02,5942,6020) #
yuruyuri_season_02_tv_02_chinatsu_idol=Trim(yuruyuri_season_02_tv_02,12597,12818)
yuruyuri_season_02_tv_02_kyouko_grab_snake=Trim(yuruyuri_season_02_tv_02,19754,19945) #
yuruyuri_season_02_tv_02_sakurako_ready=Trim(yuruyuri_season_02_tv_02,20675,20884)

yuruyuri_season_02_tv_03_sakurako_grimace=Trim(yuruyuri_season_02_tv_03,7018,7053) #
yuruyuri_season_02_tv_03_akari_tell_lame_joke=Trim(yuruyuri_season_02_tv_03,9311,9376) #
yuruyuri_season_02_tv_03_chinatsu_love_himawari=Trim(yuruyuri_season_02_tv_03,21545,21586)
yuruyuri_season_02_tv_03_scarf_made_by_chinatsu=Trim(yuruyuri_season_02_tv_03,25575,25902)
yuruyuri_season_02_tv_03_chitose_kiss_chiduru=Trim(yuruyuri_season_02_tv_03,31492,31659)
yuruyuri_season_02_tv_03_akane_give_chocolate_to_akari=Trim(yuruyuri_season_02_tv_03,32045,32129) #

yuruyuri_season_02_tv_04_yui_prevent_from_hay_fever=Trim(yuruyuri_season_02_tv_04,4640,4792)
yuruyuri_season_02_tv_04_ayano_wear_gas_mask=Trim(yuruyuri_season_02_tv_04,7776,7912)
yuruyuri_season_02_tv_04_sakurako_shoot=Trim(yuruyuri_season_02_tv_04,9360,9442) #
yuruyuri_season_02_tv_04_himawari_shoot=Trim(yuruyuri_season_02_tv_04,9771,9818)
yuruyuri_season_02_tv_04_sakurako_maid=Trim(yuruyuri_season_02_tv_04,10499,10795) #
yuruyuri_season_02_tv_04_ayano_s_purin=Trim(yuruyuri_season_02_tv_04,13049,13256) #
yuruyuri_season_02_tv_04_nana_bring_rise=Trim(yuruyuri_season_02_tv_04,17681,17734) #
yuruyuri_season_02_tv_04_nana_and_her_machine_dog=Trim(yuruyuri_season_02_tv_04,21364,21525) #
yuruyuri_season_02_tv_04_akari_s_hair_are_teru_teru_bozu=Trim(yuruyuri_season_02_tv_04,24735,24929)

yuruyuri_season_02_tv_05_kyouko_ponytail=Trim(yuruyuri_season_02_tv_05,3624,3899) #
yuruyuri_season_02_tv_05_nanamori_quest_2=Trim(yuruyuri_season_02_tv_05,6060,6131)
yuruyuri_season_02_tv_05_kyouko_in_front_of_fan=Trim(yuruyuri_season_02_tv_05,7229,7324)
yuruyuri_season_02_tv_05_kyouko_sleep_on_chinatsu_leg=Trim(yuruyuri_season_02_tv_05,7325,7384)
yuruyuri_season_02_tv_05_akari_s_hair_has_bug=Trim(yuruyuri_season_02_tv_05,9599,9733)
yuruyuri_season_02_tv_05_akari_miss_train=Trim(yuruyuri_season_02_tv_05,11626,11673)
yuruyuri_season_02_tv_05_akari_use_mobilephone=Trim(yuruyuri_season_02_tv_05,12988,13566)
yuruyuri_season_02_tv_05_yui_play_rpg=Trim(yuruyuri_season_02_tv_05,21499,22815) #
yuruyuri_season_02_tv_05_yui_play_pzg=Trim(yuruyuri_season_02_tv_05,22864,23115) #
yuruyuri_season_02_tv_05_kaede_moe=Trim(yuruyuri_season_02_tv_05,31516,31749)

yuruyuri_season_02_tv_06_mirakurun_anime_op=Trim(yuruyuri_season_02_tv_06,554,2711)
yuruyuri_season_02_tv_06_mirakurun_anime=Trim(yuruyuri_season_02_tv_06,2949,10022)

yuruyuri_season_02_tv_06_comike=Trim(yuruyuri_season_02_tv_06,10371,10464)
yuruyuri_season_02_tv_06_ayano_ready=Trim(yuruyuri_season_02_tv_06,11829,11895)
yuruyuri_season_02_tv_06_yui_angry=Trim(yuruyuri_season_02_tv_06,12776,12916)
yuruyuri_season_02_tv_06_chitose_happy=Trim(yuruyuri_season_02_tv_06,15736,15864)
yuruyuri_season_02_tv_06_kyouko_cosplay_moe_rivalun=Trim(yuruyuri_season_02_tv_06,16734,16973)
yuruyuri_season_02_tv_06_akari_cosplay_ganbo=Trim(yuruyuri_season_02_tv_06,17896,17979)
yuruyuri_season_02_tv_06_akari_cosplay_ganbo_with_hair_dumpling=Trim(yuruyuri_season_02_tv_06,18020,18090) #
yuruyuri_season_02_tv_06_chinatsu_imitate_mirakurun_pose=Trim(yuruyuri_season_02_tv_06,18855,18985) #
yuruyuri_season_02_tv_06_chitose_buy_mirakurun_doujinshi_for_kyouko=Trim(yuruyuri_season_02_tv_06,20519,20599)
yuruyuri_season_02_tv_06_kyouko_hate_music_notation=Trim(yuruyuri_season_02_tv_06,26201,26433)
yuruyuri_season_02_tv_06_chinatsu_ero_talk=Trim(yuruyuri_season_02_tv_06,28382,28543) #
yuruyuri_season_02_tv_06_chinatsu_vampire=Trim(yuruyuri_season_02_tv_06,30034,30127) #

yuruyuri_season_02_tv_07_nadesiko_and_hanako=Trim(yuruyuri_season_02_tv_07,4299,4373) #
yuruyuri_season_02_tv_07_hanako=Trim(yuruyuri_season_02_tv_07,4770,4852)
yuruyuri_season_02_tv_07_nadesiko_dogeza=Trim(yuruyuri_season_02_tv_07,4988,5065) #
yuruyuri_season_02_tv_07_himawari_and_kaede=Trim(yuruyuri_season_02_tv_07,5852,6103) #
yuruyuri_season_02_tv_07_himawari_cannot_wear_bra=Trim(yuruyuri_season_02_tv_07,6305,6418) #
yuruyuri_season_02_tv_07_chiduru_rolling=Trim(yuruyuri_season_02_tv_07,7904,8104) #
yuruyuri_season_02_tv_07_ayano_and_chitose_running=Trim(yuruyuri_season_02_tv_07,9604,9780)
yuruyuri_season_02_tv_07_chiduru_drooling=Trim(yuruyuri_season_02_tv_07,11884,12052)
yuruyuri_season_02_tv_07_yui_and_mari_playing_game=Trim(yuruyuri_season_02_tv_07,15576,15887) #
yuruyuri_season_02_tv_07_nanamori_quest_2=Trim(yuruyuri_season_02_tv_07,16115,16207)
yuruyuri_season_02_tv_07_sakurako_cosplay_fat=Trim(yuruyuri_season_02_tv_07,17885,17968)
yuruyuri_season_02_tv_07_akari_super_saiyazin=Trim(yuruyuri_season_02_tv_07,18979,19212) #
yuruyuri_season_02_tv_07_himawari_sit_ball=Trim(yuruyuri_season_02_tv_07,19948,20000)
yuruyuri_season_02_tv_07_broken_sakurako=Trim(yuruyuri_season_02_tv_07,25702,25845)
yuruyuri_season_02_tv_07_akane_title_call=Trim(yuruyuri_season_02_tv_07,26020,26229)
yuruyuri_season_02_tv_07_tomoko_climax=Trim(yuruyuri_season_02_tv_07,27220,27931) #
yuruyuri_season_02_tv_07_akane_beautiful_back=Trim(yuruyuri_season_02_tv_07,28899,29063)
yuruyuri_season_02_tv_07_sister_complex_akane_01=Trim(yuruyuri_season_02_tv_07,31190,31309) #
yuruyuri_season_02_tv_07_sister_complex_akane_02=Trim(yuruyuri_season_02_tv_07,31576,31617)
yuruyuri_season_02_tv_07_akane_tea_time=Trim(yuruyuri_season_02_tv_07,31710,31817)

yuruyuri_season_02_tv_08_chinatsu_singing_01=Trim(yuruyuri_season_02_tv_08,5016,5202)
yuruyuri_season_02_tv_08_chinatsu_shy=Trim(yuruyuri_season_02_tv_08,8321,8437)
yuruyuri_season_02_tv_08_karaoke=Trim(yuruyuri_season_02_tv_08,10695,10734) #
yuruyuri_season_02_tv_08_yui_punch_kyouko=Trim(yuruyuri_season_02_tv_08,18658,18718)
yuruyuri_season_02_tv_08_kyouko_choke=Trim(yuruyuri_season_02_tv_08,20715,20825)
yuruyuri_season_02_tv_08_ayano_and_chitose_singing=Trim(yuruyuri_season_02_tv_08,21342,21531) #
yuruyuri_season_02_tv_08_yui_angry=Trim(yuruyuri_season_02_tv_08,22812,22880) #
yuruyuri_season_02_tv_08_chinatsu_singing_02=Trim(yuruyuri_season_02_tv_08,23203,23441)
yuruyuri_season_02_tv_08_chinatsu_grab_yui=Trim(yuruyuri_season_02_tv_08,28111,28210)
yuruyuri_season_02_tv_08_yui_get_hurt=Trim(yuruyuri_season_02_tv_08,29112,29231)
yuruyuri_season_02_tv_08_yui_hold_chinatsu_hand_01=Trim(yuruyuri_season_02_tv_08,29815,29870)
yuruyuri_season_02_tv_08_yui_hold_chinatsu_hand_02=Trim(yuruyuri_season_02_tv_08,31251,31434)

#yuruyuri_season_02_tv_08_ed

yuruyuri_season_02_tv_09_sakurako_plug_pen_in_akari_01=Trim(yuruyuri_season_02_tv_09,4790,4861)
yuruyuri_season_02_tv_09_sakurako_plug_pen_in_akari_02=Trim(yuruyuri_season_02_tv_09,4910,4981) #
yuruyuri_season_02_tv_09_sakurako_plug_pen_in_akari_03=Trim(yuruyuri_season_02_tv_09,5021,5071)
yuruyuri_season_02_tv_09_ribbon_akari=Trim(yuruyuri_season_02_tv_09,6065,6101)
yuruyuri_season_02_tv_09_sakurako_stand_on_her_head=Trim(yuruyuri_season_02_tv_09,7529,7714) #
yuruyuri_season_02_tv_09_chinatsu_angry=Trim(yuruyuri_season_02_tv_09,9015,9302)
yuruyuri_season_02_tv_09_sakurako_and_kyouko_become_friends=Trim(yuruyuri_season_02_tv_09,9942,10030)
yuruyuri_season_02_tv_09_chinatsu_get_out_of_closet_01=Trim(yuruyuri_season_02_tv_09,11491,11732)
yuruyuri_season_02_tv_09_chiinariin=Trim(yuruyuri_season_02_tv_09,14665,14977)
yuruyuri_season_02_tv_09_chinatsu_get_out_of_closet_02=Trim(yuruyuri_season_02_tv_09,15346,15558) #
yuruyuri_season_02_tv_09_kyouko_ghost_watch_chinatsu=Trim(yuruyuri_season_02_tv_09,21983,22144)
yuruyuri_season_02_tv_09_yui_prince_and_chinatsu_princess=Trim(yuruyuri_season_02_tv_09,22283,22753)
yuruyuri_season_02_tv_09_akane_hold_chinatsu=Trim(yuruyuri_season_02_tv_09,23068,23235)

yuruyuri_season_02_tv_10_sakurako_ask_himawari=Trim(yuruyuri_season_02_tv_10,9302,9581) #
yuruyuri_season_02_tv_10_sakurako_and_himawari_01=Trim(yuruyuri_season_02_tv_10,11474,11551)
yuruyuri_season_02_tv_10_little_sakurako_and_himawari=Trim(yuruyuri_season_02_tv_10,11552,11817)
yuruyuri_season_02_tv_10_sakurako_and_himawari_02=Trim(yuruyuri_season_02_tv_10,11552,11817)
yuruyuri_season_02_tv_10_akari_appear=Trim(yuruyuri_season_02_tv_10,11818,11907)
yuruyuri_season_02_tv_10_akari_explain_map=Trim(yuruyuri_season_02_tv_10,12798,12905)
yuruyuri_season_02_tv_10_chinatsu_become_frustrated_01=Trim(yuruyuri_season_02_tv_10,14498,14656)
yuruyuri_season_02_tv_10_chinatsu_become_frustrated_02=Trim(yuruyuri_season_02_tv_10,14756,14886)
yuruyuri_season_02_tv_10_chinatsu_cry=Trim(yuruyuri_season_02_tv_10,15819,16010)
yuruyuri_season_02_tv_10_chinatsu_jump=Trim(yuruyuri_season_02_tv_10,16065,16232)
yuruyuri_season_02_tv_10_chinatsu_angry=Trim(yuruyuri_season_02_tv_10,16794,16913)
yuruyuri_season_02_tv_10_akari_sleep_on_chinatsu_leg=Trim(yuruyuri_season_02_tv_10,18924,19066)
yuruyuri_season_02_tv_10_little_sakurako_and_himawari_married=Trim(yuruyuri_season_02_tv_10,28667,28792) #
yuruyuri_season_02_tv_10_chinatsu_give_akari_massage=Trim(yuruyuri_season_02_tv_10,31482,31661)

yuruyuri_season_02_tv_11_akari_time_traveling_01=Trim(yuruyuri_season_02_tv_11,3385,3576)
yuruyuri_season_02_tv_11_akari_time_traveling_02=Trim(yuruyuri_season_02_tv_11,3945,4222)
yuruyuri_season_02_tv_11_akari_time_traveling_03=Trim(yuruyuri_season_02_tv_11,4460,4598)
yuruyuri_season_02_tv_11_akane_climax_01=Trim(yuruyuri_season_02_tv_11,18625,18719)
yuruyuri_season_02_tv_11_akane_climax_02=Trim(yuruyuri_season_02_tv_11,18831,19014)
yuruyuri_season_02_tv_11_akane_pinch_01=Trim(yuruyuri_season_02_tv_11,19135,19191)
yuruyuri_season_02_tv_11_akane_pinch_02=Trim(yuruyuri_season_02_tv_11,19503,19775) #
yuruyuri_season_02_tv_11_akane_and_akari_sleep=Trim(yuruyuri_season_02_tv_11,20013,20148) #
yuruyuri_season_02_tv_11_akane_hug_akari=Trim(yuruyuri_season_02_tv_12,28473,28750)

#akari song
yuruyuri_season_02_tv_11_akari_s_song=Trim(yuruyuri_season_02_tv_11,22160,25091)

yuruyuri_season_02_tv_12_akari_is_angel=Trim(yuruyuri_season_02_tv_12,5650,6087)
yuruyuri_season_02_tv_12_chinatsu_hair_eat_ball_01=Trim(yuruyuri_season_02_tv_12,6967,7001)
yuruyuri_season_02_tv_12_chinatsu_hair_eat_ball_02=Trim(yuruyuri_season_02_tv_12,7002,7110)
yuruyuri_season_02_tv_12_chinatsu_hair_eat_ball_03=Trim(yuruyuri_season_02_tv_12,7111,7193)
yuruyuri_season_02_tv_12_chinatsu_hair_eat_ball_04=Trim(yuruyuri_season_02_tv_12,7194,7281) #
yuruyuri_season_02_tv_12_kyouko_sad=Trim(yuruyuri_season_02_tv_12,13481,13515)
yuruyuri_season_02_tv_12_chiduru_use_machine_gun_01=Trim(yuruyuri_season_02_tv_12,13850,13873)
yuruyuri_season_02_tv_12_chiduru_use_machine_gun_02=Trim(yuruyuri_season_02_tv_12,14117,14295) #
yuruyuri_season_02_tv_12_akari_kiss_robot=Trim(yuruyuri_season_02_tv_12,29183,29275) #
yuruyuri_season_02_tv_12_akari_go_on_stage=Trim(yuruyuri_season_02_tv_12,31160,31433) #
yuruyuri_season_02_tv_12_all_star=Trim(yuruyuri_season_02_tv_12,31554,31826)
yuruyuri_season_02_tv_12_bomb=Trim(yuruyuri_season_02_tv_12,32055,32126) #

######## Pre Combine (1080P) ########

#### Title Call ####

yuruyuri_season_02_tv_01_title_call_mtv_version=Normalize(yuruyuri_season_02_tv_07_akane_title_call)

######## Combine ########

# yuruyuri_season_02_tv_clean_op_part01 11
# yuruyuri_season_02_tv_clean_op_part02 3014
# yuruyuri_season_02_tv_clean_op_part03 4669
# yuruyuri_season_02_tv_clean_op_part04 5376
# yuruyuri_season_02_tv_clean_op_part04 5599

fade_length=12

yuruyuri_season_02_tv_op_t01=BlankClip(yuruyuri_season_02_tv_clean_op,length=11,color=color_black)+yuruyuri_season_02_tv_clean_op_part01

yuruyuri_season_02_tv_op_t02=TRIM_LAST_CLIP(yuruyuri_season_02_tv_01_akari_kawaii,115)+TRIM_MIDDLE_CLIP(yuruyuri_season_02_tv_04_nana_and_her_machine_dog,138)+TRIM_MIDDLE_CLIP(yuruyuri_season_02_tv_03_akari_tell_lame_joke,47) \
	+TRIM_MIDDLE_CLIP(yuruyuri_season_02_tv_05_kyouko_ponytail,135)+TRIM_MIDDLE_CLIP(yuruyuri_season_02_tv_06_chinatsu_imitate_mirakurun_pose,118) \
	+TRIM_MIDDLE_CLIP(yuruyuri_season_02_tv_02_kyouko_grab_snake,135)+TRIM_LAST_CLIP(yuruyuri_season_02_tv_09_chinatsu_get_out_of_closet_02,135+63)

yuruyuri_season_02_tv_op_t03=TRIM_FIRST_CLIP(yuruyuri_season_02_tv_05_yui_play_pzg,63+63)+Trim(yuruyuri_season_02_tv_05_yui_play_rpg,930,-(63+63)) \
	+TRIM_LAST_CLIP(yuruyuri_season_02_tv_02_kyouko_play_morra,63)+TRIM_MIDDLE_CLIP(yuruyuri_season_02_tv_08_yui_angry,63)+TRIM_FIRST_CLIP(yuruyuri_season_02_tv_03_akane_give_chocolate_to_akari,63)+TRIM_FIRST_CLIP(yuruyuri_season_02_tv_04_ayano_s_purin,63+34)

yuruyuri_season_02_tv_op_t04=TRIM_MIDDLE_CLIP(yuruyuri_season_02_tv_12_chinatsu_hair_eat_ball_04,63)+TRIM_LAST_CLIP(yuruyuri_season_02_tv_07_sister_complex_akane_01,63)+TRIM_MIDDLE_CLIP(yuruyuri_season_02_tv_07_himawari_cannot_wear_bra,63)+TRIM_MIDDLE_CLIP(yuruyuri_season_02_tv_09_sakurako_stand_on_her_head,63) \
	+TRIM_MIDDLE_CLIP(yuruyuri_season_02_tv_06_akari_cosplay_ganbo_with_hair_dumpling,63)+TRIM_LAST_CLIP(yuruyuri_season_02_tv_06_chinatsu_vampire,63)+TRIM_MIDDLE_CLIP(yuruyuri_season_02_tv_09_sakurako_plug_pen_in_akari_02,63)+TRIM_FIRST_CLIP(yuruyuri_season_02_tv_04_sakurako_maid,64)

yuruyuri_season_02_tv_op_t05=yuruyuri_season_02_tv_clean_op_part02+TRIM_LAST_CLIP(yuruyuri_season_02_tv_08_karaoke,37)

yuruyuri_season_02_tv_op_t06=TRIM_LAST_CLIP(yuruyuri_season_02_tv_07_akari_super_saiyazin,135)+TRIM_FIRST_CLIP(yuruyuri_season_02_tv_12_chiduru_use_machine_gun_02,118) \
	+TRIM_LAST_CLIP(yuruyuri_season_02_tv_11_akane_pinch_02,135)+TRIM_MIDDLE_CLIP(yuruyuri_season_02_tv_10_sakurako_ask_himawari,135)

yuruyuri_season_02_tv_op_t07=TRIM_MIDDLE_CLIP(yuruyuri_season_02_tv_07_nadesiko_and_hanako,63)+TRIM_MIDDLE_CLIP(yuruyuri_season_02_tv_07_himawari_and_kaede,63)+TRIM_LAST_CLIP(yuruyuri_season_02_tv_07_chiduru_rolling,63)+TRIM_MIDDLE_CLIP(yuruyuri_season_02_tv_07_yui_and_mari_playing_game,63) \
	+TRIM_MIDDLE_CLIP(yuruyuri_season_02_tv_10_little_sakurako_and_himawari_married,63)+TRIM_LAST_CLIP(yuruyuri_season_02_tv_11_akane_and_akari_sleep,63)+TRIM_FIRST_CLIP(yuruyuri_season_02_tv_07_nadesiko_dogeza,63)+TRIM_MIDDLE_CLIP(yuruyuri_season_02_tv_06_chinatsu_ero_talk,63)

yuruyuri_season_02_tv_op_t08=TRIM_MIDDLE_CLIP(yuruyuri_season_02_tv_08_ayano_and_chitose_singing,115)+TRIM_LAST_CLIP(yuruyuri_season_02_tv_07_tomoko_climax,138)+TRIM_LAST_CLIP(yuruyuri_season_02_tv_04_nana_bring_rise,43) \

yuruyuri_season_02_tv_op_t09=yuruyuri_season_02_tv_clean_op_part03
yuruyuri_season_02_tv_op_t10=TRIM_FIRST_CLIP(yuruyuri_season_02_tv_12_akari_kiss_robot,73)+TRIM_LAST_CLIP(yuruyuri_season_02_tv_12_bomb,53) \
	+yuruyuri_season_02_tv_clean_op_part04+TRIM_FIRST_CLIP(yuruyuri_season_02_tv_12_akari_go_on_stage,87)+yuruyuri_season_02_tv_clean_op_part05

yuruyuri_season_02_tv_op_mute=yuruyuri_season_02_tv_op_t01+yuruyuri_season_02_tv_op_t02+FADE_OUT_WITH_BRIGHTNESS_OFFSET_RGB24(yuruyuri_season_02_tv_op_t03,fade_length) \
	+FADE_OUT_WITH_BRIGHTNESS_OFFSET_RGB24(yuruyuri_season_02_tv_op_t04,fade_length)+DOUBLE_FADE_WITH_BRIGHTNESS_OFFSET_RGB24(yuruyuri_season_02_tv_op_t05,yuruyuri_season_02_tv_op_t06,fade_length,fade_length) \
	+yuruyuri_season_02_tv_op_t07+yuruyuri_season_02_tv_op_t08+yuruyuri_season_02_tv_op_t09+yuruyuri_season_02_tv_op_t10

######## Music ########

bgm_48khz=SSRC(WAVSource("src\yuruyuri-season_02-op-cd-01.wav"),48000)
AudioDub(yuruyuri_season_02_tv_op_mute,bgm_48khz)

######## Post Combine ########

yui_tenkousei=AudioDub(yui_tenkousei_mute,Trim(1386,0))
yui_tenkousei=FadeOut(yui_tenkousei,fade_length*2,color_white)
yui_tenkousei_width=(Round(747*16.0/9.0)-940)/2
yui_tenkousei=AddBorders(yui_tenkousei,yui_tenkousei_width,0,yui_tenkousei_width,0)
yui_tenkousei=RESIZE_TO_REF_CLIP(yui_tenkousei,yuruyuri_season_02_tv_clean_op)

######## Subtitle ########

subtitle_x=50
subtitle_y=400
global subtitle_front_fade_count=12
global subtitle_rear_fade_count=24
global subtitle_font="MS Gothic"
global subtitle_effects="bi"
global subtitle_size=28
global subtitle_text_color=OVERWRITE_COLOR_ALPHA(color_pink,$2F)
global subtitle_halo_color=color_black

second_subtitle_x=50
second_subtitle_y=50

function SUBTITLE_FX(clip clip,string text,float x,float y,int start_frame,int end_frame,bool "is_second_subtitle",bool "is_title"){
	is_second_subtitle=Default(is_second_subtitle,false)
	is_title=Default(is_title,false)

	text_color=is_second_subtitle?OVERWRITE_COLOR_ALPHA(color_hotpink,$2F):subtitle_text_color
	halo_color=is_title?color_hotpink:subtitle_halo_color

	result_clip=is_title? \
	SUBTITLE_FX_SLIDE_IN_WATER_OUT(clip,text,x,y,start_frame,end_frame,subtitle_front_fade_count,subtitle_rear_fade_count,subtitle_font,subtitle_effects,subtitle_size,text_color,halo_color): \
	SUBTITLE_NORMAL(clip,text,x,y,start_frame,end_frame,subtitle_font,subtitle_effects,subtitle_size,text_color,halo_color)

	return result_clip
}

SUBTITLE_FX("いぇす!ゆゆゆ☆ゆるゆり♪♪//七森中☆ごらく部|- by fielia@AVISynth",subtitle_x,subtitle_y-subtitle_size,390,516,is_title=true)

SUBTITLE_FX("ちょっち 待っち! 中学生",subtitle_x,subtitle_y,68,127)
SUBTITLE_FX("月曜一限 冴えない顔しちゃダメダメ",subtitle_x,subtitle_y,132,195)
SUBTITLE_FX("ぱっと やって 全部パーティー?",subtitle_x,subtitle_y,196,254)
SUBTITLE_FX("ジュースと笑顔が こぼれた",subtitle_x,subtitle_y,258,294)
SUBTITLE_FX("ゆゆゆ・ゆるゆり いぇす!",subtitle_x,subtitle_y,295,336)

SUBTITLE_FX("とろとろ毎日が ふわふわ過ぎてく",subtitle_x,subtitle_y,583,698)
SUBTITLE_FX("むにゃむにゃ寝坊して げっ やばっ",subtitle_x,subtitle_y,708,790)
SUBTITLE_FX("(げっ) ",second_subtitle_x,second_subtitle_y,777,797,true)
SUBTITLE_FX("       (やばっ)",second_subtitle_x,second_subtitle_y,790,797,true)
SUBTITLE_FX("Dash☆",subtitle_x,subtitle_y,798,833)
SUBTITLE_FX("      Dash☆",subtitle_x,subtitle_y,809,833)
SUBTITLE_FX("            Dash☆",subtitle_x,subtitle_y,817,833)
SUBTITLE_FX("                  Dash",subtitle_x,subtitle_y,824,833)
SUBTITLE_FX("やれやれ教室じゃ ウトウト居眠り",subtitle_x,subtitle_y,835,949)
SUBTITLE_FX("そろそろチャイムなって",subtitle_x,subtitle_y,961,1016)
SUBTITLE_FX("乙女の放課後",subtitle_x,subtitle_y,1017,1077)
SUBTITLE_FX("(ハイ!・ハイ!・いぇい!)",second_subtitle_x,second_subtitle_y,1031,1082,true)

SUBTITLE_FX("あ～とまらない",subtitle_x,subtitle_y,1081,1122)
SUBTITLE_FX("だらだら お菓子おしゃべり",subtitle_x,subtitle_y,1123,1194)
SUBTITLE_FX("いつも キミと",subtitle_x,subtitle_y,1195,1257)
SUBTITLE_FX("(いつも)",second_subtitle_x,second_subtitle_y,1215,1269,true)
SUBTITLE_FX("         (キミと)",second_subtitle_x,second_subtitle_y,1248,1269,true)
SUBTITLE_FX("笑う こんな時間",subtitle_x,subtitle_y,1258,1333)
SUBTITLE_FX("(笑う)",second_subtitle_x,second_subtitle_y,1279,1333,true)
SUBTITLE_FX("大好きなんだ",subtitle_x,subtitle_y,1334,1379)
SUBTITLE_FX("(わんつー!ゆるゆり)",second_subtitle_x,second_subtitle_y,1370,1403,true)

SUBTITLE_FX("最大限 わらっちゃお",subtitle_x,subtitle_y,1381,1443)
SUBTITLE_FX("(ハイ! ハイ!)",second_subtitle_x,second_subtitle_y,1441,1466,true)
SUBTITLE_FX("ソース煎餅 かじっちゃお",subtitle_x,subtitle_y,1444,1514)
SUBTITLE_FX("(いぇい! いぇい!)",second_subtitle_x,second_subtitle_y,1503,1529,true)
SUBTITLE_FX("まぁ なんとかなるでしょ 大丈夫",subtitle_x,subtitle_y,1515,1633)
SUBTITLE_FX("(だいじょぶ だいじょぶ)",second_subtitle_x,second_subtitle_y,1623,1655,true)
SUBTITLE_FX("一等賞の笑顔!",subtitle_x,subtitle_y,1634,1697)
SUBTITLE_FX("(ハイ! ハイ!)",second_subtitle_x,second_subtitle_y,1693,1719,true)
SUBTITLE_FX("なんちゃって…アリガト",subtitle_x,subtitle_y,1698,1768)
SUBTITLE_FX("(いぇす!いぇす!いぇす!)",second_subtitle_x,second_subtitle_y,1756,1782,true)
SUBTITLE_FX("どんな時も 今日が一番 楽しい日",subtitle_x,subtitle_y,1769,1937)

SUBTITLE_FX("めっちゃ! むっちゃ! 一夜漬け",subtitle_x,subtitle_y,1966,2025)
SUBTITLE_FX("びっくりしちゃって 落とした お団子コロコロ",subtitle_x,subtitle_y,2029,2091)
SUBTITLE_FX("いっちょ! やっちょ! 成長期",subtitle_x,subtitle_y,2092,2150)
SUBTITLE_FX("そろそろ 出るトコ 出ちゃうよ?",subtitle_x,subtitle_y,2156,2190)
SUBTITLE_FX("マママ・マジですかい!?",subtitle_x,subtitle_y,2191,2234)

SUBTITLE_FX("アレアレ? 宿題が だいたい手付かず",subtitle_x,subtitle_y,2511,2627)
SUBTITLE_FX("ぼちぼち写させて げっ ダメ?",subtitle_x,subtitle_y,2637,2718)
SUBTITLE_FX("(げっ)",second_subtitle_x,second_subtitle_y,2708,2725,true)
SUBTITLE_FX("       (ダメ?)",second_subtitle_x,second_subtitle_y,2718,2725,true)
SUBTITLE_FX("けち",subtitle_x,subtitle_y,2726,2762)
SUBTITLE_FX("    けち",subtitle_x,subtitle_y,2738,2762)
SUBTITLE_FX("        けち",subtitle_x,subtitle_y,2746,2762)
SUBTITLE_FX("            けちっ!",subtitle_x,subtitle_y,2753,2762)
SUBTITLE_FX("プンプンあきらめて しぶしぶおひるね",subtitle_x,subtitle_y,2764,2878)
SUBTITLE_FX("スヤスヤ夢の中",subtitle_x,subtitle_y,2890,2946)
SUBTITLE_FX("クラゲがフワフワ",subtitle_x,subtitle_y,2947,3005)
SUBTITLE_FX("(ハイ!・ハイ!・いぇい!)",second_subtitle_x,second_subtitle_y,2959,3015,true)

SUBTITLE_FX("あ～とまらない",subtitle_x,subtitle_y,3010,3051)
SUBTITLE_FX("妄想 鼻血 トキメキ☆",subtitle_x,subtitle_y,3052,3123)
SUBTITLE_FX("あのね えとね",subtitle_x,subtitle_y,3124,3186)
SUBTITLE_FX("(あのね)",second_subtitle_x,second_subtitle_y,3144,3205,true)
SUBTITLE_FX("         (えとね)",second_subtitle_x,second_subtitle_y,3177,3205,true)
SUBTITLE_FX("でもね …言えないんだ",subtitle_x,subtitle_y,3187,3261)
SUBTITLE_FX("(でもね)",second_subtitle_x,second_subtitle_y,3208,3261,true)
SUBTITLE_FX("「スキかも」なんて",subtitle_x,subtitle_y,3262,3308)
SUBTITLE_FX("(わんつー!ゆるゆり)",second_subtitle_x,second_subtitle_y,3299,3362,true)

SUBTITLE_FX("イーカゲン! が 良い加減",subtitle_x,subtitle_y,3342,3404)
SUBTITLE_FX("(ハイ! ハイ!)",second_subtitle_x,second_subtitle_y,3401,3426,true)
SUBTITLE_FX("テ☆キ☆トー☆ が適当",subtitle_x,subtitle_y,3405,3475)
SUBTITLE_FX("(いぇい! いぇい!)",second_subtitle_x,second_subtitle_y,3465,3489,true)
SUBTITLE_FX("可愛けりゃいいでしょ? 大丈夫",subtitle_x,subtitle_y,3476,3594)
SUBTITLE_FX("(だいじょぶ だいじょぶ)",second_subtitle_x,second_subtitle_y,3584,3615,true)
SUBTITLE_FX("いっつ・しょー・たいむ! このまま",subtitle_x,subtitle_y,3595,3657)
SUBTITLE_FX("(ハイ! ハイ!)",second_subtitle_x,second_subtitle_y,3654,3679,true)
SUBTITLE_FX("はっぴぃ・でぃ! 続いてくよ",subtitle_x,subtitle_y,3658,3728)
SUBTITLE_FX("(いぇす!いぇす!いぇす!)",second_subtitle_x,second_subtitle_y,3716,3742,true)
SUBTITLE_FX("みんなといる この時間が たからもの",subtitle_x,subtitle_y,3729,3897)

SUBTITLE_FX("あ～とまらない",subtitle_x,subtitle_y,4370,4412)
SUBTITLE_FX("だらだら お菓子おしゃべり",subtitle_x,subtitle_y,4413,4483)
SUBTITLE_FX("いつも キミと",subtitle_x,subtitle_y,4484,4547)
SUBTITLE_FX("(いつも)",second_subtitle_x,second_subtitle_y,4504,4564,true)
SUBTITLE_FX("         (キミと)",second_subtitle_x,second_subtitle_y,4537,4564,true)
SUBTITLE_FX("笑う こんな時間",subtitle_x,subtitle_y,4548,4626)
SUBTITLE_FX("(笑う)",second_subtitle_x,second_subtitle_y,4569,4626,true)
SUBTITLE_FX("大好きなんだ",subtitle_x,subtitle_y,4627,4666)
SUBTITLE_FX("(わんつー!ゆるゆり)",second_subtitle_x,second_subtitle_y,4658,4691,true)

SUBTITLE_FX("最大限 わらっちゃお",subtitle_x,subtitle_y,4669,4731)
SUBTITLE_FX("(ハイ! ハイ!)",second_subtitle_x,second_subtitle_y,4728,4754,true)
SUBTITLE_FX("ソース煎餅 かじっちゃお",subtitle_x,subtitle_y,4732,4803)
SUBTITLE_FX("(いぇい! いぇい!)",second_subtitle_x,second_subtitle_y,4792,4817,true)
SUBTITLE_FX("まぁ なんとかなるでしょ 大丈夫",subtitle_x,subtitle_y,4804,4922)
SUBTITLE_FX("(だいじょぶ だいじょぶ)",second_subtitle_x,second_subtitle_y,4912,4943,true)
SUBTITLE_FX("一等賞の笑顔!",subtitle_x,subtitle_y,4923,4985)
SUBTITLE_FX("(ハイ! ハイ!)",second_subtitle_x,second_subtitle_y,4982,5007,true)
SUBTITLE_FX("なんちゃって…アリガト",subtitle_x,subtitle_y,4986,5055)
SUBTITLE_FX("(いぇす!いぇす!いぇす!)",second_subtitle_x,second_subtitle_y,5044,5070,true)
SUBTITLE_FX("どんな時も 今日が一番 楽しい日",subtitle_x,subtitle_y,5056,5225)

SUBTITLE_FX("ちょっち 待っち! 中学生",subtitle_x,subtitle_y,5255,5315)
SUBTITLE_FX("気分は上場 ごらくぶ コタツはヌクヌク",subtitle_x,subtitle_y,5318,5380)
SUBTITLE_FX("ぱっと やって 今日もパーティー?",subtitle_x,subtitle_y,5381,5440)
SUBTITLE_FX("いつもの みんなが 集まる",subtitle_x,subtitle_y,5444,5478)
SUBTITLE_FX("ゆゆゆ・ゆるゆり いぇす!",subtitle_x,subtitle_y,5479,5525)



global center_subtitle_size=56
center_subtitle_x=428

function SUBTITLE_N(clip clip,string text,float x,float y,int start_frame,int end_frame,bool "is_center",bool "is_cm"){
	is_center=Default(is_center,false)
	is_cm=Default(is_cm,false)

	x=is_center?x-(center_subtitle_size*StrLen(text)/4):x
	size=is_center?center_subtitle_size:subtitle_size
	text_color=is_cm?color_white:subtitle_text_color

	return SUBTITLE_NORMAL(clip,text,x,y,start_frame,end_frame,subtitle_font,subtitle_effects,size,text_color,subtitle_halo_color)
}

title_call_subtitle_y=370

yuruyuri_season_02_tv_01_title_call_mtv_version=SUBTITLE_N(yuruyuri_season_02_tv_01_title_call_mtv_version,"＼ｱｯｶﾈｰﾝ／",center_subtitle_x,title_call_subtitle_y,45,95,true)
yuruyuri_season_02_tv_01_title_call_mtv_version=SUBTITLE_N(yuruyuri_season_02_tv_01_title_call_mtv_version,"は～～～い",subtitle_x,subtitle_y,100,125)
yuruyuri_season_02_tv_01_title_call_mtv_version=SUBTITLE_N(yuruyuri_season_02_tv_01_title_call_mtv_version,"がちゆり、始まるよ～～～",subtitle_x,subtitle_y,135,200)

cm_subtitle_01_y=50
cm_subtitle_02_y=50+(center_subtitle_size*5)

yui_tenkousei=SUBTITLE_N(yui_tenkousei,"   提供   ",center_subtitle_x,cm_subtitle_01_y,10,250,true,true)
yui_tenkousei=SUBTITLE_N(yui_tenkousei,"中央動画部",center_subtitle_x,cm_subtitle_02_y,10,250,true,true)



yuruyuri_season_02_tv_01_title_call_mtv_version++last++yui_tenkousei++BlankClip(last,length=24,color=color_black)

######## Post Processing ########

ConvertToYV12()
#ConvertToYUY2()
#ConvertToRGB24()
