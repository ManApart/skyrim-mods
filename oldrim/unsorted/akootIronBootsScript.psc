Scriptname akootIronBootsScript extends ObjectReference  


Event OnEquipped(Actor akActor)
Game.SetGameSettingFloat("fPerkHeavyArmorSinkGravityMult", 100)
Game.SetGameSettingint("iPerkHeavyArmorSinkSum", 100)
debug.notification("equiped")
endevent



Event OnUnequipped(Actor akActor)
Game.SetGameSettingFloat("fPerkHeavyArmorSinkGravityMult", 15)
Game.SetGameSettingint("iPerkHeavyArmorSinkSum", 35)
debug.notification("unequiped")
endevent


