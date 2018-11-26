-- Tables of Contents
-- I. New Addon
-- II. Chat and Configuration
-- III. Addon Defaults
-- IV. Method Overrides
-- V. Chat commands and options
-- VI. Zone changes
-- VII. Pet commands
-- VIII. Achievement progress
-- IX. Achievement helper
-- X.

-- I. New Addon
-- Initializes a new Ace3 Addon
TestAddon = LibStub("AceAddon-3.0"):NewAddon("TestAddon", "AceConsole-3.0", "AceEvent-3.0")

-- II. Chat and Configuration
-- Sets options for chat commands and addon configurations
local options = {
    name = "TestAddon",
    handler = TestAddon,
    type = 'group',
    args = {
        msg = {
            type = "input",
            name = "Message",
            desc = "The message to be displayed when you get reach your hearthstone's destination on foot.",
            usage = "<Your message>",
            get = "GetMessage",
            set = "SetMessage",
        },
        showInChat = {
            type = "toggle",
            name = "Show in Chat",
            desc = "Toggles the display of the message in the chat window.",
            get = "IsShowInChat",
            set = "ToggleShowInChat",
        },
        showOnScreen = {
            type = "toggle",
            name = "Show on Screen",
            desc = "Toggles the display of the message on the screen.",
            get = "IsShowOnScreen",
            set = "ToggleShowOnScreen"
        },
    },
}

-- III. Addon Defaults
-- Creates a default profile for the addon

local defaults = {
    profile = {
        message = "Welcome Home!",
        showInChat = false,
        showOnScreen = true,
    },
}

-- IV. Method Overrides
function TestAddon:OnInitialize()
    -- Called when the addon is loaded
    self.db = LibStub("AceDB-3.0"):New("TestAddonDB", defaults, true)

    LibStub("AceConfig-3.0"):RegisterOptionsTable("TestAddon", options)
    self.optionsFrame = LibStub("AceConfigDialog-3.0"):AddToBlizOptions("TestAddon", "TestAddon")
    self:RegisterChatCommand("testaddon", "ChatCommand")
    self:RegisterChatCommand("ta", "ChatCommand")
end

function TestAddon:OnEnable()
    -- Called when the addon is enabled
    -- Where the events are registered
    self:Print("TestAddon has loaded.")
    self:RegisterEvent("ZONE_CHANGED")
    self:RegisterEvent("PET_ATTACK_START")
    self:RegisterEvent("PET_ATTACK_STOP")
    self:RegisterEvent("UPDATE_INSTANCE_INFO")
end

function TestAddon:OnDisable()
    -- Called when the addon is disabled
end

-- V. Chat commands and options
-- Enabled the use of chat commands for the addon and gives options for a user to change the display message
function TestAddon:ChatCommand(input)
    if not input or input:trim() == "" then
        InterfaceOptionsFrame_OpenToCategory(self.optionsFrame)
    else
        LibStub("AceConfigCmd-3.0"):HandleCommand("ta", "TestAddon", input)
    end
end

function TestAddon:GetMessage(info)
    return self.db.profile.message
end

function TestAddon:SetMessage(info, newValue)
    self.db.profile.message = newValue
end

function TestAddon:IsShowInChat(info)
    return self.db.profile.showInChat
end

function TestAddon:ToggleShowInChat(info, value)
    self.db.profile.showInChat = value
end

function TestAddon:IsShowOnScreen(info)
    return self.db.profile.showOnScreen
end

function TestAddon:ToggleShowOnScreen(info, value)
    self.db.profile.showOnScreen = value
end

-- VI. Zone changes
-- Declares in chat when a character changes zones, displaying the addon message when entering the character's hearthstone location
function TestAddon:ZONE_CHANGED()
    self:Print("You have changed zones!")
    if GetBindLocation() == GetSubZoneText() then
        if self.db.profile.showInChat then
            self:Print(self.db.profile.message);
        end

        if self.db.profile.showOnScreen then
            UIErrorsFrame:AddMessage(self.db.profile.message, 1.0, 1.0, 1.0, 5.0)
        end
    end
end

-- VII. Pet commands
-- Declares when the player's pet attacks, and dismisses the pet when the pet stops attacking.
function TestAddon:PET_ATTACK_START()
    self:Print("Pet is currently attacking.")
end

function TestAddon:PET_ATTACK_STOP()
    self:Print("Pet has stopped attacking. Dismissing pet.")
    PetDismiss()
end

-- VIII. Achievement progress
-- Reviews achievement progress in Battle for Azeroth Mythic dungeons.

-- function TestAddon:PLAYER_ENTER_COMBAT(...)
--     local instanceInfo = {}
--     local instanceName, _, _, instanceDifficultyName = GetInstanceInfo()
--     -- Check instance
--     if instanceName == "Tol Dagor" then
--       if instanceDifficultyName == "Mythic" then
--         -- Check if It's Lit! is completed
--         _, achivementName, _, competed = GetAchievementInfo(12273)
--         if completed then
--          self:Print(achivementName .. " has been completed. Congratulations.")
--         else
--          self:Print(achivementName .. " has NOT been completed.")
--         end
--       else
--         return "Not in Mythic difficulty. Achivements cannot be earned."
--       end
--     end
-- end

-- IX. Achievement helper
-- Checks for correct environment, and displays achievement tips during combat.

function TestAddon:UPDATE_INSTANCE_INFO()
    self:Print("Made it to instance info.")
    local foundDungeon = false
    local instanceName, _, _, instanceDifficultyName = GetInstanceInfo()

    for i = 1 , table.getn(dungeonNames) do
        if instanceName == dungeonNames[i] and instanceDifficultyName == "Mythic" then
            foundDungeon = true
            self:Print("You are in " .. instanceName .. " .")
            break
        end
    end
    
    if foundDungeon then
        self:Print("You have entered " .. instanceName .. " on Mythic difficulty.")
        -- Check Achievement
        self:Print(dungeonAchievement[instanceName][1])
    else
        self:Print("I'm not sure where you are.")
    end

end