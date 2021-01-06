Scriptname akwebjerkscript extends activemagiceffect  
objectreference property akjerkmarker auto
int xdist 
int ydist 
int zdist 

Event OnEffectStart(actor Target, actor Caster)
;get target's position
;find x, y, and z position distances from target to actor
;game.getposition(xdist)
;move akjerkmarker to opposite side of target (by adding distances to target position)

;cast push force so it jerks toward caster
	akjerkmarker.PushActorAway(Target, PushForce)
EndEvent

int Property PushForce  Auto  