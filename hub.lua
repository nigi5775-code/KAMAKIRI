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

local Config = {
    walkSpeed = 5,
    jumpPower = 24,
    spiderT = false,
    climbSpeed = 20,
	spiderCon = nil,
    fov = 70,
    deffov = 70,
    jumpConnection = nil,
    walkSpeedToggle = false,
    infiniteJumpToggle = false,
    fovToggle = false,
	spincconnn = nil,
	spinsp = 5,
    noclip = false,
    NoclipConnection = nil,
	kunaiMonitorConn = nil,

	AntigrabCon = nil,
	AntiGrabRag = false,
	AntigrabRGProc = false,
	AntigrabragWalk = false,
	AntigrabTPT = false,
    gucciRunId = 0,
    runId = 0,
    active = false,
    ragdollLoopActive = false,
    ragdollTask = nil,
    permRagActive = false,
    permRagTask = nil,
    setupDone = false,
    seatOccupied = false,
    monitoring = false,
    blobRef = nil,
    remoteRef = nil,
    tractorGucciT = false,
    tractorGucci2 = nil,
    tractorGucci3 = false,
    tractorGucci4 = nil,
    tractorGucci5 = {},
	autoatakka = false,
	AutoAttackerToggle = nil,
	SelectAutoatakka = "Death",
    autoBlobSitT = false,
    antiBlobKillActive = false,
    autoBlobSitTask = nil,
    antiBlobmanKillTask = nil,
    Blobkilltest = false,
	AntiblobauraCon = nil,
    BlobkilltestCon = nil,
    AntikillHouseT = false,
    AntiKillHouseCon = nil,
    antiKillHousePos = Vector3.new(-544.836304, -7.35040474, 77.8825378),
    IsBypassRun = false,
    lastOriginalCFrame = nil,
    cameraTargetPart = nil,
    antibananaSit = false,
    AntiragdollToggle = false,
	connections = {},
	charAddedConn = nil,
	AntiRagBlob = false,
	BlobRagdollSit = false,
    Antbananadest = false,
    Bananans = {},
    AntiBananaCon = {},
	paintPartsBackup = {},
	paintConnections = {},
    playerTag = nil,
    targetToy = "InstrumentGuitarBanjo",
    loopActive = false,
    runLoop = nil,
    respawnHandler = nil,
    spawnToyRemote = nil,
    destroyToyRemote = nil,
    CountLines = 0,
    LastLagS = nil,
    AutoAntiLag = false,
    AntiBurnndada = nil,
    AntiExplosionActive = false,
    AntiExplosionConnection = nil,
	antiStickyToggle = false,
    AutoTurnOnAntiKick = false,
    Contuuti = {},
	kickitemToggle = false,
	kickitemPCLD = nil,
	kickitemPCLDcon = nil,
	AntiKickToggle = false,
	AntikickT = false,
    AntikickResetToggle = false,
	AntikickLeaveToggle = false,
    PlayerListAnti = {},
    TargetAntigrabtpT = false,
    tpmode = "Grab",
    tpDrop = nil,

    PCLDBOX = {},
    PCLDToggle = false,
    blackHoleESP = false,
    BlackholeSelectionB = {},
    BlackholeBeam = {},
	BlackHoleConnection = nil,
    PCLDLine = Color3.fromRGB(0, 255, 255),
    PCLDSurface = Color3.fromRGB(0, 100, 255),
    PCLDFill = Color3.fromRGB(0, 0, 255),

    byte_thres = 5 * 1024,
    PacketCooldown = 30,
    lastPacketNotify = 0,
    PacketCon = {},
    JoinNotify = false,
    LeaveNotify = false,
    KickNotify = false,
    RecentKicked = {},
    KickConnection = nil,
	ClickTPKey = Enum.KeyCode.Z,
	BringKey = Enum.KeyCode.G,
    ClickTPfutuu = false,
    TPMode = "ClickTP",
    TPZcon = nil,
    TPZconall = nil,
    TPZholdCn = nil,
    holdtoggletp = false,
    TPZContro = nil,
    MobileTPDownCon = nil,
	MobileTPUpCon = nil,
	MobileTPLeaveCon = nil,
	MobileTPClickCon = nil,

	palletConn = nil,
    auraRadius = 600,
    SitAuraToggle = false,
    SitauraConnection = nil,
	auraThread = nil,
    spinSpeed = 150,
    spinAuraToggle = false,
    spinConnection = nil,
	TeleportAuraT = false,
	teleportBodie = {},
	teleportGyro = {},
	teleportCoro = nil,
    RagdollAuraToggle = false,
	BringAura = false,
    deathAuraToggle = false,
    deathConnection = nil,
    WhitelistFriends = false,
    spamkickaura = false,
    spamkickauralag = false,
    DoRagdoll = true,
    UsePallete = true,
    WhitelistFriends = false,
    LineLagEnabled = true,

	PStickyToggle = false,
	speedTractor = false,
	nitroActive = false,
	FireAllT = false,
    FireallWhitelist = true,
	RagdollAllT = false,
    RagdollallWhitelist = true,
    NiggerAllT = false,
    NiggerWhiteList = true,
	Killall = false,
	Kiclall = false,
    BringAllToggle = false,
    gewgsgvwe = true,
    floatConnection = nil,
    cameraAnchor = nil,
    originalCameraSubject = nil,
    freezePart = nil,
    WhitelistFriends2 = true,

    oopkillblob = false,
	PlayerList = {},
    aa6 = false,
    aa7 = nil,
    aa9 = 25,
    aa13 = false,
    aa15 = nil,
    aa17 = false,
    aa73 = nil,
    running = false,
    LastHouse = nil,
    LastPlotOwner = nil,
    HeightLimit = 10000,
    SpamkickblT = false,
    A1B2 = nil,
    C3D4 = nil,
    E5F6 = nil,
    G7H8 = nil,
    I9J0 = nil,
    BringMode = "GRAB",
	Loopkillblob = false,
	TarAntiAntikickWD = false,
    TarAntikickRoot = nil,
	FireLoop = false,
	BananaLoop = false,
    niggerLoop = false,
    PenKillT = false,
    PenKillTask = nil,
    LoopKillToggle = false,
    LoopKillTask = nil,

    blobAllT = false,
    Bloballmode = "Kill",
    bloballrun = false,
    bloballWhite = false,
    bloballWhitePlr = {},
	WhitelistFriendsBLOB = false,
    BlobauraM = "Kill",
    BlobauraT = false,
    BlobauraR = false,
	WalkspeedCont = 16,
	JumpPownerCont = 50,

    BLkickallWhite = false,
    BLKickallHeight = 14,
    BLSpreadRadius = 25,

    LineLagCoro = nil,
    LineLagToggle = false,
    WhitelistKickall = false,
    KickallHeight = 14,
    kickallRadius = 16,
    lineLagkickall = nil,
    lineLagConkickall = false,
    SelectedPlot = {"Purple-Plot"},
    plotBreakToggle = false,
    BleakPlotShuriken = {},
    savedPosition = nil,
    isTeleported = false,
	HouseTPauto = false,
    GameName = game.Name,
	Frames = 0,
	serverHopRejoin = 0
}

