Scriptname AKWebzipscript extends activemagiceffect  
SPELL Property AKSClimbSpell  Auto  
Activator property telemarkerbase auto
objectreference property telemarker auto
spell property webzip auto
int property mydistance auto
objectreference property floorbox auto


Event OnSpellCast(Form akSpell)
if akspell == webzip || akspell == aksclimbspell
	;debug.notification("casting spell")
	utility.wait(0.5)

	telemarker = (Game.FindrandomReferenceOfTypeFromRef(telemarkerbase, Game.GetPlayer(), 10000.0))
	;debug.notification("grabbed closest type")

	;make sure that marker is not disabled
	while telemarker.isdisabled() == 1
		telemarker = (Game.FindrandomReferenceOfTypeFromRef(telemarkerbase, Game.GetPlayer(), 10000.0))
	endwhile

	

		game.getplayer().moveto(telemarker)
		;debug.notification("Web Zipped")
		telemarker.disable()
		telemarker.delete()
		;debug.notification("marker deleted")






endif
endEvent

