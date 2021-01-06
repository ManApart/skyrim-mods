Scriptname AKControlQuest2Script extends Quest
;2nd quest script - handles all support functions
AKControlQuestScript property akquest Auto
AKControlMCMScript property akquestmcm Auto

actor[] property AKNPCList auto 		;10 characters, + player = 10 and Current NPC temp = 11
Race[] property AKNPCRaceList auto
String[] property AKNPCNameList auto
headpart[] property AKNPCHeadpartList auto
Float[] property AKNPCMorphList auto
Float[] property AKNPCMorphList2 auto
int[] property AKNPCPresetList auto
colorform[] Property AKNPCColorList Auto
textureset[] Property AKNPCTextureSetList Auto

ObjectReference Property AKLoadScreenObject Auto
ObjectReference Property MAGINVIceSpellArt Auto
ObjectReference Property AKCLoadMarker Auto

;variables for simple control
int property akleftattack auto		;left attack button
int property akrightattack auto		;right attack button
int property akshoutattack auto		;shout button (return)
int property akspecialattack auto	;special move

String Property akrightstring Auto		;the anim event asigned to the right attack
String Property akleftstring Auto		;the anim event asigned to the left attack
String Property akspecialstring Auto	;the anim event asigned to the special attack
Float Property cooldown Auto			;time between spamming spells

formlist Property akactivatelist Auto	;list of things to activate in this cell

actor property akpuppet Auto		;the puppet we're controlling
;actor property AKCDeadBody Auto		;the dead player
Actor Property playerref Auto		;The player!
Race Property orcrace Auto			;used to make headless player have head again
Race Property nordrace Auto

Spell Property AKCActivateSpell Auto	;so puppets can activate objects
Spell Property aklefthandspell Auto			;puppet's lefthand spell
Spell Property akrighthandspell Auto		
Spell Property akspecialspell Auto		

bool property issaving Auto					;is the player saving their face?
bool property isworking Auto				;store/recall face is working
bool property isdropping Auto				;bodydrop is working
bool property iskeydown Auto				;cooldown so creatures can't spam spells
int property akloadscreen = -1 Auto				;is the loadscreen on? -1 == false, 0=working, 1 = on

message property akfaceoutofmemory Auto
message property aksavefacemessage Auto

Activator Property selfbase Auto

actorbase aknewbase
actorbase akbasebase
ActorBase tempbase
actorbase playerbase ;the player's actor base, cause you know, that seems useful
int i 				;used for indexes all around the world!
int size			;used for the size of indexes
int hp 				;number of headparts
int hp2 			;number of headparts2
int typecount 		;used as an index / facetype for loops looking for correct face parts
headpart temppart
Actor tempact		;the actor version of tempbase
race temprace

;Initiation Function -----------------------------------------------------------------------------------
;used to initialize arrays
Event OnInit()
Debug.Notification("Save and reload to start Alternate Actors!")
EndEvent

;Maintanence Function -----------------------------------------------------------------------------------
;run on load- reappplies temp face parts
function akmaintenance()

If akquest.akmodversion < 1.2
	if akquest.akmodversion == 1.1 || akquest.akmodversion == 1.0
		Debug.MessageBox("Revert, then make a clean save to start Alternate Actors!")
		Return
	Else
	
	If akquestmcm.LoreFriendly == False
		playerref.AddSpell(akquest.akcontrolmorphspell, false)
		playerref.AddSpell(akquest.akcontrolsimplespell, false)
		playerref.AddSpell(akquest.akcontrolremotespell, false)
	EndIf
	playerref.AddSpell(akquest.akcontrolsaveremotespell, false)
	
	AKNPCHeadpartList = new headpart[120]			;10 slots per character.
	AKNPCList = new Actor[12]						;10 characters, + player = 10 and NPC temp = 11
	AKNPCColorList = new colorform[12]				;1 hair color per character
	AKNPCRaceList = New Race[24]					;2 per char. new and orig
	AKNPCNameList = New String[24]					;2 per char. new and orig
	AKNPCMorphList = New Float[114]					;facemorphs for first 6 chars
	AKNPCMorphList2 = New Float[114]				;19 morphs per character, several per facepart
	AKNPCPresetList = New Int[36]					;3 presets per character
	;AKNPCTextureSetList = New textureset[10]		;1 textureset per character ;does not work for face tint, only skin
	
	akquest.AKTempFactionRanks = new int[15]		;rank slots for the 15 basic faction ranks
	akquest.AKTempFactionRanksNPC = new int[15]
	akquest.AKTintList = New String[50]
	akquest.AKTintColors = New Int[50]
	akquest.AKTintType = New Int[50]
	
	akquest.akmodversion = 1.2
	debug.Notification("Welcome to Alternate Actors " + akquest.akmodversion + "!")	
	EndIf
