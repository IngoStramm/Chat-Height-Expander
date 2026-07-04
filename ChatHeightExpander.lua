local ADDON_NAME = ...
local LOCALE = GetLocale and GetLocale() or "enUS"

local L = {
    ADDON_NAME = "Chat Height Expander",
    TITLE = "Chat Height Expander",
    CONFIG_TITLE = "Chat Height Expander - Options",
    OPTIONS_PANEL_HINT = "These settings also affect the small chat button and /che command.",
    COLLAPSED_HEIGHT = "Compact height",
    EXPANDED_HEIGHT = "Expanded height",
    SHOW_BUTTON = "Show chat button",
    BUTTON_POSITION = "Button position",
    TOPRIGHT = "Top right",
    TOPLEFT = "Top left",
    BOTTOMRIGHT = "Bottom right",
    BOTTOMLEFT = "Bottom left",
    APPLY = "Apply",
    USE_CURRENT = "Use Current as Compact",
    RESET = "Reset",
    CREATE_MACROS = "Create Macros",
    CLOSE = "Close",
    EXPAND_TOOLTIP = "Click to expand the chat.",
    COLLAPSE_TOOLTIP = "Click to compact the chat.",
    INVALID_HEIGHT = "Use a number greater than or equal to 60.",
    HEIGHT_SAVED = "Height saved:",
    BUTTON_VISIBLE = "Button visible.",
    BUTTON_HIDDEN = "Button hidden. Use /che button or /che config to show it again.",
    CONFIG_RESET = "Settings reset.",
    CONFIG_APPLIED = "Settings applied.",
    CURRENT_SAVED = "Current chat height saved as compact height.",
    MACROS_CREATED = "Macros created or updated.",
    MACRO_FULL = "There is no room to create a global macro. Create macros manually with: /che and /che config",
    HELP_TOGGLE = "/che - toggles compact/expanded chat.",
    HELP_CONFIG = "/che config - opens options.",
    HELP_COLLAPSED = "/che collapsed 160 - sets compact height.",
    HELP_EXPANDED = "/che expanded 360 - sets expanded height.",
    HELP_BUTTON = "/che button - shows/hides the button.",
    HELP_RESET = "/che reset - restores defaults.",
}

if LOCALE == "ptBR" then
    L = {
        ADDON_NAME = "Chat Height Expander",
        TITLE = "Chat Height Expander",
        CONFIG_TITLE = "Chat Height Expander - Opcoes",
        OPTIONS_PANEL_HINT = "Estas opcoes tambem afetam o botao pequeno do chat e o comando /che.",
        COLLAPSED_HEIGHT = "Altura compacta",
        EXPANDED_HEIGHT = "Altura expandida",
        SHOW_BUTTON = "Mostrar botao no chat",
        BUTTON_POSITION = "Posicao do botao",
        TOPRIGHT = "Superior direita",
        TOPLEFT = "Superior esquerda",
        BOTTOMRIGHT = "Inferior direita",
        BOTTOMLEFT = "Inferior esquerda",
        APPLY = "Aplicar",
        USE_CURRENT = "Usar Altura Atual como Compacta",
        RESET = "Resetar",
        CREATE_MACROS = "Criar Macros",
        CLOSE = "Fechar",
        EXPAND_TOOLTIP = "Clique para expandir o chat.",
        COLLAPSE_TOOLTIP = "Clique para compactar o chat.",
        INVALID_HEIGHT = "Use um numero maior ou igual a 60.",
        HEIGHT_SAVED = "Altura salva:",
        BUTTON_VISIBLE = "Botao visivel.",
        BUTTON_HIDDEN = "Botao oculto. Use /che botao ou /che config para mostrar de novo.",
        CONFIG_RESET = "Configuracao restaurada.",
        CONFIG_APPLIED = "Configuracao aplicada.",
        CURRENT_SAVED = "Altura atual do chat salva como altura compacta.",
        MACROS_CREATED = "Macros criadas ou atualizadas.",
        MACRO_FULL = "Nao ha espaco para criar uma macro geral. Crie manualmente macros com: /che e /che config",
        HELP_TOGGLE = "/che - alterna entre compacto e expandido.",
        HELP_CONFIG = "/che config - abre as opcoes.",
        HELP_COLLAPSED = "/che compacta 160 - define a altura compacta.",
        HELP_EXPANDED = "/che expandida 360 - define a altura expandida.",
        HELP_BUTTON = "/che botao - mostra/oculta o botao.",
        HELP_RESET = "/che reset - volta para os valores padrao.",
    }
