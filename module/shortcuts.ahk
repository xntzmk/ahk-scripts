; * -------- 被动 -------- *
~Esc:: {
  ; Send("{Blind}{Esc Down}{Esc Up}")
  RunImSelect()
  ; Send("{Blind}{Esc Down}{Esc Up}")
}

; * ctrl + [ 映射为 Esc
^[:: {
  Send("{Esc}")
  RunImSelect()
  Send("{Esc}")
}

; * -------- 日常 -------- *

; # ctrl 映射
; ctrl + r -> f2
^r:: Send("{f2}")

; ctrl + m -> 最大化、还原窗口
^m:: {
  S := WinGetMinMax("A")
  if (S = 0)
    WinMaximize("A")
  else if (S = 1)
    WinRestore("A")
  else if (S = -1)
    WinRestore("A")
}


; # alt 映射
; alt + u -> win + x
$!u:: Send("#x")

; alt + d -> win + d
$!d:: Send("#d")

; alt + q -> alt + f4
$!q:: Send("!{f4}")

; alt + l -> windos锁定
$!l:: DllCall('LockWorkStation')


; * 鼠标侧键 => win + tab
; XButton1:: Send("#{Tab}")
; XButton2:: Send("#{Tab}")

; * -------- 移动 -------- *

; 左
^h:: Send("{Left}")        ; ctrl + h -> left
^b:: Send("^{Left}")       ; ctrl + e -> ctrl + left

; 右
^l:: Send("{Right}")
^e:: Send("^{Right}")

; 上
^k:: Send("{Up}")

; 下
^j:: Send("{Down}")

; HOME
^i:: Send("{Home}")
^+i:: Send("+{Home}")

; END
^+o:: Send("+{End}")
^o:: Send("{End}")

; * -------- chrome -------- *
#HotIf WinActive("ahk_exe chrome.exe") && WinGetProcessName("ahk_exe chrome.exe")
; ctrl + p -> 聚焦地址栏
^p:: Send("!d")

~^r:: Send("{Raw}")
#HotIf

; * -------- vscode -------- *
#HotIf WinActive("ahk_exe code.exe") && WinGetProcessName("ahk_exe code.exe")
~^i:: Send("{Raw}")
~^o:: Send("{Raw}")
#HotIf