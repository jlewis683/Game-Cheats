WB_LoadPallet()
{ ; Whiteboard load pallet (run first)
	; load pallet
	MouseMove(4977, 1003) ; hover over pencil
	WaitForLoad(4991, 975, 0x18191C) ; hover until menu with pencil appears
	click(4977, 1003) ; click pencil
	WaitForLoad(4912, 930, 0x18191C) ; wait until taller color select menu is open
	loop 6
	{
		click 4637, 997 ; click color select
		WaitForLoad(4612, 667, 0x18191C) ; wait for color selection box to open

		; double click to select color text
		click 4698, 869
		sleep 200
		click 4698, 869
		
		switch(A_Index)
		{
			case 1:
				send "FF0000"
			case 2:
				send "00FF00"
			case 3:
				send "0000FF"
			case 4:
				send "00FFFF"
			case 5:
				send "FF00FF"
			case 6:
				send "FFFF00"
		}
		click 4637, 997 ; click color select
		sleep 200
	}
	MouseMove(4776, 605)
	loop(22)
	{
		send "{wheeldown}"
		sleep 100
	}
}

WB_DrawImage()
{ ; Discord Whiteboard drawing 
; run WB_LoadPallet() first
; mouse pointer in upper left of source image
; Whiteboard fullscreen on far right monitor


	dotSize := InputBox("number of pixels wide each dot is (default 2)", "dot size", , "2").Value ; number of pixels wide each dot is 
	sensitivity := 0x70 ; threshold for detecting RGB color present in source pixel

	MsgBox("Click upper left then lower right of source image")
	WaitForKey("LButton")
	MouseGetPos(&sourceX, &sourceY)
	WaitForKey("LButton")
	MouseGetPos(&endX, &endY)
	imageX := endX - sourceX ; X size of source image
	imageY := endY - sourceY ; Y size of source image
	
	MouseMove(4780, 948) ; hover and wait for brush size option
	WaitForLoad(4912, 930, 0x18191C) ; wait for color selection box to open to select brush size
	click 4680 + dotSize * 50, 948 ; select correct brush size. for dot size 2: (4780, 948) 4: (4832, 950) 5: (4895, 949)

	; zoomed out canvas coords ul: (4500, 164) lr: (5087, 989) width: 587 height: 825 midpoint: (4793, 576)
	destX := 4793 - imageX/2
	destY := 576 - imageY/2
	sourceColor :=  PixelGetColor(sourceX + dotSize/2, sourceY + dotSize/2) 
	simplifiedColor := WB_GetColorNumber(sourceColor, sensitivity) ; value 0-7 for black, red, green, blue, cyan, magenta, yellow, white
	lastColor := simplifiedColor ; record previously used color to see if new color must be selected

	loop(imageY/dotSize) ; loop through rows
	{
		;msgbox "y"
		rowNumber := A_Index
		startX := destX + dotSize/2
		startY := destY + dotSize * (rowNumber-1) + dotSize/2
		loop(imageX/dotSize) ; loop through columns
		{
			;msgbox "x"
			columnNumber := A_Index
			lastColor := simplifiedColor
			sourceColor :=  PixelGetColor(sourceX+dotSize*(columnNumber-1) + dotSize/2, sourceY+dotSize*(rowNumber-1) + dotSize/2)
			simplifiedColor := WB_GetColorNumber(sourceColor, sensitivity)
			if(simplifiedColor != lastColor || A_Index = imageX/dotSize)
			{
				WB_DrawLine(startX, startY, destX+dotSize*(columnNumber-1) + dotSize/2, startY, lastColor)
				startX := destX+dotSize*(columnNumber-1) + dotSize/2
			}
		}
	}
	
	msgbox "done"
}
WB_GetColorNumber(sourceColor, sensitivity)
{
	if((sourceColor & 0xFF0000) >> 16 > sensitivity) ; red
		sColor := "FF"
	else
		sColor := "00"
	if((sourceColor & 0x00FF00) >> 8 > sensitivity) ; green
		sColor := sColor . "FF"
	else
		sColor := sColor . "00"
	if((sourceColor & 0x0000FF) > sensitivity) ; blue
		sColor := sColor . "FF"
	else
		sColor := sColor . "00"


	switch(sColor)
	{
		case "000000":
			return 0
		case "FF0000":
			return 1
		case "00FF00":
			return 2
		case "0000FF":
			return 3
		case "00FFFF":
			return 4
		case "FF00FF":
			return 5
		case "FFFF00":
			return 6
		case "FFFFFF":
			return 7
	}
}
WB_ClickColor(colorNumber)
{
	switch(colorNumber)
	{
		case 0:
			click 4960, 996
		case 1:
			click 4917, 997
		case 2:
			click 4869, 995
		case 3:
			click 4825, 996
		case 4:
			click 4776, 997
		case 5:
			click 4728, 998
		case 6:
			click 4685, 997
	}
}
WB_DrawLine(startX, startY, destX, destY, colorNumber := 7)
{
	if(colorNumber != 7)
	{
		WB_ClickColor(colorNumber)
		MouseMove(startX, startY)
		click "left", , , , , "down"
		MouseMove(destX, destY)
		click "left", , , , , "up"
	}
}