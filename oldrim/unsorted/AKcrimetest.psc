Scriptname AKcrimetest extends ObjectReference  

faction property akfaction auto
int property akbounty auto

Event OnActivate(ObjectReference akActionRef)

akbounty = 10

debug.notification("Haafinger crime="+ akfaction.getcrimegold())

if akfaction.getcrimegold() >=10
akfaction.setcrimegold(5)
debug.notification("greater than 10. Setting to 5")

elseif akfaction.getcrimegold() < 10
akfaction.setcrimegold(5+ akfaction.getcrimegold())
debug.notification("Less than 10, adding 5")
endif



endevent