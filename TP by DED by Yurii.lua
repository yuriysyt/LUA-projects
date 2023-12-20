local sf = require('sampfuncs')
local vk = require('vkeys')
local encoding = require('encoding')
local ev = require('lib.samp.events')
local requests = require 'requests'

local icon_x, icon_y, icon_z = 0
local on_real = false
local in_pizza = false
local dist_check = 0
local near_home = false
local id_home = 0
local id_home_2 = 0
local u8 = encoding.UTF8
encoding.default = 'CP1251'
local id_pizza = 0
local teleport = false
local virt = false
local id_home_without = 0
local in_pizza_num = 0
local into_biz_pizza_num = false
local into_biz_pizza = false
local font_flag = require('moonloader').font_flag
local my_font = renderCreateFont('Verdana', 14, font_flag.BOLD + font_flag.SHADOW)
local sendConvertOnfootToSpectator = false
local pickup_pizza = false
local heal_minus = false
local pizda = false
local wrong_pick = 0
local nick_render = ''
local nick_streams = ''
local check_nick = false
local wrong_pitka = false
local wrong_pick = false
local check_money_1 = true
local id_home_without_2 = 0
initialNicknames = "Michael_Wane Alexey_Bartolomeo Estevan_Granados August_Tsarskiy Brian_Wane Jeremy_McLain Neo_McDendy Annabella_Castello Sante_Castello Neko_Morton Francesco_Morton Hurricane_Quincy Arthas_Bartolomeo Andrey Bablov Daniel_Rubino Steve_Flame Crispino_Agostinnuci Eric_Donnovan Stefano_Adderio Raidon_Tokosa Kennetch_Cross Burzum_Goatmoon Kayne_Castellano"

function main()
    repeat wait(0) until isSampAvailable()
    sampRegisterChatCommand("virt", function() virt = not virt
		if virt then
			sampAddChatMessage('Включил бота', -1)
            sendConvertOnfootToSpectator = true
            sampAddChatMessage('Включил инвиз.', -1)
		else
			sampAddChatMessage('Выключил бота. Дождитесь конца', -1)
            sendConvertOnfootToSpectator = false
		end
    end)
    while true do
        wait(0)
        checkTimer()
        if not check_nick then
            local _, id = sampGetPlayerIdByCharHandle(playerPed)
            nick_render = sampGetPlayerNickname(id)
            check_nick = true
        end
        if virt then
            if id_home_without > 0 and virt then
                wait(50)
                sampSendPickedUpPickup(id_home_without)
                if id_home_without_2 then
                    if id_home_without_2 > 0 then
                        sampSendPickedUpPickup(id_home_without_2)
                    end
                end
            end
            if pickup_pizza and virt and not into_biz_pizza then
                wait(300)
                interior = getActiveInterior()
                if interior == 5 then
                    in_pizza = false
                    if heal_minus then
                        wait(5000)
                        sendConvertOnfootToSpectator = false
                        wait(10000)
                        setCharCoordinates(PLAYER_PED, 380.125,-119.625,1001.375)
                        wait(5000)
                        heal_minus = false
                    else
                        sendConvertOnfootToSpectator = true
                        sampAddChatMessage('Включил инвиз.', -1)
                        setCharCoordinates(PLAYER_PED, 373.72494506836, -119.05917358398, 1002)
                    end
                end
            end
            if into_biz_pizza and virt then
                on_real = true
                interior = getActiveInterior()
                wait(50)
                if interior == 0 then
                    sampAddChatMessage('Айди пикапа выхода пиццы: ' .. business_pizza, -1)
                    into_biz_pizza = false
                else
                    business_pizza = pickupid(19132)
                    sampSendPickedUpPickup(business_pizza)
                end
            end
            if near_home and virt then
                wait(50)
                sampSendPickedUpPickup(id_home)
                wait(50)
                if id_home_2 then
                    sampSendPickedUpPickup(id_home_2)
                end
            end
            if in_pizza and virt then
                interior = getActiveInterior()
                wait(300)
                sampAddChatMessage('Пытаюсь телепортироваться на пикап входа пиццерии.', -1)
                if interior == 5 then
                    in_pizza = false
                    if heal_minus then
                            lua_thread.create(function()
                            wait(5000)
                            sendConvertOnfootToSpectator = false
                            wait(10000)
                            setCharCoordinates(PLAYER_PED, 380.125,-119.625,1001.375)
                            wait(5000)
                            heal_minus = false
                        end)
                    else
                        setCharCoordinates(PLAYER_PED, 373.72494506836, -119.05917358398, 1002)
                        setCharCoordinates(PLAYER_PED, 373.72494506836, -119.05917358398, 1002)
                        sampAddChatMessage('Мы в пиццерии.', -1)
                    end
                else
                    interior = getActiveInterior()
                    if interior == 0 then
                        setCharCoordinates(PLAYER_PED, -1805.6474609375, 947.20983886719, 24.890625)
                        wait(300)
                        sampAddChatMessage('Телепорт рядом с пиццерией', -1)
                        interior = getActiveInterior()
                        if interior == 0 then
                            sampAddChatMessage('ТПхаюсь на пикап', -1)
                            setCharCoordinates(PLAYER_PED, -1808.625,945.875, 27.5)
                            wait(100)
                            setCharVelocity(PLAYER_PED, 0.0, 0.0, 0.0)
                            sampSetSpecialAction(0)     
                            setPlayerControl(PLAYER_HANDLE, true)
                            freezeCharPosition(PLAYER_PED, false)
                            clearCharTasksImmediately(PLAYER_PED)
                            wait(400)
                            if id_pizza > 0 then
                                sampSendPickedUpPickup(id_pizza)
                            end
                        end
                    end
                end
            end
        end
    end
