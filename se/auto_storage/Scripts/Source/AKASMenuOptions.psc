Scriptname AKASMenuOptions extends Quest  

Keyword[] Property keywords Auto

AKAutoSortQuest Property mainQuest Auto
Message Property AKASMainMenu Auto

Message[] Property addKeywordMessages Auto
Message[] Property removeKeywordMessages Auto

function showMenu(ObjectReference chest)
  Int response = AKASMainMenu.show()
  if (response == 0)
    mainQuest.addContainer(chest)
    addKeyword(chest, 0)
  elseif (response == 1)
    addKeyword(chest, 0)
  elseif (response == 2)
    removeKeyword(chest, 0)
  elseif (response == 3)
    mainQuest.removeContainer(chest)
  else
  endif
EndFunction

function addKeyword(ObjectReference chest, Int page)
  FormList currentKeywords = mainQuest.getKeywordsForContainer(chest)
  printCurrentKeywords(currentKeywords)
  Int i = addKeywordMessages[page].show()

  if (i < 7)
    mainQuest.addKeywordToContainer(chest, keywords[i + page*10])
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
  FormList currentKeywords = mainQuest.getKeywordsForContainer(chest)
  printCurrentKeywords(currentKeywords)
  Int i = removeKeywordMessages[page].show()

  if (i < 7)
    mainQuest.addKeywordToContainer(chest, keywords[i + page*10])
    removeKeyword(chest, page)
  elseif (i == 7)
    if (page >= removeKeywordMessages.Length - 1)
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

function printCurrentKeywords(FormList currentKeywords)
  Int i = currentKeywords.GetSize()
  String messageOutput = ""
  While i > 0
    i -= 1    
    Keyword word = currentKeywords.GetAt(i) as Keyword
    messageOutput += word.GetString() + ", "
  EndWhile
  Debug.Notification("Current Keywords: " + messageOutput)
EndFunction