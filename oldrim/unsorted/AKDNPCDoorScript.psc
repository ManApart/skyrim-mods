Scriptname AKDNPCDoorScript Extends ObjectReference

Event OnActivate(ObjectReference akActionRef)
if akactionref != game.GetPlayer()
	Debug.Notification("To proceed, you must control your main character!")
Else
	Activate(game.getplayer())
EndIf
EndEvent