end

local DEFAULTS = {
    collapsedHeight = 160,
    expandedHeight = 360,
    expanded = false,
    buttonShown = true,
    buttonPosition = "TOPRIGHT",
    initialized = false,
}

local BUTTON_POSITIONS = {
    { value = "TOPRIGHT", label = L.TOPRIGHT, point = "TOPRIGHT", relativePoint = "TOPRIGHT", x = -2, y = -2 },
    { value = "TOPLEFT", label = L.TOPLEFT, point = "TOPLEFT", relativePoint = "TOPLEFT", x = 2, y = -2 },
    { value = "BOTTOMRIGHT", label = L.BOTTOMRIGHT, point = "BOTTOMRIGHT", relativePoint = "BOTTOMRIGHT", x = -2, y = 2 },
    { value = "BOTTOMLEFT", label = L.BOTTOMLEFT, point = "BOTTOMLEFT", relativePoint = "BOTTOMLEFT", x = 2, y = 2 },
}

local db
local buttons = {}
local hookedChatFrames = {}
local configWindow
local optionsPanel
local configControls = {}

local function CopyDefaults(target, defaults)
    for key, value in pairs(defaults) do
        if target[key] == nil then
            target[key] = value
        end
    end
end

local function Print(message)
    DEFAULT_CHAT_FRAME:AddMessage("|cff66ccff" .. L.ADDON_NAME .. ":|r " .. message)
end

local function GetChatFrame()
    return SELECTED_CHAT_FRAME or _G.ChatFrame1
end

local function GetChatFrameCount()
    return NUM_CHAT_WINDOWS or 10
end

local function GetButtonPosition(value)
    for _, position in ipairs(BUTTON_POSITIONS) do
        if position.value == value then
            return position
        end
    end
    return BUTTON_POSITIONS[1]
end

local function SaveChatSize(frame)
    if FCF_SavePositionAndDimensions then
        FCF_SavePositionAndDimensions(frame)
    end
end

local function SetChatHeight(frame, height)
    if frame then
        frame:SetHeight(height)
        SaveChatSize(frame)
    end
end

local function SetAllChatHeights(height)
    for index = 1, GetChatFrameCount() do
        SetChatHeight(_G["ChatFrame" .. index], height)
    end
end

local function PositionButton(frame, button)
    local position = GetButtonPosition(db.buttonPosition)
    button:ClearAllPoints()
    button:SetPoint(position.point, frame, position.relativePoint, position.x, position.y)
end

local function RefreshChatButtons()
    if not db then
        return
    end

    for frame, chatButton in pairs(buttons) do
        PositionButton(frame, chatButton)

        if db.buttonShown then
            chatButton:Show()
        else
            chatButton:Hide()
        end

        if db.expanded then
            chatButton:SetText("-")
            chatButton:SetScript("OnEnter", function(self)
                GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
                GameTooltip:SetText(L.TITLE)
                GameTooltip:AddLine(L.COLLAPSE_TOOLTIP, 1, 1, 1)
                GameTooltip:Show()
            end)
        else
            chatButton:SetText("+")
            chatButton:SetScript("OnEnter", function(self)
                GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
                GameTooltip:SetText(L.TITLE)
                GameTooltip:AddLine(L.EXPAND_TOOLTIP, 1, 1, 1)
                GameTooltip:Show()
            end)
        end
    end
