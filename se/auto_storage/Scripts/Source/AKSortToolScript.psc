Scriptname AKSortToolScript extends ObjectReference  

AKAutoSortQuest Property akquest auto

Event OnContainerChanged(ObjectReference akNewContainer, ObjectReference akOldContainer)
  if akNewContainer == Game.GetPlayer()
  else
    akquest.addContainer(akNewContainer)
    akNewContainer.RemoveItem(self, 1, true, Game.GetPlayer())
    Debug.Notification("Marked Storage")
  endIf
endEvent