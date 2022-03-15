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



Import("azumalim-common-cross_process.avsi")

######## Function ########

function FRAME_RATE_0_5X(clip clip){
	return SelectEvery(clip,2,0)
}

######## YouTube (1920*1080 30p) (3840*2160 30p) (3840*2160 60p) ########

function AZUMALIM_RANCH_MP4_REF_SOURCE(){
	azumalim_ranch_mp4_ref=SSRC(FFmpegSource2("src\newbie_rider\【初心者バイク女子】ヘアピンカーブを曲がると牧場があった。There was a ranch around a hairpin curve.｜ENG SUB｜スーパーカブC125.720p.mp4",fpsnum=30,fpsden=1,atrack=-1,threads=1),48000)
	return azumalim_ranch_mp4_ref
}

function AZUMALIM_RANCH_MP4_SOURCE(){
	azumalim_ranch_mp4_video=FFVideoSource("src\newbie_rider\【初心者バイク女子】ヘアピンカーブを曲がると牧場があった。There was a ranch around a hairpin curve.｜ENG SUB｜スーパーカブC125.DASH-1080p.mp4",fpsnum=30,fpsden=1,threads=1,seekmode=-1)
	azumalim_ranch_mp4_audio=FFAudioSource("src\newbie_rider\【初心者バイク女子】ヘアピンカーブを曲がると牧場があった。There was a ranch around a hairpin curve.｜ENG SUB｜スーパーカブC125.DASH-128k.m4a")
	azumalim_ranch_mp4=AudioDub(azumalim_ranch_mp4_video,azumalim_ranch_mp4_audio)
	azumalim_ranch_mp4=SSRC(azumalim_ranch_mp4,48000)
	return azumalim_ranch_mp4
}

azumalim_ranch=AZUMALIM_RANCH_MP4_REF_SOURCE()
azumalim_ranch=AZUMALIM_RANCH_MP4_SOURCE()



function AZUMALIM_FIRST_SLIP_MP4_REF_SOURCE(){
	azumalim_first_slip_mp4_ref=SSRC(FFmpegSource2("src\newbie_rider\初立ちゴケ...偶然その場にいたヒーローおじさんが助けてくれた。Cub's First Slip, But then a hero showed up.｜ENG SUB｜スーパーカブC125.720p.mp4",fpsnum=30,fpsden=1,atrack=-1,threads=1),48000)
	return azumalim_first_slip_mp4_ref
}

function AZUMALIM_FIRST_SLIP_MP4_SOURCE(){
	azumalim_first_slip_mp4_video=FFVideoSource("src\newbie_rider\初立ちゴケ...偶然その場にいたヒーローおじさんが助けてくれた。Cub's First Slip, But then a hero showed up.｜ENG SUB｜スーパーカブC125.DASH-1080p.mp4",fpsnum=30,fpsden=1,threads=1,seekmode=-1)
	azumalim_first_slip_mp4_audio=FFAudioSource("src\newbie_rider\初立ちゴケ...偶然その場にいたヒーローおじさんが助けてくれた。Cub's First Slip, But then a hero showed up.｜ENG SUB｜スーパーカブC125.DASH-128k.m4a")
	azumalim_first_slip_mp4=AudioDub(azumalim_first_slip_mp4_video,azumalim_first_slip_mp4_audio)
	azumalim_first_slip_mp4=SSRC(azumalim_first_slip_mp4,48000)
	return azumalim_first_slip_mp4
}

azumalim_first_slip=AZUMALIM_FIRST_SLIP_MP4_REF_SOURCE()
azumalim_first_slip=AZUMALIM_FIRST_SLIP_MP4_SOURCE()



function AZUMALIM_STYLISH_REPAIR_MP4_REF_SOURCE(){
	azumalim_stylish_repair_mp4_ref=SSRC(FFmpegSource2("src\newbie_rider\初コケしちゃった傷をオシャレに補修してみた。 I stylish repaired the damage from my first slipped.｜ENG SUB｜スーパーカブC125.720p.mp4",fpsnum=30,fpsden=1,atrack=-1,threads=1),48000)
	return azumalim_stylish_repair_mp4_ref
}

