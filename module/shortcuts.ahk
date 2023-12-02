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
; !d:: {
;   Send("#d")
; }

^h:: Send("{Left}")        ; ctrl + h            ->    left
^+h:: Send("+{Left}")       ; ctrl + shift + h    ->    shift + left

^l:: Send("{Right}")       ; ctrl + l            ->    right
^+l:: Send("+{Right}")      ; ctrl + shift + l    ->    shift + right

^k:: Send("{Up}")          ; ctrl + k            ->    up
^+k:: Send("+{Up}")         ; ctrl + shift + k    ->    shift + up

^j:: Send("{Down}")        ; ctrl + j            ->     down
^+j:: Send("+{Down}")       ; ctrl + shift + j    ->    shift +  down

^i:: Send("{Home}")        ; ctrl + i            ->    home
^+i:: Send("+{Home}")       ; ctrl + shift + i    ->    shift +  home

^o:: Send("{End}")         ; ctrl + o            ->    END
^+o:: Send("+{End}")         ; ctrl + shift + o            ->    shift +END



~Esc:: {
  RunImSelect()
}

; ctrl + [ 映射为 esc
^[:: {
  RunImSelect()
  Send("{Esc}")
}

; * 窗口 *
; alt + m : 最大化 <=> 还原当前窗口
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