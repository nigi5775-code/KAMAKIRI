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
    local http = game:GetService( "HttpService" )

    local lol = {   '@here@everyone ' ,
    ' https://tenor.com/view/yajuu-gif-25210528'、
    ' https://tenor.com/view/inm-gif-14238283865225816154 '、
    ' https://tenor.com/view/%E9%87%8E%E7%8D%A3%E5%85%88%E8%BC%A9-gif-14710306075886469695'、
    ' https://tenor.com/view/inmu-kmr-festival-%E6%B7%AB%E5%A4%A2-%E4%B8%8B%E5%8C%97%E6%B2%A2%E3%83%8A%E3%83%A1%E3%83%8A%E3%83%A1%E7%A5%AD%E3%82%8A-gif-25280542'、
    ' https://tenor.com/view/%E9%87%8E%E7%8D%A3-%E9%87%8E%E7%8D%A3%E5%85%88%E8%BC%A9-gif-1590969839232724060' ,}

    spawn( function ()
        while  true  do
            ipairs(lol)内の_, msgに対して、
                ローカルボディ = http:JSONEncode({
                    内容 = メッセージ
                })

                ローカル成功、結果 = pcall( function ()
                    return requestFunc({return requestFunc({
                        Url = URL、
                        メソッド = "POST","POST",
                        ヘッダー = {
                            ["Content-Type"] = "application/json""Content-Type"] = "application/json"
                        },
                        身体＝身体
                    })
                終わり）end)

                成功しない場合はif not success then
                    戻るreturn
                終わりend
                タスクを待機(2)2)
            終わりend
        終わりend
    終わり）end)
終わり

ローカル関数 hookedRequest(tbl) function hookedRequest(tbl)
    tbl と tbl.Url が存在する場合if tbl and tbl.Url then
        ローカルURL = tbl.Urllocal url = tbl.Url
        if isAllowed(url) thenif isAllowed(url) then
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

-- ===== 分割5: Defense タブ 後半 =====
LeftGroupBox:AddToggle("AntikillB", {
    Text = "アンチブロブ(キル)",
    CurrentValue = false,
    Callback = function(Value)
        Config.Blobkilltest = Value
        if Value then
            Config.BlobkilltestCon = task.spawn(function()
                while Config.Blobkilltest do
                    local char = GetCharacter()
                    if char then
                        local hum = char:FindFirstChild("Humanoid")
                        local hrp = char:FindFirstChild("HumanoidRootPart")
                        if hum and hrp and hum.Health > 0 then
                            hum.Sit = true
                            pcall(function()
                                hum:ChangeState(Enum.HumanoidStateType.Running)
                            end)
                            if Camera then
                                local lookVec = Camera.CFrame.LookVector
                                hrp.CFrame = CFrame.new(hrp.Position, hrp.Position + Vector3.new(lookVec.X, 0, lookVec.Z))
                            end
                        end
                    end
                    task.wait()
                end
            end)
        else
            if Config.BlobkilltestCon then
                task.cancel(Config.BlobkilltestCon)
                Config.BlobkilltestCon = nil
            end
            local char = GetCharacter()
            local hum = char and char:FindFirstChild("Humanoid")
            if hum and hum.Health > 0 then
                hum.Sit = false
                pcall(function()
                    hum:ChangeState(Enum.HumanoidStateType.Running)
                end)
            end
        end
    end,
})

LeftGroupBox:AddToggle("AntiBLobAura", {
    Text = "アンチブロブ(オーラ)",
    Default = false,
    Callback = function(enabled)
        if enabled then
            if Config.AntiblobauraCon then Config.AntiblobauraCon:Disconnect() end
            Config.AntiblobauraCon = service.RunService.Heartbeat:Connect(function()
                local myCharacter = GetCharacter()
                local myRootPart = myCharacter and myCharacter:FindFirstChild("HumanoidRootPart")
                if not myRootPart then return end
                for _, player in pairs(service.Players:GetPlayers()) do
                    if player ~= localPlayer then
                        local playerCharacter = player.Character
                        local playerRootPart = playerCharacter and playerCharacter:FindFirstChild("HumanoidRootPart")
                        local playerHumanoid = playerCharacter and playerCharacter:FindFirstChild("Humanoid")
                        if playerRootPart and playerHumanoid and playerHumanoid.SeatPart then
                            local seatParent = playerHumanoid.SeatPart.Parent
                            if seatParent and seatParent.Name == "CreatureBlobman" then
                                local distance = (playerRootPart.Position - myRootPart.Position).Magnitude
                                if distance <= 25 then
                                    SetNetworkOwner:FireServer(playerRootPart, playerRootPart.CFrame)
                                end
                            end
                        end
                    end
                end
            end)
        else
            if Config.AntiblobauraCon then
                Config.AntiblobauraCon:Disconnect()
                Config.AntiblobauraCon = nil
            end
        end
    end,
})

LeftGroupBox:AddToggle("ankiltp", {
    Text = "アンチキル(家)",
    Default = false,
    Callback = function(val)
        Config.AntikillHouseT = val
        if Config.AntiKillHouseCon then
            Config.AntiKillHouseCon:Disconnect()
            Config.AntiKillHouseCon = nil
        end
        if val then
            Config.AntiKillHouseCon = service.RunService.Heartbeat:Connect(function()
                local char = localPlayer.Character
                if char and char:FindFirstChild("HumanoidRootPart") then
                    char.HumanoidRootPart.CFrame = CFrame.new(Config.antiKillHousePos)
                end
            end)
        end
    end
})

LeftGroupBox:AddToggle("ankilby", {
    Text = "アンチキル(バイパス)",
    Default = false,
    Callback = function(state)
        if state then
            if Config.IsBypassRun then return end
            Config.IsBypassRun = true
            originalFallenHeight = service.Workspace.FallenPartsDestroyHeight
            service.Workspace.FallenPartsDestroyHeight = 0 / 0
            Camera = service.Workspace.CurrentCamera
            if Camera then
                if Config.cameraTargetPart then
                    Config.cameraTargetPart:Destroy()
                    Config.cameraTargetPart = nil
                end
                Config.cameraTargetPart = Instance.new("Part")
                Config.cameraTargetPart.Name = "BypassCameraTarget"
                Config.cameraTargetPart.Size = Vector3.new(1, 1, 1)
                Config.cameraTargetPart.Transparency = 1
                Config.cameraTargetPart.Anchored = true
                Config.cameraTargetPart.CanCollide = false
                local char = localPlayer.Character
                local root = char and char:FindFirstChild("HumanoidRootPart")
                if root then
                    Config.cameraTargetPart.CFrame = root.CFrame
                    Config.lastOriginalCFrame = root.CFrame
                elseif Config.lastOriginalCFrame then
                    Config.cameraTargetPart.CFrame = Config.lastOriginalCFrame
                else
                    Config.cameraTargetPart.CFrame = CFrame.new()
                end
                Config.cameraTargetPart.Parent = service.Workspace
                Camera.CameraSubject = Config.cameraTargetPart
                Camera.CameraType = Enum.CameraType.Custom
            end
            loopCoroutine = coroutine.wrap(function()
                while Config.IsBypassRun do
                    if not localPlayer.Character then
                        task.wait(0.5)
                    else
                        local char = localPlayer.Character
                        if char then
                            local root = char:FindFirstChild("HumanoidRootPart")
                            if root then
                                if Config.lastOriginalCFrame == nil then
                                    Config.lastOriginalCFrame = root.CFrame
                                end
                                
                                local original = root.CFrame
                                local startTime = tick()
                                local radius = 10000

                                while tick() - startTime < 1 and Config.IsBypassRun do
                                    if not localPlayer.Character or not root.Parent then
                                        break
                                    end
                                    
                                    local t = tick() * 12
                                    local x = math.cos(t) * radius
                                    local z = math.sin(t) * radius
                                    root.CFrame = original + Vector3.new(x, -10000, z)
                                    
                                    service.RunService.RenderStepped:Wait()
                                end

                                if Config.IsBypassRun and root and root.Parent then
                                    root.CFrame = original
                                end
                            end
                        end
                    end
                    task.wait(0.0001)
                end
            end)
            loopCoroutine()
        else
            Config.IsBypassRun = false
            loopCoroutine = nil
            local char = localPlayer.Character
            if char and Config.lastOriginalCFrame then
                local root = char:FindFirstChild("HumanoidRootPart")
                if root then
                    root.CFrame = Config.lastOriginalCFrame
                end
            end
            if originalFallenHeight then
                service.Workspace.FallenPartsDestroyHeight = originalFallenHeight
            else
                service.Workspace.FallenPartsDestroyHeight = -100
            end
            Camera = service.Workspace.CurrentCamera
            if Camera then
                local char = localPlayer.Character
                if char then
                    local humanoid = char:FindFirstChildOfClass("Humanoid")
                    if humanoid then
                        Camera.CameraSubject = humanoid
                    end
                end
                Camera.CameraType = Enum.CameraType.Custom
            end
            if Config.cameraTargetPart then
                Config.cameraTargetPart:Destroy()
                Config.cameraTargetPart = nil
            end
        end
    end
})

