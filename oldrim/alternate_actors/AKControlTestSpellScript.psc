Scriptname AKControlTestSpellScript extends activemagiceffect 
message property akcontroltestfacemessage auto
Spell Property akControltestspell2 Auto
AKcontrolquestscript property akquest Auto
AKcontrolquest2script property akquest2 Auto
AK__QF_AKControlQuest_01000D92 property akquestfrag Auto
textureset property aktexture auto
textureset property aktexturetemp auto
;int[] property array1 auto
int I
int size
headpart temppart
Spell Property AbFamiliarFlameCloak Auto


Event OnEffectStart(Actor akTarget, Actor akCaster) 
actorbase akbasebase = aktarget.GetActorBase()
actorbase akcastbase = akcaster.GetActorBase()

;akcaster.AddSpell(AbFamiliarFlameCloak)
akquest2.AKFaceRecall(akcaster, aktarget, 10)

;aktarget.RemoveAllItems(akcaster)

; If akquest2.AKLoadScreenObject.HasNode("MagicNode")
	; Debug.Notification("HasNode!")
; EndIf
; If akcaster.HasNode("NPC L Hand [LHnd]")
	; Debug.Notification("player has node!")
; EndIf

;akcaster.GetActorBase().setfacetextureset(aktarget.GetActorBase().GetFaceTextureSet())
;akbasebase.setfacetextureset(akcaster.GetActorBase().GetFaceTextureSet())
;aktexturetemp = akcastbase.getfacetextureset()	
;debug.Notification("Dude's texture set = " + aktexturetemp)

; size = game.GetNumTintMasks()
; i = 0
; While i < size 
	;;aktintcolors[i] = game.GetNthTintMaskColor(i)
	; aktexture.SetNthTexturePath(i, game.GetNthTintMaskTexturePath(i))
	;;aktinttype[i] = Game.GetNthTintMaskType(i)
	; i += 1
; EndWhile
			
; akbasebase.setfacetextureset(aktexture)	;this function works
; aktarget.queueninodeupdate()

;akcastbase.setfacetextureset(aktexture)
;akcaster.queueninodeupdate()

; If akquest2.loadscreenon == False
; game.DisablePlayerControls(true,False,true,true,true, true, True, True)
	; akquest2.akloadscreenon()
; Else
	; akquest2.akloadscreenoFF()
	; game.EnablePlayerControls()
; EndIf

; int list = akbasebase.GetNumHeadParts()
; debug.Notification(list +" headparts!")
; debug.Notification(akcastbase.GetNumHeadParts() +" player headparts!")
; Debug.Notification("player is " + aktarget.GetRace().getname())

; Debug.Notification("Target Preset 0: " + akbasebase.getfacepreset(0))
; Debug.Notification("Target Preset 2: " + akbasebase.getfacepreset(2))
; Debug.Notification("Target Preset 3: " + akbasebase.getfacepreset(3))
; Debug.Notification("Player Preset 0: " + akcastbase.getfacepreset(0))
; Debug.Notification("Player Preset 2: " + akcastbase.getfacepreset(2))
; Debug.Notification("Player Preset 3: " + akcastbase.getfacepreset(3))
; i = 0
; While i < 19
	;;Morphlist[(Morphdex + i)] = akbasebase.getfacemorph(i)
	; Debug.Notification("Morph " + i + " = " + akcastbase.getfacemorph(i))
	; i += 1
; EndWhile

	;Debug.Notification("Test Spell Cast")
	; game.ShowTitleSequenceMenu()
	; Utility.Wait(2.5)
	; game.HideTitleSequenceMenu()
	;if GetMappedControl(278) == ""
	; if input.getmappedkey("Ready Weapon") == 278
		; Debug.Notification("Controller is plugged in")
	; Else
		; Debug.Notification("x button is" + GetMappedControl(278))
	; EndIf
	
	; Debug.Notification(input.getmappedKey("Jump", 2))
	; Int xkey = input.getmappedkey("Jump", 2) ;get remappable controller keys
	;input.tapkey(xkey)
	;input.tapkey(279)
	;aktarget.StopCombat()

	; size = akquest.akfaceplayer.getsize()
	;debug.Notification("Player Face has " +hp+ "parts.")
	; i = 0
	; ActorBase tempbase = akquest.akcontroltemp.GetActorBase()
	;akquest.akcontroltemp.SetRace(orcrace)
	; Debug.Notification(akquest.akcontroltemp.getname() + tempbase.getname())
	; WHILE i <= size
		; temppart = akquest.akfaceplayer.getat(i) as headpart
		; debug.notification("Part #:" + i + ", Part Name:" +temppart.getname() +", Part Type:" +temppart.gettype())
		; tempbase.setnthheadpart(temppart as headpart, i)
		; i += 1
	; EndWHILE
	; tempbase.setFacePreset(akquest.pnose, 0) ;remember the face presets of the puppet player
	; tempbase.setFacePreset(akquest.peyes, 2)
	; tempbase.setFacePreset(akquest.pmouth, 3)
	; akquest.akcontroltemp.SetRace(orcrace)
	; akquest.akcontroltemp.QueueNiNodeUpdate()



		; size = game.GetNumTintMasks()
		; i = 0
		; While i < size && i < 20
			; akquest.aktintcolors[i] = game.GetNthTintMaskColor(i)
			; akquest.aktintlist[i] = game.GetNthTintMaskTexturePath(i)
			; i += 1
		; EndWhile



