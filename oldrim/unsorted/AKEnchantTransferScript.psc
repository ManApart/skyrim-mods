Scriptname AKEnchantTransferScript extends ObjectReference  
weapon weaponplain
weapon weaponenchant
MiscObject property soulgemgrandfilled Auto
soulgem aksoul
ObjectReference armorplain
armor armorenchant
form  tempitem
enchantment akenchant

Event OnMagicEffectApply(ObjectReference akCaster, MagicEffect akEffect)
if akcaster == game.getplayer()
	aksoul = None
	weaponplain = None
	weaponenchant = None
	armorplain = None
	armorenchant = None
	
	Int numitems = self.GetNumItems()
	int index
	if numitems > 3
		debug.Notification("Two many items are in the chest!")
		Return
	EndIf
	;look for the items
	index = 0
	while index < 3 ;&& weaponplain == None && armorplain == None
		tempitem = GetNthForm(index)
		if tempitem.gettype() == 26 ;Armor
			If (tempitem as Armor).GetEnchantment() == None
				armorplain = tempitem as ObjectReference
				;debug.notification("Found the plain Armor")
			ElseIf(tempitem as Armor).GetEnchantment() != None
				armorenchant = tempitem as armor
				;debug.notification("Found the enchanted Armor")		
			EndIf
		ElseIf tempitem.gettype() == 41 ;Weapon
			If (tempitem as weapon).GetEnchantment() == None
				weaponplain = tempitem as weapon
				;debug.notification("Found the plain weapon")
			ElseIf(tempitem as weapon).GetEnchantment() != None
				weaponenchant = tempitem as weapon
				;debug.notification("Found the enchanted weapon")	
			EndIf
		ElseIf (tempitem as MiscObject) == soulgemgrandfilled
			aksoul = tempitem as soulgem
			;debug.notification("Found Soulgem!")
		EndIf
		index += 1
	EndWhile
	
	;test the items
	If aksoul != None
		if armorplain != None && armorenchant != none
			akenchant = armorenchant.getenchantment()
			armorplain.setenchantment(akenchant)
			self.removeitem(aksoul)
			debug.Notification("Armor enchanted!")
		ElseIf weaponplain != None && Weaponenchant != None
			akenchant = weaponenchant.getenchantment()
			Weaponplain.setenchantment(akenchant)
			self.removeitem(aksoul)
			Debug.Notification("Weapon enchanted!")
		Else
			debug.Notification("Need 2 weapons or 2 armors, 1 enchanted and 1 plain!")
		EndIf
	Else
		Debug.Notification("Missing a filled Grand Soulgem!")
	EndIf
EndIf
EndEvent

