Scriptname AKPlaceStaticPlayerScript extends ReferenceAlias  

;properties
spell property akplacestaticspell auto
spell property akgetstaticspell auto

keyword property akwallclutter auto
keyword property akpsFurnitureKeyword auto

static property akstaticplacemarker auto

formlist property akpswallclutter auto
formlist property akpswallclutterHeld auto
formlist property akpscraftingheld auto
formlist property akpscraftingActivators auto

akplacestaticquestscript property akquest auto

objectreference akrotateobject


;variables
furniture akufurnituresp
activator akustaticsp 
container akucontainersp 
bool akspellbuffersp 
float akz

objectreference telemarker	 	;Tells the script where to place an object
weapon akstaticweapon 			;the clutter in the person's hands
activator akwallclutterhung		;the activator that's converted from the person's hands
int index
int imax

Event OnSpellCast(Form akSpell)
;debug.notification("Place static spell fired from alias")

;Fill properties from the quest
akufurnituresp = akquest.akufurniture
akustaticsp = akquest.akustatic
akucontainersp = akquest.akucontainer
akspellbuffersp = akquest.akspellbuffer

if akspell == akplacestaticspell

	if (game.getplayer().GetEquippedWeapon() as weapon).haskeyword(akwallclutter) || (game.getplayer().GetEquippedWeapon() as weapon).haskeyword(akpsFurnitureKeyword)
		;store the painting in the right hand and run the hangpainting function
		akstaticweapon = game.getplayer().GetEquippedWeapon() as weapon
		akmarkerfunction()
		if (akstaticweapon).haskeyword(akwallclutter)
			akplaceweapon()
		else
			akplacecrafting()
		endif
	elseif (game.getplayer().GetEquippedWeapon(true) as weapon).haskeyword(akwallclutter) || (game.getplayer().GetEquippedWeapon(true) as weapon).haskeyword(akpsFurnitureKeyword)
		;store the painting in the left hand and run the hangpainting function
		akstaticweapon = game.getplayer().GetEquippedWeapon(true) as weapon		
		akmarkerfunction()
		if (akstaticweapon).haskeyword(akwallclutter)
			akplaceweapon()
		else
			akplacecrafting()
		endif
	elseif akspellbuffersp == true
		akmarkerfunction()
		akplacebuffer()			
	else
		debug.notification("The spell buffer is empty!")
		akmarkerfunction()
		akdeletestatic()

	endif
endif

endevent

function akmarkerfunction()
	;debug.notification("casting spell")
	utility.wait(0.5)
	telemarker = (Game.FindrandomReferenceOfTypeFromRef(akstaticplacemarker, Game.GetPlayer(), 10000.0))
	;debug.notification("grabbed closest type")
	;make sure that marker is not disabled
	while telemarker.isdisabled() == 1
		telemarker = (Game.FindrandomReferenceOfTypeFromRef(akstaticplacemarker, Game.GetPlayer(), 10000.0))
	endwhile
endfunction

function akdeletestatic()
	telemarker.disable()
	telemarker.delete()
	;debug.notification("marker deleted")
endfunction

function akplaceweapon()	
;figure out what wall clutter to hang
	index = -1
	imax =  akpswallclutterHeld.getsize() - 1

	While akstaticweapon != akpswallclutterHeld.getat(index) && index <= imax
		index = index + 1
	endwhile
	if (index > imax)
		debug.notification("Wall Clutter not found!")
		return
	endif

	akwallclutterhung = akpswallclutter.getat(index) as activator
	akrotateobject = telemarker.placeatme(akwallclutterhung)
	game.getplayer().removeitem(akstaticweapon)
	akz = akrotateobject.getanglez()
	akrotateobject.setangle(0,0,akz - 180)
	telemarker.disable()
	telemarker.delete()
	;debug.notification("marker deleted")
endfunction

function akplacecrafting()	
;figure out what wall clutter to hang
	index = -1
	imax =  akpsCraftingHeld.getsize() - 1

	While akstaticweapon != akpsCraftingHeld.getat(index) && index <= imax
		index = index + 1
	endwhile
	if (index > imax)
		debug.notification("Wall Clutter not found!")
		return
	endif


	akwallclutterhung = akpsCraftingActivators.getat(index) as activator
	akrotateobject = telemarker.placeatme(akwallclutterhung)
	game.getplayer().removeitem(akstaticweapon)
	akz = akrotateobject.getanglez()
	akrotateobject.setangle(0,0,akz - 180)
	telemarker.disable()
	telemarker.delete()
	;debug.notification("marker deleted")
endfunction

function akplacebuffer()	
	if akufurnituresp != none
		akrotateobject = telemarker.placeatme(akufurnituresp)
		akquest.akufurniture = none
		akufurnituresp = none
	elseif akustaticsp != none
		akrotateobject = telemarker.placeatme(akustaticsp)
		akquest.akustatic = none
		akustaticsp = none
	elseif akucontainersp != none
		akrotateobject = telemarker.placeatme(akucontainersp)
		akrotateobject.removeallitems()
		akquest.akucontainer = none	
		akucontainersp = none	
	Else	
		debug.notification("Nothing found in cell buffer!")
	endif
	akquest.akspellbuffer = false
	akz = akrotateobject.getanglez()
	akrotateobject.setangle(0,0,akz)
	telemarker.disable()
	telemarker.delete()
	akrotateobject = none
	game.getplayer().equipspell(akgetstaticspell, 2)
	;debug.notification("Spell Buffer Emptied")
endfunction