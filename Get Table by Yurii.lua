script_name('Jimmy Cabrera script')
script_author('From Jimmy Cabrera')
script_description('This is my table for Arthur')

require "lib.moonloader"
local sampev = require "lib.samp.events"
local imgui_lib = require 'imgui'
local imgui = require('imgui')
local game_keys = require 'lib.game.keys'
local ffi = require("ffi")
local encoding = require('encoding')
local key = require 'vkeys'
local bb = false
local requests = require 'requests'
local dlstatus = require('moonloader').download_status

ffi.cdef[[
bool SetCursorPos(int X, int Y);
]]

local activVoice = 0
local nick_streams = ''
local proverka = false
local skin = false
local AnswerReport = 0
local vasya = 0
local AnswerTextInReport = 0
local textdraw_cdback = 2060
local textdraw_diller_1 = 2053
local split_parse = true
local textdraw_igrok_bot = 2065
local textdraw_hit = 1689
local textdraw_stay = 1690
local textdraw_leave = 1687
local textdraw_double = 1691
local textdraw_split = 1688
local textdraw_split1 = 1688
local textdraw_split2 = 1688
local textdraw_max = 2050
local nopstab = 0
local ActivTimerAnswer = 0
local OpenReport = 0
local font_flag = require('moonloader').font_flag
local my_font = renderCreateFont('Verdana', 14, font_flag.BOLD + font_flag.SHADOW)
local my_font1 = renderCreateFont('Verdana', 20, font_flag.BOLD + font_flag.SHADOW)
local clik = false
local igrok_score = nil
local poluchknopka1 = false
local poluchknopka2 = false
local split = true
local tab1 = 0
local OldAnswer = 0
local pricemetr = imgui.ImBuffer(256)
local pricemetr1 = imgui.ImBuffer(256)
local activAnswer = 1
local OldAnswerKol = 0
local schetchik = 0
local money = 0
local TextScript = 0
local maincoord = 0
local menuActive = imgui.ImBool(false)
local paraste = imgui.ImBool(false)
local igrok_peredach = imgui.ImBool(false)
local pustiska = imgui.ImBool(false)
local ro_to_server = imgui.ImBool(false)
local activTimerS = 0
local activateHP = 0
local min_money_kick = 100000000
local activGame = 0
local exit_game = 0
local u8 = encoding.UTF8
encoding.default = 'CP1251'
local activTable = 0
local inicfg = require("inicfg")
local lob = imgui.ImBool(false)
local activClicker = false
local status = 0
local zaderzhkachecka = imgui.ImBuffer(256)
local our_id = imgui.ImBuffer(256)
local krichalka = imgui.ImBuffer(256)
local i_textdraw_cdback = imgui.ImBuffer(256)
local i_textdraw_diller_1 = imgui.ImBuffer(256)
local i_textdraw_igrok_bot = imgui.ImBuffer(256)
local i_textdraw_hit = imgui.ImBuffer(256)
local i_textdraw_stay = imgui.ImBuffer(256)
local i_textdraw_max = imgui.ImBuffer(256)
local i_textdraw_double = imgui.ImBuffer(256)
local i_textdraw_leave = imgui.ImBuffer(256)
local i_textdraw_split = imgui.ImBuffer(256)
local i_textdraw_split1 = imgui.ImBuffer(256)
local i_textdraw_split2 = imgui.ImBuffer(256)
local pustishka = imgui.ImBuffer(256)
local mon = 0
local tretokno = imgui.ImBool()
local info_skript = imgui.ImBool(true)
local info_pusto = imgui.ImBool(false)
local info_klac = imgui.ImBool(false)
local bot_igrok = imgui.ImBool(false)
local show_stol = imgui.ImBool(false)
local prorisovka = imgui.ImBool(false)
local con_ro_to_server = imgui.ImBool(false)
local activVoice = false
local info_cursor = imgui.ImBool(false)
local anti_flud = imgui.ImBool(true)
local activTimerS = 0
local update_state = false
local info_screen = imgui.ImBool(false)
local status_krichalka = imgui.ImBool(false)
local info_script = '{7FFF00}включён'
local info_clicker = '{FF0000}выключён'
local ActivateScript = 0
local cycle = false
local knopka1 = ''
local knopka2 = ''
local emulate_F5 = false
local pidor = false
local textd = false
local parse_inviz = false
local bot = false
local igrok = false
local max_id = 0
local bagaet = imgui.ImBool(false)
local info_cycle = '{FF0000}выключён'

local script_vers = 1.17
local script_vers_text = "1.17"
local update_url = "https://raw.githubusercontent.com/DedisonVan/ParsingPython/main/update.ini" -- тут тоже свою ссылку
local update_path = getWorkingDirectory() .. "/update.ini" -- и тут свою ссылку

local script_url = "https://raw.githubusercontent.com/DedisonVan/ParsingPython/main/loverstolov.lua" -- тут свою ссылку
local script_path = thisScript().path

local directIni = 'loverstolov.ini' --название файла в папке moonloader/config
local ini = inicfg.load(inicfg.load({ --содержимое ini
    settings = {    
    }
}, directIni))
local ffi = require "ffi"
ffi.cdef[[
     void keybd_event(int keycode, int scancode, int flags, int extra);
]]

encoding.default = 'CP1251'; u8 = encoding.UTF8 

local activateMathematic = 0

