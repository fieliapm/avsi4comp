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

Import("..\..\avsi4comp\avsi4comp.avsi")

### inherit end ###

Import("super_cub-tv-common.avsi")

######## Function ########

### inherit start ###

LoadPlugin("..\plugins\MaskTools.dll")

function SUBTITLE_FX_FADE_IN_FADE_OUT_DOUBLE_HALO(clip clip,string text,int x,int y,int start_frame,int end_frame,int front_fade_count,int rear_fade_count,string "font",string "effects",int "size",int "text_color",int "halo_color",int "outside_halo_color",string "subtitle_mode"){
	before_start_frame=start_frame-front_fade_count
	after_end_frame=end_frame+rear_fade_count

	Assert(IsRGB32(clip),"SUBTITLE_FX_FADE_IN_FADE_OUT_DOUBLE_HALO(): clip only support RGB32 format")

	subtitle_rgb=_SUBTITLE_FX_PRE_OPAQUE(clip,outside_halo_color,text,x,y,before_start_frame,after_end_frame,font,effects,size,text_color,halo_color,subtitle_mode)
	subtitle_rgba=ColorKeyMask(ResetMask(subtitle_rgb),outside_halo_color,0)

	subtitle_alpha=CONVERT_BACK_TO_YV12(ShowAlpha(subtitle_rgba),matrix="Rec709")
	subtitle_alpha=Expand(Expand(Expand(subtitle_alpha)))
	subtitle_alpha=ConvertToRGB32(Greyscale(subtitle_alpha),matrix="Rec709")

	subtitle_rgba=Mask(subtitle_rgba,subtitle_alpha)

	subtitle_rgba_faded_containing_parameter=ScriptClip(subtitle_rgba,"RGBAdjust(a=alpha_factor)")
	subtitle_rgba_faded=FrameEvaluate(subtitle_rgba_faded_containing_parameter,"alpha_factor=Spline(current_frame,"+String(before_start_frame)+",0.0,"+String(start_frame)+",1.0,"+String(end_frame)+",1.0,"+String(after_end_frame)+",0.0,cubic=false)")

	return _SUBTITLE_FX_POST(clip,subtitle_rgba_faded,before_start_frame,after_end_frame)
}

### inherit end ###

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



function MULTIPLE_BLUR(clip clip,int count){
	return count>0?MULTIPLE_BLUR(Blur(clip,1.0),count-1):clip
}

global blur_amount=256

function BLUR_IN(clip clip,int length){
	return ScriptClip(clip,"MULTIPLE_BLUR(Round(Spline(current_frame,0,blur_amount,("+String(length)+"),0,Framecount()-1,0,cubic=false)))")
}

function BLUR_OUT(clip clip,int length){
	return ScriptClip(clip,"MULTIPLE_BLUR(Round(Spline(current_frame,0,0,Framecount()-1-("+String(length)+"),0,Framecount()-1,blur_amount,cubic=false)))")
}

function IMG_SOURCE(string path,int length){
	return AUDIO_DUB_TONE(ImageSource(path,0,length-1,24000.0/1001.0,pixel_type="rgb32"),samplerate=48000,channels=2,type="Silence")
}

function PAPER_EFFECT(clip clip){
	return clip
}

function VIGNETTING_EFFECT(clip clip){
	clip=Layer(Loop(super_cub_tv_ed_bg,Framecount(clip)),clip,op="mul")
	return CONVERT_BACK_TO_YV12(clip,matrix="Rec709")
}

######## Novel (1523*2160) ########

super_cub_novel_01_koguma_lie_on_bed=IMG_SOURCE("src\[Novel] スーパーカブ 第01-06巻 [Supa Kabu vol 01-06]\スーパーカブ 01\003.jpg",104+109) # ed

super_cub_novel_02_koguma_info=IMG_SOURCE("src\[Novel] スーパーカブ 第01-06巻 [Supa Kabu vol 01-06]\スーパーカブ 02\003.jpg",1)
super_cub_novel_02_reiko_info=IMG_SOURCE("src\[Novel] スーパーカブ 第01-06巻 [Supa Kabu vol 01-06]\スーパーカブ 02\004.jpg",1)
super_cub_novel_02_shii_info=IMG_SOURCE("src\[Novel] スーパーカブ 第01-06巻 [Supa Kabu vol 01-06]\スーパーカブ 02\005.jpg",1)

super_cub_novel_03_cover=IMG_SOURCE("src\[Novel] スーパーカブ 第01-06巻 [Supa Kabu vol 01-06]\スーパーカブ 03\001.jpg",195) # ed

######## Novel (1040*1440) ########

super_cub_novel_01_koguma_feel_heavy=IMG_SOURCE("src\[Novel] スーパーカブ 第01-06巻 [Supa Kabu vol 01-06]\スーパーカブ 01\035.jpg",1)
super_cub_novel_01_reiko=IMG_SOURCE("src\[Novel] スーパーカブ 第01-06巻 [Supa Kabu vol 01-06]\スーパーカブ 01\052.jpg",1)
super_cub_novel_01_koguma_see_note=IMG_SOURCE("src\[Novel] スーパーカブ 第01-06巻 [Supa Kabu vol 01-06]\スーパーカブ 01\109.jpg",172+35) # ed
super_cub_novel_01_koguma_bring_document=IMG_SOURCE("src\[Novel] スーパーカブ 第01-06巻 [Supa Kabu vol 01-06]\スーパーカブ 01\135.jpg",135+49+35) # ed
super_cub_novel_01_koguma_in_teacher_office=IMG_SOURCE("src\[Novel] スーパーカブ 第01-06巻 [Supa Kabu vol 01-06]\スーパーカブ 01\141.jpg",69+150) # ed
super_cub_novel_01_koguma_and_reiko_on_bed=IMG_SOURCE("src\[Novel] スーパーカブ 第01-06巻 [Supa Kabu vol 01-06]\スーパーカブ 01\196.jpg",357) # ed
super_cub_novel_01_koguma_and_reiko_take_bath=IMG_SOURCE("src\[Novel] スーパーカブ 第01-06巻 [Supa Kabu vol 01-06]\スーパーカブ 01\273.jpg",218) # ed
super_cub_novel_01_cover=IMG_SOURCE("src\[Novel] スーパーカブ 第01-06巻 [Supa Kabu vol 01-06]\スーパーカブ 01\282.jpg",104+115) # ed

