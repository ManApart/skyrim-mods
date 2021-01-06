Scriptname AKDGateRaiseScript extends ObjectReference  
AKDwemerInstituteQuestScript Property akquest Auto
formlist Property AKDGateList Auto
sound Property akOBJDwemerRepositoryRotate Auto
Float zpos
ObjectReference tempref
Bool akPause

Event OnActivate(ObjectReference akActionRef)
Int i = 0
Int size = akdgatelist.GetSize()
If akquest.akgateup == False
	akquest.akgateup = True
	;Debug.Notification("Moving up")
	zpos = 400
Else
	akquest.akgateup = False
	;Debug.Notification("Moving down")
	zpos = -400
EndIf
akOBJDwemerRepositoryRotate.play(self)
While i < size
	tempref = akdgatelist.GetAt(i) as ObjectReference
	If tempref.GetOpenState() == 1 || tempref.GetOpenState() == 2 
		tempref.Activate(tempref, True)
	EndIf
	tempref.TranslateTo(tempref.GetPositionX(), tempref.GetPositionY(), (tempref.GetPositionZ() + zpos), tempref.GetAngleX(), tempref.GetAngleY(), tempref.GetAnglez(), 200)
	i += 1
	If akpause == True
		akpause = False
		Utility.Wait(0.2)
	Else
		akpause = True
	EndIf
EndWhile

EndEvent

