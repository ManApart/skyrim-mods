Scriptname AKMusicTestActScript extends ObjectReference  
MiscObject Property AKOcarina Auto


Event OnActivate(ObjectReference akActionRef)
game.GetPlayer().AddItem(AKOcarina)
EndEvent