super_cub_novel_02_koguma_and_reiko_eat=IMG_SOURCE("src\[Novel] スーパーカブ 第01-06巻 [Supa Kabu vol 01-06]\スーパーカブ 02\038.jpg",69+150) # ed
super_cub_novel_02_shii_in_rear_mirror=IMG_SOURCE("src\[Novel] スーパーカブ 第01-06巻 [Supa Kabu vol 01-06]\スーパーカブ 02\060.jpg",172) # ed
super_cub_novel_02_koguma_cook_rice=IMG_SOURCE("src\[Novel] スーパーカブ 第01-06巻 [Supa Kabu vol 01-06]\スーパーカブ 02\084.jpg",107) # ed
super_cub_novel_02_reiko_consider_putting_shii_in_basket=IMG_SOURCE("src\[Novel] スーパーカブ 第01-06巻 [Supa Kabu vol 01-06]\スーパーカブ 02\122.jpg",213+32+220) # ed
super_cub_novel_02_koguma_reko_shii_play_with_snow=IMG_SOURCE("src\[Novel] スーパーカブ 第01-06巻 [Supa Kabu vol 01-06]\スーパーカブ 02\163.jpg",79+52+60) # ed
super_cub_novel_02_cover=IMG_SOURCE("src\[Novel] スーパーカブ 第01-06巻 [Supa Kabu vol 01-06]\スーパーカブ 02\247.jpg",427) # ed

super_cub_novel_03_koguma_consider_future=IMG_SOURCE("src\[Novel] スーパーカブ 第01-06巻 [Supa Kabu vol 01-06]\スーパーカブ 03\057.jpg",213) # ed
super_cub_novel_03_koguma_ride_super_cub=IMG_SOURCE("src\[Novel] スーパーカブ 第01-06巻 [Supa Kabu vol 01-06]\スーパーカブ 03\274.jpg",104+109) # ed

super_cub_novel_04_super_cub_go_to_mountain=IMG_SOURCE("src\[Novel] スーパーカブ 第01-06巻 [Supa Kabu vol 01-06]\スーパーカブ 04\254.jpg",92) # ed

super_cub_novel_05_koguma_and_reiko_do_fist_bump=IMG_SOURCE("src\[Novel] スーパーカブ 第01-06巻 [Supa Kabu vol 01-06]\スーパーカブ 05\249.jpg",53+53+71) #ed

super_cub_novel_06_koguma_reiko_shii_graduated=IMG_SOURCE("src\[Novel] スーパーカブ 第01-06巻 [Supa Kabu vol 01-06]\スーパーカブ 06\017.jpg",213) # ed

######## Pre Combine ########

fade_length=12



super_cub_tv_ed_bg=TRIM_FIRST_CLIP(super_cub_tv_clean_ed_02_cache02,1)
global super_cub_tv_ed_bg=ConvertToRGB32(super_cub_tv_ed_bg,matrix="Rec709")



super_cub_novel_03_cover_width_extend=1920-Width(super_cub_novel_03_cover)
super_cub_novel_03_cover_scale=Float(1920)/Float(Width(super_cub_novel_03_cover))
super_cub_novel_03_cover_extend=AddBorders(super_cub_novel_03_cover,super_cub_novel_03_cover_width_extend/2,0,super_cub_novel_03_cover_width_extend-super_cub_novel_03_cover_width_extend/2,0,color=color_white)
super_cub_novel_03_cover_moving=ScriptClip(super_cub_novel_03_cover_extend,"FAST_ZOOM(dstx=0.5*Width(),dsty=Spline(current_frame,0,0.6,Framecount()-1,0.25,cubic=false)*Height(),factor=super_cub_novel_03_cover_scale,extend=true)")
super_cub_novel_03_cover_moving=Crop(super_cub_novel_03_cover_moving,0,0,1920,1080)
super_cub_novel_03_cover_moving=PAPER_EFFECT(super_cub_novel_03_cover_moving)



super_cub_novel_01_koguma_lie_on_bed_moving_01=Zoom(super_cub_novel_01_koguma_lie_on_bed,srcy="Height(super_cub_novel_01_koguma_lie_on_bed)*2/3",dstx="Width(super_cub_tv_clean_ed)/2",dsty="Height(super_cub_tv_clean_ed)/2+Spline(n,0,300,104,100,cubic=false)",factor="0.5",angle="Spline(n,0,-45,104,-30,cubic=false)",width=Width(super_cub_tv_clean_ed),height=Height(super_cub_tv_clean_ed))
super_cub_novel_01_koguma_lie_on_bed_moving_01=PAPER_EFFECT(super_cub_novel_01_koguma_lie_on_bed_moving_01)
super_cub_novel_01_koguma_lie_on_bed_moving_02=Zoom(super_cub_novel_01_koguma_lie_on_bed,srcy="Height(super_cub_novel_01_koguma_lie_on_bed)*2/3",dstx="Width(super_cub_tv_clean_ed)/2",dsty="Height(super_cub_tv_clean_ed)/2",factor="Spline(n,0,0.9,109,1.1,cubic=false)",angle="Spline(n,0,-45,109,-30,cubic=false)",width=Width(super_cub_tv_clean_ed),height=Height(super_cub_tv_clean_ed))
super_cub_novel_01_koguma_lie_on_bed_moving_02=PAPER_EFFECT(super_cub_novel_01_koguma_lie_on_bed_moving_02)

