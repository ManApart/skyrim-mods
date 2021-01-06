Scriptname AKPlaceStaticQuestScriptHF extends Quest  
objectreference property rotateobject auto

;Message Properties
message property akpsgrabmessage auto
message property akpsunknowntypemessage auto
message property akpscontainerconfirm auto
message property AKPSGrabMessageClutter auto
message property akpsuninstallmessage auto
message property akpsCarpetMessage auto
Message property akpsgrabmessageCrafting auto

;Keyword Properties
keyword property aklightnotLit auto
keyword property aklightLit auto

;List Properties
formlist property akpsFurnitureHF auto
formlist property akpsfurnitureheldHF auto
formlist property akpsFurnitureContainerHF auto
formlist property akpsfurnitureContainerheldHF auto
formlist property akpsFurnitureStaticHF auto
formlist property akpsfurnitureStaticheldHF auto
formlist property akpsFurnitureStaticOrigHF auto
formlist property akpsactivatorheldHF auto
formlist property akpsactivatorHF auto

;Other properties
AKPSAdjustScript property AKAdjust auto
AKPLaceStaticQuestScript property AKQuestScript auto
actorbase property player auto
faction property playerfaction auto
spell property akplacestaticspell auto
weapon property akpsfurniturehammer auto

;Variables
int index
int imax
int button

activator akactivatoritem		;activator item for rug swapping
book akmiscitem 				;book version of furniture
weapon akwallitem 				;weapon version of wall clutter
static akstaticitem				;variable for statics - used in uninstalling objects
furniture akfurnitureitem			;used to set up crafting equipment
container akcontaineritem		;used with contianers
door akdooritem					;used with doors
;The above variables are also used in the while functions so a function isn't being used in the while loop
bool doonce

;------------------------------------------------------------Pass functions to the adjust script
Function akrotate()
akquestscript.rotateobject = rotateobject
akadjust.akrotate()
endfunction


function aklight()
akquestscript.akcandle = 1
akquestscript.rotateobject = rotateobject
akadjust.aklight()
akquestscript.akcandle = 0
endfunction

function aksnuff()
akquestscript.akcandle = 1
akquestscript.rotateobject = rotateobject
akadjust.aksnuff()
akquestscript.akcandle = 0
endfunction


;------------------------------------------------------------Select Activator
function akselectactivator()
	if (rotateobject.getactorowner() != player && rotateobject.getactorowner() != none) || ((rotateobject.getparentcell().getfactionowner() != playerfaction) && (rotateobject.getparentcell().getfactionowner() != none))
			debug.notification("Eso no es tuyo!")
			return
	else
		button = akpsgrabmessage.show()
		if button == 0
			;See if the object can be found in this object's list
			index = -1
			imax =  akpsactivatorHF.getsize() - 1
			akactivatoritem =(rotateobject.getbaseobject() as activator)
			While (akactivatoritem != akpsactivatorHF.getat(index)) && index <= imax
				index = index + 1
			endwhile 
			
			if (index > imax)
				if akpsunknowntypemessage.show() == 0
					if akquestscript.akspellbuffer == true
						debug.notification("El almacén mágico esta lleno!")
						;debug.notification("Spellbuffer =" +akquestscript.akspellbuffer )
						return
					else 
						akquestscript.akustatic = rotateobject.getbaseobject() as activator
						akquestscript.akspellbuffer = true
						rotateobject.delete()
						debug.notification("Guardar en almacén mágico!")
						game.getplayer().equipspell(akplacestaticspell, 2)
						;debug.notification("Spellbuffer =" +akquestscript.akspellbuffer )
						return
					endif
				else
					return
				endif
			endif

			akmiscitem = akpsactivatorheldHF.getat(index) as book
			game.getplayer().additem(akmiscitem)
			rotateobject.delete()
		;Rotate
		elseif button == 1
			akquestscript.aknoadjust = 1
			akquestscript.akisactivator = 1
			AKAdjust.akrotate()
		;Nudge
		elseif button == 2
			akquestscript.aknoadjust = 1
			akquestscript.akisactivator = 1
			AKAdjust.aknudge()	
		;Scale Not being used
		;elseif button == 3
		;	aknoadjust = 1
		;	akisactivator = 1
		;	AKAdjust.akscale()	
		;Store in Spell Buffer
		elseif button == 3
			if akquestscript.akspellbuffer == true
				debug.notification("El almacén mágico esta lleno!")
				;debug.notification("Spellbuffer =" +akquestscript.akspellbuffer )
				return
			else 
				akquestscript.akustatic = rotateobject.getbaseobject() as activator
				akquestscript.akspellbuffer = true
				rotateobject.delete()
				debug.notification("Guardar en almacén mágico!")
				game.getplayer().equipspell(akplacestaticspell, 2)
				;debug.notification("Spellbuffer =" +akquestscript.akspellbuffer )
				return
			endif
		endif
	endif
