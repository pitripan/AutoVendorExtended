local L = LibStub("AceLocale-3.0"):NewLocale("AutoVendorExtended", "enUS", true, false)

-- Put the language in this locale here
L["Loaded language"] = "English"


--------------------------------------------------
-- Overrrides to AutoVendor                     --
--------------------------------------------------
-- Output messages
L['Added to list'] = '\124cff00FF00Added\124r %s to %s.'
L['Removed from list'] = '\124cffFF0000Removed\124r %s from %s.'

-- Output when selling stuff
L['12 items sold'] = '12 items sold but there is more junk in your inventory. Please use the [Resell] button or close and reopen the vendor to sell the rest.'


--------------------------------------------------
-- Additions by AutoVendor Extended             --
--------------------------------------------------
L['AVE_LineHeader'] = '|cff6fc5ffAVE:|r'
L['ReSellButton'] = 'Resell'
L['ReSellButton_ToolTip'] = 'Sell another 12 junk-items'
L['ItemIsOn_JunkList'] = '|cff6fc5ffThis item is on the |cffFF0000junk list|r.|r'
L['ItemIsOn_NotJunkList'] = '|cff6fc5ffThis item is on the |cff00bb00not-junk list|r.|r'


--------------------------------------------------
-- Bindings localisation                        --
--------------------------------------------------
BINDING_HEADER_AUTOVENDOREXTENDED = "AutoVendor Extended"
BINDING_NAME_AUTOVENDOREXTENDEDRESELL = "Resell"
