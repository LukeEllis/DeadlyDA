local EventFrame = CreateFrame("Frame")
EventFrame:RegisterEvent("PLAYER_LOGIN")
EventFrame:SetScript("OnEvent", function(self,event,...) 
	if type(mySavedVar) ~= "table" then  --  I know it doesn't exist. so set it's default
		mySavedVar = {}
		mySavedVar[UnitName("Player")] = 1
		ChatFrame1:AddMessage('WhyHelloThar '.. UnitName("Player")..". I do believe this is the first time we've met. Nice to meet you!")
	else -- It's already set
		if mySavedVar[UnitName("Player")] == 1 then
			ChatFrame1:AddMessage('WhyHelloThar '.. UnitName("Player")..". How nice to see you again. I do believe I've seen you " .. mySavedVar[UnitName('Player')] .. " time before.")
		else
			ChatFrame1:AddMessage('WhyHelloThar '.. UnitName("Player")..". How nice to see you again. I do believe I've seen you " .. mySavedVar[UnitName('Player')] .. " times before.")
		end
		local found = 0
                for name,number in pairs(mySavedVar) do 
                         if UnitName("Player") == name then
                                mySavedVar[name] = mySavedVar[name] + 1
                                found = 1
                         end
                end
                if found == 0 then
                         mySavedVar[UnitName("Player")] = 1
                end
	end
end)