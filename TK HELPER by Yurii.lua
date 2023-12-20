script_name('TKHelper')
script_author('Dedison')

require "lib.moonloader"
local imgui = require('imgui')
local vk = require('vkeys')
local encoding = require('encoding')
local ev = require('lib.samp.events')
local key = require 'vkeys'
local sampev = require("lib.samp.events")
local wm = require('lib.windows.message')
local fa = require 'fAwesome5'
local font_flag = require('moonloader').font_flag
local my_font = renderCreateFont('Verdana', 12, font_flag.BOLD + font_flag.SHADOW)
local thread = lua_thread.create_suspended(thread_function)
local jok = false
local gotovnosti = false
selected_item = imgui.ImInt(0)

local dlstatus = require('moonloader').download_status
update_state = false
local proverka987 = false
local script_vers = 1.05
local script_vers_text = "1.05"
local update_url = "https://raw.githubusercontent.com/DedisonVan/TK_HELPER/main/update.ini" -- тут тоже свою ссылку
local update_path = getWorkingDirectory() .. "/update.ini" -- и тут свою ссылку

local script_url = "https://github.com/DedisonVan/TK_HELPER/blob/main/TK%20HELPER.luac?raw=true" -- тут свою ссылку
local script_path = thisScript().path

local u8 = encoding.UTF8
encoding.default = 'CP1251'
local jojo = true
local tps = false
local fikszakaza = nil
local yura = false
local themes = import "resource/imgui_themes.lua"


local text_buffer = imgui.ImBuffer(256)
local nastroikymetrov = false
local menuActive = imgui.ImBool(false)
local distanc = nil
local LosSantos = imgui.ImBool(false)
local PortLS = imgui.ImBool(false)
local OkPort = imgui.ImBool(false)
local noemmulation = imgui.ImBool(false)
local virychkaimgui = imgui.ImBuffer(256)
local zaderzhkachecka = imgui.ImBuffer(256)
local nastroikymetrov1 = imgui.ImBuffer(256)
local nastroikymetrov3 = imgui.ImBuffer(256)
local nastroikymetrov4 = imgui.ImBuffer(256)
local nastroikymetrov2 = imgui.ImBuffer(256)
local nastroikyvirychka1 = imgui.ImBuffer(256)
local nastroikyvirychka3 = imgui.ImBuffer(256)
local nastroikyvirychka4 = imgui.ImBuffer(256)
local nastroikyvirychka2 = imgui.ImBuffer(256)
local nastroikynformation1 = imgui.ImBuffer(256)
local nastroikynformation3 = imgui.ImBuffer(256)
local nastroikynformation4 = imgui.ImBuffer(256)
local nastroikynformation2 = imgui.ImBuffer(256)
local pricemetr = imgui.ImBuffer(256)
local TemplDrive = imgui.ImBool(false)
local LSInt = imgui.ImBool(false)
local LasVenturas = imgui.ImBool(false)
local TeslaLV = imgui.ImBool(false)
local delpricep = imgui.ImBool(false)
local AntiDM = imgui.ImBool(false)
local StationElloy = imgui.ImBool(false)
local TierraRobada = imgui.ImBool(false)
local pokazvirychka = imgui.ImBool(true)
local EveryKon = imgui.ImBool(false)
local Lesxoz = imgui.ImBool(false)
local SkladMidl = imgui.ImBool(false)
local Neftezavod = imgui.ImBool(false)
local Okrugred = imgui.ImBool(false)
local Kazino = imgui.ImBool(false)
local Stadion = imgui.ImBool(false)
local AecLV = imgui.ImBool(false)
local LasPayadas = imgui.ImBool(false)
local VosSkladLV = imgui.ImBool(false)
local ElBrados = imgui.ImBool(false)
local TranZavod = imgui.ImBool(false)
local VosStroyka = imgui.ImBool(false)
local SeverSklad = imgui.ImBool(false)
local ZavodProd = imgui.ImBool(false)
local SanFierro = imgui.ImBool(false)
local pokazvirychka1 = false
local Bayside = imgui.ImBool(false)
local Avtosalon = imgui.ImBool(false)
local PortSF = imgui.ImBool(false)  
local information = true
local Ferma = imgui.ImBool(false)  
local HimZavod = imgui.ImBool(false)
local VerfSF = imgui.ImBool(false)
local Endjel = imgui.ImBool(false)
local MebSklSF = imgui.ImBool(false)
local nastroikyvirychka = false
local LodPirc = imgui.ImBool(false)
local BankPort = imgui.ImBool(false)
local TramDepo = imgui.ImBool(false)
local TranStation = imgui.ImBool(false)
local GoldGetBridge = imgui.ImBool(false)
local JKSilovichek = imgui.ImBool(false)
local MinesMZ = imgui.ImBool(false)
local checked_radio = imgui.ImInt(1)
local checked_radi = imgui.ImInt(1)
local checked_rad = imgui.ImInt(1)
local timezakaza = nil
status = imgui.ImBool(false)
los = false
los1 = imgui.ImBool(false)
los2 = imgui.ImBool(false)
los3 = imgui.ImBool(false)
city = imgui.ImBool(true)
offshowdialog = imgui.ImBool(false)
airb = imgui.ImBool(false)
esc = imgui.ImBool(false)
information = imgui.ImBool(true)
local vtoroeokno = imgui.ImBool()
local tretokno = imgui.ImBool()
zaka = false
local xro = 0
local yro = 0
local zro = 0
local lv = false
local ls = false
local sf = false
local poluchknopka2 = false
local zakaz = nil
local viponenoyslovie = false
aoro = true
require 'lib.sampfuncs'
require 'lib.moonloader'
local inicfg = require("inicfg")
local sampev = require 'lib.samp.events'

lastdialog = {}
local enable = true
local lob = imgui.ImBool(false)
local lobs = imgui.ImBool(false)
local pokazmetrov = imgui.ImBool(true)
local combo_select = imgui.ImInt(0)
arr_str = {u8"Лос-Сантос", u8"Лас-Вентурас", u8"Сан-Фиерро", u8"Весь штат"}
require "lib.moonloader"
local vkeys    = require "lib.vkeys"
local inicfg = require 'inicfg'
local tpso = false

local menuActive1 = nil
local LosSantos1 = nil
local PortLS1 = 'FSAFAFAFAFAFASFAFAFA'
local OkPort1 = 'FSAFAFAFAFAFASFAFAFA'
local TemplDrive1 = 'FSAFAFAFAFAFASFAFAFA'
local LSInt1 = 'FSAFAFAFAFAFASFAFAFA'
local LasVenturas1 = 'FASFSAFSAFSAFAS'
local TeslaLV1 = 'FASFSAFSAFSAFAS'
local StationElloy1 = 'FASFSAFSAFSAFAS'
local TierraRobada1 = 'FASFSAFSAFSAFAS'
local EveryKon1 = 'FASFSAFSAFSAFAS'
local Lesxoz1 = 'FASFSAFSAFSAFAS'
local SkladMidl1 = 'FASFSAFSAFSAFAS'
local Neftezavod1 = 'FASFSAFSAFSAFAS'
local Okrugred1 = 'FASFSAFSAFSAFAS'
local Stadion1 = 'FASFSAFSAFSAFAS'
local AecLV1 = 'FASFSAFSAFSAFAS'
local Kazino1 = 'FASFSAFSAFSAFAS'
local LasPayadas1 = 'FASFSAFSAFSAFAS'
local VosSkladLV1 = 'FASFSAFSAFSAFAS'
local ElBrados1 = 'FASFSAFSAFSAFAS'
local TranZavod1 = 'FASFSAFSAFSAFAS'
local VosStroyka1 = 'FASFSAFSAFSAFAS'
local SeverSklad1 = 'FASFSAFSAFSAFAS'
local ZavodProd1 = 'FASFSAFSAFSAFAS'
local SanFierro1 = 'FASFSAFSAFSAFAS'
local Bayside1 = 'FASFSAFSAFSAFAS'
local Avtosalon1 = 'FASFSAFSAFSAFAS'
local PortSF1 = 'FASFSAFSAFSAFAS'  
local Ferma1 = 'FASFSAFSAFSAFAS'  
local HimZavod1 = 'FASFSAFSAFSAFAS'
local VerfSF1 = 'FASFSAFSAFSAFAS'
local Endjel1 = 'FASFSAFSAFSAFAS'
local MebSklSF1 = 'FASFSAFSAFSAFAS'
local LodPirc1 = 'FASFSAFSAFSAFAS'
local BankPort1 = 'FASFSAFSAFSAFAS'
local TramDepo1 = 'FASFSAFSAFSAFAS'
local TranStation1 = 'FASFSAFSAFSAFAS'
local GoldGetBridge1 = 'FASFSAFSAFSAFAS'
local JKSilovichek1 = 'FASFSAFSAFSAFAS'
local MinesMZ1 = 'FASFSAFSAFSAFAS'

local directIni = 'TK.ini' --название файла в папке moonloader/config
local ini = inicfg.load(inicfg.load({ --содержимое ini
    settings = {    
    }
}, directIni))

local poluchknopka1 = false
local exits = false
local pokazvirychka2 = nil
local rtoko = false

local servers = {
    ['54.37.142.73'] = true
}

zaderzhkachecka.v = tostring(ini.settings.zaderzhkachecka)
virychkaimgui.v = tostring(ini.settings.virychka)
nastroikymetrov1.v = tostring(ini.settings.nastroikymetrov1)
local knopka1 = tostring(ini.settings.kknopka1)
local knopka2 = tostring(ini.settings.kknopka2)
nastroikymetrov2.v  = tostring(ini.settings.nastroikymetrov2)
nastroikymetrov3.v = tostring(ini.settings.nastroikymetrov3)
nastroikymetrov4.v = tostring(ini.settings.nastroikymetrov4)
nastroikyvirychka1.v = tostring(ini.settings.nastroikyvirychka1)
nastroikyvirychka2.v  = tostring(ini.settings.nastroikyvirychka2)
nastroikyvirychka3.v = tostring(ini.settings.nastroikyvirychka3)
nastroikyvirychka4.v = tostring(ini.settings.nastroikyvirychka4)
nastroikynformation1.v = tostring(ini.settings.nastroikynformation1)
nastroikynformation2.v  = tostring(ini.settings.nastroikynformation2)
nastroikynformation3.v = tostring(ini.settings.nastroikynformation3)
nastroikynformation4.v = tostring(ini.settings.nastroikynformation4)
pricemetr.v = tostring(ini.settings.pricemetr)

