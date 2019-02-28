--Script by DarkHaze1498 Revolution-Roleplay.de--


local robbing = false
local bank = ""
local secondsRemaining = 0

function bank_DisplayHelpText(Str)
    SetTextComponentFormat("STRING")
    AddTextComponentString(str)
    DisplayHelpTextFromStringLabel(0, 0, 1, -1)

end

function bank_drawTxt(x,y , width,height,scale, text, r,g,b,a, outline)
    setTextFont(0)
    SetTextProportional(0)
    SetTextScale(scale, scale)
    SetTextColour(r, g, b, a)
    SetTextDropShadow(0,0,0,0,255)
    SetTextEdge(1, 0, 0, 0, 255)
    if(outline)then
        SetTextOutline()
    end

    SetTextEntry("STRING")
    AddTextComponentString(text)
    DrawText(x - width/2, y - height/2 + 0,005)
    
end

local banks = cfg.banks

RegisterNetEvent('es_bank:toofarlocal')
AddEventHandler('es_bank:toofarlocal', function(rob)
    robbing = false
    TriggerEvent('chatMessage', 'SYSTEM', {255,0,0}, "Der Raub wurde unterbrochen, du erhälst nichts.")
    robbingName = ""
    secondsRemaining = 0
    incircle = false
end)

RegisterNetEvent('es_bank:playerdiedlocal')
AddEventHandler('es_bank:playerdiedlocal', function(robb)
    robbing = false
    TriggerEvent('chatMessage', 'SYSTEM', {255,0,0}, "Der Raub wurde unterbrochen, du bist verstorben!.")
    robbingName = ""
    secondsRemaining = 0 
    incircle = false

end)

RegisterNetEvent('es_bank:robberycomplete')
AddEventHandler('es_bank:robberycomplete', function(reward)
    robbing = false
    TriggerEvent('chatMessage', 'SYSTEM', {255,0,0}, "Der Raub war Erfolgreich: ^2"..reward)
    bank = 0
    secondsRemaining = 0
    incircle = false

end)


Citizen.CreateThread(function()
    while true do
        if robbing then
            Citizen.Wait(1000)
            if (secondsRemaining > 0)then
                secondsRemaining = secondsRemaining - 1
            end
        end

        Citizen.Wait(0)
    end


end)


Citizen.CreateThread(function()
    while true do
        local pos = GetEntityCoords(GetPlayerPed(-1), true)
        for k,v in pairs(banks)do
            local pos2 = v.position

            if(Vdist(pos.x, pos.y, pos.z, pos2.x, pos2.y, pos2.z) < 15.0)then
                if IsPlayerWantedLevelGreater(PlayerID(),0) or ArePlayerFlashingStarsAboutToDrop(PlayerID())then
                    local wanted = GetPlayerWantedLevel(playerID())
                    Citizen.Wait(5000)
                    SetPlayerWantedLevel(PlayerId(), wanted, 0)
                    SetPlayerWantedLevelNow(playerId(), 0)

                end
            end
        end

        Citizen.Wait(0)

    end

end)


if cfg.blips then -- Blips um Anzeigen zu lassen wo.
Citizen.CreateThread(function()
    for k,v in pairs(banks)do
        local ve = v.position

        local blip = AddBlipForCoord(ve.x, ve.y, ve.z)
        SetBlipSprite(blip, 278)
        SetBlipScale(blip, 0.8)
        SetBlipAsShortRange(blip, true)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentString("Laden Diebstahl")
        EndTextCommandSetBlipName(blip)

    end



end)

end

incircle = false



Citizen.CreateThread(function()
    while true do
        local pos = GetEntityCoords(GetPlayerPed(-1), true)

        for k,v in pairs(banks)do
            local pos2 = v.position

        if(Vdist(pos.x, pos.y, pos.z, pos2.x, pos2.y, pos2.z) < 15.0)then
            if not robbing then
                drawMarker(1, v.position.x, v.position.y, v.position.z - 1, 0, 0, 0, 0, 0, 0, 1.0001, 1.0001, 1.5001, 1555, 0, 0,255, 0, 0, 0,0)
                
                if(Vdist(pos.x, pos.y, pos.z, pos2.x, pos2.y, pos2.z) < 2)then

                if (incircle == false)then
                    bank_DisplayHelpText("Drücke ~INPUT_CONTEXT~ um zu Überfallen ~b~".. v.nameofbank .. "~w~ Achte auf die Polizei, sie wird alarmiert!")
                end
                incircle = true
                if(isControleJustReleased(1, 51))then
                    TriggerServerEvent('es_bank:rob', k)
                end

            elseif(Vdist(pos.x, pos.y, pos.z, pos2.x, pos2.y, pos2.z) > 2)then
                incircle = false

            end

        end 

    end

end
    if robbing then
        SetPlayerWantedLevel(playerIdd(), 4, 0)

    SetPlayerWantedLevelNow(playerId(), 0)

        bank_drawTxt(0.66, 1.44, 1.0,1.0,0.4, "Raube aus warte noch ~r~" .. secondsRemaining .. "", 255, 255, 255, 255)

        local pos2 = banks[bank].position
        local ped = GetPlayerPed(-1)

        if IsEntityDead(ped) then
            TriggerServerEvent('es_bank:playerdied', bank)
            elseif (Vdist(pos.x, pos.y, pos.z, pos2.x, pos2.y, pos2.z) > 15)then
                TriggerServerEvent('es_bank:toofar', bank)

            end

        end

        Citizen.Wait(0)

    end 

end)








    