function main()
	if not isSampLoaded() or not isSampfuncsLoaded() then return end
	while not isSampAvailable() do wait(100) end
	sampRegisterChatCommand('lover', cmd_tk)
	sampRegisterChatCommand('eb', eb)
	sampRegisterChatCommand("min", TableMin)
	sampRegisterChatCommand("cur", cursor)
	sampRegisterChatCommand("per", per)
	sampRegisterChatCommand("texd", texd)
	sampRegisterChatCommand('sec', sec)
	 sampRegisterChatCommand("bot", function() bot = not bot
		if bot then
			sampAddChatMessage("{FF8C00}[{FF6347}Ловля столов{FF8C00}]: {7FFF00}Бот с АФК-диллером {7FFF00}включён",  -1)
		else
			sampAddChatMessage("{FF8C00}[{FF6347}Ловля столов{FF8C00}]: {FF0000}Бот с АФК-диллером выключен",  -1)
		end
	 end)
	 sampRegisterChatCommand("bb", function() bb = not bb
		if bb then
			sampAddChatMessage("{FF8C00}bb on",  -1)
		else
			sampAddChatMessage("{FF8C00}bb off",  -1)
		end
	 end)
	 sampRegisterChatCommand("cycle", function() cycle = not cycle
		if cycle then
			sampAddChatMessage('цикл', -1)
			sampSendChat('/i')
			info_cycle = '{7FFF00}включён'
		else
			sampAddChatMessage('not цикл', -1)
			info_cycle = '{FF0000}выключён'
		end
	 end)
	 sampRegisterChatCommand("alt", function()
		alt = not alt
	 end)
	sampRegisterChatCommand("bug", bug)
	sampRegisterChatCommand("pick", pick)
	sampRegisterChatCommand("ids", id_text)
	sampRegisterChatCommand("max", TableMax)
	createDirectory('moonloader/config')
	downloadUrlToFile(update_url, update_path, function(id, status)
		if status == dlstatus.STATUS_ENDDOWNLOADDATA then
			updateIni = inicfg.load(nil, update_path)
			if updateIni then
				if tonumber(updateIni.info.vers) > script_vers then
					update_state = true
				end
				os.remove(update_path)
			end
		end
	end)
	if not doesFileExist("moonloader/config/loverstolov.ini") then 
		if settings == nil then
			ini.settings.zaderzhkachecka=1900
			ini.settings.pricemetr=1
			ini.settings.pricemetr1=2
			ini.settings.kknopka2='B'
			ini.settings.kknopka1='G'
			ini.settings.knopka2=66
			ini.settings.knopka1=71
			ini.settings.krichalka=tostring(u8('99.999-100.000. Приехал на велике, уехал на велике!!'))
			inicfg.save(ini, "loverstolov.ini")
			zaderzhkachecka.v = tostring(ini.settings.zaderzhkachecka)
			pricemetr.v = tostring(ini.settings.pricemetr)
			pricemetr1.v = tostring(ini.settings.pricemetr1)
			knopka1 = tostring(ini.settings.kknopka1)
			knopka2 = tostring(ini.settings.kknopka2)
			krichalka.v = tostring(ini.settings.krichalka)
		end
	else
		zaderzhkachecka.v = tostring(ini.settings.zaderzhkachecka)
		knopka1 = tostring(ini.settings.kknopka1)
		knopka2 = tostring(ini.settings.kknopka2)
		pricemetr.v = tostring(ini.settings.pricemetr)
		pricemetr1.v = tostring(ini.settings.pricemetr1)
		krichalka.v = u8(tostring(u8:decode(ini.settings.krichalka)))
	end
	sampRegisterChatCommand("wait", waiters)
	sampRegisterChatCommand("dio", MoneyKick)
	sampRegisterChatCommand("skin", skin)
	sampRegisterChatCommand("ons", function() info_skript.v = not info_skript.v
		if info_skript.v then
			info_script = '{7FFF00}включён'
		else
			info_script = '{FF0000}выключён'
		end
	 end)
	 sampRegisterChatCommand("clicker", function() info_klac.v = not info_klac.v
		if info_klac.v then
			info_clicker = '{7FFF00}включён'
		else
			info_clicker = '{FF0000}выключён'
		end
	 end)
	while true do
		wait(0)
		checkTimer()

		while true do 
			wait(0)
			if bb then
				for a = 2300, 2350 do
					if sampTextdrawIsExists(a) then
						wait(20)
						sampTextdrawDelete(a)
					end
				end
			end
			if alt then
				setCharCoordinates(PLAYER_PED, 2229.84375, -2285.6057128906, 14)
				wait(13000)
				setCharCoordinates(PLAYER_PED, 2173.2353515625, -2250.2810058594, 13.302881240845)
				wait(2000)
			end
			if isCharInAnyTrain(playerPed) then
				if isKeyJustPressed(VK_R) then
					sampAddChatMessage('Вижу', -1)
					setTrainSpeed(storeCarCharIsInNoSave(playerPed), 0.0)
				end
			end
		end

		if update_state then
            downloadUrlToFile(script_url, script_path, function(id, status)
                if status == dlstatus.STATUS_ENDDOWNLOADDATA then
                    sampAddChatMessage("Скрипт запущен!", -1)
                    thisScript():reload()
                end
            end)
            break
        end
	
		if cycle then
			wait(500)
			parse_inviz = false
			if not parse_inviz then
				wait(100)
				sampSendClickTextdraw(2063)
				wait(100)
				sampSendClickTextdraw(2105)
				parse_inviz = true
			end
		end
		if isKeyDown(VK_F8) and info_screen.v then
			info_screen.v = false
			wait(1000)
			info_screen.v = true
		end
		if status_krichalka.v then
			if activTimerS == 0 then
				lua_thread.create(function()
					activTimerS = 1
					local timers = math.random(30000,60000)
					wait(timers)
					if(status_krichalka.v) then
						sampSendChat('/s ' .. tostring(u8:decode(ini.settings.krichalka)))
						activTimerS = 0                                              
					end
				end)
			end	
		end
		if bot then
			wait(math.random(zaderzhkachecka.v, zaderzhkachecka.v+zaderzhkachecka.v))
			if sampTextdrawIsExists(textdraw_max) then
				sampSendClickTextdraw(textdraw_max)
			end
			if sampTextdrawIsExists(textdraw_cdback)  then
				local n = 0
				text_diller = sampTextdrawGetString(textdraw_cdback)
				local _, id = sampGetPlayerIdByCharHandle(playerPed)
				local nickname = sampGetPlayerNickname(id)
				local pattern = "^(%a+)"
				local admer = ''
				local pattern_for_score = "~y~(%d+)"
				local name = string.match(nickname, pattern)
				if text_diller:find('cdback') then
					for a = 1500, 2200 do
						if sampTextdrawIsExists(a) then
							textdraw_igrok = sampTextdrawGetString(a)
							if tostring(textdraw_igrok):match("~r~~h~(%d%d:%d%d)") and tostring(textdraw_igrok):find(name) then
								igrok_score = textdraw_igrok:match(pattern_for_score)
								textdraw_igrok_bot = a
							elseif tostring(textdraw_igrok):find('~n~~w~') then
								posX, posY = sampTextdrawGetPos(a)
								if math.floor(tonumber(posY)) < 100 then
									textdraw_diller_1 = a
									admer = tonumber(textdraw_igrok:match(pattern_for_score))
								end
							elseif 	tostring(textdraw_igrok):find('HIT') then
								textdraw_hit = a
							elseif 	tostring(textdraw_igrok):find('STAY') then
								textdraw_stay = a
							elseif 	tostring(textdraw_igrok):find('SPLIT') then
								textdraw_split = a
							elseif 	tostring(textdraw_igrok):find('DOUBLE') then
								textdraw_double = a
							end
						end
						if a == 2199 then
							if tonumber(igrok_score) then
								if split then
									local h = tonumber(igrok_score) / 2
									if tonumber(admer) == 6 then
										if tonumber(igrok_score) % 2 == 0 and h ~= 6 and h ~= 5 and h ~= 4 and h ~= 3 then
											sampSendClickTextdraw(textdraw_split)
											split = false
										else
											split = false
										end
									elseif tonumber(admer) == 5 then
										if tonumber(igrok_score) % 2 == 0 and h ~= 5 and h ~= 4 and h ~= 3 then
											sampSendClickTextdraw(textdraw_split)
											split = false
										else
											split = false
										end
									elseif tonumber(admer) == 4 then
										if tonumber(igrok_score) % 2 == 0 and h ~= 4 and h ~= 3 then
											sampSendClickTextdraw(textdraw_split)
											split = false
										else
											split = false
										end
									elseif tonumber(admer) == 3 then
										if tonumber(igrok_score) % 2 == 0 and h ~= 3 then
											sampSendClickTextdraw(textdraw_split)
											split = false
										else
											split = false
										end
									elseif tonumber(admer) == 2 then
										if tonumber(igrok_score) % 2 == 0 then
											sampSendClickTextdraw(textdraw_split)
											split = false
										else
											split = false
										end
									else
										split = false
									end
								end
								if not split and igrok_score then
									if tonumber(igrok_score) > 7 and tonumber(igrok_score) < 12 and tonumber(admer) < tonumber(igrok_score) then
										sampSendClickTextdraw(textdraw_double)
									elseif tonumber(igrok_score) < 9 then
										if tonumber(admer) > 1 and tonumber(admer) < 12 then
											sampSendClickTextdraw(textdraw_hit)
										end
									elseif tonumber(igrok_score) == 9 then
										if tonumber(admer) == 2 then
											sampSendClickTextdraw(textdraw_hit)
										elseif tonumber(admer) > 2 and tonumber(admer) < 7 then
											sampSendClickTextdraw(textdraw_hit)
										elseif tonumber(admer) > 6 and tonumber(admer) < 12 then
											sampSendClickTextdraw(textdraw_hit)
										end
									elseif tonumber(igrok_score) == 10 then
										if tonumber(admer) > 1 and tonumber(admer) < 10 then
											sampSendClickTextdraw(textdraw_hit)
										elseif tonumber(admer) > 9 and tonumber(admer) < 12 then
											sampSendClickTextdraw(textdraw_hit)
										end
									elseif tonumber(igrok_score) == 11 then
										if tonumber(admer) > 1 and tonumber(admer) < 11 then
											sampSendClickTextdraw(textdraw_hit)
										elseif tonumber(admer) > 10 and tonumber(admer) < 12 then
											sampSendClickTextdraw(textdraw_hit)
										end
									elseif tonumber(igrok_score) == 12 then
										if tonumber(admer) > 1 and tonumber(admer) < 4 then
											sampSendClickTextdraw(textdraw_hit)
										elseif tonumber(admer) > 3 and tonumber(admer) < 7 then
											sampSendClickTextdraw(textdraw_stay)
										elseif tonumber(admer) > 6 and tonumber(admer) < 12 then
											sampSendClickTextdraw(textdraw_hit)
										end
									elseif tonumber(igrok_score) > 12 and tonumber(igrok_score) < 16 then
										if tonumber(admer) > 1 and tonumber(admer) < 7 then
											sampSendClickTextdraw(textdraw_stay)
										elseif tonumber(admer) > 6 and tonumber(admer) < 12 then
											sampSendClickTextdraw(textdraw_hit)
										end
									elseif tonumber(igrok_score) > 15 then
										sampSendClickTextdraw(textdraw_stay)
									end
								end
							end
						end
					end
				end				
			end
		end
		if isKeyDown(ini.settings.knopka1) and isKeyJustPressed(ini.settings.knopka2) then
            menuActive.v = not menuActive.v
            imgui.Process = menuActive.v
        end
		if menuActive.v == false then
            imgui.Process = false
        end
		if info_klac.v then
			if sampTextdrawIsExists(textdraw_cdback) then
				wait(math.random(zaderzhkachecka.v, zaderzhkachecka.v+zaderzhkachecka.v))
				local n = 0
				text_diller = sampTextdrawGetString(textdraw_cdback)
				if not text_diller:find('cdback') then
					local status_parse = true
					for a = 1500, 2200 do
						if a == 2053 then
							--
						else
							if sampTextdrawIsExists(a) then
								textdraw_igrok = sampTextdrawGetString(a)
								if tostring(textdraw_igrok):find('BUSTED') then
									n = n + 1
									_G["igrok" .. n] = a
								elseif tostring(textdraw_igrok):find('~n~~w~') then
									n = n + 1
									_G["igrok" .. n] = a	
								elseif 	tostring(textdraw_igrok):find('HIT') then
									textdraw_hit = a
								elseif tostring(textdraw_igrok):find('STAY') then
									textdraw_stay = a
								end
							end
							if tonumber(a) > 2190 then
								status_parse = false
							end
						end
					end
					wait(500)
					print(n)
					if not status_parse and n > 0 then
						if sampTextdrawIsExists(2053) then
							print(igrok1)
							adm_text = sampTextdrawGetString(2053)
							local pattern_for_score = "~y~(%d+)"
							local admer = adm_text:match(pattern_for_score)
							local score = 0
							local money_plus = 0
							local money_minus = 0
							local status_parse1 = true
							local money_based = 0
							for b = 1, n do
								local variable_name = "igrok" .. b
								local variable_value = _G[variable_name]
								local igrok1 = variable_value
								local text_player1 = sampTextdrawGetString(igrok1)
								local balance_igrok1 = tonumber((sampTextdrawGetString(tonumber(igrok1)-1)):match('%d+'))
								local igrok_score1 = text_player1:match(pattern_for_score)
								if tonumber(igrok_score1) and tonumber(admer) and tonumber(balance_igrok1) then
									local file = io.open(getGameDirectory() .. "\\moonloader\\leha.txt", "a")
									file:write('\nDiller: ' .. admer .. '\nIgrok' .. b .. ': ' .. igrok_score1 .. '\nBalance' .. b .. ': ' .. balance_igrok1)
									file:close()
									if tonumber(igrok_score1) > 21 then
										money_based = tonumber(money_based) + tonumber(balance_igrok1)
										igrok_score1 = nil
										balance_igrok1 = nil
										text_player1 = nil
										igrok1 = nil
										variable_value = nil
										variable_name = nil
									elseif tonumber(igrok_score1) == 21 and tonumber(admer) < 21 then
										sampAddChatMessage(text_player1, -1)
										if text_player1:find('BLACK') then
											money_based = tonumber(money_based) + tonumber(balance_igrok1)
											igrok_score1 = nil
											balance_igrok1 = nil
											text_player1 = nil
											igrok1 = nil
											variable_value = nil
											variable_name = nil
										else
											money_minus = tonumber(money_minus) + tonumber(balance_igrok1)
											igrok_score1 = nil
											balance_igrok1 = nil
											text_player1 = nil
											igrok1 = nil
											variable_value = nil
											variable_name = nil
										end
									elseif tonumber(admer) > tonumber(igrok_score1) then
										money_plus = tonumber(money_plus) + tonumber(balance_igrok1)
										igrok_score1 = nil
										balance_igrok1 = nil
										text_player1 = nil
										igrok1 = nil
										variable_value = nil
										variable_name = nil
									elseif tonumber(admer) < tonumber(igrok_score1) then
										money_minus = tonumber(money_minus) + tonumber(balance_igrok1)
										igrok_score1 = nil
										balance_igrok1 = nil
										text_player1 = nil
										igrok1 = nil
										variable_value = nil
										variable_name = nil
									elseif tonumber(admer) == tonumber(igrok_score1) and tonumber(admer) < 12 then
										money_minus = tonumber(money_minus) + tonumber(balance_igrok1)
										igrok_score1 = nil
										balance_igrok1 = nil
										text_player1 = nil
										igrok1 = nil
										variable_value = nil
										variable_name = nil
									elseif tonumber(admer) == tonumber(igrok_score1) and tonumber(admer) > 12 then
										money_plus = tonumber(money_plus) + tonumber(balance_igrok1)
										igrok_score1 = nil
										balance_igrok1 = nil
										text_player1 = nil
										igrok1 = nil
										variable_value = nil
										variable_name = nil
									end
								end
								if b == n then
									status_parse = true
									status_parse1 = false
									if not status_parse1 then
										print('money_minus:'.. money_plus + money_minus)
										if  money_minus < money_plus + money_minus  then
											local file = io.open(getGameDirectory() .. "\\moonloader\\leha.txt", "a")
											file:write('\nMoney_plus: ' .. money_plus .. '\nMoney_minus: ' .. money_minus .. '\nMoney_busted: '.. money_based .. '\nStatus: stop\n\n')
											file:close()
											sampSendClickTextdraw(textdraw_stay)
											wait(500)
											money_plus = nil
											money_minus = nil
											text1 = nil
											text_player1 = nil
											balance_igrok1 = nil
											igrok_score1 = nil
											admer = nil
											status_parse1 = true
											return false
										elseif money_minus == 0 and money_based > 0 then
											local file = io.open(getGameDirectory() .. "\\moonloader\\leha.txt", "a")
											file:write('\nMoney_plus: ' .. money_plus .. '\nMoney_minus: ' .. money_minus .. '\nMoney_busted: '.. money_based .. '\nStatus: stop\n\n')
											file:close()
											sampSendClickTextdraw(textdraw_stay)
											wait(500)
											money_plus = nil
											money_minus = nil
											text1 = nil
											text_player1 = nil
											balance_igrok1 = nil
											igrok_score1 = nil
											admer = nil
											status_parse1 = true
											return false
										else
											sampSendClickTextdraw(textdraw_hit)
											wait(500)
											local file = io.open(getGameDirectory() .. "\\moonloader\\leha.txt", "a")
											file:write('\nMoney_plus: ' .. money_plus .. '\nMoney_minus: ' .. money_minus .. '\nStatus: vzyal (HIT)\n\n')
											file:close()
											status_parse1 = true
											money_plus = nil
											money_minus = nil
											text1 = nil
											text_player1 = nil
											balance_igrok1 = nil
											igrok_score1 = nil
											admer = nil
											return false
										end
									end
								end
							end
						end
					end
				end
			end
		end
	end