local fa_font = nil
local fa_glyph_ranges = imgui.ImGlyphRanges({ fa.min_range, fa.max_range })
function imgui.BeforeDrawFrame()
    if fa_font == nil then
        local font_config = imgui.ImFontConfig() -- to use 'imgui.ImFontConfig.new()' on error
        font_config.MergeMode = true

        fa_font = imgui.GetIO().Fonts:AddFontFromFileTTF('moonloader/resource/fonts/fa-solid-900.ttf', 15.0, font_config, fa_glyph_ranges)
    end
end

function main()
    local jojo = true
    if not isSampfuncsLoaded() or not isSampLoaded() then return end
    while not isSampAvailable() do wait(100) end
        wait(100)
        sampAddChatMessage('{FF8C00}[{FF6347}Чекер ТК{FF8C00}]: {FFFFFF}Используйте команду {ff00ff}/tk {FFFFFF}для включения скрипта', -1)
        sampAddChatMessage('{FF8C00}[{FF6347}Чекер ТК{FF8C00}]: {00ffff}Авторы: {DC143C}Dedison Van {FFFFFF}и {DC143C}Aleksey Krestovskiy', -1)
        wait(100)
        downloadUrlToFile(update_url, update_path, function(id, status)
            if status == dlstatus.STATUS_ENDDOWNLOADDATA then
                updateIni = inicfg.load(nil, update_path)
                if tonumber(updateIni.info.vers) > script_vers then
                    sampAddChatMessage("Есть обновление! Версия: " .. updateIni.info.vers_text, -1)
                    update_state = true
                end
                os.remove(update_path)
            end
        end)
        sampRegisterChatCommand('tk', cmd_tk)
        sampRegisterChatCommand("mycmd", cmd)
        sampRegisterChatCommand("jok", jok)
        sampRegisterChatCommand('coords', func_coords)
        sampRegisterChatCommand('rto', function()
            rtoko = not rtoko
        end)
        sampRegisterChatCommand('MN', function()
            gotovnosti = true
            sampAddChatMessage('Gotovnosti gotovi', -1)
        end)
        sampRegisterChatCommand('rtos', function()
            tpso = not tpso
        end)
        if not doesDirectoryExist("moonloader\\config") then
            createDirectory("moonloader\\config")
        end
        if doesDirectoryExist("moonloader\\config") and not doesFileExist('moonloader/config/TK.ini') then 
            if settings == nil then
                ini.settings.zaderzhkachecka=500
                ini.settings.virychka=10000
                ini.settings.information=true
                ini.settings.money=189653
                ini.settings.knopka1=71
                ini.settings.color=5
                ini.settings.kknopka2='B'
                ini.settings.knopka2=66
                ini.settings.kknopka1='G'
                ini.settings.style=8
                ini.settings.nastroikymetrov1='FF8C00'
                ini.settings.nastroikymetrov2='FFFF00'
                ini.settings.nastroikymetrov3=985
                ini.settings.nastroikymetrov4=180
                ini.settings.nastroikyvirychka1='FF8C00'
                ini.settings.nastroikyvirychka2='FFFF00'
                ini.settings.nastroikyvirychka3=985
                ini.settings.nastroikyvirychka4=240
                ini.settings.nastroikynformation1='FF8C00'
                ini.settings.nastroikynformation2='FFFF00'
                ini.settings.nastroikynformation3=985
                ini.settings.nastroikynformation4=210
                ini.settings.pricemetr=1.23
                zaderzhkachecka.v = tostring(ini.settings.zaderzhkachecka)
                virychkaimgui.v = tostring(ini.settings.virychka)
                nastroikymetrov1.v = tostring(ini.settings.nastroikymetrov1)
                knopka1 = tostring(ini.settings.kknopka1)
                knopka2 = tostring(ini.settings.kknopka2)
                nastroikymetrov2.v  = tostring(ini.settings.nastroikymetrov2)
                nastroikymetrov3.v = tostring(ini.settings.nastroikymetrov3)
                nastroikymetrov4.v = tostring(ini.settings.nastroikymetrov4)
                nastroikyvirychka1.v = tostring(ini.settings.nastroikyvirychka1)
                nastroikyvirychka2.v  = tostring(ini.settings.nastroikyvirychka2)
                nastroikyvirychka3.v = tostring(ini.settings.nastroikyvirychka3)
                nastroikyvirychka4.v = tostring(ini.settings.nastroikyvirychka4)
                nastroikynformation1.v = tostring(ini.settings.nastroikynformation1)
                nastroikynformation2.v  = tostring(ini.settings.nastroikynformation2)
                nastroikynformation3.v = tostring(ini.settings.nastroikynformation3)
                nastroikynformation4.v = tostring(ini.settings.nastroikynformation4)
                pricemetr.v = tostring(ini.settings.pricemetr)
                inicfg.save(ini, directIni)
            end
         end
        wait(1000)
        imgui.SwitchContext()
        themes.SwitchColorTheme(ini.settings.style)
        settings = inicfg.load(nil, direct)
    while true do
        if gotovnosti then
            lob.v = true
            combo_select.v = 3
            gotovnosti = false
        end
        if zapusktimezakaza then
            if timezakaza < os.clock() then
                fikszakaza = false
                lv = false
                ls = false
                sf = false
                zapusktimezakaza = false
            end
        end
        if rtoko then
            SendUnoccupiedSync()
            rtoko = false
        end
        if update_state then
            downloadUrlToFile(script_url, script_path, function(id, status)
                if status == dlstatus.STATUS_ENDDOWNLOADDATA then
                    sampAddChatMessage("Скрипт успешно обновлен!", -1)
                    thisScript():reload()
                end
            end)
            break
        end
        if isKeyDown(ini.settings.knopka1) and isKeyJustPressed(ini.settings.knopka2) then
            menuActive.v = not menuActive.v
            imgui.Process = menuActive.v
        end
        if combo_select.v == 0 then
            PoiskKonkretnogoGorodaLS()
        end
        if combo_select.v == 1 then
            PoiskKonkretnogoGorodaLV()
        end
        if combo_select == 2 then
            DopIspravilBagSF2()
        end
        if tpso then
            wait(4000)
            sampSendChat('/try выиграл')
        end
        local ip = sampGetCurrentServerAddress()
        if servers[ip] ~= true and isSampfuncsLoaded() and isSampLoaded() then
            sampAddChatMessage('{FF8C00}[{FF6347}Чекер ТК{FF8C00}]: {FFFFFF}Доступ запрещён', -1)
             thisScript():unload() end
        wait(0)
        if servers[ip] ~= false and isSampfuncsLoaded() and isSampLoaded() and not exits and not sampIsDialogActive() then
            wait(3000)
            sampSendChat('/mn')
        end
        wait(0)
        if menuActive.v == false then
            imgui.Process = false
        end
        if lob.v and not sampIsChatInputActive() and not noemmulation.v then
            if combo_select.v == 0 or combo_select.v == 1 or combo_select.v == 2 then
                if not sampIsChatInputActive() and not sampIsDialogActive() then
                    wait(ini.settings.zaderzhkachecka)
                        setVirtualKeyDown(50, true)
                        wait(100)
                        setVirtualKeyDown(50, false)
                end
            end
        end
        if lob.v and noemmulation.v then
            if combo_select.v == 0 or combo_select.v == 1 or combo_select.v == 2 or combo_select.v == 3 then
                if not sampIsChatInputActive() and not sampIsDialogActive() then
                    wait(ini.settings.zaderzhkachecka)
                    setGameKeyState(19, 1)
                end
            end
        end
        if city.v and not sampIsChatInputActive() and not noemmulation.v then
            if ls or lv or sf then
                wait(3000)
                setVirtualKeyDown(50, true)
                wait(100)
                setVirtualKeyDown(50, false)
            end
        end
        if city.v and noemmulation.v then
            if ls or lv or sf then
                wait(3000)
                setGameKeyState(19, 1)
                wait(100)
            end
        end
    end
end


