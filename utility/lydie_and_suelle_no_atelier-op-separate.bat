set _mkvextract="C:\Program Files\Hybrid\mkvextract.exe"
set _mkvmerge="C:\Program Files\Hybrid\mkvmerge.exe"

mkdir temp

%_mkvextract% tracks "..\release\vp9\[���f�B�[&�X�[���̃A�g���G] �N���[�}+�L�����o�X+�y�C���e�B���O.webm" 1:"temp\lydie_and_suelle_no_atelier-op-audio_track_01.opus"
%_mkvextract% tracks "..\release\vp9\[���f�B�[&�X�[���̃A�g���G] �N���[�}+�L�����o�X+�y�C���e�B���O.webm" 2:"temp\lydie_and_suelle_no_atelier-op-audio_track_02.opus"
%_mkvextract% tracks "..\release\vp9\[���f�B�[&�X�[���̃A�g���G] �N���[�}+�L�����o�X+�y�C���e�B���O.webm" 3:"temp\lydie_and_suelle_no_atelier-op-audio_track_03.opus"
%_mkvextract% tracks "..\release\vp9\[���f�B�[&�X�[���̃A�g���G] �N���[�}+�L�����o�X+�y�C���e�B���O.webm" 0:"temp\lydie_and_suelle_no_atelier-op-video_track.vp9"

%_mkvmerge% --ui-language en -o "..\release\[���f�B�[&�X�[���̃A�g���G] �N���[�}.webm" --webm -d 0 --default-track 0:yes --language 0:en --default-duration 0:30000/1001fps --aspect-ratio-factor 0:1/1 --no-chapters --compression -1:none --forced-track 0:yes --no-audio --no-subtitles "temp\lydie_and_suelle_no_atelier-op-video_track.vp9" --default-track 0:yes --forced-track 0:no -a 0 --compression -1:none --no-video --no-subtitles --no-chapters "temp\lydie_and_suelle_no_atelier-op-audio_track_01.opus"
%_mkvmerge% --ui-language en -o "..\release\[���f�B�[&�X�[���̃A�g���G] �L�����o�X.webm" --webm -d 0 --default-track 0:yes --language 0:en --default-duration 0:30000/1001fps --aspect-ratio-factor 0:1/1 --no-chapters --compression -1:none --forced-track 0:yes --no-audio --no-subtitles "temp\lydie_and_suelle_no_atelier-op-video_track.vp9" --default-track 0:yes --forced-track 0:no -a 0 --compression -1:none --no-video --no-subtitles --no-chapters "temp\lydie_and_suelle_no_atelier-op-audio_track_02.opus"
%_mkvmerge% --ui-language en -o "..\release\[���f�B�[&�X�[���̃A�g���G] �y�C���e�B���O.webm" --webm -d 0 --default-track 0:yes --language 0:en --default-duration 0:30000/1001fps --aspect-ratio-factor 0:1/1 --no-chapters --compression -1:none --forced-track 0:yes --no-audio --no-subtitles "temp\lydie_and_suelle_no_atelier-op-video_track.vp9" --default-track 0:yes --forced-track 0:no -a 0 --compression -1:none --no-video --no-subtitles --no-chapters "temp\lydie_and_suelle_no_atelier-op-audio_track_03.opus"

rmdir /s /q temp

set _mkvextract=
set _mkvmerge=
