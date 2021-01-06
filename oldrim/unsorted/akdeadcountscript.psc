Scriptname akdeadcountscript extends ObjectReference  

akfriendoftimealter property akalterscript auto

	EVENT onDying(actor myKiller)
akalterscript.akdeadcount = (1 + akalterscript.akdeadcount)
int deadcount = akalterscript.akdeadcount
;debug.notification("kill count + 1")
debug.notification("kill count = " +deadcount+ "/ 6")
		ENDEVENT