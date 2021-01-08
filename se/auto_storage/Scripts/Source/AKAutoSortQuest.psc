Scriptname AKAutoSortQuest extends Quest  

Int Property Chest1Type = 26 Auto  

ObjectReference[] chests
FormList[] keywords 
FormList[] Property testThings Auto

function addContainer(ObjectReference containerToAdd)
  ;initialize list
  if (chests == None || chests.Length == 0)
    chests = new ObjectReference[100]
    keywords = new FormList[100]
    Debug.Notification("Created " + chests.Length + " slots")
  endif
    
  Int slot = findEmptyContainerSlot()
  if (slot != -1)
    chests[slot] = containerToAdd
    Debug.Notification("Added" + containerToAdd.GetDisplayName() + " to slot " + slot)    
  else
    Debug.Notification("Can't add more chests, please remove some first")
  endif

 
EndFunction

function removeContainer(ObjectReference containerToRemove)
  Int slot = findContainerSlot(containerToRemove)
  if (slot != -1)
    chests[slot] = None
    Debug.Notification("Container Removed from slot " + slot)
  endif
EndFunction

; function addKeywordToContainer(ObjectReference chestToChange, Keyword keywordToAdd)
;   Int slot = findContainer(chestToChange)
;   if (chest != None)
;     chest.keywords.addForm(keywordToAdd)
;   endif

; EndFunction

; function removeKeywordFromContainer(ObjectReference chestToChange, Keyword keywordToRemove)
;   Int slot = findContainer(chestToChange)
;   if (chest != None)
;     chest.keywords.RemoveAddedForm(keywordToRemove)
;   endif
; EndFunction

Int function findContainerSlot(ObjectReference chest)
  Int i = chests.Length
  
  While i > 0
    i -= 1    
    if (chest == chests[i])
      return i
    endif
  EndWhile

  return -1
EndFunction

Int function findEmptyContainerSlot()
  Int i = chests.Length
  
  While i > 0
    i -= 1
    if (chests[i] == None)
      return i
    endif
  EndWhile

  return -1
EndFunction


function sortItems()
  ObjectReference player = Game.GetPlayer()
  Int sortedItems = 0
  Int iPlayerItem = player.GetNumItems()

  Debug.Notification("Sorting " + iPlayerItem + " items")
  
	While iPlayerItem > 0
		iPlayerItem -= 1
    Form itemToSort = player.GetNthForm(iPlayerItem)
  
    Int iChests = chests.Length
    bool found = false
    While iChests > 0 && !found
      iChests -= 1
      ObjectReference chest = chests[iChests]
      ; Debug.Notification("Found chest with " + chest.keywords.GetSize() + " keywords")
      ; ObjectReference chest = chests.GetAt(iChests) as ObjectReference
      If itemToSort.GetType() == Chest1Type 
        player.RemoveItem(itemToSort, 1, true, chest)
        sortedItems += 1
        found = true
      EndIf
    EndWhile
	EndWhile

  Debug.Notification("Sorted " + sortedItems + " items")
EndFunction

