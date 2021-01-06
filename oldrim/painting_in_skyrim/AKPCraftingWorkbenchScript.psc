Scriptname AKPCraftingWorkbenchScript extends ObjectReference  


spell property akstudypaintingspell auto
objectreference property DaGeeWorkbenchl auto
magiceffect property akmagiceffectstudypainting auto
book property AKPCraftingTableClutter auto
int button



Event OnMagicEffectApply(ObjectReference akCaster, MagicEffect akEffect)
;pack up
if akeffect == akmagiceffectstudypainting
	if self == DaGeeWorkbenchl
		debug.notification("You can't take Gee Da's Workbench!")
		return
	else
		game.getplayer().additem(AKPCraftingTableClutter)
		self.delete()
		return
	endif
endif
endevent

