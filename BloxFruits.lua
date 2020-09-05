local library = loadstring(game:HttpGet("https://pastebin.com/raw/yz4zVZ9S"))()
local venyx = library.new("Blox Fruits by Samild.", 5013109572)

local themes = {
    Background = Color3.fromRGB(24, 24, 24),
    Glow = Color3.fromRGB(0, 0, 0),
    Accent = Color3.fromRGB(10, 10, 10),
    LightContrast = Color3.fromRGB(20, 20, 20),
    DarkContrast = Color3.fromRGB(14, 14, 14),
    TextColor = Color3.fromRGB(255, 255, 255)
}

local LocalPlayer = game:GetService'Players'.LocalPlayer
local HTTP = game:GetService("HttpService")
local TPService = game:GetService("TeleportService")
local gamename
local desiredquest
local oldworld
local newworld
local toolname
_G.nododgecool = false
_G.farm = false
_G.automelee = false
_G.autodefense = false
_G.autosword = false
_G.autogun = false
_G.autodf = false
_G.noclip = false

function teleport(pos)
    LocalPlayer.Character.HumanoidRootPart.CFrame = (pos)
end

function fullbright()
	game:GetService("RunService").Stepped:connect(function()
	    game:GetService("Lighting").FogEnd = 1000000
	    game:GetService("Lighting").Brightness = 1
	    game:GetService("Lighting").ClockTime = 12
	end)
end

function noclip()
	LocalPlayer.Character.Humanoid:ChangeState(11)
end

function NoDodgeCool()
	if _G.nododgecool then
			for i,v in next, getgc() do
				if game.Players.LocalPlayer.Character.Dodge then
					if typeof(v) == "function" and getfenv(v).script == game.Players.LocalPlayer.Character.Dodge then
						for i2,v2 in next, getupvalues(v) do
							if tostring(v2) == "0.4" then
								repeat wait()
									setupvalue(v,i2,0)
								until not _G.nododgecool
							end
						end
					end
				end
			end
		end
end

function dfnotify()
	for _,v in pairs (workspace:GetChildren()) do
		if v.Name:match('Fruit') and not v:IsA('Folder') and (v:IsA("Model") or v:IsA("Part")) then
			local sound = Instance.new("Sound")
			sound.SoundId = "rbxassetid://170765130"
			sound.Parent = game.Lighting
			sound.Volume = 9000
			sound:Play()
			game:GetService("StarterGui"):SetCore("SendNotification", {
	            Title = "Fruit Spawned";
	            Text = "Fruit Located \n Name : "..v.Name;
	               Duration = 2e9;
	            Button1 = "Dismiss"
            })
        end
    end
    	workspace.ChildAdded:connect(function(x)
			if x.Name:match("Fruit") and x:FindFirstChild('Fruit') then
				local sound = Instance.new("Sound")
				sound.SoundId = "rbxassetid://170765130"
				sound.Parent = game.Lighting
				sound.Volume = 9000
				sound:Play()
				game:GetService("StarterGui"):SetCore("SendNotification", {
		            Title = "Fruit Spawned";
		            Text = "Fruit Located \n Name : "..v.Name;
		               Duration = 2e9;
		            Button1 = "Dismiss"
		            })
			end
		end)
end

dfnotify();

local originalstam = LocalPlayer.Character.Energy.Value
function infinitestam()
	LocalPlayer.Character.Energy.Changed:connect(function()
	    LocalPlayer.Character.Energy.Value = originalstam
	end)
end
infinitestam()

LocalPlayer.CharacterAdded:connect(function()
	wait(0.3)
	originalstam = LocalPlayer.Character.Energy.Value
	infinitestam()
end)


do
	if placeId == 4442272183 then
        gamename = "/Blox-Fruits-Second-Sea"
        newworld = true
    elseif placeId == 2753915549 then
        gamename = "/UPDATE-10-Blox-Fruits"
        oldworld = true
end
end

--Anti Afk
game:GetService'Players'.LocalPlayer.Idled:Connect(function()
	game:GetService'VirtualUser':CaptureController()
	game:GetService'VirtualUser':ClickButton2(Vector2.new())
end)

--Grab the player's icon
local icon = game:GetService("Players"):GetUserThumbnailAsync(LocalPlayer.UserId, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size180x180)

