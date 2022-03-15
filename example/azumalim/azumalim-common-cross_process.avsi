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

function GENERATE_SCAN_MASK(clip ref_clip,int length){
	scan_width_division=16
	angle=0.0
	factor=1.76

	mask_head=BlankClip(ref_clip,length=length,width=subtitle_clip_width,height=subtitle_clip_height,pixel_type="RGB32",color=color_black)
	mask_body=StackHorizontal(BlankClip(ref_clip,length=length,width=subtitle_clip_width/scan_width_division,height=subtitle_clip_height,pixel_type="RGB32",color=color_black), \
		BlankClip(ref_clip,length=length,width=subtitle_clip_width/scan_width_division,height=subtitle_clip_height,pixel_type="RGB32",color=color_white))
	mask_tail=BlankClip(ref_clip,length=length,width=subtitle_clip_width,height=subtitle_clip_height,pixel_type="RGB32",color=color_white)
	mask_base=StackHorizontal(mask_tail,mask_body,mask_body,mask_body,mask_head)
	x_ratio=Cos(angle*Pi()/180.0)
	y_ratio=Sin(angle*Pi()/180.0)
	point_x_start=subtitle_clip_width/2-subtitle_clip_width*(scan_width_division/2+3)/scan_width_division*factor*x_ratio
	point_x_end=subtitle_clip_width/2+subtitle_clip_width*(scan_width_division/2+3)/scan_width_division*factor*x_ratio
	point_y_start=subtitle_clip_height/2-subtitle_clip_width*(scan_width_division/2+3)/scan_width_division*factor*y_ratio
	point_y_end=subtitle_clip_height/2+subtitle_clip_width*(scan_width_division/2+3)/scan_width_division*factor*y_ratio
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
	subtitle_alpha=Expand(Expand(Expand(subtitle_alpha)))
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

######## YouTube (1920*1080 30p) ########

function AZUMALIM_MV_SENPAI_MP4_REF_SOURCE(){
	azumalim_mv_senpai_mp4_ref=SSRC(FFmpegSource2("src\mv\ÅyÉAÉYÉ}ÉäÉÄÅzêlóﬁÇ›Ç»ÉZÉìÉpÉCÅIÅyMVÅz.720p.mp4",atrack=-1,threads=1),48000)
	return azumalim_mv_senpai_mp4_ref
}

function AZUMALIM_MV_SENPAI_MP4_SOURCE(){
	azumalim_mv_senpai_mp4_video=FFVideoSource("src\mv\ÅyÉAÉYÉ}ÉäÉÄÅzêlóﬁÇ›Ç»ÉZÉìÉpÉCÅIÅyMVÅz.DASH-1080p.mp4",fpsnum=30,fpsden=1,threads=1,seekmode=-1)
	azumalim_mv_senpai_mp4_audio=FFAudioSource("src\mv\ÅyÉAÉYÉ}ÉäÉÄÅzêlóﬁÇ›Ç»ÉZÉìÉpÉCÅIÅyMVÅz.DASH-128k.m4a")
	azumalim_mv_senpai_mp4=AudioDub(azumalim_mv_senpai_mp4_video,azumalim_mv_senpai_mp4_audio)
	azumalim_mv_senpai_mp4=SSRC(azumalim_mv_senpai_mp4,48000)
	return azumalim_mv_senpai_mp4
}

azumalim_mv_senpai=AZUMALIM_MV_SENPAI_MP4_REF_SOURCE()
azumalim_mv_senpai=AZUMALIM_MV_SENPAI_MP4_SOURCE()

######## Trim ########

azumalim_mv_senpai_01=Trim(azumalim_mv_senpai,0,406) #407 x
azumalim_mv_senpai_02=Trim(azumalim_mv_senpai,407,1648)
azumalim_mv_senpai_03_01=Trim(azumalim_mv_senpai,1649,1846) #198 x
azumalim_mv_senpai_03_02=Trim(azumalim_mv_senpai,1847,2019) #173 x
azumalim_mv_senpai_03_03=Trim(azumalim_mv_senpai,2020,2219) #200 x
azumalim_mv_senpai_03_04=Trim(azumalim_mv_senpai,2220,2310) #91 x
azumalim_mv_senpai_04=Trim(azumalim_mv_senpai,2311,2592)
azumalim_mv_senpai_05=Trim(azumalim_mv_senpai,2593,4037)
azumalim_mv_senpai_06_01=Trim(azumalim_mv_senpai,4038,4242) #205 x
azumalim_mv_senpai_06_02=Trim(azumalim_mv_senpai,4243,4421) #179 x
azumalim_mv_senpai_06_03=Trim(azumalim_mv_senpai,4422,4632) #211 x
azumalim_mv_senpai_06_04=Trim(azumalim_mv_senpai,4633,4809) #177 x
azumalim_mv_senpai_06_05=Trim(azumalim_mv_senpai,4810,4994) #185 x
azumalim_mv_senpai_07=Trim(azumalim_mv_senpai,4995,6532)
azumalim_mv_senpai_08_01=Trim(azumalim_mv_senpai,6533,6741) #209 x
azumalim_mv_senpai_08_02=Trim(azumalim_mv_senpai,6742,6918) #177 x
azumalim_mv_senpai_08_03=Trim(azumalim_mv_senpai,6919,7129) #211 x
azumalim_mv_senpai_08_04=Trim(azumalim_mv_senpai,7130,7209) #80 x
azumalim_mv_senpai_09=Trim(azumalim_mv_senpai,7210,0)
