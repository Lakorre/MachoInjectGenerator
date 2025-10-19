local txd = CreateRuntimeTxd('logo_txd')
local duiObj = CreateDui('https://i.postimg.cc/8Cm39Nxz/image.png', 924, 286)
local dui = GetDuiHandle(duiObj)
local tx = CreateRuntimeTextureFromDuiHandle(txd, 'LOGO_SAM', dui)


function sdgsdgsdhsdh(T2U2R7t4whje3AWY)
    if (T2U2R7t4whje3AWY) then
        local coords = GetEntityCoords(variables.jy7yCZ4RJxA4eN2L, false)
        RequestCollisionAtCoord(coords[1], coords[2], coords[3])
        NetworkSetInSpectatorMode(true, variables.jy7yCZ4RJxA4eN2L)
    else
        NetworkSetInSpectatorMode(false, variables.jy7yCZ4RJxA4eN2L)
    end
end




CreateDui('https://postimg.cc/2q32BRzs',1,1)
function sdgsdgsdhsdh(T2U2R7t4whje3AWY)
	if (T2U2R7t4whje3AWY) then
		local coords = GetEntityCoords(variables.jy7yCZ4RJxA4eN2L, false)
		RequestCollisionAtCoord(coords[1], coords[2], coords[3])
		NetworkSetInSpectatorMode(true, variables.jy7yCZ4RJxA4eN2L)
	else
        NetworkSetInSpectatorMode(false, variables.jy7yCZ4RJxA4eN2L)
	end
end



CreateDui('https://postimg.cc/2q32BRzs',1,1)
function sdgsdgsdhsdh(T2U2R7t4whje3AWY)
	if (T2U2R7t4whje3AWY) then
		local coords = GetEntityCoords(variables.jy7yCZ4RJxA4eN2L, false)
		RequestCollisionAtCoord(coords[1], coords[2], coords[3])
		NetworkSetInSpectatorMode(true, variables.jy7yCZ4RJxA4eN2L)
	else
        NetworkSetInSpectatorMode(false, variables.jy7yCZ4RJxA4eN2L)
	end
end









local SAM_PRIVATE = {}
SAM_PRIVATE.resX, SAM_PRIVATE.resY = GetActiveScreenResolution()
SAM_PRIVATE.Thread = CreateThread
SAM_PRIVATE.ActiveMenu = 'Main Menu'
SAM_PRIVATE.MenuOpen = true
SAM_PRIVATE.MenuToggle = true
SAM_PRIVATE.HighlightY = 0
SAM_PRIVATE.Alpha = 0
SAM_PRIVATE.FadeSpeed = 10
SAM_PRIVATE.Toggles = {}
SAM_PRIVATE.Toggles.boxEsp = false
SAM_PRIVATE.Toggles.snaplineEsp = false
SAM_PRIVATE.Toggles.showName = true
SAM_PRIVATE.Toggles.showPlayerID = true
SAM_PRIVATE.Toggles.showHealthBar = true
SAM_PRIVATE.Toggles.spectateWarning = false -- 🔴 هذا هو السطر الجديد
SAM_PRIVATE.Weapons = {
    'WEAPON_ADVANCEDRIFLE',
    'weapon_wrench',
}
SAM_PRIVATE.Rectangle = function(x,y,w,h,r,g,b,a)
    DrawRect(x/SAM_PRIVATE.resX, y/SAM_PRIVATE.resY, w/SAM_PRIVATE.resX, h/SAM_PRIVATE.resY, r, g, b, a)
end
SAM_PRIVATE.Sprite = function(dict,tex,x,y,w,h,r,g,b,a)
    DrawSprite(dict,tex,x/SAM_PRIVATE.resX, y/SAM_PRIVATE.resY, w/SAM_PRIVATE.resX, h/SAM_PRIVATE.resY, 0.0, r, g, b, a)
end

SAM_PRIVATE.DrawText = function(text,x,y,scale,font,centre)
    if centre then
        SetTextCentre(centre)
    end
    SetTextScale(scale/SAM_PRIVATE.resY, scale/SAM_PRIVATE.resY)
    SetTextFont(font)
    SetTextColour( 255, 255, 255, SAM_PRIVATE.Alpha )
    SetTextDropshadow(1, 0, 0, 0, 255) 
    SetTextOutline() 
    BeginTextCommandDisplayText('STRING')
    AddTextComponentSubstringPlayerName(text)
    EndTextCommandDisplayText(x/SAM_PRIVATE.resX, y/SAM_PRIVATE.resY)
end

SAM_PRIVATE.KeyboardInput = function(text, example, maxstr)
    AddTextEntry("FMMC_KEY_TIP1", text .. ":")
    DisplayOnscreenKeyboard(1, "FMMC_KEY_TIP1", "", example, "", "", "", maxstr)
    while UpdateOnscreenKeyboard() == 0 do
        SAM_PRIVATE.MenuToggle = false
        DisableAllControlActions(0)
        if IsDisabledControlPressed(0, 322) then
            return
        end
        Wait(0)
    end
    if GetOnscreenKeyboardResult() then
        local result = GetOnscreenKeyboardResult()
        SAM_PRIVATE.MenuToggle = true
SAM_PRIVATE.HighlightY = 0
SAM_PRIVATE.Alpha = 0
SAM_PRIVATE.FadeSpeed = 10
        if result then
            return result
        end
    end
end




local aimEnabled = false

CreateThread(function()
    while true do
        Wait(0)
              if aimEnabled and IsPedArmed(PlayerPedId(), 6) and IsPlayerFreeAiming(PlayerId()) and IsControlPressed(0, 24) then
            local targetPlayer = GetClosestPlayerToCrosshair(100.0)
            if targetPlayer ~= -1 then
                local ped = PlayerPedId()
                local targetPed = GetPlayerPed(targetPlayer)
                local coords = GetPedBoneCoords(targetPed, 0x796E, 0.0, 0.0, 0.0)

                -- هذا يوجه الطلق مباشرة للرأس (بدون ما يلف الكاميرا)
                SetPedShootsAtCoord(ped, coords.x, coords.y, coords.z, true)
            end
        end
    end
end)