if oldworld then
	function bestfarm()
		if 	LocalPlayer.Data.Level.Value >= 0 and LocalPlayer.Data.Level.Value < 10 then
		teleport(CFrame.new(973.320435, 16.3492527, 1549.81885, -0.636105061, 2.36918627e-08, 0.771602452, 4.02189881e-09, 1, -2.73891221e-08, -0.771602452, -1.43190517e-08, -0.636105061))
		wait(1)
		autofarm(tostring(toolname), "Bandit", nil, "BanditQuest1", 1)

	elseif LocalPlayer.Data.Level.Value >= 10 and LocalPlayer.Data.Level.Value < 15 then
		teleport(CFrame.new(-1443.24609, 22.8521042, 161.635147, -0.38530159, -4.39645653e-08, 0.922790706, -3.86702226e-09, 1, 4.60284149e-08, -0.922790706, 1.41663703e-08, -0.38530159))
		wait(1)
		autofarm(tostring(toolname), "Monkey", nil, "JungleQuest", 1)

	elseif LocalPlayer.Data.Level.Value >= 15 and LocalPlayer.Data.Level.Value < 30 then
		teleport(CFrame.new(-1262.90405, 11.2192535, -601.962402, -0.749959588, -8.47150738e-10, -0.661483645, 3.97925082e-10, 1, -1.7318319e-09, 0.661483645, -1.56202484e-09, -0.749959588))
		wait(1)
		autofarm(tostring(toolname), ("20"), nil, "JungleQuest", 2)

	elseif LocalPlayer.Data.Level.Value >= 30 and LocalPlayer.Data.Level.Value < 40 then
		teleport(CFrame.new(-1214.29834, 4.7520504, 3914.19995, 0.202510014, -6.5743599e-08, 0.979280174, -1.00924495e-08, 1, 6.92216773e-08, -0.979280174, -2.39014195e-08, 0.202510014))
		wait(1)
		autofarm(tostring(toolname), "Pirate", nil, "BuggyQuest1", 1)

	elseif LocalPlayer.Data.Level.Value >= 40 and LocalPlayer.Data.Level.Value < 60 then
		teleport(CFrame.new(-1310.4906, 14.869874, 4259.25342, -0.974549353, 8.85998119e-09, -0.224173129, -1.09559695e-08, 1, 8.71518964e-08, 0.224173129, 8.73898571e-08, -0.974549353))
		wait(1)
		autofarm(tostring(toolname), "Brute", nil, "BuggyQuest1", 2)

	elseif LocalPlayer.Data.Level.Value >= 60 and LocalPlayer.Data.Level.Value < 75 then
		teleport(CFrame.new(937.618896, 6.45013809, 4490.11816, 0.647611976, 9.07161848e-08, 0.761970282, -5.56535191e-08, 1, -7.17538526e-08, -0.761970282, 4.06232425e-09, 0.647611976))
		wait(1)
		autofarm(tostring(toolname), "Bandit", nil, "DesertQuest", 1)

	elseif LocalPlayer.Data.Level.Value >= 75 and LocalPlayer.Data.Level.Value < 90 then
		teleport(CFrame.new(1586.36829, 4.21892071, 4376.83984, 0.178952768, -1.03469067e-09, -0.983857691, 1.41175149e-09, 1, -7.94885102e-10, 0.983857691, -1.24671562e-09, 0.178952768))
		wait(1)
		autofarm(tostring(toolname), "Officer", nil, "DesertQuest", 2)

	elseif LocalPlayer.Data.Level.Value >= 90 and LocalPlayer.Data.Level.Value < 100 then
		teleport(CFrame.new(1357.83826, 87.2727661, -1353.2384, 0.605153263, 1.36694718e-08, 0.796108961, 6.53557777e-08, 1, -6.68498146e-08, -0.796108961, 9.24847043e-08, 0.605153263))
		wait(1)
		autofarm(tostring(toolname), "Snow Bandit", nil, "SnowQuest", 1)

	elseif LocalPlayer.Data.Level.Value >= 100 and LocalPlayer.Data.Level.Value < 150 then
		teleport(CFrame.new(1195.7312, 105.774536, -1477.3407, 0.690636218, -1.82257409e-08, 0.723202348, 5.10525788e-10, 1, 2.47139038e-08, -0.723202348, -1.66991025e-08, 0.690636218))
		wait(1)
		autofarm(tostring(toolname), "Snowman", nil, "SnowQuest", 2)

	elseif LocalPlayer.Data.Level.Value >= 150 and LocalPlayer.Data.Level.Value < 175 then
		teleport(CFrame.new(-4949.07178, 278.066345, -2849.6499, 0.998485565, -2.4800201e-08, 0.055014465, 2.03106651e-08, 1, 8.21655775e-08, -0.055014465, -8.09237619e-08, 0.998485565))
		wait(1)
		autofarm(tostring(toolname), "Sky Bandit", nil, "SkyQuest", 1)

	elseif LocalPlayer.Data.Level.Value >= 175 and LocalPlayer.Data.Level.Value < 225 then
		teleport(CFrame.new(-5244.16797, 388.651947, -2275.66016, 0.971692681, -9.60401358e-09, -0.236248419, 2.62311204e-08, 1, 6.72367477e-08, 0.236248419, -7.15305148e-08, 0.971692681))
		wait(1)
		autofarm(tostring(toolname), "Master", nil, "SkyQuest", 2)

	elseif LocalPlayer.Data.Level.Value >= 225 and LocalPlayer.Data.Level.Value < 275 then
		teleport(CFrame.new(-1987.04883, 7.28907251, -2781.30933, -0.128573, 2.62617483e-08, -0.991700053, 3.94706934e-10, 1, 2.6430369e-08, 0.991700053, 3.00680103e-09, -0.128573))
		wait(1)
		autofarm(tostring(toolname), "Warrior", nil, "ColosseumQuest", 1)

	elseif LocalPlayer.Data.Level.Value >= 275 and LocalPlayer.Data.Level.Value < 300 then
		teleport(CFrame.new(-1223.63818, 7.28907347, -3182.85132, 0.483049542, -3.85618115e-09, 0.875593007, 1.50635823e-11, 1, 4.39576908e-09, -0.875593007, -2.11018469e-09, 0.483049542))
		wait(1)
		autofarm(tostring(toolname), "Gladiator", nil, "ColosseumQuest", 2)

	elseif LocalPlayer.Data.Level.Value >= 300 and LocalPlayer.Data.Level.Value < 330 then
		teleport(CFrame.new(-5509.77148, 8.59067249, 8401.50684, -0.998448312, -6.22276808e-09, -0.0556865074, -3.02297587e-09, 1, -5.75450514e-08, 0.0556865074, -5.72874193e-08, -0.998448312))
		wait(1)
		autofarm(tostring(toolname), "Soldier", nil, "MagmaQuest", 1)

	elseif LocalPlayer.Data.Level.Value >= 330 and LocalPlayer.Data.Level.Value < 375 then
		teleport(CFrame.new(-5863.0498, 77.251709, 8858.89746, 0.199920639, 3.6500257e-08, -0.979812086, -5.66507126e-08, 1, 2.56933035e-08, 0.979812086, 5.03704349e-08, 0.199920639))
		wait(1)
		autofarm(tostring(toolname), "Spy", nil, "MagmaQuest", 2)

	elseif LocalPlayer.Data.Level.Value >= 375 and LocalPlayer.Data.Level.Value < 400 then
		teleport(CFrame.new(60867.6289, 18.4828224, 1577.58496, 0.025405515, -5.02673139e-08, -0.999677241, 3.65793262e-08, 1, -4.93539289e-08, 0.999677241, -3.53136578e-08, 0.025405515))
		wait(1)
		autofarm(tostring(toolname), "Fishman Warrior", nil, "FishmanQuest", 1)

	elseif LocalPlayer.Data.Level.Value >= 400 and LocalPlayer.Data.Level.Value < 425 then
		teleport(CFrame.new(61912.7852, 18.4828186, 1434.92773, -0.665761292, 2.24700969e-08, 0.746164799, -3.21811271e-08, 1, -5.88275455e-08, -0.746164799, -6.31775308e-08, -0.665761292))
		wait(1)
		autofarm(tostring(toolname), "Commando", nil, "FishmanQuest", 2)

	elseif LocalPlayer.Data.Level.Value >= 400 and LocalPlayer.Data.Level.Value < 425 then
		teleport(CFrame.new(-4696.40283, 845.276978, -1858.34204, -0.7335338, 4.7135746e-08, 0.679652929, 6.09196249e-08, 1, -3.60351637e-09, -0.679652929, 3.8760902e-08, -0.7335338))
		wait(1)
		autofarm(tostring(toolname), "God's Guard", nil, "SkyExp1Quest", 1)

	elseif LocalPlayer.Data.Level.Value >= 400 and LocalPlayer.Data.Level.Value < 425 then
		teleport(CFrame.new(-7641.76465, 5545.4917, -513.16803, -0.497225702, 9.03651625e-08, 0.867621243, 1.49193262e-08, 1, -9.56026511e-08, -0.867621243, -3.45917712e-08, -0.497225702))
		wait(1)
		autofarm(tostring(toolname), "Shanda", nil, "SkyExp1Quest", 2)

	elseif LocalPlayer.Data.Level.Value >= 400 and LocalPlayer.Data.Level.Value < 425 then
		teleport(CFrame.new(-7714.11816, 5610.58545, -1431.8667, 0.455687642, -5.21712593e-08, -0.890139759, -2.28576624e-09, 1, -5.97803336e-08, 0.890139759, 2.9275812e-08, 0.455687642))
		wait(1)
		autofarm(tostring(toolname), "Royal Squad", nil, "SkyExp2Quest", 1)

	elseif LocalPlayer.Data.Level.Value >= 400 and LocalPlayer.Data.Level.Value < 425 then
		teleport(CFrame.new(-7835.0542, 5606.87695, -1813.72021, -0.912228286, 2.86517281e-08, -0.409682304, 4.18481925e-08, 1, -2.32457609e-08, 0.409682304, -3.83499028e-08, -0.912228286))
		wait(1)
		autofarm(tostring(toolname), "Royal Soldier", nil, "SkyExp2Quest", 2)

	elseif LocalPlayer.Data.Level.Value >= 400 and LocalPlayer.Data.Level.Value < 425 then
		teleport(CFrame.new(5589.01758, 38.5386276, 3982.86963, 0.98995316, -4.44696457e-09, 0.141395777, 8.03524003e-09, 1, -2.4806587e-08, -0.141395777, 2.56935078e-08, 0.98995316))
		wait(1)
		autofarm(tostring(toolname), "Galley Pirate", nil, "FountainQuest", 1)

	elseif LocalPlayer.Data.Level.Value >= 400 and LocalPlayer.Data.Level.Value < 425 then
		teleport(CFrame.new(5477.20557, 38.4976692, 4949.44043, 0.935791492, 1.595469e-08, -0.352554023, 3.0879046e-09, 1, 5.34508864e-08, 0.352554023, -5.11075378e-08, 0.935791492))
		wait(1)
		autofarm(tostring(toolname), "Galley Captain", nil, "FountainQuest", 2)
	end