local events = require "samp.events"
function events.onShowDialog(dialogId, style, title, button1, button2, text)
    if city.v then
        if ls then
            if dialogId == 3080 then
                lua_thread.create(function()
                    wait(1000)
                    sampSendDialogResponse(3080, 1, 0, -1)
                end)
                return false
            end
            if dialogId == 3079 then
                lua_thread.create(function()
                    for line in text:gmatch('[^\r\n]+') do
                        if line:find(OkPort1) or line:find(PortLS1) or line:find(TemplDrive1) or line:find(LSInt1) then
                            local name = line:match("(.*), %d+%$")
                                local vipolneno, vsegoed = line:match("(%d+)/(%d+)")
                                local tchena = line:match("(%d+)%$")
                                local virychka = (vsegoed-vipolneno)*tchena
                            if virychka > tonumber(ini.settings.virychka) then
                                sampCloseCurrentDialogWithButton(0)
                                sampAddChatMessage('{FF8C00}[{FF6347}Чекер ТК{FF8C00}]: {FFFFFF}Заказ действителен', -1)
                                timezakaza = os.clock() + 20
                                zapusktimezakaza = true
                            end
                        end
                    end
                end)
            end
            return false
        end
        if lv then
            if dialogId == 3080 then
                lua_thread.create(function()
                    wait(1000)
                    sampSendDialogResponse(3080, 1, 0, -1)
                end)
                return false
            end
            if dialogId == 3079 then
                lua_thread.create(function()
                    for line in text:gmatch('[^\r\n]+') do
                        if line:find(TeslaLV1) or line:find(Ferma1) or line:find('^%{......%}Allianz') or line:find('^%{......%}Rubetek') or line:find('^%{......%}Gachi') or line:find(StationElloy1) or line:find(TierraRobada1) or line:find(EveryKon1) or line:find(Lesxoz1) or line:find(SkladMidl1) or line:find(Neftezavod1) or line:find(Okrugred1) or line:find(Stadion1) or line:find(AecLV1) or line:find(LasPayadas1) or line:find(VosSkladLV1) or line:find(ElBrados1) or line:find(TranZavod1) or line:find(VosStroyka1) or line:find(SeverSklad1) or line:find(Kazino1) or line:find(ZavodProd1) then
                                local name = line:match("(.*), %d+%$")
                                local vipolneno, vsegoed = line:match("(%d+)/(%d+)")
                                local tchena = line:match("(%d+)%$")
                                local virychka = (vsegoed-vipolneno)*tchena
                            if virychka > tonumber(ini.settings.virychka) then
                                sampCloseCurrentDialogWithButton(0)
                                sampAddChatMessage('{FF8C00}[{FF6347}Чекер ТК{FF8C00}]: {FFFFFF}Заказ действителен', -1)
                                timezakaza = os.clock() + 20
                                zapusktimezakaza = true
                            end
                        end
                    end
                end)
            end
            return false
        end
        if sf then
            if dialogId == 3080 then
                lua_thread.create(function()
                    wait(1000)
                    sampSendDialogResponse(3080, 1, 0, -1)
                end)
                return false
            end
            if dialogId == 3079 then
                lua_thread.create(function()
                    for line in text:gmatch('[^\r\n]+') do
                        if line:find(PortSF1) or line:find(Avtosalon1) or line:find(Bayside1) or line:find (Ferma1) or line:find (HimZavod1) or line:find (VerfSF1) or line:find (Endjel1) or line:find (LodPirc1) or line:find (BankPort1) or line:find (TramDepo1) or line:find (TranStation1) or line:find (GoldGetBridge1) or line:find (JKSilovichek1) or line:find (MinesMZ1) or line:find (MebSklSF1) then
                            local name = line:match("(.*), %d+%$")
                            local vipolneno, vsegoed = line:match("(%d+)/(%d+)")
                            local tchena = line:match("(%d+)%$")
                            local virychka = (vsegoed-vipolneno)*tchena
                            if virychka > tonumber(ini.settings.virychka) then
                                sampCloseCurrentDialogWithButton(0)
                                sampAddChatMessage('{FF8C00}[{FF6347}Чекер ТК{FF8C00}]: {FFFFFF}Заказ действителен', -1)
                                timezakaza = os.clock() + 20
                                zapusktimezakaza = true
                            end
                        end
                    end
                end)
            end
            return false
        end
    end
    local jojo = true
    if dialogId == 27 and not exits then
        lua_thread.create(function() wait(0)
            wait(500)
            sampSendDialogResponse(27,1, 10, -1)
        end)
        return false
    end
    if dialogId == 94 then
        lua_thread.create(function()
            wait(100)
            local rang = text:match("Номер аккаунта:%s+(%d+)")
            wait(100)
            if text:find('Не флудите') then
                    if not exits then
                        thisScript():reload()
                    end
                end
                if tonumber(rang) == 1058519 or tonumber(rang) == 734719 or tonumber(rang) == 1068270 or tonumber(rang) == 1428988 or tonumber(rang) == 1114947 or tonumber(rang) == 1246923 or tonumber(rang) == 1319693 or tonumber(rang) == 1243795 or tonumber(rang) == 928764 or tonumber(rang) == 178 or tonumber(rang) == 1289419 or tonumber(rang) == 1362880 or tonumber(rang) == 884913 then
                    sampAddChatMessage('{FF8C00}[{FF6347}Чекер ТК{FF8C00}]: {7FFF00}Доступ разрешён.', -1)
                    wait(100)
                    sampCloseCurrentDialogWithButton(0)
                    exits = true
                end
                if tonumber(rang) == 884913 or tonumber(rang) == 178 then
                    yura = true
                    wait(100)
                end
                if rang and not exits then
                    wait(100)
                    sampAddChatMessage('{FF8C00}[{FF6347}Чекер ТК{FF8C00}]: {FF0000}Доступ запрещён.', -1)
                    wait(100)
                    thisScript():unload()
                end
        end)
        return false
    end
    if lob.v and exits then
        if dialogId == 3080 then
            lua_thread.create(function()
            wait(300)
            sampSendDialogResponse(3080, 1, 0, -1)
            end)
            if offshowdialog.v then
            return false
            end
        end
        if combo_select.v == 1 then
            if checked_radi.v == 1 and dialogId == 3079 then
                lua_thread.create(function()
                    if noemmulation.v then
                    wait(ini.settings.zaderzhkachecka)
                    end
                    local ag = -2
                    for line in text:gmatch('[^\r\n]+') do
                        ag = ag + 1
                        if line:find(TeslaLV1) or line:find(StationElloy1) or line:find(TierraRobada1) or line:find(EveryKon1) or line:find(Lesxoz1) or line:find(SkladMidl1) or line:find(Neftezavod1) or line:find(Okrugred1) or line:find(Stadion1) or line:find(AecLV1) or line:find(LasPayadas1) or line:find(VosSkladLV1) or line:find(ElBrados1) or line:find(TranZavod1) or line:find(VosStroyka1) or line:find(SeverSklad1) or line:find(Kazino1) or line:find(ZavodProd1) then
                                local name = line:match("(.*), %d+%$")
                                local vipolneno, vsegoed = line:match("(%d+)/(%d+)")
                                local tchena = line:match("(%d+)%$")
                                local virychka = (vsegoed-vipolneno)*tchena
                                sampAddChatMessage('Получил информацию', -1)
                            if virychka > tonumber(ini.settings.virychka) then           
                                sampSendDialogResponse(3079,1, ag, -1) 
                                lobs.v = true
                                sampCloseCurrentDialogWithButton(1)
                                lob.v = false
                                imgui.Process = false
                                if information and not fikszakaza then
                                    if city.v then
                                    lv = true
                                    end
                                    fikszakaza = true
                                    zakaz = name
                                    zaka = true
                                    pokazvirychka1 = true
                                    pokazvirychka2 = virychka
                                end
                            end
                        end
                    end
                    if dialogId == 3079 then
                        sampCloseCurrentDialogWithButton(0)
                    end
                end)
                if offshowdialog.v then
                    return false
                end
            end
        end
            if combo_select.v == 0 then
                if checked_radio.v == 1 and dialogId == 3079 then
                    lua_thread.create(function()
                        if noemmulation.v then
                            wait(ini.settings.zaderzhkachecka)
                        end
                        local c = -2
                        for line in text:gmatch('[^\r\n]+') do
                            c = c + 1
                            if line:find(OkPort1) or line:find(PortLS1) or line:find(TemplDrive1) or line:find(LSInt1) then
                                local name = line:match("(.*), %d+%$")
                                local vipolneno, vsegoed = line:match("(%d+)/(%d+)")
                                local tchena = line:match("(%d+)%$")
                                local virychka = (vsegoed-vipolneno)*tchena
                                if virychka > tonumber(ini.settings.virychka) then           
                                    sampSendDialogResponse(3079,1, c, -1)     
                                    lobs.v = true
                                    sampCloseCurrentDialogWithButton(1)
                                    lob.v = false
                                    imgui.Process = false
                                    if information and not fikszakaza then
                                        if city.v then
                                        ls = true
                                        end
                                        fikszakaza = true
                                        zakaz = name
                                        zaka = true
                                        pokazvirychka1 = true
                                        pokazvirychka2 = virychka
                                    end
                                end
                            end
                        end
                        if dialogId == 3079 then
                            sampCloseCurrentDialogWithButton(0)
                        end
                    end)
                    if offshowdialog.v then
                        return false
                     end
                end
            end    
        if combo_select.v == 2 then
            if checked_rad.v == 1 and dialogId == 3079 then
                lua_thread.create(function()
                    if noemmulation.v then
                        wait(ini.settings.zaderzhkachecka)
                    end
                    local b = -2
                    for line in text:gmatch('[^\r\n]+') do
                        b = b + 1
                        if line:find(PortSF1) or line:find(Avtosalon1) or line:find(Bayside1) or line:find (Ferma1) or line:find (HimZavod1) or line:find (VerfSF1) or line:find (Endjel1) or line:find (LodPirc1) or line:find (BankPort1) or line:find (TramDepo1) or line:find (TranStation1) or line:find (GoldGetBridge1) or line:find (JKSilovichek1) or line:find (MinesMZ1) or line:find (MebSklSF1) then
                            local name = line:match("(.*), %d+%$")
                            local vipolneno, vsegoed = line:match("(%d+)/(%d+)")
                            local tchena = line:match("(%d+)%$")
                            local virychka = (vsegoed-vipolneno)*tchena
                            if virychka > tonumber(ini.settings.virychka) then           
                                sampSendDialogResponse(3079,1, b, -1)     
                                lobs.v = true
                                sampCloseCurrentDialogWithButton(1)
                                lob.v = false
                                imgui.Process = false
                                if information and not fikszakaza then
                                    if city.v then
                                    sf = true
                                    end
                                    fikszakaza = true
                                    zakaz = name
                                    zaka = true
                                    pokazvirychka1 = true
                                    pokazvirychka2 = virychka
                                end
                            end
                        end
                    end
                    if dialogId == 3079 then
                        sampCloseCurrentDialogWithButton(0)
                    end
                end)
                if offshowdialog.v then
                    return false
                 end
            end
        end
        if combo_select.v == 3 and not viponenoyslovie and not proverka987 then
            if dialogId == 3079 and not viponenoyslovie then
                lua_thread.create(function()
                    if noemmulation.v then
                        wait(ini.settings.zaderzhkachecka)
                    end
                    local co = -2
                    for line in text:gmatch('[^\r\n]+') do
                        co = co + 1
                        if line:find('^%{......%}Деловая') or line:find('^Cтанция Елоу Белл') or line:find('^Тьерра') or line:find('^Эвери') or line:find('^Лесхоз') or line:find('^Склад Мидл') or line:find('^Нефтезавод') or line:find ('^Округ') or line:find ('^Cтадион') or line:find ('^АЭС') or line:find ('^Восточный склад') or line:find ('^Эль') or line:find ('^Транизосторный завод') or line:find ('^Восточная стройка') or line:find ('^Северный склад') or line:find ('^Завод продуктов') or line:find ('^Казино') or line:find ('^Лас-Пайасадас') or line:find ('^Порт SF') or line:find('^Ферма') or line:find('^Бэйсайд') or line:find('^Автосалон') or line:find ('^Хим.завод') or line:find ('^Верфь СФ') or line:find ('^Энджел') or line:find ('^Мебельный склад СФ') or line:find ('^Лодочный пирс') or line:find ('^Банковский порт') or line:find ('^Трамвайное депо') or line:find ('^Тран. станция') or line:find ('^Голден Гейт Бридж') or line:find ('^ЖК Силовичок') or line:find ('^Министерство') or line:find ('^Порт LS') or line:find ('^Океанский') or line:find ('^Темпл Драйв') or line:find ('^Лос') then
                            local name = line:match("(.*), %d+%$")
                            local vipolneno, vsegoed = line:match("(%d+)/(%d+)")
                            local tchena = line:match("(%d+)%$")
                            local virychka = (vsegoed-vipolneno)*tchena
                            if virychka > tonumber(ini.settings.virychka) and not viponenoyslovie and not proverka987 then  
                                sampAddChatMessage('virychka ' .. virychka .. 'vsegoed ' .. vsegoed .. 'vipolneno ' .. vipolneno .. 'tchena' .. tchena, -1)         
                                sampSendDialogResponse(3079,1, co, -1)
                                sampAddChatMessage(co, -1) 
                                viponenoyslovie = true   
                                sampCloseCurrentDialogWithButton(1)
                                lob.v = false
                                imgui.Process = false
                                if viponenoyslovie and not proverka987 then
                                sampAddChatMessage('А условие то реально выполнено', -1)
                                wait(5000)
                                sampProcessChatInput('/ffc')
                                sampAddChatMessage('Готовься к пиздецу', -1)
                                proverka987 = true
                                end
                            end
                        end
                    end
                    if dialogId == 3079 then
                        sampCloseCurrentDialogWithButton(0)
                    end
                end)
                if offshowdialog.v then
                    return false
                 end
            end
        end
        lastdialog.id = dialogid
        lastdialog.style = style
        lastdialog.title = title
        lastdialog.btn1 = btn1
        lastdialog.btn2 = btn2
        lastdialog.text = text
    end
