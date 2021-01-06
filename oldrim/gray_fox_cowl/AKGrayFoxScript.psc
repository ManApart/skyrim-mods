Scriptname AKGrayFoxScript extends ObjectReference  
AKGrayFoxCowlScript Property akquest Auto
Quest Property AKGrayFoxCowlQuest Auto

Event OnEquipped(Actor akActor)
akquest.akcowlequip()

endevent

Event OnContainerChanged(ObjectReference akNewContainer, ObjectReference akOldContainer)
If aknewcontainer == game.GetPlayer() 
	AKGrayFoxCowlQuest.SetStage(100)
EndIf

EndEvent

Event OnUnequipped(Actor akActor)
akquest.akcowlunequip()
endevent
