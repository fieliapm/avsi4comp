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



Import("turn_a_gundam-common.avsi")

######## DVD (480P) ########

fpsnum=24000
fpsden=1001

turn_a_gundam_tv_clean_op_01=FFMS2_VIDEO_SOURCE("src\turn_a_gundam-tv\special\turn_a_gundam-tv-op-01.wmv",fpsnum=fpsnum,fpsden=fpsden)

#turn_a_gundam_tv_clean_op_01_title=Trim(turn_a_gundam_tv_clean_op_01,0,71)
turn_a_gundam_tv_clean_op_01_part01=Trim(turn_a_gundam_tv_clean_op_01,72,341)
turn_a_gundam_tv_clean_op_01_part02=Trim(turn_a_gundam_tv_clean_op_01,342,726)
turn_a_gundam_tv_clean_op_01_part03=Trim(turn_a_gundam_tv_clean_op_01,727,1147)
turn_a_gundam_tv_clean_op_01_part04=Trim(turn_a_gundam_tv_clean_op_01,1148,1338)
turn_a_gundam_tv_clean_op_01_part05=Trim(turn_a_gundam_tv_clean_op_01,1339,1673)
turn_a_gundam_tv_clean_op_01_part06=Trim(turn_a_gundam_tv_clean_op_01,1674,1793)
turn_a_gundam_tv_clean_op_01_part07=Trim(turn_a_gundam_tv_clean_op_01,1794,0)

######## BD (1080P) ########

turn_a_gundam_movie_01_cache01=FFMS2_VIDEO_SOURCE("src\turn_a_gundam-movie\bd-aac_2ch\turn_a_gundam-movie-bd-aac_2ch-01.mp4")
turn_a_gundam_movie_01_cache02=FFMS2_VIDEO_SOURCE("src\turn_a_gundam-movie\bd-aac_2ch\turn_a_gundam-movie-bd-aac_2ch-01.mp4")

turn_a_gundam_movie_01_loran_ready_to_go=Trim(turn_a_gundam_movie_01_cache01,3177,3332)
turn_a_gundam_movie_01_sunny_sky=Trim(turn_a_gundam_movie_01_cache01,3333,3398)
turn_a_gundam_movie_01_guin_help_loran=Trim(turn_a_gundam_movie_01_cache01,3549,3793)
turn_a_gundam_movie_01_heim_sisters_in_river=Trim(turn_a_gundam_movie_01_cache01,4037,4075)

turn_a_gundam_movie_01_turn_a_appearing_01=Trim(turn_a_gundam_movie_01_cache01,22751,22791)
turn_a_gundam_movie_01_turn_a_appearing_02=Trim(turn_a_gundam_movie_01_cache01,22894,23045)
turn_a_gundam_movie_01_loran_launch_turn_a=Trim(turn_a_gundam_movie_01_cache02,23989,24190)
turn_a_gundam_movie_01_turn_a_launch_01=Trim(turn_a_gundam_movie_01_cache01,24295,24815)
turn_a_gundam_movie_01_turn_a_launch_02=Trim(turn_a_gundam_movie_01_cache01,25015,25417)
turn_a_gundam_movie_01_turn_a_view=Trim(turn_a_gundam_movie_01_cache01,25740,25953)

turn_a_gundam_movie_01_turn_a_vs_gold_sumo_01=Trim(turn_a_gundam_movie_01_cache01,62399,62491)
turn_a_gundam_movie_01_turn_a_vs_gold_sumo_02=Trim(turn_a_gundam_movie_01_cache01,62563,62644)
turn_a_gundam_movie_01_turn_a_vs_gold_sumo_03=Trim(turn_a_gundam_movie_01_cache01,62749,63051)

turn_a_gundam_movie_01_loran_cross_dressing_01=Trim(turn_a_gundam_movie_01_cache01,68835,68923)
turn_a_gundam_movie_01_loran_cross_dressing_02=Trim(turn_a_gundam_movie_01_cache01,69203,69536)

