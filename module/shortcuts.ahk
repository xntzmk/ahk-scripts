; F2
^r:: Send("{f2}")

; Alt + F4
$!q:: Send("!{f4}")

; 鼠标侧键
; XButton1:: Send("#{Tab}")
; XButton2:: Send("#{Tab}")

; 浏览器
isChrome() {
  return WinActive("ahk_exe chrome.exe")
}
isEdge() {
  return WinActive("ahk_exe msedge.exe")
}
isFirefox() {
  return WinActive("ahk_exe firefox.exe")
}
isCatsxp() {
  return WinActive("ahk_exe catsxp.exe") ; 猫眼浏览器
}

isBrowser() {
  return isChrome() || isEdge() || isFirefox() || isCatsxp()
}

#HotIf isBrowser()
~^r:: Send("{Raw}")
#HotIf

; 编程
isCoding() {
  return WinActive("ahk_exe code.exe") || WinActive("ahk_exe cursor.exe")
}

#HotIf isCoding()
~Esc:: {
  RunImSelect()
}
#HotIf