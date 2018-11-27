local AceGUI = LibStub("AceGUI-3.0")

-- Global Main Frame
g_frame = AceGUI:Create("Frame")
g_frame:SetTitle("Deadly Dungeon Achievements")
g_frame:SetStatusText("Achievement Module Toggle")
g_frame:SetWidth(600)
g_frame:SetHeight(150)
g_frame:SetPoint("TOP", 0, -50)
g_frame:SetCallback("OnClose", function(widget) AceGUI:Release(widget) end)
g_frame:SetLayout("Flow")