local ffi = require ("ffi")
local C = ffi.C
ffi.cdef[[
	bool SetSofttarget(UniverseID componentid, const char*const connectionname);
	double GetCurrentGameTime(void);
]]
local Lib = require ("extensions.sn_mod_support_apis.lua_interface").Library
local origFuncs = {}
local newFuncs = {}
local playerId
local mapMenu
local function init ()
	playerId = ConvertStringTo64Bit (tostring (C.GetPlayerID ()))
	-- uix call backs
	mapMenu = Lib.Get_Egosoft_Menu ("MapMenu")
	mapMenu.registerCallback ("createMissionContext_startDescriptionTable", newFuncs.createMissionContext_startDescriptionTable)
	mapMenu.registerCallback ("createMissionContext_getIsMissionAcceptable", newFuncs.createMissionContext_getIsMissionAcceptable)
	mapMenu.registerCallback ("createMissionContext_getIsMissionBriefingAvailable", newFuncs.createMissionContext_getIsMissionAcceptable)
	mapMenu.registerCallback ("createMissionContext_addMissionOfferButtons", newFuncs.createMissionContext_addMissionOfferButtons)
	mapMenu.registerCallback ("createMissionContext_addMissionAcceptedButtons", newFuncs.createMissionContext_addMissionAcceptedButtons)
	-- ui triggers
	RegisterEvent ("kEM_set_target", newFuncs.kEM_set_target)
	RegisterEvent ("kEM_clear_ui_data", newFuncs.kEM_clear_ui_data)
	RegisterEvent ("kEM_update_data_from_other_mission_done", newFuncs.kEM_update_data_from_other_mission_done)
	RegisterEvent ("kEM_get_active_mission", newFuncs.kEM_get_active_mission)
	RegisterEvent ("kEM_refresh_mapMenu_infoframe", newFuncs.kEM_refresh_mapMenu_infoframe)
end
function newFuncs.debugText (data1, data2, indent, isForced)
	local isDebug = false
	if isDebug == true or isForced == true then
		if indent == nil then
			indent = ""
		end
		if type (data1) == "table" then
			for i, value in pairs (data1) do
				DebugError (indent .. tostring (i) .. " (" .. type (i) .. ")" .. ReadText (1001, 120) .. " " .. tostring (value) .. " (" .. type (value) .. ")")
				if type (value) == "table" then
					newFuncs.debugText (value, nil, indent .. "    ", isForced)
				end
			end
		else
			DebugError (indent .. tostring (data1) .. " (" .. type (data1) .. ")")
		end
		if data2 then
			newFuncs.debugText (data2, nil, indent .. "    ", isForced)
		end
	end
end
function newFuncs.debugText_forced (data1, data2, indent)
	return newFuncs.debugText (data1, data2, indent, true)
end
function newFuncs.kEM_set_target (_, object)
	-- DebugError ("kuertee_emergent_missions kEM_set_target object: " .. tostring (object))
	if object then
		local object64Bit = ConvertStringTo64Bit (tostring (object))
		if IsValidComponent (object64Bit) then
			C.SetSofttarget (object64Bit, "")
		end
	else
		RemoveSofttarget ()
	end
end
newFuncs.em_data = nil
function newFuncs.kEM_clear_ui_data ()
	newFuncs.em_data = nil