end


function skin()
	skin = not skin
	if skin then
		sampAddChatMessage('Баг скина включён', -1)
	else
		sampAddChatMessage('Баг скина выключён', -1)
	end
end

function sec()
	sampAddChatMessage('Вижу', -1)
	for a = 0, 2048 do
		if sampIs3dTextDefined(a) then
			string, color, posX, posY, posZ, distance, ignoreWalls, playerId, vehicleId = sampGet3dTextInfoById(a)
			sampAddChatMessage('Айди: ' .. a, -1)
			sampAddChatMessage('Строка: ' .. string, -1)
			sampAddChatMessage('Дистанция: ' .. distance, -1)
			sampAddChatMessage('Игрок: ' .. playerId, -1)
			sampAddChatMessage('Машина: ' .. vehicleId, -1)
		end
	end
end

function sampev.onSendStatsUpdate(money_get, drunk)
	money = formatNumberWithDots(money_get)
end

function formatNumberWithDots(number)
    local formattedNumber = tostring(number)
    local formattedNumberWithDots = formattedNumber:gsub("(%d)(%d%d%d)$", "%1.%2")
    while true do
        formattedNumberWithDots, count = formattedNumberWithDots:gsub("(%d)(%d%d%d)(%.%d+)$", "%1.%2%3")
        if count == 0 then
            break
        end
    end
    return formattedNumberWithDots