function AZUMALIM_STYLISH_REPAIR_MP4_SOURCE(){
	azumalim_stylish_repair_mp4_video=FFVideoSource("src\newbie_rider\初コケしちゃった傷をオシャレに補修してみた。 I stylish repaired the damage from my first slipped.｜ENG SUB｜スーパーカブC125.DASH-1080p.mp4",fpsnum=30,fpsden=1,threads=1,seekmode=-1)
	azumalim_stylish_repair_mp4_audio=FFAudioSource("src\newbie_rider\初コケしちゃった傷をオシャレに補修してみた。 I stylish repaired the damage from my first slipped.｜ENG SUB｜スーパーカブC125.DASH-128k.m4a")
	azumalim_stylish_repair_mp4=AudioDub(azumalim_stylish_repair_mp4_video,azumalim_stylish_repair_mp4_audio)
	azumalim_stylish_repair_mp4=SSRC(azumalim_stylish_repair_mp4,48000)
	return azumalim_stylish_repair_mp4
}

azumalim_stylish_repair=AZUMALIM_STYLISH_REPAIR_MP4_REF_SOURCE()
azumalim_stylish_repair=AZUMALIM_STYLISH_REPAIR_MP4_SOURCE()



function AZUMALIM_TOURING_TO_UNKNOWN_CITY_MP4_REF_SOURCE(){
	azumalim_touring_to_unknown_city_mp4_ref=SSRC(FFmpegSource2("src\newbie_rider\【癒し】放課後、知らない街までツーリングするぼっちJK。Girl alone touring to an unknown city after school.｜ENG SUB｜スーパーカブC125.720p.mp4",fpsnum=30,fpsden=1,atrack=-1,threads=1),48000)
	return azumalim_touring_to_unknown_city_mp4_ref
}

function AZUMALIM_TOURING_TO_UNKNOWN_CITY_MP4_SOURCE(){
	azumalim_touring_to_unknown_city_mp4_video=FFVideoSource("src\newbie_rider\【癒し】放課後、知らない街までツーリングするぼっちJK。Girl alone touring to an unknown city after school.｜ENG SUB｜スーパーカブC125.DASH-1080p.mp4",fpsnum=30,fpsden=1,threads=1,seekmode=-1)
	azumalim_touring_to_unknown_city_mp4_audio=FFAudioSource("src\newbie_rider\【癒し】放課後、知らない街までツーリングするぼっちJK。Girl alone touring to an unknown city after school.｜ENG SUB｜スーパーカブC125.DASH-128k.m4a")
	azumalim_touring_to_unknown_city_mp4=AudioDub(azumalim_touring_to_unknown_city_mp4_video,azumalim_touring_to_unknown_city_mp4_audio)
	azumalim_touring_to_unknown_city_mp4=SSRC(azumalim_touring_to_unknown_city_mp4,48000)
	return azumalim_touring_to_unknown_city_mp4
}

azumalim_touring_to_unknown_city=AZUMALIM_TOURING_TO_UNKNOWN_CITY_MP4_REF_SOURCE()
azumalim_touring_to_unknown_city=AZUMALIM_TOURING_TO_UNKNOWN_CITY_MP4_SOURCE()



function AZUMALIM_GO_TO_WATERFALL_MP4_REF_SOURCE(){
	azumalim_go_to_waterfall_mp4_ref=SSRC(FFmpegSource2("src\newbie_rider\ぼっちバイク女子、滝行に1人で行く。超恐怖。Motorcycle Girl,go to a waterfall alone.｜ENG SUB｜スーパーカブC125.720p.mp4",fpsnum=30000,fpsden=1001,atrack=-1,threads=1),48000)
	return azumalim_go_to_waterfall_mp4_ref
}

function AZUMALIM_GO_TO_WATERFALL_MP4_SOURCE(){
	azumalim_go_to_waterfall_mp4_video=FFVideoSource("src\newbie_rider\ぼっちバイク女子、滝行に1人で行く。超恐怖。Motorcycle Girl,go to a waterfall alone.｜ENG SUB｜スーパーカブC125.DASH-1080p.mp4",fpsnum=30000,fpsden=1001,threads=1,seekmode=-1)
	azumalim_go_to_waterfall_mp4_audio=FFAudioSource("src\newbie_rider\ぼっちバイク女子、滝行に1人で行く。超恐怖。Motorcycle Girl,go to a waterfall alone.｜ENG SUB｜スーパーカブC125.DASH-128k.m4a")
	azumalim_go_to_waterfall_mp4=AudioDub(azumalim_go_to_waterfall_mp4_video,azumalim_go_to_waterfall_mp4_audio)
	azumalim_go_to_waterfall_mp4=SSRC(azumalim_go_to_waterfall_mp4,48000)
	return azumalim_go_to_waterfall_mp4
}