end

local nam = 0
local nom = 0
function events.onServerMessage(color, text)
    local jojo = true
    if text:find('Вы загрузили {FFAA00}%d+') then
        lua_thread.create(function()
            wait(1000)
            lv = false
            ls = false
            sf = false
            wait(500)
            if delpricep.v then
                deleteGruza()
            end
            --if esc then
            --    wait(1000)
            --    setVirtualKeyDown(27, true)
            --    wait(100)
             --   setVirtualKeyDown(27, false)
            --end
            wait(5000)
            sampProcessChatInput('/ffc')
        end)
    end
    if text:find('Вы приехали слишком быстро') then
        if aoro then
            local xoro = 0
            lua_thread.create(function()
                wait(2000)
                -- xoro = xro - 10
                -- setCharCoordinates(playerPed, xoro, yro, zro)
                -- go_to_point({x=xro, y=yro, z=zro})
            end)
        end
    end
    if text:find('Вы выбрали заказ. Отправляйтесь к месту загрузки') then
        lua_thread.create(function()
            wait(2000)
            if sampIsDialogActive() then
                wait(100)
                setVirtualKeyDown(27, true)
                wait(100)
                setVirtualKeyDown(27, false)
            end
        end)
    end
    if enable then
        if text:find('Вы привезли {FFAA00}%d+.+и получили {00cc99}%d+%$') then
            local count, money = text:match('Вы привезли {FFAA00}(%d+).+и получили {00cc99}(%d+)%$')
            proverka987 = false
            zaka = false
            zakaz = nil
            viponenoyslovie = false
            fikszakaza = false
            nam = nam + count
            nom = nom + money
            lua_thread.create(function()
                wait(100)
                sampAddChatMessage("{FF8C00}[{FF6347}Чекер ТК{FF8C00}]: {FFFFFF}Вы доставили "..nam.." {FFFFFF}ед. груза", -1)
                sampAddChatMessage("{FF8C00}[{FF6347}Чекер ТК{FF8C00}]: {FFFFFF}Вы заработали "..nom.."{FFFF00}$", -1)
                lobs.v = false
            end)
        end
    end
end

function cmd_tk(arg)
    menuActive.v = not menuActive.v
    imgui.Process = menuActive.v
end


function imgui.OnDrawFrame()
local xw, yw = getScreenResolution()
if  vtoroeokno.v then
    imguiNastroiky()
end
imgui.SetNextWindowPos(imgui.ImVec2(xw / 2, yw / 2), imgui.Cond.FirstUseEver)
imgui.SetNextWindowSize(imgui.ImVec2(325, 200), imgui.Cond.FirstUseEver)
imgui.Begin(u8'Чекер ТК', menuActive, imgui.WindowFlags.NoResize)
imgui.SetCursorPosY(30)
imgui.Checkbox(u8'ВКЛ/ВЫКЛ', lob)
imgui.SameLine()
imgui.SetCursorPosX(50)
imgui.SetCursorPosY(60)
imgui.Separator()
imgui.SetCursorPosX(170)
imgui.SetCursorPosY(25)
if imgui.Button(fa.ICON_FA_COGS .. u8' Настройки', imgui.ImVec2(100, 30)) then
    vtoroeokno.v = not vtoroeokno.v
end
 imgui.PushItemWidth(120)
 imgui.SetCursorPosY(70)
 imgui.Combo(u8"", combo_select, arr_str)
 if combo_select.v == 0 then
    imguispisokgorodLS()
 end
 if combo_select.v == 1 then
    imguispisokgorodLV()
 end
 if combo_select.v == 2 then
    imguispisokgorodSF()
 end
 imgui.SetCursorPosX(210)
 imgui.SetCursorPosY(25)

 imgui.End()
end


function onWindowMessage(msg, wparam, lparam)
    --if msg == wm.WM_KILLFOCUS and lob.v then
    --    combo_select.v = 0
    --elseif msg == wm.WM_SETFOCUS and lob.v then
     --   sampAddChatMessage('{FF8C00}[{FF6347}Чекер ТК{FF8C00}]: {FFFFFF}Вы свернули SAMP! Включите скрипт обратно.', -1)
    --end
    --if ls then
    --    if msg == wm.WM_KILLFOCUS and сity.v then
    --        ls = true
    --    elseif msg == wm.WM_SETFOCUS and city.v then
    --        sampAddChatMessage('{FF8C00}[{FF6347}Чекер ТК{FF8C00}]: {FFFFFF}Вы свернули SAMP! Статус заказа запущен!', -1)
    --    end
    --end
    --if lv then
    --    if msg == wm.WM_KILLFOCUS and сity.v then
    --        lv = true
    --    elseif msg == wm.WM_SETFOCUS and city.v then
    --        sampAddChatMessage('{FF8C00}[{FF6347}Чекер ТК{FF8C00}]: {FFFFFF}Вы свернули SAMP! Статус заказа запущен!', -1)
    --    end
    --end
    --if sf then
    --    if msg == wm.WM_KILLFOCUS and сity.v then
     --       sf = true
    --    elseif msg == wm.WM_SETFOCUS and city.v then
    --        sampAddChatMessage('{FF8C00}[{FF6347}Чекер ТК{FF8C00}]: {FFFFFF}Вы свернули SAMP! Статус заказа запущен!', -1)
    --    end
    --end
  end
  
  function onD3DPresent()
    if pokazmetrov.v and nastroikymetrov then
        renderFontDrawText(my_font, '{' .. nastroikynformation1.v .. '}Расстояние до цели: {' .. nastroikynformation2.v .. '} 1000 метров', nastroikynformation3.v, nastroikynformation4.v, 0xFFFFFFFF)
    end
    if nastroikyvirychka and pokazvirychka.v then
        renderFontDrawText(my_font, '{' .. nastroikyvirychka1.v .. '}Выручка: {' .. nastroikyvirychka2.v ..'} 10000$', nastroikyvirychka3.v, nastroikyvirychka4.v, 0xFFFFFFFF)
    end
    if nastroikynformation and information.v then
        renderFontDrawText(my_font, '{' .. nastroikymetrov1.v .. '}Заказ: {' .. nastroikymetrov2.v ..'}Порт LS - Порт SF', nastroikymetrov3.v, nastroikymetrov4.v, 0xFFFFFFFF)
    end
    if zaka then
        renderFontDrawText(my_font, '{' .. nastroikymetrov1.v .. '}Заказ: {FFFF00}' .. zakaz, nastroikymetrov3.v, nastroikymetrov4.v, 0xFFFFFFFF)
    end
    if pokazvirychka1 then
        renderFontDrawText(my_font, '{' .. nastroikyvirychka1.v .. '}Выручка: {' .. nastroikyvirychka2.v ..'}' .. pokazvirychka2 .. '$', nastroikyvirychka3.v, nastroikyvirychka4.v, 0xFFFFFFFF)
    end
    if isSampfuncsLoaded() and isSampLoaded() and lobs.v then
        if pokazmetrov.v then
        local posX, posY, posZ = getCharCoordinates(PLAYER_PED)
        local res, xr, yr, zr = SearchMarker(posX, posY, posZ)
            if res then
                pedX,pedY,pedZ = getCharCoordinates(playerPed)
                distance = math.sqrt( ((xr-pedX)^2) + ((yr-pedY)^2) + ((zr-pedZ)^2))
                distanc = math.floor(distance+0.5)
                renderFontDrawText(my_font, '{' .. nastroikynformation1.v .. '}Расстояние до цели: {' .. nastroikynformation2.v .. '}' .. distanc .. ' метров', nastroikynformation3.v, nastroikynformation4.v, 0xFFFFFFFF)
                xro = xr
                yro = yr
                zro = zr
            end
        end
        return
    end
end

function SearchMarker(posX, posY, posZ)
	local ret_posX = 0.0
	local
	ret_posY = 0.0
	local ret_posZ = 0.0
	local isFind = false
	for id = 0, 31 do
		local MarkerStruct = 0
		MarkerStruct = 0xC7F168 + id * 56
		local MarkerPosX = representIntAsFloat(readMemory(MarkerStruct + 0, 4, false))
		local MarkerPosY = representIntAsFloat(readMemory(MarkerStruct + 4, 4, false))
		local MarkerPosZ = representIntAsFloat(readMemory(MarkerStruct + 8, 4, false))
			if MarkerPosX ~= 0.0 or MarkerPosY ~= 0.0 or MarkerPosZ ~= 0.0 then
				ret_posX = MarkerPosX
				ret_posY = MarkerPosY
				ret_posZ = MarkerPosZ
				isFind = true
			end
	end
return isFind, ret_posX, ret_posY, ret_posZ
end

