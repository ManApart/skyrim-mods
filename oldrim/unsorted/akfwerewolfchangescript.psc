Scriptname akfwerewolfchangescript extends activemagiceffect  

playerwerewolfchangescript property akwolfscript auto
activemagiceffect Property akmagiceffect  Auto  
spell property feedboost auto
int doonce = 0


Event OnEffectStart(Actor akTarget, Actor akCaster)
;akwolfscript.start()

;akwolfscript.prepshift()
;debug.notification("Prepshift")
;utility.wait(3)

;akwolfscript.initialshift()
;debug.notification("initialshift")
;utility.wait(3)
;akwolfscript.StartTracking()
;debug.notification("starttracking")

;utility.wait(10)
;akwolfscript.unregisterforupdate()
registerforupdate(5)
debug.notification("Drank Trueblood")

doonce = 0

endevent


event onupdate()
if akwolfscript.getstage() == 11 
debug.notification("You Feed! Turning back - active effect")
akwolfscript.ShiftBack()
;game.GetPlayer().DispelSpell(akspell)
akmagiceffect.dispel()
self.dispel()


elseif akwolfscript.getstage() == 10  &&  (doonce== 0)
	akwolfscript.unregisterforupdate()
	debug.notification("Turnining off bloodlust")




endif
endevent

Event OnSpellCast(Form akSpell)
;FeedBoost.Cast(Game.GetPlayer())
if akspell == feedboost
debug.notification("You Fed! Turning back")
akwolfscript.ShiftBack()
;game.GetPlayer().DispelSpell(akspell)
akmagiceffect.dispel()
self.dispel()

endif
endevent


Event OnEffectFinish(Actor akTarget, Actor akCaster)
debug.notification("Trueblood over. Ending effects")
akwolfscript.registerforupdate(5)
;game.GetPlayer().DispelSpell(akspell)
akmagiceffect.dispel()
akwolfscript.ShiftBack()
endevent


