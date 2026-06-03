-- KH UI Library for Roblox
-- Mobile + PC Support | Draggable | Tabs | Toggles | Sliders | Dropdowns
-- Usage: local UI = loadstring(game:HttpGet("..."))()

local KH = {}
KH.__index = KH

-- Services
local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local CoreGui = game:GetService("CoreGui")

local LocalPlayer = Players.LocalPlayer

-- Theme
local Theme = {
    Background    = Color3.fromRGB(15, 15, 18),
    Surface       = Color3.fromRGB(22, 22, 27),
    SurfaceAlt    = Color3.fromRGB(28, 28, 35),
    Border        = Color3.fromRGB(45, 45, 55),
    Accent        = Color3.fromRGB(220, 50, 50),
    AccentDim     = Color3.fromRGB(140, 30, 30),
    TextPrimary   = Color3.fromRGB(240, 240, 245),
    TextSecondary = Color3.fromRGB(130, 130, 150),
    TextDim       = Color3.fromRGB(80, 80, 100),
    Toggle_ON     = Color3.fromRGB(220, 50, 50),
    Toggle_OFF    = Color3.fromRGB(50, 50, 60),
    Slider_Fill   = Color3.fromRGB(220, 50, 50),
    Slider_BG     = Color3.fromRGB(40, 40, 50),
    TabActive     = Color3.fromRGB(220, 50, 50),
    TabInactive   = Color3.fromRGB(30, 30, 38),
}

-- Utility
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
        Color = color or Theme.Border,
        Thickness = thickness or 1,
        ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
    })
end

local function Padding(top, right, bottom, left)
    return Create("UIPadding", {
        PaddingTop    = UDim.new(0, top    or 8),
        PaddingRight  = UDim.new(0, right  or 8),
        PaddingBottom = UDim.new(0, bottom or 8),
        PaddingLeft   = UDim.new(0, left   or 8),
    })
end

