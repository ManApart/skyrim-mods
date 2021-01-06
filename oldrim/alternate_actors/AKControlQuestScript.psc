Scriptname AKControlQuestScript extends Quest  
;Alternate Actors main Script -handles all aspects of control transfering
AK__QF_AKControlQuest_01000D92 Property akquestfrag Auto
AKControlQuest2Script property akquest2 Auto
AKControlMCMScript property akquestmcm Auto

float property akmodversion Auto
float property akstarttime Auto
float property akdurationtime Auto

armor Property ClothesPrisonerTunic Auto

formlist property akequipped auto
formlist property akequippedPlayer auto
formlist property AKAggressorsPlayer Auto ;used to move combat from player to NPC
formlist property AKAggressorsNPC Auto

;Faction transfer
formlist property AKBasicFactions Auto
int[] Property AKTempFactionRanks Auto 
int[] Property AKTempFactionRanksNPC Auto

;Face Tints
String[] Property AKTintList Auto
int[] Property AKTintColors Auto
int[] Property aktinttype Auto

ObjectReference property AKControlCloneMarker auto		;where to hide the nonused npcs
ObjectReference property AKControlCloneMarkerTemp auto	;temp use to mark where an NPC is.
ObjectReference property AKControlSimpleMarker Auto		;used to remember player's location before controlling animal
ObjectReference property AKControlMarkerDead auto 		;used so that first revert after death leads to player body
ObjectReference Property akplatform Auto
spell property akcontrolrevertspell auto
spell property akcontrolSaveFaceSpell auto
spell property akinvisSpell auto
spell property akCstopcombatspell auto
spell property AKCAbGhostAbilitiesSpell auto

Spell Property akcontrolmorphspell Auto		;spells the player should start with
Spell Property akcontrolsimplespell Auto		
Spell Property akcontrolremotespell Auto		
Spell Property akcontrolsaveremotespell Auto	
Spell Property AKControlMorphAlliesSpell Auto	

Cell Property akrememberedcell Auto

actor property akcontroltemp auto 			;used by spells to agree on the temp actor
actor property OrigionalNPC Auto 			;used by spells to move around the origional Actor
actor property akcontroltempmale auto		;male dragonborn puppet
actor property akcontroltempmaleDead auto	;male dragonborn puppet -for dead actor
actor property akcontroltempFemale auto		;female dragonborn puppet
actor property akcontroltempFemaleDead auto	;female dragonborn puppet - for dead actor
actor Property Playerref Auto				;the player!

bool property MainChar = True Auto			;is the player playing the MainChar or someone else?
bool property MorphedSimple Auto			;is the player simply controlling someone else?
bool property transfering Auto				;are traits transfering from one player to another?
bool property inprogress Auto				;is the player in progress to playing as someone else?
bool property inracemenu Auto				;used to loop racemenu until it works - lessens chance of getting stuck in racemenu by hitting keyboard
bool property isLocal	auto				;first update while in simple mode?
Int property akisdead	auto				;is the main character dead? 0 = no, 1 = recently dead, 2 = dead

message property akcontrolinitiateMessage Auto
message property akcontrolinitiateMessageInSpell Auto

;races for haircolor defaults
race property ArgonianRace Auto
race property BretonRace Auto
race property DarkelfRace Auto
race property ImperialRace Auto
race property KhajiitRace Auto
race property NordRace Auto
race property WoodElfRace Auto
race property OrcRace Auto
race property RedguardRace Auto

;Race Properties for Animals
;formlist Property AKAnimBear Auto ;-just use else
formlist Property AKAnimDragonPriest Auto
formlist Property AKAnimDragon Auto
formlist Property AKAnimDraugr Auto
formlist Property AKAnimDweSphere Auto
formlist Property AKAnimDweSpider Auto
formlist Property AKAnimFlameAntronach Auto
formlist Property AKAnimSpriggan Auto
formlist Property AKAnimFrostAntronach Auto
formlist Property AKAnimGiant Auto
formlist Property AKAnimSlaughterfish Auto
formlist Property AKAnimSpider Auto
formlist Property AKAnimStormAntronach Auto
formlist Property AKAnimTroll Auto
formlist Property AKAnimHagraven Auto
formlist Property AKAnimDweSteam Auto

;Spell properties for animals
Spell Property AKCStartCombatSpell Auto 	;used to restart combat for some puppets
Spell Property crSprigganHeal01 auto	;spells that puppets cast
Spell Property crSprigganMatronConcentration auto
Spell Property crAtronachFlameFirebolt auto
Spell Property crAtronachFlameFlames auto
Spell Property crAtronachStormMeleeAttack auto
Spell Property crAtronachStormChainLightning auto
Spell Property crAtronachStormAreaAttack auto
Spell Property DragonPriestMaskUltraFlameCloak auto
Spell Property IceStorm auto
Spell Property crSprigganCallCreatures auto

Keyword Property ActorTypeNPC Auto
Faction Property CharmFaction Auto

