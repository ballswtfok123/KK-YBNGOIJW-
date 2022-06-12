--Settings--
local ESP = {
	Enabled = false,
	Boxes = true,
	BoxShift = CFrame.new(0,-1.5,0),
	BoxSize = Vector3.new(4,6,0),
	Color = Color3.fromRGB(255, 170, 0),
	HighlightColor = Color3.new(1,1,1),
	HighlightEnabled = false,
	FaceCamera = false,
	Names = true,
	TeamColor = true,
	Thickness = 2,
	AttachShift = 1,
	TeamMates = true,
	Players = true,
	Bars = true,
	GlobalBars = {},
	HrpName = "HumanoidRootPart",
	ScreenScale = 1,
	
	Objects = setmetatable({}, {__mode="kv"}),
	Overrides = {}
}
getgenv().shared.ESP = ESP

if ... and type(...) == "table" then
	for i,v in pairs(...) do
		ESP[i] = v
	end
end

--Declarations--
local cam = workspace.CurrentCamera
local plrs = game:GetService("Players")
local plr = plrs.LocalPlayer
local mouse = plr:GetMouse()

local V3new = Vector3.new
local function WorldToViewportPoint(...)
	local a,b = cam.WorldToViewportPoint(...)
	a = Vector3.new(a.X * ESP.ScreenScale, a.Y * ESP.ScreenScale, a.Z)
	return a,b
end

--Functions--
local function Draw(obj, props)
	local new = Drawing.new(obj)
	
	props = props or {}
	for i,v in pairs(props) do
		new[i] = v
	end
	return new
end

function ESP.GetFOV()
	local screenSize = workspace.CurrentCamera.ViewportSize
	return math.max(math.min(screenSize.X * ESP.ScreenScale, screenSize.Y * ESP.ScreenScale)/2, 400)
end

function ESP.FOVCircle(radius)
	local FOVCircle = Drawing.new("Circle")
	FOVCircle.Radius = radius
	FOVCircle.Color = Color3.fromRGB(255, 170, 0)
	FOVCircle.Thickness = 3
	FOVCircle.Filled = false

	local CircleTbl = {
		Update = function()
			FOVCircle.Position = Vector2.new(mouse.X * ESP.ScreenScale, mouse.Y * ESP.ScreenScale+36)
		end
	}
	table.insert(ESP.Objects, CircleTbl)
	return {Drawing = FOVCircle, Tbl = CircleTbl, Update = CircleTbl.Update}
end

