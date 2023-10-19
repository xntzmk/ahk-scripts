lastMarkDownTime := 0

; tap: ? && hold: shift 
InstallKeybdHook()
*/::
{
  g_DoNotAbortSendEsc := true

  Send("{Shift Down}")
  lastMarkDownTime := A_TickCount
  KeyWait("/")
  Send("{Shift Up}")
  current_time := A_TickCount

  if (A_PriorKey = "/") {
    if (g_DoNotAbortSendEsc) {
      Send("{Shift}")
      if (current_time - lastMarkDownTime > 200) {
        ; MsgBox("A_PriorKey is: " A_PriorKey)
      } else {
        if (GetKeyState("LShift", "P")) {
          Send("{?}")
        } else {
          Send("{/}")
        }
      }
    }
  }
  return
}