;akquest.invisFXshader.play(game.getplayer(), 3.0)

;Actorbase testnpc = akquest2.AKNPCList[0]

; Debug.Notification("Remembered face: " + akquest2.AKNPCList[0].getname())
; Debug.Notification("Player Name: " + akquest.pname)
; Debug.Notification("Player Namebase: " + akcaster.GetActorBase().getname())

	;akquestfrag.alias_Remote1.forcerefto(aktarget)
	;utility.wait(1.0)
	;if akcontroltestfacemessage.show() > 0
;		Return
;	EndIf
	
	; debug.notification("Tintmasks Before: " +game.GetNumTintMasks())
	; utility.wait(0.2)
	; aktarget.setplayercontrols(true)
	; akcaster.setplayercontrols(false)
	; aktarget.enableai()
	; Game.SetCameraTarget(aktarget)
	; Game.ForceThirdPerson()
	; debug.notification("Tintmasks after: " +game.GetNumTintMasks())
	; utility.wait(0.2)
	; aktarget.setplayercontrols(False)
	; akcaster.setplayercontrols(True)

;int i = 0
;tapkey(getmappedkey("Console"))
;if isarray == False
;	array1 = new Int[11] 
;	while i < 10
;		Array1[i] = i
;	i += 1
;	EndWhile
;	Array1[10] = 5
;	isarray = True
;	debug.notification("array created")
;	utility.wait(0.1)
;	debug.notification("Should read 015: " + array1[0]+ array1[1]+ array1[10])
;EndIf

;	int list = aktarget.GetActorBase().GetNumHeadParts()
;	debug.Notification(list +" headparts!")
;	int index = 0
;	headpart temppart
;	ActorBase target = aktarget.GetActorBase()
;	ActorBase caster = akcaster.GetActorBase()
;	akquest.aksingletrait(aktarget, akcaster)
	
;	WHILE (index < list)
;		temppart = target.GetNthHeadPart(index)
;		debug.notification("Part #:" +index + ", Part Name:" +temppart.getname() +", Part Type:" +temppart.gettype())
		;caster.setnthheadpart(temppart, index)
;		index += 1
;	EndWHILE
;	int button = akcotnroltestfacemessage.show()
;	if button == 8
;	Return
;	EndIf
;	temppart = target.GetNthHeadPart(button)
;	int button2 = akcotnroltestfacemessage.show()
;	caster.setnthheadpart(temppart, button2)
;	akcaster.QueueNiNodeUpdate()
EndEvent



; Event OnInit()
	; RegisterForMenu("Console")
; EndEvent
 
; Event OnMenuOpen(String MenuName)
		; Debug.Notification("Console")
			; utility.WaitMenuMode(0.5)
			; tapkey(31) ;s
			 ; utility.WaitMenuMode(0.1)
			; tapkey(18) ;e
			 ; utility.WaitMenuMode(0.1)
			; tapkey(45) ;x
			 ; utility.WaitMenuMode(0.1)
			; tapkey(46) ;c
			 ; utility.WaitMenuMode(0.1)
			; tapkey(35) ;h
			 ; utility.WaitMenuMode(0.1)
			; tapkey(30) ;a
			 ; utility.WaitMenuMode(0.1)
			; tapkey(49) ;n
			 ; utility.WaitMenuMode(0.1)
			; tapkey(34) ;g
			 ; utility.WaitMenuMode(0.1)
			; tapkey(18) ;e
			 ; utility.WaitMenuMode(0.1)
			; tapkey(28) ;enter
			; utility.WaitMenuMode(0.1)
			; tapkey(getmappedkey("Console"))
; EndEvent