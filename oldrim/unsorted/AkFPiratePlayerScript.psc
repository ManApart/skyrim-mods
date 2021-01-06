Scriptname AkFPiratePlayerScript   
Key property AKFOTctelvoskey auto
Key property AKFOTcwinterwarkey auto
Key property AKFOTicerunnerkey auto
Key property AKFOTtreasuretrovekey auto
quest property akquest auto
Book Property akpirateletter  Auto  

event OnItemAdded(Form akBaseItem, int aiItemCount, ObjectReference akItemReference, ObjectReference akSourceContainer)

if akbaseitem ==AKFOTcwinterwarkey 
akquest.setstage(10)

elseif akbaseitem == AKFOTctelvoskey 
akquest.setstage(20)

elseif akbaseitem ==AKFOTicerunnerkey 
akquest.setstage(30)

elseif akbaseitem ==akpirateletter
akquest.setstage(40)

elseif akbaseitem ==AKFOTtreasuretrovekey 
akquest.setstage(50)

endif

endevent