super_cub_novel_01_koguma_see_note_moving_01=Zoom(super_cub_novel_01_koguma_see_note,srcy="Height(super_cub_novel_01_koguma_see_note)/3",dstx="Width(super_cub_tv_clean_ed)/2",dsty="Height(super_cub_tv_clean_ed)/2+Spline(n,0,-600,172,0,cubic=false)",factor="1.5",width=Width(super_cub_tv_clean_ed),height=Height(super_cub_tv_clean_ed))
super_cub_novel_01_koguma_see_note_moving_01=PAPER_EFFECT(super_cub_novel_01_koguma_see_note_moving_01)
super_cub_novel_01_koguma_see_note_moving_02=Zoom(super_cub_novel_01_koguma_see_note,srcy="Height(super_cub_novel_01_koguma_see_note)/3",dstx="Width(super_cub_tv_clean_ed)/2+Spline(n,0,100,35,-100,cubic=false)",dsty="Height(super_cub_tv_clean_ed)/2",factor="3.0",width=Width(super_cub_tv_clean_ed),height=Height(super_cub_tv_clean_ed))
super_cub_novel_01_koguma_see_note_moving_02=PAPER_EFFECT(super_cub_novel_01_koguma_see_note_moving_02)

super_cub_novel_01_koguma_bring_document_moving_01=Zoom(super_cub_novel_01_koguma_bring_document,srcy="Height(super_cub_novel_01_koguma_bring_document)/3",dstx="Width(super_cub_tv_clean_ed)/2",dsty="Height(super_cub_tv_clean_ed)/2+Spline(n,0,-600,135,100,cubic=false)",factor="1.5",width=Width(super_cub_tv_clean_ed),height=Height(super_cub_tv_clean_ed))
super_cub_novel_01_koguma_bring_document_moving_01=PAPER_EFFECT(super_cub_novel_01_koguma_bring_document_moving_01)
super_cub_novel_01_koguma_bring_document_moving_02=Zoom(super_cub_novel_01_koguma_bring_document,srcy="Height(super_cub_novel_01_koguma_bring_document)/3",dstx="Width(super_cub_tv_clean_ed)/2",dsty="Height(super_cub_tv_clean_ed)/2",factor="Spline(n,0,3.0,49+35,3.5,cubic=false)",width=Width(super_cub_tv_clean_ed),height=Height(super_cub_tv_clean_ed))
super_cub_novel_01_koguma_bring_document_moving_02=PAPER_EFFECT(super_cub_novel_01_koguma_bring_document_moving_02)

super_cub_novel_01_koguma_in_teacher_office_moving_01=Zoom(super_cub_novel_01_koguma_in_teacher_office,dstx="Width(super_cub_tv_clean_ed)/2+Spline(n,0,-100,69,100,cubic=false)",dsty="Height(super_cub_tv_clean_ed)/2",factor="1.6",width=Width(super_cub_tv_clean_ed),height=Height(super_cub_tv_clean_ed))
super_cub_novel_01_koguma_in_teacher_office_moving_01=PAPER_EFFECT(super_cub_novel_01_koguma_in_teacher_office_moving_01)
super_cub_novel_01_koguma_in_teacher_office_moving_02=Zoom(super_cub_novel_01_koguma_in_teacher_office,dstx="Width(super_cub_tv_clean_ed)/2+Spline(n,0,-200,150,200,cubic=false)",dsty="Height(super_cub_tv_clean_ed)/2",factor="0.8",width=Width(super_cub_tv_clean_ed),height=Height(super_cub_tv_clean_ed))
super_cub_novel_01_koguma_in_teacher_office_moving_02=PAPER_EFFECT(super_cub_novel_01_koguma_in_teacher_office_moving_02)

super_cub_novel_01_koguma_and_reiko_on_bed_moving=Zoom(super_cub_novel_01_koguma_and_reiko_on_bed,dstx="Width(super_cub_tv_clean_ed)/2",dsty="Height(super_cub_tv_clean_ed)/2+Spline(n,0,300,Framecount(super_cub_novel_01_koguma_and_reiko_on_bed),-200,cubic=false)",factor="1.5",width=Width(super_cub_tv_clean_ed),height=Height(super_cub_tv_clean_ed))
super_cub_novel_01_koguma_and_reiko_on_bed_moving=PAPER_EFFECT(super_cub_novel_01_koguma_and_reiko_on_bed_moving)

super_cub_novel_01_koguma_and_reiko_take_bath_moving=Zoom(super_cub_novel_01_koguma_and_reiko_take_bath,dstx="Width(super_cub_tv_clean_ed)/2+Spline(n,0,400,Framecount(super_cub_novel_01_koguma_and_reiko_take_bath),200,cubic=false)",dsty="Height(super_cub_tv_clean_ed)/2",factor="1.0",width=Width(super_cub_tv_clean_ed),height=Height(super_cub_tv_clean_ed))
super_cub_novel_01_koguma_and_reiko_take_bath_moving=PAPER_EFFECT(super_cub_novel_01_koguma_and_reiko_take_bath_moving)

super_cub_novel_01_cover_moving_01=Zoom(super_cub_novel_01_cover,srcy="Height(super_cub_novel_01_cover)/4",dstx="Width(super_cub_tv_clean_ed)/2",dsty="Height(super_cub_tv_clean_ed)/2+Spline(n,0,-1200,104,0,cubic=false)",factor="3.1",width=Width(super_cub_tv_clean_ed),height=Height(super_cub_tv_clean_ed))
super_cub_novel_01_cover_moving_01=PAPER_EFFECT(super_cub_novel_01_cover_moving_01)
super_cub_novel_01_cover_moving_02=Zoom(super_cub_novel_01_cover,srcy="Height(super_cub_novel_01_cover)/4",dstx="Width(super_cub_tv_clean_ed)/2+Spline(n,0,-100,115,100,cubic=false)",dsty="Height(super_cub_tv_clean_ed)/2",factor="4.0",width=Width(super_cub_tv_clean_ed),height=Height(super_cub_tv_clean_ed))
super_cub_novel_01_cover_moving_02=PAPER_EFFECT(super_cub_novel_01_cover_moving_02)

