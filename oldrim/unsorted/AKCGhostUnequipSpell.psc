Scriptname AKCGhostUnequipSpell extends ReferenceAlias  
Keyword property akcmorpheffect Auto
Keyword property akcmorphsimpleeffect Auto

Event OnObjectEquipped(Form akBaseObject, ObjectReference akReference)
if akBaseObject as Weapon
	Self.GetactorReference().UnequipItem(akbaseobject, False, True)
	Utility.Wait(0.1)	;so that they see the debug.
    Debug.Trace("The weapon slips through your fingers!")
	
ElseIf akbaseobject as Spell 
	Spell myspell = (akbaseobject as Spell)
	int n = myspell.GetCostliestEffectIndex()
	MagicEffect mEffect = (myspell).GetNthEffectMagicEffect(n)
	If mEffect.HasKeyword(akcmorpheffect) || meffect.HasKeyword(akcmorphsimpleeffect)	;casting proper spell
		;Debug.Notification("Morphspell!")
	Else
		self.GetActorReference().UnequipSpell(myspell, 0)
		self.GetActorReference().UnequipSpell(myspell, 1)
		Utility.Wait(0.1)
		Debug.Trace("You can't seem to focus on the spell!")
		
	EndIf
endIf
endEvent