end
function newFuncs.createMissionContext_startDescriptionTable (ftable)
	local menu = mapMenu
	local dataFromMD
	newFuncs.em_data = {}
	newFuncs.em_data.shipsByAcceptedMission = {}
	newFuncs.em_data.aiDefendersByAcceptedMission = {}
	newFuncs.em_data.isSADAcceptable = {}
	-- see kuertee_emergent_missions.Missions_Maydays_MapMenu_AcceptedMissions for mission raids data schema
	dataFromMD = GetNPCBlackboard (playerId, "$ui_kuertee_em_maydays")
	if dataFromMD then
		for missionId, shipId in pairs (dataFromMD.shipsByAcceptedMission) do
			newFuncs.em_data.shipsByAcceptedMission [tostring (missionId)] = tostring (shipId)
		end
		for missionId, aiDefenders in pairs (dataFromMD.aiDefendersByAcceptedMission) do
			newFuncs.em_data.aiDefendersByAcceptedMission [tostring (missionId)] = aiDefenders
		end
	end
	-- see kuertee_emergent_missions.Missions_Escorts_MapMenu_AcceptedMissions for mission raids data schema
	dataFromMD = GetNPCBlackboard (playerId, "$ui_kuertee_em_escorts")
	if dataFromMD then
		for missionId, shipId in pairs (dataFromMD.shipsByAcceptedMission) do
			newFuncs.em_data.shipsByAcceptedMission [tostring (missionId)] = tostring (shipId)
		end
		for missionId, aiDefenders in pairs (dataFromMD.aiDefendersByAcceptedMission) do
			newFuncs.em_data.aiDefendersByAcceptedMission [tostring (missionId)] = aiDefenders
		end
	end
	-- see kuertee_emergent_missions.Missions_SectorRaids_MapMenu_AcceptedMissions for mission raids data schema
	dataFromMD = GetNPCBlackboard (playerId, "$ui_kuertee_em_raids")
	if dataFromMD then
		for missionId, shipId in pairs (dataFromMD.shipsByAcceptedMission) do
			newFuncs.em_data.shipsByAcceptedMission [tostring (missionId)] = tostring (shipId)
		end
		for missionId, aiDefenders in pairs (dataFromMD.aiDefendersByAcceptedMission) do
			newFuncs.em_data.aiDefendersByAcceptedMission [tostring (missionId)] = aiDefenders
		end
	end
	-- see kuertee_emergent_missions.Missions_Hunts_MapMenu_MissionOffers for mission hunts data schema
	dataFromMD = GetNPCBlackboard (playerId, "$ui_kuertee_em_hunts")
	if dataFromMD then
		-- note: to make tracking missions to ships
		-- the main tables here are to get the ship by mission offer (i.e. plug the mission offer id to get the ship)
		-- then to get the active mission by ship (i.e. plug the ship to get the accepted mission id).
		-- hence, missionHunts_acceptedMissionsByShip instead of shipsByAcceptedMission
		newFuncs.em_data.missionHunts_shipsByMissionOffers = {}
		for missionId, shipId in pairs (dataFromMD.missionHunts_shipsByMissionOffers) do
			newFuncs.em_data.missionHunts_shipsByMissionOffers [tostring (missionId)] = tostring (shipId)
		end
		newFuncs.em_data.missionHunts_lastKnownTimesByMissionOffers = {}
		for missionId, time in pairs (dataFromMD.missionHunts_lastKnownTimesByMissionOffers) do
			newFuncs.em_data.missionHunts_lastKnownTimesByMissionOffers [tostring (missionId)] = time
		end
		newFuncs.em_data.missionHunts_lastKnownTimesByShip = {}
		for missionTarget, time in pairs (dataFromMD.missionHunts_lastKnownTimesByShip) do
			newFuncs.em_data.missionHunts_lastKnownTimesByShip [tostring (missionTarget)] = time
		end
		newFuncs.em_data.missionHunts_acceptedMissionsByShip = {}
		for shipId, missionId in pairs (dataFromMD.missionHunts_activeMissionsByShip) do
			newFuncs.em_data.missionHunts_acceptedMissionsByShip [tostring (shipId)] = missionId
		end
		newFuncs.em_data.missionsThisHour_total = dataFromMD.missionHunts_missionsPerHour_count
		newFuncs.em_data.missionsThisHour_max = dataFromMD.missionHunts_missionsPerHour_max
		newFuncs.em_data.missionHunts_lastTime = dataFromMD.missionHunts_lastTime
		if (not newFuncs.em_data.missionHunts_lastTime) or newFuncs.em_data.missionHunts_lastTime == nil then
			newFuncs.em_data.missionHunts_lastTime = 0
		end
		local time_elapsed = C.GetCurrentGameTime () - newFuncs.em_data.missionHunts_lastTime
		newFuncs.em_data.isOffersCanBeAccepted = true
		if newFuncs.em_data.missionsThisHour_total >= newFuncs.em_data.missionsThisHour_max then
			newFuncs.em_data.isOffersCanBeAccepted = false
		end
	end
