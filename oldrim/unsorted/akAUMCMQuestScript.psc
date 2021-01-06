Scriptname akAUMCMQuestScript extends SKI_ConfigBase  
;MCM Quest Script for Achievements Unlocked
; Much thanks to the UESP for information on achievements and achievement descriptions: http://www.uesp.net/wiki/Skyrim:Achievements
;Game.AddAchievement(75)

;OIDs ;stands for option Ids
int OIDAchieve
int OIDa1
int OIDa2
int OIDa3
int OIDa4
int OIDa5
int OIDa6
int OIDa7
int OIDa8
int OIDa9
int OIDa10
int OIDa11
int OIDa12
int OIDa13
int OIDa14
int OIDa15
int OIDa16
int OIDa17
int OIDa18
int OIDa19
int OIDa20
int OIDa21
int OIDa22
int OIDa23
int OIDa24
int OIDa25
int OIDa26
int OIDa27
int OIDa28
int OIDa29
int OIDa30
int OIDa31
int OIDa32
int OIDa33
int OIDa34
int OIDa35
int OIDa36
int OIDa37
int OIDa38
int OIDa39
int OIDa40
int OIDa41
int OIDa42
int OIDa43
int OIDa44
int OIDa45
int OIDa46
int OIDa47
int OIDa48
int OIDa49
int OIDa50
int OIDa51
int OIDa52
int OIDa53
int OIDa54
int OIDa55
int OIDa56
int OIDa57
int OIDa58
int OIDa59
int OIDa60
int OIDa61
int OIDa62
int OIDa63
int OIDa64
int OIDa65
int OIDa66
int OIDa67
int OIDa68
int OIDa69
int OIDa70
int OIDa71
int OIDa72
int OIDa73
int OIDa74
int OIDa75


;achievement variables
Bool Property a1 Auto ;whether achievement 1 will be achieved when the achievement button is pressed
Bool Property a2 Auto
Bool Property a3 Auto
Bool Property a4 Auto
Bool Property a5 Auto
Bool Property a6 Auto
Bool Property a7 Auto
Bool Property a8 Auto
Bool Property a9 Auto
Bool Property a10 Auto
Bool Property a11 Auto
Bool Property a12 Auto
Bool Property a13 Auto
Bool Property a14 Auto
Bool Property a15 Auto
Bool Property a16 Auto
Bool Property a17 Auto
Bool Property a18 Auto
Bool Property a19 Auto
Bool Property a20 Auto
Bool Property a21 Auto
Bool Property a22 Auto
Bool Property a23 Auto
Bool Property a24 Auto
Bool Property a25 Auto
Bool Property a26 Auto
Bool Property a27 Auto
Bool Property a28 Auto
Bool Property a29 Auto
Bool Property a30 Auto
Bool Property a31 Auto
Bool Property a32 Auto
Bool Property a33 Auto
Bool Property a34 Auto
Bool Property a35 Auto
Bool Property a36 Auto
Bool Property a37 Auto
Bool Property a38 Auto
Bool Property a39 Auto
Bool Property a40 Auto
Bool Property a41 Auto
Bool Property a42 Auto
Bool Property a43 Auto
Bool Property a44 Auto
Bool Property a45 Auto
Bool Property a46 Auto
Bool Property a47 Auto
Bool Property a48 Auto
Bool Property a49 Auto
Bool Property a50 Auto
Bool Property a51 Auto
Bool Property a52 Auto
Bool Property a53 Auto
Bool Property a54 Auto
Bool Property a55 Auto
Bool Property a56 Auto
Bool Property a57 Auto
Bool Property a58 Auto
Bool Property a59 Auto
Bool Property a60 Auto
Bool Property a61 Auto
Bool Property a62 Auto
Bool Property a63 Auto
Bool Property a64 Auto
Bool Property a65 Auto
Bool Property a66 Auto
Bool Property a67 Auto
Bool Property a68 Auto
Bool Property a69 Auto
Bool Property a70 Auto
Bool Property a71 Auto
Bool Property a72 Auto
Bool Property a73 Auto
Bool Property a74 Auto
Bool Property a75 Auto


