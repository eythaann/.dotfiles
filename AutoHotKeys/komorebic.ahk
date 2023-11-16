#Include "%A_ScriptDir%\komorebic.lib.ahk"

; Focus windows
!h:: Focus("left")
!j:: Focus("down")
!k:: Focus("up")
!l:: Focus("right")
!+[:: CycleFocus("previous")
!+]:: CycleFocus("next")

; Move windows
!+h:: Move("left")
!+j:: Move("down")
!+k:: Move("up")
!+l:: Move("right")
!+Enter:: Promote()

; Stack windows
;!Left::Stack("left")
;!Right::Stack("right")
;!Up::Stack("up")
;!Down::Stack("down")
!;:: Unstack()
![:: CycleStack("previous")
!]:: CycleStack("next")

; Resize
!=:: ResizeAxis("horizontal", "increase")
!-:: ResizeAxis("horizontal", "decrease")
!+=:: ResizeAxis("vertical", "increase")
!+-:: ResizeAxis("vertical", "decrease")

; Manipulate windows
!f:: ToggleFloat()
;!+f::ToggleMonocle()

; Window manager options
!+r:: Retile()
!p:: TogglePause()

; Layouts
!x:: FlipLayout("horizontal")
!y:: FlipLayout("vertical")

; Workspaces
!1:: FocusNamedWorkspace("Media")
!2:: FocusNamedWorkspace("Browsers")
!3:: FocusNamedWorkspace("Editors")
!4:: FocusNamedWorkspace("Terminals")
!5:: FocusNamedWorkspace("Other")

; Move windows across workspaces
!+1:: MoveToNamedWorkspace("Media")
!+2:: MoveToNamedWorkspace("Browsers")
!+3:: MoveToNamedWorkspace("Editors")
!+4:: MoveToNamedWorkspace("Terminals")
!+5:: MoveToNamedWorkspace("Other")