local Window = Library:CreateWindow({
    Title = "Vortex Hub",
    Footer = "Project Vortex HUB | FTAP",
    Icon = 13639308918,
    NotifySide = "Right",
    ShowCustomCursor = true,
    EnableCompacting = true,
    SidebarCompacted = true,
    SearchbarSize = UDim2.fromScale(0.45, 1),
    CornerRadius = 30
})

ThemeManager:SetLibrary(Library)
ThemeManager:SetDefaultTheme({
	BackgroundColor = Color3.fromRGB(0, 0, 0),
    AccentColor = Color3.fromRGB(126, 126, 126),
    OutlineColor = Color3.fromRGB(30, 30, 30),
    FontColor = Color3.fromRGB(174, 174, 174),
    FontFace = "BuilderSans",
})

local Tabs = {
    infoTab = Window:AddTab("情報", "info"),
    PlayerTab = Window:AddTab("自分", "person-standing"),
    AntiTab = Window:AddTab("防御", "shield"),
    Target = Window:AddTab("対象", "target"),
    BlobmanTab = Window:AddTab("ブロブマン", "skull"),
    ESPTab = Window:AddTab("ESP", "eye"),
    NotifyTab = Window:AddTab("通知", "bell"),
	Keybinds = Window:AddTab("キー設定", "keyboard"),
    AuraTab = Window:AddTab("オーラ", "sparkles"),
    MiscTab = Window:AddTab("その他", "package"),
    ServerTab = Window:AddTab("サーバー", "server"),
    CreditsTab = Window:AddTab("製作者", "users"),
    UISettings = Window:AddTab("UI設定", "settings")
}

