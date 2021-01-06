Scriptname AKSOSFunctions extends Quest  Conditional
;This script contains the functions used by Slim Shady dialogue

;Main SOS Quest Properties
qf_aksonofsheogorathquest_01000D6B property akquestscript auto
ReferenceAlias property alias_slim_shady auto


;-------------------------------------------------------------------------------
;Weapon swap variables
weapon akweapon
bool property slimhasweapon auto conditional

;Slim Steals the player's weapon
function akweaponswap()
	akweapon = game.getplayer().getequippedweapon()
	game.getplayer().removeitem(akweapon, 1, true, alias_slim_shady.getref())
	alias_slim_shady.getactorref().equipitem(akweapon)
	SlimHasWeapon = 1
endfunction

;Slim gives the weapon back
function akweaponswap2()
	alias_slim_shady.getref().removeitem(akweapon, 1, true, game.getplayer())
	SlimHasWeapon = 0
endfunction