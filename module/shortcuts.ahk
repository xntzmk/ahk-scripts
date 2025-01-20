; * -------- 被动 -------- *
~Esc:: {
  ; Send("{Esc Down}{Esc Up}")
  RunImSelect()
  Send("{Esc}")
}

; 日常
; F2
^r:: Send("{f2}")

; Alt + F4
$!q:: Send("!{f4}")

; 鼠标侧键
; XButton1:: Send("#{Tab}")
; XButton2:: Send("#{Tab}")

; 移动
!h:: Send("{Left}")
!l:: Send("{Right}")
!k:: Send("{Up}")
!j:: Send("{Down}")
!i:: Send("{Home}")
!o:: Send("{End}")


; Browser
isChrome() {
  return WinActive("ahk_exe chrome.exe")
}
isEdge() {
  return WinActive("ahk_exe msedge.exe")
}
isFirefox() {
  return WinActive("ahk_exe firefox.exe")
}

isBrowser() {
  return isChrome() || isEdge() || isFirefox()
}

#HotIf isBrowser()
~^r:: Send("{Raw}")
#HotIf