end

local function ApplyState()
    SetAllChatHeights(db.expanded and db.expandedHeight or db.collapsedHeight)
    RefreshChatButtons()
end

local function LearnCurrentChatHeight()
    if db.initialized then
        return
    end

    local frame = GetChatFrame()
    if not frame then
        return
    end

    local currentHeight = math.floor(frame:GetHeight() + 0.5)
    db.collapsedHeight = currentHeight
    db.expandedHeight = math.max(currentHeight + 180, DEFAULTS.expandedHeight)
    db.initialized = true
end

local function Toggle()
    db.expanded = not db.expanded
    ApplyState()
end

local function CreateChatButton(frame, index)
    if not frame or buttons[frame] then
        return
    end

    local chatButton = CreateFrame("Button", "ChatHeightExpanderButton" .. index, frame, "UIPanelButtonTemplate")
    chatButton:SetSize(20, 20)
    chatButton:SetFrameStrata(frame:GetFrameStrata())
    chatButton:SetFrameLevel(frame:GetFrameLevel() + 20)
    chatButton:SetScript("OnClick", Toggle)
    chatButton:SetScript("OnLeave", function()
        GameTooltip:Hide()
    end)

    buttons[frame] = chatButton

    if not hookedChatFrames[frame] then
        hookedChatFrames[frame] = true
        frame:HookScript("OnShow", RefreshChatButtons)
    end
end

local function CreateChatButtons()
    for index = 1, GetChatFrameCount() do
        CreateChatButton(_G["ChatFrame" .. index], index)
    end

    RefreshChatButtons()
end

local function CreateLabel(parent, text)
    local label = parent:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
    label:SetText(text)
    return label
end

local function CreateButtonControl(parent, text, width)
    local control = CreateFrame("Button", nil, parent, "UIPanelButtonTemplate")
    control:SetSize(width or 110, 24)
    control:SetText(text)
    return control
end

local function CreateEditBox(parent, width, closeOnEscape)
    local edit = CreateFrame("EditBox", nil, parent, "InputBoxTemplate")
    edit:SetSize(width or 80, 24)
    edit:SetFontObject(ChatFontNormal)
    edit:SetTextColor(1, 1, 1, 1)
    edit:SetJustifyH("LEFT")
    edit:SetAutoFocus(false)
    edit:SetMaxLetters(5)
    edit:SetScript("OnEscapePressed", function(self)
        self:ClearFocus()
        if closeOnEscape and configWindow then
            configWindow:Hide()
        end
    end)
    edit:SetScript("OnEnterPressed", function(self)
        self:ClearFocus()
    end)
    return edit
end

local function CreateDropdown(parent, name, width)
    local dropdown = CreateFrame("Frame", name, parent, "UIDropDownMenuTemplate")
    UIDropDownMenu_SetWidth(dropdown, width or 150)
    return dropdown
end

local function SetDropdownText(dropdown, text)
    if UIDropDownMenu_SetText then
        UIDropDownMenu_SetText(dropdown, text)
    elseif dropdown:GetName() and _G[dropdown:GetName() .. "Text"] then
        _G[dropdown:GetName() .. "Text"]:SetText(text)
    end
end

local function RegisterConfigControls(owner)
    table.insert(configControls, owner)
end

local function RefreshConfigControls()
    if not db then
        return
    end

    for _, owner in ipairs(configControls) do
        owner.collapsedBox:SetText(tostring(db.collapsedHeight or DEFAULTS.collapsedHeight))
        owner.expandedBox:SetText(tostring(db.expandedHeight or DEFAULTS.expandedHeight))
        owner.showButton:SetChecked(db.buttonShown and true or false)
        SetDropdownText(owner.positionDropdown, GetButtonPosition(db.buttonPosition).label)
    end
end

local function ReadHeight(editBox)
    local value = tonumber(editBox:GetText() or "")
    if not value or value < 60 then
        return nil
    end
    return math.floor(value + 0.5)
