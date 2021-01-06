Scriptname AKControlMCMScript extends SKI_ConfigBase 
;This script powers Alternate Actors' MCM Menu
AKControlQuestScript property akquest auto
AKControlQuest2Script property akquest2 auto
Message Property akcdeleteface Auto
Actor Property Playerref Auto

;MCM Property Variables
bool Property RevertOnDeath = True Auto 		;Revert to player on death (false = death for player on death)
bool Property dragonbornfollower = True Auto 	;Does the dragonborn appear after the transfer?
bool Property FollowCreature = True Auto 		;When controling an animal, appear where you revert?
bool Property CanBeGhost = False Auto 			;Can the player be a ghost, or do they just die?
Bool Property lorefriendly = False Auto			;Hide the origional spells - the player must find spelltomes for weaker spells
Bool Property DebugMode = False Auto			;Hide the loading screen
Bool Property permatat = False Auto				;Do tatoos and face markings travel with you?
string[] Property FaceOptions Auto
string[] Property RevertOptions Auto

;for Canbeghost and revertondeath to be true, dragonborn follower must be true

;MCM Spell Properties
Spell Property AKControlMorphSpell Auto
Spell Property AKControlRemoteSpell Auto
Spell Property AKControlSimpleSpell Auto


;MCM Variables
Int Menudex


event OnConfigInit()
	Pages = new string[2]
	Pages[0] = "Options"
	Pages[1] = "Faces"
	FaceOptions = new string[2]
	FaceOptions[0] = "Do NOT forget this face"
	FaceOptions[1] = "Forget this face"

	revertoptions = new string[2]
	revertoptions[0] = "Do NOT revert to origional character"
	revertoptions[1] = "Revert to origional character"

	
endEvent

