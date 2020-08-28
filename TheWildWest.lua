local l__ReplicatedStorage__1 = game:GetService("ReplicatedStorage");
local v3 = require(l__ReplicatedStorage__1.Modules.Load);
local u8 = v3("UIHandler", true);
	u8:GiveNotification({
		text = "Wild West GUI by Samild.", 
		textcolor = "Green", 
		center = true
	});

shared.penisland = false

local me = game.Players.LocalPlayer.Name
  
ores = {
    "CoalOre";
    "CopperOre";
    'ZincOre';
    'IronOre';
    'SilverOre';
    'GoldOre';
 }
 
local mine = game:GetService("Workspace")["WORKSPACE_Interactables"].Mining.OreDeposits
local mee = Instance.new("Attachment")

mee.Parent = game:GetService("Workspace")["WORKSPACE_Entities"].Players[me].Head

local function createESP(primary)
    local bill = Instance.new("BillboardGui", primary)
    local name = Instance.new("TextLabel", bill)
    --local box = Instance.new("BoxHandleAdornment", primary)
    --box.Adornee = primary
    --box.AlwaysOnTop = true
    --box.Color = primary.BrickColor
    --box.ZIndex = 10
    --box.Size = primary.Size+Vector3.new(0.1,0.1,0.1)

    bill.AlwaysOnTop = false
    bill.Size = UDim2.new(0,50,0,10)
    name.Size = UDim2.new(0,50,0,10)
    name.BackgroundTransparency = 1
    name.Text = bill.Parent.Name
    name.TextColor3 = Color3.new(255,0,0)
    name.Font = Enum.Font.SciFi
    name.TextStrokeTransparency = 0
    name.TextScaled = true
    local bill = Instance.new("BillboardGui", primary)
    local name = Instance.new("TextLabel", bill)
    --local box = Instance.new("BoxHandleAdornment", primary)
    --box.Adornee = primary
    --box.AlwaysOnTop = false
    --box.Color = primary.BrickColor
    --box.ZIndex = 10
    --box.Size = primary.Size+Vector3.new(0.1,0.1,0.1)

    bill.AlwaysOnTop = true
    bill.Size = UDim2.new(0,50,0,10)
    name.Size = UDim2.new(0,50,0,10)
    name.BackgroundTransparency = 1
    name.Text = bill.Parent.Name
    name.TextColor3 = primary.Color
    name.Font = Enum.Font.SciFi
    name.TextStrokeTransparency = 1
    name.TextScaled = true
end

function esp(p)
    if shared.toggle == true then
        local char = p.Character
        if char then
            text = char.Name
            item = char.Head
            local BillboardGui = Instance.new("BillboardGui")
            local TextLabel = Instance.new("TextLabel")
            BillboardGui.Parent = item
            BillboardGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
            BillboardGui.Active = true
            BillboardGui.AlwaysOnTop = true
            BillboardGui.LightInfluence = 1
            BillboardGui.Size = UDim2.new(0, 100, 0, 50)
            BillboardGui.StudsOffset = Vector3.new(0, 2.5, 0)
            TextLabel.Parent = BillboardGui
            TextLabel.BackgroundColor3 = Color3.new(1, 1, 1)
            TextLabel.BackgroundTransparency = 1
            TextLabel.Size = UDim2.new(0, 100, 0, 50)
            TextLabel.Font = Enum.Font.SourceSans
            TextLabel.Text = text
            TextLabel.TextColor3 = p.TeamColor.Color
            TextLabel.TextScaled = false
            TextLabel.TextSize = 20
            TextLabel.TextWrapped = false
        end
    end
end

