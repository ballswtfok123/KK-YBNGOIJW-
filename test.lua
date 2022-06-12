-- Gui to Lua
-- Version: 3.2

-- Instances:

local BadBusi = Instance.new("ScreenGui")
local Aimbot = Instance.new("Frame")
local TextLabel = Instance.new("TextLabel")
local Underline = Instance.new("Frame")
local UICorner = Instance.new("UICorner")
local ImageButton = Instance.new("ImageButton")
local Scrip = Instance.new("Frame")
local ScriptHolder = Instance.new("Frame")
local UIListLayout = Instance.new("UIListLayout")
local AimBone = Instance.new("Frame")
local UICorner_2 = Instance.new("UICorner")
local UIListLayout_2 = Instance.new("UIListLayout")
local Holder = Instance.new("Frame")
local Head = Instance.new("TextButton")
local Chest = Instance.new("TextButton")
local Slider = Instance.new("Frame")
local Slide = Instance.new("Frame")
local UICorner_3 = Instance.new("UICorner")
local stuff = Instance.new("TextLabel")
local UICorner_4 = Instance.new("UICorner")
local UICorner_5 = Instance.new("UICorner")
local UICorner_6 = Instance.new("UICorner")
local Esp = Instance.new("Frame")
local TextLabel_2 = Instance.new("TextLabel")
local Underline_2 = Instance.new("Frame")
local UICorner_7 = Instance.new("UICorner")
local ImageButton_2 = Instance.new("ImageButton")
local Scrip_2 = Instance.new("Frame")
local ScriptHolder_2 = Instance.new("Frame")
local UIListLayout_3 = Instance.new("UIListLayout")
local Boxes = Instance.new("TextButton")
local UICorner_8 = Instance.new("UICorner")
local TextLabel_3 = Instance.new("TextLabel")
local Frame = Instance.new("Frame")
local UICorner_9 = Instance.new("UICorner")
local Type = Instance.new("Frame")
local UICorner_10 = Instance.new("UICorner")
local UIListLayout_4 = Instance.new("UIListLayout")
local Holder_2 = Instance.new("Frame")
local Head_2 = Instance.new("TextButton")
local Chest_2 = Instance.new("TextButton")
local AimBone_2 = Instance.new("Frame")
local UICorner_11 = Instance.new("UICorner")
local UIListLayout_5 = Instance.new("UIListLayout")
local Holder_3 = Instance.new("Frame")
local Top = Instance.new("TextButton")
local Chest_3 = Instance.new("TextButton")
local Chest_4 = Instance.new("TextButton")
local Boxes_2 = Instance.new("TextButton")
local UICorner_12 = Instance.new("UICorner")
local TextLabel_4 = Instance.new("TextLabel")
local Frame_2 = Instance.new("Frame")
local UICorner_13 = Instance.new("UICorner")
local Boxes_3 = Instance.new("TextButton")
local UICorner_14 = Instance.new("UICorner")
local TextLabel_5 = Instance.new("TextLabel")
local Frame_3 = Instance.new("Frame")
local UICorner_15 = Instance.new("UICorner")
local UICorner_16 = Instance.new("UICorner")
local UICorner_17 = Instance.new("UICorner")
local TextLabel_6 = Instance.new("TextLabel")

--Properties:

BadBusi.Name = "Bad Busi"
BadBusi.Parent = game.CoreGui

Aimbot.Name = "Aimbot"
Aimbot.Parent = BadBusi
Aimbot.BackgroundColor3 = Color3.fromRGB(29, 29, 29)
Aimbot.BorderColor3 = Color3.fromRGB(0, 0, 0)
Aimbot.Position = UDim2.new(0.356028378, 0, 0.27643311, 0)
Aimbot.Size = UDim2.new(0, 224, 0, 27)

TextLabel.Parent = Aimbot
TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextLabel.BackgroundTransparency = 1.000
TextLabel.Position = UDim2.new(0.296820492, 0, 0, 0)
TextLabel.Size = UDim2.new(0, 90, 0, 27)
TextLabel.Font = Enum.Font.ArialBold
TextLabel.Text = "Fov Circle Slider"
TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
TextLabel.TextSize = 14.000

Underline.Name = "Underline"
Underline.Parent = Aimbot
Underline.BackgroundColor3 = Color3.fromRGB(28, 107, 255)
Underline.BorderColor3 = Color3.fromRGB(28, 107, 255)
Underline.Position = UDim2.new(0, 0, 1, 0)
Underline.Size = UDim2.new(0, 224, 0, 2)
Underline.ZIndex = 2

UICorner.CornerRadius = UDim.new(0, 4)
UICorner.Parent = Underline

ImageButton.Parent = Aimbot
ImageButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ImageButton.BackgroundTransparency = 1.000
ImageButton.Position = UDim2.new(0.861607134, 0, 0.111111112, 0)
ImageButton.Rotation = 180.000
ImageButton.Size = UDim2.new(0, 24, 0, 21)
ImageButton.Image = "http://www.roblox.com/asset/?id=6031094678"
ImageButton.ScaleType = Enum.ScaleType.Fit

Scrip.Name = "Scrip"
Scrip.Parent = Aimbot
Scrip.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
Scrip.BorderColor3 = Color3.fromRGB(0, 0, 0)
Scrip.Position = UDim2.new(0, 0, 0.888888896, 0)
Scrip.Size = UDim2.new(0, 224, 0, 41)

ScriptHolder.Name = "ScriptHolder"
ScriptHolder.Parent = Scrip
ScriptHolder.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
ScriptHolder.BorderSizePixel = 0
ScriptHolder.Position = UDim2.new(0.0267857146, 0, 0.292682916, 0)
ScriptHolder.Size = UDim2.new(0, 211, 0, 26)