function ESP.GetTarget(Settings, GetEnemies, hrp)
	hrp = hrp or ESP.HrpName
	return function(chance, noVisCheck, ignoreList)
		noVisCheck = Settings.Wallbang or Settings.WallBang or Settings.VisCheck == false or noVisCheck
		ignoreList = Settings.IgnoreList or ignoreList

		local cam = workspace.CurrentCamera

		local camPos = cam.CFrame.p
		local clPos,clPart,clModel
		for i,v in pairs(GetEnemies()) do
			if v.Character and v.Character.Parent then
				local part = v.Character:FindFirstChild("Head")
				if chance and math.random(1, 100) >= Settings.HeadshotChance then
					part = v.Character:FindFirstChild(hrp)
				end
				if part then
					local p,vis = cam:WorldToViewportPoint(part.Position)
					if vis then
						local startPos = camPos
						
						local workspaceDist = (cam.CFrame.p - part.Position).magnitude
						
						local ray = Ray.new(startPos, CFrame.new(cam.CFrame.p, part.Position).LookVector.Unit * p.Z)
						
						local hit
						if not noVisCheck then
							local ignore = ignoreList or {}
							ignore[#ignore + 1] = plr.Character
							ignore[#ignore + 1] = part.Parent
							ignore[#ignore + 1] = cam
							
							hit = workspace:FindPartOnRayWithIgnoreList(ray, ignore)
						end
						if not hit and workspaceDist <= Settings.AimDistance then
							local dist
							local ok = true
							if Settings.AimMode == "Cursor" then
								dist = (Vector3.new(mouse.X,mouse.Y+36,0) - Vector3.new(p.X,p.Y,0)).magnitude
								ok = dist <= (Settings.UsedFOVRange or Settings.FOVRange)
							elseif Settings.AimMode == "Character" then
								dist = (camPos - part.Position).magnitude
							end
							if not clPos and ok then
								clPos = dist
								clPart = part
								clModel = v.Character
							end
							if ok and dist and dist < clPos then
								clPos = dist
								clPart = part
								clModel = v.Character
							end
						end
					end
				end
			end
		end
		return clPart,clModel
	end
end

function ESP:RegisterHighlight(GetTarget)
	game:GetService("RunService").Stepped:Connect(function()
		if not ESP.HighlightEnabled or not ESP.Enabled then
			return
		end
		local target, char = GetTarget()
		if target and char then
			ESP.Highlighted = char
		else
			ESP.Highlighted = nil
		end
	end)
end

function ESP:GetTeam(p)
	local ov = self.Overrides.GetTeam
	if ov then
		return ov(p)
	end
	
	return p and p.Team
end

function ESP:IsTeamMate(p)
	local ov = self.Overrides.IsTeamMate
	if ov then
		return ov(p)
	end
	
	return self:GetTeam(p) == self:GetTeam(plr)
end

function ESP:GetColor(obj)
	local ov = self.Overrides.GetColor
	if ov then
		return ov(obj)
	end
	local p = self:GetPlrFromChar(obj)
	return p and self.TeamColor and p.Team and p.Team.TeamColor.Color or self.Color
end

function ESP:GetPlrFromChar(char)
	local ov = self.Overrides.GetPlrFromChar
	if ov then
		return ov(char)
	end
	
	return plrs:GetPlayerFromCharacter(char)
end

function ESP:Toggle(bool)
	self.Enabled = bool
	if not bool then
		for i,v in pairs(self.Objects) do
			if v.Type == "Box" then --fov circle etc
				if v.Temporary then
					v:Remove()
				else
					for i,v in pairs(v.Components) do
						v.Visible = false
					end
				end
			end
		end
	end
end

--[[function ESP:ToggleTeamMates(bool)
	self.TeamMates = bool
end

function ESP:ToggleTeamColor(bool)
	self.TeamColor = bool
end]]

function ESP:GetBox(obj)
	return self.Objects[obj]
end

function ESP:AddObjectListener(parent, options)
	local function NewListener(c)
		if type(options.Type) == "string" and c:IsA(options.Type) or options.Type == nil then
			if type(options.Name) == "string" and c.Name == options.Name or options.Name == nil then
				if not options.Validator or options.Validator(c) then
					local box = ESP:Add(c, {
						PrimaryPart = type(options.PrimaryPart) == "string" and c:WaitForChild(options.PrimaryPart) or type(options.PrimaryPart) == "function" and options.PrimaryPart(c),
						Color = type(options.Color) == "function" and options.Color(c) or options.Color,
						ColorDynamic = options.ColorDynamic,
						Name = type(options.CustomName) == "function" and options.CustomName(c) or options.CustomName,
						IsEnabled = options.IsEnabled,
						RenderInNil = options.RenderInNil
					})
					--TODO: add a better way of passing options
					if options.OnAdded then
						coroutine.wrap(options.OnAdded)(box)
					end
				end
			end
		end
	end

	if options.Recursive then
		parent.DescendantAdded:Connect(NewListener)
		for i,v in pairs(parent:GetDescendants()) do
			coroutine.wrap(NewListener)(v)
		end
	else
		parent.ChildAdded:Connect(NewListener)
		for i,v in pairs(parent:GetChildren()) do
			coroutine.wrap(NewListener)(v)
		end
	end
end
--ESP:AddObjectListener(parent, type<string ClassName, function validator, nil any>, name<string, nil any> color<Color3, function>, optional isEnabled<string fieldNameInESPTable, function>, onAdded<function>)

function ESP:AddGlobalPlayerBar(name, options, onAdded)
	table.insert(self.GlobalBars, {name, options, onAdded})
	for i,box in pairs(self.Objects) do
		if box.Player then
			coroutine.wrap(onAdded)(box, box:AddBar(name, options))
		end
	end
end

local boxBase = {}
boxBase.__index = boxBase

function boxBase:Remove()
	ESP.Objects[self.Object] = nil
	for i,v in pairs(self.Components) do
		v.Visible = false
		v:Remove()
		self.Components[i] = nil
	end
end

function boxBase:Update()
	if not self.PrimaryPart then
		--warn("not supposed to print", self.Object)
		return self:Remove()
	end

	local color
	if ESP.Highlighted == self.Object then
	   color = ESP.HighlightColor
	else
		color = self.Color or self.ColorDynamic and self:ColorDynamic() or ESP:GetColor(self.Object) or ESP.Color
	end

	local allow = true
	if ESP.Overrides.UpdateAllow and not ESP.Overrides.UpdateAllow(self) then
		allow = false
	end
	if self.Player and not ESP.TeamMates and ESP:IsTeamMate(self.Player) then
		allow = false
	end
	if self.Player and not ESP.Players then
		allow = false
	end
	if self.IsEnabled and (type(self.IsEnabled) == "string" and not ESP[self.IsEnabled] or type(self.IsEnabled) == "function" and not self:IsEnabled()) then
		allow = false
	end
	if not workspace:IsAncestorOf(self.PrimaryPart) and not self.RenderInNil then
		allow = false
	end

	if not allow then
		for i,v in pairs(self.Components) do
			v.Visible = false
		end
		self.Distance = nil
		return
	end

	if ESP.Highlighted == self.Object then
		color = ESP.HighlightColor
	end

	--calculations--
	local cf = self.PrimaryPart.CFrame
	if ESP.FaceCamera then
		cf = CFrame.new(cf.p, cf.p - cam.CFrame.lookVector)
	end
	local size = self.Size
	local locs = {
		TopLeft = cf * ESP.BoxShift * CFrame.new(size.X/2,size.Y/2,0),
		TopRight = cf * ESP.BoxShift * CFrame.new(-size.X/2,size.Y/2,0),
		BottomLeft = cf * ESP.BoxShift * CFrame.new(size.X/2,-size.Y/2,0),
		BottomRight = cf * ESP.BoxShift * CFrame.new(-size.X/2,-size.Y/2,0),
		TagPos = cf * ESP.BoxShift * CFrame.new(0,size.Y/2,0),
		Torso = cf * ESP.BoxShift
	}

	local TopLeft, Vis1
	local BottomLeft, Vis3
	if ESP.Boxes then
		TopLeft, Vis1 = WorldToViewportPoint(cam, locs.TopLeft.p)
		local TopRight, Vis2 = WorldToViewportPoint(cam, locs.TopRight.p)
		BottomLeft, Vis3 = WorldToViewportPoint(cam, locs.BottomLeft.p)
		local BottomRight, Vis4 = WorldToViewportPoint(cam, locs.BottomRight.p)

		if self.Components.Quad then
			if Vis1 or Vis2 or Vis3 or Vis4 then
				self.Components.Quad.Visible = true
				self.Components.Quad.PointA = Vector2.new(TopRight.X, TopRight.Y)
				self.Components.Quad.PointB = Vector2.new(TopLeft.X, TopLeft.Y)
				self.Components.Quad.PointC = Vector2.new(BottomLeft.X, BottomLeft.Y)
				self.Components.Quad.PointD = Vector2.new(BottomRight.X, BottomRight.Y)
				self.Components.Quad.Color = color
			else
				self.Components.Quad.Visible = false
			end
		end
	else
		self.Components.Quad.Visible = false
	end

	if ESP.Names then
		local TagPos, Vis5 = WorldToViewportPoint(cam, locs.TagPos.p)
		
		if Vis5 then
			local dist = (cam.CFrame.p - cf.p).magnitude
			self.Distance = dist

			self.Components.Name.Visible = true
			self.Components.Name.Position = Vector2.new(TagPos.X, TagPos.Y)
			self.Components.Name.Text = self.Name
			self.Components.Name.Color = color
			
			self.Components.Distance.Visible = true
			self.Components.Distance.Position = Vector2.new(TagPos.X, TagPos.Y + 14)
			self.Components.Distance.Text = math.floor(dist) .."m away"
			self.Components.Distance.Color = color
		else
			self.Distance = nil
			self.Components.Name.Visible = false
			self.Components.Distance.Visible = false
		end
	else
		self.Distance = nil
		self.Components.Name.Visible = false
		self.Components.Distance.Visible = false
	end
	
	if ESP.Tracers then
		local TorsoPos, Vis6 = WorldToViewportPoint(cam, locs.Torso.p)

		if Vis6 then
			self.Components.Tracer.Visible = true
			self.Components.Tracer.From = Vector2.new(TorsoPos.X, TorsoPos.Y)
			self.Components.Tracer.To = Vector2.new(cam.ViewportSize.X*ESP.ScreenScale/2,cam.ViewportSize.Y*ESP.ScreenScale/ESP.AttachShift)
			self.Components.Tracer.Color = color
		else
			self.Components.Tracer.Visible = false
		end
	else
		self.Components.Tracer.Visible = false
	end

	if ESP.Bars and ESP.FaceCamera then
		if not ESP.Boxes then
			TopLeft, Vis1 = WorldToViewportPoint(cam, locs.TopLeft.p)
			BottomLeft, Vis3 = WorldToViewportPoint(cam, locs.BottomLeft.p)
		end

		local amount = 0
		for i,v in pairs(self.Bars) do
			if (Vis1 or Vis3) and v.Value < 1 then
				local x = TopLeft.X - amount * 5 - 3 --i like magic numbers, basically 1st offset should be -3, 2nd -8, 3rd -13, etc.
				local barWidth = 4
				local barPadding = 1

				v.Components.BarBackground.Visible = true
				v.Components.BarBackground.PointA = Vector2.new(x, TopLeft.Y)
				v.Components.BarBackground.PointB = Vector2.new(x - barWidth, TopLeft.Y)
				v.Components.BarBackground.PointC = Vector2.new(x - barWidth, BottomLeft.Y)
				v.Components.BarBackground.PointD = Vector2.new(x, BottomLeft.Y)
				--v.Components.BarBackground.Color = color

				v.Components.Bar.Visible = true
				v.Components.Bar.Color = v.Color
				local height = (BottomLeft.Y - TopLeft.Y - barPadding * 2) * (1-v.Value)
				v.Components.Bar.PointA = Vector2.new(x - barPadding, TopLeft.Y + height + barPadding)
				v.Components.Bar.PointB = Vector2.new(x - barWidth + barPadding, TopLeft.Y + height + barPadding)
				v.Components.Bar.PointC = Vector2.new(x - barWidth + barPadding, BottomLeft.Y - barPadding)
				v.Components.Bar.PointD = Vector2.new(x - barPadding, BottomLeft.Y - barPadding)
				amount = amount + 1
			else
				v.Components.BarBackground.Visible = false
				v.Components.Bar.Visible = false
			end
		end
	else
		for i,v in pairs(self.Bars) do
			v.Components.BarBackground.Visible = false
			v.Components.Bar.Visible = false
		end
	end
end

function ESP:Add(obj, options)
	if not obj.Parent and not options.RenderInNil then
		return warn("[KH ESP]:", obj, "has no parent")
	end

	local box = setmetatable({
		Name = options.Name or obj.Name,
		Type = "Box",
		Color = options.Color --[[or self:GetColor(obj)]],
		Size = options.Size or self.BoxSize,
		Object = obj,
		Player = options.Player or plrs:GetPlayerFromCharacter(obj),
		PrimaryPart = options.PrimaryPart or obj.ClassName == "Model" and (obj.PrimaryPart or obj:FindFirstChild(ESP.HrpName) or obj:FindFirstChildWhichIsA("BasePart")) or obj:IsA("BasePart") and obj,
		Components = {},
		IsEnabled = options.IsEnabled,
		Temporary = options.Temporary,
		ColorDynamic = options.ColorDynamic,
		RenderInNil = options.RenderInNil,
		Bars = {}
	}, boxBase)

	if self:GetBox(obj) then
		self:GetBox(obj):Remove()
	end

	box.Components["Quad"] = Draw("Quad", {
		Thickness = self.Thickness,
		Color = color,
		Transparency = 1,
		Filled = false,
		Visible = self.Enabled and self.Boxes
	})
	box.Components["Name"] = Draw("Text", {
		Text = box.Name,
		Color = box.Color,
		Center = true,
		Outline = true,
		Size = 19,
		Visible = self.Enabled and self.Names
	})
	box.Components["Distance"] = Draw("Text", {
		Color = box.Color,
		Center = true,
		Outline = true,
		Size = 19,
		Visible = self.Enabled and self.Names
	})
	
	box.Components["Tracer"] = Draw("Line", {
		Thickness = ESP.Thickness,
		Color = box.Color,
		Transparency = 1,
		Visible = self.Enabled and self.Tracers
	})
	self.Objects[obj] = box
	
	obj.AncestryChanged:Connect(function(_, parent)
		if parent == nil and ESP.AutoRemove ~= false then
			box:Remove()
		end
	end)
	obj:GetPropertyChangedSignal("Parent"):Connect(function()
		if obj.Parent == nil and ESP.AutoRemove ~= false then
			box:Remove()
		end
	end)

	local hum = obj:FindFirstChildOfClass("Humanoid")
	if hum then
		hum.Died:Connect(function()
			if ESP.AutoRemove ~= false then
				box:Remove()
			end
		end)
	end

	return box
end

local barBase = {}
barBase.__index = barBase

function boxBase:AddBar(name, options)
	local bar = setmetatable({
		Name = name,
		Type = "Bar",
		Color = options.Color,
		Components = {},
		Value = 0.4
	}, barBase)

	table.insert(self.Bars, bar)

	bar.Components["BarBackground"] = Draw("Quad", {
		Thickness = ESP.Thickness,
		Color = Color3.fromRGB(26,26,26),
		Transparency = 1,
		Filled = true,
		Visible = ESP.Enabled and ESP.Bars
	})
	bar.Components["Bar"] = Draw("Quad", {
		Thickness = ESP.Thickness,
		Color = bar.Color,
		Transparency = 1,
		Filled = true,
		Visible = ESP.Enabled and ESP.Bars
	})
	for i,v in pairs(bar.Components) do
		table.insert(self.Components, v) --for box:Remove()
	end
	return bar
end

local function CharAdded(char)
	local p = plrs:GetPlayerFromCharacter(char)
	if not char:FindFirstChild(ESP.HrpName) then
		local ev
		ev = char.ChildAdded:Connect(function(c)
			if c.Name == ESP.HrpName then
				ev:Disconnect()
				local box = ESP:Add(char, {
					Name = p.Name,
					Player = p,
					PrimaryPart = c
				})
				for i,v in pairs(ESP.GlobalBars) do
					coroutine.wrap(v[3])(box, box:AddBar(v[1], v[2]))
				end
			end
		end)
	else
		local box = ESP:Add(char, {
			Name = p.Name,
			Player = p,
			PrimaryPart = char:FindFirstChild(ESP.HrpName)
		})
		for i,v in pairs(ESP.GlobalBars) do
			coroutine.wrap(v[3])(box, box:AddBar(v[1], v[2]))
		end
	end
end
local function PlayerAdded(p)
	p.CharacterAdded:Connect(CharAdded)
	if p.Character then
		coroutine.wrap(CharAdded)(p.Character)
	end
end
plrs.PlayerAdded:Connect(PlayerAdded)
for i,v in pairs(plrs:GetPlayers()) do
	if v ~= plr then
		PlayerAdded(v)
	end
end

game:GetService("RunService").RenderStepped:Connect(function()
	cam = workspace.CurrentCamera
	for i,v in (ESP.Enabled and pairs or ipairs)(ESP.Objects) do
		if v.Update then
			local s,e = pcall(v.Update, v)
			if not s then warn("[EU]", e, v.Object:GetFullName()) end
		end
	end
end)

return ESP