event OnPageReset(string page)
; Load custom .swf for animated logo that's displayed when no page is selected yet.
	if (page == "")
		LoadCustomContent("AKAchievementsUnlockedTitle.dds", 122, 99)
		return
	else
		UnloadCustomContent()
	endIf
	SetCursorFillMode(TOP_TO_BOTTOM)
	SetCursorPosition(0) ; Can be removed because it starts at 0 anyway
	OIDAchieve = addtextoption("Achieve!", "")
	addemptyoption()
	if (page == "Vanilla")
		OIDa1 = AddToggleOption("Unbound", a1)
		OIDa2 = AddToggleOption("Bleak Falls Barrow	", a2)
		OIDa3 = AddToggleOption("The Way of the Voice", a3)
		OIDa4 = AddToggleOption("Diplomatic Immunity", a4)
		OIDa5 = AddToggleOption("Alduin's Wall", a5)
		OIDa6 = AddToggleOption("Elder Knowledge", a6)
		OIDa7 = AddToggleOption("The Fallen", a7)
		OIDa8 = AddToggleOption("Dragonslayer", a8)
		OIDa9 = AddToggleOption("Take Up Arms", a9)
		OIDa10 = AddToggleOption("Blood Oath", a10)
		OIDa11 = AddToggleOption("Glory of the Dead", a11)
		OIDa12 = AddToggleOption("Gatekeeper", a12)
		OIDa13 = AddToggleOption("Revealing the Unseen", a13)
		OIDa14 = AddToggleOption("The Eye of Magnus", a14)
		OIDa15 = AddToggleOption("Taking Care of Business", a15)
		OIDa16 = AddToggleOption("Darkness Returns", a16)
		OIDa17 = AddToggleOption("One with the Shadows", a17)
		OIDa18 = AddToggleOption("With Friends Like These...", a18)
		OIDa19 = AddToggleOption("Bound Until Death", a19)
		OIDa20 = AddToggleOption("Hail Sithis!", a20)
		OIDa21 = AddToggleOption("Taking Sides", a21)
		OIDa22 = AddToggleOption("War Hero", a22)
		OIDa23 = AddToggleOption("Hero of Skyrim", a23)
		OIDa24 = AddToggleOption("Sideways", a24)
		OIDa25 = AddToggleOption("Hero of the People", a25)
		
		SetCursorPosition(1) ; Move cursor to top right position
		addemptyoption()
		addemptyoption()
		OIDa26 = AddToggleOption("Hard Worker", a26)
		OIDa27 = AddToggleOption("Thief", a27)
		OIDa28 = AddToggleOption("Snake Tongue", a28)
		OIDa29 = AddToggleOption("Blessed", a29)
		OIDa30 = AddToggleOption("Standing Stones", a30)
		OIDa31 = AddToggleOption("Citizen", a31)
		OIDa32 = AddToggleOption("Wanted", a32)
		OIDa33 = AddToggleOption("Married", a33)
		OIDa34 = AddToggleOption("Artificer", a34)
		OIDa35 = AddToggleOption("Master Criminal", a35)
		OIDa36 = AddToggleOption("Golden Touch", a36)
		OIDa37 = AddToggleOption("Delver", a37)
		OIDa38 = AddToggleOption("Skill Master", a38)
		OIDa39 = AddToggleOption("Explorer", a39)
		OIDa40 = AddToggleOption("Reader", a40)
		OIDa41 = AddToggleOption("Daedric Influence", a41)
		OIDa42 = AddToggleOption("Oblivion Walker", a42)
		OIDa43 = AddToggleOption("Dragon Soul", a43)
		OIDa44 = AddToggleOption("Dragon Hunter", a44)
		OIDa45 = AddToggleOption("Words of Power", a45)
		OIDa46 = AddToggleOption("Thu'um Master", a46)
		OIDa47 = AddToggleOption("Apprentice", a47)
		OIDa48 = AddToggleOption("Adept", a48)
		OIDa49 = AddToggleOption("Expert", a49)
		OIDa50 = AddToggleOption("Master", a50)
	elseif (page == "Dawnguard")	
		OIDa51 = AddToggleOption("Awakening", a51)
		OIDa52 = AddToggleOption("Beyond Death", a52)
		OIDa53 = AddToggleOption("Kindred Judgement", a53)
		OIDa54 = AddToggleOption("Lost to the Ages", a54)
		OIDa55 = AddToggleOption("Soul Tear", a55)
		OIDa56 = AddToggleOption("Auriel's Bow", a56)
		OIDa57 = AddToggleOption("Werewolf Mastered	", a57)
		OIDa58 = AddToggleOption("Vampire Mastered", a58)
		OIDa59 = AddToggleOption("A New You", a59)
		OIDa60 = AddToggleOption("Legend", a60)
	elseif (page == "Hearthfire")	
		OIDa61 = AddToggleOption("Proud Parent", a61)
		OIDa62 = AddToggleOption("Landowner", a62)
		OIDa63 = AddToggleOption("Architect", a63)
		OIDa64 = AddToggleOption("Land Baron", a64)
		OIDa65 = AddToggleOption("Master Architect", a65)
	elseif (page == "Dragonborn")	
		OIDa66 = AddToggleOption("Outlander", a66)
		OIDa67 = AddToggleOption("The Temple of Miraak", a67)
		OIDa68 = AddToggleOption("The Path of Knowledge", a68)
		OIDa69 = AddToggleOption("At the Summit of Apocrypha", a69)
		OIDa70 = AddToggleOption("Dragon Aspect", a70)
		OIDa71 = AddToggleOption("Hidden Knowledge", a71)
		OIDa72 = AddToggleOption("Stalhrim Crafter", a72)
		OIDa73 = AddToggleOption("Dragonrider", a73)
		OIDa74 = AddToggleOption("Raven Rock Owner", a74)
		OIDa75 = AddToggleOption("Solstheim Explorer", a75)	
	EndIf
