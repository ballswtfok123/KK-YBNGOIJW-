-- Decompiled with the Synapse X Luau decompiler.

local l__Parent__1 = script.Parent;
l__Parent__1.GKey:Destroy();
local v2 = {};
local v3 = require(l__Parent__1.Animation);
local v4 = require(l__Parent__1.Player);
local v5 = require(l__Parent__1.Utility);
local v6 = require(l__Parent__1.Weapon);
local v7 = require(l__Parent__1.Projectiles);
local v8 = require(l__Parent__1.Audio);
local v9 = require(l__Parent__1.FX);
local v10 = require(l__Parent__1.Network);
local v11 = require(l__Parent__1.Loadout);
local v12 = require(l__Parent__1.UI);
local v13 = require(l__Parent__1.Menu);
local v14 = require(l__Parent__1.Buildable);
local v15 = require(l__Parent__1.NoRallyZones);
local v16 = require(l__Parent__1.CropZones);
local v17 = require(l__Parent__1.LOD);
v2.Animation = v3;
v2.PlayerModule = v4;
v2.Utility = v5;
v2.Weapon = v6;
v2.Projectiles = v7;
v2.Audio = v8;
v2.FX = v9;
v2.CharacterController = require(l__Parent__1.CharacterController);
v2.Network = v10;
v2.Loadout = v11;
v2.UI = v12;
v2.Menu = v13;
v2.Buildable = v14;
v2.NoRallyZones = v15;
v2.CropZones = v16;
v2.LOD = v17;
v2.TimeOfDay = require(l__Parent__1.TimeOfDay);
local v18 = {};
v2.PlayerList = v18;
local v19 = {
	Flashlight = {}, 
	Laser = {}
};
v2.BlindTables = v19;
local v20 = {
	Fireteams = {}, 
	Team1FireteamCount = 0, 
	Team2FireteamCount = 0
};
v2.FireteamList = v20;
v20.Fireteams[0] = {
	FireteamID = 0, 
	FireteamTeam = 0, 
	FireteamType = "", 
	FireteamName = ""
};
local v21 = {};
v2.BuildableObjectTables = v21;
local v22 = {
	Concrete = "Concrete", 
	Cobblestone = "Concrete", 
	Pebble = "Concrete", 
	Brick = "Concrete", 
	Granite = "Concrete", 
	Sand = "Concrete", 
	Slate = "Concrete", 
	Plastic = "Concrete", 
	SmoothPlastic = "Concrete", 
	Marble = "Concrete", 
	Grass = "Dirt", 
	Fabric = "Dirt", 
	Glass = "Glass", 
	Metal = "Metal", 
	CorrodedMetal = "Metal", 
	DiamondPlate = "Metal", 
	Neon = "Metal", 
	Wood = "Wood", 
	WoodPlanks = "Wood"
};
v2.MaterialsTable = v22;
v2.MaterialSharesFX = {
	Drywall = "Concrete", 
	Canvas = "Concrete"
};
v2.ProjectileMaterialValues = {};
v2.DefaultBinds = {
	AimInput = "Hold", 
	LeanInput = "Hold", 
	FireWeapon = "MouseButton1", 
	AimDownSight = "MouseButton2", 
	Interact = "B", 
	FTCommandWheel = "MouseButton3", 
	ViewAmmoBag = "Tab", 
	ToggleNightVision = "N", 
	LowerStance = "C", 
	RaiseStance = "X", 
	LeanL = "Q", 
	LeanR = "E", 
	ToggleFreelook = "LeftAlt", 
	ViewMap = "M", 
	ChangeChatType = "V", 
	Sprint = "LeftShift", 
	TacPace = "T", 
	ChangeFiremode = "F", 
	Reload = "R", 
	ToggleGrenadeLauncher = "G", 
	SwitchSights = "Y", 
	ToggleLaser = "H", 
	ToggleFlashlight = "J"
};
v2.Keybinds = v2.DefaultBinds;
v2.gameSettings = {
	NightVisionDoF = true, 
	BloomEffects = true, 
	DistanceHaze = true
};
math.randomseed(l__Parent__1.GKey.Value);
local l__ContentProvider__23 = game:GetService("ContentProvider");
local l__ReplicatedFirst__24 = game:GetService("ReplicatedFirst");
local l__ReplicatedStorage__25 = game:GetService("ReplicatedStorage");
local l__Players__26 = game:GetService("Players");
local l__StarterGui__27 = game:GetService("StarterGui");
l__StarterGui__27:SetCoreGuiEnabled(Enum.CoreGuiType.All, false);
local l__ScriptContext__28 = game:GetService("ScriptContext");
local l__UserInputService__29 = game:GetService("UserInputService");
local l__LocalPlayer__30 = l__Players__26.LocalPlayer;
local l__LoadingScreen__31 = l__ReplicatedFirst__24.LoadingScreen;
l__LoadingScreen__31.Parent = l__LocalPlayer__30.PlayerGui;
if not game:IsLoaded() then
	game.Loaded:Wait();
	wait();
end;
local l__RunService__1 = game:GetService("RunService");
workspace.LOD:Destroy();
for v32, v33 in pairs(workspace:GetDescendants()) do
	if v33:IsA("BasePart") then
		if v33:FindFirstChild("ProjectileMaterial") then
			v2.ProjectileMaterialValues[v33] = v33.ProjectileMaterial.Value;
		elseif v33.Name == "Leaves" or v33.Name == "Crops" then
			v2.ProjectileMaterialValues[v33] = "Foliage";
		else
			v2.ProjectileMaterialValues[v33] = v22[v33.Material.Name];
		end;
	end;
