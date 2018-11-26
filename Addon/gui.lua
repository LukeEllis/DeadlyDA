local AceGUI = LibStub("AceGUI-3.0")

local textStore

local frame = AceGUI:Create("Frame")
frame:SetTitle("Deadly Dungeon Achievements")
frame:SetStatusText("Achievement Module Toggle")
frame:SetCallback("OnClose", function(widget) AceGUI:Release(widget) end)
frame:SetLayout("Flow")

-- local editbox = AceGUI:Create("EditBox")
-- editbox:SetLabel("Insert text:")
-- editbox:SetWidth(200)
-- editbox:SetCallback("OnEnterPressed", function(widget, event, text) textStore = text end)
-- frame:AddChild(editbox)

-- local button = AceGUI:Create("Button")
-- button:SetText("Click Me!")
-- button:SetWidth(200)
-- button:SetCallback("OnClick", function() print(textStore) end)
-- frame:AddChild(button)

-- local checkbox = AceGUI:Create("CheckBox")
-- checkbox:SetLabel("It's Lit!")
-- checkbox:SetWidth(75)
-- checkbox:SetType("checkbox")
-- checkbox:ToggleChecked(true)
-- checkbox:SetCallback("OnValueChanged", function(widget, event, value) OnClearChanged(value) end)
-- frame:AddChild(checkbox)