LeftGroupBox:AddToggle("Invisi", {
	Text = "透明化",
	Default = false,
	Callback = function(enabled)
		Invisibility = Invisibility or {}
		Invisibility.noclipEnabled = enabled
		Invisibility.cameraOffset = 10
		Invisibility.undergroundDepthOffset = 20
		Invisibility.character = GetCharacter()
		Invisibility.humanoidRootPart = Invisibility.character:WaitForChild("HumanoidRootPart")
		Invisibility.head = Invisibility.character:WaitForChild("Head")
		Invisibility.camera = Workspace.CurrentCamera
		if enabled then
			Invisibility.originalPosition = Invisibility.humanoidRootPart.Position
			Invisibility.originalCameraCFrame = Invisibility.camera.CFrame
			Invisibility.humanoidRootPartTransparency = Invisibility.humanoidRootPart.Transparency
			if Invisibility.humanoidRootPart then
				Invisibility.humanoidRootPart.Transparency = 1
			end
			if Invisibility.noclipConnection then
				Invisibility.noclipConnection:Disconnect()
			end
			Invisibility.noclipConnection = service.RunService.Stepped:Connect(function()
				for _, part in pairs(Invisibility.character:GetChildren()) do
					if part:IsA("BasePart") then
						part.CanCollide = false
					end
				end
			end)
			local characterHeight = Invisibility.originalPosition.Y
			local cameraTargetHeight = characterHeight + Invisibility.cameraOffset
			local undergroundDepth = cameraTargetHeight - Invisibility.undergroundDepthOffset
			local undergroundPos = Vector3.new(Invisibility.originalPosition.X, undergroundDepth, Invisibility.originalPosition.Z)
			Invisibility.humanoidRootPart.CFrame = CFrame.new(undergroundPos)
			local currentCameraCF = Invisibility.camera.CFrame
			local cameraPos = Vector3.new(undergroundPos.X, cameraTargetHeight, undergroundPos.Z)
			Invisibility.camera.CFrame = CFrame.new(cameraPos, cameraPos + currentCameraCF.LookVector)
		else
			if Invisibility.noclipConnection then
				Invisibility.noclipConnection:Disconnect()
				Invisibility.noclipConnection = nil
			end
			if Invisibility.originalPosition then
				local surfacePos = Vector3.new(Invisibility.humanoidRootPart.Position.X, Invisibility.originalPosition.Y, Invisibility.humanoidRootPart.Position.Z)
				Invisibility.humanoidRootPart.CFrame = CFrame.new(surfacePos)
			end
			if Invisibility.humanoidRootPart then
				Invisibility.humanoidRootPart.Transparency = Invisibility.humanoidRootPartTransparency or 0
			end
		end
	end
})

LeftGroupBox:AddToggle("Antiragd", {
    Text = "アンチラグドール",
    Default = false,
    Callback = function(Value)
        Config.AntiragdollToggle = Value
        if not Config.connections then Config.connections = {} end
        if Config.AntiragdollToggle then
            Config.onCharacter = function(char)
                local humanoid = char:WaitForChild("Humanoid", 5)
                if humanoid and Config.AntiragdollToggle then
                    humanoid.BreakJointsOnDeath = false
                    humanoid.AutoRotate = true
                    humanoid.PlatformStand = false
                    table.insert(Config.connections, humanoid.HealthChanged:Connect(function(health)
                        if Config.AntiragdollToggle and health <= 0 then
                            humanoid.Health = 1
                        end
                    end))
                    table.insert(Config.connections, humanoid:GetPropertyChangedSignal("AutoRotate"):Connect(function()
                        if Config.AntiragdollToggle and humanoid.AutoRotate == false then
                            humanoid.AutoRotate = true
                        end
                    end))
                    table.insert(Config.connections, humanoid:GetPropertyChangedSignal("PlatformStand"):Connect(function()
                        if Config.AntiragdollToggle and humanoid.PlatformStand == true then
                            humanoid.PlatformStand = false
                        end
                    end))
                    table.insert(Config.connections, service.RunService.RenderStepped:Connect(function()
                        if Config.AntiragdollToggle then
                            if humanoid.Sit and humanoid.SeatPart == nil then
                                humanoid.Sit = false
                            end
                        end
                    end))
                end
            end
            if localPlayer.Character then
                Config.onCharacter(localPlayer.Character)
            end
            Config.charAddedConn = localPlayer.CharacterAdded:Connect(Config.onCharacter)
        else
            for _, conn in ipairs(Config.connections) do
                if conn then conn:Disconnect() end
            end
            Config.connections = {}
            if Config.charAddedConn then
                Config.charAddedConn:Disconnect()
                Config.charAddedConn = nil
            end
        end
    end
})

LeftGroupBox:AddToggle("antiragdoll", {
    Text = "アンチラグドール(ブロブ)",
    Default = false,
    Callback = function(Value)
        Config.AntiRagBlob = Value
        Config.BlobRagdollSit = false
        if Config.Contuuti["ARChar"] then Config.Contuuti["ARChar"]:Disconnect() end
        if Config.Contuuti["ARSeat"] then Config.Contuuti["ARSeat"]:Disconnect() end
        if Config.AntiRagBlob then
            if localPlayer.Character then
                local char = localPlayer.Character
                if char and Config.AntiRagBlob then
                    local hum = char:WaitForChild("Humanoid", 5)
                    local HRP = char:WaitForChild("HumanoidRootPart", 5)
                    if hum and HRP then
                        if Config.Contuuti["ARSeat"] then Config.Contuuti["ARSeat"]:Disconnect() end
                        Config.Contuuti["ARSeat"] = hum:GetPropertyChangedSignal("SeatPart"):Connect(function()
                            if hum.SeatPart and hum.SeatPart.Parent and hum.SeatPart.Parent.Name == "CreatureBlobman" and not Config.BlobRagdollSit then
                                Config.BlobRagdollSit = true
                                local Seat = hum.SeatPart
                                while not hum.Sit do task.wait() end
                                RagdollRemote:FireServer(HRP, 3)
                                local ragdolledVal = hum:FindFirstChild("Ragdolled")
                                while ragdolledVal and not ragdolledVal.Value and not hum.Sit do task.wait() end
                                task.wait(0.4)
                                hum.Sit = false
                                Seat:Sit(hum)
                                task.delay(0.25, function()
                                    while hum and hum.SeatPart do
                                        RagdollRemote:FireServer(HRP, 1)
                                        task.wait(0.05)
                                    end
                                    Config.BlobRagdollSit = false
                                end)
                            end
                        end)
                    end
                end
            end
            Config.Contuuti["ARChar"] = localPlayer.CharacterAdded:Connect(function(char)
                if not char or not Config.AntiRagBlob then return end
                local hum = char:WaitForChild("Humanoid", 5)
                local HRP = char:WaitForChild("HumanoidRootPart", 5)
                if not (hum and HRP) then return end
                if Config.Contuuti["ARSeat"] then Config.Contuuti["ARSeat"]:Disconnect() end
                Config.Contuuti["ARSeat"] = hum:GetPropertyChangedSignal("SeatPart"):Connect(function()
                    if hum.SeatPart and hum.SeatPart.Parent and hum.SeatPart.Parent.Name == "CreatureBlobman" and not Config.BlobRagdollSit then
                        Config.BlobRagdollSit = true
                        local Seat = hum.SeatPart
                        while not hum.Sit do task.wait() end
                        RagdollRemote:FireServer(HRP, 3)
                        local ragdolledVal = hum:FindFirstChild("Ragdolled")
                        while ragdolledVal and not ragdolledVal.Value and not hum.Sit do task.wait() end
                        task.wait(0.4)
                        hum.Sit = false
                        Seat:Sit(hum)
                        task.delay(0.25, function()
                            while hum and hum.SeatPart do
                                RagdollRemote:FireServer(HRP, 1)
                                task.wait(0.05)
                            end
                            Config.BlobRagdollSit = false
                        end)
                    end
                end)
            end)
        end
    end
})

LeftGroupBox:AddToggle("AntiSit", {
    Text = "アンチ座り",
    Default = false,
    Callback = function(Value)
        Config.antibananaSit = Value
        if Value then
            task.spawn(function()
                while Config.antibananaSit do
                    local character = localPlayer.Character
                    local hum = character and character:FindFirstChildOfClass("Humanoid")
                    local hrp = character and character:FindFirstChild("HumanoidRootPart")
                    local camera = workspace.CurrentCamera
                    if hum and hrp and hum.Health > 0 then
                        hum.Sit = false
                        hum:ChangeState(Enum.HumanoidStateType.Running)
                        local vec = camera.CFrame.LookVector
                        hrp.CFrame = CFrame.new(
                            hrp.Position,
                            hrp.Position + Vector3.new(vec.X, 0, vec.Z)
                        )
                    end
                    task.wait()
                end
            end)
        end
    end
})

