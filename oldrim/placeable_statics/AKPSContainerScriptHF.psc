Scriptname AKPSContainerScriptHF extends ObjectReference  

;properties
magiceffect property akgetstaticmagiceffect auto
AKPLaceStaticQuestScriptHF property akquestscriptHF auto

Event OnMagicEffectApply(ObjectReference akCaster, MagicEffect akEffect)
;debug.notification("Object has been grabbed")
if akeffect == akgetstaticmagiceffect
		akquestscriptHF.rotateobject = self as objectreference
		akquestscriptHF.akSelectContainerHF()
endif
endevent

