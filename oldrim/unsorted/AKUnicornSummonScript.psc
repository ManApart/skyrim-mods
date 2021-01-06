Scriptname AKUnicornSummonScript extends activemagiceffect  
objectreference property horseref auto
activator property fadeinfx auto

event OnEffectStart(Actor akTarget, Actor akCaster)

horseref.moveto(game.getplayer(),  120 * Math.Sin(Game.GetPlayer().GetAngleZ()), 120 * Math.Cos(Game.GetPlayer().GetAngleZ()))
horseref.placeatme(fadeinfx, 1)

endevent