Scriptname AKFrameScript extends ObjectReference  
scroll akframe
message property akmessage auto
keyword property akpainting auto
weapon akheldpainting 
activator akhungpainting 
keyword property akframetype auto
actorbase property player auto
akBPquestscript property akquest auto

formlist property akframeheldlist auto
formlist property akframehunglist auto
formlist property akpaintingheldlist auto
formlist property akpaintinghunglist auto

int imax
int index

Event OnActivate(ObjectReference akActionRef)

if getactorowner() != player && getactorowner() != none
	debug.notification("This is not your picture frame")
	return
else

int buttonpressed = akmessage.show()

	;0 == remove frame
	if buttonpressed == 0
		index = -1
		imax =  akframehunglist.getsize() - 1
		activator akpaintinghung = (self.getbaseobject() as activator)

		While akpaintinghung != akframehunglist.getat(index) && index <= imax
			index = index + 1
		endwhile

		if (index > imax)
			debug.notification("Frame not found")
			return
		endif

		akframe = akframeheldlist.getat(index) as scroll
		game.getplayer().additem(akframe)
		delete()
		disable()

	;1 == add painting
	elseif buttonpressed == 1

	;get the held painting, if there is one, and set it to akheldpainting
		if (game.getplayer().GetEquippedWeapon() as weapon).haskeyword(akpainting)
			;store the painting in the right hand and run the hangpainting function
			akheldpainting = game.getplayer().GetEquippedWeapon() as weapon
		elseif (game.getplayer().GetEquippedWeapon(true) as weapon).haskeyword(akpainting)
			;store the painting in the left hand and run the hangpainting function
			akheldpainting = game.getplayer().GetEquippedWeapon(true) as weapon
		else
			debug.notification("You don't have a painting in your hands!")
			return
		endif

	;Does the painting fit on this frame type?
		if akheldpainting.haskeyword(akframetype)
			akhangpainting()
		else
			debug.notification("The painting doesn't fit this picture frame!")
		endif

	elseif buttonpressed == 2
		akquest.rotateobject = (self as objectreference)
		akquest.akartadjust()

	;3 == Do nothing
	else

	endif
endif
endevent


;-------------------------------------Hang Painting Function

;Use while function and formlists to find index of held painting. Then spawn the activator in the hung list that has the same index

Function akhangpainting()

;figure out what painting to hang

index = -1
imax =  akpaintingheldlist.getsize() - 1

While akheldpainting != akpaintingheldlist.getat(index) && index <= imax
	index = index + 1
endwhile

if (index > imax)
	debug.notification("Painting not found")
	return
endif


akhungpainting = akpaintinghunglist.getat(index) as activator

;hang the painting
game.getplayer().removeitem(akheldpainting)
placeatme(akhungpainting)
delete()
disable()
endfunction