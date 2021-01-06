Scriptname AKRoyalNordicTriggerScript extends ObjectReference  

actor property AKMale auto
actor property AKFemale auto
objectreference property akTrigger1 auto
objectreference property akTrigger2 auto
message property akinspectmessage1 auto ; has ebony
message property akinspectmessage2 auto ; doesn't have ebony
message property AKRoyalLootChoiceMessage auto
perk property EbonySmithing auto
perk property AKRoyalSmithing auto
int button

Event OnActivate(ObjectReference akActionRef)
;debug.notification("Activated!")
button = akroyallootchoicemessage.show()
if button == 0 ; Loot
	debug.notification("As you attempt to loot the Draugr, it wakes up!")
	akmale.StartCombat(Game.GetPlayer())
	utility.wait(1.5)
	akFemale.StartCombat(Game.GetPlayer())
	aktrigger1.disable()
	aktrigger2.disable()

elseif button == 1 ; Inspect
	if game.getplayer().hasperk(EbonySmithing)
		akinspectmessage1.show()
	else
		akinspectmessage2.show()
	endif
	game.getplayer().addperk(akroyalsmithing)

elseif button == 2 ;Nothing

endif
endevent


