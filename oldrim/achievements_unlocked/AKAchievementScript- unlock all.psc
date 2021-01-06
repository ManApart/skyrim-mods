Scriptname AKAchievementScript extends ObjectReference  


;Notes to myself:
; Define a property that points to the script on this quest, and call the function
; Declare this in your script:
; 	AchievementsScript Property AchievementsQuest Auto
;
; Call this function:
; 	AchievementsQuest.IncSideQuests()
;End notes to myself

;Lines preceded by a semicolon are ignored by the compiler. Use it to make notes of comment out (make the game ignore) a line. :)
;The skyrim wiki can tell you more about achievements, follow this link:
;http://www.uesp.net/wiki/Skyrim:Achievements


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
			Game.AddAchievement(17)
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
			Game.AddAchievement(26)
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
			Game.AddAchievement(32)
;Married			
			Game.AddAchievement(33)			
;Artificer			
			Game.AddAchievement(34)
; Master Criminal achievement			
			Game.AddAchievement(35)
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
			Game.AddAchievement(42)
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

debug.notification("Vanilla Achievements unlocked!")

;--------------------------------------------------DAWNGUARD--------------------------------------------------
;NOTE: These Achievements Not yet tested! Make sure they unlock properly! NEED CONFIRMATION

;Awakening
			Game.AddAchievement(51)
;Beyond Death
			Game.AddAchievement(52)
;Kindred Judgement
			Game.AddAchievement(53)
;Lost to the Ages	
			Game.AddAchievement(54)
;Soul Tear	
			Game.AddAchievement(55)
;Auriel's Bow	
			Game.AddAchievement(56)
;Werewolf Mastered	
			Game.AddAchievement(57)
;Vampire Mastered	
			Game.AddAchievement(58)
;A New You
			Game.AddAchievement(59)
;Legend
			Game.AddAchievement(60)

debug.notification("Dawnguard Achievements unlocked!")
;--------------------------------------------------HEARTHFIRE--------------------------------------------------
;Proud Parent
			Game.AddAchievement(61)
;Landowner		  					;confirmed with CK	
			Game.AddAchievement(62)
;Architect
			Game.AddAchievement(63)
;Land Baron
			Game.AddAchievement(64)
;Master Architect
			Game.AddAchievement(65)
debug.notification("Hearthfire Achievements unlocked!")

;--------------------------------------------------Dragonborn--------------------------------------------------
;Outlander	
			Game.AddAchievement(66)
;The Temple of Miraak  				;confirmed with CK
			Game.AddAchievement(67) 
;The Path of Knowledge
			Game.AddAchievement(68)
;At the Summit of Apocrypha
			Game.AddAchievement(69)
;Dragon Aspect
			Game.AddAchievement(70)
;Hidden Knowledge
			Game.AddAchievement(71)
;Stalhrim Crafter
			Game.AddAchievement(72)
;Dragonrider	
			Game.AddAchievement(73)
;Raven Rock Owner
			Game.AddAchievement(74)
;Solstheim Explorer
			Game.AddAchievement(75)
debug.notification("Dragonborn Achievements unlocked!")

endevent
