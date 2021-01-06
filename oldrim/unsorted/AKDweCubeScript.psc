Scriptname AKDweCubeScript extends ObjectReference  
Float Property akamount = 100.0 Auto

Event OnActivate(ObjectReference akActionRef)
;where is everyone?
Float boxX = GetPositionX()
Float boxY = GetPositiony()
Float boxz = GetPositionz()
Float refx = akactionref.GetPositionX()
Float refY = akactionref.GetPositionY()


;which side is the person on?
If math.abs(boxx - refx) >= math.abs(boxy - refy)
	If boxx >= refx 	
		;Debug.Notification("player on the left side")
		boxx += akamount
	Else				
		;Debug.Notification("player on right side")
		boxx -= akamount
	EndIf
Else
	If boxy >= refy 	
		;Debug.Notification("player behind")
		boxy += akamount
	Else				
		;Debug.Notification("player in front")
		boxy -= akamount
	EndIf
EndIf
TranslateTo(boxx, boxy, boxz, 0, 0, 0, 100)
EndEvent

; Event OnTranslationComplete()
; self.ApplyHavokImpulse(0.0, 1.0, 0.0, 10000.0)
; EndEvent
