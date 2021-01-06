Scriptname AKPSFurnitureHeldScript extends ObjectReference  
message property akpsreleasemessage auto
message property akpssitmessage auto
AKPLaceStaticQuestScript property akquestscript auto
keyword property aksitleft auto
keyword property aksitright auto

;Lists
formlist property akpsFurniture auto
formlist property akpsfurnitureheld auto
formlist property akpsSitleft auto
formlist property akpsSitright auto

;variables
furniture akfurnitureitem
book akbookitem
int index
int imax
bool inventory
int button

float akx
float aky
float akz

Event OnContainerChanged(ObjectReference akNewContainer, ObjectReference akOldContainer)
	if aknewcontainer == none 
		akz = getanglez()
		setangle(0,0,akz)
		blockactivation()
		;debug.notification("Rotation reset")
		inventory = false
	endif	
endevent


Event OnActivate(ObjectReference akActionRef)
blockactivation()

if inventory == false

	if haskeyword(aksitleft) || haskeyword(aksitright)
		button = akpsSitmessage.show()
	else
		button = akpsreleasemessage.show()
	endif

	if  button == 0 
		
		;See if the object can be found in this object's list
		index = -1
		imax =  akpsfurnitureheld.getsize() - 1

		While (self.getbaseobject() as book) != akpsfurnitureheld.getat(index) && index <= imax
			index = index + 1
		endwhile 
		if (index > imax)
			debug.notification("Artículo no encontrado!")
			return
		endif

		akfurnitureitem = akpsfurniture.getat(index) as furniture
		placeatme(akfurnitureitem)
		self.disable()
		self.delete()

	elseif button == 1
		game.getplayer().additem(self)
		inventory = true
		return

	elseif button == 2	
		akquestscript.rotateobject = self as objectreference
		akquestscript.akrotate()
		;debug.notification("Rotate object")
	elseif button == 3
		if haskeyword(aksitleft)
			index = -1
			imax =  akpssitleft.getsize() - 1

			While (self.getbaseobject() as book) != akpsSitleft.getat(index) && index <= imax
				index = index + 1
			endwhile
			if (index > imax)
				debug.notification("Artículo no encontrado!")
				return
			endif


			akbookitem = akpsSitRight.getat(index) as book
			placeatme(akbookitem).blockactivation()
			self.disable()
			self.delete()

		 elseif haskeyword(aksitright)
			index = -1
			imax =  akpssitright.getsize() - 1

			While (self.getbaseobject() as book) != akpsSitRight.getat(index) && index <= imax
				index = index + 1
			endwhile
			if (index > imax)
				debug.notification("Artículo no encontrado!")
				return
			endif


			akbookitem = akpsSitLeft.getat(index) as book
			placeatme(akbookitem).blockactivation()
			self.disable()
			self.delete()
		endif	
	else
		return
	endif
endif
endevent