EndIf

if akquest.MainChar == False ;uh oh, we loaded a game where the player is playing an alternate actor!
	utility.wait(1.0)
	Debug.Notification("Playing as alternate actor!")
	npcdex = 11	;Current NPC's reserved slot
	playerbase = playerref.GetActorBase()
	playerref.disable()
	playerbase.sethaircolor(AKNPCColorList[npcdex])
	facesize = (((npcdex + 1) * 10)- 1) 
	facedex = (facesize - 9)
	i = 0
	while facedex <= facesize
		playerbase.setnthheadpart(AKNPCheadpartlist[facedex] as headpart, i)
		;debug.notification("Place part #:" +i + ", Part Name:" +AKNPCheadpartlist[facedex].getname() +", Part Type:" +AKNPCheadpartlist[facedex].gettype())
		facedex += 1
		i += 1
	EndWhile
	playerref.QueueNiNodeUpdate()
	playerref.enable()
EndIf
;alright, now update everybody else.
npcdex = 0
While npcdex < 11
	tempact = aknpclist[npcdex] as Actor
	If tempact != None ;no point running the loop on non existant npcs!
		AKFaceRecall(tempact, tempact, npcdex)
	EndIf
	npcdex += 1
EndWhile
EndFunction


;Remember Face Functions -----------------------------------------------------------------------------------
int npcdex 			;what npc are we looking at? 
int npcsize			;how many npcs are there? -Not really needed since we're stuck with 10
int facedex			;what facepart are we looking at?
int facesize		;basically facedex + 10 - when we should start looking at the next npc
Int racedex			;used for names and for races, goes by two to afford a backup
Int presetdex		;used for presets
Int morphdex		;Used to store face morphs
Float[] morphlist	;which morphlist to save to?

Function AKNPCFaceUpdate() ;save's and updates 1 NPC
if akquest.MainChar == False && issaving == False
	issaving = True
	If akquest.origionalnpc.GetActorBase().getnumheadparts() == 0
		Debug.Notification("You can't remember leveled actors!")
		Return
	EndIf
	i =	aksavefacemessage.show()
	if i == 0		
		;akquest.akcontrolclonemarkertemp.moveto(akquest.origionalnpc)	
		AKNPCdexFind(akquest.origionalNPC)
		; we now have the npcdex of where the npc's face will be saved
		AKFaceStore(akquest.playerref, akquest.origionalnpc, npcdex)
		While isworking == True
			Utility.Wait(0.1)
		EndWhile
		AKFaceRecall(playerref, akquest.origionalnpc, npcdex)
		issaving = False
		debug.Notification("Face saved!")
	ElseIf i == 2	;updating the main character
		If npcdex > -1 && npcdex < 10
			AKNPCFaceDelete(NPCdex)	;don't want the main character to take up a faces tab!
		EndIf
		If akquest.akisdead == 0	;the controltemp is alive. Remember them or stop process from happening
			If AKNPCdexFind(akquest.akcontroltemp) == -1	;if there are no slots, kill this thing
				Debug.Notification("No available slots to remember your old main character!")
				issaving = False
				Return
			Else
				AKFaceStore(akquest.akcontroltemp, akquest.akcontroltemp, npcdex) ; remember the control temp
				While isworking == True
					Utility.Wait(0.1)
				EndWhile
			EndIf
		Else	
			;Debug.Notification("Your old main character is dead!")
		EndIf
		akquest.akcontroltemp = akquest.origionalnpc	;the controltemp is the npc
		AKFaceStore(playerref, akquest.akcontroltemp, 10) ;save new player stats
		While isworking == True
			Utility.Wait(0.1)
		EndWhile
		AKFaceRecall(playerref, akquest.akcontroltemp, 10)	;Update new NPC
		While isworking == True
			Utility.Wait(0.1)
		EndWhile
		akquest.akquestfrag.alias_ControlTemp.clear()
		akquest.akquestfrag.alias_ControlTemp.ForceRefTo(akquest.akcontroltemp) 	;fill the control temp ref
		akquest.origionalnpc = None
		akquest.akisdead = 0
		akquest.mainchar = True
		playerref.RemoveSpell(akquest.akcontrolSaveFaceSpell)
		playerref.RemoveSpell(akquest.akcontrolrevertspell)
		issaving = False
		debug.Notification("Main character updated!")
	EndIf
