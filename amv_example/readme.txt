前言:

因為這個工具本身存在許多讓新手難以進入門檻的障礙
又怕發生一次之前做過的MV的專案檔,隨著老化的光碟片逝去
所以往後除了MV上傳
也會一併補上個人開始用AVISynth生MV的每個avs原始檔
如果有興趣精通AVISynth的話
可以參考看看

本著AVISynth廣泛用在二創上
讓每個市井小民都能有自己發揮點子的機會
所以個人在此發佈的avs與avsi檔版權全都是GPLv3
GPLv3的內文放在mtv_backup下的gpl.txt中
如果看不懂英文的話可以Google一下GPLv3的中文翻譯



要跑這些avs檔
除了AVISynth得安裝在系統上以外(個人目前用AVISynth 2.5.7)
還需要:
FFMS2 (個人目前用2.16)
DGDecode 1.5.8
Zoom (2005-01-22)
EffectsMany
SubtitleEx Kai 1.00

import方式如下:
Import("FFMS2.avsi")
LoadPlugin("DGDecode.dll")
LoadPlugin("zoom.dll")
LoadPlugin("EffectsMany.dll")
LoadPlugin("SubtitleEx.dll")

這些指令在macro.avsi中都看得到
不過若是把這些外掛檔放在 C:\Program Files\AviSynth 2.5\plugins 的話
就不用特地寫上述的import指令



by fielia aka 橘向日葵
2012-12-14
