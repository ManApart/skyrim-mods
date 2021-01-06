Scriptname AKActivateObjectScript extends ObjectReference  
AKControlQuest2Script property akquest2 Auto

Event OnInit()
;Debug.Notification("Activate object fired!")
Actor akcaster = akquest2.playerref
Float X = akcaster.GetPositionX()
Float Y = akcaster.GetPositionY()
Float Z = akcaster.GetPositionZ()
ObjectReference activateobject = Game.FindClosestReferenceOfAnyTypeInList(akquest2.akactivatelist, x, y, z, 100.0)
activateobject.Activate(akcaster)
self.Delete()
EndEvent