#Include "%A_ScriptDir%\komorebic.lib.ahk"

#\:: {
  Retile()
  Reload
}

; Focus windows
RAlt & w:: Focus("up")
RAlt & a:: Focus("left")
RAlt & s:: Focus("down")
RAlt & d:: Focus("right")

;!+[:: CycleFocus("previous")
;!+]:: CycleFocus("next")

; Move windows
;#+Enter:: Promote()
#Left::Move("left")
#Right::Move("right")
#Up::Move("up")
#Down::Move("down")

; Stack windows
#w::Stack("up")
#a::Stack("left")
#s::Stack("down")
#d::Stack("right")
#;:: Unstack()
#+q:: CycleStack("previous")
#q:: CycleStack("next")

; Resize
#=:: ResizeAxis("horizontal", "increase")
#-:: ResizeAxis("horizontal", "decrease")
#+=:: ResizeAxis("vertical", "increase")
#+-:: ResizeAxis("vertical", "decrease")

; Manipulate windows
#f:: ToggleFloat()
;#m::ToggleMonocle()

; Layouts
;!x:: FlipLayout("horizontal")
;!y:: FlipLayout("vertical")

; Workspaces
#1:: FocusNamedWorkspace("Media")
#2:: FocusNamedWorkspace("Browsers")
#3:: FocusNamedWorkspace("Editors")
#4:: FocusNamedWorkspace("Terminals")
#5:: FocusNamedWorkspace("Other")

!1:: FocusNamedWorkspace("Media")
!2:: FocusNamedWorkspace("Browsers")
!3:: FocusNamedWorkspace("Editors")
!4:: FocusNamedWorkspace("Terminals")
!5:: FocusNamedWorkspace("Other")

; Move windows across workspaces
#+1:: MoveToNamedWorkspace("Media")
#+2:: MoveToNamedWorkspace("Browsers")
#+3:: MoveToNamedWorkspace("Editors")
#+4:: MoveToNamedWorkspace("Terminals")
#+5:: MoveToNamedWorkspace("Other")

!+1:: MoveToNamedWorkspace("Media")
!+2:: MoveToNamedWorkspace("Browsers")
!+3:: MoveToNamedWorkspace("Editors")
!+4:: MoveToNamedWorkspace("Terminals")
!+5:: MoveToNamedWorkspace("Other")