;-----------------------------------------------------Page Reset functions
event OnPageReset(string page)
; Load custom .swf for animated logo that's displayed when no page is selected yet.
	if (page == "")
		LoadCustomContent("AKAlternateActorsTitle.dds", 3, 105)
		return
	else
		UnloadCustomContent()
	endIf
	SetCursorPosition(0) ; Can be removed because it starts at 0 anyway
	if (page == "Options")
		SetCursorFillMode(left_TO_right)
		addtextoptionst("Modversion", " Version", akquest.akmodversion)
		addtextoptionst("Reminder", "Some options unavailable while NPC", "")
		addemptyoption()
		If (akquest.MorphedSimple == True || akquest.MainChar == False) && lorefriendly == True
			addtextoptionst("TimeLeft", "Time left before magicka drains:", (akquest.akdurationtime - (Utility.GetCurrentRealTime() - akquest.akstarttime)) as Int)
		EndIf
		SetCursorPosition(4)
		SetCursorFillMode(TOP_TO_BOTTOM)
		addemptyoption()
		addtoggleoptionst("FollowCreature", "Travel with Creature", FollowCreature, Option_flag_none)
		addtoggleoptionst("DebugMode", "Debug Mode", DebugMode, Option_flag_none)
		If akquest.akisdead == False
			addtoggleoptionst("CanBeGhost", "Can be Ghost", CanBeGhost, Option_flag_none)
		Else
			addtoggleoptionst("CanBeGhost", "Can be Ghost", CanBeGhost, Option_flag_disabled)
		EndIf
		if akquest.MainChar == False || akquest.MorphedSimple == True
			addtoggleoptionst("RevertonDeath", "Revert on Death", RevertOnDeath, Option_flag_disabled)
			addtoggleoptionst("DragonbornFollower", "Dragonborn Follower", dragonbornfollower, Option_flag_disabled)
			addtoggleoptionst("LoreFriendly", "Lore Friendly", lorefriendly, Option_flag_disabled)	
			;addtoggleoptionst("permatat", "Permanent Tattoos", permatat, Option_flag_disabled)
			addmenuoptionst("Revert", "Revert to origional character", "", Option_flag_none)
		Else
			If akquest.akisdead == 0
				addtoggleoptionst("RevertonDeath", "Revert on Death", RevertOnDeath, Option_flag_none)
				addtoggleoptionst("DragonbornFollower", "Dragonborn Follower", dragonbornfollower, Option_flag_none)
			Else
				addtoggleoptionst("RevertonDeath", "Revert on Death", RevertOnDeath, Option_flag_disabled)
				addtoggleoptionst("DragonbornFollower", "Dragonborn Follower", dragonbornfollower, Option_flag_disabled)
			EndIf
			addtoggleoptionst("LoreFriendly", "Lore Friendly", lorefriendly, Option_flag_none)	
			;addtoggleoptionst("permatat", "Permanent Tattoos", permatat, Option_flag_none)	
			addmenuoptionst("Revert", "Revert to origional character", "", Option_flag_disabled)
		EndIf	
	ElseIf (page == "Faces")
		SetCursorFillMode(left_TO_right)
		If akquest2.AKNPCList[0]
			addmenuoptionst("Face1", "Face of:", akquest2.AKNPCList[0].GetActorBase().getname()) 
		Else
			addmenuoptionst("Face1", "Face of:", "Empty!")
		EndIf
		If akquest2.AKNPCList[1]
			addmenuoptionst("Face2", "Face of:", akquest2.AKNPCList[1].GetActorBase().getname()) 
		Else
			addmenuoptionst("Face2", "Face of:", "Empty!")
		EndIf		
		If akquest2.AKNPCList[2]
			addmenuoptionst("Face3", "Face of:", akquest2.AKNPCList[2].GetActorBase().getname()) 
		Else
			addmenuoptionst("Face3", "Face of:", "Empty!")
		EndIf
		If akquest2.AKNPCList[3]
			addmenuoptionst("Face4", "Face of:", akquest2.AKNPCList[3].GetActorBase().getname()) 
		Else
			addmenuoptionst("Face4", "Face of:", "Empty!")
		EndIf		
		If akquest2.AKNPCList[4]
			addmenuoptionst("Face5", "Face of:", akquest2.AKNPCList[4].GetActorBase().getname()) 
		Else
			addmenuoptionst("Face5", "Face of:", "Empty!")
		EndIf
		
		If akquest2.AKNPCList[5]
			addmenuoptionst("Face6", "Face of:", akquest2.AKNPCList[5].GetActorBase().getname()) 
		Else
			addmenuoptionst("Face6", "Face of:", "Empty!")
		EndIf		
		If akquest2.AKNPCList[6]
			addmenuoptionst("Face7", "Face of:", akquest2.AKNPCList[6].GetActorBase().getname()) 
		Else
			addmenuoptionst("Face7", "Face of:", "Empty!")
		EndIf
		If akquest2.AKNPCList[7]
			addmenuoptionst("Face8", "Face of:", akquest2.AKNPCList[7].GetActorBase().getname()) 
		Else
			addmenuoptionst("Face8", "Face of:", "Empty!")
		EndIf		
		If akquest2.AKNPCList[8]
			addmenuoptionst("Face9", "Face of:", akquest2.AKNPCList[8].GetActorBase().getname()) 
		Else
			addmenuoptionst("Face9", "Face of:", "Empty!")
		EndIf
		If akquest2.AKNPCList[9]
			addmenuoptionst("Face10", "Face of:", akquest2.AKNPCList[9].GetActorBase().getname()) 
		Else
			addmenuoptionst("Face10", "Face of:", "Empty!")
		EndIf		
	
	EndIf
	
EndEvent




;Options Page States------------------------------------
State RevertonDeath
	event OnSelectST()
		RevertonDeath = !RevertonDeath
		If RevertOnDeath == True && dragonbornfollower == False
			dragonbornfollower = True
			SetToggleOptionValueST(dragonbornfollower)
		EndIf
		SetToggleOptionValueST(RevertonDeath)
	endEvent

	event OnDefaultST()
		RevertonDeath = True
		If dragonbornfollower == False
			dragonbornfollower = True
			SetToggleOptionValueST(dragonbornfollower)
		EndIf
		SetToggleOptionValueST(RevertonDeath)
	endEvent

	event OnHighlightST()
		SetInfoText("Revert to main character on death of NPC")
	endEvent
EndState

State CanBeGhost
	event OnSelectST()
		CanBeGhost = !CanBeGhost
		If CanBeGhost == True
			If dragonbornfollower == False
				dragonbornfollower = True
				SetToggleOptionValueST(dragonbornfollower)
			EndIf
			Playerref.GetActorBase().SetEssential(True) 	;need to work with revert on death
		Else
			If RevertonDeath == False || akquest.MainChar == True
				Playerref.GetActorBase().SetEssential(False)
			EndIf
		EndIf
		SetToggleOptionValueST(CanBeGhost)
	endEvent

	event OnDefaultST()
		CanBeGhost = False
		SetToggleOptionValueST(CanBeGhost)
		If RevertonDeath == False || akquest.MainChar == True
				Playerref.GetActorBase().SetEssential(False)
			EndIf
	endEvent

	event OnHighlightST()
		SetInfoText("Dying as the main character, or reverting to them after they're dead, \n results in playing as a ghost \n If off, player dies instead of being a ghost.")
	endEvent
