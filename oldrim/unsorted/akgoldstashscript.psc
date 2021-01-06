Scriptname akgoldstashscript extends ObjectReference  
int property akcount auto
miscobject property gold auto
int akamount

Event OnActivate(ObjectReference akActionRef)
if akcount < 10
game.getplayer().additem(gold, 100)
akcount = (akcount +1)

elseif akcount == 10
;instead of 100 each time, make it random between 100 and 200
int akrand = Utility.RandomInt()
akamount= (100+ akrand )

game.getplayer().additem(gold, akamount)
akcount = (akcount +1)
debug.notification("You take the last of the gold")
self.disable()
self.delete()
endif
endevent