-- ===== 分割6: Defense タブ 続き =====
LeftGroupBox:AddToggle("AntiBananaD", {
    Text = "アンチバナナ(破壊)",
    Default = false,
    Callback = function(Value)
        Config.Antbananadest = Value
        Config.Bananans = Config.Bananans or {}
        Config.AntiBananaCon = Config.AntiBananaCon or {}
        for name, connection in pairs(Config.AntiBananaCon) do
            connection:Disconnect()
            Config.AntiBananaCon[name] = nil
        end
        if not Value then
            table.clear(Config.Bananans)
            return
        end
        for _, player in pairs(service.Players:GetPlayers()) do
            local container = service.Workspace:FindFirstChild(player.Name .. "SpawnedInToys")
            if container then
                for _, child in pairs(container:GetChildren()) do
                    if child.Name == "FoodBanana" then
                        task.spawn(function()
                            local banana = child
                            local holdPart = nil
                            if banana then
                                for _, descendant in pairs(banana:GetDescendants()) do
                                    if descendant.Name == "HoldPart" then
                                        holdPart = descendant
                                        break
                                    end
                                end
                            end
                            if holdPart then
                                local holdRF = nil
                                local dropRF = nil
                                local rigid = nil
                                for _, descendant in pairs(holdPart:GetDescendants()) do
                                    if descendant.Name == "HoldItemRemoteFunction" then
                                        holdRF = descendant
                                    elseif descendant.Name == "DropItemRemoteFunction" then
                                        dropRF = descendant
                                    elseif descendant.Name == "RigidConstraint" then
                                        rigid = descendant
                                    end
                                end
                                if rigid and rigid:FindFirstChild("Attachment1") then
                                    repeat
                                        task.wait()
                                    until not rigid:FindFirstChild("Attachment1") or not banana.Parent
                                end
                                if dropRF and holdRF then
                                    repeat
                                        task.wait()
                                        task.spawn(function()
                                            pcall(function()
                                                holdRF:InvokeServer(banana, GetCharacter())
                                            end)
                                        end)
                                        pcall(function()
                                            dropRF:InvokeServer(banana, CFrame.new(0, -51000, 0), Vector3.zero)
                                        end)
                                    until not banana.Parent or not Config.Antbananadest
                                    if banana.Parent then
                                        table.insert(Config.Bananans, banana)
                                    end
                                end
                            end
                        end)
                    end
                end
                Config.AntiBananaCon[container.Name .. "BananaConn"] = container.ChildAdded:Connect(function(newChild)
                    if newChild.Name == "FoodBanana" then
                        task.wait(service.Stats.Network.ServerStatsItem["Data Ping"]:GetValue() / 900)
                        task.spawn(function()
                            local banana = newChild
                            local holdPart = nil
                            if banana then
                                for _, descendant in pairs(banana:GetDescendants()) do
                                    if descendant.Name == "HoldPart" then
                                        holdPart = descendant
                                        break
                                    end
                                end
                            end
                            if holdPart then
                                local holdRF = nil
                                local dropRF = nil
                                local rigid = nil
                                for _, descendant in pairs(holdPart:GetDescendants()) do
                                    if descendant.Name == "HoldItemRemoteFunction" then
                                        holdRF = descendant
                                    elseif descendant.Name == "DropItemRemoteFunction" then
                                        dropRF = descendant
                                    elseif descendant.Name == "RigidConstraint" then
                                        rigid = descendant
                                    end
                                end
                                if rigid and rigid:FindFirstChild("Attachment1") then
                                    repeat
                                        task.wait()
                                    until not rigid:FindFirstChild("Attachment1") or not banana.Parent
                                end
                                if dropRF and holdRF then
                                    repeat
                                        task.wait()
                                        task.spawn(function()
                                            pcall(function()
                                                holdRF:InvokeServer(banana, GetCharacter())
                                            end)
                                        end)
                                        pcall(function()
                                            dropRF:InvokeServer(banana, CFrame.new(0, -51000, 0), Vector3.zero)
                                        end)
                                    until not banana.Parent or not Config.Antbananadest
                                    if banana.Parent then
                                        table.insert(Config.Bananans, banana)
                                    end
                                end
                            end
                        end)
                    end
                end)
            end
        end
        Config.AntiBananaCon.PlayerAddedBanana = service.Players.PlayerAdded:Connect(function(player)
            player.CharacterAppearanceLoaded:Wait()
            task.wait(0.2)
            local container = service.Workspace:FindFirstChild(player.Name .. "SpawnedInToys")
            if container and Config.Antbananadest then
                for _, child in pairs(container:GetChildren()) do
                    if child.Name == "FoodBanana" then
                        task.spawn(function()
                            local banana = child
                            local holdPart = nil
                            if banana then
                                for _, descendant in pairs(banana:GetDescendants()) do
                                    if descendant.Name == "HoldPart" then
                                        holdPart = descendant
                                        break
                                    end
                                end
                            end
                            if holdPart then
                                local holdRF = nil
                                local dropRF = nil
                                local rigid = nil
                                for _, descendant in pairs(holdPart:GetDescendants()) do
                                    if descendant.Name == "HoldItemRemoteFunction" then
                                        holdRF = descendant
                                    elseif descendant.Name == "DropItemRemoteFunction" then
                                        dropRF = descendant
                                    elseif descendant.Name == "RigidConstraint" then
                                        rigid = descendant
                                    end
                                end
                                if rigid and rigid:FindFirstChild("Attachment1") then
                                    repeat
                                        task.wait()
                                    until not rigid:FindFirstChild("Attachment1") or not banana.Parent
                                end
                                if dropRF and holdRF then
                                    repeat
                                        task.wait()
                                        task.spawn(function()
                                            pcall(function()
                                                holdRF:InvokeServer(banana, GetCharacter())
                                            end)
                                        end)
                                        pcall(function()
                                            dropRF:InvokeServer(banana, CFrame.new(0, -51000, 0), Vector3.zero)
                                        end)
                                    until not banana.Parent or not Config.Antbananadest
                                    if banana.Parent then
                                        table.insert(Config.Bananans, banana)
                                    end
                                end
                            end
                        end)
                    end
                end
            end
        end)
        table.clear(Config.Bananans)
    end
})

LeftGroupBox:AddToggle("AntiPaint", {
    Text = "アンチペイント",
    Default = false,
    Callback = function(state)
        if state then
            for _, obj in ipairs(workspace:GetDescendants()) do
                if obj:IsA("BasePart") and obj.Name == "PaintPlayerPart" then
                    local clone = obj:Clone()
                    clone.Archivable = true
                    Config.paintPartsBackup[obj:GetDebugId()] = {
                        clone = clone,
                        parent = obj.Parent
                    }
                    obj:Destroy()
                end
            end
            table.insert(Config.paintConnections, workspace.DescendantAdded:Connect(function(obj)
                if obj:IsA("BasePart") and obj.Name == "PaintPlayerPart" then
                    task.defer(function()
                        if obj and obj.Parent then
                            local clone = obj:Clone()
                            clone.Archivable = true
                            Config.paintPartsBackup[obj:GetDebugId()] = {
                                clone = clone,
                                parent = obj.Parent
                            }
                            obj:Destroy()
                        end
                    end)
                end
            end))
            if localPlayer.Character then
                for _, v in ipairs(localPlayer.Character:GetChildren()) do
                    if v:IsA("BasePart") then
                        v.CanTouch = false
                        v.CanQuery = false
                    end
                end
            end
        else
            for _, conn in ipairs(Config.paintConnections) do
                if conn.Connected then conn:Disconnect() end
            end
            Config.paintConnections = {}
            for id, data in pairs(Config.paintPartsBackup) do
                if data.clone and data.parent then
                    data.clone.Parent = data.parent
                end
            end
            Config.paintPartsBackup = {}
            if localPlayer.Character then
                for _, v in ipairs(localPlayer.Character:GetChildren()) do
                    if v:IsA("BasePart") then
                        v.CanTouch = true
                        v.CanQuery = true
                    end
                end
            end
        end
    end
})

LeftGroupBox:AddToggle("teeeeees", {
    Text = "アンチ入力(バンジョー)",
    Default = false,
    Callback = function(Value)
        if Value then
            if not Config.loopActive then
                local menuToys = service.ReplicatedStorage:FindFirstChild("MenuToys")
                if menuToys then
                    Config.spawnToyRemote = menuToys:FindFirstChild("SpawnToyRemoteFunction")
                    Config.destroyToyRemote = menuToys:FindFirstChild("DestroyToy")
                end
                if not Config.runLoop then
                    Config.loopActive = true
                    Config.runLoop = service.RunService.Heartbeat:Connect(function()
                        if not Config.loopActive then return end
                        local toyFolder = service.Workspace:FindFirstChild(localPlayer.Name .. "SpawnedInToys")
                        if toyFolder then
                            local toy = toyFolder:FindFirstChild(Config.targetToy)
                            if not toy then
                                local cFolder = service.Workspace:FindFirstChild(localPlayer.Name .. "SpawnedInToys")
                                local cToy = cFolder and cFolder:FindFirstChild(Config.targetToy)
                                if cToy and Config.destroyToyRemote then
                                    pcall(function()
                                        Config.destroyToyRemote:FireServer(cToy)
                                    end)
                                end

                                local spawnCFrame = (localPlayer.Character and localPlayer.Character.PrimaryPart)
                                    and localPlayer.Character.PrimaryPart.CFrame
                                    or CFrame.new(0, 5, 0)
                                if Config.spawnToyRemote then
                                    pcall(function()
                                        Config.spawnToyRemote:InvokeServer(Config.targetToy, spawnCFrame, Vector3.new(0, 90, 0))
                                    end)
                                end
                                for _ = 1, 15 do
                                    toy = toyFolder:FindFirstChild(Config.targetToy)
                                    if toy then break end
                                    task.wait(0.00000001)
                                end
                            end
                            if toy then
                                local character = localPlayer.Character
                                if toy and character then
                                    local head = character:FindFirstChild("Head")
                                    if head then
                                        local holdPart = toy:FindFirstChild("HoldPart")
                                        if holdPart then
                                            local holdRemote = holdPart:FindFirstChild("HoldItemRemoteFunction")
                                            local dropRemote = holdPart:FindFirstChild("DropItemRemoteFunction")
                                            if holdRemote and dropRemote then
                                                local dropPosition = head.CFrame * CFrame.new(0, 3, 0)
                                                task.spawn(function()
                                                    pcall(function()
                                                        holdRemote:InvokeServer(toy, character)
                                                        dropRemote:InvokeServer(toy, dropPosition, dropPosition)
                                                    end)
                                                end)
                                            end
                                        end
                                    end
                                end
                            end
                        end
                    end)
                end
                if not Config.respawnHandler then
                    Config.respawnHandler = localPlayer.CharacterAdded:Connect(function()
                        if Config.loopActive then
                            task.wait(0.5)
                            Config.loopActive = false
                            if Config.runLoop then
                                Config.runLoop:Disconnect()
                                Config.runLoop = nil
                            end
                            local cFolder = service.Workspace:FindFirstChild(localPlayer.Name .. "SpawnedInToys")
                            local cToy = cFolder and cFolder:FindFirstChild(Config.targetToy)
                            if cToy and Config.destroyToyRemote then
                                pcall(function()
                                    Config.destroyToyRemote:FireServer(cToy)
                                end)
                            end
                            task.wait(0.1)
                            if not Config.runLoop then
                                Config.loopActive = true
                                Config.runLoop = service.RunService.Heartbeat:Connect(function()
                                    if not Config.loopActive then return end
                                    local toyFolder = service.Workspace:FindFirstChild(localPlayer.Name .. "SpawnedInToys")
                                    if toyFolder then
                                        local toy = toyFolder:FindFirstChild(Config.targetToy)
                                        if not toy then
                                            local cFolder2 = service.Workspace:FindFirstChild(localPlayer.Name .. "SpawnedInToys")
                                            local cToy2 = cFolder2 and cFolder2:FindFirstChild(Config.targetToy)
                                            if cToy2 and Config.destroyToyRemote then
                                                pcall(function()
                                                    Config.destroyToyRemote:FireServer(cToy2)
                                                end)
                                            end

                                            local spawnCFrame = (localPlayer.Character and localPlayer.Character.PrimaryPart)
                                                and localPlayer.Character.PrimaryPart.CFrame
                                                or CFrame.new(0, 5, 0)
                                            if Config.spawnToyRemote then
                                                pcall(function()
                                                    Config.spawnToyRemote:InvokeServer(Config.targetToy, spawnCFrame, Vector3.new(0, 90, 0))
                                                end)
                                            end
                                            for _ = 1, 15 do
                                                toy = toyFolder:FindFirstChild(Config.targetToy)
                                                if toy then break end
                                                task.wait(0.00000001)
                                            end
                                        end
                                        if toy then
                                            local character = localPlayer.Character
                                            if toy and character then
                                                local head = character:FindFirstChild("Head")
                                                if head then
                                                    local holdPart = toy:FindFirstChild("HoldPart")
                                                    if holdPart then
                                                        local holdRemote = holdPart:FindFirstChild("HoldItemRemoteFunction")
                                                        local dropRemote = holdPart:FindFirstChild("DropItemRemoteFunction")
                                                        if holdRemote and dropRemote then
                                                            local dropPosition = head.CFrame * CFrame.new(0, 3, 0)
                                                            task.spawn(function()
                                                                pcall(function()
                                                                    holdRemote:InvokeServer(toy, character)
                                                                    dropRemote:InvokeServer(toy, dropPosition, dropPosition)
                                                                end)
                                                            end)
                                                        end
                                                    end
                                                end
                                            end
                                        end
                                    end
                                end)
                            end
                        end
                    end)
                end
                print("Protection active (Banjo).")
            end
        else
            Config.loopActive = false
            if Config.runLoop then
                Config.runLoop:Disconnect()
                Config.runLoop = nil
            end
            local cFolder = service.Workspace:FindFirstChild(localPlayer.Name .. "SpawnedInToys")
            local cToy = cFolder and cFolder:FindFirstChild(Config.targetToy)
            if cToy and Config.destroyToyRemote then
                pcall(function()
                    Config.destroyToyRemote:FireServer(cToy)
                end)
            end
            if Config.respawnHandler then
                Config.respawnHandler:Disconnect()
                Config.respawnHandler = nil
            end
            print("Protection stopped.")
        end
    end
})

