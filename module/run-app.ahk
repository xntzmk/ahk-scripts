#SingleInstance Force
SendMode("Input")
SetWorkingDir(A_ScriptDir)

; * 普通用户身份运行程序
Run_AsUser(program) {
  ComObject("Shell.Application")
    .Windows.FindWindowSW(0, 0, 0x08, 0, 0x01)
    .Document.Application.ShellExecute(program)
}

; * 打开或激活应用程序
OpenOrActivateApp(appPath) {
  if (!WinExist("ahk_exe " appPath)) {
    Run_AsUser(appPath)
    return
  }

  if (!WinActive("ahk_exe " appPath)) {
    WinActivate("ahk_exe " appPath)
  }
}

; 应用程序路径
vscode := "D:\Microsoft VS Code\Code.exe"
chrome := "C:\Program Files\Google\Chrome\Application\chrome.exe"

; alt+i -> VS Code
!i:: OpenOrActivateApp(vscode)
Esc & 8:: OpenOrActivateApp(vscode)

; alt+o -> Chrome
!o:: OpenOrActivateApp(chrome)
Esc & 9:: OpenOrActivateApp(chrome)