ElseIf issaving == True
	Debug.Notification("Save Already in Progress")
Else
	Debug.Notification("You're not controlling an NPC!")
EndIf
EndFunction

Int Function AKNPCdexFind(Actor akbase)
npcdex = aknpclist.find(akquest.origionalnpc)
;save the NPC's data to the right slot
if npcdex < 0 || NPCdex > 9 ;NPC not in list, add them to a blank slot. Slots 10 and 11 are reserved
	npcdex = 0
	npcsize = 10 ; should always be 10
	while aknpclist[npcdex] != None && npcdex < npcsize ; look for an empty spots
		npcdex += 1
	EndWhile
	if aknpclist[npcdex] == None ;while ended because we found a blank slot. yay!
	Else ;No blank slots found!
		akfaceoutofmemory.show()
		Return -1
	EndIf
Else ;NPC is in list, let's update them
EndIf
Return NPCdex
EndFunction

Function AKFaceStore(Actor akbase, Actor aknew, Int slot)
isworking == True
npcdex = slot
aknewbase = aknew.GetActorBase()
If aknewbase.getnumheadparts() == 0	
	aknewbase = aknew.GetLeveledActorBase()
EndIf
akbasebase = akbase.GetActorBase()
If akbasebase.getnumheadparts() == 0	;make sure we have the right base for leveled actor/non leveled actor
	akbasebase = akbase.GetLeveledActorBase()
EndIf

;basic stats
aknpclist[npcdex] = aknew
AKNPCColorList[npcdex] = akbasebase.gethaircolor()


facesize = (((npcdex + 1) * 10)- 1) ;get the facedex when we should move to next npc. npcdex of 0 gives 9, 1 gives 19, etc
facedex = (facesize - 9)			;Get the facedex we should start with for this npc
racedex = (((npcdex + 1) * 2)- 1)	;2 slots, 1 for name, 1 for backup. npcdex of 0 gives 1, 11 gives 23
presetdex = (((npcdex + 1) * 3)- 1)	;3 slots per char. npcdex of 0 gives 2, 11 gives 35
If npcdex < 6
	morphdex = npcdex
	morphlist = AKNPCMorphList
Else
	morphdex = (npcdex - 6)
	morphlist = AKNPCMorphList2
EndIf

AKNPCNameList[racedex] = akbasebase.getname()
AKNPCNameList[racedex + 1] = aknewbase.getname()
AKNPCRaceList[racedex] = akbasebase.GetRace()
AKNPCRaceList[racedex + 1] = aknewbase.GetRace()

;AKNPCTextureSetList[NPCdex] = akbasebase.getfacetextureset()

;grab presets, if they're not default
i = akbasebase.getfacepreset(0)
If i != -1
	AKNPCPresetList[presetdex] = i
EndIf
i = akbasebase.getfacepreset(2)
If i != -1
	AKNPCPresetList[presetdex - 1] = i
EndIf
i = akbasebase.getfacepreset(3)
If i != -1
	AKNPCPresetList[presetdex - 2] = i