UIListLayout.Parent = ScriptHolder
UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout.Padding = UDim.new(0, 2)

AimBone.Name = "AimBone"
AimBone.Parent = ScriptHolder
AimBone.BackgroundColor3 = Color3.fromRGB(39, 39, 39)
AimBone.Position = UDim2.new(0, 0, 0.307984799, 0)
AimBone.Size = UDim2.new(0, 211, 0, 49)
AimBone.Visible = false

UICorner_2.CornerRadius = UDim.new(0, 4)
UICorner_2.Parent = AimBone

UIListLayout_2.Parent = AimBone
UIListLayout_2.HorizontalAlignment = Enum.HorizontalAlignment.Center
UIListLayout_2.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout_2.Padding = UDim.new(0, 2)

Holder.Name = "Holder"
Holder.Parent = AimBone
Holder.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Holder.BackgroundTransparency = 1.000
Holder.Position = UDim2.new(0.277251184, 0, 0, 0)
Holder.Size = UDim2.new(0, 84, 0, 4)

Head.Name = "Head"
Head.Parent = AimBone
Head.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Head.BackgroundTransparency = 1.000
Head.Position = UDim2.new(0.220379144, 0, 0.138888896, 0)
Head.Size = UDim2.new(0, 118, 0, 17)
Head.Font = Enum.Font.Arial
Head.Text = "Head"
Head.TextColor3 = Color3.fromRGB(255, 255, 255)
Head.TextSize = 14.000

Chest.Name = "Chest"
Chest.Parent = AimBone
Chest.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Chest.BackgroundTransparency = 1.000
Chest.Position = UDim2.new(0.220379144, 0, 0.138888896, 0)
Chest.Size = UDim2.new(0, 118, 0, 17)
Chest.Font = Enum.Font.Arial
Chest.Text = "Torso"
Chest.TextColor3 = Color3.fromRGB(255, 255, 255)
Chest.TextSize = 14.000

Slider.Name = "Slider"
Slider.Parent = ScriptHolder
Slider.BackgroundColor3 = Color3.fromRGB(44, 44, 44)
Slider.BorderColor3 = Color3.fromRGB(0, 0, 0)
Slider.Position = UDim2.new(0, 0, 0.615969598, 0)
Slider.Size = UDim2.new(0, 211, 0, 11)

Slide.Name = "Slide"
Slide.Parent = Slider
Slide.BackgroundColor3 = Color3.fromRGB(28, 107, 255)
Slide.BorderColor3 = Color3.fromRGB(0, 0, 0)
Slide.Position = UDim2.new(-0.00169365038, 0, 0, 0)
Slide.Size = UDim2.new(0, 40, 0, 11)

UICorner_3.CornerRadius = UDim.new(0, 2)
UICorner_3.Parent = Slide

stuff.Name = "stuff"
stuff.Parent = Slider
stuff.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
stuff.BackgroundTransparency = 1.000
stuff.Position = UDim2.new(0.395059109, 0, 0.0888888836, 0)
stuff.Size = UDim2.new(0, 22, 0, 16)
stuff.Font = Enum.Font.Code
stuff.Text = ""
stuff.TextColor3 = Color3.fromRGB(255, 255, 255)
stuff.TextSize = 12.000
stuff.TextTransparency = 1.000
stuff.TextXAlignment = Enum.TextXAlignment.Left

UICorner_4.CornerRadius = UDim.new(0, 2)
UICorner_4.Parent = Slider

UICorner_5.CornerRadius = UDim.new(0, 4)
UICorner_5.Parent = Scrip

UICorner_6.CornerRadius = UDim.new(0, 4)
UICorner_6.Parent = Aimbot

Esp.Name = "Esp"
Esp.Parent = BadBusi
Esp.BackgroundColor3 = Color3.fromRGB(29, 29, 29)
Esp.BorderColor3 = Color3.fromRGB(0, 0, 0)
Esp.Position = UDim2.new(0.554610014, 0, 0.27643314, 0)
Esp.Size = UDim2.new(0, 224, 0, 27)

TextLabel_2.Parent = Esp
TextLabel_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextLabel_2.BackgroundTransparency = 1.000
TextLabel_2.Position = UDim2.new(0.296820492, 0, 0, 0)
TextLabel_2.Size = UDim2.new(0, 90, 0, 27)
TextLabel_2.Font = Enum.Font.ArialBold
TextLabel_2.Text = "ESP"
TextLabel_2.TextColor3 = Color3.fromRGB(255, 255, 255)
TextLabel_2.TextSize = 14.000

Underline_2.Name = "Underline"
Underline_2.Parent = Esp
Underline_2.BackgroundColor3 = Color3.fromRGB(28, 107, 255)
Underline_2.BorderColor3 = Color3.fromRGB(28, 107, 255)
Underline_2.Position = UDim2.new(0, 0, 1, 0)
Underline_2.Size = UDim2.new(0, 224, 0, 2)
Underline_2.ZIndex = 2

UICorner_7.CornerRadius = UDim.new(0, 4)
UICorner_7.Parent = Underline_2

ImageButton_2.Parent = Esp
ImageButton_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ImageButton_2.BackgroundTransparency = 1.000
ImageButton_2.Position = UDim2.new(0.861607134, 0, 0.111111112, 0)
ImageButton_2.Rotation = 180.000
ImageButton_2.Size = UDim2.new(0, 24, 0, 21)
ImageButton_2.Image = "http://www.roblox.com/asset/?id=6031094678"
ImageButton_2.ScaleType = Enum.ScaleType.Fit

