Scriptname akriftclosequestscript extends Quest  


SPELL Property akSpell  Auto  
qf_akfriendoftime_010015f7 property akquestscript auto
quest property akfotquest auto


function akriftcounter()

akquestscript.akriftsclosed = (akquestscript.akriftsclosed + 1)
debug.notification("I have closed " + akquestscript.akriftsclosed + " rifts.")
if akfotquest.getstage() == 55
 akfotquest.setstage(60)
endif

endfunction


function akriftcount()

debug.notification("I have closed " + akquestscript.akriftsclosed + " rifts.")


endfunction