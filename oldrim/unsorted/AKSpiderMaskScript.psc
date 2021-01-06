Scriptname AKSpiderMaskScript extends ObjectReference  
;this script adds Spidy's powers when you equip the mask for the first time.
perk property akspiderperk auto

Event OnEquipped(Actor akActor)
  if akActor == Game.GetPlayer()
game.getplayer().addperk(akspiderperk)
    
  endIf
endEvent