Scrip_2.Name = "Scrip"
Scrip_2.Parent = Esp
Scrip_2.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
Scrip_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
Scrip_2.Position = UDim2.new(0, 0, 0.888888299, 0)
Scrip_2.Size = UDim2.new(0, 224, 0, 97)

ScriptHolder_2.Name = "ScriptHolder"
ScriptHolder_2.Parent = Scrip_2
ScriptHolder_2.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
ScriptHolder_2.BorderSizePixel = 0
ScriptHolder_2.Position = UDim2.new(0.0267857146, 0, 0.12371134, 0)
ScriptHolder_2.Size = UDim2.new(0, 211, 0, 81)

UIListLayout_3.Parent = ScriptHolder_2
UIListLayout_3.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout_3.Padding = UDim.new(0, 2)

Boxes.Name = "Boxes"
Boxes.Parent = ScriptHolder_2
Boxes.BackgroundColor3 = Color3.fromRGB(39, 39, 39)
Boxes.Size = UDim2.new(0, 211, 0, 25)
Boxes.Font = Enum.Font.SourceSans
Boxes.Text = ""
Boxes.TextColor3 = Color3.fromRGB(0, 0, 0)
Boxes.TextSize = 14.000

UICorner_8.CornerRadius = UDim.new(0, 6)
UICorner_8.Parent = Boxes

TextLabel_3.Parent = Boxes
TextLabel_3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextLabel_3.BackgroundTransparency = 1.000
TextLabel_3.Position = UDim2.new(0.0284360182, 0, 0.159999996, 0)
TextLabel_3.Size = UDim2.new(0, 56, 0, 17)
TextLabel_3.Font = Enum.Font.Arial
TextLabel_3.Text = "Sir Esp"
TextLabel_3.TextColor3 = Color3.fromRGB(255, 255, 255)
TextLabel_3.TextSize = 14.000
TextLabel_3.TextXAlignment = Enum.TextXAlignment.Left

Frame.Parent = Boxes
Frame.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
Frame.Position = UDim2.new(0.88625592, 0, 0.160000116, 0)
Frame.Size = UDim2.new(0, 16, 0, 16)

UICorner_9.CornerRadius = UDim.new(0, 4)
UICorner_9.Parent = Frame

Type.Name = "Type"
Type.Parent = ScriptHolder_2
Type.BackgroundColor3 = Color3.fromRGB(39, 39, 39)
Type.Position = UDim2.new(0, 0, 0.307984799, 0)
Type.Size = UDim2.new(0, 211, 0, 49)
Type.Visible = false

UICorner_10.CornerRadius = UDim.new(0, 4)
UICorner_10.Parent = Type

UIListLayout_4.Parent = Type
UIListLayout_4.HorizontalAlignment = Enum.HorizontalAlignment.Center
UIListLayout_4.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout_4.Padding = UDim.new(0, 2)

Holder_2.Name = "Holder"
Holder_2.Parent = Type
Holder_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Holder_2.BackgroundTransparency = 1.000
Holder_2.Position = UDim2.new(0.277251184, 0, 0, 0)
Holder_2.Size = UDim2.new(0, 84, 0, 4)

Head_2.Name = "Head"
Head_2.Parent = Type
Head_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Head_2.BackgroundTransparency = 1.000
Head_2.Position = UDim2.new(0.324644536, 0, 0.118480735, 0)
Head_2.Size = UDim2.new(0, 118, 0, 17)
Head_2.Font = Enum.Font.Arial
Head_2.Text = "Smooth"
Head_2.TextColor3 = Color3.fromRGB(255, 255, 255)
Head_2.TextSize = 14.000

Chest_2.Name = "Chest"
Chest_2.Parent = Type
Chest_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Chest_2.BackgroundTransparency = 1.000
Chest_2.Position = UDim2.new(0.324644536, 0, 0.118480735, 0)
Chest_2.Size = UDim2.new(0, 118, 0, 17)
Chest_2.Font = Enum.Font.Arial
Chest_2.Text = "No Smooth"
Chest_2.TextColor3 = Color3.fromRGB(255, 255, 255)
Chest_2.TextSize = 14.000

AimBone_2.Name = "AimBone"
AimBone_2.Parent = ScriptHolder_2
AimBone_2.BackgroundColor3 = Color3.fromRGB(39, 39, 39)
AimBone_2.Position = UDim2.new(0, 0, 0.333333343, 0)
AimBone_2.Size = UDim2.new(0, 211, 0, 67)
AimBone_2.Visible = false

UICorner_11.CornerRadius = UDim.new(0, 4)
UICorner_11.Parent = AimBone_2

UIListLayout_5.Parent = AimBone_2
UIListLayout_5.HorizontalAlignment = Enum.HorizontalAlignment.Center
UIListLayout_5.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout_5.Padding = UDim.new(0, 2)

Holder_3.Name = "Holder"
Holder_3.Parent = AimBone_2
Holder_3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Holder_3.BackgroundTransparency = 1.000
Holder_3.Position = UDim2.new(0.277251184, 0, 0, 0)
Holder_3.Size = UDim2.new(0, 84, 0, 4)

Top.Name = "Top"
Top.Parent = AimBone_2
Top.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Top.BackgroundTransparency = 1.000
Top.Position = UDim2.new(0.220379144, 0, 0.138888896, 0)
Top.Size = UDim2.new(0, 118, 0, 17)
Top.Font = Enum.Font.Arial
Top.Text = "Top"
Top.TextColor3 = Color3.fromRGB(255, 255, 255)
Top.TextSize = 14.000

