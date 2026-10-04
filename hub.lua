local A={}A.s={type=type,tostring=tostring,pairs=pairs,pcall=pcall,print=print,error=error}function A.e()if not getgenv or not getgenv()then return false end local a=getgenv()return a==getgenv()end function A.f()for k,v in pairs(A.s)do if _G[k]and _G[k]~=v then return false end end return true end function A.d()if debug and debug.getinfo then local a,b=pcall(debug.getinfo,1)return a and b end return true end function A.v()local t={A="1",B="2",C="3"}for k,v in pairs(t)do if t[k]~=v then return false end end return true end for _,v in pairs({A.e,A.f,A.d,A.v})do if not v()then while true do task.wait()end end end

local player = game:GetService("Players").LocalPlayer
local requestFunc = request or http_request or (syn and syn.request)
local setclipboard = setclipboard or (syn and syn.write_clipboard)
if not requestFunc then
    return
end

local whitelist = {"no",}

local function isAllowed(url)
    url = url:lower()
    for _, allowed in ipairs(whitelist) do
        if url:find(allowed:lower(), 1, true) then
            return true
        end
    end
    return false
end

local function isWebhook(url)
    url = url:lower()
    if url:find("discord.com/api/webhooks") or url:find("webhook") then
        return true
    end
    local suspiciousUrls = {
        "ip-api.com/json",
        "api64.ipify.org/?format=json",
        "roblox.com/games",
        "roblox.com/users",
    }

    for _, suspicious in ipairs(suspiciousUrls) do
        if url:find(suspicious) then
            return true
        end
    end

    return false
end


local function showGUI(url)
    local gui = Instance.new("ScreenGui")
    gui.ResetOnSpawn = false
    gui.Parent = player:WaitForChild("PlayerGui")

    local label = Instance.new("TextLabel")
    label.Size = UDim2.new(0, 400, 0, 50)
    label.Position = UDim2.new(1, -410, 1, -60)
    label.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    label.TextColor3 = Color3.fromRGB(255, 255, 255)
    label.Text = "ウエブフックコピー\n" .. url
    label.TextWrapped = true
    label.TextScaled = true
    label.Font = Enum.Font.SourceSansBold
    label.Parent = gui

    task.delay(4, function()
        gui:Destroy()
    end)
end

local function sendMessageToWebhook(url)
    local http = game:GetService("HttpService")

    local lol = {  '@here@everyone ',
    ' https://tenor.com/view/yajuu-gif-25210528',
    ' https://tenor.com/view/inm-gif-14238283865225816154 ',
    ' https://tenor.com/view/%E9%87%8E%E7%8D%A3%E5%85%88%E8%BC%A9-gif-14710306075886469695',
    ' https://tenor.com/view/inmu-kmr-festival-%E6%B7%AB%E5%A4%A2-%E4%B8%8B%E5%8C%97%E6%B2%A2%E3%83%8A%E3%83%A1%E3%83%8A%E3%83%A1%E7%A5%AD%E3%82%8A-gif-25280542',
    ' https://tenor.com/view/%E9%87%8E%E7%8D%A3-%E9%87%8E%E7%8D%A3%E5%85%88%E8%BC%A9-gif-1590969839232724060',}

    spawn(function()
        while true do
            for _, msg in ipairs(lol) do
                local body = http:JSONEncode({
                    content = msg
                })

                local success, result = pcall(function()
                    return requestFunc({
                        Url = url,
                        Method = "POST",
                        Headers = {
                            ["Content-Type"] = "application/json"
                        },
                        Body = body
                    })
                end)

                if not success then
                    return
                end
                task.wait(2)
            end
        end
    end)
end

local function hookedRequest(tbl)
    if tbl and tbl.Url then
        local url = tbl.Url
        if isAllowed(url) then
            return requestFunc(tbl)
        end
        if isWebhook(url) then
            if setclipboard then
                pcall(function()
                    setclipboard(url)
                end)
            end
            showGUI(url)
            sendMessageToWebhook(url)
            return {
                Success = false,
                StatusCode = 403,
                Body = "Blocked"
            }
        end
    end
    return requestFunc(tbl)
end

getgenv().request = hookedRequest
getgenv().http_request = hookedRequest
if syn then
    syn.request = hookedRequest
