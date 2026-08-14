#include ./GC_Whiteboard.ahk
#include ./GC_NEOScavenger.ahk

SetWinDelay -1 ; ovverrides 100ms delay between events sending (better timing)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; Macros ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; fine cursor movement
!+w::
{ ; move 1 pixel up
	xPos := 0
	yPos := 0
	MouseGetPos(&xPos, &yPos)
	MouseMove(xPos, yPos - 1)
}
!+a::
{ ; move 1 pixel left
	xPos := 0
	yPos := 0
	MouseGetPos(&xPos, &yPos)
	MouseMove(xPos - 1, yPos)
}
!+s::
{ ; move 1 pixel down
	xPos := 0
	yPos := 0
	MouseGetPos(&xPos, &yPos)
	MouseMove(xPos, yPos + 1)
}
!+d::
{ ; move 1 pixel right
	xPos := 0
	yPos := 0
	MouseGetPos(&xPos, &yPos)
	MouseMove(xPos + 1, yPos)
}
; Macros for reading screen data to use in development
; alt: color
; ctrl: coordinates
; shift: function
!1::
{ ; copy color
	MouseGetPos(&posX, &posY)
	A_Clipboard := PixelGetColor(posX, posY)
}
^1::
{ ; copy coordinates
	MouseGetPos(&posX, &posY)
	A_Clipboard := posX . ", " . posY
}
^!1::
{ ; copy coordinates and color
	MouseGetPos(&posX, &posY)
	A_Clipboard := posX . ", " . posY . ", " . PixelGetColor(posX, posY)
}
!+1::
{ ; PixelGetColor()
	MouseGetPos(&posX, &posY)
	A_Clipboard := "PixelGetColor(" . posX . ", " . posY . ")"
}
^+1::
{ ; Click()
	MouseGetPos(&posX, &posY)
	A_Clipboard := "Click(" . posX . ", " . posY . ")"
}
^!+1::
{ ; WaitForLoad()
	MouseGetPos(&posX, &posY)
	A_Clipboard := "WaitForLoad(" . posX . ", " . posY . ", " . PixelGetColor(posX, posY) . ")"
}