super_cub_novel_02_koguma_and_reiko_eat_moving_01=Zoom(super_cub_novel_02_koguma_and_reiko_eat,srcy="Height(super_cub_novel_02_koguma_and_reiko_eat)*2/5",dstx="Width(super_cub_tv_clean_ed)/2+Spline(n,0,100,69,-100,cubic=false)",dsty="Height(super_cub_tv_clean_ed)/2",factor="3.0",width=Width(super_cub_tv_clean_ed),height=Height(super_cub_tv_clean_ed))
super_cub_novel_02_koguma_and_reiko_eat_moving_01=PAPER_EFFECT(super_cub_novel_02_koguma_and_reiko_eat_moving_01)
super_cub_novel_02_koguma_and_reiko_eat_moving_02=Zoom(super_cub_novel_02_koguma_and_reiko_eat,srcy="Height(super_cub_novel_02_koguma_and_reiko_eat)*2/5",dstx="Width(super_cub_tv_clean_ed)/2+Spline(n,0,100,150,-100,cubic=false)",dsty="Height(super_cub_tv_clean_ed)/2",factor="1.5",width=Width(super_cub_tv_clean_ed),height=Height(super_cub_tv_clean_ed))
super_cub_novel_02_koguma_and_reiko_eat_moving_02=PAPER_EFFECT(super_cub_novel_02_koguma_and_reiko_eat_moving_02)

super_cub_novel_02_shii_in_rear_mirror_moving=Zoom(super_cub_novel_02_shii_in_rear_mirror,dstx="Width(super_cub_tv_clean_ed)/2",dsty="Height(super_cub_tv_clean_ed)/2+Spline(n,0,-500,Framecount(super_cub_novel_02_shii_in_rear_mirror),700,cubic=false)",factor="2.0",width=Width(super_cub_tv_clean_ed),height=Height(super_cub_tv_clean_ed))
super_cub_novel_02_shii_in_rear_mirror_moving=PAPER_EFFECT(super_cub_novel_02_shii_in_rear_mirror_moving)

super_cub_novel_02_reiko_consider_putting_shii_in_basket_moving=Zoom(super_cub_novel_02_reiko_consider_putting_shii_in_basket,dstx="Width(super_cub_tv_clean_ed)/2",dsty="Height(super_cub_tv_clean_ed)/2+Spline(n,0,0,213,100,213+32,900,213+32+220,1000,cubic=false)",factor="2.5",width=Width(super_cub_tv_clean_ed),height=Height(super_cub_tv_clean_ed))
super_cub_novel_02_reiko_consider_putting_shii_in_basket_moving=PAPER_EFFECT(super_cub_novel_02_reiko_consider_putting_shii_in_basket_moving)

super_cub_novel_02_koguma_cook_rice_moving=Zoom(super_cub_novel_02_koguma_cook_rice,dstx="Width(super_cub_tv_clean_ed)/2",dsty="Height(super_cub_tv_clean_ed)/2+Spline(n,0,100,Framecount(super_cub_novel_02_koguma_cook_rice),-100,cubic=false)",factor="1.5",width=Width(super_cub_tv_clean_ed),height=Height(super_cub_tv_clean_ed))
super_cub_novel_02_koguma_cook_rice_moving=PAPER_EFFECT(super_cub_novel_02_koguma_cook_rice_moving)

super_cub_novel_02_koguma_reko_shii_play_with_snow_moving_01=Zoom(super_cub_novel_02_koguma_reko_shii_play_with_snow,dstx="Width(super_cub_tv_clean_ed)/2+Spline(n,0,-600,79,-700,cubic=false)",dsty="Height(super_cub_tv_clean_ed)/2",factor="1.6",width=Width(super_cub_tv_clean_ed),height=Height(super_cub_tv_clean_ed))
super_cub_novel_02_koguma_reko_shii_play_with_snow_moving_01=PAPER_EFFECT(super_cub_novel_02_koguma_reko_shii_play_with_snow_moving_01)
super_cub_novel_02_koguma_reko_shii_play_with_snow_moving_02=Zoom(super_cub_novel_02_koguma_reko_shii_play_with_snow,dstx="Width(super_cub_tv_clean_ed)/2+Spline(n,0,600,52,700,cubic=false)",dsty="Height(super_cub_tv_clean_ed)/2",factor="1.6",width=Width(super_cub_tv_clean_ed),height=Height(super_cub_tv_clean_ed))
super_cub_novel_02_koguma_reko_shii_play_with_snow_moving_02=PAPER_EFFECT(super_cub_novel_02_koguma_reko_shii_play_with_snow_moving_02)
super_cub_novel_02_koguma_reko_shii_play_with_snow_moving_03=Zoom(super_cub_novel_02_koguma_reko_shii_play_with_snow,dstx="Width(super_cub_tv_clean_ed)/2",dsty="Height(super_cub_tv_clean_ed)/2",factor="Spline(n,0,0.9,60,0.8,cubic=false)",angle="Spline(n,0,10,60,-10,cubic=false)",width=Width(super_cub_tv_clean_ed),height=Height(super_cub_tv_clean_ed))
super_cub_novel_02_koguma_reko_shii_play_with_snow_moving_03=PAPER_EFFECT(super_cub_novel_02_koguma_reko_shii_play_with_snow_moving_03)

super_cub_novel_02_cover_moving=Zoom(super_cub_novel_02_cover,dstx="Width(super_cub_tv_clean_ed)/2",dsty="Height(super_cub_tv_clean_ed)/2+Spline(n,0,1500,Framecount(super_cub_novel_02_cover),-1200,cubic=false)",factor="3.0",width=Width(super_cub_tv_clean_ed),height=Height(super_cub_tv_clean_ed))
super_cub_novel_02_cover_moving=PAPER_EFFECT(super_cub_novel_02_cover_moving)