#turn_a_gundam_movie_01_harry_invite_laura=Trim(turn_a_gundam_movie_01_cache01,70765,70931)
turn_a_gundam_movie_01_laura_dance_01=Trim(turn_a_gundam_movie_01_cache01,70932,71052)
turn_a_gundam_movie_01_laura_dance_02=Trim(turn_a_gundam_movie_01_cache01,71053,71150)
turn_a_gundam_movie_01_laura_dance_03=Trim(turn_a_gundam_movie_01_cache01,71332,71450)
turn_a_gundam_movie_01_laura_dance_04=Trim(turn_a_gundam_movie_01_cache01,71704,71807)
turn_a_gundam_movie_01_harry_dance=Trim(turn_a_gundam_movie_01_cache01,71808,71926)

turn_a_gundam_movie_01_turn_a_catch_assassin_01=Trim(turn_a_gundam_movie_01_cache02,74834,74972)
turn_a_gundam_movie_01_turn_a_catch_assassin_02=Trim(turn_a_gundam_movie_01_cache02,75026,75325)
turn_a_gundam_movie_01_turn_a_catch_assassin_03=Trim(turn_a_gundam_movie_01_cache02,75434,75591)

turn_a_gundam_movie_01_turn_a_walk=Trim(turn_a_gundam_movie_01_cache01,77949,78979)
turn_a_gundam_movie_01_kihel_and_dianna_exchange=Trim(turn_a_gundam_movie_01_cache01,82252,82481)
turn_a_gundam_movie_01_kihel_talk_with_harry=Trim(turn_a_gundam_movie_01_cache01,139273,139527)

turn_a_gundam_movie_01_turn_a_fight_01=Trim(turn_a_gundam_movie_01_cache01,151167,151298)
turn_a_gundam_movie_01_turn_a_fight_02=Trim(turn_a_gundam_movie_01_cache01,151411,151437)
turn_a_gundam_movie_01_turn_a_fight_03=Trim(turn_a_gundam_movie_01_cache01,152026,152342)
turn_a_gundam_movie_01_turn_a_fight_04=Trim(turn_a_gundam_movie_01_cache01,152660,152736)
turn_a_gundam_movie_01_turn_a_fight_05=Trim(turn_a_gundam_movie_01_cache01,153046,153140)

turn_a_gundam_movie_01_kihel_and_dianna_hug=Trim(turn_a_gundam_movie_01_cache01,159678,159930)

turn_a_gundam_movie_01_partner_01=Trim(turn_a_gundam_movie_01_cache01,179104,179234)
turn_a_gundam_movie_01_partner_02=Trim(turn_a_gundam_movie_01_cache01,179330,179400)
turn_a_gundam_movie_01_partner_03=Trim(turn_a_gundam_movie_01_cache01,179401,179687)

######## Pre Combine (480P) ########

sekai_meisaku_gekijou=SEKAI_MEISAKU_GEKIJOU_CLIP(turn_a_gundam_tv_clean_op_01_part01,20)

turn_a_gundam_tv_clean_op_01_part01_extend=Loop(turn_a_gundam_tv_clean_op_01_part01,72,268,268)

turn_a_gundam_tv_clean_op_01_01=sekai_meisaku_gekijou+turn_a_gundam_tv_clean_op_01_part01_extend+turn_a_gundam_tv_clean_op_01_part02
turn_a_gundam_tv_clean_op_01_02=turn_a_gundam_tv_clean_op_01_part03+turn_a_gundam_tv_clean_op_01_part04+turn_a_gundam_tv_clean_op_01_part05+turn_a_gundam_tv_clean_op_01_part06
turn_a_gundam_tv_clean_op_01_03=turn_a_gundam_tv_clean_op_01_part07
turn_a_gundam_tv_clean_op_01_01_resized=RESIZE_TO_REF_CLIP(turn_a_gundam_tv_clean_op_01_01,turn_a_gundam_movie_01_loran_ready_to_go)
turn_a_gundam_tv_clean_op_01_02_resized=RESIZE_TO_REF_CLIP(turn_a_gundam_tv_clean_op_01_02,turn_a_gundam_movie_01_loran_ready_to_go)
turn_a_gundam_tv_clean_op_01_03_resized=RESIZE_TO_REF_CLIP(turn_a_gundam_tv_clean_op_01_03,turn_a_gundam_movie_01_loran_ready_to_go)

