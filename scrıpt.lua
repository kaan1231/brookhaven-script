-- [[ DARK SCRIPT ENTERPRISE v6.0 - DYNAMIC KEY + HD ADMIN MENU ]]
local Players = game:GetService("Players")
local TeleportService = game:GetService("TeleportService")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local CoreGui = game:GetService("CoreGui")

local LocalPlayer = Players.LocalPlayer
local banned = {}

-- Eski pencereleri temizle
if CoreGui:FindFirstChild("DarkScript_KeyWindow") then CoreGui:FindFirstChild("DarkScript_KeyWindow"):Destroy() end
if CoreGui:FindFirstChild("HD_GUI") then CoreGui:FindFirstChild("HD_GUI"):Destroy() end

-- =======================================================================
-- 🔑 DYNAMIC CONFIGURATION (LINKVERTISE)
-- =======================================================================
local BASE_LINKVERTISE_URL = "https://direct-link.net/5505104/bzljaUPF6A2g" 
local PLAYER_ID = tostring(LocalPlayer.UserId)

-- Her oyuncunun şifresi kendi ID'sinin başına "Dark_" gelmiş halidir
local GENERATED_KEY = "Dark_" .. PLAYER_ID 
-- Panoya kopyalanacak olan dinamik reklam linki
local DYNAMIC_URL = BASE_LINKVERTISE_URL .. "?query=" .. PLAYER_ID

-- =======================================================================
-- KEY SYSTEM UI (ENGLISH)
-- =======================================================================
local KeySystem = Instance.new("ScreenGui")
KeySystem.Name = "DarkScript_KeyWindow"
KeySystem.Parent = CoreGui

local KeyFrame = Instance.new("Frame")
KeyFrame.Size = UDim2.new(0, 320, 0, 220)
KeyFrame.Position = UDim2.new(0.4, 0, 0.4, 0)
KeyFrame.BackgroundColor3 = Color3.fromRGB(11, 11, 15)
KeyFrame.Active = true
KeyFrame.Draggable = true
KeyFrame.Parent = KeySystem
Instance.new("UICorner", KeyFrame).CornerRadius = UDim.new(0, 10)

local KeyStroke = Instance.new("UIStroke")
KeyStroke.Thickness = 1.5
KeyStroke.Color = Color3.fromRGB(160, 32, 240) -- Neon Purple
KeyStroke.Parent = KeyFrame

local KeyTitle = Instance.new("TextLabel")
KeyTitle.Size = UDim2.new(1, 0, 0, 45)
KeyTitle.Text = "DARK SCRIPT | DYNAMIC KEY SYSTEM"
KeyTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
KeyTitle.BackgroundColor3 = Color3.fromRGB(20, 20, 28)
KeyTitle.Font = Enum.Font.GothamBold
KeyTitle.TextSize = 12
KeyTitle.Parent = KeyFrame
Instance.new("UICorner", KeyTitle).CornerRadius = UDim.new(0, 10)

local KeyInput = Instance.new("TextBox")
KeyInput.Size = UDim2.new(1, -40, 0, 40)
KeyInput.Position = UDim2.new(0, 20, 0, 65)
KeyInput.PlaceholderText = "Enter your personal key here..."
KeyInput.Text = ""
KeyInput.BackgroundColor3 = Color3.fromRGB(25, 25, 35)
KeyInput.TextColor3 = Color3.fromRGB(255, 255, 255)
KeyInput.Font = Enum.Font.Gotham
KeyInput.TextSize = 14
KeyInput.Parent = KeyFrame
Instance.new("UICorner", KeyInput).CornerRadius = UDim.new(0, 6)

local CheckBtn = Instance.new("TextButton")
CheckBtn.Size = UDim2.new(0, 135, 0, 45)
CheckBtn.Position = UDim2.new(0, 20, 0, 130)
CheckBtn.Text = "Check Key"
CheckBtn.BackgroundColor3 = Color3.fromRGB(46, 139, 87)
CheckBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
CheckBtn.Font = Enum.Font.GothamBold
CheckBtn.TextSize = 14
CheckBtn.Parent = KeyFrame
Instance.new("UICorner", CheckBtn).CornerRadius = UDim.new(0, 6)

local GetKeyBtn = Instance.new("TextButton")
GetKeyBtn.Size = UDim2.new(0, 135, 0, 45)
GetKeyBtn.Position = UDim2.new(0, 165, 0, 130)
GetKeyBtn.Text = "Get Key (Copy)"
GetKeyBtn.BackgroundColor3 = Color3.fromRGB(45, 45, 55)
GetKeyBtn.TextColor3 = Color3.fromRGB(200, 200, 200)
GetKeyBtn.Font = Enum.Font.GothamBold
GetKeyBtn.TextSize = 14
GetKeyBtn.Parent = KeyFrame
Instance.new("UICorner", GetKeyBtn).CornerRadius = UDim.new(0, 6)

-- Clipboard Link Copy
GetKeyBtn.MouseButton1Click:Connect(function()
    if setclipboard then
        setclipboard(DYNAMIC_URL)
        GetKeyBtn.Text = "Link Copied!"
        task.wait(2)
        GetKeyBtn.Text = "Get Key (Copy)"
    end
end)

