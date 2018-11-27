local AceGUI = LibStub("AceGUI-3.0")

g_Main_Frame = AceGUI:Create("Frame")
g_Main_Frame:SetTitle("Deadly Dungeon Achievements")
g_Main_Frame:SetStatusText("Achievement Module Toggle")
g_Main_Frame:SetWidth(600)
g_Main_Frame:SetHeight(150)
g_Main_Frame:SetPoint("TOP", 0, -50)
g_Main_Frame:SetCallback("OnClose", function(widget) AceGUI:Release(widget) end)
g_Main_Frame:SetLayout("Flow")

defaults = {
    profile = {
        message = "Welcome Home!",
        showInChat = false,
        showOnScreen = true,
    },
}

options = {
    name = "DeadlyDA",
    handler = DeadlyDungeonAchievements,
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

function DeadlyDungeonAchievements:CreateCheckBox(Achievement_ID)
    local checkbox = AceGUI:Create("CheckBox")
    checkbox:SetLabel(Achievement_ID)
    checkbox:SetWidth(150)
    checkbox:SetType("checkbox")
    checkbox:ToggleChecked(true)
    checkbox:SetCallback("OnValueChanged", function(widget, event, value) 
        if value then
            self:Print("Toggling boss modules ON for achievement " )
        else
            self:Print("Toggling boss modules OFF for achievement " )
        end
    end)
    g_Main_Frame:AddChild(checkbox)
end