;default Hair Color characters
ActorBase property akcontrolargonian auto
ActorBase property akcontrolbreton auto
ActorBase property akcontroldarkelf auto
ActorBase property akcontrolnord auto
ActorBase property akcontrolwoodelf auto
ActorBase property akcontrolKhajiit auto
ActorBase property akcontrolBlankNPC auto


;Other Variables
headpart temppart
;int headdex		;index where ^ headpart is found on person it will be equipped to - use 2
int typecount 		;used as an index / facetype for loops looking for correct face parts
int i 				;used for indexes all around the world!
int size			;used for the size of indexes
int hp 				;number of headparts
int hp2 			;number of headparts2
actorbase playerbase ;the player's actor base, cause you know, that seems useful
actor tempactor		;tempactor for aggression change
spell tempspell		;spell used for spell transfers
;bool sexchange		;is sexchange needed?
cell akcell			;cell variable used to switch aggression
int cellcount		;total actors in cell
int celldex			;index of actors



;Morph Complete Function -----------------------------------------------------------------------------------
; akdoner = person we're becoming, akimposter = player, duration= if spell only lasts so long, aktime = exact length of time spell should last (otherwise calculated by current magicka)
function AKMorphComplete(Actor akdonor, Actor akimposter, Bool duration = False, Float aktime = 0.0)
;Debug.Notification("MainChar started!")
	if inprogress == 0
		inprogress = 1
		debug.setgodmode(true)
		akcontrolclonemarkertemp.MoveTo(akimposter)	;mark where player was
		playerref.DispelSpell(AKCAbGhostAbilitiesSpell)	;remove ghost effects
		playerref.RemoveSpell(AKCAbGhostAbilitiesSpell)	;remove ghost effects
		akquestfrag.alias_Ghost.Clear()
		playerref.SetGhost(False)
		Utility.Wait(0.1)
		akimposter.moveto(akdonor)
		Utility.Wait(0.1)
		If akquestmcm.Debugmode == False
			game.DisablePlayerControls(true,true,true,true,true, true, True, True)
			akquest2.akloadscreenOn()
			While akquest2.akloadscreen == 0
				Utility.Wait(0.1)
			EndWhile
		EndIf
		Utility.Wait(0.2)
		if duration == True && aktime < 1.1
			aktime = (akimposter.getActorValue("Magicka"))
			if aktime < 5 ;no transformations that last less than 5 seconds
				aktime = 5
			EndIf
		EndIf
		if MainChar == True
			;record tat stats
			size = game.GetNumTintMasks()
			i = 0
			While i < size 
				aktintcolors[i] = game.GetNthTintMaskColor(i)
				aktintlist[i] = game.GetNthTintMaskTexturePath(i)
				aktinttype[i] = Game.GetNthTintMaskType(i)
				i += 1
			EndWhile
			;debug.Notification( i + "facetints recorded")
			If akcontroltemp == None
				if akimposter.GetActorBase().getsex() == 0
					akcontroltemp = akcontroltempmale	
				Else
					akcontroltemp = akcontroltempFemale
				EndIf
				akquestfrag.alias_ControlTemp.ForceRefTo(akcontroltemp) 	;fill the control temp ref
				;Debug.MessageBox("Ref filled!")
			EndIf
		EndIf
		While akimposter.GetActorBase().getsex() != akdonor.GetActorBase().getsex()
			RegisterForMenu("Console")
			input.tapkey(input.getmappedkey("Console", 0))
			utility.wait(0.1) ;make this latent, wait until sexchange is complete
		EndWhile ; this is a while and not an if to make it more resiliant to player's typing and messing it up
		
		;make sure everyone is in same cell, otherwise this doesn't work for some reason.
		;transfer traits from PC back to orignpc before getting new traits
		If MainChar == False ; && playerref != akquestfrag.alias_Ghost.GetActorReference() ;only update if main player is alive		
			origionalnpc.moveto(akdonor)
			akTraitTransfer(akimposter, origionalnpc) ;transfer puppet stats to origional npc
			While transfering == True
				utility.Wait(0.1)
			EndWhile
		Else
			akcontroltemp.moveto(akdonor)
		EndIf
		AKAggressorsPlayer.revert()
		AKAggressorsNPC.revert()
		
		origionalnpc = akdonor ; remembers who the player turned into, so we can bring them back
		akCstopcombatspell.Cast(playerref)
		If mainchar == True ;if playing as main character, update the controltemp, we're giving player traits to puppet 
			akquest2.AKFaceStore(playerref, akcontroltemp, 10)	;save player traits
			While akquest2.isworking == True
				Utility.Wait(0.1)
			EndWhile
			colorform tempcolor = akquest2.AKNPCColorList[10]
			if tempcolor.getred() == 0 && tempcolor.getblue() == 0 && tempcolor.getgreen() == 0
				akquest2.AKNPCColorList[10] = akdefaultcolor(akquest2.AKNPCRaceList[21], akquest2.AKNPCNameList[21])
				;debug.Notification("Actor has default hair")
			EndIf
			akquest2.AKFaceRecall(playerref, akcontroltemp, 10)	;impose player traits on puppet
			;only update if main player is alive - no, need always, for rags
		;	if akisdead == 0 
				akTraitTransfer(akimposter, akcontroltemp)			
				while transfering == True ;use this to make sure trait transfer isn't interrupted by loadscreen
					utility.wait(0.1)
				EndWhile
		;	EndIf
		EndIf
		
		;now let's make the player look like they're supposed to
		akquest2.AKFaceStore(origionalNPC, playerref, 11) ;storing Current NPC traits
		While akquest2.isworking == True
			Utility.Wait(0.1)
		EndWhile
		colorform tempcolor = akquest2.AKNPCColorList[11]
		if tempcolor.getred() == 0 && tempcolor.getblue() == 0 && tempcolor.getgreen() == 0
			akquest2.AKNPCColorList[11] = akdefaultcolor(akquest2.AKNPCRaceList[23], akquest2.AKNPCNameList[23])
			;debug.Notification("Actor has default hair")
		EndIf
		akquest2.AKFaceRecall(akdonor, playerref, 11)
		akTraitTransfer(akdonor, akimposter) 
		while transfering == True ;use this to make sure trait transfer isn't interrupted by loadscreen
			utility.wait(0.1)
		EndWhile
		origionalnpc.moveto(AKControlCloneMarker)
		If akquestmcm.dragonbornfollower == False || akisdead > 0	;if player is dead, no follower
			akcontroltemp.moveto(AKControlCloneMarker)
		Else
			akcontroltemp.moveto(akcontrolclonemarkertemp) 	;movet controltemp to where player was
		EndIf
		inracemenu = True
		RegisterForMenu("RaceSex Menu")
		Game.ShowRaceMenu()
		utility.Wait(0.1) ;wait until race menu is done
		inracemenu = False
		;debug.ToggleAI()
		debug.setgodmode(False)
		If akquestmcm.Debugmode == False
			akquest2.akloadscreenoff()
			While akquest2.akloadscreen == 0
				Utility.Wait(0.1)
			EndWhile
		EndIf
		if akquestmcm.revertondeath == True
			akimposter.GetActorBase().SetEssential(True)
		EndIf
		game.EnablePlayerControls()
		akimposter.GetActorBase().setname(akquest2.akNPCNameList[23])
		;After this point, place changes the player doesn't notice as much-------------
		AKTraitTransferInvis(akcontroltemp, origionalnpc)
		playerref.addspell(akcontrolrevertspell, False)
		playerref.addspell(akcontrolSaveFaceSpell, False) 
		if duration == True
			debug.Notification("You will be able to maintain control for " + (aktime as int) + "seconds.")
			akdurationtime = aktime
			akstarttime = utility.GetCurrentRealTime()
			RegisterForSingleUpdate(3)
		EndIf
		inprogress = 0
		MainChar = False

		Debug.Notification("Control Swapped")
	Else
		debug.notification("Already changing controls!")
	EndIf