end

local timer = 0
local isWaiting = false

function startTimer()
    isWaiting = true
    timer = os.clock()
end

function stopTimer()
    isWaiting = false
    timer = 0
end

function checkTimer()
    if isWaiting then
        if os.clock() - timer >= 20 and teleport then
            local nearest = nil
            local nearest_dist = math.huge
            local x, y, z = getCharCoordinates(PLAYER_PED)
            for _, pickup in ipairs(getAllPickups()) do
                local pick_x, pick_y, pick_z = getPickupCoordinates(pickup)
                local dist = math.sqrt((x - pick_x)^2 + (y - pick_y)^2 + (z - pick_z)^2)
                if dist < 10 then
                    lua_thread.create(function()
                        wait(100)
                        wrong_pick = wrong_pick + 1
                        if wrong_pick > 300 then
                            wrong_pick = 0
                            wrong_pitka = true
                            text = 'Я там пытаюсь пикап уже 300 раз взять. Бот продолжает работу. Ник: ' .. nick_render
                            text = u8:encode(text, 'CP1251')
                            requests.get(('https://api.telegram.org/bot%s/sendMessage?chat_id=%s&text=%s'):format('2136530591:AAGIF_aCqnZEmKG2VT1HWuDIX2cTMD_tuDk','722577116',text))
                            requests.get(('https://api.telegram.org/bot%s/sendMessage?chat_id=%s&text=%s'):format('2136530591:AAGIF_aCqnZEmKG2VT1HWuDIX2cTMD_tuDk','5496487959',text))
                            requests.get(('https://api.telegram.org/bot%s/sendMessage?chat_id=%s&text=%s'):format('2136530591:AAGIF_aCqnZEmKG2VT1HWuDIX2cTMD_tuDk','1288539542',text))
                        end
                        nearest = pickup
                        id_home_without = sampGetPickupSampIdByHandle(nearest)
                        sampSendPickedUpPickup(sampGetPickupSampIdByHandle(nearest))
                        nearest_dist = dist
                        sendConvertOnfootToSpectator = false
                        sampAddChatMessage('Пришлось самому брать пикап через таймер: ' .. id_home_without, -1)
                    end)
                end
            end
            if nearest then
                print('nearest pickup', nearest, nearest_dist)
                sampSendPickedUpPickup(sampGetPickupSampIdByHandle(nearest))
            else
            print('no nearest pickup found')
            end
		elseif not teleport then
			stopTimer()
        end
    end
end

function onD3DPresent()
    if isSampfuncsLoaded() and isSampLoaded() then
        local resX, resY = getScreenResolution()
        renderFontDrawText(my_font, '{FF8C00} Ник: {FFFF00}' .. nick_render, resX / 18, (resY / 1.4) + 7, 0xFF00FF00)
	end
