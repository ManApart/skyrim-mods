Scriptname AKFOTMainScript extends Quest  
spell property akslowtimespell auto
quest property akfot auto
actor property akaetas auto

Event OnLocationChange(Location akOldLoc, Location akNewLoc)
debug.notification("Main Quest Script Starting stage 10")
;setstage(10)
endevent

Event OnSpellCast(Form akSpell)
Spell spellCast = akSpell as Spell
debug.messagebox("Quest Casting Spell")
;game.showhelpmessage()
  if (spellCast && spellCast == akslowtimespell) && akfot.getstage() == 45 &&  (akaetas.GetParentCell() == Game.GetPlayer().GetParentCell())
;setstage(50)

  endIf
endEvent

Event OnEffectStart(Actor akTarget, Actor akCaster)
  debug.messagebox("Quest active effect start")
endEvent




Quest Property akriftquest  Auto  

ObjectReference Property AkSkuldafnmarker  Auto  