EndFunction

function akrevert(actor akimposter, Bool AKDrainmagic = False)
if MainChar == False
	if inprogress == 0
		inprogress = 1
		;kill player's controls and make him untouchable for duration of transformation
		
		akcontrolclonemarkertemp.MoveTo(akimposter)	;mark where player was
		Utility.Wait(0.1)
		If akquestmcm.dragonbornfollower == True && akisdead == 0
			akimposter.moveto(akcontroltemp) ;move player to where fake player was
		EndIf
		If akisdead == 1
			;akisdead = 2	;do this after adding rags
			akimposter.MoveTo(AKControlMarkerDead)
		EndIf
		If akquestmcm.Debugmode == False
			game.DisablePlayerControls(true,true,true,true,true, true, True, True)
			akquest2.akloadscreenon()
			While akquest2.akloadscreen == 0
				Utility.Wait(0.1)
			EndWhile
		EndIf
		
		debug.setgodmode(true)
		While akimposter.GetActorBase().getsex() != akcontroltemp.GetActorBase().getsex()
			RegisterForMenu("Console")
			input.tapkey(input.getmappedkey("Console"))
			utility.wait(0.1) ;make this latent, wait until sexchange is complete
		EndWhile ; while makes typing more tamper proof
		;get the gang back together, so traits can transfer
		origionalnpc.moveto(akcontrolclonemarkertemp) 				;move the NPC you've been playing as to you
		origionalnpc.setdontmove(True)
		akcontroltemp.moveto(akcontrolclonemarkertemp) 				;move fake player to real player
		AKAggressorsPlayer.revert()
		AKAggressorsNPC.revert()
		akCstopcombatspell.Cast(akimposter)				;make everyone nice and peaceful
		akimposter.RemoveSpell(akcontrolrevertspell) 	;remove spells before transfers
		akimposter.removespell(akcontrolSaveFaceSpell) 
		akimposter.removespell(akcontrolSaveFaceSpell) 
	;	if akisdead == 0 
			akTraitTransfer(akimposter, origionalnpc) ;transfer puppet stats to origional npc
			while transfering == True
				utility.wait(0.1)
			EndWhile
	;	EndIf
		akquest2.AKFaceRecall(playerref, akimposter, 10) ;retrieving player facetraits
		akTraitTransfer(akcontroltemp, akimposter) ; transfer orig player stats back to player
		while transfering == True
			utility.wait(0.1)
		EndWhile
		akcontroltemp.moveto(akcontrolclonemarker) ;move fake player to his box
		If akisdead > 0
			playerref.addspell(AKCAbGhostAbilitiesSpell, false)
			playerref.SetGhost(True)
			akquestfrag.alias_Ghost.ForceRefTo(playerref)
			If akisdead == 1
				akisdead = 2
				playerref.EquipItem(ClothesPrisonerTunic, false, true)
			EndIf
		EndIf
		inracemenu = True
		RegisterForMenu("RaceSex Menu")
		Game.ShowRaceMenu()
		utility.wait(0.1) ;make this latent, wait until menu is complete
		inracemenu = False
		UnRegisterForMenu("RaceSex Menu")
		debug.setgodmode(False)
		origionalnpc.setdontmove(False)
		size = aktintlist.Length ; (Will always be 20)
		i = 0
		While i < size
			game.SetTintMaskTexturePath(aktintlist[i], aktinttype[i], i)
			game.SetNthTintMaskColor(i, aktintcolors[i])
			i +=1
		EndWhile
		playerref.QueueNiNodeUpdate()
		origionalnpc.MoveTo(akcontrolclonemarkertemp)	;move origional npc to where the player left of controlling them
		If akquestmcm.Debugmode == False
			akquest2.akloadscreenOFF()
			While akquest2.akloadscreen == 0
				Utility.Wait(0.1)
			EndWhile
		EndIf
		Game.EnablePlayerControls()
		If akquestmcm.CanBeGhost == False
			akimposter.GetActorBase().SetEssential(False)
		EndIf
		akimposter.GetActorBase().setname(akquest2.akNPCNameList[21])
		;;After Loadingscreen functions:
		AKTraitTransferInvis(origionalnpc, akcontroltemp)
		If akdrainmagic == True
			playerref.damageActorValue("Magicka", (Utility.GetCurrentRealTime() - akstarttime))
		EndIf
		inprogress = 0
		MainChar = True
		UnRegisterForMenu("RaceSex Menu") ;unregister for racemenu
		Debug.Notification("Control Swapped")
		;Debug.Notification("Main character = " + mainchar)
	Else
		debug.notification("Already changing controls!")
	EndIf