end
function newFuncs.getSADTargetOfMission (missionid)
	local menu = mapMenu
	local mission_luaId = ConvertStringToLuaID (tostring (missionid))
	local sadTargetOfMission = newFuncs.em_data.missionHunts_shipsByMissionOffers [tostring (mission_luaId)]
	return sadTargetOfMission
end
function newFuncs.getLastKnownTimeOfSADTarget (target)
	local menu = mapMenu
	local lastKnownTimeOfSADTarget = newFuncs.em_data.missionHunts_lastKnownTimesByShip [tostring (target)]
	return lastKnownTimeOfSADTarget
end
function newFuncs.createMissionContext_getIsMissionAcceptable (missionid)
	local menu = mapMenu
	if newFuncs.em_data then
		-- return newFuncs.getIsMissionAcceptable (missionid)
		newFuncs.em_data.isOffersCanBeAccepted = newFuncs.getIsMissionAcceptable (missionid)
	else
		-- return true
		newFuncs.em_data.isOffersCanBeAccepted = true
	end
	return newFuncs.em_data.isOffersCanBeAccepted
end
function newFuncs.getIsMissionAcceptable (missionId)
	local mission_luaId = ConvertStringToLuaID (tostring (missionId))
	local sadTargetOfMission = newFuncs.getSADTargetOfMission (mission_luaId)
	if sadTargetOfMission ~= null and sadTargetOfMission ~= false and sadTargetOfMission ~= 0 then
		if newFuncs.em_data.isOffersCanBeAccepted == 1 or newFuncs.em_data.isOffersCanBeAccepted == true then
			local target = newFuncs.em_data.missionHunts_shipsByMissionOffers [tostring (mission_luaId)]
			local lastKnownTimeOfSADTarget = newFuncs.getLastKnownTimeOfSADTarget (target)
			if lastKnownTimeOfSADTarget ~= null and lastKnownTimeOfSADTarget ~= false and lastKnownTimeOfSADTarget ~= 0 then
				return false
			else
				newFuncs.em_data.isSADAcceptable [tostring (mission_luaId)] = true
				return true
			end
		else
			return false
		end
	else
		return true
	end
