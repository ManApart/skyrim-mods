Scriptname AKBPQuestScript extends Quest  
;this script is used to adjust Buyable Painting's frames and pictures

;properties
objectreference  property rotateobject auto
message Property AKArtAdjustMessage Auto



;Messages
message property akBPRotateAxis auto
message property akBPRotateAmount auto
message property AKBPNudgeAmountMessage auto
message property akBPscaleMain auto
message property akBPscaleincrease auto
message property akBPscaledecrease auto


;Variables
int index
int imax
int button
float aksize
bool doonce

;Rotation Variables
float akz
float akx
float aky

float akzr
float akxr
float akyr

int axis
int amount

;only get position once per activation
bool position

;only update position once per rotate
bool akupdate



;------------------------------------------------------------Main Menu
Function AKArtAdjust()
button = -1
button = akartadjustmessage.show()
;Rotate
if button == 0
	akrotate()
;Nudge
elseif button == 1
	aknudge()
;Scale
elseif button == 2
	akscale()
endif


EndFunction




;------------------------------------------------------------Rotation Function

function akrotate()
Game.DisablePlayerControls(false, true, false, true, false, false, false)
if  position == 0 
	akx = rotateobject.getpositionx()
	aky = rotateobject.getpositiony()
	akz = rotateobject.getpositionz()
	position = 1
endif

axis = -1
axis = akBProtateaxis.show()

;reset rotation
if axis == 3
	rotateobject.setangle(0,0,0)
	akrotate()
;Done
elseif axis == 4
	position = 0
	akupdate = 0
	;AKQuest.aknoadjust = 0
	;AKQuest.akisactivator = 0
	Game.EnablePlayerControls()
	AKArtAdjust()
	return

elseif axis == 2 || axis == 1 || axis == 0
	akamount()
endif
endfunction

function akamount()
	button = -1
		akxr =rotateobject.getanglex()
		akyr =rotateobject.getangley()
		akzr = rotateobject.getanglez()

		button = akbprotateamount.show()
		if button == 0
			amount = -1
		elseif button == 1
			amount = -5
		elseif button == 2
			amount = -30
		elseif button == 3
			amount = -90
		elseif button == 4
			amount = 90
		elseif button == 5
			amount = 30
		elseif button == 6
			amount = 5
		elseif button == 7
			amount = 1
		else
			akrotate()
			return
		endif

		;rotate x
		if axis == 0 && amount != 0
			rotateobject.setangle((akxr + amount), akyr, akzr)
			debug.notification("Rotated x by "+ amount + " degrees")
		;rotate y
		elseif axis == 1 && amount != 0
			rotateobject.setangle(akxr, (akyr + amount), akzr)
			debug.notification("Rotated y by "+ amount + " degrees")
		;rotate y
		elseif axis== 2 && amount != 0
			rotateobject.setangle(akxr, akyr, (akzr+ amount))
			debug.notification("Rotated z by "+ amount + " degrees")
		endif
		rotateobject.setposition(akx,aky,akz)
		amount = 0
		utility.wait(0.7)
	akamount()
endfunction



;------------------------------------------------------------Nudge Function

;nudge origional position = akx, aky, and akz
;updatedpositions = akxr, akyr, and akzr


function aknudge()
Game.DisablePlayerControls(false, true, false, true, false, false, false)
if  position == 0 
	akx = rotateobject.getpositionx()
	aky = rotateobject.getpositiony()
	akz = rotateobject.getpositionz()
	position = 1
endif

axis = -1
axis = akbprotateaxis.show()

;reset position
if axis == 3
	rotateobject.setposition(akx,aky,akz)
	akrotate()
;Done
elseif axis == 4
	position = 0
	akupdate = 0
	Game.EnablePlayerControls()
	AKArtAdjust()
	return

elseif axis == 2 || axis == 1 || axis == 0
	akposamount()
endif
endfunction

function akposamount()
	button = -1
		akxr =rotateobject.getpositionx()
		akyr =rotateobject.getpositiony()
		akzr = rotateobject.getpositionz()

		button = AKBPNudgeAmountMessage.show()
		if button == 0
			amount = -100
		elseif button == 1
			amount = -50
		elseif button == 2
			amount = -10
		elseif button == 3
			amount = -1
		elseif button == 4
			amount = 1
		elseif button == 5
			amount = 10
		elseif button == 6
			amount = 50
		elseif button == 7
			amount = 100
		else
			aknudge()
			return
		endif

		;move x
		if axis == 0 && amount != 0
			rotateobject.setposition((akxr + amount), akyr, akzr)
			debug.notification("Moved x by "+ amount + " units")
		;rotate y
		elseif axis == 1 && amount != 0
			rotateobject.setposition(akxr, (akyr + amount), akzr)
			debug.notification("Moved y by "+ amount + " units")
		;rotate y
		elseif axis== 2 && amount != 0
			rotateobject.setposition(akxr, akyr, (akzr+ amount))
			debug.notification("Moved z by "+ amount + " units")
		endif
		amount = 0
		utility.wait(0.7)
	akposamount()
endfunction



;------------------------------------------------------------Scale Function


function akscale()
;debug.notification("WARNING: You shouldn't be seeing the scale function. Please report this to Iceburg!")
Game.DisablePlayerControls(false, true, false, true, false, false, false)
if  position == 0 
	akx = rotateobject.getpositionx()
	aky = rotateobject.getpositiony()
	akz = rotateobject.getpositionz()
	position = 1
endif

aksize = rotateobject.getscale()
button = -1
button = akBPscalemain.show()

if button == 0
	akscaleincrease()

elseif button == 1
	akdecrease()

;reset rotation
elseif button == 2
	rotateobject.setscale(1.0)
	debug.notification("Scale Reset")
	akscale()
;Done
elseif button == 3
	position = 0
	akupdate = 0
	Game.EnablePlayerControls()
	AKArtAdjust()
	return
else
endif
endfunction

function akscaleincrease()
debug.notification("Increase")
	button = -1
	aksize = rotateobject.getscale()
	button = akBPscaleincrease.show()
	if button == 0
		rotateobject.setscale(1.1)
	elseif button == 1
		rotateobject.setscale(1.2)
	elseif button == 2
		rotateobject.setscale(1.3)
	elseif button == 3
		rotateobject.setscale(1.4)
	elseif button == 4
		rotateobject.setscale(1.5)
	else
		akscale()
		return
	endif

	rotateobject.setposition(akx,aky,akz)
	amount = 0
	akscaleincrease()
endfunction

function akdecrease()
debug.notification("Decrease")
	button = -1
	aksize = rotateobject.getscale()
	button = akBPscaledecrease.show()
	if button == 0
		rotateobject.setscale(0.5)
	elseif button == 1
		rotateobject.setscale(0.6)
	elseif button == 2
		rotateobject.setscale(0.7)
	elseif button == 3
		rotateobject.setscale(0.8)
	elseif button == 4
		rotateobject.setscale(0.9)
	else
		akscale()
		return
	endif

	rotateobject.setposition(akx,aky,akz)
	amount = 0
		utility.wait(0.7)
	akdecrease()
endfunction