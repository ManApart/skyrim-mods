Scriptname AKGrayFoxBustScript extends ReferenceAlias  

quest property akquest auto

Event OnItemAdded(Form akBaseItem, int aiItemCount, ObjectReference akItemReference, ObjectReference akSourceContainer)
akquest.setobjectivecompleted(10)
akquest.setobjectivedisplayed(20)


endevent