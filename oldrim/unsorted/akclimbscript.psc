Scriptname akclimbscript extends activemagiceffect  
objectreference property mycaster auto
spell property akwebzip auto
objectreference property akfloorbox auto
int property mydistance auto
Activator property telemarkerbase auto
objectreference property telemarker auto

;Event OnEffectStart(Actor akTarget, Actor akCaster)

event onupdate()
mycaster.moveto(game.getplayer())
akwebzip.cast(mycaster) 

utility.wait(0.5)

telemarker = (Game.FindrandomReferenceOfTypeFromRef(telemarkerbase, Game.GetPlayer(), 10000.0))

;make sure that marker is not disabled
	while telemarker.isdisabled() == 1
		telemarker = (Game.FindrandomReferenceOfTypeFromRef(telemarkerbase, Game.GetPlayer(), 10000.0))
	endwhile


		if game.getplayer().getdistance(telemarker) <= mydistance
			debug.notification("Climbing!")
			
			akfloorbox.moveto(game.getplayer())
		else
			debug.notification("You're too far from a wall to climb!")
		endif

		debug.notification("Climb ended")
		telemarker.disable()
		telemarker.delete()
	




endevent