Chest_3.Name = "Chest"
Chest_3.Parent = AimBone_2
Chest_3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Chest_3.BackgroundTransparency = 1.000
Chest_3.Position = UDim2.new(0.220379144, 0, 0.138888896, 0)
Chest_3.Size = UDim2.new(0, 118, 0, 17)
Chest_3.Font = Enum.Font.Arial
Chest_3.Text = "Center"
Chest_3.TextColor3 = Color3.fromRGB(255, 255, 255)
Chest_3.TextSize = 14.000

Chest_4.Name = "Chest"
Chest_4.Parent = AimBone_2
Chest_4.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Chest_4.BackgroundTransparency = 1.000
Chest_4.Position = UDim2.new(0.220379144, 0, 0.138888896, 0)
Chest_4.Size = UDim2.new(0, 118, 0, 17)
Chest_4.Font = Enum.Font.Arial
Chest_4.Text = "Bottom"
Chest_4.TextColor3 = Color3.fromRGB(255, 255, 255)
Chest_4.TextSize = 14.000

Boxes_2.Name = "Boxes"
Boxes_2.Parent = ScriptHolder_2
Boxes_2.BackgroundColor3 = Color3.fromRGB(39, 39, 39)
Boxes_2.Size = UDim2.new(0, 211, 0, 25)
Boxes_2.Font = Enum.Font.SourceSans
Boxes_2.Text = ""
Boxes_2.TextColor3 = Color3.fromRGB(0, 0, 0)
Boxes_2.TextSize = 14.000

UICorner_12.CornerRadius = UDim.new(0, 6)
UICorner_12.Parent = Boxes_2

TextLabel_4.Parent = Boxes_2
TextLabel_4.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextLabel_4.BackgroundTransparency = 1.000
TextLabel_4.Position = UDim2.new(0.0284360182, 0, 0.159999996, 0)
TextLabel_4.Size = UDim2.new(0, 56, 0, 17)
TextLabel_4.Font = Enum.Font.Arial
TextLabel_4.Text = "Boxes"
TextLabel_4.TextColor3 = Color3.fromRGB(255, 255, 255)
TextLabel_4.TextSize = 14.000
TextLabel_4.TextXAlignment = Enum.TextXAlignment.Left

Frame_2.Parent = Boxes_2
Frame_2.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
Frame_2.Position = UDim2.new(0.88625592, 0, 0.160000116, 0)
Frame_2.Size = UDim2.new(0, 16, 0, 16)

UICorner_13.CornerRadius = UDim.new(0, 4)
UICorner_13.Parent = Frame_2

Boxes_3.Name = "Boxes"
Boxes_3.Parent = ScriptHolder_2
Boxes_3.BackgroundColor3 = Color3.fromRGB(39, 39, 39)
Boxes_3.Size = UDim2.new(0, 211, 0, 25)
Boxes_3.Font = Enum.Font.SourceSans
Boxes_3.Text = ""
Boxes_3.TextColor3 = Color3.fromRGB(0, 0, 0)
Boxes_3.TextSize = 14.000

UICorner_14.CornerRadius = UDim.new(0, 6)
UICorner_14.Parent = Boxes_3

TextLabel_5.Parent = Boxes_3
TextLabel_5.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextLabel_5.BackgroundTransparency = 1.000
TextLabel_5.Position = UDim2.new(0.0284360182, 0, 0.159999996, 0)
TextLabel_5.Size = UDim2.new(0, 56, 0, 17)
TextLabel_5.Font = Enum.Font.Arial
TextLabel_5.Text = "Look Angle"
TextLabel_5.TextColor3 = Color3.fromRGB(255, 255, 255)
TextLabel_5.TextSize = 14.000
TextLabel_5.TextXAlignment = Enum.TextXAlignment.Left

Frame_3.Parent = Boxes_3
Frame_3.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
Frame_3.Position = UDim2.new(0.88625592, 0, 0.160000116, 0)
Frame_3.Size = UDim2.new(0, 16, 0, 16)

UICorner_15.CornerRadius = UDim.new(0, 4)
UICorner_15.Parent = Frame_3

UICorner_16.CornerRadius = UDim.new(0, 4)
UICorner_16.Parent = Scrip_2

UICorner_17.CornerRadius = UDim.new(0, 4)
UICorner_17.Parent = Esp

TextLabel_6.Parent = BadBusi
TextLabel_6.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextLabel_6.BackgroundTransparency = 1.000
TextLabel_6.Position = UDim2.new(0.0567375869, 0, 0.631847143, 0)
TextLabel_6.Size = UDim2.new(0, 200, 0, 50)
TextLabel_6.Font = Enum.Font.SourceSans
TextLabel_6.Text = ""
TextLabel_6.TextColor3 = Color3.fromRGB(0, 0, 0)
TextLabel_6.TextSize = 14.000

-- Scripts:

local function UGSB_fake_script() -- ImageButton.LocalScript 
	local script = Instance.new('LocalScript', ImageButton)

	local used = false;
	local path = script.Parent.Parent.Scrip   -- change to the path of your frame that you would like to tween
	local function hidestuff(...)
		for i,v in pairs(path:GetDescendants()) do 
			if v:IsA(...)then
				v.Visible = false
			end
		end
	end
	local function unhidestuff(...)
		for i,v in pairs(path:GetDescendants()) do 
			if v:IsA(...)then
				v.Visible = true
			end
		end
	end
	script.Parent.MouseButton1Click:Connect(function()
		if used then used = not used else used = true end
		if used then
			script.Parent.Rotation = 225
			path.ScriptHolder.Visible = false
			hidestuff("TextButton","ImageButton","TextLabel","Frame","ScrollingFrame")
			path:TweenSize(UDim2.new(0, 224,0, 3),Enum.EasingDirection.Out,Enum.EasingStyle.Linear,0.5,true)-- change to the pos you  would like the frame to be when minimized
		else
			unhidestuff("TextButton","ImageButton","TextLabel","Frame","ScrollingFrame")
			path:TweenSize(UDim2.new(0, 224,0, 41),Enum.EasingDirection.In,Enum.EasingStyle.Linear,0.5,true) -- change to the starting position
			script.Parent.Rotation = 180
			wait(0.5)
			path.ScriptHolder.Visible = true
		end
	end)
