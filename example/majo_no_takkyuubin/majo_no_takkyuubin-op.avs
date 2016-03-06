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



Import("majo_no_takkyuubin-common.avsi")

######## Pre Combine ########

######## Combine ########

# majo_no_takkyuubin_01_op -102

fade_length=15

majo_no_takkyuubin_01_op_00=Trim(majo_no_takkyuubin_01_op,0,101)
majo_no_takkyuubin_01_op_01=Trim(majo_no_takkyuubin_01_op,102,0)

majo_no_takkyuubin_op_t01=majo_no_takkyuubin_01_op_01+TRIM_MIDDLE_CLIP(majo_no_takkyuubin_01_kiki_talk_with_friends,51)
majo_no_takkyuubin_op_t02=TRIM_MIDDLE_CLIP(majo_no_takkyuubin_01_kiki_run_across_river,95)+TRIM_MIDDLE_CLIP(majo_no_takkyuubin_01_kiki_turn,96)+TRIM_MIDDLE_CLIP(majo_no_takkyuubin_01_kiki_talk_with_mother,95)+TRIM_MIDDLE_CLIP(majo_no_takkyuubin_06_kiki_and_madame_and_barsa,94)
majo_no_takkyuubin_op_t03=TRIM_MIDDLE_CLIP(majo_no_takkyuubin_01_kiki_leave_train,189)+TRIM_MIDDLE_CLIP(majo_no_takkyuubin_02_fukuo_and_osono_make_bread,189)+TRIM_MIDDLE_CLIP(majo_no_takkyuubin_06_ursula_and_kiki_watch_painting,188)+TRIM_MIDDLE_CLIP(majo_no_takkyuubin_02_park,186)
majo_no_takkyuubin_op_t04=TRIM_LAST_CLIP(majo_no_takkyuubin_04_tombo_and_fukuo_waiting_for_kiki,191)+TRIM_MIDDLE_CLIP(majo_no_takkyuubin_04_kiki_cooking,190)
majo_no_takkyuubin_op_t05=TRIM_MIDDLE_CLIP(majo_no_takkyuubin_05_kiki_on_stair_01,191)+TRIM_MIDDLE_CLIP(majo_no_takkyuubin_03_kiki_fly_high,190)+TRIM_MIDDLE_CLIP(majo_no_takkyuubin_05_tombo_and_kiki_talk_01,93)
majo_no_takkyuubin_op_t06=TRIM_MIDDLE_CLIP(majo_no_takkyuubin_06_ursula_and_kiki_on_bed,191)+TRIM_LAST_CLIP(majo_no_takkyuubin_07_kiki_stare_blankly,192)+FadeOut0(TRIM_LAST_CLIP(majo_no_takkyuubin_03_kiki_do_nothing_02,190),fade_length*2)+BlankClip(majo_no_takkyuubin_01_op_01,length=90,color=color_black)

majo_no_takkyuubin_op_mute=majo_no_takkyuubin_op_t01+majo_no_takkyuubin_op_t02+majo_no_takkyuubin_op_t03+majo_no_takkyuubin_op_t04+majo_no_takkyuubin_op_t05+majo_no_takkyuubin_op_t06

#majo_no_takkyuubin_op_mute=BlankClip(majo_no_takkyuubin_op_mute)

######## Music ########

bgm_48khz=SSRC(AssumeSampleRate(WAVSource("src\yuming-1975_06_20-cobalt_hour-05.wav"),44019),48000)
AudioDub(majo_no_takkyuubin_op_mute,bgm_48khz)

######## Subtitle ########

SUBTITLE_FX("ルージュの伝言//荒井由実|- by fielia@AVISynth",subtitle_x,subtitle_y-subtitle_size,386,545,true)

SUBTITLE_FX("あのひとの ママに会うために",subtitle_x,subtitle_y,591,712)
SUBTITLE_FX("今ひとり 列車に乗ったの",subtitle_x,subtitle_y-subtitle_size,779,903)
SUBTITLE_FX("たそがれせまる 街並や車の流れ",subtitle_x,subtitle_y,941,1135)
SUBTITLE_FX("横目で追い越して",subtitle_x,subtitle_y-subtitle_size,1151,1292)

SUBTITLE_FX("あのひとは もう気づくころよ",subtitle_x,subtitle_y,1340,1460)
SUBTITLE_FX("バスルームに ルージュの伝言",subtitle_x,subtitle_y-subtitle_size,1527,1648)
SUBTITLE_FX("浮気な恋を はやくあきらめないかぎり",subtitle_x,subtitle_y,1690,1882)
SUBTITLE_FX("家には帰らない",subtitle_x,subtitle_y-subtitle_size,1900,2033)

SUBTITLE_FX("不安な気持ちを 残したまま",subtitle_x,subtitle_y,2098,2231)
SUBTITLE_FX("街はDing-Dong 遠ざかってゆくわ",subtitle_x,subtitle_y-subtitle_size,2288,2444)

SUBTITLE_FX("明日の朝 ママから電話で",subtitle_x,subtitle_y,2467,2591)
SUBTITLE_FX("しかってもらうわ My Darling!",subtitle_x,subtitle_y-subtitle_size,2632,2785)

SUBTITLE_FX("あのひとは あわててるころよ",subtitle_x,subtitle_y,3230,3347)
SUBTITLE_FX("バスルームに ルージュの伝言",subtitle_x,subtitle_y-subtitle_size,3414,3535)
SUBTITLE_FX("てあたりしだい 友達にたずねるかしら",subtitle_x,subtitle_y,3579,3774)
SUBTITLE_FX("私の行く先を",subtitle_x,subtitle_y-subtitle_size,3796,3922)

SUBTITLE_FX("不安な気持ちを 残したまま",subtitle_x,subtitle_y,3990,4122)
SUBTITLE_FX("街はDing-Dong 遠ざかってゆくわ",subtitle_x,subtitle_y-subtitle_size,4178,4338)

SUBTITLE_FX("明日の朝 ママから電話で",subtitle_x,subtitle_y,4358,4480)
SUBTITLE_FX("しかってもらうわ My Darling!",subtitle_x,subtitle_y-subtitle_size,4524,4675)
SUBTITLE_FX("しかってもらうわ My Darling!",subtitle_x,subtitle_y,4713,4869)



majo_no_takkyuubin_01_op_00=AUDIO_DUB_TONE(majo_no_takkyuubin_01_op_00,samplerate=48000,channels=2,type="Silence")
majo_no_takkyuubin_op=FadeIn0(majo_no_takkyuubin_01_op_00,fade_length)+ConvertToYUY2(last)
kiki_talk=FadeOut0(Trim(majo_no_takkyuubin_01_op,0,168+fade_length),fade_length)
MixAudio(majo_no_takkyuubin_op,kiki_talk,1.0,1.0)

SUBTITLE_N("ジジ ラジオ付けて",subtitle_x,subtitle_y,35,80)
SUBTITLE_N("今手が離せないの 早く",subtitle_x,subtitle_y,90,170)



majo_no_takkyuubin_01_mark++ConvertToYUY2(last)

######## Post Processing ########

#### restore interlace ####
Bob()

#### restore aspect ratio ####
Lanczos4Resize(856,480)

ConvertToYV12()
#ConvertToYUY2()
#ConvertToRGB24()

TCPServer()
