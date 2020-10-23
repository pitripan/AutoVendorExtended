local L = LibStub("AceLocale-3.0"):NewLocale("AutoVendorExtended", "deDE")
if not L then return end

-- Put the language in this locale here
L["Loaded language"] = "Deutsch"


--------------------------------------------------
-- Overrrides to AutoVendor                     --
--------------------------------------------------
-- Output messages
L['Added to list'] = '|cff00bb00Füge|r %s zu %s |cff00bb00hinzu|r.'
L['Removed from list'] = '|cffFF0000Entferne|r %s von %s.'

-- Output when selling stuff
L['12 items sold'] = '12 Gegenstände verkauft, aber es gibt noch mehr in deinem Inventar. Bitte nutze die Schaltfläche [Erneut verkaufen] oder schließe das Händlerfenster und öffne es erneut, um den Rest ebenfalls zu verkaufen.'


--------------------------------------------------
-- Additions by AutoVendor Extended             --
--------------------------------------------------
L['AVE_LineHeader'] = '|cff6fc5ffAVE:|r'
L['ReSellButton'] = 'Erneut verkaufen'
L['ReSellButton_ToolTip'] = 'Verkaufe weitere 12 Abfall-Gegenstände'
L['ItemIsOn_JunkList'] = '|cff6fc5ffDieser Gegenstand ist auf der |cffFF0000Abfall-Liste|r.|r'
L['ItemIsOn_NotJunkList'] = '|cff6fc5ffDieser Gegenstand ist auf der |cff00bb00Nicht-Abfall-Liste|r.|r'


--------------------------------------------------
-- Bindings localisation                        --
--------------------------------------------------
BINDING_HEADER_AUTOVENDOREXTENDED = "AutoVendor Extended"
BINDING_NAME_AUTOVENDOREXTENDEDRESELL = "Erneut verkaufen"
