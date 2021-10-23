--[[
    #Author: Polemic
    #Contact: Polemic#5231 | modzstrike3@gmail.com
	|		#	#		   |  		#	#		|
    #Only the owner of this code can process it by deleting a note about the author will be punished with a lawsuit.
	|		#	#		   |		#	#		|
    #Prohibition of selling the script.
    #All rights reserved!
]]

mysql = exports.mysql

function twitterChat(thePlayer, commandName, ...)
	if getElementData(thePlayer, "loggedin") == 1 then
		local logged = getElementData(thePlayer, "loggedin")
		local message = table.concat({...}, " ")
		local name = getPlayerName(thePlayer)
		if getElementData(thePlayer, "twitter:wiadomość") == false then
			setElementData(thePlayer, "twitter:wiadomość", true)
			if (string.len(message)>2) then
				finalmessagee = "[Twitter] " .. name .." pisze: ".. message
				for key, value in ipairs(exports.pool:getPoolElementsByType("player")) do
					outputChatBox(finalmessagee, value, 255, 255, 255)
				end
			elseif (string.len(message)==0) then
				outputChatBox("PRZYKLAD: /twt [Wiadomosc]", thePlayer, 255, 194, 14)
			else
				outputChatBox("Zbyt krótka wiadomość", thePlayer, 255, 255, 255)
			end
		else
			outputChatBox("Tweeta możesz pisać co 5 sekund.", thePlayer, 255, 255, 255)
		end
		setTimer ( function()
			setElementData(thePlayer, "twitter:wiadomość", false)
		end, 5000, 1)
	else
		outputChatBox("Nie możesz pisać na twitterze będac niezalogowanym", thePlayer, 255, 255, 255)
	end
end
addCommandHandler("tweet", twitterChat, false, false)

