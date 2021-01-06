Scriptname AKSpiderBootsScript extends ObjectReference  

;this script adds Spidy's agility powers when you equip it for the first time.
perk property akspiderperk auto
int property jumpstore auto
int property speedstore auto

int property jumpamount auto
int property speedamount auto

Event OnEquipped(Actor akActor)
  if akActor == Game.GetPlayer()
debug.notification("You feel more agile.")
game.getplayer().addperk(akspiderperk)

jumpstore = game.getplayer().getAV("jumpingbonus") as int
speedstore = game.getplayer().getAV("speedmult") as int

;game.getplayer().forceAV("jumpingbonus", jumpamount)
;game.getplayer().SetAV("speedmult", speedamount)


;SetGameSetting("fJumpHeightMin", 150) 
  endIf
endEvent


Event OnUnequipped(Actor akActor)
  if akActor == Game.GetPlayer()
;  game.getplayer().SetAV("jumpingbonus", jumpstore)
;game.getplayer().SetAV("speedmult", speedstore)


  endIf
endEvent