; * 普通用户身份运行程序
; RunAsUser(program) {
;   ComObject("Shell.Application")
;     .Windows.FindWindowSW(0, 0, 0x08, 0, 0x01)
;     .Document.Application.ShellExecute(program)
; }

; * 应用程序路径
; appPaths := {
;   explorer: "explorer.exe",
;   vscode: "D:\Microsoft VS Code\Code.exe",
;   chrome: "D:\CentBrowser\Application\chrome.exe"
;   ; chrome: "C:\Program Files\Google\Chrome\Application\chrome.exe"
; }

; * 打开或激活应用程序
; OpenOrActivateApp(appPath) {
;   target := "ahk_exe " . appPath

;   if (!WinExist(target)) {
;     RunAsUser(appPath)
;     WinWait(target)
;   }

;   if (!WinActive(target)) {
;     if (target == appPaths.vscode) {
;       RunImSelect()
;     }
;     WinActivate(target)
;   }
; }

; alt + i -> VS Code
; !i:: OpenOrActivateApp(appPaths.vscode)

; alt + o -> Chrome
; !o:: OpenOrActivateApp(appPaths.chrome)