local Avatar = Tabs.infoTab:AddLeftGroupbox("アバター")
local InfoLocal = Tabs.infoTab:AddRightGroupbox("自分 / ゲーム情報")
local Ser = Tabs.infoTab:AddRightGroupbox("再参加 / 参加")
local LeftGroupBoxC = Tabs.PlayerTab:AddLeftGroupbox("カメラ")
local MainLocal = Tabs.PlayerTab:AddLeftGroupbox("メイン")
local ExtraLocal = Tabs.PlayerTab:AddRightGroupbox("追加")
local Korblox = Tabs.PlayerTab:AddLeftGroupbox("偽Korblox")
local LeftGroupBox = Tabs.AntiTab:AddLeftGroupbox("メイン防御")
local RightGroupBox = Tabs.AntiTab:AddRightGroupbox("追加防御")
local dadadadad = Tabs.AntiTab:AddLeftGroupbox("対象防御")
local antikick = Tabs.AntiTab:AddRightGroupbox("アンチキック")
local Targ = Tabs.Target:AddLeftGroupbox("対象選択")
local spamde = Tabs.Target:AddLeftGroupbox("所有権")
local Loop = Tabs.Target:AddLeftGroupbox("掴み")
local Loop2 = Tabs.Target:AddLeftGroupbox("ループ")
local Bring = Tabs.Target:AddRightGroupbox("引き寄せ")
local blobkill = Tabs.Target:AddLeftGroupbox("ブロブマン")
local DestroyGucci = Tabs.Target:AddRightGroupbox("グッチ破壊")
local RemoveKickanti = Tabs.Target:AddLeftGroupbox("アンチキック解除")
local Rei = Tabs.Target:AddRightGroupbox("吹き飛ばし")
local aurabklaaaaao = Tabs.BlobmanTab:AddLeftGroupbox("ブロブマン全員")
local aurabklo = Tabs.BlobmanTab:AddLeftGroupbox("ブロブマンオーラ")
local SettingsDou = Tabs.BlobmanTab:AddRightGroupbox("設定")
local Antikickesp = Tabs.ESPTab:AddLeftGroupbox("アンチキックESP")
local PCES = Tabs.ESPTab:AddRightGroupbox("プレイヤー位置検出")
local BL = Tabs.ESPTab:AddRightGroupbox("ブラックホール")
local PlayersNotify = Tabs.NotifyTab:AddLeftGroupbox("プレイヤー")
local PackBl = Tabs.NotifyTab:AddRightGroupbox("その他")
local Playa = Tabs.Keybinds:AddLeftGroupbox("キー設定")
local MainAura = Tabs.AuraTab:AddLeftGroupbox("オーラ")
local kickaura = Tabs.AuraTab:AddRightGroupbox("キックオーラ")
local Stiyyyyyyyyyyyyyyyyy = Tabs.MiscTab:AddRightGroupbox("パレット張り付き")
local miscOtherSec = Tabs.MiscTab:AddLeftGroupbox("トラクター")
local BBB = Tabs.MiscTab:AddRightGroupbox("バリア破壊")
local Freeeeeeeeee = Tabs.MiscTab:AddLeftGroupbox("火 全員")
local BananaAll = Tabs.MiscTab:AddRightGroupbox("バナナ 全員")
local Nigger = Tabs.MiscTab:AddLeftGroupbox("オーブン 全員")
local BR = Tabs.MiscTab:AddRightGroupbox("引き寄せ 全員")
local Lag = Tabs.ServerTab:AddLeftGroupbox("ラインラグ")
local Groundkick = Tabs.ServerTab:AddLeftGroupbox("地面キック")
local KickallNoblob = Tabs.ServerTab:AddRightGroupbox("ブロブキック全員")
local Breakiroiro = Tabs.ServerTab:AddLeftGroupbox("プロット破壊")
local OOOOO = Tabs.ServerTab:AddLeftGroupbox("プロット取得")
local Dev = Tabs.CreditsTab:AddLeftGroupbox("開発者", "https://cdn.phototourl.com/free/2026-09-10-5c4f8876-4b73-4199-bee4-989287ed6aad.png")
local Dev2 = Tabs.CreditsTab:AddLeftGroupbox("開発者2")
local disc = Tabs.CreditsTab:AddRightGroupbox("Discord", "https://cdn.phototourl.com/free/2026-09-10-6aece83a-8053-4537-8650-e70b237a854e.png")
local MenuGroup = Tabs.UISettings:AddLeftGroupbox("メニュー")

Avatar:AddViewport("MyViewport", {
    Object = localPlayer.Character,
    Height = 300,
    Interactive = true,
    AutoFocus = true,
})
local StatsLabel = InfoLocal:AddLabel("FPS: 0 | Ping: 0ms")
local UserLabel = InfoLocal:AddLabel({
    Text = string.format("%s (ID: %s)", localPlayer.DisplayName, localPlayer.Name),
    Icon = "user",
})

local GameInfoLabel = InfoLocal:AddLabel({
    Text = string.format("%s (ID: %s)", Config.GameName, game.PlaceId),
    Icon = "gamepad-2",
})