EndIf


;Debug.Notification(akbasebase.getname() + "Presets =" +AKNPCPresetList[(npcdex)]+AKNPCPresetList[(npcdex + 1)]+AKNPCPresetList[(npcdex + 2)] )
i = 0
typecount = 6
hp = akbasebase.GetNumHeadParts()
hp2 = aknewbase.getnumheadparts()
while typecount != 7 && facedex <= facesize  ;loop for all 6 part types. Stop recording if over 10 headparts 
	WHILE i < hp
		temppart = akbasebase.getnthheadpart(i)
		if temppart.gettype() == typecount ;find's the headpart of the right type
			AKNPCHeadpartlist[facedex] = temppart
			;debug.notification("Record part #:" +i + ", Part Name:" +temppart.getname() + "To slot: " + facedex +", Part Type:" +temppart.gettype())
			facedex += 1
		EndIf
		i += 1 
	EndWHILE
	i = 0
	;typecount +=1 ;we need the right type order
	if typecount == 6
		typecount = 1
	elseif typecount == 1
		typecount = 2
	elseif typecount == 2
		typecount = 3
	elseif typecount == 3
		typecount = 4
	elseif typecount == 4
		typecount = 0
	elseif typecount == 0
		typecount = 5
	elseif typecount == 5
		typecount = 7	;end this madness!
		EndIf
EndWhile

;clear bad headparts
if hp > hp2 ;base has more parts than new
	;this is bad because the newbase can't display all of the donor's faceparts
elseif hp < hp2 ;new has more than base
	;this is bad because the new parts may not overright all of the old parts, meaning leftover parts on the character.
	temppart = akquest.AKCONTROLBlanknpc.getnthheadpart(1) 
	while facedex <= facesize
		AKNPCHeadpartlist[facedex] = temppart
		facedex += 1
	EndWhile
EndIf

;save face morphs. Credit to Expired's Racemenu mod. I found the getfacemorph function while looking at his script.
;Also, it was looking at his script alongside the Creation Kit that made me realize that face morphs are not 1 per headpart,
;but 2 or 3 (based on the actors tab Char Gen Morphs sliders)

i = 0
float tempmorph
While i < 19
	tempmorph = akbasebase.getfacemorph(i)
	if tempmorph < 10.0		;only take the morph if it isn't default (daft values, wut wut)
		Morphlist[(Morphdex + i)] 
	EndIf
	;Debug.Notification(akbasebase.getname() + "morph " + i + " = " + akbasebase.getfacemorph(i))
	i += 1
EndWhile
isworking == False
EndFunction

Function AKFaceRecall(Actor akbase, Actor aknew, Int slot)
isworking == True
;Disable the actor so you can update his looks / race etc
;aknew.disable()

;change traits and head parts-------------------------------
npcdex = slot
aknewbase = aknew.GetActorBase()
If aknewbase.getnumheadparts() == 0	
	aknewbase = aknew.GetLeveledActorBase()
EndIf
akbasebase = akbase.GetActorBase()
If akbasebase.getnumheadparts() == 0	;make sure we have the right base for leveled actor/non leveled actor
	akbasebase = akbase.GetLeveledActorBase()
EndIf

;set presets so they're set, see...
presetdex = (((npcdex + 1) * 3)- 1)	;3 slots per char. npcdex of 0 gives 2, 11 gives 35
aknewbase.setfacepreset(AKNPCPresetList[presetdex], 0)
aknewbase.setfacepreset(AKNPCPresetList[(presetdex - 1)], 2)
aknewbase.setfacepreset(AKNPCPresetList[(presetdex - 2)], 3)
;aknewbase.setfacetextureset(AKNPCTextureSetList[NPCdex])	
aknewbase.sethaircolor(AKNPCColorList[npcdex])

;set proper morphs
If npcdex < 6
	morphdex = npcdex
	morphlist = AKNPCMorphList
Else
	morphdex = (npcdex - 6)
	morphlist = AKNPCMorphList2
