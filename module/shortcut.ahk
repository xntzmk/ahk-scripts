#SingleInstance Force
SendMode("Input")
SetWorkingDir(A_ScriptDir)

; * 快捷键 *
; alt + q 映射为 alt + F4
!q:: {
  Send("!{f4}")
  Return
}

; alt + d 映射为 win + d
!d:: {
  Send("#d")
}

; alt + e 映射为 win + e
!e:: {
  Send("#e")
}

; ctrl + [ 映射为 esc
^[:: {
  Send("{Esc}")
}

; * 窗口 *
; win + m, alt + m : 最大化 <=> 还原当前窗口
#m::
!m:: {
  S := WinGetMinMax("A")
  if (S = 0)
    WinMaximize("A")
  else if (S = 1)
    WinRestore("A")
  else if (S = -1)
    WinRestore("A")
  return
}

; alt + n 映射为 最小化当前窗口
!n:: {
  WinMinimize("A")
  Return
}