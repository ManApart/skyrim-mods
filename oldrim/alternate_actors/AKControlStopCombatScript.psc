Scriptname AKControlStopCombatScript extends ActiveMagicEffect  
AKControlquestScript Property akquest Auto
AKControlMCMScript Property akquestMCM Auto

Event OnEffectStart(Actor akTarget, Actor akCaster)
	;now let's transfer the hostilities to the right people
	;Debug.Notification("Peace Spell applied")

	If aktarget.getcombattarget() == akquest.playerref ;get those attacking the player
		akquest.AKAggressorsPlayer.AddForm(aktarget)
		akTarget.AddToFaction(akquest.CharmFaction)
		;Debug.Notification(aktarget.GetLeveledActorBase().getname() + " added to hate list")
	; get those attacking the NPC
	ElseIf aktarget.getcombattarget() == akquest.origionalNPC || (aktarget.getcombattarget() == akquest.akcontroltemp && akquestmcm.dragonbornfollower == True )
		;Debug.Notification("Follower in combat")
		akquest.AKAggressorsNPC.AddForm(aktarget)
		akTarget.AddToFaction(akquest.CharmFaction)
	EndIf
	
	;akCaster.StopCombat()
	aktarget.StopCombat()		
EndEvent
