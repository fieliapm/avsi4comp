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

function FRAME_RATE_2X(clip clip,bool enable){
	return enable?SelectEvery(clip,1,0,0):clip
}

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

triggerheart_exelica_enhanced_ps2_pv_path="src\triggerheart_exelica-movie\ps2\mms\EXELICA_08COM.wmv"
#triggerheart_exelica_enhanced_ps2_pv=ASSUME_29_97P(DirectShowSource(triggerheart_exelica_enhanced_ps2_pv_path,seekzero=true))
triggerheart_exelica_enhanced_ps2_pv=FFMS2_VIDEO_SOURCE(triggerheart_exelica_enhanced_ps2_pv_path,fpsnum=ps2_wmv_fpsnum,fpsden=ps2_wmv_fpsden)

######## Trim ########

triggerheart_exelica_dc_pv_01=Trim(triggerheart_exelica_dc_pv,114,1538)
triggerheart_exelica_dc_pv_01_post=Trim(triggerheart_exelica_dc_pv,1539,1764)

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

is_deinterlace=true # select interlace/deinterlace

global frame_index_scale=is_deinterlace?2:1



fade_length=15

triggerheart_exelica_dc_pv_01=AddBorders(triggerheart_exelica_dc_pv_01,68,0,68,0)
triggerheart_exelica_dc_pv_01_fade_out_interlace=FADE_OUT_WITH_BRIGHTNESS_OFFSET(triggerheart_exelica_dc_pv_01,fade_length,false)
triggerheart_exelica_dc_pv_01_fade_out_deinterlace=BOB_PRESERVE_ORIGINAL_FIELD(triggerheart_exelica_dc_pv_01_fade_out_interlace)
triggerheart_exelica_dc_pv_01_fade_out=is_deinterlace?triggerheart_exelica_dc_pv_01_fade_out_deinterlace:triggerheart_exelica_dc_pv_01_fade_out_interlace



triggerheart_exelica_enhanced_ps2_op_01_02=triggerheart_exelica_enhanced_ps2_op_01+triggerheart_exelica_enhanced_ps2_op_02
triggerheart_exelica_enhanced_ps2_op_03_04=triggerheart_exelica_enhanced_ps2_op_03+triggerheart_exelica_enhanced_ps2_op_04
triggerheart_exelica_enhanced_ps2_op_05_06=triggerheart_exelica_enhanced_ps2_op_05+triggerheart_exelica_enhanced_ps2_op_06

triggerheart_exelica_enhanced_ps2_op_01_02=is_deinterlace?CONVERT_24P_TO_60P_PATTERN_AAIBB(triggerheart_exelica_enhanced_ps2_op_01_02):ChangeFPS(triggerheart_exelica_enhanced_ps2_op_01_02,triggerheart_exelica_dc_pv_01_fade_out)
triggerheart_exelica_enhanced_ps2_op_03_04=is_deinterlace?CONVERT_24P_TO_60P_PATTERN_AAIBB(triggerheart_exelica_enhanced_ps2_op_03_04):ChangeFPS(triggerheart_exelica_enhanced_ps2_op_03_04,triggerheart_exelica_dc_pv_01_fade_out)
triggerheart_exelica_enhanced_ps2_op_05_06=is_deinterlace?CONVERT_24P_TO_60P_PATTERN_AAIBB(triggerheart_exelica_enhanced_ps2_op_05_06):ChangeFPS(triggerheart_exelica_enhanced_ps2_op_05_06,triggerheart_exelica_dc_pv_01_fade_out)



triggerheart_exelica_enhanced_ps2_pv_01_offset=Trim(triggerheart_exelica_enhanced_ps2_pv_01,12,0)
triggerheart_exelica_enhanced_ps2_pv_overlay_bg=RESIZE_TO_REF_CLIP(triggerheart_exelica_enhanced_ps2_pv_01_offset,triggerheart_exelica_xbla_game_review)