function esp_animal(Animal)
    if Animal:FindFirstChild("Head") and not Animal.Head:FindFirstChild("AnimalInfo") then
        ExtraInfo = nil
        local BillboardGui = Instance.new("BillboardGui")
        BillboardGui.Parent = Animal.Head
        BillboardGui.Name = "AnimalInfo"
        BillboardGui.AlwaysOnTop = true
        BillboardGui.Size = UDim2.new(12, 0, 2, 0)
        BillboardGui.ExtentsOffset = Vector3.new(0, 0, 0)
        BillboardGui.StudsOffset = Vector3.new(0, 2.25, 0)
        BillboardGui.Adornee = Animal.Head
        local TextLabel = Instance.new('TextLabel')
        TextLabel.Parent = BillboardGui
        if ExtraInfo then
            TextLabel.Text = ExtraInfo.." "..Animal.Name
        else
            TextLabel.Text = Animal.Name
        end
        TextLabel.TextSize = 14
        TextLabel.Font = Enum.Font.SourceSansSemibold
        TextLabel.BackgroundTransparency = 1
        TextLabel.Size = UDim2.new(1,0,1,0)
        TextLabel.TextColor3 = AnimalColor
    end
end

function esp_moneybag(Money)
    if Money:FindFirstChild("CashLeft") and not Money.Bag:FindFirstChild("BagInfo") then
        local BillboardGui = Instance.new("BillboardGui")
        BillboardGui.Parent = Money.Bag
        BillboardGui.Name = "BagInfo"
        BillboardGui.AlwaysOnTop = true
        BillboardGui.Size = UDim2.new(12, 0, 2, 0)
        BillboardGui.ExtentsOffset = Vector3.new(0, 0, 0)
        BillboardGui.StudsOffset = Vector3.new(0, 2.25, 0)
        BillboardGui.Adornee = Money.Bag
        local TextLabel = Instance.new('TextLabel')
        TextLabel.Parent = BillboardGui
        TextLabel.Text = "MoneyBag | Cash: "..Money.CashLeft.Value
        TextLabel.TextSize = 14
        TextLabel.Font = Enum.Font.SourceSansSemibold
        TextLabel.BackgroundTransparency = 1
        TextLabel.Size = UDim2.new(1,0,1,0)
        TextLabel.TextColor3 = MoneyBagColor
    end
end

local function getPlayerFromCharacter(character)
    for _, player in pairs(game:GetService("Players"):GetPlayers()) do
        if player.Character == character then
            return player
        end
    end
end

local library = loadstring(game:HttpGet("https://pastebin.com/raw/qwdPKKDN"))()
local venyx = library.new("The Wild West by Samild.", 5013109572)

local themes = {
    Background = Color3.fromRGB(24, 24, 24),
    Glow = Color3.fromRGB(0, 0, 0),
    Accent = Color3.fromRGB(10, 10, 10),
    LightContrast = Color3.fromRGB(20, 20, 20),
    DarkContrast = Color3.fromRGB(14, 14, 14),
    TextColor = Color3.fromRGB(255, 255, 255)
}

local page = venyx:addPage("ESP", 5012544693)
local espall = page:addSection("ESP Function")
local espcolors = page:addSection("ESP Colors")

espall:addToggle("Player ESP", nil, function(bool)
    shared.toggle = bool
    if shared.toggle == true then
        for i,v in pairs(game.Players:GetPlayers()) do
            esp(v)
        end
    end
    if shared.toggle == false then
        for i,v in pairs(game:GetService("Workspace")["WORKSPACE_Entities"].Players:GetDescendants()) do
            if v.Name == "BillboardGui" then
                v:Destroy()
            end
        end
    end
    game.Players.PlayerAdded:Connect(function(player)
        if shared.toggle == true then
            esp(player)
        end
    end)
        for i,v in pairs(game.Players:GetPlayers()) do
            v.CharacterAdded:Connect(function(player)
            if shared.toggle == true then
                esp(getPlayerFromCharacter(player))
            end
        end)
    end
end)

espall:addToggle("Animal ESP", nil, function(Value)
    AnimalEsp = Value
    wait()
    if AnimalEsp then
        for i,v in pairs(game:GetService("Workspace")["WORKSPACE_Entities"].Animals:GetChildren()) do
            if v:FindFirstChild("Head") then
                esp_animal(v)
            end
        end
    else
        for i,v in pairs(game:GetService("Workspace")["WORKSPACE_Entities"].Animals:GetDescendants()) do
            if v.Name == "AnimalInfo" then
                v:Destroy()
            end
        end
    end
end)