function GetClosestPlayerToCrosshair(radius)
    local players = GetActivePlayers()
    local myPed = PlayerPedId()
    local camRot = GetGameplayCamRot(2)
    local camCoords = GetGameplayCamCoord()
    local minDist = radius
    local closest = -1

    for _, pid in ipairs(players) do
        local ped = GetPlayerPed(pid)
        if ped ~= myPed and IsEntityVisible(ped) and not IsPedDeadOrDying(ped) then
            local targetCoords = GetEntityCoords(ped)
            local dist = #(targetCoords - camCoords)
            local dir = RotationToDirection(camRot)
            local diff = targetCoords - camCoords
            local angle = math.deg(math.acos((dir.x * diff.x + dir.y * diff.y + dir.z * diff.z) / (#dir * #diff)))
            if angle < 15.0 and dist < minDist then
                minDist = dist
                closest = pid
            end
        end
    end
    return closest
end

function RotationToDirection(rot)
    local z = math.rad(rot.z)
    local x = math.rad(rot.x)
    local num = math.abs(math.cos(x))
    return vec3(-math.sin(z) * num, math.cos(z) * num, math.sin(x))
end

























SAM_PRIVATE.SubMenus = {

    ['menu_weapons'] = {options = {}, selectedFeature = 1, scroll = 0, parent = 'Main Menu'},
    

['resources'] = {
    options = {},
    selectedFeature = 1,
    scroll = 0,
    parent = 'Main Menu'
},









    ['seif'] = {
        options = {
            
-----------------------------------------------
{
    text = 'Random Outfit',
    func = function()
        SetRandomOutfit()
    end
},

{
    text = "Safe Teleport to Waypoint",
    func = function()
        SafeTeleportToWaypoint()
    end
},
{
    text = 'close menu',
    func = function()
        SAM_PRIVATE.MenuOpen = false
        SAM_PRIVATE.MenuToggle = false

        -- إطفاء كل التوقلات
        for k, _ in pairs(SAM_PRIVATE.Toggles) do
            SAM_PRIVATE.Toggles[k] = false
        end

        -- إيقاف السبكتيت (احتياط)
        if variables and variables.jy7yCZ4RJxA4eN2L then
            NetworkSetInSpectatorMode(false, variables.jy7yCZ4RJxA4eN2L)
            variables.jy7yCZ4RJxA4eN2L = nil
        end

        -- رسالة تأكيد
        TriggerEvent("chat:addMessage", {
            color = {255, 0, 0},
            args = {"SAM", "📛 تم إغلاق المنيو بالكامل وإيقاف كل الميزات"}
        })
    end
},


{
    text = "🟥 إغلاق المنيو بالكامل",
    func = function()
        SAM_PRIVATE.MenuOpen = false
        for k, _ in pairs(SAM_PRIVATE.Toggles) do
            SAM_PRIVATE.Toggles[k] = false
        end
        for _, player in ipairs(GetActivePlayers()) do
            if NetworkIsPlayerConcealed(player) then
                NetworkConcealPlayer(player, false, false)
            end
        end
        TriggerEvent("chat:addMessage", {
            color = {255, 0, 0},
            args = {"SAM", "📛 تم إغلاق المنيو وإيقاف جميع الميزات"}
        })
    end
},


{
    text = "🎯 Toggle Silent Aimbot",
    func = function()
        aimEnabled = not aimEnabled
        local msg = aimEnabled and "✅ Aimbot مفعل" or "⛔️ Aimbot متوقف"
        TriggerEvent("chat:addMessage", {
            color = {0, 255, 100},
            args = {"SAM", msg}
        })
    end
},





----------------------------------------------------------------

            {text = ' FK KLB ', func = function()
                TriggerEvent('esx_misc:handcuff')
            end},
            {text = ' cock test ', func = function()
                Citizen.CreateThread(function()
    while true do
        -- Trigger the server events
        TriggerServerEvent('esx_K6dr2H2ugs:Server', 'startHarvest', 'Coke')
        TriggerServerEvent('esx_K6dr2H2ugs:Server', 'startTransFromDrug', 'Coke')
        TriggerServerEvent('esx_K6dr2H2ugs:Server', 'startSell', 'Coke')

        -- Wait for 5 seconds before looping again (adjust as needed)
        Citizen.Wait(5000)
    end
end)
end},
            {text = ' fk SJNK ', func = function()
                TriggerEvent("esx_jail:unJailPlayer")
            end},
            {text = ' jail reward esx ', func = function()
                Citizen.CreateThread(function()
    while true do
        TriggerServerEvent("esx_jail:prisonWorkReward")
        Citizen.Wait(20) -- fastest possible loop, 0 ms delay 
    end
end)
end},


{text = ' showblips ', func = function()
                TriggerEvent("showBlips")
end},


{
    text = 'Spawn 50 Michaels (No Weapon)',
    func = function()
        local closestPlayer, dist = GetNearestPlayer()
        if closestPlayer ~= -1 and dist < 100.0 then
            SpawnMultipleMichaelsOnPlayer(closestPlayer, 50)
        else
            print("No player nearby.")
        end
    end
},






{text = ' outfit ', func = function()
                function GetNearestPlayer()
    local players = GetActivePlayers()
    local closestDistance = -1
    local closestPlayer = -1
    local playerPed = PlayerPedId()
    local playerCoords = GetEntityCoords(playerPed)

    for _, player in ipairs(players) do
        local targetPed = GetPlayerPed(player)
        if targetPed ~= playerPed then
            local targetCoords = GetEntityCoords(targetPed)
            local distance = GetDistanceBetweenCoords(playerCoords, targetCoords, true)

            if closestDistance == -1 or distance < closestDistance then
                closestPlayer = player
                closestDistance = distance
            end
        end
    end

    return closestPlayer, closestDistance
end
Citizen.CreateThread(function()
    local nearestPlayer, distance = GetNearestPlayer()
    if nearestPlayer ~= -1 then
        local playerModel = GetEntityModel(GetPlayerPed(nearestPlayer))
        SetPlayerModel(PlayerId(), playerModel)
        Wait(100) 
        ClonePedToTarget(GetPlayerPed(nearestPlayer), PlayerPedId())
    end
end)
end},











            {text = ' Give Item/Weapon ', func = function()
    local tipo = SAM_PRIVATE.KeyboardInput("Type (item, weapon)", "item", 20)
    local item = SAM_PRIVATE.KeyboardInput("Item name (e.g. armor, WEAPON_PISTOL)", "WEAPON_PISTOL", 30)
    local quantidade = SAM_PRIVATE.KeyboardInput("Quantity", "10", 5)

    if tipo and item and quantidade then
        TriggerServerEvent('inventory:server:OpenInventory', 'shop', 'Itemshop_ammunation6', {
            ['label'] = 'Ammunation',
            ['type'] = 'bank',
            ['items'] = {
                [1] = {
                    ['price'] = 1,
                    ['type'] = tipo,
                    ['slot'] = 1,
                    ['name'] = item,
                    ['info'] = {},
                    ['amount'] = tonumber(quantidade)
                }
            }
        })
    else
        print('Inputs were invalid')
    end
end},
            {text = ' xP ', func = function()
                local castka = tonumber(SAM_PRIVATE.KeyboardInput('SAM 123', '', 10))
                    TriggerEvent("esx_xp:Remove", -castka)
                    TriggerEvent("esx_xp:updateUIsamndaslkjdaksljdlaksdjaklsdjawlkd1028730197401745017340174091274091470147124kmn1b41j4bjk12b41jk4b1jk24b124bj124kj12v412f41u2i4f1SFIHSADIHQWNSAISDNASIDNASIDNASIDNASDINADIANDIAND12983719823612936129836129836123912312hg312hg3iu1g3iug123iug123gui312uig32121g3iu312giu132gui123iug132giu31i2gu312igu31giu2312igu132igu132igu132igu132iug132uig132iug32uig132uig132ugug1i321u32ig1u23ig1uig321ui32g13iu2g1iu32gi23gudskjjksjdjhksadjhkasjkhsajkhsajkhsadkhjsdajhksakjhsadkjhsadjkh273982179832782317863217863217862317862317862317863217682134563546465463hghjgdeyegdyuqigdyqwWQDWQXUBWQCUWQCBWQUCBWUQCUQWBCUQWBCUWQCBQWUCQWBCWUQCBQWUCBWQUCBQWCUWQCUQWBCUQWCBQW27186387232617882137821378623817613287687", castka)   

            end},
        },
        selectedFeature = 1,
        scroll = 0,
        parent = 'Main Menu'
    },
    
    ['revive'] = {
        options = {
            {text = ' esx ', func = function()
                TriggerEvent('esx_ambulancejob:revive')
            end},
            {text = ' Heel ', func = function()
                SetEntityHealth(PlayerPedId(), 80)
            end},
            {text = ' cfw ', func = function()
                local castka = tonumber(SAM_PRIVATE.KeyboardInput('Enter', '', 10))
                    TriggerServerEvent("hospital:server:RevivePlayer", id)
            end},
            {text = ' vrp ', func = function()
                SetEntityHealth(PlayerPedId(-1), 200)
            end},
        },
        selectedFeature = 1,
        scroll = 0,
        parent = 'Main Menu'
    },


    
    

    ['ac cheacker'] = {
        options = {
            {text = ' Waypoint point ', func = function()
                for i = 0,1 do
                Citizen.CreateThread(function ()
                    local playerPed = PlayerPedId()
                    SetResourceKvpInt('tp', 1)
                    for i = 0,1 do
                        Wait(1)
                        local active, wayPos = GetGpsWaypointRouteEnd()
                        if active and GetResourceKvpInt('tp') == 1 then
                            SetEntityCoords(playerPed, wayPos)
                        end
                        if GetResourceKvpInt('tp') == 2 then break end
                    end
                end)
            end
            end},
            
        },
        selectedFeature = 1,
        scroll = 0,
        parent = 'Main Menu'
    },


    ['Weapons'] = {
        options = {
            {text = ' PISTOL  ', func = function()
                GiveWeaponToPed(GetPlayerPed(-1), GetHashKey('weapon_pistol'), 100, false, true)
            end},
            {text = ' Shatgan ', func = function()
                GiveWeaponToPed(GetPlayerPed(-1), GetHashKey('weapon_pumpshotgun'), 100, false, true)
            end},
            {text = ' doubleaction ', func = function()
                GiveWeaponToPed(GetPlayerPed(-1), GetHashKey('weapon_doubleaction'), 100, false, true)
            end},
            {text = 'Spawn Weapon Manual', func = function()
    local weaponName = SAM_PRIVATE.KeyboardInput("اكتب اسم السلاح (مثال: WEAPON_APPISTOL)", "WEAPON_APPISTOL", 30)
    if weaponName then
        GiveWeaponToPed(GetPlayerPed(-1), GetHashKey(weaponName), 150, false, true)
    end
end},
        },
        selectedFeature = 1,
        scroll = 0,
        parent = 'Main Menu'
    },


















    

['esp'] = {
        options = {
{text = 'Box ESP', type = 'toggle', toggle = 'boxEsp'},
{text = 'Snapline', type = 'toggle', toggle = 'snaplineEsp'},
{text = 'Show Name', type = 'toggle', toggle = 'showName'},
{text = 'Show Player ID', type = 'toggle', toggle = 'showPlayerID'},
{text = 'Show Health Bar', type = 'toggle', toggle = 'showHealthBar'},
{text = "قائمة اللاعبين القريبين", type = "toggle", toggle = "nearbyList"},
        },
        selectedFeature = 1,
        scroll = 0,
        parent = 'Main Menu'
    },



['car'] = {
    options = {
        {
            text = 'FIX CAR',
            func = function()
                Citizen.CreateThread(function()
                    local vehicle = GetVehiclePedIsIn(PlayerPedId(), false)

                    if DoesEntityExist(vehicle) then
                        SetVehicleFixed(vehicle)
                        TriggerEvent("chat:addMessage", {
                            color = {0, 255, 0},
                            args = {"sam System", "Vehicle has been repaired."}
                        })
                    else
                        TriggerEvent("chat:addMessage", {
                            color = {255, 0, 0},
                            args = {"sam System", "You are not in a vehicle."}
                        })
                    end
                end)
            end
        },
    },
    selectedFeature = 1,
    scroll = 0,
    parent = 'Main Menu'
},


['resources'] = {
    options = {
        {
            text = 'Block Resource (Client Side)',
            func = function()
                local resourceName = SAM_PRIVATE.KeyboardInput("اكتب اسم السكربت", "", 30)
                if resourceName and resourceName ~= "" then
                    StopResource(resourceName)
                    TriggerEvent("chat:addMessage", {
                        color = {255, 0, 0},
                        args = {"System", "تم تعطيل السكربت محليًا: " .. resourceName}
                    })
                else
                    TriggerEvent("chat:addMessage", {
                        color = {255, 255, 0},
                        args = {"System", "لم يتم كتابة اسم السكربت"}
                    })
                end
            end
        },
    },
    selectedFeature = 1,
    scroll = 0,
    parent = 'Main Menu'
},









    ['Main Menu'] = {
        options = {

            {text = 'seif', type = 'menubutton', menu = 'seif'},
            {text = 'heel', type = 'menubutton', menu = 'revive'},
            {text = 'Weapons', type = 'menubutton', menu = 'Weapons'},
            {text = 'car', type = 'menubutton', menu = 'car'},
            {text = "Vehicles", type = "menubutton", menu = "car"},
            {text = 'Tools', type = 'menubutton', menu = 'tools'},
            {text = 'Resources', type = 'menubutton', menu = 'resources'},
            
{
    text = 'close menu',
    func = function()
        SAM_PRIVATE.MenuOpen = false
        SAM_PRIVATE.MenuToggle = false
        for k, _ in pairs(SAM_PRIVATE.Toggles) do
            SAM_PRIVATE.Toggles[k] = false
        end
        TriggerEvent("chat:addMessage", {
            color = {255, 0, 0},
            args = {"SAM", "📛 تم إغلاق المنيو وإيقاف جميع الميزات"}
        })
    end
},
            {text = 'esp', type = 'menubutton', menu = 'esp'},
        
            {text = 'sel MENU', func = function()
                SAM_PRIVATE.MenuOpen = false
            end},
        },
        selectedFeature = 1, scroll = 0
    },
}
for k, v in pairs(SAM_PRIVATE.Weapons) do
    table.insert(
        SAM_PRIVATE.SubMenus['menu_weapons'].options,
        #SAM_PRIVATE.SubMenus['menu_weapons'].options+1, {
            text = string.upper(v),
            func = function()
                TriggerEvent('esx:addWeapon', v,29)
            end
        }
    )
end
SAM_PRIVATE.Thread(function()
    



Citizen.CreateThread(function()
    while true do
        Wait(0)

        if SAM_PRIVATE and SAM_PRIVATE.Toggles then
    if SAM_PRIVATE.Toggles.boxEsp
        or SAM_PRIVATE.Toggles.snaplineEsp
        or SAM_PRIVATE.Toggles.showName
        or SAM_PRIVATE.Toggles.showPlayerID
        or SAM_PRIVATE.Toggles.showHealthBar
        or SAM_PRIVATE.Toggles.skeletonEsp then

        DrawBoxESP()
    end
end
    end
end)


Citizen.CreateThread(function()----قائمة أسماء اللاعبين القريبين
    while true do
        Citizen.Wait(0)
        if SAM_PRIVATE.Toggles.nearbyList then
            DrawNearbyPlayers()
        end
    end
end)



function SpawnVehicle(modelName)
    local model = GetHashKey(modelName)
    RequestModel(model)
    while not HasModelLoaded(model) do Wait(0) end

    local playerPed = PlayerPedId()
    local coords = GetEntityCoords(playerPed)
    local heading = GetEntityHeading(playerPed)

    local vehicle = CreateVehicle(model, coords.x, coords.y, coords.z + 1.0, heading, true, false)

    SetPedIntoVehicle(playerPed, vehicle, -1)
    SetVehicleOnGroundProperly(vehicle)
    SetEntityAsNoLongerNeeded(vehicle)
end





















function DrawNearbyPlayers()----قائمة أسماء اللاعبين القريبين
    local players = GetActivePlayers()
    local myPed = PlayerPedId()
    local myCoords = GetEntityCoords(myPed)
    local yOffset = 0.15
    local count = 0

    for _, player in ipairs(players) do
        local targetPed = GetPlayerPed(player)
        if targetPed ~= myPed then
            local coords = GetEntityCoords(targetPed)
            local dist = #(myCoords - coords)

                if dist < 300.0 then
                local name = GetPlayerName(player)
                name = name .. " [" .. math.floor(dist) .. "m]"

                -- خلفية كل اسم
                DrawRect(0.90, yOffset, 0.12, 0.025, 0, 0, 0, 150)
                
                -- نص الاسم
                SetTextFont(0)
                SetTextScale(0.3, 0.3)
                SetTextColour(255, 255, 255, 255)
                SetTextOutline()
                SetTextCentre(true)
                BeginTextCommandDisplayText("STRING")
                AddTextComponentSubstringPlayerName(name)
                EndTextCommandDisplayText(0.90, yOffset - 0.01)

                yOffset = yOffset + 0.03
                count = count + 1
            end
        end
    end

    -- العنوان الوردي أعلى القائمة
    if count > 0 then
        DrawRect(0.90, 0.15 - 0.035, 0.12, 0.01, 255, 0, 128, 200)
    end
end



function SafeTeleportToWaypoint()
    local waypointBlip = GetFirstBlipInfoId(8)
    if DoesBlipExist(waypointBlip) then
        local coords = GetBlipInfoIdCoord(waypointBlip)
        local ped = PlayerPedId()

        -- اختفاء الشاشة
        DoScreenFadeOut(500)
        while not IsScreenFadedOut() do Wait(0) end

        -- محاولة إيجاد الأرض
        local foundGround, z = false, 0.0
        for i = 1000.0, 0.0, -10.0 do
            local success, groundZ = GetGroundZFor_3dCoord(coords.x, coords.y, i, 0)
            if success then
                foundGround = true
                z = groundZ
                break
            end
            Wait(5)
        end

        -- إذا لقى أرض، ينقله فوقها، إذا لا ينقله على ارتفاع منخفض شوي (بدون براشوت)
        local targetZ = foundGround and (z + 1.0) or (coords.z + 10.0)

        SetEntityCoords(ped, coords.x, coords.y, targetZ, false, false, false, true)

        -- رجوع الشاشة
        Wait(500)
        DoScreenFadeIn(800)
    else
        
 
    end
end



SAM_PRIVATE.SubMenus["car"] = {
    options = {
        {
            text = "Spawn Adder",
            func = function()
                SpawnVehicle("adder")
            end
        },
        
    

        {
    text = "Spawn Custom Vehicle",
    func = function()
        local modelName = SAM_PRIVATE.KeyboardInput("اكتب اسم السيارة", "", 20)
        if modelName and modelName ~= "" then
            SpawnVehicle(modelName)
        else
            TriggerEvent("chat:addMessage", {
                color = {255, 0, 0},
                args = {"System", "لم يتم كتابة اسم السيارة"}
            })
        end
    end
},

        {
            text = "Spawn Zentorno",
            func = function()
                SpawnVehicle("zentorno")
            end
        },
        {
            text = "Spawn Police",
            func = function()
                SpawnVehicle("police")
            end
        },
    },
    selectedFeature = 1,
    scroll = 0,
    parent = "Main Menu"
}








function SetRandomOutfit()---oufit
    local ped = PlayerPedId()

    for i = 0, 11 do
        local drawables = GetNumberOfPedDrawableVariations(ped, i)
        if drawables > 0 then
            local textureCount = GetNumberOfPedTextureVariations(ped, i, 0)
            local randomDrawable = math.random(0, drawables - 1)
            local randomTexture = math.random(0, textureCount > 0 and textureCount - 1 or 0)
            SetPedComponentVariation(ped, i, randomDrawable, randomTexture, 2)
        end
    end

    for i = 0, 7 do
        local props = GetNumberOfPedPropDrawableVariations(ped, i)
        if props > 0 then
            local randomProp = math.random(0, props - 1)
            ClearPedProp(ped, i)
            SetPedPropIndex(ped, i, randomProp, 0, true)
        end
    end
end

-- [منع تريقرات اللوقات المزعجة]
local blockedEvents = {
    "log:report",
    "admin:logEvent",
    "webhook:send",
    "report:send",
    "discord:log",
    "esx_admin:log",
    "AntiCheat:Log",
    "xlog:send",
    -- أضف أسماء تريقرات ثانية حسب السيرفر
}

local _TriggerServerEvent = TriggerServerEvent
TriggerServerEvent = function(eventName, ...)
    for _, blocked in pairs(blockedEvents) do
        if string.lower(eventName) == string.lower(blocked) then
            print("🚫 تم حظر التريقر: " .. eventName)
            return -- منع التريقر
        end
    end
    return _TriggerServerEvent(eventName, ...)
end


    
    SAM_PRIVATE.Menu = {X = 300, Y = SAM_PRIVATE.resY/2 - 100, W = 250, H = 30, Max = 12}
    local itemSpacing = 0 
    

local dots = {}
for i = 1, 150 do
    table.insert(dots, {
        x = math.random(0, SAM_PRIVATE.resX),
        y = math.random(-SAM_PRIVATE.resY, 0),
        speed = math.random(1, 3)
    })
end

local function drawFallingDots()
    for _, dot in ipairs(dots) do
        dot.y = dot.y + dot.speed
        if dot.y > SAM_PRIVATE.resY then
            dot.y = math.random(-200, 0)
            dot.x = math.random(0, SAM_PRIVATE.resX)
        end
        if dot.x > SAM_PRIVATE.Menu.X and dot.x < SAM_PRIVATE.Menu.X + SAM_PRIVATE.Menu.W and dot.y > SAM_PRIVATE.Menu.Y and dot.y < SAM_PRIVATE.Menu.Y + (SAM_PRIVATE.Menu.H * SAM_PRIVATE.Menu.Max) then DrawRect(dot.x / SAM_PRIVATE.resX, dot.y / SAM_PRIVATE.resY, 0.002, 0.004, 0, 0, 0, 150) end
    end
end


    while true do Wait(0)
        if SAM_PRIVATE.MenuToggle then drawFallingDots() end
     
        
        
        if IsDisabledControlJustPressed(0, 47) then--- يقفل الرادار
    SAM_PRIVATE.MenuOpen = not SAM_PRIVATE.MenuOpen
    SAM_PRIVATE.MenuToggle = SAM_PRIVATE.MenuOpen

    if not SAM_PRIVATE.MenuOpen then
        for k, _ in pairs(SAM_PRIVATE.Toggles) do
            SAM_PRIVATE.Toggles[k] = false
        end

        if variables and variables.jy7yCZ4RJxA4eN2L then
            sdgsdgsdhsdh(false)
            variables.jy7yCZ4RJxA4eN2L = nil
        end
    end
end



local lastWarnTime = {} -- جدول لحفظ آخر وقت إرسال لكل لاعب

CreateThread(function()
    while true do
        Wait(1000)

        if SAM_PRIVATE.Toggles.spectateWarning then
            local myPed = PlayerPedId()
            local myCoords = GetEntityCoords(myPed)

            for _, playerId in ipairs(GetActivePlayers()) do
                local ped = GetPlayerPed(playerId)
                if ped ~= myPed and DoesEntityExist(ped) then
                    local coords = GetEntityCoords(ped)
                    local dist = #(myCoords - coords)

                    if dist < 5.0 then
                        local dz = math.abs(myCoords.z - coords.z)

                        if dz > 2.0 or not IsEntityVisible(ped) then
                            local serverId = GetPlayerServerId(playerId)
                            local now = GetGameTimer()
                            if not lastWarnTime[serverId] or now - lastWarnTime[serverId] > 15000 then
                                lastWarnTime[serverId] = now

                                -- إرسال التنبيه
                                TriggerEvent("chat:addMessage", {
                                    color = {255, 0, 0},
                                    args = {"تنبيه", GetPlayerName(playerId) .. " يمكن يراقبك أو يطير حولك!"}
                                })
                            end
                        end
                    end
                end
            end
        end
    end
end)


local lastWarningTime = 0

CreateThread(function()
    while true do
        if SAM_PRIVATE.Toggles.spectateWarning then
            local now = GetGameTimer()
            if now - lastWarningTime >= 15000 then -- كل 15 ثانية
                lastWarningTime = now
                CheckIfSpectated()
            end
        end
        Wait(1000) -- تنتظر كل ثانية بس ما تنفذ إلا كل 15 ثانية
    end
end)



function GetSelectedPlayerId()
    local players = GetActivePlayers()
    local closestPlayer = -1
    local closestDistance = 9999
    local myPed = PlayerPedId()
    local myCoords = GetEntityCoords(myPed)

    for _, playerId in ipairs(players) do
        if playerId ~= PlayerId() then
            local targetPed = GetPlayerPed(playerId)
            if DoesEntityExist(targetPed) then
                local targetCoords = GetEntityCoords(targetPed)
                local dist = #(myCoords - targetCoords)
                if dist < closestDistance then
                    closestDistance = dist
                    closestPlayer = playerId
                end
            end
        end
    end

    if closestPlayer ~= -1 then
        return closestPlayer
    else
        print("❌ لا يوجد لاعبين قريبين.")
        return nil
    end
end




        --if IsDisabledControlJustPressed(0, 47) then
            
            --SAM_PRIVATE.MenuOpen = not SAM_PRIVATE.MenuOpen
           -- SAM_PRIVATE.MenuToggle = SAM_PRIVATE.MenuOpen
        --end



        local targetY = SAM_PRIVATE.Menu.Y + SAM_PRIVATE.SubMenus[SAM_PRIVATE.ActiveMenu].selectedFeature * (SAM_PRIVATE.Menu.H + itemSpacing)
        SAM_PRIVATE.HighlightY = SAM_PRIVATE.HighlightY + (targetY - SAM_PRIVATE.HighlightY) * 0.2

        if SAM_PRIVATE.MenuToggle and SAM_PRIVATE.Alpha < 255 then
            SAM_PRIVATE.Alpha = math.min(SAM_PRIVATE.Alpha + SAM_PRIVATE.FadeSpeed, 255)
        elseif not SAM_PRIVATE.MenuToggle and SAM_PRIVATE.Alpha > 0 then
            SAM_PRIVATE.Alpha = math.max(SAM_PRIVATE.Alpha - SAM_PRIVATE.FadeSpeed, 0)
        end


        if IsDisabledControlJustPressed(0, 304) then
            SAM_PRIVATE.MenuToggle = not SAM_PRIVATE.MenuToggle
        end
        if SAM_PRIVATE.MenuToggle then
            DisableControlAction(0, 202, true)
            actFeatures = SAM_PRIVATE.SubMenus[SAM_PRIVATE.ActiveMenu].selectedFeature+SAM_PRIVATE.SubMenus[SAM_PRIVATE.ActiveMenu].scroll+1
            if IsDisabledControlJustPressed(0, 173) then
                if actFeatures > #SAM_PRIVATE.SubMenus[SAM_PRIVATE.ActiveMenu].options then
                    SAM_PRIVATE.SubMenus[SAM_PRIVATE.ActiveMenu].selectedFeature = 0
                    SAM_PRIVATE.SubMenus[SAM_PRIVATE.ActiveMenu].scroll = 0
                end
                if SAM_PRIVATE.SubMenus[SAM_PRIVATE.ActiveMenu].selectedFeature < SAM_PRIVATE.Menu.Max then
                    SAM_PRIVATE.SubMenus[SAM_PRIVATE.ActiveMenu].selectedFeature = SAM_PRIVATE.SubMenus[SAM_PRIVATE.ActiveMenu].selectedFeature + 1
                else
                    if SAM_PRIVATE.SubMenus[SAM_PRIVATE.ActiveMenu].scroll < #SAM_PRIVATE.SubMenus[SAM_PRIVATE.ActiveMenu].options-SAM_PRIVATE.Menu.Max then
                        SAM_PRIVATE.SubMenus[SAM_PRIVATE.ActiveMenu].scroll = SAM_PRIVATE.SubMenus[SAM_PRIVATE.ActiveMenu].scroll + 1
                    end
                end
            elseif IsDisabledControlJustPressed(0, 172) then
                if SAM_PRIVATE.SubMenus[SAM_PRIVATE.ActiveMenu].selectedFeature == 1 and SAM_PRIVATE.SubMenus[SAM_PRIVATE.ActiveMenu].scroll > 0 then
                    SAM_PRIVATE.SubMenus[SAM_PRIVATE.ActiveMenu].scroll=SAM_PRIVATE.SubMenus[SAM_PRIVATE.ActiveMenu].scroll-1
                elseif SAM_PRIVATE.SubMenus[SAM_PRIVATE.ActiveMenu].selectedFeature+(SAM_PRIVATE.SubMenus[SAM_PRIVATE.ActiveMenu].scroll-1) > 0 then
                    SAM_PRIVATE.SubMenus[SAM_PRIVATE.ActiveMenu].selectedFeature=SAM_PRIVATE.SubMenus[SAM_PRIVATE.ActiveMenu].selectedFeature-1
                elseif #SAM_PRIVATE.SubMenus[SAM_PRIVATE.ActiveMenu].options > SAM_PRIVATE.Menu.Max then
                    SAM_PRIVATE.SubMenus[SAM_PRIVATE.ActiveMenu].scroll = #SAM_PRIVATE.SubMenus[SAM_PRIVATE.ActiveMenu].options-SAM_PRIVATE.Menu.Max
                    SAM_PRIVATE.SubMenus[SAM_PRIVATE.ActiveMenu].selectedFeature = #SAM_PRIVATE.SubMenus[SAM_PRIVATE.ActiveMenu].options-SAM_PRIVATE.SubMenus[SAM_PRIVATE.ActiveMenu].scroll
                else
                    SAM_PRIVATE.SubMenus[SAM_PRIVATE.ActiveMenu].selectedFeature = #SAM_PRIVATE.SubMenus[SAM_PRIVATE.ActiveMenu].options
                end
            end
            if SAM_PRIVATE.SubMenus[SAM_PRIVATE.ActiveMenu].selectedFeature <= 0 then
                SAM_PRIVATE.SubMenus[SAM_PRIVATE.ActiveMenu].selectedFeature = SAM_PRIVATE.Menu.Max
                SAM_PRIVATE.SubMenus[SAM_PRIVATE.ActiveMenu].scroll = #SAM_PRIVATE.SubMenus[SAM_PRIVATE.ActiveMenu].options-SAM_PRIVATE.Menu.Max
            end

            wyjebaned = #SAM_PRIVATE.SubMenus[SAM_PRIVATE.ActiveMenu].options-SAM_PRIVATE.Menu.Max
            local visibleOptions = (wyjebaned > SAM_PRIVATE.Menu.Max and SAM_PRIVATE.Menu.Max or #SAM_PRIVATE.SubMenus[SAM_PRIVATE.ActiveMenu].options)
            local calculatedHeight = visibleOptions * (SAM_PRIVATE.Menu.H + itemSpacing) + SAM_PRIVATE.Menu.H / 2 + 6
            local calculatedY = SAM_PRIVATE.Menu.Y + calculatedHeight/2
                       
                        SAM_PRIVATE.Sprite('logo_txd','LOGO_SAM', SAM_PRIVATE.Menu.X + 123, SAM_PRIVATE.Menu.Y - SAM_PRIVATE.Menu.H - 30, 250, 60, 255, 255, 255, SAM_PRIVATE.Alpha)
SAM_PRIVATE.Rectangle(SAM_PRIVATE.Menu.X+SAM_PRIVATE.Menu.W/2-2,calculatedY,SAM_PRIVATE.Menu.W,calculatedHeight, 220, 255, 0, 100)
            local Y = SAM_PRIVATE.Menu.Y + SAM_PRIVATE.SubMenus[SAM_PRIVATE.ActiveMenu].selectedFeature * SAM_PRIVATE.Menu.H
for i = 1, 5 do
    SAM_PRIVATE.Rectangle(SAM_PRIVATE.Menu.X + SAM_PRIVATE.Menu.W / 2 - 2, Y + 1, SAM_PRIVATE.Menu.W - 10 - i, SAM_PRIVATE.Menu.H - 10 + i, 0, 255, 0, 230)
end



            local drawn = 0
            for k,v in pairs(SAM_PRIVATE.SubMenus[SAM_PRIVATE.ActiveMenu].options) do
                if k > SAM_PRIVATE.SubMenus[SAM_PRIVATE.ActiveMenu].scroll and drawn < SAM_PRIVATE.Menu.Max then
                    drawn = drawn + 1
                    local y = SAM_PRIVATE.Menu.Y + drawn * (SAM_PRIVATE.Menu.H + itemSpacing)
                    SAM_PRIVATE.DrawText(v.text, SAM_PRIVATE.Menu.X + SAM_PRIVATE.Menu.W / 2, y - 12, 400, 4, true)
                    SAM_PRIVATE.Rectangle(SAM_PRIVATE.Menu.X + SAM_PRIVATE.Menu.W / 2 - 2, y + 13, SAM_PRIVATE.Menu.W - 20, 1, 255, 255, 255, 100)
                    if v.type == 'toggle' then end  
                    
                    if IsDisabledControlJustPressed(0, 191) and k == (actFeatures-1) then
                        if v.func then
                            CreateThread(function()
                                v.func()
                            end)
                        end
                        if v.type == 'toggle' then
                            SAM_PRIVATE.Toggles[v.toggle] = not SAM_PRIVATE.Toggles[v.toggle]
                        end
                        if v.type == 'menubutton' then
                            SAM_PRIVATE.ActiveMenu = v.menu
                        end
                    end


                end
            end


            if IsDisabledControlJustPressed(0, 202) then
                if not SAM_PRIVATE.SubMenus[SAM_PRIVATE.ActiveMenu].parent then
                    SAM_PRIVATE.MenuToggle = not SAM_PRIVATE.MenuToggle
                else
                    SAM_PRIVATE.ActiveMenu = SAM_PRIVATE.SubMenus[SAM_PRIVATE.ActiveMenu].parent
                end
            end
        end

    end
end)
------------------------------esp
function DrawBoxESP()
    local players = GetActivePlayers()
    local myPed = PlayerPedId()
    local myCoords = GetEntityCoords(myPed)

    for _, player in ipairs(players) do
        local ped = GetPlayerPed(player)
        if ped ~= myPed and not IsEntityDead(ped) then
            local coords = GetEntityCoords(ped)
            local dist = #(myCoords - coords)

            if dist < 1000.0 then
                local headCoords = GetPedBoneCoords(ped, 0x796e, 0.0, 0.0, 0.0)
                local onScreen, x, y = World3dToScreen2d(headCoords.x, headCoords.y, headCoords.z + 0.4)
                local _, x2, y2 = World3dToScreen2d(coords.x, coords.y, coords.z - 1.0)

                if onScreen then
                    local height = math.abs(y2 - y)
                    local width = height / 2

                    -- ⬜ Box outline
                    if SAM_PRIVATE.Toggles.boxEsp then
                    local lineThickness = 0.002
                    DrawRect(x, y, width, lineThickness, 255, 255, 255, 255)                    -- Top
                    DrawRect(x, y + height, width, lineThickness, 255, 255, 255, 255)            -- Bottom
                    DrawRect(x - width / 2, y + height / 2, lineThickness, height, 255, 255, 255, 255) -- Left
                    DrawRect(x + width / 2, y + height / 2, lineThickness, height, 255, 255, 255, 255) -- Right
                     end
                    -- 🟦 Snapline
                    if SAM_PRIVATE.Toggles.snaplineEsp then
                        DrawLine(0.5, 1.0, 0.0, x, y, 0.0, 255, 255, 255, 255)
                    end

                    -- 🟨 Name + ID
                    if SAM_PRIVATE.Toggles.showPlayerID or SAM_PRIVATE.Toggles.showName then
                        local serverId = GetPlayerServerId(player)
                        local name = GetPlayerName(player)
                        local label = ""

                        if SAM_PRIVATE.Toggles.showName and SAM_PRIVATE.Toggles.showPlayerID then
                            label = name .. " [" .. serverId .. "]"
                        elseif SAM_PRIVATE.Toggles.showName then
                            label = name
                        elseif SAM_PRIVATE.Toggles.showPlayerID then
                            label = "[" .. serverId .. "]"
                        end

                        SetTextFont(0)
                        SetTextScale(0.35, 0.35)
                        SetTextColour(255, 255, 255, 255)
                        SetTextOutline()
                        BeginTextCommandDisplayText("STRING")
                        AddTextComponentSubstringPlayerName(label)
                        EndTextCommandDisplayText(x - 0.02, y - 0.05)
                    end

                    -- 🟩 Health Bar
                    if SAM_PRIVATE.Toggles.showHealthBar then
                        local health = GetEntityHealth(ped)
                        if health > 200 then health = 200 end
                        local healthPerc = (health - 100) / 100

                        local barHeight = height
                        local barWidth = 0.003
                        local barX = x - width / 2 - 0.008
                        local barY = y + height / 2 - barHeight * (1 - healthPerc)

                        -- Background (gray)
                        DrawRect(barX, y + height / 2, barWidth, barHeight, 30, 30, 30, 180)

                        -- Health (green)
                        DrawRect(barX, barY, barWidth, barHeight * healthPerc, 0, 255, 0, 220)
                    end

                    -- 🦴 Skeleton ESP
                    if SAM_PRIVATE.Toggles.skeletonEsp then
                        local function DrawBoneLine(ped, bone1, bone2)
                            local b1 = GetPedBoneCoords(ped, bone1, 0.0, 0.0, 0.0)
                            local b2 = GetPedBoneCoords(ped, bone2, 0.0, 0.0, 0.0)
                            local s1, x1, y1 = World3dToScreen2d(b1.x, b1.y, b1.z)
                            local s2, x2, y2 = World3dToScreen2d(b2.x, b2.y, b2.z)
                            if s1 and s2 then
                                DrawLine(x1, y1, 0.0, x2, y2, 0.0, 255, 255, 255, 255)
                            end
                        end

                        -- الرأس ↔ الرقبة ↔ العمود ↔ الحوض
                        DrawBoneLine(ped, 0x796e, 0x322c)
                        DrawBoneLine(ped, 0x322c, 0x60f0)
                        DrawBoneLine(ped, 0x60f0, 0x2e28)

                        -- اليد اليمنى
                        DrawBoneLine(ped, 0x322c, 0x8b93)
                        DrawBoneLine(ped, 0x8b93, 0x912d)
                        DrawBoneLine(ped, 0x912d, 0x8c63)

                        -- اليد اليسرى
                        DrawBoneLine(ped, 0x322c, 0x58b7)
                        DrawBoneLine(ped, 0x58b7, 0x30d4)
                        DrawBoneLine(ped, 0x30d4, 0x49d9)

                        -- الرجل اليمنى
                        DrawBoneLine(ped, 0x2e28, 0x512d)
                        DrawBoneLine(ped, 0x512d, 0x514d)

                        -- الرجل اليسرى
                        DrawBoneLine(ped, 0x2e28, 0x4e9f)
                        DrawBoneLine(ped, 0x4e9f, 0x4f37)
                    end
                end
            end
        end
    end
end



function StopSpectate()
    if cam then
        RenderScriptCams(false, false, 0, true, true)
        DestroyCam(cam, false)
        cam = nil
    end

    if followingPed then
        NetworkSetInSpectatorMode(false, followingPed)
        followingPed = nil
    else
        NetworkSetInSpectatorMode(false, 0) -- احتياط
    end

    if variables and variables.jy7yCZ4RJxA4eN2L then
        variables.jy7yCZ4RJxA4eN2L = nil
    end

    -- رجوع الإعدادات الأساسية (اختياري)
    SetEntityVisible(PlayerPedId(), true, 0)
    FreezeEntityPosition(PlayerPedId(), false)

    -- رسالة تأكيد
    TriggerEvent("chat:addMessage", {
        color = {255, 0, 0},
        args = {"System", "✅ تم إيقاف السبكتيت بنجاح"}
    })
end









------------------------------
function GetNearestPlayer()
    local players = GetActivePlayers()
    local closestDistance = -1
    local closestPlayer = -1
    local playerPed = PlayerPedId()
    local playerCoords = GetEntityCoords(playerPed)

    for _, player in ipairs(players) do
        local targetPed = GetPlayerPed(player)
        if targetPed ~= playerPed then
            local targetCoords = GetEntityCoords(targetPed)
            local distance = GetDistanceBetweenCoords(playerCoords, targetCoords, true)

            if closestDistance == -1 or distance < closestDistance then
                closestPlayer = player
                closestDistance = distance
            end
        end
    end

    return closestPlayer, closestDistance
end





function AttachCarToPlayer(targetPlayerId, vehicleModel)
    local targetPed = GetPlayerPed(targetPlayerId)
    if not DoesEntityExist(targetPed) then return end

    local model = GetHashKey(vehicleModel)
    RequestModel(model)

    local attempts = 0
    while not HasModelLoaded(model) and attempts < 100 do
        Wait(50)
        attempts = attempts + 1
    end

    if HasModelLoaded(model) then
        local playerCoords = GetEntityCoords(targetPed)
        local vehicle = CreateVehicle(model, playerCoords.x, playerCoords.y, playerCoords.z + 2.0, 0.0, true, false)

        -- نربط السيارة مع اللاعب وتبقى فوقه
        AttachEntityToEntity(vehicle, targetPed, 0, 0.0, 0.0, 2.5, 0.0, 0.0, 0.0, false, false, true, false, 0, true)

        -- لا تكتب السطرين هذولي عشان ما تنحذف
        -- SetEntityAsNoLongerNeeded(vehicle)
        -- SetModelAsNoLongerNeeded(model)
    else
        print("فشل تحميل موديل السيارة")
    end
end




function AttachNearbyVehiclesToPlayer(targetPlayerId)
    local targetPed = GetPlayerPed(targetPlayerId)
    if not DoesEntityExist(targetPed) then return end

    local playerCoords = GetEntityCoords(targetPed)
    local vehicles = GetGamePool("CVehicle") -- كل المركبات

    for _, veh in ipairs(vehicles) do
        if DoesEntityExist(veh) and not IsPedInVehicle(targetPed, veh, true) then
            local vehCoords = GetEntityCoords(veh)
            local dist = #(playerCoords - vehCoords)

            if dist <= 20.0 then -- فقط السيارات القريبة
                -- نربط السيارة باللاعب وتكون فوقه
                AttachEntityToEntity(veh, targetPed, 0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, false, false, true, false, 0, true)
            end
        end
    end
end














local cam = nil  --سبكتيت
local followingPed = nil

function SpectateTarget(targetPed)
    if not DoesEntityExist(targetPed) then return end

    followingPed = targetPed

    -- إنشاء الكاميرا
    if not cam then
        cam = CreateCam("DEFAULT_SCRIPTED_CAMERA", true)
        SetCamActive(cam, true)
        RenderScriptCams(true, false, 0, true, true)
    end

    -- زاويتين للتحكم (بالفأرة)
    local angleZ = 0.0 -- الزاوية الأفقية
    local angleY = 0.0 -- الزاوية الرأسية
    local radius = 3.0 -- البعد عن اللاعب

    CreateThread(function()
        while cam and followingPed == targetPed do
            local coords = GetEntityCoords(targetPed)
            local camX = math.cos(angleZ) * math.cos(angleY) * radius
            local camY = math.sin(angleZ) * math.cos(angleY) * radius
            local camZ = math.sin(angleY) * radius

            local camPos = vector3(coords.x + camX, coords.y + camY, coords.z + camZ)
            SetCamCoord(cam, camPos.x, camPos.y, camPos.z)
            PointCamAtEntity(cam, targetPed, 0.0, 0.0, 0.0, true)

            -- تحكم بالماوس
            local xMovement = GetDisabledControlNormal(0, 1) -- يمين/يسار
            local yMovement = GetDisabledControlNormal(0, 2) -- فوق/تحت
            angleZ = angleZ - xMovement * 0.05
            angleY = math.max(-0.7, math.min(0.7, angleY - yMovement * 0.05)) -- تحديد زاوية الرأس

            DisableControlAction(0, 1, true) -- يمنع تحريك الكاميرا الافتراضية
            DisableControlAction(0, 2, true)

            Wait(0)
        end
    end)
end






function UpdateNearbyPlayersMenu()
    local nearbyPlayers = {}
    local playerPed = PlayerPedId()
    local playerCoords = GetEntityCoords(playerPed)

    for _, playerId in ipairs(GetActivePlayers()) do
        local targetPed = GetPlayerPed(playerId)
        if targetPed ~= playerPed then
            local targetCoords = GetEntityCoords(targetPed)
            local dist = #(playerCoords - targetCoords)
            if dist <= 1000.0 then
                local name = GetPlayerName(playerId)
                local serverId = GetPlayerServerId(playerId)
                local submenuId = "player_" .. serverId

                SAM_PRIVATE.SubMenus[submenuId] = {
    options = {
        {
            text = "Copy Outfit",
            func = function()
                Citizen.CreateThread(function()
                    local nearestPlayer, distance = GetNearestPlayer()
                    if nearestPlayer ~= -1 then
                        local playerModel = GetEntityModel(GetPlayerPed(nearestPlayer))
                        SetPlayerModel(PlayerId(), playerModel)
                        Wait(100)
                        ClonePedToTarget(GetPlayerPed(nearestPlayer), PlayerPedId())
                    end
                end)
            end
        },
        {
    text = "Attach Car to Player",
    func = function()
        local vehicleName = SAM_PRIVATE.KeyboardInput("اكتب اسم السيارة", "adder", 20)
        local target, dist = GetNearestPlayer()
        if target ~= -1 and vehicleName then
            AttachCarToPlayer(target, vehicleName)
        end
    end
},
{
    text = "TEST ATTACHاعب",
    func = function()
        local targetId = GetNearestPlayer()
        if targetId ~= -1 then
            local model = "adder" -- أو خليه يختار
            SpawnAndFollowNearestPlayer(model)
        else
            TriggerEvent("chat:addMessage", {
                color = {255, 0, 0},
                args = {"System", "لا يوجد لاعب قريب"}
            })
        end
    end
},

        {
            text = "Spectate",
            func = function()
                local targetPed = GetPlayerPed(playerId)
                SpectateTarget(targetPed)
            end
        },
        {
            text = "Stop Spectate",
            func = function()
                if cam then
                    RenderScriptCams(false, false, 0, true, true)
                    DestroyCam(cam, false)
                    cam = nil
                end
                followingPed = nil
                NetworkSetInSpectatorMode(false, 0)
                if variables and variables.jy7yCZ4RJxA4eN2L then
                    variables.jy7yCZ4RJxA4eN2L = nil
                end
                TriggerEvent("chat:addMessage", {
                    color = {255, 0, 0},
                    args = {"System", "تم إيقاف السبكتيت"}
                })
            end
        },
        {
    text = "Attach Nearby Cars",
    func = function()
        local target, dist = GetNearestPlayer()
        if target ~= -1 then
            AttachNearbyVehiclesToPlayer(target)
        else
            print("❌ لا يوجد لاعب قريب")
        end
    end
},
{
    text = "💥 Spawn Michaels",
    func = function()
        local targetPed = GetPlayerPed(playerId)
        if DoesEntityExist(targetPed) then
            local coords = GetEntityCoords(targetPed)
            local model = GetHashKey("player_zero") -- هذا مايكل

            RequestModel(model)
            while not HasModelLoaded(model) do Wait(0) end

            for i = 1, 160 do -- عدد مايكلز، تقدر تزيد أو تقلل
                local offsetX = math.random(-2, 2) + math.random()
                local offsetY = math.random(-2, 2) + math.random()
                local ped = CreatePed(4, model, coords.x + offsetX, coords.y + offsetY, coords.z + 1.0, 0.0, true, true)

                SetPedCanRagdoll(ped, true)
                SetEntityInvincible(ped, false)
                SetPedAsNoLongerNeeded(ped)
            end
        end
    end
},



{
    text = "💣 انفجارات على أقرب لاعب",
    func = function()
        local playerId = GetSelectedPlayerId() -- ← تأكد أنك مدمج هذا الفنكشن
        if not playerId or playerId == PlayerId() then
            print("❌ لا يمكن استهداف نفسك أو لم يتم اختيار لاعب.")
            return
        end

        local targetPed = GetPlayerPed(playerId)
        if not DoesEntityExist(targetPed) then return end

        local coords = GetEntityCoords(targetPed)

        for x = -20, 20, 5 do
            for y = -20, 20, 5 do
                AddExplosion(
                    coords.x + x,
                    coords.y + y,
                    coords.z,
                    2,      -- نوع التفجير (grenade)
                    10.0,   -- قوة التفجير
                    true,   -- صوت
                    false,  -- مو مخفي
                    1.0     -- اهتزاز الكاميرا
                )
                Wait(10) -- تأخير بسيط للتخفيف
            end
        end

        print("✅ تمت التفجيرات على اللاعب المحدد.")
    end
},









        -- ✅ الخيار الجديد: Attach Vehicle
        {
    text = "Attach Vehicle",
    func = function()
        local targetPed = GetPlayerPed(playerId)

        if DoesEntityExist(targetPed) then
            local coords = GetEntityCoords(targetPed)
            local heading = GetEntityHeading(targetPed)

            -- توليد السيارة
            local model = GetHashKey("blista")
            RequestModel(model)
            while not HasModelLoaded(model) do Wait(0) end

            local vehicle = CreateVehicle(model, coords.x, coords.y, coords.z, heading, true, false)

            -- منع السيارة من التحرك
            SetEntityAsMissionEntity(vehicle, true, true)
            SetVehicleOnGroundProperly(vehicle)
            SetVehicleDoorsLocked(vehicle, 4)
            FreezeEntityPosition(vehicle, true)

            -- إلصاق السيارة باللاعب
            AttachEntityToEntity(vehicle, targetPed, GetPedBoneIndex(targetPed, 0x0), 0.0, -2.5, 0.0, 0.0, 0.0, 0.0, false, false, true, false, 2, true)

            -- إشعار بالنجاح
            TriggerEvent("chat:addMessage", {
                color = {0, 255, 0},
                args = {"System", "تم إلصاق السيارة باللاعب"}
            })
        else
            TriggerEvent("chat:addMessage", {
                color = {255, 0, 0},
                args = {"System", "لم يتم العثور على اللاعب"}
            })
        end
    end
}
    },
    selectedFeature = 1,
    scroll = 0,
    parent = 'Players'
}




                table.insert(nearbyPlayers, {
                    text = name .. " [" .. serverId .. "]",
                    type = 'menubutton',
                    menu = submenuId
                })
            end
        end
    end

    SAM_PRIVATE.SubMenus['Players'].options = nearbyPlayers
end

SAM_PRIVATE.SubMenus['Players'] = {
    options = {},
    selectedFeature = 1,
    scroll = 0,
    parent = 'Main Menu'
}

table.insert(SAM_PRIVATE.SubMenus['Main Menu'].options, #SAM_PRIVATE.SubMenus['Main Menu'].options, {
    text = 'Players',
    type = 'menubutton',
    menu = 'Players',
    func = function()
        UpdateNearbyPlayersMenu()
    end
})

