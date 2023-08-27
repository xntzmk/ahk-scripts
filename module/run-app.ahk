#SingleInstance, Force
SendMode Input
SetWorkingDir, %A_ScriptDir%

; 打开或激活应用程序
OpenOrActivateApplication(AppName, AppPath) {
  ; 检查应用程序是否已经打开，如果没有打开则打开它
  IfWinNotExist, ahk_exe %AppPath%
  {
    Run, %AppPath%
    WinWait, ahk_exe %AppPath%
  }

  ; 检查应用程序是否已经激活，如果没有激活则激活它并等待窗口激活
  IfWinNotActive, ahk_exe %AppPath%
  {
    WinActivate, ahk_exe %AppPath%
    WinWaitActive, ahk_exe %AppPath%
  }
}

; 打开或激活Vscode
OpenOrActivateVSCode(vscodePath) {
  ; 检查 VS Code 是否已经打开，如果没有打开则打开它
  IfWinNotExist, ahk_exe Code.exe
  {
    Run, %vscodePath%
    WinWait, ahk_exe Code.exe
  }

  ; 检查 VS Code 是否已经激活，如果没有激活则激活它
  WinGetActiveTitle, ActiveTitle
  If !InStr(ActiveTitle, "Visual Studio Code")
  {
    WinActivate, ahk_exe Code.exe
  }
}

; 设置应用程序路径的对象
vscode := "D:\Microsoft VS Code\Code.exe" 
chrome := "C:\Program Files\Google\Chrome\Application\chrome.exe"
; netease := "D:\Netease\CloudMusic\cloudmusic.exe"

; 绑定快捷键 alt+u 打开或激活 VS Code
!u::
  OpenOrActivateVSCode(vscode)
Return

; 绑定快捷键 alt+o 打开或激活 Chrome
!o::
  OpenOrActivateApplication("Chrome", chrome)
Return
