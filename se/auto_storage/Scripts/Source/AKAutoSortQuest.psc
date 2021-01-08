Scriptname AKAutoSortQuest extends Quest  

Int Property Chest1Type = 26 Auto  

ObjectReference Property Chest1  Auto  


function addContainer(ObjectReference containerToAdd)
  self.Chest1 = containerToAdd
  Debug.Notification("Quest Marked")
EndFunction


function sortItems()
  Debug.Notification("Sorting Items")
  ObjectReference player = Game.GetPlayer()

  Int sortedItems = 0

  Int iFormIndex = player.GetNumItems()
	While iFormIndex > 0
		iFormIndex -= 1
		Form kForm = player.GetNthForm(iFormIndex)
		If kForm.GetType() == Chest1Type 
      player.RemoveItem(kform, 1, true, Chest1)
      sortedItems += 1
		EndIf
	EndWhile

  Debug.Notification("Sorted " + sortedItems + " items")
EndFunction