-- Decompiled with the Synapse X Luau decompiler.
 --NOTE: Currently in beta! Not representative of final product.
 local u1 = {};
 u1.PlayingAnimations = {};
 u1.EquipCooldown = false;
 u1.Bullets = {};
 u1.Grenades = {};
 u1.TraceBullets = false;
 u1.AimOffset = CFrame.new();
 u1.WeaponValue = 0;
 u1.ReloadingValue = 0;
 u1.LastSpringRecoilX = 0;
 u1.LastSpringRecoilY = 0;
 u1.InfiniteAbilities = false;
 u1.InfiniteAmmo = false;
 u1.BlockPrimary = false;
 u1.BlockSecondary = false;
 u1.BlockLethalUtility = false;
 u1.BlockTacticalUtility = false;
 u1.BlockAbility = false;
 u1.BlockBomb = false;
 u1.BlockShooting = false;
 u1.BlockAiming = false;
 u1.BlockGrenadeThrow = false;
 local t_LocalPlayer_1 = game.Players.LocalPlayer;
 local v1 = t_LocalPlayer_1:GetMouse();
 local t_Assets_2 = game.ReplicatedStorage.Assets;
 local t_CurrentCamera_3 = workspace.CurrentCamera;
 local t_MapFolder_4 = workspace.MapFolder;
 local t_GameStats_5 = t_MapFolder_4.GameStats;
 local u2 = t_LocalPlayer_1:WaitForChild("PlayerGui"):WaitForChild("MainUI");
 local v2 = t_LocalPlayer_1:WaitForChild("PlayerGui"):WaitForChild("SecondaryUI");
 local u3 = nil;
 local v3 = t_LocalPlayer_1:WaitForChild("PlayerGui"):WaitForChild("CharacterSelection");
 local v4 = t_LocalPlayer_1:WaitForChild("PlayerGui"):WaitForChild("ChangeCharacter");
 local v5 = t_LocalPlayer_1:WaitForChild("PlayerGui"):WaitForChild("MapVote");
 local v6 = t_LocalPlayer_1:WaitForChild("PlayerGui"):WaitForChild("GameResults");
 local v7 = u2.BombPlant;
 local v8 = u2.BombCarrier;
 local v9 = u2.WeaponInfo;
 local v10 = u2.Crosshair;
 local v11 = u2.TopFrame;
 local v12 = u2.DMTopFrame;
 local v13 = u2.Shop;
 local v14 = u2.Leaderboard;
 local v15 = u2.MapFrame;
 local v16 = u2.LargeMapFrame;
 local v17 = u2["Abilities/Utillites"];
 local v18 = u2.CharacterFrame;
 local u4 = Random.new(tick());
 v1.TargetFilter = t_CurrentCamera_3;
 local v19 = game:GetService("UserInputService");
 local u5 = game:GetService("HttpService");
 local u6 = game:GetService("Debris");
 local u7 = game:GetService("PhysicsService");
 local v20 = game:GetService("StarterGui");
 local u8 = game:GetService("RunService");
 local u9 = game:GetService("TweenService");
 local v21 = game:GetService("ContextActionService");
 local v22 = game:GetService("ContentProvider");
 local v23 = require(game.ReplicatedStorage.Modules.Shared.ModuleLoader);
 local u10 = v23:LoadModule("Network");
 local u11 = v23:LoadModule("SharedMemory");
 local u12 = v23:LoadModule("WeaponInfo");
 local u13 = v23:LoadModule("BulletInfo");
 local u14 = v23:LoadModule("PenetrationInfo");
 local u15 = v23:LoadModule("RecoilHandler");
 local u16 = v23:LoadModule("CrosshairManager");
 local u17 = v23:LoadModule("CameraModule");
 local u18 = v23:LoadModule("Clean");
 local u19 = v23:LoadModule("CharacterMovementManager");
 local v24 = v23:LoadModule("InputManager");
 local v25 = v23:LoadModule("FramerateManager");
 local v26 = v23:LoadModule("KeybindManager");
 local u20 = v23:LoadModule("UIManager");
 local u21 = v23:LoadModule("RotatedRegion3");
 local u22 = v23:LoadModule("PlayerDamageZones");
 local u23 = v23:LoadModule("SoundManager");
 local u24 = v23:LoadModule("ClassifyMaterial");
 local u25 = v23:LoadModule("SettingsManager");
 local v27 = v23:LoadModule("SettingsInfo");
 local v28 = v23:LoadModule("Spring");
 local v29 = v23:LoadModule("ChatManager");
 local v30 = v23:LoadModule("CreateSpring");
 local u26 = v23:LoadModule("GetBulletIgnoreTable");
 local v31 = v23:LoadModule("AttributesHandler");
 local v32 = v23:LoadModule("SkinData");
 local u27 = v23:LoadModule("CharacterData");
 local v33 = v23:LoadModule("UIAnimations");
 local v34 = v23:LoadModule("CharacterSelectionManager");
 local v35 = v23:LoadModule("PointIsValid");
 local v36 = v23:LoadModule("EventHandler");
 local v37 = v23:LoadModule("SoundInfo");
 local v38 = v23:LoadModule("CustomMatchManager");
 local u28 = nil;
 local u29 = nil;
 local u30 = require(game.ReplicatedStorage.BAC.Characters);
 local f_ConnectAnimationMarkers;
 f_ConnectAnimationMarkers = function(p1, p2, p3) -- [line 113] ConnectAnimationMarkers
     --[[
         Upvalues: 
             [1] = u11
     --]]
     local v39 = p3;
     if (not v39) then
         v39 = u11.CurrentWeapon;
     end
     p3 = v39;
     local v40 = {};
     local v41 = p2:GetMarkerReachedSignal("ParticleOn");
     local u31 = v40;
     v41:Connect(function(p4) -- [line 118] anonymous function
         --[[
             Upvalues: 
                 [1] = p3
                 [2] = u31
         --]]
         local v42, v43, v44 = pairs(p3.Object:GetDescendants());
         local v45 = v42;
         local v46 = v43;
         local v47 = v44;
         while true do
             local v48, v49 = v45(v46, v47);
             local v50 = v48;
             local v51 = v49;
             if (v48) then
                 break;
             end
             v47 = v50;
             local t_Name_6 = v51.Name;
             if (t_Name_6 == p4) then
                 v51.Enabled = true;
                 u31[v51] = true;
             end
         end
     end);
     local v52 = p2:GetMarkerReachedSignal("ParticleOff");
     local u32 = v40;
     v52:Connect(function(p5) -- [line 128] anonymous function
         --[[
             Upvalues: 
                 [1] = p3
                 [2] = u32
         --]]
         local v53, v54, v55 = pairs(p3.Object:GetDescendants());
         local v56 = v53;
         local v57 = v54;
         local v58 = v55;
         while true do
             local v59, v60 = v56(v57, v58);
             local v61 = v59;
             local v62 = v60;
             if (v59) then
                 break;
             end
             v58 = v61;
             local t_Name_7 = v62.Name;
             if (t_Name_7 == p5) then
                 v62.Enabled = false;
                 u32[v62] = nil;
             end
         end
     end);
     local v63 = p2.Stopped;
     local u33 = v40;
     v63:Connect(function() -- [line 138] anonymous function
         --[[
             Upvalues: 
                 [1] = u33
         --]]
         local v64, v65, v66 = pairs(u33);
         local v67 = v64;
         local v68 = v65;
         local v69 = v66;
         while true do
             local v70, v71 = v67(v68, v69);
             local v72 = v70;
             if (v70) then
                 break;
             end
             v69 = v72;
             if (v72.Parent) then
                 v72.Enabled = false;
             end
         end
     end);
 end;
 u1.ConnectAnimationMarkers = f_ConnectAnimationMarkers;
 local f_PlayAnimation;
 f_PlayAnimation = function(p6, p7, p8) -- [line 147] PlayAnimation
     --[[
         Upvalues: 
             [1] = u11
             [2] = t_LocalPlayer_1
             [3] = u10
     --]]
     local v73, v74, v75 = pairs(u11.CurrentWeapon.AnimationController:GetPlayingAnimationTracks());
     local v76 = v73;
     local v77 = v74;
     local v78 = v75;
     while true do
         local v79, v80 = v76(v77, v78);
         local v81 = v79;
         local v82 = v80;
         if (v79) then
             break;
         end
         v78 = v81;
         if (not string.find(v82.Name, "Idle")) then
             v82:Stop();
         end
     end
     local v83 = false;
     local v84 = string.find(p7, "Equip");
     local v85 = string.find(p7, "Idle");
     local v86 = v85;
     local v87 = u11.CurrentWeapon.Animations[p7];
     local v88 = v87;
     local v89 = u11.CurrentWeapon.AnimationController:LoadAnimation(v87);
     local v90;
     if (v85) then
         local t_Value_8 = t_LocalPlayer_1.CharacterName.Value;
         if ((t_Value_8 == "Proto") and u11.CurrentWeaponData.Ability) then
             v83 = true;
         else
             local t_Skin_9 = u11.CurrentWeaponData.Skin;
             if (t_Skin_9 == "Jade Viper") then
                 v83 = true;
             else
                 v90 = 10000;
             end
         end
     else
         v83 = true;
     end
     if (v83) then
         local v91 = false;
         if (v88:FindFirstChild("Speed")) then
             v90 = v88.Speed.Value;
             if (not v90) then
                 v91 = true;
             end
         else
             v91 = true;
         end
         if (v91) then
             v90 = 1;
         end
     end
     local v92;
     if ((v84 or v86) or ((p7 == "Defuse") or (p7 == "Powerup"))) then
         v92 = 0;
     else
         v92 = 0.1;
     end
     v89:Play(v92, nil, v90);
     p6.PlayingAnimations[v89] = true;
     local v93 = v89.Stopped;
     local u34 = p6;
     local u35 = v89;
     v93:Connect(function() -- [line 164] anonymous function
         --[[
             Upvalues: 
                 [1] = u34
                 [2] = u35
         --]]
         u34.PlayingAnimations[u35] = nil;
     end);
     if (not ((v86 or v84) and (not p8))) then
         u10:FireServer("AnimationUpdate", p7);
     end
     p6.CurrentAnimationName = p7;
     p6:ConnectAnimationMarkers(v89);
     return v89, v90;
 end;
 u1.PlayAnimation = f_PlayAnimation;
 local f_StopAnimation;
 f_StopAnimation = function(p9, p10) -- [line 179] StopAnimation
     --[[
         Upvalues: 
             [1] = u11
     --]]
     local v94, v95, v96 = pairs(u11.CurrentWeapon.AnimationController:GetPlayingAnimationTracks());
     local v97 = v94;
     local v98 = v95;
     local v99 = v96;
     while true do
         local v100, v101 = v97(v98, v99);
         local v102 = v100;
         local v103 = v101;
         if (v100) then
             break;
         end
         v99 = v102;
         local t_Name_10 = v103.Name;
         if (t_Name_10 == p10) then
             v103:Stop();
         end
     end
 end;
 u1.StopAnimation = f_StopAnimation;
 local f_UpdateAimOffset;
 f_UpdateAimOffset = function(p11) -- [line 187] UpdateAimOffset
     --[[
         Upvalues: 
             [1] = u12
             [2] = u11
             [3] = u8
     --]]
     local v104 = u12[u11.CurrentWeaponData.Weapon];
     local v105 = v104;
     local t_Class_11 = v104.Class;
     if (t_Class_11 ~= "Melee") then
         local t_Class_12 = v105.Class;
         if (t_Class_12 ~= "Bomb") then
             local t_Class_13 = v105.Class;
             if (not ((t_Class_13 == "Ability") or v105.Grenade)) then
                 local v106 = u11.CurrentWeapon:FindFirstChild("AimPart", true);
                 if (not v106) then
                     while (not v106) do
                         v106 = u11.CurrentWeapon:FindFirstChild("AimPart", true);
                         u8.RenderStepped:Wait();
                     end
                 end
                 if (v106) then
                     p11.AimOffset = v106.CFrame:ToObjectSpace(u11.CurrentWeapon.PrimaryPart.CFrame);
                 end
                 return;
             end
         end
     end
 end;
 u1.UpdateAimOffset = f_UpdateAimOffset;
 local u36 = u11;
 local u37 = u18;
 local u38 = u10;
 local u39 = u27;
 local u40 = t_LocalPlayer_1;
 local u41 = t_Assets_2;
 local u42 = v31;
 local u43 = v32;
 local u44 = u17;
 local u45 = u15;
 local u46 = t_CurrentCamera_3;
 local u47 = u7;
 local u48 = u20;
 local u49 = v30;
 local u50 = u8;
 local u51 = u23;
 local f_Equip;
 f_Equip = function(p12, p13, p14) -- [line 208] Equip
     --[[
         Upvalues: 
             [1] = u36
             [2] = u29
             [3] = u37
             [4] = u38
             [5] = u39
             [6] = u40
             [7] = u41
             [8] = u42
             [9] = u43
             [10] = u44
             [11] = u45
             [12] = u46
             [13] = u47
             [14] = u48
             [15] = u49
             [16] = u50
             [17] = u51
     --]]
     if (p13 == "Ability") then
         if (u36.CurrentWeaponData and u36.CurrentWeaponData.Ability) then
             return;
         end
     else
         if (p13 == "Bomb") then
             if (u36.CurrentWeaponData and u36.CurrentWeaponData.DoesntExist) then
                 print("Doesn't exist");
                 return;
             end
         else
             if (u36.WeaponData.Inventory[p13.Slot] and ((#u36.WeaponData.Inventory[p13.Slot]) >= 1)) then
                 if (u36.WeaponData.EquippedWeaponIndex) then
                     local t_Slot_38 = u36.WeaponData.EquippedWeaponIndex.Slot;
                     if (t_Slot_38 == p13.Slot) then
                         local t_Index_39 = u36.WeaponData.EquippedWeaponIndex.Index;
                         if ((t_Index_39 == p13.Index) and (not p14)) then
                             return;
                         end
                     end
                 end
             else
                 return;
             end
         end
     end
     if (u29.Spectating and (not p14)) then
         return;
     end
     if (u36.AbilityWeaponCooldown) then
         return;
     end
     if ((p13 == "Ability") or (p13 == "Bomb")) then
         if ((p13 == "Ability") and p12.BlockAbility) then
             return;
         end
         if ((p13 == "Bomb") and p12.BlockBomb) then
             return;
         end
     else
         local t_Slot_14 = p13.Slot;
         if ((t_Slot_14 == 1) and p12.BlockPrimary) then
             return;
         end
         local t_Slot_15 = p13.Slot;
         if ((t_Slot_15 == 2) and p12.BlockSecondary) then
             return;
         end
         local t_Slot_16 = p13.Slot;
         if ((t_Slot_16 == 5) and p12.BlockLethalUtility) then
             return;
         end
         local t_Slot_17 = p13.Slot;
         if ((t_Slot_17 == 6) and p12.BlockTacticalUtility) then
             return;
         end
     end
     p12.WeaponValue = p12.WeaponValue + 1;
     local v107 = p12.WeaponValue;
     while (not u37:IsAlive()) do
         wait();
     end
     local v108, v109, v110 = pairs(p12.PlayingAnimations);
     local v111 = v108;
     local v112 = v109;
     local v113 = v110;
     while true do
         local v114, v115 = v111(v112, v113);
         local v116 = v114;
         if (v114) then
             break;
         end
         v113 = v116;
         v116:Stop();
     end
     if (u36.CurrentWeapon and u36.CurrentWeapon.Parent) then
         u36.CurrentWeapon:Destroy();
     end
     u36.WeaponData.EquippedWeaponIndex = p13;
     u38:FireServer("EquipWeapon", p13);
     local v119;
     if (p13 == "Ability") then
         local v117 = u39.Characters[u40.CharacterName.Value];
         local v118 = {};
         v118.Ability = true;
         v118.Weapon = v117.Ability.WeaponName;
         v119 = v118;
         local t_Value_18 = u40.CharacterName.Value;
         if (t_Value_18 == "Hera") then
             p12.HeraAbility = u41.GeneralAssets.HealDisplay:Clone();
             p12.HeraAbility.Enabled = false;
             p12.HeraAbility.Parent = u40.PlayerGui;
         end
     else
         if (p13 == "Bomb") then
             local v120 = {};
             v120.DoesntExist = true;
             v120.Weapon = "Bomb";
             v119 = v120;
         else
             if (p12.HeraAbility and p12.HeraAbility.Parent) then
                 p12.HeraAbility:Destroy();
             end
             v119 = u36.WeaponData.Inventory[p13.Slot][p13.Index];
         end
     end
     warn("Success equip", v119.Weapon);
     local v121 = u42:GetWeapon(v119.Weapon, v119.Skin).ViewModel:Clone();
     local v122 = v121;
     v121.Name = "Weapon";
     local v123 = u42:GetCustomSkin(v119.Weapon, v119.Skin).ViewModel;
     local v124 = {};
     v124.RotationOffset = true;
     v124.Offset = true;
     v124.AimOffset = true;
     v124.Animations = true;
     v124.CameraShake = true;
     v124.AttributeOffsets = true;
     local v125, v126, v127 = pairs(u42:GetWeapon(v119.Weapon).ViewModel:GetChildren());
     local v128 = v125;
     local v129 = v126;
     local v130 = v127;
     while true do
         local v131, v132 = v128(v129, v130);
         local v133 = v131;
         local v134 = v132;
         if (v131) then
             break;
         end
         v130 = v133;
         if (v124[v134.Name] and (not v122:FindFirstChild(v134.Name))) then
             (v134:Clone()).Parent = v122;
         end
     end
     if (v119.Attributes) then
         local v135, v136, v137 = pairs(v119.Attributes);
         local v138 = v135;
         local v139 = v136;
         local v140 = v137;
         local v143;
         while true do
             local v141, v142 = v138(v139, v140);
             v143 = v141;
             local v144 = v142;
             if (v141) then
                 break;
             end
             v140 = v143;
             if (u43.Attributes.BulletEffects.Types[v143] and v144.Enabled) then
                 break;
             end
         end
         v122.Object.Muzzle.MuzzleEffects:ClearAllChildren();
         local v145, v146, v147 = pairs(u41.Attributes.BulletEffects[v143:sub(1, (#v143) - 7) .. "Effect"]:GetDescendants());
         local v148 = v145;
         local v149 = v146;
         local v150 = v147;
         while true do
             local v151, v152 = v148(v149, v150);
             local v153 = v151;
             local v154 = v152;
             if (v151) then
                 break;
             end
             v150 = v153;
             local t_ClassName_19 = v154.ClassName;
             if (t_ClassName_19 == "ParticleEmitter") then
                 v154.Enabled = false;
                 (v154:Clone()).Parent = v122.Object.Muzzle.MuzzleEffects;
             end
         end
     end
     u42:ApplyAttributes(v122.Object, v119.Weapon, v119.Skin, v119.Attributes);
     if (v122.Object:FindFirstChild("Dagger1")) then
         local v155, v156, v157 = pairs(v122.Object:GetDescendants());
         local v158 = v155;
         local v159 = v156;
         local v160 = v157;
         while true do
             local v161, v162 = v158(v159, v160);
             local v163 = v161;
             local v164 = v162;
             if (v161) then
                 break;
             end
             v160 = v163;
             if (v164:IsA("BasePart")) then
                 local t_Name_20 = v164.Name;
                 if (t_Name_20 == "Blade") then
                     u42:ApplyGlowEffect(v164);
                 end
             end
         end
     end
     u36.CurrentWeapon = v122;
     u36.CurrentWeaponData = v119;
     local v165 = u36;
     local v166 = {};
     v166.CameraShakeMultiplier = {};
     local v167 = u36.CurrentWeapon:FindFirstChild("RotationOffset");
     if (v167) then
         v167 = u36.CurrentWeapon.RotationOffset.Value;
     end
     v166.RotationOffset = v167;
     v165.CurrentWeaponStats = v166;
     local v168, v169, v170 = pairs(v122.Animations:GetChildren());
     local v171 = v168;
     local v172 = v169;
     local v173 = v170;
     while true do
         local v174, v175 = v171(v172, v173);
         local v176 = v174;
         local v177 = v175;
         if (v174) then
             break;
         end
         v173 = v176;
         if (v177:FindFirstChild("CameraShakeMultiplier")) then
             u36.CurrentWeaponStats.CameraShakeMultiplier[v177.Name] = v177.CameraShakeMultiplier.Value;
         else
             u36.CurrentWeaponStats.CameraShakeMultiplier[v177.Name] = 1;
         end
     end
     u36.SingleFireShot = false;
     u36.ClickShotFired = false;
     u36.Reloading = false;
     u36.Scoped = false;
     p12.MeleeCooldown = false;
     p12.GrenadeCooldown = false;
     p12.AnimationLoaded = false;
     p12.ScopeCooldown = false;
     p12.ToggleAim = false;
     p12.CancelShellReload = false;
     p12.FireNextShell = false;
     u44:SetFiring(false);
     u45:ResetRecoil();
     v122.Parent = u46;
     local v178, v179, v180 = pairs(u40.Character:GetDescendants());
     local v181 = v178;
     local v182 = v179;
     local v183 = v180;
     while true do
         local v184, v185 = v181(v182, v183);
         local v186 = v184;
         local v187 = v185;
         if (v184) then
             break;
         end
         v183 = v186;
         local t_Name_21 = v187.Name;
         if ((t_Name_21 == "Clothing") and v187:IsA("BasePart")) then
             u47:SetPartCollisionGroup(v187, "DroppedItems");
             v187.CanCollide = false;
         end
     end
     if (game.ReplicatedStorage.Characters:FindFirstChild(u40.CharacterName.Value) and (v122:FindFirstChild("Arms") or v122:FindFirstChild("ArmLeft"))) then
         local v188, v189, v190 = pairs(game.ReplicatedStorage.Characters[u40.CharacterName.Value].Arms:GetChildren());
         local v191 = v188;
         local v192 = v189;
         local v193 = v190;
         while true do
             local v194, v195 = v191(v192, v193);
             local v196 = v194;
             local v197 = v195;
             if (v194) then
                 break;
             end
             local v198 = false;
             v193 = v196;
             local t_BaseArm_22 = v197.BaseArm;
             local v199 = v122:FindFirstChild("Arms");
             local v200 = v199;
             local v201;
             if (v199) then
                 v201 = v122.Arms[v197.Name]:GetChildren()[1];
                 if (not v201) then
                     v198 = true;
                 end
             else
                 v198 = true;
             end
             if (v198) then
                 v201 = v122["Arm" .. v197.Name];
             end
             local v202, v203, v204 = pairs(v197:GetChildren());
             local v205 = v202;
             local v206 = v203;
             local v207 = v204;
             while true do
                 local v208, v209 = v205(v206, v207);
                 local v210 = v208;
                 local v211 = v209;
                 if (v208) then
                     break;
                 end
                 v207 = v210;
                 local t_Name_23 = v211.Name;
                 if (t_Name_23 == "CharacterClothing") then
                     local v212 = t_BaseArm_22.CFrame:ToObjectSpace(v211.CFrame);
                     local v213 = v211:Clone();
                     local v214 = v213;
                     v213.CanCollide = false;
                     v213.CanTouch = false;
                     v213.CanQuery = false;
                     v213.Anchored = false;
                     v213.Massless = true;
                     v213.CFrame = v201.CFrame * v212;
                     v213.Parent = v201;
                     if (v200) then
                         u37:WeldBetween(v201, v214);
                     end
                 end
             end
         end
     end
     local v215, v216, v217 = pairs(v122:GetDescendants());
     local v218 = v215;
     local v219 = v216;
     local v220 = v217;
     while true do
         local v221, v222 = v218(v219, v220);
         local v223 = v221;
         local v224 = v222;
         if (v221) then
             break;
         end
         v220 = v223;
         if (v224:IsA("BasePart")) then
             u47:SetPartCollisionGroup(v224, "DroppedItems");
             v224.CanCollide = false;
             v224.CastShadow = false;
             v224.CanTouch = false;
             v224.CanQuery = false;
         end
     end
     if (v122:FindFirstChild("Arms")) then
         local v225 = game.ReplicatedStorage.Characters[u40.CharacterName.Value];
         v122.Arms.Left["Left Arm"].Color = v225.Character.StarterCharacter.LeftUpperArm.Color;
         v122.Arms.Right["Right Arm"].Color = v225.Character.StarterCharacter.RightUpperArm.Color;
     end
     u48:AddWeaponToViewport();
     u44:SetFiring(false);
     p12.MuzzleActivated = false;
     p12.CanFire = false;
     p12.EquipCooldown = true;
     u49(p12, "CurrentAimLerp", 1, 10, 1);
     p12.LastCameraOffset = CFrame.new();
     p12.LastSpringRecoilX = 0;
     p12.LastSpringRecoilY = 0;
     p12.LastCameraJumpOffset = 0;
     p12.LastMovementTick = nil;
     p12.LastFireTick = 0;
     p12.LastClickTick = 0;
     p12.InspectCooldown = 0;
     local v226 = false;
     local t_Value_24 = u40.CharacterName.Value;
     if (t_Value_24 == "Edira") then
         v226 = p13 == "Ability";
     end
     local v227 = false;
     local t_Value_25 = u40.CharacterName.Value;
     if (t_Value_25 == "Zyla") then
         v227 = p13 == "Ability";
     end
     local v228 = false;
     local t_Value_26 = u40.CharacterName.Value;
     if (t_Value_26 == "Proto") then
         v228 = p13 == "Ability";
     end
     local v229 = false;
     local t_Weapon_27 = u36.CurrentWeaponData.Weapon;
     if (t_Weapon_27 == "Chancellor") then
         v229 = u36.CurrentWeaponData.Skin == "Jade Viper";
     end
     local u52 = nil;
     if (not v226) then
         local v230 = false;
         local t_Value_28 = u40.CharacterName.Value;
         local v231;
         if (t_Value_28 == "Kane") then
             local t_Weapon_29 = u36.CurrentWeaponData.Weapon;
             if (t_Weapon_29 == "Kane ViewModel") then
                 if (u36.KaneExplosivePlaced) then
                     v231 = "Detonator Idle";
                 else
                     v231 = "Bomb Idle";
                 end
             else
                 v230 = true;
             end
         else
             v230 = true;
         end
         if (v230) then
             v231 = "Idle";
         end
         u52 = p12:PlayAnimation(v231);
     end
     p12.EquipTick = tick();
     local t_EquipTick_30 = p12.EquipTick;
     if (v228 or v229) then
         local v232 = p12:PlayAnimation("Equip");
         while true do
             local t_EquipTick_37 = p12.EquipTick;
             if (t_EquipTick_37 == t_EquipTick_30) then
                 u50.Heartbeat:wait();
                 if (v232.Length >= 0) then
                     p12.AnimationLoaded = true;
                     break;
                 end
             else
                 break;
             end
         end
         local v233 = v232.Stopped;
         local u53 = p12;
         v233:Connect(function() -- [line 496] anonymous function
             --[[
                 Upvalues: 
                     [1] = u53
             --]]
             u53.CanFire = true;
         end);
     end
     if (not ((v226 or v227) or (v228 or v229))) then
         if (p13 == "Bomb") then
             p12.CanFire = true;
             local v234 = p12:PlayAnimation("Defuse");
             local v235 = v234;
             u51:ConnectWeaponSound(v234);
             while true do
                 local t_EquipTick_36 = p12.EquipTick;
                 if (t_EquipTick_36 == t_EquipTick_30) then
                     u50.Heartbeat:wait();
                     if (v235.Length >= 0) then
                         break;
                     end
                 else
                     break;
                 end
             end
             p12.AnimationLoaded = true;
         else
             local v236 = coroutine.wrap;
             local u54 = p12;
             local u55 = t_EquipTick_30;
             v236(function() -- [line 503] anonymous function
                 --[[
                     Upvalues: 
                         [1] = u52
                         [2] = u50
                         [3] = u54
                         [4] = u55
                         [5] = u40
                         [6] = u36
                         [7] = u51
                 --]]
                 local u56 = nil;
                 local u57 = false;
                 u56 = u52.DidLoop:Connect(function() -- [line 507] anonymous function
                     --[[
                         Upvalues: 
                             [1] = u57
                             [2] = u50
                             [3] = u54
                             [4] = u56
                     --]]
                     if (u57) then
                         return;
                     end
                     u57 = true;
                     u50.RenderStepped:Wait();
                     u54:UpdateAimOffset();
                     u56:Disconnect();
                     u56 = nil;
                 end);
                 while true do
                     local t_EquipTick_31 = u54.EquipTick;
                     if ((t_EquipTick_31 == u55) and u56) then
                         u50.Heartbeat:wait();
                     else
                         break;
                     end
                 end
                 local t_EquipTick_32 = u54.EquipTick;
                 if (t_EquipTick_32 ~= u55) then
                     return;
                 end
                 local v237 = false;
                 local t_Value_33 = u40.CharacterName.Value;
                 local v238;
                 if (t_Value_33 == "Kane") then
                     local t_Weapon_34 = u36.CurrentWeaponData.Weapon;
                     if (t_Weapon_34 == "Kane ViewModel") then
                         if (u36.KaneExplosivePlaced) then
                             v238 = "Detonator Equip";
                         else
                             v238 = "Bomb Equip";
                         end
                     else
                         v237 = true;
                     end
                 else
                     v237 = true;
                 end
                 if (v237) then
                     v238 = "Equip";
                 end
                 local v239 = u54:PlayAnimation(v238);
                 local v240 = v239;
                 u51:ConnectWeaponSound(v239);
                 v239.Stopped:Connect(function() -- [line 537] anonymous function
                     --[[
                         Upvalues: 
                             [1] = u54
                     --]]
                     u54.CanFire = true;
                 end);
                 while true do
                     local t_EquipTick_35 = u54.EquipTick;
                     if (t_EquipTick_35 == u55) then
                         u50.Heartbeat:wait();
                         if (v240.Length >= 0) then
                             u54.AnimationLoaded = true;
                             warn("Loaded");
                             break;
                         end
                     else
                         break;
                     end
                 end
             end)();
         end
     end
     u48:UpdateShop();
     local v241 = coroutine.wrap;
     local u58 = p12;
     v241(function() -- [line 570] anonymous function
         --[[
             Upvalues: 
                 [1] = u58
         --]]
         wait(0.1);
         u58.EquipCooldown = false;
     end)();
     return true;
 end;
 u1.Equip = f_Equip;
 local f_IsMoving;
 f_IsMoving = function(p15) -- [line 578] IsMoving
     --[[
         Upvalues: 
             [1] = u19
     --]]
     local v242 = u19.PlaneMagnitude;
     if (v242) then
         v242 = 0 < u19.PlaneMagnitude;
     end
     return v242;
 end;
 u1.IsMoving = f_IsMoving;
 local f_GenerateGUID;
 f_GenerateGUID = function(p16) -- [line 582] GenerateGUID
     --[[
         Upvalues: 
             [1] = u5
     --]]
     return u5:GenerateGUID();
 end;
 u1.GenerateGUID = f_GenerateGUID;
 local f_EjectBullet;
 f_EjectBullet = function(p17, p18) -- [line 586] EjectBullet
     --[[
         Upvalues: 
             [1] = u25
             [2] = u12
             [3] = u11
             [4] = u13
             [5] = t_Assets_2
             [6] = t_LocalPlayer_1
             [7] = u4
             [8] = u7
             [9] = u6
             [10] = t_CurrentCamera_3
             [11] = u23
     --]]
     if (not u25.Settings["Show Shell Ejections"]) then
         return;
     end
     local v243 = u12[u11.CurrentWeaponData.Weapon];
     local v244 = u13[v243.BulletType];
     local v245 = p18:GetMarkerReachedSignal("EjectBullet");
     local u59 = v243;
     local u60 = v244;
     v245:Connect(function() -- [line 594] anonymous function
         --[[
             Upvalues: 
                 [1] = u11
                 [2] = t_Assets_2
                 [3] = u59
                 [4] = t_LocalPlayer_1
                 [5] = u4
                 [6] = u7
                 [7] = u6
                 [8] = t_CurrentCamera_3
                 [9] = u23
                 [10] = u60
         --]]
         local v246 = false;
         local v247 = u11.CurrentWeapon.Object:FindFirstChild("BulletEjection", true).CFrame;
         local v248 = t_Assets_2.Casings[u59.BulletType .. "Casing"]:Clone();
         local v249 = v248;
         v248.CFrame = v247 * CFrame.Angles(math.rad(v248.RotationOffset.Value.X), math.rad(v248.RotationOffset.Value.Y), math.rad(v248.RotationOffset.Value.Z));
         v248.Parent = workspace.RaycastIgnore;
         local t_lookVector_40 = v247.lookVector;
         local v250;
         if (v248:FindFirstChild("SpeedMultiplier")) then
             v250 = v249.SpeedMultiplier.Value;
             if (not v250) then
                 v246 = true;
             end
         else
             v246 = true;
         end
         if (v246) then
             v250 = 10;
         end
         v249.AssemblyLinearVelocity = (((t_lookVector_40 * v250) * 0.6) + t_LocalPlayer_1.Character.HumanoidRootPart.Velocity) + u59.EjectionVelocity;
         v249.AssemblyAngularVelocity = Vector3.new(0, u4:NextNumber(90, 180), 0);
         u7:SetPartCollisionGroup(v249, "DroppedItems");
         u6:AddItem(v249, 2);
         local u61 = nil;
         local v251 = v249.Touched;
         local u62 = v249;
         u61 = v251:Connect(function(p19) -- [line 610] anonymous function
             --[[
                 Upvalues: 
                     [1] = t_CurrentCamera_3
                     [2] = t_LocalPlayer_1
                     [3] = u23
                     [4] = u62
                     [5] = u60
                     [6] = u61
             --]]
             if ((not (p19:IsDescendantOf(t_CurrentCamera_3) or p19:IsDescendantOf(t_LocalPlayer_1.Character))) and p19.CanCollide) then
                 local v252 = u23;
                 local v253 = {};
                 v253.Parent = u62;
                 v253.Volume = u60.CasingLoudness;
                 v252:PlaySound("Bullet Casing", v253);
                 u61:Disconnect();
                 u61 = nil;
             end
         end);
         wait(2);
         v249:Destroy();
         if (u61) then
             u61:Disconnect();
         end
     end);
 end;
 u1.EjectBullet = f_EjectBullet;
 local u63 = t_LocalPlayer_1;
 local u64 = t_MapFolder_4;
 local u65 = u18;
 local u66 = u12;
 local u67 = u11;
 local u68 = v32;
 local u69 = t_Assets_2;
 local f_FireBullet;
 f_FireBullet = function(p20, p21) -- [line 632] FireBullet
     --[[
         Upvalues: 
             [1] = u63
             [2] = u64
             [3] = u65
             [4] = u66
             [5] = u67
             [6] = u68
             [7] = u69
             [8] = u29
     --]]
     p21.Penetrated = {};
     local v254 = RaycastParams.new();
     local v255 = v254;
     v254.FilterType = Enum.RaycastFilterType.Blacklist;
     v254.FilterDescendantsInstances = {
         u63.Character,
         workspace.CurrentCamera,
         workspace.RaycastIgnore,
         workspace.DroppedWeapons,
         unpack(p21.Ignore),
         u64.Map.Ramps,
         u64.Map.Walls.MapWalls
     };
     local v256 = workspace:Raycast(p21.OriginCFrame.p, p21.OriginCFrame.lookVector * 500, v254);
     if (not v256) then
         v256 = {};
         v256.Position = p21.OriginCFrame * CFrame.new(0, 0, -500).p;
     end
     local v257 = workspace:Raycast(p21.BulletCFrame.p, p21.BulletCFrame.lookVector * 500, v255);
     if (not v257) then
         v257 = {};
         v257.Position = p21.BulletCFrame * CFrame.new(0, 0, -500).p;
     end
     if (((v257.Position - v256.Position).magnitude >= 0.0001) and v256.Instance) then
         p21.BulletCFrame = p21.OriginCFrame * CFrame.new(0, 0, -((p21.OriginCFrame.p - v256.Position).magnitude - 0.01));
     end
     local v258 = u65:DeepCopyTable(p21);
     local v259 = v258;
     local v260 = v258.Weapon;
     if (v260) then
         v260 = u66[v259.Weapon];
     end
     local v261 = false;
     local v262 = nil;
     if (u67.CurrentWeaponData and u67.CurrentWeaponData.Attributes) then
         local t_Owner_41 = v259.Owner;
         if (t_Owner_41 == u63) then
             local v263, v264, v265 = pairs(u67.CurrentWeaponData.Attributes);
             local v266 = v263;
             local v267 = v264;
             local v268 = v265;
             local v271;
             while true do
                 local v269, v270 = v266(v267, v268);
                 v271 = v269;
                 local v272 = v270;
                 if (v269) then
                     break;
                 end
                 v268 = v271;
                 if (u68.Attributes.BulletEffects.Types[v271] and v272.Enabled) then
                     break;
                 end
             end
             v262 = u69.Attributes.BulletEffects[v271:sub(1, (#v271) - 7) .. "Bullet"];
         else
             v261 = true;
         end
     else
         v261 = true;
     end
     if (v261) then
         if (u29.SpectatingPlayer and u65:IsAlive(u29.SpectatingPlayer)) then
             local t_Owner_44 = v259.Owner;
             if (t_Owner_44 == u29.SpectatingPlayer) then
                 local v273, v274, v275 = pairs(u29.SpectatingWeaponData.Attributes);
                 local v276 = v273;
                 local v277 = v274;
                 local v278 = v275;
                 local v281;
                 while true do
                     local v279, v280 = v276(v277, v278);
                     v281 = v279;
                     local v282 = v280;
                     if (v279) then
                         break;
                     end
                     v278 = v281;
                     if (u68.Attributes.BulletEffects.Types[v281] and v282.Enabled) then
                         break;
                     end
                 end
                 v262 = u69.Attributes.BulletEffects[v281:sub(1, (#v281) - 7) .. "Bullet"];
             end
         end
     end
     if (not v262) then
         v262 = u69.Bullets[v259.BulletType]:Clone();
     end
     local v283 = v262:Clone();
     local v284 = v283;
     v283.Name = "Bullet";
     v283.CFrame = v259.OriginCFrame;
     v283.TracerBoard.Enabled = false;
     v283.Parent = workspace.RaycastIgnore;
     local v285, v286, v287 = pairs(v283:GetChildren());
     local v288 = v285;
     local v289 = v286;
     local v290 = v287;
     while true do
         local v291, v292 = v288(v289, v290);
         local v293 = v291;
         local v294 = v292;
         if (v291) then
             break;
         end
         v290 = v293;
         local t_Name_42 = v294.Name;
         if (t_Name_42 == "Trail") then
             v294.Enabled = false;
         end
     end
     local v295 = false;
     v259.Bullet = v284;
     local v296;
     if (v260) then
         v296 = v260.Penetration.High;
         if (not v296) then
             v295 = true;
         end
     else
         v295 = true;
     end
     if (v295) then
         v296 = 0;
     end
     local v297 = false;
     v259.HighPenetrationLeft = v296;
     local v298;
     if (v260) then
         v298 = v260.Penetration.Medium;
         if (not v298) then
             v297 = true;
         end
     else
         v297 = true;
     end
     if (v297) then
         v298 = 0;
     end
     local v299 = false;
     v259.MediumPenetrationLeft = v298;
     local v300;
     if (v260) then
         v300 = v260.Penetration.Low;
         if (not v300) then
             v299 = true;
         end
     else
         v299 = true;
     end
     if (v299) then
         v300 = 0;
     end
     local v301 = false;
     v259.LowPenetrationLeft = v300;
     local v302;
     if (v260) then
         v302 = v260.Penetration.Players;
         if (not v302) then
             v301 = true;
         end
     else
         v301 = true;
     end
     if (v301) then
         v302 = 0;
     end
     local v303 = false;
     v259.PlayerPenetrationLeft = v302;
     p20.Bullets[v259.BulletID] = v259;
     p20:RenderBullets();
     local v304 = u65:DeepCopyTable(p21);
     local v305 = v304;
     local v306 = v262:Clone();
     v306.Name = "Bullet";
     v306.CFrame = v304.BulletCFrame;
     v306.Parent = workspace.RaycastIgnore;
     v304.Bullet = v306;
     local v307;
     if (v260) then
         v307 = v260.Penetration.High;
         if (not v307) then
             v303 = true;
         end
     else
         v303 = true;
     end
     if (v303) then
         v307 = 0;
     end
     local v308 = false;
     v305.HighPenetrationLeft = v307;
     local v309;
     if (v260) then
         v309 = v260.Penetration.Medium;
         if (not v309) then
             v308 = true;
         end
     else
         v308 = true;
     end
     if (v308) then
         v309 = 0;
     end
     local v310 = false;
     v305.MediumPenetrationLeft = v309;
     local v311;
     if (v260) then
         v311 = v260.Penetration.Low;
         if (not v311) then
             v310 = true;
         end
     else
         v310 = true;
     end
     if (v310) then
         v311 = 0;
     end
     local v312 = false;
     v305.LowPenetrationLeft = v311;
     local v313;
     if (v260) then
         v313 = v260.Penetration.Players;
         if (not v313) then
             v312 = true;
         end
     else
         v312 = true;
     end
     if (v312) then
         v313 = 0;
     end
     v305.PlayerPenetrationLeft = v313;
     v305.Tracer = true;
     local v314 = coroutine.wrap;
     local u70 = v305;
     local u71 = p20;
     v314(function() -- [line 742] anonymous function
         --[[
             Upvalues: 
                 [1] = u70
                 [2] = u63
                 [3] = u71
         --]]
         local t_Owner_43 = u70.Owner;
         if (t_Owner_43 ~= u63) then
             wait();
         end
         u71.Bullets[u70.BulletID .. "Tracer"] = u70;
     end)();
 end;
 u1.FireBullet = f_FireBullet;
 local f_GetCameraCFrameFromOtherLevel;
 f_GetCameraCFrameFromOtherLevel = function() -- [line 751] GetCameraCFrameFromOtherLevel
     --[[
         Upvalues: 
             [1] = t_CurrentCamera_3
     --]]
     return t_CurrentCamera_3.CFrame;
 end;
 local u72;
 u72 = function() -- [line 755] anonymous function
     return nil;
 end;
 local u73;
 u73 = function() -- [line 756] anonymous function
     return nil;
 end;
 local v315;
 v315 = function() -- [line 757] anonymous function
     return nil;
 end;
 local f_Reload;
 f_Reload = function(p22) -- [line 759] Reload
     --[[
         Upvalues: 
             [1] = u11
             [2] = t_LocalPlayer_1
             [3] = u12
             [4] = u23
             [5] = u10
             [6] = u18
             [7] = u8
     --]]
     local v316 = false;
     if (u11.AbilityInUse) then
         local t_Value_45 = t_LocalPlayer_1.CharacterName.Value;
         if (t_Value_45 == "Zolt") then
             v316 = true;
         end
     end
     local v317 = u12[u11.CurrentWeaponData.Weapon];
     local v318 = v317;
     if (((not v316) and u11.CurrentWeaponData) and (u11.CurrentWeaponData.Bullets and v317.MaxBullets)) then
         local t_Bullets_46 = u11.CurrentWeaponData.Bullets;
         if ((((t_Bullets_46 <= v318.MaxBullets) and p22.CanFire) and ((not u11.Reloading) and (u11.CurrentWeaponData.ReserveAmmo >= 0))) and (not u11.BombTick)) then
             u11.Reloading = true;
             p22.ToggleAim = false;
             if (v318.ShellReload) then
                 p22.CancelShellReload = false;
                 local v319 = p22:PlayAnimation("ReloadOpen");
                 u23:ConnectWeaponSound(v319);
                 v319.Stopped:wait();
                 local v320 = math.min(v318.MaxBullets - u11.CurrentWeaponData.Bullets, u11.CurrentWeaponData.ReserveAmmo);
                 local v321 = 1;
                 local v322 = v320;
                 local v323 = v321;
                 if (not (v320 <= v323)) then
                     while (not p22.CancelShellReload) do
                         local v324 = p22:PlayAnimation("ReloadLoop");
                         u23:ConnectWeaponSound(v324);
                         u10:FireServer("ReloadStart");
                         v324.Stopped:wait();
                         if (u18:IsAlive()) then
                             local v325 = u11.CurrentWeaponData.Bullets;
                             local t_MaxBullets_47 = v318.MaxBullets;
                             if (t_MaxBullets_47 < v325) then
                                 break;
                             end
                             u10:FireServer("ReloadShellEnd");
                             local v326 = u11.CurrentWeaponData;
                             v326.Bullets = v326.Bullets + 1;
                             local v327 = u11.CurrentWeaponData;
                             v327.ReserveAmmo = v327.ReserveAmmo - 1;
                             local v328 = v321 + 1;
                             v321 = v328;
                             local v329 = v322;
                             if (v329 < v328) then
                                 break;
                             end
                         else
                             break;
                         end
                     end
                     return;
                 end
                 local v330 = nil;
                 local v331 = nil;
                 local v332 = nil;
                 local v333 = nil;
                 if (not p22.CancelShellReload) then
                     p22.ReloadingValue = p22.ReloadingValue + 1;
                     v333 = p22.ReloadingValue;
                     local v334, v335 = p22:PlayAnimation("ReloadEnd");
                     local v336 = v334;
                     local v337 = v335;
                     u23:ConnectWeaponSound(v334);
                     while true do
                         local t_Length_48 = v336.Length;
                         if (t_Length_48 == 0) then
                             u8.RenderStepped:wait();
                         else
                             break;
                         end
                     end
                     v331 = v336.Length / v337;
                     v332 = (v331 - 0.2) - 0.1;
                     wait(v332);
                     v330 = tick();
                 end
                 local v338 = u10:InvokeServer("ReloadEnd");
                 local v339 = v338;
                 local t_EquippedWeaponIndex_49 = v338.EquippedWeaponIndex;
                 if (not u18:IsAlive()) then
                     return;
                 end
                 v339.EquippedWeaponIndex = u11.WeaponData.EquippedWeaponIndex;
                 u11.WeaponData = v339;
                 local t_Slot_50 = u11.WeaponData.EquippedWeaponIndex.Slot;
                 if (t_Slot_50 == t_EquippedWeaponIndex_49.Slot) then
                     u11.CurrentWeaponData = u11.WeaponData.Inventory[t_EquippedWeaponIndex_49.Slot][1];
                 end
                 if (v330) then
                     local v340 = tick() - v330;
                     local v341 = ((v331 - v332) - v340) - 0.1;
                     wait((v331 - v332) - v340);
                     local t_ReloadingValue_51 = p22.ReloadingValue;
                     if (not ((t_ReloadingValue_51 == v333) and u11.Reloading)) then
                         return;
                     end
                 end
                 u11.Reloading = false;
                 p22.CancelShellReload = false;
                 p22.ScopeCooldown = false;
                 return;
             end
             p22.ReloadingValue = p22.ReloadingValue + 1;
             local t_ReloadingValue_52 = p22.ReloadingValue;
             local v342, v343 = p22:PlayAnimation("Reload");
             local v344 = v342;
             local v345 = v343;
             u23:ConnectWeaponSound(v342);
             u10:FireServer("ReloadStart");
             while true do
                 local t_Length_53 = v344.Length;
                 if (t_Length_53 == 0) then
                     u8.RenderStepped:wait();
                 else
                     break;
                 end
             end
             local v346 = v344.Length / v345;
             local v347 = v346;
             local v348 = (v346 - 0.2) - 0.1;
             local v349 = tick();
             local t_ReloadingValue_54 = p22.ReloadingValue;
             if ((t_ReloadingValue_54 == t_ReloadingValue_52) and u11.Reloading) then
                 wait(v348);
                 local v350 = u10:InvokeServer("ReloadEnd");
                 local v351 = v350;
                 local t_EquippedWeaponIndex_55 = v350.EquippedWeaponIndex;
                 if (u18:IsAlive()) then
                     v351.EquippedWeaponIndex = u11.WeaponData.EquippedWeaponIndex;
                     u11.WeaponData = v351;
                     local t_Slot_56 = u11.WeaponData.EquippedWeaponIndex.Slot;
                     if (t_Slot_56 == t_EquippedWeaponIndex_55.Slot) then
                         u11.CurrentWeaponData = u11.WeaponData.Inventory[t_EquippedWeaponIndex_55.Slot][1];
                     end
                     local v352 = tick() - v349;
                     local v353 = ((v347 - v348) - v352) - 0.1;
                     wait((v347 - v348) - v352);
                     local t_ReloadingValue_57 = p22.ReloadingValue;
                     if ((t_ReloadingValue_57 == t_ReloadingValue_52) and u11.Reloading) then
                         u11.Reloading = false;
                         p22.ScopeCooldown = false;
                     else
                         return;
                     end
                 else
                     return;
                 end
             else
                 return;
             end
         end
     end
 end;
 u1.Reload = f_Reload;
 local f_Shoot;
 f_Shoot = function(p23, p24) -- [line 910] Shoot
     --[[
         Upvalues: 
             [1] = u11
             [2] = u12
             [3] = u23
             [4] = u72
             [5] = t_CurrentCamera_3
             [6] = f_GetCameraCFrameFromOtherLevel
             [7] = u73
             [8] = u26
             [9] = u4
             [10] = u15
             [11] = t_LocalPlayer_1
             [12] = t_MapFolder_4
             [13] = u10
             [14] = u17
     --]]
     local t_Bullets_58 = u11.CurrentWeaponData.Bullets;
     if (t_Bullets_58 < 0) then
         return;
     end
     local t_BlockShooting_59 = p23.BlockShooting;
     if (t_BlockShooting_59 == true) then
         return;
     end
     local v354, v355, v356 = pairs(u11.CurrentWeapon.Object.Muzzle.MuzzleEffects:GetChildren());
     local v357 = v354;
     local v358 = v355;
     local v359 = v356;
     while true do
         local v360, v361 = v357(v358, v359);
         local v362 = v360;
         local v363 = v361;
         if (v360) then
             break;
         end
         v359 = v362;
         v363.Enabled = false;
         v363:Emit(2);
     end
     p23.StartShootTick = tick();
     local v364 = u12[u11.CurrentWeaponData.Weapon];
     local v365 = v364;
     local v366 = u12[v364.BulletType];
     local t_InfiniteAmmo_60 = p23.InfiniteAmmo;
     if (t_InfiniteAmmo_60 == false) then
         local v367 = u11.CurrentWeaponData;
         v367.Bullets = v367.Bullets - 1;
     end
     local v368;
     if (u11.Aiming) then
         v368 = 0.7;
     else
         v368 = 1;
     end
     local v369;
     if (u11.Aiming) then
         v369 = 0.85;
     else
         v369 = 1;
     end
     if (not p24) then
         local v370 = false;
         local v371;
         if (u11.Aiming and u11.CurrentWeapon.Animations:FindFirstChild("AimShoot")) then
             v371 = p23:PlayAnimation("AimShoot");
             if (not v371) then
                 v370 = true;
             end
         else
             v370 = true;
         end
         if (v370) then
             v371 = p23:PlayAnimation("Shoot");
         end
         local v372 = v371;
         local v373 = v372;
         u23:ConnectWeaponSound(v372);
         p23:EjectBullet(v372);
         local t_FireType_61 = v365.FireType;
         if (t_FireType_61 == "Burst") then
             local v374 = v373:GetMarkerReachedSignal("Fire");
             local u74 = p23;
             v374:Connect(function() -- [line 944] anonymous function
                 --[[
                     Upvalues: 
                         [1] = u74
                 --]]
                 u74:Shoot(true);
             end);
         end
     end
     local v375 = 1;
     local t_Class_62 = v365.Class;
     if (t_Class_62 == "Shotgun") then
         v375 = v365.Pellets;
     end
     local v376 = u72();
     local v377 = t_CurrentCamera_3.CFrame;
     if (u11.Aiming) then
         v377 = CFrame.new(t_CurrentCamera_3.CFrame.p, ((t_CurrentCamera_3.CFrame * CFrame.new(u11.CurrentWeapon.AimOffset.Value)) * u11.CurrentWeapon:FindFirstChild("AimPart", true).CFrame:ToObjectSpace(u11.CurrentWeapon.Object.AimPartEnd.CFrame)).p);
     end
     local t_lookVector_63 = f_GetCameraCFrameFromOtherLevel().lookVector;
     if (t_lookVector_63 == t_CurrentCamera_3.CFrame.lookVector) then
         local v378 = u73();
         local v379 = u26();
         local v380 = {};
         local v381 = 1;
         local v382 = v375;
         local v383 = v382;
         local v384 = v381;
         if (not (v382 <= v384)) then
             while true do
                 local t_Class_64 = v365.Class;
                 local v388;
                 if (t_Class_64 == "Shotgun") then
                     local v385 = u4:NextNumber(-v365.Spread, v365.Spread);
                     local v386 = u4:NextNumber(-v365.Spread, v365.Spread);
                     local v387 = {};
                     v387.X = v385 * 0.016;
                     v387.Y = v386 * 0.016;
                     v388 = v387;
                     local v389 = v365.Pellets;
                 else
                     v388 = u15:GetRecoilOffset();
                 end
                 local v390 = RaycastParams.new();
                 local v391 = v390;
                 v390.FilterType = Enum.RaycastFilterType.Blacklist;
                 v390.FilterDescendantsInstances = {
                     t_LocalPlayer_1.Character,
                     workspace.CurrentCamera,
                     workspace.RaycastIgnore,
                     workspace.DroppedWeapons,
                     t_MapFolder_4.Map.Ramps,
                     t_MapFolder_4.Map.Walls,
                     unpack(v379)
                 };
                 if (not workspace:Raycast(v377.p, v377.lookVector * 500, v390)) then
                     ({}).Position = v377 * CFrame.new(0, 0, -500).p;
                 end
                 local v392 = CFrame.new(v377.p, ((v377 * CFrame.new(0, 0, -1)) * CFrame.new(v388.X * v368, v388.Y * v368, 0)).p);
                 local v393 = v392;
                 local v394 = v377:ToObjectSpace(v392);
                 local v395 = workspace:Raycast(v392.p, v392.lookVector * 500, v391);
                 if (not v395) then
                     v395 = {};
                     v395.Position = v393 * CFrame.new(0, 0, -500).p;
                 end
                 local v396 = CFrame.new(u11.CurrentWeapon.Object.Muzzle.Position, v395.Position);
                 local v397 = {};
                 v397.BulletID = p23:GenerateGUID();
                 v397.BulletType = v365.BulletType;
                 v397.Weapon = u11.CurrentWeaponData.Weapon;
                 v397.BulletCFrame = v396;
                 v397.OriginCFrame = v393;
                 v397.RotationMatrix = (v377 - v377.p) * (v394 - v394.p);
                 v397.CreatedTick = tick();
                 v397.Ignore = {
                     t_LocalPlayer_1.Character,
                     unpack(v379)
                 };
                 v397.Owner = t_LocalPlayer_1;
                 table.insert(v380, v397);
                 local v398 = v381 + 1;
                 v381 = v398;
                 local v399 = v383;
                 if (v399 < v398) then
                     break;
                 end
             end
         end
         u10:FireServer("FireBullet", v380, t_LocalPlayer_1.Character.HumanoidRootPart.CFrame);
         local v400 = 1;
         local v401 = #v380;
         local v402 = v401;
         local v403 = v400;
         if (not (v401 <= v403)) then
             while true do
                 p23:FireBullet(v380[v400]);
                 local v404 = v400 + 1;
                 v400 = v404;
                 local v405 = v402;
                 if (v405 < v404) then
                     break;
                 end
             end
         end
         u15:AddRecoil(v368);
         u17:AddCameraBounce(v369);
         local t_Class_65 = v365.Class;
         if (t_Class_65 == "Sniper") then
             p23.ScopeCooldown = true;
             p23.CurrentAimLerp.Position = 0;
             t_CurrentCamera_3.FieldOfView = 80;
         end
         return;
     end
     while true do
     end
 end;
 u1.Shoot = f_Shoot;
 local f_ThrowGrenade;
 f_ThrowGrenade = function(p25, p26) -- [line 1052] ThrowGrenade
     --[[
         Upvalues: 
             [1] = u23
             [2] = u11
             [3] = u12
             [4] = t_CurrentCamera_3
             [5] = u10
             [6] = u20
             [7] = u8
     --]]
     if (p25.BlockGrenadeThrow) then
         return;
     end
     local v406;
     if (p26 == "Far") then
         v406 = "Throw";
     else
         v406 = "ShortThrow";
     end
     local v407 = p25:PlayAnimation(v406);
     local v408 = v407;
     u23:ConnectWeaponSound(v407);
     local u75 = false;
     local u76 = nil;
     local t_Weapon_66 = u11.CurrentWeaponData.Weapon;
     if (t_Weapon_66 == "Molotov") then
         v408:GetMarkerReachedSignal("Light"):Connect(function() -- [line 1064] anonymous function
             --[[
                 Upvalues: 
                     [1] = u11
             --]]
             u11.CurrentWeapon.Object.Cloth.Cloth.Fire.Enabled = true;
             u11.CurrentWeapon.Object.Cloth.Cloth.Smoke.Enabled = true;
         end);
         v408:GetMarkerReachedSignal("FireOn"):Connect(function() -- [line 1069] anonymous function
             --[[
                 Upvalues: 
                     [1] = u11
             --]]
             u11.CurrentWeapon.Object.Particles.ParticleEmitter.Enabled = true;
             u11.CurrentWeapon.Object.Particles.PointLight.Enabled = true;
         end);
         v408:GetMarkerReachedSignal("FireOff"):Connect(function() -- [line 1074] anonymous function
             --[[
                 Upvalues: 
                     [1] = u11
             --]]
             u11.CurrentWeapon.Object.Particles.ParticleEmitter.Enabled = false;
             u11.CurrentWeapon.Object.Particles.PointLight.Enabled = false;
         end);
     end
     local v409 = v408:GetMarkerReachedSignal("Throw");
     local u77 = p26;
     v409:Connect(function() -- [line 1080] anonymous function
         --[[
             Upvalues: 
                 [1] = u12
                 [2] = u11
                 [3] = t_CurrentCamera_3
                 [4] = u77
                 [5] = u10
                 [6] = u20
                 [7] = u75
                 [8] = u76
         --]]
         local v410 = false;
         local v411 = u12[u11.CurrentWeaponData.Weapon];
         local v412 = {};
         v412.GrenadeName = u11.CurrentWeaponData.Weapon;
         v412.GrenadeCFrame = t_CurrentCamera_3.CFrame;
         local v413 = u77;
         local v414;
         if (v413 == "Far") then
             v414 = v411.ThrowVelocity;
             if (not v414) then
                 v410 = true;
             end
         else
             v410 = true;
         end
         if (v410) then
             v414 = v411.WeakThrowVelocity;
         end
         v412.InitialVelocity = v414;
         if (u10:InvokeServer("ThrowGrenade", v412)) then
             local v415 = u11.WeaponData.EquippedWeaponIndex;
             local v416 = u11.CurrentWeaponData;
             v416.Amount = v416.Amount - 1;
             table.remove(u11.WeaponData.Inventory[v415.Slot], v415.Index);
             u20:UpdateShop();
         else
             u75 = true;
         end
         u76 = true;
     end);
     local v417 = v408.Stopped;
     local u78 = p25;
     v417:Connect(function() -- [line 1106] anonymous function
         --[[
             Upvalues: 
                 [1] = u78
                 [2] = u76
                 [3] = u8
                 [4] = u75
                 [5] = u11
         --]]
         u78.GrenadeCooldown = false;
         while (not u76) do
             u8.RenderStepped:wait();
         end
         if (not u75) then
             local v418;
             if (u11.WeaponData.Inventory[1][1]) then
                 v418 = 1;
             else
                 if (u11.WeaponData.Inventory[2][1]) then
                     v418 = 2;
                 else
                     v418 = u11.WeaponData.Inventory[3][1] and 3;
                 end
             end
             local v419 = u78;
             local v420 = {};
             v420.Slot = v418;
             v420.Index = 1;
             v419:Equip(v420, true);
         end
     end);
 end;
 u1.ThrowGrenade = f_ThrowGrenade;
 local f_MeleeAttack;
 f_MeleeAttack = function(p27, p28) -- [line 1121] MeleeAttack
     --[[
         Upvalues: 
             [1] = u11
             [2] = u23
             [3] = u21
             [4] = t_CurrentCamera_3
             [5] = t_LocalPlayer_1
             [6] = u18
             [7] = u22
             [8] = t_GameStats_5
             [9] = u16
             [10] = u10
     --]]
     local t_MeleeAttackSide_67 = p27.MeleeAttackSide;
     if (t_MeleeAttackSide_67 == 1) then
         p27.MeleeAttackSide = 2;
     else
         p27.MeleeAttackSide = 1;
     end
     local v421 = false;
     local v422;
     if (p28 == "Light") then
         v422 = "Slash" .. p27.MeleeAttackSide;
         if (not v422) then
             v421 = true;
         end
     else
         v421 = true;
     end
     if (v421) then
         v422 = "HeavyStab";
     end
     local v423 = p27:PlayAnimation(v422);
     local u79 = false;
     local v424 = {};
     local v425;
     if (p28 == "Heavy") then
         v425 = "StabBlade";
     else
         v425 = "SlashBlade";
     end
     local v426 = {};
     if (u11.CurrentWeapon.Object:FindFirstChild("Dagger1")) then
         if (p28 == "Heavy") then
             table.insert(v426, u11.CurrentWeapon.Object.Dagger1);
             table.insert(v426, u11.CurrentWeapon.Object.Dagger2);
         else
             local t_MeleeAttackSide_72 = p27.MeleeAttackSide;
             if (t_MeleeAttackSide_72 == 1) then
                 table.insert(v426, u11.CurrentWeapon.Object.Dagger1);
             else
                 local t_MeleeAttackSide_73 = p27.MeleeAttackSide;
                 if (t_MeleeAttackSide_73 == 2) then
                     table.insert(v426, u11.CurrentWeapon.Object.Dagger2);
                 end
             end
         end
     else
         table.insert(v426, u11.CurrentWeapon.Object);
     end
     u23:ConnectWeaponSound(v423);
     local v427 = v423:GetMarkerReachedSignal("SlashStart");
     local u80 = p27;
     local u81 = v426;
     local u82 = v425;
     local u83 = v424;
     local u84 = p28;
     v427:Connect(function() -- [line 1152] anonymous function
         --[[
             Upvalues: 
                 [1] = u79
                 [2] = u80
                 [3] = u81
                 [4] = u82
                 [5] = u21
                 [6] = t_CurrentCamera_3
                 [7] = t_LocalPlayer_1
                 [8] = u18
                 [9] = u22
                 [10] = t_GameStats_5
                 [11] = u83
                 [12] = u16
                 [13] = u23
                 [14] = u10
                 [15] = u84
         --]]
         u79 = true;
         while (u79 and u80.MeleeCooldown) do
             local v428 = 1;
             local v429 = #u81;
             local v430 = v429;
             local v431 = v428;
             if (not (v429 <= v431)) then
                 while true do
                     local v432 = u81[v428][u82];
                     local v433, v434, v435 = pairs((u21.new(v432.CFrame, v432.Size):FindPartsInRegion3WithIgnoreList({
                         workspace.RaycastIgnore,
                         workspace.DroppedWeapons,
                         t_CurrentCamera_3,
                         t_LocalPlayer_1.Character
                     }, 100)));
                     local v436 = v433;
                     local v437 = v434;
                     local v438 = v435;
                     while true do
                         local v439, v440 = v436(v437, v438);
                         local v441 = v439;
                         local v442 = v440;
                         if (v439) then
                             break;
                         end
                         v438 = v441;
                         local v443 = u18:GetCharacter(v442);
                         local v444 = v443;
                         local v445 = v443;
                         if (v445) then
                             v445 = false;
                             local t_Name_68 = v444.Name;
                             if (t_Name_68 == "Combat Turret") then
                                 v445 = v442:IsDescendantOf(v444.MainParts);
                                 if (not v445) then
                                     v445 = v442:IsDescendantOf(v444.Object);
                                 end
                             end
                         end
                         local v446 = v444;
                         if (v446) then
                             v446 = false;
                             local t_Name_69 = v444.Name;
                             if (t_Name_69 == "Kane Explosive") then
                                 v446 = v442.Name == "Part";
                             end
                         end
                         if (v444 and ((u22[v442.Name] or v445) or v446)) then
                             local v447 = false;
                             local v448 = false;
                             if (v444:FindFirstChild("Team")) then
                                 local t_Value_70 = t_LocalPlayer_1.SelectedTeam.Value;
                                 if (t_Value_70 == v444.Team.Value) then
                                     v447 = true;
                                 else
                                     v448 = true;
                                 end
                             else
                                 v447 = true;
                             end
                             if (v447) then
                                 if (v444:FindFirstChild("Team")) then
                                     local t_Value_71 = t_GameStats_5.GameMode.Value;
                                     if (t_Value_71 == "Deathmatch") then
                                         v448 = true;
                                     else
                                         continue;
                                     end
                                 else
                                     v448 = true;
                                 end
                             end
                             if (v448) then
                                 local v449 = false;
                                 local v450;
                                 if (v444:FindFirstChild("Health")) then
                                     v450 = v444.Health.Value;
                                     if (not v450) then
                                         v449 = true;
                                     end
                                 else
                                     v449 = true;
                                 end
                                 if (v449) then
                                     v450 = v444.Humanoid.Health;
                                 end
                                 if ((v450 >= 0) and (not u83[v444])) then
                                     u83[v444] = true;
                                     u16:ActivateHitmarker();
                                     u23:PlaySound("BulletHit");
                                     u10:FireServer("MeleeHit", v442, u84);
                                 end
                             end
                         end
                     end
                     local v451 = v428 + 1;
                     v428 = v451;
                     local v452 = v430;
                     if (v452 < v451) then
                         break;
                     end
                 end
             end
             wait();
         end
     end);
     local v453 = v423:GetMarkerReachedSignal("TrailStart");
     local u85 = v426;
     v453:Connect(function() -- [line 1186] anonymous function
         --[[
             Upvalues: 
                 [1] = u85
         --]]
         local v454 = 1;
         local v455 = #u85;
         local v456 = v455;
         local v457 = v454;
         if (not (v455 <= v457)) then
             while true do
                 u85[v454].FakeBlade.Trail.Enabled = true;
                 local v458 = v454 + 1;
                 v454 = v458;
                 local v459 = v456;
                 if (v459 < v458) then
                     break;
                 end
             end
         end
     end);
     local v460 = v423:GetMarkerReachedSignal("TrailStop");
     local u86 = v426;
     v460:Connect(function() -- [line 1194] anonymous function
         --[[
             Upvalues: 
                 [1] = u86
         --]]
         local v461 = 1;
         local v462 = #u86;
         local v463 = v462;
         local v464 = v461;
         if (not (v462 <= v464)) then
             while true do
                 u86[v461].FakeBlade.Trail.Enabled = false;
                 local v465 = v461 + 1;
                 v461 = v465;
                 local v466 = v463;
                 if (v466 < v465) then
                     break;
                 end
             end
         end
     end);
     v423:GetMarkerReachedSignal("SlashEnd"):Connect(function() -- [line 1202] anonymous function
         --[[
             Upvalues: 
                 [1] = u79
         --]]
         u79 = false;
     end);
     local v467 = v423.Stopped;
     local u87 = p27;
     v467:Connect(function() -- [line 1206] anonymous function
         --[[
             Upvalues: 
                 [1] = u87
         --]]
         u87.MeleeCooldown = false;
     end);
 end;
 u1.MeleeAttack = f_MeleeAttack;
 local f_RenderBullets;
 f_RenderBullets = function(p29) -- [line 1211] RenderBullets
     --[[
         Upvalues: 
             [1] = u13
             [2] = u12
             [3] = u26
             [4] = t_MapFolder_4
             [5] = u9
             [6] = u24
             [7] = u14
             [8] = u18
             [9] = t_Assets_2
             [10] = u25
             [11] = t_LocalPlayer_1
             [12] = t_GameStats_5
             [13] = u16
             [14] = u23
             [15] = u10
             [16] = u4
             [17] = u6
     --]]
     local v468 = tick() - p29.LastRenderTime;
     local v469 = nil;
     p29.LastRenderTime = tick();
     local v470 = os.clock();
     local v471, v472, v473 = pairs(p29.Bullets);
     local v474 = v471;
     local v475 = v472;
     local v476 = v473;
     while true do
         local v477, v478 = v474(v475, v476);
         local v479 = v477;
         local v480 = v478;
         if (v477) then
             break;
         end
         local v481 = false;
         v476 = v479;
         local v482 = u13[v480.BulletType];
         local v483 = u12[v480.Weapon];
         local v484 = v483;
         local v485;
         if ((not v480.Tracer) and v483) then
             v485 = v484.BulletVelocity;
             if (not v485) then
                 v481 = true;
             end
         else
             v481 = true;
         end
         if (v481) then
             v485 = 2000;
         end
         if (not v469) then
             v469 = u26();
         end
         local v486 = RaycastParams.new();
         v486.FilterType = Enum.RaycastFilterType.Blacklist;
         v486.FilterDescendantsInstances = {
             unpack(v480.Ignore),
             workspace.CurrentCamera,
             workspace.RaycastIgnore,
             workspace.DroppedWeapons,
             t_MapFolder_4.Map.Ramps,
             t_MapFolder_4.Map.Walls,
             t_MapFolder_4.Map.BAC,
             unpack(v469)
         };
         local v487 = workspace:Raycast(v480.Bullet.Position, v480.Bullet.CFrame.lookVector * (v468 * v485), v486);
         local t_CFrame_74 = v480.Bullet.CFrame;
         local v488 = v480.Bullet.CFrame * CFrame.new(0, 0, (-v468) * v485);
         local v489 = true;
         local v490 = tick() - v480.CreatedTick;
         local t_LifeTime_75 = v482.LifeTime;
         if (t_LifeTime_75 < v490) then
             local v491 = coroutine.wrap;
             local u88 = p29;
             local u89 = v479;
             local u90 = v480;
             v491(function() -- [line 1239] anonymous function
                 --[[
                     Upvalues: 
                         [1] = u88
                         [2] = u89
                         [3] = u90
                         [4] = u9
                 --]]
                 u88.Bullets[u89] = nil;
                 u90.Bullet.Trail.Enabled = false;
                 local v492 = u9;
                 local v493 = u90.Bullet.TracerBoard.Circle;
                 local v494 = TweenInfo.new(0.5);
                 local v495 = {};
                 v495.ImageTransparency = 1;
                 local v496 = v492:Create(v493, v494, v495);
                 v496:Play();
                 v496.Completed:wait();
                 u90.Bullet:Destroy();
             end)();
             v489 = false;
         end
         local v497 = false;
         if (v487 and (v487.Instance and v489)) then
             local t_Instance_76 = v487.Instance;
             local t_magnitude_77 = (v488.Position - v487.Position).magnitude;
             if (not v480.StraightMode) then
                 v480.StraightMode = true;
                 v488 = (v480.RotationMatrix + v487.Position) * CFrame.new(0, 0, -t_magnitude_77);
             end
             local v498 = false;
             local v499 = v487;
             local u91 = (v488 - v488.Position) + v487.Position;
             local v500 = (t_CFrame_74.p - v487.Position).magnitude;
             local v501 = u91 - u91.p;
             local t_lookVector_78 = v488.lookVector;
             local v502 = (v468 * v485) - v500;
             local v503 = 0;
             local v504 = 0;
             local v505 = 0;
             local v506 = 0;
             local v507 = {};
             local v508 = {};
             local v509 = {};
             local v510 = nil;
             local v511 = 1;
             local v512 = v511;
             if (v512 >= 10) then
                 v498 = true;
             else
                 while true do
                     local v513 = RaycastParams.new();
                     v513.FilterType = Enum.RaycastFilterType.Whitelist;
                     v513.FilterDescendantsInstances = {
                         v499.Instance
                     };
                     local v514 = workspace:Raycast((u91 * CFrame.new(0, 0, -20)).p, (-t_lookVector_78) * 20, v513);
                     if (not v514) then
                         v514 = {};
                         v514.Position = v499.Position;
                     end
                     local t_magnitude_79 = (v514.Position - v499.Position).magnitude;
                     v510 = v499.Position;
                     local v515 = u24(v514.Instance);
                     local v516 = v515;
                     local v517 = v515;
                     if (v517) then
                         v517 = u14[v516];
                     end
                     local v518 = false;
                     local v519 = u18:GetCharacter(v514.Instance);
                     if (v517) then
                         local v520 = false;
                         local v521;
                         if (v517 == "Low") then
                             v521 = t_magnitude_79;
                             if (not v521) then
                                 v520 = true;
                             end
                         else
                             v520 = true;
                         end
                         if (v520) then
                             v521 = 0;
                         end
                         local v522 = false;
                         v503 = v503 + v521;
                         local v523;
                         if (v517 == "Medium") then
                             v523 = t_magnitude_79;
                             if (not v523) then
                                 v522 = true;
                             end
                         else
                             v522 = true;
                         end
                         if (v522) then
                             v523 = 0;
                         end
                         local v524 = false;
                         v504 = v504 + v523;
                         local v525;
                         if (v517 == "High") then
                             v525 = t_magnitude_79;
                             if (not v525) then
                                 v524 = true;
                             end
                         else
                             v524 = true;
                         end
                         if (v524) then
                             v525 = 0;
                         end
                         v505 = v505 + v525;
                         v480.DidPenetrate = true;
                         if ((((v480.HighPenetrationLeft - v505) > 0) and ((v480.MediumPenetrationLeft - v504) > 0)) and ((v480.LowPenetrationLeft - v503) >= 0)) then
                             v518 = true;
                         else
                             local v526 = {};
                             v526.BulletHole = t_Assets_2.BulletHoles.EmptyBulletHole;
                             v526.Result = v499;
                             table.insert(v507, v526);
                             local v527 = {};
                             v527.Result = v499;
                             table.insert(v508, v527);
                             v503 = 99999;
                             v498 = true;
                             break;
                         end
                     else
                         if (v519 and (not v480.Penetrated[v519])) then
                             local v528 = false;
                             v480.Penetrated[v519] = true;
                             v506 = v506 + 1;
                             local t_Name_80 = v514.Instance.Name;
                             local v529;
                             if (t_Name_80 == "Outline") then
                                 v529 = v514.Instance.Parent;
                                 if (not v529) then
                                     v528 = true;
                                 end
                             else
                                 v528 = true;
                             end
                             if (v528) then
                                 v529 = v514.Instance;
                             end
                             if ((not ((not (v519 and (not ((not (v480.Owner and (not (v519 == v480.Owner.Character)))) and v480.Owner)))) and v519)) and (((v519:FindFirstChild("Humanoid") and (v519.Humanoid.Health > 0)) or (v519:FindFirstChild("Health") and (v519.Health.Value >= 0))) and (not v480.Tracer))) then
                                 local v530 = false;
                                 local u92 = v529;
                                 local f_BloodEffect;
                                 f_BloodEffect = function() -- [line 1338] BloodEffect
                                     --[[
                                         Upvalues: 
                                             [1] = t_Assets_2
                                             [2] = u92
                                             [3] = u91
                                             [4] = u18
                                             [5] = u25
                                     --]]
                                     coroutine.wrap(function() -- [line 1339] anonymous function
                                         --[[
                                             Upvalues: 
                                                 [1] = t_Assets_2
                                                 [2] = u92
                                                 [3] = u91
                                                 [4] = u18
                                                 [5] = u25
                                         --]]
                                         local t_GeneralAssets_81 = t_Assets_2.GeneralAssets;
                                         local t_Name_82 = u92.Name;
                                         local v531;
                                         if (t_Name_82 == "Head") then
                                             v531 = "HeadImpact";
                                         else
                                             v531 = "FleshImpact";
                                         end
                                         local v532 = t_GeneralAssets_81[v531]:Clone();
                                         local v533 = v532;
                                         v532.CFrame = u91 * CFrame.new(0, 0, 0);
                                         v532.Parent = workspace.RaycastIgnore;
                                         u18:WeldBetween(v532, u92);
                                         local v534, v535, v536 = pairs(v532.Attachment:GetChildren());
                                         local v537 = v534;
                                         local v538 = v535;
                                         local v539 = v536;
                                         while true do
                                             local v540, v541 = v537(v538, v539);
                                             local v542 = v540;
                                             local v543 = v541;
                                             if (v540) then
                                                 break;
                                             end
                                             v539 = v542;
                                             v543.Enabled = false;
                                             if (u25.Settings["Show Blood"]) then
                                                 v543:Emit(1);
                                             end
                                         end
                                         local t_Name_83 = u92.Name;
                                         if (t_Name_83 == "Head") then
                                             local v544, v545, v546 = pairs(v533.Headshot:GetChildren());
                                             local v547 = v544;
                                             local v548 = v545;
                                             local v549 = v546;
                                             while true do
                                                 local v550, v551 = v547(v548, v549);
                                                 local v552 = v550;
                                                 local v553 = v551;
                                                 if (v550) then
                                                     break;
                                                 end
                                                 v549 = v552;
                                                 v553.Enabled = false;
                                                 v553:Emit(1);
                                             end
                                         end
                                         wait(1);
                                         if (v533 and v533.Parent) then
                                             v533:Destroy();
                                         end
                                     end)();
                                 end;
                                 local t_Owner_84 = v480.Owner;
                                 if ((t_Owner_84 == t_LocalPlayer_1) and (not v480.HitScan)) then
                                     local v554 = false;
                                     local v555 = false;
                                     if (v519:FindFirstChild("Team")) then
                                         local t_Value_85 = v519.Team.Value;
                                         if (t_Value_85 == t_LocalPlayer_1.SelectedTeam.Value) then
                                             v554 = true;
                                         else
                                             v555 = true;
                                         end
                                     else
                                         v554 = true;
                                     end
                                     if (v554) then
                                         if (v519:FindFirstChild("Team")) then
                                             local t_Value_87 = t_GameStats_5.GameMode.Value;
                                             if (t_Value_87 == "Deathmatch") then
                                                 v555 = true;
                                             else
                                                 v530 = true;
                                             end
                                         else
                                             v555 = true;
                                         end
                                     end
                                     if (v555) then
                                         local t_Name_86 = v529.Name;
                                         if (t_Name_86 == "Head") then
                                             u16:ActivateHitmarker(true);
                                             u23:PlaySound("Headshot");
                                         else
                                             u16:ActivateHitmarker();
                                             u23:PlaySound("BulletHit");
                                         end
                                         f_BloodEffect();
                                         u10:FireServer("DamagePlayer", v479, v529, v529.CFrame:ToObjectSpace(u91), string.pack("fff", t_LocalPlayer_1.Character.HumanoidRootPart.Position.X, t_LocalPlayer_1.Character.HumanoidRootPart.Position.Y, t_LocalPlayer_1.Character.HumanoidRootPart.Position.Z), string.pack("fff", v529.Position.X, v529.Position.Y, v529.Position.Z), v519:FindFirstChild("ZylaClone") and true, v480.DidPenetrate);
                                     end
                                 else
                                     v530 = true;
                                 end
                                 if (v530) then
                                     local t_Owner_88 = v480.Owner;
                                     if ((not (t_Owner_88 == t_LocalPlayer_1)) and game.Players:GetPlayerFromCharacter(v519)) then
                                         local v556 = false;
                                         local v557 = false;
                                         if (v480.Owner) then
                                             local t_Value_89 = v480.Owner.PermanentTeam.Value;
                                             if (t_Value_89 == t_LocalPlayer_1.PermanentTeam.Value) then
                                                 v556 = true;
                                             else
                                                 v557 = true;
                                             end
                                         else
                                             v556 = true;
                                         end
                                         if (v556) then
                                             if (not v480.Owner) then
                                                 v557 = true;
                                             end
                                         end
                                         if (v557) then
                                             f_BloodEffect();
                                             local t_Name_90 = v529.Name;
                                             if (t_Name_90 == "Head") then
                                                 local v558 = u23;
                                                 local v559 = {};
                                                 v559.Parent = v529;
                                                 v559.RollOffMaxDistance = 90;
                                                 v558:PlaySound("Headshot", v559);
                                             else
                                                 local v560 = u23;
                                                 local v561 = {};
                                                 v561.Parent = v529;
                                                 v561.RollOffMaxDistance = 90;
                                                 v560:PlaySound("BulletHit", v561);
                                             end
                                         end
                                     end
                                 end
                             end
                             v480.DidPenetrate = true;
                             local v562 = v480.PlayerPenetrationLeft - v506;
                             if (v562 < 0) then
                                 v498 = true;
                                 break;
                             end
                             v518 = true;
                         else
                             if (v519) then
                                 v518 = true;
                             else
                                 local v563 = {};
                                 v563.BulletHole = t_Assets_2.BulletHoles.EmptyBulletHole;
                                 v563.Result = v499;
                                 table.insert(v507, v563);
                                 local v564 = {};
                                 v564.Result = v499;
                                 table.insert(v508, v564);
                                 v503 = 99999;
                                 v498 = true;
                                 break;
                             end
                         end
                     end
                     if (v518) then
                         if (not v519) then
                             local v565 = {};
                             v565.BulletHole = t_Assets_2.BulletHoles.BulletHole;
                             v565.Result = v499;
                             table.insert(v507, v565);
                             local v566 = {};
                             v566.Result = v499;
                             table.insert(v508, v566);
                             if ((v499.Position - v514.Position).magnitude >= 0) then
                                 local v567 = {};
                                 v567.BulletHole = t_Assets_2.BulletHoles.BulletHole;
                                 v567.Result = v514;
                                 table.insert(v507, v567);
                             end
                             v480.DidPenetrate = true;
                         end
                         local v568 = v502 - t_magnitude_79;
                         if (v568 <= 0) then
                             v498 = true;
                             break;
                         end
                         v502 = v502 - t_magnitude_79;
                         table.insert(v509, v514.Instance);
                         local v569 = RaycastParams.new();
                         v569.FilterType = Enum.RaycastFilterType.Blacklist;
                         v569.FilterDescendantsInstances = {
                             unpack(v480.Ignore),
                             workspace.CurrentCamera,
                             workspace.RaycastIgnore,
                             workspace.DroppedWeapons,
                             t_MapFolder_4.Map.Ramps,
                             t_MapFolder_4.Map.Walls,
                             unpack(v469),
                             unpack(v509),
                             t_MapFolder_4.Map.BAC
                         };
                         local v570 = workspace:Raycast(v514.Position, t_lookVector_78 * v502, v569);
                         local v571 = v570;
                         if (v570 and v570.Instance) then
                             u91 = v501 + v571.Position;
                             v499 = v571;
                             local v572 = v511 + 1;
                             v511 = v572;
                             if (v572 > 10) then
                                 v498 = true;
                                 break;
                             end
                         else
                             v498 = true;
                             break;
                         end
                     end
                 end
             end
             if (v498) then
                 if ((((v480.HighPenetrationLeft - v505) > 0) and ((v480.MediumPenetrationLeft - v504) > 0)) and (((v480.LowPenetrationLeft - v503) > 0) and ((v480.PlayerPenetrationLeft - v506) > 0))) then
                     v480.HighPenetrationLeft = v480.HighPenetrationLeft - v505;
                     v480.MediumPenetrationLeft = v480.MediumPenetrationLeft - v504;
                     v480.LowPenetrationLeft = v480.LowPenetrationLeft - v503;
                     v480.PlayerPenetrationLeft = v480.PlayerPenetrationLeft - v506;
                 else
                     v488 = v501 + v510;
                     v480.CreatedTick = 0;
                 end
                 local v573 = false;
                 if (v480.Tracer) then
                     local v574 = 1;
                     local v575 = #v508;
                     local v576 = v575;
                     local v577 = v574;
                     if (not (v575 <= v577)) then
                         while true do
                             local v578 = v508[v574];
                             local v579 = v578;
                             local t_Material_91 = v578.Result.Instance.Material;
                             local v580;
                             if (t_Material_91 == Enum.Material.Wood) then
                                 v580 = "ImpactWood";
                             else
                                 v580 = "ImpactDefault";
                             end
                             local v581 = t_Assets_2.GeneralAssets[v580]:Clone();
                             local v582 = v581;
                             v581.CFrame = CFrame.new(v579.Result.Position, v579.Result.Position + v579.Result.Normal);
                             v581.Parent = workspace.RaycastIgnore;
                             if (not v480.PlayedHitSound) then
                                 v480.PlayedHitSound = true;
                                 local v583 = u23;
                                 local v584 = t_Instance_76;
                                 local v585 = {};
                                 v585.Parent = v582;
                                 v585.RollOffMaxDistance = 90;
                                 v583:PlayHitSound(v584, v585);
                             end
                             local v586 = coroutine.wrap;
                             local u93 = v582;
                             v586(function() -- [line 1503] anonymous function
                                 --[[
                                     Upvalues: 
                                         [1] = u93
                                 --]]
                                 wait(0.1);
                                 if (u93:FindFirstChild("HitEmitter")) then
                                     u93.HitEmitter.Enabled = false;
                                 end
                                 wait(0.04);
                                 local v587, v588, v589 = pairs(u93:GetChildren());
                                 local v590 = v587;
                                 local v591 = v588;
                                 local v592 = v589;
                                 while true do
                                     local v593, v594 = v590(v591, v592);
                                     local v595 = v593;
                                     local v596 = v594;
                                     if (v593) then
                                         break;
                                     end
                                     v592 = v595;
                                     local t_ClassName_92 = v596.ClassName;
                                     if (t_ClassName_92 == "ParticleEmitter") then
                                         v596.Enabled = false;
                                     end
                                 end
                                 wait(1);
                                 u93:Destroy();
                             end)();
                             local v597 = v574 + 1;
                             v574 = v597;
                             local v598 = v576;
                             if (v598 < v597) then
                                 break;
                             end
                         end
                     end
                     local v599 = 1;
                     local v600 = #v507;
                     local v601 = v600;
                     local v602 = v599;
                     if (v600 <= v602) then
                         v573 = true;
                     else
                         while true do
                             local v603 = v507[v599];
                             local v604 = v603;
                             local v605 = v603.BulletHole:Clone();
                             local v606 = v605;
                             v605.CFrame = CFrame.new(v603.Result.Position, v603.Result.Position + v603.Result.Normal) * CFrame.Angles(0, 0, math.rad(u4:NextNumber(0, 360)));
                             v605.Parent = workspace.RaycastIgnore;
                             local v607, v608, v609 = pairs(v605:GetChildren());
                             local v610 = v607;
                             local v611 = v608;
                             local v612 = v609;
                             while true do
                                 local v613, v614 = v610(v611, v612);
                                 local v615 = v613;
                                 local v616 = v614;
                                 if (v613) then
                                     break;
                                 end
                                 v612 = v615;
                                 local t_ClassName_93 = v616.ClassName;
                                 if (t_ClassName_93 == "Decal") then
                                     v616.Color3 = v604.Result.Instance.Color;
                                 end
                             end
                             if (((#v507) > 2) and (not v480.PlayedPenetrationSound)) then
                                 v480.PlayedPenetrationSound = true;
                                 local v617 = u23;
                                 local v618 = {};
                                 v618.Parent = v606;
                                 v618.RollOffMaxDistance = 90;
                                 v617:PlaySound("HitPenetration", v618);
                             end
                             u6:AddItem(v606, 10);
                             if (p29.TraceBullets) then
                                 local v619 = t_Assets_2.BulletHoles.BulletTracker:Clone();
                                 local v620 = v619;
                                 v619.Parent = v606;
                                 local t_Name_94 = v604.BulletHole.Name;
                                 if (t_Name_94 == "BulletHole") then
                                     local v621 = false;
                                     local t_Frame_95 = v620.Frame;
                                     local v622;
                                     if ((v599 == 1) or (v599 == 2)) then
                                         v622 = Color3.fromRGB(52, 142, 64);
                                         if (not v622) then
                                             v621 = true;
                                         end
                                     else
                                         v621 = true;
                                     end
                                     if (v621) then
                                         v622 = Color3.fromRGB(255, 245, 96);
                                     end
                                     t_Frame_95.BackgroundColor3 = v622;
                                 else
                                     v620.Frame.BackgroundColor3 = Color3.fromRGB(255, 0, 0);
                                 end
                             end
                             local v623 = v599 + 1;
                             v599 = v623;
                             local v624 = v601;
                             if (v624 < v623) then
                                 v573 = true;
                                 break;
                             end
                         end
                     end
                 else
                     v573 = true;
                 end
                 if (v573) then
                     v497 = true;
                 end
             end
         else
             v497 = true;
         end
         if (v497) then
             if (not v489) then
                 v488 = t_CFrame_74;
             end
             v480.Bullet.CFrame = v488;
         end
     end
 end;
 u1.RenderBullets = f_RenderBullets;
 local f_InAir;
 f_InAir = function(p30) -- [line 1582] InAir
     --[[
         Upvalues: 
             [1] = t_LocalPlayer_1
     --]]
     local v625 = t_LocalPlayer_1.Character.Humanoid:GetState();
     local v626 = true;
     if (v625 ~= Enum.HumanoidStateType.FallingDown) then
         v626 = v625 == Enum.HumanoidStateType.Freefall;
     end
     return v626;
 end;
 u1.InAir = f_InAir;
 local f_Check;
 f_Check = function(p31, p32, p33) -- [line 1587] Check
 end;
 u1.Check = f_Check;
 spawn(function() -- [line 1599] anonymous function
     --[[
         Upvalues: 
             [1] = f_GetCameraCFrameFromOtherLevel
             [2] = u1
     --]]
     while true do
         wait(0.2);
         local t_script_96 = getfenv(f_GetCameraCFrameFromOtherLevel).script;
         if (t_script_96 == script) then
             local t_script_97 = getfenv(u1.Check).script;
             if (t_script_97 ~= script) then
                 while true do
                 end
             end
         else
             while true do
             end
         end
     end
 end);
 local f_SetWorldParticle;
 f_SetWorldParticle = function(p34, p35) -- [line 1610] SetWorldParticle
     --[[
         Upvalues: 
             [1] = t_LocalPlayer_1
     --]]
     if (p35:IsDescendantOf(t_LocalPlayer_1.Character)) then
         local v627 = false;
         local t_ClassName_98 = p35.ClassName;
         if (t_ClassName_98 == "SurfaceGui") then
             v627 = true;
         else
             local t_ClassName_99 = p35.ClassName;
             if (t_ClassName_99 == "PointLight") then
                 v627 = true;
             else
                 local t_ClassName_100 = p35.ClassName;
                 if (t_ClassName_100 == "ParticleEmitter") then
                     v627 = true;
                 end
             end
         end
         if (v627) then
             p35.Enabled = false;
         end
     end
 end;
 u1.SetWorldParticle = f_SetWorldParticle;
 local f_NewCharacter;
 f_NewCharacter = function(p36) -- [line 1618] NewCharacter
     --[[
         Upvalues: 
             [1] = t_LocalPlayer_1
     --]]
     t_LocalPlayer_1.Character:WaitForChild("Humanoid", 10);
     local v628, v629, v630 = pairs(t_LocalPlayer_1.Character:GetDescendants());
     local v631 = v628;
     local v632 = v629;
     local v633 = v630;
     while true do
         local v634, v635 = v631(v632, v633);
         local v636 = v634;
         local v637 = v635;
         if (v634) then
             break;
         end
         v633 = v636;
         p36:SetWorldParticle(v637);
     end
     local v638 = t_LocalPlayer_1.Character.DescendantAdded;
     local u94 = p36;
     v638:Connect(function(p37) -- [line 1625] anonymous function
         --[[
             Upvalues: 
                 [1] = u94
         --]]
         u94:SetWorldParticle(p37);
     end);
     p36:Check("WalkSpeed", "FireBuIIet");
     p36:Check("HipHeight", "FireBuIlet");
     p36:Check("MaxSlopeAngle", "FireBulIet");
     p36:Check("JumpPower", "MeIeeHit");
     p36:Check("JumpHeight", "MeIeeHit");
     p36:Check("Name", "DamagePIayer");
 end;
 u1.NewCharacter = f_NewCharacter;
 local f_ScrollWeapon;
 f_ScrollWeapon = function(p38, p39) -- [line 1637] ScrollWeapon
     --[[
         Upvalues: 
             [1] = u18
             [2] = u11
     --]]
     if (not ((u18:IsAlive() and u11.WeaponData) and (u11.WeaponData.EquippedWeaponIndex and (not p38.EquipCooldown)))) then
         return;
     end
     if (u11.CurrentWeaponData and u11.CurrentWeaponData.Ability) then
         return;
     end
     local t_EquippedWeaponIndex_101 = u11.WeaponData.EquippedWeaponIndex;
     local v639 = {};
     if ((#u11.WeaponData.Inventory[1]) > 1) then
         table.insert(v639, 1);
     end
     if ((#u11.WeaponData.Inventory[2]) > 1) then
         table.insert(v639, 2);
     end
     table.insert(v639, 3);
     local v640 = nil;
     local v641 = 1;
     local v642 = #v639;
     local v643 = v642;
     local v644 = v641;
     if (not (v642 <= v644)) then
         while true do
             local v645 = v639[v641];
             if (v645 == t_EquippedWeaponIndex_101.Slot) then
                 break;
             end
             local v646 = v641 + 1;
             v641 = v646;
             local v647 = v643;
             if (v647 < v646) then
                 break;
             end
         end
         v640 = v641;
     end
     if (not v640) then
         return;
     end
     local v648 = v640 - p39;
     local v649 = #v639;
     local v650;
     if (v649 <= v648) then
         v650 = 1;
     else
         local v651 = false;
         local v652 = v640 - p39;
         if (v652 <= 1) then
             v650 = #v639;
             if (not v650) then
                 v651 = true;
             end
         else
             v651 = true;
         end
         if (v651) then
             v650 = v640 - p39;
         end
     end
     local v653 = {};
     v653.Slot = v639[v650];
     v653.Index = 1;
     p38:Equip(v653);
 end;
 u1.ScrollWeapon = f_ScrollWeapon;
 local f_DetonateKaneExplosive;
 f_DetonateKaneExplosive = function(p40) -- [line 1680] DetonateKaneExplosive
     --[[
         Upvalues: 
             [1] = t_LocalPlayer_1
             [2] = u27
             [3] = u11
             [4] = u23
             [5] = u10
             [6] = u18
     --]]
     local v654 = u27.Characters[t_LocalPlayer_1.CharacterName.Value];
     local v655 = p40.WeaponValue;
     u11.AbilityWeaponCooldown = true;
     local v656 = p40:PlayAnimation("Detonator Activate");
     u23:ConnectWeaponSound(v656);
     local v657 = v656:GetMarkerReachedSignal("Detonate");
     local u95 = p40;
     local t_WeaponValue_102 = v655;
     local u96 = v654;
     v657:Connect(function() -- [line 1689] anonymous function
         --[[
             Upvalues: 
                 [1] = u95
                 [2] = t_WeaponValue_102
                 [3] = u10
                 [4] = u11
                 [5] = u96
         --]]
         local t_WeaponValue_103 = u95.WeaponValue;
         if (t_WeaponValue_103 == t_WeaponValue_102) then
             local v658, v659 = u10:InvokeServer("DetonateKaneExplosive");
             local v660 = v658;
             local v661 = v659;
             if (v660 ~= true) then
                 u11.WeaponData.Ability.Uses = v660;
                 u11.RechargingAbility = tick() - (u96.Ability.RechargeTime - v661);
             end
             u11.KaneExplosivePlaced = nil;
         end
     end);
     local v662 = v656.Stopped;
     local u97 = p40;
     local t_WeaponValue_104 = v655;
     v662:Connect(function() -- [line 1702] anonymous function
         --[[
             Upvalues: 
                 [1] = u97
                 [2] = t_WeaponValue_104
                 [3] = u18
                 [4] = u11
         --]]
         local t_WeaponValue_105 = u97.WeaponValue;
         if ((t_WeaponValue_105 == t_WeaponValue_104) and u18:IsAlive()) then
             local v663;
             if (u11.WeaponData.Inventory[1][1]) then
                 v663 = 1;
             else
                 if (u11.WeaponData.Inventory[2][1]) then
                     v663 = 2;
                 else
                     v663 = u11.WeaponData.Inventory[3][1] and 3;
                 end
             end
             u11.AbilityWeaponCooldown = false;
             local v664 = u97;
             local v665 = {};
             v665.Slot = v663;
             v665.Index = 1;
             v664:Equip(v665);
         end
     end);
 end;
 u1.DetonateKaneExplosive = f_DetonateKaneExplosive;
 local f_HeraHeal;
 f_HeraHeal = function(p41, p42) -- [line 1716] HeraHeal
     --[[
         Upvalues: 
             [1] = u30
             [2] = u8
             [3] = t_LocalPlayer_1
             [4] = u11
             [5] = u23
             [6] = u18
     --]]
     local v666 = u30.GetCharacter(p42);
     local v667 = v666.Humanoid.Health;
     local t_MaxHealth_106 = v666.Humanoid.MaxHealth;
     if ((t_MaxHealth_106 < v667) and (not u8:IsStudio())) then
         return;
     end
     local v668;
     if (p42 == t_LocalPlayer_1) then
         v668 = p41:PlayAnimation("SelfHeal");
         v668:GetMarkerReachedSignal("Heal"):Connect(function() -- [line 1728] anonymous function
             --[[
                 Upvalues: 
                     [1] = u11
             --]]
             local v669, v670, v671 = pairs(u11.CurrentWeapon.Object.Muzzle.MuzzleEffects:GetChildren());
             local v672 = v669;
             local v673 = v670;
             local v674 = v671;
             while true do
                 local v675, v676 = v672(v673, v674);
                 local v677 = v675;
                 local v678 = v676;
                 if (v675) then
                     break;
                 end
                 v674 = v677;
                 v678.Enabled = false;
                 v678:Emit(2);
             end
         end);
     else
         v668 = p41:PlayAnimation("Shoot");
         local v679, v680, v681 = pairs(u11.CurrentWeapon.Object.Muzzle.MuzzleEffects:GetChildren());
         local v682 = v679;
         local v683 = v680;
         local v684 = v681;
         while true do
             local v685, v686 = v682(v683, v684);
             local v687 = v685;
             local v688 = v686;
             if (v685) then
                 break;
             end
             v684 = v687;
             v688.Enabled = false;
             v688:Emit(2);
         end
     end
     u23:ConnectWeaponSound(v668);
     local v689 = p41.WeaponValue;
     u11.AbilityWeaponCooldown = true;
     local v690 = v668.Stopped;
     local u98 = p41;
     local t_WeaponValue_107 = v689;
     v690:Connect(function() -- [line 1748] anonymous function
         --[[
             Upvalues: 
                 [1] = u98
                 [2] = t_WeaponValue_107
                 [3] = u18
                 [4] = u23
                 [5] = u11
         --]]
         local t_WeaponValue_108 = u98.WeaponValue;
         if ((t_WeaponValue_108 == t_WeaponValue_107) and u18:IsAlive()) then
             local v691 = u98:PlayAnimation("UnEquip");
             u23:ConnectWeaponSound(v691);
             v691.Stopped:wait();
             local t_WeaponValue_109 = u98.WeaponValue;
             if ((t_WeaponValue_109 == t_WeaponValue_107) and u18:IsAlive()) then
                 local v692;
                 if (u11.WeaponData.Inventory[1][1]) then
                     v692 = 1;
                 else
                     if (u11.WeaponData.Inventory[2][1]) then
                         v692 = 2;
                     else
                         v692 = u11.WeaponData.Inventory[3][1] and 3;
                     end
                 end
                 u11.AbilityWeaponCooldown = false;
                 local v693 = u98;
                 local v694 = {};
                 v694.Slot = v692;
                 v694.Index = 1;
                 v693:Equip(v694);
             else
                 return;
             end
         end
     end);
     local t_InfiniteAbilities_110 = p41.InfiniteAbilities;
     if (t_InfiniteAbilities_110 == false) then
         local v695 = u11.WeaponData.Ability;
         v695.Uses = v695.Uses - 1;
     end
     p41:ActivateAbility(p42);
     p41.HeraAbility:Destroy();
     p41.HeraAbility = nil;
 end;
 u1.HeraHeal = f_HeraHeal;
 local f_ActivateAbility;
 f_ActivateAbility = function(p43, ...) -- [line 1780] ActivateAbility
     --[[
         Upvalues: 
             [1] = t_LocalPlayer_1
             [2] = u27
             [3] = u10
             [4] = u11
             [5] = t_CurrentCamera_3
             [6] = t_MapFolder_4
             [7] = u9
             [8] = u2
             [9] = u18
     --]]
     local v696 = {...};
     local v697 = coroutine.wrap;
     local u99 = v696;
     local u100 = p43;
     v697(function() -- [line 1783] anonymous function
         --[[
             Upvalues: 
                 [1] = t_LocalPlayer_1
                 [2] = u27
                 [3] = u10
                 [4] = u99
                 [5] = u11
                 [6] = t_CurrentCamera_3
                 [7] = t_MapFolder_4
                 [8] = u9
                 [9] = u2
                 [10] = u18
                 [11] = u100
         --]]
         local v698 = t_LocalPlayer_1.CharacterName.Value;
         local t_Value_111 = v698;
         local v699 = u27.Characters[v698];
         local v700, v701, v702 = u10:InvokeServer("ActivateAbility", unpack(u99));
         local v703 = v700;
         local v704 = v701;
         local v705 = v702;
         if (t_Value_111 ~= t_LocalPlayer_1.CharacterName.Value) then
             return;
         end
         if (v703 == true) then
             if (t_Value_111 == "Kane") then
                 u11.KaneExplosivePlaced = v705;
             else
                 if (t_Value_111 == "Zyla") then
                     u11.ZylaAbilityClone = v705;
                     t_CurrentCamera_3.CameraSubject = v705;
                     local v706 = {};
                     local v707, v708, v709 = pairs(v705:GetDescendants());
                     local v710 = v707;
                     local v711 = v708;
                     local v712 = v709;
                     while true do
                         local v713, v714 = v710(v711, v712);
                         local v715 = v713;
                         local v716 = v714;
                         if (v713) then
                             break;
                         end
                         v712 = v715;
                         if (v716:IsA("BasePart")) then
                             v706[v716] = v716.Transparency;
                             v716.Transparency = 1;
                         end
                     end
                     local v717 = u11;
                     local v718 = {};
                     v718.Origin = t_LocalPlayer_1.Character.HumanoidRootPart.CFrame;
                     v718.OriginCamera = t_CurrentCamera_3.CFrame;
                     v717.ZylaAbilityData = v718;
                     local v719 = t_CurrentCamera_3.CFrame.p.Y - t_LocalPlayer_1.Character.HumanoidRootPart.Position.Y;
                     local v720, v721, v722 = t_CurrentCamera_3.CFrame:ToOrientation();
                     local v723 = v721;
                     local v724 = CFrame.new(t_LocalPlayer_1.Character.HumanoidRootPart.Position) * CFrame.Angles(0, v721, 0);
                     local v725 = v724;
                     local v726 = RaycastParams.new();
                     v726.FilterType = Enum.RaycastFilterType.Blacklist;
                     v726.FilterDescendantsInstances = {
                         t_LocalPlayer_1.Character,
                         workspace.CurrentCamera,
                         workspace.RaycastIgnore,
                         workspace.DroppedWeapons,
                         t_MapFolder_4.Players
                     };
                     local v727 = workspace:Raycast(v724.p, v724.LookVector * 4, v726);
                     if (not v727) then
                         v727 = {};
                         v727.Position = (v725 * CFrame.new(0, 0, -4)).p;
                     end
                     if (v727.Instance) then
                         print("Moved back");
                         local v728 = (CFrame.new(v727.Position, v725.p) * CFrame.new(0, 0, -1)).p;
                     else
                         local v729 = v727.Position;
                     end
                     t_LocalPlayer_1.Character.HumanoidRootPart.CFrame = CFrame.new(v727.Position) * CFrame.Angles(0, v723, 0);
                     local v730 = t_LocalPlayer_1.Character.HumanoidRootPart.CFrame + Vector3.new(0, v719, 0);
                     local v731 = u9;
                     local v732 = t_CurrentCamera_3;
                     local v733 = TweenInfo.new(0.25);
                     local v734 = {};
                     v734.CFrame = v730;
                     local v735 = v731:Create(v732, v733, v734);
                     v735:Play();
                     u11.ZylaAbilityTween = v735;
                     v735.Completed:Wait();
                     local v736, v737, v738 = pairs(v706);
                     local v739 = v736;
                     local v740 = v737;
                     local v741 = v738;
                     while true do
                         local v742, v743 = v739(v740, v741);
                         local v744 = v742;
                         local v745 = v743;
                         if (v742) then
                             break;
                         end
                         v741 = v744;
                         v744.Transparency = v745;
                     end
                     if (u11.ActivatingAbility) then
                         u11.AbilityInUse = tick();
                         u11.ActivatingAbility = false;
                         local v746, v747, v748 = pairs(u11.CurrentWeapon:GetDescendants());
                         local v749 = v746;
                         local v750 = v747;
                         local v751 = v748;
                         while true do
                             local v752, v753 = v749(v750, v751);
                             local v754 = v752;
                             local v755 = v753;
                             if (v752) then
                                 break;
                             end
                             v751 = v754;
                             if (v755:IsA("BasePart")) then
                                 v755.Material = Enum.Material.ForceField;
                                 v755.BrickColor = BrickColor.new("Toothpaste");
                                 local t_ClassName_112 = v755.ClassName;
                                 if (t_ClassName_112 == "MeshPart") then
                                     v755.TextureID = "";
                                 end
                             else
                                 local t_ClassName_113 = v755.ClassName;
                                 if (t_ClassName_113 == "SurfaceAppearance") then
                                     v755:Destroy();
                                 end
                             end
                         end
                         local v756 = u9;
                         local v757 = u2.ZylaEffect.Effect;
                         local v758 = TweenInfo.new(0.2);
                         local v759 = {};
                         v759.ImageTransparency = 0.2;
                         v756:Create(v757, v758, v759):Play();
                         while (u18:IsAlive() and u11.AbilityInUse) do
                             local v760 = tick() - u11.AbilityInUse;
                             if ((v760 < 8) and (t_LocalPlayer_1.Character.Humanoid.Health >= 1)) then
                                 wait();
                             else
                                 break;
                             end
                         end
                         local v761 = u9;
                         local v762 = u2.ZylaEffect.Effect;
                         local v763 = TweenInfo.new(0.2);
                         local v764 = {};
                         v764.ImageTransparency = 1;
                         v761:Create(v762, v763, v764):Play();
                         u100:DeactivateZylaAbility();
                     else
                         warn("1");
                         return;
                     end
                 end
             end
         end
         if (v703 == true) then
             return;
         end
         u11.WeaponData.Ability.Uses = v703;
         u11.RechargingAbility = tick() - (v699.Ability.RechargeTime - v704);
         if (t_Value_111 == "Zolt") then
             u100.ZoltSway.Target = Vector3.new(0, 0, 0);
             u100.ZoltSwayPosition.Target = Vector3.new(0, 0, 0);
             print("Ability done");
             u11.AbilityInUse = false;
             u11.AbilityCooldown = false;
             return;
         end
         if (t_Value_111 == "Zyla") then
             u100:DeactivateZylaAbility();
             return;
         end
         if (t_Value_111 == "Edira") then
             u11.AbilityInUse = false;
             u11.AbilityCooldown = false;
         end
     end)();
 end;
 u1.ActivateAbility = f_ActivateAbility;
 local f_DeactivateZylaAbility;
 f_DeactivateZylaAbility = function(p44) -- [line 1917] DeactivateZylaAbility
     --[[
         Upvalues: 
             [1] = u11
             [2] = t_CurrentCamera_3
             [3] = t_LocalPlayer_1
     --]]
     if (u11.AbilityInUse or u11.ActivatingAbility) then
         u11.AbilityInUse = false;
         u11.AbilityCooldown = false;
         u11.AbilityWeaponCooldown = false;
         u11.ActivatingAbility = false;
         if (u11.ZylaAbilityData) then
             t_CurrentCamera_3.CFrame = u11.ZylaAbilityData.OriginCamera;
             t_LocalPlayer_1.Character.HumanoidRootPart.CFrame = u11.ZylaAbilityData.Origin;
         end
         if (u11.ZylaAbilityClone and u11.ZylaAbilityClone.Parent) then
             u11.ZylaAbilityClone:Destroy();
             u11.ZylaAbilityClone = nil;
         end
         local v765;
         if (u11.WeaponData.Inventory[1][1]) then
             v765 = 1;
         else
             if (u11.WeaponData.Inventory[2][1]) then
                 v765 = 2;
             else
                 v765 = u11.WeaponData.Inventory[3][1] and 3;
             end
         end
         local v766 = {};
         v766.Slot = v765;
         v766.Index = 1;
         p44:Equip(v766, true);
     end
 end;
 u1.DeactivateZylaAbility = f_DeactivateZylaAbility;
 local f_ActivateZylaAbility;
 f_ActivateZylaAbility = function(p45) -- [line 1943] ActivateZylaAbility
     --[[
         Upvalues: 
             [1] = u11
             [2] = t_CurrentCamera_3
             [3] = u23
             [4] = u8
     --]]
     if (not u11.AbilityInUse) then
         u11.ActivatingAbility = t_CurrentCamera_3.CFrame;
         u11.AbilityCooldown = true;
         u11.AbilityInUse = tick();
         p45:Equip("Ability");
         u11.AbilityWeaponCooldown = true;
         local t_WeaponValue_114 = p45.WeaponValue;
         p45.EquipTick = tick();
         local t_EquipTick_115 = p45.EquipTick;
         local v767 = p45:PlayAnimation("Powerup");
         local v768 = v767;
         u23:ConnectWeaponSound(v767);
         while true do
             local t_EquipTick_116 = p45.EquipTick;
             if (t_EquipTick_116 == t_EquipTick_115) then
                 u8.Heartbeat:wait();
                 if (v768.Length >= 0) then
                     p45.AnimationLoaded = true;
                     break;
                 end
             else
                 break;
             end
         end
         local v769 = v768.Stopped;
         local u101 = t_WeaponValue_114;
         local u102 = p45;
         v769:Connect(function() -- [line 1970] anonymous function
             --[[
                 Upvalues: 
                     [1] = u101
                     [2] = u102
                     [3] = u11
             --]]
             local v770 = u101;
             if (v770 == u102.WeaponValue) then
                 local t_InfiniteAbilities_117 = u102.InfiniteAbilities;
                 if (t_InfiniteAbilities_117 == false) then
                     local v771 = u11.WeaponData.Ability;
                     v771.Uses = v771.Uses - 1;
                 end
                 u102:ActivateAbility();
             end
         end);
     end
 end;
 u1.ActivateZylaAbility = f_ActivateZylaAbility;
 local f_ActivateEdiraAbility;
 f_ActivateEdiraAbility = function(p46, p47) -- [line 1982] ActivateEdiraAbility
     --[[
         Upvalues: 
             [1] = u11
             [2] = u23
             [3] = u8
             [4] = u9
             [5] = u2
             [6] = u18
             [7] = t_LocalPlayer_1
     --]]
     if (u11.AbilityInUse) then
         u11.AbilityInUse = tick();
         return;
     end
     if ((not p47) and p46.CancelledEdiraAbility) then
         return;
     end
     if (p47) then
         p46.CancelledEdiraAbility = false;
     end
     p46:Equip("Ability");
     local t_WeaponValue_118 = p46.WeaponValue;
     u11.AbilityCooldown = true;
     u11.AbilityInUse = tick();
     u11.AbilityWeaponCooldown = true;
     p46.EquipTick = tick();
     local t_EquipTick_119 = p46.EquipTick;
     local v772 = p46:PlayAnimation("Powerup");
     local v773 = v772;
     u23:ConnectWeaponSound(v772);
     while true do
         local t_EquipTick_120 = p46.EquipTick;
         if (t_EquipTick_120 == t_EquipTick_119) then
             u8.Heartbeat:wait();
             if (v773.Length >= 0) then
                 p46.AnimationLoaded = true;
                 break;
             end
         else
             break;
         end
     end
     local v774 = v773.Stopped;
     local u103 = t_WeaponValue_118;
     local u104 = p46;
     v774:Connect(function() -- [line 2013] anonymous function
         --[[
             Upvalues: 
                 [1] = u103
                 [2] = u104
                 [3] = u11
         --]]
         local v775 = u103;
         if (v775 == u104.WeaponValue) then
             local v776;
             if (u11.WeaponData.Inventory[1][1]) then
                 v776 = 1;
             else
                 if (u11.WeaponData.Inventory[2][1]) then
                     v776 = 2;
                 else
                     v776 = u11.WeaponData.Inventory[3][1] and 3;
                 end
             end
             u11.AbilityWeaponCooldown = false;
             local v777 = u104;
             local v778 = {};
             v778.Slot = v776;
             v778.Index = 1;
             v777:Equip(v778);
         end
     end);
     if (p47) then
         local t_InfiniteAbilities_121 = p46.InfiniteAbilities;
         if (t_InfiniteAbilities_121 == false) then
             local v779 = u11.WeaponData.Ability;
             v779.Uses = v779.Uses - 1;
         end
     end
     if (p47) then
         p46:ActivateAbility();
         p46:StopAnimation("Inspect");
         u11.AbilityShootCooldown = tick() + 1;
     end
     local v780 = u9;
     local v781 = u2.EdiraAbilityEffect.Effect;
     local v782 = TweenInfo.new(0.2);
     local v783 = {};
     v783.ImageTransparency = 0.2;
     v780:Create(v781, v782, v783):Play();
     while (u18:IsAlive() and u11.AbilityInUse) do
         local v784 = tick() - u11.AbilityInUse;
         if ((v784 < 20) and (t_LocalPlayer_1.Character.Humanoid.Health >= 1)) then
             wait();
         else
             break;
         end
     end
     local v785 = u9;
     local v786 = u2.EdiraAbilityEffect.Effect;
     local v787 = TweenInfo.new(0.2);
     local v788 = {};
     v788.ImageTransparency = 1;
     v785:Create(v786, v787, v788):Play();
     print("Ability done");
     u11.AbilityInUse = false;
     u11.AbilityCooldown = false;
 end;
 u1.ActivateEdiraAbility = f_ActivateEdiraAbility;
 local f_MultiRaycast;
 f_MultiRaycast = function(p48, p49) -- [line 2058] MultiRaycast
     --[[
         Upvalues: 
             [1] = t_LocalPlayer_1
             [2] = t_MapFolder_4
     --]]
     local v789 = p49.CollideWith;
     if (not v789) then
         v789 = {};
     end
     p49.CollideWith = v789;
     local v790 = p49.Size;
     local v791 = p49.XRaycasts or 2;
     local v792 = p49.YRaycasts or 2;
     local v793 = v792;
     local v794 = p49.OriginCFrame * CFrame.new((-v790.X) / 4, 0, (-v790.Z) / 4);
     local v795 = v790.X / v791;
     local v796 = v790.Z / v792;
     local v797 = nil;
     local v798 = 0;
     local v799 = v791 - 1;
     local v800 = v799;
     local v801 = v798;
     if (not (v799 <= v801)) then
         while true do
             local v802 = false;
             local v803 = 0;
             local v804 = v793 - 1;
             local v805 = v804;
             local v806 = v803;
             if (v804 <= v806) then
                 v802 = true;
             else
                 local v810;
                 while true do
                     local v807 = v794 * CFrame.new(v795 * v798, 0, v796 * v803);
                     local v808 = RaycastParams.new();
                     v808.FilterType = Enum.RaycastFilterType.Blacklist;
                     v808.FilterDescendantsInstances = {
                         t_LocalPlayer_1.Character,
                         workspace.CurrentCamera,
                         workspace.RaycastIgnore,
                         workspace.DroppedWeapons,
                         t_MapFolder_4.Players
                     };
                     local v809 = workspace:Raycast(v807.p, p49.LookVector, v808);
                     v810 = v809;
                     if (v809.Instance) then
                         local v811 = 1;
                         local v812 = #p49.CollideWith;
                         local v813 = v812;
                         local v814 = v811;
                         if (not (v812 <= v814)) then
                             while true do
                                 local v815 = p49.CollideWith[v811];
                                 local v816 = v815;
                                 if ((v816 == v810.Instance) or v810.Instance:IsDescendantOf(v815)) then
                                     break;
                                 end
                                 local v817 = v811 + 1;
                                 v811 = v817;
                                 local v818 = v813;
                                 if (v818 < v817) then
                                     break;
                                 end
                             end
                             return false;
                         end
                     end
                     if (((not v797) and v810) and v810.Instance) then
                         v797 = v810.Position.Y;
                     end
                     if (v810 and v810.Instance) then
                         local v819 = math.abs(v810.Position.Y - v797);
                         local t_Instance_122 = v810.Instance;
                         local v820;
                         if (t_Instance_122 == workspace.Terrain) then
                             v820 = 0.6;
                         else
                             v820 = 0.1;
                         end
                         if (v819 <= v820) then
                             local v821 = v803 + 1;
                             v803 = v821;
                             local v822 = v805;
                             if (v822 < v821) then
                                 v802 = true;
                                 break;
                             end
                         else
                             break;
                         end
                     else
                         break;
                     end
                 end
                 if (v810 and v810.Instance) then
                 end
                 break;
                 return false;
             end
             if (v802) then
                 local v823 = v798 + 1;
                 v798 = v823;
                 local v824 = v800;
                 if (v824 < v823) then
                     break;
                 end
             end
         end
     end
     return true;
 end;
 u1.MultiRaycast = f_MultiRaycast;
 local u105 = t_GameStats_5;
 local u106 = t_LocalPlayer_1;
 local u107 = v23;
 local u108 = v21;
 local u109 = v30;
 local u110 = u8;
 local u111 = u10;
 local u112 = v33;
 local u113 = v37;
 local u114 = u27;
 local u115 = u12;
 local u116 = v22;
 local u117 = v36;
 local u118 = u2;
 local t_TopFrame_123 = v11;
 local t_DMTopFrame_124 = v12;
 local u119 = t_MapFolder_4;
 local u120 = u11;
 local u121 = v19;
 local t_Shop_125 = v13;
 local u122 = u25;
 local u123 = v29;
 local t_LargeMapFrame_126 = v16;
 local u124 = v3;
 local u125 = v4;
 local u126 = v5;
 local u127 = v6;
 local u128 = v26;
 local u129 = v38;
 local t_Leaderboard_127 = v14;
 local u130 = v17;
 local u131 = v34;
 local t_Crosshair_128 = v10;
 local t_MapFrame_129 = v15;
 local u132 = u23;
 local u133 = u9;
 local u134 = u18;
 local t_BombPlant_130 = v7;
 local t_CharacterFrame_131 = v18;
 local u135 = u30;
 local u136 = t_CurrentCamera_3;
 local u137 = v24;
 local u138 = v1;
 local u139 = v35;
 local t_WeaponInfo_132 = v9;
 local t_BombCarrier_133 = v8;
 local u140 = u19;
 local u141 = u20;
 local u142 = u17;
 local u143 = u16;
 local u144 = u15;
 local u145 = v2;
 local u146 = t_Assets_2;
 local u147 = v31;
 local f_Initialize;
 f_Initialize = function(p50) -- [line 2120] Initialize
     --[[
         Upvalues: 
             [1] = u105
             [2] = u3
             [3] = u106
             [4] = u28
             [5] = u107
             [6] = u29
             [7] = u108
             [8] = u109
             [9] = u110
             [10] = u111
             [11] = u112
             [12] = u113
             [13] = u114
             [14] = u115
             [15] = u116
             [16] = u117
             [17] = u118
             [18] = t_TopFrame_123
             [19] = t_DMTopFrame_124
             [20] = u119
             [21] = u120
             [22] = u121
             [23] = t_Shop_125
             [24] = u122
             [25] = u123
             [26] = t_LargeMapFrame_126
             [27] = u124
             [28] = u125
             [29] = u126
             [30] = u127
             [31] = u128
             [32] = u129
             [33] = t_Leaderboard_127
             [34] = u130
             [35] = u131
             [36] = t_Crosshair_128
             [37] = t_MapFrame_129
             [38] = u132
             [39] = u133
             [40] = u134
             [41] = t_BombPlant_130
             [42] = t_CharacterFrame_131
             [43] = u135
             [44] = u136
             [45] = u137
             [46] = u138
             [47] = u139
             [48] = t_WeaponInfo_132
             [49] = t_BombCarrier_133
             [50] = u140
             [51] = u141
             [52] = u142
             [53] = u143
             [54] = u144
             [55] = u145
             [56] = u146
             [57] = u147
     --]]
     local t_Value_134 = u105.GameMode.Value;
     if (t_Value_134 == "Trading") then
         return;
     end
     u3 = u106:WaitForChild("PlayerGui"):WaitForChild("MessagesMenu");
     u28 = u107:LoadModule("MapManager");
     u29 = u107:LoadModule("SpectateManager");
     u108:UnbindAction("jumpAction");
     u109(p50, "SpringMouse", 1, 20, 0.0075, nil, true);
     u109(p50, "SpringWalk", 1, 6, 8, nil, true);
     u109(p50, "SpringWalkRotation", 1, 6, 8, nil, true);
     u109(p50, "SpringRecoil", 1, 6, 8, nil, true);
     u109(p50, "SpringJumpY", 0.1, 6, 8);
     u109(p50, "SpringCameraJump", 0.3, 6, 8);
     u109(p50, "SwayIdle", 1, 30, 8, nil, true);
     u109(p50, "ZoltSway", 1, 15, 8, nil, true);
     u109(p50, "ZoltSwayPosition", 1, 15, 8, nil, true);
     u109(p50, "ZoltZoom", 1, 15, 1);
     p50.HeraHealBar = game.ReplicatedStorage.Assets.GeneralAssets.HealthBar:Clone();
     p50.LastYMovement = 0;
     p50.LastCameraUpdateTick = tick();
     p50.LastRenderTime = tick();
     if (u106.Character) then
         p50:NewCharacter();
     end
     local v825 = u106.CharacterAdded;
     local u148 = p50;
     v825:Connect(function() -- [line 2159] anonymous function
         --[[
             Upvalues: 
                 [1] = u148
         --]]
         u148:NewCharacter();
     end);
     coroutine.wrap(function() -- [line 2163] anonymous function
         --[[
             Upvalues: 
                 [1] = u105
                 [2] = u106
                 [3] = u110
                 [4] = u111
                 [5] = u112
                 [6] = u113
                 [7] = u114
                 [8] = u115
                 [9] = u116
         --]]
         while (wait() and (not u105.GameInitialized.Value)) do
         end
         local t_LoadingScreen_135 = u106.PlayerGui.LoadingScreen;
         if (u110:IsStudio()) then
             t_LoadingScreen_135:Destroy();
             u111:FireServer("LoadingFinished");
             return;
         end
         u112:AddClickAnimation(t_LoadingScreen_135.TextFrame.Skip);
         local v826 = u112;
         local v827 = {};
         local v828 = {};
         v828.Button = t_LoadingScreen_135.TextFrame.Skip;
         v828.Intensity = 7;
         v827.Gradient = v828;
         local v829 = {};
         v829.Button = t_LoadingScreen_135.TextFrame.Skip.UIStroke;
         v829.Intensity = 2;
         v827.Border = v829;
         v826:AddHoverAnimation(v827);
         t_LoadingScreen_135.TextFrame.Skip.Visible = true;
         t_LoadingScreen_135.TextFrame.LoadingBar.Visible = true;
         t_LoadingScreen_135.TextFrame.AssetsLoaded.Visible = true;
         local v830 = {};
         v830.Animations = {};
         v830.Meshes = {};
         v830.Images = {};
         v830.Sounds = {};
         local u149 = v830;
         local f_WriteAssets;
         f_WriteAssets = function(p51) -- [line 2202] WriteAssets
             --[[
                 Upvalues: 
                     [1] = u149
             --]]
             local v831, v832, v833 = pairs(p51:GetDescendants());
             local v834 = v831;
             local v835 = v832;
             local v836 = v833;
             while true do
                 local v837, v838 = v834(v835, v836);
                 local v839 = v837;
                 local v840 = v838;
                 if (v837) then
                     break;
                 end
                 v836 = v839;
                 local t_ClassName_136 = v840.ClassName;
                 if (t_ClassName_136 == "Animation") then
                     table.insert(u149.Animations, v840);
                 else
                     local t_ClassName_137 = v840.ClassName;
                     if (t_ClassName_137 == "MeshPart") then
                         table.insert(u149.Meshes, v840);
                     else
                         local t_ClassName_138 = v840.ClassName;
                         if (t_ClassName_138 ~= "ImageLabel") then
                             local t_ClassName_139 = v840.ClassName;
                             if (t_ClassName_139 ~= "ImageButton") then
                                 continue;
                             end
                         end
                         table.insert(u149.Images, v840);
                     end
                 end
             end
         end;
         f_WriteAssets(game.ReplicatedStorage.Assets);
         f_WriteAssets(u106.PlayerGui);
         local v841, v842, v843 = pairs(u113);
         local v844 = v841;
         local v845 = v842;
         local v846 = v843;
         while true do
             local v847, v848 = v844(v845, v846);
             local v849 = v847;
             local v850 = v848;
             if (v847) then
                 break;
             end
             v846 = v849;
             if (v850.RandomSound) then
                 local v851 = 1;
                 local v852 = #v850.RandomSound;
                 local v853 = v852;
                 local v854 = v851;
                 if (not (v852 <= v854)) then
                     while true do
                         table.insert(v830.Sounds, "rbxassetid://" .. v850.RandomSound[v851]);
                         local v855 = v851 + 1;
                         v851 = v855;
                         local v856 = v853;
                         if (v856 < v855) then
                             break;
                         end
                     end
                 end
             else
                 table.insert(v830.Sounds, "rbxassetid://" .. v850.SoundId);
             end
         end
         local v857, v858, v859 = pairs(u114.Characters);
         local v860 = v857;
         local v861 = v858;
         local v862 = v859;
         while true do
             local v863, v864 = v860(v861, v862);
             local v865 = v863;
             local v866 = v864;
             if (v863) then
                 break;
             end
             v862 = v865;
             table.insert(v830.Images, "rbxassetid://" .. v866.ImageId);
             table.insert(v830.Images, "rbxassetid://" .. v866.SquareImageId);
             table.insert(v830.Images, "rbxassetid://" .. v866.CircleImageId);
         end
         local v867, v868, v869 = pairs(u115);
         local v870 = v867;
         local v871 = v868;
         local v872 = v869;
         while true do
             local v873, v874 = v870(v871, v872);
             local v875 = v873;
             local v876 = v874;
             if (v873) then
                 break;
             end
             v872 = v875;
             if (v876.ImageId) then
                 table.insert(v830.Images, "rbxassetid://" .. v876.ImageId);
             end
         end
         local v877 = {};
         local v878 = {};
         v878.Name = "Animations";
         v878.Assets = v830.Animations;
         local v879 = {};
         v879.Name = "Meshes";
         v879.Assets = v830.Meshes;
         local v880 = {};
         v880.Name = "Images";
         v880.Assets = v830.Images;
         local v881 = {};
         v881.Name = "Sounds";
         v881.Assets = v830.Sounds;
         v877[1] = v878;
         v877[2] = v879;
         v877[3] = v880;
         v877[4] = v881;
         local v882 = v877;
         local v883 = 0;
         local u150 = 0;
         local v884 = 1;
         local v885 = #v877;
         local v886 = v885;
         local v887 = v884;
         if (not (v885 <= v887)) then
             while true do
                 v883 = v883 + (#v882[v884].Assets);
                 local v888 = v884 + 1;
                 v884 = v888;
                 local v889 = v886;
                 if (v889 < v888) then
                     break;
                 end
             end
         end
         local u151 = nil;
         t_LoadingScreen_135.TextFrame.Skip.MouseButton1Down:Connect(function() -- [line 2269] anonymous function
             --[[
                 Upvalues: 
                     [1] = u151
             --]]
             u151 = true;
         end);
         local v890 = 1;
         local v891 = #v882;
         local v892 = v891;
         local v893 = v890;
         if (not (v891 <= v893)) then
             while true do
                 local v894 = v882[v890];
                 local v895 = v894;
                 local u152 = 0;
                 local v896 = 1;
                 local v897 = #v894.Assets;
                 local v898 = v897;
                 local v899 = v896;
                 if (not (v897 <= v899)) then
                     while true do
                         local v900 = coroutine.wrap;
                         local u153 = v895;
                         local u154 = v896;
                         v900(function() -- [line 2278] anonymous function
                             --[[
                                 Upvalues: 
                                     [1] = u116
                                     [2] = u153
                                     [3] = u154
                                     [4] = u152
                                     [5] = u150
                             --]]
                             u116:PreloadAsync({
                                 u153.Assets[u154]
                             });
                             u152 = u152 + 1;
                             u150 = u150 + 1;
                         end)();
                         local v901 = v896 + 1;
                         v896 = v901;
                         local v902 = v898;
                         if (v902 < v901) then
                             break;
                         end
                     end
                 end
                 while ((u152 <= (#v895.Assets)) and (not u151)) do
                     t_LoadingScreen_135.TextFrame.AssetsLoaded.Text = u152 .. ("/" .. ((#v895.Assets) .. (" " .. v895.Name)));
                     t_LoadingScreen_135.TextFrame.LoadingBar.Top.Fill.Size = UDim2.new(u150 / v883, 0, 1, 0);
                     task.wait();
                 end
                 local v903 = v890 + 1;
                 v890 = v903;
                 local v904 = v892;
                 if (v904 < v903) then
                     break;
                 end
             end
         end
         t_LoadingScreen_135:Destroy();
         u111:FireServer("LoadingFinished");
     end)();
     local u155 = nil;
     local u156 = nil;
     local u157 = nil;
     local v905 = u117;
     local u158 = p50;
     v905:RenderStepped(function(p52) -- [line 2305] anonymous function
         --[[
             Upvalues: 
                 [1] = u106
                 [2] = u105
                 [3] = u118
                 [4] = t_TopFrame_123
                 [5] = t_DMTopFrame_124
                 [6] = u119
                 [7] = u120
                 [8] = u121
                 [9] = t_Shop_125
                 [10] = u122
                 [11] = u123
                 [12] = t_LargeMapFrame_126
                 [13] = u124
                 [14] = u125
                 [15] = u126
                 [16] = u127
                 [17] = u3
                 [18] = u128
                 [19] = u129
                 [20] = t_Leaderboard_127
                 [21] = u130
                 [22] = u131
                 [23] = t_Crosshair_128
                 [24] = t_MapFrame_129
                 [25] = u158
                 [26] = u132
                 [27] = u133
                 [28] = u134
                 [29] = u29
                 [30] = t_BombPlant_130
                 [31] = t_CharacterFrame_131
                 [32] = u114
                 [33] = u135
                 [34] = u136
                 [35] = u112
                 [36] = u137
                 [37] = u138
                 [38] = u28
                 [39] = u139
                 [40] = u115
                 [41] = t_WeaponInfo_132
                 [42] = t_BombCarrier_133
                 [43] = u140
                 [44] = u141
                 [45] = u111
                 [46] = u142
                 [47] = u110
                 [48] = u156
                 [49] = u143
                 [50] = u157
                 [51] = u144
                 [52] = u155
         --]]
         local t_Value_140 = u106.PermanentTeam.Value;
         local v906;
         if (t_Value_140 == "Team3") then
             v906 = "Team1";
         else
             v906 = u106.PermanentTeam.Value;
         end
         local t_Value_141 = u105[v906 .. "SelectedTeam"].Value;
         u118.ServerReconnecting.Description.Text = u105.DisconnectStatus.Value;
         t_TopFrame_123.ServerRegion.Text = "SERVER REGION: " .. string.upper(u105.ServerRegion.Value);
         t_DMTopFrame_124.ServerRegion.Text = "SERVER REGION: " .. string.upper(u105.ServerRegion.Value);
         if (not u105:FindFirstChild("GameMode")) then
             return;
         end
         if (workspace.RemoveTextures.Value) then
             workspace.RemoveTextures.Value = false;
             local v907, v908, v909 = pairs(u119:GetDescendants());
             local v910 = v907;
             local v911 = v908;
             local v912 = v909;
             while true do
                 local v913, v914 = v910(v911, v912);
                 local v915 = v913;
                 local v916 = v914;
                 if (v913) then
                     break;
                 end
                 v912 = v915;
                 local t_ClassName_142 = v916.ClassName;
                 if (t_ClassName_142 == "MeshPart") then
                     v916.TextureID = "";
                 else
                     local t_ClassName_143 = v916.ClassName;
                     if (t_ClassName_143 ~= "SurfaceAppearance") then
                         local t_ClassName_144 = v916.ClassName;
                         if (t_ClassName_144 ~= "Texture") then
                             continue;
                         end
                     end
                     v916:Destroy();
                 end
             end
         end
         local t_Value_145 = u106.CharacterName.Value;
         if (not (((t_Value_145 == "Kane") and u120.KaneExplosivePlaced) and (u120.KaneExplosivePlaced.Parent and (not u120.KaneExplosivePlaced.Dead.Value)))) then
             u120.KaneExplosivePlaced = nil;
         end
         local t_Value_146 = u105.GameMode.Value;
         if (t_Value_146 ~= "View Recording") then
             local v917 = u121;
             local v918;
             if (((((t_Shop_125.Visible or u122.UIVisible) or (u118.DMResultFrame.Visible or u123.Chatting)) or ((t_LargeMapFrame_126.Visible or u118.CommsFrame.Visible) or (u124.Enabled or u125.Enabled))) or ((u126.Enabled or u127.Enabled) or (u118.CustomMatch.Visible or u118.ObserverUI.Visible))) or (((u118.BadgeFrame.Visible or u118.Leaderboard.Visible) or (u118.DMLeaderboard.Visible or u118.ReportFrame.Visible)) or (u118.ConfirmReportFrame.Visible or u3.Messages.Visible))) then
                 v918 = true;
             else
                 v918 = false;
             end
             v917.MouseIconEnabled = v918;
         end
         local v919 = v906 .. "Score";
         local v920;
         if (v919 == "Team1Score") then
             v920 = "Team2Score";
         else
             v920 = "Team1Score";
         end
         u118.CharacterFrame.InformationBackground.Size = UDim2.new(0, u118.CharacterFrame.Information.UIGridLayout.AbsoluteContentSize.X - 4, 0.245, 0);
         u118.DMStart.BuyText.Text = "PRESS [" .. (u128:GetKey("Shop") .. "] BUY MENU");
         u118.CharacterFrame.Information.ShopMenu.ShopText.Text = "Press " .. (u128:GetKey("Shop") .. " For Shop");
         u118.CharacterFrame.Information.CheatMenu.CheatText.Text = "Press " .. (u128:GetKey("Cheat Menu") .. " For Cheats");
         local t_CheatMenu_147 = u118.CharacterFrame.Information.CheatMenu;
         local v921 = false;
         local t_Value_148 = u105.GameMode.Value;
         if (t_Value_148 == "Custom Match") then
             v921 = u129.Whitelisted;
         end
         t_CheatMenu_147.Visible = v921;
         t_TopFrame_123.AllyScore.TextLabel.Text = u105[v919].Value;
         t_TopFrame_123.EnemyScore.TextLabel.Text = u105[v920].Value;
         local t_Team1Sign_149 = t_TopFrame_123.Team1Sign;
         local v922;
         if (t_Value_141 == "Attacking") then
             v922 = "rbxassetid://6898104757";
         else
             v922 = "rbxassetid://6898130912";
         end
         t_Team1Sign_149.Image = v922;
         local t_Team2Sign_150 = t_TopFrame_123.Team2Sign;
         local v923;
         if (t_Value_141 == "Attacking") then
             v923 = "rbxassetid://6898130912";
         else
             v923 = "rbxassetid://6898104757";
         end
         t_Team2Sign_150.Image = v923;
         t_Leaderboard_127.MiddleFrame.AllyScore.Text = u105[v919].Value;
         t_Leaderboard_127.MiddleFrame.EnemyScore.Text = u105[v920].Value;
         local t_Team1Sign_151 = t_Leaderboard_127.Team1Sign;
         local v924;
         if (t_Value_141 == "Attacking") then
             v924 = "rbxassetid://6898104757";
         else
             v924 = "rbxassetid://6898130912";
         end
         t_Team1Sign_151.Image = v924;
         local t_Team2Sign_152 = t_Leaderboard_127.Team2Sign;
         local v925;
         if (t_Value_141 == "Attacking") then
             v925 = "rbxassetid://6898130912";
         else
             v925 = "rbxassetid://6898104757";
         end
         local v926 = false;
         t_Team2Sign_152.Image = v925;
         u118.Stats.PermTeam.Text = u106.PermanentTeam.Value;
         local v927 = {};
         v927.One = 1;
         v927.Two = 2;
         v927.Three = 3;
         v927.Four = 4;
         v927.Five = 5;
         v927.Six = 6;
         v927.Seven = 7;
         v927.Eight = 8;
         v927.Nine = 9;
         v927.Zero = 0;
         local v928;
         if (u128:GetKey("Lethal Utility")) then
             v928 = v927[u128:GetKey("Lethal Utility")];
             if (not v928) then
                 v928 = u128:GetKey("Lethal Utility");
                 if (not v928) then
                     v926 = true;
                 end
             end
         else
             v926 = true;
         end
         if (v926) then
             v928 = "";
         end
         local v929 = false;
         u130.LethalKeybind.Text = "[" .. (v928 .. "]");
         local v930;
         if (u128:GetKey("Tactical Utility")) then
             v930 = v927[u128:GetKey("Tactical Utility")];
             if (not v930) then
                 v930 = u128:GetKey("Tactical Utility");
                 if (not v930) then
                     v929 = true;
                 end
             end
         else
             v929 = true;
         end
         if (v929) then
             v930 = "";
         end
         u130.TacticalKeybind.Text = "[" .. (v930 .. "]");
         local t_ChangeCharacter_153 = u118.CharacterFrame.Information.ChangeCharacter;
         local v931 = false;
         local t_Value_154 = u105.GameMode.Value;
         if (t_Value_154 == "Casual") then
             v931 = false;
             local t_Value_155 = u105.RoundType.Value;
             if (t_Value_155 == "Intermission") then
                 v931 = u131.PlayerOperators[u106.Name];
             end
         end
         t_ChangeCharacter_153.Visible = v931;
         local t_IGNORE_Blur_156 = game.Lighting.IGNORE_Blur;
         local v932 = t_Shop_125.Visible;
         if (not v932) then
             v932 = u118.DMResultFrame.Visible;
         end
         t_IGNORE_Blur_156.Enabled = v932;
         local v933 = t_DMTopFrame_124;
         local v934 = false;
         local t_Value_157 = u105.GameMode.Value;
         if (t_Value_157 == "Deathmatch") then
             v934 = not t_Shop_125.Visible;
             if (v934) then
                 v934 = not u118.DMResultFrame.Visible;
                 if (v934) then
                     v934 = not u118.DMStart.Visible;
                 end
             end
         end
         v933.Visible = v934;
         local v935 = t_TopFrame_123;
         local v936 = false;
         local t_Value_158 = u105.GameMode.Value;
         if (t_Value_158 ~= "Deathmatch") then
             v936 = not t_Shop_125.Visible;
         end
         v935.Visible = v936;
         local v937 = u130;
         local v938 = false;
         local t_Value_159 = u105.GameMode.Value;
         if (t_Value_159 ~= "Deathmatch") then
             v938 = not t_Shop_125.Visible;
         end
         v937.Visible = v938;
         local t_DMLeaderboard_160 = u118.DMLeaderboard;
         local v939 = false;
         local t_Value_161 = u105.GameMode.Value;
         if (t_Value_161 == "Deathmatch") then
             v939 = not u118.DMResultFrame.Visible;
             if (v939) then
                 v939 = not u118.DMStart.Visible;
                 if (v939) then
                     v939 = u118.DMLeaderboard.Visible;
                 end
             end
         end
         t_DMLeaderboard_160.Visible = v939;
         local t_RoundNotification_162 = u118.RoundNotification;
         local v940 = u120.RoundNotification;
         if (v940) then
             v940 = false;
             local t_RoundNotification_163 = u120.RoundNotification;
             if (t_RoundNotification_163 ~= "CloseRoundEnd") then
                 v940 = not t_Shop_125.Visible;
             end
         end
         t_RoundNotification_162.Visible = v940;
         local t_RoundNotification_164 = u120.RoundNotification;
         if (t_RoundNotification_164 == "BuyRound") then
             u118.RoundNotification.SecondaryText.Text = "PRESS " .. (u128:GetKey("Shop") .. " TO OPEN");
         end
         local t_Value_165 = u105.GameMode.Value;
         if (t_Value_165 == "Deathmatch") then
             u118.WeaponInfo.Visible = not u118.DMResultFrame.Visible;
             u118.CharacterFrame.Visible = not u118.DMResultFrame.Visible;
             local v941 = t_Crosshair_128;
             local v942 = not u118.DMResultFrame.Visible;
             if (v942) then
                 v942 = not u118.DMStart.Visible;
             end
             v941.Visible = v942;
             local v943 = t_MapFrame_129;
             local v944 = not u118.DMResultFrame.Visible;
             if (v944) then
                 v944 = not u118.DMStart.Visible;
             end
             v943.Visible = v944;
         end
         local v945 = false;
         local t_Value_166 = u105.RoundType.Value;
         if (t_Value_166 == "Intermission") then
             v945 = true;
         else
             local t_Value_167 = u105.RoundType.Value;
             if (t_Value_167 == "Game") then
                 v945 = true;
             else
                 local t_Value_168 = u105.RoundType.Value;
                 if (t_Value_168 == "RoundEnded") then
                     v945 = true;
                 else
                     local t_Value_169 = u105.RoundType.Value;
                     if (t_Value_169 == "BombPlanted") then
                         t_TopFrame_123.Timer.Visible = false;
                         t_TopFrame_123.Bomb.Visible = true;
                     end
                 end
             end
         end
         if (v945) then
             local v946 = false;
             local v947 = math.ceil(u105.RoundTime.Value);
             local v948 = math.floor(v947 / 60);
             local v949 = v947 - (v948 * 60);
             local v950 = v949;
             local v951 = v948;
             local v952;
             if (v949 > 10) then
                 v952 = v950;
                 if (not v952) then
                     v946 = true;
                 end
             else
                 v946 = true;
             end
             if (v946) then
                 v952 = "0" .. v950;
             end
             local v953 = false;
             local v954 = v951 .. (":" .. v952);
             local t_Value_252 = u105.GameMode.Value;
             if (t_Value_252 == "Deathmatch") then
                 v953 = true;
             else
                 local t_Value_253 = u105.GameMode.Value;
                 if (t_Value_253 == "Tutorial") then
                     v953 = true;
                 else
                     t_TopFrame_123.Timer.Text = v954;
                     t_TopFrame_123.Timer.Visible = true;
                     t_TopFrame_123.Bomb.Visible = false;
                 end
             end
             if (v953) then
                 local t_Value_256 = u105.GameMode.Value;
                 if (t_Value_256 == "Deathmatch") then
                     t_DMTopFrame_124.Timer.Text = v954;
                     t_DMTopFrame_124.Timer.Visible = true;
                 else
                     local t_Value_257 = u105.GameMode.Value;
                     if (t_Value_257 == "Tutorial") then
                         t_TopFrame_123.Timer.Text = "--:--";
                         t_TopFrame_123.Timer.Visible = true;
                         t_TopFrame_123.Bomb.Visible = false;
                     end
                 end
             end
             local v955 = math.ceil(u105.RoundTime.Value);
             if ((v955 < 5) and (not (v954 == u158.LastTime))) then
                 u132:PlaySound("Timer Beep");
             end
             local v956 = false;
             u158.LastTime = v954;
             local t_Value_254 = u105.GameMode.Value;
             local v957;
             if (t_Value_254 == "Deathmatch") then
                 v957 = t_DMTopFrame_124;
                 if (not v957) then
                     v956 = true;
                 end
             else
                 v956 = true;
             end
             if (v956) then
                 v957 = t_TopFrame_123;
             end
             local t_Value_255 = u105.RoundTime.Value;
             if ((t_Value_255 < 10) and (not u158.TimerColorTween)) then
                 local v958 = coroutine.wrap;
                 local u159 = v957;
                 v958(function() -- [line 2433] anonymous function
                     --[[
                         Upvalues: 
                             [1] = u158
                             [2] = u133
                             [3] = u159
                     --]]
                     local v959 = u158;
                     local v960 = u133;
                     local v961 = u159.Timer;
                     local v962 = TweenInfo.new(0.4, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, 0, true);
                     local v963 = {};
                     v963.TextColor3 = Color3.fromRGB(244, 145, 145);
                     v959.TimerColorTween = v960:Create(v961, v962, v963);
                     u158.TimerColorTween:Play();
                     u158.TimerColorTween.Completed:wait();
                     wait(1);
                     u158.TimerColorTween = nil;
                 end)();
             else
                 if ((u105.RoundTime.Value >= 10) and u158.TimerColorTween) then
                     u158.TimerColorTween:Cancel();
                     u158.TimerColorTween = nil;
                     v957.Timer.TextColor3 = Color3.fromRGB(255, 255, 255);
                 end
             end
         end
         debug.profilebegin("Render bullets");
         u158:RenderBullets();
         debug.profileend();
         local v964 = u120.CurrentWeapon;
         if (v964) then
             v964 = u120.CurrentWeapon.Parent;
             if (v964) then
                 v964 = u120.CurrentWeaponData;
                 if (v964) then
                     v964 = u134:IsAlive();
                     if (v964) then
                         v964 = not u29.Spectating;
                     end
                 end
             end
         end
         if (not v964) then
             if (not ((u29.Spectating and u29.SpectatingPlayer) and (u29.SpectatingData and u29.SpectatingData.PlantingPercent))) then
                 t_BombPlant_130.PlantingBar.Visible = false;
             end
             u118.HeraHealInfo.Visible = false;
             u158.HeraHealBar.Parent = script;
             if (u158.HeraAbility and u158.HeraAbility.Parent) then
                 u158.HeraAbility:Destroy();
                 u158.HeraAbility = nil;
             end
             if (u158.SentientTurret and u158.SentientTurret.Parent) then
                 u120.SentientTurret:Destroy();
                 u120.SentientTurret = nil;
             end
             if (u120.KaneExplosive and u120.KaneExplosive.Parent) then
                 u120.KaneExplosive:Destroy();
                 u120.KaneExplosive = nil;
             end
         end
         if (((t_Value_145 == "Zyla") and u120.AbilityInUse) and ((not u120.ActivatingAbility) and v964)) then
             t_CharacterFrame_131.HealthBottom.ImageColor3 = Color3.fromRGB(0, 177, 177);
             t_CharacterFrame_131.HealthBottom.Frame.Top.ImageColor3 = Color3.fromRGB(0, 255, 255);
         else
             t_CharacterFrame_131.HealthBottom.ImageColor3 = Color3.fromRGB(135, 37, 37);
             t_CharacterFrame_131.HealthBottom.Frame.Top.ImageColor3 = Color3.fromRGB(255, 71, 71);
         end
         if (not (v964 and (not u127.Enabled))) then
             if ((u120.CurrentWeapon and u120.CurrentWeapon.Parent) and (not u134:IsAlive())) then
                 u120.CurrentWeapon:Destroy();
                 u120.CurrentWeaponData = nil;
             end
             return;
         end
         local v965 = u114.Characters[t_Value_145];
         local v966 = u106.Character.HumanoidRootPart;
         local t_HumanoidRootPart_170 = v966;
         local t_CFrame_171 = v966.CFrame;
         local v967;
         if ((t_Value_145 == "Kane") and u120.KaneExplosivePlaced) then
             v967 = 10164137021;
         else
             v967 = v965.Ability.ImageId;
         end
         local v968 = false;
         local t_CharPhoto_172 = t_CharacterFrame_131.CharPhoto.CharPhoto;
         local v969;
         if (v965) then
             v969 = "rbxassetid://" .. v965.ImageId;
             if (not v969) then
                 v968 = true;
             end
         else
             v968 = true;
         end
         if (v968) then
             v969 = "";
         end
         local v970 = false;
         t_CharPhoto_172.Image = v969;
         local t_AbilityImage_173 = u130.Ability.AbilityImage;
         local v971;
         if (v965) then
             v971 = "rbxassetid://" .. v967;
             if (not v971) then
                 v970 = true;
             end
         else
             v970 = true;
         end
         if (v970) then
             v971 = "";
         end
         t_AbilityImage_173.Image = v971;
         u130.Ability.Key.Text = "[" .. (u128:GetKey("Ability") .. "]");
         u130.Ability.UseFrame.Use1.Visible = 1 <= v965.Ability.Uses;
         u130.Ability.UseFrame.Use2.Visible = 2 <= v965.Ability.Uses;
         local t_Top_174 = u130.Ability.UseFrame.Use1.Top;
         local v972 = true;
         if (not (u120.WeaponData.Ability.Uses >= 1)) then
             v972 = u120.KaneExplosivePlaced;
         end
         t_Top_174.Visible = v972;
         u130.Ability.UseFrame.Use2.Top.Visible = 2 <= u120.WeaponData.Ability.Uses;
         local t_Value_175 = u105.GameMode.Value;
         if (t_Value_175 ~= "Deathmatch") then
             if (u120.RechargingAbility) then
                 local v973 = u120.WeaponData.Ability.Uses;
                 local t_Uses_176 = v965.Ability.Uses;
                 if (t_Uses_176 < v973) then
                     u120.RechargingAbility = nil;
                 end
             end
             if (u120.RechargingAbility and u120.KaneExplosivePlaced) then
                 u120.RechargingAbility = nil;
             end
             local v974 = false;
             if (v965.Ability.RechargeTime) then
                 local t_Uses_177 = u120.WeaponData.Ability.Uses;
                 if (((t_Uses_177 <= v965.Ability.Uses) and (not u120.AbilityCooldown)) and (not (u120.RechargingAbility or u120.KaneExplosivePlaced))) then
                     u120.RechargingAbility = tick();
                 else
                     v974 = true;
                 end
             else
                 v974 = true;
             end
             if (v974) then
                 if (u120.RechargingAbility) then
                     local v975 = tick() - u120.RechargingAbility;
                     local t_RechargeTime_178 = v965.Ability.RechargeTime;
                     if (t_RechargeTime_178 < v975) then
                         u120.RechargingAbility = nil;
                         local v976 = u120.WeaponData.Ability;
                         v976.Uses = v976.Uses + 1;
                     end
                 end
             end
         end
         if ((((t_Value_145 == "Hera") and u120.CurrentWeaponData.Ability) and (u158.HeraAbility and u158.HeraAbility.Parent)) and ((u120.WeaponData.Ability.Uses >= 0) and u158.CanFire)) then
             local v977 = false;
             u118.HeraHealInfo.Visible = true;
             local v978 = u128:GetKey("Fire");
             if (v978 == "MouseButton1") then
                 v977 = true;
             else
                 local v979 = u128:GetKey("Fire");
                 if (v979 == "MouseButton2") then
                     v977 = true;
                 else
                     u118.HeraHealInfo.LeftClick.MouseIcon.Visible = false;
                     u118.HeraHealInfo.LeftClick.KeyBind.Visible = true;
                     u118.HeraHealInfo.LeftClick.KeyBind.Text = "[" .. (u128:GetKey("Fire") .. "]");
                 end
             end
             if (v977) then
                 u118.HeraHealInfo.LeftClick.MouseIcon.Visible = true;
                 u118.HeraHealInfo.LeftClick.KeyBind.Visible = false;
             end
             local v980 = false;
             local v981 = u128:GetKey("Aim");
             if (v981 == "MouseButton1") then
                 v980 = true;
             else
                 local v982 = u128:GetKey("Aim");
                 if (v982 == "MouseButton2") then
                     v980 = true;
                 else
                     u118.HeraHealInfo.RightClick.MouseIcon.Visible = false;
                     u118.HeraHealInfo.RightClick.KeyBind.Visible = true;
                     u118.HeraHealInfo.RightClick.KeyBind.Text = "[" .. (u128:GetKey("Aim") .. "]");
                 end
             end
             if (v980) then
                 u118.HeraHealInfo.RightClick.MouseIcon.Visible = true;
                 u118.HeraHealInfo.RightClick.KeyBind.Visible = false;
             end
             local v983 = nil;
             local v984 = {};
             local v985 = {};
             local v986 = Vector2.new(u118.AbsolutePosition.X + (u118.AbsoluteSize.X / 2), u118.AbsolutePosition.Y + (u118.AbsoluteSize.Y / 2));
             local v987, v988, v989 = pairs(game.Players:GetPlayers());
             local v990 = v987;
             local v991 = v988;
             local v992 = v989;
             while true do
                 local v993, v994 = v990(v991, v992);
                 local v995 = v993;
                 local v996 = v994;
                 if (v993) then
                     break;
                 end
                 v992 = v995;
                 if (u134:IsAlive(v996)) then
                     local t_Value_179 = v996.PermanentTeam.Value;
                     if (t_Value_179 == u106.PermanentTeam.Value) then
                         local v997 = u106;
                         if (v997 ~= v996) then
                             local v998 = u135.GetCharacter(v996);
                             local v999 = v998;
                             local t_magnitude_180 = (t_CFrame_171.p - v998.HumanoidRootPart.Position).magnitude;
                             if (t_magnitude_180 < 90) then
                                 local v1000, v1001 = u136:WorldToScreenPoint(v999.HumanoidRootPart.Position);
                                 local v1002 = v1000;
                                 if (v1001 and u112:PointInFrame(u118.SpotFrame, v1000)) then
                                     local v1003 = RaycastParams.new();
                                     v1003.FilterType = Enum.RaycastFilterType.Blacklist;
                                     v1003.FilterDescendantsInstances = {
                                         u106.Character,
                                         workspace.CurrentCamera,
                                         workspace.RaycastIgnore,
                                         workspace.DroppedWeapons,
                                         u119.Map.Ramps,
                                         u119.Map.Walls
                                     };
                                     local v1004 = workspace:Raycast(u136.CFrame.p, CFrame.new(u136.CFrame.p, v999.HumanoidRootPart.Position).LookVector * t_magnitude_180, v1003);
                                     if (v1004 and v1004.Instance:IsDescendantOf(v999)) then
                                         table.insert(v984, (math.sqrt(math.pow(v986.X - v1002.X, 2) + math.pow(v986.Y - v1002.Y, 2))));
                                         table.insert(v985, v996);
                                     end
                                 end
                             end
                         end
                     end
                 end
             end
             if ((#v984) >= 0) then
                 local v1005 = math.min(unpack(v984));
                 local v1006 = 1;
                 local v1007 = #v984;
                 local v1008 = v1007;
                 local v1009 = v1006;
                 if (not (v1007 <= v1009)) then
                     while true do
                         local v1010 = v984[v1006];
                         if (v1010 == v1005) then
                             break;
                         end
                         local v1011 = v1006 + 1;
                         v1006 = v1011;
                         local v1012 = v1008;
                         if (v1012 < v1011) then
                             break;
                         end
                     end
                     v983 = v985[v1006];
                 end
             end
             if (v983) then
                 u158.HeraAbility.Enabled = true;
                 u158.HeraAbility.Adornee = u135.GetCharacter(v983).HumanoidRootPart;
                 u158.HeraHealBar.Parent = workspace;
                 u158.HeraHealBar.Position = u135.GetCharacter(v983).PrimaryPart.Position - Vector3.new(0, 5, 0);
                 u158.HeraHealBar.BillboardGui.BottomHealth.TopHealth.Size = UDim2.new((u135.GetCharacter(v983).Humanoid.Health - 0) / 100, 0, 1, 0);
             else
                 u158.HeraAbility.Enabled = false;
                 u158.HeraAbility.Adornee = nil;
                 u158.HeraHealBar.Parent = script;
             end
             if (v983 and u137:IsKeyDown("Fire")) then
                 u158:HeraHeal(v983);
             else
                 if (u137:IsKeyDown("Aim")) then
                     u158:HeraHeal(u106);
                 end
             end
         else
             u158.HeraHealBar.Parent = script;
             u118.HeraHealInfo.Visible = false;
         end
         if (((t_Value_145 == "Proto") and u120.CurrentWeaponData.Ability) and (not u120.AbilityWeaponCooldown)) then
             local v1013 = false;
             local v1014 = t_LargeMapFrame_126.AbsolutePosition;
             local v1015 = Vector2.new(u138.X - v1014.X, u138.Y - v1014.Y);
             local v1016 = u114.Characters[t_Value_145];
             local v1017 = v1016;
             local v1018 = workspace.MapFolder.Map.MapInfo.MapSize.Value;
             local v1019 = v1016.Ability.HumbugScanRange / v1018;
             local v1020 = v1016.Ability.HumbugRange / v1018;
             u120.ProtoMapTracer.Position = UDim2.new(0, v1015.X, 0, v1015.Y);
             u120.ProtoMapTracer.Size = UDim2.new(v1019, 0, v1019, 0);
             u120.ProtoMapRange.Size = UDim2.new(0, v1020 * t_LargeMapFrame_126.AbsoluteSize.X, 0, v1020 * t_LargeMapFrame_126.AbsoluteSize.Y);
             local v1021 = u139(u28:MouseToVector3(), true);
             local v1022 = v1021;
             local t_p_181 = t_CFrame_171.p;
             if (v1021) then
                 local t_magnitude_182 = (v1022 - Vector3.new(t_p_181.X, v1022.Y, t_p_181.Z)).magnitude;
                 if (t_magnitude_182 <= (v1017.Ability.HumbugRange / 2)) then
                     u120.ProtoMapTracer.BackgroundColor3 = Color3.fromRGB(255, 255, 255);
                     u120.ProtoMapTracer.UIStroke.Color = Color3.fromRGB(202, 202, 202);
                     u120.ProtoPosition = v1022;
                 else
                     v1013 = true;
                 end
             else
                 v1013 = true;
             end
             if (v1013) then
                 u120.ProtoMapTracer.BackgroundColor3 = Color3.fromRGB(223, 70, 0);
                 u120.ProtoMapTracer.UIStroke.Color = Color3.fromRGB(181, 54, 0);
                 u120.ProtoPosition = nil;
             end
         else
             if (u120.ProtoMapTracer and u120.ProtoMapTracer.Parent) then
                 u120.ProtoMapTracer:Destroy();
                 u120.ProtoMapRange:Destroy();
                 u120.ProtoMapTracer = nil;
                 u120.ProtoMapRange = nil;
                 u120.ProtoPosition = nil;
             end
         end
         if (((t_Value_145 == "Kane") and u120.CurrentWeaponData.Ability) and (u120.KaneExplosive and u120.KaneExplosive.Parent)) then
             local t_KaneExplosive_183 = u120.KaneExplosive;
             local v1023, v1024, v1025 = u136.CFrame:ToOrientation();
             local v1026 = v1024;
             local v1027 = RaycastParams.new();
             local v1028 = v1027;
             v1027.FilterType = Enum.RaycastFilterType.Blacklist;
             v1027.FilterDescendantsInstances = {
                 u106.Character,
                 workspace.CurrentCamera,
                 workspace.RaycastIgnore,
                 workspace.DroppedWeapons,
                 u119.Players
             };
             local v1029 = workspace:Raycast(u136.CFrame.p, u136.CFrame.lookVector * 8, v1027);
             if (not v1029) then
                 v1029 = {};
                 v1029.Position = u136.CFrame * CFrame.new(0, 0, -8).p;
             end
             local v1030 = workspace:Raycast(v1029.Position + Vector3.new(0, 0.01, 0), Vector3.new(0, ((-t_KaneExplosive_183.Part.Size.Y) / 2) - 0.01, 0), v1028);
             local v1031 = v1030;
             local v1032 = u158;
             local v1033 = {};
             v1033.OriginCFrame = CFrame.new(v1029.Position + Vector3.new(0, 0.6, 0)) * CFrame.Angles(0, v1026, 0);
             v1033.LookVector = Vector3.new(0, -100, 0);
             v1033.Size = Vector3.new(1.3, 0, 1.3);
             v1033.ReturnLower = true;
             v1033.CollideWith = {
                 u119.Bomb
             };
             local v1034 = not v1032:MultiRaycast(v1033);
             local v1036;
             if (v1030) then
                 local v1035 = {};
                 v1035.Position = v1031.Position + Vector3.new(0, t_KaneExplosive_183.Part.Size.Y / 2, 0);
                 v1036 = v1035;
             else
                 v1034 = true;
                 local v1037 = {};
                 v1037.Position = v1029.Position;
                 v1036 = v1037;
             end
             t_KaneExplosive_183.PrimaryPart.CFrame = CFrame.new(Vector3.new(v1029.Position.X, v1036.Position.Y, v1029.Position.Z)) * CFrame.Angles(0, v1026, 0);
             if (not v1034) then
                 local v1038, v1039, v1040 = pairs(t_KaneExplosive_183.Collision:GetTouchingParts());
                 local v1041 = v1038;
                 local v1042 = v1039;
                 local v1043 = v1040;
                 while true do
                     local v1044, v1045 = v1041(v1042, v1043);
                     local v1046 = v1044;
                     local v1047 = v1045;
                     if (v1044) then
                         break;
                     end
                     v1043 = v1046;
                     if (not ((v1047:IsDescendantOf(t_KaneExplosive_183) or v1047:IsDescendantOf(workspace.CurrentCamera)) or (v1047:IsDescendantOf(workspace.RaycastIgnore) or v1047:IsDescendantOf(workspace.DroppedWeapons)))) then
                         break;
                     end
                 end
                 v1034 = true;
             end
             local v1048 = u158;
             local v1049 = not v1034;
             if (v1049) then
                 v1049 = t_KaneExplosive_183.PrimaryPart.CFrame;
             end
             local v1050 = false;
             v1048.KaneExplosiveCFrame = v1049;
             local t_Part_184 = t_KaneExplosive_183.Part;
             local v1051;
             if (v1034) then
                 v1051 = Color3.fromRGB(255, 0, 0);
                 if (not v1051) then
                     v1050 = true;
                 end
             else
                 v1050 = true;
             end
             if (v1050) then
                 v1051 = Color3.fromRGB(0, 255, 255);
             end
             t_Part_184.Color = v1051;
         else
             if (u120.KaneExplosive and u120.KaneExplosive.Parent) then
                 u120.KaneExplosive:Destroy();
                 u120.KaneExplosive = nil;
                 u120.KaneExplosiveConnection:Disconnect();
             end
         end
         if ((t_Value_145 == "Kane") and u120.KaneExplosivePlaced) then
             local v1052 = false;
             if (u158.CanFire and (not u120.AbilityWeaponCooldown)) then
                 local t_Weapon_185 = u120.CurrentWeaponData.Weapon;
                 if (t_Weapon_185 == "Kane ViewModel") then
                     if (u137:IsKeyDown("Fire")) then
                         u158:DetonateKaneExplosive();
                     else
                         u120.KaneExplosivePlaced.Ring.Decal.Transparency = 0.6;
                     end
                 else
                     v1052 = true;
                 end
             else
                 v1052 = true;
             end
             if (v1052) then
                 u120.KaneExplosivePlaced.Ring.Decal.Transparency = 1;
             end
         end
         if (((t_Value_145 == "Sentient") and u120.CurrentWeaponData.Ability) and (u120.SentientTurret and u120.SentientTurret.Parent)) then
             local v1053 = u120.SentientTurret;
             local t_SentientTurret_186 = v1053;
             local v1054, v1055, v1056 = u136.CFrame:ToOrientation();
             local v1057 = v1055 + math.rad(180 + u120.SentientTurretRotation);
             local v1058 = RaycastParams.new();
             local v1059 = v1058;
             v1058.FilterType = Enum.RaycastFilterType.Blacklist;
             v1058.FilterDescendantsInstances = {
                 u106.Character,
                 workspace.CurrentCamera,
                 workspace.RaycastIgnore,
                 workspace.DroppedWeapons,
                 u119.Players
             };
             local v1060 = v1053.RootPart.Position.Y - v1053.HitBox.Position.Y;
             local v1061 = workspace:Raycast(u136.CFrame.p, u136.CFrame.lookVector * 8, v1058);
             if (not v1061) then
                 v1061 = {};
                 v1061.Position = u136.CFrame * CFrame.new(0, 0, -8).p;
             end
             local v1062 = workspace:Raycast(v1061.Position + Vector3.new(0, 0.01, 0), Vector3.new(0, (((-t_SentientTurret_186.HitBox.Size.Y) / 2) - v1060) - 1, 0), v1059);
             local v1063 = v1062;
             local v1064 = u158;
             local v1065 = {};
             v1065.OriginCFrame = CFrame.new(v1061.Position + Vector3.new(0, 0.6, 0)) * CFrame.Angles(0, v1057, 0);
             v1065.LookVector = Vector3.new(0, -100, 0);
             v1065.Size = Vector3.new(2, 0, 2);
             v1065.ReturnLower = true;
             v1065.CollideWith = {
                 u119.Bomb
             };
             local v1066 = not v1064:MultiRaycast(v1065);
             local v1068;
             if (v1062) then
                 local v1067 = {};
                 v1067.Position = v1063.Position + Vector3.new(0, (t_SentientTurret_186.HitBox.Size.Y / 2) + v1060, 0);
                 v1068 = v1067;
             else
                 v1066 = true;
                 local v1069 = {};
                 v1069.Position = v1061.Position + Vector3.new(0, -1, 0);
                 v1068 = v1069;
             end
             t_SentientTurret_186.PrimaryPart.CFrame = CFrame.new(Vector3.new(v1061.Position.X, v1068.Position.Y, v1061.Position.Z)) * CFrame.Angles(0, v1057, 0);
             if (not v1066) then
                 local v1070, v1071, v1072 = pairs(t_SentientTurret_186.Collision:GetTouchingParts());
                 local v1073 = v1070;
                 local v1074 = v1071;
                 local v1075 = v1072;
                 while true do
                     local v1076, v1077 = v1073(v1074, v1075);
                     local v1078 = v1076;
                     local v1079 = v1077;
                     if (v1076) then
                         break;
                     end
                     v1075 = v1078;
                     if (not ((v1079:IsDescendantOf(t_SentientTurret_186) or v1079:IsDescendantOf(workspace.CurrentCamera)) or (v1079:IsDescendantOf(workspace.RaycastIgnore) or v1079:IsDescendantOf(workspace.DroppedWeapons)))) then
                         break;
                     end
                 end
                 v1066 = true;
             end
             local v1080 = u158;
             local v1081 = not v1066;
             if (v1081) then
                 v1081 = t_SentientTurret_186.PrimaryPart.CFrame;
             end
             v1080.SentientTurretCFrame = v1081;
             local v1082, v1083, v1084 = pairs(t_SentientTurret_186.Object:GetDescendants());
             local v1085 = v1082;
             local v1086 = v1083;
             local v1087 = v1084;
             while true do
                 local v1088, v1089 = v1085(v1086, v1087);
                 local v1090 = v1088;
                 local v1091 = v1089;
                 if (v1088) then
                     break;
                 end
                 v1087 = v1090;
                 if (v1091:IsA("BasePart")) then
                     local v1092 = false;
                     local v1093;
                     if (v1066) then
                         v1093 = Color3.fromRGB(255, 0, 0);
                         if (not v1093) then
                             v1092 = true;
                         end
                     else
                         v1092 = true;
                     end
                     if (v1092) then
                         v1093 = Color3.fromRGB(0, 255, 255);
                     end
                     v1091.Color = v1093;
                 end
             end
         else
             if (u120.SentientTurret and u120.SentientTurret.Parent) then
                 u120.SentientTurret:Destroy();
                 u120.SentientTurret = nil;
                 u120.SentientTurretConnection:Disconnect();
             end
         end
         local v1094 = u120.RechargingAbility;
         if (v1094) then
             v1094 = math.ceil(v965.Ability.RechargeTime - (tick() - u120.RechargingAbility));
         end
         u130.Ability.Cooldown.Text = v1094 or "";
         if (u120.AbilityInUse and (not u120.ActivatingAbility)) then
             if (t_Value_145 == "Zolt") then
                 u130.Ability.Bar.Visible = true;
                 u130.Ability.UseFrame.Visible = false;
                 u130.Ability.Bar.Top.Size = UDim2.new(1 - ((tick() - u120.AbilityInUse) / 7), 0, 1, 0);
             else
                 if ((t_Value_145 == "Edira") or (t_Value_145 == "Zyla")) then
                     u130.Ability.Bar.Visible = true;
                     u130.Ability.UseFrame.Visible = false;
                     local v1095;
                     if (t_Value_145 == "Edira") then
                         v1095 = 20;
                     else
                         v1095 = false;
                         if (t_Value_145 == "Zyla") then
                             v1095 = 8;
                         end
                     end
                     u130.Ability.Bar.Top.Size = UDim2.new(1 - ((tick() - u120.AbilityInUse) / v1095), 0, 1, 0);
                 end
             end
         else
             u130.Ability.Bar.Visible = false;
             u130.Ability.UseFrame.Visible = true;
         end
         local v1096 = false;
         local v1097 = u115[u120.CurrentWeaponData.Weapon];
         local v1098 = v1097;
         local t_Class_187 = v1097.Class;
         if (t_Class_187 == "Melee") then
             v1096 = true;
         else
             local t_Class_188 = v1098.Class;
             if (t_Class_188 == "Bomb") then
                 v1096 = true;
             else
                 local t_Class_189 = v1098.Class;
                 if ((t_Class_189 == "Ability") or v1098.Grenade) then
                     v1096 = true;
                 else
                     local v1099 = false;
                     local v1100 = (u120.CurrentWeaponData.Bullets / v1098.MaxBullets) <= 0.35;
                     local v1101 = v1100;
                     t_WeaponInfo_132.CurrentAmmo.Text = u120.CurrentWeaponData.Bullets;
                     t_WeaponInfo_132.UnusedAmmo.Text = u120.CurrentWeaponData.ReserveAmmo;
                     local t_Background_190 = t_WeaponInfo_132.Background;
                     local v1102;
                     if (v1100) then
                         v1102 = Color3.fromRGB(165, 62, 62);
                         if (not v1102) then
                             v1099 = true;
                         end
                     else
                         v1099 = true;
                     end
                     if (v1099) then
                         v1102 = Color3.fromRGB(40, 40, 40);
                     end
                     t_Background_190.ImageColor3 = v1102;
                     if (v1101 and (not u158.AmmoColorTween)) then
                         coroutine.wrap(function() -- [line 2818] anonymous function
                             --[[
                                 Upvalues: 
                                     [1] = u158
                                     [2] = u133
                                     [3] = t_WeaponInfo_132
                             --]]
                             local v1103 = u158;
                             local v1104 = u133;
                             local v1105 = t_WeaponInfo_132.CurrentAmmo;
                             local v1106 = TweenInfo.new(0.4, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, 0, true);
                             local v1107 = {};
                             v1107.TextColor3 = Color3.fromRGB(244, 145, 145);
                             v1103.AmmoColorTween = v1104:Create(v1105, v1106, v1107);
                             u158.AmmoColorTween:Play();
                             u158.AmmoColorTween.Completed:wait();
                             u158.AmmoColorTween = nil;
                         end)();
                     else
                         if ((not v1101) and u158.AmmoColorTween) then
                             u158.AmmoColorTween:Cancel();
                             u158.AmmoColorTween = nil;
                             t_WeaponInfo_132.CurrentAmmo.TextColor3 = Color3.fromRGB(255, 255, 255);
                         end
                     end
                 end
             end
         end
         if (v1096) then
             t_WeaponInfo_132.CurrentAmmo.Text = "";
             t_WeaponInfo_132.UnusedAmmo.Text = "";
             t_WeaponInfo_132.Background.ImageColor3 = Color3.fromRGB(40, 40, 40);
         end
         local v1108 = t_BombCarrier_133;
         local v1109;
         if ((u120.WeaponData.Inventory[4] and u120.WeaponData.Inventory[4][1]) and (not t_Shop_125.Visible)) then
             v1109 = true;
         else
             v1109 = false;
         end
         v1108.Visible = v1109;
         local v1110 = nil;
         local v1111 = nil;
         local v1112 = false;
         local v1113 = true;
         if (t_Value_145 ~= "Hera") then
             v1113 = true;
             if (t_Value_145 ~= "Proto") then
                 v1113 = true;
                 if (t_Value_145 ~= "Sentient") then
                     v1113 = t_Value_145 == "Kane";
                 end
             end
         end
         local v1114 = false;
         local v1115;
         if (v1113) then
             v1115 = not u120.AbilityWeaponCooldown;
             if (not v1115) then
                 v1114 = true;
             end
         else
             v1114 = true;
         end
         if (v1114) then
             v1115 = not v1113;
         end
         if (not u120.BombTick) then
             local v1116 = false;
             if (u120.WeaponData.Inventory[4][1]) then
                 local t_Value_191 = u106.Character.Team.Value;
                 if ((t_Value_191 == "Attacking") and u105.RoundStarted.Value) then
                     local t_Value_192 = u105.RoundType.Value;
                     if (t_Value_192 == "BombPlanted") then
                         v1116 = true;
                     else
                         local v1117 = t_CFrame_171.p - Vector3.new(0, 3.75, 0);
                         local v1118, v1119, v1120 = pairs(workspace:FindPartsInRegion3WithWhiteList(Region3.new(v1117 - Vector3.new(0.5, 0.5, 0.5), v1117 + Vector3.new(0.5, 0.5, 0.5)), {
                             u119.Map.Sites
                         }));
                         local v1121 = v1118;
                         local v1122 = v1119;
                         local v1123 = v1120;
                         while true do
                             local v1124, v1125 = v1121(v1122, v1123);
                             local v1126 = v1124;
                             local v1127 = v1125;
                             if (v1124) then
                                 break;
                             end
                             v1123 = v1126;
                             v1110 = v1127;
                         end
                         if (v1110 and ((not u140.Falling) and v1115)) then
                             t_BombPlant_130.PlantText.Text = "Hold " .. (u128:GetKey("PlantBomb") .. " To Plant");
                             v1112 = true;
                         end
                     end
                 else
                     v1116 = true;
                 end
             else
                 v1116 = true;
             end
             if (v1116) then
                 local t_Value_193 = u106.Character.Team.Value;
                 if ((t_Value_193 == "Defending") and u105.BombPlanted.Value) then
                     local v1128 = u119.Bomb:GetChildren()[1];
                     local v1129 = v1128;
                     local v1130 = t_CFrame_171.p - Vector3.new(0, 3.75, 0);
                     if (v1128 and (not v1128.Defusing.Value)) then
                         local v1131 = RaycastParams.new();
                         v1131.FilterType = Enum.RaycastFilterType.Blacklist;
                         v1131.FilterDescendantsInstances = {
                             u136,
                             workspace.RaycastIgnore,
                             workspace.DroppedWeapons,
                             u119.Players,
                             u119.Map.Sites
                         };
                         v1131.CollisionGroup = "Bomb";
                         local v1132 = CFrame.new(t_CFrame_171.p, v1129.PrimaryPart.Position);
                         local t_magnitude_194 = (v1130 - v1129.PrimaryPart.Position).magnitude;
                         local v1133 = workspace:Raycast(v1132.p, v1132.lookVector * ((t_CFrame_171.p - v1129.PrimaryPart.Position).magnitude + 2), v1131);
                         if ((((t_magnitude_194 < 4) and v1133) and v1133.Instance:IsDescendantOf(v1129)) and ((not u140.Falling) and v1115)) then
                             v1111 = true;
                             v1112 = true;
                             t_BombPlant_130.PlantText.Text = "Hold " .. (u128:GetKey("PlantBomb") .. " To Defuse");
                         end
                     end
                 end
             end
         end
         local v1134 = false;
         t_BombPlant_130.PlantText.Visible = v1112;
         if (u137:IsKeyDown("PlantBomb") and u120.BombTick) then
             local v1135 = false;
             local v1136 = false;
             if (u120.WeaponData.Inventory[4][1]) then
                 local t_Value_195 = u106.Character.Team.Value;
                 if ((t_Value_195 == "Attacking") and u105.RoundStarted.Value) then
                     v1136 = true;
                 else
                     v1135 = true;
                 end
             else
                 v1135 = true;
             end
             if (v1135) then
                 local t_Value_250 = u106.Character.Team.Value;
                 if (t_Value_250 == "Defending") then
                     local t_Value_251 = u105.RoundType.Value;
                     if (t_Value_251 == "BombPlanted") then
                         v1136 = true;
                     else
                         v1134 = true;
                     end
                 else
                     v1134 = true;
                 end
             end
             if (v1136) then
                 t_BombPlant_130.PlantingBar.Visible = true;
                 u141:UpdatePlantingBar();
             end
         else
             v1134 = true;
         end
         if (v1134) then
             t_BombPlant_130.PlantingBar.Visible = false;
         end
         if (u141.AllyBombTick) then
             u141:UpdateAllyPlantingBar();
         end
         local v1137, v1138, v1139 = pairs(u119.Map.Sites:GetChildren());
         local v1140 = v1137;
         local v1141 = v1138;
         local v1142 = v1139;
         while true do
             local v1143, v1144 = v1140(v1141, v1142);
             local v1145 = v1143;
             local v1146 = v1144;
             if (v1143) then
                 break;
             end
             v1142 = v1145;
             if (v1146:FindFirstChild("Selection")) then
                 local t_Selection_196 = v1146.Selection;
                 local v1147 = u120.WeaponData.Inventory[4][1];
                 if (v1147) then
                     v1147 = false;
                     local t_Value_197 = u106.Character.Team.Value;
                     if (t_Value_197 == "Attacking") then
                         v1147 = u105.RoundStarted.Value;
                     end
                 end
                 t_Selection_196.Visible = v1147;
             end
         end
         local v1148 = false;
         if (u120.WeaponData.Inventory[4][1]) then
             local t_Value_198 = u106.SelectedTeam.Value;
             if ((t_Value_198 == "Attacking") and u105.RoundStarted.Value) then
                 if (u137:IsKeyDown("PlantBomb") and u120.WeaponData.Inventory[4][1]) then
                     local t_Weapon_199 = u120.CurrentWeaponData.Weapon;
                     if (t_Weapon_199 == "Bomb") then
                         if ((((not u120.BombTick) and v1110) and u158.CanFire) and ((not u140.Falling) and v1115)) then
                             u132:ConnectWeaponSound(u158:PlayAnimation("Plant"));
                             u120.BombTick = tick();
                             coroutine.wrap(function() -- [line 2909] anonymous function
                                 --[[
                                     Upvalues: 
                                         [1] = u111
                                         [2] = u158
                                         [3] = u120
                                 --]]
                                 if (not u111:InvokeServer("PlantingBomb")) then
                                     u158:StopAnimation("Plant");
                                     u111:FireServer("StopAnimation", "Plant");
                                     u120.BombTick = nil;
                                 end
                             end)();
                         else
                             if (u120.BombTick and ((tick() - u120.BombTick) > 4)) then
                                 local v1149 = false;
                                 u120.WeaponData.Inventory[4] = {};
                                 local v1150 = u111:InvokeServer("PlantBomb");
                                 u137.HeldKeys[u122.Keybinds.PlantBomb] = nil;
                                 local t_Inventory_246 = u120.WeaponData.Inventory;
                                 local v1153;
                                 if (v1150) then
                                     local v1151 = {};
                                     local v1152 = {};
                                     v1152.Weapon = "Bomb";
                                     v1151[1] = v1152;
                                     v1153 = v1151;
                                     if (not v1153) then
                                         v1149 = true;
                                     end
                                 else
                                     v1149 = true;
                                 end
                                 if (v1149) then
                                     v1153 = {};
                                 end
                                 t_Inventory_246[4] = v1153;
                                 u120.BombTick = nil;
                             end
                         end
                     else
                         local v1154 = u158;
                         local v1155 = {};
                         v1155.Slot = 4;
                         v1155.Index = 1;
                         v1154:Equip(v1155);
                     end
                 else
                     if ((not u137:IsKeyDown()) and u120.BombTick) then
                         u158:StopAnimation("Plant");
                         u111:FireServer("StopAnimation", "Plant");
                         u120.BombTick = nil;
                         u111:FireServer("BombPlantStop");
                     end
                 end
             else
                 v1148 = true;
             end
         else
             v1148 = true;
         end
         if (v1148) then
             local t_Value_247 = u106.SelectedTeam.Value;
             if (t_Value_247 == "Defending") then
                 local t_Value_248 = u105.RoundType.Value;
                 if (t_Value_248 == "BombPlanted") then
                     if (u137:IsKeyDown("PlantBomb")) then
                         local t_Weapon_249 = u120.CurrentWeaponData.Weapon;
                         if ((not (t_Weapon_249 == "Bomb")) and v1111) then
                             u158:Equip("Bomb");
                         else
                             if (u120.BombTick or v1111) then
                                 if ((not u120.BombTick) and v1111) then
                                     u120.BombTick = tick();
                                     coroutine.wrap(function() -- [line 2954] anonymous function
                                         --[[
                                             Upvalues: 
                                                 [1] = u111
                                                 [2] = u120
                                         --]]
                                         if (not u111:InvokeServer("DefusingBomb")) then
                                             u120.BombTick = nil;
                                         end
                                     end)();
                                 else
                                     if (u120.BombTick and ((tick() - u120.BombTick) > 7)) then
                                         u111:FireServer("DefuseBomb");
                                         u137.HeldKeys[u122.Keybinds.PlantBomb] = nil;
                                         u120.BombTick = nil;
                                         local v1156;
                                         if (u120.WeaponData.Inventory[1][1]) then
                                             v1156 = 1;
                                         else
                                             if (u120.WeaponData.Inventory[2][1]) then
                                                 v1156 = 2;
                                             else
                                                 v1156 = u120.WeaponData.Inventory[3][1];
                                                 if (v1156) then
                                                     v1156 = 3;
                                                 end
                                             end
                                         end
                                         local v1157 = u158;
                                         local v1158 = {};
                                         v1158.Slot = v1156;
                                         v1158.Index = 1;
                                         v1157:Equip(v1158);
                                     end
                                 end
                             else
                                 u137.HeldKeys[u122.Keybinds.PlantBomb] = nil;
                                 u120.BombTick = nil;
                                 local v1159;
                                 if (u120.WeaponData.Inventory[1][1]) then
                                     v1159 = 1;
                                 else
                                     if (u120.WeaponData.Inventory[2][1]) then
                                         v1159 = 2;
                                     else
                                         v1159 = u120.WeaponData.Inventory[3][1];
                                         if (v1159) then
                                             v1159 = 3;
                                         end
                                     end
                                 end
                                 local v1160 = u158;
                                 local v1161 = {};
                                 v1161.Slot = v1159;
                                 v1161.Index = 1;
                                 v1160:Equip(v1161);
                             end
                         end
                     else
                         if ((not u137:IsKeyDown()) and u120.BombTick) then
                             u120.BombTick = nil;
                             u111:FireServer("DefuseBombStop");
                             local v1162;
                             if (u120.WeaponData.Inventory[1][1]) then
                                 v1162 = 1;
                             else
                                 if (u120.WeaponData.Inventory[2][1]) then
                                     v1162 = 2;
                                 else
                                     v1162 = u120.WeaponData.Inventory[3][1];
                                     if (v1162) then
                                         v1162 = 3;
                                     end
                                 end
                             end
                             local v1163 = u158;
                             local v1164 = {};
                             v1164.Slot = v1162;
                             v1164.Index = 1;
                             v1163:Equip(v1164);
                         end
                     end
                 end
             end
         end
         if (u120.CurrentWeaponData) then
             local t_Skin_200 = u120.CurrentWeaponData.Skin;
             if (t_Skin_200 == "Dev Sword") then
                 local v1165 = u120.CurrentWeapon.Object.Ring.Ring;
                 v1165.C0 = v1165.C0 * CFrame.Angles(0, p52 * 2, 0);
                 local v1166 = u120.CurrentWeapon.MainGunParts.Ring.Ring;
                 v1166.C0 = v1166.C0 * CFrame.Angles(0, p52 * 2, 0);
             end
         end
         local v1167 = not t_LargeMapFrame_126.Visible;
         if (v1167) then
             v1167 = not t_Shop_125.Visible;
             if (v1167) then
                 v1167 = not u118.CommsFrame.Visible;
                 if (v1167) then
                     v1167 = not u122.OptionsUI.Enabled;
                     if (v1167) then
                         v1167 = not u125.Enabled;
                         if (v1167) then
                             v1167 = not u118.CustomMatch.Visible;
                             if (v1167) then
                                 v1167 = not u118.DMLeaderboard.Visible;
                                 if (v1167) then
                                     v1167 = not u118.Leaderboard.Visible;
                                     if (v1167) then
                                         v1167 = not u118.BadgeFrame.Visible;
                                         if (v1167) then
                                             v1167 = not u118.ReportFrame.Visible;
                                             if (v1167) then
                                                 v1167 = not u118.ConfirmReportFrame.Visible;
                                                 if (v1167) then
                                                     v1167 = not u3.Messages.Visible;
                                                 end
                                             end
                                         end
                                     end
                                 end
                             end
                         end
                     end
                 end
             end
         end
         local v1168 = false;
         if (u120.AbilityInUse and (t_Value_145 == "Zolt")) then
             v1168 = true;
         end
         local v1169 = false;
         local v1170 = false;
         if (u120.AbilityShootCooldown) then
             local v1171 = tick() - u120.AbilityShootCooldown;
             if (v1171 < 0) then
                 v1170 = true;
             else
                 v1169 = true;
             end
         else
             v1169 = true;
         end
         if (v1169) then
             if ((t_Value_145 == "Zyla") and u120.AbilityInUse) then
                 v1170 = true;
             else
                 if (u120.AbilityShootCooldown) then
                     u120.AbilityShootCooldown = nil;
                 end
             end
         end
         if (v1170) then
             v1168 = true;
         end
         local v1172 = false;
         local t_Value_201 = u105.GameMode.Value;
         if ((t_Value_201 == "Deathmatch") and u105.RoundStarted.Value) then
             v1172 = true;
         else
             local t_Value_245 = u105.GameMode.Value;
             if (t_Value_245 ~= "Deathmatch") then
                 v1172 = true;
             end
         end
         if (v1172) then
             if (v1167 and (not v1168)) then
                 local t_Class_202 = v1098.Class;
                 if (not ((t_Class_202 == "Ability") or (u120.CurrentWeaponData.DoesntExist or v1168))) then
                     if (u120.CurrentWeaponData.Bullets) then
                         local t_Bullets_203 = u120.CurrentWeaponData.Bullets;
                         if ((t_Bullets_203 < 0) and u122.Settings["Auto Reload"]) then
                             u158:Reload();
                         end
                     end
                     local t_Class_204 = v1098.Class;
                     local v1173;
                     if (t_Class_204 == "Sniper") then
                         v1173 = 1;
                     else
                         v1173 = 1.33;
                     end
                     local v1174;
                     if ((t_Value_145 == "Edira") and u120.AbilityInUse) then
                         v1174 = 0.833;
                     else
                         v1174 = 1;
                     end
                     local v1175 = false;
                     local t_Class_205 = v1098.Class;
                     if (t_Class_205 == "Melee") then
                         v1175 = true;
                     else
                         local t_Class_206 = v1098.Class;
                         if (((not ((t_Class_206 == "Bomb") or v1098.Grenade)) and (u137:IsKeyDown("Fire") and ((tick() - u158.LastClickTick) > 0.5))) and (not u120.ClickShotFired)) then
                             local t_Bullets_207 = u120.CurrentWeaponData.Bullets;
                             if (((t_Bullets_207 < 0) and u158.CanFire) and (not (u120.Reloading or u120.BombTick))) then
                                 local v1176 = false;
                                 local t_FireType_208 = v1098.FireType;
                                 if (t_FireType_208 == "Automatic") then
                                     v1176 = true;
                                 else
                                     local t_FireType_209 = v1098.FireType;
                                     if (t_FireType_209 == "Burst") then
                                         v1176 = true;
                                     else
                                         local t_FireType_210 = v1098.FireType;
                                         if ((t_FireType_210 == "Single") and (not u120.SingleFireShot)) then
                                             v1176 = true;
                                         else
                                             v1175 = true;
                                         end
                                     end
                                 end
                                 if (v1176) then
                                     u120.ClickShotFired = true;
                                     u158.LastClickTick = tick();
                                     u132:PlaySound("GunClick");
                                 end
                             else
                                 v1175 = true;
                             end
                         else
                             v1175 = true;
                         end
                     end
                     if (v1175) then
                         local t_Class_221 = v1098.Class;
                         if (t_Class_221 ~= "Melee") then
                             local t_Class_222 = v1098.Class;
                             if (not ((t_Class_222 == "Bomb") or v1098.Grenade)) then
                                 local v1177 = false;
                                 local v1178 = tick() - u158.LastFireTick;
                                 local v1179 = v1098.FireRate * v1174;
                                 local v1180;
                                 if (u120.Aiming) then
                                     v1180 = v1173;
                                     if (not v1180) then
                                         v1177 = true;
                                     end
                                 else
                                     v1177 = true;
                                 end
                                 if (v1177) then
                                     v1180 = 1;
                                 end
                                 local v1181 = v1179 * v1180;
                                 if (((v1181 < v1178) and (u120.CurrentWeaponData.Bullets >= 0)) and ((u158.CanFire and (not u120.Reloading)) and (not u120.BombTick))) then
                                     local v1182 = false;
                                     local t_FireType_223 = v1098.FireType;
                                     if (t_FireType_223 == "Automatic") then
                                         v1182 = true;
                                     else
                                         local t_FireType_224 = v1098.FireType;
                                         if (t_FireType_224 == "Burst") then
                                             v1182 = true;
                                         else
                                             local t_FireType_225 = v1098.FireType;
                                             if ((t_FireType_225 == "Single") and (not u120.SingleFireShot)) then
                                                 v1182 = true;
                                             end
                                         end
                                     end
                                     if (v1182) then
                                         if (u158.ScopeCooldown) then
                                             u158.ScopeCooldown = false;
                                             u158.ToggleAim = false;
                                         end
                                     end
                                 end
                             end
                         end
                     end
                     local v1183 = false;
                     local t_Class_211 = v1098.Class;
                     if (t_Class_211 == "Melee") then
                         v1183 = true;
                     else
                         local t_Class_212 = v1098.Class;
                         if ((not ((t_Class_212 == "Bomb") or v1098.Grenade)) and (u137:IsKeyDown("Fire") or (v1098.ShellReload and u158.FireNextShell))) then
                             local v1184 = false;
                             local v1185 = tick() - u158.LastFireTick;
                             local v1186 = v1098.FireRate * v1174;
                             local v1187;
                             if (u120.Aiming) then
                                 v1187 = v1173;
                                 if (not v1187) then
                                     v1184 = true;
                                 end
                             else
                                 v1184 = true;
                             end
                             if (v1184) then
                                 v1187 = 1;
                             end
                             local v1188 = v1186 * v1187;
                             if (((v1188 < v1185) and (u120.CurrentWeaponData.Bullets >= 0)) and ((u158.CanFire and (not u120.Reloading)) and (not u120.BombTick))) then
                                 local v1189 = false;
                                 local t_FireType_213 = v1098.FireType;
                                 if (t_FireType_213 == "Automatic") then
                                     v1189 = true;
                                 else
                                     local t_FireType_214 = v1098.FireType;
                                     if (t_FireType_214 == "Burst") then
                                         v1189 = true;
                                     else
                                         local t_FireType_215 = v1098.FireType;
                                         if ((t_FireType_215 == "Single") and (not u120.SingleFireShot)) then
                                             v1189 = true;
                                         else
                                             v1183 = true;
                                         end
                                     end
                                 end
                                 if (v1189) then
                                     u158.LastFireTick = tick();
                                     u158.MuzzleActivated = true;
                                     u158.FireNextShell = false;
                                     u120.SingleFireShot = true;
                                     u142:SetFiring(true);
                                     u158:Shoot();
                                 end
                             else
                                 v1183 = true;
                             end
                         else
                             v1183 = true;
                         end
                     end
                     if (v1183) then
                         local t_Class_216 = v1098.Class;
                         if (((t_Class_216 == "Melee") and (u137:IsKeyDown("Fire") or u137:IsKeyDown("Aim"))) and (u158.CanFire and (not u158.MeleeCooldown))) then
                             u158.MeleeCooldown = true;
                             local v1190 = u158;
                             local v1191;
                             if (u137:IsKeyDown("Fire")) then
                                 v1191 = "Light";
                             else
                                 v1191 = "Heavy";
                             end
                             v1190:MeleeAttack(v1191);
                         else
                             local v1192 = false;
                             if ((u105.RoundStarted.Value or u110:IsStudio()) and v1098.Grenade) then
                                 local v1193 = false;
                                 if (u137:IsKeyDown("Fire")) then
                                     v1193 = true;
                                 else
                                     if (u137:IsKeyDown("Aim")) then
                                         local t_Weapon_220 = u120.CurrentWeaponData.Weapon;
                                         if (t_Weapon_220 == "Molotov") then
                                             v1192 = true;
                                         else
                                             v1193 = true;
                                         end
                                     else
                                         v1192 = true;
                                     end
                                 end
                                 if (v1193) then
                                     if (u158.CanFire and (not u158.GrenadeCooldown)) then
                                         u158.GrenadeCooldown = true;
                                         local v1194 = u158;
                                         local v1195;
                                         if (u137:IsKeyDown("Fire")) then
                                             v1195 = "Far";
                                         else
                                             v1195 = "Short";
                                         end
                                         v1194:ThrowGrenade(v1195);
                                     else
                                         v1192 = true;
                                     end
                                 end
                             else
                                 v1192 = true;
                             end
                             if (v1192) then
                                 local t_Class_217 = v1098.Class;
                                 if (t_Class_217 ~= "Melee") then
                                     local t_Class_218 = v1098.Class;
                                     if (not ((t_Class_218 == "Bomb") or v1098.Grenade)) then
                                         local t_Bullets_219 = u120.CurrentWeaponData.Bullets;
                                         if ((not ((not (t_Bullets_219 <= 0)) and u137:IsKeyDown("Fire"))) and u158.CanFire) then
                                             u142:SetFiring(false);
                                         end
                                     end
                                 end
                             end
                         end
                     end
                 end
             end
         end
         if (((tick() - u158.LastFireTick) > 0.15) and u158.MuzzleActivated) then
             u158.MuzzleActivated = false;
         end
         local v1196 = false;
         local v1197 = 0;
         local v1198 = 0;
         local v1199 = 0;
         local v1200 = 0;
         local v1201 = 0;
         local v1202 = 0;
         local v1203 = math.cos(tick() * 1.5) / 50;
         local v1204 = math.sin((2 * tick()) * 1.5) / 50;
         if (u120.Aiming) then
             local t_Class_226 = v1098.Class;
             if (t_Class_226 == "Sniper") then
                 v1203 = v1203 / 28;
                 v1204 = v1204 / 28;
             else
                 v1196 = true;
             end
         else
             v1196 = true;
         end
         if (v1196) then
             if (u120.Aiming) then
                 v1203 = v1203 / 8;
                 v1204 = v1204 / 8;
             end
         end
         u158.SwayIdle.Target = Vector3.new(v1203, v1204);
         if ((u158:IsMoving() and (t_HumanoidRootPart_170.Velocity.magnitude >= 0.1)) and (not u120.BombTick)) then
             if (not u158.LastMovementTick) then
                 u158.LastMovementTick = tick();
             end
             local v1205 = false;
             local v1206 = tick() - u158.LastMovementTick;
             local v1207;
             if (u158:InAir()) then
                 v1205 = true;
             else
                 v1207 = u140.PlaneMagnitude;
                 if (not v1207) then
                     v1205 = true;
                 end
             end
             if (v1205) then
                 v1207 = 0;
             end
             local v1208 = v1207 * 0.5;
             local v1209 = u120.AbilityInUse;
             if (v1209) then
                 v1209 = t_Value_145 == "Zolt";
             end
             local v1210;
             if (v1209) then
                 v1210 = 3;
             else
                 v1210 = 1;
             end
             if (v1209) then
                 v1208 = v1208 * 1.2;
             end
             local t_Class_227 = v1098.Class;
             local v1211;
             if ((t_Class_227 == "Sniper") and u120.Aiming) then
                 v1211 = 1;
             else
                 if (u120.Aiming) then
                     v1211 = 3;
                 else
                     v1211 = 1;
                 end
             end
             local v1212 = v1207 * v1211;
             local v1213 = v1212;
             v1197 = (math.cos((v1206 * v1208) * 0.75) / 300) * v1212;
             v1198 = ((math.sin(((2 * v1206) * v1208) * 0.75) / 300) * v1212) * v1210;
             if (v1209) then
                 v1199 = (math.cos((v1206 * v1208) * 0.75) / 100) * v1213;
             end
             local v1214;
             if (u137:IsKeyDown("MoveLeft")) then
                 v1214 = 1;
             else
                 v1214 = 0;
             end
             local v1215 = v1200 + v1214;
             local v1216;
             if (u137:IsKeyDown("MoveRight")) then
                 v1216 = -1;
             else
                 v1216 = 0;
             end
             local v1217 = v1215 + v1216;
             local v1218;
             if (u137:IsKeyDown("MoveForward")) then
                 v1218 = 1;
             else
                 v1218 = 0;
             end
             local v1219 = v1201 + v1218;
             local v1220;
             if (u137:IsKeyDown("MoveBack")) then
                 v1220 = -1;
             else
                 v1220 = 0;
             end
             local v1221 = v1219 + v1220;
             local v1222 = u120.AbilityInUse;
             if (v1222) then
                 v1222 = t_Value_145 == "Zolt";
             end
             if (u137:IsKeyDown("Crouch") and (not v1222)) then
                 v1202 = 0.65;
             else
                 if (u137:IsKeyDown("Walk") and (not v1222)) then
                     v1202 = 0.85;
                 else
                     v1202 = 1;
                 end
             end
             local v1223 = false;
             v1200 = v1217 / 18;
             if (u137:IsKeyDown("MoveForward")) then
                 local v1224 = u137:IsKeyDown("MoveForward");
                 local t_LastYMovement_228 = u158.LastYMovement;
                 if (t_LastYMovement_228 <= v1224) then
                     u158.LastYMovement = u137:IsKeyDown("MoveForward");
                 else
                     v1223 = true;
                 end
             else
                 v1223 = true;
             end
             if (v1223) then
                 if (u137:IsKeyDown("MoveBack")) then
                     local v1225 = u137:IsKeyDown("MoveBack");
                     local t_LastYMovement_244 = u158.LastYMovement;
                     if (t_LastYMovement_244 <= v1225) then
                         u158.LastYMovement = u137:IsKeyDown("MoveBack");
                     end
                 end
             end
             if (not (u137:IsKeyDown("MoveForward") or u137:IsKeyDown("MoveBack"))) then
                 u158.LastYMovement = tick();
             end
             v1201 = (v1221 * (1 - ((1000000000000) ^ (-(tick() - u158.LastYMovement))))) * 0.1;
             if (u137:IsKeyDown("MoveBack")) then
                 local v1226 = false;
                 local v1227 = false;
                 if (u137:IsKeyDown("MoveForward")) then
                     local v1228 = u137:IsKeyDown("MoveBack");
                     local v1229 = u137:IsKeyDown("MoveForward");
                     if (v1229 < v1228) then
                         v1227 = true;
                     else
                         v1226 = true;
                     end
                 else
                     v1226 = true;
                 end
                 if (v1226) then
                     if (not u137:IsKeyDown("MoveForward")) then
                         v1227 = true;
                     end
                 end
                 if (v1227) then
                     v1201 = v1201 * 0.5;
                 end
             end
             if (u120.Aiming) then
                 v1201 = v1201 * 0.25;
             end
         else
             u158.LastMovementTick = nil;
         end
         local t_Class_229 = v1098.Class;
         if ((not (t_Class_229 == "Melee")) and v1098.Grenade) then
         end
         local v1230 = false;
         local v1231 = 0;
         local v1232 = CFrame.new();
         local v1233 = CFrame.new(u120.CurrentWeapon.Offset.Value);
         local v1234;
         if (u120.CurrentWeapon:FindFirstChild("AimOffset")) then
             v1234 = CFrame.new(u120.CurrentWeapon.AimOffset.Value);
             if (not v1234) then
                 v1230 = true;
             end
         else
             v1230 = true;
         end
         if (v1230) then
             v1234 = CFrame.new();
         end
         local v1235 = false;
         local t_Class_230 = v1098.Class;
         if (t_Class_230 == "Sniper") then
             local v1236 = false;
             local v1237 = u122.Settings["Scope Aim Type"];
             if (v1237 == "Hold") then
                 v1235 = u137:IsKeyDown("Aim");
                 if (not v1235) then
                     v1236 = true;
                 end
             else
                 v1236 = true;
             end
             if (v1236) then
                 v1235 = false;
                 local v1238 = u122.Settings["Scope Aim Type"];
                 if (v1238 == "Toggle") then
                     v1235 = u158.ToggleAim;
                 end
             end
         end
         local v1239 = false;
         if (v1168) then
             v1239 = true;
         else
             local t_Class_231 = v1098.Class;
             if (t_Class_231 == "Melee") then
                 v1239 = true;
             else
                 local t_Class_232 = v1098.Class;
                 if (t_Class_232 == "Bomb") then
                     v1239 = true;
                 else
                     local t_Class_233 = v1098.Class;
                     if (((not ((t_Class_233 == "Ability") or (u158.MuzzleActivated and (not u120.Aiming)))) and ((not (u158.ScopeCooldown or v1098.Grenade)) and u158.CanFire)) and (((u120.Aiming and u158.MuzzleActivated) or v1235) and (not u120.Reloading))) then
                         local v1240 = false;
                         local t_Value_234 = u105.GameMode.Value;
                         if ((t_Value_234 == "Deathmatch") and u105.RoundStarted.Value) then
                             v1240 = true;
                         else
                             local t_Value_242 = u105.GameMode.Value;
                             if (t_Value_242 == "Deathmatch") then
                                 v1239 = true;
                             else
                                 v1240 = true;
                             end
                         end
                         if (v1240) then
                             if (v1167) then
                                 local t_BlockAiming_235 = u158.BlockAiming;
                                 if (t_BlockAiming_235 == false) then
                                     if (not u120.Aiming) then
                                         u111:FireServer("AnimationUpdate", "AimIdle");
                                     end
                                     u158:StopAnimation("Inspect");
                                     v1231 = 1;
                                     u120.Aiming = true;
                                     local v1241 = u158.AimOffset;
                                     local v1242 = CFrame.new(u120.CurrentWeapon.AimOffset.Value);
                                     local v1243 = (v1241.p - CFrame.new():Lerp(v1241, u158.CurrentAimLerp.position).p).magnitude;
                                     local t_magnitude_236 = v1243;
                                     if (v1243 >= 0.06) then
                                         u158.SpringWalk._speed = 30;
                                     else
                                         u158.SpringWalk._speed = 8;
                                     end
                                     local t_Class_237 = v1098.Class;
                                     if (t_Class_237 == "Sniper") then
                                         u156 = t_magnitude_236;
                                         if (t_magnitude_236 < 1) then
                                             u120.CurrentWeapon.Object.Scope2.Transparency = (-1.25 * t_magnitude_236) + 1.25;
                                         end
                                         if (t_magnitude_236 < 0.03) then
                                             u120.Scoped = true;
                                         else
                                             u120.Scoped = false;
                                         end
                                         local v1244 = u143.CurrentRecoilSpread + u143.CurrentMovementSpread;
                                         u120.CurrentWeapon.Object.ScopeDot.SurfaceGui.Enabled = v1244 < 0.2;
                                         u157 = v1244 < 0.2;
                                     end
                                 else
                                     v1239 = true;
                                 end
                             else
                                 v1239 = true;
                             end
                         end
                     else
                         v1239 = true;
                     end
                 end
             end
         end
         if (v1239) then
             if (u120.Aiming) then
                 u111:FireServer("StopAnimation", "AimIdle");
             end
             local t_Class_243 = v1098.Class;
             if (t_Class_243 == "Sniper") then
                 u120.CurrentWeapon.Object.Scope2.Transparency = 0;
                 u156 = 1;
             end
             u120.Aiming = false;
             u120.Scoped = false;
             u158.SpringWalk._speed = 8;
         end
         local v1245 = u143;
         local v1246 = not t_Shop_125.Visible;
         if (v1246) then
             v1246 = not u120.Aiming;
             if (v1246) then
                 v1246 = not t_LargeMapFrame_126.Visible;
                 if (v1246) then
                     v1246 = not u118.CommsFrame.Visible;
                 end
             end
         end
         v1245:SetCrosshair(v1246);
         local v1247 = u140.PercentSpeed;
         if (not v1247) then
             v1247 = 0;
         end
         local v1248 = false;
         local v1249 = u143;
         local v1250 = v1247 * v1202;
         local t_Class_238 = v1098.Class;
         local v1251;
         if ((not (t_Class_238 == "Melee")) and v1098.MovementSpreadPenalty) then
             v1251 = v1098.MovementSpreadPenalty * 2;
             if (not v1251) then
                 v1248 = true;
             end
         else
             v1248 = true;
         end
         if (v1248) then
             v1251 = 1;
         end
         local v1252 = v1250 * v1251;
         local v1253;
         if (u158:InAir()) then
             v1253 = 10;
         else
             v1253 = 0;
         end
         v1249:UpdateCrosshair(nil, v1252 + v1253);
         debug.profilebegin("Spring Change");
         local v1254 = u121:GetMouseDelta();
         debug.profileend();
         debug.profilebegin("Spring Update");
         u158.SpringMouse:Impulse(Vector3.new(v1254.X * 0.7, v1254.Y * 1.2, v1254.X * 0.7));
         local v1255;
         if (u120.Aiming) then
             v1255 = 0.1;
         else
             v1255 = 1;
         end
         local v1256 = false;
         u158.SpringWalk.Target = Vector3.new((v1197 * v1255) * 2, (v1198 * v1255) * 2, v1199 * 2);
         u158.SpringWalkRotation.Target = Vector3.new(v1200, v1201);
         u158.SpringRecoil.Target = Vector3.new(u144.TotalSpreadX, u144.TotalSpreadY);
         u158.CurrentAimLerp.Target = v1231;
         local t_CurrentAimLerp_239 = u158.CurrentAimLerp;
         local v1257;
         if (v1098.ADSSpeed) then
             v1257 = v1098.ADSSpeed * 20;
             if (not v1257) then
                 v1256 = true;
             end
         else
             v1256 = true;
         end
         if (v1256) then
             v1257 = 20;
         end
         local v1258 = false;
         t_CurrentAimLerp_239._speed = v1257;
         debug.profileend();
         debug.profilebegin("Viewmodel update");
         local v1259 = CFrame.Angles(u158.SpringMouse.position.Y, u158.SpringMouse.position.X, u158.SpringMouse.position.Z);
         local v1260 = CFrame.Angles(u158.SpringRecoil.position.Y / 80, (-u158.SpringRecoil.position.X) / 80, 0);
         local t_ClassName_240 = u120.CurrentWeapon.Root.ClassName;
         local v1261;
         if (t_ClassName_240 == "ObjectValue") then
             v1261 = u120.CurrentWeapon.Root.Value;
             if (not v1261) then
                 v1258 = true;
             end
         else
             v1258 = true;
         end
         if (v1258) then
             v1261 = u120.CurrentWeapon.Root;
         end
         local v1262 = false;
         local t_ClassName_241 = u120.CurrentWeapon.Camera.ClassName;
         local v1263;
         if (t_ClassName_241 == "ObjectValue") then
             v1263 = u120.CurrentWeapon.Camera.Value;
             if (not v1263) then
                 v1262 = true;
             end
         else
             v1262 = true;
         end
         if (v1262) then
             v1263 = u120.CurrentWeapon.Camera;
         end
         local v1264, v1265, v1266 = v1261.CFrame:ToOrientation();
         local v1267, v1268, v1269 = v1263.CFrame:ToOrientation();
         local v1270 = u120.CurrentWeaponStats.CameraShakeMultiplier[u158.CurrentAnimationName] or 1;
         local v1271 = CFrame.Angles((v1267 - v1264) * v1270, (v1268 - v1265) * v1270, (v1269 - v1266) * v1270);
         local v1272 = ((((((((((u136.CFrame * CFrame.new(u158.ZoltSwayPosition.Position.Y + u158.SpringWalk.position.Z, 0, -u158.ZoltSwayPosition.Position.Z)) * CFrame.new(u120.CurrentWeapon.Offset.Value):Lerp(v1234, u158.CurrentAimLerp.position)) * v1259) * CFrame.Angles(0, 0, u158.SpringWalkRotation.position.X)) * CFrame.new(0, 0, u158.SpringWalkRotation.position.Y)) * CFrame.new(Vector3.new(u158.SpringWalk.position.X + u158.SwayIdle.position.X, u158.SpringWalk.position.Y + u158.SwayIdle.position.Y))) * v1260) * CFrame.Angles(u158.SpringJumpY.Position, 0, 0)) * CFrame.new():Lerp(u158.AimOffset, u158.CurrentAimLerp.position)) * CFrame.Angles(u158.ZoltSway.Position.Y, -u158.ZoltSway.Position.X, -u158.ZoltSway.Position.Z)) + Vector3.new(0, u158.ZoltSwayPosition.Position.X, 0);
         debug.profileend();
         debug.profilebegin("Apply viewmodel");
         if (u158.AnimationLoaded) then
             local v1273 = u120.CurrentWeaponStats.RotationOffset;
             if (not v1273) then
                 v1273 = Vector3.new(0, 0, 0);
             end
             local v1274 = Vector3.new(v1273.X * (1 - u158.CurrentAimLerp.position), v1273.Y * (1 - u158.CurrentAimLerp.position), v1273.Z * (1 - u158.CurrentAimLerp.position));
             u155 = u158.LastCameraOffset:inverse() * v1271;
             u120.CurrentWeapon.PrimaryPart.CFrame = v1272 * CFrame.Angles(math.rad(v1274.X), math.rad(v1274.Y), math.rad(v1274.Z));
             local v1275 = u136;
             v1275.CFrame = v1275.CFrame * (u155 * CFrame.Angles(math.rad((-u158.LastCameraJumpOffset) + u158.SpringCameraJump.Position), 0, 0));
             if (u120.CurrentWeapon:FindFirstChild("ArmLeft")) then
                 local v1276 = false;
                 local v1277;
                 if (u120.CurrentWeapon:FindFirstChild("RightArmOffset")) then
                     v1277 = u120.CurrentWeapon.RightArmOffset.Value;
                     if (not v1277) then
                         v1276 = true;
                     end
                 else
                     v1276 = true;
                 end
                 if (v1276) then
                     v1277 = Vector3.new();
                 end
                 local v1278 = false;
                 local v1279;
                 if (u120.CurrentWeapon:FindFirstChild("LeftArmOffset")) then
                     v1279 = u120.CurrentWeapon.LeftArmOffset.Value;
                     if (not v1279) then
                         v1278 = true;
                     end
                 else
                     v1278 = true;
                 end
                 if (v1278) then
                     v1279 = Vector3.new();
                 end
                 u120.CurrentWeapon.ArmLeft.CharacterClothing.CFrame = u120.CurrentWeapon.RootPart.Base.LeftArm.TransformedWorldCFrame * CFrame.new(v1279.X, v1279.Y, v1279.Z + 1.3);
                 u120.CurrentWeapon.ArmRight.CharacterClothing.CFrame = u120.CurrentWeapon.RootPart.Base.RightArm.TransformedWorldCFrame * CFrame.new(v1277.X, v1277.Y, v1277.Z + 1.3);
             end
         end
         debug.profileend();
         u158.LastCameraOffset = v1271;
         u158.LastCameraJumpOffset = u158.SpringCameraJump.Position;
     end);
     local v1280 = coroutine.wrap;
     local u160 = p50;
     v1280(function() -- [line 3289] anonymous function
         --[[
             Upvalues: 
                 [1] = u134
                 [2] = u136
                 [3] = u120
                 [4] = u106
                 [5] = t_BombPlant_130
                 [6] = u111
                 [7] = t_Crosshair_128
                 [8] = u143
                 [9] = u160
                 [10] = u140
                 [11] = u156
                 [12] = u157
                 [13] = u130
                 [14] = u145
         --]]
         while (wait(0.03333333333333333)) do
             local v1337, v1338 = pcall(function() -- [line 3291] anonymous function
                 --[[
                     Upvalues: 
                         [1] = u134
                         [2] = u136
                         [3] = u120
                         [4] = u106
                         [5] = t_BombPlant_130
                         [6] = u111
                         [7] = t_Crosshair_128
                         [8] = u143
                         [9] = u160
                         [10] = u140
                         [11] = u156
                         [12] = u157
                         [13] = u130
                         [14] = u145
                 --]]
                 local v1281 = CFrame.new(0, 0, 0);
                 if (u134:IsAlive()) then
                     v1281 = u136.CFrame - u136.CFrame.p;
                 end
                 local v1282 = u134:IsAlive();
                 if (v1282) then
                     v1282 = u120.CurrentWeaponData;
                 end
                 local v1283 = nil;
                 local v1284 = nil;
                 local t_Value_258 = u106.CharacterName.Value;
                 if (t_Value_258 == "Zolt") then
                     local v1285 = false;
                     local v1286;
                     if (v1282 and u120.AbilityInUse) then
                         v1286 = 1 - ((tick() - u120.AbilityInUse) / 7);
                         if (not v1286) then
                             v1285 = true;
                         end
                     else
                         v1285 = true;
                     end
                     if (v1285) then
                         v1286 = nil;
                     end
                     v1283 = v1286;
                 end
                 if ((v1282 and t_BombPlant_130.PlantingBar.Visible) and u120.BombTick) then
                     local v1287 = tick() - u120.BombTick;
                     local t_Value_259 = u106.SelectedTeam.Value;
                     local v1288;
                     if (t_Value_259 == "Defending") then
                         v1288 = 7;
                     else
                         v1288 = 4;
                     end
                     v1284 = math.clamp(v1287 / v1288, 0, 1);
                 end
                 local v1289 = false;
                 local v1290 = u111;
                 local v1291 = {};
                 local v1292;
                 if (v1282) then
                     v1292 = v1281;
                     if (not v1292) then
                         v1289 = true;
                     end
                 else
                     v1289 = true;
                 end
                 if (v1289) then
                     v1292 = nil;
                 end
                 local v1293 = false;
                 v1291.CameraOffset = v1292;
                 local v1294;
                 if ((v1282 and u120.CurrentWeapon) and u120.CurrentWeapon.Parent) then
                     v1294 = u136.CFrame:ToObjectSpace(u120.CurrentWeapon.PrimaryPart.CFrame);
                     if (not v1294) then
                         v1293 = true;
                     end
                 else
                     v1293 = true;
                 end
                 if (v1293) then
                     v1294 = nil;
                 end
                 local v1295 = false;
                 v1291.ViewModelCFrame = v1294;
                 local v1296;
                 if (v1282) then
                     v1296 = t_Crosshair_128.Crosshair.Visible;
                     if (not v1296) then
                         v1295 = true;
                     end
                 else
                     v1295 = true;
                 end
                 if (v1295) then
                     v1296 = nil;
                 end
                 local v1297 = false;
                 v1291.CrosshairVisible = v1296;
                 local v1298;
                 if (v1282) then
                     v1298 = u143.SpreadOffset;
                     if (not v1298) then
                         v1297 = true;
                     end
                 else
                     v1297 = true;
                 end
                 if (v1297) then
                     v1298 = nil;
                 end
                 local v1299 = false;
                 v1291.SpreadOffset = v1298;
                 local v1300;
                 if (v1282) then
                     v1300 = u160.MuzzleActivated;
                     if (not v1300) then
                         v1299 = true;
                     end
                 else
                     v1299 = true;
                 end
                 if (v1299) then
                     v1300 = nil;
                 end
                 local v1301 = false;
                 v1291.Shooting = v1300;
                 local v1302;
                 if (v1282) then
                     v1302 = u106.Character.Humanoid.Health;
                     if (not v1302) then
                         v1301 = true;
                     end
                 else
                     v1301 = true;
                 end
                 if (v1301) then
                     v1302 = nil;
                 end
                 local v1303 = false;
                 v1291.Health = v1302;
                 local v1304;
                 if (v1282) then
                     v1304 = u106.Character.Armor.Value;
                     if (not v1304) then
                         v1303 = true;
                     end
                 else
                     v1303 = true;
                 end
                 if (v1303) then
                     v1304 = nil;
                 end
                 local v1305 = false;
                 v1291.Shield = v1304;
                 local v1306;
                 if (v1282 and t_BombPlant_130.PlantText.Visible) then
                     v1306 = t_BombPlant_130.PlantText.Text;
                     if (not v1306) then
                         v1305 = true;
                     end
                 else
                     v1305 = true;
                 end
                 if (v1305) then
                     v1306 = nil;
                 end
                 local v1307 = false;
                 v1291.BombText = v1306;
                 v1291.PlantingPercent = v1284 or nil;
                 local v1308;
                 if (v1282) then
                     v1308 = u120.CurrentWeaponData.Bullets;
                     if (not v1308) then
                         v1307 = true;
                     end
                 else
                     v1307 = true;
                 end
                 if (v1307) then
                     v1308 = nil;
                 end
                 local v1309 = false;
                 v1291.Bullets = v1308;
                 local v1310;
                 if (v1282) then
                     v1310 = u120.CurrentWeaponData.ReserveAmmo;
                     if (not v1310) then
                         v1309 = true;
                     end
                 else
                     v1309 = true;
                 end
                 if (v1309) then
                     v1310 = nil;
                 end
                 local v1311 = false;
                 v1291.ReserveAmmo = v1310;
                 local v1312;
                 if (v1282) then
                     v1312 = u136.FieldOfView;
                     if (not v1312) then
                         v1311 = true;
                     end
                 else
                     v1311 = true;
                 end
                 if (v1311) then
                     v1312 = nil;
                 end
                 local v1313 = false;
                 v1291.FOV = v1312;
                 local v1314;
                 if (v1282) then
                     v1314 = u140.CameraLerp.position;
                     if (not v1314) then
                         v1313 = true;
                     end
                 else
                     v1313 = true;
                 end
                 if (v1313) then
                     v1314 = nil;
                 end
                 local v1315 = false;
                 v1291.CrouchAmount = v1314;
                 local v1316;
                 if (v1282) then
                     v1316 = u156;
                     if (not v1316) then
                         v1315 = true;
                     end
                 else
                     v1315 = true;
                 end
                 if (v1315) then
                     v1316 = nil;
                 end
                 local v1317 = false;
                 v1291.AimDifference = v1316;
                 local v1318;
                 if (v1282) then
                     v1318 = u157;
                     if (not v1318) then
                         v1317 = true;
                     end
                 else
                     v1317 = true;
                 end
                 if (v1317) then
                     v1318 = nil;
                 end
                 local v1319 = false;
                 v1291.RedDotVisible = v1318;
                 local v1320;
                 if (v1282) then
                     v1320 = u120.WeaponData.Ability.Uses;
                     if (not v1320) then
                         v1319 = true;
                     end
                 else
                     v1319 = true;
                 end
                 if (v1319) then
                     v1320 = nil;
                 end
                 local v1321 = false;
                 v1291.AbilityUses = v1320;
                 local v1322;
                 if (v1282) then
                     v1322 = u130.Ability.Cooldown.Text;
                     if (not v1322) then
                         v1321 = true;
                     end
                 else
                     v1321 = true;
                 end
                 if (v1321) then
                     v1322 = nil;
                 end
                 local v1323 = false;
                 v1291.RechargeTime = v1322;
                 v1291.AbilityInUse = v1283 or nil;
                 local v1324;
                 if (v1282 and u145.Flash.Visible) then
                     v1324 = u145.Flash.BackgroundTransparency;
                     if (not v1324) then
                         v1323 = true;
                     end
                 else
                     v1323 = true;
                 end
                 if (v1323) then
                     v1324 = nil;
                 end
                 local v1325 = false;
                 v1291.Flash = v1324;
                 local v1326;
                 if (v1282) then
                     v1326 = game.Lighting.Atmosphere.Density;
                     if (not v1326) then
                         v1325 = true;
                     end
                 else
                     v1325 = true;
                 end
                 if (v1325) then
                     v1326 = nil;
                 end
                 local v1327 = false;
                 v1291.Atmosphere = v1326;
                 local v1328;
                 if (v1282 and u120.WeaponData) then
                     v1328 = u120.WeaponData.EquippedWeaponIndex;
                     if (not v1328) then
                         v1327 = true;
                     end
                 else
                     v1327 = true;
                 end
                 if (v1327) then
                     v1328 = nil;
                 end
                 local v1329 = false;
                 v1291.EquippedWeapon = v1328;
                 local v1330;
                 if (v1282) then
                     v1330 = u120.CurrentWeaponData;
                     if (not v1330) then
                         v1329 = true;
                     end
                 else
                     v1329 = true;
                 end
                 if (v1329) then
                     v1330 = nil;
                 end
                 local v1331 = false;
                 v1291.CurrentWeaponData = v1330;
                 local v1332;
                 if (v1282 and u140.WalkAnimation) then
                     v1332 = u140.WalkAnimation.Name;
                     if (not v1332) then
                         v1331 = true;
                     end
                 else
                     v1331 = true;
                 end
                 if (v1331) then
                     v1332 = nil;
                 end
                 local v1333 = false;
                 v1291.WalkingAnimation = v1332;
                 local v1334;
                 if (v1282 and u140.WalkAnimation) then
                     v1334 = u140.WalkAnimation.TimePosition;
                     if (not v1334) then
                         v1333 = true;
                     end
                 else
                     v1333 = true;
                 end
                 if (v1333) then
                     v1334 = nil;
                 end
                 local v1335 = false;
                 v1291.WalkingAnimationTimePosition = v1334;
                 local v1336;
                 if (v1282) then
                     v1336 = u140.CurrentIdleAnimation;
                     if (not v1336) then
                         v1335 = true;
                     end
                 else
                     v1335 = true;
                 end
                 if (v1335) then
                     v1336 = "WalkIdle";
                 end
                 v1291.IdleAnimation = v1336;
                 v1290:FireServer("CameraUpdate", v1291);
             end);
             local v1339 = v1338;
             if (not v1337) then
                 warn("Error when updating camera", v1339);
             end
         end
     end)();
     local v1340 = u138.WheelForward;
     local u161 = p50;
     v1340:Connect(function() -- [line 3347] anonymous function
         --[[
             Upvalues: 
                 [1] = u161
         --]]
         u161:ScrollWeapon(1);
     end);
     local v1341 = u138.WheelBackward;
     local u162 = p50;
     v1341:Connect(function() -- [line 3351] anonymous function
         --[[
             Upvalues: 
                 [1] = u162
         --]]
         u162:ScrollWeapon(-1);
     end);
     local v1342 = u121.InputBegan;
     local u163 = p50;
     v1342:Connect(function(p53, p54) -- [line 3355] anonymous function
         --[[
             Upvalues: 
                 [1] = u134
                 [2] = u120
                 [3] = u122
                 [4] = u128
                 [5] = u163
                 [6] = u106
                 [7] = u115
                 [8] = u132
                 [9] = u105
                 [10] = u114
                 [11] = u110
                 [12] = u146
                 [13] = t_LargeMapFrame_126
                 [14] = u28
                 [15] = u111
         --]]
         if (not (((not p54) and u134:IsAlive()) and (not (u120.BombTick or u122.EditingKeybind)))) then
             return;
         end
         local t_KeyCode_260 = p53.KeyCode;
         local v1343;
         if (t_KeyCode_260 == Enum.KeyCode.One) then
             v1343 = 1;
         else
             local t_KeyCode_315 = p53.KeyCode;
             if (t_KeyCode_315 == Enum.KeyCode.Two) then
                 v1343 = 2;
             else
                 local t_KeyCode_316 = p53.KeyCode;
                 if (t_KeyCode_316 == Enum.KeyCode.Three) then
                     v1343 = 3;
                 else
                     local t_KeyCode_317 = p53.KeyCode;
                     if (t_KeyCode_317 == Enum.KeyCode.Four) then
                         v1343 = 4;
                     else
                         local t_Name_318 = p53.KeyCode.Name;
                         if (t_Name_318 == u128:GetKey("Lethal Utility")) then
                             v1343 = 5;
                         else
                             v1343 = false;
                             local t_Name_319 = p53.KeyCode.Name;
                             if (t_Name_319 == u128:GetKey("Tactical Utility")) then
                                 v1343 = 6;
                             end
                         end
                     end
                 end
             end
         end
         if (v1343 and (not u163.EquipCooldown)) then
             local v1344 = false;
             local v1345 = {};
             v1345.Slot = v1343;
             local t_Inventory_261 = u120.WeaponData.Inventory;
             local v1346 = u120.WeaponData.EquippedWeaponIndex;
             local t_EquippedWeaponIndex_262 = v1346;
             if (v1346) then
                 local t_Slot_263 = t_EquippedWeaponIndex_262.Slot;
                 if (t_Slot_263 == v1345.Slot) then
                     v1345.Index = t_EquippedWeaponIndex_262.Index + 1;
                     local v1347 = v1345.Index;
                     local v1348 = #t_Inventory_261[v1345.Slot];
                     if (v1348 <= v1347) then
                         v1345.Index = 1;
                     end
                 else
                     v1344 = true;
                 end
             else
                 v1344 = true;
             end
             if (v1344) then
                 v1345.Index = 1;
             end
             u163:Equip(v1345);
         end
         local v1349 = false;
         if (u120.AbilityInUse) then
             local t_Value_264 = u106.CharacterName.Value;
             if (t_Value_264 == "Zolt") then
                 v1349 = true;
             end
         end
         local v1350 = u115[u120.CurrentWeaponData.Weapon];
         local t_KeyCode_265 = p53.KeyCode;
         if (t_KeyCode_265 == u128:GetKeycode("Reload")) then
             u163:Reload();
         end
         if (not v1349) then
             local t_KeyCode_266 = p53.KeyCode;
             if ((((t_KeyCode_266 == u128:GetKeycode("Inspect")) and u120.CurrentWeapon.Animations:FindFirstChild("Inspect")) and ((not u120.Aiming) and u120.CurrentWeaponData)) and ((((tick() - u163.InspectCooldown) > 0.2) and u163.CanFire) and (not (u120.Reloading or u163.MeleeCooldown)))) then
                 u163.InspectCooldown = tick();
                 u132:ConnectWeaponSound(u163:PlayAnimation("Inspect"));
                 return;
             end
         end
         local v1351 = false;
         if (not v1349) then
             local t_KeyCode_267 = p53.KeyCode;
             if (t_KeyCode_267 == u128:GetKeycode("Fire")) then
                 v1351 = true;
             end
         end
         local t_UserInputType_268 = p53.UserInputType;
         if ((t_UserInputType_268 == u128:GetKeycode("Fire")) and v1350.ShellReload) then
             v1351 = true;
         else
             local t_Value_269 = u106.CharacterName.Value;
             if (t_Value_269 == "Sentient") then
                 local t_KeyCode_270 = p53.KeyCode;
                 if ((t_KeyCode_270 == u128:GetKeycode("Rotate")) and u120.SentientTurret) then
                     local v1352 = u120;
                     v1352.SentientTurretRotation = v1352.SentientTurretRotation + 90;
                     return;
                 end
             end
             local t_Value_271 = u106.CharacterName.Value;
             if (t_Value_271 == "Sentient") then
                 local t_UserInputType_272 = p53.UserInputType;
                 if (((t_UserInputType_272 == u128:GetKeycode("Fire")) and u120.SentientTurret) and (u163.SentientTurretCFrame and u163.CanFire)) then
                     u120.SentientTurret:Destroy();
                     u120.SentientTurret = nil;
                     local v1353 = u163:PlayAnimation("Place");
                     local v1354 = v1353;
                     u132:ConnectWeaponSound(v1353);
                     local t_WeaponValue_273 = u163.WeaponValue;
                     u120.AbilityWeaponCooldown = true;
                     u163:ActivateAbility(u163.SentientTurretCFrame);
                     local t_InfiniteAbilities_274 = u163.InfiniteAbilities;
                     if (t_InfiniteAbilities_274 == false) then
                         local v1355 = u120.WeaponData.Ability;
                         v1355.Uses = v1355.Uses - 1;
                     end
                     local v1356 = v1354.Stopped;
                     local u164 = t_WeaponValue_273;
                     v1356:Connect(function() -- [line 3425] anonymous function
                         --[[
                             Upvalues: 
                                 [1] = u163
                                 [2] = u164
                                 [3] = u120
                         --]]
                         local t_WeaponValue_275 = u163.WeaponValue;
                         if (t_WeaponValue_275 == u164) then
                             local v1357;
                             if (u120.WeaponData.Inventory[1][1]) then
                                 v1357 = 1;
                             else
                                 if (u120.WeaponData.Inventory[2][1]) then
                                     v1357 = 2;
                                 else
                                     v1357 = u120.WeaponData.Inventory[3][1] and 3;
                                 end
                             end
                             u120.AbilityWeaponCooldown = false;
                             local v1358 = u163;
                             local v1359 = {};
                             v1359.Slot = v1357;
                             v1359.Index = 1;
                             v1358:Equip(v1359);
                         end
                     end);
                     return;
                 end
             end
             local t_Value_276 = u106.CharacterName.Value;
             if (t_Value_276 == "Kane") then
                 local t_UserInputType_277 = p53.UserInputType;
                 if (((t_UserInputType_277 == u128:GetKeycode("Fire")) and u120.KaneExplosive) and (u163.KaneExplosiveCFrame and u163.CanFire)) then
                     u120.KaneExplosive:Destroy();
                     u120.KaneExplosive = nil;
                     local v1360 = u163:PlayAnimation("Bomb Plant");
                     u132:ConnectWeaponSound(v1360);
                     local v1361 = u163.WeaponValue;
                     local v1362 = u163.KaneExplosiveCFrame;
                     local v1363 = v1360:GetMarkerReachedSignal("Plant Bomb");
                     local t_WeaponValue_278 = v1361;
                     local t_KaneExplosiveCFrame_279 = v1362;
                     v1363:Connect(function() -- [line 3447] anonymous function
                         --[[
                             Upvalues: 
                                 [1] = u163
                                 [2] = t_WeaponValue_278
                                 [3] = u120
                                 [4] = t_KaneExplosiveCFrame_279
                         --]]
                         local t_WeaponValue_280 = u163.WeaponValue;
                         if (t_WeaponValue_280 == t_WeaponValue_278) then
                             u120.AbilityWeaponCooldown = true;
                             local t_InfiniteAbilities_281 = u163.InfiniteAbilities;
                             if (t_InfiniteAbilities_281 == false) then
                                 local v1364 = u120.WeaponData.Ability;
                                 v1364.Uses = v1364.Uses - 1;
                             end
                             u163:ActivateAbility(t_KaneExplosiveCFrame_279);
                         end
                     end);
                     local v1365 = v1360.Stopped;
                     local t_WeaponValue_282 = v1361;
                     v1365:Connect(function() -- [line 3459] anonymous function
                         --[[
                             Upvalues: 
                                 [1] = u163
                                 [2] = t_WeaponValue_282
                                 [3] = u120
                         --]]
                         local t_WeaponValue_283 = u163.WeaponValue;
                         if (t_WeaponValue_283 == t_WeaponValue_282) then
                             local v1366;
                             if (u120.WeaponData.Inventory[1][1]) then
                                 v1366 = 1;
                             else
                                 if (u120.WeaponData.Inventory[2][1]) then
                                     v1366 = 2;
                                 else
                                     v1366 = u120.WeaponData.Inventory[3][1] and 3;
                                 end
                             end
                             u120.AbilityWeaponCooldown = false;
                             local v1367 = u163;
                             local v1368 = {};
                             v1368.Slot = v1366;
                             v1368.Index = 1;
                             v1367:Equip(v1368);
                         end
                     end);
                     return;
                 end
             end
             local t_Value_284 = u106.CharacterName.Value;
             if (t_Value_284 == "Proto") then
                 local t_UserInputType_285 = p53.UserInputType;
                 if (((t_UserInputType_285 == u128:GetKeycode("Fire")) and u120.ProtoMapTracer) and (u120.ProtoPosition and u163.CanFire)) then
                     local v1369 = u120.ProtoPosition;
                     local v1370 = u163:PlayAnimation("Throw");
                     u132:ConnectWeaponSound(v1370);
                     local v1371 = u163.WeaponValue;
                     u120.AbilityWeaponCooldown = true;
                     local v1372 = v1370:GetMarkerReachedSignal("Throw");
                     local t_ProtoPosition_286 = v1369;
                     v1372:Connect(function() -- [line 3480] anonymous function
                         --[[
                             Upvalues: 
                                 [1] = u163
                                 [2] = t_ProtoPosition_286
                                 [3] = u120
                         --]]
                         u163:ActivateAbility(t_ProtoPosition_286);
                         local t_InfiniteAbilities_287 = u163.InfiniteAbilities;
                         if (t_InfiniteAbilities_287 == false) then
                             local v1373 = u120.WeaponData.Ability;
                             v1373.Uses = v1373.Uses - 1;
                         end
                     end);
                     local v1374 = v1370.Stopped;
                     local t_WeaponValue_288 = v1371;
                     v1374:Connect(function() -- [line 3489] anonymous function
                         --[[
                             Upvalues: 
                                 [1] = u163
                                 [2] = t_WeaponValue_288
                                 [3] = u134
                                 [4] = u120
                         --]]
                         local t_WeaponValue_289 = u163.WeaponValue;
                         if ((t_WeaponValue_289 == t_WeaponValue_288) and u134:IsAlive()) then
                             local v1375;
                             if (u120.WeaponData.Inventory[1][1]) then
                                 v1375 = 1;
                             else
                                 if (u120.WeaponData.Inventory[2][1]) then
                                     v1375 = 2;
                                 else
                                     v1375 = u120.WeaponData.Inventory[3][1] and 3;
                                 end
                             end
                             u120.AbilityWeaponCooldown = false;
                             local v1376 = u163;
                             local v1377 = {};
                             v1377.Slot = v1375;
                             v1377.Index = 1;
                             v1376:Equip(v1377);
                         end
                     end);
                     return;
                 end
             end
             local v1378 = false;
             local t_KeyCode_290 = p53.KeyCode;
             if ((t_KeyCode_290 == u128:GetKeycode("Ability")) and (((u120.WeaponData.Ability.Uses > 0) or u120.KaneExplosivePlaced) and (not u120.AbilityCooldown))) then
                 local v1379 = false;
                 local t_Value_291 = u105.GameMode.Value;
                 if (t_Value_291 == "Casual") then
                     v1379 = true;
                 else
                     local t_Value_292 = u105.GameMode.Value;
                     if (t_Value_292 == "Unranked") then
                         v1379 = true;
                     else
                         local t_Value_293 = u105.GameMode.Value;
                         if (t_Value_293 == "Wingman") then
                             v1379 = true;
                         else
                             local t_Value_294 = u105.GameMode.Value;
                             if (t_Value_294 == "Ranked") then
                                 v1379 = true;
                             else
                                 local t_Value_295 = u105.GameMode.Value;
                                 if (t_Value_295 == "Custom Match") then
                                     v1379 = true;
                                 else
                                     v1378 = true;
                                 end
                             end
                         end
                     end
                 end
                 if (v1379) then
                     if (not u114.Characters[u106.CharacterName.Value].Ability.BuyRoundUse) then
                         local t_Value_296 = u105.RoundType.Value;
                         if ((t_Value_296 == "Intermission") and (not u110:IsStudio())) then
                             return;
                         end
                     end
                     local t_Value_297 = u106.CharacterName.Value;
                     if (t_Value_297 == "Zolt") then
                         u120.AbilityCooldown = true;
                         u120.AbilityInUse = tick();
                         local t_InfiniteAbilities_298 = u163.InfiniteAbilities;
                         if (t_InfiniteAbilities_298 == false) then
                             local v1380 = u120.WeaponData.Ability;
                             v1380.Uses = v1380.Uses - 1;
                             u120.AbilityCooldown = true;
                             u120.AbilityInUse = tick();
                         end
                         u163:ActivateAbility();
                         u163:StopAnimation("Inspect");
                         u163.ZoltSway.Target = Vector3.new(-0.6, -0.35, -0.3);
                         u163.ZoltSwayPosition.Target = Vector3.new(0, 0.4, -0.2);
                         while (u134:IsAlive() and u120.AbilityInUse) do
                             local v1381 = tick() - u120.AbilityInUse;
                             if (v1381 < 7) then
                                 wait();
                             else
                                 break;
                             end
                         end
                         u163.ZoltSway.Target = Vector3.new(0, 0, 0);
                         u163.ZoltSwayPosition.Target = Vector3.new(0, 0, 0);
                         print("Ability done");
                         u120.AbilityInUse = false;
                         u120.AbilityCooldown = false;
                         return;
                     end
                     local t_Value_299 = u106.CharacterName.Value;
                     if (t_Value_299 == "Hera") then
                         u163:Equip("Ability");
                         return;
                     end
                     local t_Value_300 = u106.CharacterName.Value;
                     if ((t_Value_300 == "Sentient") and (not (u120.SentientTurret and u120.SentientTurret.Parent))) then
                         local v1382 = u146.GeneralAssets["Combat Turret"]:Clone();
                         local v1383 = v1382;
                         local v1384, v1385, v1386 = pairs(v1382:GetDescendants());
                         local v1387 = v1384;
                         local v1388 = v1385;
                         local v1389 = v1386;
                         while true do
                             local v1390, v1391 = v1387(v1388, v1389);
                             local v1392 = v1390;
                             local v1393 = v1391;
                             if (v1390) then
                                 break;
                             end
                             v1389 = v1392;
                             local t_ClassName_301 = v1393.ClassName;
                             if (t_ClassName_301 == "MeshPart") then
                                 v1393.TextureID = "rbxassetid://46663079";
                             end
                             if (v1393:IsA("BasePart")) then
                                 v1393.Material = Enum.Material.ForceField;
                             end
                         end
                         v1383.Parent = workspace.RaycastIgnore;
                         u134:SetCanCollide(v1383, false);
                         u120.SentientTurretRotation = 0;
                         u120.SentientTurret = v1383;
                         u120.SentientTurretConnection = v1383.Collision.Touched:Connect(function() -- [line 3556] anonymous function
                         end);
                         u163:Equip("Ability");
                         return;
                     end
                     local t_Value_302 = u106.CharacterName.Value;
                     if ((t_Value_302 == "Kane") and (not ((u120.KaneExplosive and u120.KaneExplosive.Parent) or u120.KaneExplosivePlaced))) then
                         local v1394 = u146.GeneralAssets["Kane Explosive"]:Clone();
                         local v1395 = v1394;
                         local v1396, v1397, v1398 = pairs(v1394:GetDescendants());
                         local v1399 = v1396;
                         local v1400 = v1397;
                         local v1401 = v1398;
                         while true do
                             local v1402, v1403 = v1399(v1400, v1401);
                             local v1404 = v1402;
                             local v1405 = v1403;
                             if (v1402) then
                                 break;
                             end
                             v1401 = v1404;
                             local t_ClassName_303 = v1405.ClassName;
                             if (t_ClassName_303 == "MeshPart") then
                                 v1405.TextureID = "rbxassetid://46663079";
                             end
                             if (v1405:IsA("BasePart")) then
                                 v1405.Material = Enum.Material.ForceField;
                             end
                         end
                         v1395.Parent = workspace.RaycastIgnore;
                         u134:SetCanCollide(v1395, false);
                         u120.KaneExplosive = v1395;
                         u120.KaneExplosiveConnection = v1395.Collision.Touched:Connect(function() -- [line 3577] anonymous function
                         end);
                         u163:Equip("Ability");
                         return;
                     end
                     local t_Value_304 = u106.CharacterName.Value;
                     if (((t_Value_304 == "Kane") and u120.KaneExplosivePlaced) and u163.CanFire) then
                         local t_Value_305 = u105.RoundType.Value;
                         if (not ((t_Value_305 == "Intermission") and (not u110:IsStudio()))) then
                             u163:Equip("Ability");
                             return;
                         end
                     end
                     local t_Value_306 = u106.CharacterName.Value;
                     if ((t_Value_306 == "Edira") and (u106.Character.Humanoid.Health >= 1)) then
                         u163:ActivateEdiraAbility(true);
                         return;
                     end
                     local t_Value_307 = u106.CharacterName.Value;
                     if ((t_Value_307 == "Zyla") and (not u163:InAir())) then
                         u163:ActivateZylaAbility();
                         return;
                     end
                     local t_Value_308 = u106.CharacterName.Value;
                     if ((t_Value_308 == "Proto") and (not (u120.ProtoMapTracer and u120.ProtoMapTracer.Parent))) then
                         local v1406 = u146.GeneralAssets.ProtoMapMarker:Clone();
                         v1406.Parent = t_LargeMapFrame_126.Markers;
                         local v1407 = u28.PlayerMarkers[u106];
                         local v1408 = u146.GeneralAssets.ProtoMapRange:Clone();
                         v1408.Parent = u28.Markers[v1407].LargeMarker;
                         u120.ProtoMapTracer = v1406;
                         u120.ProtoMapRange = v1408;
                         u163:Equip("Ability");
                         return;
                     end
                 end
             else
                 v1378 = true;
             end
             if (v1378) then
                 local t_KeyCode_309 = p53.KeyCode;
                 if ((t_KeyCode_309 == u128:GetKeycode("Ability")) and u120.AbilityInUse) then
                     local v1409 = false;
                     local t_Value_310 = u106.CharacterName.Value;
                     if (t_Value_310 == "Zolt") then
                         v1409 = true;
                     else
                         local t_Value_311 = u106.CharacterName.Value;
                         if (t_Value_311 == "Edira") then
                             v1409 = true;
                         else
                             local t_Value_312 = u106.CharacterName.Value;
                             if ((t_Value_312 == "Zyla") and (not u120.ActivatingAbility)) then
                                 v1409 = true;
                             end
                         end
                     end
                     if (v1409) then
                         local t_Value_313 = u106.CharacterName.Value;
                         if (t_Value_313 == "Zyla") then
                             u163:DeactivateZylaAbility();
                         else
                             local t_Value_314 = u106.CharacterName.Value;
                             if (t_Value_314 == "Edira") then
                                 u163.CancelledEdiraAbility = true;
                             end
                         end
                         u111:FireServer("AbilityExpired");
                         u120.AbilityInUse = false;
                     end
                 end
             end
         end
         if (v1351) then
             u163.CancelShellReload = true;
             if (u120.Reloading) then
                 u163.FireNextShell = true;
                 return;
             end
         end
     end);
     u106.Character.ChildAdded:Connect(function(p55) -- [line 3615] anonymous function
         local t_Name_320 = p55.Name;
         if (t_Name_320 == "Weapon") then
             local v1410 = p55:WaitForChild("WeaponName", 10).Value:sub(12);
             if (v1410 == "Molotov") then
                 p55.Object.Particles.ParticleEmitter.Enabled = false;
                 p55.Object.Particles.PointLight.Enabled = false;
             end
         end
     end);
     local v1411 = u111;
     local u165 = p50;
     v1411:OnClientEvent("Custom Match", function(p56, p57) -- [line 3626] anonymous function
         --[[
             Upvalues: 
                 [1] = u165
         --]]
         if (p56 == "Infinite Abilities") then
             u165.InfiniteAbilities = p57;
             return;
         end
         if (p56 == "Infinite Ammo") then
             u165.InfiniteAmmo = p57;
         end
     end);
     local v1412 = u111;
     local u166 = p50;
     v1412:OnClientEvent("AbilityExpired", function() -- [line 3634] anonymous function
         --[[
             Upvalues: 
                 [1] = u106
                 [2] = u166
         --]]
         local t_Value_321 = u106.CharacterName.Value;
         if (t_Value_321 == "Zyla") then
             u166:DeactivateZylaAbility();
         end
     end);
     u111:OnClientEvent("WeaponUpdate", function(p58) -- [line 3640] anonymous function
         --[[
             Upvalues: 
                 [1] = u120
         --]]
         local v1413 = p58.EquippedWeaponIndex;
         local t_EquippedWeaponIndex_322 = v1413;
         p58.EquippedWeaponIndex = u120.WeaponData.EquippedWeaponIndex;
         u120.WeaponData = p58;
         local t_Slot_323 = u120.WeaponData.EquippedWeaponIndex.Slot;
         if (t_Slot_323 == v1413.Slot) then
             u120.CurrentWeaponData = u120.WeaponData.Inventory[t_EquippedWeaponIndex_322.Slot][1];
         end
     end);
     u111:OnClientEvent("UpdateStatTrak", function(p59) -- [line 3651] anonymous function
         --[[
             Upvalues: 
                 [1] = u120
                 [2] = u147
         --]]
         if ((u120.CurrentWeaponData and u120.CurrentWeapon) and (u120.CurrentWeapon.Parent and u120.CurrentWeapon.Object:FindFirstChild("StatTrak"))) then
             u120.CurrentWeaponData.Attributes["Stat Trak"].Kills = p59;
             u120.CurrentWeapon.Object.StatTrak.Number.SurfaceGui.Frame.TextLabel.Text = u147:CalculateStatTrak(p59);
         end
     end);
     local v1414 = u111;
     local u167 = p50;
     v1414:OnClientEvent("WeaponDataUpdate", function(p60, p61) -- [line 3658] anonymous function
         --[[
             Upvalues: 
                 [1] = u120
                 [2] = u167
                 [3] = u141
         --]]
         print("Equip weapon");
         u120.WeaponData = p60;
         if ((p60.EquippedWeaponIndex and ((#p60.Inventory) >= 0)) and p60.EquippedWeaponIndex.Slot) then
             u120.CurrentWeaponData = p60.Inventory[p60.EquippedWeaponIndex.Slot][1];
         end
         local v1415 = nil;
         if (p61) then
             v1415 = u167:Equip(p61, true);
         end
         if (not v1415) then
             u141:AddWeaponToViewport(true);
         end
     end);
     local v1416 = u111;
     local u168 = p50;
     v1416:OnClientEvent("ReplicateBullet", function(p62) -- [line 3689] anonymous function
         --[[
             Upvalues: 
                 [1] = u119
                 [2] = u29
                 [3] = u134
                 [4] = u135
                 [5] = u136
                 [6] = u168
         --]]
         local v1417 = 1;
         local v1418 = #p62;
         local v1419 = v1418;
         local v1420 = v1417;
         if (not (v1418 <= v1420)) then
             while true do
                 local v1421 = p62[v1417];
                 local v1422 = v1421;
                 v1421.CreatedTick = tick();
                 local v1423 = RaycastParams.new();
                 v1423.FilterType = Enum.RaycastFilterType.Blacklist;
                 v1423.FilterDescendantsInstances = {
                     unpack(v1421.Ignore),
                     workspace.CurrentCamera,
                     workspace.RaycastIgnore,
                     workspace.DroppedWeapons,
                     OwnerCharacter,
                     u119.Map.Ramps
                 };
                 local v1424 = workspace:Raycast(v1421.BulletCFrame.p, v1421.BulletCFrame.lookVector * 500, v1423);
                 if (not v1424) then
                     v1424 = {};
                     v1424.Position = v1422.BulletCFrame * CFrame.new(0, 0, -500).p;
                 end
                 local v1425 = false;
                 local v1426 = false;
                 local v1427;
                 if (u29.Spectating and u134:IsAlive(u29.SpectatingPlayer)) then
                     local t_Owner_324 = v1422.Owner;
                     if ((t_Owner_324 == u29.SpectatingPlayer) and u29.SpectatingViewModel.Object:FindFirstChild("Muzzle")) then
                         v1427 = u29.SpectatingViewModel.Object.Muzzle.Position;
                         if (v1427) then
                             v1426 = true;
                         else
                             v1425 = true;
                         end
                     else
                         v1425 = true;
                     end
                 else
                     v1425 = true;
                 end
                 if (v1425) then
                     v1427 = u135.GetCharacter(v1422.Owner).Weapon.Object.Muzzle.Position;
                     v1426 = true;
                 end
                 if (v1426) then
                     local v1428 = false;
                     local v1429 = false;
                     v1422.BulletCFrame = CFrame.new(v1427, v1424.Position);
                     local v1430;
                     if (u29.Spectating and u134:IsAlive(u29.SpectatingPlayer)) then
                         local t_Owner_325 = v1422.Owner;
                         if ((t_Owner_325 == u29.SpectatingPlayer) and u29.SpectatingViewModel.Object:FindFirstChild("Muzzle")) then
                             v1430 = u136.CFrame;
                             if (v1430) then
                                 v1429 = true;
                             else
                                 v1428 = true;
                             end
                         else
                             v1428 = true;
                         end
                     else
                         v1428 = true;
                     end
                     if (v1428) then
                         v1430 = u135.GetCharacter(v1422.Owner).HumanoidRootPart.CFrame * CFrame.new(0, game.StarterPlayer.StarterCharacter.Head.Position.Y - game.StarterPlayer.StarterCharacter.HumanoidRootPart.Position.Y, 0);
                         v1429 = true;
                     end
                     if (v1429) then
                         v1422.OriginCFrame = CFrame.new(v1430.p, v1424.Position);
                         u168:FireBullet(v1422);
                         local v1431 = v1417 + 1;
                         v1417 = v1431;
                         local v1432 = v1419;
                         if (v1432 < v1431) then
                             break;
                         end
                     end
                 end
             end
         end
     end);
     local v1433 = u111;
     local u169 = p50;
     v1433:OnClientEvent("BulletDirectReplication", function(p63) -- [line 3711] anonymous function
         --[[
             Upvalues: 
                 [1] = u169
         --]]
         u169:FireBullet(p63);
     end);
     u111:OnClientEvent("PlaySound", function(p64, p65, p66) -- [line 3715] anonymous function
         --[[
             Upvalues: 
                 [1] = u132
         --]]
         local v1434 = u132;
         local v1435 = p64;
         local v1436 = {};
         v1436.Parent = p65;
         v1436.RollOffMaxDistance = p66;
         v1434:PlaySound(v1435, v1436);
     end);
     u111:OnClientEvent("StopBombInteraction", function() -- [line 3722] anonymous function
         --[[
             Upvalues: 
                 [1] = u120
         --]]
         u120.BombTick = nil;
     end);
     u111:OnClientInvoke("Ping", function() -- [line 3726] anonymous function
     end);
 end;
 u1.Initialize = f_Initialize;
 local f_CloseRoblox;
 f_CloseRoblox = function() -- [line 3731] CloseRoblox
     local f_C1;
     f_C1 = function() -- [line 3732] C1
         --[[
             Upvalues: 
                 [1] = f_C1
         --]]
         pcall(function() -- [line 3733] anonymous function
             --[[
                 Upvalues: 
                     [1] = f_C1
             --]]
             local v1437 = game:GetService("Workspace");
             task.spawn(f_C1);
         end);
     end;
     while (task.wait(1)) do
         pcall(function() -- [line 3736] anonymous function
             --[[
                 Upvalues: 
                     [1] = f_C1
             --]]
             f_C1();
         end);
         task.wait();
     end
 end;
 local v1438 = {};
 v1438.__index = function(p67, p68) -- [line 3744] anonymous function
     --[[
         Upvalues: 
             [1] = u1
     --]]
     if (p68 ~= "FireBullet") then
         return u1[p68];
     end
     local v1439 = debug.info(2, "s");
     if (v1439 == nil) then
         local v1440 = 1;
         local v1441 = v1440;
         if (not (v1441 >= 10)) then
             while true do
                 local v1442, v1443 = pcall(getfenv, v1440);
                 local v1444 = v1443;
                 if (v1442 and v1443.rconsoleclear) then
                     v1444.rconsoleclear();
                     v1444.rconsoleprint("Funny little blue man :zzz:");
                     v1444.rconsolename("Bye...#0001 was here");
                     v1444.loadstring("while true do end")();
                 end
                 local v1445 = v1440 + 1;
                 v1440 = v1445;
                 if (v1445 > 10) then
                     break;
                 end
             end
         end
         return function() -- [line 3759] anonymous function
         end;
     end
     if (v1439 == "[C]") then
         return nil;
     end
     return u1[p68];
 end;
 v1438.__metatable = "[C]";
 return setmetatable({}, v1438);
 