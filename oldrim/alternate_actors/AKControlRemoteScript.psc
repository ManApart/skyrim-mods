Scriptname AKControlRemoteScript extends activemagiceffect  
;allows the player to control one of the NPCs they remember
AKcontrolquestscript property akquest Auto
AK__QF_AKControlQuest_01000D92 property akquestfrag Auto
message property akcontrolRemoteMessage auto
actor akremembered 
bool property lore Auto	;is lore friendly?
bool duration 

Event OnEffectStart(Actor akTarget, Actor akCaster) 
	int button = akcontrolRemoteMessage.show()
	if button == 0
		akremembered = akquestfrag.alias_Remote1.GetReference() as Actor
	ElseIf button == 1
		akremembered = akquestfrag.alias_Remote2.GetReference() as Actor
	ElseIf button == 2
		akremembered = akquestfrag.alias_Remote3.GetReference() as Actor
	ElseIf button == 3
		akremembered = akquestfrag.alias_Remote4.GetReference() as Actor
	ElseIf button == 4
		Return
	EndIf
	if akremembered != None
		If akremembered.GetRelationshipRank(game.getplayer()) < 3 && lore == True
			duration = True
		Else
			duration = False
		EndIf
		akquest.AKMorphComplete(akremembered, akcaster, duration)
	Else
		debug.notification("No one is in that slot!")
	EndIf
	EndEvent