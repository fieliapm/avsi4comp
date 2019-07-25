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



function GENERATE_SCAN_MASK(clip ref_clip,int length){
	scan_width_division=16
	angle=30.0
	factor=1.76

	mask_head=BlankClip(ref_clip,length=length,width=subtitle_clip_width,height=subtitle_clip_height,pixel_type="RGB32",color=color_black)
	mask_body=StackHorizontal(BlankClip(ref_clip,length=length,width=subtitle_clip_width/scan_width_division,height=subtitle_clip_height,pixel_type="RGB32",color=color_white), \
		BlankClip(ref_clip,length=length,width=subtitle_clip_width/scan_width_division,height=subtitle_clip_height,pixel_type="RGB32",color=color_black))
	mask_tail=BlankClip(ref_clip,length=length,width=subtitle_clip_width,height=subtitle_clip_height,pixel_type="RGB32",color=color_white)
	mask_base=StackHorizontal(mask_head,mask_body,mask_body,mask_body,mask_tail)
	x_ratio=Cos(angle*Pi()/180.0)
	y_ratio=Sin(angle*Pi()/180.0)
	point_x_start=subtitle_clip_width/2+subtitle_clip_width*(scan_width_division/2+3)/scan_width_division*factor*x_ratio
	point_x_end=subtitle_clip_width/2-subtitle_clip_width*(scan_width_division/2+3)/scan_width_division*factor*x_ratio
	point_y_start=subtitle_clip_height/2+subtitle_clip_width*(scan_width_division/2+3)/scan_width_division*factor*y_ratio
	point_y_end=subtitle_clip_height/2-subtitle_clip_width*(scan_width_division/2+3)/scan_width_division*factor*y_ratio
	return Zoom(mask_base,dstx="Spline(n,0,"+String(point_x_start)+","+String(length)+","+String(point_x_end)+",cubic=false)",dsty="Spline(n,0,"+String(point_y_start)+","+String(length)+","+String(point_y_end)+",cubic=false)",factor=String(factor),angle=String(angle),width=subtitle_clip_width,height=subtitle_clip_height)
}

LoadPlugin("..\plugins\MaskTools.dll")

function SUBTITLE_FX_SCAN_IN_FADE_OUT_DOUBLE_HALO(clip clip,string text,int x,int y,int start_frame,int end_frame,int front_fade_count,int rear_fade_count,string "font",string "effects",int "size",int "text_color",int "halo_color",int "outside_halo_color",string "subtitle_mode"){
	before_start_frame=start_frame-front_fade_count
	after_end_frame=end_frame+rear_fade_count

	Assert(IsRGB32(clip),"SUBTITLE_FX_SCAN_IN_FADE_OUT_DOUBLE_HALO(): clip only support RGB32 format")

	subtitle_rgb=_SUBTITLE_FX_PRE_OPAQUE(clip,outside_halo_color,text,x,y,before_start_frame,after_end_frame,font,effects,size,text_color,halo_color,subtitle_mode)
	subtitle_rgba=ColorKeyMask(ResetMask(subtitle_rgb),outside_halo_color,0)

	subtitle_alpha=CONVERT_BACK_TO_YV12(ShowAlpha(subtitle_rgba),matrix="Rec709")
	subtitle_alpha=Expand(Expand(subtitle_alpha))
	subtitle_alpha=ConvertToRGB32(Greyscale(subtitle_alpha),matrix="Rec709")

	#scan_mask_extend=BlankClip(scan_mask,length=start_frame-Framecount(scan_mask),color=color_black)+scan_mask+BlankClip(scan_mask,length=Framecount(subtitle_rgba)-start_frame,color=color_white)
	scan_mask_extend=Loop(scan_mask,start_frame-Framecount(scan_mask)+1,0,0)

	subtitle_alpha_scan=Layer(subtitle_alpha,ResetMask(scan_mask_extend),"Mul")
	subtitle_alpha_scan=OVERWRITE_RANGE(subtitle_alpha,subtitle_alpha_scan,before_start_frame,start_frame-1)

	subtitle_rgba=Mask(subtitle_rgba,subtitle_alpha_scan)

	subtitle_rgba_faded_containing_parameter=ScriptClip(subtitle_rgba,"RGBAdjust(a=alpha_factor)")
	subtitle_rgba_faded=FrameEvaluate(subtitle_rgba_faded_containing_parameter,"alpha_factor=Spline(current_frame,"+String(before_start_frame-1)+",0.0,"+String(before_start_frame)+",1.0,"+String(end_frame)+",1.0,"+String(after_end_frame)+",0.0,cubic=false)")

	return _SUBTITLE_FX_POST(clip,subtitle_rgba_faded,before_start_frame,after_end_frame)
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
	crystar_promotion_movie_mp4_ref=SSRC(FFmpegSource2("src\crystar-asset\movie\official\movie\【CRYSTAR -クライスタ-】プロモーションムービー.720p.mp4",atrack=-1,threads=1),48000)
	return crystar_promotion_movie_mp4_ref
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
	crystar_teaser_movie_mp4_ref=FFmpegSource2("src\crystar-asset\movie\official\movie\【CRYSTAR -クライスタ-】ティザームービー.720p.mp4",atrack=-1,fpsnum=30000,fpsden=1001,threads=1)
	crystar_teaser_movie_mp4_ref=SSRC(ASSUME_30P(crystar_teaser_movie_mp4_ref),48000)
	return crystar_teaser_movie_mp4_ref
}

