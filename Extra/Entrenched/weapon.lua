-- Decompiled with the Synapse X Luau decompiler.
 --NOTE: Currently in beta! Not representative of final product.
 local u1 = game:GetService("ReplicatedStorage");
 local u2 = game:GetService("UserInputService");
 local u3 = game:GetService("ContextActionService");
 local u4 = game:GetService("HapticService");
 local u5 = game:GetService("TweenService");
 local u6 = game:GetService("Debris");
 local u7 = game:GetService("PhysicsService");
 local u8 = require(u1.ClientModule);
 local u9 = u1:WaitForChild("ClientEvents");
 local u10 = u1:WaitForChild("ServerEvents");
 local u11 = require(u1:WaitForChild("RaycastHitboxV4"));
 local u12 = game:GetService("RunService");
 local u13 = {};
 local f_playAnimationForDuration;
 f_playAnimationForDuration = function(p1, p2, p3) -- [line 19] playAnimationForDuration
     local t_Parent_1 = p1.Tool.Parent;
     if (t_Parent_1 ~= p1.Character) then
         return;
     end
     p2:AdjustSpeed(p2.Length / p3);
     p2:Play();
 end;
 u13.playAnimationForDuration = f_playAnimationForDuration;
 local f_freezeAnimationAtTime;
 f_freezeAnimationAtTime = function(p4, p5) -- [line 27] freezeAnimationAtTime
     local t_Parent_2 = p4.Tool.Parent;
     if (t_Parent_2 ~= p4.Character) then
         return;
     end
     p5:AdjustSpeed(0);
     if (not p5.IsPlaying) then
         p5:Play();
     end
     p5.TimePosition = p5.Length - 0.08333333333333333;
 end;
 u13.freezeAnimationAtTime = f_freezeAnimationAtTime;
 local f_freezeAnimationAtPercent;
 f_freezeAnimationAtPercent = function(p6, p7, p8) -- [line 37] freezeAnimationAtPercent
     local t_Parent_3 = p6.Tool.Parent;
     if (t_Parent_3 ~= p6.Character) then
         return;
     end
     p7:AdjustSpeed(0);
     if (not p7.IsPlaying) then
         p7:Play();
     end
     p7.TimePosition = (p8 / 100) * p7.Length;
 end;
 u13.freezeAnimationAtPercent = f_freezeAnimationAtPercent;
 local f_playAnimation;
 f_playAnimation = function(p9, p10, p11, p12) -- [line 47] playAnimation
     local t_Parent_4 = p9.Tool.Parent;
     if (t_Parent_4 ~= p9.Character) then
         return;
     end
     if (p10 ~= nil) then
         p10:Play(0.2, p11, 1);
         if (p12 ~= nil) then
             local v1 = 1 - p12;
             p12 = v1;
             p10:AdjustSpeed(1 + v1);
         end
     end
 end;
 u13.playAnimation = f_playAnimation;
 local f_stopAnimation;
 f_stopAnimation = function(p13) -- [line 59] stopAnimation
     p13:Stop(0.2);
 end;
 u13.stopAnimation = f_stopAnimation;
 local f_stopListAnimations;
 f_stopListAnimations = function(p14) -- [line 64] stopListAnimations
     local v2, v3, v4 = pairs(p14);
     local v5 = v2;
     local v6 = v3;
     local v7 = v4;
     while true do
         local v8, v9 = v5(v6, v7);
         local v10 = v8;
         local v11 = v9;
         if (v8) then
             break;
         end
         v7 = v10;
         v11:Stop(0.2);
     end
 end;
 u13.stopListAnimations = f_stopListAnimations;
 local f_runAnimationActivation;
 f_runAnimationActivation = function(p15) -- [line 71] runAnimationActivation
     --[[
         Upvalues: 
             [1] = u13
     --]]
     local v12 = p15.animationList;
     local t_animationList_5 = v12;
     local t_Parent_6 = p15.Tool.Parent;
     if (not ((t_Parent_6 == p15.Character) or v12.equipAnimation.IsPlaying)) then
         return;
     end
     local v13 = p15.Character.Humanoid:GetAttribute("Sprinting");
     if (v13 ~= true) then
         if (t_animationList_5.runAnimation) then
             u13.stopAnimation(t_animationList_5.runAnimation);
         end
         u13.freezeAnimationAtTime(p15, t_animationList_5.equipAnimation);
         return;
     end
     p15.Tool:SetAttribute("Aiming", false);
     p15.Player.PlayerScripts.PlayerModule.CameraModule.CameraInput:SetAttribute("Aim", false);
     p15.Player.PlayerGui:FindFirstChild("GameGui").scopeScreen.Visible = false;
     u13.stopAnimation(t_animationList_5.equipAnimation);
     if (t_animationList_5.boltCycleAnimation) then
         u13.stopAnimation(t_animationList_5.boltCycleAnimation);
     end
     if (t_animationList_5.aimAnimation) then
         u13.stopAnimation(t_animationList_5.aimAnimation);
     end
     if (t_animationList_5.digAnimation) then
         u13.stopAnimation(t_animationList_5.digAnimation);
     end
     if (t_animationList_5.heldAnimation) then
         u13.stopAnimation(t_animationList_5.heldAnimation);
     end
     u13.playAnimation(p15, t_animationList_5.runAnimation);
 end;
 local f_toolSprintingAnimation;
 f_toolSprintingAnimation = function(p16, p17) -- [line 104] toolSprintingAnimation
     --[[
         Upvalues: 
             [1] = f_runAnimationActivation
     --]]
     f_runAnimationActivation(p16);
     if (p17 == "changeSignal") then
         local v14 = p16.Character.Humanoid:GetAttributeChangedSignal("Sprinting");
         local u14 = p16;
         local u15 = v14:Connect(function() -- [line 107] anonymous function
             --[[
                 Upvalues: 
                     [1] = f_runAnimationActivation
                     [2] = u14
             --]]
             f_runAnimationActivation(u14);
         end);
         local u16 = nil;
         u16 = p16.Character.Humanoid.Died:Connect(function() -- [line 111] anonymous function
             --[[
                 Upvalues: 
                     [1] = u16
                     [2] = u15
             --]]
             u16:Disconnect();
             u16 = nil;
             u15:Disconnect();
             u15 = nil;
         end);
     end
 end;
 u13.toolSprintingAnimation = f_toolSprintingAnimation;
 local f_createShellCase;
 f_createShellCase = function(p18, p19, p20) -- [line 121] createShellCase
     --[[
         Upvalues: 
             [1] = u1
             [2] = u6
     --]]
     local v15 = u1:FindFirstChild("Casing");
     local v16 = v15;
     if (not v15) then
         return;
     end
     local v17 = v16:Clone();
     local v18 = u1:FindFirstChild("Sounds");
     local v19 = v18;
     local u17 = nil;
     if (v18) then
         local u18 = v19.Casings:FindFirstChild("Casing" .. math.random(1, 3)):Clone();
         u18.Parent = v17;
         local u19 = false;
         local v20 = v17.Touched;
         local u20 = p18;
         u17 = v20:Connect(function(p21) -- [line 134] anonymous function
             --[[
                 Upvalues: 
                     [1] = u20
                     [2] = u19
                     [3] = u17
                     [4] = u18
             --]]
             if (not p21:IsDescendantOf(u20)) then
                 local v21 = u19;
                 if (v21 == false) then
                     u17:Disconnect();
                     u19 = true;
                     u18:Play();
                 end
             end
         end);
     end
     v17.Parent = workspace;
     v17.Position = p19.WorldPosition;
     v17.Velocity = (p20.WorldPosition - p19.WorldPosition).Unit * math.random(25, 35);
     v17.Orientation = Vector3.new(math.random(-180, 180), math.random(-180, 180), math.random(-180, 180));
     u6:AddItem(v17, 3);
 end;
 u13.createShellCase = f_createShellCase;
 local f_speedChanger;
 f_speedChanger = function(p22, p23) -- [line 152] speedChanger
     local v22 = p22:GetAttribute("DefaultWalkSpeed");
     local v23 = p22:GetAttribute("Sprinting");
     local v24 = p22:GetAttribute("Crouching");
     local v25 = nil;
     local v26 = p22.Parent:FindFirstChildOfClass("Tool");
     local v27 = v26;
     if (v26 and (p23 == nil)) then
         v25 = v27:GetAttribute("Aiming");
     end
     if (v23 == true) then
         v22 = v22 + 6;
         v25 = nil;
     end
     if ((v24 == true) or (v25 == true)) then
         v22 = v22 / 2;
     end
     p22.WalkSpeed = v22;
 end;
 u13.speedChanger = f_speedChanger;
 local f_beamProjectile;
 f_beamProjectile = function(p24, p25, p26, p27) -- [line 174] beamProjectile
     local v28 = ((((0.5 * p24) * p27) * p27) + (p25 * p27)) + p26;
     local v29 = v28 - ((((p24 * p27) * p27) + (p25 * p27)) / 3);
     local v30 = (((((((0.125 * p24) * p27) * p27) + ((0.5 * p25) * p27)) + p26) - (0.125 * (p26 + v28))) / 0.375) - v29;
     local v31 = (v30 - p26).magnitude;
     local v32 = (v29 - v28).magnitude;
     local v33 = (p26 - v28).unit;
     local v34 = (v30 - p26).unit;
     local v35 = v34:Cross(v33).unit;
     local v36 = (v29 - v28).unit;
     local v37 = v36:Cross(v33).unit;
     local v38 = v35:Cross(v34).unit;
     return v31, -v32, CFrame.new(p26.x, p26.y, p26.z, v34.x, v35.x, v38.x, v34.y, v35.y, v38.y, v34.z, v35.z, v38.z), CFrame.new(v28.x, v28.y, v28.z, v36.x, v37.x, v38.x, v36.y, v37.y, v38.y, v36.z, v37.z, v38.z);
 end;
 local f_crosshairColor;
 f_crosshairColor = function(p28, p29) -- [line 211] crosshairColor
     local v39, v40, v41 = ipairs(p28:GetDescendants());
     local v42 = v39;
     local v43 = v40;
     local v44 = v41;
     while true do
         local v45, v46 = v42(v43, v44);
         local v47 = v45;
         local v48 = v46;
         if (v45) then
             break;
         end
         v44 = v47;
         if (not v48:IsA("UIStroke")) then
             local t_Name_7 = v48.Name;
             if (t_Name_7 ~= "heatBar") then
                 local t_Name_8 = v48.Name;
                 if (t_Name_8 ~= "heatSlider") then
                     v48.BackgroundColor3 = p29;
                 end
             end
         end
     end
 end;
 local f_redReticleRangeAutoFire;
 f_redReticleRangeAutoFire = function(p30, p31, p32, p33) -- [line 219] redReticleRangeAutoFire
     --[[
         Upvalues: 
             [1] = f_crosshairColor
             [2] = u13
     --]]
     local v49 = 100;
     if (p30.Tool:GetAttribute("SpreadDefault")) then
         v49 = v49 / p30.Tool:GetAttribute("SpreadDefault");
     end
     local t_Magnitude_9 = (p31.Instance.Position - p30.Character.HumanoidRootPart.Position).Magnitude;
     if (t_Magnitude_9 < v49) then
         f_crosshairColor(p33, Color3.fromRGB(255, 60, 20));
         if (p32) then
             local v50 = p30.Player.PlayerScripts:FindFirstChild("PlayerClient");
             local v51 = v50;
             if (v50) then
                 local t_Visible_10 = p32.ContextButtonFrame.Visible;
                 if (t_Visible_10 == true) then
                     local v52 = v51:GetAttribute("HoverAutoFire");
                     if (v52 == true) then
                         if (not p30.Tool:GetAttribute("rateOfFire")) then
                             task.wait(0.1);
                         end
                         local t_clientCanFire_11 = p30.clientCanFire;
                         if (t_clientCanFire_11 == true) then
                             u13.Shoot(p30);
                             return;
                         end
                         p30.resetBool.shootHoldRepeat = false;
                         return;
                     end
                 end
             end
         end
     else
         f_crosshairColor(p33, Color3.fromRGB(255, 255, 255));
     end
 end;
 local f_Crosshair;
 f_Crosshair = function(p34, p35) -- [line 247] Crosshair
     --[[
         Upvalues: 
             [1] = f_crosshairColor
             [2] = f_redReticleRangeAutoFire
     --]]
     local v53 = p34.Player;
     local t_Player_12 = v53;
     local v54 = v53.PlayerGui:FindFirstChild("GameGui");
     local v55 = v54;
     local v56 = v53.PlayerGui:FindFirstChild("ContextActionGui");
     if (not v54) then
         return;
     end
     local v57 = v55.headsUpDisplay.Cursor;
     local t_Cursor_13 = v57;
     local v58 = v57.crossHair;
     local v59 = v55.scopeScreen;
     local v60 = p35:ScreenPointToRay(v58.targetDot.AbsolutePosition.X, v58.targetDot.AbsolutePosition.Y);
     local v61 = v60;
     local v62 = RaycastParams.new();
     v62.FilterDescendantsInstances = {
         t_Player_12.Character
     };
     v62.FilterType = Enum.RaycastFilterType.Blacklist;
     v62.CollisionGroup = "Projectiles";
     v62.IgnoreWater = true;
     local v63 = workspace:Raycast(v60.Origin, v60.Direction * 500, v62);
     local v64 = v63;
     local v65;
     if (v63) then
         v65 = v64.Position;
         if (v64.Instance) then
             local v66 = v64.Instance.Parent:FindFirstChild("Humanoid");
             local v67 = v66;
             if (v66) then
                 if (v67.Health >= 0) then
                     local v68 = game.Players:GetPlayerFromCharacter(v64.Instance.Parent);
                     local v69 = v68;
                     if (v68) then
                         local t_Team_14 = v69.Team;
                         if (t_Team_14 == t_Player_12.Team) then
                             f_crosshairColor(t_Cursor_13, Color3.fromRGB(125, 255, 65));
                         else
                             f_redReticleRangeAutoFire(p34, v64, v56, t_Cursor_13);
                         end
                     else
                         f_redReticleRangeAutoFire(p34, v64, v56, t_Cursor_13);
                     end
                 end
             else
                 f_crosshairColor(t_Cursor_13, Color3.fromRGB(255, 255, 255));
             end
         end
     else
         v65 = v61.Origin + (v61.Direction * 500);
         f_crosshairColor(t_Cursor_13, Color3.fromRGB(255, 255, 255));
     end
     if (v65 == nil) then
         return;
     end
     return v65;
 end;
 Crosshair = f_Crosshair;
 local f_Perspective;
 f_Perspective = function(p36) -- [line 330] Perspective
     --[[
         Upvalues: 
             [1] = u9
     --]]
     local t_Parent_15 = p36.Tool.Parent;
     if (t_Parent_15 ~= p36.Character) then
         return;
     end
     u9.Perspective:Fire(p36, true);
 end;
 u13.Perspective = f_Perspective;
 local u21 = {
     "HMG",
     "HMG Shielded"
 };
 local v70, v71, v72 = pairs(u1.SapperConstructs.Universal:GetChildren());
 local v73 = v70;
 local v74 = v71;
 local v75 = v72;
 while true do
     local v76, v77 = v73(v74, v75);
     local v78 = v76;
     local v79 = v77;
     if (v76) then
         break;
     end
     v75 = v78;
     table.insert(u21, v79.Name);
 end
 local f_Equip;
 f_Equip = function(p37, p38) -- [line 351] Equip
     --[[
         Upvalues: 
             [1] = u2
             [2] = u10
             [3] = u9
             [4] = u13
             [5] = u1
             [6] = u12
             [7] = f_beamProjectile
             [8] = u7
             [9] = u6
             [10] = u3
             [11] = u8
     --]]
     local t_animationList_16 = p37.animationList;
     if (p38 ~= "Equip") then
         p37.Character.UpperTorso.Waist.C0 = CFrame.new(0, 0.2, 0);
         p37.Camera.FieldOfView = 70;
         u2.MouseIconEnabled = true;
         local v80 = p37.Player.PlayerGui:FindFirstChild("GameGui");
         v80.headsUpDisplay.ConstructStatus.Visible = false;
         local v81 = v80.headsUpDisplay.Cursor.crossHair;
         v80.scopeScreen.Visible = false;
         v81.Visible = false;
         p37.characterLookAt:Disconnect();
         p37.characterLookAt = nil;
         local v82 = {
             "Perspective",
             "Melee",
             "Aim",
             "Shoot",
             "Reload",
             "Throw",
             "Dig",
             "HealAlly",
             "HealSelf",
             "Whistle",
             "Next",
             "Back",
             "Artillery",
             "Spot",
             "Build",
             "PlacingMode"
         };
         local v83, v84, v85 = pairs((u3:GetAllBoundActionInfo()));
         local v86 = v83;
         local v87 = v84;
         local v88 = v85;
         while true do
             local v89, v90 = v86(v87, v88);
             local v91 = v89;
             if (v89) then
                 break;
             end
             v88 = v91;
             local v92, v93, v94 = ipairs(v82);
             local v95 = v92;
             local v96 = v93;
             local v97 = v94;
             while true do
                 local v98, v99 = v95(v96, v97);
                 local v100 = v98;
                 local v101 = v99;
                 if (v98) then
                     break;
                 end
                 v97 = v100;
                 if (v91 == v101) then
                     u3:UnbindAction(v91);
                 end
             end
         end
         local v102, v103, v104 = pairs(p37.resetBool);
         local v105 = v102;
         local v106 = v103;
         local v107 = v104;
         while true do
             local v108, v109 = v105(v106, v107);
             local v110 = v108;
             if (v108) then
                 break;
             end
             v107 = v110;
             p37.resetBool[v110] = false;
         end
         u9.Perspective:Fire(p37);
         u10.Equip:FireServer(p37, "Unequip");
         u13.stopListAnimations(p37.animationList);
         return;
     end
     u2.MouseIconEnabled = false;
     local v111 = p37.Player.PlayerGui:FindFirstChild("GameGui");
     p37.Tool:SetAttribute("Aiming", false);
     p37.Player.PlayerScripts.PlayerModule.CameraModule.CameraInput:SetAttribute("Aim", false);
     p37.Character = p37.Player.Character;
     p37.Sounds = p37.Tool.Hold:FindFirstChild("Sounds");
     if (p37.Tool.Hold:FindFirstChild("MeleeTrail")) then
         p37.meleeTrail = p37.Tool.Hold:FindFirstChild("MeleeTrail");
     end
     if (p37.RecoilPattern) then
         local v112 = p37.Tool:GetAttribute("Recoil") * 10;
         p37.RecoilPattern = {
             {
                 1,
                 v112,
                 -1,
                 0.77,
                 -0.1
             },
             {
                 6,
                 v112 / 2,
                 -1,
                 0.77,
                 (-1 * v112) / 15
             },
             {
                 11,
                 v112 / 2,
                 -1,
                 0.77,
                 v112 / 15
             }
         };
     end
     u10.Equip:FireServer(p37, "Equip");
     u9.Perspective:Fire(p37);
     u13.hapticFeedBack("motorCheck", p37);
     local v113 = p37.Tool.Hold;
     local t_Hold_17 = v113;
     local v114 = p37.Tool:GetAttribute("ToolType");
     if ((v114 == "Grenade") and (not v113:FindFirstChild("AimBeam"))) then
         local v115 = u1.Particles.AimBeam:Clone();
         v115.Parent = t_Hold_17;
         v115.Attachment0 = t_Hold_17.BeamStart;
         v115.Attachment1 = t_Hold_17.BeamEnd;
     end
     local t_characterLookAt_18 = p37.characterLookAt;
     if (t_characterLookAt_18 == nil) then
         local u22 = tick();
         local v116 = u12.RenderStepped;
         local u23 = p37;
         local u24 = t_animationList_16;
         local u25 = v111;
         local u26 = t_Hold_17;
         p37.characterLookAt = v116:Connect(function() -- [line 433] anonymous function
             --[[
                 Upvalues: 
                     [1] = u23
                     [2] = u22
                     [3] = u10
                     [4] = u24
                     [5] = u13
                     [6] = u25
                     [7] = u26
                     [8] = f_beamProjectile
                     [9] = u1
                     [10] = u7
                     [11] = u6
             --]]
             local t_Parent_19 = u23.Tool.Parent;
             if (t_Parent_19 ~= u23.Character) then
                 return;
             end
             local v117 = Crosshair(u23, u23.Camera);
             u23.Character.UpperTorso.Waist.C0 = CFrame.new(0, 0.2, 0) * CFrame.Angles(math.asin((v117 - u23.Camera.CFrame.Position).Unit.y), 0, 0);
             if ((tick() - u22) > 0.4) then
                 u22 = tick();
                 u10.LookAngle:FireServer(u23, v117 - u23.Camera.CFrame.Position);
                 local v118 = u23.Tool:GetAttribute("ToolType");
                 if (v118 == "Bolt Action") then
                     local t_Cycle_20 = u23.Cycle;
                     if (t_Cycle_20 == true) then
                         local t_IsPlaying_21 = u24.boltCycleAnimation.IsPlaying;
                         if (t_IsPlaying_21 == false) then
                             local t_IsPlaying_22 = u24.equipAnimation.IsPlaying;
                             if (t_IsPlaying_22 == true) then
                                 local t_IsPlaying_23 = u24.runAnimation.IsPlaying;
                                 if (t_IsPlaying_23 == false) then
                                     local v119 = u23.Character.Humanoid:GetAttribute("Sprinting");
                                     if (v119 == false) then
                                         u13.boltCycleAction(u23);
                                     end
                                 end
                             end
                         end
                     end
                 end
             end
             local v120 = RaycastParams.new();
             v120.CollisionGroup = "Players";
             v120.IgnoreWater = true;
             v120.FilterType = Enum.RaycastFilterType.Blacklist;
             v120.FilterDescendantsInstances = {
                 u23.Character
             };
             local v121 = workspace:Raycast(u23.Character.HumanoidRootPart.Position, (v117 - u23.Character.HumanoidRootPart.Position).Unit * 8, v120);
             local v122 = v121;
             if (v121) then
                 local v123 = v122.Instance:FindFirstAncestorWhichIsA("Model");
                 if (v123) then
                     if (not v123:FindFirstChild("HP")) then
                         v123 = v123.Parent;
                     end
                     local v124 = false;
                     if (v123:FindFirstAncestor("Constructs")) then
                         local t_Name_24 = v123.Name;
                         if (t_Name_24 == "PreviewConstruct") then
                             v124 = true;
                         else
                             u25.headsUpDisplay.ConstructStatus.Visible = true;
                             u25.headsUpDisplay.ConstructStatus.ConstructName.Text = v123.Name;
                             u25.headsUpDisplay.ConstructStatus.ConstructHP.Text = tostring(math.round((v123.HP.Value / v123.MaxHP.Value) * 100)) .. "%";
                         end
                     else
                         v124 = true;
                     end
                     if (v124) then
                         u25.headsUpDisplay.ConstructStatus.Visible = false;
                     end
                 else
                     u25.headsUpDisplay.ConstructStatus.Visible = false;
                 end
             else
                 u25.headsUpDisplay.ConstructStatus.Visible = false;
             end
             local v125 = u23.Tool:GetAttribute("ToolType");
             if (v125 ~= "Grenade") then
                 local v126 = u23.Tool:GetAttribute("ToolType");
                 if (v126 == "Hammer") then
                     local t_BuildMode_26 = u23.BuildMode;
                     if (t_BuildMode_26 == true) then
                         local v127 = (u23.Character.HumanoidRootPart.CFrame.LookVector * 7.5) + u23.Character.HumanoidRootPart.Position;
                         local v128 = RaycastParams.new();
                         v128.CollisionGroup = "ConstructGroundRay";
                         v128.IgnoreWater = true;
                         v128.FilterType = Enum.RaycastFilterType.Blacklist;
                         v128.FilterDescendantsInstances = {
                             u23.Character
                         };
                         local v129 = workspace:Raycast(v127, (Vector3.new(v127.X, v127.Y - 25, v127.Z) - v127).Unit * 25, v128);
                         local v130 = BrickColor.new("Lime green");
                         if (v129 == nil) then
                             v130 = BrickColor.new("Really red");
                         end
                         local v131 = workspace.Constructs:FindFirstChild("PreviewConstruct");
                         local v132 = v131;
                         if (v131) then
                             local t_Value_27 = v132.ConstructName.Value;
                             if (t_Value_27 ~= u23.Tool.Name) then
                                 v132:Destroy();
                                 return;
                             end
                             if (v129) then
                                 v132:PivotTo(CFrame.new(v129.Position.X, v129.Position.Y + (v132.PrimaryPart.Size.Y / 2), v129.Position.Z) * u23.Character.HumanoidRootPart.CFrame.Rotation);
                             end
                             local v133 = OverlapParams.new();
                             v133.CollisionGroup = "ConstructBoundingBox";
                             v133.MaxParts = 0;
                             v133.FilterType = Enum.RaycastFilterType.Blacklist;
                             v133.FilterDescendantsInstances = {};
                             if ((#workspace:GetPartsInPart(v132.BoundingBox, v133)) > 1) then
                                 v130 = BrickColor.new("Really red");
                             end
                             local v134, v135, v136 = pairs(v132:GetDescendants());
                             local v137 = v134;
                             local v138 = v135;
                             local v139 = v136;
                             while true do
                                 local v140, v141 = v137(v138, v139);
                                 local v142 = v140;
                                 local v143 = v141;
                                 if (v140) then
                                     break;
                                 end
                                 v139 = v142;
                                 if (v143:IsA("BasePart")) then
                                     local t_Transparency_28 = v143.Transparency;
                                     if (t_Transparency_28 ~= 1) then
                                         v143.BrickColor = v130;
                                         v143.Transparency = 0.5;
                                         v143.Material = Enum.Material.SmoothPlastic;
                                         v143.CanCollide = false;
                                     end
                                 end
                             end
                             return;
                         end
                         local t_Name_29 = u23.Tool.Name;
                         local v144;
                         if (t_Name_29 == "HMG") then
                             v144 = u1.SapperConstructs:FindFirstChild(u23.Player.Team.Name .. "HMG").Value:Clone();
                             v144.Name = "HMG";
                         else
                             local t_Name_30 = u23.Tool.Name;
                             if (t_Name_30 == "HMG Shielded") then
                                 v144 = u1.SapperConstructs.HMG:FindFirstChild(u1.SapperConstructs:FindFirstChild(u23.Player.Team.Name .. "HMG").Value.Name .. " Shielded"):Clone();
                                 v144.Name = "HMG Shielded";
                             else
                                 v144 = u1.SapperConstructs.Universal:FindFirstChild(u23.Tool.Name):Clone();
                             end
                         end
                         if (v144) then
                             local v145 = Instance.new("StringValue");
                             v145.Name = "ConstructName";
                             v145.Value = v144.Name;
                             v145.Parent = v144;
                             v144.Name = "PreviewConstruct";
                             v144.Parent = workspace.Constructs;
                             return;
                         end
                     end
                 else
                     local v146 = u23.Tool:GetAttribute("ToolType");
                     if (v146 == "Binoculars") then
                         local v147 = workspace:FindFirstChild("LocationPart");
                         local v148 = u23.Tool:GetAttribute("Aiming");
                         if ((v148 == true) and (v147 == nil)) then
                             local v149 = RaycastParams.new();
                             v149.CollisionGroup = "Projectiles";
                             v149.IgnoreWater = true;
                             v149.FilterType = Enum.RaycastFilterType.Blacklist;
                             v149.FilterDescendantsInstances = {
                                 u23.Character
                             };
                             local v150 = v117;
                             local v151 = workspace:Raycast(v150, (Vector3.new(v117.X, v117.Y - 100, v117.Z) - v150).Unit * 750, v149);
                             local v152 = v151;
                             if (v151) then
                                 local v153 = false;
                                 local v154 = Instance.new("Part");
                                 local v155 = v154;
                                 u7:SetPartCollisionGroup(v154, "NoCollision");
                                 v154.Name = "LocationPart";
                                 v154.Transparency = 0.5;
                                 v154.Material = Enum.Material.Neon;
                                 local t_Magnitude_31 = (u23.Character.HumanoidRootPart.Position - v117).Magnitude;
                                 if (t_Magnitude_31 <= 100) then
                                     v153 = true;
                                 else
                                     local v156 = tick() - u23.Player:GetAttribute("ArtilleryCD");
                                     if (v156 <= 90) then
                                         v153 = true;
                                     else
                                         v155.Color = Color3.fromRGB(0, 255, 0);
                                     end
                                 end
                                 if (v153) then
                                     v155.Color = Color3.fromRGB(255, 0, 0);
                                 end
                                 v155.Size = Vector3.new(4, 4, 4);
                                 v155.Shape = Enum.PartType.Ball;
                                 v155.Anchored = true;
                                 v155.Parent = workspace;
                                 v155.Position = v152.Position;
                                 u6:AddItem(v155, 0.1);
                             end
                         end
                     end
                 end
                 return;
             end
             local v157 = u23.Tool:GetAttribute("Aiming");
             if (not ((v157 == true) and u26:FindFirstChild("AimBeam"))) then
                 u26.AimBeam.Enabled = false;
                 return;
             end
             u26.AimBeam.Enabled = true;
             local v158 = u23.Character:FindFirstChild("HumanoidRootPart");
             local v159 = v158;
             local v160 = (v158.Position - v117).Magnitude;
             local t_Magnitude_25 = v160;
             local v161 = v160 / 80;
             if (v160 >= 80) then
                 v161 = 1;
                 v117 = v159.Position:Lerp(v117, (t_Magnitude_25 - (t_Magnitude_25 - 80)) / t_Magnitude_25);
             end
             local v162 = Vector3.new(0, -game.Workspace.Gravity, 0);
             local v163 = v159.CFrame * Vector3.new(0, 2, -2);
             local v164, v165, v166, v167 = f_beamProjectile(v162, ((v117 - v163) - (((0.5 * v162) * v161) * v161)) / v161, v163, v161);
             u26.AimBeam.CurveSize0 = v164;
             u26.AimBeam.CurveSize1 = v165;
             u26.BeamStart.CFrame = u26.BeamStart.Parent.CFrame:inverse() * v166;
             u26.BeamEnd.CFrame = u26.BeamEnd.Parent.CFrame:inverse() * v167;
         end);
     end
     local v168 = v111.headsUpDisplay;
     local t_headsUpDisplay_32 = v168;
     local t_mobileControls_33 = v111.mobileControls;
     v168.controlListPC.Text = "";
     v168.controlListConsole.Text = "";
     local v169 = p37.Player.PlayerScripts:FindFirstChild("PlayerClient");
     local v170, v171, v172 = pairs(p37.actionBinds);
     local v173 = v170;
     local v174 = v171;
     local v175 = v172;
     while true do
         local v176, v177 = v173(v174, v175);
         local v178 = v176;
         local v179 = v177;
         if (v176) then
             break;
         end
         v175 = v178;
         local v180 = #v179;
         if (v180 == 4) then
             u3:BindAction(v178, p37.handleAction, v179[1], v179[2], v179[3], v179[4]);
         else
             if (v180 == 5) then
                 u3:BindAction(v178, p37.handleAction, v179[1], v179[2], v179[3], v179[4], v179[5]);
             else
                 u3:BindAction(v178, p37.handleAction, v179[1], v179[2], v179[3]);
             end
         end
         if (v111 and v169) then
             local v181 = v169:GetAttribute("ControlList");
             if (v181 == true) then
                 local v182 = nil;
                 local v184, v183;
                 if ((v178 == "Aim") or ((v178 == "Melee") and p37.Tool:GetAttribute("CanFire"))) then
                     v183 = string.gsub(tostring(v179[2]) .. ("-" .. (v178 .. "\n")), "Enum.", "");
                     v184 = string.gsub(tostring(v179[4]) .. ("-" .. (v178 .. "\n")), "Enum.", "");
                     v182 = string.gsub(string.gsub(string.gsub(tostring(v179[3]) .. ("-" .. (v178 .. "\n")), "Enum.", ""), "KeyCode.", ""), "UserInputType.", "");
                 else
                     v183 = string.gsub(tostring(v179[2]) .. ("-" .. (v178 .. "\n")), "Enum.", "");
                     v184 = string.gsub(tostring(v179[3]) .. ("-" .. (v178 .. "\n")), "Enum.", "");
                 end
                 local v185 = string.gsub(v183, "KeyCode.", "");
                 local v186 = string.gsub(v184, "KeyCode.", "");
                 local v187 = string.gsub(v185, "UserInputType.", "");
                 local v188 = string.gsub(v186, "UserInputType.", "");
                 t_headsUpDisplay_32.controlListPC.Text = t_headsUpDisplay_32.controlListPC.Text .. v187;
                 if (v182 ~= nil) then
                     t_headsUpDisplay_32.controlListPC.Text = t_headsUpDisplay_32.controlListPC.Text .. v182;
                 end
                 t_headsUpDisplay_32.controlListConsole.Text = t_headsUpDisplay_32.controlListConsole.Text .. v188;
             end
         end
         u3:SetTitle(v178, v178);
         local u27 = v178;
         local u28 = v179;
         local u29 = t_mobileControls_33;
         coroutine.wrap(function() -- [line 675] anonymous function
             --[[
                 Upvalues: 
                     [1] = u3
                     [2] = u27
                     [3] = u28
                     [4] = u29
                     [5] = u8
             --]]
             local v189 = u3:GetButton(u27);
             local v190 = v189;
             if (v189) then
                 local v191;
                 if (string.match(tostring(u28[2]), "MouseButton1")) then
                     v191 = u29:FindFirstChild("Primary");
                 else
                     local v192 = u27;
                     if (v192 == "PlacingMode") then
                         v191 = u29:FindFirstChild("Reload");
                     else
                         local v193 = false;
                         if (string.match(tostring(u28[2]), "MouseButton2")) then
                             v193 = true;
                         else
                             local v194 = u27;
                             if (v194 == "Next") then
                                 v193 = true;
                             else
                                 local v195 = false;
                                 if (string.match(tostring(u28[2]), "MouseButton3")) then
                                     v195 = true;
                                 else
                                     local v196 = u27;
                                     if (v196 == "Back") then
                                         v195 = true;
                                     else
                                         local v197 = u27;
                                         if (v197 == "Spot") then
                                             v195 = true;
                                         else
                                             v191 = u29:FindFirstChild(u27);
                                         end
                                     end
                                 end
                                 if (v195) then
                                     v191 = u29:FindFirstChild("Tertiary");
                                 end
                             end
                         end
                         if (v193) then
                             v191 = u29:FindFirstChild("Secondary");
                         end
                     end
                 end
                 if (v191) then
                     u8.setTouchButton(v190, v191, u27);
                 end
             end
         end)();
     end
     local v198 = t_headsUpDisplay_32.AbsoluteSize;
     local v199 = math.round((t_headsUpDisplay_32.AbsoluteSize.X / 16.25) / 50) * 50;
     t_headsUpDisplay_32.Cursor.crossHair.Size = UDim2.new(0, v199, 0, v199);
     t_headsUpDisplay_32.Cursor.crossHair.Visible = true;
     t_headsUpDisplay_32.Cursor.turretCrossHair.Size = UDim2.new(0, v199, 0, v199);
     local t_LoadedAnimations_34 = p37.LoadedAnimations;
     if (t_LoadedAnimations_34 ~= true) then
         p37.LoadedAnimations = true;
         local v200, v201, v202 = ipairs(p37.Tool:WaitForChild("Animations"):GetChildren());
         local v203 = v200;
         local v204 = v201;
         local v205 = v202;
         while true do
             local v206, v207 = v203(v204, v205);
             local v208 = v206;
             local v209 = v207;
             if (v206) then
                 break;
             end
             v205 = v208;
             p37.animationList[v209.Name .. "Animation"] = v209;
         end
         local v210, v211, v212 = pairs(p37.animationList);
         local v213 = v210;
         local v214 = v211;
         local v215 = v212;
         while true do
             local v216, v217 = v213(v214, v215);
             local v218 = v216;
             local v219 = v217;
             if (v216) then
                 break;
             end
             v215 = v218;
             p37.animationList[v218] = p37.Character.Humanoid.Animator:LoadAnimation(v219);
         end
         u13.toolSprintingAnimation(p37, "changeSignal");
         local t_LoadedEvents_35 = p37.LoadedEvents;
         if (t_LoadedEvents_35 ~= true) then
             p37.LoadedEvents = true;
             u13.loadEvents(p37);
         end
     end
     u13.playAnimation(p37, p37.animationList.equipAnimation, 5);
 end;
 u13.Equip = f_Equip;
 local f_Melee;
 f_Melee = function(p39) -- [line 792] Melee
     --[[
         Upvalues: 
             [1] = u13
     --]]
     local v220 = p39.animationList;
     local t_animationList_36 = v220;
     p39.resetBool.meleeHoldRepeat = true;
     if (v220.meleeAnimation.IsPlaying) then
         return;
     end
     if (t_animationList_36.equipAnimation.IsPlaying or t_animationList_36.runAnimation.IsPlaying) then
         u13.stopListAnimations(t_animationList_36);
         u13.playAnimation(p39, t_animationList_36.meleeAnimation);
     end
 end;
 u13.Melee = f_Melee;
 local u30 = TweenInfo.new(0.2, Enum.EasingStyle.Sine, Enum.EasingDirection.Out, 0, false, 0);
 local f_FirstPersonFPCheck;
 f_FirstPersonFPCheck = function(p40, p41) -- [line 811] FirstPersonFPCheck
     local v221 = p40.Camera;
     local t_Camera_37 = v221;
     if (v221) then
         local t_Name_38 = t_Camera_37.CameraType.Name;
         if (t_Name_38 == "Scriptable") then
             return false;
         end
         local t_Magnitude_39 = (t_Camera_37.Focus.Position - t_Camera_37.CFrame.Position).Magnitude;
         if (t_Magnitude_39 < 1) then
             local v222 = p40.Character:FindFirstChild("Shield");
             local v223 = v222;
             if (v222) then
                 if (p41 == true) then
                     v223.DaigreShield.Transparency = 0.75;
                     return;
                 end
                 v223.DaigreShield.Transparency = 0;
             end
         end
     end
 end;
 u13.FirstPersonFPCheck = f_FirstPersonFPCheck;
 local f_Aim;
 f_Aim = function(p42, p43, p44) -- [line 839] Aim
     --[[
         Upvalues: 
             [1] = u13
             [2] = u9
             [3] = u5
             [4] = u30
     --]]
     local t_animationList_40 = p42.animationList;
     local v224 = p42.Character.Humanoid:GetAttribute("Sprinting");
     if (v224 == true) then
         return;
     end
     local v225 = nil;
     local v226 = p42.Player.PlayerGui:FindFirstChild("GameGui");
     local v227 = v226;
     local v228 = p42.Player.PlayerScripts:FindFirstChild("PlayerClient");
     local t_crossHair_41 = v226.headsUpDisplay.Cursor.crossHair;
     local t_scopeScreen_42 = v226.scopeScreen;
     if (p43 ~= nil) then
         if (p43 ~= nil) then
             local v229 = p42.Player.PlayerGui:FindFirstChild("ContextActionGui");
             local v230 = v229;
             if (v229 and p42.Player.PlayerScripts:FindFirstChild("PlayerClient")) then
                 local t_Visible_47 = v230.ContextButtonFrame.Visible;
                 if (t_Visible_47 == true) then
                     return;
                 end
             end
             u13.FirstPersonFPCheck(p42, false);
             p42.Tool:SetAttribute("Aiming", false);
             if (p42.Tool:FindFirstChild("scopeReticle")) then
                 local v231 = p42.Tool:GetAttribute("ToolType");
                 if (v231 == "Binoculars") then
                     u9.Perspective:Fire(p42, "Previous");
                 end
             end
             p42.Player.PlayerScripts.PlayerModule.CameraModule.CameraInput:SetAttribute("Aim", false);
             if (v227) then
                 t_scopeScreen_42.Visible = false;
                 t_crossHair_41.Visible = true;
             end
             if (t_animationList_40.aimAnimation.IsPlaying) then
                 u13.stopAnimation(t_animationList_40.aimAnimation);
                 u13.freezeAnimationAtTime(p42, t_animationList_40.equipAnimation);
             end
         end
         return;
     end
     if (t_animationList_40.reloadAnimation and t_animationList_40.reloadAnimation.IsPlaying) then
         return;
     end
     local v232 = p42.Tool:GetAttribute("ToolType");
     if (v232 == "Bolt Action") then
         local t_Cycle_43 = p42.Cycle;
         if (t_Cycle_43 ~= true) then
             local t_IsPlaying_44 = t_animationList_40.boltCycleAnimation.IsPlaying;
             if (t_IsPlaying_44 == true) then
             end
         end
         return;
     end
     local v233 = p42.Tool:GetAttribute("Aiming");
     if ((v233 == true) and (p44 == nil)) then
         local v234 = p42.Player.PlayerGui:FindFirstChild("ContextActionGui");
         local v235 = v234;
         if (v234 and v228) then
             local t_Visible_45 = v235.ContextButtonFrame.Visible;
             if (t_Visible_45 == true) then
                 u13.FirstPersonFPCheck(p42, false);
                 p42.Tool:SetAttribute("Aiming", false);
                 if (p42.Tool:FindFirstChild("scopeReticle")) then
                     local v236 = p42.Tool:GetAttribute("ToolType");
                     if (v236 == "Binoculars") then
                         u9.Perspective:Fire(p42, "Previous");
                     end
                 end
                 p42.Player.PlayerScripts.PlayerModule.CameraModule.CameraInput:SetAttribute("Aim", false);
                 if (v227) then
                     t_scopeScreen_42.Visible = false;
                     t_crossHair_41.Visible = true;
                 end
                 if (t_animationList_40.aimAnimation.IsPlaying) then
                     u13.stopAnimation(t_animationList_40.aimAnimation);
                     u13.freezeAnimationAtTime(p42, t_animationList_40.equipAnimation);
                 end
                 return;
             end
         end
     end
     u13.FirstPersonFPCheck(p42, true);
     p42.Tool:SetAttribute("Aiming", true);
     if (p42.Tool:FindFirstChild("scopeReticle")) then
         local v237 = p42.Tool:GetAttribute("ToolType");
         if (v237 == "Binoculars") then
             u9.Perspective:Fire(p42, "Top");
         end
     end
     p42.Player.PlayerScripts.PlayerModule.CameraModule.CameraInput:SetAttribute("Aim", true);
     u13.speedChanger(p42.Character.Humanoid);
     u13.stopListAnimations(t_animationList_40);
     u13.playAnimation(p42, t_animationList_40.aimAnimation);
     if (p42.Tool:GetAttribute("aimFOVScope")) then
         local v238 = p42.Tool:GetAttribute("ToolType");
         if (v238 == "Binoculars") then
             local v239 = {};
             v239.FieldOfView = p42.Tool:GetAttribute("aimFOVScope");
             v225 = v239;
             u9.Scope:Fire(p42.Tool);
             t_scopeScreen_42.Visible = true;
             t_crossHair_41.Visible = false;
         else
             local v240 = Crosshair(p42, p42.Camera);
             local v241 = v240;
             if (v240) then
                 local t_Magnitude_46 = (p42.Character.HumanoidRootPart.Position - v241).Magnitude;
                 if (t_Magnitude_46 < 100) then
                     local v242 = {};
                     v242.FieldOfView = p42.Tool:GetAttribute("aimFOV");
                     v225 = v242;
                     t_scopeScreen_42.Visible = false;
                     t_crossHair_41.Visible = true;
                 else
                     if (v227) then
                         local v243 = {};
                         v243.FieldOfView = p42.Tool:GetAttribute("aimFOVScope");
                         v225 = v243;
                         u9.Scope:Fire(p42.Tool);
                         t_scopeScreen_42.Visible = true;
                         t_crossHair_41.Visible = false;
                     end
                 end
             end
         end
     else
         local v244 = {};
         v244.FieldOfView = p42.Tool:GetAttribute("aimFOV");
         v225 = v244;
         t_scopeScreen_42.Visible = false;
         t_crossHair_41.Visible = true;
     end
     u5:Create(p42.Camera, u30, v225):Play();
 end;
 u13.Aim = f_Aim;
 local f_lerp;
 f_lerp = function(p45, p46, p47) -- [line 994] lerp
     return (p45 * (1 - p47)) + (p46 * p47);
 end;
 local f_Recoil;
 f_Recoil = function(p48) -- [line 998] Recoil
     --[[
         Upvalues: 
             [1] = u12
     --]]
     local v245;
     if ((tick() - p48.lastClick) >= 0.5) then
         v245 = 1;
     else
         v245 = p48.currentShots + 1;
     end
     p48.currentShots = v245;
     p48.lastClick = tick();
     local t_currentShots_48 = p48.currentShots;
     if (t_currentShots_48 == 1) then
         local g_spawn_49 = spawn;
         local u31 = p48;
         g_spawn_49(function() -- [line 1002] anonymous function
             --[[
                 Upvalues: 
                     [1] = u31
                     [2] = u12
             --]]
             task.wait(0.1);
             local v246 = -0.5 * (u31.Tool:GetAttribute("Recoil") * 8);
             local v247 = v246;
             local v248 = 0.5 * v246;
             while (v247 <= -0.01) do
                 v248 = v248 / 1.5;
                 v247 = v247 - v248;
                 u31.Camera.CFrame = u31.Camera.CFrame * CFrame.Angles(math.rad(v248), 0, 0);
                 u12.RenderStepped:Wait();
             end
         end);
     else
         p48.currentShots = p48.currentShots + math.round((math.random()));
     end
     if (p48.currentShots > 11) then
         p48.currentShots = 2;
     end
     local v249, v250, v251 = pairs(p48.RecoilPattern);
     local v252 = v249;
     local v253 = v250;
     local v254 = v251;
     while true do
         local v255, v256 = v252(v253, v254);
         local v257 = v255;
         local v258 = v256;
         if (v255) then
             return;
         end
         v254 = v257;
         local t_currentShots_50 = p48.currentShots;
         if (t_currentShots_50 < v258[1]) then
             local g_spawn_51 = spawn;
             local u32 = v258;
             local u33 = p48;
             g_spawn_51(function() -- [line 1035] anonymous function
                 --[[
                     Upvalues: 
                         [1] = u32
                         [2] = u33
                         [3] = u12
                 --]]
                 local v259 = 0;
                 while (math.abs(v259 - u32[2]) >= 0.01) do
                     local v260 = v259;
                     local v261 = u32[2];
                     local v262 = u32[4];
                     v259 = (v260 * (1 - v262)) + (v261 * v262);
                     local v263 = v259 / 10;
                     u33.Camera.CFrame = u33.Camera.CFrame * CFrame.Angles(math.rad(v263), math.rad(v263 * u32[5]), 0);
                     u12.RenderStepped:Wait();
                 end
                 while (math.abs(v259 - u32[3]) >= 0.01) do
                     local v264 = v259;
                     local v265 = u32[3];
                     local v266 = u32[4];
                     v259 = (v264 * (1 - v266)) + (v265 * v266);
                     local v267 = v259 / 10;
                     u33.Camera.CFrame = u33.Camera.CFrame * CFrame.Angles(math.rad(v267), math.rad(v267 * u32[5]), 0);
                     u12.RenderStepped:Wait();
                 end
             end);
             return;
         end
     end
 end;
 local f_ParticleTimeEnable;
 f_ParticleTimeEnable = function(p49) -- [line 1092] ParticleTimeEnable
     p49.Enabled = true;
     task.wait(0.1);
     p49.Enabled = false;
 end;
 local u34 = Random.new();
 local u35 = math.pi * 2;
 local f_shootEffect;
 f_shootEffect = function(p50) -- [line 1101] shootEffect
     --[[
         Upvalues: 
             [1] = u34
             [2] = u35
             [3] = u10
             [4] = u6
             [5] = f_Recoil
             [6] = f_ParticleTimeEnable
     --]]
     local v268 = p50.Tool.Hold:FindFirstChild("Effects");
     local v269 = p50.Tool:GetAttribute("ToolType");
     if (v269 == "Bolt Action") then
         p50.Cycle = true;
     end
     local v270 = Crosshair(p50, p50.Camera);
     local v271 = v270;
     local v272 = CFrame.new(Vector3.new(), (v270 - p50.Character.Head.Position).Unit);
     local t_Magnitude_52 = p50.Character.HumanoidRootPart.Velocity.Magnitude;
     local v273 = (1 / p50.Tool:GetAttribute("SpreadDefault")) / 6;
     local v274 = p50.Tool:GetAttribute("Aiming");
     if (((not (v274 == nil)) and (v274 == true)) and (t_Magnitude_52 < ((p50.Character.Humanoid:GetAttribute("DefaultWalkSpeed") / 2) + 2))) then
         v273 = 0;
     end
     local v275;
     if (p50.Tool:FindFirstChild("Bloom")) then
         v275 = p50.Tool.Bloom.Value;
     else
         v275 = p50.Tool:GetAttribute("SpreadDefault");
     end
     local v276 = false;
     local v277 = (v275 + v273) + (t_Magnitude_52 / p50.Character.Humanoid:GetAttribute("DefaultWalkSpeed"));
     local v278 = RaycastParams.new();
     local v279 = v278;
     v278.CollisionGroup = "Projectiles";
     v278.IgnoreWater = true;
     v278.FilterType = Enum.RaycastFilterType.Blacklist;
     v278.FilterDescendantsInstances = {
         p50.Character
     };
     local v280 = p50.Player.PlayerScripts:FindFirstChild("PlayerClient");
     local v281 = p50.Tool:GetAttribute("ToolType");
     if (v281 == "Flamethrower") then
         v276 = true;
     else
         local v282 = p50.Tool:GetAttribute("ToolType");
         if (v282 == "Flaregun") then
             v276 = true;
         else
             local t_Position_53 = p50.Character.Head.Position;
             local v283 = 0;
             local v284 = {};
             local v285 = 1;
             local v286 = p50.Tool:GetAttribute("Projectiles");
             local v287 = v286;
             local v288 = v285;
             if (not (v286 <= v288)) then
                 while true do
                     local v289 = workspace:Raycast(t_Position_53, ((v272 * CFrame.fromOrientation(0, 0, u34:NextNumber(0, u35))) * CFrame.fromOrientation(math.rad(u34:NextNumber(0, v277)), 0, 0)).LookVector.Unit * 100, v279);
                     local v290 = v289;
                     if (v289 and v289.Instance.Parent:FindFirstChild("Humanoid")) then
                         v283 = v283 + 1;
                         local v291 = {};
                         v291.Instance = v290.Instance;
                         v291.Position = v290.Position;
                         v291.Normal = v290.Normal;
                         v291.Material = v290.Material;
                         table.insert(v284, v291);
                     end
                     local v292 = v285 + 1;
                     v285 = v292;
                     local v293 = v287;
                     if (v293 < v292) then
                         break;
                     end
                 end
             end
             local v294 = 0;
             if (v283 <= p50.Tool:GetAttribute("Projectiles")) then
                 v294 = p50.Tool:GetAttribute("Projectiles") - v283;
             end
             u10.Shoot:FireServer(p50, v271, p50.Tool:GetAttribute("Aiming"), v294, v284);
         end
     end
     if (v276) then
         u10.Shoot:FireServer(p50, v271);
     end
     local v295 = p50.Sounds.Shoot:Clone();
     v295.Parent = p50.Sounds;
     v295:Play();
     u6:AddItem(v295, v295.TimeLength);
     f_Recoil(p50);
     if (not v268) then
         return;
     end
     local v296, v297, v298 = ipairs(v268:GetChildren());
     local v299 = v296;
     local v300 = v297;
     local v301 = v298;
     while true do
         local v302, v303 = v299(v300, v301);
         local v304 = v302;
         local v305 = v303;
         if (v302) then
             break;
         end
         v301 = v304;
         if (v305:IsA("ParticleEmitter")) then
             v305:Emit(p50.Tool:GetAttribute("Recoil") * 10);
         else
             coroutine.wrap(f_ParticleTimeEnable)(v305);
         end
     end
 end;
 local f_shootHeld;
 f_shootHeld = function(p51) -- [line 1210] shootHeld
     --[[
         Upvalues: 
             [1] = u13
     --]]
     task.wait(1 / (p51.Tool:GetAttribute("rateOfFire") / 60));
     p51.clientCanFire = true;
     local t_shootHoldRepeat_54 = p51.resetBool.shootHoldRepeat;
     if (t_shootHoldRepeat_54 == true) then
         local t_clientCanFire_55 = p51.clientCanFire;
         if (t_clientCanFire_55 == true) then
             u13.Shoot(p51);
         end
     end
 end;
 local f_Shoot;
 f_Shoot = function(p52) -- [line 1223] Shoot
     --[[
         Upvalues: 
             [1] = u13
             [2] = f_shootEffect
     --]]
     if (p52.clientCanFire) then
         local t_clientCanFire_56 = p52.clientCanFire;
         if (t_clientCanFire_56 == false) then
             return;
         end
     end
     local t_animationList_57 = p52.animationList;
     p52.resetBool.shootHoldRepeat = true;
     local v306 = p52.Character.Humanoid:GetAttribute("Sprinting");
     if (v306 == true) then
         p52.Character.Humanoid:SetAttribute("Sprinting", false);
         u13.speedChanger(p52.Character.Humanoid);
     end
     if (p52.Tool:FindFirstChild("AmmoLoaded").Value > 1) then
         if (p52.Tool:GetAttribute("rateOfFire")) then
             p52.clientCanFire = false;
             local v307 = p52.Tool:GetAttribute("Aiming");
             if (v307 == true) then
                 u13.playAnimation(p52, t_animationList_57.aimFireAnimation);
                 u13.hapticFeedBack("Small", p52, p52.Tool:GetAttribute("Recoil") / 2);
                 f_shootEffect(p52);
                 u13.hapticFeedBack("Small", p52, 0);
             else
                 u13.stopListAnimations(t_animationList_57);
                 u13.playAnimation(p52, t_animationList_57.hipFireAnimation);
                 u13.hapticFeedBack("Small", p52, p52.Tool:GetAttribute("Recoil"));
                 f_shootEffect(p52);
                 u13.hapticFeedBack("Small", p52, 0);
             end
             task.wait(1 / (p52.Tool:GetAttribute("rateOfFire") / 60));
             p52.clientCanFire = true;
             local t_shootHoldRepeat_58 = p52.resetBool.shootHoldRepeat;
             if (t_shootHoldRepeat_58 == true) then
                 local t_clientCanFire_59 = p52.clientCanFire;
                 if (t_clientCanFire_59 == true) then
                     u13.Shoot(p52);
                     return;
                 end
             end
         else
             local v308 = false;
             local v309 = p52.Tool:GetAttribute("ToolType");
             if (v309 == "Bolt Action") then
                 v308 = true;
             else
                 local v310 = p52.Tool:GetAttribute("ToolType");
                 if (v310 == "Flaregun") then
                     v308 = true;
                 end
             end
             if (v308) then
                 local v311 = p52.Tool:GetAttribute("CanFire");
                 if (v311 ~= false) then
                     if (p52.Cycle) then
                         local t_Cycle_60 = p52.Cycle;
                         if (t_Cycle_60 == true) then
                         end
                     end
                     local v312 = p52.Tool:GetAttribute("ToolType");
                     if (v312 == "Flaregun") then
                         p52.Tool:SetAttribute("CanFire", false);
                     end
                 end
                 return;
             end
             if (t_animationList_57.aimAnimation.IsPlaying) then
                 if (t_animationList_57.aimFireAnimation) then
                     u13.stopListAnimations(t_animationList_57);
                     u13.playAnimation(p52, t_animationList_57.aimFireAnimation);
                 end
                 u13.hapticFeedBack("Small", p52, p52.Tool:GetAttribute("Recoil") / 2);
                 f_shootEffect(p52);
                 u13.hapticFeedBack("Small", p52, 0);
                 return;
             end
             if (t_animationList_57.equipAnimation.IsPlaying) then
                 if (t_animationList_57.hipFireAnimation) then
                     u13.stopListAnimations(t_animationList_57);
                     u13.playAnimation(p52, t_animationList_57.hipFireAnimation);
                 end
                 u13.hapticFeedBack("Small", p52, p52.Tool:GetAttribute("Recoil"));
                 f_shootEffect(p52);
                 u13.hapticFeedBack("Small", p52, 0);
                 return;
             end
         end
     else
         p52.Sounds.Dryfire:Play();
         local v313 = p52.Tool:GetAttribute("ToolType");
         if (v313 ~= "Flaregun") then
             u13.Reload(p52);
         end
     end
 end;
 u13.Shoot = f_Shoot;
 local f_Reload;
 f_Reload = function(p53) -- [line 1299] Reload
     --[[
         Upvalues: 
             [1] = u10
             [2] = u13
     --]]
     local t_animationList_61 = p53.animationList;
     local v314 = p53.Character.Humanoid:GetAttribute("Sprinting");
     if (v314 == true) then
         return;
     end
     local v315 = p53.Tool:FindFirstChild("AmmoLoaded");
     local v316 = v315;
     local t_Value_62 = v315.Value;
     if (t_Value_62 ~= p53.Tool:GetAttribute("AmmoCapacity")) then
         local u36 = false;
         local u37 = p53;
         local u38 = v316;
         local f_speedChecker;
         f_speedChecker = function() -- [line 1306] speedChecker
             --[[
                 Upvalues: 
                     [1] = u36
                     [2] = u37
                     [3] = u10
                     [4] = u38
             --]]
             while true do
                 local v317 = u36;
                 if (v317 == false) then
                     local v318 = u37.Character.Humanoid:GetAttribute("Sprinting");
                     if (v318 == true) then
                         u10.Reload:InvokeServer(u37, "Cancel");
                         return;
                     end
                     local v319 = u36;
                     if (v319 ~= true) then
                         local t_Value_63 = u38.Value;
                         if (t_Value_63 ~= u37.Tool:GetAttribute("AmmoCapacity")) then
                             task.wait(0.1);
                             continue;
                         end
                     end
                 end
                 return;
             end
         end;
         coroutine.wrap(f_speedChecker)();
         local v320 = p53.Tool:GetAttribute("ToolType");
         if (((not (v320 == "Flamethrower")) and t_animationList_61.equipAnimation.IsPlaying) and (not t_animationList_61.reloadAnimation.IsPlaying)) then
             u13.stopListAnimations(t_animationList_61);
             u13.playAnimation(p53, t_animationList_61.reloadAnimation, 10);
             local v321 = u10.Reload:InvokeServer(p53);
             if (v321 == true) then
                 u13.stopAnimation(t_animationList_61.reloadAnimation);
             end
         end
     end
 end;
 u13.Reload = f_Reload;
 local f_hapticFeedBack;
 f_hapticFeedBack = function(p54, p55, p56) -- [line 1358] hapticFeedBack
     --[[
         Upvalues: 
             [1] = u4
     --]]
     if (p54 == "motorCheck") then
         p55.isVibrationSupported = u4:IsVibrationSupported(Enum.UserInputType.Gamepad1);
         if (p55.isVibrationSupported) then
             p55.hapticLarge = u4:IsMotorSupported(Enum.UserInputType.Gamepad1, Enum.VibrationMotor.Large);
             p55.hapticSmall = u4:IsMotorSupported(Enum.UserInputType.Gamepad1, Enum.VibrationMotor.Small);
             p55.hapticLeftTrigger = u4:IsMotorSupported(Enum.UserInputType.Gamepad1, Enum.VibrationMotor.LeftTrigger);
             p55.hapticRightTrigger = u4:IsMotorSupported(Enum.UserInputType.Gamepad1, Enum.VibrationMotor.RightTrigger);
             p55.hapticLeftHand = u4:IsMotorSupported(Enum.UserInputType.Gamepad1, Enum.VibrationMotor.LeftHand);
             p55.hapticRightHand = u4:IsMotorSupported(Enum.UserInputType.Gamepad1, Enum.VibrationMotor.RightHand);
             return;
         end
     else
         local v322 = p55.Player.PlayerScripts:FindFirstChild("PlayerClient"):GetAttribute("HapticFeedback");
         if ((v322 == true) and p55["haptic" .. p54]) then
             u4:SetMotor(Enum.UserInputType.Gamepad1, Enum.VibrationMotor[p54], p56);
         end
     end
 end;
 u13.hapticFeedBack = f_hapticFeedBack;
 local f_MeleeConstructDetection;
 f_MeleeConstructDetection = function(p57) -- [line 1379] MeleeConstructDetection
     --[[
         Upvalues: 
             [1] = u10
     --]]
     local v323 = Crosshair(p57, p57.Camera);
     local v324 = v323;
     local v325 = p57.Character.HumanoidRootPart.CFrame.Position;
     local v326 = (v323 - v325).Unit * 12;
     local v327 = RaycastParams.new();
     v327.CollisionGroup = "Projectiles";
     v327.IgnoreWater = true;
     v327.FilterType = Enum.RaycastFilterType.Blacklist;
     v327.FilterDescendantsInstances = {
         p57.Character
     };
     local v328 = workspace:Raycast(v325, v326, v327);
     local v329 = v328;
     if (v328) then
         local v330 = v329.Instance:FindFirstAncestorWhichIsA("Model");
         if (v330) then
             if (not v330:FindFirstChild("HP")) then
                 v330 = v330.Parent;
             end
             if (v330:FindFirstAncestor("Constructs")) then
                 u10.Melee:FireServer(p57, nil, nil, v324, "Construct");
             end
         end
     end
 end;
 local f_loadEvents;
 f_loadEvents = function(p58) -- [line 1405] loadEvents
     --[[
         Upvalues: 
             [1] = u11
             [2] = u10
             [3] = u13
             [4] = f_MeleeConstructDetection
             [5] = u5
             [6] = u30
     --]]
     local t_animationList_64 = p58.animationList;
     local v331 = RaycastParams.new();
     v331.CollisionGroup = "Projectiles";
     v331.IgnoreWater = true;
     v331.FilterType = Enum.RaycastFilterType.Blacklist;
     v331.FilterDescendantsInstances = {
         p58.Character
     };
     local v332 = u11.new(p58.Tool);
     local v333 = v332;
     v332.Visualizer = false;
     v332.DebugLog = false;
     v332.RaycastParams = v331;
     if (v332) then
         local v334 = v333.OnHit;
         local u39 = p58;
         local v335 = v334:Connect(function(p59, p60, p61) -- [line 1419] anonymous function
             --[[
                 Upvalues: 
                     [1] = u39
                     [2] = u10
             --]]
             if ((not (p60 == u39.Character.Humanoid)) and (p60.Health >= 0)) then
                 local v336 = false;
                 local v337 = false;
                 local v338 = game.Players:GetPlayerFromCharacter(p60.Parent);
                 local v339 = v338;
                 if (v338) then
                     local t_Team_65 = v339.Team;
                     if (t_Team_65 == u39.Player.Team) then
                         v337 = true;
                     else
                         v336 = true;
                     end
                 else
                     v336 = true;
                     v337 = true;
                 end
                 if (v336 == true) then
                     local v340 = u39.Tool:GetAttribute("ToolType");
                     if (v340 ~= "Healing") then
                         u10.Melee:FireServer(u39, p59, p60);
                     end
                 end
                 if (v337 == true) then
                     local v341 = u39.Tool:GetAttribute("ToolType");
                     if (v341 == "Healing") then
                         u10.Heal:FireServer(u39, p59, p60);
                     end
                 end
             end
         end);
     end
     if (t_animationList_64.equipAnimation) then
         local v342 = t_animationList_64.equipAnimation:GetMarkerReachedSignal("EquipSound");
         local u40 = p58;
         local v343 = v342:Connect(function(p62) -- [line 1458] anonymous function
             --[[
                 Upvalues: 
                     [1] = u40
             --]]
             u40.Sounds.Equip:Play();
         end);
         local v344 = t_animationList_64.equipAnimation:GetMarkerReachedSignal("End");
         local u41 = p58;
         local u42 = t_animationList_64;
         local v345 = v344:Connect(function(p63) -- [line 1461] anonymous function
             --[[
                 Upvalues: 
                     [1] = u13
                     [2] = u41
                     [3] = u42
             --]]
             u13.toolSprintingAnimation(u41, u42);
         end);
     end
     if (t_animationList_64.meleeAnimation) then
         local v346 = t_animationList_64.meleeAnimation.Stopped;
         local u43 = v333;
         local u44 = p58;
         local u45 = t_animationList_64;
         local v347 = v346:Connect(function() -- [line 1467] anonymous function
             --[[
                 Upvalues: 
                     [1] = u43
                     [2] = u44
                     [3] = u13
                     [4] = u45
                     [5] = f_MeleeConstructDetection
             --]]
             u43:HitStop();
             if (u44.meleeTrail) then
                 u44.meleeTrail.Enabled = false;
             end
             u13.toolSprintingAnimation(u44, u45);
             local t_meleeHoldRepeat_66 = u44.resetBool.meleeHoldRepeat;
             if (t_meleeHoldRepeat_66 == true) then
                 u13.stopListAnimations(u45);
                 u13.playAnimation(u44, u45.meleeAnimation);
             end
             coroutine.wrap(f_MeleeConstructDetection)(u44);
         end);
         local v348 = t_animationList_64.meleeAnimation:GetMarkerReachedSignal("Melee");
         local u46 = p58;
         local u47 = v333;
         local v349 = v348:Connect(function(p64) -- [line 1478] anonymous function
             --[[
                 Upvalues: 
                     [1] = u46
                     [2] = u47
             --]]
             u46.Sounds.Melee:Play();
             if (u46.meleeTrail) then
                 u46.meleeTrail.Enabled = true;
             end
             u47:HitStart();
         end);
     end
     if (t_animationList_64.hammerAnimation) then
         local v350 = t_animationList_64.hammerAnimation.Stopped;
         local u48 = p58;
         local u49 = t_animationList_64;
         local v351 = v350:Connect(function() -- [line 1489] anonymous function
             --[[
                 Upvalues: 
                     [1] = u13
                     [2] = u48
                     [3] = u49
                     [4] = u10
             --]]
             u13.toolSprintingAnimation(u48, u49);
             local t_meleeHoldRepeat_67 = u48.resetBool.meleeHoldRepeat;
             if (t_meleeHoldRepeat_67 == true) then
                 local v352 = u48.Character.Humanoid:GetAttribute("Sprinting");
                 if (v352 == false) then
                     u13.stopListAnimations(u49);
                     u13.playAnimation(u48, u49.hammerAnimation);
                 end
             end
             local v353 = Crosshair(u48, u48.Camera);
             local v354 = v353;
             if (v353) then
                 local v355 = u10.Hammer:InvokeServer(u48, v354);
                 if (v355 == true) then
                     local v356 = 0;
                     local v357, v358, v359 = pairs(u48.Sounds:GetChildren());
                     local v360 = v357;
                     local v361 = v358;
                     local v362 = v359;
                     while true do
                         local v363, v364 = v360(v361, v362);
                         local v365 = v363;
                         local v366 = v364;
                         if (v363) then
                             break;
                         end
                         v362 = v365;
                         if (v366.Name:find("Hammer")) then
                             v356 = v356 + 1;
                         end
                     end
                     u48.Sounds:FindFirstChild("Hammer" .. math.random(1, v356)):Play();
                 end
             end
         end);
         local v367 = t_animationList_64.hammerAnimation:GetMarkerReachedSignal("Melee");
         local u50 = p58;
         local v368 = v367:Connect(function(p65) -- [line 1513] anonymous function
             --[[
                 Upvalues: 
                     [1] = u50
             --]]
             u50.Sounds.Melee:Play();
         end);
     end
     if (t_animationList_64.aimAnimation) then
         local v369 = t_animationList_64.aimAnimation.Stopped;
         local u51 = p58;
         local v370 = v369:Connect(function() -- [line 1519] anonymous function
             --[[
                 Upvalues: 
                     [1] = u51
                     [2] = u13
                     [3] = u5
                     [4] = u30
             --]]
             local v371 = u51.Player.PlayerGui:FindFirstChild("GameGui");
             local v372 = v371.headsUpDisplay.Cursor.crossHair;
             v371.scopeScreen.Visible = false;
             v372.Visible = true;
             if (u51.Tool:GetAttribute("rateOfFire")) then
                 local v373 = u51.Tool:GetAttribute("Aiming");
                 if (v373 ~= true) then
                     u13.speedChanger(u51.Character.Humanoid, true);
                 end
             else
                 u13.speedChanger(u51.Character.Humanoid, true);
             end
             local v374 = {};
             v374.FieldOfView = 70;
             u5:Create(u51.Camera, u30, v374):Play();
         end);
     end
     if (t_animationList_64.hipFireAnimation) then
         local v375 = t_animationList_64.hipFireAnimation:GetMarkerReachedSignal("BoltBack");
         local u52 = p58;
         local v376 = v375:Connect(function(p66) -- [line 1539] anonymous function
             --[[
                 Upvalues: 
                     [1] = u52
                     [2] = u13
             --]]
             u52.Sounds.BoltBack:Play();
             u13.createShellCase(u52.Character, u52.Tool.Hold.EjectionPort, u52.Tool.Hold.EjectionDirection);
         end);
         local v377 = t_animationList_64.hipFireAnimation:GetMarkerReachedSignal("BoltForward");
         local u53 = p58;
         local v378 = v377:Connect(function(p67) -- [line 1543] anonymous function
             --[[
                 Upvalues: 
                     [1] = u53
             --]]
             u53.Sounds.BoltForward:Play();
         end);
         local v379 = t_animationList_64.hipFireAnimation.Stopped;
         local u54 = p58;
         local u55 = t_animationList_64;
         local v380 = v379:Connect(function() -- [line 1547] anonymous function
             --[[
                 Upvalues: 
                     [1] = u54
                     [2] = u55
                     [3] = u13
             --]]
             local v381 = u54.Tool:GetAttribute("ToolType");
             if (v381 ~= "Bolt Action") then
                 u13.freezeAnimationAtTime(u54, u55.equipAnimation);
                 return;
             end
             local t_IsPlaying_68 = u55.boltCycleAnimation.IsPlaying;
             if (t_IsPlaying_68 == false) then
                 local t_IsPlaying_69 = u55.runAnimation.IsPlaying;
                 if (t_IsPlaying_69 == false) then
                     local v382 = u54.Character.Humanoid:GetAttribute("Sprinting");
                     if (v382 == false) then
                         u13.boltCycleAction(u54);
                         return;
                     end
                 end
             end
             u13.freezeAnimationAtTime(u54, u55.equipAnimation);
         end);
     end
     if (t_animationList_64.aimFireAnimation) then
         local v383 = t_animationList_64.aimFireAnimation:GetMarkerReachedSignal("BoltBack");
         local u56 = p58;
         local v384 = v383:Connect(function(p68) -- [line 1563] anonymous function
             --[[
                 Upvalues: 
                     [1] = u56
                     [2] = u13
             --]]
             u56.Sounds.BoltBack:Play();
             u13.createShellCase(u56.Character, u56.Tool.Hold.EjectionPort, u56.Tool.Hold.EjectionDirection);
         end);
         local v385 = t_animationList_64.aimFireAnimation:GetMarkerReachedSignal("BoltForward");
         local u57 = p58;
         local v386 = v385:Connect(function(p69) -- [line 1567] anonymous function
             --[[
                 Upvalues: 
                     [1] = u57
             --]]
             u57.Sounds.BoltForward:Play();
         end);
         local v387 = t_animationList_64.aimFireAnimation.Stopped;
         local u58 = p58;
         local u59 = t_animationList_64;
         local v388 = v387:Connect(function() -- [line 1571] anonymous function
             --[[
                 Upvalues: 
                     [1] = u58
                     [2] = u59
                     [3] = u13
             --]]
             local v389 = u58.Tool:GetAttribute("ToolType");
             if (v389 == "Bolt Action") then
                 local t_IsPlaying_70 = u59.boltCycleAnimation.IsPlaying;
                 if (t_IsPlaying_70 == false) then
                     local t_IsPlaying_71 = u59.runAnimation.IsPlaying;
                     if (t_IsPlaying_71 == false) then
                         local v390 = u58.Character.Humanoid:GetAttribute("Sprinting");
                         if (v390 == false) then
                             u13.boltCycleAction(u58);
                             return;
                         end
                     end
                 end
                 u13.freezeAnimationAtTime(u58, u59.equipAnimation);
                 return;
             end
             local v391 = u58.Tool:GetAttribute("Aiming");
             if (v391 == true) then
                 u13.Aim(u58, nil, true);
                 return;
             end
             u13.freezeAnimationAtTime(u58, u59.equipAnimation);
         end);
     end
     if (t_animationList_64.reloadAnimation) then
         local u60 = nil;
         local v392 = t_animationList_64.reloadAnimation:GetMarkerReachedSignal("BoltUp");
         local u61 = p58;
         local v393 = v392:Connect(function(p70) -- [line 1593] anonymous function
             --[[
                 Upvalues: 
                     [1] = u61
             --]]
             u61.Sounds.BoltUp:Play();
         end);
         local v394 = t_animationList_64.reloadAnimation:GetMarkerReachedSignal("BoltBack");
         local u62 = p58;
         local v395 = v394:Connect(function(p71) -- [line 1596] anonymous function
             --[[
                 Upvalues: 
                     [1] = u62
             --]]
             u62.Sounds.BoltBack:Play();
         end);
         local v396 = t_animationList_64.reloadAnimation:GetMarkerReachedSignal("BoltForward");
         local u63 = p58;
         local v397 = v396:Connect(function(p72) -- [line 1599] anonymous function
             --[[
                 Upvalues: 
                     [1] = u63
             --]]
             u63.Sounds.BoltForward:Play();
         end);
         local v398 = t_animationList_64.reloadAnimation:GetMarkerReachedSignal("BoltDown");
         local u64 = p58;
         local v399 = v398:Connect(function(p73) -- [line 1602] anonymous function
             --[[
                 Upvalues: 
                     [1] = u64
             --]]
             u64.Sounds.BoltDown:Play();
         end);
         local v400 = t_animationList_64.reloadAnimation:GetMarkerReachedSignal("Insert");
         local u65 = p58;
         local v401 = v400:Connect(function(p74) -- [line 1605] anonymous function
             --[[
                 Upvalues: 
                     [1] = u65
             --]]
             u65.Sounds.Insert:Play();
         end);
         local v402 = t_animationList_64.reloadAnimation:GetMarkerReachedSignal("Repeat"):Connect(function(p75) -- [line 1608] anonymous function
             --[[
                 Upvalues: 
                     [1] = u60
             --]]
             u60 = p75;
         end);
         local v403 = t_animationList_64.reloadAnimation:GetMarkerReachedSignal("RepeatEnd");
         local u66 = p58;
         local u67 = t_animationList_64;
         local v404 = v403:Connect(function(p76) -- [line 1611] anonymous function
             --[[
                 Upvalues: 
                     [1] = u66
                     [2] = u67
                     [3] = u60
             --]]
             local v405 = u66.Tool:FindFirstChild("AmmoLoaded").Value + u66.Tool:GetAttribute("ReloadIncrement");
             if (v405 <= u66.Tool:GetAttribute("AmmoCapacity")) then
                 u67.reloadAnimation.TimePosition = u60 - 0.001;
             end
         end);
         local v406 = t_animationList_64.reloadAnimation:GetMarkerReachedSignal("Eject");
         local u68 = p58;
         local v407 = v406:Connect(function(p77) -- [line 1618] anonymous function
             --[[
                 Upvalues: 
                     [1] = u68
                     [2] = u13
             --]]
             local v408 = u68.Tool:FindFirstChild("AmmoLoaded").Value + 1;
             local v409 = u68.Tool:GetAttribute("AmmoCapacity");
             local v410 = v409;
             local v411 = v408;
             if (not (v409 <= v411)) then
                 while true do
                     u13.createShellCase(u68.Character, u68.Tool.Hold.EjectionPort, u68.Tool.Hold.EjectionDirection);
                     local v412 = v408 + 1;
                     v408 = v412;
                     local v413 = v410;
                     if (v413 < v412) then
                         break;
                     end
                 end
             end
         end);
         local v414 = t_animationList_64.reloadAnimation:GetMarkerReachedSignal("MagOut");
         local u69 = p58;
         local v415 = v414:Connect(function(p78) -- [line 1625] anonymous function
             --[[
                 Upvalues: 
                     [1] = u69
             --]]
             u69.Sounds.MagazineOut:Play();
         end);
         local v416 = t_animationList_64.reloadAnimation:GetMarkerReachedSignal("MagIn");
         local u70 = p58;
         local v417 = v416:Connect(function(p79) -- [line 1628] anonymous function
             --[[
                 Upvalues: 
                     [1] = u70
             --]]
             u70.Sounds.MagazineIn:Play();
         end);
         local v418 = t_animationList_64.reloadAnimation.Stopped;
         local u71 = p58;
         local u72 = t_animationList_64;
         local v419 = v418:Connect(function() -- [line 1632] anonymous function
             --[[
                 Upvalues: 
                     [1] = u71
                     [2] = u13
                     [3] = u72
             --]]
             local v420 = u71.Tool:GetAttribute("Aiming");
             if (v420 == true) then
                 u13.Aim(u71, nil, true);
                 return;
             end
             u13.freezeAnimationAtTime(u71, u72.equipAnimation);
         end);
     end
     if (t_animationList_64.boltCycleAnimation) then
         local v421 = t_animationList_64.boltCycleAnimation:GetMarkerReachedSignal("BoltUp");
         local u73 = p58;
         local v422 = v421:Connect(function(p80) -- [line 1642] anonymous function
             --[[
                 Upvalues: 
                     [1] = u73
             --]]
             u73.Sounds.BoltUp:Play();
         end);
         local v423 = t_animationList_64.boltCycleAnimation:GetMarkerReachedSignal("BoltBack");
         local u74 = p58;
         local v424 = v423:Connect(function(p81) -- [line 1645] anonymous function
             --[[
                 Upvalues: 
                     [1] = u74
                     [2] = u13
             --]]
             u74.Sounds.BoltBack:Play();
             u13.createShellCase(u74.Character, u74.Tool.Hold.EjectionPort, u74.Tool.Hold.EjectionDirection);
         end);
         local v425 = t_animationList_64.boltCycleAnimation:GetMarkerReachedSignal("BoltForward");
         local u75 = p58;
         local v426 = v425:Connect(function(p82) -- [line 1649] anonymous function
             --[[
                 Upvalues: 
                     [1] = u75
             --]]
             u75.Sounds.BoltForward:Play();
         end);
         local v427 = t_animationList_64.boltCycleAnimation:GetMarkerReachedSignal("BoltDown");
         local u76 = p58;
         local v428 = v427:Connect(function(p83) -- [line 1652] anonymous function
             --[[
                 Upvalues: 
                     [1] = u76
             --]]
             u76.Cycle = false;
             u76.Sounds.BoltDown:Play();
         end);
         local v429 = t_animationList_64.boltCycleAnimation.Stopped;
         local u77 = p58;
         local u78 = t_animationList_64;
         local v430 = v429:Connect(function() -- [line 1656] anonymous function
             --[[
                 Upvalues: 
                     [1] = u77
                     [2] = u13
                     [3] = u78
             --]]
             local v431 = u77.Tool:GetAttribute("Aiming");
             if (v431 == true) then
                 u13.Aim(u77, nil, true);
                 return;
             end
             u13.freezeAnimationAtTime(u77, u78.equipAnimation);
         end);
     end
     if (t_animationList_64.digAnimation) then
         local v432 = t_animationList_64.digAnimation:GetMarkerReachedSignal("DigSound");
         local u79 = p58;
         local v433 = v432:Connect(function() -- [line 1666] anonymous function
             --[[
                 Upvalues: 
                     [1] = u79
             --]]
             u79.Sounds.Melee:Play();
         end);
         local v434 = t_animationList_64.digAnimation:GetMarkerReachedSignal("Toss");
         local u80 = p58;
         local v435 = v434:Connect(function() -- [line 1669] anonymous function
             --[[
                 Upvalues: 
                     [1] = u80
                     [2] = u10
             --]]
             u80.Sounds.Toss:Play();
             local v436 = Crosshair(u80, u80.Camera);
             local v437 = v436;
             if (v436) then
                 local v438 = u10.Dig:InvokeServer(u80, v437);
                 if (v438 == true) then
                     local v439 = 0;
                     local v440, v441, v442 = pairs(u80.Sounds:GetChildren());
                     local v443 = v440;
                     local v444 = v441;
                     local v445 = v442;
                     while true do
                         local v446, v447 = v443(v444, v445);
                         local v448 = v446;
                         local v449 = v447;
                         if (v446) then
                             break;
                         end
                         v445 = v448;
                         if (v449.Name:find("Dig")) then
                             v439 = v439 + 1;
                         end
                     end
                     u80.Sounds:FindFirstChild("Dig" .. math.random(1, v439)):Play();
                     u80.Tool.Hold.Effects.Dirt:Emit(15);
                     return;
                 end
                 if (v438 == "Spawn") then
                     local v450 = {};
                     v450.Title = "Cannot Dig!";
                     v450.Text = "Too close to a spawn.";
                     v450.Duration = 3;
                     game.StarterGui:SetCore("SendNotification", v450);
                     return;
                 end
                 if (v438 == "CannotMaterial") then
                     local v451 = {};
                     v451.Title = "Cannot Dig!";
                     v451.Text = "Undiggable material.";
                     v451.Duration = 3;
                     game.StarterGui:SetCore("SendNotification", v451);
                 end
             end
         end);
         local v452 = t_animationList_64.digAnimation.Stopped;
         local u81 = p58;
         local u82 = t_animationList_64;
         local v453 = v452:Connect(function() -- [line 1703] anonymous function
             --[[
                 Upvalues: 
                     [1] = u13
                     [2] = u81
                     [3] = u82
             --]]
             u13.freezeAnimationAtTime(u81, u82.equipAnimation);
             local t_digHoldRepeat_72 = u81.resetBool.digHoldRepeat;
             if (t_digHoldRepeat_72 == true) then
                 u13.Dig(u81);
             end
         end);
     end
     if (t_animationList_64.healAnimation) then
         local v454 = t_animationList_64.healAnimation:GetMarkerReachedSignal("Heal");
         local u83 = p58;
         local u84 = v333;
         local v455 = v454:Connect(function() -- [line 1712] anonymous function
             --[[
                 Upvalues: 
                     [1] = u83
                     [2] = u84
                     [3] = u10
             --]]
             u83.Sounds.Heal:Play();
             local t_Target_73 = u83.Target;
             if (t_Target_73 ~= "Ally") then
                 local t_Target_74 = u83.Target;
                 if (t_Target_74 == "Self") then
                     u10.Heal:FireServer(u83);
                 end
                 return;
             end
             u84:HitStart();
             task.wait(0.5);
             u84:HitStop();
         end);
     end
     if (t_animationList_64.primeAnimation) then
         local v456 = t_animationList_64.primeAnimation:GetMarkerReachedSignal("Prime");
         local u85 = p58;
         local v457 = v456:Connect(function() -- [line 1729] anonymous function
             --[[
                 Upvalues: 
                     [1] = u85
             --]]
             u85.Sounds.Prime:Play();
         end);
         local v458 = t_animationList_64.primeAnimation:GetMarkerReachedSignal("End");
         local u86 = t_animationList_64;
         local u87 = p58;
         local v459 = v458:Connect(function() -- [line 1732] anonymous function
             --[[
                 Upvalues: 
                     [1] = u13
                     [2] = u86
                     [3] = u87
             --]]
             u13.stopAnimation(u86.primeAnimation);
             u13.stopAnimation(u86.equipAnimation);
             u13.playAnimation(u87, u86.heldAnimation);
             u87.Tool:SetAttribute("Aiming", true);
         end);
     end
 end;
 u13.loadEvents = f_loadEvents;
 local f_boltCycleAction;
 f_boltCycleAction = function(p84) -- [line 1742] boltCycleAction
     --[[
         Upvalues: 
             [1] = u13
     --]]
     local v460 = p84.animationList;
     local t_animationList_75 = v460;
     local t_Parent_76 = p84.Tool.Parent;
     if (not ((t_Parent_76 == p84.Character) or v460.equipAnimation.IsPlaying)) then
         return;
     end
     u13.stopAnimation(t_animationList_75.equipAnimation);
     u13.playAnimation(p84, t_animationList_75.boltCycleAnimation, nil, p84.Tool:GetAttribute("FireDelay"));
 end;
 u13.boltCycleAction = f_boltCycleAction;
 local f_Throw;
 f_Throw = function(p85, p86) -- [line 1751] Throw
     --[[
         Upvalues: 
             [1] = u13
             [2] = u10
     --]]
     local t_animationList_77 = p85.animationList;
     local t_Parent_78 = p85.Tool.Parent;
     if (t_Parent_78 ~= p85.Character) then
         return;
     end
     local v461 = false;
     if (p86 == "Start") then
         local t_IsPlaying_79 = t_animationList_77.heldAnimation.IsPlaying;
         if (t_IsPlaying_79 == false) then
             local t_IsPlaying_80 = t_animationList_77.primeAnimation.IsPlaying;
             if (t_IsPlaying_80 == false) then
                 local t_IsPlaying_81 = t_animationList_77.throwAnimation.IsPlaying;
                 if (t_IsPlaying_81 == false) then
                     local t_IsPlaying_82 = t_animationList_77.runAnimation.IsPlaying;
                     if (t_IsPlaying_82 == false) then
                         local v462 = p85.Tool:GetAttribute("CanThrow");
                         if (v462 == true) then
                             u13.playAnimation(p85, t_animationList_77.primeAnimation);
                             return;
                         end
                     else
                         v461 = true;
                     end
                 else
                     v461 = true;
                 end
             else
                 v461 = true;
             end
         else
             v461 = true;
         end
     else
         v461 = true;
     end
     if (v461) then
         if (p86 == "Release") then
             local t_IsPlaying_83 = t_animationList_77.heldAnimation.IsPlaying;
             if (t_IsPlaying_83 == true) then
                 local t_IsPlaying_84 = t_animationList_77.runAnimation.IsPlaying;
                 if (t_IsPlaying_84 == false) then
                     u13.stopAnimation(t_animationList_77.heldAnimation);
                     u13.playAnimation(p85, t_animationList_77.throwAnimation);
                     p85.Sounds.Throw:Play();
                     local v463 = Crosshair(p85, p85.Camera);
                     local v464 = v463;
                     if (v463) then
                         u10.Throw:FireServer(p85, v464);
                         p85.Tool:SetAttribute("Aiming", false);
                     end
                     u13.freezeAnimationAtTime(p85, t_animationList_77.equipAnimation);
                 end
             end
         end
     end
 end;
 u13.Throw = f_Throw;
 local f_Dig;
 f_Dig = function(p87) -- [line 1779] Dig
     --[[
         Upvalues: 
             [1] = u13
     --]]
     local t_animationList_85 = p87.animationList;
     p87.resetBool.digHoldRepeat = true;
     local t_Parent_86 = p87.Tool.Parent;
     if (t_Parent_86 ~= p87.Character) then
         return;
     end
     local t_IsPlaying_87 = t_animationList_85.digAnimation.IsPlaying;
     if (t_IsPlaying_87 == false) then
         local t_IsPlaying_88 = t_animationList_85.runAnimation.IsPlaying;
         if (t_IsPlaying_88 == false) then
             local v465 = p87.Player:GetAttribute("Class");
             if (v465 == "Engineer") then
                 u13.stopAnimation(t_animationList_85.equipAnimation);
                 u13.playAnimation(p87, t_animationList_85.digAnimation, nil, 0.85);
             else
                 u13.stopAnimation(t_animationList_85.equipAnimation);
                 u13.playAnimation(p87, t_animationList_85.digAnimation);
                 return;
             end
         end
     end
 end;
 u13.Dig = f_Dig;
 local f_Hammer;
 f_Hammer = function(p88) -- [line 1796] Hammer
     --[[
         Upvalues: 
             [1] = u10
             [2] = u21
             [3] = u13
     --]]
     local t_animationList_89 = p88.animationList;
     p88.resetBool.meleeHoldRepeat = true;
     local t_Parent_90 = p88.Tool.Parent;
     if (t_Parent_90 ~= p88.Character) then
         return;
     end
     local t_BuildMode_91 = p88.BuildMode;
     if (t_BuildMode_91 == true) then
         local v466 = (p88.Character.HumanoidRootPart.CFrame.LookVector * 7.5) + p88.Character.HumanoidRootPart.Position;
         local v467 = RaycastParams.new();
         v467.CollisionGroup = "ConstructGroundRay";
         v467.IgnoreWater = true;
         v467.FilterType = Enum.RaycastFilterType.Blacklist;
         v467.FilterDescendantsInstances = {
             p88.Character
         };
         local v468 = workspace:Raycast(v466, (Vector3.new(v466.X, v466.Y - 25, v466.Z) - v466).Unit * 25, v467);
         local v469 = v468;
         if (v468) then
             local v470 = u10.Construct:InvokeServer(p88, u21[p88.Tool:GetAttribute("Construct")], Vector3.new(v469.Position.X, v469.Position.Y, v469.Position.Z));
             if (v470 == true) then
                 p88.BuildMode = false;
                 local v471 = workspace.Constructs:FindFirstChild("PreviewConstruct");
                 local v472 = v471;
                 if (v471) then
                     v472:Destroy();
                     return;
                 end
             else
                 if (v470 == "HMGLimit") then
                     p88.BuildMode = false;
                     local v473 = workspace.Constructs:FindFirstChild("PreviewConstruct");
                     local v474 = v473;
                     if (v473) then
                         v474:Destroy();
                     end
                     local v475 = {};
                     v475.Title = "HMG Limit";
                     v475.Text = "Building this will destroy your previous HMG.";
                     v475.Duration = 3;
                     game.StarterGui:SetCore("SendNotification", v475);
                     return;
                 end
                 if (v470 == "Spawn") then
                     local v476 = {};
                     v476.Title = "Cannot Place!";
                     v476.Text = "Too close to a spawn.";
                     v476.Duration = 3;
                     game.StarterGui:SetCore("SendNotification", v476);
                     return;
                 end
             end
         end
     else
         local t_IsPlaying_92 = t_animationList_89.hammerAnimation.IsPlaying;
         if (t_IsPlaying_92 == false) then
             local t_IsPlaying_93 = t_animationList_89.runAnimation.IsPlaying;
             if (t_IsPlaying_93 == false) then
                 u13.playAnimation(p88, t_animationList_89.hammerAnimation);
             end
         end
     end
 end;
 u13.Hammer = f_Hammer;
 local f_Build;
 f_Build = function(p89, p90) -- [line 1848] Build
     --[[
         Upvalues: 
             [1] = u21
     --]]
     if (p90 == "Build") then
         p89.BuildMode = not p89.BuildMode;
         local t_BuildMode_94 = p89.BuildMode;
         if (t_BuildMode_94 == false) then
             local v477 = workspace.Constructs:FindFirstChild("PreviewConstruct");
             local v478 = v477;
             if (v477) then
                 v478:Destroy();
                 return;
             end
         end
     else
         if (p90 == "Next") then
             local v479 = p89.Tool:GetAttribute("Construct");
             if (v479 < (#u21)) then
                 local v480 = p89.Tool:GetAttribute("Construct");
                 if (v480 == (#u21)) then
                     p89.Tool:SetAttribute("Construct", 1);
                 else
                     p89.Tool:SetAttribute("Construct", p89.Tool:GetAttribute("Construct") + 1);
                 end
                 p89.Tool.Name = u21[p89.Tool:GetAttribute("Construct")];
                 return;
             end
         else
             if (p89.Tool:GetAttribute("Construct") > 1) then
                 local v481 = p89.Tool:GetAttribute("Construct");
                 if (v481 == 1) then
                     p89.Tool:SetAttribute("Construct", #u21);
                 else
                     p89.Tool:SetAttribute("Construct", p89.Tool:GetAttribute("Construct") - 1);
                 end
                 p89.Tool.Name = u21[p89.Tool:GetAttribute("Construct")];
             end
         end
     end
 end;
 u13.Build = f_Build;
 local f_Heal;
 f_Heal = function(p91) -- [line 1879] Heal
     --[[
         Upvalues: 
             [1] = u13
     --]]
     local t_animationList_95 = p91.animationList;
     local t_Parent_96 = p91.Tool.Parent;
     if (t_Parent_96 ~= p91.Character) then
         return;
     end
     local t_IsPlaying_97 = t_animationList_95.healAnimation.IsPlaying;
     if (t_IsPlaying_97 == false) then
         local t_IsPlaying_98 = t_animationList_95.runAnimation.IsPlaying;
         if (t_IsPlaying_98 == false) then
             local v482 = p91.Tool:GetAttribute("CanHeal");
             if (v482 == true) then
                 u13.playAnimation(p91, t_animationList_95.healAnimation);
             end
         end
     end
 end;
 u13.Heal = f_Heal;
 local f_Spot;
 f_Spot = function(p92) -- [line 1888] Spot
     --[[
         Upvalues: 
             [1] = u13
             [2] = u10
     --]]
     local t_animationList_99 = p92.animationList;
     local t_Parent_100 = p92.Tool.Parent;
     if (t_Parent_100 ~= p92.Character) then
         return;
     end
     local v483 = Crosshair(p92, p92.Camera);
     local v484 = v483;
     if (v483) then
         local v485 = p92.Tool:GetAttribute("CanSpot");
         if (v485 == true) then
             local v486 = false;
             local t_IsPlaying_101 = t_animationList_99.equipAnimation.IsPlaying;
             if (t_IsPlaying_101 == true) then
                 v486 = true;
             else
                 local t_IsPlaying_102 = t_animationList_99.aimAnimation.IsPlaying;
                 if (t_IsPlaying_102 == true) then
                     v486 = true;
                 else
                     local t_IsPlaying_103 = t_animationList_99.runAnimation.IsPlaying;
                     if (t_IsPlaying_103 == true) then
                         v486 = true;
                     end
                 end
             end
             if (v486) then
                 u13.playAnimation(p92, t_animationList_99.spotAnimation);
             end
         end
         local v487 = u10.Spot:InvokeServer(p92, v484);
         if (v487 == "Cannot") then
             local v488 = {};
             v488.Title = "Cannot Spot!";
             v488.Text = "On cooldown.";
             v488.Duration = 2;
             game.StarterGui:SetCore("SendNotification", v488);
         end
     end
 end;
 u13.Spot = f_Spot;
 local u88 = {
     "Rally",
     "Follow",
     "Advance",
     "Halt",
     "Disperse",
     "TakeCover",
     "Defend",
     "Fire",
     "CeaseFire",
     "Charge",
     "Retreat"
 };
 local f_Whistle;
 f_Whistle = function(p93, p94) -- [line 1925] Whistle
     --[[
         Upvalues: 
             [1] = u13
             [2] = u10
             [3] = u88
     --]]
     local t_animationList_104 = p93.animationList;
     local t_Parent_105 = p93.Tool.Parent;
     if (t_Parent_105 ~= p93.Character) then
         return;
     end
     if (p94 == "Play") then
         local t_IsPlaying_106 = t_animationList_104.commandAnimation.IsPlaying;
         if (t_IsPlaying_106 == false) then
             local v489 = p93.Tool:GetAttribute("CanWhistle");
             if (v489 == true) then
                 u13.playAnimation(p93, t_animationList_104.commandAnimation);
                 u10.Whistle:FireServer(p93, u88[p93.Tool:GetAttribute("Command")]);
                 return;
             end
         end
     else
         if (p94 == "Next") then
             local v490 = p93.Tool:GetAttribute("Command");
             if (v490 <= (#u88)) then
                 p93.Tool:SetAttribute("Command", p93.Tool:GetAttribute("Command") + 1);
                 p93.Tool.Name = u88[p93.Tool:GetAttribute("Command")];
                 return;
             end
         else
             if (p93.Tool:GetAttribute("Command") >= 1) then
                 p93.Tool:SetAttribute("Command", p93.Tool:GetAttribute("Command") - 1);
                 p93.Tool.Name = u88[p93.Tool:GetAttribute("Command")];
             end
         end
     end
 end;
 u13.Whistle = f_Whistle;
 local f_Artillery;
 f_Artillery = function(p95) -- [line 1946] Artillery
     --[[
         Upvalues: 
             [1] = u10
             [2] = u1
             [3] = u6
     --]]
     local t_Parent_107 = p95.Tool.Parent;
     if (t_Parent_107 ~= p95.Character) then
         return;
     end
     local v491 = Crosshair(p95, p95.Camera);
     local v492 = v491;
     if (v491) then
         local v493 = p95.Tool:GetAttribute("Aiming");
         if (v493 == true) then
             local v494 = u10.Artillery:InvokeServer(p95, v492);
             if (v494 ~= nil) then
                 if (v494 == true) then
                     u1.Sounds.OrderArtillery:Play();
                     local v495 = Instance.new("Attachment");
                     v495.Parent = workspace.Terrain;
                     v495.WorldPosition = v492;
                     u6:AddItem(v495, 10);
                     local v496 = u1.commandGui:Clone();
                     v496.Size = UDim2.new(50, 0, 50, 0);
                     v496.commandText.Text = "ARTILLERY";
                     v496.Parent = v495;
                     return;
                 end
                 p95.Tool.Name = v494;
                 task.wait(1);
                 p95.Tool.Name = "Binoculars";
             end
         end
     end
 end;
 u13.Artillery = f_Artillery;
 return u13;
 