######## Pre Combine (1080P) ########

turn_a_gundam_movie_01_turn_a_appearing=turn_a_gundam_movie_01_turn_a_appearing_01+turn_a_gundam_movie_01_turn_a_appearing_02
turn_a_gundam_movie_01_turn_a_launch=turn_a_gundam_movie_01_turn_a_launch_01+turn_a_gundam_movie_01_turn_a_launch_02
turn_a_gundam_movie_01_turn_a_vs_gold_sumo=turn_a_gundam_movie_01_turn_a_vs_gold_sumo_01+turn_a_gundam_movie_01_turn_a_vs_gold_sumo_02+turn_a_gundam_movie_01_turn_a_vs_gold_sumo_03
turn_a_gundam_movie_01_loran_cross_dressing=turn_a_gundam_movie_01_loran_cross_dressing_01+turn_a_gundam_movie_01_loran_cross_dressing_02
turn_a_gundam_movie_01_laura_dance=turn_a_gundam_movie_01_laura_dance_01+turn_a_gundam_movie_01_laura_dance_02+turn_a_gundam_movie_01_laura_dance_03+turn_a_gundam_movie_01_laura_dance_04+turn_a_gundam_movie_01_harry_dance
turn_a_gundam_movie_01_turn_a_catch_assassin=turn_a_gundam_movie_01_turn_a_catch_assassin_01+turn_a_gundam_movie_01_turn_a_catch_assassin_02+turn_a_gundam_movie_01_turn_a_catch_assassin_03

turn_a_gundam_movie_01_turn_a_walk_trim_interval=195
turn_a_gundam_movie_01_turn_a_walk_trimmed=Trim(turn_a_gundam_movie_01_turn_a_walk,75,-turn_a_gundam_movie_01_turn_a_walk_trim_interval)+TRIM_LAST_CLIP(turn_a_gundam_movie_01_turn_a_walk,turn_a_gundam_movie_01_turn_a_walk_trim_interval)

turn_a_gundam_movie_01_turn_a_fight=turn_a_gundam_movie_01_turn_a_fight_01+turn_a_gundam_movie_01_turn_a_fight_02+turn_a_gundam_movie_01_turn_a_fight_03+turn_a_gundam_movie_01_turn_a_fight_04+turn_a_gundam_movie_01_turn_a_fight_05
turn_a_gundam_movie_01_partner=Trim(turn_a_gundam_movie_01_partner_03,100,-48)+TRIM_FIRST_CLIP(turn_a_gundam_movie_01_partner_02,48)+Trim(turn_a_gundam_movie_01_partner_01,25,-96)



overlay_clip_length=380
overlay_clip=BlankClip(turn_a_gundam_movie_01_loran_ready_to_go,length=overlay_clip_length,color=color_black)
overlay_clip_01=RESCALE(TRIM_FIRST_CLIP(turn_a_gundam_movie_01_turn_a_vs_gold_sumo,overlay_clip_length),0.667,0.667)
overlay_clip_02=RESCALE(Trim(turn_a_gundam_movie_01_turn_a_catch_assassin,15,-overlay_clip_length),0.667,0.667)
overlay_clip=LINEAR_MOVE(overlay_clip,"overlay_clip_01","Add",0,overlay_clip_length-1,100,0,1.0,0,0,1.0,overwrite=true)
overlay_clip=LINEAR_MOVE(overlay_clip,"overlay_clip_02","Add",0,overlay_clip_length-1,399,360,1.0,499,360,1.0,overwrite=true)

######## Combine ########

