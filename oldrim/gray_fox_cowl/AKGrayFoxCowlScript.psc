Scriptname AKGrayFoxCowlScript extends Quest  
;The update of my gray cowl script

;Misc Variables
FormList Property CrimeFactionsList auto
Actor Property playerref Auto
Armor Property AKArmorGreyCowl Auto
spell property AKGrayCowlAbility auto
spell property AKGrayFoxStopCombatSpell auto
spell property AKGrayCowlAbilityDispel auto
Int Property updatetime = 10 Auto
int currentbountynon 
int currentbountyv 
int currentbounty 

int addbountynon
int addbountyv
int addbounty

; Player's Bounty (NonViolent)
;int property  auto
int property akhaafingargold auto
int property akhjaalmarchgold auto
int property akpalegold auto
int property akwinterholdgold auto
int property akreachgold auto
int property akwhiterungold auto
int property akeastmarchgold auto
int property akfalkreathgold auto
int property akriftgold auto

int property akwigenericcrimefactiongold auto
int property akcrimefactiongreybeardgold auto
int property akcrimefactionimperialgold auto
int property akcrimefactionorcsgold auto
int property akcrimefactionsonsgold auto
int property akcrimefactionthievesguildgold auto
int property akbladesfactiongold auto
int property akcollegeofwinterholdfactiongold auto
int property akcompanionsfactiongold auto
int property akdarkbrotherhoodfactiongold auto

; Player's Bounty (Violent)
int property akhaafingargoldv auto
int property akhjaalmarchgoldv auto
int property akpalegoldv auto
int property akwinterholdgoldv auto
int property akreachgoldv auto
int property akwhiterungoldv auto
int property akeastmarchgoldv auto
int property akfalkreathgoldv auto
int property akriftgoldv auto

int property akwigenericcrimefactiongoldv auto
int property akcrimefactiongreybeardgoldv auto
int property akcrimefactionimperialgoldv auto
int property akcrimefactionorcsgoldv auto
int property akcrimefactionsonsgoldv auto
int property akcrimefactionthievesguildgoldv auto
int property akbladesfactiongoldv auto
int property akcollegeofwinterholdfactiongoldv auto
int property akcompanionsfactiongoldv auto
int property akdarkbrotherhoodfactiongoldv auto

;Fox's Bounty (Nonviolent)
int property akhaafingargoldf auto
int property akhjaalmarchgoldf auto
int property akpalegoldf auto
int property akwinterholdgoldf auto
int property akreachgoldf auto
int property akwhiterungoldf auto
int property akeastmarchgoldf auto
int property akfalkreathgoldf auto
int property akriftgoldf auto

int property akwigenericcrimefactiongoldf auto
int property akcrimefactiongreybeardgoldf auto
int property akcrimefactionimperialgoldf auto
int property akcrimefactionorcsgoldf auto
int property akcrimefactionsonsgoldf auto
int property akcrimefactionthievesguildgoldf auto
int property akbladesfactiongoldf auto
int property akcollegeofwinterholdfactiongoldf auto
int property akcompanionsfactiongoldf auto
int property akdarkbrotherhoodfactiongoldf auto

;Fox's Bounty (Violent)
int property akhaafingargoldfv auto
int property akhjaalmarchgoldfv auto
int property akpalegoldfv auto
int property akwinterholdgoldfv auto
int property akreachgoldfv auto
int property akwhiterungoldfv auto
int property akeastmarchgoldfv auto
int property akfalkreathgoldfv auto
int property akriftgoldfv auto

int property akwigenericcrimefactiongoldfv auto
int property akcrimefactiongreybeardgoldfv auto
int property akcrimefactionimperialgoldfv auto
int property akcrimefactionorcsgoldfv auto
int property akcrimefactionsonsgoldfv auto
int property akcrimefactionthievesguildgoldfv auto
int property akbladesfactiongoldfv auto
int property akcollegeofwinterholdfactiongoldfv auto
int property akcompanionsfactiongoldfv auto
int property akdarkbrotherhoodfactiongoldfv auto