super_cub_novel_03_koguma_ride_super_cub_moving_01=Zoom(super_cub_novel_03_koguma_ride_super_cub,srcy="Height(super_cub_novel_03_koguma_ride_super_cub)*3/5",dstx="Width(super_cub_tv_clean_ed)/2",dsty="Height(super_cub_tv_clean_ed)/2+Spline(n,0,600,104,0,cubic=false)",factor="1.5",width=Width(super_cub_tv_clean_ed),height=Height(super_cub_tv_clean_ed))
super_cub_novel_03_koguma_ride_super_cub_moving_01=PAPER_EFFECT(super_cub_novel_03_koguma_ride_super_cub_moving_01)
super_cub_novel_03_koguma_ride_super_cub_moving_02=Zoom(super_cub_novel_03_koguma_ride_super_cub,srcy="Height(super_cub_novel_03_koguma_ride_super_cub)*3/5",dstx="Width(super_cub_tv_clean_ed)/2",dsty="Height(super_cub_tv_clean_ed)/2",factor="2.0",angle="Spline(n,0,0,109,30,cubic=false)",width=Width(super_cub_tv_clean_ed),height=Height(super_cub_tv_clean_ed))
super_cub_novel_03_koguma_ride_super_cub_moving_02=PAPER_EFFECT(super_cub_novel_03_koguma_ride_super_cub_moving_02)

super_cub_novel_03_koguma_consider_future_moving=Zoom(super_cub_novel_03_koguma_consider_future,dstx="Width(super_cub_tv_clean_ed)/2",dsty="Height(super_cub_tv_clean_ed)/2",factor="Spline(n,0,3.0,Framecount(super_cub_novel_03_koguma_consider_future),1.5,cubic=false)",width=Width(super_cub_tv_clean_ed),height=Height(super_cub_tv_clean_ed))
super_cub_novel_03_koguma_consider_future_moving=PAPER_EFFECT(super_cub_novel_03_koguma_consider_future_moving)

super_cub_novel_04_super_cub_go_to_mountain_moving=Zoom(super_cub_novel_04_super_cub_go_to_mountain,dstx="Width(super_cub_tv_clean_ed)/2",dsty="Height(super_cub_tv_clean_ed)/2+Spline(n,0,-300,Framecount(super_cub_novel_04_super_cub_go_to_mountain),600,cubic=false)",factor="2.5",width=Width(super_cub_tv_clean_ed),height=Height(super_cub_tv_clean_ed))
super_cub_novel_04_super_cub_go_to_mountain_moving=PAPER_EFFECT(super_cub_novel_04_super_cub_go_to_mountain_moving)

super_cub_novel_05_koguma_and_reiko_do_fist_bump_moving_01=Zoom(super_cub_novel_05_koguma_and_reiko_do_fist_bump,dstx="Width(super_cub_tv_clean_ed)/2",dsty="Height(super_cub_tv_clean_ed)/2+Spline(n,0,1000,53,900,cubic=false)",factor="3.0",width=Width(super_cub_tv_clean_ed),height=Height(super_cub_tv_clean_ed))
super_cub_novel_05_koguma_and_reiko_do_fist_bump_moving_01=PAPER_EFFECT(super_cub_novel_05_koguma_and_reiko_do_fist_bump_moving_01)
super_cub_novel_05_koguma_and_reiko_do_fist_bump_moving_02=Zoom(super_cub_novel_05_koguma_and_reiko_do_fist_bump,dstx="Width(super_cub_tv_clean_ed)/2",dsty="Height(super_cub_tv_clean_ed)/2+Spline(n,0,-300,53,-200,cubic=false)",factor="3.0",width=Width(super_cub_tv_clean_ed),height=Height(super_cub_tv_clean_ed))
super_cub_novel_05_koguma_and_reiko_do_fist_bump_moving_02=PAPER_EFFECT(super_cub_novel_05_koguma_and_reiko_do_fist_bump_moving_02)
super_cub_novel_05_koguma_and_reiko_do_fist_bump_moving_03=Zoom(super_cub_novel_05_koguma_and_reiko_do_fist_bump,dstx="Width(super_cub_tv_clean_ed)/2",dsty="Height(super_cub_tv_clean_ed)/2+200",factor="Spline(n,0,2.0,71,1.2,cubic=false)",angle="Spline(n,0,-10,71,10,cubic=false)",width=Width(super_cub_tv_clean_ed),height=Height(super_cub_tv_clean_ed))
super_cub_novel_05_koguma_and_reiko_do_fist_bump_moving_03=PAPER_EFFECT(super_cub_novel_05_koguma_and_reiko_do_fist_bump_moving_03)

super_cub_novel_06_koguma_reiko_shii_graduated_moving=Zoom(super_cub_novel_06_koguma_reiko_shii_graduated,srcy="Height(super_cub_novel_06_koguma_reiko_shii_graduated)/3",dstx="Width(super_cub_tv_clean_ed)/2",dsty="Height(super_cub_tv_clean_ed)/2",factor="Spline(n,0,3.0,Framecount(super_cub_novel_06_koguma_reiko_shii_graduated),1.5,cubic=false)",width=Width(super_cub_tv_clean_ed),height=Height(super_cub_tv_clean_ed))
super_cub_novel_06_koguma_reiko_shii_graduated_moving=PAPER_EFFECT(super_cub_novel_06_koguma_reiko_shii_graduated_moving)

######## Combine ########

# super_cub_tv_clean_ed_00 -6
# super_cub_tv_clean_ed_01 18/231/2682/2895
# super_cub_tv_clean_ed_02 450/876/3114
# super_cub_tv_clean_ed_03 669/1095/3333
# super_cub_tv_clean_ed_04 1267/3505
# super_cub_tv_clean_ed_05 1808/5005



