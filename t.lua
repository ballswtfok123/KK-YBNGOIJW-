-- Decompiled with the Synapse X Luau decompiler.

local u1 = nil;
local l__LocalizationService__1 = game:GetService("LocalizationService");
local l__TweenService__2 = game:GetService("TweenService");
local l__CollectionService__3 = game:GetService("CollectionService");
local l__ContextActionService__4 = game:GetService("ContextActionService");
local l__MarketplaceService__5 = game:GetService("MarketplaceService");
local l__ReplicatedStorage__6 = game:GetService("ReplicatedStorage");
local l__GuiService__7 = game:GetService("GuiService");
local l__StarterGui__8 = game:GetService("StarterGui");
local l__UserInputService__9 = game:GetService("UserInputService");
local l__TeleportService__10 = game:GetService("TeleportService");
local l__Workspace__11 = game:GetService("Workspace");
local l__Chat__12 = game:GetService("Chat");
local l__Players__13 = game:GetService("Players");
local l__RunService__14 = game:GetService("RunService");
local l__Variables__15 = script.Variables;
amby = script.Parent.Ambassador;
while true do
	wait();
	if l__Players__13.LocalPlayer then
		break;
	end;
end;
Player = l__Players__13.LocalPlayer;
Player:WaitForChild("Status");
Player:WaitForChild("Settings"):WaitForChild("TwentiesFilter");
Player:WaitForChild("Settings"):WaitForChild("FOV");
l__ReplicatedStorage__6:WaitForChild("wkspc");
wkspc = l__ReplicatedStorage__6.wkspc;
sP = script.Parent;
hitparte = l__ReplicatedStorage__6.Events.HitPart;
teamsmod = require(game.ReplicatedStorage.Modules.Teams);
Player.ChildAdded:connect(function(p1)
	if p1.Name ~= "IsBernard" then
		if p1.Name == "HasCannonball" then
			spawn(function()
				wep.autoequip();
			end);
		end;
		return;
	end;
	script.Parent.Interface.Monk.Mankey:Play();
	script.Parent.Interface.Bernie.Visible = true;
	script.Parent.Interface.Monk.Visible = true;
	spawn(function()
		wep.autoequip();
	end);
	wait(2.5);
	script.Parent.Interface.Monk.Visible = false;
end);
Player.ChildRemoved:connect(function(p2)
	if p2.Name == "IsBernard" then
		script.Parent.Interface.Bernie.Visible = false;
	end;
end);
gmv = require(Player:WaitForChild("PlayerScripts"):WaitForChild("ControlScript").MasterControl);
clientf = require(l__ReplicatedStorage__6.Modules.ClientFunctions);
viewpunch = require(l__ReplicatedStorage__6.SCRIPT.ViewPunch);
Subtitles = require(l__ReplicatedStorage__6.Modules.Subtitles);
soundmod = require(l__ReplicatedStorage__6.Modules.Sound);
Ping = require(l__ReplicatedStorage__6.Modules.ping);
modevariables = require(l__ReplicatedStorage__6.Modules.ModeVariables);
flamemoment = require(game.ReplicatedStorage.Modules.FlameDeez);
mice = require(game.ReplicatedStorage.Modules.NewMouse);
_gf = require(l__ReplicatedStorage__6.GeneralFunctions);
teamcheck = require(l__ReplicatedStorage__6.Modules.TeamCheck);
wep = require(script.Functions.Weapons);
gen = require(script.Functions.General);
vmhandler = require(script.Functions.VMHandler);
Animations = {};
stepmod = {};
stepmodnd = {};
local v16 = script.StepModules:GetChildren();
for v17 = 1, #v16 do
	if v16[v17]:IsA("ModuleScript") then
		table.insert(stepmod, { require(v16[v17]), v16[v17].Name });
	end;
end;
local v18 = script.StepModulesNoDeath:GetChildren();
for v19 = 1, #v18 do
	if v18[v19]:IsA("ModuleScript") then
		table.insert(stepmodnd, { require(v18[v19]), v18[v19].Name });
	end;
end;
Camera = game.Workspace.CurrentCamera;
camera = Camera;
player = Player;
hts = l__ReplicatedStorage__6.wkspc.TimeScale;
oldhts = hts.Value;
bruh = Player.Settings.FOV;
l__Variables__15.defaultfov.Value = bruh.Value;
gui = script.Parent;
sP = gui;
mouse = Player:GetMouse();
ammobar = gui.Interface:WaitForChild("Vitals"):WaitForChild("Ammo");
hpbar = gui.Interface:WaitForChild("Vitals");
active = l__Variables__15.active;
disarmed = l__Variables__15.disarmed;
ctrlcrouch = l__Variables__15.ctrlcrouch;
lastwtdtick = tick();
gunrand = 0;
look = 0;
lastlook = 0;
look2 = 0;
lastlook2 = 0;
direction = l__Variables__15.direction;
animtype = "Default";
menudeb = false;
numero = l__Variables__15.numero;
storedWendy = l__Variables__15.primary.Value;
reviveme = false;
fdebounce = true;
endPosition = l__Variables__15.endPosition;
hammerunit2stud = 0.07;
minHeightToDamage = 300 * hammerunit2stud;
finger = false;
spawned = false;
tpData = l__TeleportService__10:GetLocalPlayerTeleportData();
preparation = wkspc.Status:WaitForChild("Preparation");
showme = l__Variables__15.showme;
alt = 1;
announcer = sP.Parent.Announcer;
partnert = l__Variables__15.partnert;
ftauntend = l__Variables__15.ftauntend;
clicksou = sP.Parent:WaitForChild("Menew").LocalScript.Click;
primarymode = l__Variables__15.primarymode;
primarygrenades = l__Variables__15.primarygrenades;
storedgrenades = l__Variables__15.storedgrenades;
overheat = l__Variables__15.overheat;
ohtick = l__Variables__15.ohtick;
olevel = Player.Status.Level.Value;
ischad = false;
tweenInfo = TweenInfo.new(0.25, Enum.EasingStyle.Sine, Enum.EasingDirection.In, 0, false, 0);
menew = sP.Parent.Menew;
w = false;
s = false;
a = false;
d = false;
equipallowed = l__Variables__15.equipallowed;
ads = l__Variables__15.ads;
gun = l__Variables__15.gun;
equipped = l__Variables__15.equipped;
ammocount = l__Variables__15.ammocount;
primarystored = l__Variables__15.primarystored;
secondarystored = l__Variables__15.secondarystored;
ammocount2 = l__Variables__15.ammocount2;
prevTool = l__Variables__15.prevTool;
currentTool = l__Variables__15.currentTool;
currentnum = l__Variables__15.currentnum;
died = l__Variables__15.died;
specmode = l__Variables__15.specmode;
currentplayer = l__Variables__15.currentplayer;
istouch = l__Variables__15.istouch;
airjumps = l__Variables__15.airjumps;
reloading = l__Variables__15.reloading;
inventorydebounce = l__Variables__15.inventorydebounce;
rstick = l__Variables__15.rstick;
superpower = l__Variables__15.superpower;
primary = l__Variables__15.primary;
secondary = l__Variables__15.secondary;
melee = l__Variables__15.melee;
taunting = l__Variables__15.taunting;
tauntend = l__Variables__15.tauntend;
selected = l__Variables__15.selected;
Held2 = l__Variables__15.Held2;
Held = l__Variables__15.Held;
jumping = l__Variables__15.jumping;
selectedtaunt = l__Variables__15.selectedtaunt;
if Camera:FindFirstChild("Debris") then
	Camera.Debris:Destroy();
end;
local v20 = Instance.new("Folder");
v20.Parent = Camera;
v20.Name = "Debris";
if Camera:FindFirstChild("GUI") then
	Camera.GUI:Destroy();
end;
local v21 = Instance.new("Folder");
v21.Parent = Camera;
v21.Name = "GUI";
if camera:FindFirstChild("BBGuis") then
	camera.BBGuis:Destroy();
end;
local v22 = Instance.new("Folder");
v22.Parent = camera;
v22.Name = "BBGuis";
if script:FindFirstChild("Desaturation") then
	script.Desaturation.Parent = game.Lighting;
end;
l__StarterGui__8:SetCore("TopbarEnabled", false);
function desat()
	if l__ReplicatedStorage__6.wkspc.FFA.Value == true then
		if Player:FindFirstChild("Settings") then
			if Player.Settings.TwentiesFilter.Value then

			end;
		end;
	end;
	game.Lighting.Desaturation.Saturation = 0;
end;
desat();
player.Settings.TwentiesFilter.Changed:connect(desat);
l__ReplicatedStorage__6.wkspc.FFA.Changed:connect(desat);
function GetMoveVector2()
	return gmv:GetMoveVector();
end;
hts.Changed:connect(function()
	wait();
	if player and player.Character and player.Character.PrimaryPart then
		player.Character.PrimaryPart.Velocity = player.Character.PrimaryPart.Velocity * hts.Value / oldhts;
	end;
	oldhts = hts.Value;
end);
script.Parent:GetPropertyChangedSignal("Enabled"):connect(function()
	if script.Parent.Enabled == true then
		l__Workspace__11.CurrentCamera.FieldOfView = 70;
	end;
end);
l__Workspace__11.Debris.ChildAdded:connect(function(p3)
	wait();
	if p3.Name == "Star" and p3.Team.Value ~= Player.Status.Team.Value then
		p3.BrickColor = BrickColor.new("White");
	end;
end);
Player.PlayerGui:WaitForChild("Announcer");
while true do
	l__RunService__14.RenderStepped:wait();
	if Player and Player:FindFirstChild("Initial") then
		break;
	end;
end;
function getColorForSubtitle()
	local l__Value__23 = Player.Status.Team.Value;
	return teamsmod.colors[l__Value__23] and teamsmod.colors[l__Value__23][3] or Color3.fromRGB(255, 255, 255);
end;
function playannouncer(p4)
	if player.Settings.Announcer.Value then
		if wkspc.gametype.Value ~= "Bombfest" then
			if Player.PlayerGui.Announcer:FindFirstChild("Sound") then
				Player.PlayerGui.Announcer.Sound:Stop();
				Player.PlayerGui.Announcer.Sound:Destroy();
			end;
			local v24 = p4:GetChildren()[math.random(1, #p4:GetChildren())];
			local v25 = Instance.new("Sound");
			v25.SoundId = v24.Value;
			if p4.Parent:FindFirstChild("Volume") then
				v25.Volume = p4.Parent.Volume.Value;
			end;
			if p4.Parent:FindFirstChild("Radio") then
				v25.SoundGroup = game.SoundService.Radio;
			elseif p4.Parent:FindFirstChild("Radio2") then
				v25.SoundGroup = game.SoundService.Radio2;
			end;
			v25.Parent = Player.PlayerGui.Announcer;
			v25:Play();
			while true do
				wait();
				if v25.IsLoaded ~= true then

				else
					break;
				end;			
			end;
			while true do
				wait();
				if v25.IsPlaying ~= true then

				else
					break;
				end;			
			end;
			wait();
			wait();
			if player.Settings.Subtitles.Value then
				if v24:FindFirstChild("Sub") then
					Subtitles.NewSubtitle(v24.Sub.Value, v25.TimeLength, (getColorForSubtitle()));
				end;
			end;
			spawn(function()
				wait(v25.TimeLength);
				v25:Destroy();
			end);
		end;
	end;
end;
l__ReplicatedStorage__6.Events:WaitForChild("GetPing");
l__ReplicatedStorage__6.Events.GetPing.OnClientInvoke = function()

end;
l__ReplicatedStorage__6.Functions:WaitForChild("Shucky");
l__ReplicatedStorage__6.Functions.Shucky.OnClientInvoke = function()
	return #l__Workspace__11.Map.Geometry:GetChildren() + #l__Workspace__11.Map.Clips:GetChildren();
end;
bruh.Changed:connect(function()
	l__Variables__15.defaultfov.Value = bruh.Value;
end);
Player:WaitForChild("Status").Team.Changed:connect(function()
	deployed = false;
end);
function dotaunt2(p5)
	if p5 == "Sizzle" then
		l__ReplicatedStorage__6.Events.Sizzle:FireServer();
	end;
end;
function loadtaunt(p6, p7, p8)
	selectedtaunt.Value = l__ReplicatedStorage__6.Taunts[p8];
	if Animations.tidle2 then
		Animations.tidle2:Stop();
	end;
	if selectedtaunt.Value then
		numero.Value = "";
		if Animations.twalk then
			Animations.twalk:Stop();
		end;
		if not selectedtaunt.Value:FindFirstChild("Taunt") then
			if selectedtaunt.Value:FindFirstChild("Taunt1") then
				Animations.tidle = nil;
				Animations.tidle2 = nil;
				Animations.tstart = nil;
				Animations.tjam1 = nil;
				Animations.tjam2 = nil;
				Animations.tjam3 = nil;
				Animations.tstrumhigh = nil;
				Animations.tstrummed = nil;
				Animations.tstrumlow = nil;
				local v26 = 1 - 1;
				while true do
					Animations[tostring(v26)] = nil;
					if 0 <= 1 then
						if v26 < 9 then

						else
							break;
						end;
					elseif 9 < v26 then

					else
						break;
					end;
					v26 = v26 + 1;				
				end;
				local v27 = 1 - 1;
				while true do
					Animations["taction" .. v27] = nil;
					if 0 <= 1 then
						if v27 < 4 then

						else
							break;
						end;
					elseif 4 < v27 then

					else
						break;
					end;
					v27 = v27 + 1;				
				end;
				local v28 = 1 - 1;
				while true do
					Animations["action" .. v28] = nil;
					if 0 <= 1 then
						if v28 < 4 then

						else
							break;
						end;
					elseif 4 < v28 then

					else
						break;
					end;
					v28 = v28 + 1;				
				end;
				if selectedtaunt.Value:FindFirstChild("Taunt1") then
					numero.Value = tostring(math.random(1, 4));
					Animations.taction = p7.Animator:LoadAnimation(selectedtaunt.Value["Taunt" .. numero.Value]);
				elseif selectedtaunt.Value:FindFirstChild("action1") then
					local v29 = 1 - 1;
					while true do
						Animations["action" .. v29] = p7.Animator:LoadAnimation(selectedtaunt.Value["action" .. v29]);
						if 0 <= 1 then
							if v29 < 4 then

							else
								break;
							end;
						elseif 4 < v29 then

						else
							break;
						end;
						v29 = v29 + 1;					
					end;
				else
					Animations.taction = p7.Animator:LoadAnimation(selectedtaunt.Value.Taunt);
				end;
				Animations.tend = nil;
				Animations.twalk = nil;
				Animations.twalk2 = nil;
				if selectedtaunt.Value:FindFirstChild("walk") then
					Animations.twalk = p7.Animator:LoadAnimation(selectedtaunt.Value.walk);
				end;
				if selectedtaunt.Value:FindFirstChild("bwalk") then
					Animations.twalk2 = p7.Animator:LoadAnimation(selectedtaunt.Value.bwalk);
				end;
			else
				Animations.tjam1 = nil;
				Animations.tjam2 = nil;
				Animations.tjam3 = nil;
				Animations.tstrumhigh = nil;
				Animations.tstrummed = nil;
				Animations.tstrumlow = nil;
				local v30 = 1 - 1;
				while true do
					Animations[tostring(v30)] = nil;
					if 0 <= 1 then
						if v30 < 9 then

						else
							break;
						end;
					elseif 9 < v30 then

					else
						break;
					end;
					v30 = v30 + 1;				
				end;
				Animations.tidle = p7.Animator:LoadAnimation(selectedtaunt.Value.idle);
				Animations.tidle2 = nil;
				local v31 = 1 - 1;
				while true do
					Animations["taction" .. v31] = nil;
					if 0 <= 1 then
						if v31 < 4 then

						else
							break;
						end;
					elseif 4 < v31 then

					else
						break;
					end;
					v31 = v31 + 1;				
				end;
				local v32 = 1 - 1;
				while true do
					Animations["action" .. v32] = nil;
					if 0 <= 1 then
						if v32 < 4 then

						else
							break;
						end;
					elseif 4 < v32 then

					else
						break;
					end;
					v32 = v32 + 1;				
				end;
				if selectedtaunt.Value:FindFirstChild("idle2") then
					Animations.tidle2 = p7.Animator:LoadAnimation(selectedtaunt.Value.idle2);
				end;
				Animations.tstart = p7.Animator:LoadAnimation(selectedtaunt.Value.start);
				Animations.taction = p7.Animator:LoadAnimation(selectedtaunt.Value.action);
				if selectedtaunt.Value:FindFirstChild("action1") then
					local v33 = 1 - 1;
					while true do
						Animations["taction" .. v33] = p7.Animator:LoadAnimation(selectedtaunt.Value["action" .. v33]);
						if 0 <= 1 then
							if v33 < 4 then

							else
								break;
							end;
						elseif 4 < v33 then

						else
							break;
						end;
						v33 = v33 + 1;					
					end;
				end;
				Animations.tend = p7.Animator:LoadAnimation(selectedtaunt.Value["end"]);
				Animations.twalk = nil;
				Animations.twalk2 = nil;
				if selectedtaunt.Value:FindFirstChild("bwalk") then
					Animations.twalk2 = p7.Animator:LoadAnimation(selectedtaunt.Value.bwalk);
				end;
				if selectedtaunt.Value:FindFirstChild("walk") then
					Animations.twalk = p7.Animator:LoadAnimation(selectedtaunt.Value.walk);
				end;
				if selectedtaunt.Value:FindFirstChild("jam1") then
					Animations.tjam1 = p7.Animator:LoadAnimation(selectedtaunt.Value.jam1);
					Animations.tjam2 = p7.Animator:LoadAnimation(selectedtaunt.Value.jam2);
					Animations.tjam3 = p7.Animator:LoadAnimation(selectedtaunt.Value.jam3);
					Animations.tstrumhigh = p7.Animator:LoadAnimation(selectedtaunt.Value.strumhigh);
					Animations.tstrummed = p7.Animator:LoadAnimation(selectedtaunt.Value.strummed);
					Animations.tstrumlow = p7.Animator:LoadAnimation(selectedtaunt.Value.strumlow);
				end;
				if selectedtaunt.Value:FindFirstChild("1") then
					local v34 = 1 - 1;
					while true do
						Animations[tostring(v34)] = p7.Animator:LoadAnimation(selectedtaunt.Value[tostring(v34)]);
						if 0 <= 1 then
							if v34 < 9 then

							else
								break;
							end;
						elseif 9 < v34 then

						else
							break;
						end;
						v34 = v34 + 1;					
					end;
				end;
			end;
		else
			Animations.tidle = nil;
			Animations.tidle2 = nil;
			Animations.tstart = nil;
			Animations.tjam1 = nil;
			Animations.tjam2 = nil;
			Animations.tjam3 = nil;
			Animations.tstrumhigh = nil;
			Animations.tstrummed = nil;
			Animations.tstrumlow = nil;
			v26 = 1 - 1;
			while true do
				Animations[tostring(v26)] = nil;
				if 0 <= 1 then
					if v26 < 9 then

					else
						break;
					end;
				elseif 9 < v26 then

				else
					break;
				end;
				v26 = v26 + 1;			
			end;
			v27 = 1 - 1;
			while true do
				Animations["taction" .. v27] = nil;
				if 0 <= 1 then
					if v27 < 4 then

					else
						break;
					end;
				elseif 4 < v27 then

				else
					break;
				end;
				v27 = v27 + 1;			
			end;
			v28 = 1 - 1;
			while true do
				Animations["action" .. v28] = nil;
				if 0 <= 1 then
					if v28 < 4 then

					else
						break;
					end;
				elseif 4 < v28 then

				else
					break;
				end;
				v28 = v28 + 1;			
			end;
			if selectedtaunt.Value:FindFirstChild("Taunt1") then
				numero.Value = tostring(math.random(1, 4));
				Animations.taction = p7.Animator:LoadAnimation(selectedtaunt.Value["Taunt" .. numero.Value]);
			elseif selectedtaunt.Value:FindFirstChild("action1") then
				v29 = 1 - 1;
				while true do
					Animations["action" .. v29] = p7.Animator:LoadAnimation(selectedtaunt.Value["action" .. v29]);
					if 0 <= 1 then
						if v29 < 4 then

						else
							break;
						end;
					elseif 4 < v29 then

					else
						break;
					end;
					v29 = v29 + 1;				
				end;
			else
				Animations.taction = p7.Animator:LoadAnimation(selectedtaunt.Value.Taunt);
			end;
			Animations.tend = nil;
			Animations.twalk = nil;
			Animations.twalk2 = nil;
			if selectedtaunt.Value:FindFirstChild("walk") then
				Animations.twalk = p7.Animator:LoadAnimation(selectedtaunt.Value.walk);
			end;
			if selectedtaunt.Value:FindFirstChild("bwalk") then
				Animations.twalk2 = p7.Animator:LoadAnimation(selectedtaunt.Value.bwalk);
			end;
		end;
		if Animations.tidle then
			Animations.tidle.KeyframeReached:connect(function(p9)
				if l__RunService__14:IsStudio() then
					print("tidle: " .. p9);
				end;
				dotaunt2(p9);
				if p6 then
					if p6:FindFirstChild("Gear") then
						if p6.Gear:FindFirstChild(p9) then
							soundmod.rplaysound(p6.Gear[p9]);
						end;
					end;
				end;
				if p6 then
					if p6:FindFirstChild("Gear") then
						if p6.Gear:FindFirstChild(p9 .. "1") then
							soundmod.rplaysound(p6.Gear[p9 .. math.random(1, 5)]);
						end;
					end;
				end;
			end);
		end;
		if Animations.tend then
			Animations.tend.KeyframeReached:connect(function(p10)
				if l__RunService__14:IsStudio() then
					print("tend: " .. p10);
				end;
				dotaunt2(p10);
				if p10 ~= "Transparent" then
					if p10 == "FadeOut" then
						if p6 then
							if p6:FindFirstChild("Gear") then
								if p6.Gear:FindFirstChild("Sip") == nil then
									p6.Gear.Transparency = 1;
									local v35 = p6.Gear:GetDescendants();
									local v36 = #v35;
									local v37 = 1 - 1;
									while true do
										if v35[v37]:IsA("BasePart") then
											v35[v37].Transparency = 1;
										end;
										if 0 <= 1 then
											if v37 < v36 then

											else
												break;
											end;
										elseif v36 < v37 then

										else
											break;
										end;
										v37 = v37 + 1;									
									end;
									l__ReplicatedStorage__6.Events.GearRemoval:FireServer();
								end;
							end;
						end;
					end;
				elseif p6 then
					if p6:FindFirstChild("Gear") then
						if p6.Gear:FindFirstChild("Sip") == nil then
							p6.Gear.Transparency = 1;
							v35 = p6.Gear:GetDescendants();
							v36 = #v35;
							v37 = 1 - 1;
							while true do
								if v35[v37]:IsA("BasePart") then
									v35[v37].Transparency = 1;
								end;
								if 0 <= 1 then
									if v37 < v36 then

									else
										break;
									end;
								elseif v36 < v37 then

								else
									break;
								end;
								v37 = v37 + 1;							
							end;
							l__ReplicatedStorage__6.Events.GearRemoval:FireServer();
						end;
					end;
				end;
				if p6 then
					if p6:FindFirstChild("Gear") then
						if p6.Gear:FindFirstChild(p10) then
							soundmod.rplaysound(p6.Gear[p10]);
						end;
					end;
				end;
				if p6 then
					if p6:FindFirstChild("Gear") then
						if p6.Gear:FindFirstChild(p10 .. "1") then
							soundmod.rplaysound(p6.Gear[p10 .. math.random(1, 5)]);
						end;
					end;
				end;
				if p10 == "Release" then
					if p6 then
						if p6:FindFirstChild("Gear") then
							p6.Gear.Transparency = 1;
							l__ReplicatedStorage__6.Events.Debris:FireServer();
						end;
					end;
				end;
			end);
		end;
		if Animations.tstart then
			Animations.tstart.KeyframeReached:connect(function(p11)
				if l__RunService__14:IsStudio() then
					print("tstart: " .. p11);
				end;
				dotaunt2(p11);
				local v38 = p6:FindFirstChild("Female") ~= nil;
				if p11 == "Sing" then
					if v38 then
						local v39 = "F";
					else
						v39 = "";
					end;
					soundmod.rplaysound(p6.Gear.BookPivot["Song" .. v39]);
					return;
				end;
				if p6 then
					if p6:FindFirstChild("Gear") then
						if p6.Gear:FindFirstChild(p11) then
							soundmod.rplaysound(p6.Gear[p11]);
						end;
					end;
				end;
				if p6 then
					if p6:FindFirstChild("Gear") then
						if p6.Gear:FindFirstChild(p11 .. "1") then
							soundmod.rplaysound(p6.Gear[p11 .. math.random(1, 5)]);
						end;
					end;
				end;
			end);
		end;
		Animations.taction.KeyframeReached:connect(function(p12)
			if l__RunService__14:IsStudio() then
				print("taction: " .. p12);
			end;
			gen.treataction(p12);
		end);
		if Animations.taction1 then
			local v40 = 1 - 1;
			while true do
				local u2 = v40;
				Animations["taction" .. v40].KeyframeReached:connect(function(p13)
					if l__RunService__14:IsStudio() then
						print("action" .. u2 .. ": " .. p13);
					end;
					gen.treataction(p13);
				end);
				if 0 <= 1 then
					if u2 < 4 then

					else
						break;
					end;
				elseif 4 < u2 then

				else
					break;
				end;
				u2 = u2 + 1;			
			end;
		end;
	end;
end;
function owie(p14)
	if p14:FindFirstChild("Head") then
		if p14.Head:FindFirstChild("Voice") then
			if p14:FindFirstChild("ShuckyHAX") == nil then
				local v41 = "Hurt";
				if game.ReplicatedFirst.Voices[clientf.calcclass(p14)]:FindFirstChild("Pain") then
					v41 = "Pain";
				end;
				local v42 = game.ReplicatedFirst.Voices[clientf.calcclass(p14)][v41]:GetChildren();
				l__ReplicatedStorage__6.Events.PlayVoice:FireServer(p14.Head.Voice, v42[math.random(1, #v42)]);
			end;
		end;
	end;
end;
local v43 = Instance.new("NumberValue");
v43.Value = -2100000000;
local u3 = {
	["Collector Sparkle"] = "Bronze", 
	["Collector Shine"] = "Silver", 
	["Collector Aura"] = "Gold"
};
local function u4(p15, p16)
	p16.OffsetStudsV = -(p15.Size.Y + (p15.Position.Y - p15.Size.Y / 2) % p16.StudsPerTileV);
	p16.OffsetStudsU = p15.Position.Z - p15.Size.Z / 2 % p16.StudsPerTileU;
end;
local function u5(p17)
	if player and player.Character and (player.Character:FindFirstChild("HumanoidRootPart") and gun.Value and gun.Value.Parent and (l__Workspace__11.CurrentCamera.CFrame.p - p17.CFrame.p).magnitude <= 25) then
		return true;
	end;
	return false;
end;
function mapSkin(p18, p19, p20)
	local v44 = _gf.split(p19, "_");
	local v45 = v44[1];
	local v46 = v44[2];
	local l__Real__47 = p18:FindFirstChild("Real");
	local v48 = l__Real__47 and l__Real__47.Value == "Knife";
	if v45 == "Shuffle" then
		local v49 = l__ReplicatedStorage__6.GetWeapons:InvokeServer(p20);
		local v50 = player.Favourites.WeaponSkins:GetChildren();
		if 0 < #v50 then
			v49 = v50;
		end;
		if 2 <= #v49 then
			v45 = tostring(v49[math.random(1, #v49)]);
			if v45 == "None" then
				while true do
					wait();
					v45 = tostring(v49[math.random(1, #v49)]);
					if v45 == "None" then

					else
						break;
					end;				
				end;
			end;
		end;
	end;
	if v45 then
		if v45 ~= "Shuffle" then
			if v45 ~= "" then
				if v45 ~= "None" then
					if l__ReplicatedStorage__6.Skins:FindFirstChild(v45) then
						local v51 = { "Top", "Bottom", "Right", "Left", "Front", "Back" };
						if v48 then
							local v52 = _gf.split(player.Data.Melee.Value, "_")[2];
							if v52 then
								v45 = u3[v52];
							end;
						end;
						local v53 = l__ReplicatedStorage__6.Skins[v45];
						local v54 = Instance.new("NumberValue");
						v54.Value = v53.Scale.Value;
						v54.Parent = p18;
						local v55 = nil;
						local l__Flash__56 = p18:FindFirstChild("Flash");
						if l__Flash__56 then
							if v46 then
								if not v48 then
									local v57 = l__ReplicatedStorage__6.ItemUnusuals.WeaponSkins:FindFirstChild(v46);
									if v57 then
										local v58 = v57.Attachment:clone();
										v58.Name = "Unusual";
										v58.Parent = l__Flash__56;
									end;
								end;
							end;
						end;
						local v59, v60, v61 = pairs(p18:GetDescendants());
						while true do
							local v62, v63 = v59(v60, v61);
							if v62 then

							else
								break;
							end;
							v61 = v62;
							if v63:IsA("BasePart") then
								if v63.Transparency <= 0 then
									if v63.Name ~= "Handle." then
										if v63.Name ~= "Handle2" then
											if v63.Name ~= "2Handle" then
												if v63.Name ~= "Handle1" then
													if v63.Name ~= "Handle" then
														if v63.Name ~= "Part" then
															if v63.Name ~= "Model" then
																if string.find(string.lower(v63.Name), "barrel") then
																	if v63.Name ~= "Barrel" then
																		if v63.Material ~= Enum.Material.Wood then
																			if not v55 then
																				v55 = v63;
																			end;
																			local v64, v65, v66 = pairs(v51);
																			while true do
																				local v67, v68 = v64(v65, v66);
																				if v67 then

																				else
																					break;
																				end;
																				local v69 = script.Skin:Clone();
																				v69.Texture = v53.Value;
																				v69.Color3 = v53.Shade.Value;
																				v69.StudsPerTileU = v53.Scale.Value;
																				v69.StudsPerTileV = v53.Scale.Value;
																				v69.Face = v68;
																				v69.Parent = v63;
																				u4(v63, v69);
																				if not v53:FindFirstChild("No") then
																					if p20 then
																						if p20.Character then
																							if p20.Character:FindFirstChild("Body Colors") then
																								local l__TorsoColor3__70 = p20.Character["Body Colors"].TorsoColor3;
																								local v71 = v53:FindFirstChild("Multiplier") and v53.Multiplier.Value or 1;
																								v69.Color3 = Color3.new(l__TorsoColor3__70.r * v71, l__TorsoColor3__70.g * v71, l__TorsoColor3__70.b * v71);
																							elseif v53:FindFirstChild("Multiplier") then
																								local l__Value__72 = v53.Shade.Value;
																								local v73 = v53:FindFirstChild("Multiplier") and v53.Multiplier.Value or 1;
																								v69.Color3 = Color3.new(l__Value__72.r * v73, l__Value__72.g * v73, l__Value__72.b * v73);
																							end;
																						elseif v53:FindFirstChild("Multiplier") then
																							l__Value__72 = v53.Shade.Value;
																							v73 = v53:FindFirstChild("Multiplier") and v53.Multiplier.Value or 1;
																							v69.Color3 = Color3.new(l__Value__72.r * v73, l__Value__72.g * v73, l__Value__72.b * v73);
																						end;
																					elseif v53:FindFirstChild("Multiplier") then
																						l__Value__72 = v53.Shade.Value;
																						v73 = v53:FindFirstChild("Multiplier") and v53.Multiplier.Value or 1;
																						v69.Color3 = Color3.new(l__Value__72.r * v73, l__Value__72.g * v73, l__Value__72.b * v73);
																					end;
																				elseif v53:FindFirstChild("Multiplier") then
																					l__Value__72 = v53.Shade.Value;
																					v73 = v53:FindFirstChild("Multiplier") and v53.Multiplier.Value or 1;
																					v69.Color3 = Color3.new(l__Value__72.r * v73, l__Value__72.g * v73, l__Value__72.b * v73);
																				end;
																				if v53:FindFirstChild("Neon") then
																					v63.Material = Enum.Material.Neon;
																					v63.BrickColor = v53.Neon.Value;
																				end;
																				if v53:FindFirstChild("Colored") then
																					v63.BrickColor = v53.Colored.Value;
																				end;
																				if v53:FindFirstChild("Material") then
																					v63.Material = v53.Material.Value;
																				end;
																				if v48 then
																					v69.Color3 = Color3.new(1, 1, 1);
																				end;
																				if p20 == player then
																					if v53:FindFirstChild("Animated") then
																						local v74 = v43:GetPropertyChangedSignal("Value");
																						local u6 = v53.Animated:FindFirstChild("Speed") and v53.Animated.Speed.Value or 0.01;
																						local u7 = nil;
																						local u8 = nil;
																						u7 = v74:connect(function()
																							if p18 then
																								if p18.Parent then
																									if not p18:IsDescendantOf(player.PlayerGui) then
																										if not u5(v55) then
																											if p18:IsDescendantOf(player.PlayerGui) then
																												if player.PlayerGui.Menew.Locker.Visible then
																													if v53:FindFirstChild("Animated") then
																														if not v53.Animated:FindFirstChild("Horz") then
																															v69.OffsetStudsV = v69.OffsetStudsV + u6;
																														end;
																													end;
																													v69.OffsetStudsU = v69.OffsetStudsU - u6;
																													if p20 then
																														if p20 then
																															if p20:FindFirstChild("NRPBS") then
																																if p20:FindFirstChild("Status") then
																																	if p20.Status.Alive.Value then
																																		if p20.NRPBS.Health.Value <= 0 then
																																			if p18:IsDescendantOf(player.PlayerGui) then
																																				if p18 then
																																					if not p18.Parent then
																																						u7:disconnect();
																																						v54:Destroy();
																																						if u8 then
																																							u8:Cancel();
																																							return;
																																						end;
																																					end;
																																				else
																																					u7:disconnect();
																																					v54:Destroy();
																																					if u8 then
																																						u8:Cancel();
																																						return;
																																					end;
																																				end;
																																			else
																																				u7:disconnect();
																																				v54:Destroy();
																																				if u8 then
																																					u8:Cancel();
																																					return;
																																				end;
																																			end;
																																		elseif p18 then
																																			if not p18.Parent then
																																				u7:disconnect();
																																				v54:Destroy();
																																				if u8 then
																																					u8:Cancel();
																																					return;
																																				end;
																																			end;
																																		else
																																			u7:disconnect();
																																			v54:Destroy();
																																			if u8 then
																																				u8:Cancel();
																																				return;
																																			end;
																																		end;
																																	elseif p18:IsDescendantOf(player.PlayerGui) then
																																		if p18 then
																																			if not p18.Parent then
																																				u7:disconnect();
																																				v54:Destroy();
																																				if u8 then
																																					u8:Cancel();
																																					return;
																																				end;
																																			end;
																																		else
																																			u7:disconnect();
																																			v54:Destroy();
																																			if u8 then
																																				u8:Cancel();
																																				return;
																																			end;
																																		end;
																																	else
																																		u7:disconnect();
																																		v54:Destroy();
																																		if u8 then
																																			u8:Cancel();
																																			return;
																																		end;
																																	end;
																																elseif p18:IsDescendantOf(player.PlayerGui) then
																																	if p18 then
																																		if not p18.Parent then
																																			u7:disconnect();
																																			v54:Destroy();
																																			if u8 then
																																				u8:Cancel();
																																				return;
																																			end;
																																		end;
																																	else
																																		u7:disconnect();
																																		v54:Destroy();
																																		if u8 then
																																			u8:Cancel();
																																			return;
																																		end;
																																	end;
																																else
																																	u7:disconnect();
																																	v54:Destroy();
																																	if u8 then
																																		u8:Cancel();
																																		return;
																																	end;
																																end;
																															elseif p18:IsDescendantOf(player.PlayerGui) then
																																if p18 then
																																	if not p18.Parent then
																																		u7:disconnect();
																																		v54:Destroy();
																																		if u8 then
																																			u8:Cancel();
																																			return;
																																		end;
																																	end;
																																else
																																	u7:disconnect();
																																	v54:Destroy();
																																	if u8 then
																																		u8:Cancel();
																																		return;
																																	end;
																																end;
																															else
																																u7:disconnect();
																																v54:Destroy();
																																if u8 then
																																	u8:Cancel();
																																	return;
																																end;
																															end;
																														elseif p18 then
																															if not p18.Parent then
																																u7:disconnect();
																																v54:Destroy();
																																if u8 then
																																	u8:Cancel();
																																	return;
																																end;
																															end;
																														else
																															u7:disconnect();
																															v54:Destroy();
																															if u8 then
																																u8:Cancel();
																																return;
																															end;
																														end;
																													else
																														u7:disconnect();
																														v54:Destroy();
																														if u8 then
																															u8:Cancel();
																															return;
																														end;
																													end;
																												end;
																											end;
																										else
																											if v53:FindFirstChild("Animated") then
																												if not v53.Animated:FindFirstChild("Horz") then
																													v69.OffsetStudsV = v69.OffsetStudsV + u6;
																												end;
																											end;
																											v69.OffsetStudsU = v69.OffsetStudsU - u6;
																											if p20 then
																												if p20 then
																													if p20:FindFirstChild("NRPBS") then
																														if p20:FindFirstChild("Status") then
																															if p20.Status.Alive.Value then
																																if p20.NRPBS.Health.Value <= 0 then
																																	if p18:IsDescendantOf(player.PlayerGui) then
																																		if p18 then
																																			if not p18.Parent then
																																				u7:disconnect();
																																				v54:Destroy();
																																				if u8 then
																																					u8:Cancel();
																																					return;
																																				end;
																																			end;
																																		else
																																			u7:disconnect();
																																			v54:Destroy();
																																			if u8 then
																																				u8:Cancel();
																																				return;
																																			end;
																																		end;
																																	else
																																		u7:disconnect();
																																		v54:Destroy();
																																		if u8 then
																																			u8:Cancel();
																																			return;
																																		end;
																																	end;
																																elseif p18 then
																																	if not p18.Parent then
																																		u7:disconnect();
																																		v54:Destroy();
																																		if u8 then
																																			u8:Cancel();
																																			return;
																																		end;
																																	end;
																																else
																																	u7:disconnect();
																																	v54:Destroy();
																																	if u8 then
																																		u8:Cancel();
																																		return;
																																	end;
																																end;
																															elseif p18:IsDescendantOf(player.PlayerGui) then
																																if p18 then
																																	if not p18.Parent then
																																		u7:disconnect();
																																		v54:Destroy();
																																		if u8 then
																																			u8:Cancel();
																																			return;
																																		end;
																																	end;
																																else
																																	u7:disconnect();
																																	v54:Destroy();
																																	if u8 then
																																		u8:Cancel();
																																		return;
																																	end;
																																end;
																															else
																																u7:disconnect();
																																v54:Destroy();
																																if u8 then
																																	u8:Cancel();
																																	return;
																																end;
																															end;
																														elseif p18:IsDescendantOf(player.PlayerGui) then
																															if p18 then
																																if not p18.Parent then
																																	u7:disconnect();
																																	v54:Destroy();
																																	if u8 then
																																		u8:Cancel();
																																		return;
																																	end;
																																end;
																															else
																																u7:disconnect();
																																v54:Destroy();
																																if u8 then
																																	u8:Cancel();
																																	return;
																																end;
																															end;
																														else
																															u7:disconnect();
																															v54:Destroy();
																															if u8 then
																																u8:Cancel();
																																return;
																															end;
																														end;
																													elseif p18:IsDescendantOf(player.PlayerGui) then
																														if p18 then
																															if not p18.Parent then
																																u7:disconnect();
																																v54:Destroy();
																																if u8 then
																																	u8:Cancel();
																																	return;
																																end;
																															end;
																														else
																															u7:disconnect();
																															v54:Destroy();
																															if u8 then
																																u8:Cancel();
																																return;
																															end;
																														end;
																													else
																														u7:disconnect();
																														v54:Destroy();
																														if u8 then
																															u8:Cancel();
																															return;
																														end;
																													end;
																												elseif p18 then
																													if not p18.Parent then
																														u7:disconnect();
																														v54:Destroy();
																														if u8 then
																															u8:Cancel();
																															return;
																														end;
																													end;
																												else
																													u7:disconnect();
																													v54:Destroy();
																													if u8 then
																														u8:Cancel();
																														return;
																													end;
																												end;
																											else
																												u7:disconnect();
																												v54:Destroy();
																												if u8 then
																													u8:Cancel();
																													return;
																												end;
																											end;
																										end;
																									elseif p18:IsDescendantOf(player.PlayerGui) then
																										if player.PlayerGui.Menew.Locker.Visible then
																											if v53:FindFirstChild("Animated") then
																												if not v53.Animated:FindFirstChild("Horz") then
																													v69.OffsetStudsV = v69.OffsetStudsV + u6;
																												end;
																											end;
																											v69.OffsetStudsU = v69.OffsetStudsU - u6;
																											if p20 then
																												if p20 then
																													if p20:FindFirstChild("NRPBS") then
																														if p20:FindFirstChild("Status") then
																															if p20.Status.Alive.Value then
																																if p20.NRPBS.Health.Value <= 0 then
																																	if p18:IsDescendantOf(player.PlayerGui) then
																																		if p18 then
																																			if not p18.Parent then
																																				u7:disconnect();
																																				v54:Destroy();
																																				if u8 then
																																					u8:Cancel();
																																					return;
																																				end;
																																			end;
																																		else
																																			u7:disconnect();
																																			v54:Destroy();
																																			if u8 then
																																				u8:Cancel();
																																				return;
																																			end;
																																		end;
																																	else
																																		u7:disconnect();
																																		v54:Destroy();
																																		if u8 then
																																			u8:Cancel();
																																			return;
																																		end;
																																	end;
																																elseif p18 then
																																	if not p18.Parent then
																																		u7:disconnect();
																																		v54:Destroy();
																																		if u8 then
																																			u8:Cancel();
																																			return;
																																		end;
																																	end;
																																else
																																	u7:disconnect();
																																	v54:Destroy();
																																	if u8 then
																																		u8:Cancel();
																																		return;
																																	end;
																																end;
																															elseif p18:IsDescendantOf(player.PlayerGui) then
																																if p18 then
																																	if not p18.Parent then
																																		u7:disconnect();
																																		v54:Destroy();
																																		if u8 then
																																			u8:Cancel();
																																			return;
																																		end;
																																	end;
																																else
																																	u7:disconnect();
																																	v54:Destroy();
																																	if u8 then
																																		u8:Cancel();
																																		return;
																																	end;
																																end;
																															else
																																u7:disconnect();
																																v54:Destroy();
																																if u8 then
																																	u8:Cancel();
																																	return;
																																end;
																															end;
																														elseif p18:IsDescendantOf(player.PlayerGui) then
																															if p18 then
																																if not p18.Parent then
																																	u7:disconnect();
																																	v54:Destroy();
																																	if u8 then
																																		u8:Cancel();
																																		return;
																																	end;
																																end;
																															else
																																u7:disconnect();
																																v54:Destroy();
																																if u8 then
																																	u8:Cancel();
																																	return;
																																end;
																															end;
																														else
																															u7:disconnect();
																															v54:Destroy();
																															if u8 then
																																u8:Cancel();
																																return;
																															end;
																														end;
																													elseif p18:IsDescendantOf(player.PlayerGui) then
																														if p18 then
																															if not p18.Parent then
																																u7:disconnect();
																																v54:Destroy();
																																if u8 then
																																	u8:Cancel();
																																	return;
																																end;
																															end;
																														else
																															u7:disconnect();
																															v54:Destroy();
																															if u8 then
																																u8:Cancel();
																																return;
																															end;
																														end;
																													else
																														u7:disconnect();
																														v54:Destroy();
																														if u8 then
																															u8:Cancel();
																															return;
																														end;
																													end;
																												elseif p18 then
																													if not p18.Parent then
																														u7:disconnect();
																														v54:Destroy();
																														if u8 then
																															u8:Cancel();
																															return;
																														end;
																													end;
																												else
																													u7:disconnect();
																													v54:Destroy();
																													if u8 then
																														u8:Cancel();
																														return;
																													end;
																												end;
																											else
																												u7:disconnect();
																												v54:Destroy();
																												if u8 then
																													u8:Cancel();
																													return;
																												end;
																											end;
																										end;
																									end;
																								else
																									u7:disconnect();
																									v54:Destroy();
																									if u8 then
																										u8:Cancel();
																									end;
																								end;
																							else
																								u7:disconnect();
																								v54:Destroy();
																								if u8 then
																									u8:Cancel();
																								end;
																							end;
																						end);
																					elseif v53:FindFirstChild("Align") then
																						local u9 = nil;
																						local u10 = nil;
																						u9 = v43:GetPropertyChangedSignal("Value"):connect(function()
																							if p18 then
																								if p18.Parent then
																									if not p18:IsDescendantOf(player.PlayerGui) then
																										if not u5(v55) then
																											if p18:IsDescendantOf(player.PlayerGui) then
																												if player.PlayerGui.Menew.Locker.Visible then
																													u4(v63, v69);
																													if p20 then
																														if p20 then
																															if p20:FindFirstChild("NRPBS") then
																																if p20:FindFirstChild("Status") then
																																	if p20.Status.Alive.Value then
																																		if p20.NRPBS.Health.Value <= 0 then
																																			if p18:IsDescendantOf(player.PlayerGui) then
																																				if p18 then
																																					if not p18.Parent then
																																						u9:disconnect();
																																						v54:Destroy();
																																						if u10 then
																																							u10:Cancel();
																																							return;
																																						end;
																																					end;
																																				else
																																					u9:disconnect();
																																					v54:Destroy();
																																					if u10 then
																																						u10:Cancel();
																																						return;
																																					end;
																																				end;
																																			else
																																				u9:disconnect();
																																				v54:Destroy();
																																				if u10 then
																																					u10:Cancel();
																																					return;
																																				end;
																																			end;
																																		elseif p18 then
																																			if not p18.Parent then
																																				u9:disconnect();
																																				v54:Destroy();
																																				if u10 then
																																					u10:Cancel();
																																					return;
																																				end;
																																			end;
																																		else
																																			u9:disconnect();
																																			v54:Destroy();
																																			if u10 then
																																				u10:Cancel();
																																				return;
																																			end;
																																		end;
																																	elseif p18:IsDescendantOf(player.PlayerGui) then
																																		if p18 then
																																			if not p18.Parent then
																																				u9:disconnect();
																																				v54:Destroy();
																																				if u10 then
																																					u10:Cancel();
																																					return;
																																				end;
																																			end;
																																		else
																																			u9:disconnect();
																																			v54:Destroy();
																																			if u10 then
																																				u10:Cancel();
																																				return;
																																			end;
																																		end;
																																	else
																																		u9:disconnect();
																																		v54:Destroy();
																																		if u10 then
																																			u10:Cancel();
																																			return;
																																		end;
																																	end;
																																elseif p18:IsDescendantOf(player.PlayerGui) then
																																	if p18 then
																																		if not p18.Parent then
																																			u9:disconnect();
																																			v54:Destroy();
																																			if u10 then
																																				u10:Cancel();
																																				return;
																																			end;
																																		end;
																																	else
																																		u9:disconnect();
																																		v54:Destroy();
																																		if u10 then
																																			u10:Cancel();
																																			return;
																																		end;
																																	end;
																																else
																																	u9:disconnect();
																																	v54:Destroy();
																																	if u10 then
																																		u10:Cancel();
																																		return;
																																	end;
																																end;
																															elseif p18:IsDescendantOf(player.PlayerGui) then
																																if p18 then
																																	if not p18.Parent then
																																		u9:disconnect();
																																		v54:Destroy();
																																		if u10 then
																																			u10:Cancel();
																																			return;
																																		end;
																																	end;
																																else
																																	u9:disconnect();
																																	v54:Destroy();
																																	if u10 then
																																		u10:Cancel();
																																		return;
																																	end;
																																end;
																															else
																																u9:disconnect();
																																v54:Destroy();
																																if u10 then
																																	u10:Cancel();
																																	return;
																																end;
																															end;
																														elseif p18 then
																															if not p18.Parent then
																																u9:disconnect();
																																v54:Destroy();
																																if u10 then
																																	u10:Cancel();
																																	return;
																																end;
																															end;
																														else
																															u9:disconnect();
																															v54:Destroy();
																															if u10 then
																																u10:Cancel();
																																return;
																															end;
																														end;
																													else
																														u9:disconnect();
																														v54:Destroy();
																														if u10 then
																															u10:Cancel();
																															return;
																														end;
																													end;
																												end;
																											end;
																										else
																											u4(v63, v69);
																											if p20 then
																												if p20 then
																													if p20:FindFirstChild("NRPBS") then
																														if p20:FindFirstChild("Status") then
																															if p20.Status.Alive.Value then
																																if p20.NRPBS.Health.Value <= 0 then
																																	if p18:IsDescendantOf(player.PlayerGui) then
																																		if p18 then
																																			if not p18.Parent then
																																				u9:disconnect();
																																				v54:Destroy();
																																				if u10 then
																																					u10:Cancel();
																																					return;
																																				end;
																																			end;
																																		else
																																			u9:disconnect();
																																			v54:Destroy();
																																			if u10 then
																																				u10:Cancel();
																																				return;
																																			end;
																																		end;
																																	else
																																		u9:disconnect();
																																		v54:Destroy();
																																		if u10 then
																																			u10:Cancel();
																																			return;
																																		end;
																																	end;
																																elseif p18 then
																																	if not p18.Parent then
																																		u9:disconnect();
																																		v54:Destroy();
																																		if u10 then
																																			u10:Cancel();
																																			return;
																																		end;
																																	end;
																																else
																																	u9:disconnect();
																																	v54:Destroy();
																																	if u10 then
																																		u10:Cancel();
																																		return;
																																	end;
																																end;
																															elseif p18:IsDescendantOf(player.PlayerGui) then
																																if p18 then
																																	if not p18.Parent then
																																		u9:disconnect();
																																		v54:Destroy();
																																		if u10 then
																																			u10:Cancel();
																																			return;
																																		end;
																																	end;
																																else
																																	u9:disconnect();
																																	v54:Destroy();
																																	if u10 then
																																		u10:Cancel();
																																		return;
																																	end;
																																end;
																															else
																																u9:disconnect();
																																v54:Destroy();
																																if u10 then
																																	u10:Cancel();
																																	return;
																																end;
																															end;
																														elseif p18:IsDescendantOf(player.PlayerGui) then
																															if p18 then
																																if not p18.Parent then
																																	u9:disconnect();
																																	v54:Destroy();
																																	if u10 then
																																		u10:Cancel();
																																		return;
																																	end;
																																end;
																															else
																																u9:disconnect();
																																v54:Destroy();
																																if u10 then
																																	u10:Cancel();
																																	return;
																																end;
																															end;
																														else
																															u9:disconnect();
																															v54:Destroy();
																															if u10 then
																																u10:Cancel();
																																return;
																															end;
																														end;
																													elseif p18:IsDescendantOf(player.PlayerGui) then
																														if p18 then
																															if not p18.Parent then
																																u9:disconnect();
																																v54:Destroy();
																																if u10 then
																																	u10:Cancel();
																																	return;
																																end;
																															end;
																														else
																															u9:disconnect();
																															v54:Destroy();
																															if u10 then
																																u10:Cancel();
																																return;
																															end;
																														end;
																													else
																														u9:disconnect();
																														v54:Destroy();
																														if u10 then
																															u10:Cancel();
																															return;
																														end;
																													end;
																												elseif p18 then
																													if not p18.Parent then
																														u9:disconnect();
																														v54:Destroy();
																														if u10 then
																															u10:Cancel();
																															return;
																														end;
																													end;
																												else
																													u9:disconnect();
																													v54:Destroy();
																													if u10 then
																														u10:Cancel();
																														return;
																													end;
																												end;
																											else
																												u9:disconnect();
																												v54:Destroy();
																												if u10 then
																													u10:Cancel();
																													return;
																												end;
																											end;
																										end;
																									elseif p18:IsDescendantOf(player.PlayerGui) then
																										if player.PlayerGui.Menew.Locker.Visible then
																											u4(v63, v69);
																											if p20 then
																												if p20 then
																													if p20:FindFirstChild("NRPBS") then
																														if p20:FindFirstChild("Status") then
																															if p20.Status.Alive.Value then
																																if p20.NRPBS.Health.Value <= 0 then
																																	if p18:IsDescendantOf(player.PlayerGui) then
																																		if p18 then
																																			if not p18.Parent then
																																				u9:disconnect();
																																				v54:Destroy();
																																				if u10 then
																																					u10:Cancel();
																																					return;
																																				end;
																																			end;
																																		else
																																			u9:disconnect();
																																			v54:Destroy();
																																			if u10 then
																																				u10:Cancel();
																																				return;
																																			end;
																																		end;
																																	else
																																		u9:disconnect();
																																		v54:Destroy();
																																		if u10 then
																																			u10:Cancel();
																																			return;
																																		end;
																																	end;
																																elseif p18 then
																																	if not p18.Parent then
																																		u9:disconnect();
																																		v54:Destroy();
																																		if u10 then
																																			u10:Cancel();
																																			return;
																																		end;
																																	end;
																																else
																																	u9:disconnect();
																																	v54:Destroy();
																																	if u10 then
																																		u10:Cancel();
																																		return;
																																	end;
																																end;
																															elseif p18:IsDescendantOf(player.PlayerGui) then
																																if p18 then
																																	if not p18.Parent then
																																		u9:disconnect();
																																		v54:Destroy();
																																		if u10 then
																																			u10:Cancel();
																																			return;
																																		end;
																																	end;
																																else
																																	u9:disconnect();
																																	v54:Destroy();
																																	if u10 then
																																		u10:Cancel();
																																		return;
																																	end;
																																end;
																															else
																																u9:disconnect();
																																v54:Destroy();
																																if u10 then
																																	u10:Cancel();
																																	return;
																																end;
																															end;
																														elseif p18:IsDescendantOf(player.PlayerGui) then
																															if p18 then
																																if not p18.Parent then
																																	u9:disconnect();
																																	v54:Destroy();
																																	if u10 then
																																		u10:Cancel();
																																		return;
																																	end;
																																end;
																															else
																																u9:disconnect();
																																v54:Destroy();
																																if u10 then
																																	u10:Cancel();
																																	return;
																																end;
																															end;
																														else
																															u9:disconnect();
																															v54:Destroy();
																															if u10 then
																																u10:Cancel();
																																return;
																															end;
																														end;
																													elseif p18:IsDescendantOf(player.PlayerGui) then
																														if p18 then
																															if not p18.Parent then
																																u9:disconnect();
																																v54:Destroy();
																																if u10 then
																																	u10:Cancel();
																																	return;
																																end;
																															end;
																														else
																															u9:disconnect();
																															v54:Destroy();
																															if u10 then
																																u10:Cancel();
																																return;
																															end;
																														end;
																													else
																														u9:disconnect();
																														v54:Destroy();
																														if u10 then
																															u10:Cancel();
																															return;
																														end;
																													end;
																												elseif p18 then
																													if not p18.Parent then
																														u9:disconnect();
																														v54:Destroy();
																														if u10 then
																															u10:Cancel();
																															return;
																														end;
																													end;
																												else
																													u9:disconnect();
																													v54:Destroy();
																													if u10 then
																														u10:Cancel();
																														return;
																													end;
																												end;
																											else
																												u9:disconnect();
																												v54:Destroy();
																												if u10 then
																													u10:Cancel();
																													return;
																												end;
																											end;
																										end;
																									end;
																								else
																									u9:disconnect();
																									v54:Destroy();
																									if u10 then
																										u10:Cancel();
																									end;
																								end;
																							else
																								u9:disconnect();
																								v54:Destroy();
																								if u10 then
																									u10:Cancel();
																								end;
																							end;
																						end);
																					end;
																					if v53:FindFirstChild("Sizer") then
																						local u11 = nil;
																						local u12 = nil;
																						u11 = v54:GetPropertyChangedSignal("Value"):connect(function()
																							if p18 then
																								if p18.Parent then
																									if not p18:IsDescendantOf(player.PlayerGui) then
																										if not u5(v55) then
																											if p18:IsDescendantOf(player.PlayerGui) then
																												if player.PlayerGui.Menew.Locker.Visible then
																													v69.StudsPerTileU = v54.Value;
																													v69.StudsPerTileV = v54.Value;
																													if p20 then
																														if p20 then
																															if p20:FindFirstChild("NRPBS") then
																																if p20:FindFirstChild("Status") then
																																	if p20.Status.Alive.Value then
																																		if p20.NRPBS.Health.Value <= 0 then
																																			if p18:IsDescendantOf(player.PlayerGui) then
																																				if p18 then
																																					if not p18.Parent then
																																						u11:disconnect();
																																						v54:Destroy();
																																						if u12 then
																																							u12:Cancel();
																																							return;
																																						end;
																																					end;
																																				else
																																					u11:disconnect();
																																					v54:Destroy();
																																					if u12 then
																																						u12:Cancel();
																																						return;
																																					end;
																																				end;
																																			else
																																				u11:disconnect();
																																				v54:Destroy();
																																				if u12 then
																																					u12:Cancel();
																																					return;
																																				end;
																																			end;
																																		elseif p18 then
																																			if not p18.Parent then
																																				u11:disconnect();
																																				v54:Destroy();
																																				if u12 then
																																					u12:Cancel();
																																					return;
																																				end;
																																			end;
																																		else
																																			u11:disconnect();
																																			v54:Destroy();
																																			if u12 then
																																				u12:Cancel();
																																				return;
																																			end;
																																		end;
																																	elseif p18:IsDescendantOf(player.PlayerGui) then
																																		if p18 then
																																			if not p18.Parent then
																																				u11:disconnect();
																																				v54:Destroy();
																																				if u12 then
																																					u12:Cancel();
																																					return;
																																				end;
																																			end;
																																		else
																																			u11:disconnect();
																																			v54:Destroy();
																																			if u12 then
																																				u12:Cancel();
																																				return;
																																			end;
																																		end;
																																	else
																																		u11:disconnect();
																																		v54:Destroy();
																																		if u12 then
																																			u12:Cancel();
																																			return;
																																		end;
																																	end;
																																elseif p18:IsDescendantOf(player.PlayerGui) then
																																	if p18 then
																																		if not p18.Parent then
																																			u11:disconnect();
																																			v54:Destroy();
																																			if u12 then
																																				u12:Cancel();
																																				return;
																																			end;
																																		end;
																																	else
																																		u11:disconnect();
																																		v54:Destroy();
																																		if u12 then
																																			u12:Cancel();
																																			return;
																																		end;
																																	end;
																																else
																																	u11:disconnect();
																																	v54:Destroy();
																																	if u12 then
																																		u12:Cancel();
																																		return;
																																	end;
																																end;
																															elseif p18:IsDescendantOf(player.PlayerGui) then
																																if p18 then
																																	if not p18.Parent then
																																		u11:disconnect();
																																		v54:Destroy();
																																		if u12 then
																																			u12:Cancel();
																																			return;
																																		end;
																																	end;
																																else
																																	u11:disconnect();
																																	v54:Destroy();
																																	if u12 then
																																		u12:Cancel();
																																		return;
																																	end;
																																end;
																															else
																																u11:disconnect();
																																v54:Destroy();
																																if u12 then
																																	u12:Cancel();
																																	return;
																																end;
																															end;
																														elseif p18 then
																															if not p18.Parent then
																																u11:disconnect();
																																v54:Destroy();
																																if u12 then
																																	u12:Cancel();
																																	return;
																																end;
																															end;
																														else
																															u11:disconnect();
																															v54:Destroy();
																															if u12 then
																																u12:Cancel();
																																return;
																															end;
																														end;
																													else
																														u11:disconnect();
																														v54:Destroy();
																														if u12 then
																															u12:Cancel();
																															return;
																														end;
																													end;
																												end;
																											end;
																										else
																											v69.StudsPerTileU = v54.Value;
																											v69.StudsPerTileV = v54.Value;
																											if p20 then
																												if p20 then
																													if p20:FindFirstChild("NRPBS") then
																														if p20:FindFirstChild("Status") then
																															if p20.Status.Alive.Value then
																																if p20.NRPBS.Health.Value <= 0 then
																																	if p18:IsDescendantOf(player.PlayerGui) then
																																		if p18 then
																																			if not p18.Parent then
																																				u11:disconnect();
																																				v54:Destroy();
																																				if u12 then
																																					u12:Cancel();
																																					return;
																																				end;
																																			end;
																																		else
																																			u11:disconnect();
																																			v54:Destroy();
																																			if u12 then
																																				u12:Cancel();
																																				return;
																																			end;
																																		end;
																																	else
																																		u11:disconnect();
																																		v54:Destroy();
																																		if u12 then
																																			u12:Cancel();
																																			return;
																																		end;
																																	end;
																																elseif p18 then
																																	if not p18.Parent then
																																		u11:disconnect();
																																		v54:Destroy();
																																		if u12 then
																																			u12:Cancel();
																																			return;
																																		end;
																																	end;
																																else
																																	u11:disconnect();
																																	v54:Destroy();
																																	if u12 then
																																		u12:Cancel();
																																		return;
																																	end;
																																end;
																															elseif p18:IsDescendantOf(player.PlayerGui) then
																																if p18 then
																																	if not p18.Parent then
																																		u11:disconnect();
																																		v54:Destroy();
																																		if u12 then
																																			u12:Cancel();
																																			return;
																																		end;
																																	end;
																																else
																																	u11:disconnect();
																																	v54:Destroy();
																																	if u12 then
																																		u12:Cancel();
																																		return;
																																	end;
																																end;
																															else
																																u11:disconnect();
																																v54:Destroy();
																																if u12 then
																																	u12:Cancel();
																																	return;
																																end;
																															end;
																														elseif p18:IsDescendantOf(player.PlayerGui) then
																															if p18 then
																																if not p18.Parent then
																																	u11:disconnect();
																																	v54:Destroy();
																																	if u12 then
																																		u12:Cancel();
																																		return;
																																	end;
																																end;
																															else
																																u11:disconnect();
																																v54:Destroy();
																																if u12 then
																																	u12:Cancel();
																																	return;
																																end;
																															end;
																														else
																															u11:disconnect();
																															v54:Destroy();
																															if u12 then
																																u12:Cancel();
																																return;
																															end;
																														end;
																													elseif p18:IsDescendantOf(player.PlayerGui) then
																														if p18 then
																															if not p18.Parent then
																																u11:disconnect();
																																v54:Destroy();
																																if u12 then
																																	u12:Cancel();
																																	return;
																																end;
																															end;
																														else
																															u11:disconnect();
																															v54:Destroy();
																															if u12 then
																																u12:Cancel();
																																return;
																															end;
																														end;
																													else
																														u11:disconnect();
																														v54:Destroy();
																														if u12 then
																															u12:Cancel();
																															return;
																														end;
																													end;
																												elseif p18 then
																													if not p18.Parent then
																														u11:disconnect();
																														v54:Destroy();
																														if u12 then
																															u12:Cancel();
																															return;
																														end;
																													end;
																												else
																													u11:disconnect();
																													v54:Destroy();
																													if u12 then
																														u12:Cancel();
																														return;
																													end;
																												end;
																											else
																												u11:disconnect();
																												v54:Destroy();
																												if u12 then
																													u12:Cancel();
																													return;
																												end;
																											end;
																										end;
																									elseif p18:IsDescendantOf(player.PlayerGui) then
																										if player.PlayerGui.Menew.Locker.Visible then
																											v69.StudsPerTileU = v54.Value;
																											v69.StudsPerTileV = v54.Value;
																											if p20 then
																												if p20 then
																													if p20:FindFirstChild("NRPBS") then
																														if p20:FindFirstChild("Status") then
																															if p20.Status.Alive.Value then
																																if p20.NRPBS.Health.Value <= 0 then
																																	if p18:IsDescendantOf(player.PlayerGui) then
																																		if p18 then
																																			if not p18.Parent then
																																				u11:disconnect();
																																				v54:Destroy();
																																				if u12 then
																																					u12:Cancel();
																																					return;
																																				end;
																																			end;
																																		else
																																			u11:disconnect();
																																			v54:Destroy();
																																			if u12 then
																																				u12:Cancel();
																																				return;
																																			end;
																																		end;
																																	else
																																		u11:disconnect();
																																		v54:Destroy();
																																		if u12 then
																																			u12:Cancel();
																																			return;
																																		end;
																																	end;
																																elseif p18 then
																																	if not p18.Parent then
																																		u11:disconnect();
																																		v54:Destroy();
																																		if u12 then
																																			u12:Cancel();
																																			return;
																																		end;
																																	end;
																																else
																																	u11:disconnect();
																																	v54:Destroy();
																																	if u12 then
																																		u12:Cancel();
																																		return;
																																	end;
																																end;
																															elseif p18:IsDescendantOf(player.PlayerGui) then
																																if p18 then
																																	if not p18.Parent then
																																		u11:disconnect();
																																		v54:Destroy();
																																		if u12 then
																																			u12:Cancel();
																																			return;
																																		end;
																																	end;
																																else
																																	u11:disconnect();
																																	v54:Destroy();
																																	if u12 then
																																		u12:Cancel();
																																		return;
																																	end;
																																end;
																															else
																																u11:disconnect();
																																v54:Destroy();
																																if u12 then
																																	u12:Cancel();
																																	return;
																																end;
																															end;
																														elseif p18:IsDescendantOf(player.PlayerGui) then
																															if p18 then
																																if not p18.Parent then
																																	u11:disconnect();
																																	v54:Destroy();
																																	if u12 then
																																		u12:Cancel();
																																		return;
																																	end;
																																end;
																															else
																																u11:disconnect();
																																v54:Destroy();
																																if u12 then
																																	u12:Cancel();
																																	return;
																																end;
																															end;
																														else
																															u11:disconnect();
																															v54:Destroy();
																															if u12 then
																																u12:Cancel();
																																return;
																															end;
																														end;
																													elseif p18:IsDescendantOf(player.PlayerGui) then
																														if p18 then
																															if not p18.Parent then
																																u11:disconnect();
																																v54:Destroy();
																																if u12 then
																																	u12:Cancel();
																																	return;
																																end;
																															end;
																														else
																															u11:disconnect();
																															v54:Destroy();
																															if u12 then
																																u12:Cancel();
																																return;
																															end;
																														end;
																													else
																														u11:disconnect();
																														v54:Destroy();
																														if u12 then
																															u12:Cancel();
																															return;
																														end;
																													end;
																												elseif p18 then
																													if not p18.Parent then
																														u11:disconnect();
																														v54:Destroy();
																														if u12 then
																															u12:Cancel();
																															return;
																														end;
																													end;
																												else
																													u11:disconnect();
																													v54:Destroy();
																													if u12 then
																														u12:Cancel();
																														return;
																													end;
																												end;
																											else
																												u11:disconnect();
																												v54:Destroy();
																												if u12 then
																													u12:Cancel();
																													return;
																												end;
																											end;
																										end;
																									end;
																								else
																									u11:disconnect();
																									v54:Destroy();
																									if u12 then
																										u12:Cancel();
																									end;
																								end;
																							else
																								u11:disconnect();
																								v54:Destroy();
																								if u12 then
																									u12:Cancel();
																								end;
																							end;
																						end);
																					end;
																				end;																			
																			end;
																		end;
																	end;
																end;
															elseif v63.Material ~= Enum.Material.Wood then
																if not v55 then
																	v55 = v63;
																end;
																v64, v65, v66 = pairs(v51);
																while true do
																	v67, v68 = v64(v65, v66);
																	if v67 then

																	else
																		break;
																	end;
																	v69 = script.Skin:Clone();
																	v69.Texture = v53.Value;
																	v69.Color3 = v53.Shade.Value;
																	v69.StudsPerTileU = v53.Scale.Value;
																	v69.StudsPerTileV = v53.Scale.Value;
																	v69.Face = v68;
																	v69.Parent = v63;
																	u4(v63, v69);
																	if not v53:FindFirstChild("No") then
																		if p20 then
																			if p20.Character then
																				if p20.Character:FindFirstChild("Body Colors") then
																					l__TorsoColor3__70 = p20.Character["Body Colors"].TorsoColor3;
																					v71 = v53:FindFirstChild("Multiplier") and v53.Multiplier.Value or 1;
																					v69.Color3 = Color3.new(l__TorsoColor3__70.r * v71, l__TorsoColor3__70.g * v71, l__TorsoColor3__70.b * v71);
																				elseif v53:FindFirstChild("Multiplier") then
																					l__Value__72 = v53.Shade.Value;
																					v73 = v53:FindFirstChild("Multiplier") and v53.Multiplier.Value or 1;
																					v69.Color3 = Color3.new(l__Value__72.r * v73, l__Value__72.g * v73, l__Value__72.b * v73);
																				end;
																			elseif v53:FindFirstChild("Multiplier") then
																				l__Value__72 = v53.Shade.Value;
																				v73 = v53:FindFirstChild("Multiplier") and v53.Multiplier.Value or 1;
																				v69.Color3 = Color3.new(l__Value__72.r * v73, l__Value__72.g * v73, l__Value__72.b * v73);
																			end;
																		elseif v53:FindFirstChild("Multiplier") then
																			l__Value__72 = v53.Shade.Value;
																			v73 = v53:FindFirstChild("Multiplier") and v53.Multiplier.Value or 1;
																			v69.Color3 = Color3.new(l__Value__72.r * v73, l__Value__72.g * v73, l__Value__72.b * v73);
																		end;
																	elseif v53:FindFirstChild("Multiplier") then
																		l__Value__72 = v53.Shade.Value;
																		v73 = v53:FindFirstChild("Multiplier") and v53.Multiplier.Value or 1;
																		v69.Color3 = Color3.new(l__Value__72.r * v73, l__Value__72.g * v73, l__Value__72.b * v73);
																	end;
																	if v53:FindFirstChild("Neon") then
																		v63.Material = Enum.Material.Neon;
																		v63.BrickColor = v53.Neon.Value;
																	end;
																	if v53:FindFirstChild("Colored") then
																		v63.BrickColor = v53.Colored.Value;
																	end;
																	if v53:FindFirstChild("Material") then
																		v63.Material = v53.Material.Value;
																	end;
																	if v48 then
																		v69.Color3 = Color3.new(1, 1, 1);
																	end;
																	if p20 == player then
																		if v53:FindFirstChild("Animated") then
																			v74 = v43:GetPropertyChangedSignal("Value");
																			u6 = v53.Animated:FindFirstChild("Speed") and v53.Animated.Speed.Value or 0.01;
																			u7 = nil;
																			u8 = nil;
																			u7 = v74:connect(function()
																				if p18 then
																					if p18.Parent then
																						if not p18:IsDescendantOf(player.PlayerGui) then
																							if not u5(v55) then
																								if p18:IsDescendantOf(player.PlayerGui) then
																									if player.PlayerGui.Menew.Locker.Visible then
																										if v53:FindFirstChild("Animated") then
																											if not v53.Animated:FindFirstChild("Horz") then
																												v69.OffsetStudsV = v69.OffsetStudsV + u6;
																											end;
																										end;
																										v69.OffsetStudsU = v69.OffsetStudsU - u6;
																										if p20 then
																											if p20 then
																												if p20:FindFirstChild("NRPBS") then
																													if p20:FindFirstChild("Status") then
																														if p20.Status.Alive.Value then
																															if p20.NRPBS.Health.Value <= 0 then
																																if p18:IsDescendantOf(player.PlayerGui) then
																																	if p18 then
																																		if not p18.Parent then
																																			u7:disconnect();
																																			v54:Destroy();
																																			if u8 then
																																				u8:Cancel();
																																				return;
																																			end;
																																		end;
																																	else
																																		u7:disconnect();
																																		v54:Destroy();
																																		if u8 then
																																			u8:Cancel();
																																			return;
																																		end;
																																	end;
																																else
																																	u7:disconnect();
																																	v54:Destroy();
																																	if u8 then
																																		u8:Cancel();
																																		return;
																																	end;
																																end;
																															elseif p18 then
																																if not p18.Parent then
																																	u7:disconnect();
																																	v54:Destroy();
																																	if u8 then
																																		u8:Cancel();
																																		return;
																																	end;
																																end;
																															else
																																u7:disconnect();
																																v54:Destroy();
																																if u8 then
																																	u8:Cancel();
																																	return;
																																end;
																															end;
																														elseif p18:IsDescendantOf(player.PlayerGui) then
																															if p18 then
																																if not p18.Parent then
																																	u7:disconnect();
																																	v54:Destroy();
																																	if u8 then
																																		u8:Cancel();
																																		return;
																																	end;
																																end;
																															else
																																u7:disconnect();
																																v54:Destroy();
																																if u8 then
																																	u8:Cancel();
																																	return;
																																end;
																															end;
																														else
																															u7:disconnect();
																															v54:Destroy();
																															if u8 then
																																u8:Cancel();
																																return;
																															end;
																														end;
																													elseif p18:IsDescendantOf(player.PlayerGui) then
																														if p18 then
																															if not p18.Parent then
																																u7:disconnect();
																																v54:Destroy();
																																if u8 then
																																	u8:Cancel();
																																	return;
																																end;
																															end;
																														else
																															u7:disconnect();
																															v54:Destroy();
																															if u8 then
																																u8:Cancel();
																																return;
																															end;
																														end;
																													else
																														u7:disconnect();
																														v54:Destroy();
																														if u8 then
																															u8:Cancel();
																															return;
																														end;
																													end;
																												elseif p18:IsDescendantOf(player.PlayerGui) then
																													if p18 then
																														if not p18.Parent then
																															u7:disconnect();
																															v54:Destroy();
																															if u8 then
																																u8:Cancel();
																																return;
																															end;
																														end;
																													else
																														u7:disconnect();
																														v54:Destroy();
																														if u8 then
																															u8:Cancel();
																															return;
																														end;
																													end;
																												else
																													u7:disconnect();
																													v54:Destroy();
																													if u8 then
																														u8:Cancel();
																														return;
																													end;
																												end;
																											elseif p18 then
																												if not p18.Parent then
																													u7:disconnect();
																													v54:Destroy();
																													if u8 then
																														u8:Cancel();
																														return;
																													end;
																												end;
																											else
																												u7:disconnect();
																												v54:Destroy();
																												if u8 then
																													u8:Cancel();
																													return;
																												end;
																											end;
																										else
																											u7:disconnect();
																											v54:Destroy();
																											if u8 then
																												u8:Cancel();
																												return;
																											end;
																										end;
																									end;
																								end;
																							else
																								if v53:FindFirstChild("Animated") then
																									if not v53.Animated:FindFirstChild("Horz") then
																										v69.OffsetStudsV = v69.OffsetStudsV + u6;
																									end;
																								end;
																								v69.OffsetStudsU = v69.OffsetStudsU - u6;
																								if p20 then
																									if p20 then
																										if p20:FindFirstChild("NRPBS") then
																											if p20:FindFirstChild("Status") then
																												if p20.Status.Alive.Value then
																													if p20.NRPBS.Health.Value <= 0 then
																														if p18:IsDescendantOf(player.PlayerGui) then
																															if p18 then
																																if not p18.Parent then
																																	u7:disconnect();
																																	v54:Destroy();
																																	if u8 then
																																		u8:Cancel();
																																		return;
																																	end;
																																end;
																															else
																																u7:disconnect();
																																v54:Destroy();
																																if u8 then
																																	u8:Cancel();
																																	return;
																																end;
																															end;
																														else
																															u7:disconnect();
																															v54:Destroy();
																															if u8 then
																																u8:Cancel();
																																return;
																															end;
																														end;
																													elseif p18 then
																														if not p18.Parent then
																															u7:disconnect();
																															v54:Destroy();
																															if u8 then
																																u8:Cancel();
																																return;
																															end;
																														end;
																													else
																														u7:disconnect();
																														v54:Destroy();
																														if u8 then
																															u8:Cancel();
																															return;
																														end;
																													end;
																												elseif p18:IsDescendantOf(player.PlayerGui) then
																													if p18 then
																														if not p18.Parent then
																															u7:disconnect();
																															v54:Destroy();
																															if u8 then
																																u8:Cancel();
																																return;
																															end;
																														end;
																													else
																														u7:disconnect();
																														v54:Destroy();
																														if u8 then
																															u8:Cancel();
																															return;
																														end;
																													end;
																												else
																													u7:disconnect();
																													v54:Destroy();
																													if u8 then
																														u8:Cancel();
																														return;
																													end;
																												end;
																											elseif p18:IsDescendantOf(player.PlayerGui) then
																												if p18 then
																													if not p18.Parent then
																														u7:disconnect();
																														v54:Destroy();
																														if u8 then
																															u8:Cancel();
																															return;
																														end;
																													end;
																												else
																													u7:disconnect();
																													v54:Destroy();
																													if u8 then
																														u8:Cancel();
																														return;
																													end;
																												end;
																											else
																												u7:disconnect();
																												v54:Destroy();
																												if u8 then
																													u8:Cancel();
																													return;
																												end;
																											end;
																										elseif p18:IsDescendantOf(player.PlayerGui) then
																											if p18 then
																												if not p18.Parent then
																													u7:disconnect();
																													v54:Destroy();
																													if u8 then
																														u8:Cancel();
																														return;
																													end;
																												end;
																											else
																												u7:disconnect();
																												v54:Destroy();
																												if u8 then
																													u8:Cancel();
																													return;
																												end;
																											end;
																										else
																											u7:disconnect();
																											v54:Destroy();
																											if u8 then
																												u8:Cancel();
																												return;
																											end;
																										end;
																									elseif p18 then
																										if not p18.Parent then
																											u7:disconnect();
																											v54:Destroy();
																											if u8 then
																												u8:Cancel();
																												return;
																											end;
																										end;
																									else
																										u7:disconnect();
																										v54:Destroy();
																										if u8 then
																											u8:Cancel();
																											return;
																										end;
																									end;
																								else
																									u7:disconnect();
																									v54:Destroy();
																									if u8 then
																										u8:Cancel();
																										return;
																									end;
																								end;
																							end;
																						elseif p18:IsDescendantOf(player.PlayerGui) then
																							if player.PlayerGui.Menew.Locker.Visible then
																								if v53:FindFirstChild("Animated") then
																									if not v53.Animated:FindFirstChild("Horz") then
																										v69.OffsetStudsV = v69.OffsetStudsV + u6;
																									end;
																								end;
																								v69.OffsetStudsU = v69.OffsetStudsU - u6;
																								if p20 then
																									if p20 then
																										if p20:FindFirstChild("NRPBS") then
																											if p20:FindFirstChild("Status") then
																												if p20.Status.Alive.Value then
																													if p20.NRPBS.Health.Value <= 0 then
																														if p18:IsDescendantOf(player.PlayerGui) then
																															if p18 then
																																if not p18.Parent then
																																	u7:disconnect();
																																	v54:Destroy();
																																	if u8 then
																																		u8:Cancel();
																																		return;
																																	end;
																																end;
																															else
																																u7:disconnect();
																																v54:Destroy();
																																if u8 then
																																	u8:Cancel();
																																	return;
																																end;
																															end;
																														else
																															u7:disconnect();
																															v54:Destroy();
																															if u8 then
																																u8:Cancel();
																																return;
																															end;
																														end;
																													elseif p18 then
																														if not p18.Parent then
																															u7:disconnect();
																															v54:Destroy();
																															if u8 then
																																u8:Cancel();
																																return;
																															end;
																														end;
																													else
																														u7:disconnect();
																														v54:Destroy();
																														if u8 then
																															u8:Cancel();
																															return;
																														end;
																													end;
																												elseif p18:IsDescendantOf(player.PlayerGui) then
																													if p18 then
																														if not p18.Parent then
																															u7:disconnect();
																															v54:Destroy();
																															if u8 then
																																u8:Cancel();
																																return;
																															end;
																														end;
																													else
																														u7:disconnect();
																														v54:Destroy();
																														if u8 then
																															u8:Cancel();
																															return;
																														end;
																													end;
																												else
																													u7:disconnect();
																													v54:Destroy();
																													if u8 then
																														u8:Cancel();
																														return;
																													end;
																												end;
																											elseif p18:IsDescendantOf(player.PlayerGui) then
																												if p18 then
																													if not p18.Parent then
																														u7:disconnect();
																														v54:Destroy();
																														if u8 then
																															u8:Cancel();
																															return;
																														end;
																													end;
																												else
																													u7:disconnect();
																													v54:Destroy();
																													if u8 then
																														u8:Cancel();
																														return;
																													end;
																												end;
																											else
																												u7:disconnect();
																												v54:Destroy();
																												if u8 then
																													u8:Cancel();
																													return;
																												end;
																											end;
																										elseif p18:IsDescendantOf(player.PlayerGui) then
																											if p18 then
																												if not p18.Parent then
																													u7:disconnect();
																													v54:Destroy();
																													if u8 then
																														u8:Cancel();
																														return;
																													end;
																												end;
																											else
																												u7:disconnect();
																												v54:Destroy();
																												if u8 then
																													u8:Cancel();
																													return;
																												end;
																											end;
																										else
																											u7:disconnect();
																											v54:Destroy();
																											if u8 then
																												u8:Cancel();
																												return;
																											end;
																										end;
																									elseif p18 then
																										if not p18.Parent then
																											u7:disconnect();
																											v54:Destroy();
																											if u8 then
																												u8:Cancel();
																												return;
																											end;
																										end;
																									else
																										u7:disconnect();
																										v54:Destroy();
																										if u8 then
																											u8:Cancel();
																											return;
																										end;
																									end;
																								else
																									u7:disconnect();
																									v54:Destroy();
																									if u8 then
																										u8:Cancel();
																										return;
																									end;
																								end;
																							end;
																						end;
																					else
																						u7:disconnect();
																						v54:Destroy();
																						if u8 then
																							u8:Cancel();
																						end;
																					end;
																				else
																					u7:disconnect();
																					v54:Destroy();
																					if u8 then
																						u8:Cancel();
																					end;
																				end;
																			end);
																		elseif v53:FindFirstChild("Align") then
																			u9 = nil;
																			u10 = nil;
																			u9 = v43:GetPropertyChangedSignal("Value"):connect(function()
																				if p18 then
																					if p18.Parent then
																						if not p18:IsDescendantOf(player.PlayerGui) then
																							if not u5(v55) then
																								if p18:IsDescendantOf(player.PlayerGui) then
																									if player.PlayerGui.Menew.Locker.Visible then
																										u4(v63, v69);
																										if p20 then
																											if p20 then
																												if p20:FindFirstChild("NRPBS") then
																													if p20:FindFirstChild("Status") then
																														if p20.Status.Alive.Value then
																															if p20.NRPBS.Health.Value <= 0 then
																																if p18:IsDescendantOf(player.PlayerGui) then
																																	if p18 then
																																		if not p18.Parent then
																																			u9:disconnect();
																																			v54:Destroy();
																																			if u10 then
																																				u10:Cancel();
																																				return;
																																			end;
																																		end;
																																	else
																																		u9:disconnect();
																																		v54:Destroy();
																																		if u10 then
																																			u10:Cancel();
																																			return;
																																		end;
																																	end;
																																else
																																	u9:disconnect();
																																	v54:Destroy();
																																	if u10 then
																																		u10:Cancel();
																																		return;
																																	end;
																																end;
																															elseif p18 then
																																if not p18.Parent then
																																	u9:disconnect();
																																	v54:Destroy();
																																	if u10 then
																																		u10:Cancel();
																																		return;
																																	end;
																																end;
																															else
																																u9:disconnect();
																																v54:Destroy();
																																if u10 then
																																	u10:Cancel();
																																	return;
																																end;
																															end;
																														elseif p18:IsDescendantOf(player.PlayerGui) then
																															if p18 then
																																if not p18.Parent then
																																	u9:disconnect();
																																	v54:Destroy();
																																	if u10 then
																																		u10:Cancel();
																																		return;
																																	end;
																																end;
																															else
																																u9:disconnect();
																																v54:Destroy();
																																if u10 then
																																	u10:Cancel();
																																	return;
																																end;
																															end;
																														else
																															u9:disconnect();
																															v54:Destroy();
																															if u10 then
																																u10:Cancel();
																																return;
																															end;
																														end;
																													elseif p18:IsDescendantOf(player.PlayerGui) then
																														if p18 then
																															if not p18.Parent then
																																u9:disconnect();
																																v54:Destroy();
																																if u10 then
																																	u10:Cancel();
																																	return;
																																end;
																															end;
																														else
																															u9:disconnect();
																															v54:Destroy();
																															if u10 then
																																u10:Cancel();
																																return;
																															end;
																														end;
																													else
																														u9:disconnect();
																														v54:Destroy();
																														if u10 then
																															u10:Cancel();
																															return;
																														end;
																													end;
																												elseif p18:IsDescendantOf(player.PlayerGui) then
																													if p18 then
																														if not p18.Parent then
																															u9:disconnect();
																															v54:Destroy();
																															if u10 then
																																u10:Cancel();
																																return;
																															end;
																														end;
																													else
																														u9:disconnect();
																														v54:Destroy();
																														if u10 then
																															u10:Cancel();
																															return;
																														end;
																													end;
																												else
																													u9:disconnect();
																													v54:Destroy();
																													if u10 then
																														u10:Cancel();
																														return;
																													end;
																												end;
																											elseif p18 then
																												if not p18.Parent then
																													u9:disconnect();
																													v54:Destroy();
																													if u10 then
																														u10:Cancel();
																														return;
																													end;
																												end;
																											else
																												u9:disconnect();
																												v54:Destroy();
																												if u10 then
																													u10:Cancel();
																													return;
																												end;
																											end;
																										else
																											u9:disconnect();
																											v54:Destroy();
																											if u10 then
																												u10:Cancel();
																												return;
																											end;
																										end;
																									end;
																								end;
																							else
																								u4(v63, v69);
																								if p20 then
																									if p20 then
																										if p20:FindFirstChild("NRPBS") then
																											if p20:FindFirstChild("Status") then
																												if p20.Status.Alive.Value then
																													if p20.NRPBS.Health.Value <= 0 then
																														if p18:IsDescendantOf(player.PlayerGui) then
																															if p18 then
																																if not p18.Parent then
																																	u9:disconnect();
																																	v54:Destroy();
																																	if u10 then
																																		u10:Cancel();
																																		return;
																																	end;
																																end;
																															else
																																u9:disconnect();
																																v54:Destroy();
																																if u10 then
																																	u10:Cancel();
																																	return;
																																end;
																															end;
																														else
																															u9:disconnect();
																															v54:Destroy();
																															if u10 then
																																u10:Cancel();
																																return;
																															end;
																														end;
																													elseif p18 then
																														if not p18.Parent then
																															u9:disconnect();
																															v54:Destroy();
																															if u10 then
																																u10:Cancel();
																																return;
																															end;
																														end;
																													else
																														u9:disconnect();
																														v54:Destroy();
																														if u10 then
																															u10:Cancel();
																															return;
																														end;
																													end;
																												elseif p18:IsDescendantOf(player.PlayerGui) then
																													if p18 then
																														if not p18.Parent then
																															u9:disconnect();
																															v54:Destroy();
																															if u10 then
																																u10:Cancel();
																																return;
																															end;
																														end;
																													else
																														u9:disconnect();
																														v54:Destroy();
																														if u10 then
																															u10:Cancel();
																															return;
																														end;
																													end;
																												else
																													u9:disconnect();
																													v54:Destroy();
																													if u10 then
																														u10:Cancel();
																														return;
																													end;
																												end;
																											elseif p18:IsDescendantOf(player.PlayerGui) then
																												if p18 then
																													if not p18.Parent then
																														u9:disconnect();
																														v54:Destroy();
																														if u10 then
																															u10:Cancel();
																															return;
																														end;
																													end;
																												else
																													u9:disconnect();
																													v54:Destroy();
																													if u10 then
																														u10:Cancel();
																														return;
																													end;
																												end;
																											else
																												u9:disconnect();
																												v54:Destroy();
																												if u10 then
																													u10:Cancel();
																													return;
																												end;
																											end;
																										elseif p18:IsDescendantOf(player.PlayerGui) then
																											if p18 then
																												if not p18.Parent then
																													u9:disconnect();
																													v54:Destroy();
																													if u10 then
																														u10:Cancel();
																														return;
																													end;
																												end;
																											else
																												u9:disconnect();
																												v54:Destroy();
																												if u10 then
																													u10:Cancel();
																													return;
																												end;
																											end;
																										else
																											u9:disconnect();
																											v54:Destroy();
																											if u10 then
																												u10:Cancel();
																												return;
																											end;
																										end;
																									elseif p18 then
																										if not p18.Parent then
																											u9:disconnect();
																											v54:Destroy();
																											if u10 then
																												u10:Cancel();
																												return;
																											end;
																										end;
																									else
																										u9:disconnect();
																										v54:Destroy();
																										if u10 then
																											u10:Cancel();
																											return;
																										end;
																									end;
																								else
																									u9:disconnect();
																									v54:Destroy();
																									if u10 then
																										u10:Cancel();
																										return;
																									end;
																								end;
																							end;
																						elseif p18:IsDescendantOf(player.PlayerGui) then
																							if player.PlayerGui.Menew.Locker.Visible then
																								u4(v63, v69);
																								if p20 then
																									if p20 then
																										if p20:FindFirstChild("NRPBS") then
																											if p20:FindFirstChild("Status") then
																												if p20.Status.Alive.Value then
																													if p20.NRPBS.Health.Value <= 0 then
																														if p18:IsDescendantOf(player.PlayerGui) then
																															if p18 then
																																if not p18.Parent then
																																	u9:disconnect();
																																	v54:Destroy();
																																	if u10 then
																																		u10:Cancel();
																																		return;
																																	end;
																																end;
																															else
																																u9:disconnect();
																																v54:Destroy();
																																if u10 then
																																	u10:Cancel();
																																	return;
																																end;
																															end;
																														else
																															u9:disconnect();
																															v54:Destroy();
																															if u10 then
																																u10:Cancel();
																																return;
																															end;
																														end;
																													elseif p18 then
																														if not p18.Parent then
																															u9:disconnect();
																															v54:Destroy();
																															if u10 then
																																u10:Cancel();
																																return;
																															end;
																														end;
																													else
																														u9:disconnect();
																														v54:Destroy();
																														if u10 then
																															u10:Cancel();
																															return;
																														end;
																													end;
																												elseif p18:IsDescendantOf(player.PlayerGui) then
																													if p18 then
																														if not p18.Parent then
																															u9:disconnect();
																															v54:Destroy();
																															if u10 then
																																u10:Cancel();
																																return;
																															end;
																														end;
																													else
																														u9:disconnect();
																														v54:Destroy();
																														if u10 then
																															u10:Cancel();
																															return;
																														end;
																													end;
																												else
																													u9:disconnect();
																													v54:Destroy();
																													if u10 then
																														u10:Cancel();
																														return;
																													end;
																												end;
																											elseif p18:IsDescendantOf(player.PlayerGui) then
																												if p18 then
																													if not p18.Parent then
																														u9:disconnect();
																														v54:Destroy();
																														if u10 then
																															u10:Cancel();
																															return;
																														end;
																													end;
																												else
																													u9:disconnect();
																													v54:Destroy();
																													if u10 then
																														u10:Cancel();
																														return;
																													end;
																												end;
																											else
																												u9:disconnect();
																												v54:Destroy();
																												if u10 then
																													u10:Cancel();
																													return;
																												end;
																											end;
																										elseif p18:IsDescendantOf(player.PlayerGui) then
																											if p18 then
																												if not p18.Parent then
																													u9:disconnect();
																													v54:Destroy();
																													if u10 then
																														u10:Cancel();
																														return;
																													end;
																												end;
																											else
																												u9:disconnect();
																												v54:Destroy();
																												if u10 then
																													u10:Cancel();
																													return;
																												end;
																											end;
																										else
																											u9:disconnect();
																											v54:Destroy();
																											if u10 then
																												u10:Cancel();
																												return;
																											end;
																										end;
																									elseif p18 then
																										if not p18.Parent then
																											u9:disconnect();
																											v54:Destroy();
																											if u10 then
																												u10:Cancel();
																												return;
																											end;
																										end;
																									else
																										u9:disconnect();
																										v54:Destroy();
																										if u10 then
																											u10:Cancel();
																											return;
																										end;
																									end;
																								else
																									u9:disconnect();
																									v54:Destroy();
																									if u10 then
																										u10:Cancel();
																										return;
																									end;
																								end;
																							end;
																						end;
																					else
																						u9:disconnect();
																						v54:Destroy();
																						if u10 then
																							u10:Cancel();
																						end;
																					end;
																				else
																					u9:disconnect();
																					v54:Destroy();
																					if u10 then
																						u10:Cancel();
																					end;
																				end;
																			end);
																		end;
																		if v53:FindFirstChild("Sizer") then
																			u11 = nil;
																			u12 = nil;
																			u11 = v54:GetPropertyChangedSignal("Value"):connect(function()
																				if p18 then
																					if p18.Parent then
																						if not p18:IsDescendantOf(player.PlayerGui) then
																							if not u5(v55) then
																								if p18:IsDescendantOf(player.PlayerGui) then
																									if player.PlayerGui.Menew.Locker.Visible then
																										v69.StudsPerTileU = v54.Value;
																										v69.StudsPerTileV = v54.Value;
																										if p20 then
																											if p20 then
																												if p20:FindFirstChild("NRPBS") then
																													if p20:FindFirstChild("Status") then
																														if p20.Status.Alive.Value then
																															if p20.NRPBS.Health.Value <= 0 then
																																if p18:IsDescendantOf(player.PlayerGui) then
																																	if p18 then
																																		if not p18.Parent then
																																			u11:disconnect();
																																			v54:Destroy();
																																			if u12 then
																																				u12:Cancel();
																																				return;
																																			end;
																																		end;
																																	else
																																		u11:disconnect();
																																		v54:Destroy();
																																		if u12 then
																																			u12:Cancel();
																																			return;
																																		end;
																																	end;
																																else
																																	u11:disconnect();
																																	v54:Destroy();
																																	if u12 then
																																		u12:Cancel();
																																		return;
																																	end;
																																end;
																															elseif p18 then
																																if not p18.Parent then
																																	u11:disconnect();
																																	v54:Destroy();
																																	if u12 then
																																		u12:Cancel();
																																		return;
																																	end;
																																end;
																															else
																																u11:disconnect();
																																v54:Destroy();
																																if u12 then
																																	u12:Cancel();
																																	return;
																																end;
																															end;
																														elseif p18:IsDescendantOf(player.PlayerGui) then
																															if p18 then
																																if not p18.Parent then
																																	u11:disconnect();
																																	v54:Destroy();
																																	if u12 then
																																		u12:Cancel();
																																		return;
																																	end;
																																end;
																															else
																																u11:disconnect();
																																v54:Destroy();
																																if u12 then
																																	u12:Cancel();
																																	return;
																																end;
																															end;
																														else
																															u11:disconnect();
																															v54:Destroy();
																															if u12 then
																																u12:Cancel();
																																return;
																															end;
																														end;
																													elseif p18:IsDescendantOf(player.PlayerGui) then
																														if p18 then
																															if not p18.Parent then
																																u11:disconnect();
																																v54:Destroy();
																																if u12 then
																																	u12:Cancel();
																																	return;
																																end;
																															end;
																														else
																															u11:disconnect();
																															v54:Destroy();
																															if u12 then
																																u12:Cancel();
																																return;
																															end;
																														end;
																													else
																														u11:disconnect();
																														v54:Destroy();
																														if u12 then
																															u12:Cancel();
																															return;
																														end;
																													end;
																												elseif p18:IsDescendantOf(player.PlayerGui) then
																													if p18 then
																														if not p18.Parent then
																															u11:disconnect();
																															v54:Destroy();
																															if u12 then
																																u12:Cancel();
																																return;
																															end;
																														end;
																													else
																														u11:disconnect();
																														v54:Destroy();
																														if u12 then
																															u12:Cancel();
																															return;
																														end;
																													end;
																												else
																													u11:disconnect();
																													v54:Destroy();
																													if u12 then
																														u12:Cancel();
																														return;
																													end;
																												end;
																											elseif p18 then
																												if not p18.Parent then
																													u11:disconnect();
																													v54:Destroy();
																													if u12 then
																														u12:Cancel();
																														return;
																													end;
																												end;
																											else
																												u11:disconnect();
																												v54:Destroy();
																												if u12 then
																													u12:Cancel();
																													return;
																												end;
																											end;
																										else
																											u11:disconnect();
																											v54:Destroy();
																											if u12 then
																												u12:Cancel();
																												return;
																											end;
																										end;
																									end;
																								end;
																							else
																								v69.StudsPerTileU = v54.Value;
																								v69.StudsPerTileV = v54.Value;
																								if p20 then
																									if p20 then
																										if p20:FindFirstChild("NRPBS") then
																											if p20:FindFirstChild("Status") then
																												if p20.Status.Alive.Value then
																													if p20.NRPBS.Health.Value <= 0 then
																														if p18:IsDescendantOf(player.PlayerGui) then
																															if p18 then
																																if not p18.Parent then
																																	u11:disconnect();
																																	v54:Destroy();
																																	if u12 then
																																		u12:Cancel();
																																		return;
																																	end;
																																end;
																															else
																																u11:disconnect();
																																v54:Destroy();
																																if u12 then
																																	u12:Cancel();
																																	return;
																																end;
																															end;
																														else
																															u11:disconnect();
																															v54:Destroy();
																															if u12 then
																																u12:Cancel();
																																return;
																															end;
																														end;
																													elseif p18 then
																														if not p18.Parent then
																															u11:disconnect();
																															v54:Destroy();
																															if u12 then
																																u12:Cancel();
																																return;
																															end;
																														end;
																													else
																														u11:disconnect();
																														v54:Destroy();
																														if u12 then
																															u12:Cancel();
																															return;
																														end;
																													end;
																												elseif p18:IsDescendantOf(player.PlayerGui) then
																													if p18 then
																														if not p18.Parent then
																															u11:disconnect();
																															v54:Destroy();
																															if u12 then
																																u12:Cancel();
																																return;
																															end;
																														end;
																													else
																														u11:disconnect();
																														v54:Destroy();
																														if u12 then
																															u12:Cancel();
																															return;
																														end;
																													end;
																												else
																													u11:disconnect();
																													v54:Destroy();
																													if u12 then
																														u12:Cancel();
																														return;
																													end;
																												end;
																											elseif p18:IsDescendantOf(player.PlayerGui) then
																												if p18 then
																													if not p18.Parent then
																														u11:disconnect();
																														v54:Destroy();
																														if u12 then
																															u12:Cancel();
																															return;
																														end;
																													end;
																												else
																													u11:disconnect();
																													v54:Destroy();
																													if u12 then
																														u12:Cancel();
																														return;
																													end;
																												end;
																											else
																												u11:disconnect();
																												v54:Destroy();
																												if u12 then
																													u12:Cancel();
																													return;
																												end;
																											end;
																										elseif p18:IsDescendantOf(player.PlayerGui) then
																											if p18 then
																												if not p18.Parent then
																													u11:disconnect();
																													v54:Destroy();
																													if u12 then
																														u12:Cancel();
																														return;
																													end;
																												end;
																											else
																												u11:disconnect();
																												v54:Destroy();
																												if u12 then
																													u12:Cancel();
																													return;
																												end;
																											end;
																										else
																											u11:disconnect();
																											v54:Destroy();
																											if u12 then
																												u12:Cancel();
																												return;
																											end;
																										end;
																									elseif p18 then
																										if not p18.Parent then
																											u11:disconnect();
																											v54:Destroy();
																											if u12 then
																												u12:Cancel();
																												return;
																											end;
																										end;
																									else
																										u11:disconnect();
																										v54:Destroy();
																										if u12 then
																											u12:Cancel();
																											return;
																										end;
																									end;
																								else
																									u11:disconnect();
																									v54:Destroy();
																									if u12 then
																										u12:Cancel();
																										return;
																									end;
																								end;
																							end;
																						elseif p18:IsDescendantOf(player.PlayerGui) then
																							if player.PlayerGui.Menew.Locker.Visible then
																								v69.StudsPerTileU = v54.Value;
																								v69.StudsPerTileV = v54.Value;
																								if p20 then
																									if p20 then
																										if p20:FindFirstChild("NRPBS") then
																											if p20:FindFirstChild("Status") then
																												if p20.Status.Alive.Value then
																													if p20.NRPBS.Health.Value <= 0 then
																														if p18:IsDescendantOf(player.PlayerGui) then
																															if p18 then
																																if not p18.Parent then
																																	u11:disconnect();
																																	v54:Destroy();
																																	if u12 then
																																		u12:Cancel();
																																		return;
																																	end;
																																end;
																															else
																																u11:disconnect();
																																v54:Destroy();
																																if u12 then
																																	u12:Cancel();
																																	return;
																																end;
																															end;
																														else
																															u11:disconnect();
																															v54:Destroy();
																															if u12 then
																																u12:Cancel();
																																return;
																															end;
																														end;
																													elseif p18 then
																														if not p18.Parent then
																															u11:disconnect();
																															v54:Destroy();
																															if u12 then
																																u12:Cancel();
																																return;
																															end;
																														end;
																													else
																														u11:disconnect();
																														v54:Destroy();
																														if u12 then
																															u12:Cancel();
																															return;
																														end;
																													end;
																												elseif p18:IsDescendantOf(player.PlayerGui) then
																													if p18 then
																														if not p18.Parent then
																															u11:disconnect();
																															v54:Destroy();
																															if u12 then
																																u12:Cancel();
																																return;
																															end;
																														end;
																													else
																														u11:disconnect();
																														v54:Destroy();
																														if u12 then
																															u12:Cancel();
																															return;
																														end;
																													end;
																												else
																													u11:disconnect();
																													v54:Destroy();
																													if u12 then
																														u12:Cancel();
																														return;
																													end;
																												end;
																											elseif p18:IsDescendantOf(player.PlayerGui) then
																												if p18 then
																													if not p18.Parent then
																														u11:disconnect();
																														v54:Destroy();
																														if u12 then
																															u12:Cancel();
																															return;
																														end;
																													end;
																												else
																													u11:disconnect();
																													v54:Destroy();
																													if u12 then
																														u12:Cancel();
																														return;
																													end;
																												end;
																											else
																												u11:disconnect();
																												v54:Destroy();
																												if u12 then
																													u12:Cancel();
																													return;
																												end;
																											end;
																										elseif p18:IsDescendantOf(player.PlayerGui) then
																											if p18 then
																												if not p18.Parent then
																													u11:disconnect();
																													v54:Destroy();
																													if u12 then
																														u12:Cancel();
																														return;
																													end;
																												end;
																											else
																												u11:disconnect();
																												v54:Destroy();
																												if u12 then
																													u12:Cancel();
																													return;
																												end;
																											end;
																										else
																											u11:disconnect();
																											v54:Destroy();
																											if u12 then
																												u12:Cancel();
																												return;
																											end;
																										end;
																									elseif p18 then
																										if not p18.Parent then
																											u11:disconnect();
																											v54:Destroy();
																											if u12 then
																												u12:Cancel();
																												return;
																											end;
																										end;
																									else
																										u11:disconnect();
																										v54:Destroy();
																										if u12 then
																											u12:Cancel();
																											return;
																										end;
																									end;
																								else
																									u11:disconnect();
																									v54:Destroy();
																									if u12 then
																										u12:Cancel();
																										return;
																									end;
																								end;
																							end;
																						end;
																					else
																						u11:disconnect();
																						v54:Destroy();
																						if u12 then
																							u12:Cancel();
																						end;
																					end;
																				else
																					u11:disconnect();
																					v54:Destroy();
																					if u12 then
																						u12:Cancel();
																					end;
																				end;
																			end);
																		end;
																	end;																
																end;
															end;
														elseif v63.Material ~= Enum.Material.Wood then
															if not v55 then
																v55 = v63;
															end;
															v64, v65, v66 = pairs(v51);
															while true do
																v67, v68 = v64(v65, v66);
																if v67 then

																else
																	break;
																end;
																v69 = script.Skin:Clone();
																v69.Texture = v53.Value;
																v69.Color3 = v53.Shade.Value;
																v69.StudsPerTileU = v53.Scale.Value;
																v69.StudsPerTileV = v53.Scale.Value;
																v69.Face = v68;
																v69.Parent = v63;
																u4(v63, v69);
																if not v53:FindFirstChild("No") then
																	if p20 then
																		if p20.Character then
																			if p20.Character:FindFirstChild("Body Colors") then
																				l__TorsoColor3__70 = p20.Character["Body Colors"].TorsoColor3;
																				v71 = v53:FindFirstChild("Multiplier") and v53.Multiplier.Value or 1;
																				v69.Color3 = Color3.new(l__TorsoColor3__70.r * v71, l__TorsoColor3__70.g * v71, l__TorsoColor3__70.b * v71);
																			elseif v53:FindFirstChild("Multiplier") then
																				l__Value__72 = v53.Shade.Value;
																				v73 = v53:FindFirstChild("Multiplier") and v53.Multiplier.Value or 1;
																				v69.Color3 = Color3.new(l__Value__72.r * v73, l__Value__72.g * v73, l__Value__72.b * v73);
																			end;
																		elseif v53:FindFirstChild("Multiplier") then
																			l__Value__72 = v53.Shade.Value;
																			v73 = v53:FindFirstChild("Multiplier") and v53.Multiplier.Value or 1;
																			v69.Color3 = Color3.new(l__Value__72.r * v73, l__Value__72.g * v73, l__Value__72.b * v73);
																		end;
																	elseif v53:FindFirstChild("Multiplier") then
																		l__Value__72 = v53.Shade.Value;
																		v73 = v53:FindFirstChild("Multiplier") and v53.Multiplier.Value or 1;
																		v69.Color3 = Color3.new(l__Value__72.r * v73, l__Value__72.g * v73, l__Value__72.b * v73);
																	end;
																elseif v53:FindFirstChild("Multiplier") then
																	l__Value__72 = v53.Shade.Value;
																	v73 = v53:FindFirstChild("Multiplier") and v53.Multiplier.Value or 1;
																	v69.Color3 = Color3.new(l__Value__72.r * v73, l__Value__72.g * v73, l__Value__72.b * v73);
																end;
																if v53:FindFirstChild("Neon") then
																	v63.Material = Enum.Material.Neon;
																	v63.BrickColor = v53.Neon.Value;
																end;
																if v53:FindFirstChild("Colored") then
																	v63.BrickColor = v53.Colored.Value;
																end;
																if v53:FindFirstChild("Material") then
																	v63.Material = v53.Material.Value;
																end;
																if v48 then
																	v69.Color3 = Color3.new(1, 1, 1);
																end;
																if p20 == player then
																	if v53:FindFirstChild("Animated") then
																		v74 = v43:GetPropertyChangedSignal("Value");
																		u6 = v53.Animated:FindFirstChild("Speed") and v53.Animated.Speed.Value or 0.01;
																		u7 = nil;
																		u8 = nil;
																		u7 = v74:connect(function()
																			if p18 then
																				if p18.Parent then
																					if not p18:IsDescendantOf(player.PlayerGui) then
																						if not u5(v55) then
																							if p18:IsDescendantOf(player.PlayerGui) then
																								if player.PlayerGui.Menew.Locker.Visible then
																									if v53:FindFirstChild("Animated") then
																										if not v53.Animated:FindFirstChild("Horz") then
																											v69.OffsetStudsV = v69.OffsetStudsV + u6;
																										end;
																									end;
																									v69.OffsetStudsU = v69.OffsetStudsU - u6;
																									if p20 then
																										if p20 then
																											if p20:FindFirstChild("NRPBS") then
																												if p20:FindFirstChild("Status") then
																													if p20.Status.Alive.Value then
																														if p20.NRPBS.Health.Value <= 0 then
																															if p18:IsDescendantOf(player.PlayerGui) then
																																if p18 then
																																	if not p18.Parent then
																																		u7:disconnect();
																																		v54:Destroy();
																																		if u8 then
																																			u8:Cancel();
																																			return;
																																		end;
																																	end;
																																else
																																	u7:disconnect();
																																	v54:Destroy();
																																	if u8 then
																																		u8:Cancel();
																																		return;
																																	end;
																																end;
																															else
																																u7:disconnect();
																																v54:Destroy();
																																if u8 then
																																	u8:Cancel();
																																	return;
																																end;
																															end;
																														elseif p18 then
																															if not p18.Parent then
																																u7:disconnect();
																																v54:Destroy();
																																if u8 then
																																	u8:Cancel();
																																	return;
																																end;
																															end;
																														else
																															u7:disconnect();
																															v54:Destroy();
																															if u8 then
																																u8:Cancel();
																																return;
																															end;
																														end;
																													elseif p18:IsDescendantOf(player.PlayerGui) then
																														if p18 then
																															if not p18.Parent then
																																u7:disconnect();
																																v54:Destroy();
																																if u8 then
																																	u8:Cancel();
																																	return;
																																end;
																															end;
																														else
																															u7:disconnect();
																															v54:Destroy();
																															if u8 then
																																u8:Cancel();
																																return;
																															end;
																														end;
																													else
																														u7:disconnect();
																														v54:Destroy();
																														if u8 then
																															u8:Cancel();
																															return;
																														end;
																													end;
																												elseif p18:IsDescendantOf(player.PlayerGui) then
																													if p18 then
																														if not p18.Parent then
																															u7:disconnect();
																															v54:Destroy();
																															if u8 then
																																u8:Cancel();
																																return;
																															end;
																														end;
																													else
																														u7:disconnect();
																														v54:Destroy();
																														if u8 then
																															u8:Cancel();
																															return;
																														end;
																													end;
																												else
																													u7:disconnect();
																													v54:Destroy();
																													if u8 then
																														u8:Cancel();
																														return;
																													end;
																												end;
																											elseif p18:IsDescendantOf(player.PlayerGui) then
																												if p18 then
																													if not p18.Parent then
																														u7:disconnect();
																														v54:Destroy();
																														if u8 then
																															u8:Cancel();
																															return;
																														end;
																													end;
																												else
																													u7:disconnect();
																													v54:Destroy();
																													if u8 then
																														u8:Cancel();
																														return;
																													end;
																												end;
																											else
																												u7:disconnect();
																												v54:Destroy();
																												if u8 then
																													u8:Cancel();
																													return;
																												end;
																											end;
																										elseif p18 then
																											if not p18.Parent then
																												u7:disconnect();
																												v54:Destroy();
																												if u8 then
																													u8:Cancel();
																													return;
																												end;
																											end;
																										else
																											u7:disconnect();
																											v54:Destroy();
																											if u8 then
																												u8:Cancel();
																												return;
																											end;
																										end;
																									else
																										u7:disconnect();
																										v54:Destroy();
																										if u8 then
																											u8:Cancel();
																											return;
																										end;
																									end;
																								end;
																							end;
																						else
																							if v53:FindFirstChild("Animated") then
																								if not v53.Animated:FindFirstChild("Horz") then
																									v69.OffsetStudsV = v69.OffsetStudsV + u6;
																								end;
																							end;
																							v69.OffsetStudsU = v69.OffsetStudsU - u6;
																							if p20 then
																								if p20 then
																									if p20:FindFirstChild("NRPBS") then
																										if p20:FindFirstChild("Status") then
																											if p20.Status.Alive.Value then
																												if p20.NRPBS.Health.Value <= 0 then
																													if p18:IsDescendantOf(player.PlayerGui) then
																														if p18 then
																															if not p18.Parent then
																																u7:disconnect();
																																v54:Destroy();
																																if u8 then
																																	u8:Cancel();
																																	return;
																																end;
																															end;
																														else
																															u7:disconnect();
																															v54:Destroy();
																															if u8 then
																																u8:Cancel();
																																return;
																															end;
																														end;
																													else
																														u7:disconnect();
																														v54:Destroy();
																														if u8 then
																															u8:Cancel();
																															return;
																														end;
																													end;
																												elseif p18 then
																													if not p18.Parent then
																														u7:disconnect();
																														v54:Destroy();
																														if u8 then
																															u8:Cancel();
																															return;
																														end;
																													end;
																												else
																													u7:disconnect();
																													v54:Destroy();
																													if u8 then
																														u8:Cancel();
																														return;
																													end;
																												end;
																											elseif p18:IsDescendantOf(player.PlayerGui) then
																												if p18 then
																													if not p18.Parent then
																														u7:disconnect();
																														v54:Destroy();
																														if u8 then
																															u8:Cancel();
																															return;
																														end;
																													end;
																												else
																													u7:disconnect();
																													v54:Destroy();
																													if u8 then
																														u8:Cancel();
																														return;
																													end;
																												end;
																											else
																												u7:disconnect();
																												v54:Destroy();
																												if u8 then
																													u8:Cancel();
																													return;
																												end;
																											end;
																										elseif p18:IsDescendantOf(player.PlayerGui) then
																											if p18 then
																												if not p18.Parent then
																													u7:disconnect();
																													v54:Destroy();
																													if u8 then
																														u8:Cancel();
																														return;
																													end;
																												end;
																											else
																												u7:disconnect();
																												v54:Destroy();
																												if u8 then
																													u8:Cancel();
																													return;
																												end;
																											end;
																										else
																											u7:disconnect();
																											v54:Destroy();
																											if u8 then
																												u8:Cancel();
																												return;
																											end;
																										end;
																									elseif p18:IsDescendantOf(player.PlayerGui) then
																										if p18 then
																											if not p18.Parent then
																												u7:disconnect();
																												v54:Destroy();
																												if u8 then
																													u8:Cancel();
																													return;
																												end;
																											end;
																										else
																											u7:disconnect();
																											v54:Destroy();
																											if u8 then
																												u8:Cancel();
																												return;
																											end;
																										end;
																									else
																										u7:disconnect();
																										v54:Destroy();
																										if u8 then
																											u8:Cancel();
																											return;
																										end;
																									end;
																								elseif p18 then
																									if not p18.Parent then
																										u7:disconnect();
																										v54:Destroy();
																										if u8 then
																											u8:Cancel();
																											return;
																										end;
																									end;
																								else
																									u7:disconnect();
																									v54:Destroy();
																									if u8 then
																										u8:Cancel();
																										return;
																									end;
																								end;
																							else
																								u7:disconnect();
																								v54:Destroy();
																								if u8 then
																									u8:Cancel();
																									return;
																								end;
																							end;
																						end;
																					elseif p18:IsDescendantOf(player.PlayerGui) then
																						if player.PlayerGui.Menew.Locker.Visible then
																							if v53:FindFirstChild("Animated") then
																								if not v53.Animated:FindFirstChild("Horz") then
																									v69.OffsetStudsV = v69.OffsetStudsV + u6;
																								end;
																							end;
																							v69.OffsetStudsU = v69.OffsetStudsU - u6;
																							if p20 then
																								if p20 then
																									if p20:FindFirstChild("NRPBS") then
																										if p20:FindFirstChild("Status") then
																											if p20.Status.Alive.Value then
																												if p20.NRPBS.Health.Value <= 0 then
																													if p18:IsDescendantOf(player.PlayerGui) then
																														if p18 then
																															if not p18.Parent then
																																u7:disconnect();
																																v54:Destroy();
																																if u8 then
																																	u8:Cancel();
																																	return;
																																end;
																															end;
																														else
																															u7:disconnect();
																															v54:Destroy();
																															if u8 then
																																u8:Cancel();
																																return;
																															end;
																														end;
																													else
																														u7:disconnect();
																														v54:Destroy();
																														if u8 then
																															u8:Cancel();
																															return;
																														end;
																													end;
																												elseif p18 then
																													if not p18.Parent then
																														u7:disconnect();
																														v54:Destroy();
																														if u8 then
																															u8:Cancel();
																															return;
																														end;
																													end;
																												else
																													u7:disconnect();
																													v54:Destroy();
																													if u8 then
																														u8:Cancel();
																														return;
																													end;
																												end;
																											elseif p18:IsDescendantOf(player.PlayerGui) then
																												if p18 then
																													if not p18.Parent then
																														u7:disconnect();
																														v54:Destroy();
																														if u8 then
																															u8:Cancel();
																															return;
																														end;
																													end;
																												else
																													u7:disconnect();
																													v54:Destroy();
																													if u8 then
																														u8:Cancel();
																														return;
																													end;
																												end;
																											else
																												u7:disconnect();
																												v54:Destroy();
																												if u8 then
																													u8:Cancel();
																													return;
																												end;
																											end;
																										elseif p18:IsDescendantOf(player.PlayerGui) then
																											if p18 then
																												if not p18.Parent then
																													u7:disconnect();
																													v54:Destroy();
																													if u8 then
																														u8:Cancel();
																														return;
																													end;
																												end;
																											else
																												u7:disconnect();
																												v54:Destroy();
																												if u8 then
																													u8:Cancel();
																													return;
																												end;
																											end;
																										else
																											u7:disconnect();
																											v54:Destroy();
																											if u8 then
																												u8:Cancel();
																												return;
																											end;
																										end;
																									elseif p18:IsDescendantOf(player.PlayerGui) then
																										if p18 then
																											if not p18.Parent then
																												u7:disconnect();
																												v54:Destroy();
																												if u8 then
																													u8:Cancel();
																													return;
																												end;
																											end;
																										else
																											u7:disconnect();
																											v54:Destroy();
																											if u8 then
																												u8:Cancel();
																												return;
																											end;
																										end;
																									else
																										u7:disconnect();
																										v54:Destroy();
																										if u8 then
																											u8:Cancel();
																											return;
																										end;
																									end;
																								elseif p18 then
																									if not p18.Parent then
																										u7:disconnect();
																										v54:Destroy();
																										if u8 then
																											u8:Cancel();
																											return;
																										end;
																									end;
																								else
																									u7:disconnect();
																									v54:Destroy();
																									if u8 then
																										u8:Cancel();
																										return;
																									end;
																								end;
																							else
																								u7:disconnect();
																								v54:Destroy();
																								if u8 then
																									u8:Cancel();
																									return;
																								end;
																							end;
																						end;
																					end;
																				else
																					u7:disconnect();
																					v54:Destroy();
																					if u8 then
																						u8:Cancel();
																					end;
																				end;
																			else
																				u7:disconnect();
																				v54:Destroy();
																				if u8 then
																					u8:Cancel();
																				end;
																			end;
																		end);
																	elseif v53:FindFirstChild("Align") then
																		u9 = nil;
																		u10 = nil;
																		u9 = v43:GetPropertyChangedSignal("Value"):connect(function()
																			if p18 then
																				if p18.Parent then
																					if not p18:IsDescendantOf(player.PlayerGui) then
																						if not u5(v55) then
																							if p18:IsDescendantOf(player.PlayerGui) then
																								if player.PlayerGui.Menew.Locker.Visible then
																									u4(v63, v69);
																									if p20 then
																										if p20 then
																											if p20:FindFirstChild("NRPBS") then
																												if p20:FindFirstChild("Status") then
																													if p20.Status.Alive.Value then
																														if p20.NRPBS.Health.Value <= 0 then
																															if p18:IsDescendantOf(player.PlayerGui) then
																																if p18 then
																																	if not p18.Parent then
																																		u9:disconnect();
																																		v54:Destroy();
																																		if u10 then
																																			u10:Cancel();
																																			return;
																																		end;
																																	end;
																																else
																																	u9:disconnect();
																																	v54:Destroy();
																																	if u10 then
																																		u10:Cancel();
																																		return;
																																	end;
																																end;
																															else
																																u9:disconnect();
																																v54:Destroy();
																																if u10 then
																																	u10:Cancel();
																																	return;
																																end;
																															end;
																														elseif p18 then
																															if not p18.Parent then
																																u9:disconnect();
																																v54:Destroy();
																																if u10 then
																																	u10:Cancel();
																																	return;
																																end;
																															end;
																														else
																															u9:disconnect();
																															v54:Destroy();
																															if u10 then
																																u10:Cancel();
																																return;
																															end;
																														end;
																													elseif p18:IsDescendantOf(player.PlayerGui) then
																														if p18 then
																															if not p18.Parent then
																																u9:disconnect();
																																v54:Destroy();
																																if u10 then
																																	u10:Cancel();
																																	return;
																																end;
																															end;
																														else
																															u9:disconnect();
																															v54:Destroy();
																															if u10 then
																																u10:Cancel();
																																return;
																															end;
																														end;
																													else
																														u9:disconnect();
																														v54:Destroy();
																														if u10 then
																															u10:Cancel();
																															return;
																														end;
																													end;
																												elseif p18:IsDescendantOf(player.PlayerGui) then
																													if p18 then
																														if not p18.Parent then
																															u9:disconnect();
																															v54:Destroy();
																															if u10 then
																																u10:Cancel();
																																return;
																															end;
																														end;
																													else
																														u9:disconnect();
																														v54:Destroy();
																														if u10 then
																															u10:Cancel();
																															return;
																														end;
																													end;
																												else
																													u9:disconnect();
																													v54:Destroy();
																													if u10 then
																														u10:Cancel();
																														return;
																													end;
																												end;
																											elseif p18:IsDescendantOf(player.PlayerGui) then
																												if p18 then
																													if not p18.Parent then
																														u9:disconnect();
																														v54:Destroy();
																														if u10 then
																															u10:Cancel();
																															return;
																														end;
																													end;
																												else
																													u9:disconnect();
																													v54:Destroy();
																													if u10 then
																														u10:Cancel();
																														return;
																													end;
																												end;
																											else
																												u9:disconnect();
																												v54:Destroy();
																												if u10 then
																													u10:Cancel();
																													return;
																												end;
																											end;
																										elseif p18 then
																											if not p18.Parent then
																												u9:disconnect();
																												v54:Destroy();
																												if u10 then
																													u10:Cancel();
																													return;
																												end;
																											end;
																										else
																											u9:disconnect();
																											v54:Destroy();
																											if u10 then
																												u10:Cancel();
																												return;
																											end;
																										end;
																									else
																										u9:disconnect();
																										v54:Destroy();
																										if u10 then
																											u10:Cancel();
																											return;
																										end;
																									end;
																								end;
																							end;
																						else
																							u4(v63, v69);
																							if p20 then
																								if p20 then
																									if p20:FindFirstChild("NRPBS") then
																										if p20:FindFirstChild("Status") then
																											if p20.Status.Alive.Value then
																												if p20.NRPBS.Health.Value <= 0 then
																													if p18:IsDescendantOf(player.PlayerGui) then
																														if p18 then
																															if not p18.Parent then
																																u9:disconnect();
																																v54:Destroy();
																																if u10 then
																																	u10:Cancel();
																																	return;
																																end;
																															end;
																														else
																															u9:disconnect();
																															v54:Destroy();
																															if u10 then
																																u10:Cancel();
																																return;
																															end;
																														end;
																													else
																														u9:disconnect();
																														v54:Destroy();
																														if u10 then
																															u10:Cancel();
																															return;
																														end;
																													end;
																												elseif p18 then
																													if not p18.Parent then
																														u9:disconnect();
																														v54:Destroy();
																														if u10 then
																															u10:Cancel();
																															return;
																														end;
																													end;
																												else
																													u9:disconnect();
																													v54:Destroy();
																													if u10 then
																														u10:Cancel();
																														return;
																													end;
																												end;
																											elseif p18:IsDescendantOf(player.PlayerGui) then
																												if p18 then
																													if not p18.Parent then
																														u9:disconnect();
																														v54:Destroy();
																														if u10 then
																															u10:Cancel();
																															return;
																														end;
																													end;
																												else
																													u9:disconnect();
																													v54:Destroy();
																													if u10 then
																														u10:Cancel();
																														return;
																													end;
																												end;
																											else
																												u9:disconnect();
																												v54:Destroy();
																												if u10 then
																													u10:Cancel();
																													return;
																												end;
																											end;
																										elseif p18:IsDescendantOf(player.PlayerGui) then
																											if p18 then
																												if not p18.Parent then
																													u9:disconnect();
																													v54:Destroy();
																													if u10 then
																														u10:Cancel();
																														return;
																													end;
																												end;
																											else
																												u9:disconnect();
																												v54:Destroy();
																												if u10 then
																													u10:Cancel();
																													return;
																												end;
																											end;
																										else
																											u9:disconnect();
																											v54:Destroy();
																											if u10 then
																												u10:Cancel();
																												return;
																											end;
																										end;
																									elseif p18:IsDescendantOf(player.PlayerGui) then
																										if p18 then
																											if not p18.Parent then
																												u9:disconnect();
																												v54:Destroy();
																												if u10 then
																													u10:Cancel();
																													return;
																												end;
																											end;
																										else
																											u9:disconnect();
																											v54:Destroy();
																											if u10 then
																												u10:Cancel();
																												return;
																											end;
																										end;
																									else
																										u9:disconnect();
																										v54:Destroy();
																										if u10 then
																											u10:Cancel();
																											return;
																										end;
																									end;
																								elseif p18 then
																									if not p18.Parent then
																										u9:disconnect();
																										v54:Destroy();
																										if u10 then
																											u10:Cancel();
																											return;
																										end;
																									end;
																								else
																									u9:disconnect();
																									v54:Destroy();
																									if u10 then
																										u10:Cancel();
																										return;
																									end;
																								end;
																							else
																								u9:disconnect();
																								v54:Destroy();
																								if u10 then
																									u10:Cancel();
																									return;
																								end;
																							end;
																						end;
																					elseif p18:IsDescendantOf(player.PlayerGui) then
																						if player.PlayerGui.Menew.Locker.Visible then
																							u4(v63, v69);
																							if p20 then
																								if p20 then
																									if p20:FindFirstChild("NRPBS") then
																										if p20:FindFirstChild("Status") then
																											if p20.Status.Alive.Value then
																												if p20.NRPBS.Health.Value <= 0 then
																													if p18:IsDescendantOf(player.PlayerGui) then
																														if p18 then
																															if not p18.Parent then
																																u9:disconnect();
																																v54:Destroy();
																																if u10 then
																																	u10:Cancel();
																																	return;
																																end;
																															end;
																														else
																															u9:disconnect();
																															v54:Destroy();
																															if u10 then
																																u10:Cancel();
																																return;
																															end;
																														end;
																													else
																														u9:disconnect();
																														v54:Destroy();
																														if u10 then
																															u10:Cancel();
																															return;
																														end;
																													end;
																												elseif p18 then
																													if not p18.Parent then
																														u9:disconnect();
																														v54:Destroy();
																														if u10 then
																															u10:Cancel();
																															return;
																														end;
																													end;
																												else
																													u9:disconnect();
																													v54:Destroy();
																													if u10 then
																														u10:Cancel();
																														return;
																													end;
																												end;
																											elseif p18:IsDescendantOf(player.PlayerGui) then
																												if p18 then
																													if not p18.Parent then
																														u9:disconnect();
																														v54:Destroy();
																														if u10 then
																															u10:Cancel();
																															return;
																														end;
																													end;
																												else
																													u9:disconnect();
																													v54:Destroy();
																													if u10 then
																														u10:Cancel();
																														return;
																													end;
																												end;
																											else
																												u9:disconnect();
																												v54:Destroy();
																												if u10 then
																													u10:Cancel();
																													return;
																												end;
																											end;
																										elseif p18:IsDescendantOf(player.PlayerGui) then
																											if p18 then
																												if not p18.Parent then
																													u9:disconnect();
																													v54:Destroy();
																													if u10 then
																														u10:Cancel();
																														return;
																													end;
																												end;
																											else
																												u9:disconnect();
																												v54:Destroy();
																												if u10 then
																													u10:Cancel();
																													return;
																												end;
																											end;
																										else
																											u9:disconnect();
																											v54:Destroy();
																											if u10 then
																												u10:Cancel();
																												return;
																											end;
																										end;
																									elseif p18:IsDescendantOf(player.PlayerGui) then
																										if p18 then
																											if not p18.Parent then
																												u9:disconnect();
																												v54:Destroy();
																												if u10 then
																													u10:Cancel();
																													return;
																												end;
																											end;
																										else
																											u9:disconnect();
																											v54:Destroy();
																											if u10 then
																												u10:Cancel();
																												return;
																											end;
																										end;
																									else
																										u9:disconnect();
																										v54:Destroy();
																										if u10 then
																											u10:Cancel();
																											return;
																										end;
																									end;
																								elseif p18 then
																									if not p18.Parent then
																										u9:disconnect();
																										v54:Destroy();
																										if u10 then
																											u10:Cancel();
																											return;
																										end;
																									end;
																								else
																									u9:disconnect();
																									v54:Destroy();
																									if u10 then
																										u10:Cancel();
																										return;
																									end;
																								end;
																							else
																								u9:disconnect();
																								v54:Destroy();
																								if u10 then
																									u10:Cancel();
																									return;
																								end;
																							end;
																						end;
																					end;
																				else
																					u9:disconnect();
																					v54:Destroy();
																					if u10 then
																						u10:Cancel();
																					end;
																				end;
																			else
																				u9:disconnect();
																				v54:Destroy();
																				if u10 then
																					u10:Cancel();
																				end;
																			end;
																		end);
																	end;
																	if v53:FindFirstChild("Sizer") then
																		u11 = nil;
																		u12 = nil;
																		u11 = v54:GetPropertyChangedSignal("Value"):connect(function()
																			if p18 then
																				if p18.Parent then
																					if not p18:IsDescendantOf(player.PlayerGui) then
																						if not u5(v55) then
																							if p18:IsDescendantOf(player.PlayerGui) then
																								if player.PlayerGui.Menew.Locker.Visible then
																									v69.StudsPerTileU = v54.Value;
																									v69.StudsPerTileV = v54.Value;
																									if p20 then
																										if p20 then
																											if p20:FindFirstChild("NRPBS") then
																												if p20:FindFirstChild("Status") then
																													if p20.Status.Alive.Value then
																														if p20.NRPBS.Health.Value <= 0 then
																															if p18:IsDescendantOf(player.PlayerGui) then
																																if p18 then
																																	if not p18.Parent then
																																		u11:disconnect();
																																		v54:Destroy();
																																		if u12 then
																																			u12:Cancel();
																																			return;
																																		end;
																																	end;
																																else
																																	u11:disconnect();
																																	v54:Destroy();
																																	if u12 then
																																		u12:Cancel();
																																		return;
																																	end;
																																end;
																															else
																																u11:disconnect();
																																v54:Destroy();
																																if u12 then
																																	u12:Cancel();
																																	return;
																																end;
																															end;
																														elseif p18 then
																															if not p18.Parent then
																																u11:disconnect();
																																v54:Destroy();
																																if u12 then
																																	u12:Cancel();
																																	return;
																																end;
																															end;
																														else
																															u11:disconnect();
																															v54:Destroy();
																															if u12 then
																																u12:Cancel();
																																return;
																															end;
																														end;
																													elseif p18:IsDescendantOf(player.PlayerGui) then
																														if p18 then
																															if not p18.Parent then
																																u11:disconnect();
																																v54:Destroy();
																																if u12 then
																																	u12:Cancel();
																																	return;
																																end;
																															end;
																														else
																															u11:disconnect();
																															v54:Destroy();
																															if u12 then
																																u12:Cancel();
																																return;
																															end;
																														end;
																													else
																														u11:disconnect();
																														v54:Destroy();
																														if u12 then
																															u12:Cancel();
																															return;
																														end;
																													end;
																												elseif p18:IsDescendantOf(player.PlayerGui) then
																													if p18 then
																														if not p18.Parent then
																															u11:disconnect();
																															v54:Destroy();
																															if u12 then
																																u12:Cancel();
																																return;
																															end;
																														end;
																													else
																														u11:disconnect();
																														v54:Destroy();
																														if u12 then
																															u12:Cancel();
																															return;
																														end;
																													end;
																												else
																													u11:disconnect();
																													v54:Destroy();
																													if u12 then
																														u12:Cancel();
																														return;
																													end;
																												end;
																											elseif p18:IsDescendantOf(player.PlayerGui) then
																												if p18 then
																													if not p18.Parent then
																														u11:disconnect();
																														v54:Destroy();
																														if u12 then
																															u12:Cancel();
																															return;
																														end;
																													end;
																												else
																													u11:disconnect();
																													v54:Destroy();
																													if u12 then
																														u12:Cancel();
																														return;
																													end;
																												end;
																											else
																												u11:disconnect();
																												v54:Destroy();
																												if u12 then
																													u12:Cancel();
																													return;
																												end;
																											end;
																										elseif p18 then
																											if not p18.Parent then
																												u11:disconnect();
																												v54:Destroy();
																												if u12 then
																													u12:Cancel();
																													return;
																												end;
																											end;
																										else
																											u11:disconnect();
																											v54:Destroy();
																											if u12 then
																												u12:Cancel();
																												return;
																											end;
																										end;
																									else
																										u11:disconnect();
																										v54:Destroy();
																										if u12 then
																											u12:Cancel();
																											return;
																										end;
																									end;
																								end;
																							end;
																						else
																							v69.StudsPerTileU = v54.Value;
																							v69.StudsPerTileV = v54.Value;
																							if p20 then
																								if p20 then
																									if p20:FindFirstChild("NRPBS") then
																										if p20:FindFirstChild("Status") then
																											if p20.Status.Alive.Value then
																												if p20.NRPBS.Health.Value <= 0 then
																													if p18:IsDescendantOf(player.PlayerGui) then
																														if p18 then
																															if not p18.Parent then
																																u11:disconnect();
																																v54:Destroy();
																																if u12 then
																																	u12:Cancel();
																																	return;
																																end;
																															end;
																														else
																															u11:disconnect();
																															v54:Destroy();
																															if u12 then
																																u12:Cancel();
																																return;
																															end;
																														end;
																													else
																														u11:disconnect();
																														v54:Destroy();
																														if u12 then
																															u12:Cancel();
																															return;
																														end;
																													end;
																												elseif p18 then
																													if not p18.Parent then
																														u11:disconnect();
																														v54:Destroy();
																														if u12 then
																															u12:Cancel();
																															return;
																														end;
																													end;
																												else
																													u11:disconnect();
																													v54:Destroy();
																													if u12 then
																														u12:Cancel();
																														return;
																													end;
																												end;
																											elseif p18:IsDescendantOf(player.PlayerGui) then
																												if p18 then
																													if not p18.Parent then
																														u11:disconnect();
																														v54:Destroy();
																														if u12 then
																															u12:Cancel();
																															return;
																														end;
																													end;
																												else
																													u11:disconnect();
																													v54:Destroy();
																													if u12 then
																														u12:Cancel();
																														return;
																													end;
																												end;
																											else
																												u11:disconnect();
																												v54:Destroy();
																												if u12 then
																													u12:Cancel();
																													return;
																												end;
																											end;
																										elseif p18:IsDescendantOf(player.PlayerGui) then
																											if p18 then
																												if not p18.Parent then
																													u11:disconnect();
																													v54:Destroy();
																													if u12 then
																														u12:Cancel();
																														return;
																													end;
																												end;
																											else
																												u11:disconnect();
																												v54:Destroy();
																												if u12 then
																													u12:Cancel();
																													return;
																												end;
																											end;
																										else
																											u11:disconnect();
																											v54:Destroy();
																											if u12 then
																												u12:Cancel();
																												return;
																											end;
																										end;
																									elseif p18:IsDescendantOf(player.PlayerGui) then
																										if p18 then
																											if not p18.Parent then
																												u11:disconnect();
																												v54:Destroy();
																												if u12 then
																													u12:Cancel();
																													return;
																												end;
																											end;
																										else
																											u11:disconnect();
																											v54:Destroy();
																											if u12 then
																												u12:Cancel();
																												return;
																											end;
																										end;
																									else
																										u11:disconnect();
																										v54:Destroy();
																										if u12 then
																											u12:Cancel();
																											return;
																										end;
																									end;
																								elseif p18 then
																									if not p18.Parent then
																										u11:disconnect();
																										v54:Destroy();
																										if u12 then
																											u12:Cancel();
																											return;
																										end;
																									end;
																								else
																									u11:disconnect();
																									v54:Destroy();
																									if u12 then
																										u12:Cancel();
																										return;
																									end;
																								end;
																							else
																								u11:disconnect();
																								v54:Destroy();
																								if u12 then
																									u12:Cancel();
																									return;
																								end;
																							end;
																						end;
																					elseif p18:IsDescendantOf(player.PlayerGui) then
																						if player.PlayerGui.Menew.Locker.Visible then
																							v69.StudsPerTileU = v54.Value;
																							v69.StudsPerTileV = v54.Value;
																							if p20 then
																								if p20 then
																									if p20:FindFirstChild("NRPBS") then
																										if p20:FindFirstChild("Status") then
																											if p20.Status.Alive.Value then
																												if p20.NRPBS.Health.Value <= 0 then
																													if p18:IsDescendantOf(player.PlayerGui) then
																														if p18 then
																															if not p18.Parent then
																																u11:disconnect();
																																v54:Destroy();
																																if u12 then
																																	u12:Cancel();
																																	return;
																																end;
																															end;
																														else
																															u11:disconnect();
																															v54:Destroy();
																															if u12 then
																																u12:Cancel();
																																return;
																															end;
																														end;
																													else
																														u11:disconnect();
																														v54:Destroy();
																														if u12 then
																															u12:Cancel();
																															return;
																														end;
																													end;
																												elseif p18 then
																													if not p18.Parent then
																														u11:disconnect();
																														v54:Destroy();
																														if u12 then
																															u12:Cancel();
																															return;
																														end;
																													end;
																												else
																													u11:disconnect();
																													v54:Destroy();
																													if u12 then
																														u12:Cancel();
																														return;
																													end;
																												end;
																											elseif p18:IsDescendantOf(player.PlayerGui) then
																												if p18 then
																													if not p18.Parent then
																														u11:disconnect();
																														v54:Destroy();
																														if u12 then
																															u12:Cancel();
																															return;
																														end;
																													end;
																												else
																													u11:disconnect();
																													v54:Destroy();
																													if u12 then
																														u12:Cancel();
																														return;
																													end;
																												end;
																											else
																												u11:disconnect();
																												v54:Destroy();
																												if u12 then
																													u12:Cancel();
																													return;
																												end;
																											end;
																										elseif p18:IsDescendantOf(player.PlayerGui) then
																											if p18 then
																												if not p18.Parent then
																													u11:disconnect();
																													v54:Destroy();
																													if u12 then
																														u12:Cancel();
																														return;
																													end;
																												end;
																											else
																												u11:disconnect();
																												v54:Destroy();
																												if u12 then
																													u12:Cancel();
																													return;
																												end;
																											end;
																										else
																											u11:disconnect();
																											v54:Destroy();
																											if u12 then
																												u12:Cancel();
																												return;
																											end;
																										end;
																									elseif p18:IsDescendantOf(player.PlayerGui) then
																										if p18 then
																											if not p18.Parent then
																												u11:disconnect();
																												v54:Destroy();
																												if u12 then
																													u12:Cancel();
																													return;
																												end;
																											end;
																										else
																											u11:disconnect();
																											v54:Destroy();
																											if u12 then
																												u12:Cancel();
																												return;
																											end;
																										end;
																									else
																										u11:disconnect();
																										v54:Destroy();
																										if u12 then
																											u12:Cancel();
																											return;
																										end;
																									end;
																								elseif p18 then
																									if not p18.Parent then
																										u11:disconnect();
																										v54:Destroy();
																										if u12 then
																											u12:Cancel();
																											return;
																										end;
																									end;
																								else
																									u11:disconnect();
																									v54:Destroy();
																									if u12 then
																										u12:Cancel();
																										return;
																									end;
																								end;
																							else
																								u11:disconnect();
																								v54:Destroy();
																								if u12 then
																									u12:Cancel();
																									return;
																								end;
																							end;
																						end;
																					end;
																				else
																					u11:disconnect();
																					v54:Destroy();
																					if u12 then
																						u12:Cancel();
																					end;
																				end;
																			else
																				u11:disconnect();
																				v54:Destroy();
																				if u12 then
																					u12:Cancel();
																				end;
																			end;
																		end);
																	end;
																end;															
															end;
														end;
													elseif v63.Material ~= Enum.Material.Wood then
														if not v55 then
															v55 = v63;
														end;
														v64, v65, v66 = pairs(v51);
														while true do
															v67, v68 = v64(v65, v66);
															if v67 then

															else
																break;
															end;
															v69 = script.Skin:Clone();
															v69.Texture = v53.Value;
															v69.Color3 = v53.Shade.Value;
															v69.StudsPerTileU = v53.Scale.Value;
															v69.StudsPerTileV = v53.Scale.Value;
															v69.Face = v68;
															v69.Parent = v63;
															u4(v63, v69);
															if not v53:FindFirstChild("No") then
																if p20 then
																	if p20.Character then
																		if p20.Character:FindFirstChild("Body Colors") then
																			l__TorsoColor3__70 = p20.Character["Body Colors"].TorsoColor3;
																			v71 = v53:FindFirstChild("Multiplier") and v53.Multiplier.Value or 1;
																			v69.Color3 = Color3.new(l__TorsoColor3__70.r * v71, l__TorsoColor3__70.g * v71, l__TorsoColor3__70.b * v71);
																		elseif v53:FindFirstChild("Multiplier") then
																			l__Value__72 = v53.Shade.Value;
																			v73 = v53:FindFirstChild("Multiplier") and v53.Multiplier.Value or 1;
																			v69.Color3 = Color3.new(l__Value__72.r * v73, l__Value__72.g * v73, l__Value__72.b * v73);
																		end;
																	elseif v53:FindFirstChild("Multiplier") then
																		l__Value__72 = v53.Shade.Value;
																		v73 = v53:FindFirstChild("Multiplier") and v53.Multiplier.Value or 1;
																		v69.Color3 = Color3.new(l__Value__72.r * v73, l__Value__72.g * v73, l__Value__72.b * v73);
																	end;
																elseif v53:FindFirstChild("Multiplier") then
																	l__Value__72 = v53.Shade.Value;
																	v73 = v53:FindFirstChild("Multiplier") and v53.Multiplier.Value or 1;
																	v69.Color3 = Color3.new(l__Value__72.r * v73, l__Value__72.g * v73, l__Value__72.b * v73);
																end;
															elseif v53:FindFirstChild("Multiplier") then
																l__Value__72 = v53.Shade.Value;
																v73 = v53:FindFirstChild("Multiplier") and v53.Multiplier.Value or 1;
																v69.Color3 = Color3.new(l__Value__72.r * v73, l__Value__72.g * v73, l__Value__72.b * v73);
															end;
															if v53:FindFirstChild("Neon") then
																v63.Material = Enum.Material.Neon;
																v63.BrickColor = v53.Neon.Value;
															end;
															if v53:FindFirstChild("Colored") then
																v63.BrickColor = v53.Colored.Value;
															end;
															if v53:FindFirstChild("Material") then
																v63.Material = v53.Material.Value;
															end;
															if v48 then
																v69.Color3 = Color3.new(1, 1, 1);
															end;
															if p20 == player then
																if v53:FindFirstChild("Animated") then
																	v74 = v43:GetPropertyChangedSignal("Value");
																	u6 = v53.Animated:FindFirstChild("Speed") and v53.Animated.Speed.Value or 0.01;
																	u7 = nil;
																	u8 = nil;
																	u7 = v74:connect(function()
																		if p18 then
																			if p18.Parent then
																				if not p18:IsDescendantOf(player.PlayerGui) then
																					if not u5(v55) then
																						if p18:IsDescendantOf(player.PlayerGui) then
																							if player.PlayerGui.Menew.Locker.Visible then
																								if v53:FindFirstChild("Animated") then
																									if not v53.Animated:FindFirstChild("Horz") then
																										v69.OffsetStudsV = v69.OffsetStudsV + u6;
																									end;
																								end;
																								v69.OffsetStudsU = v69.OffsetStudsU - u6;
																								if p20 then
																									if p20 then
																										if p20:FindFirstChild("NRPBS") then
																											if p20:FindFirstChild("Status") then
																												if p20.Status.Alive.Value then
																													if p20.NRPBS.Health.Value <= 0 then
																														if p18:IsDescendantOf(player.PlayerGui) then
																															if p18 then
																																if not p18.Parent then
																																	u7:disconnect();
																																	v54:Destroy();
																																	if u8 then
																																		u8:Cancel();
																																		return;
																																	end;
																																end;
																															else
																																u7:disconnect();
																																v54:Destroy();
																																if u8 then
																																	u8:Cancel();
																																	return;
																																end;
																															end;
																														else
																															u7:disconnect();
																															v54:Destroy();
																															if u8 then
																																u8:Cancel();
																																return;
																															end;
																														end;
																													elseif p18 then
																														if not p18.Parent then
																															u7:disconnect();
																															v54:Destroy();
																															if u8 then
																																u8:Cancel();
																																return;
																															end;
																														end;
																													else
																														u7:disconnect();
																														v54:Destroy();
																														if u8 then
																															u8:Cancel();
																															return;
																														end;
																													end;
																												elseif p18:IsDescendantOf(player.PlayerGui) then
																													if p18 then
																														if not p18.Parent then
																															u7:disconnect();
																															v54:Destroy();
																															if u8 then
																																u8:Cancel();
																																return;
																															end;
																														end;
																													else
																														u7:disconnect();
																														v54:Destroy();
																														if u8 then
																															u8:Cancel();
																															return;
																														end;
																													end;
																												else
																													u7:disconnect();
																													v54:Destroy();
																													if u8 then
																														u8:Cancel();
																														return;
																													end;
																												end;
																											elseif p18:IsDescendantOf(player.PlayerGui) then
																												if p18 then
																													if not p18.Parent then
																														u7:disconnect();
																														v54:Destroy();
																														if u8 then
																															u8:Cancel();
																															return;
																														end;
																													end;
																												else
																													u7:disconnect();
																													v54:Destroy();
																													if u8 then
																														u8:Cancel();
																														return;
																													end;
																												end;
																											else
																												u7:disconnect();
																												v54:Destroy();
																												if u8 then
																													u8:Cancel();
																													return;
																												end;
																											end;
																										elseif p18:IsDescendantOf(player.PlayerGui) then
																											if p18 then
																												if not p18.Parent then
																													u7:disconnect();
																													v54:Destroy();
																													if u8 then
																														u8:Cancel();
																														return;
																													end;
																												end;
																											else
																												u7:disconnect();
																												v54:Destroy();
																												if u8 then
																													u8:Cancel();
																													return;
																												end;
																											end;
																										else
																											u7:disconnect();
																											v54:Destroy();
																											if u8 then
																												u8:Cancel();
																												return;
																											end;
																										end;
																									elseif p18 then
																										if not p18.Parent then
																											u7:disconnect();
																											v54:Destroy();
																											if u8 then
																												u8:Cancel();
																												return;
																											end;
																										end;
																									else
																										u7:disconnect();
																										v54:Destroy();
																										if u8 then
																											u8:Cancel();
																											return;
																										end;
																									end;
																								else
																									u7:disconnect();
																									v54:Destroy();
																									if u8 then
																										u8:Cancel();
																										return;
																									end;
																								end;
																							end;
																						end;
																					else
																						if v53:FindFirstChild("Animated") then
																							if not v53.Animated:FindFirstChild("Horz") then
																								v69.OffsetStudsV = v69.OffsetStudsV + u6;
																							end;
																						end;
																						v69.OffsetStudsU = v69.OffsetStudsU - u6;
																						if p20 then
																							if p20 then
																								if p20:FindFirstChild("NRPBS") then
																									if p20:FindFirstChild("Status") then
																										if p20.Status.Alive.Value then
																											if p20.NRPBS.Health.Value <= 0 then
																												if p18:IsDescendantOf(player.PlayerGui) then
																													if p18 then
																														if not p18.Parent then
																															u7:disconnect();
																															v54:Destroy();
																															if u8 then
																																u8:Cancel();
																																return;
																															end;
																														end;
																													else
																														u7:disconnect();
																														v54:Destroy();
																														if u8 then
																															u8:Cancel();
																															return;
																														end;
																													end;
																												else
																													u7:disconnect();
																													v54:Destroy();
																													if u8 then
																														u8:Cancel();
																														return;
																													end;
																												end;
																											elseif p18 then
																												if not p18.Parent then
																													u7:disconnect();
																													v54:Destroy();
																													if u8 then
																														u8:Cancel();
																														return;
																													end;
																												end;
																											else
																												u7:disconnect();
																												v54:Destroy();
																												if u8 then
																													u8:Cancel();
																													return;
																												end;
																											end;
																										elseif p18:IsDescendantOf(player.PlayerGui) then
																											if p18 then
																												if not p18.Parent then
																													u7:disconnect();
																													v54:Destroy();
																													if u8 then
																														u8:Cancel();
																														return;
																													end;
																												end;
																											else
																												u7:disconnect();
																												v54:Destroy();
																												if u8 then
																													u8:Cancel();
																													return;
																												end;
																											end;
																										else
																											u7:disconnect();
																											v54:Destroy();
																											if u8 then
																												u8:Cancel();
																												return;
																											end;
																										end;
																									elseif p18:IsDescendantOf(player.PlayerGui) then
																										if p18 then
																											if not p18.Parent then
																												u7:disconnect();
																												v54:Destroy();
																												if u8 then
																													u8:Cancel();
																													return;
																												end;
																											end;
																										else
																											u7:disconnect();
																											v54:Destroy();
																											if u8 then
																												u8:Cancel();
																												return;
																											end;
																										end;
																									else
																										u7:disconnect();
																										v54:Destroy();
																										if u8 then
																											u8:Cancel();
																											return;
																										end;
																									end;
																								elseif p18:IsDescendantOf(player.PlayerGui) then
																									if p18 then
																										if not p18.Parent then
																											u7:disconnect();
																											v54:Destroy();
																											if u8 then
																												u8:Cancel();
																												return;
																											end;
																										end;
																									else
																										u7:disconnect();
																										v54:Destroy();
																										if u8 then
																											u8:Cancel();
																											return;
																										end;
																									end;
																								else
																									u7:disconnect();
																									v54:Destroy();
																									if u8 then
																										u8:Cancel();
																										return;
																									end;
																								end;
																							elseif p18 then
																								if not p18.Parent then
																									u7:disconnect();
																									v54:Destroy();
																									if u8 then
																										u8:Cancel();
																										return;
																									end;
																								end;
																							else
																								u7:disconnect();
																								v54:Destroy();
																								if u8 then
																									u8:Cancel();
																									return;
																								end;
																							end;
																						else
																							u7:disconnect();
																							v54:Destroy();
																							if u8 then
																								u8:Cancel();
																								return;
																							end;
																						end;
																					end;
																				elseif p18:IsDescendantOf(player.PlayerGui) then
																					if player.PlayerGui.Menew.Locker.Visible then
																						if v53:FindFirstChild("Animated") then
																							if not v53.Animated:FindFirstChild("Horz") then
																								v69.OffsetStudsV = v69.OffsetStudsV + u6;
																							end;
																						end;
																						v69.OffsetStudsU = v69.OffsetStudsU - u6;
																						if p20 then
																							if p20 then
																								if p20:FindFirstChild("NRPBS") then
																									if p20:FindFirstChild("Status") then
																										if p20.Status.Alive.Value then
																											if p20.NRPBS.Health.Value <= 0 then
																												if p18:IsDescendantOf(player.PlayerGui) then
																													if p18 then
																														if not p18.Parent then
																															u7:disconnect();
																															v54:Destroy();
																															if u8 then
																																u8:Cancel();
																																return;
																															end;
																														end;
																													else
																														u7:disconnect();
																														v54:Destroy();
																														if u8 then
																															u8:Cancel();
																															return;
																														end;
																													end;
																												else
																													u7:disconnect();
																													v54:Destroy();
																													if u8 then
																														u8:Cancel();
																														return;
																													end;
																												end;
																											elseif p18 then
																												if not p18.Parent then
																													u7:disconnect();
																													v54:Destroy();
																													if u8 then
																														u8:Cancel();
																														return;
																													end;
																												end;
																											else
																												u7:disconnect();
																												v54:Destroy();
																												if u8 then
																													u8:Cancel();
																													return;
																												end;
																											end;
																										elseif p18:IsDescendantOf(player.PlayerGui) then
																											if p18 then
																												if not p18.Parent then
																													u7:disconnect();
																													v54:Destroy();
																													if u8 then
																														u8:Cancel();
																														return;
																													end;
																												end;
																											else
																												u7:disconnect();
																												v54:Destroy();
																												if u8 then
																													u8:Cancel();
																													return;
																												end;
																											end;
																										else
																											u7:disconnect();
																											v54:Destroy();
																											if u8 then
																												u8:Cancel();
																												return;
																											end;
																										end;
																									elseif p18:IsDescendantOf(player.PlayerGui) then
																										if p18 then
																											if not p18.Parent then
																												u7:disconnect();
																												v54:Destroy();
																												if u8 then
																													u8:Cancel();
																													return;
																												end;
																											end;
																										else
																											u7:disconnect();
																											v54:Destroy();
																											if u8 then
																												u8:Cancel();
																												return;
																											end;
																										end;
																									else
																										u7:disconnect();
																										v54:Destroy();
																										if u8 then
																											u8:Cancel();
																											return;
																										end;
																									end;
																								elseif p18:IsDescendantOf(player.PlayerGui) then
																									if p18 then
																										if not p18.Parent then
																											u7:disconnect();
																											v54:Destroy();
																											if u8 then
																												u8:Cancel();
																												return;
																											end;
																										end;
																									else
																										u7:disconnect();
																										v54:Destroy();
																										if u8 then
																											u8:Cancel();
																											return;
																										end;
																									end;
																								else
																									u7:disconnect();
																									v54:Destroy();
																									if u8 then
																										u8:Cancel();
																										return;
																									end;
																								end;
																							elseif p18 then
																								if not p18.Parent then
																									u7:disconnect();
																									v54:Destroy();
																									if u8 then
																										u8:Cancel();
																										return;
																									end;
																								end;
																							else
																								u7:disconnect();
																								v54:Destroy();
																								if u8 then
																									u8:Cancel();
																									return;
																								end;
																							end;
																						else
																							u7:disconnect();
																							v54:Destroy();
																							if u8 then
																								u8:Cancel();
																								return;
																							end;
																						end;
																					end;
																				end;
																			else
																				u7:disconnect();
																				v54:Destroy();
																				if u8 then
																					u8:Cancel();
																				end;
																			end;
																		else
																			u7:disconnect();
																			v54:Destroy();
																			if u8 then
																				u8:Cancel();
																			end;
																		end;
																	end);
																elseif v53:FindFirstChild("Align") then
																	u9 = nil;
																	u10 = nil;
																	u9 = v43:GetPropertyChangedSignal("Value"):connect(function()
																		if p18 then
																			if p18.Parent then
																				if not p18:IsDescendantOf(player.PlayerGui) then
																					if not u5(v55) then
																						if p18:IsDescendantOf(player.PlayerGui) then
																							if player.PlayerGui.Menew.Locker.Visible then
																								u4(v63, v69);
																								if p20 then
																									if p20 then
																										if p20:FindFirstChild("NRPBS") then
																											if p20:FindFirstChild("Status") then
																												if p20.Status.Alive.Value then
																													if p20.NRPBS.Health.Value <= 0 then
																														if p18:IsDescendantOf(player.PlayerGui) then
																															if p18 then
																																if not p18.Parent then
																																	u9:disconnect();
																																	v54:Destroy();
																																	if u10 then
																																		u10:Cancel();
																																		return;
																																	end;
																																end;
																															else
																																u9:disconnect();
																																v54:Destroy();
																																if u10 then
																																	u10:Cancel();
																																	return;
																																end;
																															end;
																														else
																															u9:disconnect();
																															v54:Destroy();
																															if u10 then
																																u10:Cancel();
																																return;
																															end;
																														end;
																													elseif p18 then
																														if not p18.Parent then
																															u9:disconnect();
																															v54:Destroy();
																															if u10 then
																																u10:Cancel();
																																return;
																															end;
																														end;
																													else
																														u9:disconnect();
																														v54:Destroy();
																														if u10 then
																															u10:Cancel();
																															return;
																														end;
																													end;
																												elseif p18:IsDescendantOf(player.PlayerGui) then
																													if p18 then
																														if not p18.Parent then
																															u9:disconnect();
																															v54:Destroy();
																															if u10 then
																																u10:Cancel();
																																return;
																															end;
																														end;
																													else
																														u9:disconnect();
																														v54:Destroy();
																														if u10 then
																															u10:Cancel();
																															return;
																														end;
																													end;
																												else
																													u9:disconnect();
																													v54:Destroy();
																													if u10 then
																														u10:Cancel();
																														return;
																													end;
																												end;
																											elseif p18:IsDescendantOf(player.PlayerGui) then
																												if p18 then
																													if not p18.Parent then
																														u9:disconnect();
																														v54:Destroy();
																														if u10 then
																															u10:Cancel();
																															return;
																														end;
																													end;
																												else
																													u9:disconnect();
																													v54:Destroy();
																													if u10 then
																														u10:Cancel();
																														return;
																													end;
																												end;
																											else
																												u9:disconnect();
																												v54:Destroy();
																												if u10 then
																													u10:Cancel();
																													return;
																												end;
																											end;
																										elseif p18:IsDescendantOf(player.PlayerGui) then
																											if p18 then
																												if not p18.Parent then
																													u9:disconnect();
																													v54:Destroy();
																													if u10 then
																														u10:Cancel();
																														return;
																													end;
																												end;
																											else
																												u9:disconnect();
																												v54:Destroy();
																												if u10 then
																													u10:Cancel();
																													return;
																												end;
																											end;
																										else
																											u9:disconnect();
																											v54:Destroy();
																											if u10 then
																												u10:Cancel();
																												return;
																											end;
																										end;
																									elseif p18 then
																										if not p18.Parent then
																											u9:disconnect();
																											v54:Destroy();
																											if u10 then
																												u10:Cancel();
																												return;
																											end;
																										end;
																									else
																										u9:disconnect();
																										v54:Destroy();
																										if u10 then
																											u10:Cancel();
																											return;
																										end;
																									end;
																								else
																									u9:disconnect();
																									v54:Destroy();
																									if u10 then
																										u10:Cancel();
																										return;
																									end;
																								end;
																							end;
																						end;
																					else
																						u4(v63, v69);
																						if p20 then
																							if p20 then
																								if p20:FindFirstChild("NRPBS") then
																									if p20:FindFirstChild("Status") then
																										if p20.Status.Alive.Value then
																											if p20.NRPBS.Health.Value <= 0 then
																												if p18:IsDescendantOf(player.PlayerGui) then
																													if p18 then
																														if not p18.Parent then
																															u9:disconnect();
																															v54:Destroy();
																															if u10 then
																																u10:Cancel();
																																return;
																															end;
																														end;
																													else
																														u9:disconnect();
																														v54:Destroy();
																														if u10 then
																															u10:Cancel();
																															return;
																														end;
																													end;
																												else
																													u9:disconnect();
																													v54:Destroy();
																													if u10 then
																														u10:Cancel();
																														return;
																													end;
																												end;
																											elseif p18 then
																												if not p18.Parent then
																													u9:disconnect();
																													v54:Destroy();
																													if u10 then
																														u10:Cancel();
																														return;
																													end;
																												end;
																											else
																												u9:disconnect();
																												v54:Destroy();
																												if u10 then
																													u10:Cancel();
																													return;
																												end;
																											end;
																										elseif p18:IsDescendantOf(player.PlayerGui) then
																											if p18 then
																												if not p18.Parent then
																													u9:disconnect();
																													v54:Destroy();
																													if u10 then
																														u10:Cancel();
																														return;
																													end;
																												end;
																											else
																												u9:disconnect();
																												v54:Destroy();
																												if u10 then
																													u10:Cancel();
																													return;
																												end;
																											end;
																										else
																											u9:disconnect();
																											v54:Destroy();
																											if u10 then
																												u10:Cancel();
																												return;
																											end;
																										end;
																									elseif p18:IsDescendantOf(player.PlayerGui) then
																										if p18 then
																											if not p18.Parent then
																												u9:disconnect();
																												v54:Destroy();
																												if u10 then
																													u10:Cancel();
																													return;
																												end;
																											end;
																										else
																											u9:disconnect();
																											v54:Destroy();
																											if u10 then
																												u10:Cancel();
																												return;
																											end;
																										end;
																									else
																										u9:disconnect();
																										v54:Destroy();
																										if u10 then
																											u10:Cancel();
																											return;
																										end;
																									end;
																								elseif p18:IsDescendantOf(player.PlayerGui) then
																									if p18 then
																										if not p18.Parent then
																											u9:disconnect();
																											v54:Destroy();
																											if u10 then
																												u10:Cancel();
																												return;
																											end;
																										end;
																									else
																										u9:disconnect();
																										v54:Destroy();
																										if u10 then
																											u10:Cancel();
																											return;
																										end;
																									end;
																								else
																									u9:disconnect();
																									v54:Destroy();
																									if u10 then
																										u10:Cancel();
																										return;
																									end;
																								end;
																							elseif p18 then
																								if not p18.Parent then
																									u9:disconnect();
																									v54:Destroy();
																									if u10 then
																										u10:Cancel();
																										return;
																									end;
																								end;
																							else
																								u9:disconnect();
																								v54:Destroy();
																								if u10 then
																									u10:Cancel();
																									return;
																								end;
																							end;
																						else
																							u9:disconnect();
																							v54:Destroy();
																							if u10 then
																								u10:Cancel();
																								return;
																							end;
																						end;
																					end;
																				elseif p18:IsDescendantOf(player.PlayerGui) then
																					if player.PlayerGui.Menew.Locker.Visible then
																						u4(v63, v69);
																						if p20 then
																							if p20 then
																								if p20:FindFirstChild("NRPBS") then
																									if p20:FindFirstChild("Status") then
																										if p20.Status.Alive.Value then
																											if p20.NRPBS.Health.Value <= 0 then
																												if p18:IsDescendantOf(player.PlayerGui) then
																													if p18 then
																														if not p18.Parent then
																															u9:disconnect();
																															v54:Destroy();
																															if u10 then
																																u10:Cancel();
																																return;
																															end;
																														end;
																													else
																														u9:disconnect();
																														v54:Destroy();
																														if u10 then
																															u10:Cancel();
																															return;
																														end;
																													end;
																												else
																													u9:disconnect();
																													v54:Destroy();
																													if u10 then
																														u10:Cancel();
																														return;
																													end;
																												end;
																											elseif p18 then
																												if not p18.Parent then
																													u9:disconnect();
																													v54:Destroy();
																													if u10 then
																														u10:Cancel();
																														return;
																													end;
																												end;
																											else
																												u9:disconnect();
																												v54:Destroy();
																												if u10 then
																													u10:Cancel();
																													return;
																												end;
																											end;
																										elseif p18:IsDescendantOf(player.PlayerGui) then
																											if p18 then
																												if not p18.Parent then
																													u9:disconnect();
																													v54:Destroy();
																													if u10 then
																														u10:Cancel();
																														return;
																													end;
																												end;
																											else
																												u9:disconnect();
																												v54:Destroy();
																												if u10 then
																													u10:Cancel();
																													return;
																												end;
																											end;
																										else
																											u9:disconnect();
																											v54:Destroy();
																											if u10 then
																												u10:Cancel();
																												return;
																											end;
																										end;
																									elseif p18:IsDescendantOf(player.PlayerGui) then
																										if p18 then
																											if not p18.Parent then
																												u9:disconnect();
																												v54:Destroy();
																												if u10 then
																													u10:Cancel();
																													return;
																												end;
																											end;
																										else
																											u9:disconnect();
																											v54:Destroy();
																											if u10 then
																												u10:Cancel();
																												return;
																											end;
																										end;
																									else
																										u9:disconnect();
																										v54:Destroy();
																										if u10 then
																											u10:Cancel();
																											return;
																										end;
																									end;
																								elseif p18:IsDescendantOf(player.PlayerGui) then
																									if p18 then
																										if not p18.Parent then
																											u9:disconnect();
																											v54:Destroy();
																											if u10 then
																												u10:Cancel();
																												return;
																											end;
																										end;
																									else
																										u9:disconnect();
																										v54:Destroy();
																										if u10 then
																											u10:Cancel();
																											return;
																										end;
																									end;
																								else
																									u9:disconnect();
																									v54:Destroy();
																									if u10 then
																										u10:Cancel();
																										return;
																									end;
																								end;
																							elseif p18 then
																								if not p18.Parent then
																									u9:disconnect();
																									v54:Destroy();
																									if u10 then
																										u10:Cancel();
																										return;
																									end;
																								end;
																							else
																								u9:disconnect();
																								v54:Destroy();
																								if u10 then
																									u10:Cancel();
																									return;
																								end;
																							end;
																						else
																							u9:disconnect();
																							v54:Destroy();
																							if u10 then
																								u10:Cancel();
																								return;
																							end;
																						end;
																					end;
																				end;
																			else
																				u9:disconnect();
																				v54:Destroy();
																				if u10 then
																					u10:Cancel();
																				end;
																			end;
																		else
																			u9:disconnect();
																			v54:Destroy();
																			if u10 then
																				u10:Cancel();
																			end;
																		end;
																	end);
																end;
																if v53:FindFirstChild("Sizer") then
																	u11 = nil;
																	u12 = nil;
																	u11 = v54:GetPropertyChangedSignal("Value"):connect(function()
																		if p18 then
																			if p18.Parent then
																				if not p18:IsDescendantOf(player.PlayerGui) then
																					if not u5(v55) then
																						if p18:IsDescendantOf(player.PlayerGui) then
																							if player.PlayerGui.Menew.Locker.Visible then
																								v69.StudsPerTileU = v54.Value;
																								v69.StudsPerTileV = v54.Value;
																								if p20 then
																									if p20 then
																										if p20:FindFirstChild("NRPBS") then
																											if p20:FindFirstChild("Status") then
																												if p20.Status.Alive.Value then
																													if p20.NRPBS.Health.Value <= 0 then
																														if p18:IsDescendantOf(player.PlayerGui) then
																															if p18 then
																																if not p18.Parent then
																																	u11:disconnect();
																																	v54:Destroy();
																																	if u12 then
																																		u12:Cancel();
																																		return;
																																	end;
																																end;
																															else
																																u11:disconnect();
																																v54:Destroy();
																																if u12 then
																																	u12:Cancel();
																																	return;
																																end;
																															end;
																														else
																															u11:disconnect();
																															v54:Destroy();
																															if u12 then
																																u12:Cancel();
																																return;
																															end;
																														end;
																													elseif p18 then
																														if not p18.Parent then
																															u11:disconnect();
																															v54:Destroy();
																															if u12 then
																																u12:Cancel();
																																return;
																															end;
																														end;
																													else
																														u11:disconnect();
																														v54:Destroy();
																														if u12 then
																															u12:Cancel();
																															return;
																														end;
																													end;
																												elseif p18:IsDescendantOf(player.PlayerGui) then
																													if p18 then
																														if not p18.Parent then
																															u11:disconnect();
																															v54:Destroy();
																															if u12 then
																																u12:Cancel();
																																return;
																															end;
																														end;
																													else
																														u11:disconnect();
																														v54:Destroy();
																														if u12 then
																															u12:Cancel();
																															return;
																														end;
																													end;
																												else
																													u11:disconnect();
																													v54:Destroy();
																													if u12 then
																														u12:Cancel();
																														return;
																													end;
																												end;
																											elseif p18:IsDescendantOf(player.PlayerGui) then
																												if p18 then
																													if not p18.Parent then
																														u11:disconnect();
																														v54:Destroy();
																														if u12 then
																															u12:Cancel();
																															return;
																														end;
																													end;
																												else
																													u11:disconnect();
																													v54:Destroy();
																													if u12 then
																														u12:Cancel();
																														return;
																													end;
																												end;
																											else
																												u11:disconnect();
																												v54:Destroy();
																												if u12 then
																													u12:Cancel();
																													return;
																												end;
																											end;
																										elseif p18:IsDescendantOf(player.PlayerGui) then
																											if p18 then
																												if not p18.Parent then
																													u11:disconnect();
																													v54:Destroy();
																													if u12 then
																														u12:Cancel();
																														return;
																													end;
																												end;
																											else
																												u11:disconnect();
																												v54:Destroy();
																												if u12 then
																													u12:Cancel();
																													return;
																												end;
																											end;
																										else
																											u11:disconnect();
																											v54:Destroy();
																											if u12 then
																												u12:Cancel();
																												return;
																											end;
																										end;
																									elseif p18 then
																										if not p18.Parent then
																											u11:disconnect();
																											v54:Destroy();
																											if u12 then
																												u12:Cancel();
																												return;
																											end;
																										end;
																									else
																										u11:disconnect();
																										v54:Destroy();
																										if u12 then
																											u12:Cancel();
																											return;
																										end;
																									end;
																								else
																									u11:disconnect();
																									v54:Destroy();
																									if u12 then
																										u12:Cancel();
																										return;
																									end;
																								end;
																							end;
																						end;
																					else
																						v69.StudsPerTileU = v54.Value;
																						v69.StudsPerTileV = v54.Value;
																						if p20 then
																							if p20 then
																								if p20:FindFirstChild("NRPBS") then
																									if p20:FindFirstChild("Status") then
																										if p20.Status.Alive.Value then
																											if p20.NRPBS.Health.Value <= 0 then
																												if p18:IsDescendantOf(player.PlayerGui) then
																													if p18 then
																														if not p18.Parent then
																															u11:disconnect();
																															v54:Destroy();
																															if u12 then
																																u12:Cancel();
																																return;
																															end;
																														end;
																													else
																														u11:disconnect();
																														v54:Destroy();
																														if u12 then
																															u12:Cancel();
																															return;
																														end;
																													end;
																												else
																													u11:disconnect();
																													v54:Destroy();
																													if u12 then
																														u12:Cancel();
																														return;
																													end;
																												end;
																											elseif p18 then
																												if not p18.Parent then
																													u11:disconnect();
																													v54:Destroy();
																													if u12 then
																														u12:Cancel();
																														return;
																													end;
																												end;
																											else
																												u11:disconnect();
																												v54:Destroy();
																												if u12 then
																													u12:Cancel();
																													return;
																												end;
																											end;
																										elseif p18:IsDescendantOf(player.PlayerGui) then
																											if p18 then
																												if not p18.Parent then
																													u11:disconnect();
																													v54:Destroy();
																													if u12 then
																														u12:Cancel();
																														return;
																													end;
																												end;
																											else
																												u11:disconnect();
																												v54:Destroy();
																												if u12 then
																													u12:Cancel();
																													return;
																												end;
																											end;
																										else
																											u11:disconnect();
																											v54:Destroy();
																											if u12 then
																												u12:Cancel();
																												return;
																											end;
																										end;
																									elseif p18:IsDescendantOf(player.PlayerGui) then
																										if p18 then
																											if not p18.Parent then
																												u11:disconnect();
																												v54:Destroy();
																												if u12 then
																													u12:Cancel();
																													return;
																												end;
																											end;
																										else
																											u11:disconnect();
																											v54:Destroy();
																											if u12 then
																												u12:Cancel();
																												return;
																											end;
																										end;
																									else
																										u11:disconnect();
																										v54:Destroy();
																										if u12 then
																											u12:Cancel();
																											return;
																										end;
																									end;
																								elseif p18:IsDescendantOf(player.PlayerGui) then
																									if p18 then
																										if not p18.Parent then
																											u11:disconnect();
																											v54:Destroy();
																											if u12 then
																												u12:Cancel();
																												return;
																											end;
																										end;
																									else
																										u11:disconnect();
																										v54:Destroy();
																										if u12 then
																											u12:Cancel();
																											return;
																										end;
																									end;
																								else
																									u11:disconnect();
																									v54:Destroy();
																									if u12 then
																										u12:Cancel();
																										return;
																									end;
																								end;
																							elseif p18 then
																								if not p18.Parent then
																									u11:disconnect();
																									v54:Destroy();
																									if u12 then
																										u12:Cancel();
																										return;
																									end;
																								end;
																							else
																								u11:disconnect();
																								v54:Destroy();
																								if u12 then
																									u12:Cancel();
																									return;
																								end;
																							end;
																						else
																							u11:disconnect();
																							v54:Destroy();
																							if u12 then
																								u12:Cancel();
																								return;
																							end;
																						end;
																					end;
																				elseif p18:IsDescendantOf(player.PlayerGui) then
																					if player.PlayerGui.Menew.Locker.Visible then
																						v69.StudsPerTileU = v54.Value;
																						v69.StudsPerTileV = v54.Value;
																						if p20 then
																							if p20 then
																								if p20:FindFirstChild("NRPBS") then
																									if p20:FindFirstChild("Status") then
																										if p20.Status.Alive.Value then
																											if p20.NRPBS.Health.Value <= 0 then
																												if p18:IsDescendantOf(player.PlayerGui) then
																													if p18 then
																														if not p18.Parent then
																															u11:disconnect();
																															v54:Destroy();
																															if u12 then
																																u12:Cancel();
																																return;
																															end;
																														end;
																													else
																														u11:disconnect();
																														v54:Destroy();
																														if u12 then
																															u12:Cancel();
																															return;
																														end;
																													end;
																												else
																													u11:disconnect();
																													v54:Destroy();
																													if u12 then
																														u12:Cancel();
																														return;
																													end;
																												end;
																											elseif p18 then
																												if not p18.Parent then
																													u11:disconnect();
																													v54:Destroy();
																													if u12 then
																														u12:Cancel();
																														return;
																													end;
																												end;
																											else
																												u11:disconnect();
																												v54:Destroy();
																												if u12 then
																													u12:Cancel();
																													return;
																												end;
																											end;
																										elseif p18:IsDescendantOf(player.PlayerGui) then
																											if p18 then
																												if not p18.Parent then
																													u11:disconnect();
																													v54:Destroy();
																													if u12 then
																														u12:Cancel();
																														return;
																													end;
																												end;
																											else
																												u11:disconnect();
																												v54:Destroy();
																												if u12 then
																													u12:Cancel();
																													return;
																												end;
																											end;
																										else
																											u11:disconnect();
																											v54:Destroy();
																											if u12 then
																												u12:Cancel();
																												return;
																											end;
																										end;
																									elseif p18:IsDescendantOf(player.PlayerGui) then
																										if p18 then
																											if not p18.Parent then
																												u11:disconnect();
																												v54:Destroy();
																												if u12 then
																													u12:Cancel();
																													return;
																												end;
																											end;
																										else
																											u11:disconnect();
																											v54:Destroy();
																											if u12 then
																												u12:Cancel();
																												return;
																											end;
																										end;
																									else
																										u11:disconnect();
																										v54:Destroy();
																										if u12 then
																											u12:Cancel();
																											return;
																										end;
																									end;
																								elseif p18:IsDescendantOf(player.PlayerGui) then
																									if p18 then
																										if not p18.Parent then
																											u11:disconnect();
																											v54:Destroy();
																											if u12 then
																												u12:Cancel();
																												return;
																											end;
																										end;
																									else
																										u11:disconnect();
																										v54:Destroy();
																										if u12 then
																											u12:Cancel();
																											return;
																										end;
																									end;
																								else
																									u11:disconnect();
																									v54:Destroy();
																									if u12 then
																										u12:Cancel();
																										return;
																									end;
																								end;
																							elseif p18 then
																								if not p18.Parent then
																									u11:disconnect();
																									v54:Destroy();
																									if u12 then
																										u12:Cancel();
																										return;
																									end;
																								end;
																							else
																								u11:disconnect();
																								v54:Destroy();
																								if u12 then
																									u12:Cancel();
																									return;
																								end;
																							end;
																						else
																							u11:disconnect();
																							v54:Destroy();
																							if u12 then
																								u12:Cancel();
																								return;
																							end;
																						end;
																					end;
																				end;
																			else
																				u11:disconnect();
																				v54:Destroy();
																				if u12 then
																					u12:Cancel();
																				end;
																			end;
																		else
																			u11:disconnect();
																			v54:Destroy();
																			if u12 then
																				u12:Cancel();
																			end;
																		end;
																	end);
																end;
															end;														
														end;
													end;
												elseif v63.Material ~= Enum.Material.Wood then
													if not v55 then
														v55 = v63;
													end;
													v64, v65, v66 = pairs(v51);
													while true do
														v67, v68 = v64(v65, v66);
														if v67 then

														else
															break;
														end;
														v69 = script.Skin:Clone();
														v69.Texture = v53.Value;
														v69.Color3 = v53.Shade.Value;
														v69.StudsPerTileU = v53.Scale.Value;
														v69.StudsPerTileV = v53.Scale.Value;
														v69.Face = v68;
														v69.Parent = v63;
														u4(v63, v69);
														if not v53:FindFirstChild("No") then
															if p20 then
																if p20.Character then
																	if p20.Character:FindFirstChild("Body Colors") then
																		l__TorsoColor3__70 = p20.Character["Body Colors"].TorsoColor3;
																		v71 = v53:FindFirstChild("Multiplier") and v53.Multiplier.Value or 1;
																		v69.Color3 = Color3.new(l__TorsoColor3__70.r * v71, l__TorsoColor3__70.g * v71, l__TorsoColor3__70.b * v71);
																	elseif v53:FindFirstChild("Multiplier") then
																		l__Value__72 = v53.Shade.Value;
																		v73 = v53:FindFirstChild("Multiplier") and v53.Multiplier.Value or 1;
																		v69.Color3 = Color3.new(l__Value__72.r * v73, l__Value__72.g * v73, l__Value__72.b * v73);
																	end;
																elseif v53:FindFirstChild("Multiplier") then
																	l__Value__72 = v53.Shade.Value;
																	v73 = v53:FindFirstChild("Multiplier") and v53.Multiplier.Value or 1;
																	v69.Color3 = Color3.new(l__Value__72.r * v73, l__Value__72.g * v73, l__Value__72.b * v73);
																end;
															elseif v53:FindFirstChild("Multiplier") then
																l__Value__72 = v53.Shade.Value;
																v73 = v53:FindFirstChild("Multiplier") and v53.Multiplier.Value or 1;
																v69.Color3 = Color3.new(l__Value__72.r * v73, l__Value__72.g * v73, l__Value__72.b * v73);
															end;
														elseif v53:FindFirstChild("Multiplier") then
															l__Value__72 = v53.Shade.Value;
															v73 = v53:FindFirstChild("Multiplier") and v53.Multiplier.Value or 1;
															v69.Color3 = Color3.new(l__Value__72.r * v73, l__Value__72.g * v73, l__Value__72.b * v73);
														end;
														if v53:FindFirstChild("Neon") then
															v63.Material = Enum.Material.Neon;
															v63.BrickColor = v53.Neon.Value;
														end;
														if v53:FindFirstChild("Colored") then
															v63.BrickColor = v53.Colored.Value;
														end;
														if v53:FindFirstChild("Material") then
															v63.Material = v53.Material.Value;
														end;
														if v48 then
															v69.Color3 = Color3.new(1, 1, 1);
														end;
														if p20 == player then
															if v53:FindFirstChild("Animated") then
																v74 = v43:GetPropertyChangedSignal("Value");
																u6 = v53.Animated:FindFirstChild("Speed") and v53.Animated.Speed.Value or 0.01;
																u7 = nil;
																u8 = nil;
																u7 = v74:connect(function()
																	if p18 then
																		if p18.Parent then
																			if not p18:IsDescendantOf(player.PlayerGui) then
																				if not u5(v55) then
																					if p18:IsDescendantOf(player.PlayerGui) then
																						if player.PlayerGui.Menew.Locker.Visible then
																							if v53:FindFirstChild("Animated") then
																								if not v53.Animated:FindFirstChild("Horz") then
																									v69.OffsetStudsV = v69.OffsetStudsV + u6;
																								end;
																							end;
																							v69.OffsetStudsU = v69.OffsetStudsU - u6;
																							if p20 then
																								if p20 then
																									if p20:FindFirstChild("NRPBS") then
																										if p20:FindFirstChild("Status") then
																											if p20.Status.Alive.Value then
																												if p20.NRPBS.Health.Value <= 0 then
																													if p18:IsDescendantOf(player.PlayerGui) then
																														if p18 then
																															if not p18.Parent then
																																u7:disconnect();
																																v54:Destroy();
																																if u8 then
																																	u8:Cancel();
																																	return;
																																end;
																															end;
																														else
																															u7:disconnect();
																															v54:Destroy();
																															if u8 then
																																u8:Cancel();
																																return;
																															end;
																														end;
																													else
																														u7:disconnect();
																														v54:Destroy();
																														if u8 then
																															u8:Cancel();
																															return;
																														end;
																													end;
																												elseif p18 then
																													if not p18.Parent then
																														u7:disconnect();
																														v54:Destroy();
																														if u8 then
																															u8:Cancel();
																															return;
																														end;
																													end;
																												else
																													u7:disconnect();
																													v54:Destroy();
																													if u8 then
																														u8:Cancel();
																														return;
																													end;
																												end;
																											elseif p18:IsDescendantOf(player.PlayerGui) then
																												if p18 then
																													if not p18.Parent then
																														u7:disconnect();
																														v54:Destroy();
																														if u8 then
																															u8:Cancel();
																															return;
																														end;
																													end;
																												else
																													u7:disconnect();
																													v54:Destroy();
																													if u8 then
																														u8:Cancel();
																														return;
																													end;
																												end;
																											else
																												u7:disconnect();
																												v54:Destroy();
																												if u8 then
																													u8:Cancel();
																													return;
																												end;
																											end;
																										elseif p18:IsDescendantOf(player.PlayerGui) then
																											if p18 then
																												if not p18.Parent then
																													u7:disconnect();
																													v54:Destroy();
																													if u8 then
																														u8:Cancel();
																														return;
																													end;
																												end;
																											else
																												u7:disconnect();
																												v54:Destroy();
																												if u8 then
																													u8:Cancel();
																													return;
																												end;
																											end;
																										else
																											u7:disconnect();
																											v54:Destroy();
																											if u8 then
																												u8:Cancel();
																												return;
																											end;
																										end;
																									elseif p18:IsDescendantOf(player.PlayerGui) then
																										if p18 then
																											if not p18.Parent then
																												u7:disconnect();
																												v54:Destroy();
																												if u8 then
																													u8:Cancel();
																													return;
																												end;
																											end;
																										else
																											u7:disconnect();
																											v54:Destroy();
																											if u8 then
																												u8:Cancel();
																												return;
																											end;
																										end;
																									else
																										u7:disconnect();
																										v54:Destroy();
																										if u8 then
																											u8:Cancel();
																											return;
																										end;
																									end;
																								elseif p18 then
																									if not p18.Parent then
																										u7:disconnect();
																										v54:Destroy();
																										if u8 then
																											u8:Cancel();
																											return;
																										end;
																									end;
																								else
																									u7:disconnect();
																									v54:Destroy();
																									if u8 then
																										u8:Cancel();
																										return;
																									end;
																								end;
																							else
																								u7:disconnect();
																								v54:Destroy();
																								if u8 then
																									u8:Cancel();
																									return;
																								end;
																							end;
																						end;
																					end;
																				else
																					if v53:FindFirstChild("Animated") then
																						if not v53.Animated:FindFirstChild("Horz") then
																							v69.OffsetStudsV = v69.OffsetStudsV + u6;
																						end;
																					end;
																					v69.OffsetStudsU = v69.OffsetStudsU - u6;
																					if p20 then
																						if p20 then
																							if p20:FindFirstChild("NRPBS") then
																								if p20:FindFirstChild("Status") then
																									if p20.Status.Alive.Value then
																										if p20.NRPBS.Health.Value <= 0 then
																											if p18:IsDescendantOf(player.PlayerGui) then
																												if p18 then
																													if not p18.Parent then
																														u7:disconnect();
																														v54:Destroy();
																														if u8 then
																															u8:Cancel();
																															return;
																														end;
																													end;
																												else
																													u7:disconnect();
																													v54:Destroy();
																													if u8 then
																														u8:Cancel();
																														return;
																													end;
																												end;
																											else
																												u7:disconnect();
																												v54:Destroy();
																												if u8 then
																													u8:Cancel();
																													return;
																												end;
																											end;
																										elseif p18 then
																											if not p18.Parent then
																												u7:disconnect();
																												v54:Destroy();
																												if u8 then
																													u8:Cancel();
																													return;
																												end;
																											end;
																										else
																											u7:disconnect();
																											v54:Destroy();
																											if u8 then
																												u8:Cancel();
																												return;
																											end;
																										end;
																									elseif p18:IsDescendantOf(player.PlayerGui) then
																										if p18 then
																											if not p18.Parent then
																												u7:disconnect();
																												v54:Destroy();
																												if u8 then
																													u8:Cancel();
																													return;
																												end;
																											end;
																										else
																											u7:disconnect();
																											v54:Destroy();
																											if u8 then
																												u8:Cancel();
																												return;
																											end;
																										end;
																									else
																										u7:disconnect();
																										v54:Destroy();
																										if u8 then
																											u8:Cancel();
																											return;
																										end;
																									end;
																								elseif p18:IsDescendantOf(player.PlayerGui) then
																									if p18 then
																										if not p18.Parent then
																											u7:disconnect();
																											v54:Destroy();
																											if u8 then
																												u8:Cancel();
																												return;
																											end;
																										end;
																									else
																										u7:disconnect();
																										v54:Destroy();
																										if u8 then
																											u8:Cancel();
																											return;
																										end;
																									end;
																								else
																									u7:disconnect();
																									v54:Destroy();
																									if u8 then
																										u8:Cancel();
																										return;
																									end;
																								end;
																							elseif p18:IsDescendantOf(player.PlayerGui) then
																								if p18 then
																									if not p18.Parent then
																										u7:disconnect();
																										v54:Destroy();
																										if u8 then
																											u8:Cancel();
																											return;
																										end;
																									end;
																								else
																									u7:disconnect();
																									v54:Destroy();
																									if u8 then
																										u8:Cancel();
																										return;
																									end;
																								end;
																							else
																								u7:disconnect();
																								v54:Destroy();
																								if u8 then
																									u8:Cancel();
																									return;
																								end;
																							end;
																						elseif p18 then
																							if not p18.Parent then
																								u7:disconnect();
																								v54:Destroy();
																								if u8 then
																									u8:Cancel();
																									return;
																								end;
																							end;
																						else
																							u7:disconnect();
																							v54:Destroy();
																							if u8 then
																								u8:Cancel();
																								return;
																							end;
																						end;
																					else
																						u7:disconnect();
																						v54:Destroy();
																						if u8 then
																							u8:Cancel();
																							return;
																						end;
																					end;
																				end;
																			elseif p18:IsDescendantOf(player.PlayerGui) then
																				if player.PlayerGui.Menew.Locker.Visible then
																					if v53:FindFirstChild("Animated") then
																						if not v53.Animated:FindFirstChild("Horz") then
																							v69.OffsetStudsV = v69.OffsetStudsV + u6;
																						end;
																					end;
																					v69.OffsetStudsU = v69.OffsetStudsU - u6;
																					if p20 then
																						if p20 then
																							if p20:FindFirstChild("NRPBS") then
																								if p20:FindFirstChild("Status") then
																									if p20.Status.Alive.Value then
																										if p20.NRPBS.Health.Value <= 0 then
																											if p18:IsDescendantOf(player.PlayerGui) then
																												if p18 then
																													if not p18.Parent then
																														u7:disconnect();
																														v54:Destroy();
																														if u8 then
																															u8:Cancel();
																															return;
																														end;
																													end;
																												else
																													u7:disconnect();
																													v54:Destroy();
																													if u8 then
																														u8:Cancel();
																														return;
																													end;
																												end;
																											else
																												u7:disconnect();
																												v54:Destroy();
																												if u8 then
																													u8:Cancel();
																													return;
																												end;
																											end;
																										elseif p18 then
																											if not p18.Parent then
																												u7:disconnect();
																												v54:Destroy();
																												if u8 then
																													u8:Cancel();
																													return;
																												end;
																											end;
																										else
																											u7:disconnect();
																											v54:Destroy();
																											if u8 then
																												u8:Cancel();
																												return;
																											end;
																										end;
																									elseif p18:IsDescendantOf(player.PlayerGui) then
																										if p18 then
																											if not p18.Parent then
																												u7:disconnect();
																												v54:Destroy();
																												if u8 then
																													u8:Cancel();
																													return;
																												end;
																											end;
																										else
																											u7:disconnect();
																											v54:Destroy();
																											if u8 then
																												u8:Cancel();
																												return;
																											end;
																										end;
																									else
																										u7:disconnect();
																										v54:Destroy();
																										if u8 then
																											u8:Cancel();
																											return;
																										end;
																									end;
																								elseif p18:IsDescendantOf(player.PlayerGui) then
																									if p18 then
																										if not p18.Parent then
																											u7:disconnect();
																											v54:Destroy();
																											if u8 then
																												u8:Cancel();
																												return;
																											end;
																										end;
																									else
																										u7:disconnect();
																										v54:Destroy();
																										if u8 then
																											u8:Cancel();
																											return;
																										end;
																									end;
																								else
																									u7:disconnect();
																									v54:Destroy();
																									if u8 then
																										u8:Cancel();
																										return;
																									end;
																								end;
																							elseif p18:IsDescendantOf(player.PlayerGui) then
																								if p18 then
																									if not p18.Parent then
																										u7:disconnect();
																										v54:Destroy();
																										if u8 then
																											u8:Cancel();
																											return;
																										end;
																									end;
																								else
																									u7:disconnect();
																									v54:Destroy();
																									if u8 then
																										u8:Cancel();
																										return;
																									end;
																								end;
																							else
																								u7:disconnect();
																								v54:Destroy();
																								if u8 then
																									u8:Cancel();
																									return;
																								end;
																							end;
																						elseif p18 then
																							if not p18.Parent then
																								u7:disconnect();
																								v54:Destroy();
																								if u8 then
																									u8:Cancel();
																									return;
																								end;
																							end;
																						else
																							u7:disconnect();
																							v54:Destroy();
																							if u8 then
																								u8:Cancel();
																								return;
																							end;
																						end;
																					else
																						u7:disconnect();
																						v54:Destroy();
																						if u8 then
																							u8:Cancel();
																							return;
																						end;
																					end;
																				end;
																			end;
																		else
																			u7:disconnect();
																			v54:Destroy();
																			if u8 then
																				u8:Cancel();
																			end;
																		end;
																	else
																		u7:disconnect();
																		v54:Destroy();
																		if u8 then
																			u8:Cancel();
																		end;
																	end;
																end);
															elseif v53:FindFirstChild("Align") then
																u9 = nil;
																u10 = nil;
																u9 = v43:GetPropertyChangedSignal("Value"):connect(function()
																	if p18 then
																		if p18.Parent then
																			if not p18:IsDescendantOf(player.PlayerGui) then
																				if not u5(v55) then
																					if p18:IsDescendantOf(player.PlayerGui) then
																						if player.PlayerGui.Menew.Locker.Visible then
																							u4(v63, v69);
																							if p20 then
																								if p20 then
																									if p20:FindFirstChild("NRPBS") then
																										if p20:FindFirstChild("Status") then
																											if p20.Status.Alive.Value then
																												if p20.NRPBS.Health.Value <= 0 then
																													if p18:IsDescendantOf(player.PlayerGui) then
																														if p18 then
																															if not p18.Parent then
																																u9:disconnect();
																																v54:Destroy();
																																if u10 then
																																	u10:Cancel();
																																	return;
																																end;
																															end;
																														else
																															u9:disconnect();
																															v54:Destroy();
																															if u10 then
																																u10:Cancel();
																																return;
																															end;
																														end;
																													else
																														u9:disconnect();
																														v54:Destroy();
																														if u10 then
																															u10:Cancel();
																															return;
																														end;
																													end;
																												elseif p18 then
																													if not p18.Parent then
																														u9:disconnect();
																														v54:Destroy();
																														if u10 then
																															u10:Cancel();
																															return;
																														end;
																													end;
																												else
																													u9:disconnect();
																													v54:Destroy();
																													if u10 then
																														u10:Cancel();
																														return;
																													end;
																												end;
																											elseif p18:IsDescendantOf(player.PlayerGui) then
																												if p18 then
																													if not p18.Parent then
																														u9:disconnect();
																														v54:Destroy();
																														if u10 then
																															u10:Cancel();
																															return;
																														end;
																													end;
																												else
																													u9:disconnect();
																													v54:Destroy();
																													if u10 then
																														u10:Cancel();
																														return;
																													end;
																												end;
																											else
																												u9:disconnect();
																												v54:Destroy();
																												if u10 then
																													u10:Cancel();
																													return;
																												end;
																											end;
																										elseif p18:IsDescendantOf(player.PlayerGui) then
																											if p18 then
																												if not p18.Parent then
																													u9:disconnect();
																													v54:Destroy();
																													if u10 then
																														u10:Cancel();
																														return;
																													end;
																												end;
																											else
																												u9:disconnect();
																												v54:Destroy();
																												if u10 then
																													u10:Cancel();
																													return;
																												end;
																											end;
																										else
																											u9:disconnect();
																											v54:Destroy();
																											if u10 then
																												u10:Cancel();
																												return;
																											end;
																										end;
																									elseif p18:IsDescendantOf(player.PlayerGui) then
																										if p18 then
																											if not p18.Parent then
																												u9:disconnect();
																												v54:Destroy();
																												if u10 then
																													u10:Cancel();
																													return;
																												end;
																											end;
																										else
																											u9:disconnect();
																											v54:Destroy();
																											if u10 then
																												u10:Cancel();
																												return;
																											end;
																										end;
																									else
																										u9:disconnect();
																										v54:Destroy();
																										if u10 then
																											u10:Cancel();
																											return;
																										end;
																									end;
																								elseif p18 then
																									if not p18.Parent then
																										u9:disconnect();
																										v54:Destroy();
																										if u10 then
																											u10:Cancel();
																											return;
																										end;
																									end;
																								else
																									u9:disconnect();
																									v54:Destroy();
																									if u10 then
																										u10:Cancel();
																										return;
																									end;
																								end;
																							else
																								u9:disconnect();
																								v54:Destroy();
																								if u10 then
																									u10:Cancel();
																									return;
																								end;
																							end;
																						end;
																					end;
																				else
																					u4(v63, v69);
																					if p20 then
																						if p20 then
																							if p20:FindFirstChild("NRPBS") then
																								if p20:FindFirstChild("Status") then
																									if p20.Status.Alive.Value then
																										if p20.NRPBS.Health.Value <= 0 then
																											if p18:IsDescendantOf(player.PlayerGui) then
																												if p18 then
																													if not p18.Parent then
																														u9:disconnect();
																														v54:Destroy();
																														if u10 then
																															u10:Cancel();
																															return;
																														end;
																													end;
																												else
																													u9:disconnect();
																													v54:Destroy();
																													if u10 then
																														u10:Cancel();
																														return;
																													end;
																												end;
																											else
																												u9:disconnect();
																												v54:Destroy();
																												if u10 then
																													u10:Cancel();
																													return;
																												end;
																											end;
																										elseif p18 then
																											if not p18.Parent then
																												u9:disconnect();
																												v54:Destroy();
																												if u10 then
																													u10:Cancel();
																													return;
																												end;
																											end;
																										else
																											u9:disconnect();
																											v54:Destroy();
																											if u10 then
																												u10:Cancel();
																												return;
																											end;
																										end;
																									elseif p18:IsDescendantOf(player.PlayerGui) then
																										if p18 then
																											if not p18.Parent then
																												u9:disconnect();
																												v54:Destroy();
																												if u10 then
																													u10:Cancel();
																													return;
																												end;
																											end;
																										else
																											u9:disconnect();
																											v54:Destroy();
																											if u10 then
																												u10:Cancel();
																												return;
																											end;
																										end;
																									else
																										u9:disconnect();
																										v54:Destroy();
																										if u10 then
																											u10:Cancel();
																											return;
																										end;
																									end;
																								elseif p18:IsDescendantOf(player.PlayerGui) then
																									if p18 then
																										if not p18.Parent then
																											u9:disconnect();
																											v54:Destroy();
																											if u10 then
																												u10:Cancel();
																												return;
																											end;
																										end;
																									else
																										u9:disconnect();
																										v54:Destroy();
																										if u10 then
																											u10:Cancel();
																											return;
																										end;
																									end;
																								else
																									u9:disconnect();
																									v54:Destroy();
																									if u10 then
																										u10:Cancel();
																										return;
																									end;
																								end;
																							elseif p18:IsDescendantOf(player.PlayerGui) then
																								if p18 then
																									if not p18.Parent then
																										u9:disconnect();
																										v54:Destroy();
																										if u10 then
																											u10:Cancel();
																											return;
																										end;
																									end;
																								else
																									u9:disconnect();
																									v54:Destroy();
																									if u10 then
																										u10:Cancel();
																										return;
																									end;
																								end;
																							else
																								u9:disconnect();
																								v54:Destroy();
																								if u10 then
																									u10:Cancel();
																									return;
																								end;
																							end;
																						elseif p18 then
																							if not p18.Parent then
																								u9:disconnect();
																								v54:Destroy();
																								if u10 then
																									u10:Cancel();
																									return;
																								end;
																							end;
																						else
																							u9:disconnect();
																							v54:Destroy();
																							if u10 then
																								u10:Cancel();
																								return;
																							end;
																						end;
																					else
																						u9:disconnect();
																						v54:Destroy();
																						if u10 then
																							u10:Cancel();
																							return;
																						end;
																					end;
																				end;
																			elseif p18:IsDescendantOf(player.PlayerGui) then
																				if player.PlayerGui.Menew.Locker.Visible then
																					u4(v63, v69);
																					if p20 then
																						if p20 then
																							if p20:FindFirstChild("NRPBS") then
																								if p20:FindFirstChild("Status") then
																									if p20.Status.Alive.Value then
																										if p20.NRPBS.Health.Value <= 0 then
																											if p18:IsDescendantOf(player.PlayerGui) then
																												if p18 then
																													if not p18.Parent then
																														u9:disconnect();
																														v54:Destroy();
																														if u10 then
																															u10:Cancel();
																															return;
																														end;
																													end;
																												else
																													u9:disconnect();
																													v54:Destroy();
																													if u10 then
																														u10:Cancel();
																														return;
																													end;
																												end;
																											else
																												u9:disconnect();
																												v54:Destroy();
																												if u10 then
																													u10:Cancel();
																													return;
																												end;
																											end;
																										elseif p18 then
																											if not p18.Parent then
																												u9:disconnect();
																												v54:Destroy();
																												if u10 then
																													u10:Cancel();
																													return;
																												end;
																											end;
																										else
																											u9:disconnect();
																											v54:Destroy();
																											if u10 then
																												u10:Cancel();
																												return;
																											end;
																										end;
																									elseif p18:IsDescendantOf(player.PlayerGui) then
																										if p18 then
																											if not p18.Parent then
																												u9:disconnect();
																												v54:Destroy();
																												if u10 then
																													u10:Cancel();
																													return;
																												end;
																											end;
																										else
																											u9:disconnect();
																											v54:Destroy();
																											if u10 then
																												u10:Cancel();
																												return;
																											end;
																										end;
																									else
																										u9:disconnect();
																										v54:Destroy();
																										if u10 then
																											u10:Cancel();
																											return;
																										end;
																									end;
																								elseif p18:IsDescendantOf(player.PlayerGui) then
																									if p18 then
																										if not p18.Parent then
																											u9:disconnect();
																											v54:Destroy();
																											if u10 then
																												u10:Cancel();
																												return;
																											end;
																										end;
																									else
																										u9:disconnect();
																										v54:Destroy();
																										if u10 then
																											u10:Cancel();
																											return;
																										end;
																									end;
																								else
																									u9:disconnect();
																									v54:Destroy();
																									if u10 then
																										u10:Cancel();
																										return;
																									end;
																								end;
																							elseif p18:IsDescendantOf(player.PlayerGui) then
																								if p18 then
																									if not p18.Parent then
																										u9:disconnect();
																										v54:Destroy();
																										if u10 then
																											u10:Cancel();
																											return;
																										end;
																									end;
																								else
																									u9:disconnect();
																									v54:Destroy();
																									if u10 then
																										u10:Cancel();
																										return;
																									end;
																								end;
																							else
																								u9:disconnect();
																								v54:Destroy();
																								if u10 then
																									u10:Cancel();
																									return;
																								end;
																							end;
																						elseif p18 then
																							if not p18.Parent then
																								u9:disconnect();
																								v54:Destroy();
																								if u10 then
																									u10:Cancel();
																									return;
																								end;
																							end;
																						else
																							u9:disconnect();
																							v54:Destroy();
																							if u10 then
																								u10:Cancel();
																								return;
																							end;
																						end;
																					else
																						u9:disconnect();
																						v54:Destroy();
																						if u10 then
																							u10:Cancel();
																							return;
																						end;
																					end;
																				end;
																			end;
																		else
																			u9:disconnect();
																			v54:Destroy();
																			if u10 then
																				u10:Cancel();
																			end;
																		end;
																	else
																		u9:disconnect();
																		v54:Destroy();
																		if u10 then
																			u10:Cancel();
																		end;
																	end;
																end);
															end;
															if v53:FindFirstChild("Sizer") then
																u11 = nil;
																u12 = nil;
																u11 = v54:GetPropertyChangedSignal("Value"):connect(function()
																	if p18 then
																		if p18.Parent then
																			if not p18:IsDescendantOf(player.PlayerGui) then
																				if not u5(v55) then
																					if p18:IsDescendantOf(player.PlayerGui) then
																						if player.PlayerGui.Menew.Locker.Visible then
																							v69.StudsPerTileU = v54.Value;
																							v69.StudsPerTileV = v54.Value;
																							if p20 then
																								if p20 then
																									if p20:FindFirstChild("NRPBS") then
																										if p20:FindFirstChild("Status") then
																											if p20.Status.Alive.Value then
																												if p20.NRPBS.Health.Value <= 0 then
																													if p18:IsDescendantOf(player.PlayerGui) then
																														if p18 then
																															if not p18.Parent then
																																u11:disconnect();
																																v54:Destroy();
																																if u12 then
																																	u12:Cancel();
																																	return;
																																end;
																															end;
																														else
																															u11:disconnect();
																															v54:Destroy();
																															if u12 then
																																u12:Cancel();
																																return;
																															end;
																														end;
																													else
																														u11:disconnect();
																														v54:Destroy();
																														if u12 then
																															u12:Cancel();
																															return;
																														end;
																													end;
																												elseif p18 then
																													if not p18.Parent then
																														u11:disconnect();
																														v54:Destroy();
																														if u12 then
																															u12:Cancel();
																															return;
																														end;
																													end;
																												else
																													u11:disconnect();
																													v54:Destroy();
																													if u12 then
																														u12:Cancel();
																														return;
																													end;
																												end;
																											elseif p18:IsDescendantOf(player.PlayerGui) then
																												if p18 then
																													if not p18.Parent then
																														u11:disconnect();
																														v54:Destroy();
																														if u12 then
																															u12:Cancel();
																															return;
																														end;
																													end;
																												else
																													u11:disconnect();
																													v54:Destroy();
																													if u12 then
																														u12:Cancel();
																														return;
																													end;
																												end;
																											else
																												u11:disconnect();
																												v54:Destroy();
																												if u12 then
																													u12:Cancel();
																													return;
																												end;
																											end;
																										elseif p18:IsDescendantOf(player.PlayerGui) then
																											if p18 then
																												if not p18.Parent then
																													u11:disconnect();
																													v54:Destroy();
																													if u12 then
																														u12:Cancel();
																														return;
																													end;
																												end;
																											else
																												u11:disconnect();
																												v54:Destroy();
																												if u12 then
																													u12:Cancel();
																													return;
																												end;
																											end;
																										else
																											u11:disconnect();
																											v54:Destroy();
																											if u12 then
																												u12:Cancel();
																												return;
																											end;
																										end;
																									elseif p18:IsDescendantOf(player.PlayerGui) then
																										if p18 then
																											if not p18.Parent then
																												u11:disconnect();
																												v54:Destroy();
																												if u12 then
																													u12:Cancel();
																													return;
																												end;
																											end;
																										else
																											u11:disconnect();
																											v54:Destroy();
																											if u12 then
																												u12:Cancel();
																												return;
																											end;
																										end;
																									else
																										u11:disconnect();
																										v54:Destroy();
																										if u12 then
																											u12:Cancel();
																											return;
																										end;
																									end;
																								elseif p18 then
																									if not p18.Parent then
																										u11:disconnect();
																										v54:Destroy();
																										if u12 then
																											u12:Cancel();
																											return;
																										end;
																									end;
																								else
																									u11:disconnect();
																									v54:Destroy();
																									if u12 then
																										u12:Cancel();
																										return;
																									end;
																								end;
																							else
																								u11:disconnect();
																								v54:Destroy();
																								if u12 then
																									u12:Cancel();
																									return;
																								end;
																							end;
																						end;
																					end;
																				else
																					v69.StudsPerTileU = v54.Value;
																					v69.StudsPerTileV = v54.Value;
																					if p20 then
																						if p20 then
																							if p20:FindFirstChild("NRPBS") then
																								if p20:FindFirstChild("Status") then
																									if p20.Status.Alive.Value then
																										if p20.NRPBS.Health.Value <= 0 then
																											if p18:IsDescendantOf(player.PlayerGui) then
																												if p18 then
																													if not p18.Parent then
																														u11:disconnect();
																														v54:Destroy();
																														if u12 then
																															u12:Cancel();
																															return;
																														end;
																													end;
																												else
																													u11:disconnect();
																													v54:Destroy();
																													if u12 then
																														u12:Cancel();
																														return;
																													end;
																												end;
																											else
																												u11:disconnect();
																												v54:Destroy();
																												if u12 then
																													u12:Cancel();
																													return;
																												end;
																											end;
																										elseif p18 then
																											if not p18.Parent then
																												u11:disconnect();
																												v54:Destroy();
																												if u12 then
																													u12:Cancel();
																													return;
																												end;
																											end;
																										else
																											u11:disconnect();
																											v54:Destroy();
																											if u12 then
																												u12:Cancel();
																												return;
																											end;
																										end;
																									elseif p18:IsDescendantOf(player.PlayerGui) then
																										if p18 then
																											if not p18.Parent then
																												u11:disconnect();
																												v54:Destroy();
																												if u12 then
																													u12:Cancel();
																													return;
																												end;
																											end;
																										else
																											u11:disconnect();
																											v54:Destroy();
																											if u12 then
																												u12:Cancel();
																												return;
																											end;
																										end;
																									else
																										u11:disconnect();
																										v54:Destroy();
																										if u12 then
																											u12:Cancel();
																											return;
																										end;
																									end;
																								elseif p18:IsDescendantOf(player.PlayerGui) then
																									if p18 then
																										if not p18.Parent then
																											u11:disconnect();
																											v54:Destroy();
																											if u12 then
																												u12:Cancel();
																												return;
																											end;
																										end;
																									else
																										u11:disconnect();
																										v54:Destroy();
																										if u12 then
																											u12:Cancel();
																											return;
																										end;
																									end;
																								else
																									u11:disconnect();
																									v54:Destroy();
																									if u12 then
																										u12:Cancel();
																										return;
																									end;
																								end;
																							elseif p18:IsDescendantOf(player.PlayerGui) then
																								if p18 then
																									if not p18.Parent then
																										u11:disconnect();
																										v54:Destroy();
																										if u12 then
																											u12:Cancel();
																											return;
																										end;
																									end;
																								else
																									u11:disconnect();
																									v54:Destroy();
																									if u12 then
																										u12:Cancel();
																										return;
																									end;
																								end;
																							else
																								u11:disconnect();
																								v54:Destroy();
																								if u12 then
																									u12:Cancel();
																									return;
																								end;
																							end;
																						elseif p18 then
																							if not p18.Parent then
																								u11:disconnect();
																								v54:Destroy();
																								if u12 then
																									u12:Cancel();
																									return;
																								end;
																							end;
																						else
																							u11:disconnect();
																							v54:Destroy();
																							if u12 then
																								u12:Cancel();
																								return;
																							end;
																						end;
																					else
																						u11:disconnect();
																						v54:Destroy();
																						if u12 then
																							u12:Cancel();
																							return;
																						end;
																					end;
																				end;
																			elseif p18:IsDescendantOf(player.PlayerGui) then
																				if player.PlayerGui.Menew.Locker.Visible then
																					v69.StudsPerTileU = v54.Value;
																					v69.StudsPerTileV = v54.Value;
																					if p20 then
																						if p20 then
																							if p20:FindFirstChild("NRPBS") then
																								if p20:FindFirstChild("Status") then
																									if p20.Status.Alive.Value then
																										if p20.NRPBS.Health.Value <= 0 then
																											if p18:IsDescendantOf(player.PlayerGui) then
																												if p18 then
																													if not p18.Parent then
																														u11:disconnect();
																														v54:Destroy();
																														if u12 then
																															u12:Cancel();
																															return;
																														end;
																													end;
																												else
																													u11:disconnect();
																													v54:Destroy();
																													if u12 then
																														u12:Cancel();
																														return;
																													end;
																												end;
																											else
																												u11:disconnect();
																												v54:Destroy();
																												if u12 then
																													u12:Cancel();
																													return;
																												end;
																											end;
																										elseif p18 then
																											if not p18.Parent then
																												u11:disconnect();
																												v54:Destroy();
																												if u12 then
																													u12:Cancel();
																													return;
																												end;
																											end;
																										else
																											u11:disconnect();
																											v54:Destroy();
																											if u12 then
																												u12:Cancel();
																												return;
																											end;
																										end;
																									elseif p18:IsDescendantOf(player.PlayerGui) then
																										if p18 then
																											if not p18.Parent then
																												u11:disconnect();
																												v54:Destroy();
																												if u12 then
																													u12:Cancel();
																													return;
																												end;
																											end;
																										else
																											u11:disconnect();
																											v54:Destroy();
																											if u12 then
																												u12:Cancel();
																												return;
																											end;
																										end;
																									else
																										u11:disconnect();
																										v54:Destroy();
																										if u12 then
																											u12:Cancel();
																											return;
																										end;
																									end;
																								elseif p18:IsDescendantOf(player.PlayerGui) then
																									if p18 then
																										if not p18.Parent then
																											u11:disconnect();
																											v54:Destroy();
																											if u12 then
																												u12:Cancel();
																												return;
																											end;
																										end;
																									else
																										u11:disconnect();
																										v54:Destroy();
																										if u12 then
																											u12:Cancel();
																											return;
																										end;
																									end;
																								else
																									u11:disconnect();
																									v54:Destroy();
																									if u12 then
																										u12:Cancel();
																										return;
																									end;
																								end;
																							elseif p18:IsDescendantOf(player.PlayerGui) then
																								if p18 then
																									if not p18.Parent then
																										u11:disconnect();
																										v54:Destroy();
																										if u12 then
																											u12:Cancel();
																											return;
																										end;
																									end;
																								else
																									u11:disconnect();
																									v54:Destroy();
																									if u12 then
																										u12:Cancel();
																										return;
																									end;
																								end;
																							else
																								u11:disconnect();
																								v54:Destroy();
																								if u12 then
																									u12:Cancel();
																									return;
																								end;
																							end;
																						elseif p18 then
																							if not p18.Parent then
																								u11:disconnect();
																								v54:Destroy();
																								if u12 then
																									u12:Cancel();
																									return;
																								end;
																							end;
																						else
																							u11:disconnect();
																							v54:Destroy();
																							if u12 then
																								u12:Cancel();
																								return;
																							end;
																						end;
																					else
																						u11:disconnect();
																						v54:Destroy();
																						if u12 then
																							u12:Cancel();
																							return;
																						end;
																					end;
																				end;
																			end;
																		else
																			u11:disconnect();
																			v54:Destroy();
																			if u12 then
																				u12:Cancel();
																			end;
																		end;
																	else
																		u11:disconnect();
																		v54:Destroy();
																		if u12 then
																			u12:Cancel();
																		end;
																	end;
																end);
															end;
														end;													
													end;
												end;
											elseif v63.Material ~= Enum.Material.Wood then
												if not v55 then
													v55 = v63;
												end;
												v64, v65, v66 = pairs(v51);
												while true do
													v67, v68 = v64(v65, v66);
													if v67 then

													else
														break;
													end;
													v69 = script.Skin:Clone();
													v69.Texture = v53.Value;
													v69.Color3 = v53.Shade.Value;
													v69.StudsPerTileU = v53.Scale.Value;
													v69.StudsPerTileV = v53.Scale.Value;
													v69.Face = v68;
													v69.Parent = v63;
													u4(v63, v69);
													if not v53:FindFirstChild("No") then
														if p20 then
															if p20.Character then
																if p20.Character:FindFirstChild("Body Colors") then
																	l__TorsoColor3__70 = p20.Character["Body Colors"].TorsoColor3;
																	v71 = v53:FindFirstChild("Multiplier") and v53.Multiplier.Value or 1;
																	v69.Color3 = Color3.new(l__TorsoColor3__70.r * v71, l__TorsoColor3__70.g * v71, l__TorsoColor3__70.b * v71);
																elseif v53:FindFirstChild("Multiplier") then
																	l__Value__72 = v53.Shade.Value;
																	v73 = v53:FindFirstChild("Multiplier") and v53.Multiplier.Value or 1;
																	v69.Color3 = Color3.new(l__Value__72.r * v73, l__Value__72.g * v73, l__Value__72.b * v73);
																end;
															elseif v53:FindFirstChild("Multiplier") then
																l__Value__72 = v53.Shade.Value;
																v73 = v53:FindFirstChild("Multiplier") and v53.Multiplier.Value or 1;
																v69.Color3 = Color3.new(l__Value__72.r * v73, l__Value__72.g * v73, l__Value__72.b * v73);
															end;
														elseif v53:FindFirstChild("Multiplier") then
															l__Value__72 = v53.Shade.Value;
															v73 = v53:FindFirstChild("Multiplier") and v53.Multiplier.Value or 1;
															v69.Color3 = Color3.new(l__Value__72.r * v73, l__Value__72.g * v73, l__Value__72.b * v73);
														end;
													elseif v53:FindFirstChild("Multiplier") then
														l__Value__72 = v53.Shade.Value;
														v73 = v53:FindFirstChild("Multiplier") and v53.Multiplier.Value or 1;
														v69.Color3 = Color3.new(l__Value__72.r * v73, l__Value__72.g * v73, l__Value__72.b * v73);
													end;
													if v53:FindFirstChild("Neon") then
														v63.Material = Enum.Material.Neon;
														v63.BrickColor = v53.Neon.Value;
													end;
													if v53:FindFirstChild("Colored") then
														v63.BrickColor = v53.Colored.Value;
													end;
													if v53:FindFirstChild("Material") then
														v63.Material = v53.Material.Value;
													end;
													if v48 then
														v69.Color3 = Color3.new(1, 1, 1);
													end;
													if p20 == player then
														if v53:FindFirstChild("Animated") then
															v74 = v43:GetPropertyChangedSignal("Value");
															u6 = v53.Animated:FindFirstChild("Speed") and v53.Animated.Speed.Value or 0.01;
															u7 = nil;
															u8 = nil;
															u7 = v74:connect(function()
																if p18 then
																	if p18.Parent then
																		if not p18:IsDescendantOf(player.PlayerGui) then
																			if not u5(v55) then
																				if p18:IsDescendantOf(player.PlayerGui) then
																					if player.PlayerGui.Menew.Locker.Visible then
																						if v53:FindFirstChild("Animated") then
																							if not v53.Animated:FindFirstChild("Horz") then
																								v69.OffsetStudsV = v69.OffsetStudsV + u6;
																							end;
																						end;
																						v69.OffsetStudsU = v69.OffsetStudsU - u6;
																						if p20 then
																							if p20 then
																								if p20:FindFirstChild("NRPBS") then
																									if p20:FindFirstChild("Status") then
																										if p20.Status.Alive.Value then
																											if p20.NRPBS.Health.Value <= 0 then
																												if p18:IsDescendantOf(player.PlayerGui) then
																													if p18 then
																														if not p18.Parent then
																															u7:disconnect();
																															v54:Destroy();
																															if u8 then
																																u8:Cancel();
																																return;
																															end;
																														end;
																													else
																														u7:disconnect();
																														v54:Destroy();
																														if u8 then
																															u8:Cancel();
																															return;
																														end;
																													end;
																												else
																													u7:disconnect();
																													v54:Destroy();
																													if u8 then
																														u8:Cancel();
																														return;
																													end;
																												end;
																											elseif p18 then
																												if not p18.Parent then
																													u7:disconnect();
																													v54:Destroy();
																													if u8 then
																														u8:Cancel();
																														return;
																													end;
																												end;
																											else
																												u7:disconnect();
																												v54:Destroy();
																												if u8 then
																													u8:Cancel();
																													return;
																												end;
																											end;
																										elseif p18:IsDescendantOf(player.PlayerGui) then
																											if p18 then
																												if not p18.Parent then
																													u7:disconnect();
																													v54:Destroy();
																													if u8 then
																														u8:Cancel();
																														return;
																													end;
																												end;
																											else
																												u7:disconnect();
																												v54:Destroy();
																												if u8 then
																													u8:Cancel();
																													return;
																												end;
																											end;
																										else
																											u7:disconnect();
																											v54:Destroy();
																											if u8 then
																												u8:Cancel();
																												return;
																											end;
																										end;
																									elseif p18:IsDescendantOf(player.PlayerGui) then
																										if p18 then
																											if not p18.Parent then
																												u7:disconnect();
																												v54:Destroy();
																												if u8 then
																													u8:Cancel();
																													return;
																												end;
																											end;
																										else
																											u7:disconnect();
																											v54:Destroy();
																											if u8 then
																												u8:Cancel();
																												return;
																											end;
																										end;
																									else
																										u7:disconnect();
																										v54:Destroy();
																										if u8 then
																											u8:Cancel();
																											return;
																										end;
																									end;
																								elseif p18:IsDescendantOf(player.PlayerGui) then
																									if p18 then
																										if not p18.Parent then
																											u7:disconnect();
																											v54:Destroy();
																											if u8 then
																												u8:Cancel();
																												return;
																											end;
																										end;
																									else
																										u7:disconnect();
																										v54:Destroy();
																										if u8 then
																											u8:Cancel();
																											return;
																										end;
																									end;
																								else
																									u7:disconnect();
																									v54:Destroy();
																									if u8 then
																										u8:Cancel();
																										return;
																									end;
																								end;
																							elseif p18 then
																								if not p18.Parent then
																									u7:disconnect();
																									v54:Destroy();
																									if u8 then
																										u8:Cancel();
																										return;
																									end;
																								end;
																							else
																								u7:disconnect();
																								v54:Destroy();
																								if u8 then
																									u8:Cancel();
																									return;
																								end;
																							end;
																						else
																							u7:disconnect();
																							v54:Destroy();
																							if u8 then
																								u8:Cancel();
																								return;
																							end;
																						end;
																					end;
																				end;
																			else
																				if v53:FindFirstChild("Animated") then
																					if not v53.Animated:FindFirstChild("Horz") then
																						v69.OffsetStudsV = v69.OffsetStudsV + u6;
																					end;
																				end;
																				v69.OffsetStudsU = v69.OffsetStudsU - u6;
																				if p20 then
																					if p20 then
																						if p20:FindFirstChild("NRPBS") then
																							if p20:FindFirstChild("Status") then
																								if p20.Status.Alive.Value then
																									if p20.NRPBS.Health.Value <= 0 then
																										if p18:IsDescendantOf(player.PlayerGui) then
																											if p18 then
																												if not p18.Parent then
																													u7:disconnect();
																													v54:Destroy();
																													if u8 then
																														u8:Cancel();
																														return;
																													end;
																												end;
																											else
																												u7:disconnect();
																												v54:Destroy();
																												if u8 then
																													u8:Cancel();
																													return;
																												end;
																											end;
																										else
																											u7:disconnect();
																											v54:Destroy();
																											if u8 then
																												u8:Cancel();
																												return;
																											end;
																										end;
																									elseif p18 then
																										if not p18.Parent then
																											u7:disconnect();
																											v54:Destroy();
																											if u8 then
																												u8:Cancel();
																												return;
																											end;
																										end;
																									else
																										u7:disconnect();
																										v54:Destroy();
																										if u8 then
																											u8:Cancel();
																											return;
																										end;
																									end;
																								elseif p18:IsDescendantOf(player.PlayerGui) then
																									if p18 then
																										if not p18.Parent then
																											u7:disconnect();
																											v54:Destroy();
																											if u8 then
																												u8:Cancel();
																												return;
																											end;
																										end;
																									else
																										u7:disconnect();
																										v54:Destroy();
																										if u8 then
																											u8:Cancel();
																											return;
																										end;
																									end;
																								else
																									u7:disconnect();
																									v54:Destroy();
																									if u8 then
																										u8:Cancel();
																										return;
																									end;
																								end;
																							elseif p18:IsDescendantOf(player.PlayerGui) then
																								if p18 then
																									if not p18.Parent then
																										u7:disconnect();
																										v54:Destroy();
																										if u8 then
																											u8:Cancel();
																											return;
																										end;
																									end;
																								else
																									u7:disconnect();
																									v54:Destroy();
																									if u8 then
																										u8:Cancel();
																										return;
																									end;
																								end;
																							else
																								u7:disconnect();
																								v54:Destroy();
																								if u8 then
																									u8:Cancel();
																									return;
																								end;
																							end;
																						elseif p18:IsDescendantOf(player.PlayerGui) then
																							if p18 then
																								if not p18.Parent then
																									u7:disconnect();
																									v54:Destroy();
																									if u8 then
																										u8:Cancel();
																										return;
																									end;
																								end;
																							else
																								u7:disconnect();
																								v54:Destroy();
																								if u8 then
																									u8:Cancel();
																									return;
																								end;
																							end;
																						else
																							u7:disconnect();
																							v54:Destroy();
																							if u8 then
																								u8:Cancel();
																								return;
																							end;
																						end;
																					elseif p18 then
																						if not p18.Parent then
																							u7:disconnect();
																							v54:Destroy();
																							if u8 then
																								u8:Cancel();
																								return;
																							end;
																						end;
																					else
																						u7:disconnect();
																						v54:Destroy();
																						if u8 then
																							u8:Cancel();
																							return;
																						end;
																					end;
																				else
																					u7:disconnect();
																					v54:Destroy();
																					if u8 then
																						u8:Cancel();
																						return;
																					end;
																				end;
																			end;
																		elseif p18:IsDescendantOf(player.PlayerGui) then
																			if player.PlayerGui.Menew.Locker.Visible then
																				if v53:FindFirstChild("Animated") then
																					if not v53.Animated:FindFirstChild("Horz") then
																						v69.OffsetStudsV = v69.OffsetStudsV + u6;
																					end;
																				end;
																				v69.OffsetStudsU = v69.OffsetStudsU - u6;
																				if p20 then
																					if p20 then
																						if p20:FindFirstChild("NRPBS") then
																							if p20:FindFirstChild("Status") then
																								if p20.Status.Alive.Value then
																									if p20.NRPBS.Health.Value <= 0 then
																										if p18:IsDescendantOf(player.PlayerGui) then
																											if p18 then
																												if not p18.Parent then
																													u7:disconnect();
																													v54:Destroy();
																													if u8 then
																														u8:Cancel();
																														return;
																													end;
																												end;
																											else
																												u7:disconnect();
																												v54:Destroy();
																												if u8 then
																													u8:Cancel();
																													return;
																												end;
																											end;
																										else
																											u7:disconnect();
																											v54:Destroy();
																											if u8 then
																												u8:Cancel();
																												return;
																											end;
																										end;
																									elseif p18 then
																										if not p18.Parent then
																											u7:disconnect();
																											v54:Destroy();
																											if u8 then
																												u8:Cancel();
																												return;
																											end;
																										end;
																									else
																										u7:disconnect();
																										v54:Destroy();
																										if u8 then
																											u8:Cancel();
																											return;
																										end;
																									end;
																								elseif p18:IsDescendantOf(player.PlayerGui) then
																									if p18 then
																										if not p18.Parent then
																											u7:disconnect();
																											v54:Destroy();
																											if u8 then
																												u8:Cancel();
																												return;
																											end;
																										end;
																									else
																										u7:disconnect();
																										v54:Destroy();
																										if u8 then
																											u8:Cancel();
																											return;
																										end;
																									end;
																								else
																									u7:disconnect();
																									v54:Destroy();
																									if u8 then
																										u8:Cancel();
																										return;
																									end;
																								end;
																							elseif p18:IsDescendantOf(player.PlayerGui) then
																								if p18 then
																									if not p18.Parent then
																										u7:disconnect();
																										v54:Destroy();
																										if u8 then
																											u8:Cancel();
																											return;
																										end;
																									end;
																								else
																									u7:disconnect();
																									v54:Destroy();
																									if u8 then
																										u8:Cancel();
																										return;
																									end;
																								end;
																							else
																								u7:disconnect();
																								v54:Destroy();
																								if u8 then
																									u8:Cancel();
																									return;
																								end;
																							end;
																						elseif p18:IsDescendantOf(player.PlayerGui) then
																							if p18 then
																								if not p18.Parent then
																									u7:disconnect();
																									v54:Destroy();
																									if u8 then
																										u8:Cancel();
																										return;
																									end;
																								end;
																							else
																								u7:disconnect();
																								v54:Destroy();
																								if u8 then
																									u8:Cancel();
																									return;
																								end;
																							end;
																						else
																							u7:disconnect();
																							v54:Destroy();
																							if u8 then
																								u8:Cancel();
																								return;
																							end;
																						end;
																					elseif p18 then
																						if not p18.Parent then
																							u7:disconnect();
																							v54:Destroy();
																							if u8 then
																								u8:Cancel();
																								return;
																							end;
																						end;
																					else
																						u7:disconnect();
																						v54:Destroy();
																						if u8 then
																							u8:Cancel();
																							return;
																						end;
																					end;
																				else
																					u7:disconnect();
																					v54:Destroy();
																					if u8 then
																						u8:Cancel();
																						return;
																					end;
																				end;
																			end;
																		end;
																	else
																		u7:disconnect();
																		v54:Destroy();
																		if u8 then
																			u8:Cancel();
																		end;
																	end;
																else
																	u7:disconnect();
																	v54:Destroy();
																	if u8 then
																		u8:Cancel();
																	end;
																end;
															end);
														elseif v53:FindFirstChild("Align") then
															u9 = nil;
															u10 = nil;
															u9 = v43:GetPropertyChangedSignal("Value"):connect(function()
																if p18 then
																	if p18.Parent then
																		if not p18:IsDescendantOf(player.PlayerGui) then
																			if not u5(v55) then
																				if p18:IsDescendantOf(player.PlayerGui) then
																					if player.PlayerGui.Menew.Locker.Visible then
																						u4(v63, v69);
																						if p20 then
																							if p20 then
																								if p20:FindFirstChild("NRPBS") then
																									if p20:FindFirstChild("Status") then
																										if p20.Status.Alive.Value then
																											if p20.NRPBS.Health.Value <= 0 then
																												if p18:IsDescendantOf(player.PlayerGui) then
																													if p18 then
																														if not p18.Parent then
																															u9:disconnect();
																															v54:Destroy();
																															if u10 then
																																u10:Cancel();
																																return;
																															end;
																														end;
																													else
																														u9:disconnect();
																														v54:Destroy();
																														if u10 then
																															u10:Cancel();
																															return;
																														end;
																													end;
																												else
																													u9:disconnect();
																													v54:Destroy();
																													if u10 then
																														u10:Cancel();
																														return;
																													end;
																												end;
																											elseif p18 then
																												if not p18.Parent then
																													u9:disconnect();
																													v54:Destroy();
																													if u10 then
																														u10:Cancel();
																														return;
																													end;
																												end;
																											else
																												u9:disconnect();
																												v54:Destroy();
																												if u10 then
																													u10:Cancel();
																													return;
																												end;
																											end;
																										elseif p18:IsDescendantOf(player.PlayerGui) then
																											if p18 then
																												if not p18.Parent then
																													u9:disconnect();
																													v54:Destroy();
																													if u10 then
																														u10:Cancel();
																														return;
																													end;
																												end;
																											else
																												u9:disconnect();
																												v54:Destroy();
																												if u10 then
																													u10:Cancel();
																													return;
																												end;
																											end;
																										else
																											u9:disconnect();
																											v54:Destroy();
																											if u10 then
																												u10:Cancel();
																												return;
																											end;
																										end;
																									elseif p18:IsDescendantOf(player.PlayerGui) then
																										if p18 then
																											if not p18.Parent then
																												u9:disconnect();
																												v54:Destroy();
																												if u10 then
																													u10:Cancel();
																													return;
																												end;
																											end;
																										else
																											u9:disconnect();
																											v54:Destroy();
																											if u10 then
																												u10:Cancel();
																												return;
																											end;
																										end;
																									else
																										u9:disconnect();
																										v54:Destroy();
																										if u10 then
																											u10:Cancel();
																											return;
																										end;
																									end;
																								elseif p18:IsDescendantOf(player.PlayerGui) then
																									if p18 then
																										if not p18.Parent then
																											u9:disconnect();
																											v54:Destroy();
																											if u10 then
																												u10:Cancel();
																												return;
																											end;
																										end;
																									else
																										u9:disconnect();
																										v54:Destroy();
																										if u10 then
																											u10:Cancel();
																											return;
																										end;
																									end;
																								else
																									u9:disconnect();
																									v54:Destroy();
																									if u10 then
																										u10:Cancel();
																										return;
																									end;
																								end;
																							elseif p18 then
																								if not p18.Parent then
																									u9:disconnect();
																									v54:Destroy();
																									if u10 then
																										u10:Cancel();
																										return;
																									end;
																								end;
																							else
																								u9:disconnect();
																								v54:Destroy();
																								if u10 then
																									u10:Cancel();
																									return;
																								end;
																							end;
																						else
																							u9:disconnect();
																							v54:Destroy();
																							if u10 then
																								u10:Cancel();
																								return;
																							end;
																						end;
																					end;
																				end;
																			else
																				u4(v63, v69);
																				if p20 then
																					if p20 then
																						if p20:FindFirstChild("NRPBS") then
																							if p20:FindFirstChild("Status") then
																								if p20.Status.Alive.Value then
																									if p20.NRPBS.Health.Value <= 0 then
																										if p18:IsDescendantOf(player.PlayerGui) then
																											if p18 then
																												if not p18.Parent then
																													u9:disconnect();
																													v54:Destroy();
																													if u10 then
																														u10:Cancel();
																														return;
																													end;
																												end;
																											else
																												u9:disconnect();
																												v54:Destroy();
																												if u10 then
																													u10:Cancel();
																													return;
																												end;
																											end;
																										else
																											u9:disconnect();
																											v54:Destroy();
																											if u10 then
																												u10:Cancel();
																												return;
																											end;
																										end;
																									elseif p18 then
																										if not p18.Parent then
																											u9:disconnect();
																											v54:Destroy();
																											if u10 then
																												u10:Cancel();
																												return;
																											end;
																										end;
																									else
																										u9:disconnect();
																										v54:Destroy();
																										if u10 then
																											u10:Cancel();
																											return;
																										end;
																									end;
																								elseif p18:IsDescendantOf(player.PlayerGui) then
																									if p18 then
																										if not p18.Parent then
																											u9:disconnect();
																											v54:Destroy();
																											if u10 then
																												u10:Cancel();
																												return;
																											end;
																										end;
																									else
																										u9:disconnect();
																										v54:Destroy();
																										if u10 then
																											u10:Cancel();
																											return;
																										end;
																									end;
																								else
																									u9:disconnect();
																									v54:Destroy();
																									if u10 then
																										u10:Cancel();
																										return;
																									end;
																								end;
																							elseif p18:IsDescendantOf(player.PlayerGui) then
																								if p18 then
																									if not p18.Parent then
																										u9:disconnect();
																										v54:Destroy();
																										if u10 then
																											u10:Cancel();
																											return;
																										end;
																									end;
																								else
																									u9:disconnect();
																									v54:Destroy();
																									if u10 then
																										u10:Cancel();
																										return;
																									end;
																								end;
																							else
																								u9:disconnect();
																								v54:Destroy();
																								if u10 then
																									u10:Cancel();
																									return;
																								end;
																							end;
																						elseif p18:IsDescendantOf(player.PlayerGui) then
																							if p18 then
																								if not p18.Parent then
																									u9:disconnect();
																									v54:Destroy();
																									if u10 then
																										u10:Cancel();
																										return;
																									end;
																								end;
																							else
																								u9:disconnect();
																								v54:Destroy();
																								if u10 then
																									u10:Cancel();
																									return;
																								end;
																							end;
																						else
																							u9:disconnect();
																							v54:Destroy();
																							if u10 then
																								u10:Cancel();
																								return;
																							end;
																						end;
																					elseif p18 then
																						if not p18.Parent then
																							u9:disconnect();
																							v54:Destroy();
																							if u10 then
																								u10:Cancel();
																								return;
																							end;
																						end;
																					else
																						u9:disconnect();
																						v54:Destroy();
																						if u10 then
																							u10:Cancel();
																							return;
																						end;
																					end;
																				else
																					u9:disconnect();
																					v54:Destroy();
																					if u10 then
																						u10:Cancel();
																						return;
																					end;
																				end;
																			end;
																		elseif p18:IsDescendantOf(player.PlayerGui) then
																			if player.PlayerGui.Menew.Locker.Visible then
																				u4(v63, v69);
																				if p20 then
																					if p20 then
																						if p20:FindFirstChild("NRPBS") then
																							if p20:FindFirstChild("Status") then
																								if p20.Status.Alive.Value then
																									if p20.NRPBS.Health.Value <= 0 then
																										if p18:IsDescendantOf(player.PlayerGui) then
																											if p18 then
																												if not p18.Parent then
																													u9:disconnect();
																													v54:Destroy();
																													if u10 then
																														u10:Cancel();
																														return;
																													end;
																												end;
																											else
																												u9:disconnect();
																												v54:Destroy();
																												if u10 then
																													u10:Cancel();
																													return;
																												end;
																											end;
																										else
																											u9:disconnect();
																											v54:Destroy();
																											if u10 then
																												u10:Cancel();
																												return;
																											end;
																										end;
																									elseif p18 then
																										if not p18.Parent then
																											u9:disconnect();
																											v54:Destroy();
																											if u10 then
																												u10:Cancel();
																												return;
																											end;
																										end;
																									else
																										u9:disconnect();
																										v54:Destroy();
																										if u10 then
																											u10:Cancel();
																											return;
																										end;
																									end;
																								elseif p18:IsDescendantOf(player.PlayerGui) then
																									if p18 then
																										if not p18.Parent then
																											u9:disconnect();
																											v54:Destroy();
																											if u10 then
																												u10:Cancel();
																												return;
																											end;
																										end;
																									else
																										u9:disconnect();
																										v54:Destroy();
																										if u10 then
																											u10:Cancel();
																											return;
																										end;
																									end;
																								else
																									u9:disconnect();
																									v54:Destroy();
																									if u10 then
																										u10:Cancel();
																										return;
																									end;
																								end;
																							elseif p18:IsDescendantOf(player.PlayerGui) then
																								if p18 then
																									if not p18.Parent then
																										u9:disconnect();
																										v54:Destroy();
																										if u10 then
																											u10:Cancel();
																											return;
																										end;
																									end;
																								else
																									u9:disconnect();
																									v54:Destroy();
																									if u10 then
																										u10:Cancel();
																										return;
																									end;
																								end;
																							else
																								u9:disconnect();
																								v54:Destroy();
																								if u10 then
																									u10:Cancel();
																									return;
																								end;
																							end;
																						elseif p18:IsDescendantOf(player.PlayerGui) then
																							if p18 then
																								if not p18.Parent then
																									u9:disconnect();
																									v54:Destroy();
																									if u10 then
																										u10:Cancel();
																										return;
																									end;
																								end;
																							else
																								u9:disconnect();
																								v54:Destroy();
																								if u10 then
																									u10:Cancel();
																									return;
																								end;
																							end;
																						else
																							u9:disconnect();
																							v54:Destroy();
																							if u10 then
																								u10:Cancel();
																								return;
																							end;
																						end;
																					elseif p18 then
																						if not p18.Parent then
																							u9:disconnect();
																							v54:Destroy();
																							if u10 then
																								u10:Cancel();
																								return;
																							end;
																						end;
																					else
																						u9:disconnect();
																						v54:Destroy();
																						if u10 then
																							u10:Cancel();
																							return;
																						end;
																					end;
																				else
																					u9:disconnect();
																					v54:Destroy();
																					if u10 then
																						u10:Cancel();
																						return;
																					end;
																				end;
																			end;
																		end;
																	else
																		u9:disconnect();
																		v54:Destroy();
																		if u10 then
																			u10:Cancel();
																		end;
																	end;
																else
																	u9:disconnect();
																	v54:Destroy();
																	if u10 then
																		u10:Cancel();
																	end;
																end;
															end);
														end;
														if v53:FindFirstChild("Sizer") then
															u11 = nil;
															u12 = nil;
															u11 = v54:GetPropertyChangedSignal("Value"):connect(function()
																if p18 then
																	if p18.Parent then
																		if not p18:IsDescendantOf(player.PlayerGui) then
																			if not u5(v55) then
																				if p18:IsDescendantOf(player.PlayerGui) then
																					if player.PlayerGui.Menew.Locker.Visible then
																						v69.StudsPerTileU = v54.Value;
																						v69.StudsPerTileV = v54.Value;
																						if p20 then
																							if p20 then
																								if p20:FindFirstChild("NRPBS") then
																									if p20:FindFirstChild("Status") then
																										if p20.Status.Alive.Value then
																											if p20.NRPBS.Health.Value <= 0 then
																												if p18:IsDescendantOf(player.PlayerGui) then
																													if p18 then
																														if not p18.Parent then
																															u11:disconnect();
																															v54:Destroy();
																															if u12 then
																																u12:Cancel();
																																return;
																															end;
																														end;
																													else
																														u11:disconnect();
																														v54:Destroy();
																														if u12 then
																															u12:Cancel();
																															return;
																														end;
																													end;
																												else
																													u11:disconnect();
																													v54:Destroy();
																													if u12 then
																														u12:Cancel();
																														return;
																													end;
																												end;
																											elseif p18 then
																												if not p18.Parent then
																													u11:disconnect();
																													v54:Destroy();
																													if u12 then
																														u12:Cancel();
																														return;
																													end;
																												end;
																											else
																												u11:disconnect();
																												v54:Destroy();
																												if u12 then
																													u12:Cancel();
																													return;
																												end;
																											end;
																										elseif p18:IsDescendantOf(player.PlayerGui) then
																											if p18 then
																												if not p18.Parent then
																													u11:disconnect();
																													v54:Destroy();
																													if u12 then
																														u12:Cancel();
																														return;
																													end;
																												end;
																											else
																												u11:disconnect();
																												v54:Destroy();
																												if u12 then
																													u12:Cancel();
																													return;
																												end;
																											end;
																										else
																											u11:disconnect();
																											v54:Destroy();
																											if u12 then
																												u12:Cancel();
																												return;
																											end;
																										end;
																									elseif p18:IsDescendantOf(player.PlayerGui) then
																										if p18 then
																											if not p18.Parent then
																												u11:disconnect();
																												v54:Destroy();
																												if u12 then
																													u12:Cancel();
																													return;
																												end;
																											end;
																										else
																											u11:disconnect();
																											v54:Destroy();
																											if u12 then
																												u12:Cancel();
																												return;
																											end;
																										end;
																									else
																										u11:disconnect();
																										v54:Destroy();
																										if u12 then
																											u12:Cancel();
																											return;
																										end;
																									end;
																								elseif p18:IsDescendantOf(player.PlayerGui) then
																									if p18 then
																										if not p18.Parent then
																											u11:disconnect();
																											v54:Destroy();
																											if u12 then
																												u12:Cancel();
																												return;
																											end;
																										end;
																									else
																										u11:disconnect();
																										v54:Destroy();
																										if u12 then
																											u12:Cancel();
																											return;
																										end;
																									end;
																								else
																									u11:disconnect();
																									v54:Destroy();
																									if u12 then
																										u12:Cancel();
																										return;
																									end;
																								end;
																							elseif p18 then
																								if not p18.Parent then
																									u11:disconnect();
																									v54:Destroy();
																									if u12 then
																										u12:Cancel();
																										return;
																									end;
																								end;
																							else
																								u11:disconnect();
																								v54:Destroy();
																								if u12 then
																									u12:Cancel();
																									return;
																								end;
																							end;
																						else
																							u11:disconnect();
																							v54:Destroy();
																							if u12 then
																								u12:Cancel();
																								return;
																							end;
																						end;
																					end;
																				end;
																			else
																				v69.StudsPerTileU = v54.Value;
																				v69.StudsPerTileV = v54.Value;
																				if p20 then
																					if p20 then
																						if p20:FindFirstChild("NRPBS") then
																							if p20:FindFirstChild("Status") then
																								if p20.Status.Alive.Value then
																									if p20.NRPBS.Health.Value <= 0 then
																										if p18:IsDescendantOf(player.PlayerGui) then
																											if p18 then
																												if not p18.Parent then
																													u11:disconnect();
																													v54:Destroy();
																													if u12 then
																														u12:Cancel();
																														return;
																													end;
																												end;
																											else
																												u11:disconnect();
																												v54:Destroy();
																												if u12 then
																													u12:Cancel();
																													return;
																												end;
																											end;
																										else
																											u11:disconnect();
																											v54:Destroy();
																											if u12 then
																												u12:Cancel();
																												return;
																											end;
																										end;
																									elseif p18 then
																										if not p18.Parent then
																											u11:disconnect();
																											v54:Destroy();
																											if u12 then
																												u12:Cancel();
																												return;
																											end;
																										end;
																									else
																										u11:disconnect();
																										v54:Destroy();
																										if u12 then
																											u12:Cancel();
																											return;
																										end;
																									end;
																								elseif p18:IsDescendantOf(player.PlayerGui) then
																									if p18 then
																										if not p18.Parent then
																											u11:disconnect();
																											v54:Destroy();
																											if u12 then
																												u12:Cancel();
																												return;
																											end;
																										end;
																									else
																										u11:disconnect();
																										v54:Destroy();
																										if u12 then
																											u12:Cancel();
																											return;
																										end;
																									end;
																								else
																									u11:disconnect();
																									v54:Destroy();
																									if u12 then
																										u12:Cancel();
																										return;
																									end;
																								end;
																							elseif p18:IsDescendantOf(player.PlayerGui) then
																								if p18 then
																									if not p18.Parent then
																										u11:disconnect();
																										v54:Destroy();
																										if u12 then
																											u12:Cancel();
																											return;
																										end;
																									end;
																								else
																									u11:disconnect();
																									v54:Destroy();
																									if u12 then
																										u12:Cancel();
																										return;
																									end;
																								end;
																							else
																								u11:disconnect();
																								v54:Destroy();
																								if u12 then
																									u12:Cancel();
																									return;
																								end;
																							end;
																						elseif p18:IsDescendantOf(player.PlayerGui) then
																							if p18 then
																								if not p18.Parent then
																									u11:disconnect();
																									v54:Destroy();
																									if u12 then
																										u12:Cancel();
																										return;
																									end;
																								end;
																							else
																								u11:disconnect();
																								v54:Destroy();
																								if u12 then
																									u12:Cancel();
																									return;
																								end;
																							end;
																						else
																							u11:disconnect();
																							v54:Destroy();
																							if u12 then
																								u12:Cancel();
																								return;
																							end;
																						end;
																					elseif p18 then
																						if not p18.Parent then
																							u11:disconnect();
																							v54:Destroy();
																							if u12 then
																								u12:Cancel();
																								return;
																							end;
																						end;
																					else
																						u11:disconnect();
																						v54:Destroy();
																						if u12 then
																							u12:Cancel();
																							return;
																						end;
																					end;
																				else
																					u11:disconnect();
																					v54:Destroy();
																					if u12 then
																						u12:Cancel();
																						return;
																					end;
																				end;
																			end;
																		elseif p18:IsDescendantOf(player.PlayerGui) then
																			if player.PlayerGui.Menew.Locker.Visible then
																				v69.StudsPerTileU = v54.Value;
																				v69.StudsPerTileV = v54.Value;
																				if p20 then
																					if p20 then
																						if p20:FindFirstChild("NRPBS") then
																							if p20:FindFirstChild("Status") then
																								if p20.Status.Alive.Value then
																									if p20.NRPBS.Health.Value <= 0 then
																										if p18:IsDescendantOf(player.PlayerGui) then
																											if p18 then
																												if not p18.Parent then
																													u11:disconnect();
																													v54:Destroy();
																													if u12 then
																														u12:Cancel();
																														return;
																													end;
																												end;
																											else
																												u11:disconnect();
																												v54:Destroy();
																												if u12 then
																													u12:Cancel();
																													return;
																												end;
																											end;
																										else
																											u11:disconnect();
																											v54:Destroy();
																											if u12 then
																												u12:Cancel();
																												return;
																											end;
																										end;
																									elseif p18 then
																										if not p18.Parent then
																											u11:disconnect();
																											v54:Destroy();
																											if u12 then
																												u12:Cancel();
																												return;
																											end;
																										end;
																									else
																										u11:disconnect();
																										v54:Destroy();
																										if u12 then
																											u12:Cancel();
																											return;
																										end;
																									end;
																								elseif p18:IsDescendantOf(player.PlayerGui) then
																									if p18 then
																										if not p18.Parent then
																											u11:disconnect();
																											v54:Destroy();
																											if u12 then
																												u12:Cancel();
																												return;
																											end;
																										end;
																									else
																										u11:disconnect();
																										v54:Destroy();
																										if u12 then
																											u12:Cancel();
																											return;
																										end;
																									end;
																								else
																									u11:disconnect();
																									v54:Destroy();
																									if u12 then
																										u12:Cancel();
																										return;
																									end;
																								end;
																							elseif p18:IsDescendantOf(player.PlayerGui) then
																								if p18 then
																									if not p18.Parent then
																										u11:disconnect();
																										v54:Destroy();
																										if u12 then
																											u12:Cancel();
																											return;
																										end;
																									end;
																								else
																									u11:disconnect();
																									v54:Destroy();
																									if u12 then
																										u12:Cancel();
																										return;
																									end;
																								end;
																							else
																								u11:disconnect();
																								v54:Destroy();
																								if u12 then
																									u12:Cancel();
																									return;
																								end;
																							end;
																						elseif p18:IsDescendantOf(player.PlayerGui) then
																							if p18 then
																								if not p18.Parent then
																									u11:disconnect();
																									v54:Destroy();
																									if u12 then
																										u12:Cancel();
																										return;
																									end;
																								end;
																							else
																								u11:disconnect();
																								v54:Destroy();
																								if u12 then
																									u12:Cancel();
																									return;
																								end;
																							end;
																						else
																							u11:disconnect();
																							v54:Destroy();
																							if u12 then
																								u12:Cancel();
																								return;
																							end;
																						end;
																					elseif p18 then
																						if not p18.Parent then
																							u11:disconnect();
																							v54:Destroy();
																							if u12 then
																								u12:Cancel();
																								return;
																							end;
																						end;
																					else
																						u11:disconnect();
																						v54:Destroy();
																						if u12 then
																							u12:Cancel();
																							return;
																						end;
																					end;
																				else
																					u11:disconnect();
																					v54:Destroy();
																					if u12 then
																						u12:Cancel();
																						return;
																					end;
																				end;
																			end;
																		end;
																	else
																		u11:disconnect();
																		v54:Destroy();
																		if u12 then
																			u12:Cancel();
																		end;
																	end;
																else
																	u11:disconnect();
																	v54:Destroy();
																	if u12 then
																		u12:Cancel();
																	end;
																end;
															end);
														end;
													end;												
												end;
											end;
										elseif v63.Material ~= Enum.Material.Wood then
											if not v55 then
												v55 = v63;
											end;
											v64, v65, v66 = pairs(v51);
											while true do
												v67, v68 = v64(v65, v66);
												if v67 then

												else
													break;
												end;
												v69 = script.Skin:Clone();
												v69.Texture = v53.Value;
												v69.Color3 = v53.Shade.Value;
												v69.StudsPerTileU = v53.Scale.Value;
												v69.StudsPerTileV = v53.Scale.Value;
												v69.Face = v68;
												v69.Parent = v63;
												u4(v63, v69);
												if not v53:FindFirstChild("No") then
													if p20 then
														if p20.Character then
															if p20.Character:FindFirstChild("Body Colors") then
																l__TorsoColor3__70 = p20.Character["Body Colors"].TorsoColor3;
																v71 = v53:FindFirstChild("Multiplier") and v53.Multiplier.Value or 1;
																v69.Color3 = Color3.new(l__TorsoColor3__70.r * v71, l__TorsoColor3__70.g * v71, l__TorsoColor3__70.b * v71);
															elseif v53:FindFirstChild("Multiplier") then
																l__Value__72 = v53.Shade.Value;
																v73 = v53:FindFirstChild("Multiplier") and v53.Multiplier.Value or 1;
																v69.Color3 = Color3.new(l__Value__72.r * v73, l__Value__72.g * v73, l__Value__72.b * v73);
															end;
														elseif v53:FindFirstChild("Multiplier") then
															l__Value__72 = v53.Shade.Value;
															v73 = v53:FindFirstChild("Multiplier") and v53.Multiplier.Value or 1;
															v69.Color3 = Color3.new(l__Value__72.r * v73, l__Value__72.g * v73, l__Value__72.b * v73);
														end;
													elseif v53:FindFirstChild("Multiplier") then
														l__Value__72 = v53.Shade.Value;
														v73 = v53:FindFirstChild("Multiplier") and v53.Multiplier.Value or 1;
														v69.Color3 = Color3.new(l__Value__72.r * v73, l__Value__72.g * v73, l__Value__72.b * v73);
													end;
												elseif v53:FindFirstChild("Multiplier") then
													l__Value__72 = v53.Shade.Value;
													v73 = v53:FindFirstChild("Multiplier") and v53.Multiplier.Value or 1;
													v69.Color3 = Color3.new(l__Value__72.r * v73, l__Value__72.g * v73, l__Value__72.b * v73);
												end;
												if v53:FindFirstChild("Neon") then
													v63.Material = Enum.Material.Neon;
													v63.BrickColor = v53.Neon.Value;
												end;
												if v53:FindFirstChild("Colored") then
													v63.BrickColor = v53.Colored.Value;
												end;
												if v53:FindFirstChild("Material") then
													v63.Material = v53.Material.Value;
												end;
												if v48 then
													v69.Color3 = Color3.new(1, 1, 1);
												end;
												if p20 == player then
													if v53:FindFirstChild("Animated") then
														v74 = v43:GetPropertyChangedSignal("Value");
														u6 = v53.Animated:FindFirstChild("Speed") and v53.Animated.Speed.Value or 0.01;
														u7 = nil;
														u8 = nil;
														u7 = v74:connect(function()
															if p18 then
																if p18.Parent then
																	if not p18:IsDescendantOf(player.PlayerGui) then
																		if not u5(v55) then
																			if p18:IsDescendantOf(player.PlayerGui) then
																				if player.PlayerGui.Menew.Locker.Visible then
																					if v53:FindFirstChild("Animated") then
																						if not v53.Animated:FindFirstChild("Horz") then
																							v69.OffsetStudsV = v69.OffsetStudsV + u6;
																						end;
																					end;
																					v69.OffsetStudsU = v69.OffsetStudsU - u6;
																					if p20 then
																						if p20 then
																							if p20:FindFirstChild("NRPBS") then
																								if p20:FindFirstChild("Status") then
																									if p20.Status.Alive.Value then
																										if p20.NRPBS.Health.Value <= 0 then
																											if p18:IsDescendantOf(player.PlayerGui) then
																												if p18 then
																													if not p18.Parent then
																														u7:disconnect();
																														v54:Destroy();
																														if u8 then
																															u8:Cancel();
																															return;
																														end;
																													end;
																												else
																													u7:disconnect();
																													v54:Destroy();
																													if u8 then
																														u8:Cancel();
																														return;
																													end;
																												end;
																											else
																												u7:disconnect();
																												v54:Destroy();
																												if u8 then
																													u8:Cancel();
																													return;
																												end;
																											end;
																										elseif p18 then
																											if not p18.Parent then
																												u7:disconnect();
																												v54:Destroy();
																												if u8 then
																													u8:Cancel();
																													return;
																												end;
																											end;
																										else
																											u7:disconnect();
																											v54:Destroy();
																											if u8 then
																												u8:Cancel();
																												return;
																											end;
																										end;
																									elseif p18:IsDescendantOf(player.PlayerGui) then
																										if p18 then
																											if not p18.Parent then
																												u7:disconnect();
																												v54:Destroy();
																												if u8 then
																													u8:Cancel();
																													return;
																												end;
																											end;
																										else
																											u7:disconnect();
																											v54:Destroy();
																											if u8 then
																												u8:Cancel();
																												return;
																											end;
																										end;
																									else
																										u7:disconnect();
																										v54:Destroy();
																										if u8 then
																											u8:Cancel();
																											return;
																										end;
																									end;
																								elseif p18:IsDescendantOf(player.PlayerGui) then
																									if p18 then
																										if not p18.Parent then
																											u7:disconnect();
																											v54:Destroy();
																											if u8 then
																												u8:Cancel();
																												return;
																											end;
																										end;
																									else
																										u7:disconnect();
																										v54:Destroy();
																										if u8 then
																											u8:Cancel();
																											return;
																										end;
																									end;
																								else
																									u7:disconnect();
																									v54:Destroy();
																									if u8 then
																										u8:Cancel();
																										return;
																									end;
																								end;
																							elseif p18:IsDescendantOf(player.PlayerGui) then
																								if p18 then
																									if not p18.Parent then
																										u7:disconnect();
																										v54:Destroy();
																										if u8 then
																											u8:Cancel();
																											return;
																										end;
																									end;
																								else
																									u7:disconnect();
																									v54:Destroy();
																									if u8 then
																										u8:Cancel();
																										return;
																									end;
																								end;
																							else
																								u7:disconnect();
																								v54:Destroy();
																								if u8 then
																									u8:Cancel();
																									return;
																								end;
																							end;
																						elseif p18 then
																							if not p18.Parent then
																								u7:disconnect();
																								v54:Destroy();
																								if u8 then
																									u8:Cancel();
																									return;
																								end;
																							end;
																						else
																							u7:disconnect();
																							v54:Destroy();
																							if u8 then
																								u8:Cancel();
																								return;
																							end;
																						end;
																					else
																						u7:disconnect();
																						v54:Destroy();
																						if u8 then
																							u8:Cancel();
																							return;
																						end;
																					end;
																				end;
																			end;
																		else
																			if v53:FindFirstChild("Animated") then
																				if not v53.Animated:FindFirstChild("Horz") then
																					v69.OffsetStudsV = v69.OffsetStudsV + u6;
																				end;
																			end;
																			v69.OffsetStudsU = v69.OffsetStudsU - u6;
																			if p20 then
																				if p20 then
																					if p20:FindFirstChild("NRPBS") then
																						if p20:FindFirstChild("Status") then
																							if p20.Status.Alive.Value then
																								if p20.NRPBS.Health.Value <= 0 then
																									if p18:IsDescendantOf(player.PlayerGui) then
																										if p18 then
																											if not p18.Parent then
																												u7:disconnect();
																												v54:Destroy();
																												if u8 then
																													u8:Cancel();
																													return;
																												end;
																											end;
																										else
																											u7:disconnect();
																											v54:Destroy();
																											if u8 then
																												u8:Cancel();
																												return;
																											end;
																										end;
																									else
																										u7:disconnect();
																										v54:Destroy();
																										if u8 then
																											u8:Cancel();
																											return;
																										end;
																									end;
																								elseif p18 then
																									if not p18.Parent then
																										u7:disconnect();
																										v54:Destroy();
																										if u8 then
																											u8:Cancel();
																											return;
																										end;
																									end;
																								else
																									u7:disconnect();
																									v54:Destroy();
																									if u8 then
																										u8:Cancel();
																										return;
																									end;
																								end;
																							elseif p18:IsDescendantOf(player.PlayerGui) then
																								if p18 then
																									if not p18.Parent then
																										u7:disconnect();
																										v54:Destroy();
																										if u8 then
																											u8:Cancel();
																											return;
																										end;
																									end;
																								else
																									u7:disconnect();
																									v54:Destroy();
																									if u8 then
																										u8:Cancel();
																										return;
																									end;
																								end;
																							else
																								u7:disconnect();
																								v54:Destroy();
																								if u8 then
																									u8:Cancel();
																									return;
																								end;
																							end;
																						elseif p18:IsDescendantOf(player.PlayerGui) then
																							if p18 then
																								if not p18.Parent then
																									u7:disconnect();
																									v54:Destroy();
																									if u8 then
																										u8:Cancel();
																										return;
																									end;
																								end;
																							else
																								u7:disconnect();
																								v54:Destroy();
																								if u8 then
																									u8:Cancel();
																									return;
																								end;
																							end;
																						else
																							u7:disconnect();
																							v54:Destroy();
																							if u8 then
																								u8:Cancel();
																								return;
																							end;
																						end;
																					elseif p18:IsDescendantOf(player.PlayerGui) then
																						if p18 then
																							if not p18.Parent then
																								u7:disconnect();
																								v54:Destroy();
																								if u8 then
																									u8:Cancel();
																									return;
																								end;
																							end;
																						else
																							u7:disconnect();
																							v54:Destroy();
																							if u8 then
																								u8:Cancel();
																								return;
																							end;
																						end;
																					else
																						u7:disconnect();
																						v54:Destroy();
																						if u8 then
																							u8:Cancel();
																							return;
																						end;
																					end;
																				elseif p18 then
																					if not p18.Parent then
																						u7:disconnect();
																						v54:Destroy();
																						if u8 then
																							u8:Cancel();
																							return;
																						end;
																					end;
																				else
																					u7:disconnect();
																					v54:Destroy();
																					if u8 then
																						u8:Cancel();
																						return;
																					end;
																				end;
																			else
																				u7:disconnect();
																				v54:Destroy();
																				if u8 then
																					u8:Cancel();
																					return;
																				end;
																			end;
																		end;
																	elseif p18:IsDescendantOf(player.PlayerGui) then
																		if player.PlayerGui.Menew.Locker.Visible then
																			if v53:FindFirstChild("Animated") then
																				if not v53.Animated:FindFirstChild("Horz") then
																					v69.OffsetStudsV = v69.OffsetStudsV + u6;
																				end;
																			end;
																			v69.OffsetStudsU = v69.OffsetStudsU - u6;
																			if p20 then
																				if p20 then
																					if p20:FindFirstChild("NRPBS") then
																						if p20:FindFirstChild("Status") then
																							if p20.Status.Alive.Value then
																								if p20.NRPBS.Health.Value <= 0 then
																									if p18:IsDescendantOf(player.PlayerGui) then
																										if p18 then
																											if not p18.Parent then
																												u7:disconnect();
																												v54:Destroy();
																												if u8 then
																													u8:Cancel();
																													return;
																												end;
																											end;
																										else
																											u7:disconnect();
																											v54:Destroy();
																											if u8 then
																												u8:Cancel();
																												return;
																											end;
																										end;
																									else
																										u7:disconnect();
																										v54:Destroy();
																										if u8 then
																											u8:Cancel();
																											return;
																										end;
																									end;
																								elseif p18 then
																									if not p18.Parent then
																										u7:disconnect();
																										v54:Destroy();
																										if u8 then
																											u8:Cancel();
																											return;
																										end;
																									end;
																								else
																									u7:disconnect();
																									v54:Destroy();
																									if u8 then
																										u8:Cancel();
																										return;
																									end;
																								end;
																							elseif p18:IsDescendantOf(player.PlayerGui) then
																								if p18 then
																									if not p18.Parent then
																										u7:disconnect();
																										v54:Destroy();
																										if u8 then
																											u8:Cancel();
																											return;
																										end;
																									end;
																								else
																									u7:disconnect();
																									v54:Destroy();
																									if u8 then
																										u8:Cancel();
																										return;
																									end;
																								end;
																							else
																								u7:disconnect();
																								v54:Destroy();
																								if u8 then
																									u8:Cancel();
																									return;
																								end;
																							end;
																						elseif p18:IsDescendantOf(player.PlayerGui) then
																							if p18 then
																								if not p18.Parent then
																									u7:disconnect();
																									v54:Destroy();
																									if u8 then
																										u8:Cancel();
																										return;
																									end;
																								end;
																							else
																								u7:disconnect();
																								v54:Destroy();
																								if u8 then
																									u8:Cancel();
																									return;
																								end;
																							end;
																						else
																							u7:disconnect();
																							v54:Destroy();
																							if u8 then
																								u8:Cancel();
																								return;
																							end;
																						end;
																					elseif p18:IsDescendantOf(player.PlayerGui) then
																						if p18 then
																							if not p18.Parent then
																								u7:disconnect();
																								v54:Destroy();
																								if u8 then
																									u8:Cancel();
																									return;
																								end;
																							end;
																						else
																							u7:disconnect();
																							v54:Destroy();
																							if u8 then
																								u8:Cancel();
																								return;
																							end;
																						end;
																					else
																						u7:disconnect();
																						v54:Destroy();
																						if u8 then
																							u8:Cancel();
																							return;
																						end;
																					end;
																				elseif p18 then
																					if not p18.Parent then
																						u7:disconnect();
																						v54:Destroy();
																						if u8 then
																							u8:Cancel();
																							return;
																						end;
																					end;
																				else
																					u7:disconnect();
																					v54:Destroy();
																					if u8 then
																						u8:Cancel();
																						return;
																					end;
																				end;
																			else
																				u7:disconnect();
																				v54:Destroy();
																				if u8 then
																					u8:Cancel();
																					return;
																				end;
																			end;
																		end;
																	end;
																else
																	u7:disconnect();
																	v54:Destroy();
																	if u8 then
																		u8:Cancel();
																	end;
																end;
															else
																u7:disconnect();
																v54:Destroy();
																if u8 then
																	u8:Cancel();
																end;
															end;
														end);
													elseif v53:FindFirstChild("Align") then
														u9 = nil;
														u10 = nil;
														u9 = v43:GetPropertyChangedSignal("Value"):connect(function()
															if p18 then
																if p18.Parent then
																	if not p18:IsDescendantOf(player.PlayerGui) then
																		if not u5(v55) then
																			if p18:IsDescendantOf(player.PlayerGui) then
																				if player.PlayerGui.Menew.Locker.Visible then
																					u4(v63, v69);
																					if p20 then
																						if p20 then
																							if p20:FindFirstChild("NRPBS") then
																								if p20:FindFirstChild("Status") then
																									if p20.Status.Alive.Value then
																										if p20.NRPBS.Health.Value <= 0 then
																											if p18:IsDescendantOf(player.PlayerGui) then
																												if p18 then
																													if not p18.Parent then
																														u9:disconnect();
																														v54:Destroy();
																														if u10 then
																															u10:Cancel();
																															return;
																														end;
																													end;
																												else
																													u9:disconnect();
																													v54:Destroy();
																													if u10 then
																														u10:Cancel();
																														return;
																													end;
																												end;
																											else
																												u9:disconnect();
																												v54:Destroy();
																												if u10 then
																													u10:Cancel();
																													return;
																												end;
																											end;
																										elseif p18 then
																											if not p18.Parent then
																												u9:disconnect();
																												v54:Destroy();
																												if u10 then
																													u10:Cancel();
																													return;
																												end;
																											end;
																										else
																											u9:disconnect();
																											v54:Destroy();
																											if u10 then
																												u10:Cancel();
																												return;
																											end;
																										end;
																									elseif p18:IsDescendantOf(player.PlayerGui) then
																										if p18 then
																											if not p18.Parent then
																												u9:disconnect();
																												v54:Destroy();
																												if u10 then
																													u10:Cancel();
																													return;
																												end;
																											end;
																										else
																											u9:disconnect();
																											v54:Destroy();
																											if u10 then
																												u10:Cancel();
																												return;
																											end;
																										end;
																									else
																										u9:disconnect();
																										v54:Destroy();
																										if u10 then
																											u10:Cancel();
																											return;
																										end;
																									end;
																								elseif p18:IsDescendantOf(player.PlayerGui) then
																									if p18 then
																										if not p18.Parent then
																											u9:disconnect();
																											v54:Destroy();
																											if u10 then
																												u10:Cancel();
																												return;
																											end;
																										end;
																									else
																										u9:disconnect();
																										v54:Destroy();
																										if u10 then
																											u10:Cancel();
																											return;
																										end;
																									end;
																								else
																									u9:disconnect();
																									v54:Destroy();
																									if u10 then
																										u10:Cancel();
																										return;
																									end;
																								end;
																							elseif p18:IsDescendantOf(player.PlayerGui) then
																								if p18 then
																									if not p18.Parent then
																										u9:disconnect();
																										v54:Destroy();
																										if u10 then
																											u10:Cancel();
																											return;
																										end;
																									end;
																								else
																									u9:disconnect();
																									v54:Destroy();
																									if u10 then
																										u10:Cancel();
																										return;
																									end;
																								end;
																							else
																								u9:disconnect();
																								v54:Destroy();
																								if u10 then
																									u10:Cancel();
																									return;
																								end;
																							end;
																						elseif p18 then
																							if not p18.Parent then
																								u9:disconnect();
																								v54:Destroy();
																								if u10 then
																									u10:Cancel();
																									return;
																								end;
																							end;
																						else
																							u9:disconnect();
																							v54:Destroy();
																							if u10 then
																								u10:Cancel();
																								return;
																							end;
																						end;
																					else
																						u9:disconnect();
																						v54:Destroy();
																						if u10 then
																							u10:Cancel();
																							return;
																						end;
																					end;
																				end;
																			end;
																		else
																			u4(v63, v69);
																			if p20 then
																				if p20 then
																					if p20:FindFirstChild("NRPBS") then
																						if p20:FindFirstChild("Status") then
																							if p20.Status.Alive.Value then
																								if p20.NRPBS.Health.Value <= 0 then
																									if p18:IsDescendantOf(player.PlayerGui) then
																										if p18 then
																											if not p18.Parent then
																												u9:disconnect();
																												v54:Destroy();
																												if u10 then
																													u10:Cancel();
																													return;
																												end;
																											end;
																										else
																											u9:disconnect();
																											v54:Destroy();
																											if u10 then
																												u10:Cancel();
																												return;
																											end;
																										end;
																									else
																										u9:disconnect();
																										v54:Destroy();
																										if u10 then
																											u10:Cancel();
																											return;
																										end;
																									end;
																								elseif p18 then
																									if not p18.Parent then
																										u9:disconnect();
																										v54:Destroy();
																										if u10 then
																											u10:Cancel();
																											return;
																										end;
																									end;
																								else
																									u9:disconnect();
																									v54:Destroy();
																									if u10 then
																										u10:Cancel();
																										return;
																									end;
																								end;
																							elseif p18:IsDescendantOf(player.PlayerGui) then
																								if p18 then
																									if not p18.Parent then
																										u9:disconnect();
																										v54:Destroy();
																										if u10 then
																											u10:Cancel();
																											return;
																										end;
																									end;
																								else
																									u9:disconnect();
																									v54:Destroy();
																									if u10 then
																										u10:Cancel();
																										return;
																									end;
																								end;
																							else
																								u9:disconnect();
																								v54:Destroy();
																								if u10 then
																									u10:Cancel();
																									return;
																								end;
																							end;
																						elseif p18:IsDescendantOf(player.PlayerGui) then
																							if p18 then
																								if not p18.Parent then
																									u9:disconnect();
																									v54:Destroy();
																									if u10 then
																										u10:Cancel();
																										return;
																									end;
																								end;
																							else
																								u9:disconnect();
																								v54:Destroy();
																								if u10 then
																									u10:Cancel();
																									return;
																								end;
																							end;
																						else
																							u9:disconnect();
																							v54:Destroy();
																							if u10 then
																								u10:Cancel();
																								return;
																							end;
																						end;
																					elseif p18:IsDescendantOf(player.PlayerGui) then
																						if p18 then
																							if not p18.Parent then
																								u9:disconnect();
																								v54:Destroy();
																								if u10 then
																									u10:Cancel();
																									return;
																								end;
																							end;
																						else
																							u9:disconnect();
																							v54:Destroy();
																							if u10 then
																								u10:Cancel();
																								return;
																							end;
																						end;
																					else
																						u9:disconnect();
																						v54:Destroy();
																						if u10 then
																							u10:Cancel();
																							return;
																						end;
																					end;
																				elseif p18 then
																					if not p18.Parent then
																						u9:disconnect();
																						v54:Destroy();
																						if u10 then
																							u10:Cancel();
																							return;
																						end;
																					end;
																				else
																					u9:disconnect();
																					v54:Destroy();
																					if u10 then
																						u10:Cancel();
																						return;
																					end;
																				end;
																			else
																				u9:disconnect();
																				v54:Destroy();
																				if u10 then
																					u10:Cancel();
																					return;
																				end;
																			end;
																		end;
																	elseif p18:IsDescendantOf(player.PlayerGui) then
																		if player.PlayerGui.Menew.Locker.Visible then
																			u4(v63, v69);
																			if p20 then
																				if p20 then
																					if p20:FindFirstChild("NRPBS") then
																						if p20:FindFirstChild("Status") then
																							if p20.Status.Alive.Value then
																								if p20.NRPBS.Health.Value <= 0 then
																									if p18:IsDescendantOf(player.PlayerGui) then
																										if p18 then
																											if not p18.Parent then
																												u9:disconnect();
																												v54:Destroy();
																												if u10 then
																													u10:Cancel();
																													return;
																												end;
																											end;
																										else
																											u9:disconnect();
																											v54:Destroy();
																											if u10 then
																												u10:Cancel();
																												return;
																											end;
																										end;
																									else
																										u9:disconnect();
																										v54:Destroy();
																										if u10 then
																											u10:Cancel();
																											return;
																										end;
																									end;
																								elseif p18 then
																									if not p18.Parent then
																										u9:disconnect();
																										v54:Destroy();
																										if u10 then
																											u10:Cancel();
																											return;
																										end;
																									end;
																								else
																									u9:disconnect();
																									v54:Destroy();
																									if u10 then
																										u10:Cancel();
																										return;
																									end;
																								end;
																							elseif p18:IsDescendantOf(player.PlayerGui) then
																								if p18 then
																									if not p18.Parent then
																										u9:disconnect();
																										v54:Destroy();
																										if u10 then
																											u10:Cancel();
																											return;
																										end;
																									end;
																								else
																									u9:disconnect();
																									v54:Destroy();
																									if u10 then
																										u10:Cancel();
																										return;
																									end;
																								end;
																							else
																								u9:disconnect();
																								v54:Destroy();
																								if u10 then
																									u10:Cancel();
																									return;
																								end;
																							end;
																						elseif p18:IsDescendantOf(player.PlayerGui) then
																							if p18 then
																								if not p18.Parent then
																									u9:disconnect();
																									v54:Destroy();
																									if u10 then
																										u10:Cancel();
																										return;
																									end;
																								end;
																							else
																								u9:disconnect();
																								v54:Destroy();
																								if u10 then
																									u10:Cancel();
																									return;
																								end;
																							end;
																						else
																							u9:disconnect();
																							v54:Destroy();
																							if u10 then
																								u10:Cancel();
																								return;
																							end;
																						end;
																					elseif p18:IsDescendantOf(player.PlayerGui) then
																						if p18 then
																							if not p18.Parent then
																								u9:disconnect();
																								v54:Destroy();
																								if u10 then
																									u10:Cancel();
																									return;
																								end;
																							end;
																						else
																							u9:disconnect();
																							v54:Destroy();
																							if u10 then
																								u10:Cancel();
																								return;
																							end;
																						end;
																					else
																						u9:disconnect();
																						v54:Destroy();
																						if u10 then
																							u10:Cancel();
																							return;
																						end;
																					end;
																				elseif p18 then
																					if not p18.Parent then
																						u9:disconnect();
																						v54:Destroy();
																						if u10 then
																							u10:Cancel();
																							return;
																						end;
																					end;
																				else
																					u9:disconnect();
																					v54:Destroy();
																					if u10 then
																						u10:Cancel();
																						return;
																					end;
																				end;
																			else
																				u9:disconnect();
																				v54:Destroy();
																				if u10 then
																					u10:Cancel();
																					return;
																				end;
																			end;
																		end;
																	end;
																else
																	u9:disconnect();
																	v54:Destroy();
																	if u10 then
																		u10:Cancel();
																	end;
																end;
															else
																u9:disconnect();
																v54:Destroy();
																if u10 then
																	u10:Cancel();
																end;
															end;
														end);
													end;
													if v53:FindFirstChild("Sizer") then
														u11 = nil;
														u12 = nil;
														u11 = v54:GetPropertyChangedSignal("Value"):connect(function()
															if p18 then
																if p18.Parent then
																	if not p18:IsDescendantOf(player.PlayerGui) then
																		if not u5(v55) then
																			if p18:IsDescendantOf(player.PlayerGui) then
																				if player.PlayerGui.Menew.Locker.Visible then
																					v69.StudsPerTileU = v54.Value;
																					v69.StudsPerTileV = v54.Value;
																					if p20 then
																						if p20 then
																							if p20:FindFirstChild("NRPBS") then
																								if p20:FindFirstChild("Status") then
																									if p20.Status.Alive.Value then
																										if p20.NRPBS.Health.Value <= 0 then
																											if p18:IsDescendantOf(player.PlayerGui) then
																												if p18 then
																													if not p18.Parent then
																														u11:disconnect();
																														v54:Destroy();
																														if u12 then
																															u12:Cancel();
																															return;
																														end;
																													end;
																												else
																													u11:disconnect();
																													v54:Destroy();
																													if u12 then
																														u12:Cancel();
																														return;
																													end;
																												end;
																											else
																												u11:disconnect();
																												v54:Destroy();
																												if u12 then
																													u12:Cancel();
																													return;
																												end;
																											end;
																										elseif p18 then
																											if not p18.Parent then
																												u11:disconnect();
																												v54:Destroy();
																												if u12 then
																													u12:Cancel();
																													return;
																												end;
																											end;
																										else
																											u11:disconnect();
																											v54:Destroy();
																											if u12 then
																												u12:Cancel();
																												return;
																											end;
																										end;
																									elseif p18:IsDescendantOf(player.PlayerGui) then
																										if p18 then
																											if not p18.Parent then
																												u11:disconnect();
																												v54:Destroy();
																												if u12 then
																													u12:Cancel();
																													return;
																												end;
																											end;
																										else
																											u11:disconnect();
																											v54:Destroy();
																											if u12 then
																												u12:Cancel();
																												return;
																											end;
																										end;
																									else
																										u11:disconnect();
																										v54:Destroy();
																										if u12 then
																											u12:Cancel();
																											return;
																										end;
																									end;
																								elseif p18:IsDescendantOf(player.PlayerGui) then
																									if p18 then
																										if not p18.Parent then
																											u11:disconnect();
																											v54:Destroy();
																											if u12 then
																												u12:Cancel();
																												return;
																											end;
																										end;
																									else
																										u11:disconnect();
																										v54:Destroy();
																										if u12 then
																											u12:Cancel();
																											return;
																										end;
																									end;
																								else
																									u11:disconnect();
																									v54:Destroy();
																									if u12 then
																										u12:Cancel();
																										return;
																									end;
																								end;
																							elseif p18:IsDescendantOf(player.PlayerGui) then
																								if p18 then
																									if not p18.Parent then
																										u11:disconnect();
																										v54:Destroy();
																										if u12 then
																											u12:Cancel();
																											return;
																										end;
																									end;
																								else
																									u11:disconnect();
																									v54:Destroy();
																									if u12 then
																										u12:Cancel();
																										return;
																									end;
																								end;
																							else
																								u11:disconnect();
																								v54:Destroy();
																								if u12 then
																									u12:Cancel();
																									return;
																								end;
																							end;
																						elseif p18 then
																							if not p18.Parent then
																								u11:disconnect();
																								v54:Destroy();
																								if u12 then
																									u12:Cancel();
																									return;
																								end;
																							end;
																						else
																							u11:disconnect();
																							v54:Destroy();
																							if u12 then
																								u12:Cancel();
																								return;
																							end;
																						end;
																					else
																						u11:disconnect();
																						v54:Destroy();
																						if u12 then
																							u12:Cancel();
																							return;
																						end;
																					end;
																				end;
																			end;
																		else
																			v69.StudsPerTileU = v54.Value;
																			v69.StudsPerTileV = v54.Value;
																			if p20 then
																				if p20 then
																					if p20:FindFirstChild("NRPBS") then
																						if p20:FindFirstChild("Status") then
																							if p20.Status.Alive.Value then
																								if p20.NRPBS.Health.Value <= 0 then
																									if p18:IsDescendantOf(player.PlayerGui) then
																										if p18 then
																											if not p18.Parent then
																												u11:disconnect();
																												v54:Destroy();
																												if u12 then
																													u12:Cancel();
																													return;
																												end;
																											end;
																										else
																											u11:disconnect();
																											v54:Destroy();
																											if u12 then
																												u12:Cancel();
																												return;
																											end;
																										end;
																									else
																										u11:disconnect();
																										v54:Destroy();
																										if u12 then
																											u12:Cancel();
																											return;
																										end;
																									end;
																								elseif p18 then
																									if not p18.Parent then
																										u11:disconnect();
																										v54:Destroy();
																										if u12 then
																											u12:Cancel();
																											return;
																										end;
																									end;
																								else
																									u11:disconnect();
																									v54:Destroy();
																									if u12 then
																										u12:Cancel();
																										return;
																									end;
																								end;
																							elseif p18:IsDescendantOf(player.PlayerGui) then
																								if p18 then
																									if not p18.Parent then
																										u11:disconnect();
																										v54:Destroy();
																										if u12 then
																											u12:Cancel();
																											return;
																										end;
																									end;
																								else
																									u11:disconnect();
																									v54:Destroy();
																									if u12 then
																										u12:Cancel();
																										return;
																									end;
																								end;
																							else
																								u11:disconnect();
																								v54:Destroy();
																								if u12 then
																									u12:Cancel();
																									return;
																								end;
																							end;
																						elseif p18:IsDescendantOf(player.PlayerGui) then
																							if p18 then
																								if not p18.Parent then
																									u11:disconnect();
																									v54:Destroy();
																									if u12 then
																										u12:Cancel();
																										return;
																									end;
																								end;
																							else
																								u11:disconnect();
																								v54:Destroy();
																								if u12 then
																									u12:Cancel();
																									return;
																								end;
																							end;
																						else
																							u11:disconnect();
																							v54:Destroy();
																							if u12 then
																								u12:Cancel();
																								return;
																							end;
																						end;
																					elseif p18:IsDescendantOf(player.PlayerGui) then
																						if p18 then
																							if not p18.Parent then
																								u11:disconnect();
																								v54:Destroy();
																								if u12 then
																									u12:Cancel();
																									return;
																								end;
																							end;
																						else
																							u11:disconnect();
																							v54:Destroy();
																							if u12 then
																								u12:Cancel();
																								return;
																							end;
																						end;
																					else
																						u11:disconnect();
																						v54:Destroy();
																						if u12 then
																							u12:Cancel();
																							return;
																						end;
																					end;
																				elseif p18 then
																					if not p18.Parent then
																						u11:disconnect();
																						v54:Destroy();
																						if u12 then
																							u12:Cancel();
																							return;
																						end;
																					end;
																				else
																					u11:disconnect();
																					v54:Destroy();
																					if u12 then
																						u12:Cancel();
																						return;
																					end;
																				end;
																			else
																				u11:disconnect();
																				v54:Destroy();
																				if u12 then
																					u12:Cancel();
																					return;
																				end;
																			end;
																		end;
																	elseif p18:IsDescendantOf(player.PlayerGui) then
																		if player.PlayerGui.Menew.Locker.Visible then
																			v69.StudsPerTileU = v54.Value;
																			v69.StudsPerTileV = v54.Value;
																			if p20 then
																				if p20 then
																					if p20:FindFirstChild("NRPBS") then
																						if p20:FindFirstChild("Status") then
																							if p20.Status.Alive.Value then
																								if p20.NRPBS.Health.Value <= 0 then
																									if p18:IsDescendantOf(player.PlayerGui) then
																										if p18 then
																											if not p18.Parent then
																												u11:disconnect();
																												v54:Destroy();
																												if u12 then
																													u12:Cancel();
																													return;
																												end;
																											end;
																										else
																											u11:disconnect();
																											v54:Destroy();
																											if u12 then
																												u12:Cancel();
																												return;
																											end;
																										end;
																									else
																										u11:disconnect();
																										v54:Destroy();
																										if u12 then
																											u12:Cancel();
																											return;
																										end;
																									end;
																								elseif p18 then
																									if not p18.Parent then
																										u11:disconnect();
																										v54:Destroy();
																										if u12 then
																											u12:Cancel();
																											return;
																										end;
																									end;
																								else
																									u11:disconnect();
																									v54:Destroy();
																									if u12 then
																										u12:Cancel();
																										return;
																									end;
																								end;
																							elseif p18:IsDescendantOf(player.PlayerGui) then
																								if p18 then
																									if not p18.Parent then
																										u11:disconnect();
																										v54:Destroy();
																										if u12 then
																											u12:Cancel();
																											return;
																										end;
																									end;
																								else
																									u11:disconnect();
																									v54:Destroy();
																									if u12 then
																										u12:Cancel();
																										return;
																									end;
																								end;
																							else
																								u11:disconnect();
																								v54:Destroy();
																								if u12 then
																									u12:Cancel();
																									return;
																								end;
																							end;
																						elseif p18:IsDescendantOf(player.PlayerGui) then
																							if p18 then
																								if not p18.Parent then
																									u11:disconnect();
																									v54:Destroy();
																									if u12 then
																										u12:Cancel();
																										return;
																									end;
																								end;
																							else
																								u11:disconnect();
																								v54:Destroy();
																								if u12 then
																									u12:Cancel();
																									return;
																								end;
																							end;
																						else
																							u11:disconnect();
																							v54:Destroy();
																							if u12 then
																								u12:Cancel();
																								return;
																							end;
																						end;
																					elseif p18:IsDescendantOf(player.PlayerGui) then
																						if p18 then
																							if not p18.Parent then
																								u11:disconnect();
																								v54:Destroy();
																								if u12 then
																									u12:Cancel();
																									return;
																								end;
																							end;
																						else
																							u11:disconnect();
																							v54:Destroy();
																							if u12 then
																								u12:Cancel();
																								return;
																							end;
																						end;
																					else
																						u11:disconnect();
																						v54:Destroy();
																						if u12 then
																							u12:Cancel();
																							return;
																						end;
																					end;
																				elseif p18 then
																					if not p18.Parent then
																						u11:disconnect();
																						v54:Destroy();
																						if u12 then
																							u12:Cancel();
																							return;
																						end;
																					end;
																				else
																					u11:disconnect();
																					v54:Destroy();
																					if u12 then
																						u12:Cancel();
																						return;
																					end;
																				end;
																			else
																				u11:disconnect();
																				v54:Destroy();
																				if u12 then
																					u12:Cancel();
																					return;
																				end;
																			end;
																		end;
																	end;
																else
																	u11:disconnect();
																	v54:Destroy();
																	if u12 then
																		u12:Cancel();
																	end;
																end;
															else
																u11:disconnect();
																v54:Destroy();
																if u12 then
																	u12:Cancel();
																end;
															end;
														end);
													end;
												end;											
											end;
										end;
									elseif v63.Material ~= Enum.Material.Wood then
										if not v55 then
											v55 = v63;
										end;
										v64, v65, v66 = pairs(v51);
										while true do
											v67, v68 = v64(v65, v66);
											if v67 then

											else
												break;
											end;
											v69 = script.Skin:Clone();
											v69.Texture = v53.Value;
											v69.Color3 = v53.Shade.Value;
											v69.StudsPerTileU = v53.Scale.Value;
											v69.StudsPerTileV = v53.Scale.Value;
											v69.Face = v68;
											v69.Parent = v63;
											u4(v63, v69);
											if not v53:FindFirstChild("No") then
												if p20 then
													if p20.Character then
														if p20.Character:FindFirstChild("Body Colors") then
															l__TorsoColor3__70 = p20.Character["Body Colors"].TorsoColor3;
															v71 = v53:FindFirstChild("Multiplier") and v53.Multiplier.Value or 1;
															v69.Color3 = Color3.new(l__TorsoColor3__70.r * v71, l__TorsoColor3__70.g * v71, l__TorsoColor3__70.b * v71);
														elseif v53:FindFirstChild("Multiplier") then
															l__Value__72 = v53.Shade.Value;
															v73 = v53:FindFirstChild("Multiplier") and v53.Multiplier.Value or 1;
															v69.Color3 = Color3.new(l__Value__72.r * v73, l__Value__72.g * v73, l__Value__72.b * v73);
														end;
													elseif v53:FindFirstChild("Multiplier") then
														l__Value__72 = v53.Shade.Value;
														v73 = v53:FindFirstChild("Multiplier") and v53.Multiplier.Value or 1;
														v69.Color3 = Color3.new(l__Value__72.r * v73, l__Value__72.g * v73, l__Value__72.b * v73);
													end;
												elseif v53:FindFirstChild("Multiplier") then
													l__Value__72 = v53.Shade.Value;
													v73 = v53:FindFirstChild("Multiplier") and v53.Multiplier.Value or 1;
													v69.Color3 = Color3.new(l__Value__72.r * v73, l__Value__72.g * v73, l__Value__72.b * v73);
												end;
											elseif v53:FindFirstChild("Multiplier") then
												l__Value__72 = v53.Shade.Value;
												v73 = v53:FindFirstChild("Multiplier") and v53.Multiplier.Value or 1;
												v69.Color3 = Color3.new(l__Value__72.r * v73, l__Value__72.g * v73, l__Value__72.b * v73);
											end;
											if v53:FindFirstChild("Neon") then
												v63.Material = Enum.Material.Neon;
												v63.BrickColor = v53.Neon.Value;
											end;
											if v53:FindFirstChild("Colored") then
												v63.BrickColor = v53.Colored.Value;
											end;
											if v53:FindFirstChild("Material") then
												v63.Material = v53.Material.Value;
											end;
											if v48 then
												v69.Color3 = Color3.new(1, 1, 1);
											end;
											if p20 == player then
												if v53:FindFirstChild("Animated") then
													v74 = v43:GetPropertyChangedSignal("Value");
													u6 = v53.Animated:FindFirstChild("Speed") and v53.Animated.Speed.Value or 0.01;
													u7 = nil;
													u8 = nil;
													u7 = v74:connect(function()
														if p18 then
															if p18.Parent then
																if not p18:IsDescendantOf(player.PlayerGui) then
																	if not u5(v55) then
																		if p18:IsDescendantOf(player.PlayerGui) then
																			if player.PlayerGui.Menew.Locker.Visible then
																				if v53:FindFirstChild("Animated") then
																					if not v53.Animated:FindFirstChild("Horz") then
																						v69.OffsetStudsV = v69.OffsetStudsV + u6;
																					end;
																				end;
																				v69.OffsetStudsU = v69.OffsetStudsU - u6;
																				if p20 then
																					if p20 then
																						if p20:FindFirstChild("NRPBS") then
																							if p20:FindFirstChild("Status") then
																								if p20.Status.Alive.Value then
																									if p20.NRPBS.Health.Value <= 0 then
																										if p18:IsDescendantOf(player.PlayerGui) then
																											if p18 then
																												if not p18.Parent then
																													u7:disconnect();
																													v54:Destroy();
																													if u8 then
																														u8:Cancel();
																														return;
																													end;
																												end;
																											else
																												u7:disconnect();
																												v54:Destroy();
																												if u8 then
																													u8:Cancel();
																													return;
																												end;
																											end;
																										else
																											u7:disconnect();
																											v54:Destroy();
																											if u8 then
																												u8:Cancel();
																												return;
																											end;
																										end;
																									elseif p18 then
																										if not p18.Parent then
																											u7:disconnect();
																											v54:Destroy();
																											if u8 then
																												u8:Cancel();
																												return;
																											end;
																										end;
																									else
																										u7:disconnect();
																										v54:Destroy();
																										if u8 then
																											u8:Cancel();
																											return;
																										end;
																									end;
																								elseif p18:IsDescendantOf(player.PlayerGui) then
																									if p18 then
																										if not p18.Parent then
																											u7:disconnect();
																											v54:Destroy();
																											if u8 then
																												u8:Cancel();
																												return;
																											end;
																										end;
																									else
																										u7:disconnect();
																										v54:Destroy();
																										if u8 then
																											u8:Cancel();
																											return;
																										end;
																									end;
																								else
																									u7:disconnect();
																									v54:Destroy();
																									if u8 then
																										u8:Cancel();
																										return;
																									end;
																								end;
																							elseif p18:IsDescendantOf(player.PlayerGui) then
																								if p18 then
																									if not p18.Parent then
																										u7:disconnect();
																										v54:Destroy();
																										if u8 then
																											u8:Cancel();
																											return;
																										end;
																									end;
																								else
																									u7:disconnect();
																									v54:Destroy();
																									if u8 then
																										u8:Cancel();
																										return;
																									end;
																								end;
																							else
																								u7:disconnect();
																								v54:Destroy();
																								if u8 then
																									u8:Cancel();
																									return;
																								end;
																							end;
																						elseif p18:IsDescendantOf(player.PlayerGui) then
																							if p18 then
																								if not p18.Parent then
																									u7:disconnect();
																									v54:Destroy();
																									if u8 then
																										u8:Cancel();
																										return;
																									end;
																								end;
																							else
																								u7:disconnect();
																								v54:Destroy();
																								if u8 then
																									u8:Cancel();
																									return;
																								end;
																							end;
																						else
																							u7:disconnect();
																							v54:Destroy();
																							if u8 then
																								u8:Cancel();
																								return;
																							end;
																						end;
																					elseif p18 then
																						if not p18.Parent then
																							u7:disconnect();
																							v54:Destroy();
																							if u8 then
																								u8:Cancel();
																								return;
																							end;
																						end;
																					else
																						u7:disconnect();
																						v54:Destroy();
																						if u8 then
																							u8:Cancel();
																							return;
																						end;
																					end;
																				else
																					u7:disconnect();
																					v54:Destroy();
																					if u8 then
																						u8:Cancel();
																						return;
																					end;
																				end;
																			end;
																		end;
																	else
																		if v53:FindFirstChild("Animated") then
																			if not v53.Animated:FindFirstChild("Horz") then
																				v69.OffsetStudsV = v69.OffsetStudsV + u6;
																			end;
																		end;
																		v69.OffsetStudsU = v69.OffsetStudsU - u6;
																		if p20 then
																			if p20 then
																				if p20:FindFirstChild("NRPBS") then
																					if p20:FindFirstChild("Status") then
																						if p20.Status.Alive.Value then
																							if p20.NRPBS.Health.Value <= 0 then
																								if p18:IsDescendantOf(player.PlayerGui) then
																									if p18 then
																										if not p18.Parent then
																											u7:disconnect();
																											v54:Destroy();
																											if u8 then
																												u8:Cancel();
																												return;
																											end;
																										end;
																									else
																										u7:disconnect();
																										v54:Destroy();
																										if u8 then
																											u8:Cancel();
																											return;
																										end;
																									end;
																								else
																									u7:disconnect();
																									v54:Destroy();
																									if u8 then
																										u8:Cancel();
																										return;
																									end;
																								end;
																							elseif p18 then
																								if not p18.Parent then
																									u7:disconnect();
																									v54:Destroy();
																									if u8 then
																										u8:Cancel();
																										return;
																									end;
																								end;
																							else
																								u7:disconnect();
																								v54:Destroy();
																								if u8 then
																									u8:Cancel();
																									return;
																								end;
																							end;
																						elseif p18:IsDescendantOf(player.PlayerGui) then
																							if p18 then
																								if not p18.Parent then
																									u7:disconnect();
																									v54:Destroy();
																									if u8 then
																										u8:Cancel();
																										return;
																									end;
																								end;
																							else
																								u7:disconnect();
																								v54:Destroy();
																								if u8 then
																									u8:Cancel();
																									return;
																								end;
																							end;
																						else
																							u7:disconnect();
																							v54:Destroy();
																							if u8 then
																								u8:Cancel();
																								return;
																							end;
																						end;
																					elseif p18:IsDescendantOf(player.PlayerGui) then
																						if p18 then
																							if not p18.Parent then
																								u7:disconnect();
																								v54:Destroy();
																								if u8 then
																									u8:Cancel();
																									return;
																								end;
																							end;
																						else
																							u7:disconnect();
																							v54:Destroy();
																							if u8 then
																								u8:Cancel();
																								return;
																							end;
																						end;
																					else
																						u7:disconnect();
																						v54:Destroy();
																						if u8 then
																							u8:Cancel();
																							return;
																						end;
																					end;
																				elseif p18:IsDescendantOf(player.PlayerGui) then
																					if p18 then
																						if not p18.Parent then
																							u7:disconnect();
																							v54:Destroy();
																							if u8 then
																								u8:Cancel();
																								return;
																							end;
																						end;
																					else
																						u7:disconnect();
																						v54:Destroy();
																						if u8 then
																							u8:Cancel();
																							return;
																						end;
																					end;
																				else
																					u7:disconnect();
																					v54:Destroy();
																					if u8 then
																						u8:Cancel();
																						return;
																					end;
																				end;
																			elseif p18 then
																				if not p18.Parent then
																					u7:disconnect();
																					v54:Destroy();
																					if u8 then
																						u8:Cancel();
																						return;
																					end;
																				end;
																			else
																				u7:disconnect();
																				v54:Destroy();
																				if u8 then
																					u8:Cancel();
																					return;
																				end;
																			end;
																		else
																			u7:disconnect();
																			v54:Destroy();
																			if u8 then
																				u8:Cancel();
																				return;
																			end;
																		end;
																	end;
																elseif p18:IsDescendantOf(player.PlayerGui) then
																	if player.PlayerGui.Menew.Locker.Visible then
																		if v53:FindFirstChild("Animated") then
																			if not v53.Animated:FindFirstChild("Horz") then
																				v69.OffsetStudsV = v69.OffsetStudsV + u6;
																			end;
																		end;
																		v69.OffsetStudsU = v69.OffsetStudsU - u6;
																		if p20 then
																			if p20 then
																				if p20:FindFirstChild("NRPBS") then
																					if p20:FindFirstChild("Status") then
																						if p20.Status.Alive.Value then
																							if p20.NRPBS.Health.Value <= 0 then
																								if p18:IsDescendantOf(player.PlayerGui) then
																									if p18 then
																										if not p18.Parent then
																											u7:disconnect();
																											v54:Destroy();
																											if u8 then
																												u8:Cancel();
																												return;
																											end;
																										end;
																									else
																										u7:disconnect();
																										v54:Destroy();
																										if u8 then
																											u8:Cancel();
																											return;
																										end;
																									end;
																								else
																									u7:disconnect();
																									v54:Destroy();
																									if u8 then
																										u8:Cancel();
																										return;
																									end;
																								end;
																							elseif p18 then
																								if not p18.Parent then
																									u7:disconnect();
																									v54:Destroy();
																									if u8 then
																										u8:Cancel();
																										return;
																									end;
																								end;
																							else
																								u7:disconnect();
																								v54:Destroy();
																								if u8 then
																									u8:Cancel();
																									return;
																								end;
																							end;
																						elseif p18:IsDescendantOf(player.PlayerGui) then
																							if p18 then
																								if not p18.Parent then
																									u7:disconnect();
																									v54:Destroy();
																									if u8 then
																										u8:Cancel();
																										return;
																									end;
																								end;
																							else
																								u7:disconnect();
																								v54:Destroy();
																								if u8 then
																									u8:Cancel();
																									return;
																								end;
																							end;
																						else
																							u7:disconnect();
																							v54:Destroy();
																							if u8 then
																								u8:Cancel();
																								return;
																							end;
																						end;
																					elseif p18:IsDescendantOf(player.PlayerGui) then
																						if p18 then
																							if not p18.Parent then
																								u7:disconnect();
																								v54:Destroy();
																								if u8 then
																									u8:Cancel();
																									return;
																								end;
																							end;
																						else
																							u7:disconnect();
																							v54:Destroy();
																							if u8 then
																								u8:Cancel();
																								return;
																							end;
																						end;
																					else
																						u7:disconnect();
																						v54:Destroy();
																						if u8 then
																							u8:Cancel();
																							return;
																						end;
																					end;
																				elseif p18:IsDescendantOf(player.PlayerGui) then
																					if p18 then
																						if not p18.Parent then
																							u7:disconnect();
																							v54:Destroy();
																							if u8 then
																								u8:Cancel();
																								return;
																							end;
																						end;
																					else
																						u7:disconnect();
																						v54:Destroy();
																						if u8 then
																							u8:Cancel();
																							return;
																						end;
																					end;
																				else
																					u7:disconnect();
																					v54:Destroy();
																					if u8 then
																						u8:Cancel();
																						return;
																					end;
																				end;
																			elseif p18 then
																				if not p18.Parent then
																					u7:disconnect();
																					v54:Destroy();
																					if u8 then
																						u8:Cancel();
																						return;
																					end;
																				end;
																			else
																				u7:disconnect();
																				v54:Destroy();
																				if u8 then
																					u8:Cancel();
																					return;
																				end;
																			end;
																		else
																			u7:disconnect();
																			v54:Destroy();
																			if u8 then
																				u8:Cancel();
																				return;
																			end;
																		end;
																	end;
																end;
															else
																u7:disconnect();
																v54:Destroy();
																if u8 then
																	u8:Cancel();
																end;
															end;
														else
															u7:disconnect();
															v54:Destroy();
															if u8 then
																u8:Cancel();
															end;
														end;
													end);
												elseif v53:FindFirstChild("Align") then
													u9 = nil;
													u10 = nil;
													u9 = v43:GetPropertyChangedSignal("Value"):connect(function()
														if p18 then
															if p18.Parent then
																if not p18:IsDescendantOf(player.PlayerGui) then
																	if not u5(v55) then
																		if p18:IsDescendantOf(player.PlayerGui) then
																			if player.PlayerGui.Menew.Locker.Visible then
																				u4(v63, v69);
																				if p20 then
																					if p20 then
																						if p20:FindFirstChild("NRPBS") then
																							if p20:FindFirstChild("Status") then
																								if p20.Status.Alive.Value then
																									if p20.NRPBS.Health.Value <= 0 then
																										if p18:IsDescendantOf(player.PlayerGui) then
																											if p18 then
																												if not p18.Parent then
																													u9:disconnect();
																													v54:Destroy();
																													if u10 then
																														u10:Cancel();
																														return;
																													end;
																												end;
																											else
																												u9:disconnect();
																												v54:Destroy();
																												if u10 then
																													u10:Cancel();
																													return;
																												end;
																											end;
																										else
																											u9:disconnect();
																											v54:Destroy();
																											if u10 then
																												u10:Cancel();
																												return;
																											end;
																										end;
																									elseif p18 then
																										if not p18.Parent then
																											u9:disconnect();
																											v54:Destroy();
																											if u10 then
																												u10:Cancel();
																												return;
																											end;
																										end;
																									else
																										u9:disconnect();
																										v54:Destroy();
																										if u10 then
																											u10:Cancel();
																											return;
																										end;
																									end;
																								elseif p18:IsDescendantOf(player.PlayerGui) then
																									if p18 then
																										if not p18.Parent then
																											u9:disconnect();
																											v54:Destroy();
																											if u10 then
																												u10:Cancel();
																												return;
																											end;
																										end;
																									else
																										u9:disconnect();
																										v54:Destroy();
																										if u10 then
																											u10:Cancel();
																											return;
																										end;
																									end;
																								else
																									u9:disconnect();
																									v54:Destroy();
																									if u10 then
																										u10:Cancel();
																										return;
																									end;
																								end;
																							elseif p18:IsDescendantOf(player.PlayerGui) then
																								if p18 then
																									if not p18.Parent then
																										u9:disconnect();
																										v54:Destroy();
																										if u10 then
																											u10:Cancel();
																											return;
																										end;
																									end;
																								else
																									u9:disconnect();
																									v54:Destroy();
																									if u10 then
																										u10:Cancel();
																										return;
																									end;
																								end;
																							else
																								u9:disconnect();
																								v54:Destroy();
																								if u10 then
																									u10:Cancel();
																									return;
																								end;
																							end;
																						elseif p18:IsDescendantOf(player.PlayerGui) then
																							if p18 then
																								if not p18.Parent then
																									u9:disconnect();
																									v54:Destroy();
																									if u10 then
																										u10:Cancel();
																										return;
																									end;
																								end;
																							else
																								u9:disconnect();
																								v54:Destroy();
																								if u10 then
																									u10:Cancel();
																									return;
																								end;
																							end;
																						else
																							u9:disconnect();
																							v54:Destroy();
																							if u10 then
																								u10:Cancel();
																								return;
																							end;
																						end;
																					elseif p18 then
																						if not p18.Parent then
																							u9:disconnect();
																							v54:Destroy();
																							if u10 then
																								u10:Cancel();
																								return;
																							end;
																						end;
																					else
																						u9:disconnect();
																						v54:Destroy();
																						if u10 then
																							u10:Cancel();
																							return;
																						end;
																					end;
																				else
																					u9:disconnect();
																					v54:Destroy();
																					if u10 then
																						u10:Cancel();
																						return;
																					end;
																				end;
																			end;
																		end;
																	else
																		u4(v63, v69);
																		if p20 then
																			if p20 then
																				if p20:FindFirstChild("NRPBS") then
																					if p20:FindFirstChild("Status") then
																						if p20.Status.Alive.Value then
																							if p20.NRPBS.Health.Value <= 0 then
																								if p18:IsDescendantOf(player.PlayerGui) then
																									if p18 then
																										if not p18.Parent then
																											u9:disconnect();
																											v54:Destroy();
																											if u10 then
																												u10:Cancel();
																												return;
																											end;
																										end;
																									else
																										u9:disconnect();
																										v54:Destroy();
																										if u10 then
																											u10:Cancel();
																											return;
																										end;
																									end;
																								else
																									u9:disconnect();
																									v54:Destroy();
																									if u10 then
																										u10:Cancel();
																										return;
																									end;
																								end;
																							elseif p18 then
																								if not p18.Parent then
																									u9:disconnect();
																									v54:Destroy();
																									if u10 then
																										u10:Cancel();
																										return;
																									end;
																								end;
																							else
																								u9:disconnect();
																								v54:Destroy();
																								if u10 then
																									u10:Cancel();
																									return;
																								end;
																							end;
																						elseif p18:IsDescendantOf(player.PlayerGui) then
																							if p18 then
																								if not p18.Parent then
																									u9:disconnect();
																									v54:Destroy();
																									if u10 then
																										u10:Cancel();
																										return;
																									end;
																								end;
																							else
																								u9:disconnect();
																								v54:Destroy();
																								if u10 then
																									u10:Cancel();
																									return;
																								end;
																							end;
																						else
																							u9:disconnect();
																							v54:Destroy();
																							if u10 then
																								u10:Cancel();
																								return;
																							end;
																						end;
																					elseif p18:IsDescendantOf(player.PlayerGui) then
																						if p18 then
																							if not p18.Parent then
																								u9:disconnect();
																								v54:Destroy();
																								if u10 then
																									u10:Cancel();
																									return;
																								end;
																							end;
																						else
																							u9:disconnect();
																							v54:Destroy();
																							if u10 then
																								u10:Cancel();
																								return;
																							end;
																						end;
																					else
																						u9:disconnect();
																						v54:Destroy();
																						if u10 then
																							u10:Cancel();
																							return;
																						end;
																					end;
																				elseif p18:IsDescendantOf(player.PlayerGui) then
																					if p18 then
																						if not p18.Parent then
																							u9:disconnect();
																							v54:Destroy();
																							if u10 then
																								u10:Cancel();
																								return;
																							end;
																						end;
																					else
																						u9:disconnect();
																						v54:Destroy();
																						if u10 then
																							u10:Cancel();
																							return;
																						end;
																					end;
																				else
																					u9:disconnect();
																					v54:Destroy();
																					if u10 then
																						u10:Cancel();
																						return;
																					end;
																				end;
																			elseif p18 then
																				if not p18.Parent then
																					u9:disconnect();
																					v54:Destroy();
																					if u10 then
																						u10:Cancel();
																						return;
																					end;
																				end;
																			else
																				u9:disconnect();
																				v54:Destroy();
																				if u10 then
																					u10:Cancel();
																					return;
																				end;
																			end;
																		else
																			u9:disconnect();
																			v54:Destroy();
																			if u10 then
																				u10:Cancel();
																				return;
																			end;
																		end;
																	end;
																elseif p18:IsDescendantOf(player.PlayerGui) then
																	if player.PlayerGui.Menew.Locker.Visible then
																		u4(v63, v69);
																		if p20 then
																			if p20 then
																				if p20:FindFirstChild("NRPBS") then
																					if p20:FindFirstChild("Status") then
																						if p20.Status.Alive.Value then
																							if p20.NRPBS.Health.Value <= 0 then
																								if p18:IsDescendantOf(player.PlayerGui) then
																									if p18 then
																										if not p18.Parent then
																											u9:disconnect();
																											v54:Destroy();
																											if u10 then
																												u10:Cancel();
																												return;
																											end;
																										end;
																									else
																										u9:disconnect();
																										v54:Destroy();
																										if u10 then
																											u10:Cancel();
																											return;
																										end;
																									end;
																								else
																									u9:disconnect();
																									v54:Destroy();
																									if u10 then
																										u10:Cancel();
																										return;
																									end;
																								end;
																							elseif p18 then
																								if not p18.Parent then
																									u9:disconnect();
																									v54:Destroy();
																									if u10 then
																										u10:Cancel();
																										return;
																									end;
																								end;
																							else
																								u9:disconnect();
																								v54:Destroy();
																								if u10 then
																									u10:Cancel();
																									return;
																								end;
																							end;
																						elseif p18:IsDescendantOf(player.PlayerGui) then
																							if p18 then
																								if not p18.Parent then
																									u9:disconnect();
																									v54:Destroy();
																									if u10 then
																										u10:Cancel();
																										return;
																									end;
																								end;
																							else
																								u9:disconnect();
																								v54:Destroy();
																								if u10 then
																									u10:Cancel();
																									return;
																								end;
																							end;
																						else
																							u9:disconnect();
																							v54:Destroy();
																							if u10 then
																								u10:Cancel();
																								return;
																							end;
																						end;
																					elseif p18:IsDescendantOf(player.PlayerGui) then
																						if p18 then
																							if not p18.Parent then
																								u9:disconnect();
																								v54:Destroy();
																								if u10 then
																									u10:Cancel();
																									return;
																								end;
																							end;
																						else
																							u9:disconnect();
																							v54:Destroy();
																							if u10 then
																								u10:Cancel();
																								return;
																							end;
																						end;
																					else
																						u9:disconnect();
																						v54:Destroy();
																						if u10 then
																							u10:Cancel();
																							return;
																						end;
																					end;
																				elseif p18:IsDescendantOf(player.PlayerGui) then
																					if p18 then
																						if not p18.Parent then
																							u9:disconnect();
																							v54:Destroy();
																							if u10 then
																								u10:Cancel();
																								return;
																							end;
																						end;
																					else
																						u9:disconnect();
																						v54:Destroy();
																						if u10 then
																							u10:Cancel();
																							return;
																						end;
																					end;
																				else
																					u9:disconnect();
																					v54:Destroy();
																					if u10 then
																						u10:Cancel();
																						return;
																					end;
																				end;
																			elseif p18 then
																				if not p18.Parent then
																					u9:disconnect();
																					v54:Destroy();
																					if u10 then
																						u10:Cancel();
																						return;
																					end;
																				end;
																			else
																				u9:disconnect();
																				v54:Destroy();
																				if u10 then
																					u10:Cancel();
																					return;
																				end;
																			end;
																		else
																			u9:disconnect();
																			v54:Destroy();
																			if u10 then
																				u10:Cancel();
																				return;
																			end;
																		end;
																	end;
																end;
															else
																u9:disconnect();
																v54:Destroy();
																if u10 then
																	u10:Cancel();
																end;
															end;
														else
															u9:disconnect();
															v54:Destroy();
															if u10 then
																u10:Cancel();
															end;
														end;
													end);
												end;
												if v53:FindFirstChild("Sizer") then
													u11 = nil;
													u12 = nil;
													u11 = v54:GetPropertyChangedSignal("Value"):connect(function()
														if p18 then
															if p18.Parent then
																if not p18:IsDescendantOf(player.PlayerGui) then
																	if not u5(v55) then
																		if p18:IsDescendantOf(player.PlayerGui) then
																			if player.PlayerGui.Menew.Locker.Visible then
																				v69.StudsPerTileU = v54.Value;
																				v69.StudsPerTileV = v54.Value;
																				if p20 then
																					if p20 then
																						if p20:FindFirstChild("NRPBS") then
																							if p20:FindFirstChild("Status") then
																								if p20.Status.Alive.Value then
																									if p20.NRPBS.Health.Value <= 0 then
																										if p18:IsDescendantOf(player.PlayerGui) then
																											if p18 then
																												if not p18.Parent then
																													u11:disconnect();
																													v54:Destroy();
																													if u12 then
																														u12:Cancel();
																														return;
																													end;
																												end;
																											else
																												u11:disconnect();
																												v54:Destroy();
																												if u12 then
																													u12:Cancel();
																													return;
																												end;
																											end;
																										else
																											u11:disconnect();
																											v54:Destroy();
																											if u12 then
																												u12:Cancel();
																												return;
																											end;
																										end;
																									elseif p18 then
																										if not p18.Parent then
																											u11:disconnect();
																											v54:Destroy();
																											if u12 then
																												u12:Cancel();
																												return;
																											end;
																										end;
																									else
																										u11:disconnect();
																										v54:Destroy();
																										if u12 then
																											u12:Cancel();
																											return;
																										end;
																									end;
																								elseif p18:IsDescendantOf(player.PlayerGui) then
																									if p18 then
																										if not p18.Parent then
																											u11:disconnect();
																											v54:Destroy();
																											if u12 then
																												u12:Cancel();
																												return;
																											end;
																										end;
																									else
																										u11:disconnect();
																										v54:Destroy();
																										if u12 then
																											u12:Cancel();
																											return;
																										end;
																									end;
																								else
																									u11:disconnect();
																									v54:Destroy();
																									if u12 then
																										u12:Cancel();
																										return;
																									end;
																								end;
																							elseif p18:IsDescendantOf(player.PlayerGui) then
																								if p18 then
																									if not p18.Parent then
																										u11:disconnect();
																										v54:Destroy();
																										if u12 then
																											u12:Cancel();
																											return;
																										end;
																									end;
																								else
																									u11:disconnect();
																									v54:Destroy();
																									if u12 then
																										u12:Cancel();
																										return;
																									end;
																								end;
																							else
																								u11:disconnect();
																								v54:Destroy();
																								if u12 then
																									u12:Cancel();
																									return;
																								end;
																							end;
																						elseif p18:IsDescendantOf(player.PlayerGui) then
																							if p18 then
																								if not p18.Parent then
																									u11:disconnect();
																									v54:Destroy();
																									if u12 then
																										u12:Cancel();
																										return;
																									end;
																								end;
																							else
																								u11:disconnect();
																								v54:Destroy();
																								if u12 then
																									u12:Cancel();
																									return;
																								end;
																							end;
																						else
																							u11:disconnect();
																							v54:Destroy();
																							if u12 then
																								u12:Cancel();
																								return;
																							end;
																						end;
																					elseif p18 then
																						if not p18.Parent then
																							u11:disconnect();
																							v54:Destroy();
																							if u12 then
																								u12:Cancel();
																								return;
																							end;
																						end;
																					else
																						u11:disconnect();
																						v54:Destroy();
																						if u12 then
																							u12:Cancel();
																							return;
																						end;
																					end;
																				else
																					u11:disconnect();
																					v54:Destroy();
																					if u12 then
																						u12:Cancel();
																						return;
																					end;
																				end;
																			end;
																		end;
																	else
																		v69.StudsPerTileU = v54.Value;
																		v69.StudsPerTileV = v54.Value;
																		if p20 then
																			if p20 then
																				if p20:FindFirstChild("NRPBS") then
																					if p20:FindFirstChild("Status") then
																						if p20.Status.Alive.Value then
																							if p20.NRPBS.Health.Value <= 0 then
																								if p18:IsDescendantOf(player.PlayerGui) then
																									if p18 then
																										if not p18.Parent then
																											u11:disconnect();
																											v54:Destroy();
																											if u12 then
																												u12:Cancel();
																												return;
																											end;
																										end;
																									else
																										u11:disconnect();
																										v54:Destroy();
																										if u12 then
																											u12:Cancel();
																											return;
																										end;
																									end;
																								else
																									u11:disconnect();
																									v54:Destroy();
																									if u12 then
																										u12:Cancel();
																										return;
																									end;
																								end;
																							elseif p18 then
																								if not p18.Parent then
																									u11:disconnect();
																									v54:Destroy();
																									if u12 then
																										u12:Cancel();
																										return;
																									end;
																								end;
																							else
																								u11:disconnect();
																								v54:Destroy();
																								if u12 then
																									u12:Cancel();
																									return;
																								end;
																							end;
																						elseif p18:IsDescendantOf(player.PlayerGui) then
																							if p18 then
																								if not p18.Parent then
																									u11:disconnect();
																									v54:Destroy();
																									if u12 then
																										u12:Cancel();
																										return;
																									end;
																								end;
																							else
																								u11:disconnect();
																								v54:Destroy();
																								if u12 then
																									u12:Cancel();
																									return;
																								end;
																							end;
																						else
																							u11:disconnect();
																							v54:Destroy();
																							if u12 then
																								u12:Cancel();
																								return;
																							end;
																						end;
																					elseif p18:IsDescendantOf(player.PlayerGui) then
																						if p18 then
																							if not p18.Parent then
																								u11:disconnect();
																								v54:Destroy();
																								if u12 then
																									u12:Cancel();
																									return;
																								end;
																							end;
																						else
																							u11:disconnect();
																							v54:Destroy();
																							if u12 then
																								u12:Cancel();
																								return;
																							end;
																						end;
																					else
																						u11:disconnect();
																						v54:Destroy();
																						if u12 then
																							u12:Cancel();
																							return;
																						end;
																					end;
																				elseif p18:IsDescendantOf(player.PlayerGui) then
																					if p18 then
																						if not p18.Parent then
																							u11:disconnect();
																							v54:Destroy();
																							if u12 then
																								u12:Cancel();
																								return;
																							end;
																						end;
																					else
																						u11:disconnect();
																						v54:Destroy();
																						if u12 then
																							u12:Cancel();
																							return;
																						end;
																					end;
																				else
																					u11:disconnect();
																					v54:Destroy();
																					if u12 then
																						u12:Cancel();
																						return;
																					end;
																				end;
																			elseif p18 then
																				if not p18.Parent then
																					u11:disconnect();
																					v54:Destroy();
																					if u12 then
																						u12:Cancel();
																						return;
																					end;
																				end;
																			else
																				u11:disconnect();
																				v54:Destroy();
																				if u12 then
																					u12:Cancel();
																					return;
																				end;
																			end;
																		else
																			u11:disconnect();
																			v54:Destroy();
																			if u12 then
																				u12:Cancel();
																				return;
																			end;
																		end;
																	end;
																elseif p18:IsDescendantOf(player.PlayerGui) then
																	if player.PlayerGui.Menew.Locker.Visible then
																		v69.StudsPerTileU = v54.Value;
																		v69.StudsPerTileV = v54.Value;
																		if p20 then
																			if p20 then
																				if p20:FindFirstChild("NRPBS") then
																					if p20:FindFirstChild("Status") then
																						if p20.Status.Alive.Value then
																							if p20.NRPBS.Health.Value <= 0 then
																								if p18:IsDescendantOf(player.PlayerGui) then
																									if p18 then
																										if not p18.Parent then
																											u11:disconnect();
																											v54:Destroy();
																											if u12 then
																												u12:Cancel();
																												return;
																											end;
																										end;
																									else
																										u11:disconnect();
																										v54:Destroy();
																										if u12 then
																											u12:Cancel();
																											return;
																										end;
																									end;
																								else
																									u11:disconnect();
																									v54:Destroy();
																									if u12 then
																										u12:Cancel();
																										return;
																									end;
																								end;
																							elseif p18 then
																								if not p18.Parent then
																									u11:disconnect();
																									v54:Destroy();
																									if u12 then
																										u12:Cancel();
																										return;
																									end;
																								end;
																							else
																								u11:disconnect();
																								v54:Destroy();
																								if u12 then
																									u12:Cancel();
																									return;
																								end;
																							end;
																						elseif p18:IsDescendantOf(player.PlayerGui) then
																							if p18 then
																								if not p18.Parent then
																									u11:disconnect();
																									v54:Destroy();
																									if u12 then
																										u12:Cancel();
																										return;
																									end;
																								end;
																							else
																								u11:disconnect();
																								v54:Destroy();
																								if u12 then
																									u12:Cancel();
																									return;
																								end;
																							end;
																						else
																							u11:disconnect();
																							v54:Destroy();
																							if u12 then
																								u12:Cancel();
																								return;
																							end;
																						end;
																					elseif p18:IsDescendantOf(player.PlayerGui) then
																						if p18 then
																							if not p18.Parent then
																								u11:disconnect();
																								v54:Destroy();
																								if u12 then
																									u12:Cancel();
																									return;
																								end;
																							end;
																						else
																							u11:disconnect();
																							v54:Destroy();
																							if u12 then
																								u12:Cancel();
																								return;
																							end;
																						end;
																					else
																						u11:disconnect();
																						v54:Destroy();
																						if u12 then
																							u12:Cancel();
																							return;
																						end;
																					end;
																				elseif p18:IsDescendantOf(player.PlayerGui) then
																					if p18 then
																						if not p18.Parent then
																							u11:disconnect();
																							v54:Destroy();
																							if u12 then
																								u12:Cancel();
																								return;
																							end;
																						end;
																					else
																						u11:disconnect();
																						v54:Destroy();
																						if u12 then
																							u12:Cancel();
																							return;
																						end;
																					end;
																				else
																					u11:disconnect();
																					v54:Destroy();
																					if u12 then
																						u12:Cancel();
																						return;
																					end;
																				end;
																			elseif p18 then
																				if not p18.Parent then
																					u11:disconnect();
																					v54:Destroy();
																					if u12 then
																						u12:Cancel();
																						return;
																					end;
																				end;
																			else
																				u11:disconnect();
																				v54:Destroy();
																				if u12 then
																					u12:Cancel();
																					return;
																				end;
																			end;
																		else
																			u11:disconnect();
																			v54:Destroy();
																			if u12 then
																				u12:Cancel();
																				return;
																			end;
																		end;
																	end;
																end;
															else
																u11:disconnect();
																v54:Destroy();
																if u12 then
																	u12:Cancel();
																end;
															end;
														else
															u11:disconnect();
															v54:Destroy();
															if u12 then
																u12:Cancel();
															end;
														end;
													end);
												end;
											end;										
										end;
									end;
								end;
							end;						
						end;
						if p20 == player then
							if v53:FindFirstChild("Sizer") then
								l__TweenService__2:Create(v54, TweenInfo.new(0.675, Enum.EasingStyle.Quint, Enum.EasingDirection.Out, math.huge, true, 0), {
									Value = v53.Scale.Value - 0.35
								}):Play();
							end;
						end;
						if p20 == player then
							local v75, v76, v77 = pairs(player.Character:GetDescendants());
							while true do
								local v78, v79 = v75(v76, v77);
								if v78 then

								else
									break;
								end;
								if not v79:IsA("ParticleEmitter") then
									if not v79:IsA("Beam") then
										if v79:IsA("Trail") then
											if v79.Name ~= "OriginalPosition" then
												if not v79.Parent.Parent:FindFirstChild("Orbit") then
													if v79.Parent.Name ~= "Unusual" then
														if v79.Name ~= "Particle" then
															if v79.Parent.Name ~= "UnusualAnimation" then
																if v79.Parent.Name ~= "Handle" then
																	if v79.Parent.Name ~= "HumanoidRootPart" then
																		if v79.Name ~= "Fire" then
																			if v79.Parent.Name == "Eye" then
																				if not v79:IsA("Fire") then
																					if v79:IsA("BillboardGui") then
																						if v79.Name == "__UNUSUALHIDE" then
																							v79.Enabled = false;
																							if v79:IsA("ParticleEmitter") then
																								v79:Clear();
																							end;
																						end;
																					end;
																				else
																					v79.Enabled = false;
																					if v79:IsA("ParticleEmitter") then
																						v79:Clear();
																					end;
																				end;
																			elseif v79:IsA("BillboardGui") then
																				if v79.Name == "__UNUSUALHIDE" then
																					v79.Enabled = false;
																					if v79:IsA("ParticleEmitter") then
																						v79:Clear();
																					end;
																				end;
																			end;
																		else
																			v79.Enabled = false;
																			if v79:IsA("ParticleEmitter") then
																				v79:Clear();
																			end;
																		end;
																	else
																		v79.Enabled = false;
																		if v79:IsA("ParticleEmitter") then
																			v79:Clear();
																		end;
																	end;
																else
																	v79.Enabled = false;
																	if v79:IsA("ParticleEmitter") then
																		v79:Clear();
																	end;
																end;
															else
																v79.Enabled = false;
																if v79:IsA("ParticleEmitter") then
																	v79:Clear();
																end;
															end;
														else
															v79.Enabled = false;
															if v79:IsA("ParticleEmitter") then
																v79:Clear();
															end;
														end;
													else
														v79.Enabled = false;
														if v79:IsA("ParticleEmitter") then
															v79:Clear();
														end;
													end;
												else
													v79.Enabled = false;
													if v79:IsA("ParticleEmitter") then
														v79:Clear();
													end;
												end;
											elseif v79.Parent.Name == "Eye" then
												if not v79:IsA("Fire") then
													if v79:IsA("BillboardGui") then
														if v79.Name == "__UNUSUALHIDE" then
															v79.Enabled = false;
															if v79:IsA("ParticleEmitter") then
																v79:Clear();
															end;
														end;
													end;
												else
													v79.Enabled = false;
													if v79:IsA("ParticleEmitter") then
														v79:Clear();
													end;
												end;
											elseif v79:IsA("BillboardGui") then
												if v79.Name == "__UNUSUALHIDE" then
													v79.Enabled = false;
													if v79:IsA("ParticleEmitter") then
														v79:Clear();
													end;
												end;
											end;
										elseif v79.Parent.Name == "Eye" then
											if not v79:IsA("Fire") then
												if v79:IsA("BillboardGui") then
													if v79.Name == "__UNUSUALHIDE" then
														v79.Enabled = false;
														if v79:IsA("ParticleEmitter") then
															v79:Clear();
														end;
													end;
												end;
											else
												v79.Enabled = false;
												if v79:IsA("ParticleEmitter") then
													v79:Clear();
												end;
											end;
										elseif v79:IsA("BillboardGui") then
											if v79.Name == "__UNUSUALHIDE" then
												v79.Enabled = false;
												if v79:IsA("ParticleEmitter") then
													v79:Clear();
												end;
											end;
										end;
									elseif v79.Name ~= "OriginalPosition" then
										if not v79.Parent.Parent:FindFirstChild("Orbit") then
											if v79.Parent.Name ~= "Unusual" then
												if v79.Name ~= "Particle" then
													if v79.Parent.Name ~= "UnusualAnimation" then
														if v79.Parent.Name ~= "Handle" then
															if v79.Parent.Name ~= "HumanoidRootPart" then
																if v79.Name ~= "Fire" then
																	if v79.Parent.Name == "Eye" then
																		if not v79:IsA("Fire") then
																			if v79:IsA("BillboardGui") then
																				if v79.Name == "__UNUSUALHIDE" then
																					v79.Enabled = false;
																					if v79:IsA("ParticleEmitter") then
																						v79:Clear();
																					end;
																				end;
																			end;
																		else
																			v79.Enabled = false;
																			if v79:IsA("ParticleEmitter") then
																				v79:Clear();
																			end;
																		end;
																	elseif v79:IsA("BillboardGui") then
																		if v79.Name == "__UNUSUALHIDE" then
																			v79.Enabled = false;
																			if v79:IsA("ParticleEmitter") then
																				v79:Clear();
																			end;
																		end;
																	end;
																else
																	v79.Enabled = false;
																	if v79:IsA("ParticleEmitter") then
																		v79:Clear();
																	end;
																end;
															else
																v79.Enabled = false;
																if v79:IsA("ParticleEmitter") then
																	v79:Clear();
																end;
															end;
														else
															v79.Enabled = false;
															if v79:IsA("ParticleEmitter") then
																v79:Clear();
															end;
														end;
													else
														v79.Enabled = false;
														if v79:IsA("ParticleEmitter") then
															v79:Clear();
														end;
													end;
												else
													v79.Enabled = false;
													if v79:IsA("ParticleEmitter") then
														v79:Clear();
													end;
												end;
											else
												v79.Enabled = false;
												if v79:IsA("ParticleEmitter") then
													v79:Clear();
												end;
											end;
										else
											v79.Enabled = false;
											if v79:IsA("ParticleEmitter") then
												v79:Clear();
											end;
										end;
									elseif v79.Parent.Name == "Eye" then
										if not v79:IsA("Fire") then
											if v79:IsA("BillboardGui") then
												if v79.Name == "__UNUSUALHIDE" then
													v79.Enabled = false;
													if v79:IsA("ParticleEmitter") then
														v79:Clear();
													end;
												end;
											end;
										else
											v79.Enabled = false;
											if v79:IsA("ParticleEmitter") then
												v79:Clear();
											end;
										end;
									elseif v79:IsA("BillboardGui") then
										if v79.Name == "__UNUSUALHIDE" then
											v79.Enabled = false;
											if v79:IsA("ParticleEmitter") then
												v79:Clear();
											end;
										end;
									end;
								elseif v79.Name ~= "OriginalPosition" then
									if not v79.Parent.Parent:FindFirstChild("Orbit") then
										if v79.Parent.Name ~= "Unusual" then
											if v79.Name ~= "Particle" then
												if v79.Parent.Name ~= "UnusualAnimation" then
													if v79.Parent.Name ~= "Handle" then
														if v79.Parent.Name ~= "HumanoidRootPart" then
															if v79.Name ~= "Fire" then
																if v79.Parent.Name == "Eye" then
																	if not v79:IsA("Fire") then
																		if v79:IsA("BillboardGui") then
																			if v79.Name == "__UNUSUALHIDE" then
																				v79.Enabled = false;
																				if v79:IsA("ParticleEmitter") then
																					v79:Clear();
																				end;
																			end;
																		end;
																	else
																		v79.Enabled = false;
																		if v79:IsA("ParticleEmitter") then
																			v79:Clear();
																		end;
																	end;
																elseif v79:IsA("BillboardGui") then
																	if v79.Name == "__UNUSUALHIDE" then
																		v79.Enabled = false;
																		if v79:IsA("ParticleEmitter") then
																			v79:Clear();
																		end;
																	end;
																end;
															else
																v79.Enabled = false;
																if v79:IsA("ParticleEmitter") then
																	v79:Clear();
																end;
															end;
														else
															v79.Enabled = false;
															if v79:IsA("ParticleEmitter") then
																v79:Clear();
															end;
														end;
													else
														v79.Enabled = false;
														if v79:IsA("ParticleEmitter") then
															v79:Clear();
														end;
													end;
												else
													v79.Enabled = false;
													if v79:IsA("ParticleEmitter") then
														v79:Clear();
													end;
												end;
											else
												v79.Enabled = false;
												if v79:IsA("ParticleEmitter") then
													v79:Clear();
												end;
											end;
										else
											v79.Enabled = false;
											if v79:IsA("ParticleEmitter") then
												v79:Clear();
											end;
										end;
									else
										v79.Enabled = false;
										if v79:IsA("ParticleEmitter") then
											v79:Clear();
										end;
									end;
								elseif v79.Parent.Name == "Eye" then
									if not v79:IsA("Fire") then
										if v79:IsA("BillboardGui") then
											if v79.Name == "__UNUSUALHIDE" then
												v79.Enabled = false;
												if v79:IsA("ParticleEmitter") then
													v79:Clear();
												end;
											end;
										end;
									else
										v79.Enabled = false;
										if v79:IsA("ParticleEmitter") then
											v79:Clear();
										end;
									end;
								elseif v79:IsA("BillboardGui") then
									if v79.Name == "__UNUSUALHIDE" then
										v79.Enabled = false;
										if v79:IsA("ParticleEmitter") then
											v79:Clear();
										end;
									end;
								end;							
							end;
						end;
					end;
				end;
			end;
		end;
	end;
end;
script.Parent.Parent.MapDat.Event:connect(function(p21, p22, p23)
	mapSkin(p21, p22, p23);
end);
local v80 = Instance.new("BindableEvent");
v80.Parent = script;
v80.Event:connect(function()
	l__ReplicatedStorage__6.Events.KillMe:FireServer();
end);
for v81 = 1, 100 do
	u1 = l__StarterGui__8;
	pcall(function()
		wait();
		u1:SetCore("ResetButtonCallback", v80);
		spoop = true;
	end);
	if spoop == true then
		break;
	end;
end;
script.Parent.Wendy.Event:connect(function(p24)
	if not p24 then
		primary.Value = storedWendy;
		wep.autoequip();
		return;
	end;
	storedWendy = primary.Value;
	primary.Value = "";
	wep.autoequip();
end);
function DestroyAllChildren(p25)
	local v82, v83, v84 = pairs(p25:GetChildren());
	while true do
		local v85, v86 = v82(v83, v84);
		if v85 then

		else
			break;
		end;
		v84 = v85;
		if v86.Name ~= "Bananas" then
			v86:Destroy();
		end;	
	end;
end;
wkspc:WaitForChild("Status"):WaitForChild("RoundOver").Changed:connect(function()
	if wkspc.Status.RoundOver.Value == false then
		DestroyAllChildren(l__Workspace__11.Debris);
		DestroyAllChildren(l__Workspace__11.Destructable);
		DestroyAllChildren(workspace.Ray_Ignore);
	end;
end);
function FixKillFeed()
	local v87 = 0;
	if sP.Mobile.Visible == true then
		if sP.AbsoluteSize.Y < 768 then
			sP.TopRight.Visible = false;
			return;
		end;
	end;
	local v88 = 1 - 1;
	while true do
		local v89 = false;
		local v90 = l__Workspace__11.KillFeed[tostring(v88)];
		if v90.Assist.Value ~= player.Name then
			if v90.Victim.Value ~= player.Name then
				if v90.Killer.Value == player.Name then
					v89 = true;
				end;
			else
				v89 = true;
			end;
		else
			v89 = true;
		end;
		if v90:findFirstChild("Active").Value == true then
			if v89 == true then
				if not (wkspc.DistributedTime.Value - v90.time.Value < 15) then
					if v89 == false then
						if wkspc.DistributedTime.Value - v90.time.Value < 10 then
							if sP.TopRight:FindFirstChild(v88) then
								local v91 = sP.TopRight[v88];
							else
								v91 = sP.kftemplate:clone();
							end;
							v91.Parent = sP.TopRight;
							v91.Visible = true;
							v91.Name = v88;
							v91.Killer.Text = require(game.ReplicatedStorage.Modules.GetUsername).GetNameToShow(v90.Killer.Value);
							if v90.Assist.Value ~= "" then
								v91.Killer.Text = v91.Killer.Text .. " + " .. require(game.ReplicatedStorage.Modules.GetUsername).GetNameToShow(v90.Assist.Value);
							end;
							v91.Killer.TextColor3 = v90.Killer:findFirstChild("TeamColor").Value;
							v91.Victim.Text = require(game.ReplicatedStorage.Modules.GetUsername).GetNameToShow(v90.Victim.Value);
							v91.Victim.TextColor3 = v90.Victim:findFirstChild("TeamColor").Value;
							v91.Pic.Image = v90:findFirstChild("Weapon").Value;
							v91.Pic.Size = UDim2.new(0, 68, 1, 0);
							v91.Pic.Headshot.Visible = false;
							v91.Pic.Noscope.Visible = false;
							v91.Pic.Backstab.Visible = false;
							v91.Midair.Visible = false;
							local v92 = 0;
							if v90:findFirstChild("Weapon").Midair.Value == true then
								v91.Midair.Visible = true;
								v91.Midair.Position = UDim2.new(0, 7, 0, 0);
								v92 = 27;
							end;
							local v93 = Color3.new(0.24705882352941178, 0.24705882352941178, 0.24705882352941178);
							local v94 = Color3.new(0.7529411764705882, 0.7529411764705882, 0.7529411764705882);
							if v89 == true then
								v91.Pic.ImageColor3 = v93;
								v91.Pic.Headshot.ImageColor3 = v93;
								v91.Pic.Backstab.ImageColor3 = v93;
								v91.Pic.Noscope.ImageColor3 = v93;
								v91.Midair.ImageColor3 = v93;
								v91.Host.Visible = true;
								v91.Nope.Visible = false;
								v91.textstring.TextColor3 = Color3.new(0, 0, 0);
								v91.textstring2.TextColor3 = Color3.new(0, 0, 0);
							else
								v91.Pic.ImageColor3 = v94;
								v91.Pic.Headshot.ImageColor3 = v94;
								v91.Pic.Headshot.ImageColor3 = v94;
								v91.Pic.Backstab.ImageColor3 = v94;
								v91.Pic.Noscope.ImageColor3 = v94;
								v91.Midair.ImageColor3 = v94;
								v91.Host.Visible = false;
								v91.Nope.Visible = true;
								v91.textstring.TextColor3 = Color3.new(1, 1, 1);
								v91.textstring2.TextColor3 = Color3.new(1, 1, 1);
							end;
							local v95 = 0;
							if v90:findFirstChild("Weapon").mcrit.Value ~= true then
								if v90:findFirstChild("Weapon").crit.Value == true then
									v91.Pic.Crit.Visible = true;
								else
									v91.Pic.Crit.Visible = false;
								end;
							else
								v91.Pic.Crit.Visible = true;
							end;
							local v96 = 0;
							if v90:findFirstChild("Weapon").Noscope.Value == true then
								v95 = v95 + 25;
								v91.Pic.Noscope.Position = UDim2.new(1, v96, 0, 0);
								v91.Pic.Noscope.Visible = true;
								v96 = v96 + 25;
							end;
							if v90:findFirstChild("Weapon").Backstab.Value == true then
								v95 = v95 + 25;
								v91.Pic.Backstab.Position = UDim2.new(1, v96, 0, 0);
								v91.Pic.Backstab.Visible = true;
								v96 = v96 + 25;
							end;
							if v90:findFirstChild("Weapon").Headshot.Value == true then
								v95 = v95 + 60;
								v91.Pic.Headshot.Position = UDim2.new(1, v96, 0, 0);
								v91.Pic.Headshot.Visible = true;
							end;
							v91.textstring.Text = "";
							v91.textstring.Visible = false;
							if v90.textstring.Value ~= "" then
								v91.textstring.Visible = true;
								v91.textstring.Text = v90:findFirstChild("textstring").Value;
							end;
							v91.textstring2.Text = "";
							v91.textstring2.Visible = false;
							if v90.textstring2.Value ~= "" then
								v91.textstring2.Visible = true;
								v91.textstring2.Text = v90:findFirstChild("textstring2").Value;
							end;
							if v91.Pic.Image ~= "rbxassetid://2894751917" then
								if v91.Pic.Image ~= "rbxassetid://2591908143" then
									if v91.Pic.Image ~= "rbxassetid://2591909383" then
										if v91.Pic.Image == "rbxassetid://2852568566" then
											v91.Pic.ImageColor3 = Color3.new(1, 1, 1);
										end;
									else
										v91.Pic.ImageColor3 = Color3.new(1, 1, 1);
									end;
								else
									v91.Pic.ImageColor3 = Color3.new(1, 1, 1);
								end;
							else
								v91.Pic.ImageColor3 = Color3.new(1, 1, 1);
							end;
							if v91.Pic.Image ~= "rbxassetid://999533804" then
								if v91.Pic.Image ~= "rbxassetid://1001888573" then
									if v91.Pic.Image == "rbxassetid://1001888370" then
										v91.Pic.ImageColor3 = Color3.new(1, 1, 1);
										if v91.Pic.Image ~= "rbxassetid://1001888573" then
											if v91.Pic.Image == "rbxassetid://1001888370" then
												v91.Pic.ImageColor3 = v91.Killer.TextColor3;
											end;
										else
											v91.Pic.ImageColor3 = v91.Killer.TextColor3;
										end;
										v91.Pic.Size = UDim2.new(0, 25, 0, 25);
									end;
								else
									v91.Pic.ImageColor3 = Color3.new(1, 1, 1);
									if v91.Pic.Image ~= "rbxassetid://1001888573" then
										if v91.Pic.Image == "rbxassetid://1001888370" then
											v91.Pic.ImageColor3 = v91.Killer.TextColor3;
										end;
									else
										v91.Pic.ImageColor3 = v91.Killer.TextColor3;
									end;
									v91.Pic.Size = UDim2.new(0, 25, 0, 25);
								end;
							else
								v91.Pic.ImageColor3 = Color3.new(1, 1, 1);
								if v91.Pic.Image ~= "rbxassetid://1001888573" then
									if v91.Pic.Image == "rbxassetid://1001888370" then
										v91.Pic.ImageColor3 = v91.Killer.TextColor3;
									end;
								else
									v91.Pic.ImageColor3 = v91.Killer.TextColor3;
								end;
								v91.Pic.Size = UDim2.new(0, 25, 0, 25);
							end;
							if v91.Pic.Image == "rbxassetid://4194331239" then
								v91.Pic.Size = UDim2.new(0, 25, 0, 25);
							end;
							if v90:findFirstChild("Weapon").Gold.Value == true then
								v91.Pic.ImageColor3 = Color3.new(0.9372549019607843, 0.7215686274509804, 0.2196078431372549);
								v91.Pic.Backstab.ImageColor3 = Color3.new(0.9372549019607843, 0.7215686274509804, 0.2196078431372549);
							end;
							local l__Killer__97 = v91.Killer;
							local l__Victim__98 = v91.Victim;
							local l__Pic__99 = v91.Pic;
							local l__textstring__100 = v91.textstring;
							local l__textstring2__101 = v91.textstring2;
							l__Killer__97.Visible = false;
							local v102 = -4;
							if v90.Killer.Value ~= "" then
								l__Killer__97.Visible = true;
								v102 = 0;
							end;
							l__Victim__98.Size = UDim2.new(0, l__Victim__98.TextBounds.X + 2, 1, 0);
							l__textstring2__101.Size = UDim2.new(0, l__textstring2__101.TextBounds.X + 2, 1, 0);
							l__textstring__100.Size = UDim2.new(0, l__textstring__100.TextBounds.X + 2, 1, 0);
							l__Killer__97.Size = UDim2.new(0, l__Killer__97.TextBounds.X + 2, 1, 0);
							local v103 = 0;
							if 2 < l__textstring2__101.Size.X.Offset then
								v103 = 2;
							end;
							l__textstring2__101.Position = UDim2.new(1, -(l__textstring2__101.Size.X.Offset + 5 + v103), 0, 0);
							l__Victim__98.Position = UDim2.new(1, l__textstring2__101.Position.X.Offset - (l__Victim__98.Size.X.Offset + v103), 0, 0);
							l__textstring__100.Position = UDim2.new(1, l__Victim__98.Position.X.Offset - (l__textstring__100.Size.X.Offset + 2), 0, 0);
							local v104 = 0;
							if 2 < l__textstring__100.Size.X.Offset then
								v104 = 4;
							end;
							l__Pic__99.Position = UDim2.new(1, l__textstring__100.Position.X.Offset - (l__Pic__99.Size.X.Offset + v95 + v104 - 2), 0, 0);
							l__Killer__97.Position = UDim2.new(1, l__Pic__99.Position.X.Offset - (l__Killer__97.Size.X.Offset + 2), 0, 0);
							local v105 = -l__Killer__97.Position.X.Offset + v92 + 7 + v102;
							if v91.Size.X.Offset ~= v105 then
								v91.Size = UDim2.new(0, v105, 0, 25);
							end;
							v91.Position = UDim2.new(1, -v91.Size.X.Offset, 0, v87);
							if sP.Mobile.Visible == true then
								v91.Position = UDim2.new(0, 0, 0, v87);
							end;
							v91.Visible = true;
							v87 = v87 + 25;
						elseif sP.TopRight:FindFirstChild(v88) then
							sP.TopRight[v88]:Destroy();
						end;
					elseif sP.TopRight:FindFirstChild(v88) then
						sP.TopRight[v88]:Destroy();
					end;
				else
					if sP.TopRight:FindFirstChild(v88) then
						v91 = sP.TopRight[v88];
					else
						v91 = sP.kftemplate:clone();
					end;
					v91.Parent = sP.TopRight;
					v91.Visible = true;
					v91.Name = v88;
					v91.Killer.Text = require(game.ReplicatedStorage.Modules.GetUsername).GetNameToShow(v90.Killer.Value);
					if v90.Assist.Value ~= "" then
						v91.Killer.Text = v91.Killer.Text .. " + " .. require(game.ReplicatedStorage.Modules.GetUsername).GetNameToShow(v90.Assist.Value);
					end;
					v91.Killer.TextColor3 = v90.Killer:findFirstChild("TeamColor").Value;
					v91.Victim.Text = require(game.ReplicatedStorage.Modules.GetUsername).GetNameToShow(v90.Victim.Value);
					v91.Victim.TextColor3 = v90.Victim:findFirstChild("TeamColor").Value;
					v91.Pic.Image = v90:findFirstChild("Weapon").Value;
					v91.Pic.Size = UDim2.new(0, 68, 1, 0);
					v91.Pic.Headshot.Visible = false;
					v91.Pic.Noscope.Visible = false;
					v91.Pic.Backstab.Visible = false;
					v91.Midair.Visible = false;
					v92 = 0;
					if v90:findFirstChild("Weapon").Midair.Value == true then
						v91.Midair.Visible = true;
						v91.Midair.Position = UDim2.new(0, 7, 0, 0);
						v92 = 27;
					end;
					v93 = Color3.new(0.24705882352941178, 0.24705882352941178, 0.24705882352941178);
					v94 = Color3.new(0.7529411764705882, 0.7529411764705882, 0.7529411764705882);
					if v89 == true then
						v91.Pic.ImageColor3 = v93;
						v91.Pic.Headshot.ImageColor3 = v93;
						v91.Pic.Backstab.ImageColor3 = v93;
						v91.Pic.Noscope.ImageColor3 = v93;
						v91.Midair.ImageColor3 = v93;
						v91.Host.Visible = true;
						v91.Nope.Visible = false;
						v91.textstring.TextColor3 = Color3.new(0, 0, 0);
						v91.textstring2.TextColor3 = Color3.new(0, 0, 0);
					else
						v91.Pic.ImageColor3 = v94;
						v91.Pic.Headshot.ImageColor3 = v94;
						v91.Pic.Headshot.ImageColor3 = v94;
						v91.Pic.Backstab.ImageColor3 = v94;
						v91.Pic.Noscope.ImageColor3 = v94;
						v91.Midair.ImageColor3 = v94;
						v91.Host.Visible = false;
						v91.Nope.Visible = true;
						v91.textstring.TextColor3 = Color3.new(1, 1, 1);
						v91.textstring2.TextColor3 = Color3.new(1, 1, 1);
					end;
					v95 = 0;
					if v90:findFirstChild("Weapon").mcrit.Value ~= true then
						if v90:findFirstChild("Weapon").crit.Value == true then
							v91.Pic.Crit.Visible = true;
						else
							v91.Pic.Crit.Visible = false;
						end;
					else
						v91.Pic.Crit.Visible = true;
					end;
					v96 = 0;
					if v90:findFirstChild("Weapon").Noscope.Value == true then
						v95 = v95 + 25;
						v91.Pic.Noscope.Position = UDim2.new(1, v96, 0, 0);
						v91.Pic.Noscope.Visible = true;
						v96 = v96 + 25;
					end;
					if v90:findFirstChild("Weapon").Backstab.Value == true then
						v95 = v95 + 25;
						v91.Pic.Backstab.Position = UDim2.new(1, v96, 0, 0);
						v91.Pic.Backstab.Visible = true;
						v96 = v96 + 25;
					end;
					if v90:findFirstChild("Weapon").Headshot.Value == true then
						v95 = v95 + 60;
						v91.Pic.Headshot.Position = UDim2.new(1, v96, 0, 0);
						v91.Pic.Headshot.Visible = true;
					end;
					v91.textstring.Text = "";
					v91.textstring.Visible = false;
					if v90.textstring.Value ~= "" then
						v91.textstring.Visible = true;
						v91.textstring.Text = v90:findFirstChild("textstring").Value;
					end;
					v91.textstring2.Text = "";
					v91.textstring2.Visible = false;
					if v90.textstring2.Value ~= "" then
						v91.textstring2.Visible = true;
						v91.textstring2.Text = v90:findFirstChild("textstring2").Value;
					end;
					if v91.Pic.Image ~= "rbxassetid://2894751917" then
						if v91.Pic.Image ~= "rbxassetid://2591908143" then
							if v91.Pic.Image ~= "rbxassetid://2591909383" then
								if v91.Pic.Image == "rbxassetid://2852568566" then
									v91.Pic.ImageColor3 = Color3.new(1, 1, 1);
								end;
							else
								v91.Pic.ImageColor3 = Color3.new(1, 1, 1);
							end;
						else
							v91.Pic.ImageColor3 = Color3.new(1, 1, 1);
						end;
					else
						v91.Pic.ImageColor3 = Color3.new(1, 1, 1);
					end;
					if v91.Pic.Image ~= "rbxassetid://999533804" then
						if v91.Pic.Image ~= "rbxassetid://1001888573" then
							if v91.Pic.Image == "rbxassetid://1001888370" then
								v91.Pic.ImageColor3 = Color3.new(1, 1, 1);
								if v91.Pic.Image ~= "rbxassetid://1001888573" then
									if v91.Pic.Image == "rbxassetid://1001888370" then
										v91.Pic.ImageColor3 = v91.Killer.TextColor3;
									end;
								else
									v91.Pic.ImageColor3 = v91.Killer.TextColor3;
								end;
								v91.Pic.Size = UDim2.new(0, 25, 0, 25);
							end;
						else
							v91.Pic.ImageColor3 = Color3.new(1, 1, 1);
							if v91.Pic.Image ~= "rbxassetid://1001888573" then
								if v91.Pic.Image == "rbxassetid://1001888370" then
									v91.Pic.ImageColor3 = v91.Killer.TextColor3;
								end;
							else
								v91.Pic.ImageColor3 = v91.Killer.TextColor3;
							end;
							v91.Pic.Size = UDim2.new(0, 25, 0, 25);
						end;
					else
						v91.Pic.ImageColor3 = Color3.new(1, 1, 1);
						if v91.Pic.Image ~= "rbxassetid://1001888573" then
							if v91.Pic.Image == "rbxassetid://1001888370" then
								v91.Pic.ImageColor3 = v91.Killer.TextColor3;
							end;
						else
							v91.Pic.ImageColor3 = v91.Killer.TextColor3;
						end;
						v91.Pic.Size = UDim2.new(0, 25, 0, 25);
					end;
					if v91.Pic.Image == "rbxassetid://4194331239" then
						v91.Pic.Size = UDim2.new(0, 25, 0, 25);
					end;
					if v90:findFirstChild("Weapon").Gold.Value == true then
						v91.Pic.ImageColor3 = Color3.new(0.9372549019607843, 0.7215686274509804, 0.2196078431372549);
						v91.Pic.Backstab.ImageColor3 = Color3.new(0.9372549019607843, 0.7215686274509804, 0.2196078431372549);
					end;
					l__Killer__97 = v91.Killer;
					l__Victim__98 = v91.Victim;
					l__Pic__99 = v91.Pic;
					l__textstring__100 = v91.textstring;
					l__textstring2__101 = v91.textstring2;
					l__Killer__97.Visible = false;
					v102 = -4;
					if v90.Killer.Value ~= "" then
						l__Killer__97.Visible = true;
						v102 = 0;
					end;
					l__Victim__98.Size = UDim2.new(0, l__Victim__98.TextBounds.X + 2, 1, 0);
					l__textstring2__101.Size = UDim2.new(0, l__textstring2__101.TextBounds.X + 2, 1, 0);
					l__textstring__100.Size = UDim2.new(0, l__textstring__100.TextBounds.X + 2, 1, 0);
					l__Killer__97.Size = UDim2.new(0, l__Killer__97.TextBounds.X + 2, 1, 0);
					v103 = 0;
					if 2 < l__textstring2__101.Size.X.Offset then
						v103 = 2;
					end;
					l__textstring2__101.Position = UDim2.new(1, -(l__textstring2__101.Size.X.Offset + 5 + v103), 0, 0);
					l__Victim__98.Position = UDim2.new(1, l__textstring2__101.Position.X.Offset - (l__Victim__98.Size.X.Offset + v103), 0, 0);
					l__textstring__100.Position = UDim2.new(1, l__Victim__98.Position.X.Offset - (l__textstring__100.Size.X.Offset + 2), 0, 0);
					v104 = 0;
					if 2 < l__textstring__100.Size.X.Offset then
						v104 = 4;
					end;
					l__Pic__99.Position = UDim2.new(1, l__textstring__100.Position.X.Offset - (l__Pic__99.Size.X.Offset + v95 + v104 - 2), 0, 0);
					l__Killer__97.Position = UDim2.new(1, l__Pic__99.Position.X.Offset - (l__Killer__97.Size.X.Offset + 2), 0, 0);
					v105 = -l__Killer__97.Position.X.Offset + v92 + 7 + v102;
					if v91.Size.X.Offset ~= v105 then
						v91.Size = UDim2.new(0, v105, 0, 25);
					end;
					v91.Position = UDim2.new(1, -v91.Size.X.Offset, 0, v87);
					if sP.Mobile.Visible == true then
						v91.Position = UDim2.new(0, 0, 0, v87);
					end;
					v91.Visible = true;
					v87 = v87 + 25;
				end;
			elseif v89 == false then
				if wkspc.DistributedTime.Value - v90.time.Value < 10 then
					if sP.TopRight:FindFirstChild(v88) then
						v91 = sP.TopRight[v88];
					else
						v91 = sP.kftemplate:clone();
					end;
					v91.Parent = sP.TopRight;
					v91.Visible = true;
					v91.Name = v88;
					v91.Killer.Text = require(game.ReplicatedStorage.Modules.GetUsername).GetNameToShow(v90.Killer.Value);
					if v90.Assist.Value ~= "" then
						v91.Killer.Text = v91.Killer.Text .. " + " .. require(game.ReplicatedStorage.Modules.GetUsername).GetNameToShow(v90.Assist.Value);
					end;
					v91.Killer.TextColor3 = v90.Killer:findFirstChild("TeamColor").Value;
					v91.Victim.Text = require(game.ReplicatedStorage.Modules.GetUsername).GetNameToShow(v90.Victim.Value);
					v91.Victim.TextColor3 = v90.Victim:findFirstChild("TeamColor").Value;
					v91.Pic.Image = v90:findFirstChild("Weapon").Value;
					v91.Pic.Size = UDim2.new(0, 68, 1, 0);
					v91.Pic.Headshot.Visible = false;
					v91.Pic.Noscope.Visible = false;
					v91.Pic.Backstab.Visible = false;
					v91.Midair.Visible = false;
					v92 = 0;
					if v90:findFirstChild("Weapon").Midair.Value == true then
						v91.Midair.Visible = true;
						v91.Midair.Position = UDim2.new(0, 7, 0, 0);
						v92 = 27;
					end;
					v93 = Color3.new(0.24705882352941178, 0.24705882352941178, 0.24705882352941178);
					v94 = Color3.new(0.7529411764705882, 0.7529411764705882, 0.7529411764705882);
					if v89 == true then
						v91.Pic.ImageColor3 = v93;
						v91.Pic.Headshot.ImageColor3 = v93;
						v91.Pic.Backstab.ImageColor3 = v93;
						v91.Pic.Noscope.ImageColor3 = v93;
						v91.Midair.ImageColor3 = v93;
						v91.Host.Visible = true;
						v91.Nope.Visible = false;
						v91.textstring.TextColor3 = Color3.new(0, 0, 0);
						v91.textstring2.TextColor3 = Color3.new(0, 0, 0);
					else
						v91.Pic.ImageColor3 = v94;
						v91.Pic.Headshot.ImageColor3 = v94;
						v91.Pic.Headshot.ImageColor3 = v94;
						v91.Pic.Backstab.ImageColor3 = v94;
						v91.Pic.Noscope.ImageColor3 = v94;
						v91.Midair.ImageColor3 = v94;
						v91.Host.Visible = false;
						v91.Nope.Visible = true;
						v91.textstring.TextColor3 = Color3.new(1, 1, 1);
						v91.textstring2.TextColor3 = Color3.new(1, 1, 1);
					end;
					v95 = 0;
					if v90:findFirstChild("Weapon").mcrit.Value ~= true then
						if v90:findFirstChild("Weapon").crit.Value == true then
							v91.Pic.Crit.Visible = true;
						else
							v91.Pic.Crit.Visible = false;
						end;
					else
						v91.Pic.Crit.Visible = true;
					end;
					v96 = 0;
					if v90:findFirstChild("Weapon").Noscope.Value == true then
						v95 = v95 + 25;
						v91.Pic.Noscope.Position = UDim2.new(1, v96, 0, 0);
						v91.Pic.Noscope.Visible = true;
						v96 = v96 + 25;
					end;
					if v90:findFirstChild("Weapon").Backstab.Value == true then
						v95 = v95 + 25;
						v91.Pic.Backstab.Position = UDim2.new(1, v96, 0, 0);
						v91.Pic.Backstab.Visible = true;
						v96 = v96 + 25;
					end;
					if v90:findFirstChild("Weapon").Headshot.Value == true then
						v95 = v95 + 60;
						v91.Pic.Headshot.Position = UDim2.new(1, v96, 0, 0);
						v91.Pic.Headshot.Visible = true;
					end;
					v91.textstring.Text = "";
					v91.textstring.Visible = false;
					if v90.textstring.Value ~= "" then
						v91.textstring.Visible = true;
						v91.textstring.Text = v90:findFirstChild("textstring").Value;
					end;
					v91.textstring2.Text = "";
					v91.textstring2.Visible = false;
					if v90.textstring2.Value ~= "" then
						v91.textstring2.Visible = true;
						v91.textstring2.Text = v90:findFirstChild("textstring2").Value;
					end;
					if v91.Pic.Image ~= "rbxassetid://2894751917" then
						if v91.Pic.Image ~= "rbxassetid://2591908143" then
							if v91.Pic.Image ~= "rbxassetid://2591909383" then
								if v91.Pic.Image == "rbxassetid://2852568566" then
									v91.Pic.ImageColor3 = Color3.new(1, 1, 1);
								end;
							else
								v91.Pic.ImageColor3 = Color3.new(1, 1, 1);
							end;
						else
							v91.Pic.ImageColor3 = Color3.new(1, 1, 1);
						end;
					else
						v91.Pic.ImageColor3 = Color3.new(1, 1, 1);
					end;
					if v91.Pic.Image ~= "rbxassetid://999533804" then
						if v91.Pic.Image ~= "rbxassetid://1001888573" then
							if v91.Pic.Image == "rbxassetid://1001888370" then
								v91.Pic.ImageColor3 = Color3.new(1, 1, 1);
								if v91.Pic.Image ~= "rbxassetid://1001888573" then
									if v91.Pic.Image == "rbxassetid://1001888370" then
										v91.Pic.ImageColor3 = v91.Killer.TextColor3;
									end;
								else
									v91.Pic.ImageColor3 = v91.Killer.TextColor3;
								end;
								v91.Pic.Size = UDim2.new(0, 25, 0, 25);
							end;
						else
							v91.Pic.ImageColor3 = Color3.new(1, 1, 1);
							if v91.Pic.Image ~= "rbxassetid://1001888573" then
								if v91.Pic.Image == "rbxassetid://1001888370" then
									v91.Pic.ImageColor3 = v91.Killer.TextColor3;
								end;
							else
								v91.Pic.ImageColor3 = v91.Killer.TextColor3;
							end;
							v91.Pic.Size = UDim2.new(0, 25, 0, 25);
						end;
					else
						v91.Pic.ImageColor3 = Color3.new(1, 1, 1);
						if v91.Pic.Image ~= "rbxassetid://1001888573" then
							if v91.Pic.Image == "rbxassetid://1001888370" then
								v91.Pic.ImageColor3 = v91.Killer.TextColor3;
							end;
						else
							v91.Pic.ImageColor3 = v91.Killer.TextColor3;
						end;
						v91.Pic.Size = UDim2.new(0, 25, 0, 25);
					end;
					if v91.Pic.Image == "rbxassetid://4194331239" then
						v91.Pic.Size = UDim2.new(0, 25, 0, 25);
					end;
					if v90:findFirstChild("Weapon").Gold.Value == true then
						v91.Pic.ImageColor3 = Color3.new(0.9372549019607843, 0.7215686274509804, 0.2196078431372549);
						v91.Pic.Backstab.ImageColor3 = Color3.new(0.9372549019607843, 0.7215686274509804, 0.2196078431372549);
					end;
					l__Killer__97 = v91.Killer;
					l__Victim__98 = v91.Victim;
					l__Pic__99 = v91.Pic;
					l__textstring__100 = v91.textstring;
					l__textstring2__101 = v91.textstring2;
					l__Killer__97.Visible = false;
					v102 = -4;
					if v90.Killer.Value ~= "" then
						l__Killer__97.Visible = true;
						v102 = 0;
					end;
					l__Victim__98.Size = UDim2.new(0, l__Victim__98.TextBounds.X + 2, 1, 0);
					l__textstring2__101.Size = UDim2.new(0, l__textstring2__101.TextBounds.X + 2, 1, 0);
					l__textstring__100.Size = UDim2.new(0, l__textstring__100.TextBounds.X + 2, 1, 0);
					l__Killer__97.Size = UDim2.new(0, l__Killer__97.TextBounds.X + 2, 1, 0);
					v103 = 0;
					if 2 < l__textstring2__101.Size.X.Offset then
						v103 = 2;
					end;
					l__textstring2__101.Position = UDim2.new(1, -(l__textstring2__101.Size.X.Offset + 5 + v103), 0, 0);
					l__Victim__98.Position = UDim2.new(1, l__textstring2__101.Position.X.Offset - (l__Victim__98.Size.X.Offset + v103), 0, 0);
					l__textstring__100.Position = UDim2.new(1, l__Victim__98.Position.X.Offset - (l__textstring__100.Size.X.Offset + 2), 0, 0);
					v104 = 0;
					if 2 < l__textstring__100.Size.X.Offset then
						v104 = 4;
					end;
					l__Pic__99.Position = UDim2.new(1, l__textstring__100.Position.X.Offset - (l__Pic__99.Size.X.Offset + v95 + v104 - 2), 0, 0);
					l__Killer__97.Position = UDim2.new(1, l__Pic__99.Position.X.Offset - (l__Killer__97.Size.X.Offset + 2), 0, 0);
					v105 = -l__Killer__97.Position.X.Offset + v92 + 7 + v102;
					if v91.Size.X.Offset ~= v105 then
						v91.Size = UDim2.new(0, v105, 0, 25);
					end;
					v91.Position = UDim2.new(1, -v91.Size.X.Offset, 0, v87);
					if sP.Mobile.Visible == true then
						v91.Position = UDim2.new(0, 0, 0, v87);
					end;
					v91.Visible = true;
					v87 = v87 + 25;
				elseif sP.TopRight:FindFirstChild(v88) then
					sP.TopRight[v88]:Destroy();
				end;
			elseif sP.TopRight:FindFirstChild(v88) then
				sP.TopRight[v88]:Destroy();
			end;
		elseif sP.TopRight:FindFirstChild(v88) then
			sP.TopRight[v88]:Destroy();
		end;
		if 0 <= 1 then
			if v88 < 6 then

			else
				break;
			end;
		elseif 6 < v88 then

		else
			break;
		end;
		v88 = v88 + 1;	
	end;
	gui.TopRight.Position = UDim2.new(1, -275, 0, -17);
	if l__GuiService__7:IsTenFootInterface() then
		gui.Timer.Position = UDim2.new(0.5, 0, 0, 0);
		gui.TopRight.Position = UDim2.new(1, -260, 0, 36);
	end;
	if sP.Mobile.Visible == true then
		gui.TopRight.Position = UDim2.new(0, 0, 0, 0);
	end;
end;
if Player.PlayerGui:FindFirstChild("TouchGui") and (not l__UserInputService__9.KeyboardEnabled or l__RunService__14:IsStudio()) then
	istouch.Value = true;
end;
l__ReplicatedStorage__6.Events.Votekick.OnClientInvoke = function(p26)
	return camera:WorldToViewportPoint(p26);
end;
pcall(function()
	u1:SetCoreGuiEnabled(Enum.CoreGuiType.Backpack, false);
	u1:SetCoreGuiEnabled(Enum.CoreGuiType.Health, false);
	u1:SetCoreGuiEnabled(Enum.CoreGuiType.PlayerList, false);
	u1:SetCore("TopbarEnabled", false);
end);
pcall(function()
	wait();
	if l__LocalizationService__1.RobloxLocaleId ~= "en-us" then
		l__TeleportService__10:SetTeleportGui(l__ReplicatedStorage__6:WaitForChild("LoadingBanners"):WaitForChild("UI"):WaitForChild("TeleportingIntl"));
		return;
	end;
	local l__TeleportingEN-US__106 = l__ReplicatedStorage__6:WaitForChild("LoadingBanners"):WaitForChild("UI"):WaitForChild("TeleportingEN-US");
	local l__AbsoluteSize__107 = game.Players.LocalPlayer:WaitForChild("PlayerGui"):WaitForChild("Subtitles").AbsoluteSize;
	if l__AbsoluteSize__107.X < 1024 or l__AbsoluteSize__107.Y < 576 then
		l__TeleportingEN-US__106.Banner.Size = UDim2.new(1, 0, 1, 0);
		l__TeleportingEN-US__106.Banner.Position = UDim2.new(0, 0, 0, 0);
	end;
	l__TeleportingEN-US__106.Banner.Image = "rbxassetid://" .. l__ReplicatedStorage__6.LoadingBanners[Random.new(tick() * 10000):NextInteger(1, 3)].Value;
	l__TeleportService__10:SetTeleportGui(l__ReplicatedStorage__6.LoadingBanners.UI["TeleportingEN-US"]);
end);
while true do
	l__RunService__14.Heartbeat:wait();
	if Player and l__Workspace__11.CurrentCamera then
		break;
	end;
end;
u1:SetCoreGuiEnabled(Enum.CoreGuiType.Backpack, false);
u1:SetCoreGuiEnabled(Enum.CoreGuiType.Health, false);
u1:SetCoreGuiEnabled(Enum.CoreGuiType.PlayerList, false);
u1:SetCore("TopbarEnabled", false);
Player.ChildAdded:connect(function(p27)
	l__RunService__14.Stepped:wait();
	if p27.Name == "Hex" then
		soundmod.playsound(sP.Sounds.Hexed);
	end;
	if p27.Name == "Whizz" then
		soundmod.playsound(sP.Sounds["Miss" .. math.random(1, 11)]);
		if math.random(1, 10) == 1 then
			clientf.dovoice("ShotAt", player.Character);
		end;
	end;
end);
Player.ChildRemoved:connect(function(p28)
	l__RunService__14.Stepped:wait();
	if p28.Name == "Hex" then
		soundmod.playsound(sP.Sounds["Hex" .. math.random(1, 3)]);
	end;
end);
if Player.Status.Alive.Value == false then
	sP.Black.Visible = false;
	Camera.CameraSubject = nil;
	Camera.CameraType = "Scriptable";
	gui.Spectate.Visible = true;
end;
mouse.TargetFilter = Camera;
function dotaunt(p29)
	if Player.Status.Team.Value ~= "Spectator" then
		if taunting.Value == true then
			if Animations.tidle then
				if Animations.tidle.IsPlaying == true then
					tauntend.Value = true;
					return;
				end;
			end;
		end;
		if gui.TauntMenu.Visible == true then
			selectedtaunt.Value = nil;
			gui.TauntMenu.Visible = false;
			if workspace:FindFirstChild("Map") then
				if workspace.Map.Geometry:FindFirstChild("SummerChair1") then
					local v108 = Character and Character.PrimaryPart.Position or Vector3.new();
					local v109, v110, v111 = pairs({ workspace.Map.Geometry.SummerChair1, workspace.Map.Geometry.SummerChair2 });
					while true do
						local v112, v113 = v109(v110, v111);
						if v112 then

						else
							break;
						end;
						v111 = v112;
						if (v108 - v113.Position).magnitude <= 6 then
							local v114 = true;
							local v115, v116, v117 = pairs(l__Players__13:GetPlayers());
							while true do
								local v118, v119 = v115(v116, v117);
								if v118 then

								else
									break;
								end;
								v117 = v118;
								if v119 ~= Player then
									if v119.Character then
										if v119.Character:FindFirstChild("Gear") then
											if v119.Character.Gear:FindFirstChild("nobrim") then
												if (v119.Character.PrimaryPart.Position - v108).magnitude <= 6 then
													v114 = false;
													break;
												end;
											end;
										end;
									end;
								end;							
							end;
							if v114 then
								coroutine.resume(coroutine.create(function()
									wait(0.06);
									Character:SetPrimaryPartCFrame(v113.CFrame * CFrame.new(0, 3, 1.2));
								end));
								loadtaunt(Character, Character.Humanoid, "Summer Slack With No Brim");
							end;
							break;
						end;					
					end;
				end;
			end;
			gen.taunt();
			return;
		end;
		local v120 = false;
		local v121 = l__Players__13:GetPlayers();
		if Character then
			if Character:FindFirstChild("HumanoidRootPart") then
				local v122 = #v121;
				local v123 = 1 - 1;
				while true do
					if v121[v123].Character then
						if v121[v123].Character:FindFirstChild("HumanoidRootPart") then
							if v121[v123].Character:FindFirstChild("Gear") then
								if v121[v123].Character.Gear:FindFirstChild("Partner") then
									if (v121[v123].Character.HumanoidRootPart.Position - Character.HumanoidRootPart.Position).magnitude <= 8 then
										local l__HumanoidRootPart__124 = Character.HumanoidRootPart;
										local l__HumanoidRootPart__125 = v121[v123].Character.HumanoidRootPart;
										if math.acos((Vector3.new(l__HumanoidRootPart__125.Position.X, 0, l__HumanoidRootPart__125.Position.Z) - Vector3.new(l__HumanoidRootPart__124.Position.X, 0, l__HumanoidRootPart__124.Position.Z)).unit:Dot(l__HumanoidRootPart__124.CFrame.lookVector.unit)) / math.pi * 180 <= 75 then
											v120 = l__HumanoidRootPart__125;
											break;
										end;
									end;
								end;
							end;
						end;
					end;
					if 0 <= 1 then
						if v123 < v122 then

						else
							break;
						end;
					elseif v122 < v123 then

					else
						break;
					end;
					v123 = v123 + 1;				
				end;
			end;
		end;
		if v120 ~= false then
			l__ReplicatedStorage__6.Events.AcceptPartner:FireServer(v120);
		end;
		if taunting.Value == false then
			if v120 == false then
				gui.TauntMenu.Visible = true;
				if p29 then
					gui.TauntMenu.Taunts["1"].TextLabel.Text = "UP";
					gui.TauntMenu.Taunts["2"].TextLabel.Text = "DOWN";
					gui.TauntMenu.Taunts["3"].TextLabel.Text = "LEFT";
					gui.TauntMenu.Taunts["4"].TextLabel.Text = "RIGHT";
					gui.TauntMenu.Taunts["5"].TextLabel.Text = "R3";
					gui.TauntMenu.Taunts["6"].TextLabel.Text = "L3";
					gui.TauntMenu.TauntInfo.Text = "(Y) Dance, or accept a partner taunt.";
					gui.TauntMenu.CancelInfo.Text = "(B) Cancel";
				end;
				if game.Players.LocalPlayer.PlayerGui:FindFirstChild("TouchGui") then
					gui.TauntMenu.TauntInfo.Visible = false;
					gui.TauntMenu.CancelInfo.Visible = false;
					gui.TauntMenu.TauntSelect.Text = "Tap a taunt above to play, or tap the emote button again to dance.";
				end;
				local v126 = #player.Data.Emotes:GetChildren();
				local v127 = 1 - 1;
				while true do
					local l__Value__128 = player.Data.Emotes[tostring(v127)].Value;
					if l__Value__128.Value ~= "None" then
						gui.TauntMenu.Taunts[tostring(v127)].Visible = true;
						gui.TauntMenu.Taunts[tostring(v127)].tname.Text = _gf.split(l__Value__128, "_")[1];
						if p29 == false then
							gui.TauntMenu.Taunts[tostring(v127)].TextLabel.Text = v127;
						end;
					else
						gui.TauntMenu.Taunts[tostring(v127)].Visible = false;
					end;
					if 0 <= 1 then
						if v127 < v126 then

						else
							break;
						end;
					elseif v126 < v127 then

					else
						break;
					end;
					v127 = v127 + 1;				
				end;
			end;
		end;
	end;
end;
function colorarm(p30)
	local v129 = player.TeamColor.Color;
	if wkspc.FFA.Value ~= true then
		if wkspc.gametype.Value == "Juggernaut" then
			v129 = player.DesignColor.Value.Color;
		end;
	else
		v129 = player.DesignColor.Value.Color;
	end;
	local v130 = p30:GetDescendants();
	local v131 = #v130;
	local v132 = 1 - 1;
	while true do
		if v130[v132]:FindFirstChild("teamoverlay") then
			local v133 = 1;
			if v130[v132].teamoverlay:FindFirstChild("Mod") then
				v133 = v130[v132].teamoverlay.Mod.Value;
			end;
			v130[v132].teamoverlay.Color3 = Color3.new(v129.R * v133, v129.G * v133, v129.B * v133);
		end;
		if v130[v132]:IsA("BasePart") then
			if v130[v132].BrickColor ~= BrickColor.new("Hot pink") then
				if v130[v132].BrickColor ~= BrickColor.new("Bright red") then
					if v130[v132]:FindFirstChild("Mesh") then
						if 0.8 <= v130[v132].Mesh.VertexColor.X then
							if not (v130[v132].Mesh.VertexColor.Z <= 0.76) then
								if 0.15 <= v130[v132].Mesh.VertexColor.X then
									if v130[v132].Mesh.VertexColor.X <= 0.78 then
										if not (v130[v132].Mesh.VertexColor.Z <= 0.15) then
											if v130[v132]:FindFirstChild("Colorable") then
												if not v130[v132]:FindFirstChild("NoColor") then
													if v130[v132]:FindFirstChild("Colorable") == nil then
														local v134 = Instance.new("IntValue");
														v134.Name = "Colorable";
														v134.Parent = v130[v132];
													end;
													local v135 = 1;
													if v130[v132]:FindFirstChild("Mod") then
														v135 = v130[v132].Mod.Value;
													end;
													v129 = Color3.new(v129.R * v135, v129.G * v135, v129.B * v135);
													if v130[v132]:FindFirstChild("Mesh") then
														v130[v132].Mesh.VertexColor = Vector3.new(v129.r, v129.g, v129.b);
													end;
													v130[v132].Color = v129;
												end;
											end;
										elseif not v130[v132]:FindFirstChild("NoColor") then
											if v130[v132]:FindFirstChild("Colorable") == nil then
												v134 = Instance.new("IntValue");
												v134.Name = "Colorable";
												v134.Parent = v130[v132];
											end;
											v135 = 1;
											if v130[v132]:FindFirstChild("Mod") then
												v135 = v130[v132].Mod.Value;
											end;
											v129 = Color3.new(v129.R * v135, v129.G * v135, v129.B * v135);
											if v130[v132]:FindFirstChild("Mesh") then
												v130[v132].Mesh.VertexColor = Vector3.new(v129.r, v129.g, v129.b);
											end;
											v130[v132].Color = v129;
										end;
									elseif v130[v132]:FindFirstChild("Colorable") then
										if not v130[v132]:FindFirstChild("NoColor") then
											if v130[v132]:FindFirstChild("Colorable") == nil then
												v134 = Instance.new("IntValue");
												v134.Name = "Colorable";
												v134.Parent = v130[v132];
											end;
											v135 = 1;
											if v130[v132]:FindFirstChild("Mod") then
												v135 = v130[v132].Mod.Value;
											end;
											v129 = Color3.new(v129.R * v135, v129.G * v135, v129.B * v135);
											if v130[v132]:FindFirstChild("Mesh") then
												v130[v132].Mesh.VertexColor = Vector3.new(v129.r, v129.g, v129.b);
											end;
											v130[v132].Color = v129;
										end;
									end;
								elseif v130[v132]:FindFirstChild("Colorable") then
									if not v130[v132]:FindFirstChild("NoColor") then
										if v130[v132]:FindFirstChild("Colorable") == nil then
											v134 = Instance.new("IntValue");
											v134.Name = "Colorable";
											v134.Parent = v130[v132];
										end;
										v135 = 1;
										if v130[v132]:FindFirstChild("Mod") then
											v135 = v130[v132].Mod.Value;
										end;
										v129 = Color3.new(v129.R * v135, v129.G * v135, v129.B * v135);
										if v130[v132]:FindFirstChild("Mesh") then
											v130[v132].Mesh.VertexColor = Vector3.new(v129.r, v129.g, v129.b);
										end;
										v130[v132].Color = v129;
									end;
								end;
							elseif not v130[v132]:FindFirstChild("NoColor") then
								if v130[v132]:FindFirstChild("Colorable") == nil then
									v134 = Instance.new("IntValue");
									v134.Name = "Colorable";
									v134.Parent = v130[v132];
								end;
								v135 = 1;
								if v130[v132]:FindFirstChild("Mod") then
									v135 = v130[v132].Mod.Value;
								end;
								v129 = Color3.new(v129.R * v135, v129.G * v135, v129.B * v135);
								if v130[v132]:FindFirstChild("Mesh") then
									v130[v132].Mesh.VertexColor = Vector3.new(v129.r, v129.g, v129.b);
								end;
								v130[v132].Color = v129;
							end;
						elseif 0.15 <= v130[v132].Mesh.VertexColor.X then
							if v130[v132].Mesh.VertexColor.X <= 0.78 then
								if not (v130[v132].Mesh.VertexColor.Z <= 0.15) then
									if v130[v132]:FindFirstChild("Colorable") then
										if not v130[v132]:FindFirstChild("NoColor") then
											if v130[v132]:FindFirstChild("Colorable") == nil then
												v134 = Instance.new("IntValue");
												v134.Name = "Colorable";
												v134.Parent = v130[v132];
											end;
											v135 = 1;
											if v130[v132]:FindFirstChild("Mod") then
												v135 = v130[v132].Mod.Value;
											end;
											v129 = Color3.new(v129.R * v135, v129.G * v135, v129.B * v135);
											if v130[v132]:FindFirstChild("Mesh") then
												v130[v132].Mesh.VertexColor = Vector3.new(v129.r, v129.g, v129.b);
											end;
											v130[v132].Color = v129;
										end;
									end;
								elseif not v130[v132]:FindFirstChild("NoColor") then
									if v130[v132]:FindFirstChild("Colorable") == nil then
										v134 = Instance.new("IntValue");
										v134.Name = "Colorable";
										v134.Parent = v130[v132];
									end;
									v135 = 1;
									if v130[v132]:FindFirstChild("Mod") then
										v135 = v130[v132].Mod.Value;
									end;
									v129 = Color3.new(v129.R * v135, v129.G * v135, v129.B * v135);
									if v130[v132]:FindFirstChild("Mesh") then
										v130[v132].Mesh.VertexColor = Vector3.new(v129.r, v129.g, v129.b);
									end;
									v130[v132].Color = v129;
								end;
							elseif v130[v132]:FindFirstChild("Colorable") then
								if not v130[v132]:FindFirstChild("NoColor") then
									if v130[v132]:FindFirstChild("Colorable") == nil then
										v134 = Instance.new("IntValue");
										v134.Name = "Colorable";
										v134.Parent = v130[v132];
									end;
									v135 = 1;
									if v130[v132]:FindFirstChild("Mod") then
										v135 = v130[v132].Mod.Value;
									end;
									v129 = Color3.new(v129.R * v135, v129.G * v135, v129.B * v135);
									if v130[v132]:FindFirstChild("Mesh") then
										v130[v132].Mesh.VertexColor = Vector3.new(v129.r, v129.g, v129.b);
									end;
									v130[v132].Color = v129;
								end;
							end;
						elseif v130[v132]:FindFirstChild("Colorable") then
							if not v130[v132]:FindFirstChild("NoColor") then
								if v130[v132]:FindFirstChild("Colorable") == nil then
									v134 = Instance.new("IntValue");
									v134.Name = "Colorable";
									v134.Parent = v130[v132];
								end;
								v135 = 1;
								if v130[v132]:FindFirstChild("Mod") then
									v135 = v130[v132].Mod.Value;
								end;
								v129 = Color3.new(v129.R * v135, v129.G * v135, v129.B * v135);
								if v130[v132]:FindFirstChild("Mesh") then
									v130[v132].Mesh.VertexColor = Vector3.new(v129.r, v129.g, v129.b);
								end;
								v130[v132].Color = v129;
							end;
						end;
					elseif v130[v132]:FindFirstChild("Colorable") then
						if not v130[v132]:FindFirstChild("NoColor") then
							if v130[v132]:FindFirstChild("Colorable") == nil then
								v134 = Instance.new("IntValue");
								v134.Name = "Colorable";
								v134.Parent = v130[v132];
							end;
							v135 = 1;
							if v130[v132]:FindFirstChild("Mod") then
								v135 = v130[v132].Mod.Value;
							end;
							v129 = Color3.new(v129.R * v135, v129.G * v135, v129.B * v135);
							if v130[v132]:FindFirstChild("Mesh") then
								v130[v132].Mesh.VertexColor = Vector3.new(v129.r, v129.g, v129.b);
							end;
							v130[v132].Color = v129;
						end;
					end;
				elseif not v130[v132]:FindFirstChild("NoColor") then
					if v130[v132]:FindFirstChild("Colorable") == nil then
						v134 = Instance.new("IntValue");
						v134.Name = "Colorable";
						v134.Parent = v130[v132];
					end;
					v135 = 1;
					if v130[v132]:FindFirstChild("Mod") then
						v135 = v130[v132].Mod.Value;
					end;
					v129 = Color3.new(v129.R * v135, v129.G * v135, v129.B * v135);
					if v130[v132]:FindFirstChild("Mesh") then
						v130[v132].Mesh.VertexColor = Vector3.new(v129.r, v129.g, v129.b);
					end;
					v130[v132].Color = v129;
				end;
			elseif not v130[v132]:FindFirstChild("NoColor") then
				if v130[v132]:FindFirstChild("Colorable") == nil then
					v134 = Instance.new("IntValue");
					v134.Name = "Colorable";
					v134.Parent = v130[v132];
				end;
				v135 = 1;
				if v130[v132]:FindFirstChild("Mod") then
					v135 = v130[v132].Mod.Value;
				end;
				v129 = Color3.new(v129.R * v135, v129.G * v135, v129.B * v135);
				if v130[v132]:FindFirstChild("Mesh") then
					v130[v132].Mesh.VertexColor = Vector3.new(v129.r, v129.g, v129.b);
				end;
				v130[v132].Color = v129;
			end;
		end;
		if 0 <= 1 then
			if v132 < v131 then

			else
				break;
			end;
		elseif v131 < v132 then

		else
			break;
		end;
		v132 = v132 + 1;	
	end;
	if p30.Origin.Value == "Material Man" then

	else
		if p30.Origin.Value == "Bloxy Delinquent" then
			p30["Left Arm"].BrickColor = player.Character.UpperTorso.BrickColor;
			p30["Right Arm"].BrickColor = player.Character.UpperTorso.BrickColor;
		end;
		return;
	end;
	p30["Left Arm"].BrickColor = player.Character.UpperTorso.BrickColor;
	p30["Left Arm"].Material = Enum.Material[player.Data.Material.Value];
	p30["Right Arm"].BrickColor = player.Character.UpperTorso.BrickColor;
	p30["Right Arm"].Material = Enum.Material[player.Data.Material.Value];
end;
function angleBetweenPoints(p31, p32)
	local v136 = p31 - p32;
	return -math.atan2(v136.z, v136.x);
end;
function getCameraAngle(p33)
	return angleBetweenPoints(p33.CoordinateFrame.p, p33.Focus.p);
end;
recentcreator = nil;
local u13 = 100;
local l__IFrame__14 = l__ReplicatedStorage__6:WaitForChild("IFrame");
local u15 = {
	all = {}, 
	new = function(p34, p35)
		local v137 = {
			time = 2 * math.clamp(u13 / 100, 0.5, 1.5) and 1
		};
		local v138 = Camera.CoordinateFrame.p;
		if recentcreator then
			if recentcreator:FindFirstChild("Start") then
				v138 = recentcreator.Start.Value;
			end;
			if recentcreator:FindFirstChild("where") then
				v138 = recentcreator.where.Value;
			end;
		end;
		local l__p__139 = Camera.CoordinateFrame.p;
		v137.position = l__p__139 + (v138 - l__p__139).unit * 999;
		v137.timeCreated = tick();
		v137.timeExpire = tick() + v137.time;
		v137.alive = true;
		v137.frame = l__IFrame__14:clone();
		v137.frame.Parent = gui:WaitForChild("Bin");
		v137.frame.Archivable = false;
		setmetatable(v137, u15);
		p34.__index = p34;
		table.insert(u15.all, v137);
		v137:update();
		return v137;
	end, 
	expire = function(p36)
		p36.alive = false;
		p36.frame:Destroy();
		for v140 = 1, #u15.all do
			if p36 == u15.all[v140] then
				table.remove(u15.all, v140);
				return;
			end;
		end;
	end, 
	setAngle = function(p37, p38)
		if not p37.alive then
			return;
		end;
		p37.frame.Position = UDim2.new(0.5, math.cos(p38) * 100 + p37.frame.AbsoluteSize.X / -2, 0.5, math.sin(p38) * 100 + p37.frame.AbsoluteSize.Y / -2);
		p37.frame.Rotation = p38 * (180 / math.pi) + 90;
	end, 
	update = function(p39)
		if p39.timeExpire <= tick() then
			p39:expire();
			return;
		end;
		local v141 = (tick() - p39.timeCreated) / p39.time;
		p39:setAngle(getCameraAngle(camera) - angleBetweenPoints(camera.Focus.p, p39.position) - math.pi / 2);
		p39.frame.ImageLabel.ImageTransparency = v141;
		p39.frame.ImageLabel.Size = UDim2.new(0, 350, 0, 350 * (1 - v141));
	end, 
	updateAll = function(p40)
		local v142 = 1;
		while v142 <= #u15.all do
			local v143 = u15.all[v142];
			v143:update();
			if v143.alive then
				v142 = v142 + 1;
			end;		
		end;
	end
};
function changehpgui()
	if Humanoid then
		if 0 < Player.NRPBS.Health.Value then

		else
			hpbar.Visible = false;
			return;
		end;
	else
		hpbar.Visible = false;
		return;
	end;
	if Player.NRPBS.Health.Value < 2 then
		if 0 < Player.NRPBS.Health.Value then
			hpbar.Health.HealthNum.Text = 1;
		else
			local v144 = 1;
			if player:FindFirstChild("IsJugg") then
				v144 = 5;
			end;
			if l__ReplicatedStorage__6.Arcade.Value == true then
				v144 = 0.75;
			end;
			hpbar.Health.HealthNum.Text = math.ceil(Player.NRPBS.Health.Value * v144);
		end;
	else
		v144 = 1;
		if player:FindFirstChild("IsJugg") then
			v144 = 5;
		end;
		if l__ReplicatedStorage__6.Arcade.Value == true then
			v144 = 0.75;
		end;
		hpbar.Health.HealthNum.Text = math.ceil(Player.NRPBS.Health.Value * v144);
	end;
	if Player.NRPBS.Health.Value <= 30 then
		hpbar.Health.HealthNum.TextColor3 = Color3.fromRGB(255, 0, 0);
		hpbar.Health.HealthNum.TextStrokeTransparency = 0;
	else
		hpbar.Health.HealthNum.TextColor3 = Color3.fromRGB(1, 1, 1);
		hpbar.Health.HealthNum.TextStrokeTransparency = 1;
	end;
	hpbar.Health.Fill:TweenSize(UDim2.new(math.ceil(Player.NRPBS.Health.Value) / math.ceil(Player.NRPBS.MaxHealth.Value), 0, 1, 0), nil, nil, 0.3, true);
	hpbar.Visible = true;
end;
function died200()
	if died.Value == false then
		l__Variables__15.DISABLED.Value = true;
		died.Value = true;
		sP.Black.Visible = false;
		taunting.Value = false;
		equipped.Value = "none";
		gun.Value = nil;
		wep.usethatgun();
		ammobar.Visible = false;
		hpbar.Visible = false;
		amby:Fire("setcrouched", { false });
		if ads.Value == true then
			ads.Value = false;
			wep.updateads();
		end;
		camera.FieldOfView = l__Variables__15.defaultfov.Value;
		if Camera then
			if Camera:FindFirstChild("Arms") then
				Camera.Arms:Destroy();
			end;
		end;
		local v145 = tick();
		local v146 = 3;
		if game.ReplicatedStorage.wkspc.gametype.Value == "Arena Mode" then
			v146 = 1.3;
		end;
		reviveme = false;
		if gui.Spectate.Visible == false then
			if player.Status.Team.Value ~= "Spectator" then
				while true do
					l__RunService__14.Stepped:wait();
					if died.Value == false then
						if l__RunService__14:IsStudio() then
							print("reverted");
						end;
						return;
					end;
					if not (v146 <= tick() - v145) then

					else
						break;
					end;
					if reviveme ~= true then

					else
						break;
					end;
					if player.Status.Team.Value ~= "Spectator" then

					else
						break;
					end;				
				end;
			end;
		end;
		sP.KillCam.Visible = false;
		sP.Black.Visible = false;
		gui.Spectate.Visible = true;
		while true do
			if wkspc.Status.CanRespawn.Value == false then
				if wkspc.BF.Value == true then
					if reviveme ~= false then
						if wkspc.BFEnd.Value ~= true then
							if player.Status.Team.Value == "Spectator" then

							else
								break;
							end;
						end;
					end;
				elseif wkspc.BFEnd.Value ~= true then
					if player.Status.Team.Value == "Spectator" then

					else
						break;
					end;
				end;
			elseif wkspc.BFEnd.Value ~= true then
				if player.Status.Team.Value == "Spectator" then

				else
					break;
				end;
			end;
			wait();		
		end;
		if player.Status.Team.Value == "Spectator" then
			died.Value = false;
		end;
		if wkspc.BFEnd.Value == false then
			if player.Status.Team.Value ~= "Spectator" then
				reviveme = false;
				gui.Spectate.Visible = false;
				l__ReplicatedStorage__6.Events.LoadCharacter:FireServer();
			end;
		end;
	end;
end;
function inducefalldamage()
	if fdebounce then
		if jumping.Value == true then
			if spawned == true then
				fdebounce = false;
				position = Character.HumanoidRootPart.Position.Y;
				endPosition = "epic";
				local v147 = { l__Workspace__11.Map.Geometry };
				local v148 = workspace:GetChildren();
				local v149 = #v148;
				local v150 = 1 - 1;
				while true do
					if v148[v150]:FindFirstChild("Hitbox") then
						if v148[v150].Name ~= Character.Name then
							if teamcheck.isteam(Player, v148[v150]) == false then
								table.insert(v147, v148[v150].Hitbox);
							end;
						end;
					end;
					if 0 <= 1 then
						if v150 < v149 then

						else
							break;
						end;
					elseif v149 < v150 then

					else
						break;
					end;
					v150 = v150 + 1;				
				end;
				local v151 = tick();
				while true do
					if Character then

					else
						break;
					end;
					if Character:FindFirstChild("HumanoidRootPart") then

					else
						break;
					end;
					if not Character:FindFirstChild("RocketJumped") then
						if not (0 < l__Variables__15.idbrj.Value) then
							if jumping.Value == true then

							else
								break;
							end;
						end;
					end;
					if wkspc.Status.Preparation.Value == false then

					else
						break;
					end;
					local v152 = workspace:FindPartOnRayWithWhitelist(Ray.new(Character.HumanoidRootPart.Position, Vector3.new(0, -1000, 0)), v147, true, false);
					if not (position < Character.HumanoidRootPart.Position.Y) then
						if Humanoid:GetState() == Enum.HumanoidStateType.Climbing then
							position = Character.HumanoidRootPart.Position.Y;
						end;
					else
						position = Character.HumanoidRootPart.Position.Y;
					end;
					if v152 then
						if v152.Parent then
							if not v152.Parent:FindFirstChild("Humanoid") then

							else
								break;
							end;
						end;
					end;
					l__RunService__14.RenderStepped:wait();				
				end;
				while true do
					wait();
					if endPosition == "epic" then

					else
						break;
					end;				
				end;
				local v153 = position - endPosition;
				endPosition = "epic";
				if l__RunService__14:IsStudio() then
					print("you fell: " .. v153 .. " studs");
				end;
				if minHeightToDamage / 5 < v153 then
					if Character then
						if Character:FindFirstChild("Head") then
							soundmod.rplaysound(Character.Head["Land" .. math.random(1, 4)]);
						end;
					end;
				end;
				if 20 < v153 then
					viewpunch.RollPunch(v153 / 25);
				end;
				if Character then
					if Character:FindFirstChild("HumanoidRootPart") then
						if position ~= -math.huge then
							if endPosition ~= math.huge then
								local v154 = workspace:FindPartOnRayWithWhitelist(Ray.new(Character.HumanoidRootPart.Position, Vector3.new(0, -5, 0)), v147, true, false);
								if v154 then
									if v154.Parent then
										if v154.Parent:FindFirstChild("Humanoid") then
											if 0 < v153 - minHeightToDamage then
												if not preparation.Value then
													l__ReplicatedStorage__6.Events.FallDamage:FireServer(math.clamp(math.clamp(math.floor(6 * (v153 / 5) * (Player.NRPBS.MaxHealth.Value / 100)), Player.NRPBS.MaxHealth.Value * 0.05, Player.NRPBS.MaxHealth.Value * 10), 0, 150), v154, "JUMP");
												end;
											end;
										end;
									end;
								end;
								fdebounce = true;
							end;
						end;
					end;
				end;
			end;
		end;
	end;
end;
function TipMeOff()
	local l__Tips__155 = Player.PlayerGui.Tips;
	l__Tips__155.TipFrame.Type.Text = wkspc.gametype.Value;
	l__Tips__155.TipFrame.Descr.Text = tostring(({
		Standard = "Each elimination or assist will give you a new weapon. Reach the Golden Knife for a final elimination to win!", 
		["Gun Rotation"] = "Weapons switch every 20 seconds! Reach & get an elimination with the Golden Knife to win!", 
		Juggernaut = "Collect eliminations as the Juggernaut! Whoever eliminates the Juggernaut becomes the Juggernaut!", 
		["Clown Infection"] = "Don't get smacked by the clowns or you will join them!", 
		["Concussion Mania"] = "It's only the Concussion Rifle. Get 16 eliminations to win!", 
		["Concussion Mania 2"] = "It's only the Concussion Rifle. Get 16 eliminations to win!", 
		["Kill Confirmed"] = "Pick up stars players drop when they die. The team with the most stars win!", 
		Randomizer = "Different weapons awarded when you spawn. Top score wins!", 
		Arcade = "Weapons can be picked up and everyone has more mobility. Top score wins!", 
		["All Weapons"] = "Every weapon in the game is put into the pool. Top score wins!", 
		["Firework Launcher"] = "It's the Firework Launcher!", 
		Competitive = "Get an elimination with the Golden Gun to win! Each elimination awards a new weapon.", 
		Hackula = "Standard but curses apply every 30 seconds! Reach the Golden Knife for a final elimination to win!", 
		["Projectile Party"] = "Projectile weapons ONLY", 
		["Railgun Royale"] = "It's only the Railgun. Get 15 eliminations to win!", 
		["Monkey Business"] = "Work with your teammates to collect bananas, the team with the most wins!", 
		["Legacy Competitive"] = "Point and click! It's that easy!", 
		Bomb = "Bomb", 
		["Bows Only"] = "Suffer.", 
		["Hard Mode"] = "Only difficult weapons, new golden weapons, getting knifed demotes you to the first level! Have fun!", 
		["Insane Mode"] = "We do a little trolling... Hard Mode but worse!", 
		OddBall = "Hold onto the ball for the longest! Team with most ball time wins!"
	})[wkspc.gametype.Value]);
	if l__Tips__155.TipFrame.Descr.Text == "nil" then
		return;
	end;
	if l__Tips__155.TipFrame.Type.Text == wkspc.gametype.Value then
		if l__Tips__155.TipFrame.Descr.Text ~= "Gametype Description" then
			coroutine.resume(coroutine.create(function()
				local v156, v157, v158 = pairs(l__Tips__155.TipFrame:GetChildren());
				while true do
					local v159, v160 = v156(v157, v158);
					if v159 then

					else
						break;
					end;
					v158 = v159;
					if v160:IsA("TextLabel") then
						v160.TextTransparency = 0;
					end;				
				end;
				l__Tips__155.TipFrame.ImageTransparency = 0;
				l__Tips__155.TipFrame.Frame.BackgroundTransparency = 0;
				local v161 = teamsmod.names[Player.Status.Team.Value];
				local v162 = v161 and v161[1] or "None";
				if v162 ~= "None" then
					l__Tips__155.TipFrame.ImageColor3 = gui.Interface.Vitals.Colors[v162].Value;
				else
					l__Tips__155.TipFrame.ImageColor3 = Color3.fromRGB(42, 42, 42);
				end;
				l__Tips__155.Enabled = true;
				if gui.AbsoluteSize.Y <= 600 then
					l__Tips__155.TipFrame.Descr.TextScaled = true;
					l__Tips__155.TipFrame.Size = UDim2.new(0.3, 0, 0.3, 0);
				end;
				if 700 <= gui.AbsoluteSize.Y then
					l__Tips__155.TipFrame.Size = UDim2.new(0.3, 0, 0.225, 0);
				end;
				wait(8.5);
				local v163, v164, v165 = pairs(l__Tips__155.TipFrame:GetChildren());
				while true do
					local v166, v167 = v163(v164, v165);
					if v166 then

					else
						break;
					end;
					v165 = v166;
					if v167:IsA("TextLabel") then
						l__TweenService__2:Create(v167, TweenInfo.new(1, Enum.EasingStyle.Sine, Enum.EasingDirection.In, 0, false, 0), {
							TextTransparency = 1
						}):Play();
					end;				
				end;
				l__TweenService__2:Create(l__Tips__155.TipFrame, TweenInfo.new(1, Enum.EasingStyle.Sine, Enum.EasingDirection.In, 0, false, 0), {
					ImageTransparency = 1
				}):Play();
				l__TweenService__2:Create(l__Tips__155.TipFrame.Frame, TweenInfo.new(1, Enum.EasingStyle.Sine, Enum.EasingDirection.In, 0, false, 0), {
					BackgroundTransparency = 1
				}):Play();
				wait(1);
				if workspace:FindFirstChild("Map") then
					if l__Workspace__11.Map:FindFirstChild("Creator") then
						l__Tips__155.CMFrame.Descr.Text = "Creator: " .. l__Workspace__11.Map.Creator.Value;
						local v168, v169, v170 = pairs(l__Tips__155.CMFrame:GetChildren());
						while true do
							local v171, v172 = v168(v169, v170);
							if v171 then

							else
								break;
							end;
							v170 = v171;
							if v172:IsA("TextLabel") then
								l__TweenService__2:Create(v172, TweenInfo.new(1, Enum.EasingStyle.Sine, Enum.EasingDirection.In, 0, false, 0), {
									TextTransparency = 0
								}):Play();
							end;						
						end;
						l__TweenService__2:Create(l__Tips__155.CMFrame, TweenInfo.new(1, Enum.EasingStyle.Sine, Enum.EasingDirection.In, 0, false, 0), {
							ImageTransparency = 0
						}):Play();
						l__TweenService__2:Create(l__Tips__155.CMFrame.Frame, TweenInfo.new(1, Enum.EasingStyle.Sine, Enum.EasingDirection.In, 0, false, 0), {
							BackgroundTransparency = 0
						}):Play();
						wait(6);
						local v173, v174, v175 = pairs(l__Tips__155.CMFrame:GetChildren());
						while true do
							local v176, v177 = v173(v174, v175);
							if v176 then

							else
								break;
							end;
							v175 = v176;
							if v177:IsA("TextLabel") then
								l__TweenService__2:Create(v177, TweenInfo.new(1, Enum.EasingStyle.Sine, Enum.EasingDirection.In, 0, false, 0), {
									TextTransparency = 1
								}):Play();
							end;						
						end;
						l__TweenService__2:Create(l__Tips__155.CMFrame, TweenInfo.new(1, Enum.EasingStyle.Sine, Enum.EasingDirection.In, 0, false, 0), {
							ImageTransparency = 1
						}):Play();
						l__TweenService__2:Create(l__Tips__155.CMFrame.Frame, TweenInfo.new(1, Enum.EasingStyle.Sine, Enum.EasingDirection.In, 0, false, 0), {
							BackgroundTransparency = 1
						}):Play();
					end;
				end;
				wait(1);
				l__Tips__155.Enabled = false;
			end));
		end;
	end;
end;
function WeaponTip(p41, p42)
	local l__Tips__178 = Player.PlayerGui.Tips;
	l__Tips__178.TipFrame.Type.Text = p41;
	l__Tips__178.TipFrame.Descr.Text = p42;
	if l__Tips__178.TipFrame.Descr.Text == "nil" then
		return;
	end;
	coroutine.resume(coroutine.create(function()
		local v179, v180, v181 = pairs(l__Tips__178.TipFrame:GetChildren());
		while true do
			local v182, v183 = v179(v180, v181);
			if v182 then

			else
				break;
			end;
			v181 = v182;
			if v183:IsA("TextLabel") then
				v183.TextTransparency = 0;
			end;		
		end;
		l__Tips__178.TipFrame.ImageTransparency = 0;
		l__Tips__178.TipFrame.Frame.BackgroundTransparency = 0;
		local v184 = teamsmod.names[Player.Status.Team.Value];
		local v185 = v184 and v184[1] or "None";
		if v185 ~= "None" then
			l__Tips__178.TipFrame.ImageColor3 = gui.Interface.Vitals.Colors[v185].Value;
		else
			l__Tips__178.TipFrame.ImageColor3 = Color3.fromRGB(42, 42, 42);
		end;
		l__Tips__178.Enabled = true;
		if gui.AbsoluteSize.Y <= 600 then
			l__Tips__178.TipFrame.Descr.TextScaled = true;
			l__Tips__178.TipFrame.Size = UDim2.new(0.3, 0, 0.3, 0);
		end;
		if 700 <= gui.AbsoluteSize.Y then
			l__Tips__178.TipFrame.Size = UDim2.new(0.3, 0, 0.225, 0);
		end;
		wait(5.5);
		local v186, v187, v188 = pairs(l__Tips__178.TipFrame:GetChildren());
		while true do
			local v189, v190 = v186(v187, v188);
			if v189 then

			else
				break;
			end;
			v188 = v189;
			if v190:IsA("TextLabel") then
				l__TweenService__2:Create(v190, TweenInfo.new(1, Enum.EasingStyle.Sine, Enum.EasingDirection.In, 0, false, 0), {
					TextTransparency = 1
				}):Play();
			end;		
		end;
		l__TweenService__2:Create(l__Tips__178.TipFrame, TweenInfo.new(1, Enum.EasingStyle.Sine, Enum.EasingDirection.In, 0, false, 0), {
			ImageTransparency = 1
		}):Play();
		l__TweenService__2:Create(l__Tips__178.TipFrame.Frame, TweenInfo.new(1, Enum.EasingStyle.Sine, Enum.EasingDirection.In, 0, false, 0), {
			BackgroundTransparency = 1
		}):Play();
		wait(1);
		l__Tips__178.Enabled = false;
	end));
end;
game.ReplicatedStorage.Events.Tip.OnClientEvent:connect(function(...)
	WeaponTip(...);
end);
game.ReplicatedStorage.Events.EndTaunt.OnClientEvent:connect(function()
	if taunting.Value then
		if partnert.Value == true then
			ftauntend.Value = true;
		end;
		if not selectedtaunt.Value then
			jumping.Value = true;
			return;
		end;
	else
		return;
	end;
	tauntend.Value = true;
	ftauntend.Value = true;
end);
function updtprimary()
	if primary.Value ~= "" then
		ammocount.Value = wep.getammo(l__ReplicatedStorage__6.Weapons[primary.Value]);
		primarystored.Value = l__ReplicatedStorage__6.Weapons[primary.Value].StoredAmmo.Value;
	end;
	if l__ReplicatedStorage__6.Arcade.Value == true then
		primarystored.Value = 0;
		secondarystored.Value = 0;
	end;
end;
local u16 = "Golden Knife";
function givetools(p43)
	local v191 = false;
	superpower.Value = false;
	l__Variables__15.currentSpell.Value = 1;
	showme.Value = 4;
	alt = 1;
	if deployed == false then
		deployed = true;
		if wkspc.Status.IsVoting.Value == false then
			TipMeOff();
			spawn(function()
				if announcer:FindFirstChild(gen.getnation()) then
					if announcer[gen.getnation()]:FindFirstChild("Deploy") then
						if game.ReplicatedStorage.IsELO.Value == false then
							playannouncer(announcer[gen.getnation()].Deploy);
						end;
					end;
				end;
			end);
		end;
	end;
	if ads.Value == true then
		ads.Value = false;
		wep.updateads();
	end;
	if taunting.Value then
		if partnert.Value == true then
			ftauntend.Value = true;
		end;
		if selectedtaunt.Value then
			tauntend.Value = true;
			ftauntend.Value = true;
		else
			jumping.Value = true;
		end;
	end;
	primarymode.Value = "1";
	primarygrenades.Value = 1;
	storedgrenades.Value = 1;
	melee.Value = "Knife";
	if wkspc.gametype.Value == "Bombfest" then
		melee.Value = "";
	end;
	secondary.Value = "";
	if isadmin == true then
		if player.Name ~= "Castlers" then
			if player.Name == "Zeenyoo" then
				secondary.Value = "Pulse Musket";
			end;
		else
			secondary.Value = "Pulse Musket";
		end;
		if player.UserId ~= 23915919 then
			if player.userId == 52187831 then
				secondary.Value = "FMG-9";
			end;
		else
			secondary.Value = "FMG-9";
		end;
	end;
	if wkspc.gamemode.Value == "BrickBattle" then
		secondary.Value = "Trowel";
		melee.Value = "Sword";
	end;
	if player:FindFirstChild("HasCannonball") then
		melee.Value = "Cannonball";
	end;
	if isadmin == true then
		if not l__RunService__14:IsStudio() then
			if player.Name == "mightybaseplate" then
				secondary.Value = "Trowel";
			end;
		end;
	end;
	local v192 = "";
	local v193 = modevariables.getLevels(Player.Status.Team.Value);
	if v193:FindFirstChild(tostring(Player.Status.Level.Value)) then
		v192 = v193[tostring(Player.Status.Level.Value)].Value;
	elseif #v193:GetChildren() < Player.Status.Level.Value then
		if 0 < #v193:GetChildren() then
			v192 = "Golden Knife";
		end;
	end;
	if player:FindFirstChild("HasCannonball") then
		v192 = "Cannonball";
	end;
	if wkspc.gametype.Value ~= "Shooting Range" then
		if wkspc.gametype.Value == "Shooting Challenge" then
			v192 = u16;
		end;
	else
		v192 = u16;
	end;
	local v194 = v193:FindFirstChild("Next") or v193:FindFirstChild(tostring(Player.Status.Level.Value + 1));
	local v195 = false;
	if v194 ~= nil then
		v195 = not l__ReplicatedStorage__6.wkspc.HideNextWeapon.Value;
	end;
	gui.NextWeapon.Visible = v195;
	if gui.NextWeapon.Visible then
		local l__NextWeapon__196 = gui.NextWeapon;
		l__NextWeapon__196.Next.ToolName.Text = v194.Value;
		local v197 = l__ReplicatedStorage__6.KillIcons:FindFirstChild(v194.Value);
		l__NextWeapon__196.Next.Weapon.Image = v197 and v197.Value or "";
	end;
	if primary.Value == v192 then
		if wkspc.gametype.Value == "Concussion Mania 2" then
			v191 = true;
		end;
	end;
	primary.Value = "";
	if wkspc.BR.Value == false then
		if l__ReplicatedStorage__6.Weapons:FindFirstChild(v192) then
			if not l__ReplicatedStorage__6.Weapons:FindFirstChild(v192):FindFirstChild("Melee") then
				if v192 == "Golden Knife" then
					melee.Value = v192;
				else
					primary.Value = v192;
				end;
			else
				melee.Value = v192;
			end;
		end;
	end;
	if wkspc.gametype.Value == "Clown Infection" then
		if player.Status.Team.Value == "TRC" then
			primary.Value = "";
			melee.Value = "Squeaky Hammer";
			v192 = "Squeaky Hammer";
		end;
	end;
	if l__ReplicatedStorage__6.Randomizer.Value == true then
		local v198 = l__ReplicatedStorage__6.Random:GetChildren();
		local v199 = l__ReplicatedStorage__6.PogRandom:GetChildren();
		local l__Value__200 = l__Workspace__11.Status.NotRandom.Value;
		local v201 = {};
		local v202 = {};
		local v203 = #v198;
		local v204 = 1 - 1;
		while true do
			if l__Value__200 == false then
				table.insert(v201, v198[v204]);
			end;
			if 0 <= 1 then
				if v204 < v203 then

				else
					break;
				end;
			elseif v203 < v204 then

			else
				break;
			end;
			v204 = v204 + 1;		
		end;
		if l__Value__200 == true then
			if isadmin == true then
				if player.Name ~= "Castlers" then
					if player.Name == "Zeenyoo" then
						local v205 = #v199;
						local v206 = 1 - 1;
						while true do
							table.insert(v201, v199[v206]);
							if 0 <= 1 then
								if v206 < v205 then

								else
									break;
								end;
							elseif v205 < v206 then

							else
								break;
							end;
							v206 = v206 + 1;						
						end;
					end;
				else
					v205 = #v199;
					v206 = 1 - 1;
					while true do
						table.insert(v201, v199[v206]);
						if 0 <= 1 then
							if v206 < v205 then

							else
								break;
							end;
						elseif v205 < v206 then

						else
							break;
						end;
						v206 = v206 + 1;					
					end;
				end;
			end;
		end;
		if gunrand == 0 then
			gunrand = math.random(1, 999999);
		end;
		primary.Value = v201[Random.new(gunrand):NextInteger(1, #v201)].Name;
	elseif l__ReplicatedStorage__6.Arcade.Value == true then
		primary.Value = "G-19X";
		equipped.Value = "primary";
	elseif wkspc.gametype.Value == "Co-op" then
		primary.Value = player.CoopStatus.Primary.Value;
		secondary.Value = player.CoopStatus.Equipment.Value;
		equipped.Value = "primary";
	end;
	if secondary.Value ~= "" then
		ammocount2.Value = l__ReplicatedStorage__6.Weapons[secondary.Value].Ammo.Value;
		secondarystored.Value = l__ReplicatedStorage__6.Weapons[secondary.Value].StoredAmmo.Value;
	end;
	if player:FindFirstChild("HasCannonball") then
		equipped.Value = "melee";
	end;
	if v191 == false then
		updtprimary();
	end;
	amby:Fire("makeInvisible");
	amby:Fire("updateInventory");
	if primary.Value == "" then
		if equipped.Value == "primary" then
			equipped.Value = "melee";
		end;
	end;
	if wkspc.BR.Value ~= true then
		if wkspc.CurrentCurse.Value ~= "Enraged" then
			if not player:FindFirstChild("IsBernard") then
				if player:FindFirstChild("HasCannonball") then
					equipped.Value = "melee";
				end;
			else
				equipped.Value = "melee";
			end;
		else
			equipped.Value = "melee";
		end;
	else
		equipped.Value = "melee";
	end;
	selected.Value = 1;
	prevTool.Value = 3;
	if equipped.Value ~= "primary" then
		if wkspc.gametype.Value == "Bombfest" then
			if player.Status.Level.Value < 33 then
				gun.Value = l__ReplicatedStorage__6.Weapons[primary.Value];
			elseif equipped.Value == "secondary" then
				gun.Value = l__ReplicatedStorage__6.Weapons[secondary.Value];
			elseif equipped.Value ~= "melee" then
				if wkspc.gametype.Value == "Bombfest" then
					if player.Status.Level.Value == 33 then
						selected.Value = 3;
						prevTool.Value = 1;
						gun.Value = l__ReplicatedStorage__6.Weapons[melee.Value];
					end;
				end;
			else
				selected.Value = 3;
				prevTool.Value = 1;
				gun.Value = l__ReplicatedStorage__6.Weapons[melee.Value];
			end;
		elseif equipped.Value == "secondary" then
			gun.Value = l__ReplicatedStorage__6.Weapons[secondary.Value];
		elseif equipped.Value ~= "melee" then
			if wkspc.gametype.Value == "Bombfest" then
				if player.Status.Level.Value == 33 then
					selected.Value = 3;
					prevTool.Value = 1;
					gun.Value = l__ReplicatedStorage__6.Weapons[melee.Value];
				end;
			end;
		else
			selected.Value = 3;
			prevTool.Value = 1;
			gun.Value = l__ReplicatedStorage__6.Weapons[melee.Value];
		end;
	else
		gun.Value = l__ReplicatedStorage__6.Weapons[primary.Value];
	end;
	currentTool.Value = selected.Value;
	if player:FindFirstChild("FDisabled") then
		player.FDisabled:Destroy();
	end;
	overheat.Value = 0;
	ohtick.Value = nil;
	coroutine.resume(coroutine.create(function()
		if wkspc.BR.Value ~= true then
			if equipped.Value ~= "primary" then
				if equipped.Value == "melee" then
					if not player:FindFirstChild("IsBernard") then
						if not player:FindFirstChild("HasCannonball") then
							if wkspc.CurrentCurse.Value ~= "Enraged" then
								if v192 ~= "Golden Knife" then
									if v192 ~= "" then
										if l__ReplicatedStorage__6:FindFirstChild("Weapons") then
											if l__ReplicatedStorage__6.Weapons:FindFirstChild(v192) then
												if not l__ReplicatedStorage__6.Weapons[v192]:FindFirstChild("Melee") then
													if player:FindFirstChild("IsJugg") then
														if v191 == false then
															wep.usethatgun();
														end;
													end;
												elseif v191 == false then
													wep.usethatgun();
												end;
											elseif player:FindFirstChild("IsJugg") then
												if v191 == false then
													wep.usethatgun();
												end;
											end;
										elseif player:FindFirstChild("IsJugg") then
											if v191 == false then
												wep.usethatgun();
											end;
										end;
									elseif player:FindFirstChild("IsJugg") then
										if v191 == false then
											wep.usethatgun();
										end;
									end;
								elseif v191 == false then
									wep.usethatgun();
								end;
							elseif v191 == false then
								wep.usethatgun();
							end;
						elseif v191 == false then
							wep.usethatgun();
						end;
					elseif v191 == false then
						wep.usethatgun();
					end;
				elseif player:FindFirstChild("IsJugg") then
					if v191 == false then
						wep.usethatgun();
					end;
				end;
			elseif v191 == false then
				wep.usethatgun();
			end;
		elseif v191 == false then
			wep.usethatgun();
		end;
	end));
end;
function LevelChanged(p44)
	local v207 = false;
	if l__ReplicatedStorage__6.wkspc.gametype.Value ~= "Gun Rotation" then
		v207 = true;
	elseif p44 == "requip" then
		soundmod.playsound(sP.Parent.Sounds.Promote);
		v207 = true;
	elseif p44 == "gold" then
		v207 = true;
	end;
	if v207 then
		if wkspc.gametype.Value ~= "Co-op" then
			if l__ReplicatedStorage__6.Arcade.Value == false then
				if l__ReplicatedStorage__6.Randomizer.Value == false then
					if Player.Status.Alive.Value == true then
						if Player.Status.Team.Value ~= "Spectator" then
							if gui.Spectate.Visible == false then
								if Humanoid then
									if 0 < Player.NRPBS.Health.Value then
										givetools(p44);
									end;
								end;
							end;
						end;
					end;
				end;
			end;
		end;
		olevel = Player.Status.Level.Value;
	end;
end;
function rerollGun()
	if l__ReplicatedStorage__6.Randomizer.Value then
		if l__Variables__15.gunreroll.Value then
			l__Variables__15.gunreroll.Value = false;
			gunrand = math.random(1, 999999);
			givetools();
		end;
	end;
end;
l__ReplicatedStorage__6.Donkey.OnClientEvent:connect(function(p45)
	for v208, v209 in pairs(game.Players:GetPlayers()) do
		if v209.Character and v209.Character:FindFirstChild("HumanoidRootPart") and v209.Character.HumanoidRootPart:FindFirstChild("Donkey") then
			v209.Character.HumanoidRootPart.Donkey.Enabled = false;
		end;
	end;
	if p45 and p45.Character:FindFirstChild("HumanoidRootPart") and p45.Character.HumanoidRootPart:FindFirstChild("Donkey") then
		p45.Character.HumanoidRootPart.Donkey.Enabled = true;
	end;
end);
l__ReplicatedStorage__6.Events.RandomizeRandom.OnClientEvent:connect(function(p46, p47)
	if not p46 then
		gunrand = math.random(1, 999999);
	end;
	if p47 then
		givetools();
	end;
	l__Variables__15.gunreroll.Value = true;
end);
Player.Status.Level.Changed:connect(function()
	if wkspc.BF.Value == true or wkspc.gametype.Value == "Co-op" then
		return;
	end;
	if Player.Status.Level.Value == 30 and wkspc.Infinity.Value == false then
		local v210 = gui.GGnext:Clone();
		v210.Name = "GGnotif";
		v210.Size = UDim2.new(0, 0, 0, 0);
		v210.Parent = gui;
		v210.Visible = true;
		v210:TweenSize(v210.Size, Enum.EasingDirection.In, Enum.EasingStyle.Sine, 0.5, true);
		coroutine.resume(coroutine.create(function()
			wait(1.25);
			l__TweenService__2:Create(v210, TweenInfo.new(0.25, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
				TextTransparency = 1
			}):Play();
			l__TweenService__2:Create(v210, TweenInfo.new(0.25, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
				TextStrokeTransparency = 1
			}):Play();
			wait(0.3);
			v210:Destroy();
		end));
	end;
	if Player.Status.Level.Value >= 30 then
		LevelChanged("gold");
		return;
	end;
	LevelChanged();
end);
function disablemapvote()
	if wkspc.Status.IsVoting.Value == true then
		script.Parent.Parent.MapVoting.MapVote.Visible = true;
	end;
end;
local u17 = 100;
function setcharacter()
	if l__Workspace__11:FindFirstChild("Map") then
		if l__Workspace__11.Map:FindFirstChild("PickupPoints") then
			amby:Fire("s2p", { l__Workspace__11.Map.PickupPoints:GetChildren() });
		end;
	end;
	if player:FindFirstChild("IsAdmin") then
		isadmin = true;
	end;
	if player:FindFirstChild("IsChad") then
		ischad = true;
	end;
	gui.TauntMenu.Visible = false;
	died.Value = false;
	if taunting.Value == true then
		if Animations.tidle then
			if Animations.tidle.IsPlaying == true then
				tauntend.Value = true;
			end;
		end;
	end;
	taunting.Value = false;
	primarymode.Value = "1";
	ads.Value = false;
	spawned = false;
	selected.Value = 1;
	prevTool.Value = 3;
	currentTool.Value = 1;
	gui.Spectate.Visible = true;
	sP.Black.Visible = true;
	gui.Spectate.Visible = false;
	sP.Black.BackgroundTransparency = 0;
	sP.Black.BackgroundColor3 = Color3.new(0.5, 0.5, 0.5);
	l__TweenService__2:Create(sP.Black, tweenInfo, {
		BackgroundColor3 = Color3.new(0.8, 0.8, 0.8)
	}):Play();
	sP.KillCamNew.Nemesis.Visible = false;
	sP.KillCamNew.NemesisBar.Visible = false;
	sP.KillCamNew.Visible = false;
	specmode.Value = "mapoverview1";
	currentnum.Value = 1;
	if Player:FindFirstChild("OpenClass") then
		gui.Enabled = false;
		menew.Enabled = true;
		disablemapvote();
		ToggleTeamSelection(true);
	end;
	if wkspc.gametype.Value == "Bombfest" then
		ToggleTeamSelection(false);
	end;
	amby:Fire("makeInvisible");
	if Camera:FindFirstChild("Arms") then
		Camera.Arms:Destroy();
	end;
	if Camera:FindFirstChild("Doors") then
		Camera.Doors:Destroy();
	end;
	equipallowed.Value = false;
	prevTool.Value = 3;
	currentTool.Value = 1;
	equipped.Value = "none";
	melee.Value = "";
	secondary.Value = "";
	primary.Value = "";
	ammocount.Value = 0;
	ammocount2.Value = 0;
	primarystored.Value = 0;
	secondarystored.Value = 0;
	gun.Value = nil;
	amby:Fire("updateInventory");
	if ads.Value == true then
		ads.Value = false;
		wep.updateads();
	end;
	amby:Fire("setcrouched", { false });
	inventorydebounce.Value = false;
	selected.Value = nil;
	u17 = 100;
	u13 = 100;
	while true do
		l__RunService__14.Stepped:wait();
		if not Player then

		else
			break;
		end;	
	end;
	if Player.Status.Alive.Value == false then
		sP.Black.Visible = false;
		gui.Spectate.Visible = true;
		Camera.CameraSubject = nil;
		Camera.CameraType = "Scriptable";
		equipped.Value = "none";
		ammobar.Visible = false;
		hpbar.Visible = false;
		gun.Value = nil;
		amby:Fire("updateInventory");
		equipallowed.Value = true;
		return;
	end;
	died.Value = false;
	Player = Player;
	local v211 = tick();
	while true do
		wait();
		if Player then
			if Player.Character then
				if not Player.Character:FindFirstChild("IsAPlayer") then

				else
					break;
				end;
			end;
		end;	
	end;
	l__ReplicatedStorage__6.Events.SpawnMe:FireServer();
	while true do
		wait();
		if Character then
			if Character.PrimaryPart then
				if workspace:FindFirstChild("Map") then
					if l__Workspace__11.Map:FindFirstChild("Spawns") then
						if 0 < #l__Workspace__11.Map:FindFirstChild("Spawns"):GetChildren() then
							if not Character:FindFirstChild("Spawned") then

							else
								break;
							end;
						end;
					end;
				end;
			end;
		end;	
	end;
	Character.PrimaryPart.Velocity = Vector3.new();
	amby:Fire("currentvel0");
	local v212, v213, v214 = pairs(player.Character:GetDescendants());
	while true do
		local v215, v216 = v212(v213, v214);
		if v215 then

		else
			break;
		end;
		if not v216:IsA("ParticleEmitter") then
			if not v216:IsA("Beam") then
				if v216:IsA("Trail") then
					if v216.Name ~= "OriginalPosition" then
						if not v216.Parent.Parent:FindFirstChild("Orbit") then
							if v216.Parent.Name ~= "Unusual" then
								if v216.Name ~= "Particle" then
									if v216.Parent.Name ~= "UnusualAnimation" then
										if v216.Parent.Name ~= "Handle" then
											if v216.Parent.Name ~= "HumanoidRootPart" then
												if v216.Name ~= "Fire" then
													if v216.Parent.Name == "Eye" then
														if not v216:IsA("Fire") then
															if v216:IsA("BillboardGui") then
																if v216.Name == "__UNUSUALHIDE" then
																	v216.Enabled = false;
																	if v216:IsA("ParticleEmitter") then
																		v216:Clear();
																	end;
																end;
															end;
														else
															v216.Enabled = false;
															if v216:IsA("ParticleEmitter") then
																v216:Clear();
															end;
														end;
													elseif v216:IsA("BillboardGui") then
														if v216.Name == "__UNUSUALHIDE" then
															v216.Enabled = false;
															if v216:IsA("ParticleEmitter") then
																v216:Clear();
															end;
														end;
													end;
												else
													v216.Enabled = false;
													if v216:IsA("ParticleEmitter") then
														v216:Clear();
													end;
												end;
											else
												v216.Enabled = false;
												if v216:IsA("ParticleEmitter") then
													v216:Clear();
												end;
											end;
										else
											v216.Enabled = false;
											if v216:IsA("ParticleEmitter") then
												v216:Clear();
											end;
										end;
									else
										v216.Enabled = false;
										if v216:IsA("ParticleEmitter") then
											v216:Clear();
										end;
									end;
								else
									v216.Enabled = false;
									if v216:IsA("ParticleEmitter") then
										v216:Clear();
									end;
								end;
							else
								v216.Enabled = false;
								if v216:IsA("ParticleEmitter") then
									v216:Clear();
								end;
							end;
						else
							v216.Enabled = false;
							if v216:IsA("ParticleEmitter") then
								v216:Clear();
							end;
						end;
					elseif v216.Parent.Name == "Eye" then
						if not v216:IsA("Fire") then
							if v216:IsA("BillboardGui") then
								if v216.Name == "__UNUSUALHIDE" then
									v216.Enabled = false;
									if v216:IsA("ParticleEmitter") then
										v216:Clear();
									end;
								end;
							end;
						else
							v216.Enabled = false;
							if v216:IsA("ParticleEmitter") then
								v216:Clear();
							end;
						end;
					elseif v216:IsA("BillboardGui") then
						if v216.Name == "__UNUSUALHIDE" then
							v216.Enabled = false;
							if v216:IsA("ParticleEmitter") then
								v216:Clear();
							end;
						end;
					end;
				elseif v216.Parent.Name == "Eye" then
					if not v216:IsA("Fire") then
						if v216:IsA("BillboardGui") then
							if v216.Name == "__UNUSUALHIDE" then
								v216.Enabled = false;
								if v216:IsA("ParticleEmitter") then
									v216:Clear();
								end;
							end;
						end;
					else
						v216.Enabled = false;
						if v216:IsA("ParticleEmitter") then
							v216:Clear();
						end;
					end;
				elseif v216:IsA("BillboardGui") then
					if v216.Name == "__UNUSUALHIDE" then
						v216.Enabled = false;
						if v216:IsA("ParticleEmitter") then
							v216:Clear();
						end;
					end;
				end;
			elseif v216.Name ~= "OriginalPosition" then
				if not v216.Parent.Parent:FindFirstChild("Orbit") then
					if v216.Parent.Name ~= "Unusual" then
						if v216.Name ~= "Particle" then
							if v216.Parent.Name ~= "UnusualAnimation" then
								if v216.Parent.Name ~= "Handle" then
									if v216.Parent.Name ~= "HumanoidRootPart" then
										if v216.Name ~= "Fire" then
											if v216.Parent.Name == "Eye" then
												if not v216:IsA("Fire") then
													if v216:IsA("BillboardGui") then
														if v216.Name == "__UNUSUALHIDE" then
															v216.Enabled = false;
															if v216:IsA("ParticleEmitter") then
																v216:Clear();
															end;
														end;
													end;
												else
													v216.Enabled = false;
													if v216:IsA("ParticleEmitter") then
														v216:Clear();
													end;
												end;
											elseif v216:IsA("BillboardGui") then
												if v216.Name == "__UNUSUALHIDE" then
													v216.Enabled = false;
													if v216:IsA("ParticleEmitter") then
														v216:Clear();
													end;
												end;
											end;
										else
											v216.Enabled = false;
											if v216:IsA("ParticleEmitter") then
												v216:Clear();
											end;
										end;
									else
										v216.Enabled = false;
										if v216:IsA("ParticleEmitter") then
											v216:Clear();
										end;
									end;
								else
									v216.Enabled = false;
									if v216:IsA("ParticleEmitter") then
										v216:Clear();
									end;
								end;
							else
								v216.Enabled = false;
								if v216:IsA("ParticleEmitter") then
									v216:Clear();
								end;
							end;
						else
							v216.Enabled = false;
							if v216:IsA("ParticleEmitter") then
								v216:Clear();
							end;
						end;
					else
						v216.Enabled = false;
						if v216:IsA("ParticleEmitter") then
							v216:Clear();
						end;
					end;
				else
					v216.Enabled = false;
					if v216:IsA("ParticleEmitter") then
						v216:Clear();
					end;
				end;
			elseif v216.Parent.Name == "Eye" then
				if not v216:IsA("Fire") then
					if v216:IsA("BillboardGui") then
						if v216.Name == "__UNUSUALHIDE" then
							v216.Enabled = false;
							if v216:IsA("ParticleEmitter") then
								v216:Clear();
							end;
						end;
					end;
				else
					v216.Enabled = false;
					if v216:IsA("ParticleEmitter") then
						v216:Clear();
					end;
				end;
			elseif v216:IsA("BillboardGui") then
				if v216.Name == "__UNUSUALHIDE" then
					v216.Enabled = false;
					if v216:IsA("ParticleEmitter") then
						v216:Clear();
					end;
				end;
			end;
		elseif v216.Name ~= "OriginalPosition" then
			if not v216.Parent.Parent:FindFirstChild("Orbit") then
				if v216.Parent.Name ~= "Unusual" then
					if v216.Name ~= "Particle" then
						if v216.Parent.Name ~= "UnusualAnimation" then
							if v216.Parent.Name ~= "Handle" then
								if v216.Parent.Name ~= "HumanoidRootPart" then
									if v216.Name ~= "Fire" then
										if v216.Parent.Name == "Eye" then
											if not v216:IsA("Fire") then
												if v216:IsA("BillboardGui") then
													if v216.Name == "__UNUSUALHIDE" then
														v216.Enabled = false;
														if v216:IsA("ParticleEmitter") then
															v216:Clear();
														end;
													end;
												end;
											else
												v216.Enabled = false;
												if v216:IsA("ParticleEmitter") then
													v216:Clear();
												end;
											end;
										elseif v216:IsA("BillboardGui") then
											if v216.Name == "__UNUSUALHIDE" then
												v216.Enabled = false;
												if v216:IsA("ParticleEmitter") then
													v216:Clear();
												end;
											end;
										end;
									else
										v216.Enabled = false;
										if v216:IsA("ParticleEmitter") then
											v216:Clear();
										end;
									end;
								else
									v216.Enabled = false;
									if v216:IsA("ParticleEmitter") then
										v216:Clear();
									end;
								end;
							else
								v216.Enabled = false;
								if v216:IsA("ParticleEmitter") then
									v216:Clear();
								end;
							end;
						else
							v216.Enabled = false;
							if v216:IsA("ParticleEmitter") then
								v216:Clear();
							end;
						end;
					else
						v216.Enabled = false;
						if v216:IsA("ParticleEmitter") then
							v216:Clear();
						end;
					end;
				else
					v216.Enabled = false;
					if v216:IsA("ParticleEmitter") then
						v216:Clear();
					end;
				end;
			else
				v216.Enabled = false;
				if v216:IsA("ParticleEmitter") then
					v216:Clear();
				end;
			end;
		elseif v216.Parent.Name == "Eye" then
			if not v216:IsA("Fire") then
				if v216:IsA("BillboardGui") then
					if v216.Name == "__UNUSUALHIDE" then
						v216.Enabled = false;
						if v216:IsA("ParticleEmitter") then
							v216:Clear();
						end;
					end;
				end;
			else
				v216.Enabled = false;
				if v216:IsA("ParticleEmitter") then
					v216:Clear();
				end;
			end;
		elseif v216:IsA("BillboardGui") then
			if v216.Name == "__UNUSUALHIDE" then
				v216.Enabled = false;
				if v216:IsA("ParticleEmitter") then
					v216:Clear();
				end;
			end;
		end;	
	end;
	spawned = true;
	changeuicolor(Player.Status.Team.Value);
	u17 = Player.NRPBS.MaxHealth.Value;
	active.Value = false;
	died.Value = false;
	Camera.CameraSubject = Humanoid;
	Camera.CameraType = "Custom";
	Humanoid:SetStateEnabled(Enum.HumanoidStateType.FallingDown, false);
	Humanoid:SetStateEnabled(Enum.HumanoidStateType.Ragdoll, false);
	Humanoid:SetStateEnabled(Enum.HumanoidStateType.Physics, false);
	Humanoid:SetStateEnabled(Enum.HumanoidStateType.PlatformStanding, false);
	coroutine.resume(coroutine.create(function()
		if workspace:FindFirstChild("Map") then
			if l__Workspace__11.Map:FindFirstChild("Ignore") then
				if l__Workspace__11.Map.Ignore:FindFirstChild("SpawnClips") then
					local v217, v218, v219 = pairs(l__Workspace__11.Map.Ignore.SpawnClips:GetDescendants());
					while true do
						local v220, v221 = v217(v218, v219);
						if v220 then

						else
							break;
						end;
						v219 = v220;
						if v221:IsA("BasePart") then
							v221.CanCollide = true;
						end;					
					end;
					wait(3);
					local v222, v223, v224 = pairs(l__Workspace__11.Map.Ignore.SpawnClips:GetDescendants());
					while true do
						local v225, v226 = v222(v223, v224);
						if v225 then

						else
							break;
						end;
						v224 = v225;
						if v226:IsA("BasePart") then
							v226.CanCollide = false;
						end;					
					end;
				end;
			end;
		end;
	end));
	if Humanoid then
		changehpgui();
	end;
	sP:WaitForChild("Inventory").Visible = false;
	equipallowed.Value = true;
	selected.Value = 1;
	prevTool.Value = 3;
	equipped.Value = "primary";
	givetools();
	l__TweenService__2:Create(sP.Black, tweenInfo, {
		BackgroundTransparency = 1
	}):Play();
	soundmod.playsound(sP.Sounds.Spawn);
	l__Variables__15.randspawn.Value = math.random(1, 999999);
end;
mouse.Button2Down:connect(function()
	Held2.Value = true;
	wep.hcaltfire();
end);
mouse.Button2Up:connect(function()
	Held2.Value = false;
end);
mouse.KeyDown:connect(function(p48)
	if p48:lower() == "v" then
		Held2.Value = true;
		wep.hcaltfire();
	end;
end);
mouse.KeyUp:connect(function(p49)
	if p49:lower() == "v" then
		Held2.Value = false;
	end;
end);
mouse.KeyDown:connect(function(p50)
	if p50:upper() == "R" and gun.Value ~= nil and gun.Value:FindFirstChild("ReloadUpTo") == nil then
		if Animations.inspectani and Animations.inspectani.IsPlaying == true then
			Animations.inspectani:Stop();
		end;
		wep.reloadwep();
		return;
	end;
	if p50:upper() == "F" and reloading.Value == false and Animations.inspectani and Animations.inspectani.IsPlaying == false then
		Animations.inspectani:Play();
	end;
end);
Camera.FieldOfView = l__Variables__15.defaultfov.Value;
function switchspecmode()
	if menew.Enabled == true then
		return;
	end;
	if specmode.Value == "mapoverview1" then
		specmode.Value = "player";
		return;
	end;
	if specmode.Value == "player" then

	else
		if specmode.Value == "free" then
			specmode.Value = "mapoverview1";
		end;
		return;
	end;
	if Player.Status.Team.Value ~= "Spectator" then
		if wkspc.BF.Value == true then

		else
			specmode.Value = "mapoverview1";
			return;
		end;
	end;
	specmode.Value = "free";
end;
l__UserInputService__9.InputBegan:Connect(function(p51)
	if p51.KeyCode == Enum.KeyCode.ButtonR2 and game.Players.LocalPlayer.PlayerGui:FindFirstChild("TouchGui") then
		Held.Value = true;
	elseif gun.Value ~= nil and (p51.KeyCode == Enum.KeyCode.E or p51.KeyCode == Enum.KeyCode.DPadDown) then
		rerollGun();
	end;
	if p51.KeyCode == Enum.KeyCode.DPadUp and taunting.Value == false and reloading.Value == false and Animations.inspectani and Animations.inspectani.IsPlaying == false then
		Animations.inspectani:Play();
	end;
end);
if istouch.Value then
	game:GetService("ContextActionService"):BindAction("rerollbind", function(p52, p53)
		if gun.Value ~= nil and p53 == Enum.UserInputState.Begin then
			rerollGun();
		end;
	end, true, Enum.KeyCode.World95);
	coroutine.resume(coroutine.create(function()
		local v227 = game:GetService("ContextActionService"):GetButton("rerollbind");
		if v227 then
			local v228 = false;
			if wkspc.gametype.Value == "Randomizer" then
				v228 = false;
				if gun.Value ~= nil then
					v228 = Player.NRPBS.Health.Value > 0;
				end;
			end;
			v227.Visible = v228;
			v227.Position = UDim2.new(0, -150, 0, 0);
			v227.ActionTitle.Text = "Reroll";
		end;
	end));
end;
l__UserInputService__9.InputEnded:Connect(function(p54)
	if sP.Main.GlobalChat.ActiveOne.Value == true or sP.Main.TeamChat.ActiveOne.Value == true then
		return;
	end;
	if p54.KeyCode == Enum.KeyCode.Tab then
		sP:WaitForChild("Scorecard").Visible = false;
	end;
	if p54.KeyCode == Enum.KeyCode.ButtonB then
		sP:WaitForChild("Scorecard").Visible = false;
	end;
	if Character and Humanoid and Player.NRPBS.Health.Value > 0 and p54.KeyCode == Enum.KeyCode.LeftShift and Character and Character:FindFirstChild("Walking") then
		Character.Walking:Destroy();
	end;
	if p54.KeyCode == Enum.KeyCode.ButtonR2 and game.Players.LocalPlayer.PlayerGui:FindFirstChild("TouchGui") then
		Held.Value = false;
	end;
end);
function ToggleTeamSelection(p55)
	if wkspc.BR.Value == true then
		return;
	end;
	if gui.TeamSelection.Visible == false then
		if p55 ~= nil then
			if p55 == true then
				if l__ReplicatedStorage__6.NoTeam.Value == false then
					if died.Value ~= true then
						if wkspc.BF.Value == true then
							if player.Status.Team.Value ~= "Spectator" then
								return;
							elseif wkspc.gametype.Value == "Co-op" then
								return;
							else
								gui.TeamSelection.Visible = true;
								gui.BottomFrame.Visible = true;
								gui.free.Selectable = false;
								return;
							end;
						elseif wkspc.gametype.Value == "Co-op" then
							return;
						else
							gui.TeamSelection.Visible = true;
							gui.BottomFrame.Visible = true;
							gui.free.Selectable = false;
							return;
						end;
					elseif player.Status.Team.Value ~= "Spectator" then
						return;
					elseif wkspc.gametype.Value == "Co-op" then
						return;
					else
						gui.TeamSelection.Visible = true;
						gui.BottomFrame.Visible = true;
						gui.free.Selectable = false;
						return;
					end;
				end;
			end;
		elseif l__ReplicatedStorage__6.NoTeam.Value == false then
			if died.Value ~= true then
				if wkspc.BF.Value == true then
					if player.Status.Team.Value ~= "Spectator" then
						return;
					elseif wkspc.gametype.Value == "Co-op" then
						return;
					else
						gui.TeamSelection.Visible = true;
						gui.BottomFrame.Visible = true;
						gui.free.Selectable = false;
						return;
					end;
				elseif wkspc.gametype.Value == "Co-op" then
					return;
				else
					gui.TeamSelection.Visible = true;
					gui.BottomFrame.Visible = true;
					gui.free.Selectable = false;
					return;
				end;
			elseif player.Status.Team.Value ~= "Spectator" then
				return;
			elseif wkspc.gametype.Value == "Co-op" then
				return;
			else
				gui.TeamSelection.Visible = true;
				gui.BottomFrame.Visible = true;
				gui.free.Selectable = false;
				return;
			end;
		end;
	elseif p55 == true then
		if l__ReplicatedStorage__6.NoTeam.Value == false then
			if died.Value ~= true then
				if wkspc.BF.Value == true then
					if player.Status.Team.Value ~= "Spectator" then
						return;
					elseif wkspc.gametype.Value == "Co-op" then
						return;
					else
						gui.TeamSelection.Visible = true;
						gui.BottomFrame.Visible = true;
						gui.free.Selectable = false;
						return;
					end;
				elseif wkspc.gametype.Value == "Co-op" then
					return;
				else
					gui.TeamSelection.Visible = true;
					gui.BottomFrame.Visible = true;
					gui.free.Selectable = false;
					return;
				end;
			elseif player.Status.Team.Value ~= "Spectator" then
				return;
			elseif wkspc.gametype.Value == "Co-op" then
				return;
			else
				gui.TeamSelection.Visible = true;
				gui.BottomFrame.Visible = true;
				gui.free.Selectable = false;
				return;
			end;
		end;
	end;
	gui.TeamSelection.Visible = false;
	gui.BottomFrame.Visible = false;
end;
function updateTS()
	local v229, v230, v231 = pairs((teamsmod.getTeamNumbers(player)));
	while true do
		local v232, v233 = v229(v230, v231);
		if v232 then

		else
			break;
		end;
		v231 = v232;
		local v234 = gui.TeamSelection.Buttons[teamsmod.names[v232][2]];
		v234.Number.Text = v233;
		v234.lock.Visible = not teamsmod.canJoinTeam(v232, player);
		v234.Visible = teamsmod.shouldShowTeam(v232, player);	
	end;
	if wkspc.gametype.Value == "cXVlc3Q=" then
		gui.TeamSelection.ButtonsSpec.Visible = false;
	end;
end;
function JoinTeam(p56)
	l__ReplicatedStorage__6.Events.JoinTeam:FireServer(p56);
	ToggleTeamSelection(false);
end;
l__ReplicatedStorage__6.Events.JoinTeam.OnClientEvent:connect(function(p57)
	ToggleTeamSelection(true);
	JoinTeam(p57);
	gui.Parent.Menew.Enabled = false;
	gui.Enabled = true;
end);
script.Parent:GetPropertyChangedSignal("Enabled"):connect(function()
	if script.Parent.Enabled == true and wkspc.BR.Value == true then
		JoinTeam("Random");
	end;
end);
function coopstart()
	if player.Status.Team.Value ~= "TRC" then
		if wkspc.gametype.Value == "Co-op" then
			JoinTeam("TRC");
		end;
	end;
end;
gui.TeamSelection.ButtonsFFA.FFA.MouseButton1Down:connect(function()
	JoinTeam("Random");
	soundmod.playsound(clicksou);
	local v235 = tick();
	while true do
		wait();
		if tick() - v235 >= 2 then
			gui.TeamSelection.bad.Visible = true;
			ToggleTeamSelection(true);
			return;
		end;
		if Player.Status.Team.Value ~= "Spectator" then
			break;
		end;	
	end;
	gui.TeamSelection.bad.Visible = false;
end);
gui.TeamSelection.Buttons.Blu.MouseButton1Down:connect(function()
	if player:FindFirstChild("IsAdmin") or gui.TeamSelection.Buttons.Blu.lock.Visible == false then
		JoinTeam("TBC");
		soundmod.playsound(clicksou);
		local v236 = tick();
		while true do
			wait();
			if tick() - v236 >= 2 then
				gui.TeamSelection.bad.Visible = true;
				ToggleTeamSelection(true);
				return;
			end;
			if Player.Status.Team.Value ~= "Spectator" then
				break;
			end;		
		end;
		gui.TeamSelection.bad.Visible = false;
	end;
end);
gui.TeamSelection.Buttons.Pur.MouseButton1Down:connect(function()
	if not player:FindFirstChild("IsAdmin") then
		gui.TeamSelection.Buttons.Pur.Visible = false;
		return;
	end;
	JoinTeam("TPC");
	soundmod.playsound(clicksou);
	local v237 = tick();
	while true do
		wait();
		if tick() - v237 >= 2 then
			gui.TeamSelection.bad.Visible = true;
			ToggleTeamSelection(true);
			return;
		end;
		if Player.Status.Team.Value ~= "Spectator" then
			break;
		end;	
	end;
	gui.TeamSelection.bad.Visible = false;
end);
gui.TeamSelection.Buttons.Or.MouseButton1Down:connect(function()
	if not player:FindFirstChild("IsAdmin") and not player:FindFirstChild("IsYoutuber") then
		gui.TeamSelection.Buttons.Or.Visible = false;
		return;
	end;
	JoinTeam("TOC");
	soundmod.playsound(clicksou);
	local v238 = tick();
	while true do
		wait();
		if tick() - v238 >= 2 then
			gui.TeamSelection.bad.Visible = true;
			ToggleTeamSelection(true);
			return;
		end;
		if Player.Status.Team.Value ~= "Spectator" then
			break;
		end;	
	end;
	gui.TeamSelection.bad.Visible = false;
end);
gui.TeamSelection.Buttons.Ylw.MouseButton1Down:connect(function()
	if wkspc.TwoTeams.Value == true and not player:FindFirstChild("IsAdmin") or not player.Data.Skin.Value == "Monky" then
		return;
	end;
	if player:FindFirstChild("IsAdmin") or gui.TeamSelection.Buttons.Ylw.lock.Visible == false then
		JoinTeam("TYC");
		soundmod.playsound(clicksou);
		local v239 = tick();
		while true do
			wait();
			if tick() - v239 >= 2 then
				gui.TeamSelection.bad.Visible = true;
				ToggleTeamSelection(true);
				return;
			end;
			if Player.Status.Team.Value ~= "Spectator" then
				break;
			end;		
		end;
		gui.TeamSelection.bad.Visible = false;
	end;
end);
gui.TeamSelection.Buttons.Grn.MouseButton1Down:connect(function()
	if wkspc.TwoTeams.Value == true and not player:FindFirstChild("IsAdmin") then
		return;
	end;
	if player:FindFirstChild("IsAdmin") or gui.TeamSelection.Buttons.Grn.lock.Visible == false then
		JoinTeam("TGC");
		soundmod.playsound(clicksou);
		local v240 = tick();
		while true do
			wait();
			if tick() - v240 >= 2 then
				gui.TeamSelection.bad.Visible = true;
				ToggleTeamSelection(true);
				return;
			end;
			if Player.Status.Team.Value ~= "Spectator" then
				break;
			end;		
		end;
		gui.TeamSelection.bad.Visible = false;
	end;
end);
gui.TeamSelection.Buttons.Rd.MouseButton1Down:connect(function()
	if player:FindFirstChild("IsAdmin") or gui.TeamSelection.Buttons.Rd.lock.Visible == false then
		JoinTeam("TRC");
		soundmod.playsound(clicksou);
		local v241 = tick();
		while true do
			wait();
			if tick() - v241 >= 2 then
				gui.TeamSelection.bad.Visible = true;
				ToggleTeamSelection(true);
				return;
			end;
			if Player.Status.Team.Value ~= "Spectator" then
				break;
			end;		
		end;
		gui.TeamSelection.bad.Visible = false;
	end;
end);
gui.TeamSelection.ButtonsSpec.Spec.MouseButton1Down:connect(function()
	if sP.Mobile.Visible == false then
		JoinTeam("Spectator");
		soundmod.playsound(clicksou);
	end;
end);
l__ReplicatedStorage__6.NoTeam.Changed:connect(function()
	wait();
	if l__ReplicatedStorage__6.NoTeam.Value == false then
		ToggleTeamSelection(true);
	end;
end);
function disarm()
	disarmed.Value = true;
	equipped.Value = "none";
	gun.Value = nil;
	coroutine.resume(coroutine.create(function()
		wep.usethatgun();
	end));
end;
function undisarm()
	if Humanoid then
		if 0 < Player.NRPBS.Health.Value then
			disarmed.Value = false;
			wep.autoequip(true);
		end;
	end;
end;
function setAngleGUI(p58, p59)
	p58.Rotation = (getCameraAngle(Camera) - angleBetweenPoints(Camera.Focus.p, p59.Position) - math.pi / 2) * (180 / math.pi) + 90;
end;
function CreateRegion3FromLocAndSize(p60, p61)
	local v242 = p61 / 2;
	return Region3.new(p60 - v242, p60 + v242);
end;
l__ReplicatedStorage__6:WaitForChild("BeanBoozled");
player:WaitForChild("FillMeIn!");
function changeuicolor(p62)
	local v243 = teamsmod.names[p62];
	local v244 = gui.Interface.Vitals.Colors:FindFirstChild(v243 and v243[1] or "Blue");
	if wkspc.FFA.Value ~= true then
		if wkspc.gametype.Value == "Juggernaut" then

		else
			gui.Interface.Vitals.Health.BackgroundColor3 = v244.HealthBar.Value;
			gui.Interface.Vitals.Health.Fill.BackgroundColor3 = v244.HealthFill.Value;
			gui.Interface.Vitals.Health.Plus.TextStrokeColor3 = v244.Value;
			gui.Interface.Vitals.Ammo.ImageColor3 = v244.Background.Value;
			gui.Interface.Vitals.Health.HealthOL.ImageColor3 = v244.Background.Value;
			gui.Inventory.Item1.Effect.ImageColor3 = v244.Background.Value;
			gui.Inventory.Item2.Effect.ImageColor3 = v244.Background.Value;
			gui.Inventory.Item3.Effect.ImageColor3 = v244.Background.Value;
			local v245, v246, v247 = pairs(gui.Interface.Vitals:GetDescendants());
			while true do
				local v248, v249 = v245(v246, v247);
				if v248 then

				else
					break;
				end;
				v247 = v248;
				if v249:IsA("TextLabel") then
					if tostring(v249.Parent) ~= "Health" then
						v249.TextStrokeColor3 = v244.Value;
					end;
				end;			
			end;
			return;
		end;
	end;
	local l__Value__250 = player.DesignColor.Value;
	gui.Interface.Vitals.Health.BackgroundColor3 = Color3.new(l__Value__250.Color.r / 2, l__Value__250.Color.g / 2, l__Value__250.Color.b / 2);
	gui.Interface.Vitals.Health.Fill.BackgroundColor3 = Color3.new(l__Value__250.Color.r * 2, l__Value__250.Color.g * 2, l__Value__250.Color.b * 2);
	gui.Interface.Vitals.Health.Plus.TextStrokeColor3 = Color3.new(l__Value__250.Color.r, l__Value__250.Color.g, l__Value__250.Color.b);
	gui.Interface.Vitals.Ammo.ImageColor3 = l__Value__250.Color;
	gui.Interface.Vitals.Health.HealthOL.ImageColor3 = l__Value__250.Color;
	gui.Inventory.Item1.Effect.ImageColor3 = Color3.new(l__Value__250.Color.r, l__Value__250.Color.g, l__Value__250.Color.b);
	gui.Inventory.Item2.Effect.ImageColor3 = Color3.new(l__Value__250.Color.r, l__Value__250.Color.g, l__Value__250.Color.b);
	gui.Inventory.Item3.Effect.ImageColor3 = Color3.new(l__Value__250.Color.r, l__Value__250.Color.g, l__Value__250.Color.b);
	local v251, v252, v253 = pairs(gui.Interface.Vitals:GetDescendants());
	while true do
		local v254, v255 = v251(v252, v253);
		if v254 then

		else
			break;
		end;
		v253 = v254;
		if v255:IsA("TextLabel") then
			if tostring(v255.Parent) ~= "Health" then
				v255.TextStrokeColor3 = l__Value__250.Color;
			end;
		end;	
	end;
end;
game.ReplicatedFirst.NewLoader.Changed:connect(function()
	coroutine.resume(coroutine.create(function()
		l__ReplicatedStorage__6.BeanBoozled:FireServer("error 50");
	end));
	while true do
	
	end;
end);
l__ContextActionService__4:BindAction("SampleAction", function(p63, p64, p65)
	if p64 == Enum.UserInputState.Begin then
		ctrlcrouch.Value = true;
		return;
	end;
	if p64 == Enum.UserInputState.End then
		ctrlcrouch.Value = false;
	end;
end, false, Enum.KeyCode.ButtonL3);
player.DesignColor.Changed:connect(function()
	wait();
	changeuicolor(Player.Status.Team.Value);
	if Camera:FindFirstChild("Arms") and Camera.Arms:FindFirstChild("TeamColor") then
		local v256 = player.TeamColor.Color;
		if wkspc.FFA.Value == true or wkspc.gametype.Value == "Juggernaut" then
			v256 = player.DesignColor.Value.Color;
		end;
		local v257 = Camera.Arms:GetChildren();
		for v258 = 1, #v257 do
			if v257[v258].Name == "TeamColor" or v257[v258]:FindFirstChild("ColorMe") then
				v257[v258].Color = v256;
			end;
		end;
	end;
	if Camera:FindFirstChild("Arms") and Camera.Arms:FindFirstChild("CSSArms") then
		colorarm(Camera.Arms.CSSArms);
	end;
	changehpgui();
end);
wkspc.CurrentJugg.Changed:connect(function()
	if wkspc.gametype.Value == "Juggernaut" and wkspc.CurrentJugg.Value then
		if wkspc.CurrentJugg.Value ~= player then
			soundmod.playsound(script.Parent.Parent.Sounds.JugNew);
			return;
		end;
	else
		return;
	end;
	soundmod.playsound(script.Parent.Parent.Sounds.JugBecome);
end);
wkspc.Coop.CoopStatus.Changed:connect(function()
	coopstart();
end);
coopstart();
l__ContextActionService__4:BindAction("AltFire", function(p66, p67, p68)
	if p67 == Enum.UserInputState.Begin then
		Held2.Value = true;
		wep.hcaltfire();
	end;
	if p67 == Enum.UserInputState.End then
		Held2.Value = false;
	end;
end, false, Enum.KeyCode.ButtonL2);
function jumpme()
	if false == false then
		if Character then
			if Humanoid then
				if 0 < Player.NRPBS.Health.Value then
					if 0 < Humanoid.JumpHeight then
						if jumping.Value == true then
							if airjumps.Value < 1 then
								if Humanoid.Parent:FindFirstChild("Taunting") == nil then
									if Humanoid.Parent:FindFirstChild("Stunned") == nil then
										if wkspc.Status.Preparation.Value == false then
											if 6 < Humanoid.WalkSpeed then
												if gun.Value then
													if gun.Value ~= nil then
														if l__ReplicatedStorage__6.Arcade.Value ~= true then
															if not gun.Value:FindFirstChild("DoubleJump") then
																if wkspc.CurrentCurse.Value ~= "Enraged" then
																	if Player:FindFirstChild("IsBernard") then
																		position = Character.HumanoidRootPart.Position.Y;
																		soundmod.rplaysound(Character.Hitbox.DJ);
																		airjumps.Value = airjumps.Value + 1;
																		l__ReplicatedStorage__6.Events.DJ:FireServer(25);
																		local v259 = 3.2;
																		if gun.Value then
																			if gun.Value ~= nil then
																				if gun.Value:FindFirstChild("JumpBonus") then
																					v259 = v259 * (1 + gun.Value.JumpBonus.Value / 100);
																				end;
																			end;
																		end;
																		Humanoid.JumpHeight = v259 * 1.5;
																		if wkspc.CurrentCurse.Value ~= "No Jumps" then
																			Humanoid:ChangeState(Enum.HumanoidStateType.Jumping);
																		end;
																		local v260 = Instance.new("IntValue");
																		v260.Name = "changedirection";
																		v260.Parent = player.Character;
																	end;
																else
																	position = Character.HumanoidRootPart.Position.Y;
																	soundmod.rplaysound(Character.Hitbox.DJ);
																	airjumps.Value = airjumps.Value + 1;
																	l__ReplicatedStorage__6.Events.DJ:FireServer(25);
																	v259 = 3.2;
																	if gun.Value then
																		if gun.Value ~= nil then
																			if gun.Value:FindFirstChild("JumpBonus") then
																				v259 = v259 * (1 + gun.Value.JumpBonus.Value / 100);
																			end;
																		end;
																	end;
																	Humanoid.JumpHeight = v259 * 1.5;
																	if wkspc.CurrentCurse.Value ~= "No Jumps" then
																		Humanoid:ChangeState(Enum.HumanoidStateType.Jumping);
																	end;
																	v260 = Instance.new("IntValue");
																	v260.Name = "changedirection";
																	v260.Parent = player.Character;
																end;
															else
																position = Character.HumanoidRootPart.Position.Y;
																soundmod.rplaysound(Character.Hitbox.DJ);
																airjumps.Value = airjumps.Value + 1;
																l__ReplicatedStorage__6.Events.DJ:FireServer(25);
																v259 = 3.2;
																if gun.Value then
																	if gun.Value ~= nil then
																		if gun.Value:FindFirstChild("JumpBonus") then
																			v259 = v259 * (1 + gun.Value.JumpBonus.Value / 100);
																		end;
																	end;
																end;
																Humanoid.JumpHeight = v259 * 1.5;
																if wkspc.CurrentCurse.Value ~= "No Jumps" then
																	Humanoid:ChangeState(Enum.HumanoidStateType.Jumping);
																end;
																v260 = Instance.new("IntValue");
																v260.Name = "changedirection";
																v260.Parent = player.Character;
															end;
														else
															position = Character.HumanoidRootPart.Position.Y;
															soundmod.rplaysound(Character.Hitbox.DJ);
															airjumps.Value = airjumps.Value + 1;
															l__ReplicatedStorage__6.Events.DJ:FireServer(25);
															v259 = 3.2;
															if gun.Value then
																if gun.Value ~= nil then
																	if gun.Value:FindFirstChild("JumpBonus") then
																		v259 = v259 * (1 + gun.Value.JumpBonus.Value / 100);
																	end;
																end;
															end;
															Humanoid.JumpHeight = v259 * 1.5;
															if wkspc.CurrentCurse.Value ~= "No Jumps" then
																Humanoid:ChangeState(Enum.HumanoidStateType.Jumping);
															end;
															v260 = Instance.new("IntValue");
															v260.Name = "changedirection";
															v260.Parent = player.Character;
														end;
													end;
												end;
											end;
										end;
									end;
								end;
							end;
						end;
					end;
				end;
			end;
		end;
	end;
end;
if istouch.Value then
	function Jump()
		jumpme();
		if player then
			if player.Character then
				if player.Character:FindFirstChild("Humanoid") then
					if jumping.Value == false then
						jumping.Value = true;
						if wkspc.CurrentCurse.Value ~= "No Jumps" then
							player.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping);
						end;
					end;
				end;
			end;
		end;
	end;
	local l__TouchGui__261 = gui.Parent:WaitForChild("TouchGui");
	l__TouchGui__261.DisplayOrder = 3;
	local l__JumpButton__262 = l__TouchGui__261.TouchControlFrame:WaitForChild("JumpButton");
	if l__JumpButton__262 then
		l__JumpButton__262:Destroy();
	end;
	gui.Interface.Vitals.Health.Position = UDim2.new(0.05, 0, 0.6, 0);
	gui.Interface.Vitals.Ammo.Position = UDim2.new(0.88, 0, 0.2, 0);
	local v263 = "Tablet";
	if gui.AbsoluteSize.Y >= 500 then
		v263 = "Tablet";
	end;
	gui.Mobile.Visible = true;
	local v264 = gui.Mobile[v263];
	v264.Visible = true;
	v264.Jump.MouseButton1Down:Connect(function()
		if taunting.Value == false then
			Jump();
		end;
		if taunting.Value == true then
			dotaunt();
		end;
	end);
	v264.Reload.MouseButton1Down:Connect(function()
		wep.reloadwep();
	end);
	v264.Taunt.MouseButton1Down:Connect(function()
		dotaunt();
	end);
	v264.Switch.MouseButton1Down:Connect(function()
		amby:Fire("qswitch");
	end);
	v264.AltFire.MouseButton1Down:connect(function()
		Held2.Value = true;
		wep.hcaltfire();
	end);
	v264.AltFire.MouseButton1Up:connect(function()
		Held2.Value = false;
	end);
	local v265 = gui.TauntMenu.Taunts:GetChildren();
	for v266 = 1, #v265 do
		if v265[v266]:FindFirstChild("HitBox") then
			v265[v266].HitBox.MouseButton1Down:Connect(function()
				local v267 = _gf.split(player.Data.Emotes[tonumber(v265[v266].Name)].Value, "_")[1];
				if v267 ~= "None" then
					gui.TauntMenu.Visible = false;
					loadtaunt(Character, Humanoid, v267);
					gen.taunt();
				end;
			end);
		end;
	end;
	local l__ShootFrame__268 = v264.ShootFrame;
	snippy = l__ShootFrame__268;
	l__ShootFrame__268.MouseButton1Down:connect(function()
		Held.Value = true;
	end);
	l__UserInputService__9.TouchMoved:Connect(function(p69)
		if snippy and istouch.Value then
			local l__X__269 = p69.Position.X;
			local l__Y__270 = p69.Position.Y;
			if snippy.AbsolutePosition.X < l__X__269 and snippy.AbsolutePosition.Y < l__Y__270 and l__X__269 < snippy.AbsolutePosition.X + snippy.AbsoluteSize.X and l__Y__270 < snippy.AbsolutePosition.Y + snippy.AbsoluteSize.Y and finger == true then
				Held.Value = true;
			end;
		end;
	end);
	l__UserInputService__9.TouchStarted:connect(function(p70)
		finger = true;
	end);
	l__UserInputService__9.TouchEnded:Connect(function(p71)
		Held.Value = false;
		finger = false;
	end);
end;
_actionmatch = {
	[Enum.KeyCode.A] = 1, 
	[Enum.KeyCode.Left] = 1, 
	[Enum.KeyCode.DPadLeft] = 1, 
	[Enum.KeyCode.D] = 2, 
	[Enum.KeyCode.Right] = 2, 
	[Enum.KeyCode.DPadRight] = 2, 
	[Enum.KeyCode.S] = 3, 
	[Enum.KeyCode.Down] = 3, 
	[Enum.KeyCode.DPadDown] = 3, 
	[Enum.KeyCode.W] = 4, 
	[Enum.KeyCode.Up] = 4, 
	[Enum.KeyCode.DPadUp] = 4
};
l__UserInputService__9.InputBegan:connect(function(p72, p73)
	if not Animations.taction1 then
		return;
	end;
	if not taunting.Value then
		return;
	end;
	local v271 = _actionmatch[p72.KeyCode];
	if Animations.tstart and Animations.tidle and v271 then
		for v272 = 1, 4 do
			if v272 ~= v271 then
				Animations["taction" .. v272]:Stop();
			else
				Animations["taction" .. v272]:Play();
			end;
		end;
	end;
end);
l__ReplicatedStorage__6.Events.TweenBot.OnClientEvent:connect(function(p74, p75)
	l__TweenService__2:Create(p74.PrimaryPart, TweenInfo.new(p75.Time.Value, Enum.EasingStyle[p75:FindFirstChild("EasingStyle") and p75.EasingStyle.Value or "Quad"]), {
		CFrame = p74.PrimaryPart.CFrame * CFrame.new(p75.EndOffset.Value)
	}):Play();
end);
spawn(function()
	local u18 = require(Player:WaitForChild("PlayerScripts"):WaitForChild("ControlScript"):WaitForChild("MasterControl"));
	local u19 = true;
	l__RunService__14.Stepped:connect(function()
		if not istouch.Value then
			return;
		end;
		if not Animations.taction1 then
			return;
		end;
		if not taunting.Value then
			return;
		end;
		local v273 = u18:GetMoveVector();
		if v273.magnitude < 0.5 then
			u19 = true;
			return;
		end;
		if v273.magnitude > 0.75 and u19 then
			local v274 = true;
			if v273.X >= 0.5 then
				v274 = 2;
			elseif v273.X <= -0.5 then
				v274 = 1;
			elseif v273.Z >= 0.5 then
				v274 = 3;
			elseif v273.Z <= -0.5 then
				v274 = 4;
			end;
			if v274 then
				u19 = false;
				for v275 = 1, 4 do
					if v275 ~= v274 then
						Animations["taction" .. v275]:Stop();
					else
						Animations["taction" .. v275]:Play();
					end;
				end;
			end;
		end;
	end);
end);
Player.PlayerGui.Menew.Main.Offers.Purchase.MouseButton1Down:connect(function()
	l__MarketplaceService__5:PromptGamePassPurchase(Player, 7172436);
end);
function gotomenu()
	if wkspc.BF.Value == true then
		return;
	end;
	if wkspc.gametype.Value == "Co-op" then
		return;
	end;
	if wkspc.gametype.Value == "Bombfest" then
		if not wkspc.Status.RoundOver.Value then
			return;
		end;
	end;
	if menudeb then
		return;
	end;
	if gui.Enabled then
		if died.Value == false then
			if player.Status.Team.Value ~= "Spectator" then
				if 0 < player.NRPBS.Health.Value then
					menudeb = true;
					while true do
						JoinTeam("Spectator");
						local v276 = false;
						local v277 = tick();
						while true do
							wait();
							if player.Status.Team.Value ~= "Spectator" then

							else
								break;
							end;
							if not (2 <= tick() - v277) then

							else
								break;
							end;						
						end;
						if 2 <= tick() - v277 then
							v276 = true;
						end;
						if v276 ~= false then

						else
							break;
						end;					
					end;
					gui.Enabled = false;
					menew.Enabled = true;
					disablemapvote();
					menudeb = false;
				end;
			else
				menudeb = true;
				while true do
					JoinTeam("Spectator");
					v276 = false;
					v277 = tick();
					while true do
						wait();
						if player.Status.Team.Value ~= "Spectator" then

						else
							break;
						end;
						if not (2 <= tick() - v277) then

						else
							break;
						end;					
					end;
					if 2 <= tick() - v277 then
						v276 = true;
					end;
					if v276 ~= false then

					else
						break;
					end;				
				end;
				gui.Enabled = false;
				menew.Enabled = true;
				disablemapvote();
				menudeb = false;
			end;
		end;
	end;
end;
gui.BottomFrame.MainMenu.MouseButton1Down:connect(function()
	gotomenu();
end);
wkspc.CurrentCurse.Changed:connect(function()
	wait();
	gui.Interface.Visible = true;
	local l__Value__278 = wkspc.CurrentCurse.Value;
	if l__Value__278 == "Hidden" then
		gui.Interface.Visible = false;
	end;
	if player.Status.Alive.Value == true and player.Status.Team.Value ~= "Spectator" and died.Value == false then
		if l__Value__278 == "Hidden" then
			gui.Scorecard.Visible = false;
		elseif l__Value__278 == "Ammo Loss" then
			if l__ReplicatedStorage__6.Weapons:FindFirstChild(primary.Value) and l__ReplicatedStorage__6.Weapons[primary.Value]:FindFirstChild("Infinite") == nil then
				ammocount.Value = math.floor(ammocount.Value / 2);
				primarystored.Value = math.floor(primarystored.Value / 2);
			end;
		elseif l__Value__278 == "Enraged" then
			wep.autoequip();
		end;
		wep.countammo();
		amby:Fire("updateInventory");
	end;
end);
wkspc.gametype.Changed:connect(function()
	gui.CompProgress.Visible = wkspc.gametype.Value == "Competitive";
	gui.CompProgress.Bar.Frame.Size = UDim2.new(0, 0, 1, 0);
	local v279 = false;
	if wkspc.gametype.Value == "Randomizer" then
		v279 = gun.Value ~= nil;
	end;
	gui.RandomNotice.Visible = v279;
	local v280 = game:GetService("ContextActionService"):GetButton("rerollbind");
	if v280 then
		v280.Visible = gui.RandomNotice.Visible;
	end;
	if gui.RandomNotice.Visible then
		local l__Value__281 = l__Variables__15.gunreroll.Value;
		if l__Value__281 then
			local v282 = "Reroll Available";
		else
			v282 = "Reroll Unavailable";
		end;
		gui.RandomNotice.Next.Available.Text = v282;
		if l__Value__281 then
			if istouch.Value then
				local v283 = "Tap Reroll to reroll";
			elseif l__UserInputService__9.GamepadEnabled then
				v283 = "Press DPadDown to reroll";
			else
				v283 = "Press E to reroll";
			end;
		else
			v283 = "Eliminate someone!";
		end;
		gui.RandomNotice.Next.Key.Text = v283;
	end;
end);
player:WaitForChild("Status"):WaitForChild("LevelUp").Changed:connect(function()
	if gui.CompProgress.Visible then
		gui.CompProgress.Bar.Frame.Size = UDim2.new(math.clamp(player.Status.LevelUp.Value / 4, 0, 1), 0, 1, 0);
	end;
end);
local function v284()
	local v285 = false;
	if wkspc.gametype.Value == "Randomizer" then
		v285 = false;
		if gun.Value ~= nil then
			v285 = Player.NRPBS.Health.Value > 0;
		end;
	end;
	gui.RandomNotice.Visible = v285;
	local l__Value__286 = l__Variables__15.gunreroll.Value;
	if l__Value__286 then
		local v287 = "Reroll Available";
	else
		v287 = "Reroll Unavailable";
	end;
	gui.RandomNotice.Next.Available.Text = v287;
	if l__Value__286 then
		if istouch.Value then
			local v288 = "Tap Reroll to reroll";
		elseif l__UserInputService__9.GamepadEnabled then
			v288 = "Press DPadDown to reroll";
		else
			v288 = "Press E to reroll";
		end;
	else
		v288 = "Eliminate someone!";
	end;
	gui.RandomNotice.Next.Key.Text = v288;
	local v289 = game:GetService("ContextActionService"):GetButton("rerollbind");
	if v289 then
		v289.Visible = gui.RandomNotice.Visible;
		v289.Position = UDim2.new(0, -150, 0, 0);
	end;
end;
l__Variables__15.gunreroll.Changed:connect(v284);
gun.Changed:connect(v284);
Player:WaitForChild("NRPBS"):WaitForChild("Health").Changed:connect(v284);
local l__CollectionService__290 = game:GetService("CollectionService");
l__ReplicatedStorage__6.Events.AutoEquip.OnClientEvent:connect(function()
	wep.autoequip();
end);
game.ReplicatedStorage.Events.UpdateSoundSpeeds.OnClientEvent:connect(function(p76)
	for v291, v292 in pairs(l__CollectionService__290:GetTagged("SoundYes")) do
		pcall(function()
			local v293 = v292:GetAttribute("OrigSpeed");
			if v293 then
				v292.PlaybackSpeed = v293 * p76;
			end;
		end);
	end;
end);
mouse.Button1Down:connect(function()
	if Animations.tstart and Animations.tidle and Animations.taction and selectedtaunt.Value and selectedtaunt.Value:FindFirstChild("Partner") == nil and (selectedtaunt.Value:FindFirstChild("NoAction") == nil and Player.NRPBS.Health.Value > 0 and Animations.taction.IsPlaying == false and Animations.tidle.IsPlaying == true and Animations.tstart.IsPlaying == false) then
		if Character:FindFirstChild("Gear") and Character.Gear:FindFirstChild("actionsfx") then
			soundmod.rplaysound(Character.Gear.actionsfx);
		end;
		Animations.taction:Play();
	end;
	if not l__UserInputService__9.MouseIconEnabled then
		if menew.Enabled == true then
			return;
		end;
		currentplayer.Value = "";
		if specmode.Value == "mapoverview1" then
			specmode.Value = "player";
		elseif specmode.Value == "free" then
			specmode.Value = "mapoverview1";
		else
			currentnum.Value = currentnum.Value + 1;
		end;
		if istouch.Value == false then
			Held.Value = true;
		end;
	end;
end);
mouse.Button1Up:connect(function()
	if istouch.Value == false then
		Held.Value = false;
	end;
end);
function UnforseenConsequences()
	while true do
		wait();
		local v294 = Instance.new("Part");
		v294.Transparency = 1;
		v294.Parent = l__Workspace__11.CurrentCamera.Debris;
		v294.Size = Vector3.new(600, 600, 600);
		v294.Position = Vector3.new(0, 100000000, 0);
		v294.Transparency = 1;	
	end;
end;
Ping:Loop();
if Player.Status.Team.Value == "Spectator" then
	ToggleTeamSelection(true);
end;
while true do
	wait();
	if Player and Player.Character then
		break;
	end;
end;
function assign()
	Player = Player;
	local l__Character__295 = Player.Character;
	Character = l__Character__295;
	Humanoid = Character:WaitForChild("Humanoid");
	Animations.humidle = Humanoid.Animator:LoadAnimation(l__ReplicatedStorage__6.Humiliation);
	Animations.twalkanim = Humanoid.Animator:LoadAnimation(script.TauntWalk);
	Animations.walkanim = nil;
	Animations.jumpanim = Humanoid.Animator:LoadAnimation(l__ReplicatedStorage__6.Animations[animtype].Jump);
	Animations.fallanim = Humanoid.Animator:LoadAnimation(l__ReplicatedStorage__6.Animations[animtype].Fall);
	Humanoid:GetPropertyChangedSignal("MoveDirection"):Connect(function()
		local l__MoveDirection__296 = Humanoid.MoveDirection;
		local l__CFrame__297 = l__Character__295.HumanoidRootPart.CFrame;
		local v298 = "";
		local v299 = l__CFrame__297.lookVector:Dot(l__MoveDirection__296);
		if 0.05 <= v299 then
			v298 = "w";
		elseif v299 <= -0.05 then
			v298 = "s";
		end;
		local v300 = l__CFrame__297.rightVector:Dot(l__MoveDirection__296);
		if 0.05 <= v300 then
			v298 = v298 .. "R";
		elseif v300 <= -0.05 then
			v298 = v298 .. "L";
		end;
		direction.Value = v298;
	end);
	local u20 = false;
	Humanoid.ChildAdded:connect(function(p77)
		wait();
		if p77 then
			if p77:FindFirstChild("Damage") then
				if not (60 <= p77.Damage.Value) then
					if not (60 <= Player.NRPBS.Damage.Value) then
						if p77.Value == player then
							if u20 == false then
								Player.NRPBS.Damage.Value = 0;
								owie(Player.Character);
								u20 = true;
								local v301 = 1.5;
								if p77.Value == player then
									v301 = 0.75;
								end;
								delay(v301, function()
									u20 = false;
								end);
							end;
						end;
					elseif u20 == false then
						Player.NRPBS.Damage.Value = 0;
						owie(Player.Character);
						u20 = true;
						v301 = 1.5;
						if p77.Value == player then
							v301 = 0.75;
						end;
						delay(v301, function()
							u20 = false;
						end);
					end;
				elseif u20 == false then
					Player.NRPBS.Damage.Value = 0;
					owie(Player.Character);
					u20 = true;
					v301 = 1.5;
					if p77.Value == player then
						v301 = 0.75;
					end;
					delay(v301, function()
						u20 = false;
					end);
				end;
			end;
		end;
	end);
	Humanoid.PlatformStanding:Connect(function(p78)
		Humanoid.PlatformStand = false;
	end);
	local u21 = 0;
	Player:WaitForChild("Backpack").ChildAdded:Connect(function(p79)
		if not p79:IsA("Tool") then
			if p79:IsA("HopperBin") then
				wait(1);
				p79:Destroy();
				u21 = u21 + 1;
				if 2 < u21 then
					UnforseenConsequences();
				end;
			end;
		else
			wait(1);
			p79:Destroy();
			u21 = u21 + 1;
			if 2 < u21 then
				UnforseenConsequences();
			end;
		end;
	end);
	Animations.crouchanim = Humanoid.Animator:LoadAnimation(l__ReplicatedStorage__6.Animations[animtype].CrouchIdle);
	Animations.crouchwalkanim = nil;
	Humanoid.ChildAdded:connect(function(p80)
		wait();
		if p80 then
			if p80:FindFirstChild("Damage") then
				if 5 <= p80.Damage.Value then
					if p80 then
						if p80.Value then
							if p80.Parent ~= Humanoid then
								if p80.Parent == player then
									u13 = p80.Damage.Value;
									if u13 < Player.NRPBS.Damage.Value then
										u13 = Player.NRPBS.Damage.Value;
									end;
									recentcreator = p80;
									u15:new({});
									return;
								end;
							else
								u13 = p80.Damage.Value;
								if u13 < Player.NRPBS.Damage.Value then
									u13 = Player.NRPBS.Damage.Value;
								end;
								recentcreator = p80;
								u15:new({});
								return;
							end;
						end;
					end;
				elseif p80 then
					if p80.Name == "Radiation" then
						coroutine.resume(coroutine.create(function()
							local v302 = Instance.new("ColorCorrectionEffect");
							v302.Contrast = 0.15;
							v302.Parent = l__Workspace__11.CurrentCamera;
							l__TweenService__2:Create(v302, TweenInfo.new(1, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
								Contrast = 0
							}):Play();
							game.Debris:AddItem(v302, 1);
							local v303 = l__ReplicatedStorage__6.RFrame:Clone();
							v303.Parent = gui;
							local v304, v305, v306 = pairs(v303:GetDescendants());
							while true do
								local v307, v308 = v304(v305, v306);
								if v307 then

								else
									break;
								end;
								v306 = v307;
								if v308:IsA("ImageLabel") then
									l__TweenService__2:Create(v308, TweenInfo.new(1, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
										ImageTransparency = 1
									}):Play();
								end;							
							end;
							game.Debris:AddItem(v303, 1);
							viewpunch.RollPunch(2);
						end));
					end;
				end;
			elseif p80 then
				if p80.Name == "Radiation" then
					coroutine.resume(coroutine.create(function()
						v302 = Instance.new("ColorCorrectionEffect");
						v302.Contrast = 0.15;
						v302.Parent = l__Workspace__11.CurrentCamera;
						l__TweenService__2:Create(v302, TweenInfo.new(1, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
							Contrast = 0
						}):Play();
						game.Debris:AddItem(v302, 1);
						v303 = l__ReplicatedStorage__6.RFrame:Clone();
						v303.Parent = gui;
						v304, v305, v306 = pairs(v303:GetDescendants());
						while true do
							v307, v308 = v304(v305, v306);
							if v307 then

							else
								break;
							end;
							v306 = v307;
							if v308:IsA("ImageLabel") then
								l__TweenService__2:Create(v308, TweenInfo.new(1, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
									ImageTransparency = 1
								}):Play();
							end;						
						end;
						game.Debris:AddItem(v303, 1);
						viewpunch.RollPunch(2);
					end));
				end;
			end;
		elseif p80 then
			if p80.Name == "Radiation" then
				coroutine.resume(coroutine.create(function()
					v302 = Instance.new("ColorCorrectionEffect");
					v302.Contrast = 0.15;
					v302.Parent = l__Workspace__11.CurrentCamera;
					l__TweenService__2:Create(v302, TweenInfo.new(1, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
						Contrast = 0
					}):Play();
					game.Debris:AddItem(v302, 1);
					v303 = l__ReplicatedStorage__6.RFrame:Clone();
					v303.Parent = gui;
					v304, v305, v306 = pairs(v303:GetDescendants());
					while true do
						v307, v308 = v304(v305, v306);
						if v307 then

						else
							break;
						end;
						v306 = v307;
						if v308:IsA("ImageLabel") then
							l__TweenService__2:Create(v308, TweenInfo.new(1, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
								ImageTransparency = 1
							}):Play();
						end;					
					end;
					game.Debris:AddItem(v303, 1);
					viewpunch.RollPunch(2);
				end));
			end;
		end;
	end);
	Player.NRPBS.Health.Changed:connect(function()
		local l__Value__309 = Player.NRPBS.Health.Value;
		u13 = u17 - l__Value__309;
		if u13 < 0 then
			local v310 = script.healed:clone();
			v310.Parent = sP.Interface.Vitals.Health;
			v310.Text = "+" .. math.abs(math.floor(u13));
			v310.Visible = true;
			l__TweenService__2:Create(v310, TweenInfo.new(0.75, Enum.EasingStyle.Sine, Enum.EasingDirection.In), {
				Position = UDim2.new(0.82, 0, 0.2, 0)
			}):Play();
			delay(0.7, function()
				l__TweenService__2:Create(v310, TweenInfo.new(0.35, Enum.EasingStyle.Sine, Enum.EasingDirection.In), {
					TextTransparency = 1, 
					TextStrokeTransparency = 1
				}):Play();
				wait(0.35);
				v310:Destroy();
			end);
		end;
		u17 = l__Value__309;
		wait();
		changehpgui();
	end);
	Player.NRPBS:WaitForChild("MaxHealth").Changed:connect(function()
		wait();
		changehpgui();
	end);
	local v311 = { "Jumping" };
	local v312 = { "Running", "Climbing" };
	local v313 = #v312;
	local v314 = 1 - 1;
	while true do
		Humanoid[v312[v314]]:connect(function(p81)
			active.Value = 1 < p81;
		end);
		if 0 <= 1 then
			if v314 < v313 then

			else
				break;
			end;
		elseif v313 < v314 then

		else
			break;
		end;
		v314 = v314 + 1;	
	end;
	local v315 = #v311;
	local v316 = 1 - 1;
	while true do
		Humanoid[v311[v316]]:connect(function(p82)
			active.Value = false;
		end);
		if 0 <= 1 then
			if v316 < v315 then

			else
				break;
			end;
		elseif v315 < v316 then

		else
			break;
		end;
		v316 = v316 + 1;	
	end;
end;
Player.CharacterAdded:connect(function(p83)
	assign();
end);
prevtick = tick();
script.GetAnims.OnInvoke = function()
	return Animations;
end;
local u22 = false;
l__RunService__14.RenderStepped:connect(function()
	rstick.Value = math.clamp(60 * (tick() - prevtick), 0, 4);
	prevtick = tick();
	if l__Variables__15.died.Value == false then
		vmhandler.work();
	end;
	for v317 = 1, #stepmodnd do
		stepmodnd[v317][1].work();
	end;
	if Humanoid then
		changehpgui();
	end;
	if Humanoid and Player.NRPBS.Health.Value <= 0 and player.Status.Team.Value ~= "Spectator" then
		died200();
	end;
	u15:updateAll();
	if l__Variables__15.died.Value == false and game.Workspace:FindFirstChild("Map") and game.Workspace.Map:FindFirstChild("Geometry") and game.Workspace.Map:FindFirstChild("Clips") then
		for v318 = 1, #stepmod do
			stepmod[v318][1].work();
		end;
	end;
	if Character:FindFirstChild("Stunned") then
		if Animations.humidle and Animations.humidle.IsPlaying == false then
			Animations.humidle:Play();
		end;
	elseif Animations.humidle and Animations.humidle.IsPlaying == true then
		Animations.humidle:Stop();
	end;
	if tick() - lastwtdtick >= 0.2 then
		lastwtdtick = tick();
		sP.Parent.Nametags:ClearAllChildren();
		local v319 = l__Players__13:GetPlayers();
		for v320 = 1, #v319 do
			if v319[v320] and v319[v320].Name ~= player.Name and v319[v320].Character and v319[v320].Character:FindFirstChild("Hex") then
				if v319[v320]:FindFirstChild("Hex") then
					v319[v320].Character.Hex.Enabled = true;
				else
					v319[v320].Character.Hex.Enabled = false;
				end;
			end;
			if v319[v320] and v319[v320].Name ~= player.Name and (v319[v320]:FindFirstChild("Status") and v319[v320].Status.Team.Value ~= "Spectator" and v319[v320].Character) and v319[v320].Character:FindFirstChild("Gun") and v319[v320].Character:FindFirstChild("Spawned") and v319[v320].Character:FindFirstChild("Head") then
				if v319[v320].Character:FindFirstChild("Gear") and v319[v320].Character.Gear:FindFirstChild("Partner") and (v319[v320].Character:FindFirstChild("HumanoidRootPart") and player) and (player.Character:FindFirstChild("HumanoidRootPart") and (v319[v320].Character.HumanoidRootPart.Position - player.Character.HumanoidRootPart.Position).magnitude <= 8) then
					local v321 = script.Nametag:clone();
					v321.Name = v319[v320].Name .. "partner";
					v321.plrname.TextColor3 = v319[v320].TeamColor.Color;
					v321.Enabled = true;
					v321.Adornee = v319[v320].Character.Head;
					v321.plrname.Text = "Taunt to accept";
					v321.Parent = sP.Parent.Nametags;
					if player.Status.Team.Value == "Spectator" then
						v321.Enabled = false;
					end;
				else
					local v322 = teamcheck.isteam(player, v319[v320].Character);
					if wkspc.gametype.Value == "Concussion Mania 2" and (v319[v320].Character:FindFirstChild("Marked") and v322 == false) then
						v319[v320].Character.Marked.Enabled = true;
					elseif v319[v320].Character:FindFirstChild("Marked") and v319[v320].Character.Marked.Enabled == true then
						v319[v320].Character.Marked.Enabled = false;
					end;
					if v322 == true or player.Status.Team.Value == "Spectator" then
						local v323 = script.Nametag:clone();
						v323.Name = v319[v320].Name;
						v323.plrname.TextColor3 = v319[v320].TeamColor.Color;
						v323.Enabled = true;
						if player.Status.Team.Value == "Spectator" then
							v323.Enabled = false;
						end;
						v323.Adornee = v319[v320].Character.Head;
						v323.plrname.Text = v319[v320].Name;
						v323.Parent = sP.Parent.Nametags;
						if wkspc.BR.Value == true then
							v323.plrname.TextColor3 = v319[v320].DesignColor.Value.Color;
						end;
					end;
				end;
			end;
		end;
		FixKillFeed();
		look = camera.CFrame.LookVector.y;
		if Humanoid.Sit == true then
			look2 = Camera.CFrame.lookVector - Vector3.new(0, Camera.CFrame.lookVector.Y, 0);
		else
			look2 = nil;
		end;
		if taunting.Value == true or disarmed.Value == true then
			look = 0;
			look2 = nil;
		end;
		if Character and Character.PrimaryPart and Character.PrimaryPart.Position.Y <= -40000 and u22 == false then
			Character:SetPrimaryPartCFrame(game.Workspace.SpectatorBox.SpawnLocation.CFrame * CFrame.new(0, 10, 0));
			l__ReplicatedStorage__6.Events.KillMe:FireServer();
			u22 = true;
			delay(1, function()
				u22 = false;
			end);
		end;
		if look and lastlook then
			if look2 == lastlook2 or lastlook2 ~= nil and look2 ~= nil and (not look2 or not lastlook2 or not (look2:Dot(lastlook2) <= 0.91)) then
				if look ~= lastlook and ((math.abs(look - lastlook) >= 0.09 and taunting.Value == false or taunting.Value == true or disarmed.Value == true) and Humanoid and Player.NRPBS.Health.Value > 0 and Character:FindFirstChild("IsAPlayer") and Character and Character:FindFirstChild("Head")) then
					l__ReplicatedStorage__6.Events.ControlTurn:FireServer(look, look2);
					lastlook2 = look2;
					lastlook = look;
				end;
			elseif Humanoid and Player.NRPBS.Health.Value > 0 and Character:FindFirstChild("IsAPlayer") and Character and Character:FindFirstChild("Head") then
				l__ReplicatedStorage__6.Events.ControlTurn:FireServer(look, look2);
				lastlook2 = look2;
				lastlook = look;
			end;
		end;
	end;
end);
game.ReplicatedStorage.Events.EquipGun.OnClientEvent:connect(function(p84)
	amby:Fire("equipgun", { p84, true });
end);
assign();
setcharacter();
amby.Event:connect(function(p85, p86)
	p86 = p86 == nil and {} or p86;
	if p85 == "mapSkin" then
		mapSkin(unpack(p86));
		return;
	end;
	if p85 == "equipgun" then
		local v324 = false;
		if wkspc.gametype.Value == "Bombfest" then
			v324 = true;
		end;
		if v324 and (player.Status.Level.Value == 33 or player.NRPBS.EquippedTool.Value == p86[1]) then
			return;
		end;
		if v324 and taunting.Value then
			if partnert.Value == true then
				ftauntend.Value = true;
			end;
			if selectedtaunt.Value then
				tauntend.Value = true;
				ftauntend.Value = true;
			else
				jumping.Value = true;
			end;
			while true do
				l__RunService__14.RenderStepped:Wait();
				if not taunting.Value then
					break;
				end;			
			end;
		end;
		if not (not v324) or wkspc.gametype.Value == "Shooting Range" or wkspc.gametype.Value == "Shooting Challenge" or wkspc.gametype.Value == "New Years" then
			local v325 = game.ReplicatedStorage.Weapons:FindFirstChild(p86[1]);
			if v325 then
				if not v324 then
					u16 = p86[1];
				end;
				if v325:FindFirstChild("Melee") then
					melee.Value = p86[1];
					amby:Fire("makeInvisible");
					amby:Fire("updateInventory");
					if equipped.Value == "melee" then
						wep.autoequip();
					end;
				else
					primary.Value = p86[1];
					updtprimary();
					amby:Fire("makeInvisible");
					amby:Fire("updateInventory");
					if equipped.Value == "primary" then
						wep.autoequip();
					end;
				end;
				if p86[2] then
					if v325:FindFirstChild("Melee") then
						primary.Value = "";
					end;
					if v325:FindFirstChild("Melee") then
						local v326 = "melee";
					else
						v326 = "primary";
					end;
					equipped.Value = v326;
					wep.autoequip();
					return;
				end;
			end;
		end;
	else
		if p85 == "colorarm" then
			colorarm(unpack(p86));
			return;
		end;
		if p85 == "inducefalldamage" then
			inducefalldamage(unpack(p86));
			return;
		end;
		if p85 == "disarm" then
			disarm(unpack(p86));
			return;
		end;
		if p85 == "undisarm" then
			undisarm(unpack(p86));
			return;
		end;
		if p85 == "switchspecmode" then
			switchspecmode(unpack(p86));
			return;
		end;
		if p85 == "ToggleTeamSelection" then
			ToggleTeamSelection(unpack(p86));
			return;
		end;
		if p85 == "updateTS" then
			updateTS(unpack(p86));
			return;
		end;
		if p85 == "LevelChanged" then
			LevelChanged(unpack(p86));
			return;
		end;
		if p85 == "playannouncer" then
			playannouncer(unpack(p86));
			return;
		end;
		if p85 == "updtprimary" then
			updtprimary(unpack(p86));
			return;
		end;
		if p85 == "setreviveme" then
			reviveme = p86[1];
			return;
		end;
		if p85 == "setcharacter" then
			setcharacter(unpack(p86));
			return;
		end;
		if p85 == "gotomenu" then
			gotomenu(unpack(p86));
			return;
		end;
		if p85 == "dotaunt" then
			dotaunt(unpack(p86));
			return;
		end;
		if p85 == "loadtaunt" then
			loadtaunt(unpack(p86));
			return;
		end;
		if p85 == "jumpme" then
			jumpme(unpack(p86));
			return;
		end;
		if p85 == "updateAnimations" then
			Animations = p86[1];
		end;
	end;
end);
coroutine.resume(coroutine.create(function()
	while wait(0.0375) do
		v43.Value = v43.Value + 0.001;
		if v43.Value >= 2100000000 then
			v43.Value = -2100000000;
		end;	
	end;
end));
