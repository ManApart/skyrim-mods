Scriptname AKWClawsScript extends ObjectReference  

AKWReadyClawMagicScript Property ScriptRef auto


Event OnUnequipped(Actor akActor)
if scriptref.akclawmode == 1
scriptref.akunequipclaws()
endif

endevent