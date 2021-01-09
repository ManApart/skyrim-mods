;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 2
Scriptname QF_AKAutoSortQuest_02000D67 Extends Quest Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN AUTOCAST TYPE AKAutoSortQuest
Quest __temp = self as Quest
AKAutoSortQuest kmyQuest = __temp as AKAutoSortQuest
;END AUTOCAST
;BEGIN CODE
; Game.GetPlayer().addItem(AKSortTool, 1, true)
ObjectReference tool = Game.GetPlayer().PlaceAtMe(AKSortTool)
Game.GetPlayer().addItem(tool, 1, true)
Game.GetPlayer().addSpell(AkAutoStore)

Debug.Notification("Configured Auto Store")
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

MiscObject Property AKSortTool  Auto  

SPELL Property AkAutoStore  Auto  
