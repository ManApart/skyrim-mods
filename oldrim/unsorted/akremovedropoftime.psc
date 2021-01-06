Scriptname akremovedropoftime extends activemagiceffect  
miscobject property akitem auto
armor property akring auto
int property dropcount auto


Event OnEffectStart(Actor akTarget, Actor akCaster)
if (Game.GetPlayer().IsEquipped(akring)) != 1
akcaster.removeitem(akitem, dropcount)
;akcaster.removeitem(AKdropoftimebloodmisc, 1)
endif

endevent