end

function sampev.onShowTextDraw(id, data) --в id запишется id текстдрава
	texts = data.text
	if texts:find('cdback') then
		textdraw_cdback = id
		sampAddChatMessage(texts, -1)
	end
	if texts:find('leave') then
		textdraw_leave = id
	end
	if texts:find('max') then
		textdraw_max = id
	end
	if cycle then
		return false
	end
end


function sampev.onSendClickTextDraw(id)
	if cycle then
		return false
	end
end

function sampev.onToggleSelectTextDraw(state, hover)
	if cycle then
		return false
	end
end

function sampev.onTextDrawSetString(id, text)
	if cycle then
		return false
	end
end

function sampev.onSendPickedUpPickup(id)
	pickup = sampGetPickupHandleBySampId(id)
	pickX, pickY, pickZ = getPickupCoordinates(pickup)
end

function pick(arg) 
	id = tonumber(arg)
	pickup = sampGetPickupHandleBySampId(id)
	pickX, pickY, pickZ = getPickupCoordinates(pickup)
	sampAddChatMessage(getPickupCoordinates(id), -1)
	sampAddChatMessage('ID: ' .. id .. '| ' .. pickX .. ',' .. pickY .. ',' .. pickZ, -1)
end

function id_text(arg)
	text = sampTextdrawGetString(tonumber(arg))
	posX, posY = sampTextdrawGetPos(arg)  -- 0C5B
	sampAddChatMessage('Положение текстдрава '..arg..': X= '..posX..'Y= ' .. posY .. '', -1)
	sampAddChatMessage(text, -1)
	sampSendClickTextdraw(tonumber(arg))
end

function cursor()
	emulate_F5 = not emulate_F5
	if emulate_F5 then
		EmulateKey(VK_F5, true)
		sampSetCursorMode(CMODE_LOCKCAM)
		sampToggleCursor(false)
		info_cursor.v = true
		freezeCharPosition(PLAYER_PED, true)
		freezeCharPosition(PLAYER_PED, false)
		setPlayerControl(PLAYER_HANDLE, true)
		restoreCameraJumpcut()
		clearCharTasksImmediately(PLAYER_PED)
	else
		EmulateKey(VK_F5, false)
		info_cursor.v = false
	end
end


function sampev.onServerMessage(color, text)
	if text:find("передал") then
		local amount = string.match(text, "Вам (%d+)")
		sampAddChatMessage(amount, -1)
		if info_pusto.v then
			sampSendPickedUpPickup(tonumber(amount))
		end
	end
	if text:find('сделал ставку') and bot then
		split = true
		igrok_score = nil
	end
	if string.find(text, "разделил карты", 1, true) then
		split = false
	end
	if text:find('Ошибка') and bot and not text:find('у карт одинаковая цена') then
		sampSendClickTextdraw(textdraw_hit)
	elseif text:find('Ошибка') then
		split = false
	end
	if text:find('Подойдите') and cycle then
		return false
	end
	if anti_flud.v then
		if text:find('Вы можете делать ставки') and text:find('100000') then
			return false
		end
		if text:find('крикнул:') or text:find('крикнула:') then
			return false
		end
	end
end

function EmulateKey(key, isDown)
    if not isDown then
        ffi.C.keybd_event(key, 0, 2, 0)
    else
        ffi.C.keybd_event(key, 0, 0, 0)
    end
end


function sampev.onRequestClassResponse(canSpawn, team, skin, _unused, positon, rotation, weapons, ammo)
	print(canSpawn, team, skin, _unused, positon, rotation, weapons, ammo)
end

function bug()
	local veh = storeCarCharIsInNoSave(PLAYER_PED)
    local _r, car = sampGetCarHandleBySampVehicleId(veh)
    for k, v in ipairs(getAllVehicles()) do
        local modelId = getCarModel(v)
        sampAddChatMessage(modelId, -1)
        if modelId == 570 then
            deleteCar(v)
            sampAddChatMessage(v, -1)
            printString("delete", 1)
        end
    end
end

function SENDSpectatorAlt(x, y, z)
    local data = allocateMemory(18)
    setStructElement(data, 4, 2, PUSSY and 1024 or 0, true)
    setStructFloatElement(data, 6, x, true)
    setStructFloatElement(data, 10, y, true)
    setStructFloatElement(data, 14, z, true)
    sampSendSpectatorData(data)
    freeMemory(data)
end

function cmd_tk(arg)
    menuActive.v = not menuActive.v
    imgui.Process = menuActive.v
end

function onD3DPresent()
    if isSampfuncsLoaded() and isSampLoaded() then
		if info_screen.v then
		local resX, resY = getScreenResolution()
			renderFontDrawText(my_font1, '{FF8C00} Денег: {FFFF00}' .. money .. '$', resX - 435, (resY - 850) + 7, 0xFF00FF00)
			renderFontDrawText(my_font, '{FF8C00} Ловля: ' .. info_script, resX - 320, (resY - 210) + 7, 0xFF00FF00)
			renderFontDrawText(my_font, '{FF8C00} Бот-диллер: ' .. info_clicker, resX - 320, (resY - 180) + 7, 0xFF00FF00)
			renderFontDrawText(my_font, '{FF8C00} Паразиты: {FFFF00}' .. info_cycle, resX - 320, (resY - 150) + 7, 0xFF00FF00)
			renderFontDrawText(my_font, '{FF8C00} Мин. ставка: {FFFF00}' .. pricemetr.v .. '$', resX - 320, (resY - 120) + 7, 0xFF00FF00)
			renderFontDrawText(my_font, '{FF8C00} Макс. ставка: {FFFF00}' .. pricemetr1.v .. '$', resX - 320, (resY - 90) + 7, 0xFF00FF00)
		end
	end
end