Else
	debug.notification("Already in control of origional actor!")
EndIf
EndFunction

;Simple Functions-----------------------------------------------------------------------------------
Function AKSimpleMorph(Actor aktarget, Bool akduration = False, Float aktime = 0.0)
If MorphedSimple == False
	if akduration == True && aktime < 1
		aktime = (playerref.getActorValue("Magicka"))
		if aktime < 5 ;no transformations that last less than 5 seconds
			aktime = 5
		EndIf
	EndIf
	game.DisablePlayerControls(false, true, false, false, false, True, true, false, 0)
	aktarget.setplayercontrols(true)
	playerref.setplayercontrols(false)
	aktarget.enableai()
	Game.SetCameraTarget(aktarget)
	Game.ForceThirdPerson()
	debug.setgodmode(true)
	akcontrolsimplemarker.MoveTo(playerref)
	
	;Let's set them up for anim attacks!
	akquest2.akpuppet = aktarget
	akquest2.akleftattack = input.Getmappedkey("Left Attack/Block")
	akquest2.akrightattack = input.Getmappedkey("Right Attack/Block")
	akquest2.akshoutattack = input.Getmappedkey("Shout")
	akquest2.akspecialattack = input.Getmappedkey("Activate")
	
	;clear variables
	akquest2.akrightstring = ""		
	akquest2.akleftstring = ""
	akquest2.akspecialstring = ""	
	akquest2.akrighthandspell = None
	akquest2.aklefthandspell = None
	akquest2.akspecialspell = None
	akquest2.cooldown = 1.5
	
	
	;now that they're set up, let's decide which attacks to give them!
	race temprace = aktarget.getrace()
	if temprace.HasKeyword(ActorTypeNPC)
		akquest2.akspecialspell = akquest2.AKCActivateSpell
		;puppet doesn't move at first, try sending an animation event to clear animation?
		;could try: IdleForceDefaultState
		Debug.SendAnimationEvent(akquest2.akpuppet, "IdleStopInstant")
		If playerref.GetParentCell() != akrememberedcell
			akrememberedcell = playerref.GetParentCell()
			akquest2.AKDoorCount()
		EndIf
	Elseif AKAnimDragonPriest.find(temprace) != -1 				;tried but didn't work column
		akquest2.akrightstring = "CombatIdleSpecial2Start"			;MRh_SpellFire_event MRh_SpellFireForgetR_Start MRh_SpellRelease_Event SoundPlay. NPCDragonpriestCoffinAppear
		akquest2.akrighthandspell = DragonPriestMaskUltraFlameCloak
		akquest2.akleftstring = "CombatIdleSpecial1Start"			;MLh_SpellFireForgetR_Start MLh_SpellFireForgetS_Start
		akquest2.aklefthandspell = IceStorm
		akquest2.akspecialstring = "Getup"					;Reanimated aggroWarningStart idleLeanExitStart
		akquest2.cooldown = 2.0
	elseif AKAnimDragon.find(temprace) != -1 
		akquest2.akrightstring = "attackStartBite"
		akquest2.akleftstring = "attackStartTail"
		akquest2.akspecialstring = "shoutStartFireball"
	elseif AKAnimDraugr.find(temprace) != -1 
		akquest2.akrightstring = "attackStart1HMSwipe"
		akquest2.akleftstring = "attackStart1HMPowerChop"	
		akquest2.akspecialstring = "forceFurnExit"				;bowAttackStart aggroWarningStart
	elseif AKAnimDweSphere.find(temprace) != -1 
		akquest2.akrightstring = "attackStartSlash"
		akquest2.akleftstring = "attackStartStab"
		akquest2.akspecialstring = "startWarning"				;bowAttackStart attackRelease
	elseif AKAnimDweSteam.find(temprace) != -1 		
		akquest2.akrightstring = "attackStartSlash"
		akquest2.akleftstring = "bashStart"
		akquest2.akspecialstring = "attackStartChop"				;Event00
	elseif AKAnimDweSpider.find(temprace) != -1 
		akquest2.akrightstring = "AttackStart_RightStab"
		akquest2.akleftstring = "AttackStart_LeftStab"
		akquest2.akspecialstring = "AttackStart_Spin"
	elseif AKAnimFlameAntronach.find(temprace) != -1 
		akquest2.akrightstring = "Spell_Concentration_LH"			;MRh_SpellFire_Event Magic_Equip Spell_FireForget_LH Spell_FireForget_RH
		akquest2.akrighthandspell = crAtronachFlameFlames
		akquest2.akleftstring = "Spell_Release"			;MLh_SpellFire_Event
		akquest2.aklefthandspell = crAtronachFlameFirebolt
		akquest2.akspecialstring = "idleSpecial1"	
		akquest2.cooldown = 0.5
	elseif AKAnimSpriggan.find(temprace) != -1 
		akquest2.akrightstring = "Spell_Concentration_LH"
		akquest2.akrighthandspell = crSprigganMatronConcentration
		akquest2.akleftstring = "idleCombatSpecial1"	
		akquest2.aklefthandspell = crSprigganHeal01
		akquest2.akspecialstring = "Spell_Release"	 	;also works: idleSpecialLookAround
		akquest2.akspecialspell = crSprigganCallCreatures
	elseif AKAnimFrostAntronach.find(temprace) != -1 
		akquest2.akrightstring = "attackStart_Attack_R1"
		akquest2.akleftstring = "attackStart_Attack_L1"
		akquest2.akspecialstring = "bashStart"
	elseif AKAnimHagraven.find(temprace) != -1 				
		akquest2.akrightstring = "attackStart_L"					;WeapEquip Magic_Equip Spell_FireForget_LH Spell_Concentration_LH Spell_Concentration_Self
		akquest2.akleftstring = "attackStart_R"					;spellRelease Spell_FireForget_Self MLh_Spellfire_Event MLh_Con_ReleaseLoop
		akquest2.akspecialstring = "aggroWarningStart"			;aggroWarningStart idleLookAround
	elseif AKAnimGiant.find(temprace) != -1 
		akquest2.akrightstring = "attackStart_ClubAttack1"
		akquest2.akleftstring = "attackPowerStart_Stomp"
		akquest2.akspecialstring = "aggroWarningStart"	
		akquest2.akspecialspell = AKCStartCombatSpell
	elseif AKAnimSlaughterfish.find(temprace) != -1 
		akquest2.akrightstring = "AttackStart_RUppercut"
		akquest2.akleftstring = "AttackStart_LSlash"
		akquest2.akspecialstring = "AttackStart_RCorss"
	elseif AKAnimSpider.find(temprace) != -1 
		akquest2.akrightstring = "AttackStart_RightChop"
		akquest2.akleftstring = "AttackStart_LeftChop"
		akquest2.akspecialstring = "AttackStartLungeBite"
	elseif AKAnimStormAntronach.find(temprace) != -1 
		akquest2.akrightstring = "attackPowerStart_ForwardAttack"			;MRh_SpellFire_Event Spell_FireForget_Start
		akquest2.akrighthandspell = crAtronachStormMeleeAttack
		akquest2.akleftstring = "attackPowerStart_StandingAttack"			;MLh_SpellFire_Event Spell_Concentration_Start Spell_Release weaponSwing
		akquest2.aklefthandspell = crAtronachStormAreaAttack
		akquest2.akspecialstring = "summonStart"
		akquest2.akspecialspell = crAtronachStormChainLightning
		akquest2.cooldown = 2.0
	elseif AKAnimTroll.find(temprace) != -1 
		akquest2.akrightstring = "attackStartRightA"
		akquest2.akleftstring = "attackStartLeftB"
		akquest2.akspecialstring = "attackStartPowerComboA"
	Else ;this would include the bear formlist
		akquest2.akrightstring = "attackStart_AttackRight1"
		akquest2.akleftstring = "attackStart_AttackLeft1"
		akquest2.akspecialstring = "aggroWarningStart"
	EndIf
	;now that that's all over, let's let them press buttons!
	akquest2.RegisterforKey(akquest2.akrightattack)
	akquest2.RegisterforKey(akquest2.akleftattack)
	akquest2.RegisterforKey(akquest2.akshoutattack)
	akquest2.RegisterforKey(akquest2.akspecialattack)
	
	if akduration == True
			akdurationtime = aktime
			akstarttime = utility.GetCurrentRealTime()
		debug.Notification("You will be able to maintain control for "+ (aktime as int) + "seconds.")	
	EndIf
	isLocal = True
	RegisterForSingleUpdate(3.0) ;register to check distance 
	MorphedSimple = True
