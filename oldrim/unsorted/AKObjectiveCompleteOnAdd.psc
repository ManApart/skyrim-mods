Scriptname AKObjectiveCompleteOnAdd extends ObjectReference  
Quest Property AKQuest Auto
Int Property objective Auto


Event OnContainerChanged(ObjectReference akNewContainer, ObjectReference akOldContainer)
If akNewContainer == game.getplayer()
	akquest.SetObjectiveCompleted(objective)
ElseIf akOldContainer == game.getplayer()
	akquest.SetObjectiveCompleted(objective, False)
	akquest.SetObjectiveDisplayed(objective)
EndIf
EndEvent