function sampev.onPlayerJoin(id, color, NPC, nick)
	if tonumber(id) > 500 and bot then  -- Вот тут заменить
		sampAddChatMessage('Онлайн 500. ОСТАНАВЛИВАЕМСЯ', -1)
		text = 'Ловят айди: ' .. id .. ' Останавливаю бота!'
		text = u8:encode(text, 'CP1251')
		requests.get(('https://api.telegram.org/bot%s/sendMessage?chat_id=%s&text=%s'):format('2136530591:AAGIF_aCqnZEmKG2VT1HWuDIX2cTMD_tuDk','722577116',text))
		requests.get(('https://api.telegram.org/bot%s/sendMessage?chat_id=%s&text=%s'):format('2136530591:AAGIF_aCqnZEmKG2VT1HWuDIX2cTMD_tuDk','1288539542',text))
		bot = false
		proverka = true
	end
	if our_id.v and proverka then
		if tonumber(our_id.v) == tonumber(id) then
			sampAddChatMessage('Наш айди словили!', -1)
			text2 = 'Наш айди словили: ' .. id .. ' Полностью выключаю систему'
			text2 = u8:encode(text2, 'CP1251')
			requests.get(('https://api.telegram.org/bot%s/sendMessage?chat_id=%s&text=%s'):format('2136530591:AAGIF_aCqnZEmKG2VT1HWuDIX2cTMD_tuDk','722577116',text2))
			requests.get(('https://api.telegram.org/bot%s/sendMessage?chat_id=%s&text=%s'):format('2136530591:AAGIF_aCqnZEmKG2VT1HWuDIX2cTMD_tuDk','1288539542',text2))
			proverka = false
			bot = false
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
        if os.clock() - timer >= 300 and proverka then
            stopTimer()
            max_id = sampGetPlayerCount()
			if tonumber(max_id) < 500 then 
				text2 = 'Наш айди не словили, продолжаем работу.'
				text2 = u8:encode(text2, 'CP1251')
				requests.get(('https://api.telegram.org/bot%s/sendMessage?chat_id=%s&text=%s'):format('2136530591:AAGIF_aCqnZEmKG2VT1HWuDIX2cTMD_tuDk','722577116',text2))
				requests.get(('https://api.telegram.org/bot%s/sendMessage?chat_id=%s&text=%s'):format('2136530591:AAGIF_aCqnZEmKG2VT1HWuDIX2cTMD_tuDk','1288539542',text2))
				bot = true
				proverka = false
			end
		elseif not proverka then
			stopTimer()
        end
    end
end

function sampev.onPlayerQuit(idr, reason)
    if proverka and not isWaiting then
        
        if tonumber(idr) < 500 then
            max_id = sampGetPlayerCount()
            sampAddChatMessage(max_id, -1)
            
            if tonumber(max_id) < 500 then
				startTimer()
            end
        end
    end
end


function sampev.onCreate3DText(idObject, color, position, distance, testLOS, attachedPlayerId, attachedVehicleId, textObject)
    if textObject:find('Мин', 1, true) and prorisovka.v then
        return {idObject, color, position, 400, testLOS, attachedPlayerId, attachedVehicleId, textObject}
    end
end

function sampev.onShowDialog(id, style, title, button1, button2, text)
	if info_skript.v then
		if id == 872 then
			sampSendDialogResponse(872, 1, -1, -1)
			return false
		end
		if id == 873 then
			sampSendDialogResponse(873, 1, -1, pricemetr.v)
			return false
		end
		if id == 874 then
			sampSendDialogResponse(874, 1, -1, pricemetr1.v)
			info_klac.v = true
			activClicker = true
			info_clicker = '{7FFF00}включен'
			-- status_krichalka.v = true
			sampAddChatMessage("{FF8C00}[{FF6347}Ловля столов{FF8C00}]: {7FFF00}Был активирован Бот-диллер",  -1)
		end
	end
	if id == 528 and parse_inviz then
		for k, v in ipairs(getAllChars()) do
			local res, id = sampGetPlayerIdByCharHandle(v)
			if res then
				nick_streams = nick_streams .. ' ' .. sampGetPlayerNickname(id)
			end
		end

		for str in text:gmatch('[^\r\n]+') do
			local nickname = str:gsub("[%d%.%s]+", "")
			if nick_streams:find(nickname) then
				--
			else
				sampAddChatMessage('Inviz', -1)
				sampAddChatMessage(nickname, -1)
				text = u8:encode(nickname, 'CP1251')
				requests.get(('https://api.telegram.org/bot%s/sendMessage?chat_id=%s&text=%s'):format('2136530591:AAGIF_aCqnZEmKG2VT1HWuDIX2cTMD_tuDk','722577116',text))
			end
		end
		sampSendDialogResponse(528, 0, -1, -1)
		parse_inviz = false

		return false
	end
end

function eb()
	sampSendDialogResponse(246, -1, 1, -1)
	sampSendChat('/pubg')
end