Else
	debug.notification("Already in control of alternate actor!")
EndIf
EndFunction

Function AKSimpleRevert(Actor aktarget, Bool AKDrainmagic = False)
If MorphedSimple == True
	playerref.DispelSpell(akinvisSpell)
	aktarget.setplayercontrols(false)
	playerref.setplayercontrols(true)
	game.EnablePlayerControls()
	aktarget.enableai()
	Game.SetCameraTarget(playerref)
	debug.setgodmode(true)
	akquest2.unRegisterforKey(akquest2.akrightattack)
	akquest2.unRegisterforKey(akquest2.akleftattack)
	akquest2.unRegisterforKey(akquest2.akshoutattack)
	akquest2.unRegisterforKey(akquest2.akspecialattack)
	debug.setgodmode(False)
	If akdrainmagic == True
		playerref.damageActorValue("Magicka", (Utility.GetCurrentRealTime() - akstarttime))
	EndIf
	If akquestmcm.FollowCreature == False
		playerref.MoveTo(akcontrolsimplemarker)
	Else
		playerref.MoveTo(aktarget)
	EndIf
	MorphedSimple = False
Else
debug.notification("Already in control of origional actor!")
EndIf
EndFunction

;Trait Transfer Function -----------------------------------------------------------------------------------
;function transfers traits from one actor to another
;toNPC is true when transfering traits to an NPC, false when the player is getting traits from an NPC
function AKTraitTransfer(actor akbase, actor aknew)
transfering = True
ActorBase akbasebase = akbase.GetActorBase()
If akbasebase.getnumheadparts() == 0	;make sure we have the right base for leveled actor/non leveled actor
	akbasebase = akbase.GetLeveledActorBase()
