-- local f=CreateFrame("Frame");
-- local msg1;
-- f:SetScript("OnEvent",function(self,event)
--     if event=="PLAYER_ENTERING_WORLD" then
-- 		msg1 = "made it inside spellattack";
--         DEFAULT_CHAT_FRAME:AddMessage(msg1);
--     end
-- end)
-- f:RegisterEvent("PLAYER_ENTERING_WORLD")

local g=CreateFrame("Frame");
g:SetScript("OnEvent",function(self,event)
    if event == "COMBAT_LOG_EVENT_UNFILTERED" then
        local _, eventType, _, sourceGUID, _, _, _, _, _, _, _, spellID = CombatLogGetCurrentEventInfo()
        if eventType == "UNIT_SPELLCAST_SUCCEEDED" and sourceGUID == UnitGUID(self.unit) then
            ChatFrame1:AddMessage('You successfully casted a spell')
        end
    end
end)
g:RegisterEvent("COMBAT_LOG_EVENT_UNFILTERED")
g:RegisterEvent("UNIT_SPELLCAST_SUCCEEDED")