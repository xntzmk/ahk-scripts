#SingleInstance Force
SendMode("Input")
SetWorkingDir(A_ScriptDir)

; 打开或激活应用程序
OpenOrActivateApplication(AppName, AppPath) {
  if !WinExist("ahk_exe " AppPath)
  {
    Run(AppPath)
    WinWait("ahk_exe " AppPath)
  }

  if !WinActive("ahk_exe " AppPath)
  {
    WinActivate("ahk_exe " AppPath)
    WinWaitActive("ahk_exe " AppPath)
  }
}

; 打开或激活Vscode
OpenOrActivateVSCode(vscodePath) {
  if !WinExist("ahk_exe Code.exe")
  {
    Run(vscodePath)
    WinWait("ahk_exe Code.exe")
  }

  ActiveTitle := WinGetTitle("A")
  If !InStr(ActiveTitle, "Visual Studio Code")
  {
    WinActivate("ahk_exe Code.exe")
  }
}

; 设置应用程序路径的对象
vscode := "D:\Microsoft VS Code\Code.exe"
chrome := "C:\Program Files\Google\Chrome\Application\chrome.exe"
; netease := "D:\Netease\CloudMusic\cloudmusic.exe"

; 绑定快捷键 alt+u 打开或激活 VS Code
!u::
{
  OpenOrActivateVSCode(vscode)
  Return

  ; 绑定快捷键 alt+o 打开或激活 Chrome
}

!o::
{
  OpenOrActivateApplication("Chrome", chrome)
  Return
}