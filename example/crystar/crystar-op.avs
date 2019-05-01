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

is_60p=false

Import("crystar-common.avsi")

######## Function ########

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

	subtitle_alpha=ConvertToYV12(ShowAlpha(subtitle_rgba),matrix="Rec709")
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

######## Pre Combine ########

global frame_index_scale=is_60p?2:1

fade_length=15



crystar_teaser_movie_03=FRAME_RATE_2X(RESIZE_TO_REF_CLIP(crystar_teaser_movie_03,crystar_op),is_60p)
crystar_teaser_movie_03_faded=ConvertToYV12(FADE_OUT_WITH_BRIGHTNESS_OFFSET(ConvertToRGB24(TRIM_FIRST_CLIP(crystar_teaser_movie_03,622*frame_index_scale),matrix="Rec709"),fade_length*frame_index_scale),matrix="Rec709")



crystar_wallpaper_resized=FRAME_RATE_2X(RESIZE_TO_REF_CLIP(crystar_wallpaper,crystar_op),is_60p)
crystar_wallpaper_show=ScriptClip(crystar_wallpaper_resized,"FAST_ZOOM(srcx=0.8*Width(),srcy=0.4*Height(),dstx=0.8*Width(),dsty=0.4*Height(),factor=Pow(2.0,Spline(current_frame,0*frame_index_scale,4.0,11*frame_index_scale,0.0,Framecount()-1,0.0,cubic=false)),extend=true)")
#crystar_wallpaper_show=ScriptClip(crystar_wallpaper_resized,"FAST_ZOOM(srcx=0.8*Width(),srcy=0.4*Height(),dstx=0.8*Width(),dsty=0.4*Height(),factor=1.0/Spline(current_frame,0*frame_index_scale,1.0/16.0,11*frame_index_scale,1.0,Framecount()-1,1.0,cubic=false),extend=true)")
crystar_wallpaper_show=ConvertToYV12(crystar_wallpaper_show,matrix="Rec709")



cover_target_width=636.0
cover_target_height=300.0
cover_reference_width=2560.0

crystar_wallpaper_cropped=Crop(crystar_wallpaper,0,Round(Float(Height(crystar_wallpaper))-(Float(Width(crystar_wallpaper))*cover_target_height/cover_target_width)),0,0)
crystar_wallpaper_cropped=Subtitle(crystar_wallpaper_cropped,"2560x1440 30p",Round(32*2.25),Round(32*2.25),font="MS Mincho",size=Round(48*2.25),text_color=color_white,halo_color=color_dodgerblue)
crystar_wallpaper_cropped=FRAME_RATE_2X(crystar_wallpaper_cropped,is_60p)
crystar_wallpaper_cropped=ResetMask(ConvertToRGB32(crystar_wallpaper_cropped))

cover_scale_factor=Float(Width(crystar_op_03))/cover_reference_width
crystar_wallpaper_cover=FAST_ZOOM(crystar_wallpaper_cropped,srcx=0.0*cover_scale_factor,srcy=0.0*cover_scale_factor,dstx=19.0*cover_scale_factor,dsty=947.0*cover_scale_factor,factor=cover_target_width/Float(Width(crystar_wallpaper))*cover_scale_factor,width=Width(crystar_op_03),height=Height(crystar_op_03))
crystar_wallpaper_cover_extend=Loop(crystar_wallpaper_cover,Ceil(Float(Framecount(crystar_op_03))/Float(Framecount(crystar_wallpaper_cover))))

crystar_op_03_show_cover=ConvertToRGB32(crystar_op_03,matrix="Rec709")
crystar_op_03_show_cover=Layer(crystar_op_03_show_cover,crystar_wallpaper_cover_extend,"Add")
crystar_op_03_show_cover=ConvertToYV12(crystar_op_03_show_cover,matrix="Rec709")

######## Combine ########

