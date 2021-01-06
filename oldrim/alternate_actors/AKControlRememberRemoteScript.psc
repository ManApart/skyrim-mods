Scriptname AKControlRememberRemoteScript extends activemagiceffect  
;set's the target to the quest alias; remembering them so the player can use them later.
AK__QF_AKControlQuest_01000D92 property akquestfrag Auto
message property akcontrolSaveRemoteMessage auto

Event OnEffectStart(Actor akTarget, Actor akCaster) 
	int button = akcontrolSaveRemoteMessage.show()
	if button == 0
		akquestfrag.alias_Remote1.clear()
		akquestfrag.alias_Remote1.forcerefto(aktarget)
		;debug.Notification("Remembered " + akquestfrag.alias_Remote1.GetReference().getname())
	ElseIf button == 1
		akquestfrag.alias_Remote2.clear()
		akquestfrag.alias_Remote2.forcerefto(aktarget)
	ElseIf button == 2
		akquestfrag.alias_Remote3.clear()
		akquestfrag.alias_Remote3.forcerefto(aktarget)
	ElseIf button == 3
		akquestfrag.alias_Remote4.clear()
		akquestfrag.alias_Remote4.forcerefto(aktarget)
	ElseIf button == 4
		Return
	EndIf
	EndEvent
