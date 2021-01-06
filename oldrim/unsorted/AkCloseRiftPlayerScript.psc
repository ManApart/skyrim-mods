Scriptname AkCloseRiftPlayerScript extends ReferenceAlias  

SPELL Property akhealSpell  Auto  
ObjectReference Property akriftref  Auto  
AKRiftSpawnerScript Property QuestRef auto


Event OnSpellCast(Form akSpell)
;debug.notification("player casting spell")
 



  if akspell == akhealspell 
	if (Game.GetPlayer().GetDistance(akriftref)<= 250.0)

		questref.akspawnstage = (questref.akspawnstage + 1)
		questref.akriftshrink()
;		debug.notification("Hit with heal spell")

else
	debug.notification("You are too far from a time wound!")
endif
endif
endevent



