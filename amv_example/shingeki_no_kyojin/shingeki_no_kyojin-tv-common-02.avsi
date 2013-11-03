Import("..\avsi4comp\macro.avsi")

SetMemoryMax(64)

######## TV (1920*1080) ########

shingeki_no_kyojin_tv_14=FFMS2_VIDEO_SOURCE("src\anime\(2013Q2) 進撃の巨人  第14話 「まだ目を見れない」 (MBS 1280x720 x264 AAC).mp4")
shingeki_no_kyojin_tv_15=FFMS2_VIDEO_SOURCE("src\anime\(2013Q2) 進撃の巨人  第15話 「特別作戦班」 (MBS 1280x720 x264 AAC).mp4")
shingeki_no_kyojin_tv_16=FFMS2_VIDEO_SOURCE("src\anime\(2013Q2) 進撃の巨人  第16話 「今、何をすべきか」 (MBS 1280x720 x264 AAC).mp4")
shingeki_no_kyojin_tv_17=FFMS2_VIDEO_SOURCE("src\anime\(2013Q2) 進撃の巨人  第17話 「女型の巨人」 (MBS 1280x720 x264 AAC).mp4")
shingeki_no_kyojin_tv_18=FFMS2_VIDEO_SOURCE("src\anime\(2013Q2) 進撃の巨人 第18話 「巨大樹の森」 (MBS 1280x720 x264 AAC).mp4")
shingeki_no_kyojin_tv_19=FFMS2_VIDEO_SOURCE("src\anime\(2013Q2) 進撃の巨人 第19話 「噛みつく」 (MBS 1280x720 x264 AAC).mp4")
shingeki_no_kyojin_tv_20=FFMS2_VIDEO_SOURCE("src\anime\(2013Q2) 進撃の巨人 第20話 「エルヴィン・スミス」 (MBS 1280x720 x264 AAC).mp4")
shingeki_no_kyojin_tv_21=FFMS2_VIDEO_SOURCE("src\anime\(2013Q2) 進撃の巨人 第21話 「鉄槌」 (MBS 1280x720 x264-10b AAC).mp4")
shingeki_no_kyojin_tv_22=FFMS2_VIDEO_SOURCE("src\anime\(2013Q2) 進撃の巨人 第22話 「敗者達」 (MBS 1280x720 x264-10b AAC).mp4")
shingeki_no_kyojin_tv_23=FFMS2_VIDEO_SOURCE("src\anime\(2013Q2) 進撃の巨人 第23話 「微笑み」 (MBS 1280x720 x264-10b AAC).mp4")
shingeki_no_kyojin_tv_24=FFMS2_VIDEO_SOURCE("src\anime\(2013Q2) 進撃の巨人 第24話 「慈悲」 (MBS 1280x720 x264-10b AAC).mp4")
shingeki_no_kyojin_tv_25=FFMS2_VIDEO_SOURCE("src\anime\(2013Q2) 進撃の巨人 第25話 「壁」 (MBS 1280x720 x264-10b AAC).mp4")

shingeki_no_kyojin_tv_clean_op_02=Trim(shingeki_no_kyojin_tv_14,1200,3356)
shingeki_no_kyojin_tv_clean_ed_02=Trim(shingeki_no_kyojin_tv_14,32172,34326)

######## TRIM ########

shingeki_no_kyojin_tv_clean_op_02_01=Trim(shingeki_no_kyojin_tv_clean_op_02,0,1087)
shingeki_no_kyojin_tv_clean_op_02_02=Trim(shingeki_no_kyojin_tv_clean_op_02,1088,1998)
shingeki_no_kyojin_tv_clean_op_02_03=Trim(shingeki_no_kyojin_tv_clean_op_02,1999,0)


shingeki_no_kyojin_tv_clean_ed_02_01=Trim(shingeki_no_kyojin_tv_clean_ed_02,0,1538)
shingeki_no_kyojin_tv_clean_ed_02_02=Trim(shingeki_no_kyojin_tv_clean_ed_02,1539,1666)
shingeki_no_kyojin_tv_clean_ed_02_03=Trim(shingeki_no_kyojin_tv_clean_ed_02,1667,1952)
shingeki_no_kyojin_tv_clean_ed_02_04=Trim(shingeki_no_kyojin_tv_clean_ed_02,1953,0)



shingeki_no_kyojin_tv_15_field_01=Trim(shingeki_no_kyojin_tv_15,5651,5763) #113
