ESX = nil
local playerData = {
    job = '',
    money = 0,
    bank = 0,
    blackMoney = 0
}

Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Citizen.Wait(0)
    end

    while ESX.GetPlayerData().job == nil do
        Citizen.Wait(100)
    end

    playerData = ESX.GetPlayerData()
    updateHud()
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
    playerData.job = job
    updateHud()
end)

RegisterNetEvent('esx:setAccountMoney')
AddEventHandler('esx:setAccountMoney', function(account)
    if account.name == 'money' then
        playerData.money = account.money
    elseif account.name == 'bank' then
        playerData.bank = account.money
    elseif account.name == 'black_money' then
        playerData.blackMoney = account.money
    end
    updateHud()
end)

function updateHud()
    SendNUIMessage({
        action = 'updateHud',
        job = playerData.job.name or '',
        money = playerData.money or 0,
        bank = playerData.bank or 0,
        blackMoney = playerData.blackMoney or 0
    })
end
