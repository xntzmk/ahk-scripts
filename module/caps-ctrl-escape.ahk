
g_AbortSendEsc := false
g_LastCtrlKeyDownTime := 0

InstallKeybdHook()
*CapsLock::
{
  g_DoNotAbortSendEsc := true

  Send("{LControl Down}")
  g_LastCtrlKeyDownTime := A_TickCount
  KeyWait("CapsLock")
  Send("{LControl Up}")
  current_time := A_TickCount

  if (A_PriorKey = "CapsLock")
  {

    ; MsgBox(current_time - g_LastCtrlKeyDownTime, 333)
    if (g_DoNotAbortSendEsc) {
      if (current_time - g_LastCtrlKeyDownTime > 200) {

        Send("{LControl}")
      } else {
        Send("{Esc}")
      }
    }
  }
}
return


