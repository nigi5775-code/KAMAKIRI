--[[ KAMAKIRI HUB | FTAP | Key: prayingmantis | Credit: R_8y ]]

local Players = game:GetService("Players")
local SG = game:GetService("StarterGui")
local RS = game:GetService("RunService")
local UIS = game:GetService("UserInputService")
local TW = game:GetService("TweenService")
local CG = game:GetService("CoreGui")
local WS = game:GetService("Workspace")
local TCS = game:GetService("TextChatService")
local RepS = game:GetService("ReplicatedStorage")
local Debris = game:GetService("Debris")
local LP = Players.LocalPlayer

local BG = Color3.fromRGB(15,15,20)
local AC = Color3.fromRGB(0,255,100)
local PANEL = Color3.fromRGB(25,25,32)
local TEXT_C = Color3.fromRGB(255,255,255)
local SUB_C = Color3.fromRGB(170,170,180)

local function Notify(t,x,d) SG:SetCore("SendNotification",{Title=t,Text=x,Duration=d}) end

local function getGui()
    local g = Instance.new("ScreenGui")
    g.ResetOnSpawn = false
    g.IgnoreGuiInset = true
    g.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    local ok = pcall(function() g.Parent = CG end)
    if not ok then g.Parent = LP:WaitForChild("PlayerGui") end
    return g
end

local function sendChat(m)
    if TCS.ChatVersion == Enum.ChatVersion.TextChatService then
        local ch = TCS:FindFirstChild("TextChannels")
        if ch then
            local gen = ch:FindFirstChild("RBXGeneral")
            if gen then pcall(function() gen:SendAsync(m) end) return end
        end
    end
    local ev = RepS:FindFirstChild("DefaultChatSystemChatEvents")
    if ev and ev:FindFirstChild("SayMessageRequest") then
        ev.SayMessageRequest:FireServer(m, "All")
    end
end

sendChat("KAMAKIRI hub Deepseek by gimini")
task.wait(1.2)

for _, n in ipairs({"KAMAKIRI_KEY","KAMAKIRI_HUB","KAMAKIRI_Splash"}) do
    local a = CG:FindFirstChild(n) if a then a:Destroy() end
    local b = LP:WaitForChild("PlayerGui"):FindFirstChild(n) if b then b:Destroy() end
end

local KG = getGui() KG.Name = "KAMAKIRI_KEY"
local KF = Instance.new("Frame")
KF.Size = UDim2.new(0,300,0,180)
KF.Position = UDim2.new(0.5,-150,0.5,-90)
KF.BackgroundColor3 = BG
KF.BorderSizePixel = 0
KF.Active = true
KF.Draggable = true
KF.Parent = KG
local c1 = Instance.new("UICorner") c1.CornerRadius = UDim.new(0,12) c1.Parent = KF
local s1 = Instance.new("UIStroke") s1.Color = AC s1.Thickness = 1.5 s1.Parent = KF

local KT = Instance.new("TextLabel")
KT.Size = UDim2.new(1,0,0,40)
KT.Position = UDim2.new(0,0,0,10)
KT.BackgroundTransparency = 1
KT.Text = "KAMAKIRI HUB"
KT.TextColor3 = AC
KT.TextSize = 22
KT.Font = Enum.Font.GothamBlack
KT.Parent = KF

local KS = Instance.new("TextLabel")
KS.Size = UDim2.new(1,0,0,20)
KS.Position = UDim2.new(0,0,0,50)
KS.BackgroundTransparency = 1
KS.Text = "キーを入力してください"
KS.TextColor3 = SUB_C
KS.TextSize = 13
KS.Font = Enum.Font.Gotham
KS.Parent = KF

local KB = Instance.new("TextBox")
KB.Size = UDim2.new(1,-40,0,40)
KB.Position = UDim2.new(0,20,0,80)
KB.BackgroundColor3 = PANEL
KB.BorderSizePixel = 0
KB.PlaceholderText = "Key..."
KB.Text = ""
KB.TextColor3 = TEXT_C
KB.PlaceholderColor3 = SUB_C
KB.TextSize = 14
KB.Font = Enum.Font.Gotham
KB.ClearTextOnFocus = false
KB.Parent = KF
local c2 = Instance.new("UICorner") c2.CornerRadius = UDim.new(0,8) c2.Parent = KB
local s2 = Instance.new("UIStroke") s2.Color = AC s2.Thickness = 1 s2.Parent = KB

