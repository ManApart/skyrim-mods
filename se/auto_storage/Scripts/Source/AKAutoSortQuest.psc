Scriptname AKAutoSortQuest extends Quest  

Int Property Chest1Type = 26 Auto  

FormList Property chests  Auto  
FormList[] testThings

function addContainer(ObjectReference containerToAdd)
  ;initialize list
  if (testThings == None)
    testThings = new FormList[100]
  endif


  ; self.chests.AddForm(containerToAdd)
  AKAutoSortContainer newContainer
  newContainer.chest = containerToAdd
  self.chests.AddForm(newContainer)

  Debug.Notification("Container Added" + newContainer.chest.GetDisplayName())
  Debug.Notification(self.chests.GetSize() + " containers are remembered")
EndFunction

function removeContainer(ObjectReference containerToRemove)
  AKAutoSortContainer chest = findContainer(containerToRemove)
  if (chest != None)
    self.chests.RemoveAddedForm(chest)
    Debug.Notification("Container Removed")
  endif
EndFunction

function addKeywordToContainer(ObjectReference chestToChange, Keyword keywordToAdd)
  AKAutoSortContainer chest = findContainer(chestToChange)
  if (chest != None)
    chest.keywords.addForm(keywordToAdd)
  endif

EndFunction

function removeKeywordFromContainer(ObjectReference chestToChange, Keyword keywordToRemove)
  AKAutoSortContainer chest = findContainer(chestToChange)
  if (chest != None)
    chest.keywords.RemoveAddedForm(keywordToRemove)
  endif
EndFunction

AKAutoSortContainer function findContainer(ObjectReference chest)
  Int i = self.chests.GetSize()
  
  While i > 0
    i -= 1
    AKAutoSortContainer possible = chests.GetAt(i) as AKAutoSortContainer
    if (chest == possible.chest)
      return possible
    endif
  EndWhile

  return None
EndFunction


function sortItems()
  Debug.Notification("Sorting " + player.GetNumItems() + " items to " + self.chests.GetSize() + " chests")
  ObjectReference player = Game.GetPlayer()

  Int sortedItems = 0
  Int iPlayerItem = player.GetNumItems()
  
	While iPlayerItem > 0
		iPlayerItem -= 1
    Form itemToSort = player.GetNthForm(iPlayerItem)
  
    Int iChests = self.chests.GetSize()
    bool found = false
    While iChests > 0 && !found
      iChests -= 1
      AKAutoSortContainer chest = chests.GetAt(iChests) as AKAutoSortContainer
      Debug.Notification("Found chest with " + chest.keywords.GetSize() + " keywords")
      ; ObjectReference chest = chests.GetAt(iChests) as ObjectReference
      If itemToSort.GetType() == Chest1Type 
        player.RemoveItem(itemToSort, 1, true, chest.chest)
        sortedItems += 1
        found = true
      EndIf
    EndWhile
	EndWhile

  Debug.Notification("Sorted " + sortedItems + " items")
EndFunction

