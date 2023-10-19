^!=::Volume_Up
^!-::Volume_Down

^!n::ñ

#t:: RUN "wt"
#Enter:: RUN "wt"

#\:: {
  RunWait("komorebic.exe reload-configuration", , "Hide")
  Reload
}

;!1::Send "^#{Left}"
;!2::Send "^#{Right}"