Scriptname aksclimbstartscript extends activemagiceffect  
spell property akclimbspell auto
int property akspellon auto
akclimbscript property akscript auto


Event OnEffectStart(Actor akTarget, Actor akCaster)

if akspellon == 0
debug.notification("Entering climb mode.")
game.getplayer().addspell(akclimbspell)
akspellon = 1
akscript.registerforupdate(0.5)


else
debug.notification("Exiting climb mode.")
game.getplayer().addspell(akclimbspell)
akspellon = 0
akscript.unregisterforupdate()

endif
endevent