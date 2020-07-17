local Image = GLOBAL.require("widgets/image")
local ImageButton = GLOBAL.require("widgets/imagebutton")

local TheNet = GLOBAL.TheNet
local RESOLUTION_X = GLOBAL.RESOLUTION_X
local RESOLUTION_Y = GLOBAL.RESOLUTION_Y
local TITLEFONT = GLOBAL.TITLEFONT

local config = {
    btn_title = "前往稻花村",
    ip = "106.55.251.15",
    port = 10999,
    password = "df"
}

local function onConnect()
    GLOBAL.c_connect(config.ip, config.port, config.password)
    -- if not InGamePlay() and TheNet:StartClient(config.ip, config.port, 0, config.password) then
    --     DisableAllDLC()
    --     return true
    -- end
    -- return false
end

local function mainscreen_modify(self)
    local btn = self.fixed_root:AddChild(ImageButton("images/frontscreen.xml", "play_highlight.tex", nil, nil, nil, nil, {1,1}, {0,0}))--"highlight.tex", "highlight_hover.tex"))
    btn.bg = btn:AddChild(Image("images/frontscreen.xml", "play_highlight_hover.tex"))
    btn.bg:SetScale(.69, .53)
    btn.bg:MoveToBack()
    btn.bg:Hide()

    if PLATFORM == "WIN32_RAIL" then
		btn.image:SetPosition(0,0)
		btn.bg:SetPosition(0,0)
	else
		btn.image:SetPosition(0,3)
		btn.bg:SetPosition(0,3)
    end

    btn:SetPosition(-RESOLUTION_X*.35, -80)
    btn:SetTextColour(1, 1, 1, 1)
    btn:SetTextFocusColour(1, 1, 1, 1)
    btn:SetTextDisabledColour({1,1,1,1})
    btn:SetNormalScale(.65, .5)
    btn:SetFocusScale(.7, .55)
    btn:SetTextSize(55)
    btn:SetFont(TITLEFONT)
    btn:SetDisabledFont(TITLEFONT)
    btn:SetText(config.btn_title, true, {2,-3})

    local playgainfocusfn = btn.OnGainFocus
    btn.OnGainFocus = function()
        playgainfocusfn(btn)
		if PLATFORM == "WIN32_RAIL" then
			btn:SetTextSize(48)
		else
			btn:SetTextSize(58)
		end
        btn.image:SetTint(1,1,1,1)
        btn.bg:Show()
    end

    local playlosefocusfn = btn.OnLoseFocus
    btn.OnLoseFocus = function()
        playlosefocusfn(btn)
        if PLATFORM == "WIN32_RAIL" then
			btn:SetTextSize(45)
		else
			btn:SetTextSize(55)
		end
        btn.image:SetTint(1,1,1,.6)
        btn.bg:Hide()
    end

    btn:SetOnClick(function()
        onConnect()
    end)
end
AddClassPostConstruct("screens/redux/mainscreen", mainscreen_modify)

local function multiplayermainscreen_modify(self)
    local btn = self.fixed_root:AddChild(ImageButton("images/frontscreen.xml", "play_highlight.tex", nil, nil, nil, nil, {1,1}, {0,0}))--"highlight.tex", "highlight_hover.tex"))
    btn.bg = btn:AddChild(Image("images/frontscreen.xml", "play_highlight_hover.tex"))
    btn.bg:SetScale(.69, .53)
    btn.bg:MoveToBack()
    btn.bg:Hide()

    if PLATFORM == "WIN32_RAIL" then
		btn.image:SetPosition(0,0)
		btn.bg:SetPosition(0,0)
	else
		btn.image:SetPosition(0,3)
		btn.bg:SetPosition(0,3)
    end

    btn:SetPosition(-RESOLUTION_X/2 + 180, 30)
    btn:SetTextColour(1, 1, 1, 1)
    btn:SetTextFocusColour(1, 1, 1, 1)
    btn:SetTextDisabledColour({1,1,1,1})
    btn:SetNormalScale(.65, .5)
    btn:SetFocusScale(.7, .55)
    btn:SetTextSize(55)
    btn:SetFont(TITLEFONT)
    btn:SetDisabledFont(TITLEFONT)
    btn:SetText(config.btn_title, true, {2,-3})

    local playgainfocusfn = btn.OnGainFocus
    btn.OnGainFocus = function()
        playgainfocusfn(btn)
		if PLATFORM == "WIN32_RAIL" then
			btn:SetTextSize(48)
		else
			btn:SetTextSize(58)
		end
        btn.image:SetTint(1,1,1,1)
        btn.bg:Show()
    end

    local playlosefocusfn = btn.OnLoseFocus
    btn.OnLoseFocus = function()
        playlosefocusfn(btn)
        if PLATFORM == "WIN32_RAIL" then
			btn:SetTextSize(45)
		else
			btn:SetTextSize(55)
		end
        btn.image:SetTint(1,1,1,.6)
        btn.bg:Hide()
    end

    btn:SetOnClick(function()
        onConnect()
    end)
end
AddClassPostConstruct("screens/redux/multiplayermainscreen", multiplayermainscreen_modify)