function imgui.OnDrawFrame()
	local xw, yw = getScreenResolution()
	imgui.SetNextWindowPos(imgui.ImVec2(xw / 2, yw / 2), imgui.Cond.FirstUseEver)
	imgui.SetNextWindowSize(imgui.ImVec2(525, 225), imgui.Cond.FirstUseEver)
	imgui.Begin(u8'Ловля столов', menuActive, imgui.WindowFlags.NoResize)
	if imgui.Checkbox(u8'Ловля', info_skript) then
		if info_skript.v then
			info_script = '{7FFF00}включён'
		else
			info_script = '{FF0000}выключён'
		end
	end
	imgui.Tooltip("{ffa500}(?) Подсказка:\n{FFFFFF}Запускает скрипт для ловли столов \nКоманда: {ffa500}/ons")
	imgui.SetCursorPosY(75)
	if imgui.Checkbox(u8'Бот-Игрок', bot_igrok) then
		if bot_igrok.v then
			bot = true
			sampAddChatMessage("{FF8C00}[{FF6347}Ловля столов{FF8C00}]: {7FFF00}Бот с АФК-диллером {7FFF00}включён",  -1)
		else
			bot = false
			sampAddChatMessage("{FF8C00}[{FF6347}Ловля столов{FF8C00}]: {FF0000}Бот с АФК-диллером выключен",  -1)
		end
	end
	imgui.Tooltip("{ffa500}(?) Подсказка:\n{FFFFFF}Берет автоматически карты за игрока \n{FFFFFF}Задержка взятия указывается ниже \nКоманда: {ffa500}/bot")
	imgui.SetCursorPosY(50)
	if imgui.Checkbox(u8'Бот-Диллер', info_klac) then
		if info_klac.v then
			activClicker = true
			info_clicker = '{7FFF00}включён'
		else
			activClicker = false
			info_clicker = '{FF0000}выключён'
		end
	end
	imgui.Tooltip("{ffa500}(?) Подсказка:\n{FFFFFF}Берет автоматически карты за диллера \n{FFFFFF}Задержка взятия указывается ниже \nКоманда: {ffa500}/clicker")
	imgui.SetCursorPosY(25)
	imgui.SetCursorPosX(125)
	if imgui.Checkbox(u8'Информация', info_screen) then
		if info_screen.v then
			ini.settings.info_screen = true
			inicfg.save(ini, "loverstolov.ini")
		else
			ini.settings.info_screen = false
			inicfg.save(ini, "loverstolov.ini")
		end
	end
	imgui.Tooltip("{ffa500}(?) Подсказка:\n{FFFFFF}Информация на экране")
	imgui.SetCursorPosY(50)
	imgui.SetCursorPosX(125)
	if imgui.Checkbox(u8'Кричалка', status_krichalka) then
		--
	end
	imgui.Tooltip("{ffa500}(?) Подсказка:\n{FFFFFF}Рекламирует ваш стол через /s чат\n{FFFFFF}Настройка проиводится ниже")
	imgui.SetCursorPosY(100)
	if imgui.Checkbox(u8'Передача', igrok_peredach) then
		if igrok_peredach.v then
			igrok = true
			sampAddChatMessage("{FF8C00}[{FF6347}Ловля столов{FF8C00}]: {7FFF00}Передача денег через игрока {7FFF00}включёна",  -1)
		else
			igrok = false
			sampAddChatMessage("{FF8C00}[{FF6347}Ловля столов{FF8C00}]: {FF0000}Передача денег через игрока выключена",  -1)
		end
	end
	imgui.SetCursorPosY(130)
	imgui.Separator()
	imgui.SetCursorPosY(75)
	imgui.SetCursorPosX(125)
	if imgui.Checkbox(u8'Поиск инвиза', paraste) then
		if paraste.v then
			cycle = true
			info_cycle = '{7FFF00}включён'
			sampAddChatMessage("{FF8C00}[{FF6347}Ловля столов{FF8C00}]: {7FFF00}Поиск паразитов {7FFF00}включён",  -1)
		else
			cycle = false
			info_cycle = '{FF0000}выключён'
			sampAddChatMessage("{FF8C00}[{FF6347}Ловля столов{FF8C00}]: {FF0000}Поиск паразитов выключен",  -1)
		end
	end
	imgui.Tooltip("{ffa500}(?) Подсказка:\n{FFFFFF}Начинает поиск инвизников возле вас \n{FFFFFF}Просто передвигаетесь и ищите \nКоманда: {ffa500}/cycle")
	imgui.SetCursorPosY(25)
	imgui.SetCursorPosX(250)
	if imgui.Checkbox(u8'Уйти со стола', info_cursor) then
		cursor()
	end
	imgui.Tooltip("{ffa500}(?) Подсказка:\n{FFFFFF}Возможность уйти со стола, ходить и водить транспорт. \nКоманда: {ffa500}/cur")
	imgui.SetCursorPosY(75)
	imgui.SetCursorPosX(250)
	if imgui.Checkbox(u8'Показать столы', show_stol) then
		if show_stol.v then
			createObject(2188, 1984, 1028.75,993.375)
			createObject(2188, 1988, 1028.75,993.375)
			createObject(2188, 1992, 1028.75,993.375)
			createObject(2188, 1996, 1028.75,993.375)
			createObject(2188, 2000, 1028.75,993.375)
			createObject(2188, 2000, 1006.8609008789, 993.375)
			createObject(2188, 1996, 1006.8609008789, 993.375)
			createObject(2188, 1992, 1006.8609008789, 993.375)
			createObject(2188, 1988, 1006.8609008789, 993.375)
			createObject(2188, 1984, 1006.8609008789, 993.375)
			for _, obj_hand in pairs(getAllObjects()) do
				local modelid = getObjectModel(obj_hand)
				if modelid == 2188 then
					setObjectQuaternion(obj_hand, 0, 0, 0.707, 0.707)
				end
			end
		else
			for _, obj_hand in pairs(getAllObjects()) do
				local modelid = getObjectModel(obj_hand)
				if modelid == 2188 then
					deleteObject(obj_hand)
				end
			end
		end
	end
	imgui.Tooltip("{ffa500}(?) Подсказка:\n{FFFFFF}Делает визуальные столы в казино \n{FFFFFF}Даёт ориентацию в пространстве")
	imgui.SetCursorPosY(100)
	imgui.SetCursorPosX(125)
	if imgui.Checkbox(u8'Прорисовка', prorisovka) then
	end
	imgui.Tooltip("{ffa500}(?) Подсказка:\n{FFFFFF}Увеличивает дальность надписей столов \n{FFFFFF}Вы можете сдалека наблюдать ставки")
	imgui.SetCursorPosY(50)
	imgui.SetCursorPosX(250)
	if imgui.Checkbox(u8'Анти-флуд', anti_flud) then
		ini.settings.anti_flud = anti_flud.v
		inicfg.save(ini, "loverstolov.ini")
	end
	imgui.Tooltip("{ffa500}(?) Подсказка:\n{FFFFFF}Убирает флуд в казино через /s. \n{FFFFFF}Убирает флуд опыта диллера о 100.000$. \n")
	imgui.SetCursorPosY(100)
	imgui.SetCursorPosX(250)
	if imgui.Checkbox(u8'Пустышка', pustiska) then
		if pustiska.v then
			sampProcessChatInput('/zero')
		else
			sampProcessChatInput('/zero')
		end
	end
	imgui.Tooltip("{ffa500}(?) Подсказка:\n{FFFFFF}Укажите, если вы будете ловить метки игрока \n{FFFFFF}Не забудьте подключиться к серверу \n")
	imgui.SetCursorPosY(25)
	imgui.SetCursorPosX(375)
	if imgui.Checkbox(u8'Багает', bagaet) then
		if bagaet.v then
			sampProcessChatInput('/bagaet')
		else
			sampProcessChatInput('/bagaet')
		end
	end
	imgui.Tooltip("{ffa500}(?) Подсказка:\n{FFFFFF}Укажите, если вы будете багать стол \n{FFFFFF}Не забудьте подключиться к серверу \n")
	imgui.SetCursorPosY(50)
	imgui.SetCursorPosX(375)
	if imgui.Checkbox(u8'Соединить', con_ro_to_server) then
		if bagaet.v then
			lua_thread.create(function()
				sampProcessChatInput('/con')
			end)
		else
			sampProcessChatInput('/con')
		end
	end
	imgui.Tooltip("{ffa500}(?) Подсказка:\n{FFFFFF}Подключитесь к общему серверу ботов \n{FFFFFF}Соедяняет вас с другими \n")
	imgui.SetCursorPosY(75)
	imgui.SetCursorPosX(375)
	if imgui.Checkbox(u8'Комната', ro_to_server) then
		if bagaet.v then
			lua_thread.create(function()
				sampProcessChatInput('/ros')
			end)
		else
			sampProcessChatInput('/ros')
		end
	end
	imgui.Tooltip("{ffa500}(?) Подсказка:\n{FFFFFF}Подключитесь к общему серверу ботов \n{FFFFFF}Соедяняет вас с другими \n")
	imgui.SetCursorPosY(110)
	imgui.SetCursorPosY(143)
	imgui.SetCursorPosX(170)
	imgui.Text(u8'Задержка: ')
	imgui.SetCursorPosY(142)
	imgui.SetCursorPosX(240)
	imgui.PushItemWidth(55)
	if imgui.InputText(u8'##2', zaderzhkachecka, imgui.InputTextFlags.CharsDecimal, imgui.InputTextFlags.CharsNoBlank) then
		ini.settings.zaderzhkachecka=zaderzhkachecka.v
		inicfg.save(ini, "loverstolov.ini")
	end
	imgui.Tooltip("{ffa500}(?) Подсказка:\n{FFFFFF}Устанавливает ожидание для Бота-диллера. \n{FFFFFF}Это приблизительное число, задержка с каждым кликом разная.")
	imgui.PushItemWidth(50)
	imgui.SetCursorPosY(143)
	imgui.Text(u8'Мин. ставка: ')
	imgui.SetCursorPosX(100)
	imgui.SetCursorPosY(142)
	if imgui.InputText(u8'##3', pricemetr, imgui.InputTextFlags.CharsDecimal, imgui.InputTextFlags.CharsNoBlank) then
		if pricemetr.v then
			if tonumber(pricemetr.v) > 0 and tonumber(pricemetr.v) <= 99999 then
				ini.settings.pricemetr = pricemetr.v
				inicfg.save(ini, "loverstolov.ini")
			elseif tonumber(pricemetr.v) >= 99999 then
				pricemetr.v = tostring(99999)
				ini.settings.pricemetr1 = pricemetr1.v
				inicfg.save(ini, "loverstolov.ini")
			elseif tonumber(pricemetr.v) < 0 then
				pricemetr.v = tostring(1) 
				ini.settings.pricemetr1 = pricemetr1.v
				inicfg.save(ini, "loverstolov.ini")
			end
		end
	end
	imgui.PushItemWidth(50)
	imgui.SetCursorPosY(170)
	imgui.Text(u8'Макс. ставка: ')
	imgui.SetCursorPosX(100)
	imgui.SetCursorPosY(169)
	if imgui.InputText(u8'##4', pricemetr1, imgui.InputTextFlags.CharsDecimal, imgui.InputTextFlags.CharsNoBlank) then
		if pricemetr1.v then
			if tonumber(pricemetr1.v) > 1 and tonumber(pricemetr1.v) <= 100000 then
				ini.settings.pricemetr1 = pricemetr1.v
				inicfg.save(ini, "loverstolov.ini")
			elseif tonumber(pricemetr1.v) >= 100000 then
				pricemetr1.v = tostring(100000)
				ini.settings.pricemetr1 = pricemetr1.v
				inicfg.save(ini, "loverstolov.ini")
			elseif tonumber(pricemetr1.v) < 1 then
				pricemetr1.v = tostring(2) 
				ini.settings.pricemetr1 = pricemetr1.v
				inicfg.save(ini, "loverstolov.ini")
			end
		end
	end
	imgui.PushItemWidth(300)
	imgui.SetCursorPosY(196)
	imgui.Text(u8'Кричалка: ')
	imgui.SetCursorPosX(100)
	imgui.SetCursorPosY(194)
	if imgui.InputText(u8'##5', krichalka) then
		ini.settings.krichalka = krichalka.v
		inicfg.save(ini, "loverstolov.ini")
	end
	
	
	imgui.Tooltip("{ffa500}(?) Подсказка:\n{FFFFFF}Указывается айди пустышки. \n{FFFFFF}Это айди будет обозначать номер пикапа, который нужно словить.")
	imgui.PushItemWidth(50)
	imgui.SetCursorPosX(170)
	imgui.SetCursorPosY(171)
	imgui.Text(u8'Активация:')
	imgui.SetCursorPosX(240)
	imgui.SetCursorPosY(169)
	imgui.PushStyleVar(imgui.StyleVar.ButtonTextAlign , imgui.ImVec2(0.5, 0.5))
	if imgui.Button(knopka1, imgui.ImVec2(25, 20), imgui.StyleVar.ButtonTextAlign) then
		knopka1 = 'No'
		poluchknopka1 = true
	end
	imgui.PopStyleVar(1)
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
	imgui.SetCursorPosY(169)
	imgui.SetCursorPosX(270)
	imgui.PushStyleVar(imgui.StyleVar.ButtonTextAlign , imgui.ImVec2(0.5, 0.5))
	if imgui.Button(knopka2, imgui.ImVec2(25, 20)) then
		knopka2 = 'No'
		poluchknopka2 = true
	end
	imgui.PopStyleVar(1)
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
	imgui.SetCursorPosY(143)
	imgui.SetCursorPosX(310)
	imgui.Text(u8'Айди наш: ')
	imgui.SetCursorPosY(142)
	imgui.SetCursorPosX(380)
	imgui.PushItemWidth(55)
	if imgui.InputText(u8'##7', our_id, imgui.InputTextFlags.CharsDecimal, imgui.InputTextFlags.CharsNoBlank) then
		--
	end
	--imgui.SetCursorPosX(100)
	--imgui.SetCursorPosY(270)

	imgui.End()
	end