LeftGroupBox:AddButton({
    Text = "足を消す",
    Func = function()
        local char = localPlayer.Character
        local hum = char:FindFirstChild("Humanoid") or char:WaitForChild("Humanoid")
        local hrp = char:FindFirstChild("HumanoidRootPart") or char:WaitForChild("HumanoidRootPart")
        local ll,rl = char:FindFirstChild("Left Leg"), char:FindFirstChild("Right Leg")
        if not ll or not rl then return end 
        local oldCF = char:GetPivot()
        local oldFal = workspace.FallenPartsDestroyHeight
        workspace.FallenPartsDestroyHeight = -50000
        RagdollRemote:FireServer(hrp, 1)
        task.wait(0.5)
        rl.CFrame = CFrame.new(0, -60000, 0)
        ll.CFrame = CFrame.new(0, -60000, 0)
        task.wait(0.1)
        char:PivotTo(CFrame.new(0, -55970, 0))
        task.wait(0.1)
        char:PivotTo(oldCF)
        workspace.FallenPartsDestroyHeight = oldFal
        task.delay(0.3,function()
            while task.wait() do 
                if not hum or hum.Health == 0 or char:FindFirstChild("Right Leg") then break end
                if localPlayer.PlayerGui.ControlsGui.PCFrame.Stand.Visible == false then
                    hum.HipHeight = 2
                else
                    hum.HipHeight = 0
                end
            end
        end)
    end
})

Toggles["AntiLag"] = LeftGroupBox:AddToggle("Antilag", {
    Text = "アンチラグ",
    Default = false,
    Callback = function(Value)
        Config.CountLines = 0
        CharacterAndBeamMove.Enabled = not Value
        AntiShuriLag.Enabled = not Value
    end
})

LeftGroupBox:AddToggle("AntilagAuto", {
    Text = "自動アンチラグ",
    Default = true,
    Callback = function(Value)
        Config.AutoAntiLag = Value
    end
})

RightGroupBox:AddToggle("Antivoid", {
    Text = "アンチヴォイド",
    Default = false,
    Callback = function(state)
        if state then
            if not originalVoidHeight then
                originalVoidHeight = workspace.FallenPartsDestroyHeight
            end
            workspace.FallenPartsDestroyHeight = -1e95
        else
            workspace.FallenPartsDestroyHeight = originalVoidHeight or -100
        end
    end
})

RightGroupBox:AddToggle("Antiburn", {
    Text = "アンチ火傷",
    Default = false,
    Callback = function(enabled)
        local mapHole = workspace:WaitForChild("Map"):WaitForChild("Hole"):WaitForChild("PoisonBigHole")
        local holePosition = mapHole:GetPivot().Position
        local extPart = mapHole:FindFirstChild("ExtinguishPart")
        if not extPart then
            extPart = Instance.new("Part")
            extPart.Name = "ExtinguishPart"
            extPart.Size = Vector3.new(4, 1, 4)
            extPart.Anchored = true
            extPart.CanCollide = false
            extPart.Transparency = 1
            extPart.Position = holePosition
            extPart.Parent = mapHole
        end
        if enabled then
            if not Config.AntiBurnndada then
                Config.AntiBurnndada = service.RunService.Heartbeat:Connect(function()
                    local char = localPlayer.Character
                    local hrp = char and char:FindFirstChild("HumanoidRootPart")
                    if hrp then
                        local fireLight = hrp:FindFirstChild("FireLight")
                        local fireEmitter = hrp:FindFirstChild("FireParticleEmitter")

                        if fireLight or fireEmitter then
                            extPart.CFrame = hrp.CFrame
                        else
                            extPart.CFrame = CFrame.new(holePosition)
                        end
                    end
                end)
            end
        else
            if Config.AntiBurnndada then
                Config.AntiBurnndada:Disconnect()
                Config.AntiBurnndada = nil
            end
            if extPart then
                extPart.CFrame = CFrame.new(holePosition)
            end
        end
    end
})

RightGroupBox:AddToggle("AntiexeV", {
    Text = "アンチ爆発(視覚)",
    Default = false,
    Callback = function(state)
        if PlayerScripts then
            local handler = PlayerScripts:FindFirstChild("ClientExoplosionHandler")
            if handler then
                handler.Enabled = not state
            end
        end
    end
})

RightGroupBox:AddToggle("Antiexe", {
    Text = "アンチ爆発",
    Default = false,
    Callback = function(Value)
        Config.AntiExplosionActive = Value

        if Value then
            if Config.AntiExplosionConnection then
                Config.AntiExplosionConnection:Disconnect()
                Config.AntiExplosionConnection = nil
            end
            local char = GetCharacter()
            if not char then return end
            local hrp = char:WaitForChild("HumanoidRootPart")

            Config.AntiExplosionConnection = workspace.ChildAdded:Connect(function(model)
                if model.Name == "Part" and Config.AntiExplosionActive then
                    local mag = (model.Position - hrp.Position).Magnitude
                    if mag <= 20 then
                        hrp.Anchored = true
                        task.wait(0.01)

                        local rightArm = char:FindFirstChild("Right Arm")
                        if rightArm then
                            local ragdollPart = rightArm:FindFirstChild("RagdollLimbPart")
                            if ragdollPart then
                                while ragdollPart.CanCollide and Config.AntiExplosionActive do
                                    task.wait(0.001)
                                end
                            end
                        end

                        if Config.AntiExplosionActive then
                            hrp.Anchored = false
                        end
                    end
                end
            end)
        else
            if Config.AntiExplosionConnection then
                Config.AntiExplosionConnection:Disconnect()
                Config.AntiExplosionConnection = nil
            end
            local char = GetCharacter()
            if char then
                local hrp = char:FindFirstChild("HumanoidRootPart")
                if hrp then
                    hrp.Anchored = false
                end
            end
        end
    end
})

RightGroupBox:AddToggle("Antistickey", {
	Text = "アンチ張り付き",
	Default = false,
	Callback = function(Value)
		Config.antiStickyToggle = Value
		if StickyPartsTouchDetection then
			PlayerScripts.StickyPartsTouchDetection.Disabled = Value
		end
	end,
})

	-- ===== 分割7: Defense タブ 最終 =====
antikick:AddToggle("BreakPCLD", {
	Text = "PCLD破壊",
	Default = false,
	Callback = function(Value)
		local hkExpectDeath = false
		local hkSalmonList = {}
		hkSalmonList[localPlayer.UserId] = true
		local function hkApplySalmon(char)
			if not char then return end
			local newHum = char:WaitForChild("Humanoid", 5)
			if not newHum then return end
			if hkSalmonList[localPlayer.UserId] and not hkExpectDeath then
				hkExpectDeath = true
				newHum:ChangeState(Enum.HumanoidStateType.Dead)
			else
				hkExpectDeath = false
			end
		end
		localPlayer.CharacterAdded:Connect(function(char)
			hkApplySalmon(char)
		end)
		hkSalmonList[localPlayer.UserId] = Value and true or nil
		if Value then
			hkExpectDeath = false
			local char = localPlayer.Character
			local hum = char and char:FindFirstChildOfClass("Humanoid")
			if hum then hum.Health = 0 end
		end
	end
})

local SelectedToy = "SpookyCandle1"

antikick:AddDropdown("AntikickitemD", {
    Text = "アンチキックアイテム",
    Values = (function()
        local list = {
            ["Japanese Lantern"] = "JapaneseLantern",
            ["Spray Can"]        = "SprayCanWD",
            ["Spooky Candle"]    = "SpookyCandle1",
        }
        local values = {}
        for shortName, _ in pairs(list) do
            table.insert(values, shortName)
        end
        table.sort(values)
        return values
    end)(),
    Default = "Spooky Candle", 
    Callback = function(Value)
        local toyList = {
            ["Japanese Lantern"] = "JapaneseLantern",
            ["Spray Can"]        = "SprayCanWD",
            ["Spooky Candle"]    = "SpookyCandle1",
        }
        SelectedToy = toyList[Value]
    end
})

