Scriptname AKBloodSampleActivatorScript extends ObjectReference  
miscobject property akbloodsample auto
quest property akkillitusquest auto
int property akobjective auto

Event OnActivate(ObjectReference akActionRef)

if akkillitusquest.getstage() == 10
game.getplayer().additem(akbloodsample)
akkillitusquest.setobjectivecompleted(akobjective)

if akkillitusquest.isobjectivecompleted(10) == 1 &&  akkillitusquest.isobjectivecompleted(11) == 1 &&  akkillitusquest.isobjectivecompleted(12) == 1 &&  akkillitusquest.isobjectivecompleted(13) == 1 &&  akkillitusquest.isobjectivecompleted(14) == 1 &&  akkillitusquest.isobjectivecompleted(15) == 1 
akkillitusquest.setstage(20)

endif

self.disable()
endif
endevent