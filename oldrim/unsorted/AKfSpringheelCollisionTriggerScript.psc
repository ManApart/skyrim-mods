Scriptname AKfSpringheelCollisionTriggerScript extends ObjectReference  
objectreference property akcollision auto

Event OnTriggerEnter(ObjectReference akActionRef)
if akactionref == game.getplayer()
	akcollision.disable()
endif
endevent