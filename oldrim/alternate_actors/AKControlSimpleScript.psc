Scriptname AKControlSimpleScript extends ActiveMagicEffect  
;Control anything by simply switching player controls. No combat control.
AKControlQuestScript property akquest Auto
Bool Property akduration auto
;swap player controls
Event OnEffectStart(Actor akTarget, Actor akCaster)
	akquest.AKSimpleMorph(aktarget, akduration)
EndEvent


;return player controls (no longer used)
;Event OnEffectFinish(Actor akTarget, Actor akCaster)
;	akquest.AKSimplerevert(aktarget)
;endevent