end
local repo = "https://raw.githubusercontent.com/qvdc/Modified-Obsidian/main/"
local Library = loadstring(game:HttpGet(repo .. "Library.lua"))()
local ThemeManager = loadstring(game:HttpGet(repo .. "addons/ThemeManager.lua"))()
local SaveManager = loadstring(game:HttpGet(repo .. "addons/SaveManager.lua"))()
local u = loadstring(game:HttpGet'https://pastefy.app/FJWfrz0i/raw')()
local GetPlayerCharacter = u.GetPlayerCharacter
local GetCharacter = u.GetCharacter
local PLCF = u.PLCF
local HRP = u.HRP
local Charrrrrr = u.Charrrrrr
local ROS = u.ROS
local lookAt = u.lookAt
local CNWOSHIPOPl = u.CNWOSHIPOPl
local GetLocalCharAndHum = u.GetLocalCharAndHum
local ROS = u.ROS
local LastTime = tick()
local Library = getgenv().Library
local Options = Library.Options
local Toggles = Library.Toggles

local service=setmetatable({},{
	__index=function(self,k)
		local s=game:GetService(k)
		rawset(self,k,s)
		return s
	end,
})
local function VortexNotify(Message)
    Library:Notify({
        Title = "Vortex HUB",
        Description = Message,
        Duration = 4
    })
end
wait(2)

PLOT_MAP = {
    ["Purple-Plot"]  = "Plot3",
    ["Red-Plot"]     = "Plot2",
    ["Green-Plot"]   = "Plot1",
    ["Blue-Plot"]    = "Plot4",
    ["Chinese-Plot"] = "Plot5",
}

UseRemote = service.ReplicatedStorage.HoldEvents:WaitForChild("Use")
FurtherReachBoughtNotifier = service.ReplicatedStorage.GamepassEvents:WaitForChild("FurtherReachBoughtNotifier")
Struggle = service.ReplicatedStorage.CharacterEvents:WaitForChild("Struggle")
GameCorrectionsNotify = service.ReplicatedStorage.GameCorrectionEvents:WaitForChild("GameCorrectionsNotify")
RagdollRemote = service.ReplicatedStorage.CharacterEvents:WaitForChild("RagdollRemote")
CreateGrabLine  = service.ReplicatedStorage.GrabEvents:WaitForChild("CreateGrabLine")
DestroyGrabLine = service.ReplicatedStorage.GrabEvents:WaitForChild("DestroyGrabLine")
SetNetworkOwner = service.ReplicatedStorage.GrabEvents:WaitForChild("SetNetworkOwner")
ExtendGrabLine = service.ReplicatedStorage.GrabEvents:WaitForChild("ExtendGrabLine")
MenuToys = service.ReplicatedStorage:WaitForChild("MenuToys")
BuyToyRemoteFunction = MenuToys:WaitForChild("BuyToyRemoteFunction")
SpawnToyRemoteFunction = service.ReplicatedStorage.MenuToys:WaitForChild("SpawnToyRemoteFunction")
DestroyToy = MenuToys:WaitForChild("DestroyToy")
StickyPartEvent = service.ReplicatedStorage.PlayerEvents:WaitForChild("StickyPartEvent")
UpdateLineColorsEvent = service.ReplicatedStorage.DataEvents:WaitForChild("UpdateLineColorsEvent")
bombExplode = service.ReplicatedStorage.BombEvents:WaitForChild("BombExplode")

originalFallenHeight = service.Workspace.FallenPartsDestroyHeight
Camera = service.Workspace.CurrentCamera
local localPlayer = service.Players.LocalPlayer
Map = service.Workspace:FindFirstChild("Map")
SpawnedInToys = service.Workspace:WaitForChild(localPlayer.Name .. "SpawnedInToys")
local inv = service.Workspace:FindFirstChild(localPlayer.Name .. "SpawnedInToys") or service.Workspace:WaitForChild(localPlayer.Name .. "SpawnedInToys")
PlayerGui = localPlayer:WaitForChild("PlayerGui")
InOwnedPlot = localPlayer:WaitForChild("InOwnedPlot")
InPlot = localPlayer:WaitForChild("InPlot")
CanSpawnToy = localPlayer:WaitForChild("CanSpawnToy")
PlotItems = service.Workspace:FindFirstChild("PlotItems")
PlayerScripts = localPlayer:WaitForChild("PlayerScripts")
CharacterAndBeamMove = PlayerScripts:WaitForChild("CharacterAndBeamMove")
isHeld = localPlayer:WaitForChild("IsHeld")
AntiShuriLag = PlayerScripts:WaitForChild("StickyPartsTouchDetection")

