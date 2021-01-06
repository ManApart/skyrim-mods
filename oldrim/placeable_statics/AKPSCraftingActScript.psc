Scriptname AKPSCraftingActScript extends ObjectReference  

;properties
magiceffect property akgetstaticmagiceffect auto
AKPLaceStaticQuestScript property akquestscript auto


Event OnMagicEffectApply(ObjectReference akCaster, MagicEffect akEffect)
;debug.notification("Object has been grabbed")
if akeffect == akgetstaticmagiceffect
	akquestscript.rotateobject = self as objectreference
	akquestscript.akselectCraftingAct()
endif
endevent


Event OnActivate(ObjectReference akActionRef)
	akquestscript.rotateobject = self as objectreference
	akquestscript.akselectCraftingAct()
endevent