function CRYSTAR_TEASER_MOVIE_MP4_SOURCE(){
	crystar_teaser_movie_mp4_video=FFVideoSource("src\crystar-asset\movie\official\movie\【CRYSTAR -クライスタ-】ティザームービー.DASH-1080p.mp4",fpsnum=30000,fpsden=1001,threads=1,seekmode=-1)
	crystar_teaser_movie_mp4_audio=FFAudioSource("src\crystar-asset\movie\official\movie\【CRYSTAR -クライスタ-】ティザームービー.DASH-128k.m4a")
	crystar_teaser_movie_mp4=AudioDub(crystar_teaser_movie_mp4_video,crystar_teaser_movie_mp4_audio)
	crystar_teaser_movie_mp4=SSRC(ASSUME_30P(crystar_teaser_movie_mp4),48000)
	return crystar_teaser_movie_mp4
}

#crystar_teaser_movie=CRYSTAR_TEASER_MOVIE_MP4_REF_SOURCE()
crystar_teaser_movie=CRYSTAR_TEASER_MOVIE_MP4_SOURCE()

######## PS4 (1920*1080 60p) ########

function CRYSTAR_SYSTEM_KATHARSIS_MP4_REF_SOURCE(){
	crystar_system_katharsis_mp4_ref=SSRC(FFmpegSource2("src\crystar-asset\movie\official\system\system\【CRYSTAR -クライスタ-】泣いて強くなるカタルシス.720p.mp4",atrack=-1,threads=1),48000)
	return crystar_system_katharsis_mp4_ref
}

function CRYSTAR_SYSTEM_KATHARSIS_MP4_SOURCE(bool is_60p){
	crystar_system_katharsis_mp4_video=is_60p?FFVideoSource("src\crystar-asset\movie\official\system\system\【CRYSTAR -クライスタ-】泣いて強くなるカタルシス.DASH-1080p60.mp4",fpsnum=60,fpsden=1,threads=1,seekmode=-1) \
		:FFVideoSource("src\crystar-asset\movie\official\system\system\【CRYSTAR -クライスタ-】泣いて強くなるカタルシス.DASH-1080p.mp4",threads=1,seekmode=-1)

	crystar_system_katharsis_mp4_audio=SSRC(FFAudioSource("src\crystar-asset\movie\official\system\system\【CRYSTAR -クライスタ-】泣いて強くなるカタルシス.DASH-128k.m4a"),48000)
	crystar_system_katharsis_mp4=AudioDub(crystar_system_katharsis_mp4_video,crystar_system_katharsis_mp4_audio)
	return crystar_system_katharsis_mp4
}

