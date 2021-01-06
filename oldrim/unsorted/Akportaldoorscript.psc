Scriptname Akportaldoorscript extends ObjectReference  

akfriendoftimealter property akquest auto

event onload()

if akquest.akportalopened == 1
debug.notification("Openening Portal")
self.enable()
endif

endevent