Scriptname AKGrayFoxQuestScript extends ReferenceAlias  
location property aktheivesguild auto
location property aktheivesguild2 auto
location property riftenratway2 auto
quest property akquest auto
Actor Property VipirRef  Auto  
Actor Property NiruinRef  Auto  
Actor Property EtienneRef  Auto  
Actor Property GartharRef  Auto  
Actor Property RavynRef  Auto  
Actor Property CynricRef  Auto  
Actor Property ThrynnRef  Auto  
Actor Property RuneRef  Auto  
Actor Property MercerFreyRef  Auto  
objectreference property akgrayfoxbustmarker auto
objectreference property akkickedoutmarker auto
objectreference property akgrayfoxbust auto
alias property akplayer auto



Actor Property vexref  Auto  
Actor Property vekelref  Auto  
Actor Property dirgeref  Auto  
Actor Property delvinmalloryref  Auto  
Actor Property tonilaref  Auto  
Actor Property syndusref  Auto  
Actor Property vanrythref  Auto  
Actor Property arnskarref  Auto  
Actor Property herluinref  Auto  


event onupdate()

if game.getplayer().IsInLocation(aktheivesguild)
;debug.notification("player is in thieves guild")
if (game.getplayer().isdetectedby(vipirref)) || (game.getplayer().isdetectedby(Niruinref))|| (game.getplayer().isdetectedby(Etienneref))|| (game.getplayer().isdetectedby(GartharRef))|| (game.getplayer().isdetectedby(RavynRef)) || (game.getplayer().isdetectedby(CynricRef)) || (game.getplayer().isdetectedby(ThrynnRef)) || (game.getplayer().isdetectedby(RuneRef))|| (game.getplayer().isdetectedby(MercerFreyRef))

game.getplayer().moveto(akkickedoutmarker)
akgrayfoxbust.moveto(akgrayfoxbustmarker)

;akquest.setobjectivefailed(20)
akquest.setobjectivedisplayed(10)
debug.notification("You were caught!")

else
;debug.notification("player is udetected")

endif

elseif game.getplayer().IsInLocation(aktheivesguild2)

if (game.getplayer().isdetectedby(vexref)) || (game.getplayer().isdetectedby(vekelref))|| (game.getplayer().isdetectedby(dirgeref))|| (game.getplayer().isdetectedby(delvinmalloryref))|| (game.getplayer().isdetectedby(tonilaref)) || (game.getplayer().isdetectedby(syndusref )) || (game.getplayer().isdetectedby(vanrythref  )) || (game.getplayer().isdetectedby(arnskarref  ))|| (game.getplayer().isdetectedby(herluinref  ))

game.getplayer().moveto(akkickedoutmarker)
akgrayfoxbust.moveto(akgrayfoxbustmarker)

;akquest.setobjectivefailed(20)
akquest.setobjectivedisplayed(10)
debug.notification("You were caught!")

endif



endif
endevent


Event OnLocationChange(Location akOldLoc, Location akNewLoc)
if akquest.getstage() == 10
if aknewloc == aktheivesguild || aknewloc == aktheivesguild2
akplayer.RegisterForUpdate(1)
;debug.notification("entering theives guild")

elseif aknewloc != aktheivesguild && aknewloc != aktheivesguild2 && aknewloc != riftenratway2 && (Game.GetPlayer().GetItemCount(akgrayfoxbust) == 1)
getowningquest().setstage(20)
akplayer.unRegisterForUpdate()



endif
endif
endevent