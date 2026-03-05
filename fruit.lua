-- ========================================================
-- [ LEE HUB PREMIUM: V15.1 HOÀN THIỆN TỐI ƯU HÓA ]
-- (Fix AntiStun, Fix Speed, Trả lại FPS Boost nguyên bản)
-- ========================================================

local p = game.Players.LocalPlayer
local core = game:GetService("CoreGui")
local ts = game:GetService("TweenService")
local workspace = game:GetService("Workspace")
local runService = game:GetService("RunService")
local uis = game:GetService("UserInputService")
local rs = game:GetService("ReplicatedStorage")
local vim = game:GetService("VirtualInputManager")

-- [ KEY SYSTEM ]
local Correct_Key = "bk1415"
local Link_Get_Key_VN = "https://link4m.com/xT7MvplN" 
local Link_Get_Key_EN = "https://loot-link.com/s?kQSRO40E" 

if core:FindFirstChild("LeeHub_Official") then core.LeeHub_Official:Destroy() end
local sg = Instance.new("ScreenGui", core)
sg.Name = "LeeHub_Official"

local accent = Color3.fromRGB(255, 30, 50)
local bg = Color3.fromRGB(20, 20, 22)

-- ==========================================
-- 1. GIAO DIỆN NHẬP KEY 
-- ==========================================
local keyMain = Instance.new("Frame", sg)
keyMain.Size = UDim2.new(0, 350, 0, 240)
keyMain.Position = UDim2.new(0.5, -175, 0.5, -120)
keyMain.BackgroundColor3 = bg
Instance.new("UICorner", keyMain).CornerRadius = UDim.new(0, 10)
Instance.new("UIStroke", keyMain).Color = accent
Instance.new("UIStroke", keyMain).Thickness = 1.5

local kTitle = Instance.new("TextLabel", keyMain)
kTitle.Size = UDim2.new(1, 0, 0, 50)
kTitle.Text = "LEE HUB - KEY SYSTEM"
kTitle.TextColor3 = accent
kTitle.Font = Enum.Font.GothamBlack
kTitle.TextSize = 20
kTitle.BackgroundTransparency = 1

local kInput = Instance.new("TextBox", keyMain)
kInput.Size = UDim2.new(0.8, 0, 0, 45)
kInput.Position = UDim2.new(0.1, 0, 0.3, 0)
kInput.PlaceholderText = "Nhập Key tại đây..."
kInput.Text = "" 
kInput.BackgroundColor3 = Color3.fromRGB(25, 25, 28)
kInput.TextColor3 = Color3.new(1, 1, 1)
kInput.Font = Enum.Font.GothamBold
Instance.new("UICorner", kInput)

local kGetVN = Instance.new("TextButton", keyMain)
kGetVN.Size = UDim2.new(0, 135, 0, 35)
kGetVN.Position = UDim2.new(0.1, 0, 0.55, 0)
kGetVN.Text = "LẤY KEY (VN)"
kGetVN.BackgroundColor3 = Color3.fromRGB(40, 40, 45)
kGetVN.TextColor3 = Color3.new(1, 1, 1)
kGetVN.Font = Enum.Font.GothamBold
kGetVN.TextSize = 13
Instance.new("UICorner", kGetVN)

local kGetEN = Instance.new("TextButton", keyMain)
kGetEN.Size = UDim2.new(0, 135, 0, 35)
kGetEN.Position = UDim2.new(0.51, 5, 0.55, 0)
kGetEN.Text = "GET KEY (EN)"
kGetEN.BackgroundColor3 = Color3.fromRGB(40, 40, 45)
kGetEN.TextColor3 = Color3.new(1, 1, 1)
kGetEN.Font = Enum.Font.GothamBold
kGetEN.TextSize = 13
Instance.new("UICorner", kGetEN)

local kCheck = Instance.new("TextButton", keyMain)
kCheck.Size = UDim2.new(0, 280, 0, 40)
kCheck.Position = UDim2.new(0.1, 0, 0.76, 0)
kCheck.Text = "XÁC NHẬN KEY"
kCheck.BackgroundColor3 = accent
kCheck.TextColor3 = Color3.new(1, 1, 1)
kCheck.Font = Enum.Font.GothamBold
kCheck.TextSize = 16
Instance.new("UICorner", kCheck)

