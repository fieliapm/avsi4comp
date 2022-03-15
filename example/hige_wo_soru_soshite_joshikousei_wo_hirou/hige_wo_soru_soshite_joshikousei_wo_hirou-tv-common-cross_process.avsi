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

hige_wo_soru_soshite_joshikousei_wo_hirou_tv_13=FFMS2_VIDEO_SOURCE("src\[LowPower-Raws] ひげを剃る。そして女子高生を拾う。 (BD 1080P x265 Ma10p FLAC)\[LowPower-Raws] ひげを剃る。そして女子高生を拾う。 - 13 (BD 1080P x265 Ma10p FLAC).mkv")

######## Trim ########

hige_wo_soru_soshite_joshikousei_wo_hirou_tv_13_title=Trim(hige_wo_soru_soshite_joshikousei_wo_hirou_tv_13,0,119) #120
#hige_wo_soru_soshite_joshikousei_wo_hirou_tv_13_epilogue=Trim(hige_wo_soru_soshite_joshikousei_wo_hirou_tv_13,32516,33925) #1410
hige_wo_soru_soshite_joshikousei_wo_hirou_tv_13_epilogue=Trim(hige_wo_soru_soshite_joshikousei_wo_hirou_tv_13,33092,33925) #834
