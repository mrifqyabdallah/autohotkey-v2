#Requires AutoHotkey v2.0
#SingleInstance Force
DetectHiddenWindows True
InstallKeybdHook

*CapsLock:: {
    KeyWait('CapsLock')  ; Wait for CapsLock to be released

    if (A_TimeSinceThisHotkey < 125)  ; If the key is pressed and released within 0.125 seconds
    and KeyWait('CapsLock', 'D T0.3')  ; If pressed again within 0.3 seconds
    and (A_PriorKey = 'CapsLock')  ; Block other keys
    {
        SetCapsLockState !GetKeyState('CapsLock', 'T')  ; Toggle CapsLock state
    } 
	else if (GetKeyState("CapsLock", "P"))  ; If CapsLock is held down
	{
		Return  ; Do nothing (don't send Escape)
	}
	else
	{
		; Send Escape if CapsLock is immediately released. 
		; If it was released after being pressed for more than 0.2 seconds, do nothing.
		if (A_TimeSinceThisHotkey > 200) {
			Return
		}
		
		Send("{Blind}{Escape}")
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
