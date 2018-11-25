local Combat_EventFrame = CreateFrame("Frame")
Combat_EventFrame:RegisterEvent("UNIT_ATTACK")
Combat_EventFrame:SetScript("OnEvent",
	function(self, event, ...)
		local _, eventType, _, sourceGUID, _, _, _, _, _, _, _, spellID = CombatLogGetCurrentEventInfo()
		if eventType == "SPELL_CAST_SUCCESS" and sourceGUID == UnitGUID(self.unit) and spellID == 589 then
           ChatFrame1:AddMessage('You have successfully cast Shadow Word:Pain.')
    elseif
        local _, eventType, _, sourceGUID, _, _, _, _, _, _, _, spellID = CombatLogGetCurrentEventInfo()
		if eventType == "SPELL_CAST_SUCCESS" and sourceGUID == UnitGUID(self.unit) and spellID == 585 then
           ChatFrame1:AddMessage('You have successfully cast Smite.')
		end
	end)