endEvent

;-----------------------------------------------------Option Select functions
event OnOptionSelect(int option)
	if currentpage == "Vanilla"
		OptionselectVanilla(option)
	elseif currentpage == "Dawnguard"
		OptionSelectDawnguard(option)
	elseif currentpage == "Hearthfire"
		OptionSelectHearthfire(option)
	elseif currentpage == "Dragonborn"
		OptionSelectDragonborn(option)
	EndIf
endEvent

function OptionselectVanilla(int option)
	if option == OIDAchieve
		akachievevanilla()
	elseif (option == OIDa1)
		a1 = !a1
		SetToggleOptionValue(OIDa1, a1)
	elseIf (option == OIDa2)
		a2 = !a2
		SetToggleOptionValue(OIDa2, a2)
	elseIf (option == OIDa2)
		a2 = !a2
		SetToggleOptionValue(OIDa3, a3)
	elseIf (option == OIDa3)
		a3 = !a3
		SetToggleOptionValue(OIDa3, a3)
	elseIf (option == OIDa4)
		a4 = !a4
		SetToggleOptionValue(OIDa4, a4)
	elseIf (option == OIDa4)
		a4 = !a4
		SetToggleOptionValue(OIDa5, a5)
	elseIf (option == OIDa5)
		a5 = !a5
		SetToggleOptionValue(OIDa5, a5)
	elseIf (option == OIDa6)
		a6 = !a6
		SetToggleOptionValue(OIDa6, a6)
	elseIf (option == OIDa7)
		a7 = !a7
		SetToggleOptionValue(OIDa7, a7)
	elseIf (option == OIDa8)
		a8 = !a8
		SetToggleOptionValue(OIDa8, a8)
	elseIf (option == OIDa9)
		a9 = !a9
		SetToggleOptionValue(OIDa9, a9)
	elseIf (option == OIDa10)
		a10 = !a10
		SetToggleOptionValue(OIDa10, a10)
	elseIf (option == OIDa11)
		a11 = !a11
		SetToggleOptionValue(OIDa11, a11)
	elseIf (option == OIDa11)
		a11 = !a11
		SetToggleOptionValue(OIDa12, a12)
	elseIf (option == OIDa12)
		a12 = !a12
		SetToggleOptionValue(OIDa12, a12)
	elseIf (option == OIDa13)
		a13 = !a13
		SetToggleOptionValue(OIDa13, a13)
	elseIf (option == OIDa14)
		a14 = !a14
		SetToggleOptionValue(OIDa14, a14)
	elseIf (option == OIDa15)
		a15 = !a15
		SetToggleOptionValue(OIDa15, a15)
	elseIf (option == OIDa16)
		a16 = !a16
		SetToggleOptionValue(OIDa16, a16)
	elseIf (option == OIDa17)
		a17 = !a17
		SetToggleOptionValue(OIDa17, a17)
	elseIf (option == OIDa18)
		a18 = !a18
		SetToggleOptionValue(OIDa18, a18)
	elseIf (option == OIDa19)
		a19 = !a19
		SetToggleOptionValue(OIDa19, a19)
		elseIf (option == OIDa20)
		a20 = !a20
		SetToggleOptionValue(OIDa20, a20)
	elseIf (option == OIDa21)
		a21 = !a21
		SetToggleOptionValue(OIDa21, a21)
	elseIf (option == OIDa22)
		a22 = !a22
		SetToggleOptionValue(OIDa22, a22)
	elseIf (option == OIDa23)
		a23 = !a23
		SetToggleOptionValue(OIDa24, a24)
	elseIf (option == OIDa25)
		a25 = !a25
		SetToggleOptionValue(OIDa25, a25)
	elseIf (option == OIDa26)
		a26 = !a26
		SetToggleOptionValue(OIDa26, a26)
	elseIf (option == OIDa27)
		a27 = !a27
		SetToggleOptionValue(OIDa27, a27)
	elseIf (option == OIDa28)
		a28 = !a28
		SetToggleOptionValue(OIDa28, a28)
	elseIf (option == OIDa29)
		a29 = !a29
		SetToggleOptionValue(OIDa29, a29)
	elseIf (option == OIDa30)
		a30 = !a30
		SetToggleOptionValue(OIDa30, a30)
	elseIf (option == OIDa31)
		a31 = !a31
		SetToggleOptionValue(OIDa31, a31)
	elseIf (option == OIDa32)
		a32 = !a32
		SetToggleOptionValue(OIDa32, a32)
	elseIf (option == OIDa33)
		a33 = !a33
		SetToggleOptionValue(OIDa33, a33)
	elseIf (option == OIDa34)
		a34 = !a34
		SetToggleOptionValue(OIDa34, a34)
	elseIf (option == OIDa35)
		a35 = !a35
		SetToggleOptionValue(OIDa35, a35)
	elseIf (option == OIDa36)
		a36 = !a36
		SetToggleOptionValue(OIDa36, a36)
	elseIf (option == OIDa37)
		a37 = !a37
		SetToggleOptionValue(OIDa37, a37)
	elseIf (option == OIDa38)
		a38 = !a38
		SetToggleOptionValue(OIDa38, a38)
	elseIf (option == OIDa39)
		a39 = !a39
		SetToggleOptionValue(OIDa39, a39)
	elseIf (option == OIDa40)
		a40 = !a40
		SetToggleOptionValue(OIDa40, a40)
	elseIf (option == OIDa41)
		a41 = !a41
		SetToggleOptionValue(OIDa41, a41)
	elseIf (option == OIDa42)
		a42 = !a42
		SetToggleOptionValue(OIDa42, a42)
	elseIf (option == OIDa43)
		a43 = !a43
		SetToggleOptionValue(OIDa43, a43)
	elseIf (option == OIDa44)
		a44 = !a44
		SetToggleOptionValue(OIDa44, a44)
	elseIf (option == OIDa45)
		a45 = !a45
		SetToggleOptionValue(OIDa45, a45)
	elseIf (option == OIDa46)
		a46 = !a46
		SetToggleOptionValue(OIDa46, a46)
	elseIf (option == OIDa47)
		a47 = !a47
		SetToggleOptionValue(OIDa47, a47)
	elseIf (option == OIDa48)
		a48 = !a48
		SetToggleOptionValue(OIDa48, a48)
	elseIf (option == OIDa49)
		a49 = !a49
		SetToggleOptionValue(OIDa49, a49)
	elseIf (option == OIDa50)
		a50 = !a50
		SetToggleOptionValue(OIDa50, a50)
	endIf
