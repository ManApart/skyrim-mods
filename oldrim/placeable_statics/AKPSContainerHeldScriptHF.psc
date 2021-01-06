Scriptname AKPSContainerHeldScriptHF extends ObjectReference  

message property akpsreleasemessage auto
AKPLaceStaticQuestScriptHF property akquestscriptHF auto

;Lists
formlist property akpsFurniturecontainerhf auto
formlist property akpsfurniturecontainerheldhf auto

;variables
container akfurnitureitem
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
;New function to only block containers if they're books
if (self.getbaseobject() as book) != none
	blockactivation()
else
	blockactivation(false)
endif

if inventory == false
	button = akpsreleasemessage.show()
	if  button == 0 
		
		;See if the object can be found in this object's list
		index = -1
		imax =  akpsfurniturecontainerheldhf.getsize() - 1

		While (self.getbaseobject() as book) != akpsfurniturecontainerheldhf.getat(index)  && index <= imax
			index = index + 1
		endwhile
		if (index > imax)
			debug.notification("Artículo no encontrado!")
			return
		endif


		akfurnitureitem = akpsfurniturecontainerhf.getat(index) as container
		placeatme(akfurnitureitem).removeallitems()
		self.delete()

	elseif button == 1
		game.getplayer().additem(self)
		inventory = true
		return

	elseif button == 2	
		akquestscriptHF.rotateobject = self as objectreference
		akquestscriptHF.akrotate()

		;debug.notification("Rotate object")
	else
		return
	endif
endif
endevent






