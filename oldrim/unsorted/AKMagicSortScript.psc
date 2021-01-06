Scriptname AKMagicSortScript extends ObjectReference  
message property akSortMessage Auto
formlist property aksorttypelist auto
bool inuse

Event OnMagicEffectApply(ObjectReference akCaster, MagicEffect akEffect)
if akcaster == game.getplayer()
	int button = aksortmessage.show()
	if button == 0 ; sort
		if inuse == 0
			inuse = 1
			aksortfunction()			
		Else	
			debug.notification("Already in use!")
		endif
	elseif button == 1 ;Pickup
	else ; nothing
		Return
	EndIf
EndIf
endevent

;figure out if it's not sorting last item
;sort options? Type, base object, keyword?


function aksortfunction()
self.BlockActivation()
debug.notification("Sorting!")
;Cell info
cell akcell = self.GetParentCell()
int cellchestcount = akcell.getnumrefs(28)
debug.notification(cellchestcount + "chests in this cell!")
int cellchestindex = 0
int sortedindex = 0
int sortedcount = 0
bool sorted

int magicitemcount = self.getnumitems() ;num items in magic chest at start of sort
int index = magicitemcount ;set index to get last item, then work backwards
while index >= 0 ;for each item, look for a matching item type in one of the other chests, if so put the item in the chest
	form aksortitem = self.getnthform(index)
	int movecount = self.getitemcount(aksortitem)
	int aksorttype = aksortitem.gettype()
	sorted = 0
	cellchestindex = 0
	while sorted == 0 && cellchestindex <= cellchestcount ;look for a chest with the right item, as long its not already sorted and as we haven't looked in that chest yet
		objectreference aksortedchest = akcell.getnthref(cellchestindex, 28) 
		if aksortedchest != Self 
			If aksortedchest.getnthform(1).gettype() == aksorttype ;if item being sorted matches the item at this index in this chest
				self.removeitem(aksortitem, movecount, true, aksortedchest)
				sorted = 1
			endif
		endif
		cellchestindex += 1 ;go to the next chest if not found in this one	
	EndWhile
	index -= 1 ;next last item
 endwhile
debug.notification("Sorted!")
self.BlockActivation(false)
inuse = 0
endfunction