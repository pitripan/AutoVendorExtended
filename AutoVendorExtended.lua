AV = AV
local L = LibStub("AceLocale-3.0"):GetLocale("AutoVendorExtended")

--------------------------------------------------
-- Variable definitions                         --
--------------------------------------------------
local _JunkListName     = 'junk list'
local _NotJunkListName  = 'not junk list'


--------------------------------------------------
-- Register Slash Commands                      --
--------------------------------------------------
SLASH_RELOADUI1 = "/rl";
SlashCmdList.RELOADUI = ReloadUI;


--------------------------------------------------
-- Main Event OnLoad                            --
--------------------------------------------------
function AutoVendorExtended_OnLoad(self)
  AutoVendorExtended_AddReSellButton()
end


--------------------------------------------------
-- Extension: Add resell button                 --
--------------------------------------------------
function AutoVendorExtended_AddReSellButton()
  local ReSellButton = CreateFrame( "Button" , "ReSellBtn" , MerchantFrame, "UIPanelButtonTemplate" )
  ReSellButton:SetText(L['ReSellButton'])
  ReSellButton:SetWidth(140)
  ReSellButton:SetHeight(22)
  ReSellButton:SetPoint("BottomLeft", 15, 3)
  ReSellButton:RegisterForClicks("AnyUp")
  ReSellButton:SetScript("OnClick", function()
    AV:MERCHANT_SHOW()
  end)
  ReSellButton:SetScript("OnEnter", AutoVendorExtended_ReSellButton_OnEnter)
  ReSellButton:SetScript("OnLeave", AutoVendorExtended_ReSellButton_OnLeave)
end

function AutoVendorExtended_ReSellButton_OnEnter(self, motion)
  GameTooltip:SetOwner(self, 'ANCHOR_RIGHT')
  GameTooltip:SetText(L['ReSellButton_ToolTip'])
  GameTooltip:Show()
end

function AutoVendorExtended_ReSellButton_OnLeave(self, motion)
  GameTooltip:Hide()
end


--------------------------------------------------
-- Extension: Junk/NotJunk Tooltip              --
--------------------------------------------------
local function AutoVendorExtended_OnTooltipSetItem(self)
  local name, link = self:GetItem()

  if name then
    local item = link:match("item:(%d+)")
    item = tonumber(item)

    if item then
      local list_Junk = AV.db.profile.junk
      local list_NotJunk = AV.db.profile.not_junk

      -- Check if we already added to this tooltip
      local frame, text
      for i = 1,15 do
        frame = _G[self:GetName() .. "TextLeft" .. i]
        if frame then
          text = frame:GetText()
        end

        if text and string.find(text, L['AVE_LineHeader']) then
          return
        end
      end

      if list_Junk[item] then
        GameTooltip:AddLine(L['AVE_LineHeader'] .. ' ' .. L['ItemIsOn_JunkList'])
      end

      if list_NotJunk[item] then
        GameTooltip:AddLine(L['AVE_LineHeader'] .. ' ' .. L['ItemIsOn_NotJunkList'])
      end
    end

    --cleared = true
  end
end

GameTooltip:HookScript("OnTooltipSetItem", AutoVendorExtended_OnTooltipSetItem)


--------------------------------------------------
-- Overrrides: ToggleJunk / ToggleNotJunk        --
--------------------------------------------------
function AV:ToggleJunk(msg, editbox)
  if msg then
    self:ResetJunkCache()

    for itemIdStr in string.gmatch(msg, "item:(%d+)") do
      local itemId = tonumber(itemIdStr)
      local itemName = select(1, GetItemInfo(itemId))

      if itemId and itemName then
        AutoVendorExtended_listToggle(self.db.profile.junk, _JunkListName, itemId, itemName)
      else
        if itemIdStr and AutoVendorExtended_listRemove(self.db.profile.junk, itemIdStr) then
          self:Print(string.format(L['Removed from list'], itemIdStr, _JunkListName))
        else
          self:Print(L['No item link'])
        end
      end
    end
  else
    self:Print(L['No item link'])
  end
end

function AV:ToggleNotJunk(msg, editbox)
  if msg then
    self:ResetJunkCache()

    for itemIdStr in string.gmatch(msg, "item:(%d+)") do
      local itemId = tonumber(itemIdStr)
      local itemName = select(1, GetItemInfo(itemId))

      if itemId and itemName then
        AutoVendorExtended_listToggle(self.db.profile.not_junk, _NotJunkListName, itemId, itemName)
      else
        if itemIdStr and AutoVendorExtended_listRemove(self.db.profile.not_junk, itemIdStr) then
          self:Print(string.format(L['Removed from list'], itemIdStr, _NotJunkListName))
        else
          self:Print(L['No item link'])
        end
      end
    end
  else
    self:Print(L['No item link'])
  end
end


--------------------------------------------------
-- Overrrides: AutoVendor local functions       --
--------------------------------------------------
function AutoVendorExtended_listToggle(list, listName, itemId, itemName)
	if list[itemId] then
		list[itemId] = nil
    AV:Print(string.format(L['Removed from list'], itemName, listName))
	else
		table.insert(list, itemId, itemName)
    AV:Print(string.format(L['Added to list'], itemName, listName))
	end
end

function AutoVendorExtended_listRemove(list, item)
	found = false
	for k,v in pairs(list) do
		if string.lower(v) == string.lower(item) then
			list[k] = nil
			found = true
		end
	end
	return found
end
