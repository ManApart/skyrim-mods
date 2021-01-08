Scriptname AKSortToolScript extends ObjectReference  

AKASMenuOptions Property akQuest Auto

Event OnContainerChanged(ObjectReference akNewContainer, ObjectReference akOldContainer)
  if akNewContainer == Game.GetPlayer()
  else
    akquest.showMenu(akNewContainer)
    akNewContainer.RemoveItem(self, 1, true, Game.GetPlayer())
  endIf
endEvent