end
end

local page = venyx:addPage("Function", 5012544693)
local section1 = page:addSection("Main Function")
local section2 = page:addSection("ESP Function")

section1:addToggle("HitBox Extender", nil, function()
    wait(.8)
	for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
    	v.HumanoidRootPart.Size = Vector3.new(35, 35, 35)
    	v.HumanoidRootPart.Transparency = 0.5
	end
end)
section1:addToggle("Fruit Teleport", nil, function()
    wait(.8)
	for _,v in pairs (game:GetService("Workspace"):GetChildren()) do
		if v.Name:match('Fruit') and not v:IsA('Folder') and (v:IsA("Model") or v:IsA("Part")) then
		local stri = game:GetService("Players").LocalPlayer.Name
        	game:GetService("Workspace").Characters[stri].HumanoidRootPart.CFrame = v.Handle.CFrame
    	end
	end
end)
section1:addToggle("Flower Teleport", nil, function()
local h = game.Players.LocalPlayer.Character.HumanoidRootPart
local t = 10 --waiting time between tp
    for i , v in pairs (workspace:GetDescendants()) do
        local f = v
        if string.find(f.Name, "Flower") then
            if f.Transparency == 0 then
                h.CFrame = f.CFrame + Vector3.new(0,4,0)
                wait(t)
            end
        end
    end
end)

