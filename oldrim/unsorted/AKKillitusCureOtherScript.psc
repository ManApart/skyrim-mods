Scriptname AKKillitusCureOtherScript extends activemagiceffect  
spell property infectedspell auto
qf_akheartoftime_01013b1f property akhotquestscript auto

Event OnEffectStart(Actor akTarget, Actor akCaster)
;debug.notification("trying to infect!")

if aktarget != game.getplayer() && aktarget.hasspell(infectedspell) == 1
aktarget.removespell(infectedspell)


;aktarget.SetUnconscious()
aktarget.enableai()
aktarget.setunconscious(false)
akhotquestscript.akcuredcount = (akhotquestscript.akcuredcount + 1)
akfcuredcount.mod(1)
debug.notification("I have cured " + akhotquestscript.akcuredcount+ " people of Killitus.")
else
debug.notification("This character is not infected.")
endif
endevent

GlobalVariable Property AkfCuredCount  Auto  
