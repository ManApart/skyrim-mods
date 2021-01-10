Scriptname AKAutoSortQuest extends Quest  

; chestMap = Map<ObjectReference, List<Keyword>>
Int chestMapK

; cellMap = Map<Cell, List<ObjectReference>>
Int cellMapK

function addContainer(ObjectReference containerToAdd)
  initConfig()
  Bool existing = isChestTracked(containerToAdd)
  if (existing)
    Debug.Notification(containerToAdd.GetDisplayName() + " is already tracked") 
  else
    Cell chestCell = containerToAdd.GetParentCell()
    Bool existingCell = isCellTracked(chestCell)

    ;Add chest to cell map
    if (!existingCell)
      Int cellListK = JArray.object()
      JFormMap.setObj(cellMapK, chestCell, cellListK)
    Endif
    Int chestsInCellK = JFormMap.getObj(cellMapK, chestCell)
    JArray.addForm(chestsInCellK, containerToAdd)

    ;Add chest to chest map
    Int chestKeywordsK = JArray.object()
    JFormMap.setObj(chestMapK, containerToAdd, chestKeywordsK)
    persistConfig()
    Debug.Notification("Now Tracking  " + containerToAdd.GetDisplayName())     
  endif
EndFunction

function removeContainer(ObjectReference containerToRemove)
  initConfig()
  Bool existing = isChestTracked(containerToRemove)
  if (existing)
    ;Remove from cell map
    Int chestsInCellK = JFormMap.getObj(cellMapK, containerToRemove.GetParentCell())
    JArray.eraseForm(chestsInCellK, containerToRemove)

    ;Remove from chest map
    JFormMap.setObj(chestMapK, containerToRemove, 0)
    persistConfig()
    Debug.Notification(containerToRemove.GetDisplayName() + " removed from tracking")
  else
    Debug.Notification(containerToRemove.GetDisplayName() + " is not tracked")
  endif
EndFunction

function addKeywordToContainer(ObjectReference chestToChange, Keyword keywordToAdd)
  initConfig()
  Int chestKeywordsK = JFormMap.getObj(chestMapK, chestToChange)
  if (JArray.findForm(chestKeywordsK, keywordToAdd) == -1)
    JArray.addForm(chestKeywordsK, keywordToAdd)
    persistConfig()
  endif
EndFunction

function removeKeywordFromContainer(ObjectReference chestToChange, Keyword keywordToRemove)
  initConfig()
  Int chestKeywordsK = JFormMap.getObj(chestMapK, chestToChange)
  JArray.eraseForm(chestKeywordsK, keywordToRemove)
  persistConfig()
EndFunction

Form[] function getKeywordsForContainer(ObjectReference chest)
  initConfig()
  Int chestKeywordsK = JFormMap.getObj(chestMapK, chest)
  return JArray.asFormArray(chestKeywordsK)
EndFunction

Bool function isChestTracked(ObjectReference chest)
  initConfig()
  return JFormMap.hasKey(chestMapK, chest)
EndFunction

Bool function isCellTracked(Cell cellToCheck)
  initConfig()
  return JFormMap.hasKey(cellMapK, cellToCheck)
EndFunction

function sortItems()
  initConfig()
  Actor player = Game.GetPlayer()
  Cell currentCell = player.GetParentCell()
  Int chestsK = JFormMap.getObj(cellMapK, currentCell)
  
  if (chestsK == 0)
    Debug.Notification("No tracked chests found in cell")
  else
    doSort(chestsK, player)
  endif
EndFunction


function doSort(Int chestsK, Actor player)
  Int sortedItems = 0
  Int iPlayerItem = player.GetNumItems()
  Form[] chests = JArray.asFormArray(chestsK)
  Debug.Notification("Sorting through " + iPlayerItem + " items into " + chests.Length + " chests")
  
  While iPlayerItem > 0
    iPlayerItem -= 1
    Form itemToSort = player.GetNthForm(iPlayerItem)
  
    if (!player.IsEquipped(itemToSort) && !Game.IsObjectFavorited(itemToSort))
      Int slot = chests.Length
      bool found = false

      While slot > 0 && !found
        slot -= 1
        ObjectReference chest = chests[slot] as ObjectReference
        Int keywordsK = JFormMap.getObj(chestMapK, chest)
        Form[] keywordMatches = JArray.asFormArray(keywordsK)
        If (keywordMatches.Length > 0 && keywordsMatch(itemToSort, keywordMatches))
          Int count = player.GetItemCount(itemToSort)
          player.RemoveItem(itemToSort, count, true, chest)
          sortedItems += 1
          found = true
        EndIf
      EndWhile
    endIf
  EndWhile
  Debug.Notification("Stored " + sortedItems + " items")
EndFunction

bool function keywordsMatch(Form item, Form[] keywordMatches)
  int i = keywordMatches.Length
	While i > 0
    i -= 1
    if (item.hasKeyword(keywordMatches[i] as Keyword))
      return true
    endif
  EndWhile
  return false
EndFunction

function initConfig()
  initChestConfig()
  initCellConfig()
EndFunction

function initChestConfig()
  ;Load from saves
  if (chestMapK == 0)
    chestMapK = JValue.readFromFile(JContainers.userDirectory() + "ak_auto_store/chestConfig.json")
    JDB.setObj("ak_auto_store.chests", chestMapK)
  endif

  ;Create a new one
  if (chestMapK == 0)
    chestMapK = JFormMap.object()
    JDB.setObj("ak_auto_store.chests", chestMapK)
    persistConfig()
  endif
EndFunction

function initCellConfig()
  ;Load from saves
  if (cellMapK == 0)
    cellMapK = JValue.readFromFile(JContainers.userDirectory() + "ak_auto_store/cellConfig.json")
    JDB.setObj("ak_auto_store.cells", cellMapK)
  endif

  ;Create a new one
  if (cellMapK == 0)
    cellMapK = JFormMap.object()
    JDB.setObj("ak_auto_store.cells", cellMapK)
    persistConfig()
  endif
EndFunction

function persistConfig()
  JValue.writeToFile(chestMapK, JContainers.userDirectory() + "ak_auto_store/chestConfig.json")
  JValue.writeToFile(cellMapK, JContainers.userDirectory() + "ak_auto_store/cellConfig.json")
EndFunction