function DopIspravilBagSF2()
    if PortSF.v then
        PortSF1 = '^Порт SF'
        PortSF = imgui.ImBool(true)
    else
        PortSF1 = 'FKKFFKKFFKKFKKFKFKFKFKFKFKFKFKFK'
        PortSF = imgui.ImBool(false)
    end
    if Ferma.v then
        Ferma1 = '^Ферма'
        Ferma = imgui.ImBool(true)
    else
        Ferma1 = 'FKKFFKKFFKKFKKFKFKFKFKFKFKFKFKFK'
        Ferma = imgui.ImBool(false)
    end
    if Bayside.v then
        Bayside1 = '^Бэйсайд'
        Bayside = imgui.ImBool(true)
    else
        Bayside1 = 'FKKFFKKFFKKFKKFKFKFKFKFKFKFKFKFK'
        Bayside = imgui.ImBool(false)
    end
    if Avtosalon.v then
        Avtosalon1 = '^Автосалон'
        Avtosalon = imgui.ImBool(true)
    else
        Avtosalon1 = 'FKKFFKKFFKKFKKFKFKFKFKFKFKFKFKFK'
        Avtosalon = imgui.ImBool(false)
    end
    if HimZavod.v then
        HimZavod1 = '^Хим.завод'
        HimZavod = imgui.ImBool(true)
    else
        HimZavod1 = 'FKKFFKKFFKKFKKFKFKFKFKFKFKFKFKFK'
        HimZavod = imgui.ImBool(false)
    end
    if VerfSF.v then
        VerfSF1 = '^Верфь СФ'
        VerfSF = imgui.ImBool(true)
    else
        VerfSF1 = 'FKKFFKKFFKKFKKFKFKFKFKFKFKFKFKFK'
        VerfSF = imgui.ImBool(false)
    end
    if Endjel.v then
        Endjel1 = '^Энджел'
        Endjel = imgui.ImBool(true)
    else
        Endjel1 = 'FKKFFKKFFKKFKKFKFKFKFKFKFKFKFKFK'
        Endjel = imgui.ImBool(false)
    end
    if MebSklSF.v then
        MebSklSF1 = '^Мебельный склад СФ'
        MebSklSF = imgui.ImBool(true)
    else
        MebSklSF1 = 'FKKFFKKFFKKFKKFKFKFKFKFKFKFKFKFK'
        MebSklSF = imgui.ImBool(false)
    end
    if LodPirc.v then
        LodPirc1 = '^Лодочный пирс'
        LodPirc = imgui.ImBool(true)
    else
        LodPirc1 = 'FKKFFKKFFKKFKKFKFKFKFKFKFKFKFKFK'
        LodPirc = imgui.ImBool(false)
    end
    if BankPort.v then
        BankPort1 = '^Банковский порт'
        BankPort = imgui.ImBool(true)
    else
        BankPort1 = 'FKKFFKKFFKKFKKFKFKFKFKFKFKFKFKFK'
        BankPort = imgui.ImBool(false)
    end
    if TramDepo.v then
        TramDepo1 = '^Трамвайное депо'
        TramDepo = imgui.ImBool(true)
    else
        TramDepo1 = 'FKKFFKKFFKKFKKFKFKFKFKFKFKFKFKFK'
        TramDepo = imgui.ImBool(false)
    end
    if TranStation.v then
        TranStation1 = '^Тран. станция'
        TranStation = imgui.ImBool(true)
    else
        TranStation1 = 'FKKFFKKFFKKFKKFKFKFKFKFKFKFKFKFK'
        TranStation = imgui.ImBool(false)
    end
    if GoldGetBridge.v then
        GoldGetBridge1 = '^Голден Гейт Бридж'
        GoldGetBridge = imgui.ImBool(true)
    else
        GoldGetBridge1 = 'FKKFFKKFFKKFKKFKFKFKFKFKFKFKFKFK'
        GoldGetBridge = imgui.ImBool(false)
    end
    if JKSilovichek.v then
        JKSilovichek1 = '^ЖК Силовичок'
        JKSilovichek = imgui.ImBool(true)
    else
        JKSilovichek1 = 'FKKFFKKFFKKFKKFKFKFKFKFKFKFKFKFK'
        JKSilovichek = imgui.ImBool(false)
    end
    if MinesMZ.v then
        MinesMZ1 = '^Министерство'
        MinesMZ = imgui.ImBool(true)
    else
        MinesMZ1 = 'FKKFFKKFFKKFKKFKFKFKFKFKFKFKFKFK'
        MinesMZ = imgui.ImBool(false)
    end
end
function DopIspravilBagSF1()
PortSF1 = '^Порт SF'
Ferma1 = '^Ферма'
Bayside1 = '^Бэйсайд'
Avtosalon = '^Автосалон'
HimZavod1 = '^Хим.завод'
VerfSF1 = '^Верфь СФ'
Endjel1 = '^Энджел'
MebSklSF1 = '^Мебельный склад СФ'
LodPirc1 = '^Лодочный пирс'
BankPort1 = '^Банковский порт'
TramDepo1 = '^Трамвайное депо'
TranStation1 = '^Тран. станция'
GoldGetBridge1 = '^Голден Гейт Бридж'
JKSilovichek1 = '^ЖК Силовичок'
MinesMZ1 = '^Министерство'

PortSF = imgui.ImBool(true)
Ferma = imgui.ImBool(true)
Bayside = imgui.ImBool(true)
Avtosalon = imgui.ImBool(true)
HimZavod = imgui.ImBool(true)
VerfSF = imgui.ImBool(true)
Endjel = imgui.ImBool(true)
MebSklSF = imgui.ImBool(true)
LodPirc = imgui.ImBool(true)
BankPort = imgui.ImBool(true)
TramDepo = imgui.ImBool(true)
TranStation = imgui.ImBool(true)
GoldGetBridge = imgui.ImBool(true)
JKSilovichek = imgui.ImBool(true)
MinesMZ = imgui.ImBool(true)
end

function DopIspravilBagSF()

 PortSF1 = 'AFSKFSAKFAFKAFKAFKSA'
Ferma1 = 'AFSKFSAKFAFKAFKAFKSA'
Bayside1 = 'AFSKFSAKFAFKAFKAFKSA'
Avtosalon1 = 'AFSKFSAKFAFKAFKAFKSA'
HimZavod1 = 'AFSKFSAKFAFKAFKAFKSA'
VerfSF1 = 'AFSKFSAKFAFKAFKAFKSA'
Endjel1 = 'AFSKFSAKFAFKAFKAFKSA'
MebSklSF1 = 'AFSKFSAKFAFKAFKAFKSA'
LodPirc1 = 'AFSKFSAKFAFKAFKAFKSA'
BankPort1 = 'AFSKFSAKFAFKAFKAFKSA'
TramDepo1 = 'AFSKFSAKFAFKAFKAFKSA'
TranStation1 = 'AFSKFSAKFAFKAFKAFKSA'
GoldGetBridge1 = 'AFSKFSAKFAFKAFKAFKSA'
JKSilovichek1 = 'AFSKFSAKFAFKAFKAFKSA'
MinesMZ1 = 'AFSKFSAKFAFKAFKAFKSA'

PortSF =  imgui.ImBool(false)
Ferma =  imgui.ImBool(false)
Bayside =  imgui.ImBool(false)
Avtosalon =  imgui.ImBool(false)
HimZavod =  imgui.ImBool(false)
VerfSF =  imgui.ImBool(false)
Endjel =  imgui.ImBool(false)
MebSklSF =  imgui.ImBool(false)
LodPirc =  imgui.ImBool(false)
BankPort =  imgui.ImBool(false)
TramDepo =  imgui.ImBool(false)
TranStation =  imgui.ImBool(false)
GoldGetBridge =  imgui.ImBool(false)
JKSilovichek =  imgui.ImBool(false)
MinesMZ =  imgui.ImBool(false)
end

function ispravilbagLS()
LosSantos.v = not LosSantos.v 
    if LosSantos.v then
        PortLS1 = '^Порт LS'
        OkPort1 = '^Океанский'
        TemplDrive1 = '^Темпл Драйв'
        LSInt1 = '^Лос'
        PortLS = imgui.ImBool(true)
        OkPort = imgui.ImBool(true)
        TemplDrive = imgui.ImBool(true)
        LSInt = imgui.ImBool(true)
    end
    if not LosSantos.v then 
        PortLS1 = 'FKKFFKKFFKKFKKFKFKFKFKFKFKFKFKFK'
        OkPort1 = 'FKFAKSFKASKFAKFAKFKAKFAKFAKKASFK'
        TemplDrive1 = 'ASFASFAFSAFSAKFASKFAS'
        LSInt1 = 'ASFSAFKSAFSAJFJASJFSAJFASJF'
        PortLS = imgui.ImBool(false)
        OkPort = imgui.ImBool(false)
        TemplDrive = imgui.ImBool(false)
        LSInt = imgui.ImBool(false)
    end

end

function DopIspravilBagLV1()
TeslaLV1 = '^%{......%}Tesla'
StationElloy1 = '^Cтанция Елоу Белл'
 TierraRobada1 = '^Тьерра'
 EveryKon1 = '^Эвери'
 Lesxoz1 = '^Лесхоз'
 SkladMidl1 = '^Склад Мидл'
 Neftezavod1 = '^Нефтезавод'
 Okrugred1 = '^Округ'
 Stadion1 = '^Cтадион'
  AecLV1 = '^АЭС'
 VosSkladLV1 = '^Восточный склад'
 ElBrados1 = '^Эль'
 TranZavod1 = '^Транизосторный завод'
 VosStroyka1 = '^Восточная стройка'
 SeverSklad1 = '^Северный склад'
 ZavodProd1 = '^Завод продуктов'
 Kazino1 = '^Казино'
 LasPayadas1 = '^Лас-Пайасадас'


 TeslaLV = imgui.ImBool(true)
 Kazino = imgui.ImBool(true)
 LasPayadas = imgui.ImBool(true)
 StationElloy = imgui.ImBool(true)
 TierraRobada = imgui.ImBool(true)
 EveryKon = imgui.ImBool(true)
 Lesxoz = imgui.ImBool(true)
 SkladMidl = imgui.ImBool(true)
 Neftezavod = imgui.ImBool(true)
 Okrugred = imgui.ImBool(true)
 Stadion = imgui.ImBool(true)
 AecLV = imgui.ImBool(true)
 VosSkladLV = imgui.ImBool(true)
 ElBrados = imgui.ImBool(true)
 TranZavod = imgui.ImBool(true)
 VosStroyka = imgui.ImBool(true)
 SeverSklad = imgui.ImBool(true)
 ZavodProd = imgui.ImBool(true)
end
function DopIspravilBagLV()
TeslaLV1 = 'AFSKFSAKFAFKAFKAFKSA'
StationElloy1 = 'AFSKFSAKFAFKAFKAFKSA'
 TierraRobada1 = 'AFSKFSAKFAFKAFKAFKSA'
 EveryKon1 = 'AFSKFSAKFAFKAFKAFKSA'
 Lesxoz1 = 'AFSKFSAKFAFKAFKAFKSA'
 SkladMidl1 = 'AFSKFSAKFAFKAFKAFKSA'
 Neftezavod1 = 'AFSKFSAKFAFKAFKAFKSA'
 Okrugred1 = 'AFSKFSAKFAFKAFKAFKSA'
 Stadion1 = 'AFSKFSAKFAFKAFKAFKSA'
 AecLV1 = 'AFSKFSAKFAFKAFKAFKSA'
 VosSkladLV1 = 'AFSKFSAKFAFKAFKAFKSA'
 ElBrados1 = 'AFSKFSAKFAFKAFKAFKSA'
 TranZavod1 = 'AFSKFSAKFAFKAFKAFKSA'
 VosStroyka1 = 'AFSKFSAKFAFKAFKAFKSA'
 SeverSklad1 = 'AFSKFSAKFAFKAFKAFKSA'
 ZavodProd1 = 'AFSKFSAKFAFKAFKAFKSA'
 Kazino1 = 'AFSKFSAKFAFKAFKAFKSA'
 LasPayadas1 = 'AFSKFSAKFAFKAFKAFKSA'


 TeslaLV = imgui.ImBool(false)
 Kazino = imgui.ImBool(false)
 LasPayadas = imgui.ImBool(false)
 StationElloy = imgui.ImBool(false)
 TierraRobada = imgui.ImBool(false)
 EveryKon = imgui.ImBool(false)
 Lesxoz = imgui.ImBool(false)
 SkladMidl = imgui.ImBool(false)
 Neftezavod = imgui.ImBool(false)
 Okrugred = imgui.ImBool(false)
 Stadion = imgui.ImBool(false)
 AecLV = imgui.ImBool(false)
 VosSkladLV = imgui.ImBool(false)
 ElBrados = imgui.ImBool(false)
 TranZavod = imgui.ImBool(false)
 VosStroyka = imgui.ImBool(false)
 SeverSklad = imgui.ImBool(false)
 ZavodProd = imgui.ImBool(false)
 sampAddChatMessage(VosSkladLV, -1)