EndFunction

Function OptionSelectDawnguard(int option)
	if option == OIDAchieve
		akachievedawnguard()
	ElseIf (option == OIDa51)
		a51 = !a51
		SetToggleOptionValue(OIDa51, a51)
	elseIf (option == OIDa52)
		a52 = !a52
		SetToggleOptionValue(OIDa52, a52)
	elseIf (option == OIDa53)
		a53 = !a53
		SetToggleOptionValue(OIDa53, a53)
	elseIf (option == OIDa54)
		a54 = !a54
		SetToggleOptionValue(OIDa54, a54)
	elseIf (option == OIDa55)
		a55 = !a55
		SetToggleOptionValue(OIDa55, a55)
	elseIf (option == OIDa56)
		a56 = !a56
		SetToggleOptionValue(OIDa56, a56)
	elseIf (option == OIDa57)
		a57 = !a57
		SetToggleOptionValue(OIDa57, a57)
	elseIf (option == OIDa58)
		a58 = !a58
		SetToggleOptionValue(OIDa58, a58)
	elseIf (option == OIDa59)
		a59 = !a59
		SetToggleOptionValue(OIDa59, a59)
	elseIf (option == OIDa60)
		a60 = !a60
		SetToggleOptionValue(OIDa60, a60)
	EndIf
		
