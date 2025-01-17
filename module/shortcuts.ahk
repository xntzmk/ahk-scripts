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

; Chrome
#HotIf WinActive("ahk_exe chrome.exe") && WinGetProcessName("ahk_exe chrome.exe")
~^r:: Send("{Raw}")
#HotIf

; VSCode / Cursor
isCodeExe() {
  return WinActive("ahk_exe code.exe") || WinActive("ahk_exe cursor.exe")
}

#HotIf isCodeExe()
^space:: Send("^{p}%")
#HotIf