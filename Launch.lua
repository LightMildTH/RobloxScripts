--// idk its nice \\--

local is_synapse_function = is_synapse_function or issentinelclosure
local Library
local uESP
local Utils = {}
local Library
local TweenService = game:GetService("TweenService")
local window 
local universal
local loopAPI = {}
local LoopThreads = {}
local Games = {
	[2753915549] = "Blox Fruits",
	[2317712696] = "The Wild West",
}
local GameName = Games[game.PlaceId] or (function() -- solution for multiple places in a game
	local Game = "No Game Detected"
	return Game
end)()
local function Resize (part,new,_delay)
	_delay = _delay or 0.5
	local tweenInfo = TweenInfo.new(_delay, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
	local tween = TweenService:Create(part, tweenInfo, new)
	tween:Play()
end
do -- Loop API (since jailtapper)
	local function CreateThread(func) 
		local thread = coroutine.create(func)
		coroutine.resume(thread)
	end
	function loopAPI:CreateLoop(name, WaitMethod, func, runLoop) 
		LoopThreads[name] = {}
		LoopThreads[name]["running"] = false
		LoopThreads[name]["destroy"] = false
		CreateThread(function() 
			while true do 
				if typeof(WaitMethod) == "userdata" then WaitMethod:Wait() else WaitMethod() end
				if LoopThreads[name]["running"] then 
					func()
				end
				if LoopThreads[name]["destroy"] then 
					LoopThreads[name] = nil
					break
				end
			end
		end)
		if runLoop then 
			self:RunLoop(name)
		end
	end
	function loopAPI:RunLoop(name, WaitMethod, func) 
		if LoopThreads[name] then 
			LoopThreads[name]["running"] = true
		end
	end
	function loopAPI:StopLoop(name) 
		if LoopThreads[name] then 
			LoopThreads[name]["running"] = false
		end
	end
	function loopAPI:DestroyLoop(name) 
		if LoopThreads[name] then 
			LoopThreads[name]["destroy"] = true
		end
	end
end
local function CreateDrag(gui)
	local UserInputService = game:GetService("UserInputService")
	local dragging
	local dragInput
	local dragStart
	local startPos
	
	local function update(input)
		local delta = input.Position - dragStart
		Resize(gui, {Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)}, 0.16)
	end
	
	gui.InputBegan:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
			dragging = true
			dragStart = input.Position
			startPos = gui.Position
			
			input.Changed:Connect(function()
				if input.UserInputState == Enum.UserInputState.End then
					dragging = false
				end
			end)
		end
	end)
	
	gui.InputChanged:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
			dragInput = input
		end
	end)
	
	UserInputService.InputChanged:Connect(function(input)
		if input == dragInput and dragging then
			update(input)
		end
	end)
