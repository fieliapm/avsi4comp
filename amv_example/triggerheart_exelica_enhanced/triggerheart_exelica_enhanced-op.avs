################################################################################
#
# avsi4comp - A set of AviSynth functions to help video compositing and editing
# Copyright (C) 2010-present <fieliapm@gmail.com>
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



Import("..\avsi4comp\macro.avsi")

#SetMemoryMax(64)

######## DC (720*480) ########

triggerheart_exelica_dc_pv_video=VOB_MPEG2_VIDEO_SOURCE("src\triggerheart_exelica-movie\dc\triggerheart_exelica-dc-pv.d2v",upConv=1)
triggerheart_exelica_dc_pv_audio=WAVSource("src\triggerheart_exelica-movie\dc\triggerheart_exelica-dc-pv T80 2_0ch 448Kbps 48KHz.wav")
triggerheart_exelica_dc_pv=AudioDub(triggerheart_exelica_dc_pv_video,triggerheart_exelica_dc_pv_audio)

######## Xbox360 (1280*720) ########

xbla_mp4_fpsnum=30000
xbla_mp4_fpsden=1001

triggerheart_exelica_xbla_game_review_path="src\triggerheart_exelica-movie\xbla\gameplay\cgr_undertow\triggerheart_exelica-xbla-game_review-720p.mp4"
triggerheart_exelica_xbla_game_review=FFMS2_VIDEO_SOURCE(triggerheart_exelica_xbla_game_review_path,fpsnum=xbla_mp4_fpsnum,fpsden=xbla_mp4_fpsden)
triggerheart_exelica_xbla_game_review_cache02=FFMS2_VIDEO_SOURCE(triggerheart_exelica_xbla_game_review_path,fpsnum=xbla_mp4_fpsnum,fpsden=xbla_mp4_fpsden)
triggerheart_exelica_xbla_game_review=SSRC(triggerheart_exelica_xbla_game_review,48000)
triggerheart_exelica_xbla_game_review_cache02=SSRC(triggerheart_exelica_xbla_game_review_cache02,48000)

######## PS2 (512*336) ########

ps2_sfd_fpsnum=24
ps2_sfd_fpsden=1

# ripped MP4 (H.264/AAC)
#triggerheart_exelica_enhanced_ps2_op=FFMS2_VIDEO_SOURCE("src\triggerheart_exelica-movie\ps2\dvd_rip\triggerheart_exelica_enhanced-ps2-op.mp4")

# original SFD (Sofdec) (MPEG-1/ADX)
#triggerheart_exelica_enhanced_ps2_op=FFMS2_VIDEO_SOURCE("src\ps2\OPENING.SFD",fpsnum=ps2_sfd_fpsnum,fpsden=ps2_sfd_fpsden)

# demux SFD (Sofdec) to m2v+wav
triggerheart_exelica_enhanced_ps2_op_video=VOB_MPEG2_VIDEO_SOURCE("src\ps2\OPENING.d2v")
triggerheart_exelica_enhanced_ps2_op_audio=WAVSource("src\ps2\OPENING_adx.wav")
triggerheart_exelica_enhanced_ps2_op=AudioDub(triggerheart_exelica_enhanced_ps2_op_video,triggerheart_exelica_enhanced_ps2_op_audio)

# PS2 opening movie may be edited at 24000/1001 fps but saved as 24 fps
# there are 2 strategy:
#
# 1. we adjust PS2 opening movie speed by assuming 24000/1001 fps and keep audio sync
#    then edit at 30000/1001 fps
#
# 2. we adjust music speed by assuming sample rate: 44100 Hz / (24000/1001) fps * 24 fps = 44144.1 Hz
#    SSRC() can resample from 44145 Hz to 48000 Hz
#    then edit at 30 fps

triggerheart_exelica_enhanced_ps2_op=SSRC(ASSUME_23_976P(triggerheart_exelica_enhanced_ps2_op),48000) # assume 24000/1001 fps

######## PS2 (480*270) ########

ps2_wmv_fpsnum=30000
ps2_wmv_fpsden=1001

triggerheart_exelica_enhanced_ps2_pv=FFMS2_VIDEO_SOURCE("src\triggerheart_exelica-movie\ps2\mms\EXELICA_08COM.wmv",fpsnum=ps2_wmv_fpsnum,fpsden=ps2_wmv_fpsden)

######## TRIM ########

triggerheart_exelica_dc_pv_01=Trim(triggerheart_exelica_dc_pv,114,1538) # original: 114~1764