;Hold Faction
faction property crimefactionhaafingar auto
faction property crimefactionhjaalmarch auto
faction property crimefactionpale auto
faction property crimefactionwinterhold auto
faction property crimefactionreach auto
faction property crimefactionwhiterun auto
faction property crimefactioneastmarch auto
faction property crimefactionfalkreath auto
faction property crimefactionrift auto
faction property akgrayfoxfaction auto

;Misc Faction
;faction property crimefaction auto
faction property wigenericcrimefaction auto
faction property crimefactiongreybeard auto
faction property crimefactionimperial auto
faction property crimefactionorcs auto
faction property crimefactionsons auto
faction property crimefactionthievesguild auto
faction property bladesfaction auto
faction property collegeofwinterholdfaction auto
faction property companionsfaction auto
faction property darkbrotherhoodfaction auto


Function AKCowlEquip()
AKGrayCowlAbility.cast(playerref)

;Store Player's Nonviolent Bounty
akhaafingargold = crimefactionhaafingar.getcrimegoldnonviolent() 
akhjaalmarchgold =crimefactionhjaalmarch.getcrimegoldnonviolent() 
akpalegold =crimefactionpale.getcrimegoldnonviolent() 
akwinterholdgold =crimefactionwinterhold.getcrimegoldnonviolent() 
akreachgold =crimefactionreach.getcrimegoldnonviolent() 
akwhiterungold =crimefactionwhiterun.getcrimegoldnonviolent() 
akeastmarchgold =crimefactioneastmarch.getcrimegoldnonviolent() 
akfalkreathgold =crimefactionfalkreath.getcrimegoldnonviolent() 
akriftgold =crimefactionrift.getcrimegoldnonviolent() 

akwigenericcrimefactiongold = wigenericcrimefaction.getcrimegoldnonviolent()  
akcrimefactiongreybeardgold = crimefactiongreybeard.getcrimegoldnonviolent()  
akcrimefactionimperialgold =crimefactionimperial.getcrimegoldnonviolent()  
akcrimefactionorcsgold =crimefactionorcs.getcrimegoldnonviolent()  
akcrimefactionsonsgold =crimefactionsons.getcrimegoldnonviolent()  
akcrimefactionthievesguildgold =crimefactionthievesguild.getcrimegoldnonviolent()  
akbladesfactiongold =bladesfaction.getcrimegoldnonviolent()  
akcollegeofwinterholdfactiongold =collegeofwinterholdfaction.getcrimegoldnonviolent()  
akcompanionsfactiongold =companionsfaction.getcrimegoldnonviolent()  
akdarkbrotherhoodfactiongold =darkbrotherhoodfaction.getcrimegoldnonviolent()  

currentbountynon = ((akhaafingargold + akhjaalmarchgold +akpalegold +akwinterholdgold +akreachgold +akwhiterungold +akeastmarchgold +akfalkreathgold +akriftgold ) + (akwigenericcrimefactiongold +akcrimefactiongreybeardgold +akcrimefactionimperialgold +akcrimefactionorcsgold + akcrimefactionsonsgold +akcrimefactionthievesguildgold +akbladesfactiongold+ akcollegeofwinterholdfactiongold + akcompanionsfactiongold + akdarkbrotherhoodfactiongold  ))
;debug.notification("Nonviolent Bounty ="+ currentbountynon)

;Store Player's Violent Bounty
akhaafingargoldv = crimefactionhaafingar.getcrimegoldviolent() 
akhjaalmarchgoldv =crimefactionhjaalmarch.getcrimegoldviolent()  
akpalegoldv =crimefactionpale.getcrimegoldviolent() 
akwinterholdgoldv =crimefactionwinterhold.getcrimegoldviolent() 
akreachgoldv =crimefactionreach.getcrimegoldviolent() 
akwhiterungoldv =crimefactionwhiterun.getcrimegoldviolent() 
akeastmarchgoldv =crimefactioneastmarch.getcrimegoldviolent() 
akfalkreathgoldv =crimefactionfalkreath.getcrimegoldviolent() 
akriftgoldv =crimefactionrift.getcrimegoldviolent() 