-- ─────────────────────────────────────────────
-- WINDOW
-- ─────────────────────────────────────────────
function KH.new(config)
    config = config or {}
    local self = setmetatable({}, KH)

    self.Title    = config.Title    or "KH"
    self.Subtitle = config.Subtitle or "UI Library"
    self.Width    = config.Width    or 520
    self.Height   = config.Height   or 380
    self.Tabs     = {}
    self.ActiveTab = nil

    -- Root ScreenGui
    local ScreenGui = Create("ScreenGui", {
        Name             = "KH_UILib",
        ResetOnSpawn     = false,
        ZIndexBehavior   = Enum.ZIndexBehavior.Sibling,
        DisplayOrder     = 999,
        IgnoreGuiInset   = true,
    })
    pcall(function() ScreenGui.Parent = CoreGui end)
    if not ScreenGui.Parent then
        ScreenGui.Parent = LocalPlayer:WaitForChild("PlayerGui")
    end
    self.ScreenGui = ScreenGui

    -- Main Frame
    local Main = Create("Frame", {
        Name              = "Main",
        Size              = UDim2.new(0, self.Width, 0, self.Height),
        Position          = UDim2.new(0.5, -self.Width/2, 0.5, -self.Height/2),
        BackgroundColor3  = Theme.Background,
        BorderSizePixel   = 0,
        ClipsDescendants  = true,
        Parent            = ScreenGui,
    }, { Corner(10), Stroke(Theme.Border, 1.5) })
    self.Main = Main

    -- Gradient top bar accent line
    local AccentLine = Create("Frame", {
        Size             = UDim2.new(1, 0, 0, 2),
        Position         = UDim2.new(0, 0, 0, 0),
        BackgroundColor3 = Theme.Accent,
        BorderSizePixel  = 0,
        ZIndex           = 10,
        Parent           = Main,
    })
    Create("UIGradient", {
        Color = ColorSequence.new({
            ColorSequenceKeypoint.new(0, Theme.Accent),
            ColorSequenceKeypoint.new(0.5, Color3.fromRGB(255, 80, 80)),
            ColorSequenceKeypoint.new(1, Theme.AccentDim),
        }),
        Parent = AccentLine,
    })

    -- Title Bar
    local TitleBar = Create("Frame", {
        Name             = "TitleBar",
        Size             = UDim2.new(1, 0, 0, 48),
        Position         = UDim2.new(0, 0, 0, 2),
        BackgroundColor3 = Theme.Surface,
        BorderSizePixel  = 0,
        ZIndex           = 5,
        Parent           = Main,
    })

    -- Logo / Title text
    local LogoLabel = Create("TextLabel", {
        Size             = UDim2.new(0, 40, 1, 0),
        Position         = UDim2.new(0, 14, 0, 0),
        BackgroundTransparency = 1,
        Text             = self.Title,
        TextColor3       = Theme.Accent,
        TextSize         = 20,
        Font             = Enum.Font.GothamBold,
        TextXAlignment   = Enum.TextXAlignment.Left,
        ZIndex           = 6,
        Parent           = TitleBar,
    })

    local SubLabel = Create("TextLabel", {
        Size             = UDim2.new(1, -120, 1, 0),
        Position         = UDim2.new(0, 60, 0, 0),
        BackgroundTransparency = 1,
        Text             = self.Subtitle,
        TextColor3       = Theme.TextSecondary,
        TextSize         = 11,
        Font             = Enum.Font.Gotham,
        TextXAlignment   = Enum.TextXAlignment.Left,
        ZIndex           = 6,
        Parent           = TitleBar,
    })

    -- Close Button
    local CloseBtn = Create("TextButton", {
        Size             = UDim2.new(0, 28, 0, 28),
        Position         = UDim2.new(1, -36, 0.5, -14),
        BackgroundColor3 = Color3.fromRGB(60, 30, 30),
        Text             = "✕",
        TextColor3       = Theme.Accent,
        TextSize         = 13,
        Font             = Enum.Font.GothamBold,
        BorderSizePixel  = 0,
        ZIndex           = 7,
        Parent           = TitleBar,
    }, { Corner(6) })

    CloseBtn.MouseButton1Click:Connect(function()
        Tween(Main, { Size = UDim2.new(0, self.Width, 0, 0) }, 0.2)
        task.wait(0.22)
        ScreenGui:Destroy()
    end)

    -- Minimize Button
    self._minimized = false
    local MinBtn = Create("TextButton", {
        Size             = UDim2.new(0, 28, 0, 28),
        Position         = UDim2.new(1, -70, 0.5, -14),
        BackgroundColor3 = Theme.SurfaceAlt,
        Text             = "─",
        TextColor3       = Theme.TextSecondary,
        TextSize         = 13,
        Font             = Enum.Font.GothamBold,
        BorderSizePixel  = 0,
        ZIndex           = 7,
        Parent           = TitleBar,
    }, { Corner(6) })

    MinBtn.MouseButton1Click:Connect(function()
        self._minimized = not self._minimized
        if self._minimized then
            Tween(Main, { Size = UDim2.new(0, self.Width, 0, 50) }, 0.25)
        else
            Tween(Main, { Size = UDim2.new(0, self.Width, 0, self.Height) }, 0.25)
        end
    end)

    -- Tab Bar
    local TabBar = Create("Frame", {
        Name             = "TabBar",
        Size             = UDim2.new(1, 0, 0, 36),
        Position         = UDim2.new(0, 0, 0, 50),
        BackgroundColor3 = Theme.Surface,
        BorderSizePixel  = 0,
        ZIndex           = 4,
        Parent           = Main,
    })
    Create("UIStroke", {
        Color = Theme.Border,
        Thickness = 1,
        ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
        Parent = TabBar,
    })
    local TabList = Create("Frame", {
        Size             = UDim2.new(1, -16, 1, -8),
        Position         = UDim2.new(0, 8, 0, 4),
        BackgroundTransparency = 1,
        Parent           = TabBar,
    })
    Create("UIListLayout", {
        FillDirection = Enum.FillDirection.Horizontal,
        SortOrder     = Enum.SortOrder.LayoutOrder,
        Padding       = UDim.new(0, 4),
        Parent        = TabList,
    })
    self.TabList = TabList

    -- Content Area (scrollable)
    local ContentArea = Create("Frame", {
        Name             = "ContentArea",
        Size             = UDim2.new(1, 0, 1, -88),
        Position         = UDim2.new(0, 0, 0, 88),
        BackgroundTransparency = 1,
        ClipsDescendants = true,
        Parent           = Main,
    })
    self.ContentArea = ContentArea

    -- ── DRAGGING ──────────────────────────────
    local dragging, dragStart, startPos = false, nil, nil

    local function beginDrag(input)
        dragging  = true
        dragStart = input.Position
        startPos  = Main.Position
    end

    local function updateDrag(input)
        if not dragging then return end
        local delta = input.Position - dragStart
        Main.Position = UDim2.new(
            startPos.X.Scale,
            startPos.X.Offset + delta.X,
            startPos.Y.Scale,
            startPos.Y.Offset + delta.Y
        )
    end

    local function endDrag()
        dragging = false
    end

    -- PC drag
    TitleBar.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            beginDrag(input)
        end
    end)
    UserInputService.InputChanged:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseMovement then
            updateDrag(input)
        end
    end)
    UserInputService.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            endDrag()
        end
    end)

    -- Mobile drag (Touch)
    TitleBar.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.Touch then
            beginDrag(input)
        end
    end)
    TitleBar.InputChanged:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.Touch then
            updateDrag(input)
        end
    end)
    TitleBar.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.Touch then
            endDrag()
        end
    end)

    -- Open animation
    Main.Size = UDim2.new(0, self.Width, 0, 0)
    Tween(Main, { Size = UDim2.new(0, self.Width, 0, self.Height) }, 0.3, Enum.EasingStyle.Back)

    return self