end

function ev.onSendSpawn()
    local _, id = sampGetPlayerIdByCharHandle(playerPed)
    nick_render = sampGetPlayerNickname(id)
end

function ev.onSendStatsUpdate(money_get, drunk)
	if money_get > 1000000 and money_get < 1100000 and check_money_1 and virt then
        text = 'У вас 1kk виртов. Ник:  ' .. nick_render .. ' Переведите средства на 140655!'
		text = u8:encode(text, 'CP1251')
		requests.get(('https://api.telegram.org/bot%s/sendMessage?chat_id=%s&text=%s'):format('2136530591:AAGIF_aCqnZEmKG2VT1HWuDIX2cTMD_tuDk','722577116',text))
        requests.get(('https://api.telegram.org/bot%s/sendMessage?chat_id=%s&text=%s'):format('2136530591:AAGIF_aCqnZEmKG2VT1HWuDIX2cTMD_tuDk','5496487959',text))
		requests.get(('https://api.telegram.org/bot%s/sendMessage?chat_id=%s&text=%s'):format('2136530591:AAGIF_aCqnZEmKG2VT1HWuDIX2cTMD_tuDk','1288539542',text))
        check_money_1 = false
    end
end

function ev.onServerMessage(color, text)
    if text:find('Отвезите еду') then
        pickup_pizza = false
    end
    if text:find('Пицца доставлена.') then
        lua_thread.create(function()
            wrong_pick = 0
            if wrong_pitka then
                text = 'Смог положить пиццу. Ник:  ' .. nick_render .. ' Продолжаю работу!'
                text = u8:encode(text, 'CP1251')
                requests.get(('https://api.telegram.org/bot%s/sendMessage?chat_id=%s&text=%s'):format('2136530591:AAGIF_aCqnZEmKG2VT1HWuDIX2cTMD_tuDk','722577116',text))
                requests.get(('https://api.telegram.org/bot%s/sendMessage?chat_id=%s&text=%s'):format('2136530591:AAGIF_aCqnZEmKG2VT1HWuDIX2cTMD_tuDk','5496487959',text))
                requests.get(('https://api.telegram.org/bot%s/sendMessage?chat_id=%s&text=%s'):format('2136530591:AAGIF_aCqnZEmKG2VT1HWuDIX2cTMD_tuDk','1288539542',text))
                wrong_pitka = false
            end
            sampAddChatMessage('Пиццу доставел. Врубаю инвиз', -1)
            dist_check = 0
            teleport = false
            near_home = false
            icon_x, icon_y, icon_z = 0
            id_home_without = 0
            id_home_without_2 = 0
            stopTimer()
            sendConvertOnfootToSpectator = true
            sampAddChatMessage('Включил инвиз.', -1)
            wait(500)
            sampAddChatMessage('Инвиз включён. Телепортируюсь к пиццерии.', -1)
            sdal = true
            in_pizza = true
            freezeCharPosition(PLAYER_PED, false)
            setCharCoordinates(PLAYER_PED, -1805.9669189453, 945.72796630859, 24.890625)
            id_home = 0
        end)
    end
end

function ev.onSendInteriorChangeNotification(int)
    sampAddChatMessage(int)
    if virt then
        if int == 0 and on_real then
            freezeCharPosition(PLAYER_PED, true)
            setCharCoordinates(PLAYER_PED, icon_x, icon_y, icon_z-3)
            sampAddChatMessage('Отправил синхру на: ' .. 'X: ' .. icon_x .. ' Y:' .. icon_y .. ' Z:' .. icon_z, -1)
            teleport = true
            sdal = false
            on_real = false
            id_pizza = 0
            into_biz_pizza = false
        end
        if in_pizza and int == 5 then
            in_pizza = false
            pickup_pizza = true
            if heal_minus then
                lua_thread.create(function()
                    wait(5000)
                    sendConvertOnfootToSpectator = false
                    wait(10000)
                    setCharCoordinates(PLAYER_PED, 380.125,-119.625,1001.375)
                    wait(5000)
                    heal_minus = false
                end)
            else
                sendConvertOnfootToSpectator = true
                sampAddChatMessage('Включил инвиз.', -1)
                sampAddChatMessage('Я в пиццерии', -1)
                setCharCoordinates(PLAYER_PED, 373.72494506836, -119.05917358398, 1002)
                setCharCoordinates(PLAYER_PED, 373.72494506836, -119.05917358398, 1002)
            end
        end
    end
