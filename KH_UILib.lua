local XeioaUiLibs = {}
XeioaUiLibs.__index = XeioaUiLibs

local Players          = game:GetService("Players")
local TweenService     = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local RunService       = game:GetService("RunService")
local CoreGui          = game:GetService("CoreGui")
local HttpService      = game:GetService("HttpService")

local LocalPlayer = Players.LocalPlayer

local Themes = {
    Dark = {
        Background    = Color3.fromRGB(13, 13, 16),
        Surface       = Color3.fromRGB(20, 20, 25),
        SurfaceAlt    = Color3.fromRGB(28, 28, 35),
        SurfaceHover  = Color3.fromRGB(35, 35, 45),
        Border        = Color3.fromRGB(42, 42, 55),
        BorderFocus   = Color3.fromRGB(80, 80, 110),
        Accent        = Color3.fromRGB(99, 102, 241),
        AccentDim     = Color3.fromRGB(60, 63, 180),
        AccentHover   = Color3.fromRGB(120, 124, 255),
        TextPrimary   = Color3.fromRGB(240, 240, 248),
        TextSecondary = Color3.fromRGB(140, 140, 165),
        TextDim       = Color3.fromRGB(75, 75, 100),
        Toggle_ON     = Color3.fromRGB(99, 102, 241),
        Toggle_OFF    = Color3.fromRGB(45, 45, 60),
        Slider_Fill   = Color3.fromRGB(99, 102, 241),
        Slider_BG     = Color3.fromRGB(35, 35, 48),
        TabActive     = Color3.fromRGB(99, 102, 241),
        TabInactive   = Color3.fromRGB(28, 28, 38),
        ScrollBar     = Color3.fromRGB(99, 102, 241),
        Success       = Color3.fromRGB(52, 211, 153),
        Warning       = Color3.fromRGB(251, 191, 36),
        Danger        = Color3.fromRGB(239, 68, 68),
        Info          = Color3.fromRGB(56, 189, 248),
    },
    Light = {
        Background    = Color3.fromRGB(245, 245, 250),
        Surface       = Color3.fromRGB(255, 255, 255),
        SurfaceAlt    = Color3.fromRGB(235, 235, 245),
        SurfaceHover  = Color3.fromRGB(225, 225, 240),
        Border        = Color3.fromRGB(200, 200, 215),
        BorderFocus   = Color3.fromRGB(130, 130, 200),
        Accent        = Color3.fromRGB(79, 82, 221),
        AccentDim     = Color3.fromRGB(60, 63, 180),
        AccentHover   = Color3.fromRGB(100, 104, 255),
        TextPrimary   = Color3.fromRGB(20, 20, 30),
        TextSecondary = Color3.fromRGB(90, 90, 120),
        TextDim       = Color3.fromRGB(150, 150, 175),
        Toggle_ON     = Color3.fromRGB(79, 82, 221),
        Toggle_OFF    = Color3.fromRGB(200, 200, 215),
        Slider_Fill   = Color3.fromRGB(79, 82, 221),
        Slider_BG     = Color3.fromRGB(210, 210, 230),
        TabActive     = Color3.fromRGB(79, 82, 221),
        TabInactive   = Color3.fromRGB(235, 235, 245),
        ScrollBar     = Color3.fromRGB(79, 82, 221),
        Success       = Color3.fromRGB(16, 185, 129),
        Warning       = Color3.fromRGB(245, 158, 11),
        Danger        = Color3.fromRGB(220, 38, 38),
        Info          = Color3.fromRGB(14, 165, 233),
    },
    Midnight = {
        Background    = Color3.fromRGB(8, 8, 20),
        Surface       = Color3.fromRGB(14, 14, 32),
        SurfaceAlt    = Color3.fromRGB(22, 22, 45),
        SurfaceHover  = Color3.fromRGB(30, 30, 58),
        Border        = Color3.fromRGB(40, 40, 80),
        BorderFocus   = Color3.fromRGB(100, 80, 200),
        Accent        = Color3.fromRGB(168, 85, 247),
        AccentDim     = Color3.fromRGB(110, 50, 180),
        AccentHover   = Color3.fromRGB(192, 120, 255),
        TextPrimary   = Color3.fromRGB(235, 230, 255),
        TextSecondary = Color3.fromRGB(130, 120, 175),
        TextDim       = Color3.fromRGB(70, 60, 110),
        Toggle_ON     = Color3.fromRGB(168, 85, 247),
        Toggle_OFF    = Color3.fromRGB(40, 35, 70),
        Slider_Fill   = Color3.fromRGB(168, 85, 247),
        Slider_BG     = Color3.fromRGB(35, 30, 65),
        TabActive     = Color3.fromRGB(168, 85, 247),
        TabInactive   = Color3.fromRGB(22, 20, 45),
        ScrollBar     = Color3.fromRGB(168, 85, 247),
        Success       = Color3.fromRGB(52, 211, 153),
        Warning       = Color3.fromRGB(251, 191, 36),
        Danger        = Color3.fromRGB(239, 68, 68),
        Info          = Color3.fromRGB(56, 189, 248),
    },
    Ocean = {
        Background    = Color3.fromRGB(6, 15, 28),
        Surface       = Color3.fromRGB(10, 22, 42),
        SurfaceAlt    = Color3.fromRGB(14, 30, 56),
        SurfaceHover  = Color3.fromRGB(18, 38, 70),
        Border        = Color3.fromRGB(28, 55, 95),
        BorderFocus   = Color3.fromRGB(50, 120, 200),
        Accent        = Color3.fromRGB(14, 165, 233),
        AccentDim     = Color3.fromRGB(8, 110, 175),
        AccentHover   = Color3.fromRGB(56, 189, 248),
        TextPrimary   = Color3.fromRGB(224, 242, 254),
        TextSecondary = Color3.fromRGB(100, 160, 210),
        TextDim       = Color3.fromRGB(55, 100, 150),
        Toggle_ON     = Color3.fromRGB(14, 165, 233),
        Toggle_OFF    = Color3.fromRGB(20, 45, 75),
        Slider_Fill   = Color3.fromRGB(14, 165, 233),
        Slider_BG     = Color3.fromRGB(15, 35, 60),
        TabActive     = Color3.fromRGB(14, 165, 233),
        TabInactive   = Color3.fromRGB(12, 25, 48),
        ScrollBar     = Color3.fromRGB(14, 165, 233),
        Success       = Color3.fromRGB(52, 211, 153),
        Warning       = Color3.fromRGB(251, 191, 36),
        Danger        = Color3.fromRGB(239, 68, 68),
        Info          = Color3.fromRGB(56, 189, 248),
    },
    Forest = {
        Background    = Color3.fromRGB(8, 16, 10),
        Surface       = Color3.fromRGB(12, 24, 15),
        SurfaceAlt    = Color3.fromRGB(18, 34, 22),
        SurfaceHover  = Color3.fromRGB(24, 44, 30),
        Border        = Color3.fromRGB(35, 65, 42),
        BorderFocus   = Color3.fromRGB(70, 140, 85),
        Accent        = Color3.fromRGB(52, 211, 99),
        AccentDim     = Color3.fromRGB(30, 140, 60),
        AccentHover   = Color3.fromRGB(74, 232, 120),
        TextPrimary   = Color3.fromRGB(220, 248, 225),
        TextSecondary = Color3.fromRGB(100, 185, 120),
        TextDim       = Color3.fromRGB(55, 110, 68),
        Toggle_ON     = Color3.fromRGB(52, 211, 99),
        Toggle_OFF    = Color3.fromRGB(20, 50, 26),
        Slider_Fill   = Color3.fromRGB(52, 211, 99),
        Slider_BG     = Color3.fromRGB(15, 38, 20),
        TabActive     = Color3.fromRGB(52, 211, 99),
        TabInactive   = Color3.fromRGB(14, 28, 18),
        ScrollBar     = Color3.fromRGB(52, 211, 99),
        Success       = Color3.fromRGB(52, 211, 153),
        Warning       = Color3.fromRGB(251, 191, 36),
        Danger        = Color3.fromRGB(239, 68, 68),
        Info          = Color3.fromRGB(56, 189, 248),
    },
    Sunset = {
        Background    = Color3.fromRGB(18, 10, 8),
        Surface       = Color3.fromRGB(28, 16, 12),
        SurfaceAlt    = Color3.fromRGB(40, 22, 15),
        SurfaceHover  = Color3.fromRGB(52, 28, 18),
        Border        = Color3.fromRGB(75, 42, 25),
        BorderFocus   = Color3.fromRGB(180, 100, 40),
        Accent        = Color3.fromRGB(249, 115, 22),
        AccentDim     = Color3.fromRGB(180, 75, 12),
        AccentHover   = Color3.fromRGB(251, 146, 60),
        TextPrimary   = Color3.fromRGB(255, 237, 213),
        TextSecondary = Color3.fromRGB(200, 130, 80),
        TextDim       = Color3.fromRGB(120, 75, 45),
        Toggle_ON     = Color3.fromRGB(249, 115, 22),
        Toggle_OFF    = Color3.fromRGB(55, 30, 15),
        Slider_Fill   = Color3.fromRGB(249, 115, 22),
        Slider_BG     = Color3.fromRGB(45, 24, 12),
        TabActive     = Color3.fromRGB(249, 115, 22),
        TabInactive   = Color3.fromRGB(35, 20, 12),
        ScrollBar     = Color3.fromRGB(249, 115, 22),
        Success       = Color3.fromRGB(52, 211, 153),
        Warning       = Color3.fromRGB(251, 191, 36),
        Danger        = Color3.fromRGB(239, 68, 68),
        Info          = Color3.fromRGB(56, 189, 248),
    },
    Crimson = {
        Background    = Color3.fromRGB(13, 8, 8),
        Surface       = Color3.fromRGB(22, 14, 14),
        SurfaceAlt    = Color3.fromRGB(32, 20, 20),
        SurfaceHover  = Color3.fromRGB(42, 26, 26),
        Border        = Color3.fromRGB(65, 30, 30),
        BorderFocus   = Color3.fromRGB(160, 50, 50),
        Accent        = Color3.fromRGB(239, 68, 68),
        AccentDim     = Color3.fromRGB(160, 38, 38),
        AccentHover   = Color3.fromRGB(252, 100, 100),
        TextPrimary   = Color3.fromRGB(255, 235, 235),
        TextSecondary = Color3.fromRGB(190, 120, 120),
        TextDim       = Color3.fromRGB(110, 65, 65),
        Toggle_ON     = Color3.fromRGB(239, 68, 68),
        Toggle_OFF    = Color3.fromRGB(55, 25, 25),
        Slider_Fill   = Color3.fromRGB(239, 68, 68),
        Slider_BG     = Color3.fromRGB(45, 20, 20),
        TabActive     = Color3.fromRGB(239, 68, 68),
        TabInactive   = Color3.fromRGB(28, 16, 16),
        ScrollBar     = Color3.fromRGB(239, 68, 68),
        Success       = Color3.fromRGB(52, 211, 153),
        Warning       = Color3.fromRGB(251, 191, 36),
        Danger        = Color3.fromRGB(239, 68, 68),
        Info          = Color3.fromRGB(56, 189, 248),
    },
}

local Theme = Themes.Dark
local ActiveThemeName = "Dark"
local ThemeListeners = {}
local ConfigRegistry = {}
local NotifQueue = {}
local ActiveDropdown = nil

local function RegisterThemeListener(fn)
    table.insert(ThemeListeners, fn)
end

local function BroadcastTheme()
    for _, fn in ipairs(ThemeListeners) do
        pcall(fn, Theme)
    end
end

local function Tween(obj, props, duration, style, direction)
    duration  = duration  or 0.15
    style     = style     or Enum.EasingStyle.Quad
    direction = direction or Enum.EasingDirection.Out
    TweenService:Create(obj, TweenInfo.new(duration, style, direction), props):Play()
end

local function Create(class, props, children)
    local inst = Instance.new(class)
    for k, v in pairs(props or {}) do
        inst[k] = v
    end
    for _, child in ipairs(children or {}) do
        child.Parent = inst
    end
    return inst
end

local function Corner(radius)
    return Create("UICorner", { CornerRadius = UDim.new(0, radius or 6) })
end

local function Stroke(color, thickness)
    return Create("UIStroke", {
        Color               = color or Theme.Border,
        Thickness           = thickness or 1,
        ApplyStrokeMode     = Enum.ApplyStrokeMode.Border,
    })
end

local function Pad(top, right, bottom, left)
    return Create("UIPadding", {
        PaddingTop    = UDim.new(0, top    or 8),
        PaddingRight  = UDim.new(0, right  or 8),
        PaddingBottom = UDim.new(0, bottom or 8),
        PaddingLeft   = UDim.new(0, left   or 8),
    })
end

local function SafeJSON(data)
    local ok, result = pcall(function()
        return HttpService:JSONEncode(data)
    end)
    if ok then return result end
    return "{}"
end

local function SafeParseJSON(str)
    local ok, result = pcall(function()
        return HttpService:JSONDecode(str)
    end)
    if ok then return result end
    return {}
end

local function WriteFile(path, content)
    pcall(function()
        writefile(path, content)
    end)
end

local function ReadFile(path)
    local ok, content = pcall(function()
        return readfile(path)
    end)
    if ok then return content end
    return nil
end

local function GetAbsolutePosition(frame)
    local pos = frame.AbsolutePosition
    return pos
end

local function CloseActiveDropdown()
    if ActiveDropdown then
        ActiveDropdown()
        ActiveDropdown = nil
    end
end

