Scriptname aktestbaseobjectscript extends ObjectReference  

int property aktestvalue auto
int doonce

function aktestfunction()
debug.notification("Test Function has been run")
endfunction


Event OnActivate(ObjectReference akActionRef)
doonce = 0


if aktestvalue != 1 && doonce == 0
aktestvalue = 1
doonce = 1
debug.notification("Test value set to 1")

elseif aktestvalue == 1 && doonce == 0
aktestvalue = 2
doonce = 1
debug.notification("Test value set to 2")
endif


endevent