Scriptname AKWReadyClawMagicScript extends ActiveMagicEffect  



Int Property AKClawMode  Auto  
ObjectReference Property akclawsref  Auto  
Weapon akrightweapon
Weapon akleftweapon
spell akrightspell
spell akleftspell
armor aksheild

Event OnEffectStart(Actor Target, Actor Caster)

if akclawmode == 0
akequipclaws()


elseif akclawmode== 1
akunequipclaws()

endif
endevent




Function akunequipclaws()
debug.notification ("Unequiping Claws, you handsome man, you.")
akclawmode = 0

Game.GetPlayer().removeItem(akclawsref, 1, true)
Game.GetPlayer().unEquipItem(akclawsref, true, true)
endfunction




Function akequipclaws()
debug.notification("Equipping Claws; people like you.")
akclawmode = 1

akrightweapon = Game.GetPlayer().GetEquippedWeapon()
akleftweapon = Game.GetPlayer().GetEquippedWeapon(true)
aksheild = Game.GetPlayer().GetEquippedShield()
akrightspell = Game.Getplayer().GetEquippedSpell(1)
akleftspell = Game.Getplayer().GetEquippedSpell(0)

Game.GetPlayer().unEquipItem(akrightweapon, true, true)
Game.GetPlayer().unEquipItem(akleftweapon, true, true)
Game.GetPlayer().unEquipItem(aksheild, true, true)
Game.GetPlayer().unEquipspell(akrightspell,1)
Game.GetPlayer().unEquipspell(akleftspell,0)

Game.GetPlayer().AddItem(akclawsref, 1, true)
Game.GetPlayer().EquipItem(akclawsref, true, true)
debug.notification("Claws Euipped; people still like you.")
endfunction



