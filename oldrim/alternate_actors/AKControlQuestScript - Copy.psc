Scriptname AKControlQuestScript extends Quest  
ObjectReference property akcontainer Auto

;function transfers traits from one actor to another
function AKTraitTransfer(actor akbase, actor aknew)
ActorBase akbasebase = akbase.GetActorBase()
ActorBase aknewbase = aknew.GetActorBase()


;change traits and head parts-------------------------------

aknewbase.sethaircolor(akbasebase.gethaircolor())
aknewbase.setheight(akbasebase.getheight())



int hp = akbasebase.GetNumHeadParts()
int i = 0
WHILE i <= hp
aknewbase.setnthheadpart(akbasebase.getnthheadpart(i), i)
i += 1
EndWHILE

aknew.setrace(akbase.getrace())

; Equip weapons and spells-------------------------
shout akshout = akbase.GetEquippedShout()
weapon leftweapon = akbase.GetEquippedWeapon() 
weapon rightweapon = akbase.GetEquippedWeapon(true)
spell leftspell = akbase.GetEquippedSpell(1)
spell rightspell = akbase.GetEquippedSpell(0)
armor sheild = akbase.GetEquippedShield()

;aknew.EquipShout(akshout)
;if rightweapon != None
;	aknew.EquipItemex(rightweapon, 1)
;elseif rightspell != None
;	aknew.equipspell(rightspell, 1)
;endif
;if sheild != None
	aknew.equipitem(sheild, false, true)
;elseif leftspell != None
;	aknew.EquipSpell(leftspell, 1)
;elseif leftweapon != None
;	aknew.equipitemex(leftweapon, 2)
;EndIf

; Equip armor (and swap inventory items over)-------------------------


;ObjectReference  Cuirass = akbase.GetWornForm(0x00000004) as ObjectReference  ;32
;	debug.Notification("cuirass = " + Cuirass.GetBaseObject().getname() as String)
;ObjectReference  Gauntlets = akbase.GetWornForm(0x00000010) as ObjectReference  ;34
;ObjectReference  Amulet = akbase.GetWornForm(0x00000020) as ObjectReference  ; 35
;ObjectReference  Circlet = akbase.GetWornForm(0x00001000) as ObjectReference  ;42
;ObjectReference  Helm = akbase.GetWornForm(0x00000001) as ObjectReference  ; 30
ObjectReference  Boots = akbase.GetWornForm(0x00000080) as ObjectReference  ; 37
	debug.Notification("boots = " + boots.GetBaseObject().getname() as String)



;aknew.EquipItem( cuirass,false, true)
;aknew.EquipItem( gauntlets,false, true)
;aknew.EquipItem( amulet,false, true)
;aknew.EquipItem( circlet,false, true)
;aknew.EquipItem( helm,false, true)
aknew.EquipItem( Boots,false, true)
akbase.RemoveAllItems(aknew)



; Add spells to temp actor and then delete them from player-------------------------
;keep the revert spell (may want an MCM option to revert as well).

; Update the actor-------------------------
aknewbase.setweight(akbasebase.getweight()) ;doing this down here for gray face bug
aknew.disable()
aknew.QueueNiNodeUpdate()
aknew.enable()
debug.Notification("Traits Swapped")
EndFunction