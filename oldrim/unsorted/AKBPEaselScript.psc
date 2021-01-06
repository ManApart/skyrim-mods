Scriptname AKBPEaselScript extends ObjectReference  
miscobject property akpaintbrushset auto
spell property akstudypaintingspell auto
objectreference property DaGeeEasel auto
magiceffect property akmagiceffectstudypainting auto
book property AKPEaselClutter auto
int button

Event OnActivate(ObjectReference akActionRef)
game.getplayer().addspell(akstudypaintingspell)

;paint
if game.getplayer().getitemcount(akpaintbrushset) < 1
	debug.notification("You need a paintbrush set in order to paint!")
endif
endevent

Event OnMagicEffectApply(ObjectReference akCaster, MagicEffect akEffect)
;pack up
if akeffect == akmagiceffectstudypainting
	if self == DaGeeEasel
		debug.notification("You can't take Gee Da's easel!")
		return
	else
		game.getplayer().additem(AKPEaselClutter)
		self.delete()
		return
	endif
endif
endevent