Ser:AddButton({
    Text = "再参加",
    Func = function()
        if Config.serverHopRejoin == 0 then
            Config.serverHopRejoin = 1
            VortexNotify("ゲームに再参加しますか?")
        elseif Config.serverHopRejoin == 1 then
            Config.serverHopRejoin = 2
            VortexNotify("本当に再参加する場合は、もう一度ボタンを押してください。")
        elseif Config.serverHopRejoin == 2 then
            Config.serverHopRejoin = 0
            pcall(function()
                service.TeleportService:Teleport(game.PlaceId, service.Players.LocalPlayer)
            end)
        end
    end
})

Ser:AddButton({
    Text = "サーバーホップ",
    Func = function()
        if Config.serverHopRejoin == 0 then
            Config.serverHopRejoin = 1
            VortexNotify("別のサーバーにホップしますか?")
        elseif Config.serverHopRejoin == 1 then
            Config.serverHopRejoin = 2
            VortexNotify("本当にサーバーホップする場合は、もう一度ボタンを押してください。")
        elseif Config.serverHopRejoin == 2 then
            Config.serverHopRejoin = 0
            pcall(function()
                local placeId = game.PlaceId
                local currentJobId = game.JobId
                local servers = service.HttpService:JSONDecode(
                    game:HttpGet("https://games.roblox.com/v1/places/" .. placeId .. "/servers/0?sortOrder=Asc&limit=100")
                )
                local targetServer = nil
                if servers and servers.data then
                    for _, server in ipairs(servers.data) do
                        if server.id ~= currentJobId and server.playing < server.maxPlayers then
                            targetServer = server.id
                            break
                        end
                    end
                end
                if targetServer then
                    service.TeleportService:TeleportToPlaceInstance(placeId, targetServer, service.Players.LocalPlayer)
                else
                    VortexNotify("別のサーバーが見つかりません。標準のテレポートを再試行します...")
                    service.TeleportService:Teleport(placeId, service.Players.LocalPlayer)
                end
            end)
        end
    end
})

-- ===== 分割3: Player タブ =====
LeftGroupBoxC:AddToggle("3rd", {
    Text = "三人称",
    Default = false,
    Callback = function(Value)
        if Value then
            localPlayer.CameraMode = Enum.CameraMode.Classic
            Camera.CameraType = Enum.CameraType.Custom
            Camera.CameraSubject = localPlayer.Character:WaitForChild("Humanoid")
            localPlayer.CameraMaxZoomDistance = 16456456546
            localPlayer.CameraMinZoomDistance = 0.5
        else
            localPlayer.CameraMode = Enum.CameraMode.LockFirstPerson
            Camera.CameraType = Enum.CameraType.Custom
            Camera.CameraSubject = localPlayer.Character:WaitForChild("Humanoid")
            localPlayer.CameraMaxZoomDistance = 0
            localPlayer.CameraMinZoomDistance = 0
        end
    end
})

LeftGroupBoxC:AddToggle("fovT", {
    Text = "FOV",
    Default = false,
    Callback = function(Value)
        Config.fovToggle = Value
        if Config.fovToggle then
            Camera.FieldOfView = Config.fov
        else
            Camera.FieldOfView = Config.deffov
        end
    end
})

LeftGroupBoxC:AddSlider("Fovdo", {
    Text = "FOV °",
    Min = 10,
    Max = 120,
    Default = Config.fov,
    Rounding = 1,
    Callback = function(Value)
        Config.fov = Value
        if Config.fovToggle then
            Camera.FieldOfView = Config.fov
        end
    end
})

MainLocal:AddToggle("Walkspeed", {
    Text = "移動速度",
    Default = false,
    Callback = function(Value)
        Config.walkSpeedToggle = Value
        task.spawn(function()
            while Config.walkSpeedToggle do
                local char = localPlayer.Character
                if char and char:FindFirstChild("Humanoid") and char:FindFirstChild("HumanoidRootPart") then
                    local hrp = char.HumanoidRootPart
                    local moveDir = char.Humanoid.MoveDirection
                    hrp.CFrame = hrp.CFrame + moveDir * (Config.walkSpeed / 10)
                end
                task.wait()
            end
            local char = localPlayer.Character
            if char and char:FindFirstChild("Humanoid") then
                char.Humanoid.WalkSpeed = 16
            end
        end)
    end
})

MainLocal:AddSlider("walkspeeds", {
    Text = "速度",
    Default = Config.walkSpeed,
    Min = 0,
    Max = 300,
    Rounding = 1,
    Callback = function(Value)
        Config.walkSpeed = Value
        local char = localPlayer.Character
        if char and char:FindFirstChild("Humanoid") then
            char.Humanoid.WalkSpeed = Value
        end
    end
})