triggerheart_exelica_enhanced_ps2_pv_overlay_bg_rgb32=ConvertToRGB32(triggerheart_exelica_enhanced_ps2_pv_overlay_bg,matrix="Rec601")
triggerheart_exelica_enhanced_ps2_pv_overlay_fg_01_rgb32=ConvertToRGB32(triggerheart_exelica_xbla_game_review_03,matrix="Rec601")
triggerheart_exelica_enhanced_ps2_pv_overlay_fg_02_rgb32=ConvertToRGB32(triggerheart_exelica_xbla_game_review_05,matrix="Rec601")

overlay_bg_width=Width(triggerheart_exelica_enhanced_ps2_pv_overlay_bg_rgb32)
overlay_bg_height=Height(triggerheart_exelica_enhanced_ps2_pv_overlay_bg_rgb32)
overlay_fg_01_last_frame=Framecount(triggerheart_exelica_enhanced_ps2_pv_overlay_fg_01_rgb32)-1
overlay_fg_02_last_frame=Framecount(triggerheart_exelica_enhanced_ps2_pv_overlay_fg_02_rgb32)-1

# key frame: 1633 1682 1779 1828
anim_fr1=194
anim_fr2=243
anim_fr3=340
anim_fr4=389

triggerheart_exelica_enhanced_ps2_pv_overlay_rgb32=TRANSFORM(triggerheart_exelica_enhanced_ps2_pv_overlay_bg_rgb32,triggerheart_exelica_enhanced_ps2_pv_overlay_fg_01_rgb32,dstx="(1.0/4.0)*overlay_bg_width", \
	dsty="Spline(n,0,(1.0/8.0)*overlay_bg_height,anim_fr1,(1.0/8.0)*overlay_bg_height,anim_fr2,(2.0/8.0)*overlay_bg_height,anim_fr3,(4.0/8.0)*overlay_bg_height,anim_fr4,(5.0/8.0)*overlay_bg_height,overlay_fg_01_last_frame,(5.0/8.0)*overlay_bg_height,cubic=false)", \
	factor="Spline(n,0,0.3,anim_fr1,0.3,anim_fr2,0.5,anim_fr3,0.5,anim_fr4,0.7,overlay_fg_01_last_frame,0.7,cubic=false)", \
	angle="Spline(n,0,0.0,anim_fr1,0.0,anim_fr2,0.0,anim_fr3,0.0,anim_fr4,45.0,overlay_fg_01_last_frame,45.0,cubic=false)", \
	opacity="Spline(n,0,0.0,anim_fr1,0.0,anim_fr2,1.0,anim_fr3,1.0,anim_fr4,0.0,overlay_fg_01_last_frame,0.0,cubic=false)")
triggerheart_exelica_enhanced_ps2_pv_overlay_rgb32=TRANSFORM(triggerheart_exelica_enhanced_ps2_pv_overlay_rgb32,triggerheart_exelica_enhanced_ps2_pv_overlay_fg_02_rgb32,dstx="(3.0/4.0)*overlay_bg_width", \
	dsty="Spline(n,0,(7.0/8.0)*overlay_bg_height,anim_fr1,(7.0/8.0)*overlay_bg_height,anim_fr2,(6.0/8.0)*overlay_bg_height,anim_fr3,(4.0/8.0)*overlay_bg_height,anim_fr4,(3.0/8.0)*overlay_bg_height,overlay_fg_02_last_frame,(3.0/8.0)*overlay_bg_height,cubic=false)", \
	factor="Spline(n,0,0.3,anim_fr1,0.3,anim_fr2,0.5,anim_fr3,0.5,anim_fr4,0.7,overlay_fg_02_last_frame,0.7,cubic=false)", \
	angle="Spline(n,0,0.0,anim_fr1,0.0,anim_fr2,0.0,anim_fr3,0.0,anim_fr4,45.0,overlay_fg_02_last_frame,45.0,cubic=false)", \
	opacity="Spline(n,0,0.0,anim_fr1,0.0,anim_fr2,1.0,anim_fr3,1.0,anim_fr4,0.0,overlay_fg_02_last_frame,0.0,cubic=false)")

