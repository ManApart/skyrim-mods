Scriptname AKAutoSortSpellEffectScript extends activemagiceffect  

AKAutoSortQuest Property akquest auto

Event OnEffectStart(Actor akTarget, Actor akCaster)
  Debug.Trace("Magic effect was started on " + akTarget)
  if akCaster == Game.GetPlayer()
    akquest.sortItems()
  endif
endEvent