#                         24p          30p               60p
# crystar_op_01             ?     300               600
# crystar_op_02_title       ?     495               989
# crystar_op_03             ?    1356/4721         2711/ 9442
# crystar_op_04             ?    1668/5033         3336/10067
# crystar_op_05             ?    2719/5380/6006    5438/10760/12012
# crystar_op_06             ?    3063/5724/6350    6125/11447/12699
# crystar_op_07             ?    3504/6791/7395    7008/13582/14790

#                                          30p      60p
# crystar_promotion_movie_04_character    2759     5518

#                             30p
# crystar_teaser_movie_03     734

#                              30p
# crystar_wallpaper_show    7525~7643



crystar_op_t01=BlankClip(crystar_op,length=15*frame_index_scale,color=color_black)+Dissolve(crystar_promotion_movie_02,crystar_op_01,Framecount(crystar_promotion_movie_02)-(285*frame_index_scale)) \
	+TRIM_FIRST_CLIP(crystar_op_02_title,239*frame_index_scale)+TRIM_FIRST_CLIP(crystar_teaser_movie_03_faded,622*frame_index_scale)

crystar_op_t02=crystar_op_03_show_cover+crystar_op_04+TRIM_FIRST_CLIP(crystar_promotion_movie_23_slogan,(36+4)*frame_index_scale)
crystar_op_t03=TRIM_FIRST_CLIP(crystar_promotion_movie_04_character+crystar_promotion_movie_10_rei_cry,(308-4+329+112+123+314)*frame_index_scale)

crystar_op_t04=Dissolve(crystar_promotion_movie_20_animation,crystar_promotion_movie_11_game,Framecount(crystar_promotion_movie_20_animation+crystar_promotion_movie_11_game)-((625+155)*frame_index_scale))

crystar_op_t05=TRIM_FIRST_CLIP(crystar_promotion_movie_15_character+TRIM_MIDDLE_CLIP(crystar_promotion_movie_01,((312+314)*frame_index_scale)-Framecount(crystar_promotion_movie_15_character)),(312+314)*frame_index_scale)
crystar_op_t06=TRIM_MIDDLE_CLIP(crystar_promotion_movie_16_rei_hear_music,33*frame_index_scale)+crystar_op_05+TRIM_MIDDLE_CLIP(crystar_promotion_movie_06_animation+crystar_promotion_movie_17_animation,318*frame_index_scale)
crystar_op_t07=TRIM_MIDDLE_CLIP(crystar_promotion_movie_08_animation+crystar_promotion_movie_13_dialog,308*frame_index_scale)+crystar_op_06+TRIM_FIRST_CLIP(crystar_op_07,123*frame_index_scale)

crystar_op_t08=TRIM_FIRST_CLIP(crystar_promotion_movie_18_game+crystar_promotion_movie_19_game+crystar_promotion_movie_14_rei_cry,611*frame_index_scale)+TRIM_FIRST_CLIP(crystar_wallpaper_show,119*frame_index_scale)

crystar_op_mute=crystar_op_t01+crystar_op_t02+crystar_op_t03+crystar_op_t04+crystar_op_t05+crystar_op_t06+crystar_op_t07+crystar_op_t08

######## Music ########

bgm_48khz=SSRC(WAVSource("src\iroduku_sekai_no_ashita_kara-ed-02.wav"),48000)
AudioDub(crystar_op_mute,bgm_48khz)



last++crystar_promotion_movie_27_furyu+BlankClip(crystar_op,length=30*2*frame_index_scale,color=color_black)



ConvertToRGB32(matrix="Rec709")

thumbnail=Trim(5541*frame_index_scale,-30*5*frame_index_scale)

######## Subtitle ########

#global subtitle_heavy_halo_width=1
global subtitle_clip_width=1280
global subtitle_clip_height=720

subtitle_x=50*1.5
subtitle_y=389*1.5
subtitle_y_offset=-6*1.5
global subtitle_front_fade_count=30
global subtitle_rear_fade_count=15
global subtitle_font="MS Mincho"
global subtitle_effects="b"
global subtitle_size=36*1.5
global subtitle_text_color=color_white
global subtitle_halo_color=color_black
global subtitle_outside_halo_color=color_gray10

