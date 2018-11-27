-- Local Variables
local AceGUI = LibStub("AceGUI-3.0")

-- Functions
function DeadlyDungeonAchievements:OnInitialize()
    -- Called when the addon is loaded
    self.db = LibStub("AceDB-3.0"):New("DeadlyDA_DB", defaults, true)

    LibStub("AceConfig-3.0"):RegisterOptionsTable("DeadlyDA", options)
    self.optionsFrame = LibStub("AceConfigDialog-3.0"):AddToBlizOptions("DeadlyDA", "TestAddon")
    self:RegisterChatCommand("deadlyda", "ChatCommand")
    self:RegisterChatCommand("dda", "ChatCommand")
end

function DeadlyDungeonAchievements:OnEnable()
    -- Called when the addon is enabled
    -- Where the events are registered
    self:Print("DeadlyDungeonA has loaded.")
    self:RegisterEvent("ZONE_CHANGED")
    self:RegisterEvent("UPDATE_INSTANCE_INFO")
end