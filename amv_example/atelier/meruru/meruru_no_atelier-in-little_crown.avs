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

meruru_little_crown_promotion_movie=AssumeFPS(FFMS2_VIDEO_SOURCE("src\special\movie\a13-little_crown_promotion_movie.mp4"),"ntsc_video")

meruru_little_crown_promotion_movie_01=Trim(meruru_little_crown_promotion_movie,0,2918)
meruru_little_crown_promotion_movie_02=Trim(meruru_little_crown_promotion_movie,2919,4310)
meruru_little_crown_promotion_movie_03=Trim(meruru_little_crown_promotion_movie,4310,0)

######## Combine ########

meruru_in_little_crown_t01=BlankClip(meruru_little_crown_promotion_movie_01,length=10,color=color_black)+meruru_little_crown_promotion_movie_01
meruru_in_little_crown_t02=BlankClip(meruru_little_crown_promotion_movie_01,length=4175,color=color_black)
meruru_in_little_crown_t03=meruru_little_crown_promotion_movie_02+meruru_little_crown_promotion_movie_03


meruru_in_little_crown_mute=meruru_in_little_crown_t01+meruru_in_little_crown_t02+meruru_in_little_crown_t03

######## Music ########

bgm_48khz=SSRC(WAVSource("src\meruru_no_atelier-ost-01-03.wav"),48000)
AudioDub(meruru_in_little_crown_mute,bgm_48khz)

######## Subtitle ########

######## Post Processing ########

ConvertToYV12()
#ConvertToYUY2()
#ConvertToRGB24()
