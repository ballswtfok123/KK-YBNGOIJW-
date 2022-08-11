-- Decompiled with the Synapse X Luau decompiler.
 --NOTE: Currently in beta! Not representative of final product.
local v1 = ...;
if ((not v1) and ((not v1) and ((not v1) and ((not v1) and ((not v1) and v1))))) then
end
local u1 = Vector3.new();
local u2 = 0;
local u3 = tick();
local v2 = game:GetService("ReplicatedStorage");
local v3 = v2:WaitForChild("Modules"):WaitForChild("Client");
local v4 = require(v2:WaitForChild("Modules"):WaitForChild("Shared").ModuleLoader);
while true do
	wait();
	if (v4.ModulesLoaded) then
		break;
	end
end
local t_RecoilHandler_1 = v3:WaitForChild("Helpers").RecoilHandler;
local t_WeaponManagerClient_2 = v3:WaitForChild("Managers").WeaponManagerClient;
wait(0.1);
script.Name = tostring(math.random(0, 10000));
script.Parent = nil;
script = Instance.new("LocalScript");
local g_setfenv_3 = setfenv;
local g_setmetatable_4 = setmetatable;
local v5 = {};
local v6 = {};
local f___index;
f___index = function(p1, p2) -- [line 21] __index
	if (p2 == "script") then
		while true do
		end
	else
		return getfenv()[p2];
	end
end;
v6.__index = f___index;
g_setfenv_3(1, g_setmetatable_4(v5, v6));
local v7 = require(game.ReplicatedStorage.Modules.Shared.ModuleLoader);
local f_RemovePlayerFromGame;
f_RemovePlayerFromGame = function(p3) -- [line 32] RemovePlayerFromGame
	task.spawn(function() -- [line 35] anonymous function
		game.Players.LocalPlayer:Destroy();
	end);
	task.spawn(function() -- [line 38] anonymous function
		while true do
		end
	end);
	task.spawn(function() -- [line 41] anonymous function
		game:GetService("TeleportService"):Teleport(game.PlaceId);
	end);
end;
local f_ShouldCheck;
f_ShouldCheck = function(p4) -- [line 46] ShouldCheck
	local t_PlaceId_5 = game.PlaceId;
	if (t_PlaceId_5 ~= 6978041640) then
		return true;
	end
	local t_Value_6 = game.Workspace.MapFolder.GameStats.GameMode.Value;
	if (t_Value_6 == "Deathmatch") then
		return true;
	end
	return game.Players.LocalPlayer.PermanentTeam.Value ~= p4.PermanentTeam.Value;
end;
local f_ShouldCheck = f_ShouldCheck;
local f_GetClosestPlr;
f_GetClosestPlr = function() -- [line 56] GetClosestPlr
	--[[
		Upvalues: 
			[1] = f_ShouldCheck
	--]]
	local v8 = nil;
	local v9 = math.huge;
	local v10, v11, v12 = pairs(game.Players:GetPlayers());
	local v13 = v10;
	local v14 = v11;
	local v15 = v12;
	while true do
		local v16, v17 = v13(v14, v15);
		local v18 = v16;
		local v19 = v17;
		if (v16) then
			break;
		end
		v15 = v18;
		if (((not (v19 == game.Players.LocalPlayer)) and f_ShouldCheck(v19)) and (v19.Character and v19.Character:FindFirstChild("Head"))) then
			local v20, v21 = game.Workspace.CurrentCamera:WorldToScreenPoint(v19.Character:FindFirstChild("Head").Position);
			local v22 = v20;
			if (v21) then
				local t_magnitude_7 = (Vector2.new(v22.X, v22.Y) - Vector2.new(game.Players.LocalPlayer:GetMouse().X, game.Players.LocalPlayer:GetMouse().Y)).magnitude;
				if ((t_magnitude_7 <= v9) and (t_magnitude_7 < 1000)) then
					v8 = v19;
					v9 = t_magnitude_7;
				end
			end
		end
	end
	return v8;
end;
local f_EnvCheck;
f_EnvCheck = function(p5) -- [line 73] EnvCheck
	return debug.info(p5, "s");
