-- Decompiled with the Synapse X Luau decompiler.
 --NOTE: Currently in beta! Not representative of final product.
 local v1 = {};
 v1.LastCrouching = 0;
 local t_LocalPlayer_1 = game.Players.LocalPlayer;
 local v2 = t_LocalPlayer_1:GetMouse();
 local v3 = workspace.MapFolder.GameStats;
 local v4 = game.ReplicatedStorage.Assets;
 local v5 = game.ReplicatedStorage.SpringValues;
 local v6 = CFrame.new;
 local v7 = CFrame.Angles;
 local v8 = Vector3.new;
 local v9 = game:GetService("UserInputService");
 local v10 = game:GetService("RunService");
 local v11 = game:GetService("Debris");
 local v12 = require(game.ReplicatedStorage.Modules.Shared.ModuleLoader);
 local v13 = v12:LoadModule("Network");
 local v14 = v12:LoadModule("InputManager");
 local v15 = v12:LoadModule("SharedMemory");
 local v16 = v12:LoadModule("Clean");
 local v17 = v12:LoadModule("LerpModule");
 local v18 = v12:LoadModule("SoundManager");
 local v19 = v12:LoadModule("WeaponInfo");
 local v20 = v12:LoadModule("GetBulletIgnoreTable");
 local v21 = v12:LoadModule("CreateSpring");
 local v22 = v12:LoadModule("EventHandler");
 local u1 = nil;
 local u2 = nil;
 local u3 = v15;
 local t_GameStats_2 = v3;
 local f_CanMove;
 f_CanMove = function(p1) -- [line 42] CanMove
     --[[
         Upvalues: 
             [1] = u3
             [2] = t_GameStats_2
             [3] = u1
     --]]
     local v23 = not u3.BombTick;
     if (v23) then
         v23 = false;
         local t_Value_3 = t_GameStats_2.RoundType.Value;
         if (t_Value_3 ~= "Starting") then
             v23 = not u1.Spectating;
             if (v23) then
                 v23 = not u3.ActivatingAbility;
             end
         end
     end
     return v23;
 end;
 v1.CanMove = f_CanMove;
 local f_StopAnimations;
 f_StopAnimations = function(p2, p3) -- [line 46] StopAnimations
     --[[
         Upvalues: 
             [1] = t_LocalPlayer_1
     --]]
     local v24, v25, v26 = pairs(t_LocalPlayer_1.Character.Humanoid:GetPlayingAnimationTracks());
     local v27 = v24;
     local v28 = v25;
     local v29 = v26;
     while true do
         local v30, v31 = v27(v28, v29);
         local v32 = v30;
         local v33 = v31;
         if (v30) then
             break;
         end
         v29 = v32;
         if (not ((not (p3 and (not string.find(v33.Name, "Idle")))) and p3)) then
             v33:Stop(0.2);
         end
     end
     if (not p3) then
         p2.CurrentIdleAnimation = nil;
     end
     p2.CurrentAnimation = nil;
     p2.JumpingAnimation = nil;
     p2.FallAnimation = nil;
     p2.WalkAnimation = nil;
 end;
 v1.StopAnimations = f_StopAnimations;
 local u4 = t_LocalPlayer_1;
 local t_Assets_4 = v4;
 local u5 = v18;
 local u6 = v13;
 local f_CharacterAdded;
 f_CharacterAdded = function(p4) -- [line 63] CharacterAdded
     --[[
         Upvalues: 
             [1] = u4
             [2] = t_Assets_4
             [3] = u5
             [4] = u6
             [5] = u2
     --]]
     u4.Character:WaitForChild("Humanoid");
     p4.Falling = false;
     local v34 = u4.Character.Humanoid.StateChanged;
     local u7 = p4;
     v34:Connect(function(p5, p6) -- [line 68] anonymous function
         --[[
             Upvalues: 
                 [1] = u7
                 [2] = u4
                 [3] = t_Assets_4
                 [4] = u5
                 [5] = u6
                 [6] = u2
         --]]
         if (p6 == Enum.HumanoidStateType.Freefall) then
             u7.Falling = true;
             return;
         end
         if (u7.Falling and (((p6 == Enum.HumanoidStateType.Landed) or (p6 == Enum.HumanoidStateType.Running)) or (p6 == Enum.HumanoidStateType.RunningNoPhysics))) then
             u7.Falling = false;
             u7:StopAnimations();
             u4.Character.Humanoid:LoadAnimation(t_Assets_4.CharacterAnimations.Landing):Play(0.2);
             u7.LandedCooldown = tick();
             u7.AnimationCooldown = tick();
             local t_Y_5 = u4.Character.HumanoidRootPart.Position.Y;
             if (u7.HighestJumpPos and ((u7.HighestJumpPos - t_Y_5) > 1.5)) then
                 u5:PlaySound("JumpLand");
                 u6:FireServer("PlaySound", "JumpLand");
                 u2.SpringCameraJump:Impulse(-2.5);
                 u2.SpringJumpY._damper = 0.4;
                 u2.SpringJumpY:Impulse(-0.1);
             end
             u2.SpringJumpY.Target = 0;
         end
     end);
 end;
 v1.CharacterAdded = f_CharacterAdded;
 local t_GameStats_6 = v3;
 local u8 = v12;
 local u9 = v21;
 local u10 = v22;
 local u11 = v16;
 local u12 = t_LocalPlayer_1;
 local u13 = v15;
 local u14 = v14;
 local u15 = v19;
 local u16 = v8;
 local t_SpringValues_7 = v5;
 local u17 = v6;
 local t_Assets_8 = v4;
 local u18 = v13;
 local u19 = v18;
 local u20 = v7;
 local u21 = v9;
 local f_Initialize;
 f_Initialize = function(p7) -- [line 97] Initialize
     --[[
         Upvalues: 
             [1] = t_GameStats_6
             [2] = u1
             [3] = u8
             [4] = u2
             [5] = u9
             [6] = u10
             [7] = u11
             [8] = u12
             [9] = u13
             [10] = u14
             [11] = u15
             [12] = u16
             [13] = t_SpringValues_7
             [14] = u17
             [15] = t_Assets_8
             [16] = u18
             [17] = u19
             [18] = u20
             [19] = u21
     --]]
     local t_Value_9 = t_GameStats_6.GameMode.Value;
     if (t_Value_9 ~= "View Recording") then
         local t_Value_10 = t_GameStats_6.GameMode.Value;
         if (t_Value_10 ~= "Trading") then
             u1 = u8:LoadModule("SpectateManager");
             u2 = u8:LoadModule("WeaponManagerClient");
             u9(p7, "CameraLerp", 1, 15, 1);
             u9(p7, "MovementMultiplier", 1, 15, 1, nil, true);
             p7.CurrentVelocityCFrame = CFrame.new();
             local v35 = u10;
             local u22 = p7;
             v35:RenderStepped(function() -- [line 110] anonymous function
                 --[[
                     Upvalues: 
                         [1] = u11
                         [2] = u12
                         [3] = u22
                         [4] = u2
                         [5] = u13
                         [6] = u14
                         [7] = u15
                         [8] = u16
                         [9] = t_SpringValues_7
                         [10] = u17
                         [11] = u1
                         [12] = t_Assets_8
                         [13] = u18
                         [14] = u19
                         [15] = u20
                 --]]
                 if (not u11:IsAlive(u12)) then
                     u22.CurrentIdleAnimation = nil;
                     u22.CurrentAnimation = nil;
                     u22.WalkAnimation = nil;
                     if (u12.Character and u12.Character:FindFirstChild("HumanoidRootPart")) then
                         u12.Character.HumanoidRootPart.Anchored = false;
                     end
                     return;
                 end
                 local t_Value_11 = u12.CharacterName.Value;
                 local t_Humanoid_12 = u12.Character.Humanoid;
                 local v36 = u12.Character.HumanoidRootPart;
                 local t_HumanoidRootPart_13 = v36;
                 local t_CFrame_14 = v36.CFrame;
                 if (u22.LandedCooldown and ((tick() - u22.LandedCooldown) >= 0.5)) then
                     u22.LandedCooldown = nil;
                 end
                 if (u22.AnimationCooldown and ((tick() - u22.AnimationCooldown) >= 0.13)) then
                     u22.AnimationCooldown = nil;
                 end
                 if (u22.Falling) then
                     u2.SpringJumpY._damper = 1;
                     u2.SpringJumpY.Target = 0.03;
                     local v37 = t_CFrame_14.p.Y;
                     local t_HighestJumpPos_15 = u22.HighestJumpPos;
                     if (t_HighestJumpPos_15 <= v37) then
                         u22.HighestJumpPos = t_CFrame_14.p.Y;
                     end
                 end
                 local v38 = u13.AbilityInUse;
                 if (v38) then
                     v38 = t_Value_11 == "Zolt";
                 end
                 local v39 = u13.AbilityInUse;
                 if (v39) then
                     v39 = t_Value_11 == "Zyla";
                 end
                 local v40;
                 if (u22.Falling and u22.OriginalDesiredSpeed) then
                     v40 = u22.OriginalDesiredSpeed;
                 else
                     if (u14:IsKeyDown("Crouch") and (not v38)) then
                         v40 = 8;
                     else
                         if ((u14:IsKeyDown("Walk") or u13.Aiming) and (not v38)) then
                             v40 = 12;
                         else
                             v40 = 22;
                         end
                     end
                 end
                 if (u22.SlowEffect and (not u22.Falling)) then
                     v40 = v40 * 0.5;
                     if ((tick() - u22.SlowEffect) > 0) then
                         u22.SlowEffect = nil;
                     end
                 end
                 if (u22.KaneExplosiveSlow and (not u22.Falling)) then
                     v40 = v40 * 0.3;
                 end
                 if (not u22.Falling) then
                     u22.OriginalDesiredSpeed = v40;
                     u22.WasCrouching = false;
                 end
                 if (not v38) then
                     local v41 = false;
                     if (u13.CurrentWeaponData) then
                         local t_Weapon_16 = u13.CurrentWeaponData.Weapon;
                         if (t_Weapon_16 == "Knife") then
                             v40 = v40 * 1.1;
                         else
                             v41 = true;
                         end
                     else
                         v41 = true;
                     end
                     if (v41) then
                         if (u13.CurrentWeaponData and u15[u13.CurrentWeaponData.Weapon].MovementSpeedMultiplier) then
                             v40 = v40 * u15[u13.CurrentWeaponData.Weapon].MovementSpeedMultiplier;
                         end
                     end
                 end
                 local v42 = v40;
                 if (u22.LandedCooldown) then
                     local v43 = tick() - u22.LandedCooldown;
                     local v44 = ((2 * (v43 ^ 2)) + (-0.3 * v43)) + 0.65;
                     v42 = v40;
                     v40 = v40 * v44;
                 end
                 if (v38) then
                     v40 = v40 * 1.4;
                 else
                     if (v39) then
                         v40 = v40 * 1.2;
                     end
                 end
                 local v45 = false;
                 local v46 = u22:CanMove();
                 local v47 = u16();
                 local v48;
                 if (u14:IsKeyDown("MoveForward")) then
                     v48 = t_CFrame_14.lookVector;
                     if (not v48) then
                         v45 = true;
                     end
                 else
                     v45 = true;
                 end
                 if (v45) then
                     v48 = u16();
                 end
                 local v49 = false;
                 local v50 = v47 + v48;
                 local v51;
                 if (u14:IsKeyDown("MoveLeft")) then
                     v51 = -t_CFrame_14.rightVector;
                     if (not v51) then
                         v49 = true;
                     end
                 else
                     v49 = true;
                 end
                 if (v49) then
                     v51 = u16();
                 end
                 local v52 = false;
                 local v53 = v50 + v51;
                 local v54;
                 if (u14:IsKeyDown("MoveBack")) then
                     v54 = -t_CFrame_14.lookVector;
                     if (not v54) then
                         v52 = true;
                     end
                 else
                     v52 = true;
                 end
                 if (v52) then
                     v54 = u16();
                 end
                 local v55 = false;
                 local v56 = v53 + v54;
                 local v57;
                 if (u14:IsKeyDown("MoveRight")) then
                     v57 = t_CFrame_14.rightVector;
                     if (not v57) then
                         v55 = true;
                     end
                 else
                     v55 = true;
                 end
                 if (v55) then
                     v57 = u16();
                 end
                 local v58 = false;
                 local v59 = v56 + v57;
                 local v60 = v59;
                 local v61 = tostring(v59.Unit.Magnitude);
                 local v62;
                 if (v61 == "nan") then
                     v62 = Vector3.new();
                     if (not v62) then
                         v58 = true;
                     end
                 else
                     v58 = true;
                 end
                 if (v58) then
                     v62 = v60.Unit;
                 end
                 local v63 = false;
                 local v64 = v62;
                 local v65;
                 if (v46) then
                     v65 = v64;
                     if (not v65) then
                         v63 = true;
                     end
                 else
                     v63 = true;
                 end
                 if (v63) then
                     v65 = u16(0, 0, 0);
                 end
                 local v66 = v65;
                 local v67 = u16();
                 local v68 = u16();
                 if (u22.CurrentVelocity) then
                     v67 = u16(u22.CurrentVelocity.X, 0, u22.CurrentVelocity.Z);
                     v68 = u16(v66.X, 0, v66.Z);
                 end
                 local v69 = false;
                 local v70 = t_Humanoid_12:GetState();
                 local v71;
                 if ((v70 == Enum.HumanoidStateType.FallingDown) or (v70 == Enum.HumanoidStateType.Freefall)) then
                     v71 = game.ReplicatedStorage.SpringValues.MovementFalling.Speed.Value;
                     if (not v71) then
                         v69 = true;
                     end
                 else
                     v69 = true;
                 end
                 if (v69) then
                     local v72 = false;
                     local v73 = (v67 - v68).magnitude;
                     local t_Value_17 = t_SpringValues_7.MovementStrafing.Threshold.Value;
                     if (t_Value_17 <= v73) then
                         v71 = t_SpringValues_7.MovementStrafing.Acceleration.Value;
                         if (not v71) then
                             v72 = true;
                         end
                     else
                         v72 = true;
                     end
                     if (v72) then
                         local v74 = false;
                         if (v66.magnitude > 0.004) then
                             v71 = game.ReplicatedStorage.SpringValues.MovementNormal.Speed.Value;
                             if (not v71) then
                                 v74 = true;
                             end
                         else
                             v74 = true;
                         end
                         if (v74) then
                             v71 = game.ReplicatedStorage.SpringValues.MovementStopping.Speed.Value;
                         end
                     end
                 end
                 if (v46) then
                     u12.Character.HumanoidRootPart.Anchored = false;
                 else
                     u22.CurrentVelocityCFrame = u17();
                     u12.Character.HumanoidRootPart.Anchored = true;
                 end
                 u22.MovementMultiplier.Target = v66;
                 u22.MovementMultiplier.Speed = v71;
                 local v75 = u22.MovementMultiplier.Position;
                 u22.CurrentVelocityCFrame = u17(v75.X, v75.Y, v75.Z);
                 u22.PlaneMagnitude = v66.magnitude * v42;
                 u22.CurrentVelocity = u22.CurrentVelocityCFrame.p;
                 u22.PercentSpeed = math.clamp(1 - (v66 - u22.CurrentVelocity).magnitude, 0, 1);
                 t_Humanoid_12.WalkToPoint = u12.Character.HumanoidRootPart.Position + Vector3.new(u22.CurrentVelocity.X * 100, 0, u22.CurrentVelocity.Z * 100);
                 t_Humanoid_12.WalkSpeed = u22.CurrentVelocity.magnitude * v40;
                 t_Humanoid_12.AutoJumpEnabled = false;
                 if (u22.Falling or u22.AnimationCooldown) then
                     if (u22.Falling and (not u22.FallAnimation)) then
                         if (not u22.JumpingAnimation) then
                             u22:StopAnimations();
                         end
                         local v76 = t_Humanoid_12:LoadAnimation(t_Assets_8.CharacterAnimations.FallIdle);
                         v76:Play();
                         u18:FireServer("PlaySound", "FallIdle");
                         u22.FallAnimation = v76;
                     end
                 else
                     local v77 = u22.PlaneMagnitude / 14;
                     local v78 = nil;
                     local v79, v80;
                     if (u14:IsKeyDown("Crouch") and (not (u22.Falling or v38))) then
                         v79 = "Crouch";
                         v80 = "CrouchIdle";
                     else
                         v79 = "Walk";
                         v80 = "WalkIdle";
                     end
                     if (not u1.Spectating) then
                         if (u14:IsKeyDown("MoveForward")) then
                             v78 = v79;
                         else
                             if (u14:IsKeyDown("MoveBack")) then
                                 v78 = v79 .. "Back";
                             else
                                 if (u14:IsKeyDown("MoveLeft")) then
                                     v78 = v79 .. "Left";
                                 else
                                     if (u14:IsKeyDown("MoveRight")) then
                                         v78 = v79 .. "Right";
                                     end
                                 end
                             end
                         end
                     end
                     local t_CurrentIdleAnimation_18 = u22.CurrentIdleAnimation;
                     if (t_CurrentIdleAnimation_18 ~= v80) then
                         u22:StopAnimations();
                         u22.CurrentIdleAnimation = v80;
                         t_Humanoid_12:LoadAnimation(t_Assets_8.CharacterAnimations[v80]):Play(0.2);
                     end
                     local t_CurrentAnimation_19 = u22.CurrentAnimation;
                     if (t_CurrentAnimation_19 ~= v78) then
                         u22:StopAnimations(true);
                         u22.CurrentAnimation = v78;
                         if (v78) then
                             local v81 = t_Humanoid_12:LoadAnimation(t_Assets_8.CharacterAnimations[v78]);
                             v81:Play(0.2);
                             u22.WalkAnimation = v81;
                         end
                     end
                     if (u22.WalkAnimation) then
                         u22.WalkAnimation:AdjustSpeed(v77);
                     end
                 end
                 local v82 = false;
                 local t_Running_20 = u22.Running;
                 if (u22.WalkAnimation) then
                     local v83 = u22.WalkAnimation.Name:sub(1, 4);
                     if (((v83 == "Walk") and (u22.CurrentVelocity.magnitude >= 0.7)) and (not ((u14:IsKeyDown("Crouch") or u14:IsKeyDown("Walk")) and (not v38)))) then
                         u22.Running = "Running";
                     else
                         v82 = true;
                     end
                 else
                     v82 = true;
                 end
                 if (v82) then
                     local v84 = false;
                     if (u22.WalkAnimation) then
                         local v85 = u22.WalkAnimation.Name:sub(1, 4);
                         if (((v85 == "Walk") and (u22.CurrentVelocity.magnitude >= 0.7)) and (u14:IsKeyDown("Crouch") or u14:IsKeyDown("Walk"))) then
                             u22.Running = "Silent";
                         else
                             v84 = true;
                         end
                     else
                         v84 = true;
                     end
                     if (v84) then
                         u22.Running = "Idle";
                     end
                 end
                 if (t_Value_11 == "Zolt") then
                     u12.Character.TacticalSprint.Value = u13.AbilityInUse;
                     if (((u22.PercentSpeed >= 0.15) and u13.AbilityInUse) and (not u22.ZoltWindSound)) then
                         local v86 = u22;
                         local v87 = u19;
                         local v88 = {};
                         v88.Looped = true;
                         v86.ZoltWindSound = v87:PlaySound("Zolt Wind", v88);
                     end
                 end
                 if ((u22.ZoltWindSound and u22.ZoltWindSound.Parent) and (not (((t_Value_11 == "Zolt") and (u22.PercentSpeed >= 0.15)) and u13.AbilityInUse))) then
                     u22.ZoltWindSound:Destroy();
                     u22.ZoltWindSound = nil;
                 end
                 u12.Character.Running.Value = u22.Running;
                 local t_Shot_21 = u12.Character.Shot;
                 local v89 = u22.SlowEffect;
                 if (v89) then
                     v89 = not u22.Falling;
                 end
                 t_Shot_21.Value = v89;
                 local t_Ice_22 = u12.Character.Ice;
                 local v90 = u22.KaneExplosiveSlow;
                 if (v90) then
                     v90 = not u22.Falling;
                 end
                 local v91 = false;
                 t_Ice_22.Value = v90;
                 if (t_Running_20 == u22.Running) then
                     local t_LastKaneExplosiveSlow_23 = u22.LastKaneExplosiveSlow;
                     if (t_LastKaneExplosiveSlow_23 == u22.KaneExplosiveSlow) then
                         local t_LastSlowEffect_24 = u22.LastSlowEffect;
                         if (t_LastSlowEffect_24 ~= u22.SlowEffect) then
                             v91 = true;
                         end
                     else
                         v91 = true;
                     end
                 else
                     v91 = true;
                 end
                 if (v91) then
                     local v92 = u18;
                     local v93 = {};
                     v93.Running = u22.Running;
                     local v94 = u22.SlowEffect;
                     if (v94) then
                         v94 = not u22.Falling;
                     end
                     v93.Shot = v94;
                     local v95 = u22.KaneExplosiveSlow;
                     if (v95) then
                         v95 = not u22.Falling;
                     end
                     v93.Ice = v95;
                     v92:FireServer("SetCharacterState", v93);
                 end
                 local t_CameraLerp_25 = u22.CameraLerp;
                 local v96;
                 if ((u14:IsKeyDown("Crouch") and (not (u22.Falling or v38))) or u22.WasCrouching) then
                     v96 = -1.5;
                 else
                     v96 = 0;
                 end
                 t_CameraLerp_25.Target = v96;
                 local v97, v98, v99 = t_HumanoidRootPart_13.Collision.C0:ToOrientation();
                 t_HumanoidRootPart_13.Collision.C0 = u17(0, 0.75 + (u22.CameraLerp.position * 0.61), 0) * u20(0, 0, -1.5707963267948966);
                 t_Humanoid_12.CameraOffset = u16(0, u22.CameraLerp.position, 0);
                 u22.LastKaneExplosiveSlow = u22.KaneExplosiveSlow;
                 u22.LastSlowEfffect = u22.SlowEffect;
             end);
             local v100 = u21.InputBegan;
             local u23 = p7;
             v100:Connect(function(p8, p9) -- [line 350] anonymous function
                 --[[
                     Upvalues: 
                         [1] = u11
                         [2] = u23
                         [3] = u12
                         [4] = u13
                         [5] = u14
                         [6] = t_Assets_8
                         [7] = u19
                         [8] = u18
                 --]]
                 if (not ((not p9) and u11:IsAlive())) then
                     return;
                 end
                 local t_KeyCode_26 = p8.KeyCode;
                 if (((t_KeyCode_26 == Enum.KeyCode.Space) and (not u23.Falling)) and u23:CanMove()) then
                     u12.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping);
                     local v101 = u13.AbilityInUse;
                     if (v101) then
                         v101 = u12.CharacterName.Value == "Zolt";
                     end
                     u23.Falling = true;
                     local v102 = u23;
                     local v103 = u14:IsKeyDown("Crouch");
                     if (v103) then
                         v103 = not v101;
                     end
                     v102.WasCrouching = v103;
                     u23:StopAnimations();
                     local v104 = u12.Character.Humanoid:LoadAnimation(t_Assets_8.CharacterAnimations.Jump);
                     v104:Play(0.2);
                     u23.HighestJumpPos = -999;
                     u23.JumpingAnimation = v104;
                     if (u23.OriginalDesiredSpeed >= 12) then
                         u19:PlaySound("Jump");
                         u18:FireServer("PlaySound", "Jump");
                     end
                 end
             end);
             if (u12.Character) then
                 p7:CharacterAdded();
             end
             local v105 = u12.CharacterAdded;
             local u24 = p7;
             v105:Connect(function() -- [line 382] anonymous function
                 --[[
                     Upvalues: 
                         [1] = u24
                 --]]
                 u24:CharacterAdded();
             end);
             local v106 = u18;
             local u25 = p7;
             v106:OnBindableFire("SlowEffect", function() -- [line 386] anonymous function
                 --[[
                     Upvalues: 
                         [1] = u25
                 --]]
                 u25.SlowEffect = tick() + 1;
             end);
             return;
         end
     end
 end;
 v1.Initialize = f_Initialize;
 return v1;
 