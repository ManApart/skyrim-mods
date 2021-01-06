Scriptname AKWebPull extends activemagiceffect  

Event OnEffectStart(Actor akTarget, Actor akCaster)
aktarget.moveto(akcaster, 100 * Math.Sin(Game.GetPlayer().GetAngleZ()), 100 * Math.Cos(Game.GetPlayer().GetAngleZ()),0)
debug.notification("Web pulled")


endEvent