EndFunction

Function OptionSelectHearthfire(int option)
	if option == OIDAchieve
		akachievehearthfire()
	elseIf (option == OIDa61)
		a61 = !a61
		SetToggleOptionValue(OIDa61, a61)
	elseIf (option == OIDa62)
		a62 = !a62
		SetToggleOptionValue(OIDa62, a62)
	elseIf (option == OIDa63)
		a63 = !a63
		SetToggleOptionValue(OIDa63, a63)
	elseIf (option == OIDa64)
		a64 = !a64
		SetToggleOptionValue(OIDa64, a64)
	elseIf (option == OIDa65)
		a65 = !a65
		SetToggleOptionValue(OIDa65, a65)
	EndIf

EndFunction

Function OptionSelectDragonborn(int option)
	if option == OIDAchieve
		akachievedragonborn()
	elseIf (option == OIDa66)
		a66 = !a66
		SetToggleOptionValue(OIDa66, a66)
	elseIf (option == OIDa67)
		a67 = !a67
		SetToggleOptionValue(OIDa67, a67)
	elseIf (option == OIDa68)
		a68 = !a68
		SetToggleOptionValue(OIDa68, a68)
	elseIf (option == OIDa69)
		a69 = !a69
		SetToggleOptionValue(OIDa69, a69)
	elseIf (option == OIDa70)
		a70 = !a70
		SetToggleOptionValue(OIDa70, a70)
	elseIf (option == OIDa71)
		a71 = !a71
		SetToggleOptionValue(OIDa71, a71)
	elseIf (option == OIDa72)
		a72 = !a72
		SetToggleOptionValue(OIDa72, a72)
	elseIf (option == OIDa73)
		a73 = !a73
		SetToggleOptionValue(OIDa73, a73)
	elseIf (option == OIDa74)
		a74 = !a74
		SetToggleOptionValue(OIDa74, a74)
	elseIf (option == OIDa75)
		a75 = !a75
		SetToggleOptionValue(OIDa75, a75)
	EndIf
EndFunction

;-----------------------------------------------------Option Default functions
;Defaults are great, but they seem kind of pointless for this mod, and I don't feel like doing another couple hundred lines of code. ;)
event OnOptionDefault(int option)
	if currentpage == "Vanilla"
		SetDefaultVanilla(option)
	elseif currentpage == "Dawnguard"
		SetDefaultDawnguard(option)
	elseif currentpage == "Hearthfire"
		SetDefaultHearthfire(option)
	elseif currentpage == "Dragonborn"
		SetDefaultDragonborn(option)
	EndIf
endEvent

function SetDefaultVanilla(int option)
	if (option == OIDa1)
		a1 = false ; default value
		SetToggleOptionValue(OIDa1, a1)
	elseIf (option == OIDa2)
		a2 = true ; default value
		SetToggleOptionValue(OIDa2, a2)
	endIf
EndFunction

Function SetDefaultDawnguard(int option)
EndFunction

Function SetDefaultHearthfire(int option)
EndFunction

Function SetDefaultDragonborn(int option)
EndFunction



;-----------------------------------------------------Option Highlight functions
event OnOptionHighlight(int option)
	if option == OIDAchieve
		SetInfoText("Unlocks the selected achievements on this page.")
	Elseif currentpage == "Vanilla"
		HighlightOptionVanilla(option)
	elseif currentpage == "Dawnguard"
		HighlightOptionDawnguard(option)
	elseif currentpage == "Hearthfire"
		HighlightOptionHearthfire(option)
	elseif currentpage == "Dragonborn"
		HighlightOptionDragonborn(option)
	EndIf
endEvent