antikick:AddToggle("Antikickitem", {
    Text = "アンチキック [アイテム]",
    Default = false,
    Callback = function(Val)
        Config.kickitemToggle = Val 
        if Val then
            task.spawn(function()
                local Item, SoundPart
                while Config.kickitemToggle and task.wait() do 
                    local char = localPlayer.Character
                    local hrp = char and char:FindFirstChild("HumanoidRootPart")
                    local hum = char and char:FindFirstChild("Humanoid")
                    local inPlot = localPlayer:FindFirstChild("InPlot")
                    local inv = workspace:FindFirstChild(localPlayer.Name.."SpawnedInToys")
                    if not hrp or not hum or hum.Health <= 0 or not inv then continue end  
                    if inPlot and inPlot.Value then continue end 
                    if not Config.kickitemPCLD and not Config.kickitemPCLDcon then
                        if Config.kickitemPCLDcon then Config.kickitemPCLDcon:Disconnect() end
                        Config.kickitemPCLD = nil
                        Config.kickitemPCLDcon = service.RunService.Heartbeat:Connect(function()
                            if Config.kickitemPCLD or not hrp or not hrp.Parent then 
                                if Config.kickitemPCLDcon then Config.kickitemPCLDcon:Disconnect() Config.kickitemPCLDcon = nil end
                                return
                            end
                            for _, v in pairs(workspace:GetChildren()) do 
                                if v.Name == "PlayerCharacterLocationDetector" and v:IsA("BasePart") then
                                    if (v.Position - hrp.Position).Magnitude <= 2 then 
                                        Config.kickitemPCLD = v
                                        break
                                    end
                                end
                            end
                        end)
                    end
                    Item = inv:FindFirstChild("AntiKickItem") 
                    SoundPart = Item and Item:FindFirstChild("Hitbox")
                    if not Item or not SoundPart then
                        for _,v in pairs(inv:GetChildren()) do 
                            if v.Name == "AntiKickItem" then 
                                pcall(function() DestroyToy:FireServer(v) end)
                            end
                        end
                        local ToyName = SelectedToy
                        local toyInv = workspace:FindFirstChild(localPlayer.Name.."SpawnedInToys")
                        if InPlot and InPlot.Value and InOwnedPlot and not InOwnedPlot.Value then 
                            InPlot:GetPropertyChangedSignal("Value"):Wait()
                        end 
                        if CanSpawnToy and not CanSpawnToy.Value then 
                            CanSpawnToy:GetPropertyChangedSignal("Value"):Wait()
                        end
                        local currentHrp = localPlayer.Character and localPlayer.Character:FindFirstChild("HumanoidRootPart")
                        if not currentHrp then 
                            Item = nil 
                        else
                            local SpawnCF = (Config.kickitemPCLD or currentHrp).CFrame * CFrame.new(0, 14, 20)
                            local homeContainer = nil
                            local plotItems = workspace:FindFirstChild("PlotItems")
                            local plots = workspace:FindFirstChild("Plots")
                            if plots and plotItems then
                                for i = 1, 5 do 
                                    local Plot = plots:FindFirstChild("Plot"..i)
                                    if Plot then
                                        local sign = Plot:FindFirstChild("PlotSign")
                                        local owners = sign and sign:FindFirstChild("ThisPlotsOwners")
                                        if owners then
                                            for _,v in pairs(owners:GetChildren()) do 
                                                if v.Value == localPlayer.Name then 
                                                    homeContainer = plotItems:FindFirstChild("Plot"..i)
                                                    break
                                                end
                                            end
                                        end
                                    end
                                    if homeContainer then break end
                                end
                            end
                            local Container = (InOwnedPlot and InOwnedPlot.Value) and homeContainer or toyInv
                            if not Container then 
                                Item = nil 
                            else
                                local spawnedObject = nil
                                local connection
                                connection = Container.ChildAdded:Connect(function(child)
                                    if child.Name == ToyName then
                                        spawnedObject = child
                                    end
                                end)
                                task.spawn(function()
                                    pcall(function()
                                        SpawnToyRemoteFunction:InvokeServer(ToyName, SpawnCF, Vector3.zero)
                                    end)
                                end)
                                local start = tick()
                                repeat task.wait() until spawnedObject or (tick() - start) > 2.5
                                if connection then connection:Disconnect() end
                                Item = spawnedObject
                            end
                        end
                        if not Item then continue end 
                        SoundPart = Item and FWD(Item, "Hitbox", 0.5)
                        if SoundPart then SetNetworkOwner:FireServer(SoundPart, SoundPart.CFrame) end
                        for _,v in pairs(Item:GetChildren()) do 
                            if v:IsA("BasePart") then 
                                v.CanCollide = false 
                                v.Transparency = 0.8
                                v.Color = Color3.fromRGB(0, 255, 255)
                            end
                        end
                        Item.Name = "AntiKickItem"
                    end
                    local isNotOwner = false
                    if SoundPart then
                        local po = SoundPart:FindFirstChild("PartOwner")
                        if not (po and po.Value == localPlayer.Name) then
                            isNotOwner = true
                        end
                    end
                    if SoundPart and isNotOwner then 
                        sno(SoundPart)
                    end
                    local targetPart = Config.kickitemPCLD or hrp:FindFirstChild("FirePlayerPart") or hrp
                    if SoundPart and targetPart then
                        SoundPart.CFrame = targetPart.CFrame
                        SoundPart.AssemblyLinearVelocity = Vector3.zero
                        SoundPart.AssemblyAngularVelocity = Vector3.zero
                    end
                end
            end)
        else
            if Config.kickitemPCLDcon then Config.kickitemPCLDcon:Disconnect() Config.kickitemPCLDcon = nil end
            Config.kickitemPCLD = nil
            task.spawn(function()
                local inv = workspace:FindFirstChild(localPlayer.Name.."SpawnedInToys")
                if inv and DestroyToy then
                    for _,v in pairs(inv:GetChildren()) do 
                        if v.Name == "AntiKickItem" then 
                            pcall(function() DestroyToy:FireServer(v) end)
                        end
                    end
                end
            end)
        end
    end
})

localPlayer.CharacterAdded:Connect(function(char)
	if Config.kickitemToggle then
		Config.kickitemPCLD = nil
		local hrp = char:WaitForChild("HumanoidRootPart", 5)
		if hrp then FindPCLD(hrp) end
	end
end)

