; * 普通用户身份运行程序
; RunAsUser(program) {
;   ComObject("Shell.Application")
;     .Windows.FindWindowSW(0, 0, 0x08, 0, 0x01)
;     .Document.Application.ShellExecute(program)
; }

; appPaths := {
;   vscode: "D:\Microsoft VS Code\Code.exe",
;   chrome: "D:\CentBrowser\Application\chrome.exe",
;   chrome: "C:\Program Files\Google\Chrome\Application\chrome.exe"
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

; !i:: OpenOrActivateApp(appPaths.vscode)
; !o:: OpenOrActivateApp(appPaths.chrome)

; * 运行资源管理器
!e:: {
  Run("explorer.exe shell:downloads")
  WinWaitActive("ahk_class CabinetWClass")
  WinActivate("ahk_class CabinetWClass")
}