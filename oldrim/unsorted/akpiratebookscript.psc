Scriptname akpiratebookscript extends ObjectReference  

event OnRead()
if akquest.getstage() == akqueststage
	akquest.setstage(aknewstage)
endif
endevent

quest property akquest auto
int property akqueststage auto
int property aknewstage auto