espall:addToggle("Ore ESP", nil, function(bool)
    shared.nigger1 = bool
        if shared.nigger1 == true then
        for _,v in pairs(mine:GetDescendants()) do
            for _,c in pairs(ores) do
          
                    if string.match(v.Name, c) then
                        createESP(v)
                    end
                end
            end
    elseif shared.nigger1 == false then
        for i,v in pairs(mine:GetDescendants()) do
            if v.Name == "BillboardGui"then
                v:Destroy()
            end
    end
        for k,l in pairs(mine:GetDescendants()) do
            if l.Name == "BoxHandleAdornment" then
                l.Adornee = game.Workspace
                l:Destroy()
            end
        end
    end
end)

espall:addToggle("MoneyBag ESP", nil, function(Value)
    MoneyBagEsp = Value
    wait()
    if MoneyBagEsp then
        for i,v in pairs(workspace.Ignore:GetChildren()) do
            if v.Name == "MoneyBag" and v:FindFirstChild("CashLeft") and v:FindFirstChild("Bag") then
                esp_moneybag(v)
            end
        end
    else
        for i,v in pairs(workspace.Ignore:GetChildren()) do
            if v.Name == "MoneyBag" and v:FindFirstChild("CashLeft") and v:FindFirstChild("BagInfo") then
                v.BagInfo:Destroy()
            end
        end
    end
end)

espcolors:addColorPicker("MoneyBag Color", Color3.fromRGB(255,0,0), function(Color)
    MoneyBagColor = Color
    wait()
    for i,v in pairs(workspace.Ignore:GetChildren()) do
        if v.Name == "MoneyBag" and v:FindFirstChild("CashLeft") and v:FindFirstChild("Bag") and v.Bag:FindFirstChild("BagInfo") then
            v.Bag.BagInfo.TextLabel.TextColor3 = MoneyBagColor
        end
    end
end)
espcolors:addColorPicker("Animal Color", Color3.fromRGB(255,0,0), function(Color)
    AnimalColor = Color
    wait()
    for i,v in pairs(game:GetService("Workspace")["WORKSPACE_Entities"].Animals:GetChildren()) do
        if v.Head:FindFirstChild("AnimalInfo") then
            v.Head.AnimalInfo.TextLabel.TextColor3 = AnimalColor
        end
    end
end)

local page2 = venyx:addPage("HitBox", 5012544693)
local hitboxs = page2:addSection("Hitbox Function")

function BigHeadC()
    for i, v in pairs(game:GetService("Players"):GetChildren()) do 
        if v ~= game:GetService("Players").LocalPlayer and v.Character then
            local Head = nil
            for i,v in pairs(v.Character:GetChildren()) do
                if v:FindFirstChild("Mesh") and v:FindFirstChild("PlayerInfo") then
                    Head = v
                end
            end
            if Head then
                if EnableHeadHitbox == true then
                    Head.Name = "Head"
                    Head.CanCollide = true
                else
                    Head.Name = "HshHead"
                    Head.CanCollide = false
                end
                Head.Size = Vector3.new(BigHeadSize,BigHeadSize,BigHeadSize)
                Head.Transparency = 0.55
            end
        end
    end
end

game:GetService("Players").PlayerAdded:Connect(function(Player)
    Player.CharacterAdded:Connect(function()
        if BigHead then
            BigHeadC()
        end
    end)
end)
for i,v in pairs(game:GetService("Players"):GetChildren()) do
    v.CharacterAdded:Connect(function()
        if BigHead then
            BigHeadC()
        end
    end)
end