#crystar_system_katharsis=CRYSTAR_SYSTEM_KATHARSIS_MP4_REF_SOURCE()
crystar_system_katharsis=CRYSTAR_SYSTEM_KATHARSIS_MP4_SOURCE(is_60p)



function CRYSTAR_SYSTEM_GUILT_MP4_REF_SOURCE(){
	crystar_system_guilt_mp4_ref=SSRC(FFmpegSource2("src\crystar-asset\movie\official\system\system\【CRYSTAR -クライスタ-】 業を抱える罪悪感.720p.mp4",atrack=-1,fpsnum=30000,fpsden=1001,threads=1),48000)
	crystar_system_guilt_mp4_ref=SSRC(ASSUME_30P(crystar_system_guilt_mp4_ref),48000)
	return crystar_system_guilt_mp4_ref
}

function CRYSTAR_SYSTEM_GUILT_MP4_SOURCE(bool is_60p){
	crystar_system_guilt_mp4_video=is_60p?FFVideoSource("src\crystar-asset\movie\official\system\system\【CRYSTAR -クライスタ-】 業を抱える罪悪感.DASH-1080p60.mp4",fpsnum=60000,fpsden=1001,threads=1,seekmode=-1) \
		:FFVideoSource("src\crystar-asset\movie\official\system\system\【CRYSTAR -クライスタ-】 業を抱える罪悪感.DASH-1080p.mp4",fpsnum=30000,fpsden=1001,threads=1,seekmode=-1)

	crystar_system_guilt_mp4_audio=FFAudioSource("src\crystar-asset\movie\official\system\system\【CRYSTAR -クライスタ-】 業を抱える罪悪感.DASH-128k.m4a")
	crystar_system_guilt_mp4=AudioDub(crystar_system_guilt_mp4_video,crystar_system_guilt_mp4_audio)

	crystar_system_guilt_mp4=SSRC(is_60p?ASSUME_60P(crystar_system_guilt_mp4):ASSUME_30P(crystar_system_guilt_mp4),48000)
	return crystar_system_guilt_mp4
}

#crystar_system_guilt=CRYSTAR_SYSTEM_GUILT_MP4_REF_SOURCE() #244 ed
crystar_system_guilt=CRYSTAR_SYSTEM_GUILT_MP4_SOURCE(is_60p) #244/489 ed



function CRYSTAR_SYSTEM_GUARDIAN_MP4_REF_SOURCE(){
	crystar_system_guardian_mp4_ref=SSRC(FFmpegSource2("src\crystar-asset\movie\official\system\system\【CRYSTAR -クライスタ-】守護者.720p.mp4",atrack=-1,fpsnum=30000,fpsden=1001,threads=1),48000)
	crystar_system_guardian_mp4_ref=SSRC(ASSUME_30P(crystar_system_guardian_mp4_ref),48000)
	return crystar_system_guardian_mp4_ref
}

function CRYSTAR_SYSTEM_GUARDIAN_MP4_SOURCE(bool is_60p){
	crystar_system_guardian_mp4_video=is_60p?FFVideoSource("src\crystar-asset\movie\official\system\system\【CRYSTAR -クライスタ-】守護者.DASH-1080p60.mp4",fpsnum=60000,fpsden=1001,threads=1,seekmode=-1) \
		:FFVideoSource("src\crystar-asset\movie\official\system\system\【CRYSTAR -クライスタ-】守護者.DASH-1080p.mp4",fpsnum=30000,fpsden=1001,threads=1,seekmode=-1)

	crystar_system_guardian_mp4_audio=FFAudioSource("src\crystar-asset\movie\official\system\system\【CRYSTAR -クライスタ-】守護者.DASH-128k.m4a")
	crystar_system_guardian_mp4=AudioDub(crystar_system_guardian_mp4_video,crystar_system_guardian_mp4_audio)

	crystar_system_guardian_mp4=SSRC(is_60p?ASSUME_60P(crystar_system_guardian_mp4):ASSUME_30P(crystar_system_guardian_mp4),48000)
	return crystar_system_guardian_mp4
}

#crystar_system_guardian=CRYSTAR_SYSTEM_GUARDIAN_MP4_REF_SOURCE() #518 ed
crystar_system_guardian=CRYSTAR_SYSTEM_GUARDIAN_MP4_SOURCE(is_60p) #518/1036 ed



