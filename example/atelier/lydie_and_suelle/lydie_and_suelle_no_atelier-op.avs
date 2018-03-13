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



MP_Pipeline("""

### inherit start ###

Import("..\..\..\avsi4comp\avsi4comp.avsi")

### inherit end ###

######## Function ########

function SCALE_CG(clip cg,float center_x,float center_y,float scale_start,float scale_end){
	cg_frame_count=Framecount(cg)

	return ScriptClip(cg,"FAST_ZOOM(srcx="+String(center_x)+",srcy="+String(center_y)+",dstx="+String(center_x)+",dsty="+String(center_y)+",factor=Spline(current_frame,0,"+String(scale_start)+","+String(cg_frame_count)+","+String(scale_end)+"))")
}

######## Game (1280*720) ########

#lydie_and_suelle_no_atelier_op=SSRC(FFMS2_VIDEO_SOURCE("src\official\movie\『リディー＆スールのアトリエ』オープニングムービー.720p.mp4",fpsnum=30000,fpsden=1001),48000)
#lydie_and_suelle_no_atelier_promotion_video_01=SSRC(FFMS2_VIDEO_SOURCE("src\official\movie\『リディー&スールのアトリエ』プロモーション映像第1弾.720p.mp4",fpsnum=30000,fpsden=1001),48000)
#lydie_and_suelle_no_atelier_promotion_video_02=SSRC(FFMS2_VIDEO_SOURCE("src\official\movie\『リディー&スールのアトリエ』プロモーション映像第2弾.720p.mp4",fpsnum=30000,fpsden=1001),48000)

#lydie_and_suelle_no_atelier_look_back_path="src\official\movie\「不思議」シリーズ振り返り映像！ 『リディー&スールのアトリエ』好評発売中！.720p.mp4"
#lydie_and_suelle_no_atelier_look_back=SSRC(FFMS2_VIDEO_SOURCE(lydie_and_suelle_no_atelier_look_back_path,fpsnum=30000,fpsden=1001),48000)
#lydie_and_suelle_no_atelier_look_back_cache02=SSRC(FFMS2_VIDEO_SOURCE(lydie_and_suelle_no_atelier_look_back_path,fpsnum=30000,fpsden=1001),48000)

#lydie_and_suelle_no_atelier_op_cache02=lydie_and_suelle_no_atelier_op

#lydie_and_suelle_no_atelier_promotion_video_02_cache02=lydie_and_suelle_no_atelier_promotion_video_02
#lydie_and_suelle_no_atelier_promotion_video_02_cache03=lydie_and_suelle_no_atelier_promotion_video_02

#lydie_and_suelle_no_atelier_play_video_live=SSRC(FFMS2_VIDEO_SOURCE("src\official\play\『リディー&スールのアトリエ』プレイ動画1 「10_18生放送内 紹介映像」編.720p.mp4",fpsnum=30000,fpsden=1001),48000)

######## Game (1920*1080) ########

lydie_and_suelle_no_atelier_op_video_path="src\official\movie\『リディー＆スールのアトリエ』オープニングムービー.DASH-1080p.mp4"
lydie_and_suelle_no_atelier_op_audio_path="src\official\movie\『リディー＆スールのアトリエ』オープニングムービー.DASH-128k.m4a"

lydie_and_suelle_no_atelier_op_video=FFVideoSource(lydie_and_suelle_no_atelier_op_video_path,fpsnum=30000,fpsden=1001,threads=1,seekmode=-1)
lydie_and_suelle_no_atelier_op_audio=SSRC(FFAudioSource(lydie_and_suelle_no_atelier_op_audio_path),48000)
lydie_and_suelle_no_atelier_op=AudioDub(lydie_and_suelle_no_atelier_op_video,lydie_and_suelle_no_atelier_op_audio)
#lydie_and_suelle_no_atelier_op=AudioDub(lydie_and_suelle_no_atelier_op_video,lydie_and_suelle_no_atelier_op)

lydie_and_suelle_no_atelier_op_video_cache02=FFVideoSource(lydie_and_suelle_no_atelier_op_video_path,fpsnum=30000,fpsden=1001,threads=1,seekmode=-1)
lydie_and_suelle_no_atelier_op_audio_cache02=SSRC(FFAudioSource(lydie_and_suelle_no_atelier_op_audio_path),48000)
lydie_and_suelle_no_atelier_op_cache02=AudioDub(lydie_and_suelle_no_atelier_op_video_cache02,lydie_and_suelle_no_atelier_op_audio_cache02)
#lydie_and_suelle_no_atelier_op_cache02=AudioDub(lydie_and_suelle_no_atelier_op_video_cache02,lydie_and_suelle_no_atelier_op_cache02)

lydie_and_suelle_no_atelier_promotion_video_01_video_path="src\official\movie\『リディー&スールのアトリエ』プロモーション映像第1弾.DASH-1080p.mp4"
lydie_and_suelle_no_atelier_promotion_video_01_audio_path="src\official\movie\『リディー&スールのアトリエ』プロモーション映像第1弾.DASH-128k.m4a"

lydie_and_suelle_no_atelier_promotion_video_01_video=FFVideoSource(lydie_and_suelle_no_atelier_promotion_video_01_video_path,fpsnum=30000,fpsden=1001,threads=1,seekmode=-1)
lydie_and_suelle_no_atelier_promotion_video_01_audio=SSRC(FFAudioSource(lydie_and_suelle_no_atelier_promotion_video_01_audio_path),48000)
lydie_and_suelle_no_atelier_promotion_video_01=AudioDub(lydie_and_suelle_no_atelier_promotion_video_01_video,lydie_and_suelle_no_atelier_promotion_video_01_audio)
#lydie_and_suelle_no_atelier_promotion_video_01=AudioDub(lydie_and_suelle_no_atelier_promotion_video_01_video,lydie_and_suelle_no_atelier_promotion_video_01)

lydie_and_suelle_no_atelier_promotion_video_02_video_path="src\official\movie\『リディー&スールのアトリエ』プロモーション映像第2弾.DASH-1080p.mp4"
lydie_and_suelle_no_atelier_promotion_video_02_audio_path="src\official\movie\『リディー&スールのアトリエ』プロモーション映像第2弾.DASH-128k.m4a"

lydie_and_suelle_no_atelier_promotion_video_02_video=FFVideoSource(lydie_and_suelle_no_atelier_promotion_video_02_video_path,fpsnum=30000,fpsden=1001,threads=1,seekmode=-1)
lydie_and_suelle_no_atelier_promotion_video_02_audio=SSRC(FFAudioSource(lydie_and_suelle_no_atelier_promotion_video_02_audio_path),48000)
lydie_and_suelle_no_atelier_promotion_video_02=AudioDub(lydie_and_suelle_no_atelier_promotion_video_02_video,lydie_and_suelle_no_atelier_promotion_video_02_audio)
#lydie_and_suelle_no_atelier_promotion_video_02=AudioDub(lydie_and_suelle_no_atelier_promotion_video_02_video,lydie_and_suelle_no_atelier_promotion_video_02)

lydie_and_suelle_no_atelier_promotion_video_02_video_cache02=FFVideoSource(lydie_and_suelle_no_atelier_promotion_video_02_video_path,fpsnum=30000,fpsden=1001,threads=1,seekmode=-1)
lydie_and_suelle_no_atelier_promotion_video_02_audio_cache02=SSRC(FFAudioSource(lydie_and_suelle_no_atelier_promotion_video_02_audio_path),48000)
lydie_and_suelle_no_atelier_promotion_video_02_cache02=AudioDub(lydie_and_suelle_no_atelier_promotion_video_02_video_cache02,lydie_and_suelle_no_atelier_promotion_video_02_audio_cache02)
#lydie_and_suelle_no_atelier_promotion_video_02_cache02=AudioDub(lydie_and_suelle_no_atelier_promotion_video_02_video_cache02,lydie_and_suelle_no_atelier_promotion_video_02_cache02)

lydie_and_suelle_no_atelier_promotion_video_02_video_cache03=FFVideoSource(lydie_and_suelle_no_atelier_promotion_video_02_video_path,fpsnum=30000,fpsden=1001,threads=1,seekmode=-1)
lydie_and_suelle_no_atelier_promotion_video_02_audio_cache03=SSRC(FFAudioSource(lydie_and_suelle_no_atelier_promotion_video_02_audio_path),48000)
lydie_and_suelle_no_atelier_promotion_video_02_cache03=AudioDub(lydie_and_suelle_no_atelier_promotion_video_02_video_cache03,lydie_and_suelle_no_atelier_promotion_video_02_audio_cache03)
#lydie_and_suelle_no_atelier_promotion_video_02_cache03=AudioDub(lydie_and_suelle_no_atelier_promotion_video_02_video_cache03,lydie_and_suelle_no_atelier_promotion_video_02_cache03)

lydie_and_suelle_no_atelier_look_back_video_path="src\official\movie\「不思議」シリーズ振り返り映像！ 『リディー&スールのアトリエ』好評発売中！.DASH-1080p.mp4"
lydie_and_suelle_no_atelier_look_back_audio_path="src\official\movie\「不思議」シリーズ振り返り映像！ 『リディー&スールのアトリエ』好評発売中！.DASH-128k.m4a"

lydie_and_suelle_no_atelier_look_back_video=FFVideoSource(lydie_and_suelle_no_atelier_look_back_video_path,fpsnum=30000,fpsden=1001,threads=1,seekmode=-1)
lydie_and_suelle_no_atelier_look_back_audio=SSRC(FFAudioSource(lydie_and_suelle_no_atelier_look_back_audio_path),48000)
lydie_and_suelle_no_atelier_look_back=AudioDub(lydie_and_suelle_no_atelier_look_back_video,lydie_and_suelle_no_atelier_look_back_audio)
#lydie_and_suelle_no_atelier_look_back=AudioDub(lydie_and_suelle_no_atelier_look_back_video,lydie_and_suelle_no_atelier_look_back)

lydie_and_suelle_no_atelier_look_back_video_cache02=FFVideoSource(lydie_and_suelle_no_atelier_look_back_video_path,fpsnum=30000,fpsden=1001,threads=1,seekmode=-1)
lydie_and_suelle_no_atelier_look_back_audio_cache02=SSRC(FFAudioSource(lydie_and_suelle_no_atelier_look_back_audio_path),48000)
lydie_and_suelle_no_atelier_look_back_cache02=AudioDub(lydie_and_suelle_no_atelier_look_back_video_cache02,lydie_and_suelle_no_atelier_look_back_audio_cache02)
#lydie_and_suelle_no_atelier_look_back_cache02=AudioDub(lydie_and_suelle_no_atelier_look_back_video_cache02,lydie_and_suelle_no_atelier_look_back_cache02)

lydie_and_suelle_no_atelier_play_video_live_video_path="src\official\play\『リディー&スールのアトリエ』プレイ動画1 「10_18生放送内 紹介映像」編.DASH-1080p.mp4"
lydie_and_suelle_no_atelier_play_video_live_audio_path="src\official\play\『リディー&スールのアトリエ』プレイ動画1 「10_18生放送内 紹介映像」編.DASH-128k.m4a"

lydie_and_suelle_no_atelier_play_video_live_video=FFVideoSource(lydie_and_suelle_no_atelier_play_video_live_video_path,fpsnum=30000,fpsden=1001,threads=1,seekmode=-1)
lydie_and_suelle_no_atelier_play_video_live_audio=SSRC(FFAudioSource(lydie_and_suelle_no_atelier_play_video_live_audio_path),48000)
lydie_and_suelle_no_atelier_play_video_live=AudioDub(lydie_and_suelle_no_atelier_play_video_live_video,lydie_and_suelle_no_atelier_play_video_live_audio)
#lydie_and_suelle_no_atelier_play_video_live=AudioDub(lydie_and_suelle_no_atelier_play_video_live_video,lydie_and_suelle_no_atelier_play_video_live)

######## Trim ########

op_music_start=8

lydie_and_suelle_no_atelier_op_00=Trim(lydie_and_suelle_no_atelier_op_cache02,0,op_music_start-1)
lydie_and_suelle_no_atelier_op_01=Trim(lydie_and_suelle_no_atelier_op,op_music_start,1232)
lydie_and_suelle_no_atelier_op_02=Trim(lydie_and_suelle_no_atelier_op,1233,1633)
lydie_and_suelle_no_atelier_op_03=Trim(lydie_and_suelle_no_atelier_op,1634,2484)
lydie_and_suelle_no_atelier_op_04=Trim(lydie_and_suelle_no_atelier_op,2485,0)

lydie_and_suelle_no_atelier_promotion_video_01_01_pre=Trim(lydie_and_suelle_no_atelier_promotion_video_01,0,216) #217 op
lydie_and_suelle_no_atelier_promotion_video_01_01=Trim(lydie_and_suelle_no_atelier_promotion_video_01,217,2180) #1964 op
#lydie_and_suelle_no_atelier_promotion_video_01_02_title=Trim(lydie_and_suelle_no_atelier_promotion_video_01,2181,2397) #217
#lydie_and_suelle_no_atelier_promotion_video_01_03_sale_info=Trim(lydie_and_suelle_no_atelier_promotion_video_01,2398,2995)
lydie_and_suelle_no_atelier_promotion_video_01_04_slogan=Trim(lydie_and_suelle_no_atelier_promotion_video_01,2996,3101) #106
lydie_and_suelle_no_atelier_promotion_video_01_05_bg=Trim(lydie_and_suelle_no_atelier_promotion_video_01,3102,0) #150 op

#lydie_and_suelle_no_atelier_promotion_video_02_01_op=Trim(lydie_and_suelle_no_atelier_promotion_video_02,0,192) #193
#lydie_and_suelle_no_atelier_promotion_video_02_02_title=Trim(lydie_and_suelle_no_atelier_promotion_video_02,193,379) #187
lydie_and_suelle_no_atelier_promotion_video_02_03=Trim(lydie_and_suelle_no_atelier_promotion_video_02,380,1280) #901 op
lydie_and_suelle_no_atelier_promotion_video_02_04=Trim(lydie_and_suelle_no_atelier_promotion_video_02,1281,1475) #195 op
lydie_and_suelle_no_atelier_promotion_video_02_05=Trim(lydie_and_suelle_no_atelier_promotion_video_02,1476,2094) #619 op
lydie_and_suelle_no_atelier_promotion_video_02_06=Trim(lydie_and_suelle_no_atelier_promotion_video_02_cache02,2095,2804) #710 op
#lydie_and_suelle_no_atelier_promotion_video_02_07_op=Trim(lydie_and_suelle_no_atelier_promotion_video_02,2805,2973) #169
#lydie_and_suelle_no_atelier_promotion_video_02_08_title=Trim(lydie_and_suelle_no_atelier_promotion_video_02,2974,3122) #149
#lydie_and_suelle_no_atelier_promotion_video_02_09_sale_info=Trim(lydie_and_suelle_no_atelier_promotion_video_02,3123,3871)
lydie_and_suelle_no_atelier_promotion_video_02_10_bg=Trim(lydie_and_suelle_no_atelier_promotion_video_02_cache03,3872,0) #150 op

lydie_and_suelle_no_atelier_look_back_01_past=Trim(lydie_and_suelle_no_atelier_look_back,0,3137) #3138 op
lydie_and_suelle_no_atelier_look_back_02_past=Trim(lydie_and_suelle_no_atelier_look_back_cache02,3138,6217) #3080 op
lydie_and_suelle_no_atelier_look_back_03_slogan_01=Trim(lydie_and_suelle_no_atelier_look_back,6218,6314) #97 op
lydie_and_suelle_no_atelier_look_back_03_slogan_02=Trim(lydie_and_suelle_no_atelier_look_back,6315,6462) #148 op
lydie_and_suelle_no_atelier_look_back_04=Trim(lydie_and_suelle_no_atelier_look_back,6463,7022) #560 op
#lydie_and_suelle_no_atelier_look_back_05_title=Trim(lydie_and_suelle_no_atelier_look_back,7023,0)

#lydie_and_suelle_no_atelier_play_video_live_00_pre=Trim(lydie_and_suelle_no_atelier_play_video_live,0,29) #30
lydie_and_suelle_no_atelier_play_video_live_01_fade_in=Trim(lydie_and_suelle_no_atelier_play_video_live,30,39) #10
lydie_and_suelle_no_atelier_play_video_live_01_all=Trim(lydie_and_suelle_no_atelier_play_video_live,40,13920) #13881
lydie_and_suelle_no_atelier_play_video_live_01_01=Trim(lydie_and_suelle_no_atelier_play_video_live,40,1659) #1620
lydie_and_suelle_no_atelier_play_video_live_01_02=Trim(lydie_and_suelle_no_atelier_play_video_live,1697,3496) #1800
lydie_and_suelle_no_atelier_play_video_live_01_03=Trim(lydie_and_suelle_no_atelier_play_video_live,3534,8126) #4593
lydie_and_suelle_no_atelier_play_video_live_01_04=Trim(lydie_and_suelle_no_atelier_play_video_live,8164,9284) #1121
lydie_and_suelle_no_atelier_play_video_live_01_05=Trim(lydie_and_suelle_no_atelier_play_video_live,9322,13920) #4599
#lydie_and_suelle_no_atelier_play_video_live_02_title=Trim(lydie_and_suelle_no_atelier_play_video_live,13921,0)

######## Pre Combine ########

fade_length=15



#axis_scale=720.0/1080.0
axis_scale=1.0

lydie_and_suelle_no_atelier_promotion_video_02_10_bg_01=TRIM_FIRST_CLIP(lydie_and_suelle_no_atelier_promotion_video_02_10_bg,26)
lydie_and_suelle_no_atelier_promotion_video_02_10_bg_02=Trim(lydie_and_suelle_no_atelier_promotion_video_02_10_bg,26,51)
lydie_and_suelle_no_atelier_promotion_video_02_10_bg_03=Trim(lydie_and_suelle_no_atelier_promotion_video_02_10_bg,52,0)

lydie_and_suelle_no_atelier_promotion_video_02_10_bg_01_scaling=SCALE_CG(lydie_and_suelle_no_atelier_promotion_video_02_10_bg_01,1200.0*axis_scale,270.0*axis_scale,5.0,3.0)
lydie_and_suelle_no_atelier_promotion_video_02_10_bg_02_scaling=SCALE_CG(lydie_and_suelle_no_atelier_promotion_video_02_10_bg_02,1680.0*axis_scale,270.0*axis_scale,5.0,3.0)
lydie_and_suelle_no_atelier_promotion_video_02_10_bg_01_02_scaling=lydie_and_suelle_no_atelier_promotion_video_02_10_bg_01_scaling+lydie_and_suelle_no_atelier_promotion_video_02_10_bg_02_scaling

lydie_and_suelle_no_atelier_promotion_video_02_10_bg_03_moving=ScriptClip(lydie_and_suelle_no_atelier_promotion_video_02_10_bg_03,"FAST_ZOOM(srcx=1330.0*axis_scale,srcy=540.0*axis_scale,dstx=Width()/2.0,dsty=Height()/2.0+Spline(current_frame,0,-200.0*axis_scale,Framecount()-1,200.0*axis_scale),factor=2.0)")
lydie_and_suelle_no_atelier_promotion_video_02_10_bg_03_moving=FADE_OUT_WITH_BRIGHTNESS_OFFSET(lydie_and_suelle_no_atelier_promotion_video_02_10_bg_03_moving,fade_length)



pip_length=400
past_pip_01=TRIM_MIDDLE_CLIP(lydie_and_suelle_no_atelier_look_back_01_past,pip_length)
past_pip_02=TRIM_MIDDLE_CLIP(lydie_and_suelle_no_atelier_look_back_02_past,pip_length)
past_pip_01=ScriptClip(past_pip_01,"FAST_ZOOM(srcx=0.0,srcy=0.0,dstx=0.0,dsty=0.0+Spline(current_frame,0,Height()/8.0,Framecount()-1,0.0,cubic=false),factor=0.6)")
past_pip_02=ScriptClip(past_pip_02,"FAST_ZOOM(srcx=Width(),srcy=Height(),dstx=Width(),dsty=Height()-Spline(current_frame,0,Height()/8.0,Framecount()-1,0.0,cubic=false),factor=0.6)")
past_pip=Overlay(past_pip_01,past_pip_02,mode="Add")
past_pip=FrameEvaluate(past_pip,"OL_opacity_offset=Spline(current_frame,0,-1.0,100-fade_length,-1.0,100,0.0,Framecount()-1,0.0,cubic=false)")



lydie_and_suelle_no_atelier_look_back_04_extend=lydie_and_suelle_no_atelier_look_back_03_slogan_02+lydie_and_suelle_no_atelier_look_back_04
dissolve_length=Framecount(lydie_and_suelle_no_atelier_look_back_04_extend)-600

######## Combine ########

# lydie_and_suelle_no_atelier_op_01 -8
# lydie_and_suelle_no_atelier_op_02 1225
# lydie_and_suelle_no_atelier_op_03 6721
# lydie_and_suelle_no_atelier_op_04 8172



lydie_and_suelle_no_atelier_op_t01=lydie_and_suelle_no_atelier_op_01+lydie_and_suelle_no_atelier_op_02+TRIM_MIDDLE_CLIP(lydie_and_suelle_no_atelier_promotion_video_02_10_bg_01_02_scaling,52)
lydie_and_suelle_no_atelier_op_t02=TRIM_LAST_CLIP(lydie_and_suelle_no_atelier_promotion_video_02_10_bg_03_moving+lydie_and_suelle_no_atelier_promotion_video_02_06,799)

lydie_and_suelle_no_atelier_op_t03=FADE_OUT_WITH_BRIGHTNESS_OFFSET(TRIM_MIDDLE_CLIP(past_pip,400),fade_length)+TRIM_FIRST_CLIP(lydie_and_suelle_no_atelier_promotion_video_02_03+lydie_and_suelle_no_atelier_look_back_03_slogan_01,400+562)

#lydie_and_suelle_no_atelier_op_t04=BlankClip(lydie_and_suelle_no_atelier_op,length=811,color=color_black)+BlankClip(lydie_and_suelle_no_atelier_op,length=49,color=color_white)
#lydie_and_suelle_no_atelier_op_t05=BlankClip(lydie_and_suelle_no_atelier_op,length=800,color=color_blue)
#lydie_and_suelle_no_atelier_op_t06=BlankClip(lydie_and_suelle_no_atelier_op,length=450,color=color_yellow)
lydie_and_suelle_no_atelier_op_t04_t05_t06=TRIM_FIRST_CLIP(lydie_and_suelle_no_atelier_promotion_video_01_01_pre+lydie_and_suelle_no_atelier_promotion_video_01_01,811+49+800+450)

lydie_and_suelle_no_atelier_op_t07=TRIM_LAST_CLIP(lydie_and_suelle_no_atelier_promotion_video_02_04+lydie_and_suelle_no_atelier_promotion_video_02_05,772)
lydie_and_suelle_no_atelier_op_t08=Dissolve(lydie_and_suelle_no_atelier_op_03,TRIM_LAST_CLIP(lydie_and_suelle_no_atelier_look_back_04_extend,dissolve_length+600),dissolve_length)+lydie_and_suelle_no_atelier_op_04+lydie_and_suelle_no_atelier_promotion_video_01_05_bg+BlankClip(lydie_and_suelle_no_atelier_op,length=30*3,color=color_black)

lydie_and_suelle_no_atelier_op_mute=lydie_and_suelle_no_atelier_op_t01+lydie_and_suelle_no_atelier_op_t02 \
	+lydie_and_suelle_no_atelier_op_t03 \
	+lydie_and_suelle_no_atelier_op_t04_t05_t06 \
	+lydie_and_suelle_no_atelier_op_t07+lydie_and_suelle_no_atelier_op_t08

lydie_and_suelle_no_atelier_op_mute

### export clip: lydie_and_suelle_no_atelier_op_mute,lydie_and_suelle_no_atelier_op_00

### prefetch: 5,2

### ###

######## Subtitle ########

### inherit start ###

global subtitle_clip_width=1920
global subtitle_clip_height=1080

subtitle_x=50*2.25
subtitle_y=395*2.25
global subtitle_front_fade_count=15
global subtitle_rear_fade_count=15
global subtitle_font="MS Gothic"
global subtitle_effects="b"
global subtitle_size=32*2.25
global subtitle_text_color=color_magenta
global subtitle_halo_color=color_goldenrod

function SUBTITLE_FX(clip clip,string text,float x,float y,int start_frame,int end_frame,bool is_second,bool "is_title"){
	is_title=Default(is_title,false)

	text_color=is_second?color_yellow:color_cyan
	text_color=is_title?OVERWRITE_SUBTITLE_COLOR_ALPHA(subtitle_text_color,$C0):text_color

	y_offset=is_second?0:-subtitle_size*2

	return SUBTITLE_FX_FADE_IN_FADE_OUT(clip,text,Round(x),Round(y+y_offset),start_frame,end_frame,subtitle_front_fade_count,subtitle_rear_fade_count,subtitle_font,subtitle_effects,Round(subtitle_size),text_color,subtitle_halo_color,"ex_thick_reduce_memory")
}

### inherit end ###

ConvertToRGB32(matrix="Rec709")

SUBTITLE_FX("クローマ|||  - by fielia@AVISynth",subtitle_x,subtitle_y-subtitle_size*4,8384+subtitle_front_fade_count,8533-subtitle_rear_fade_count,true,is_title=true)
SUBTITLE_FX("|- キャンバス//riya(eufonius)||",subtitle_x,subtitle_y-subtitle_size*2,8384+subtitle_front_fade_count,8533-subtitle_rear_fade_count,false)
SUBTITLE_FX("||- ペインティング//Ceui|",subtitle_x,subtitle_y-subtitle_size*4,8384+subtitle_front_fade_count,8533-subtitle_rear_fade_count,true)

SUBTITLE_FX("いくつの色を混ぜ合わせて",subtitle_x,subtitle_y,23,203,false)
SUBTITLE_FX("ねぇ今日は何をつくろうか",subtitle_x,subtitle_y-subtitle_size,215,396,false)

SUBTITLE_FX("心のままに描いてく物語|",subtitle_x,subtitle_y,411,603,true)
SUBTITLE_FX("奇跡さえ追い越したその先まで",subtitle_x,subtitle_y-subtitle_size,617,811,true)

SUBTITLE_FX("見たことない世界",subtitle_x,subtitle_y-subtitle_size,822,931,false)
SUBTITLE_FX("少しだけ震える指先を君が取って",subtitle_x,subtitle_y,939,1139,false)
SUBTITLE_FX("不敵に笑った",subtitle_x,subtitle_y-subtitle_size,1140,1218,false)

SUBTITLE_FX("どこまで",subtitle_x,subtitle_y,822,897,true)
SUBTITLE_FX("夢は叶えられるのだろう？",subtitle_x,subtitle_y-subtitle_size,909,1042,true)
SUBTITLE_FX("君の手をぎゅっと握って笑った",subtitle_x,subtitle_y,1053,1218,true)

SUBTITLE_FX("古ばけたキャンバスに",subtitle_x,subtitle_y,1222,1310,false)
SUBTITLE_FX("光をならべて",subtitle_x,subtitle_y-subtitle_size,1310,1407,false)
SUBTITLE_FX("さぁ、新しい物語",subtitle_x,subtitle_y,1408,1564,false)
SUBTITLE_FX("描き出そう",subtitle_x,subtitle_y-subtitle_size,1583,1664,false)

SUBTITLE_FX("真っ黒な思い出に塗りつぶされる前に",subtitle_x,subtitle_y-subtitle_size,1222,1411,true)
SUBTITLE_FX("新しい可能性片手に掴んだら",subtitle_x,subtitle_y,1415,1599,true)
SUBTITLE_FX("駆け出そう！",subtitle_x,subtitle_y-subtitle_size,1615,1658,true)

SUBTITLE_FX("不思議な夢で出会った景色を",subtitle_x,subtitle_y,1678,1855,false)
SUBTITLE_FX("もう一度君と眺めたくて",subtitle_x,subtitle_y-subtitle_size,1859,2040,false)
SUBTITLE_FX("ただ聞こえた声に",subtitle_x,subtitle_y,2046,2154,false)
SUBTITLE_FX("心をまかせて",subtitle_x,subtitle_y-subtitle_size,2158,2253,false)
SUBTITLE_FX("今、旅路のページをそっとめくって",subtitle_x,subtitle_y,2258,2474,false)

SUBTITLE_FX("ひとりじゃ寂しいときも大丈夫",subtitle_x,subtitle_y,1659,1854,true)
SUBTITLE_FX("星の夜空 虹を奏でるみたいに",subtitle_x,subtitle_y-subtitle_size,1859,2045,true)
SUBTITLE_FX("ただ不思議に響く心にまかせて",subtitle_x,subtitle_y,2046,2253,true)
SUBTITLE_FX("二人で今",subtitle_x,subtitle_y-subtitle_size,2258,2304,true)
SUBTITLE_FX("さぁ、ページをそっとめくって",subtitle_x,subtitle_y,2305,2474,true)

SUBTITLE_FX("la la la  la la la  la～la～|la la la la～  la la～  la la la～",subtitle_x,subtitle_y-subtitle_size,2870,3070,false)
SUBTITLE_FX("la la la  la la la  la～la～|la la la la～  la la～  la la～",subtitle_x,subtitle_y+subtitle_size,3071,3278,false)

SUBTITLE_FX("la la la  la la la  la～la～|la la la la～  la la～  la la la～",subtitle_x,subtitle_y-subtitle_size*3,3270,3469,true)
SUBTITLE_FX("la la la  la la la  la～la～|la la la la～  la la～  la la～",subtitle_x,subtitle_y-subtitle_size,3470,3677,true)

### pass clip: lydie_and_suelle_no_atelier_op_mute,lydie_and_suelle_no_atelier_op_00

### prefetch: 5,2

### ###

SUBTITLE_FX("いくつの願いを混ぜ合わせて",subtitle_x,subtitle_y-subtitle_size,3845,4025,false)
SUBTITLE_FX("ねぇ次は何を叶えようか",subtitle_x,subtitle_y,4037,4200,false)

SUBTITLE_FX("初めて触れた風の色集めて",subtitle_x,subtitle_y-subtitle_size,3845,4070,true)
SUBTITLE_FX("生まれるまた新しい野望を",subtitle_x,subtitle_y,4082,4231,true)

SUBTITLE_FX("君と歩く世界",subtitle_x,subtitle_y,4245,4352,false)
SUBTITLE_FX("二人だから作れる",subtitle_x,subtitle_y-subtitle_size,4356,4451,false)
SUBTITLE_FX("それは色を重ねるような自然さで",subtitle_x,subtitle_y,4460,4645,false)

SUBTITLE_FX("心のままに描いてく物語",subtitle_x,subtitle_y-subtitle_size,4232,4422,true)
SUBTITLE_FX("奇跡さえこのまま叶えてゆこう",subtitle_x,subtitle_y,4435,4645,true)

SUBTITLE_FX("君と繋いだ手は離れても",subtitle_x,subtitle_y-subtitle_size,4694,4891,false)
SUBTITLE_FX("きっと心は離れられないから",subtitle_x,subtitle_y,4906,5099,false)
SUBTITLE_FX("アトリエと世界に隠された",subtitle_x,subtitle_y-subtitle_size,5117,5301,false)
SUBTITLE_FX("レシピを一緒に探しに往こう",subtitle_x,subtitle_y,5330,5599,false)

SUBTITLE_FX("君と繋いだ手は離れても",subtitle_x,subtitle_y-subtitle_size,4719,4883,true)
SUBTITLE_FX("きっと心は離れられないから",subtitle_x,subtitle_y,4894,5092,true)
SUBTITLE_FX("アトリエと世界に隠された",subtitle_x,subtitle_y-subtitle_size,5093,5301,true)
SUBTITLE_FX("レシピを一緒に探しに往こう",subtitle_x,subtitle_y,5330,5599,true)

SUBTITLE_FX("不思議な夢で出会った景色を",subtitle_x,subtitle_y,5948,6129,true)
SUBTITLE_FX("また君と確かめるために",subtitle_x,subtitle_y-subtitle_size,6130,6332,true)

SUBTITLE_FX("ひとりじゃ寂しいときも大丈夫",subtitle_x,subtitle_y,6329,6524,false)
SUBTITLE_FX("霞む空に 虹を走らせるように",subtitle_x,subtitle_y-subtitle_size,6529,6746,false)

SUBTITLE_FX("不思議な夢で出会った景色で",subtitle_x,subtitle_y,6771,6950,false)
SUBTITLE_FX("もう一度君と笑ってたくて",subtitle_x,subtitle_y-subtitle_size,6953,7135,false)
SUBTITLE_FX("ただ聞こえた声に",subtitle_x,subtitle_y,7141,7248,false)
SUBTITLE_FX("心をまかせて",subtitle_x,subtitle_y-subtitle_size,7253,7350,false)
SUBTITLE_FX("今、旅路のページをそっとめくって",subtitle_x,subtitle_y,7353,7605,false)

SUBTITLE_FX("ひとりじゃ寂しいときも大丈夫",subtitle_x,subtitle_y,6754,6949,true)
SUBTITLE_FX("霞む空に 虹を走らせるように",subtitle_x,subtitle_y-subtitle_size,6953,7140,true)
SUBTITLE_FX("ただ不思議に響く心にまかせて",subtitle_x,subtitle_y,7141,7350,true)
SUBTITLE_FX("二人で今",subtitle_x,subtitle_y-subtitle_size,7353,7400,true)
SUBTITLE_FX("さぁ、ページをそっとめくって",subtitle_x,subtitle_y,7401,7605,true)

######## Thumbnail ########

is_thumbnail=false

is_thumbnail?ConvertToRGB32(lydie_and_suelle_no_atelier_op_mute,matrix="Rec709"):last

######## Music ########

bgm_00_48khz=SSRC(WAVSource("src\lydie_and_suelle_no_atelier-vocal_album-02.wav"),48000)
bgm_01_48khz=SSRC(WAVSource("src\lydie_and_suelle_no_atelier-vocal_album-03.wav"),48000)
bgm_02_48khz=SSRC(WAVSource("src\lydie_and_suelle_no_atelier-vocal_album-04.wav"),48000)
bgm_mix_48khz=MixAudio(bgm_01_48khz,bgm_02_48khz,0.5,0.5)

AudioDub(bgm_00_48khz)
#AudioDub(bgm_01_48khz)
#AudioDub(bgm_02_48khz)
#AudioDub(bgm_mix_48khz)



#thumbnail=Trim(409,-30*5)
thumbnail=Trim(6750,-30*5)



AUDIO_DUB_TONE(ConvertToRGB32(lydie_and_suelle_no_atelier_op_00,matrix="Rec709"),samplerate=48000,channels=2,type="Silence")++last



is_thumbnail?thumbnail:last

""")

######## Post Processing ########

ConvertToYV12(matrix="Rec709")
#ConvertToYUY2(matrix="Rec709")
#ConvertToRGB24()

#ConvertAudioTo8bit()
#ConvertAudioTo16bit()
ConvertAudioTo24bit()
#ConvertAudioTo32bit()
#ConvertAudioToFloat()

TCPServer()
