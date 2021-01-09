Scriptname AKASMenuOptions extends Quest  

Keyword[] Property keywords Auto

AKAutoSortQuest Property mainQuest Auto
Message Property AKASMainMenu Auto

Message[] Property addKeywordMessages Auto
Message[] Property removeKeywordMessages Auto

function showMenu(ObjectReference chest)
  Int existingSlot = mainQuest.findContainerSlot(chest)
  Int response = AKASMainMenu.show()
  if (response == 0)
    mainQuest.addContainer(chest)
    showMenu(chest)    
  elseif (response == 1)
    addKeyword(chest, existingSlot, 0)
  elseif (response == 2)
    removeKeyword(chest, existingSlot, 0)
  elseif (response == 3)
    mainQuest.removeContainer(chest)
  else
  endif
EndFunction

function addKeyword(ObjectReference chest, Int slot, Int page)  
  if (slot == -1)
    Debug.Notification(chest.getDisplayName() + " is not tracked")
    showMenu(chest)
  else
    FormList currentKeywords = mainQuest.getKeywordsForContainerSlot(slot)
    printCurrentKeywords(currentKeywords)
    Int i = addKeywordMessages[page].show()

    if (i < 7)
      mainQuest.addKeywordToContainer(chest, keywords[i + page*7])
      addKeyword(chest, slot, page)
    elseif (i == 7)
      if (page >= addKeywordMessages.Length - 1)
        showMenu(chest)
      else
        addKeyword(chest, slot, page + 1)
      endif
    elseif (i == 8)
      if (page <= 0)
        showMenu(chest)
      else
        addKeyword(chest, slot, page - 1)
      endif
    endif
  endif

EndFunction

function removeKeyword(ObjectReference chest, Int slot, Int page)
  if (slot == -1)
    Debug.Notification(chest.getDisplayName() + " is not tracked")
    showMenu(chest)
  else
    FormList currentKeywords = mainQuest.getKeywordsForContainerSlot(slot)
    if (currentKeywords.GetSize() == 0)
      Debug.Notification("No keywords to remove")
      showMenu(chest)
    else
      printCurrentKeywords(currentKeywords)
      Int i = removeKeywordMessages[page].show()
      if (i < 7)
        mainQuest.removeKeywordFromContainer(chest, keywords[i + page*7])
        removeKeyword(chest, slot, page)
      elseif (i == 7)
        if (page >= removeKeywordMessages.Length - 1)
          showMenu(chest)
        else
          removeKeyword(chest, slot, page + 1)
        endif
      elseif (i == 8)
        if (page <= 0)
          showMenu(chest)
        else
          removeKeyword(chest, slot, page - 1)
        endif
      endif
    endif
  endif
EndFunction

function printCurrentKeywords(FormList currentKeywords)
  Int i = currentKeywords.GetSize()
  if (i > 0)
    String messageOutput = ""
    While i > 0
      i -= 1    
      Keyword word = currentKeywords.GetAt(i) as Keyword
      messageOutput += word.GetString() + ", "
    EndWhile
    Debug.Notification("Current Keywords: " + messageOutput)
  endif
EndFunction