akwigenericcrimefactiongoldv = wigenericcrimefaction.getcrimegoldviolent()  
akcrimefactiongreybeardgoldv = crimefactiongreybeard.getcrimegoldviolent()  
akcrimefactionimperialgoldv =crimefactionimperial.getcrimegoldviolent()  
akcrimefactionorcsgoldv =crimefactionorcs.getcrimegoldviolent()  
akcrimefactionsonsgoldv =crimefactionsons.getcrimegoldviolent()  
akcrimefactionthievesguildgoldv =crimefactionthievesguild.getcrimegoldviolent()  
akbladesfactiongoldv =bladesfaction.getcrimegoldviolent()  
akcollegeofwinterholdfactiongoldv =collegeofwinterholdfaction.getcrimegoldviolent()  
akcompanionsfactiongoldv =companionsfaction.getcrimegoldviolent()  
akdarkbrotherhoodfactiongoldv =darkbrotherhoodfaction.getcrimegoldviolent()  

currentbountyv = ((akhaafingargoldv + akhjaalmarchgoldv +akpalegoldv +akwinterholdgoldv +akreachgoldv +akwhiterungoldv +akeastmarchgoldv +akfalkreathgoldv +akriftgoldv ) + (akwigenericcrimefactiongoldv +akcrimefactiongreybeardgoldv +akcrimefactionimperialgoldv +akcrimefactionorcsgoldv + akcrimefactionsonsgoldv +akcrimefactionthievesguildgoldv +akbladesfactiongoldv + akcollegeofwinterholdfactiongoldv + akcompanionsfactiongoldv + akdarkbrotherhoodfactiongoldv  ))
;debug.notification("Violent Bounty ="+ currentbountyv)

;Get total current bounty
currentbounty = ( currentbountynon +currentbountyv)
;debug.notification("Total current Bounty ="+ currentbounty)



;Make Sure Gray Fox has bounty
if akhaafingargoldf < 500
	akhaafingargoldf = 500
endif

if akhjaalmarchgoldf< 500
	akhjaalmarchgoldf= 500
endif

if akpalegoldf< 500
	akpalegoldf= 500
endif

if akwinterholdgoldf< 500
	akwinterholdgoldf= 500
endif

if akreachgoldf< 500
	akreachgoldf= 500
endif

if akwhiterungoldf< 500
	akwhiterungoldf= 500
endif

if akeastmarchgoldf< 500
	akeastmarchgoldf= 500
endif

if akfalkreathgoldf< 500
	akfalkreathgoldf= 500
endif

if akriftgoldf< 500
	akriftgoldf= 500
endif



;Add Gray Fox NonViolent Bounty
crimefactionhaafingar.setcrimegold(akhaafingargoldf) 
crimefactionhjaalmarch.setcrimegold(akhjaalmarchgoldf) 
crimefactionpale.setcrimegold(akpalegoldf)
crimefactionwinterhold.setcrimegold(akwinterholdgoldf) 
crimefactionreach.setcrimegold(akreachgoldf) 
crimefactionwhiterun.setcrimegold(akwhiterungoldf) 
crimefactioneastmarch.setcrimegold(akeastmarchgoldf) 
crimefactionfalkreath.setcrimegold(akfalkreathgoldf) 
crimefactionrift.setcrimegold(akriftgoldf) 

