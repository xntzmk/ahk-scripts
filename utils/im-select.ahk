; * 针对搜狗输入法
RunImSelect() {
  if (getLanguage() !== '0') {
    setLanguage('0')
  }
}
; 获取命令行参数的数量
; ArgCount := A_Args.Count

; if (ArgCount > 1) {
;   MsgBox("命令行参数最多一个, 1为中文, 0为英文, 2为直接切换")
;   ExitApp(1)
; }

; 模拟Im-select

; current_IME := IME_GET()
; 由于vscode的vim插件好像会执行一次不带参数的情况, 总是弹出消息框, 所以注释掉
; 打印当前输入法状态
; if (ArgCount == 0){
;     MsgBox 命令行参数最多一个, 1为中文, 0为英文, 2为直接切换. 当前输入法状态为: %current_IME%
;     ExitApp, 0
; }

; 命令行参数的第一个参数下标为1
; expect_IME := A_Args[1]

; if (expect_IME != current_IME) {
;   if (expect_IME == 2) {
;     if (current_IME == 1) {
;       expect_IME := "0"
;     } else {
;       expect_IME := "1"
;     }
;   }
;   ; 也可以简单模拟按下shift切换输入法状态
;   ; Send {Shift}
;   IME_SET(expect_IME)
; }

; 获取输入法的中英文状态
;-----------------------------------------------------------
; IMEの状態の取得
;    対象： AHK v1.0.34以降
;   WinTitle : 対象Window (省略時:アクティブウィンドウ)
;   戻り値  1:ON 0:OFF
;-----------------------------------------------------------
getLanguage(WinTitle := "") {
  if (WinTitle = "")
    WinTitle := "A"
  hWnd := WinGetID(WinTitle)
  DefaultIMEWnd := DllCall("imm32\ImmGetDefaultIMEWnd", "Uint", hWnd, "Uint")

  ;Message : WM_IME_CONTROL  wParam:IMC_GETOPENSTATUS
  DetectSave := A_DetectHiddenWindows
  DetectHiddenWindows(true)
  ErrorLevel := SendMessage(0x283, 0x005, 0, , "ahk_id " DefaultIMEWnd)
  DetectHiddenWindows(DetectSave)
  Return ErrorLevel
}

; 设置输入法的中英文状态
;-----------------------------------------------------------
; IMEの状態をセット
;    対象： AHK v1.0.34以降
;   SetSts  : 1:ON 0:OFF
;   WinTitle: 対象Window (省略時:アクティブウィンドウ)
;   戻り値  1:ON 0:OFF
;-----------------------------------------------------------
setLanguage(setSts, WinTitle := "") {
  if (WinTitle = "")
    WinTitle := "A"
  hWnd := WinGetID(WinTitle)
  DefaultIMEWnd := DllCall("imm32\ImmGetDefaultIMEWnd", "Uint", hWnd, "Uint")
  ;Message : WM_IME_CONTROL  wParam:IMC_SETOPENSTATUS
  DetectSave := A_DetectHiddenWindows
  DetectHiddenWindows(true)
  ErrorLevel := SendMessage(0x283, 0x006, setSts, , "ahk_id " DefaultIMEWnd)
  DetectHiddenWindows(DetectSave)
  Return ErrorLevel
}

; 可以设置按键来调试, 如下, 按下a键, 弹出MsgBox消息框, 且在鼠标位置显示文本(ToolTip)
; F12:: {
;   xxx := getLanguage()
;   MsgBox("输入法状态 1中文 0英文: " xxx)
; }