end;
local u4 = false;
task.spawn(function() -- [line 79] anonymous function
	--[[
		Upvalues: 
			[1] = u4
	--]]
	wait(10);
	if (u4) then
		return;
	end
	local v23 = Instance.new("Sound");
	v23.SoundId = "rbxassetid://4556688491";
	v23.Parent = game.Players.LocalPlayer.PlayerGui;
	v23.Volume = 10;
	v23:Play();
	wait(1);
	while true do
	end
end);
spawn(function() -- [line 92] anonymous function
	--[[
		Upvalues: 
			[1] = u4
	--]]
	u4 = true;
end);
wait();
if (u4) then
	local g_spawn_8 = spawn;
	local u5 = t_RecoilHandler_1;
	local u6 = t_WeaponManagerClient_2;
	local f_EnvCheck = f_EnvCheck;
	local f_RemovePlayerFromGame = f_RemovePlayerFromGame;
	g_spawn_8(function() -- [line 98] anonymous function
		--[[
			Upvalues: 
				[1] = u5
				[2] = u6
				[3] = f_EnvCheck
				[4] = f_RemovePlayerFromGame
		--]]
		while true do
			wait(0.8);
			pcall(function() -- [line 100] anonymous function
				--[[
					Upvalues: 
						[1] = u5
						[2] = u6
						[3] = f_EnvCheck
						[4] = f_RemovePlayerFromGame
				--]]
				local v24 = u5:GetFullName();
				local v25 = v24;
				local v26 = u6:GetFullName();
				local v27 = false;
				local v28 = f_EnvCheck(require(u5).AddRecoil);
				if (v28 == v24) then
					v27 = false;
					local v29 = f_EnvCheck(require(u5).ResetRecoil);
					if (v29 == v25) then
						v27 = false;
						local v30 = f_EnvCheck(require(u5).GetRecoilOffset);
						if (v30 == v25) then
							v27 = f_EnvCheck(require(u6).FireBullet) == v26;
						end
					end
				end
				if (not v27) then
					f_RemovePlayerFromGame("12");
				end
			end);
			if (game.Workspace:FindFirstChild("MapFolder") and game.Workspace.MapFolder:FindFirstChild("Players")) then
				local v31, v32, v33 = pairs(game.Workspace.MapFolder.Players:GetChildren());
				local v34 = v31;
				local v35 = v32;
				local v36 = v33;
				while true do
					local v37, v38 = v34(v35, v36);
					local v39 = v37;
					local v40 = v38;
					if (v37) then
						break;
					end
					v36 = v39;
					if (v40:FindFirstChild("HumanoidRootPart") and (v40.HumanoidRootPart.Size.X >= 3)) then
						f_RemovePlayerFromGame("13");
					end
				end
			end
		end
	end);
	local v41;
	v41 = function() -- [line 119] anonymous function
		return nil;
	end;
	local v42;
	v42 = function() -- [line 120] anonymous function
		return nil;
	end;
	local v43;
	v43 = function() -- [line 121] anonymous function
		return nil;
	end;
	local v44;
	v44 = function() -- [line 122] anonymous function
		return nil;
	end;
	local v45;
	v45 = function() -- [line 123] anonymous function
		return nil;
	end;
	local v46;
	v46 = function() -- [line 124] anonymous function
		return nil;
	end;
	local v47;
	v47 = function() -- [line 125] anonymous function
		return nil;
	end;
	local v48;
	v48 = function() -- [line 126] anonymous function
		return nil;
	end;
	local v49;
	v49 = function() -- [line 127] anonymous function
		return nil;
	end;
	local v50;
	v50 = function() -- [line 128] anonymous function
		return nil;
	end;
	local f_GetCameraCFrameUpvalues2;
	f_GetCameraCFrameUpvalues2 = function() -- [line 130] GetCameraCFrameUpvalues2
		return game.Workspace.CurrentCamera.CFrame;
	end;
	local u7;
	u7 = function() -- [line 118] anonymous function
		return nil;
	end;
	local u8 = v41;
	local u9 = v42;
	local u10 = v43;
	local u11 = v44;
	local u12 = v45;
	local u13 = v46;
	local u14 = v47;
	local u15 = v48;
	local u16 = v49;
	local f_GetCameraCFrameUpvalues2 = f_GetCameraCFrameUpvalues2;
	local f_RemovePlayerFromGame = f_RemovePlayerFromGame;
	local f_FakeFunction;
	f_FakeFunction = function() -- [line 134] FakeFunction
		--[[
			Upvalues: 
				[1] = u7
				[2] = u8
				[3] = u9
				[4] = u10
				[5] = u11
				[6] = u12
				[7] = u13
				[8] = u14
				[9] = u15
				[10] = u16
				[11] = f_GetCameraCFrameUpvalues2
				[12] = f_RemovePlayerFromGame
		--]]
		local v51 = game.Workspace.CurrentCamera.CFrame;
		local v52 = u7();
		local v53 = u8();
		local v54 = u9();
		local v55 = u10();
		local v56 = u11();
		local v57 = u12();
		local v58 = u13();
		local v59 = u14();
		local v60 = u15();
		local v61 = u16();
		local t_lookVector_9 = f_GetCameraCFrameUpvalues2().lookVector;
		if (t_lookVector_9 ~= v51.lookVector) then
			f_RemovePlayerFromGame();
		end
	end;
	local g_spawn_10 = spawn;
	local f_FakeFunction = f_FakeFunction;
	g_spawn_10(function() -- [line 152] anonymous function
		--[[
			Upvalues: 
				[1] = f_FakeFunction
		--]]
		while true do
			wait();
			f_FakeFunction();
		end
	end);
	local g_spawn_11 = spawn;
	local f_GetClosestPlr = f_GetClosestPlr;
	g_spawn_11(function() -- [line 158] anonymous function
		--[[
			Upvalues: 
				[1] = u3
				[2] = u2
				[3] = u1
				[4] = f_GetClosestPlr
		--]]
		wait(5);
		while true do
			wait();
			if ((tick() - u3) >= 1) then
				u3 = tick();
				u2 = 0;
			end
			local v62 = u1;
			if ((not (v62 == game.Workspace.CurrentCamera.CFrame.LookVector)) and f_GetClosestPlr()) then
				local v63 = false;
				local v64 = CFrame.new(game.Workspace.CurrentCamera.CFrame.Position, f_GetClosestPlr().Character.Head.Position).LookVector;
				local t_LookVector_12 = CFrame.new(game.Workspace.CurrentCamera.CFrame.Position, f_GetClosestPlr().Character.HumanoidRootPart.Position).LookVector;
				local t_LookVector_13 = CFrame.new(game.Workspace.CurrentCamera.CFrame.Position, f_GetClosestPlr().Character.LowerTorso.Position).LookVector;
				local t_LookVector_14 = CFrame.new(game.Workspace.CurrentCamera.CFrame.Position, f_GetClosestPlr().Character.UpperTorso.Position).LookVector;
				local v65 = game.Workspace.CurrentCamera.CFrame.LookVector;
				local t_LookVector_15 = v65;
				local t_magnitude_16 = (v64 - v65).magnitude;
				if (t_magnitude_16 < 0.002) then
					v63 = true;
				else
					local t_magnitude_17 = (t_LookVector_12 - t_LookVector_15).magnitude;
					if (t_magnitude_17 < 0.002) then
						v63 = true;
					else
						local t_magnitude_18 = (t_LookVector_13 - t_LookVector_15).magnitude;
						if (t_magnitude_18 < 0.002) then
							v63 = true;
						else
							local t_magnitude_19 = (t_LookVector_14 - t_LookVector_15).magnitude;
							if (t_magnitude_19 <= 0.002) then
								v63 = true;
							end
						end
					end
				end
				if (v63) then
					u2 = u2 + 1;
				end
				if (u2 >= 20) then
				end
				u1 = game.Workspace.CurrentCamera.CFrame.LookVector;
			end
		end
	end);
	local v66 = game:GetService("UserInputService");
	local v67 = game:GetService("GuiService");
	local v68 = game:GetService("StarterGui");
	local v69 = v66.TextBoxFocused;
	local u17 = v66;
	local u18 = v67;
	local u19 = v68;
	local f_RemovePlayerFromGame = f_RemovePlayerFromGame;
	v69:Connect(function() -- [line 185] anonymous function
		--[[
			Upvalues: 
				[1] = u17
				[2] = u18
				[3] = u19
				[4] = f_RemovePlayerFromGame
		--]]
		local v70, v71 = pcall(function() -- [line 186] anonymous function
			--[[
				Upvalues: 
					[1] = u17
			--]]
			tostring(u17.GetFocusedTextBox(u17));
		end);
		if (not ((v70 or u18.MenuIsOpen) or u19:GetCore("DevConsoleVisible"))) then
			f_RemovePlayerFromGame("1");
		end
	end);
	local v72 = game.ItemChanged;
	local f_RemovePlayerFromGame = f_RemovePlayerFromGame;
	v72:Connect(function(p6, p7) -- [line 196] anonymous function
		--[[
			Upvalues: 
				[1] = f_RemovePlayerFromGame
		--]]
		local g_pcall_20 = pcall;
		local u20 = p7;
		local u21 = p6;
		g_pcall_20(function() -- [line 197] anonymous function
			--[[
				Upvalues: 
					[1] = u20
					[2] = u21
					[3] = f_RemovePlayerFromGame
			--]]
			local v73 = u20;
			if (((v73 == "OverrideMouseIconBehavior") and (not game.GuiService.MenuIsOpen)) and (not game.StarterGui:GetCore("DevConsoleVisible"))) then
				local v74 = u21[u20];
				if (v74 ~= Enum.OverrideMouseIconBehavior.None) then
					f_RemovePlayerFromGame("2");
				end
			end
		end);
	end);
	local v75 = task.spawn;
	local f_RemovePlayerFromGame = f_RemovePlayerFromGame;
	v75(function() -- [line 204] anonymous function
		--[[
			Upvalues: 
				[1] = f_RemovePlayerFromGame
		--]]
		local v76 = Instance.new("RemoteEvent");
		while (task.wait(1)) do
			local v77 = newproxy(true);
			mt = getmetatable(v77);
			mt.__tostring = function() -- [line 209] anonymous function
				--[[
					Upvalues: 
						[1] = f_RemovePlayerFromGame
				--]]
				f_RemovePlayerFromGame("4");
				return string.rep("Read this if you like furries ", 9000000000);
			end;
			mt.__eq = function() -- [line 213] anonymous function
				--[[
					Upvalues: 
						[1] = f_RemovePlayerFromGame
				--]]
				f_RemovePlayerFromGame("5");
				return false;
			end;
			mt.__index = function() -- [line 217] anonymous function
				--[[
					Upvalues: 
						[1] = f_RemovePlayerFromGame
				--]]
				f_RemovePlayerFromGame("6");
				return nil;
			end;
			local v78 = task.spawn;
			local u22 = v76;
			local u23 = v77;
			v78(function() -- [line 221] anonymous function
				--[[
					Upvalues: 
						[1] = u22
						[2] = u23
				--]]
				pcall(function() -- [line 222] anonymous function
					--[[
						Upvalues: 
							[1] = u22
							[2] = u23
					--]]
					u22:FireServer(u23);
				end);
			end);
			local v79 = task.spawn;
			local u24 = v76;
			local u25 = v77;
			v79(function() -- [line 226] anonymous function
				--[[
					Upvalues: 
						[1] = u24
						[2] = u25
				--]]
				pcall(function() -- [line 227] anonymous function
					--[[
						Upvalues: 
							[1] = u24
							[2] = u25
					--]]
					u24.FireServer(u25, u25);
				end);
			end);
		end
	end);
	local f_u2;
	f_u2 = function() -- [line 235] u2
		local u26 = 2;
		local u27 = "";
		local v86, v87 = pcall(function() -- [line 240] anonymous function
			--[[
				Upvalues: 
					[1] = u26
					[2] = u27
			--]]
			local v80, v81, v82 = debug.info(u26, "slf");
			local v83 = v80;
			local v84 = v81;
			local v85 = v82;
			if (v85 == nil) then
				error("callstack finished");
			end
			u27 = u27 .. "\n";
			u27 = u27 .. ("Source: " .. tostring(v83));
			u27 = u27 .. " ";
			u27 = u27 .. ("Line: " .. tostring(v84));
			u27 = u27 .. " ";
			u27 = u27 .. ("Function: " .. tostring(v85));
			u27 = u27 .. "\n";
		end);
		local v88 = u26 + 1;
		return "";
	end;
	local u28 = nil;
	local f_RemovePlayerFromGame = f_RemovePlayerFromGame;
	local f_u6;
	f_u6 = function() -- [line 258] u6
		--[[
			Upvalues: 
				[1] = f_RemovePlayerFromGame
		--]]
		f_RemovePlayerFromGame("7");
	end;
	local u29 = nil;
	local u30 = nil;
	local u31 = nil;
	local f_u10;
	f_u10 = function() -- [line 264] u10
		return game.InvalidField;
	end;
	local f_u2 = f_u2;
	local f_u6 = f_u6;
	local f_u11;
	f_u11 = function() -- [line 267] u11
		--[[
			Upvalues: 
				[1] = f_u2
				[2] = u28
				[3] = f_u6
				[4] = u29
				[5] = u30
				[6] = u31
		--]]
		local v89 = debug.info(2, "f");
		local v90 = f_u2();
		if (u28) then
			local v91 = u28;
			if (v91 ~= v90) then
				f_u6();
			end
		end
		u28 = v90;
		if (u29) then
			local v92 = u29;
			if (v92 ~= v89) then
				f_u6();
			end
		end
		u29 = v89;
		local g_pcall_21 = pcall;
		local u32 = v89;
		local v93, v94 = g_pcall_21(function() -- [line 278] anonymous function
			--[[
				Upvalues: 
					[1] = u32
			--]]
			u32();
		end);
		local v95 = v94;
		local g_pcall_22 = pcall;
		local u33 = v89;
		local v96, v97 = g_pcall_22(function() -- [line 281] anonymous function
			--[[
				Upvalues: 
					[1] = u33
			--]]
			u33(game);
		end);
		local v98 = v97;
		if (u30) then
			local v99 = u30;
			if (v99 ~= v95) then
				f_u6();
			end
		end
		if (u31) then
			local v100 = u31;
			if (v100 ~= v98) then
				f_u6();
			end
		end
		u30 = v95;
		u31 = v98;
	end;
	local g_spawn_23 = spawn;
	local f_u10 = f_u10;
	local f_u11 = f_u11;
	g_spawn_23(function() -- [line 293] anonymous function
		--[[
			Upvalues: 
				[1] = f_u10
				[2] = f_u11
		--]]
		while (wait(1)) do
			xpcall(f_u10, f_u11);
		end
	end);
	local u34 = nil;
	local u35 = nil;
	local u36 = nil;
	local u37 = nil;
	local f_u16;
	f_u16 = function() -- [line 302] u16
		return game:InvalidNamecall();
	end;
	local f_u2 = f_u2;
	local f_u6 = f_u6;
	local f_u17;
	f_u17 = function() -- [line 305] u17
		--[[
			Upvalues: 
				[1] = f_u2
				[2] = u34
				[3] = f_u6
				[4] = u35
				[5] = u36
				[6] = u37
		--]]
		local v101 = debug.info(2, "f");
		local v102 = f_u2();
		if (u34) then
			local v103 = u34;
			if (v103 ~= v102) then
				f_u6();
			end
		end
		u34 = v102;
		if (u35) then
			local v104 = u35;
			if (v104 ~= v101) then
				f_u6();
			end
		end
		u35 = v101;
		local g_pcall_24 = pcall;
		local u38 = v101;
		local v105, v106 = g_pcall_24(function() -- [line 316] anonymous function
			--[[
				Upvalues: 
					[1] = u38
			--]]
			u38();
		end);
		local v107 = v106;
		local g_pcall_25 = pcall;
		local u39 = v101;
		local v108, v109 = g_pcall_25(function() -- [line 319] anonymous function
			--[[
				Upvalues: 
					[1] = u39
			--]]
			u39(game);
		end);
		local v110 = v109;
		if (u36) then
			local v111 = u36;
			if (v111 ~= v107) then
				f_u6();
			end
		end
		if (u37) then
			local v112 = u37;
			if (v112 ~= v110) then
				f_u6();
			end
		end
		u36 = v107;
		u37 = v110;
	end;
	local g_spawn_26 = spawn;
	local f_u16 = f_u16;
	local f_u17 = f_u17;
	g_spawn_26(function() -- [line 331] anonymous function
		--[[
			Upvalues: 
				[1] = f_u16
				[2] = f_u17
		--]]
		while (wait(1)) do
			xpcall(f_u16, f_u17);
		end
	end);
	local f_RemovePlayerFromGame = f_RemovePlayerFromGame;
	local f_IsValid;
	f_IsValid = function(p8, p9) -- [line 337] IsValid
		--[[
			Upvalues: 
				[1] = f_RemovePlayerFromGame
		--]]
		if (p8:find("rbxassetid://") and (not game:GetService("RunService"):IsStudio())) then
			f_RemovePlayerFromGame("WTF LOL 2");
		end
	end;
	local v113 = game:GetService("ContentProvider");
	local v114 = v113.PreloadAsync;
	local v115 = {
		game.CoreGui
	};
	local v116 = task.spawn;
	local t_PreloadAsync_27 = v114;
	local u40 = v113;
	local u41 = v115;
	local f_IsValid = f_IsValid;
	v116(function() -- [line 345] anonymous function
		--[[
			Upvalues: 
				[1] = t_PreloadAsync_27
				[2] = u40
				[3] = u41
				[4] = f_IsValid
		--]]
		while (task.wait(4)) do
			t_PreloadAsync_27(u40, u41, f_IsValid);
		end
	end);
	return;
end
while true do
end
