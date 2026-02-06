local f = CreateFrame("Frame")
local lfdOpen = nil

function LFDDungeonReadyDialogReward_SetReward(button, dungeonID, rewardIndex)
	--local name, texturePath, quantity = GetLFGDungeonRewardInfo(dungeonID, rewardIndex);
	--print(name, texturePath, quantity, dungeonID, rewardIndex, button:GetName())
	--if type(texturePath) ~= nil and texturePath:find("Interface\\Icons\\", 1, true) == 1 then
	--	SetPortraitToTexture(button.texture, texturePath);
	--end
	--button.rewardID = rewardIndex;
	--button:Show();
end

LFDParentFrame:HookScript("OnShow", function()
    local mode = GetLFGMode()
    if not mode or mode == "abandonedInDungeon" then
        lfdOpen = GetTime()
        f:Show()
    end
end)

local function OnUpdate(self, elapsed)
	if lfdOpen ~= nil then
		if GetTime() - lfdOpen >= 0.2 then
			local dungeonComplete = false
			local mode = GetLFGMode()

			if not mode or dungeonComplete or mode == "abandonedInDungeon" then
				LFDQueueFrame_SetType(260)
			end

			lfdOpen = nil
			self:Hide()
		end
	end
end

f:SetScript("OnUpdate", OnUpdate)

f:Hide()
