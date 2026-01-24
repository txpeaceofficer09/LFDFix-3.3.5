local f = CreateFrame("Frame")
local lfdOpen = nil

function LFDDungeonReadyDialogReward_SetReward(button, dungeonID, rewardIndex)
	local name, texturePath, quantity = GetLFGDungeonRewardInfo(dungeonID, rewardIndex);
	if type(texturePath) ~= nil and texturePath:find("Interface\\Icons\\", 1, true) == 1 then	--Otherwise, we may be waiting on the item data to come from the server.
		--print(button:GetName(), dungeonID, rewardIndex, name, texturePath, quantity)
		SetPortraitToTexture(button.texture, texturePath);
	end
	button.rewardID = rewardIndex;
	button:Show();
end

--f:SetScript("OnEvent", OnEvent)

--f:RegisterEvent("ADDON_LOADED")


LFDParentFrame:HookScript("OnShow", function()
    local mode = GetLFGMode()
    if not mode then
    	--LFDQueueFrame_SetType(260)
        lfdOpen = GetTime()
    end
end)

local function OnUpdate(self, elapsed)
	if lfdOpen ~= nil then
		if GetTime() - lfdOpen >= 0.2 then
			LFDQueueFrame_SetType(260)
			lfdOpen = nil
		end
	end
end

f:SetScript("OnUpdate", OnUpdate)