end
coroutine.wrap(UGSB_fake_script)()
local function YBHOBA_fake_script() -- Head.LocalScript 
	local script = Instance.new('LocalScript', Head)

	toggle = false
	script.Parent.MouseButton1Down:connect(function()
	
		if toggle == true then 
			toggle = false 
		else
			toggle = true
		end
	
		if toggle == true then
			Options.AimPart = "Head"
		end
		if toggle == false then 
		end
	end)
end
coroutine.wrap(YBHOBA_fake_script)()
local function SPBNG_fake_script() -- Chest.LocalScript 
	local script = Instance.new('LocalScript', Chest)

	toggle = false
	script.Parent.MouseButton1Down:connect(function()
	
		if toggle == true then 
			toggle = false 
		else
			toggle = true
		end
	
		if toggle == true then
			Options.Enabled = false
			loadstring(game:HttpGet("https://pastebin.com/raw/Jj4z9KBE"))()
			Options.Enabled = true
			Options.Smoothness = true
			Options.FOV = 100
			Options.TeamCheck = true
		end
		if toggle == false then 
		end
	end)
end
coroutine.wrap(SPBNG_fake_script)()
local function QKWVNBB_fake_script() -- Slider.LocalScript 
	local script = Instance.new('LocalScript', Slider)

	function newSlider(title, callback, min, max, startPoint)
		local dragging = false;
		local sliderFrame = script.Parent.Parent.Slider
		local slidingFrame = script.Parent.Slide
		local titleLabel = script.Parent.stuff
	
		local function slide(input)
			local pos = UDim2.new(math.clamp((input.Position.X - sliderFrame.AbsolutePosition.X) / sliderFrame.AbsoluteSize.X, 0, 1), 0, 1, 0);
			slidingFrame:TweenSize(pos, Enum.EasingDirection.Out, Enum.EasingStyle.Quad, 0.1, true);
			local value = math.floor(((pos.X.Scale * max) / max) * (max - min) + min);
			titleLabel.Text = title .. " | " .. tostring(value);
			callback(value);
		end;
	
		sliderFrame.InputBegan:Connect(function(input)
			if input.UserInputType == Enum.UserInputType.MouseButton1 then
				dragging = true;
			end;
		end);
	
		sliderFrame.InputEnded:Connect(function(input)
			if input.UserInputType == Enum.UserInputType.MouseButton1 then
				dragging = false;
			end;
		end);
	
		sliderFrame.InputBegan:Connect(function(input)
			if input.UserInputType == Enum.UserInputType.MouseButton1 then
				slide(input);
			end;
		end);
	
		game:GetService("UserInputService").InputChanged:Connect(function(input)
			if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
				slide(input);
			end;
		end);
	end;
	newSlider("", function(value) _G.fovcircle.Radius = value end, 40, 300, 300);
end
coroutine.wrap(QKWVNBB_fake_script)()
local function YOKWSA_fake_script() -- Aimbot.LocalScript 
	local script = Instance.new('LocalScript', Aimbot)

	local UserInputService = game:GetService("UserInputService")
	
	local gui = script.Parent
	
	local dragging
	local dragInput
	local dragStart
	local startPos
	
	local function update(input)
		local delta = input.Position - dragStart
		gui.Position = gui:TweenPosition(UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y), 'Out', 'Linear', 0.04, true); -- drag speed
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
coroutine.wrap(YOKWSA_fake_script)()
local function TANRWV_fake_script() -- ImageButton_2.LocalScript 
	local script = Instance.new('LocalScript', ImageButton_2)

	local used = false;
	local path = script.Parent.Parent.Scrip   -- change to the path of your frame that you would like to tween
	local function hidestuff(...)
		for i,v in pairs(path:GetDescendants()) do 
			if v:IsA(...)then
				v.Visible = false
			end
		end
	end
	local function unhidestuff(...)
		for i,v in pairs(path:GetDescendants()) do 
			if v:IsA(...)then
				v.Visible = true
			end
		end
	end
	script.Parent.MouseButton1Click:Connect(function()
		if used then used = not used else used = true end
		if used then
			script.Parent.Rotation = 225
			path.ScriptHolder.Visible = false
			hidestuff("TextButton","ImageButton","TextLabel","Frame","ScrollingFrame")
			path:TweenSize(UDim2.new(0, 224,0, 3),Enum.EasingDirection.Out,Enum.EasingStyle.Linear,0.5,true)-- change to the pos you  would like the frame to be when minimized
		else
			unhidestuff("TextButton","ImageButton","TextLabel","Frame","ScrollingFrame")
			path:TweenSize(UDim2.new(0, 224,0, 97),Enum.EasingDirection.In,Enum.EasingStyle.Linear,0.5,true) -- change to the starting position
			script.Parent.Rotation = 180
			wait(0.5)
			path.ScriptHolder.Visible = true
		end
	end)
