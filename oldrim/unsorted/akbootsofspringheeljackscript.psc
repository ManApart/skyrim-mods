Scriptname akbootsofspringheeljackscript extends ObjectReference  


Event OnEquipped(Actor akActor)
  if akActor == Game.GetPlayer()
;    Debug.Trace("We were equipped by the player!")

	Game.GetPlayer().addperk(akboots)
 	akjumporig = Game.GetGameSettingFloat("fjumpheightmin")
;	fjumpheightmin = 200

	;GetGameSettingFloat("fjumpheightmin") = akjump
  endIf
endEvent
perk Property akboots  Auto  


Float Property akjumporig  Auto  

Float Property akjump  Auto  
