Scriptname AKfRingoftimebloodscript extends ObjectReference  
miscobject property akitem auto
spell property akspell1 auto
spell property akspell2 auto
armor property akring auto


Event OnSpellCast(Form akSpell)

 Spell spellCast = akSpell as Spell
if (Game.GetPlayer().IsEquipped(akring))
 	 if spellCast && spellCast == akspell1 
		;debug.messagebox("Shouted. Adding drop of timeblood")
		Game.GetPlayer().AddItem(akitem, 1, true)

	elseif spellCast && spellCast == akspell2 
		Game.GetPlayer().AddItem(akitem, 2, true)

  	endIf
endif
endEvent

;akcaster.removeitem(akitem, 1)
;akcaster.removeitem(akitem, 1)