EndIf
ActorBase aknewbase = aknew.GetActorBase()
If aknewbase.getnumheadparts() == 0	
	aknewbase = aknew.GetLeveledActorBase()
EndIf
playerbase = playerref.GetActorBase()
aknewbase.setheight(akbasebase.getheight())
aknewbase.setweight(akbasebase.getweight()) ;supposed to fix grayface bug?
aknew.UnequipAll()

; Debug.MessageBox("Setup!")
; Utility.Wait(1.0)

; Get equipped weapons and spells-------------------------
bool righthand = 0
bool lefthand  = 0 ;for these guys, a 1 means weapon, a 2 means spell, and a 3 means a sheild
Spell akshout = akbase.GetEquippedSpell(2)
weapon rightweapon
weapon leftweapon
spell rightspell
spell leftspell
armor akshield

if akbase.GetEquippedItemType(1) != 9 ; right hand
	rightweapon = akbase.GetEquippedWeapon(false)
	righthand = 1
	;debug.notification("Right hand had weapon")
Else
	rightspell = akbase.GetEquippedSpell(1)
	righthand = 2
	;debug.notification("Right hand had spell")
EndIf


if akbase.GetEquippedItemType(0) < 9 || akbase.GetEquippedItemType(0) == 12 ;left hand
	leftweapon = akbase.GetEquippedWeapon(True)
	;debug.notification("Left hand had weapon")	
	lefthand = 1
elseif akbase.GetEquippedItemType(0) == 10
	akshield = akbase.GetEquippedShield()
	;debug.notification("Left hand had sheild")
	lefthand = 3
else
	leftspell = akbase.GetEquippedSpell(0)
	;debug.notification("Left hand had Spell")
	lefthand = 2
EndIf

; Debug.MessageBox("Weapons!")
; Utility.Wait(1.0)

; Equip armor (and swap inventory items over)-------------------------
;Get akbase's outfit
;Here's the part where I've taken inspiration from Korodic's Werewolf Aftermath mod and Deazurain's Loadout mod.
;Both dudes understood how many slots there were (counted slot masks on the wiki) and understood how to multiply the hex code by two to get every combo of armor you could have and add it to a formlist.
;I didn't know how the hex code worked, or had the idea to do a formlist until I looked at their scripts, so I wanted to credit them. 
;However, I believe this inspiration is fair game/ is in the public domain, because 2 people did the same thing for 2 different mods, and my inspired section is as different from either of theirs as their script chunks are from one another.

int slotmask = 0
int hexcode = 1
if akbase == playerref
	akequippedPlayer.revert()
	while slotmask < 31
		akequippedPlayer.addform(akbase.getwornform(hexcode))
		slotmask += 1
		hexcode *= 2
	EndWhile
