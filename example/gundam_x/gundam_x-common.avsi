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

gundam_x_01=OpenDMLSource("src\[アニメ] (DVD) 機動新世紀ガンダムX 全39話+映像特典 (640x480 XviD rr3%)\機動新世紀ガンダムX 第01話 「月は出ているか？」.avi")

gundam_x_37=OpenDMLSource("src\[アニメ] (DVD) 機動新世紀ガンダムX 全39話+映像特典 (640x480 XviD rr3%)\機動新世紀ガンダムX 第37話 「フリーデン発進せよ」.avi")
gundam_x_38=OpenDMLSource("src\[アニメ] (DVD) 機動新世紀ガンダムX 全39話+映像特典 (640x480 XviD rr3%)\機動新世紀ガンダムX 第38話 「私はD.O.M.E…かつてニュータイプと呼ばれた者」.avi")
gundam_x_39=OpenDMLSource("src\[アニメ] (DVD) 機動新世紀ガンダムX 全39話+映像特典 (640x480 XviD rr3%)\機動新世紀ガンダムX 第39話 「月はいつもそこにある」（最終話）.avi")

gundam_x_clean_ed_01=OpenDMLSource("src\[アニメ] (DVD) 機動新世紀ガンダムX 全39話+映像特典 (640x480 XviD rr3%)\機動新世紀ガンダムX_DVD映像特典3 ノンテロップED①.avi")
gundam_x_clean_ed_02=OpenDMLSource("src\[アニメ] (DVD) 機動新世紀ガンダムX 全39話+映像特典 (640x480 XviD rr3%)\機動新世紀ガンダムX_DVD映像特典3 ノンテロップED②.avi")
gundam_x_clean_ed_03=OpenDMLSource("src\[アニメ] (DVD) 機動新世紀ガンダムX 全39話+映像特典 (640x480 XviD rr3%)\機動新世紀ガンダムX_DVD映像特典3 ノンテロップED③.avi")

gundam_x_next=OpenDMLSource("src\[アニメ] (DVD) 機動新世紀ガンダムX 全39話+映像特典 (640x480 XviD rr3%)\機動新世紀ガンダムX_DVD映像特典5 第1話～第38話次回予告.avi")

######## Trim ########

gundam_x_clean_ed_01_01=Trim(gundam_x_clean_ed_01,0,40)
gundam_x_clean_ed_01_02=Trim(gundam_x_clean_ed_01,41,1209)
gundam_x_clean_ed_01_02_moon=Trim(gundam_x_clean_ed_01,41,1566)
gundam_x_clean_ed_01_03=Trim(gundam_x_clean_ed_01,1567,0)

gundam_x_clean_ed_03_01=Trim(gundam_x_clean_ed_03,0,35)
gundam_x_clean_ed_03_02=Trim(gundam_x_clean_ed_03,36,1561)
gundam_x_clean_ed_03_03=Trim(gundam_x_clean_ed_03,1562,0)

gundam_x_title=Trim(gundam_x_next,0,61)

gundam_x_01_next=Trim(gundam_x_next,62,616)
gundam_x_02_next=Trim(gundam_x_next,837,1388)
gundam_x_03_next=Trim(gundam_x_next,1611,2162)
gundam_x_04_next=Trim(gundam_x_next,2379,2930)
gundam_x_05_next=Trim(gundam_x_next,3148,3700)
gundam_x_06_next=Trim(gundam_x_next,3907,4458)
gundam_x_07_next=Trim(gundam_x_next,4679,5230)
gundam_x_08_next=Trim(gundam_x_next,5447,5998)
gundam_x_09_next=Trim(gundam_x_next,6214,6774)
gundam_x_10_next=Trim(gundam_x_next,6981,7532)
gundam_x_11_next=Trim(gundam_x_next,7749,8300)
gundam_x_12_next=Trim(gundam_x_next,8516,9067)
gundam_x_13_next=Trim(gundam_x_next,9285,9837)

gundam_x_27_next=Trim(gundam_x_next,20038,20589)
gundam_x_28_next=Trim(gundam_x_next,20808,21369)
gundam_x_29_next=Trim(gundam_x_next,21578,22129)
gundam_x_30_next=Trim(gundam_x_next,22340,22891)
gundam_x_31_next=Trim(gundam_x_next,23111,23650)
gundam_x_32_next=Trim(gundam_x_next,23879,24430)
gundam_x_33_next=Trim(gundam_x_next,24646,25197)
gundam_x_34_next=Trim(gundam_x_next,25415,25950)
gundam_x_35_next=Trim(gundam_x_next,26180,26731)
gundam_x_36_next=Trim(gundam_x_next,26952,27515)
gundam_x_37_next=Trim(gundam_x_next,27721,28272)
gundam_x_38_next=Trim(gundam_x_next,28489,29064)

gundam_x_01_tifa_slogan=Trim(gundam_x_01,34279,34380-1) #102 op

gundam_x_37_newtype_slogan_01=Trim(gundam_x_37,34268,34363) #96
gundam_x_37_newtype_slogan_02=Trim(gundam_x_37,34364,34419) #56
gundam_x_37_newtype_slogan=Trim(gundam_x_37,34268,34419) #152

gundam_x_39_nothing_called_new_type=Trim(gundam_x_39,16186,16376)
gundam_x_39_moon=Trim(gundam_x_39,32387,32721) #335
