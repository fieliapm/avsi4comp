################################################################################
#
# avsi4comp - A set of AviSynth functions to help video compositing and editing
# Copyright (C) 2010-present Himawari Tachibana <fieliapm@gmail.com>
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.
#
################################################################################



######## BD (1920*1080) ########

mahoujin_guru_guru_2017_tv_16=FFMS2_VIDEO_SOURCE("src\[Snow-Raws] 魔法陣グルグル 2017\[Snow-Raws] 魔法陣グルグル 2017 第16話 (BD 1920x1080 HEVC-YUV420P10 FLACx2).mkv")
mahoujin_guru_guru_2017_tv_16_cache02=FFMS2_VIDEO_SOURCE("src\[Snow-Raws] 魔法陣グルグル 2017\[Snow-Raws] 魔法陣グルグル 2017 第16話 (BD 1920x1080 HEVC-YUV420P10 FLACx2).mkv")

mahoujin_guru_guru_2017_tv_17=FFMS2_VIDEO_SOURCE("src\[Snow-Raws] 魔法陣グルグル 2017\[Snow-Raws] 魔法陣グルグル 2017 第17話 (BD 1920x1080 HEVC-YUV420P10 FLACx2).mkv")
mahoujin_guru_guru_2017_tv_18=FFMS2_VIDEO_SOURCE("src\[Snow-Raws] 魔法陣グルグル 2017\[Snow-Raws] 魔法陣グルグル 2017 第18話 (BD 1920x1080 HEVC-YUV420P10 FLACx2).mkv")
mahoujin_guru_guru_2017_tv_19=FFMS2_VIDEO_SOURCE("src\[Snow-Raws] 魔法陣グルグル 2017\[Snow-Raws] 魔法陣グルグル 2017 第19話 (BD 1920x1080 HEVC-YUV420P10 FLACx2).mkv")
mahoujin_guru_guru_2017_tv_20=FFMS2_VIDEO_SOURCE("src\[Snow-Raws] 魔法陣グルグル 2017\[Snow-Raws] 魔法陣グルグル 2017 第20話 (BD 1920x1080 HEVC-YUV420P10 FLACx2).mkv")
mahoujin_guru_guru_2017_tv_21=FFMS2_VIDEO_SOURCE("src\[Snow-Raws] 魔法陣グルグル 2017\[Snow-Raws] 魔法陣グルグル 2017 第21話 (BD 1920x1080 HEVC-YUV420P10 FLACx2).mkv")
mahoujin_guru_guru_2017_tv_22=FFMS2_VIDEO_SOURCE("src\[Snow-Raws] 魔法陣グルグル 2017\[Snow-Raws] 魔法陣グルグル 2017 第22話 (BD 1920x1080 HEVC-YUV420P10 FLACx2).mkv")
mahoujin_guru_guru_2017_tv_23=FFMS2_VIDEO_SOURCE("src\[Snow-Raws] 魔法陣グルグル 2017\[Snow-Raws] 魔法陣グルグル 2017 第23話 (BD 1920x1080 HEVC-YUV420P10 FLACx2).mkv")
mahoujin_guru_guru_2017_tv_24=FFMS2_VIDEO_SOURCE("src\[Snow-Raws] 魔法陣グルグル 2017\[Snow-Raws] 魔法陣グルグル 2017 第24話 (BD 1920x1080 HEVC-YUV420P10 FLACx2).mkv")

mahoujin_guru_guru_2017_tv_clean_op_02=FFMS2_VIDEO_SOURCE("src\[Snow-Raws] 魔法陣グルグル 2017\映像特典\[Snow-Raws] 魔法陣グルグル 2017 OP02 (BD 1920x1080 HEVC-YUV420P10 FLAC).mkv")
mahoujin_guru_guru_2017_tv_clean_ed_01=FFMS2_VIDEO_SOURCE("src\[Snow-Raws] 魔法陣グルグル 2017\映像特典\[Snow-Raws] 魔法陣グルグル 2017 ED01 (BD 1920x1080 HEVC-YUV420P10 FLAC).mkv")
mahoujin_guru_guru_2017_tv_clean_ed_01_cache02=FFMS2_VIDEO_SOURCE("src\[Snow-Raws] 魔法陣グルグル 2017\映像特典\[Snow-Raws] 魔法陣グルグル 2017 ED01 (BD 1920x1080 HEVC-YUV420P10 FLAC).mkv")

######## Trim ########

mahoujin_guru_guru_2017_tv_clean_op_02_01=Trim(mahoujin_guru_guru_2017_tv_clean_op_02,0,1308)
mahoujin_guru_guru_2017_tv_clean_op_02_02=Trim(mahoujin_guru_guru_2017_tv_clean_op_02,1309,1651)
mahoujin_guru_guru_2017_tv_clean_op_02_03=Trim(mahoujin_guru_guru_2017_tv_clean_op_02,1652,0)


