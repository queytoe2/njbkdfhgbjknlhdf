local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()
local SaveManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/SaveManager.lua"))()
local InterfaceManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/InterfaceManager.lua"))()

local VERSION = "5.0.0"
local filename = "Ninja Hub v"..VERSION.." Settings.txt"
local Prefixes = {
    ['brynhildr'] = true;
    ['jarvis'] = true;
    ['friday'] = true;
    ['alexa'] = true;
    ['siri'] = true;
    ['.'] = true;
    ['!'] = true;
    [';'] = true;
    ['?'] = true;
    ['>'] = true;
}
local Admins = {5769154214,35703015,4862735779,6179789179,3454236591,5853418357}

local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local Workspace = game:GetService("Workspace")
local CoreGui = game:GetService("CoreGui")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local TeleportService = game:GetService("TeleportService")

local Player = Players.LocalPlayer
local mouse = Player:GetMouse()
local Character = Players.LocalPlayer.Character or Players.LocalPlayer.CharacterAdded:Wait()
local WLPunishment = {}
local Alts = {}
local Functions = {}
Functions.NinjutsuChanged = {}
Functions.CharacterAdded = {}
Functions.UserInputBegan = {}
Functions.UserInputEnded = {}
Functions.PlayerAdded = {}
Functions.PlayerRemoved = {}
Functions.WorkspaceDescendantAdded = {}
Functions.WorkspaceDescendantRemoved = {}
Functions.CharacterTouched = {}
Functions.WhitelistCharacterTouched = {}
local Lists = {
    Whitelist = {
        Soft = {};
        Semi = {};
        Normal = {};
        Permanent = {};
    };
    Blacklist = {
        Soft = {};
        Semi = {};
        Normal = {};
        Permanent = {};
    };
    Targetlist = {
        Soft = {};
        Semi = {};
        Normal = {};
        Permanent = {};
    };
    BreakShurlist = {
        Soft = {};
        Semi = {};
        Normal = {};
        Permanent = {};
    };
    DisableShurslist = {
        Soft = {};
        Semi = {};
        Normal = {};
        Permanent = {};
    };
}
local TestingModes = {
    silentaim = false;
}
local Variables = {

    -- // Training Memory Values

    AutoTrain = false;
    AlteranteAutoTrain = false;
    AnimationTrain = false;
    AutoEquip = false;
    AntiAfk = false;
    AntiBubble = false;
    AutoPosition = false;
    AutoReconnect = false;
    AntiFirstScreen = false;
    InfiniteJump = false;
    AutoSpeed = false;
    DeathTraining = false;

    -- // Combat Memory Values

    Aimbot = false;
    HoldClick = false;
    ShotgunFire = false;
    FireOnGodMode = false;
    AirStrikeMode = false;
    RapidMode = false;
    AntiVoid = false;
    AutoBubble = false;
    AltAutoBubble = false;
    AutoTarget = false;
    AutoWLTarget = false;
    AutoFire = false;
    Savior = false;
    BreakShurs = false;
    DisableShurs = false;
    AutoBreakShurs = false;
    AutoWLBreakShurs = false;
    Loopbring = false;
    ActivateHitEvent = false;
    WeaponAutoEquip = false;
    PunishPlayers = false;
    PunishWL = false;

    -- // Players Memory Values

    ESP = false;
    Chams = false;
    WeaponESP = false;
    WeaponChams = false;

    -- // Cosmetics Memory Values

    Rainbow = false;

    -- // Other Variables

    TrainRate = 0.7;
    AltTrainRate = 0.62;
    TrainAmount = 20;
    AltTrainAmount = 20;
    RapidMultiplier = 10;
    CircleRadius = 7;
    AirStrikeDistance = 300;
    ShotgunFireSpread = 300;
    loopBringDistance = 7;
    AutoFireWait = 0.02;
    AutoFireFinishWait = 0.02;
    HitEventWait = 0.02;
    HitEventFinishWait = 0.02;
    SaviorPercent = 0.5;
    PredictModeOffset = 0.05;
    RainbowRate = 0.02;
    RainbowFinishRate = 0.02;
    Positioning = { X = 0; Y = 0; Z = 0; };
    FilterList = {};
    SwordList = {};
    SafePartCFrame = CFrame.new(0,200000,0);
    CharRespawning = false;
    AltTrainTime = false;
    InvisRunning = false;
    Follow = false;
    CircleTeleport = false;
    AltBgMusic = false;
    AirStrikeMode = false;
    PredictMode = false;
    ServerShurikens = false;
    OptionalEquip = false;
    PlayerShurikenCheck = false;
    TeleportShuriken = false;
    DroppingSword = false;
    ConstantFire = false;
    GainingNegativeNin = false;
    RainbowTableChanged = false;
    Autorespawning = nil;
    ResPos = nil;
    RainbowMode = "Normal";
    AimPart = "Head";
    WebSocketHost = "ws://192.168.56.1:9000";
}
local Tables = {
    AutoExecuteList = {
        InfiniteYield = function()
            loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))()
            --[[for i,v in pairs(CoreGui:GetChildren()) do
                if v:FindFirstChild("VegaXAndroidUI") then
                    local logs = v:FindFirstChild("selectChat",true).Parent.chat.scroll
                    logs.ChildAdded:Connect(function(v)
                        if not v.RichText then
                            v.RichText = true
                        end
                    end)
                end
            end]]
        end;
        --[[StatsImprover = function()
            repeat task.wait(0.1) until Players.LocalPlayer:FindFirstChild("leaderstats")
    
            local numofstats = 0
            for i,v in ipairs(Players.LocalPlayer:FindFirstChild("leaderstats"):GetChildren()) do
                numofstats = numofstats + 1
            end
            local numnum = numofstats * 110
            local xvalue = numnum + 172
            local divxvalue = xvalue - 110
            local coregui = game:GetService("CoreGui")
            local playerlist = coregui:FindFirstChild("RoactAppExperimentProvider") or coregui:FindFirstChild("PlayerList")
            local Teams = game:GetService("Teams")
            local plrlistmaster = playerlist:FindFirstChild("PlayerListMaster") or playerlist:FindFirstChild("Children")
            local offsetframe = plrlistmaster:FindFirstChild("OffsetFrame") or playerlistmaster:FindFirstChild("Children")
            local plrsandteams = plrlistmaster.OffsetFrame.PlayerScrollList.SizeOffsetFrame.ScrollingFrameContainer.ScrollingFrameClippingFrame.ScollingFrame.OffsetUndoFrame
            local titlebar = plrlistmaster.OffsetFrame.PlayerScrollList.SizeOffsetFrame:WaitForChild("TitleBar")
            local suffixes = {'','K+','M+','B+','T+','qd+','Qn+','sx+','Sp+','O+','N+','de+','Ud+','DD+','tdD+','qdD+','QnD+','sxD+','SpD+','OcD+','NvD+','Vgn+','UVg+','DVg+','TVg+','qtV+','QnV+','SeV+','SPG+','OVG+','NVG+','TGN+','UTG+','DTG+','tsTG+','qtTG+','QnTG+','ssTG+','SpTG+','OcTG+','NoAG+','UnAG+','DuAG+','TeAG+','QdAG+','QnAG+','SxAG+','SpAG+','OcAG+','NvAG+','CT+'}
            local TeamValues = {}
            local PlayerValues = {}
            local Exceptions = {
                ['Reputation'] = 1;
                ['Power'] = 1;
            }
            local LBExceptions = {
                ['Realm'] = 150;
            }
    
            local function comma_value(n)
                if tonumber(n) then
                    local left,num,right = string.match(n,'^([^%d]*%d)(%d*)(.-)$')
                    return left..(num:reverse():gsub('(%d%d%d)','%1,'):reverse())..right
                else
                    return n
                end
            end
            local function format(val)
                if tonumber(val) then
                    local negative = false
                    if string.sub(val,1,1) == "-" then
                        val = string.sub(val,2,string.len(val))
                        negative = true
                    end
                    for i=1, #suffixes do
                        if tonumber(val) < 10^(i*3) then
                            local value = math.floor(val/((10^((i-1)*3))/100))/(100)..suffixes[i]
                            if negative then value = "-"..value end
                            return value
                        end
                    end
                else
                    return val
                end
            end
            local function GetPlayer(text)
                for _,Player in pairs(game.Players:GetPlayers()) do
                    if string.sub(string.lower(Player.Name),1,string.len(text)) == string.lower(text) then
                        return Player
                    elseif string.sub(string.lower(Player.DisplayName),1,string.len(text)) == string.lower(text) then
                        return Player
                    elseif Player.UserId == tonumber(text) then
                        return Player
                    end
                end
            end
            local function UpdateTeamValues()
                for i,v in pairs(TeamValues) do
                    TeamValues[i] = 0
                end
                local plr
                for i,v in pairs(Players:GetPlayers()) do
                    if v:FindFirstChild("leaderstats") then
                        plr = v
                        for i,v in pairs(v:FindFirstChild("leaderstats"):GetChildren()) do
                            if tonumber(v.Value) then
                                TeamValues[plr.Team.Name.."_"..v.Name] = TeamValues[plr.Team.Name.."_"..v.Name] + v.Value
                            end
                        end
                    end
                end
                for i,v in pairs(plrsandteams:GetChildren()) do
                    if string.sub(v.Name,1,1) == "t" then
                        for i,v in pairs(v:GetChildren()) do
                            if string.lower(string.sub(v.Name,1,8)) == "gamestat" then
                                local statname = string.sub(v.Name,10,string.len(v.Name))
                                if Exceptions[statname] then
                                    if tonumber(TeamValues[v.Parent.NameFrame.BGFrame.OverlayFrame.TeamName.Text.."_"..statname]) then
                                        v.OverlayFrame.StatText.Text = format(TeamValues[v.Parent.NameFrame.BGFrame.OverlayFrame.TeamName.Text.."_"..statname])
                                    else
                                        v.OverlayFrame.StatText.Text = "-"
                                    end
                                else
                                    if tonumber(TeamValues[v.Parent.NameFrame.BGFrame.OverlayFrame.TeamName.Text.."_"..statname]) then
                                        v.OverlayFrame.StatText.Text = comma_value(TeamValues[v.Parent.NameFrame.BGFrame.OverlayFrame.TeamName.Text.."_"..statname])
                                    else
                                        v.OverlayFrame.StatText.Text = "-"
                                    end
                                end
                            end
                        end
                    end
                end
            end
            local function UpdatePlayerStats(plr)
                repeat task.wait(0.1) until plr:FindFirstChild("leaderstats")
                for i,v in pairs(plr:FindFirstChild("leaderstats"):GetChildren()) do
                    if not PlayerValues[plr.Name.."_"..v.Name] then
                        PlayerValues[plr.Name.."_"..v.Name] = 0
                    end
                    PlayerValues[plr.Name.."_"..v.Name] = v.Value
                end
                for i,v in pairs(plrsandteams:GetChildren()) do
                    if string.sub(v.Name,1,1) == "p" then
                        if GetPlayer(string.sub(v.Name,3,string.len(v.Name))) == plr then
                            for i,v in pairs(v.ChildrenFrame:GetChildren()) do
                                if string.lower(string.sub(v.Name,1,8)) == "gamestat" then
                                    local statname = string.sub(v.Name,10,string.len(v.Name))
                                    if Exceptions[statname] then
                                        v.OverlayFrame.StatText.Text = format(PlayerValues[plr.Name.."_"..statname])
                                    else
                                        v.OverlayFrame.StatText.Text = comma_value(PlayerValues[plr.Name.."_"..statname])
                                    end
                                end
                            end
                        end
                    end
                end
            end
            local function UpdatePlayerListSize()
                for i,v in pairs(plrsandteams:GetChildren()) do
                    if string.sub(v.Name,1,1) == "t" then
                        for i,v in pairs(v:GetChildren()) do
                            if v.Name == "BackgroundExtender" then
                                if v.Size ~= UDim2.new(1,0,1,0) then
                                    v.Size = UDim2.new(1,0,1,0)
                                end
                            end
                            if string.lower(string.sub(v.Name,1,8)) == "gamestat" then
                                local statname = string.sub(v.Name,10,string.len(v.Name))
                                if v.Size ~= UDim2.new(1,-divxvalue,1,0) then
                                    v.Size = UDim2.new(1,-divxvalue,1,0)
                                end
                            end
                        end
                    elseif string.sub(v.Name,1,1) == "p" then
                        for i,v in pairs(v.ChildrenFrame:GetChildren()) do
                            if v.Name == "BackgroundExtender" then
                                if v.Size ~= UDim2.new(1,0,1,0) then
                                    v.Size = UDim2.new(1,0,1,0)
                                end
                            end
                            if string.lower(string.sub(v.Name,1,8)) == "gamestat" then
                                local statname = string.sub(v.Name,10,string.len(v.Name))
                                if v.Size ~= UDim2.new(1,-divxvalue,1,0) then
                                    v.Size = UDim2.new(1,-divxvalue,1,0)
                                end
                            end
                        end
                    end
                end
                for i,v in pairs(titlebar.ChildrenFrame:GetChildren()) do
                    if string.lower(string.sub(v.Name,1,4)) == "stat" then
                        local statname = string.sub(v.Name,10,string.len(v.Name))
                        if v.Size ~= UDim2.new(1,-divxvalue,1,0) then
                            v.Size = UDim2.new(1,-divxvalue,1,0)
                        end
                    end
                end
            end
    
            for i,v in pairs(game.Teams:GetChildren()) do
                local teamname = v.Name
                for i,v in pairs(Players.LocalPlayer:FindFirstChild("leaderstats"):GetChildren()) do
                    TeamValues[teamname.."_"..v.Name] = 0
                end
            end
    
            for i,v in pairs(Players:GetPlayers()) do
                task.spawn(function()
                    repeat task.wait() until v:FindFirstChild("leaderstats")
                    if v:FindFirstChild("leaderstats") then
                        local plr = v
                        for i,v in pairs(v:FindFirstChild("leaderstats"):GetChildren()) do
                            v:GetPropertyChangedSignal("Value"):Connect(function()
                                UpdateTeamValues()
                                UpdatePlayerStats(plr)
                            end)
                        end
                        UpdatePlayerStats(plr)
                    end
                    UpdatePlayerListSize()
                end)
            end
    
            Functions.PlayerAdded.LeaderstatsImprover = function(plr)
                task.spawn(function()
                    repeat task.wait() until plr:FindFirstChild("leaderstats")
                    repeat
                        task.wait()
                        local plrnumofstats = 0
                        for i,v in ipairs(plr:FindFirstChild("leaderstats"):GetChildren()) do
                            plrnumofstats = plrnumofstats + 1
                        end
                    until plrnumofstats == numofstats
                    for i,v in pairs(plr:FindFirstChild("leaderstats"):GetChildren()) do
                        v:GetPropertyChangedSignal("Value"):Connect(function()
                            UpdateTeamValues()
                            UpdatePlayerStats(plr)
                        end)
                    end
                    task.wait(0.5)
                    UpdatePlayerStats(plr)
                    UpdatePlayerListSize()
                end)
            end
            Functions.PlayerRemoved.LeaderstatsImprover = function(plr)
                task.spawn(function()
                    UpdateTeamValues()
                end)
            end
    
            plrlistmaster.Size = UDim2.new(0,xvalue,0.7,0)
            UpdatePlayerListSize()
    
            task.spawn(function()
                while task.wait(1) do
                    for i,plr in pairs(Players:GetPlayers()) do
                        UpdatePlayerStats(plr)
                    end
                    UpdateTeamValues()
                    UpdatePlayerListSize()
                end
            end)
        end;]]
        Spy = function()
            enabled = true
            spyOnMyself = true
            public = false
            publicItalics = true
            privateProperties = {
                Color = Color3.fromRGB(0,255,255); 
                Font = Enum.Font.SourceSansBold;
                TextSize = 18;
            }
            local StarterGui = game:GetService("StarterGui")
            local Players = game:GetService("Players")
            local player = Players.LocalPlayer or Players:GetPropertyChangedSignal("LocalPlayer"):Wait() or Players.LocalPlayer
            local saymsg = game:GetService("ReplicatedStorage"):WaitForChild("DefaultChatSystemChatEvents"):WaitForChild("SayMessageRequest")
            local getmsg = game:GetService("ReplicatedStorage"):WaitForChild("DefaultChatSystemChatEvents"):WaitForChild("OnMessageDoneFiltering")
            local instance = (_G.chatSpyInstance or 0) + 1
            _G.chatSpyInstance = instance
    
            local function onChatted(p,msg)
                if _G.chatSpyInstance == instance then
                    if p==player and msg:lower():sub(1,4)=="/spy" then
                        enabled = not enabled
                        wait(0.3)
                        privateProperties.Text = "{SPY "..(enabled and "EN" or "DIS").."ABLED}"
                        StarterGui:SetCore("ChatMakeSystemMessage",privateProperties)
                    elseif enabled and (spyOnMyself==true or p~=player) then
                        msg = msg:gsub("[\n\r]",''):gsub("\t",' '):gsub("[ ]+",' ')
                        local hidden = true
                        local conn = getmsg.OnClientEvent:Connect(function(packet,channel)
                            if packet.SpeakerUserId==p.UserId and packet.Message==msg:sub(#msg-#packet.Message+1) and (channel=="All" or (channel=="Team" and public==false and Players[packet.FromSpeaker].Team==player.Team)) then
                                hidden = false
                            end
                        end)
                        wait(1)
                        conn:Disconnect()
                        if hidden and enabled then
                            if public then
                                saymsg:FireServer((publicItalics and "/me " or '').."{SPY} [".. p.Name .."]: "..msg,"All")
                            else
                                privateProperties.Text = "{SPY} [".. p.Name .."]: "..msg
                                StarterGui:SetCore("ChatMakeSystemMessage",privateProperties)
                            end
                        end
                    end
                end
            end
    
            for _,p in ipairs(Players:GetPlayers()) do
                p.Chatted:Connect(function(msg) onChatted(p,msg) end)
            end
            Players.PlayerAdded:Connect(function(p)
                p.Chatted:Connect(function(msg) onChatted(p,msg) end)
            end)
            privateProperties.Text = "{SPY "..(enabled and "EN" or "DIS").."ABLED}"
            StarterGui:SetCore("ChatMakeSystemMessage",privateProperties)
            if not player.PlayerGui:FindFirstChild("Chat") then wait(3) end
            local chatFrame = player.PlayerGui.Chat.Frame
            chatFrame.ChatChannelParentFrame.Visible = true
            chatFrame.ChatBarParentFrame.Position = chatFrame.ChatChannelParentFrame.Position+UDim2.new(UDim.new(),chatFrame.ChatChannelParentFrame.Size.Y)
        end;
        FPSCounter = function()

            local RightFrame = nil
            if not game:GetService("CoreGui").TopBarApp.TopBarFrame:FindFirstChild("RightFrame") then
                RightFrame = game:GetService("CoreGui").TopBarApp.TopBarFrame.LeftFrame:Clone()
                RightFrame.Parent = game:GetService("CoreGui").TopBarApp.TopBarFrame
                RightFrame.Name = "RightFrame"
                RightFrame.Position = UDim2.new(0.5,0,0,0)
                RightFrame.Size = UDim2.new(0.5,-16,1,0)
                RightFrame.Layout.HorizontalAlignment = Enum.HorizontalAlignment.Right
                if RightFrame:FindFirstChild("Blank") then
                    RightFrame:FindFirstChild("Blank"):Destroy()
                end
            else
                RightFrame = game:GetService("CoreGui").TopBarApp.TopBarFrame:FindFirstChild("RightFrame")
            end
    
            local Frame = Instance.new("Frame")
            local TextLabel = Instance.new("TextLabel")
            local UITextSizeConstraint = Instance.new("UITextSizeConstraint")
            local Frame2 = Instance.new("Frame")
            local TextLabel2 = Instance.new("TextLabel")
            local UITextSizeConstraint2 = Instance.new("UITextSizeConstraint")
            local Frame3 = Instance.new("Frame")
            local TextLabel3 = Instance.new("TextLabel")
            local UITextSizeConstraint3 = Instance.new("UITextSizeConstraint")
            local HealthBarMimic = Instance.new("Frame")
    
            --Properties:
    
            Frame.Parent = RightFrame
            Frame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            Frame.BackgroundTransparency = 1.000
            Frame.BorderSizePixel = 0
            Frame.AnchorPoint = Vector2.new(1,0)
            Frame.Position = UDim2.new(1, 0, 0, 0)
            Frame.Size = UDim2.new(0, 76, 0, 37)
            Frame.LayoutOrder = 3
            Frame.Name = "FPS"
            Frame.ZIndex = 10
    
            TextLabel.Parent = Frame
            TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            TextLabel.BackgroundTransparency = 1.000
            TextLabel.Size = UDim2.new(1, 0, 1, 0)
            TextLabel.Font = Enum.Font.Code
            TextLabel.Text = "N/A FPS"
            TextLabel.TextColor3 = Color3.fromRGB(255, 150, 0)
            TextLabel.TextScaled = true
            TextLabel.TextSize = 14.000
            TextLabel.TextWrapped = true
    
            UITextSizeConstraint.Parent = TextLabel
            UITextSizeConstraint.MaxTextSize = 20
    
            Frame2.Parent = RightFrame
            Frame2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            Frame2.BackgroundTransparency = 1.000
            Frame2.BorderSizePixel = 0
            Frame2.AnchorPoint = Vector2.new(1,0)
            Frame2.Position = UDim2.new(1, 0, 0, 0)
            Frame2.Size = UDim2.new(0, 120, 0, 37)
            Frame2.LayoutOrder = 1
            Frame2.Name = "Timer"
            Frame2.ZIndex = 10
    
            TextLabel2.Parent = Frame2
            TextLabel2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            TextLabel2.BackgroundTransparency = 1.000
            TextLabel2.Size = UDim2.new(1, 0, 1, 0)
            TextLabel2.Font = Enum.Font.Code
            TextLabel2.Text = "00:00:00"
            TextLabel2.TextColor3 = Color3.fromRGB(0, 255, 0)
            TextLabel2.TextScaled = true
            TextLabel2.TextSize = 14.000
            TextLabel2.TextWrapped = true
    
            UITextSizeConstraint2.Parent = TextLabel2
            UITextSizeConstraint2.MaxTextSize = 20
    
            Frame3.Parent = RightFrame
            Frame3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            Frame3.BackgroundTransparency = 1.000
            Frame3.BorderSizePixel = 0
            Frame3.AnchorPoint = Vector2.new(1,0)
            Frame3.Position = UDim2.new(1, 0, 0, 0)
            Frame3.Size = UDim2.new(0, 100, 0, 37)
            Frame3.LayoutOrder = 2
            Frame3.Name = "Ping"
            Frame3.ZIndex = 10
    
            TextLabel3.Parent = Frame3
            TextLabel3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            TextLabel3.BackgroundTransparency = 1.000
            TextLabel3.Size = UDim2.new(1, 0, 1, 0)
            TextLabel3.Font = Enum.Font.Code
            TextLabel3.Text = "1000 ms"
            TextLabel3.TextColor3 = Color3.fromRGB(0, 255, 0)
            TextLabel3.TextScaled = true
            TextLabel3.TextSize = 14.000
            TextLabel3.TextWrapped = true
    
            UITextSizeConstraint3.Parent = TextLabel3
            UITextSizeConstraint3.MaxTextSize = 20

            HealthBarMimic.Parent = RightFrame
            HealthBarMimic.LayoutOrder = 0
            HealthBarMimic.Position = UDim2.new(1,0,0,0)
            HealthBarMimic.Size = UDim2.new(0,130,1,0)
            HealthBarMimic.BackgroundTransparency = 1
    
            coroutine.resume(coroutine.create(function()
                while wait() do
                    local ping = game:GetService("Stats").Network.ServerStatsItem["Data Ping"]:GetValue()
                    TextLabel3.Text = string.format("%.2f", ping).." ms"
                end
            end))
    
            local function Format(Int)
                return string.format("%02i", Int)
            end
    
            local function convertToHMS()
                local miliseconds = math.floor(workspace.DistributedGameTime * 100)
                local seconds = math.floor(workspace.DistributedGameTime)
                local minutes = math.floor(workspace.DistributedGameTime / 60)
                local hours = math.floor(workspace.DistributedGameTime / 60 / 60)
                local miliseconds = miliseconds - (seconds * 100)
                local seconds = seconds - (minutes * 60)
                local minutes = minutes - (hours * 60)
                return Format(hours)..":"..Format(minutes)..":"..Format(seconds)..":"..Format(miliseconds)
            end
    
            coroutine.resume(coroutine.create(function()
                while task.wait(0.01) do
                    TextLabel2.Text = convertToHMS()
                end
            end))
    
    
            local RunService = game:GetService("RunService")
            local FpsLabel = TextLabel
            local TimeFunction = RunService:IsRunning() and time or os.clock
    
            local LastIteration, Start
            local FrameUpdateTable = {}
    
            local function HeartbeatUpdate()
                LastIteration = TimeFunction()
                for Index = #FrameUpdateTable, 1, -1 do
                    FrameUpdateTable[Index + 1] = FrameUpdateTable[Index] >= LastIteration - 1 and FrameUpdateTable[Index] or nil
                end
                
                FrameUpdateTable[1] = LastIteration
                local fps = tostring(math.floor(TimeFunction() - Start >= 1 and #FrameUpdateTable or #FrameUpdateTable / (TimeFunction() - Start)))
                FpsLabel.Text = fps.. " FPS"
                if tonumber(fps) then
                    local num = tonumber(fps)
                    if num > 30 then
                        TextLabel.TextColor3 = Color3.fromRGB(0,255,0)
                    elseif num > 15 then
                        TextLabel.TextColor3 = Color3.fromRGB(255,150,0)
                    elseif num < 15 then
                        TextLabel.TextColor3 = Color3.fromRGB(255,0,0)
                    end
                end
            end
    
            if game:GetService("CoreGui"):FindFirstChild("TopBarApp") then
                if game:GetService("CoreGui").TopBarApp:FindFirstChild("UnibarLeftFrame") then
                    if game:GetService("CoreGui").TopBarApp.UnibarLeftFrame:FindFirstChild("HealthBar") then
                        game:GetService("CoreGui").TopBarApp.UnibarLeftFrame:FindFirstChild("HealthBar").Changed:Connect(function()
                            if game:GetService("CoreGui").TopBarApp.UnibarLeftFrame:FindFirstChild("HealthBar").Visible == true then
                                HealthBarMimic.LayoutOrder = 3
                                Frame.LayoutOrder = 2
                                Frame3.LayoutOrder = 1
                                Frame2.LayoutOrder = 0
                            else
                                HealthBarMimic.LayoutOrder = 0
                                Frame.LayoutOrder = 3
                                Frame3.LayoutOrder = 2
                                Frame2.LayoutOrder = 1
                            end
                        end)
                    end
                end
            end
    
            Start = TimeFunction()
            RunService.Heartbeat:Connect(HeartbeatUpdate)
        end;
        AntiMobileGlitch = function()
            task.spawn(function()
                for i,v in pairs(Player.PlayerGui:GetChildren()) do
                    if v.Name == "ScreenGui" and v:FindFirstChild("Frame") then
                        v:Destroy()
                    end
                end
                repeat task.wait() until Players.LocalPlayer.PlayerGui:FindFirstChild("PlayerScript")
                local clone = Players.LocalPlayer.PlayerGui.PlayerScript:Clone()
                clone.Parent = Players.LocalPlayer.PlayerGui
                repeat task.wait() until Players.LocalPlayer.PlayerGui:FindFirstChild("GuiScript")
                local clone2 = Players.LocalPlayer.PlayerGui.GuiScript:Clone()
                clone2.Parent = Players.LocalPlayer.PlayerGui
                return
            end)
            Functions.CharacterAdded.AntiMobileGlitch = function()
                task.spawn(function()
                    Functions.CheckAllParts(Character)
                    for i,v in pairs(Player.PlayerGui:GetChildren()) do
                        if v.Name == "ScreenGui" and v:FindFirstChild("Frame") then
                            v:Destroy()
                        end
                    end
                    repeat task.wait() until Players.LocalPlayer.PlayerGui:FindFirstChild("PlayerScript")
                    local clone = Players.LocalPlayer.PlayerGui.PlayerScript:Clone()
                    clone.Parent = Players.LocalPlayer.PlayerGui
                    repeat task.wait() until Players.LocalPlayer.PlayerGui:FindFirstChild("GuiScript")
                    local clone2 = Players.LocalPlayer.PlayerGui.GuiScript:Clone()
                    clone2.Parent = Players.LocalPlayer.PlayerGui
                end)
            end
        end;
        AutoTranslator = function()
            --[[
                Message Translator
                Made by Aim, updated by evn
                Credits to Riptxde for the sending chathook
            --]]

            if not game['Loaded'] then game['Loaded']:Wait() end; repeat wait(.06) until game:GetService('Players').LocalPlayer ~= nil
            local YourLang = "en" -- Language code that the messages are going to be translated to

            local googlev = isfile'googlev.txt' and readfile'googlev.txt' or ''
            local request = request or syn.request

            local function outputHook(fnc)
                return function(...)
                    return fnc('[INLINE TRANSLATOR]', ...)
                end
            end

            local print,warn = outputHook(print), outputHook(warn)

            -- // GOOGLE TRANSLATE // --

            local translate, getISOCode do
                function googleConsent(Body) -- Because google really said: "Fuck you."
                    local args = {}

                    for match in Body:gmatch('<input type="hidden" name=".-" value=".-">') do
                        local k,v = match:match('<input type="hidden" name="(.-)" value="(.-)">')
                        args[k] = v
                    end
                    googlev = args.v
                    writefile('googlev.txt', args.v)
                end

                local function got(url, Method, Body) -- Basic version of https://www.npmjs.com/package/got using synapse's request API for google websites
                    Method = Method or "GET"
                    
                    local res = request({
                        Url = url,
                        Method = Method,
                        Headers = {cookie="CONSENT=YES+"..googlev},
                        Body = Body
                    })
                    
                    if res.Body:match('https://consent.google.com/s') then
                        print('consent')
                        googleConsent(res.Body)
                        res = request({
                            Url = url,
                            Method = "GET",
                            Headers = {cookie="CONSENT=YES+"..googlev}
                        })
                    end
                    
                    return res
                end

                local languages = {
                    auto = "Automatic",
                    af = "Afrikaans",
                    sq = "Albanian",
                    am = "Amharic",
                    ar = "Arabic",
                    hy = "Armenian",
                    az = "Azerbaijani",
                    eu = "Basque",
                    be = "Belarusian",
                    bn = "Bengali",
                    bs = "Bosnian",
                    bg = "Bulgarian",
                    ca = "Catalan",
                    ceb = "Cebuano",
                    ny = "Chichewa",
                    ['zh-cn'] = "Chinese Simplified",
                    ['zh-tw'] = "Chinese Traditional",
                    co = "Corsican",
                    hr = "Croatian",
                    cs = "Czech",
                    da = "Danish",
                    nl = "Dutch",
                    en = "English",
                    eo = "Esperanto",
                    et = "Estonian",
                    tl = "Filipino",
                    fi = "Finnish",
                    fr = "French",
                    fy = "Frisian",
                    gl = "Galician",
                    ka = "Georgian",
                    de = "German",
                    el = "Greek",
                    gu = "Gujarati",
                    ht = "Haitian Creole",
                    ha = "Hausa",
                    haw = "Hawaiian",
                    iw = "Hebrew",
                    hi = "Hindi",
                    hmn = "Hmong",
                    hu = "Hungarian",
                    is = "Icelandic",
                    ig = "Igbo",
                    id = "Indonesian",
                    ga = "Irish",
                    it = "Italian",
                    ja = "Japanese",
                    jw = "Javanese",
                    kn = "Kannada",
                    kk = "Kazakh",
                    km = "Khmer",
                    ko = "Korean",
                    ku = "Kurdish (Kurmanji)",
                    ky = "Kyrgyz",
                    lo = "Lao",
                    la = "Latin",
                    lv = "Latvian",
                    lt = "Lithuanian",
                    lb = "Luxembourgish",
                    mk = "Macedonian",
                    mg = "Malagasy",
                    ms = "Malay",
                    ml = "Malayalam",
                    mt = "Maltese",
                    mi = "Maori",
                    mr = "Marathi",
                    mn = "Mongolian",
                    my = "Myanmar (Burmese)",
                    ne = "Nepali",
                    no = "Norwegian",
                    ps = "Pashto",
                    fa = "Persian",
                    pl = "Polish",
                    pt = "Portuguese",
                    pa = "Punjabi",
                    ro = "Romanian",
                    ru = "Russian",
                    sm = "Samoan",
                    gd = "Scots Gaelic",
                    sr = "Serbian",
                    st = "Sesotho",
                    sn = "Shona",
                    sd = "Sindhi",
                    si = "Sinhala",
                    sk = "Slovak",
                    sl = "Slovenian",
                    so = "Somali",
                    es = "Spanish",
                    su = "Sundanese",
                    sw = "Swahili",
                    sv = "Swedish",
                    tg = "Tajik",
                    ta = "Tamil",
                    te = "Telugu",
                    th = "Thai",
                    tr = "Turkish",
                    uk = "Ukrainian",
                    ur = "Urdu",
                    uz = "Uzbek",
                    vi = "Vietnamese",
                    cy = "Welsh",
                    xh = "Xhosa",
                    yi = "Yiddish",
                    yo = "Yoruba",
                    zu = "Zulu"
                };

                function find(lang)
                    for i,v in pairs(languages) do
                        if i == lang or v == lang then
                            return i
                        end
                    end
                end

                function isSupported(lang)
                    local key = find(lang)
                    return key and true or false 
                end

                function getISOCode(lang)
                    local key = find(lang)
                    return key
                end

                function stringifyQuery(dataFields)
                    local data = ""
                    for k, v in pairs(dataFields) do
                        if type(v) == "table" then
                            for _,v in pairs(v) do
                                data = data .. ("&%s=%s"):format(
                                    game.HttpService:UrlEncode(k),
                                    game.HttpService:UrlEncode(v)
                                )
                            end
                        else
                            data = data .. ("&%s=%s"):format(
                                game.HttpService:UrlEncode(k),
                                game.HttpService:UrlEncode(v)
                            )
                        end
                    end
                    data = data:sub(2)
                    return data
                end

                local reqid = math.random(1000,9999)
                local rpcidsTranslate = "MkEWBc"
                local rootURL = "https://translate.google.com/"
                local executeURL = "https://translate.google.com/_/TranslateWebserverUi/data/batchexecute"
                local fsid, bl

                do -- init
                    print('initialize')
                    local InitialReq = got(rootURL)
                    fsid = InitialReq.Body:match('"FdrFJe":"(.-)"')
                    bl = InitialReq.Body:match('"cfb2h":"(.-)"')
                end

                local HttpService = game:GetService("HttpService")
                function jsonE(o)
                    return HttpService:JSONEncode(o)
                end
                function jsonD(o)
                    return HttpService:JSONDecode(o)
                end

                function translate(str, to, from)
                    reqid+=10000
                    from = from and getISOCode(from) or 'auto'
                    to = to and getISOCode(to) or 'en'

                    local data = {{str, from, to, true}, {nil}}

                    local freq = {
                        {
                            {
                                rpcidsTranslate, 
                                jsonE(data),
                                nil,
                                "generic"
                            }
                        }
                    }

                    local url = executeURL..'?'..stringifyQuery{rpcids = rpcidsTranslate, ['f.sid'] = fsid, bl = bl, hl="en", _reqid = reqid-10000, rt = 'c'}
                    local body = stringifyQuery{['f.req'] = jsonE(freq)}
                    
                    local req = got(url, "POST", body)
                    
                    local body = jsonD(req.Body:match'%[.-%]\n')
                    local translationData = jsonD(body[1][3])
                    local result = {
                        text = "",
                        from = {
                            language = "",
                            text = ""
                        },
                        raw = ""
                    }
                    result.raw = translationData
                    result.text = translationData[2][1][1][6][1][1]
                    
                    result.from.language = translationData[3]
                    result.from.text = translationData[2][5][1]

                    return result
                end
            end

            local Players = game:GetService("Players")
            local LP = Players.LocalPlayer
            local StarterGui = game:GetService('StarterGui')
            for i=1, 15 do
                local r = pcall(StarterGui["SetCore"])
                if r then break end
                game:GetService('RunService').RenderStepped:wait()
            end
            wait()

            local properties = {
                Color = Color3.new(1,1,0);
                Font = Enum.Font.SourceSansItalic;
                TextSize = 16;
            }

            game:GetService("StarterGui"):SetCore("SendNotification",
                {
                    Title = "Chat Translator",
                    Text = "Ported to Google Translate",
                    Duration = 3
                }
            )
                            
            properties.Text = "[TR] To send messages in a language, say > followed by the target language/language code, e.g.: >ru or >russian. To disable (go back to original language), say >d."
            StarterGui:SetCore("ChatMakeSystemMessage", properties)

            function translateFrom(message)
                local translation = translate(message, YourLang)

                local text
                if translation.from.language ~= YourLang then 
                    text = translation.text
                end

                return {text, translation.from.language}
            end

            -- // CHAT FUNCTIONS // --

            local CBar, Connected = LP['PlayerGui']:WaitForChild('Chat')['Frame'].ChatBarParentFrame['Frame'].BoxFrame['Frame'].ChatBar, {}
            local EventFolder = game:GetService('ReplicatedStorage'):WaitForChild('DefaultChatSystemChatEvents')
            local Chat do
                function Chat(Original, msg, Channel)
                    CBar.Text = msg
                    for i,v in pairs(getconnections(CBar.FocusLost)) do
                        v:Fire(true, nil, true)
                    end
                end

                --[[
                local ChatMain = LP.PlayerScripts:FindFirstChild('ChatMain', true)
                local MessageSender if ChatMain then
                    MessageSender = require(ChatMain.MessageSender)
                    ChatMain = require(ChatMain)
                end

                function Chat(Original, msg, Channel)
                    Channel = Channel or "All"
                    if MessageSender and ChatMain then
                        ChatMain.MessagePosted:fire(Original)
                        MessageSender:SendMessage(msg, Channel)
                    else
                        if not _G.SecureChat then
                            game:GetService('Players'):Chat(Original); 
                        end
                        EventFolder.SayMessageRequest:FireServer(msg, Channel)
                    end
                end]]
            end

            do -- :Chatted replacement!!
                function get(plr, msg)
                    print(msg)
                    local tab = translateFrom(msg)
                    local translation = tab[1]
                    print(translation)
                    if translation then
                        properties.Text = "("..tab[2]:upper()..") ".."[".. plr .."]: "..translation
                        StarterGui:SetCore("ChatMakeSystemMessage", properties)
                    end
                end

                EventFolder:WaitForChild("OnMessageDoneFiltering").OnClientEvent:Connect(function(data)
                    if data == nil then return end

                    local plr = Players:FindFirstChild(data.FromSpeaker)
                    local msg = tostring(data.Message)
                    local originalchannel = tostring(data.OriginalChannel)

                    if plr then 
                        plr = plr.DisplayName 
                    else 
                        plr = tostring(data.FromSpeaker)
                    end

                    if originalchannel:find("To ") then
                        plr = plr..originalchannel
                    end

                    get(plr, msg)
                end)
            end

            local sendEnabled = false
            local target = ""

            function translateTo(message, target)
                target = target:lower() 
                local translation = translate(message, target, "auto")

                return translation.text
            end

            function disableSend()
                sendEnabled = false
                properties.Text = "[TR] Sending Disabled"
                StarterGui:SetCore("ChatMakeSystemMessage", properties)
            end


            local HookChat = function(Bar)
                coroutine.wrap(function()
                    if not table.find(Connected,Bar) then
                        local Connect = Bar['FocusLost']:Connect(function(Enter, _, ignore)
                            if ignore then return end
                            if Enter ~= false and Bar.Text ~= '' then
                                local Message = Bar.Text
                                Bar.Text = ''
                                if Message == ">d" then
                                    disableSend()
                                elseif Message:sub(1,1) == ">" and not Message:find(" ") then
                                    if getISOCode(Message:sub(2)) then
                                        sendEnabled = true
                                        target = Message:sub(2)
                                    else
                                        properties.Text = "[TR] Invalid language"
                                        StarterGui:SetCore("ChatMakeSystemMessage", properties)
                                    end
                                elseif sendEnabled and not (Message:sub(1,3) == "/e " or Message:sub(1,7) == "/emote ") then
                                    local og = Message
                                    Message = translateTo(Message, target)
                                    --Bar.Text = Message
                                    Chat(og, Message)
                                else
                                    --Bar.Text = Message
                                    Chat(Message, Message)
                                end
                            end
                        end)
                        Connected[#Connected+1] = Bar; Bar['AncestryChanged']:Wait(); Connect:Disconnect()
                    end
                end)()
            end

            HookChat(CBar); local BindHook = Instance.new('BindableEvent')

            local MT = getrawmetatable(game); local NC = MT.__namecall; setreadonly(MT, false)

            MT.__namecall = newcclosure(function(...)
                local Method, Args = getnamecallmethod(), {...}
                if rawequal(tostring(Args[1]),'ChatBarFocusChanged') and rawequal(Args[2],true) then 
                    if LP['PlayerGui']:FindFirstChild('Chat') then
                        BindHook:Fire()
                    end
                end
                return NC(...)
            end)

            BindHook['Event']:Connect(function()
                CBar = LP['PlayerGui'].Chat['Frame'].ChatBarParentFrame['Frame'].BoxFrame['Frame'].ChatBar
                HookChat(CBar)
            end)
        end;
        ChatFixer = function()

            game:GetService("Players").LocalPlayer.PlayerGui.Chat.Frame.Size = UDim2.new(0.35,0,0.45,0)

            local scroller = game:GetService("Players").LocalPlayer.PlayerGui.Chat.Frame.ChatChannelParentFrame.Frame_MessageLogDisplay.Scroller
            scroller.AutomaticCanvasSize = Enum.AutomaticSize.Y

            for i,v in pairs(scroller:GetChildren()) do
                v.Size = UDim2.new(1,0,0,84)
                v.TextLabel.TextSize = 16
                if v.TextLabel:FindFirstChild("TextButton") then
                    v.TextLabel.TextButton.TextSize = 16
                end
                v.Size = UDim2.new(1,0,0,v.TextLabel.TextBounds.Y)
                task.wait()
                if not v.TextLabel.TextFits then
                    v.TextLabel.RichText = true
                end
            end

            scroller.ChildAdded:Connect(function(child)

                local alls = 0
                for i,v in pairs(scroller:GetChildren()) do
                    if v and v:IsA("Frame") then
                        alls = v.Size.Y.Offset + alls
                    end
                    if not v then
                        alls = 0
                    end
                end

                child.Size = UDim2.new(1,0,0,84)
                child.Position = UDim2.new(1,0,0,alls)
                child.TextLabel.TextSize = 16
                if child.TextLabel:FindFirstChild("TextButton") then
                    child.TextLabel.TextButton.TextSize = 16
                end
                child.Size = UDim2.new(1,0,0,child.TextLabel.TextBounds.Y)
                task.wait()
                --scroller.CanvasSize = UDim2.new(0,0,0,alls+child.TextLabel.TextBounds.Y)
                if not child.TextLabel.TextFits then
                    child.TextLabel.RichText = true
                end
                scroller.CanvasPosition = Vector2.new(0,scroller.AbsoluteCanvasSize.Y-scroller.AbsoluteWindowSize.Y)
            end)

        end;
    };
    Commands = {
        GoTo = {
            Aliases = {
                ['goto'] = true;
                ['to'] = true;
            };
            Description = "Teleports you to another player.";
            Function = function(sender,args)
                if args[1] then
                    local player = Functions.GetPlayer(sender,args[1])
                    if player and player.Character and Functions.GetRoot(player.Character) and Players.LocalPlayer.Character and Functions.GetRoot(Players.LocalPlayer.Character) then
                        Functions.GetRoot(Players.LocalPlayer.Character).CFrame = Functions.GetRoot(player.Character).CFrame
                    end
                end
            end
        };
        TestingMode = {
            Aliases = {
                ['testingmode'] = true;
                ['testmode'] = true;
                ['tm'] = true;
            };
            Description = "Enables or disables testing modes for certain functions.";
            Function = function(sender,args)
                local func = args[1]
                local state = Functions.GetBool(args[2])
                if func and TestingModes[func] ~= nil and state ~= nil then
                    TestingModes[func] = state
                    Functions.Chat("{Brynhildr} Testing mode for "..func.." switched to "..tostring(state)..".")
                end
            end;
        };
        GetList = {
            Aliases = {
                ['getlist'] = true;
                ['getl'] = true;
                ['gl'] = true;
            };
            Description = "Prints the full list provided in the console.";
            Function = function(sender,args)
                local listNamesTable = {}
                for n,t in pairs(Lists) do
                    listNamesTable[string.lower(n)] = n
                end
                local count = 0
                local listName = listNamesTable[args[1]]
                print("List name: "..listName)
                print("----------- // "..string.upper(listName).."ED PLAYERS // -----------")
                for n,t in pairs(Lists[listName]) do
                    print("--- MODE START: "..string.upper(n).." ---")
                    for w,p in pairs(t) do
                        count += 1
                        print(count, p)
                    end
                end
                Functions.Chat("{Brynhildr} I have printed the provided list to the console.")
            end;
        };
        Whitelist = {
            Aliases = {
                ['whitelist'] = true;
                ['wl'] = true;
            };
            Description = "Whitelists a player so certain functions don't target them.";
            Function = function(sender,args)
                if args[1] then
                    local player = Functions.GetPlayer(sender,args[1])
                    local mode = "Permanent"
                    if args[2] and Functions.GetModeFromText(args[2]) and Lists.Whitelist[Functions.GetModeFromText(args[2])] then
                        mode = Functions.GetModeFromText(args[2])
                    end
                    if player then
                        if typeof(player) == "Instance" then player = player.Name end
                        if not Functions.ListFind("Whitelist",player,mode) then
                            Functions.ListInsert("Whitelist",player,mode)
                            Functions.Chat("{Brynhildr} Added "..player.." to the "..mode.." Whitelist.")
                        end
                    end
                end
            end;
        };
        UnWhitelist = {
            Aliases = {
                ['unwhitelist'] = true;
                ['unwl'] = true;
            };
            Description = "Unwhitelists a player so certain functions do target them.";
            Function = function(sender,args)
                if args[1] then
                    local player = Functions.GetPlayer(sender,args[1])
                    local mode = "Permanent"
                    if args[2] and Functions.GetModeFromText(args[2]) and Lists.Whitelist[Functions.GetModeFromText(args[2])] then
                        mode = Functions.GetModeFromText(args[2])
                    end
                    if player then
                        if Functions.ListFind("Whitelist",player.Name,mode) then
                            Functions.ListRemove("Whitelist",player.Name,mode)
                            Functions.Chat("{Brynhildr} Removed "..player.Name.." from the "..mode.." Whitelist.")
                        end
                    end
                end
            end;
        };
        Target = {
            Aliases = {
                ['target'] = true;
                ['tg'] = true;
            };
            Description = "Adds a player to a targetlist of your choosing. Default mode is normal.";
            Function = function(sender,args)
                local defaultMode = "Normal"
                if args[2] and Functions.GetModeFromText(args[2]) then
                    defaultMode = Functions.GetModeFromText(args[2])
                end
                if args[1] then
                    local player = Functions.GetPlayer(sender,args[1])
                    if player then
                        if typeof(player) ~= "Instance" then
                            if player == "all" then
                                for _,v in pairs(Players:GetPlayers()) do
                                    if (table.find(WLPunishment,v.Name) or not Functions.ListFind("Whitelist",v.Name)) and not Functions.ListFind("Targetlist",v.Name,defaultMode) then
                                        Functions.ListInsert("Targetlist",v.Name,defaultMode)
                                    end
                                end
                                Functions.Chat("{Brynhildr} Added all UnWhitelisted players to the "..defaultMode.." Targetlist.")
                                return
                            end
                        else
                            player = player.Name
                        end
                        if Functions.ListFind("Whitelist",player) then
                            Functions.ListRemove("Whitelist",player)
                            Functions.Chat("{Brynhildr} Removed "..player.." from the Whitelist.")
                        end
                        if not Functions.ListFind("Targetlist",player,defaultMode) then
                            Functions.ListInsert("Targetlist",player,defaultMode)
                            Functions.Chat("{Brynhildr} Added "..player.." to the "..defaultMode.." Targetlist.")
                        end
                    end
                end
            end;
        };
        UnTarget = {
            Aliases = {
                ['untarget'] = true;
                ['untg'] = true;
            };
            Description = "Removes a player from the selected targetlist. Default mode is normal.";
            Function = function(sender,args)
                local defaultMode = "Normal"
                if args[2] and Functions.GetModeFromText(args[2]) then
                    defaultMode = Functions.GetModeFromText(args[2])
                end
                if args[1] then
                    local player = Functions.GetPlayer(sender,args[1])
                    if player then
                        if typeof(player) ~= "Instance" then
                            if player == "all" then
                                for _,v in pairs(Players:GetPlayers()) do
                                    if Functions.ListFind("Targetlist",v.Name,defaultMode) then
                                        Functions.ListRemove("Targetlist",v.Name,defaultMode)
                                    end
                                end
                                Functions.Chat("{Brynhildr} Removed all players from the "..defaultMode.." Targetlist.")
                                return
                            end
                        else
                            player = player.Name
                        end
                        if Functions.ListFind("Targetlist",player,defaultMode) then
                            Functions.ListRemove("Targetlist",player,defaultMode)
                            Functions.Chat("{Brynhildr} Removed "..player.." from the "..defaultMode.." Targetlist.")
                        end
                    end
                end
            end;
        };
        DisableShurs = {
            Aliases = {
                ['disableshurs'] = true;
                ['disable'] = true;
                ['disshurs'] = true;
                ['ds'] = true;
            };
            Description = "Adds a player to the DisableShurslist.";
            Function = function(sender,args)
                local defaultMode = "Permanent"
                if args[2] and Functions.GetModeFromText(args[2]) then
                    defaultMode = Functions.GetModeFromText(args[2])
                end
                if args[1] then
                    local player = Functions.GetPlayer(sender,args[1])
                    if player then
                        if typeof(player) ~= "Instance" then
                            if player == "all" then
                                for _,v in pairs(Players:GetPlayers()) do
                                    if not Functions.ListFind("DisableShurslist",v.Name,defaultMode) then
                                        Functions.ListInsert("DisableShurslist",v.Name,defaultMode)
                                    end
                                end
                                Functions.Chat("{Brynhildr} Added all players to the "..defaultMode.." DisableShurslist.")
                                return
                            end
                        else
                            player = player.Name
                        end
                        if not Functions.ListFind("DisableShurslist",player,defaultMode) then
                            Functions.ListInsert("DisableShurslist",player,defaultMode)
                            Functions.Chat("{Brynhildr} Added "..player.." to the "..defaultMode.." DisableShurslist.")
                        end
                    end
                end
            end;
        };
        Chat = {
            Aliases = {
                ['chat'] = true;
                ['c'] = true;
            };
            Description = "Chats for a speficied player in the roblox chat.";
            Function = function(sender,args,stringargs)
                if args[1] then
                    local player = Functions.GetPlayer(sender,args[1])
                    if player and (player == Players.LocalPlayer or player == "all") then
                        local playername = string.sub(stringargs,1,string.len(args[1]) + 2)
                        local msg = string.sub(stringargs,string.len(playername),string.len(stringargs))
                        if msg then
                            game:GetService("ReplicatedStorage"):WaitForChild("DefaultChatSystemChatEvents"):WaitForChild("SayMessageRequest"):FireServer(msg,"All")
                        end
                    end
                end
            end;
        };
        AddAlt = {
            Aliases = {
                ['addalt'] = true;
                ['alt'] = true;
                ['add'] = true;
            };
            Description = "Adds an alt to your list of alts.";
            Function = function(sender,args)
                for i = 1, #args, 1 do
                    local player = Functions.GetPlayer(sender,args[i])
                    if player and player ~= "all" and player ~= "me" and not table.find(Alts,player.Name) then
                        table.insert(Alts,player.Name)
                        Functions.Chat("{Brynhildr} Added "..player.Name.." to the alt list.")
                        for i,v in pairs(Alts) do
                            print(i,v)
                        end
                        Functions.PlayerRemoved['Alts/'..player.Name] = function(plr)
                            if plr == player then
                                table.remove(Alts,table.find(Alts,player.Name))
                            end
                        end
                    end
                end
            end;
        };
        Teleport = {
            Aliases = {
                ['teleport'] = true;
                ['tp'] = true;
            };
            Description = "Teleports a player to another player.";
            Function = function(sender,args)
                if args[1] and args[2] then
                    local player1 = Functions.GetPlayer(sender,args[1])
                    local player2 = Functions.GetPlayer(sender,args[2])
                    if player1 and player2 and player2.Character and Functions.GetRoot(player2.Character) and (player1 == Players.LocalPlayer or player1 == "all") and Character and Functions.GetRoot(Character) then
                        Functions.GetRoot(Character).CFrame = Functions.GetRoot(player2.Character).CFrame
                    end
                end
            end;
        };
        CircleTeleport = {
            Aliases = {
                ['circleteleport'] = true;
                ['circletp'] = true;
                ['ctp'] = true;
            };
            Description = "Teleports you and other alts to another player in a circle.";
            Function = function(sender,args)
                if args[1] then
                    local player = Functions.GetPlayer(sender,args[1])
                    if player and player.Character and player.Character:FindFirstChild("HumanoidRootPart") and Character and Character:FindFirstChild("HumanoidRootPart") then
                        local numOfParts = #Alts
                        local fullCircle = 2 * math.pi
                        local radius = Variables.CircleRadius
                        local function XAndYPositions(angle)
                            local x = math.cos(angle) * radius
                            local z = math.sin(angle) * radius
                            return x, z
                        end
                        for i,v in pairs(Alts) do
                            if v == Players.LocalPlayer.Name then
                                local playerHRP = Functions.GetRoot(player.Character)
                                local lpHRP = Functions.GetRoot(Character)
                                local angle = i * (fullCircle / numOfParts)
                                local x, z = XAndYPositions(angle)
                                local position = (playerHRP.CFrame * CFrame.new(x, 0, z)).p
                                local lookAt = playerHRP.Position
                                lpHRP.CFrame = CFrame.new(position, lookAt)
                            end
                        end
                    end
                end
            end;
        };
        LoopCircleTeleport = {
            Aliases = {
                ['loopcircleteleport'] = true;
                ['loopcircletp'] = true;
                ['loopctp'] = true;
                ['lctp'] = true;
            };
            Description = "Constantly calls the circle teleport command to a specified player";
            Function = function(sender,args)
                if args[1] then
                    local player = Functions.GetPlayer(sender,args[1])
                    if player and player.Character and player.Character:FindFirstChild("HumanoidRootPart") and Character and Character:FindFirstChild("HumanoidRootPart") then
                        Variables.CircleTeleport = false
                        task.wait()
                        Variables.CircleTeleport = true
                        local count = 1
                        task.spawn(function()
                            while Variables.CircleTeleport do
                                if player and player.Character and player.Character:FindFirstChild("HumanoidRootPart") and Character and Character:FindFirstChild("HumanoidRootPart") then
                                    local numOfParts = #Alts
                                    local fullCircle = 2 * math.pi
                                    local radius = Variables.CircleRadius
                                    local function XAndYPositions(angle)
                                        local x = math.cos(angle) * radius
                                        local z = math.sin(angle) * radius
                                        return x, z
                                    end
                                    for i,v in pairs(Alts) do
                                        if v == Players.LocalPlayer.Name then
                                            local num = i + (count / 100)
                                            local playerHRP = Functions.GetRoot(player.Character)
                                            local lpHRP = Functions.GetRoot(Character)
                                            local angle = num * (fullCircle / numOfParts)
                                            local x, z = XAndYPositions(angle)
                                            local position = (playerHRP.CFrame * CFrame.new(x, 0, z)).p
                                            local lookAt = playerHRP.Position
                                            lpHRP.Velocity = Vector3.new()
                                            lpHRP.CFrame = CFrame.new(position, lookAt)
                                        end
                                    end
                                end
                                count += 1
                                task.wait(0.03)
                            end
                        end)
                    end
                end
            end;
        };
        UnLoopCircleTeleport = {
            Aliases = {
                ['unloopcircleteleport'] = true;
                ['unloopcircletp'] = true;
                ['unloopctp'] = true;
                ['unlctp'] = true;
                ['ulctp'] = true;
            };
            Description = "Stops calling the circle teleport command.";
            Function = function(sender,args)
                if args[1] then
                    local player = Functions.GetPlayer(sender,args[1])
                    if player and (player == Players.LocalPlayer or player == "all") then
                        Variables.CircleTeleport = false
                    end
                end
            end;
        };
        Follow = {
            Aliases = {
                ['follow'] = true;
            };
            Description = "Follows a player around wherever they go.";
            Function = function(sender,args)
                if args[1] and args[2] then
                    local player1 = Functions.GetPlayer(sender,args[1])
                    local player2 = Functions.GetPlayer(sender,args[2])
                    if player1 and player2 and (player1 == Players.LocalPlayer or player1 == "all") then
                        if Character:FindFirstChild('Humanoid') and Character.Humanoid:FindFirstChild("SeatPart") then
                            Character.Humanoid.Sit = false
                            task.wait(.1)
                        end
                        Variables.Follow = false
                        task.wait()
                        Variables.Follow = true
                        task.spawn(function()
                            while Variables.Follow do
                                if player2.Character and Functions.GetRoot(player2.Character) then
                                    Character:FindFirstChild('Humanoid'):MoveTo(Functions.GetRoot(player2.Character).Position)
                                end
                                task.wait()
                            end
                        end)
                    end
                end
            end;
        };
        UnFollow = {
            Aliases = {
                ['unfollow'] = true;
            };
            Description = "Stops following a player";
            Function = function(sender,args)
                if args[1] then
                    local player = Functions.GetPlayer(sender,args[1])
                    if player and (player == Players.LocalPlayer or player == "all") then
                        Variables.Follow = false
                    end
                end
            end;
        };
        Rejoin = {
            Aliases = {
                ['rejoin'] = true;
                ['rj'] = true;
            };
            Description = "Forces you or an alt to rejoin.";
            Function = function(sender,args)
                if args[1] then
                    local player = Functions.GetPlayer(sender,args[1])
                    if player and (player == Players.LocalPlayer or player == "all") then
                        if #Players:GetPlayers() <= 1 then
                            Players.LocalPlayer:Kick("\nRejoining...")
                            task.wait(0.03)
                            game:GetService('TeleportService'):Teleport(game.PlaceId, Players.LocalPlayer)
                        else
                            game:GetService('TeleportService'):TeleportToPlaceInstance(game.PlaceId, game.JobId, Players.LocalPlayer)
                        end
                    end
                end
            end;
        };
        Kill = {
            Aliases = {
                ['kill'] = true;
                ['kl'] = true;
            };
            Description = "Adds a player to the soft targetlist.";
            Function = function(sender,args)
                if args[1] then
                    local player = Functions.GetPlayer(sender,args[1])
                    if player and player ~= Players.LocalPlayer and player ~= "all" then
                        if not Functions.ListFind("Targetlist",player.Name) and (table.find(WLPunishment,player.Name) or not Functions.ListFind("Whitelist",player.Name)) then
                            Functions.ListInsert("Targetlist",player.Name,"Soft")
                        end
                    elseif player == "all" then
                        for i,v in pairs(Players:GetPlayers()) do
                            if not Functions.ListFind("Targetlist",v.Name) and (table.find(WLPunishment,v.Name) or not Functions.ListFind("Whitelist",v.Name)) then
                                Functions.ListInsert("Targetlist",v.Name,"Soft")
                            end
                        end
                    end
                end
            end
        };
        God = {
            Aliases = {
                ['g'] = true;
                ['god'] = true;
                ['godmode'] = true;
            };
            Description = "Gods whoever you want. First argument tells who will god and second argument tells who the player will god.";
            Function = function(sender,args)
                if args[1] and ((not args[2]) or (Functions.GetPlayer(sender,args[2])) == Players.LocalPlayer) then
                    local plrstogod = {}
                    if string.find(args[1],",") then
                        local str = args[1]
                        if string.find(str," ") then
                            str = str:gsub(" ","")
                        end
                        str = str:split(",")
                        for _,v in pairs(str) do
                            local plr = Functions.GetPlayer(sender,v)
                            if plr ~= nil then
                                table.insert(plrstogod, plr)
                            end
                        end
                    else
                        local plr = Functions.GetPlayer(sender,args[1])
                        if plr ~= nil then
                            table.insert(plrstogod, plr)
                        end
                    end
                    if #plrstogod ~= 0 then
                        for _,plrtogod in pairs(plrstogod) do
                            if plrtogod and plrtogod.Character and plrtogod.Character:FindFirstChild("Humanoid") and plrtogod.Character:FindFirstChild("Head") and not Functions.IsGodded(plrtogod) then
                                if Fluent.Options.AutoTarget.Value == true then
                                    Fluent.Options.AutoTarget:SetValue(false)
                                end
                                if Fluent.Options.AutoWhitelistTarget.Value == true then
                                    Fluent.Options.AutoWhitelistTarget:SetValue(false)
                                end
                                if Fluent.Options.PunishPlayers.Value == true then
                                    Fluent.Options.PunishPlayers:SetValue(false)
                                end
                                if Fluent.Options.PunishWL.Value == true then
                                    Fluent.Options.PunishWL:SetValue(false)
                                end
                                local Modes = {"Soft","Semi","Normal"}
                                for i = 1,#Modes do
                                    Functions.ListClear("Targetlist",Modes[i])
                                end
                                task.wait(3)
                                if Players.LocalPlayer.leaderstats.Ninjutsu.Value > 0 then
                                    Variables.GainingNegativeNin = true
                                    task.wait(0.72)
                                    ReplicatedStorage.RemoteEvent.AddPowerEvent:FireServer("FromTraining", -10000000000000000000000000000)
                                    task.wait(0.72)
                                    ReplicatedStorage.RemoteEvent.AddPowerEvent:FireServer("FromTraining", -99900000000000000000000000000099999.99)
                                    task.wait(0.72)
                                    Variables.GainingNegativeNin = false
                                end
                                local isInPermWL = false
                                if Functions.ListFind("Whitelist",plrtogod.Name,"Permanent") then
                                    isInPermWL = true
                                    Functions.ListRemove("Whitelist",plrtogod.Name)
                                elseif Functions.ListFind("Whitelist",plrtogod.Name) then
                                    Functions.ListRemove("Whitelist",plrtogod.Name)
                                end
                                local oldPlrPos = Functions.GetRoot(plrtogod.Character).CFrame
                                Functions.ListInsert("Targetlist",plrtogod.Name,"Normal")
                                if Fluent.Options.AutoFire.Value == false then
                                    Fluent.Options.AutoFire:SetValue(true)
                                end
                                task.wait(1)
                                repeat task.wait() until plrtogod.Character.Humanoid.Health >= 20000000000000000000
                                Functions.ListRemove("Targetlist",plrtogod.Name,"Normal")
                                task.wait()
                                Functions.GetRoot(plrtogod.Character).CFrame = oldPlrPos
                                if isInPermWL then
                                    Functions.ListInsert("Whitelist",plrtogod.Name,"Permanent")
                                end
                            end
                        end
                        local PlaceId, JobId = game.PlaceId, game.JobId
                        if #Players:GetPlayers() <= 1 then
                            Players.LocalPlayer:Kick("\nRejoining...")
                            task.wait(0.03)
                            TeleportService:Teleport(PlaceId, Players.LocalPlayer)
                        else
                            TeleportService:TeleportToPlaceInstance(PlaceId, JobId, Players.LocalPlayer)
                        end
                    end
                end
            end;
        };
        Console = {
            Aliases = {
                ['console'] = true;
                ['con'] = true;
                ['cs'] = true;
            };
            Description = "Opens the developer console.";
            Function = function(sender,args)
                game.StarterGui:SetCore("DevConsoleVisible", true)
            end;
        };
    };
    Settings = {
        PlayerShurikenAttackedList = {};
        PlayerSwordAttackedList = {};
        SoundVolumes = {};
        SelectedClothing = {};
        SelectedShuriken = {};
        SelectedSword = {};
        Weapons = {'Sword', 'Shuriken', 'Teleport'};
        Modes = {'Soft', 'Semi', 'Normal', 'Permanent'};
        Tools = {'Train', 'Sword', 'Shuriken', 'Teleport'};
        ESPText = {"Distance", "State", "Bubble", "Godded"};
        BodyParts = {"Head","HumanoidRootPart","UpperTorso","LowerTorso","RightUpperArm","LeftUpperArm","RightLowerArm","LeftLowerArm","RightHand","LeftHand","RightUpperLeg","LeftUpperLeg","RightLowerLeg","LeftLowerLeg","RightFoot", "LeftFoot"};
        Clothing = {"Neutral1","Neutral2","Neutral3","Neutral4","Neutral5","Neutral6","Neutral7","Ying8","Ying9","Ying10","Ying11","Ying12","Ying13","Ying14","Ying15","Ying16","Ying17","Ying18","Ying19","Ying20","Ying21","Ying22","Ying23","Ying24","Ying25","Ying26","Yang8","Yang9","Yang10","Yang11","Yang12","Yang13","Yang14","Yang15","Yang16","Yang17","Yang18","Yang19","Yang20","Yang21","Yang22","Yang23","Yang24","Yang25","Yang26","GroupMemberCloth1","GroupMemberCloth2","GroupMemberCloth3","GroupMemberCloth4","GroupMemberCloth5","GroupMemberCloth6","GroupMemberCloth7","GroupMemberCloth8","GroupMemberCloth9","GroupMemberCloth10","GroupMemberCloth11","GroupMemberCloth12","GroupMemberCloth13","GroupMemberCloth14","GroupMemberCloth15","GroupMemberCloth16","VipPackCloth","PizzaPackCloth","RainbowPackCloth"};
        Shuriken = {"Shuriken1","Shuriken2","Shuriken3","Shuriken4","Shuriken5","Shuriken6","Shuriken7","Shuriken8Ying","Shuriken9Ying","Shuriken8Yang","Shuriken9Yang","OctopusCannon","GrabBag","BoomerangDagger","WarRock","Handle","DarkageKunai","ThrowingDonuts","StarfishShuriken","FlowerStar1","FlowerStar2","FlowerStar3","GhostDagger","PizzaKunai","Chakra","MetallicThrowingKnives"};
        Sword = {"WoodenSword1","WoodenSword2","BambooKatana","Katana","JadeKatanaOfTheDarkestForest","GoldenKatanaOfTheUnflinchingDawn","OcherousKatanaOfTheSettingSun","CrimsonKatanaOfTheUnsettingSun","IrisKatanaOfGoldengroveUnleaving","BlueKatanaOfOneThousandTears","Ninja Katana","Golden Katana","RoninKatana","BluesteelKatana","GoldenSnakeKatana","DarksteelKatanaOfAncientIlluminators","VilethornSword","ViridianKatana","Ocean Samurai","BlackironKatana","Claymore","MirrorSword","BladeFederation","FallenArtemisSwordAndShield","OrinthianSword","Bluesteel Sword","Saw Sword","EgyptianSword","DragonSword","ShadowDancer","Korblox Sword","BombasticExplodingSword","FireSword","DemonSword","FireAxe","DarkArtSword","Khopesh","Dragon Fire Sword","PhoenixSword","OmegaRainbowKatana","CrescendoTheSoulStealer","SwordOfRedEpicness","RedcliffAxe","BusterSword","SparkletimeClaymore","FangOfAnansi","CrimsonwrathSword","SwordOfDarkness","AduriteKatana","UltraKatana","Ghostwalker","BombtasticKatana","KnightsOfSplinteredSkiesSword","KnightSword","TempestBlades","Heartbreaker","BreakerSword","Draco Blade","Shadow Blade","Falchion","IceSword1","IceSword2","SwordOfLight","SorcusSword","WaterSword","Diamond Blade Sword","SnowShieldAndSword","WindSword","BoneSword","Ice Dragon Slaying Sword","TelamonsterTheChaosEdge","SerpentSword","Blizzard Sword","RainbowKatana","SpaceSword","DragonSword&Shield","RiddlingSkullSword","UpperSword","RidiculousSharkSword","LightUpSword","PurpleSword","WhiteGoldBlueFlowerSword","Dragon Mouth Fire Sword","BlackAndWhiteWingedSword","Frying Pan","GuitarSword","DualPlungers","SpringtimeCutlass","SummerSword","BigBugNet","Mackerel","BoardWithANailInIt","StopSignAxe","BoneScythe","ScytheOfSingularity","GrimAxe","BatWingScythe","PizzaSword","UnicornSword"};
        ShurikenPacks = {
            ["Shuriken"] = {"Shuriken1","Shuriken2","Shuriken3","Shuriken4","Shuriken5","Shuriken6","Shuriken7","Shuriken8Ying","Shuriken9Ying","Shuriken8Yang","Shuriken9Yang"};
            ["FunnyThrowPass"] = {"OctopusCannon","GrabBag","BoomerangDagger","WarRock","Handle","DarkageKunai","ThrowingDonuts","StarfishShuriken","FlowerStar1","FlowerStar2","FlowerStar3","GhostDagger"};
            ["PizzaPass"] = {"PizzaKunai"};
            ["VipPass"] = {"Chakra"};
            ["RainbowPass"] = {"MetallicThrowingKnives"};
        };
        SwordPacks = {
            ["Sword"] = {"WoodenSword1","WoodenSword2","BambooKatana","Katana","JadeKatanaOfTheDarkestForest","GoldenKatanaOfTheUnflinchingDawn","OcherousKatanaOfTheSettingSun","CrimsonKatanaOfTheUnsettingSun","IrisKatanaOfGoldengroveUnleaving","BlueKatanaOfOneThousandTears","Ninja Katana","Golden Katana","RoninKatana","BluesteelKatana","GoldenSnakeKatana","DarksteelKatanaOfAncientIlluminators","VilethornSword","ViridianKatana","Ocean Samurai","BlackironKatana","Claymore","MirrorSword","BladeFederation","FallenArtemisSwordAndShield","OrinthianSword","Bluesteel Sword","Saw Sword","EgyptianSword","DragonSword","ShadowDancer","Korblox Sword","BombasticExplodingSword","FireSword","DemonSword","FireAxe","DarkArtSword","Khopesh","Dragon Fire Sword","PhoenixSword","OmegaRainbowKatana","CrescendoTheSoulStealer","SwordOfRedEpicness","RedcliffAxe","BusterSword","SparkletimeClaymore","FangOfAnansi","CrimsonwrathSword","SwordOfDarkness","AduriteKatana","UltraKatana","Ghostwalker","BombtasticKatana","KnightsOfSplinteredSkiesSword","KnightSword","TempestBlades","Heartbreaker","BreakerSword","Draco Blade","Shadow Blade","Falchion","IceSword1","IceSword2","SwordOfLight","SorcusSword","WaterSword","Diamond Blade Sword","SnowShieldAndSword","WindSword","BoneSword","Ice Dragon Slaying Sword","TelamonsterTheChaosEdge","SerpentSword","Blizzard Sword","RainbowKatana","SpaceSword","DragonSword&Shield","RiddlingSkullSword","UpperSword","RidiculousSharkSword","LightUpSword","PurpleSword","WhiteGoldBlueFlowerSword","Dragon Mouth Fire Sword","BlackAndWhiteWingedSword"};
            ["FunnySwordPass"] = {"Frying Pan","GuitarSword","DualPlungers","SpringtimeCutlass","SummerSword","BigBugNet","Mackerel","BoardWithANailInIt","StopSignAxe"};
            ["VipPass"] = {"BoneScythe","ScytheOfSingularity","GrimAxe","BatWingScythe"};
            ["PizzaPass"] = {"PizzaSword"};
            ["RainbowPass"] = {"UnicornSword"};
        };
        AutoTargetMode = {
            ['Soft'] = true;
            ['Semi'] = false;
            ['Normal'] = false;
            ['Permanent'] = false;
        };
        AutoBreakShurikensMode = {
            ['Soft'] = true;
            ['Semi'] = false;
            ['Normal'] = false;
            ['Permanent'] = false;
        };
        AutoWhitelistTargetMode = {
            ['Soft'] = true;
            ['Semi'] = false;
            ['Normal'] = false;
            ['Permanent'] = false;
        };
        HoldClickMode = {
            ['Train'] = false;
            ['Sword'] = false;
            ['Shuriken'] = false;
            ['Teleport'] = false;
        };
        ESPSettings = {
            ['Distance'] = false;
            ['State'] = false;
            ['Bubble'] = false;
            ['Godded'] = false;
        };
        AddAllLists = {
            Whitelist = {
                Soft = false;
                Semi = false;
                Normal = false;
                Permanent = false;
            };
            Blacklist = {
                Soft = false;
                Semi = false;
                Normal = false;
                Permanent = false;
            };
            Targetlist = {
                Soft = false;
                Semi = false;
                Normal = false;
                Permanent = false;
            };
            BreakShurlist = {
                Soft = false;
                Semi = false;
                Normal = false;
                Permanent = false;
            };
            DisableShurslist = {
                Soft = false;
                Semi = false;
                Normal = false;
                Permanent = false;
            };
            
        };
        RainbowCosmeticSelection = {
            ['Clothing'] = false;
            ['Shuriken'] = false;
            ['Sword'] = false;
        };
        HitEventWeapons = {
            ['Sword'] = false;
            ['Shuriken'] = false;
            ['Teleport'] = false;
        };
        AutoEquipWeapons = {
            ['Sword'] = false;
            ['Shuriken'] = false;
            ['Teleport'] = false;
        };
    };
    Connections = {
        TouchedConnections = {};
        CharAddedConnections = {};
        BackpackChildAdded = {};
        MuteSoundConnections = {};
    };
    ESPTables = {
        SelectedPlayers = {};
    };
}

local MainWindow = Fluent:CreateWindow({
    Title = "Ninja Hub v"..VERSION,
    SubTitle = "by breezyjazzy9",
    TabWidth = 160,
    Size = UDim2.fromOffset(580,460),
    Acrylic = true,
    Theme = "Darker",
    MinimizeKey = Enum.KeyCode.LeftAlt
})

local Tabs = {
    Home = MainWindow:AddTab({ Title = "Home", Icon = "home" }),
    Training = MainWindow:AddTab({ Title = "Training", Icon = "axe" }),
    Lists = MainWindow:AddTab({ Title = "Lists", Icon = "scroll" }),
    Combat = MainWindow:AddTab({ Title = "Combat", Icon = "swords" }),
    Players = MainWindow:AddTab({ Title = "Players", Icon = "user-cog" }),
    Server = MainWindow:AddTab({ Title = "Server", Icon = "server" }),
    Cosmetics = MainWindow:AddTab({ Title = "Cosmetics", Icon = "shirt" }),
    Misc = MainWindow:AddTab({ Title = "Miscellaneous", Icon = "folders" }),
    Settings = MainWindow:AddTab({ Title = "Settings", Icon = "settings" })
}

Functions.Chat = function(message)
    game.StarterGui:SetCore("ChatMakeSystemMessage", {Text = message, Color = Color3.fromRGB(0,255,40), Font = Enum.Font.Fantasy})
end

Functions.ReplicatedChat = function(msg)
    game:GetService("ReplicatedStorage"):WaitForChild("DefaultChatSystemChatEvents"):WaitForChild("SayMessageRequest"):FireServer(msg,"All")
end

Functions.CommaValue = function(n)
    if tonumber(n) then
    	local left,num,right = string.match(n,'^([^%d]*%d)(%d*)(.-)$')
    	return left..(num:reverse():gsub('(%d%d%d)','%1,'):reverse())..right
    else
        return n
    end
end

Functions.GetRoot = function(char)
    local rootPart = char:FindFirstChild('HumanoidRootPart') or char:FindFirstChild('Torso') or char:FindFirstChild('UpperTorso')
    return rootPart
end

Functions.GetPlayer = function(sender,text)
    if text == "" then
        return nil
    end
    if text == "all" then
        return "all"
    end
    if text == "me" then
        return sender
    end
	for _,Player in pairs(Players:GetPlayers()) do
		if string.sub(string.lower(Player.Name),1,string.len(text)) == string.lower(text) then
			return Player
        elseif string.sub(string.lower(Player.DisplayName),1,string.len(text)) == string.lower(text) then
            return Player
        elseif tonumber(text) then
            Functions.Chat("{Brynhildr} Returning username from userid..") return Players:GetNameFromUserIdAsync(tonumber(text))
        end
	end
    return nil
end

Functions.CreateTween = function(object,info,args,play,destroyfunc)
    local tween = game:GetService("TweenService"):Create(object, info, args)
	if play == "NoWait" or play == true then
		tween:Play()
		tween.Completed:Connect(function()
			tween:Destroy()
            if destroyfunc then
                destroyfunc()
            end
		end)
		return
	elseif play == "Wait" then
		tween:Play()
		tween.Completed:Wait()
		tween:Destroy()
		return
	end
	return tween
end

Functions.PrefixCheck = function(message)
    if Prefixes[message[1]] then
        return message[2]
    elseif Prefixes[string.sub(message[1],1,1)] then
        local tempstring = message[1]:split(string.sub(message[1],1,1))
        return tempstring[2]
    end
    return nil
end

Functions.GetBool = function(text)
    if text == "on" or text == "true" then
        return true
    elseif text == "off" or text == "false" then
        return false
    end
    return nil
end

Functions.PlayersToStrings = function(tbl)
    local temptab = {}
    for i,v in pairs(tbl) do
        table.insert(temptab,v.Name)
    end
    return temptab
end

Functions.ClothingChange = function(Cloth)
    local event = game:GetService("ReplicatedStorage"):FindFirstChild("RemoteEvent"):FindFirstChild("GiveItemEvent")
    local Pack = string.lower(string.sub(Cloth, 1, 1))
    if Pack == "r" then
        event:FireServer("RainbowPass", Cloth)
    elseif Pack == "p" then
        event:FireServer("PizzaPass", Cloth)
    elseif Pack == "v" then
        event:FireServer("VipPass", Cloth)
    elseif Pack == "g" then
        event:FireServer("GroupMemberCloth", Cloth)
    else
        event:FireServer("Cloth", Cloth)
    end
end

Functions.ShurikenChange = function(Shur)
    local event = game:GetService("ReplicatedStorage"):FindFirstChild("RemoteEvent"):FindFirstChild("GiveItemEvent")
    local function GetPack()
        for n,t in pairs(Tables.Settings.ShurikenPacks) do
            if table.find(t,Shur) then
                return n
            end
        end
        return nil
    end
    local currentPack = GetPack()
    if currentPack then
        event:FireServer(currentPack,Shur)
    end
end

Functions.SwordChange = function(Sword)
    local event = game:GetService("ReplicatedStorage"):FindFirstChild("RemoteEvent"):FindFirstChild("GiveItemEvent")
    local function GetPack()
        for n,t in pairs(Tables.Settings.SwordPacks) do
            if table.find(t,Sword) then
                return n
            end
        end
        return nil
    end
    local currentPack = GetPack()
    if currentPack then
        event:FireServer(currentPack,Sword)
    end
end

Functions.ListFind = function(List,Value,Mode,Exclude)
    for n,t in pairs(Lists[List]) do
        if Mode ~= nil then
            if ((n == Mode and Exclude == nil) or (n == Mode and Exclude ~= nil and Exclude == false) or (n ~= Mode and Exclude ~= nil and Exclude == true)) then
                for w,p in pairs(t) do
                    if p == Value then
                        return w
                    end
                end
            end
        elseif Mode == nil then
            for w,p in pairs(t) do
                if p == Value then
                    return w
                end
            end
        end
    end
    return nil
end

Functions.ListRemove = function(List,Value,Mode)
    if Mode == nil then
        for n,t in pairs(Lists[List]) do
            for w,p in pairs(t) do
                if p == Value then
                    Lists[List][n][w] = nil
                end
            end
        end
    else
        if Lists[List][Mode][Value] ~= nil then
            Lists[List][Mode][Value] = nil
        end
    end
end

Functions.ListFunction = function(List,Value)
    if List == "Whitelist" then
        local Player = Players:FindFirstChild(Value)
        if Player then
            Functions.InitCharacterTouched(Player,"WL")
            Player.CharacterAdded:Connect(function()
                Functions.InitCharacterTouched(Player,"WL")
            end)
        end
    end
end

Functions.ListInsert = function(List,Value,Mode)
    Lists[List][Mode][Value] = Value
    Functions.ListFunction(List,Value)
end

Functions.ListEmpty = function(List)
    if List then
        for n,t in pairs(Lists[List]) do
            if next(t) ~= nil then
                return false
            end
        end
    else
        for n,t in pairs(Lists) do
            for w,p in pairs(t) do
                if next(p) ~= nil then
                    return false
                end
            end
        end
    end
    return true
end

Functions.ListClear = function(List,Mode)
    if List then
        for n,t in pairs(Lists[List]) do
            if Mode and n == Mode then
                for w,p in pairs(t) do
                    Lists[List][n][w] = nil
                end
            elseif not Mode then
                for w,p in pairs(t) do
                    Lists[List][n][w] = nil
                end
            end
        end
    else
        for n,t in pairs(Lists) do
            for w,p in pairs(t) do
                if Mode and n == Mode then
                    for i,v in pairs(p) do
                        Lists[n][w][i] = nil
                    end
                elseif not Mode then
                    for i,v in pairs(p) do
                        Lists[n][w][i] = nil
                    end
                end
            end
        end
    end
end

Functions.ListPlayerInServer = function(List)
    for n,t in pairs(Lists[List]) do
        for w,p in pairs(t) do
            if Players:FindFirstChild(p) then
                return w
            end
        end
    end
    return nil
end

Functions.GetListPlayersInServer = function(List,Mode)
    local tab = {}
    for n,t in pairs(Lists[List]) do
        if Mode and n == Mode then
            for w,p in pairs(t) do
                if Players:FindFirstChild(p) then
                    tab[p] = true
                end
            end
        elseif not Mode then
            for w,p in pairs(t) do
                if Players:FindFirstChild(p) then
                    tab[p] = true
                end
            end
        end
    end
    return tab
end

Functions.IsGodded = function(player)
    if not player:IsA("Model") and player.Character and player.Character:FindFirstChild("Humanoid") then
        if player.Character:FindFirstChild("Humanoid").Health >= 100000000000 then
            return true
        end
    elseif player:IsA("Model") and player:FindFirstChild("Humanoid") then
        if player:FindFirstChild("Humanoid").Health >= 100000000000 then
            return true
        end
    end
    return false
end

Functions.ClosestPlayer = function()
    local dist = math.huge
	local target = nil
	for i,v in pairs(game:GetService("Workspace"):GetChildren()) do
		if Character and v ~= Character then
			if v:FindFirstChild("Humanoid") and v:FindFirstChild(Variables.AimPart) then
                if v.Humanoid:GetState() ~= Enum.HumanoidStateType.Dead and not v:FindFirstChild("ForceField") and v.Humanoid.Health >= 1 and (Variables.FireOnGodMode == true or not Functions.IsGodded(v)) then
                    if (table.find(WLPunishment,v.Name) or not Functions.ListFind("Whitelist",v.Name)) and Character:FindFirstChild(Variables.AimPart) then
                        local Magnitude = (v:FindFirstChild(Variables.AimPart).Position - Character:FindFirstChild(Variables.AimPart).Position).Magnitude
                        if Magnitude < dist then
                            dist = Magnitude
                            target = v
                        end
                    end
                end
			end
		end
	end
	return target
end

Functions.GetBubble = function()
    if Character and Functions.GetRoot(Character) then
        local root = Functions.GetRoot(Character)
        local beforepos = root.CFrame
        local ff = Character:FindFirstChild("ForceField")
        if not ff then
            if Character.Humanoid.Health == Character.Humanoid.MaxHealth then
                repeat
                    root.CFrame = CFrame.new(70,98,-335)
                    wait()
                until Character:FindFirstChild("ForceField")
                root.CFrame = beforepos
            end
        else
            return
        end
    end
end

Functions.GetModeFromText = function(Text)
    if Text == "soft" then
        return "Soft"
    elseif Text == "semi" then
        return "Semi"
    elseif Text == "norm" or Text == "normal" then
        return "Normal"
    elseif Text == "perm" or Text == "permanent" then
        return "Permanent"
    end
    return nil
end

Functions.GetTargetPlayer = function()
    local Player = nil
    if not Functions.ListEmpty("Targetlist") and Functions.ListPlayerInServer("Targetlist") then
        for n,t in pairs(Lists.Targetlist) do
            for w,p in pairs(t) do
                if Players:FindFirstChild(p) then
                    local v = Players:FindFirstChild(p)
                    if v and v.Character and v.Character ~= Character and (table.find(WLPunishment,v.Name) or not Functions.ListFind("Whitelist",v.Name)) and (Variables.FireOnGodMode or not Functions.IsGodded(v)) and v.Character:FindFirstChild("Humanoid") and v.Character.Humanoid:GetState() ~= Enum.HumanoidStateType.Dead and not v.Character:FindFirstChild("ForceField") and v.Character.Humanoid.Health > 0 then
                        Player = v.Character
                    end
                end
            end
        end
    elseif not Functions.ListEmpty("Blacklist") and Functions.ListPlayerInServer("Blacklist") then
        for i,name in pairs(Lists.Blacklist) do
            if Players:FindFirstChild(name) then
                local v = Players:FindFirstChild(name)
                if v and v.Character and v.Character ~= Character and (table.find(WLPunishment,v.Name) or not Functions.ListFind("Whitelist",v.Name)) and (Variables.FireOnGodMode or not Functions.IsGodded(v)) and v.Character:FindFirstChild("Humanoid") and v.Character.Humanoid:GetState() ~= Enum.HumanoidStateType.Dead and not v.Character:FindFirstChild("ForceField") and v.Character.Humanoid.Health > 0 then
                    Player = v.Character
                end
            end
        end
    elseif Functions.ClosestPlayer() then
        Player = Functions.ClosestPlayer()
    end
    return Player
end

Functions.SaveSettings = function()
    local httpservice = game:GetService("HttpService")
    if (writefile) then
        local Settings = {}
        for n,t in pairs(Lists) do
            Settings['Permanent'..n] = t.Permanent
        end
        writefile(filename,httpservice:JSONEncode(Settings))
    end
end

Functions.LoadSettings = function()
    local httpservice = game:GetService("HttpService")
    if (readfile and isfile and isfile(filename)) then
        local Settings = httpservice:JSONDecode(readfile(filename))
        for n,t in pairs(Lists) do
            if Settings['Permanent'..n] then
                Lists[n].Permanent = Settings['Permanent'..n]
            end
        end
    end
end

Functions.CheckAllParts = function(char)
    for _,v in pairs(Tables.Settings.BodyParts) do
        if not char:FindFirstChild(v) then
            char:WaitForChild(v,math.huge)
        end
    end
    return true
end

Functions.InitCharacterTouched = function(Player,CharType)
    if Player.Character then
        Functions.CheckAllParts(Player.Character)
        for _,v in pairs(Player.Character:GetDescendants()) do
            if v:IsA("BasePart") then
                v.Touched:Connect(function(child)
                    task.spawn(function()
                        if child.Name == "ThrownKunai" and child:WaitForChild("creator").Value.Name ~= Player.Name and child:WaitForChild("creator").Value ~= Players.LocalPlayer and not table.find(Tables.Settings.PlayerShurikenAttackedList,child) then
                            table.insert(Tables.Settings.PlayerShurikenAttackedList,child)
                            Functions.CreateLogLabel("Combat", "Player Hit", child.creator.Value.Name.." attacked "..Player.Name.." with a SHURIKEN.")
                            child.AncestryChanged:Connect(function(part,parent)
                                if parent ~= workspace and table.find(Tables.Settings.PlayerShurikenAttackedList,child) then
                                    table.remove(Tables.Settings.PlayerShurikenAttackedList,table.find(Tables.Settings.PlayerShurikenAttackedList,child))
                                end
                            end)
                        elseif child.Name == "Sword" and child.Parent.Parent.Name ~= Player.Name and child.Parent.Parent.Name ~= Players.LocalPlayer.Name and not table.find(Tables.Settings.PlayerSwordAttackedList,child) then
                            table.insert(Tables.Settings.PlayerSwordAttackedList,child)
                            Functions.CreateLogLabel("Combat", "Player Hit", child.Parent.Parent.Name.." attacked "..Player.Name.." with a SWORD.")
                            child.AncestryChanged:Connect(function(part,parent)
                                if parent ~= workspace and table.find(Tables.Settings.PlayerSwordAttackedList,child) then
                                    table.remove(Tables.Settings.PlayerSwordAttackedList,table.find(Tables.Settings.PlayerSwordAttackedList,child))
                                end
                            end)
                        end
                    end)
                    if CharType == "Local" then
                        for _,v in pairs(Functions.CharacterTouched) do
                            v(child)
                        end
                    elseif CharType == "WL" then
                        for _,v in pairs(Functions.WhitelistCharacterTouched) do
                            v(child,Player)
                        end
                    end
                end)
            end
        end
    end
end

Functions.ESP = function(plr)
	task.spawn(function()
		for i,v in pairs(CoreGui:GetChildren()) do
			if v.Name == plr.Name..'_ESP' then
				v:Destroy()
			end
		end
		task.wait(0.03)
		if plr.Character and plr.Name ~= Players.LocalPlayer.Name and not CoreGui:FindFirstChild(plr.Name..'_ESP') then
			local ESPholder = Instance.new("Folder")
			ESPholder.Name = plr.Name..'_ESP'
			ESPholder.Parent = CoreGui
			Functions.CheckAllParts(plr.Character)
			if plr.Character:FindFirstChild('Head') then
				local BillboardGui = Instance.new("BillboardGui")
				local TextLabel = Instance.new("TextLabel")
				BillboardGui.Adornee = plr.Character.Head
				BillboardGui.Name = plr.Name
				BillboardGui.Parent = ESPholder
				BillboardGui.Size = UDim2.new(0, 100, 0, 150)
				BillboardGui.StudsOffset = Vector3.new(0, 1, 0)
				BillboardGui.AlwaysOnTop = true
				TextLabel.Parent = BillboardGui
				TextLabel.BackgroundTransparency = 1
				TextLabel.Position = UDim2.new(0, 0, 0, -50)
				TextLabel.Size = UDim2.new(0, 100, 0, 100)
				TextLabel.Font = Enum.Font.SourceSansSemibold
				TextLabel.TextSize = 20
				TextLabel.TextColor3 = Color3.new(1, 1, 1)
				TextLabel.TextStrokeTransparency = 0
				TextLabel.TextYAlignment = Enum.TextYAlignment.Bottom
				TextLabel.Text = 'Name: '..plr.Name
				TextLabel.ZIndex = 10
				local espLoopFunc
				local addedFunc
				addedFunc = plr.CharacterAdded:Connect(function()
					if Variables.ESP then
						espLoopFunc:Disconnect()
						ESPholder:Destroy()
						Functions.CheckAllParts(plr.Character)
						Functions.ESP(plr)
						addedFunc:Disconnect()
					else
						addedFunc:Disconnect()
					end
				end)
				local function espLoop()
					if CoreGui:FindFirstChild(plr.Name..'_ESP') then
						if plr.Character and Functions.GetRoot(plr.Character) and plr.Character:FindFirstChildOfClass("Humanoid") and Players.LocalPlayer.Character and Functions.GetRoot(Players.LocalPlayer.Character) and Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid") then
							local pos = ""
                            local alv = ""
                            local ff = ""
                            local godded = ""
                            local newpage = ""
                            if Tables.Settings.ESPSettings.Distance then
                                pos = " | "..Functions.CommaValue(math.floor((Functions.GetRoot(Players.LocalPlayer.Character).Position - Functions.GetRoot(plr.Character).Position).Magnitude)).." Studs away"
                            end
                            if Tables.Settings.ESPSettings.Godded then
                                if Functions.IsGodded(plr.Character) then
                                    godded = " | Godded"
                                else
                                    godded = " | Not Godded"
                                end
                                newpage = "\n"
                            end
                            if Tables.Settings.ESPSettings.Bubble then
                                if plr.Character:FindFirstChildOfClass("ForceField") then
                                    ff = " | Has Bubble"
                                else
                                    ff = " | No Bubble"
                                end
                                newpage = "\n"
                            end
                            if Tables.Settings.ESPSettings.State then
                                if plr.Character:FindFirstChildOfClass("Humanoid") and plr.Character:FindFirstChildOfClass("Humanoid").Health <= 0 then
                                    alv = "Dead"
                                elseif plr.Character:FindFirstChildOfClass("Humanoid") then
                                    alv = "Alive"
                                else
                                    alv = "Unknown"
                                end
                                newpage = "\n"
                            end
							TextLabel.Text = plr.Name..pos..newpage..alv..ff..godded.."\n"..Functions.CommaValue(round(plr.Character:FindFirstChildOfClass('Humanoid').Health, 1))
                            if not Functions.IsGodded(plr.Character) then
                                if plr.Character:FindFirstChildOfClass("Humanoid").Health > 0 and not plr.Character:FindFirstChildOfClass("ForceField") then
                                    local hp = math.clamp(plr.Character:FindFirstChildOfClass("Humanoid").Health/plr.Character:FindFirstChildOfClass("Humanoid").MaxHealth,0,1)
                                    TextLabel.TextColor3 = Color3.fromHSV(hp/3,1,1)
                                else
                                    TextLabel.TextColor3 = Color3.fromRGB(255,0,0)
                                end
                            else
                                TextLabel.TextColor3 = Color3.fromRGB(13, 105, 172)
                            end
                        end
					else
						addedFunc:Disconnect()
						espLoopFunc:Disconnect()
					end
				end
				espLoopFunc = RunService.RenderStepped:Connect(espLoop)
			end
		end
	end)
end

Functions.Chams = function(plr)
    task.spawn(function()
		for i,v in pairs(CoreGui:GetChildren()) do
			if v.Name == plr.Name..'_CHMS' then
				v:Destroy()
			end
		end
		task.wait(0.03)
		if plr.Character and plr.Name ~= Players.LocalPlayer.Name and not CoreGui:FindFirstChild(plr.Name..'_CHMS') then
			local ESPholder = Instance.new("Folder")
            local allBoxHandles = {}
			ESPholder.Name = plr.Name..'_CHMS'
			ESPholder.Parent = CoreGui
			Functions.CheckAllParts(plr.Character)
			for b,n in pairs (plr.Character:GetChildren()) do
				if (n:IsA("BasePart")) then
					local a = Instance.new("BoxHandleAdornment")
					a.Name = plr.Name
					a.Parent = ESPholder
					a.Adornee = n
					a.AlwaysOnTop = true
					a.ZIndex = 10
					a.Size = n.Size
					a.Transparency = 0.3
					a.Color3 = Color3.new(1,1,1)
                    table.insert(allBoxHandles,a)
				end
			end
			local chamsAddedFunc
			local chamsLoopFunc
			chamsAddedFunc = plr.CharacterAdded:Connect(function()
				if Variables.Chams then
					ESPholder:Destroy()
					Functions.CheckAllParts(plr.Character)
					Functions.Chams(plr)
					chamsAddedFunc:Disconnect()
				else
					chamsAddedFunc:Disconnect()
				end
			end)
            local function chamsLoop()
                if CoreGui:FindFirstChild(plr.Name..'_CHMS') then
                    if plr.Character and Functions.GetRoot(plr.Character) and plr.Character:FindFirstChildOfClass("Humanoid") then
                        local alv = plr.Character:FindFirstChildOfClass("Humanoid").Health > 0
                        local ff = plr.Character:FindFirstChildOfClass("ForceField")
                        local godded = Functions.IsGodded(plr.Character)
                        for i,v in pairs(allBoxHandles) do
                            if not godded then
                                if alv and not ff then
                                    local hp = math.clamp(plr.Character:FindFirstChildOfClass("Humanoid").Health/plr.Character:FindFirstChildOfClass("Humanoid").MaxHealth,0,1)
                                    v.Color3 = Color3.fromHSV(hp/3,1,1)
                                else
                                    v.Color3 = Color3.fromRGB(255,0,0)
                                end
                            else
                                v.Color3 = Color3.fromRGB(13, 105, 172)
                            end
                        end
                    end
                else
                    chamsAddedFunc:Disconnect()
                    chamsLoopFunc:Disconnect()
                end
            end
            chamsLoopFunc = RunService.RenderStepped:Connect(chamsLoop)
		end
	end)
end

Functions.WeaponESP = function(plr)
    if plr.Character and plr ~= Players.LocalPlayer then
        for i,child in pairs(plr.Character:GetChildren()) do
            if ((child.Name == "Shuriken" or child.Name == "Sword") and child:IsA("Tool")) and not child:FindFirstChild("WeaponESP") then
                local function GetColorFromName(name)
                    if child.Name == "Sword" then
                        return Color3.fromRGB(255, 167, 25)
                    else
                        return Color3.fromRGB(255, 0, 0)
                    end
                end
                local BillboardGui = Instance.new("BillboardGui")
                local TextLabel = Instance.new("TextLabel")
                BillboardGui.Adornee = child
                BillboardGui.Parent = child
                BillboardGui.Size = UDim2.new(0, 100, 0, 150)
                BillboardGui.StudsOffset = Vector3.new(0, 1, 0)
                BillboardGui.AlwaysOnTop = true
                BillboardGui.Name = "WeaponESP"
                TextLabel.Parent = BillboardGui
                TextLabel.BackgroundTransparency = 1
                TextLabel.Position = UDim2.new(0, 0, 0, -50)
                TextLabel.Size = UDim2.new(0, 100, 0, 100)
                TextLabel.Font = Enum.Font.SourceSansSemibold
                TextLabel.TextSize = 15
                TextLabel.TextColor3 = GetColorFromName(child.Name)
                TextLabel.TextStrokeTransparency = 0
                TextLabel.TextYAlignment = Enum.TextYAlignment.Bottom
                TextLabel.Text = child.Name
                TextLabel.ZIndex = 10
                TextLabel.Visible = true
            end
        end
    end
end

Functions.WeaponChams = function(plr)
    if plr.Character and plr ~= Players.LocalPlayer then
        for i,child in pairs(plr.Character:GetChildren()) do
            if ((child.Name == "Shuriken" or child.Name == "Sword") and child:IsA("Tool")) and not child:FindFirstChild("WeaponChams") then
                local function GetColorFromName(name)
                    if child.Name == "Sword" then
                        return Color3.fromRGB(255, 167, 25)
                    else
                        return Color3.fromRGB(255, 0, 0)
                    end
                end
                local a = Instance.new("BoxHandleAdornment")
                a.Name = "WeaponChams"
                a.Parent = child
                a.Adornee = child:FindFirstChild("Handle")
                if child.Name == "Sword" then
                    a.Size = child:FindFirstChild("Handle").Size
                else
                    a.Size = Vector3.new(1.5,0.5,1.5)
                end
                a.AlwaysOnTop = true
                a.ZIndex = 10
                a.Transparency = 0.3
                a.Color3 = GetColorFromName(child.Name)
                a.Visible = true
            end
        end
    end
end

Functions.AddPlayerVanities = function(plr,dupeCheck)
    repeat task.wait() until plr.Character
    if Variables.ESP and (not dupeCheck or (dupeCheck and not CoreGui:FindFirstChild(plr.Name.."_ESP"))) then
        Functions.ESP(plr)
    end
    if Variables.Chams and (not dupeCheck or (dupeCheck and not CoreGui:FindFirstChild(plr.Name.."_CHMS"))) then
        Functions.Chams(plr)
    end
end

Functions.RemovePlayerVanities = function(plr)
    if CoreGui:FindFirstChild(plr.Name.."_ESP") then
        CoreGui:FindFirstChild(plr.Name.."_ESP"):Destroy()
    end
    if CoreGui:FindFirstChild(plr.Name.."_CHMS") then
        CoreGui:FindFirstChild(plr.Name.."_CHMS"):Destroy()
    end
end

Functions.PreInit = function()
    local CFrameTable = {}
    local AcceptableAncestors = {
        "ALL";
        "ClothCollection";
        "ForceFieldDetectorParts";
        "FunnySwordPack";
        "FunnyThrowPack";
        "GroupMemberCloth";
        "LeaderBoard";
        "MainBasePlate";
        "NextUpdatePart";
        "NightLightParts";
        "PizzaPack";
        "RainbowPack";
        "RandomMeshes";
        "RandomModels";
        "RandomParts";
        "RandomUnions";
        "SpawnParts";
        "SwordCollection";
        "ThrowableCollection";
        "VipPack";
        "WaterFallSoundPart";
    }

    function HasAcceptableAncestor(part)
        for i,v in pairs(AcceptableAncestors) do
            if part:FindFirstAncestor(v) then
                return v
            end
        end
    end

    for i,v in pairs(game:GetDescendants()) do
        if v:IsA("BasePart") and HasAcceptableAncestor(v) and v.Name ~= "Seat" then
            CFrameTable[v] = {v.CFrame,v.Rotation}
        end
    end

    task.spawn(function()
        while true do
            for i,v in pairs(CFrameTable) do
                if i.CFrame ~= v[1] then
                    i.CFrame = v[1]
                end
                if i.Rotation ~= v[2] then
                    i.Rotation = v[2]
                end
            end
            task.wait(10)
        end
    end)

    local Lighting = game:GetService("Lighting")

    local sky = Instance.new("Sky",Lighting)
    sky.MoonTextureId = "http://www.roblox.com/asset/?id=415755273"
    sky.StarCount = 5000

    Lighting.FogEnd = 5000

    workspace.FallenPartsDestroyHeight = -50000

    if Lighting.Technology ~= Enum.Technology.Compatibility then
        for _, part in pairs(workspace:GetDescendants()) do
            if part:IsA("Light") and part.Brightness > 1 then
                part.Brightness = 1
            end
        end
    end

end

Functions.InitLogs = function()

    local toggleFrame = nil

    for i,v in pairs(CoreGui:GetChildren()) do
        if v:FindFirstChild("VegaXMenuToggleFrame") then
            toggleFrame = v:FindFirstChild("VegaXMenuToggleFrame")
        end
    end

    local logsEnabled = false
    local openScroll = getcustomasset("CustomImages/icons8-scrollfilled-420.png")
    local closedScroll = getcustomasset("CustomImages/icons8-scroll-420.png")
    toggleFrame.Size = UDim2.new(0,120,0,44)
    toggleFrame.Position = UDim2.new(0,281,0,-46)
    local toggleClone = toggleFrame.VegaXMenuToggle:Clone()
    toggleClone.Parent = toggleFrame
    toggleClone.Name = "LogsToggle"
    toggleClone.ImageLabel.Image = closedScroll
    toggleClone.Position = UDim2.new(0,47,0,7)

    local LogsGui = Instance.new("ScreenGui")
    local Logs = Instance.new("Frame")
    local shadow = Instance.new("Frame")
    local Hide = Instance.new("TextButton")
    local ImageLabel = Instance.new("ImageLabel")
    local PopupText = Instance.new("TextLabel")
    local Exit = Instance.new("TextButton")
    local ImageLabel_2 = Instance.new("ImageLabel")
    local background = Instance.new("Frame")
    local scriptLogs = Instance.new("Frame")
    local Toggle = Instance.new("TextButton")
    local SaveChatlogs = Instance.new("TextButton")
    local Clear = Instance.new("TextButton")
    local scroll = Instance.new("ScrollingFrame")
    local selectScript = Instance.new("TextButton")
    local selectCombat = Instance.new("TextButton")
    local selectServer = Instance.new("TextButton")
    local selectOutput = Instance.new("TextButton")
    local combatLogs = Instance.new("Frame")
    local Toggle_2 = Instance.new("TextButton")
    local SaveChatlogs_2 = Instance.new("TextButton")
    local Clear_2 = Instance.new("TextButton")
    local scroll_2 = Instance.new("ScrollingFrame")
    local serverLogs = Instance.new("Frame")
    local Toggle_3 = Instance.new("TextButton")
    local SaveChatlogs_3 = Instance.new("TextButton")
    local Clear_3 = Instance.new("TextButton")
    local scroll_3 = Instance.new("ScrollingFrame")
    local outputLogs = Instance.new("Frame")
    local Toggle_4 = Instance.new("TextButton")
    local SaveChatlogs_4 = Instance.new("TextButton")
    local Clear_4 = Instance.new("TextButton")
    local scroll_4 = Instance.new("ScrollingFrame")

    LogsGui.Name = "LogsGui"
    LogsGui.Parent = game:GetService("CoreGui")
    LogsGui.ResetOnSpawn = false
    LogsGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

    Logs.Name = "Logs"
    Logs.Parent = LogsGui
    Logs.Active = true
    Logs.BackgroundTransparency = 1.000
    Logs.Position = UDim2.new(0, 0, 1, -20)
    Logs.Size = UDim2.new(0, 338, 0, 20)
    Logs.ZIndex = 10
    Logs.Visible = false

    shadow.Name = "shadow"
    shadow.Parent = Logs
    shadow.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    shadow.BackgroundTransparency = 0.350
    shadow.BorderSizePixel = 0
    shadow.Position = UDim2.new(0, 0, 0.00999999978, 0)
    shadow.Size = UDim2.new(0, 338, 0, 20)
    shadow.ZIndex = 10

    Hide.Name = "Hide"
    Hide.Parent = shadow
    Hide.BackgroundTransparency = 1.000
    Hide.Position = UDim2.new(1, -40, 0, 0)
    Hide.Size = UDim2.new(0, 20, 0, 20)
    Hide.ZIndex = 10
    Hide.Text = ""

    ImageLabel.Parent = Hide
    ImageLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    ImageLabel.BackgroundTransparency = 1.000
    ImageLabel.Position = UDim2.new(0, 3, 0, 3)
    ImageLabel.Size = UDim2.new(0, 14, 0, 14)
    ImageLabel.ZIndex = 10
    ImageLabel.Image = "rbxassetid://2406617031"

    PopupText.Name = "PopupText"
    PopupText.Parent = shadow
    PopupText.BackgroundTransparency = 1.000
    PopupText.Size = UDim2.new(1, 0, 0.949999988, 0)
    PopupText.ZIndex = 10
    PopupText.Font = Enum.Font.SourceSans
    PopupText.Text = "Logs"
    PopupText.TextColor3 = Color3.fromRGB(255, 255, 255)
    PopupText.TextSize = 14.000
    PopupText.TextWrapped = true

    Exit.Name = "Exit"
    Exit.Parent = shadow
    Exit.BackgroundTransparency = 1.000
    Exit.Position = UDim2.new(1, -20, 0, 0)
    Exit.Size = UDim2.new(0, 20, 0, 20)
    Exit.ZIndex = 10
    Exit.Text = ""

    ImageLabel_2.Parent = Exit
    ImageLabel_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    ImageLabel_2.BackgroundTransparency = 1.000
    ImageLabel_2.Position = UDim2.new(0, 5, 0, 5)
    ImageLabel_2.Size = UDim2.new(0, 10, 0, 10)
    ImageLabel_2.ZIndex = 10
    ImageLabel_2.Image = "rbxassetid://5054663650"

    background.Name = "background"
    background.Parent = Logs
    background.Active = true
    background.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    background.BackgroundTransparency = 0.350
    background.BorderSizePixel = 0
    background.ClipsDescendants = true
    background.Position = UDim2.new(0, 0, 1, 0)
    background.Size = UDim2.new(0, 338, 0, 345)
    background.ZIndex = 10

    scriptLogs.Name = "scriptLogs"
    scriptLogs.Parent = background
    scriptLogs.Active = true
    scriptLogs.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    scriptLogs.BackgroundTransparency = 0.350
    scriptLogs.BorderSizePixel = 0
    scriptLogs.ClipsDescendants = true
    scriptLogs.Size = UDim2.new(0, 338, 0, 345)
    scriptLogs.ZIndex = 10

    Toggle.Name = "Toggle"
    Toggle.Parent = scriptLogs
    Toggle.BackgroundColor3 = Color3.fromRGB(160, 160, 160)
    Toggle.BackgroundTransparency = 0.820
    Toggle.BorderSizePixel = 0
    Toggle.Position = UDim2.new(0, 60, 0, 320)
    Toggle.Size = UDim2.new(0, 66, 0, 20)
    Toggle.ZIndex = 10
    Toggle.Font = Enum.Font.SourceSans
    Toggle.Text = "Enabled"
    Toggle.TextColor3 = Color3.fromRGB(255, 255, 255)
    Toggle.TextSize = 14.000

    SaveChatlogs.Name = "SaveChatlogs"
    SaveChatlogs.Parent = scriptLogs
    SaveChatlogs.BackgroundColor3 = Color3.fromRGB(160, 160, 160)
    SaveChatlogs.BackgroundTransparency = 0.820
    SaveChatlogs.BorderSizePixel = 0
    SaveChatlogs.Position = UDim2.new(0, 258, 0, 320)
    SaveChatlogs.Size = UDim2.new(0, 75, 0, 20)
    SaveChatlogs.ZIndex = 10
    SaveChatlogs.Font = Enum.Font.SourceSans
    SaveChatlogs.Text = "Save To .txt"
    SaveChatlogs.TextColor3 = Color3.fromRGB(255, 255, 255)
    SaveChatlogs.TextSize = 14.000

    Clear.Name = "Clear"
    Clear.Parent = scriptLogs
    Clear.BackgroundColor3 = Color3.fromRGB(160, 160, 160)
    Clear.BackgroundTransparency = 0.820
    Clear.BorderSizePixel = 0
    Clear.Position = UDim2.new(0, 5, 0, 320)
    Clear.Size = UDim2.new(0, 50, 0, 20)
    Clear.ZIndex = 10
    Clear.Font = Enum.Font.SourceSans
    Clear.Text = "Clear"
    Clear.TextColor3 = Color3.fromRGB(255, 255, 255)
    Clear.TextSize = 14.000

    scroll.Name = "scroll"
    scroll.Parent = scriptLogs
    scroll.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
    scroll.BackgroundTransparency = 0.820
    scroll.BorderSizePixel = 0
    scroll.Position = UDim2.new(0, 5, 0, 25)
    scroll.Size = UDim2.new(0, 328, 0, 290)
    scroll.ZIndex = 10
    scroll.BottomImage = "rbxasset://textures/ui/Scroll/scroll-middle.png"
    scroll.CanvasSize = UDim2.new(0, 0, 0, 10)
    scroll.ScrollBarThickness = 8
    scroll.TopImage = "rbxasset://textures/ui/Scroll/scroll-middle.png"

    local clickTable = {}

    selectScript.Name = "selectScript"
    selectScript.Parent = background
    selectScript.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
    selectScript.BackgroundTransparency = 0.820
    selectScript.BorderSizePixel = 0
    selectScript.Position = UDim2.new(0, 5, 0, 5)
    selectScript.Size = UDim2.new(0, 82, 0, 20)
    selectScript.ZIndex = 11
    selectScript.Font = Enum.Font.SourceSans
    selectScript.Text = "Script Logs"
    selectScript.TextColor3 = Color3.fromRGB(255, 255, 255)
    selectScript.TextSize = 14.000
    table.insert(clickTable,selectScript)

    selectCombat.Name = "selectCombat"
    selectCombat.Parent = background
    selectCombat.BackgroundColor3 = Color3.fromRGB(200, 200, 200)
    selectCombat.BackgroundTransparency = 0.820
    selectCombat.BorderSizePixel = 0
    selectCombat.Position = UDim2.new(0, 87, 0, 5)
    selectCombat.Size = UDim2.new(0, 82, 0, 20)
    selectCombat.ZIndex = 11
    selectCombat.Font = Enum.Font.SourceSans
    selectCombat.Text = "Combat Logs"
    selectCombat.TextColor3 = Color3.fromRGB(255, 255, 255)
    selectCombat.TextSize = 14.000
    table.insert(clickTable,selectCombat)

    selectServer.Name = "selectServer"
    selectServer.Parent = background
    selectServer.BackgroundColor3 = Color3.fromRGB(200, 200, 200)
    selectServer.BackgroundTransparency = 0.820
    selectServer.BorderSizePixel = 0
    selectServer.Position = UDim2.new(0, 169, 0, 5)
    selectServer.Size = UDim2.new(0, 82, 0, 20)
    selectServer.ZIndex = 11
    selectServer.Font = Enum.Font.SourceSans
    selectServer.Text = "Server Logs"
    selectServer.TextColor3 = Color3.fromRGB(255, 255, 255)
    selectServer.TextSize = 14.000
    table.insert(clickTable,selectServer)

    selectOutput.Name = "selectOutput"
    selectOutput.Parent = background
    selectOutput.BackgroundColor3 = Color3.fromRGB(200, 200, 200)
    selectOutput.BackgroundTransparency = 0.820
    selectOutput.BorderSizePixel = 0
    selectOutput.Position = UDim2.new(0, 251, 0, 5)
    selectOutput.Size = UDim2.new(0, 82, 0, 20)
    selectOutput.ZIndex = 11
    selectOutput.Font = Enum.Font.SourceSans
    selectOutput.Text = "Output Logs"
    selectOutput.TextColor3 = Color3.fromRGB(255, 255, 255)
    selectOutput.TextSize = 14.000
    table.insert(clickTable,selectOutput)

    combatLogs.Name = "combatLogs"
    combatLogs.Parent = background
    combatLogs.Active = true
    combatLogs.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    combatLogs.BackgroundTransparency = 0.350
    combatLogs.BorderSizePixel = 0
    combatLogs.ClipsDescendants = true
    combatLogs.Size = UDim2.new(0, 338, 0, 345)
    combatLogs.Visible = false
    combatLogs.ZIndex = 10

    Toggle_2.Name = "Toggle"
    Toggle_2.Parent = combatLogs
    Toggle_2.BackgroundColor3 = Color3.fromRGB(160, 160, 160)
    Toggle_2.BackgroundTransparency = 0.820
    Toggle_2.BorderSizePixel = 0
    Toggle_2.Position = UDim2.new(0, 60, 0, 320)
    Toggle_2.Size = UDim2.new(0, 66, 0, 20)
    Toggle_2.ZIndex = 10
    Toggle_2.Font = Enum.Font.SourceSans
    Toggle_2.Text = "Enabled"
    Toggle_2.TextColor3 = Color3.fromRGB(255, 255, 255)
    Toggle_2.TextSize = 14.000

    SaveChatlogs_2.Name = "SaveChatlogs"
    SaveChatlogs_2.Parent = combatLogs
    SaveChatlogs_2.BackgroundColor3 = Color3.fromRGB(160, 160, 160)
    SaveChatlogs_2.BackgroundTransparency = 0.820
    SaveChatlogs_2.BorderSizePixel = 0
    SaveChatlogs_2.Position = UDim2.new(0, 258, 0, 320)
    SaveChatlogs_2.Size = UDim2.new(0, 75, 0, 20)
    SaveChatlogs_2.ZIndex = 10
    SaveChatlogs_2.Font = Enum.Font.SourceSans
    SaveChatlogs_2.Text = "Save To .txt"
    SaveChatlogs_2.TextColor3 = Color3.fromRGB(255, 255, 255)
    SaveChatlogs_2.TextSize = 14.000

    Clear_2.Name = "Clear"
    Clear_2.Parent = combatLogs
    Clear_2.BackgroundColor3 = Color3.fromRGB(160, 160, 160)
    Clear_2.BackgroundTransparency = 0.820
    Clear_2.BorderSizePixel = 0
    Clear_2.Position = UDim2.new(0, 5, 0, 320)
    Clear_2.Size = UDim2.new(0, 50, 0, 20)
    Clear_2.ZIndex = 10
    Clear_2.Font = Enum.Font.SourceSans
    Clear_2.Text = "Clear"
    Clear_2.TextColor3 = Color3.fromRGB(255, 255, 255)
    Clear_2.TextSize = 14.000

    scroll_2.Name = "scroll"
    scroll_2.Parent = combatLogs
    scroll_2.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
    scroll_2.BackgroundTransparency = 0.820
    scroll_2.BorderSizePixel = 0
    scroll_2.Position = UDim2.new(0, 5, 0, 25)
    scroll_2.Size = UDim2.new(0, 328, 0, 290)
    scroll_2.ZIndex = 10
    scroll_2.BottomImage = "rbxasset://textures/ui/Scroll/scroll-middle.png"
    scroll_2.CanvasSize = UDim2.new(0, 0, 0, 10)
    scroll_2.ScrollBarThickness = 8
    scroll_2.TopImage = "rbxasset://textures/ui/Scroll/scroll-middle.png"

    serverLogs.Name = "serverLogs"
    serverLogs.Parent = background
    serverLogs.Active = true
    serverLogs.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    serverLogs.BackgroundTransparency = 0.350
    serverLogs.BorderSizePixel = 0
    serverLogs.ClipsDescendants = true
    serverLogs.Size = UDim2.new(0, 338, 0, 345)
    serverLogs.Visible = false
    serverLogs.ZIndex = 10

    Toggle_3.Name = "Toggle"
    Toggle_3.Parent = serverLogs
    Toggle_3.BackgroundColor3 = Color3.fromRGB(160, 160, 160)
    Toggle_3.BackgroundTransparency = 0.820
    Toggle_3.BorderSizePixel = 0
    Toggle_3.Position = UDim2.new(0, 60, 0, 320)
    Toggle_3.Size = UDim2.new(0, 66, 0, 20)
    Toggle_3.ZIndex = 10
    Toggle_3.Font = Enum.Font.SourceSans
    Toggle_3.Text = "Enabled"
    Toggle_3.TextColor3 = Color3.fromRGB(255, 255, 255)
    Toggle_3.TextSize = 14.000

    SaveChatlogs_3.Name = "SaveChatlogs"
    SaveChatlogs_3.Parent = serverLogs
    SaveChatlogs_3.BackgroundColor3 = Color3.fromRGB(160, 160, 160)
    SaveChatlogs_3.BackgroundTransparency = 0.820
    SaveChatlogs_3.BorderSizePixel = 0
    SaveChatlogs_3.Position = UDim2.new(0, 258, 0, 320)
    SaveChatlogs_3.Size = UDim2.new(0, 75, 0, 20)
    SaveChatlogs_3.ZIndex = 10
    SaveChatlogs_3.Font = Enum.Font.SourceSans
    SaveChatlogs_3.Text = "Save To .txt"
    SaveChatlogs_3.TextColor3 = Color3.fromRGB(255, 255, 255)
    SaveChatlogs_3.TextSize = 14.000

    Clear_3.Name = "Clear"
    Clear_3.Parent = serverLogs
    Clear_3.BackgroundColor3 = Color3.fromRGB(160, 160, 160)
    Clear_3.BackgroundTransparency = 0.820
    Clear_3.BorderSizePixel = 0
    Clear_3.Position = UDim2.new(0, 5, 0, 320)
    Clear_3.Size = UDim2.new(0, 50, 0, 20)
    Clear_3.ZIndex = 10
    Clear_3.Font = Enum.Font.SourceSans
    Clear_3.Text = "Clear"
    Clear_3.TextColor3 = Color3.fromRGB(255, 255, 255)
    Clear_3.TextSize = 14.000

    scroll_3.Name = "scroll"
    scroll_3.Parent = serverLogs
    scroll_3.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
    scroll_3.BackgroundTransparency = 0.820
    scroll_3.BorderSizePixel = 0
    scroll_3.Position = UDim2.new(0, 5, 0, 25)
    scroll_3.Size = UDim2.new(0, 328, 0, 290)
    scroll_3.ZIndex = 10
    scroll_3.BottomImage = "rbxasset://textures/ui/Scroll/scroll-middle.png"
    scroll_3.CanvasSize = UDim2.new(0, 0, 0, 10)
    scroll_3.ScrollBarThickness = 8
    scroll_3.TopImage = "rbxasset://textures/ui/Scroll/scroll-middle.png"

    outputLogs.Name = "outputLogs"
    outputLogs.Parent = background
    outputLogs.Active = true
    outputLogs.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    outputLogs.BackgroundTransparency = 0.350
    outputLogs.BorderSizePixel = 0
    outputLogs.ClipsDescendants = true
    outputLogs.Size = UDim2.new(0, 338, 0, 345)
    outputLogs.Visible = false
    outputLogs.ZIndex = 10

    Toggle_4.Name = "Toggle"
    Toggle_4.Parent = outputLogs
    Toggle_4.BackgroundColor3 = Color3.fromRGB(160, 160, 160)
    Toggle_4.BackgroundTransparency = 0.820
    Toggle_4.BorderSizePixel = 0
    Toggle_4.Position = UDim2.new(0, 60, 0, 320)
    Toggle_4.Size = UDim2.new(0, 66, 0, 20)
    Toggle_4.ZIndex = 10
    Toggle_4.Font = Enum.Font.SourceSans
    Toggle_4.Text = "Enabled"
    Toggle_4.TextColor3 = Color3.fromRGB(255, 255, 255)
    Toggle_4.TextSize = 14.000

    SaveChatlogs_4.Name = "SaveChatlogs"
    SaveChatlogs_4.Parent = outputLogs
    SaveChatlogs_4.BackgroundColor3 = Color3.fromRGB(160, 160, 160)
    SaveChatlogs_4.BackgroundTransparency = 0.820
    SaveChatlogs_4.BorderSizePixel = 0
    SaveChatlogs_4.Position = UDim2.new(0, 258, 0, 320)
    SaveChatlogs_4.Size = UDim2.new(0, 75, 0, 20)
    SaveChatlogs_4.ZIndex = 10
    SaveChatlogs_4.Font = Enum.Font.SourceSans
    SaveChatlogs_4.Text = "Save To .txt"
    SaveChatlogs_4.TextColor3 = Color3.fromRGB(255, 255, 255)
    SaveChatlogs_4.TextSize = 14.000

    Clear_4.Name = "Clear"
    Clear_4.Parent = outputLogs
    Clear_4.BackgroundColor3 = Color3.fromRGB(160, 160, 160)
    Clear_4.BackgroundTransparency = 0.820
    Clear_4.BorderSizePixel = 0
    Clear_4.Position = UDim2.new(0, 5, 0, 320)
    Clear_4.Size = UDim2.new(0, 50, 0, 20)
    Clear_4.ZIndex = 10
    Clear_4.Font = Enum.Font.SourceSans
    Clear_4.Text = "Clear"
    Clear_4.TextColor3 = Color3.fromRGB(255, 255, 255)
    Clear_4.TextSize = 14.000

    scroll_4.Name = "scroll"
    scroll_4.Parent = outputLogs
    scroll_4.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
    scroll_4.BackgroundTransparency = 0.820
    scroll_4.BorderSizePixel = 0
    scroll_4.Position = UDim2.new(0, 5, 0, 25)
    scroll_4.Size = UDim2.new(0, 328, 0, 290)
    scroll_4.ZIndex = 10
    scroll_4.BottomImage = "rbxasset://textures/ui/Scroll/scroll-middle.png"
    scroll_4.CanvasSize = UDim2.new(0, 0, 0, 10)
    scroll_4.ScrollBarThickness = 8
    scroll_4.TopImage = "rbxasset://textures/ui/Scroll/scroll-middle.png"


    toggleClone.MouseButton1Up:Connect(function()
        if not logsEnabled then
            logsEnabled = true
            Logs.Visible = true
            toggleClone.ImageLabel.Image = openScroll
            if Logs.Position.Y.Scale > -20 then
                Logs:TweenPosition(UDim2.new(0, 0, 1, -365), "InOut", "Quart", 0.3, true, nil)
            end
        else
            logsEnabled = false
            Logs.Visible = false
            toggleClone.ImageLabel.Image = closedScroll
        end
    end)

    for _,v in pairs(clickTable) do
        v.MouseButton1Click:Connect(function()
            if v.BackgroundColor3 ~= Color3.fromRGB(70,70,70) then
                local selectName = string.lower(string.sub(v.Name,7,string.len(v.Name)))
                local logName = selectName.."Logs"
                for i,v in pairs(background:GetChildren()) do
                    if v:IsA("Frame") then
                        v.Visible = false
                    elseif v:IsA("TextButton") then
                        v.BackgroundColor3 = Color3.fromRGB(200,200,200)
                    end
                end
                v.BackgroundColor3 = Color3.fromRGB(70,70,70)
                background[logName].Visible = true
            end
        end)
    end

    Exit.MouseButton1Click:Connect(function()
        Logs:TweenPosition(UDim2.new(0, 0, 1, 10), "InOut", "Quart", 0.3, true, nil)
        task.wait(0.3)
        logsEnabled = false
        toggleClone.ImageLabel.Image = closedScroll
    end)

    Hide.MouseButton1Click:Connect(function()
        if Logs.Position ~= UDim2.new(0, 0, 1, -20) then
            Logs:TweenPosition(UDim2.new(0, 0, 1, -20), "InOut", "Quart", 0.3, true, nil)
        else
            Logs:TweenPosition(UDim2.new(0, 0, 1, -365), "InOut", "Quart", 0.3, true, nil)
        end
    end)

    local lastMessage = nil
    local lastLabel = nil
    local dupeCount = 1

    local function Time()
        local HOUR = math.floor((tick() % 86400) / 3600)
        local MINUTE = math.floor((tick() % 3600) / 60)
        local SECOND = math.floor(tick() % 60)
        local AP = HOUR > 11 and 'PM' or 'AM'
        HOUR = (HOUR % 12 == 0 and 12 or HOUR % 12)
        HOUR = HOUR < 10 and '0' .. HOUR or HOUR
        MINUTE = MINUTE < 10 and '0' .. MINUTE or MINUTE
        SECOND = SECOND < 10 and '0' .. SECOND or SECOND
        return HOUR .. ':' .. MINUTE .. ':' .. SECOND .. ' ' .. AP
    end

    Functions.CreateLogLabel = function(LogName, Label, Text)
        if lastMessage == LogName..Label..Text then
            dupeCount = dupeCount+1
            lastLabel.Text = Time()..' - ['..Label..']: '..Text..' (x'..dupeCount..')'
        else
            if dupeCount > 1 then dupeCount = 1 end
            local scrollInstance = background[string.lower(LogName).."Logs"].scroll
            if #scrollInstance:GetChildren() >= 2546 then
                scrollInstance:ClearAllChildren()
            end
            local alls = 0
            for i,v in pairs(scrollInstance:GetChildren()) do
                if v then
                    alls = v.Size.Y.Offset + alls
                end
                if not v then
                    alls = 0
                end
            end
            local tl = Instance.new('TextLabel')
            lastMessage = LogName..Label..Text
            lastLabel = tl
            tl.Name = Label
            tl.Parent = scrollInstance
            tl.ZIndex = 10
            tl.Text = Time().." - ["..Label.."]: "..Text
            tl.Size = UDim2.new(0,322,0,84)
            tl.BackgroundTransparency = 1
            tl.BorderSizePixel = 0
            tl.Font = "SourceSans"
            tl.Position = UDim2.new(-1,0,0,alls)
            tl.TextTransparency = 1
            tl.TextScaled = false
            tl.TextSize = 14
            tl.TextWrapped = true
            tl.RichText = true
            tl.TextXAlignment = "Left"
            tl.TextYAlignment = "Top"
            tl.TextColor3 = Color3.fromRGB(255,255,255)
            tl.Size = UDim2.new(0,322,0,tl.TextBounds.Y)
            scrollInstance.CanvasSize = UDim2.new(0,0,0,alls+tl.TextBounds.Y)
            scrollInstance.CanvasPosition = Vector2.new(0,scrollInstance.CanvasPosition.Y+tl.TextBounds.Y)
            tl:TweenPosition(UDim2.new(0,3,0,alls), 'In', 'Quint', 0.5)
            game:GetService("TweenService"):Create(tl, TweenInfo.new(1.25, Enum.EasingStyle.Linear), { TextTransparency = 0 }):Play()
        end
    end

    Functions.CreateLogLabel("Script", "System", "Successfully created logs. New events will be shared here.")

end

Functions.InitMain = function()

    local Options = Fluent.Options

    Functions.InitCharacterTouched(Players.LocalPlayer,"Local")
    
    Functions.CharacterAdded.CharacterTouched = function()
        task.spawn(function()
            Functions.InitCharacterTouched(Players.LocalPlayer,"Local")
        end)
    end

    for i,v in pairs(Players:GetPlayers()) do
        if Functions.ListFind("Whitelist",v.Name) then
            Functions.InitCharacterTouched(v,"WL")
            v.CharacterAdded:Connect(function()
                Functions.InitCharacterTouched(v,"WL")
            end)
        end
        v.CharacterAdded:Connect(function()
            for n,t in pairs(Lists) do
                if Functions.ListFind(n,v.Name,"Soft") then
                    Functions.ListRemove(n,v.Name,"Soft")
                end
            end
        end)
    end

    Functions.PlayerAdded.WhitelistCharacterTouched = function(player)
        if Functions.ListFind("Whitelist",player.Name) then
            Functions.InitCharacterTouched(player,"WL")
            player.CharacterAdded:Connect(function()
                Functions.InitCharacterTouched(player,"WL")
            end)
        end
    end

    Functions.PlayerAdded.SoftListRemoval = function(player)
        player.CharacterAdded:Connect(function()
            for n,t in pairs(Lists) do
                if Functions.ListFind(n,player.Name,"Soft") then
                    Functions.ListRemove(n,player.Name,"Soft")
                end
            end
        end)
    end


    -- // Training Tab


    local TrainingToggles = Tabs.Training:AddSection("Toggles")

    TrainingToggles:AddToggle("AutoTrain",{
        Title = "Auto Train";
        Description = "Automatically trains your ninjutsu. Uses the Train Amount and Train Rate variables to set how much and how often it trains.";
        Default = false;
        Callback = function(state)
            if state then
                Variables.AutoTrain = true
                task.spawn(function()
                    while Variables.AutoTrain do
                        if not Variables.GainingNegativeNin then
                            game:GetService("ReplicatedStorage").RemoteEvent.AddPowerEvent:FireServer("FromTraining",Variables.TrainAmount)
                            task.wait(Variables.TrainRate)
                            game:GetService("ReplicatedStorage").RemoteEvent.AddPowerEvent:FireServer("FromTraining",Variables.TrainAmount - 0.001)
                            task.wait(Variables.TrainRate)
                        else
                            task.wait()
                        end
                    end
                end)
            else
                Variables.AutoTrain = false
            end
        end
    })

    TrainingToggles:AddToggle("AlternateAutoTrain",{
        Title = "Alternate Auto Train";
        Description = "Alternate mode of Auto Train. Uses the variables Alternate Train Amount and Alternate Train Rate.";
        Default = false;
        Callback = function(state)
            if state then
                Variables.AlteranteAutoTrain = true
                Functions.NinjutsuChanged.AltTrain = function()
                    if Variables.AlteranteAutoTrain then
                        Variables.AltTrainTime = true
                    end
                end
                task.spawn(function()
                    local ticktime = 0
                    while Variables.AlteranteAutoTrain do
                        if not Variables.GainingNegativeNin then
                            game:GetService("ReplicatedStorage").RemoteEvent.AddPowerEvent:FireServer("FromTraining",Variables.AltTrainAmount)
                            repeat task.wait() ticktime += 1 until Variables.AltTrainTime == true or ticktime >= 100
                            Variables.AltTrainTime = false
                            ticktime = 0
                            task.wait(Variables.AltTrainRate)
                            game:GetService("ReplicatedStorage").RemoteEvent.AddPowerEvent:FireServer("FromTraining",Variables.AltTrainAmount - 0.001)
                            repeat task.wait() ticktime += 1 until Variables.AltTrainTime == true or ticktime >= 100
                            Variables.AltTrainTime = false
                            ticktime = 0
                            task.wait(Variables.AltTrainRate)
                        else
                            task.wait()
                        end
                    end
                end)
            else
                Variables.AlteranteAutoTrain = false
                Variables.AltTrainTime = false
                Functions.NinjutsuChanged.AltTrain = nil
            end
        end
    })

    TrainingToggles:AddToggle("AnimationTrain",{
        Title = "Animation Train";
        Description = "Another mode of auto train. Uses the games training animations. Uses Animation Train Amount and Animation Train Rate.";
        Default = false;
        Callback = function(state)
            if state then
                Variables.AnimationTrain = true
                task.spawn(function()
                    local cantrain = false
                    local lastnin = 0
                    local AllTrainAnims = {}
                    local anim1playing = false
                    local anim2playing = false
                    local anim3playing = false
                    local function PlayTrainAnim(num)
                        if Character:FindFirstChild("Train") then
                            local Humanoid = Character:WaitForChild("Humanoid")
                            local anim1 = Character:FindFirstChild("Train"):FindFirstChild("Anim1")
                            local anim2 = Character:FindFirstChild("Train"):FindFirstChild("Anim2")
                            local anim3 = Character:FindFirstChild("Train"):FindFirstChild("Anim3")
                            if num == 1 then
                                for i,v in pairs(AllTrainAnims) do
                                    v:Stop()
                                end
                                local trainspeed = 2.80 - Variables.TrainRate
                                AllTrainAnims.TrainAnim1 = Humanoid.Animator:LoadAnimation(anim1)
                                AllTrainAnims.TrainAnim1:Play(0.1,1,trainspeed)
                                anim1playing = true
                                AllTrainAnims.TrainAnim1.Stopped:Connect(function()
                                    anim1playing = false
                                end)
                            elseif num == 2 then
                                for i,v in pairs(AllTrainAnims) do
                                    v:Stop()
                                end
                                local trainspeed = 2.80 - Variables.TrainRate
                                AllTrainAnims.TrainAnim2 = Humanoid.Animator:LoadAnimation(anim2)
                                AllTrainAnims.TrainAnim2:Play(0.1,1,trainspeed)
                                anim2playing = true
                                AllTrainAnims.TrainAnim2.Stopped:Connect(function()
                                    anim2playing = false
                                end)
                            elseif num == 3 then
                                for i,v in pairs(AllTrainAnims) do
                                    v:Stop()
                                end
                                local trainspeed = 2.90 - Variables.TrainRate
                                AllTrainAnims.TrainAnim3 = Humanoid.Animator:LoadAnimation(anim3)
                                AllTrainAnims.TrainAnim3:Play(0.1,1,trainspeed)
                                anim3playing = true
                                AllTrainAnims.TrainAnim3.Stopped:Connect(function()
                                    anim3playing = false
                                end)
                            end
                        end
                    end
                    while Variables.AnimationTrain do
                        if cantrain == false and not Variables.GainingNegativeNin then
                            if Character:FindFirstChild("Train") then
                                local trainsound = Character:FindFirstChild("Train"):FindFirstChild("Handle"):FindFirstChild("HitSound")
                                if anim3playing then
                                    cantrain = true
                                    if lastnin == Variables.TrainAmount then
                                        game:GetService("ReplicatedStorage").RemoteEvent.AddPowerEvent:FireServer("FromTraining",Variables.TrainAmount - 0.001)
                                        lastnin = Variables.TrainAmount - 0.001
                                    else
                                        game:GetService("ReplicatedStorage").RemoteEvent.AddPowerEvent:FireServer("FromTraining",Variables.TrainAmount)
                                        lastnin = Variables.TrainAmount
                                    end
                                    PlayTrainAnim(1)
                                    trainsound:Play()
                                    task.wait(Variables.TrainRate)
                                    cantrain = false
                                elseif anim1playing then
                                    cantrain = true
                                    if lastnin == Variables.TrainAmount then
                                        game:GetService("ReplicatedStorage").RemoteEvent.AddPowerEvent:FireServer("FromTraining",Variables.TrainAmount - 0.001)
                                        lastnin = Variables.TrainAmount - 0.001
                                    else
                                        game:GetService("ReplicatedStorage").RemoteEvent.AddPowerEvent:FireServer("FromTraining",Variables.TrainAmount)
                                        lastnin = Variables.TrainAmount
                                    end
                                    PlayTrainAnim(2)
                                    trainsound:Play()
                                    task.wait(Variables.TrainRate)
                                    cantrain = false
                                elseif anim2playing then
                                    cantrain = true
                                    if lastnin == Variables.TrainAmount then
                                        game:GetService("ReplicatedStorage").RemoteEvent.AddPowerEvent:FireServer("FromTraining",Variables.TrainAmount - 0.001)
                                        lastnin = Variables.TrainAmount - 0.001
                                    else
                                        game:GetService("ReplicatedStorage").RemoteEvent.AddPowerEvent:FireServer("FromTraining",Variables.TrainAmount)
                                        lastnin = Variables.TrainAmount
                                    end
                                    PlayTrainAnim(3)
                                    trainsound:Play()
                                    task.wait(Variables.TrainRate)
                                    cantrain = false
                                elseif anim1playing then
                                    cantrain = true
                                    if lastnin == Variables.TrainAmount then
                                        game:GetService("ReplicatedStorage").RemoteEvent.AddPowerEvent:FireServer("FromTraining",Variables.TrainAmount - 0.001)
                                        lastnin = Variables.TrainAmount - 0.001
                                    else
                                        game:GetService("ReplicatedStorage").RemoteEvent.AddPowerEvent:FireServer("FromTraining",Variables.TrainAmount)
                                        lastnin = Variables.TrainAmount
                                    end
                                    PlayTrainAnim(1)
                                    trainsound:Play()
                                    task.wait(Variables.TrainRate)
                                    cantrain = false
                                end
                            end
                        end
                        task.wait()
                    end
                end)
            else

            end
        end
    })

    TrainingToggles:AddToggle("Auto Equip",{
        Title = "Auto Equip";
        Description = "Automatically equips your training sword for you. You can equip other tools while this is on.";
        Default = false;
        Callback = function(state)
            if state then
                Variables.AutoEquip = true
                task.spawn(function()
                    while Variables.AutoEquip do
                        if Character and not Variables.CharRespawning and not Variables.DroppingSword then
                            if not Character:FindFirstChild("Train") then
                                if Players.LocalPlayer.Backpack:FindFirstChild("Train") then
                                    Players.LocalPlayer.Backpack:FindFirstChild("Train").Parent = Character
                                end
                            end
                        end
                        task.wait()
                    end
                end)
                Functions.UserInputBegan.AutoEquip = function(input)
                    if input.UserInputType == Enum.UserInputType.MouseButton1 then
                        if Character and not Variables.HoldClick then
                            local Tool = Character:FindFirstChild("Sword") or Character:FindFirstChild("Shuriken") or Character:FindFirstChild("Teleport")
                            if Tool then
                                Tool:Activate()
                            end
                        end
                    end
                end
            else
                Variables.AutoEquip = false
                Functions.UserInputBegan.AutoEquip = nil
            end
        end
    })

    TrainingToggles:AddToggle("Drop Training Sword",{
        Title = "Drop Training Sword";
        Description = "Allows you to walk, jump, and attack while still being able to train. Reset after you turn it off.";
        Default = false;
        Callback = function(state)
            if state then
                local function DropSword(char)
                    if #Variables.SwordList ~= 0 then
                        for i,v in pairs(Variables.SwordList) do
                            v:Destroy()
                            table.remove(Variables.SwordList,i)
                        end
                    end
                    if not char:FindFirstChild("Train") and Players.LocalPlayer.Backpack:FindFirstChild("Train") then
                        Players.LocalPlayer.Backpack.Train.Parent = char
                        task.wait(0.03)
                    end
                    local tool = char:FindFirstChild("Train")
                    if tool then
                        tool.CanBeDropped = true
                        task.wait(0.03)
                        tool.Parent = workspace
                        tool.LocalScript.Disabled = true
                        tool.Handle.Transparency = 1
                        Variables.SwordList[#Variables.SwordList + 1] = tool
                    end
                end
                if Character then
                    DropSword(Character)
                    Tables.Connections.BackpackChildAdded = Players.LocalPlayer.Backpack.ChildAdded:Connect(function(child)
                        if child.Name == "Train" and Character then
                            task.wait(0.03)
                            DropSword(Character)
                            if Character:FindFirstChild("Humanoid") and Character.Humanoid:GetState() == Enum.HumanoidStateType.Dead and Variables.DeathTraining then
                                local tool = workspace:FindFirstChild("Train")
                                if tool then
                                    tool.Handle.CanCollide = true
                                    tool.Handle.Anchored = true
                                end
                            end
                        end
                    end)
                end
                Functions.CharacterAdded.DropTrainingSword = function(newchar)
                    task.spawn(function()
                        repeat task.wait(0.05) until Players.LocalPlayer.Backpack:FindFirstChild("Train")
                        DropSword(newchar)
                        Tables.Connections.BackpackChildAdded:Disconnect()
                        task.wait()
                        Tables.Connections.BackpackChildAdded = Players.LocalPlayer.Backpack.ChildAdded:Connect(function(child)
                            if child.Name == "Train" and Character then
                                task.wait(0.03)
                                DropSword(Character)
                                if newchar:FindFirstChild("Humanoid") and newchar.Humanoid:GetState() == Enum.HumanoidStateType.Dead and Variables.DeathTraining then
                                    local tool = workspace:FindFirstChild("Train")
                                    if tool then
                                        tool.Handle.CanCollide = true
                                        tool.Handle.Anchored = true
                                    end
                                end
                            end
                        end)
                    end)
                end
            else
                pcall(function()
                    Functions.CharacterAdded.DropTrainingSword = nil
                    Tables.Connections.BackpackChildAdded:Disconnect()
                end)
            end
        end
    })

    TrainingToggles:AddToggle("Death Training",{
        Title = "Death Training";
        Description = "Allows you to use your training sword even if you're dead. Works with or without dropping sword.";
        Default = false;
        Callback = function(state)
            if state then
                Variables.DeathTraining = true
                local function onDeath()
                    if Variables.DeathTraining then
                        if Players.LocalPlayer.Backpack:FindFirstChild("Train") then
                            Players.LocalPlayer.Backpack:FindFirstChild("Train").Parent = Character
                            task.wait(0.03)
                        end
                        local tool = Character:FindFirstChild("Train") or workspace:FindFirstChild("Train")
                        if tool then
                            tool.Handle.CanCollide = true
                            tool.Handle.Anchored = true
                        end
                    end
                end
                Character:WaitForChild("Humanoid",math.huge).Died:Connect(onDeath)
                Functions.CharacterAdded.DeathTraining = function(newChar)
                    task.spawn(function()
                        newChar:WaitForChild("Humanoid",math.huge).Died:Connect(onDeath)
                    end)
                end
            else
                Variables.DeathTraining = false
                Functions.CharacterAdded.DeathTraining = nil
            end
        end;
    })

    TrainingToggles:AddToggle("Auto Respawn",{
        Title = "Auto Respawn";
        Description = "Automatically respawns your character after you die and teleports you back.";
        Default = false;
        Callback = function(state)
            if state then
                local pos
                local preZoom
                local Player = Players.LocalPlayer
                local function HumDied()
                    pos = workspace.CurrentCamera.CFrame
                    preZoom = (workspace.CurrentCamera.CFrame.Position - workspace.CurrentCamera.Focus.Position).Magnitude
                    Variables.CharRespawning = true
                    Variables.ResPos = Functions.GetRoot(Character).CFrame
                    local mainspawn = Player.PlayerGui:FindFirstChild("FirstScreenGui").MainSpawnBtn
                    local randomspawn = Player.PlayerGui:FindFirstChild("FirstScreenGui").RandomSpawnBtn
                    game:GetService("ReplicatedStorage"):WaitForChild("RemoteEvent"):WaitForChild("SpawnCharacterEvent"):FireServer("MainSpawn")
                    game:GetService("Lighting"):WaitForChild("Blur").Size = 0
                    game:GetService("Lighting"):WaitForChild("Blur").Enabled = false
                    mainspawn.TextTransparency = 1
                    mainspawn.BackgroundTransparency = 1
                    randomspawn.TextTransparency = 1
                    randomspawn.BackgroundTransparency = 1
                    Player.PlayerGui:FindFirstChild("FirstScreenGui").Enabled = false
                end
                Variables.Autorespawning = Character:WaitForChild("Humanoid",math.huge).Died:Connect(HumDied)
                Functions.CharacterAdded.AutoRespawn = function()
                    local count = 0
                    local totalCount = 0
                    local preMaxZoom = Players.LocalPlayer.CameraMaxZoomDistance
                    local preMinZoom = Players.LocalPlayer.CameraMinZoomDistance
                    task.spawn(function()
                        Functions.CheckAllParts(Character)
                        while count <= 20 do
                            local hrp = Functions.GetRoot(Character)
                            if hrp and CFrame.new(math.floor(hrp.CFrame.X),math.floor(hrp.CFrame.Y),math.floor(hrp.CFrame.Z)) ~= CFrame.new(math.floor(Variables.ResPos.X),math.floor(Variables.ResPos.Y),math.floor(Variables.ResPos.Z)) then
                                if Variables.ResPos ~= nil then
                                    hrp.CFrame = Variables.ResPos
                                    Players.LocalPlayer.CameraMaxZoomDistance = preZoom
                                    Players.LocalPlayer.CameraMinZoomDistance = preZoom
                                    Players.LocalPlayer.CameraMaxZoomDistance = preMaxZoom
                                    Players.LocalPlayer.CameraMinZoomDistance = preMinZoom
                                    if totalCount == 0 then
                                        workspace.CurrentCamera.CameraType = Enum.CameraType.Scriptable
                                        workspace.CurrentCamera.CFrame = pos
                                        workspace.CurrentCamera.CameraType = Enum.CameraType.Custom
                                    end
                                end
                                count = 0
                            elseif hrp then
                                count += 1
                            end
                            totalCount += 1
                            if totalCount > 40 then break end
                            task.wait()
                        end
                    end)
                    Variables.Autorespawning = Character:WaitForChild("Humanoid",math.huge).Died:Connect(HumDied)
                end
            else
                Functions.CharacterAdded.AutoRespawn = nil
                pcall(function()
                    Variables.Autorespawning:Disconnect()
                end)
                Variables.ResPos = nil
            end
        end
    })

    TrainingToggles:AddToggle("Anti Afk",{
        Title = "Anti Afk";
        Description = "Disables the Roblox feature that disconnects you after 20 minutes of inactivity.";
        Default = false;
        Callback = function(state)
            if state then
                Variables.AntiAfk = true
                Players.LocalPlayer.Idled:Connect(function()
                    if Variables.AntiAfk then
                        local VirtualUser = game:GetService("VirtualUser")
                        VirtualUser:CaptureController()
                        VirtualUser:ClickButton2(Vector2.new())
                    else return end
                end)
            else
                Variables.AntiAfk = false
            end
        end
    })

    TrainingToggles:AddToggle("Anti Bubble",{
        Title = "Anti Bubble";
        Description = "Gets rid of your bubble whenever you get it.";
        Default = false;
        Callback = function(state)
            if state then
                Variables.AntiBubble = true
                coroutine.resume(coroutine.create(function()
                    local weapon = 1
                    local lastWeapon = nil
                    while Variables.AntiBubble do
                        if Players.LocalPlayer.Character and Players.LocalPlayer.Character:FindFirstChildWhichIsA("ForceField") and Variables.CharRespawning == false then
                            if weapon == 1 and Players.LocalPlayer.Backpack:FindFirstChild("Sword") then
                                lastWeapon = Players.LocalPlayer.Backpack:FindFirstChild("Sword")
                                lastWeapon.Parent = Character
                                weapon = 2
                            elseif weapon == 2 and Players.LocalPlayer.Backpack:FindFirstChild("Shuriken") then
                                lastWeapon = Players.LocalPlayer.Backpack:FindFirstChild("Shuriken")
                                lastWeapon.Parent = Character
                                weapon = 1
                            end
                            task.wait()
                            if lastWeapon and lastWeapon.Parent then
                                lastWeapon.Parent = Players.LocalPlayer.Backpack
                            end
                        else
                            task.wait()
                        end
                    end
                end))
            else
                Variables.AntiBubble = false
            end
        end
    })

    TrainingToggles:AddToggle("Auto Position",{
        Title = "Auto Position";
        Description = "Automatically teleports you to a position in the world. Uses the X, Y, and Z variables of auto positioning.";
        Default = false;
        Callback = function(state)
            if state then
                Variables.AutoPosition = true
                coroutine.resume(coroutine.create(function()
                    while Variables.AutoPosition do
                        local location = CFrame.new(Variables.Positioning.X, Variables.Positioning.Y, Variables.Positioning.Z)
                        if Character:FindFirstChild("HumanoidRootPart") then
                            Character:FindFirstChild("HumanoidRootPart").CFrame = location
                        end
                        task.wait(10)
                    end
                end))
            else
                Variables.AutoPosition = false
            end
        end
    })

    TrainingToggles:AddToggle("Auto Reconnect",{
        Title = "Auto Reconnect";
        Description = "Automatically reconnects you if you get disconnected from the game.";
        Default = false;
        Callback = function(state)
            if state then
                Variables.AutoReconnect = true
                coroutine.resume(coroutine.create(function()
                    while Variables.AutoReconnect do
                        if game.CoreGui.RobloxPromptGui.promptOverlay:FindFirstChild("ErrorPrompt") then
                            if game.CoreGui.RobloxPromptGui.promptOverlay:FindFirstChild("ErrorPrompt").TitleFrame.ErrorTitle.Text == "Disconnected" then
                                if #Players:GetPlayers() <= 1 then
                                    Players.LocalPlayer:Kick("\nRejoining...")
                                    wait()
                                    game:GetService("TeleportService"):Teleport(game.PlaceId, Players.LocalPlayer)
                                else
                                    game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, game.JobId, Players.LocalPlayer)
                                end
                            end
                        end
                        task.wait(0.5)
                    end
                end))
            else
                Variables.AutoReconnect = false
            end
        end
    })

    TrainingToggles:AddToggle("Noclip",{
        Title = "Noclip";
        Description = "Allows you to clip through any basepart in the game.";
        Default = false;
        Callback = function(state)
            if state then
                function NoclipLoop()
                    if Character then
                        for i,v in pairs(Character:GetDescendants()) do
                            if v:IsA("BasePart") and v.CanCollide == true then
                                v.CanCollide = false
                            end
                        end
                    end
                end
                Noclipping = RunService.Stepped:Connect(NoclipLoop)
            else
                pcall(function()
                    Noclipping:Disconnect()
                end)
            end
        end
    })

    TrainingToggles:AddToggle("Freeze Player",{
        Title = "Freeze Player";
        Description = "Completely freezes every part of your character's body in place.";
        Default = false;
        Callback = function(state)
            if state then
                if Character then
                    for i,v in pairs(Character:GetChildren()) do
                        if v:IsA("BasePart") and v.Anchored ~= true then
                            v.Anchored = true
                        end
                    end
                end
                Functions.CharacterAdded.FreezePlayer = function()
                    if Character then
                        for i,v in pairs(Character:GetChildren()) do
                            if v:IsA("BasePart") and v.Anchored ~= true then
                                v.Anchored = true
                            end
                        end
                    end
                end
            else
                if Character then
                    for i,v in pairs(Character:GetChildren()) do
                        if v:IsA("BasePart") and v.Anchored ~= false then
                            v.Anchored = false
                        end
                    end
                end
                Functions.CharacterAdded.FreezePlayer = nil
            end
        end
    })

    TrainingToggles:AddToggle("Seat ESP",{
        Title = "Seat ESP";
        Description = "Shows where every seat is in the map via box handle adornments.";
        Default = false;
        Callback = function(state)
            if state then
                for i,v in pairs(workspace:GetDescendants()) do
                    if v:IsA("Seat") then
                        local a = Instance.new("BoxHandleAdornment")
                        a.Name = "SeatESP"
                        a.Parent = v
                        a.Adornee = v
                        a.AlwaysOnTop = true
                        a.ZIndex = 10
                        a.Size = v.Size
                        a.Transparency = 0.2
                        a.Color = BrickColor.new(1001)
                    end
                end
            else
                for i,v in pairs(game.Workspace:GetDescendants()) do
                    if v:IsA("Seat") then
                        if v:FindFirstChild("SeatESP") then
                            v:FindFirstChild("SeatESP"):Destroy()
                        end
                    end
                end
            end
        end
    })

    TrainingToggles:AddToggle("FE God Mode",{
        Title = "FE God Mode";
        Description = "!MIGHT NOT WORK! Uses Infinite Yield's FE god mode to try and god the player.";
        Default = false;
        Callback = function(state)
            if state then
                local Player = Players.LocalPlayer
                local Cam = workspace.CurrentCamera
                local Pos, Char = Cam.CFrame, Character
                local Human = Char and Char.FindFirstChildWhichIsA(Char, "Humanoid")
                local nHuman = Human.Clone(Human)
                nHuman.Parent, Player.Character = Char, nil
                nHuman.SetStateEnabled(nHuman, 15, false)
                nHuman.SetStateEnabled(nHuman, 1, false)
                nHuman.SetStateEnabled(nHuman, 0, false)
                nHuman.BreakJointsOnDeath, Human = true, Human.Destroy(Human)
                Player.Character, Cam.CameraSubject, Cam.CFrame = Char, nHuman, wait() and Pos
                nHuman.DisplayDistanceType = Enum.HumanoidDisplayDistanceType.None
                local Script = Char.FindFirstChild(Char, "Animate")
                if Script then
                    Script.Disabled = true
                    wait()
                    Script.Disabled = false
                end
                nHuman.Health = nHuman.MaxHealth
            end
        end
    })

    TrainingToggles:AddToggle("Invisible",{
        Title = "Invisible";
        Description = "Makes the player invisible to everyone else.";
        Default = false;
        Callback = function(state)
            if state then
                Variables.InvisRunning = true
                local speaker = Players.LocalPlayer
                local Player = speaker
                repeat wait(.1) until Player.Character
                local Character = Player.Character
                Character.Archivable = true
                local IsInvis = false
                local IsRunning = true
                local InvisibleCharacter = Character:Clone()
                InvisibleCharacter.Parent = Lighting
                local Void = workspace.FallenPartsDestroyHeight
                InvisibleCharacter.Name = ""
                local CF
    
                local invisFix = RunService.Stepped:Connect(function()
                    pcall(function()
                        local IsInteger
                        if tostring(Void):find'-' then
                            IsInteger = true
                        else
                            IsInteger = false
                        end
                        local Pos = Player.Character.HumanoidRootPart.Position
                        local Pos_String = tostring(Pos)
                        local Pos_Seperate = Pos_String:split(', ')
                        local X = tonumber(Pos_Seperate[1])
                        local Y = tonumber(Pos_Seperate[2])
                        local Z = tonumber(Pos_Seperate[3])
                        if IsInteger == true then
                            if Y <= Void then
                                Respawn()
                            end
                        elseif IsInteger == false then
                            if Y >= Void then
                                Respawn()
                            end
                        end
                    end)
                end)
    
                for i,v in pairs(InvisibleCharacter:GetDescendants())do
                    if v:IsA("BasePart") then
                        if v.Name == "HumanoidRootPart" then
                            v.Transparency = 1
                        else
                            v.Transparency = .5
                        end
                    end
                end
    
                function Respawn()
                    IsRunning = false
                    if IsInvis == true then
                        pcall(function()
                            Player.Character = Character
                            wait()
                            Character.Parent = workspace
                            Character:FindFirstChildWhichIsA'Humanoid':Destroy()
                            IsInvis = false
                            InvisibleCharacter.Parent = nil
                            Variables.InvisRunning = false
                        end)
                    elseif IsInvis == false then
                        pcall(function()
                            Player.Character = Character
                            wait()
                            Character.Parent = workspace
                            Character:FindFirstChildWhichIsA'Humanoid':Destroy()
                            TurnVisible()
                        end)
                    end
                end
    
                local invisDied
                invisDied = InvisibleCharacter:FindFirstChildOfClass'Humanoid'.Died:Connect(function()
                    Respawn()
                    invisDied:Disconnect()
                end)
    
                if IsInvis == true then return end
                IsInvis = true
                CF = workspace.CurrentCamera.CFrame
                local CF_1 = Player.Character.HumanoidRootPart.CFrame
                Character:MoveTo(Vector3.new(0,math.pi*100000000,0))
                workspace.CurrentCamera.CameraType = Enum.CameraType.Scriptable
                wait(.2)
                workspace.CurrentCamera.CameraType = Enum.CameraType.Custom
                InvisibleCharacter = InvisibleCharacter
                Character.Parent = Lighting
                InvisibleCharacter.Parent = workspace
                InvisibleCharacter.HumanoidRootPart.CFrame = CF_1
                Player.Character = InvisibleCharacter
                function Zero(t)
                    for k, v in pairs(t) do
                        t[k] = v*0
                    end
                end
                function Input.StopCapture()
                    keyboard = {
                        W = 0,
                        A = 0,
                        S = 0,
                        D = 0,
                        E = 0,
                        Q = 0,
                        Up = 0,
                        Down = 0,
                        LeftShift = 0,
                    }
                    mouse = {
                        Delta = Vector2.new(),
                    }
                    navSpeed = 1
                    Zero(keyboard)
                    Zero(mouse)
                    ContextActionService:UnbindAction("FreecamKeyboard")
                    ContextActionService:UnbindAction("FreecamMousePan")
                end
                local PlayerState = {} do
                    mouseBehavior = ""
                    mouseIconEnabled = ""
                    cameraType = ""
                    cameraFocus = ""
                    cameraCFrame = ""
                    cameraFieldOfView = ""
                
                    function PlayerState.Push()
                        cameraFieldOfView = Camera.FieldOfView
                        Camera.FieldOfView = 70
                
                        cameraType = Camera.CameraType
                        Camera.CameraType = Enum.CameraType.Custom
                
                        cameraCFrame = Camera.CFrame
                        cameraFocus = Camera.Focus
                
                        mouseIconEnabled = UserInputService.MouseIconEnabled
                        UserInputService.MouseIconEnabled = true
                
                        mouseBehavior = UserInputService.MouseBehavior
                        UserInputService.MouseBehavior = Enum.MouseBehavior.Default
                    end
                
                    function PlayerState.Pop()
                        Camera.FieldOfView = 70
                
                        Camera.CameraType = cameraType
                        cameraType = nil
                
                        Camera.CFrame = cameraCFrame
                        cameraCFrame = nil
                
                        Camera.Focus = cameraFocus
                        cameraFocus = nil
                
                        UserInputService.MouseIconEnabled = mouseIconEnabled
                        mouseIconEnabled = nil
                
                        UserInputService.MouseBehavior = mouseBehavior
                        mouseBehavior = nil
                    end
                end
                function StopFreecam()
                    if not fcRunning then return end
                    Input.StopCapture()
                    RunService:UnbindFromRenderStep("Freecam")
                    PlayerState.Pop()
                    workspace.Camera.FieldOfView = 70
                    fcRunning = false
                end
                function unview()
                    StopFreecam()
                    if viewing ~= nil then
                        viewing = nil
                    end
                    if viewDied then
                        viewDied:Disconnect()
                        viewChanged:Disconnect()
                    end
                    workspace.CurrentCamera.CameraSubject = speaker.Character
                end
                function fixcam()
                    StopFreecam()
                    unview()
                    workspace.CurrentCamera:remove()
                    wait(.1)
                    repeat wait() until speaker.Character ~= nil
                    workspace.CurrentCamera.CameraSubject = speaker.Character:FindFirstChildWhichIsA('Humanoid')
                    workspace.CurrentCamera.CameraType = "Custom"
                    speaker.CameraMinZoomDistance = 0.5
                    speaker.CameraMaxZoomDistance = 400
                    speaker.CameraMode = "Classic"
                    speaker.Character.Head.Anchored = false
                end
                fixcam()
                Player.Character.Animate.Disabled = true
                Player.Character.Animate.Disabled = false
    
                function TurnVisible()
                    if IsInvis == false then return end
                    invisFix:Disconnect()
                    invisDied:Disconnect()
                    CF = workspace.CurrentCamera.CFrame
                    Character = Character
                    local CF_1 = Player.Character.HumanoidRootPart.CFrame
                    Character.HumanoidRootPart.CFrame = CF_1
                    InvisibleCharacter:Destroy()
                    Player.Character = Character
                    Character.Parent = workspace
                    IsInvis = false
                    Player.Character.Animate.Disabled = true
                    Player.Character.Animate.Disabled = false
                    invisDied = Character:FindFirstChildOfClass'Humanoid'.Died:Connect(function()
                        Respawn()
                        invisDied:Disconnect()
                    end)
                    Variables.InvisRunning = false
                end
            else
                if Variables.InvisRunning then
                    TurnVisible()
                end
            end
        end
    })

    TrainingToggles:AddToggle("Anti First Screen",{
        Title = "Anti First Screen";
        Description = "Disables the respawn screen, or 'First Screen' as the game calls it, from appearing when you die.";
        Default = false;
        Callback = function(state)
            if state then
                Variables.AntiFirstScreen = true
                coroutine.resume(coroutine.create(function()
                    while Variables.AntiFirstScreen do
                        game:GetService("Lighting"):FindFirstChild("Blur").Enabled = false
                        Player:WaitForChild("PlayerGui"):FindFirstChild("FirstScreenGui").Enabled = false
                        task.wait(0.1)
                    end
                end))
            else
                Variables.AntiFirstScreen = false
            end
        end
    })

    TrainingToggles:AddToggle("Infinite Jumps",{
        Title = "Infinite Jumps";
        Description = "Gives you an infinite amount of jumps no matter what your ninjutsu is (you could even have 0).";
        Default = false;
        Callback = function(state)
            if state then
                Variables.InfiniteJump = true
                local totalJumps = 0
                local currentJump = 0
                local MAX_JUMPS = 0
                local jumpSide = 1
                local canJump = true
                local AllJumpAnims = {}
    
                local function CreateShockRing()
                    local ring = Instance.new("Part")
                    ring.formFactor = 2
                    ring.Anchored = true
                    ring.Locked = true
                    ring.CanCollide = false
                    ring.archivable = false
                    ring.TopSurface = 0
                    ring.BottomSurface = 0
                    ring.Transparency = 1
                    local decal = Instance.new("Decal", ring)
                    decal.Face = 1
                    decal.Texture = "http://www.roblox.com/asset/?version=1&id=1280730"
                    local rfoot = Character:FindFirstChild("RightFoot")
                    local rfootpos = rfoot.Position
                    ring.CFrame = CFrame.new(rfootpos)
                    ring.Parent = rfoot
                    ring.Size = Vector3.new(1, 0.4, 1)
                    for i = 1, 10, 1 do
                        wait(0.05)
                        ring.Size = ring.Size + Vector3.new(0.75, 0, 0.75)
                        decal.Transparency = decal.Transparency + 0.1
                    end
                    ring:Destroy()
                end
                
                local function StopInGameJumpingAnims()
                    for i,v in pairs(Players.LocalPlayer.Character:FindFirstChild("Humanoid"):GetPlayingAnimationTracks()) do
                        if v.Name == "JumpAnim1" or v.Name == "JumpAnim2" then
                            v:Stop()
                        end
                    end
                end
                
                local function PlayJumpAnim()
                    local humanoid = Character:WaitForChild("Humanoid")
                    if jumpSide == 1 then
                        local jumpanim1 = Player:WaitForChild("PlayerGui"):WaitForChild("PlayerScript"):WaitForChild("JumpAnim1")
                        StopInGameJumpingAnims()
                        AllJumpAnims.JumpAnim1 = humanoid.Animator:LoadAnimation(jumpanim1)
                        AllJumpAnims.JumpAnim1:Play(0.2,1,1)
                        return
                    elseif jumpSide == 2 then
                        local jumpanim2 = Player:WaitForChild("PlayerGui"):WaitForChild("PlayerScript"):WaitForChild("JumpAnim2")
                        StopInGameJumpingAnims()
                        AllJumpAnims.JumpAnim2 = humanoid.Animator:LoadAnimation(jumpanim2)
                        AllJumpAnims.JumpAnim2:Play(0.2,1,1)
                        return
                    end
                end
    
                local function manageConsecutiveJumps(_, newState)
                    if newState == Enum.HumanoidStateType.Jumping then
                        local ninjutsu = Player:FindFirstChild("leaderstats"):FindFirstChild("Ninjutsu").Value
                        if ninjutsu < 200 then
                            MAX_JUMPS = 1
                        elseif ninjutsu >= 200 and ninjutsu < 1000 then
                            MAX_JUMPS = 2
                        elseif ninjutsu >= 1000 and ninjutsu < 3500 then
                            MAX_JUMPS = 3
                        elseif ninjutsu >= 3500 and ninjutsu < 17000 then
                            MAX_JUMPS = 4
                        elseif ninjutsu >= 17000 and ninjutsu < 36000 then
                            MAX_JUMPS = 5
                        elseif ninjutsu >= 36000 and ninjutsu < 53000 then
                            MAX_JUMPS = 6
                        elseif ninjutsu >= 53000 and ninjutsu < 84000 then
                            MAX_JUMPS = 7
                        elseif ninjutsu >= 84000 and ninjutsu < 140000 then
                            MAX_JUMPS = 8
                        elseif ninjutsu >= 140000 and ninjutsu < 180000 then
                            MAX_JUMPS = 9
                        elseif ninjutsu >= 180000 and ninjutsu < 240000 then
                            MAX_JUMPS = 10
                        elseif ninjutsu >= 240000 and ninjutsu < 350000 then
                            MAX_JUMPS = 11
                        elseif ninjutsu >= 350000 and ninjutsu < 520000 then
                            MAX_JUMPS = 12
                        elseif ninjutsu >= 520000 and ninjutsu < 830000 then
                            MAX_JUMPS = 13
                        elseif ninjutsu >= 830000 and ninjutsu < 1000000 then
                            MAX_JUMPS = 14
                        elseif ninjutsu >= 1000000 and ninjutsu < 1300000 then
                            MAX_JUMPS = 15
                        elseif ninjutsu >= 1300000 and ninjutsu < 1750000 then
                            MAX_JUMPS = 16
                        elseif ninjutsu >= 1750000 and ninjutsu < 2250000 then
                            MAX_JUMPS = 17
                        elseif ninjutsu >= 2250000 and ninjutsu < 2750000 then
                            MAX_JUMPS = 18
                        elseif ninjutsu >= 2750000 and ninjutsu < 3500000 then
                            MAX_JUMPS = 19
                        elseif ninjutsu >= 3500000 and ninjutsu < 5000000 then
                            MAX_JUMPS = 20
                        elseif ninjutsu >= 5000000 and ninjutsu < 10000000 then
                            MAX_JUMPS = 21
                        elseif ninjutsu >= 10000000 then
                            MAX_JUMPS = math.huge
                        end
                        canJump = false;
                        wait(0.1);
                        if currentJump ~= 0 then
                            if totalJumps%2 == 0 then
                                jumpSide = 2
                            else
                                jumpSide = 1
                            end
                            totalJumps = totalJumps + 1;
                        end
                        currentJump = currentJump + 1;
                        canJump = currentJump >= MAX_JUMPS;
                    elseif newState == Enum.HumanoidStateType.Freefall and currentJump == 0 then
                        currentJump = currentJump + 1;
                        if totalJumps%2 == 0 then
                            jumpSide = 2
                        else
                            jumpSide = 1
                        end
                        totalJumps = totalJumps + 1;
                        canJump = currentJump >= MAX_JUMPS;
                    elseif newState == Enum.HumanoidStateType.Landed then
                        currentJump = 0;
                        canJump = true;
                    end
                end
                
                local function dispatchConsecutiveJumps(inputObject,processed)
                    if not processed then
                        local humanoid = Character:WaitForChild("Humanoid")
                        local shouldDispatch = (
                            inputObject.KeyCode == Enum.KeyCode.Space and humanoid:GetState() ~= Enum.HumanoidStateType.Jumping and canJump and Variables.InfiniteJump
                        )
                
                        if shouldDispatch then
                            if currentJump ~= 0 then
                                PlayJumpAnim()
                                humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
                                Character:FindFirstChild("HumanoidRootPart").Velocity = Vector3.new(0,0,0)
                                local bv = Instance.new("BodyVelocity")
                                bv.MaxForce = Vector3.new(math.huge,math.huge,math.huge)
                                bv.Velocity = Vector3.new(0,60,0)
                                bv.Parent = Character:FindFirstChild("HumanoidRootPart")
                                if humanoid.MoveDirection ~= Vector3.new(0,0,0) then
                                    bv.Velocity = bv.Velocity + humanoid.MoveDirection * 100
                                end
                                game:GetService("Debris"):AddItem(bv,0.01)
                                CreateShockRing()
                            elseif humanoid:GetState() == Enum.HumanoidStateType.Freefall then
                                PlayJumpAnim()
                                humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
                                Character:FindFirstChild("HumanoidRootPart").Velocity = Vector3.new(0,0,0)
                                local bv = Instance.new("BodyVelocity")
                                bv.MaxForce = Vector3.new(math.huge,math.huge,math.huge)
                                bv.Velocity = Vector3.new(0,60,0)
                                bv.Parent = Character:FindFirstChild("HumanoidRootPart")
                                if humanoid.MoveDirection ~= Vector3.new(0,0,0) then
                                    bv.Velocity = bv.Velocity + humanoid.MoveDirection * 100
                                end
                                game:GetService("Debris"):AddItem(bv,0.01)
                                CreateShockRing()
                            end
                        end
                    end
                end
                
                consecjumpssc = Character:WaitForChild("Humanoid",math.huge).StateChanged:Connect(manageConsecutiveJumps)
                consecjumpsuis = UserInputService.InputBegan:Connect(dispatchConsecutiveJumps)
    
                Functions.CharacterAdded.InfiniteJumps = function()
                    totalJumps = 0
                    jumpSide = 1
                    consecjumpssc = Character:WaitForChild("Humanoid",math.huge).StateChanged:Connect(manageConsecutiveJumps)
                    consecjumpsuis = UserInputService.InputBegan:Connect(dispatchConsecutiveJumps)
                end
            else
                pcall(function()
                    Variables.InfiniteJump = true
                    CharacterAddedFunctions.InfiniteJumps = nil
                    consecjumpssc:Disconnect()
                    consecjumpsuis:Disconnect()
                end)
            end
        end
    })

    TrainingToggles:AddToggle("Infinite Teleport",{
        Title = "Infinite Teleport";
        Description = "Gives you infinite teleporting range, assuming you have the teleport tool.";
        Default = false;
        Callback = function(state)
            if state then
                Variables.InfiniteTeleport = true
                local tool = nil
                local mouse = Players.LocalPlayer:GetMouse()
                local AllTeleAnims = {}

                local function PlayTeleportAnim(tool)
                    local teleanim = tool.LocalScript.TeleportAnim
                    local humanoid = Character:WaitForChild("Humanoid")
                    for i,v in pairs(AllTeleAnims) do
                        v:Stop()
                    end
                    AllTeleAnims.WarpAnim = humanoid:WaitForChild("Animator"):LoadAnimation(teleanim)
                    AllTeleAnims.WarpAnim:Play(0.1, 1, 2)
                end

                if Player.leaderstats.Ninjutsu.Value >= 63000 then
                    repeat task.wait(0.05) until Player.Backpack:FindFirstChild("Teleport") or Character:FindFirstChild("Teleport")
                    tool = Player.Backpack:FindFirstChild("Teleport") or Character:FindFirstChild("Teleport")
                    infteleporting = tool.Activated:Connect(function()
                        if Variables.InfiniteTeleport then
                            local ninjutsu = Player:FindFirstChild("leaderstats").Ninjutsu.Value
                            if (ninjutsu / 10000) < (tool.Handle.CFrame.p - mouse.Hit.p).Magnitude then
                                local teleeffpart = Instance.new("Part",Character:FindFirstChild("HumanoidRootPart"))
                                local bbgui = Instance.new("BillboardGui",teleeffpart)
                                local image = Instance.new("ImageLabel",bbgui)
                                teleeffpart.Size = Vector3.new(1,1,1)
                                teleeffpart.Position = Character:FindFirstChild("HumanoidRootPart").Position
                                teleeffpart.CanCollide = false
                                teleeffpart.Transparency = 1
                                teleeffpart.Anchored = true
                                bbgui.Size = UDim2.new(16,0,4,0)
                                bbgui.SizeOffset = Vector2.new(0.25,0)
                                bbgui.StudsOffset = Vector3.new(0,2.5,0)
                                bbgui.ZIndexBehavior = Enum.ZIndexBehavior.Global
                                bbgui.LightInfluence = 1
                                bbgui.MaxDistance = math.huge
                                image.BackgroundTransparency = 1
                                image.Size = UDim2.new(0.5,0,2,0)
                                image.Image = "rbxassetid://1105721957"
                                image.ImageColor3 = Color3.new(0,0,0)
                                if Player.Team.Name == "Yin" then
                                    image.ImageColor3 = Color3.fromRGB(0,0,0)
                                elseif Player.Team.Name == "Yang" then
                                    image.ImageColor3 = Color3.fromRGB(242,243,243)
                                end
                                task.spawn(function()
                                    for i = 1,10 do
                                        image.ImageTransparency = image.ImageTransparency + 0.1
                                        if image.ImageTransparency == 1 then
                                            teleeffpart:Destroy()
                                        end
                                        task.wait(0.0505)
                                    end
                                end)
                                PlayTeleportAnim(tool)
                                Character:FindFirstChild("HumanoidRootPart").CFrame = CFrame.new(Vector3.new(mouse.Hit.p.X,mouse.Hit.p.Y + 2,mouse.Hit.p.Z),Vector3.new(mouse.Hit.p.X,mouse.Hit.p.Y + 2,mouse.Hit.p.Z) + Character:FindFirstChild("HumanoidRootPart").CFrame.LookVector)
                                if tool.Handle:FindFirstChildWhichIsA("Sound").IsPlaying then
                                    tool.Handle:FindFirstChildWhichIsA("Sound"):Stop()
                                end
                                tool.Handle:FindFirstChildWhichIsA("Sound"):Play()
                                Player:FindFirstChild("LocalSounds").ErrorSound:Stop()
                            end
                        end
                    end)
                end

                Functions.CharacterAdded.InfiniteTeleport = function()
                    local tool = nil

                    if Player.leaderstats.Ninjutsu.Value >= 63000 then
                        repeat task.wait() until Player.Backpack:FindFirstChild("Teleport") or Character:FindFirstChild("Teleport")
                        tool = Player.Backpack:FindFirstChild("Teleport") or Character:FindFirstChild("Teleport")
                        infteleporting = tool.Activated:Connect(function()
                            if Variables.InfiniteTeleport then
                                local ninjutsu = Player:FindFirstChild("leaderstats").Ninjutsu.Value
                                if (ninjutsu / 10000) < (tool.Handle.CFrame.p - mouse.Hit.p).Magnitude then
                                    local teleeffpart = Instance.new("Part",Character:FindFirstChild("HumanoidRootPart"))
                                    local bbgui = Instance.new("BillboardGui",teleeffpart)
                                    local image = Instance.new("ImageLabel",bbgui)
                                    teleeffpart.Size = Vector3.new(1,1,1)
                                    teleeffpart.Position = Character:FindFirstChild("HumanoidRootPart").Position
                                    teleeffpart.CanCollide = false
                                    teleeffpart.Transparency = 1
                                    teleeffpart.Anchored = true
                                    bbgui.Size = UDim2.new(16,0,4,0)
                                    bbgui.SizeOffset = Vector2.new(0.25,0)
                                    bbgui.StudsOffset = Vector3.new(0,2.5,0)
                                    bbgui.ZIndexBehavior = Enum.ZIndexBehavior.Global
                                    bbgui.LightInfluence = 1
                                    bbgui.MaxDistance = math.huge
                                    image.BackgroundTransparency = 1
                                    image.Size = UDim2.new(0.5,0,2,0)
                                    image.Image = "rbxassetid://1105721957"
                                    image.ImageColor3 = Color3.new(0,0,0)
                                    if Player.Team.Name == "Yin" then
                                        image.ImageColor3 = Color3.fromRGB(0,0,0)
                                    elseif Player.Team.Name == "Yang" then
                                        image.ImageColor3 = Color3.fromRGB(242,243,243)
                                    end
                                    task.spawn(function()
                                        for i = 1,10 do
                                            image.ImageTransparency = image.ImageTransparency + 0.1
                                            if image.ImageTransparency == 1 then
                                                teleeffpart:Destroy()
                                            end
                                            task.wait(0.0505)
                                        end
                                    end)
                                    PlayTeleportAnim(tool)
                                    Character:FindFirstChild("HumanoidRootPart").CFrame = CFrame.new(Vector3.new(mouse.Hit.p.X,mouse.Hit.p.Y + 2,mouse.Hit.p.Z),Vector3.new(mouse.Hit.p.X,mouse.Hit.p.Y + 2,mouse.Hit.p.Z) + Character:FindFirstChild("HumanoidRootPart").CFrame.LookVector)
                                    if tool.Handle:FindFirstChildWhichIsA("Sound").IsPlaying then
                                        tool.Handle:FindFirstChildWhichIsA("Sound"):Stop()
                                    end
                                    tool.Handle:FindFirstChildWhichIsA("Sound"):Play()
                                    Player:FindFirstChild("LocalSounds").ErrorSound:Stop()
                                end
                            end
                        end)
                    end
                end
            else
                pcall(function()
                    Variables.InfiniteTeleport = false
                    CharacterAddedFunctions.InfiniteTeleporting = nil
                    infteleporting:Disconnect()
                end)
            end
        end
    })

    TrainingToggles:AddToggle("Safe Spot",{
        Title = "Safe Spot";
        Description = "Teleports you to a safe spot anywhere in the entire world. Uses X, Y, and Z variables of safe spot.";
        Default = false;
        Callback = function(state)
            if state then
                if Players.LocalPlayer.Character and Functions.GetRoot(Players.LocalPlayer.Character) then
                    respos = Player.Character:FindFirstChild("HumanoidRootPart").CFrame
                    local safepart = Instance.new("Part",workspace)
                    safepart.Name = "SAFEPART_1"
                    safepart.CFrame = Variables.SafePartCFrame
                    safepart.Anchored = true
                    safepart.Size = Vector3.new(2048,50,2048)
                    safepart.Color = Color3.fromRGB(99,95,98)
                    safepart.Material = Enum.Material.Slate
                    Functions.GetRoot(Players.LocalPlayer.Character).CFrame = safepart.CFrame + Vector3.new(0,27,0)
                end
            else
                if Players.LocalPlayer.Character and Functions.GetRoot(Players.LocalPlayer.Character) and workspace:FindFirstChild("SAFEPART_1") then
                    Functions.GetRoot(Players.LocalPlayer.Character).CFrame = respos
                end
                if workspace:FindFirstChild("SAFEPART_1") then
                    workspace:FindFirstChild("SAFEPART_1"):Destroy()
                end
            end
        end
    })

    TrainingToggles:AddToggle("Auto Speed",{
        Title = "Auto Speed";
        Description = "Automatically presses left control, to bring your speed back to normal, when you take out a training sword.";
        Default = false;
        Callback = function(state)
            if state then
                Players.LocalPlayer.Character.ChildAdded:Connect(function(child)
                    if Variables.AutoSpeed and child.Name == "Train" and Players.LocalPlayer.Character:FindFirstChild("Humanoid") then
                        repeat task.wait() until Players.LocalPlayer.Character.Humanoid.WalkSpeed == 0
                        if Players.LocalPlayer.Stats.SelectedWalkSpeed.Value == 0 then
                            Players.LocalPlayer.Character.Humanoid.WalkSpeed = 100
                        else
                            Players.LocalPlayer.Character.Humanoid.WalkSpeed = Players.LocalPlayer.Stats.SelectedWalkSpeed.Value
                        end
                    elseif not Variables.AutoSpeed then return end
                end)
    
                Functions.CharacterAdded.AutoSpeed = function()
                    Character.ChildAdded:Connect(function(child)
                        if Variables.AutoSpeed and child.Name == "Train" and Character:FindFirstChild("Humanoid") then
                            repeat task.wait() until Character.Humanoid.WalkSpeed == 0
                            if Players.LocalPlayer.Stats.SelectedWalkSpeed.Value == 0 then
                                Character.Humanoid.WalkSpeed = 100
                            else
                                Character.Humanoid.WalkSpeed = Players.LocalPlayer.Stats.SelectedWalkSpeed.Value
                            end
                        elseif not Variables.AutoSpeed then return end
                    end)
                end
            else
                Functions.CharacterAdded.AutoSpeed = nil
            end
        end
    })

    local TrainingSettings = Tabs.Training:AddSection("Training Settings")

    TrainingSettings:AddInput("Train Amount",{
        Title = "Train Amount";
        Description = "Configures normal train amount";
        Default = 20;
        Placeholder = "Enter a number..";
        Numeric = true;
        Finished = true;
        Callback = function(value)
            Variables.TrainAmount = tonumber(value)
        end
    })

    TrainingSettings:AddInput("Train Rate",{
        Title = "Train Rate";
        Description = "Configures normal train rate";
        Default = 0.7;
        Placeholder = "Enter a number..";
        Numeric = true;
        Finished = true;
        Callback = function(value)
            Variables.TrainRate = tonumber(value)
        end
    })

    TrainingSettings:AddInput("Alt Train Amount",{
        Title = "Alt Train Amount";
        Description = "Configures alt train amount";
        Default = 20;
        Placeholder = "Enter a number..";
        Numeric = true;
        Finished = true;
        Callback = function(value)
            Variables.AltTrainAmount = tonumber(value)
        end
    })

    TrainingSettings:AddInput("Alt Train Rate",{
        Title = "Alt Train Rate";
        Description = "Configures alt train rate";
        Default = 0.62;
        Placeholder = "Enter a number..";
        Numeric = true;
        Finished = true;
        Callback = function(value)
            Variables.AltTrainRate = tonumber(value)
        end
    })

    local SafeSpotSettings = Tabs.Training:AddSection("Safe Spot Settings")

    SafeSpotSettings:AddInput("Safe Spot X Value",{
        Title = "Safe Spot X Value";
        Description = "Configures safe spot X value";
        Default = 0;
        Placeholder = "Enter a number..";
        Numeric = true;
        Finished = true;
        Callback = function(value)
            Variables.SafePartCFrame = CFrame.new(value, Variables.SafePartCFrame.Position.Y, Variables.SafePartCFrame.Position.Z)
            if workspace:FindFirstChild("SAFEPART_1") then
                workspace:FindFirstChild("SAFEPART_1").CFrame = Variables.SafePartCFrame
                if Players.LocalPlayer.Character and Functions.GetRoot(Players.LocalPlayer.Character) then
                    local difference = value - workspace:FindFirstChild("SAFEPART_1").Position.X
                    local hrp = Functions.GetRoot(Players.LocalPlayer.Character)
                    hrp.CFrame = Variables.SafePartCFrame + Vector3.new(0,27,0)
                end
            end
        end
    })

    SafeSpotSettings:AddInput("Safe Spot Y Value",{
        Title = "Safe Spot Y Value";
        Description = "Configures safe spot Y value";
        Default = 200000;
        Placeholder = "Enter a number..";
        Numeric = true;
        Finished = true;
        Callback = function(value)
            Variables.SafePartCFrame = CFrame.new(Variables.SafePartCFrame.Position.X, value, Variables.SafePartCFrame.Position.Z)
            if workspace:FindFirstChild("SAFEPART_1") then
                workspace:FindFirstChild("SAFEPART_1").CFrame = Variables.SafePartCFrame
                if Players.LocalPlayer.Character and Functions.GetRoot(Players.LocalPlayer.Character) then
                    local difference = value - workspace:FindFirstChild("SAFEPART_1").Position.Y
                    local hrp = Functions.GetRoot(Players.LocalPlayer.Character)
                    hrp.CFrame = Variables.SafePartCFrame + Vector3.new(0,27,0)
                end
            end
        end
    })

    SafeSpotSettings:AddInput("Safe Spot Z Value",{
        Title = "Safe Spot Z Value";
        Description = "Configures safe spot Z value";
        Default = 0;
        Placeholder = "Enter a number..";
        Numeric = true;
        Finished = true;
        Callback = function(value)
            Variables.SafePartCFrame = CFrame.new(Variables.SafePartCFrame.Position.X, Variables.SafePartCFrame.Position.Y, value)
            if workspace:FindFirstChild("SAFEPART_1") then
                workspace:FindFirstChild("SAFEPART_1").CFrame = Variables.SafePartCFrame
                if Players.LocalPlayer.Character and Functions.GetRoot(Players.LocalPlayer.Character) then
                    local difference = value - workspace:FindFirstChild("SAFEPART_1").Position.Z
                    local hrp = Functions.GetRoot(Players.LocalPlayer.Character)
                    hrp.CFrame = Variables.SafePartCFrame + Vector3.new(0,27,0)
                end
            end
        end
    })


    -- // Lists Tab


    local ListsDropdowns = Tabs.Lists:AddSection("Dropdowns")
    local currentList = "Whitelist"
    local currentMode = "Soft"
    local includeWhitelist = false
    local previousValues = {}
    local playersLeft = {}

    for n,t in pairs(Lists) do
        previousValues[n] = {}
        playersLeft[n] = {}
        for w,_ in pairs(t) do
            previousValues[n][w] = {}
            if w == "Normal" or w == "Permanent" then
                playersLeft[n][w] = {}
            end
        end
    end

    Functions.PlayerRemoved.MultiListUpdate = function(player)
        for n,t in pairs(Lists) do
            if t['Normal'][player.Name] then
                playersLeft[n]['Normal'][player.Name] = true
            elseif t['Permanent'][player.Name] then
                playersLeft[n]['Permanent'][player.Name] = true
            end
        end
    end

    ListsDropdowns:AddDropdown("Multilist",{
        Title = "Soft Whitelist";
        Values = Functions.PlayersToStrings(Players:GetPlayers());
        Multi = true;
        Default = Functions.GetListPlayersInServer(currentList,currentMode);
    })

    ListsDropdowns:AddDropdown("DropDownSelector",{
        Title = "Select DropDown";
        Values = {"Whitelist", "Blacklist", "Targetlist", "BreakShurlist", "DisableShurslist"};
        Multi = false;
        Default = currentList;
    })

    ListsDropdowns:AddDropdown("ModeSelector",{
        Title = "Select Mode";
        Values = {"Soft", "Semi", "Normal", "Permanent"};
        Multi = false;
        Default = currentMode;
    })

    ListsDropdowns:AddButton({
        Title = "Refresh Multilist";
        Callback = function()
            Options.Multilist:SetValues(Functions.PlayersToStrings(Players:GetPlayers()))
            Options.Multilist:SetValue(Functions.GetListPlayersInServer(currentList,currentMode))
        end;
    })

    Options.ModeSelector:OnChanged(function(Value)
        currentMode = Value
        local listplayers = Functions.GetListPlayersInServer(currentList,Value)
        Options.Multilist:SetTitle(Value.." "..currentList)
        Options.Multilist:SetValue(listplayers)
        previousValues[currentList][currentMode] = listplayers
    end)

    Options.DropDownSelector:OnChanged(function(Value)
        currentList = Value
        local listplayers = Functions.GetListPlayersInServer(currentList,Value)
        Options.Multilist:SetTitle(currentMode.." "..Value)
        Options.Multilist:SetValue(listplayers)
        previousValues[currentList][currentMode] = listplayers
    end)

    Options.Multilist:OnChanged(function(Values)
        local tab = {}
        for Value, State in pairs(previousValues[currentList][currentMode]) do
            if not Values[Value] and Functions.ListFind(currentList,Value,currentMode) and ((not playersLeft[currentList][currentMode]) or (playersLeft[currentList][currentMode] and not playersLeft[currentList][currentMode][Value])) then
                Functions.ListRemove(currentList,Value,currentMode)
            elseif (playersLeft[currentList][currentMode] and playersLeft[currentList][currentMode][Value]) then
                tab[Value] = State
                playersLeft[currentList][currentMode][Value] = nil
            end
        end
        for Value, State in pairs(Values) do
            tab[Value] = State
            if not previousValues[currentList][currentMode][Value] and not Functions.ListFind(currentList,Value,currentMode) then
                Functions.ListInsert(currentList,Value,currentMode)
            end
        end
        previousValues[currentList][currentMode] = tab
    end)

    local ListsAdd = Tabs.Lists:AddSection("Advanced")

    ListsAdd:AddParagraph({
        Title = "Advanced Options";
        Content = "Select a list from any of the following selections and then choose what to do with it at the end.";
    })

    local function CreateDropdown(n)
        local selection = ListsAdd:AddDropdown("Select"..n,{
            Title = n.."s";
            Values = {"Soft "..n, "Semi "..n, "Normal "..n, "Permanent "..n};
            Multi = true;
            Default = {};
        })
        selection:OnChanged(function(Values)
            for i,v in pairs(Tables.Settings.AddAllLists[n]) do
                if not Values[i.." "..n] and v then
                    Tables.Settings.AddAllLists[n][i] = false
                elseif Values[i.." "..n] and not v then
                    Tables.Settings.AddAllLists[n][i] = true
                end
            end
        end)
    end

    CreateDropdown("Whitelist")
    CreateDropdown("Blacklist")
    CreateDropdown("Targetlist")
    CreateDropdown("BreakShurlist")
    CreateDropdown("DisableShurslist")

    ListsAdd:AddToggle("IncludeWhitelistedPlrs",{
        Title = "Include Whitelisted Players";
        Default = false;
        Callback = function(state)
            if state then
                includeWhitelist = true
            else
                includeWhitelist = false
            end
        end
    })

    ListsAdd:AddToggle("AddAllListPlayers",{
        Title = "Add All Players To Selected Lists";
        Default = false;
        Callback = function(state)
            if state then
                for i,v in pairs(Players:GetPlayers()) do
                    for n,t in pairs(Tables.Settings.AddAllLists) do
                        for w,p in pairs(t) do
                            if p then
                                if ((not includeWhitelist and n ~= "Whitelist" and not Functions.ListFind("Whitelist",v.Name)) or includeWhitelist) and not Functions.ListFind(n,v.Name,w) then
                                    Functions.ListInsert(n,v.Name,w)
                                end
                            end
                        end
                    end
                end
                Functions.PlayerAdded.AddAllListPlayers = function(v)
                    for n,t in pairs(Tables.Settings.AddAllLists) do
                        for w,p in pairs(t) do
                            if p then
                                if ((not includeWhitelist and n ~= "Whitelist" and not Functions.ListFind("Whitelist",v.Name)) or includeWhitelist) and not Functions.ListFind(n,v.Name,w) then
                                    Functions.ListInsert(n,v.Name,w)
                                end
                            end
                        end
                    end
                end
                Functions.PlayerRemoved.AddAllListPlayers = function(v)
                    for n,t in pairs(Tables.Settings.AddAllLists) do
                        for w,p in pairs(t) do
                            if p then
                                if Functions.ListFind(n,v.Name,w) then
                                    Functions.ListRemove(n,v.Name,w)
                                end
                            end
                        end
                    end
                end
            else
                pcall(function()
                    Functions.PlayerAdded.AddAllListPlayers = nil
                    Functions.PlayerRemoved.AddAllListPlayers = nil
                end)
            end
        end;
    })

    ListsAdd:AddButton({
        Title = "Remove All Players From Selected Lists";
        Callback = function()
            for i,v in pairs(Players:GetPlayers()) do
                for n,t in pairs(Tables.Settings.AddAllLists) do
                    for w,p in pairs(t) do
                        if p then
                            if Functions.ListFind(n,v.Name,w) then
                                Functions.ListRemove(n,v.Name,w)
                            end
                        end
                    end
                end
            end
        end
    })


    -- // Combat Tab


    local CombatButtons = Tabs.Combat:AddSection("Buttons")

    CombatButtons:AddButton({
        Title = "Main Respawn";
        Description = "Respawns you manually to the main spawn area.";
        Callback = function()
            game:GetService("ReplicatedStorage"):WaitForChild("RemoteEvent"):WaitForChild("SpawnCharacterEvent"):FireServer("MainSpawn")
        end
    })

    CombatButtons:AddButton({
        Title = "Random Respawn";
        Description = "Respawns you manually to a random spawn area.";
        Callback = function()
            game:GetService("ReplicatedStorage"):WaitForChild("RemoteEvent"):WaitForChild("SpawnCharacterEvent"):FireServer("RandomSpawn")
        end
    })

    CombatButtons:AddButton({
        Title = "Get Bubble";
        Description = "Gets a bubble from the safe zone and teleports you back. You must have full health.";
        Callback = function()
            if Character and Character:FindFirstChild("Humanoid") and not Character:FindFirstChild("ForceField") and Character.Humanoid.Health == Character.Humanoid.MaxHealth then
                Character.Humanoid:UnequipTools()
                Functions.GetBubble()
            end
        end
    })

    local CombatToggles = Tabs.Combat:AddSection("Toggles")

    CombatToggles:AddToggle("Aimbot",{
        Title = "Aimbot";
        Description = "Locks your camera onto the nearest player to you. Works best with shift lock or first person.";
        Default = false;
        Callback = function(state)
            if state then
                Variables.Aimbot = true
                local aiming = false
                local CurrentCamera = workspace.CurrentCamera
    
                Aimbotting = RunService.RenderStepped:Connect(function()
                    if aiming then
                        if Functions.ClosestPlayer() ~= nil then
                            CurrentCamera.CFrame = CFrame.new(CurrentCamera.CFrame.Position,Functions.ClosestPlayer():FindFirstChild(Variables.AimPart).Position)
                        end
                    end
                end)
    
                Functions.UserInputBegan.Aimbot = function(inp)
                    if inp.UserInputType == Enum.UserInputType.MouseButton2 and Variables.Aimbot == true then
                        aiming = true
                    end
                end
    
                Functions.UserInputEnded.UnAimbot = function(inp)
                    if inp.UserInputType == Enum.UserInputType.MouseButton2 and Variables.Aimbot == true then
                        aiming = false
                    end
                end
            else
                pcall(function()
                    Variables.Aimbot = false
                    Functions.UserInputBegan.Aimbotting = nil
                    Functions.UserInputEnded.UnAimbotting = nil
                    Aimbotting:Disconnect()
                end)
            end
        end
    })

    CombatToggles:AddToggle("SilentAim",{
        Title = "Silent Aim";
        Description = "Moves your shuriken to a speficied player after you shoot it. There are different modes as well.";
        Default = false;
        Callback = function(state)
            if state then
                Variables.SilentAim = true

                for i,v in pairs(game.Workspace:GetDescendants()) do
                    if TestingModes.silentaim or (not TestingModes.silentaim and v:FindFirstAncestorOfClass("Model") and not Players:GetPlayerFromCharacter(v:FindFirstAncestorOfClass("Model"))) then
                        if v:IsA("BasePart") or v:IsA("MeshPart") or v:IsA("Part") then
                            if v.CanCollide == false or v.CanTouch == false and not table.find(Variables.FilterList,v) then
                                table.insert(Variables.FilterList,v)
                            end
                        end
                    end
                end

                Functions.WorkspaceDescendantAdded.SilentAim = function(child)
                    if TestingModes.silentaim or (not TestingModes.silentaim and child:FindFirstAncestorOfClass("Model") and not Players:GetPlayerFromCharacter(child:FindFirstAncestorOfClass("Model"))) then
                        if child:IsA("BasePart") or child:IsA("MeshPart") or child:IsA("Part") then
                            if (child.CanCollide == false or child.CanTouch == false) and not table.find(Variables.FilterList,child) then
                                table.insert(Variables.FilterList,child)
                            end
                        end
                    end
                    if child.Name == "ThrownKunai" then
                        if child:WaitForChild("creator").Value == Players.LocalPlayer and Variables.SilentAim then
                            task.spawn(function()
                                local proximity = false
                                local fixedspeed = nil
                                local count = 0
                                local raycastParams = RaycastParams.new()
                                raycastParams.FilterDescendantsInstances = Variables.FilterList
                                raycastParams.FilterType = Enum.RaycastFilterType.Blacklist
                                raycastParams.IgnoreWater = false
                                if Variables.ShotgunFire then
                                    local number = math.random(150,250)
                                    task.wait(number / 1000)
                                end
                                child.Touched:Connect(function(tpart)
                                    if tpart:FindFirstAncestorOfClass("Model") and Players:GetPlayerFromCharacter(tpart:FindFirstAncestorOfClass("Model")) then
                                        local char = tpart:FindFirstAncestorOfClass("Model")
                                        if char:FindFirstChild("Head") and char.Head:FindFirstChild("DamageBBGui") then
                                            child:Destroy()
                                        end
                                    end
                                end)
                                while child.Parent == workspace and Variables.SilentAim do
                                    local Player = Functions.GetTargetPlayer()
                                    if Variables.AirStrikeMode and not Variables.ShotgunFire and count == 0 and Character and Functions.GetRoot(Character) then
                                        task.wait()
                                        local c = 0
                                        local root = Functions.GetRoot(Character)
                                        repeat
                                            if root then
                                                child.CFrame = CFrame.new(root.Position.X, root.Position.Y + 300, root.Position.Z)
                                            end
                                            c += 1
                                        until c == 5
                                    end
                                    if Player then
                                        local ray = workspace:Raycast(child.Position, child.CFrame.LookVector * 15, raycastParams)
                                        local victimAP = Player:FindFirstChild(Variables.AimPart)
                                        local localAP = nil
                                        if Character then
                                            localAP = Character:FindFirstChild(Variables.AimPart)
                                        end
                                        local bv = child:WaitForChild("BodyVelocity")
                                        if (ray or proximity or Variables.TeleportShuriken) and victimAP then
                                            if not proximity then
                                                proximity = true
                                            end
                                            child.CFrame = victimAP.CFrame
                                            bv.Velocity = Vector3.new(0,0,0)
                                        elseif not proximity and victimAP then
                                            if (victimAP.Position - child.Position).Magnitude > 1000 then
                                                if not fixedspeed then
                                                    fixedspeed = math.floor(((victimAP.Position - child.Position).Magnitude * 5) + 700)
                                                end
                                                bv.Velocity = CFrame.new(child.Position,victimAP.Position).LookVector * fixedspeed
                                            elseif Variables.RapidMode then
                                                bv.Velocity = CFrame.new(child.Position,victimAP.Position).LookVector * (700 * Variables.RapidMultiplier)
                                            else
                                                if localAP and not Variables.AirStrikeMode and (victimAP.Position - localAP.Position).Magnitude <= 80 then
                                                    bv.Velocity = CFrame.new(child.Position,victimAP.Position).LookVector * 300
                                                else
                                                    bv.Velocity = CFrame.new(child.Position,victimAP.Position).LookVector * 700
                                                end
                                            end
                                            child.CFrame = CFrame.new(child.Position,victimAP.Position)
                                        end
                                    end
                                    count += 1
                                    task.wait()
                                end
                            end)
                        end
                    end
                end

                Functions.WorkspaceDescendantRemoved.SilentAim = function(child)
                    if table.find(Variables.FilterList,child) then
                        table.remove(Variables.FilterList,table.find(Variables.FilterList,child))
                    end
                end
            else
                pcall(function()
                    Variables.SilentAim = false
                    Functions.WorkspaceDescendantAdded.SilentAim = nil
                    Functions.WorkspaceDescendantRemoved.SilentAim = nil
                    table.clear(Variables.FilterList)
                end)
            end
        end;
    })

    CombatToggles:AddToggle("Loopbring",{
        Title = "Loop Bring";
        Description = "Constantly brings players to your character so you can hit them with your sword.";
        Default = false;
        Callback = function(state)
            if state then
                Variables.Loopbring = false
                task.wait()
                Variables.Loopbring = true
                task.spawn(function()
                    while Variables.Loopbring do
                        for n,t in pairs(Lists['Targetlist']) do
                            for w,p in pairs(t) do
                                if (table.find(WLPunishment,p) or not Functions.ListFind("Whitelist",p)) then
                                    local victim = Players:FindFirstChild(p)
                                    if victim and victim.Character and Functions.GetRoot(victim.Character) and Players.LocalPlayer.Character and Functions.GetRoot(Players.LocalPlayer.Character) and not victim.Character:FindFirstChildWhichIsA("ForceField") then
                                        if Character:FindFirstChild("Sword") and Character:FindFirstChild("Sword"):FindFirstChild("Handle") then
                                            Functions.GetRoot(victim.Character).CFrame = CFrame.new(Character:FindFirstChild("Sword"):FindFirstChild("Handle").Position, Functions.GetRoot(victim.Character).Position + Functions.GetRoot(Character).CFrame.LookVector * 5) + Functions.GetRoot(Character).CFrame.LookVector * 3
                                        else
                                            Functions.GetRoot(victim.Character).CFrame = Functions.GetRoot(Players.LocalPlayer.Character).CFrame + Vector3.new(Variables.loopBringDistance,1,0)
                                        end
                                    end
                                end
                            end
                        end
                        task.wait()
                    end
                end)
            else
                pcall(function()
                    Variables.Loopbring = false
                end)
            end
        end;
    })

    CombatToggles:AddToggle("PredictBot",{
        Title = "Predict Bot";
        Description = "Predicts a player's movements and creates a part that the bot predicts will be the player's position in 3 seconds.";
        Default = false;
        Callback = function(state)
            if state then
                Variables.PredictMode = true
                local speedpart = workspace:FindFirstChild("SPEEDPART")
                if not speedpart then
                    speedpart = Instance.new("Part",workspace)
                    speedpart.Name = "SPEEDPART"
                    speedpart.Size = Vector3.new(1,1,1)
                    speedpart.Material = Enum.Material.Neon
                    speedpart.Anchored = true
                    speedpart.CanCollide = false
                end
                coroutine.resume(coroutine.create(function()
                    while Variables.PredictMode do
                        local predictplr = Functions.GetTargetPlayer()
                        if predictplr and predictplr:FindFirstChild("Humanoid") and predictplr:FindFirstChild(Variables.AimPart) and Character and Functions.GetRoot(Character) then
                            local speed = 300
                            local dist = (predictplr:FindFirstChild(Variables.AimPart).Position - Functions.GetRoot(Character).Position).Magnitude
                            local time = dist / speed
                            local increase = predictplr:FindFirstChild(Variables.AimPart).Velocity.Magnitude * (time + 0.01 + Variables.PredictModeOffset)
                            speedpart.Position = Vector3.new(predictplr:FindFirstChild(Variables.AimPart).Position.X + (predictplr:FindFirstChild("Humanoid").MoveDirection.X * increase), predictplr:FindFirstChild(Variables.AimPart).Position.Y + (predictplr:FindFirstChild("Humanoid").MoveDirection.Y * increase), predictplr:FindFirstChild(Variables.AimPart).Position.Z + (predictplr:FindFirstChild("Humanoid").MoveDirection.Z * increase))
                        end
                        task.wait()
                    end
                end))
            else
                pcall(function()
                    Variables.PredictMode = false
                    workspace:FindFirstChild("SPEEDPART"):Destroy()
                end)
            end
        end
    })

    CombatToggles:AddToggle("AntiVoid",{
        Title = "Anti Void";
        Description = "Attempts to cancel out players trying to throw you into the void.";
        Default = false;
        Callback = function(state)
            if state then
                Variables.AntiVoid = true
                local oldtool = nil
            
                for i,v in ipairs(Players.LocalPlayer.Backpack:GetChildren()) do
                    if v:IsA("Tool") then
                        local value = Instance.new("BoolValue")
                        value.Name = "ValueCheck"
                        value.Parent = v
                    end
                end
    
                for i,v in ipairs(Character:GetChildren()) do
                    if v:IsA("Tool") then
                        local value = Instance.new("BoolValue")
                        value.Name = "ValueCheck"
                        value.Parent = v
                    end
                end
    
                coroutine.resume(coroutine.create(function()
                    while Variables.AntiVoid == true do
                        if Character then
                            for i,v in ipairs(Character:GetChildren()) do
                                if v:IsA("Tool") then 
                                    if not v:FindFirstChild("ValueCheck") then
                                        v.Parent = Players.LocalPlayer.Backpack
                                        v.Handle:Destroy()
                                        if oldtool ~= nil then
                                            oldtool.Parent = Character
                                        end
                                    else
                                        oldtool = v
                                    end
                                end
                            end
                        end
                        task.wait()
                    end
                end))
            else
                Variables.AntiVoid = false
            end
        end;
    })

    CombatToggles:AddToggle("AutoBubble",{
        Title = "Auto Bubble";
        Description = "Automatically puts you in a bubble whenever you lose it. Can be configured in settings.";
        Default = false;
        Callback = function(state)
            if state then
                Variables.AutoBubble = true
                while Variables.AutoBubble do
                    if Character and Character:FindFirstChild("Humanoid") and not Character:FindFirstChild("ForceField") and Character.Humanoid.Health == Character.Humanoid.MaxHealth then
                        if not Variables.AltAutoBubble then
                            Character.Humanoid:UnequipTools()
                            Functions.GetBubble()
                        else
                            if not Character:FindFirstChild("Sword") and not Character:FindFirstChild("Shuriken") and not Character:FindFirstChild("ForceField") then
                                Functions.GetBubble()
                            end
                        end
                    end
                    task.wait()
                end
            else
                Variables.AutoBubble = false
            end
        end;
    })

    CombatToggles:AddToggle("AutoTarget",{
        Title = "Auto Target";
        Description = "Automatically adds players to a set targetlist when they hit you. Can be configured in settings.";
        Default = false;
        Callback = function(state)
            if state then
                Variables.AutoTarget = true
                Functions.CharacterTouched.AutoTargetting = function(child)
                    if Variables.AutoTarget then
                        for Mode, State in pairs(Tables.Settings.AutoTargetMode) do
                            if State then
                                if child.Name == "ThrownKunai" then
                                    if not child:FindFirstChild("creator") then
                                        repeat task.wait() until child:FindFirstChild("creator")
                                    end
                                    if Variables.AutoTarget and State and child:FindFirstChild("creator").Value ~= Players.LocalPlayer and not Functions.ListFind("Targetlist",child.creator.Value.Name,Mode) and not Functions.ListFind("Whitelist",child.creator.Value.Name) and (Variables.FireOnGodMode or not Functions.IsGodded(child.creator.Value)) then
                                        Functions.ListInsert("Targetlist", child.creator.Value.Name, Mode)
                                        Functions.CreateLogLabel("Combat", "Targetlist", "Added "..child.creator.Value.Name.." to the "..Mode.." Targetlist.")
                                    end
                                elseif child.Parent.Name == "Sword" then
                                    if Variables.AutoTarget and State and child.Parent.Parent.Name ~= Players.LocalPlayer.Name and not Functions.ListFind("Targetlist",child.Parent.Parent.Name,Mode) and not Functions.ListFind("Whitelist",child.Parent.Parent.Name) and (Variables.FireOnGodMode or not Functions.IsGodded(Players:FindFirstChild(child.Parent.Parent.Name))) then
                                        Functions.ListInsert("Targetlist", child.Parent.Parent.Name, Mode)
                                        Functions.CreateLogLabel("Combat", "Targetlist", "Added "..child.Parent.Parent.Name.." to the "..Mode.." Targetlist.")
                                    end
                                end
                            end
                        end
                    end
                end
            else
                pcall(function()
                    Variables.AutoTarget = false
                    Functions.CharacterTouched.AutoTargetting = nil
                end)
            end
        end;
    })

    CombatToggles:AddToggle("AutoWhitelistTarget",{
        Title = "Auto Whitelist Target";
        Description = "Automatically adds players to a set targetlist when they hit anyone on the whitelist. Can be configured in settings.";
        Default = false;
        Callback = function(state)
            if state then
                Variables.AutoWLTarget = true
                Functions.WhitelistCharacterTouched.AutoWhitelistTargetting = function(child,wlplr)
                    if Variables.AutoWLTarget and Functions.ListFind("Whitelist",wlplr.Name) then
                        for Mode, State in pairs(Tables.Settings.AutoTargetMode) do
                            if State then
                                if child.Name == "ThrownKunai" then
                                    if not child:FindFirstChild("creator") then
                                        repeat task.wait() until child:FindFirstChild("creator")
                                    end
                                    if Variables.AutoWLTarget and State and child:FindFirstChild("creator").Value ~= Players.LocalPlayer and not Functions.ListFind("Targetlist",child.creator.Value.Name,Mode) and not Functions.ListFind("Whitelist",child.creator.Value.Name) and (Variables.FireOnGodMode or not Functions.IsGodded(child.creator.Value)) then
                                        Functions.ListInsert("Targetlist", child.creator.Value.Name, Mode)
                                        Functions.CreateLogLabel("Combat", "Targetlist", "Added "..child.creator.Value.Name.." to the "..Mode.." Targetlist.")
                                    end
                                elseif child.Parent.Name == "Sword" then
                                    if Variables.AutoWLTarget and State and child.Parent.Parent.Name ~= Players.LocalPlayer.Name and not Functions.ListFind("Targetlist",child.Parent.Parent.Name,Mode) and not Functions.ListFind("Whitelist",child.Parent.Parent.Name) and (Variables.FireOnGodMode or not Functions.IsGodded(Players:FindFirstChild(child.Parent.Parent.Name))) then
                                        Functions.ListInsert("Targetlist", child.Parent.Parent.Name, Mode)
                                        Functions.CreateLogLabel("Combat", "Targetlist", "Added "..child.Parent.Parent.Name.." to the "..Mode.." Targetlist.")
                                    end
                                end
                            end
                        end
                    end
                end
            else
                pcall(function()
                    Variables.AutoWLTarget = false
                    Functions.WhitelistCharacterTouched.AutoWhitelistTargetting = nil
                end)
            end
        end
    })

    CombatToggles:AddToggle("AutoFire",{
        Title = "Auto Fire";
        Description = "Automatically fires when there are players in the targetlist at all.";
        Default = false;
        Callback = function(state)
            if state then
                Variables.AutoFire = true
                local pshurthrown = false
                local AllThrowAnimations = {}
                local WaitTable = {game:GetService("RunService").Stepped, game:GetService("RunService").Heartbeat, game:GetService("RunService").RenderStepped}
                local WaitValue = 0

                coroutine.resume(coroutine.create(function()
                    while Variables.AutoFire do
                        for n,t in pairs(Lists.Targetlist) do
                            for w,p in pairs(t) do
                                if Players:FindFirstChild(p) then
                                    local v = Players:FindFirstChild(p)
                                    if (table.find(WLPunishment,v.Name) or not Functions.ListFind("Whitelist",v.Name)) and v.Character and not v.Character:FindFirstChild("ForceField") and v.Character:FindFirstChild("Humanoid") and v.Character:FindFirstChild("Humanoid").Health > 0 and v.Character:FindFirstChild("Humanoid"):GetState() ~= Enum.HumanoidStateType.Dead and v.Character:FindFirstChild(Variables.AimPart) and (Variables.FireOnGodMode or not Functions.IsGodded(v)) then
                                        local targetplr = v
                                        if not Variables.AirStrikeMode and not Variables.PredictMode and not Variables.ServerShurikens and not Variables.ShotgunFire then
                                            if Character and Character:FindFirstChild("Shuriken") then
                                                for i,v in pairs(Character:GetChildren()) do
                                                    if v.Name == "Shuriken" and targetplr and targetplr.Character and targetplr.Character:FindFirstChild(Variables.AimPart) then
                                                        v:FindFirstChild("HitEvent"):FireServer(targetplr.Character:FindFirstChild(Variables.AimPart).Position)
                                                    end
                                                end
                                            end
                                            if Variables.OptionalEquip then
                                                for i,v in pairs(Players.LocalPlayer.Backpack:GetChildren()) do
                                                    if v.Name == "Shuriken" and targetplr and targetplr.Character and targetplr.Character:FindFirstChild(Variables.AimPart) then
                                                        v:FindFirstChild("HitEvent"):FireServer(targetplr.Character:FindFirstChild(Variables.AimPart).Position)
                                                    end
                                                end
                                            end
                                        elseif Variables.AirStrikeMode and not Variables.PredictMode and not Variables.ServerShurikens and not Variables.ShotgunFire then
                                            if Character and Character:FindFirstChild("Shuriken") and Functions.GetRoot(Character) then
                                                local hrp = Functions.GetRoot(Character)
                                                for i,v in pairs(Character:GetChildren()) do
                                                    if v.Name == "Shuriken" then
                                                        v:FindFirstChild("HitEvent"):FireServer(Vector3.new(hrp.Position.X, hrp.Position.Y + Variables.AirStrikeDistance, hrp.Position.Z))
                                                    end
                                                end
                                            elseif Character and Functions.GetRoot(Character) then
                                                if Variables.OptionalEquip then
                                                    local hrp = Functions.GetRoot(Character)
                                                    for i,v in pairs(Players.LocalPlayer.Backpack:GetChildren()) do
                                                        if v.Name == "Shuriken" then
                                                            v:FindFirstChild("HitEvent"):FireServer(Vector3.new(hrp.Position.X, hrp.Position.Y + Variables.AirStrikeDistance, hrp.Position.Z))
                                                        end
                                                    end
                                                end
                                            end
                                        elseif Variables.ServerShurikens and not Variables.AirStrikeMode and not Variables.PredictMode and not Variables.ShotgunFire then
                                            for i,v in pairs(Players:GetPlayers()) do
                                                if (Variables.PlayerShurikenCheck and v ~= targetplr) or (not Variables.PlayerShurikenCheck) then
                                                    if v:FindFirstChild("Backpack") and v.Backpack:FindFirstChild("Shuriken") then
                                                        for i,v in pairs(v.Backpack:GetChildren()) do
                                                            if v.Name == "Shuriken" and v:FindFirstChild("HitEvent") and targetplr and targetplr.Character and targetplr.Character:FindFirstChild(Variables.AimPart) then
                                                                v.HitEvent:FireServer(targetplr.Character:FindFirstChild(Variables.AimPart).Position)
                                                                if Variables.AutoFireWait >= 0 then
                                                                    task.wait(Variables.AutoFireWait)
                                                                elseif Variables.AutoFireWait == -1 then
                                                                    WaitValue = WaitValue + 1
                                                                    WaitTable[WaitValue]:wait()
                                                                    if WaitValue >= 3 then
                                                                        WaitValue = 0
                                                                    end
                                                                end
                                                            end
                                                        end
                                                    end
                                                    if v.Character and v.Character:FindFirstChild("Shuriken") then
                                                        for i,v in pairs(v.Character:GetChildren()) do
                                                            if v.Name == "Shuriken" and v:FindFirstChild("HitEvent") and targetplr and targetplr.Character and targetplr.Character:FindFirstChild(Variables.AimPart) then
                                                                v.HitEvent:FireServer(targetplr.Character:FindFirstChild(Variables.AimPart).Position)
                                                                if Variables.AutoFireWait >= 0 then
                                                                    task.wait(Variables.AutoFireWait)
                                                                elseif Variables.AutoFireWait == -1 then
                                                                    WaitValue = WaitValue + 1
                                                                    WaitTable[WaitValue]:wait()
                                                                    if WaitValue >= 3 then
                                                                        WaitValue = 0
                                                                    end
                                                                end
                                                            end
                                                        end
                                                    end
                                                end
                                            end
                                        elseif Variables.ServerShurikens and Variables.AirStrikeMode and not Variables.PredictMode and not Variables.ShotgunFire then
                                            if Character and Functions.GetRoot(Character) then
                                                local hrp = Functions.GetRoot(Character)
                                                for i,v in pairs(Players:GetPlayers()) do
                                                    if (Variables.PlayerShurikenCheck and v ~= targetplr) or (not Variables.PlayerShurikenCheck) then
                                                        if v:FindFirstChild("Backpack") and v.Backpack:FindFirstChild("Shuriken") then
                                                            for i,v in pairs(v.Backpack:GetChildren()) do
                                                                if v.Name == "Shuriken" and v:FindFirstChild("HitEvent") then
                                                                    v.HitEvent:FireServer(Vector3.new(hrp.Position.X, hrp.Position.Y + Variables.AirStrikeDistance, hrp.Position.Z))
                                                                    if Variables.AutoFireWait >= 0 then
                                                                        task.wait(Variables.AutoFireWait)
                                                                    elseif Variables.AutoFireWait == -1 then
                                                                        WaitValue = WaitValue + 1
                                                                        WaitTable[WaitValue]:wait()
                                                                        if WaitValue >= 3 then
                                                                            WaitValue = 0
                                                                        end
                                                                    end
                                                                end
                                                            end
                                                        end
                                                        if v.Character and v.Character:FindFirstChild("Shuriken") then
                                                            for i,v in pairs(v.Character:GetChildren()) do
                                                                if v.Name == "Shuriken" and v:FindFirstChild("HitEvent") then
                                                                    v.HitEvent:FireServer(Vector3.new(hrp.Position.X, hrp.Position.Y + Variables.AirStrikeDistance, hrp.Position.Z))
                                                                    if Variables.AutoFireWait >= 0 then
                                                                        task.wait(Variables.AutoFireWait)
                                                                    elseif Variables.AutoFireWait == -1 then
                                                                        WaitValue = WaitValue + 1
                                                                        WaitTable[WaitValue]:wait()
                                                                        if WaitValue >= 3 then
                                                                            WaitValue = 0
                                                                        end
                                                                    end
                                                                end
                                                            end
                                                        end
                                                    end
                                                end
                                            end
                                        elseif not Variables.ServerShurikens and Variables.AirStrikeMode and not Variables.PredictMode and Variables.ShotgunFire and Character and Functions.GetRoot(Character) then
                                            local hrp = Functions.GetRoot(Character)
                                            if Character and Character:FindFirstChild("Shuriken") then
                                                for i,v in pairs(Character:GetChildren()) do
                                                    if v.Name == "Shuriken" then
                                                        local distanceX = math.random(-100,100)
                                                        local distanceZ = math.random(-100,100)
                                                        local resultVector = Vector3.new(hrp.Position.X + distanceX,hrp.Position.Y + Variables.ShotgunFireSpread,hrp.Position.Z + distanceZ)
                                                        v:FindFirstChild("HitEvent"):FireServer(resultVector)
                                                    end
                                                end
                                            end
                                            if Variables.OptionalEquip then
                                                for i,v in pairs(Players.LocalPlayer.Backpack:GetChildren()) do
                                                    if v.Name == "Shuriken" then
                                                        local distanceX = math.random(-100,100)
                                                        local distanceZ = math.random(-100,100)
                                                        local resultVector = Vector3.new(hrp.Position.X + distanceX,hrp.Position.Y + Variables.ShotgunFireSpread,hrp.Position.Z + distanceZ)
                                                        v:FindFirstChild("HitEvent"):FireServer(resultVector)
                                                    end
                                                end
                                            end
                                        elseif Variables.ServerShurikens and Variables.AirStrikeMode and not Variables.PredictMode and Variables.ShotgunFire then
                                            if Character and Functions.GetRoot(Character) then
                                                local hrp = Functions.GetRoot(Character)
                                                for i,v in pairs(Players:GetPlayers()) do
                                                    if (Variables.PlayerShurikenCheck and v ~= targetplr) or (not Variables.PlayerShurikenCheck) then
                                                        if v:FindFirstChild("Backpack") and v.Backpack:FindFirstChild("Shuriken") then
                                                            for i,v in pairs(v.Backpack:GetChildren()) do
                                                                if v.Name == "Shuriken" and v:FindFirstChild("HitEvent") then
                                                                    local distanceX = math.random(-100,100)
                                                                    local distanceZ = math.random(-100,100)
                                                                    local resultVector = Vector3.new(hrp.Position.X + distanceX,hrp.Position.Y + Variables.ShotgunFireSpread,hrp.Position.Z + distanceZ)
                                                                    v.HitEvent:FireServer(resultVector)
                                                                    if Variables.AutoFireWait >= 0 then
                                                                        task.wait(Variables.AutoFireWait)
                                                                    elseif Variables.AutoFireWait == -1 then
                                                                        WaitValue = WaitValue + 1
                                                                        WaitTable[WaitValue]:wait()
                                                                        if WaitValue >= 3 then
                                                                            WaitValue = 0
                                                                        end
                                                                    end
                                                                end
                                                            end
                                                        end
                                                        if v.Character and v.Character:FindFirstChild("Shuriken") then
                                                            for i,v in pairs(v.Character:GetChildren()) do
                                                                if v.Name == "Shuriken" and v:FindFirstChild("HitEvent") then
                                                                    local distanceX = math.random(-100,100)
                                                                    local distanceZ = math.random(-100,100)
                                                                    local resultVector = Vector3.new(hrp.Position.X + distanceX,hrp.Position.Y + Variables.ShotgunFireSpread,hrp.Position.Z + distanceZ)
                                                                    v.HitEvent:FireServer(resultVector)
                                                                    if Variables.AutoFireWait >= 0 then
                                                                        task.wait(Variables.AutoFireWait)
                                                                    elseif Variables.AutoFireWait == -1 then
                                                                        WaitValue = WaitValue + 1
                                                                        WaitTable[WaitValue]:wait()
                                                                        if WaitValue >= 3 then
                                                                            WaitValue = 0
                                                                        end
                                                                    end
                                                                end
                                                            end
                                                        end
                                                    end
                                                end
                                            end
                                        elseif not Variables.ServerShurikens and not Variables.AirStrikeMode and not Variables.PredictMode and Variables.ShotgunFire then
                                            if Character and Character:FindFirstChild("Shuriken") then
                                                for i,v in pairs(Character:GetChildren()) do
                                                    if v.Name == "Shuriken" and targetplr and targetplr.Character and targetplr.Character:FindFirstChild(Variables.AimPart) then
                                                        local distanceX = math.random(-100,100)
                                                        local distanceY = math.random(-100,100)
                                                        local distanceZ = math.random(-100,100)
                                                        local aimpart = targetplr.Character:FindFirstChild(Variables.AimPart)
                                                        local resultVector = Vector3.new(aimpart.Position.X + distanceX, aimpart.Position.Y + distanceY, aimpart.Position.Z + distanceZ)
                                                        v:FindFirstChild("HitEvent"):FireServer(resultVector)
                                                    end
                                                end
                                            end
                                            if Variables.OptionalEquip then
                                                for i,v in pairs(Players.LocalPlayer.Backpack:GetChildren()) do
                                                    if v.Name == "Shuriken" and targetplr and targetplr.Character and targetplr.Character:FindFirstChild(Variables.AimPart) then
                                                        local distanceX = math.random(-100,100)
                                                        local distanceY = math.random(-100,100)
                                                        local distanceZ = math.random(-100,100)
                                                        local aimpart = targetplr.Character:FindFirstChild(Variables.AimPart)
                                                        local resultVector = Vector3.new(aimpart.Position.X + distanceX, aimpart.Position.Y + distanceY, aimpart.Position.Z + distanceZ)
                                                        v:FindFirstChild("HitEvent"):FireServer(resultVector)
                                                    end
                                                end
                                            end
                                        elseif Variables.ServerShurikens and not Variables.AirStrikeMode and not Variables.PredictMode and Variables.ShotgunFire then
                                            for i,v in pairs(Players:GetPlayers()) do
                                                if (Variables.PlayerShurikenCheck and v ~= targetplr) or (not Variables.PlayerShurikenCheck) then
                                                    if v:FindFirstChild("Backpack") and v.Backpack:FindFirstChild("Shuriken") then
                                                        for i,v in pairs(v.Backpack:GetChildren()) do
                                                            if v.Name == "Shuriken" and v:FindFirstChild("HitEvent") and targetplr and targetplr.Character and targetplr.Character:FindFirstChild(Variables.AimPart) then
                                                                local distanceX = math.random(-100,100)
                                                                local distanceY = math.random(-100,100)
                                                                local distanceZ = math.random(-100,100)
                                                                local aimpart = targetplr.Character:FindFirstChild(Variables.AimPart)
                                                                local resultVector = Vector3.new(aimpart.Position.X + distanceX, aimpart.Position.Y + distanceY, aimpart.Position.Z + distanceZ)
                                                                v.HitEvent:FireServer(resultVector)
                                                                if Variables.AutoFireWait >= 0 then
                                                                    task.wait(Variables.AutoFireWait)
                                                                elseif Variables.AutoFireWait == -1 then
                                                                    WaitValue = WaitValue + 1
                                                                    WaitTable[WaitValue]:wait()
                                                                    if WaitValue >= 3 then
                                                                        WaitValue = 0
                                                                    end
                                                                end
                                                            end
                                                        end
                                                    end
                                                    if v.Character and v.Character:FindFirstChild("Shuriken") then
                                                        for i,v in pairs(v.Character:GetChildren()) do
                                                            if v.Name == "Shuriken" and v:FindFirstChild("HitEvent") and targetplr and targetplr.Character and targetplr.Character:FindFirstChild(Variables.AimPart) then
                                                                local distanceX = math.random(-100,100)
                                                                local distanceY = math.random(-100,100)
                                                                local distanceZ = math.random(-100,100)
                                                                local aimpart = targetplr.Character:FindFirstChild(Variables.AimPart)
                                                                local resultVector = Vector3.new(aimpart.Position.X + distanceX, aimpart.Position.Y + distanceY, aimpart.Position.Z + distanceZ)
                                                                v.HitEvent:FireServer(resultVector)
                                                                if Variables.AutoFireWait >= 0 then
                                                                    task.wait(Variables.AutoFireWait)
                                                                elseif Variables.AutoFireWait == -1 then
                                                                    WaitValue = WaitValue + 1
                                                                    WaitTable[WaitValue]:wait()
                                                                    if WaitValue >= 3 then
                                                                        WaitValue = 0
                                                                    end
                                                                end
                                                            end
                                                        end
                                                    end
                                                end
                                            end
                                        elseif Variables.PredictMode then
                                            if workspace:FindFirstChild("SPEEDPART") then
                                                if Character and Character:FindFirstChild("Shuriken") then
                                                    for i,v in pairs(Character:GetChildren()) do
                                                        if v.Name == "Shuriken" then
                                                            v:FindFirstChild("HitEvent"):FireServer(workspace:FindFirstChild("SPEEDPART").Position)
                                                            local shur = v
                                                            if pshurthrown and Character:FindFirstChild("Humanoid") then
                                                                for i,v in pairs(AllThrowAnimations) do
                                                                    v:Stop()
                                                                end
                                                                AllThrowAnimations.ThrowAnim = Character:FindFirstChild("Humanoid"):WaitForChild("Animator"):LoadAnimation(shur:FindFirstChild("LocalScript"):FindFirstChild("ThrowAnim"))
                                                                AllThrowAnimations.ThrowAnim:Play()
                                                                pshurthrown = false
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
                end))

                Functions.WorkspaceDescendantAdded.AutoFirePredict = function(child)
                    if Variables.PredictMode then
                        if child.Name == "ThrownKunai" then
                            if child:WaitForChild("creator").Value == Players.LocalPlayer then
                                pshurthrown = true
                            end
                        end
                    end
                end
                
            else
                pcall(function()
                    Variables.AutoFire = false
                    Functions.WorkspaceDescendantAdded.AutoFirePredict = nil
                end)
            end
        end
    })

    CombatToggles:AddToggle("Savior",{
        Title = "Savior";
        Description = "Saves you and your rep by resetting you at a certain health so the other player doesn't get a kill.";
        Default = false;
        Callback = function(state)
            if state then
                Variables.Savior = true
                local function HPChanged(health)
                    if Variables.Savior and health <= (Character:FindFirstChild("Humanoid").MaxHealth * Variables.SaviorPercent) then
                        Character:FindFirstChild("Humanoid").Health = 0
                    end
                end

                hpchanging = Character:WaitForChild("Humanoid",math.huge).HealthChanged:Connect(HPChanged)

                Functions.CharacterAdded.Savior = function()
                    hpchanging = Character:WaitForChild("Humanoid",math.huge).HealthChanged:Connect(HPChanged)
                end
            else
                pcall(function()
                    Variables.Savior = false
                    Functions.CharacterAdded.Savior = nil
                    hpchanging:Disconnect()
                end)
            end
        end

    })

    CombatToggles:AddToggle("BreakShurikens",{
        Title = "Break Shurikens";
        Description = "Breaks everyones shurikens that are in the BreakShurlist.";
        Default = false;
        Callback = function(state)
            if state then
                Variables.BreakShurs = false
                task.wait(0.03)
                Variables.BreakShurs = true
                task.spawn(function()
                    while Variables.BreakShurs do
                        for n,t in pairs(Lists.BreakShurlist) do
                            for w,p in pairs(t) do
                                if Players:FindFirstChild(p) then
                                    local v = Players:FindFirstChild(p)
                                    pcall(function()
                                        for i,v in pairs(v.Backpack:GetChildren()) do
                                            if v.Name == "Shuriken" and v:FindFirstChild("HitEvent") then
                                                v:FindFirstChild("HitEvent"):FireServer(Vector2.new())
                                            end
                                        end
                                        for i,v in pairs(v.Character:GetChildren()) do
                                            if v.Name == "Shuriken" and v:FindFirstChild("HitEvent") then
                                                v:FindFirstChild("HitEvent"):FireServer(Vector2.new())
                                            end
                                        end
                                    end)
                                end
                            end
                        end
                        task.wait(0.1)
                    end
                end)
            else
                Variables.BreakShurs = false
            end
        end
    })

    CombatToggles:AddToggle("DisableShurikens",{
        Title = "Disable Shurikens";
        Description = "Disables the shurikens of the entire server when a player in the disableshurslist is in the game.";
        Default = false;
        Callback = function(state)
            if state then
                Variables.DisableShurs = false
                task.wait(0.03)
                Variables.DisableShurs = true
                task.spawn(function()
                    while Variables.DisableShurs do
                        if Functions.ListPlayerInServer("DisableShurslist") then
                            for i,v in pairs(Players:GetPlayers()) do
                                pcall(function()
                                    for i,v in pairs(v.Backpack:GetChildren()) do
                                        if v.Name == "Shuriken" and v:FindFirstChild("HitEvent") then
                                            v:FindFirstChild("HitEvent"):FireServer(Vector2.new())
                                        end
                                    end
                                    for i,v in pairs(v.Character:GetChildren()) do
                                        if v.Name == "Shuriken" and v:FindFirstChild("HitEvent") then
                                            v:FindFirstChild("HitEvent"):FireServer(Vector2.new())
                                        end
                                    end
                                end)
                            end
                        end
                        task.wait(0.1)
                    end
                end)
            else
                Variables.DisableShurs = false
            end
        end;
    })

    CombatToggles:AddToggle("AutoBreakShurikens",{
        Title = "Auto Break Shurikens";
        Description = "Automatically breaks the shurikens of players that hit you.";
        Default = false;
        Callback = function(state)
            if state then
                Variables.AutoBreakShurs = true
                coroutine.resume(coroutine.create(function()
                    while Variables.AutoBreakShurs do
                        for i,v in pairs(Players:GetPlayers()) do
                            if v:FindFirstChild("leaderstats") and v.leaderstats:FindFirstChild("Ninjutsu") and not Functions.ListFind("Whitelist",v.Name) and not Functions.ListFind("BreakShurlist",v.Name,"Normal") then
                                if v.leaderstats.Ninjutsu.Value < 0 then
                                    Functions.ListInsert("BreakShurlist",v.Name,"Normal")
                                    Functions.CreateLogLabel("Combat", "Breakshurslist", "Added "..v.Name.." to the Normal BreakShurslist.")
                                end
                            elseif v:FindFirstChild("leaderstats") and v.leaderstats:FindFirstChild("Ninjutsu") and Functions.ListFind("Whitelist",v.Name) and not Functions.ListFind("BreakShurlist",v.Name,"Semi") then
                                if v.leaderstats.Ninjutsu.Value < 0 then
                                    if not table.find(WLPunishment,v.Name) then
                                        table.insert(WLPunishment,v.Name)
                                        Functions.PlayerRemoved.WLPunishment = function(plr)
                                            if table.find(WLPunishment,plr.Name) then
                                                table.remove(WLPunishment,table.find(WLPunishment,plr.Name))
                                                Functions.PlayerRemoved.WLPunishment = nil
                                            end
                                        end
                                    end
                                    Functions.ListInsert("BreakShurlist",v.Name,"Semi")
                                    Functions.CreateLogLabel("Combat", "Breakshurslist", "Added "..v.Name.." to the Semi BreakShurslist.")
                                end
                            end
                        end
                        task.wait(0.1)
                    end
                end))
    
                Functions.CharacterTouched.AutoBreakShurikens = function(child)
                    if Variables.AutoBreakShurs then
                        for Mode, State in pairs(Tables.Settings.AutoBreakShurikensMode) do
                            if State then
                                if child.Name == "ThrownKunai" then
                                    if not child:FindFirstChild("creator") then
                                        repeat task.wait() until child:FindFirstChild("creator")
                                    end
                                    if Variables.AutoBreakShurs and State and child:FindFirstChild("creator").Value ~= Players.LocalPlayer and not Functions.ListFind("BreakShurlist",child.creator.Value.Name,Mode) and not Functions.ListFind("Whitelist",child.creator.Value.Name) then
                                        Functions.ListInsert("BreakShurlist", child.creator.Value.Name, Mode)
                                        Functions.CreateLogLabel("Combat", "BreakShurslist", "Added "..child.creator.Value.Name.." to the "..Mode.." BreakShurslist.")
                                    end
                                elseif child.Parent.Name == "Sword" then
                                    if Variables.AutoBreakShurs and State and child.Parent.Parent.Name ~= Players.LocalPlayer.Name and not Functions.ListFind("BreakShurlist",child.Parent.Parent.Name,Mode) and not Functions.ListFind("Whitelist",child.Parent.Parent.Name) then
                                        Functions.ListInsert("BreakShurlist", child.Parent.Parent.Name, Mode)
                                        Functions.CreateLogLabel("Combat", "BreakShurslist", "Added "..child.Parent.Parent.Name.." to the "..Mode.." BreakShurslist.")
                                    end
                                end
                            end
                        end
                    end
                end
            else
                pcall(function()
                    Variables.AutoBreakShurs = false
                    Functions.CharacterTouched.AutoBreakShurikens = nil
                end)
            end
        end;
    })

    CombatToggles:AddToggle("AutoWhitelistBreakShurikens",{
        Title = "Auto Whitelist Break Shurikens";
        Description = "Automatically breaks the shurikens of players who hit whitelisted players.";
        Default = false;
        Callback = function(state)
            if state then
                Variables.AutoWLBreakShurs = true
                Functions.WhitelistCharacterTouched.AutoWhitelistBreakShurikens = function(child,wlplr)
                    if Variables.AutoWLBreakShurs and Functions.ListFind("Whitelist",wlplr.Name) then
                        for Mode, State in pairs(Tables.Settings.AutoBreakShurikensMode) do
                            if State then
                                if child.Name == "ThrownKunai" then
                                    if not child:FindFirstChild("creator") then
                                        repeat task.wait() until child:FindFirstChild("creator")
                                    end
                                    if Variables.AutoWLBreakShurs and State and child:FindFirstChild("creator").Value ~= Players.LocalPlayer and not Functions.ListFind("BreakShurlist",child.creator.Value.Name,Mode) and not Functions.ListFind("Whitelist",child.creator.Value.Name) then
                                        Functions.ListInsert("BreakShurlist", child.creator.Value.Name, Mode)
                                        Functions.CreateLogLabel("Combat", "BreakShurslist", "Added "..child.creator.Value.Name.." to the "..Mode.." BreakShurslist.")
                                    end
                                elseif child.Parent.Name == "Sword" then
                                    if Variables.AutoWLBreakShurs and State and child.Parent.Parent.Name ~= Players.LocalPlayer.Name and not Functions.ListFind("BreakShurlist",child.Parent.Parent.Name,Mode) and not Functions.ListFind("Whitelist",child.Parent.Parent.Name) then
                                        Functions.ListInsert("BreakShurlist", child.Parent.Parent.Name, Mode)
                                        Functions.CreateLogLabel("Combat", "BreakShurslist", "Added "..child.Parent.Parent.Name.." to the "..Mode.." BreakShurslist.")
                                    end
                                end
                            end
                        end
                    end
                end
            else
                pcall(function()
                    Variables.AutoWLBreakShurs = false
                    Functions.CharacterTouched.AutoWhitelistBreakShurikens = nil
                end)
            end
        end
    })

    CombatToggles:AddToggle("ActivateHitEvent",{
        Title = "Activate Hit Event";
        Description = "Constantly fires selected weapon's hit events which makes the sword constantly fire.";
        Default = false;
        Callback = function(state)
            if state then
                Variables.ActivateHitEvent = false
                task.wait()
                Variables.ActivateHitEvent = true
                task.spawn(function()
                    local WaitTable = {game:GetService("RunService").Stepped, game:GetService("RunService").Heartbeat, game:GetService("RunService").RenderStepped}
                    local WaitValue = 0
                    while Variables.ActivateHitEvent do
                        for i,v in pairs(Tables.Settings.HitEventWeapons) do
                            if v then
                                if Players.LocalPlayer.Character and Players.LocalPlayer.Character:FindFirstChild(i) then
                                    for _,v in pairs(Players.LocalPlayer.Character:GetChildren()) do
                                        if v.Name == i and v:FindFirstChild("HitEvent") and Variables.ActivateHitEvent then
                                            v.HitEvent:FireServer()
                                            if Variables.HitEventWait >= 0 then
                                                task.wait(Variables.HitEventWait)
                                            elseif Variables.HitEventWait == -1 then
                                                if WaitValue >= 3 then
                                                    WaitValue = 0
                                                end
                                                WaitValue = WaitValue + 1
                                                WaitTable[WaitValue]:Wait()
                                            end
                                        end
                                    end
                                end
                            end
                        end
                        if Variables.HitEventFinishWait >= 0 then
                            task.wait(Variables.HitEventFinishWait)
                        elseif Variables.HitEventFinishWait < 0 then
                            if WaitValue >= 3 then
                                WaitValue = 0
                            end
                            WaitValue = WaitValue + 1
                            WaitTable[WaitValue]:Wait()
                        end
                    end
                end)
            else
                Variables.ActivateHitEvent = false
            end
        end;
    })

    CombatToggles:AddToggle("WeaponAutoEquip",{
        Title = "Weapon Auto Equip";
        Description = "Automatically equips weapons from the weapon list.";
        Default = false;
        Callback = function(state)
            if state then
                Variables.WeaponAutoEquip = false;
                task.wait()
                Variables.WeaponAutoEquip = true;
                coroutine.resume(coroutine.create(function()
                    while Variables.WeaponAutoEquip do
                        for i,v in pairs(Tables.Settings.AutoEquipWeapons) do
                            if v and Character and not Variables.CharRespawning and not Variables.DroppingSword then
                                if not Character:FindFirstChild(i) then
                                    if Players.LocalPlayer.Backpack:FindFirstChild(i) then
                                        Players.LocalPlayer.Backpack:FindFirstChild(i).Parent = Character
                                    end
                                end
                            end
                        end
                        task.wait()
                    end
                end))
            else
                pcall(function()
                    Variables.WeaponAutoEquip = false
                end)
            end
        end;
    })

    CombatToggles:AddToggle("HoldClick",{
        Title = "Hold Click";
        Description = "Hold down left mouse button to activate certain tools. Configure which ones in settings.";
        Default = false;
        Callback = function(state)
            if state then
                Variables.HoldClick = true
                local pshurthrown = false
                local AllThrowAnimations = {}
                local WaitVariables = {}
                local WaitTable = {game:GetService("RunService").Stepped, game:GetService("RunService").Heartbeat, game:GetService("RunService").RenderStepped}
                local WaitValue = 0
                
                Functions.UserInputBegan.HoldClick = function(input,processed)
                    if not processed then
                        if input.UserInputType == Enum.UserInputType.MouseButton1 then
                            if Variables.HoldClick then
                                for i,v in pairs(Tables.Settings.HoldClickMode) do
                                    if v then
                                        WaitVariables[i] = true
                                        task.spawn(function()
                                            while WaitVariables[i] do
                                                if i ~= "Shuriken" then
                                                    if Character and Character:FindFirstChild(i) then
                                                        for _,v in pairs(Character:GetChildren()) do
                                                            if v.Name == i and WaitVariables[i] then
                                                                v:Activate()
                                                            end
                                                        end
                                                    end
                                                elseif i == "Shuriken" and WaitVariables[i] then
                                                    local PLACEHOLDER = i
                                                    if not Variables.ServerShurikens and not Variables.AirStrikeMode and not Variables.ShotgunFire and not Variables.PredictMode then
                                                        if Character and Character:FindFirstChild(i) then
                                                            for _,v in pairs(Character:GetChildren()) do
                                                                if v.Name == i and WaitVariables[PLACEHOLDER] then
                                                                    if v.Enabled == false then v.Enabled = true end
                                                                    v:Activate()
                                                                end
                                                            end
                                                        end
                                                        if Variables.OptionalEquip then
                                                            if Players.LocalPlayer:FindFirstChild("Backpack") and Players.LocalPlayer.Backpack:FindFirstChild(i) then
                                                                for _,v in pairs(Players.LocalPlayer.Backpack:GetChildren()) do
                                                                    if v.Name == i and WaitVariables[PLACEHOLDER] then
                                                                        if v.Enabled == false then v.Enabled = true end
                                                                        v:FindFirstChild("HitEvent"):FireServer(mouse.Hit.p)
                                                                    end
                                                                end
                                                            end
                                                        end
                                                    elseif not Variables.ServerShurikens and Variables.AirStrikeMode and not Variables.ShotgunFire and not Variables.PredictMode then
                                                        if Character and Functions.GetRoot(Character) then
                                                            local hrp = Functions.GetRoot(Character)
                                                            for _,v in pairs(Character:GetChildren()) do
                                                                if v.Name == i and WaitVariables[PLACEHOLDER] then
                                                                    if v.Enabled == true then v.Enabled = false end
                                                                    v:FindFirstChild("HitEvent"):FireServer(Vector3.new(hrp.Position.X, hrp.Position.Y + 500, hrp.Position.Z))
                                                                end
                                                            end
                                                        end
                                                        if Variables.OptionalEquip then
                                                            if Players.LocalPlayer:FindFirstChild("Backpack") and Players.LocalPlayer.Backpack:FindFirstChild(i) then
                                                                for _,v in pairs(Players.LocalPlayer.Backpack:GetChildren()) do
                                                                    if v.Name == i and Character and Functions.GetRoot(Character) and WaitVariables[PLACEHOLDER] then
                                                                        local hrp = Functions.GetRoot(Character)
                                                                        if v.Enabled == true then v.Enabled = false end
                                                                        v:FindFirstChild("HitEvent"):FireServer(Vector3.new(hrp.Position.X, hrp.Position.Y + 500, hrp.Position.Z))
                                                                    end
                                                                end
                                                            end
                                                        end
                                                    elseif Variables.ServerShurikens and not Variables.AirStrikeMode and not Variables.ShotgunFire and not Variables.PredictMode then
                                                        for i,v in pairs(Players:GetPlayers()) do
                                                            if v:FindFirstChild("Backpack") and v.Backpack:FindFirstChild("Shuriken") then
                                                                for i,v in pairs(v.Backpack:GetChildren()) do
                                                                    if v.Name == "Shuriken" and v:FindFirstChild("HitEvent") and WaitVariables[PLACEHOLDER] then
                                                                        v.HitEvent:FireServer(mouse.Hit.p)
                                                                        if Variables.AutoFireWait >= 0 then
                                                                            task.wait(Variables.AutoFireWait)
                                                                        elseif Variables.AutoFireWait == -1 then
                                                                            if WaitValue >= 3 then
                                                                                WaitValue = 0
                                                                            end
                                                                            WaitValue = WaitValue + 1
                                                                            WaitTable[WaitValue]:Wait()
                                                                        end
                                                                    end
                                                                end
                                                            end
                                                            if v.Character and v.Character:FindFirstChild("Shuriken") then
                                                                for i,v in pairs(v.Character:GetChildren()) do
                                                                    if v.Name == "Shuriken" and v:FindFirstChild("HitEvent") and WaitVariables[PLACEHOLDER] then
                                                                        v.HitEvent:FireServer(mouse.Hit.p)
                                                                        if Variables.AutoFireWait >= 0 then
                                                                            task.wait(Variables.AutoFireWait)
                                                                        elseif Variables.AutoFireWait == -1 then
                                                                            if WaitValue >= 3 then
                                                                                WaitValue = 0
                                                                            end
                                                                            WaitValue = WaitValue + 1
                                                                            WaitTable[WaitValue]:Wait()
                                                                        end
                                                                    end
                                                                end
                                                            end
                                                        end
                                                    elseif Variables.ServerShurikens and Variables.AirStrikeMode and not Variables.ShotgunFire and not Variables.PredictMode then
                                                        if Character and Functions.GetRoot(Character) then
                                                            local hrp = Functions.GetRoot(Character)
                                                            for i,v in pairs(Players:GetPlayers()) do
                                                                if v:FindFirstChild("Backpack") and v.Backpack:FindFirstChild("Shuriken") then
                                                                    for i,v in pairs(v.Backpack:GetChildren()) do
                                                                        if v.Name == "Shuriken" and v:FindFirstChild("HitEvent") and WaitVariables[PLACEHOLDER] then
                                                                            v:FindFirstChild("HitEvent"):FireServer(Vector3.new(hrp.Position.X, hrp.Position.Y + 500, hrp.Position.Z))
                                                                            if Variables.AutoFireWait >= 0 then
                                                                                task.wait(Variables.AutoFireWait)
                                                                            elseif Variables.AutoFireWait == -1 then
                                                                                if WaitValue >= 3 then
                                                                                    WaitValue = 0
                                                                                end
                                                                                WaitValue = WaitValue + 1
                                                                                WaitTable[WaitValue]:Wait()
                                                                            end
                                                                        end
                                                                    end
                                                                end
                                                                if v.Character and v.Character:FindFirstChild("Shuriken") then
                                                                    for i,v in pairs(v.Character:GetChildren()) do
                                                                        if v.Name == "Shuriken" and v:FindFirstChild("HitEvent") and WaitVariables[PLACEHOLDER] then
                                                                            v:FindFirstChild("HitEvent"):FireServer(Vector3.new(hrp.Position.X, hrp.Position.Y + 500, hrp.Position.Z))
                                                                            if Variables.AutoFireWait >= 0 then
                                                                                task.wait(Variables.AutoFireWait)
                                                                            elseif Variables.AutoFireWait == -1 then
                                                                                if WaitValue >= 3 then
                                                                                    WaitValue = 0
                                                                                end
                                                                                WaitValue = WaitValue + 1
                                                                                WaitTable[WaitValue]:Wait()
                                                                            end
                                                                        end
                                                                    end
                                                                end
                                                            end
                                                        end
                                                    elseif not Variables.ServerShurikens and Variables.AirStrikeMode and Variables.ShotgunFire and not Variables.PredictMode then
                                                        if Character and Functions.GetRoot(Character) then
                                                            local hrp = Functions.GetRoot(Character)
                                                            if Character:FindFirstChild("Shuriken") then
                                                                for i,v in pairs(Character:GetChildren()) do
                                                                    if v.Name == "Shuriken" and WaitVariables[PLACEHOLDER] then
                                                                        local distanceX = math.random(-100,100)
                                                                        local distanceZ = math.random(-100,100)
                                                                        local resultVector = Vector3.new(hrp.Position.X + distanceX,hrp.Position.Y + Variables.ShotgunFireSpread,hrp.Position.Z + distanceZ)
                                                                        v:FindFirstChild("HitEvent"):FireServer(resultVector)
                                                                    end
                                                                end
                                                            end
                                                            if Variables.OptionalEquip then
                                                                for i,v in pairs(Players.LocalPlayer.Backpack:GetChildren()) do
                                                                    if v.Name == "Shuriken" and WaitVariables[PLACEHOLDER] then
                                                                        local distanceX = math.random(-100,100)
                                                                        local distanceZ = math.random(-100,100)
                                                                        local resultVector = Vector3.new(hrp.Position.X + distanceX,hrp.Position.Y + Variables.ShotgunFireSpread,hrp.Position.Z + distanceZ)
                                                                        v:FindFirstChild("HitEvent"):FireServer(resultVector)
                                                                    end
                                                                end
                                                            end
                                                        end
                                                    elseif not Variables.ServerShurikens and not Variables.AirStrikeMode and Variables.ShotgunFire and not Variables.PredictMode then
                                                        if Character and Functions.GetRoot(Character) then
                                                            local hrp = Functions.GetRoot(Character)
                                                            if Character:FindFirstChild("Shuriken") then
                                                                for i,v in pairs(Character:GetChildren()) do
                                                                    if v.Name == "Shuriken" and WaitVariables[PLACEHOLDER] then
                                                                        local distanceX = math.random(-100,100)
                                                                        local distanceY = math.random(-100,100)
                                                                        local distanceZ = math.random(-100,100)
                                                                        local resultVector = (CFrame.new(hrp.Position,mouse.Hit.p).LookVector * Variables.ShotgunFireSpread) + Vector3.new(distanceX,distanceY,distanceZ)
                                                                        v:FindFirstChild("HitEvent"):FireServer(resultVector)
                                                                    end
                                                                end
                                                            end
                                                            if Variables.OptionalEquip then
                                                                for i,v in pairs(Players.LocalPlayer.Backpack:GetChildren()) do
                                                                    if v.Name == "Shuriken" and WaitVariables[PLACEHOLDER] then
                                                                        local distanceX = math.random(-100,100)
                                                                        local distanceY = math.random(-100,100)
                                                                        local distanceZ = math.random(-100,100)
                                                                        local resultVector = (CFrame.new(hrp.Position,mouse.Hit.p).LookVector * Variables.ShotgunFireSpread) + Vector3.new(distanceX,distanceY,distanceZ)
                                                                        v:FindFirstChild("HitEvent"):FireServer(resultVector)
                                                                    end
                                                                end
                                                            end
                                                        end
                                                    elseif Variables.ServerShurikens and Variables.AirStrikeMode and Variables.ShotgunFire and not Variables.PredictMode then
                                                        if Character and Functions.GetRoot(Character) then
                                                            local hrp = Functions.GetRoot(Character)
                                                            for i,v in pairs(Players:GetPlayers()) do
                                                                if v:FindFirstChild("Backpack") and v.Backpack:FindFirstChild("Shuriken") then
                                                                    for i,v in pairs(v.Backpack:GetChildren()) do
                                                                        if v.Name == "Shuriken" and v:FindFirstChild("HitEvent") and WaitVariables[PLACEHOLDER] then
                                                                            local distanceX = math.random(-100,100)
                                                                            local distanceZ = math.random(-100,100)
                                                                            local resultVector = Vector3.new(hrp.Position.X + distanceX,hrp.Position.Y + Variables.ShotgunFireSpread,hrp.Position.Z + distanceZ)
                                                                            v.HitEvent:FireServer(resultVector)
                                                                            if Variables.AutoFireWait >= 0 then
                                                                                task.wait(Variables.AutoFireWait)
                                                                            elseif Variables.AutoFireWait == -1 then
                                                                                if WaitValue >= 3 then
                                                                                    WaitValue = 0
                                                                                end
                                                                                WaitValue = WaitValue + 1
                                                                                WaitTable[WaitValue]:Wait()
                                                                            end
                                                                        end
                                                                    end
                                                                end
                                                                if v.Character and v.Character:FindFirstChild("Shuriken") then
                                                                    for i,v in pairs(v.Character:GetChildren()) do
                                                                        if v.Name == "Shuriken" and v:FindFirstChild("HitEvent") and WaitVariables[PLACEHOLDER] then
                                                                            local distanceX = math.random(-100,100)
                                                                            local distanceZ = math.random(-100,100)
                                                                            local resultVector = Vector3.new(hrp.Position.X + distanceX,hrp.Position.Y + Variables.ShotgunFireSpread,hrp.Position.Z + distanceZ)
                                                                            v.HitEvent:FireServer(resultVector)
                                                                            if Variables.AutoFireWait >= 0 then
                                                                                task.wait(Variables.AutoFireWait)
                                                                            elseif Variables.AutoFireWait == -1 then
                                                                                if WaitValue >= 3 then
                                                                                    WaitValue = 0
                                                                                end
                                                                                WaitValue = WaitValue + 1
                                                                                WaitTable[WaitValue]:Wait()
                                                                            end
                                                                        end
                                                                    end
                                                                end
                                                            end
                                                        end
                                                    elseif Variables.ServerShurikens and not Variables.AirStrikeMode and Variables.ShotgunFire and not Variables.PredictMode then
                                                        if Character and Functions.GetRoot(Character) then
                                                            local hrp = Functions.GetRoot(Character)
                                                            for i,v in pairs(Players:GetPlayers()) do
                                                                if v:FindFirstChild("Backpack") and v.Backpack:FindFirstChild("Shuriken") then
                                                                    for i,v in pairs(v.Backpack:GetChildren()) do
                                                                        if v.Name == "Shuriken" and v:FindFirstChild("HitEvent") and WaitVariables[PLACEHOLDER] then
                                                                            local distanceX = math.random(-100,100)
                                                                            local distanceY = math.random(-100,100)
                                                                            local distanceZ = math.random(-100,100)
                                                                            local resultVector = (CFrame.new(hrp.Position,mouse.Hit.p).LookVector * Variables.ShotgunFireSpread) + Vector3.new(distanceX,distanceY,distanceZ)
                                                                            v.HitEvent:FireServer(resultVector)
                                                                            if Variables.AutoFireWait >= 0 then
                                                                                task.wait(Variables.AutoFireWait)
                                                                            elseif Variables.AutoFireWait == -1 then
                                                                                if WaitValue >= 3 then
                                                                                    WaitValue = 0
                                                                                end
                                                                                WaitValue = WaitValue + 1
                                                                                WaitTable[WaitValue]:Wait()
                                                                            end
                                                                        end
                                                                    end
                                                                end
                                                                if v.Character and v.Character:FindFirstChild("Shuriken") then
                                                                    for i,v in pairs(v.Character:GetChildren()) do
                                                                        if v.Name == "Shuriken" and v:FindFirstChild("HitEvent") and WaitVariables[PLACEHOLDER] then
                                                                            local distanceX = math.random(-100,100)
                                                                            local distanceY = math.random(-100,100)
                                                                            local distanceZ = math.random(-100,100)
                                                                            local resultVector = (CFrame.new(hrp.Position,mouse.Hit.p).LookVector * Variables.ShotgunFireSpread) + Vector3.new(distanceX,distanceY,distanceZ)
                                                                            v.HitEvent:FireServer(resultVector)
                                                                            if Variables.AutoFireWait >= 0 then
                                                                                task.wait(Variables.AutoFireWait)
                                                                            elseif Variables.AutoFireWait == -1 then
                                                                                if WaitValue >= 3 then
                                                                                    WaitValue = 0
                                                                                end
                                                                                WaitValue = WaitValue + 1
                                                                                WaitTable[WaitValue]:Wait()
                                                                            end
                                                                        end
                                                                    end
                                                                end
                                                            end
                                                        end
                                                    elseif Variables.PredictMode then
                                                        if workspace:FindFirstChild("SPEEDPART") then
                                                            if Character and Character:FindFirstChild("Shuriken") then
                                                                for i,v in pairs(Character:GetChildren()) do
                                                                    if v.Name == "Shuriken" then
                                                                        v:FindFirstChild("HitEvent"):FireServer(workspace:FindFirstChild("SPEEDPART").Position)
                                                                        local shur = v
                                                                        if pshurthrown and Character:FindFirstChild("Humanoid") then
                                                                            for i,v in pairs(AllThrowAnimations) do
                                                                                v:Stop()
                                                                            end
                                                                            AllThrowAnimations.ThrowAnim = Character:FindFirstChild("Humanoid"):WaitForChild("Animator"):LoadAnimation(shur:FindFirstChild("LocalScript"):FindFirstChild("ThrowAnim"))
                                                                            AllThrowAnimations.ThrowAnim:Play()
                                                                            pshurthrown = false
                                                                        end
                                                                    end
                                                                end
                                                            end
                                                        end
                                                    end
                                                end
                                                if Variables.AutoFireFinishWait >= 0 then
                                                    task.wait(Variables.AutoFireFinishWait)
                                                elseif Variables.AutoFireFinishWait <= -1 then
                                                    if WaitValue >= 3 then
                                                        WaitValue = 0
                                                    end
                                                    WaitValue = WaitValue + 1
                                                    WaitTable[WaitValue]:Wait()
                                                end
                                            end
                                        end)
                                    end
                                end
                            else return end
                        end
                    end
                end

                Functions.UserInputEnded.HoldClick = function(input,processed)
                    if not processed then
                        if input.UserInputType == Enum.UserInputType.MouseButton1 then
                            for i,v in pairs(WaitVariables) do
                                if v then
                                    WaitVariables[i] = false
                                end
                            end
                        end
                    end
                end
            else
                pcall(function()
                    Variables.HoldClick = false
                    Functions.UserInputBegan.HoldClick = nil
                    Functions.UserInputEnded.HoldClick = nil
                    if Character then
                        for i,v in pairs(Character:GetChildren()) do
                            if v.Name == "Shuriken" then
                                if v.Enabled == false then v.Enabled = true end
                            end
                        end
                    end
                    for i,v in pairs(Players.LocalPlayer.Backpack) do
                        if v.Name == "Shuriken" then
                            if v.Enabled == false then v.Enabled = true end
                        end
                    end
                end)
            end
        end
    })

    CombatToggles:AddToggle("PunishPlayers",{
        Title = "Punish Players";
        Description = "If a player has negative ninjutsu, this will kill everyone in the server until that player leaves the game. This excludes the whitelist.";
        Default = false;
        Callback = function(state)
            if state then
                Variables.PunishingPlayers = true
                coroutine.resume(coroutine.create(function()
                    local punishing = false
                    while Variables.PunishPlayers do
                        for i,v in pairs(Players:GetPlayers()) do
                            if not punishing and v:FindFirstChild("leaderstats") and v.leaderstats:FindFirstChild("Ninjutsu") and not Functions.ListFind("Whitelist",v.Name) then
                                if v.leaderstats.Ninjutsu.Value < 0 then
                                    punishing = true
                                    if not Functions.ListFind("Targetlist",v.Name,"Normal") then
                                        Functions.ListInsert("Targetlist",v.Name,"Normal")
                                    end
                                    Functions.CreateLogLabel("Combat", "Negative Nin", "Added "..v.Name.." to the Normal Targetlist and starting negative nin punishment..")
                                    local playerDeservingPunishment = v
                                    local punishedPlayers = {}
                                    for i,v in pairs(Players:GetPlayers()) do
                                        if v ~= playerDeservingPunishment and not Functions.ListFind("Targetlist",v.Name,"Normal") and not Functions.ListFind("Whitelist",v.Name) then
                                            Functions.ListInsert("Targetlist",v.Name,"Normal")
                                            table.insert(punishedPlayers,v.Name)
                                        end
                                    end
                                    Functions.PlayerAdded['NegativeNinEmergency'..v.Name] = function(v)
                                        if v ~= playerDeservingPunishment and not Functions.ListFind("Targetlist",v.Name,"Normal") and not Functions.ListFind("Whitelist",v.Name) then
                                            Functions.ListInsert("Targetlist",v.Name,"Normal")
                                            table.insert(punishedPlayers,v.Name)
                                        end
                                    end
                                    Functions.PlayerRemoved['NegativeNinEmergency'..v.Name] = function(v)
                                        if v ~= playerDeservingPunishment and not Functions.ListFind("Targetlist",v.Name,"Normal") and not Functions.ListFind("Whitelist",v.Name) then
                                            Functions.ListRemove("Targetlist",v.Name,"Normal")
                                            table.remove(punishedPlayers,v.Name)
                                        elseif v == playerDeservingPunishment then
                                            Functions.PlayerAdded['NegativeNinEmergency'..v.Name] = nil
                                            Functions.PlayerRemoved['NegativeNinEmergency'..v.Name] = nil
                                            for i,v in pairs(punishedPlayers) do
                                                if Functions.ListFind("Targetlist",v,"Normal") then
                                                    Functions.ListRemove("Targetlist",v,"Normal")
                                                end
                                            end
                                            punishing = false
                                        end
                                    end
                                end
                            end
                        end
                        task.wait(0.1)
                    end
                end))
            else
                Variables.PunishingPlayers = false
            end
        end
    })

    CombatToggles:AddToggle("PunishWL",{
        Title = "Punish Whitelist";
        Description = "If a whitelisted player has negative ninjutsu, this will kill everyone in the server until that player leaves the game.";
        Default = false;
        Callback = function(state)
            if state then
                Variables.PunishWL = true
                coroutine.resume(coroutine.create(function()
                    local punishing = false
                    while Variables.PunishWL do
                        for i,v in pairs(Players:GetPlayers()) do
                            if not punishing and v:FindFirstChild("leaderstats") and v.leaderstats:FindFirstChild("Ninjutsu") and Functions.ListFind("Whitelist",v.Name) then
                                if v.leaderstats.Ninjutsu.Value < 0 then
                                    punishing = true
                                    if not table.find(WLPunishment,v.Name) then
                                        table.insert(WLPunishment,v.Name)
                                        Functions.PlayerRemoved.WLPunishment = function(plr)
                                            if table.find(WLPunishment,plr.Name) then
                                                table.remove(WLPunishment,table.find(WLPunishment,plr.Name))
                                                Functions.PlayerRemoved.WLPunishment = nil
                                            end
                                        end
                                    end
                                    if not Functions.ListFind("Targetlist",v.Name,"Semi") then
                                        Functions.ListInsert("Targetlist",v.Name,"Semi")
                                    end
                                    Functions.CreateLogLabel("Combat", "WL Negative Nin", "Added "..v.Name.." to the Semi Targetlist and starting negative nin punishment..")
                                    local playerDeservingPunishment = v
                                    local punishedPlayers = {}
                                    for i,v in pairs(Players:GetPlayers()) do
                                        if v ~= playerDeservingPunishment and not Functions.ListFind("Targetlist",v.Name,"Normal") and not Functions.ListFind("Whitelist",v.Name) then
                                            Functions.ListInsert("Targetlist",v.Name,"Normal")
                                            table.insert(punishedPlayers,v.Name)
                                        end
                                    end
                                    Functions.PlayerAdded['NegativeNinEmergency'..v.Name] = function(v)
                                        if v ~= playerDeservingPunishment and not Functions.ListFind("Targetlist",v.Name,"Normal") and not Functions.ListFind("Whitelist",v.Name) then
                                            Functions.ListInsert("Targetlist",v.Name,"Normal")
                                            table.insert(punishedPlayers,v.Name)
                                        end
                                    end
                                    Functions.PlayerRemoved['NegativeNinEmergency'..v.Name] = function(v)
                                        if v ~= playerDeservingPunishment and not Functions.ListFind("Targetlist",v.Name,"Normal") and not Functions.ListFind("Whitelist",v.Name) then
                                            Functions.ListRemove("Targetlist",v.Name,"Normal")
                                            table.remove(punishedPlayers,v.Name)
                                        elseif v == playerDeservingPunishment then
                                            Functions.PlayerAdded['NegativeNinEmergency'..v.Name] = nil
                                            Functions.PlayerRemoved['NegativeNinEmergency'..v.Name] = nil
                                            for i,v in pairs(punishedPlayers) do
                                                if Functions.ListFind("Targetlist",v,"Normal") then
                                                    Functions.ListRemove("Targetlist",v,"Normal")
                                                end
                                            end
                                            punishing = false
                                        end
                                    end
                                end
                            end
                        end
                        task.wait(0.1)
                    end
                end))
            else
                Variables.PunishWL = false
            end
        end
    })

    local CombatSettings = Tabs.Combat:AddSection("Settings")

    CombatSettings:AddDropdown("AutoTargetMode",{
        Title = "Auto Target Mode";
        Description = "Mode that Auto Target uses.";
        Values = Tables.Settings.Modes;
        Multi = false;
        Default = "Soft";
    })

    CombatSettings:AddDropdown("AutoBreakShurikensMode",{
        Title = "Auto Break Shurikens Mode";
        Description = "Mode that ABS uses.";
        Values = Tables.Settings.Modes;
        Multi = false;
        Default = "Soft";
    })

    CombatSettings:AddDropdown("HoldClickMode",{
        Title = "Hold Click Mode";
        Description = "Mode that hold click uses.";
        Values = Tables.Settings.Tools;
        Multi = true;
        Default = {};
    })

    CombatSettings:AddDropdown("AimPart",{
        Title = "Aim Part";
        Description = "Configure the aim part.";
        Values = Tables.Settings.BodyParts;
        Multi = false;
        Default = "Head";
    })

    CombatSettings:AddDropdown("HitEventWeapon",{
        Title = "Hit Event Weapon";
        Description = "Configure hit event weapon.";
        Values = Tables.Settings.Weapons;
        Multi = true;
        Default = {};
    })

    CombatSettings:AddDropdown("AutoEquipWeapon",{
        Title = "Auto Equip Weapon";
        Description = "Auto equip a weapon.";
        Values = Tables.Settings.Weapons;
        Multi = true;
        Default = {};
    })

    Options.AutoTargetMode:OnChanged(function(Value)
        for i,_ in pairs(Tables.Settings.AutoTargetMode) do
            Tables.Settings.AutoTargetMode[i] = false
        end
        Tables.Settings.AutoTargetMode[Value] = true
    end)

    Options.AutoBreakShurikensMode:OnChanged(function(Value)
        for i,_ in pairs(Tables.Settings.AutoBreakShurikensMode) do
            Tables.Settings.AutoBreakShurikensMode[i] = false
        end
        Tables.Settings.AutoBreakShurikensMode[Value] = true
    end)

    Options.HoldClickMode:OnChanged(function(Values)
        for i,v in pairs(Tables.Settings.HoldClickMode) do
            if Values[i] then
                Tables.Settings.HoldClickMode[i] = true
            else
                Tables.Settings.HoldClickMode[i] = false
            end
        end
    end)

    Options.AimPart:OnChanged(function(Value)
        Variables.AimPart = Value
    end)

    Options.HitEventWeapon:OnChanged(function(Values)
        for i,v in pairs(Tables.Settings.HitEventWeapons) do
            if Values[i] then
                Tables.Settings.HitEventWeapons[i] = true
            else
                Tables.Settings.HitEventWeapons[i] = false
            end
        end
    end)

    Options.AutoEquipWeapon:OnChanged(function(Values)
        for i,v in pairs(Tables.Settings.AutoEquipWeapons) do
            if Values[i] then
                Tables.Settings.AutoEquipWeapons[i] = true
            else
                Tables.Settings.AutoEquipWeapons[i] = false
            end
        end
    end)

    CombatSettings:AddToggle("AirStrikeMode",{
        Title = "Airstrike Mode";
        Description = "Enables airstrike mode. This forces shurikens to go up into the air and rain down on players when shot.";
        Default = false;
        Callback = function(state)
            if state then
                Variables.AirStrikeMode = true
            else
                Variables.AirStrikeMode = false
            end
        end;
    })

    CombatSettings:AddToggle("TeleportShuriken",{
        Title = "Teleport Shuriken";
        Description = "Skips moving the shuriken to the player's hitpart and instead teleports it directly to them.";
        Default = false;
        Callback = function(state)
            if state then
                Variables.TeleportShuriken = true
            else
                Variables.TeleportShuriken = false
            end
        end;
    })

    CombatSettings:AddToggle("OptionalShurikenEquip",{
        Title = "Optional Shuriken Equip";
        Description = "Makes it so equipping a shuriken is optional with auto fire. Meaning it will fire at people even if you don't have a shuriken equipped.";
        Default = false;
        Callback = function(state)
            if state then
                Variables.OptionalEquip = true
            else
                Variables.OptionalEquip = false
            end
        end;
    })

    CombatSettings:AddToggle("UseServerShurikens",{
        Title = "Use Server Shurikens";
        Description = "Uses the whole server's shurikens when firing. They all do your damage still.";
        Default = false;
        Callback = function(state)
            if state then
                Variables.ServerShurikens = true
            else
                Variables.ServerShurikens = false
            end
        end
    })

    CombatSettings:AddToggle("PlayerShurikenCheck",{
        Title = "Player Shuriken Check";
        Description = "Checks for the shuriken of the player that you are shooting and doesn't use it because it would do your damage to you.";
        Default = false;
        Callback = function(state)
            if state then
                Variables.PlayerShurikenCheck = true
            else
                Variables.PlayerShurikenCheck = false
            end
        end
    })

    CombatSettings:AddToggle("ShotgunFire",{
        Title = "Shotgun Fire";
        Description = "Enables a shotgun-like spread for shurikens. Useful for when players are running away.";
        Default = false;
        Callback = function(state)
            if state then
                Variables.ShotgunFire = true
            else
                Variables.ShotgunFire = false
            end
        end
    })

    CombatSettings:AddToggle("FireOnGodMode",{
        Title = "Fire On Godded Players";
        Description = "Allows auto fire and silent aim to fire shurikens even when the player it's firing at is godded.";
        Default = false;
        Callback = function(state)
            if state then
                Variables.FireOnGodMode = true
            else
                Variables.FireOnGodMode = false
            end
        end
    })

    CombatSettings:AddToggle("AltAutoBubble",{
        Title = "Alternate Auto Bubble";
        Description = "Alternate mode of auto bubble that allows you to take weapons out.";
        Default = false;
        Callback = function(state)
            if state then
                Variables.AltAutoBubble = true
            else
                Variables.AltAutoBubble = false
            end
        end
    })

    CombatSettings:AddInput("AirStrikeDistance",{
        Title = "Air Strike Distance";
        Description = "Congifure air strike distance.";
        Default = Variables.AirStrikeDistance;
        Placeholder = "Enter a number..";
        Numeric = true;
        Finished = true;
        Callback = function(Value)
            Variables.AirStrikeDistance = tonumber(Value)
        end;
    })

    CombatSettings:AddInput("ShotgunFireSpread",{
        Title = "Shotgun Fire Spread";
        Description = "Configure shotgun fire spread.";
        Default = Variables.ShotgunFireSpread;
        Placeholder = "Enter a number..";
        Numeric = true;
        Finished = true;
        Callback = function(Value)
            Variables.ShotgunFireSpread = tonumber(Value)
        end;
    })

    CombatSettings:AddInput("LoopbringDistance",{
        Title = "Loop Bring Distance";
        Description = "Configure loop bring distance.";
        Default = Variables.loopBringDistance;
        Placeholder = "Enter a number..";
        Numeric = true;
        Finished = true;
        Callback = function(Value)
            Variables.loopBringDistance = tonumber(Value)
        end;
    })

    CombatSettings:AddInput("SaviorPercent",{
        Title = "Savior Health Percent";
        Description = "Configure savior percent";
        Default = Variables.SaviorPercent;
        Placeholder = "Enter a number..";
        Numeric = true;
        Finished = true;
        Callback = function(Value)
            Variables.SaviorPercent = tonumber(Value)
        end
    })

    CombatSettings:AddInput("PredictModeOffset",{
        Title = "Predict Mode Offset";
        Description = "Configure predict mode offset";
        Default = Variables.PredictModeOffset;
        Placeholder = "Enter a number..";
        Numeric = true;
        Finished = true;
        Callback = function(Value)
            Variables.PredictModeOffset = tonumber(Value)
        end;
    })

    CombatSettings:AddInput("AutoFireWait",{
        Title = "Auto Fire Wait";
        Description = "Configure fire wait time";
        Default = Variables.AutoFireWait;
        Placeholder = "Enter a number..";
        Numeric = true;
        Finished = true;
        Callback = function(Value)
            Variables.AutoFireWait = tonumber(Value)
        end
    })

    CombatSettings:AddInput("AutoFireFinishWait",{
        Title = "Auto Fire Finish Wait";
        Description = "Configure wait time at finish";
        Default = Variables.AutoFireFinishWait;
        Placeholder = "Enter a number..";
        Numeric = true;
        Finished = true;
        Callback = function(Value)
            Variables.AutoFireFinishWait = tonumber(Value)
        end;
    })

    CombatSettings:AddInput("HitEventWait",{
        Title = "Hit Event Wait";
        Description = "Configure hit event wait";
        Default = Variables.HitEventWait;
        Placeholder = "Enter a number..";
        Numeric = true;
        Finished = true;
        Callback = function(Value)
            Variables.HitEventWait = tonumber(Value)
        end;
    })

    CombatSettings:AddInput("HitEventFinishWait",{
        Title = "Hit Event Finish Wait";
        Description = "Configure hit event finish wait";
        Default = Variables.HitEventFinishWait;
        Placeholder = "Enter a number..";
        Numeric = true;
        Finished = true;
        Callback = function(Value)
            Variables.HitEventFinishWait = tonumber(Value)
        end;
    })


    -- // Players Tab


    local PlayersDropdowns = Tabs.Players:AddSection("Dropdowns")

    PlayersDropdowns:AddDropdown("PlayerList",{
        Title = "Player List";
        Values = Functions.PlayersToStrings(Players:GetPlayers());
        Multi = true;
        Default = Tables.ESPTables.SelectedPlayers;
    })

    Options.PlayerList:OnChanged(function(Values)
        for _,v in pairs(Players:GetPlayers()) do
            if not Values[v.Name] and Tables.ESPTables.SelectedPlayers[v.Name] then
                Tables.ESPTables.SelectedPlayers[v.Name] = nil
            end
        end
        for Value, State in pairs(Values) do
            if not Tables.ESPTables.SelectedPlayers[Value] then
                Tables.ESPTables.SelectedPlayers[Value] = true
                if Players:FindFirstChild(Value) then
                    Functions.AddPlayerVanities(Players:FindFirstChild(Value),true)
                end
            end
        end
    end)

    PlayersDropdowns:AddToggle("AddAllPlayers",{
        Title = "Add All Players";
        Default = false;
        Callback = function(state)
            if state then
                for i,v in pairs(Players:GetPlayers()) do
                    Tables.ESPTables.SelectedPlayers[v.Name] = true
                    Functions.AddPlayerVanities(v)
                end
                Functions.PlayerAdded.AddAllPlayers = function(player)
                    Tables.ESPTables.SelectedPlayers[player.Name] = true
                end
                Functions.PlayerRemoved.AddAllPlayers = function(player)
                    Tables.ESPTables.SelectedPlayers[player.Name] = nil
                end
            else
                pcall(function()
                    Functions.PlayerAdded.AddAllPlayers = nil
                    Functions.PlayerRemoved.AddAllPlayers = nil
                end)
            end
        end
    })

    PlayersDropdowns:AddButton({
        Title = "Remove All Players";
        Callback = function()
            for i,v in pairs(Players:GetPlayers()) do
                Tables.ESPTables.SelectedPlayers[v.Name] = nil
                Functions.RemovePlayerVanities(v)
            end
        end
    })

    PlayersDropdowns:AddButton({
        Title = "Refresh Player List";
        Callback = function()
            Options.PlayerList:SetValues(Functions.PlayersToStrings(Players:GetPlayers()))
            Options.PlayerList:SetValue(Tables.ESPTables.SelectedPlayers)
        end
    })

    local PlayersToggles = Tabs.Players:AddSection("Toggles")

    PlayersToggles:AddToggle("ESP",{
        Title = "ESP";
        Description = "Displays a player's name and certain info about the player above their head.";
        Default = false;
        Callback = function(state)
            if state then
                Variables.ESP = true
                for i,_ in pairs(Tables.ESPTables.SelectedPlayers) do
                    if Players:FindFirstChild(i) then
                        Functions.ESP(Players:FindFirstChild(i))
                    else
                        Tables.ESPTables.SelectedPlayers[i] = nil
                    end
                end
            else
                pcall(function()
                    Variables.ESP = false
                    for _,c in pairs(CoreGui:GetChildren()) do
                        if string.sub(c.Name, -4) == '_ESP' then
                            c:Destroy()
                        end
                    end
                end)
            end
        end
    })

    PlayersToggles:AddToggle("Chams",{
        Title = "Chams";
        Description = "Displays where players are using your preferred method of chams. Default is BoxHandleAdornment.";
        Default = false;
        Callback = function(state)
            if state then
                Variables.Chams = true
                for i,_ in pairs(Tables.ESPTables.SelectedPlayers) do
                    if Players:FindFirstChild(i) then
                        Functions.Chams(Players:FindFirstChild(i))
                    else
                        Tables.ESPTables.SelectedPlayers[i] = nil
                    end
                end
            else
                pcall(function()
                    Variables.Chams = false
                    for _,c in pairs(CoreGui:GetChildren()) do
                        if string.sub(c.Name, -5) == '_CHMS' then
                            c:Destroy()
                        end
                    end
                end)
            end
        end
    })

    PlayersToggles:AddToggle("WeaponESP",{
        Title = "Weapon ESP";
        Description = "Displays a player's weapon names when they take them out.";
        Default = false;
        Callback = function(state)
            if state then
                Variables.WeaponESP = true
                for i,_ in pairs(Tables.ESPTables.SelectedPlayers) do
                    if Players:FindFirstChild(i) then
                        Functions.WeaponESP(Players:FindFirstChild(i))
                    else
                        Tables.ESPTables.SelectedPlayers[i] = nil
                    end
                end
                Functions.WorkspaceDescendantAdded.WeaponESP = function(child)
                    if not child:FindFirstChild("WeaponESP") and (((child.Name == "Shuriken" or child.Name == "Sword") and child:IsA("Tool") and Tables.ESPTables.SelectedPlayers[child.Parent.Name] and child.Parent.Name ~= Players.LocalPlayer.Name) or (child.Name == "ThrownKunai" and Tables.ESPTables.SelectedPlayers[child:WaitForChild("creator").Value.Name] and child:WaitForChild("creator").Value ~= Players.LocalPlayer)) then
                        local function GetColorFromName(name)
                            if child.Name == "Sword" then
                                return Color3.fromRGB(255, 167, 25)
                            else
                                return Color3.fromRGB(255, 0, 0)
                            end
                        end
                        local BillboardGui = Instance.new("BillboardGui")
                        local TextLabel = Instance.new("TextLabel")
                        if child:IsA("Tool") then
                            BillboardGui.Adornee = child:FindFirstChild("Handle")
                        else
                            BillboardGui.Adornee = child
                        end
                        BillboardGui.Parent = child
                        BillboardGui.Size = UDim2.new(0, 100, 0, 150)
                        BillboardGui.StudsOffset = Vector3.new(0, 1, 0)
                        BillboardGui.AlwaysOnTop = true
                        BillboardGui.Name = "WeaponESP"
                        TextLabel.Parent = BillboardGui
                        TextLabel.BackgroundTransparency = 1
                        TextLabel.Position = UDim2.new(0, 0, 0, -50)
                        TextLabel.Size = UDim2.new(0, 100, 0, 100)
                        TextLabel.Font = Enum.Font.SourceSansSemibold
                        TextLabel.TextSize = 15
                        TextLabel.TextColor3 = GetColorFromName(child.Name)
                        TextLabel.TextStrokeTransparency = 0
                        TextLabel.TextYAlignment = Enum.TextYAlignment.Bottom
                        TextLabel.Text = child.Name
                        TextLabel.ZIndex = 10
                        TextLabel.Visible = true
                    end
                end
                Functions.WorkspaceDescendantRemoved.WeaponESP = function(child)
                    if ((child.Name == "Shuriken" or child.Name == "Sword") and child:IsA("Tool") and Tables.ESPTables.SelectedPlayers[child.Parent.Name] and child.Parent.Name ~= Players.LocalPlayer.Name) or (child.Name == "ThrownKunai" and Tables.ESPTables.SelectedPlayers[child:WaitForChild("creator").Value] and child:WaitForChild("creator").Value ~= Players.LocalPlayer) then
                        if child:FindFirstChildOfClass("BillboardGui") then
                            child:FindFirstChildOfClass("BillboardGui"):Destroy()
                        end
                    end
                end
            else
                pcall(function()
                    Variables.WeaponESP = false
                    Functions.WorkspaceDescendantAdded.WeaponESP = nil
                    Functions.WorkspaceDescendantRemoved.WeaponESP = nil
                    for i,_ in pairs(Tables.ESPTables.SelectedPlayers) do
                        if Players:FindFirstChild(i) and Players:FindFirstChild(i).Character then
                            for i,v in pairs(Players:FindFirstChild(i).Character:GetChildren()) do
                                if v:FindFirstChild("WeaponESP") then
                                    v:FindFirstChild("WeaponESP"):Destroy()
                                end
                            end
                        end
                    end
                end)
            end
        end
    })

    PlayersToggles:AddToggle("WeaponChams",{
        Title = "Weapon Chams";
        Description = "Displays a player's weapon via box handle adornment when they take their weapons out.";
        Default = false;
        Callback = function(state)
            if state then
                Variables.WeaponChams = true
                for i,_ in pairs(Tables.ESPTables.SelectedPlayers) do
                    if Players:FindFirstChild(i) then
                        Functions.WeaponChams(Players:FindFirstChild(i))
                    else
                        Tables.ESPTables.SelectedPlayers[i] = nil
                    end
                end
                Functions.WorkspaceDescendantAdded.WeaponChams = function(child)
                    if not child:FindFirstChild("WeaponChams") and (((child.Name == "Shuriken" or child.Name == "Sword") and child:IsA("Tool") and Tables.ESPTables.SelectedPlayers[child.Parent.Name] and child.Parent.Name ~= Players.LocalPlayer.Name) or (child.Name == "ThrownKunai" and Tables.ESPTables.SelectedPlayers[child:WaitForChild("creator").Value.Name] and child:WaitForChild("creator").Value ~= Players.LocalPlayer)) then
                        local function GetColorFromName(name)
                            if child.Name == "Sword" then
                                return Color3.fromRGB(255, 167, 25)
                            else
                                return Color3.fromRGB(255, 0, 0)
                            end
                        end
                        local a = Instance.new("BoxHandleAdornment")
                        a.Name = "WeaponChams"
                        a.Parent = child
                        if child:IsA("Tool") then
                            if child.Name == "Sword" then
                                a.Adornee = child:FindFirstChild("Handle")
                                a.Size = child:FindFirstChild("Handle").Size
                            else
                                a.Adornee = child:FindFirstChild("Handle")
                                a.Size = Vector3.new(1.5,0.5,1.5)
                            end
                        else
                            a.Adornee = child
                            a.Size = Vector3.new(1.5,0.5,1.5)
                        end
                        a.AlwaysOnTop = true
                        a.ZIndex = 10
                        a.Transparency = 0.3
                        a.Color3 = GetColorFromName(child.Name)
                        a.Visible = true
                    end
                end
                Functions.WorkspaceDescendantRemoved.WeaponChams = function(child)
                    if ((child.Name == "Shuriken" or child.Name == "Sword") and child:IsA("Tool") and Tables.ESPTables.SelectedPlayers[child.Parent.Name] and child.Parent.Name ~= Players.LocalPlayer.Name) or (child.Name == "ThrownKunai" and Tables.ESPTables.SelectedPlayers[child:WaitForChild("creator").Value] and child:WaitForChild("creator").Value ~= Players.LocalPlayer) then
                        if child:FindFirstChildOfClass("BoxHandleAdornment") then
                            child:FindFirstChildOfClass("BoxHandleAdornment"):Destroy()
                        end
                    end
                end
            else
                pcall(function()
                    Variables.WeaponChams = false
                    Functions.WorkspaceDescendantAdded.WeaponChams = nil
                    Functions.WorkspaceDescendantRemoved.WeaponChams = nil
                    for i,_ in pairs(Tables.ESPTables.SelectedPlayers) do
                        if Players:FindFirstChild(i) and Players:FindFirstChild(i).Character then
                            for i,v in pairs(Players:FindFirstChild(i).Character:GetChildren()) do
                                if v:FindFirstChild("WeaponChams") then
                                    v:FindFirstChild("WeaponChams"):Destroy()
                                end
                            end
                        end
                    end
                end)
            end
        end;
    })

    local PlayersSettings = Tabs.Players:AddSection("Settings")

    PlayersSettings:AddDropdown("ESPSettings",{
        Title = "ESP Settings";
        Description = "Settings for ESP";
        Values = Tables.Settings.ESPText;
        Multi = true;
        Default = {};
    })

    Options.ESPSettings:OnChanged(function(Values)
        for i,v in pairs(Tables.Settings.ESPSettings) do
            if Values[i] then
                Tables.Settings.ESPSettings[i] = true
            else
                Tables.Settings.ESPSettings[i] = false
            end
        end
    end)


    -- // Cosmetics Tab


    Tabs.Cosmetics:AddDropdown("RainbowCosmeticSelection",{
        Title = "Rainbow Cosmetic Selection";
        Values = {"Clothing", "Shuriken", "Sword"};
        Multi = true;
        Default = {};
    })

    Tabs.Cosmetics:AddDropdown("RainbowMode",{
        Title = "Rainbow Mode";
        Values = {"Normal", "Random"};
        Multi = false;
        Default = Variables.RainbowMode;
    })

    Options.RainbowCosmeticSelection:OnChanged(function(Values)
        for i,v in pairs(Tables.Settings.RainbowCosmeticSelection) do
            if Values[i] then
                Tables.Settings.RainbowCosmeticSelection[i] = true
                Variables.RainbowTableChanged = true
            else
                Tables.Settings.RainbowCosmeticSelection[i] = false
            end
        end
    end)

    Options.RainbowMode:OnChanged(function(Value)
        Variables.RainbowMode = Value
    end)

    Tabs.Cosmetics:AddToggle("Rainbow",{
        Title = "Rainbow";
        Default = false;
        Callback = function(state)
            if state then
                Variables.Rainbow = true
                task.spawn(function()
                    Variables.RainbowTableChanged = true
                    local History = {
                        Clothing = {};
                        Shuriken = {};
                        Sword = {};
                    }
                    local CloneTable = {
                        Clothing = {};
                        Shuriken = {};
                        Sword = {};
                    }
                    local RunTable = {
                        Clothing = false;
                        Shuriken = false;
                        Sword = false;
                    }
                    local WaitTable = {game:GetService("RunService").Stepped, game:GetService("RunService").Heartbeat, game:GetService("RunService").RenderStepped}
                    local WaitValue = 0
                    local function Rate()
                        if Variables.RainbowRate >= 0 then
                            task.wait(Variables.RainbowRate)
                        elseif Variables.RainbowRate == -1 then
                            if WaitValue >= 3 then
                                WaitValue = 0
                            end
                            WaitValue = WaitValue + 1
                            WaitTable[WaitValue]:Wait()
                        end
                    end
                    local function EndRate()
                        if Variables.RainbowFinishRate >= 0 then
                            task.wait(Variables.RainbowFinishRate)
                        else
                            if WaitValue >= 3 then
                                WaitValue = 0
                            end
                            WaitValue = WaitValue + 1
                            WaitTable[WaitValue]:Wait()
                        end
                    end
                    local function UpdateCloneTable()
                        for n,t in pairs(Tables.Settings.RainbowCosmeticSelection) do
                            if t then
                                table.clear(CloneTable[n])
                                for i,v in ipairs(Tables.Settings[n]) do
                                    if Tables.Settings["Selected"..n][v] then
                                        table.insert(CloneTable[n], v)
                                    end
                                end
                            end
                        end
                    end
                    local function UpdateHistory(n)
                        for _,v in pairs(CloneTable[n]) do
                            table.insert(History[n],v)
                        end
                    end
                    local function ResetHistory()
                        for i,_ in pairs(History) do
                            table.clear(History[i])
                        end
                    end
                    local function RainbowStep(Mode,n)
                        if Mode == "Normal" then
                            RunTable[n] = true
                            for i,v in ipairs(CloneTable[n]) do
                                if Mode == "Normal" and Variables.Rainbow and not Variables.RainbowTableChanged then
                                    Functions[n.."Change"](v)
                                    Rate()
                                else RunTable[n] = false return end
                            end
                            RunTable[n] = false
                            return
                        elseif Mode == "Random" then
                            RunTable[n] = true
                            UpdateHistory(n)
                            for i = 1, #History[n] do
                                if Mode == "Random" and Variables.Rainbow and not Variables.RainbowTableChanged then
                                    local randomnum = math.random(1,#History[n])
                                    Functions[n.."Change"](History[n][randomnum])
                                    table.remove(History[n],randomnum)
                                    Rate()
                                else RunTable[n] = false ResetHistory() return end
                            end
                            RunTable[n] = false
                            ResetHistory()
                            return
                        end
                    end
                    while Variables.Rainbow do
                        if Variables.RainbowTableChanged then
                            Variables.RainbowTableChanged = false
                            UpdateCloneTable()
                        end
                        for n,t in pairs(Tables.Settings.RainbowCosmeticSelection) do
                            if t and not RunTable[n] then
                                task.spawn(function()
                                    RainbowStep(Variables.RainbowMode, n)
                                end)
                            end
                        end
                        EndRate()
                    end
                    table.clear(History)
                    table.clear(CloneTable)
                    History = nil
                    CloneTable = nil
                end)
            else
                Variables.Rainbow = false
            end
        end
    })

    Tabs.Cosmetics:AddInput("RainbowRate",{
        Title = "Rainbow Rate";
        Default = Variables.RainbowRate;
        Placeholder = "Enter a number..";
        Numeric = true;
        Finished = true;
        Callback = function(Value)
            Variables.RainbowRate = tonumber(Value)
        end
    })

    Tabs.Cosmetics:AddInput("RainbowFinishRate",{
        Title = "Rainbow Finish Rate";
        Default = Variables.RainbowFinishRate;
        Placeholder = "Enter a number..";
        Numeric = true;
        Finished = true;
        Callback = function(Value)
            Variables.RainbowFinishRate = tonumber(Value)
        end
    })

    local function CreateRainbowTab(n)

        local Tab = Tabs.Cosmetics:AddSection(n)

        Tab:AddDropdown(n.."Multilist",{
            Title = n.." Multilist";
            Values = Tables.Settings[n];
            Multi = true;
            Default = Tables.Settings['Selected'..n];
        })
    
        Options[n.."Multilist"]:OnChanged(function(Values)
            for _,v in pairs(Tables.Settings[n]) do
                if not Values[v] and Tables.Settings["Selected"..n][v] then
                    Tables.Settings["Selected"..n][v] = nil
                elseif Values[v] and not Tables.Settings["Selected"..n][v] then
                    Tables.Settings["Selected"..n][v] = true
                    Variables.RainbowTableChanged = true
                end
            end
        end)

        Tab:AddButton({
            Title = "Select All";
            Callback = function()
                for _,v in pairs(Tables.Settings[n]) do
                    Tables.Settings["Selected"..n][v] = true
                end
                Options[n.."Multilist"]:SetValue(Tables.Settings["Selected"..n])
                Variables.RainbowTableChanged = true
            end
        })

        Tab:AddButton({
            Title = "Unselect All";
            Callback = function()
                for _,v in pairs(Tables.Settings[n]) do
                    Tables.Settings["Selected"..n][v] = nil
                end
                Options[n.."Multilist"]:SetValue(Tables.Settings["Selected"..n])
                Variables.RainbowTableChanged = true
            end
        })
    
        local current = ""
    
        Tab:AddDropdown(n.."Selection",{
            Title = n.." Selection";
            Description = "For changing "..n.." once";
            Values = Tables.Settings[n];
            Multi = false;
            Default = current;
        })
    
        Options[n.."Selection"]:OnChanged(function(Value)
            current = Value
        end)
    
        Tab:AddButton({
            Title = "Change Into Selected "..n;
            Description = "Change into the selected "..n.." in the dropdown above.";
            Callback = function()
                Functions[n.."Change"](current)
            end
        })

    end

    CreateRainbowTab("Clothing")
    CreateRainbowTab("Shuriken")
    CreateRainbowTab("Sword")


    -- // Misc Tab


    local MiscButtons = Tabs.Misc:AddSection("Buttons")

    MiscButtons:AddButton({
        Title = "Fake Ip Logger Script";
        Description = "Executes the fake ip logger script so you can troll idiots.";
        Callback = function()
            local ScreenGui = Instance.new("ScreenGui")
            local Frame = Instance.new("ImageLabel")
            local TextLabel = Instance.new("TextLabel")
            local TextLabel_2 = Instance.new("TextLabel")
            local close = Instance.new("TextButton")
            local TextLabel_3 = Instance.new("TextLabel")
            local TextLabel_4 = Instance.new("TextLabel")
            local username = Instance.new("TextBox")
            local snatch = Instance.new("TextButton")
            local TextButton_Roundify_12px = Instance.new("ImageLabel")
            local miscbut = Instance.new("TextButton")
            local MISC = Instance.new("ImageLabel")
            local TextLabel_5 = Instance.new("TextLabel")
            local TextLabel_6 = Instance.new("TextLabel")
            local snatchall = Instance.new("TextButton")
            local TextButton_Roundify_12px_2 = Instance.new("ImageLabel")
            local TextLabel_7 = Instance.new("TextLabel")
            Frame.Draggable = true
            Frame.Active = true
            Frame.Selectable = true
            local sound = Instance.new("Sound")
            sound.Parent = workspace
            sound.SoundId = "rbxassetid://5292029547"
            sound:Play()
            
            --Properties:
            
            ScreenGui.Parent = game.CoreGui
            
            Frame.Name = "Frame"
            Frame.Parent = ScreenGui
            Frame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            Frame.BackgroundTransparency = 1.000
            Frame.Position = UDim2.new(0.152727276, 0, 0.277641267, 0)
            Frame.Size = UDim2.new(0, 0, 0, 0)
            Frame.ZIndex = 3
            Frame.Image = "rbxassetid://3570695787"
            Frame.ImageColor3 = Color3.fromRGB(20, 20, 20)
            Frame.ScaleType = Enum.ScaleType.Slice
            Frame.SliceCenter = Rect.new(100, 100, 100, 100)
            Frame.SliceScale = 0.120
            Frame.ClipsDescendants = true
            
            TextLabel.Parent = Frame
            TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            TextLabel.BackgroundTransparency = 1.000
            TextLabel.Position = UDim2.new(0.026143793, 0, 0.0232558139, 0)
            TextLabel.Size = UDim2.new(0, 22, 0, 24)
            TextLabel.ZIndex = 3
            TextLabel.Font = Enum.Font.SourceSansBold
            TextLabel.Text = "IP"
            TextLabel.TextColor3 = Color3.fromRGB(255, 85, 0)
            TextLabel.TextSize = 25.000
            
            TextLabel_2.Parent = Frame
            TextLabel_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            TextLabel_2.BackgroundTransparency = 1.000
            TextLabel_2.Position = UDim2.new(0.0980392173, 0, 0.0232558139, 0)
            TextLabel_2.Size = UDim2.new(0, 102, 0, 24)
            TextLabel_2.ZIndex = 3
            TextLabel_2.Font = Enum.Font.SourceSansBold
            TextLabel_2.Text = "LOGGER"
            TextLabel_2.TextColor3 = Color3.fromRGB(255, 255, 255)
            TextLabel_2.TextSize = 25.000
            
            close.Name = "close"
            close.Parent = Frame
            close.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            close.BackgroundTransparency = 1.010
            close.Position = UDim2.new(0.934640527, 0, 0.0232558139, 0)
            close.Size = UDim2.new(0, 20, 0, 20)
            close.ZIndex = 3
            close.Font = Enum.Font.SourceSansBold
            close.Text = "X"
            close.TextColor3 = Color3.fromRGB(255, 0, 0)
            close.TextScaled = true
            close.TextSize = 14.000
            close.TextWrapped = true
            
            TextLabel_3.Parent = Frame
            TextLabel_3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            TextLabel_3.BackgroundTransparency = 1.000
            TextLabel_3.Position = UDim2.new(7.4505806e-09, 0, 0.860465109, 0)
            TextLabel_3.Size = UDim2.new(0, 214, 0, 24)
            TextLabel_3.ZIndex = 3
            TextLabel_3.Font = Enum.Font.SourceSansBold
            TextLabel_3.Text = "Gui & Code Remade: fixed#8267"
            TextLabel_3.TextColor3 = Color3.fromRGB(255, 255, 255)
            TextLabel_3.TextSize = 15.000
            
            TextLabel_4.Parent = Frame
            TextLabel_4.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            TextLabel_4.BackgroundTransparency = 1.000
            TextLabel_4.Position = UDim2.new(0, 0, 0.767441869, 0)
            TextLabel_4.Size = UDim2.new(0, 240, 0, 24)
            TextLabel_4.ZIndex = 3
            TextLabel_4.Font = Enum.Font.SourceSansBold
            TextLabel_4.Text = "Gui & Code Revamp: Univrs#7207"
            TextLabel_4.TextColor3 = Color3.fromRGB(255, 255, 255)
            TextLabel_4.TextSize = 15.000
            
            username.Name = "username"
            username.Parent = Frame
            username.BackgroundColor3 = Color3.fromRGB(255, 128, 0)
            username.BackgroundTransparency = 1.000
            username.BorderSizePixel = 0
            username.Position = UDim2.new(0.173202619, 0, 0.313953489, 0)
            username.Size = UDim2.new(0, 200, 0, 24)
            username.ZIndex = 3
            username.Font = Enum.Font.GothamBold
            username.PlaceholderColor3 = Color3.fromRGB(178, 178, 178)
            username.PlaceholderText = "Input User"
            username.Text = ""
            username.TextColor3 = Color3.fromRGB(255, 255, 255)
            username.TextSize = 14.000
            
            snatch.Name = "LogFakeIp"
            snatch.Parent = Frame
            snatch.BackgroundColor3 = Color3.fromRGB(255, 128, 0)
            snatch.BackgroundTransparency = 1.000
            snatch.BorderSizePixel = 0
            snatch.Position = UDim2.new(0.205882356, 0, 0.511627913, 0)
            snatch.Size = UDim2.new(0, 180, 0, 28)
            snatch.ZIndex = 4
            snatch.Font = Enum.Font.SourceSansBold
            snatch.Text = "Take Ip"
            snatch.TextColor3 = Color3.fromRGB(255, 255, 255)
            snatch.TextScaled = true
            snatch.TextSize = 14.000
            snatch.TextWrapped = true
            snatch.MouseButton1Down:connect(function()
            local v = game.Players[username.Text]
            ass = gethiddenproperty or get_hidden_prop
                local Thing = game:GetService("HttpService"):JSONDecode(game:HttpGet("http://country.io/names.json"))
                local ParsedCountry = Thing[ass(v, "CountryRegionCodeReplicate")]
                local SayMessageRequest1 = game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest
            SayMessageRequest1:FireServer(
            v.Name.." - Cracking IP Address...",
            "All"
            )
            wait(2)
            local SayMessageRequest = game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest
            SayMessageRequest:FireServer(
            v.Name.." is from "..tostring(ParsedCountry).." OS: "..v.OsPlatform.." IP: "..math.random(836).."."..math.random(725).."."..math.random(99)..".".."##".." ".."(IP: Successfully Logged)",
            "All"
            )
            wait(0.55)
            local SayMessageRequest2 = game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest
            SayMessageRequest2:FireServer(
            v.Name.."'s Data Has Been Successfully Stolen.",
            "All"
            )
            
            end)
            
            TextButton_Roundify_12px.Name = "TextButton_Roundify_12px"
            TextButton_Roundify_12px.Parent = snatch
            TextButton_Roundify_12px.Active = true
            TextButton_Roundify_12px.AnchorPoint = Vector2.new(0.5, 0.5)
            TextButton_Roundify_12px.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            TextButton_Roundify_12px.BackgroundTransparency = 1.000
            TextButton_Roundify_12px.Position = UDim2.new(0.5, 0, 0.5, 0)
            TextButton_Roundify_12px.Selectable = true
            TextButton_Roundify_12px.Size = UDim2.new(1, 0, 1, 0)
            TextButton_Roundify_12px.ZIndex = 3
            TextButton_Roundify_12px.Image = "rbxassetid://3570695787"
            TextButton_Roundify_12px.ImageColor3 = Color3.fromRGB(255, 128, 0)
            TextButton_Roundify_12px.ScaleType = Enum.ScaleType.Slice
            TextButton_Roundify_12px.SliceCenter = Rect.new(100, 100, 100, 100)
            TextButton_Roundify_12px.SliceScale = 0.120
            
            miscbut.Name = "miscbut"
            miscbut.Parent = Frame
            miscbut.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            miscbut.BackgroundTransparency = 1.010
            miscbut.Position = UDim2.new(0.934640527, 0, 0.883720934, 0)
            miscbut.Size = UDim2.new(0, 20, 0, 20)
            miscbut.ZIndex = 3
            miscbut.Font = Enum.Font.SourceSansBold
            miscbut.Text = ">"
            miscbut.TextColor3 = Color3.fromRGB(255, 255, 255)
            miscbut.TextScaled = true
            miscbut.TextSize = 14.000
            miscbut.TextWrapped = true
            
            MISC.Name = "MISC"
            MISC.Parent = Frame
            MISC.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            MISC.BackgroundTransparency = 1.000
            MISC.Position = UDim2.new(0.0775638819, 0, 0.0725949258, 0)
            MISC.Size = UDim2.new(0, 262, 0, 147)
            MISC.ZIndex = 0
            MISC.Image = "rbxassetid://3570695787"
            MISC.ImageColor3 = Color3.fromRGB(20, 20, 20)
            MISC.ScaleType = Enum.ScaleType.Slice
            MISC.SliceCenter = Rect.new(100, 100, 100, 100)
            MISC.SliceScale = 0.120
            
            TextLabel_5.Parent = MISC
            TextLabel_5.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            TextLabel_5.BackgroundTransparency = 1.000
            TextLabel_5.Position = UDim2.new(0.02614378, 0, 0.0232981984, 0)
            TextLabel_5.Size = UDim2.new(0, 18, 0, 20)
            TextLabel_5.Font = Enum.Font.SourceSansBold
            TextLabel_5.Text = "MI"
            TextLabel_5.TextColor3 = Color3.fromRGB(255, 85, 0)
            TextLabel_5.TextSize = 25.000
            
            TextLabel_6.Parent = MISC
            TextLabel_6.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            TextLabel_6.BackgroundTransparency = 1.000
            TextLabel_6.Position = UDim2.new(0.0980392322, 0, 0.0232981984, 0)
            TextLabel_6.Size = UDim2.new(0, 28, 0, 20)
            TextLabel_6.Font = Enum.Font.SourceSansBold
            TextLabel_6.Text = "SC"
            TextLabel_6.TextColor3 = Color3.fromRGB(255, 255, 255)
            TextLabel_6.TextSize = 25.000
            
            snatchall.Name = "logserver"
            snatchall.Parent = MISC
            snatchall.BackgroundColor3 = Color3.fromRGB(255, 128, 0)
            snatchall.BackgroundTransparency = 1.000
            snatchall.BorderSizePixel = 0
            snatchall.Position = UDim2.new(0.0493937507, 0, 0.703036785, 0)
            snatchall.Size = UDim2.new(0, 236, 0, 23)
            snatchall.ZIndex = 2
            snatchall.Font = Enum.Font.SourceSansBold
            snatchall.Text = "Log Server"
            snatchall.TextColor3 = Color3.fromRGB(255, 255, 255)
            snatchall.TextScaled = true
            snatchall.TextSize = 14.000
            snatchall.TextWrapped = true
            snatchall.MouseButton1Down:connect(function()
            --[[https://v3rmillion.net/showthread.php?tid=1012504, In-Chat Player Real Country Fake IP leaker by kuraga.
            ]]
            -- CREDITS TO kuraga#4659 AND DerzeTT#8830
            ass = gethiddenproperty or get_hidden_prop
            
            for _,v in pairs(game:GetService("Players"):GetPlayers()) do
            if v.Name ~= game:GetService("Players").LocalPlayer.Name then
                local Thing = game:GetService("HttpService"):JSONDecode(game:HttpGet("http://country.io/names.json"))
                local ParsedCountry = Thing[ass(v, "CountryRegionCodeReplicate")]
            local SayMessageRequest = game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest
            SayMessageRequest:FireServer(
            v.Name.." is from "..tostring(ParsedCountry).." OS: "..v.OsPlatform.." IP: "..math.random(728).."."..math.random(326).."."..math.random(99)..".".."##".." ".."(IP: Successfully Logged)",
            "All"
            )
            wait(2)
            end
            end
            for i = 1,5 do
            local SayMessageRequest1 = game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest
            SayMessageRequest1:FireServer(
            "Program Status: Cracking...",
            "All"
            )
            wait(1)
            end
            wait(5)
            local SayMessageRequest2 = game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest
            SayMessageRequest2:FireServer(
            "Program Status: Successfully Stolen Addresses, Data Being Sold To [%Encryped Site%]",
            "All"
            )
            end)
            
            TextButton_Roundify_12px_2.Name = "TextButton_Roundify_12px"
            TextButton_Roundify_12px_2.Parent = snatchall
            TextButton_Roundify_12px_2.Active = true
            TextButton_Roundify_12px_2.AnchorPoint = Vector2.new(0.5, 0.5)
            TextButton_Roundify_12px_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            TextButton_Roundify_12px_2.BackgroundTransparency = 1.000
            TextButton_Roundify_12px_2.Position = UDim2.new(0.5, 0, 0.5, 0)
            TextButton_Roundify_12px_2.Selectable = true
            TextButton_Roundify_12px_2.Size = UDim2.new(1, 0, 1, 0)
            TextButton_Roundify_12px_2.Image = "rbxassetid://3570695787"
            TextButton_Roundify_12px_2.ImageColor3 = Color3.fromRGB(255, 128, 0)
            TextButton_Roundify_12px_2.ScaleType = Enum.ScaleType.Slice
            TextButton_Roundify_12px_2.SliceCenter = Rect.new(100, 100, 100, 100)
            TextButton_Roundify_12px_2.SliceScale = 0.120
            
            TextLabel_7.Parent = MISC
            TextLabel_7.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            TextLabel_7.BackgroundTransparency = 1.000
            TextLabel_7.Position = UDim2.new(0.0980392322, 0, 0.213774383, 0)
            TextLabel_7.Size = UDim2.new(0, 212, 0, 62)
            TextLabel_7.Font = Enum.Font.SourceSansBold
            TextLabel_7.Text = "Holy fuck some people are annoying"
            TextLabel_7.TextColor3 = Color3.fromRGB(255, 255, 255)
            TextLabel_7.TextScaled = true
            TextLabel_7.TextSize = 25.000
            TextLabel_7.TextWrapped = true
            
            -- Scripts:
            
            local function XHSJL_fake_script() -- close.LocalScript 
                local script = Instance.new('LocalScript', close)
            
                close.MouseButton1Down:Connect(function()
                    MISC:TweenPosition(UDim2.new(0.078, 0, 0.073, 0), 'Out', 'Bounce', 0.35)
                        wait(.35)
                    Frame.ClipsDescendants = true
                    Frame:TweenSize(UDim2.new(0,0,0,0), 'Out', 'Linear', .3)
                    wait(.3)
                    ScreenGui:Destroy()
                end)
            end
            coroutine.wrap(XHSJL_fake_script)()
            local function MOOLDA_fake_script() -- miscbut.LocalScript 
                local script = Instance.new('LocalScript', miscbut)
            
                local t = false
                miscbut.MouseButton1Down:Connect(function()
                    if (t == false) then
                        MISC:TweenPosition(UDim2.new(1.051, 0, 0.073, 0), 'Out', 'Bounce', 0.35)
                        wait(.35)
                        t = true
                    elseif (t == true) then
                        MISC:TweenPosition(UDim2.new(0.078, 0, 0.073, 0), 'Out', 'Bounce', 0.35)
                        wait(.35)
                        t = false
                    end
                end)
            end
            coroutine.wrap(MOOLDA_fake_script)()
            Frame:TweenSize(UDim2.new(0, 306, 0, 172), 'Out', 'Linear', 0.3)
            wait(.3)
            Frame.ClipsDescendants = false
        end;
    })

    MiscButtons:AddButton({
        Title = "Fate's Admin";
        Description = "Executes Fate's Admin script. It's similar to Infinite Yield, but diferent commands. Might help if some IY commands don't work.";
        Callback = function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/fatesc/fates-admin/main/main.lua"))()
        end;
    })

    local MiscToggles = Tabs.Misc:AddSection("Toggles")

    MiscToggles:AddToggle("AltBgMusic",{
        Title = "Alternate Background Music";
        Description = "Changes the background music to actual good music.";
        Default = false;
        Callback = function(state)
            if state then
                Variables.AltBgMusic = true
                if not workspace:FindFirstChild("BACKGROUND") then
                    local SOUNDLIST = {'ChineseValentinesDayThemeDay', 'GameAnniversaryThemeNight', 'GaibangClassTheme', 'ChineseValentinesDayThemeNight', 'TaibaiClassTheme', 'ZhenwuClassTheme', 'JiuhuaNight', 'YanyunDay', 'FlowerFestivalTheme', 'Saddle', 'HangzhouNight', 'Rain', 'XuhaiNight', 'HangzhouDay', 'MidAutumnFestivalThemeNight', 'GameAnniversaryThemeDay', 'Ice', 'MidAutumnFestivalTheme', 'QinchuanDay', 'ChineseChars', 'DongyueNight', 'DongyueDay', 'JiangnanDay', 'HangzhouHome', 'MainTheme', 'Time', 'CharacterCreationBGM', 'ChineseValentinesDayTheme', 'ChineseValentinesDayThemeVariation', 'JinghuDay', 'JiuhuaDay', 'OfficialTrailerMusic', 'OpeningAnimationMusic', 'OpeningCutsceneMusic', 'Snow', 'TianxiangClassTheme'}
                    local waitlist = {90,75,60,45,30}
                    local randomtable = {}
                    local sound = Instance.new("Sound",workspace)
                    sound.Volume = 0.5
                    sound.Name = "BACKGROUND"

                    game:GetService("Players").LocalPlayer.LocalSounds.BGSound.Volume = 0

                    while #randomtable ~= #SOUNDLIST do
                        local num = math.random(1,#SOUNDLIST)
                        if not table.find(randomtable,num) then
                            table.insert(randomtable,num) 
                        end
                    end

                    coroutine.resume(coroutine.create(function()
                        while Variables.AltBgMusic do
                            for i,v in ipairs(randomtable) do
                                sound.SoundId = getcustomasset("CustomMusic/"..SOUNDLIST[v]..".mp3")
                                sound:Play()
                                sound.Ended:Wait()
                                task.wait(waitlist[math.random(1,#waitlist)])
                            end
                        end
                    end))
                end
            else
                Variables.AltBgMusic = false
            end
        end;
    })

    MiscToggles:AddToggle("MuteOthersSfx",{
        Title = "Mute Others SFX";
        Description = "{MAY CAUSE A BIT OF LAG} Mutes other player's sound effects in case someone spams them.";
        Default = false;
        Callback = function(state)
            if state then
                for i,v in pairs(game:GetDescendants()) do
                    if v:IsA("Sound") and not v:FindFirstAncestor(Players.LocalPlayer.Name) and v.Name ~= "BACKGROUND" and v.Volume ~= 0 then
                        Tables.Settings.SoundVolumes[v] = v.Volume
                        v.Volume = 0
                    end
                end
                Tables.Settings.Connections.MuteOthersSFX = game.DescendantAdded:Connect(function(v)
                    if v:IsA("Sound") and not v:FindFirstAncestor(Players.LocalPlayer.Name) and v.Name ~= "BACKGROUND" and v.Volume ~= 0 then
                        Tables.Settings.SoundVolumes[v] = v.Volume
                        v.Volume = 0
                    end
                end)
            else
                pcall(function()
                    Tables.Settings.Connections.MuteOthersSFX:Disconnect()
                    for i,v in pairs(game:GetDescendants()) do
                        if v:IsA("Sound") and not v:FindFirstAncestor(Players.LocalPlayer.Name) and v.Name ~= "BACKGROUND" and v.Volume == 0 then
                            v.Volume = Tables.Settings.SoundVolumes[v]
                            Tables.Settings.SoundVolumes[v] = nil
                        end
                    end
                end)
            end
        end;
    })

    MiscToggles:AddToggle("MuteYourSfx",{
        Title = "Mute Your SFX";
        Description = "{MAY CAUSE A BIT OF LAG} Mutes your sound effects in case someone really spams them.";
        Default = false;
        Callback = function(state)
            if state then
                for i,v in pairs(game:GetDescendants()) do
                    if v:IsA("Sound") and v:FindFirstAncestor(Players.LocalPlayer.Name) and v.Name ~= "BACKGROUND" and v.Volume ~= 0 then
                        Tables.Settings.SoundVolumes[v] = v.Volume
                        v.Volume = 0
                    end
                end
                Tables.Settings.Connections.MuteYourSFX = game.DescendantAdded:Connect(function(v)
                    if v:IsA("Sound") and v:FindFirstAncestor(Players.LocalPlayer.Name) and v.Name ~= "BACKGROUND" and v.Volume ~= 0 then
                        Tables.Settings.SoundVolumes[v] = v.Volume
                        v.Volume = 0
                    end
                end)
            else
                pcall(function()
                    Tables.Settings.Connections.MuteYourSFX:Disconnect()
                    for i,v in pairs(game:GetDescendants()) do
                        if v:IsA("Sound") and v:FindFirstAncestor(Players.LocalPlayer.Name) and v.Name ~= "BACKGROUND" and v.Volume == 0 then
                            v.Volume = Tables.Settings.SoundVolumes[v]
                            Tables.Settings.SoundVolumes[v] = nil
                        end
                    end
                end)
            end
        end
    })

end

Functions.InitCmds = function()

    local Instances = {
        CommandGui = Instance.new("ScreenGui");
        CommandBarFrame = Instance.new("Frame");
        CommandBar = Instance.new("TextBox");
        CommandBarCorner = Instance.new("UICorner");
    }

    Instances.CommandGui.Name = "MainGui"
    Instances.CommandGui.Parent = game:GetService("CoreGui")
    Instances.CommandGui.ResetOnSpawn = false
    Instances.CommandGui.ZIndexBehavior = Enum.ZIndexBehavior.Global

    Instances.CommandBarFrame.Name = "CommandBarFrame"
    Instances.CommandBarFrame.Parent = Instances.CommandGui
    Instances.CommandBarFrame.AnchorPoint = Vector2.new(0.5, 0)
    Instances.CommandBarFrame.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    Instances.CommandBarFrame.Position = UDim2.new(0.5, 0, 1, 0)
    Instances.CommandBarFrame.Size = UDim2.new(0.0933617353, 0, 0.0327022374, 0)
    Instances.CommandBarFrame.BackgroundTransparency = 1

    Instances.CommandBar.Name = "CommandBar"
    Instances.CommandBar.Parent = Instances.CommandBarFrame
    Instances.CommandBar.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Instances.CommandBar.BackgroundTransparency = 1.000
    Instances.CommandBar.Size = UDim2.new(1, 0, 1, 0)
    Instances.CommandBar.ClearTextOnFocus = false
    Instances.CommandBar.Font = Enum.Font.Gotham
    Instances.CommandBar.Text = ""
    Instances.CommandBar.TextColor3 = Color3.fromRGB(255, 255, 255)
    Instances.CommandBar.TextScaled = true
    Instances.CommandBar.TextSize = 14.000
    Instances.CommandBar.TextWrapped = true

    Instances.CommandBarCorner.Parent = Instances.CommandBarFrame

    local ws = nil
    if WebSocket then
        local success, err = pcall(function()
            ws = WebSocket.connect(Variables.WebSocketHost)
            ws.OnMessage:Connect(function(msg)
                local socketsplit = msg:split(" ")
                local sender = socketsplit[1]
                local cmdName = socketsplit[2]
                if Tables.Commands[cmdName] then
                    local arguments = {}
                    local stringargs = ""
                    for i = 3, #socketsplit, 1 do
                        table.insert(arguments,socketsplit[i])
                        if i ~= 3 then
                            stringargs = stringargs.." "..socketsplit[i]
                        else
                            stringargs = stringargs..socketsplit[i]
                        end
                    end
                    print("Message received! | SENDER: "..sender.." COMMAND NAME: "..cmdName.." ARGUMENTS: "..stringargs)
                    sender = Players:FindFirstChild(sender)
                    Tables.Commands[cmdName].Function(sender,arguments,stringargs)
                end
            end)
            Functions.PlayerRemoved.WebSocket = function(player)
                if player == Players.LocalPlayer then
                    ws:Close()
                end
            end
        end)
        if not success then
            warn(err)
        end
    end

    local commandbarvisible = false
    local textbox = Instances.CommandBar
    local frame = Instances.CommandBarFrame
    UserInputService.InputBegan:Connect(function(input, processed)
        if not processed and input.KeyCode == Enum.KeyCode.LeftBracket then
            if commandbarvisible == false then
                Functions.CreateTween(frame,TweenInfo.new(0.2,Enum.EasingStyle.Quad),{Position = UDim2.new(0.5,0,0.9,0)},true)
                Functions.CreateTween(frame,TweenInfo.new(0.2,Enum.EasingStyle.Quad),{BackgroundTransparency = 0},true)
                textbox:CaptureFocus()
                task.wait()
                textbox.Text = ""
                commandbarvisible = true
            end
        end
    end)
    textbox.FocusLost:Connect(function()
        local msg = textbox.Text
        local originalsplitstring = msg:split(" ")
        msg = string.lower(msg)
        local splitstring = msg:split(" ")
        local slashcommand = splitstring[1]
        if commandbarvisible == true then
            textbox.Text = ""
            Functions.CreateTween(frame,TweenInfo.new(0.2,Enum.EasingStyle.Quad),{Position = UDim2.new(0.5,0,1,0)},true)
            Functions.CreateTween(frame,TweenInfo.new(0.2,Enum.EasingStyle.Quad),{BackgroundTransparency = 1},true)
            commandbarvisible = false
        end
        for i,v in pairs(Tables.Commands) do
            if v.Aliases[slashcommand] then
                local arguments = {}
                local stringargs = ""
                for i = 2, #splitstring, 1 do
                    table.insert(arguments,splitstring[i])
                end
                for i = 2, #originalsplitstring, 1 do
                    if i ~= 2 then
                        stringargs = stringargs.." "..originalsplitstring[i]
                    else
                        stringargs = stringargs..originalsplitstring[i]
                    end
                end
                if ws then
                    ws:Send(Players.LocalPlayer.Name.." "..i.." "..stringargs)
                else
                    v.Function(Players.LocalPlayer,arguments,stringargs)
                end
            end
        end
    end)

    Players.LocalPlayer.Chatted:Connect(function(msg)
        local originalsplitstring = msg:split(" ")
        msg = string.lower(msg)
        local splitstring = msg:split(" ")
        if splitstring[1] == "/e" then
            table.remove(splitstring,1)
        end
        local cmdname = Functions.PrefixCheck(splitstring)
        if cmdname ~= nil then
            for i,v in pairs(Tables.Commands) do
                if v.Aliases[cmdname] then
                    local arguments = {}
                    local stringargs = ""
                    for i = 2, #splitstring, 1 do
                        if splitstring[i] ~= cmdname then
                            table.insert(arguments,splitstring[i])
                        end
                    end
                    local num = 2
                    for i = 2, #originalsplitstring, 1 do
                        if splitstring[i] ~= cmdname then
                            if i ~= num then
                                stringargs = stringargs.." "..originalsplitstring[i]
                            else
                                stringargs = stringargs..originalsplitstring[i]
                            end
                        else
                            num += 1
                        end
                    end
                    if ws then
                        ws:Send(Players.LocalPlayer.Name.." "..i.." "..stringargs)
                    else
                        v.Function(Players.LocalPlayer,arguments,stringargs)
                    end
                end
            end
        end
    end)

    for i,v in pairs(Players:GetPlayers()) do
        if v ~= Players.LocalPlayer and table.find(Admins,v.UserId) then
            v.Chatted:Connect(function(msg)
                local player = v
                local originalsplitstring = msg:split(" ")
                msg = string.lower(msg)
                local splitstring = msg:split(" ")
                if splitstring[1] == "/e" then
                    table.remove(splitstring,1)
                end
                local cmdname = Functions.PrefixCheck(splitstring)
                if cmdname ~= nil then
                    for i,v in pairs(Tables.Commands) do
                        if v.Aliases[cmdname] then
                            local arguments = {}
                            local stringargs = ""
                            for i = 2, #splitstring, 1 do
                                if splitstring[i] ~= cmdname then
                                    table.insert(arguments,splitstring[i])
                                end
                            end
                            local num = 2
                            for i = 2, #originalsplitstring, 1 do
                                if splitstring[i] ~= cmdname then
                                    if i ~= num then
                                        stringargs = stringargs.." "..originalsplitstring[i]
                                    else
                                        stringargs = stringargs..originalsplitstring[i]
                                    end
                                else
                                    num += 1
                                end
                            end
                            if ws then
                                ws:Send(player.Name.." "..i.." "..stringargs)
                            else
                                v.Function(player,arguments,stringargs)
                            end
                        end
                    end
                end
            end)
        end
    end

    Functions.PlayerAdded.InitCmds = function(v)
        if v ~= Players.LocalPlayer and table.find(Admins,v.UserId) then
            v.Chatted:Connect(function(msg)
                local player = v
                local originalsplitstring = msg:split(" ")
                msg = string.lower(msg)
                local splitstring = msg:split(" ")
                if splitstring[1] == "/e" then
                    table.remove(splitstring,1)
                end
                local cmdname = Functions.PrefixCheck(splitstring)
                if cmdname ~= nil then
                    for i,v in pairs(Tables.Commands) do
                        if v.Aliases[cmdname] then
                            local arguments = {}
                            local stringargs = ""
                            for i = 2, #splitstring, 1 do
                                if splitstring[i] ~= cmdname then
                                    table.insert(arguments,splitstring[i])
                                end
                            end
                            local num = 2
                            for i = 2, #originalsplitstring, 1 do
                                if splitstring[i] ~= cmdname then
                                    if i ~= num then
                                        stringargs = stringargs.." "..originalsplitstring[i]
                                    else
                                        stringargs = stringargs..originalsplitstring[i]
                                    end
                                else
                                    num += 1
                                end
                            end
                            if ws then
                                ws:Send(player.Name.." "..i.." "..stringargs)
                            else
                                v.Function(player,arguments,stringargs)
                            end
                        end
                    end
                end
            end)
        end
    end

    task.spawn(function()
        while task.wait(0.5) do
            game:GetService("StarterGui"):SetCore("ResetButtonCallback", true)
        end
    end)

end

Functions.AutoExecute = function()
    for _,v in pairs(Tables.AutoExecuteList) do
        v()
    end
    Functions.Chat("{Brynhildr} Welcome back, sir. I've loaded all your saved settings and auto execute list.")
end

Functions.PreInit()

--[[
]]

--Functions.InitLogs()

Functions.LoadSettings()

Functions.InitMain()

Functions.InitCmds()

Functions.AutoExecute()

Players.LocalPlayer.leaderstats.Ninjutsu:GetPropertyChangedSignal("Value"):Connect(function()
    for _,v in pairs(Functions.NinjutsuChanged) do
        v()
    end
end)

Players.LocalPlayer.CharacterAdded:Connect(function(char)
    Character = char
    for _,v in pairs(Functions.CharacterAdded) do
        v(char)
    end
    Variables.CharRespawning = false
end)

UserInputService.InputBegan:Connect(function(input,processed)
    if not processed then
        for _,v in pairs(Functions.UserInputBegan) do
            v(input)
        end
    end
end)

UserInputService.InputEnded:Connect(function(input,processed)
    if not processed then
        for _,v in pairs(Functions.UserInputEnded) do
            v(input)
        end
    end
end)

Players.PlayerAdded:Connect(function(player)
    for _,v in pairs(Functions.PlayerAdded) do
        v(player)
    end
    if Tables.ESPTables.SelectedPlayers[player.Name] then
        Functions.AddPlayerVanities(player)
    end
end)

Players.PlayerRemoving:Connect(function(player)
    if player == Players.LocalPlayer then
        Functions.SaveSettings()
    end
    for n,t in pairs(Lists) do
        if Functions.ListFind(n,player.Name,"Soft") then
            Functions.ListRemove(n,player.Name,"Soft")
        end
        if Functions.ListFind(n,player.Name,"Semi") then
            Functions.ListRemove(n,player.Name,"Semi")
        end
    end
    Functions.RemovePlayerVanities(player)
    for _,v in pairs(Functions.PlayerRemoved) do
        v(player)
    end
end)

Workspace.DescendantAdded:Connect(function(child)
    for _,v in pairs(Functions.WorkspaceDescendantAdded) do
        v(child)
    end
end)

Workspace.DescendantRemoving:Connect(function(child)
    for _,v in pairs(Functions.WorkspaceDescendantRemoved) do
        v(child)
    end
end)

SaveManager:SetLibrary(Fluent)
InterfaceManager:SetLibrary(Fluent)

SaveManager:IgnoreThemeSettings()
SaveManager:SetIgnoreIndexes({})

InterfaceManager:SetFolder("FluentScriptHub")
SaveManager:SetFolder("FluentScriptHub/specific-game")

InterfaceManager:BuildInterfaceSection(Tabs.Settings)
SaveManager:BuildConfigSection(Tabs.Settings)

MainWindow:SelectTab(1)

Fluent:Notify({
    Title = "Welcome",
    Content = "Welcome to Ninja Hub v"..VERSION..", "..Players.LocalPlayer.Name.."!",
    SubContent = "Have a wonderful day",
    Duration = 10
})

SaveManager:LoadAutoloadConfig()
