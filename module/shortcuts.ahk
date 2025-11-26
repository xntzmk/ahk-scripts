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

BrowserExes := ["chrome.exe", "msedge.exe", "firefox.exe", "catsxp.exe"]
isBrowser(exeName := "") {
  for _, exe in BrowserExes {
    if (WinActive("ahk_exe " . exe))
      return true
  }
  return false
}

#HotIf isBrowser()
~^r:: Send("{Raw}")
#HotIf

isCoding() {
  return WinActive("ahk_exe code.exe") || WinActive("ahk_exe cursor.exe")
}

#HotIf isCoding()
~Esc:: {
  RunImSelect()
}
#HotIf