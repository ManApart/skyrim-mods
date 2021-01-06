Scriptname AKPaintingViewScript extends ObjectReference  

AKPaintingInSkyrimQuestScript property akquest auto
magiceffect property akmagiceffectstudypainting auto
;property for wearing something to activate the analyze menu
spell property akbuff auto



Event OnMagicEffectApply(ObjectReference akCaster, MagicEffect akEffect)
if akeffect == akmagiceffectstudypainting
	akquest.akviewpainting(akbuff, (self as objectreference))
endif
endevent


