TestAddon = LibStub("AceAddon-3.0"):NewAddon("TestAddon", "AceConsole-3.0", "AceEvent-3.0")

function TestAddon:OnInitialize()
    -- Called when the addon is loaded
end

function TestAddon:OnEnable()
    -- Called when the addon is enabled
    self:Print("TestAddon has loaded.")
    self:RegisterEvent("ZONE_CHANGED")
end

function TestAddon:OnDisable()
    -- Called when the addon is disabled
end

function TestAddon:ZONE_CHANGED()
    self:Print("You have changed zones?")
end