wigenericcrimefaction.setcrimegold( akwigenericcrimefactiongoldf )
 crimefactiongreybeard.setcrimegold( akcrimefactiongreybeardgoldf )
 crimefactionimperial.setcrimegold( akcrimefactionimperialgoldf )
 crimefactionorcs.setcrimegold( akcrimefactionorcsgoldf )
 crimefactionsons.setcrimegold( akcrimefactionsonsgoldf )
 crimefactionthievesguild.setcrimegold( akcrimefactionthievesguildgoldf )
 bladesfaction.setcrimegold( akbladesfactiongoldf )
 collegeofwinterholdfaction.setcrimegold( akcollegeofwinterholdfactiongoldf )
 companionsfaction.setcrimegold( akcompanionsfactiongoldf )
 darkbrotherhoodfaction.setcrimegold(akdarkbrotherhoodfactiongoldf )

addbountynon = ((akhaafingargoldf + akhjaalmarchgoldf +akpalegoldf +akwinterholdgoldf +akreachgoldf +akwhiterungoldf +akeastmarchgoldf +akfalkreathgoldf +akriftgoldf ) + (akwigenericcrimefactiongoldf +akcrimefactiongreybeardgoldf +akcrimefactionimperialgoldf +akcrimefactionorcsgoldf + akcrimefactionsonsgoldf +akcrimefactionthievesguildgoldf +akbladesfactiongoldf+ akcollegeofwinterholdfactiongoldf + akcompanionsfactiongoldf + akdarkbrotherhoodfactiongoldf  ))


;Add Gray Fox Violent Bounty
crimefactionhaafingar.setcrimegoldviolent(akhaafingargoldfv) 
crimefactionhjaalmarch.setcrimegoldviolent(akhjaalmarchgoldfv) 
crimefactionpale.setcrimegoldviolent(akpalegoldfv)
crimefactionwinterhold.setcrimegoldviolent(akwinterholdgoldfv) 
crimefactionreach.setcrimegoldviolent(akreachgoldfv) 
crimefactionwhiterun.setcrimegoldviolent(akwhiterungoldfv) 
crimefactioneastmarch.setcrimegoldviolent(akeastmarchgoldfv) 
crimefactionfalkreath.setcrimegoldviolent(akfalkreathgoldfv) 
crimefactionrift.setcrimegoldviolent(akriftgoldfv) 

wigenericcrimefaction.setcrimegoldviolent( akwigenericcrimefactiongoldfv )
 crimefactiongreybeard.setcrimegoldviolent( akcrimefactiongreybeardgoldfv )
 crimefactionimperial.setcrimegoldviolent( akcrimefactionimperialgoldfv )
 crimefactionorcs.setcrimegoldviolent( akcrimefactionorcsgoldfv )
 crimefactionsons.setcrimegoldviolent( akcrimefactionsonsgoldfv )
 crimefactionthievesguild.setcrimegoldviolent( akcrimefactionthievesguildgoldfv )
 bladesfaction.setcrimegoldviolent( akbladesfactiongoldfv )
 collegeofwinterholdfaction.setcrimegoldviolent( akcollegeofwinterholdfactiongoldfv )
 companionsfaction.setcrimegoldviolent( akcompanionsfactiongoldfv )
 darkbrotherhoodfaction.setcrimegoldviolent(akdarkbrotherhoodfactiongoldfv )

addbountyv = ((akhaafingargoldfv + akhjaalmarchgoldfv +akpalegoldfv +akwinterholdgoldfv +akreachgoldfv +akwhiterungoldfv +akeastmarchgoldfv +akfalkreathgoldfv +akriftgoldfv ) + (akwigenericcrimefactiongoldfv +akcrimefactiongreybeardgoldfv +akcrimefactionimperialgoldfv +akcrimefactionorcsgoldfv + akcrimefactionsonsgoldfv +akcrimefactionthievesguildgoldfv +akbladesfactiongoldfv+ akcollegeofwinterholdfactiongoldfv + akcompanionsfactiongoldfv + akdarkbrotherhoodfactiongoldfv  ))


;mod total bounty
addbounty = (0- addbountynon - addbountyv)
Game.IncrementStat("Total Lifetime Bounty", addbounty)
playerref.addtofaction(akgrayfoxfaction)
;debug.notification("Cowl Equipped")


