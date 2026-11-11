-- Run from the addon directory with Lua 5.1: lua scripts/test-button-position.lua
-- WoW APIs are simulated; visual checks still require the game client.
local objects, menu, eventFrame
local methods = {}
local function object(name, parent)
    local item = setmetatable({ name = name, parent = parent, scripts = {}, height = 180,
        strata = "MEDIUM", level = 5 }, { __index = methods })
    if name then _G[name] = item end
    return item
end
for _, key in ipairs({ "SetTextColor", "SetJustifyH", "SetAutoFocus", "SetMaxLetters",
    "ClearFocus", "SetFontObject", "SetMovable", "EnableMouse", "RegisterForDrag",
    "StartMoving", "StopMovingOrSizing", "SetOwner", "AddLine", "RegisterEvent" }) do
    methods[key] = function() end
end
function methods:SetSize(w, h) self.width = w; self.height = h end
function methods:SetWidth(w) self.width = w end
function methods:SetHeight(h) self.height = h end
function methods:GetHeight() return self.height end
function methods:GetName() return self.name end
function methods:SetPoint(...) self.anchor = { ... } end
function methods:ClearAllPoints() self.anchor = nil end
function methods:GetFrameStrata() return self.strata end
function methods:SetFrameStrata(v) self.strata = v end
function methods:GetFrameLevel() return self.level end
function methods:SetFrameLevel(v) self.level = v end
function methods:SetScript(k, f) self.scripts[k] = f end
function methods:HookScript(k, f) self.scripts[k] = f end
function methods:SetText(v) self.text = v end
function methods:GetText() return self.text end
function methods:SetChecked(v) self.checked = v end
function methods:GetChecked() return self.checked end
function methods:Show() self.shown = true end
function methods:Hide() self.shown = false end
function methods:CreateFontString() return object(nil, self) end
function methods:AddMessage(v) self.message = v end
function CreateFrame(_, name, parent, template)
    local item = object(name, parent)
    if template == "InterfaceOptionsCheckButtonTemplate" then item.Text = object() end
    objects[#objects + 1] = item
    return item
end
function GetLocale() return "enUS" end
function FCF_SavePositionAndDimensions() end
function UIDropDownMenu_SetWidth() end
function UIDropDownMenu_SetText(item, text) item.text = text end
function UIDropDownMenu_Initialize(item, callback) item.initialize = callback end
function UIDropDownMenu_CreateInfo() return {} end
function UIDropDownMenu_AddButton(info) menu[#menu + 1] = info end
C_Timer = { After = function(_, callback) callback() end }
Settings = {
    RegisterCanvasLayoutCategory = function(panel) return panel end,
    RegisterAddOnCategory = function() end,
}
local function boot(saved)
    objects = {}
    UIParent = object(); GameTooltip = object()
    ChatFrame1 = object("ChatFrame1"); ChatFrame2 = object("ChatFrame2")
    DEFAULT_CHAT_FRAME = ChatFrame1; SELECTED_CHAT_FRAME = ChatFrame1
    NUM_CHAT_WINDOWS = 2; UISpecialFrames = {}; SlashCmdList = {}
    ChatHeightExpanderDB = saved
    assert(loadfile("ChatHeightExpander.lua"))("ChatHeightExpander")
    eventFrame = objects[#objects]
    eventFrame.scripts.OnEvent(eventFrame, "ADDON_LOADED", "ChatHeightExpander")
    eventFrame.scripts.OnEvent(eventFrame, "PLAYER_LOGIN")
    SlashCmdList.CHATHEIGHTEXPANDER("config")
    return ChatHeightExpanderConfigWindow
end
local function click(owner, label)
    for _, item in ipairs(objects) do
        if item.parent == owner and item.text == label and item.scripts.OnClick then
            item.scripts.OnClick(item)
            return
        end
    end
    error("Missing button: " .. label)
end
local function choose(owner, index)
    menu = {}
    owner.positionDropdown.initialize(owner.positionDropdown, 1)
    menu[index].func()
end
local function outside(owner, value)
    owner.buttonOutside:SetChecked(value)
    owner.buttonOutside.scripts.OnClick(owner.buttonOutside)
end
local function offsets(owner, x, y)
    owner.buttonOffsetX:SetText(x); owner.buttonOffsetY:SetText(y)
    click(owner, "Apply")
end
local function anchor(point, relativePoint, x, y)
    for _, entry in ipairs({ { ChatHeightExpanderButton1, ChatFrame1 }, { ChatHeightExpanderButton2, ChatFrame2 } }) do
        local a = entry[1].anchor
        assert(a[1] == point and a[2] == entry[2] and a[3] == relativePoint
            and a[4] == x and a[5] == y, "Incorrect button anchor")
    end
end

local owner = boot({ buttonPosition = "TOPRIGHT", collapsedHeight = 190, initialized = true })
anchor("TOPRIGHT", "TOPRIGHT", -2, -2)
assert(ChatHeightExpanderDB.collapsedHeight == 190, "Preserve existing settings")
assert(owner.buttonOutside, "Missing inside/outside control")
assert(owner.buttonOffsetX and owner.buttonOffsetY, "Missing offset controls")
assert(ChatHeightExpanderDB.buttonOutside == false and ChatHeightExpanderDB.buttonOffsetX == 0
    and ChatHeightExpanderDB.buttonOffsetY == 0, "Migrate existing saved settings")

-- Four corners, both inside and outside; external buttons extend horizontally.
local corners = {
    { "TOPRIGHT", "TOPLEFT", -2, -2 }, { "TOPLEFT", "TOPRIGHT", 2, -2 },
    { "BOTTOMRIGHT", "BOTTOMLEFT", -2, 2 }, { "BOTTOMLEFT", "BOTTOMRIGHT", 2, 2 },
}
for index, corner in ipairs(corners) do
    choose(owner, index)
    outside(owner, false)
    anchor(corner[1], corner[1], corner[3], corner[4])
    outside(owner, true)
    anchor(corner[2], corner[1], -corner[3], corner[4])
    assert(ChatHeightExpanderOptionsPanel.buttonOutside:GetChecked(), "Synchronize both option windows")
end

choose(owner, 1)
offsets(owner, "24", "-15")
anchor("TOPLEFT", "TOPRIGHT", 26, -17)
SlashCmdList.CHATHEIGHTEXPANDER("")
anchor("TOPLEFT", "TOPRIGHT", 26, -17)
SlashCmdList.CHATHEIGHTEXPANDER("button"); SlashCmdList.CHATHEIGHTEXPANDER("button")
anchor("TOPLEFT", "TOPRIGHT", 26, -17)
assert(ChatHeightExpanderOptionsPanel.buttonOffsetX:GetText() == "24", "Synchronize X input")
assert(ChatHeightExpanderOptionsPanel.buttonOffsetY:GetText() == "-15", "Synchronize Y input")

-- Invalid offsets reject the entire Apply, including pending height edits.
for _, invalid in ipairs({ "", "abc", "501", "-501", "nan", "inf" }) do
    owner.collapsedBox:SetText("250")
    offsets(owner, invalid, "0")
    anchor("TOPLEFT", "TOPRIGHT", 26, -17)
    assert(ChatHeightExpanderDB.collapsedHeight == 190, "Apply must be atomic")
    offsets(owner, "0", invalid)
    anchor("TOPLEFT", "TOPRIGHT", 26, -17)
end
offsets(owner, "500", "-500")
anchor("TOPLEFT", "TOPRIGHT", 502, -502)
offsets(owner, "12.4", "-12.4")
anchor("TOPLEFT", "TOPRIGHT", 14, -14)

owner = boot(ChatHeightExpanderDB)
anchor("TOPLEFT", "TOPRIGHT", 14, -14)
assert(owner.buttonOutside:GetChecked(), "Restore outside preference on reload")
assert(owner.buttonOffsetX:GetText() == "12" and owner.buttonOffsetY:GetText() == "-12", "Restore offsets on reload")
click(owner, "Reset")
anchor("TOPRIGHT", "TOPRIGHT", -2, -2)
assert(not owner.buttonOutside:GetChecked() and owner.buttonOffsetX:GetText() == "0"
    and owner.buttonOffsetY:GetText() == "0", "Reset positioning")
print("PASS: 8 placements, offsets, input validation, synchronized controls, migration, reload, toggle and reset")