Else
	akequipped.revert()
	while slotmask < 31
		akequipped.addform(akbase.getwornform(hexcode))
		slotmask += 1
		hexcode *= 2
	EndWhile
EndIf

aknew.RemoveAllItems()
akbase.RemoveAllItems(aknew)
;equip the outfit on aknew
if akbase == playerref
	int index = akequippedplayer.getsize()
	while index >= 0
		aknew.equipitem(akequippedplayer.getat(index), True, true)
		index -=1
	EndWhile
Else
	int index = akequipped.getsize()
	while index >= 0
		aknew.equipitem(akequipped.getat(index), False, true)
		index -=1
	EndWhile
EndIf

; Debug.MessageBox("Items!")
; Utility.Wait(1.0)

;transfer the spells from akbase to aknew 
;Not transfering base spells, as they should just be health and flames, which I'm afraid to Move
;Race spells should change when race changed.
int Spellindex = (akbase.getspellcount() - 1)
;Debug.MessageBox(Spellindex + " spells")
;Utility.Wait(1.0)
 while Spellindex > 0
	tempspell = akbase.getnthspell(Spellindex)
	aknew.addspell(tempSpell, False)
	akbase.DispelSpell(tempspell)	;clear's spell effects
	akbase.removespell(tempspell)
	Spellindex -= 1
 EndWhile

; Debug.MessageBox("Spells!")
; Utility.Wait(1.0)

;Now let's equip those weapons and spells we found earlier.------------------
aknew.EquipSpell(akshout, 2)
if righthand == 1
	aknew.EquipItemex(rightweapon, 1)
Elseif righthand == 2
	aknew.equipspell(rightspell, 1)
EndIf	

if lefthand == 1
	aknew.EquipItemex(leftweapon, 2) 
elseif lefthand == 2
	aknew.equipspell(leftspell, 0)
Elseif lefthand == 3
	aknew.equipitemex(akshield)
EndIf

; Debug.MessageBox("equipped!")
; Utility.Wait(1.0)

; Now let's update aknew's skills and health/stamina/magicka-------------------------
;aknew.SetActorValue("Health", akbase.GetbaseActorValue("Health")) 	;sets aknew's base health
;aknew.RestoreActorValue("Health", (akbase.GetbaseActorValue("Health") - aknew.GetActorValue("Health"))) ;restore to full health
;aknew.DamageActorValue("Health", (akbase.GetbaseActorValue("Health") - akbase.GetActorValue("Health"))) ;damage until proper health
aknew.SetActorValue("Magicka", akbase.GetbaseActorValue("Magicka"))
aknew.SetActorValue("Stamina", akbase.GetbaseActorValue("Stamina"))
aknew.SetActorValue("OneHanded", akbase.GetbaseActorValue("OneHanded"))
aknew.SetActorValue("TwoHanded", akbase.GetbaseActorValue("TwoHanded"))
aknew.SetActorValue("Marksman", akbase.GetbaseActorValue("Marksman"))
aknew.SetActorValue("Block", akbase.GetbaseActorValue("Block"))
aknew.SetActorValue("Smithing", akbase.GetbaseActorValue("Smithing"))
aknew.SetActorValue("HeavyArmor", akbase.GetbaseActorValue("HeavyArmor"))
aknew.SetActorValue("LightArmor", akbase.GetbaseActorValue("LightArmor"))
aknew.SetActorValue("Pickpocket", akbase.GetbaseActorValue("Pickpocket"))
aknew.SetActorValue("Lockpicking", akbase.GetbaseActorValue("Lockpicking"))
aknew.SetActorValue("Sneak", akbase.GetbaseActorValue("Sneak"))
aknew.SetActorValue("Alchemy", akbase.GetbaseActorValue("Alchemy"))
aknew.SetActorValue("Speechcraft", akbase.GetbaseActorValue("Speechcraft"))
aknew.SetActorValue("Alteration", akbase.GetbaseActorValue("Alteration"))
aknew.SetActorValue("Conjuration", akbase.GetbaseActorValue("Conjuration"))
aknew.SetActorValue("Destruction", akbase.GetbaseActorValue("Destruction"))
aknew.SetActorValue("Illusion", akbase.GetbaseActorValue("Illusion"))
aknew.SetActorValue("Restoration", akbase.GetbaseActorValue("Restoration"))
aknew.SetActorValue("Enchanting", akbase.GetbaseActorValue("Enchanting"))

;debug.MessageBox("Traits Swapped")
transfering = False
EndFunction