mahoujin_guru_guru_2017_tv_clean_ed_01_pre=Trim(mahoujin_guru_guru_2017_tv_clean_ed_01,0,23)
mahoujin_guru_guru_2017_tv_clean_ed_01_01=Trim(mahoujin_guru_guru_2017_tv_clean_ed_01,24,1490)

mahoujin_guru_guru_2017_tv_clean_ed_01_01_pre_loop=Trim(mahoujin_guru_guru_2017_tv_clean_ed_01,24,277) #254

mahoujin_guru_guru_2017_tv_clean_ed_01_01_loop=Trim(mahoujin_guru_guru_2017_tv_clean_ed_01,278,1477)

mahoujin_guru_guru_2017_tv_clean_ed_01_01_loop_sub1_pre=Trim(mahoujin_guru_guru_2017_tv_clean_ed_01,278,650) #373
mahoujin_guru_guru_2017_tv_clean_ed_01_01_loop_sub1=Trim(mahoujin_guru_guru_2017_tv_clean_ed_01,651,1250) #600
mahoujin_guru_guru_2017_tv_clean_ed_01_01_loop_sub1_post=Trim(mahoujin_guru_guru_2017_tv_clean_ed_01,1251,1477) #227

mahoujin_guru_guru_2017_tv_clean_ed_01_01_loop_sub2_pre=Trim(mahoujin_guru_guru_2017_tv_clean_ed_01,278,811) #534
mahoujin_guru_guru_2017_tv_clean_ed_01_01_loop_sub2=Trim(mahoujin_guru_guru_2017_tv_clean_ed_01,812,1411) #600
mahoujin_guru_guru_2017_tv_clean_ed_01_01_loop_sub2_post=Trim(mahoujin_guru_guru_2017_tv_clean_ed_01,1412,1477) #66

mahoujin_guru_guru_2017_tv_clean_ed_01_01_post_loop=Trim(mahoujin_guru_guru_2017_tv_clean_ed_01,1478,1490) #13

mahoujin_guru_guru_2017_tv_clean_ed_01_01_to_02=Trim(mahoujin_guru_guru_2017_tv_clean_ed_01,1491,1494)
mahoujin_guru_guru_2017_tv_clean_ed_01_02=Trim(mahoujin_guru_guru_2017_tv_clean_ed_01_cache02,1495,2061)
mahoujin_guru_guru_2017_tv_clean_ed_01_03=Trim(mahoujin_guru_guru_2017_tv_clean_ed_01,2062,2180)
mahoujin_guru_guru_2017_tv_clean_ed_01_post=Trim(mahoujin_guru_guru_2017_tv_clean_ed_01,2181,0)



mahoujin_guru_guru_2017_tv_16_oppai_manjuu_pre=Trim(mahoujin_guru_guru_2017_tv_16,34334,34384) #41 ed01
mahoujin_guru_guru_2017_tv_16_oppai_manjuu_pre_cache02=Trim(mahoujin_guru_guru_2017_tv_16_cache02,34334,34384) #41 ed01
mahoujin_guru_guru_2017_tv_16_oppai_manjuu=Trim(mahoujin_guru_guru_2017_tv_16,34334,34511) #178

mahoujin_guru_guru_2017_tv_17_airi_feel_surprised=Trim(mahoujin_guru_guru_2017_tv_17,992,1086) #95
mahoujin_guru_guru_2017_tv_17_sayu_sit_in_lane=Trim(mahoujin_guru_guru_2017_tv_17,3023,3183) #161
mahoujin_guru_guru_2017_tv_17_yoshida_see_sayu_sit_in_lane=Trim(mahoujin_guru_guru_2017_tv_17,3655,3870) #216 op
mahoujin_guru_guru_2017_tv_17_sayu_start_to_smile=Trim(mahoujin_guru_guru_2017_tv_17,4003,4038) #36
mahoujin_guru_guru_2017_tv_17_sayu_stand_up=Trim(mahoujin_guru_guru_2017_tv_17,4039,4091) #53 op
mahoujin_guru_guru_2017_tv_17_sayu_grin_then_punpun=Trim(mahoujin_guru_guru_2017_tv_17,4301,4425) #125


mahoujin_guru_guru_2017_tv_24_fireworks_and_the_end=Trim(mahoujin_guru_guru_2017_tv_24,32777,33064) #288
mahoujin_guru_guru_2017_tv_24_fireworks_and_the_end_digest=Trim(mahoujin_guru_guru_2017_tv_24,32832,33064) #232 ed01
mahoujin_guru_guru_2017_tv_24_nike_invike_kukuri_again_01=Trim(mahoujin_guru_guru_2017_tv_24,36918,36965) #48 ed01
mahoujin_guru_guru_2017_tv_24_nike_invike_kukuri_again_02=Trim(mahoujin_guru_guru_2017_tv_24,36966,37001) #36
mahoujin_guru_guru_2017_tv_24_the_end=Trim(mahoujin_guru_guru_2017_tv_24,37309,37548) #240