section2:addButton("Fruits ESP", function()
    fresp1()
end)
section2:addButton("Flowers ESP", function()
    flesp1()
end)
section2:addButton("Chests ESP", function()
    chesp1()
end)
section2:addButton("Close ESP", function()
    for i , v in pairs (workspace:GetDescendants()) do
        if string.find(v.Name, "BillboardGui") then
            v:Destroy()
        end
    end
end)

function fresp1()
	wait(.8)
	for i, v in pairs(workspace:GetChildren()) do
	    if v:IsA("Tool")  then
	        if v.Fruit then
	                local BillboardGui = Instance.new("BillboardGui")
			local TextLabel = Instance.new("TextLabel")
			BillboardGui.Parent = v.Fruit
			BillboardGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
			BillboardGui.Active = true
			BillboardGui.AlwaysOnTop = true
			BillboardGui.LightInfluence = 1
			BillboardGui.Size = UDim2.new(0, 100, 0, 25)
			TextLabel.Parent = BillboardGui
			TextLabel.BackgroundColor3 = Color3.new(1, 1, 1)
			TextLabel.BackgroundTransparency = 1
			TextLabel.BorderSizePixel = 0
			TextLabel.Size = UDim2.new(0, 100, 0, 25)
			TextLabel.Font = Enum.Font.SourceSans
			TextLabel.Text = v.Name
			TextLabel.TextColor3 = v.Fruit.Color
			TextLabel.TextScaled = true
			TextLabel.TextSize = 14
            TextLabel.TextWrapped = true
	        end
	    end
	    if v:IsA("Model") and v.Name == "Fruit " then
	      if v.Fruit then
	                local BillboardGui = Instance.new("BillboardGui")
			local TextLabel = Instance.new("TextLabel")
			BillboardGui.Parent = v
			BillboardGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
			BillboardGui.Active = true
			BillboardGui.AlwaysOnTop = true
			BillboardGui.LightInfluence = 1
			BillboardGui.Size = UDim2.new(0, 100, 0, 25)
			TextLabel.Parent = BillboardGui
			TextLabel.BackgroundColor3 = Color3.new(1, 1, 1)
			TextLabel.BackgroundTransparency = 1
			TextLabel.BorderSizePixel = 0
			TextLabel.Size = UDim2.new(0, 100, 0, 25)
			TextLabel.Font = Enum.Font.SourceSans
			TextLabel.Text = "Fruit"
			TextLabel.TextColor3 = v.Fruit.Color
			TextLabel.TextScaled = true
			TextLabel.TextSize = 14
            TextLabel.TextWrapped = true
	        end
	    end
	end
