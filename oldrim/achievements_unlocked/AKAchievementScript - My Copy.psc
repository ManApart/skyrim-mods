Scriptname AKAchievementScript extends ObjectReference  



; Define a property that points to the script on this quest, and call the function
;
; Declare this in your script:
; 	AchievementsScript Property AchievementsQuest Auto
;
; Call this function:
; 	AchievementsQuest.IncSideQuests()
;You're a big time cheater for using this, you know... :D

;http://www.uesp.net/wiki/Skyrim:Achievements
;add the line below if you arn't if you're gotten that achievement or not. That way you can search that phrase latter to check it.
;Not sure

Event OnRead()

;Unbound		
			Game.AddAchievement(1)
;Bleak Falls Barrow			
			Game.AddAchievement(2)
;The Way of the Voice
			Game.AddAchievement(3)
;Diplomatic Immunity
			Game.AddAchievement(4)
;Alduin's Wall			
			Game.AddAchievement(5)
;Elder Knowledge			
			Game.AddAchievement(6)			
;The Fallen			
			Game.AddAchievement(7)
;Dragonslayer			
			Game.AddAchievement(8)
;Take Up Arms			
			Game.AddAchievement(9)
;Blood Oath			
			Game.AddAchievement(10)
;Glory of the Dead			
			Game.AddAchievement(11)
;Gatekeeper			
			Game.AddAchievement(12)
;Revealing the Unseen			
			Game.AddAchievement(13)
;The Eye of Magnus			
			Game.AddAchievement(14)			
;Taking Care of Business			
			Game.AddAchievement(15)
;Darkness Returns			
			Game.AddAchievement(16)
;One with the Shadows			
			;Game.AddAchievement(17)
;With Friends Like These...			
			Game.AddAchievement(18)
;Bound Until Death			
			Game.AddAchievement(19)
;Hail Sithis!			
			Game.AddAchievement(20)
;Taking Sides			
			Game.AddAchievement(21)
;War Hero		
			Game.AddAchievement(22)
;Hero of Skyrim			
			Game.AddAchievement(23)			
;Sideways
		Game.AddAchievement(24)
; Hero of the People achievement
			Game.AddAchievement(25)
;Hard Worker
;Not sure
			;Game.AddAchievement(26)
; Thief achievement	
			Game.AddAchievement(27)		
;Snake Tongue	
			Game.AddAchievement(28)
;Blessed			
			Game.AddAchievement(29)
;Standing Stones		
			Game.AddAchievement(30)
;Citizen			
			Game.AddAchievement(31)
;Wanted			
			;Game.AddAchievement(32)
;Married			
			Game.AddAchievement(33)			
;Artificer			
			Game.AddAchievement(34)
; Master Criminal achievement			
			;Game.AddAchievement(35)
; Golden Touch achievement
			Game.AddAchievement(36)
; Delver achievement		
			Game.AddAchievement(37)
; Skill Master achievement
			Game.AddAchievement(38)
; Explorer achievement
			Game.AddAchievement(39)
; Reader achievement
			Game.AddAchievement(40)
;Daedric Influence
			Game.AddAchievement(41)	
;Oblivion Walker
			;Game.AddAchievement(42)
; Dragon Soul achievement
			Game.AddAchievement(43)
; Dragon Hunter achievement
			Game.AddAchievement(44)
; Words of Power achievement	
			Game.AddAchievement (45)
; Thu'um Master achievement
			Game.AddAchievement(46)
; Apprentice achievement	
			Game.AddAchievement(47)
; Adept achievement	
			Game.AddAchievement(48)
; Expert achievement	
			Game.AddAchievement(49)
; Master achievement	
			Game.AddAchievement(50)

debug.notification("Achievements unlocked!")
endevent