# turn_a_gundam_tv_clean_op_01_part01 20/44
# turn_a_gundam_tv_clean_op_01_part02 361
# turn_a_gundam_tv_clean_op_01_part03 2981
# turn_a_gundam_tv_clean_op_01_part07 6649

double_fade_length=12

turn_a_gundam_tv_op_01_t01=turn_a_gundam_tv_clean_op_01_01_resized
turn_a_gundam_tv_op_01_t02=turn_a_gundam_movie_01_loran_ready_to_go+Trim(turn_a_gundam_movie_01_guin_help_loran,0,213)+Trim(turn_a_gundam_movie_01_sunny_sky,0,48)
turn_a_gundam_tv_op_01_t03=turn_a_gundam_movie_01_partner+Trim(turn_a_gundam_movie_01_kihel_talk_with_harry,160,0)+Trim(turn_a_gundam_movie_01_kihel_and_dianna_exchange,40,0)
turn_a_gundam_tv_op_01_t04=DOUBLE_FADE_WITH_BRIGHTNESS_OFFSET(overlay_clip,Trim(turn_a_gundam_movie_01_turn_a_fight,50,-569),double_fade_length,double_fade_length)
turn_a_gundam_tv_op_01_t05=DOUBLE_FADE_WITH_BRIGHTNESS_OFFSET(turn_a_gundam_movie_01_turn_a_walk_trimmed,Dissolve(turn_a_gundam_tv_clean_op_01_02_resized,turn_a_gundam_movie_01_heim_sisters_in_river,20),double_fade_length,double_fade_length)
turn_a_gundam_tv_op_01_t06=DOUBLE_FADE_WITH_BRIGHTNESS_OFFSET(Trim(turn_a_gundam_movie_01_kihel_and_dianna_hug,0,190),Trim(turn_a_gundam_movie_01_turn_a_view,20,0),double_fade_length,double_fade_length)
turn_a_gundam_tv_op_01_t07=DOUBLE_FADE_WITH_BRIGHTNESS_OFFSET(turn_a_gundam_movie_01_loran_cross_dressing,Trim(turn_a_gundam_movie_01_laura_dance,30,-475),double_fade_length,double_fade_length)
turn_a_gundam_tv_op_01_t08=turn_a_gundam_movie_01_turn_a_appearing+Dissolve(turn_a_gundam_movie_01_turn_a_launch,turn_a_gundam_movie_01_loran_launch_turn_a,20)+turn_a_gundam_tv_clean_op_01_03_resized+BlankClip(turn_a_gundam_movie_01_loran_ready_to_go,length=48,color=color_black)

turn_a_gundam_tv_op_01_temp=DOUBLE_FADE_WITH_BRIGHTNESS_OFFSET(turn_a_gundam_tv_op_01_t01,turn_a_gundam_tv_op_01_t02+turn_a_gundam_tv_op_01_t03,double_fade_length,double_fade_length)
turn_a_gundam_tv_op_01_temp=DOUBLE_FADE_WITH_BRIGHTNESS_OFFSET(turn_a_gundam_tv_op_01_temp,turn_a_gundam_tv_op_01_t04,double_fade_length,double_fade_length)
turn_a_gundam_tv_op_01_temp=DOUBLE_FADE_WITH_BRIGHTNESS_OFFSET(turn_a_gundam_tv_op_01_temp,turn_a_gundam_tv_op_01_t05+turn_a_gundam_tv_op_01_t06,double_fade_length,double_fade_length)
turn_a_gundam_tv_op_01_temp=DOUBLE_FADE_WITH_BRIGHTNESS_OFFSET(turn_a_gundam_tv_op_01_temp,turn_a_gundam_tv_op_01_t07,double_fade_length,double_fade_length)
turn_a_gundam_tv_op_01_temp=DOUBLE_FADE_WITH_BRIGHTNESS_OFFSET(turn_a_gundam_tv_op_01_temp,turn_a_gundam_tv_op_01_t08,double_fade_length,double_fade_length)

