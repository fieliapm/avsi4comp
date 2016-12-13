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

majo_no_takkyuubin_ed_mute=majo_no_takkyuubin_07_ed

######## Music ########

#bgm_48khz=ResampleAudio(AssumeSampleRate(WAVSource("src\yuming-1974_10_05-misslim-03.wav"),44042),48000)
#bgm_48khz_delayed=DelayAudio(bgm_48khz,2.248)

bgm_48khz=ResampleAudio(AssumeSampleRate(WAVSource("src\majo_no_takkyuubin-ost-21.wav"),43738),48000)
bgm_48khz_delayed=DelayAudio(bgm_48khz,2.211)

AudioDub(majo_no_takkyuubin_ed_mute,bgm_48khz_delayed)

######## Subtitle ########

SUBTITLE_FX("�₳�����ɕ�܂ꂽ�Ȃ�|album version//�r��R��|- by fielia@AVISynth",subtitle_x,subtitle_y-(subtitle_size*2),80,287,true)

SUBTITLE_FX("���������͐_���܂�����",subtitle_x,subtitle_y,357,600)
SUBTITLE_FX("�s�v�c�ɖ������Ȃ��Ă��ꂽ",subtitle_x,subtitle_y-subtitle_size,632,879)
SUBTITLE_FX("�₳�����C���Ŗڊo�߂�����",subtitle_x,subtitle_y,907,1152)
SUBTITLE_FX("���ƂȂɂȂ��Ă���ւ͂������",subtitle_x,subtitle_y-subtitle_size,1181,1455)

SUBTITLE_FX("�J�[�e�����J���� �Â��Ȗ؉k��z��",subtitle_x,subtitle_y,1472,1718)
SUBTITLE_FX("�₳�����ɕ�܂ꂽ�Ȃ� ������",subtitle_x,subtitle_y-subtitle_size,1742,1984)
SUBTITLE_FX("�ڂɂ���S�Ă̂��Ƃ� ���b�Z�[�W",subtitle_x,subtitle_y,1991,2281)

SUBTITLE_FX("���������͐_���܂�����",subtitle_x,subtitle_y,2547,2787)
SUBTITLE_FX("��������͂��Ă��ꂽ",subtitle_x,subtitle_y-subtitle_size,2823,3069)
SUBTITLE_FX("�S�̉��ɂ��܂��Y�ꂽ",subtitle_x,subtitle_y,3098,3348)
SUBTITLE_FX("��؂Ȕ� �Ђ炭�Ƃ��͍�",subtitle_x,subtitle_y-subtitle_size,3372,3647)

SUBTITLE_FX("�J�オ��̒�� �����Ȃ��̍����",subtitle_x,subtitle_y,3666,3920)
SUBTITLE_FX("�₳�����ɕ�܂ꂽ�Ȃ� ������",subtitle_x,subtitle_y-subtitle_size,3941,4182)
SUBTITLE_FX("�ڂɂ���S�Ă̂��Ƃ� ���b�Z�[�W",subtitle_x,subtitle_y,4189,4486)

SUBTITLE_FX("�J�[�e�����J���� �Â��Ȗ؉k��z��",subtitle_x,subtitle_y,4552,4800)
SUBTITLE_FX("�₳�����ɕ�܂ꂽ�Ȃ� ������",subtitle_x,subtitle_y-subtitle_size,4823,5064)
SUBTITLE_FX("�ڂɂ���S�Ă̂��Ƃ� ���b�Z�[�W",subtitle_x,subtitle_y,5071,5436)



majo_no_takkyuubin_01_mark++ConvertToYUY2(FADE_IN_WITH_BRIGHTNESS_OFFSET(last,30))

######## Post Processing ########

#### restore interlace ####
Bob()

#### restore aspect ratio ####
Lanczos4Resize(856,480)

ConvertToYV12()
#ConvertToYUY2()
#ConvertToRGB24()

TCPServer()