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

Import("seishun_buta_yarou-season_01-common.avsi")

######## Source ########

#seishun_buta_yarou_season_01_op=FFMS2_VIDEO_SOURCE("..\seishun_buta_yarou-season_01-op.avi")

seishun_buta_yarou_season_01_op=TCPSource("localhost",22050,"None")



#slam_dunk_tv_op_01=SSRC(FFMS2_VIDEO_SOURCE("src\slam_dunk\Slam Dunk  Opening 1 [HD].360p.mp4",fpsnum=30000,fpsden=1001),48000)

slam_dunk_tv_op_01_video=FFVideoSource("src\slam_dunk\Slam Dunk  Opening 1 [HD].DASH-480p.mp4",fpsnum=30000,fpsden=1001,threads=1,seekmode=-1)
slam_dunk_tv_op_01_audio=SSRC(FFAudioSource("src\slam_dunk\Slam Dunk  Opening 1 [HD].DASH-128k.m4a"),48000)
slam_dunk_tv_op_01=AudioDub(slam_dunk_tv_op_01_video,slam_dunk_tv_op_01_audio)

######## Trim ########

slam_dunk_tv_op_01_kamakura_koukou_mae_station=Trim(slam_dunk_tv_op_01,1629,1831)

######## Combine ########

# seishun_buta_yarou_season_01_op 0
# slam_dunk_tv_op_01 6288



kamakura_koukou_mae_station=AudioDub(seishun_buta_yarou_season_01_08_kamakura_koukou_mae_station,slam_dunk_tv_op_01_kamakura_koukou_mae_station)
kamakura_koukou_mae_station_audio=FadeOut0(FadeIn0(Normalize(kamakura_koukou_mae_station),2),8)
kamakura_koukou_mae_station=AudioDub(kamakura_koukou_mae_station,kamakura_koukou_mae_station_audio)
kamakura_koukou_mae_station=MergeChannels(kamakura_koukou_mae_station,kamakura_koukou_mae_station)
kamakura_koukou_mae_station

#ConvertAudioTo8bit()
#ConvertAudioTo16bit()
ConvertAudioTo24bit()
#ConvertAudioTo32bit()
#ConvertAudioToFloat()

TRIM_FIRST_CLIP(seishun_buta_yarou_season_01_op,6288)++last

######## Post Processing ########

#ConvertToRGB24(matrix="Rec709")
#ConvertToYUY2()

TCPServer(22051)