end

-- ─────────────────────────────────────────────
-- TAB
-- ─────────────────────────────────────────────
function KH:AddTab(name, icon)
    local tab = {}
    tab.Name = name

    -- Tab Button
    local TabBtn = Create("TextButton", {
        Size             = UDim2.new(0, 0, 1, 0),
        AutomaticSize    = Enum.AutomaticSize.X,
        BackgroundColor3 = Theme.TabInactive,
        Text             = (icon and icon .. "  " or "") .. name,
        TextColor3       = Theme.TextSecondary,
        TextSize         = 11,
        Font             = Enum.Font.GothamSemibold,
        BorderSizePixel  = 0,
        ZIndex           = 5,
        Parent           = self.TabList,
    }, { Corner(5), Padding(0, 10, 0, 10) })

    -- Tab Content (ScrollingFrame)
    local TabContent = Create("ScrollingFrame", {
        Name                    = "Tab_" .. name,
        Size                    = UDim2.new(1, 0, 1, 0),
        BackgroundTransparency  = 1,
        ScrollBarThickness      = 3,
        ScrollBarImageColor3    = Theme.Accent,
        CanvasSize              = UDim2.new(0, 0, 0, 0),
        AutomaticCanvasSize     = Enum.AutomaticSize.Y,
        Visible                 = false,
        BorderSizePixel         = 0,
        Parent                  = self.ContentArea,
    })
    Create("UIListLayout", {
        SortOrder     = Enum.SortOrder.LayoutOrder,
        Padding       = UDim.new(0, 4),
        Parent        = TabContent,
    })
    Padding(8, 12, 8, 12).Parent = TabContent

    tab.Content = TabContent
    tab.Button  = TabBtn

    local function activate()
        -- Deactivate all
        for _, t in ipairs(self.Tabs) do
            t.Content.Visible = false
            Tween(t.Button, { BackgroundColor3 = Theme.TabInactive }, 0.12)
            Tween(t.Button, { TextColor3 = Theme.TextSecondary }, 0.12)
        end
        -- Activate this
        TabContent.Visible = true
        Tween(TabBtn, { BackgroundColor3 = Theme.TabActive }, 0.12)
        Tween(TabBtn, { TextColor3 = Theme.TextPrimary }, 0.12)
        self.ActiveTab = tab
    end

    TabBtn.MouseButton1Click:Connect(activate)

    table.insert(self.Tabs, tab)
    if #self.Tabs == 1 then activate() end

    -- ── SECTION ───────────────────────────────
    function tab:AddSection(sectionName)
        local section = {}

        local SectionLabel = Create("TextLabel", {
            Size             = UDim2.new(1, 0, 0, 20),
            BackgroundTransparency = 1,
            Text             = sectionName:upper(),
            TextColor3       = Theme.TextDim,
            TextSize         = 9,
            Font             = Enum.Font.GothamBold,
            TextXAlignment   = Enum.TextXAlignment.Left,
            LayoutOrder      = 0,
            Parent           = TabContent,
        }, { Padding(2, 0, 2, 4) })

        -- ── TOGGLE ────────────────────────────
        function section:AddToggle(config)
            config = config or {}
            local label    = config.Label    or "Toggle"
            local default  = config.Default  or false
            local callback = config.Callback or function() end
            local state    = default

            local Row = Create("Frame", {
                Size             = UDim2.new(1, 0, 0, 38),
                BackgroundColor3 = Theme.Surface,
                BorderSizePixel  = 0,
                LayoutOrder      = 99,
                Parent           = TabContent,
            }, { Corner(7), Stroke(Theme.Border, 1) })

            local Label = Create("TextLabel", {
                Size             = UDim2.new(1, -60, 1, 0),
                Position         = UDim2.new(0, 12, 0, 0),
                BackgroundTransparency = 1,
                Text             = label,
                TextColor3       = Theme.TextPrimary,
                TextSize         = 12,
                Font             = Enum.Font.Gotham,
                TextXAlignment   = Enum.TextXAlignment.Left,
                Parent           = Row,
            })

            local ToggleTrack = Create("Frame", {
                Size             = UDim2.new(0, 38, 0, 20),
                Position         = UDim2.new(1, -50, 0.5, -10),
                BackgroundColor3 = state and Theme.Toggle_ON or Theme.Toggle_OFF,
                BorderSizePixel  = 0,
                Parent           = Row,
            }, { Corner(10) })

            local ToggleThumb = Create("Frame", {
                Size             = UDim2.new(0, 14, 0, 14),
                Position         = state and UDim2.new(1, -17, 0.5, -7) or UDim2.new(0, 3, 0.5, -7),
                BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                BorderSizePixel  = 0,
                Parent           = ToggleTrack,
            }, { Corner(7) })

            local function setToggle(val)
                state = val
                Tween(ToggleTrack, { BackgroundColor3 = state and Theme.Toggle_ON or Theme.Toggle_OFF }, 0.15)
                Tween(ToggleThumb, {
                    Position = state
                        and UDim2.new(1, -17, 0.5, -7)
                        or  UDim2.new(0, 3, 0.5, -7)
                }, 0.15)
                callback(state)
            end

            -- PC click
            Row.InputBegan:Connect(function(input)
                if input.UserInputType == Enum.UserInputType.MouseButton1
                or input.UserInputType == Enum.UserInputType.Touch then
                    setToggle(not state)
                    Tween(Row, { BackgroundColor3 = Color3.fromRGB(35, 35, 45) }, 0.08)
                    task.wait(0.08)
                    Tween(Row, { BackgroundColor3 = Theme.Surface }, 0.08)
                end
            end)

            local toggle = {}
            function toggle:Set(val) setToggle(val) end
            function toggle:Get() return state end
            return toggle
        end

        -- ── SLIDER ────────────────────────────
        function section:AddSlider(config)
            config = config or {}
            local label    = config.Label    or "Slider"
            local min      = config.Min      or 0
            local max      = config.Max      or 100
            local default  = config.Default  or min
            local suffix   = config.Suffix   or ""
            local callback = config.Callback or function() end
            local value    = math.clamp(default, min, max)

            local Row = Create("Frame", {
                Size             = UDim2.new(1, 0, 0, 50),
                BackgroundColor3 = Theme.Surface,
                BorderSizePixel  = 0,
                LayoutOrder      = 99,
                Parent           = TabContent,
            }, { Corner(7), Stroke(Theme.Border, 1) })

            local TopRow = Create("Frame", {
                Size             = UDim2.new(1, -24, 0, 22),
                Position         = UDim2.new(0, 12, 0, 6),
                BackgroundTransparency = 1,
                Parent           = Row,
            })

            Create("TextLabel", {
                Size             = UDim2.new(0.7, 0, 1, 0),
                BackgroundTransparency = 1,
                Text             = label,
                TextColor3       = Theme.TextPrimary,
                TextSize         = 12,
                Font             = Enum.Font.Gotham,
                TextXAlignment   = Enum.TextXAlignment.Left,
                Parent           = TopRow,
            })

            local ValLabel = Create("TextLabel", {
                Size             = UDim2.new(0.3, 0, 1, 0),
                Position         = UDim2.new(0.7, 0, 0, 0),
                BackgroundTransparency = 1,
                Text             = tostring(value) .. suffix,
                TextColor3       = Theme.Accent,
                TextSize         = 12,
                Font             = Enum.Font.GothamSemibold,
                TextXAlignment   = Enum.TextXAlignment.Right,
                Parent           = TopRow,
            })

            local TrackBG = Create("Frame", {
                Size             = UDim2.new(1, -24, 0, 6),
                Position         = UDim2.new(0, 12, 0, 34),
                BackgroundColor3 = Theme.Slider_BG,
                BorderSizePixel  = 0,
                Parent           = Row,
            }, { Corner(3) })

            local fillPct = (value - min) / (max - min)
            local TrackFill = Create("Frame", {
                Size             = UDim2.new(fillPct, 0, 1, 0),
                BackgroundColor3 = Theme.Slider_Fill,
                BorderSizePixel  = 0,
                Parent           = TrackBG,
            }, { Corner(3) })

            local Thumb = Create("Frame", {
                Size             = UDim2.new(0, 14, 0, 14),
                Position         = UDim2.new(fillPct, -7, 0.5, -7),
                BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                BorderSizePixel  = 0,
                ZIndex           = 3,
                Parent           = TrackBG,
            }, { Corner(7) })

            local draggingSlider = false

            local function updateSlider(inputX)
                local abs = TrackBG.AbsolutePosition.X
                local sz  = TrackBG.AbsoluteSize.X
                local pct = math.clamp((inputX - abs) / sz, 0, 1)
                value = math.floor(min + pct * (max - min) + 0.5)
                local p = (value - min) / (max - min)
                Tween(TrackFill, { Size = UDim2.new(p, 0, 1, 0) }, 0.05)
                Tween(Thumb, { Position = UDim2.new(p, -7, 0.5, -7) }, 0.05)
                ValLabel.Text = tostring(value) .. suffix
                callback(value)
            end

            TrackBG.InputBegan:Connect(function(input)
                if input.UserInputType == Enum.UserInputType.MouseButton1
                or input.UserInputType == Enum.UserInputType.Touch then
                    draggingSlider = true
                    updateSlider(input.Position.X)
                end
            end)

            UserInputService.InputChanged:Connect(function(input)
                if not draggingSlider then return end
                if input.UserInputType == Enum.UserInputType.MouseMovement
                or input.UserInputType == Enum.UserInputType.Touch then
                    updateSlider(input.Position.X)
                end
            end)

            UserInputService.InputEnded:Connect(function(input)
                if input.UserInputType == Enum.UserInputType.MouseButton1
                or input.UserInputType == Enum.UserInputType.Touch then
                    draggingSlider = false
                end
            end)

            local slider = {}
            function slider:Set(val)
                value = math.clamp(val, min, max)
                local p = (value - min) / (max - min)
                TrackFill.Size = UDim2.new(p, 0, 1, 0)
                Thumb.Position = UDim2.new(p, -7, 0.5, -7)
                ValLabel.Text  = tostring(value) .. suffix
            end
            function slider:Get() return value end
            return slider
        end

        -- ── DROPDOWN ──────────────────────────
        function section:AddDropdown(config)
            config = config or {}
            local label    = config.Label    or "Dropdown"
            local options  = config.Options  or {}
            local default  = config.Default  or (options[1] or "")
            local callback = config.Callback or function() end
            local selected = default
            local open     = false

            local Wrapper = Create("Frame", {
                Size             = UDim2.new(1, 0, 0, 38),
                BackgroundTransparency = 1,
                BorderSizePixel  = 0,
                LayoutOrder      = 99,
                AutomaticSize    = Enum.AutomaticSize.Y,
                Parent           = TabContent,
            })

            local Row = Create("Frame", {
                Size             = UDim2.new(1, 0, 0, 38),
                BackgroundColor3 = Theme.Surface,
                BorderSizePixel  = 0,
                Parent           = Wrapper,
            }, { Corner(7), Stroke(Theme.Border, 1) })

            Create("TextLabel", {
                Size             = UDim2.new(0.55, 0, 1, 0),
                Position         = UDim2.new(0, 12, 0, 0),
                BackgroundTransparency = 1,
                Text             = label,
                TextColor3       = Theme.TextPrimary,
                TextSize         = 12,
                Font             = Enum.Font.Gotham,
                TextXAlignment   = Enum.TextXAlignment.Left,
                Parent           = Row,
            })

            local SelLabel = Create("TextLabel", {
                Size             = UDim2.new(0.38, 0, 1, 0),
                Position         = UDim2.new(0.55, 0, 0, 0),
                BackgroundTransparency = 1,
                Text             = selected,
                TextColor3       = Theme.TextSecondary,
                TextSize         = 11,
                Font             = Enum.Font.Gotham,
                TextXAlignment   = Enum.TextXAlignment.Right,
                Parent           = Row,
            })

            local Arrow = Create("TextLabel", {
                Size             = UDim2.new(0, 20, 1, 0),
                Position         = UDim2.new(1, -28, 0, 0),
                BackgroundTransparency = 1,
                Text             = "▾",
                TextColor3       = Theme.TextDim,
                TextSize         = 14,
                Font             = Enum.Font.GothamBold,
                Parent           = Row,
            })

            local DropFrame = Create("Frame", {
                Size             = UDim2.new(1, 0, 0, 0),
                Position         = UDim2.new(0, 0, 0, 40),
                BackgroundColor3 = Theme.SurfaceAlt,
                BorderSizePixel  = 0,
                ClipsDescendants = true,
                ZIndex           = 10,
                Parent           = Wrapper,
            }, { Corner(7), Stroke(Theme.Border, 1) })

            local DropList = Create("Frame", {
                Size             = UDim2.new(1, 0, 0, 0),
                AutomaticSize    = Enum.AutomaticSize.Y,
                BackgroundTransparency = 1,
                ZIndex           = 11,
                Parent           = DropFrame,
            })
            Create("UIListLayout", {
                SortOrder = Enum.SortOrder.LayoutOrder,
                Parent    = DropList,
            })
            Padding(4, 6, 4, 6).Parent = DropList

            for _, opt in ipairs(options) do
                local OptBtn = Create("TextButton", {
                    Size             = UDim2.new(1, 0, 0, 28),
                    BackgroundColor3 = Theme.SurfaceAlt,
                    Text             = opt,
                    TextColor3       = opt == selected and Theme.Accent or Theme.TextSecondary,
                    TextSize         = 11,
                    Font             = Enum.Font.Gotham,
                    BorderSizePixel  = 0,
                    ZIndex           = 12,
                    Parent           = DropList,
                }, { Corner(5) })

                OptBtn.MouseButton1Click:Connect(function()
                    selected       = opt
                    SelLabel.Text  = opt
                    -- reset colors
                    for _, c in ipairs(DropList:GetChildren()) do
                        if c:IsA("TextButton") then
                            c.TextColor3 = Theme.TextSecondary
                        end
                    end
                    OptBtn.TextColor3 = Theme.Accent
                    -- close
                    open = false
                    Tween(DropFrame, { Size = UDim2.new(1, 0, 0, 0) }, 0.15)
                    Arrow.Text = "▾"
                    callback(selected)
                end)
            end

            local totalH = #options * 28 + 8

            Row.InputBegan:Connect(function(input)
                if input.UserInputType == Enum.UserInputType.MouseButton1
                or input.UserInputType == Enum.UserInputType.Touch then
                    open = not open
                    Tween(DropFrame, {
                        Size = open
                            and UDim2.new(1, 0, 0, totalH)
                            or  UDim2.new(1, 0, 0, 0)
                    }, 0.18)
                    Arrow.Text = open and "▴" or "▾"
                end
            end)

            local dropdown = {}
            function dropdown:Set(val)
                selected      = val
                SelLabel.Text = val
            end
            function dropdown:Get() return selected end
            return dropdown
        end

        -- ── BUTTON ────────────────────────────
        function section:AddButton(config)
            config = config or {}
            local label    = config.Label    or "Button"
            local callback = config.Callback or function() end

            local Btn = Create("TextButton", {
                Size             = UDim2.new(1, 0, 0, 36),
                BackgroundColor3 = Theme.SurfaceAlt,
                Text             = label,
                TextColor3       = Theme.TextPrimary,
                TextSize         = 12,
                Font             = Enum.Font.GothamSemibold,
                BorderSizePixel  = 0,
                LayoutOrder      = 99,
                Parent           = TabContent,
            }, { Corner(7), Stroke(Theme.Border, 1) })

            Create("UIGradient", {
                Color = ColorSequence.new({
                    ColorSequenceKeypoint.new(0, Color3.fromRGB(35, 35, 45)),
                    ColorSequenceKeypoint.new(1, Color3.fromRGB(28, 28, 36)),
                }),
                Rotation = 90,
                Parent   = Btn,
            })

            Btn.MouseButton1Click:Connect(function()
                Tween(Btn, { BackgroundColor3 = Theme.AccentDim }, 0.08)
                task.wait(0.1)
                Tween(Btn, { BackgroundColor3 = Theme.SurfaceAlt }, 0.12)
                callback()
            end)

            Btn.MouseEnter:Connect(function()
                Tween(Btn, { TextColor3 = Theme.Accent }, 0.1)
            end)
            Btn.MouseLeave:Connect(function()
                Tween(Btn, { TextColor3 = Theme.TextPrimary }, 0.1)
            end)
        end

        -- ── TEXTBOX ───────────────────────────
        function section:AddTextbox(config)
            config = config or {}
            local label       = config.Label       or "Input"
            local placeholder = config.Placeholder or "Type here..."
            local default     = config.Default     or ""
            local callback    = config.Callback    or function() end

            local Row = Create("Frame", {
                Size             = UDim2.new(1, 0, 0, 50),
                BackgroundColor3 = Theme.Surface,
                BorderSizePixel  = 0,
                LayoutOrder      = 99,
                Parent           = TabContent,
            }, { Corner(7), Stroke(Theme.Border, 1) })

            Create("TextLabel", {
                Size             = UDim2.new(1, -24, 0, 18),
                Position         = UDim2.new(0, 12, 0, 4),
                BackgroundTransparency = 1,
                Text             = label,
                TextColor3       = Theme.TextDim,
                TextSize         = 10,
                Font             = Enum.Font.GothamBold,
                TextXAlignment   = Enum.TextXAlignment.Left,
                Parent           = Row,
            })

            local TBox = Create("TextBox", {
                Size             = UDim2.new(1, -24, 0, 22),
                Position         = UDim2.new(0, 12, 0, 22),
                BackgroundTransparency = 1,
                Text             = default,
                PlaceholderText  = placeholder,
                PlaceholderColor3 = Theme.TextDim,
                TextColor3       = Theme.TextPrimary,
                TextSize         = 12,
                Font             = Enum.Font.Gotham,
                TextXAlignment   = Enum.TextXAlignment.Left,
                ClearTextOnFocus = false,
                Parent           = Row,
            })

            TBox.FocusLost:Connect(function(enter)
                if enter then callback(TBox.Text) end
            end)

            local tb = {}
            function tb:Get() return TBox.Text end
            function tb:Set(val) TBox.Text = val end
            return tb
        end

        -- ── LABEL ─────────────────────────────
        function section:AddLabel(text)
            Create("TextLabel", {
                Size             = UDim2.new(1, 0, 0, 24),
                BackgroundTransparency = 1,
                Text             = text,
                TextColor3       = Theme.TextSecondary,
                TextSize         = 11,
                Font             = Enum.Font.Gotham,
                TextXAlignment   = Enum.TextXAlignment.Left,
                TextWrapped      = true,
                LayoutOrder      = 99,
                Parent           = TabContent,
            }, { Padding(2, 0, 2, 6) })
        end

        return section
    end

    return tab
