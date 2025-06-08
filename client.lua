-- client.lua

RegisterCommand("engine", function()
    local ped = PlayerPedId()
    local vehicle = GetVehiclePedIsIn(ped, false)

    if vehicle ~= 0 and GetPedInVehicleSeat(vehicle, -1) == ped then
        local engineOn = GetIsVehicleEngineRunning(vehicle)

        SetVehicleEngineOn(vehicle, not engineOn, false, true)

        if engineOn then
            ShowNotification("~r~Engine turned off.")
        else
            ShowNotification("~g~Engine started.")
        end
    else
        ShowNotification("~y~You must be in the driver seat of a vehicle.")
    end
end, false)

function ShowNotification(text)
    BeginTextCommandThefeedPost("STRING")
    AddTextComponentSubstringPlayerName(text)
    EndTextCommandThefeedPostTicker(false, false)
end