end


function ev.onSetMapIcon(iconId, position, types, color, style)
	if types == 29 and virt then
        icon_x, icon_y, icon_z = position.x, position.y, position.z
        sampAddChatMessage('Иконка координаты: ' .. position.x .. position.y .. position.z, -1)
        id_pizza = 0
        into_biz_pizza = true
        sdal = false
        sendConvertOnfootToSpectator = true
        sampAddChatMessage('Включил инвиз.', -1)
        sampAddChatMessage('Пытаюсь выйти с пиццы с помощью пикапа', -1)
	end
end

function isNicknameInList(nickname, list)
    return string.find(list, nickname, 1, true) ~= nil
end

function ev.onCreatePickup(id, model, type, pos)
    if model == 19522 or model == 19523 or model == 19524 then
        startTimer()
        if teleport then
            local mx, my, mz = getCharCoordinates(PLAYER_PED)
            --sampAddChatMessage('x' .. pos.x .. 'y' .. pos.y .. 'z ' .. pos.z, -1)
            local dist = getDistanceBetweenCoords3d(mx, my, mz, pos.x, pos.y, pos.z)
            --sampAddChatMessage('Айди пикапа: ' .. id .. ' Расстояние: ' .. dist, -1)
            setCharCoordinates(PLAYER_PED, icon_x, icon_y, icon_z-3)
            if dist < 10 then
                if dist_check == 0 or tonumber(dist) < tonumber(dist_check) then
                    sampAddChatMessage('Определил перебором нужный пикап', -1)
                    lua_thread.create(function() 
                        setCharCoordinates(PLAYER_PED, icon_x, icon_y, icon_z-3)
                        dist_check = dist
                        local data = samp_create_sync_data('spectator')
                        data.position.x, data.position.y, data.position.z = icon_x, icon_y, icon_z-3
                        data.send()
                        setCharCoordinates(PLAYER_PED, icon_x, icon_y, icon_z-3)
                        sampAddChatMessage('Телепортировался к дому: ', -1)
                        id_pizza = 0

                        for k, v in ipairs(getAllChars()) do
                            local res, id = sampGetPlayerIdByCharHandle(v)
                            if res then
                                local playerNickname = sampGetPlayerNickname(id)
                                if isNicknameInList(playerNickname, initialNicknames) then
                                    local isPaused = sampIsPlayerPaused(id)
                                    if not isPaused then
                                        sampAddChatMessage(playerNickname .. " находится в списке начальных никнеймов.", -1)
                                        sendConvertOnfootToSpectator = true
                                        local _, id = sampGetPlayerIdByCharHandle(playerPed)
                                        local nickname = sampGetPlayerNickname(id)
                                        text = 'Произошёл пиздец. Админ рядом. Врубил инвиз. Ник бота: ' .. nickname .. 'Ник админа:' .. playerNickname .. ' Останавливаю бота!'
                                        text = u8:encode(text, 'CP1251')
                                        requests.get(('https://api.telegram.org/bot%s/sendMessage?chat_id=%s&text=%s'):format('2136530591:AAGIF_aCqnZEmKG2VT1HWuDIX2cTMD_tuDk','1288539542',text))
                                        requests.get(('https://api.telegram.org/bot%s/sendMessage?chat_id=%s&text=%s'):format('2136530591:AAGIF_aCqnZEmKG2VT1HWuDIX2cTMD_tuDk','722577116',text))
                                        requests.get(('https://api.telegram.org/bot%s/sendMessage?chat_id=%s&text=%s'):format('2136530591:AAGIF_aCqnZEmKG2VT1HWuDIX2cTMD_tuDk','5496487959',text))
                                        
                                        pizda = true
                                        stopTimer()
                                        on_real = false
                                        in_pizza = false
                                        near_home = false
                                        virt = false
                                        teleport = false
                                        into_biz_pizza_num = false
                                        into_biz_pizza = false
                                        pickup_pizza = false
                                        heal_minus = false
                                        pizda = false
                                    end
                                else
                                    sampAddChatMessage(playerNickname .. " не находится в списке начальных никнеймов.", -1)
                                end
                            end
                        end
                        wait(4000)
                        if pizda then
                            sampAddChatMessage('Произошёл пиздец. Админ рядом. Врубил инвиз. Ник: ' .. nickname .. ' Останавливаю бота!', -1)
                            sendConvertOnfootToSpectator = true
                            local _, id = sampGetPlayerIdByCharHandle(playerPed)
                            local nickname = sampGetPlayerNickname(id)
                            text = 'Произошёл пиздец. Админ рядом. Врубил инвиз. Ник: ' .. nickname .. ' Останавливаю бота!'
                            text = u8:encode(text, 'CP1251')
                            requests.get(('https://api.telegram.org/bot%s/sendMessage?chat_id=%s&text=%s'):format('2136530591:AAGIF_aCqnZEmKG2VT1HWuDIX2cTMD_tuDk','1288539542',text))
                            requests.get(('https://api.telegram.org/bot%s/sendMessage?chat_id=%s&text=%s'):format('2136530591:AAGIF_aCqnZEmKG2VT1HWuDIX2cTMD_tuDk','722577116',text))
                            requests.get(('https://api.telegram.org/bot%s/sendMessage?chat_id=%s&text=%s'):format('2136530591:AAGIF_aCqnZEmKG2VT1HWuDIX2cTMD_tuDk','5496487959',text))
                            wrong_pick = 0
                            stopTimer()
                            on_real = false
                            in_pizza = false
                            teleport = falses
                            near_home = false
                            virt = false
                            into_biz_pizza_num = false
                            into_biz_pizza = false
                            pickup_pizza = false
                            heal_minus = false
                        else
                            sampAddChatMessage('Выключил инвиз и начинаю брать дом: ' .. id, -1)
                            sendConvertOnfootToSpectator = false
                            near_home = true
                            if id_home == 0 then
                                id_home = id
                            else
                                id_home_2 = id
                                sampAddChatMessage(id_home_2, -1)
                                sampAddChatMessage('(1) Требуется взять другой пикап дома: ' .. id_home_2, -1)
                            end
                        end
                    end)
                end
                if id_home == 0 then
                    --
                else
                    id_home_2 = id
                    sampAddChatMessage(id_home_2, -1)
                    sampAddChatMessage('Требуется взять другой пикап дома: ' .. id_home_2, -1)
                end
            end
        end
    end
    if model == 19132 and sdal then
        x_pick, y_pick, z_pick = -1808.625,945.875,24.875
        if math.floor(tonumber(pos.x)) == math.floor(tonumber(x_pick)) and math.floor(tonumber(pos.y)) == math.floor(tonumber(y_pick)) and math.floor(tonumber(z_pick)) == 24 then
            freezeCharPosition(PLAYER_PED, false)
            lua_thread.create(function()
                in_pizza = true
                id_pizza = id
                sampAddChatMessage('Получил айди входа в пиццерую: ' .. id_pizza, -1)
            end)
        end
    end