end
coroutine.wrap(TANRWV_fake_script)()
local function SPAC_fake_script() -- Boxes.Script 
	local script = Instance.new('LocalScript', Boxes)

	toggle = false
	script.Parent.MouseButton1Down:connect(function()
	
		if toggle == true then 
			toggle = false 
		else
			toggle = true
		end
		if toggle == true then 
			script.Parent.Frame.BackgroundColor3 = Color3.fromRGB(28, 107, 255)
		end
		if toggle == false then 
			script.Parent.Frame.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
		end
	
		if toggle == true then
			-- Everything is set by defualt, change what you need (the functions are defualted too)
			espLib.whitelist = {} -- insert string that is the player's name you want to whitelist (turns esp color to whitelistColor in options)
			espLib.blacklist = {} -- insert string that is the player's name you want to blacklist (removes player from esp)
			espLib.options = {
				enabled = true,
				scaleFactorX = 4,
				scaleFactorY = 5,
				font = 2,
				fontSize = 13,
				limitDistance = false,
				maxDistance = 1000,
				visibleOnly = false,
				teamCheck = true,
				teamColor = true,
				fillColor = nil,
				whitelistColor = Color3.new(1, 0, 0),
				outOfViewArrows = false,
				outOfViewArrowsFilled = false,
				outOfViewArrowsSize = 25,
				outOfViewArrowsRadius = 100,
				outOfViewArrowsColor = Color3.new(1, 1, 1),
				outOfViewArrowsTransparency = 0.5,
				outOfViewArrowsOutline = false,
				outOfViewArrowsOutlineFilled = false,
				outOfViewArrowsOutlineColor = Color3.new(1, 1, 1),
				outOfViewArrowsOutlineTransparency = 1,
				names = true,
				nameTransparency = 1,
				nameColor = Color3.new(1, 1, 1),
				boxes = true,
				boxesTransparency = 1,
				boxesColor = Color3.new(1, 1, 1),
				boxFill = true,
				boxFillTransparency = 0.5,
				boxFillColor = Color3.new(1, 1, 1),
				healthBars = false,
				healthBarsSize = 1,
				healthBarsTransparency = 1,
				healthBarsColor = Color3.new(0, 1, 0),
				healthText = false,
				healthTextTransparency = 1,
				healthTextSuffix = "%",
				healthTextColor = Color3.new(1, 1, 1),
				distance = false,
				distanceTransparency = 1,
				distanceSuffix = " Studs",
				distanceColor = Color3.new(1, 1, 1),
				tracers = true,
				tracerTransparency = 1,
				tracerColor = Color3.new(1, 1, 1),
				tracerOrigin = "Top", -- Available [Mouse, Top, Bottom]
				chams = false,
				chamsColor = Color3.new(1, 0, 0),
				chamsTransparency = 0.5,
			}
	
	
			-- THIS STUFF IS FOR MY BAD BUSINESS EXAMPLE
			local client = game.Players.LocalPlayer
			local camera = workspace.CurrentCamera
			local mouse = client:GetMouse()
			local players = game:GetService("Players")
			local rs = game:GetService("RunService") 
			local uis = game:GetService("UserInputService")
			local ts = require(game:GetService("ReplicatedStorage").TS)
			local playerList = {}
			for i,v in ipairs(workspace.Characters:GetChildren()) do 
				playerList[ts.Characters:GetPlayerFromCharacter(v).Name] = v
			end
			workspace.Characters.ChildAdded:connect(function(v)
				playerList[v.Name] = v
			end)
			workspace.Characters.ChildRemoved:connect(function(v)
				playerList[ts.Characters:GetPlayerFromCharacter(v).Name] = nil
			end)
			players.PlayerRemoving:connect(function(v) playerList[v.Name] = nil end)
			local function tableHas(x,y)
				for i,v in pairs(x) do 
					if v == y then return true end 
				end
			end
	
	
			-- Changing the library
			function espLib.GetCharacter(player) -- Change how you get characters for your game
				local character = playerList[player.Name]
				return character, character and game.FindFirstChild(character, "Root") -- Return the character and that the character has it's primary part
			end
			function espLib.GetTeam(player) -- Change how you get teams of a player 
				-- I DIDN'T ADD THE COLORS TO BE TEAM CHECKED, YOU SHOULD THOUGH!!!
				local team = "Omega"  -- My defualt team for bad business, it doesn't have to be a string they just have to be different 
				local teamColor = Color3.fromRGB(255,0,0) -- Defualt team color
				if tableHas(ts.Teams:GetTeamPlayers("Beta"),player) then  -- Checking the other team 
					team = "Beta" -- Changing the info
					teamColor = Color3.fromRGB(0,0,255)
				end
				return team, teamColor -- Return the team and team color 
			end
			function espLib.GetHealth(player, character) -- Change how you get health 
				local health = game.FindFirstChild(character, "Health") -- Make sure they have a humanoid / health container 
				if (health) then 
					return health.Value,health.MaxHealth.Value -- Return their current health and their max health 
				end
				return 100, 100 -- If no humanoid just return 100,100 so no error 
			end
			espLib.Init() -- Start the esp 
	
		end
		if toggle == false then 
		espLib.Unload()
		end
	end)
end
coroutine.wrap(SPAC_fake_script)()
local function WHPCRVJ_fake_script() -- Top.LocalScript 
	local script = Instance.new('LocalScript', Top)

	toggle = false
	script.Parent.MouseButton1Down:connect(function()
	
		if toggle == true then 
			toggle = false 
		else
			toggle = true
		end
	
		if toggle == true then
			tr:Toggle(false)
			tr:Toggle(true)
			tr.Tracers = true
			tr.AttachShift = 12
		end
		if toggle == false then
			
		end
	end)
end
coroutine.wrap(WHPCRVJ_fake_script)()
local function IQXI_fake_script() -- Chest_3.LocalScript 
	local script = Instance.new('LocalScript', Chest_3)

	toggle = false
	script.Parent.MouseButton1Down:connect(function()
	
		if toggle == true then 
			toggle = false 
		else
			toggle = true
		end
	
		if toggle == true then
			tr:Toggle(false)
			tr:Toggle(true)
			tr.Tracers = true
			tr.AttachShift = 2
		end
		if toggle == false then 
		end
	end)
