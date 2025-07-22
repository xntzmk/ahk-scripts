; * 只需主模块声明
#SingleInstance Force
SendMode("Input")
SetWorkingDir(A_ScriptDir)

; # Run as administrator
if not A_IsAdmin {
  Run("*RunAs `"" A_ScriptFullPath "`"") ; (A_AhkPath is usually optional if the script has the .ahk extension.) You would typically check first.
}

#Include "./utils/im-select.ahk"
#Include "./module/shortcuts.ahk"
#Include "./module/run-app.ahk"
#Include "./module/specialCtrl.ahk"