-- ==========================================
-- 2. HỆ THỐNG HUB & LÕI ĐÃ TỐI ƯU HÓA 100%
-- ==========================================
local function StartLeeHub()
    keyMain:Destroy()

    -- [ GIAO DIỆN LOADING ]
    local loadF = Instance.new("Frame", sg)
    loadF.Size = UDim2.new(0, 320, 0, 150)
    loadF.Position = UDim2.new(0.5, -160, 0.5, -75)
    loadF.BackgroundColor3 = bg
    Instance.new("UICorner", loadF).CornerRadius = UDim.new(0, 15)

    local lTitle = Instance.new("TextLabel", loadF)
    lTitle.Size = UDim2.new(1, 0, 1, -40)
    lTitle.Text = "LEE HUB"
    lTitle.TextColor3 = accent
    lTitle.Font = Enum.Font.GothamBlack
    lTitle.TextSize = 45
    lTitle.BackgroundTransparency = 1
    lTitle.TextTransparency = 1

    local barBG = Instance.new("Frame", loadF)
    barBG.Size = UDim2.new(0.8, 0, 0, 4)
    barBG.Position = UDim2.new(0.1, 0, 0.8, 0)
    barBG.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    local bar = Instance.new("Frame", barBG)
    bar.Size = UDim2.new(0, 0, 1, 0)
    bar.BackgroundColor3 = accent
    Instance.new("UICorner", bar).CornerRadius = UDim.new(1, 0)

    ts:Create(lTitle, TweenInfo.new(0.8), {TextTransparency = 0}):Play()
    ts:Create(bar, TweenInfo.new(1.2), {Size = UDim2.new(1, 0, 1, 0)}):Play()
    task.wait(1.4)
    ts:Create(loadF, TweenInfo.new(0.4, Enum.EasingStyle.Back), {Size = UDim2.new(0, 0, 0, 0)}):Play()
    task.wait(0.4)
    loadF:Destroy()

    -- ==========================================
    -- BẢNG ĐIỀU KHIỂN TRUNG TÂM (C.STATES)
    -- ==========================================
    local C = {
        Aim = false, Flash = false, AntiStun = false,
        ESP = false, Speed = false, V4 = false, Buso = false,
        Soru = false, Water = false, FPS = false
    }

    -- Biến phụ trợ
    local cam = workspace.CurrentCamera
    local playersaimbot = nil
    local PlayersPosition = nil
    local tracer = Drawing.new("Line")
    tracer.Visible = false tracer.Color = accent tracer.Thickness = 2 tracer.Transparency = 1
    local ESP_Cache = {}
    local SoruFunc = nil

    -- ==========================================
    -- CÁC HÀM XỬ LÝ NHỎ
    -- ==========================================

    -- 1. BỘ LỌC MỤC TIÊU CHUẨN
    local function isTargetValid(v)
        if not v or v == p or not v.Character then return false end
        local root = v.Character:FindFirstChild("HumanoidRootPart")
        local hum = v.Character:FindFirstChild("Humanoid")
        if not root or not hum or hum.Health <= 0 then return false end
        if v.Character:FindFirstChildOfClass("ForceField") then return false end
        if p.Team and v.Team and p.Team.Name == "Marines" and v.Team.Name == "Marines" then return false end

        pcall(function()
            if v:FindFirstChild("Data") and v.Data:FindFirstChild("PvP") and v.Data.PvP.Value == false then return false end
            if v:FindFirstChild("Data") and v.Data:FindFirstChild("Level") and v.Data.Level.Value < 20 then return false end
        end)
        if v:GetAttribute("SafeZone") or v:GetAttribute("PvPDisabled") then return false end
        if v.Character:GetAttribute("SafeZone") or v.Character:GetAttribute("PvPDisabled") then return false end

        local head = v.Character:FindFirstChild("Head")
        if head then
            for _, gui in pairs(head:GetChildren()) do
                if gui:IsA("BillboardGui") then
                    for _, elm in pairs(gui:GetDescendants()) do
                        if elm:IsA("TextLabel") and (string.find(string.lower(elm.Text), "pvp") or string.find(string.lower(elm.Text), "safe")) then 
                            return false 
                        end
                    end
                end
            end
        end
        return true 
    end

    local function GetBestTarget()
        local lpHRP = p.Character and p.Character:FindFirstChild("HumanoidRootPart")
        if not lpHRP then return nil end
        local lowestHP, targetLowestHP = math.huge, nil
        local closestDist, targetClosest = 1000, nil
        for _, v in pairs(game.Players:GetPlayers()) do
            if isTargetValid(v) then
                local hrp = v.Character.HumanoidRootPart
                local dist = (lpHRP.Position - hrp.Position).Magnitude
                local hp = v.Character.Humanoid.Health
                if dist <= 500 and hp < lowestHP then lowestHP = hp; targetLowestHP = v end
                if dist <= 1000 and dist < closestDist then closestDist = dist; targetClosest = v end
            end
        end
        return targetLowestHP or targetClosest
    end

    -- 2. HÀM ESP
    local function CreateESP(targetPlayer)
        local esp = { Text = Drawing.new("Text") }
        esp.Text.Visible = false esp.Text.Center = true esp.Text.Outline = true 
        esp.Text.Font = 2 esp.Text.Size = 14 esp.Text.Color = Color3.fromRGB(255, 255, 255)
        ESP_Cache[targetPlayer] = esp
    end
    for _, p_ in pairs(game.Players:GetPlayers()) do if p_ ~= p then CreateESP(p_) end end
    game.Players.PlayerAdded:Connect(CreateESP)
    game.Players.PlayerRemoving:Connect(function(p_) if ESP_Cache[p_] then ESP_Cache[p_].Text:Remove(); ESP_Cache[p_] = nil end end)

    -- 3. HÀM TÌM SORU
    local function FindSoruFunction()
        if SoruFunc and type(SoruFunc) == "function" then return SoruFunc end
        for _, v in pairs(getgc()) do
            if type(v) == "function" then
                local env = getfenv(v)
                if env and env.script and env.script.Name == "Soru" and env.script:IsDescendantOf(p.Character) then
                    SoruFunc = v return v
                end
            end
        end
        return nil
    end

    -- HOOK ĐẠN MA THUẬT (Chỉ hook 1 lần)
    if not _G.LeeHooked then
        _G.LeeHooked = true
        local gg = getrawmetatable(game)
        local old = gg.__namecall
        setreadonly(gg, false)
        gg.__namecall = newcclosure(function(self, V1, V2, ...)
            local method = getnamecallmethod():lower()
            if tostring(self) == "RemoteEvent" and method == "fireserver" and typeof(V1) == "Vector3" then
                if C.Aim and PlayersPosition then
                    return old(self, PlayersPosition, V2, ...)
                end
            end
            return old(self, V1, V2, ...)
        end)
        setreadonly(gg, true)
    end

    -- ==========================================
    -- LÕI 9 ĐÃ ĐƯỢC TRẢ LẠI: FPS BOOST 
    -- ==========================================
    local function InitFPSBoost()
        local FPSBoostModule = {}
        FPSBoostModule.Enabled = false
        FPSBoostModule.Connections = {}
        FPSBoostModule.OriginalSettings = {}
        local Players = game:GetService("Players")
        local Lighting = game:GetService("Lighting")
        local Workspace = game:GetService("Workspace")
        local Terrain = Workspace:FindFirstChildOfClass("Terrain")
        
        local function SaveOriginalSettings()
            FPSBoostModule.OriginalSettings = {
                FogStart = Lighting.FogStart,
                FogEnd = Lighting.FogEnd,
                GlobalShadows = Lighting.GlobalShadows,
                ClockTime = Lighting.ClockTime,
                Brightness = Lighting.Brightness,
                OutdoorAmbient = Lighting.OutdoorAmbient,
                WaterWaveSize = Terrain and Terrain.WaterWaveSize or nil,
                WaterWaveSpeed = Terrain and Terrain.WaterWaveSpeed or nil,
                WaterReflectance = Terrain and Terrain.WaterReflectance or nil,
                WaterTransparency = Terrain and Terrain.WaterTransparency or nil
            }
        end
        
        local function RestoreOriginalSettings()
            if not next(FPSBoostModule.OriginalSettings) then 
                return 
            end   
            Lighting.FogStart = FPSBoostModule.OriginalSettings.FogStart
            Lighting.FogEnd = FPSBoostModule.OriginalSettings.FogEnd
            Lighting.GlobalShadows = FPSBoostModule.OriginalSettings.GlobalShadows
            Lighting.ClockTime = FPSBoostModule.OriginalSettings.ClockTime
            Lighting.Brightness = FPSBoostModule.OriginalSettings.Brightness
            Lighting.OutdoorAmbient = FPSBoostModule.OriginalSettings.OutdoorAmbient    
            if Terrain then
                Terrain.WaterWaveSize = FPSBoostModule.OriginalSettings.WaterWaveSize or 0
                Terrain.WaterWaveSpeed = FPSBoostModule.OriginalSettings.WaterWaveSpeed or 0
                Terrain.WaterReflectance = FPSBoostModule.OriginalSettings.WaterReflectance or 0
                Terrain.WaterTransparency = FPSBoostModule.OriginalSettings.WaterTransparency or 1
            end
        end
        
        local function IsPlayerModel(model)
            return Players:GetPlayerFromCharacter(model) ~= nil
        end
        
        local function IsTreeObject(obj)
            local name = obj.Name:lower()
            if name:find("tree") or name:find("leaf") or name:find("bush") 
               or name:find("foliage") or name:find("plant") or name:find("palm") then
                return true
            end
            return false
        end
        
        local function OptimizeObject(obj)
            local current = obj
            while current do
                if current:IsA("Model") and current:FindFirstChildOfClass("Humanoid") then
                    return false -- Không xử lý nhân vật
                end
                current = current.Parent
            end
            if obj:IsA("Model") then
                if obj:FindFirstChildOfClass("Humanoid") and not IsPlayerModel(obj) then
                    obj:Destroy()
                    return true
                end
                if IsTreeObject(obj) then
                    obj:Destroy()
                    return true
                end
            end
            if obj:IsA("BasePart") then
                obj.Material = Enum.Material.SmoothPlastic
                obj.CastShadow = false
                obj.Reflectance = 0
                local originalColor = obj.Color
                local gray = (originalColor.R + originalColor.G + originalColor.B) / 3
                obj.Color = Color3.new(
                    gray * 0.7 + originalColor.R * 0.3,
                    gray * 0.7 + originalColor.G * 0.3,
                    gray * 0.7 + originalColor.B * 0.3
                )
                return true
            end
            if obj:IsA("Decal") or obj:IsA("Texture") 
               or obj:IsA("ParticleEmitter") or obj:IsA("Trail") then
                obj:Destroy()
                return true
            end
            if obj:IsA("Fire") or obj:IsA("Smoke") then
                obj.Enabled = false
                return true
            end    
            return false
        end
        
        local function OptimizeCharacterAccessories(character)
            task.wait(1) -- Chờ character load hoàn chỉnh    
            for _, item in ipairs(character:GetDescendants()) do
                if item:IsA("Accessory") then
                    local handle = item:FindFirstChild("Handle")
                    if handle and handle:IsA("BasePart") then
                        handle.Color = Color3.fromRGB(180, 180, 180)
                        handle.Material = Enum.Material.SmoothPlastic
                    end
                end
                if item:IsA("Shirt") or item:IsA("Pants") or item:IsA("ShirtGraphic") then
                    item:Destroy()
                end
            end
        end
        
        local function RemoveSkyAndAtmosphere()
            for _, obj in ipairs(Lighting:GetChildren()) do
                if obj:IsA("Sky") or obj:IsA("Atmosphere") or obj:IsA("PostEffect") then
                    obj:Destroy()
                end
            end
        end
        
        local function ConfigureLighting()
            Lighting.FogStart = 1e9
            Lighting.FogEnd = 1e9
            Lighting.GlobalShadows = false
            Lighting.ClockTime = 12
            Lighting.Brightness = 1.5
            Lighting.OutdoorAmbient = Color3.new(1, 1, 1)
        end
        
        local function ConfigureWater()
            if Terrain then
                Terrain.WaterWaveSize = 0
                Terrain.WaterWaveSpeed = 0
                Terrain.WaterReflectance = 0
                Terrain.WaterTransparency = 1
            end
        end
        
        local function OptimizeWorkspace()
            for _, obj in ipairs(Workspace:GetDescendants()) do
                OptimizeObject(obj)
            end
        end
        
        local function SetupConnections()
            local descAddedConnection = Workspace.DescendantAdded:Connect(function(obj)
                task.wait(0.1)
                OptimizeObject(obj)
            end)    
            table.insert(FPSBoostModule.Connections, descAddedConnection)
            local function setupCharacterConnections(plr)
                local charAddedConnection = plr.CharacterAdded:Connect(function(character)
                    spawn(function()
                        OptimizeCharacterAccessories(character)
                    end)
                end)
                table.insert(FPSBoostModule.Connections, charAddedConnection)
                if plr.Character then
                    spawn(function()
                        OptimizeCharacterAccessories(plr.Character)
                    end)
                end
            end
            setupCharacterConnections(Players.LocalPlayer)
            for _, pl in ipairs(Players:GetPlayers()) do
                if pl ~= Players.LocalPlayer then
                    setupCharacterConnections(pl)
                end
            end    
            local playerAddedConnection = Players.PlayerAdded:Connect(function(pl)
                setupCharacterConnections(pl)
            end)
            table.insert(FPSBoostModule.Connections, playerAddedConnection)
        end
        
        local function DisconnectAll()
            for _, conn in ipairs(FPSBoostModule.Connections) do
                if conn.Connected then
                    conn:Disconnect()
                end
            end
            FPSBoostModule.Connections = {}
        end
        
        function FPSBoostModule:SetState(state)
            if state == self.Enabled then 
                return 
            end    
            if state then
                SaveOriginalSettings()
                ConfigureLighting()
                RemoveSkyAndAtmosphere()
                ConfigureWater()
                OptimizeWorkspace()
                SetupConnections()       
                self.Enabled = true       
            else
                DisconnectAll()
                RestoreOriginalSettings()       
                self.Enabled = false
            end
        end

        return FPSBoostModule
    end
    local MyFPSBoost = InitFPSBoost()

    -- ==========================================
    -- VÒNG LẶP TRUNG TÂM (RENDER STEPPED - SIÊU MƯỢT)
    -- ==========================================
    runService.RenderStepped:Connect(function(deltaTime)
        local char = p.Character
        if not char then 
            tracer.Visible = false 
            for _, esp in pairs(ESP_Cache) do esp.Text.Visible = false end
            return 
        end
        local lpHRP = char:FindFirstChild("HumanoidRootPart")
        local hum = char:FindFirstChild("Humanoid")

        -- [ AIM & TRACER ]
        if C.Aim and lpHRP then
            local target = GetBestTarget()
            if target and target.Character and target.Character:FindFirstChild("HumanoidRootPart") then
                playersaimbot = target.Name
                local hrp = target.Character.HumanoidRootPart
                local tHum = target.Character:FindFirstChild("Humanoid")
                
                if tHum and tHum.WalkSpeed > 5 then
                    PlayersPosition = hrp.Position + (hrp.Velocity * 0.1)
                else 
                    PlayersPosition = hrp.Position 
                end
                
                local vector, onScreen = cam:WorldToViewportPoint(hrp.Position)
                if onScreen then
                    tracer.From = Vector2.new(cam.ViewportSize.X / 2, cam.ViewportSize.Y / 2 + 36)
                    tracer.To = Vector2.new(vector.X, vector.Y)
                    tracer.Visible = true
                else tracer.Visible = false end
            else
                playersaimbot = nil; PlayersPosition = nil; tracer.Visible = false 
            end
        else
            tracer.Visible = false
        end

        -- [ ESP PLAYERS ]
        if C.ESP then
            for targetPlr, esp in pairs(ESP_Cache) do
                if targetPlr and targetPlr.Character and targetPlr.Character:FindFirstChild("HumanoidRootPart") and targetPlr.Character:FindFirstChild("Humanoid") and targetPlr.Character.Humanoid.Health > 0 then
                    local hrp = targetPlr.Character.HumanoidRootPart
                    local vector, onScreen = cam:WorldToViewportPoint(hrp.Position)
                    if onScreen then
                        local hp = math.floor(targetPlr.Character.Humanoid.Health)
                        local maxHp = math.floor(targetPlr.Character.Humanoid.MaxHealth)
                        local isAttackable = isTargetValid(targetPlr)
                        local pvpText = isAttackable and "On" or "Off"
                        
                        esp.Text.Text = string.format("%s\n[HP: %d/%d]\n[PvP: %s]", targetPlr.Name, hp, maxHp, pvpText)
                        esp.Text.Color = (pvpText == "Off") and Color3.fromRGB(150, 150, 150) or Color3.fromRGB(255, 50, 50)
                        esp.Text.Position = Vector2.new(vector.X, vector.Y)
                        esp.Text.Visible = true
                    else esp.Text.Visible = false end
                else esp.Text.Visible = false end
            end
        else
            for _, esp in pairs(ESP_Cache) do esp.Text.Visible = false end
        end

        -- [ ANTI STUN - ĐÃ FIX CHUẨN BLOX FRUITS ]
        if C.AntiStun and hum then
            hum.PlatformStand = false
            hum.Sit = false
            
            local stunVal = char:FindFirstChild("Stun")
            if stunVal and stunVal.Value > 0 then stunVal.Value = 0 end
            
            local busyVal = char:FindFirstChild("Busy")
            if busyVal and busyVal.Value == true then busyVal.Value = false end
        end

        -- [ SPEED HACK - ĐÃ FIX SIÊU MƯỢT ]
        if C.Speed and hum and lpHRP then
            if hum.MoveDirection.Magnitude > 0 then
                lpHRP.CFrame = lpHRP.CFrame + (hum.MoveDirection * (45 * deltaTime))
            end
        end
    end)

    -- ==========================================
    -- VÒNG LẶP HẬU ĐÀI (HEARTBEAT - LOGIC GAME)
    -- ==========================================
    local lastFlashTick = 0
    
    runService.Heartbeat:Connect(function()
        local char = p.Character
        if not char then return end

        -- [ AUTO RACE V4 ]
        if C.V4 then
            local Energy = char:FindFirstChild("RaceEnergy")
            if Energy and Energy.Value >= 1 then
                vim:SendKeyEvent(true, Enum.KeyCode.Y, false, game)
                task.wait(0.05)
                vim:SendKeyEvent(false, Enum.KeyCode.Y, false, game)
            end
        end

        -- [ AUTO HAKI BUSO ]
        if C.Buso then
            if not char:FindFirstChild("HasBuso") then
                pcall(function() rs:WaitForChild("Remotes"):WaitForChild("CommF_"):InvokeServer("Buso") end)
            end
        end

        -- [ INFINITE SORU ]
        if C.Soru then
            SoruFunc = FindSoruFunction()
            if SoruFunc then
                pcall(function()
                    for i = 1, 20 do
                        local ok, uv = pcall(debug.getupvalue, SoruFunc, i)
                        if ok and type(uv) == "table" and uv.LastUse then
                            uv.LastUse = 0
                            uv.LastAfter = 0
                            setupvalue(SoruFunc, i, uv)
                            break
                        end
                    end
                end)
            end
        end

        -- [ FLASH ATTACK SIÊU NHẸ ]
        if C.Flash then
            if tick() - lastFlashTick >= 0.1 then
                lastFlashTick = tick()
                pcall(function()
                    local lpHRP = char:FindFirstChild("HumanoidRootPart")
                    if not lpHRP then return end
                    local targets = {}
                    for _, v in pairs(workspace.Enemies:GetChildren()) do
                        if v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 and v:FindFirstChild("HumanoidRootPart") then
                            if (v.HumanoidRootPart.Position - lpHRP.Position).Magnitude < 60 then table.insert(targets, v) end
                        end
                    end
                    for _, v in pairs(workspace.Characters:GetChildren()) do
                        if v.Name ~= p.Name and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 and v:FindFirstChild("HumanoidRootPart") then
                            if (v.HumanoidRootPart.Position - lpHRP.Position).Magnitude < 60 then table.insert(targets, v) end
                        end
                    end
                    
                    if #targets > 0 then
                        local RegisterAttack = rs:WaitForChild("Modules"):WaitForChild("Net"):WaitForChild("RE/RegisterAttack")
                        local RegisterHit = rs:WaitForChild("Modules"):WaitForChild("Net"):WaitForChild("RE/RegisterHit")
                        RegisterAttack:FireServer(0)
                        local args = {nil, {}}
                        for i, e in pairs(targets) do
                            if not args[1] then args[1] = e:FindFirstChild("Head") end
                            args[2][i] = {e, e.HumanoidRootPart}
                        end
                        RegisterHit:FireServer(unpack(args))
                    end
                end)
            end
        end
    end)

    -- [ WALK ON WATER CƠ BẢN ]
    local waterPlane = nil
    local function HandleWater()
        if C.Water then
            waterPlane = workspace.Map:FindFirstChild("WaterBase-Plane")
            if waterPlane then waterPlane.Size = Vector3.new(1000, 112, 1000) end
        else
            waterPlane = workspace.Map:FindFirstChild("WaterBase-Plane")
            if waterPlane then waterPlane.Size = Vector3.new(1000, 1, 1000) end
        end
    end
    workspace.DescendantAdded:Connect(function(d) if C.Water and d.Name == "WaterBase-Plane" then task.wait(0.5); HandleWater() end end)

    -- ==========================================
    -- GIAO DIỆN HUB CHÍNH
    -- ==========================================
    local hubBg = Color3.fromRGB(20, 20, 22)
    local hubAccent = Color3.fromRGB(255, 30, 50)

    local main = Instance.new("Frame", sg)
    main.Size = UDim2.new(0, 0, 0, 0)
    main.Position = UDim2.new(0.5, -270, 0.5, -160)
    main.BackgroundColor3 = hubBg
    main.Active = true main.Draggable = true
    Instance.new("UICorner", main).CornerRadius = UDim.new(0, 8)
    local stroke = Instance.new("UIStroke", main) stroke.Color = hubAccent stroke.Thickness = 1.5
    local mainScale = Instance.new("UIScale", main) mainScale.Scale = 1

    local sidebar = Instance.new("Frame", main)
    sidebar.Size = UDim2.new(0, 140, 1, 0) sidebar.BackgroundColor3 = Color3.fromRGB(15, 15, 17) sidebar.BorderSizePixel = 0
    Instance.new("UICorner", sidebar).CornerRadius = UDim.new(0, 8)
    local filler = Instance.new("Frame", sidebar) filler.Size, filler.Position = UDim2.new(0, 10, 1, 0), UDim2.new(1, -10, 0, 0) filler.BackgroundColor3, filler.BorderSizePixel = Color3.fromRGB(15, 15, 17), 0
    local divLine = Instance.new("Frame", sidebar) divLine.Size, divLine.Position = UDim2.new(0, 1, 1, 0), UDim2.new(1, 0, 0, 0) divLine.BackgroundColor3, divLine.BackgroundTransparency, divLine.BorderSizePixel = hubAccent, 0.5, 0

    local lblHub = Instance.new("TextLabel", sidebar) lblHub.Size, lblHub.Position, lblHub.BackgroundTransparency, lblHub.Text, lblHub.TextColor3, lblHub.Font, lblHub.TextSize = UDim2.new(1, 0, 0, 40), UDim2.new(0, 0, 0, 10), 1, "LEE HUB", hubAccent, Enum.Font.GothamBlack, 22
    local lblSub = Instance.new("TextLabel", sidebar) lblSub.Size, lblSub.Position, lblSub.BackgroundTransparency, lblSub.Text, lblSub.TextColor3, lblSub.Font, lblSub.TextSize = UDim2.new(1, 0, 0, 15), UDim2.new(0, 0, 0, 42), 1, "BLOX FRUIT PVP", Color3.fromRGB(130, 130, 135), Enum.Font.GothamBold, 10
    local lblDiscord = Instance.new("TextLabel", sidebar) lblDiscord.Size, lblDiscord.Position, lblDiscord.BackgroundTransparency, lblDiscord.Text, lblDiscord.TextColor3, lblDiscord.Font, lblDiscord.TextSize = UDim2.new(1, 0, 0, 30), UDim2.new(0, 0, 1, -30), 1, "Discord: n_lee09", Color3.fromRGB(100, 100, 105), Enum.Font.Gotham, 11

    local tabCombatBtn = Instance.new("TextButton", sidebar)
    tabCombatBtn.Size, tabCombatBtn.Position, tabCombatBtn.BackgroundColor3 = UDim2.new(1, -20, 0, 32), UDim2.new(0, 10, 0, 80), hubAccent
    tabCombatBtn.Text, tabCombatBtn.TextColor3, tabCombatBtn.Font, tabCombatBtn.TextSize, tabCombatBtn.TextXAlignment = "  ⚔️ Combat", Color3.fromRGB(255, 255, 255), Enum.Font.GothamBold, 13, Enum.TextXAlignment.Left
    Instance.new("UICorner", tabCombatBtn).CornerRadius = UDim.new(0, 6)

    local tabSettingsBtn = Instance.new("TextButton", sidebar)
    tabSettingsBtn.Size, tabSettingsBtn.Position, tabSettingsBtn.BackgroundColor3 = UDim2.new(1, -20, 0, 32), UDim2.new(0, 10, 0, 120), Color3.fromRGB(25, 25, 28)
    tabSettingsBtn.Text, tabSettingsBtn.TextColor3, tabSettingsBtn.Font, tabSettingsBtn.TextSize, tabSettingsBtn.TextXAlignment = "  ⚙️ Settings", Color3.fromRGB(150, 150, 150), Enum.Font.GothamBold, 13, Enum.TextXAlignment.Left
    Instance.new("UICorner", tabSettingsBtn).CornerRadius = UDim.new(0, 6)

    local content = Instance.new("Frame", main) content.Size, content.Position, content.BackgroundTransparency = UDim2.new(1, -141, 1, 0), UDim2.new(0, 141, 0, 0), 1
    local topHeader = Instance.new("Frame", content) topHeader.Size, topHeader.BackgroundTransparency = UDim2.new(1, 0, 0, 40), 1
    local tabTitle = Instance.new("TextLabel", topHeader) tabTitle.Size, tabTitle.Position, tabTitle.BackgroundTransparency, tabTitle.Text, tabTitle.TextColor3, tabTitle.Font, tabTitle.TextSize, tabTitle.TextXAlignment = UDim2.new(0, 200, 1, 0), UDim2.new(0, 20, 0, 0), 1, "TÙY CHỈNH CHIẾN ĐẤU", Color3.fromRGB(255, 255, 255), Enum.Font.GothamBold, 14, Enum.TextXAlignment.Left

    local closeBtn = Instance.new("TextButton", topHeader) closeBtn.Size, closeBtn.Position, closeBtn.BackgroundColor3, closeBtn.Text, closeBtn.TextColor3, closeBtn.Font, closeBtn.TextSize = UDim2.new(0, 24, 0, 24), UDim2.new(1, -34, 0, 8), hubAccent, "✕", Color3.fromRGB(255, 255, 255), Enum.Font.GothamBold, 12
    Instance.new("UICorner", closeBtn).CornerRadius = UDim.new(1, 0)

    local pageCombat = Instance.new("ScrollingFrame", content) pageCombat.Size, pageCombat.Position, pageCombat.BackgroundTransparency, pageCombat.BorderSizePixel, pageCombat.ScrollBarThickness = UDim2.new(1, 0, 1, -40), UDim2.new(0, 0, 0, 40), 1, 0, 0
    local pageSettings = Instance.new("ScrollingFrame", content) pageSettings.Size, pageSettings.Position, pageSettings.BackgroundTransparency, pageSettings.BorderSizePixel, pageSettings.ScrollBarThickness, pageSettings.Visible = UDim2.new(1, 0, 1, -40), UDim2.new(0, 0, 0, 40), 1, 0, 0, false

    tabCombatBtn.MouseButton1Click:Connect(function()
        pageCombat.Visible = true pageSettings.Visible = false
        tabCombatBtn.BackgroundColor3, tabCombatBtn.TextColor3 = hubAccent, Color3.fromRGB(255, 255, 255)
        tabSettingsBtn.BackgroundColor3, tabSettingsBtn.TextColor3 = Color3.fromRGB(25, 25, 28), Color3.fromRGB(150, 150, 150)
        tabTitle.Text = "TÙY CHỈNH CHIẾN ĐẤU"
    end)

    tabSettingsBtn.MouseButton1Click:Connect(function()
        pageCombat.Visible = false pageSettings.Visible = true
        tabSettingsBtn.BackgroundColor3, tabSettingsBtn.TextColor3 = hubAccent, Color3.fromRGB(255, 255, 255)
        tabCombatBtn.BackgroundColor3, tabCombatBtn.TextColor3 = Color3.fromRGB(25, 25, 28), Color3.fromRGB(150, 150, 150)
        tabTitle.Text = "CÀI ĐẶT CHUNG"
    end)

    local function CreateToggle(parent, text, posY, stateKey, callback)
        local frame = Instance.new("Frame", parent) frame.Size, frame.Position, frame.BackgroundColor3 = UDim2.new(1, -40, 0, 40), UDim2.new(0, 20, 0, posY), Color3.fromRGB(25, 25, 28)
        Instance.new("UICorner", frame).CornerRadius = UDim.new(0, 6)
        local label = Instance.new("TextLabel", frame) label.Size, label.Position, label.BackgroundTransparency, label.Text, label.TextColor3, label.Font, label.TextSize, label.TextXAlignment = UDim2.new(0, 200, 1, 0), UDim2.new(0, 15, 0, 0), 1, text, Color3.fromRGB(220, 220, 220), Enum.Font.GothamSemibold, 13, Enum.TextXAlignment.Left
        local bg_tgl = Instance.new("TextButton", frame) bg_tgl.Size, bg_tgl.Position, bg_tgl.BackgroundColor3, bg_tgl.Text = UDim2.new(0, 44, 0, 22), UDim2.new(1, -55, 0.5, -11), Color3.fromRGB(50, 50, 55), ""
        Instance.new("UICorner", bg_tgl).CornerRadius = UDim.new(1, 0)
        local circ = Instance.new("Frame", bg_tgl) circ.Size, circ.Position, circ.BackgroundColor3 = UDim2.new(0, 18, 0, 18), UDim2.new(0, 2, 0.5, -9), Color3.fromRGB(255, 255, 255)
        Instance.new("UICorner", circ).CornerRadius = UDim.new(1, 0)
        
        local tw = TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
        bg_tgl.MouseButton1Click:Connect(function()
            C[stateKey] = not C[stateKey]
            ts:Create(bg_tgl, tw, {BackgroundColor3 = C[stateKey] and hubAccent or Color3.fromRGB(50, 50, 55)}):Play()
            ts:Create(circ, tw, {Position = C[stateKey] and UDim2.new(1, -20, 0.5, -9) or UDim2.new(0, 2, 0.5, -9)}):Play()
            if callback then callback() end
        end)
    end

    -- Gắn các chức năng vào Tab Combat
    CreateToggle(pageCombat, "Bật Silent Aim + Tracer", 20, "Aim")
    CreateToggle(pageCombat, "Bật Flash Attack (Siêu Tốc)", 70, "Flash")
    CreateToggle(pageCombat, "Bật Anti Stun (Chuẩn - Mượt Skill)", 120, "AntiStun")
    CreateToggle(pageCombat, "Bật ESP Players (Mắt Thần)", 170, "ESP")
    CreateToggle(pageCombat, "Bật Speed Hack (Siêu êm)", 220, "Speed")
    pageCombat.CanvasSize = UDim2.new(0, 0, 0, 280)

    -- Gắn các chức năng vào Tab Settings (Đã chèn lại FPS Boost ở đây)
    CreateToggle(pageSettings, "Auto Kích Hoạt Tộc V4", 20, "V4")
    CreateToggle(pageSettings, "Auto Haki Buso", 70, "Buso")
    CreateToggle(pageSettings, "Bật Infinite Soru (Lướt Vô Hạn)", 120, "Soru")
    CreateToggle(pageSettings, "Đi Trên Nước (Walk On Water)", 170, "Water", HandleWater)
    CreateToggle(pageSettings, "FPS Boost (Giảm Lag - Tối Ưu)", 220, "FPS", function() 
        MyFPSBoost:SetState(C.FPS) 
    end)
    pageSettings.CanvasSize = UDim2.new(0, 0, 0, 280)

    local openBtn = Instance.new("TextButton", sg) openBtn.Size, openBtn.Position, openBtn.BackgroundColor3, openBtn.Text, openBtn.TextColor3, openBtn.Font, openBtn.TextSize, openBtn.Visible, openBtn.Active, openBtn.Draggable = UDim2.new(0, 45, 0, 45), UDim2.new(0, 20, 0.5, -22), bg, "L", hubAccent, Enum.Font.GothamBlack, 22, true, true, true
    Instance.new("UICorner", openBtn).CornerRadius = UDim.new(1, 0)
    Instance.new("UIStroke", openBtn).Color = hubAccent
    local btnScale = Instance.new("UIScale", openBtn) btnScale.Scale = 0

    local popIn, popOut = TweenInfo.new(0.5, Enum.EasingStyle.Back, Enum.EasingDirection.Out), TweenInfo.new(0.35, Enum.EasingStyle.Quad, Enum.EasingDirection.In) 

    ts:Create(main, TweenInfo.new(0.6, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {Size = UDim2.new(0, 540, 0, 320)}):Play()

    closeBtn.MouseButton1Click:Connect(function()
        ts:Create(mainScale, popOut, {Scale = 0}):Play() task.wait(0.35)
        main.Visible = false openBtn.Visible = true btnScale.Scale = 0
        ts:Create(btnScale, popIn, {Scale = 1}):Play()
    end)
    openBtn.MouseButton1Click:Connect(function()
        ts:Create(btnScale, popOut, {Scale = 0}):Play() task.wait(0.35)
        openBtn.Visible = false main.Visible = true mainScale.Scale = 0
        ts:Create(mainScale, popIn, {Scale = 1}):Play()
    end)
end 

-- ==========================================
-- 3. XỬ LÝ NÚT BẤM GIAO DIỆN KEY
-- ==========================================
kGetVN.MouseButton1Click:Connect(function()
    setclipboard(Link_Get_Key_VN)
    game:GetService("StarterGui"):SetCore("SendNotification", {Title = "Lee Hub", Text = "Đã copy link lấy Key (VN)!", Duration = 3})
end)

kGetEN.MouseButton1Click:Connect(function()
    setclipboard(Link_Get_Key_EN)
    game:GetService("StarterGui"):SetCore("SendNotification", {Title = "Lee Hub", Text = "Copied link to get Key (EN)!", Duration = 3})
end)

kCheck.MouseButton1Click:Connect(function()
    if kInput.Text == Correct_Key then
        game:GetService("StarterGui"):SetCore("SendNotification", {Title = "Lee Hub", Text = "Key chính xác! Đang tải Hub...", Duration = 3})
        StartLeeHub() 
    else
        game:GetService("StarterGui"):SetCore("SendNotification", {Title = "Lee Hub [LỖI]", Text = "Sai Key rồi ông nội, lấy lại đi!", Duration = 3})
    end
end)