function HighlightOptionVanilla(int option)
	if (option == OIDa1)
		SetInfoText("Complete Unbound")
	elseIf (option == OIDa2)
		SetInfoText("Complete Bleak Falls Barrow")
	elseIf (option == OIDa3)
		SetInfoText("Complete The Way of the Voice")
	elseIf (option == OIDa4)
		SetInfoText("Complete Diplomatic Immunity")
	elseIf (option == OIDa5)
		SetInfoText("Complete Alduin's Wall")
	elseIf (option == OIDa6)
		SetInfoText("Complete Elder Knowledge")
	elseIf (option == OIDa7)
		SetInfoText("Complete The Fallen")
	elseIf (option == OIDa8)
		SetInfoText("Complete Dragonslayer")
	elseIf (option == OIDa9)
		SetInfoText("Join the Companions")
	elseIf (option == OIDa10)
		SetInfoText("Become a member of the Circle")
	elseIf (option == OIDa11)
		SetInfoText("Complete Glory of the Dead")
	elseIf (option == OIDa12)
		SetInfoText("Join the College of Winterhold")
	elseIf (option == OIDa13)
		SetInfoText("Complete Revealing the Unseen")
	elseIf (option == OIDa14)
		SetInfoText("Complete The Eye of Magnus")
	elseIf (option == OIDa15)
		SetInfoText("Join the Thieves Guild")
	elseIf (option == OIDa16)
		SetInfoText("Complete Darkness Returns")
	elseIf (option == OIDa17)
		SetInfoText("Returned the Thieves Guild to its former glory")
	elseIf (option == OIDa18)
		SetInfoText("Join the Dark Brotherhood")
	elseIf (option == OIDa19)
		SetInfoText("Complete Bound Until Death")
	elseIf (option == OIDa20)
		SetInfoText("Complete Hail Sithis!")
	elseIf (option == OIDa21)
		SetInfoText("Join the Stormcloaks or the Imperial Army")
	elseIf (option == OIDa22)
		SetInfoText("Capture Fort Sungard or Fort Greenwall")
	elseIf (option == OIDa23)
		SetInfoText("Capture Solitude or Windhelm")
	elseIf (option == OIDa24)
		SetInfoText("Complete 10 side quests")
	elseIf (option == OIDa25)
		SetInfoText("Complete 50 Misc Objectives")
	elseIf (option == OIDa26)
		SetInfoText("Chop wood, mine ore, and cook food")
	elseIf (option == OIDa27)
		SetInfoText("Pick 50 locks and 50 pockets")
	elseIf (option == OIDa28)
		SetInfoText("Successfully persuade, bribe, and intimidate")
	elseIf (option == OIDa29)
		SetInfoText("Select a Standing Stone blessing")
	elseIf (option == OIDa30)
		SetInfoText("Find 13 Standing Stones")
	elseIf (option == OIDa31)
		SetInfoText("Buy a house")
	elseIf (option == OIDa32)
		SetInfoText("Escape from jail")
	elseIf (option == OIDa33)
		SetInfoText("Get married")
	elseIf (option == OIDa34)
		SetInfoText("Make a smithed item, an enchanted item, and a potion")
	elseIf (option == OIDa35)
		SetInfoText("Bounty of 1000 gold in all nine holds")
	elseIf (option == OIDa36)
		SetInfoText("Have 100,000 gold")
	elseIf (option == OIDa37)
		SetInfoText("Clear 50 dungeons")
	elseIf (option == OIDa38)
		SetInfoText("Get a skill to 100")
	elseIf (option == OIDa39)
		SetInfoText("Discover 100 locations")
	elseIf (option == OIDa40)
		SetInfoText("Read 50 Skill Books")
	elseIf (option == OIDa41)
		SetInfoText("Acquire a Daedric Artifact")
	elseIf (option == OIDa42)
		SetInfoText("Collect 15 Daedric Artifacts")
	elseIf (option == OIDa43)
		SetInfoText("Absorb a dragon soul")
	elseIf (option == OIDa44)
		SetInfoText("Absorb 20 dragon souls")
	elseIf (option == OIDa45)
		SetInfoText("Learn all three words of a shout")
	elseIf (option == OIDa46)
		SetInfoText("Learn 20 shouts")
	elseIf (option == OIDa47)
		SetInfoText("Reach Level 5")
	elseIf (option == OIDa48)
		SetInfoText("Reach Level 10")
	elseIf (option == OIDa49)
		SetInfoText("Reach Level 25")
	elseIf (option == OIDa50)
		SetInfoText("Reach Level 50")
	endIf
