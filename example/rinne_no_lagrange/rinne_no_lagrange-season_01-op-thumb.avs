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



Import("..\..\avsi4comp\avsi4comp.avsi")

######## TV (1920*1080) ########

op_full=BlankClip(length=24*((60*4)+21),width=1920,height=1080,pixel_type="YV12",fps=24000,fps_denominator=1001,color=color_black)

######## Music ########

bgm=WAVSource("src\rinne_no_lagrange-season_01-op-ed-01.wav")

op_full=AudioDub(op_full,bgm)

######## Combine ########

op=FadeOut(Trim(op_full,12,-(24*30-2)),24)

op

######## Post Processing ########

#ConvertToYV12()
#ConvertToYUY2()
#ConvertToRGB24(matrix="Rec709")

#ConvertAudioTo8bit()
#ConvertAudioTo16bit()
#ConvertAudioTo24bit()
#ConvertAudioTo32bit()
#ConvertAudioToFloat()

TCPServer()
