Scriptname AKPLaceStaticQuestScript extends Quest  

;Properties to be accessed by object scripts (for unknown items)
furniture property akufurniture auto
activator property akustatic auto
container property akucontainer auto
door property akudoor auto
bool property akspellbuffer auto
objectreference property rotateobject auto


;Message Properties
message property akpsgrabmessage auto
message property akpsunknowntypemessage auto
message property akpscontainerconfirm auto
message property akpsgrabmessageClutter auto
message property akpsuninstallmessage auto
message property akpsCarpetMessage auto
Message property akpsgrabmessageCrafting auto

;Keyword Properties
keyword property akrugunrolled auto
keyword property akrugrolled auto
keyword property aklightnotLit auto
keyword property aklightLit auto

;List Properties
formlist property akpsactivator auto
formlist property akpsactivatorheld auto
formlist property akpsdoor auto
formlist property akpsdoorheld auto
formlist property akpsFurniture auto
formlist property akpsfurnitureheld auto
formlist property akpsFurnitureContainer auto
formlist property akpsfurnitureContainerheld auto
formlist property akpsFurnitureStatic auto
formlist property akpsfurnitureStaticheld auto
formlist property akpsWallclutter auto
formlist property akpsWallclutterHeld auto
formlist property akpsWallclutterOrig auto
formlist property akpsFurnitureStaticOrig auto
formlist property akpscraftingactivators auto
formlist property akpscraftingfurniture auto
formlist property akpscraftingheld auto

;Try to extricate rugrolls to the adjust script
formlist property akpsrugunrolled auto
formlist property akpsrugrolled auto

;Other properties
AKPSAdjustScript property AKAdjust auto
actorbase property player auto
faction property playerfaction auto
spell property akplacestaticspell auto
weapon property akpsfurniturehammer auto
bool property aknoadjust auto
bool property akisactivator	auto		;if object is activator -so rotate has time to fade in and out
bool property akcandle auto				;== 1 if candle is being lit or snuffed
bool property akiscrafting auto			;used to stop the crafting menu bug from popping up.

;Variables
int index
int imax
int button

activator akactivatoritem		;activator item for rug swapping
book akmiscitem 				;book version of furniture
weapon akwallitem 				;weapon version of wall clutter
static akstaticitem				;variable for statics - used in uninstalling objects
furniture akfurnitureitem		;used to set up crafting equipment
container akcontaineritem		;used with contianers
door akdooritem					;used with doors
;The above variables are also used in the while functions so a function isn't being used in the while loop
bool doonce

;------------------------------------------------------------Pass functions to the adjust script
Function akrotate()
akadjust.akrotate()
endfunction


function aklight()
akcandle = 1
akadjust.aklight()
akcandle = 0
endfunction

function aksnuff()
akcandle = 1
akadjust.aksnuff()
akcandle = 0
endfunction


;------------------------------------------------------------Select Activator
function akselectactivator()
	if (rotateobject.getactorowner() != player && rotateobject.getactorowner() != none) || ((rotateobject.getparentcell().getfactionowner() != playerfaction) && (rotateobject.getparentcell().getfactionowner() != none))
			debug.notification("Eso no es tuyo!")
			return
	else
		button = akpsgrabmessageClutter.show()
		if button == 0
			;See if the object can be found in this object's list
			index = -1
			imax =  akpsactivator.getsize() - 1
			akactivatoritem =(rotateobject.getbaseobject() as activator)
			While (akactivatoritem != akpsactivator.getat(index)) && index <= imax
				index = index + 1
			endwhile 
			
			if (index > imax)
				if akpsunknowntypemessage.show() == 0
					if akspellbuffer == true
						debug.notification("El almacén mágico esta lleno!")
						;debug.notification("Spellbuffer =" +akquestscript.akspellbuffer )
						return
					else 
						akustatic = rotateobject.getbaseobject() as activator
						akspellbuffer = true
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

			akmiscitem = akpsactivatorheld.getat(index) as book
			game.getplayer().additem(akmiscitem)
			rotateobject.delete()
		;Rotate
		elseif button == 1
			aknoadjust = 1
			akisactivator = 1
			AKAdjust.akrotate()
		;Nudge
		elseif button == 2
			aknoadjust = 1
			akisactivator = 1
			AKAdjust.aknudge()	
		;Scale Not being used
		;elseif button == 3
		;	aknoadjust = 1
		;	akisactivator = 1
		;	AKAdjust.akscale()	
		;Store in Spell Buffer
		elseif button == 3
			if akspellbuffer == true
				debug.notification("El almacén mágico esta lleno")
				;debug.notification("Spellbuffer =" +akquestscript.akspellbuffer )
				return
			else 
				akustatic = rotateobject.getbaseobject() as activator
				akspellbuffer = true
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
Function akSelectContainer()
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
				imax =  akpsfurniturecontainer.getsize() - 1
				akcontaineritem =(rotateobject.getbaseobject() as container) 
				While akcontaineritem != akpsfurniturecontainer.getat(index) && index <= imax
					index = index + 1
				endwhile 
				
				if (index > imax)
					if akpsunknowntypemessage.show() == 0
						if akspellbuffer == true
							debug.notification("El almacén mágico esta lleno!")
							;debug.notification("Spellbuffer =" +akquestscript.akspellbuffer )
							return
						else 
							akucontainer = rotateobject.getbaseobject() as container
							akspellbuffer = true
							;get the container's contents and add it to the player
							rotateobject.removeallitems(aktransferto = game.getplayer())
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

				akmiscitem = akpsfurniturecontainerheld.getat(index) as book
				game.getplayer().additem(akmiscitem)
				rotateobject.delete()

				;get the container's contents and add it to the player
				rotateobject.removeallitems(aktransferto = game.getplayer())	
		;scale		
		;elseif button == 1
		;		akadjust.akscale()
		;store in spell buffer
		elseif button == 1
			if akspellbuffer == true
				debug.notification("El almacén mágico esta lleno!")
				;debug.notification("Spellbuffer =" +akquestscript.akspellbuffer )
				return
			else 
				akucontainer = rotateobject.getbaseobject() as container
				akspellbuffer = true
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