end
coroutine.wrap(IQXI_fake_script)()
local function GIDFO_fake_script() -- Chest_4.LocalScript 
	local script = Instance.new('LocalScript', Chest_4)

	toggle = false
	script.Parent.MouseButton1Down:connect(function()
	
		if toggle == true then 
			toggle = false 
		else
			toggle = true
		end
	
		if toggle == true then
			tr:Toggle(false)
			tr:Toggle(true)
			tr.Tracers = true
			tr.AttachShift = 1
		end
		if toggle == false then 
		end
	end)
end
coroutine.wrap(GIDFO_fake_script)()
local function KPHR_fake_script() -- Boxes_2.Script 
	local script = Instance.new('LocalScript', Boxes_2)

	toggle = false
	script.Parent.MouseButton1Down:connect(function()
	
		if toggle == true then 
			toggle = false 
		else
			toggle = true
		end
		if toggle == true then 
			script.Parent.Frame.BackgroundColor3 = Color3.fromRGB(28, 107, 255)
		end
		if toggle == false then 
			script.Parent.Frame.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
		end
	
    end);
	
			-- Settings Table
			-- Settings Table
 shared.settings = {
    defaultcolor = Color3.fromRGB(255,0,0),
     teamcheck = false,
     teamcolor = true,
     enabled = false;
  };
  
 -- Services
  local settings = shared.settings;
  local runService = game:GetService("RunService");
  local players = game:GetService("Players");
  
  -- Local Stuff
  local localPlayer = players.LocalPlayer;
  local camera = workspace.CurrentCamera;
  
  -- functions
  local newVector2, newColor3, newDrawing = Vector2.new, Color3.new, Drawing.new;
  local tan, rad = math.tan, math.rad;
  local round = function(...) local a = {}; for i,v in next, table.pack(...) do a[i] = math.round(v); end return unpack(a); end;
  local wtvp = function(...) local a, b = camera.WorldToViewportPoint(camera, ...) return newVector2(a.X, a.Y), b, a.Z end;
  
  local espCache = {};
  local function createEsp(player)
     local drawings = {};
     
     drawings.box = newDrawing("Square");
     drawings.box.Thickness = 1;
     drawings.box.Transparency = 0.5;
     drawings.box.Filled = true
     drawings.box.Color = Color3.fromRGB(0,0,0)
     drawings.box.Visible = false;
     drawings.box.ZIndex = 2;
  
     drawings.boxoutline = newDrawing("Square");
     drawings.boxoutline.Thickness = 3;
     drawings.boxoutline.Filled = false;
     drawings.boxoutline.Color = newColor3();
     drawings.boxoutline.Visible = false;
     drawings.boxoutline.ZIndex = 1;
  
     espCache[player] = drawings;
  end
  
  local function removeEsp(player)
     if rawget(espCache, player) then
         for _, drawing in next, espCache[player] do
             drawing:Remove();
         end
         espCache[player] = nil;
     end
  end
  
  local function updateEsp(player, esp)
     local character = player and player.Character;
     if character then
         local cframe = character:GetModelCFrame();
         local position, visible, depth = wtvp(cframe.Position);
         esp.box.Visible = visible;
         esp.boxoutline.Visible = visible;
  
         if cframe and visible then
             local scaleFactor = 1 / (depth * tan(rad(camera.FieldOfView / 2)) * 2) * 1000;
             local width, height = round(4 * scaleFactor, 5 * scaleFactor);
             local x, y = round(position.X, position.Y);
  
             esp.box.Size = newVector2(width, height);
             esp.box.Position = newVector2(round(x - width / 2, y - height / 2));
             esp.box.Color = settings.teamcolor and player.TeamColor.Color or settings.defaultcolor;
  
             esp.boxoutline.Size = esp.box.Size;
             esp.boxoutline.Position = esp.box.Position;
         end
     else
         esp.box.Visible = false;
         esp.boxoutline.Visible = false;
     end
  end
  
  -- main
  
  players.PlayerRemoving:Connect(function(player)
     removeEsp(player);
  end)
  
  script.Parent.MouseButton1Down:Connect(function()
      settings.enabled = not settings.enabled;
  end);

  runService:BindToRenderStep("esp", Enum.RenderPriority.Camera.Value, function()
 
     if (not settings.enabled) then 
        for _, __ in next, players:GetPlayers() do 
            if (__ ~= player) and (espCache[__] ~= nil) then 
                removeEsp(__);
            end;
        end;
     end;

     if (settings.enabled) then 
        for _, __ in next, players:GetPlayers() do 
            if (__ ~= Player) and (espCache[__] == nil) then 
                createEsp(__);
            end;
        end;
     end;

    if (settings.enabled) then 
     for player, drawings in next, espCache do
     
         if settings.teamcheck and player.Team == localPlayer.Team then
             continue;
         end
  
         if drawings and player ~= localPlayer then
             updateEsp(player, drawings);
         end
     end
 end;
  end);

