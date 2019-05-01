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

function FRAME_RATE_2X(clip clip,bool enable){
	return enable?SelectEvery(clip,1,0,0):clip
}

######## PS4 (2560*1440 60p) ########

function CRYSTAR_OP_MP4_REF_SOURCE(){
	crystar_op_mp4_ref=SSRC(FFmpegSource2("src\crystar-asset\movie\official\movie\【CRYSTAR -クライスタ-】オープニングムービー.720p.mp4",atrack=-1,threads=1),48000)
	return crystar_op_mp4_ref
}

function CRYSTAR_OP_MP4_SOURCE(bool is_60p){
	crystar_op_mp4_video=is_60p?FFVideoSource("src\crystar-asset\movie\official\movie\【CRYSTAR -クライスタ-】オープニングムービー.DASH-1080p60.mp4",fpsnum=60,fpsden=1,threads=1,seekmode=-1) \
		:FFVideoSource("src\crystar-asset\movie\official\movie\【CRYSTAR -クライスタ-】オープニングムービー.DASH-1080p.mp4",threads=1,seekmode=-1)

	crystar_op_mp4_audio=SSRC(FFAudioSource("src\crystar-asset\movie\official\movie\【CRYSTAR -クライスタ-】オープニングムービー.DASH-128k.m4a"),48000)
	crystar_op_mp4=AudioDub(crystar_op_mp4_video,crystar_op_mp4_audio)
	return crystar_op_mp4
}

function CRYSTAR_OP_WEBM_SOURCE(bool is_60p){
	crystar_op_webm_video_1440p60_path="src\crystar-asset\movie\official\movie\【CRYSTAR -クライスタ-】オープニングムービー.DASH-1440p60.webm"
	crystar_op_webm_video_1440p30_path="src\crystar-asset\movie\official\movie\【CRYSTAR -クライスタ-】オープニングムービー.DASH-1440p.webm"

	# FFMS2 cannot decode VP9 as AVC
	#crystar_op_webm_video=is_60p?FFVideoSource(crystar_op_webm_video_1440p60_path,fpsnum=60,fpsden=1,threads=1,seekmode=-1) \
	#	:FFVideoSource(crystar_op_webm_video_1440p30_path,fpsnum=30,fpsden=1,threads=1,seekmode=-1)
	crystar_op_webm_video=is_60p?ASSUME_60P(DirectShowSource(crystar_op_webm_video_1440p60_path,seekzero=true)) \
		:ASSUME_30P(DirectShowSource(crystar_op_webm_video_1440p30_path,seekzero=true))
	crystar_op_webm_video=Loop(crystar_op_webm_video,2,0,0)

	#crystar_op_webm_audio=FFAudioSource("src\crystar-asset\movie\official\movie\【CRYSTAR -クライスタ-】オープニングムービー.DASH-160k.webm")
	crystar_op_webm_audio=SSRC(FFAudioSource("src\crystar-asset\movie\official\movie\【CRYSTAR -クライスタ-】オープニングムービー.DASH-128k.m4a"),48000)
	crystar_op_webm=AudioDub(crystar_op_webm_video,crystar_op_webm_audio)
	return crystar_op_webm
}

#crystar_op=CRYSTAR_OP_MP4_REF_SOURCE()
#crystar_op=CRYSTAR_OP_MP4_SOURCE(is_60p)
crystar_op=CRYSTAR_OP_WEBM_SOURCE(is_60p)



function CRYSTAR_PROMOTION_MOVIE_MP4_REF_SOURCE(){
	crystar_promotion_movie_ref=SSRC(FFmpegSource2("src\crystar-asset\movie\official\movie\【CRYSTAR -クライスタ-】プロモーションムービー.720p.mp4",atrack=-1,threads=1),48000)
	return crystar_promotion_movie_ref
}

function CRYSTAR_PROMOTION_MOVIE_MP4_SOURCE(bool is_60p){
	crystar_promotion_movie_mp4_video=is_60p?FFVideoSource("src\crystar-asset\movie\official\movie\【CRYSTAR -クライスタ-】プロモーションムービー.DASH-1080p60.mp4",fpsnum=60,fpsden=1,threads=1,seekmode=-1) \
		:FFVideoSource("src\crystar-asset\movie\official\movie\【CRYSTAR -クライスタ-】プロモーションムービー.DASH-1080p.mp4",threads=1,seekmode=-1)

	crystar_promotion_movie_mp4_audio=SSRC(FFAudioSource("src\crystar-asset\movie\official\movie\【CRYSTAR -クライスタ-】プロモーションムービー.DASH-128k.m4a"),48000)
	crystar_promotion_movie_mp4=AudioDub(crystar_promotion_movie_mp4_video,crystar_promotion_movie_mp4_audio)
	return crystar_promotion_movie_mp4
}