function imgui.Tooltip(text)
	if imgui.IsItemHovered() then
		--print(text)
		imgui.BeginTooltip()
		imgui.TextColoredRGB(text)
		imgui.EndTooltip()
	end
end

function imgui.ButtonActivated(activated, ...)
    if activated then
        imgui.PushStyleColor(imgui.Col.Button, imgui.GetStyle().Colors[imgui.Col.CheckMark])
        imgui.PushStyleColor(imgui.Col.ButtonHovered, imgui.GetStyle().Colors[imgui.Col.CheckMark])
        imgui.PushStyleColor(imgui.Col.ButtonActive, imgui.GetStyle().Colors[imgui.Col.CheckMark])

            imgui.Button(...)

        imgui.PopStyleColor()
        imgui.PopStyleColor()
        imgui.PopStyleColor()

    else
        return imgui.Button(...)
    end
end

-- в любое место кода
function imgui.TextColoredRGB(text)
    local style = imgui.GetStyle()
    local colors = style.Colors
    local ImVec4 = imgui.ImVec4

    local explode_argb = function(argb)
        local a = bit.band(bit.rshift(argb, 24), 0xFF)
        local r = bit.band(bit.rshift(argb, 16), 0xFF)
        local g = bit.band(bit.rshift(argb, 8), 0xFF)
        local b = bit.band(argb, 0xFF)
        return a, r, g, b
    end

    local getcolor = function(color)
        if color:sub(1, 6):upper() == 'SSSSSS' then
            local r, g, b = colors[1].x, colors[1].y, colors[1].z
            local a = tonumber(color:sub(7, 8), 16) or colors[1].w * 255
            return ImVec4(r, g, b, a / 255)
        end
        local color = type(color) == 'string' and tonumber(color, 16) or color
        if type(color) ~= 'number' then return end
        local r, g, b, a = explode_argb(color)
        return imgui.ImColor(r, g, b, a):GetVec4()
    end

    local render_text = function(text_)
        for w in text_:gmatch('[^\r\n]+') do
            local text, colors_, m = {}, {}, 1
            w = w:gsub('{(......)}', '{%1FF}')
            while w:find('{........}') do
                local n, k = w:find('{........}')
                local color = getcolor(w:sub(n + 1, k - 1))
                if color then
                    text[#text], text[#text + 1] = w:sub(m, n - 1), w:sub(k + 1, #w)
                    colors_[#colors_ + 1] = color
                    m = n
                end
                w = w:sub(1, n - 1) .. w:sub(k + 1, #w)
            end
            if text[0] then
                for i = 0, #text do
                    imgui.TextColored(colors_[i] or colors[1], u8(text[i]))
                    imgui.SameLine(nil, 0)
                end
                imgui.NewLine()
            else imgui.Text(u8(w)) end
        end
    end

    render_text(text)
end

function waiters(arg)
	zaderzhkachecka.v = tonumber(arg)
	sampAddChatMessage("{FF8C00}[{FF6347}Ловля столов{FF8C00}]: {FFFFFF}Задержка клика установлена: {ff00ff}" .. zaderzhkachecka.v,  -1)
end

function per(arg)
	per = tonumber(arg)
	for b = 0, 5 do
		sampSendChat('/pay ' .. b .. ' 1')
	end
end

function TableMin(arg)
	if arg then
		if tonumber(arg) > 0 and tonumber(arg) <= 99999 then
			pricemetr.v = tostring(arg)
			ini.settings.pricemetr = pricemetr.v
			inicfg.save(ini, "loverstolov.ini")
			sampAddChatMessage("{FF8C00}[{FF6347}Ловля столов{FF8C00}]: {FFFFFF}Минимальная ставка установлена: {ff00ff}" .. pricemetr.v,  -1)
		else
			sampAddChatMessage("{FF8C00}[{FF6347}Ловля столов{FF8C00}]: {FFFFFF}Неверная минимальная ставка {FF0000}[Error]",  -1)
		end
	else
		sampAddChatMessage("{FF8C00}[{FF6347}Ловля столов{FF8C00}]: {FFFFFF}Неверная минимальная ставка {FF0000}[Error]",  -1)
	end
end

function TableMax(arg)
	if tonumber(arg) then
		if tonumber(arg) > 1 and tonumber(arg) <= 100000 then
			pricemetr1.v = tostring(arg)
			ini.settings.pricemetr1 = pricemetr1.v
			inicfg.save(ini, "loverstolov.ini")
			sampAddChatMessage("{FF8C00}[{FF6347}Ловля столов{FF8C00}]: {FFFFFF}Максимальная ставка установлена: {ff00ff}" .. pricemetr1.v, -1)
		else
			sampAddChatMessage("{FF8C00}[{FF6347}Ловля столов{FF8C00}]: {FFFFFF}Неверная максимальная ставка {FF0000}[Error]",  -1)
		end
	else
		sampAddChatMessage("{FF8C00}[{FF6347}Ловля столов{FF8C00}]: {FFFFFF}Неверная максимальная ставка {FF0000}[Error]",  -1)
	end
end

function MoneyKick(arg)
	min_money_kick = tonumber(arg) 
	sampAddChatMessage("{FFFFFF}пїЅпїЅпїЅпїЅ пїЅпїЅпїЅпїЅпїЅпїЅ пїЅпїЅпїЅпїЅпїЅпїЅпїЅпїЅпїЅпїЅпїЅ.: " .. min_money_kick)
end
function OnScript(arg)
	if ActivateScript == 0 then
		sampAddChatMessage("{FFFFFF}{FF8C00}[{FF6347}Ловля столов{FF8C00}]: {7FFF00}Скрипт включен {ff00ff}", -1);
	end
	if ActivateScript == 1 then
		ActivateScript = 0;
		sampAddChatMessage("{FF8C00}[{FF6347}Ловля столов{FF8C00}]: {FF0000}Скрипт выключён {ff00ff}", -1);
	end
end
function OffScript(arg)
	if ActivateScript == 1 then
		sampAddChatMessage("{FFFFFF}пїЅпїЅпїЅпїЅпїЅпїЅ пїЅпїЅпїЅ пїЅпїЅпїЅпїЅпїЅпїЅпїЅпїЅ");
	end
	if ActivateScript == 0 then
		ActivateScript = 1;
		sampAddChatMessage("{FFFFFF}пїЅпїЅ пїЅпїЅпїЅпїЅпїЅпїЅпїЅпїЅ пїЅпїЅпїЅпїЅпїЅпїЅ");
	end
end

function imgui.Hint(str_id, hint, delay)
    local hovered = imgui.IsItemHovered()
    local animTime = 0.2
    local delay = delay or 0.00
    local show = true

    if not allHints then allHints = {} end
    if not allHints[str_id] then
        allHints[str_id] = {
            status = false,
            timer = 0
        }
    end

    if hovered then
        for k, v in pairs(allHints) do
            if k ~= str_id and os.clock() - v.timer <= animTime  then
                show = false
            end
        end
    end

    if show and allHints[str_id].status ~= hovered then
        allHints[str_id].status = hovered
        allHints[str_id].timer = os.clock() + delay
    end

    if show then
        local between = os.clock() - allHints[str_id].timer
        if between <= animTime then
            local s = function(f)
                return f < 0.0 and 0.0 or (f > 1.0 and 1.0 or f)
            end
            local alpha = hovered and s(between / animTime) or s(1.00 - between / animTime)
            imgui.PushStyleVarFloat(imgui.StyleVar.Alpha, alpha)
            imgui.SetTooltip(hint)
            imgui.PopStyleVar()
        elseif hovered then
            imgui.SetTooltip(hint)
        end
    end
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

function apply_custom_style()
    imgui.SwitchContext()
    local style = imgui.GetStyle()
    local colors = style.Colors
    local clr = imgui.Col
    local ImVec4 = imgui.ImVec4

    local style = imgui_lib.GetStyle()
    local colors = style.Colors
    local clr = imgui_lib.Col
    local ImVec4 = imgui_lib.ImVec4

    style.WindowRounding = 2
    style.WindowTitleAlign = imgui_lib.ImVec2(0.5, 0.5)
    style.ChildWindowRounding = 4.0
    style.FrameRounding = 3
    style.ItemSpacing = imgui_lib.ImVec2(5.0, 4.0)
    style.ScrollbarSize = 13.0
    style.ScrollbarRounding = 0
    style.GrabMinSize = 8.0
    style.GrabRounding = 1.0
    style.WindowPadding = imgui_lib.ImVec2(4.0, 4.0)
    style.FramePadding = imgui_lib.ImVec2(3.5, 3.5)
    style.ButtonTextAlign = imgui_lib.ImVec2(0.0, 0.5)

    colors[clr.Text] = ImVec4(0.80, 0.80, 0.83, 1.00)
    colors[clr.TextDisabled] = ImVec4(0.24, 0.23, 0.29, 1.00)
    colors[clr.WindowBg] = ImVec4(0.06, 0.05, 0.07, 1.00)
    colors[clr.ChildWindowBg] = ImVec4(0.07, 0.07, 0.09, 1.00)
    colors[clr.PopupBg] = ImVec4(0.07, 0.07, 0.09, 1.00)
    colors[clr.Border] = ImVec4(0.80, 0.80, 0.83, 0.88)
    colors[clr.BorderShadow] = ImVec4(0.92, 0.91, 0.88, 0.00)
    colors[clr.FrameBg] = ImVec4(0.10, 0.09, 0.12, 1.00)
    colors[clr.FrameBgHovered] = ImVec4(0.24, 0.23, 0.29, 1.00)
    colors[clr.FrameBgActive] = ImVec4(0.56, 0.56, 0.58, 1.00)
    colors[clr.TitleBg] = ImVec4(0.76, 0.31, 0.00, 1.00)
    colors[clr.TitleBgCollapsed] = ImVec4(1.00, 0.98, 0.95, 0.75)
    colors[clr.TitleBgActive] = ImVec4(0.80, 0.33, 0.00, 1.00)
    colors[clr.MenuBarBg] = ImVec4(0.10, 0.09, 0.12, 1.00)
    colors[clr.ScrollbarBg] = ImVec4(0.10, 0.09, 0.12, 1.00)
    colors[clr.ScrollbarGrab] = ImVec4(0.80, 0.80, 0.83, 0.31)
    colors[clr.ScrollbarGrabHovered] = ImVec4(0.56, 0.56, 0.58, 1.00)
    colors[clr.ScrollbarGrabActive] = ImVec4(0.06, 0.05, 0.07, 1.00)
    colors[clr.ComboBg] = ImVec4(0.19, 0.18, 0.21, 1.00)
    colors[clr.CheckMark] = ImVec4(1.00, 0.42, 0.00, 0.53)
    colors[clr.SliderGrab] = ImVec4(1.00, 0.42, 0.00, 0.53)
    colors[clr.SliderGrabActive] = ImVec4(1.00, 0.42, 0.00, 1.00)
    colors[clr.Button] = ImVec4(0.10, 0.09, 0.12, 1.00)
    colors[clr.ButtonHovered] = ImVec4(0.24, 0.23, 0.29, 1.00)
    colors[clr.ButtonActive] = ImVec4(0.56, 0.56, 0.58, 1.00)
    colors[clr.Header] = ImVec4(0.10, 0.09, 0.12, 1.00)
    colors[clr.HeaderHovered] = ImVec4(0.56, 0.56, 0.58, 1.00)
    colors[clr.HeaderActive] = ImVec4(0.06, 0.05, 0.07, 1.00)
    colors[clr.ResizeGrip] = ImVec4(0.00, 0.00, 0.00, 0.00)
    colors[clr.ResizeGripHovered] = ImVec4(0.56, 0.56, 0.58, 1.00)
    colors[clr.ResizeGripActive] = ImVec4(0.06, 0.05, 0.07, 1.00)
    colors[clr.CloseButton] = ImVec4(0.40, 0.39, 0.38, 0.16)
    colors[clr.CloseButtonHovered] = ImVec4(0.40, 0.39, 0.38, 0.39)
    colors[clr.CloseButtonActive] = ImVec4(0.40, 0.39, 0.38, 1.00)
    colors[clr.PlotLines] = ImVec4(0.40, 0.39, 0.38, 0.63)
    colors[clr.PlotLinesHovered] = ImVec4(0.25, 1.00, 0.00, 1.00)
    colors[clr.PlotHistogram] = ImVec4(0.40, 0.39, 0.38, 0.63)
    colors[clr.PlotHistogramHovered] = ImVec4(0.25, 1.00, 0.00, 1.00)
    colors[clr.TextSelectedBg] = ImVec4(0.25, 1.00, 0.00, 0.43)
    colors[clr.ModalWindowDarkening] = ImVec4(1.00, 0.98, 0.95, 0.73)
end

apply_custom_style()