EndIf
i = 0
While i < 19
	aknewbase.setfacemorph(Morphlist[(Morphdex + i)], i)
	;Debug.Notification("Morph " + i + " set to: " + Morphlist[(Morphdex + i)])
	i += 1
EndWhile

;recall the proper headparts
facedex = ((((npcdex + 1) * 10)- 1) - 9) ;facesize - 9	= facedex
facesize = (facedex + hp)
i = 0
while facedex <= facesize
	aknewbase.setnthheadpart(AKNPCheadpartlist[facedex] as headpart, i)
	;debug.notification("Place part #:" +i + ", Part Name:" +AKNPCheadpartlist[facedex].getname() +", Part Type:" +AKNPCheadpartlist[facedex].gettype())
	facedex += 1
	i += 1
EndWhile

racedex = (((npcdex + 1) * 2)- 1)
aknewbase.setname(AKNPCNameList[racedex])
If akbase.GetRace() == AKNPCRaceList[racedex]	;if both char's race are the same, changes aknew's race so they'll update
temprace = AKNPCRaceList[racedex]
	If temprace != orcrace
		aknew.SetRace(orcrace)
	Else
		aknew.SetRace(nordrace)
	EndIf
EndIf
aknew.SetRace(AKNPCRaceList[racedex])
aknew.QueueNiNodeUpdate()
;aknew.enable()
isworking == False
EndFunction

Function AKNPCFaceDelete(int slot)
;delete a face and free up the slot, probably called by the MCM menu
racedex = (((slot + 1) * 2))	;added 1 to normal racedex, will give us the backup
tempbase = aknpclist[slot].GetActorBase()
aknpclist[slot].SetRace(AKNPCRaceList[racedex]) 	;reset race
tempbase.Setname(AKNPCNameList[racedex])	;reset name
aknpclist[slot] = None
facesize = (((slot + 1) * 10)- 1) ;get the facedex when we should move to next npc. slot of 0 gives 9, 1 gives 19, etc
facedex = (facesize - 9)			;Get the facedex we should start with for this npc
AKNPCColorList[slot] = None

WHILE facedex <= facesize 
	AKNPCHeadpartlist[facedex] = None
	AKNPCMorphList[facedex] = 0.0
	facedex += 1
EndWHILE
EndFunction

;Console/ RaceMenu Functions -----------------------------------------------------------------------------------
Event OnMenuOpen(String MenuName)
if menuname == "Console"
	;if sexchange == True
	;	sexchange = False
		;Debug.Notification("Quest Console")
		utility.WaitMenuMode(0.5)
		input.tapkey(25) ;p
		utility.WaitMenuMode(0.1)
		input.tapkey(38) ;l
		utility.WaitMenuMode(0.1)
		input.tapkey(30) ;a
		utility.WaitMenuMode(0.1)
		input.tapkey(21) ;y
		utility.WaitMenuMode(0.1)
		input.tapkey(18) ;e
		utility.WaitMenuMode(0.1)
		input.tapkey(19) ;r
		utility.WaitMenuMode(0.1)
		input.tapkey(52) ;.
		utility.WaitMenuMode(0.1)
		input.tapkey(31) ;s
		utility.WaitMenuMode(0.1)
		input.tapkey(18) ;e
		utility.WaitMenuMode(0.1)
		input.tapkey(45) ;x
		utility.WaitMenuMode(0.1)
		input.tapkey(46) ;c
		utility.WaitMenuMode(0.1)
		input.tapkey(35) ;h
		utility.WaitMenuMode(0.1)
		input.tapkey(30) ;a
		utility.WaitMenuMode(0.1)
		input.tapkey(49) ;n
		utility.WaitMenuMode(0.1)
		input.tapkey(34) ;g
		utility.WaitMenuMode(0.1)
		input.tapkey(18) ;e
		utility.WaitMenuMode(0.1)
		input.tapkey(28) ;enter
		utility.WaitMenuMode(0.1)
		UnRegisterForMenu("Console")
		input.tapkey(input.getmappedkey("Console", 0))
	;EndIf