turn_a_gundam_tv_op_01_mute=turn_a_gundam_tv_op_01_temp

######## Music ########

bgm_48khz=SSRC(WAVSource("src\turn_a_gundam-tv-op-01-01.wav"),48000)
AudioDub(turn_a_gundam_tv_op_01_mute,bgm_48khz)

######## Subtitle ########

ConvertToRGB32()

SUBTITLE_FX("ターンAターン//西城秀樹|- by fielia@AVISynth",subtitle_x,subtitle_y-subtitle_size,6766,6818,is_title=true)

SUBTITLE_FX("ターンAターン ターンAターン ターンA",subtitle_x,subtitle_y,117,320)

SUBTITLE_FX("刻が未来にすすむと 誰がきめたんだ",subtitle_x,subtitle_y,362,508)
SUBTITLE_FX("烙印をけす命が 歴史をかきなおす",subtitle_x,subtitle_y,551,703)

SUBTITLE_FX("美しい剣は 人と人つなげて",subtitle_x,subtitle_y,741,899)
SUBTITLE_FX("巡りくる切なさ 悲しみを払って",subtitle_x,subtitle_y,927,1142)
SUBTITLE_FX("あなたとの間に 命ある形を",subtitle_x,subtitle_y,1164,1343)
SUBTITLE_FX("この星に捧げる 愛というしるしで",subtitle_x,subtitle_y,1355,1627)

SUBTITLE_FX("ターンAターン ターンAターン ターンA",subtitle_x,subtitle_y,1640,1822)
SUBTITLE_FX("ターンAターン ターンAターン ターンA",subtitle_x,subtitle_y,1831,2017)

SUBTITLE_FX("刻は巡りもどると 誰も信じてた",subtitle_x,subtitle_y,2597,2746)
SUBTITLE_FX("黒くくすんだ暦を 新たにかきなおす",subtitle_x,subtitle_y,2787,2937)

SUBTITLE_FX("星々のまたたき 生きものにほほえみ",subtitle_x,subtitle_y,2977,3133)
SUBTITLE_FX("太陽と月とが この大地あたため",subtitle_x,subtitle_y,3162,3377)
SUBTITLE_FX("生まれ出る喜び 慈しむ心を",subtitle_x,subtitle_y,3400,3578)
SUBTITLE_FX("ゆるやかに育てて 傷口を癒そう",subtitle_x,subtitle_y,3590,3864)

SUBTITLE_FX("ターンAターン ターンAターン ターンA",subtitle_x,subtitle_y,3875,4056)
SUBTITLE_FX("ターンAターン ターンAターン ターンA",subtitle_x,subtitle_y,4066,4264)

SUBTITLE_FX("美しい剣は 人と人つなげて",subtitle_x,subtitle_y,4452,4605)
SUBTITLE_FX("巡りくる切なさ 悲しみを払って",subtitle_x,subtitle_y,4637,4852)
SUBTITLE_FX("あなたとの間に 命ある形を",subtitle_x,subtitle_y,4874,5052)
SUBTITLE_FX("この星に捧げる 愛というしるしで",subtitle_x,subtitle_y,5064,5340)

SUBTITLE_FX("ターンAターン ターンAターン ターンA",subtitle_x,subtitle_y,5350,5530)
SUBTITLE_FX("ターンAターン ターンAターン ターンA",subtitle_x,subtitle_y,5540,5732)

SUBTITLE_FX("ターンAターン ターンAターン ターンA",subtitle_x,subtitle_y,5825,6005)
SUBTITLE_FX("ターンAターン ターンAターン ターンA",subtitle_x,subtitle_y,6015,6202)

last_subtitle_end_frame=6491
SUBTITLE_FX("ターンAターン ターンAターン ターンA...",subtitle_x,subtitle_y,6301,last_subtitle_end_frame,6670-last_subtitle_end_frame)

######## Post Processing ########

ConvertToYV12()
#ConvertToYUY2()
#ConvertToRGB24()

TCPServer()