azumalim_go_to_waterfall=AZUMALIM_GO_TO_WATERFALL_MP4_REF_SOURCE()
azumalim_go_to_waterfall=AZUMALIM_GO_TO_WATERFALL_MP4_SOURCE()



function AZUMALIM_CAME_TO_BEACH_MP4_REF_SOURCE(){
	azumalim_came_to_beach_mp4_ref=SSRC(FFmpegSource2("src\newbie_rider\1人でカブと海に来た！今日から始まる海物語。I came to the beach alone, in Super Cub!｜ENG SUB.720p.mp4",fpsnum=30000,fpsden=1001,atrack=-1,threads=1),48000)
	return azumalim_came_to_beach_mp4_ref
}

function AZUMALIM_CAME_TO_BEACH_MP4_SOURCE(){
	azumalim_came_to_beach_mp4_video=FFVideoSource("src\newbie_rider\1人でカブと海に来た！今日から始まる海物語。I came to the beach alone, in Super Cub!｜ENG SUB.DASH-1080p.mp4",fpsnum=30000,fpsden=1001,threads=1,seekmode=-1)
	azumalim_came_to_beach_mp4_audio=FFAudioSource("src\newbie_rider\1人でカブと海に来た！今日から始まる海物語。I came to the beach alone, in Super Cub!｜ENG SUB.DASH-128k.m4a")
	azumalim_came_to_beach_mp4=AudioDub(azumalim_came_to_beach_mp4_video,azumalim_came_to_beach_mp4_audio)
	azumalim_came_to_beach_mp4=SSRC(azumalim_came_to_beach_mp4,48000)
	return azumalim_came_to_beach_mp4
}

function AZUMALIM_CAME_TO_BEACH_WEBM_SOURCE(){
	azumalim_came_to_beach_webm_video_2160p_path="src\newbie_rider\1人でカブと海に来た！今日から始まる海物語。I came to the beach alone, in Super Cub!｜ENG SUB.DASH-2160p.webm"

	# FFMS2 cannot decode VP9 as AVC
	azumalim_came_to_beach_webm_video=FFVideoSource(azumalim_came_to_beach_webm_video_2160p_path,fpsnum=30000,fpsden=1001,threads=1,seekmode=-1)
	#azumalim_came_to_beach_webm_video=ASSUME_29_97P(DirectShowSource(azumalim_came_to_beach_webm_video_2160p_path,seekzero=true))
	#azumalim_came_to_beach_webm_video=Loop(azumalim_came_to_beach_webm_video,2,0,0)

	#azumalim_came_to_beach_webm_audio=FFAudioSource("src\newbie_rider\1人でカブと海に来た！今日から始まる海物語。I came to the beach alone, in Super Cub!｜ENG SUB.DASH-160k.webm")
	azumalim_came_to_beach_webm_audio=SSRC(FFAudioSource("src\newbie_rider\1人でカブと海に来た！今日から始まる海物語。I came to the beach alone, in Super Cub!｜ENG SUB.DASH-128k.m4a"),48000)
	azumalim_came_to_beach_webm=AudioDub(azumalim_came_to_beach_webm_video,azumalim_came_to_beach_webm_audio)
	return azumalim_came_to_beach_webm
}

azumalim_came_to_beach=AZUMALIM_CAME_TO_BEACH_MP4_REF_SOURCE()
azumalim_came_to_beach=AZUMALIM_CAME_TO_BEACH_MP4_SOURCE()
#azumalim_came_to_beach=AZUMALIM_CAME_TO_BEACH_WEBM_SOURCE()



