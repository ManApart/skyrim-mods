Scriptname AKPSFurnitureScriptHF extends ObjectReference  

;properties
magiceffect property akgetstaticmagiceffect auto
AKPLaceStaticQuestScripthf property akquestscripthf auto

Event OnMagicEffectApply(ObjectReference akCaster, MagicEffect akEffect)
;debug.notification("Object has been grabbed")
if akeffect == akgetstaticmagiceffect
		akquestscripthf.rotateobject = self as objectreference
		akquestscripthf.akselectfurnitureHF()
endif
endevent



