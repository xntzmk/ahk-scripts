g_AbortSendEsc := false

#InstallKeybdHook
*Ctrl::
  g_DoNotAbortSendEsc := true
  Send {LControl Down}
  KeyWait, CapsLock
  Send {LControl Up}
  if (A_PriorKey = "LControl")
  {
    if(g_DoNotAbortSendEsc){
      Send {Esc}
    }
  }
return