global scan_mask=GENERATE_SCAN_MASK(crystar_op,subtitle_front_fade_count)

function SUBTITLE_FX(clip clip,string text,float x,float y,int start_frame,int end_frame,bool "is_furigana",bool "is_title"){
	is_title=Default(is_title,false)
	is_furigana=Default(is_furigana,false)

	halo_color=is_title?color_dodgerblue:subtitle_halo_color
	rear_fade_count=is_title?1:subtitle_rear_fade_count

	subtitle_mode=is_furigana?"ex":"ex" #"ex_thick_reduce_memory"
	size=is_furigana?subtitle_size*0.5:subtitle_size
	y=is_furigana?y-size:y

	return SUBTITLE_FX_SCAN_IN_FADE_OUT_DOUBLE_HALO(clip,text,Round(x),Round(y),start_frame*frame_index_scale,end_frame*frame_index_scale,subtitle_front_fade_count*frame_index_scale,rear_fade_count*frame_index_scale,subtitle_font,subtitle_effects,Round(size),subtitle_text_color,halo_color,subtitle_outside_halo_color,subtitle_mode)
}

SUBTITLE_FX("can cry//やなぎなぎ|- by fielia@AVISynth",-subtitle_x,subtitle_y-subtitle_size,495+subtitle_front_fade_count,733,is_title=true)

SUBTITLE_FX(" き おく    ふち    ",subtitle_x,subtitle_x+subtitle_y_offset+subtitle_size*3,1350,1487,true)
SUBTITLE_FX("記憶の淵に",subtitle_x,subtitle_x+subtitle_y_offset+subtitle_size*3,1350,1487)
SUBTITLE_FX("                       かんじょう               ",subtitle_x,subtitle_x+subtitle_y_offset+subtitle_size,1496,1649,true)
SUBTITLE_FX("ささくれだつ感情のエラー",subtitle_x,subtitle_x+subtitle_y_offset+subtitle_size,1496,1649)
SUBTITLE_FX(" せ      と                 ",subtitle_x,subtitle_y-subtitle_size*2,1662,1785,true)
SUBTITLE_FX("塞き止められた",subtitle_x,subtitle_y-subtitle_size*2,1662,1785)
SUBTITLE_FX("                        おも        ",subtitle_x,subtitle_y,1792,1955,true)
SUBTITLE_FX("あふれそうな想いは",subtitle_x,subtitle_y,1792,1955)

SUBTITLE_FX(" よろこ       なが        ",subtitle_x,subtitle_y-subtitle_size*2,2132,2216,true)
SUBTITLE_FX(" 喜びに流して",subtitle_x,subtitle_y-subtitle_size*2,2132,2216)
SUBTITLE_FX(" と まど        むせ        ",subtitle_x,subtitle_y,2212,2293,true)
SUBTITLE_FX("戸惑いに咽って",subtitle_x,subtitle_y,2212,2293)
SUBTITLE_FX("かな            つぶ        ",subtitle_x,subtitle_y-subtitle_size*2,2290,2372,true)
SUBTITLE_FX("哀しみに瞑って",subtitle_x,subtitle_y-subtitle_size*2,2290,2372)
SUBTITLE_FX("たの            ゆだ        ",subtitle_x,subtitle_y,2368,2450,true)
SUBTITLE_FX("愉しさに委ねて",subtitle_x,subtitle_y,2368,2450)

SUBTITLE_FX(" しょうじき   こた        ",subtitle_x,subtitle_y-subtitle_size*2,2443,2530,true)
SUBTITLE_FX(" 正直に応えて",subtitle_x,subtitle_y-subtitle_size*2,2443,2530)
SUBTITLE_FX(" り ろん             す         ",subtitle_x,subtitle_y,2524,2603,true)
SUBTITLE_FX("理論なんて捨てて",subtitle_x,subtitle_y,2524,2603)
SUBTITLE_FX("から                                ",subtitle_x,subtitle_y-subtitle_size*2,2603,2688,true)
SUBTITLE_FX("空っぽにしちゃって",subtitle_x,subtitle_y-subtitle_size*2,2603,2688)
SUBTITLE_FX(" い  じ      ぱ                  お                 ",subtitle_x,subtitle_y,2681,2755,true)
SUBTITLE_FX("意地っ張りはもう終わらせて",subtitle_x,subtitle_y,2681,2755)

