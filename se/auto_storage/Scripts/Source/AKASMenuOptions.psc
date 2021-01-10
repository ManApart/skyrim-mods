Scriptname AKASMenuOptions extends Quest  

Keyword[] Property keywords Auto

AKAutoSortQuest Property mainQuest Auto
Message Property AKASMainMenu Auto

Message[] Property addKeywordMessages Auto
Message[] Property removeKeywordMessages Auto

function showMenu(ObjectReference chest)
  Debug.StartScriptProfiling("AKAutoSortQuest")
  Bool isTracked = mainQuest.isTracked(chest)
  Int response = AKASMainMenu.show()
  if (response == 0)
    mainQuest.addContainer(chest)
    showMenu(chest)    
  elseif (response == 1 && isTracked)
    addKeyword(chest, 0)
  elseif (response == 1)
    Debug.Notification(chest.getDisplayName() + " is not tracked")
    showMenu(chest)
  elseif (response == 2 && isTracked)
    removeKeyword(chest, 0)
  elseif (response == 2)
    Debug.Notification(chest.getDisplayName() + " is not tracked")
    showMenu(chest)
  elseif (response == 3)
    mainQuest.removeContainer(chest)
  else
  endif
EndFunction

function addKeyword(ObjectReference chest, Int page)  
  Form[] currentKeywords = mainQuest.getKeywordsForContainer(chest)
  printCurrentKeywords(currentKeywords)
  Int i = addKeywordMessages[page].show()

  if (i < 7)
    mainQuest.addKeywordToContainer(chest, keywords[i + page*7])
    addKeyword(chest, page)
  elseif (i == 7)
    if (page >= addKeywordMessages.Length - 1)
      showMenu(chest)
    else
      addKeyword(chest, page + 1)
    endif
  elseif (i == 8)
    if (page <= 0)
      showMenu(chest)
    else
      addKeyword(chest, page - 1)
    endif
  endif

EndFunction

function removeKeyword(ObjectReference chest, Int page)
  Form[] currentKeywords = mainQuest.getKeywordsForContainer(chest)
  if (currentKeywords.Length == 0)
    Debug.Notification("No keywords to remove")
    showMenu(chest)
  else
    printCurrentKeywords(currentKeywords)
    Int i = removeKeywordMessages[page].show()
    if (i < 7)
      mainQuest.removeKeywordFromContainer(chest, keywords[i + page*7])
      removeKeyword(chest, page)
    elseif (i == 7)
      if (page >= removeKeywordMessages.Length - 1)
        showMenu(chest)
      else
        removeKeyword(chest, page + 1)
      endif
    elseif (i == 8)
      if (page <= 0)
        showMenu(chest)
      else
        removeKeyword(chest, page - 1)
      endif
    endif
  endif
EndFunction

function printCurrentKeywords(Form[] currentKeywords)
  Int i = currentKeywords.Length
  if (i > 0)
    String messageOutput = ""
    While i > 0
      i -= 1    
      Keyword word = currentKeywords[i] as Keyword
      messageOutput += word.GetString() + ", "
    EndWhile
    Debug.Notification("Current Keywords: " + messageOutput)
  endif
EndFunction