function CRYSTAR_PROMOTION_MOVIE_WEBM_SOURCE(bool is_60p){
	crystar_promotion_movie_webm_video_1440p60_path="src\crystar-asset\movie\official\movie\【CRYSTAR -クライスタ-】プロモーションムービー.DASH-1440p60.webm"
	crystar_promotion_movie_webm_video_1440p30_path="src\crystar-asset\movie\official\movie\【CRYSTAR -クライスタ-】プロモーションムービー.DASH-1440p.webm"

	# FFMS2 cannot decode VP9 as AVC
	#crystar_promotion_movie_webm_video=is_60p?FFVideoSource(crystar_promotion_movie_webm_video_1440p60_path,fpsnum=60,fpsden=1,threads=1,seekmode=-1) \
	#	:FFVideoSource(crystar_promotion_movie_webm_video_1440p30_path,fpsnum=30,fpsden=1,threads=1,seekmode=-1)
	crystar_promotion_movie_webm_video=is_60p?ASSUME_60P(DirectShowSource(crystar_promotion_movie_webm_video_1440p60_path,seekzero=true)) \
		:ASSUME_30P(DirectShowSource(crystar_promotion_movie_webm_video_1440p30_path,seekzero=true))
	crystar_promotion_movie_webm_video=Loop(crystar_promotion_movie_webm_video,2,0,0)

	#crystar_promotion_movie_webm_audio=FFAudioSource("src\crystar-asset\movie\official\movie\【CRYSTAR -クライスタ-】プロモーションムービー.DASH-160k.webm")
	crystar_promotion_movie_webm_audio=SSRC(FFAudioSource("src\crystar-asset\movie\official\movie\【CRYSTAR -クライスタ-】プロモーションムービー.DASH-128k.m4a"),48000)
	crystar_promotion_movie_webm=AudioDub(crystar_promotion_movie_webm_video,crystar_promotion_movie_webm_audio)
	return crystar_promotion_movie_webm
}

#crystar_promotion_movie=CRYSTAR_PROMOTION_MOVIE_MP4_REF_SOURCE()
#crystar_promotion_movie_cache02=crystar_promotion_movie
#crystar_promotion_movie_cache03=CRYSTAR_PROMOTION_MOVIE_MP4_REF_SOURCE()
#crystar_promotion_movie_cache04=crystar_promotion_movie

#crystar_promotion_movie=CRYSTAR_PROMOTION_MOVIE_MP4_SOURCE(is_60p)
#crystar_promotion_movie_cache02=CRYSTAR_PROMOTION_MOVIE_MP4_SOURCE(is_60p)
#crystar_promotion_movie_cache03=CRYSTAR_PROMOTION_MOVIE_MP4_SOURCE(is_60p)
#crystar_promotion_movie_cache04=CRYSTAR_PROMOTION_MOVIE_MP4_SOURCE(is_60p)

crystar_promotion_movie=CRYSTAR_PROMOTION_MOVIE_WEBM_SOURCE(is_60p)
crystar_promotion_movie_cache02=CRYSTAR_PROMOTION_MOVIE_WEBM_SOURCE(is_60p)
crystar_promotion_movie_cache03=CRYSTAR_PROMOTION_MOVIE_WEBM_SOURCE(is_60p)
crystar_promotion_movie_cache04=CRYSTAR_PROMOTION_MOVIE_WEBM_SOURCE(is_60p)

######## PS4 (1920*1080 30p) ########

function CRYSTAR_TEASER_MOVIE_MP4_REF_SOURCE(){
	crystar_teaser_movie=FFmpegSource2("src\crystar-asset\movie\official\movie\【CRYSTAR -クライスタ-】ティザームービー.720p.mp4",atrack=-1,fpsnum=30000,fpsden=1001,threads=1)
	crystar_teaser_movie=SSRC(ASSUME_30P(crystar_teaser_movie),48000)
	return crystar_teaser_movie
}

function CRYSTAR_TEASER_MOVIE_MP4_SOURCE(){
	crystar_teaser_movie_video=FFVideoSource("src\crystar-asset\movie\official\movie\【CRYSTAR -クライスタ-】ティザームービー.DASH-1080p.mp4",fpsnum=30000,fpsden=1001,threads=1,seekmode=-1)
	crystar_teaser_movie_audio=FFAudioSource("src\crystar-asset\movie\official\movie\【CRYSTAR -クライスタ-】ティザームービー.DASH-128k.m4a")
	crystar_teaser_movie=SSRC(ASSUME_30P(AudioDub(crystar_teaser_movie_video,crystar_teaser_movie_audio)),48000)
	return crystar_teaser_movie
}

