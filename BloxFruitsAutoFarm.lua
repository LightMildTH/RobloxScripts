--[[
	ui-engine-v2
	version 1.3a
	by Singularity (V3rm @ King Singularity) (Discord @ Singularity#5490)
--]]

local ui_options = {
	main_color = Color3.fromRGB(41, 74, 122),
	min_size = Vector2.new(700, 500),
	toggle_key = Enum.KeyCode.RightControl,
	can_resize = true,
}

do
	local imgui = game:GetService("CoreGui"):FindFirstChild("imgui")
	if imgui then imgui:Destroy() end
end

local imgui = Instance.new("ScreenGui")
local Prefabs = Instance.new("Frame")
local Label = Instance.new("TextLabel")
local Window = Instance.new("ImageLabel")
local Resizer = Instance.new("Frame")
local Bar = Instance.new("Frame")
local Toggle = Instance.new("ImageButton")
local Base = Instance.new("ImageLabel")
local Top = Instance.new("ImageLabel")
local Tabs = Instance.new("Frame")
local Title = Instance.new("TextLabel")
local TabSelection = Instance.new("ImageLabel")
local TabButtons = Instance.new("Frame")
local UIListLayout = Instance.new("UIListLayout")
local Frame = Instance.new("Frame")
local Tab = Instance.new("Frame")
local UIListLayout_2 = Instance.new("UIListLayout")
local TextBox = Instance.new("TextBox")
local TextBox_Roundify_4px = Instance.new("ImageLabel")
local Slider = Instance.new("ImageLabel")
local Title_2 = Instance.new("TextLabel")
local Indicator = Instance.new("ImageLabel")
local Value = Instance.new("TextLabel")
local TextLabel = Instance.new("TextLabel")
local TextLabel_2 = Instance.new("TextLabel")
local Circle = Instance.new("ImageLabel")
local UIListLayout_3 = Instance.new("UIListLayout")
local Dropdown = Instance.new("TextButton")
local Indicator_2 = Instance.new("ImageLabel")
local Box = Instance.new("ImageButton")
local Objects = Instance.new("ScrollingFrame")
local UIListLayout_4 = Instance.new("UIListLayout")
local TextButton_Roundify_4px = Instance.new("ImageLabel")
local TabButton = Instance.new("TextButton")
local TextButton_Roundify_4px_2 = Instance.new("ImageLabel")
local Folder = Instance.new("ImageLabel")
local Button = Instance.new("TextButton")
local TextButton_Roundify_4px_3 = Instance.new("ImageLabel")
local Toggle_2 = Instance.new("ImageLabel")
local Objects_2 = Instance.new("Frame")
local UIListLayout_5 = Instance.new("UIListLayout")
local HorizontalAlignment = Instance.new("Frame")
local UIListLayout_6 = Instance.new("UIListLayout")
local Console = Instance.new("ImageLabel")
local ScrollingFrame = Instance.new("ScrollingFrame")
local Source = Instance.new("TextBox")
local Comments = Instance.new("TextLabel")
local Globals = Instance.new("TextLabel")
local Keywords = Instance.new("TextLabel")
local RemoteHighlight = Instance.new("TextLabel")
local Strings = Instance.new("TextLabel")
local Tokens = Instance.new("TextLabel")
local Numbers = Instance.new("TextLabel")
local Info = Instance.new("TextLabel")
local Lines = Instance.new("TextLabel")
local ColorPicker = Instance.new("ImageLabel")
local Palette = Instance.new("ImageLabel")
local Indicator_3 = Instance.new("ImageLabel")
local Sample = Instance.new("ImageLabel")
local Saturation = Instance.new("ImageLabel")
local Indicator_4 = Instance.new("Frame")
local Switch = Instance.new("TextButton")
local TextButton_Roundify_4px_4 = Instance.new("ImageLabel")
local Title_3 = Instance.new("TextLabel")
local Button_2 = Instance.new("TextButton")
local TextButton_Roundify_4px_5 = Instance.new("ImageLabel")
local DropdownButton = Instance.new("TextButton")
local Keybind = Instance.new("ImageLabel")
local Title_4 = Instance.new("TextLabel")
local Input = Instance.new("TextButton")
local Input_Roundify_4px = Instance.new("ImageLabel")
local Windows = Instance.new("Frame")

imgui.Name = "imgui"
imgui.Parent = game:GetService("CoreGui")

Prefabs.Name = "Prefabs"
Prefabs.Parent = imgui
Prefabs.BackgroundColor3 = Color3.new(1, 1, 1)
Prefabs.Size = UDim2.new(0, 100, 0, 100)
Prefabs.Visible = false

Label.Name = "Label"
Label.Parent = Prefabs
Label.BackgroundColor3 = Color3.new(1, 1, 1)
Label.BackgroundTransparency = 1
Label.Size = UDim2.new(0, 200, 0, 20)
Label.Font = Enum.Font.GothamSemibold
Label.Text = "Hello, world 123"
Label.TextColor3 = Color3.new(1, 1, 1)
Label.TextSize = 14
Label.TextXAlignment = Enum.TextXAlignment.Left

Window.Name = "Window"
Window.Parent = Prefabs
Window.Active = true
Window.BackgroundColor3 = Color3.new(1, 1, 1)
Window.BackgroundTransparency = 1
Window.ClipsDescendants = true
Window.Position = UDim2.new(0, 20, 0, 20)
Window.Selectable = true
Window.Size = UDim2.new(0, 200, 0, 200)
Window.Image = "rbxassetid://2851926732"
Window.ImageColor3 = Color3.new(0.0823529, 0.0862745, 0.0901961)
Window.ScaleType = Enum.ScaleType.Slice
Window.SliceCenter = Rect.new(12, 12, 12, 12)

Resizer.Name = "Resizer"
Resizer.Parent = Window
Resizer.Active = true
Resizer.BackgroundColor3 = Color3.new(1, 1, 1)
Resizer.BackgroundTransparency = 1
Resizer.BorderSizePixel = 0
Resizer.Position = UDim2.new(1, -20, 1, -20)
Resizer.Size = UDim2.new(0, 20, 0, 20)

Bar.Name = "Bar"
Bar.Parent = Window
Bar.BackgroundColor3 = Color3.new(0.160784, 0.290196, 0.478431)
Bar.BorderSizePixel = 0
Bar.Position = UDim2.new(0, 0, 0, 5)
Bar.Size = UDim2.new(1, 0, 0, 15)

Toggle.Name = "Toggle"
Toggle.Parent = Bar
Toggle.BackgroundColor3 = Color3.new(1, 1, 1)
Toggle.BackgroundTransparency = 1
Toggle.Position = UDim2.new(0, 5, 0, -2)
Toggle.Rotation = 90
Toggle.Size = UDim2.new(0, 20, 0, 20)
Toggle.ZIndex = 2
Toggle.Image = "https://www.roblox.com/Thumbs/Asset.ashx?width=420&height=420&assetId=4731371541"

Base.Name = "Base"
Base.Parent = Bar
Base.BackgroundColor3 = Color3.new(0.160784, 0.290196, 0.478431)
Base.BorderSizePixel = 0
Base.Position = UDim2.new(0, 0, 0.800000012, 0)
Base.Size = UDim2.new(1, 0, 0, 10)
Base.Image = "rbxassetid://2851926732"
Base.ImageColor3 = Color3.new(0.160784, 0.290196, 0.478431)
Base.ScaleType = Enum.ScaleType.Slice
Base.SliceCenter = Rect.new(12, 12, 12, 12)

Top.Name = "Top"
Top.Parent = Bar
Top.BackgroundColor3 = Color3.new(1, 1, 1)
Top.BackgroundTransparency = 1
Top.Position = UDim2.new(0, 0, 0, -5)
Top.Size = UDim2.new(1, 0, 0, 10)
Top.Image = "rbxassetid://2851926732"
Top.ImageColor3 = Color3.new(0.160784, 0.290196, 0.478431)
Top.ScaleType = Enum.ScaleType.Slice
Top.SliceCenter = Rect.new(12, 12, 12, 12)

Tabs.Name = "Tabs"
Tabs.Parent = Window
Tabs.BackgroundColor3 = Color3.new(1, 1, 1)
Tabs.BackgroundTransparency = 1
Tabs.Position = UDim2.new(0, 15, 0, 60)
Tabs.Size = UDim2.new(1, -30, 1, -60)

Title.Name = "Title"
Title.Parent = Window
Title.BackgroundColor3 = Color3.new(1, 1, 1)
Title.BackgroundTransparency = 1
Title.Position = UDim2.new(0, 30, 0, 3)
Title.Size = UDim2.new(0, 200, 0, 20)
Title.Font = Enum.Font.GothamBold
Title.Text = "Gamer Time"
Title.TextColor3 = Color3.new(1, 1, 1)
Title.TextSize = 14
Title.TextXAlignment = Enum.TextXAlignment.Left

TabSelection.Name = "TabSelection"
TabSelection.Parent = Window
TabSelection.BackgroundColor3 = Color3.new(1, 1, 1)
TabSelection.BackgroundTransparency = 1
TabSelection.Position = UDim2.new(0, 15, 0, 30)
TabSelection.Size = UDim2.new(1, -30, 0, 25)
TabSelection.Visible = false
TabSelection.Image = "rbxassetid://2851929490"
TabSelection.ImageColor3 = Color3.new(0.145098, 0.14902, 0.156863)
TabSelection.ScaleType = Enum.ScaleType.Slice
TabSelection.SliceCenter = Rect.new(4, 4, 4, 4)

TabButtons.Name = "TabButtons"
TabButtons.Parent = TabSelection
TabButtons.BackgroundColor3 = Color3.new(1, 1, 1)
TabButtons.BackgroundTransparency = 1
TabButtons.Size = UDim2.new(1, 0, 1, 0)

UIListLayout.Parent = TabButtons
UIListLayout.FillDirection = Enum.FillDirection.Horizontal
UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout.Padding = UDim.new(0, 2)

Frame.Parent = TabSelection
Frame.BackgroundColor3 = Color3.new(0.12549, 0.227451, 0.372549)
Frame.BorderColor3 = Color3.new(0.105882, 0.164706, 0.207843)
Frame.BorderSizePixel = 0
Frame.Position = UDim2.new(0, 0, 1, 0)
Frame.Size = UDim2.new(1, 0, 0, 2)

Tab.Name = "Tab"
Tab.Parent = Prefabs
Tab.BackgroundColor3 = Color3.new(1, 1, 1)
Tab.BackgroundTransparency = 1
Tab.Size = UDim2.new(1, 0, 1, 0)
Tab.Visible = false

UIListLayout_2.Parent = Tab
UIListLayout_2.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout_2.Padding = UDim.new(0, 5)

TextBox.Parent = Prefabs
TextBox.BackgroundColor3 = Color3.new(1, 1, 1)
TextBox.BackgroundTransparency = 1
TextBox.BorderSizePixel = 0
TextBox.Size = UDim2.new(1, 0, 0, 20)
TextBox.ZIndex = 2
TextBox.Font = Enum.Font.GothamSemibold
TextBox.PlaceholderColor3 = Color3.new(0.698039, 0.698039, 0.698039)
TextBox.PlaceholderText = "Input Text"
TextBox.Text = ""
TextBox.TextColor3 = Color3.new(0.784314, 0.784314, 0.784314)
TextBox.TextSize = 14

TextBox_Roundify_4px.Name = "TextBox_Roundify_4px"
TextBox_Roundify_4px.Parent = TextBox
TextBox_Roundify_4px.BackgroundColor3 = Color3.new(1, 1, 1)
TextBox_Roundify_4px.BackgroundTransparency = 1
TextBox_Roundify_4px.Size = UDim2.new(1, 0, 1, 0)
TextBox_Roundify_4px.Image = "rbxassetid://2851929490"
TextBox_Roundify_4px.ImageColor3 = Color3.new(0.203922, 0.207843, 0.219608)
TextBox_Roundify_4px.ScaleType = Enum.ScaleType.Slice
TextBox_Roundify_4px.SliceCenter = Rect.new(4, 4, 4, 4)

Slider.Name = "Slider"
Slider.Parent = Prefabs
Slider.BackgroundColor3 = Color3.new(1, 1, 1)
Slider.BackgroundTransparency = 1
Slider.Position = UDim2.new(0, 0, 0.178571433, 0)
Slider.Size = UDim2.new(1, 0, 0, 20)
Slider.Image = "rbxassetid://2851929490"
Slider.ImageColor3 = Color3.new(0.145098, 0.14902, 0.156863)
Slider.ScaleType = Enum.ScaleType.Slice
Slider.SliceCenter = Rect.new(4, 4, 4, 4)

Title_2.Name = "Title"
Title_2.Parent = Slider
Title_2.BackgroundColor3 = Color3.new(1, 1, 1)
Title_2.BackgroundTransparency = 1
Title_2.Position = UDim2.new(0.5, 0, 0.5, -10)
Title_2.Size = UDim2.new(0, 0, 0, 20)
Title_2.ZIndex = 2
Title_2.Font = Enum.Font.GothamBold
Title_2.Text = "Slider"
Title_2.TextColor3 = Color3.new(0.784314, 0.784314, 0.784314)
Title_2.TextSize = 14

Indicator.Name = "Indicator"
Indicator.Parent = Slider
Indicator.BackgroundColor3 = Color3.new(1, 1, 1)
Indicator.BackgroundTransparency = 1
Indicator.Size = UDim2.new(0, 0, 0, 20)
Indicator.Image = "rbxassetid://2851929490"
Indicator.ImageColor3 = Color3.new(0.254902, 0.262745, 0.278431)
Indicator.ScaleType = Enum.ScaleType.Slice
Indicator.SliceCenter = Rect.new(4, 4, 4, 4)

Value.Name = "Value"
Value.Parent = Slider
Value.BackgroundColor3 = Color3.new(1, 1, 1)
Value.BackgroundTransparency = 1
Value.Position = UDim2.new(1, -55, 0.5, -10)
Value.Size = UDim2.new(0, 50, 0, 20)
Value.Font = Enum.Font.GothamBold
Value.Text = "0%"
Value.TextColor3 = Color3.new(0.784314, 0.784314, 0.784314)
Value.TextSize = 14

TextLabel.Parent = Slider
TextLabel.BackgroundColor3 = Color3.new(1, 1, 1)
TextLabel.BackgroundTransparency = 1
TextLabel.Position = UDim2.new(1, -20, -0.75, 0)
TextLabel.Size = UDim2.new(0, 26, 0, 50)
TextLabel.Font = Enum.Font.GothamBold
TextLabel.Text = "]"
TextLabel.TextColor3 = Color3.new(0.627451, 0.627451, 0.627451)
TextLabel.TextSize = 14

TextLabel_2.Parent = Slider
TextLabel_2.BackgroundColor3 = Color3.new(1, 1, 1)
TextLabel_2.BackgroundTransparency = 1
TextLabel_2.Position = UDim2.new(1, -65, -0.75, 0)
TextLabel_2.Size = UDim2.new(0, 26, 0, 50)
TextLabel_2.Font = Enum.Font.GothamBold
TextLabel_2.Text = "["
TextLabel_2.TextColor3 = Color3.new(0.627451, 0.627451, 0.627451)
TextLabel_2.TextSize = 14

Circle.Name = "Circle"
Circle.Parent = Prefabs
Circle.BackgroundColor3 = Color3.new(1, 1, 1)
Circle.BackgroundTransparency = 1
Circle.Image = "rbxassetid://266543268"
Circle.ImageTransparency = 0.5

UIListLayout_3.Parent = Prefabs
UIListLayout_3.FillDirection = Enum.FillDirection.Horizontal
UIListLayout_3.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout_3.Padding = UDim.new(0, 20)

Dropdown.Name = "Dropdown"
Dropdown.Parent = Prefabs
Dropdown.BackgroundColor3 = Color3.new(1, 1, 1)
Dropdown.BackgroundTransparency = 1
Dropdown.BorderSizePixel = 0
Dropdown.Position = UDim2.new(-0.055555556, 0, 0.0833333284, 0)
Dropdown.Size = UDim2.new(0, 200, 0, 20)
Dropdown.ZIndex = 2
Dropdown.Font = Enum.Font.GothamBold
Dropdown.Text = "      Dropdown"
Dropdown.TextColor3 = Color3.new(0.784314, 0.784314, 0.784314)
Dropdown.TextSize = 14
Dropdown.TextXAlignment = Enum.TextXAlignment.Left

Indicator_2.Name = "Indicator"
Indicator_2.Parent = Dropdown
Indicator_2.BackgroundColor3 = Color3.new(1, 1, 1)
Indicator_2.BackgroundTransparency = 1
Indicator_2.Position = UDim2.new(0.899999976, -10, 0.100000001, 0)
Indicator_2.Rotation = -90
Indicator_2.Size = UDim2.new(0, 15, 0, 15)
Indicator_2.ZIndex = 2
Indicator_2.Image = "https://www.roblox.com/Thumbs/Asset.ashx?width=420&height=420&assetId=4744658743"

Box.Name = "Box"
Box.Parent = Dropdown
Box.BackgroundColor3 = Color3.new(1, 1, 1)
Box.BackgroundTransparency = 1
Box.Position = UDim2.new(0, 0, 0, 25)
Box.Size = UDim2.new(1, 0, 0, 150)
Box.ZIndex = 3
Box.Image = "rbxassetid://2851929490"
Box.ImageColor3 = Color3.new(0.129412, 0.133333, 0.141176)
Box.ScaleType = Enum.ScaleType.Slice
Box.SliceCenter = Rect.new(4, 4, 4, 4)

Objects.Name = "Objects"
Objects.Parent = Box
Objects.BackgroundColor3 = Color3.new(1, 1, 1)
Objects.BackgroundTransparency = 1
Objects.BorderSizePixel = 0
Objects.Size = UDim2.new(1, 0, 1, 0)
Objects.ZIndex = 3
Objects.CanvasSize = UDim2.new(0, 0, 0, 0)
Objects.ScrollBarThickness = 8

UIListLayout_4.Parent = Objects
UIListLayout_4.SortOrder = Enum.SortOrder.LayoutOrder

TextButton_Roundify_4px.Name = "TextButton_Roundify_4px"
TextButton_Roundify_4px.Parent = Dropdown
TextButton_Roundify_4px.BackgroundColor3 = Color3.new(1, 1, 1)
TextButton_Roundify_4px.BackgroundTransparency = 1
TextButton_Roundify_4px.Size = UDim2.new(1, 0, 1, 0)
TextButton_Roundify_4px.Image = "rbxassetid://2851929490"
TextButton_Roundify_4px.ImageColor3 = Color3.new(0.203922, 0.207843, 0.219608)
TextButton_Roundify_4px.ScaleType = Enum.ScaleType.Slice
TextButton_Roundify_4px.SliceCenter = Rect.new(4, 4, 4, 4)

TabButton.Name = "TabButton"
TabButton.Parent = Prefabs
TabButton.BackgroundColor3 = Color3.new(0.160784, 0.290196, 0.478431)
TabButton.BackgroundTransparency = 1
TabButton.BorderSizePixel = 0
TabButton.Position = UDim2.new(0.185185179, 0, 0, 0)
TabButton.Size = UDim2.new(0, 71, 0, 20)
TabButton.ZIndex = 2
TabButton.Font = Enum.Font.GothamSemibold
TabButton.Text = "Test tab"
TabButton.TextColor3 = Color3.new(0.784314, 0.784314, 0.784314)
TabButton.TextSize = 14

TextButton_Roundify_4px_2.Name = "TextButton_Roundify_4px"
TextButton_Roundify_4px_2.Parent = TabButton
TextButton_Roundify_4px_2.BackgroundColor3 = Color3.new(1, 1, 1)
TextButton_Roundify_4px_2.BackgroundTransparency = 1
TextButton_Roundify_4px_2.Size = UDim2.new(1, 0, 1, 0)
TextButton_Roundify_4px_2.Image = "rbxassetid://2851929490"
TextButton_Roundify_4px_2.ImageColor3 = Color3.new(0.203922, 0.207843, 0.219608)
TextButton_Roundify_4px_2.ScaleType = Enum.ScaleType.Slice
TextButton_Roundify_4px_2.SliceCenter = Rect.new(4, 4, 4, 4)

Folder.Name = "Folder"
Folder.Parent = Prefabs
Folder.BackgroundColor3 = Color3.new(1, 1, 1)
Folder.BackgroundTransparency = 1
Folder.Position = UDim2.new(0, 0, 0, 50)
Folder.Size = UDim2.new(1, 0, 0, 20)
Folder.Image = "rbxassetid://2851929490"
Folder.ImageColor3 = Color3.new(0.0823529, 0.0862745, 0.0901961)
Folder.ScaleType = Enum.ScaleType.Slice
Folder.SliceCenter = Rect.new(4, 4, 4, 4)

Button.Name = "Button"
Button.Parent = Folder
Button.BackgroundColor3 = Color3.new(0.160784, 0.290196, 0.478431)
Button.BackgroundTransparency = 1
Button.BorderSizePixel = 0
Button.Size = UDim2.new(1, 0, 0, 20)
Button.ZIndex = 2
Button.Font = Enum.Font.GothamSemibold
Button.Text = "      Folder"
Button.TextColor3 = Color3.new(1, 1, 1)
Button.TextSize = 14
Button.TextXAlignment = Enum.TextXAlignment.Left

TextButton_Roundify_4px_3.Name = "TextButton_Roundify_4px"
TextButton_Roundify_4px_3.Parent = Button
TextButton_Roundify_4px_3.BackgroundColor3 = Color3.new(1, 1, 1)
TextButton_Roundify_4px_3.BackgroundTransparency = 1
TextButton_Roundify_4px_3.Size = UDim2.new(1, 0, 1, 0)
TextButton_Roundify_4px_3.Image = "rbxassetid://2851929490"
TextButton_Roundify_4px_3.ImageColor3 = Color3.new(0.160784, 0.290196, 0.478431)
TextButton_Roundify_4px_3.ScaleType = Enum.ScaleType.Slice
TextButton_Roundify_4px_3.SliceCenter = Rect.new(4, 4, 4, 4)

Toggle_2.Name = "Toggle"
Toggle_2.Parent = Button
Toggle_2.BackgroundColor3 = Color3.new(1, 1, 1)
Toggle_2.BackgroundTransparency = 1
Toggle_2.Position = UDim2.new(0, 5, 0, 0)
Toggle_2.Size = UDim2.new(0, 20, 0, 20)
Toggle_2.Image = "https://www.roblox.com/Thumbs/Asset.ashx?width=420&height=420&assetId=4731371541"

Objects_2.Name = "Objects"
Objects_2.Parent = Folder
Objects_2.BackgroundColor3 = Color3.new(1, 1, 1)
Objects_2.BackgroundTransparency = 1
Objects_2.Position = UDim2.new(0, 10, 0, 25)
Objects_2.Size = UDim2.new(1, -10, 1, -25)
Objects_2.Visible = false

UIListLayout_5.Parent = Objects_2
UIListLayout_5.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout_5.Padding = UDim.new(0, 5)

HorizontalAlignment.Name = "HorizontalAlignment"
HorizontalAlignment.Parent = Prefabs
HorizontalAlignment.BackgroundColor3 = Color3.new(1, 1, 1)
HorizontalAlignment.BackgroundTransparency = 1
HorizontalAlignment.Size = UDim2.new(1, 0, 0, 20)

UIListLayout_6.Parent = HorizontalAlignment
UIListLayout_6.FillDirection = Enum.FillDirection.Horizontal
UIListLayout_6.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout_6.Padding = UDim.new(0, 5)

Console.Name = "Console"
Console.Parent = Prefabs
Console.BackgroundColor3 = Color3.new(1, 1, 1)
Console.BackgroundTransparency = 1
Console.Size = UDim2.new(1, 0, 0, 200)
Console.Image = "rbxassetid://2851928141"
Console.ImageColor3 = Color3.new(0.129412, 0.133333, 0.141176)
Console.ScaleType = Enum.ScaleType.Slice
Console.SliceCenter = Rect.new(8, 8, 8, 8)

ScrollingFrame.Parent = Console
ScrollingFrame.BackgroundColor3 = Color3.new(1, 1, 1)
ScrollingFrame.BackgroundTransparency = 1
ScrollingFrame.BorderSizePixel = 0
ScrollingFrame.Size = UDim2.new(1, 0, 1, 1)
ScrollingFrame.CanvasSize = UDim2.new(0, 0, 0, 0)
ScrollingFrame.ScrollBarThickness = 4

Source.Name = "Source"
Source.Parent = ScrollingFrame
Source.BackgroundColor3 = Color3.new(1, 1, 1)
Source.BackgroundTransparency = 1
Source.Position = UDim2.new(0, 40, 0, 0)
Source.Size = UDim2.new(1, -40, 0, 10000)
Source.ZIndex = 3
Source.ClearTextOnFocus = false
Source.Font = Enum.Font.Code
Source.MultiLine = true
Source.PlaceholderColor3 = Color3.new(0.8, 0.8, 0.8)
Source.Text = ""
Source.TextColor3 = Color3.new(1, 1, 1)
Source.TextSize = 15
Source.TextStrokeColor3 = Color3.new(1, 1, 1)
Source.TextWrapped = true
Source.TextXAlignment = Enum.TextXAlignment.Left
Source.TextYAlignment = Enum.TextYAlignment.Top

Comments.Name = "Comments"
Comments.Parent = Source
Comments.BackgroundColor3 = Color3.new(1, 1, 1)
Comments.BackgroundTransparency = 1
Comments.Size = UDim2.new(1, 0, 1, 0)
Comments.ZIndex = 5
Comments.Font = Enum.Font.Code
Comments.Text = ""
Comments.TextColor3 = Color3.new(0.231373, 0.784314, 0.231373)
Comments.TextSize = 15
Comments.TextXAlignment = Enum.TextXAlignment.Left
Comments.TextYAlignment = Enum.TextYAlignment.Top

Globals.Name = "Globals"
Globals.Parent = Source
Globals.BackgroundColor3 = Color3.new(1, 1, 1)
Globals.BackgroundTransparency = 1
Globals.Size = UDim2.new(1, 0, 1, 0)
Globals.ZIndex = 5
Globals.Font = Enum.Font.Code
Globals.Text = ""
Globals.TextColor3 = Color3.new(0.517647, 0.839216, 0.968628)
Globals.TextSize = 15
Globals.TextXAlignment = Enum.TextXAlignment.Left
Globals.TextYAlignment = Enum.TextYAlignment.Top

Keywords.Name = "Keywords"
Keywords.Parent = Source
Keywords.BackgroundColor3 = Color3.new(1, 1, 1)
Keywords.BackgroundTransparency = 1
Keywords.Size = UDim2.new(1, 0, 1, 0)
Keywords.ZIndex = 5
Keywords.Font = Enum.Font.Code
Keywords.Text = ""
Keywords.TextColor3 = Color3.new(0.972549, 0.427451, 0.486275)
Keywords.TextSize = 15
Keywords.TextXAlignment = Enum.TextXAlignment.Left
Keywords.TextYAlignment = Enum.TextYAlignment.Top

RemoteHighlight.Name = "RemoteHighlight"
RemoteHighlight.Parent = Source
RemoteHighlight.BackgroundColor3 = Color3.new(1, 1, 1)
RemoteHighlight.BackgroundTransparency = 1
RemoteHighlight.Size = UDim2.new(1, 0, 1, 0)
RemoteHighlight.ZIndex = 5
RemoteHighlight.Font = Enum.Font.Code
RemoteHighlight.Text = ""
RemoteHighlight.TextColor3 = Color3.new(0, 0.568627, 1)
RemoteHighlight.TextSize = 15
RemoteHighlight.TextXAlignment = Enum.TextXAlignment.Left
RemoteHighlight.TextYAlignment = Enum.TextYAlignment.Top

Strings.Name = "Strings"
Strings.Parent = Source
Strings.BackgroundColor3 = Color3.new(1, 1, 1)
Strings.BackgroundTransparency = 1
Strings.Size = UDim2.new(1, 0, 1, 0)
Strings.ZIndex = 5
Strings.Font = Enum.Font.Code
Strings.Text = ""
Strings.TextColor3 = Color3.new(0.678431, 0.945098, 0.584314)
Strings.TextSize = 15
Strings.TextXAlignment = Enum.TextXAlignment.Left
Strings.TextYAlignment = Enum.TextYAlignment.Top

Tokens.Name = "Tokens"
Tokens.Parent = Source
Tokens.BackgroundColor3 = Color3.new(1, 1, 1)
Tokens.BackgroundTransparency = 1
Tokens.Size = UDim2.new(1, 0, 1, 0)
Tokens.ZIndex = 5
Tokens.Font = Enum.Font.Code
Tokens.Text = ""
Tokens.TextColor3 = Color3.new(1, 1, 1)
Tokens.TextSize = 15
Tokens.TextXAlignment = Enum.TextXAlignment.Left
Tokens.TextYAlignment = Enum.TextYAlignment.Top

Numbers.Name = "Numbers"
Numbers.Parent = Source
Numbers.BackgroundColor3 = Color3.new(1, 1, 1)
Numbers.BackgroundTransparency = 1
Numbers.Size = UDim2.new(1, 0, 1, 0)
Numbers.ZIndex = 4
Numbers.Font = Enum.Font.Code
Numbers.Text = ""
Numbers.TextColor3 = Color3.new(1, 0.776471, 0)
Numbers.TextSize = 15
Numbers.TextXAlignment = Enum.TextXAlignment.Left
Numbers.TextYAlignment = Enum.TextYAlignment.Top

Info.Name = "Info"
Info.Parent = Source
Info.BackgroundColor3 = Color3.new(1, 1, 1)
Info.BackgroundTransparency = 1
Info.Size = UDim2.new(1, 0, 1, 0)
Info.ZIndex = 5
Info.Font = Enum.Font.Code
Info.Text = ""
Info.TextColor3 = Color3.new(0, 0.635294, 1)
Info.TextSize = 15
Info.TextXAlignment = Enum.TextXAlignment.Left
Info.TextYAlignment = Enum.TextYAlignment.Top

Lines.Name = "Lines"
Lines.Parent = ScrollingFrame
Lines.BackgroundColor3 = Color3.new(1, 1, 1)
Lines.BackgroundTransparency = 1
Lines.BorderSizePixel = 0
Lines.Size = UDim2.new(0, 40, 0, 10000)
Lines.ZIndex = 4
Lines.Font = Enum.Font.Code
Lines.Text = "1\n"
Lines.TextColor3 = Color3.new(1, 1, 1)
Lines.TextSize = 15
Lines.TextWrapped = true
Lines.TextYAlignment = Enum.TextYAlignment.Top

ColorPicker.Name = "ColorPicker"
ColorPicker.Parent = Prefabs
ColorPicker.BackgroundColor3 = Color3.new(1, 1, 1)
ColorPicker.BackgroundTransparency = 1
ColorPicker.Size = UDim2.new(0, 180, 0, 110)
ColorPicker.Image = "rbxassetid://2851929490"
ColorPicker.ImageColor3 = Color3.new(0.203922, 0.207843, 0.219608)
ColorPicker.ScaleType = Enum.ScaleType.Slice
ColorPicker.SliceCenter = Rect.new(4, 4, 4, 4)

Palette.Name = "Palette"
Palette.Parent = ColorPicker
Palette.BackgroundColor3 = Color3.new(1, 1, 1)
Palette.BackgroundTransparency = 1
Palette.Position = UDim2.new(0.0500000007, 0, 0.0500000007, 0)
Palette.Size = UDim2.new(0, 100, 0, 100)
Palette.Image = "rbxassetid://698052001"
Palette.ScaleType = Enum.ScaleType.Slice
Palette.SliceCenter = Rect.new(4, 4, 4, 4)

Indicator_3.Name = "Indicator"
Indicator_3.Parent = Palette
Indicator_3.BackgroundColor3 = Color3.new(1, 1, 1)
Indicator_3.BackgroundTransparency = 1
Indicator_3.Size = UDim2.new(0, 5, 0, 5)
Indicator_3.ZIndex = 2
Indicator_3.Image = "rbxassetid://2851926732"
Indicator_3.ImageColor3 = Color3.new(0, 0, 0)
Indicator_3.ScaleType = Enum.ScaleType.Slice
Indicator_3.SliceCenter = Rect.new(12, 12, 12, 12)

Sample.Name = "Sample"
Sample.Parent = ColorPicker
Sample.BackgroundColor3 = Color3.new(1, 1, 1)
Sample.BackgroundTransparency = 1
Sample.Position = UDim2.new(0.800000012, 0, 0.0500000007, 0)
Sample.Size = UDim2.new(0, 25, 0, 25)
Sample.Image = "rbxassetid://2851929490"
Sample.ScaleType = Enum.ScaleType.Slice
Sample.SliceCenter = Rect.new(4, 4, 4, 4)

Saturation.Name = "Saturation"
Saturation.Parent = ColorPicker
Saturation.BackgroundColor3 = Color3.new(1, 1, 1)
Saturation.Position = UDim2.new(0.649999976, 0, 0.0500000007, 0)
Saturation.Size = UDim2.new(0, 15, 0, 100)
Saturation.Image = "rbxassetid://3641079629"

Indicator_4.Name = "Indicator"
Indicator_4.Parent = Saturation
Indicator_4.BackgroundColor3 = Color3.new(1, 1, 1)
Indicator_4.BorderSizePixel = 0
Indicator_4.Size = UDim2.new(0, 20, 0, 2)
Indicator_4.ZIndex = 2

Switch.Name = "Switch"
Switch.Parent = Prefabs
Switch.BackgroundColor3 = Color3.new(1, 1, 1)
Switch.BackgroundTransparency = 1
Switch.BorderSizePixel = 0
Switch.Position = UDim2.new(0.229411766, 0, 0.20714286, 0)
Switch.Size = UDim2.new(0, 20, 0, 20)
Switch.ZIndex = 2
Switch.Font = Enum.Font.SourceSans
Switch.Text = ""
Switch.TextColor3 = Color3.new(1, 1, 1)
Switch.TextSize = 18

TextButton_Roundify_4px_4.Name = "TextButton_Roundify_4px"
TextButton_Roundify_4px_4.Parent = Switch
TextButton_Roundify_4px_4.BackgroundColor3 = Color3.new(1, 1, 1)
TextButton_Roundify_4px_4.BackgroundTransparency = 1
TextButton_Roundify_4px_4.Size = UDim2.new(1, 0, 1, 0)
TextButton_Roundify_4px_4.Image = "rbxassetid://2851929490"
TextButton_Roundify_4px_4.ImageColor3 = Color3.new(0.160784, 0.290196, 0.478431)
TextButton_Roundify_4px_4.ImageTransparency = 0.5
TextButton_Roundify_4px_4.ScaleType = Enum.ScaleType.Slice
TextButton_Roundify_4px_4.SliceCenter = Rect.new(4, 4, 4, 4)

Title_3.Name = "Title"
Title_3.Parent = Switch
Title_3.BackgroundColor3 = Color3.new(1, 1, 1)
Title_3.BackgroundTransparency = 1
Title_3.Position = UDim2.new(1.20000005, 0, 0, 0)
Title_3.Size = UDim2.new(0, 20, 0, 20)
Title_3.Font = Enum.Font.GothamSemibold
Title_3.Text = "Switch"
Title_3.TextColor3 = Color3.new(0.784314, 0.784314, 0.784314)
Title_3.TextSize = 14
Title_3.TextXAlignment = Enum.TextXAlignment.Left

Button_2.Name = "Button"
Button_2.Parent = Prefabs
Button_2.BackgroundColor3 = Color3.new(0.160784, 0.290196, 0.478431)
Button_2.BackgroundTransparency = 1
Button_2.BorderSizePixel = 0
Button_2.Size = UDim2.new(0, 91, 0, 20)
Button_2.ZIndex = 2
Button_2.Font = Enum.Font.GothamSemibold
Button_2.TextColor3 = Color3.new(1, 1, 1)
Button_2.TextSize = 14

TextButton_Roundify_4px_5.Name = "TextButton_Roundify_4px"
TextButton_Roundify_4px_5.Parent = Button_2
TextButton_Roundify_4px_5.BackgroundColor3 = Color3.new(1, 1, 1)
TextButton_Roundify_4px_5.BackgroundTransparency = 1
TextButton_Roundify_4px_5.Size = UDim2.new(1, 0, 1, 0)
TextButton_Roundify_4px_5.Image = "rbxassetid://2851929490"
TextButton_Roundify_4px_5.ImageColor3 = Color3.new(0.160784, 0.290196, 0.478431)
TextButton_Roundify_4px_5.ScaleType = Enum.ScaleType.Slice
TextButton_Roundify_4px_5.SliceCenter = Rect.new(4, 4, 4, 4)

DropdownButton.Name = "DropdownButton"
DropdownButton.Parent = Prefabs
DropdownButton.BackgroundColor3 = Color3.new(0.129412, 0.133333, 0.141176)
DropdownButton.BorderSizePixel = 0
DropdownButton.Size = UDim2.new(1, 0, 0, 20)
DropdownButton.ZIndex = 3
DropdownButton.Font = Enum.Font.GothamBold
DropdownButton.Text = "      Button"
DropdownButton.TextColor3 = Color3.new(0.784314, 0.784314, 0.784314)
DropdownButton.TextSize = 14
DropdownButton.TextXAlignment = Enum.TextXAlignment.Left

Keybind.Name = "Keybind"
Keybind.Parent = Prefabs
Keybind.BackgroundColor3 = Color3.new(1, 1, 1)
Keybind.BackgroundTransparency = 1
Keybind.Size = UDim2.new(0, 200, 0, 20)
Keybind.Image = "rbxassetid://2851929490"
Keybind.ImageColor3 = Color3.new(0.203922, 0.207843, 0.219608)
Keybind.ScaleType = Enum.ScaleType.Slice
Keybind.SliceCenter = Rect.new(4, 4, 4, 4)

Title_4.Name = "Title"
Title_4.Parent = Keybind
Title_4.BackgroundColor3 = Color3.new(1, 1, 1)
Title_4.BackgroundTransparency = 1
Title_4.Size = UDim2.new(0, 0, 1, 0)
Title_4.Font = Enum.Font.GothamBold
Title_4.Text = "Keybind"
Title_4.TextColor3 = Color3.new(0.784314, 0.784314, 0.784314)
Title_4.TextSize = 14
Title_4.TextXAlignment = Enum.TextXAlignment.Left

Input.Name = "Input"
Input.Parent = Keybind
Input.BackgroundColor3 = Color3.new(1, 1, 1)
Input.BackgroundTransparency = 1
Input.BorderSizePixel = 0
Input.Position = UDim2.new(1, -85, 0, 2)
Input.Size = UDim2.new(0, 80, 1, -4)
Input.ZIndex = 2
Input.Font = Enum.Font.GothamSemibold
Input.Text = "RShift"
Input.TextColor3 = Color3.new(0.784314, 0.784314, 0.784314)
Input.TextSize = 12
Input.TextWrapped = true

Input_Roundify_4px.Name = "Input_Roundify_4px"
Input_Roundify_4px.Parent = Input
Input_Roundify_4px.BackgroundColor3 = Color3.new(1, 1, 1)
Input_Roundify_4px.BackgroundTransparency = 1
Input_Roundify_4px.Size = UDim2.new(1, 0, 1, 0)
Input_Roundify_4px.Image = "rbxassetid://2851929490"
Input_Roundify_4px.ImageColor3 = Color3.new(0.290196, 0.294118, 0.313726)
Input_Roundify_4px.ScaleType = Enum.ScaleType.Slice
Input_Roundify_4px.SliceCenter = Rect.new(4, 4, 4, 4)

Windows.Name = "Windows"
Windows.Parent = imgui
Windows.BackgroundColor3 = Color3.new(1, 1, 1)
Windows.BackgroundTransparency = 1
Windows.Position = UDim2.new(0, 20, 0, 20)
Windows.Size = UDim2.new(1, 20, 1, -20)

--[[ Script ]]--
script.Parent = imgui

local UIS = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local RS = game:GetService("RunService")
local ps = game:GetService("Players")

local p = ps.LocalPlayer
local mouse = p:GetMouse()

local Prefabs = script.Parent:WaitForChild("Prefabs")
local Windows = script.Parent:FindFirstChild("Windows")

local checks = {
	["binding"] = false,
}

UIS.InputBegan:Connect(function(input, gameProcessed)
	if input.KeyCode == ((typeof(ui_options.toggle_key) == "EnumItem") and ui_options.toggle_key or Enum.KeyCode.RightShift) then
		if script.Parent then
			if not checks.binding then
				script.Parent.Enabled = not script.Parent.Enabled
			end
		end
	end
end)

local function Resize(part, new, _delay)
	_delay = _delay or 0.5
	local tweenInfo = TweenInfo.new(_delay, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
	local tween = TweenService:Create(part, tweenInfo, new)
	tween:Play()
end

local function rgbtohsv(r, g, b) -- idk who made this function, but thanks
	r, g, b = r / 255, g / 255, b / 255
	local max, min = math.max(r, g, b), math.min(r, g, b)
	local h, s, v
	v = max

	local d = max - min
	if max == 0 then
		s = 0
	else
		s = d / max
	end

	if max == min then
		h = 0
	else
		if max == r then
			h = (g - b) / d
			if g < b then
				h = h + 6
			end
		elseif max == g then
			h = (b - r) / d + 2
		elseif max == b then
			h = (r - g) / d + 4
		end
		h = h / 6
	end

	return h, s, v
end

local function hasprop(object, prop)
	local a, b = pcall(function()
		return object[tostring(prop)]
	end)
	if a then
		return b
	end
end

local function gNameLen(obj)
	return obj.TextBounds.X + 15
end

local function gMouse()
	return Vector2.new(UIS:GetMouseLocation().X + 1, UIS:GetMouseLocation().Y - 35)
end

local function ripple(button, x, y)
	spawn(function()
		button.ClipsDescendants = true

		local circle = Prefabs:FindFirstChild("Circle"):Clone()

		circle.Parent = button
		circle.ZIndex = 1000

		local new_x = x - circle.AbsolutePosition.X
		local new_y = y - circle.AbsolutePosition.Y
		circle.Position = UDim2.new(0, new_x, 0, new_y)

		local size = 0
		if button.AbsoluteSize.X > button.AbsoluteSize.Y then
			 size = button.AbsoluteSize.X * 1.5
		elseif button.AbsoluteSize.X < button.AbsoluteSize.Y then
			 size = button.AbsoluteSize.Y * 1.5
		elseif button.AbsoluteSize.X == button.AbsoluteSize.Y then
			size = button.AbsoluteSize.X * 1.5
		end

		circle:TweenSizeAndPosition(UDim2.new(0, size, 0, size), UDim2.new(0.5, -size / 2, 0.5, -size / 2), "Out", "Quad", 0.5, false, nil)
		Resize(circle, {ImageTransparency = 1}, 0.5)

		wait(0.5)
		circle:Destroy()
	end)
end

local windows = 0
local library = {}

local function format_windows()
	local ull = Prefabs:FindFirstChild("UIListLayout"):Clone()
	ull.Parent = Windows
	local data = {}

	for i,v in next, Windows:GetChildren() do
		if not (v:IsA("UIListLayout")) then
			data[v] = v.AbsolutePosition
		end
	end

	ull:Destroy()

	for i,v in next, data do
		i.Position = UDim2.new(0, v.X, 0, v.Y)
	end
end

function library:FormatWindows()
	format_windows()
end

function library:AddWindow(title, options)
	windows = windows + 1
	local dropdown_open = false
	title = tostring(title or "New Window")
	options = (typeof(options) == "table") and options or ui_options
	options.tween_time = 0.1

	local Window = Prefabs:FindFirstChild("Window"):Clone()
	Window.Parent = Windows
	Window:FindFirstChild("Title").Text = title
	Window.Size = UDim2.new(0, options.min_size.X, 0, options.min_size.Y)
	Window.ZIndex = Window.ZIndex + (windows * 10)

	do -- Altering Window Color
		local Title = Window:FindFirstChild("Title")
		local Bar = Window:FindFirstChild("Bar")
		local Base = Bar:FindFirstChild("Base")
		local Top = Bar:FindFirstChild("Top")
		local SplitFrame = Window:FindFirstChild("TabSelection"):FindFirstChild("Frame")
		local Toggle = Bar:FindFirstChild("Toggle")

		spawn(function()
			while true do
				Bar.BackgroundColor3 = options.main_color
				Base.BackgroundColor3 = options.main_color
				Base.ImageColor3 = options.main_color
				Top.ImageColor3 = options.main_color
				SplitFrame.BackgroundColor3 = options.main_color

				RS.Heartbeat:Wait()
			end
		end)

	end

	local Resizer = Window:WaitForChild("Resizer")

	local window_data = {}
	Window.Draggable = true

	do -- Resize Window
		local oldIcon = mouse.Icon
		local Entered = false
		Resizer.MouseEnter:Connect(function()
			Window.Draggable = false
			if options.can_resize then
				oldIcon = mouse.Icon
				-- mouse.Icon = "http://www.roblox.com/asset?id=4745131330"
			end
			Entered = true
		end)

		Resizer.MouseLeave:Connect(function()
			Entered = false
			if options.can_resize then
				mouse.Icon = oldIcon
			end
			Window.Draggable = true
		end)

		local Held = false
		UIS.InputBegan:Connect(function(inputObject)
			if inputObject.UserInputType == Enum.UserInputType.MouseButton1 then
				Held = true

				spawn(function() -- Loop check
					if Entered and Resizer.Active and options.can_resize then
						while Held and Resizer.Active do

							local mouse_location = gMouse()
							local x = mouse_location.X - Window.AbsolutePosition.X
							local y = mouse_location.Y - Window.AbsolutePosition.Y

							--
							if x >= options.min_size.X and y >= options.min_size.Y then
								Resize(Window, {Size = UDim2.new(0, x, 0, y)}, options.tween_time)
							elseif x >= options.min_size.X then
								Resize(Window, {Size = UDim2.new(0, x, 0, options.min_size.Y)}, options.tween_time)
							elseif y >= options.min_size.Y then
								Resize(Window, {Size = UDim2.new(0, options.min_size.X, 0, y)}, options.tween_time)
							else
								Resize(Window, {Size = UDim2.new(0, options.min_size.X, 0, options.min_size.Y)}, options.tween_time)
							end

							RS.Heartbeat:Wait()
						end
					end
				end)
			end
		end)
		UIS.InputEnded:Connect(function(inputObject)
			if inputObject.UserInputType == Enum.UserInputType.MouseButton1 then
				Held = false
			end
		end)
	end

	do -- [Open / Close] Window
		local open_close = Window:FindFirstChild("Bar"):FindFirstChild("Toggle")
		local open = true
		local canopen = true

		local oldwindowdata = {}
		local oldy = Window.AbsoluteSize.Y
		open_close.MouseButton1Click:Connect(function()
			if canopen then
				canopen = false

				if open then
					-- Close

					oldwindowdata = {}
					for i,v in next, Window:FindFirstChild("Tabs"):GetChildren() do
						oldwindowdata[v] = v.Visible
						v.Visible = false
					end

					Resizer.Active = false

					oldy = Window.AbsoluteSize.Y
					Resize(open_close, {Rotation = 0}, options.tween_time)
					Resize(Window, {Size = UDim2.new(0, Window.AbsoluteSize.X, 0, 26)}, options.tween_time)
					open_close.Parent:FindFirstChild("Base").Transparency = 1

				else
					-- Open

					for i,v in next, oldwindowdata do
						i.Visible = v
					end

					Resizer.Active = true

					Resize(open_close, {Rotation = 90}, options.tween_time)
					Resize(Window, {Size = UDim2.new(0, Window.AbsoluteSize.X, 0, oldy)}, options.tween_time)
					open_close.Parent:FindFirstChild("Base").Transparency = 0

				end

				open = not open
				wait(options.tween_time)
				canopen = true

			end
		end)
	end

	do -- UI Elements
		local tabs = Window:FindFirstChild("Tabs")
		local tab_selection = Window:FindFirstChild("TabSelection")
		local tab_buttons = tab_selection:FindFirstChild("TabButtons")

		do -- Add Tab
			function window_data:AddTab(tab_name)
				local tab_data = {}
				tab_name = tostring(tab_name or "New Tab")
				tab_selection.Visible = true

				local new_button = Prefabs:FindFirstChild("TabButton"):Clone()
				new_button.Parent = tab_buttons
				new_button.Text = tab_name
				new_button.Size = UDim2.new(0, gNameLen(new_button), 0, 20)
				new_button.ZIndex = new_button.ZIndex + (windows * 10)
				new_button:GetChildren()[1].ZIndex = new_button:GetChildren()[1].ZIndex + (windows * 10)

				local new_tab = Prefabs:FindFirstChild("Tab"):Clone()
				new_tab.Parent = tabs
				new_tab.ZIndex = new_tab.ZIndex + (windows * 10)

				local function show()
					if dropdown_open then return end
					for i, v in next, tab_buttons:GetChildren() do
						if not (v:IsA("UIListLayout")) then
							v:GetChildren()[1].ImageColor3 = Color3.fromRGB(52, 53, 56)
							Resize(v, {Size = UDim2.new(0, v.AbsoluteSize.X, 0, 20)}, options.tween_time)
						end
					end
					for i, v in next, tabs:GetChildren() do
						v.Visible = false
					end

					Resize(new_button, {Size = UDim2.new(0, new_button.AbsoluteSize.X, 0, 25)}, options.tween_time)
					new_button:GetChildren()[1].ImageColor3 = Color3.fromRGB(73, 75, 79)
					new_tab.Visible = true
				end

				new_button.MouseButton1Click:Connect(function()
					show()
				end)

				function tab_data:Show()
					show()
				end

				do -- Tab Elements

					function tab_data:AddLabel(label_text) -- [Label]
						label_text = tostring(label_text or "New Label")

						local label = Prefabs:FindFirstChild("Label"):Clone()

						label.Parent = new_tab
						label.Text = label_text
						label.Size = UDim2.new(0, gNameLen(label), 0, 20)
						label.ZIndex = label.ZIndex + (windows * 10)

						return label
					end

					function tab_data:AddButton(button_text, callback) -- [Button]
						button_text = tostring(button_text or "New Button")
						callback = typeof(callback) == "function" and callback or function()end

						local button = Prefabs:FindFirstChild("Button"):Clone()

						button.Parent = new_tab
						button.Text = button_text
						button.Size = UDim2.new(0, gNameLen(button), 0, 20)
						button.ZIndex = button.ZIndex + (windows * 10)
						button:GetChildren()[1].ZIndex = button:GetChildren()[1].ZIndex + (windows * 10)

						spawn(function()
							while true do
								if button and button:GetChildren()[1] then
									button:GetChildren()[1].ImageColor3 = options.main_color
								end
								RS.Heartbeat:Wait()
							end
						end)

						button.MouseButton1Click:Connect(function()
							ripple(button, mouse.X, mouse.Y)
							pcall(callback)
						end)

						return button
					end

					function tab_data:AddSwitch(switch_text, callback) -- [Switch]
						local switch_data = {}

						switch_text = tostring(switch_text or "New Switch")
						callback = typeof(callback) == "function" and callback or function()end

						local switch = Prefabs:FindFirstChild("Switch"):Clone()

						switch.Parent = new_tab
						switch:FindFirstChild("Title").Text = switch_text

						switch:FindFirstChild("Title").ZIndex = switch:FindFirstChild("Title").ZIndex + (windows * 10)
						switch.ZIndex = switch.ZIndex + (windows * 10)
						switch:GetChildren()[1].ZIndex = switch:GetChildren()[1].ZIndex + (windows * 10)

						spawn(function()
							while true do
								if switch and switch:GetChildren()[1] then
									switch:GetChildren()[1].ImageColor3 = options.main_color
								end
								RS.Heartbeat:Wait()
							end
						end)

						local toggled = false
						switch.MouseButton1Click:Connect(function()
							toggled = not toggled
							switch.Text = toggled and utf8.char(10003) or ""
							pcall(callback, toggled)
						end)

						function switch_data:Set(bool)
							toggled = (typeof(bool) == "boolean") and bool or false
							switch.Text = toggled and utf8.char(10003) or ""
							pcall(callback,toggled)
						end

						return switch_data, switch
					end

					function tab_data:AddTextBox(textbox_text, callback, textbox_options)
						textbox_text = tostring(textbox_text or "New TextBox")
						callback = typeof(callback) == "function" and callback or function()end
						textbox_options = typeof(textbox_options) == "table" and textbox_options or {["clear"] = true}
						textbox_options = {
							["clear"] = ((textbox_options.clear) == true)
						}

						local textbox = Prefabs:FindFirstChild("TextBox"):Clone()

						textbox.Parent = new_tab
						textbox.PlaceholderText = textbox_text
						textbox.ZIndex = textbox.ZIndex + (windows * 10)
						textbox:GetChildren()[1].ZIndex = textbox:GetChildren()[1].ZIndex + (windows * 10)

						textbox.FocusLost:Connect(function(ep)
							if ep then
								if #textbox.Text > 0 then
									pcall(callback, textbox.Text)
									if textbox_options.clear then
										textbox.Text = ""
									end
								end
							end
						end)

						return textbox
					end

					function tab_data:AddSlider(slider_text, callback, slider_options)
						local slider_data = {}

						slider_text = tostring(slider_text or "New Slider")
						callback = typeof(callback) == "function" and callback or function()end
						slider_options = typeof(slider_options) == "table" and slider_options or {}
						slider_options = {
							["min"] = slider_options.min or 0,
							["max"] = slider_options.max or 100,
							["readonly"] = slider_options.readonly or false,
						}

						local slider = Prefabs:FindFirstChild("Slider"):Clone()

						slider.Parent = new_tab
						slider.ZIndex = slider.ZIndex + (windows * 10)

						local title = slider:FindFirstChild("Title")
						local indicator = slider:FindFirstChild("Indicator")
						local value = slider:FindFirstChild("Value")
						title.ZIndex = title.ZIndex + (windows * 10)
						indicator.ZIndex = indicator.ZIndex + (windows * 10)
						value.ZIndex = value.ZIndex + (windows * 10)

						title.Text = slider_text

						do -- Slider Math
							local Entered = false
							slider.MouseEnter:Connect(function()
								Entered = true
								Window.Draggable = false
							end)
							slider.MouseLeave:Connect(function()
								Entered = false
								Window.Draggable = true
							end)

							local Held = false
							UIS.InputBegan:Connect(function(inputObject)
								if inputObject.UserInputType == Enum.UserInputType.MouseButton1 then
									Held = true

									spawn(function() -- Loop check
										if Entered and not slider_options.readonly then
											while Held and (not dropdown_open) do
												local mouse_location = gMouse()
												local x = (slider.AbsoluteSize.X - (slider.AbsoluteSize.X - ((mouse_location.X - slider.AbsolutePosition.X)) + 1)) / slider.AbsoluteSize.X

												local min = 0
												local max = 1

												local size = min
												if x >= min and x <= max then
													size = x
												elseif x < min then
													size = min
												elseif x > max then
													size = max
												end

												Resize(indicator, {Size = UDim2.new(size or min, 0, 0, 20)}, options.tween_time)
												local p = math.floor((size or min) * 100)

												local maxv = slider_options.max
												local minv = slider_options.min
												local diff = maxv - minv

												local sel_value = math.floor(((diff / 100) * p) + minv)

												value.Text = tostring(sel_value)
												pcall(callback, sel_value)

												RS.Heartbeat:Wait()
											end
										end
									end)
								end
							end)
							UIS.InputEnded:Connect(function(inputObject)
								if inputObject.UserInputType == Enum.UserInputType.MouseButton1 then
									Held = false
								end
							end)

							function slider_data:Set(new_value)
								new_value = tonumber(new_value) or 0
								new_value = (((new_value >= 0 and new_value <= 100) and new_value) / 100)

								Resize(indicator, {Size = UDim2.new(new_value or 0, 0, 0, 20)}, options.tween_time)
								local p = math.floor((new_value or 0) * 100)

								local maxv = slider_options.max
								local minv = slider_options.min
								local diff = maxv - minv

								local sel_value = math.floor(((diff / 100) * p) + minv)

								value.Text = tostring(sel_value)
								pcall(callback, sel_value)
							end

							slider_data:Set(slider_options["min"])
						end

						return slider_data, slider
					end

					function tab_data:AddKeybind(keybind_name, callback, keybind_options)
						local keybind_data = {}

						keybind_name = tostring(keybind_name or "New Keybind")
						callback = typeof(callback) == "function" and callback or function()end
						keybind_options = typeof(keybind_options) == "table" and keybind_options or {}
						keybind_options = {
							["standard"] = keybind_options.standard or Enum.KeyCode.RightShift,
						}

						local keybind = Prefabs:FindFirstChild("Keybind"):Clone()
						local input = keybind:FindFirstChild("Input")
						local title = keybind:FindFirstChild("Title")
						keybind.ZIndex = keybind.ZIndex + (windows * 10)
						input.ZIndex = input.ZIndex + (windows * 10)
						input:GetChildren()[1].ZIndex = input:GetChildren()[1].ZIndex + (windows * 10)
						title.ZIndex = title.ZIndex + (windows * 10)

						keybind.Parent = new_tab
						title.Text = "  " .. keybind_name
						keybind.Size = UDim2.new(0, gNameLen(title) + 80, 0, 20)

						local shortkeys = { -- thanks to stroketon for helping me out with this
				            RightControl = 'RightCtrl',
				            LeftControl = 'LeftCtrl',
				            LeftShift = 'LShift',
				            RightShift = 'RShift',
				            MouseButton1 = "Mouse1",
				            MouseButton2 = "Mouse2"
				        }

						local keybind = keybind_options.standard

						function keybind_data:SetKeybind(Keybind)
							local key = shortkeys[Keybind.Name] or Keybind.Name
							input.Text = key
							keybind = Keybind
						end

						UIS.InputBegan:Connect(function(a, b)
							if checks.binding then
								spawn(function()
									wait()
									checks.binding = false
								end)
								return
							end
							if a.KeyCode == keybind and not b then
								pcall(callback, keybind)
							end
						end)

						keybind_data:SetKeybind(keybind_options.standard)

						input.MouseButton1Click:Connect(function()
							if checks.binding then return end
							input.Text = "..."
							checks.binding = true
							local a, b = UIS.InputBegan:Wait()
							keybind_data:SetKeybind(a.KeyCode)
						end)

						return keybind_data, keybind
					end

					function tab_data:AddDropdown(dropdown_name, callback)
						local dropdown_data = {}
						dropdown_name = tostring(dropdown_name or "New Dropdown")
						callback = typeof(callback) == "function" and callback or function()end

						local dropdown = Prefabs:FindFirstChild("Dropdown"):Clone()
						local box = dropdown:FindFirstChild("Box")
						local objects = box:FindFirstChild("Objects")
						local indicator = dropdown:FindFirstChild("Indicator")
						dropdown.ZIndex = dropdown.ZIndex + (windows * 10)
						box.ZIndex = box.ZIndex + (windows * 10)
						objects.ZIndex = objects.ZIndex + (windows * 10)
						indicator.ZIndex = indicator.ZIndex + (windows * 10)
						dropdown:GetChildren()[3].ZIndex = dropdown:GetChildren()[3].ZIndex + (windows * 10)

						dropdown.Parent = new_tab
						dropdown.Text = "      " .. dropdown_name
						box.Size = UDim2.new(1, 0, 0, 0)

						local open = false
						dropdown.MouseButton1Click:Connect(function()
							open = not open

							local len = (#objects:GetChildren() - 1) * 20
							if #objects:GetChildren() - 1 >= 10 then
								len = 10 * 20
								objects.CanvasSize = UDim2.new(0, 0, (#objects:GetChildren() - 1) * 0.1, 0)
							end

							if open then -- Open
								if dropdown_open then return end
								dropdown_open = true
								Resize(box, {Size = UDim2.new(1, 0, 0, len)}, options.tween_time)
								Resize(indicator, {Rotation = 90}, options.tween_time)
							else -- Close
								dropdown_open = false
								Resize(box, {Size = UDim2.new(1, 0, 0, 0)}, options.tween_time)
								Resize(indicator, {Rotation = -90}, options.tween_time)
							end

						end)

						function dropdown_data:Add(n)
							local object_data = {}
							n = tostring(n or "New Object")

							local object = Prefabs:FindFirstChild("DropdownButton"):Clone()

							object.Parent = objects
							object.Text = n
							object.ZIndex = object.ZIndex + (windows * 10)

							object.MouseEnter:Connect(function()
								object.BackgroundColor3 = options.main_color
							end)
							object.MouseLeave:Connect(function()
								object.BackgroundColor3 = Color3.fromRGB(33, 34, 36)
							end)

							if open then
								local len = (#objects:GetChildren() - 1) * 20
								if #objects:GetChildren() - 1 >= 10 then
									len = 10 * 20
									objects.CanvasSize = UDim2.new(0, 0, (#objects:GetChildren() - 1) * 0.1, 0)
								end
								Resize(box, {Size = UDim2.new(1, 0, 0, len)}, options.tween_time)
							end

							object.MouseButton1Click:Connect(function()
								if dropdown_open then
									dropdown.Text = "      [ " .. n .. " ]"
									dropdown_open = false
									open = false
									Resize(box, {Size = UDim2.new(1, 0, 0, 0)}, options.tween_time)
									Resize(indicator, {Rotation = -90}, options.tween_time)
									pcall(callback, n)
								end
							end)

							function object_data:Remove()
								object:Destroy()
							end

							return object, object_data
						end

						return dropdown_data, dropdown
					end

					function tab_data:AddColorPicker(callback)
						local color_picker_data = {}
						callback = typeof(callback) == "function" and callback or function()end

						local color_picker = Prefabs:FindFirstChild("ColorPicker"):Clone()

						color_picker.Parent = new_tab
						color_picker.ZIndex = color_picker.ZIndex + (windows * 10)

						local palette = color_picker:FindFirstChild("Palette")
						local sample = color_picker:FindFirstChild("Sample")
						local saturation = color_picker:FindFirstChild("Saturation")
						palette.ZIndex = palette.ZIndex + (windows * 10)
						sample.ZIndex = sample.ZIndex + (windows * 10)
						saturation.ZIndex = saturation.ZIndex + (windows * 10)

						do -- Color Picker Math
							local h = 0
							local s = 1
							local v = 1

							local function update()
								local color = Color3.fromHSV(h, s, v)
								sample.ImageColor3 = color
								saturation.ImageColor3 = Color3.fromHSV(h, 1, 1)
								pcall(callback, color)
							end

							do
								local color = Color3.fromHSV(h, s, v)
								sample.ImageColor3 = color
								saturation.ImageColor3 = Color3.fromHSV(h, 1, 1)
							end

							local Entered1, Entered2 = false, false
							palette.MouseEnter:Connect(function()
								Window.Draggable = false
								Entered1 = true
							end)
							palette.MouseLeave:Connect(function()
								Window.Draggable = true
								Entered1 = false
							end)
							saturation.MouseEnter:Connect(function()
								Window.Draggable = false
								Entered2 = true
							end)
							saturation.MouseLeave:Connect(function()
								Window.Draggable = true
								Entered2 = false
							end)

							local palette_indicator = palette:FindFirstChild("Indicator")
							local saturation_indicator = saturation:FindFirstChild("Indicator")
							palette_indicator.ZIndex = palette_indicator.ZIndex + (windows * 10)
							saturation_indicator.ZIndex = saturation_indicator.ZIndex + (windows * 10)

							local Held = false
							UIS.InputBegan:Connect(function(inputObject)
								if inputObject.UserInputType == Enum.UserInputType.MouseButton1 then
									Held = true

									spawn(function() -- Loop check
										while Held and Entered1 and (not dropdown_open) do -- Palette
											local mouse_location = gMouse()

											local x = ((palette.AbsoluteSize.X - (mouse_location.X - palette.AbsolutePosition.X)) + 1)
											local y = ((palette.AbsoluteSize.Y - (mouse_location.Y - palette.AbsolutePosition.Y)) + 1.5)

											local color = Color3.fromHSV(x / 100, y / 100, 0)
											h = x / 100
											s = y / 100

											Resize(palette_indicator, {Position = UDim2.new(0, math.abs(x - 100) - (palette_indicator.AbsoluteSize.X / 2), 0, math.abs(y - 100) - (palette_indicator.AbsoluteSize.Y / 2))}, options.tween_time)

											update()
											RS.Heartbeat:Wait()
										end

										while Held and Entered2 and (not dropdown_open) do -- Saturation
											local mouse_location = gMouse()
											local y = ((palette.AbsoluteSize.Y - (mouse_location.Y - palette.AbsolutePosition.Y)) + 1.5)
											v = y / 100

											Resize(saturation_indicator, {Position = UDim2.new(0, 0, 0, math.abs(y - 100))}, options.tween_time)

											update()
											RS.Heartbeat:Wait()
										end
									end)
								end
							end)
							UIS.InputEnded:Connect(function(inputObject)
								if inputObject.UserInputType == Enum.UserInputType.MouseButton1 then
									Held = false
								end
							end)

							function color_picker_data:Set(color)
								color = typeof(color) == "Color3" and color or Color3.new(1, 1, 1)
								local h2, s2, v2 = rgbtohsv(color.r * 255, color.g * 255, color.b * 255)
								sample.ImageColor3 = color
								saturation.ImageColor3 = Color3.fromHSV(h2, 1, 1)
								pcall(callback, color)
							end
						end

						return color_picker_data, color_picker
					end

					function tab_data:AddConsole(console_options)
						local console_data = {}

						console_options = typeof(console_options) == "table" and console_options or {["readonly"] = true,["full"] = false,}
						console_options = {
							["y"] = tonumber(console_options.y) or 200,
							["source"] = console_options.source or "Logs",
							["readonly"] = ((console_options.readonly) == true),
							["full"] = ((console_options.full) == true),
						}

						local console = Prefabs:FindFirstChild("Console"):Clone()

						console.Parent = new_tab
						console.ZIndex = console.ZIndex + (windows * 10)
						console.Size = UDim2.new(1, 0, console_options.full and 1 or 0, console_options.y)

						local sf = console:GetChildren()[1]
						local Source = sf:FindFirstChild("Source")
						local Lines = sf:FindFirstChild("Lines")
						Source.ZIndex = Source.ZIndex + (windows * 10)
						Lines.ZIndex = Lines.ZIndex + (windows * 10)

						Source.TextEditable = not console_options.readonly

						do -- Syntax Zindex
							for i,v in next, Source:GetChildren() do
								v.ZIndex = v.ZIndex + (windows * 10) + 1
							end
						end
						Source.Comments.ZIndex = Source.Comments.ZIndex + 1

						do -- Highlighting (thanks to whoever made this)
							local lua_keywords = {"and", "break", "do", "else", "elseif", "end", "false", "for", "function", "goto", "if", "in", "local", "nil", "not", "or", "repeat", "return", "then", "true", "until", "while"}
							local global_env = {"getrawmetatable", "newcclosure", "islclosure", "setclipboard", "game", "workspace", "script", "math", "string", "table", "print", "wait", "BrickColor", "Color3", "next", "pairs", "ipairs", "select", "unpack", "Instance", "Vector2", "Vector3", "CFrame", "Ray", "UDim2", "Enum", "assert", "error", "warn", "tick", "loadstring", "_G", "shared", "getfenv", "setfenv", "newproxy", "setmetatable", "getmetatable", "os", "debug", "pcall", "ypcall", "xpcall", "rawequal", "rawset", "rawget", "tonumber", "tostring", "type", "typeof", "_VERSION", "coroutine", "delay", "require", "spawn", "LoadLibrary", "settings", "stats", "time", "UserSettings", "version", "Axes", "ColorSequence", "Faces", "ColorSequenceKeypoint", "NumberRange", "NumberSequence", "NumberSequenceKeypoint", "gcinfo", "elapsedTime", "collectgarbage", "PhysicalProperties", "Rect", "Region3", "Region3int16", "UDim", "Vector2int16", "Vector3int16", "load", "fire", "Fire"}

							local Highlight = function(string, keywords)
							    local K = {}
							    local S = string
							    local Token =
							    {
							        ["="] = true,
							        ["."] = true,
							        [","] = true,
							        ["("] = true,
							        [")"] = true,
							        ["["] = true,
							        ["]"] = true,
							        ["{"] = true,
							        ["}"] = true,
							        [":"] = true,
							        ["*"] = true,
							        ["/"] = true,
							        ["+"] = true,
							        ["-"] = true,
							        ["%"] = true,
									[";"] = true,
									["~"] = true
							    }
							    for i, v in pairs(keywords) do
							        K[v] = true
							    end
							    S = S:gsub(".", function(c)
							        if Token[c] ~= nil then
							            return "\32"
							        else
							            return c
							        end
							    end)
							    S = S:gsub("%S+", function(c)
							        if K[c] ~= nil then
							            return c
							        else
							            return (" "):rep(#c)
							        end
							    end)

							    return S
							end

							local hTokens = function(string)
							    local Token =
							    {
							        ["="] = true,
							        ["."] = true,
							        [","] = true,
							        ["("] = true,
							        [")"] = true,
							        ["["] = true,
							        ["]"] = true,
							        ["{"] = true,
							        ["}"] = true,
							        [":"] = true,
							        ["*"] = true,
							        ["/"] = true,
							        ["+"] = true,
							        ["-"] = true,
							        ["%"] = true,
									[";"] = true,
									["~"] = true
							    }
							    local A = ""
							    string:gsub(".", function(c)
							        if Token[c] ~= nil then
							            A = A .. c
							        elseif c == "\n" then
							            A = A .. "\n"
									elseif c == "\t" then
										A = A .. "\t"
							        else
							            A = A .. "\32"
							        end
							    end)

							    return A
							end

							local strings = function(string)
							    local highlight = ""
							    local quote = false
							    string:gsub(".", function(c)
							        if quote == false and c == "\34" then
							            quote = true
							        elseif quote == true and c == "\34" then
							            quote = false
							        end
							        if quote == false and c == "\34" then
							            highlight = highlight .. "\34"
							        elseif c == "\n" then
							            highlight = highlight .. "\n"
									elseif c == "\t" then
									    highlight = highlight .. "\t"
							        elseif quote == true then
							            highlight = highlight .. c
							        elseif quote == false then
							            highlight = highlight .. "\32"
							        end
							    end)

							    return highlight
							end

							local info = function(string)
							    local highlight = ""
							    local quote = false
							    string:gsub(".", function(c)
							        if quote == false and c == "[" then
							            quote = true
							        elseif quote == true and c == "]" then
							            quote = false
							        end
							        if quote == false and c == "\]" then
							            highlight = highlight .. "\]"
							        elseif c == "\n" then
							            highlight = highlight .. "\n"
									elseif c == "\t" then
									    highlight = highlight .. "\t"
							        elseif quote == true then
							            highlight = highlight .. c
							        elseif quote == false then
							            highlight = highlight .. "\32"
							        end
							    end)

							    return highlight
							end

							local comments = function(string)
							    local ret = ""
							    string:gsub("[^\r\n]+", function(c)
							        local comm = false
							        local i = 0
							        c:gsub(".", function(n)
							            i = i + 1
							            if c:sub(i, i + 1) == "--" then
							                comm = true
							            end
							            if comm == true then
							                ret = ret .. n
							            else
							                ret = ret .. "\32"
							            end
							        end)
							        ret = ret
							    end)

							    return ret
							end

							local numbers = function(string)
							    local A = ""
							    string:gsub(".", function(c)
							        if tonumber(c) ~= nil then
							            A = A .. c
							        elseif c == "\n" then
							            A = A .. "\n"
									elseif c == "\t" then
										A = A .. "\t"
							        else
							            A = A .. "\32"
							        end
							    end)

							    return A
							end

							local highlight_lua = function(type)
								if type == "Text" then
									Source.Text = Source.Text:gsub("\13", "")
									Source.Text = Source.Text:gsub("\t", "      ")
									local s = Source.Text

									Source.Keywords.Text = Highlight(s, lua_keywords)
									Source.Globals.Text = Highlight(s, global_env)
									Source.RemoteHighlight.Text = Highlight(s, {"FireServer", "fireServer", "InvokeServer", "invokeServer"})
									Source.Tokens.Text = hTokens(s)
									Source.Numbers.Text = numbers(s)
									Source.Strings.Text = strings(s)
									Source.Comments.Text = comments(s)

									local lin = 1
									s:gsub("\n", function()
										lin = lin + 1
									end)

									Lines.Text = ""
									for i = 1, lin do
										Lines.Text = Lines.Text .. i .. "\n"
									end

									sf.CanvasSize = UDim2.new(0, 0, lin * 0.153846154, 0)
								end

							local highlight_logs = function(type)
							end
								if type == "Text" then
									Source.Text = Source.Text:gsub("\13", "")
									Source.Text = Source.Text:gsub("\t", "      ")
									local s = Source.Text

									Source.Info.Text = info(s)

									local lin = 1
									s:gsub("\n", function()
										lin = lin + 1
									end)

									sf.CanvasSize = UDim2.new(0, 0, lin * 0.153846154, 0)
								end
							end

							if console_options.source == "Lua" then
								highlight_lua("Text")
								Source.Changed:Connect(highlight_lua)
							elseif console_options.source == "Logs" then
								Lines.Visible = false

								highlight_logs("Text")
								Source.Changed:Connect(highlight_logs)
							end

							function console_data:Set(code)
								Source.Text = tostring(code)
							end

							function console_data:Get()
								return Source.Text
							end

							function console_data:Log(msg)
								Source.Text = Source.Text .. "[*] " .. tostring(msg) .. "\n"
							end

						end

						return console_data, console
					end

					function tab_data:AddHorizontalAlignment()
						local ha_data = {}

						local ha = Prefabs:FindFirstChild("HorizontalAlignment"):Clone()
						ha.Parent = new_tab

						function ha_data:AddButton(...)
							local data, object
							local ret = {tab_data:AddButton(...)}
							if typeof(ret[1]) == "table" then
								data = ret[1]
								object = ret[2]
								object.Parent = ha
								return data, object
							else
								object = ret[1]
								object.Parent = ha
								return object
							end
						end

						return ha_data, ha
					end

					function tab_data:AddFolder(folder_name) -- [Folder]
						local folder_data = {}

						folder_name = tostring(folder_name or "New Folder")

						local folder = Prefabs:FindFirstChild("Folder"):Clone()
						local button = folder:FindFirstChild("Button")
						local objects = folder:FindFirstChild("Objects")
						local toggle = button:FindFirstChild("Toggle")
						folder.ZIndex = folder.ZIndex + (windows * 10)
						button.ZIndex = button.ZIndex + (windows * 10)
						objects.ZIndex = objects.ZIndex + (windows * 10)
						toggle.ZIndex = toggle.ZIndex + (windows * 10)
						button:GetChildren()[1].ZIndex = button:GetChildren()[1].ZIndex + (windows * 10)

						folder.Parent = new_tab
						button.Text = "      " .. folder_name

						spawn(function()
							while true do
								if button and button:GetChildren()[1] then
									button:GetChildren()[1].ImageColor3 = options.main_color
								end
								RS.Heartbeat:Wait()
							end
						end)

						local function gFolderLen()
							local n = 25
							for i,v in next, objects:GetChildren() do
								if not (v:IsA("UIListLayout")) then
									n = n + v.AbsoluteSize.Y + 5
								end
							end
							return n
						end

						local open = false
						button.MouseButton1Click:Connect(function()
							if open then -- Close
								Resize(toggle, {Rotation = 0}, options.tween_time)
								objects.Visible = false
							else -- Open
								Resize(toggle, {Rotation = 90}, options.tween_time)
								objects.Visible = true
							end

							open = not open
						end)

						spawn(function()
							while true do
								Resize(folder, {Size = UDim2.new(1, 0, 0, (open and gFolderLen() or 20))}, options.tween_time)
								wait()
							end
						end)

						for i,v in next, tab_data do
							folder_data[i] = function(...)
								local data, object
								local ret = {v(...)}
								if typeof(ret[1]) == "table" then
									data = ret[1]
									object = ret[2]
									object.Parent = objects
									return data, object
								else
									object = ret[1]
									object.Parent = objects
									return object
								end
							end
						end

						return folder_data, folder
					end

				end

				return tab_data, new_tab
			end
		end
	end

	do
		for i, v in next, Window:GetDescendants() do
			if hasprop(v, "ZIndex") then
				v.ZIndex = v.ZIndex + (windows * 10)
			end
		end
	end

	return window_data, Window
end

local window = library:AddWindow("Blox Fruits AutoFarm by Samild.", {
    main_color = Color3.fromRGB(math.random(0, 200), math.random(0, 200), math.random(0, 200)),
	min_size = Vector2.new(500, 500),
	can_resize = true,
})

local LocalPlayer = game:GetService'Players'.LocalPlayer
local HTTP = game:GetService("HttpService")
local TPService = game:GetService("TeleportService")
local placeId = game.PlaceId
local jobId = game.JobId
local dfesp =  true
local chestesp =  true
local gamename
local desiredquest
local oldworld
local newworld
local toolname
local userInput = game:service('UserInputService')
local Mouse = game:GetService("Players").LocalPlayer:GetMouse()
local Autofarm = window:AddTab("Autofarm")
_G.nododgecool = false
_G.farm = true
_G.automelee = false
_G.autodefense = false
_G.autosword = false
_G.autogun = false
_G.autodf = false
_G.noclip = false
_G.dfespactive = false
_G.chestespactive = false
_G.flowerespactive = false

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

function WTS(part)
local screen = workspace.CurrentCamera:WorldToViewportPoint(part.Position)
return Vector2.new(screen.x, screen.y)
end

local chests = {}
local espchests = {}
local df = {}
local espdf = {}
local flowers = {}
local espflowers = {}

function ESP()

	for i,x in pairs(chests) do
		if #espchests < 1 then
			table.insert(espchests, Drawing.new("Text"))
		end
	espchests[i].Text = chests[i].Name
	espchests[i].Color = Color3.fromRGB(255, 127, 80)
	espchests[i].Position = WTS(chests[i])
	espchests[i].Size = 20.0
	espchests[i].Outline = true
	espchests[i].Center = true
	espchests[i].Visible = _G.chestespactive
	end


	for i,x in pairs(df) do
		if #espdf < 1 then
			table.insert(espdf, Drawing.new("Text"))
		end
	espdf[i].Text = df[i].Name
	espdf[i].Color = Color3.fromRGB(255, 127, 80)
	espdf[i].Position = WTS(df[i])
	espdf[i].Size = 20.0
	espdf[i].Outline = true
	espdf[i].Center = true
	espdf[i].Visible = _G.dfespactive
	end

if newworld then

	for i,x in pairs(flowers) do
		if #espflowers < 1 then
			table.insert(espflowers, Drawing.new("Text"))
		end
	espflowers[i].Text = flowers[i].Name
	espflowers[i].Color = Color3.fromRGB(255, 127, 80)
	espflowers[i].Position = WTS(flowers[i])
	espflowers[i].Size = 20.0
	espflowers[i].Outline = true
	espflowers[i].Center = true
	espflowers[i].Visible = _G.flowerespactive
	end

end
end

function click()
	game:GetService'VirtualUser':CaptureController()
	game:GetService'VirtualUser':Button1Down(Vector2.new(1280, 672))
end
function autofarm(tool, enemy, exclusion, quest, number)
	game:GetService("ReplicatedStorage").Remotes["CommF_"]:InvokeServer("AbandonQuest");
	while _G.farm == true do
		if _G.farm == false then
			break
		end
			if LocalPlayer.Character:FindFirstChild('HumanoidRootPart') and LocalPlayer:FindFirstChild('Data') then
				repeat wait() until (workspace.Enemies:GetChildren()) ~= nil
				print(tool)
				if LocalPlayer.PlayerGui.Main.Quest.Visible == false then
					game:GetService("ReplicatedStorage").Remotes["CommF_"]:InvokeServer("StartQuest", quest, tonumber(number));
				end
				for _,X in pairs (workspace.Enemies:GetChildren()) do
						if X.Name:match(enemy) then
							for i,v in pairs(workspace.Enemies:GetDescendants()) do
								if v.Name == "HumanoidRootPart" then
									v.Size = Vector3.new(50,2,50)
									v.Transparency = 1
									v.CanCollide = false
								end
   							end
							repeat 
							wait()
							noclip()
							if LocalPlayer.Backpack:FindFirstChild(tool) and LocalPlayer.Character:FindFirstChild(tool) == nil or LocalPlayer.Backpack:FindFirstChild(tool) and not LocalPlayer.Character:FindFirstChild(tool).ClassName ~= "Model" then
								LocalPlayer.Backpack[tool].Parent = LocalPlayer.Character
							end
							if LocalPlayer.PlayerGui.Main.Quest.Visible == false then
								game:GetService("ReplicatedStorage").Remotes["CommF_"]:InvokeServer("StartQuest", quest, tonumber(number));
							end
							click()
							noclip()
							game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = X.UpperTorso.CFrame + Vector3.new(0, 10, 0) - X.UpperTorso.CFrame.lookVector * 5
						until X.Humanoid.Health == 0 or _G.farm == false
						end
					end
			end
	end
end

do

	if placeId == 4442272183 then
        gamename = "/Blox-Fruits-Second-Sea"
        newworld = true
    elseif placeId == 2753915549 then
        gamename = "/UPDATE-10-Blox-Fruits"
        oldworld = true
end

	--Anti Afk
	game:GetService'Players'.LocalPlayer.Idled:Connect(function()
		game:GetService'VirtualUser':CaptureController()
		game:GetService'VirtualUser':ClickButton2(Vector2.new())
	end)

	function tpnewserver()
	    local Serverlist = game:GetService("HttpService"):JSONDecode(game:HttpGet("https://www.roblox.com/games/getgameinstancesjson?placeId=".. placeId.. "&startindex=" .. math.random(150,200)))
	    print(Serverlist)
	    local server = Serverlist.Collection[math.random(1,#Serverlist.Collection)]
	    game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, server.Guid)
	end



local tools = {}
for _, X in next, LocalPlayer.Backpack:GetChildren() do
	if X.ClassName == "Tool" then
	table.insert(tools, X.Name)
end
end
print(unpack(tools))
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

Autofarm:AddSwitch("Toggle", function(bool)
        _G.farm = bool
        print(_G.farm)
end)

local toolname
local tooldropdown = Autofarm:AddDropdown("Use Tool", function(text)
	if LocalPlayer.Backpack:FindFirstChild(tostring(text)) then
		toolname = LocalPlayer.Backpack[tostring(text)]
	end
end)

for i=1, #tools do
	local tool = tools[i]
	tooldropdown:Add(tostring(tool))
end

Autofarm:AddButton("Level Farm", function()
	bestfarm()
	LocalPlayer.Data.Level.Changed:connect(function()
		_G.farm = false
		wait(1)
		bestfarm()
	end)
end)

--[[
Autofarm:AddButton("Bandits", function()
	autofarm(tostring(toolname), "Bandit", nil, "BanditQuest1", 1)
end)

Autofarm:AddButton("Monkeys", function()
	autofarm(tostring(toolname), "Monkey", nil, "JungleQuest", 1)
end)

Autofarm:AddButton("Gorillas", function()
	autofarm(tostring(toolname), "Gorilla", "King", "JungleQuest", 2)
end)

Autofarm:AddButton("Buggy Pirate", function()
	autofarm(tostring(toolname), "Pirate", nil, "BuggyQuest1", 1)
end)

Autofarm:AddButton("Brute", function()
	autofarm(tostring(toolname), "Brute", nil, "BuggyQuest1", 2)
end)			

Autofarm:AddButton("Desert Bandit", function()
	autofarm(tostring(toolname), "Bandit", nil, "DesertQuest", 1)
end)

Autofarm:AddButton("Desert Officer", function()
	autofarm(tostring(toolname), "Officer", nil, "DesertQuest", 2)
end)

Autofarm:AddButton("Snow Bandit", function()
	autofarm(tostring(toolname), "Snow Bandit", nil, "SnowQuest", 1)
end)

Autofarm:AddButton("Snowman", function()
	autofarm(tostring(toolname), "Snowman", nil, "SnowQuest", 2)
end)

Autofarm:AddButton("Sky Bandit", function()
	autofarm(tostring(toolname), "Sky Bandit", nil, "SkyQuest", 1)
end)

Autofarm:AddButton("Dark Master", function()
	autofarm(tostring(toolname), "Master", nil, "SkyQuest", 2)
end)

Autofarm:AddButton("Toga Warrior", function()
	autofarm(tostring(toolname), "Warrior", nil, "ColosseumQuest", 1)
end)

Autofarm:AddButton("Gladiator", function()
	autofarm(tostring(toolname), "Gladiator", nil, "ColosseumQuest", 2)
end)

Autofarm:AddButton("Warden", function()
	autofarm(tostring(toolname), "Warden", nil, "ImpelQuest", 1)
end)

Autofarm:AddButton("Chief Warden", function()
	autofarm(tostring(toolname), "Chief Warden", nil, "ImpelQuest", 2)
end)

Autofarm:AddButton("Swan", function()
	autofarm(tostring(toolname), "Swan", nil, "ImpelQuest", 3)
end)

Autofarm:AddButton("Military Soldier", function()
	autofarm(tostring(toolname), "Soldier", nil, "MagmaQuest", 1)
end)

Autofarm:AddButton("Military Spy", function()
	autofarm(tostring(toolname), "Spy", nil, "MagmaQuest", 2)
end)

Autofarm:AddButton("Magma Admiral", function()
	autofarm(tostring(toolname), "Admiral", nil, "MagmaQuest", 3)
end)

Autofarm:AddButton("Fishman Warrior", function()
	autofarm(tostring(toolname), "Fishman Warrior", nil, "FishmanQuest", 1)
end)

Autofarm:AddButton("Fishman Commando", function()
autofarm(tostring(toolname), "Commando", nil, "FishmanQuest", 2)
end)

Autofarm:AddButton("Fishman Jones", function()
autofarm(tostring(toolname), "Jones", nil, "FishmanQuest", 3)
end)

Autofarm:AddButton("God's Guard", function()
autofarm(tostring(toolname), "God's Guard", nil, "SkyExp1Quest", 1)
end)

Autofarm:AddButton("Shanda", function()
autofarm(tostring(toolname), "Shanda", nil, "SkyExp1Quest", 2)
end)

Autofarm:AddButton("Wysper", function()
autofarm(tostring(toolname), "Wysper", nil, "SkyExp1Quest", 3)
end)

Autofarm:AddButton("Royal Squad", function()
autofarm(tostring(toolname), "Royal Squad", nil, "SkyExp2Quest", 1)
end)

Autofarm:AddButton("Royal Soldier", function()
autofarm(tostring(toolname), "Royal Soldier", nil, "SkyExp2Quest", 2)
end)

Autofarm:AddButton("Thunder God", function()
autofarm(tostring(toolname), "Thunder God", nil, "SkyExp2Quest", 3)
end)

Autofarm:AddButton("Galley Pirate", function()
autofarm(tostring(toolname), "Galley Pirate", nil, "FountainQuest", 1)
end)

Autofarm:AddButton("Galley Captain", function()
autofarm(tostring(toolname), "Galley Captain", nil, "FountainQuest", 2)
end)

Autofarm:AddButton("Cyborg", function()
autofarm(tostring(toolname), "Cyborg", nil, "FountainQuest", 3)
end)

Autofarm:AddButton("Ice Admiral", function()
autofarm(tostring(toolname), "Ice Admiral", nil, nil, nil)
end)
]]

end
if newworld then
	local floweresp = true
Autofarm:AddSwitch("Toggle", function(bool)
        _G.farm = bool
        print(_G.farm)
end)
local toolname
local tooldropdown = Autofarm:AddDropdown("Use Tool", function(text)
	if LocalPlayer.Backpack:FindFirstChild(tostring(text)) then
		toolname = LocalPlayer.Backpack[tostring(text)]
	end
end)

for i=1, #tools do
	local tool = tools[i]
	tooldropdown:Add(tostring(tool))
end

LocalPlayer.Backpack.ChildAdded:connect(function(child)
	tooldropdown:Add(tostring(child.Name))
end)

Autofarm:AddButton("Raider", function()
	teleport(CFrame.new(-121.149246, 39.0797539, 2369.0332, 0.968202889, 2.4016245e-08, 0.250166208, -1.94774046e-08, 1, -2.06189554e-08, -0.250166208, 1.50907447e-08, 0.968202889))
	wait(1)
autofarm(tostring(toolname), "Raider", nil, "Area1Quest", 1)
end)

Autofarm:AddButton("Mercenary", function()
	teleport(CFrame.new(-803.078003, 73.1196899, 1690.83899, 0.00951899588, 3.24957554e-08, 0.9999547, -2.01763513e-08, 1, -3.23051594e-08, -0.9999547, -1.98679242e-08, 0.00951899588))
	wait(1)
autofarm(tostring(toolname), "Mercenary", nil, "Area1Quest", 2)
end)

Autofarm:AddButton("Diamond", function()
	teleport(CFrame.new(-1711.10999, 198.646606, 36.8653908, 0.872542739, -6.97004552e-08, 0.488537759, 9.2724818e-08, 1, -2.29376589e-08, -0.488537759, 6.53136638e-08, 0.872542739))
	wait(1)
autofarm(tostring(toolname), "Diamond", nil, "Area1Quest", 3)
end)

Autofarm:AddButton("Swan Pirate", function()
	teleport(CFrame.new(893.166565, 73.0697327, 1147.42651, -0.999840379, -5.55143664e-08, -0.0178658348, -5.55763684e-08, 1, 2.97384384e-09, 0.0178658348, 3.9662873e-09, -0.999840379))
	wait(1)
autofarm(tostring(toolname), "Swan Pirate", nil, "Area2Quest", 1)
end)

Autofarm:AddButton("Factory Staff", function()
	teleport(CFrame.new(167.018753, 73.0686951, -164.64502, 0.725492358, -4.73446917e-08, -0.688230276, 1.24810228e-07, 1, 6.27757473e-08, 0.688230276, -1.31441496e-07, 0.725492358))
	wait(1)
autofarm(tostring(toolname), "Factory Staff", nil, "Area2Quest", 2)
end)

Autofarm:AddButton("Jeremy", function()
autofarm(tostring(toolname), "Jeremy", nil, "Area2Quest", 3)
end)

Autofarm:AddButton("Marine Lieutenant", function()
	teleport(CFrame.new(-2786.62183, 72.9661102, -3031.87476, -0.240379378, -9.12769167e-08, 0.970679045, 4.44070238e-08, 1, 1.05031063e-07, -0.970679045, 6.83522643e-08, -0.240379378))
	wait(1)
autofarm(tostring(toolname), "Marine Lieutenant", nil, "MarineQuest3", 1)
end)

Autofarm:AddButton("Marine Captain", function()
	teleport(CFrame.new(-2023.63354, 72.9661102, -3255.90576, 0.848725617, 9.29678279e-10, -0.528833508, -4.68628123e-08, 1, -7.34522132e-08, 0.528833508, 8.71233965e-08, 0.848725617))
	wait(1)
autofarm(tostring(toolname), "Marine Captain", nil, "MarineQuest3", 2)
end)

Autofarm:AddButton("Fajita", function()
	teleport(CFrame.new(-2153.6731, 72.9661102, -4241.20508, 0.999911308, 8.00685651e-09, -0.0133165959, -7.94380561e-09, 1, 4.78771467e-09, 0.0133165959, -4.68150585e-09, 0.999911308))
	wait(1)
autofarm(tostring(toolname), "Fajita", nil, "MarineQuest3", 3)
end)

Autofarm:AddButton("Zombie", function()
	teleport(CFrame.new(-5672.71143, 48.4801941, -655.884766, 0.428546607, -4.94537318e-08, 0.90351969, 1.18672972e-07, 1, -1.55300306e-09, -0.90351969, 1.07888901e-07, 0.428546607))
	wait(1)
autofarm(tostring(toolname), "Zombie", nil, "ZombieQuest", 1)
end)

Autofarm:AddButton("Vampire", function()
	teleport(CFrame.new(-5981.06445, 6.40269995, -1316.19409, 0.456913412, -9.74204681e-08, 0.889511168, 5.04610185e-08, 1, 8.36011438e-08, -0.889511168, 6.68715616e-09, 0.456913412))
	wait(1)
autofarm(tostring(toolname), "Vampire", nil, "ZombieQuest", 2)
end)

Autofarm:AddButton("Snow Trooper", function()
	teleport(CFrame.new(593.259888, 401.421936, -5546.1001, 0.986214757, 9.62643938e-08, -0.165470347, -1.06199984e-07, 1, -5.11970981e-08, 0.165470347, 6.80642813e-08, 0.986214757))
	wait(1)
autofarm(tostring(toolname), "Snow Trooper", nil, "SnowMountainQuest", 1)
end)

Autofarm:AddButton("Winter Warrior", function()
	teleport(CFrame.new(1331.75439, 429.421875, -5318.35547, 0.825170577, 5.72686742e-09, 0.56488359, -1.10307963e-09, 1, -8.52678017e-09, -0.56488359, 6.41293685e-09, 0.825170577))
	wait(1)
autofarm(tostring(toolname), "Winter Warrior", nil, "SnowMountainQuest", 2)
end)

Autofarm:AddButton("Lab Subordinate", function()
	teleport(CFrame.new(-5814.375, 15.9517574, -4429.76172, 0.364512295, -5.59861562e-08, 0.931198597, 2.32149766e-08, 1, 5.10353146e-08, -0.931198597, 3.01475378e-09, 0.364512295))
	wait(1)
autofarm(tostring(toolname), "Lab Subordinate", nil, "IceSideQuest", 1)
end)

Autofarm:AddButton("Horned Warrior", function()
	teleport(CFrame.new(-6361.49268, 26.559988, -5887.49414, -0.934038699, -1.2254131e-08, -0.357171863, 7.46332418e-09, 1, -5.38260885e-08, 0.357171863, -5.29413384e-08, -0.934038699))
	wait(1)
autofarm(tostring(toolname), "Horned Warrior", nil, "IceSideQuest", 2)
end)

Autofarm:AddButton("Smoke Admiral", function()
	teleport(CFrame.new(-5101.09131, 23.7314548, -5341.89941, 0.330702484, 9.46945411e-10, -0.943735063, 6.24650165e-10, 1, 1.22229094e-09, 0.943735063, -9.93718885e-10, 0.330702484))
	wait(1)
autofarm(tostring(toolname), "Smoke Admiral", nil, "IceSideQuest", 3)
end)

Autofarm:AddButton("Magma Ninja", function()
	teleport(CFrame.new(-5186.00635, 15.9518795, -6115.89355, -0.164513826, -4.62587586e-08, 0.986374795, 4.05046237e-08, 1, 5.36533662e-08, -0.986374795, 4.87794587e-08, -0.164513826))
	wait(1)
autofarm(tostring(toolname), "Magma Ninja", nil, "FireSideQuest", 1)
end)

Autofarm:AddButton("Lava Pirate", function()
	teleport(CFrame.new(-5133.50098, 16.1205902, -4837.5752, -0.196734294, 1.91304856e-08, -0.980456829, -1.89785787e-08, 1, 2.33199682e-08, 0.980456829, 2.31955148e-08, -0.196734294))
	wait(1)
autofarm(tostring(toolname), "Lava Pirate", nil, "FireSideQuest", 2)
end)

Autofarm:AddButton("Swan Pirate (Barlito)", function()
	teleport(CFrame.new(893.166565, 73.0697327, 1147.42651, -0.999840379, -5.55143664e-08, -0.0178658348, -5.55763684e-08, 1, 2.97384384e-09, 0.0178658348, 3.9662873e-09, -0.999840379))
	wait(1)
autofarm(tostring(toolname), "Swan Pirate", nil, "BartiloQuest", 1)
end)

ESP:AddButton("Flower ESP", function()
	for _,v in pairs (workspace:GetChildren()) do
		if v.Name:match('Flower') then
		    local BillboardGui = Instance.new("BillboardGui")
	        local TextLabel = Instance.new("TextLabel")
	        BillboardGui.Parent = v
	        BillboardGui.AlwaysOnTop = true
	        BillboardGui.LightInfluence = 1
	        BillboardGui.Size = UDim2.new(0, 25, 0, 25)
	        BillboardGui.StudsOffset = Vector3.new(0, 2, 0)
	        TextLabel.Parent = BillboardGui
	        TextLabel.BackgroundColor3 = Color3.new(1, 1, 1)
	        TextLabel.BackgroundTransparency = 1
	        TextLabel.Size = UDim2.new(2, 0, 2, 0)
	        TextLabel.Text = v.Name
	        TextLabel.TextScaled = true
			TextLabel.Font = "SourceSans"
			TextLabel.TextColor3 = Color3.fromRGB(255, 171, 254)
		end
    end

	workspace.ChildAdded:connect(function(x)
		if x.Name:match("Flower") then
			local BillboardGui = Instance.new("BillboardGui")
	        local TextLabel = Instance.new("TextLabel")
	        BillboardGui.Parent = x
	        BillboardGui.AlwaysOnTop = true
	        BillboardGui.LightInfluence = 1
	        BillboardGui.Size = UDim2.new(0, 25, 0, 25)
	        BillboardGui.StudsOffset = Vector3.new(0, 2, 0)
	        TextLabel.Parent = BillboardGui
	        TextLabel.BackgroundColor3 = Color3.new(1, 1, 1)
	        TextLabel.BackgroundTransparency = 1
	        TextLabel.Size = UDim2.new(2, 0, 2, 0)
	        TextLabel.Text = x.Name
	        TextLabel.TextColor3 = Color3.fromRGB(255, 171, 254)
	        TextLabel.TextScaled = true
			TextLabel.Font = "SourceSans"
	    end
	end)
end)
end
end