-- =======================================================================
-- 🛠️ MAIN HD ADMIN MENU FUNCTION (LOADS AFTER KEY VERIFICATION)
-- =======================================================================
local function StartHDAdminMenu()
    local ScreenGui = Instance.new("ScreenGui")
    ScreenGui.Name = "HD_GUI"
    ScreenGui.Parent = CoreGui -- Anti-destroy bypass protection
    ScreenGui.ResetOnSpawn = false

    -- MAIN CIRCLE BUTTON
    local Button = Instance.new("TextButton")
    Button.Parent = ScreenGui
    Button.Size = UDim2.new(0,60,0,60)
    Button.Position = UDim2.new(0.03,0,0.45,0)
    Button.BackgroundColor3 = Color3.fromRGB(20, 20, 28)
    Button.Text = "HD"
    Button.TextColor3 = Color3.fromRGB(160, 32, 240) -- Purple Glow Text
    Button.Font = Enum.Font.GothamBold
    Button.TextScaled = true
    Button.Active = true
    Button.Draggable = true

    local BC = Instance.new("UICorner",Button)
    BC.CornerRadius = UDim.new(1,0)
    
    local BStroke = Instance.new("UIStroke", Button)
    BStroke.Thickness = 1.5
    BStroke.Color = Color3.fromRGB(160, 32, 240)

    -- MENU FRAME
    local Menu = Instance.new("Frame")
    Menu.Parent = ScreenGui
    Menu.Size = UDim2.new(0,280,0,350)
    Menu.Position = UDim2.new(0.1,0,0.3,0)
    Menu.BackgroundColor3 = Color3.fromRGB(11, 11, 15)
    Menu.Visible = false

    local MC = Instance.new("UICorner",Menu)
    
    local MStroke = Instance.new("UIStroke", Menu)
    MStroke.Thickness = 1.5
    MStroke.Color = Color3.fromRGB(160, 32, 240)

    -- TITLE
    local Title = Instance.new("TextLabel")
    Title.Parent = Menu
    Title.Size = UDim2.new(1,0,0,40)
    Title.BackgroundColor3 = Color3.fromRGB(20, 20, 28)
    Title.Text = "DARK ENTERPRISE | HD ADMIN"
    Title.TextColor3 = Color3.new(1,1,1)
    Title.Font = Enum.Font.GothamBold
    Title.TextSize = 13
    Instance.new("UICorner", Title).CornerRadius = UDim.new(0, 8)

    -- COMMAND TEXTBOX
    local Box = Instance.new("TextBox")
    Box.Parent = Menu
    Box.Size = UDim2.new(0.9,0,0,40)
    Box.Position = UDim2.new(0.05,0,0.18,0)
    Box.PlaceholderText = "e.g. /speed 100"
    Box.Text = ""
    Box.BackgroundColor3 = Color3.fromRGB(25, 25, 35)
    Box.TextColor3 = Color3.fromRGB(255, 255, 255)
    Box.Font = Enum.Font.Gotham
    Box.TextSize = 14
    Instance.new("UICorner", Box).CornerRadius = UDim.new(0, 6)

    -- EXECUTE BUTTON
    local Execute = Instance.new("TextButton")
    Execute.Parent = Menu
    Execute.Size = UDim2.new(0.9,0,0,40)
    Execute.Position = UDim2.new(0.05,0,0.35,0)
    Execute.Text = "RUN COMMAND"
    Execute.Font = Enum.Font.GothamBold
    Execute.TextSize = 14
    Execute.BackgroundColor3 = Color3.fromRGB(46, 139, 87)
    Execute.TextColor3 = Color3.fromRGB(255, 255, 255)
    Instance.new("UICorner", Execute).CornerRadius = UDim.new(0, 6)

    -- OUTPUT WINDOW
    local Output = Instance.new("TextLabel")
    Output.Parent = Menu
    Output.Size = UDim2.new(0.9,0,0,160)
    Output.Position = UDim2.new(0.05,0,0.5,0)
    Output.BackgroundTransparency = 1
    Output.TextColor3 = Color3.fromRGB(180, 180, 190)
    Output.TextWrapped = true
    Output.TextYAlignment = Enum.TextYAlignment.Top
    Output.Font = Enum.Font.GothamSemibold
    Output.TextSize = 12
    Output.TextXAlignment = Enum.TextXAlignment.Left
    Output.Text = "Available Commands:\n/speed [num]\n/jump [num]\n/reset\n/rejoin\n/sit\n/kick [name]\n/ban [name]"

    -- TOGGLE MENU VISIBILITY
    Button.MouseButton1Click:Connect(function()
        Menu.Visible = not Menu.Visible
    end)

    -- CHARACTER HELPER
    local function getCharacter()
        return LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
    end

    -- PLAYER SEARCH HELPER
    local function getPlayer(name)
        for _,plr in pairs(Players:GetPlayers()) do
            if string.lower(plr.Name):sub(1,#name) == string.lower(name) then
                return plr
            end
        end
    end

    -- EXECUTE COMMAND LOGIC
    Execute.MouseButton1Click:Connect(function