end

function PoiskKonkretnogoGorodaLV()
    if TeslaLV.v then
        TeslaLV1 = '^%{......%}Tesla'
        TeslaLV = imgui.ImBool(true)
    else
        TeslaLV1 = 'FKKFFKKFFKKFKKFKFKFKFKFKFKFKFKFK'
        TeslaLV = imgui.ImBool(false)
    end
    if StationElloy.v then
        StationElloy1 = '^Cтанция Елоу Белл'
        StationElloy = imgui.ImBool(true)
    else
        StationElloy1 = 'FKKFFKKFFKKFKKFKFKFKFKFKFKFKFKFK'
        StationElloy = imgui.ImBool(false)
    end
    if TierraRobada.v then
        TierraRobada1 = '^Тьерра'
        TierraRobada = imgui.ImBool(true)
    else
        TierraRobada1 = 'FKKFFKKFFKKFKKFKFKFKFKFKFKFKFKFK'
        TierraRobada = imgui.ImBool(false)
    end
    if  EveryKon.v then
        EveryKon1 = '^Эвери'
        EveryKon = imgui.ImBool(true)
    else
        EveryKon1 = 'FKKFFKKFFKKFKKFKFKFKFKFKFKFKFKFK'
        EveryKon = imgui.ImBool(false)
    end
    if Lesxoz.v then
        Lesxoz1 = '^Лесхоз'
        Lesxoz = imgui.ImBool(true)
    else
        Lesxoz1 = 'FKKFFKKFFKKFKKFKFKFKFKFKFKFKFKFK'
        Lesxoz = imgui.ImBool(false)
    end
    if SkladMidl.v then
        SkladMidl1 = '^Склад Мидл'
        SkladMidl = imgui.ImBool(true)
    else
        SkladMidl1 = 'FKKFFKKFFKKFKKFKFKFKFKFKFKFKFKFK'
        SkladMidl = imgui.ImBool(false)
    end
    if Neftezavod.v then
        Neftezavod1 = '^Нефтезавод'
        Neftezavod = imgui.ImBool(true)
    else
        Neftezavod1 = 'FKKFFKKFFKKFKKFKFKFKFKFKFKFKFKFK'
        Neftezavod = imgui.ImBool(false)
    end
    if Okrugred.v then
        Okrugred1 = '^Округ'
        Okrugred = imgui.ImBool(true)
    else
        Okrugred1 = 'FKKFFKKFFKKFKKFKFKFKFKFKFKFKFKFK'
        Okrugred = imgui.ImBool(false)
    end
    if Stadion.v then
        Stadion1 = '^Cтадион'
        Stadion = imgui.ImBool(true)
    else
        Stadion1 = 'FKKFFKKFFKKFKKFKFKFKFKFKFKFKFKFK'
        Stadion = imgui.ImBool(false)
    end
    if AecLV.v then
        AecLV1 = '^АЭС'
        AecLV = imgui.ImBool(true)
    else
        AecLV1 = 'FKKFFKKFFKKFKKFKFKFKFKFKFKFKFKFK'
        AecLV = imgui.ImBool(false)
    end
    if VosSkladLV.v then
        VosSkladLV1 = '^Восточный склад'
        VosSkladLV = imgui.ImBool(true)
    else
        VosSkladLV1 = 'FKKFFKKFFKKFKKFKFKFKFKFKFKFKFKFK'
        VosSkladLV = imgui.ImBool(false)
    end
    if ElBrados.v then
        ElBrados1 ='^Эль'
        ElBrados = imgui.ImBool(true)
    else
        ElBrados1 = 'FKKFFKKFFKKFKKFKFKFKFKFKFKFKFKFK'
        ElBrados = imgui.ImBool(false)
    end
    if TranZavod.v then
        TranZavod1 = '^Транизосторный завод'
        TranZavod = imgui.ImBool(true)
    else
        TranZavod1 = 'FKKFFKKFFKKFKKFKFKFKFKFKFKFKFKFK'
        TranZavod = imgui.ImBool(false)
    end
    if VosStroyka.v then
        VosStroyka1 = '^Восточная стройка'
        VosStroyka = imgui.ImBool(true)
    else
        VosStroyka1 = 'FKKFFKKFFKKFKKFKFKFKFKFKFKFKFKFK'
        VosStroyka = imgui.ImBool(false)
    end
    if SeverSklad.v then
        SeverSklad1 = '^Северный склад'
        SeverSklad = imgui.ImBool(true)
    else
        SeverSklad1 = 'FKKFFKKFFKKFKKFKFKFKFKFKFKFKFKFK'
        SeverSklad = imgui.ImBool(false)
    end
    if ZavodProd.v then
        ZavodProd1 = '^Завод продуктов'
        ZavodProd = imgui.ImBool(true)
    else
        ZavodProd1 = 'FKKFFKKFFKKFKKFKFKFKFKFKFKFKFKFK'
        ZavodProd = imgui.ImBool(false)
    end
    if Kazino.v then
        Kazino1 = '^Казино'
        Kazino = imgui.ImBool(true)
    else
        Kazino1 = 'FKKFFKKFFKKFKKFKFKFKFKFKFKFKFKFK'
        Kazino = imgui.ImBool(false)
    end
    if LasPayadas.v then
        LasPayadas1 = '^Лас-Пайасадас'
        LasPayadas = imgui.ImBool(true)
    else
        LasPayadas1 = 'FKKFFKKFFKKFKKFKFKFKFKFKFKFKFKFK'
        LasPayadas = imgui.ImBool(false)
    end
end

function PoiskKonkretnogoGorodaLS()
    if PortLS.v then
        PortLS1 = '^Порт LS'
        PortLS = imgui.ImBool(true)
    else
        PortLS1 = 'FKKFFKKFFKKFKKFKFKFKFKFKFKFKFKFK'
        PortLS = imgui.ImBool(false)
    end
    if OkPort.v then
        OkPort = '^Океанский'
        OkPort = imgui.ImBool(true)
    else
        OkPort1 = 'FKKFFKKFFKKFKKFKFKFKFKFKFKFKFKFK'
        OkPort = imgui.ImBool(false)
    end
    if TemplDrive.v then
        TemplDrive = '^Темпл Драйв'
        TemplDrive = imgui.ImBool(true)
    else
        TemplDrive1 = 'FKKFFKKFFKKFKKFKFKFKFKFKFKFKFKFK'
        TemplDrive = imgui.ImBool(false)
    end
    if LSInt.v then
        LSInt1 = '^Лос'
        LSInt = imgui.ImBool(true)
    else
        LSInt1 = 'FKKFFKKFFKKFKKFKFKFKFKFKFKFKFKFK'
        LSInt = imgui.ImBool(false)
    end
end