;------------------------------------------------------------Select Crafting Equipment (Old function to fix bug)
function akselectcrafting()
debug.notification("Que tenga un buen día!")
endfunction

;------------------------------------------------------------Select Crafting Equipment (Furniture)
;This is for Crafting as furniture.

function akselectCraftingFurn()
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
			imax =  akpsCraftingfurniture.getsize() - 1
			akfurnitureitem =(rotateobject.getbaseobject() as furniture)
			While (akfurnitureitem != akpscraftingfurniture.getat(index)) && index <= imax
				index = index + 1
			endwhile 
			
			if (index > imax)
				if akpsunknowntypemessage.show() == 0
					if akspellbuffer == true
						debug.notification("El almacén mágico esta lleno!")
						;debug.notification("Spellbuffer =" +akquestscript.akspellbuffer )
						return
					else 
						akufurniture = rotateobject.getbaseobject() as furniture
						akspellbuffer = true
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

			akwallitem = akpscraftingheld.getat(index) as weapon
			game.getplayer().additem(akwallitem)
			rotateobject.delete()
		;scale		
		;elseif button == 1
		;	akadjust.akscale()
			
		;store in spellbuffer
		elseif button == 1
			if akspellbuffer == true
				debug.notification("El almacén mágico esta lleno!")
				;debug.notification("Spellbuffer =" +akquestscript.akspellbuffer )
				return
			else 
				akufurniture = rotateobject.getbaseobject() as furniture
				akspellbuffer = true
				rotateobject.delete()
				debug.notification("Guardar en almacén mágico!")
				game.getplayer().equipspell(akplacestaticspell, 2)
				;debug.notification("Spellbuffer =" +akquestscript.akspellbuffer )
				return
			endif				
		endif
	endif
endfunction

;------------------------------------------------------------Select Crafting Equipment (Activator)
;Selecting Crafting Equipment as an activator
function akselectCraftingAct()
	if (rotateobject.getactorowner() != player && rotateobject.getactorowner() != none) || ((rotateobject.getparentcell().getfactionowner() != playerfaction) && (rotateobject.getparentcell().getfactionowner() != none))
		debug.notification("Eso no es tuyo!")
		return
	else
		button = akpsgrabmessageCrafting.show()

		;fix object here (turn activator into Furniture)
		if button == 0
			;See if the object can be found in this object's list
			index = -1
			imax =  akpsCraftingActivators.getsize() - 1
			akactivatoritem = (rotateobject.getbaseobject() as activator)
			While akactivatoritem != akpsCraftingActivators.getat(index) && index <= imax
				index = index + 1
			endwhile
			if (index > imax)
				debug.notification("Artículo no encontrado!")
				return
			endif

			akfurnitureitem = akpsCraftingFurniture.getat(index) as furniture
			rotateobject.placeatme(akfurnitureitem)
			rotateobject.delete()

		;Pick Up
		elseif button == 1
			;See if the object can be found in this object's list
			index = -1
			imax =  akpscraftingactivators.getsize() - 1
			akactivatoritem = (rotateobject.getbaseobject() as activator)
			While akactivatoritem != akpscraftingactivators.getat(index) && index <= imax
				index = index + 1
			endwhile
			
			if (index > imax)
				if akpsunknowntypemessage.show() == 0
					if akspellbuffer == true
						debug.notification("El almacén mágico esta lleno!")
						;debug.notification("Spellbuffer =" +akquestscript.akspellbuffer )
						return
					else 
						akustatic = rotateobject.getbaseobject() as activator
						akspellbuffer = true
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

			akwallitem = akpscraftingheld.getat(index) as weapon
			game.getplayer().additem(akwallitem)
			rotateobject.delete()
		;Rotate
		elseif button == 2
			aknoadjust = 1
			akisactivator = 1
			AKAdjust.akrotate()
		;Nudge
		elseif button == 3
			aknoadjust = 1
			akisactivator = 1
			AKAdjust.aknudge()	
		;Scale
		;elseif button == 4
		;	aknoadjust = 1
		;	akisactivator = 1
		;	AKAdjust.akscale()	
		endif
	endif