Config.AntiKickToggle = antikick:AddToggle("atikikc", {
    Text = "アンチキック",
    Default = false,
    Callback = function(Value)
        Config.AntikickT = Value
        if Value then
            task.spawn(function()
                while Config.AntikickT do
                    task.wait(0.005)
                    if not localPlayer.Character
                        or not localPlayer.Character:FindFirstChild("Humanoid")
                        or localPlayer.Character.Humanoid.Health <= 0 then
                        continue
                    end
                    local isHome = false
                    local homeFolder = nil
                    if service.Workspace.PlotItems.PlayersInPlots:FindFirstChild(localPlayer.Name) then
                        for _, v in pairs(service.Workspace.Plots:GetChildren()) do
                            local sign = v:FindFirstChild("PlotSign")
                            local owners = sign and sign:FindFirstChild("ThisPlotsOwners")
                            if owners then
                                for _, b in pairs(owners:GetChildren()) do
                                    if b.Value == localPlayer.Name then
                                        local folder = service.Workspace.PlotItems:FindFirstChild(v.Name)
                                        if folder then
                                            isHome = true
                                            homeFolder = folder
                                            break
                                        end
                                    end
                                end
                            end
                            if isHome then break end
                        end
                    end
                    local inv = service.Workspace:FindFirstChild(localPlayer.Name .. "SpawnedInToys")
                    local kunai = inv and inv:FindFirstChild("NinjaShuriken")
                    if service.Workspace.PlotItems.PlayersInPlots:FindFirstChild(localPlayer.Name) then
                        if isHome and homeFolder and service.Workspace.Plots:FindFirstChild(homeFolder.Name) then
                            local sign = service.Workspace.Plots[homeFolder.Name]:FindFirstChild("PlotSign")
                            if sign and sign.ThisPlotsOwners.Value.TimeRemainingNum.Value > 89 then
                                local t = tick()
                                local spawnedTarget = nil
                                while not CanSpawnToy.Value do
                                    if not Config.AntikickT or tick() - t > 5 then
                                        break
                                    end
                                    task.wait(0.1)
                                end
                                if CanSpawnToy.Value then
                                    local currentHRP = HRP()
                                    if currentHRP then
                                        task.spawn(function()
                                            pcall(function()
                                                spawntoy(
                                                    "NinjaShuriken",
                                                    currentHRP.CFrame * CFrame.new(0, 12, 20),
                                                    Vector3.new(0, 0, 0)
                                                )
                                            end)
                                        end)
                                    end
                                    if isHome and homeFolder then
                                        spawnedTarget = homeFolder:WaitForChild("NinjaShuriken", 2)
                                    elseif not service.Workspace.PlotItems.PlayersInPlots:FindFirstChild(localPlayer.Name) and inv then
                                        spawnedTarget = inv:WaitForChild("NinjaShuriken", 2)
                                    end
                                end
                                kunai = spawnedTarget
                                if kunai == nil then
                                    continue
                                end
                                kunai.Name = "AntiKick"
                                if kunai and kunai:FindFirstChild("StickyPart") then
                                    local currentHRP = HRP()
                                    if currentHRP then
                                        if kunai:FindFirstChild("SoundPart") then
                                            if not kunai.SoundPart:FindFirstChild("PartOwner") or kunai.SoundPart.PartOwner.Value ~= localPlayer.Name then
                                                SetNetworkOwner:FireServer(kunai.SoundPart, kunai.SoundPart.CFrame)
                                            end
                                        end
                                        local firePart = currentHRP:FindFirstChild("FirePlayerPart") or currentHRP:WaitForChild("FirePlayerPart", 5)
                                        if firePart then
                                            StickyPartEvent:FireServer(
                                                kunai.StickyPart,
                                                firePart,
                                                CFrame.new(0, 0, 0) * CFrame.Angles(0, math.rad(90), math.rad(90))
                                            )
                                        end
                                        for _, obj in pairs(kunai:GetChildren()) do
                                            if obj:IsA("BasePart") then
                                                obj.CanTouch = false
                                                obj.CanCollide = false
                                                obj.CanQuery = false
                                                obj.Transparency = 1
                                            end
                                        end
                                        local stickyPart = kunai.StickyPart
                                        if stickyPart and not stickyPart:FindFirstChild("KunaiPNG_GUI") then
                                            local gui = Instance.new("BillboardGui")
                                            gui.Name = "KunaiPNG_GUI"
                                            gui.Adornee = stickyPart
                                            gui.AlwaysOnTop = true
                                            gui.Size = UDim2.new(1.2, 0, 1.2, 0)
                                            gui.DistanceUpperLimit = 1000
                                            gui.Parent = stickyPart
                                            local img = Instance.new("ImageLabel")
                                            img.Size = UDim2.fromScale(1, 1)
                                            img.BackgroundTransparency = 1
                                            img.Image = "rbxassetid://89062714375517"
                                            img.Parent = gui
                                        end
                                    end
                                end
                            end
                        end
                    end
                    if not kunai then
                        if service.Workspace.PlotItems.PlayersInPlots:FindFirstChild(localPlayer.Name) then
                            continue
                        end
                        local t = tick()
                        local spawnedTarget = nil
                        while not CanSpawnToy.Value do
                            if not Config.AntikickT or tick() - t > 5 then
                                break
                            end
                            task.wait(0.1)
                        end
                        if CanSpawnToy.Value then
                            local currentHRP = HRP()
                            if currentHRP then
                                task.spawn(function()
                                    pcall(function()
                                        spawntoy(
                                            "NinjaShuriken",
                                            currentHRP.CFrame * CFrame.new(0, 12, 20),
                                            Vector3.new(0, 0, 0)
                                        )
                                    end)
                                end)
                            end
                            if isHome and homeFolder then
                                spawnedTarget = homeFolder:WaitForChild("NinjaShuriken", 2)
                            elseif not service.Workspace.PlotItems.PlayersInPlots:FindFirstChild(localPlayer.Name) and inv then
                                spawnedTarget = inv:WaitForChild("NinjaShuriken", 2)
                            end
                        end
                        kunai = spawnedTarget
                        if kunai == nil then
                            continue
                        end
                        kunai.Name = "AntiKick"
                        if not kunai then
                            continue
                        end
                    end
                    repeat
                        if kunai
                            and kunai:FindFirstChild("StickyPart")
                            and kunai.StickyPart.CanTouch == true then
                            if kunai:FindFirstChild("StickyPart") then
                                local currentHRP = HRP()
                                if currentHRP then
                                    if kunai:FindFirstChild("SoundPart") then
                                        if not kunai.SoundPart:FindFirstChild("PartOwner") or kunai.SoundPart.PartOwner.Value ~= localPlayer.Name then
                                            SetNetworkOwner:FireServer(kunai.SoundPart, kunai.SoundPart.CFrame)
                                        end
                                    end
                                    local firePart = currentHRP:FindFirstChild("FirePlayerPart") or currentHRP:WaitForChild("FirePlayerPart", 5)
                                    if firePart then
                                        StickyPartEvent:FireServer(
                                            kunai.StickyPart,
                                            firePart,
                                            CFrame.new(0, 0, 0) * CFrame.Angles(0, math.rad(90), math.rad(90))
                                        )
                                    end
                                    for _, obj in pairs(kunai:GetChildren()) do
                                        if obj:IsA("BasePart") then
                                            obj.CanTouch = false
                                            obj.CanCollide = false
                                            obj.CanQuery = false
                                            obj.Transparency = 1
                                        end
                                    end
                                    local stickyPart = kunai.StickyPart
                                    if stickyPart and not stickyPart:FindFirstChild("KunaiPNG_GUI") then
                                        local gui = Instance.new("BillboardGui")
                                        gui.Name = "KunaiPNG_GUI"
                                        gui.Adornee = stickyPart
                                        gui.AlwaysOnTop = true
                                        gui.Size = UDim2.new(1.2, 0, 1.2, 0)
                                        gui.DistanceUpperLimit = 1000
                                        gui.Parent = stickyPart
                                        local img = Instance.new("ImageLabel")
                                        img.Size = UDim2.fromScale(1, 1)
                                        img.BackgroundTransparency = 1
                                        img.Image = "rbxassetid://89062714375517"
                                        img.Parent = gui
                                    end
                                end
                            end
                            kunai.Name = "AntiKick"
                        end
                        task.wait(0.3)
                    until not kunai
                        or not Config.AntikickT
                        or not kunai:FindFirstChild("StickyPart")
                        or kunai.StickyPart.CanTouch == false
                        or not localPlayer.Character
                        or not localPlayer.Character:FindFirstChild("HumanoidRootPart")
                        or not kunai:FindFirstChild("StickyPart")
                        or (localPlayer.Character.HumanoidRootPart.Position - kunai.StickyPart.Position).Magnitude >= 20
                    if not kunai
                        or not kunai:FindFirstChild("StickyPart")
                        or not localPlayer.Character
                        or not localPlayer.Character:FindFirstChild("HumanoidRootPart")
                        or (localPlayer.Character.HumanoidRootPart.Position - kunai.StickyPart.Position).Magnitude >= 20 then
                        local targetInv = workspace:FindFirstChild(localPlayer.Name .. "SpawnedInToys")
                        if targetInv and DestroyToy then
                            for _, v in pairs(targetInv:GetChildren()) do
                                if v.Name == "AntiKick" or v.Name == "NinjaShuriken" then
                                    pcall(function()
                                        DestroyToy:FireServer(v)
                                    end)
                                end
                            end
                        end
                    end
                    pcall(function()
                        repeat
                            task.wait(0.05)
                        until not Config.AntikickT
                            or not localPlayer.Character
                            or not localPlayer.Character:FindFirstChild("Humanoid")
                            or not kunai
                            or not kunai:FindFirstChild("StickyPart")
                            or not kunai.StickyPart:FindFirstChild("StickyWeld")
                            or not kunai.StickyPart.StickyWeld.Part1
                        if not kunai
                            or not kunai:FindFirstChild("StickyPart")
                            or (localPlayer.Character
                                and localPlayer.Character:FindFirstChild("Humanoid")
                                and localPlayer.Character.Humanoid.Health <= 0)
                            or not kunai.StickyPart:FindFirstChild("StickyWeld")
                            or not kunai.StickyPart.StickyWeld.Part1 then
                            local targetInv = workspace:FindFirstChild(localPlayer.Name .. "SpawnedInToys")
                            if targetInv and DestroyToy then
                                for _, v in pairs(targetInv:GetChildren()) do
                                    if v.Name == "AntiKick" or v.Name == "NinjaShuriken" then
                                        pcall(function()
                                            DestroyToy:FireServer(v)
                                        end)
                                    end
                                end
                            end
                        end
                    end)
                end
            end)
        else
            Config.AntikickT = false
            local targetInv = workspace:FindFirstChild(localPlayer.Name .. "SpawnedInToys")
            if targetInv and DestroyToy then
                for _, v in pairs(targetInv:GetChildren()) do
                    if v.Name == "AntiKick" or v.Name == "NinjaShuriken" then
                        pcall(function()
                            DestroyToy:FireServer(v)
                        end)
                    end
                end
            end
        end
    end
})

antikick:AddToggle("AntikickPenc", {
    Text = "アンチキック (鉛筆✏)",
    Default = false,
    Callback = function(Value)
        Config.Tinko = Value
        if Config.Tinko then
            while Config.Tinko do
                local spawnedFolder = service.Workspace:FindFirstChild(localPlayer.Name .. "SpawnedInToys")
                while Config.Tinko and spawnedFolder and not spawnedFolder:FindFirstChild("PencilDDD") do
                    if localPlayer.Character and localPlayer.Character:FindFirstChild("HumanoidRootPart") then
                        local existingObjects = {}
                        for _, child in pairs(spawnedFolder:GetChildren()) do
                            existingObjects[child] = true
                        end
						spawntoy(
							"ToolPencil",
							CFrame.new(localPlayer.Character.HumanoidRootPart.CFrame.Position) + Vector3.new(0, 0, 15),
							Vector3.new(0, 0, 0)
						)
                        local newPencil = nil
                        local startTime = tick()
                        repeat
                            for _, child in pairs(spawnedFolder:GetChildren()) do
                                if not existingObjects[child] and child.Name == "ToolPencil" then
                                    newPencil = child
                                    break
                                end
                            end
                            task.wait()
                        until newPencil or (tick() - startTime > 2) or not Config.Tinko
                        if newPencil then
                            newPencil.Name = "PencilDDD"
                        end
                    end
                    task.wait()
                end
                if localPlayer.Character then
                    if localPlayer.Character:FindFirstChild("Torso") and localPlayer.Character:FindFirstChild("HumanoidRootPart") and spawnedFolder and spawnedFolder:FindFirstChild("PencilDDD") then
                        local pencil = spawnedFolder.PencilDDD
                        if pencil:FindFirstChild("StickyPart") then
                            if pencil.StickyPart:FindFirstChild("StickyWeld") then
                                if pencil.StickyPart.StickyWeld.Part1 ~= localPlayer.Character.Torso then
                                    local a = pencil.SoundPart.CFrame.Position
                                    local b = localPlayer.Character.HumanoidRootPart.CFrame.Position
                                    local distance = Vector3.new((a.X - b.X) ^ 2, (a.Y - b.Y) ^ 2, (a.Z - b.Z) ^ 2)
                                    if math.sqrt(distance.X + distance.Y + distance.Z) > 20 then
                                        DestroyToy:FireServer(pencil)
                                    else
                                        StickyPartEvent:FireServer(pencil.StickyPart, localPlayer.Character.Torso, CFrame.new(0, - 1, 0) * CFrame.Angles(0, math.pi, 0))
                                        for _, prt in pairs(pencil:GetChildren()) do
                                            if prt.ClassName == "Part" then
                                                prt.CanQuery = false
                                            end
                                        end
                                        task.wait(0.2)
                                        if localPlayer.Character then
                                            if localPlayer.Character:FindFirstChild("Torso") and localPlayer.Character:FindFirstChild("HumanoidRootPart") and spawnedFolder:FindFirstChild("PencilDDD") then
                                                if pencil:FindFirstChild("StickyPart") then
                                                    if pencil.StickyPart:FindFirstChild("StickyWeld") then
                                                        if pencil.StickyPart.StickyWeld.Part1 ~= localPlayer.Character.Torso then
                                                            if spawnedFolder:FindFirstChild("PencilDDD") then
                                                                if pencil.StickyPart.StickyWeld.Part1 ~= localPlayer.Character.Torso then
                                                                    SetNetworkOwner:FireServer(pencil.SoundPart, pencil.SoundPart.CFrame)
                                                                end
                                                            end
                                                        end
                                                    end
                                                end
                                            end
                                        end
                                    end
                                end
                            end
                        end
                    end
                end
                task.wait()
            end
        else
            local spawnedFolder = service.Workspace:FindFirstChild(localPlayer.Name .. "SpawnedInToys")
            if spawnedFolder then
                local dddPencil = spawnedFolder:FindFirstChild("PencilDDD")
                if dddPencil then
                    DestroyToy:FireServer(dddPencil)
                end
            end
        end
    end,
})

