Scriptname Akfriendoftimealter extends ObjectReference  




Event OnActivate(ObjectReference akActionRef)

	if  akquest.getstage() <= 20
		akquest.start()
akquest.setstage(30)
akquest.setobjectivecompleted(20)
akquest.setobjectivedisplayed(30)

	;debug.messagebox("Shrine activated")
	



elseif akquest.getstage() == 65
akquestscript.akportalopen()
;debug.notification("Statue activated - opening portal")



elseif akquest.getstage() == 75 && akdeadcount == 6 && (akcrystalref.GetParentCell() == Game.GetPlayer().GetParentCell())
akcrystalref.disable()
akquest.setstage(80)

elseif akquest.getstage() == 75 && akdeadcount < 6 && (akcrystalref.GetParentCell() == Game.GetPlayer().GetParentCell())
debug.notification("You must kill the remaining curroptions!")
debug.notification("You have killed " + akdeadcount+ " corruptions")

elseif akquest.getstage() >= 30 && (akaetasref.GetParentCell() != Game.GetPlayer().GetParentCell())
;akaetasref.enable()
akquestscript.aetaswarp()

elseif akquestscript.akriftsclosed >= 1 && (akcrystalref.GetParentCell() != Game.GetPlayer().GetParentCell())
debug.notification("I have closed " + akquestscript.akriftsclosed + " rifts.")
if akhotquestscript.akcuredcount >=1
debug.notification("I have cured " + akhotquestscript.akcuredcount+ " people of Killitus.")
endif
	endif
endevent


objectreference property akaetasref auto
objectreference property akshrinemarker auto
quest property akquest auto
int property akportalopened auto
activator property fadeInFX auto
Qf_akfriendoftime_010015f7 property akquestscript auto
qf_akheartoftime_01013b1f property akhotquestscript auto
ObjectReference Property akcrystalref  Auto  
int property akdeadcount auto