function XeioaUiLibs.new(config)
    config = config or {}
    local self = setmetatable({}, XeioaUiLibs)

    self.Title       = config.Title       or "XeioaUiLibs"
    self.Subtitle    = config.Subtitle    or "v1.0"
    self.Width       = config.Width       or 560
    self.Height      = config.Height      or 420
    self.Theme       = config.Theme       or "Dark"
    self.ConfigPath  = config.ConfigPath  or "XeioaUiLibs_config"
    self.Tabs        = {}
    self.ActiveTab   = nil
    self._minimized  = false
    self._visible    = true
    self._notifY     = {}
    self._elements   = {}

    if Themes[self.Theme] then
        Theme = Themes[self.Theme]
        ActiveThemeName = self.Theme
    end

    local ScreenGui = Create("ScreenGui", {
        Name           = "XeioaUiLibs",
        ResetOnSpawn   = false,
        ZIndexBehavior = Enum.ZIndexBehavior.Sibling,
        DisplayOrder   = 999,
        IgnoreGuiInset = true,
    })
    pcall(function() ScreenGui.Parent = CoreGui end)
    if not ScreenGui.Parent then
        ScreenGui.Parent = LocalPlayer:WaitForChild("PlayerGui")
    end
    self.ScreenGui = ScreenGui

    local DropdownOverlay = Create("Frame", {
        Name                  = "DropdownOverlay",
        Size                  = UDim2.new(1, 0, 1, 0),
        BackgroundTransparency = 1,
        ZIndex                = 500,
        Parent                = ScreenGui,
    })
    self.DropdownOverlay = DropdownOverlay

    DropdownOverlay.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1
        or input.UserInputType == Enum.UserInputType.Touch then
            CloseActiveDropdown()
        end
    end)

    local Main = Create("Frame", {
        Name              = "Main",
        Size              = UDim2.new(0, self.Width, 0, self.Height),
        Position          = UDim2.new(0.5, -self.Width / 2, 0.5, -self.Height / 2),
        BackgroundColor3  = Theme.Background,
        BorderSizePixel   = 0,
        ClipsDescendants  = false,
        Parent            = ScreenGui,
    })
    Corner(12).Parent = Main
    Stroke(Theme.Border, 1.5).Parent = Main
    self.Main = Main

    local MainClip = Create("Frame", {
        Name             = "MainClip",
        Size             = UDim2.new(1, 0, 1, 0),
        BackgroundTransparency = 1,
        ClipsDescendants = true,
        Parent           = Main,
    })
    self.MainClip = MainClip

    local AccentBar = Create("Frame", {
        Size             = UDim2.new(1, 0, 0, 3),
        Position         = UDim2.new(0, 0, 0, 0),
        BackgroundColor3 = Theme.Accent,
        BorderSizePixel  = 0,
        ZIndex           = 10,
        Parent           = MainClip,
    })
    Corner(12).Parent = AccentBar

    local AccentGrad = Create("UIGradient", {
        Color = ColorSequence.new({
            ColorSequenceKeypoint.new(0,   Theme.AccentDim),
            ColorSequenceKeypoint.new(0.5, Theme.Accent),
            ColorSequenceKeypoint.new(1,   Theme.AccentHover),
        }),
        Parent = AccentBar,
    })

    local TitleBar = Create("Frame", {
        Name             = "TitleBar",
        Size             = UDim2.new(1, 0, 0, 50),
        Position         = UDim2.new(0, 0, 0, 3),
        BackgroundColor3 = Theme.Surface,
        BorderSizePixel  = 0,
        ZIndex           = 5,
        Parent           = MainClip,
    })

    local TitleLabel = Create("TextLabel", {
        Size                   = UDim2.new(0, 200, 1, 0),
        Position               = UDim2.new(0, 16, 0, 0),
        BackgroundTransparency = 1,
        Text                   = self.Title,
        TextColor3             = Theme.Accent,
        TextSize               = 16,
        Font                   = Enum.Font.GothamBold,
        TextXAlignment         = Enum.TextXAlignment.Left,
        ZIndex                 = 6,
        Parent                 = TitleBar,
    })

    local SubLabel = Create("TextLabel", {
        Size                   = UDim2.new(0, 200, 0, 14),
        Position               = UDim2.new(0, 16, 1, -18),
        BackgroundTransparency = 1,
        Text                   = self.Subtitle,
        TextColor3             = Theme.TextDim,
        TextSize               = 10,
        Font                   = Enum.Font.Gotham,
        TextXAlignment         = Enum.TextXAlignment.Left,
        ZIndex                 = 6,
        Parent                 = TitleBar,
    })

    local function MakeTitleBtn(xOffset, icon, bgColor, textColor)
        local btn = Create("TextButton", {
            Size             = UDim2.new(0, 26, 0, 26),
            Position         = UDim2.new(1, xOffset, 0.5, -13),
            BackgroundColor3 = bgColor,
            Text             = icon,
            TextColor3       = textColor,
            TextSize         = 12,
            Font             = Enum.Font.GothamBold,
            BorderSizePixel  = 0,
            ZIndex           = 7,
            Parent           = TitleBar,
        })
        Corner(6).Parent = btn
        btn.MouseEnter:Connect(function() Tween(btn, { BackgroundColor3 = Theme.SurfaceHover }, 0.1) end)
        btn.MouseLeave:Connect(function() Tween(btn, { BackgroundColor3 = bgColor }, 0.1) end)
        return btn
    end

    local CloseBtn = MakeTitleBtn(-34, "✕", Color3.fromRGB(55, 20, 20), Theme.Danger)
    local MinBtn   = MakeTitleBtn(-66, "—", Theme.SurfaceAlt, Theme.TextSecondary)
    local MaxBtn   = MakeTitleBtn(-98, "⊡", Theme.SurfaceAlt, Theme.TextSecondary)

    CloseBtn.MouseButton1Click:Connect(function()
        Tween(Main, { Size = UDim2.new(0, self.Width, 0, 0), Position = UDim2.new(0.5, -self.Width / 2, 0.5, 0) }, 0.25, Enum.EasingStyle.Back, Enum.EasingDirection.In)
        task.wait(0.28)
        ScreenGui:Destroy()
    end)

    MinBtn.MouseButton1Click:Connect(function()
        self._minimized = not self._minimized
        if self._minimized then
            Tween(Main, { Size = UDim2.new(0, self.Width, 0, 53) }, 0.25)
        else
            Tween(Main, { Size = UDim2.new(0, self.Width, 0, self.Height) }, 0.28, Enum.EasingStyle.Back)
        end
    end)

    MaxBtn.MouseButton1Click:Connect(function()
        self._visible = not self._visible
        Tween(Main, { Position = self._visible
            and UDim2.new(0.5, -self.Width / 2, 0.5, -self.Height / 2)
            or  UDim2.new(0.5, -self.Width / 2, 1, 80)
        }, 0.3, Enum.EasingStyle.Back)
    end)

    local TabBar = Create("Frame", {
        Name             = "TabBar",
        Size             = UDim2.new(1, 0, 0, 38),
        Position         = UDim2.new(0, 0, 0, 53),
        BackgroundColor3 = Theme.Surface,
        BorderSizePixel  = 0,
        ZIndex           = 4,
        Parent           = MainClip,
    })
    Create("Frame", {
        Size             = UDim2.new(1, 0, 0, 1),
        Position         = UDim2.new(0, 0, 1, -1),
        BackgroundColor3 = Theme.Border,
        BorderSizePixel  = 0,
        ZIndex           = 5,
        Parent           = TabBar,
    })

    local TabScroll = Create("ScrollingFrame", {
        Size                 = UDim2.new(1, -16, 1, -8),
        Position             = UDim2.new(0, 8, 0, 4),
        BackgroundTransparency = 1,
        ScrollBarThickness   = 0,
        CanvasSize           = UDim2.new(0, 0, 0, 0),
        AutomaticCanvasSize  = Enum.AutomaticSize.X,
        ScrollingDirection   = Enum.ScrollingDirection.X,
        Parent               = TabBar,
    })
    Create("UIListLayout", {
        FillDirection = Enum.FillDirection.Horizontal,
        SortOrder     = Enum.SortOrder.LayoutOrder,
        Padding       = UDim.new(0, 3),
        Parent        = TabScroll,
    })
    self.TabBar    = TabBar
    self.TabScroll = TabScroll

    local ContentArea = Create("Frame", {
        Name                  = "ContentArea",
        Size                  = UDim2.new(1, 0, 1, -91),
        Position              = UDim2.new(0, 0, 0, 91),
        BackgroundTransparency = 1,
        ClipsDescendants      = true,
        Parent                = MainClip,
    })
    self.ContentArea = ContentArea

    local dragging, dragStart, startPos = false, nil, nil
    TitleBar.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1
        or input.UserInputType == Enum.UserInputType.Touch then
            dragging  = true
            dragStart = input.Position
            startPos  = Main.Position
        end
    end)
    UserInputService.InputChanged:Connect(function(input)
        if not dragging then return end
        if input.UserInputType == Enum.UserInputType.MouseMovement
        or input.UserInputType == Enum.UserInputType.Touch then
            local d = input.Position - dragStart
            Main.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + d.X, startPos.Y.Scale, startPos.Y.Offset + d.Y)
        end
    end)
    UserInputService.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1
        or input.UserInputType == Enum.UserInputType.Touch then
            dragging = false
        end
    end)

    Main.Size = UDim2.new(0, self.Width, 0, 0)
    Main.Position = UDim2.new(0.5, -self.Width / 2, 0.5, 0)
    task.defer(function()
        Tween(Main, {
            Size     = UDim2.new(0, self.Width, 0, self.Height),
            Position = UDim2.new(0.5, -self.Width / 2, 0.5, -self.Height / 2),
        }, 0.35, Enum.EasingStyle.Back)
    end)

    RegisterThemeListener(function(t)
        AccentBar.BackgroundColor3    = t.Accent
        AccentGrad.Color = ColorSequence.new({
            ColorSequenceKeypoint.new(0,   t.AccentDim),
            ColorSequenceKeypoint.new(0.5, t.Accent),
            ColorSequenceKeypoint.new(1,   t.AccentHover),
        })
        Main:FindFirstChildOfClass("UIStroke").Color = t.Border
        TitleBar.BackgroundColor3  = t.Surface
        TitleLabel.TextColor3      = t.Accent
        SubLabel.TextColor3        = t.TextDim
        TabBar.BackgroundColor3    = t.Surface
        ContentArea.BackgroundColor3 = t.Background
        Main.BackgroundColor3      = t.Background
    end)

    function self:AddTab(name, icon)
        local tab = {}
        tab.Name = name

        local tabText = icon and (icon .. "  " .. name) or name
        local TabBtn = Create("TextButton", {
            Size             = UDim2.new(0, 0, 1, 0),
            AutomaticSize    = Enum.AutomaticSize.X,
            BackgroundColor3 = Theme.TabInactive,
            Text             = tabText,
            TextColor3       = Theme.TextDim,
            TextSize          = 11,
            Font             = Enum.Font.GothamSemibold,
            BorderSizePixel  = 0,
            ZIndex           = 5,
            Parent           = self.TabScroll,
        })
        Corner(6).Parent = TabBtn
        Pad(0, 12, 0, 12).Parent = TabBtn

        local TabIndicator = Create("Frame", {
            Size             = UDim2.new(0, 0, 0, 2),
            Position         = UDim2.new(0.5, 0, 1, -2),
            AnchorPoint      = Vector2.new(0.5, 0),
            BackgroundColor3 = Theme.Accent,
            BorderSizePixel  = 0,
            ZIndex           = 6,
            Parent           = TabBtn,
        })
        Corner(2).Parent = TabIndicator

        local TabContent = Create("ScrollingFrame", {
            Name                   = "Tab_" .. name,
            Size                   = UDim2.new(1, 0, 1, 0),
            BackgroundTransparency = 1,
            ScrollBarThickness     = 3,
            ScrollBarImageColor3   = Theme.ScrollBar,
            CanvasSize             = UDim2.new(0, 0, 0, 0),
            AutomaticCanvasSize    = Enum.AutomaticSize.Y,
            Visible                = false,
            BorderSizePixel        = 0,
            ScrollingDirection     = Enum.ScrollingDirection.Y,
            Parent                 = self.ContentArea,
        })
        Create("UIListLayout", {
            SortOrder = Enum.SortOrder.LayoutOrder,
            Padding   = UDim.new(0, 5),
            Parent    = TabContent,
        })
        Pad(8, 12, 8, 12).Parent = TabContent

        tab.Content = TabContent
        tab.Button  = TabBtn
        tab._order  = 0

        local function Activate()
            for _, t in ipairs(self.Tabs) do
                t.Content.Visible = false
                Tween(t.Button, { BackgroundColor3 = Theme.TabInactive, TextColor3 = Theme.TextDim }, 0.12)
                Tween(t.Button:FindFirstChild("Frame"), { Size = UDim2.new(0, 0, 0, 2) }, 0.15)
            end
            TabContent.Visible = true
            Tween(TabBtn, { BackgroundColor3 = Theme.TabActive, TextColor3 = Theme.TextPrimary }, 0.15)
            Tween(TabIndicator, { Size = UDim2.new(1, 0, 0, 2) }, 0.2, Enum.EasingStyle.Back)
            self.ActiveTab = tab
        end

        TabBtn.MouseButton1Click:Connect(Activate)
        TabBtn.MouseEnter:Connect(function()
            if self.ActiveTab ~= tab then
                Tween(TabBtn, { BackgroundColor3 = Theme.SurfaceHover }, 0.1)
            end
        end)
        TabBtn.MouseLeave:Connect(function()
            if self.ActiveTab ~= tab then
                Tween(TabBtn, { BackgroundColor3 = Theme.TabInactive }, 0.1)
            end
        end)

        table.insert(self.Tabs, tab)
        if #self.Tabs == 1 then Activate() end

        RegisterThemeListener(function(t)
            TabContent.ScrollBarImageColor3 = t.ScrollBar
            if self.ActiveTab == tab then
                TabBtn.BackgroundColor3 = t.TabActive
                TabBtn.TextColor3       = t.TextPrimary
                TabIndicator.BackgroundColor3 = t.Accent
            else
                TabBtn.BackgroundColor3 = t.TabInactive
                TabBtn.TextColor3       = t.TextDim
            end
        end)

        local function NewOrder()
            tab._order = tab._order + 1
            return tab._order
        end

        local function AddElementBase(height)
            local Row = Create("Frame", {
                Size             = UDim2.new(1, 0, 0, height or 38),
                BackgroundColor3 = Theme.Surface,
                BorderSizePixel  = 0,
                LayoutOrder      = NewOrder(),
                Parent           = TabContent,
            })
            Corner(8).Parent = Row
            Stroke(Theme.Border, 1).Parent = Row
            RegisterThemeListener(function(t)
                Row.BackgroundColor3 = t.Surface
                Row:FindFirstChildOfClass("UIStroke").Color = t.Border
            end)
            return Row
        end

        function tab:AddSeparator(label)
            local height = label and 28 or 12
            local Sep = Create("Frame", {
                Size             = UDim2.new(1, 0, 0, height),
                BackgroundTransparency = 1,
                LayoutOrder      = NewOrder(),
                Parent           = TabContent,
            })
            if label then
                local line1 = Create("Frame", {
                    Size             = UDim2.new(0.5, -60, 0, 1),
                    Position         = UDim2.new(0, 0, 0.5, 0),
                    BackgroundColor3 = Theme.Border,
                    BorderSizePixel  = 0,
                    Parent           = Sep,
                })
                Create("TextLabel", {
                    Size                   = UDim2.new(0, 110, 1, 0),
                    Position               = UDim2.new(0.5, -55, 0, 0),
                    BackgroundTransparency = 1,
                    Text                   = label,
                    TextColor3             = Theme.TextDim,
                    TextSize               = 10,
                    Font                   = Enum.Font.GothamBold,
                    TextXAlignment         = Enum.TextXAlignment.Center,
                    Parent                 = Sep,
                })
                Create("Frame", {
                    Size             = UDim2.new(0.5, -60, 0, 1),
                    Position         = UDim2.new(0.5, 60, 0.5, 0),
                    BackgroundColor3 = Theme.Border,
                    BorderSizePixel  = 0,
                    Parent           = Sep,
                })
                RegisterThemeListener(function(t)
                    line1.BackgroundColor3 = t.Border
                    Sep:FindFirstChildWhichIsA("Frame", true).BackgroundColor3 = t.Border
                end)
            end
            return Sep
        end

        function tab:AddLabel(text, config)
            config = config or {}
            local Row = Create("Frame", {
                Size                   = UDim2.new(1, 0, 0, 0),
                AutomaticSize          = Enum.AutomaticSize.Y,
                BackgroundTransparency = 1,
                LayoutOrder            = NewOrder(),
                Parent                 = TabContent,
            })
            local lbl = Create("TextLabel", {
                Size                   = UDim2.new(1, 0, 0, 0),
                AutomaticSize          = Enum.AutomaticSize.Y,
                BackgroundTransparency = 1,
                Text                   = text,
                TextColor3             = config.Color or Theme.TextSecondary,
                TextSize               = config.Size or 11,
                Font                   = config.Bold and Enum.Font.GothamBold or Enum.Font.Gotham,
                TextXAlignment         = Enum.TextXAlignment.Left,
                TextWrapped            = true,
                Parent                 = Row,
            })
            Pad(4, 6, 4, 6).Parent = Row
            local lbRef = {}
            function lbRef:Set(t) lbl.Text = t end
            return lbRef
        end

        function tab:AddGroupBox(config)
            config = config or {}
            local title     = config.Title    or "Group"
            local collapsed = config.Collapsed or false
            local gOrder    = NewOrder

            local Wrap = Create("Frame", {
                Size             = UDim2.new(1, 0, 0, 0),
                AutomaticSize    = Enum.AutomaticSize.Y,
                BackgroundColor3 = Theme.SurfaceAlt,
                BorderSizePixel  = 0,
                LayoutOrder      = NewOrder(),
                Parent           = TabContent,
            })
            Corner(9).Parent = Wrap
            Stroke(Theme.Border, 1).Parent = Wrap

            local Header = Create("TextButton", {
                Size             = UDim2.new(1, 0, 0, 36),
                BackgroundTransparency = 1,
                Text             = "",
                BorderSizePixel  = 0,
                ZIndex           = 2,
                Parent           = Wrap,
            })

            local HeaderTitle = Create("TextLabel", {
                Size                   = UDim2.new(1, -50, 1, 0),
                Position               = UDim2.new(0, 14, 0, 0),
                BackgroundTransparency = 1,
                Text                   = title,
                TextColor3             = Theme.TextPrimary,
                TextSize               = 12,
                Font                   = Enum.Font.GothamSemibold,
                TextXAlignment         = Enum.TextXAlignment.Left,
                ZIndex                 = 3,
                Parent                 = Header,
            })

            local Arrow = Create("TextLabel", {
                Size                   = UDim2.new(0, 20, 1, 0),
                Position               = UDim2.new(1, -30, 0, 0),
                BackgroundTransparency = 1,
                Text                   = collapsed and "▸" or "▾",
                TextColor3             = Theme.TextDim,
                TextSize               = 12,
                Font                   = Enum.Font.GothamBold,
                TextXAlignment         = Enum.TextXAlignment.Center,
                ZIndex                 = 3,
                Parent                 = Header,
            })

            local Divider = Create("Frame", {
                Size             = UDim2.new(1, -28, 0, 1),
                Position         = UDim2.new(0, 14, 0, 36),
                BackgroundColor3 = Theme.Border,
                BorderSizePixel  = 0,
                Parent           = Wrap,
            })

            local InnerWrap = Create("Frame", {
                Size                   = UDim2.new(1, 0, 0, 0),
                Position               = UDim2.new(0, 0, 0, 37),
                AutomaticSize          = Enum.AutomaticSize.Y,
                BackgroundTransparency = 1,
                ClipsDescendants       = true,
                Visible                = not collapsed,
                Parent                 = Wrap,
            })

            local InnerList = Create("Frame", {
                Size             = UDim2.new(1, 0, 0, 0),
                AutomaticSize    = Enum.AutomaticSize.Y,
                BackgroundTransparency = 1,
                Parent           = InnerWrap,
            })
            Create("UIListLayout", {
                SortOrder = Enum.SortOrder.LayoutOrder,
                Padding   = UDim.new(0, 4),
                Parent    = InnerList,
            })
            Pad(6, 10, 10, 10).Parent = InnerList

            local isCollapsed = collapsed

            Header.MouseButton1Click:Connect(function()
                isCollapsed = not isCollapsed
                Arrow.Text = isCollapsed and "▸" or "▾"
                InnerWrap.Visible = not isCollapsed
                Divider.Visible   = not isCollapsed
            end)

            Header.MouseEnter:Connect(function() Tween(HeaderTitle, { TextColor3 = Theme.Accent }, 0.1) end)
            Header.MouseLeave:Connect(function() Tween(HeaderTitle, { TextColor3 = Theme.TextPrimary }, 0.1) end)

            RegisterThemeListener(function(t)
                Wrap.BackgroundColor3     = t.SurfaceAlt
                Wrap:FindFirstChildOfClass("UIStroke").Color = t.Border
                HeaderTitle.TextColor3    = t.TextPrimary
                Arrow.TextColor3          = t.TextDim
                Divider.BackgroundColor3  = t.Border
            end)

            local gb   = {}
            local gbOrd = 0
            local function GBOrder() gbOrd = gbOrd + 1; return gbOrd end

            local function GBAddBase(height)
                local Row = Create("Frame", {
                    Size             = UDim2.new(1, 0, 0, height or 38),
                    BackgroundColor3 = Theme.Surface,
                    BorderSizePixel  = 0,
                    LayoutOrder      = GBOrder(),
                    Parent           = InnerList,
                })
                Corner(7).Parent = Row
                Stroke(Theme.Border, 1).Parent = Row
                RegisterThemeListener(function(t)
                    Row.BackgroundColor3 = t.Surface
                    Row:FindFirstChildOfClass("UIStroke").Color = t.Border
                end)
                return Row
            end

            gb._addBase       = GBAddBase
            gb._order         = GBOrder
            gb._content       = InnerList
            gb._contentParent = TabContent
            gb._screenGui     = self.ScreenGui
            gb._overlay       = self.DropdownOverlay
            gb._main          = self.Main

            self:_attachSectionMethods(gb, InnerList, GBAddBase, GBOrder, self.ScreenGui, self.DropdownOverlay, self.Main)

            function gb:SetTitle(t) HeaderTitle.Text = t end
            function gb:Collapse() isCollapsed = true; Arrow.Text = "▸"; InnerWrap.Visible = false; Divider.Visible = false end
            function gb:Expand()   isCollapsed = false; Arrow.Text = "▾"; InnerWrap.Visible = true;  Divider.Visible = true  end

            return gb
        end

        function tab:AddSection(sectionName)
            local fakegb = { _fakeSection = true }
            local secOrd = 0
            local function SecOrder() secOrd = secOrd + 1; return secOrd end
            local function SecBase(height)
                local Row = Create("Frame", {
                    Size             = UDim2.new(1, 0, 0, height or 38),
                    BackgroundColor3 = Theme.Surface,
                    BorderSizePixel  = 0,
                    LayoutOrder      = NewOrder(),
                    Parent           = TabContent,
                })
                Corner(8).Parent = Row
                Stroke(Theme.Border, 1).Parent = Row
                RegisterThemeListener(function(t)
                    Row.BackgroundColor3 = t.Surface
                    Row:FindFirstChildOfClass("UIStroke").Color = t.Border
                end)
                return Row
            end

            if sectionName then
                local SLabel = Create("Frame", {
                    Size             = UDim2.new(1, 0, 0, 22),
                    BackgroundTransparency = 1,
                    LayoutOrder      = NewOrder(),
                    Parent           = TabContent,
                })
                Create("TextLabel", {
                    Size                   = UDim2.new(1, -12, 1, 0),
                    Position               = UDim2.new(0, 6, 0, 0),
                    BackgroundTransparency = 1,
                    Text                   = sectionName:upper(),
                    TextColor3             = Theme.Accent,
                    TextSize               = 9,
                    Font                   = Enum.Font.GothamBold,
                    TextXAlignment         = Enum.TextXAlignment.Left,
                    Parent                 = SLabel,
                })
            end

            local sec = {}
            self:_attachSectionMethods(sec, TabContent, SecBase, function() NewOrder() end, self.ScreenGui, self.DropdownOverlay, self.Main)
            return sec
        end

        return tab
    end

    function self:_attachSectionMethods(sec, container, AddBase, OrderFn, sGui, overlay, mainFrame)
        local secOrd = 0
        local function SO() secOrd = secOrd + 1; return secOrd end

        local function BaseRow(h)
            local Row = Create("Frame", {
                Size             = UDim2.new(1, 0, 0, h or 38),
                BackgroundColor3 = Theme.Surface,
                BorderSizePixel  = 0,
                LayoutOrder      = SO(),
                Parent           = container,
            })
            Corner(8).Parent = Row
            Stroke(Theme.Border, 1).Parent = Row
            RegisterThemeListener(function(t)
                Row.BackgroundColor3 = t.Surface
                Row:FindFirstChildOfClass("UIStroke").Color = t.Border
            end)
            return Row
        end
        local BR = AddBase or BaseRow

        function sec:AddToggle(config)
            config = config or {}
            local label    = config.Label    or "Toggle"
            local default  = config.Default  ~= nil and config.Default or false
            local desc     = config.Description
            local flag     = config.Flag
            local callback = config.Callback or function() end
            local state    = default

            local h = desc and 52 or 38
            local Row = BR(h)

            Create("TextLabel", {
                Size                   = UDim2.new(1, -58, 0, 18),
                Position               = UDim2.new(0, 12, 0, desc and 8 or 10),
                BackgroundTransparency = 1,
                Text                   = label,
                TextColor3             = Theme.TextPrimary,
                TextSize               = 12,
                Font                   = Enum.Font.GothamSemibold,
                TextXAlignment         = Enum.TextXAlignment.Left,
                Parent                 = Row,
            })
            if desc then
                Create("TextLabel", {
                    Size                   = UDim2.new(1, -58, 0, 14),
                    Position               = UDim2.new(0, 12, 0, 28),
                    BackgroundTransparency = 1,
                    Text                   = desc,
                    TextColor3             = Theme.TextDim,
                    TextSize               = 10,
                    Font                   = Enum.Font.Gotham,
                    TextXAlignment         = Enum.TextXAlignment.Left,
                    Parent                 = Row,
                })
            end

            local Track = Create("Frame", {
                Size             = UDim2.new(0, 40, 0, 22),
                Position         = UDim2.new(1, -52, 0.5, -11),
                BackgroundColor3 = state and Theme.Toggle_ON or Theme.Toggle_OFF,
                BorderSizePixel  = 0,
                Parent           = Row,
            })
            Corner(11).Parent = Track

            local Thumb = Create("Frame", {
                Size             = UDim2.new(0, 16, 0, 16),
                Position         = state and UDim2.new(1, -19, 0.5, -8) or UDim2.new(0, 3, 0.5, -8),
                BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                BorderSizePixel  = 0,
                Parent           = Track,
            })
            Corner(8).Parent = Thumb

            local function SetState(val)
                state = val
                Tween(Track, { BackgroundColor3 = state and Theme.Toggle_ON or Theme.Toggle_OFF }, 0.18)
                Tween(Thumb, { Position = state and UDim2.new(1, -19, 0.5, -8) or UDim2.new(0, 3, 0.5, -8) }, 0.18)
                callback(state)
            end

            Row.InputBegan:Connect(function(inp)
                if inp.UserInputType == Enum.UserInputType.MouseButton1
                or inp.UserInputType == Enum.UserInputType.Touch then
                    SetState(not state)
                    Tween(Row, { BackgroundColor3 = Theme.SurfaceHover }, 0.08)
                    task.delay(0.12, function() Tween(Row, { BackgroundColor3 = Theme.Surface }, 0.1) end)
                end
            end)

            RegisterThemeListener(function(t)
                Track.BackgroundColor3 = state and t.Toggle_ON or t.Toggle_OFF
            end)

            local el = {}
            function el:Set(v) SetState(v) end
            function el:Get() return state end
            function el:Toggle() SetState(not state) end
            if flag then
                ConfigRegistry[flag] = { Get = function() return state end, Set = function(v) SetState(v) end, Type = "toggle" }
            end
            return el
        end

        function sec:AddSlider(config)
            config = config or {}
            local label    = config.Label    or "Slider"
            local min      = config.Min      or 0
            local max      = config.Max      or 100
            local default  = config.Default  or min
            local step     = config.Step     or 1
            local suffix   = config.Suffix   or ""
            local flag     = config.Flag
            local callback = config.Callback or function() end
            local value    = math.clamp(default, min, max)

            local Row = BR(54)

            local LabelRow = Create("Frame", {
                Size                   = UDim2.new(1, 0, 0, 22),
                Position               = UDim2.new(0, 0, 0, 0),
                BackgroundTransparency = 1,
                Parent                 = Row,
            })

            Create("TextLabel", {
                Size                   = UDim2.new(0.6, 0, 1, 0),
                Position               = UDim2.new(0, 12, 0, 0),
                BackgroundTransparency = 1,
                Text                   = label,
                TextColor3             = Theme.TextPrimary,
                TextSize               = 12,
                Font                   = Enum.Font.GothamSemibold,
                TextXAlignment         = Enum.TextXAlignment.Left,
                Parent                 = LabelRow,
            })

            local ValLabel = Create("TextLabel", {
                Size                   = UDim2.new(0.4, -12, 1, 0),
                Position               = UDim2.new(0.6, 0, 0, 0),
                BackgroundTransparency = 1,
                Text                   = tostring(value) .. suffix,
                TextColor3             = Theme.Accent,
                TextSize               = 11,
                Font                   = Enum.Font.GothamBold,
                TextXAlignment         = Enum.TextXAlignment.Right,
                Parent                 = LabelRow,
            })

            local Track = Create("Frame", {
                Size             = UDim2.new(1, -24, 0, 6),
                Position         = UDim2.new(0, 12, 0, 32),
                BackgroundColor3 = Theme.Slider_BG,
                BorderSizePixel  = 0,
                Parent           = Row,
            })
            Corner(3).Parent = Track

            local Fill = Create("Frame", {
                Size             = UDim2.new((value - min) / (max - min), 0, 1, 0),
                BackgroundColor3 = Theme.Slider_Fill,
                BorderSizePixel  = 0,
                Parent           = Track,
            })
            Corner(3).Parent = Fill

            local Knob = Create("Frame", {
                Size             = UDim2.new(0, 14, 0, 14),
                Position         = UDim2.new((value - min) / (max - min), -7, 0.5, -7),
                BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                BorderSizePixel  = 0,
                ZIndex           = 3,
                Parent           = Track,
            })
            Corner(7).Parent = Knob

            local function SetValue(v)
                local steps = math.round((v - min) / step)
                v = math.clamp(min + steps * step, min, max)
                local pct = (v - min) / (max - min)
                value = v
                Fill.Size     = UDim2.new(pct, 0, 1, 0)
                Knob.Position = UDim2.new(pct, -7, 0.5, -7)
                ValLabel.Text = tostring(v) .. suffix
                callback(v)
            end

            local draggingSlider = false
            Track.InputBegan:Connect(function(inp)
                if inp.UserInputType == Enum.UserInputType.MouseButton1
                or inp.UserInputType == Enum.UserInputType.Touch then
                    draggingSlider = true
                    local rel = inp.Position.X - Track.AbsolutePosition.X
                    SetValue(min + (rel / Track.AbsoluteSize.X) * (max - min))
                end
            end)
            UserInputService.InputChanged:Connect(function(inp)
                if not draggingSlider then return end
                if inp.UserInputType == Enum.UserInputType.MouseMovement
                or inp.UserInputType == Enum.UserInputType.Touch then
                    local rel = inp.Position.X - Track.AbsolutePosition.X
                    SetValue(min + (rel / Track.AbsoluteSize.X) * (max - min))
                end
            end)
            UserInputService.InputEnded:Connect(function(inp)
                if inp.UserInputType == Enum.UserInputType.MouseButton1
                or inp.UserInputType == Enum.UserInputType.Touch then
                    draggingSlider = false
                end
            end)

            RegisterThemeListener(function(t)
                Track.BackgroundColor3 = t.Slider_BG
                Fill.BackgroundColor3  = t.Slider_Fill
                Knob.BackgroundColor3  = Color3.fromRGB(255, 255, 255)
                ValLabel.TextColor3    = t.Accent
            end)

            local el = {}
            function el:Set(v) SetValue(v) end
            function el:Get() return value end
            if flag then
                ConfigRegistry[flag] = { Get = function() return value end, Set = function(v) SetValue(v) end, Type = "slider" }
            end
            return el
        end

        function sec:AddDropdown(config)
            config = config or {}
            local label    = config.Label    or "Dropdown"
            local options  = config.Options  or {}
            local default  = config.Default  or (options[1] or "")
            local flag     = config.Flag
            local callback = config.Callback or function() end
            local selected = default

            local Row = BR(38)

            Create("TextLabel", {
                Size                   = UDim2.new(0, 120, 1, 0),
                Position               = UDim2.new(0, 12, 0, 0),
                BackgroundTransparency = 1,
                Text                   = label,
                TextColor3             = Theme.TextPrimary,
                TextSize               = 12,
                Font                   = Enum.Font.GothamSemibold,
                TextXAlignment         = Enum.TextXAlignment.Left,
                Parent                 = Row,
            })

            local DropBtn = Create("TextButton", {
                Size             = UDim2.new(0.55, 0, 0, 26),
                Position         = UDim2.new(0.45, 0, 0.5, -13),
                BackgroundColor3 = Theme.SurfaceAlt,
                Text             = "",
                BorderSizePixel  = 0,
                ZIndex           = 2,
                Parent           = Row,
            })
            Corner(6).Parent = DropBtn
            Stroke(Theme.Border, 1).Parent = DropBtn

            local SelLabel = Create("TextLabel", {
                Size                   = UDim2.new(1, -28, 1, 0),
                Position               = UDim2.new(0, 10, 0, 0),
                BackgroundTransparency = 1,
                Text                   = selected,
                TextColor3             = Theme.TextPrimary,
                TextSize               = 11,
                Font                   = Enum.Font.Gotham,
                TextXAlignment         = Enum.TextXAlignment.Left,
                ZIndex                 = 3,
                Parent                 = DropBtn,
            })

            local ArrowIcon = Create("TextLabel", {
                Size                   = UDim2.new(0, 18, 1, 0),
                Position               = UDim2.new(1, -22, 0, 0),
                BackgroundTransparency = 1,
                Text                   = "▾",
                TextColor3             = Theme.TextDim,
                TextSize               = 12,
                Font                   = Enum.Font.GothamBold,
                ZIndex                 = 3,
                Parent                 = DropBtn,
            })

            local isOpen = false
            local ListFrame = nil

            local function CloseList()
                if ListFrame then
                    Tween(ListFrame, { Size = UDim2.new(ListFrame.Size.X.Scale, ListFrame.Size.X.Offset, 0, 0) }, 0.18)
                    task.delay(0.2, function()
                        if ListFrame then ListFrame:Destroy(); ListFrame = nil end
                    end)
                    Tween(ArrowIcon, { Rotation = 0 }, 0.18)
                    isOpen = false
                end
            end

            local function OpenList()
                CloseActiveDropdown()
                ActiveDropdown = CloseList

                local absPos  = DropBtn.AbsolutePosition
                local absSize = DropBtn.AbsoluteSize
                local itemH   = 28
                local maxH    = math.min(#options * itemH, 180)

                ListFrame = Create("Frame", {
                    Size             = UDim2.new(0, absSize.X, 0, 0),
                    Position         = UDim2.new(0, absPos.X, 0, absPos.Y + absSize.Y + 4),
                    BackgroundColor3 = Theme.SurfaceAlt,
                    BorderSizePixel  = 0,
                    ZIndex           = 600,
                    ClipsDescendants = true,
                    Parent           = sGui,
                })
                Corner(8).Parent = ListFrame
                Stroke(Theme.Accent, 1.5).Parent = ListFrame

                local Scroll = Create("ScrollingFrame", {
                    Size                 = UDim2.new(1, 0, 1, 0),
                    BackgroundTransparency = 1,
                    ScrollBarThickness   = 3,
                    ScrollBarImageColor3 = Theme.Accent,
                    CanvasSize           = UDim2.new(0, 0, 0, #options * itemH),
                    ZIndex               = 601,
                    Parent               = ListFrame,
                })
                Create("UIListLayout", {
                    SortOrder = Enum.SortOrder.LayoutOrder,
                    Parent    = Scroll,
                })

                for i, opt in ipairs(options) do
                    local isSel = opt == selected
                    local Item = Create("TextButton", {
                        Size             = UDim2.new(1, 0, 0, itemH),
                        BackgroundColor3 = isSel and Theme.Accent or Color3.fromRGB(0,0,0),
                        BackgroundTransparency = isSel and 0.7 or 1,
                        Text             = "",
                        BorderSizePixel  = 0,
                        ZIndex           = 602,
                        LayoutOrder      = i,
                        Parent           = Scroll,
                    })
                    Create("TextLabel", {
                        Size                   = UDim2.new(1, -30, 1, 0),
                        Position               = UDim2.new(0, 12, 0, 0),
                        BackgroundTransparency = 1,
                        Text                   = opt,
                        TextColor3             = isSel and Theme.Accent or Theme.TextPrimary,
                        TextSize               = 11,
                        Font                   = isSel and Enum.Font.GothamBold or Enum.Font.Gotham,
                        TextXAlignment         = Enum.TextXAlignment.Left,
                        ZIndex                 = 603,
                        Parent                 = Item,
                    })
                    if isSel then
                        Create("TextLabel", {
                            Size                   = UDim2.new(0, 16, 1, 0),
                            Position               = UDim2.new(1, -20, 0, 0),
                            BackgroundTransparency = 1,
                            Text                   = "✓",
                            TextColor3             = Theme.Accent,
                            TextSize               = 11,
                            Font                   = Enum.Font.GothamBold,
                            ZIndex                 = 603,
                            Parent                 = Item,
                        })
                    end
                    Item.MouseEnter:Connect(function()
                        if opt ~= selected then
                            Tween(Item, { BackgroundTransparency = 0.85 }, 0.08)
                        end
                    end)
                    Item.MouseLeave:Connect(function()
                        if opt ~= selected then
                            Tween(Item, { BackgroundTransparency = 1 }, 0.08)
                        end
                    end)
                    Item.MouseButton1Click:Connect(function()
                        selected      = opt
                        SelLabel.Text = opt
                        callback(selected)
                        CloseList()
                    end)
                end

                Tween(ListFrame, { Size = UDim2.new(0, absSize.X, 0, maxH) }, 0.22, Enum.EasingStyle.Back)
                Tween(ArrowIcon, { Rotation = 180 }, 0.18)
                isOpen = true
            end

            DropBtn.MouseButton1Click:Connect(function()
                if isOpen then CloseList() else OpenList() end
            end)
            DropBtn.MouseEnter:Connect(function() Tween(DropBtn, { BackgroundColor3 = Theme.SurfaceHover }, 0.1) end)
            DropBtn.MouseLeave:Connect(function() Tween(DropBtn, { BackgroundColor3 = Theme.SurfaceAlt }, 0.1) end)

            RegisterThemeListener(function(t)
                DropBtn.BackgroundColor3 = t.SurfaceAlt
                DropBtn:FindFirstChildOfClass("UIStroke").Color = t.Border
                SelLabel.TextColor3      = t.TextPrimary
                ArrowIcon.TextColor3     = t.TextDim
            end)

            local el = {}
            function el:Set(v) selected = v; SelLabel.Text = v end
            function el:Get() return selected end
            function el:SetOptions(opts)
                options = opts
                if not table.find(options, selected) then
                    selected = options[1] or ""
                    SelLabel.Text = selected
                end
            end
            if flag then
                ConfigRegistry[flag] = { Get = function() return selected end, Set = function(v) selected = v; SelLabel.Text = v end, Type = "dropdown" }
            end
            return el
        end

        function sec:AddMultiDropdown(config)
            config = config or {}
            local label    = config.Label    or "Multi Select"
            local options  = config.Options  or {}
            local defaults = config.Default  or {}
            local max_sel  = config.Max      or 999
            local flag     = config.Flag
            local callback = config.Callback or function() end

            local selected = {}
            for _, v in ipairs(defaults) do selected[v] = true end

            local Row = BR(38)

            Create("TextLabel", {
                Size                   = UDim2.new(0, 120, 1, 0),
                Position               = UDim2.new(0, 12, 0, 0),
                BackgroundTransparency = 1,
                Text                   = label,
                TextColor3             = Theme.TextPrimary,
                TextSize               = 12,
                Font                   = Enum.Font.GothamSemibold,
                TextXAlignment         = Enum.TextXAlignment.Left,
                Parent                 = Row,
            })

            local DropBtn = Create("TextButton", {
                Size             = UDim2.new(0.55, 0, 0, 26),
                Position         = UDim2.new(0.45, 0, 0.5, -13),
                BackgroundColor3 = Theme.SurfaceAlt,
                Text             = "",
                BorderSizePixel  = 0,
                ZIndex           = 2,
                Parent           = Row,
            })
            Corner(6).Parent = DropBtn
            Stroke(Theme.Border, 1).Parent = DropBtn

            local function CountText()
                local n = 0
                for _ in pairs(selected) do n = n + 1 end
                if n == 0 then return "None" end
                if n == 1 then
                    for k in pairs(selected) do return k end
                end
                return n .. " selected"
            end

            local SelLabel = Create("TextLabel", {
                Size                   = UDim2.new(1, -28, 1, 0),
                Position               = UDim2.new(0, 10, 0, 0),
                BackgroundTransparency = 1,
                Text                   = CountText(),
                TextColor3             = Theme.TextPrimary,
                TextSize               = 11,
                Font                   = Enum.Font.Gotham,
                TextXAlignment         = Enum.TextXAlignment.Left,
                ZIndex                 = 3,
                Parent                 = DropBtn,
            })

            Create("TextLabel", {
                Size                   = UDim2.new(0, 18, 1, 0),
                Position               = UDim2.new(1, -22, 0, 0),
                BackgroundTransparency = 1,
                Text                   = "▾",
                TextColor3             = Theme.TextDim,
                TextSize               = 12,
                Font                   = Enum.Font.GothamBold,
                ZIndex                 = 3,
                Parent                 = DropBtn,
            })

            local isOpen = false
            local ListFrame = nil
            local ItemFrames = {}

            local function RefreshItems()
                for opt, frame in pairs(ItemFrames) do
                    local isSel = selected[opt] == true
                    local chk   = frame:FindFirstChildOfClass("Frame")
                    if chk then
                        chk.BackgroundColor3 = isSel and Theme.Accent or Theme.SurfaceAlt
                        chk:FindFirstChildOfClass("TextLabel").Visible = isSel
                    end
                end
                SelLabel.Text = CountText()
            end

            local function CloseList()
                if ListFrame then
                    Tween(ListFrame, { Size = UDim2.new(ListFrame.Size.X.Scale, ListFrame.Size.X.Offset, 0, 0) }, 0.18)
                    task.delay(0.2, function()
                        if ListFrame then ListFrame:Destroy(); ListFrame = nil; ItemFrames = {} end
                    end)
                    isOpen = false
                end
            end

            local function OpenList()
                CloseActiveDropdown()
                ActiveDropdown = CloseList

                local absPos  = DropBtn.AbsolutePosition
                local absSize = DropBtn.AbsoluteSize
                local itemH   = 30
                local maxH    = math.min(#options * itemH, 200)

                ListFrame = Create("Frame", {
                    Size             = UDim2.new(0, absSize.X, 0, 0),
                    Position         = UDim2.new(0, absPos.X, 0, absPos.Y + absSize.Y + 4),
                    BackgroundColor3 = Theme.SurfaceAlt,
                    BorderSizePixel  = 0,
                    ZIndex           = 600,
                    ClipsDescendants = true,
                    Parent           = sGui,
                })
                Corner(8).Parent = ListFrame
                Stroke(Theme.Accent, 1.5).Parent = ListFrame

                local Scroll = Create("ScrollingFrame", {
                    Size                 = UDim2.new(1, 0, 1, 0),
                    BackgroundTransparency = 1,
                    ScrollBarThickness   = 3,
                    ScrollBarImageColor3 = Theme.Accent,
                    CanvasSize           = UDim2.new(0, 0, 0, #options * itemH),
                    ZIndex               = 601,
                    Parent               = ListFrame,
                })
                Create("UIListLayout", {
                    SortOrder = Enum.SortOrder.LayoutOrder,
                    Parent    = Scroll,
                })

                for i, opt in ipairs(options) do
                    local isSel = selected[opt] == true
                    local Item = Create("TextButton", {
                        Size                   = UDim2.new(1, 0, 0, itemH),
                        BackgroundTransparency = 1,
                        Text                   = "",
                        BorderSizePixel        = 0,
                        ZIndex                 = 602,
                        LayoutOrder            = i,
                        Parent                 = Scroll,
                    })

                    local CheckBox = Create("Frame", {
                        Size             = UDim2.new(0, 16, 0, 16),
                        Position         = UDim2.new(0, 10, 0.5, -8),
                        BackgroundColor3 = isSel and Theme.Accent or Theme.SurfaceAlt,
                        BorderSizePixel  = 0,
                        ZIndex           = 603,
                        Parent           = Item,
                    })
                    Corner(4).Parent = CheckBox
                    Stroke(Theme.Border, 1).Parent = CheckBox

                    Create("TextLabel", {
                        Size                   = UDim2.new(1, 0, 1, 0),
                        BackgroundTransparency = 1,
                        Text                   = "✓",
                        TextColor3             = Color3.fromRGB(255, 255, 255),
                        TextSize               = 10,
                        Font                   = Enum.Font.GothamBold,
                        TextXAlignment         = Enum.TextXAlignment.Center,
                        Visible                = isSel,
                        ZIndex                 = 604,
                        Parent                 = CheckBox,
                    })

                    Create("TextLabel", {
                        Size                   = UDim2.new(1, -36, 1, 0),
                        Position               = UDim2.new(0, 32, 0, 0),
                        BackgroundTransparency = 1,
                        Text                   = opt,
                        TextColor3             = Theme.TextPrimary,
                        TextSize               = 11,
                        Font                   = Enum.Font.Gotham,
                        TextXAlignment         = Enum.TextXAlignment.Left,
                        ZIndex                 = 603,
                        Parent                 = Item,
                    })

                    ItemFrames[opt] = Item

                    Item.MouseEnter:Connect(function()
                        Tween(Item, { BackgroundTransparency = 0.9 }, 0.08)
                        Item.BackgroundColor3 = Theme.SurfaceHover
                    end)
                    Item.MouseLeave:Connect(function()
                        Tween(Item, { BackgroundTransparency = 1 }, 0.08)
                    end)
                    Item.MouseButton1Click:Connect(function()
                        local selCount = 0
                        for _ in pairs(selected) do selCount = selCount + 1 end
                        if selected[opt] then
                            selected[opt] = nil
                        elseif selCount < max_sel then
                            selected[opt] = true
                        end
                        RefreshItems()
                        local out = {}
                        for k in pairs(selected) do table.insert(out, k) end
                        callback(out)
                    end)
                end

                Tween(ListFrame, { Size = UDim2.new(0, absSize.X, 0, maxH) }, 0.22, Enum.EasingStyle.Back)
                isOpen = true
            end

            DropBtn.MouseButton1Click:Connect(function()
                if isOpen then CloseList() else OpenList() end
            end)

            local el = {}
            function el:GetSelected()
                local out = {}
                for k in pairs(selected) do table.insert(out, k) end
                return out
            end
            function el:SetSelected(arr)
                selected = {}
                for _, v in ipairs(arr) do selected[v] = true end
                SelLabel.Text = CountText()
            end
            if flag then
                ConfigRegistry[flag] = {
                    Get  = function()
                        local out = {}
                        for k in pairs(selected) do table.insert(out, k) end
                        return out
                    end,
                    Set  = function(arr)
                        selected = {}
                        for _, v in ipairs(arr) do selected[v] = true end
                        SelLabel.Text = CountText()
                    end,
                    Type = "multidropdown",
                }
            end
            return el
        end

        function sec:AddSearchDropdown(config)
            config = config or {}
            local label    = config.Label    or "Search"
            local options  = config.Options  or {}
            local default  = config.Default  or ""
            local flag     = config.Flag
            local callback = config.Callback or function() end
            local selected = default

            local Row = BR(38)

            Create("TextLabel", {
                Size                   = UDim2.new(0, 110, 1, 0),
                Position               = UDim2.new(0, 12, 0, 0),
                BackgroundTransparency = 1,
                Text                   = label,
                TextColor3             = Theme.TextPrimary,
                TextSize               = 12,
                Font                   = Enum.Font.GothamSemibold,
                TextXAlignment         = Enum.TextXAlignment.Left,
                Parent                 = Row,
            })

            local DropBtn = Create("TextButton", {
                Size             = UDim2.new(0.55, 0, 0, 26),
                Position         = UDim2.new(0.45, 0, 0.5, -13),
                BackgroundColor3 = Theme.SurfaceAlt,
                Text             = "",
                BorderSizePixel  = 0,
                ZIndex           = 2,
                Parent           = Row,
            })
            Corner(6).Parent = DropBtn
            Stroke(Theme.Border, 1).Parent = DropBtn

            local SelLabel = Create("TextLabel", {
                Size                   = UDim2.new(1, -28, 1, 0),
                Position               = UDim2.new(0, 10, 0, 0),
                BackgroundTransparency = 1,
                Text                   = selected ~= "" and selected or "Search...",
                TextColor3             = selected ~= "" and Theme.TextPrimary or Theme.TextDim,
                TextSize               = 11,
                Font                   = Enum.Font.Gotham,
                TextXAlignment         = Enum.TextXAlignment.Left,
                ZIndex                 = 3,
                Parent                 = DropBtn,
            })

            Create("TextLabel", {
                Size                   = UDim2.new(0, 18, 1, 0),
                Position               = UDim2.new(1, -22, 0, 0),
                BackgroundTransparency = 1,
                Text                   = "🔍",
                TextColor3             = Theme.TextDim,
                TextSize               = 11,
                Font                   = Enum.Font.GothamBold,
                ZIndex                 = 3,
                Parent                 = DropBtn,
            })

            local isOpen = false
            local ListFrame = nil

            local function FilterOptions(query)
                if query == "" then return options end
                local out = {}
                for _, v in ipairs(options) do
                    if v:lower():find(query:lower(), 1, true) then
                        table.insert(out, v)
                    end
                end
                return out
            end

            local function RebuildList(scroll, query)
                for _, c in ipairs(scroll:GetChildren()) do
                    if c:IsA("TextButton") then c:Destroy() end
                end
                local filtered = FilterOptions(query)
                scroll.CanvasSize = UDim2.new(0, 0, 0, #filtered * 28)
                for i, opt in ipairs(filtered) do
                    local Item = Create("TextButton", {
                        Size                   = UDim2.new(1, 0, 0, 28),
                        BackgroundTransparency = opt == selected and 0.75 or 1,
                        BackgroundColor3       = opt == selected and Theme.Accent or Color3.fromRGB(0,0,0),
                        Text                   = "",
                        BorderSizePixel        = 0,
                        ZIndex                 = 602,
                        LayoutOrder            = i,
                        Parent                 = scroll,
                    })
                    Create("TextLabel", {
                        Size                   = UDim2.new(1, -16, 1, 0),
                        Position               = UDim2.new(0, 10, 0, 0),
                        BackgroundTransparency = 1,
                        Text                   = opt,
                        TextColor3             = opt == selected and Theme.Accent or Theme.TextPrimary,
                        TextSize               = 11,
                        Font                   = opt == selected and Enum.Font.GothamBold or Enum.Font.Gotham,
                        TextXAlignment         = Enum.TextXAlignment.Left,
                        ZIndex                 = 603,
                        Parent                 = Item,
                    })
                    Item.MouseEnter:Connect(function()
                        if opt ~= selected then Tween(Item, { BackgroundTransparency = 0.9 }, 0.08); Item.BackgroundColor3 = Theme.SurfaceHover end
                    end)
                    Item.MouseLeave:Connect(function()
                        if opt ~= selected then Tween(Item, { BackgroundTransparency = 1 }, 0.08) end
                    end)
                    Item.MouseButton1Click:Connect(function()
                        selected       = opt
                        SelLabel.Text  = opt
                        SelLabel.TextColor3 = Theme.TextPrimary
                        callback(selected)
                        if ListFrame then ListFrame:Destroy(); ListFrame = nil; isOpen = false end
                    end)
                end
            end

            local function CloseList()
                if ListFrame then
                    Tween(ListFrame, { Size = UDim2.new(ListFrame.Size.X.Scale, ListFrame.Size.X.Offset, 0, 0) }, 0.18)
                    task.delay(0.2, function()
                        if ListFrame then ListFrame:Destroy(); ListFrame = nil end
                    end)
                    isOpen = false
                end
            end

            local function OpenList()
                CloseActiveDropdown()
                ActiveDropdown = CloseList

                local absPos  = DropBtn.AbsolutePosition
                local absSize = DropBtn.AbsoluteSize

                ListFrame = Create("Frame", {
                    Size             = UDim2.new(0, absSize.X, 0, 0),
                    Position         = UDim2.new(0, absPos.X, 0, absPos.Y + absSize.Y + 4),
                    BackgroundColor3 = Theme.SurfaceAlt,
                    BorderSizePixel  = 0,
                    ZIndex           = 600,
                    ClipsDescendants = true,
                    Parent           = sGui,
                })
                Corner(8).Parent = ListFrame
                Stroke(Theme.Accent, 1.5).Parent = ListFrame

                local SearchBox = Create("TextBox", {
                    Size             = UDim2.new(1, -16, 0, 28),
                    Position         = UDim2.new(0, 8, 0, 6),
                    BackgroundColor3 = Theme.Surface,
                    Text             = "",
                    PlaceholderText  = "Search...",
                    PlaceholderColor3 = Theme.TextDim,
                    TextColor3       = Theme.TextPrimary,
                    TextSize         = 11,
                    Font             = Enum.Font.Gotham,
                    ClearTextOnFocus = false,
                    BorderSizePixel  = 0,
                    ZIndex           = 601,
                    Parent           = ListFrame,
                })
                Corner(5).Parent = SearchBox
                Pad(0, 8, 0, 8).Parent = SearchBox

                local Scroll = Create("ScrollingFrame", {
                    Size                 = UDim2.new(1, 0, 1, -42),
                    Position             = UDim2.new(0, 0, 0, 38),
                    BackgroundTransparency = 1,
                    ScrollBarThickness   = 3,
                    ScrollBarImageColor3 = Theme.Accent,
                    CanvasSize           = UDim2.new(0, 0, 0, 0),
                    ZIndex               = 601,
                    Parent               = ListFrame,
                })
                Create("UIListLayout", {
                    SortOrder = Enum.SortOrder.LayoutOrder,
                    Parent    = Scroll,
                })

                RebuildList(Scroll, "")
                SearchBox:GetPropertyChangedSignal("Text"):Connect(function()
                    RebuildList(Scroll, SearchBox.Text)
                end)

                local maxH = math.min(#options * 28 + 48, 230)
                Tween(ListFrame, { Size = UDim2.new(0, absSize.X, 0, maxH) }, 0.22, Enum.EasingStyle.Back)
                isOpen = true
                task.defer(function() SearchBox:CaptureFocus() end)
            end

            DropBtn.MouseButton1Click:Connect(function()
                if isOpen then CloseList() else OpenList() end
            end)

            local el = {}
            function el:Set(v) selected = v; SelLabel.Text = v; SelLabel.TextColor3 = Theme.TextPrimary end
            function el:Get() return selected end
            if flag then
                ConfigRegistry[flag] = { Get = function() return selected end, Set = function(v) selected = v; SelLabel.Text = v end, Type = "searchdropdown" }
            end
            return el
        end

        function sec:AddButton(config)
            config = config or {}
            local label    = config.Label    or "Button"
            local desc     = config.Description
            local style    = config.Style    or "Default"
            local callback = config.Callback or function() end

            local h = desc and 50 or 36
            local Row = Create("Frame", {
                Size             = UDim2.new(1, 0, 0, h),
                BackgroundColor3 = Theme.SurfaceAlt,
                BorderSizePixel  = 0,
                LayoutOrder      = SO(),
                Parent           = container,
            })
            Corner(8).Parent = Row
            Stroke(Theme.Border, 1).Parent = Row

            Create("UIGradient", {
                Color = ColorSequence.new({
                    ColorSequenceKeypoint.new(0, Color3.fromRGB(255,255,255)),
                    ColorSequenceKeypoint.new(1, Color3.fromRGB(200,200,200)),
                }),
                Transparency = NumberSequence.new({
                    NumberSequenceKeypoint.new(0, 0.88),
                    NumberSequenceKeypoint.new(1, 0.94),
                }),
                Rotation = 90,
                Parent   = Row,
            })

            local accent = style == "Accent" and Theme.Accent
                        or style == "Danger" and Theme.Danger
                        or style == "Success" and Theme.Success
                        or nil

            local BtnLabel = Create("TextLabel", {
                Size                   = UDim2.new(1, -24, desc and 0 or 1, 0),
                Position               = UDim2.new(0, 12, desc and 0 or 0, desc and 10 or 0),
                AutomaticSize          = desc and Enum.AutomaticSize.Y or Enum.AutomaticSize.None,
                BackgroundTransparency = 1,
                Text                   = label,
                TextColor3             = accent or Theme.TextPrimary,
                TextSize               = 12,
                Font                   = Enum.Font.GothamSemibold,
                TextXAlignment         = Enum.TextXAlignment.Left,
                Parent                 = Row,
            })
            if desc then
                Create("TextLabel", {
                    Size                   = UDim2.new(1, -24, 0, 14),
                    Position               = UDim2.new(0, 12, 0, 28),
                    BackgroundTransparency = 1,
                    Text                   = desc,
                    TextColor3             = Theme.TextDim,
                    TextSize               = 10,
                    Font                   = Enum.Font.Gotham,
                    TextXAlignment         = Enum.TextXAlignment.Left,
                    Parent                 = Row,
                })
            end

            Create("TextLabel", {
                Size                   = UDim2.new(0, 16, 1, 0),
                Position               = UDim2.new(1, -22, 0, 0),
                BackgroundTransparency = 1,
                Text                   = "›",
                TextColor3             = accent or Theme.TextDim,
                TextSize               = 18,
                Font                   = Enum.Font.GothamBold,
                ZIndex                 = 2,
                Parent                 = Row,
            })

            local clickable = Create("TextButton", {
                Size                   = UDim2.new(1, 0, 1, 0),
                BackgroundTransparency = 1,
                Text                   = "",
                ZIndex                 = 3,
                Parent                 = Row,
            })
            clickable.MouseButton1Click:Connect(function()
                Tween(Row, { BackgroundColor3 = accent or Theme.SurfaceHover }, 0.08)
                task.delay(0.14, function() Tween(Row, { BackgroundColor3 = Theme.SurfaceAlt }, 0.12) end)
                callback()
            end)
            clickable.MouseEnter:Connect(function()
                Tween(BtnLabel, { TextColor3 = accent or Theme.Accent }, 0.1)
            end)
            clickable.MouseLeave:Connect(function()
                Tween(BtnLabel, { TextColor3 = accent or Theme.TextPrimary }, 0.1)
            end)

            RegisterThemeListener(function(t)
                Row.BackgroundColor3  = t.SurfaceAlt
                Row:FindFirstChildOfClass("UIStroke").Color = t.Border
            end)
        end

        function sec:AddTextbox(config)
            config = config or {}
            local label       = config.Label       or "Input"
            local placeholder = config.Placeholder or "Type here..."
            local default     = config.Default     or ""
            local flag        = config.Flag
            local multiline   = config.Multiline   or false
            local onChanged   = config.OnChanged
            local callback    = config.Callback    or function() end

            local h = multiline and 72 or 52
            local Row = BR(h)

            Create("TextLabel", {
                Size                   = UDim2.new(1, -24, 0, 16),
                Position               = UDim2.new(0, 12, 0, 6),
                BackgroundTransparency = 1,
                Text                   = label,
                TextColor3             = Theme.TextDim,
                TextSize               = 10,
                Font                   = Enum.Font.GothamBold,
                TextXAlignment         = Enum.TextXAlignment.Left,
                Parent                 = Row,
            })

            local TBox = Create("TextBox", {
                Size             = UDim2.new(1, -24, 0, multiline and 42 or 24),
                Position         = UDim2.new(0, 12, 0, 22),
                BackgroundTransparency = 1,
                Text             = default,
                PlaceholderText  = placeholder,
                PlaceholderColor3 = Theme.TextDim,
                TextColor3       = Theme.TextPrimary,
                TextSize         = 12,
                Font             = Enum.Font.Gotham,
                TextXAlignment   = Enum.TextXAlignment.Left,
                TextYAlignment   = Enum.TextYAlignment.Top,
                ClearTextOnFocus = false,
                MultiLine        = multiline,
                TextWrapped      = multiline,
                Parent           = Row,
            })

            local Underline = Create("Frame", {
                Size             = UDim2.new(1, -24, 0, 1),
                Position         = UDim2.new(0, 12, 1, -3),
                BackgroundColor3 = Theme.Border,
                BorderSizePixel  = 0,
                Parent           = Row,
            })

            TBox.Focused:Connect(function()
                Tween(Underline, { BackgroundColor3 = Theme.Accent, Size = UDim2.new(1, -24, 0, 2) }, 0.15)
            end)
            TBox.FocusLost:Connect(function(enter)
                Tween(Underline, { BackgroundColor3 = Theme.Border, Size = UDim2.new(1, -24, 0, 1) }, 0.15)
                if enter or not enter then callback(TBox.Text) end
            end)
            if onChanged then
                TBox:GetPropertyChangedSignal("Text"):Connect(function()
                    onChanged(TBox.Text)
                end)
            end

            RegisterThemeListener(function(t)
                TBox.TextColor3       = t.TextPrimary
                TBox.PlaceholderColor3 = t.TextDim
                Underline.BackgroundColor3 = t.Border
            end)

            local el = {}
            function el:Get() return TBox.Text end
            function el:Set(v) TBox.Text = v end
            if flag then
                ConfigRegistry[flag] = { Get = function() return TBox.Text end, Set = function(v) TBox.Text = v end, Type = "textbox" }
            end
            return el
        end

        function sec:AddKeybind(config)
            config = config or {}
            local label    = config.Label    or "Keybind"
            local default  = config.Default  or Enum.KeyCode.Unknown
            local flag     = config.Flag
            local callback = config.Callback or function() end
            local current  = default

            local Row = BR(38)

            Create("TextLabel", {
                Size                   = UDim2.new(0, 160, 1, 0),
                Position               = UDim2.new(0, 12, 0, 0),
                BackgroundTransparency = 1,
                Text                   = label,
                TextColor3             = Theme.TextPrimary,
                TextSize               = 12,
                Font                   = Enum.Font.GothamSemibold,
                TextXAlignment         = Enum.TextXAlignment.Left,
                Parent                 = Row,
            })

            local KeyBtn = Create("TextButton", {
                Size             = UDim2.new(0, 90, 0, 24),
                Position         = UDim2.new(1, -102, 0.5, -12),
                BackgroundColor3 = Theme.SurfaceAlt,
                Text             = current == Enum.KeyCode.Unknown and "None" or current.Name,
                TextColor3       = Theme.Accent,
                TextSize         = 11,
                Font             = Enum.Font.GothamBold,
                BorderSizePixel  = 0,
                ZIndex           = 2,
                Parent           = Row,
            })
            Corner(5).Parent = KeyBtn
            Stroke(Theme.Border, 1).Parent = KeyBtn

            local listening = false

            KeyBtn.MouseButton1Click:Connect(function()
                if listening then return end
                listening         = true
                KeyBtn.Text       = "..."
                KeyBtn.TextColor3 = Theme.Warning

                local conn
                conn = UserInputService.InputBegan:Connect(function(inp, gpe)
                    if gpe then return end
                    if inp.UserInputType == Enum.UserInputType.Keyboard then
                        current           = inp.KeyCode
                        KeyBtn.Text       = inp.KeyCode.Name
                        KeyBtn.TextColor3 = Theme.Accent
                        listening         = false
                        conn:Disconnect()
                    end
                end)
            end)

            UserInputService.InputBegan:Connect(function(inp, gpe)
                if gpe or listening then return end
                if inp.UserInputType == Enum.UserInputType.Keyboard and inp.KeyCode == current then
                    callback(current)
                end
            end)

            local el = {}
            function el:Get() return current end
            function el:Set(k) current = k; KeyBtn.Text = k.Name end
            if flag then
                ConfigRegistry[flag] = { Get = function() return current.Name end, Set = function(v)
                    local ok, kc = pcall(function() return Enum.KeyCode[v] end)
                    if ok and kc then current = kc; KeyBtn.Text = kc.Name end
                end, Type = "keybind" }
            end
            return el
        end

        function sec:AddColorPicker(config)
            config = config or {}
            local label    = config.Label    or "Color"
            local default  = config.Default  or Color3.fromRGB(255, 255, 255)
            local flag     = config.Flag
            local callback = config.Callback or function() end
            local color    = default

            local Row = BR(38)

            Create("TextLabel", {
                Size                   = UDim2.new(0, 160, 1, 0),
                Position               = UDim2.new(0, 12, 0, 0),
                BackgroundTransparency = 1,
                Text                   = label,
                TextColor3             = Theme.TextPrimary,
                TextSize               = 12,
                Font                   = Enum.Font.GothamSemibold,
                TextXAlignment         = Enum.TextXAlignment.Left,
                Parent                 = Row,
            })

            local Preview = Create("TextButton", {
                Size             = UDim2.new(0, 70, 0, 24),
                Position         = UDim2.new(1, -82, 0.5, -12),
                BackgroundColor3 = color,
                Text             = "",
                BorderSizePixel  = 0,
                ZIndex           = 2,
                Parent           = Row,
            })
            Corner(6).Parent = Preview
            Stroke(Theme.Border, 1).Parent = Preview

            local hue, sat, val = Color3.toHSV(color)
            local isOpen   = false
            local pickerFr = nil

            local function CloseColorPicker()
                if pickerFr then
                    Tween(pickerFr, { Size = UDim2.new(0, pickerFr.AbsoluteSize.X, 0, 0) }, 0.18)
                    task.delay(0.2, function()
                        if pickerFr then pickerFr:Destroy(); pickerFr = nil end
                    end)
                    isOpen = false
                end
            end

            local function OpenColorPicker()
                CloseActiveDropdown()
                ActiveDropdown = CloseColorPicker

                local absPos  = Preview.AbsolutePosition
                local absSize = Preview.AbsoluteSize
                local pw      = 220

                pickerFr = Create("Frame", {
                    Size             = UDim2.new(0, pw, 0, 0),
                    Position         = UDim2.new(0, absPos.X - pw + absSize.X, 0, absPos.Y + absSize.Y + 6),
                    BackgroundColor3 = Theme.SurfaceAlt,
                    BorderSizePixel  = 0,
                    ZIndex           = 600,
                    ClipsDescendants = true,
                    Parent           = sGui,
                })
                Corner(10).Parent = pickerFr
                Stroke(Theme.Accent, 1.5).Parent = pickerFr

                local SatValFrame = Create("ImageLabel", {
                    Size             = UDim2.new(1, -16, 0, 140),
                    Position         = UDim2.new(0, 8, 0, 8),
                    BackgroundColor3 = Color3.fromHSV(hue, 1, 1),
                    Image            = "rbxassetid://2615689005",
                    ZIndex           = 601,
                    Parent           = pickerFr,
                })
                Corner(6).Parent = SatValFrame

                local SVCursor = Create("Frame", {
                    Size             = UDim2.new(0, 12, 0, 12),
                    AnchorPoint      = Vector2.new(0.5, 0.5),
                    Position         = UDim2.new(sat, 0, 1 - val, 0),
                    BackgroundColor3 = Color3.fromRGB(255,255,255),
                    BorderSizePixel  = 0,
                    ZIndex           = 603,
                    Parent           = SatValFrame,
                })
                Corner(6).Parent = SVCursor
                Stroke(Color3.fromRGB(0,0,0), 2).Parent = SVCursor

                local HueBar = Create("ImageLabel", {
                    Size             = UDim2.new(1, -16, 0, 16),
                    Position         = UDim2.new(0, 8, 0, 154),
                    Image            = "rbxassetid://2615689005",
                    BackgroundColor3 = Color3.fromRGB(255,255,255),
                    ZIndex           = 601,
                    Parent           = pickerFr,
                })
                Corner(4).Parent = HueBar

                local HueGrad = Create("UIGradient", {
                    Color = ColorSequence.new({
                        ColorSequenceKeypoint.new(0,    Color3.fromHSV(0,   1, 1)),
                        ColorSequenceKeypoint.new(0.166, Color3.fromHSV(0.166, 1, 1)),
                        ColorSequenceKeypoint.new(0.333, Color3.fromHSV(0.333, 1, 1)),
                        ColorSequenceKeypoint.new(0.5,  Color3.fromHSV(0.5, 1, 1)),
                        ColorSequenceKeypoint.new(0.666, Color3.fromHSV(0.666, 1, 1)),
                        ColorSequenceKeypoint.new(0.833, Color3.fromHSV(0.833, 1, 1)),
                        ColorSequenceKeypoint.new(1,    Color3.fromHSV(1,   1, 1)),
                    }),
                    Parent = HueBar,
                })

                local HueCursor = Create("Frame", {
                    Size             = UDim2.new(0, 8, 1, 0),
                    AnchorPoint      = Vector2.new(0.5, 0),
                    Position         = UDim2.new(hue, 0, 0, 0),
                    BackgroundColor3 = Color3.fromRGB(255,255,255),
                    BorderSizePixel  = 0,
                    ZIndex           = 602,
                    Parent           = HueBar,
                })
                Corner(3).Parent = HueCursor
                Stroke(Color3.fromRGB(0,0,0), 1).Parent = HueCursor

                local HexBox = Create("TextBox", {
                    Size             = UDim2.new(1, -16, 0, 26),
                    Position         = UDim2.new(0, 8, 0, 176),
                    BackgroundColor3 = Theme.Surface,
                    Text             = string.format("#%02X%02X%02X", math.floor(color.R*255), math.floor(color.G*255), math.floor(color.B*255)),
                    PlaceholderText  = "#FFFFFF",
                    PlaceholderColor3 = Theme.TextDim,
                    TextColor3       = Theme.TextPrimary,
                    TextSize         = 11,
                    Font             = Enum.Font.Code,
                    TextXAlignment   = Enum.TextXAlignment.Center,
                    ClearTextOnFocus = false,
                    BorderSizePixel  = 0,
                    ZIndex           = 601,
                    Parent           = pickerFr,
                })
                Corner(5).Parent = HexBox

                local function UpdateColor()
                    color = Color3.fromHSV(hue, sat, val)
                    Preview.BackgroundColor3    = color
                    SatValFrame.BackgroundColor3 = Color3.fromHSV(hue, 1, 1)
                    SVCursor.Position = UDim2.new(sat, 0, 1 - val, 0)
                    HueCursor.Position = UDim2.new(hue, 0, 0, 0)
                    HexBox.Text = string.format("#%02X%02X%02X", math.floor(color.R*255), math.floor(color.G*255), math.floor(color.B*255))
                    callback(color)
                end

                local draggingSV, draggingHue = false, false

                SatValFrame.InputBegan:Connect(function(inp)
                    if inp.UserInputType == Enum.UserInputType.MouseButton1 then
                        draggingSV = true
                    end
                end)
                HueBar.InputBegan:Connect(function(inp)
                    if inp.UserInputType == Enum.UserInputType.MouseButton1 then
                        draggingHue = true
                    end
                end)
                UserInputService.InputEnded:Connect(function(inp)
                    if inp.UserInputType == Enum.UserInputType.MouseButton1 then
                        draggingSV  = false
                        draggingHue = false
                    end
                end)
                UserInputService.InputChanged:Connect(function(inp)
                    if inp.UserInputType ~= Enum.UserInputType.MouseMovement then return end
                    if draggingSV then
                        local rx = math.clamp((inp.Position.X - SatValFrame.AbsolutePosition.X) / SatValFrame.AbsoluteSize.X, 0, 1)
                        local ry = math.clamp((inp.Position.Y - SatValFrame.AbsolutePosition.Y) / SatValFrame.AbsoluteSize.Y, 0, 1)
                        sat = rx; val = 1 - ry
                        UpdateColor()
                    elseif draggingHue then
                        hue = math.clamp((inp.Position.X - HueBar.AbsolutePosition.X) / HueBar.AbsoluteSize.X, 0, 1)
                        UpdateColor()
                    end
                end)

                HexBox.FocusLost:Connect(function()
                    local hex = HexBox.Text:gsub("#", "")
                    if #hex == 6 then
                        local r = tonumber(hex:sub(1,2), 16)
                        local g = tonumber(hex:sub(3,4), 16)
                        local b = tonumber(hex:sub(5,6), 16)
                        if r and g and b then
                            color = Color3.fromRGB(r, g, b)
                            hue, sat, val = Color3.toHSV(color)
                            Preview.BackgroundColor3 = color
                            SatValFrame.BackgroundColor3 = Color3.fromHSV(hue, 1, 1)
                            SVCursor.Position  = UDim2.new(sat, 0, 1 - val, 0)
                            HueCursor.Position = UDim2.new(hue, 0, 0, 0)
                            callback(color)
                        end
                    end
                end)

                Tween(pickerFr, { Size = UDim2.new(0, pw, 0, 208) }, 0.22, Enum.EasingStyle.Back)
                isOpen = true
            end

            Preview.MouseButton1Click:Connect(function()
                if isOpen then CloseColorPicker() else OpenColorPicker() end
            end)

            RegisterThemeListener(function(t)
                Preview:FindFirstChildOfClass("UIStroke").Color = t.Border
            end)

            local el = {}
            function el:Get() return color end
            function el:Set(c) color = c; hue, sat, val = Color3.toHSV(c); Preview.BackgroundColor3 = c; callback(c) end
            if flag then
                local function colorToStr(c) return string.format("%d,%d,%d", math.floor(c.R*255), math.floor(c.G*255), math.floor(c.B*255)) end
                local function strToColor(s)
                    local r,g,b = s:match("(%d+),(%d+),(%d+)")
                    if r then return Color3.fromRGB(tonumber(r),tonumber(g),tonumber(b)) end
                    return Color3.fromRGB(255,255,255)
                end
                ConfigRegistry[flag] = { Get = function() return colorToStr(color) end, Set = function(v)
                    local c = strToColor(v); color = c; hue, sat, val = Color3.toHSV(c); Preview.BackgroundColor3 = c; callback(c)
                end, Type = "colorpicker" }
            end
            return el
        end

        function sec:AddProgressBar(config)
            config = config or {}
            local label    = config.Label    or "Progress"
            local value    = config.Value    or 0
            local max_val  = config.Max      or 100
            local suffix   = config.Suffix   or "%"
            local color    = config.Color    or Theme.Accent

            local Row = BR(50)

            Create("TextLabel", {
                Size                   = UDim2.new(0.6, 0, 0, 18),
                Position               = UDim2.new(0, 12, 0, 6),
                BackgroundTransparency = 1,
                Text                   = label,
                TextColor3             = Theme.TextPrimary,
                TextSize               = 12,
                Font                   = Enum.Font.GothamSemibold,
                TextXAlignment         = Enum.TextXAlignment.Left,
                Parent                 = Row,
            })

            local ValLbl = Create("TextLabel", {
                Size                   = UDim2.new(0.4, -12, 0, 18),
                Position               = UDim2.new(0.6, 0, 0, 6),
                BackgroundTransparency = 1,
                Text                   = tostring(value) .. suffix,
                TextColor3             = Theme.Accent,
                TextSize               = 11,
                Font                   = Enum.Font.GothamBold,
                TextXAlignment         = Enum.TextXAlignment.Right,
                Parent                 = Row,
            })

            local Track = Create("Frame", {
                Size             = UDim2.new(1, -24, 0, 8),
                Position         = UDim2.new(0, 12, 0, 30),
                BackgroundColor3 = Theme.Slider_BG,
                BorderSizePixel  = 0,
                Parent           = Row,
            })
            Corner(4).Parent = Track

            local Fill = Create("Frame", {
                Size             = UDim2.new(math.clamp(value / max_val, 0, 1), 0, 1, 0),
                BackgroundColor3 = color,
                BorderSizePixel  = 0,
                Parent           = Track,
            })
            Corner(4).Parent = Fill
            Create("UIGradient", {
                Color = ColorSequence.new({
                    ColorSequenceKeypoint.new(0, color),
                    ColorSequenceKeypoint.new(1, Color3.new(
                        math.min(color.R + 0.2, 1),
                        math.min(color.G + 0.2, 1),
                        math.min(color.B + 0.2, 1)
                    )),
                }),
                Parent = Fill,
            })

            local el = {}
            function el:Set(v)
                value = math.clamp(v, 0, max_val)
                Tween(Fill, { Size = UDim2.new(value / max_val, 0, 1, 0) }, 0.3)
                ValLbl.Text = tostring(math.floor(value)) .. suffix
            end
            function el:Get() return value end
            return el
        end

        function sec:AddRadioGroup(config)
            config = config or {}
            local label    = config.Label    or "Radio"
            local options  = config.Options  or {}
            local default  = config.Default  or options[1]
            local flag     = config.Flag
            local callback = config.Callback or function() end
            local selected = default

            local totalH = 30 + #options * 30
            local Row = BR(totalH)
            Pad(0,0,0,0).Parent = Row

            Create("TextLabel", {
                Size                   = UDim2.new(1, -24, 0, 24),
                Position               = UDim2.new(0, 12, 0, 6),
                BackgroundTransparency = 1,
                Text                   = label,
                TextColor3             = Theme.TextPrimary,
                TextSize               = 12,
                Font                   = Enum.Font.GothamSemibold,
                TextXAlignment         = Enum.TextXAlignment.Left,
                Parent                 = Row,
            })

            local radioCircles = {}

            for i, opt in ipairs(options) do
                local isSel = opt == selected
                local Item = Create("TextButton", {
                    Size                   = UDim2.new(1, 0, 0, 28),
                    Position               = UDim2.new(0, 0, 0, 24 + (i-1) * 30),
                    BackgroundTransparency = 1,
                    Text                   = "",
                    BorderSizePixel        = 0,
                    ZIndex                 = 2,
                    Parent                 = Row,
                })

                local Outer = Create("Frame", {
                    Size             = UDim2.new(0, 18, 0, 18),
                    Position         = UDim2.new(0, 12, 0.5, -9),
                    BackgroundTransparency = 1,
                    BorderSizePixel  = 0,
                    ZIndex           = 3,
                    Parent           = Item,
                })
                Corner(9).Parent = Outer
                Stroke(isSel and Theme.Accent or Theme.Border, 2).Parent = Outer

                local Inner = Create("Frame", {
                    Size             = UDim2.new(0, 10, 0, 10),
                    Position         = UDim2.new(0.5, -5, 0.5, -5),
                    BackgroundColor3 = Theme.Accent,
                    BackgroundTransparency = isSel and 0 or 1,
                    BorderSizePixel  = 0,
                    ZIndex           = 4,
                    Parent           = Outer,
                })
                Corner(5).Parent = Inner

                Create("TextLabel", {
                    Size                   = UDim2.new(1, -38, 1, 0),
                    Position               = UDim2.new(0, 36, 0, 0),
                    BackgroundTransparency = 1,
                    Text                   = opt,
                    TextColor3             = isSel and Theme.TextPrimary or Theme.TextSecondary,
                    TextSize               = 11,
                    Font                   = isSel and Enum.Font.GothamSemibold or Enum.Font.Gotham,
                    TextXAlignment         = Enum.TextXAlignment.Left,
                    ZIndex                 = 3,
                    Parent                 = Item,
                })

                radioCircles[opt] = { Outer = Outer, Inner = Inner, Item = Item }

                Item.MouseButton1Click:Connect(function()
                    for o, rc in pairs(radioCircles) do
                        local sel = o == opt
                        Tween(rc.Inner, { BackgroundTransparency = sel and 0 or 1 }, 0.15)
                        rc.Outer:FindFirstChildOfClass("UIStroke").Color = sel and Theme.Accent or Theme.Border
                        rc.Item:FindFirstChildWhichIsA("TextLabel").TextColor3 = sel and Theme.TextPrimary or Theme.TextSecondary
                        rc.Item:FindFirstChildWhichIsA("TextLabel").Font = sel and Enum.Font.GothamSemibold or Enum.Font.Gotham
                    end
                    selected = opt
                    callback(selected)
                end)
            end

            local el = {}
            function el:Get() return selected end
            function el:Set(v)
                selected = v
                for o, rc in pairs(radioCircles) do
                    local sel = o == v
                    Tween(rc.Inner, { BackgroundTransparency = sel and 0 or 1 }, 0.15)
                end
            end
            if flag then
                ConfigRegistry[flag] = { Get = function() return selected end, Set = function(v) el:Set(v) end, Type = "radio" }
            end
            return el
        end

        function sec:AddNumberInput(config)
            config = config or {}
            local label    = config.Label    or "Number"
            local min      = config.Min      or 0
            local max      = config.Max      or 100
            local default  = config.Default  or min
            local step     = config.Step     or 1
            local flag     = config.Flag
            local callback = config.Callback or function() end
            local value    = math.clamp(default, min, max)

            local Row = BR(38)

            Create("TextLabel", {
                Size                   = UDim2.new(0, 160, 1, 0),
                Position               = UDim2.new(0, 12, 0, 0),
                BackgroundTransparency = 1,
                Text                   = label,
                TextColor3             = Theme.TextPrimary,
                TextSize               = 12,
                Font                   = Enum.Font.GothamSemibold,
                TextXAlignment         = Enum.TextXAlignment.Left,
                Parent                 = Row,
            })

            local Spinner = Create("Frame", {
                Size             = UDim2.new(0, 110, 0, 26),
                Position         = UDim2.new(1, -122, 0.5, -13),
                BackgroundColor3 = Theme.SurfaceAlt,
                BorderSizePixel  = 0,
                ZIndex           = 2,
                Parent           = Row,
            })
            Corner(6).Parent = Spinner
            Stroke(Theme.Border, 1).Parent = Spinner

            local DecBtn = Create("TextButton", {
                Size             = UDim2.new(0, 28, 1, 0),
                BackgroundColor3 = Theme.SurfaceAlt,
                Text             = "−",
                TextColor3       = Theme.TextSecondary,
                TextSize         = 14,
                Font             = Enum.Font.GothamBold,
                BorderSizePixel  = 0,
                ZIndex           = 3,
                Parent           = Spinner,
            })
            Corner(6).Parent = DecBtn

            local ValBox = Create("TextBox", {
                Size             = UDim2.new(1, -56, 1, 0),
                Position         = UDim2.new(0, 28, 0, 0),
                BackgroundTransparency = 1,
                Text             = tostring(value),
                TextColor3       = Theme.TextPrimary,
                TextSize         = 12,
                Font             = Enum.Font.GothamBold,
                TextXAlignment   = Enum.TextXAlignment.Center,
                ClearTextOnFocus = false,
                BorderSizePixel  = 0,
                ZIndex           = 3,
                Parent           = Spinner,
            })

            local IncBtn = Create("TextButton", {
                Size             = UDim2.new(0, 28, 1, 0),
                Position         = UDim2.new(1, -28, 0, 0),
                BackgroundColor3 = Theme.SurfaceAlt,
                Text             = "+",
                TextColor3       = Theme.TextSecondary,
                TextSize         = 14,
                Font             = Enum.Font.GothamBold,
                BorderSizePixel  = 0,
                ZIndex           = 3,
                Parent           = Spinner,
            })
            Corner(6).Parent = IncBtn

            local function SetValue(v)
                value = math.clamp(math.round((v - min) / step) * step + min, min, max)
                ValBox.Text = tostring(value)
                callback(value)
            end

            DecBtn.MouseButton1Click:Connect(function() SetValue(value - step) end)
            IncBtn.MouseButton1Click:Connect(function() SetValue(value + step) end)
            ValBox.FocusLost:Connect(function()
                local n = tonumber(ValBox.Text)
                if n then SetValue(n) else ValBox.Text = tostring(value) end
            end)

            local holding = false
            DecBtn.MouseButton1Down:Connect(function()
                holding = true
                task.delay(0.4, function()
                    while holding do SetValue(value - step); task.wait(0.08) end
                end)
            end)
            DecBtn.MouseButton1Up:Connect(function() holding = false end)
            IncBtn.MouseButton1Down:Connect(function()
                holding = true
                task.delay(0.4, function()
                    while holding do SetValue(value + step); task.wait(0.08) end
                end)
            end)
            IncBtn.MouseButton1Up:Connect(function() holding = false end)

            local el = {}
            function el:Get() return value end
            function el:Set(v) SetValue(v) end
            if flag then
                ConfigRegistry[flag] = { Get = function() return value end, Set = function(v) SetValue(v) end, Type = "number" }
            end
            return el
        end

        function sec:AddLabel(text, config)
            config = config or {}
            local lbl = Create("TextLabel", {
                Size                   = UDim2.new(1, 0, 0, 0),
                AutomaticSize          = Enum.AutomaticSize.Y,
                BackgroundTransparency = 1,
                Text                   = text,
                TextColor3             = config.Color or Theme.TextSecondary,
                TextSize               = config.Size or 11,
                Font                   = config.Bold and Enum.Font.GothamBold or Enum.Font.Gotham,
                TextXAlignment         = Enum.TextXAlignment.Left,
                TextWrapped            = true,
                LayoutOrder            = SO(),
                Parent                 = container,
            })
            Pad(4, 6, 4, 6).Parent = lbl
            local ref = {}
            function ref:Set(t) lbl.Text = t end
            return ref
        end

        function sec:AddSeparator(lbl)
            local h = lbl and 28 or 10
            local Sep = Create("Frame", {
                Size                   = UDim2.new(1, 0, 0, h),
                BackgroundTransparency = 1,
                LayoutOrder            = SO(),
                Parent                 = container,
            })
            local line = Create("Frame", {
                Size             = UDim2.new(1, -24, 0, 1),
                Position         = UDim2.new(0, 12, 0.5, 0),
                BackgroundColor3 = Theme.Border,
                BorderSizePixel  = 0,
                Parent           = Sep,
            })
            if lbl then
                local tw = Create("TextLabel", {
                    Size                   = UDim2.new(0, 0, 0, 16),
                    Position               = UDim2.new(0.5, 0, 0.5, -8),
                    AnchorPoint            = Vector2.new(0.5, 0),
                    AutomaticSize          = Enum.AutomaticSize.X,
                    BackgroundColor3       = Theme.Surface,
                    Text                   = "  " .. lbl .. "  ",
                    TextColor3             = Theme.TextDim,
                    TextSize               = 10,
                    Font                   = Enum.Font.GothamBold,
                    ZIndex                 = 2,
                    Parent                 = Sep,
                })
                RegisterThemeListener(function(t) tw.BackgroundColor3 = t.Surface; tw.TextColor3 = t.TextDim end)
            end
            RegisterThemeListener(function(t) line.BackgroundColor3 = t.Border end)
        end
    end

    function self:Notify(config)
        config = config or {}
        local title    = config.Title    or "Notification"
        local message  = config.Message  or ""
        local duration = config.Duration or 3
        local ntype    = config.Type     or "Info"

        local typeColor = ntype == "Success" and Theme.Success
                       or ntype == "Warning" and Theme.Warning
                       or ntype == "Danger"  and Theme.Danger
                       or Theme.Info

        local nw, nh = 280, message ~= "" and 68 or 46
        local gap    = 8
        local baseY  = -nh - 12

        for _, existing in ipairs(self._notifY) do
            baseY = baseY - nh - gap
        end

        local NotifFrame = Create("Frame", {
            Size             = UDim2.new(0, 0, 0, nh),
            Position         = UDim2.new(1, -10, 1, baseY),
            BackgroundColor3 = Theme.Surface,
            BorderSizePixel  = 0,
            ZIndex           = 800,
            ClipsDescendants = true,
            Parent           = self.ScreenGui,
        })
        Corner(10).Parent = NotifFrame
        Stroke(typeColor, 1.5).Parent = NotifFrame

        Create("Frame", {
            Size             = UDim2.new(0, 3, 1, -16),
            Position         = UDim2.new(0, 0, 0, 8),
            BackgroundColor3 = typeColor,
            BorderSizePixel  = 0,
            ZIndex           = 801,
            Parent           = NotifFrame,
        })

        local icon = ntype == "Success" and "✓" or ntype == "Warning" and "⚠" or ntype == "Danger" and "✕" or "ℹ"

        Create("TextLabel", {
            Size                   = UDim2.new(0, 22, 0, 22),
            Position               = UDim2.new(0, 10, 0, (nh - 22) / 2),
            BackgroundTransparency = 1,
            Text                   = icon,
            TextColor3             = typeColor,
            TextSize               = 14,
            Font                   = Enum.Font.GothamBold,
            ZIndex                 = 802,
            Parent                 = NotifFrame,
        })

        Create("TextLabel", {
            Size                   = UDim2.new(1, -52, 0, 18),
            Position               = UDim2.new(0, 38, 0, message ~= "" and 10 or (nh - 18) / 2),
            BackgroundTransparency = 1,
            Text                   = title,
            TextColor3             = Theme.TextPrimary,
            TextSize               = 12,
            Font                   = Enum.Font.GothamBold,
            ZIndex                 = 802,
            Parent                 = NotifFrame,
        })

        if message ~= "" then
            Create("TextLabel", {
                Size                   = UDim2.new(1, -52, 0, 28),
                Position               = UDim2.new(0, 38, 0, 30),
                BackgroundTransparency = 1,
                Text                   = message,
                TextColor3             = Theme.TextSecondary,
                TextSize               = 10,
                Font                   = Enum.Font.Gotham,
                TextXAlignment         = Enum.TextXAlignment.Left,
                TextWrapped            = true,
                ZIndex                 = 802,
                Parent                 = NotifFrame,
            })
        end

        local entry = NotifFrame
        table.insert(self._notifY, entry)

        Tween(NotifFrame, { Size = UDim2.new(0, nw, 0, nh) }, 0.28, Enum.EasingStyle.Back)

        task.delay(duration, function()
            table.remove(self._notifY, table.find(self._notifY, entry) or 1)
            Tween(NotifFrame, { Position = UDim2.new(1, 10, 1, NotifFrame.Position.Y.Offset), BackgroundTransparency = 0.5 }, 0.25)
            task.wait(0.28)
            NotifFrame:Destroy()
            for i, fr in ipairs(self._notifY) do
                local targetY = -(nh + gap) * i - 12
                Tween(fr, { Position = UDim2.new(1, -10, 1, targetY) }, 0.2)
            end
        end)
    end

    function self:SetTheme(name)
        if not Themes[name] then return end
        Theme = Themes[name]
        ActiveThemeName = name
        BroadcastTheme()
    end

    function self:GetThemes()
        local list = {}
        for k in pairs(Themes) do table.insert(list, k) end
        table.sort(list)
        return list
    end

    function self:GetCurrentTheme()
        return ActiveThemeName
    end

    function self:AddTheme(name, themeTable)
        Themes[name] = themeTable
    end

    function self:SaveConfig(name)
        name = name or self.ConfigPath
        local data = {}
        for flag, el in pairs(ConfigRegistry) do
            data[flag] = el.Get()
        end
        WriteFile(name .. ".json", SafeJSON(data))
        return data
    end

    function self:LoadConfig(name)
        name = name or self.ConfigPath
        local raw = ReadFile(name .. ".json")
        if not raw then return false end
        local data = SafeParseJSON(raw)
        for flag, val in pairs(data) do
            if ConfigRegistry[flag] then
                pcall(function() ConfigRegistry[flag].Set(val) end)
            end
        end
        return true
    end

    function self:GetConfig()
        local data = {}
        for flag, el in pairs(ConfigRegistry) do
            data[flag] = el.Get()
        end
        return data
    end

    function self:ResetConfig()
        for flag, el in pairs(ConfigRegistry) do
            ConfigRegistry[flag] = el
        end
    end

    function self:SetToggleKey(key)
        key = key or Enum.KeyCode.RightShift
        local vis = true
        UserInputService.InputBegan:Connect(function(inp, gpe)
            if gpe then return end
            if inp.KeyCode == key then
                vis = not vis
                if vis then
                    Main.Visible = true
                    Tween(Main, { Position = UDim2.new(0.5, -self.Width / 2, 0.5, -self.Height / 2) }, 0.25, Enum.EasingStyle.Back)
                else
                    Tween(Main, { Position = UDim2.new(0.5, -self.Width / 2, 1, 80) }, 0.22, Enum.EasingStyle.Back, Enum.EasingDirection.In)
                    task.delay(0.25, function() Main.Visible = false end)
                end
            end
        end)
    end

    function self:Destroy()
        self.ScreenGui:Destroy()
    end

    return self
end

return XeioaUiLibs