local BigHeadPlayers = hitboxs:addToggle("Big Head Players", nil, function(Value)
    BigHead = Value
    if BigHead then
        BigHeadC()
    else
        wait()
        for i, v in pairs(game:GetService("Players"):GetChildren()) do 
            if v ~= game:GetService("Players").LocalPlayer and v.Character then
                local Head = nil
                for i,v in pairs(v.Character:GetChildren()) do
                    if v:FindFirstChild("Mesh") and v:FindFirstChild("PlayerInfo") then
                        Head = v
                    end
                end
                if Head then
                    Head.Name = "Head"
                    Head.Size = Vector3.new(1.79258, 0.942, 0.896289)
                    Head.CanCollide = true
                    Head.Transparency = 0
                end
            end
        end
    end
end)
hitboxs:addToggle("Enable Head Hitbox", nil, function(Value)
    EnableHeadHitbox = Value
    wait()
    if EnableHeadHitbox then
        wait()
        for i, v in pairs(game:GetService("Players"):GetChildren()) do 
            if v ~= game:GetService("Players").LocalPlayer and v.Character then
                local Head = nil
                for i,v in pairs(v.Character:GetChildren()) do
                    if v:FindFirstChild("Mesh") and v:FindFirstChild("PlayerInfo") then
                        Head = v
                    end
                end
                if Head then
                    Head.Name = "Head"
                    Head.Size = Vector3.new(1.79258, 0.942, 0.896289)
                    Head.CanCollide = true
                    Head.Transparency = 0
                end
            end
        end
        wait()
        BigHeadC()
    else
        for i, v in pairs(game:GetService("Players"):GetChildren()) do 
            if v ~= game:GetService("Players").LocalPlayer and v.Character then
                local Head = nil
                for i,v in pairs(v.Character:GetChildren()) do
                    if v:FindFirstChild("Mesh") and v:FindFirstChild("PlayerInfo") then
                        Head = v
                    end
                end
                if Head then
                    Head.CanCollide = false
                end
            end
        end
    end
end)

hitboxs:addSlider("Scale Head Player", 1, 1, 150, function(Value)
    BigHeadSize = Value
    if BigHead then
        BigHeadC()
    end
end)

hitboxs:addToggle("Animal Hitbox", nil, function(bool)
    shared.anmh = bool
    if shared.anmh == true then
        for i,v in pairs(game:GetService("Workspace")["WORKSPACE_Entities"].Animals:GetChildren()) do
            if v:FindFirstChild('Body') then
                local Head = v:FindFirstChild('Body')
                Head.CanCollide = false
                Head.Size = Vector3.new(20, 20, 20)
                Head.Transparency = 0.35
                 Head.CanCollide = false
            end
        end
    elseif shared.anmh == false then
        for i,v in pairs(game:GetService("Workspace")["WORKSPACE_Entities"].Animals:GetChildren()) do
            if v:FindFirstChild('Body') then
                local Head = v:FindFirstChild('Body')
                Head.CanCollide = true
                Head.Size = Vector3.new(2, 3, 5)
                Head.Transparency = 0
            end
        end
    end
end)

local page3 = venyx:addPage("Weapon", 5012544693)
local weapon = page3:addSection("Weapon Function")

weapon:addButton("Fast Gun", function()
    for i, v in pairs(getgc(true)) do
        if type(v) == "table" and rawget(v, "BaseRecoil") then
            v.FireSpeed = 0
        end
    end
end)
weapon:addButton("No Recoil", function()
    for i,v in next, require(game.ReplicatedStorage.Modules.Load.Character.Items.Types.GunItem) do
        if i == "CalculateRecoil" then
            hookfunction(v, function()
                return 0
            end)
        end
    end
end)
weapon:addButton("No Spread", function()
    for i, v in pairs(getgc(true)) do
        if type(v) == "table" and rawget(v, "BaseRecoil") then
            v.ProjectileAccuracy = 100
        end
    end
end)
weapon:addButton("Instant Reload", function()
    InstantReload = true
    if InstantReload == true then
        for i, v in pairs(getgc(true)) do
            if type(v) == "table" and rawget(v, "BaseRecoil") then
                v.ReloadSpeed = 1000
                v.LoadSpeed = 1000
                v.LoadEndSpeed = 1000
            end
        end
    end
end)
weapon:addButton("Wallbang", function()
    for i, v in pairs(getgc(true)) do
        if type(v) == "table" and rawget(v, "BaseRecoil") then
            v.ProjectilePenetration = math.huge
        end
     end
end)

local page4 = venyx:addPage("Character", 5012544693)
local charactercheats = page4:addSection("Character Function")

charactercheats:addToggle("Infinite Stamina", nil, function(Value)
    InfiniteStamina = Value
end)
charactercheats:addToggle("Unlimited Roll", nil, function(Value)
    AlwaysRoll = Value
end)
charactercheats:addToggle("Auto Get up", nil, function(Value)
    AutoGetUp = Value
end)
charactercheats:addToggle("Instant Lasso Charge", nil, function(Value)
    InstantLassoCharge = Value
end)