end;
local l__Assets__34 = l__ReplicatedStorage__25.Assets;
local l__LoadingAssetType__35 = l__LoadingScreen__31.ImageLabel.LoadingAssetType;
l__LoadingAssetType__35.Text = "INITIALIZING MODULES";
v10.initialize(v2);
local v36, v37, v38, v39, v40, v41 = l__ReplicatedStorage__25.Events.RequestTeamConfigs:InvokeServer();
v2.ServerTeamData = {
	GearConfigs = v36, 
	RoleIconData = v37, 
	FireteamTypesData = v38, 
	TeamAppearanceData = v39, 
	Weapons = v40, 
	WeaponAttachments = v41
};
local v42, v43 = l__ReplicatedStorage__25.Events.GetServerDataConstants:InvokeServer();
v2.ServerDataConstants = {
	GameSettings = v42, 
	ProjectilesData = v43
};
v11.initialize(v2);
v12.initialize(v2);
v13.initialize(v2);
v8.initialize(v2);
v3.initialize(v2);
v9.initialize(v2);
v6.initialize(v2);
v4.initialize(v2);
v7.initialize(v2);
v14.initialize(v2);
v15.initialize(v2);
v16.initialize(v2);
v17.initialize(v2);
v11.initializeFactionGear(v36, v40, v41);
flagDataInit = nil;
local l__new__44 = v4.new;
local l__Events__45 = l__ReplicatedStorage__25.Events;
local v46, v47 = v5.TaskScheduler.new(10, "Update players");
local l__CurrentCamera__48 = workspace.CurrentCamera;
local l__FieldOfView__49 = l__CurrentCamera__48.FieldOfView;
local l__ViewportSize__50 = l__CurrentCamera__48.ViewportSize;
v2.Team1Count = l__ReplicatedStorage__25.MapData.Team1Count.Value;
v2.Team2Count = l__ReplicatedStorage__25.MapData.Team2Count.Value;
l__ReplicatedStorage__25.MapData.Team1Count.Changed:Connect(function()
	v2.Team1Count = l__ReplicatedStorage__25.MapData.Team1Count.Value;
end);
l__ReplicatedStorage__25.MapData.Team2Count.Changed:Connect(function()
	v2.Team2Count = l__ReplicatedStorage__25.MapData.Team2Count.Value;
end);
local function u2(p1, p2, p3, p4, p5, p6, p7)
	p1:setTeam(p2.Value);
	p1:setFireteam(p3.Value);
	p1:setClass({
		RoleType = p5.Value, 
		Role = p6.Value, 
		RoleTeam = p7.Value
	}, (l__ReplicatedStorage__25.Events.RequestMyClassData:InvokeServer()));
	p2.Changed:Connect(function()
		p1:setTeam(p2.Value);
	end);
	p3.Changed:Connect(function()
		p1:setFireteam(p3.Value);
	end);
	p4.Changed:Connect(function()
		p1:setClass({
			RoleType = p5.Value, 
			Role = p6.Value, 
			RoleTeam = p7.Value
		}, (l__ReplicatedStorage__25.Events.RequestMyClassData:InvokeServer()));
	end);
end;
local function u3(p8, p9)
	if #p9:GetDescendants() ~= 7 then
		p9.DescendantAdded:Connect(function()
			if #p9:GetDescendants() == 7 then
				local l__Class__51 = p9.Class;
				u2(p8, p9.TeamValue, p9.FireteamID, p9.ClassChange, l__Class__51.RoleType, l__Class__51.Role, l__Class__51.RoleTeam);
			end;
		end);
		return;
	end;
	local l__Class__52 = p9.Class;
	u2(p8, p9.TeamValue, p9.FireteamID, p9.ClassChange, l__Class__52.RoleType, l__Class__52.Role, l__Class__52.RoleTeam);
end;
local function v53(p10, p11)
	if p10 then
		if not p10:FindFirstChild("PlayerData") then
			p10.DescendantAdded:Connect(function(p12)
				if p12.Name == "PlayerData" then
					u3(p11, p12);
				end;
			end);
			return;
		end;
	else
		return;
	end;
	u3(p11, p10.PlayerData);
