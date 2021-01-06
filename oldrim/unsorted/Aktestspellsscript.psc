Scriptname Aktestspellsscript extends ObjectReference  
shout property AKshoutadd auto
spell property akslowtimetestspell auto
spell property akdiseasespell auto
spell property akcowltestspell auto
spell property akcurespell auto
wordofpower property akword1 auto
wordofpower property akword2 auto
wordofpower property akword3 auto
int property doonce auto

event onactivate (objectreference akactionref)

;Game.TeachWord(akword1)
;Game.TeachWord(akword2)
;Game.TeachWord(akword3)

;game.getplayer().addshout (akshoutadd)


;game.getplayer().addshout (akfreezetime)

;Game.TeachWord(akslowtimetestspell)

;game.unlockword(akshout)
Game.GetPlayer().AddSpell(akcowltestspell)

if doonce == 0

Game.GetPlayer().AddSpell(akslowtimetestspell)
Game.GetPlayer().AddSpell(akdiseasespell)
Game.GetPlayer().AddSpell(unicornspell)
;debug.notification("infected")
doonce = 1

elseif doonce == 1
Game.GetPlayer().removeSpell(akdiseasespell)
Game.GetPlayer().AddSpell(akcurespell)
;debug.notification("cured")
doonce = 0

endif

;debug.messagebox ("Shout added")

endevent
SPELL Property unicornspell  Auto  