end

function flesp1()
	wait(.8)
	for i , v in pairs (workspace:GetDescendants()) do
	    if v:IsA("Part") then
	      	if string.find(v.Name, "Flower") then
	          	if v.Transparency == 0 then
		            local BillboardGui = Instance.new("BillboardGui")
		    		local TextLabel = Instance.new("TextLabel")
		    		BillboardGui.Parent = v
		    		BillboardGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
		    		BillboardGui.Active = true
		    		BillboardGui.AlwaysOnTop = true
		    		BillboardGui.LightInfluence = 1
		    		BillboardGui.Size = UDim2.new(0, 100, 0, 25)
		    		TextLabel.Parent = BillboardGui
		    		TextLabel.BackgroundColor3 = Color3.new(1, 1, 1)
		    		TextLabel.BackgroundTransparency = 1
		    		TextLabel.BorderSizePixel = 0
		    		TextLabel.Size = UDim2.new(0, 100, 0, 25)
		    		TextLabel.Font = Enum.Font.SourceSans
		    		TextLabel.Text = v.Name
		    		TextLabel.TextColor3 = v.Color
		    		TextLabel.TextScaled = true
		    		TextLabel.TextSize = 14
		    		TextLabel.TextWrapped = true
		    		if v.Name == "Flower1" then 
		    			TextLabel.Text = "Blue Flower"
		    		end
	    			if v.Name == "Flower2" then
	    		        TextLabel.Text = "Red Flower"
	    			end
	          	end
	     	end
    	end
	end
end

function chesp1()
	wait(.8)
	for i , v in pairs (workspace:GetDescendants()) do
		if string.find(v.Name, "Chest") then
    		if v:IsA("Part") then
      			if v.Transparency == 0 then
                	local BillboardGui = Instance.new("BillboardGui")
					local TextLabel = Instance.new("TextLabel")
					BillboardGui.Parent = v
					BillboardGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
					BillboardGui.Active = true
					BillboardGui.AlwaysOnTop = true
					BillboardGui.LightInfluence = 1
					BillboardGui.Size = UDim2.new(0, 100, 0, 25)
					TextLabel.Parent = BillboardGui
					TextLabel.BackgroundColor3 = Color3.new(1, 1, 1)
					TextLabel.BackgroundTransparency = 1
					TextLabel.BorderSizePixel = 0
					TextLabel.Size = UDim2.new(0, 100, 0, 25)
					TextLabel.Font = Enum.Font.SourceSans
					TextLabel.Text = "Chest"
					TextLabel.TextScaled = true
					TextLabel.TextSize = 14
					TextLabel.TextWrapped = true
					if v.Name == "Chest1" then 
					    TextLabel.TextColor3 = Color3.fromRGB(109,109,109)
					end
					if v.Name == "Chest2" then 
		    			TextLabel.TextColor3 = Color3.fromRGB(173,158,21)
					end
					if v.Name == "Chest3" then 
		    			TextLabel.TextColor3 = Color3.fromRGB(85, 255, 255)
					end
      			end
    		end
  		end
	end
end

local autofarmbot = venyx:addPage("Auto farm", 5012544693)
local autofarm1 = autofarmbot:addSection("Auto farm")


autofarm1:addButton("Open AutoFarm", function()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/LightMildTH/RobloxScripts/master/BloxFruitsAutoFarm.lua", true))()
end)

local islandstp = venyx:addPage("Islands Teleport", 5012544693)
local islandstp1 = islandstp:addSection("Islands Teleport")

