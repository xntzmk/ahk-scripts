#SingleInstance Force
SetWorkingDir(A_ScriptDir)

; # Run as administrator
if not A_IsAdmin {
	Run("*RunAs `"" A_ScriptFullPath "`"") ; (A_AhkPath is usually optional if the script has the .ahk extension.) You would typically check first.
}

; * For Vim
#Include "./utils/im-select.ahk"

; * Daily 
#Include "./module/shortcuts.ahk"
#Include "./module/run-app.ahk"