end
function newFuncs.createMissionContext_addMissionOfferButtons (ftable, missionid)
	local menu = mapMenu
	if newFuncs.em_data then
		local mission_luaId = ConvertStringToLuaID (tostring (missionid))
		local ship_inMissionHuntOffer_luadId = ConvertStringToLuaID (tostring (newFuncs.em_data.missionHunts_shipsByMissionOffers [tostring (mission_luaId)]))
		local time_lastKnownInMissionHuntOffer = newFuncs.em_data.missionHunts_lastKnownTimesByMissionOffers [tostring (mission_luaId)]
		local time_lastKnownInAcceptedMissionHunt = newFuncs.em_data.missionHunts_lastKnownTimesByShip [tostring (ship_inMissionHuntOffer_luadId)]
		if ship_inMissionHuntOffer_luadId ~= nil and time_lastKnownInMissionHuntOffer ~= nil and time_lastKnownInAcceptedMissionHunt ~= nil then
			if time_lastKnownInMissionHuntOffer > time_lastKnownInAcceptedMissionHunt then
				-- this mission can update an active mission's last known data
				newFuncs.addUpdateHuntDataBtn (ftable, mission_luaId, ship_inMissionHuntOffer_luadId)
			end
		end
		if ship_inMissionHuntOffer_luadId ~= nil and newFuncs.em_data.isSADAcceptable [tostring (mission_luaId)] ~= true then
			-- row[1]:setColSpan (2):createButton ({active = true}):setText (ReadText (11513, 605), {halign = "center"})
			-- row[1].handlers.onClick = function () return newFuncs.missionHunts_missionId_updateFrom (mission_luaId, ship_inMissionHuntOffer_luadId) end
			-- <t id="543">(Unacceptable mission reason 1)You are only allowed %s(counter) missions an hour: %s(time) left.</t>
			-- <t id="544">(Unacceptable mission reason 2)You already have a mission on this target.</t>
			-- <t id="545">(Unacceptable mission reason 3)You are only allowed %s(counter) missions an hour.</t>
			local reasonText = ""
			if newFuncs.em_data.isOffersCanBeAccepted == 1 or newFuncs.em_data.isOffersCanBeAccepted == true then
				-- mission acceptable
			else
				-- local time_elapsed = C.GetCurrentGameTime () - newFuncs.em_data.missionHunts_lastTime
				-- if time_elapsed < 60 * 60 * 60 then
				if newFuncs.em_data.missionsThisHour_total >= newFuncs.em_data.missionsThisHour_max then
					local time_elapsed = C.GetCurrentGameTime () - newFuncs.em_data.missionHunts_lastTime
					if time_elapsed < 60 * 60 * 60 then
						local time_left = ConvertTimeString (60 * 60 * 60 - time_elapsed, "%M:%S")
						reasonText = string.format (ReadText (11513, 543), tostring (newFuncs.em_data.missionsThisHour_max), tostring (time_left))
					elseif newFuncs.em_data.missionsThisHour_total >= newFuncs.em_data.missionsThisHour_max then
						reasonText = string.format (ReadText (11513, 545), tostring (newFuncs.em_data.missionsThisHour_max))
					end
				else
					reasonText = string.format (ReadText (11513, 544))
				end
			end
			if reasonText ~= "" then
				local row = ftable:addRow (true, {fixed = true, bgColor = Helper.color.transparent})
				row[1]:setColSpan (2):createText (reasonText, {halign = "center"})
			end
		end
	end
end
function newFuncs.addUpdateHuntDataBtn (ftable, mission_luaId, ship_inMissionHuntOffer_luadId)
	local menu = mapMenu
	-- <t id="546">Download the reports from this mission</t>
	mission_luaId = ConvertStringToLuaID (tostring (mission_luaId))
	ship_inMissionHuntOffer_luadId = ConvertStringToLuaID (tostring (ship_inMissionHuntOffer_luadId))
	local row = ftable:addRow (true, {fixed = true, bgColor = Helper.color.transparent})
	row[1]:setColSpan (2):createButton ({active = true}):setText (ReadText (11513, 546), {halign = "center"})
	row[1].handlers.onClick = function () return newFuncs.missionHunts_missionId_updateFrom (mission_luaId, ship_inMissionHuntOffer_luadId) end
end
function newFuncs.missionHunts_missionId_updateFrom (mission_luaId, ship_inMissionHuntOffer_luadId)
	local menu = mapMenu
	mission_luaId = ConvertStringToLuaID (tostring (mission_luaId))
	ship_inMissionHuntOffer_luadId = ConvertStringToLuaID (tostring (ship_inMissionHuntOffer_luadId))
	AddUITriggeredEvent ("kEM", "update_data_from_missionid", mission_luaId)
	newFuncs.em_data.mission_luaId_updated = newFuncs.em_data.missionHunts_acceptedMissionsByShip [tostring (ship_inMissionHuntOffer_luadId)]
end
function newFuncs.kEM_update_data_from_other_mission_done ()
	local menu = mapMenu
	menu.infoTableMode = "mission"
	-- menu.missionMode = "plot"
	menu.updateMapAndInfoFrame ()
	menu.contextMenuData.missionid = newFuncs.em_data.mission_luaId_updated
	menu.showMissionContext (tostring (menu.contextMenuData.missionid))
end
function newFuncs.kEM_get_active_mission ()
	local activeMissionId = ConvertStringToLuaID (tostring (C.GetActiveMissionID ()))
	AddUITriggeredEvent ("kEM", "get_active_mission", activeMissionId)