MainLocal:AddToggle("infjump", {
    Text = "無限ジャンプ",
    Default = false,
    Callback = function(Value)
        Config.infiniteJumpToggle = Value
        if Config.infiniteJumpToggle then
            if Config.jumpConnection then Config.jumpConnection:Disconnect() end
            Config.jumpConnection = service.UserInputService.JumpRequest:Connect(function()
                local char = localPlayer.Character
                local humanoid = char and char:FindFirstChildOfClass("Humanoid")
                if humanoid then
                    humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
                end
            end)
        else
            if Config.jumpConnection then
                Config.jumpConnection:Disconnect()
                Config.jumpConnection = nil
            end
        end
    end
})

MainLocal:AddSlider("Jumppower", {
    Text = "ジャンプ力",
    Min = 24,
    Max = 300,
    Default = Config.jumpPower,
    Rounding = 1,
    Callback = function(Value)
        Config.jumpPower = Value
        local char = localPlayer.Character
        if char and char:FindFirstChild("Humanoid") then
            local hum = char.Humanoid
            hum.UseJumpPower = true
            hum.JumpPower = Value
        end
    end
})

ExtraLocal:AddToggle("Spider", {
    Text = "壁登り",
    Default = false,
    Callback = function(Value)
        Config.spiderT = Value
        if Config.spiderCon then
            Config.spiderCon:Disconnect()
            Config.spiderCon = nil
        end
        if Value then
            Config.spiderCon = service.RunService.Heartbeat:Connect(function()
                local char = GetCharacter()
                local hrpPart = HRP()
                local hum = getLocalHum()
                if not char or not hrpPart or not hum then return end
                local raycastParams = RaycastParams.new()
                raycastParams.FilterDescendantsInstances = {char}
                raycastParams.FilterType = Enum.RaycastFilterType.Exclude
                local rayDirection = hrpPart.CFrame.LookVector * 1.5
                local raycastResult = service.Workspace:Raycast(hrpPart.Position, rayDirection, raycastParams)
                if raycastResult and hum.MoveDirection.Magnitude > 0 then
                    hrpPart.AssemblyLinearVelocity = Vector3.new(hrpPart.AssemblyLinearVelocity.X, Config.climbSpeed, hrpPart.AssemblyLinearVelocity.Z)
                end
            end)
        end
    end    
})

ExtraLocal:AddSlider("ClimbSpeed", {
    Text = "壁登り速度",
    Min = 20,
    Max = 50,
    Default = 20,
    Rounding = 1,
    Callback = function(Value)
        Config.climbSpeed = Value
    end    
})

ExtraLocal:AddToggle("Nocli", {
    Text = "壁抜け",
    Default = false,
    Callback = function(Value)
        Config.noclip = Value
        if Config.NoclipConnection then
            Config.NoclipConnection:Disconnect()
            Config.NoclipConnection = nil
        end
        if Config.noclip then
            Config.NoclipConnection = service.RunService.Stepped:Connect(function()
                local character = GetCharacter()
                if character then
                    for _, part in ipairs(character:GetDescendants()) do
                        if part:IsA("BasePart") then
                            part.CanCollide = false
                        end
                    end
                end
            end)
        end
    end    
})

ExtraLocal:AddToggle("SpinC", {
	Text = "回転",
	Default = false,
	Callback = function(Value)
		if Value then
			Config.spincconnn = service.RunService.Heartbeat:Connect(function()
				local character = localPlayer.Character
				local root = character and character:FindFirstChild("HumanoidRootPart")
				if root then
					root.CFrame = root.CFrame * CFrame.Angles(0, math.rad(Config.spinsp), 0)
				end
			end)
		else
			if Config.spincconnn then
				Config.spincconnn:Disconnect()
				Config.spincconnn = nil
			end
		end
	end
})

ExtraLocal:AddSlider("SpinS", {
	Text = "回転速度",
	Default = 5,
	Min = 1,
	Max = 50,
	Rounding = 1,
	Callback = function(Value)
		Config.spinsp = Value
	end
})

ExtraLocal:AddSlider("FPScap", {
    Text = "FPS上限",
    Min = 5,
    Max = 10000,
    Default = 300,
    Rounding = 1,
    Callback = function(fpsCap1)
        setfpscap(fpsCap1)
    end
})