endfunction


;------------------------------------------------------------Select Door
function akselectdoor()
	if (rotateobject.getactorowner() != player && rotateobject.getactorowner() != none) || ((rotateobject.getparentcell().getfactionowner() != playerfaction) && (rotateobject.getparentcell().getfactionowner() != none))
			debug.notification("You don't own that!")
			return
	else
		button = akpsgrabmessage.show()
		if button == 0
			;See if the object can be found in this object's list
			index = -1
			imax =  akpsdoor.getsize() - 1
			akdooritem = (rotateobject.getbaseobject() as door)
			While (akdooritem != akpsdoor.getat(index)) && index <= imax
				index = index + 1
			endwhile 
			
			if (index > imax)
				if akpsunknowntypemessage.show() == 0
					if akspellbuffer == true
						debug.notification("El almacén mágico esta lleno!")
						;debug.notification("Spellbuffer =" +akquestscript.akspellbuffer )
						return
					else 
						akudoor = rotateobject.getbaseobject() as door
						akspellbuffer = true
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
			akmiscitem = akpsdoorheld.getat(index) as book
			game.getplayer().additem(akmiscitem)
			rotateobject.delete()
		;Scale
		;elseif button == 1
		;	debug.notification("Display cases cannot be scaled!")
		;store in spell buffer	
		elseif button == 1
			if akspellbuffer == true
				debug.notification("El almacén mágico esta lleno!")
				;debug.notification("Spellbuffer =" +akquestscript.akspellbuffer )
				return
			else 
				akudoor = rotateobject.getbaseobject() as door
				akspellbuffer = true
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
function akselectfurniture()
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
			imax =  akpsfurniture.getsize() - 1
			akfurnitureitem = (rotateobject.getbaseobject() as furniture)
			While (akfurnitureitem != akpsfurniture.getat(index)) && index <= imax
				index = index + 1
			endwhile 
			
			if (index > imax)
				if akpsunknowntypemessage.show() == 0
					if akspellbuffer == true
						debug.notification("El almacén mágico esta lleno!")
						;debug.notification("Spellbuffer =" +akquestscript.akspellbuffer )
						return
					else 
						akufurniture = rotateobject.getbaseobject() as furniture
						akspellbuffer = true
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

			akmiscitem = akpsfurnitureheld.getat(index) as book
			game.getplayer().additem(akmiscitem)
			rotateobject.delete()
		;scale		
	;	elseif button == 1
	;			akadjust.akscale()	
		;store in spell buffer
		elseif button == 1
			if akspellbuffer == true
				debug.notification("El almacén mágico esta lleno!")
				;debug.notification("Spellbuffer =" +akquestscript.akspellbuffer )
				return
			else 
				akufurniture = rotateobject.getbaseobject() as furniture
				akspellbuffer = true
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
function akselectstatic()
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
		imax =  akpsfurniturestatic.getsize() - 1
		akactivatoritem = (rotateobject.getbaseobject() as activator)
		While akactivatoritem != akpsfurniturestatic.getat(index) && index <= imax
			index = index + 1
		endwhile
		if (index > imax)
			debug.notification("Artículo no encontrado!")
			return
		endif
		
		
		akstaticitem = akpsfurniturestaticOrig.getat(index) as static
		rotateobject.placeatme(akstaticitem)
		rotateobject.delete()
		debug.notification("Objeto quitado!")
	endif
elseif( rotateobject.getbaseobject() as activator).haskeyword(aklightlit)
		debug.notification("No puedes recoger algo que se está quemando!")
else
	if rotateobject.haskeyword(akrugrolled) || rotateobject.haskeyword(akrugunrolled)
		button = akpscarpetmessage.show()
	else
		button = akpsgrabmessageClutter.show()
	endif
	if button == 0
		;See if the object can be found in this object's list
		index = -1
		imax =  akpsfurnitureStatic.getsize() - 1
		akactivatoritem = (rotateobject.getbaseobject() as activator)
		While akactivatoritem != akpsfurniturestatic.getat(index) && index <= imax
			index = index + 1	
		endwhile
		
		if (index > imax)
			if akpsunknowntypemessage.show() == 0
				if akspellbuffer == true
					debug.notification("El almacén mágico esta lleno!")
					;debug.notification("Spellbuffer =" +akquestscript.akspellbuffer )
					return
				else 
					akustatic = rotateobject.getbaseobject() as activator
					akspellbuffer = true
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


		akmiscitem = akpsfurniturestaticheld.getat(index) as book
		game.getplayer().additem(akmiscitem)
		rotateobject.delete()
	;rotate
	elseif button == 1
		aknoadjust = 1
		akisactivator = 1
		AKAdjust.akrotate()
	;Nudge
	elseif button == 2
		aknoadjust = 1
		akisactivator = 1
		AKAdjust.aknudge()
		
	;Scale