islandstp1:addButton("Windmill", function()
    teleport(CFrame.new(1027.58875, 19.3245106, 1367.28564, -0.987686276, 0, -0.156449571, 0, 1, 0, 0.156449571, 0, -0.987686276))
end)
islandstp1:addButton("Marine Start", function()
    teleport(CFrame.new(-2573.3374, 6.88881826, 2046.99817, 0.0315897427, -3.02629779e-08, 0.99950093, -1.61048472e-08, 1, 3.0787092e-08, -0.99950093, -1.70693664e-08, 0.0315897427))
end)
islandstp1:addButton("Middle Town", function()
    teleport(CFrame.new(-582.941345, 6.70024586, 1713.93726, 0.965929627, 0, 0.258804798, 0, 1, 0, -0.258804798, 0, 0.965929627))
end)
islandstp1:addButton("Desert", function()
    teleport(CFrame.new(1094.14587, 5.28642607, 4192.88721, -0.499959469, 0, -0.866048813, 0, 1, 0, 0.866048813, 0, -0.499959469))
end)
islandstp1:addButton("Underwater City", function()
    teleport(CFrame.new(61348.6992, 19.4723511, 1475.9884, 0.999977648, 3.390076e-09, -0.00668252772, -3.52019325e-09, 1, -1.94595113e-08, 0.00668252772, 1.94826004e-08, 0.999977648))
end)
islandstp1:addButton("Pirate Village", function()
    teleport(CFrame.new(-1120.14856, 4.60001373, 3855.31763, 0.965929627, -0, -0.258804798, 0, 1, -0, 0.258804798, 0, 0.965929627))
end)
islandstp1:addButton("Jungle", function()
    teleport(CFrame.new(-1255.14795, 11.7000084, 349.906677, -0.173624277, 0, 0.984811902, 0, 1, 0, -0.984811902, 0, -0.173624277))
end)
islandstp1:addButton("Skylands 1", function()
    teleport(CFrame.new(-4967.83691, 718.535278, -2623.84326, 0.499959469, -0, -0.866048813, 0, 1, -0, 0.866048813, 0, 0.499959469))
end)
islandstp1:addButton("Skylands 2", function()
    teleport(CFrame.new(-7946.89844, 5546.35449, -318.856445, 0.998631775, -0, -0.0522932447, 0, 1, -0, 0.0522932447, 0, 0.998631775))
end)
islandstp1:addButton("Magma Village", function()
    teleport(CFrame.new(-5193.35498, 5.43863821, 8569.56348, 0.951068401, 0, 0.308980465, 0, 1, 0, -0.308980465, 0, 0.951068401))
end)
islandstp1:addButton("Frozen Village", function()
    teleport(CFrame.new(1185.63379, 7.15136719, -1143.36987, -0.484826207, 0, 0.874610603, 0, 1, 0, -0.874610603, 0, -0.484826207))
end)
islandstp1:addButton("Colosseum", function()
    teleport(CFrame.new(-1332.94006, 6.35386896, -2896.56055, -0.66911006, 0, 0.743163466, 0, 1, 0, -0.743163466, 0, -0.66911006))
end)
islandstp1:addButton("Fountain City", function()
    teleport(CFrame.new(5158.63184, 4.06925201, 4028.94678, -0.406715393, 0, 0.913554907, 0, 1, 0, -0.913554907, 0, -0.406715393))
end)
islandstp1:addButton("Military Fortress", function()
    teleport(CFrame.new(-4828.9751, 20.6520367, 4374.35791, -0.921316385, 5.66178571e-09, 0.388813794, -1.90244229e-08, 1, -5.96411383e-08, -0.388813794, -6.23453147e-08, -0.921316385))
end)
islandstp1:addButton("Prison", function()
    teleport(CFrame.new(5136.59277, 3.53421545, 785.520813, 0.392495215, 1.79353155e-08, -0.919754028, 5.72389602e-09, 1, 2.19427321e-08, 0.919754028, -1.38769947e-08, 0.392495215))
end)
islandstp1:addButton("Mob Island", function()
    teleport(CFrame.new(-2850.20068, 7.39224768, 5354.99268, -0.954083323, -1.62498637e-08, 0.299541265, -5.51723023e-09, 1, 3.66759672e-08, -0.299541265, 3.33392904e-08, -0.954083323))
end)

local npctp = venyx:addPage("NPC Teleport", 5012544693)
local npctp1 = npctp:addSection("NPC Teleport")

