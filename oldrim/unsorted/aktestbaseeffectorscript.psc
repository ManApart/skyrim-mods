Scriptname aktestbaseeffectorscript extends ObjectReference  

aktestbaseobjectscript property akquest auto




Event OnActivate(ObjectReference akActionRef)


if akquest.aktestvalue == 2 
debug.notification("Grabbed test value equals 2. Attempting to run function.")
akquest.aktestfunction()

elseif akquest.aktestvalue == 1 
debug.notification("Grabbed test value equals 1. Attempting to run function.")
akquest.aktestfunction()

elseif akquest.aktestvalue == 3
debug.notification("Grabbed test value equals 3. Attempting to run function.")
akquest.aktestfunction()

else 
debug.notification("No test value grabbed")
akquest.aktestfunction()

endif

endevent