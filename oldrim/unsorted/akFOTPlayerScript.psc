Scriptname akFOTPlayerScript extends ReferenceAlias  
spell property akslowtimespell auto
quest property akfot auto
actor property akaetas auto
location property akaetaschamberlocation auto



Event OnSpellCast(Form akSpell)
Spell spellCast = akSpell as Spell
;debug.messagebox("Casting Spell")
;game.showhelpmessage()
  if (spellCast && spellCast == akslowtimespell) && akfot.getstage() == 45 &&  (akaetas.GetParentCell() == Game.GetPlayer().GetParentCell())
debug.notification("Aetas observes your demonstration of the Slowtime shout.")
getowningquest().setstage(50)
  endIf
endEvent








Event OnLocationChange(Location akOldLoc, Location akNewLoc)
if aknewloc == akaetaschamberlocation
akfot.setstage(70)
endif

endevent