local page5 = venyx:addPage("Player", 5012544693)
local playercheats = page5:addSection("Player Function")

playercheats:addSlider("WalkSpeed", 7, 7, 200, function(Value)
    WalkSpeed = Value
end)
playercheats:addSlider("JumpPower", 50, 50, 200, function(Value)
    JumpPower = Value
end)
playercheats:addSlider("HipHeight", 2.5, 2.5, 200, function(Value)
    game.Players.LocalPlayer.Character.Humanoid.HipHeight = tonumber(Value)
end)

local misc = venyx:addPage("Misc", 5012544693)
local fullbright = misc:addSection("Full Bright")
local rejoin = misc:addSection("Rejoin Server")
fullbright:addToggle("Full Bright", nil, function(Value)
    FullBright = Value
end)
rejoin:addButton("Rejoin", function()
    game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, game.JobId)
end)


local theme = venyx:addPage("Theme", 5012544693)
local colors = theme:addSection("Colors")
for theme, color in pairs(themes) do
    colors:addColorPicker(theme, color, function(color3)
    venyx:setTheme(theme, color3)
    end)
end

local settings = venyx:addPage("Settings", 5012544693)
local keycode = settings:addSection("Show/Hide Button")
keycode:addKeybind("Toggle Keybind", Enum.KeyCode.Insert, function()
print("Activated Keybind")
venyx:toggle()
end, function()
    print("Changed Keybind")
end)

venyx:SelectPage(venyx.pages[1], true)

