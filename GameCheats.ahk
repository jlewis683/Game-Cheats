#include ../_Library/AHKLibrary/CommonAHKLibrary.ahk
#include ./GC_Common.ahk


F16::
{ ; Keplerth kitchen, cook 30 items
	loop 30
	{
		click 1100, 526
		sleep 4000
		click 1100, 526
		sleep 500
	}
}
F19::
{ ; NEO Scavenger charge laptop bettery on Last Stop tile
	NS_LaptopBattery()
}
F21::
{ ; Discord Whiteboard drawing (run F22 load pallet first)
	WB_DrawImage()
}
F22::
{ ; Whiteboard load pallet (run first)
	WB_LoadPallet()
}

^a::
{ ; Core Keeper loot large chest
	while GetKeyState("Alt", "P")
		sleep 10
	loop 3
	{
		outerIndex := A_Index
		loop 12
		{
			Send "+{click " . 472 + 88 * (A_Index - 1) . " " . 312 + 88 * (outerIndex - 1) . "}"
		}
	}
}
^+a::
{ ; Core Keeper loot first row of large chest then sort
	while GetKeyState("Shift", "P")
		sleep 10
	loop 12
	{
		Send "+{click " . 472 + 88 * (A_Index - 1) . " " . 312 . "}"
	}
	click(1537, 414)
}
!4::
{
	while GetKeyState("Alt", "P")
		sleep 10
	loop 6
	{
		Send "+{click " . 572 + (A_Index - 1) * 88 . " 720}"
	}
	Click(472, 746)
	sleep 100
	Click(602, 472)
}
!5::
{ ; Core Keeper autofishers
	while GetKeyState("Alt", "P")
		sleep 10
	click(, , "Right")
	loop
	{
		sleep 5000 ; may need to be adjusted up or down based on how soon fish are biting.
		click(, , "Right")
		sleep 1000
		click(, , "Right")
	}
}
!6::
{ ; Core Keeper summon
	while GetKeyState("Alt", "P")
		sleep 10
	minionCount := 9 ; max minion count
	lifespanPercent := 30
	loop
	{
		click(, , "Right")	
		sleep (60000 + 600 * lifespanPercent)/minionCount ; time is in miliseconds, adjust to suit stats: (summon_lifespan) / max_summons
	}
}
!7::
{ ; DW1 level
	while GetKeyState("Alt", "P")
		sleep 10
	send "{`` down}"
	loop
	{
		send "{d down}"
		sleep 500
		send "{d up}"
		sleep 50
		send "{a down}"
		sleep 500
		send "{space down}"
		sleep 500
		send "{space up}"
		sleep 50
		send "{a up}"
	}
}
!8::
{ ; core keeper mining grind
; start with backstop, place single sand block, place pick in slot 1, sand in slot 2
	while GetKeyState("Alt", "P")
		sleep 10
	
	loop
	{
		click ; mine sand
		sleep 100
		send "2" ; activate sand slot
		sleep 400
		click , , "right" ; place sand
		sleep 400
		send "1" ; activate pick slot
		sleep 100
	}
}
!9::
{ 
	while GetKeyState("Alt", "P")
		sleep 10
	mousemove 1308, 766
/*
	click , , , "down"
	sleep 600
	click , , , "up"
*/
}
`::
{ ; DosBox turbo button
    Send "{Shift down}{Alt down}{F12 down}"
    KeyWait "``"
    Send "{Shift up}{Alt up}{F12 up}"
}
F20::
{
	x := 0
	y := 0
	MouseGetPos(&x, &y)
	loop
	{
		send "e"
		sleep 200
		Click(900, 345)
		sleep 200
		Click(974, 525)
		sleep 200
		MouseMove(x, y)
		WaitForKey("LButton")
		MouseGetPos(&x, &y)
		sleep 200
		Click(979, 627)
		sleep 200
		Click(922, 317)
		Send("{f down}")
		sleep 1500
		Send("{f up}")
	}
}
