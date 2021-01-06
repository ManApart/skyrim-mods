Scriptname AKKillitusCarrierScript extends activemagiceffect  
objectreference property dummycaster auto
spell property infectionspell auto

Event OnEffectStart(Actor akTarget, Actor akCaster)

RegisterForUpdate(5)
;debug.notification("You've been infected!")

endevent


event onupdate()
;debug.notification("Dummyspell casting")
dummycaster.moveto(game.getplayer(),0,0,0)
infectionspell.cast(dummycaster) 

;infectionspell.cast(game.getplayer()) 

endevent


Event OnEffectFinish(Actor akTarget, Actor akCaster)
UnregisterForUpdate()
dummycaster.InterruptCast()
debug.notification("You've been cured!")
endevent