-- Decompiled with the Synapse X Luau decompiler.
 --NOTE: Currently in beta! Not representative of final product.
 local v1 = {};
 v1.Spectating = false;
 v1.SpectatingIndex = 1;
 local t_LocalPlayer_1 = game.Players.LocalPlayer;
 local v2 = t_LocalPlayer_1:GetMouse();
 local t_Camera_2 = workspace.Camera;
 local t_Assets_3 = game.ReplicatedStorage.Assets;
 local u1 = t_LocalPlayer_1:WaitForChild("PlayerGui"):WaitForChild("MainUI");
 local u2 = t_LocalPlayer_1:WaitForChild("PlayerGui"):WaitForChild("SecondaryUI");
 local v3 = t_LocalPlayer_1:WaitForChild("PlayerGui"):WaitForChild("OverallGame");
 local v4 = t_LocalPlayer_1:WaitForChild("PlayerGui"):WaitForChild("MapVote");
 local v5 = t_LocalPlayer_1:WaitForChild("PlayerGui"):WaitForChild("GameResults");
 local v6 = u1.CharacterFrame;
 local v7 = u1.Spectate;
 local v8 = u1.BombPlant;
 local v9 = u1.BombCarrier;
 local v10 = u1.WeaponInfo;
 local v11 = u1["Abilities/Utillites"];
 local v12 = workspace.MapFolder;
 local v13 = v12.GameStats;
 local t_Value_4 = v13.GameMode.Value;
 local v14 = game:GetService("RunService");
 local v15 = game:GetService("UserInputService");
 local u3 = game:GetService("ReplicatedStorage");
 local v16 = game:GetService("TweenService");
 local v17 = require(game.ReplicatedStorage.Modules.Shared.ModuleLoader);
 local u4 = v17:LoadModule("Network");
 local u5 = v17:LoadModule("Clean");
 local u6 = v17:LoadModule("WeaponManagerClient");
 local u7 = v17:LoadModule("UIManager");
 local u8 = v17:LoadModule("WeaponInfo");
 local u9 = v17:LoadModule("SoundManager");
 local v18 = v17:LoadModule("SharedMemory");
 local v19 = v17:LoadModule("CreateSpring");
 local u10 = v17:LoadModule("ViewportDistance");
 local u11 = v17:LoadModule("AttributesHandler");
 local v20 = v17:LoadModule("CharacterSelectionManager");
 local u12 = v17:LoadModule("CharacterData");
 local u13 = v17:LoadModule("SkinData");
 local v21 = v17:LoadModule("InventoryHandler");
 local u14 = v17:LoadModule("EventHandler");
 local u15 = require(game.ReplicatedStorage.BAC.Characters);
 local u16 = nil;
 local u17 = nil;
 local f_GetPlayersToSpectate;
 f_GetPlayersToSpectate = function(p1) -- [line 57] GetPlayersToSpectate
     --[[
         Upvalues: 
             [1] = u5
             [2] = t_LocalPlayer_1
     --]]
     local v22 = 0;
     local v23, v24, v25 = pairs(game.Players:GetPlayers());
     local v26 = v23;
     local v27 = v24;
     local v28 = v25;
     while true do
         local v29, v30 = v26(v27, v28);
         local v31 = v29;
         local v32 = v30;
         if (v29) then
             break;
         end
         v28 = v31;
         if (u5:IsAlive(v32) and (not (v32 == t_LocalPlayer_1))) then
             local t_Value_5 = v32.PermanentTeam.Value;
             if (t_Value_5 == t_LocalPlayer_1.PermanentTeam.Value) then
                 v22 = v22 + 1;
             end
         end
     end
     return v22;
 end;
 v1.GetPlayersToSpectate = f_GetPlayersToSpectate;
 local f_SetVisible;
 f_SetVisible = function(p2, p3) -- [line 69] SetVisible
     --[[
         Upvalues: 
             [1] = u3
     --]]
     if (p2.SpectatingTransparency) then
         local v33, v34, v35 = pairs(p2.SpectatingTransparency);
         local v36 = v33;
         local v37 = v34;
         local v38 = v35;
         while true do
             local v39, v40 = v36(v37, v38);
             local v41 = v39;
             local v42 = v40;
             if (v39) then
                 break;
             end
             v38 = v41;
             if (v41.Parent) then
                 local t_Type_6 = v42.Type;
                 if (t_Type_6 == "Texture") then
                     v41.Parent = v42.Parent;
                 else
                     local t_Type_7 = v42.Type;
                     if (t_Type_7 == "Part") then
                         v41.Transparency = v42.Transparency;
                     else
                         local t_Type_8 = v42.Type;
                         if (t_Type_8 ~= "SurfaceGui") then
                             local t_Type_9 = v42.Type;
                             if (t_Type_9 ~= "PointLight") then
                                 local t_Type_10 = v42.Type;
                                 if (t_Type_10 ~= "ParticleEmitter") then
                                     continue;
                                 end
                             end
                         end
                         v41.Enabled = v42.Enabled;
                     end
                 end
             else
                 p2.SpectatingTransparency[v41] = nil;
             end
         end
     end
     p2.SpectatingTransparency = {};
     if (not p3) then
         return;
     end
     local v43, v44, v45 = pairs(p3:GetDescendants());
     local v46 = v43;
     local v47 = v44;
     local v48 = v45;
     while true do
         local v49, v50 = v46(v47, v48);
         local v51 = v49;
         local v52 = v50;
         if (v49) then
             break;
         end
         v48 = v51;
         if (v52:IsA("BasePart")) then
             local v53 = p2.SpectatingTransparency;
             local v54 = {};
             v54.Type = "Part";
             v54.Transparency = v52.Transparency;
             v53[v52] = v54;
             v52.Transparency = 1;
         else
             local t_ClassName_11 = v52.ClassName;
             if (t_ClassName_11 == "SurfaceAppearance") then
                 local v55 = p2.SpectatingTransparency;
                 local v56 = {};
                 v56.Type = "Texture";
                 v56.Parent = v52.Parent;
                 v55[v52] = v56;
                 v52.Parent = u3.ClientCache;
             else
                 local t_ClassName_12 = v52.ClassName;
                 if (t_ClassName_12 ~= "SurfaceGui") then
                     local t_ClassName_13 = v52.ClassName;
                     if (t_ClassName_13 ~= "PointLight") then
                         local t_ClassName_14 = v52.ClassName;
                         if (t_ClassName_14 ~= "ParticleEmitter") then
                             continue;
                         end
                     end
                 end
                 local v57 = p2.SpectatingTransparency;
                 local v58 = {};
                 v58.Type = v52.ClassName;
                 v58.Enabled = v52.Enabled;
                 v57[v52] = v58;
                 v52.Enabled = false;
             end
         end
     end
 end;
 v1.SetVisible = f_SetVisible;
 local f_StopAnimation;
 f_StopAnimation = function(p4, p5, p6) -- [line 120] StopAnimation
     if ((p6 == "Idle") or (p6 == "AimIdle")) then
         return;
     end
     local v59, v60, v61 = pairs(p5.AnimationController:GetPlayingAnimationTracks());
     local v62 = v59;
     local v63 = v60;
     local v64 = v61;
     while true do
         local v65, v66 = v62(v63, v64);
         local v67 = v65;
         local v68 = v66;
         if (v65) then
             return;
         end
         v64 = v67;
         local t_Name_15 = v68.Name;
         if (t_Name_15 == p6) then
             v68:Stop();
             return;
         end
     end
 end;
 v1.StopAnimation = f_StopAnimation;
 local f_PlayAnimation;
 f_PlayAnimation = function(p7, p8, p9) -- [line 134] PlayAnimation
     --[[
         Upvalues: 
             [1] = u9
             [2] = u6
     --]]
     if (not p8:FindFirstChild("AnimationController")) then
         return;
     end
     local v69, v70, v71 = pairs(p8.AnimationController:GetPlayingAnimationTracks());
     local v72 = v69;
     local v73 = v70;
     local v74 = v71;
     while true do
         local v75, v76 = v72(v73, v74);
         local v77 = v75;
         local v78 = v76;
         if (v75) then
             break;
         end
         v74 = v77;
         local t_Name_16 = v78.Name;
         if (t_Name_16 ~= "Idle") then
             v78:Stop();
         end
     end
     if (p9 == "AimIdle") then
         return;
     end
     local v79 = false;
     local v80 = p7.SpectatingViewModel.Animations[p9];
     local v81 = v80;
     local v82 = p8.AnimationController:LoadAnimation(v80);
     local v83 = v82;
     local t_Name_17 = v82.Name;
     local v84;
     if (t_Name_17 == "Equip") then
         v79 = true;
     else
         local t_Name_18 = v83.Name;
         if (t_Name_18 == "Idle") then
             v79 = true;
         else
             v84 = 0.1;
         end
     end
     if (v79) then
         v84 = 0;
     end
     local v85 = v81:FindFirstChild("Speed");
     if (v85) then
         v85 = v81.Speed.Value;
     end
     v83:Play(v84, nil, v85);
     u9:ConnectWeaponSound(v83, nil, p8.Name, p7.SpectatingWeaponData.Skin);
     u6:ConnectAnimationMarkers(v83, p8);
 end;
 v1.PlayAnimation = f_PlayAnimation;
 local f_NewWeapon;
 f_NewWeapon = function(p10, p11, p12) -- [line 157] NewWeapon
     --[[
         Upvalues: 
             [1] = u14
             [2] = u11
             [3] = t_Camera_2
             [4] = u13
             [5] = t_Assets_3
             [6] = u5
             [7] = u15
             [8] = u7
     --]]
     local v86 = u14;
     local u18 = p10;
     local u19 = p11;
     local u20 = p12;
     v86:Wrap(function() -- [line 158] anonymous function
         --[[
             Upvalues: 
                 [1] = u18
                 [2] = u19
                 [3] = u11
                 [4] = t_Camera_2
                 [5] = u13
                 [6] = t_Assets_3
                 [7] = u5
                 [8] = u20
                 [9] = u15
                 [10] = u7
         --]]
         local t_SpectatingPlayer_19 = u18.SpectatingPlayer;
         while true do
             if (u18.SpectatingData.Inventory) then
                 if (t_SpectatingPlayer_19 == u18.SpectatingPlayer) then
                     break;
                 end
                 return;
             end
             if (u18.Spectating) then
                 task.wait();
             else
                 return;
             end
         end
         if (u18.SpectatingViewModel and u18.SpectatingViewModel.Parent) then
             u18.SpectatingViewModel:Destroy();
         end
         u18.SpectatingWeaponData = u19;
         u18.SpectatingViewModel = u11:GetWeapon(u19.Weapon, u19.Skin).ViewModel:Clone();
         u18.SpectatingViewModel.Name = u19.Weapon;
         u18.SpectatingViewModel.Parent = t_Camera_2;
         local v87 = u11:GetCustomSkin(u19.Weapon, u19.Skin).ViewModel;
         local v88 = {};
         v88.RotationOffset = true;
         v88.Offset = true;
         v88.AimOffset = true;
         v88.Animations = true;
         v88.CameraShake = true;
         v88.AttributeOffsets = true;
         local v89, v90, v91 = pairs(v87:GetChildren());
         local v92 = v89;
         local v93 = v90;
         local v94 = v91;
         while true do
             local v95, v96 = v92(v93, v94);
             local v97 = v95;
             local v98 = v96;
             if (v95) then
                 break;
             end
             v94 = v97;
             if (v88[v98.Name]) then
                 local v99 = v98.Name;
                 if (u18.SpectatingViewModel:FindFirstChild(v98.Name)) then
                     u18.SpectatingViewModel[v98.Name]:Destroy();
                 end
                 (v98:Clone()).Parent = u18.SpectatingViewModel;
             end
         end
         if (u19.Attributes) then
             local v100, v101, v102 = pairs(u19.Attributes);
             local v103 = v100;
             local v104 = v101;
             local v105 = v102;
             local v108;
             while true do
                 local v106, v107 = v103(v104, v105);
                 v108 = v106;
                 local v109 = v107;
                 if (v106) then
                     break;
                 end
                 v105 = v108;
                 if (u13.Attributes.BulletEffects.Types[v108] and v109.Enabled) then
                     break;
                 end
             end
             u18.SpectatingViewModel.Object.Muzzle.MuzzleEffects:ClearAllChildren();
             local v110, v111, v112 = pairs(t_Assets_3.Attributes.BulletEffects[v108:sub(1, (#v108) - 7) .. "Effect"]:GetDescendants());
             local v113 = v110;
             local v114 = v111;
             local v115 = v112;
             while true do
                 local v116, v117 = v113(v114, v115);
                 local v118 = v116;
                 local v119 = v117;
                 if (v116) then
                     break;
                 end
                 v115 = v118;
                 local t_ClassName_20 = v119.ClassName;
                 if (t_ClassName_20 == "ParticleEmitter") then
                     v119.Enabled = false;
                     (v119:Clone()).Parent = u18.SpectatingViewModel.Object.Muzzle.MuzzleEffects;
                 end
             end
         end
         u11:ApplyAttributes(u18.SpectatingViewModel.Object, u19.Weapon, u19.Skin, u19.Attributes);
         if (u18.SpectatingViewModel.Object:FindFirstChild("Dagger1")) then
             local v120, v121, v122 = pairs(u18.SpectatingViewModel.Object:GetDescendants());
             local v123 = v120;
             local v124 = v121;
             local v125 = v122;
             while true do
                 local v126, v127 = v123(v124, v125);
                 local v128 = v126;
                 local v129 = v127;
                 if (v126) then
                     break;
                 end
                 v125 = v128;
                 if (v129:IsA("BasePart")) then
                     local t_Name_21 = v129.Name;
                     if (t_Name_21 == "Blade") then
                         u11:ApplyGlowEffect(v129);
                     end
                 end
             end
         end
         if (game.ReplicatedStorage.Characters:FindFirstChild(u18.SpectatingPlayer.CharacterName.Value)) then
             local v130 = game.ReplicatedStorage.Characters[u18.SpectatingPlayer.CharacterName.Value];
             local v131 = v130;
             local v132, v133, v134 = pairs(v130.Arms:GetChildren());
             local v135 = v132;
             local v136 = v133;
             local v137 = v134;
             while true do
                 local v138, v139 = v135(v136, v137);
                 local v140 = v138;
                 local v141 = v139;
                 if (v138) then
                     break;
                 end
                 v137 = v140;
                 local t_BaseArm_22 = v141.BaseArm;
                 local v142 = u18.SpectatingViewModel.Arms[v141.Name]:GetChildren()[1];
                 local v143, v144, v145 = pairs(v141:GetChildren());
                 local v146 = v143;
                 local v147 = v144;
                 local v148 = v145;
                 while true do
                     local v149, v150 = v146(v147, v148);
                     local v151 = v149;
                     local v152 = v150;
                     if (v149) then
                         break;
                     end
                     v148 = v151;
                     local t_Name_23 = v152.Name;
                     if (t_Name_23 == "CharacterClothing") then
                         local v153 = t_BaseArm_22.CFrame:ToObjectSpace(v152.CFrame);
                         local v154 = v152:Clone();
                         v154.CanCollide = false;
                         v154.CanTouch = false;
                         v154.Anchored = false;
                         v154.Massless = true;
                         v154.CFrame = v142.CFrame * v153;
                         v154.Parent = v142;
                         u5:WeldBetween(v142, v154);
                     end
                 end
             end
             u18.SpectatingViewModel.Arms.Left["Left Arm"].Color = v131.Character.StarterCharacter.LeftUpperArm.Color;
             u18.SpectatingViewModel.Arms.Right["Right Arm"].Color = v131.Character.StarterCharacter.RightUpperArm.Color;
         end
         u18:PlayAnimation(u18.SpectatingViewModel, "Idle");
         if (u20) then
             u18:PlayAnimation(u18.SpectatingViewModel, "Equip");
         end
         u18:SetVisible(u15.GetCharacter(u18.SpectatingPlayer));
         u7:AddWeaponToViewport(true, u18.SpectatingData.Inventory, u18.SpectatingData.CurrentWeaponData, u18.SpectatingData.EquippedWeapon);
     end);
 end;
 v1.NewWeapon = f_NewWeapon;
 local f_SelectPlayer;
 f_SelectPlayer = function(p13) -- [line 276] SelectPlayer
     --[[
         Upvalues: 
             [1] = u5
             [2] = t_LocalPlayer_1
             [3] = u15
             [4] = u4
     --]]
     if (u5:IsAlive() and (not p13.AdminSpectating)) then
         local t_Value_24 = t_LocalPlayer_1.PermanentTeam.Value;
         if (t_Value_24 ~= "Team3") then
             return;
         end
     end
     if (p13.AdminSpectating) then
         local v155 = {};
         v155.RedDotVisible = false;
         v155.AimDifference = 1;
         v155.CrouchAmount = 0;
         v155.SpectatingStarted = true;
         v155.CameraOffset = CFrame.new();
         v155.ViewModelCFrame = CFrame.new();
         p13.SpectatingData = v155;
         p13.LastUpdate = nil;
         return;
     end
     local v156 = 1;
     local v157, v158, v159 = pairs(game.Players:GetPlayers());
     local v160 = v157;
     local v161 = v158;
     local v162 = v159;
     local v166;
     while true do
         local v163, v164 = v160(v161, v162);
         local v165 = v163;
         v166 = v164;
         if (v163) then
             p13.SpectatingPlayer = nil;
             return;
         end
         v162 = v165;
         if (u5:IsAlive(v166)) then
             local t_Value_25 = v166.PermanentTeam.Value;
             if (((t_Value_25 == t_LocalPlayer_1.PermanentTeam.Value) and (not (v166 == t_LocalPlayer_1))) and u15.GetCharacter(v166):FindFirstChild("Weapon")) then
                 local t_SpectatingIndex_26 = p13.SpectatingIndex;
                 if (t_SpectatingIndex_26 == v156) then
                     break;
                 end
                 v156 = v156 + 1;
             end
         end
     end
     p13.SpectatingPlayer = v166;
     local v167 = {};
     v167.RedDotVisible = false;
     v167.AimDifference = 1;
     v167.CrouchAmount = 0;
     v167.SpectatingStarted = true;
     v167.CameraOffset = CFrame.new();
     v167.ViewModelCFrame = CFrame.new();
     p13.SpectatingData = v167;
     p13.LastUpdate = nil;
     if (not p13.AdminSpectating) then
         u4:FireServer("Spectate", v166);
     end
 end;
 v1.SelectPlayer = f_SelectPlayer;
 local f_Scroll;
 f_Scroll = function(p14, p15, p16) -- [line 365] Scroll
     --[[
         Upvalues: 
             [1] = u1
     --]]
     if (not ((p14.Spectating and (not p14.AdminSpectating)) and (not u1.LargeMapFrame.Visible))) then
         return;
     end
     local t_SpectatingIndex_27 = p14.SpectatingIndex;
     p14.SpectatingIndex = p14.SpectatingIndex + p15;
     local v168 = p14:GetPlayersToSpectate();
     local t_SpectatingIndex_28 = p14.SpectatingIndex;
     if (t_SpectatingIndex_28 < 0) then
         p14.SpectatingIndex = v168;
     else
         if (v168 <= p14.SpectatingIndex) then
             p14.SpectatingIndex = 1;
         end
     end
     local t_SpectatingIndex_29 = p14.SpectatingIndex;
     if (not ((t_SpectatingIndex_29 == t_SpectatingIndex_27) and (not p16))) then
         p14:SelectPlayer();
     end
 end;
 v1.Scroll = f_Scroll;
 local f_PlayerDied;
 f_PlayerDied = function(p17) -- [line 385] PlayerDied
     --[[
         Upvalues: 
             [1] = t_Value_4
             [2] = u2
             [3] = t_Camera_2
             [4] = t_LocalPlayer_1
             [5] = u1
             [6] = u5
             [7] = u15
     --]]
     if (not p17.Died) then
         local v169 = t_Value_4;
         if (v169 ~= "Deathmatch") then
             if (p17.AdminSpectating) then
                 return;
             end
             u2.Flash.Transparency = 1;
             t_Camera_2.CameraType = Enum.CameraType.Scriptable;
             t_Camera_2.CFrame = p17.LastCFrame;
             p17.Died = true;
             p17.DeathAnimation = true;
             p17.DeathAnimationProgress = true;
             local v170 = workspace.RaycastIgnore:WaitForChild(t_LocalPlayer_1.Name, 5);
             local v171 = v170;
             if (not v170) then
                 p17.DeathAnimationProgress = false;
                 p17.DeathAnimation = false;
                 return;
             end
             wait(0.2);
             p17.CameraSpring.Position = 0;
             p17.CameraSpring._target = 1;
             local v172 = tick();
             local u21 = false;
             local u22 = false;
             local u23 = nil;
             local v173 = game:GetService("RunService").RenderStepped;
             local u24 = v172;
             local u25 = p17;
             local u26 = v171;
             u23 = v173:Connect(function() -- [line 422] anonymous function
                 --[[
                     Upvalues: 
                         [1] = u24
                         [2] = u25
                         [3] = u26
                         [4] = t_Camera_2
                         [5] = u1
                         [6] = u23
                         [7] = u22
                         [8] = u5
                         [9] = u15
                         [10] = u21
                 --]]
                 local v174 = tick() - u24;
                 if (v174 <= 3.6) then
                     t_Camera_2.CFrame = u25.LastCFrame:Lerp(CFrame.new(u25.LastCFrame.p, u26.UpperTorsoFake.Position), u25.CameraSpring.Position);
                     u25.LastCFrame = t_Camera_2.CFrame;
                 end
                 if ((not ((tick() - u24) >= 4.6)) and u25.DeathAnimationProgress) then
                     if (not ((tick() - u24) > 3.6)) then
                         if ((tick() - u24) > 2.6) then
                             if (not u21) then
                                 u21 = true;
                                 u25.FadeSpring.Position = 1;
                                 u25.FadeSpring._target = 0;
                             end
                             u1.Fade.BackgroundTransparency = u25.FadeSpring.Position;
                         end
                         return;
                     end
                     if (not u22) then
                         u22 = true;
                         u25.FadeSpring.Position = 0;
                         u25.FadeSpring._target = 1;
                         u25.DeathAnimation = false;
                         if (u5:IsAlive(u25.SpectatingPlayer)) then
                             print("Set visible");
                             u25:SetVisible(u15.GetCharacter(u25.SpectatingPlayer));
                         end
                     end
                     u1.Fade.BackgroundTransparency = u25.FadeSpring.Position;
                     return;
                 end
                 u25.DeathAnimationProgress = false;
                 u25.DeathAnimation = false;
                 u1.Fade.BackgroundTransparency = 1;
                 u23:Disconnect();
             end);
             return;
         end
     end
 end;
 v1.PlayerDied = f_PlayerDied;
 local f_NewCharacter;
 f_NewCharacter = function(p18) -- [line 465] NewCharacter
     --[[
         Upvalues: 
             [1] = t_LocalPlayer_1
     --]]
     t_LocalPlayer_1.Character:WaitForChild("Humanoid", 10);
     p18.Died = false;
     local v175 = t_LocalPlayer_1.Character.Humanoid.Died;
     local u27 = p18;
     v175:Connect(function() -- [line 469] anonymous function
         --[[
             Upvalues: 
                 [1] = u27
         --]]
         u27:PlayerDied();
     end);
 end;
 v1.NewCharacter = f_NewCharacter;
 local f_AddWeaponToViewport;
 f_AddWeaponToViewport = function(p19, p20, p21) -- [line 474] AddWeaponToViewport
     --[[
         Upvalues: 
             [1] = u8
             [2] = t_Assets_3
             [3] = u10
     --]]
     if (not (p21 and u8[p21])) then
         return;
     end
     if (not p20:FindFirstChild("Camera")) then
         local v176 = Instance.new("Camera");
         v176.Parent = p20;
         p20.CurrentCamera = v176;
     end
     local v177 = t_Assets_3.Weapons[p21].Default.WeaponDrop:Clone();
     local v178 = v177;
     v177.Name = "Weapon";
     v177.Parent = p20;
     local v179, v180, v181 = pairs(v177:GetDescendants());
     local v182 = v179;
     local v183 = v180;
     local v184 = v181;
     while true do
         local v185, v186 = v182(v183, v184);
         local v187 = v185;
         local v188 = v186;
         if (v185) then
             break;
         end
         v184 = v187;
         local t_ClassName_30 = v188.ClassName;
         if (t_ClassName_30 == "SurfaceAppearance") then
             v188:Destroy();
         else
             local t_ClassName_31 = v188.ClassName;
             if (t_ClassName_31 == "MeshPart") then
                 v188.TextureID = "";
             end
         end
         if (v188:IsA("BasePart")) then
             v188.BrickColor = BrickColor.new("Institutional white");
         end
     end
     local v189 = u8[p21];
     local v190 = u10.new(p20, p20.Camera);
     local v191 = v178:GetBoundingBox();
     v190:SetModel(v178);
     p20.Camera.CFrame = v190:GetMinimumFitCFrame(CFrame.Angles(math.rad(v189.ViewportRotationOffset.X), math.rad(v189.ViewportRotationOffset.Y), math.rad(v189.ViewportRotationOffset.Z)));
 end;
 v1.AddWeaponToViewport = f_AddWeaponToViewport;
 local f_ShowDamageLog;
 f_ShowDamageLog = function(p22, p23) -- [line 511] ShowDamageLog
     --[[
         Upvalues: 
             [1] = u1
             [2] = t_Assets_3
             [3] = u8
             [4] = u12
             [5] = u15
     --]]
     if (not p23) then
         p22.CombatLogInitialized = false;
         return;
     end
     p22.CombatLogInitialized = true;
     local v192 = u1.CombatLog;
     local t_CombatLog_32 = v192;
     local v193, v194, v195 = pairs(v192.DamageValues:GetChildren());
     local v196 = v193;
     local v197 = v194;
     local v198 = v195;
     while true do
         local v199, v200 = v196(v197, v198);
         local v201 = v199;
         local v202 = v200;
         if (v199) then
             break;
         end
         v198 = v201;
         local t_ClassName_33 = v202.ClassName;
         if (t_ClassName_33 == "Frame") then
             v202:Destroy();
         end
     end
     t_CombatLog_32.TopInfo.Enemy.Text = p23.From or "";
     local t_KilledBy_34 = t_CombatLog_32.TopInfo.KilledBy;
     local v203;
     if (p23.From) then
         v203 = "Killed By";
     else
         v203 = "You survived the round";
     end
     t_KilledBy_34.Text = v203;
     local v204 = 1;
     local v205 = #p23.Log;
     local v206 = v205;
     local v207 = v204;
     if (not (v205 <= v207)) then
         while true do
             local v208 = false;
             local v209 = p23.Log[v204];
             local v210 = v209;
             local v211 = t_Assets_3.GeneralAssets.CombatLogTemplate:Clone();
             local v212 = v211;
             v211.Parent = t_CombatLog_32.DamageValues;
             local v213 = u8[v209.From.Weapon];
             local v214 = v213;
             if ((v213 and v213.ImageId) and (not v213.Bullets)) then
                 local t_Weapon_35 = v210.From.Weapon;
                 if (t_Weapon_35 == "Knife") then
                     v208 = true;
                 else
                     t_CombatLog_32.WeaponImage.Image = "rbxassetid://" .. v214.ImageId;
                 end
             else
                 v208 = true;
             end
             if (v208) then
                 p22:AddWeaponToViewport(v212.ViewportFrame, v210.From.Weapon);
             end
             local v215 = false;
             v212.EnemyName.Text = v210.From.Name;
             v212.Character.Image = "rbxassetid://" .. u12.Characters[u15.GetCharacter(v210.From)].SquareImageId;
             local t_Effect_36 = v210.To.Effect;
             local v216;
             if (t_Effect_36 == "Killed") then
                 v216 = Color3.fromRGB(14, 136, 188);
                 if (not v216) then
                     v215 = true;
                 end
             else
                 v215 = true;
             end
             if (v215) then
                 v216 = Color3.fromRGB(255, 71, 71);
             end
             v212.BackgroundColor3 = v216;
             v212.YourDamage.Head.Text = math.ceil(v210.To.Head);
             v212.YourDamage.Body.Text = math.ceil(v210.To.Body);
             v212.YourDamage.Legs.Text = math.ceil(v210.To.Legs);
             v212.YourTotalDamage.Text = math.ceil((v210.To.Head + v210.To.Body) + v210.To.Legs);
             v212.EnemyKilledEffect.Text = v210.To.Effect;
             v212.EnemyDamage.Head.Text = math.ceil(v210.From.Head);
             v212.EnemyDamage.Body.Text = math.ceil(v210.From.Body);
             v212.EnemyDamage.Legs.Text = math.ceil(v210.From.Legs);
             v212.EnemyTotalDamage.Text = math.ceil((v210.From.Head + v210.From.Body) + v210.From.Legs);
             v212.YourKilledEffect.Text = v210.From.Effect;
             local v217, v218, v219 = pairs(v210.To.HitParts);
             local v220 = v217;
             local v221 = v218;
             local v222 = v219;
             while true do
                 local v223, v224 = v220(v221, v222);
                 local v225 = v223;
                 if (v223) then
                     break;
                 end
                 v222 = v225;
                 v212.EnemyBody[v225].ImageColor3 = Color3.fromRGB(255, 255, 255);
             end
             local v226, v227, v228 = pairs(v210.From.HitParts);
             local v229 = v226;
             local v230 = v227;
             local v231 = v228;
             while true do
                 local v232, v233 = v229(v230, v231);
                 local v234 = v232;
                 if (v232) then
                     break;
                 end
                 v231 = v234;
                 v212.YourBody[v234].ImageColor3 = Color3.fromRGB(255, 255, 255);
             end
             local v235 = v204 + 1;
             v204 = v235;
             local v236 = v206;
             if (v236 < v235) then
                 break;
             end
         end
     end
     if (t_CombatLog_32.ViewportFrame:FindFirstChild("Weapon")) then
         t_CombatLog_32.ViewportFrame.Weapon:Destroy();
     end
     local v237 = p23.Weapon;
     if (v237) then
         v237 = u8[p23.Weapon];
     end
     if (not v237) then
         t_CombatLog_32.WeaponImage.Visible = false;
         t_CombatLog_32.ViewportFrame.Visible = false;
         return;
     end
     t_CombatLog_32.WeaponImage.Visible = v237.ImageId and true;
     t_CombatLog_32.ViewportFrame.Visible = (not v237.ImageId) and true;
     if (v237.ImageId and (not v237.Bullets)) then
         local t_Weapon_37 = p23.Weapon;
         if (t_Weapon_37 ~= "Knife") then
             t_CombatLog_32.WeaponImage.Image = "rbxassetid://" .. v237.ImageId;
             return;
         end
     end
     p22:AddWeaponToViewport(t_CombatLog_32.ViewportFrame, p23.Weapon);
 end;
 v1.ShowDamageLog = f_ShowDamageLog;
 local t_GameStats_38 = v13;
 local u28 = v17;
 local u29 = v19;
 local u30 = u1;
 local u31 = t_Camera_2;
 local u32 = v18;
 local u33 = t_LocalPlayer_1;
 local u34 = u4;
 local u35 = u14;
 local u36 = u5;
 local t_Spectate_39 = v7;
 local u37 = v3;
 local u38 = t_Value_4;
 local u39 = v20;
 local u40 = v4;
 local u41 = v5;
 local t_MapFolder_40 = v12;
 local u42 = u12;
 local u43 = u2;
 local u44 = u15;
 local u45 = u11;
 local u46 = u8;
 local t_WeaponInfo_41 = v10;
 local u47 = v16;
 local u48 = v15;
 local u49 = u7;
 local t_CharacterFrame_42 = v6;
 local u50 = v11;
 local t_BombCarrier_43 = v9;
 local t_BombPlant_44 = v8;
 local u51 = v21;
 local f_Initialize;
 f_Initialize = function(p24) -- [line 589] Initialize
     --[[
         Upvalues: 
             [1] = t_GameStats_38
             [2] = u16
             [3] = u28
             [4] = u17
             [5] = u29
             [6] = u30
             [7] = u31
             [8] = u32
             [9] = u33
             [10] = u34
             [11] = u35
             [12] = u36
             [13] = t_Spectate_39
             [14] = u37
             [15] = u38
             [16] = u39
             [17] = u40
             [18] = u41
             [19] = t_MapFolder_40
             [20] = u42
             [21] = u43
             [22] = u44
             [23] = u45
             [24] = u46
             [25] = t_WeaponInfo_41
             [26] = u47
             [27] = u48
             [28] = u49
             [29] = t_CharacterFrame_42
             [30] = u50
             [31] = t_BombCarrier_43
             [32] = t_BombPlant_44
             [33] = u51
     --]]
     local t_Value_45 = t_GameStats_38.GameMode.Value;
     if (t_Value_45 ~= "View Recording") then
         local t_Value_46 = t_GameStats_38.GameMode.Value;
         if (t_Value_46 ~= "Trading") then
             u16 = u28:LoadModule("CrosshairManager");
             u17 = u28:LoadModule("CustomMatchManager");
             u29(p24, "CameraSpring", 1, 0.2);
             u29(p24, "FadeSpring", 1, 7);
             local v238 = Instance.new("Camera");
             v238.Parent = u30.CombatLog.ViewportFrame;
             u30.CombatLog.ViewportFrame.CurrentCamera = v238;
             local v239 = u31.ChildAdded;
             local u52 = p24;
             v239:Connect(function(p25) -- [line 605] anonymous function
                 --[[
                     Upvalues: 
                         [1] = u52
                         [2] = u32
                 --]]
                 if (u52.Spectating and u32.CurrentWeapon) then
                     local t_CurrentWeapon_47 = u32.CurrentWeapon;
                     if (t_CurrentWeapon_47 == p25) then
                         u32.CurrentWeapon.Parent = game.ReplicatedStorage.ClientCache;
                     end
                 end
             end);
             if (u33.Character) then
                 p24:NewCharacter();
             end
             local v240 = u33.CharacterAdded;
             local u53 = p24;
             v240:Connect(function() -- [line 615] anonymous function
                 --[[
                     Upvalues: 
                         [1] = u53
                 --]]
                 u53:NewCharacter();
             end);
             local v241 = u34;
             local u54 = p24;
             v241:OnClientEvent("DamageLog", function(p26) -- [line 619] anonymous function
                 --[[
                     Upvalues: 
                         [1] = u54
                 --]]
                 u54:ShowDamageLog(p26);
             end);
             local v242 = u34;
             local u55 = p24;
             v242:OnClientEvent("SetSpectate", function(p27, p28, p29, p30, p31) -- [line 623] anonymous function
                 --[[
                     Upvalues: 
                         [1] = u32
                         [2] = u31
                         [3] = u55
                         [4] = u16
                 --]]
                 local v243 = p31 or false;
                 if (p28) then
                     if (u32.CurrentWeapon and u32.CurrentWeapon.Parent) then
                         u32.CurrentWeapon.Parent = game.ReplicatedStorage.ClientCache;
                     end
                     u55.SpectatingPlayer = p29;
                     u55.AdminSpectating = true;
                     if (false and p30) then
                         v243 = true;
                     end
                 end
                 if (u55.AdminSpectating) then
                 end
                 if (not u55.Spectating) then
                     v243 = true;
                 end
                 u55.Spectating = true;
                 if (v243) then
                     u55.SpectatingIndex = 1;
                     u55:SelectPlayer();
                 end
             end);
             local g_spawn_48 = spawn;
             local u56 = p24;
             g_spawn_48(function() -- [line 673] anonymous function
                 --[[
                     Upvalues: 
                         [1] = u35
                         [2] = u36
                         [3] = u56
                         [4] = t_Spectate_39
                         [5] = u37
                         [6] = u38
                         [7] = u39
                         [8] = u33
                         [9] = u40
                         [10] = u41
                         [11] = u31
                         [12] = t_MapFolder_40
                         [13] = u16
                         [14] = u17
                         [15] = u32
                         [16] = u42
                         [17] = u43
                         [18] = u44
                         [19] = u45
                         [20] = u46
                         [21] = t_WeaponInfo_41
                         [22] = u47
                         [23] = t_GameStats_38
                 --]]
                 u35:RenderStepped(function() -- [line 674] anonymous function
                     --[[
                         Upvalues: 
                             [1] = u36
                             [2] = u56
                             [3] = t_Spectate_39
                             [4] = u37
                             [5] = u38
                             [6] = u39
                             [7] = u33
                             [8] = u40
                             [9] = u41
                             [10] = u31
                             [11] = t_MapFolder_40
                             [12] = u16
                             [13] = u17
                             [14] = u32
                             [15] = u42
                             [16] = u43
                             [17] = u44
                             [18] = u45
                             [19] = u46
                             [20] = t_WeaponInfo_41
                             [21] = u47
                             [22] = t_GameStats_38
                     --]]
                     debug.profilebegin("Spectate Check");
                     local v244 = u36:IsAlive();
                     local v245 = v244;
                     if (u56.WasAlive and (not v244)) then
                         u56:PlayerDied();
                     end
                     u56.WasAlive = v245;
                     local v246 = t_Spectate_39;
                     local v247 = u56.Spectating;
                     if (v247) then
                         v247 = not u56.DeathAnimation;
                         if (not v247) then
                             v247 = u56.AdminSpectating;
                         end
                     end
                     v246.Visible = v247;
                     if (u56.DeathAnimation) then
                         u56:SetVisible();
                         return;
                     end
                     local v248 = u56.Spectating;
                     if (v248) then
                         v248 = u36:IsAlive(u56.SpectatingPlayer);
                     end
                     if (((not (u56.Spectating and v248)) and u56.SpectatingViewModel) and u56.SpectatingViewModel.Parent) then
                         u56.SpectatingViewModel:Destroy();
                     end
                     if (not u37.Enabled) then
                         local v249 = u38;
                         if (not (((v249 == "Casual") and (not u39.PlayerOperators[u33.Name])) or u40.Enabled)) then
                             if (u41.Enabled) then
                                 local t_Value_49 = u33.PermanentTeam.Value;
                                 if (t_Value_49 == "Team3") then
                                 end
                             end
                             if (u17.Freecam) then
                                 return;
                             end
                             if (u56.Spectating) then
                                 if (u32.ZylaAbilityTween) then
                                     u32.ZylaAbilityTween:Cancel();
                                     u32.ZylaAbilityTween = nil;
                                 end
                                 if (u56.AdminSpectating) then
                                     t_Spectate_39.Select.LeftArrow.ImageColor3 = Color3.fromRGB(24, 24, 24);
                                     t_Spectate_39.Select.RightArrow.ImageColor3 = Color3.fromRGB(24, 24, 24);
                                 else
                                     local v250 = u56:GetPlayersToSpectate();
                                     if (v250 < 1) then
                                         t_Spectate_39.Select.LeftArrow.ImageColor3 = Color3.fromRGB(24, 24, 24);
                                         t_Spectate_39.Select.RightArrow.ImageColor3 = Color3.fromRGB(24, 24, 24);
                                     else
                                         t_Spectate_39.Select.LeftArrow.ImageColor3 = Color3.fromRGB(255, 255, 255);
                                         t_Spectate_39.Select.RightArrow.ImageColor3 = Color3.fromRGB(255, 255, 255);
                                     end
                                     if ((not v248) and (v250 > 1)) then
                                         print("Scrolling");
                                         u56:Scroll(1, true);
                                     end
                                 end
                                 if (u56.SpectatingPlayer and v248) then
                                     local v251 = false;
                                     local v252 = u42.Characters[u56.SpectatingPlayer.CharacterName.Value];
                                     local v253 = v252;
                                     t_Spectate_39.Username.Text = u56.SpectatingPlayer.Name;
                                     local t_OperatorImage_50 = t_Spectate_39.OperatorImage;
                                     local v254;
                                     if (v252) then
                                         v254 = "rbxassetid://" .. v253.SquareImageId;
                                         if (not v254) then
                                             v251 = true;
                                         end
                                     else
                                         v251 = true;
                                     end
                                     if (v251) then
                                         v254 = "";
                                     end
                                     t_OperatorImage_50.Image = v254;
                                 else
                                     t_Spectate_39.Username.Text = "";
                                     t_Spectate_39.OperatorImage.Image = "";
                                     u43.Flash.Transparency = 1;
                                 end
                                 if (u56.SpectatingPlayer and v248) then
                                     u33.CameraMode = Enum.CameraMode.LockFirstPerson;
                                     u31.CameraSubject = t_MapFolder_40.OverallView;
                                     u31.CameraType = Enum.CameraType.Scriptable;
                                     print("asd");
                                     if ((u56.SpectatingData and u56.SpectatingViewModel) and u56.SpectatingViewModel.Parent) then
                                         local v255 = u56.SpectatingData.CameraOffset;
                                         local v256 = u56.SpectatingData.ViewModelCFrame;
                                         if (u56.SpectatingData.CameraOffset and u56.SpectatingData.LastUpdateTick) then
                                             local v257 = math.clamp((tick() - u56.SpectatingData.UpdateTick) / (u56.SpectatingData.UpdateTick - u56.SpectatingData.LastUpdateTick), 0, 1);
                                             v255 = u56.SpectatingData.LastCameraOffset:Lerp(u56.SpectatingData.CameraOffset, v257);
                                             v256 = u56.SpectatingData.LastViewModelCFrame:Lerp(u56.SpectatingData.ViewModelCFrame, v257);
                                         end
                                         u31.CFrame = (CFrame.new(u44.GetCharacter(u56.SpectatingPlayer).HumanoidRootPart.Position) * v255) * CFrame.new(0, 2 + u56.SpectatingData.CrouchAmount, 0);
                                         u56.SpectatingViewModel.PrimaryPart.CFrame = u31.CFrame * v256;
                                         if ((u56.SpectatingWeaponData.Attributes and u56.SpectatingWeaponData.Attributes["Stat Trak"]) and u44.GetCharacter(u56.SpectatingPlayer):FindFirstChild("Weapon")) then
                                             u56.SpectatingViewModel.Object.StatTrak.Number.SurfaceGui.Frame.TextLabel.Text = u45:CalculateStatTrak(u44.GetCharacter(u56.SpectatingPlayer).Weapon.Attributes["Stat Trak"].Kills.Value);
                                         end
                                         local v258 = u46[u56.SpectatingViewModel.Name];
                                         local v259 = v258;
                                         local t_Class_51 = v258.Class;
                                         if (t_Class_51 == "Sniper") then
                                             local v260 = u56.SpectatingData.AimDifference or 0;
                                             if (v260 < 1) then
                                                 u56.SpectatingViewModel.Object.Scope2.Transparency = (-1.25 * v260) + 1.25;
                                             end
                                             u56.SpectatingViewModel.Object.ScopeDot.SurfaceGui.Enabled = u56.SpectatingData.RedDotVisible;
                                             if (not u56.SpectatingData.CrosshairVisible) then
                                                 local v261, v262, v263 = pairs(u56.SpectatingViewModel.AnimationController:GetPlayingAnimationTracks());
                                                 local v264 = v261;
                                                 local v265 = v262;
                                                 local v266 = v263;
                                                 while true do
                                                     local v267, v268 = v264(v265, v266);
                                                     local v269 = v267;
                                                     local v270 = v268;
                                                     if (v267) then
                                                         break;
                                                     end
                                                     v266 = v269;
                                                     local t_Name_52 = v270.Name;
                                                     if (t_Name_52 == "Inspect") then
                                                         v270:Stop();
                                                     end
                                                 end
                                             end
                                         end
                                         local v271 = false;
                                         local t_Class_53 = v259.Class;
                                         if (t_Class_53 == "Melee") then
                                             v271 = true;
                                         else
                                             local t_Class_54 = v259.Class;
                                             if (t_Class_54 == "Bomb") then
                                                 v271 = true;
                                             else
                                                 local t_Class_55 = v259.Class;
                                                 if ((t_Class_55 == "Ability") or v259.Grenade) then
                                                     v271 = true;
                                                 else
                                                     if (u56.SpectatingData.Bullets) then
                                                         local v272 = false;
                                                         local v273 = (u56.SpectatingData.Bullets / v259.MaxBullets) <= 0.35;
                                                         local v274 = v273;
                                                         t_WeaponInfo_41.CurrentAmmo.Text = u56.SpectatingData.Bullets;
                                                         t_WeaponInfo_41.UnusedAmmo.Text = u56.SpectatingData.ReserveAmmo;
                                                         local t_Background_56 = t_WeaponInfo_41.Background;
                                                         local v275;
                                                         if (v273) then
                                                             v275 = Color3.fromRGB(165, 62, 62);
                                                             if (not v275) then
                                                                 v272 = true;
                                                             end
                                                         else
                                                             v272 = true;
                                                         end
                                                         if (v272) then
                                                             v275 = Color3.fromRGB(40, 40, 40);
                                                         end
                                                         t_Background_56.ImageColor3 = v275;
                                                         if (v274 and (not u56.AmmoColorTween)) then
                                                             coroutine.wrap(function() -- [line 808] anonymous function
                                                                 --[[
                                                                     Upvalues: 
                                                                         [1] = u56
                                                                         [2] = u47
                                                                         [3] = t_WeaponInfo_41
                                                                 --]]
                                                                 local v276 = u56;
                                                                 local v277 = u47;
                                                                 local v278 = t_WeaponInfo_41.CurrentAmmo;
                                                                 local v279 = TweenInfo.new(0.4, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, 0, true);
                                                                 local v280 = {};
                                                                 v280.TextColor3 = Color3.fromRGB(244, 145, 145);
                                                                 v276.AmmoColorTween = v277:Create(v278, v279, v280);
                                                                 u56.AmmoColorTween:Play();
                                                                 u56.AmmoColorTween.Completed:wait();
                                                                 u56.AmmoColorTween = nil;
                                                             end)();
                                                         else
                                                             if ((not v274) and u56.AmmoColorTween) then
                                                                 u56.AmmoColorTween:Cancel();
                                                                 u56.AmmoColorTween = nil;
                                                                 t_WeaponInfo_41.CurrentAmmo.TextColor3 = Color3.fromRGB(255, 255, 255);
                                                             end
                                                         end
                                                     end
                                                 end
                                             end
                                         end
                                         if (v271) then
                                             t_WeaponInfo_41.CurrentAmmo.Text = "";
                                             t_WeaponInfo_41.UnusedAmmo.Text = "";
                                             t_WeaponInfo_41.Background.ImageColor3 = Color3.fromRGB(40, 40, 40);
                                         end
                                         u56.LastCFrame = u31.CFrame;
                                     end
                                 else
                                     if (t_GameStats_38.BombPlanted.Value and t_MapFolder_40.Bomb:GetChildren()[1]) then
                                         u16:SetCrosshair(false);
                                         u31.CameraType = Enum.CameraType.Custom;
                                         u31.CameraSubject = t_MapFolder_40.Bomb:GetChildren()[1].Camera;
                                         u33.CameraMode = Enum.CameraMode.Classic;
                                         u33.CameraMaxZoomDistance = 10;
                                         u33.CameraMinZoomDistance = 10;
                                         u56.LastCFrame = u31.CFrame;
                                     else
                                         local v281 = false;
                                         if (t_MapFolder_40:FindFirstChild("OverallView")) then
                                             local v282 = false;
                                             local v283 = false;
                                             local t_Value_57 = t_GameStats_38.RoundType.Value;
                                             if (t_Value_57 == "Game") then
                                                 v282 = true;
                                             else
                                                 local t_Value_58 = t_GameStats_38.RoundType.Value;
                                                 if (t_Value_58 == "Intermission") then
                                                     v282 = true;
                                                 else
                                                     local t_Value_59 = u33.PermanentTeam.Value;
                                                     if (t_Value_59 == "Team3") then
                                                         v283 = true;
                                                     else
                                                         v282 = true;
                                                     end
                                                 end
                                             end
                                             if (v282) then
                                                 local t_Value_60 = u33.PermanentTeam.Value;
                                                 if (t_Value_60 == "Team3") then
                                                     v281 = true;
                                                 else
                                                     v283 = true;
                                                 end
                                             end
                                             if (v283) then
                                                 u16:SetCrosshair(false);
                                                 u33.CameraMode = Enum.CameraMode.LockFirstPerson;
                                                 u31.CameraSubject = t_MapFolder_40.OverallView;
                                                 u31.CameraType = Enum.CameraType.Scriptable;
                                                 local v284 = u31;
                                                 local v285 = u56.LastCFrame;
                                                 if (not v285) then
                                                     v285 = t_MapFolder_40.OverallView.CFrame;
                                                     if (not v285) then
                                                         v285 = u31.CFrame;
                                                     end
                                                 end
                                                 v284.CFrame = v285;
                                             end
                                         else
                                             v281 = true;
                                         end
                                         if (v281) then
                                             local v286 = false;
                                             local t_Value_61 = t_GameStats_38.RoundType.Value;
                                             if (t_Value_61 == "Game") then
                                                 v286 = true;
                                             else
                                                 local t_Value_62 = t_GameStats_38.RoundType.Value;
                                                 if (t_Value_62 == "Intermission") then
                                                     v286 = true;
                                                 end
                                             end
                                             if (v286) then
                                                 local t_Value_63 = u33.PermanentTeam.Value;
                                                 if (t_Value_63 == "Team3") then
                                                     u31.CameraSubject = nil;
                                                 end
                                             end
                                         end
                                     end
                                 end
                             else
                                 local v287 = false;
                                 if (u36:IsAlive()) then
                                     local t_Value_64 = u33.PermanentTeam.Value;
                                     if (t_Value_64 == "Team3") then
                                         v287 = true;
                                     else
                                         if (u32.ActivatingAbility and u33.CharacterName.Value) then
                                             u33.CameraMode = Enum.CameraMode.Classic;
                                             u31.CFrame = u32.ActivatingAbility;
                                         else
                                             u31.CameraType = Enum.CameraType.Custom;
                                             u33.CameraMode = Enum.CameraMode.LockFirstPerson;
                                             u31.CameraSubject = u33.Character.Humanoid;
                                             local t_Value_65 = u33.CharacterName.Value;
                                             if (((t_Value_65 == "Zyla") and u32.AbilityInUse) and u32.ZylaAbilityData) then
                                                 u56.LastCFrame = u32.ZylaAbilityData.OriginCamera;
                                             else
                                                 u56.LastCFrame = u31.CFrame;
                                             end
                                         end
                                     end
                                 else
                                     v287 = true;
                                 end
                                 if (v287) then
                                     u33.CameraMode = Enum.CameraMode.Classic;
                                     u31.CameraType = Enum.CameraType.Scriptable;
                                     local v288 = u31;
                                     local v289 = u56.LastCFrame;
                                     if (not v289) then
                                         v289 = u31.CFrame;
                                     end
                                     v288.CFrame = v289;
                                 end
                             end
                             debug.profileend();
                             return;
                         end
                     end
                     u31.CameraType = Enum.CameraType.Scriptable;
                     if (t_MapFolder_40:FindFirstChild("OverallView")) then
                         u31.CFrame = t_MapFolder_40.OverallView.CFrame;
                     end
                     u16:SetCrosshair(false);
                 end);
             end);
             local v290 = u48.InputBegan;
             local u57 = p24;
             v290:Connect(function(p32, p33) -- [line 874] anonymous function
                 --[[
                     Upvalues: 
                         [1] = u57
                 --]]
                 if (p33) then
                     return;
                 end
                 local t_UserInputType_66 = p32.UserInputType;
                 if (t_UserInputType_66 == Enum.UserInputType.MouseButton1) then
                     u57:Scroll(1);
                     return;
                 end
                 local t_UserInputType_67 = p32.UserInputType;
                 if (t_UserInputType_67 == Enum.UserInputType.MouseButton2) then
                     u57:Scroll(-1);
                 end
             end);
             local v291 = u34;
             local u58 = p24;
             v291:OnClientEvent("SpectateUpdate", function(p34) -- [line 886] anonymous function
                 --[[
                     Upvalues: 
                         [1] = u58
                         [2] = u17
                         [3] = u49
                         [4] = u16
                         [5] = u42
                         [6] = t_CharacterFrame_42
                         [7] = u50
                         [8] = u43
                         [9] = t_BombCarrier_43
                         [10] = t_BombPlant_44
                         [11] = t_WeaponInfo_41
                         [12] = u31
                         [13] = u51
                         [14] = u46
                 --]]
                 if (not ((p34.FOV and u58.SpectatingPlayer) and ((u58.SpectatingPlayer.Parent and u58.SpectatingPlayer:FindFirstChild("CharacterName")) and (not u17.Freecam)))) then
                     return;
                 end
                 if (not u58.LastUpdate) then
                     u58.LastUpdate = tick();
                 end
                 u58.LastUpdate = tick();
                 local t_Shooting_68 = p34.Shooting;
                 if ((not (t_Shooting_68 == u58.SpectatingData.Shooting)) and u58.SpectatingViewModel.Object:FindFirstChild("Muzzle")) then
                     local v292, v293, v294 = pairs(u58.SpectatingViewModel.Object.Muzzle.MuzzleEffects:GetChildren());
                     local v295 = v292;
                     local v296 = v293;
                     local v297 = v294;
                     while true do
                         local v298, v299 = v295(v296, v297);
                         local v300 = v298;
                         local v301 = v299;
                         if (v298) then
                             break;
                         end
                         v297 = v300;
                         v301.Enabled = p34.Shooting;
                     end
                 end
                 local v302 = false;
                 u49:UpdateHealth(p34.Health, p34.Shield);
                 u16:SetCrosshair(p34.CrosshairVisible);
                 u16:UpdateCrosshairStyle(p34.CrosshairStyle, p34.SpreadOffset);
                 local v303 = u42.Characters[u58.SpectatingPlayer.CharacterName.Value];
                 local v304 = v303;
                 local t_CharPhoto_69 = t_CharacterFrame_42.CharPhoto.CharPhoto;
                 local v305;
                 if (v303) then
                     v305 = "rbxassetid://" .. v304.ImageId;
                     if (not v305) then
                         v302 = true;
                     end
                 else
                     v302 = true;
                 end
                 if (v302) then
                     v305 = "";
                 end
                 local v306 = false;
                 t_CharPhoto_69.Image = v305;
                 local t_AbilityImage_70 = u50.Ability.AbilityImage;
                 local v307;
                 if (v304) then
                     v307 = "rbxassetid://" .. v304.Ability.ImageId;
                     if (not v307) then
                         v306 = true;
                     end
                 else
                     v306 = true;
                 end
                 if (v306) then
                     v307 = "";
                 end
                 t_AbilityImage_70.Image = v307;
                 u50.Ability.Key.Text = "[" .. (p34.AbilityKeybind .. "]");
                 u50.Ability.UseFrame.Use1.Visible = 1 <= v304.Ability.Uses;
                 u50.Ability.UseFrame.Use2.Visible = 2 <= v304.Ability.Uses;
                 u50.Ability.UseFrame.Use1.Top.Visible = 1 <= p34.AbilityUses;
                 u50.Ability.UseFrame.Use2.Top.Visible = 2 <= p34.AbilityUses;
                 u50.Ability.Cooldown.Text = p34.RechargeTime or "";
                 if (p34.AbilityInUse) then
                     local t_Value_71 = u58.SpectatingPlayer.CharacterName.Value;
                     if (t_Value_71 == "Zolt") then
                         u50.Ability.Bar.Visible = true;
                         u50.Ability.UseFrame.Visible = false;
                         u50.Ability.Bar.Top.Size = UDim2.new(p34.AbilityInUse, 0, 1, 0);
                     end
                 else
                     local t_Value_82 = u58.SpectatingPlayer.CharacterName.Value;
                     if (t_Value_82 == "Zolt") then
                         u50.Ability.Bar.Visible = false;
                         u50.Ability.UseFrame.Visible = true;
                     else
                         u50.Ability.Bar.Visible = false;
                         u50.Ability.UseFrame.Visible = true;
                     end
                 end
                 local t_Flash_72 = u43.Flash;
                 local v308;
                 if (p34.Flash) then
                     v308 = true;
                 else
                     v308 = false;
                 end
                 local v309 = false;
                 t_Flash_72.Visible = v308;
                 u43.Flash.Transparency = p34.Flash or 1;
                 game.Lighting.Atmosphere.Density = p34.Atmosphere or 0.3;
                 t_BombCarrier_43.Visible = p34.Bomb;
                 t_BombPlant_44.PlantText.Visible = p34.BombText and true;
                 t_BombPlant_44.PlantText.Text = p34.BombText or "";
                 t_BombPlant_44.PlantingBar.Visible = p34.PlantingPercent and true;
                 t_WeaponInfo_41.CurrentAmmo.Text = p34.Bullets or "";
                 t_WeaponInfo_41.UnusedAmmo.Text = p34.ReserveAmmo or "";
                 u31.FieldOfView = p34.FOV;
                 local v310;
                 if (p34.EquippedWeapon) then
                     v310 = p34.EquippedWeapon.Slot;
                     if (not v310) then
                         v309 = true;
                     end
                 else
                     v309 = true;
                 end
                 if (v309) then
                     v310 = 0;
                 end
                 local v311 = false;
                 local v312;
                 if (p34.EquippedWeapon) then
                     v312 = p34.EquippedWeapon.Index;
                     if (not v312) then
                         v311 = true;
                     end
                 else
                     v311 = true;
                 end
                 if (v311) then
                     v312 = 0;
                 end
                 local v313 = false;
                 local v314 = u51:GetOrderedGrenades(p34.Inventory[5]);
                 local v315 = v314;
                 local v316 = u51:GetOrderedGrenades(p34.Inventory[6]);
                 local t_Grenade_73 = u50.LethalFrame.Slot1.Grenade;
                 local v317;
                 if (v314[1]) then
                     v317 = "rbxassetid://" .. u46[v315[1]].ImageId;
                     if (not v317) then
                         v313 = true;
                     end
                 else
                     v313 = true;
                 end
                 if (v313) then
                     v317 = "";
                 end
                 local v318 = false;
                 t_Grenade_73.Image = v317;
                 local t_Grenade_74 = u50.LethalFrame.Slot2.Grenade;
                 local v319;
                 if (v315[2]) then
                     v319 = "rbxassetid://" .. u46[v315[2]].ImageId;
                     if (not v319) then
                         v318 = true;
                     end
                 else
                     v318 = true;
                 end
                 if (v318) then
                     v319 = "";
                 end
                 local v320 = false;
                 t_Grenade_74.Image = v319;
                 local t_Grenade_75 = u50.TacticalFrame.Slot1.Grenade;
                 local v321;
                 if (v316[1]) then
                     v321 = "rbxassetid://" .. u46[v316[1]].ImageId;
                     if (not v321) then
                         v320 = true;
                     end
                 else
                     v320 = true;
                 end
                 if (v320) then
                     v321 = "";
                 end
                 local v322 = false;
                 t_Grenade_75.Image = v321;
                 local t_Grenade_76 = u50.TacticalFrame.Slot2.Grenade;
                 local v323;
                 if (v316[2]) then
                     v323 = "rbxassetid://" .. u46[v316[2]].ImageId;
                     if (not v323) then
                         v322 = true;
                     end
                 else
                     v322 = true;
                 end
                 if (v322) then
                     v323 = "";
                 end
                 local v324 = false;
                 t_Grenade_76.Image = v323;
                 local t_Grenade_77 = u50.LethalFrame.Slot1.Grenade;
                 local v325;
                 if ((v310 == 5) and (v312 == 1)) then
                     v325 = Color3.fromRGB(255, 255, 255);
                     if (not v325) then
                         v324 = true;
                     end
                 else
                     v324 = true;
                 end
                 if (v324) then
                     v325 = Color3.fromRGB(53, 53, 53);
                 end
                 local v326 = false;
                 t_Grenade_77.ImageColor3 = v325;
                 local t_Grenade_78 = u50.LethalFrame.Slot2.Grenade;
                 local v327;
                 if ((v310 == 5) and (v312 == 2)) then
                     v327 = Color3.fromRGB(255, 255, 255);
                     if (not v327) then
                         v326 = true;
                     end
                 else
                     v326 = true;
                 end
                 if (v326) then
                     v327 = Color3.fromRGB(53, 53, 53);
                 end
                 local v328 = false;
                 t_Grenade_78.ImageColor3 = v327;
                 local t_Grenade_79 = u50.TacticalFrame.Slot1.Grenade;
                 local v329;
                 if ((v310 == 6) and (v312 == 1)) then
                     v329 = Color3.fromRGB(255, 255, 255);
                     if (not v329) then
                         v328 = true;
                     end
                 else
                     v328 = true;
                 end
                 if (v328) then
                     v329 = Color3.fromRGB(53, 53, 53);
                 end
                 local v330 = false;
                 t_Grenade_79.ImageColor3 = v329;
                 local t_Grenade_80 = u50.TacticalFrame.Slot2.Grenade;
                 local v331;
                 if ((v310 == 6) and (v312 == 2)) then
                     v331 = Color3.fromRGB(255, 255, 255);
                     if (not v331) then
                         v330 = true;
                     end
                 else
                     v330 = true;
                 end
                 if (v330) then
                     v331 = Color3.fromRGB(53, 53, 53);
                 end
                 t_Grenade_80.ImageColor3 = v331;
                 if (p34.PlantingPercent) then
                     u49:UpdatePlantingBar(p34.PlantingPercent);
                 end
                 if (u58.SpectatingData and (not u58.SpectatingData.StartedSpectating)) then
                     p34.LastCameraOffset = u58.SpectatingData.CameraOffset;
                     p34.LastViewModelCFrame = u58.SpectatingData.ViewModelCFrame;
                     p34.LastUpdateTick = u58.SpectatingData.UpdateTick;
                 end
                 if (p34.CurrentWeaponData and p34.CurrentWeaponData.Weapon) then
                     if (u58.SpectatingData.LastWeapon) then
                         local t_LastWeapon_81 = u58.SpectatingData.LastWeapon;
                         if (t_LastWeapon_81 ~= p34.CurrentWeaponData.Weapon) then
                             u49:AddWeaponToViewport(false, p34.Inventory, p34.CurrentWeaponData, p34.EquippedWeapon);
                         end
                     end
                     p34.LastWeapon = p34.CurrentWeaponData.Weapon;
                 end
                 p34.UpdateTick = tick();
                 u58.SpectatingData = p34;
             end);
             local v332 = u34;
             local u59 = p24;
             v332:OnClientEvent("NewWeapon", function(p35, p36) -- [line 990] anonymous function
                 --[[
                     Upvalues: 
                         [1] = u59
                 --]]
                 u59:NewWeapon(p35, p36);
             end);
             local v333 = u34;
             local u60 = p24;
             v333:OnClientEvent("AnimationUpdate", function(p37) -- [line 994] anonymous function
                 --[[
                     Upvalues: 
                         [1] = u60
                 --]]
                 u60:PlayAnimation(u60.SpectatingViewModel, p37);
             end);
             local v334 = u34;
             local u61 = p24;
             v334:OnClientEvent("StopAnimation", function(p38) -- [line 998] anonymous function
                 --[[
                     Upvalues: 
                         [1] = u61
                 --]]
                 u61:StopAnimation(u61.SpectatingViewModel, p38);
             end);
             local v335 = t_MapFolder_40.Players.DescendantAdded;
             local u62 = p24;
             v335:Connect(function(p39) -- [line 1002] anonymous function
                 --[[
                     Upvalues: 
                         [1] = u62
                         [2] = u36
                         [3] = u44
                 --]]
                 if ((u62.SpectatingPlayer and u36:IsAlive(u62.SpectatingPlayer)) and p39:IsDescendantOf(u44.GetCharacter(u62.SpectatingPlayer))) then
                     local v336 = false;
                     local t_ClassName_83 = p39.ClassName;
                     if (t_ClassName_83 == "SurfaceGui") then
                         v336 = true;
                     else
                         local t_ClassName_84 = p39.ClassName;
                         if (t_ClassName_84 == "PointLight") then
                             v336 = true;
                         else
                             local t_ClassName_85 = p39.ClassName;
                             if (t_ClassName_85 == "ParticleEmitter") then
                                 v336 = true;
                             end
                         end
                     end
                     if (v336) then
                         local v337 = u62.SpectatingTransparency;
                         local v338 = {};
                         v338.Type = p39.ClassName;
                         v338.Enabled = p39.Enabled;
                         v337[p39] = v338;
                         p39.Enabled = false;
                     end
                 end
             end);
             return;
         end
     end
 end;
 v1.Initialize = f_Initialize;
 return v1;
 