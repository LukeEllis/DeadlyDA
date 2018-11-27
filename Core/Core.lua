DeadlyDungeonAchievements = LibStub("AceAddon-3.0"):NewAddon("DeadlyDA", "AceConsole-3.0", "AceEvent-3.0")

local AceGUI = LibStub("AceGUI-3.0")

function DeadlyDungeonAchievements:UPDATE_INSTANCE_INFO()
    local foundDungeon = false
    local instanceName, _, _, instanceDifficultyName = GetInstanceInfo()

    for i = 1 , table.getn(g_dungeon_names) do
        if instanceName == g_dungeon_names[i] then
            foundDungeon = true
            -- g_Main_Frame:Show()
            break
        end
    end

    if foundDungeon and instanceDifficultyName == "Mythic" then
        self:Print("You have entered " .. instanceName .. " on Mythic difficulty.")
        for value = 1, table.maxn(g_achievements[instanceName]), 2 do
            DeadlyDungeonAchievements:CreateCheckBox(g_achievements[instanceName][value])
        end
    else
        -- If you are not in a 'known' dungeon
        --  hide the frame
        -- g_Main_Frame:Hide()
        -- Fixes bug where copies of Check Boxes were being created
        --  everytime you walked into a dungeon
        g_Main_Frame:ReleaseChildren()
        self:Print("I'm not sure where you are.")
    end
end