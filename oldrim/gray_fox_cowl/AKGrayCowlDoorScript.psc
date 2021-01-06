Scriptname AKGrayCowlDoorScript extends ObjectReference  
Quest Property AKGrayFoxCowlQuest Auto
ObjectReference Property akLock1 Auto
ObjectReference Property akLock2 Auto
ObjectReference Property akLock3 Auto
ObjectReference Property akLock4 Auto

Event OnActivate(ObjectReference akActionRef)
If (akLock1.GetOpenState() == 1) && (akLock2.GetOpenState() == 1) && (akLock3.GetOpenState() == 1) && (akLock4.GetOpenState() == 1) && (Self.GetLockLevel() == 255)
	
	akLock1.Disable()
	akLock2.Disable()
	akLock3.Disable()
	akLock4.Disable()
	Self.SetLockLevel(100)
	Debug.MessageBox("The locks drop away, but the door still won't budge.\n Perhaps you can pick the last lock.")
ElseIf AKGrayFoxCowlQuest.GetStage() < 10
	AKGrayFoxCowlQuest.SetStage(10)
EndIf

EndEvent
