Scriptname AKOcarinaScript extends ObjectReference  
AKOcarinaQuestScript Property akquest Auto


Event OnEquipped(Actor akActor)
If akactor == game.GetPlayer()
	akquest.AKStartPlay()
EndIf
EndEvent

