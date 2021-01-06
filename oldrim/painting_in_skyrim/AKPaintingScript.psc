Scriptname AKPaintingScript extends ObjectReference  

akBPquestscript property akquest auto
message property akmessage auto
actorbase property player auto

keyword property aklc01 auto
keyword property aklc02 auto
keyword property akmc01 auto
keyword property akmc02 auto
keyword property akmc03 auto
keyword property akuc01 auto
keyword property akuc02 auto
keyword property akuc03 auto

activator property akframelc01 auto
activator property akframelc02 auto
activator property akframemc01 auto
activator property akframemc02 auto
activator property akframemc03 auto
activator property akframeuc01 auto
activator property akframeuc02 auto
activator property akframeuc03 auto

formlist property akpaintingheldlist auto
formlist property akpaintinghunglist auto

activator akhungframe
int index
int imax
weapon akpainting 

Event OnActivate(ObjectReference akActionRef)

if getactorowner() != player && getactorowner() != none
	debug.notification("This is not your painting")
	return
else
	int buttonpressed = akmessage.show()

	;0 == remove painting
	if buttonpressed == 0
		if haskeyword(aklc01)
			akhungframe = akframelc01
		elseif haskeyword(aklc02)
			akhungframe = akframelc02
		elseif haskeyword(akmc01)
			akhungframe = akframemc01
		elseif haskeyword(akmc02)
			akhungframe = akframemc02
		elseif haskeyword(akmc03)
			akhungframe = akframemc03
		elseif haskeyword(akuc01)
			akhungframe = akframeuc01
		elseif haskeyword(akuc02)
			akhungframe = akframeuc02
		elseif haskeyword(akuc03)
			akhungframe = akframeuc03
		endif
		placeatme(akhungframe)


		index = -1
		imax =  akpaintinghunglist.getsize() - 1
		activator akpaintinghung = (self.getbaseobject() as activator)

		While akpaintinghung != akpaintinghunglist.getat(index) && index <= imax
			index = index + 1
		endwhile
	
		if (index > imax)
			debug.notification("Painting scroll not found")
			return
		endif

		akpainting = akpaintingheldlist.getat(index) as weapon
		game.getplayer().additem(akpainting)
		delete()
		disable()

	;1 == adjust art
	elseif buttonpressed == 1
		akquest.rotateobject = (self as objectreference)
		akquest.akartadjust()

	;2 == Do nothing
	else

	endif
endif
endevent