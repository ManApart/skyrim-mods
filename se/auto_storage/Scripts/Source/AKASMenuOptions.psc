Scriptname AKASMenuOptions extends Quest  

Keyword[] Property keywords Auto

AKAutoSortQuest Property mainQuest Auto
Message Property AKASMainMenu Auto
Message Property AKASAddKeyword Auto

function showMenu(ObjectReference chest)
  Int response = AKASMainMenu.show()
  if (response == 0)
    mainQuest.addContainer(chest)
    addKeyword(chest)
  elseif (response == 1)
    addKeyword(chest)
  elseif (response == 2)
    removeKeyword(chest)
  elseif (response == 3)
    mainQuest.removeContainer(chest)
  else
  endif
EndFunction

function addKeyword(ObjectReference chest)
  Debug.Notification("Showing add keyword")
  Int i = AKASAddKeyword.show()
  FormList currentKeywords = mainQuest.getKeywordsForContainer(chest)
  printCurrentKeywords(currentKeywords)

  if (i < 7)
    Keyword newWord = keywords[i]
    
    mainQuest.addKeywordToContainer(chest, newWord)
    Debug.Notification("Added keyword " + newWord.GetString())
  endif
  ;add new
  ;return to main menu

EndFunction

function removeKeyword(ObjectReference chest)
  Debug.Notification("Showing remove keyword")
  FormList currentKeywords = mainQuest.getKeywordsForContainer(chest)
  printCurrentKeywords(currentKeywords)
EndFunction

function printCurrentKeywords(FormList currentKeywords)
  Int i = currentKeywords.GetSize()
  Debug.Notification("Current Keywords:")
  While i > 0
    i -= 1    
    Keyword word = currentKeywords.GetAt(i) as Keyword
    Debug.Notification(":" + word.GetString())
  EndWhile
EndFunction