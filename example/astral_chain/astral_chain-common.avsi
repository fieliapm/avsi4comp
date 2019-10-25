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



######## Game (1920*1080) ########

function ASTRAL_CHAIN_OP_MP4_REF_SOURCE(){
	astral_chain_op_mp4_ref=SSRC(FFmpegSource2("src\astral_chain-movie\youtube\opening\Astral Chain - Opening.720p.mp4",atrack=-1,threads=1),48000)
	return Lanczos4Resize(astral_chain_op_mp4_ref,1280,720)
}

function ASTRAL_CHAIN_OP_MP4_SOURCE(){
	astral_chain_op_mp4_video=FFVideoSource("src\astral_chain-movie\youtube\opening\Astral Chain - Opening.DASH-1080p.mp4",threads=1,seekmode=-1)
	astral_chain_op_mp4_audio=SSRC(FFAudioSource("src\astral_chain-movie\youtube\opening\Astral Chain - Opening.DASH-128k.m4a"),48000)
	astral_chain_op_mp4=AudioDub(astral_chain_op_mp4_video,astral_chain_op_mp4_audio)
	return astral_chain_op_mp4
}

#astral_chain_op=ASTRAL_CHAIN_OP_MP4_REF_SOURCE()
#astral_chain_op_cache02=astral_chain_op

astral_chain_op=ASTRAL_CHAIN_OP_MP4_SOURCE()
astral_chain_op_cache02=ASTRAL_CHAIN_OP_MP4_SOURCE()



function ASTRAL_CHAIN_INTRODUCTION_MP4_REF_SOURCE(){
	astral_chain_introduction_mp4_ref=SSRC(FFmpegSource2("src\astral_chain-movie\official\movie\ASTRAL CHAIN（アストラルチェイン） 紹介映像.720p.mp4",atrack=-1,fpsnum=30000,fpsden=1001,threads=1),48000)
	return Lanczos4Resize(astral_chain_introduction_mp4_ref,1280,720)
}

function ASTRAL_CHAIN_INTRODUCTION_MP4_SOURCE(){
	astral_chain_introduction_mp4_video=FFVideoSource("src\astral_chain-movie\official\movie\ASTRAL CHAIN（アストラルチェイン） 紹介映像.DASH-1080p.mp4",fpsnum=30000,fpsden=1001,threads=1,seekmode=-1)
	astral_chain_introduction_mp4_audio=SSRC(FFAudioSource("src\astral_chain-movie\official\movie\ASTRAL CHAIN（アストラルチェイン） 紹介映像.DASH-128k.m4a"),48000)
	astral_chain_introduction_mp4=AudioDub(astral_chain_introduction_mp4_video,astral_chain_introduction_mp4_audio)
	return astral_chain_introduction_mp4
}

#astral_chain_introduction=ASTRAL_CHAIN_INTRODUCTION_MP4_REF_SOURCE()
#astral_chain_introduction_cache02=astral_chain_introduction

astral_chain_introduction=ASTRAL_CHAIN_INTRODUCTION_MP4_SOURCE()
astral_chain_introduction_cache02=ASTRAL_CHAIN_INTRODUCTION_MP4_SOURCE()



function ASTRAL_CHAIN_CM_MP4_REF_SOURCE(){
	astral_chain_cm_mp4_ref=SSRC(FFmpegSource2("src\astral_chain-movie\official\movie\ASTRAL CHAIN（アストラルチェイン） CM.720p.mp4",atrack=-1,fpsnum=30000,fpsden=1001,threads=1),48000)
	return Lanczos4Resize(astral_chain_cm_mp4_ref,1280,720)
}

function ASTRAL_CHAIN_CM_MP4_SOURCE(){
	astral_chain_cm_mp4_video=FFVideoSource("src\astral_chain-movie\official\movie\ASTRAL CHAIN（アストラルチェイン） CM.DASH-1080p.mp4",fpsnum=30000,fpsden=1001,threads=1,seekmode=-1)
	astral_chain_cm_mp4_audio=SSRC(FFAudioSource("src\astral_chain-movie\official\movie\ASTRAL CHAIN（アストラルチェイン） CM.DASH-128k.m4a"),48000)
	astral_chain_cm_mp4=AudioDub(astral_chain_cm_mp4_video,astral_chain_cm_mp4_audio)
	return astral_chain_cm_mp4
}

#astral_chain_cm=ASTRAL_CHAIN_CM_MP4_REF_SOURCE()
#astral_chain_cm_cache02=astral_chain_cm

astral_chain_cm=ASTRAL_CHAIN_CM_MP4_SOURCE()
astral_chain_cm_cache02=ASTRAL_CHAIN_CM_MP4_SOURCE()

######## Trim ########

op_music_start=32

#697
astral_chain_op_00=Trim(astral_chain_op_cache02,0,op_music_start-1) #32
astral_chain_op_01=Trim(astral_chain_op,op_music_start,696) #665

astral_chain_op_02=Trim(astral_chain_op,697,1389) #693
astral_chain_op_03=Trim(astral_chain_op,1390,1988) #599
astral_chain_op_04=Trim(astral_chain_op,1989,2726) #738
#astral_chain_op_post=Trim(astral_chain_op,2727,0) #359

astral_chain_introduction_prologue_01=Trim(astral_chain_introduction,50,193) #144
astral_chain_introduction_prologue_02=Trim(astral_chain_introduction,194,827) #634 op
astral_chain_introduction_scene=Trim(astral_chain_introduction_cache02,844,1033) #190 op
astral_chain_introduction_legion=Trim(astral_chain_introduction_cache02,1034,1314) #281 op
astral_chain_introduction_op_01=Trim(astral_chain_introduction,12900,14129) #1230 op
astral_chain_introduction_op_02=Trim(astral_chain_introduction,14130,14164) #35
astral_chain_introduction_op_03=Trim(astral_chain_introduction,14165,14278) #114
astral_chain_introduction_op_04=Trim(astral_chain_introduction,14279,14385) #107 op

#astral_chain_cm_pre=Trim(astral_chain_cm,0,49)
astral_chain_cm_01_legion=Trim(astral_chain_cm_cache02,50,477) #428 op
astral_chain_cm_02=Trim(astral_chain_cm,478,1052) #575 op
astral_chain_cm_03=Trim(astral_chain_cm,1053,1108) #56 op
astral_chain_cm_04=Trim(astral_chain_cm,1109,1449) #341 op
astral_chain_cm_05=Trim(astral_chain_cm,1450,1492) #43 op
astral_chain_cm_06_title=Trim(astral_chain_cm,1493,1684)
#astral_chain_cm_post=Trim(astral_chain_cm,1685,0)
