Scriptname AKClotheDeadNPCSPlayerScript extends ReferenceAlias  
actor testact
int itemtype
event OnItemRemoved(Form akBaseItem, int aiItemCount, ObjectReference akItemReference, ObjectReference akDestContainer)
if (akdestcontainer as Actor).isdead()
	itemtype = akbaseitem.gettype()
	if itemtype == 26 || itemtype == 42 ||itemtype == 41
		(akdestcontainer as actor).EquipItem(akbaseitem, True)
		;(akdestcontainer as actor).QueueNiNodeUpdate()
		;debug.notification("Dead actor updated")
	EndIf
endif
;debug.notification("item removed!")
EndEvent