pcall(function()

    getgenv().TSLoaded = true
    BigHeadSize = 10
    WalkSpeed = 7
    JumpPower = 50
    BouncingIncrement = 0.001
    TTCharacterIncrement = 0.001
    TTCharacterHeight = 0
    HatHeight = 0
    BouncingHat = false
    HatGoingDown = false
    TTCharacterGoingDown = false
    CharacterTimeTravel = false
    SprintingToggle = true
    Sprinting = false
    AutoGetUp = false
    NoJumpWait = false
    BigHead = false
    EnableHeadHitbox = false
    EspDistance = 10000
    MoneyBagEsp = false
    NoSpread = false
    Wallbang = false
    InstantReload = false
    NoRecoil = false
    NoRain = false
    NoRagdoll = false
    InfiniteStamina = false
    InfiniteBoosts = false
    AnimalColor = Color3.fromRGB(255,0,0)
    MoneyBagColor = Color3.fromRGB(0,0,255)

    local ReplicatedStorage = game:GetService("ReplicatedStorage");
    local ModLoad = require(ReplicatedStorage.Modules.Load);
    local SharedLoad = require(ReplicatedStorage.SharedModules.Load);
    local WorldDisplayHandler = ModLoad("WorldDisplayHandler");
    local ClientSoundHandler = ModLoad("ClientSoundHandler");
    local AnimationHandler = ModLoad("AnimationHandler");
    local PlayerCharacter = ModLoad("PlayerCharacter");
    local ReplicatedState = ModLoad("ReplicatedState");
    local QuestsSelection = ModLoad("QuestsSelection");
    local FishController = ModLoad("FishController");
    local BreakableGlass = ModLoad("BreakableGlass");
    local RepCharHandler = ModLoad("RepCharHandler");
    local ClientPlaceableFood = ModLoad("ClientPlaceableFood");
    local PianoHandler = ModLoad("PianoHandler");
    local InputHandler = ModLoad("InputHandler");
    local GunChambers = ModLoad("GunChambers");
    local Tumbleweeds = ModLoad("Tumbleweeds");
    local PlaceablesHandler = ModLoad("PlaceablesHandler");
    local PlayerData = ModLoad("PlayerData");
    local GameEvents = ModLoad("GameEvents");
    local PlaceItem = ModLoad("PlaceItem");
    local TimeCycle = ModLoad("TimeCycle");
    local UIHandler = ModLoad("UIHandler");
    local FaceMouse = ModLoad("FaceMouse");
    local UIObjects = ModLoad("UIObjects");
    local WildLife = ModLoad("WildLife");
    local Lighting = ModLoad("Lighting");
    local Ragdolls = ModLoad("Ragdolls");
    local BodyTilt = ModLoad("BodyTilt");
    local Weather = ModLoad("Weather");
    local Camera = ModLoad("Camera");
    local Mining = ModLoad("Mining");
    local Trains = ModLoad("Trains");
    local Wagons = ModLoad("Wagons");
    local Grass = ModLoad("Grass");
    local ClientDoors = ModLoad("ClientDoors");
    local Utils = ModLoad("Utils");
    local Chat = ModLoad("Chat");
    local Map = ModLoad("Map");
    local FX = ModLoad("FX");
    local ProjectileHandler = SharedLoad("ProjectileHandler");
    local SharedUtils = SharedLoad("SharedUtils");
    local SharedUtils = SharedLoad("SharedData");
    local Network = SharedLoad("Network");
    local Mathf = SharedLoad("Mathf");
    local Time = SharedLoad("Time");
    local rs = require(ReplicatedStorage.Modules.Load.UI.Shops.RobuxShop)
    local CharacterFrame = UIObjects.Outfits.Outfits.MainFrame.BodyFrame.CharacterFrame
    local LocalRepChar = RepCharHandler:GetRepChar(game:GetService("Players").LocalPlayer)

    local function GetUp()
        local v1, v2 = Network:InvokeServer("AttemptGetUp")
        PlayerCharacter:OnGetUp(v1, v2)
    end

    local PowerFill = ModLoad("UIObjects").PowerFill;
    local Fill = PowerFill.FillFrame.Fill;
    local TextLabel = PowerFill.FillFrame.TextLabel;

    local PlayerStaminaFunction = require(game.ReplicatedStorage.Modules.Load.Character.PlayerCharacter).LowerStamina
    local PlayerRagdollFunction = require(game.ReplicatedStorage.Modules.Load.Character.Ragdolls).EnterRagdoll
    local NetworkFireServer = require(game.ReplicatedStorage.SharedModules.Load.Network).FireServer
    local CanRollFunction = require(game.ReplicatedStorage.Modules.Load.Character.PlayerCharacter).CanRoll

    local LassoVal = nil
    local Orig = require(game.ReplicatedStorage.Modules.Load.Character.Items.Special.LassoItem).Update
    require(game.ReplicatedStorage.Modules.Load.Character.Items.Special.LassoItem).Update = function(Lasso)
        if InstantLassoCharge == true then
            LassoVal = Lasso
            local IsActivated = Lasso.IsActivated;
            Fill.BackgroundColor3 = Color3.fromRGB(156, 74, 74);
            TextLabel.Text = "READY";
            if IsActivated and not Lasso.LastIsActivated then
                if not Lasso:CanThrow() then
                    return;
                end;
                Lasso.SwingPower = 2;
                Lasso.StartedCharge = tick();
                Lasso.PoweredTime = nil;
                Lasso.PercToStay = nil;
                Lasso.ChargeTime = 0;
                Lasso.DechargeTime = math.huge;
                Lasso.StayTime = math.huge;
                PowerFill.Enabled = true;
            end
            Lasso.LastIsActivated = IsActivated;
            if Lasso:GetTrack("Swing").IsPlaying then
                Lasso:AdjustSpeed("Swing", Mathf.Lerp(1.15, 2, Lasso.SwingPower));
            end;
            if Lasso.StartedCharge then
                local ChargeTime = (tick() - Lasso.StartedCharge) / Lasso.ChargeTime;
                if ChargeTime > 1 then
                    if not Lasso.PoweredTime then
                        Lasso.PoweredTime = tick();
                    end;
                    if Lasso.PoweredTime then
                        local PoweredTime = tick() - Lasso.PoweredTime;
                        Lasso.PercToStay = math.clamp(PoweredTime / Lasso.StayTime, 0, 1);
                        if Lasso.StayTime <= PoweredTime then
                            ChargeTime = 1 - Mathf.PercentBetween(PoweredTime, Lasso.StayTime, Lasso.DechargeTime);
                        end;
                    end;
                end;
                Lasso.SwingPower = math.clamp(ChargeTime, 0, 1);
                Fill.Size = UDim2.new(Lasso.SwingPower, 0, 1, 0);
            end;
            if Lasso.SwingPower ~= Lasso.LastSwingPower then
                Network:FireServer("UpdateLassoPower", Lasso.SwingPower);
            end;
            Lasso.LastSwingPower = Lasso.SwingPower;
            if Lasso.IsThrowingLasso or Lasso.IsReelingIn then
                Lasso.IsUpdatingLasso = true;
                Network:FireServer("UpdateThrownLasso", Lasso.LassoCircle.CFrame);
            elseif Lasso.IsUpdatingLasso then
                Lasso.IsUpdatingLasso = false;
                Network:FireServer("UpdateThrownLasso", nil);
            end;
            if Lasso.IsLassoing and Lasso.LassoTarget then
                local Magnitude = (PlayerCharacter.RootPart.Position - Lasso.LassoTarget.HumanoidRootPart.Position).Magnitude;
                local LastLassoDistance = Lasso.LastLassoDistance and 0;
                Lasso.LastLassoDistance = Magnitude;
                local LassoRopePull = ClientSound:CharacterSoundIsPlaying("LassoRopePull");
                if tick() - (Lasso.LastLassoPullThang and 0) > 0.5 then
                    Lasso.LastLassoPullThang = tick();
                    if Magnitude - LastLassoDistance <= -0.05 then
                        if not LassoRopePull then
                            ClientSound:PlayCharacterSound("LassoRopePull");
                        end;
                        Lasso:PlayTrack("CloseIn", 0.25, 1, 0.75);
                    elseif Magnitude - LastLassoDistance > 0.05 then
                        if not LassoRopePull then
                            ClientSound:PlayCharacterSound("LassoRopePull");
                        end;
                        Lasso:PlayTrack("CloseIn", 0.25, 1, -0.75);
                    else
                        if LassoRopePull then
                            ClientSound:StopCharacterSound("LassoRopePull");
                        end;
                        Lasso:StopTrack("CloseIn", 0.25);
                    end;
                end;
            end;
            if Lasso.IsTaming then
                local RopePull = nil;
                local Magnitude = (PlayerCharacter.RootPart.Position - Lasso.TamingCircle.Position).Magnitude;
                if not Lasso.IsTamingLocal and not Lasso.TryingToMount then
                    if Lasso.TamingDistance + 5 < Magnitude then
                        ClientSound:PlayCharacterSound("LassoBreak");
                        PlayerCharacter:EquipItem(nil);
                        return;
                    end;
                    if Magnitude < 8 then
                        Lasso.TryingToMount = true;
                        coroutine.wrap(function()
                            Lasso:Async(function()
                                Network:InvokeServer("TamingMount");
                            end);
                            if not Lasso.IsEquipped then
                                return;
                            end;
                            Lasso.DidMount = true;
                            PlayerCharacter:EquipItem(nil);
                        end)();
                    end;
                end;
                local TamingDistance = Lasso.LastTamingRopeDistance and 0;
                Lasso.LastTamingRopeDistance = Magnitude;
                RopePull = ClientSound:CharacterSoundIsPlaying("LassoRopePull");
                if Magnitude - TamingDistance <= -0.05 then
                    if not RopePull then
                        ClientSound:PlayCharacterSound("LassoRopePull");
                    end;
                    Lasso:PlayTrack("CloseIn", 0.25, 1, 0.75);
                    return;
                end;
                if Magnitude - TamingDistance > -0.025 then
                    if RopePull then
                        ClientSound:StopCharacterSound("LassoRopePull");
                    end;
                    Lasso:StopTrack("CloseIn", 0.25);
                end;
            end;
        else
            Orig(Lasso)
        end
    end

    require(game.ReplicatedStorage.Modules.Load.Character.PlayerCharacter).LowerStamina = function(Arg1, Arg2)
        if InfiniteStamina == true then
            return;
        else
            PlayerStaminaFunction(Arg1, Arg2)
        end
    end
    require(game.ReplicatedStorage.Modules.Load.Character.PlayerCharacter).CanRoll = function()
        if AlwaysRoll == true then
            return true
        else
            CanRollFunction()
        end
    end
    require(game.ReplicatedStorage.Modules.Load.Character.Ragdolls).EnterRagdoll = function(Arg1, Arg2)
        if NoRagdoll == true then
            if ReplicatedState.State.Dead == true then
                PlayerRagdollFunction(Arg1, Arg2)
            end
            return;
        else
            PlayerRagdollFunction(Arg1, Arg2)
        end
    end

    require(game.ReplicatedStorage.SharedModules.Load.Network).FireServer = function(Data, Name, ...)
        if NoFallDamage then
            if Name == "DamageSelf" then
                return;
            end
        end
        NetworkFireServer(Data, Name, ...)
    end

    game:GetService("UserInputService").InputBegan:Connect(function(Key, GPE)
        if Key.KeyCode == Enum.KeyCode.LeftShift then
            Sprinting = true
        end
    end)

    game:GetService("UserInputService").InputEnded:Connect(function(Key, GPE)
        if Key.KeyCode == Enum.KeyCode.LeftShift then
            Sprinting = false
        end
    end)

    game:GetService("RunService").RenderStepped:Connect(function()
        if AnimalEsp == true then
            for i,v in pairs(game:GetService("Workspace")["WORKSPACE_Entities"].Animals:GetChildren()) do
                if v:FindFirstChild("Head") and not v.Head:FindFirstChild("AnimalInfo") then
                    esp_animal(v)
                end
            end
        end
        if FullBright == true then
            game:GetService("Lighting").Ambient = Color3.fromRGB(255, 255, 255)
        end
        if InstantBreakFree == true then
            if require(game.ReplicatedStorage.Modules.Load.Character.PlayerCharacter).CanBreakFree(require(game.ReplicatedStorage.Modules.Load.Character.PlayerCharacter)) == true and ReplicatedState.State.Dead ~= true then 
                PlayerCharacter.BreakFreePerc = 0
                PlayerCharacter.BreakFreePerc = 5
                if AutoGetUp == true then
                    GetUp()
                end
            end
        end
        if InfiniteBoosts == true then
            GetRidingAnimal = require(game.ReplicatedStorage.Modules.Load.UI.Wildlife.AnimalRiding).GetRidingAnimal()
            GetRidingAnimal.MaxBoosts = math.huge
        end
        if ReplicatedState.State.Dead ~= true and LocalRepChar and WalkSpeed ~= nil then
            if Sprinting == true and SprintingToggle == true then
                LocalRepChar.Human.WalkSpeed = 25
            else
                LocalRepChar.Human.WalkSpeed = WalkSpeed
            end
        end
        if ReplicatedState.State.Dead ~= true and LocalRepChar and JumpPower ~= nil then
            LocalRepChar.Human.JumpPower = JumpPower
        end
        if AutoGetUp == true and PlayerCharacter:IsRagdolled() and ReplicatedState.State.Dead ~= true  then
            GetUp()
        end
        if NoJumpWait == true then
            PlayerCharacter.CanJump = true
        end
        if BouncingHat == true and BouncingIncrement and HatHeight then
            Network:FireServer("SetHatPosition", HatHeight)
            if HatGoingDown == false then
                HatHeight = HatHeight + BouncingIncrement
            elseif HatGoingDown == true then
                HatHeight = HatHeight - BouncingIncrement
            end
            if HatHeight >= 1 then
                HatGoingDown = true
            elseif HatHeight <= 0 then
                HatGoingDown = false
            end
        end
        if CharacterTimeTravel == true and TTCharacterIncrement and TTCharacterHeight then
            Network:FireServer("SetHeightPercent", TTCharacterHeight)
            if TTCharacterGoingDown == false then
                TTCharacterHeight = TTCharacterHeight + TTCharacterIncrement
            elseif TTCharacterGoingDown == true then
                TTCharacterHeight = TTCharacterHeight - TTCharacterIncrement
            end
            if TTCharacterHeight >= 1 then
                TTCharacterGoingDown = true
            elseif TTCharacterHeight <= 0 then
                TTCharacterGoingDown = false
            end
        end
    end)
end)