#function AZUMALIM_SWIMSUIT_MP4_REF_SOURCE(){
#	azumalim_swimsuit_mp4_ref=SSRC(FFmpegSource2("src\newbie_rider\【水着お披露目】カブと秘密の砂浜へ！ときめき注意?新衣装 The Beach with a Super Cub! Love Alert? New costume.｜ENG SUB.720p.mp4",fpsnum=30000,fpsden=1001,atrack=-1,threads=1),48000)
#	return azumalim_swimsuit_mp4_ref
#}

#function AZUMALIM_SWIMSUIT_MP4_SOURCE(){
#	azumalim_swimsuit_mp4_video=FFVideoSource("src\newbie_rider\【水着お披露目】カブと秘密の砂浜へ！ときめき注意?新衣装 The Beach with a Super Cub! Love Alert? New costume.｜ENG SUB.DASH-1080p.mp4",fpsnum=30000,fpsden=1001,threads=1,seekmode=-1)
#	azumalim_swimsuit_mp4_audio=FFAudioSource("src\newbie_rider\【水着お披露目】カブと秘密の砂浜へ！ときめき注意?新衣装 The Beach with a Super Cub! Love Alert? New costume.｜ENG SUB.DASH-128k.m4a")
#	azumalim_swimsuit_mp4=AudioDub(azumalim_swimsuit_mp4_video,azumalim_swimsuit_mp4_audio)
#	azumalim_swimsuit_mp4=SSRC(azumalim_swimsuit_mp4,48000)
#	return azumalim_swimsuit_mp4
#}

#function AZUMALIM_SWIMSUIT_WEBM_SOURCE(){
#	azumalim_swimsuit_webm_video_2160p_path="src\newbie_rider\【水着お披露目】カブと秘密の砂浜へ！ときめき注意?新衣装 The Beach with a Super Cub! Love Alert? New costume.｜ENG SUB.DASH-2160p.webm"

#	# FFMS2 cannot decode VP9 as AVC
#	azumalim_swimsuit_webm_video=FFVideoSource(azumalim_swimsuit_webm_video_2160p_path,fpsnum=30000,fpsden=1001,threads=1,seekmode=-1)
#	#azumalim_swimsuit_webm_video=ASSUME_29_97P(DirectShowSource(azumalim_swimsuit_webm_video_2160p_path,seekzero=true))
#	#azumalim_swimsuit_webm_video=Loop(azumalim_swimsuit_webm_video,2,0,0)

#	#azumalim_swimsuit_webm_audio=FFAudioSource("src\newbie_rider\【水着お披露目】カブと秘密の砂浜へ！ときめき注意?新衣装 The Beach with a Super Cub! Love Alert? New costume.｜ENG SUB.DASH-160k.webm")
#	azumalim_swimsuit_webm_audio=SSRC(FFAudioSource("src\newbie_rider\【水着お披露目】カブと秘密の砂浜へ！ときめき注意?新衣装 The Beach with a Super Cub! Love Alert? New costume.｜ENG SUB.DASH-128k.m4a"),48000)
#	azumalim_swimsuit_webm=AudioDub(azumalim_swimsuit_webm_video,azumalim_swimsuit_webm_audio)
#	return azumalim_swimsuit_webm
#}

#azumalim_swimsuit=AZUMALIM_SWIMSUIT_MP4_REF_SOURCE()
#azumalim_swimsuit=AZUMALIM_SWIMSUIT_MP4_SOURCE()
#azumalim_swimsuit=AZUMALIM_SWIMSUIT_WEBM_SOURCE()



function AZUMALIM_CLIMBING_MOUNTAIN_MP4_REF_SOURCE(){
	azumalim_climbing_mountain_mp4_ref=SSRC(FFmpegSource2("src\newbie_rider\【コケた】カブで海探してたら山登りをしていた件 Motorcycle girl climbing a mountain in a SuperCub. ｜ENG SUB｜スーパーカブC125.720p.mp4",fpsnum=30000,fpsden=1001,atrack=-1,threads=1),48000)
	return azumalim_climbing_mountain_mp4_ref
}