super_cub_tv_ed_t01=BlankClip(super_cub_tv_clean_ed,length=18,color=color_black)+VIGNETTING_EFFECT(BLUR_OUT(BLUR_IN(TRIM_FIRST_CLIP(super_cub_novel_03_koguma_ride_super_cub_moving_01,104),fade_length),fade_length)+BLUR_OUT(BLUR_IN(TRIM_FIRST_CLIP(super_cub_novel_03_koguma_ride_super_cub_moving_02,109),fade_length),fade_length))+super_cub_tv_clean_ed_01

super_cub_tv_ed_t02=super_cub_tv_clean_ed_02+VIGNETTING_EFFECT(TRIM_FIRST_CLIP(super_cub_novel_01_koguma_see_note_moving_01,172)+BLUR_OUT(TRIM_FIRST_CLIP(super_cub_novel_01_koguma_see_note_moving_02,35),fade_length)+BLUR_OUT(BLUR_IN(TRIM_FIRST_CLIP(super_cub_novel_01_koguma_in_teacher_office_moving_01,69),fade_length),fade_length)+BLUR_IN(TRIM_FIRST_CLIP(super_cub_novel_01_koguma_in_teacher_office_moving_02,150),fade_length))+super_cub_tv_clean_ed_03+super_cub_tv_clean_ed_04
super_cub_tv_ed_t03=VIGNETTING_EFFECT(BLUR_IN(TRIM_FIRST_CLIP(super_cub_novel_01_koguma_and_reiko_take_bath_moving,218),fade_length)+BLUR_OUT(TRIM_FIRST_CLIP(super_cub_novel_02_reiko_consider_putting_shii_in_basket_moving,213+32+220),fade_length) \
	+BLUR_IN(TRIM_FIRST_CLIP(super_cub_novel_02_koguma_reko_shii_play_with_snow_moving_01,79),fade_length)+TRIM_FIRST_CLIP(super_cub_novel_02_koguma_reko_shii_play_with_snow_moving_02,52)+BLUR_OUT(TRIM_FIRST_CLIP(super_cub_novel_02_koguma_reko_shii_play_with_snow_moving_03,60),fade_length))

super_cub_tv_ed_t04=VIGNETTING_EFFECT(BLUR_OUT(BLUR_IN(TRIM_FIRST_CLIP(super_cub_novel_01_koguma_lie_on_bed_moving_01,104),fade_length),fade_length)+BLUR_OUT(BLUR_IN(TRIM_FIRST_CLIP(super_cub_novel_01_koguma_lie_on_bed_moving_02,109),fade_length),fade_length)+BLUR_OUT(BLUR_IN(TRIM_FIRST_CLIP(super_cub_novel_01_cover_moving_01,104),fade_length),fade_length)+BLUR_OUT(BLUR_IN(TRIM_FIRST_CLIP(super_cub_novel_01_cover_moving_02,115),fade_length),fade_length))

super_cub_tv_ed_t05=VIGNETTING_EFFECT(BLUR_OUT(BLUR_IN(TRIM_FIRST_CLIP(super_cub_novel_02_koguma_and_reiko_eat_moving_01,69),fade_length),fade_length)+BLUR_IN(TRIM_FIRST_CLIP(super_cub_novel_02_koguma_and_reiko_eat_moving_02,150),fade_length)+TRIM_FIRST_CLIP(super_cub_novel_02_shii_in_rear_mirror_moving,172) \
	+TRIM_FIRST_CLIP(super_cub_novel_01_koguma_and_reiko_on_bed_moving,357)+TRIM_FIRST_CLIP(super_cub_novel_01_koguma_bring_document_moving_01,135)+BLUR_OUT(TRIM_FIRST_CLIP(super_cub_novel_01_koguma_bring_document_moving_02,49+35),fade_length))

super_cub_tv_ed_t06=VIGNETTING_EFFECT(BLUR_OUT(BLUR_IN(TRIM_FIRST_CLIP(super_cub_novel_02_cover_moving,427),fade_length),fade_length))

super_cub_tv_ed_t07=VIGNETTING_EFFECT(BLUR_IN(TRIM_FIRST_CLIP(super_cub_novel_03_koguma_consider_future_moving,213),fade_length) \
	+TRIM_FIRST_CLIP(super_cub_novel_02_koguma_cook_rice_moving,107)+TRIM_FIRST_CLIP(super_cub_novel_05_koguma_and_reiko_do_fist_bump_moving_01,53)+TRIM_FIRST_CLIP(super_cub_novel_05_koguma_and_reiko_do_fist_bump_moving_02,53)+BLUR_OUT(TRIM_FIRST_CLIP(super_cub_novel_05_koguma_and_reiko_do_fist_bump_moving_03,71),fade_length))
super_cub_tv_ed_t08=super_cub_tv_clean_ed_05
super_cub_tv_ed_t09=VIGNETTING_EFFECT(BLUR_IN(TRIM_FIRST_CLIP(super_cub_novel_04_super_cub_go_to_mountain_moving,92),fade_length)+BLUR_OUT(TRIM_FIRST_CLIP(super_cub_novel_06_koguma_reiko_shii_graduated_moving,213),fade_length)+BLUR_OUT(BLUR_IN(TRIM_FIRST_CLIP(super_cub_novel_03_cover_moving,195),fade_length),fade_length))+BlankClip(super_cub_tv_clean_ed,length=24*2,color=color_black)



super_cub_tv_ed_mute=super_cub_tv_ed_t01+super_cub_tv_ed_t02+super_cub_tv_ed_t03+super_cub_tv_ed_t04+super_cub_tv_ed_t05+super_cub_tv_ed_t06+super_cub_tv_ed_t07+super_cub_tv_ed_t08+super_cub_tv_ed_t09

