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

######## Function ########

global yuru_cub_width=1280
global yuru_cub_height=720
global yuru_cub_framerate=24000.0/1001.0



function SCALE_CG(clip cg,float center_x,float center_y,float scale_start,float scale_end){
	cg_frame_count=Framecount(cg)

	return ScriptClip(cg,"FAST_ZOOM(srcx="+String(center_x)+",srcy="+String(center_y)+",dstx="+String(center_x)+",dsty="+String(center_y)+",factor=Spline(current_frame,0,"+String(scale_start)+","+String(cg_frame_count)+","+String(scale_end)+"))")
}

function MOVE_CG(clip cg,int dir_x,int dir_y,float move_offset,float scale){
	cg_frame_count=Framecount(cg)
	cg_width_half=Width(cg)/2
	cg_height_half=Height(cg)/2
	move_offset_half=move_offset*0.5

	return ScriptClip(cg,"FAST_ZOOM(dstx=Spline(current_frame,0,"+String(cg_width_half)+"-("+String(move_offset_half)+"*("+String(dir_x)+")),"+String(cg_frame_count)+","+String(cg_width_half)+"+("+String(move_offset_half)+"*("+String(dir_x)+")),cubic=false)," \
		+"dsty=Spline(current_frame,0,"+String(cg_height_half)+"-("+String(move_offset_half)+"*("+String(dir_y)+")),"+String(cg_frame_count)+","+String(cg_height_half)+"+("+String(move_offset_half)+"*("+String(dir_y)+")),cubic=false),factor="+String(scale)+",extend=true)")
}

function SCALE_COMIC(clip cg,float center_x,float center_y,float scale_start,float scale_end){
	return FAST_ZOOM(SCALE_CG(cg,center_x,center_y,scale_start,scale_end),factor=Float(yuru_cub_width)/Width(cg),width=yuru_cub_width,height=yuru_cub_height)
}

function MOVE_COMIC(clip cg,int dir_x,int dir_y,float move_offset,float scale){
	return FAST_ZOOM(MOVE_CG(cg,dir_x,dir_y,move_offset,scale),factor=Float(yuru_cub_width)/906.0,width=yuru_cub_width,height=yuru_cub_height)
}

######## Comic ########

yuru_cub_densetsu_01=ImageSource("src\yuru_cub_densetsu\1-E2Tva-SVoAwTMk3.jpg",0,153,yuru_cub_framerate,pixel_type="rgb24")
yuru_cub_densetsu_02=ImageSource("src\yuru_cub_densetsu\2-E2TvcZyUUAI4vyA.jpg",0,153,yuru_cub_framerate,pixel_type="rgb24")
yuru_cub_densetsu_03=ImageSource("src\yuru_cub_densetsu\3-E2TvdJbVcAIjcKm.jpg",0,153,yuru_cub_framerate,pixel_type="rgb24")
yuru_cub_densetsu_04=ImageSource("src\yuru_cub_densetsu\4-E2TvdykVIAUQpsl.jpg",0,153,yuru_cub_framerate,pixel_type="rgb24")
yuru_cub_densetsu_05=ImageSource("src\yuru_cub_densetsu\5-E2Tv6eIVUAEzAcD.jpg",0,153,yuru_cub_framerate,pixel_type="rgb24")
yuru_cub_densetsu_06=ImageSource("src\yuru_cub_densetsu\6-E2Tv7SoVgAMkdGr.jpg",0,153,yuru_cub_framerate,pixel_type="rgb24")
yuru_cub_densetsu_07=ImageSource("src\yuru_cub_densetsu\7-E2Tv766VEAA-is1.jpg",0,153,yuru_cub_framerate,pixel_type="rgb24")
yuru_cub_densetsu_08=ImageSource("src\yuru_cub_densetsu\8-E2Tv8mtVcAIpBBc.jpg",0,153,yuru_cub_framerate,pixel_type="rgb24")
yuru_cub_densetsu_title=ImageSource("src\yuru_cub_densetsu\9-E2TwEGYVgAUuLRb.jpg",0,24*6,yuru_cub_framerate,pixel_type="rgb24")

######## Pre Combine ########

yuru_cub_densetsu_01=MOVE_COMIC(yuru_cub_densetsu_01,0,-1,750,1.0)
yuru_cub_densetsu_02=MOVE_COMIC(yuru_cub_densetsu_02,0,-1,750,1.0)
yuru_cub_densetsu_03=MOVE_COMIC(yuru_cub_densetsu_03,0,-1,750,1.0)
yuru_cub_densetsu_04=MOVE_COMIC(yuru_cub_densetsu_04,0,-1,750,1.0)
yuru_cub_densetsu_05=MOVE_COMIC(yuru_cub_densetsu_05,0,-1,750,1.0)
yuru_cub_densetsu_06=MOVE_COMIC(yuru_cub_densetsu_06,0,-1,750,1.0)
yuru_cub_densetsu_07=MOVE_COMIC(yuru_cub_densetsu_07,0,-1,750,1.0)
yuru_cub_densetsu_08=MOVE_COMIC(yuru_cub_densetsu_08,0,-1,750,1.0)
yuru_cub_densetsu_title=SCALE_COMIC(yuru_cub_densetsu_title,640,360,1.2,1.0)

######## Combine ########

#yuru_cub_densetsu=yuru_cub_densetsu_01+yuru_cub_densetsu_02+yuru_cub_densetsu_03+yuru_cub_densetsu_04+yuru_cub_densetsu_05+yuru_cub_densetsu_06+yuru_cub_densetsu_07+yuru_cub_densetsu_08+yuru_cub_densetsu_title
#yuru_cub_densetsu=yuru_cub_densetsu+BlankClip(yuru_cub_densetsu,length=24*10,color=color_black)
yuru_cub_densetsu=yuru_cub_densetsu_02+yuru_cub_densetsu_07+yuru_cub_densetsu_title

######## Music ########

audio_clip=BlankClip(yuru_cub_densetsu,length=6301,color=color_black)

bgm_48khz=SSRC(WAVSource("src\01.‚Ü‚Ù‚¤‚Ì‚©‚º.wav"),48000)
audio_clip=AudioDub(audio_clip,bgm_48khz)



audio_clip=Trim(audio_clip,4677,-Framecount(yuru_cub_densetsu))
audio_clip=FadeOut0(audio_clip,24)
AudioDub(yuru_cub_densetsu,audio_clip)

######## Post Processing ########

#ConvertToRGB24()
#ConvertBackToYUY2(matrix="Rec709")
CONVERT_BACK_TO_YV12(matrix="Rec709")

#ConvertAudioTo8bit()
#ConvertAudioTo16bit()
ConvertAudioTo24bit()
#ConvertAudioTo32bit()
#ConvertAudioToFloat()

TCPServer()
