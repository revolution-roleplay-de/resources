-- Script by DarkHaze1498 Revolution-Roleplay.de -- 


local Tunnel = module("vrp", "lib/Tunnel")
local Proxy = module("vrp")

vRP = Proxy.GetInterface("vRP")
vRPclient = Tunnel.GetInterface("vRP", "vRP_bank")


local banks = cfg.banks

local robbers = {}

function get3DDistance(x1, y1, z1, x2, y2, z2)
    return math.sqrt(math.pow(x1 - x2, 2) + math.pow(y1 - y2, 2) + math.pow(z1 - z2, 2))

end

RegisterServerEvent('es_bank:toofar')
AddEventHandler('es_bank:toofar', function(robb)
    if(robber[source])then
        TriggerClientEvent('es_bank:toofarlocal', source)
        robbers[source] = nil
        TriggerClientEvent('chatMessage', -1 'News', {255, 0, 0}, "Raubüberfall an: ^2" ..banks[robb].nameofbank.. "wurde Beendet!.")

    end



end)

RegisterServerEvent('es_bank:rob')
AddEventHandler('es_bank:rob', function(robb)
local user_id = vRP.GetUserId({source})
local player = vRP.GetUserSource({user_id})
local cops = vRP.GetUserPermission({cfg.permission})
of vRP.hasPermission({user_id,cfg.permission})then
    vRPclient.notify(player,{"~r~Du bist Polizist du darfst das nicht!."})
else
    if #cops >= cfg.cops then
        if banks[robb]then
            local bank = banks[robb]

            if (os.time() - bank.lastrobbed) < cfg.seconds+cfg.cooldown and bank.lastrobbed ~= 0 then
                TriggerClientEvent('chatMessage', player, 'ROBBERY', {255,0,0}, "Zieht ab, wir wurden erst Gerade Überfallen! Wartet noch:^2" ..(cfg.seconds+cfg.cooldown - (os.time() - bank.lastrobbed)) .."^0 Sekunden.")
                return
            end
            TriggerClientEvent('chatMessage', -1 'News', {255,0,0}, "Ein Raubüberfall ist im Gange bei:^2".. bank.nameofbank)
            TriggerClientEvent('chatMessage', player, 'SYSTEM', {255,0,0}, "Du den Überfall auf:^2" ..bank.nameofbank.. "^0Lauf nicht zu weit weg!.")
            TriggerClientEvent('chatMessage', player, 'SYSTEM', {255,0,0}, "Halte die Stellung für ^15 ^0 Minuten, dann noch Entkommen und es Gehört dir ;)")
            TriggerClientEvent('es_bank:currentlyrobbing', player, robb)
            banks[robbs].lastrobbed = os.time()
            robbers[player] = robb
            local savedSource = player
            SetTimeout(cfg.seconds*1000, function()
            if(robbers[savedSource])then
                if(user_id)then
                    vRP.giveInventoryItem({user_id,"dirty_money", bank.reward,true})
                    TriggerClientEvent('chatMessage', -1 'News', {255,0,0}, "Der Raubübefall am: ^2".. bank.nameofbank.. "^0 ist zu ende!."
                    TriggerClientEvent('es_bank:robberycomplete', savedSource, bank.reward)

                end

            end


                
        end)

    end 

eles
vRPclient.notify(player,{"~r~Nicht genug Polizisten Online!"})

end

end



end)


