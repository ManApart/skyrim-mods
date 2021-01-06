Scriptname AKGrappleMarkerScript extends ObjectReference  


Event OnInit()
	;debug.notification("Grappling")
	game.getplayer().translatetoref(self, 500, 0)
	utility.wait(30)
	self.delete()
endevent