local Kbtn = Instance.new("TextButton")
Kbtn.Size = UDim2.new(1,-40,0,40)
Kbtn.Position = UDim2.new(0,20,0,130)
Kbtn.BackgroundColor3 = AC
Kbtn.BorderSizePixel = 0
Kbtn.Text = "認証"
Kbtn.TextColor3 = Color3.fromRGB(0,0,0)
Kbtn.TextSize = 15
Kbtn.Font = Enum.Font.GothamBold
Kbtn.Parent = KF
local c3 = Instance.new("UICorner") c3.CornerRadius = UDim.new(0,8) c3.Parent = Kbtn
-- アンチ変数
local antiGrabActive, antiGrabConn, antiGrabTripConns = false, nil, {}
local antiRagdollEnabled, antiRagdollConns = false, {}
local antiBlobmanActive, antiBlobmanTask = false, nil
local antiExplosionEnabled, antiExplosionConn = false, nil
local antiFireEnabled = false
local antiKickEnabled = false
local antiKickConn = nil
-- Anti Fire 実際の処理
task.spawn(function()
    local map = WS:WaitForChild("Map", 10)
    if not map then return end
    local hole = map:WaitForChild("Hole", 10)
    if not hole then return end
    local poison = hole:WaitForChild("PoisonBigHole", 10)
    if not poison then return end
    local ext = poison:WaitForChild("ExtinguishPart", 10)
    if not ext then return end
    
    local originalPos = ext.CFrame
    
    RS.Heartbeat:Connect(function()
        if antiFireEnabled then
            local char = LP.Character
            local root = char and char:FindFirstChild("HumanoidRootPart")
            if root then
                local isBurning = root:FindFirstChild("FireLight") or root:FindFirstChild("FireParticleEmitter")
                if isBurning then
                    ext.CFrame = root.CFrame
                else
                    if ext.CFrame ~= originalPos then ext.CFrame = originalPos end
                end
            end
        else
            if ext.CFrame ~= originalPos then ext.CFrame = originalPos end
        end
    end)
end)
local function antiGrabRecover(hum, root)
    if not (hum and root) then return end
    pcall(function()
        root.AssemblyLinearVelocity = Vector3.new(0,0,0)
        root.AssemblyAngularVelocity = Vector3.new(0,0,0)
        hum.PlatformStand = false
        hum:ChangeState(Enum.HumanoidStateType.Running)
    end)
end



local function protectRagdollHumanoid(humanoid)
    humanoid.BreakJointsOnDeath = false
    humanoid.AutoRotate = true
    humanoid.PlatformStand = false
    table.insert(antiRagdollConns, humanoid.HealthChanged:Connect(function(health)
        if antiRagdollEnabled and health <= 0 then humanoid.Health = 1 end
    end))
    table.insert(antiRagdollConns, humanoid:GetPropertyChangedSignal("PlatformStand"):Connect(function()
        if antiRagdollEnabled and humanoid.PlatformStand == true then humanoid.PlatformStand = false end
    end))
end

local function antiGrabSetup(char)
    for _, c in pairs(antiGrabTripConns) do c:Disconnect() end
    antiGrabTripConns = {}
    local hum = char:WaitForChild("Humanoid", 5)
    local root = char:WaitForChild("HumanoidRootPart", 5)
    if not (hum and root) then return end
    for _, st in ipairs({Enum.HumanoidStateType.FallingDown, Enum.HumanoidStateType.Ragdoll, Enum.HumanoidStateType.PlatformStanding}) do
        pcall(function() hum:SetStateEnabled(st, false) end)
    end
    table.insert(antiGrabTripConns, hum.StateChanged:Connect(function(_, new)
        if not antiGrabActive and (new == Enum.HumanoidStateType.FallingDown or new == Enum.HumanoidStateType.Ragdoll or new == Enum.HumanoidStateType.PlatformStanding) then
            antiGrabRecover(hum, root)
        end
    end))
end
local function setupAntiExplosion(character)
    if not antiExplosionEnabled then return end
    local hum = character:WaitForChild("Humanoid", 5)
    local partOwner = hum and hum:FindFirstChild("Ragdolled")
    if partOwner then
        if antiExplosionConn then antiExplosionConn:Disconnect() end
        antiExplosionConn = partOwner:GetPropertyChangedSignal("Value"):Connect(function()
            if not antiExplosionEnabled then return end
            for _, part in ipairs(character:GetChildren()) do
                if part:IsA("BasePart") then part.Anchored = partOwner.Value end
            end
        end)
    end
end

local done = false