triggerheart_exelica_xbla_game_review_01=Trim(triggerheart_exelica_xbla_game_review,192,302)
triggerheart_exelica_xbla_game_review_02=Trim(triggerheart_exelica_xbla_game_review,400,1466)
triggerheart_exelica_xbla_game_review_03=Trim(triggerheart_exelica_xbla_game_review,1467,2884)
triggerheart_exelica_xbla_game_review_04=Trim(triggerheart_exelica_xbla_game_review,2885,4477)
triggerheart_exelica_xbla_game_review_05=Trim(triggerheart_exelica_xbla_game_review_cache02,4478,5866)
triggerheart_exelica_xbla_game_review_06=Trim(triggerheart_exelica_xbla_game_review,5867,6422)

triggerheart_exelica_enhanced_ps2_op_01=Trim(triggerheart_exelica_enhanced_ps2_op,0,834)
triggerheart_exelica_enhanced_ps2_op_02=Trim(triggerheart_exelica_enhanced_ps2_op,835,1150)
triggerheart_exelica_enhanced_ps2_op_03=Trim(triggerheart_exelica_enhanced_ps2_op,1151,1770)
triggerheart_exelica_enhanced_ps2_op_04=Trim(triggerheart_exelica_enhanced_ps2_op,1771,2077)
triggerheart_exelica_enhanced_ps2_op_05=Trim(triggerheart_exelica_enhanced_ps2_op,2078,2693)
triggerheart_exelica_enhanced_ps2_op_06=Trim(triggerheart_exelica_enhanced_ps2_op,2694,0)

triggerheart_exelica_enhanced_ps2_pv_01=Trim(triggerheart_exelica_enhanced_ps2_pv,360,3153)

######## Pre Combine ########

fade_length=15

triggerheart_exelica_dc_pv_01=AddBorders(triggerheart_exelica_dc_pv_01,68,0,68,0)
triggerheart_exelica_dc_pv_01_fade_out_interlace=FADE_OUT_WITH_BRIGHTNESS_OFFSET(triggerheart_exelica_dc_pv_01,fade_length)
triggerheart_exelica_dc_pv_01_fade_out_deinterlace=Bob(triggerheart_exelica_dc_pv_01_fade_out_interlace)
triggerheart_exelica_dc_pv_01_fade_out=triggerheart_exelica_dc_pv_01_fade_out_deinterlace # select interlace/deinterlace



triggerheart_exelica_enhanced_ps2_op_01_02=triggerheart_exelica_enhanced_ps2_op_01+triggerheart_exelica_enhanced_ps2_op_02
triggerheart_exelica_enhanced_ps2_op_03_04=triggerheart_exelica_enhanced_ps2_op_03+triggerheart_exelica_enhanced_ps2_op_04
triggerheart_exelica_enhanced_ps2_op_05_06=triggerheart_exelica_enhanced_ps2_op_05+triggerheart_exelica_enhanced_ps2_op_06

#triggerheart_exelica_enhanced_ps2_op_01_02=ChangeFPS(triggerheart_exelica_enhanced_ps2_op_01_02,triggerheart_exelica_dc_pv_01_fade_out)
#triggerheart_exelica_enhanced_ps2_op_03_04=ChangeFPS(triggerheart_exelica_enhanced_ps2_op_03_04,triggerheart_exelica_dc_pv_01_fade_out)
#triggerheart_exelica_enhanced_ps2_op_05_06=ChangeFPS(triggerheart_exelica_enhanced_ps2_op_05_06,triggerheart_exelica_dc_pv_01_fade_out)

triggerheart_exelica_enhanced_ps2_op_01_02=CONVERT_24P_TO_60P_PATTERN_AAIBB(triggerheart_exelica_enhanced_ps2_op_01_02)
triggerheart_exelica_enhanced_ps2_op_03_04=CONVERT_24P_TO_60P_PATTERN_AAIBB(triggerheart_exelica_enhanced_ps2_op_03_04)
triggerheart_exelica_enhanced_ps2_op_05_06=CONVERT_24P_TO_60P_PATTERN_AAIBB(triggerheart_exelica_enhanced_ps2_op_05_06)



triggerheart_exelica_enhanced_ps2_pv_01_offset=Trim(triggerheart_exelica_enhanced_ps2_pv_01,15,0)
triggerheart_exelica_enhanced_ps2_pv_overlay_bg=RESIZE_TO_REF_CLIP(triggerheart_exelica_enhanced_ps2_pv_01_offset,triggerheart_exelica_xbla_game_review)
triggerheart_exelica_enhanced_ps2_pv_overlay_fg_01=triggerheart_exelica_xbla_game_review_03
triggerheart_exelica_enhanced_ps2_pv_overlay_fg_02=triggerheart_exelica_xbla_game_review_05