end
coroutine.wrap(KPHR_fake_script)()
local function MFPPVNM_fake_script() -- Boxes_3.Script 
	local script = Instance.new('LocalScript', Boxes_3)

	toggle2 = false
	script.Parent.MouseButton1Down:connect(function()
	
		if toggle2 == true then 
			toggle2 = false 
		else
			toggle2 = true
		end
		if toggle2 == true then 
			script.Parent.Frame.BackgroundColor3 = Color3.fromRGB(28, 107, 255)
		end
		if toggle2 == false then 
			script.Parent.Frame.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
		end
	
		if toggle2 == true then
			local Settings = {
				Color = Color3.fromRGB(255, 0, 0), -- Color of the line
				Thickness = 1, -- Thickness of the line (Overruled by AutoThickness if activated)
				Transparency = 1, -- 1 Visible - 0 Not Visible
				AutoThickness = true, -- Makes Thickness above futile, scales according to distance, good for less encumbered screen
				Length = 15, -- In studs of the line
				Smoothness = 0.2 -- 0.01 - Less Smooth(Faster), 1 - Smoother (Slower)
			}
	
			local toggle = true -- 
			local Button = script.Parent;
			local player = game:GetService("Players").LocalPlayer
			local camera = game:GetService("Workspace").CurrentCamera
	
			local function ESP(plr) --//Main function handling specific plr loop esp for line etc
				local line = Drawing.new("Line") --// Parse and Set the line for tracer
				line.Visible = false
				line.From = Vector2.new(0, 0)
				line.To = Vector2.new(0, 0)
				line.Color = Settings.Color
				line.Thickness = Settings.Thickness
				line.Transparency = Settings.Transparency
	
				local function Updater() --// Function to update the ESP therefore, line destinations etc every /render/
					local connection
					connection = game:GetService("RunService").RenderStepped:Connect(function() -- Putting function in a connection var in order to disconnect if needed, to save performance
						if toggle and plr.Character ~= nil and plr.Character:FindFirstChild("Humanoid") ~= nil and plr.Character:FindFirstChild("HumanoidRootPart") ~= nil and plr.Character.Humanoid.Health > 0 and plr.Character:FindFirstChild("Head") ~= nil then
							local headpos, OnScreen = camera:WorldToViewportPoint(plr.Character.Head.Position)
							if OnScreen then -- checks if player is on screen or not
								local offsetCFrame = CFrame.new(0, 0, -Settings.Length)
								local check = false
								line.From = Vector2.new(headpos.X, headpos.Y)
								if Settings.AutoThickness then
									local distance = (player.Character.HumanoidRootPart.Position - plr.Character.HumanoidRootPart.Position).magnitude --//AutoThickness
									local value = math.clamp(1/distance*100, 0.1, 3) --0.1 is min thickness, 4 is max
									line.Thickness = value
								end
								repeat
									local dir = plr.Character.Head.CFrame:ToWorldSpace(offsetCFrame)
									offsetCFrame = offsetCFrame * CFrame.new(0, 0, Settings.Smoothness)
									local dirpos, vis = camera:WorldToViewportPoint(Vector3.new(dir.X, dir.Y, dir.Z))
									if vis then
										check = true
										line.To = Vector2.new(dirpos.X, dirpos.Y)
										line.Visible = true
										offsetCFrame = CFrame.new(0, 0, -Settings.Length)
									end
								until check == true
							else 
								line.Visible = false
							end
						else 
							line.Visible = false
							if game.Players:FindFirstChild(plr.Name) == nil then
								connection:Disconnect()
							end
						end
	
						if (not toggle) then 
							line.Visible = false;
							connection:Disconnect();
						end;
					end)
				end
				coroutine.wrap(Updater)()
			end
	
			for i, v in pairs(game:GetService("Players"):GetPlayers()) do
				if v.Name ~= player.Name then
					coroutine.wrap(ESP)(v)
				end
			end
	
			game.Players.PlayerAdded:Connect(function(newplr)
				if newplr.Name ~= player.Name then
					coroutine.wrap(ESP)(newplr)
				end
			end)
	
			Button.MouseButton1Down:Connect(function()
				toggle = not toggle;
			end);
	
		end
		if toggle2 == false then 
		toggle = false
		end
	end)
end
coroutine.wrap(MFPPVNM_fake_script)()
local function NNYDFO_fake_script() -- Esp.LocalScript 
	local script = Instance.new('LocalScript', Esp)

	local UserInputService = game:GetService("UserInputService")
	
	local gui = script.Parent
	
	local dragging
	local dragInput
	local dragStart
	local startPos
	
	local function update(input)
		local delta = input.Position - dragStart
		gui.Position = gui:TweenPosition(UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y), 'Out', 'Linear', 0.04, true); -- drag speed
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
coroutine.wrap(NNYDFO_fake_script)()
local function FWTGC_fake_script() -- TextLabel_6.LocalScript 
	local script = Instance.new('LocalScript', TextLabel_6)

	local UIS = game:GetService("UserInputService")
	local toggle = false
	local plr = game.Players.LocalPlayer
	
	UIS.InputBegan:Connect(function(input, proc)
		if input.UserInputType == Enum.UserInputType.Keyboard and input.KeyCode == Enum.KeyCode.F2 then
			toggle = not toggle
			if toggle == true then
				Mouse = game.Players.LocalPlayer:GetMouse()
				function WTS(obj)
					local screen = workspace.CurrentCamera:WorldToViewportPoint(obj)
					return Vector2.new(screen.x, screen.y)
				end
	
	
				_G.fovcircle = Drawing.new("Circle")
				_G.fovcircle.Visible = true
				_G.fovcircle.Radius = 100
				_G.fovcircle.NumSides = 24
				_G.fovcircle.Color = Color3.fromRGB(255, 255, 255)
				_G.fovcircle.Thickness = 1
				_G.fovcircle.Filled = false
				_G.fovcircle.Transparency = 1
	
				game.RunService.RenderStepped:Connect(function()
					_G.fovcircle.Position = WTS(Mouse.hit.p)
	
				end)
			elseif not toggle then
				_G.fovcircle:Remove()
			end
		end
	end)
	
end
coroutine.wrap(FWTGC_fake_script)()