Korblox:AddButton({
	Text = "偽Korblox",
	Callback = function()
        task.spawn(function()
            local char = GetCharacter()
            local rightLeg = char:FindFirstChild("Right Leg")
            local torso = char:WaitForChild("Torso")
            local hrp = char:WaitForChild("HumanoidRootPart")
            if rightLeg and torso and hrp then
                local originalFallHeight = service.Workspace.FallenPartsDestroyHeight
                local originalCFrame = torso.CFrame
                service.Workspace.FallenPartsDestroyHeight = -100
                RagdollRemote:FireServer(hrp, 2)
                task.wait(0.5)
                rightLeg.CFrame = CFrame.new(0, -10000, 0)
                task.wait(0.3)
                torso.CFrame = CFrame.new(0, -9970, 0)
                task.wait(0.5)
                torso.CFrame = originalCFrame
                task.wait(0.5)
                service.Workspace.FallenPartsDestroyHeight = originalFallHeight
            end
        	task.wait(0.2)
	        local hrp2 = localPlayer.Character and localPlayer.Character:FindFirstChild("HumanoidRootPart")
    	    if not hrp2 then return end
        	local spawnCFrame = hrp2.CFrame * CFrame.new(0, 0, -5)
        	spawntoy("NinjaKunai", spawnCFrame, Vector3.zero)
	        task.wait(0.5)
	        local inv = service.Workspace:FindFirstChild(localPlayer.Name .. "SpawnedInToys")
	        local kunai = inv and inv:FindFirstChild("NinjaKunai")
	        if not kunai or not kunai:FindFirstChild("StickyPart") then return end
	        local kunaiPos = kunai.StickyPart.Position
	        hrp2.CFrame = CFrame.new(kunaiPos + Vector3.new(0, 0, 2))
	        task.wait(0.1)
	        pcall(function() SetNetworkOwner:FireServer(kunai.StickyPart, kunai.StickyPart.CFrame) end)
	        pcall(function() CreateGrabLine:FireServer(kunai.StickyPart, Vector3.zero, kunai.StickyPart.Position, false) end)
	        task.wait(0.05)
	        pcall(function() DestroyGrabLine:FireServer(kunai.StickyPart) end)
	        for _, obj in pairs(kunai:GetChildren()) do
            	if obj:IsA("BasePart") then
                	obj.CanTouch = false
                	obj.CanQuery = false
            	end
        	end
	        local firePart = hrp2:FindFirstChild("FirePlayerPart") or hrp2:WaitForChild("FirePlayerPart", 5)
    	    if not firePart then
        	    local torso = char:FindFirstChild("Torso")
            	firePart = torso and torso:FindFirstChild("FirePlayerPart")
    	    end
        	if not firePart then firePart = hrp2 end
	        if firePart then
    	        local korbloxOffset = CFrame.new(0.5, -1.3, 0) * CFrame.Angles(0, 0, math.rad(90))
        	    for i = 1, 10 do
            	    task.spawn(function()
                	    pcall(function() StickyPartEvent:FireServer(kunai.StickyPart, firePart, korbloxOffset) end)
                	end)
            	end
        	end
        	Config.kunaiMonitorConn = task.spawn(function()
            	local korbloxOffset = CFrame.new(0.5, -1.3, 0) * CFrame.Angles(0, 0, math.rad(90))
	            local kunaiFrame = 0
    	        while kunai and kunai.Parent and kunai:FindFirstChild("StickyPart") do
        	        task.wait(0.5)
            	    local curChar = localPlayer.Character
                	local curHRP = curChar and curChar:FindFirstChild("HumanoidRootPart")
                	if not curHRP then continue end
	                local sticky = kunai:FindFirstChild("StickyPart")
    	            if not sticky then break end
        	        local dist = (sticky.Position - curHRP.Position).Magnitude
            	    if dist < 2 then continue end
                	local savedCF = curHRP.CFrame
	                curHRP.CFrame = sticky.CFrame * CFrame.new(0, 0, 4)
    	            task.wait(0.2)
        	        if kunaiFrame % 3 == 0 then
            	        pcall(function() SetNetworkOwner:FireServer(sticky, sticky.CFrame) end)
                	elseif kunaiFrame % 3 == 1 then
                    	pcall(function() CreateGrabLine:FireServer(sticky, Vector3.zero, sticky.Position, false) end)
                	else
                    	pcall(function() DestroyGrabLine:FireServer(sticky) end)
	                end
    	            task.wait(0.05)
        	        local fp = curHRP:FindFirstChild("FirePlayerPart") or curHRP:WaitForChild("FirePlayerPart", 5)
            	    if not fp then
                	    local torso = curChar:FindFirstChild("Torso")
                    	fp = torso:FindFirstChild("FirePlayerPart")
                	end
	                if not fp then fp = curHRP end
	                if fp then
    	                pcall(function() StickyPartEvent:FireServer(sticky, fp, korbloxOffset) end)
        	        end
            	    task.wait(0.1)
                	curHRP.CFrame = savedCF
	                kunaiFrame = kunaiFrame + 1
    	        end
        	end)
    	end)
	end
})