EndFunction

Function HighlightOptionDawnguard(int option)
	If (option == OIDa51)
		SetInfoText("Complete Awakening")
	elseIf (option == OIDa52)
		SetInfoText("Complete Beyond Death")
	elseIf (option == OIDa53)
		SetInfoText("Complete Kindred Judgment")
	elseIf (option == OIDa54)
		SetInfoText("Complete Lost to the Ages")
	elseIf (option == OIDa55)
		SetInfoText("Learn all three words of Soul Tear")
	elseIf (option == OIDa56)
		SetInfoText("Use the special power of Auriel's Bow")
	elseIf (option == OIDa57)
		SetInfoText("Acquire 11 werewolf perks")
	elseIf (option == OIDa58)
		SetInfoText("Acquire 11 vampire perks")
	elseIf (option == OIDa59)
		SetInfoText("Change your face")
	elseIf (option == OIDa60)
		SetInfoText("Defeat a Legendary Dragon")
	EndIf
EndFunction

Function HighlightOptionHearthfire(int option)
	If (option == OIDa61)
		SetInfoText("Adopt a child")
	elseIf (option == OIDa62)
		SetInfoText("Buy a plot of land")
	elseIf (option == OIDa63)
		SetInfoText("Build three wings on a house")
		elseIf (option == OIDa64)
		SetInfoText("Buy three plots of land")
	elseIf (option == OIDa65)
		SetInfoText("Build three houses")
	EndIf
EndFunction

Function HighlightOptionDragonborn(int option)
	If (option == OIDa66)
		SetInfoText("Arrive on Solstheim")
	elseIf (option == OIDa67)
		SetInfoText("Complete The Temple of Miraak")
	elseIf (option == OIDa68)
		SetInfoText("Complete The Path of Knowledge")
	elseIf (option == OIDa69)
		SetInfoText("Complete At the Summit of Apocrypha")
	elseIf (option == OIDa70)
		SetInfoText("Learn all 3 words of Dragon Aspect")
	elseIf (option == OIDa71)
		SetInfoText("Learn the secrets of 5 Black Books")
	elseIf (option == OIDa72)
		SetInfoText("Craft an item out of Stalhrim")
	elseIf (option == OIDa73)
		SetInfoText("Tame and ride 5 dragons")
	elseIf (option == OIDa74)
		SetInfoText("Own a house in Raven Rock")
	elseIf (option == OIDa75)
		SetInfoText("Discover 30 locations on the island of Solstheim")
	EndIf
EndFunction



