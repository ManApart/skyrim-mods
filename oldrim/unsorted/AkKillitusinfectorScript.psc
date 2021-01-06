Scriptname AkKillitusinfectorScript extends activemagiceffect  
spell property infectedspell auto
ImageSpaceModifier Property sickeffect  Auto  

Event OnEffectStart(Actor akTarget, Actor akCaster)
;debug.notification("trying to infect!")
if aktarget != game.getplayer() && aktarget.hasspell(infectedspell) == 0
aktarget.addspell(infectedspell)
game.getplayer().PushActorAway(aktarget, 1.0)
sickeffect.apply()
;aktarget.ForceAddRagdollToWorld()
Utility.Wait(1.7)

aktarget.enableai(false)
aktarget.SetUnconscious()
sickeffect.remove()
;aktarget.SetRestrained()
;debug.notification("Someone has been infected with Killitus.")
endif
endevent

