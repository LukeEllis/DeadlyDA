local f=CreateFrame("Frame");
local msg;
f:SetScript("OnEvent",function(self,event)
	if event=="PLAYER_ENTERING_WORLD" then
		msg = "entering the world";
		DEFAULT_CHAT_FRAME:AddMessage(msg);
	elseif event=="PLAYER_REGEN_DISABLED" then
		msg = "entering combat";
		DEFAULT_CHAT_FRAME:AddMessage(msg);
	elseif event=="PLAYER_REGEN_ENABLED" then
		msg = "leaving combat";
		DEFAULT_CHAT_FRAME:AddMessage(msg);
	end
end)
f:RegisterEvent("PLAYER_ENTERING_WORLD")
f:RegisterEvent("PLAYER_REGEN_DISABLED")
f:RegisterEvent("PLAYER_REGEN_ENABLED")

-- Combat_EventFrame:SetScript("OnEvent",
-- 	function(self, event, ...)
-- 		local _, eventType, _, sourceGUID, _, _, _, _, _, _, _, spellID = CombatLogGetCurrentEventInfo()
-- 		if eventType == "SPELL_CAST_SUCCESS" and sourceGUID == UnitGUID(self.unit) and spellID == 589 then
--            ChatFrame1:AddMessage('You have successfully cast Shadow Word:Pain.')
--     elseif
--         local _, eventType, _, sourceGUID, _, _, _, _, _, _, _, spellID = CombatLogGetCurrentEventInfo()
-- 		if eventType == "SPELL_CAST_SUCCESS" and sourceGUID == UnitGUID(self.unit) and spellID == 585 then
--            ChatFrame1:AddMessage('You have successfully cast Smite.')
-- 		end
-- 	end)

        -- if event=="COMBAT_LOG_EVENT_UNFILTERED" then
        --     local dumpClass, playerClass = UnitClass("player");
        --     local timestamp, eventType, sourceGUID, sourceName, sourceFlags, destGUID, destName, destFlags, spellID, spellName, _, extraskillID, extraskillname = ...;
		-- 	if (eventType == "SPELL_CAST_SUCCESS") and sourceName == UnitName("player") then
		-- 		intmsg = ("\124cFF1987FFSuccessfully casted\124cFFFFFFFF "..GetSpellLink(spellID)..".")
		-- 		if (sIsay == true) then
		-- 			SendChatMessage(intmsg, "SAY")
        --         end
        --     end
        --     msg = "made it here";
        --     DEFAULT_CHAT_FRAME:AddMessage(msg);
        -- else
        --     msg = "didn't make it";
        --     DEFAULT_CHAT_FRAME:AddMessage(msg);
        -- end

-- local Combat_EventFrame = CreateFrame("Frame")
-- Combat_EventFrame:RegisterEvent("PLAYER_REGEN_DISABLED")
-- Combat_EventFrame:SetScript("OnEvent",
-- 	function(self, event, ...)
-- 		local args
-- 		if args.SpellID == 589 then
--             ChatFrame1:AddMessage('You have successfully cast Shadow Word:Pain.')
--         else
--             ChatFrame1:AddMessage('Something went wrong.')
--         end
--     end)
    
-- local Combat_EventFrame = CreateFrame("Frame")
-- Combat_EventFrame:RegisterEvent("UNIT_COMBAT")
-- Combat_EventFrame:SetScript("OnEvent",
-- 	function(self, event, ...)
-- 		local arg1, arg2, _, arg4, arg5
-- 		if arg1 == player then
--            ChatFrame1:AddMessage(..arg1.. ' did a ' ..arg2.. ' for ' ..arg3.. ' damage ' of ..arg4.. ' type.')
--         end
-- 	end)

-- Combat_EventFrame:SetScript("OnEvent",
-- 	function(self, event, ...)
-- 		local _, eventType, _, sourceGUID, _, _, _, _, _, _, _, spellID = CombatLogGetCurrentEventInfo()
-- 		if eventType == "SPELL_CAST_SUCCESS" and sourceGUID == UnitGUID(self.unit) and spellID == 589 then
--            ChatFrame1:AddMessage('You have successfully cast Shadow Word:Pain.')
--     elseif
--         local _, eventType, _, sourceGUID, _, _, _, _, _, _, _, spellID = CombatLogGetCurrentEventInfo()
-- 		if eventType == "SPELL_CAST_SUCCESS" and sourceGUID == UnitGUID(self.unit) and spellID == 585 then
--            ChatFrame1:AddMessage('You have successfully cast Smite.')
-- 		end
-- 	end)