npctp1:addButton("Blox Fruit Dealer", function()
    teleport(CFrame.new(929.522095, 16.2735577, 1414.97876, 0.899172783, 4.64448071e-08, 0.437593818, -1.74091452e-09, 1, -1.02559547e-07, -0.437593818, 9.14569398e-08, 0.899172783))
end)
npctp1:addButton("Sword Dealer", function()
    teleport(CFrame.new(896.654968, 16.2735577, 1415.46326, 0.960151017, 6.38717665e-08, 0.279481769, -5.16753538e-08, 1, -5.10073441e-08, -0.279481769, 3.45324338e-08, 0.960151017))
end)
npctp1:addButton("Robotmega", function()
    teleport(CFrame.new(-1042.46753, 9.65220833, 1798.33276, -0.463136166, 3.6193363e-08, -0.886287153, 2.05997033e-08, 1, 3.00725311e-08, 0.886287153, -4.32957714e-09, -0.463136166))
end)
npctp1:addButton("Weapon Dealer", function()
    teleport(CFrame.new(-699.769958, 7.8522439, 1511.82874, -0.994642675, -1.24681945e-10, -0.103372596, -7.98733024e-11, 1, -4.37606756e-10, 0.103372596, -4.27005653e-10, -0.994642675))
end)
npctp1:addButton("Experienced Captain", function()
    teleport(CFrame.new(-1167.67517, 7.65220022, 1728.78625, 0.227724835, -5.93460001e-08, -0.973725498, -1.84367526e-08, 1, -6.52591581e-08, 0.973725498, 3.28134675e-08, 0.227724835))
end)
npctp1:addButton("Sword Dealer of the West", function()
    teleport(CFrame.new(-1279.10437, 13.7520418, 3987.9563, 0.879473627, 2.09187334e-08, -0.475947648, 2.18166658e-08, 1, 8.42653947e-08, 0.475947648, -8.44927825e-08, 0.879473627))
end)
npctp1:addButton("Dark Step Teacher", function()
    teleport(CFrame.new(-986.914307, 13.7520332, 3989.53906, -0.34373042, -7.47417133e-08, -0.939068377, -3.48726843e-08, 1, -6.68267717e-08, 0.939068377, 9.77744019e-09, -0.34373042))
end)
npctp1:addButton("Rich Man", function()
    teleport(CFrame.new(-910.340881, 13.7520332, 4078.03418, 0.0359374508, -8.95325201e-08, -0.999354064, 4.44851054e-08, 1, -8.79906779e-08, 0.999354064, -4.12942107e-08, 0.0359374508))
end)
npctp1:addButton("Hasan", function()
    teleport(CFrame.new(1323.8689, 15.8470068, 4486.11523, -0.120988391, -2.29662467e-09, 0.992653906, -8.92010554e-09, 1, 1.22640464e-09, -0.992653906, -8.70619754e-09, -0.120988391))
end)
npctp1:addButton("Sick Man", function()
    teleport(CFrame.new(1456.90527, 88.2521515, -1390.14209, 0.0210955944, -6.00558252e-08, -0.999777436, 4.02368556e-08, 1, -5.92201843e-08, 0.999777436, -3.89786159e-08, 0.0210955944))
end)
npctp1:addButton("Sword Dealer of the East", function()
    teleport(CFrame.new(1427.6499, 87.272789, -1386.89758, 0.255718648, -3.64401451e-08, -0.966751218, -2.0220764e-10, 1, -3.77468901e-08, 0.966751218, 9.84806903e-09, 0.255718648))
end)
npctp1:addButton("Water Kung-Fu Teacher", function()
    teleport(CFrame.new(61582.9453, 18.8707829, 987.406006, -0.0526548624, -3.74368412e-08, -0.998612761, -1.32623983e-08, 1, -3.67895474e-08, 0.998612761, 1.13068515e-08, -0.0526548624))
end)
npctp1:addButton("Advanced Weapon Dealer", function()
    teleport(CFrame.new(-4996.60107, 41.2520409, 4403.34912, 0.391164631, -2.81246173e-08, 0.92032069, 1.28958408e-08, 1, 2.50784531e-08, -0.92032069, 2.05850492e-09, 0.391164631))
end)
npctp1:addButton("Parlus", function()
    teleport(CFrame.new(-4929.12891, 96.3588943, 3865.88574, -0.999085486, 9.84941195e-09, -0.0427572541, 6.15332274e-09, 1, 8.65751701e-08, 0.0427572541, 8.62329017e-08, -0.999085486))
end)
npctp1:addButton("Master Sword Dealer", function()
    teleport(CFrame.new(-4752.28369, 717.65979, -2654.26636, 0.00111372699, -3.05615764e-08, -0.999999404, 3.16999538e-09, 1, -3.05580663e-08, 0.999999404, -3.13595994e-09, 0.00111372699))
end)
npctp1:addButton("Living Skeleton", function()
    teleport(CFrame.new(-5463.93164, 8.59067345, 8880.62109, 0.764014959, -2.06507558e-08, -0.645198524, -1.26533219e-08, 1, -4.69903156e-08, 0.645198524, 4.40652066e-08, 0.764014959))
end)
npctp1:addButton("Freezeburg Quest Giver", function()
    teleport(CFrame.new(5256.18018, 38.5011292, 4049.67017, -0.0957989171, 1.70474657e-08, -0.995400727, 5.68388252e-08, 1, 1.16559766e-08, 0.995400727, -5.54607773e-08, -0.0957989171))
end)
npctp1:addButton("Military Detective", function()
    teleport(CFrame.new(4850.34326, 5.65141249, 719.42749, 0.46255511, -2.27731505e-08, -0.88659054, 1.7241969e-09, 1, -2.47866563e-08, 0.88659054, 9.93653781e-09, 0.46255511))
end)
npctp1:addButton("Remove Blox Fruit", function()
    teleport(CFrame.new(5663.9209, 64.6518173, 867.153503, 0.308496773, 2.42815386e-08, 0.9512254, -3.35425732e-08, 1, -1.46482231e-08, -0.9512254, -2.73876193e-08, 0.308496773))
end)
npctp1:addButton("Mad Scientist", function()
    teleport(CFrame.new(-5386.49609, 13.6096764, -2148.34766, 0.114722066, 1.01878264e-07, -0.993397653, -1.08903064e-08, 1, 1.01297715e-07, 0.993397653, -8.02677924e-10, 0.114722066))
end)
npctp1:addButton("Yoshi", function()
    teleport(CFrame.new(-4994.75781, 345.907166, -3001.85864, -0.526064157, 1.12686855e-07, -0.850444853, 7.57830279e-08, 1, 8.56259135e-08, 0.850444853, -1.94045651e-08, -0.526064157))
end)


