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

gundam_x_02=OpenDMLSource("src\[アニメ] (DVD) 機動新世紀ガンダムX 全39話+映像特典 (640x480 XviD rr3%)\機動新世紀ガンダムX 第02話 「あなたに、力を…」.avi")

gundam_x_38=OpenDMLSource("src\[アニメ] (DVD) 機動新世紀ガンダムX 全39話+映像特典 (640x480 XviD rr3%)\機動新世紀ガンダムX 第38話 「私はD.O.M.E…かつてニュータイプと呼ばれた者」.avi")

######## Trim ########

gundam_x_02_tifa_anata_ni_chikara_wo=Trim(gundam_x_02,24943+1,25074) #102

gundam_x_38_moon_slogan=Trim(gundam_x_38,34295,34350) #56

