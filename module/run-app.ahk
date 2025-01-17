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

; * 获取鼠标所在的显示器
; GetMonitorFromCoords(x, y) {
;   loop MonitorGetCount() {
;     MonitorGet(A_Index, &left, &top, &right, &bottom)
;     if (x >= left && x <= right && y >= top && y <= bottom)
;       return A_Index
;   }
;   return 1
; }

; * 运行资源管理器并居中显示在当前显示器
; !e:: {
;   ; 先打开资源管理器
;   Run("explorer.exe shell:downloads")
;   WinWaitActive("ahk_class CabinetWClass")

;   ; 获取鼠标坐标和所在显示器
;   MouseGetPos(&mouseX, &mouseY)
;   currentMonitor := GetMonitorFromCoords(mouseX, mouseY)

;   ; 获取鼠标所在显示器的尺寸信息
;   MonitorGet(currentMonitor, &monLeft, &monTop, &monRight, &monBottom)

;   ; 将窗口移动到当前显示器中心
;   WinGetPos(, , &winWidth, &winHeight, "ahk_class CabinetWClass")
;   WinMove(
;     monLeft + (monRight - monLeft - winWidth) / 2,
;     monTop + (monBottom - monTop - winHeight) / 2,
;     , , "ahk_class CabinetWClass"
;   )
; }
