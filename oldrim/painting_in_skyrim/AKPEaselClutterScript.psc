Scriptname AKPEaselClutterScript extends ObjectReference  


;variables
furniture property AKFurniture auto
message property AKPClutterSetupMessage auto


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

	button =  AKPClutterSetupMessage.show()
	if  button == 0 
		placeatme(AKFurniture)
		self.delete()
	elseif button == 1
		return
	elseif button == 2
		game.getplayer().additem(self)
		inventory = true
		return

	endif	
endif
endevent
