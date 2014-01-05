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
shingeki_no_kyojin_tv_16=FFMS2_VIDEO_SOURCE("src\anime\(2013Q2) 進撃の巨人  第16話 「今、何をすべきか」 (MBS 1280x720 x264 AAC).mp4")
shingeki_no_kyojin_tv_16_cache02=FFMS2_VIDEO_SOURCE("src\anime\(2013Q2) 進撃の巨人  第16話 「今、何をすべきか」 (MBS 1280x720 x264 AAC).mp4")
shingeki_no_kyojin_tv_17=FFMS2_VIDEO_SOURCE("src\anime\(2013Q2) 進撃の巨人  第17話 「女型の巨人」 (MBS 1280x720 x264 AAC).mp4")

######## Trim ########

shingeki_no_kyojin_tv_01_kyojin_catch_carla_01=Trim(shingeki_no_kyojin_tv_01,32841,32950) #110 op2
shingeki_no_kyojin_tv_01_kyojin_catch_carla_02=Trim(shingeki_no_kyojin_tv_01_cache02,32951,33052) #102 op2

shingeki_no_kyojin_tv_06_mikasa_in_rain=Trim(shingeki_no_kyojin_tv_06,31367,31510) #144 op2

shingeki_no_kyojin_tv_16_wall_gate_open=Trim(shingeki_no_kyojin_tv_16,31508,31704) #197 op_suite

shingeki_no_kyojin_tv_17_megata_no_kyojin_jump=Trim(shingeki_no_kyojin_tv_17,16307,16329) #23 op1