function AZUMALIM_CLIMBING_MOUNTAIN_MP4_SOURCE(){
	azumalim_climbing_mountain_mp4_video=FFVideoSource("src\newbie_rider\【コケた】カブで海探してたら山登りをしていた件 Motorcycle girl climbing a mountain in a SuperCub. ｜ENG SUB｜スーパーカブC125.DASH-1080p.mp4",fpsnum=30000,fpsden=1001,threads=1,seekmode=-1)
	azumalim_climbing_mountain_mp4_audio=FFAudioSource("src\newbie_rider\【コケた】カブで海探してたら山登りをしていた件 Motorcycle girl climbing a mountain in a SuperCub. ｜ENG SUB｜スーパーカブC125.DASH-128k.m4a")
	azumalim_climbing_mountain_mp4=AudioDub(azumalim_climbing_mountain_mp4_video,azumalim_climbing_mountain_mp4_audio)
	azumalim_climbing_mountain_mp4=SSRC(azumalim_climbing_mountain_mp4,48000)
	return azumalim_climbing_mountain_mp4
}

function AZUMALIM_CLIMBING_MOUNTAIN_WEBM_SOURCE(){
	azumalim_climbing_mountain_webm_video_2160p_path="src\newbie_rider\【コケた】カブで海探してたら山登りをしていた件 Motorcycle girl climbing a mountain in a SuperCub. ｜ENG SUB｜スーパーカブC125.DASH-2160p.webm"

	# FFMS2 cannot decode VP9 as AVC
	azumalim_climbing_mountain_webm_video=FFVideoSource(azumalim_climbing_mountain_webm_video_2160p_path,fpsnum=30000,fpsden=1001,threads=1,seekmode=-1)
	#azumalim_climbing_mountain_webm_video=ASSUME_29_97P(DirectShowSource(azumalim_climbing_mountain_webm_video_2160p_path,seekzero=true))
	#azumalim_climbing_mountain_webm_video=Loop(azumalim_climbing_mountain_webm_video,2,0,0)

	#azumalim_climbing_mountain_webm_audio=FFAudioSource("src\newbie_rider\【コケた】カブで海探してたら山登りをしていた件 Motorcycle girl climbing a mountain in a SuperCub. ｜ENG SUB｜スーパーカブC125.DASH-160k.webm")
	azumalim_climbing_mountain_webm_audio=SSRC(FFAudioSource("src\newbie_rider\【コケた】カブで海探してたら山登りをしていた件 Motorcycle girl climbing a mountain in a SuperCub. ｜ENG SUB｜スーパーカブC125.DASH-128k.m4a"),48000)
	azumalim_climbing_mountain_webm=AudioDub(azumalim_climbing_mountain_webm_video,azumalim_climbing_mountain_webm_audio)
	return azumalim_climbing_mountain_webm
}

azumalim_climbing_mountain=AZUMALIM_CLIMBING_MOUNTAIN_MP4_REF_SOURCE()
azumalim_climbing_mountain_cache02=azumalim_climbing_mountain
azumalim_climbing_mountain=AZUMALIM_CLIMBING_MOUNTAIN_MP4_SOURCE()
azumalim_climbing_mountain_cache02=AZUMALIM_CLIMBING_MOUNTAIN_MP4_SOURCE()
#azumalim_climbing_mountain=AZUMALIM_CLIMBING_MOUNTAIN_WEBM_SOURCE()
#azumalim_climbing_mountain_cache02=AZUMALIM_CLIMBING_MOUNTAIN_WEBM_SOURCE()



function AZUMALIM_WASHING_BIKE_MP4_REF_SOURCE(){
	azumalim_washing_bike_mp4_ref=SSRC(FFmpegSource2("src\newbie_rider\初心者バイク女子が初めての洗車に挑戦します、が…【スーパーカブC125】ENG SUB.720p.mp4",fpsnum=30000,fpsden=1001,atrack=-1,threads=1),48000)
	return azumalim_washing_bike_mp4_ref
}

function AZUMALIM_WASHING_BIKE_MP4_SOURCE(){
	azumalim_washing_bike_mp4_video=FFVideoSource("src\newbie_rider\初心者バイク女子が初めての洗車に挑戦します、が…【スーパーカブC125】ENG SUB.DASH-1080p.mp4",fpsnum=30000,fpsden=1001,threads=1,seekmode=-1)
	azumalim_washing_bike_mp4_audio=FFAudioSource("src\newbie_rider\初心者バイク女子が初めての洗車に挑戦します、が…【スーパーカブC125】ENG SUB.DASH-128k.m4a")
	azumalim_washing_bike_mp4=AudioDub(azumalim_washing_bike_mp4_video,azumalim_washing_bike_mp4_audio)
	azumalim_washing_bike_mp4=SSRC(azumalim_washing_bike_mp4,48000)
	return azumalim_washing_bike_mp4
}