local function launch()
    local SP = getGui() SP.Name = "KAMAKIRI_Splash"
    local sl = Instance.new("TextLabel")
    sl.Size = UDim2.new(1,0,0,100)
    sl.Position = UDim2.new(0,0,0.5,-50)
    sl.BackgroundTransparency = 1
    sl.Text = "KAMAKIRI HUB"
    sl.TextColor3 = AC
    sl.TextScaled = true
    sl.Font = Enum.Font.GothamBlack
    sl.TextTransparency = 1
    sl.Parent = SP
    TW:Create(sl, TweenInfo.new(0.6), {TextTransparency=0}):Play()
    task.wait(1.5)
    TW:Create(sl, TweenInfo.new(0.5), {TextTransparency=1}):Play()
    task.wait(0.6)
    SP:Destroy()

    local MG = getGui() MG.Name = "KAMAKIRI_HUB"
    local Main = Instance.new("Frame")
    Main.Size = UDim2.new(0,580,0,340)
    Main.Position = UDim2.new(0.5,-290,0.5,-170)
    Main.BackgroundColor3 = BG
    Main.BorderSizePixel = 0
    Main.Active = true
    Main.Draggable = true
    Main.Parent = MG
    local mc = Instance.new("UICorner") mc.CornerRadius = UDim.new(0,12) mc.Parent = Main
    local mst = Instance.new("UIStroke") mst.Color = AC mst.Thickness = 1.5 mst.Parent = Main

    local TB = Instance.new("Frame")
    TB.Size = UDim2.new(1,0,0,40)
    TB.BackgroundColor3 = PANEL
    TB.BorderSizePixel = 0
    TB.Parent = Main
    local tbc = Instance.new("UICorner") tbc.CornerRadius = UDim.new(0,12) tbc.Parent = TB

    local TT = Instance.new("TextLabel")
    TT.Size = UDim2.new(1,-100,1,0)
    TT.Position = UDim2.new(0,12,0,0)
    TT.BackgroundTransparency = 1
    TT.Text = "KAMAKIRI HUB"
    TT.TextColor3 = AC
    TT.TextSize = 18
    TT.Font = Enum.Font.GothamBold
    TT.TextXAlignment = Enum.TextXAlignment.Left
    TT.Parent = TB

    local MinB = Instance.new("TextButton")
    MinB.Size = UDim2.new(0,28,0,28)
    MinB.Position = UDim2.new(1,-70,0,6)
    MinB.BackgroundColor3 = AC
    MinB.BorderSizePixel = 0
    MinB.Text = "—"
    MinB.TextColor3 = Color3.fromRGB(0,0,0)
    MinB.TextSize = 20
    MinB.Font = Enum.Font.GothamBold
    MinB.Parent = TB
    local minc = Instance.new("UICorner") minc.CornerRadius = UDim.new(0,8) minc.Parent = MinB

    local ClsB = Instance.new("TextButton")
    ClsB.Size = UDim2.new(0,28,0,28)
    ClsB.Position = UDim2.new(1,-36,0,6)
    ClsB.BackgroundColor3 = AC
    ClsB.BorderSizePixel = 0
    ClsB.Text = "×"
    ClsB.TextColor3 = Color3.fromRGB(0,0,0)
    ClsB.TextSize = 20
    ClsB.Font = Enum.Font.GothamBold
    ClsB.Parent = TB
    local clsc = Instance.new("UICorner") clsc.CornerRadius = UDim.new(0,8) clsc.Parent = ClsB

    local TabS = Instance.new("ScrollingFrame")
    TabS.Size = UDim2.new(1,-12,0,40)
    TabS.Position = UDim2.new(0,6,0,46)
    TabS.BackgroundTransparency = 1
    TabS.BorderSizePixel = 0
    TabS.ScrollBarThickness = 3
    TabS.ScrollBarImageColor3 = AC
    TabS.ScrollingDirection = Enum.ScrollingDirection.X
    TabS.CanvasSize = UDim2.new(0,0,0,0)
    TabS.AutomaticCanvasSize = Enum.AutomaticSize.X
    TabS.Parent = Main
    local TLay = Instance.new("UIListLayout")
    TLay.FillDirection = Enum.FillDirection.Horizontal
    TLay.Padding = UDim.new(0,6)
    TLay.SortOrder = Enum.SortOrder.LayoutOrder
    TLay.Parent = TabS
    local TPad = Instance.new("UIPadding") TPad.PaddingLeft = UDim.new(0,6) TPad.PaddingRight = UDim.new(0,6) TPad.Parent = TabS

    local CT = Instance.new("Frame")
    CT.Size = UDim2.new(1,-12,1,-100)
    CT.Position = UDim2.new(0,6,0,92)
    CT.BackgroundColor3 = PANEL
    CT.BorderSizePixel = 0
    CT.Parent = Main
    local ctc = Instance.new("UICorner") ctc.CornerRadius = UDim.new(0,10) ctc.Parent = CT

    local CS = Instance.new("ScrollingFrame")
    CS.Size = UDim2.new(1,-8,1,-8)
    CS.Position = UDim2.new(0,4,0,4)
    CS.BackgroundTransparency = 1
    CS.BorderSizePixel = 0
    CS.ScrollBarThickness = 4
    CS.ScrollBarImageColor3 = AC
    CS.CanvasSize = UDim2.new(0,0,0,0)
    CS.AutomaticCanvasSize = Enum.AutomaticSize.Y
    CS.Parent = CT
    local CLay = Instance.new("UIListLayout") CLay.Padding = UDim.new(0,6) CLay.SortOrder = Enum.SortOrder.LayoutOrder CLay.Parent = CS
    local CPad = Instance.new("UIPadding") CPad.PaddingTop=UDim.new(0,6) CPad.PaddingLeft=UDim.new(0,6) CPad.PaddingRight=UDim.new(0,6) CPad.PaddingBottom=UDim.new(0,6) CPad.Parent = CS

    local function clearC()
        for _, c in ipairs(CS:GetChildren()) do
            if not c:IsA("UIListLayout") and not c:IsA("UIPadding") then c:Destroy() end
        end
    end

    local function mkToggle(txt, cb)
        local h = Instance.new("Frame")
        h.Size = UDim2.new(1,0,0,40)
        h.BackgroundColor3 = PANEL
        h.BorderSizePixel = 0
        h.Parent = CS
        local hc = Instance.new("UICorner") hc.CornerRadius = UDim.new(0,8) hc.Parent = h
        local hs = Instance.new("UIStroke") hs.Color = AC hs.Thickness = 1 hs.Parent = h
        local lb = Instance.new("TextLabel")
        lb.Size = UDim2.new(1,-90,1,0)
        lb.Position = UDim2.new(0,12,0,0)
        lb.BackgroundTransparency = 1
        lb.Text = txt
        lb.TextColor3 = TEXT_C
        lb.TextSize = 14
        lb.Font = Enum.Font.Gotham
        lb.TextXAlignment = Enum.TextXAlignment.Left
        lb.Parent = h
        local tg = Instance.new("TextButton")
        tg.Size = UDim2.new(0,60,0,26)
        tg.Position = UDim2.new(1,-72,0.5,-13)
        tg.BackgroundColor3 = Color3.fromRGB(60,60,70)
        tg.BorderSizePixel = 0
        tg.Text = "OFF"
        tg.TextColor3 = TEXT_C
        tg.TextSize = 12
        tg.Font = Enum.Font.GothamBold
        tg.Parent = h
        local tc = Instance.new("UICorner") tc.CornerRadius = UDim.new(0,6) tc.Parent = tg
        local st = false
        tg.MouseButton1Click:Connect(function()
            st = not st
            tg.BackgroundColor3 = st and AC or Color3.fromRGB(60,60,70)
            tg.Text = st and "ON" or "OFF"
            tg.TextColor3 = st and Color3.fromRGB(0,0,0) or TEXT_C
            if cb then cb(st) end
        end)
    end

    local function mkSlider(txt, mn, mx, def, cb)
        local h = Instance.new("Frame")
        h.Size = UDim2.new(1,0,0,60)
        h.BackgroundColor3 = PANEL
        h.BorderSizePixel = 0
        h.Parent = CS
        local hc = Instance.new("UICorner") hc.CornerRadius = UDim.new(0,8) hc.Parent = h
        local hs = Instance.new("UIStroke") hs.Color = AC hs.Thickness = 1 hs.Parent = h
        local lb = Instance.new("TextLabel")
        lb.Size = UDim2.new(1,-20,0,24)
        lb.Position = UDim2.new(0,12,0,4)
        lb.BackgroundTransparency = 1
        lb.Text = txt .. ": " .. tostring(def)
        lb.TextColor3 = TEXT_C
        lb.TextSize = 14
        lb.Font = Enum.Font.Gotham
        lb.TextXAlignment = Enum.TextXAlignment.Left
        lb.Parent = h
        local bar = Instance.new("Frame")
        bar.Size = UDim2.new(1,-24,0,10)
        bar.Position = UDim2.new(0,12,0,38)
        bar.BackgroundColor3 = Color3.fromRGB(60,60,70)
        bar.BorderSizePixel = 0
        bar.Parent = h
        local bc = Instance.new("UICorner") bc.CornerRadius = UDim.new(1,0) bc.Parent = bar
        local fill = Instance.new("Frame")
        fill.Size = UDim2.new((def-mn)/(mx-mn),0,1,0)
        fill.BackgroundColor3 = AC
        fill.BorderSizePixel = 0
        fill.Parent = bar
        local fc = Instance.new("UICorner") fc.CornerRadius = UDim.new(1,0) fc.Parent = fill
        local knob = Instance.new("Frame")
        knob.Size = UDim2.new(0,20,0,20)
        knob.Position = UDim2.new(fill.Size.X.Scale,-10,0.5,-10)
        knob.BackgroundColor3 = TEXT_C
        knob.BorderSizePixel = 0
        knob.Parent = bar
        local kc = Instance.new("UICorner") kc.CornerRadius = UDim.new(1,0) kc.Parent = knob
        local dr = false
        local function upd(inp)
            local rx = math.clamp((inp.Position.X - bar.AbsolutePosition.X)/bar.AbsoluteSize.X,0,1)
            local v = math.floor(mn + (mx-mn)*rx)
            fill.Size = UDim2.new(rx,0,1,0)
            knob.Position = UDim2.new(rx,-10,0.5,-10)
            lb.Text = txt .. ": " .. tostring(v)
            if cb then cb(v) end
        end
        bar.InputBegan:Connect(function(i) if i.UserInputType==Enum.UserInputType.Touch or i.UserInputType==Enum.UserInputType.MouseButton1 then dr=true upd(i) end end)
        bar.InputChanged:Connect(function(i) if dr and (i.UserInputType==Enum.UserInputType.Touch or i.UserInputType==Enum.UserInputType.MouseMovement) then upd(i) end end)
        UIS.InputEnded:Connect(function(i) if i.UserInputType==Enum.UserInputType.Touch or i.UserInputType==Enum.UserInputType.MouseButton1 then dr=false end end)
    end

    local function mkButton(txt, cb, col)
        local b = Instance.new("TextButton")
        b.Size = UDim2.new(1,0,0,40)
        b.BackgroundColor3 = col or PANEL
        b.BorderSizePixel = 0
        b.Text = txt
        b.TextColor3 = TEXT_C
        b.TextSize = 14
        b.Font = Enum.Font.GothamBold
        b.Parent = CS
        local c = Instance.new("UICorner") c.CornerRadius = UDim.new(0,8) c.Parent = b
        local bs = Instance.new("UIStroke") bs.Color = AC bs.Thickness = 1 bs.Parent = b
        b.MouseButton1Click:Connect(function() if cb then cb() end end)
    end
    
    local function NotifyOrion(text)
    Notify("KAMAKIRI HUB", text, 3)
    end
    