end;
local v54 = l__new__44(l__LocalPlayer__30);
v18[l__LocalPlayer__30.Name] = v54;
v4:setMyPlayer();
v6:setMyPlayer(v54);
v7:setMyPlayer();
v12:setMyPlayer();
v13:setMyPlayer();
v14:setMyPlayer();
v53(l__LocalPlayer__30, v54);
print("Player Initialized");
l__UserInputService__29.MouseIconEnabled = false;
local u4 = l__CurrentCamera__48.CFrame.Position;
local u5 = 85 / l__FieldOfView__49;
local u6 = l__CurrentCamera__48.CFrame.LookVector;
local u7 = l__ViewportSize__50.X + 100;
local u8 = l__ViewportSize__50.Y + 100;
local function v55(p13)
	if p13 ~= l__LocalPlayer__30 then
		local l__Name__56 = p13.Name;
		local v57 = v18[l__Name__56] or l__new__44(p13);
		if not v18[l__Name__56] then
			v18[l__Name__56] = v57;
			v53(p13, v57);
			local u9 = nil;
			v57.playerUpdateConnection = v47:Connect(function(p14, p15)
				local l__humanoidRootPart__58 = v57.humanoidRootPart;
				if not l__humanoidRootPart__58 then
					return;
				end;
				local l__Position__59 = l__humanoidRootPart__58.Position;
				local v60 = l__Position__59 - u4;
				local l__Magnitude__61 = v60.Magnitude;
				if l__Magnitude__61 < 50 * u5 then
					u9 = 100;
				elseif l__Magnitude__61 < 200 * u5 then
					u9 = 30;
				elseif l__Magnitude__61 < 500 * u5 then
					u9 = 10;
				else
					u9 = 1;
				end;
				local v62 = false;
				local v63 = l__CurrentCamera__48:WorldToViewportPoint(l__Position__59);
				local l__X__64 = v63.X;
				local l__Y__65 = v63.Y;
				if 1 / u9 <= p14 - v57.Ticks.updateCharacter then
					local v66 = true;
					if not (u6:Dot(v60.Unit) >= 0.99) then
						v66 = l__Magnitude__61 <= 30;
					end;
					local v67 = false;
					if v63.Z > -10 then
						v67 = false;
						if -u7 <= l__X__64 then
							v67 = false;
							if l__Y__65 >= -100 then
								v67 = false;
								if l__X__64 <= u7 then
									v67 = l__Y__65 <= u8;
								end;
							end;
						end;
					end;
					v57.usernameTag.Enabled = v66 and (v67 and v57.team == v54.team);
					v57.onScreen = v67;
					v57.Ticks.updateCharacter = p14;
					v62 = v67;
				end;
				v57:update(p14, p15, v62);
				return v62;
			end);
		end;
		v13:UIupdateTeams();
	end;
end;
v10:connectReceiveEvent("AddPlayer", v55);
v10:connectReceiveEvent("RemovePlayer", function(p16)
	local v68 = v18[p16];
	if v68 then
		v68:Destroy();
	end;
	v18[p16] = nil;
	v19.Flashlight[p16] = nil;
	v19.Laser[p16] = nil;
	v13:UIupdateTeams();
end);
local function v69(p17, p18, p19, p20, p21, ...)
	local v70 = nil;
	local v71 = nil;
	local v72 = { ... };
	local v73 = v18[p17];
	local v74 = {
		Creator = v73, 
		ID = p21, 
		Team = p18, 
		Object = p20, 
		Type = p19
	};
	if p19 == "Rally" then
		v70 = v72[1];
		v71 = v20.Fireteams[v70];
		if not v71 then
			return;
		end;
	elseif p19 == "AmmoSource" then
		v74.AmmoBagIndex = v72[1];
		if v73 then
			v73.ammoBag = v14.new(v74);
			return;
		else
			return;
		end;
	else
		v14.new(v74);
		return;
	end;
	v74.fireteam = v71;
	v71.FireteamRally = v14.new(v74);
	if v54.fireteam.FireteamID == v70 then
		v13:DeployRallyButtonReady(true, v71.FireteamRally.tickets);
	end;
	v71.FireteamRally:updateUI();