overlay_bg_width=Width(triggerheart_exelica_enhanced_ps2_pv_overlay_bg)
overlay_bg_height=Height(triggerheart_exelica_enhanced_ps2_pv_overlay_bg)
overlay_fg_01_last_frame=Framecount(triggerheart_exelica_enhanced_ps2_pv_overlay_fg_01)-1
overlay_fg_02_last_frame=Framecount(triggerheart_exelica_enhanced_ps2_pv_overlay_fg_02)-1

triggerheart_exelica_enhanced_ps2_pv_overlay=TRANSFORM(triggerheart_exelica_enhanced_ps2_pv_overlay_bg,triggerheart_exelica_enhanced_ps2_pv_overlay_fg_01,dstx="(1.0/4.0)*overlay_bg_width", \
	dsty="Spline(n,0,(1.0/8.0)*overlay_bg_height,190,(1.0/8.0)*overlay_bg_height,240,(2.0/8.0)*overlay_bg_height,340,(4.0/8.0)*overlay_bg_height,390,(5.0/8.0)*overlay_bg_height,overlay_fg_01_last_frame,(5.0/8.0)*overlay_bg_height,cubic=false)", \
	factor="Spline(n,0,0.3,190,0.3,240,0.5,340,0.5,390,0.7,overlay_fg_01_last_frame,0.7,cubic=false)", \
	angle="Spline(n,0,0,190,0,240,0,340,0,390,45,overlay_fg_01_last_frame,45,cubic=false)", \
	opacity="Spline(n,0,0.0,190,0.0,240,1.0,340,1.0,390,0.0,overlay_fg_01_last_frame,0.0,cubic=false)")
triggerheart_exelica_enhanced_ps2_pv_overlay=TRANSFORM(triggerheart_exelica_enhanced_ps2_pv_overlay,triggerheart_exelica_enhanced_ps2_pv_overlay_fg_02,dstx="(3.0/4.0)*overlay_bg_width", \
	dsty="Spline(n,0,(7.0/8.0)*overlay_bg_height,190,(7.0/8.0)*overlay_bg_height,240,(6.0/8.0)*overlay_bg_height,340,(4.0/8.0)*overlay_bg_height,390,(3.0/8.0)*overlay_bg_height,overlay_fg_02_last_frame,(3.0/8.0)*overlay_bg_height,cubic=false)", \
	factor="Spline(n,0,0.3,190,0.3,240,0.5,340,0.5,390,0.7,overlay_fg_02_last_frame,0.7,cubic=false)", \
	angle="Spline(n,0,0,190,0,240,0,340,0,390,45,overlay_fg_02_last_frame,45,cubic=false)", \
	opacity="Spline(n,0,0.0,190,0.0,240,1.0,340,1.0,390,0.0,overlay_fg_02_last_frame,0.0,cubic=false)")

triggerheart_exelica_enhanced_ps2_pv_overlay=OVERWRITE_RANGE(triggerheart_exelica_enhanced_ps2_pv_overlay_bg,ConvertToYV12(triggerheart_exelica_enhanced_ps2_pv_overlay),190,390)



center_x=30
center_y=-295
triggerheart_exelica_enhanced_ps2_op_03_still_frame=TRIM_FIRST_CLIP(triggerheart_exelica_enhanced_ps2_op_03,1)
triggerheart_exelica_enhanced_ps2_op_pre03=LOOP_STILL_FRAME(FAST_ZOOM(triggerheart_exelica_enhanced_ps2_op_03_still_frame,srcx=center_x,srcy=center_y,dstx=center_x,dsty=center_y,factor=0.76),7) \
	+LOOP_STILL_FRAME(FAST_ZOOM(triggerheart_exelica_enhanced_ps2_op_03_still_frame,srcx=center_x,srcy=center_y,dstx=center_x,dsty=center_y,factor=0.86),7) \
	+LOOP_STILL_FRAME(FAST_ZOOM(triggerheart_exelica_enhanced_ps2_op_03_still_frame,srcx=center_x,srcy=center_y,dstx=center_x,dsty=center_y,factor=0.96),6)

triggerheart_exelica_enhanced_ps2_op_pre03=ChangeFPS(triggerheart_exelica_enhanced_ps2_op_pre03,triggerheart_exelica_dc_pv_01_fade_out)
#triggerheart_exelica_enhanced_ps2_op_pre03=CONVERT_24P_TO_60P_PATTERN_AAIBB(triggerheart_exelica_enhanced_ps2_op_pre03)

