RunImSelect() {
  imSelectPath := "D:\Microsoft VS Code Custom\im-select.exe 2052"
  if (WinActive("ahk_exe Code.exe") || WinActive("ahk_exe Obsidian.exe")) {
    ; 使用变量
    Run(imSelectPath, , "Hide")
  }
}

~Esc:: {
  RunImSelect()
  return
}