end

function ev.onShowDialog(id, style, title, button1, button2, text)
    sampAddChatMessage('вижу', -1)
    if id == 137 and virt then
        sampSendDialogResponse(id, 1, 0, -1)
    end
    if id == 9 and virt then
        sampAddChatMessage('Получил айди второго дома: ' .. id_home_2, -1)
        local nearest = nil
        local nearest_dist = math.huge
        local x, y, z = getCharCoordinates(PLAYER_PED)
        for _, pickup in ipairs(getAllPickups()) do
            if pickup == id_home then
                --
            else
                local pick_x, pick_y, pick_z = getPickupCoordinates(pickup)
                local dist = math.sqrt((x - pick_x)^2 + (y - pick_y)^2 + (z - pick_z)^2)
                if dist < nearest_dist then
                    nearest = pickup
                    id_home_without_2 = sampGetPickupSampIdByHandle(nearest)
                    nearest_dist = dist
                end
            end
        end
        if nearest then
            print('nearest pickup:' .. sampGetPickupSampIdByHandle(nearest))
            sampSendPickedUpPickup(sampGetPickupSampIdByHandle(nearest))
            sampAddChatMessage()
        else
          print('no nearest pickup found')
        end
        return false
    end
end

function ev.onSetPlayerHealth(health)
    sampAddChatMessage('Твоё ХП сейчас: ' .. health, -1)
    if health < 30 and virt then
        heal_minus = true
    end