function CRYSTAR_ACTION_REI_MP4_REF_SOURCE(){
	crystar_action_rei_mp4_ref=FFmpegSource2("src\crystar-asset\movie\official\system\action\【CRYSTAR -クライスタ-】零_アクションシーン.720p.mp4",atrack=-1,fpsnum=30000,fpsden=1001,threads=1)
	crystar_action_rei_mp4_ref=SSRC(ASSUME_30P(crystar_action_rei_mp4_ref),48000)
	return crystar_action_rei_mp4_ref
}

function CRYSTAR_ACTION_REI_MP4_SOURCE(bool is_60p){
	crystar_action_rei_mp4_video=is_60p?FFVideoSource("src\crystar-asset\movie\official\system\action\【CRYSTAR -クライスタ-】零_アクションシーン.DASH-1080p60.mp4",fpsnum=60000,fpsden=1001,threads=1,seekmode=-1) \
		:FFVideoSource("src\crystar-asset\movie\official\system\action\【CRYSTAR -クライスタ-】零_アクションシーン.DASH-1080p.mp4",fpsnum=30000,fpsden=1001,threads=1,seekmode=-1)

	crystar_action_rei_mp4_audio=FFAudioSource("src\crystar-asset\movie\official\system\action\【CRYSTAR -クライスタ-】零_アクションシーン.DASH-128k.m4a")
	crystar_action_rei_mp4=AudioDub(crystar_action_rei_mp4_video,crystar_action_rei_mp4_audio)

	crystar_action_rei_mp4=SSRC(is_60p?ASSUME_60P(crystar_action_rei_mp4):ASSUME_30P(crystar_action_rei_mp4),48000)
	return crystar_action_rei_mp4
}

#crystar_action_rei=CRYSTAR_ACTION_REI_MP4_REF_SOURCE() #440 ed
crystar_action_rei=CRYSTAR_ACTION_REI_MP4_SOURCE(is_60p) #440/881 ed



function CRYSTAR_ACTION_KOKORO_MP4_REF_SOURCE(){
	crystar_action_kokoro_mp4_ref=FFmpegSource2("src\crystar-asset\movie\official\system\action\【CRYSTAR -クライスタ-】小衣_アクションシーン.720p.mp4",atrack=-1,fpsnum=30000,fpsden=1001,threads=1)
	crystar_action_kokoro_mp4_ref=SSRC(ASSUME_30P(crystar_action_kokoro_mp4_ref),48000)
	return crystar_action_kokoro_mp4_ref
}

function CRYSTAR_ACTION_KOKORO_MP4_SOURCE(bool is_60p){
	crystar_action_kokoro_mp4_video=is_60p?FFVideoSource("src\crystar-asset\movie\official\system\action\【CRYSTAR -クライスタ-】小衣_アクションシーン.DASH-1080p60.mp4",fpsnum=60000,fpsden=1001,threads=1,seekmode=-1) \
		:FFVideoSource("src\crystar-asset\movie\official\system\action\【CRYSTAR -クライスタ-】小衣_アクションシーン.DASH-1080p.mp4",fpsnum=30000,fpsden=1001,threads=1,seekmode=-1)

	crystar_action_kokoro_mp4_audio=FFAudioSource("src\crystar-asset\movie\official\system\action\【CRYSTAR -クライスタ-】小衣_アクションシーン.DASH-128k.m4a")
	crystar_action_kokoro_mp4=AudioDub(crystar_action_kokoro_mp4_video,crystar_action_kokoro_mp4_audio)

	crystar_action_kokoro_mp4=SSRC(is_60p?ASSUME_60P(crystar_action_kokoro_mp4):ASSUME_30P(crystar_action_kokoro_mp4),48000)
	return crystar_action_kokoro_mp4
}

#crystar_action_kokoro=CRYSTAR_ACTION_KOKORO_MP4_REF_SOURCE() #695 ed
crystar_action_kokoro=CRYSTAR_ACTION_KOKORO_MP4_SOURCE(is_60p) #695/1391 ed



