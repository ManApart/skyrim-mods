Scriptname AKKillitusPotScript extends ObjectReference  
spell property akdiseasespell auto
quest property akhotquest auto
quest property akkillitusquest auto
int property doonce auto
MiscObject Property AKHeartShard  Auto  

event onactivate (objectreference akactionref)
if akhotquest.getstage() == 10 && doonce == 0
game.getplayer().additem(akheartshard)
akhotquest.setobjectivecompleted(10)
Game.GetPlayer().AddSpell(akdiseasespell)
akkillitusquest.start()
debug.notification("You've become infected with Killitus!")
doonce = 1
endif
endevent

