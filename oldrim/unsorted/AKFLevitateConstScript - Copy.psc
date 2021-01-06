Scriptname AKFLevitateConstScript extends activemagiceffect  
import math

objectreference property akmarker auto
objectreference property akbox auto
objectreference property player auto
float bearing ;Taken the idea from the flying ring mod. Thanks PorroOne! http://skyrim.nexusmods.com/mods/15775
float altitude
float rotx
float roty
float lift ;lift stops the stutter on an uphill climb. Try some Lift today!


Event OnEffectStart(Actor akTarget, Actor akCaster)
	;debug.notification("Turning off gravity")
	player = game.getplayer()
	RegisterForSingleUpdate(0.5)
endevent


Event OnEffectFinish(Actor akTarget, Actor akCaster)
	;debug.notification("Turning gravity back on")
	UnregisterForUpdate()
	;akbox.moveto(akmarker)
endevent

;On update Angle method (use trig to make a smooth walking slope)
Event OnUpdate()
	;debug.notification("Flying!")
	;debug.notification("looking x:" + player.getanglex() + "z:" + player.getanglez() )

	bearing = player.getanglez()
	altitude = player.getanglex()

	if altitude < 40 && altitude > -35
	
		if altitude < 0
			lift = (altitude - 40)
		else
			lift = -40
		endif

		rotx = cos(bearing) *  altitude
		roty = -1*( sin(bearing) * altitude)

		akbox.setangle(rotx, roty,0)
		akbox.moveto(player, 0 , 0 , lift, 0)	
	elseif altitude > 40
		altitude = 40
	elseif altitude < -35
		altitude = -35
;	Else
;		player.moveto(player, 0, 0, 50)
;		akbox.moveto(player, 0 , 0 , -20, 0)
	endif
	RegisterForSingleUpdate(1.0)
endevent







 
