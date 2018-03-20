set _mkvextract="C:\Program Files\Hybrid\mkvextract.exe"
set _mkvmerge="C:\Program Files\Hybrid\mkvmerge.exe"

set _input=%1

mkdir temp

%_mkvextract% tracks %_input% 1:"temp\lydie_and_suelle_no_atelier-op-audio_track_01.opus"
%_mkvextract% tracks %_input% 2:"temp\lydie_and_suelle_no_atelier-op-audio_track_02.opus"
%_mkvextract% tracks %_input% 3:"temp\lydie_and_suelle_no_atelier-op-audio_track_03.opus"
%_mkvextract% tracks %_input% 0:"temp\lydie_and_suelle_no_atelier-op-video_track.vp9"

mkdir output

%_mkvmerge% --ui-language en -o "output\[リディー&スールのアトリエ] クローマ.webm" --webm -d 0 --default-track 0:yes --language 0:en --default-duration 0:30000/1001fps --aspect-ratio-factor 0:1/1 --no-chapters --compression -1:none --forced-track 0:yes --no-audio --no-subtitles "temp\lydie_and_suelle_no_atelier-op-video_track.vp9" --default-track 0:yes --forced-track 0:no -a 0 --compression -1:none --no-video --no-subtitles --no-chapters "temp\lydie_and_suelle_no_atelier-op-audio_track_01.opus"
%_mkvmerge% --ui-language en -o "output\[リディー&スールのアトリエ] キャンバス.webm" --webm -d 0 --default-track 0:yes --language 0:en --default-duration 0:30000/1001fps --aspect-ratio-factor 0:1/1 --no-chapters --compression -1:none --forced-track 0:yes --no-audio --no-subtitles "temp\lydie_and_suelle_no_atelier-op-video_track.vp9" --default-track 0:yes --forced-track 0:no -a 0 --compression -1:none --no-video --no-subtitles --no-chapters "temp\lydie_and_suelle_no_atelier-op-audio_track_02.opus"
%_mkvmerge% --ui-language en -o "output\[リディー&スールのアトリエ] ペインティング.webm" --webm -d 0 --default-track 0:yes --language 0:en --default-duration 0:30000/1001fps --aspect-ratio-factor 0:1/1 --no-chapters --compression -1:none --forced-track 0:yes --no-audio --no-subtitles "temp\lydie_and_suelle_no_atelier-op-video_track.vp9" --default-track 0:yes --forced-track 0:no -a 0 --compression -1:none --no-video --no-subtitles --no-chapters "temp\lydie_and_suelle_no_atelier-op-audio_track_03.opus"

rmdir /s /q temp

set _input=

set _mkvextract=
set _mkvmerge=