function AZUMALIM_WASHING_BIKE_WEBM_SOURCE(){
	azumalim_washing_bike_webm_video_2160p_path="src\newbie_rider\初心者バイク女子が初めての洗車に挑戦します、が…【スーパーカブC125】ENG SUB.DASH-2160p.webm"

	# FFMS2 cannot decode VP9 as AVC
	azumalim_washing_bike_webm_video=FFVideoSource(azumalim_washing_bike_webm_video_2160p_path,fpsnum=30000,fpsden=1001,threads=1,seekmode=-1)
	#azumalim_washing_bike_webm_video=ASSUME_29_97P(DirectShowSource(azumalim_washing_bike_webm_video_2160p_path,seekzero=true))
	#azumalim_washing_bike_webm_video=Loop(azumalim_washing_bike_webm_video,2,0,0)

	#azumalim_washing_bike_webm_audio=FFAudioSource("src\newbie_rider\初心者バイク女子が初めての洗車に挑戦します、が…【スーパーカブC125】ENG SUB.DASH-160k.webm")
	azumalim_washing_bike_webm_audio=SSRC(FFAudioSource("src\newbie_rider\初心者バイク女子が初めての洗車に挑戦します、が…【スーパーカブC125】ENG SUB.DASH-128k.m4a"),48000)
	azumalim_washing_bike_webm=AudioDub(azumalim_washing_bike_webm_video,azumalim_washing_bike_webm_audio)
	return azumalim_washing_bike_webm
}

azumalim_washing_bike=AZUMALIM_WASHING_BIKE_MP4_REF_SOURCE()
azumalim_washing_bike_cache02=azumalim_washing_bike
azumalim_washing_bike=AZUMALIM_WASHING_BIKE_MP4_SOURCE()
azumalim_washing_bike_cache02=AZUMALIM_WASHING_BIKE_MP4_SOURCE()
#azumalim_washing_bike=AZUMALIM_WASHING_BIKE_WEBM_SOURCE()
#azumalim_washing_bike_cache02=AZUMALIM_WASHING_BIKE_WEBM_SOURCE()



function AZUMALIM_BRING_BIKE_HOME_MP4_REF_SOURCE(){
	azumalim_bring_bike_home_mp4_ref=SSRC(FFmpegSource2("src\newbie_rider\実家に帰らせて頂きます。【スーパーカブC125｜ぼっちバイク女子】ENG SUB.720p.mp4",fpsnum=30000,fpsden=1001,atrack=-1,threads=1),48000)
	return azumalim_bring_bike_home_mp4_ref
}

function AZUMALIM_BRING_BIKE_HOME_MP4_SOURCE(){
	azumalim_bring_bike_home_mp4_video=FFVideoSource("src\newbie_rider\実家に帰らせて頂きます。【スーパーカブC125｜ぼっちバイク女子】ENG SUB.DASH-1080p60.mp4",fpsnum=60000,fpsden=1001,threads=1,seekmode=-1)
	azumalim_bring_bike_home_mp4_audio=FFAudioSource("src\newbie_rider\実家に帰らせて頂きます。【スーパーカブC125｜ぼっちバイク女子】ENG SUB.DASH-128k.m4a")
	azumalim_bring_bike_home_mp4=AudioDub(azumalim_bring_bike_home_mp4_video,azumalim_bring_bike_home_mp4_audio)
	azumalim_bring_bike_home_mp4=SSRC(azumalim_bring_bike_home_mp4,48000)
	return azumalim_bring_bike_home_mp4
}