local stat = venyx:addPage("Auto Stat", 5012544693)
local stat1 = stat:addSection("Select Stat")

stat1:addToggle("Melee", function(bool)
	_G.automelee = bool
end)

stat1:addToggle("Defense", function(bool)
	_G.autodefense = bool
end)

stat1:addToggle("Sword", function(bool)
	_G.autosword = bool
end)

stat1:addToggle("Gun", function(bool)
	_G.autogun = bool
end)

stat1:addToggle("Devil Fruit", function(bool)
	_G.autodf = bool
end)
game:GetService("RunService").Heartbeat:connect(function()
	if _G.automelee then
		wait(0.3)
		game:GetService("ReplicatedStorage").Remotes["CommF_"]:InvokeServer("AddPoint", "Melee", 1)
	end
	if _G.autodefense then
		wait(0.3)
		game:GetService("ReplicatedStorage").Remotes["CommF_"]:InvokeServer("AddPoint", "Defense", 1)
	end
	if _G.autosword then
		wait(0.3)
		game:GetService("ReplicatedStorage").Remotes["CommF_"]:InvokeServer("AddPoint", "Sword", 1)
	end
	if _G.autogun then
		wait(0.3)
		game:GetService("ReplicatedStorage").Remotes["CommF_"]:InvokeServer("AddPoint", "Gun", 1)
	end
	if _G.autodf then
		wait(0.3)
		game:GetService("ReplicatedStorage").Remotes["CommF_"]:InvokeServer("AddPoint", "Demon Fruit", 1)
	end
	if _G.noclip then
		LocalPlayer.Character.Humanoid:ChangeState(11)
	end
end)

local misc = venyx:addPage("Misc", 5012544693)
local misc1 = misc:addSection("Select Menu")

misc1:addButton("No Dodge Cooldown", function(bool)
    _G.nododgecool = bool
	NoDodgeCool()
end)
misc1:addButton("Fullbright", function()
    fullbright()
end)
misc1:addButton("Noclip", function(bool)
    _G.noclip = bool
end)
misc1:addButton("Respawn", function()
    local Character = LocalPlayer.Character
	Character.HumanoidRootPart:Destroy()
end)


local theme = venyx:addPage("Theme", 5012544693)
local colors = theme:addSection("Colors")
for theme, color in pairs(themes) do
    colors:addColorPicker(theme, color, function(color3)
    venyx:setTheme(theme, color3)
    end)
end


local settings = venyx:addPage("Settings", 5012544693)
local keycode = settings:addSection("Show/Hide GUI")
keycode:addKeybind("Toggle Keybind", Enum.KeyCode.Insert, function()
print("Activated Keybind")
venyx:toggle()
end, function()
    print("Changed Keybind")
end)

venyx:SelectPage(venyx.pages[1], true)