;-----------------------------------------------------Achieve Functions
Function akachieveVanilla()
	SetTextOptionValue(OIDachieve, "Vanilla achievements unlocked!")
	if a1
		Game.AddAchievement(1)
	EndIf
	if a2
		Game.AddAchievement(2)
	EndIf
	if a3
		Game.AddAchievement(3)
	EndIf
	if a4
		Game.AddAchievement(4)
	EndIf
	if a5
		Game.AddAchievement(5)
	EndIf
	if a6
		Game.AddAchievement(6)
	EndIf
	if a7
		Game.AddAchievement(7)
	EndIf
	if a8
		Game.AddAchievement(8)
	EndIf
	if a9
		Game.AddAchievement(9)
	EndIf
	if a10
		Game.AddAchievement(10)
	EndIf
	if a11
		Game.AddAchievement(11)
	EndIf
	if a12
		Game.AddAchievement(12)
	EndIf
	if a13
		Game.AddAchievement(13)
	EndIf
	if a14
		Game.AddAchievement(14)
	EndIf
	if a15
		Game.AddAchievement(15)
	EndIf
	if a16
		Game.AddAchievement(16)
	EndIf
	if a17
		Game.AddAchievement(17)
	EndIf
	if a18
		Game.AddAchievement(18)
	EndIf
	if a19
		Game.AddAchievement(19)
	EndIf
	if a20
		Game.AddAchievement(20)
	EndIf
	if a21
		Game.AddAchievement(21)
	EndIf
	if a22
		Game.AddAchievement(22)
	EndIf
	if a23
		Game.AddAchievement(23)
	EndIf
	if a24
		Game.AddAchievement(24)
	EndIf
	if a25
		Game.AddAchievement(25)
	EndIf
	if a26
		Game.AddAchievement(26)
	EndIf
	if a27
		Game.AddAchievement(27)
	EndIf
	if a28
		Game.AddAchievement(28)
	EndIf
	if a29
		Game.AddAchievement(29)
	EndIf
	if a30
		Game.AddAchievement(30)
	EndIf
	if a31
		Game.AddAchievement(31)
	EndIf
	if a32
		Game.AddAchievement(32)
	EndIf
	if a33
		Game.AddAchievement(33)
	EndIf
	if a34
		Game.AddAchievement(34)
	EndIf
	if a35
		Game.AddAchievement(35)
	EndIf
	if a36
		Game.AddAchievement(36)
	EndIf
	if a37
		Game.AddAchievement(37)
	EndIf
	if a38
		Game.AddAchievement(38)
	EndIf
	if a39
		Game.AddAchievement(39)
	EndIf
	if a40
		Game.AddAchievement(40)
	EndIf
	if a41
		Game.AddAchievement(41)
	EndIf
	if a42
		Game.AddAchievement(42)
	EndIf
	if a43
		Game.AddAchievement(43)
	EndIf
	if a44
		Game.AddAchievement(44)
	EndIf
	if a45
		Game.AddAchievement(45)
	EndIf
	if a46
		Game.AddAchievement(46)
	EndIf
	if a47
		Game.AddAchievement(47)
	EndIf
	if a48
		Game.AddAchievement(48)
	EndIf
	if a49
		Game.AddAchievement(49)
	EndIf
	if a50
		Game.AddAchievement(50)
	EndIf
	;Debug.Notification("Vanilla achievements unlocked!")
	utility.waitmenumode(2.0)
	SetTextOptionValue(OIDachieve, "")
EndFunction

Function akachieveDawnguard()
	SetTextOptionValue(OIDachieve, "Dawnguard achievements unlocked!")
	if a51
		Game.AddAchievement(51)
	EndIf
	if a52
		Game.AddAchievement(52)
	EndIf
	if a53
		Game.AddAchievement(53)
	EndIf
	if a54
		Game.AddAchievement(54)
	EndIf
	if a55
		Game.AddAchievement(55)
	EndIf
	if a56
		Game.AddAchievement(56)
	EndIf
	if a57
		Game.AddAchievement(57)
	EndIf
	if a58
		Game.AddAchievement(58)
	EndIf
	if a59
		Game.AddAchievement(59)
	EndIf
	if a60
		Game.AddAchievement(60)
	EndIf
	;Debug.Notification("Dawnguard achievements unlocked!")
	utility.waitmenumode(2.0)
	SetTextOptionValue(OIDachieve, "")
EndFunction

Function akachieveHearthfire()
	SetTextOptionValue(OIDachieve, "Hearthfire achievements unlocked!")
	if a61
		Game.AddAchievement(61)
	EndIf
	if a62
		Game.AddAchievement(62)
	EndIf
	if a63
		Game.AddAchievement(63)
	EndIf
	if a64
		Game.AddAchievement(64)
	EndIf
	if a65
		Game.AddAchievement(65)
	EndIf
	;Debug.Notification("Hearthfire achievements unlocked!")
	utility.waitmenumode(2.0)
	SetTextOptionValue(OIDachieve, "")
EndFunction

Function akachieveDragonborn()
	SetTextOptionValue(OIDachieve, "Dragonborn achievements unlocked!")
	if a66
		Game.AddAchievement(66)
	EndIf
	if a67
		Game.AddAchievement(67)
	EndIf
	if a68
		Game.AddAchievement(68)
	EndIf
	if a69
		Game.AddAchievement(69)
	EndIf
	if a70
		Game.AddAchievement(70)
	EndIf
	if a71
		Game.AddAchievement(71)
	EndIf
	if a72
		Game.AddAchievement(72)
	EndIf
	if a73
		Game.AddAchievement(73)
	EndIf
	if a74
		Game.AddAchievement(74)
	EndIf
	if a75
		Game.AddAchievement(75)
	EndIf
		
	;Debug.Notification("Dragonborn achievements unlocked!")
	utility.waitmenumode(2.0)
	SetTextOptionValue(OIDachieve, "")
EndFunction