end
do -- UI Library 

	--// Services \\--
	local TweenService = game:GetService("TweenService")
	local RunService = game:GetService("RunService")
	local UserInputService = game:GetService("UserInputService")
	local CoreGui = RunService:IsStudio() and game:GetService("Players").LocalPlayer.PlayerGui or game:GetService("CoreGui")

	--// Functions \\--
	local BlacklistedKeys = { --add or remove keys if you find the need to
		Enum.KeyCode.Unknown,Enum.KeyCode.W,Enum.KeyCode.A,Enum.KeyCode.S,Enum.KeyCode.D,Enum.KeyCode.Slash,Enum.KeyCode.Tab,Enum.KeyCode.Backspace,Enum.KeyCode.One,Enum.KeyCode.Two,Enum.KeyCode.Three,Enum.KeyCode.Four,Enum.KeyCode.Five,Enum.KeyCode.Six,Enum.KeyCode.Seven,Enum.KeyCode.Eight,Enum.KeyCode.Nine,Enum.KeyCode.Zero,Enum.KeyCode.Escape,Enum.KeyCode.F1,Enum.KeyCode.F2,Enum.KeyCode.F3,Enum.KeyCode.F4,Enum.KeyCode.F5,Enum.KeyCode.F6,Enum.KeyCode.F7,Enum.KeyCode.F8,Enum.KeyCode.F9,Enum.KeyCode.F10,Enum.KeyCode.F11,Enum.KeyCode.F12
	}

	local WhitelistedMouseInputs = { --add or remove mouse inputs if you find the need to
		Enum.UserInputType.MouseButton1,Enum.UserInputType.MouseButton2,Enum.UserInputType.MouseButton3
	}

	local function keyCheck(x,x1)
		for _,v in next, x1 do
			if v == x then 
				return true
			end 
		end
	end

	local function Round(num, bracket)
		bracket = bracket or 1
		local a = math.floor(num/bracket + (math.sign(num) * 0.5)) * bracket
		if a < 0 then
			a = a + bracket
		end
		return a
	end

	local function AddHighlight(obj)
		local InContact
		obj.InputBegan:connect(function(input)
			if input.UserInputType == Enum.UserInputType.MouseMovement then
				InContact = true
				TweenService:Create(obj, TweenInfo.new(0.2), {BackgroundTransparency = 0.9}):Play()
			end
			if input.UserInputType == Enum.UserInputType.MouseButton1 then
				TweenService:Create(obj, TweenInfo.new(0.4), {BackgroundTransparency = 0.8}):Play()
			end
		end)
		obj.InputEnded:connect(function(input)
			if input.UserInputType == Enum.UserInputType.MouseMovement then
				InContact = false
				TweenService:Create(obj, TweenInfo.new(0.4), {BackgroundTransparency = 1}):Play()
			end
			if input.UserInputType == Enum.UserInputType.MouseButton1 and InContact then
				TweenService:Create(obj, TweenInfo.new(0.2), {BackgroundTransparency = 0.9}):Play()
			end
		end)
	end

	local DDCheck
	local ExtFrames = {}
	local function CloseExt()
		if not DDCheck then return end
		DDCheck.Closed = true
		DDCheck.Container.Size = UDim2.new(DDCheck.Container.Size.X.Scale, DDCheck.Container.Size.X.Offset, 0, 0)
		if DDCheck.Closed then DDCheck.Main.Parent.Parent.ClipsDescendants = true end
		if DDCheck.Arrow then
			DDCheck.Arrow.Text = ">"
		end
		for _,v in next, ExtFrames do
			v.Parent = nil
		end
		DDCheck = nil
	end
	for i=1,4 do
		local Frame = Instance.new("Frame")
		Frame.ZIndex = 50
		Frame.BackgroundTransparency = 1
		Frame.Visible = true
		if i == 1 then
			Frame.Size = UDim2.new(0,1000,0,-1000)
		elseif i == 2 then
			Frame.Size = UDim2.new(0,1000,0,1000)
			Frame.Position = UDim2.new(1,0,0,0)
		elseif i == 3 then
			Frame.Size = UDim2.new(0,-1000,0,1000)
			Frame.Position = UDim2.new(1,0,1,0)
		elseif i == 4 then
			Frame.Size = UDim2.new(0,-1000,0,-1000)
			Frame.Position = UDim2.new(0,0,1,0)
		end
		table.insert(ExtFrames, Frame)
		Frame.InputBegan:connect(function(input)
			if input.UserInputType == Enum.UserInputType.MouseButton1 then
				CloseExt()
			end
		end)
	end

	local function CloseWindow(Obj)
		for _,v in next, ExtFrames do
			DDCheck = Obj
			v.Parent = Obj.Container
		end
	end

	local ChromaColor
	spawn(function()
		local a = 0
		while wait() do
			ChromaColor = Color3.fromHSV(a,1,1)
			a = a >= 1 and 0 or a + 0.01
		end
	end)

	--LIBRARY
	Library = {Tabs = {}, FocusedTab = nil, Open = true}

	Library.settings = {
		UiToggle = Enum.KeyCode.RightShift,
		Theme = Color3.fromRGB(255,65,65)
	}

	UserInputService.InputBegan:connect(function(input)
		if input.KeyCode == Library.settings.UiToggle and Library.Base then
			Library.Open = not Library.Open
			if Library.FocusedTab then
				if Library.Open then
					Library.Base.Enabled = true
					for _,Tab in next, Library.Tabs do
						Tab.ButtonHolder.Visible = Tab.Visible
					end
				else
					CloseExt()
					for _,Tab in next, Library.Tabs do
						Tab.ButtonHolder.Visible = false
					end
					Library.Base.Enabled = false
				end
			end
		end
	end)

	UserInputService.InputChanged:connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseMovement and Library.Pointer then
			local Mouse = UserInputService:GetMouseLocation() + Vector2.new(0,-36)
			Library.Pointer.Position = UDim2.new(0,Mouse.X,0,Mouse.Y)
		end
	end)

	function Library:Create(class, properties)
		local inst = Instance.new(class)
		for property, value in pairs(properties) do
			inst[property] = value
		end
		return inst
	end

	function Library:CreateTab(TabName)
		local Tab = {Sections = {}, Visible = true}
		
		self.Base = self.Base or self:Create("ScreenGui", {
			ZIndexBehavior = Enum.ZIndexBehavior.Global,
			Parent = CoreGui
		})
		
		self.Line = self.Line or self:Create("Frame", {
			AnchorPoint = Vector2.new(0.5,0),
			Position = UDim2.new(0.5,0,1,0),
			Size = UDim2.new(0,0,0,-2),
			BackgroundColor3 = Library.settings.Theme,
			BorderSizePixel = 0
		})
		
		self.Pointer = self.Pointer or self:Create("Frame", {
			ZIndex = 100,
			AnchorPoint = Vector2.new(0,0),
			Size = UDim2.new(0,4,0,4),
			BackgroundColor3 = Color3.fromRGB(255,255,255),
			Parent = self.Base
		})
		
		self.PointerDot = self.PointerDot or self:Create("Frame", {
			ZIndex = 100,
			Size = UDim2.new(0,2,0,2),
			BackgroundColor3 = Library.settings.Theme,
			BorderSizePixel = 0,
			Parent = self.Pointer
		})
		
		Tab.XPos = 5 + (#self.Tabs * 205)
		
		Tab.ButtonHolder = self:Create("Frame", {
			Position = UDim2.new(0,Tab.XPos,0,5),
			Size = UDim2.new(0,200,0,28),
			BackgroundColor3 = Color3.fromRGB(40,40,40),
			BorderSizePixel = 0,
			Parent = self.Base
		})
		
		Tab.Button = self:Create("TextButton", {
			Size = UDim2.new(1,0,1,0),
			BackgroundTransparency = 1,
			BackgroundColor3 = Color3.fromRGB(255,255,255),
			BorderSizePixel = 0,
			Text = TabName,
			TextSize = 18,
			TextColor3 = Color3.fromRGB(255,255,255),
			Font = Enum.Font.SourceSans,
			AutoButtonColor = false,
			Modal = true,
			Parent = Tab.ButtonHolder
		})
		
		Tab.Main = self:Create("Frame", {
			ZIndex = -10,
			Position = UDim2.new(0,0,0,-36),
			Size = UDim2.new(1,0,1,36),
			BackgroundTransparency = 1,
			BackgroundColor3 = Color3.new(),
			Visible = false,
			Parent = self.Base
		})
		
		AddHighlight(Tab.Button)
		
		self.FocusOnTab = self.FocusOnTab or function(t)
			if self.FocusedTab then
				self.FocusedTab.Main.Visible = false
			end
			self.FocusedTab = t
			self.FocusedTab.Main.Visible = true
		end
		
		Tab.Button.MouseButton1Click:connect(function()
			if self.FocusedTab ~= Tab then
				if DDCheck then
					DDCheck.Main.Parent.Parent.ClipsDescendants = true
				end
				self.FocusOnTab(Tab)
			end
		end)
		
		if not self.FocusedTab then
			self.FocusOnTab(Tab)
		end
		
		function Tab:AddSection(SectionName)
			local Section = {Options = {}}
			Section.YSize = 24
			
			Section.Main = Library:Create("Frame", {
				Position = UDim2.new(0,5 + (#self.Sections * 205),0,74),
				Size = UDim2.new(0,200,0,24),
				BackgroundColor3 = Color3.fromRGB(20,20,20),
				BorderSizePixel = 0,
				ClipsDescendants = true,
				Parent = self.Main
			})
			
			Section.Label = Library:Create("TextLabel", {
				Size = UDim2.new(1,0,0,24),
				BackgroundColor3 = Color3.fromRGB(30,30,30),
				BorderSizePixel = 0,
				Text = SectionName,
				TextSize = 16,
				TextColor3 = Color3.fromRGB(255,255,255),
				Font = Enum.Font.SourceSans,
				Parent = Section.Main
			})
			
			Section.Content = Library:Create("Frame", {
				Position = UDim2.new(0,0,0,24),
				Size = UDim2.new(1,0,1,-24),
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				Parent = Section.Main
			})
			
			Section.Layout = Library:Create("UIListLayout", {
				SortOrder = Enum.SortOrder.LayoutOrder,
				Parent = Section.Content
			})
			
			function Section:AddLabel(LabelText)
				local Label = {}
				
				Label.Main = Library:Create("TextLabel", {
					LayoutOrder = #self.Options + 1,
					Size = UDim2.new(1,0,0,22),
					BackgroundTransparency = 1,
					Text = " "..LabelText,
					TextSize = 16,
					TextColor3 = Color3.fromRGB(255,255,255),
					Font = Enum.Font.SourceSans,
					TextXAlignment = Enum.TextXAlignment.Left,
					Parent = self.Content
				})
				
				Section.YSize = Section.YSize + 22
				Section.Main.Size = UDim2.new(0,200,0,Section.YSize)
				table.insert(self.Options, Label)
				return Label
			end
			
			function Section:AddButton(ButtonText, Callback)
				local Button = {}
				Callback = Callback or function() end
				
				Button.Main = Library:Create("TextButton", {
					LayoutOrder = #self.Options + 1,
					Size = UDim2.new(1,0,0,22),
					BackgroundTransparency = 1,
					BackgroundColor3 = Color3.fromRGB(220,220,220),
					BorderSizePixel = 0,
					Text = " "..ButtonText,
					TextSize = 16,
					TextColor3 = Color3.fromRGB(255,255,255),
					Font = Enum.Font.SourceSans,
					TextXAlignment = Enum.TextXAlignment.Left,
					AutoButtonColor = false,
					Parent = self.Content
				})
				
				AddHighlight(Button.Main)
				
				Button.Main.MouseButton1Click:connect(function()
					Callback()
				end)
				
				Section.YSize = Section.YSize + 22
				Section.Main.Size = UDim2.new(0,200,0,Section.YSize)
				table.insert(self.Options, Button)
				return Button
			end
			
			function Section:AddToggle(ToggleText, Callback)
				local Toggle = {State = false, Callback = Callback}
				Toggle.Callback = Callback or function() end
				
				Toggle.Main = Library:Create("TextButton", {
					LayoutOrder = #self.Options + 1,
					Size = UDim2.new(1,0,0,22),
					BackgroundTransparency = 1,
					BackgroundColor3 = Color3.fromRGB(220,220,220),
					BorderSizePixel = 0,
					Text = " "..ToggleText,
					TextSize = 16,
					TextColor3 = Color3.fromRGB(255,255,255),
					Font = Enum.Font.SourceSans,
					TextXAlignment = Enum.TextXAlignment.Left,
					AutoButtonColor = false,
					Parent = self.Content
				})
				
				Toggle.Visualize = Library:Create("Frame", {
					Position = UDim2.new(1,-2,0,2),
					Size = UDim2.new(0,-18,0,18),
					BackgroundColor3 = Color3.fromRGB(35,35,35),
					BorderSizePixel = 0,
					Parent = Toggle.Main
				})
				
				AddHighlight(Toggle.Main)
				
				local on = TweenService:Create(Toggle.Visualize, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {BackgroundColor3 = Library.settings.Theme})
				local off = TweenService:Create(Toggle.Visualize, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {BackgroundColor3 = Color3.fromRGB(35,35,35)})
				
				function Toggle:SetToggle(State)
					Toggle.State = State
					if Toggle.State then
						on:Play()
					else
						off:Play()
					end
					Toggle.Callback(Toggle.State)
				end
				
				Toggle.Main.MouseButton1Click:connect(function()
					Toggle:SetToggle(not Toggle.State)
				end)
				
				Section.YSize = Section.YSize + 22
				Section.Main.Size = UDim2.new(0,200,0,Section.YSize)
				table.insert(self.Options, Toggle)
				return Toggle
			end
			
			function Section:AddBox(BoxText, Callback)
				local Box = {Callback = Callback}
				Box.Callback = Callback or function() end
				
				Box.Main = Library:Create("TextButton", {
					LayoutOrder = #self.Options + 1,
					Size = UDim2.new(1,0,0,42),
					BackgroundTransparency = 1,
					BackgroundColor3 = Color3.fromRGB(220,220,220),
					BorderSizePixel = 0,
					Text = " "..BoxText,
					TextSize = 16,
					TextColor3 = Color3.fromRGB(255,255,255),
					Font = Enum.Font.SourceSans,
					TextXAlignment = Enum.TextXAlignment.Left,
					TextYAlignment = Enum.TextYAlignment.Top,
					AutoButtonColor = false,
					Parent = self.Content
				})
				
				Box.Box = Library:Create("TextBox", {
					Position = UDim2.new(0,2,0,20),
					Size = UDim2.new(1,-4,0,20),
					BackgroundColor3 = Color3.fromRGB(35,35,35),
					BorderSizePixel = 0,
					Text = "",
					TextColor3 = Color3.fromRGB(240,240,240),
					ClipsDescendants = true,
					Parent = Box.Main
				})
				
				AddHighlight(Box.Main)
				
				Box.Main.MouseButton1Click:connect(function()
					Box.Box:CaptureFocus()
				end)
				
				Box.Box.FocusLost:connect(function(EnterPressed)
					TweenService:Create(Box.Main, TweenInfo.new(0.4), {BackgroundTransparency = 1}):Play()
					Box.Callback(Box.Box.Text, EnterPressed)
				end)
				
				Section.YSize = Section.YSize + 42
				Section.Main.Size = UDim2.new(0,200,0,Section.YSize)
				table.insert(self.Options, Box)
				return Box
			end
			
			function Section:AddDropdown(DropdownText, Options, Callback, Groupbox)
				if Options then
					if typeof(Options) == "function" then
						Callback = Options
						Options = {}
					end
					if typeof(Options) == "boolean" then
						Groupbox = Options
						Callback = typeof(Options) == "function" and Options or function() end
						Options = {}
					end
				end
				if Callback and typeof(Callback) == "boolean" then
					Groupbox = Callback
					Callback = function() end
				end
				local Dropdown = {Order = 0, Closed = true, Value = Groupbox and nil or Options[1], Callback = Callback, Selected = {}}
				Dropdown.Callback = Callback or function() end
				
				Dropdown.Main = Library:Create("TextButton", {
					LayoutOrder = #self.Options + 1,
					Size = UDim2.new(1,0,0,42),
					BackgroundTransparency = 1,
					BackgroundColor3 = Color3.fromRGB(220,220,220),
					BorderSizePixel = 0,
					Text = " "..DropdownText,
					TextSize = 16,
					TextColor3 = Color3.fromRGB(255,255,255),
					Font = Enum.Font.SourceSans,
					TextXAlignment = Enum.TextXAlignment.Left,
					TextYAlignment = Enum.TextYAlignment.Top,
					AutoButtonColor = false,
					Parent = self.Content
				})
				
				Dropdown.Label = Library:Create("TextLabel", {
					Position = UDim2.new(0,2,0,20),
					Size = UDim2.new(1,-4,0,20),
					BackgroundColor3 = Color3.fromRGB(35,35,35),
					BorderSizePixel = 0,
					Text = Groupbox and "" or Dropdown.Value,
					TextSize = 16,
					TextColor3 = Color3.fromRGB(255,255,255),
					TextTruncate = Enum.TextTruncate.AtEnd,
					Font = Enum.Font.SourceSans,
					Parent = Dropdown.Main
				})
				
				Dropdown.Arrow = Library:Create("TextLabel", {
					Position = UDim2.new(1,0,0,2),
					Size = UDim2.new(0,-16,0,16),
					Rotation = 90,
					BackgroundTransparency = 1,
					Text = ">",
					TextColor3 = Color3.fromRGB(80,80,80),
					Font = Enum.Font.Arcade,
					TextSize = 18,
					Parent = Dropdown.Label
				})
				
				Dropdown.Container = Library:Create("Frame", {
					ZIndex = 2,
					Position = UDim2.new(0,0,1,2),
					Size = UDim2.new(1,0,0,0),
					BackgroundTransparency = 1,
					Parent = Dropdown.Label
				})
				
				Dropdown.SubContainer = Library:Create("Frame", {
					Size = UDim2.new(1,0,1,0),
					BackgroundTransparency = 1,
					ClipsDescendants = true,
					Parent = Dropdown.Container
				})
				
				Dropdown.Contentholder = Library:Create("ScrollingFrame", {
					ZIndex = 2,
					Size = UDim2.new(1,0,1,0),
					BackgroundColor3 = Color3.fromRGB(40,40,40),
					BorderColor3 = Color3.fromRGB(30,30,30),
					ScrollBarThickness = 6,
					ScrollBarImageColor3 = Color3.fromRGB(80,80,80),
					BottomImage = "rbxasset://textures/ui/Scroll/scroll-middle.png",
					TopImage = "rbxasset://textures/ui/Scroll/scroll-middle.png",
					Parent = Dropdown.SubContainer
				})
				
				Dropdown.Layout = Library:Create("UIListLayout", {
					Padding = UDim.new(0,0),
					SortOrder = Enum.SortOrder.LayoutOrder,
					Parent = Dropdown.Contentholder
				})
				
				AddHighlight(Dropdown.Main)
				
				Dropdown.Main.InputBegan:connect(function(input)
					if input.UserInputType == Enum.UserInputType.MouseButton1 then
						Dropdown.Closed = not Dropdown.Closed
						if Dropdown.Closed then
							Dropdown.Arrow.Text = ">"
							Dropdown.Container:TweenSize(UDim2.new(1,0,0,0), "Out", "Quad", 0.2, true, function() if Dropdown.Closed then self.Main.ClipsDescendants = true end end)
						else
							CloseWindow(Dropdown)
							self.Main.ClipsDescendants = false
							Dropdown.Arrow.Text = "<"
							if Dropdown.Order > 5 then
								Dropdown.Container:TweenSize(UDim2.new(1,0,0,5*20), "Out", "Quad", 0.3, true)
							else
								Dropdown.Container:TweenSize(UDim2.new(1,0,0,Dropdown.Order*20), "Out", "Quad", 0.3, true)
							end
						end
					end
				end)
				
				local SelectedCount = 0
				local function AddOptions(Options)
					for _,value in pairs(Options) do
						Dropdown.Order = Dropdown.Order + 1
						local State
						local Pos = Dropdown.Order
						
						local Option = Library:Create("TextButton", {
							ZIndex = 3,
							LayoutOrder = Dropdown.Order,
							Size = UDim2.new(1,0,0,20),
							BackgroundTransparency = 1,
							BackgroundColor3 = Color3.fromRGB(255,255,255),
							Text = value,
							TextSize = 16,
							TextColor3 = Color3.fromRGB(240,240,240),
							Font = Enum.Font.SourceSans,
							AutoButtonColor = false,
							Parent = Dropdown.Contentholder
						})
						
						AddHighlight(Option)
						
						Option.MouseButton1Click:connect(function()
							Dropdown.Value = value
							if Groupbox then
								State = not State
								SelectedCount = SelectedCount + (State and 1 or -1)
								if State then
									Option.BackgroundColor3 = Library.settings.Theme
									Dropdown.Selected[value] = value
								else
									Option.BackgroundColor3 = Color3.fromRGB(255,255,255)
									Dropdown.Selected[value] = nil
								end
								local Text = ""
								for _,v in next, Dropdown.Selected do
									Text = SelectedCount > 1 and Text .. v .. ", " or Text .. v
								end
								Dropdown.Label.Text = SelectedCount > 1 and string.sub(Text, 1, string.len(Text) - 2) or Text
								if not State then return end
							else
								self.Main.ClipsDescendants = true
								Dropdown.Label.Text = Dropdown.Value
								Dropdown.Closed = true
								Dropdown.Arrow.Text = ">"
								Dropdown.Container:TweenSize(UDim2.new(1,0,0,0), "Out", "Quad", 0.2, true)
							end
							Dropdown.Callback(Dropdown.Value)
						end)
						Dropdown.Contentholder.CanvasSize = UDim2.new(0,0,0,Dropdown.Order*20)
					end
				end
				
				AddOptions(Options)

				if Groupbox then
					function Dropdown:IsSelected(Value)
						for _, v in next, self.Selected do
							if v == Value then
								return true
							end
						end
						return false
					end
				end
				
				function Dropdown:Refresh(options, keep)
					if not keep then
						Dropdown.Selected = {}
						Dropdown.Label.Text = Groupbox and "" or options[1]
						for _,v in pairs(Dropdown.Contentholder:GetChildren()) do
							if v:IsA"TextButton" then
								v:Destroy()
								Dropdown.Order = Dropdown.Order - 1
								Dropdown.Contentholder.CanvasSize = UDim2.new(0,0,0,Dropdown.Layout.AbsoluteContentSize.Y)
							end
						end
					end
					AddOptions(options)
				end
				
				if not Groupbox then
					function Dropdown:SetValue(value)
						Dropdown.Value = value
						Dropdown.Label.Text = Dropdown.Value
						Dropdown.Callback(Dropdown.Value)
					end
				end
				
				Section.YSize = Section.YSize + 42
				Section.Main.Size = UDim2.new(0,200,0,Section.YSize)
				table.insert(self.Options, Dropdown)
				return Dropdown
			end
			
			function Section:AddKeybind(BindText, BindKey, Callback, Hold)
				if BindKey then
					if typeof(BindKey) == "function" then
						Hold = Callback or false
						Callback = BindKey
						BindKey = Enum.KeyCode.F
					end
					if typeof(BindKey) == "string" then
						if not keyCheck(Enum.KeyCode[BindKey:upper()], BlacklistedKeys) then
							BindKey = Enum.KeyCode[BindKey:upper()]
						end
						if keyCheck(BindKey, WhitelistedMouseInputs) then
							BindKey = Enum.UserInputType[BindKey:upper()]
						end
					end
					if typeof(BindKey) == "boolean" then
						Hold = BindKey
						BindKey = Enum.KeyCode.F
					end
				end
				local Bind = {Binding = false, Holding = false, Key = BindKey, Hold = Hold, Callback = Callback}
				Bind.Callback = Callback or function() end
				
				local Bounds = game:GetService('TextService'):GetTextSize(Bind.Key.Name, 16, Enum.Font.SourceSans, Vector2.new(math.huge, math.huge))
				Bind.Main = Library:Create("TextButton", {
					LayoutOrder = #self.Options + 1,
					Size = UDim2.new(1,0,0,22),
					BackgroundTransparency = 1,
					BackgroundColor3 = Color3.fromRGB(220,220,220),
					Text = " "..BindText,
					TextSize = 16,
					TextColor3 = Color3.fromRGB(255,255,255),
					Font = Enum.Font.SourceSans,
					TextXAlignment = Enum.TextXAlignment.Left,
					AutoButtonColor = false,
					Parent = self.Content
				})
				
				Bind.Label = Library:Create("TextLabel", {
					Position = UDim2.new(1,-2,0,2),
					Size = UDim2.new(0,-Bounds.X-8,0,18),
					BackgroundColor3 = Color3.fromRGB(35,35,35),
					BorderSizePixel = 0,
					Text = Bind.Key.Name,
					TextSize = 16,
					TextColor3 = Color3.fromRGB(255,255,255),
					Font = Enum.Font.SourceSans,
					Parent = Bind.Main
				})
				
				AddHighlight(Bind.Main)
				
				Bind.Main.InputBegan:connect(function(input)
					if input.UserInputType == Enum.UserInputType.MouseButton1 then
						Bind.Label.Text = "..."
						Bind.Label.Size = UDim2.new(0,-Bind.Label.TextBounds.X-8,1,-4)
					end
				end)
				
				Bind.Main.InputEnded:connect(function(input)
					if input.UserInputType == Enum.UserInputType.MouseButton1 then
						Bind.Binding = true
					end
				end)
				
				local function SetKey(key)
					Bind.Key = key
					Bind.Label.Text = Bind.Key.Name
					if string.match(tostring(key), "Mouse") then
						Bind.Label.Text = string.sub(tostring(key), 20, 24)..string.sub(tostring(key), 31, 32)
					end
					Bind.Label.Size = UDim2.new(0,-Bind.Label.TextBounds.X-8,1,-4)
					Bind.Callback(Bind.Key)
				end
				
				local Loop
				local function DisconnectLoop()
					if Loop then
						Loop:Disconnect()
						Bind.Callback(true)
					end
				end

				UserInputService.InputBegan:connect(function(input)
					if Bind.Binding then
						if input.KeyCode == Enum.KeyCode.Backspace then
							SetKey(Bind.Key)
							Bind.Binding = false
						else
							if not keyCheck(input.KeyCode, BlacklistedKeys) then
								SetKey(input.KeyCode)
								Bind.Binding = false
							end
							if keyCheck(input.UserInputType, WhitelistedMouseInputs) then
								SetKey(input.UserInputType)
								Bind.Binding = false
							end
						end
						DisconnectLoop()
					else
						if not Library.Open then
							if input.KeyCode.Name == Bind.Key.Name or input.UserInputType.Name == Bind.Key.Name then
								Bind.Holding = true
								if Bind.Hold then
									Loop = RunService.RenderStepped:connect(function()
										Bind.Callback()
										if Library.Open or Bind.Holding == false or not Bind.Hold then
											DisconnectLoop()
										end
									end)
								else
									Bind.Callback()
								end
							end
						end
					end
				end)
				
				UserInputService.InputEnded:connect(function(input)
					if input.KeyCode.Name == Bind.Key.Name or input.UserInputType.Name == Bind.Key.Name then
						Bind.Holding = false
						DisconnectLoop()
					end
				end)
				
				function Bind:SetKeybind(Key)
					if typeof(Key) == "string" then
						if not keyCheck(Enum.KeyCode[Key:upper()], BlacklistedKeys) then
							Key = Enum.KeyCode[Key:upper()]
						end
						if keyCheck(Enum.KeyCode[Key:upper()], WhitelistedMouseInputs) then
							Key = Enum.UserInputType[Key:upper()]
						end
					end
					DisconnectLoop()
					SetKey(Key)
				end
				
				Section.YSize = Section.YSize + 22
				Section.Main.Size = UDim2.new(0,200,0,Section.YSize)
				table.insert(self.Options, Bind)
				return Bind
			end
			
			function Section:AddSlider(SliderText, MinVal, MaxVal, SetVal, Callback, Float)
				if SetVal and typeof(SetVal) == "function" then
					Float = Callback
					Callback = SetVal
					SetVal = 0
				end
				if Callback and typeof(Callback) == "number" then
					Float = Callback
					Callback = function() end
				end
				SetVal = SetVal or 0
				if SetVal > MaxVal then
					SetVal = MaxVal
				end
				if SetVal < MinVal then
					SetVal = MinVal
				end
				local Slider = {Value = SetVal, Callback = Callback}
				Slider.Callback = Callback or function() end
				Float = Float or 1
				
				Slider.Main = Library:Create("TextButton", {
					LayoutOrder = #self.Options + 1,
					Size = UDim2.new(1,0,0,42),
					BackgroundTransparency = 1,
					BackgroundColor3 = Color3.fromRGB(220,220,220),
					Text = " "..SliderText,
					TextSize = 16,
					TextColor3 = Color3.fromRGB(255,255,255),
					Font = Enum.Font.SourceSans,
					TextXAlignment = Enum.TextXAlignment.Left,
					TextYAlignment = Enum.TextYAlignment.Top,
					AutoButtonColor = false,
					Parent = self.Content
				})
				
				Slider.Holder = Library:Create("Frame", {
					Position = UDim2.new(0,0,0,18),
					Size = UDim2.new(1,0,0,17),
					BackgroundTransparency = 1,
					Parent = Slider.Main
				})
				
				Slider.Visualize = Library:Create("TextBox", {
					Position = UDim2.new(0,0,0.6,0),
					Size = UDim2.new(1,0,0.4,0),
					BackgroundTransparency = 1,
					Text = Slider.Value,
					TextSize = 16,
					TextColor3 = Color3.fromRGB(255,255,255),
					Font = Enum.Font.SourceSans,
					TextWrapped = true,
					Parent = Slider.Holder
				})
				
				Slider.Bar = Library:Create("Frame", {
					AnchorPoint = Vector2.new(0.5,0.5),
					Position = UDim2.new(0.5,0,0.2,0),
					Size = UDim2.new(1,-6,0,2),
					BackgroundColor3 = Color3.fromRGB(35,35,35),
					BorderSizePixel = 0,
					Parent = Slider.Holder
				})
				
				Slider.Fill = Library:Create("Frame", {
					BackgroundColor3 = Library.settings.Theme,
					BorderSizePixel = 0,
					Parent = Slider.Bar
				})
				if MinVal >= 0 then
					Slider.Fill.Size = UDim2.new((SetVal - MinVal) / (MaxVal - MinVal),0,1,0)
				else
					Slider.Fill.Position = UDim2.new((0 - MinVal) / (MaxVal - MinVal),0,0,0)
					Slider.Fill.Size = UDim2.new(SetVal / (MaxVal - MinVal),0,1,0)
				end
				
				Slider.Box = Library:Create("Frame", {
					AnchorPoint = Vector2.new(0.5,0.5),
					Position = UDim2.new((SetVal - MinVal) / (MaxVal - MinVal),0,0.5,0),
					Size = UDim2.new(0,4,0,12),
					BackgroundColor3 = Color3.fromRGB(5,5,5),
					BorderSizePixel = 0,
					Parent = Slider.Bar
				})
				
				AddHighlight(Slider.Main)
				
				function Slider:SetValue(Value)
					Value = Round(Value, Float)
					if Value >= MaxVal then
						Value = MaxVal
					end
					if Value <= MinVal then
						Value = MinVal
					end
					Slider.Box.Position = UDim2.new((Value - MinVal) / (MaxVal - MinVal),0,0.5,0)
					if MinVal >= 0 then
						Slider.Fill.Size = UDim2.new((Value - MinVal) / (MaxVal - MinVal),0,1,0)
					else
						Slider.Fill.Size = UDim2.new(Value / (MaxVal - MinVal),0,1,0)
					end
					Slider.Value = Value
					Slider.Visualize.Text = Value
					Slider.Callback(Value)
				end
				
				local Sliding
				local Modifying
				Slider.Main.InputBegan:connect(function(input)
					if input.UserInputType == Enum.UserInputType.MouseButton1 then
						if UserInputService:IsKeyDown(Enum.KeyCode.LeftControl) then
							Modifying = true
							Slider.Visualize:CaptureFocus()
						else
							Sliding = true
							Slider:SetValue(MinVal + ((input.Position.X - Slider.Bar.AbsolutePosition.X) / Slider.Bar.AbsoluteSize.X) * (MaxVal - MinVal))
							input.Changed:connect(function()
								if input.UserInputState == Enum.UserInputState.End then
									Sliding = false
								end
							end)
						end
					end
				end)
				
				Slider.Visualize.Focused:connect(function()
					if not Modifying then
						Slider.Visualize:ReleaseFocus()
					end
				end)
				
				Slider.Visualize.FocusLost:connect(function()
					if Modifying then
						if tonumber(Slider.Visualize.Text) then
							Slider:SetValue(tonumber(Slider.Visualize.Text))
						else
							Slider.Visualize.Text = Slider.Value
						end
					end
					Modifying = false
				end)
				
				UserInputService.InputChanged:connect(function(input)
					if Modifying then
						if input.KeyCode == Enum.KeyCode.Escape or input.KeyCode == Enum.KeyCode.Space then
							Slider.Visualize:ReleaseFocus()
						end
					end
					if input.UserInputType == Enum.UserInputType.MouseMovement and Sliding then
						Slider:SetValue(MinVal + ((input.Position.X - Slider.Bar.AbsolutePosition.X) / Slider.Bar.AbsoluteSize.X) * (MaxVal - MinVal))
					end
				end)
				
				Section.YSize = Section.YSize + 42
				Section.Main.Size = UDim2.new(0,200,0,Section.YSize)
				table.insert(self.Options, Slider)
				return Slider
			end
			
			function Section:AddCP(ColorText, NewColor, Alpha, Callback)
				if Alpha then
					if typeof(Alpha) == "function" then
						Callback = Alpha
						Alpha = 1
					end
				end
				if NewColor then
					if typeof(NewColor) == "function" then
						Callback = NewColor
						NewColor = Color3.fromRGB(255,255,255)
						Alpha = 1
					end
					if typeof(NewColor) == "number" then
						Callback = Alpha
						Alpha = NewColor
						NewColor = Color3.fromRGB(255,255,255)
					end
				end
				Alpha = Alpha or 1
				local Color = {Color = NewColor, Alpha = Alpha, Closed = true, Callback = Callback}
				Color.Callback = Callback or function() end
				local Rain
				local Hue, Sat, Val = Color3.toHSV(Color3.fromRGB(NewColor.r*255,NewColor.g*255,NewColor.b*255))
				if Hue == 0 then
					Hue = 1
				end
				
				Color.Main = Library:Create("TextButton", {
					LayoutOrder = #self.Options + 1,
					Size = UDim2.new(1,0,0,22),
					BackgroundTransparency = 1,
					BackgroundColor3 = Color3.fromRGB(220,220,220),
					Text = " "..tostring(ColorText),
					TextColor3 = Color3.fromRGB(255,255,255),
					Font = Enum.Font.SourceSans,
					TextSize = 16,
					TextXAlignment = Enum.TextXAlignment.Left,
					AutoButtonColor = false,
					Parent = self.Content,
				})
				
				Color.Visualizebg = Library:Create("ImageLabel", {
					Position = UDim2.new(1,-2,0,2),
					Size = UDim2.new(0,-18,0,18),
					BorderSizePixel = 0,
					Image = "rbxassetid://3887014957",
					ScaleType = Enum.ScaleType.Tile,
					TileSize = UDim2.new(0,9,0,9),
					Parent = Color.Main
				})
				
				Color.Visualize = Library:Create("Frame", {
					Size = UDim2.new(1,0,1,0),
					BackgroundTransparency = 1 - Color.Alpha,
					BackgroundColor3 = Color.Color,
					BorderSizePixel = 0,
					Parent = Color.Visualizebg,
				})
				
				Color.Container = Library:Create("Frame", {
					Position = UDim2.new(1,4,0,0),
					Size = UDim2.new(0,200,0,0),
					BackgroundColor3 = Color3.fromRGB(40,40,40),
					BorderSizePixel = 0,
					Parent = Color.Visualize
				})
				
				Color.SubContainer = Library:Create("Frame", {
					Size = UDim2.new(1,0,1,0),
					BackgroundTransparency = 1,
					ClipsDescendants = true,
					Parent = Color.Container
				})
				
				Color.SatVal = Library:Create("ImageLabel", {
					ZIndex = 2,
					Position = UDim2.new(0,5,0,5),
					Size = UDim2.new(1,-30,1,-30),
					BackgroundColor3 = Color3.fromHSV(Hue,1,1),
					BorderSizePixel = 0,
					Image = "rbxassetid://4155801252",
					Parent = Color.SubContainer
				})
				
				Color.Pointer = Library:Create("Frame", {
					ZIndex = 2,
					AnchorPoint = Vector2.new(0.5,0.5),
					Position = UDim2.new(Sat,0,1-Val,0),
					Size = UDim2.new(0,4,0,4),
					BackgroundTransparency = 0.4,
					BackgroundColor3 = Color3.fromRGB(255,255,255),
					BorderColor3 = Color3.fromRGB(0,0,0),
					Parent = Color.SatVal
				})
				
				Color.Hue = Library:Create("ImageLabel", {
					ZIndex = 2,
					AnchorPoint = Vector2.new(1,0),
					Position = UDim2.new(1,-5,0,5),
					Size = UDim2.new(0,15,1,-30),
					BackgroundTransparency = 0,
					Image = "rbxassetid://4174584406",
					Parent = Color.SubContainer
				})
				
				Color.Pointer1 = Library:Create("TextLabel", {
					ZIndex = 2,
					AnchorPoint = Vector2.new(0,0.5),
					Position = UDim2.new(1,-10,1-Hue,0),
					Size = UDim2.new(0,16,0,16),
					BackgroundTransparency = 1,
					Text = utf8.char(9668),
					TextColor3 = Color3.fromRGB(0,0,0),
					TextStrokeTransparency = 0,
					TextStrokeColor3 = Color3.fromRGB(130,130,130),
					TextSize = 6,
					Parent = Color.Hue
				})
				
				Color.Alphabg = Library:Create("ImageLabel", {
					ZIndex = 2,
					Position = UDim2.new(0,5,1,-20),
					Size = UDim2.new(1,-30,0,15),
					BorderSizePixel = 0,
					Image = "rbxassetid://3887014957",
					ScaleType = Enum.ScaleType.Tile,
					TileSize = UDim2.new(0,10,0,10),
					Parent = Color.SubContainer
				})
				
				Color.Alphaimg = Library:Create("ImageLabel", {
					ZIndex = 2,
					Size = UDim2.new(1,0,1,0),
					BackgroundTransparency = 1,
					Image = "rbxassetid://3887017050",
					ImageColor3 = NewColor,
					Parent = Color.Alphabg
				})
				
				Color.Pointer2 = Library:Create("TextLabel", {
					ZIndex = 2,
					AnchorPoint = Vector2.new(0.5,0),
					Position = UDim2.new(1 - Color.Alpha,0,1,-10),
					Size = UDim2.new(0,16,0,16),
					BackgroundTransparency = 1,
					Text = utf8.char(9650),
					TextColor3 = Color3.fromRGB(0,0,0),
					TextStrokeTransparency = 0,
					TextStrokeColor3 = Color3.fromRGB(130,130,130),
					TextSize = 6,
					Parent = Color.Alphabg
				})

				Color.Rainbow = Library:Create("Frame", {
					ZIndex = 2,
					AnchorPoint = Vector2.new(1,1),
					Position = UDim2.new(1,-5,1,-5),
					Size = UDim2.new(0,15,0,15),
					BackgroundTransparency = 0.4,
					BackgroundColor3 = Color3.fromRGB(20,20,20),
					BorderSizePixel = 0,
					Parent = Color.SubContainer
				})

				spawn(function()
					while wait() do
						Color.Rainbow.BackgroundColor3 = ChromaColor
					end
				end)
				
				AddHighlight(Color.Main)
				
				Color.Main.InputBegan:connect(function(input)
					if input.UserInputType == Enum.UserInputType.MouseButton1 then
						Color.Closed = not Color.Closed
						if Color.Closed then
							Color.Container:TweenSize(UDim2.new(0,200,0,0), "Out", "Quad", 0.2, true, function() if Color.Closed then self.Main.ClipsDescendants = true end end)
						else
							CloseWindow(Color)
							self.Main.ClipsDescendants = false
							Color.Container:TweenSize(UDim2.new(0,200,0,200), "Out", "Quad", 0.3, true)
						end
					end
				end)
				
				local Modifying
				local Modifying1
				local Modifying2
				
				function Color:UpdateSatVal(InputPos)    
					local x = (InputPos.X - Color.SatVal.AbsolutePosition.X) / Color.SatVal.AbsoluteSize.X
					local y = (InputPos.Y - Color.SatVal.AbsolutePosition.Y) / Color.SatVal.AbsoluteSize.Y
					x = tonumber(string.format("%.2f", x))
					y = tonumber(string.format("%.2f", y))
					y = y > 1 and 1 or y < 0 and 0 or y
					x = x > 1 and 1 or x < 0 and 0 or x
					Color.Pointer.Position = UDim2.new(x,0,y,0)
					Sat = x
					Val = 1-y
					Color.Color = Color3.fromHSV(Hue, Sat, Val)
					Color.Visualize.BackgroundColor3 = Color.Color
					Color.Alphaimg.ImageColor3 = Color.Color
					Color.Callback(Color.Color, Color.Alpha)
				end
				
				function Color:UpdateHue(InputPos)
					local y = (InputPos.Y - Color.Hue.AbsolutePosition.Y) / Color.Hue.AbsoluteSize.Y
					y = tonumber(string.format("%.2f", y))
					y = y > 1 and 1 or y < 0 and 0 or y
					Hue = 1-y
					Color.Color = Color3.fromHSV(Hue, Sat, Val)
					Color.Pointer1.Position = UDim2.new(1,-10,1-Hue,0)
					Color.Visualize.BackgroundColor3 = Color.Color
					Color.SatVal.BackgroundColor3 = Color3.fromHSV(Hue,1,1)
					Color.Alphaimg.ImageColor3 = Color.Color
					Color.Callback(Color.Color, Color.Alpha)
				end
				
				function Color:SetAlpha(Alpha)
					local x = (Alpha - Color.Alphabg.AbsolutePosition.X) / Color.Alphabg.AbsoluteSize.X
					x = tonumber(string.format("%.2f", x))
					x = x > 1 and 1 or x < 0 and 0 or x
					Color.Alpha = 1 - x
					Color.Pointer2.Position = UDim2.new(1 - Color.Alpha,0,1,-10)
					Color.Visualize.BackgroundTransparency = 1 - Color.Alpha
					Color.Callback(Color.Color, Color.Alpha)
				end
				
				UserInputService.InputChanged:connect(function(input)
					if not Rain and input.UserInputType == Enum.UserInputType.MouseMovement and Modifying or Modifying1 or Modifying2 then
						local Mouse = UserInputService:GetMouseLocation() + Vector2.new(0, -36)
						if Modifying then
							Color:UpdateSatVal(Mouse)
						end
						if Modifying1 then
							Color:UpdateHue(Mouse)
						end
						if Modifying2 then
							Color:SetAlpha(Mouse.X)
						end
					end
				end)
				
				Color.SatVal.InputBegan:connect(function(input)
					if not Rain and input.UserInputType == Enum.UserInputType.MouseButton1 then
						Modifying = true
						Color:UpdateSatVal(input.Position)
						input.Changed:connect(function()
							if input.UserInputState == Enum.UserInputState.End then
								Modifying = false
							end
						end)
					end
				end)
				
				Color.SatVal.InputChanged:connect(function(input)
					if not Rain and input.UserInputType == Enum.UserInputType.MouseMovement and Modifying then
						Color:UpdateSatVal(input.Position)
					end
				end)
				
				Color.Hue.InputBegan:connect(function(input)
					if not Rain and input.UserInputType == Enum.UserInputType.MouseButton1 then
						Modifying1 = true
						Color:UpdateHue(input.Position)
						input.Changed:connect(function()
							if input.UserInputState == Enum.UserInputState.End then
								Modifying1 = false
							end
						end)
					end
				end)
				
				Color.Hue.InputChanged:connect(function(input)
					if not Rain and input.UserInputType == Enum.UserInputType.MouseMovement and Modifying1 then
						Color:UpdateHue(input.Position)
					end
				end)
				
				Color.Alphabg.InputBegan:connect(function(input)
					if input.UserInputType == Enum.UserInputType.MouseButton1 then
						Modifying2 = true
						Color:SetAlpha(input.Position.X)
						input.Changed:connect(function()
							if input.UserInputState == Enum.UserInputState.End then
								Modifying2 = false
							end
						end)
					end
				end)
				
				Color.Alphabg.InputChanged:connect(function(input)
					if input.UserInputType == Enum.UserInputType.MouseMovement and Modifying2 then
						Color:SetAlpha(input.Position.X)
					end
				end)

				local OldColor
				local RainbowLoop
				Color.Rainbow.InputBegan:connect(function(input)
					if input.UserInputType == Enum.UserInputType.MouseButton1 then
						Rain = not Rain
						Color.Rainbow.BackgroundTransparency = Rain and 1 or 0.4
						if Rain then
							OldColor = Color.Color
							RainbowLoop = RunService.RenderStepped:connect(function()
								Color.Color = ChromaColor
								Color.Callback(Color.Color, Color.Alpha)
							end)
						else
							RainbowLoop:Disconnect()
							Color.Color = OldColor
							Color.Callback(Color.Color, Color.Alpha)
						end
					end
				end)
				
				Section.YSize = Section.YSize + 22
				Section.Main.Size = UDim2.new(0,200,0,Section.YSize)
				table.insert(self.Options, Color)
				return Color
			end
			
			table.insert(self.Sections, Section)
			return Section
		end
		
		table.insert(self.Tabs, Tab)
		return Tab
	end
end

--[[
do -- ESP Library
	local Players		= game:GetService'Players';
	local RunService	= game:GetService'RunService';
	local HttpService	= game:GetService'HttpService';
	local LocalPlayer	= Players.LocalPlayer;
	local Camera		= workspace.CurrentCamera;

	uESP = {
		Enabled = false;
		Settings = {
			Box3D			= false;
			DrawBox			= true;
			DrawDistance	= true;
			DrawNames		= true;
			DrawTracers		= false;
			MaxDistance		= 10000;
			RefreshRate		= 100;
			TextSize		= 18;
			TextOutline		= true;
			VisibilityCheck = false;
			TeamCheck = false;
			HeadDots = false;
			TeamColor = Color3.new(0, 1, 0);
			EnemyColor = Color3.new(1, 0, 0);
		};
		RenderList = {};
		RenderingCache = {};
		LastTick = 0;
	};

	local Active = {};
	local function Set(t, i, v)
		t[i] = v;
	end

	local function Combine(...)
		local Output = {};
		for i, v in pairs{...} do
			if typeof(v) == 'table' then
				table.foreach(v, function(i, v)
					Output[i] = v;
				end)
			end
		end
		return Output
	end

	function NewDrawing(InstanceName)
		local Instance = Drawing.new(InstanceName);
		return (function(Properties)
			for i, v in pairs(Properties) do
				pcall(Set, Instance, i, v);
			end
			return Instance;
		end)
	end

	function IsTeam(Player)
		if Player == LocalPlayer then return true; end
		if Player.Neutral and LocalPlayer.Neutral then
			return true;
		end
		if Player.TeamColor == LocalPlayer.TeamColor then
			return true;
		end
		return false;
	end

	local DrawingTypes = {
		Text = true;
		Line = true;
		Square = true;
		Circle = true;
		Rectangle = true;
		Triangle = true;
		Image = true;
	}

	function CleanDrawings(Table, Cache)
		Cache = Cache or {};
		if Cache[Table] or typeof(Table) ~= 'table' then return end
		Cache[Table] = true;
		for i, v in pairs(Table) do
			if DrawingTypes[typeof(v)] then
				v:Remove();
			end
			CleanDrawings(v, Cache);
		end
	end

	local Box = {};

	local Colors = {
		Color3.new(1, 0, 0);
		Color3.new(0, 1, 0);
		Color3.new(0, 0, 1);
		Color3.new(1, 0, 1);
		Color3.new(1, 1, 0);
		Color3.new(0, 1, 1);
	}

	function Box.new(Instance)
		local Box = {
			Instance = Instance;
			Cache = {};
			Lines = {};
			Was3D = uESP.Settings.Box3D;
		};

		function Box:Update(Properties) -- a lot of shorthand code im sorry
			local Properties = Properties or {};

			local Lines = self.Lines or {};
			local Instance = (self.Instance.ClassName == 'Model') and self.Instance or ((self.Instance.Parent.ClassName == 'Model') and self.Instance.Parent or self.Instance);

			if Instance == nil then
				self:Remove();
			end

			local Color = Properties.Color or Color3.new(1, 1, 1);

			local Properties = Combine({
				Transparency	= 1;
				Thickness		= 3;
				Color			= Color;
				Visible			= true;
			}, Properties);

			local Position, Size;

			if Instance.ClassName == 'Model' then
				Position, Size = Instance:GetBoundingBox();
			elseif Instance:IsA'BasePart' then
				Position, Size = Instance.CFrame, Instance.Size;
			else
				return;
			end

			if not uESP.Settings.Box3D and self.Was3D then
				self.Was3D = false;
				CleanDrawings(Lines);
				Lines = {};
			elseif uESP.Settings.Box3D and not self.Was3D then
				self.Was3D = true;
				CleanDrawings(Lines);
				Lines = {};
			end

			if Size.X < 16 and Size.Y < 16 and Size.Z < 16 then
				if uESP.Settings.Box3D then
					local Positions = {};

					Size = Size / 2;
					local Minimum, Maximum = -Size, Size

					local Corners = { -- https://www.unknownUtilss.me/forum/counterstrike-global-offensive/175021-3d-box-esp.html
						[0] = CFrame.new(Minimum.x, Minimum.y, Minimum.z);
						[1] = CFrame.new(Minimum.x, Maximum.y, Minimum.z);
						[2] = CFrame.new(Maximum.x, Maximum.y, Minimum.z);
						[3] = CFrame.new(Maximum.x, Minimum.y, Minimum.z);
						[4] = CFrame.new(Minimum.x, Minimum.y, Maximum.z);
						[5] = CFrame.new(Minimum.x, Maximum.y, Maximum.z);
						[6] = CFrame.new(Maximum.x, Maximum.y, Maximum.z);
						[7] = CFrame.new(Maximum.x, Minimum.y, Maximum.z);
					}

					for i, v in pairs(Corners) do
						local SP = Camera:WorldToViewportPoint((Position * v).p);
						Positions[i] = Vector2.new(SP.X, SP.Y);
					end

					for i = 1, 4 do
						Lines[i] = Lines[i] or {};

						Lines[i][1] = Lines[i][1] or NewDrawing'Line'(Properties);
						Lines[i][2] = Lines[i][2] or NewDrawing'Line'(Properties);
						Lines[i][3] = Lines[i][3] or NewDrawing'Line'(Properties);

						Lines[i][1].Color = Color;
						Lines[i][2].Color = Color;
						Lines[i][3].Color = Color;

						Lines[i][1].From = Positions[i - 1];
						Lines[i][1].To = Positions[i % 4];

						Lines[i][2].From = Positions[i - 1];
						Lines[i][2].To = Positions[i + 3];

						Lines[i][3].From = Positions[i + 3];
						Lines[i][3].To = Positions[i % 4 + 4];
					end
				else
					local Positions = {};

					Size = Size / 2;
					local Minimum, Maximum = -Size, Size

					local Corners = {
						CFrame.new(Maximum.x, Maximum.y, 0);
						CFrame.new(-Maximum.x, Maximum.y, 0);
						CFrame.new(Minimum.x, Minimum.y, 0);
						CFrame.new(-Minimum.x, Minimum.y, 0);
					}

					for i, v in pairs(Corners) do
						local SP = Camera:WorldToViewportPoint((Position * v).p);
						Positions[i] = Vector2.new(SP.X, SP.Y);
					end

					Lines[1] = Lines[1] or {};
					-- these stupid [1]'s are there because i'm too lazy to make a check if box is 2d or 3d even tho its easy/shrug
					Lines[1][1] = Lines[1][1] or NewDrawing'Line'(Properties);
					Lines[1][2] = Lines[1][2] or NewDrawing'Line'(Properties);
					Lines[1][3] = Lines[1][3] or NewDrawing'Line'(Properties);
					Lines[1][4] = Lines[1][4] or NewDrawing'Line'(Properties);

					Lines[1][1].Color = Color;
					Lines[1][2].Color = Color;
					Lines[1][3].Color = Color;
					Lines[1][4].Color = Color;

					Lines[1][1].From = Positions[1];
					Lines[1][1].To = Positions[2];

					Lines[1][2].From = Positions[2];
					Lines[1][2].To = Positions[3];

					Lines[1][3].From = Positions[3];
					Lines[1][3].To = Positions[4];

					Lines[1][4].From = Positions[4];
					Lines[1][4].To = Positions[1];
				end

				self.Lines = Lines;
			end
		end

		function Box:SetVisible(boolean)
			for i, v in pairs(self.Lines) do
				for _, Line in pairs(v) do
					Line.Visible = boolean;
				end
			end
		end

		function Box:Remove()
			for i, v in pairs(self.Lines) do
				for _, Line in pairs(v) do
					Line.Visible = false;
					Line:Remove();
				end
			end

			self.Update = function () end;
		end

		return setmetatable(Box, {
			__tostring = function()
				return 'Box';
			end;
		});
	end

	function uESP:Toggle()
		self.Enabled = not self.Enabled;
	end

	function uESP:UpdateSetting(Key, Value)
		if Settings[Key] ~= nil and typeof(Settings[Key]) == typeof(Value) then -- prevent setting shit like boolean to integer
			Settings[Key] = Value;
		end
	end

	function uESP:AddToRenderList(Instance, ...)
		if typeof(Instance) ~= 'Instance' then return end
		if not Instance:IsA'BasePart' then return end

		rawset(self.RenderList, Instance, {...});
	end

	function uESP:DrawInstance(Instance, Properties)
		Properties = Properties or {};

		-- 
	end

	function uESP:DrawPlayer(Player)

		Active[Player] = true;

		local Character = Player.Character;

		if not Character or not Character:IsDescendantOf(workspace) then return end
		if Player == LocalPlayer then return end;

		local Cache = uESP.RenderingCache[Character] or {};

		Cache.Box = Cache.Box or Box.new(Character);
		Cache.NameTag = Cache.NameTag or NewDrawing'Text'{
			Center	= true;
			Outline	= uESP.Settings.TextOutline;
			Size	= uESP.Settings.TextSize;
			Visible	= true;
		};
		Cache.DistanceTag = Cache.DistanceTag or NewDrawing'Text'{
			Center	= true;
			Outline	= uESP.Settings.TextOutline;
			Size	= uESP.Settings.TextSize;
			Visible	= true;
		};
		Cache.Tracer = Cache.Tracer or NewDrawing'Line'{
			Transparency	= 1;
			Thickness		= 2;
		};
		Cache.HeadDots = Cache.HeadDots or NewDrawing'Circle'{
			Filled = true;
			NumSides = 30;
		}

		uESP.RenderingCache[Character] = Cache;

		if uESP.Enabled and Player.Character:FindFirstChild'Head' then
			local Head = Character.Head;
			local Humanoid = Character:FindFirstChildOfClass'Humanoid';
			if Head then
				local ScreenPosition, Visible = Camera:WorldToViewportPoint(Head.Position + Vector3.new(0, Head.Size.Y / 2, 0));
				local ScreenPositionOnly = Camera:WorldToViewportPoint(Head.Position);
				local Scale	= Head.Size.Y / 2;
				local Color = uESP.Settings.TeamCheck and not Player.Neutral and Player.TeamColor.Color or IsTeam(Player) and uESP.Settings.TeamColor or uESP.Settings.EnemyColor

				if Humanoid and Humanoid.Health < 1 then
					Visible = false;
				end

				if Visible then
					if uESP.Settings.DrawNames then
						LocalPlayer.NameDisplayDistance = 0;
						Cache.NameTag.Color = Color;
						Cache.NameTag.Position = Vector2.new(ScreenPosition.X, ScreenPosition.Y);
						Cache.NameTag.Text = Player.Name;
						Cache.NameTag.Visible = true;
					else
						LocalPlayer.NameDisplayDistance = 100;
						Cache.NameTag.Visible = false;
					end
					if uESP.Settings.HeadDots then 
						local Top			= Camera:WorldToViewportPoint((Head.CFrame * CFrame.new(0, Scale, 0)).p);
						local Bottom		= Camera:WorldToViewportPoint((Head.CFrame * CFrame.new(0, -Scale, 0)).p);
						local Radius		= (Top - Bottom).y;
						Cache.HeadDots.Visible = true
						Cache.HeadDots.Position = Vector2.new(ScreenPositionOnly.X, ScreenPositionOnly.Y)
						Cache.HeadDots.Color = Color
						Cache.HeadDots.Radius = Radius
					else
						Cache.HeadDots.Visible = false
					end
					if uESP.Settings.DrawDistance then
						Cache.DistanceTag.Color = Color3.new(1, 1, 1);
						Cache.DistanceTag.Position = Vector2.new(ScreenPosition.X, ScreenPosition.Y + (Cache.NameTag.TextBounds.Y));
						Cache.DistanceTag.Text = '[' .. math.floor(ScreenPosition.Z) .. ' Studs]';
						Cache.DistanceTag.Visible = true;
					else
						Cache.DistanceTag.Visible = false;
					end
					if uESP.Settings.DrawTracers then
						Cache.Tracer.From		= Vector2.new(Camera.ViewportSize.X / 2, Camera.ViewportSize.Y);
						Cache.Tracer.To			= Vector2.new(ScreenPosition.X, ScreenPosition.Y);
						Cache.Tracer.Color		= Color;
						Cache.Tracer.Visible	= true;
					else
						Cache.Tracer.Visible = false;
					end
					if ScreenPosition.Z >= 1.5 then
						Cache.Box:SetVisible(true);
					else
						Cache.Box:SetVisible(false);
					end
					Cache.Box:Update({Color = Color});
				else
					Cache.NameTag.Visible = false;
					Cache.DistanceTag.Visible = false;
					Cache.Tracer.Visible = false;
					Cache.HeadDots.Visible = false;
					Cache.Box:SetVisible(false);
				end
			end
		else
			Cache.NameTag.Visible = false;
			Cache.DistanceTag.Visible = false;
			Cache.Tracer.Visible = false;
			Cache.HeadDots.Visible = false;
			Cache.Box:SetVisible(false);
		end

		uESP.RenderingCache[Character] = Cache;
		Active[Player] = false;
	end
	function uESP:Draw()
		if uESP.Settings.RefreshRate > 1 and (tick() - uESP.LastTick) <= (uESP.Settings.RefreshRate / 1000) then
			return;
		end

		for i, v in pairs(Players:GetPlayers()) do
			uESP:DrawPlayer(v);
		end
		for i, v in pairs(self.RenderList) do
			uESP:DrawInstance(i, v);
		end

		for i, v in pairs(self.RenderingCache) do -- Remove trash
			if not i:IsDescendantOf(game) then
				CleanDrawings(self.RenderingCache[i]);
				self.RenderingCache[i] = nil;
			end
		end
	end

	function uESP:Unload()
		RunService:UnbindFromRenderStep(shared.ESPAPIName);
		CleanDrawings(uESP.RenderingCache);
		uESP = {};
	end

	function uESP:Init() 
		pcall(function() uESP:Unload() end);
		wait(1/4);

		RunService:BindToRenderStep("esp", 1, function()
			uESP:Draw();
		end);
	end
end
]]

do -- Utils API
	Utils.AddLaunch = function(LaunchName, func) 
		getfenv(1)[LaunchName] = {}
		getfenv(1)[LaunchName].launch = function() 
			func()
		end
	end
	Utils.FindValue = function(Table, Value) 
		local Found = false
		for i, v in next, Table do 
			if Value == v then 
				Found = true
			end
		end
		return Found
	end
	Utils.FindConstant = function(func, ...) 
		local args = {...}
		local ConstantsFound = 0
		local Found = false
		pcall(function()
			for i, v in next, debug.getconstants(func) do
				if Utils.FindValue(args, v) then 
					ConstantsFound = ConstantsFound + 1
				end
			end
		end)
		if #args == ConstantsFound then 
			Found = true
		end
		return Found
	end
	Utils.SetConstant = function(func, Constant, NewConstant) 
		pcall(function() 
			for i, v in next, debug.getconstants(func) do 
				if v == Constant then 
					debug.setconstant(func, i, NewConstant)
				end
			end
		end)
	end
	Utils.getClosestPlayer = function()
		local joe = game:GetService("Workspace").CurrentCamera
		local closestPlayer = nil
		local shortestDistance = math.huge
		local lp = game:GetService("Players").LocalPlayer
		for i, v in pairs(game:GetService("Players"):GetPlayers()) do
			if v ~= lp and v.Character and v.Character:FindFirstChild("Humanoid") and v.Character.Humanoid.Health ~= 0 and v.Character:FindFirstChild("HumanoidRootPart") and v.Character:FindFirstChild("Head") then
				local magnitude = (v.Character.HumanoidRootPart.Position - lp.Character.HumanoidRootPart.Position).magnitude

				if magnitude < shortestDistance then
					closestPlayer = v
					shortestDistance = magnitude
				end
			end
		end

		return closestPlayer
	end
end
Utils.AddLaunch("HubLauncher", function() 
	local ScreenGui = Instance.new("ScreenGui")
	local Frame = Instance.new("Frame")
	local Close = Instance.new("TextButton")
	local Detail = Instance.new("ImageLabel")
	local Settings = Instance.new("TextButton")
	local Detail_2 = Instance.new("ImageLabel")
	local MainTab = Instance.new("Frame")
	local Kinorana1 = Instance.new("TextLabel")
	local Kinorana2 = Instance.new("TextLabel")
	local KeyFrame = Instance.new("Frame")
	local TextBox = Instance.new("TextBox")
	local KeyIcon = Instance.new("ImageLabel")
	local RememberMe = Instance.new("TextLabel")
	local CheckBox = Instance.new("TextButton")
	local Login = Instance.new("TextButton")
	local KeyLabel = Instance.new("TextLabel")
	local SettingsTab = Instance.new("Frame")
	local Kinorana1_2 = Instance.new("TextLabel")
	local Kinorana2_2 = Instance.new("TextLabel")
	local GameDetection = Instance.new("TextLabel")
	local BackIcon = Instance.new("TextButton")
	local loggingIn = false
	local Colors = {Vaild = Color3.fromRGB(255, 200, 255), Invaild = Color3.new(1, 0.254902, 0.254902)}
	ScreenGui.Parent = game.CoreGui

	Frame.Parent = ScreenGui
	Frame.BackgroundColor3 = Color3.new(0.129412, 0.129412, 0.129412)
	Frame.BorderColor3 = Color3.new(0.815686, 0.815686, 0.815686)
	Frame.BorderSizePixel = 0
	Frame.Position = UDim2.new(0.04093327, 0, 0.337049246, 0)
	Frame.Size = UDim2.new(0, 386, 0, 127)
	CreateDrag(Frame)
	Close.Name = "Close"
	Close.Parent = Frame
	Close.BackgroundColor3 = Color3.new(0.129412, 0.129412, 0.129412)
	Close.BorderSizePixel = 0
	Close.Position = UDim2.new(1, -25, 0, 0)
	Close.Size = UDim2.new(0, 25, 0.211321458, 0)
	Close.AutoButtonColor = false
	Close.Font = Enum.Font.SourceSans
	Close.Text = ""
	Close.TextColor3 = Color3.new(0, 0, 0)
	Close.TextSize = 14
	Close.MouseButton1Click:Connect(function() 
		ScreenGui:Destroy()
	end)
	Detail.Name = "Detail"
	Detail.Parent = Close
	Detail.BackgroundColor3 = Color3.new(1, 1, 1)
	Detail.BackgroundTransparency = 1
	Detail.Position = UDim2.new(0.5, -8, 0.5, -8)
	Detail.Size = UDim2.new(0, 15, 0, 15)
	Detail.Image = "rbxassetid://3487597401"

	Settings.Name = "Settings"
	Settings.Parent = Frame
	Settings.BackgroundColor3 = Color3.new(0.129412, 0.129412, 0.129412)
	Settings.BorderSizePixel = 0
	Settings.Position = UDim2.new(1.02331603, -47, 0, 0)
	Settings.Size = UDim2.new(-0.023316063, 25, 0.211321458, 0)
	Settings.AutoButtonColor = false
	Settings.Font = Enum.Font.SourceSans
	Settings.Text = ""
	Settings.TextColor3 = Color3.new(0, 0, 0)
	Settings.TextSize = 14

	Detail_2.Name = "Detail"
	Detail_2.Parent = Settings
	Detail_2.BackgroundColor3 = Color3.new(1, 1, 1)
	Detail_2.BackgroundTransparency = 1
	Detail_2.Position = UDim2.new(0.5, -8, 0.5, -8)
	Detail_2.Size = UDim2.new(0, 15, 0, 15)
	Detail_2.Image = "rbxassetid://2766645188"

	MainTab.Name = "MainTab"
	MainTab.Parent = Frame
	MainTab.BackgroundColor3 = Color3.new(1, 1, 1)
	MainTab.BackgroundTransparency = 1
	MainTab.BorderColor3 = Color3.new(0.105882, 0.164706, 0.207843)
	MainTab.Size = UDim2.new(0, 386, 0, 127)

	Kinorana1.Name = "Kinorana1"
	Kinorana1.Parent = MainTab
	Kinorana1.BackgroundColor3 = Color3.new(1, 1, 1)
	Kinorana1.BackgroundTransparency = 1
	Kinorana1.Position = UDim2.new(0.372686356, 0, 0.0636268258, 0)
	Kinorana1.Size = UDim2.new(0, 36, 0, 18)
	Kinorana1.Font = Enum.Font.SourceSansBold
	Kinorana1.Text = "Samild"
	Kinorana1.TextColor3 = Color3.new(1, 1, 1)
	Kinorana1.TextSize = 30

	Kinorana2.Name = "Kinorana2"
	Kinorana2.Parent = MainTab
	Kinorana2.BackgroundColor3 = Color3.new(1, 1, 1)
	Kinorana2.BackgroundTransparency = 1
	Kinorana2.Position = UDim2.new(0.486676008, 0, 0.0636268705, 0)
	Kinorana2.Size = UDim2.new(0, 53, 0, 18)
	Kinorana2.Font = Enum.Font.SourceSansBold
	Kinorana2.Text = "   Hub"
	Kinorana2.TextColor3 = Color3.new(1, 0.254902, 0.254902)
	Kinorana2.TextSize = 30

	KeyFrame.Name = "KeyFrame"
	KeyFrame.Parent = MainTab
	KeyFrame.BackgroundColor3 = Color3.new(0.980392, 0.980392, 0.980392)
	KeyFrame.BorderSizePixel = 0
	KeyFrame.Position = UDim2.new(0.0231865197, 0, 0.392999977, 0)
	KeyFrame.Size = UDim2.new(0, 368, 0, 34)

	TextBox.Parent = KeyFrame
	TextBox.BackgroundColor3 = Color3.new(1, 1, 1)
	TextBox.BackgroundTransparency = 1
	TextBox.Position = UDim2.new(0.0867036358, 0, 0, 0)
	TextBox.Size = UDim2.new(0, 335, 0, 34)
	TextBox.Font = Enum.Font.SourceSans
	TextBox.PlaceholderColor3 = Color3.new(0.698039, 0.698039, 0.698039)
	TextBox.PlaceholderText = "Please input your key"
	TextBox.Text = ""
	TextBox.TextColor3 = Color3.new(0, 0, 0)
	TextBox.TextSize = 16
	TextBox.TextXAlignment = Enum.TextXAlignment.Left

	KeyIcon.Name = "KeyIcon"
	KeyIcon.Parent = KeyFrame
	KeyIcon.BackgroundColor3 = Color3.new(0.980392, 0.980392, 0.980392)
	KeyIcon.BackgroundTransparency = 1
	KeyIcon.BorderSizePixel = 0
	KeyIcon.Position = UDim2.new(0.0142740402, 0, 0.174600363, 0)
	KeyIcon.Size = UDim2.new(0, 19, 0, 21)
    KeyIcon.Image = "http://www.roblox.com/asset/?id=4510496189"

    Name = game.Players.LocalPlayer.Name

	RememberMe.Name = "RememberMe"
	RememberMe.Parent = MainTab
	RememberMe.BackgroundColor3 = Color3.new(1, 1, 1)
	RememberMe.BackgroundTransparency = 1
	RememberMe.Position = UDim2.new(0.105846979, 0, 0.731006682, 0)
	RememberMe.Size = UDim2.new(0, 73, 0, 22)
	RememberMe.Font = Enum.Font.Gotham
	RememberMe.Text = "HELLO : "..Name..""
	RememberMe.TextColor3 = Color3.new(1, 1, 1)
    RememberMe.TextSize = 12
    
    --[[
	CheckBox.Name = "CheckBox"
	CheckBox.Parent = MainTab
	CheckBox.BackgroundColor3 = Color3.new(0.980392, 0.980392, 0.980392)
	CheckBox.BorderSizePixel = 0
	CheckBox.Position = UDim2.new(0.0231865197, 0, 0.724546075, 0)
	CheckBox.Size = UDim2.new(0, 19, 0, 19)
	CheckBox.Font = Enum.Font.SourceSansBold
	CheckBox.Text = "CheckBox"
	CheckBox.TextColor3 = Color3.new(0, 0, 0)
    CheckBox.TextSize = 14
    ]]

	Login.Name = "Login"
	Login.Parent = MainTab
	Login.BackgroundColor3 = Color3.new(1, 0.254902, 0.254902)
	Login.BorderColor3 = Color3.new(1, 0.254902, 0.254902)
	Login.Position = UDim2.new(0.795336783, 0, 0.724546075, 0)
	Login.Size = UDim2.new(0, 69, 0, 24)
	Login.Font = Enum.Font.SourceSansBold
	Login.Text = "Login"
	Login.TextColor3 = Color3.new(1, 1, 1)
	Login.TextSize = 14
	Login.MouseButton1Click:Connect(function() 
		if not loggingIn then
			Kinorana2.TextColor3 = Colors.Vaild
			wait(0.30)
			ScreenGui:Destroy()
			Hub.launch()
			loggingIn = true
		end
	end)

	KeyLabel.Name = "KeyLabel"
	KeyLabel.Parent = MainTab
	KeyLabel.BackgroundColor3 = Color3.new(1, 1, 1)
	KeyLabel.BackgroundTransparency = 1
	KeyLabel.Position = UDim2.new(0.0177640766, 0, 0.211321488, 0)
	KeyLabel.Size = UDim2.new(0, 27, 0, 18)
	KeyLabel.Font = Enum.Font.GothamSemibold
	KeyLabel.Text = "Key"
	KeyLabel.TextColor3 = Color3.new(1, 1, 1)
	KeyLabel.TextSize = 12

	SettingsTab.Name = "SettingsTab"
	SettingsTab.Parent = Frame
	SettingsTab.BackgroundColor3 = Color3.new(1, 1, 1)
	SettingsTab.BackgroundTransparency = 1
	SettingsTab.BorderColor3 = Color3.new(0.105882, 0.164706, 0.207843)
	SettingsTab.Size = UDim2.new(0, 386, 0, 127)
	SettingsTab.Visible = false

	Kinorana1_2.Name = "Kinorana1"
	Kinorana1_2.Parent = SettingsTab
	Kinorana1_2.BackgroundColor3 = Color3.new(1, 1, 1)
	Kinorana1_2.BackgroundTransparency = 1
	Kinorana1_2.Position = UDim2.new(0.372686356, 0, 0.0636268258, 0)
	Kinorana1_2.Size = UDim2.new(0, 36, 0, 18)
	Kinorana1_2.Font = Enum.Font.SourceSansBold
	Kinorana1_2.Text = "SamildHub           "
	Kinorana1_2.TextColor3 = Color3.new(1, 1, 1)
	Kinorana1_2.TextSize = 30

	Kinorana2_2.Name = "Kinorana2"
	Kinorana2_2.Parent = SettingsTab
	Kinorana2_2.BackgroundColor3 = Color3.new(1, 1, 1)
	Kinorana2_2.BackgroundTransparency = 1
	Kinorana2_2.Position = UDim2.new(0.486676008, 0, 0.0636268705, 0)
	Kinorana2_2.Size = UDim2.new(0, 53, 0, 18)
	Kinorana2_2.Font = Enum.Font.SourceSansBold
	Kinorana2_2.Text = "           Settings"
	Kinorana2_2.TextColor3 = Color3.new(1, 0.254902, 0.254902)
	Kinorana2_2.TextSize = 30

	GameDetection.Name = "GameDetection"
	GameDetection.Parent = SettingsTab
	GameDetection.BackgroundColor3 = Color3.new(1, 1, 1)
	GameDetection.BackgroundTransparency = 1
	GameDetection.Position = UDim2.new(0.34455958, 0, 0.385826886, 0)
	GameDetection.Size = UDim2.new(0, 119, 0, 28)
	GameDetection.Font = Enum.Font.SourceSansBold
	GameDetection.Text = GameName
	GameDetection.TextColor3 = Color3.new(1, 1, 1)
	GameDetection.TextSize = 16

	BackIcon.Name = "BackIcon"
	BackIcon.Parent = Frame
	BackIcon.BackgroundColor3 = Color3.new(0.129412, 0.129412, 0.129412)
	BackIcon.BorderSizePixel = 0
	BackIcon.Position = UDim2.new(1.02331603, -47, 0, 0)
	BackIcon.Size = UDim2.new(-0.023316063, 25, 0.211321458, 0)
	BackIcon.Visible = false
	BackIcon.AutoButtonColor = false
	BackIcon.Font = Enum.Font.SourceSans
	BackIcon.TextColor3 = Color3.new(1, 1, 1)
	BackIcon.TextSize = 20

	-- Scripts:

	local function SGKS_fake_script() -- Settings.LocalScript 
		local script = Instance.new('LocalScript', Settings)

		local SettingsButton = script.Parent
		local GUIFrame = SettingsButton.Parent
		SettingsButton.MouseButton1Click:Connect(function() 
			GUIFrame.MainTab.Visible = false
			SettingsButton.Visible = false
			GUIFrame.SettingsTab.Visible = true
			GUIFrame.BackIcon.Visible = true
		end)
	end
	coroutine.wrap(SGKS_fake_script)()
	local function EYWK_fake_script() -- CheckBox.LocalScript 
		local script = Instance.new('LocalScript', CheckBox)

		local BackIcon = script.Parent
		BackIcon.Text = utf8.char(10003)
	end
	coroutine.wrap(EYWK_fake_script)()
	local function HOCN_fake_script() -- BackIcon.LocalScript 
		local script = Instance.new('LocalScript', BackIcon)

		local BackIcon = script.Parent
		local GUIFrame = BackIcon.Parent
		BackIcon.Text = utf8.char(8592)
		BackIcon.MouseButton1Click:Connect(function() 
			GUIFrame.MainTab.Visible = true
			BackIcon.Visible = false
			GUIFrame.SettingsTab.Visible = false
			GUIFrame.Settings.Visible = true
		end)
	end
	coroutine.wrap(HOCN_fake_script)()

end)
Utils.AddLaunch("UIInit", function()
	--window = Library:CreateTab(GameName == "No Game Detected" and "Universal" or GameName)
	print("Running the scripts")
end)
Utils.AddLaunch("BloxFruits", function() 
	loadstring(game:HttpGet('https://pastebin.com/raw/bmwVNuFf'))()
end)
Utils.AddLaunch("WildWest", function() 
    loadstring(game:HttpGet('https://raw.githubusercontent.com/LightMildTH/RobloxScripts/master/TheWildWest.lua'))()
end)

Utils.AddLaunch("Hub", function()
	if GameName == "Blox Fruits" then
		UIInit.launch()	
		BloxFruits.launch()
	elseif GameName == "The Wild West" then
		UIInit.launch()
		WildWest.launch()
	else
		Universal.launch()
	end
end)
HubLauncher.launch()
--// I wonder if ever anyone looks here. Well thx for source
