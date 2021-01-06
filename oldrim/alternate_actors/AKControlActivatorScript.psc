Scriptname AKControlActivatorScript extends ObjectReference  
akcontrolquestscript property akquest auto
;gives the spells, for testing
spell property akcontrolTestspell auto
spell property akcontrolsavefacespell auto
spell property ghostability auto
bool doonce
int I
int size


Event OnActivate(ObjectReference akActionRef)
game.getplayer().addspell(akcontroltestspell, False)
game.getplayer().addspell(akcontrolsavefacespell, False)
;game.getplayer().addspell(ghostability, False)
; Game.getplayer().SetGhost(True)
; Game.DisablePlayerControls(false,true,false,false,false,false,false)


		; i = 0
		; While i < 20
			; game.SetNthTintMaskTexturePath(akquest.aktintlist[i], i)
			; game.SetNthTintMaskColor(i, akquest.aktintcolors[i])
			; i +=1
		; EndWhile
		; game.GetPlayer().QueueNiNodeUpdate() 
		; Debug.Notification("done")

	 ; int list = game.getplayer().GetActorBase().GetNumHeadParts()
	; debug.Notification(list +" headparts!")
	; int index = 0
	; headpart temppart
	; if doonce == False
		; doonce == True
	; Else
		; WHILE (index < list)
		; temppart = game.getplayer().GetActorBase().GetNthHeadPart(index)
			; debug.notification("Part #:" +index + ", Part Name:" +temppart.getname() +", Part Type:" +temppart.gettype())
			; index += 1
		; EndWHILE
		; doonce == False
	; EndIf
endevent