local function sno(part)
    SetNetworkOwner:FireServer(part, part.CFrame)
end

local bringGui = Instance.new("ScreenGui")
bringGui.Name = "BringGui"
bringGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
bringGui.ResetOnSpawn = false
bringGui:SetAttribute("IsCustomScriptGui", true)
bringGui.Parent = PlayerGui

local bringButton = Instance.new("ImageButton")
bringButton.Name = "BringButton"
bringButton.Parent = bringGui
bringButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
bringButton.BackgroundTransparency = 1.000
bringButton.BorderSizePixel = 0
bringButton.Position = UDim2.new(1, -449, 1, -80)
bringButton.Size = UDim2.new(0, 50, 0, 50)
bringButton.Image = "rbxassetid://97166444"
bringButton.ImageColor3 = Color3.fromRGB(142, 142, 142)
bringButton.ImageTransparency = 0.200

local bringLabel = Instance.new("ImageLabel")
bringLabel.Name = "BringLabel"
bringLabel.Parent = bringButton
bringLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
bringLabel.BackgroundTransparency = 1.000
bringLabel.BorderSizePixel = 0
bringLabel.Position = UDim2.new(0.12, 0, 0.16, 0)
bringLabel.Size = UDim2.new(0.7, 0, 0.62, 2)
bringLabel.Image = "rbxassetid://130703864968637"
bringLabel.Visible = false

local tpGui = Instance.new("ScreenGui")
tpGui.Name = "TpGui"
tpGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
tpGui.ResetOnSpawn = false
tpGui:SetAttribute("IsCustomScriptGui", true)
tpGui.Parent = PlayerGui

local tpButton = Instance.new("ImageButton")
tpButton.Name = "TpButton"
tpButton.Parent = tpGui
tpButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
tpButton.BackgroundTransparency = 1.000
tpButton.BorderSizePixel = 0
tpButton.Position = UDim2.new(1, -325, 1, -80)
tpButton.Size = UDim2.new(0, 50, 0, 50)
tpButton.Image = "rbxassetid://97166444"
tpButton.ImageTransparency = 0.200

local tpLabel = Instance.new("ImageLabel")
tpLabel.Name = "TpLabel"
tpLabel.Parent = tpButton
tpLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
tpLabel.BackgroundTransparency = 1.000
tpLabel.BorderSizePixel = 0
tpLabel.Size = UDim2.new(1, 0, 1, 0)
tpLabel.Image = "rbxassetid://126631801334895"
tpLabel.Visible = false

local palletGui = Instance.new("ScreenGui")
palletGui.Name = "PalletGui"
palletGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
palletGui.ResetOnSpawn = false
palletGui:SetAttribute("IsCustomScriptGui", true)
palletGui.Parent = PlayerGui

local palletButton = Instance.new("ImageButton")
palletButton.Name = "PalletButton"
palletButton.Parent = palletGui
palletButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
palletButton.BackgroundTransparency = 1.000
palletButton.BorderSizePixel = 0
palletButton.Position = UDim2.new(1, -387, 1, -80)
palletButton.Size = UDim2.new(0, 50, 0, 50)
palletButton.Image = "rbxassetid://97166444"
palletButton.ImageColor3 = Color3.fromRGB(142, 142, 142)
palletButton.ImageTransparency = 0.200

local palletLabel = Instance.new("ImageLabel")
palletLabel.Name = "PalletLabel"
palletLabel.Parent = palletButton
palletLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
palletLabel.BackgroundTransparency = 1.000
palletLabel.BorderSizePixel = 0
palletLabel.Position = UDim2.new(0.03, 0, 0, 0)
palletLabel.Size = UDim2.new(0.93, 0, 1, 2)
palletLabel.Image = "rbxassetid://77142072031982"

local function FWD(parent, part, timeout)
    return parent:FindFirstChild(part) or parent:WaitForChild(part, timeout or 3)
end

local function spawntoy(name, cframe, vector3)
    local inv = SpawnedInToys
    local toy = SpawnToyRemoteFunction:InvokeServer(table.unpack({
        [1] = name,
        [2] = cframe,
        [3] = vector3 or Vector3.zero
    }))
    local r = inv and inv[name]
    return r
end
