Scriptname AKControlSaveFaceScript extends activemagiceffect  
;This script remembers the NPC's face
AKControlQuest2Script property akquest2 Auto


Event OnEffectStart(Actor akTarget, Actor akCaster)
akquest2.AKNPCFaceUpdate()
EndEvent