local Image = GLOBAL.require("widgets/image")
local ImageButton = GLOBAL.require("widgets/imagebutton")

local RESOLUTION_X = GLOBAL.RESOLUTION_X
local RESOLUTION_Y = GLOBAL.RESOLUTION_Y
local TITLEFONT = GLOBAL.TITLEFONT

local btnCfg = {
    {
        btn_title = "前往稻花村1",
        ip = "106.55.251.15",
        port = 10999,
        password = "df"
    },
    {
        btn_title = "前往稻花村2",
        ip = "106.55.251.15",
        port = 11001,
        password = "df"
    },
}

local function mainscreen_modify(self)
    for k, v in pairs(btnCfg) do
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

        btn:SetPosition(-RESOLUTION_X*.35, -(k*80))
        btn:SetTextColour(1, 1, 1, 1)
        btn:SetTextFocusColour(1, 1, 1, 1)
        btn:SetTextDisabledColour({1,1,1,1})
        btn:SetNormalScale(.65, .5)
        btn:SetFocusScale(.7, .55)
        btn:SetTextSize(55)
        btn:SetFont(TITLEFONT)
        btn:SetDisabledFont(TITLEFONT)
        btn:SetText(v.btn_title, true, {2,-3})

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
            GLOBAL.c_connect(v.ip, v.port, v.password)
        end)
    end
end
AddClassPostConstruct("screens/redux/mainscreen", mainscreen_modify)

local function multiplayermainscreen_modify(self)
    for k, v in pairs(btnCfg) do
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

        btn:SetPosition(-RESOLUTION_X/2 + 180, 320 -(k*80))
        btn:SetTextColour(1, 1, 1, 1)
        btn:SetTextFocusColour(1, 1, 1, 1)
        btn:SetTextDisabledColour({1,1,1,1})
        btn:SetNormalScale(.65, .5)
        btn:SetFocusScale(.7, .55)
        btn:SetTextSize(55)
        btn:SetFont(TITLEFONT)
        btn:SetDisabledFont(TITLEFONT)
        btn:SetText(v.btn_title, true, {2,-3})

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
            GLOBAL.c_connect(v.ip, v.port, v.password)
        end)
    end
end
AddClassPostConstruct("screens/redux/multiplayermainscreen", multiplayermainscreen_modify)