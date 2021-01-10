Scriptname AKAutoSortQuest extends Quest  

Int chestMapK

; cellMap = Map<Cell, List<ObjectReference>>
; chestMapK = Map<ObjectReference, List<Keyword>>

function addContainer(ObjectReference containerToAdd)
  initChestConfig()
  Bool existing = isTracked(containerToAdd)
  if (existing)
    Debug.Notification(containerToAdd.GetDisplayName() + " is already tracked") 
  else
    Int chestKeywordsK = JArray.object()
    Debug.Trace("AK: chestKeywordsK: " + chestKeywordsK)
    JFormMap.setObj(chestMapK, containerToAdd, chestKeywordsK)
    Debug.Trace("AK: MapCount: " + JFormMap.count(chestMapK))
    persistChestConfig()
    Debug.Notification("Now Tracking  " + containerToAdd.GetDisplayName())        
  endif
EndFunction

function removeContainer(ObjectReference containerToRemove)
  initChestConfig()
  Bool existing = isTracked(containerToRemove)
  if (existing)
    JFormMap.setObj(chestMapK, containerToRemove, 0)
    persistChestConfig()
    Debug.Notification(containerToRemove.GetDisplayName() + " removed from tracking")
  else
    Debug.Notification(containerToRemove.GetDisplayName() + " is not tracked")
  endif
EndFunction

function addKeywordToContainer(ObjectReference chestToChange, Keyword keywordToAdd)
  initChestConfig()
  Int chestKeywordsK = JFormMap.getObj(chestMapK, chestToChange)
  JArray.addForm(chestKeywordsK, keywordToAdd)
  persistChestConfig()
EndFunction

function removeKeywordFromContainer(ObjectReference chestToChange, Keyword keywordToRemove)
  initChestConfig()
  Int chestKeywordsK = JFormMap.getObj(chestMapK, chestToChange)
  JArray.eraseForm(chestKeywordsK, keywordToRemove)
  persistChestConfig()
EndFunction

Form[] function getKeywordsForContainer(ObjectReference chest)
  initChestConfig()
  Int chestKeywordsK = JFormMap.getObj(chestMapK, chest)
  return JArray.asFormArray(chestKeywordsK)
EndFunction

Bool function isTracked(ObjectReference chest)
  initChestConfig()
  Debug.Trace("AK: Checking " + chestMapK + " that has " + JFormMap.count(chestMapK) + " keys")
  return JFormMap.hasKey(chestMapK, chest)
EndFunction

function sortItems()
  Debug.StartStackProfiling()
  initChestConfig()
  Actor player = Game.GetPlayer()
  Cell currentCell = player.GetParentCell()
  Int sortedItems = 0
  Int iPlayerItem = player.GetNumItems()
  Form[] chests2 = JFormMap.allKeysPArray(chestMapK)

  Debug.Notification("Sorting through " + iPlayerItem + " items")
  
	While iPlayerItem > 0
		iPlayerItem -= 1
    Form itemToSort = player.GetNthForm(iPlayerItem)
  
    if (!player.IsEquipped(itemToSort) && !Game.IsObjectFavorited(itemToSort))
      Int slot = chests2.Length
      bool found = false

      While slot > 0 && !found
        slot -= 1
        ObjectReference chest = chests2[slot] as ObjectReference
        Int keywordsK = JFormMap.getObj(chestMapK, chest)
        Form[] keywordMatches = JArray.asFormArray(keywordsK)

        
        if (chest != None && keywordMatches.Length > 0 && chest.GetParentCell() == currentCell)
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
  Debug.StopStackProfiling()
EndFunction


bool function keywordsMatch(Form item, Form[] keywordMatches)
  Debug.Trace("AK: matching")
  int i = keywordMatches.Length
	While i > 0
    i -= 1
    if (item.hasKeyword(keywordMatches[i] as Keyword))
      return true
    endif
  EndWhile
  return false
EndFunction

function initChestConfig()
  ;Load from saves
  if (chestMapK == 0)
    chestMapK = JValue.readFromFile(JContainers.userDirectory() + "ak_auto_store/chestConfig.json")
    JDB.setObj("ak_auto_store", chestMapK)
  endif

  ;Create a new one
  if (chestMapK == 0)
    chestMapK = JFormMap.object()
    JDB.setObj("ak_auto_store", chestMapK)
    persistChestConfig()
  endif
EndFunction

function persistChestConfig()
  Debug.Trace("AK: Saving " + chestMapK)
  JValue.writeToFile(chestMapK, JContainers.userDirectory() + "ak_auto_store/chestConfig.json")
  Debug.Trace("AK: Saved Config")
EndFunction