;Make them haters gonna hate

 int cfIndex = 0
    while (cfIndex < CrimeFactionsList.GetSize())
;         Debug.Trace("WEREWOLF: Setting enemy flag on " + CrimeFactionsList.GetAt(cfIndex))
        (CrimeFactionsList.GetAt(cfIndex) as Faction).SetPlayerEnemy()
        cfIndex += 1
    endwhile
AKGrayFoxStopCombatSpell.cast(playerref)
RegisterForSingleUpdate(updatetime)
EndFunction






Function AKCowlUnequip()
playerref.removespell(AKGrayCowlAbility)
playerref.dispelspell(AKGrayCowlAbility)
AKGrayCowlAbilityDispel.cast(playerref)

;Store Gray Fox Nonviolent Bounty
akhaafingargoldf = crimefactionhaafingar.getcrimegoldnonviolent() 
akhjaalmarchgoldf =crimefactionhjaalmarch.getcrimegoldnonviolent() 
akpalegoldf =crimefactionpale.getcrimegoldnonviolent() 
akwinterholdgoldf =crimefactionwinterhold.getcrimegoldnonviolent() 
akreachgoldf =crimefactionreach.getcrimegoldnonviolent() 
akwhiterungoldf =crimefactionwhiterun.getcrimegoldnonviolent() 
akeastmarchgoldf =crimefactioneastmarch.getcrimegoldnonviolent() 
akfalkreathgoldf =crimefactionfalkreath.getcrimegoldnonviolent() 
akriftgoldf =crimefactionrift.getcrimegoldnonviolent() 

akwigenericcrimefactiongoldf = wigenericcrimefaction.getcrimegoldnonviolent()  
akcrimefactiongreybeardgoldf = crimefactiongreybeard.getcrimegoldnonviolent()  
akcrimefactionimperialgoldf =crimefactionimperial.getcrimegoldnonviolent()  
akcrimefactionorcsgoldf =crimefactionorcs.getcrimegoldnonviolent()  
akcrimefactionsonsgoldf =crimefactionsons.getcrimegoldnonviolent()  
akcrimefactionthievesguildgoldf =crimefactionthievesguild.getcrimegoldnonviolent()  
akbladesfactiongoldf =bladesfaction.getcrimegoldnonviolent()  
akcollegeofwinterholdfactiongoldf =collegeofwinterholdfaction.getcrimegoldnonviolent()  
akcompanionsfactiongoldf =companionsfaction.getcrimegoldnonviolent()  
akdarkbrotherhoodfactiongoldf =darkbrotherhoodfaction.getcrimegoldnonviolent()  

currentbountynon = ((akhaafingargoldf + akhjaalmarchgoldf +akpalegoldf +akwinterholdgoldf +akreachgoldf +akwhiterungoldf +akeastmarchgoldf +akfalkreathgoldf +akriftgoldf ) + (akwigenericcrimefactiongoldf +akcrimefactiongreybeardgoldf +akcrimefactionimperialgoldf +akcrimefactionorcsgoldf + akcrimefactionsonsgoldf +akcrimefactionthievesguildgoldf +akbladesfactiongoldf+ akcollegeofwinterholdfactiongoldf + akcompanionsfactiongoldf + akdarkbrotherhoodfactiongoldf  ))
;debug.notification("Nonviolent Bounty ="+ currentbountynon)

;Store Gray Fox Violent Bounty
akhaafingargoldfv = crimefactionhaafingar.getcrimegoldviolent() 
akhjaalmarchgoldfv =crimefactionhjaalmarch.getcrimegoldviolent()  
akpalegoldfv =crimefactionpale.getcrimegoldviolent() 
akwinterholdgoldfv =crimefactionwinterhold.getcrimegoldviolent() 
akreachgoldfv =crimefactionreach.getcrimegoldviolent() 
akwhiterungoldfv =crimefactionwhiterun.getcrimegoldviolent() 
akeastmarchgoldfv =crimefactioneastmarch.getcrimegoldviolent() 
akfalkreathgoldfv =crimefactionfalkreath.getcrimegoldviolent() 
akriftgoldfv =crimefactionrift.getcrimegoldviolent() 

