Scriptname akportalboxscript extends ObjectReference  

objectreference property akxmarker auto


auto STATE waitingForPlayer
	EVENT onTriggerEnter(objectReference triggerRef)
		if triggerRef == game.getPlayer() as actor
		triggerref.MoveTo(akxmarker)
		debug.notification("moved player")
		endif
				
						
	endEVENT
endSTATE

STATE hasBeenTriggered
	; this is an empty state.
endSTATE
