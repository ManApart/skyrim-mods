Scriptname AKPSAdjustScript extends Quest  
;This script stores the adjust functions of Placeable Statics

;properties
AKPLaceStaticQuestScript property AKQuest auto

message property akscaleMain auto
message property akscaleincrease auto
message property akscaledecrease auto
float aksize

formlist property akpslit auto
formlist property akpsnotlit auto
formlist property akpsrugunrolled auto
formlist property akpsrugrolled auto

;Keyword Properties
keyword property akrugunrolled auto
keyword property akrugrolled auto
keyword property aklightnotLit auto
keyword property aklightLit auto

;Variables
int index
int imax
int button

activator akactivatoritem	;activator item for rug swapping
book akmiscitem 			;book version of furniture
weapon akwallitem 			;weapon version of wall clutter
static akstaticitem			;variable for statics - used in uninstalling objects
bool doonce

;------------------------------------------------------------Rotation Function

;Object to be rotated. Should be filled when grab spell is cast

;Function SetLocalAngle(Float LocalX, Float LocalY, Float LocalZ)
;	float AngleX = LocalX * Math.Cos(LocalZ) + LocalY * Math.Sin(LocalZ)
;	float AngleY = LocalY * Math.Cos(LocalZ) - LocalX * Math.Sin(LocalZ)
;	SetAngle(AngleX, AngleY, LocalZ)
;EndFunction



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

message property akrotateaxis auto
message property akrotateamount auto


function akrotate()
AKQuest.rotateobject.blockactivation()
Game.DisablePlayerControls(false, false, false, true, false, false, false)
if  position == 0 
	akx = AKQuest.rotateobject.getpositionx()
	aky = AKQuest.rotateobject.getpositiony()
	akz = AKQuest.rotateobject.getpositionz()
	position = 1
endif

axis = -1
axis = akrotateaxis.show()

;reset rotation
if axis == 3
	AKQuest.rotateobject.setangle(0,0,0)
	if AKQuest.aknoadjust == 0
		AKQuest.rotateobject.setposition(akx,aky,akz + 50)
	endif
	akrotate()
;Done
elseif axis == 4
	position = 0
	akupdate = 0
	AKQuest.aknoadjust = 0
	AKQuest.akisactivator = 0
	Game.EnablePlayerControls()
	return

elseif axis == 2 || axis == 1 || axis == 0
	akamount()
endif
endfunction

function akamount()
	button = -1
		akxr =AKQuest.rotateobject.getanglex()
		akyr =AKQuest.rotateobject.getangley()
		akzr = AKQuest.rotateobject.getanglez()

		button = akrotateamount.show()
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
			AKQuest.rotateobject.setangle((akxr + amount), akyr, akzr)
			debug.notification("Rotated x by "+ amount + " degrees")
		;rotate y
		elseif axis == 1 && amount != 0
			AKQuest.rotateobject.setangle(akxr, (akyr + amount), akzr)
			debug.notification("Rotated y by "+ amount + " degrees")
		;rotate y
		elseif axis== 2 && amount != 0
			AKQuest.rotateobject.setangle(akxr, akyr, (akzr+ amount))
			debug.notification("Rotated z by "+ amount + " degrees")
		endif
		if akupdate == 0 && AKQuest.aknoadjust == 0
			akz = akz + 50
			akupdate = 1
		endif
;		debug.notification("No adjust set to: "+AKQuest.aknoadjust)
		AKQuest.rotateobject.setposition(akx,aky,akz)
		amount = 0
		if AKQuest.akisactivator == 1
			utility.wait(0.5)
		endif
	akamount()
endfunction



;------------------------------------------------------------Nudge Function

;nudge message
message property AKPSNudgeAmountMessage auto

;nudge origional position = akx, aky, and akz
;updatedpositions = akxr, akyr, and akzr


function aknudge()
AKQuest.rotateobject.blockactivation()
Game.DisablePlayerControls(false, false, false, true, false, false, false)
if  position == 0 
	akx = AKQuest.rotateobject.getpositionx()
	aky = AKQuest.rotateobject.getpositiony()
	akz = AKQuest.rotateobject.getpositionz()
	position = 1
endif

axis = -1
axis = akrotateaxis.show()

;reset position
if axis == 3
;	if AKQuest.aknoadjust == 0
;		AKQuest.rotateobject.setposition(akx,aky,akz + 50)
;	else
		AKQuest.rotateobject.setposition(akx,aky,akz)
;	endif
	akrotate()
;Done
elseif axis == 4
	position = 0
	akupdate = 0
	AKQuest.aknoadjust = 0
	AKQuest.akisactivator = 0
	Game.EnablePlayerControls()
	return

elseif axis == 2 || axis == 1 || axis == 0
	akposamount()
endif
endfunction

function akposamount()
	button = -1
		akxr =AKQuest.rotateobject.getpositionx()
		akyr =AKQuest.rotateobject.getpositiony()
		akzr = AKQuest.rotateobject.getpositionz()

		button = AKPSNudgeAmountMessage.show()
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
			AKQuest.rotateobject.setposition((akxr + amount), akyr, akzr)
			debug.notification("Moved x by "+ amount + " units")
		;rotate y
		elseif axis == 1 && amount != 0
			AKQuest.rotateobject.setposition(akxr, (akyr + amount), akzr)
			debug.notification("Moved y by "+ amount + " units")
		;rotate y
		elseif axis== 2 && amount != 0
			AKQuest.rotateobject.setposition(akxr, akyr, (akzr+ amount))
			debug.notification("Moved z by "+ amount + " units")
		endif
