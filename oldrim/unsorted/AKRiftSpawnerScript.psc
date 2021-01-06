Scriptname AKRiftSpawnerScript extends ObjectReference  
{Handles the destruction stages and enemy spawning of the magic anomaly spawner object}


Quest Property MGR30  Auto  
ActorBase Property aktimeboss  Auto  
magiceffect property akeffect auto
int property akspawnstage auto
objectreference property akriftref auto
qf_akfriendoftime_010015f7 property akquestscript auto





ActorBase Property EncMagicAnomaly Auto
{enemy to spawn}
Explosion Property ExplosionIllusionLight01 Auto
{explosion to play whne it opens}
Explosion Property ExplosionIllusionMassiveLight01 Auto
{explosion to play whne it opens}
; Enemy holders
Actor myEncMagicAnomaly01
Actor myEncMagicAnomaly02
Actor myEncMagicAnomaly03
; Blend values (how open it the portal 0-1)
float fToggleBlendStart = 0.3
float fToggleBlendOpen = 0.9
float fToggleBlendFull = 1.0
float fToggleBlendGone = 0.0
; Temporary blend value holder
float myCurrentBlend
;Is player in trigger and the portal is not open
int property playerInTrigger auto
; Enemy count
int numberOfEnemiesAlive 
; Distances with 3000 unit trigger to test fade portal open
float maxTestRange = 1500.0
Float minTestRange = 550.0
; holder for player
actor myPlayer
; gates for making the drath of each enemy affect script only once
int Gate1
int Gate2
int Gate3


auto state waiting
	; Set initial blend ab=mount for portal and get player locally
	Event onLoad()
		akriftref.SetAnimationVariableFloat("fToggleBlend", fToggleBlendStart)
		myPlayer = game.getPlayer()
	EndEvent
	;waits for player to enter trigger once he does it tests for distance and triggers the portal to open if he gets close enough
	 Event OnTriggerEnter(ObjectReference akActionRef)
		playerInTrigger = 1
		akriftref.SetAnimationVariableFloat("fDampRate", 0.3)
		while playerInTrigger == 1 ;&& playerLeftTrigger
			float myDistance = myPlayer.getDistance(akriftref)
; 			debug.trace("myDistance = " + myDistance)
			if myDistance <= minTestRange
				;player is close enoght to automatically open the portal
				goToState("opened")
				playerInTrigger = 0
			elseIf myDistance <= maxTestRange
				Float animationValue = CalculateAnimationValue(myDistance, minTestRange,maxTestRange, fToggleBlendStart, fToggleBlendFull)
; 				debug.trace("animationValue = " + animationValue)
				akriftref.SetAnimationVariableFloat("fToggleBlend", animationValue)
				utility.wait(0.05)
			endif
		endWhile
	EndEvent
	;stop testing if player leaves trigger without opening portal
	Event OnTriggerLeave(ObjectReference akActionRef)
		playerInTrigger = 0
	EndEvent
endState



 state opened
	;The portal is opened playe some explosions and spawn 3 enemies
	Event onBeginState()
 		;debug.notification("opened")
		int doOnce = 0
		if doOnce == 0


	
			self.placeAtMe(ExplosionIllusionLight01)
			utility.wait(0.75)
			self.placeAtMe(ExplosionIllusionMassiveLight01)
			self.KnockAreaEffect(1, 900)
			self.SetAnimationVariableFloat("fToggleBlend", fToggleBlendFull)
			utility.wait(0.5)
			myEncMagicAnomaly01 = self.placeActorAtMe(EncMagicAnomaly)
			myEncMagicAnomaly01.setScale(utility.randomFloat(0.7, 1.25))
						utility.wait(1.5)
			myEncMagicAnomaly02 = self.placeActorAtMe(EncMagicAnomaly)
			myEncMagicAnomaly02.setScale(utility.randomFloat(0.7, 1.25))
						utility.wait(0.5)
			myEncMagicAnomaly03 = self.placeActorAtMe(EncMagicAnomaly)
			myEncMagicAnomaly03.setScale(utility.randomFloat(0.7, 1.25))
			numberOfEnemiesAlive = 3
			doOnce = 1
		endIf
	
			utility.wait(3.5)
			self.SetAnimationVariableFloat("fDampRate", 0.03)
			self.SetAnimationVariableFloat("fToggleBlend", fToggleBlendOpen)

	EndEvent 



 endState
 
 ; function to test the distance from the player to the portal and ramp up the art accordingly
 Float Function CalculateAnimationValue(float PlayerDistance, float NearDistance, float FarDistance, float AnimationMin, float AnimationMax)
	Float percent = 1-((PlayerDistance - NearDistance)/(FarDistance - NearDistance))
	Float returnValue = (percent * (AnimationMax - AnimationMin)) + AnimationMin
	Return returnValue	
