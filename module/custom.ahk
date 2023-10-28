initialTime := 0

; tap: ? && hold: shift
InstallKeybdHook()
*/::
{
  g_DoNotAbortSendShift := true

  Send("{Shift Down}")
  initialTime := A_TickCount
  KeyWait("/")
  Send("{Shift Up}")
  currentTime := A_TickCount

  if (A_PriorKey = "/") {
    if (g_DoNotAbortSendShift) {
      Send("{Shift}")
      if (currentTime - initialTime > 200) {
        Send("{Shift}")
        Send("{Shift Up}")
      } else {
        res := "{/}"

        if (GetKeyState("Ctrl", "P")) {
          res := "^{/}"
        }
        if (GetKeyState("Shift", "P")) {
          res := "+{/}"
        }

        Send(res)
      }
    }
  }
  return
}