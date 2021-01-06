Scriptname akdispelslowtime extends ActiveMagicEffect  
spell property akactiveshout auto
spell property akactiveshout1 auto

Event OnEffectStart(Actor akTarget, Actor akCaster)
;LuckyGuy.DispelSpell(BadPoisonSpell)
;ItBurnsActiveEffect.Dispel()

;game.getplayer().
;akactiveshout.Dispell()
game.getplayer().dispelspell(akactiveshout)
game.getplayer().dispelspell(akactiveshout1)

endevent