Scriptname AKSortToolScript extends ObjectReference  

AKASMenuOptions Property akQuest Auto

Event OnContainerChanged(ObjectReference akNewContainer, ObjectReference akOldContainer)
  if akNewContainer == Game.GetPlayer()
  elseif akNewContainer == None
    Game.GetPlayer().AddItem(self, 1, true)
  else
    akNewContainer.RemoveItem(self, 1, true, Game.GetPlayer())
    akquest.showMenu(akNewContainer)
  endIf
endEvent