triggerheart_exelica_enhanced_ps2_pv_overlay=OVERWRITE_RANGE(triggerheart_exelica_enhanced_ps2_pv_overlay_bg,CONVERT_BACK_TO_YV12(triggerheart_exelica_enhanced_ps2_pv_overlay_rgb32,matrix="Rec601"),anim_fr1,anim_fr4)



pre03_last_still_frame=49
triggerheart_exelica_enhanced_ps2_op_03_still_frame_01=TRIM_ONE_FRAME(triggerheart_exelica_enhanced_ps2_op_03,pre03_last_still_frame)
triggerheart_exelica_enhanced_ps2_op_03_still_frame_02=TRIM_ONE_FRAME(triggerheart_exelica_enhanced_ps2_op_03,pre03_last_still_frame/2)
triggerheart_exelica_enhanced_ps2_op_03_still_frame_03=TRIM_ONE_FRAME(triggerheart_exelica_enhanced_ps2_op_03,0)

center_x=30
center_y=-247
function PRE03_SCALE_FACTOR(float x){
	return Spline(x,0.0,1.0,3.0,0.758,cubic=false)
}
triggerheart_exelica_enhanced_ps2_op_pre03=LOOP_ONE_FRAME(FAST_ZOOM(triggerheart_exelica_enhanced_ps2_op_03_still_frame_01,srcx=center_x,srcy=center_y,dstx=center_x,dsty=center_y,factor=PRE03_SCALE_FACTOR(3.0)),7) \
	+LOOP_ONE_FRAME(FAST_ZOOM(triggerheart_exelica_enhanced_ps2_op_03_still_frame_02,srcx=center_x,srcy=center_y,dstx=center_x,dsty=center_y,factor=PRE03_SCALE_FACTOR(2.0)),7) \
	+LOOP_ONE_FRAME(FAST_ZOOM(triggerheart_exelica_enhanced_ps2_op_03_still_frame_03,srcx=center_x,srcy=center_y,dstx=center_x,dsty=center_y,factor=PRE03_SCALE_FACTOR(1.0)),6)

triggerheart_exelica_enhanced_ps2_op_pre03_frame_count=Framecount(ChangeFPS(triggerheart_exelica_enhanced_ps2_op_pre03,triggerheart_exelica_dc_pv_01_fade_out_interlace))
#triggerheart_exelica_enhanced_ps2_op_pre03=is_deinterlace?CONVERT_24P_TO_60P_PATTERN_AAIBB(triggerheart_exelica_enhanced_ps2_op_pre03):ChangeFPS(triggerheart_exelica_enhanced_ps2_op_pre03,triggerheart_exelica_dc_pv_01_fade_out)
triggerheart_exelica_enhanced_ps2_op_pre03=ChangeFPS(triggerheart_exelica_enhanced_ps2_op_pre03,triggerheart_exelica_dc_pv_01_fade_out)

######## Combine ########

#                                                   assume 24000/1001 fps
#                                           film    then change to 30000/1001 fps
# triggerheart_exelica_enhanced_op_01_02       0       0
# triggerheart_exelica_enhanced_op_03_04    3367    4209
# triggerheart_exelica_enhanced_op_05_06    6044    7555

#                                          at 30000/1001 fps
#                                          absolute offset
# triggerheart_exelica_enhanced_ps2_pv_01    1427     -12