super_cub_tv_ed_mute

### export clip: super_cub_tv_ed_mute

### prefetch: 5,2

### ###

######## Subtitle ########

### inherit start ###

#global subtitle_heavy_halo_width=1
global subtitle_clip_width=1920
global subtitle_clip_height=1080

subtitle_x=50*2.25
subtitle_y=395*2.25
global subtitle_front_fade_count=12
global subtitle_rear_fade_count=12
global subtitle_font="MS Gothic"
global subtitle_effects="b"
global subtitle_size=33*2.25
global subtitle_text_color=color_white
global subtitle_halo_color=color_black
global subtitle_outside_halo_color=color_gray10

function SUBTITLE_FX(clip clip,string text,float x,float y,int start_frame,int end_frame,bool "is_furigana",bool "is_title"){
	is_title=Default(is_title,false)
	is_furigana=Default(is_furigana,false)

	outside_halo_color=is_title?color_deeppink:subtitle_outside_halo_color

	subtitle_mode=is_furigana?"ex":"ex" #"ex_thick_reduce_memory"
	size=is_furigana?subtitle_size*0.5:subtitle_size
	y=is_furigana?y-size:y

	return is_furigana?SUBTITLE_FX_FADE_IN_FADE_OUT_DOUBLE_HALO(clip,text,Round(x),Round(y),start_frame,end_frame,subtitle_front_fade_count,subtitle_rear_fade_count,subtitle_font,subtitle_effects,Round(size),subtitle_text_color,subtitle_halo_color,outside_halo_color,subtitle_mode) \
		:SUBTITLE_FX_FADE_IN_FADE_OUT_DOUBLE_HALO(clip,text,Round(x),Round(y),start_frame,end_frame,subtitle_front_fade_count,subtitle_rear_fade_count,subtitle_font,subtitle_effects,Round(size),subtitle_text_color,subtitle_halo_color,outside_halo_color,subtitle_mode)
}

function SUBTITLE_N(clip clip,string text,float y,int start_frame,int end_frame,bool "is_title"){
	is_title=Default(is_title,false)

	x=subtitle_clip_width/2
	fade_count=1

	outside_halo_color=is_title?color_darkturquoise:subtitle_outside_halo_color

	return SUBTITLE_FX_FADE_IN_FADE_OUT_DOUBLE_HALO(clip,text,Round(x),Round(y),start_frame,end_frame,fade_count,fade_count,subtitle_font,subtitle_effects+"c",Round(subtitle_size),subtitle_text_color,subtitle_halo_color,outside_halo_color,"ex")
}

### inherit end ###

ConvertToRGB32(matrix="Rec709")

SUBTITLE_FX("春への伝言//夜道 雪、七瀬彩夏、日岡なつみ|- by fielia@AVISynth",-subtitle_x,subtitle_y-subtitle_size,2803,3070,is_title=true)

SUBTITLE_FX("                    かぜ   み らい     と",subtitle_x,subtitle_y,456,644,true)
SUBTITLE_FX("すれちがう風 未来に溶けてく",subtitle_x,subtitle_y,456,644)
SUBTITLE_FX("ちか             く       やさ                            おと",subtitle_x,subtitle_y-subtitle_size*2,671,866,true)
SUBTITLE_FX("近づいて来る 優しいエンジンの音",subtitle_x,subtitle_y-subtitle_size*2,671,866)

SUBTITLE_FX("しん ご      か            じ かん    うご",subtitle_x,subtitle_y,882,1066,true)
SUBTITLE_FX("信号が変わる 時間が動いてく",subtitle_x,subtitle_y,882,1066)
SUBTITLE_FX("なが        くも                      はや",subtitle_x,subtitle_y-subtitle_size*2,1097,1258,true)
SUBTITLE_FX("流れる雲と どちらが早いかな",subtitle_x,subtitle_y-subtitle_size*2,1097,1258)

SUBTITLE_FX("とうめい             せ かい      しゃりん    いろ",subtitle_x,subtitle_y,1271,1505,true)
SUBTITLE_FX("透明だった世界に 車輪で色をつけよ",subtitle_x,subtitle_y,1271,1505)
SUBTITLE_FX("とも     か      ぬ         みち",subtitle_x,subtitle_y-subtitle_size*2,1510,1620,true)
SUBTITLE_FX("共に駆け抜けた道",subtitle_x,subtitle_y-subtitle_size*2,1510,1620)
SUBTITLE_FX("だれ         か              わたし    え",subtitle_x,subtitle_y,1616,1792,true)
SUBTITLE_FX("誰にも描けない 私の絵になる",subtitle_x,subtitle_y,1616,1792)

SUBTITLE_FX("とお        はる     よ",subtitle_x,subtitle_y-subtitle_size*2,1810,2032,true)
SUBTITLE_FX("遠くで春が呼ぶ すぐそこかもしれない",subtitle_x,subtitle_y-subtitle_size*2,1810,2032)
SUBTITLE_FX("                                          おも     で  つ          い",subtitle_x,subtitle_y,2030,2231,true)
SUBTITLE_FX("できるだけたくさんの 思い出連れて行こう",subtitle_x,subtitle_y,2030,2231)
SUBTITLE_FX("いっしょ     す          ひ  び    み            いろど       けっ",subtitle_x,subtitle_y-subtitle_size*2,2236,2497,true)
SUBTITLE_FX("一緒に過ごす日々 見つけた彩りは決して",subtitle_x,subtitle_y-subtitle_size*2,2236,2497)
SUBTITLE_FX("いろ あ",subtitle_x,subtitle_y,2496,2747,true)
SUBTITLE_FX("色褪せない いつだってずっと そばにいるよ",subtitle_x,subtitle_y,2496,2747)

### pass clip: super_cub_tv_ed_mute

### prefetch: 5,2

### ###