akwigenericcrimefactiongoldfv = wigenericcrimefaction.getcrimegoldviolent()  
akcrimefactiongreybeardgoldfv = crimefactiongreybeard.getcrimegoldviolent()  
akcrimefactionimperialgoldfv =crimefactionimperial.getcrimegoldviolent()  
akcrimefactionorcsgoldfv =crimefactionorcs.getcrimegoldviolent()  
akcrimefactionsonsgoldfv =crimefactionsons.getcrimegoldviolent()  
akcrimefactionthievesguildgoldfv =crimefactionthievesguild.getcrimegoldviolent()  
akbladesfactiongoldfv =bladesfaction.getcrimegoldviolent()  
akcollegeofwinterholdfactiongoldfv =collegeofwinterholdfaction.getcrimegoldviolent()  
akcompanionsfactiongoldfv =companionsfaction.getcrimegoldviolent()  
akdarkbrotherhoodfactiongoldfv =darkbrotherhoodfaction.getcrimegoldviolent()


currentbountyv = ((akhaafingargoldfv + akhjaalmarchgoldfv +akpalegoldfv +akwinterholdgoldfv +akreachgoldfv +akwhiterungoldfv +akeastmarchgoldfv +akfalkreathgoldfv +akriftgoldfv )+ (akwigenericcrimefactiongoldfv +akcrimefactiongreybeardgoldfv +akcrimefactionimperialgoldfv +akcrimefactionorcsgoldfv + akcrimefactionsonsgoldfv +akcrimefactionthievesguildgoldfv +akbladesfactiongoldfv + akcollegeofwinterholdfactiongoldfv + akcompanionsfactiongoldfv + akdarkbrotherhoodfactiongoldfv  ))
;debug.notification("Violent Bounty ="+ currentbountyv)

;Get total current bounty
currentbounty = ( currentbountynon +currentbountyv)
;debug.notification("Total current Bounty ="+ currentbounty)



;Add Player NonViolent Bounty
crimefactionhaafingar.setcrimegold(akhaafingargold) 
crimefactionhjaalmarch.setcrimegold(akhjaalmarchgold) 
crimefactionpale.setcrimegold(akpalegold)
crimefactionwinterhold.setcrimegold(akwinterholdgold) 
crimefactionreach.setcrimegold(akreachgold) 
crimefactionwhiterun.setcrimegold(akwhiterungold) 
crimefactioneastmarch.setcrimegold(akeastmarchgold) 
crimefactionfalkreath.setcrimegold(akfalkreathgold) 
crimefactionrift.setcrimegold(akriftgold) 

wigenericcrimefaction.setcrimegold( akwigenericcrimefactiongold )
 crimefactiongreybeard.setcrimegold( akcrimefactiongreybeardgold )
 crimefactionimperial.setcrimegold( akcrimefactionimperialgold )
 crimefactionorcs.setcrimegold( akcrimefactionorcsgold )
 crimefactionsons.setcrimegold( akcrimefactionsonsgold )
 crimefactionthievesguild.setcrimegold( akcrimefactionthievesguildgold )
 bladesfaction.setcrimegold( akbladesfactiongold )
 collegeofwinterholdfaction.setcrimegold( akcollegeofwinterholdfactiongold )
 companionsfaction.setcrimegold( akcompanionsfactiongold )
 darkbrotherhoodfaction.setcrimegold(akdarkbrotherhoodfactiongold )

addbountynon = ((akhaafingargold + akhjaalmarchgold +akpalegold +akwinterholdgold +akreachgold +akwhiterungold +akeastmarchgold +akfalkreathgold +akriftgold ) + (akwigenericcrimefactiongold +akcrimefactiongreybeardgold +akcrimefactionimperialgold +akcrimefactionorcsgold + akcrimefactionsonsgold +akcrimefactionthievesguildgold +akbladesfactiongold + akcollegeofwinterholdfactiongold + akcompanionsfactiongold + akdarkbrotherhoodfactiongold  ))