end

local function ApplyConfigControls(owner)
    local collapsedHeight = ReadHeight(owner.collapsedBox)
    local expandedHeight = ReadHeight(owner.expandedBox)

    if not collapsedHeight or not expandedHeight then
        Print(L.INVALID_HEIGHT)
        RefreshConfigControls()
        return
    end

    db.collapsedHeight = collapsedHeight
    db.expandedHeight = expandedHeight
    db.buttonShown = owner.showButton:GetChecked() and true or false
    ApplyState()
    RefreshConfigControls()
    Print(L.CONFIG_APPLIED)
end

local function UseCurrentAsCompact()
    local frame = GetChatFrame()
    if not frame then
        return
    end

    db.collapsedHeight = math.floor(frame:GetHeight() + 0.5)
    db.initialized = true
    RefreshConfigControls()
    ApplyState()
    Print(L.CURRENT_SAVED)
end

local function ResetConfig()
    for key, value in pairs(DEFAULTS) do
        db[key] = value
    end
    RefreshConfigControls()
    ApplyState()
    Print(L.CONFIG_RESET)
end

local function HasGlobalMacroSpace()
    if not GetNumMacros then
        return true
    end

    local globalMacros = GetNumMacros()
    local maxGlobalMacros = MAX_ACCOUNT_MACROS or 120
    return (globalMacros or 0) < maxGlobalMacros
end

local function HasGlobalMacroSpaceFor(count)
    if not GetNumMacros then
        return true
    end

    local globalMacros = GetNumMacros()
    local maxGlobalMacros = MAX_ACCOUNT_MACROS or 120
    return ((globalMacros or 0) + count) <= maxGlobalMacros
end

local function CreateOrUpdateMacro(name, body)
    local icon = "INV_Misc_Note_01"
    local macroIndex = GetMacroIndexByName and GetMacroIndexByName(name) or 0

    if macroIndex and macroIndex > 0 then
        EditMacro(macroIndex, name, icon, body, nil, nil)
        return true
    end

    if not HasGlobalMacroSpace() then
        return false
    end

    CreateMacro(name, icon, body, nil, nil)
    return true
end

local function CreateMacros()
    if not CreateMacro or not EditMacro then
        Print(L.MACRO_FULL)
        return
    end

    local missing = 0
    local toggleIndex = GetMacroIndexByName and GetMacroIndexByName("CHE Toggle") or 0
    local optionsIndex = GetMacroIndexByName and GetMacroIndexByName("CHE Options") or 0
    if not toggleIndex or toggleIndex == 0 then
        missing = missing + 1
    end
    if not optionsIndex or optionsIndex == 0 then
        missing = missing + 1
    end
    if not HasGlobalMacroSpaceFor(missing) then
        Print(L.MACRO_FULL)
        return
    end

    local toggleOk = CreateOrUpdateMacro("CHE Toggle", "/che")
    local optionsOk = CreateOrUpdateMacro("CHE Options", "/che config")

    if toggleOk and optionsOk then
        Print(L.MACROS_CREATED)
    else
        Print(L.MACRO_FULL)
    end
end

