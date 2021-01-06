Scriptname AKControlMorph extends ActiveMagicEffect  
;This script allows the player to morph into the target
AKControlQuestScript property akquest Auto
AK__QF_AKControlQuest_01000D92 Property akcontrolquest Auto
bool property duration Auto

Event OnEffectStart(Actor akTarget, Actor akCaster)
If aktarget == akcontrolquest.Alias_ControlTemp.GetReference() as Actor
	akquest.akrevert(akcaster)
Else
	akquest.AKMorphComplete(aktarget, akcaster, duration)
EndIf
EndEvent