function AZUMALIM_BRING_BIKE_HOME_WEBM_SOURCE(){
	azumalim_bring_bike_home_webm_video_2160p_path="src\newbie_rider\実家に帰らせて頂きます。【スーパーカブC125｜ぼっちバイク女子】ENG SUB.DASH-2160p60.webm"

	# FFMS2 cannot decode VP9 as AVC
	azumalim_bring_bike_home_webm_video=ChangeFPS(FFVideoSource(azumalim_bring_bike_home_webm_video_2160p_path,fpsnum=60000,fpsden=1001,threads=1,seekmode=-1),60000,1001)
	#azumalim_bring_bike_home_webm_video=ASSUME_59_94P(DirectShowSource(azumalim_bring_bike_home_webm_video_2160p_path,seekzero=true))
	#azumalim_bring_bike_home_webm_video=Loop(azumalim_bring_bike_home_webm_video,2,0,0)

	#azumalim_bring_bike_home_webm_audio=FFAudioSource("src\newbie_rider\実家に帰らせて頂きます。【スーパーカブC125｜ぼっちバイク女子】ENG SUB.DASH-160k.webm")
	azumalim_bring_bike_home_webm_audio=SSRC(FFAudioSource("src\newbie_rider\実家に帰らせて頂きます。【スーパーカブC125｜ぼっちバイク女子】ENG SUB.DASH-128k.m4a"),48000)
	azumalim_bring_bike_home_webm=AudioDub(azumalim_bring_bike_home_webm_video,azumalim_bring_bike_home_webm_audio)
	return azumalim_bring_bike_home_webm
}

azumalim_bring_bike_home=AZUMALIM_BRING_BIKE_HOME_MP4_REF_SOURCE()
azumalim_bring_bike_home=FRAME_RATE_0_5X(AZUMALIM_BRING_BIKE_HOME_MP4_SOURCE())
#azumalim_bring_bike_home=FRAME_RATE_0_5X(AZUMALIM_BRING_BIKE_HOME_WEBM_SOURCE())

#azumalim_bring_bike_home1=AZUMALIM_BRING_BIKE_HOME_MP4_SOURCE()
#azumalim_bring_bike_home2=AZUMALIM_BRING_BIKE_HOME_WEBM_SOURCE()

######## Wallpaper (1920*1200) ########

#azumalim_wallpaper=AUDIO_DUB_TONE(ImageSource("src\azumalim-hitori_cub_umi-maxresdefault.jpg",0,283,30.0,pixel_type="rgb24"),samplerate=48000,channels=2,type="Silence") #119 op 284 ed
#azumalim_wallpaper=Crop(azumalim_wallpaper,0,1200-1080,0,0)

######## Trim ########

# caution: FFMS2 2.21 frame accuracy is broken

azumalim_ranch_ride_bike_along_road_01=Trim(azumalim_ranch,0,95) #96
azumalim_ranch_ride_bike_along_road_02=Trim(azumalim_ranch,2561,2701) #141 op

azumalim_first_slip_teaser=Trim(azumalim_first_slip,0,252) #253 op
azumalim_first_slip_explain=Trim(azumalim_first_slip,9504,9787) #284

azumalim_stylish_repair_super_cub_c125_surround=Trim(azumalim_stylish_repair,1266,1477) #212 op
azumalim_stylish_repair_azumalim_cannot_open_sticker_bag=Trim(azumalim_stylish_repair,1721,2154) #434
azumalim_stylish_repair_azumalim_break_sticker_bag=Trim(azumalim_stylish_repair,2203,2324) #122
azumalim_stylish_repair_azumalim_cut_sticker_bag=Trim(azumalim_stylish_repair,2398,2516) #119
azumalim_stylish_repair_azumalim_explain=Trim(azumalim_stylish_repair,4572,6850) #2279
azumalim_stylish_repair_azumalim_explain_digest=Trim(azumalim_stylish_repair,4572,4954) #383 op
azumalim_stylish_repair_azumalim_ride_toward_sunset=Trim(azumalim_stylish_repair,6851,6993) #143

azumalim_touring_to_unknown_city_azumalim_point_sunset=Trim(azumalim_touring_to_unknown_city,3375,3499) #125 op
azumalim_touring_to_unknown_city_azumalim_hide_behind_stone=Trim(azumalim_touring_to_unknown_city,4235,4367) #133 op

