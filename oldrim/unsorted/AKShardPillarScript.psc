Scriptname AKShardPillarScript extends ObjectReference  

;melt shader idea taken from quest script: Scriptname MQKillDragonScript extends Quest  Conditional

keyword property magicdamagefire auto
actor property aksnowelf auto
objectreference property akshard auto
effectshader property dragonholesmagicfxs auto
magiceffect property FireDamageConcAimed auto
magiceffect property FireDamageFFAimed auto
magiceffect property FireDamageFFAimed75 auto
int akflamecount


Event OnMagicEffectApply(ObjectReference akCaster, MagicEffect akEffect)

;if (self as objectreference).HasEffectKeyword(magicdamagefire)
if akEffect == FireDamageConcAimed
	if akflamecount < 10
		akflamecount = (akflamecount + 1)
		;debug.notification(akflamecount)
		return
	elseif akflamecount >= 10
		akmelt()
	endif

elseif akEffect == FireDamageFFAimed
	if akflamecount < 10
		akflamecount = (akflamecount + 5)
		;debug.notification(akflamecount)
		return
	elseif akflamecount >= 10
		akmelt()
	endif

elseif akEffect == FireDamageFFAimed75
	akmelt()

endif
EndEvent


Event OnActivate(ObjectReference akActionRef)
debug.notification("Pillar activated")
endevent


function akmelt()
	debug.notification("The ice is melting!")
	DragonHolesMagicFXS.Play(self)
	aksnowelf.kill()
	akflamecount = 0
	utility.wait(2.0)
	self.delete()
endfunction