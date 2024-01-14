; * -------- 被动 -------- *
~Esc:: {
  Send("{Blind}{Esc Down}{Esc Up}")
  RunImSelect()
  Send("{Blind}{Esc Down}{Esc Up}")
}

; ! 已使用原生Esc
; ctrl + [ 映射为 Esc
; ^[:: {
;   Send("{Esc}")
;   RunImSelect()
;   Send("{Esc}")
; }


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
; alt + d -> win + d 
$!d:: Send("#d")

; alt + q -> alt + f4
$!q:: Send("!{f4}")


; * -------- 移动 -------- *

; 左
^h:: Send("{Left}")        ; ctrl + h -> left
^!h:: Send("^{Left}")      ; ctrl + alt + h -> ctrl + left
^+h:: Send("+{Left}")      ; ctrl + shift + h -> shift + left
^!+h:: Send("^+{Left}")    ; ctrl  + shift + alt + h -> ctrl + shift + left

; 右
^l:: Send("{Right}")
^!l:: Send("^{Right}")
^+l:: Send("+{Right}")
^!+l:: Send("^+{Right}")

; 上
^k:: Send("{Up}")
^+k:: Send("+{Up}")

; 下
^j:: Send("{Down}")
^+j:: Send("+{Down}")

; HOME
^i:: Send("{Home}")
^+i:: Send("+{Home}")

; END
^o:: Send("{End}")
^+o:: Send("+{End}")

; * -------- chrome -------- *
#HotIf WinActive("ahk_exe chrome.exe") && WinGetProcessName("ahk_exe chrome.exe")
; ctrl + d -> 聚焦地址栏
^d:: Send("!d")

~^r:: Send("{Raw}") 
#HotIf