;		if akupdate == 0 && AKQuest.aknoadjust == 0
;			akz = akz + 50
;			akupdate = 1
;		endif
;		debug.notification("No adjust set to: "+AKQuest.aknoadjust)
;		AKQuest.rotateobject.setposition(akx,aky,akz)
		amount = 0
		if AKQuest.akisactivator == 1
			utility.wait(0.7)
		endif
	akposamount()
endfunction



;------------------------------------------------------------Scale Function

;tester function to make sure object is being scaled
function akscale2()
debug.notification("scaled")
akscalemain.show()
endfunction




function akscale()
debug.notification("WARNING: You shouldn't be seeing the scale function. Please report this to Iceburg!")
AKQuest.rotateobject.blockactivation()
Game.DisablePlayerControls(false, false, false, true, false, false, false)
if  position == 0 
	akx = AKQuest.rotateobject.getpositionx()
	aky = AKQuest.rotateobject.getpositiony()
	akz = AKQuest.rotateobject.getpositionz()
	position = 1
endif

aksize = akquest.rotateobject.getscale()
button = -1
button = akscalemain.show()

if button == 0
	akscaleincrease()

elseif button == 1
	akdecrease()

;reset rotation
elseif button == 2
	AKQuest.rotateobject.setscale(1.0)
	if AKQuest.aknoadjust == 0
		AKQuest.rotateobject.setposition(akx,aky,akz + 50)
	endif
	debug.notification("Scale Reset")
	akscale()
;Done
elseif button == 3
	position = 0
	akupdate = 0
	AKQuest.aknoadjust = 0
	AKQuest.akisactivator = 0
	Game.EnablePlayerControls()
	return
else
endif
endfunction

function akscaleincrease()
debug.notification("Increase")
	button = -1
	aksize = akquest.rotateobject.getscale()
	button = akscaleincrease.show()
	if button == 0
		AKQuest.rotateobject.setscale(1.1)
	elseif button == 1
		AKQuest.rotateobject.setscale(1.2)
	elseif button == 2
		AKQuest.rotateobject.setscale(1.3)
	elseif button == 3
		AKQuest.rotateobject.setscale(1.4)
	elseif button == 4
		AKQuest.rotateobject.setscale(1.5)
	else
		akscale()
		return
	endif

	AKQuest.rotateobject.setposition(akx,aky,akz)
	amount = 0
	if AKQuest.akisactivator == 1
		utility.wait(0.5)
	endif
	akscaleincrease()
endfunction

function akdecrease()
debug.notification("Decrease")
	button = -1
	aksize = akquest.rotateobject.getscale()
	button = akscaledecrease.show()
	if button == 0
		AKQuest.rotateobject.setscale(0.5)
	elseif button == 1
		AKQuest.rotateobject.setscale(0.6)
	elseif button == 2
		AKQuest.rotateobject.setscale(0.7)
	elseif button == 3
		AKQuest.rotateobject.setscale(0.8)
	elseif button == 4
		AKQuest.rotateobject.setscale(0.9)
	else
		akscale()
		return
	endif

	AKQuest.rotateobject.setposition(akx,aky,akz)
	amount = 0
	if AKQuest.akisactivator == 1
		utility.wait(0.5)
	endif
	akdecrease()
endfunction


;------------------------------------------------------------Light Function
function aklight()
			if( AKQuest.rotateobject.getbaseobject()).haskeyword(aklightnotlit) && doonce == 0
				doonce = 1
;				debug.notification("Vanquish the darkness!")
				index = -1
				imax =  akpsnotlit.getsize() - 1
				activator akactivator =(AKQuest.rotateobject.getbaseobject() as activator)
				While (akactivator) != akpsnotlit.getat(index) && index <= imax
					index = index + 1
				endwhile
				
				if (index > imax)
					debug.notification("Item not found!")
					doonce = 0
					return
				endif

				akactivatoritem = akpslit.getat(index) as activator
				AKQuest.rotateobject.placeatme(akactivatoritem)
				AKQuest.rotateobject.delete()
				doonce = 0
			endif
endfunction

;-----------------------------------------------------------Snuff Function
function aksnuff()
			if( AKQuest.rotateobject.getbaseobject() as activator).haskeyword(aklightlit) && doonce == 0
				doonce = 1
;				debug.notification("Vanquishing the flame")
				index = -1
				imax =  akpslit.getsize() - 1
				activator akactivator =(AKQuest.rotateobject.getbaseobject() as activator)
				While (akactivator) != akpslit.getat(index) && index <= imax
					index = index + 1
				endwhile

				if (index > imax)
					debug.notification("Item not found!")
					doonce = 0
					return
				endif


				akactivatoritem = akpsnotlit.getat(index) as activator
				AKQuest.rotateobject.placeatme(akactivatoritem)
				AKQuest.rotateobject.delete()
				doonce = 0
			endif
endfunction