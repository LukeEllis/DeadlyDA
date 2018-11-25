local msg;
local attack = function(self, event, ...)
    if event=="PLAYER_ENTERING_WORLD" then
		msg = "made it inside spellattack.lua";
        DEFAULT_CHAT_FRAME:AddMessage(msg);
    end
    if event == "COMBAT_LOG_EVENT_UNFILTERED" then
        local _, eventType, _, sourceGUID, _, _, _, _, _, _, _, spellID = CombatLogGetCurrentEventInfo()
        if eventType == "UNIT_SPELLCAST_SUCCEEDED" and sourceGUID == UnitGUID(self.unit) then
            ChatFrame1:AddMessage('You successfully casted a spell')
        end
    end
end