Scriptname AKPaintingInSkyrimQuestScript extends Quest  

message property akpaintingviewmessage auto
formlist property akpaintingbuffs auto
int property doonce auto
weapon property akBPScrollPaintingAnimation auto
spell myspell
weapon myweapon

function akviewpainting(spell akspell, objectreference akcaster)

;check Left hand
;if game.getplayer().GetEquippedItemType(0) != 0 && game.getplayer().GetEquippedItemType(0) != 9
;	debug.Notification("You cannot study a painting with weapons equipped!")
;	return
;check right hand
;elseif game.getplayer().GetEquippedItemType(1) != 0 && game.getplayer().GetEquippedItemType(1) != 9
;	debug.Notification("You cannot study a painting with weapons equipped!")
;	Return
;else

if game.getplayer().isweapondrawn()
	debug.notification("You can't study a painting with your weapons out!")
else

	if doonce == 0
		doonce = 1
		
		
		int button = akpaintingviewmessage.show()
		;view painting
		if button == 0
			;debug.notification("Analyzing Painting")
			;game.getplayer().PlayIdle(IdleStop_Loose)
			Debug.SendAnimationEvent(game.getplayer(),"IdleForceDefaultState")

			;animation block
			Game.ForceThirdPerson()
			game.DisablePlayerControls(true, true, true, false, true, true, true, false,  0)	
			int random = Utility.RandomInt(0, 10)
			if random <= 4
				debug.SendAnimationEvent(game.getplayer(), "IdleExamine")
				;debug.notification("Examine")
			else	
				debug.SendAnimationEvent(game.getplayer(), "IdleStudy")
				;debug.notification("Study")
			endif

			;remove old painting buffs
			int max = akpaintingbuffs.getsize() - 1
			int index = -1
			while index <= max
				(game.getplayer() as actor).dispelspell((akpaintingbuffs.getat(index) as spell))
				index = (index + 1)
			endwhile

			;add new buff to player
			akspell.cast(akcaster, game.getplayer())		

			;stop the animation
			utility.wait(2.0)
			Game.EnablePlayerControls()
			game.getplayer().drawweapon()

		;	if game.getplayer().GetEquippedItemType(1) == 9
		;		myspell = game.getplayer().GetEquippedSpell(1)
		;		game.getplayer().UnequipSpell(myspell, 1)
		;		game.getplayer().equipSpell(myspell, 1)
		;	else 
		;		if game.getplayer().GetEquippedWeapon(1) == none
		;			game.getplayer().equipitem(akBPScrollPaintingAnimation, false, true)	
		;		endif
		;		myweapon = game.getplayer().GetEquippedWeapon(1)
		;		game.getplayer().UnequipItem(myweapon, false, true)
		;		game.getplayer().equipitem(myweapon, false, true)					
		;	endif	
		
		;exit
		elseif button == 1
			;debug.notification("Returning")
			doonce = 0
			return
		endif
		doonce = 0
	else
		debug.notification("You haven't finished studying the last painting yet!")
	endif

endif
endfunction



;Notes:

;other anims that could play (maybe do a random effect):
;(make sure these are the proper names by gameplayer>animation)
;IdleStudy
;IdleStudy_exit
;can't find grave -game equivalent
;idlegrave_01
;idlegrave_02


;debug.SendAnimationEvent(game.getplayer(), "IdleExamine")

;Working anim script
;debug.SendAnimationEvent(game.getplayer(), "DeathAnim")

;Action idle > NPCIDLEROOT > NonCombatIdles > SittingIdleRoot


		;loose anim
		;game.getplayer().playanimation("IdleDrink")

		;debug.SendAnimationEvent(game.getplayer(), "idleChairVar2")
		;debug.SendAnimationEvent(game.getplayer(), "DeathAnim")

		;using stool to force animation (Works, use if idle examin doesn't.)
		;akstool = game.getplayer().placeatme(akstoolbase)
		;akstool.activate(Game.GetPlayer())


;OLD SPELL REEQUIP BLOCK

;	if game.getplayer().GetEquippedSpell(1)
;				myspell = game.getplayer().GetEquippedSpell(1)
;				game.getplayer().UnequipSpell(myspell, 1)
;				game.getplayer().equipSpell(myspell, 1)
;			elseif game.getplayer().GetEquippedSpell(0)
;				myspell = game.getplayer().GetEquippedSpell(0)
;				game.getplayer().UnequipSpell(myspell, 0)
;				game.getplayer().equipSpell(myspell, 0)
;			endif	

