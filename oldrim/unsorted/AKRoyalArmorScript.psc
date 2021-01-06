Scriptname AKRoyalArmorScript extends ObjectReference  
armor property AKRoyalNordicBootsEnc auto
armor property AKRoyalNordicCuirassEnc auto
armor property AKRoyalNordicCuirassWhiteEnc auto
armor property AKRoyalNordicGauntletsEnc auto
armor property AKRoyalNordicHelmetEnc auto
armor property AKRoyalNordicHelmetWhiteEnc auto
perk property akroyalbuff auto
perk property akroyalsmithing auto
message property akinspectmessage3 auto
actor player


Event OnEquipped(Actor akActor)
player = game.getplayer()
if akActor == player
	if player.IsEquipped(AKRoyalNordicBootsEnc) && (player.IsEquipped(AKRoyalNordicCuirassEnc) || player.IsEquipped(AKRoyalNordicCuirassWhiteEnc)) && player.IsEquipped(AKRoyalNordicGauntletsEnc) && (player.IsEquipped(AKRoyalNordicHelmetEnc) || player.IsEquipped(AKRoyalNordicHelmetWhiteEnc))
		;debug.Notification("You recieve a speechcraft bonus from equipping the full set of Enchanted Royal Nordic")
		player.addperk(akroyalbuff)
	endif

	if player.hasperk(akroyalsmithing) == 0
		akinspectmessage3.show()
		player.addperk(akroyalsmithing)
	endif
endif
endevent


Event OnUnequipped(Actor akActor)
player = game.getplayer()
player.removeperk(akroyalbuff)
endevent
