--local f = CreateFrame("frame", nil, UIParent)

function LFDDungeonReadyDialogReward_SetReward(button, dungeonID, rewardIndex)
	local name, texturePath, quantity = GetLFGDungeonRewardInfo(dungeonID, rewardIndex);
	if texturePath ~= nil and texturePath ~= "(null)" then	--Otherwise, we may be waiting on the item data to come from the server.
		--print(button:GetName(), dungeonID, rewardIndex, name, texturePath, quantity)
		SetPortraitToTexture(button.texture, texturePath);
	end
	button.rewardID = rewardIndex;
	button:Show();
end
