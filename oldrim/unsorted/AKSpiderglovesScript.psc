Scriptname AKSpiderglovesScript extends ObjectReference  

;this script adds Spidy's web powers when you equip the mask for the first time.
;spell property web auto
;game.getplayer().addspell(web)

spell property akwebtangle auto
spell property webimpact auto
spell property webpull auto
spell property webpull2 auto
spell property webzip auto
spell property aksclimbspell auto


Event OnEquipped(Actor akActor)
  if akActor == Game.GetPlayer()
game.getplayer().addspell(akwebtangle)
game.getplayer().addspell(webimpact)
game.getplayer().addspell(webpull)
game.getplayer().addspell(webpull2)
game.getplayer().addspell(webzip)
game.getplayer().addspell(aksclimbspell) 
  endIf
endEvent