end

-- ─────────────────────────────────────────────
-- NOTIFICATION
-- ─────────────────────────────────────────────
function KH:Notify(config)
    config = config or {}
    local title   = config.Title   or "Notification"
    local message = config.Message or ""
    local duration = config.Duration or 3

    local SGui = self.ScreenGui
    local NotifFrame = Create("Frame", {
        Size             = UDim2.new(0, 260, 0, 60),
        Position         = UDim2.new(1, -270, 1, 10),
        BackgroundColor3 = Theme.Surface,
        BorderSizePixel  = 0,
        ZIndex           = 100,
        Parent           = SGui,
    }, {
        Corner(8),
        Stroke(Theme.Accent, 1.5),
    })

    local Bar = Create("Frame", {
        Size             = UDim2.new(0, 3, 1, -16),
        Position         = UDim2.new(0, 0, 0, 8),
        BackgroundColor3 = Theme.Accent,
        BorderSizePixel  = 0,
        ZIndex           = 101,
        Parent           = NotifFrame,
    }, { Corner(3) })

    Create("TextLabel", {
        Size             = UDim2.new(1, -18, 0, 20),
        Position         = UDim2.new(0, 12, 0, 8),
        BackgroundTransparency = 1,
        Text             = title,
        TextColor3       = Theme.TextPrimary,
        TextSize         = 12,
        Font             = Enum.Font.GothamBold,
        TextXAlignment   = Enum.TextXAlignment.Left,
        ZIndex           = 101,
        Parent           = NotifFrame,
    })

    Create("TextLabel", {
        Size             = UDim2.new(1, -18, 0, 18),
        Position         = UDim2.new(0, 12, 0, 30),
        BackgroundTransparency = 1,
        Text             = message,
        TextColor3       = Theme.TextSecondary,
        TextSize         = 10,
        Font             = Enum.Font.Gotham,
        TextXAlignment   = Enum.TextXAlignment.Left,
        ZIndex           = 101,
        Parent           = NotifFrame,
    })

    -- Slide in
    Tween(NotifFrame, { Position = UDim2.new(1, -270, 1, -70) }, 0.3, Enum.EasingStyle.Back)

    task.delay(duration, function()
        Tween(NotifFrame, { Position = UDim2.new(1, 10, 1, -70) }, 0.25)
        task.wait(0.3)
        NotifFrame:Destroy()
    end)
