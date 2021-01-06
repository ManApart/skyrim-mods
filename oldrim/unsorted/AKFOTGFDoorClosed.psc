Scriptname AKFOTGFDoorClosed   
quest property akquest auto


Event OnActivate(ObjectReference akActionRef)
if akquest.getstage() == 10
debug.notification("Use a different door!")
endif
endevent