EndState

State dragonbornfollower
	event OnSelectST()
		dragonbornfollower = !dragonbornfollower
		If dragonbornfollower == False
			If CanBeGhost == True
				CanBeGhost == False
				SetToggleOptionValueST(CanBeGhost)
			EndIf
			If RevertOnDeath == True
				RevertOnDeath = False
				SetToggleOptionValueST(RevertOnDeath)
			EndIf
		EndIf
		SetToggleOptionValueST(dragonbornfollower)
	endEvent

	event OnDefaultST()
		dragonbornfollower = True
		SetToggleOptionValueST(dragonbornfollower)
	endEvent

	event OnHighlightST()
		SetInfoText("Main character is still present after control transfer")
	endEvent
EndState

State FollowCreature
	event OnSelectST()
		FollowCreature = !FollowCreature
		SetToggleOptionValueST(FollowCreature)
	endEvent

	event OnDefaultST()
		FollowCreature = True
		SetToggleOptionValueST(FollowCreature)
	endEvent

	event OnHighlightST()
		SetInfoText("Appear next to the creature you were controlling.")
	endEvent
EndState

State DebugMode
	event OnSelectST()
		DebugMode = !DebugMode
		SetToggleOptionValueST(DebugMode)
	endEvent

	event OnDefaultST()
		DebugMode = True
		SetToggleOptionValueST(DebugMode)
	endEvent

	event OnHighlightST()
		SetInfoText("For use if you're hanging at the loading screen or use a non US keyboard \n Removes the loading screen so you can make accurate bug reports or manually progress the spell")
	endEvent
EndState

State permatat
	event OnSelectST()
		permatat = !permatat
		SetToggleOptionValueST(permatat)
	endEvent

	event OnDefaultST()
		permatat = True
		SetToggleOptionValueST(permatat)
	endEvent

	event OnHighlightST()
		SetInfoText("Tattoos are forver, \n and follow you when you control someone else.")
	endEvent
EndState

State lorefriendly
	event OnSelectST()
		If lorefriendly == False
			lorefriendly = True ;remove cheat spells
			playerref.RemoveSpell(AKControlMorphSpell)
			playerref.RemoveSpell(AKControlRemoteSpell)
			playerref.RemoveSpell(AKControlSimpleSpell)
		Else
			lorefriendly = False ;addcheat spells
			playerref.AddSpell(AKControlMorphSpell, False)
			playerref.AddSpell(AKControlRemoteSpell, False)
			playerref.AddSpell(AKControlSimpleSpell, False)
		EndIf
		SetToggleOptionValueST(lorefriendly)
	endEvent

	event OnDefaultST()
		lorefriendly = False
		SetToggleOptionValueST(lorefriendly)
	endEvent

	event OnHighlightST()
		SetInfoText("No overpowered spells\n Find control spells in spelltomes around the world")
	endEvent
EndState

State Revert
	event OnMenuOpenST()
		SetMenuDialogStartIndex(menudex)
		SetMenuDialogDefaultIndex(0)
		SetMenuDialogOptions(revertoptions)
	endEvent

	event OnMenuAcceptST(int index)
		menudex = index
		If menudex == 1
			SetMenuOptionValueST("Close MCM to Revert!")
			Utility.Wait(0.2) ;let them close menu first
			if akquest.MainChar == False
				if lorefriendly == True
					akquest.akrevert(playerref, True)
				Else
					akquest.akrevert(playerref)
				EndIf
			ElseIf akquest.MorphedSimple == True
				If lorefriendly == True
					akquest.aksimplerevert(akquest2.akpuppet, True)
				Else
					akquest.aksimplerevert(akquest2.akpuppet)
				EndIf
			EndIf
		EndIf
		
	endEvent

	event OnHighlightST()
		SetInfoText("Revert to origional character")
	endEvent
EndState


;Faces Page States------------------------------------

State Face1
	event OnMenuOpenST()
		SetMenuDialogStartIndex(0)
		SetMenuDialogDefaultIndex(0)
		SetMenuDialogOptions(Faceoptions)
	endEvent

	event OnMenuAcceptST(int index)
		menudex = index
		If menudex == 1
			akquest2.AKNPCFaceDelete(0)
			SetMenuOptionValueST("Empty!")
		EndIf
	endEvent

	event OnHighlightST()
		SetInfoText("Forget this face?")
	endEvent
EndState