function imguiNastroiky()
    local xw, yw = getScreenResolution()
    imgui.SetNextWindowPos(imgui.ImVec2(xw / 1.5, yw / 3), imgui.Cond.FirstUseEver)
    imgui.SetNextWindowSize(imgui.ImVec2(400, 300), imgui.Cond.FirstUseEver)
    if imgui.Begin(u8'Настройки',  vtoroeokno) then
        if tretokno.v then
            if pokazmetrov.v then
                nastroikymetrov = true
            end
            if pokazvirychka.v then
            nastroikyvirychka = true
            end
            if information.v then
            nastroikynformation = true
            end
            imguitretokno()
        end
        if not tretokno.v then
            nastroikymetrov = false
            nastroikyvirychka = false
            nastroikynformation = false
        end
        imgui.SetCursorPosY(250)
        if imgui.Button(fa.ICON_FA_COGS .. u8' Информация на экране', imgui.ImVec2(165, 30)) then
            tretokno.v = not tretokno.v
        end
        imgui.SetCursorPosY(215)
        if imgui.Button(fa.ICON_FA_REDO_ALT .. u8' Перезапустить скрипт', imgui.ImVec2(165, 30)) then
            thisScript():reload()
        end
        imgui.SetCursorPosY(250)
        imgui.SetCursorPosX(210)
        if imgui.Button(fa.ICON_FA_BELL .. u8' Оповещение', imgui.ImVec2(100, 30)) then
            thisScript():reload()
        end
        imgui.SetCursorPosY(180)
        if imgui.Button(knopka1, imgui.ImVec2(30, 30)) then
            knopka1 = 'No'
            poluchknopka1 = true
        end
        if poluchknopka1 then
            knopka1 = getDownKeysText()
            if knopka1 == 'No' then
                poluchknopka1 = true
            else
                ini.settings.knopka1 = getDownKeys(knopka1)
                ini.settings.kknopka1 = knopka1
                inicfg.save(ini, directIni)
                poluchknopka1 = false
            end
        end
        imgui.SetCursorPosY(180)
        imgui.SetCursorPosX(95)
        if imgui.Button(knopka2, imgui.ImVec2(30, 30)) then
            knopka2 = 'No'
            poluchknopka2 = true
        end
        if poluchknopka2 then
            knopka2 = getDownKeysText()
            if knopka2 == 'No' then
                poluchknopka2 = true
            else
                ini.settings.knopka2 = getDownKeys(knopka2)
                ini.settings.kknopka2 = knopka2
                inicfg.save(ini, directIni)
                poluchknopka2 = false
            end
        end
        imgui.SetCursorPosY(50)
        imgui.Checkbox(u8'Cкрытие диалога', offshowdialog)
        imgui.PushItemWidth(120)
        imgui.SetCursorPosY(25)
        imgui.Checkbox(u8'Cтатус заказа', city)
        imgui.SetCursorPosY(75)
        imgui.Checkbox(u8'ESC при взятии заказа', esc)
        imgui.SetCursorPosX(200)
        imgui.SetCursorPosY(250)
        imgui.SetCursorPosX(210)
        imgui.SetCursorPosY(50)
        imgui.Checkbox(u8'Удаление прицепа', delpricep)
        imgui.SetCursorPosX(210)
        imgui.SetCursorPosY(25)
        imgui.Checkbox(u8'Анти ДМ', AntiDM)
        imgui.SetCursorPosX(210)
        imgui.SetCursorPosY(75)
        imgui.Checkbox(u8'Фейк АФК при загрузке', delpricep)
        imgui.SetCursorPosY(100)
        imgui.Checkbox(u8'Не эммулировать клавишу', noemmulation)
        imgui.Separator()
        imgui.SetCursorPosY(164)
        imgui.SetCursorPosX(235)
        imgui.Text(u8'Задержка')
        imgui.SetCursorPosY(188)
        imgui.SetCursorPosX(58.5)
        imgui.PushItemWidth(100)
        imgui.Text(fa.ICON_FA_PLUS, imgui.ImVec2(300, 300))
        imgui.SetCursorPosY(165)
        imgui.SetCursorPosX(15)
        imgui.Text(u8'Активация меню')
        imgui.SetCursorPosY(180)
        imgui.SetCursorPosX(210)
        imgui.PushItemWidth(100)
        if imgui.InputText(u8'##2', zaderzhkachecka, imgui.InputTextFlags.CharsDecimal, imgui.InputTextFlags.CharsNoBlank) then
            ini.settings.zaderzhkachecka = zaderzhkachecka.v
            inicfg.save(ini, directIni)
        end
        imgui.SetCursorPosY(220)
        imgui.SetCursorPosX(210)
        imgui.PushItemWidth(100)
        if imgui.InputText(u8'##3', pricemetr, imgui.InputTextFlags.CharsDecimal, imgui.InputTextFlags.CharsNoBlank) then
            ini.settings.pricemetr = pricemetr.v
            inicfg.save(ini, directIni)
        end
        imgui.SetCursorPosY(140)
        imgui.SetCursorPosX(210)
        imgui.PushItemWidth(100)
        if imgui.InputText(u8'##1', virychkaimgui, imgui.InputTextFlags.CharsDecimal, imgui.InputTextFlags.CharsNoBlank) then
            ini.settings.virychka = virychkaimgui.v
            inicfg.save(ini, directIni)
        end
        imgui.SetCursorPosY(125)
        imgui.SetCursorPosX(220)
        imgui.Text(u8'Мин. прибыль')
        imgui.SetCursorPosY(205)
        imgui.SetCursorPosX(220)
        imgui.Text(u8'Цена за метр')
        imgui.SetCursorPosY(125)
        imgui.SetCursorPosX(25)
        imgui.Text(u8'Стиль темы')
        imgui.SetCursorPosY(140)
        imgui.PushItemWidth(120)
        if imgui.Combo(u8'', selected_item, {u8'Стандартная', u8'Пурпурная', u8'Красная', u8'Коричневая', u8'Аква', u8'Тёмная', u8'Вишнёвая', u8'Салатовая', u8'Оранжевая', u8'Монохром', u8'Ультра'}, 15) then
            if selected_item.v == 0 then
            themes.SwitchColorTheme()
            ini.settings.style = 0
            inicfg.save(ini, directIni)
        end
            if selected_item.v == 1 then
                themes.SwitchColorTheme(1)
                ini.settings.style = 1
                inicfg.save(ini, directIni)
            end
            if selected_item.v == 2 then
                themes.SwitchColorTheme(2)
                ini.settings.style = 2
                inicfg.save(ini, directIni)
            end
            if selected_item.v == 3 then
                themes.SwitchColorTheme(3)
                ini.settings.style = 3
                inicfg.save(ini, directIni)
            end
            if selected_item.v == 4 then
                themes.SwitchColorTheme(4)
                ini.settings.style = 4
                inicfg.save(ini, directIni)
            end
            if selected_item.v == 5 then
                themes.SwitchColorTheme(5)
                ini.settings.style = 5
                inicfg.save(ini, directIni)
            end
            if selected_item.v == 6 then
                themes.SwitchColorTheme(6)
                ini.settings.style = 6
                inicfg.save(ini, directIni)
            end
            if selected_item.v == 7 then
                themes.SwitchColorTheme(7)
                ini.settings.style = 7
                inicfg.save(ini, directIni)
            end
            if selected_item.v == 8 then
                themes.SwitchColorTheme(8)
                ini.settings.style = 8
                inicfg.save(ini, directIni)
            end
            if selected_item.v == 9 then
                themes.SwitchColorTheme(9)
                ini.settings.style = 9
                inicfg.save(ini, directIni)
            end
            if selected_item.v == 10 then
                themes.SwitchColorTheme(10)
                ini.settings.style = 10
                inicfg.save(ini, directIni)
            end
        end
        imgui.End()
    end
end

function imguispisokgorodLS()
    imgui.SetCursorPosY(70)
    imgui.SetCursorPosX(170)
    if imgui.Button(fa.ICON_FA_SHIPPING_FAST .. u8' Весь город', imgui.ImVec2(100, 21)) then 
        ispravilbagLS()
    end
    --imgui.RadioButton(u8'Не выбран', checked_radio, 1)
    imgui.SetCursorPosY(100)
    imgui.Checkbox(u8'Порт LS', PortLS)
    --imgui.RadioButton(u8'Порт LS', checked_radio, 2)
    imgui.SetCursorPosY(125)
    imgui.Checkbox(u8'Океанский порт', OkPort)
    imgui.SetCursorPosY(100)
    imgui.SetCursorPosX(170)
    imgui.Checkbox(u8'Темпл Драйв', TemplDrive)
    imgui.SetCursorPosY(125)
    imgui.SetCursorPosX(170)
    imgui.Checkbox(u8'Интернешнл', LSInt)
end

function imguispisokgorodLV()
    imgui.SetCursorPosY(70)
    imgui.SetCursorPosX(170)
    if imgui.Button(fa.ICON_FA_SHIPPING_FAST .. u8' Весь город', imgui.ImVec2(100, 21)) then 
        LasVenturas.v = not LasVenturas.v
        if LasVenturas.v then
            DopIspravilBagLV1()
        end
        if not LasVenturas.v then
            DopIspravilBagLV()
        end
    end
    --imgui.RadioButton(u8'Не выбран', checked_radi, 1)
    imgui.SetCursorPosY(95)
    imgui.Checkbox(u8'Tesla', TeslaLV)
    --imgui.RadioButton(u8'Tesla', checked_radi, 2)
    imgui.SetCursorPosY(120)
    imgui.Checkbox(u8'Cтанция Елоу Белл', StationElloy)
    --imgui.RadioButton(u8'Нефтезавод', checked_radi, 3)
    imgui.SetCursorPosY(145)
    imgui.Checkbox(u8'Тьерра-Робада', TierraRobada)
    imgui.SetCursorPosY(170)
    imgui.Checkbox(u8'Эвери Констракшен', EveryKon)
    imgui.SetCursorPosY(195)
    imgui.Checkbox(u8'Лесхоз', Lesxoz)
    imgui.SetCursorPosY(220)
    imgui.Checkbox(u8'Склад Мидл', SkladMidl)
    imgui.SetCursorPosY(245)
    imgui.Checkbox(u8'Нефтезавод', Neftezavod)
    imgui.SetCursorPosY(270)
    imgui.Checkbox(u8'Округ Ред', Okrugred)
    imgui.SetCursorPosY(295)
    imgui.Checkbox(u8'Стадион', Stadion)
    imgui.SetCursorPosY(270)
    imgui.SetCursorPosX(170)
    imgui.Checkbox(u8'Казино', Kazino)
    imgui.SetCursorPosY(95)
    imgui.SetCursorPosX(170)
    imgui.Checkbox(u8'АЭС', AecLV)
    imgui.SetCursorPosY(120)
    imgui.SetCursorPosX(170)
    imgui.Checkbox(u8'Восточный Склад', VosSkladLV)
    imgui.SetCursorPosY(145)
    imgui.SetCursorPosX(170)
    imgui.Checkbox(u8'Эль Кьюбрадос', ElBrados)
    imgui.SetCursorPosY(170)
    imgui.SetCursorPosX(170)
    imgui.Checkbox(u8'Тран. завод', TranZavod)
    imgui.SetCursorPosY(195)
    imgui.SetCursorPosX(170)
    imgui.Checkbox(u8'Восточная стройка', VosStroyka)
    imgui.SetCursorPosY(220)
    imgui.SetCursorPosX(170)
    imgui.Checkbox(u8'Северный склад', SeverSklad)
    imgui.SetCursorPosY(245)
    imgui.SetCursorPosX(170)
    imgui.Checkbox(u8'Завод продуктов', ZavodProd)
    imgui.SetCursorPosY(295)
    imgui.SetCursorPosX(170)
    imgui.Checkbox(u8'Лас-Пайасадас', LasPayadas)
end

function imguispisokgorodSF()
    imgui.SetCursorPosY(70)
    imgui.SetCursorPosX(170)
    if imgui.Button(fa.ICON_FA_SHIPPING_FAST .. u8' Весь город', imgui.ImVec2(100, 21)) then 
        SanFierro.v = not SanFierro.v
        if SanFierro.v then
            DopIspravilBagSF1()
        end
        if not SanFierro.v then
            DopIspravilBagSF()
        end
    end
    imgui.SetCursorPosY(95)
    imgui.Checkbox(u8'Порт SF', PortSF)
    imgui.SetCursorPosY(120)
    imgui.Checkbox(u8'Ферма', Ferma)
    imgui.SetCursorPosY(145)
    imgui.Checkbox(u8'Хим.завод', HimZavod)
    imgui.SetCursorPosY(170)
    imgui.Checkbox(u8'Верфь СФ', VerfSF)
    imgui.SetCursorPosY(195)
    imgui.Checkbox(u8'Энджел', Endjel)
    imgui.SetCursorPosY(220)
    imgui.Checkbox(u8'Мебельный склад СФ', MebSklSF)
    imgui.SetCursorPosY(245)
    imgui.Checkbox(u8'Лодочный пирс', LodPirc)
    imgui.SetCursorPosY(170)
    imgui.SetCursorPosX(170)
    imgui.Checkbox(u8'Банковский порт', BankPort)
    imgui.SetCursorPosY(220)
    imgui.SetCursorPosX(170)
    imgui.Checkbox(u8'Трамвайное депо', TramDepo)
    imgui.SetCursorPosY(195)
    imgui.SetCursorPosX(170)
    imgui.Checkbox(u8'Тран. станция', TranStation)
    imgui.SetCursorPosY(95)
    imgui.SetCursorPosX(170)
    imgui.Checkbox(u8'Голден Гейт Бридж', GoldGetBridge)
    imgui.SetCursorPosY(120)
    imgui.SetCursorPosX(170)
    imgui.Checkbox(u8'ЖК Силовичок', JKSilovichek)
    imgui.SetCursorPosY(145)
    imgui.SetCursorPosX(170)
    imgui.Checkbox(u8'Министерство', MinesMZ)
    imgui.SetCursorPosY(245)
    imgui.SetCursorPosX(170)
    imgui.Checkbox(u8'Бэйсайд', Bayside)
    imgui.SetCursorPosY(270)
    imgui.Checkbox(u8'Автосалон', Avtosalon)
