#Requires AutoHotkey v2.0

; ctrl 单独按下时，发送Esc
; ctrl 组合键按下时，发送组合键
; ctrl 长按时，发送 ctrl

; 全局变量
global isSingleCtrl := true
global ctrlDown := false
global keyMonitor := ""
global ctrlPressTime := 0
global longPressThreshold := 200 ; 长按阈值（毫秒）

; 左Ctrl按下处理
~LControl::
{
  global isSingleCtrl := true
  global ctrlDown := true
  global ctrlPressTime := A_TickCount ; 记录按下时间

  ; 创建按键监控器
  keyMonitor := InputHook("V L0 T" . longPressThreshold / 1000)
  keyMonitor.KeyOpt("{All}", "N") ; 监控所有按键
  keyMonitor.OnKeyDown := CheckKeyCombo
  keyMonitor.OnEnd := CheckLongPress ; 添加超时回调
  keyMonitor.Start()
}

; 按键组合检测回调
CheckKeyCombo(IH, VK, SC)
{
  global isSingleCtrl ; 声明使用全局变量

  keyName := GetKeyName(Format("vk{:x}sc{:x}", VK, SC))
  if (keyName != "LControl") ; 排除Ctrl自身
  {
    isSingleCtrl := false
  }
}

; 输入钩子超时回调（长按检测）
CheckLongPress(IH)
{
  global isSingleCtrl ; 声明使用全局变量

  ; 如果超时且没有其他按键，标记为长按
  if (isSingleCtrl)
  {
    isSingleCtrl := false ; 标记为组合键模式（长按）
  }
}

; 左Ctrl释放处理
~LControl Up::
{
  global ctrlDown := false
  global isSingleCtrl
  global keyMonitor
  global ctrlPressTime
  global longPressThreshold

  ; 停止监控器
  if (IsObject(keyMonitor))
  {
    keyMonitor.Stop()
    keyMonitor := ""
  }

  ; 计算按键持续时间
  holdDuration := A_TickCount - ctrlPressTime

  ; 如果是单独按下且持续时间小于阈值，则发送Esc
  if (isSingleCtrl && holdDuration < longPressThreshold)
  {
    Send "{Esc}"
  }
  ; 否则（组合键或长按），发送Ctrl释放事件
  else
  {
    ; 无需额外操作，系统已处理
  }

  ; 重置状态
  isSingleCtrl := true
  ctrlDown := false
}