azumalim_go_to_waterfall_azumalim_hide_behind_ground=Trim(azumalim_go_to_waterfall,9075,9418) #344
azumalim_go_to_waterfall_azumalim_see_waterfall_and_turn_back=Trim(azumalim_go_to_waterfall,13533,13758) #226 op
azumalim_go_to_waterfall_matagalim=Trim(azumalim_go_to_waterfall,14316,14409) #94

azumalim_came_to_beach_teaser_01=Trim(azumalim_came_to_beach,0,304) #305 op
azumalim_came_to_beach_teaser_02=Trim(azumalim_came_to_beach,305,460) #156 op
azumalim_came_to_beach_azumalim_wait_boiling=Trim(azumalim_came_to_beach,12999,13213) #215
azumalim_came_to_beach_kuru=Trim(azumalim_came_to_beach,16489,16530) #42
azumalim_came_to_beach_azumalim_show_noodles=Trim(azumalim_came_to_beach,16531,16584) #54 op
azumalim_came_to_beach_azumalim_stand_on_beach=Trim(azumalim_came_to_beach,17852,18108) #257 op

azumalim_climbing_mountain_azumalim_wear_swimsuit_on_beach=Trim(azumalim_climbing_mountain,303,350) #48 op
azumalim_climbing_mountain_azumalim_wear_swimsuit_on_beach_still_frame=Trim(azumalim_climbing_mountain,351,429) #79 op
azumalim_climbing_mountain_azumalim_wear_swimsuit_on_beach_explain=Trim(azumalim_climbing_mountain,430,644) #215
azumalim_climbing_mountain_azumalim_with_view=Trim(azumalim_climbing_mountain_cache02,6877,7051) #175 op
azumalim_climbing_mountain_azumalim_see_view=Trim(azumalim_climbing_mountain_cache02,7484,7604) #121 op
azumalim_climbing_mountain_azumalim_stand_up=Trim(azumalim_climbing_mountain,7605,7696) #92
azumalim_climbing_mountain_azumalim_simulate_mountain=Trim(azumalim_climbing_mountain,7697,7759) #63
azumalim_climbing_mountain_azumalim_in_spot_01=Trim(azumalim_climbing_mountain,10480,10519) #40
azumalim_climbing_mountain_azumalim_in_spot_02=Trim(azumalim_climbing_mountain,10520,10560) #41
azumalim_climbing_mountain_azumalim_in_spot_03=Trim(azumalim_climbing_mountain,10561,10591) #31
azumalim_climbing_mountain_azumalim_slip_again=Trim(azumalim_climbing_mountain,10592,11214) #623

azumalim_washing_bike_azumalim_shoot_water_toward_camera=Trim(azumalim_washing_bike,34,153) #120 op
azumalim_washing_bike_azumalim_wash_bike=Trim(azumalim_washing_bike_cache02,8143,8478) #336 op
azumalim_washing_bike_azumalim_drink_cafe=Trim(azumalim_washing_bike,17472,17800) #329 op
azumalim_washing_bike_azumalim_explain=Trim(azumalim_washing_bike,18581,18952) #372



is_60p=false

!is_60p?Eval("""
# 30p
azumalim_bring_bike_home_teaser_01=Trim(azumalim_bring_bike_home,334,553) #220
azumalim_bring_bike_home_teaser_02=Trim(azumalim_bring_bike_home,554,647) #94
azumalim_bring_bike_home_teaser_03=Trim(azumalim_bring_bike_home,648,794) #147 op
azumalim_bring_bike_home_azumalim_feed_takoyaki_to_bike=Trim(azumalim_bring_bike_home,14252,14424) #173 op
azumalim_bring_bike_home_azumalim_see_lake=Trim(azumalim_bring_bike_home,14643,15120) #478
"""):Eval("""
# 60p
azumalim_bring_bike_home_teaser_01=Trim(azumalim_bring_bike_home,668,1107)
azumalim_bring_bike_home_teaser_02=Trim(azumalim_bring_bike_home,1108,1295)
azumalim_bring_bike_home_teaser_03=Trim(azumalim_bring_bike_home,1296,1589)
azumalim_bring_bike_home_azumalim_feed_takoyaki_to_bike=Trim(azumalim_bring_bike_home,28504,28849)
azumalim_bring_bike_home_azumalim_see_lake=Trim(azumalim_bring_bike_home,29285,30241)
""")