#crystar_teaser_movie=CRYSTAR_TEASER_MOVIE_MP4_REF_SOURCE()
crystar_teaser_movie=CRYSTAR_TEASER_MOVIE_MP4_SOURCE()

######## Wallpaper (1920*1200) ########

crystar_wallpaper=AUDIO_DUB_TONE(ImageSource("src\crystar-asset\wallpaper\wallpaper.png",0,118,30.0,pixel_type="rgb24"),samplerate=48000,channels=2,type="Silence")
crystar_wallpaper=Crop(crystar_wallpaper,0,1200-1080,0,0)

######## Trim ########

# caution: FFMS2 2.21 frame accuracy is broken



is_60p?Eval("""
# 60p
crystar_op_01=Trim(crystar_op,0,388) #389
crystar_op_02_title=Trim(crystar_op,389,936) #548
crystar_op_03=Trim(crystar_op,937,1561) #625
crystar_op_04=Trim(crystar_op,1562,3663) #2102
crystar_op_05=Trim(crystar_op,3664,4350) #687
crystar_op_06=Trim(crystar_op,4351,5233) #883
crystar_op_07=Trim(crystar_op,5234,5748) #515
#crystar_op_post=Trim(crystar_op,5749,0)
"""):Eval("""
# 30p
crystar_op_01=Trim(crystar_op,0,194) #195
crystar_op_02_title=Trim(crystar_op,195,468) #274
crystar_op_03=Trim(crystar_op,469,780) #312
crystar_op_04=Trim(crystar_op,781,1831) #1051
crystar_op_05=Trim(crystar_op,1832,2175) #344
crystar_op_06=Trim(crystar_op,2176,2616) #441
crystar_op_07=Trim(crystar_op,2617,2874) #258
#crystar_op_post=Trim(crystar_op,2875,0)
""")