local function AddConfigControls(parent, prefix, topOffset, includeCloseButton)
    local owner = parent
    topOffset = topOffset or 0

    local collapsedLabel = CreateLabel(parent, L.COLLAPSED_HEIGHT)
    collapsedLabel:SetPoint("TOPLEFT", 24, -46 - topOffset)
    owner.collapsedBox = CreateEditBox(parent, 80, includeCloseButton)
    owner.collapsedBox:SetPoint("LEFT", collapsedLabel, "RIGHT", 24, 0)

    local expandedLabel = CreateLabel(parent, L.EXPANDED_HEIGHT)
    expandedLabel:SetPoint("TOPLEFT", 24, -82 - topOffset)
    owner.expandedBox = CreateEditBox(parent, 80, includeCloseButton)
    owner.expandedBox:SetPoint("LEFT", expandedLabel, "RIGHT", 18, 0)

    owner.showButton = CreateFrame("CheckButton", nil, parent, "InterfaceOptionsCheckButtonTemplate")
    owner.showButton:SetPoint("TOPLEFT", 20, -116 - topOffset)
    owner.showButton.Text:SetText(L.SHOW_BUTTON)
    owner.showButton:SetScript("OnClick", function(self)
        db.buttonShown = self:GetChecked() and true or false
        RefreshChatButtons()
        RefreshConfigControls()
    end)

    local positionLabel = CreateLabel(parent, L.BUTTON_POSITION)
    positionLabel:SetPoint("TOPLEFT", 24, -154 - topOffset)
    owner.positionDropdown = CreateDropdown(parent, prefix .. "PositionDropdown", 170)
    owner.positionDropdown:SetPoint("TOPLEFT", 145, -148 - topOffset)
    UIDropDownMenu_Initialize(owner.positionDropdown, function(dropdown, level)
        if level ~= 1 then
            return
        end

        for _, position in ipairs(BUTTON_POSITIONS) do
            local info = UIDropDownMenu_CreateInfo()
            info.text = position.label
            info.checked = db.buttonPosition == position.value
            info.func = function()
                db.buttonPosition = position.value
                SetDropdownText(dropdown, position.label)
                RefreshChatButtons()
                RefreshConfigControls()
            end
            UIDropDownMenu_AddButton(info, level)
        end
    end)

    local applyButton = CreateButtonControl(parent, L.APPLY, 90)
    applyButton:SetPoint("TOPLEFT", 24, -198 - topOffset)
    applyButton:SetScript("OnClick", function()
        ApplyConfigControls(owner)
    end)

    local currentButton = CreateButtonControl(parent, L.USE_CURRENT, 190)
    currentButton:SetPoint("LEFT", applyButton, "RIGHT", 8, 0)
    currentButton:SetScript("OnClick", UseCurrentAsCompact)

    local resetButton = CreateButtonControl(parent, L.RESET, 90)
    resetButton:SetPoint("TOPLEFT", 24, -232 - topOffset)
    resetButton:SetScript("OnClick", ResetConfig)

    local macroButton = CreateButtonControl(parent, L.CREATE_MACROS, 130)
    macroButton:SetPoint("LEFT", resetButton, "RIGHT", 8, 0)
    macroButton:SetScript("OnClick", CreateMacros)

    if includeCloseButton then
        local closeButton = CreateButtonControl(parent, L.CLOSE, 90)
        closeButton:SetPoint("LEFT", macroButton, "RIGHT", 8, 0)
        closeButton:SetScript("OnClick", function()
            parent:Hide()
        end)
    end

    RegisterConfigControls(owner)
end

local function CreateConfigWindow()
    if configWindow then
        return configWindow
    end

    local frame = CreateFrame("Frame", "ChatHeightExpanderConfigWindow", UIParent, "BasicFrameTemplateWithInset")
    frame:SetSize(420, 300)
    frame:SetPoint("CENTER")
    frame:SetFrameStrata("DIALOG")
    frame:SetMovable(true)
    frame:EnableMouse(true)
    frame:RegisterForDrag("LeftButton")
    frame:SetScript("OnDragStart", frame.StartMoving)
    frame:SetScript("OnDragStop", frame.StopMovingOrSizing)
    frame:Hide()

    if UISpecialFrames then
        table.insert(UISpecialFrames, "ChatHeightExpanderConfigWindow")
    end

    local title = frame:CreateFontString(nil, "OVERLAY", "GameFontHighlight")
    title:SetPoint("TOP", frame, "TOP", 0, -6)
    title:SetText(L.CONFIG_TITLE)

    AddConfigControls(frame, "ChatHeightExpanderWindow", 0, true)

    configWindow = frame
    return frame
end

