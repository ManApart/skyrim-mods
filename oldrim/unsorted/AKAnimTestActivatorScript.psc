Scriptname AKAnimTestActivatorScript extends ObjectReference  
	Spell Property AKInvincibleSpell Auto
Event OnCellAttach()
	Debug.Notification("Activator on Cell attach")
	AKInvincibleSpell.Cast(self, game.getplayer())
	RegisterForSingleUpdate(3.0)
EndEvent


Event OnUpdate()
If self.GetParentCell() == Game.GetPlayer().GetParentCell()
	AKInvincibleSpell.Cast(self, game.getplayer())
	RegisterForSingleUpdate(3.0)
EndIf
EndEvent