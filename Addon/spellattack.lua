local f=CreateFrame("Frame");
local msg1;
f:SetScript("OnEvent",function GetMoney(self,event)
    if event=="PLAYER_ENTERING_WORLD" then
		msg1 = "made it inside spellattack";
        DEFAULT_CHAT_FRAME:AddMessage(msg1);
    end
end)
f:RegisterEvent("PLAYER_ENTERING_WORLD")

-- local g=CreateFrame("Frame");
-- g:SetScript("OnEvent",function(self,event)
--     local _, event, _, sourceGUID, _, _, _, _, _, _, _ = CombatLogGetCurrentEventInfo()
--     if event == "SPELL_DAMAGE" and sourceGUID == UnitGUID(self.unit) then
--         ChatFrame1:AddMessage('You successfully casted a spell')
--     end
-- end)
-- g:RegisterEvent("SPELL_DAMAGE")