elseif menuname == ("RaceSex Menu")
	if akquest.inprogress == 1
		;Int xkey = input.getmappedkey("Ready Weapon") ;get remappable controller keys

		if input.getmappedkey("Ready Weapon") == 278  ;player is using controller		
			If akquestmcm.Debugmode == False
				akloadscreenOFF()
			EndIf
		EndIf
		While akquest.inracemenu == True ;used to loop, make keyboard proof
			;Debug.Notification("Quest Racemenu")
			utility.WaitMenuMode(0.5)
			input.tapkey(19) ;r (to finish character Creation, go to name menu)
			utility.WaitMenuMode(0.2)
			input.tapkey(28) ;enter (Finish and save character? Yes Please!)
			utility.WaitMenuMode(0.2)
			input.tapkey(30) ;a (name character
			utility.WaitMenuMode(0.1)
			input.tapkey(28) ;enter (save name and finish racemenu)
			utility.WaitMenuMode(0.5)
		EndWhile
		if akquestmcm.Debugmode == False && input.getmappedkey("Ready Weapon") == 278 ;toggle menus back off so script can turn them back on. Crazy, I know.
			debug.ToggleMenus()
		EndIf
	EndIf
EndIf
EndEvent

Event OnMenuClose(String MenuName)
if menuname == ("RaceSex Menu") 
	If akquest.MainChar == False && akquest.inprogress == False && akquest.inracemenu == False
		AKNPCFaceUpdate()
	ElseIf akquest.inracemenu == True
		akquest.inracemenu = False
		;debug.Notification("Set false!")
	EndIf
EndIf
EndEvent

;Simple Control Animal Functions -----------------------------------------------------------------------------------
Event OnKeyDown(Int KeyCode)
If iskeydown == False
	iskeydown = True
	if keycode == akshoutattack && utility.IsInMenuMode() == False ;return/revert the player
		;debug.Notification("Shout Attack!")
		If akquestmcm.lorefriendly == True
			akquest.aksimpleRevert(akpuppet, True)
		Else
			akquest.aksimpleRevert(akpuppet, False)
		EndIf
	elseif keycode == akrightattack		;-------------------------------------------------------
		;debug.Notification("Right Attack!")
		Debug.SendAnimationEvent(akpuppet, akrightstring)
		Utility.Wait(cooldown)
		If akrighthandspell != None
			akrighthandspell.Cast(akpuppet)
		EndIf
		;Debug.SendAnimationEvent(akpuppet, "attackStart")		
	elseif keycode == akleftattack ;-------------------------------------------------------
		;debug.Notification("Left Attack!")
		Debug.SendAnimationEvent(akpuppet, akleftstring)
		Utility.Wait(cooldown)		
		If aklefthandspell != None
			aklefthandspell.Cast(akpuppet)
		EndIf		
	elseif keycode == akspecialattack ;-------------------------------------------------------
		;debug.Notification("Special Attack!")
		Debug.SendAnimationEvent(akpuppet, akspecialstring)
		Utility.Wait(cooldown)
		If akspecialspell != None
			akspecialspell.Cast(akpuppet)
		EndIf	
	EndIf
	iskeydown = False
EndIf
EndEvent

Function AKRevertPoll()
If((Utility.GetCurrentRealTime() - akquest.akstarttime) > akquest.akdurationtime) ;player has overstayed their welcome
	debug.Notification("Stayed too long!")
	If akquest.MainChar == False
		akquest.akRevert(akquest.playerref, True)
		Return
	ElseIf akquest.MorphedSimple == True
		akquest.aksimpleRevert(akpuppet, True)
		akquest.akplatform.MoveTo(akquest.AKControlCloneMarker) ;move the platform out of the way
		Return
	EndIf	
EndIf
EndFunction

Function AKDoorCount()
akactivatelist.revert()
i = 0
cell akcell = akpuppet.GetParentCell()
Activator tempform
int cellcount = akcell.getnumrefs(29) ;get num of doors and add to list
;Debug.Notification(cellcount + " doors in the cell!")
While i < cellcount
	akactivatelist.AddForm(akcell.getnthref(i, 29).GetBaseObject())
	i += 1
EndWhile

i = 0
cellcount = akcell.getnumrefs(24) ;get num of Activators and add to list
;Debug.Notification(cellcount + " activators in the cell!")
While i < cellcount
	tempform = akcell.getnthref(i, 24).GetBaseObject() as Activator
	If tempform != selfbase
		akactivatelist.AddForm(tempform)
	EndIf
	i += 1
EndWhile

; i = 0
; cellcount = akcell.getnumrefs(40) ;get num of furnature and add to list
;Debug.Notification(cellcount + " furnatures in the cell!")
; While i < cellcount
	; akactivatelist.AddForm(akcell.getnthref(i, 40).GetBaseObject())
	; i += 1
; EndWhile
EndFunction

;Drop the dragonborn's body to be looted
Function AKDropBody(Actor akdying, Actor AKCDeadBody = None)
If isdropping == False
	isdropping = True
	akquest.AKControlMarkerDead.MoveTo(akdying)
	Utility.Wait(0.1)
	If akloadscreen == -1 && akquestmcm.Debugmode == False
		akloadscreenOn()
		While akloadscreen == 0
			Utility.Wait(0.1)
		EndWhile
	EndIf
	;Debug.MessageBox("Your main character has died!")
		
	If AKCDeadBody == None
		;Debug.MessageBox("No predefined dead body.")
		If akdying.GetActorBase().GetSex() == 0
			AKCDeadBody = akquest.akcontroltempmaledead
		Else
			AKCDeadBody = akquest.akcontroltempfemaledead
		EndIf
	EndIf
	AKCDeadBody.Resurrect()
	;Debug.MessageBox("Body Found")
	AKCDeadbody.MoveTo(akquest.AKControlMarkerDead)
	akquest.AKTraitTransfer(AKDying,  AKCDeadBody)
	While akquest.transfering == True
		Utility.Wait(0.1)
	EndWhile
	If akdying.IsDead() == True
		akdying.Resurrect()
	EndIf
	Utility.Wait(0.1)
	AKFaceRecall(AKDying, AKCDeadBody, 10)	;impose controltemp/player traits on body
	Utility.Wait(0.1)
	AKCDeadbody.Kill()
	;Debug.MessageBox("body replaced")
	akquest.akcontroltemp.MoveToMyEditorLocation()
	AKDying.RestoreActorValue("Health", AKDying.GetbaseActorValue("Health")) ;restore to full health
	if akquestmcm.Debugmode == False
		AKLoadScreenOFF()
		While akloadscreen == 0
			Utility.Wait(0.1)
		EndWhile
	EndIf
	;Debug.MessageBox("body drop done")
	isdropping = False
EndIf
EndFunction


Function AKLoadScreenON()
akloadscreen = 0	;in progress
;Debug.MessageBox("Loadscreen on")
akquest.akplatform.MoveTo(playerref, 0, 0, 800, False)
AKCLoadMarker.MoveTo(playerref)
Utility.Wait(0.1)
Game.ForceFirstPerson()
game.ShowFirstPersonGeometry(False)
playerref.MoveTo(akquest.akplatform, 0, 0, 150)
;playerref.SetAngle(0,0,0)
AKLoadScreenObject.MoveTo(akquest.akplatform, 0, 400, 100, False)
Utility.Wait(0.1)
debug.ToggleMenus()
MAGINVIceSpellArt.MoveToNode(AKLoadScreenObject, "MagicNode")
akloadscreen = 1	;loadscreen is on
EndFunction

Function AKLoadScreenOFF()
akloadscreen = 0
;Debug.MessageBox("Loadscreen oFF")
;Debug.Notification("Loadscreen off")
playerref.MoveTo(AKCLoadMarker)
game.ShowFirstPersonGeometry()
AKLoadScreenObject.MoveToMyEditorLocation()
akquest.akplatform.MoveToMyEditorLocation()
debug.ToggleMenus()
MAGINVIceSpellArt.MoveToMyEditorLocation()
akloadscreen = -1
EndFunction