TestAddon = LibStub("AceAddon-3.0"):NewAddon("TestAddon", "AceConsole-3.0", "AceEvent-3.0")

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

local defaults = {
    profile = {
        message = "Welcome Home!",
        showInChat = false,
        showOnScreen = true,
    },
}

TestAddon.showInChat = false
TestAddon.showOnScreen = true

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
    self:Print("TestAddon has loaded.")
    self:RegisterEvent("ZONE_CHANGED")
    self:RegisterEvent("PET_ATTACK_START")
end

function TestAddon:OnDisable()
    -- Called when the addon is disabled
end

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


function TestAddon:PET_ATTACK_START()
    self:Print("is pet attacking?")
    if  IsPetAttackActive() == true then
        if self.db.profile.showInChat then
            self:Print(self.db.profile.message);
        end

        if self.db.profile.showOnScreen then
            UIErrorsFrame:AddMessage(self.db.profile.message, 1.0, 1.0, 1.0, 5.0)
        end
    end
end