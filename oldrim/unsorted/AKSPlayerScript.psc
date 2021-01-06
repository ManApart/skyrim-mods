Scriptname AKSPlayerScript   Extends ReferenceAlias
AKSeasonsQuestScript Property akquest Auto
; used to update seasons

;runs every x days to check the current season
Event OnUpdateGameTime()
;Utility.GetCurrentGameTime()
EndEvent

;when loading a new cell, do season check etc
Event OnCellLoad()
Debug.MessageBox("Cell has loaded!")
akquest.AKUpdateCell()

EndEvent