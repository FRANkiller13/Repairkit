ESX = nil

TriggerEvent('esx:getSharedObject', function(obj)
	ESX = obj
end)

RegisterCommand("repairkit", function(source, args)
		TriggerEvent('commandEntered', source, message);
		CancelEvent();
end)

RegisterServerEvent('commandEntered')
AddEventHandler('commandEntered', function(source, name, msg, fullcommand)
	name = GetPlayerName(source)
	player = GetPlayerIdentifiers(source)[1]
	local result = MySQL.Sync.fetchAll(
	  'SELECT * FROM users WHERE identifier = @identifier',
	  {
		['@identifier'] = player
	  }
	)

	for i=1, #result, 1 do				
				if result[i].job == 'mechanic' then 
					
					local xPlayer = ESX.GetPlayerFromId(source)
					local repairkit = xPlayer.getInventoryItem('repairkit').count
					if repairkit <= 1 then
					xPlayer.addInventoryItem('repairkit', 1)
					TriggerClientEvent('chatMessage', source, "SYSTEM", {255, 0, 0}, "You got Repair Kit")
					TriggerClientEvent('esx:showNotification', source, "You got ~r~Repair Kit~r~")
					CancelEvent()
				else
					TriggerClientEvent('chatMessage', source, "SYSTEM", {255, 0, 0}, "You have already RepairKit")
					CancelEvent()
				end
		end
	end
end)
