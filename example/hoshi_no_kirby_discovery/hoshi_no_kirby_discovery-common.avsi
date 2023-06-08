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



######## Function ########

function FRAME_RATE_0_5X(clip clip){
	return SelectEvery(clip,2,0)
}

######## YouTube ########

function KIRBY_DISCOVERY_THEME_SONG_MP4_REF_SOURCE(){
	kirby_discovery_theme_song_mp4_ref=SSRC(FFmpegSource2("src\fan\【星のカービィ　ディスカバリー】OP　ED　真ED【NEWWORLD】.720p.mp4",atrack=-1,threads=1),48000)
	return kirby_discovery_theme_song_mp4_ref
}

function KIRBY_DISCOVERY_THEME_SONG_MP4_SOURCE(){
	kirby_discovery_theme_song_mp4_video=FFVideoSource("src\fan\【星のカービィ　ディスカバリー】OP　ED　真ED【NEWWORLD】.DASH-720p.mp4",threads=1,seekmode=-1)
	kirby_discovery_theme_song_mp4_audio=FFAudioSource("src\fan\【星のカービィ　ディスカバリー】OP　ED　真ED【NEWWORLD】.DASH-128k.m4a")
	kirby_discovery_theme_song_mp4=AudioDub(kirby_discovery_theme_song_mp4_video,kirby_discovery_theme_song_mp4_audio)
	kirby_discovery_theme_song_mp4=SSRC(kirby_discovery_theme_song_mp4,48000)
	return kirby_discovery_theme_song_mp4
}

kirby_discovery_theme_song=KIRBY_DISCOVERY_THEME_SONG_MP4_REF_SOURCE()
#kirby_discovery_theme_song=KIRBY_DISCOVERY_THEME_SONG_MP4_SOURCE()



function KIRBY_DISCOVERY_TRACK_75_MP4_REF_SOURCE(){
	kirby_discovery_track_75_mp4_ref=SSRC(FFmpegSource2("src\fan\[星のカービィ ディスカバリー] メインテーマ『WELCOME TO THE NEW WORLD!(Full)』の歌詞の英語変換＆カタカナ読みをつけてみた！.720p.mp4",atrack=-1,threads=1),48000)
	return kirby_discovery_track_75_mp4_ref
}

function KIRBY_DISCOVERY_TRACK_75_MP4_SOURCE(){
	kirby_discovery_track_75_mp4_video=FFVideoSource("src\fan\[星のカービィ ディスカバリー] メインテーマ『WELCOME TO THE NEW WORLD!(Full)』の歌詞の英語変換＆カタカナ読みをつけてみた！.DASH-1080p60.mp4",fpsnum=60,fpsden=1,threads=1,seekmode=-1)
	kirby_discovery_track_75_mp4_audio=FFAudioSource("src\fan\[星のカービィ ディスカバリー] メインテーマ『WELCOME TO THE NEW WORLD!(Full)』の歌詞の英語変換＆カタカナ読みをつけてみた！.DASH-128k.m4a")
	kirby_discovery_track_75_mp4=AudioDub(kirby_discovery_track_75_mp4_video,kirby_discovery_track_75_mp4_audio)
	kirby_discovery_track_75_mp4=SSRC(kirby_discovery_track_75_mp4,48000)
	return kirby_discovery_track_75_mp4
}

kirby_discovery_track_75=KIRBY_DISCOVERY_TRACK_75_MP4_REF_SOURCE()
#kirby_discovery_track_75=KIRBY_DISCOVERY_TRACK_75_MP4_SOURCE()

######## Trim ########

# caution: FFMS2 2.21 frame accuracy is broken

kirby_discovery_theme_song_op=Trim(kirby_discovery_theme_song,14,2854) #2841
kirby_discovery_theme_song_ed01=Trim(kirby_discovery_theme_song,2944,9275) #6332
kirby_discovery_theme_song_ed02=Trim(kirby_discovery_theme_song,9362,15699) #6338



op_music_start=329

kirby_discovery_theme_song_op_00=Trim(kirby_discovery_theme_song_op,0,-op_music_start)
kirby_discovery_theme_song_op_01=Trim(kirby_discovery_theme_song_op,op_music_start,0)



is_60p=false

!is_60p?Eval("""
# 30p
kirby_discovery_theme_song_ed03=Trim(kirby_discovery_theme_song,17472,17800)
"""):Eval("""
# 60p
kirby_discovery_theme_song_ed03=Trim(kirby_discovery_theme_song,17472,17800)
""")
