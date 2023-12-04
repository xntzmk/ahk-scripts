; * 针对搜狗输入法
RunImSelect() {
  imSelectPath := "D:\Microsoft VS Code Custom\im-select.exe 2052"

  if (WinActive("ahk_exe Code.exe") || WinActive("ahk_exe Obsidian.exe")) 
    Run(imSelectPath, , "Hide")
}