;Trait Transfer continued Function -----------------------------------------------------------------------------------
function AKTraitTransferInvis(actor aktake, actor akgive)
	; on morph aktake = akcontroltemp and akgive = origionalnpc
	; on revert aktake = origionalnpc and akgive = akcontroltemp

	;make sure player has spells
	If akquestmcm.LoreFriendly == False
		playerref.AddSpell(akcontrolmorphspell, false)
		If playerref.IsGhost() == False
			playerref.AddSpell(akcontrolsimplespell, false)
			playerref.AddSpell(akcontrolremotespell, false)
			playerref.AddSpell(akcontrolsaveremotespell, false)
		EndIf
	Else
		If playerref.IsGhost() == True	;so the lore friendly ghost can do something
			playerref.AddSpell(AKControlMorphAlliesSpell, False)
		EndIf
	EndIf

	;let's transfer the aggression we recorded earlier (through the stop combat spell) to the right person
	i = 0
	size = akaggressorsplayer.getsize()
	;Debug.Notification(size + " people are angry at the player!")
	while i < size 
		tempactor = akaggressorsplayer.getat(i) as Actor
		tempactor.RemoveFromFaction(charmfaction)
		tempActor.StartCombat(aktake) ;player to fake player on morph, player to orignpc on revert
		i += 1
	EndWhile
	i = 0
	size = akaggressorsNPC.getsize() ;and once more for the NPCs... good, good
	;Debug.Notification(size + " people are angry at the NPC!")
	while i < size 
		tempactor = akaggressorsNPC.getat(i) as Actor
		tempactor.RemoveFromFaction(charmfaction)
		tempActor.StartCombat(playerref) ;orig npc to player on morph, fake player to player on revert
		i += 1
	EndWhile

	;Now let's give people the right factions
	size = AKbasicfactions.GetSize()
	i = 0
	faction tempfaction
	while i < size
		tempfaction = (akbasicfactions.GetAt(i) as Faction)
		AKTempfactionRanks[i] = playerref.GetFactionRank(tempfaction)		
		AKTempfactionRanksNPC[i] = akgive.GetFactionRank(tempfaction)		
		i += 1
	EndWhile
	;now that we have the pertinent faction ranks, let's give them to the right people.
	i = 0
	while i < size
		tempfaction = akbasicfactions.GetAt(i) as Faction
		If AKTempFactionRanksNPC[i] < 0
			If playerref.GetFactionRank(tempfaction) >= 0
				playerref.RemoveFromFaction(tempfaction)
				;Debug.Notification("Faction removed player" + i)
			EndIf
		Else
			playerref.SetFactionRank(tempfaction, AKTempFactionRanksNPC[i])
		EndIf
		If AKTempFactionRanks[i] < 0
			If aktake.GetFactionRank(tempfaction) >= 0
				aktake.RemoveFromFaction(tempfaction)
				;Debug.Notification("Faction removed NPC" + i)
			EndIf
		Else
			aktake.SetFactionRank(tempfaction, AKTempFactionRanks[i])
		EndIf
		i += 1
	EndWhile	
	;debug.Notification("Invs transfer done")
EndFunction

;Default Hair Function -----------------------------------------------------------------------------------
;if haircolor is default, give it a hair color to work with
;is this needed?
colorform function akdefaultcolor(race akrace, string akname)
if akrace == ArgonianRace ;|| akrace == ArgonianRaceVampire ;not doing vampire races for now
	Return akcontrolargonian.gethaircolor() as colorform
ElseIf akrace == BretonRace ;|| akrace == BretonRaceVampire
	Return akcontrolbreton.gethaircolor() as colorform
ElseIf akrace == DarkElfRace || akrace == ImperialRace || akrace == OrcRace || akrace == RedguardRace
	Return akcontroldarkelf.gethaircolor() as colorform
ElseIf akrace == KhajiitRace	
	Return akcontrolKhajiit.gethaircolor() as colorform
ElseIf akrace == NordRace	
	Return akcontrolNord.gethaircolor() as colorform
ElseIf akrace == woodelfRace	
	Return akcontrolwoodelf.gethaircolor() as colorform
Else
	Debug.Notification(akname + "'s race is not recognized!")
	Return akcontroldarkelf.gethaircolor() as colorform
EndIf
EndFunction

;Update Event-----------------------------------------------------------------------------------
Event OnUpdate() ;runs to shutdown lore control quests
	;Debug.Notification("Quest recieved update")
	If akquestmcm.lorefriendly == True
		akquest2.AKRevertPoll()
	EndIf
	If MorphedSimple == True
		If akquest2.akpuppet.GetWorldSpace() == AKControlSimpleMarker.GetWorldSpace() || akquest2.akpuppet.GetParentCell().IsInterior() == AKControlSimpleMarker.GetParentCell().IsInterior()
			If akquest2.akpuppet.GetDistance(AKControlSimpleMarker) < 4000
				If islocal == False
					islocal = True
					playerref.MoveTo(AKControlSimpleMarker)
					playerref.DispelSpell(akinvisSpell)
				EndIf
			Else	
				If islocal == True
					akinvisSpell.Cast(playerref)
					isLocal = False
				EndIf
				akplatform.MoveTo(akquest2.akpuppet, 0, 0, 500)
				playerref.MoveTo(akplatform, 0, 0, 60)
			EndIf
		Else
			akplatform.MoveTo(akquest2.akpuppet, 0, 0, 500)
			playerref.MoveTo(akplatform, 0, 0, 60)
		EndIf
		RegisterForSingleUpdate(1.0)
	ElseIf MainChar == False
		RegisterForSingleUpdate(3.0)
	Else
		;debug.Notification("Update error, please report to Iceburg!")
	EndIf
EndEvent