triggerheart_exelica_enhanced_op_t01=RESIZE_TO_REF_CLIP(triggerheart_exelica_enhanced_ps2_op_01_02,triggerheart_exelica_xbla_game_review)
triggerheart_exelica_enhanced_op_t02=TRIM_FIRST_CLIP(triggerheart_exelica_enhanced_ps2_pv_overlay,2770-triggerheart_exelica_enhanced_ps2_op_pre03_frame_count)
triggerheart_exelica_enhanced_op_t03=RESIZE_TO_REF_CLIP(triggerheart_exelica_enhanced_ps2_op_pre03+triggerheart_exelica_enhanced_ps2_op_03_04,triggerheart_exelica_xbla_game_review)
triggerheart_exelica_enhanced_op_t04=FADE_OUT_WITH_BRIGHTNESS_OFFSET(TRIM_FIRST_CLIP(triggerheart_exelica_xbla_game_review_02,762),fade_length,false)
triggerheart_exelica_enhanced_op_t05=ConvertToYV12(RESIZE_TO_REF_CLIP(triggerheart_exelica_dc_pv_01_fade_out,triggerheart_exelica_xbla_game_review))
triggerheart_exelica_enhanced_op_t06=RESIZE_TO_REF_CLIP(triggerheart_exelica_enhanced_ps2_op_05_06,triggerheart_exelica_xbla_game_review)
triggerheart_exelica_enhanced_op_t07=BlankClip(triggerheart_exelica_xbla_game_review,length=30*4,color=color_black)

triggerheart_exelica_enhanced_op_mute=triggerheart_exelica_enhanced_op_t01+FRAME_RATE_2X(triggerheart_exelica_enhanced_op_t02,is_deinterlace) \
	+triggerheart_exelica_enhanced_op_t03+FRAME_RATE_2X(triggerheart_exelica_enhanced_op_t04,is_deinterlace) \
	+triggerheart_exelica_enhanced_op_t05+triggerheart_exelica_enhanced_op_t06+FRAME_RATE_2X(triggerheart_exelica_enhanced_op_t07,is_deinterlace)

######## Music ########

bgm_48khz=SSRC(WAVSource("src\triggerheart_exelica_enhanced-op-01.wav"),48000)

#### for MP4 ####
#bgm_48khz_delayed=DelayAudio(bgm_48khz,0.509)

#### for SFD ####
bgm_48khz_delayed=DelayAudio(bgm_48khz,0.454)

Normalize(AudioDub(triggerheart_exelica_enhanced_op_mute,bgm_48khz_delayed))



ConvertToRGB32(matrix="Rec601")

thumbnail=Trim(4439*frame_index_scale,-30*5*frame_index_scale)

######## Subtitle ########

global subtitle_heavy_halo_width=1
global subtitle_clip_width=1280
global subtitle_clip_height=720

subtitle_x=50*1.5
subtitle_y=393*1.5
global subtitle_front_fade_count=30
global subtitle_rear_fade_count=30
global subtitle_font="MS Gothic"
global subtitle_effects="bi"
global subtitle_size=32*1.5
global subtitle_text_color=OVERWRITE_SUBTITLE_COLOR_ALPHA(color_purple,$C0)
global subtitle_halo_color=color_white
global subtitle_random_char_func="RANDOM_JIS_CHAR"

function SUBTITLE_FX(clip clip,string text,float x,float y,int start_frame,int end_frame,bool "is_title"){
	is_title=Default(is_title,false)

	halo_color=is_title?color_gold:subtitle_halo_color

	return SUBTITLE_FX_RANDOM_STRING(clip,text,Round(x),Round(y),start_frame*frame_index_scale,end_frame*frame_index_scale,subtitle_front_fade_count*frame_index_scale,subtitle_rear_fade_count*frame_index_scale,subtitle_font,subtitle_effects,Round(subtitle_size),subtitle_text_color,halo_color,"ex_heavy",subtitle_random_char_func) # deinterlace
}

SUBTITLE_FX("GRAVITY ERROR//彩音|- by fielia@AVISynth",subtitle_x,subtitle_y-subtitle_size,806,1001,true)

SUBTITLE_FX("幾千光年の離れた星でも",subtitle_x,subtitle_y,204,407)
SUBTITLE_FX("掴め!放て!心のトリガーを引け!",subtitle_x,subtitle_y,410,593)

SUBTITLE_FX("運命線飛び越えても どんな未来がまってる?",subtitle_x,subtitle_y,1035,1227)
SUBTITLE_FX("そこが笑顔に溢れる 世界と言えるかな?",subtitle_x,subtitle_y,1228,1424)

