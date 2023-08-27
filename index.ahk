/*
# 号代表 Win 键；
! 号代表 Alt 键；
^ 号代表 Ctrl 键；
+ 号代表 shift 键；
:: 号(两个英文冒号)起分隔作用；
; 号代表 注释后面一行内容；
*/

#SingleInstance, Force
SendMode Input
SetWorkingDir, %A_ScriptDir%

; %A_ScriptDir% 变量来获取当前脚本的目录
#Include %A_ScriptDir%\module\run-app.ahk
#Include %A_ScriptDir%\module\global-shortcut.ahk
#Include %A_ScriptDir%\module\vim-extend.ahk
#Include %A_ScriptDir%\module\ctrl-escape.ahk

; run-app有bug，频繁切换chrome和vscode后会失效一阵子