-- ===== 分割4: Defense タブ 前半 =====
LeftGroupBox:AddToggle("Antigrab", {
    Text = "アンチグラブ",
    Default = false,
    Callback = function(Value)
        if Value then
            if not Config.AntigrabCon then
                Config.AntigrabCon = service.RunService.RenderStepped:Connect(function()
                    local Char = GetCharacter()
                    local hrp = Char and Char:FindFirstChild("HumanoidRootPart")
                    local humanoid = Char and Char:FindFirstChild("Humanoid")
                    if hrp and humanoid then
                        if hrp.ReceiveAge ~= 0 then
                            hrp.Anchored = true
                            if isHeld then isHeld.Value = false end
                            task.spawn(function()
                                Struggle:FireServer()
                                RagdollRemote:FireServer(hrp, 0)
                            end)
                            service.ContextActionService:UnbindAction("JumpRemover")
                            humanoid.AutoRotate = true
                            if hrp:FindFirstChild("RootJoint") then
                                hrp.RootJoint.Enabled = true
                            end
                            hrp.Anchored = false
                        elseif hrp.ReceiveAge == 0 then
                            hrp.Anchored = false
                        end
                    end
                end)
            end
        else
            if Config.AntigrabCon then
                Config.AntigrabCon:Disconnect()
                Config.AntigrabCon = nil
            end
        end
    end
})

LeftGroupBox:AddToggle("Antiragrag", {
    Text = "アンチグラブ(ラグドール)",
    Default = false,
    Callback = function(Value)
        Config.AntiGrabRag = Value
        for k, v in pairs(Config.Contuuti) do
            if v then v:Disconnect() end
        end
        table.clear(Config.Contuuti)
        if Config.AntiGrabRag then
            local function setupAntiGrab(char)
                if not char or not Config.AntiGrabRag then return end
                local hrp = char:WaitForChild("HumanoidRootPart", 5)
                local hum = char:WaitForChild("Humanoid", 5)
                local head = char:WaitForChild("Head", 5)
                if not (hrp and hum and head) then return end
                for _, v in pairs(char:GetChildren()) do
                    if v:IsA("BasePart") and v:FindFirstChild("BallSocketConstraint") and v.Name ~= "Head" then
                        v.BallSocketConstraint.Enabled = false
                        if v:FindFirstChild("RagdollLimbPart") then
                            v.RagdollLimbPart.WeldConstraint.Enabled = false
                        end
                    end
                end
                Config.Contuuti["AGHead"] = head.ChildAdded:Connect(function(PartOwner)
                    if PartOwner.Name == "PartOwner" then
                        if not Config.AntigrabRGProc then
                            Config.AntigrabRGProc = true
                            hum.Sit = false
                            Struggle:FireServer(localPlayer)
                            task.spawn(function() 
                                while (head and head:FindFirstChild("PartOwner")) or isHeld.Value do
                                    Struggle:FireServer(localPlayer)
                                    RagdollRemote:FireServer(hrp, 0)
                                    task.wait()
                                end
                            end)
                            hrp.Anchored = true
                            if not Config.AntigrabragWalk then
                                Config.AntigrabragWalk = true
                                while isHeld.Value and task.wait() do
                                    hrp.CFrame = hrp.CFrame + hum.MoveDirection * 0.43
                                end
                            end
                            hrp.Anchored = false
                            Config.AntigrabRGProc = false
                            Config.AntigrabragWalk = false
                        end
                    end
                end)
                local ragdolled = hum:WaitForChild("Ragdolled", 5)
                if ragdolled then
                    Config.Contuuti["AGRagdoll"] = ragdolled.Changed:Connect(function()
                        if hum.Ragdolled.Value then
                            for _, v in pairs(char:GetChildren()) do
                                if v:IsA("BasePart") and v:FindFirstChild("BallSocketConstraint") and v.Name ~= "Head" then
                                    v.BallSocketConstraint.Enabled = false
                                    if v:FindFirstChild("RagdollLimbPart") then
                                        v.RagdollLimbPart.WeldConstraint.Enabled = false
                                    end
                                end
                            end
                        end
                    end)
                end
                local weldHRP = hrp:WaitForChild("WeldHRP", 5)
                if weldHRP then
                    Config.Contuuti["AGWeld"] = weldHRP.Changed:Connect(function()
                        if hrp.WeldHRP.Enabled then
                            while not hum.Sit do task.wait() end
                            hum.Sit = false
                            hum.AutoRotate = true
                            hum.HipHeight = 1
                            while hrp.WeldHRP.Enabled and task.wait() do
                                head.CFrame = hrp.CFrame + Vector3.new(0, 1.35, 0)
                            end
                            hum.HipHeight = 0
                        end
                    end)
                end
            end
            setupAntiGrab(localPlayer.Character)
            Config.Contuuti["AGChar"] = localPlayer.CharacterAdded:Connect(setupAntiGrab)
        else
            local char = localPlayer.Character
            if char then
                for _, v in pairs(char:GetChildren()) do
                    if v:IsA("BasePart") and v:FindFirstChild("BallSocketConstraint") and v.Name ~= "Head" then
                        v.BallSocketConstraint.Enabled = false
                        if v:FindFirstChild("RagdollLimbPart") then
                            v.RagdollLimbPart.WeldConstraint.Enabled = true
                        end
                    end
                end
            end
        end
    end
})

