Scriptname AKDControlPartnerEffectScript extends activemagiceffect  
AKControlQuestScript property akquest Auto
AKControlMCMScript property akquestMCM Auto
AKDwemerInstituteQuestScript property akDquest Auto
;swap player controls
Event OnEffectStart(Actor akTarget, Actor akCaster)
	akquestmcm.bodyhop = False
	akquest.AKSimpleMorph(AKDQuest.akpartner, False)
EndEvent
