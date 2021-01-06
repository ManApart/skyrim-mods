Scriptname AKIcarianFlightScrollScript extends activemagiceffect  
Float Property akjumporig  Auto  
Float Property akjump  Auto  

Event OnEffectStart(Actor akTarget, Actor akCaster)
  if akTarget == Game.GetPlayer()
   ; Debug.notification("Springheel boots were equipped by the player!")
	;akjumporig = Game.GetGameSettingFloat("fjumpheightmin")
	Game.SetGameSettingFloat("fjumpheightmin", akjump)
	;Game.SetGameSettingFloat("fJumpMoveBase", 100)
	;debug.notification("Current jump height =" + Game.GetGameSettingFloat("fjumpheightmin") + "Other:" + Game.GetGameSettingFloat("fJumpMoveBase") )
  endIf
endEvent


Event OnEffectFinish(Actor akTarget, Actor akCaster)
	Game.SetGameSettingFloat("fjumpheightmin", akjumporig)
	;Game.SetGameSettingFloat("fJumpMoveBase", 0)
	;debug.notification("Current jump height =" + Game.GetGameSettingFloat("fjumpheightmin") )
endevent


