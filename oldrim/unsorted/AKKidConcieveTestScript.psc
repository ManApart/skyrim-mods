Scriptname AKKidConcieveTestScript extends ObjectReference  
QF_AKHaveAKidQuest_010012c4 property akquest auto

int list
int index
int button

headpart akhead 
int akfeatureslot
actorbase property son auto
actorbase property Jzargo auto
actor property sonref auto
message property AKKidTestMessage Auto


Event OnActivate(ObjectReference akActionRef)
actorbase player = game.getplayer().getactorbase()
button = AKKidTestMessage.show()

if button == 0
	akquest.akconception()
elseif button == 1
	akfacetest()
elseif button == 2
	aklistparts(player)
endif

endevent

;FACE TEST FUNCTION-------------------------------------------------------
function akfacetest()
actorbase player = game.getplayer().getactorbase()
akhead = akfindpart(Jzargo, 1)

akfeatureslot = akfindpartslot(player, 1)


player.SetNthHeadPart(akhead, akfeatureslot)
game.getplayer().QueueNiNodeUpdate()

endfunction


;FIND HEADPART SLOT FUNCTION-------------------------------------------------------
;This function takes an actor and a desired headpart type and returns the proper headpart's slot (What index is Bob's mouth? its the nth part).
int function AKFindPartSlot(actorbase akbase, int aktype)

	list = akbase.GetNumHeadParts()
	index = 0
	WHILE (index < list) && (akbase.GetNthHeadPart(index).gettype() != aktype)
		index += 1
	EndWHILE
	if  akbase.GetNthHeadPart(index).gettype() == aktype
		debug.notification("Slot found")
		return  index
	else
		debug.notification("Feature not found!")
		return -1
	endif
endfunction

;FIND HEADPART FUNCTION-------------------------------------------------------
;This function takes an actor and a desired headpart type and returns the proper headpart (looking for Bob's mouth? Use this).
Headpart function AKFindPart(actorbase akbase, int aktype)
	list = akbase.GetNumHeadParts()
	index = 0
	WHILE (index < list) && (akbase.GetNthHeadPart(index).gettype() != aktype)
		index += 1
	EndWHILE
	if  akbase.GetNthHeadPart(index).gettype() == aktype
		return  akbase.GetNthHeadPart(index)
		debug.notification("Part Found")
	else
		debug.notification("Feature not found!")
	endif
endfunction

;HEADPART List FUNCTION-------------------------------------------------------
;This function display's the player's headparts and what type they are.
Headpart function AKListParts(actorbase akbase)
	list = akbase.GetNumHeadParts()
	index = 0
	WHILE (index < list)
		debug.notification("Part #:" +index + ", Part Name:" +akbase.GetNthHeadPart(index).getname() +", Part Type:" +akbase.GetNthHeadPart(index).gettype())
		index += 1
	EndWHILE
endfunction