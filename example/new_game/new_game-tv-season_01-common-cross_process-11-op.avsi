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



######## TV (1920*1080) ########

new_game_tv_season_01_11=FFMS2_VIDEO_SOURCE("src\anime\season_01\(2016Q3) NEW GAME! 第11話 「リーク画像が昨日、ネットに出てましたよ！」 (AT-X 1280x720 x264 AAC).mp4")

new_game_tv_season_01_11_fairies_story_3_op_trademark=Trim(new_game_tv_season_01_11,3393,3499)
new_game_tv_season_01_11_fairies_story_3_op=Trim(new_game_tv_season_01_11,3500,5658)