SUBTITLE_FX("can cry",subtitle_x,subtitle_y-subtitle_size*2,2749,2810)
SUBTITLE_FX("       なみだ   つや    おん ど      な             ",subtitle_x,subtitle_y,2816,3044,true)
SUBTITLE_FX("その涙に艶や温度が無くても",subtitle_x,subtitle_y,2816,3044)
SUBTITLE_FX("can cry",subtitle_x,subtitle_y-subtitle_size*2,3053,3128)
SUBTITLE_FX("            だれ       こころ    つ      た         はな            ",subtitle_x,subtitle_y,3130,3355,true)
SUBTITLE_FX("ずっと誰かの心に突き立って離れない",subtitle_x,subtitle_y,3130,3355)
SUBTITLE_FX("いた        ほお     な         ",subtitle_x,subtitle_y-subtitle_size*2,3365,3625,true)
SUBTITLE_FX("痛みが頬を撫でる",subtitle_x,subtitle_y-subtitle_size*2,3365,3625)

SUBTITLE_FX(" き おく    ふち    ",subtitle_x,subtitle_y-subtitle_size*2,4715,4848,true)
SUBTITLE_FX("記憶の淵に",subtitle_x,subtitle_y-subtitle_size*2,4715,4848)
SUBTITLE_FX("                       かんじょう               ",subtitle_x,subtitle_y,4860,5004,true)
SUBTITLE_FX("ささくれだつ感情のエラー",subtitle_x,subtitle_y,4860,5004)
SUBTITLE_FX(" せ      と                 おも        かいほう        ",subtitle_x,subtitle_y-subtitle_size*2,5026,5325,true)
SUBTITLE_FX("塞き止められた想いを解放して",subtitle_x,subtitle_y-subtitle_size*2,5026,5325)
SUBTITLE_FX("                 み らいさが",subtitle_x,subtitle_y,5338,5416,true)
SUBTITLE_FX("ゼロから未来探すよ",subtitle_x,subtitle_y,5338,5416)

SUBTITLE_FX("can cry",subtitle_x,subtitle_y-subtitle_size*2,5410,5472)
SUBTITLE_FX("            こと ば             はや    とど                    ",subtitle_x,subtitle_y,5479,5704,true)
SUBTITLE_FX("どんな言葉よりも早く届くアンサー",subtitle_x,subtitle_y,5479,5704)
SUBTITLE_FX("can cry",subtitle_x,subtitle_y-subtitle_size*2,5713,5789)
SUBTITLE_FX("            いき                    おな   くらい  あ         まえ    ",subtitle_x,subtitle_y,5793,6033,true)
SUBTITLE_FX("きっと息をするのと同じ位 当たり前に",subtitle_x,subtitle_y,5793,6033)
SUBTITLE_FX("can cry",subtitle_x,subtitle_y-subtitle_size*2,6036,6101)
SUBTITLE_FX("           うつく        せ かい  ことわり                  ",subtitle_x,subtitle_y,6098,6328,true)
SUBTITLE_FX("なんて美しい世界の理なんだろう",subtitle_x,subtitle_y,6098,6328)
SUBTITLE_FX("can cry",subtitle_x,subtitle_y-subtitle_size*2,6339,6414)
SUBTITLE_FX("       なみだ                                     よう        ",subtitle_x,subtitle_y-subtitle_size*2,6494,6641,true)
SUBTITLE_FX("その涙 まるでクリスタルの様だね",subtitle_x,subtitle_y-subtitle_size*2,6494,6641)
SUBTITLE_FX(" ひかり   ほお     て         ",subtitle_x,subtitle_y,6651,6888,true)
SUBTITLE_FX(" 光が頬を照らす",subtitle_x,subtitle_y,6651,6888)



#thumbnail

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