antikick:AddToggle("Antireset", {
	Text = "自動リセット",
    Default = true,
    Callback = function(Value)
        Config.AntikickResetToggle = Value
        if Config.AntikickResetToggle then
            Config.Contuuti['GameNotify'] = GameCorrectionsNotify.OnClientEvent:Connect(function(actionType)
                if actionType == "Flying" then
                    Struggle:FireServer(localPlayer)
                    local parent = GetCharacter()
                    local childName = "Humanoid"
                    local humanoid = parent:FindFirstChild(childName) or parent:WaitForChild(childName, nil)
                    if humanoid then
                        humanoid.Health = 0
                    end
                end
            end)
        else
            local playname = "GameNotify"
            for connectionName, connection in Config.Contuuti do
                if connectionName:find(playname) then
                    connection:Disconnect()
                    connection = nil
                end
            end
        end
    end
})

antikick:AddToggle("Antileave", {
	Text = "自動退出",
    Default = false,
    Callback = function(Value)
        Config.AntikickLeaveToggle = Value
        if Config.AntikickLeaveToggle then
            Config.Contuuti['GameLeaveNotify'] = GameCorrectionsNotify.OnClientEvent:Connect(function(actionType)
                if actionType == "Flying" then
                    localPlayer:Kick("切断してBANを防ぎました。[by: Vortex]")
                end
            end)
        else
            local localname = "GameLeaveNotify"
            for connectionName, connection in Config.Contuuti do
                if connectionName:find(localname) then
                    connection:Disconnect()
                    connection = nil
                end
            end
        end
    end
})

antikick:AddToggle("AntiEnable", {
	Text = "自動有効化",
    Default = true,
    Callback = function(Value)
        Config.AutoTurnOnAntiKick = Value
        if Config.AutoTurnOnAntiKick then
            Config.Contuuti['AntiKickAutoOn'] = GameCorrectionsNotify.OnClientEvent:Connect(function(actionType)
                if actionType == "Flying" then
                    if not Config.antikick and Config.AntiKickToggle then
                        Config.AntiKickToggle:Set(true)
                    end
                end
            end)
        else
            if Config.Contuuti['AntiKickAutoOn'] then
                Config.Contuuti['AntiKickAutoOn']:Disconnect()
                Config.Contuuti['AntiKickAutoOn'] = nil
            end
        end
    end
})

	-- ===== 分割8: Target タブ =====
local function runTPPLoop()
	task.spawn(function()
		while Config.TargetAntigrabtpT do
			local HRP = HRP()
			service.RunService.RenderStepped:Wait()
			if #Config.PlayerListAnti == 0 then 
				continue
			end
			for _, targetName in ipairs(Config.PlayerListAnti) do
				target = service.Players:FindFirstChild(targetName)
				if not target or not target.Character then
					continue
				end
				char = target.Character
				hrp = char:FindFirstChild("HumanoidRootPart")
				head = char:FindFirstChild("Head")
				if not hrp or not head then
					continue
				end
				partOwner = head:FindFirstChild("PartOwner")
				if not partOwner or partOwner.Value == "" or partOwner.Value == localPlayer.Name then
					continue
				end
				distance = (hrp.Position - HRP.Position).Magnitude
				if distance <= 30 then
					pcall(function()
						SetNetworkOwner:FireServer(hrp, hrp.CFrame)
						CreateGrabLine:FireServer(hrp, Vector3.zero, hrp.Position, false)
					end)
					weOwnIt = head:FindFirstChild("PartOwner") and head.PartOwner.Value == localPlayer.Name
					if weOwnIt then
						if Config.tpmode == "Bring" then
							hrp.CFrame = HRP.CFrame * CFrame.new(0, 5, 0)
							hrp.AssemblyLinearVelocity = Vector3.zero
							hrp.AssemblyAngularVelocity = Vector3.zero
						end
						pcall(function()
							DestroyGrabLine:FireServer(hrp)
						end)
					end
				else
					saved = HRP.CFrame
					HRP.CFrame = hrp.CFrame * CFrame.new(0, 0, 2)
					task.wait(0.05)
					for i = 1, 15 do
						pcall(function()
							SetNetworkOwner:FireServer(hrp, hrp.CFrame)
							CreateGrabLine:FireServer(hrp, Vector3.zero, hrp.Position, false)
						end)
						task.wait(0.01)
					end
					weOwnIt = head:FindFirstChild("PartOwner") and head.PartOwner.Value == localPlayer.Name
					if weOwnIt then
						if Config.tpmode == "Bring" then
							hrp.CFrame = saved * CFrame.new(0, 5, 0)
							hrp.AssemblyLinearVelocity = Vector3.zero
							hrp.AssemblyAngularVelocity = Vector3.zero
							task.wait(0.05)
						end
						pcall(function()
							DestroyGrabLine:FireServer(hrp)
						end)
					end
					HRP.CFrame = saved
					HRP.AssemblyLinearVelocity = Vector3.zero
					HRP.AssemblyAngularVelocity = Vector3.zero
				end
			end
		end
	end)
end

local Tar = dadadadad:AddPlayersDropdown("TargetSelect1", {
    Text = "対象選択",
    Multi = false,
    ExcludeLocalPlayer = true,
    Searchable = false,
    EnablePlayerImages = true,
    Callback = function(player)
        if player then
            Config.PlayerListAnti = { player.Name }
        else
            Config.PlayerListAnti = {}
        end
    end,
})

dadadadad:AddDropdown("Config.tpmode", {
	Text = "方法",
	Values = {"Grab", "Bring"},
	Default = "Grab",
	Callback = function(v)
		Config.tpmode = v
	end
})

dadadadad:AddToggle("TPPEnabled", {
	Text = "アンチグラブ",
	Default = false,
	Callback = function(v)
		Config.TargetAntigrabtpT = v
		if v then
			runTPPLoop()
		end
	end
})

dadadadad:AddToggle("TPPAntiKick", {
	Text = "アンチキック",
	Default = false,
	Callback = function(v)
		if not v then
			for _, targetName in ipairs(Config.PlayerListAnti) do
				target = service.Players:FindFirstChild(targetName)
				if target then
					targetInv = service.Workspace:FindFirstChild(target.Name .. "SpawnedInToys")
					if targetInv and targetInv:FindFirstChild("TPPShuriken_" .. targetName) then
						pcall(function() DestroyToy:FireServer(targetInv["TPPShuriken_" .. targetName]) end)
					end
				end
			end
			return
		end
		task.spawn(function()
			shurikens = {}
			setupDone = {}
			while Toggles.TPPAntiKick.Value do
				service.RunService.RenderStepped:Wait()
				if #Config.PlayerListAnti == 0 then
					continue
				end
				for _, targetName in ipairs(Config.PlayerListAnti) do 
					pcall(function()
						target = service.Players:FindFirstChild(targetName)
						if not target or not target.Character then
							setupDone[targetName] = false
							return
						end
						targetChar = target.Character
						targetHRP = targetChar:FindFirstChild("HumanoidRootPart")
						targetFirePart = targetHRP and targetHRP:FindFirstChild("FirePlayerPart")

						if not targetHRP or not targetFirePart then
							return
						end
						myChar = localPlayer.Character
						myHRP = myChar and myChar:FindFirstChild("HumanoidRootPart")
						if myHRP then
							dist = (targetHRP.Position - myHRP.Position).Magnitude
							if dist > 30 then
								setupDone[targetName] = false
								return
							end
						end
						targetInv = service.Workspace:FindFirstChild(target.Name .. "SpawnedInToys")
						if not targetInv then
							return
						end
						shuName = "TPPShuriken_" .. targetName
						shuData = shurikens[targetName]
						shu = shuData and shuData.toy
						part = shuData and shuData.part
						shuExists = shu and shu.Parent ~= nil
						partExists = part and part.Parent ~= nil
						if setupDone[targetName] and (not shuExists or not partExists) then
							setupDone[targetName] = false
							shurikens[targetName] = nil
						end
						if not setupDone[targetName] then
							if not target.CanSpawnToy or not target.CanSpawnToy.Value then
								return
							end
							local function spawntoy(toy, cf)
								if not localPlayer.CanSpawnToy.Value then
									localPlayer.CanSpawnToy.Changed:Wait()
								end
								local t
								local toyadded
								inv = service.Workspace:FindFirstChild(localPlayer.Name .. "SpawnedInToys")
								toyadded = inv.ChildAdded:Connect(function(c)
									if c.Name == toy then
										t = c
										toyadded:Disconnect()
									end
								end)
								task.spawn(function()
									SpawnToyRemoteFunction:InvokeServer(toy, cf, Vector3.new(0, 0, 0))
								end)
								time = tick() + 1
								repeat task.wait() until t or tick() > time
								if t then
									return t
								else
									return nil
								end
							end
							shu = spawntoy("NinjaShuriken", targetHRP.CFrame * CFrame.new(5, 10, 20))
							if not shu then
								return
							end
							shu.Name = shuName
							part = shu:WaitForChild("StickyPart", 0.5)
							if not part then
								return
							end
							SetNetworkOwner:FireServer(part, part.CFrame)
							task.wait(0.1)
							StickyPartEvent:FireServer(part, targetFirePart, CFrame.new(0, 0, 0, 1, 0, 0, 0, 0, -1, 0, 1, 0))
							shurikens[targetName] = {
								toy = shu,
								part = part,
							}
							setupDone[targetName] = true
						end
						if part and part:FindFirstChild("PartOwner") and part.PartOwner.Value ~= localPlayer.Name then
							SetNetworkOwner:FireServer(part, part.CFrame)
						end
						for _, toy in ipairs(targetInv:GetChildren()) do
							if toy:FindFirstChild("StickyPart") then
								sp = toy.StickyPart
								po = sp:FindFirstChild("PartOwner")
								sw = sp:FindFirstChild("StickyWeld")
								if po and po.Value ~= "" and po.Value ~= target.Name then
									SetNetworkOwner:FireServer(sp, sp.CFrame)
									task.wait()
									if po.Value == localPlayer.Name then
										sp.CFrame = CFrame.new(0, 0/0, 0)
									end
								end
								if sw and sw.Part1 then
									weldParent = sw.Part1.Parent
									if weldParent and weldParent ~= targetChar then
										SetNetworkOwner:FireServer(sp, sp.CFrame)
										task.wait()
										if po and po.Value == localPlayer.Name then
											sp.CFrame = CFrame.new(0, 0/0, 0)
										end
									end
								end
							end
						end
					end)
				end
			end
			for targetName, data in pairs(shurikens) do
				pcall(function()
					if data.toy then
						DestroyToy:FireServer(data.toy)
					end
				end)
			end
			shurikens = {}
			setupDone = {}
		end)
	end
})