is_60p?Eval("""
# 60p
crystar_promotion_movie_01=Trim(crystar_promotion_movie_cache02,0,264) #265 op
crystar_promotion_movie_02=Trim(crystar_promotion_movie,265,888) #624 op
crystar_promotion_movie_03_op=Trim(crystar_promotion_movie,889,3717) #2829 x
crystar_promotion_movie_04_character=Trim(crystar_promotion_movie,3718,5989) #2272 op
crystar_promotion_movie_05_pencil=Trim(crystar_promotion_movie,5990,6310) #321
crystar_promotion_movie_06_animation=Trim(crystar_promotion_movie_cache02,6311,6556) #246 op
crystar_promotion_movie_07_pencil=Trim(crystar_promotion_movie,6557,6686) #130
crystar_promotion_movie_08_animation=Trim(crystar_promotion_movie_cache02,6687,6990) #304 op
crystar_promotion_movie_09_dialog=Trim(crystar_promotion_movie,6991,7069) #79
crystar_promotion_movie_10_rei_cry=Trim(crystar_promotion_movie,7070,7179) #110 op
crystar_promotion_movie_11_game=Trim(crystar_promotion_movie,7180,7353) #174 op
crystar_promotion_movie_12_pencil=Trim(crystar_promotion_movie,7354,7577) #224
crystar_promotion_movie_13_dialog=Trim(crystar_promotion_movie_cache02,7578,7891) #314 op
crystar_promotion_movie_14_rei_cry=Trim(crystar_promotion_movie_cache02,7892,8060) #169 op
crystar_promotion_movie_15_character=Trim(crystar_promotion_movie,8061,9117) #1057 op
crystar_promotion_movie_16_rei_hear_music=Trim(crystar_promotion_movie,9118,9185) #68 op
crystar_promotion_movie_17_animation=Trim(crystar_promotion_movie,9186,9633) #448 op
crystar_promotion_movie_18_game=Trim(crystar_promotion_movie,9634,10212) #579 op
crystar_promotion_movie_19_game=Trim(crystar_promotion_movie,10213,10730) #518 op
crystar_promotion_movie_20_animation=Trim(crystar_promotion_movie_cache03,10731,12132) #1402 op
crystar_promotion_movie_21_title=Trim(crystar_promotion_movie,12133,12888) #756 x
crystar_promotion_movie_22_rei_cry=Trim(crystar_promotion_movie,12889,13459) #571
crystar_promotion_movie_23_slogan=Trim(crystar_promotion_movie_cache04,13460,13653) #194 op
crystar_promotion_movie_24_pencil=Trim(crystar_promotion_movie,13654,13893) #240
crystar_promotion_movie_25_white=Trim(crystar_promotion_movie,13894,13971) #78 x
crystar_promotion_movie_26_gemdrops=Trim(crystar_promotion_movie,13972,14050) #79
crystar_promotion_movie_27_furyu=Trim(crystar_promotion_movie,14051,14168) #118 op ed
#crystar_promotion_movie_post=Trim(crystar_promotion_movie,14169,0)
"""):Eval("""
# 30p
crystar_promotion_movie_01=Trim(crystar_promotion_movie_cache02,0,132) #133 op
crystar_promotion_movie_02=Trim(crystar_promotion_movie,133,444) #312 op
crystar_promotion_movie_03_op=Trim(crystar_promotion_movie,445,1858) #1414 x
crystar_promotion_movie_04_character=Trim(crystar_promotion_movie,1859,2994) #1136 op
crystar_promotion_movie_05_pencil=Trim(crystar_promotion_movie,2995,3155) #161
crystar_promotion_movie_06_animation=Trim(crystar_promotion_movie_cache02,3156,3278) #123 op
crystar_promotion_movie_07_pencil=Trim(crystar_promotion_movie,3279,3343) #65
crystar_promotion_movie_08_animation=Trim(crystar_promotion_movie_cache02,3344,3495) #152 op
crystar_promotion_movie_09_dialog=Trim(crystar_promotion_movie,3496,3534) #39
crystar_promotion_movie_10_rei_cry=Trim(crystar_promotion_movie,3535,3589) #55 op
crystar_promotion_movie_11_game=Trim(crystar_promotion_movie,3590,3676) #87 op
crystar_promotion_movie_12_pencil=Trim(crystar_promotion_movie,3677,3788) #112
crystar_promotion_movie_13_dialog=Trim(crystar_promotion_movie_cache02,3789,3945) #157 op
crystar_promotion_movie_14_rei_cry=Trim(crystar_promotion_movie_cache02,3946,4030) #85 op
crystar_promotion_movie_15_character=Trim(crystar_promotion_movie,4031,4558) #528 op
crystar_promotion_movie_16_rei_hear_music=Trim(crystar_promotion_movie,4559,4592) #34 op
crystar_promotion_movie_17_animation=Trim(crystar_promotion_movie,4593,4816) #224 op
crystar_promotion_movie_18_game=Trim(crystar_promotion_movie,4817,5106) #290 op
crystar_promotion_movie_19_game=Trim(crystar_promotion_movie,5107,5365) #259 op
crystar_promotion_movie_20_animation=Trim(crystar_promotion_movie_cache03,5366,6066) #701 op
crystar_promotion_movie_21_title=Trim(crystar_promotion_movie,6067,6444) #378 x
crystar_promotion_movie_22_rei_cry=Trim(crystar_promotion_movie,6445,6729) #285
crystar_promotion_movie_23_slogan=Trim(crystar_promotion_movie_cache04,6730,6826) #97 op
crystar_promotion_movie_24_pencil=Trim(crystar_promotion_movie,6827,6946) #120
crystar_promotion_movie_25_white=Trim(crystar_promotion_movie,6947,6985) #39 x
crystar_promotion_movie_26_gemdrops=Trim(crystar_promotion_movie,6986,7025) #40
crystar_promotion_movie_27_furyu=Trim(crystar_promotion_movie,7026,7084) #59 op ed
#crystar_promotion_movie_post=Trim(crystar_promotion_movie,7085,0)
""")



# 30p
crystar_teaser_movie_01=Trim(crystar_teaser_movie,0,546) #547
crystar_teaser_movie_02_op=Trim(crystar_teaser_movie,547,1474) #928 x
crystar_teaser_movie_03=Trim(crystar_teaser_movie,1475,2098) #624 op
crystar_teaser_movie_04_title=Trim(crystar_teaser_movie,2099,2388) #290 x
crystar_teaser_movie_05_rei_cry=Trim(crystar_teaser_movie,2389,2525) #137 x
crystar_teaser_movie_06_slogan=Trim(crystar_teaser_movie,2526,2640) #115 x
crystar_teaser_movie_07_furyu=Trim(crystar_teaser_movie,2641,2699) #59 x
#crystar_teaser_movie_post=Trim(crystar_teaser_movie,2700,0)
