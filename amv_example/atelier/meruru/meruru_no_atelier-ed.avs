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



Import("..\..\avsi4comp\macro.avsi")

######## PV Online (720P) ########

meruru_prologue_movie=AssumeFPS(FFMS2_VIDEO_SOURCE("src\special\movie\a13-prologue_movie.mp4"),"ntsc_video")

######## PV DVD (480P) ########

######## PS3 (720P) ########

######## Combine ########

meruru_ed_mute=BlankClip(meruru_prologue_movie,length=330,color=color_black)+meruru_prologue_movie

######## Music ########

bgm_48khz=SSRC(WAVSource("src\meruru_no_atelier-ost-01-05.wav"),48000)
AudioDub(meruru_ed_mute,bgm_48khz)

######## Subtitle ########

######## Post Processing ########

ConvertToYV12()
#ConvertToYUY2()
#ConvertToRGB24()

TCPServer()
