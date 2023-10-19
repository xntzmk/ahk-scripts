#Include "../utils/im-select.ahk"

g_AbortSendEsc := false
g_LastCtrlKeyDownTime := 0

InstallKeybdHook()
*Ctrl::
{
  g_DoNotAbortSendEsc := true

  Send("{LControl Down}")
  g_LastCtrlKeyDownTime := A_TickCount
  KeyWait("Ctrl")
  Send("{LControl Up}")
  current_time := A_TickCount

  if (A_PriorKey = "LControl") {
    if (g_DoNotAbortSendEsc) {
      if (current_time - g_LastCtrlKeyDownTime > 200) {
        ; MsgBox("A_PriorKey is: " A_PriorKey)
        Send("{LControl}")
      } else {
        RunImSelect()
        Send("{Esc}")
      }
    }
  }

  return
}

~Esc:: {
  RunImSelect()
  return
}