local TargetDropdown = Targ:AddPlayersDropdown("TargetSelect", {
    Text = "対象選択",
    Multi = false,
    ExcludeLocalPlayer = true,
    Searchable = false,
    EnablePlayerImages = true,
    Callback = function(player)
        if player then
            Config.PlayerList = { player.Name }
        else
            Config.PlayerList = {}
        end
    end,
})

spamde:AddToggle("KickspamRag", {
    Text = "キックスパム(ラグドール&ラグ)",
    Default = false,
    Callback = function(aa61)
        Config.aa6 = aa61
        Config.aa13 = aa61
        if aa61 then
            if not Config.PlayerList or #Config.PlayerList == 0 then
                task.spawn(function()
                    Toggles.KickspamRag:SetValue(false)
                end)
                return
            end
        end
        
        local function aa31(aa32, aa33, aa34)
            return aa32:FindFirstChild(aa33) or aa32:WaitForChild(aa33, aa34 or 5)
        end
        
        local function aa35(aa36)
            if aa36 and aa36:IsA("BasePart") then
                SetNetworkOwner:FireServer(aa36, aa36.CFrame)
                task.wait()
            end
        end
        
        local function aa37(aa38, aa39)
            return aa38:FindFirstChild(aa39) ~= nil
        end
        
        local function aa40(aa41)
            local aa42 = GetCharacter()
            local aa43 = aa42:WaitForChild("HumanoidRootPart")
            local waitCount = 0
            while (localPlayer.InPlot.Value and not localPlayer.InOwnedPlot.Value) and waitCount < 50 do
                task.wait(0.1)
                waitCount = waitCount + 1
            end
            waitCount = 0
            while not localPlayer.CanSpawnToy.Value and waitCount < 50 do
                task.wait(0.1)
                waitCount = waitCount + 1
            end
            local aa44 = aa43.CFrame * CFrame.new(0, 14, 20)
            local aa45 = workspace:FindFirstChild(localPlayer.Name.."SpawnedInToys")
            if not aa45 then
                aa45 = workspace:FindFirstChild("PlotItems")
                if aa45 then
                    aa45 = aa45:FindFirstChild("Plot1")
                end
            end
            if not aa45 then
                aa45 = workspace
            end
            local aa46 = nil
            local aa47 = aa45.ChildAdded:Connect(function(aa48)
                if aa48.Name == aa41 then
                    aa46 = aa48
                end
            end)
            task.spawn(function()
                pcall(function()
                    spawntoy(aa41, aa44, Vector3.zero)
                end)
            end)
            local aa49 = tick()
            repeat task.wait(0.05) until aa46 or (tick() - aa49) > 5
            aa47:Disconnect()
            return aa46
        end
        
        local function aa50()
            if Config.aa17 then return nil end
            Config.aa17 = true
            local aa51 = aa40("PalletLightBrown")
            if not aa51 then
                Config.aa17 = false
                return nil
            end
            local aa52 = aa31(aa51, "SoundPart", 3)
            if not aa52 then
                aa51:Destroy()
                Config.aa17 = false
                return nil
            end
            local retryCount = 0
            while retryCount < 10 do
                if not Config.aa13 then
                    aa51:Destroy()
                    Config.aa17 = false
                    return nil
                end
                aa35(aa52)
                task.wait()
                if aa37(aa52, "PartOwner") then
                    break
                end
                retryCount = retryCount + 1
            end
            if not aa37(aa52, "PartOwner") then
                aa51:Destroy()
                Config.aa17 = false
                return nil
            end
            for _, aa54 in pairs(aa51:GetDescendants()) do
                if aa54:IsA("BasePart") then
                    aa54.CanCollide = false
                    aa54.Transparency = 0.8
                end
            end
            aa51.Name = "RagdollPalete"
            local aa55 = Instance.new("BodyVelocity")
            aa55.MaxForce = Vector3.new(0, math.huge, 0)
            aa55.Velocity = Vector3.new(0, 900, 0)
            aa55.Parent = aa52

            Config.aa17 = false
            return aa51
        end
        
        local function aa25(aa26, aa27)
            if not aa26.Character then return end
            local aa28 = aa26.Character:FindFirstChild("HumanoidRootPart")
            if not aa28 or not aa27 then return end
            local aa29 = aa27.CFrame
            aa27.CFrame = aa28.CFrame * CFrame.new(0, 0, 2)
            for aa30 = 1, 15 do
                SetNetworkOwner:FireServer(aa28, aa28.CFrame)
                task.wait()
            end
            aa27.CFrame = aa29
        end
        
        local function startLagSpam()
            if Config.running then return end
            if not Config.PlayerList or #Config.PlayerList == 0 then return end
            if not CreateGrabLine then
                CreateGrabLine = Events.GrabEvents:WaitForChild("CreateGrabLine", 3)
                if not CreateGrabLine then return end
            end
            Config.running = true
            task.spawn(function()
                while Config.running do
                    local spawnLocation = service.Workspace:FindFirstChild("SpawnLocation")
                        or service.Workspace:FindFirstChild("Spawn")
                        or (localPlayer.Character and localPlayer.Character:FindFirstChild("HumanoidRootPart"))

                    if spawnLocation then
                        CreateGrabLine:FireServer(spawnLocation, CFrame.new(math.random(-2010000000, 2000000001), 0, math.random(-2008100000, 2000200000)))
                    end
                    task.wait(0.001)
                end
            end)
        end
        
        local function stopLagSpam()
            if not Config.running then return end
            Config.running = false
        end
        
        if aa61 then
            if not Config.PlayerList or #Config.PlayerList == 0 then
                return
            end
            task.wait(0.5)
            task.defer(function()
                startLagSpam()
            end)
        else
            stopLagSpam()
        end
        if Config.aa6 then
            task.spawn(function()
                while Config.aa6 do
                    local targets = type(Config.PlayerList) == "table" and Config.PlayerList or {Config.PlayerList}
                    for _, targetName in ipairs(targets) do
                        local aa62 = service.Players:FindFirstChild(targetName)
                        local aa63 = localPlayer.Character
                        local aa64 = aa63 and aa63:FindFirstChild("HumanoidRootPart")
                        if aa62 and aa64 then
                            local aa65 = aa62.Character
                            local aa66 = aa65 and aa65:FindFirstChild("HumanoidRootPart")
                            if aa66 then
                                local aa67 = (aa64.Position - aa66.Position).Magnitude
                                if aa67 > Config.aa9 then
                                    aa25(aa62, aa64)
                                end
                                SetNetworkOwner:FireServer(aa66, aa66.CFrame)
                                if DestroyGrabLine then
                                    DestroyGrabLine:FireServer(aa66)
                                end
                                aa66.AssemblyLinearVelocity = Vector3.zero
                                aa66.AssemblyAngularVelocity = Vector3.zero
                                local aa68 = aa66:FindFirstChild("ControlBP")
                                if not aa68 then
                                    aa68 = Instance.new("BodyPosition")
                                    aa68.Name = "ControlBP"
                                    aa68.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
                                    aa68.P = 800000
                                    aa68.Parent = aa66
                                end
                                aa68.Position = aa64.Position + Vector3.new(0, 15, 0)
                            end
                        end
                    end
                    task.wait(0.001)
                end
                local targets = type(Config.PlayerList) == "table" and Config.PlayerList or {Config.PlayerList}
                for _, targetName in ipairs(targets) do
                    local aa69 = service.Players:FindFirstChild(targetName)
                    if aa69 and aa69.Character then
                        local aa70 = aa69.Character:FindFirstChild("HumanoidRootPart")
                        if aa70 and aa70:FindFirstChild("ControlBP") then
                            aa70.ControlBP:Destroy()
                        end
                    end
                end
            end)
        end
        if aa61 then
            local aa71 = workspace:FindFirstChild(localPlayer.Name.."SpawnedInToys")
            local aa72 = nil
            Config.aa73 = service.RunService.RenderStepped:Connect(function()
                if not Config.aa13 then return end
                if not Config.PlayerList or #Config.PlayerList == 0 then return end
                local targets = type(Config.PlayerList) == "table" and Config.PlayerList or {Config.PlayerList}
                local targetName = targets[1]
                if not targetName then return end
                local aa74 = service.Players:FindFirstChild(targetName)
                if not aa74 or not aa74.Character then return end
                local aa75 = aa74.Character:FindFirstChild("HumanoidRootPart")
                local aa76 = aa74.Character:FindFirstChild("Humanoid")
                if not aa75 or not aa76 then return end
                if aa72 and aa72:IsDescendantOf(workspace) then
                    local aa77 = aa72:FindFirstChild("SoundPart")
                    if aa77 then
                        if not aa37(aa77, "PartOwner") then
                            aa72:Destroy()
                            aa72 = nil
                        end
                    else
                        aa72:Destroy()
                        aa72 = nil
                    end
                end
                if not Config.aa17 and (not aa72 or not aa72:IsDescendantOf(workspace)) then
                    aa72 = aa71 and aa71:FindFirstChild("RagdollPalete") or aa50()
                end
                if aa72 and aa72:FindFirstChild("SoundPart") then
                    local aa78 = aa76:FindFirstChild("Ragdolled")
                    if aa78 and not aa78.Value then
                        aa72.SoundPart.Position = aa75.Position
                    end
                end
            end)
        else
            if Config.aa73 then
                Config.aa73:Disconnect()
                Config.aa73 = nil
            end
        end
    end
})