endfunction


;------------------------------------------------------------Select Container
Function akSelectContainerHF()
	if (rotateobject.getactorowner() != player && rotateobject.getactorowner() != none) || ((rotateobject.getparentcell().getfactionowner() != playerfaction) && (rotateobject.getparentcell().getfactionowner() != none))
			debug.notification("Eso no es tuyo!")
			return
	else
		button = akpsgrabmessage.show()
		if button == 0
			button = -1
	;		button = akpscontainerconfirm.show()
	;		if button == 0
				;See if the object can be found in this object's list
				index = -1
				imax =  akpsfurniturecontainerHF.getsize() - 1
				akcontaineritem =(rotateobject.getbaseobject() as container) 
				While akcontaineritem != akpsfurniturecontainerHF.getat(index) && index <= imax
					index = index + 1
				endwhile 
				
				if (index > imax)
					if akpsunknowntypemessage.show() == 0
						if akquestscript.akspellbuffer == true
							debug.notification("El almacén mágico esta lleno!")
							;debug.notification("Spellbuffer =" +akquestscript.akquestscript.akspellbuffer )
							return
						else 
							akquestscript.akucontainer = rotateobject.getbaseobject() as container
							akquestscript.akspellbuffer = true
							;get the container's contents and add it to the player
							rotateobject.removeallitems(aktransferto = game.getplayer())
							rotateobject.delete()
							debug.notification("Guardar en almacén mágico!")
							game.getplayer().equipspell(akplacestaticspell, 2)
							;debug.notification("Spellbuffer =" +akquestscript.akquestscript.akspellbuffer )
							return
						endif
					else
						return
					endif
				endif
				

				akmiscitem = akpsfurniturecontainerheldhf.getat(index) as book
				game.getplayer().additem(akmiscitem)
				rotateobject.delete()

				;get the container's contents and add it to the player
				rotateobject.removeallitems(aktransferto = game.getplayer())	
		;scale		
		;elseif button == 1
		;		akadjust.akscale()
		;store in spell buffer
		elseif button == 1
			if akquestscript.akspellbuffer == true
				debug.notification("El almacén mágico esta lleno!")
				;debug.notification("Spellbuffer =" +akquestscript.akspellbuffer )
				return
			else 
				akquestscript.akucontainer = rotateobject.getbaseobject() as container
				akquestscript.akspellbuffer = true
				;get the container's contents and add it to the player
				rotateobject.removeallitems(aktransferto = game.getplayer())
				rotateobject.delete()
				debug.notification("Guardar en almacén mágico!")
				game.getplayer().equipspell(akplacestaticspell, 2)
				;debug.notification("Spellbuffer =" +akquestscript.akspellbuffer )
				return
			endif
		endif
	endif
endfunction


;------------------------------------------------------------Select Furniture
function akselectfurnitureHF()
	if (rotateobject.getactorowner() != player && rotateobject.getactorowner() != none) || ((rotateobject.getparentcell().getfactionowner() != playerfaction) && (rotateobject.getparentcell().getfactionowner() != none))

			debug.notification("Eso no es tuyo!")
			return
	elseif rotateobject.IsFurnitureInUse()
			debug.notification("Eso ya lo está usando alguien!")
			return	
	else
		button = akpsgrabmessage.show()
		if button == 0
			;See if the object can be found in this object's list
			index = -1
			imax =  akpsfurniturehf.getsize() - 1
			akfurnitureitem = (rotateobject.getbaseobject() as furniture)
			While (akfurnitureitem != akpsfurniturehf.getat(index)) && index <= imax
				index = index + 1
			endwhile 
			
			if (index > imax)
				if akpsunknowntypemessage.show() == 0
					if akquestscript.akspellbuffer == true
						debug.notification("El almacén mágico esta lleno!")
						;debug.notification("Spellbuffer =" +akquestscript.akquestscript.akspellbuffer )
						return
					else 
						akquestscript.akufurniture = rotateobject.getbaseobject() as furniture
						akquestscript.akspellbuffer = true
						rotateobject.delete()
						debug.notification("Guardar en almacén mágico!")
						game.getplayer().equipspell(akplacestaticspell, 2)
						;debug.notification("Spellbuffer =" +akquestscript.akquestscript.akspellbuffer )
						return
					endif
				else
					return
				endif
			endif

			akmiscitem = akpsfurnitureheldHF.getat(index) as book
			game.getplayer().additem(akmiscitem)
			rotateobject.delete()
		;scale		
	;	elseif button == 1
	;			akadjust.akscale()	
		;store in spell buffer
		elseif button == 1
			if akquestscript.akspellbuffer == true
				debug.notification("El almacén mágico esta lleno!")
				;debug.notification("Spellbuffer =" +akquestscript.akspellbuffer )
				return
			else 
				akquestscript.akufurniture = rotateobject.getbaseobject() as furniture
				akquestscript.akspellbuffer = true
				rotateobject.delete()
				debug.notification("Guardar en almacén mágico!")
				game.getplayer().equipspell(akplacestaticspell, 2)
				;debug.notification("Spellbuffer =" +akquestscript.akspellbuffer )
				return
			endif
		endif
	endif