end

function getDownKeys()
    local curkeys = ""
    local bool = false
    for k, v in pairs(key) do
        if isKeyDown(v) and (v == VK_MENU or v == VK_CONTROL or v == VK_SHIFT or v == VK_LMENU or v == VK_RMENU or v == VK_RCONTROL or v == VK_LCONTROL or v == VK_LSHIFT or v == VK_RSHIFT) then
            if v ~= VK_MENU and v ~= VK_CONTROL and v ~= VK_SHIFT then
                curkeys = v
            end
        end
    end
    for k, v in pairs(key) do
        if isKeyDown(v) and (v ~= VK_MENU and v ~= VK_CONTROL and v ~= VK_SHIFT and v ~= VK_LMENU and v ~= VK_RMENU and v ~= VK_RCONTROL and v ~= VK_LCONTROL and v ~= VK_LSHIFT and v ~= VK_RSHIFT) then
            if tostring(curkeys):len() == 0 then
                curkeys = v
            else
                curkeys = curkeys .. " " .. v
            end
            bool = true
        end
    end
    return curkeys, bool
end

function getDownKeysText()
    tKeys = string.split(getDownKeys(), " ")
    if #tKeys ~= 0 then
        for i = 1, #tKeys do
            if i == 1 then
                str = key.id_to_name(tonumber(tKeys[i]))
            end
        end
        return str
    else
        return "No"
    end
end


function string.split(inputstr, sep)
    if sep == nil then
            sep = "%s"
    end
    local t={} ; i=1
    for str in string.gmatch(inputstr, "([^"..sep.."]+)") do
            t[i] = str
            i = i + 1
    end
    return t
end

function strToIdKeys(str)
    tKeys = string.split(str, "+")
    if #tKeys ~= 0 then
        for i = 1, #tKeys do
            if i == 1 then
                str = key.name_to_id(tKeys[i], false)
            else
                str = str .. " " .. key.name_to_id(tKeys[i], false)
            end
        end
        return tostring(str)
    else
        return "(("
    end
end

function isKeysDown(keylist, pressed)
    local tKeys = string.split(keylist, " ")
    if pressed == nil then
        pressed = false
    end
    if tKeys[1] == nil then
        return false
    end
    local bool = false
    local key = #tKeys < 2 and tonumber(tKeys[1]) or tonumber(tKeys[2])
    local modified = tonumber(tKeys[1])
    if #tKeys < 2 then
        if not isKeyDown(VK_RMENU) and not isKeyDown(VK_LMENU) and not isKeyDown(VK_LSHIFT) and not isKeyDown(VK_RSHIFT) and not isKeyDown(VK_LCONTROL) and not isKeyDown(VK_RCONTROL) then
            if wasKeyPressed(key) and not pressed then
                bool = true
            elseif isKeyDown(key) and pressed then
                bool = true
            end
        end
    else
        if isKeyDown(modified) and not wasKeyReleased(modified) then
            if wasKeyPressed(key) and not pressed then
                bool = true
            elseif isKeyDown(key) and pressed then
                bool = true
            end
        end
    end
    if nextLockKey == keylist then
        if pressed and not wasKeyReleased(key) then
            bool = false
        else
            bool = false
            nextLockKey = ""
        end
    end
    return bool
end

function sendFakeTrailerSync(trailerId)
    local _, myId = sampGetPlayerIdByCharHandle(PLAYER_PED)
    local data = allocateMemory(67)
    sampStorePlayerIncarData(myId, data)
    setStructElement(data, 57, 2, trailerId, false)
    sampSendIncarData(data)
    freeMemory(data)
    sampAddChatMessage('okey', -1)
end

function deleteGruza()
    local veh = storeCarCharIsInNoSave(PLAYER_PED)
    local _r, car = sampGetCarHandleBySampVehicleId(veh)
    for k, v in ipairs(getAllVehicles()) do
        local modelId = getCarModel(v)
        sampAddChatMessage(modelId, -1)
        if modelId == 435 then
            deleteCar(v)
            sampAddChatMessage(v, -1)
            printString("delete", 1)
        end
    end
end

function imguitretokno()
    local xw, yw = getScreenResolution()
    imgui.SetNextWindowPos(imgui.ImVec2(xw / 1.5, yw / 3), imgui.Cond.FirstUseEver)
    imgui.SetNextWindowSize(imgui.ImVec2(400, 300), imgui.Cond.FirstUseEver)
    if imgui.Begin(u8'Текст на экране',  tretokno) then
        imgui.SetCursorPosY(25)
        if imgui.Checkbox(u8'Отображение расстояния', pokazmetrov) then
            nastroikymetrov = not nastroikymetrov
        end
        if nastroikymetrov then
            imgui.SetCursorPosY(50)
            imgui.SetCursorPosX(210)
            imgui.PushItemWidth(50)
            if imgui.InputText(u8'##1', nastroikymetrov1) then
                ini.settings.nastroikymetrov1 = nastroikymetrov1.v
                inicfg.save(ini, directIni)
            end
            imgui.SetCursorPosY(54)
            imgui.SetCursorPosX(265)
            imgui.Text(u8'Заказ:')
            imgui.SetCursorPosY(75)
            imgui.SetCursorPosX(210)
            imgui.PushItemWidth(50)
            if imgui.InputText(u8'##2', nastroikymetrov2) then
                ini.settings.nastroikymetrov2 = nastroikymetrov2.v
                inicfg.save(ini, directIni)
            end
            imgui.SetCursorPosY(79)
            imgui.SetCursorPosX(265)
            imgui.Text(u8'Порт LS - Порт SF')
            imgui.SetCursorPosY(50)
            imgui.SetCursorPosX(70)
            imgui.PushItemWidth(50)
            if imgui.InputText(u8'##3', nastroikymetrov3) then
                ini.settings.nastroikymetrov3 = nastroikymetrov3.v
                inicfg.save(ini, directIni)
            end
            imgui.SetCursorPosY(54)
            imgui.Text(u8'Позиция X:')
            imgui.SetCursorPosY(75)
            imgui.SetCursorPosX(70)
            imgui.PushItemWidth(50)
            if imgui.InputText(u8'##4', nastroikymetrov4) then
                ini.settings.nastroikymetrov4 = nastroikymetrov4.v
                inicfg.save(ini, directIni)
            end
            imgui.SetCursorPosY(79)
            imgui.Text(u8'Позиция Y:')
        end
        imgui.SetCursorPosY(100)
        imgui.Separator()
        if imgui.Checkbox(u8'Отображение выручки', pokazvirychka) then
            nastroikyvirychka = true
        end
        if nastroikyvirychka then
            imgui.SetCursorPosY(125)
            imgui.SetCursorPosX(210)
            imgui.PushItemWidth(50)
            if imgui.InputText(u8'##5', nastroikyvirychka1) then
                ini.settings.nastroikyvirychka1 = nastroikyvirychka1.v
                inicfg.save(ini, directIni)
            end
            imgui.SetCursorPosY(129)
            imgui.SetCursorPosX(265)
            imgui.Text(u8'Выручка:')
            imgui.SetCursorPosY(150)
            imgui.SetCursorPosX(210)
            imgui.PushItemWidth(50)
            if imgui.InputText(u8'##6', nastroikyvirychka2) then
                ini.settings.nastroikyvirychka2 = nastroikyvirychka2.v
                inicfg.save(ini, directIni)
            end
            imgui.SetCursorPosY(154)
            imgui.SetCursorPosX(265)
            imgui.Text(u8'10000$')
            imgui.SetCursorPosY(125)
            imgui.SetCursorPosX(70)
            imgui.PushItemWidth(50)
            if imgui.InputText(u8'##7', nastroikyvirychka3) then
                ini.settings.nastroikyvirychka3 = nastroikyvirychka3.v
                inicfg.save(ini, directIni)
            end
            imgui.SetCursorPosY(129)
            imgui.Text(u8'Позиция X:')
            imgui.SetCursorPosY(150)
            imgui.SetCursorPosX(70)
            imgui.PushItemWidth(50)
            if imgui.InputText(u8'##8', nastroikyvirychka4) then
                ini.settings.nastroikyvirychka4 = nastroikyvirychka4.v
                inicfg.save(ini, directIni)
            end
            imgui.SetCursorPosY(154)
            imgui.Text(u8'Позиция Y:')
        end
        imgui.SetCursorPosY(175)
        imgui.Separator()
        if imgui.Checkbox(u8'Информация о заказе', information) then
            nastroikynformation = true
        end
        if nastroikynformation then
            imgui.SetCursorPosY(200)
            imgui.SetCursorPosX(210)
            imgui.PushItemWidth(50)
            if imgui.InputText(u8'##9', nastroikynformation1) then
                ini.settings.nastroikynformation1 = nastroikynformation1.v
                inicfg.save(ini, directIni)
            end
            imgui.SetCursorPosY(204)
            imgui.SetCursorPosX(265)
            imgui.Text(u8'Расстояние до цели:')
            imgui.SetCursorPosY(225)
            imgui.SetCursorPosX(210)
            imgui.PushItemWidth(50)
            if imgui.InputText(u8'##10', nastroikynformation2) then
                ini.settings.nastroikynformation2 = nastroikynformation2.v
                inicfg.save(ini, directIni)
            end
            imgui.SetCursorPosY(229)
            imgui.SetCursorPosX(265)
            imgui.Text(u8'1000')
            imgui.SetCursorPosY(200)
            imgui.SetCursorPosX(70)
            imgui.PushItemWidth(50)
            if imgui.InputText(u8'##11', nastroikynformation3) then
                ini.settings.nastroikynformation3 = nastroikynformation3.v
                inicfg.save(ini, directIni)
            end
            imgui.SetCursorPosY(204)
            imgui.Text(u8'Позиция X:')
            imgui.SetCursorPosY(225)
            imgui.SetCursorPosX(70)
            imgui.PushItemWidth(50)
            if imgui.InputText(u8'##12', nastroikynformation4) then
                ini.settings.nastroikynformation4 = nastroikynformation4.v
                inicfg.save(ini, directIni)
            end
            imgui.SetCursorPosY(229)
            imgui.Text(u8'Позиция Y:')
        end
        imgui.End()
    end
end