end;
v10:connectReceiveEvent("BuildObject", v69);
v10:connectReceiveEvent("DestroyObject", function(p22)
	local v75 = v21[p22];
	if v75 then
		v75:Destroy();
	end;
end);
v10:connectReceiveEvent("UpdateRallyTickets", function(p23, p24)
	local v76 = v21[p23];
	if v76 then
		v76.tickets = p24;
		if v54.fireteam.FireteamID == v76.fireteam.FireteamID and p24 ~= 0 then
			v13:DeployRallyButtonReady(true, p24);
		end;
	end;
end);
v10:connectReceiveEvent("RallyHostileNearby", function(p25, p26)
	local v77 = v21[p25];
	if v77 then
		v77.hostilesNearby = p26;
	end;
end);
v10:connectReceiveEvent("RallyDestruction", function(p27, p28)
	local v78 = v21[p27];
	if v78 then
		if not p28 then
			v78:cancelDestruction();
			return;
		end;
	else
		return;
	end;
	v78:startDestruction();
end);
v10:connectReceiveEvent("ClearAllBuildables", function()
	for v79, v80 in pairs(v21) do
		v80:Destroy();
	end;
end);
v10:connectReceiveEvent("UpdateAmmoBagSupplies", function(p29, p30, p31)
	local v81 = v18[p29];
	if v81 then
		v81:updateAmmoBagSupplies(p30, p31);
	end;
end);
v10:connectReceiveEvent("Team", function(p32, p33)
	local v82 = v18[p32];
	if v82 then
		v82:setTeam(p33);
	end;
end);
v10:connectReceiveEvent("Fireteam", function(p34, p35)
	local v83 = v18[p34];
	if v83 then
		v83:setFireteam(p35);
	end;
end);
v10:connectReceiveEvent("Class", function(p36, p37, p38)
	local v84 = v18[p36];
	if v84 then
		v84:setClass(p37, p38);
	end;
end);
v10:connectReceiveEvent("Chat", function(p39, p40, p41, p42, p43, p44, p45)
	if v18[p39] then
		v12:Chat(p40, p41, p42, p43, p44, p45);
		if p45 == "Fireteam" or p42 == p39 then
			v8:playRadioSound(#p41);
		end;
	end;
end);
v10:connectReceiveEvent("Console", function(p46, p47, p48)
	if v18[p46] and p47 == "dispMSG" then
		v12:spawnMessage("<font color='rgb(204, 85, 85)'>" .. p48 .. "</font>");
	end;
end);
v10:connectReceiveEvent("SetAdmin", function(p49, p50)
	local v85 = v18[p49];
	if v85 then
		v12:setAdmin(p50);
		v85.isStaff = true;
	end;
end);
v10:connectReceiveEvent("UIupdateTeams", function(p51)
	if v18[p51] then
		v13:UIupdateTeams();
	end;
end);
v10:connectReceiveEvent("UIupdateStagingTimeState", function(p52)
	v12:stagingGuiTimerVisible(p52);
end);
v10:connectReceiveEvent("UIupdateFlags", function(p53, p54)
	v13:UIupdateFlags(p53, p54);
	print("update flags");
end);
v10:connectReceiveEvent("UIaddMarker", function(p55, p56, p57)
	if v54.fireteam.FireteamID == p55 and v54.mapHandler then
		v54.mapHandler:placeMarker(p56, p57);
	end;
end);
v10:connectReceiveEvent("UIremoveMarker", function(p58, p59)
	if v54.fireteam.FireteamID == p58 and v54.mapHandler then
		v54.mapHandler:removeMarker(p59);
	end;
end);
v10:connectReceiveEvent("UIgetMarkers", function(p60, p61)
	if v54.mapHandler then
		if p60 == "Get" then
			v54.mapHandler:sendMapMarkers(p61);
			return;
		end;
		if p60 == "Send" then
			for v86, v87 in pairs(p61) do
				v54.mapHandler:placeMarker(v87.pos, v87.cmd);
			end;
		end;
	end;
end);
l__Events__45.UpdateCheck.OnClientInvoke = function(p62)
	if not p62 then
		return false;
	end;
	local v88 = workspace:GetPartBoundsInBox(p62:GetPrimaryPartCFrame() - Vector3.new(0, 6, 0), Vector3.new(2, 12, 2), OvParams);
	return v88 and #v88 > 0;
end;
local function v89(p63, p64)
	local v90, v91, v92, v93, v94, v95, v96, v97, v98, v99, v100, v101, v102, v103, v104 = string.unpack("I2I2ssi2i2i2i2i2i2sssss", p63);
	local v105 = {};
	if v100 and v100 ~= " " then
		v105[v100] = true;
	end;
	if v101 and v101 ~= " " then
		v105[v101] = true;
	end;
	if v102 and v102 ~= " " then
		v105[v102] = true;
	end;
	if v103 and v103 ~= " " then
		v105[v103] = true;
	end;
	if v104 and v104 ~= " " then
		v105[v104] = true;
	end;
	if v20.Fireteams[v90] then
		local v106 = v20.Fireteams[v90];
		v106.Command = v94;
		v106.Infantry = v95;
		v106.Specialist = v96;
		v106.Support = v97;
		v106.Unassigned = v98;
		v106.FireteamPlayerCount = v99;
		v106.FireteamRally = p64;
		v106.FireteamMembers = v105;
		v13:appendFireteam(v106);
		return;
	end;
	local v107 = {
		FireteamID = v90, 
		FireteamTeam = v91, 
		FireteamType = v92, 
		FireteamName = v93, 
		Command = v94, 
		Infantry = v95, 
		Specialist = v96, 
		Support = v97, 
		Unassigned = v98, 
		FireteamPlayerCount = v99, 
		FireteamRally = p64, 
		FireteamMembers = v105
	};
	local v108 = "Team" .. v91 .. "FireteamCount";
	v20[v108] = v20[v108] + 1;
	v20.Fireteams[v90] = v107;
	v13:appendFireteam(v107);
end;
v10:connectReceiveEvent("AppendFireteam", v89);
v10:connectReceiveEvent("RemoveFireteam", function(p65)
	local v109 = v20.Fireteams[p65];
	if v109 then
		v13:removeFireteam(v109);
		v20["Team" .. v109.FireteamTeam .. "FireteamCount"] = v20["Team" .. v109.FireteamTeam .. "FireteamCount"] - 1;
	end;
end);
v10:connectReceiveEvent("MapUIAASObjectivesUpdate", function(p66)
	local v110 = v18[p66];
	if v110 then
		v110:mapUIAASObjectivesUpdate();
	end;
end);
v10:connectReceiveEvent("AngleX", function(p67, p68)
	local v111 = v18[p67];
	if v111 then
		v111.targetAngleX = p68;
	end;
end);
v10:newSendData("AngleX", 0);
v10:connectReceiveEvent("FreeLookX", function(p69, p70)
	local v112 = v18[p69];
	if v112 then
		v112.targetFreeLookX = p70;
	end;
end);
v10:newSendData("FreeLookX", 0);
v10:connectReceiveEvent("FreeLookY", function(p71, p72)
	local v113 = v18[p71];
	if v113 then
		v113.targetFreeLookY = p72;
	end;
end);
v10:newSendData("FreeLookY", 0);
v10:connectReceiveEvent("Stance", function(p73, p74)
	local v114 = v18[p73];
	if v114 then
		v114.stanceSpring.t = p74;
	end;
end);
v10:newSendData("Stance", 0);
v10:connectReceiveEvent("Aim", function(p75, p76)
	local v115 = v18[p75];
	if v115 then
		v115.aimSpring.t = p76;
	end;
end);
v10:newSendData("Aim", 0);
v10:connectReceiveEvent("Sprint", function(p77, p78)
	local v116 = v18[p77];
	if v116 then
		v116.sprintSpring.t = p78;
	end;
end);
v10:newSendData("Sprint", 0);
v10:connectReceiveEvent("TacPace", function(p79, p80)
	local v117 = v18[p79];
	if v117 then
		v117.tacPaceSpring.t = p80;
	end;
end);
v10:newSendData("TacPace", 0);
v10:connectReceiveEvent("Equip", function(p81, p82)
	local v118 = v18[p81];
	if v118 then
		v118:equip(p82);
	end;
end);
v10:newSendData("Equip", 0);
v10:connectReceiveEvent("Reload", function(p83)
	local v119 = v18[p83];
	if v119 then
		v119:reload();
	end;
end);
v10:connectReceiveEvent("Lean", function(p84, p85)
	local v120 = v18[p84];
	if v120 then
		v120.leanSpring.t = p85;
	end;
end);
v10:newSendData("Lean", 0);
v10:connectReceiveEvent("Cover", function(p86, p87)
	local v121 = v18[p86];
	if v121 then
		v121.coverSpring.t = p87;
	end;
end);
v10:newSendData("Cover", 0);
v10:connectReceiveEvent("FireMode", function(p88, p89)
	local v122 = v18[p88];
	if v122 then
		v122:setFiremode(p89);
	end;
end);
v10:newSendData("FireMode", 1);
v10:connectReceiveEvent("ShowMuzzleFlash", function(p90, p91)
	local v123 = v18[p90];
	if v123 then
		v123:setWeaponMuzzleFlash(p91);
	end;
end);
v10:connectReceiveEvent("Laser", function(p92, p93)
	local v124 = v18[p92];
	if v124 then
		v124:setLaser(p93);
	end;
end);
v10:newSendData("Laser", false);
v10:connectReceiveEvent("LaserPosition", function(p94, p95)
	local v125 = v18[p94];
	if v125 then
		v125.laserPosition = p95;
	end;
end);
v10:newSendData("LaserPosition", 0);
v10:connectReceiveEvent("Flashlight", function(p96, p97)
	local v126 = v18[p96];
	if v126 then
		v126:setFlashlight(p97);
	end;
end);
v10:newSendData("Flashlight", false);
v10:connectReceiveEvent("FlashlightPosition", function(p98, p99)
	local v127 = v18[p98];
	if v127 then
		v127.flashlightPosition = p99;
	end;
end);
v10:newSendData("FlashlightPosition", 0);
v10:connectReceiveEvent("NV", function(p100, p101)
	local v128 = v18[p100];
	if v128 then
		v128:toggleNightVision(p101);
	end;
end);
v10:newSendData("NV", false);
v10:connectReceiveEvent("Fire", function(p102, p103)
	local v129 = v18[p102];
	if v129 then
		v129:setFire(p103);
	end;
end);
v10:newSendData("Fire", false);
v10:connectReceiveEvent("SetGL", function(p104, p105)
	local v130 = v18[p104];
	if v130 then
		v130:setGLActive(p105);
	end;
end);
v10:newSendData("SetGL", false);
v10:connectReceiveEvent("TookDamageFX", function(p106, p107, p108)
	local v131 = v18[p106];
	if v131 then
		v131:tookDamageFX(p107, p108);
	end;
end);
v10:connectReceiveEvent("Health", function(p109, p110)
	local v132 = v18[p109];
	if v132 then
		v132:changeHealth(p110);
	end;
end);
v10:newSendData("Health", 100);
v10:connectReceiveEvent("BleedoutTimer", function(p111, p112)
	local v133 = v18[p111];
	if v133 then
		v133.BleedoutTimer = p112;
	end;
end);
v10:newSendData("BleedoutTimer", 120);
v10:connectReceiveEvent("Dead", function(p113, p114)
	local v134 = v18[p113];
	if v134 then
		v134:kill(p114);
	end;
end);
v10:newSendData("Dead", false);
v10:connectReceiveEvent("Incapped", function(p115, p116, p117, p118)
	local v135 = v18[p115];
	if v135 then
		v135:setIncapped(p116, p117, p118);
	end;
end);
v10:newSendData("Incapped", false);
v10:connectReceiveEvent("FloorMaterial", function(p119, p120)
	local v136 = v18[p119];
	if v136 then
		v136.FloorMaterial = p120;
	end;
end);
v10:connectReceiveEvent("WalkingSpeed", function(p121, p122)
	local v137 = v18[p121];
	if v137 then
		v137.walkingSpeed = p122;
		v137.audioHandler:playFootstepSound(v137.groundMaterial, v137.walkingSpeed, v137.inCrops);
	end;
end);
v10:newSendData("WalkingSpeed", "Stopped");
v10:connectReceiveEvent("Jump", function(p123, p124)
	local v138 = v18[p123];
	if v138 then
		v138.audioHandler:onJump(p124);
	end;
end);
v10:connectReceiveEvent("Land", function(p125, p126)
	local v139 = v18[p125];
	if v139 then
		v139.audioHandler:onLand(p126);
	end;
end);
v10:connectReceiveEvent("RotateTeams", function(p127, p128, p129, p130, p131, p132)
	v2.ServerTeamData = {
		GearConfigs = p127, 
		RoleIconData = p128, 
		FireteamTypesData = p129, 
		TeamAppearanceData = p130, 
		Weapons = p131, 
		WeaponAttachments = p132
	};
	v11.initializeFactionGear(p127, p131, p132);
	v13:updateServerTeamData(p128, p129, p130);
	v12:updateFactionFlags(p130);
	v12:updateMapFlags(p130);
end);
v10:connectReceiveEvent("ProjectileHit", function(p133, p134, p135)
	local v140 = v18[p133];
	if v140 then
		local v141, v142, v143, v144, v145, v146, v147, v148, v149, v150, v151, v152, v153, v154, v155, v156 = string.unpack("i3i3i3i3i3i3sI1I1I1I3I2I1I1I1I1", p135);
		if v140.projectiles[v151] then
			v140.projectiles[v151](p134, Vector3.new(v141, v142, v143) / 1000, Vector3.new(v144, v145, v146) / 1000, v147, Color3.fromRGB(v148, v149, v150), v153 == 1, v154 == 1, v155 == 1, v156 == 1);
		end;
	end;
end);
local u10 = l__FieldOfView__49;
local u11 = l__ViewportSize__50;
local l__smoothLerp__12 = v5.Mathf.smoothLerp;
l__UserInputService__29.InputChanged:Connect(function(p136)
	local v157 = nil;
	local v158 = nil;
	if not (not v54.dead) or not (not v54.incapped) or not v54.character then
		return;
	end;
	if p136.UserInputType ~= Enum.UserInputType.MouseMovement then
		if p136.UserInputType == Enum.UserInputType.MouseWheel then
			v54:changeGLSegment(p136.Position.Z);
		end;
		return;
	end;
	v157 = p136.Delta;
	v158 = l__CurrentCamera__48.FieldOfView / 85 * 0.006979571678725324 * l__smoothLerp__12(1, 0.8, v54.aimSpring.p);
	if not v54.freeLook then
		v54.angleY = v54.angleY - v157.X * v158;
		v54.angleX = math.clamp(v54.angleX - v157.Y * v158, -1.3962634015954636, 1.3962634015954636);
		v54.freeAimY = math.clamp(v54.freeAimY + v157.X * 0.0015, -0.030543261909900768, 0.07853981633974483);
		v54.freeAimX = math.clamp(v54.freeAimX + v157.Y * 0.00225, -0.017453292519943295, 0.05235987755982989);
	else
		v54.freeLookY = math.clamp(v54.freeLookY - v157.X * math.deg(v158), -100, 100);
		v54.freeLookX = math.clamp(v54.angleX + v54.freeLookX - v157.Y * math.deg(v158), -35, 65) - v54.angleX;
	end;
	v12:updateCmdWheel(p136);
end);
local v159 = {
	MouseButton1 = 1, 
	MouseButton2 = 2, 
	MouseButton3 = 3
};
local l__Keys__13 = v54.Keys;
l__UserInputService__29.InputBegan:Connect(function(p137, p138)
	if p138 then
		return;
	end;
	local v160 = true;
	if p137.UserInputType ~= Enum.UserInputType.MouseButton1 then
		v160 = true;
		if p137.UserInputType ~= Enum.UserInputType.MouseButton2 then
			v160 = p137.UserInputType == Enum.UserInputType.MouseButton3;
		end;
	end;
	if v160 then
		local v161 = p137.UserInputType.Name;
	else
		v161 = p137.KeyCode.Name;
	end;
	if v161 == v2.Keybinds.ChangeChatType and v54.team ~= 0 and v54.fireteam.FireteamID ~= 0 then
		v54:changeChatType(v54.chatType % 3 + 1);
	end;
	if not (not v54.dead) or not (not v54.incapped) or not v54.character then
		return;
	end;
	if not v160 then
		local v162 = p137.KeyCode.Value - 48;
		if v162 >= 0 and v162 <= 9 then
			v54:equip(v162);
		end;
	end;
	if v161 == v2.Keybinds.FireWeapon then
		l__Keys__13[v2.Keybinds.FireWeapon] = true;
		v54:setFire(true);
		return;
	end;
	if v161 == v2.Keybinds.AimDownSight then
		if v2.Keybinds.AimInput == "Hold" then
			l__Keys__13[v2.Keybinds.AimDownSight] = true;
		end;
		if (v2.Keybinds.AimInput == "Hold" or not v54.aiming) and v54.freeLook then
			v54.freeLook = false;
			v54.freeLookY = 0;
			v54.freeLookX = 0;
		end;
		if v2.Keybinds.AimInput == "Hold" then
			local v163 = true;
		else
			v163 = not v54.aiming;
		end;
		v54:setAim(v163);
		return;
	end;
	if v161 == v2.Keybinds.FTCommandWheel then
		v12:toggleCmdWheel(true);
		return;
	end;
	if not v54.reloading and v54.canViewRearmMenu and v161 == v2.Keybinds.ViewAmmoBag then
		v12:promptRadialMenuUse(v54.viewingRearmMenu);
		v12:showRadialMenu(not v54.viewingRearmMenu);
		return;
	end;
	if not v54.viewingRearmMenu then
		if v161 == v2.Keybinds.Sprint then
			l__Keys__13[v2.Keybinds.Sprint] = true;
			v54:setSprint(true);
			return;
		end;
		if v161 == v2.Keybinds.ToggleFreelook and not v54.aiming then
			v54.freeLook = true;
			return;
		end;
		if v161 == Enum.KeyCode.P then
			l__CurrentCamera__48.CameraType = "Scriptable";
			l__UserInputService__29.MouseBehavior = Enum.MouseBehavior.LockCenter or Enum.MouseBehavior.Default;
			return;
		end;
		if v161 == v2.Keybinds.ChangeFiremode then
			if not v54.glActive then
				v54:nextFiremode();
				return;
			end;
		else
			if v161 == v2.Keybinds.Reload then
				v54:reload();
				return;
			end;
			if v161 == v2.Keybinds.ToggleNightVision then
				v54:toggleNightVision(not v54.nightvision, v2.gameSettings.NightVisionDoF);
				return;
			end;
			if v161 == v2.Keybinds.ToggleLaser then
				v54:setLaser(not v54.laser);
				return;
			end;
			if v161 == v2.Keybinds.ToggleFlashlight then
				v54:setFlashlight(not v54.flashlight);
				return;
			end;
			if v161 == v2.Keybinds.SwitchSights then
				v54:toggleAltAim();
				v54:toggleMagnifier();
				return;
			end;
			if v161 == v2.Keybinds.TacPace then
				v54:setTacPace(not v54.tacticalPacing);
				return;
			end;
			if v161 == v2.Keybinds.ViewMap then
				v54.mapHandler:showMap(not v54.mapShown);
				return;
			end;
			if v161 == v2.Keybinds.Interact then
				l__Keys__13[v2.Keybinds.Interact] = true;
				v54:holdingBCheck(true);
				if v54.class.Role == "Medic" or v54.class.Role == "Corpsman" then
					v54:attemptRevive();
					return;
				end;
			else
				if v161 == v2.Keybinds.LowerStance then
					if v54.stance == 0 then
						v54:setSprint(false);
					end;
					v54:setStance(math.clamp(v54.stance + 1, 0, 2));
					return;
				end;
				if v161 == v2.Keybinds.RaiseStance then
					v54:setStance(math.clamp(v54.stance - 1, 0, 2));
					if v54.stance == 0 and l__Keys__13[v2.Keybinds.Sprint] then
						v54:setSprint(true);
						return;
					end;
				else
					if v161 == v2.Keybinds.LeanL then
						if v2.Keybinds.LeanInput == "Hold" then
							v54:setLean(-1);
							l__Keys__13[v2.Keybinds.LeanL] = true;
							return;
						else
							if v54.leanSpring.t ~= -1 then
								local v164 = -1;
							else
								v164 = 0;
							end;
							v54:setLean(v164);
							return;
						end;
					end;
					if v161 == v2.Keybinds.LeanR then
						if v2.Keybinds.LeanInput == "Hold" then
							v54:setLean(1);
							l__Keys__13[v2.Keybinds.LeanR] = true;
							return;
						else
							if v54.leanSpring.t ~= 1 then
								local v165 = 1;
							else
								v165 = 0;
							end;
							v54:setLean(v165);
							return;
						end;
					elseif v161 == v2.Keybinds.ToggleGrenadeLauncher then
						v54:setGLActive(not v54.glActive);
					end;
				end;
			end;
		end;
	end;
end);
l__UserInputService__29.InputEnded:Connect(function(p139)
	if not (not v54.dead) or not (not v54.incapped) or not v54.character then
		return;
	end;
	local v166 = true;
	if p139.UserInputType ~= Enum.UserInputType.MouseButton1 then
		v166 = true;
		if p139.UserInputType ~= Enum.UserInputType.MouseButton2 then
			v166 = p139.UserInputType == Enum.UserInputType.MouseButton3;
		end;
	end;
	if v166 then
		local v167 = p139.UserInputType.Name;
	else
		v167 = p139.KeyCode.Name;
	end;
	if v167 == v2.Keybinds.FireWeapon then
		l__Keys__13[v2.Keybinds.FireWeapon] = false;
		v54:setFire(false);
		return;
	end;
	if v167 == v2.Keybinds.AimDownSight and v2.Keybinds.AimInput == "Hold" then
		l__Keys__13[v2.Keybinds.AimDownSight] = false;
		v54:setAim(false);
		return;
	end;
	if v167 == v2.Keybinds.FTCommandWheel then
		v12:toggleCmdWheel(false);
		v12:MakeMouseVisible(false);
		return;
	end;
	if v167 == v2.Keybinds.Sprint then
		l__Keys__13[v2.Keybinds.Sprint] = false;
		v54:setSprint(false);
		return;
	end;
	if v167 == v2.Keybinds.ToggleFreelook then
		v54.freeLook = false;
		v54.freeLookY = 0;
		v54.freeLookX = 0;
		return;
	end;
	if v167 == v2.Keybinds.LeanL and v2.Keybinds.LeanInput == "Hold" then
		l__Keys__13[v2.Keybinds.LeanL] = false;
		if not l__Keys__13[v2.Keybinds.LeanR] then
			v54:setLean(0);
			return;
		else
			v54:setLean(1);
			return;
		end;
	end;
	if v167 ~= v2.Keybinds.LeanR or v2.Keybinds.LeanInput ~= "Hold" then
		if v167 == v2.Keybinds.Interact then
			l__Keys__13[v2.Keybinds.Interact] = false;
			v54:holdingBCheck(false);
		end;
		return;
	end;
	l__Keys__13[v2.Keybinds.LeanR] = false;
	if not l__Keys__13[v2.Keybinds.LeanL] then
		v54:setLean(0);
		return;
	end;
	v54:setLean(-1);
end);
l__Events__45.GetSettingData.OnClientEvent:Connect(function(p140)
	if not p140 then
		return nil;
	end;
	v2.Keybinds = p140.keybindTable;
	v2.gameSettings = p140.gsetTable;
	v13:updateKeybindText();
	v13:updateSettingsText();
	v54:updateGraphicSettings(v2.gameSettings);
end);
local v168 = Instance.new("BindableEvent");
v168.Event:Connect(function()
	v54:reset();
end);
(function(p141, ...)
	local v169 = nil;
	local v170 = {};
	for v171 = 1, 8 do
		v169 = { pcall(l__StarterGui__27[p141], l__StarterGui__27, ...) };
		if v169[1] then
			break;
		end;
		l__RunService__1.Stepped:Wait();
	end;
	return unpack(v169);
end)("SetCore", "ResetButtonCallback", v168);
l__RunService__1:BindToRenderStep("MainLoop", 0, function(p142)
	v54:update(os.clock(), p142, true);
	u4 = l__CurrentCamera__48.CFrame.Position;
	u10 = l__CurrentCamera__48.FieldOfView;
	u5 = 85 / u10;
	u11 = l__CurrentCamera__48.ViewportSize;
	u7 = u11.X + 100;
	u8 = u11.Y + 100;
	u6 = l__CurrentCamera__48.CFrame.LookVector * Vector3.new(1, 2, 1);
end);
l__RunService__1.Stepped:Connect(function(p143, p144)
	v46(os.clock(), p144);
end);
if not l__RunService__1:IsStudio() then
	l__RunService__1.Stepped:Connect(function()
		local v172, v173, v174 = l__ScriptContext__28.Error:Wait();
		if not v174 and v173 and v173 ~= "" then
			print("Forgien Error Detected");
			wait(3);
			l__LocalPlayer__30:Kick("Kicked for exploiting");
		end;
	end);
end;
local v175 = v17.new(v54);
l__RunService__1.Heartbeat:Connect(function(p145)
	v10:update();
end);
l__RunService__1.Heartbeat:Connect(function()
	v7:update();
end);
l__RunService__1.Heartbeat:Connect(function(p146)
	v8:update(p146, v54);
end);
l__RunService__1.Heartbeat:Connect(function(p147)
	v12:update(p147);
end);
l__RunService__1.Heartbeat:Connect(function()
	v175:update();
end);
workspace.CurrentCamera:GetPropertyChangedSignal("ViewportSize"):Connect(function()
	v12:setScreenCenter();
end);
local u14 = l__LocalPlayer__30.Character;
l__LocalPlayer__30.CharacterAdded:Connect(function(p148)
	u14 = p148;
end);
v10:connectReceiveEvent("GetBuildables", function(...)
	for v176, v177 in pairs({ ... }) do
		v69(unpack(v177));
	end;
end);
v10:connectReceiveEvent("GetFireteams", function(...)
	local v178 = { ... };
	for v179 = 1, #v178, 2 do
		v89(v178[v179], v178[v179 + 1]);
	end;
	for v180, v181 in pairs(v18) do
		v181:setFireteam(v181.fireteamID);
	end;
end);
v10:connectReceiveEvent("SpawnPlayer", function(p149)
	local v182 = v18[p149];
	if v182 then
		v182:spawn();
		if v182.isMain then
			v13:spawn();
			l__CurrentCamera__48.CameraType = "Scriptable";
			l__UserInputService__29.MouseBehavior = Enum.MouseBehavior.LockCenter;
		end;
	end;
end);
local function v183(p150, p151, p152)
	local v184, v185, v186, v187, v188, v189, v190, v191, v192, v193, v194, v195, v196, v197, v198, v199, v200, v201, v202, v203, v204, v205, v206, v207, v208, v209, v210, v211 = string.unpack("sI1I1I1I1I1I1I1I1I1I1I1I1I1I1i1i2i2i2i3i3i3i3i3i3si2i2", p150);
	local v212 = v18[v184];
	if v212 then
		local v213 = Vector3.new(v203, v204, v205) / 1000;
		local v214 = Vector3.new(v206, v207, v208) / 1000;
		v212:loadPlayer(p151, v185, v186, v187, v188, v189, v190, v191, v192, v193, v194, v195, v196, v197, v198, v199, v200, v201, v202 / 1000, v213, v214, v209, v210 / 1000, v211 / 1000, p152);
		if v212.isMain then
			v10:updateSendData("AngleX", v202);
			v10:updateSendData("FreeLookX", v210);
			v10:updateSendData("FreeLookY", v211);
			v10:updateSendData("Stance", v185);
			v10:updateSendData("Aim", v186);
			v10:updateSendData("Sprint", v187);
			v10:updateSendData("TacPace", v188);
			v10:updateSendData("Equip", v189);
			v10:updateSendData("Lean", v199);
			v10:updateSendData("Cover", v190);
			v10:updateSendData("FireMode", v191);
			v10:updateSendData("Laser", v192 == 1);
			v10:updateSendData("LaserPosition", v213);
			v10:updateSendData("Flashlight", v193 == 1);
			v10:updateSendData("FlashlightPosition", v214);
			v10:updateSendData("NV", v194 == 1);
			v10:updateSendData("SetGL", v195 == 1);
			v10:updateSendData("Health", v200);
			v10:updateSendData("BleedoutTimer", v201);
			v10:updateSendData("Incapped", v196 == 1);
			v10:updateSendData("Dead", v197 == 1);
			v10:updateSendData("Fire", v198 == 1);
			v10:updateSendData("WalkingSpeed", v209);
		end;
	end;
	v13:UIupdateTeams();
end;
v10:connectReceiveEvent("LoadCharacter", v183);
v10:connectReceiveEvent("GetCharacters", function(...)
	local v215 = { ... };
	for v216 = 1, #v215, 2 do
		v183(v215[v216], v215[v216 + 1], true);
	end;
end);
for v217, v218 in pairs(l__Players__26:GetChildren()) do
	v55(v218);
end;
for v219, v220 in pairs(workspace.Players:GetChildren()) do
	v55(v220);
end;
l__Players__26.PlayerAdded:Connect(function(p153)
	v55(p153);
end);
l__LoadingAssetType__35.Text = "LOADING SERVER DATA";
l__Events__45.PlayerLoaded:FireServer();
l__CurrentCamera__48.CameraType = "Custom";
l__UserInputService__29.MouseBehavior = Enum.MouseBehavior.Default;
task.wait(4);
l__LoadingScreen__31:Destroy();
l__CurrentCamera__48.CameraType = "Custom";
l__UserInputService__29.MouseBehavior = Enum.MouseBehavior.Default;
