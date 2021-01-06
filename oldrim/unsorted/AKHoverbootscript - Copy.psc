Scriptname AKHoverbootscript extends ObjectReference  
int jumpkey
bool isjumping


Event OnEquipped(Actor akActor)
	if akactor == game.getplayer()
		jumpkey = input.getmappedkey("jump")
		registerforkey(jumpkey)
		debug.notification("Boots on")
	endif

endevent


Event OnUnequipped(Actor akActor)
	if akactor == game.getplayer()
		debug.notification("Turning gravity back on")
		utility.SetIniFloat("fInAirFallingCharGravityMult:Havok",1.35)
		unregisterforkey(jumpkey)
	endif
endevent

Event OnKeyDown(Int KeyCode)
if keycode == jumpkey && isjumping == 0 
	debug.notification("Jumping - slowfall")
	isjumping = 1
	Game.SetGameSettingFloat("fJumpFallVelocityMin", 7)
;	utility.SetIniFloat("fInAirFallingCharGravityMult:Havok",0)
	RegisterForSingleUpdate(3.0)
EndIf
EndEvent

Event Onupdate()
	;utility.SetIniFloat("fInAirFallingCharGravityMult:Havok",1.35)
	Game.SetGameSettingFloat("fJumpFallVelocityMin", 700)
	Unregisterforupdate()
	isjumping = 0
	debug.notification("Slow jump over. Fall fast friends!")
EndEvent