;	elseif button == 3
;		aknoadjust = 1
;		akisactivator = 1
;		AKAdjust.akscale()	
	;Store in Spell Buffer
	elseif button == 3
		if akspellbuffer == true
			debug.notification("El almacén mágico esta lleno!")
			;debug.notification("Spellbuffer =" +akquestscript.akspellbuffer )
			return
		else 
			akustatic = rotateobject.getbaseobject() as activator
			akspellbuffer = true
			rotateobject.delete()
			debug.notification("Guardar en almacén mágico!")
			game.getplayer().equipspell(akplacestaticspell, 2)
			;debug.notification("Spellbuffer =" +akquestscript.akspellbuffer )
			return
		endif	
	;Roll / unroll
	elseif button == 4
		if rotateobject.haskeyword(akrugrolled)
;				debug.notification("Unrolling the red carpet")
			index = -1
			imax =  akpsrugrolled.getsize() - 1
			akactivatoritem = (rotateobject.getbaseobject() as activator)
			While akactivatoritem != akpsrugrolled.getat(index) && index <= imax
				index = index + 1
			endwhile

			if (index > imax)
				debug.notification("Artículo no encontrado!")
				return
			endif


			akactivatoritem = akpsrugUnrolled.getat(index) as activator
			rotateobject.placeatme(akactivatoritem)
			rotateobject.delete()

		 elseif rotateobject.haskeyword(akrugUnrolled)
;				debug.notification("Pack it up boys")
			index = -1
			imax =  akpsrugUnrolled.getsize() - 1
			akactivatoritem = (rotateobject.getbaseobject() as activator)
			While akactivatoritem != akpsrugunrolled.getat(index) && index <= imax
				index = index + 1
			endwhile
			
			if (index > imax)
				debug.notification("Artículo no encontrado!")
				return
			endif

			akactivatoritem = akpsrugrolled.getat(index) as activator
			rotateobject.placeatme(akactivatoritem)
			rotateobject.delete()
		endif	
	endif
endif
endfunction

;------------------------------------------------------------Select Wall Clutter
function akselectWallClutter()
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
			imax =  akpswallclutter.getsize() - 1
			akactivatoritem = (rotateobject.getbaseobject() as activator)
			While akactivatoritem != akpswallclutter.getat(index) && index <= imax
				index = index + 1
			endwhile
			if (index > imax)
				debug.notification("Artículo no encontrado!")
				return
			endif
			

			akstaticitem = akpswallclutterOrig.getat(index) as static
			rotateobject.placeatme(akstaticitem)
			rotateobject.delete()
			debug.notification("Objeto quitado!")
		endif
	elseif( rotateobject.getbaseobject() as activator).haskeyword(aklightlit)
			debug.notification("No puedes recoger algo que se está quemando!")
			
	;Bug fix for crafting menu bug
	elseif akiscrafting == 1
		akiscrafting = 0
		return		

	else
		button = akpsgrabmessageClutter.show()
		;Debug note to see if this function is being called when attempting to pick up crafting equipment.
		debug.notification("Colgarlo en otra pared")
		;Pick Up
		if button == 0
			;See if the object can be found in this object's list
			index = -1
			imax =  akpswallclutter.getsize() - 1
			akactivatoritem = (rotateobject.getbaseobject() as activator)
			While akactivatoritem != akpswallclutter.getat(index) && index <= imax
				index = index + 1
			endwhile
			
			if (index > imax)
				if akpsunknowntypemessage.show() == 0
					if akspellbuffer == true
						debug.notification("El almacén mágico esta lleno!")
						;debug.notification("Spellbuffer =" +akquestscript.akspellbuffer )
						return
					else 
						akustatic = rotateobject.getbaseobject() as activator
						akspellbuffer = true
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

			akwallitem = akpswallclutterheld.getat(index) as weapon
			game.getplayer().additem(akwallitem)
			rotateobject.delete()
		;Rotate
		elseif button == 1
			aknoadjust = 1
			akisactivator = 1
			AKAdjust.akrotate()
		;Nudge
		elseif button == 2
			aknoadjust = 1
			akisactivator = 1
			AKAdjust.aknudge()	
		endif
	endif
endfunction