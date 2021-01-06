Scriptname AKPSLightScript extends ObjectReference  

;properties
keyword property magicdamagefire auto
keyword property magicdamagefrost auto
AKPLaceStaticQuestScript property akquestscript auto


Event OnMagicEffectApply(ObjectReference akCaster, MagicEffect akEffect)
;debug.notification("Object has been grabbed")

if akquestscript.akcandle == 0

	if akeffect.haskeyword(magicdamagefire)
		akquestscript.rotateobject = self as objectreference
		akquestscript.aklight()
		;debug.notification("fire candle")
	elseif akeffect.haskeyword(magicdamagefrost)
		akquestscript.rotateobject = self as objectreference
		akquestscript.aksnuff()
		;debug.notification("firesnuffed")
	endif
endif
endevent