function CRYSTAR_ACTION_SEN_MP4_REF_SOURCE(){
	crystar_action_sen_mp4_ref=FFmpegSource2("src\crystar-asset\movie\official\system\action\【CRYSTAR -クライスタ-】千_アクションシーン.720p.mp4",atrack=-1,fpsnum=30000,fpsden=1001,threads=1)
	crystar_action_sen_mp4_ref=SSRC(ASSUME_30P(crystar_action_sen_mp4_ref),48000)
	return crystar_action_sen_mp4_ref
}

function CRYSTAR_ACTION_SEN_MP4_SOURCE(bool is_60p){
	crystar_action_sen_mp4_video=is_60p?FFVideoSource("src\crystar-asset\movie\official\system\action\【CRYSTAR -クライスタ-】千_アクションシーン.DASH-1080p60.mp4",fpsnum=60000,fpsden=1001,threads=1,seekmode=-1) \
		:FFVideoSource("src\crystar-asset\movie\official\system\action\【CRYSTAR -クライスタ-】千_アクションシーン.DASH-1080p.mp4",fpsnum=30000,fpsden=1001,threads=1,seekmode=-1)

	crystar_action_sen_mp4_audio=FFAudioSource("src\crystar-asset\movie\official\system\action\【CRYSTAR -クライスタ-】千_アクションシーン.DASH-128k.m4a")
	crystar_action_sen_mp4=AudioDub(crystar_action_sen_mp4_video,crystar_action_sen_mp4_audio)

	crystar_action_sen_mp4=SSRC(is_60p?ASSUME_60P(crystar_action_sen_mp4):ASSUME_30P(crystar_action_sen_mp4),48000)
	return crystar_action_sen_mp4
}

#crystar_action_sen=CRYSTAR_ACTION_SEN_MP4_REF_SOURCE() #659 ed
crystar_action_sen=CRYSTAR_ACTION_SEN_MP4_SOURCE(is_60p) #659/1318 ed



function CRYSTAR_ACTION_777_MP4_REF_SOURCE(){
	crystar_action_777_mp4_ref=FFmpegSource2("src\crystar-asset\movie\official\system\action\【CRYSTAR -クライスタ-】777_アクション.720p.mp4",atrack=-1,fpsnum=30000,fpsden=1001,threads=1)
	crystar_action_777_mp4_ref=SSRC(ASSUME_30P(crystar_action_777_mp4_ref),48000)
	return crystar_action_777_mp4_ref
}

function CRYSTAR_ACTION_777_MP4_SOURCE(bool is_60p){
	crystar_action_777_mp4_video=is_60p?FFVideoSource("src\crystar-asset\movie\official\system\action\【CRYSTAR -クライスタ-】777_アクション.DASH-1080p60.mp4",fpsnum=60000,fpsden=1001,threads=1,seekmode=-1) \
		:FFVideoSource("src\crystar-asset\movie\official\system\action\【CRYSTAR -クライスタ-】777_アクション.DASH-1080p.mp4",fpsnum=30000,fpsden=1001,threads=1,seekmode=-1)

	crystar_action_777_mp4_audio=FFAudioSource("src\crystar-asset\movie\official\system\action\【CRYSTAR -クライスタ-】777_アクション.DASH-128k.m4a")
	crystar_action_777_mp4=AudioDub(crystar_action_777_mp4_video,crystar_action_777_mp4_audio)

	crystar_action_777_mp4=SSRC(is_60p?ASSUME_60P(crystar_action_777_mp4):ASSUME_30P(crystar_action_777_mp4),48000)
	return crystar_action_777_mp4
}

#crystar_action_777=CRYSTAR_ACTION_777_MP4_REF_SOURCE()
crystar_action_777=CRYSTAR_ACTION_777_MP4_SOURCE(is_60p)



function CRYSTAR_CHARACTER_REI_MP4_REF_SOURCE(){
	crystar_character_rei_mp4_ref=FFmpegSource2("src\crystar-asset\movie\official\character\【CRYSTAR -クライスタ-】零.720p.mp4",atrack=-1,fpsnum=30000,fpsden=1001,threads=1)
	crystar_character_rei_mp4_ref=SSRC(ASSUME_30P(crystar_character_rei_mp4_ref),48000)
	return crystar_character_rei_mp4_ref
}

