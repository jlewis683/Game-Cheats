NS_LaptopBattery()
{ 
; NEO Scavenger fill laptop battery (on Last Stop tile)

	; extract charges from generator
	while GetKeyState("Alt", "P")
		sleep 10
	loop 10
	{
		loop 4
		{
			click 206, 106, "right"
			sleep 500
			MouseMove 249, 157
			sleep 500
			click 
		}
		click 206, 106, "right"
		sleep 500
		MouseMove 251, 200
		sleep 500
		click
	}
	; insert charges into battery
	click 685, 90
	sleep 1000
	
	click 450, 90
	sleep 500
	mousemove 400, 100
	sleep 500
	click
	sleep 500
	click 475, 90
	sleep 500
	mousemove 400, 100
	sleep 500
	click
	sleep 500
	click 500, 90
	sleep 500
	mousemove 400, 100
	sleep 500
	click
	sleep 500
	click 525, 90
	sleep 500
	mousemove 400, 100
	sleep 500
	click
	sleep 500
	click 550, 90
	sleep 500
	mousemove 400, 100
	sleep 500
	click
	sleep 500
	click 575, 90
	sleep 500
	mousemove 400, 100
	sleep 500
	click
	sleep 500
	click 600, 90
	sleep 500
	mousemove 400, 100
	sleep 500
	click
	sleep 500
	click 625, 90
	sleep 500
	mousemove 400, 100
	sleep 500
	click
	sleep 500
	click 650, 90
	sleep 500
	mousemove 400, 100
	sleep 500
	click
	sleep 500
	click 450, 115
	sleep 500
	mousemove 400, 100
	sleep 500
	click
	sleep 500
	click 475, 115
	sleep 500
	mousemove 400, 100
	sleep 500
	click
	sleep 500
	click 500, 115
	sleep 500
	mousemove 400, 100
	sleep 500
	click
}