endfunction


;------------------------------------------------------------Select Static (Ground)
function akselectstaticHF()
if (rotateobject.getactorowner() != player && rotateobject.getactorowner() != none) || ((rotateobject.getparentcell().getfactionowner() != playerfaction) && (rotateobject.getparentcell().getfactionowner() != none))
	debug.notification("Eso no es tuyo!")
	return
elseif (game.getplayer().GetEquippedWeapon() as weapon) == akpsfurniturehammer
	if( rotateobject.getbaseobject() as activator).haskeyword(aklightnotlit)
		debug.notification("Primero hay que encender el fuego!")
		return
	endif
	button = akpsuninstallmessage.show()
	if button == 0
		;find matching origional static and replace activator with static
		index = -1
		imax =  akpsfurniturestaticHF.getsize() - 1
		akactivatoritem = (rotateobject.getbaseobject() as activator)
		While akactivatoritem != akpsfurniturestaticHF.getat(index) && index <= imax
			index = index + 1
		endwhile
		if (index > imax)
			debug.notification("Artículo no encontrado!")
			return
		endif
		
		
		akstaticitem = akpsfurniturestaticOrigHF.getat(index) as static
		rotateobject.placeatme(akstaticitem)
		rotateobject.delete()
		debug.notification("Objeto quitado!")
	endif
elseif( rotateobject.getbaseobject() as activator).haskeyword(aklightlit)
		debug.notification("No puedes recoger algo que se está quemando!")
else
	button = akpsgrabmessageclutter.show()
	if button == 0
		;See if the object can be found in this object's list
		index = -1
		imax =  akpsfurnitureStaticHF.getsize() - 1
		akactivatoritem = (rotateobject.getbaseobject() as activator)
		While akactivatoritem != akpsfurniturestaticHF.getat(index) && index <= imax
			index = index + 1	
		endwhile
		
		if (index > imax)
			if akpsunknowntypemessage.show() == 0
				if akquestscript.akspellbuffer == true
					debug.notification("El almacén mágico esta lleno!")
					;debug.notification("Spellbuffer =" +akquestscript.akquestscript.akspellbuffer )
					return
				else 
					akquestscript.akustatic = rotateobject.getbaseobject() as activator
					akquestscript.akspellbuffer = true
					rotateobject.delete()
					debug.notification("Guardar en almacén mágico!")
					game.getplayer().equipspell(akplacestaticspell, 2)
					;debug.notification("Spellbuffer =" +akquestscript.akquestscript.akspellbuffer )
					return
				endif
			else
				return
			endif
		endif


		akmiscitem = akpsfurniturestaticheldHF.getat(index) as book
		game.getplayer().additem(akmiscitem)
		rotateobject.delete()
	;rotate
	elseif button == 1
		akquestscript.aknoadjust = 1
		akquestscript.akisactivator = 1
		AKAdjust.akrotate()
	;Nudge
	elseif button == 2
		akquestscript.aknoadjust = 1
		akquestscript.akisactivator = 1
		akquestscript.rotateobject = rotateobject
		AKAdjust.aknudge()
	;Store in Spell Buffer
	elseif button == 3
		if akquestscript.akspellbuffer == true
			debug.notification("El almacén mágico esta lleno!")
			;debug.notification("Spellbuffer =" +akquestscript.akspellbuffer )
			return
		else 
			akquestscript.akustatic = rotateobject.getbaseobject() as activator
			akquestscript.akspellbuffer = true
			rotateobject.delete()
			debug.notification("Guardar en almacén mágico!")
			game.getplayer().equipspell(akplacestaticspell, 2)
			;debug.notification("Spellbuffer =" +akquestscript.akspellbuffer )
			return
		endif	

	endif
endif
endfunction