end

-- ─────────────────────────────────────────────
-- KEYBIND TOGGLE (hide/show window)
-- ─────────────────────────────────────────────
function KH:SetToggleKey(key)
    key = key or Enum.KeyCode.RightShift
    local visible = true
    UserInputService.InputBegan:Connect(function(input, gpe)
        if gpe then return end
        if input.KeyCode == key then
            visible = not visible
            self.Main.Visible = visible
        end
    end)
end

return KH


--[[
═══════════════════════════════════════════════
USAGE EXAMPLE:
═══════════════════════════════════════════════

local KH = loadstring(game:HttpGet("YOUR_RAW_URL"))()

local Window = KH.new({
    Title    = "KH",
    Subtitle = "Combat · Aim assist · Flickbot · Ragebot",
    Width    = 520,
    Height   = 380,
})

Window:SetToggleKey(Enum.KeyCode.RightShift)

-- TAB 1
local AimbotTab = Window:AddTab("Aimbot", "🎯")
local General   = AimbotTab:AddSection("General")

General:AddToggle({
    Label    = "Enabled",
    Default  = false,
    Callback = function(v) print("Aimbot:", v) end,
})

General:AddToggle({
    Label    = "Disable On Reload",
    Default  = true,
})

General:AddSlider({
    Label    = "Reaction Time (s)",
    Min      = 0,
    Max      = 100,
    Default  = 0,
    Callback = function(v) print("RT:", v) end,
})

General:AddSlider({
    Label    = "Smoothing",
    Min      = 1,
    Max      = 10,
    Default  = 1,
})

General:AddDropdown({
    Label    = "Aimbot Type",
    Options  = { "Linear", "Bezier", "Snap" },
    Default  = "Linear",
    Callback = function(v) print("Type:", v) end,
})

General:AddButton({
    Label    = "Reset Settings",
    Callback = function() print("Reset!") end,
})

-- TAB 2
local TriggerTab = Window:AddTab("Triggerbot", "⚡")
local TSection   = TriggerTab:AddSection("Settings")
TSection:AddToggle({ Label = "Enabled", Default = false })
TSection:AddSlider({ Label = "Delay (ms)", Min = 0, Max = 500, Default = 50 })

-- NOTIFICATION
Window:Notify({
    Title   = "KH Loaded",
    Message = "UI Library ready · RightShift to toggle",
    Duration = 4,
})
]]
