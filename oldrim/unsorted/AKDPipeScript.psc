Scriptname AKDPipeScript extends ObjectReference  
;get our position and angle for translate
float anglex
float angley
float anglez
float posx
float posy
float posz
float tempangle

Float Property Currentangle Auto		;do not fill; this is used ontranslation complete to do stuff to doors and fans
Int Property AKAxis = 0 Auto 				;0 = x, 1 = y, 2 = z 
Float Property AKAmount = 45.0 Auto 	;amount to rotate
Float Property AKCorrect Auto 			;angle that opens doors etc
Float Property AKCorrect2 Auto 			;2nd correct angle (for straightaway).
Bool Property AKTwocorrect	Auto		;Two correct rotations - used for straightaway.
ObjectReference Property akfan Auto 	;the fan to disable
ObjectReference Property akdoor Auto 	;the door to open / close
Sound Property AKOBJDwemerRepositorySlide Auto	;the sound to while rotating
Sound Property AKDRSDwemerLiftOpen Auto	;the sound to play when pipes line up

Event OnActivate(ObjectReference akActionRef)
;Debug.Notification("Pipe Activated!")
GoToState("Busystate")
AKOBJDwemerRepositorySlide.Play(Self)
anglex = GetAngleX()
angley = GetAngley()
anglez = GetAnglez()
posx = GetPositionX()
posy = GetPositiony()
posz = GetPositionz()

If AKAxis == 0
	anglex += AKAmount
	tempangle = anglex
ElseIf AKAxis == 1
	angley += AKAmount
	tempangle = angley
ElseIf AKAxis == 2
	anglez += AKAmount
	tempangle = anglez
EndIf
TranslateTo(posx, posy, posz, anglex, angley, anglez, 1, 20)

While tempangle > 360	;find angle out of 360 degrees
	tempangle -= 360
EndWhile
Currentangle = tempangle
GoToState("")
EndEvent

Event OnTranslationComplete()
If Currentangle == AKCorrect || (AKTwoCorrect == True && Currentangle == AKCorrect2)	;the pipes line up!
	AKDRSDwemerLiftOpen.Play(Self)
	If akfan.IsDisabled() == False
		akfan.Disable()
	EndIf
	If akdoor.GetOpenState() > 2
		akdoor.Activate(akdoor, True)
	EndIf
Else
	If akfan.IsDisabled() == True
		akfan.Enable()
	EndIf
	If akdoor.GetOpenState() < 3
		akdoor.Activate(akdoor, True)
	EndIf
EndIf

EndEvent

State Busystate
EndState