DeadlyDungeonAchievements = LibStub("AceAddon-3.0"):NewAddon("DeadlyDA", "AceConsole-3.0", "AceEvent-3.0")

local AceGUI = LibStub("AceGUI-3.0")

function DeadlyDungeonAchievements:ZONE_CHANGED()
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

function DeadlyDungeonAchievements:UPDATE_INSTANCE_INFO()
    local foundDungeon = false
    local instanceName, _, _, instanceDifficultyName = GetInstanceInfo()

    for i = 1 , table.getn(g_dungeon_names) do
        if instanceName == g_dungeon_names[i] then
            foundDungeon = true
            break
        end
    end

    if foundDungeon and instanceDifficultyName == "Mythic" then
        self:Print("You have entered " .. instanceName .. " on Mythic difficulty.")
        -- Fixes bug where copies of Check Boxes were being created
        --  everytime you walked into a dungeon
        g_Main_Frame:ReleaseChildren()
        for value = 1, table.maxn(g_achievements[instanceName]), 2 do
            DeadlyDungeonAchievements:CreateCheckBox(g_achievements[instanceName][value])
        end
    else
        -- If you are not in a 'known' dungeon
        --  hide the frame
        g_Main_Frame:Hide()
        self:Print("I'm not sure where you are.")
    end
end