function CRYSTAR_CHARACTER_REI_MP4_SOURCE(bool is_60p){
	crystar_character_rei_mp4_video=is_60p?FFVideoSource("src\crystar-asset\movie\official\character\【CRYSTAR -クライスタ-】零.DASH-1080p60.mp4",fpsnum=60000,fpsden=1001,threads=1,seekmode=-1) \
		:FFVideoSource("src\crystar-asset\movie\official\character\【CRYSTAR -クライスタ-】零.DASH-1080p.mp4",fpsnum=30000,fpsden=1001,threads=1,seekmode=-1)

	crystar_character_rei_mp4_audio=FFAudioSource("src\crystar-asset\movie\official\character\【CRYSTAR -クライスタ-】零.DASH-128k.m4a")
	crystar_character_rei_mp4=AudioDub(crystar_character_rei_mp4_video,crystar_character_rei_mp4_audio)

	crystar_character_rei_mp4=SSRC(is_60p?ASSUME_60P(crystar_character_rei_mp4):ASSUME_30P(crystar_character_rei_mp4),48000)
	return crystar_character_rei_mp4
}

#crystar_character_rei=CRYSTAR_CHARACTER_REI_MP4_REF_SOURCE()
#crystar_character_rei_cache02=crystar_character_rei
#crystar_character_rei_cache03=crystar_character_rei
#crystar_character_rei_cache04=crystar_character_rei

crystar_character_rei=CRYSTAR_CHARACTER_REI_MP4_SOURCE(is_60p)
crystar_character_rei_cache02=CRYSTAR_CHARACTER_REI_MP4_SOURCE(is_60p)
crystar_character_rei_cache03=CRYSTAR_CHARACTER_REI_MP4_SOURCE(is_60p)
crystar_character_rei_cache04=CRYSTAR_CHARACTER_REI_MP4_SOURCE(is_60p)

######## Wallpaper (1920*1200) ########

crystar_wallpaper=AUDIO_DUB_TONE(ImageSource("src\crystar-asset\wallpaper\wallpaper.png",0,283,30.0,pixel_type="rgb24"),samplerate=48000,channels=2,type="Silence") #119 op 284 ed
crystar_wallpaper=Crop(crystar_wallpaper,0,1200-1080,0,0)

######## Trim ########

# caution: FFMS2 2.21 frame accuracy is broken



is_60p?Eval("""
# 60p
crystar_op_01=Trim(crystar_op,0,388) #389 op
crystar_op_02_title=Trim(crystar_op,389,936) #548 op ed
crystar_op_03=Trim(crystar_op,937,1561) #625 op
crystar_op_04=Trim(crystar_op,1562,3663) #2102 op
crystar_op_05=Trim(crystar_op,3664,4350) #687 op
crystar_op_06=Trim(crystar_op,4351,5233) #883 op ed
crystar_op_07=Trim(crystar_op,5234,5748) #515 op ed
#crystar_op_post=Trim(crystar_op,5749,0)
"""):Eval("""
# 30p
crystar_op_01=Trim(crystar_op,0,194) #195 op
crystar_op_02_title=Trim(crystar_op,195,468) #274 op ed
crystar_op_03=Trim(crystar_op,469,780) #312 op
crystar_op_04=Trim(crystar_op,781,1831) #1051 op
crystar_op_05=Trim(crystar_op,1832,2175) #344 op
crystar_op_06=Trim(crystar_op,2176,2616) #441 op ed
crystar_op_07=Trim(crystar_op,2617,2874) #258 op ed
#crystar_op_post=Trim(crystar_op,2875,0)
""")



