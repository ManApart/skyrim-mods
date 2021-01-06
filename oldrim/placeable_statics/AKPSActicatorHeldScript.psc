Scriptname AKPSActicatorHeldScript extends ObjectReference    
message property akpsreleasemessage auto
AKPLaceStaticQuestScript property akquestscript auto

;Lists
formlist property akpsactivator auto
formlist property akpsactivatorheld auto

;variables
activator akfurnitureitem
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
		inventory = false
	endif	
endevent


Event OnActivate(ObjectReference akActionRef)
blockactivation()
if inventory == false
	button = akpsreleasemessage.show()
	if  button == 0 
		
		;See if the object can be found in this object's list
		index = -1
		imax =  akpsactivatorheld.getsize() - 1

		While (self.getbaseobject() as book) != akpsactivatorheld.getat(index) && index <= imax
			index = index + 1
		endwhile
		if (index > imax)
			debug.notification("Artículo no encontrado!")
			return
		endif

		akfurnitureitem = akpsactivator.getat(index) as activator
		placeatme(akfurnitureitem)
		self.delete()

	elseif button == 1
		game.getplayer().additem(self)
		inventory = true
		return

	elseif button == 2	
		akquestscript.rotateobject = self as objectreference
		akquestscript.aknoadjust = 1
		AKQuestScript.akrotate()

		;debug.notification("Rotate object")
	else
		return
	endif
endif
endevent



