Scriptname AKAutoSortQuest extends Quest  

ObjectReference[] property chests auto
FormList[] property keywords auto

function addContainer(ObjectReference containerToAdd)
  Int existingSlot = findContainerSlot(containerToAdd)
  if (existingSlot != -1)
    Debug.Notification(containerToAdd.GetDisplayName() + " is already tracked in slot " + existingSlot) 
  else
    Int slot = findEmptyContainerSlot()
    if (slot != -1)
      chests[slot] = containerToAdd
      Debug.Notification("Added " + containerToAdd.GetDisplayName() + " to slot " + slot)        
    else
      Debug.Notification("Can't add more chests, please remove some first")
    endif
  endif

 
EndFunction

function removeContainer(ObjectReference containerToRemove)
  Int slot = findContainerSlot(containerToRemove)
  if (slot != -1)
    chests[slot] = None
    keywords[slot].Revert()
    Debug.Notification(containerToRemove.GetDisplayName() + " removed from slot " + slot)
  else
    Debug.Notification(containerToRemove.GetDisplayName() + " is not tracked")
  endif
EndFunction

function addKeywordToContainer(ObjectReference chestToChange, Keyword keywordToAdd)
  Int slot = findContainerSlot(chestToChange)
  if (slot != -1)
    keywords[slot].addForm(keywordToAdd)
  endif

EndFunction

function removeKeywordFromContainer(ObjectReference chestToChange, Keyword keywordToRemove)
  Int slot = findContainerSlot(chestToChange)
  if (slot != -1)
    keywords[slot].RemoveAddedForm(keywordToRemove)
  endif
EndFunction

FormList function getKeywordsForContainer(ObjectReference chest)
  Int slot = findContainerSlot(chest)
  return getKeywordsForContainerSlot(slot)
EndFunction

FormList function getKeywordsForContainerSlot(Int slot)
  if (slot != -1)
    return keywords[slot]
  endif
  return None
EndFunction

Int function findContainerSlot(ObjectReference chest)
  Int i = chests.Length
  
  While i > 0
    i -= 1    
    if (chest == chests[i])
      ; Debug.Notification("Found " + chest.GetDisplayName())
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
  Actor player = Game.GetPlayer()
  Cell currentCell = player.GetParentCell()
  Int sortedItems = 0
  Int iPlayerItem = player.GetNumItems()

  Debug.Notification("Sorting through " + iPlayerItem + " items")
  
	While iPlayerItem > 0
		iPlayerItem -= 1
    Form itemToSort = player.GetNthForm(iPlayerItem)
  
    if (!player.IsEquipped(itemToSort) && !Game.IsObjectFavorited(itemToSort))
      Int slot = chests.Length
      bool found = false
      While slot > 0 && !found
        slot -= 1
        ObjectReference chest = chests[slot]
        FormList keywordMatches = keywords[slot]

        if (chest != None && keywordMatches.GetSize() > 0 && chest.GetParentCell() == currentCell)
          ; Debug.Notification("Found chest with " + keywordMatches.GetSize() + " keywords")
          If (keywordsMatch(itemToSort, keywordMatches))
            Int count = player.GetItemCount(itemToSort)
            player.RemoveItem(itemToSort, count, true, chest)
            sortedItems += 1
            found = true
          EndIf
        EndIf
      EndWhile
    endIf
	EndWhile

  Debug.Notification("Stored " + sortedItems + " items")
EndFunction


bool function keywordsMatch(Form item, FormList keywordMatches)
  int i = keywordMatches.GetSize()
	While i > 0
    i -= 1
    if (item.hasKeyword(keywordMatches.GetAt(i) as Keyword))
      return true
    endif
  EndWhile
  return false
EndFunction