end

function getAllPickups()
    local pu = {}
    pPu = sampGetPickupPoolPtr() + 16388
    for i = 0, 4095 do
        local id = readMemory(pPu + 4 * i, 4)
        if id ~= -1 then
            table.insert(pu, sampGetPickupHandleBySampId(i))
        end
    end
    return pu
end

function ev.onSendPlayerSync(data)
    if sendConvertOnfootToSpectator then
        sendSpectator(data)
        return false
    end
end

function sendSpectator(data)
    sync = samp_create_sync_data('spectator')
    sync.position = data.position
    sync.send()
end

function pickupid(model)
    local poolPtr = sampGetPickupPoolPtr()
    local ptwo = readMemory(poolPtr, 4, 0)
    if ptwo > 0 then
      ptwo = poolPtr + 0x4
      local pthree = poolPtr + 0xF004
      for id = 1, 4096 do
        local pfive = readMemory(ptwo + id * 4, 4, false)
        if pfive < 0 or pfive > 0 then
          pfive = readMemory(pthree + id * 20, 4, false)
          if pfive == model then
            return id
          end
        end
      end
    end
end

function samp_create_sync_data(sync_type, copy_from_player)
    local ffi = require 'ffi'
    local sampfuncs = require 'sampfuncs'
    -- from SAMP.Lua
    local raknet = require 'samp.raknet'
    --require 'samp.synchronization'

    copy_from_player = copy_from_player or true
    local sync_traits = {
        player = {'PlayerSyncData', raknet.PACKET.PLAYER_SYNC, sampStorePlayerOnfootData},
        vehicle = {'VehicleSyncData', raknet.PACKET.VEHICLE_SYNC, sampStorePlayerIncarData},
        passenger = {'PassengerSyncData', raknet.PACKET.PASSENGER_SYNC, sampStorePlayerPassengerData},
        aim = {'AimSyncData', raknet.PACKET.AIM_SYNC, sampStorePlayerAimData},
        trailer = {'TrailerSyncData', raknet.PACKET.TRAILER_SYNC, sampStorePlayerTrailerData},
        unoccupied = {'UnoccupiedSyncData', raknet.PACKET.UNOCCUPIED_SYNC, nil},
        bullet = {'BulletSyncData', raknet.PACKET.BULLET_SYNC, nil},
        spectator = {'SpectatorSyncData', raknet.PACKET.SPECTATOR_SYNC, nil}
    }
    local sync_info = sync_traits[sync_type]
    local data_type = 'struct ' .. sync_info[1]
    local data = ffi.new(data_type, {})
    local raw_data_ptr = tonumber(ffi.cast('uintptr_t', ffi.new(data_type .. '*', data)))
    -- copy player's sync data to the allocated memory
    if copy_from_player then
        local copy_func = sync_info[3]
        if copy_func then
            local _, player_id
            if copy_from_player == true then
                _, player_id = sampGetPlayerIdByCharHandle(PLAYER_PED)
            else
                player_id = tonumber(copy_from_player)
            end
            copy_func(player_id, raw_data_ptr)
        end
    end
    -- function to send packet
    local func_send = function()
        local bs = raknetNewBitStream()
        raknetBitStreamWriteInt8(bs, sync_info[2])
        raknetBitStreamWriteBuffer(bs, raw_data_ptr, ffi.sizeof(data))
        raknetSendBitStreamEx(bs, sampfuncs.HIGH_PRIORITY, sampfuncs.UNRELIABLE_SEQUENCED, 1)
        raknetDeleteBitStream(bs)
    end
    -- metatable to access sync data and 'send' function
    local mt = {
        __index = function(t, index)
            return data[index]
        end,
        __newindex = function(t, index, value)
            data[index] = value
        end
    }
    return setmetatable({send = func_send}, mt)
end