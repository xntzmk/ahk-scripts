; * 普通用户身份运行程序
Run_AsUser(program) {
  ComObject("Shell.Application")
    .Windows.FindWindowSW(0, 0, 0x08, 0, 0x01)
    .Document.Application.ShellExecute(program)
}

; * 打开或激活应用程序
OpenOrActivateApp(appPath, appClass := "") {
  target := appClass ? "ahk_class " . appClass : "ahk_exe " . appPath

  if (!WinExist(target)) {
    Run_AsUser(appPath)
    WinWait(target)
  }

  if (!WinActive(target))
    WinActivate(target)
}

; * 应用程序路径
explorer := "explorer.exe"
vscode := "D:\Microsoft VS Code\Code.exe"
chrome := "C:\Program Files\Google\Chrome\Application\chrome.exe"

; alt + e -> 文件资源管jk器
!e:: OpenOrActivateApp(explorer, "CabinetWClass")

; alt + i -> VS Code
!i:: OpenOrActivateApp(vscode)

; alt + o -> Chrome
!o:: OpenOrActivateApp(chrome)