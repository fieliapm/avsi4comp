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



######## BD (1920*1080) ########

super_cub_tv_01=FFMS2_VIDEO_SOURCE("src\[Moozzi2] Super Cub [ x265-10Bit Ver. ] - TV + Tokuten DVD\[Moozzi2] Super Cub - 01 (BD 1920x1080 x265-10Bit 2Audio).mkv")
super_cub_tv_12=FFMS2_VIDEO_SOURCE("src\[Moozzi2] Super Cub [ x265-10Bit Ver. ] - TV + Tokuten DVD\[Moozzi2] Super Cub - 12 END (BD 1920x1080 x265-10Bit 2Audio).mkv")

######## Trim ########

super_cub_tv_01_super_cub_cost_10000_jpy=Trim(super_cub_tv_01,10718,10897) #180

super_cub_tv_01_koguma_start_up_super_cub_01=Trim(super_cub_tv_01,17400,17435) #36
super_cub_tv_01_koguma_start_up_super_cub_02=Trim(super_cub_tv_01,17436,17471) #36
super_cub_tv_01_koguma_start_up_super_cub_03=Trim(super_cub_tv_01,17472,17546) #75
super_cub_tv_01_koguma_start_up_super_cub=super_cub_tv_01_koguma_start_up_super_cub_01+super_cub_tv_01_koguma_start_up_super_cub_02+super_cub_tv_01_koguma_start_up_super_cub_03 #147

super_cub_tv_12_chapter=Trim(super_cub_tv_12,32538,32655) #118

######## Preface ########

super_cub_tv_01_koguma_start_up_super_cub_audio=FadeIn0(FadeOut0(Normalize(super_cub_tv_01_koguma_start_up_super_cub),3),1)
super_cub_tv_01_koguma_start_up_super_cub=AudioDub(super_cub_tv_01_koguma_start_up_super_cub,super_cub_tv_01_koguma_start_up_super_cub_audio)

super_cub_tv_01_koguma_start_up_super_cub=ConvertToRGB32(super_cub_tv_01_koguma_start_up_super_cub,matrix="Rec709")

super_cub_tv_12_chapter_audio=FadeIn0(FadeOut0(Normalize(super_cub_tv_12_chapter),1),1)
super_cub_tv_12_chapter=AudioDub(super_cub_tv_12_chapter,super_cub_tv_12_chapter_audio)

super_cub_tv_12_chapter=ConvertToRGB32(super_cub_tv_12_chapter,matrix="Rec709")

######## Thumbnail ########

thumbnail_frame_rate=Framerate(super_cub_tv_01)
thumbnail_length=24*5

super_cub_tv_01_super_cub_cost_10000_jpy_start=32
super_cub_tv_01_super_cub_cost_10000_jpy=ConvertToRGB32(super_cub_tv_01_super_cub_cost_10000_jpy,matrix="Rec709")
super_cub_tv_01_super_cub_cost_10000_jpy_overlay=BlankClip(super_cub_tv_01_super_cub_cost_10000_jpy,length=super_cub_tv_01_super_cub_cost_10000_jpy_start,color=color_black)+TRIM_FIRST_CLIP(super_cub_tv_01_super_cub_cost_10000_jpy,thumbnail_length-super_cub_tv_01_super_cub_cost_10000_jpy_start)

azumalim_hitori_cub_umi_start=48
azumalim_hitori_cub_umi_thumbnail=ConvertToRGB32(ImageSource("src\price\azumalim-hitori_cub_umi-maxresdefault.jpg",0,thumbnail_length-azumalim_hitori_cub_umi_start-1,thumbnail_frame_rate,pixel_type="rgb24"))
azumalim_hitori_cub_umi_thumbnail_overlay=BlankClip(azumalim_hitori_cub_umi_thumbnail,length=azumalim_hitori_cub_umi_start,color=color_black)+azumalim_hitori_cub_umi_thumbnail
