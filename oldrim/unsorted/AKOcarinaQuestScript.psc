Scriptname AKOcarinaQuestScript extends Quest  


;keys
Int Property Cup = 200 Auto
Int Property Cdown = 208 Auto
Int Property Cleft = 203 Auto
Int Property Cright = 205 Auto
Int Property Abutton = 57 Auto
Int Property ExitButton = 1 Auto

;3d notes and staff
ObjectReference Property AKMusicStaff Auto
Activator Property AKNoteAbutton Auto
Activator Property AKNoteCDown Auto
Activator Property AKNoteCLeft Auto
Activator Property AKNoteCRight Auto
Activator Property AKNoteCUp Auto
Formlist Property AKNoteList Auto

;other
ObjectReference Property playerref Auto
Bool Property IsBusy Auto



Int Property SongProgress Auto
Int Property CurrentColumn Auto
String Property NodeName Auto
ObjectReference aknote

Function AKStartPlay()
Debug.Notification("Ocarina equipped by player: " + CurrentColumn)
	RegisterForKey(Cup)
	RegisterForKey(Cdown)
	RegisterForKey(Cleft)
	RegisterForKey(Cright)
	RegisterForKey(Abutton)
	RegisterForKey(ExitButton)
	AKMusicStaff.MoveTo(playerref, 50, 50, 100, 0)
EndFunction

Event OnKeyDown(Int KeyCode)
If Keycode == Cup
	NodeName = "up"
	AKPlaceNote(AKNoteCUp)
	Debug.Notification(NodeName)
ElseIf Keycode == Cdown
	NodeName = "down"
	AKPlaceNote(AKNoteCDown)
	Debug.Notification(NodeName)
ElseIf Keycode == Cleft
	NodeName = "left"
	AKPlaceNote(AKNoteCLeft)
	Debug.Notification(NodeName)
ElseIf Keycode == Cright
	NodeName = "right"
	AKPlaceNote(AKNoteCRight)
	Debug.Notification(NodeName)
ElseIf Keycode == Abutton
	NodeName = "a"
	AKPlaceNote(AKNoteAbutton)
	Debug.Notification(NodeName)
ElseIf Keycode == ExitButton
	AKExitFunction()
EndIf
Debug.Notification("key pressed")
EndEvent

Function akPlaceNote(Activator Note)
	If IsBusy == False
		isbusy = True
		If CurrentColumn < 9
			CurrentColumn += 1
		Else
			CurrentColumn = 1
			AKStaffClear()
		EndIf
		aknote = AKMusicStaff.PlaceAtMe(note)
		NodeName = (CurrentColumn + NodeName)
		;need to find the proper node and column.
		aknote.MoveToNode(AKMusicStaff, NodeName)
		Debug.Notification("note moved")
		isbusy = False
	Else
		Debug.Notification("Busy!")
	EndIf
EndFunction

Function AKExitFunction()
	unRegisterForKey(Cup)
	unRegisterForKey(Cdown)
	unRegisterForKey(Cleft)
	unRegisterForKey(Cright)
	unRegisterForKey(Abutton)
	unRegisterForKey(ExitButton)
	AKMusicStaff.MoveToMyEditorLocation()
	AKStaffClear()
EndFunction



Function AKStaffClear()
isbusy = True
Int i = 0
Int size = AKNoteList.GetSize()
While i < size
	(akNoteList.GetAt(i) as ObjectReference).Delete()
	i += 1
EndWhile
AKNoteList.Revert()
isbusy = False
EndFunction
