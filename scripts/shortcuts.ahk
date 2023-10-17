moveMouseInRandomPosition(){
  Random, RandomX, 200, 700
  Random, RandomY, 200, 700
  MouseMove, %RandomX%, %RandomY%, 15
}

printRandomText(){
  Loop, 40
  {
    Random, oVar, 65, 122
    SendInput % Chr(oVar)
    Sleep, 50
  }
}

;;;;;;;;;; KeyBindings ;;;;;;;;
^!=::Volume_Up
^!-::Volume_Down

^!n::ñ

^!z::
  MouseGetPos, MouseX, MouseY
  PixelGetColor, color, %MouseX%, %MouseY%
  Clipboard := color
  Msgbox,,Color copied:,%color%
return

; Windows + \ RELOAD THE SCRIPT
#\::
  Reload
  Sleep 1000 ;
  MsgBox, 4,, The script could not be reloaded. Would you like to open it for editing?
    IfMsgBox, Yes, Edit
return

; Windows (T || Enter)
#t:: RUN wt ;
#Enter:: RUN wt ;

; ALT + \ MAGIC
^!\::
  Loop {
    if GetKeyState("Esc", "P")
      break
    moveMouseInRandomPosition()
    Send {Click}
    printRandomText()
  }
return
