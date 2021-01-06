Scriptname AKMarriageBedScript extends ObjectReference  

Event OnActivate(ObjectReference akActionRef)

If RelationshipMarriageFIN.IsRunning() == True && RelationshipMarriageFIN.GetStage() > 10 && Game.GetPlayer().GetCurrentLocation() == LoveInterest.GetActorRef().GetCurrentLocation()
	actorbase spouse = (loveinterest.getref().getbaseobject() as actorbase)

	if (spouse.getsex() != game.getplayer().getactorbase().getsex()) && loveinterest.getactorref().getsleepstate() == 3 && akscript.pregnant != 1
		int button = akconceivebox.show()
		if button == 0
			akquest.start()
			self.activate(game.getplayer())		
		else
			self.activate(game.getplayer())		
		endif	
	else
		self.activate(game.getplayer())

	endif
else
	self.activate(game.getplayer())
endif 



endevent
Quest Property akquest  Auto  
qf_akhaveakidquest_010012c4 property akscript auto
Quest Property RelationshipMarriageFIN Auto
ReferenceAlias Property LoveInterest Auto

Message Property akconceivebox  Auto  
