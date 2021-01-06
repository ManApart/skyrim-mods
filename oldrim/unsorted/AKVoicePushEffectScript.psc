Scriptname AKVoicePushEffectScript extends activemagiceffect  


Event OnEffectStart(actor Target, actor Caster)
if target == game.getplayer()
	if Game.IsFightingControlsEnabled()
	Caster.PushActorAway(Target, PushForce)
	endif
else
	Caster.PushActorAway(Target, PushForce)
endif
EndEvent

int Property PushForce  Auto  
