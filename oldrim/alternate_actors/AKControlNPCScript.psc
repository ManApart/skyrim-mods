Scriptname AKControlNPCScript extends ReferenceAlias  
AKControlMCMScript property akquestMCM auto
AKControlQuestScript property akquest auto
AKControlQuest2Script property akquest2 auto

Event OnDeath(Actor akKiller)
Debug.MessageBox("NPC has died!")
If akquestmcm.CanBeGhost == True
	akquest2.akquest.akisdead = 1	;player will spawn at body on next revert
	akquest2.AKLoadScreenON()
	If self.GetActorReference() == akquest.akcontroltempmale || self.GetActorReference() == akquest.akcontroltempFemale
		akquest2.AKDropBody(Self.GetActorReference())
	Else	;if new main character, we want the new main character to die
		;Debug.Notification("Not playing as origional main char")
		if akquest.playerref.GetActorBase().getsex() == 0	;restore the controltemp
			akquest.akcontroltemp = akquest.akcontroltempmale	
		Else
			akquest.akcontroltemp = akquest.akcontroltempFemale
		EndIf
		akquest.akcontroltemp.MoveTo(Self.GetActorReference())
		Utility.Wait(0.1)
		akquest2.AKFaceRecall(Self.GetActorReference(), akquest.akcontroltemp, 10)	;impose controltemp/player traits on new controltemp
		While akquest2.isworking == True
			Utility.Wait(0.2)
		EndWhile
		akquest.AKTraitTransfer(Self.GetActorReference(),  akquest.akcontroltemp)
		While akquest.transfering == True
			Utility.Wait(0.2)
		EndWhile
		;now that the control temp is back, let's kill the nPC char
		akquest2.AKDropBody(akquest.akcontroltemp, Self.GetActorReference())
		akquest.akquestfrag.alias_ControlTemp.Clear()
		akquest.akquestfrag.alias_ControlTemp.ForceRefTo(akquest.akcontroltemp)
	EndIf
Else
	akquestmcm.RevertOnDeath = False
	game.GetPlayer().Kill()
EndIf	
EndEvent