end
function newFuncs.createMissionContext_addMissionAcceptedButtons (ftable, missionid)
	local menu = mapMenu
	if newFuncs.em_data then
		local mission_luaId = ConvertStringToLuaID (tostring (missionid))
		if newFuncs.em_data.shipsByAcceptedMission [tostring (mission_luaId)] then
			newFuncs.addAssignShipsBtn (ftable, mission_luaId)
		end
	end
end
function newFuncs.addAssignShipsBtn (ftable, mission_luaId)
	local menu = mapMenu
	mission_luaId = ConvertStringToLuaID (tostring (mission_luaId))
	-- <t id="273">Assign A Ship</t>
	-- <t id="274">Show Assigned Ship</t>
	-- <t id="274">Remove Assigned Ship</t>
	local row = ftable:addRow (true, {fixed = true, bgColor = Helper.color.transparent})
	row [1]:setColSpan (2):createButton ({active = true}):setText (ReadText (11513, 273), {halign = "center"})
	row [1].handlers.onClick = function () return newFuncs.em_assignAShip (mission_luaId) end
	row = ftable:addRow (true, {fixed = true, bgColor = Helper.color.transparent})
	local aiDefenders = newFuncs.em_data.aiDefendersByAcceptedMission [tostring (mission_luaId)]
	local isActive = false
	if aiDefenders and #aiDefenders > 0 then
		local ship_64Bit
		for _, shipId in ipairs (aiDefenders) do
			ship_64Bit = ConvertStringTo64Bit (tostring (shipId))
			if IsValidComponent (ship_64Bit) then
				isActive = true
				break
			end
		end
	end
	row [1]:createButton ({active = isActive}):setText (ReadText (11513, 274), {halign = "center"})
	row [1].handlers.onClick = function () return newFuncs.em_showAssignedShip (mission_luaId) end
	row [2]:createButton ({active = isActive}):setText (ReadText (11513, 275), {halign = "center"})
	row [2].handlers.onClick = function () return newFuncs.em_removeAssignedShips (mission_luaId) end
end
function newFuncs.em_assignAShip (mission_luaId)
	local menu = mapMenu
	mission_luaId = ConvertStringToLuaID (tostring (mission_luaId))
	AddUITriggeredEvent ("kEM", "kEM_assign_ships", mission_luaId)
	-- menu.setSelectComponentMode (returnsection, classlist, category, playerowned, customheading, screenname)
	local classList = {}
	table.insert (classList, "ship_s")
	table.insert (classList, "ship_m")
	table.insert (classList, "ship_l")
	table.insert (classList, "ship_xl")
	menu.setSelectComponentMode (nil, classList, nil, true, nil, "kEM_ships_assigned")
end
function newFuncs.em_removeAssignedShips (mission_luaId)
	local menu = mapMenu
	mission_luaId = ConvertStringToLuaID (tostring (mission_luaId))
	AddUITriggeredEvent ("kEM", "kEM_remove_ships", mission_luaId)
end
function newFuncs.em_showAssignedShip (mission_luaId)
	local menu = mapMenu
	mission_luaId = ConvertStringToLuaID (tostring (mission_luaId))
	local aiDefenders = newFuncs.em_data.aiDefendersByAcceptedMission [tostring (mission_luaId)]
	local ship_64Bit
	local ships = {}
	for _, shipId in ipairs (aiDefenders) do
		ship_64Bit = ConvertStringTo64Bit (tostring (shipId))
		if IsValidComponent (ship_64Bit) then
			table.insert (ships, ship_64Bit)
		end
	end
	local clear = 1
	menu.addSelectedComponents (ships, clear)
	menu.infoTableMode = "propertyowned"
	menu.propertyMode = "propertyall"
	menu.closeContextMenu ()
	menu.refreshInfoFrame ()
end
function newFuncs.kEM_refresh_mapMenu_infoframe ()
	local menu = mapMenu
	menu.closeContextMenu ()
	menu.refreshInfoFrame ()
end
init ()
