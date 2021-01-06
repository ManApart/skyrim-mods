Scriptname AKSeasonsQuestScript extends Quest  

Int Property CurrentSeason Auto	; 0= summer, 1=fall, 2= winter, 3= spring, but there is no spring.
Actor Property PlayerRef Auto

;season keywords that should be attatched to foliage
Keyword Property AKSeasonFall Auto
Keyword Property AKSeasonSummer Auto
Keyword Property AKSeasonWinter Auto

;lists of trees in each season, used for search and replace
Formlist Property AKTreeFall Auto
Formlist Property AKTreeSummer Auto
Formlist Property AKTreeWinter Auto


Function AKUpdateCell()
Debug.Notification("Updating Cell")
cell currentCell = playerref.GetParentCell()
Int i = currentCell.GetNumRefs(39) ; kFlora = 39
	While i > 0
		i -= 1
		ObjectReference object = currentCell.GetNthRef(i, 39)
		if object.HasKeyword(AKSeasonSummer)
			Debug.Notification("found a summer object")
		EndIf
	EndWhile
EndFunction