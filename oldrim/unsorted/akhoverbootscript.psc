Scriptname AKHoverbootscript extends ObjectReference  


Event OnEquipped(Actor akActor)
	if akactor == game.getplayer()
		;debug.notification("Turning off gravity")
		utility.SetIniFloat("fInAirFallingCharGravityMult:Havok",0)
	endif

endevent


Event OnUnequipped(Actor akActor)
	if akactor == game.getplayer()
		;debug.notification("Turning gravity back on")
		utility.SetIniFloat("fInAirFallingCharGravityMult:Havok",1.35)
	endif
endevent