-- ドロップダウン用状態管理
local DropdownState = {Selected = nil}
local DropdownRefresh = nil

local function mkDropdown(txt, options, default, cb)
    local h = Instance.new("Frame")
    h.Size = UDim2.new(1,0,0,40)
    h.BackgroundColor3 = PANEL
    h.BorderSizePixel = 0
    h.Parent = CS
    local hc = Instance.new("UICorner") hc.CornerRadius = UDim.new(0,8) hc.Parent = h
    local hs = Instance.new("UIStroke") hs.Color = AC hs.Thickness = 1 hs.Parent = h

    local lb = Instance.new("TextLabel")
    lb.Size = UDim2.new(1,-140,1,0)
    lb.Position = UDim2.new(0,12,0,0)
    lb.BackgroundTransparency = 1
    lb.Text = txt
    lb.TextColor3 = TEXT_C
    lb.TextSize = 14
    lb.Font = Enum.Font.Gotham
    lb.TextXAlignment = Enum.TextXAlignment.Left
    lb.Parent = h

    local sel = Instance.new("TextButton")
    sel.Size = UDim2.new(0,110,0,26)
    sel.Position = UDim2.new(1,-122,0.5,-13)
    sel.BackgroundColor3 = Color3.fromRGB(60,60,70)
    sel.BorderSizePixel = 0
    sel.Text = default or "..."
    sel.TextColor3 = TEXT_C
    sel.TextSize = 12
    sel.Font = Enum.Font.GothamBold
    sel.TextTruncate = Enum.TextTruncate.AtEnd
    sel.Parent = h
    local sc = Instance.new("UICorner") sc.CornerRadius = UDim.new(0,6) sc.Parent = sel

    local list = Instance.new("Frame")
    list.Size = UDim2.new(0,150,0,0)
    list.Position = UDim2.new(1,-122,1,42)
    list.BackgroundColor3 = PANEL
    list.BorderSizePixel = 0
    list.Visible = false
    list.ZIndex = 100
    list.Parent = CT
    local lc = Instance.new("UICorner") lc.CornerRadius = UDim.new(0,8) lc.Parent = list
    local ls = Instance.new("UIStroke") ls.Color = AC ls.Thickness = 1 ls.Parent = list

    local lscroll = Instance.new("ScrollingFrame")
    lscroll.Size = UDim2.new(1,0,1,0)
    lscroll.BackgroundTransparency = 1
    lscroll.BorderSizePixel = 0
    lscroll.ScrollBarThickness = 3
    lscroll.ScrollBarImageColor3 = AC
    lscroll.CanvasSize = UDim2.new(0,0,0,0)
    lscroll.AutomaticCanvasSize = Enum.AutomaticSize.Y
    lscroll.ZIndex = 51
    lscroll.Parent = list
    local llay = Instance.new("UIListLayout")
    llay.Padding = UDim.new(0,3)
    llay.SortOrder = Enum.SortOrder.LayoutOrder
    llay.Parent = lscroll
    local lpad = Instance.new("UIPadding")
    lpad.PaddingTop = UDim.new(0,4)
    lpad.PaddingLeft = UDim.new(0,4)
    lpad.PaddingRight = UDim.new(0,4)
    lpad.PaddingBottom = UDim.new(0,4)
    lpad.Parent = lscroll

    local function refresh(opts)
        for _, c in ipairs(lscroll:GetChildren()) do
            if c:IsA("TextButton") then c:Destroy() end
        end
        for i, opt in ipairs(opts) do
            local ob = Instance.new("TextButton")
            ob.Size = UDim2.new(1,-6,0,26)
            ob.BackgroundColor3 = Color3.fromRGB(40,40,50)
            ob.BorderSizePixel = 0
            ob.Text = opt
            ob.TextColor3 = TEXT_C
            ob.TextSize = 12
            ob.Font = Enum.Font.Gotham
            ob.LayoutOrder = i
            ob.ZIndex = 52
            ob.Parent = lscroll
            local oc = Instance.new("UICorner") oc.CornerRadius = UDim.new(0,6) oc.Parent = ob
            ob.MouseButton1Click:Connect(function()
                sel.Text = opt
                list.Visible = false
                if cb then cb(opt) end
            end)
        end
    end

    refresh(options)
    DropdownRefresh = refresh

    local function sizeList()
        local count = math.min(#options, 6)
        list.Size = UDim2.new(0,150,0,count * 29 + 8)
    end
    sizeList()

    sel.MouseButton1Click:Connect(function()
        list.Visible = not list.Visible
    end)
end

-- プレイヤー一覧を取得する関数
local function getPlayerList()
    local t = {}
    for _, p in ipairs(Players:GetPlayers()) do
        if p ~= LP then
            table.insert(t, p.Name)
        end
    end
    table.sort(t)
    return t
end

-- キック用：プレイヤーを上空へ飛ばす
local function KickPlayer(targetName)
    local target = Players:FindFirstChild(targetName)
    if not target or not target.Character then return end
    local hrp = target.Character:FindFirstChild("HumanoidRootPart")
    if not hrp then return end
    local bv = Instance.new("BodyVelocity", hrp)
    bv.Name = "KamakiriKick"
    bv.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
    bv.Velocity = Vector3.new(0, 100000, 0)
    Debris:AddItem(bv, 3)
    local charEvents = RepS:FindFirstChild("CharacterEvents")
    local grabEvents = RepS:FindFirstChild("GrabEvents")
    if grabEvents and grabEvents:FindFirstChild("DestroyGrabLine") then
        pcall(function() grabEvents.DestroyGrabLine:FireServer(hrp) end)
    end
end

-- キック用ループ状態
local KickState = {Selected = nil, LoopOne = false, LoopAll = false}
    -- プレイヤー設定
    local PlayerSet = {Walkspeed=false, WsValue=1, InfJump=false, JumpPower=100, WSConn=nil, JPConn=nil}

    local function updateWS()
        if PlayerSet.WSConn then PlayerSet.WSConn:Disconnect() PlayerSet.WSConn = nil end
        if PlayerSet.Walkspeed then
            PlayerSet.WSConn = RS.Stepped:Connect(function()
                local char = LP.Character
                if char then
                    local hrp = char:FindFirstChild("HumanoidRootPart")
                    local hum = char:FindFirstChildOfClass("Humanoid")
                    if hrp and hum then
                        hrp.CFrame = hrp.CFrame + hum.MoveDirection * (16 * PlayerSet.WsValue / 10)
                    end
                end
            end)
        end
    end

    local function updateJP()
        if PlayerSet.JPConn then PlayerSet.JPConn:Disconnect() PlayerSet.JPConn = nil end
        if PlayerSet.InfJump then
            PlayerSet.JPConn = UIS.JumpRequest:Connect(function()
                local char = LP.Character
                if char then
                    local hum = char:FindFirstChildOfClass("Humanoid")
                    if hum then
                        hum:ChangeState(Enum.HumanoidStateType.Freefall)
                        task.wait()
                        hum:ChangeState(Enum.HumanoidStateType.Jumping)
                        if hum.UseJumpPower == false then
                            hum.JumpHeight = math.clamp(PlayerSet.JumpPower / 10, 7.2, 50)
                        else
                            hum.JumpPower = PlayerSet.JumpPower
                        end
                    end
                end
            end)
        end
    end

    local cats = {"プレイヤー","アンチ","キック","キル","バリア","ラグ","製作者"}
    local catBtns = {}

    local function showCat(name)
        clearC()
        for k, b in pairs(catBtns) do
            if k == name then b.BackgroundColor3 = AC b.TextColor3 = Color3.fromRGB(0,0,0)
            else b.BackgroundColor3 = PANEL b.TextColor3 = TEXT_C end
        end

        if name == "プレイヤー" then
            mkToggle("Walkspeed", function(s) PlayerSet.Walkspeed = s updateWS() end)
            mkSlider("Speed倍率", 1, 5, 1, function(v) PlayerSet.WsValue = v end)
            mkToggle("無限ジャンプ", function(s) PlayerSet.InfJump = s updateJP() end)
            mkSlider("Jump Power", 16, 500, 100, function(v) PlayerSet.JumpPower = v end)
            mkSlider("FOV", 70, 120, 70, function(v) WS.CurrentCamera.FieldOfView = v end)
        elseif name == "アンチ" then
    mkToggle("Anti Grab", function(s)
        antiGrabActive = s
        if antiGrabConn then antiGrabConn:Disconnect() antiGrabConn = nil end
        for _, c in ipairs(antiGrabTripConns) do c:Disconnect() end
        antiGrabTripConns = {}
        if s then
            if LP.Character then antiGrabSetup(LP.Character) end
            table.insert(antiGrabTripConns, LP.CharacterAdded:Connect(antiGrabSetup))
            antiGrabConn = RS.Heartbeat:Connect(function()
                local char = LP.Character
                if not char then return end
                local head = char:FindFirstChild("Head")
                local po = head and head:FindFirstChild("PartOwner")
                local ih = LP:FindFirstChild("IsHeld")
                if (po or (ih and ih.Value == true)) then
                    local SG2 = RepS:FindFirstChild("CharacterEvents") and RepS.CharacterEvents:FindFirstChild("Struggle")
                    if SG2 then SG2:FireServer() end
                end
            end)
        end
    end)
mkToggle("Anti Ragdoll", function(s)
    antiRagdollEnabled = s
    if s then
        local humanoid = LP.Character and LP.Character:FindFirstChild("Humanoid")
        if humanoid then protectRagdollHumanoid(humanoid) end
    else
        for _, conn in ipairs(antiRagdollConns) do conn:Disconnect() end
        antiRagdollConns = {}
    end
end)
mkToggle("Anti Blobman Kill", function(s)
    antiBlobmanActive = s
    if antiBlobmanTask then task.cancel(antiBlobmanTask) antiBlobmanTask = nil end
    if s then
        antiBlobmanTask = task.spawn(function()
            while antiBlobmanActive do
                local char = LP.Character
                if char then
                    local hum = char:FindFirstChild("Humanoid")
                    if hum and hum.Health > 0 then
                        hum.Sit = true
                        pcall(function() hum:ChangeState(Enum.HumanoidStateType.Running) end)
                    end
                end
                task.wait()
            end
        end)
    end
end)
mkToggle("Anti Explosion", function(s)
    antiExplosionEnabled = s
    if s then
        if LP.Character then setupAntiExplosion(LP.Character) end
        LP.CharacterAdded:Connect(setupAntiExplosion)
    end
end)
mkToggle("Anti Fire", function(s) antiFireEnabled = s end)
mkToggle("Anti Lag", function(s)
    local scripts = LP:FindFirstChild("PlayerScripts")
    local target = scripts and scripts:FindFirstChild("CharacterAndBeamMove")
    if target then target.Disabled = s end
end)
            mkToggle("Anti Kick", function(s)
    antiKickEnabled = s
    if antiKickConn then antiKickConn:Disconnect() antiKickConn = nil end
    if s then
        local char = LP.Character or LP.CharacterAdded:Wait()
        local function setupAntiKick(c)
            local hrp = c:WaitForChild("HumanoidRootPart", 5)
            if not hrp then return end
            local charEvents = RepS:FindFirstChild("CharacterEvents")
            local ragdollRemote = charEvents and charEvents:FindFirstChild("RagdollRemote")
            if not ragdollRemote then return end
            c.DescendantAdded:Connect(function(d)
                if d.Name == "PartOwner" and (not d.Parent or d.Parent.Name ~= "Head") then
                    if antiKickEnabled then
                        pcall(function() ragdollRemote:FireServer(hrp, 0) end)
                    end
                end
            end)
        end
        setupAntiKick(char)
        antiKickConn = LP.CharacterAdded:Connect(setupAntiKick)
    end
end)
        elseif name == "キック" then
    mkDropdown("対象プレイヤー", getPlayerList(), "選択...", function(v)
        KickState.Selected = v
    end)

    mkButton("選択プレイヤーをキック", function()
        if KickState.Selected then
            KickPlayer(KickState.Selected)
            NotifyOrion("キック実行: " .. KickState.Selected)
        else
            NotifyOrion("プレイヤーを選択してください")
        end
    end, Color3.fromRGB(200,50,50))

    mkButton("全員キック", function()
        local list = getPlayerList()
        for _, name in ipairs(list) do
            KickPlayer(name)
        end
        NotifyOrion("全員キック実行: " .. #list .. "人")
    end, Color3.fromRGB(200,50,50))

    mkToggle("ループキック（選択）", function(s)
        KickState.LoopOne = s
        if s then
            task.spawn(function()
                while KickState.LoopOne do
                    if KickState.Selected then
                        KickPlayer(KickState.Selected)
                    end
                    task.wait(0.15)
                end
            end)
        end
    end)

    mkToggle("ループ全員キック", function(s)
        KickState.LoopAll = s
        if s then
            task.spawn(function()
                while KickState.LoopAll do
                    local list = getPlayerList()
                    for _, name in ipairs(list) do
                        KickPlayer(name)
                    end
                    task.wait(0.15)
                end
            end)
        end
    end)
        elseif name == "キル" then
            -- パート5
        elseif name == "バリア" then
            -- パート6
        elseif name == "ラグ" then
            -- パート6
        elseif name == "製作者" then
            local credit = Instance.new("TextLabel")
            credit.Size = UDim2.new(1,0,0,60)
            credit.BackgroundColor3 = PANEL
            credit.BorderSizePixel = 0
            credit.Text = "R_8y"
            credit.TextColor3 = AC
            credit.TextSize = 22
            credit.Font = Enum.Font.GothamBlack
            credit.Parent = CS
            local cc = Instance.new("UICorner") cc.CornerRadius = UDim.new(0,8) cc.Parent = credit
            local cs = Instance.new("UIStroke") cs.Color = AC cs.Thickness = 1 cs.Parent = credit
        end
    end

    for i, cname in ipairs(cats) do
        local b = Instance.new("TextButton")
        b.Size = UDim2.new(0,90,0,32)
        b.BackgroundColor3 = PANEL
        b.BorderSizePixel = 0
        b.Text = cname
        b.TextColor3 = TEXT_C
        b.TextSize = 13
        b.Font = Enum.Font.GothamBold
        b.LayoutOrder = i
        b.Parent = TabS
        local bc = Instance.new("UICorner") bc.CornerRadius = UDim.new(0,8) bc.Parent = b
        local bs = Instance.new("UIStroke") bs.Color = AC bs.Thickness = 1 bs.Parent = b
        catBtns[cname] = b
        b.MouseButton1Click:Connect(function() showCat(cname) end)
    end

    showCat("プレイヤー")

    local ballBtn = nil
    ClsB.MouseButton1Click:Connect(function()
        Main.Visible = false
        if ballBtn then ballBtn:Destroy() end
        ballBtn = Instance.new("TextButton")
        ballBtn.Size = UDim2.new(0,60,0,60)
        ballBtn.Position = UDim2.new(0,20,0.5,-30)
        ballBtn.BackgroundColor3 = AC
        ballBtn.BorderSizePixel = 0
        ballBtn.Text = "K"
        ballBtn.TextColor3 = Color3.fromRGB(0,0,0)
        ballBtn.TextSize = 24
        ballBtn.Font = Enum.Font.GothamBlack
        ballBtn.Active = true
        ballBtn.Draggable = true
        ballBtn.Parent = MG
        local bbc = Instance.new("UICorner") bbc.CornerRadius = UDim.new(1,0) bbc.Parent = ballBtn
        ballBtn.MouseButton1Click:Connect(function()
            Main.Visible = true
            ballBtn:Destroy()
            ballBtn = nil
        end)
    end)

    local compact = false
    local origSize = Main.Size
    MinB.MouseButton1Click:Connect(function()
        compact = not compact
        if compact then
            Main.Size = UDim2.new(0,580,0,40)
            CT.Visible = false
            TabS.Visible = false
        else
            Main.Size = origSize
            CT.Visible = true
            TabS.Visible = true
        end
    end)
end

LP.CharacterAdded:Connect(function()
    task.wait(1.5)
    local existing = CG:FindFirstChild("KAMAKIRI_HUB")
    local existing2 = LP:WaitForChild("PlayerGui"):FindFirstChild("KAMAKIRI_HUB")
    if existing2 and not existing then
        pcall(function() existing2.Parent = CG end)
    elseif not existing and not existing2 then
        if done then launch() end
    end
end)

local CORRECT_KEY = "prayingmantis"

if string.lower(LP.Name) == "ryuse47" then
    done = true
    KG:Destroy()
    Notify("KAMAKIRI HUB", "製作者として認証しました", 2)
    task.wait(0.3)
    launch()
else
    local function attempt()
        if done then return end
        if KB.Text == CORRECT_KEY then
            done = true
            KG:Destroy()
            Notify("KAMAKIRI HUB", "認証成功", 2)
            task.wait(0.3)
            launch()
        else
            Notify("KAMAKIRI HUB", "キーが違います", 2)
            KB.Text = ""
        end
    end
    Kbtn.MouseButton1Click:Connect(attempt)
    KB.FocusLost:Connect(function(e) if e then attempt() end end)
end