local function CreateOptionsPanel()
    if optionsPanel then
        return optionsPanel
    end

    local panel = CreateFrame("Frame", "ChatHeightExpanderOptionsPanel", UIParent)
    panel.name = L.ADDON_NAME
    panel:SetSize(560, 360)
    panel:Hide()

    local title = panel:CreateFontString(nil, "ARTWORK", "GameFontNormalLarge")
    title:SetPoint("TOPLEFT", 16, -16)
    title:SetText(L.TITLE)

    local hint = panel:CreateFontString(nil, "ARTWORK", "GameFontHighlightSmall")
    hint:SetPoint("TOPLEFT", 16, -42)
    hint:SetText(L.OPTIONS_PANEL_HINT)
    hint:SetWidth(500)
    hint:SetJustifyH("LEFT")

    AddConfigControls(panel, "ChatHeightExpanderOptions", 32, false)
    panel:SetScript("OnShow", RefreshConfigControls)

    if InterfaceOptions_AddCategory then
        InterfaceOptions_AddCategory(panel)
    elseif Settings and Settings.RegisterCanvasLayoutCategory then
        local category = Settings.RegisterCanvasLayoutCategory(panel, panel.name)
        Settings.RegisterAddOnCategory(category)
    end

    optionsPanel = panel
    return panel
end

local function OpenConfig()
    CreateConfigWindow()
    RefreshConfigControls()
    configWindow:Show()
end

local function SetNumberOption(option, value)
    value = tonumber(value)
    if not value or value < 60 then
        Print(L.INVALID_HEIGHT)
        return
    end

    db[option] = math.floor(value + 0.5)
    ApplyState()
    RefreshConfigControls()
    Print(L.HEIGHT_SAVED .. " " .. db[option] .. ".")
end

local function ShowHelp()
    Print(L.HELP_TOGGLE)
    Print(L.HELP_CONFIG)
    Print(L.HELP_COLLAPSED)
    Print(L.HELP_EXPANDED)
    Print(L.HELP_BUTTON)
    Print(L.HELP_RESET)
end

local function HandleSlash(input)
    local command, value = string.match(string.lower(input or ""), "^(%S*)%s*(.*)$")

    if command == "" then
        Toggle()
    elseif command == "config" or command == "options" or command == "opcoes" then
        OpenConfig()
    elseif command == "compacta" or command == "normal" or command == "collapsed" then
        SetNumberOption("collapsedHeight", value)
    elseif command == "expandida" or command == "expanded" then
        SetNumberOption("expandedHeight", value)
    elseif command == "botao" or command == "button" then
        db.buttonShown = not db.buttonShown
        RefreshChatButtons()
        RefreshConfigControls()
        Print(db.buttonShown and L.BUTTON_VISIBLE or L.BUTTON_HIDDEN)
    elseif command == "reset" then
        ResetConfig()
    else
        ShowHelp()
    end
end

local events = CreateFrame("Frame")
events:RegisterEvent("ADDON_LOADED")
events:RegisterEvent("PLAYER_LOGIN")
events:SetScript("OnEvent", function(_, event, addonName)
    if event == "ADDON_LOADED" and addonName == ADDON_NAME then
        ChatHeightExpanderDB = ChatHeightExpanderDB or {}
        db = ChatHeightExpanderDB
        CopyDefaults(db, DEFAULTS)

        SLASH_CHATHEIGHTEXPANDER1 = "/che"
        SLASH_CHATHEIGHTEXPANDER2 = "/chatheight"
        SlashCmdList.CHATHEIGHTEXPANDER = HandleSlash
        CreateOptionsPanel()
    elseif event == "PLAYER_LOGIN" then
        if not db then
            ChatHeightExpanderDB = ChatHeightExpanderDB or {}
            db = ChatHeightExpanderDB
            CopyDefaults(db, DEFAULTS)
        end

        C_Timer.After(0.5, function()
            LearnCurrentChatHeight()
            CreateChatButtons()
            ApplyState()
            RefreshConfigControls()
        end)
    end
end)
