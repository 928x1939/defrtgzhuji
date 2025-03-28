-- Services
local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local CoreGui = game:GetService("CoreGui")
local Camera = game.Workspace.CurrentCamera
local Player = Players.LocalPlayer
local RunService = game:GetService("RunService")

-- GUI erstellen
local ScreenGui = Instance.new("ScreenGui", CoreGui)
local MainFrame = Instance.new("Frame", ScreenGui)
MainFrame.Size = UDim2.new(0, 400, 0, 500)
MainFrame.Position = UDim2.new(0.5, -200, 0.5, -250)
MainFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
MainFrame.BorderSizePixel = 0
MainFrame.ClipsDescendants = true
MainFrame.BackgroundTransparency = 0.3

-- UICorner für runde Ecken
local UICorner = Instance.new("UICorner", MainFrame)
UICorner.CornerRadius = UDim.new(0, 15)

-- Titel
local Title = Instance.new("TextLabel", MainFrame)
Title.Size = UDim2.new(1, 0, 0, 50)
Title.Text = "Library UI"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.Font = Enum.Font.SourceSansBold
Title.TextSize = 24
Title.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
Title.TextAlignment = Enum.TextAlignment.Center
Title.BackgroundTransparency = 0.5

-- Tabs erstellen
local TabsFrame = Instance.new("Frame", MainFrame)
TabsFrame.Size = UDim2.new(1, 0, 0, 50)
TabsFrame.Position = UDim2.new(0, 0, 0, 50)
TabsFrame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)

local TabsLayout = Instance.new("UIListLayout", TabsFrame)
TabsLayout.FillDirection = Enum.FillDirection.Horizontal
TabsLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center

-- Tab-Inhalte
local ContentFrame = Instance.new("Frame", MainFrame)
ContentFrame.Size = UDim2.new(1, 0, 1, -100)
ContentFrame.Position = UDim2.new(0, 0, 0, 100)
ContentFrame.BackgroundTransparency = 1

-- Zustände für Features
local spinbotEnabled = false
local aimbotEnabled = false
local espEnabled = false

-- Funktion zum Erstellen der Tabs
local function createTabButton(name, callback)
    local tabButton = Instance.new("TextButton", TabsFrame)
    tabButton.Size = UDim2.new(0, 100, 0, 50)
    tabButton.Text = name
    tabButton.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
    tabButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    tabButton.Font = Enum.Font.SourceSansBold
    tabButton.TextSize = 18
    tabButton.AutoButtonColor = true

    local UICornerButton = Instance.new("UICorner", tabButton)
    UICornerButton.CornerRadius = UDim.new(0, 10)

    tabButton.MouseButton1Click:Connect(callback)
end

-- Funktion zum Wechseln des Tabs
local function switchTab(tabName)
    -- Alle Tabs ausblenden
    for _, child in ipairs(ContentFrame:GetChildren()) do
        child.Visible = false
    end

    -- Tab anzeigen
    if tabName == "Rage" then
        createRageTab()
    elseif tabName == "Legit" then
        createLegitTab()
    elseif tabName == "Visuals" then
        createVisualsTab()
    end
end

-- Rage Tab
local function createRageTab()
    -- Rage Tab UI
    local rageTabFrame = Instance.new("Frame", ContentFrame)
    rageTabFrame.Size = UDim2.new(1, 0, 1, 0)
    rageTabFrame.BackgroundTransparency = 1
    rageTabFrame.Visible = true

    -- Checkbox für Spinbot
    createCheckbox(rageTabFrame, "Spinbot", function()
        spinbotEnabled = not spinbotEnabled
        print("Spinbot: " .. (spinbotEnabled and "ON" or "OFF"))
    end)
end

-- Legit Tab
local function createLegitTab()
    -- Legit Tab UI
    local legitTabFrame = Instance.new("Frame", ContentFrame)
    legitTabFrame.Size = UDim2.new(1, 0, 1, 0)
    legitTabFrame.BackgroundTransparency = 1
    legitTabFrame.Visible = true

    -- Checkbox für Aimbot
    createCheckbox(legitTabFrame, "Aimbot", function()
        aimbotEnabled = not aimbotEnabled
        print("Aimbot: " .. (aimbotEnabled and "ON" or "OFF"))
    end)
end

-- Visuals Tab
local function createVisualsTab()
    -- Visuals Tab UI
    local visualsTabFrame = Instance.new("Frame", ContentFrame)
    visualsTabFrame.Size = UDim2.new(1, 0, 1, 0)
    visualsTabFrame.BackgroundTransparency = 1
    visualsTabFrame.Visible = true

    -- Checkbox für ESP
    createCheckbox(visualsTabFrame, "ESP", function()
        espEnabled = not espEnabled
        print("ESP: " .. (espEnabled and "ON" or "OFF"))
    end)
end

-- Checkbox erstellen
local function createCheckbox(parent, name, callback)
    local checkbox = Instance.new("TextButton", parent)
    checkbox.Size = UDim2.new(0, 300, 0, 40)
    checkbox.Text = name
    checkbox.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
    checkbox.TextColor3 = Color3.fromRGB(255, 255, 255)
    checkbox.Font = Enum.Font.SourceSansBold
    checkbox.TextSize = 18
    checkbox.AutoButtonColor = true

    local UICornerButton = Instance.new("UICorner", checkbox)
    UICornerButton.CornerRadius = UDim.new(0, 10)

    checkbox.MouseButton1Click:Connect(callback)
end

-- Tab Buttons erstellen
createTabButton("Rage", function() switchTab("Rage") end)
createTabButton("Legit", function() switchTab("Legit") end)
createTabButton("Visuals", function() switchTab("Visuals") end)

-- Zeige den ersten Tab an (Standardmäßig)
switchTab("Rage")

-- Funktion zum Aktivieren des Spinbots
local function spinbot()
    if spinbotEnabled then
        -- Hier den Spinbot-Code einfügen
        print("Spinbot is active.")
    end
end

-- Funktion für Aimbot
local function aimbot()
    if aimbotEnabled then
        -- Hier den Aimbot-Code einfügen
        print("Aimbot is active.")
    end
end

-- Funktion für ESP
local function esp()
    if espEnabled then
        -- Hier den ESP-Code einfügen
        print("ESP is active.")
    end
end

-- Hauptloop
RunService.RenderStepped:Connect(function()
    spinbot()
    aimbot()
    esp()
end)