SUBTITLE_FX("悪しき影が 穏やかな空を塞ぐ頃",subtitle_x,subtitle_y,1430,1622)
SUBTITLE_FX("戦う事に 忘れかけた天使よ",subtitle_x,subtitle_y,1627,1814)
SUBTITLE_FX("埋もれかけた 誇りとも呼べる翼",subtitle_x,subtitle_y,1819,2012)
SUBTITLE_FX("今羽ばたけ その先にある『あの空へ』",subtitle_x,subtitle_y,2013,2185)

SUBTITLE_FX("Are you ready?",subtitle_x,subtitle_y-subtitle_size,2190,2205)
SUBTITLE_FX("真実を勇気に変え その力をシュートせよ",subtitle_x,subtitle_y,2206,2399)
SUBTITLE_FX("戸惑いのその答えを キミはもう知っている",subtitle_x,subtitle_y,2404,2588)
SUBTITLE_FX("百万光年の離れた星でも|そこに誰かの命が輝くなら",subtitle_x,subtitle_y-subtitle_size,2590,2980)
SUBTITLE_FX("飛び立ったプロミネンス 熱く舞いあがれ",subtitle_x,subtitle_y,2981,3177)
SUBTITLE_FX("掴め!放て!心のトリガーを引け!",subtitle_x,subtitle_y,3179,3360)

SUBTITLE_FX("それはまるで違う星の 戦火を映すニュースと",subtitle_x,subtitle_y,3802,3998)
SUBTITLE_FX("従うだけのハートが 誰かをキズつける",subtitle_x,subtitle_y,3999,4194)

SUBTITLE_FX("呑み込まれる 安らぎと呼べる日常に",subtitle_x,subtitle_y,4199,4392)
SUBTITLE_FX("目を逸らしても それは運命のように",subtitle_x,subtitle_y,4393,4583)
SUBTITLE_FX("だけどそれは 愛するものに背くこと",subtitle_x,subtitle_y,4591,4781)
SUBTITLE_FX("覚醒せよ 光溢れる『未来へと』",subtitle_x,subtitle_y,4786,4956)

SUBTITLE_FX("Are you ready?",subtitle_x,subtitle_y-subtitle_size,4960,4979)
SUBTITLE_FX("風をきるこの感覚 歪みかけたプライド",subtitle_x,subtitle_y,4980,5169)
SUBTITLE_FX("守るべきその何かを キミはもう知っている",subtitle_x,subtitle_y,5171,5356)
SUBTITLE_FX("幾千光年の離れた星でも|そこに何かの希望が輝くなら",subtitle_x,subtitle_y-subtitle_size,5359,5749)
SUBTITLE_FX("引き寄せろエナジーウェイブ 両手に感じて",subtitle_x,subtitle_y,5750,5947)
SUBTITLE_FX("回せ!砕け!心のトリガーを引け!",subtitle_x,subtitle_y,5948,6131)

SUBTITLE_FX("交わされたその約束 途切れそうな旋律も",subtitle_x,subtitle_y,6778,6967)
SUBTITLE_FX("いつしか栄光となり 奏で始める",subtitle_x,subtitle_y,6972,7140)

SUBTITLE_FX("Are you ready?",subtitle_x,subtitle_y-subtitle_size,7147,7163)
SUBTITLE_FX("真実を勇気に変え その力をシュートせよ",subtitle_x,subtitle_y,7164,7356)
SUBTITLE_FX("戸惑いのその答えを キミはもう知っている",subtitle_x,subtitle_y,7361,7545)
SUBTITLE_FX("百万光年の離れた星でも|そこに誰かの命が輝くなら",subtitle_x,subtitle_y-subtitle_size,7547,7937)
SUBTITLE_FX("飛び立ったプロミネンス 熱く舞いあがれ",subtitle_x,subtitle_y,7938,8134)
SUBTITLE_FX("掴め! 放て! 心のトリガーを引け!",subtitle_x,subtitle_y,8136,8317)



#thumbnail

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