is_60p?Eval("""
# 60p
crystar_promotion_movie_01=Trim(crystar_promotion_movie_cache02,0,264) #265 op
crystar_promotion_movie_02=Trim(crystar_promotion_movie,265,888) #624 op
crystar_promotion_movie_03_op=Trim(crystar_promotion_movie,889,3717) #2829 x
crystar_promotion_movie_04_character=Trim(crystar_promotion_movie,3718,5989) #2272 op
crystar_promotion_movie_05_pencil=Trim(crystar_promotion_movie,5990,6310) #321 ed
crystar_promotion_movie_06_animation=Trim(crystar_promotion_movie_cache02,6311,6556) #246 op
crystar_promotion_movie_07_pencil=Trim(crystar_promotion_movie,6557,6686) #130 ed
crystar_promotion_movie_08_animation=Trim(crystar_promotion_movie_cache02,6687,6990) #304 op
crystar_promotion_movie_09_dialog=Trim(crystar_promotion_movie_cache02,6991,7069) #79 ed
crystar_promotion_movie_10_rei_cry=Trim(crystar_promotion_movie,7070,7179) #110 op
crystar_promotion_movie_11_game=Trim(crystar_promotion_movie_cache02,7180,7353) #174 op
crystar_promotion_movie_12_pencil=Trim(crystar_promotion_movie,7354,7577) #224 ed
crystar_promotion_movie_13_dialog=Trim(crystar_promotion_movie_cache02,7578,7891) #314 op
crystar_promotion_movie_14_rei_cry=Trim(crystar_promotion_movie_cache02,7892,8060) #169 op
crystar_promotion_movie_15_character=Trim(crystar_promotion_movie,8061,9117) #1057 op
crystar_promotion_movie_16_rei_hear_music=Trim(crystar_promotion_movie,9118,9185) #68 op
crystar_promotion_movie_17_animation=Trim(crystar_promotion_movie,9186,9633) #448 op
crystar_promotion_movie_18_game=Trim(crystar_promotion_movie,9634,10212) #579 op
crystar_promotion_movie_19_game=Trim(crystar_promotion_movie,10213,10730) #518 op
crystar_promotion_movie_20_animation=Trim(crystar_promotion_movie_cache03,10731,12132) #1402 op ed
crystar_promotion_movie_21_title=Trim(crystar_promotion_movie,12133,12888) #756 x
crystar_promotion_movie_22_rei_cry=Trim(crystar_promotion_movie,12889,13459) #571 ed
crystar_promotion_movie_23_slogan=Trim(crystar_promotion_movie_cache04,13460,13653) #194 op ed
crystar_promotion_movie_24_pencil=Trim(crystar_promotion_movie,13654,13893) #240 ed
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
crystar_promotion_movie_05_pencil=Trim(crystar_promotion_movie,2995,3155) #161 ed
crystar_promotion_movie_06_animation=Trim(crystar_promotion_movie_cache02,3156,3278) #123 op
crystar_promotion_movie_07_pencil=Trim(crystar_promotion_movie,3279,3343) #65 ed
crystar_promotion_movie_08_animation=Trim(crystar_promotion_movie_cache02,3344,3495) #152 op
crystar_promotion_movie_09_dialog=Trim(crystar_promotion_movie_cache02,3496,3534) #39 ed
crystar_promotion_movie_10_rei_cry=Trim(crystar_promotion_movie,3535,3589) #55 op
crystar_promotion_movie_11_game=Trim(crystar_promotion_movie,3590,3676) #87 op
crystar_promotion_movie_12_pencil=Trim(crystar_promotion_movie,3677,3788) #112 ed
crystar_promotion_movie_13_dialog=Trim(crystar_promotion_movie_cache02,3789,3945) #157 op
crystar_promotion_movie_14_rei_cry=Trim(crystar_promotion_movie_cache02,3946,4030) #85 op
crystar_promotion_movie_15_character=Trim(crystar_promotion_movie,4031,4558) #528 op
crystar_promotion_movie_16_rei_hear_music=Trim(crystar_promotion_movie,4559,4592) #34 op
crystar_promotion_movie_17_animation=Trim(crystar_promotion_movie,4593,4816) #224 op
crystar_promotion_movie_18_game=Trim(crystar_promotion_movie,4817,5106) #290 op
crystar_promotion_movie_19_game=Trim(crystar_promotion_movie,5107,5365) #259 op
crystar_promotion_movie_20_animation=Trim(crystar_promotion_movie_cache03,5366,6066) #701 op ed
crystar_promotion_movie_21_title=Trim(crystar_promotion_movie,6067,6444) #378 x
crystar_promotion_movie_22_rei_cry=Trim(crystar_promotion_movie,6445,6729) #285 ed
crystar_promotion_movie_23_slogan=Trim(crystar_promotion_movie_cache04,6730,6826) #97 op ed
crystar_promotion_movie_24_pencil=Trim(crystar_promotion_movie,6827,6946) #120 ed
crystar_promotion_movie_25_white=Trim(crystar_promotion_movie,6947,6985) #39 x
crystar_promotion_movie_26_gemdrops=Trim(crystar_promotion_movie,6986,7025) #40
crystar_promotion_movie_27_furyu=Trim(crystar_promotion_movie,7026,7084) #59 op ed
#crystar_promotion_movie_post=Trim(crystar_promotion_movie,7085,0)
""")



