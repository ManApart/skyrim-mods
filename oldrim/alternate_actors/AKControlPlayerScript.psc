Scriptname AKControlPlayerScript extends ReferenceAlias  
AKControlQuestScript property akquest Auto
AKControlQuest2Script property akquest2 Auto
AKControlMCMScript property akquestmcm Auto
Actor Property playerref Auto
Event OnPlayerLoadGame()
	;Alternate Actors Maintenance
	akQuest2.akMaintenance()
	
	;MCM Maintenance
	(GetOwningQuest() as SKI_QuestBase).OnGameReload()
EndEvent


 Event OnEnterBleedout()
 ;debug.MessageBox("He's feeling better!") ;who, when he was about to recover, felt the icey grip of death upon 'im
	if akquest.MainChar == False && akquestmcm.RevertOnDeath == True
		playerref.ModActorValue("Health", 20)
		 akquest.akrevert(playerref)
		 While akquest.inprogress == True
			Utility.Wait(0.2)
		EndWhile
		 akquest.origionalnpc.kill()
	ElseIf akquestmcm.CanBeGhost == True
		Game.DisablePlayerControls()
		
		akquest.akcstopcombatspell.Cast(playerref)	;need to straight up stop combat
		playerref.SetGhost(True)
		If akquest.akcontroltemp == None	;if player didn't initialize
			if playerref.GetActorBase().getsex() == 0
				akquest.akcontroltemp = akquest.akcontroltempmale	
			Else
				akquest.akcontroltemp = akquest.akcontroltempFemale
			EndIf
			akquest.akquestfrag.alias_ControlTemp.ForceRefTo(akquest.akcontroltemp) 	;fill the control temp ref
			;Debug.MessageBox("Ref filled!")
			akquest.akcontroltemp.MoveTo(playerref)
			akquest2.AKFaceStore(playerref, akquest.akcontroltemp, 10)	;save player traits
			While akquest2.isworking == True
				Utility.Wait(0.1)
			EndWhile
			;Debug.MessageBox("face stored")
			colorform tempcolor = akquest2.AKNPCColorList[10]
			if tempcolor.getred() == 0 && tempcolor.getblue() == 0 && tempcolor.getgreen() == 0
				akquest2.AKNPCColorList[10] = akquest.akdefaultcolor(akquest2.AKNPCRaceList[21], akquest2.AKNPCNameList[21])
				;debug.Notification("Actor has default hair")
			EndIf
			akquest2.AKFaceRecall(playerref, akquest.akcontroltemp, 10)	;impose player traits on puppet
			While akquest2.isworking == True
				Utility.Wait(0.1)
			EndWhile
		EndIf
		;Debug.MessageBox("Initialized!")
		playerref.ModActorValue("Health", 200)
		akquest.akisdead = 2	;player is spawning at body, so doesn't need to spawn there again
		akquest2.AKDropBody(playerref)
		While akquest2.isdropping == True
			Utility.Wait(0.1)
		EndWhile
		playerref.addspell(akquest.AKCAbGhostAbilitiesSpell, False)		
		If akquestmcm.LoreFriendly == False
			playerref.AddSpell(akquest.akcontrolmorphspell, false)
		Else
			playerref.AddSpell(akquest.AKControlMorphAlliesSpell, false)
		EndIf	
		akquest.akquestfrag.alias_Ghost.ForceRefTo(playerref)
		playerref.EquipItem(akquest.ClothesPrisonerTunic, false, true)
		Game.EnablePlayerControls()
		;Debug.MessageBox("done!")
	Else
		playerref.GetActorBase().SetEssential(False)
		playerref.Kill()
	EndIf
 EndEvent