######## Combine ########

#                                                 assume 24000/1001 fps
#                                         film    then change to 30000/1001 fps
# triggerheart_exelica_enhanced_op_t03    3367    4209
# triggerheart_exelica_enhanced_op_t05    6044    7555
#
# triggerheart_exelica_enhanced_ps2_pv_01    -15

triggerheart_exelica_enhanced_op_t01=RESIZE_TO_REF_CLIP(triggerheart_exelica_enhanced_ps2_op_01_02,triggerheart_exelica_xbla_game_review)
triggerheart_exelica_enhanced_op_t02=TRIM_FIRST_CLIP(triggerheart_exelica_enhanced_ps2_pv_overlay,2770-25)
triggerheart_exelica_enhanced_op_t03=RESIZE_TO_REF_CLIP(triggerheart_exelica_enhanced_ps2_op_pre03+triggerheart_exelica_enhanced_ps2_op_03_04,triggerheart_exelica_xbla_game_review)
triggerheart_exelica_enhanced_op_t04=FADE_OUT_WITH_BRIGHTNESS_OFFSET_RGB24(TRIM_FIRST_CLIP(triggerheart_exelica_xbla_game_review_02,762),fade_length)
triggerheart_exelica_enhanced_op_t05=ConvertToYV12(RESIZE_TO_REF_CLIP(triggerheart_exelica_dc_pv_01_fade_out,triggerheart_exelica_xbla_game_review))
triggerheart_exelica_enhanced_op_t06=RESIZE_TO_REF_CLIP(triggerheart_exelica_enhanced_ps2_op_05_06,triggerheart_exelica_xbla_game_review)
triggerheart_exelica_enhanced_op_t07=BlankClip(triggerheart_exelica_xbla_game_review,length=30*4,color=color_black)

triggerheart_exelica_enhanced_op_mute=triggerheart_exelica_enhanced_op_t01+ChangeFPS(triggerheart_exelica_enhanced_op_t02,triggerheart_exelica_dc_pv_01_fade_out) \
	+triggerheart_exelica_enhanced_op_t03+ChangeFPS(triggerheart_exelica_enhanced_op_t04,triggerheart_exelica_dc_pv_01_fade_out) \
	+triggerheart_exelica_enhanced_op_t05+triggerheart_exelica_enhanced_op_t06+ChangeFPS(triggerheart_exelica_enhanced_op_t07,triggerheart_exelica_dc_pv_01_fade_out)

######## Music ########

bgm_48khz=SSRC(WAVSource("src\triggerheart_exelica_enhanced-op-01.wav"),48000)

#### for MP4 ####
#bgm_48khz_delayed=DelayAudio(bgm_48khz,0.509)

#### for SFD ####
bgm_48khz_delayed=DelayAudio(bgm_48khz,0.454)

AudioDub(triggerheart_exelica_enhanced_op_mute,bgm_48khz_delayed)

######## Subtitle ########

subtitle_x=50
subtitle_y=400
global subtitle_front_fade_count=30
global subtitle_rear_fade_count=30
global subtitle_font="MS Gothic"
global subtitle_effects="bi"
global subtitle_size=28
global subtitle_text_color=OVERWRITE_COLOR_ALPHA(color_purple,$3F)
global subtitle_halo_color=color_white
global subtitle_random_char_func="RANDOM_JIS_CHAR"

function SUBTITLE_FX(clip clip,string text,float x,float y,int start_frame,int end_frame,bool "is_title"){
	is_title=Default(is_title,false)

	halo_color=is_title?color_gold:subtitle_halo_color

	#return SUBTITLE_FX_RANDOM_STRING(clip,text,x,y,start_frame,end_frame,subtitle_front_fade_count,subtitle_rear_fade_count,subtitle_font,subtitle_effects,subtitle_size,subtitle_text_color,halo_color,random_char_func=subtitle_random_char_func) # interlace
	return SUBTITLE_FX_RANDOM_STRING(clip,text,x,y,start_frame*2,end_frame*2,subtitle_front_fade_count*2,subtitle_rear_fade_count*2,subtitle_font,subtitle_effects,subtitle_size,subtitle_text_color,halo_color,random_char_func=subtitle_random_char_func) # deinterlace
}

SUBTITLE_FX("GRAVITY ERROR//彩音|- by fielia@AVISynth",subtitle_x,subtitle_y-subtitle_size,806,1001,true)

