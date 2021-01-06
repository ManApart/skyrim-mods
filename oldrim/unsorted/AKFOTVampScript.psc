Scriptname AKFOTVampScript extends ObjectReference  

;blade properties
keyword property weaptypedagger auto
keyword property weaptypesword auto
keyword property weaptypegreatsword auto

;blunt properties
keyword property weaptypebattleaxe auto
keyword property weaptypemace auto
keyword property weaptypewaraxe auto
keyword property weaptypewarhammer auto

keyword property akbow auto

keyword property akshock auto
keyword property akflame auto
keyword property akfrost auto

Event OnHit(ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked)

;Hit with Blade
if (aksource.HasKeyword(weaptypedagger))|| (aksource.HasKeyword(weaptypesword )) || (aksource.HasKeyword(weaptypegreatsword))
debug.notification("Hit with Blade")

;Hit with Blunt
elseif (aksource.HasKeyword(weaptypebattleaxe )) || (aksource.HasKeyword(weaptypemace )) || (aksource.HasKeyword(weaptypewaraxe )) || (aksource.HasKeyword(weaptypewarhammer ))
debug.notification("Hit with Blunt")

;Hit with Bow
elseif (aksource.HasKeyword(akbow))
debug.notification("Hit with Bow")

;Hit with Shock
elseif (aksource.HasKeyword(akshock))
debug.notification("Hit with Shock")

;Hit with Flame
elseif (aksource.HasKeyword(akflame))
debug.notification("Hit with Flame")

;Hit with Frost
elseif (aksource.HasKeyword(akfrost))
debug.notification("Hit with Frost")

;else
debug.notification("The weapon has no effect!")

endif
endevent