LeftGroupBox:AddToggle("antigrabtp", {
	Text = "アンチグラブ(TP)",
	Default = false,
	Callback = function(Value)
		Config.AntigrabTPT = Value
		local char = GetCharacter()
		local hrp = char:WaitForChild("HumanoidRootPart")
		local hum = char:FindFirstChildOfClass("Humanoid")
		if Value then
			if hum then
				hum.PlatformStand = true
			end
			task.spawn(function()
				while Config.AntigrabTPT and hrp do
					local x = math.random(-500, 500)
					local y = math.random(30, 480)
					local z = math.random(-500, 500)
					hrp.CFrame = CFrame.new(x, y, z)
					task.wait(0.03)
				end
			end)
		else
			if hum then
				hum.PlatformStand = false
			end
		end
	end,
})

LeftGroupBox:AddToggle("Autoat", {
    Text = "自動反撃",
    Default = false,
    Callback = function(enabled)
        Config.autoatakka = enabled
        if enabled then
            Config.AutoAttackerToggle = coroutine.create(function()
                while Config.autoatakka do
                    task.wait(0.02)
                    local character = GetCharacter()
                    local head = character and character:FindFirstChild("Head")
                    local localHRP = character and character:FindFirstChild("HumanoidRootPart")
                    if not (character and head and localHRP) then continue end
                    local partOwner = head:FindFirstChild("PartOwner")
                    if not partOwner then continue end
                    local attacker = service.Players:FindFirstChild(partOwner.Value)
                    if not (attacker and attacker.Character) then continue end
                    local targetChar = attacker.Character
                    local hrp = targetChar:FindFirstChild("HumanoidRootPart")
                    local hum = targetChar:FindFirstChildOfClass("Humanoid")
                    local torso = targetChar:FindFirstChild("Torso")
                    if not hrp or not hum then continue end
                    Struggle:FireServer()
                    pcall(function()
                        SetNetworkOwner:FireServer(hrp, hrp.CFrame)
                    end)
                    task.wait(0.05)
                    if Config.SelectAutoatakka == "Death" then
                        pcall(function()
                            for _, bp in ipairs(targetChar:GetChildren()) do
                                if bp:IsA("BasePart") then
                                    bp.CFrame = CFrame.new(0, -1e9, 0)
                                    bp.CanCollide = false
                                end
                            end
                            hum.Health = 0
                            hum:ChangeState(Enum.HumanoidStateType.Dead)
                            CSV(hrp)
                            DestroyGrabLine:FireServer(hrp)
                        end)
                    elseif Config.SelectAutoatakka == "knock-back" then
                        local knockback = Instance.new("BodyVelocity")
                        knockback.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
                        knockback.Velocity = (localHRP.CFrame.LookVector * 200) + Vector3.new(0, 50, 0)
                        knockback.Parent = hrp
                        service.Debris:AddItem(knockback, 0.5)
                    elseif Config.SelectAutoatakka == "air-Suspend" and torso then
                        local velocity = torso:FindFirstChild("l") or Instance.new("BodyVelocity")
                        velocity.Name = "l"
                        velocity.Velocity = Vector3.new(0, 5000, 0)
                        velocity.MaxForce = Vector3.new(0, math.huge, 0)
                        velocity.Parent = torso
                        service.Debris:AddItem(velocity, 1)
                    elseif Config.SelectAutoatakka == "Freeze" then
                        local freezeVel = Instance.new("BodyVelocity")
                        freezeVel.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
                        freezeVel.Velocity = Vector3.zero
                        freezeVel.Parent = hrp
                        service.Debris:AddItem(freezeVel, 2)
                    elseif Config.SelectAutoatakka == "Fling" then
                        local flingVel = Instance.new("BodyVelocity")
                        flingVel.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
                        flingVel.P = 1250
                        flingVel.Velocity = localHRP.CFrame.LookVector * 2000 + Vector3.new(0, 1000, 0)
                        flingVel.Parent = hrp
                        service.Debris:AddItem(flingVel, 3)
                    end
                end
            end)
            coroutine.resume(Config.AutoAttackerToggle)
        else
            if Config.AutoAttackerToggle then
                coroutine.close(Config.AutoAttackerToggle)
                Config.AutoAttackerToggle = nil
            end
        end
    end
})

LeftGroupBox:AddDropdown("atamode", {
    Text = "反撃モード",
    Values = {"Death", "knock-back", "air-Suspend", "Freeze", "Fling"},
    Default = "Death",
    Callback = function(value)
        Config.SelectAutoatakka = value
    end
})