SUBTITLE_FX("幾千光年の離れた星でも",subtitle_x,subtitle_y,206,407)
SUBTITLE_FX("掴め!放て!心のトリガーを引け!",subtitle_x,subtitle_y,412,593)

SUBTITLE_FX("運命線飛び越えても どんな未来がまってる?",subtitle_x,subtitle_y,1036,1230)
SUBTITLE_FX("そこが笑顔に溢れる 世界と言えるかな?",subtitle_x,subtitle_y,1231,1424)

SUBTITLE_FX("悪しき影が 穏やかな空を塞ぐ頃",subtitle_x,subtitle_y,1433,1622)
SUBTITLE_FX("戦う事に 忘れかけた天使よ",subtitle_x,subtitle_y,1628,1812)
SUBTITLE_FX("埋もれかけた 誇りとも呼べる翼",subtitle_x,subtitle_y,1823,2013)
SUBTITLE_FX("今羽ばたけ その先にある『あの空へ』",subtitle_x,subtitle_y,2017,2185)

SUBTITLE_FX("Are you ready?",subtitle_x,subtitle_y-subtitle_size,2193,2209)
SUBTITLE_FX("真実を勇気に変え その力をシュートせよ",subtitle_x,subtitle_y,2210,2399)
SUBTITLE_FX("戸惑いのその答えを キミはもう知っている",subtitle_x,subtitle_y,2405,2588)
SUBTITLE_FX("百万光年の離れた星でも|そこに誰かの命が輝くなら",subtitle_x,subtitle_y-subtitle_size,2594,2981)
SUBTITLE_FX("飛び立ったプロミネンス 熱く舞いあがれ",subtitle_x,subtitle_y,2982,3177)
SUBTITLE_FX("掴め!放て!心のトリガーを引け!",subtitle_x,subtitle_y,3181,3360)

SUBTITLE_FX("それはまるで違う星の 戦火を映すニュースと",subtitle_x,subtitle_y,3806,4000)
SUBTITLE_FX("従うだけのハートが 誰かをキズつける",subtitle_x,subtitle_y,4002,4195)

SUBTITLE_FX("呑み込まれる 安らぎと呼べる日常に",subtitle_x,subtitle_y,4203,4392)
SUBTITLE_FX("目を逸らしても それは運命のように",subtitle_x,subtitle_y,4398,4583)
SUBTITLE_FX("だけどそれは 愛するものに背くこと",subtitle_x,subtitle_y,4592,4782)
SUBTITLE_FX("覚醒せよ 光溢れる『未来へと』",subtitle_x,subtitle_y,4787,4956)

SUBTITLE_FX("Are you ready?",subtitle_x,subtitle_y-subtitle_size,4963,4980)
SUBTITLE_FX("風をきるこの感覚 歪みかけたプライド",subtitle_x,subtitle_y,4981,5169)
SUBTITLE_FX("守るべきその何かを キミはもう知っている",subtitle_x,subtitle_y,5176,5357)
SUBTITLE_FX("幾千光年の離れた星でも|そこに何かの希望が輝くなら",subtitle_x,subtitle_y-subtitle_size,5363,5751)
SUBTITLE_FX("引き寄せろエナジーウェイブ 両手に感じて",subtitle_x,subtitle_y,5752,5948)
SUBTITLE_FX("回せ!砕け!心のトリガーを引け!",subtitle_x,subtitle_y,5952,6132)

SUBTITLE_FX("交わされたその約束 途切れそうな旋律も",subtitle_x,subtitle_y,6779,6968)
SUBTITLE_FX("いつしか栄光となり 奏で始める",subtitle_x,subtitle_y,6974,7140)

SUBTITLE_FX("Are you ready?",subtitle_x,subtitle_y-subtitle_size,7149,7166)
SUBTITLE_FX("真実を勇気に変え その力をシュートせよ",subtitle_x,subtitle_y,7167,7356)
SUBTITLE_FX("戸惑いのその答えを キミはもう知っている",subtitle_x,subtitle_y,7362,7546)
SUBTITLE_FX("百万光年の離れた星でも|そこに誰かの命が輝くなら",subtitle_x,subtitle_y-subtitle_size,7550,7938)
SUBTITLE_FX("飛び立ったプロミネンス 熱く舞いあがれ",subtitle_x,subtitle_y,7939,8134)
SUBTITLE_FX("掴め! 放て! 心のトリガーを引け!",subtitle_x,subtitle_y,8139,8317)

######## Post Processing ########

ConvertToYV12()
#ConvertToYUY2()
#ConvertToRGB24()
