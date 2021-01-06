Scriptname AKCGhostDamageScript extends activemagiceffect  



Event OnEffectStart(Actor akTarget, Actor akCaster)
	aktarget.SetGhost(True)
	;Debug.Notification("Ghost!")
EndEvent

Event OnEffectFinish(Actor akTarget, Actor akCaster)
	aktarget.SetGhost(False)
EndEvent