EndFunction

; Function to fade out the art each time an enemy dies finally disabling the art after the last enemy
Function anomalyDied()
; 		debug.trace("running anomaly died")
; 		debug.trace("01 is dead = " + myEncMagicAnomaly01.IsDead())
; 		debug.trace("02 is dead = " + myEncMagicAnomaly02.IsDead())
; 		debug.trace("03 is dead = " + myEncMagicAnomaly03.IsDead())
		myCurrentBlend = self.GetAnimationVariableFloat("fToggleBlend")
; 		debug.trace("myCurrentBlend = "+ myCurrentBlend)
		self.SetAnimationVariableFloat("fToggleBlend", myCurrentBlend - (fToggleBlendOpen / 3))
		numberOfEnemiesAlive = numberOfEnemiesAlive - 1
		if numberOfEnemiesAlive == 0
			utility.wait(0.5)
			self.disable(true)
			if MGR30.IsRunning() == 1
				MGR30.SetStage(20)
			endif
		endif
EndFunction

 
; Function to fade out and shrink the art, and add more enemies each time the player casts the spell
Function akriftshrink()
;debug.notification("Running akriftshrink")

		myCurrentBlend = akriftref.GetAnimationVariableFloat("fToggleBlend")
; 		debug.trace("myCurrentBlend = "+ myCurrentBlend)
		akriftref.SetAnimationVariableFloat("fToggleBlend", myCurrentBlend - (fToggleBlendOpen / 3))
		
		if akspawnstage == 1 
;		debug.notification("Spawnstage 1")
			myEncMagicAnomaly01 = akriftref.placeActorAtMe(EncMagicAnomaly)
		myEncMagicAnomaly01.setScale(utility.randomFloat(0.7, 1.25))
		;myEncMagicAnomaly01.moveto(game.getplayer())
		;myEncMagicAnomaly01.moveto(akriftref)
	
					utility.wait(1.5)
			myEncMagicAnomaly02 =akriftref.placeActorAtMe(EncMagicAnomaly)
			myEncMagicAnomaly02.setScale(utility.randomFloat(0.7, 1.25))
			
						utility.wait(0.5)
			myEncMagicAnomaly03 = akriftref.placeActorAtMe(EncMagicAnomaly)
			myEncMagicAnomaly03.setScale(utility.randomFloat(0.7, 1.25))
		
			akriftref.setscale(0.6)
;debug.notification("Spawnstage 1 complete")

		elseif akspawnstage == 2
;		debug.notification("Spawnstage 2")
			myEncMagicAnomaly01 = akriftref.placeActorAtMe(EncMagicAnomaly)
			myEncMagicAnomaly01.setScale(utility.randomFloat(0.7, 1.25))
						utility.wait(1.5)
			myEncMagicAnomaly02 =akriftref.placeActorAtMe(EncMagicAnomaly)
			myEncMagicAnomaly02.setScale(utility.randomFloat(0.7, 1.25))
						utility.wait(0.5)
			myEncMagicAnomaly03 = akriftref.placeActorAtMe(EncMagicAnomaly)
			myEncMagicAnomaly03.setScale(utility.randomFloat(0.7, 1.25))
			akriftref.setscale(0.3)


;debug.notification("Spawnstage 2 complete")
		
		elseif akspawnstage ==3
;		debug.notification("Spawnstage 3")
			utility.wait(0.5)
			akriftref.disable(true)
			akriftref.placeactoratme(aktimeboss)
			akspawnstage = 0
			if MGR30.IsRunning() == 1
				MGR30.SetStage(20)
				goToState("waiting")
;debug.notification("Spawnstage 3 complete")

akquestscript.akriftsclosed = (akquestscript.akriftsclosed as int + 1)
;akriftsclosed.setvalue(akquestscript.akriftsclosed)
akriftsclosed.mod(1)
debug.notification("I have closed " + akquestscript.akriftsclosed + " rifts.")

			endif
		endif
EndFunction

GlobalVariable Property akriftsclosed  Auto  