SUBTITLE_FX(" し                            せ かい    ひろ",subtitle_x,subtitle_y-subtitle_size*2,3120,3285,true)
SUBTITLE_FX("知らなかったよ 世界の広さを",subtitle_x,subtitle_y-subtitle_size*2,3120,3285)
SUBTITLE_FX("ゆうぜん    うた      かぎ                そら",subtitle_x,subtitle_y,3334,3506,true)
SUBTITLE_FX("悠然と歌う 限りのない空",subtitle_x,subtitle_y,3334,3506)

SUBTITLE_FX(" し          し          か      ぬ            か          ば                  ひ  び",subtitle_x,subtitle_y-subtitle_size*2,3507,3750,true)
SUBTITLE_FX("知らず知らず駆け抜けた 代わり映えもない日々は",subtitle_x,subtitle_y-subtitle_size*2,3507,3750)
SUBTITLE_FX("        もど                                           み          け しき",subtitle_x,subtitle_y,3747,3962,true)
SUBTITLE_FX("もう戻らないけれど これから見れる景色は",subtitle_x,subtitle_y,3747,3962)
SUBTITLE_FX("なに           き れい",subtitle_x,subtitle_y-subtitle_size*2,3960,4159,true)
SUBTITLE_FX("何より 綺麗でしよう",subtitle_x,subtitle_y-subtitle_size*2,3960,4159)

SUBTITLE_FX(" しゅんかしゅうとう         すき ま めぐ    めぐ     し  き",subtitle_x,subtitle_y,4512,4722,true)
SUBTITLE_FX(" 春夏秋冬 その隙間巡り巡る四季",subtitle_x,subtitle_y,4512,4722)
SUBTITLE_FX("はし    つづ                  きみ",subtitle_x,subtitle_y-subtitle_size*2,4725,5006,true)
SUBTITLE_FX("走り続けたいよ 君とならばどこまででも",subtitle_x,subtitle_y-subtitle_size*2,4725,5006)

SUBTITLE_FX("たび                              ちい        ぼうけん",subtitle_x,subtitle_y,5007,5226,true)
SUBTITLE_FX("旅をしてるんだよ 小さな冒険なんだ",subtitle_x,subtitle_y,5007,5226)
SUBTITLE_FX(" ひかり   おど    みち  はる    つづ",subtitle_x,subtitle_y-subtitle_size*2,5226,5429,true)
SUBTITLE_FX(" 光が踊る道 春へ続いてく",subtitle_x,subtitle_y-subtitle_size*2,5226,5429)
SUBTITLE_FX("いっしょ     す          ひ  び    み            いろど       けっ",subtitle_x,subtitle_y,5431,5693,true)
SUBTITLE_FX("一緒に過ごす日々 見つけた彩りは決して",subtitle_x,subtitle_y,5431,5693)
SUBTITLE_FX("いろ あ",subtitle_x,subtitle_y-subtitle_size*2,5691,5934,true)
SUBTITLE_FX("色褪せない いつだってずっと そばにいるよ",subtitle_x,subtitle_y-subtitle_size*2,5691,5934)

SUBTITLE_FX("はる                                         い",subtitle_x,subtitle_y,5957,6259,true)
SUBTITLE_FX("春へと ゆっくりでいい 行こうよ",subtitle_x,subtitle_y,5957,6259)

######## Preface ########

Import("super_cub-tv-common-cross_process.avsi")

######## Thumbnail ########

is_thumbnail=false

is_thumbnail?ConvertToRGB32(super_cub_tv_ed_mute,matrix="Rec709"):last

######## Music ########

bgm_48khz=SSRC(WAVSource("src\01. 春への伝言.wav"),48000)
AudioDub(bgm_48khz)



######## Thumbnail ########

thumbnail=Trim(5819,-thumbnail_length)

function EXTEND_ONE_FRAME(clip clip){
	return clip+BlankClip(clip,length=1,color=color_black)
}

function UNDO_EXTEND_ONE_FRAME(clip clip){
	return Trim(clip,0,-Framecount(clip)+1)
}

honda_super_cub_c125_start=64
honda_super_cub_c125=ConvertToRGB32(ImageSource("src\price\super_cub-c125-price.png",0,thumbnail_length-honda_super_cub_c125_start-1,thumbnail_frame_rate,pixel_type="rgb24"))
honda_super_cub_c125_overlay=BlankClip(honda_super_cub_c125,length=honda_super_cub_c125_start,color=color_black)+honda_super_cub_c125

thumbnail=Layer(thumbnail,FAST_ZOOM(super_cub_tv_01_super_cub_cost_10000_jpy_overlay,srcx=0.0,srcy=0.0,dstx=0.0,dsty=Height(thumbnail)/2,factor=0.5))
thumbnail=Layer(thumbnail,FAST_ZOOM(azumalim_hitori_cub_umi_thumbnail_overlay,srcx=0.0,srcy=0.0,dstx=0.0,dsty=0.0,factor=1.5/2.0,width=Width(thumbnail),height=Height(thumbnail)))
thumbnail=Layer(thumbnail,FAST_ZOOM(honda_super_cub_c125_overlay,srcx=0.0,srcy=0.0,dstx=Width(thumbnail)/2,dsty=0.0,factor=1.5/2.0,width=Width(thumbnail),height=Height(thumbnail)))

thumbnail=EXTEND_ONE_FRAME(thumbnail)
thumbnail=SUBTITLE_N(thumbnail,"\10000",subtitle_y,super_cub_tv_01_super_cub_cost_10000_jpy_start,thumbnail_length-1)
thumbnail=SUBTITLE_N(thumbnail,"\407000",subtitle_x,azumalim_hitori_cub_umi_start,thumbnail_length-1)
thumbnail=UNDO_EXTEND_ONE_FRAME(thumbnail)



super_cub_tv_01_koguma_start_up_super_cub++super_cub_tv_12_chapter++last



is_thumbnail?thumbnail:last

""")

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