;Add Player Violent Bounty
crimefactionhaafingar.setcrimegoldviolent(akhaafingargoldv) 
crimefactionhjaalmarch.setcrimegoldviolent(akhjaalmarchgoldv) 
crimefactionpale.setcrimegoldviolent(akpalegoldv)
crimefactionwinterhold.setcrimegoldviolent(akwinterholdgoldv) 
crimefactionreach.setcrimegoldviolent(akreachgoldv) 
crimefactionwhiterun.setcrimegoldviolent(akwhiterungoldv) 
crimefactioneastmarch.setcrimegoldviolent(akeastmarchgoldv) 
crimefactionfalkreath.setcrimegoldviolent(akfalkreathgoldv) 
crimefactionrift.setcrimegoldviolent(akriftgoldv) 

wigenericcrimefaction.setcrimegoldviolent( akwigenericcrimefactiongoldv)
 crimefactiongreybeard.setcrimegoldviolent( akcrimefactiongreybeardgoldv)
 crimefactionimperial.setcrimegoldviolent( akcrimefactionimperialgoldv)
 crimefactionorcs.setcrimegoldviolent( akcrimefactionorcsgoldv)
 crimefactionsons.setcrimegoldviolent( akcrimefactionsonsgoldv)
 crimefactionthievesguild.setcrimegoldviolent( akcrimefactionthievesguildgoldv)
 bladesfaction.setcrimegoldviolent( akbladesfactiongoldv)
 collegeofwinterholdfaction.setcrimegoldviolent( akcollegeofwinterholdfactiongoldv)
 companionsfaction.setcrimegoldviolent( akcompanionsfactiongoldv)
 darkbrotherhoodfaction.setcrimegoldviolent(akdarkbrotherhoodfactiongoldv)


addbountyv = ((akhaafingargoldv + akhjaalmarchgoldv +akpalegoldv +akwinterholdgoldv +akreachgoldv +akwhiterungoldv +akeastmarchgoldv +akfalkreathgoldv +akriftgoldv ) + (akwigenericcrimefactiongoldv +akcrimefactiongreybeardgoldv +akcrimefactionimperialgoldv +akcrimefactionorcsgoldv + akcrimefactionsonsgoldv +akcrimefactionthievesguildgoldv +akbladesfactiongoldv + akcollegeofwinterholdfactiongoldv + akcompanionsfactiongoldv + akdarkbrotherhoodfactiongoldv  ))

;mod total bounty
addbounty = (0- addbountynon - addbountyv)
Game.IncrementStat("Total Lifetime Bounty", addbounty)
playerref.removefromfaction(akgrayfoxfaction)
;debug.notification("Cowl UnEquipped")

;Stop them haters from hating
 int cfIndex = 0
    while (cfIndex < CrimeFactionsList.GetSize())
;         Debug.Trace("WEREWOLF: Removing enemy flag from " + CrimeFactionsList.GetAt(cfIndex))
        (CrimeFactionsList.GetAt(cfIndex) as Faction).SetPlayerEnemy(false)
        cfIndex += 1
    endwhile

AKGrayFoxStopCombatSpell.cast(playerref)
EndFunction


Event OnUpdate()
	akupdate()
EndEvent

Function akupdate()
	If playerref.IsEquipped(akarmorgreycowl)
		AKGrayCowlAbility.cast(playerref)
		RegisterForSingleUpdate(updatetime)
		;Debug.Notification("Cowl on")
	Else
		playerref.removespell(AKGrayCowlAbility)
		playerref.dispelspell(AKGrayCowlAbility)
		AKGrayCowlAbilityDispel.cast(playerref)
		;Debug.Notification("Cowl off")
		
	EndIf
EndFunction