State Face2
	event OnMenuOpenST()
		SetMenuDialogStartIndex(0)
		SetMenuDialogDefaultIndex(0)
		SetMenuDialogOptions(FaceOptions)
	endEvent

	event OnMenuAcceptST(int index)
		menudex = index
		If menudex == 1
			akquest2.AKNPCFaceDelete(1)
			SetMenuOptionValueST("Empty!")
		EndIf
	endEvent

	event OnHighlightST()
		SetInfoText("Forget this face?")
	endEvent
EndState

State Face3
	event OnMenuOpenST()
		SetMenuDialogStartIndex(0)
		SetMenuDialogDefaultIndex(0)
		SetMenuDialogOptions(FaceOptions)
	endEvent

	event OnMenuAcceptST(int index)
		menudex = index
		If menudex == 1
			akquest2.AKNPCFaceDelete(2)
			SetMenuOptionValueST("Empty!")
		EndIf
	endEvent

	event OnHighlightST()
		SetInfoText("Forget this face?")
	endEvent
EndState

State Face4
	event OnMenuOpenST()
		SetMenuDialogStartIndex(0)
		SetMenuDialogDefaultIndex(0)
		SetMenuDialogOptions(FaceOptions)
	endEvent

	event OnMenuAcceptST(int index)
		menudex = index
		If menudex == 1
			akquest2.AKNPCFaceDelete(3)
			SetMenuOptionValueST("Empty!")
		EndIf
	endEvent

	event OnHighlightST()
		SetInfoText("Forget this face?")
	endEvent
EndState

State Face5
	event OnMenuOpenST()
		SetMenuDialogStartIndex(0)
		SetMenuDialogDefaultIndex(0)
		SetMenuDialogOptions(FaceOptions)
	endEvent

	event OnMenuAcceptST(int index)
		menudex = index
		If menudex == 1
			akquest2.AKNPCFaceDelete(4)
			SetMenuOptionValueST("Empty!")
		EndIf
	endEvent

	event OnHighlightST()
		SetInfoText("Forget this face?")
	endEvent
EndState

State Face6
	event OnMenuOpenST()
		SetMenuDialogStartIndex(0)
		SetMenuDialogDefaultIndex(0)
		SetMenuDialogOptions(FaceOptions)
	endEvent

	event OnMenuAcceptST(int index)
		menudex = index
		If menudex == 1
			akquest2.AKNPCFaceDelete(5)
			SetMenuOptionValueST("Empty!")
		EndIf
	endEvent

	event OnHighlightST()
		SetInfoText("Forget this face?")
	endEvent
EndState

State Face7
	event OnMenuOpenST()
		SetMenuDialogStartIndex(0)
		SetMenuDialogDefaultIndex(0)
		SetMenuDialogOptions(FaceOptions)
	endEvent

	event OnMenuAcceptST(int index)
		menudex = index
		If menudex == 1
			akquest2.AKNPCFaceDelete(6)
			SetMenuOptionValueST("Empty!")
		EndIf
	endEvent

	event OnHighlightST()
		SetInfoText("Forget this face?")
	endEvent
EndState

State Face8
	event OnMenuOpenST()
		SetMenuDialogStartIndex(0)
		SetMenuDialogDefaultIndex(0)
		SetMenuDialogOptions(FaceOptions)
	endEvent

	event OnMenuAcceptST(int index)
		menudex = index
		If menudex == 1
			akquest2.AKNPCFaceDelete(7)
			SetMenuOptionValueST("Empty!")
		EndIf
	endEvent

	event OnHighlightST()
		SetInfoText("Forget this face?")
	endEvent
EndState

State Face9
	event OnMenuOpenST()
		SetMenuDialogStartIndex(0)
		SetMenuDialogDefaultIndex(0)
		SetMenuDialogOptions(FaceOptions)
	endEvent

	event OnMenuAcceptST(int index)
		menudex = index
		If menudex == 1
			akquest2.AKNPCFaceDelete(8)
			SetMenuOptionValueST("Empty!")
		EndIf
	endEvent

	event OnHighlightST()
		SetInfoText("Forget this face?")
	endEvent
EndState

State Face10
	event OnMenuOpenST()
		SetMenuDialogStartIndex(menudex)
		SetMenuDialogDefaultIndex(0)
		SetMenuDialogOptions(FaceOptions)
	endEvent

	event OnMenuAcceptST(int index)
		menudex = index
		If menudex == 1
			akquest2.AKNPCFaceDelete(9)
			SetMenuOptionValueST("Empty!")
		EndIf
	endEvent

	event OnHighlightST()
		SetInfoText("Forget this face?")
	endEvent
EndState

