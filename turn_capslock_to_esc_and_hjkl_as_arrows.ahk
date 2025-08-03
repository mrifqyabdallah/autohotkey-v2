#Requires AutoHotkey v2.0
#SingleInstance Force
DetectHiddenWindows True
InstallKeybdHook

*CapsLock::
  {
   KeyWait('CapsLock')                                ; wait for Capslock to be released
   if (A_TimeSinceThisHotkey < 125)                   ; in 0.125 seconds
   and KeyWait('CapsLock', 'D T0.3')                  ; and pressed again within 0.3 seconds
   and (A_PriorKey = 'CapsLock')                      ; block other keys	  
	{
		SetCapsLockState !GetKeyState('CapsLock', 'T')    ; toggle CapsLock state
	} else {
	  Send("{Blind}{Escape}")                           ; send Escape if conditions are not met
	}
}

#HotIf GetKeyState("CapsLock", "P")
*h::Send("{Blind}{Left}")
*j::Send("{Blind}{Down}")
*k::Send("{Blind}{Up}")
*l::Send("{Blind}{Right}")
*w::Send("{Blind}{PgUp}")
*s::Send("{Blind}{PgDn}")
#HotIf
