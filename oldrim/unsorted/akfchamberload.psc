Scriptname akfchamberload extends ObjectReference  
quest property akquest auto


Event OnCellLoad()
if  akquest.getstage() == 65
akquest.setstage(70)
endif

endevent
