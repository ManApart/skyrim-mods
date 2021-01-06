Scriptname aktimechampscript extends ObjectReference  

quest property akquest auto

Event OnDeath(Actor akKiller)
if akKiller == game.getplayer() && akquest.getstage() == 80
akquest.setstage(85)
game.getplayer().additem(AKTimeChampDrops)
game.getplayer().additem(akvial)
game.getplayer().additem(akheart)
endif

endevent
weapon Property AKTimeChampDrops  Auto  

MiscObject Property akvial  Auto  

Ingredient Property akheart  Auto  