# 30p
crystar_teaser_movie_01_tear=Trim(crystar_teaser_movie,46,547) #502 ed
crystar_teaser_movie_02_op=Trim(crystar_teaser_movie,548,1474) #927 ed
crystar_teaser_movie_03=Trim(crystar_teaser_movie,1475,2098) #624 op
crystar_teaser_movie_04_title=Trim(crystar_teaser_movie,2099,2388) #290 x
crystar_teaser_movie_05_rei_cry=Trim(crystar_teaser_movie,2389,2525) #137 x
crystar_teaser_movie_06_slogan=Trim(crystar_teaser_movie,2526,2640) #115 x
crystar_teaser_movie_07_furyu=Trim(crystar_teaser_movie,2641,2699) #59 x
#crystar_teaser_movie_post=Trim(crystar_teaser_movie,2700,0)



is_60p?Eval("""
# 60p
crystar_system_katharsis_01_menu=Trim(crystar_system_katharsis,37,1009) #973 ed
crystar_system_katharsis_02_animation=Trim(crystar_system_katharsis,1010,2248) #1239 ed
"""):Eval("""
# 30p
crystar_system_katharsis_01_menu=Trim(crystar_system_katharsis,19,504) #486 ed
crystar_system_katharsis_02_animation=Trim(crystar_system_katharsis,505,1123) #619 ed
""")



is_60p?Eval("""
# 60p
crystar_action_777_01_game=Trim(crystar_action_777,3,972) #970 ed
"""):Eval("""
# 30p
crystar_action_777_01_game=Trim(crystar_action_777,2,485) #484 ed
""")



is_60p?Eval("""
# 60p
crystar_character_rei_01_prologue=Trim(crystar_character_rei,0,11109) #11110 9100~11109 ed
crystar_character_rei_02_prologue_to_game=Trim(crystar_character_rei,11110,11168) #59
crystar_character_rei_03_game=Trim(crystar_character_rei,11169,11991) #823 x
crystar_character_rei_04_game=Trim(crystar_character_rei_cache02,11992,12822) #831 ed
crystar_character_rei_05_game=Trim(crystar_character_rei_cache03,12823,14227) #1405 ed
crystar_character_rei_06_animation=Trim(crystar_character_rei,14228,14703) #476 x
crystar_character_rei_07_dialog=Trim(crystar_character_rei_cache04,14704,15798) #1095 ed
"""):Eval("""
# 30p
crystar_character_rei_01_prologue=Trim(crystar_character_rei,0,5555) #5556 4550~5555 ed
crystar_character_rei_02_prologue_to_game=Trim(crystar_character_rei,5556,5584) #29
crystar_character_rei_03_game=Trim(crystar_character_rei,5585,5995) #411 x
crystar_character_rei_04_game=Trim(crystar_character_rei_cache02,5996,6411) #416 ed
crystar_character_rei_05_game=Trim(crystar_character_rei_cache03,6412,7113) #702 ed
crystar_character_rei_06_animation=Trim(crystar_character_rei,7114,7351) #238 x
crystar_character_rei_07_dialog=Trim(crystar_character_rei_cache04,7352,7898) #547 ed
""")
