-- Decompiled with the Synapse X Luau decompiler.
 --NOTE: Currently in beta! Not representative of final product.
 local v1 = {};
 v1.TotalCameraX = 0;
 v1.TotalCameraY = 0;
 v1.CurrentCameraX = 0;
 v1.CurrentCameraY = 0;
 v1.TotalCameraBounceX = 0;
 v1.TotalCameraBounceY = 0;
 v1.CurrentCameraBounceX = 0;
 v1.CurrentCameraBounceY = 0;
 v1.LastCameraSpringBounceX = 0;
 v1.LastCameraSpringBounceY = 0;
 v1.LastCameraSpringBounceZ = 0;
 v1.LastAimPunchSpringX = 0;
 v1.LastAimPunchSpringY = 0;
 v1.LastAimPunchSpringZ = 0;
 v1.LastCameraShakeTick = 0;
 v1.IsFiring = false;
 local v2 = game.Players.LocalPlayer;
 local v3 = v2:GetMouse();
 local v4 = workspace.CurrentCamera;
 local v5 = require(game.ReplicatedStorage.Modules.Shared.ModuleLoader);
 local v6 = v5:LoadModule("Network");
 local v7 = v5:LoadModule("Spring");
 local v8 = v5:LoadModule("CreateSpring");
 local u1 = v5:LoadModule("SharedMemory");
 local u2 = v5:LoadModule("WeaponInfo");
 local v9 = v5:LoadModule("SoundManager");
 local u3 = nil;
 local u4 = nil;
 local u5 = nil;
 local f_AddCameraShake;
 f_AddCameraShake = function(p1, p2, p3) -- [line 47] AddCameraShake
     p1.TotalCameraX = p1.TotalCameraX + p2;
     p1.TotalCameraY = p1.TotalCameraY + p3;
     p1.LastCameraShakeTick = tick();
 end;
 v1.AddCameraShake = f_AddCameraShake;
 local f_AddCameraBounce;
 f_AddCameraBounce = function(p4, p5) -- [line 54] AddCameraBounce
     --[[
         Upvalues: 
             [1] = u2
             [2] = u1
     --]]
     local v10 = u2[u1.CurrentWeaponData.Weapon];
     local v11 = v10;
     local v12 = v10;
     if (v12) then
         v12 = v11.Kickback;
     end
     local v13 = false;
     local v14 = u1.CurrentWeapon:FindFirstChild("CameraShake");
     local v15 = v14;
     local v16;
     if (v14) then
         v16 = u1.CurrentWeapon.CameraShake.AngleX.Shake.Value;
         if (not v16) then
             v13 = true;
         end
     else
         v13 = true;
     end
     if (v13) then
         local v17 = false;
         if (v12) then
             v16 = v12.X.Shake;
             if (not v16) then
                 v17 = true;
             end
         else
             v17 = true;
         end
         if (v17) then
             v16 = 0;
         end
     end
     local v18 = false;
     local v19;
     if (v15) then
         v19 = u1.CurrentWeapon.CameraShake.AngleY.Shake.Value;
         if (not v19) then
             v18 = true;
         end
     else
         v18 = true;
     end
     if (v18) then
         local v20 = false;
         if (v12) then
             v19 = v12.Y.Shake;
             if (not v19) then
                 v20 = true;
             end
         else
             v20 = true;
         end
         if (v20) then
             v19 = 0;
         end
     end
     local v21 = false;
     local v22;
     if (v15) then
         v22 = u1.CurrentWeapon.CameraShake.AngleZ.Shake.Value;
         if (not v22) then
             v21 = true;
         end
     else
         v21 = true;
     end
     if (v21) then
         local v23 = false;
         if (v12) then
             v22 = v12.Z.Shake;
             if (not v22) then
                 v23 = true;
             end
         else
             v23 = true;
         end
         if (v23) then
             v22 = 0;
         end
     end
     p4.CameraShakeSpringX:Impulse(v16 * p5);
     p4.CameraShakeSpringY:Impulse(v19 * p5);
     p4.CameraShakeSpringZ:Impulse(v22 * p5);
 end;
 v1.AddCameraBounce = f_AddCameraBounce;
 local f_SetFiring;
 f_SetFiring = function(p6, p7) -- [line 72] SetFiring
     p6.IsFiring = p7;
 end;
 v1.SetFiring = f_SetFiring;
 local u6 = v5;
 local u7 = v8;
 local u8 = v7;
 local u9 = u1;
 local u10 = u2;
 local t_LocalPlayer_1 = v2;
 local t_CurrentCamera_2 = v4;
 local u11 = v6;
 local u12 = v9;
 local f_Initialize;
 f_Initialize = function(p8) -- [line 76] Initialize
     --[[
         Upvalues: 
             [1] = u3
             [2] = u6
             [3] = u4
             [4] = u5
             [5] = u7
             [6] = u8
             [7] = u9
             [8] = u10
             [9] = t_LocalPlayer_1
             [10] = t_CurrentCamera_2
             [11] = u11
             [12] = u12
     --]]
     u3 = u6:LoadModule("SpectateManager");
     u4 = u6:LoadModule("RecoilHandler");
     u5 = u6:LoadModule("WeaponManagerClient");
     p8.FPSTick = tick();
     u7(p8, "CameraShakeSpringX", 1, 20, 0.03, true);
     u7(p8, "CameraShakeSpringY", 1, 20, 0.03, true);
     u7(p8, "CameraShakeSpringZ", 1, 20, 0.03, true);
     p8.AimPunchSpringX = u8.new(0, 0, 0);
     p8.AimPunchSpringX.k = 0.1;
     p8.AimPunchSpringX.d = 0.1;
     p8.AimPunchSpringY = u8.new(0, 0, 0);
     p8.AimPunchSpringY.k = 0.1;
     p8.AimPunchSpringY.d = 0.1;
     p8.AimPunchSpringZ = u8.new(0, 0, 0);
     p8.AimPunchSpringZ.k = 0.1;
     p8.AimPunchSpringZ.d = 0.1;
     local v24 = game:GetService("RunService").RenderStepped;
     local u13 = p8;
     v24:Connect(function(p9) -- [line 99] anonymous function
         --[[
             Upvalues: 
                 [1] = u13
                 [2] = u9
                 [3] = u10
                 [4] = u3
                 [5] = t_LocalPlayer_1
                 [6] = u5
                 [7] = t_CurrentCamera_2
                 [8] = u4
         --]]
         local v25 = false;
         local v26 = game.ReplicatedStorage:FindFirstChild("CameraShake");
         local v27 = v26;
         local v28;
         if (v26) then
             v28 = v27.AngleX.K.Value;
             if (not v28) then
                 v25 = true;
             end
         else
             v25 = true;
         end
         if (v25) then
             v28 = 25;
         end
         local v29 = false;
         local v30;
         if (v27) then
             v30 = v27.AngleX.D.Value;
             if (not v30) then
                 v29 = true;
             end
         else
             v29 = true;
         end
         if (v29) then
             v30 = 0.5;
         end
         local v31 = false;
         local v32;
         if (v27) then
             v32 = v27.AngleY.K.Value;
             if (not v32) then
                 v31 = true;
             end
         else
             v31 = true;
         end
         if (v31) then
             v32 = 25;
         end
         local v33 = false;
         local v34;
         if (v27) then
             v34 = v27.AngleY.D.Value;
             if (not v34) then
                 v33 = true;
             end
         else
             v33 = true;
         end
         if (v33) then
             v34 = 0.5;
         end
         local v35 = false;
         local v36;
         if (v27) then
             v36 = v27.AngleZ.K.Value;
             if (not v36) then
                 v35 = true;
             end
         else
             v35 = true;
         end
         if (v35) then
             v36 = 25;
         end
         local v37 = false;
         local v38;
         if (v27) then
             v38 = v27.AngleZ.D.Value;
             if (not v38) then
                 v37 = true;
             end
         else
             v37 = true;
         end
         if (v37) then
             v38 = 0.5;
         end
         u13.AimPunchSpringX.k = v28;
         u13.AimPunchSpringX.d = v30;
         u13.AimPunchSpringY.k = v32;
         u13.AimPunchSpringY.d = v34;
         u13.AimPunchSpringZ.k = v36;
         u13.AimPunchSpringZ.d = v38;
         u13.AimPunchSpringX:update(p9);
         u13.AimPunchSpringY:update(p9);
         u13.AimPunchSpringZ:update(p9);
         local v39 = (-u13.LastAimPunchSpringX) + u13.AimPunchSpringX.position;
         local v40 = (-u13.LastAimPunchSpringY) + u13.AimPunchSpringY.position;
         local v41 = (-u13.LastAimPunchSpringZ) + u13.AimPunchSpringZ.position;
         u13.LastAimPunchSpringX = u13.AimPunchSpringX.position;
         u13.LastAimPunchSpringY = u13.AimPunchSpringY.position;
         u13.LastAimPunchSpringZ = u13.AimPunchSpringZ.position;
         local v42 = u9.CurrentWeaponData;
         if (v42) then
             v42 = u10[u9.CurrentWeaponData.Weapon].Kickback;
         end
         local v43 = u9.CurrentWeapon;
         if (v43) then
             v43 = u9.CurrentWeapon:FindFirstChild("CameraShake");
         end
         local v44 = false;
         local v45;
         if (v43) then
             v45 = u9.CurrentWeapon.CameraShake.AngleX.K.Value;
             if (not v45) then
                 v44 = true;
             end
         else
             v44 = true;
         end
         if (v44) then
             local v46 = false;
             if (v42) then
                 v45 = v42.X.K;
                 if (not v45) then
                     v46 = true;
                 end
             else
                 v46 = true;
             end
             if (v46) then
                 v45 = 25;
             end
         end
         local v47 = false;
         local v48;
         if (v43) then
             v48 = u9.CurrentWeapon.CameraShake.AngleX.D.Value;
             if (not v48) then
                 v47 = true;
             end
         else
             v47 = true;
         end
         if (v47) then
             local v49 = false;
             if (v42) then
                 v48 = v42.X.D;
                 if (not v48) then
                     v49 = true;
                 end
             else
                 v49 = true;
             end
             if (v49) then
                 v48 = 0.5;
             end
         end
         local v50 = false;
         local v51;
         if (v43) then
             v51 = u9.CurrentWeapon.CameraShake.AngleY.K.Value;
             if (not v51) then
                 v50 = true;
             end
         else
             v50 = true;
         end
         if (v50) then
             local v52 = false;
             if (v42) then
                 v51 = v42.Y.K;
                 if (not v51) then
                     v52 = true;
                 end
             else
                 v52 = true;
             end
             if (v52) then
                 v51 = 25;
             end
         end
         local v53 = false;
         local v54;
         if (v43) then
             v54 = u9.CurrentWeapon.CameraShake.AngleY.D.Value;
             if (not v54) then
                 v53 = true;
             end
         else
             v53 = true;
         end
         if (v53) then
             local v55 = false;
             if (v42) then
                 v54 = v42.Y.D;
                 if (not v54) then
                     v55 = true;
                 end
             else
                 v55 = true;
             end
             if (v55) then
                 v54 = 0.5;
             end
         end
         local v56 = false;
         local v57;
         if (v43) then
             v57 = u9.CurrentWeapon.CameraShake.AngleZ.K.Value;
             if (not v57) then
                 v56 = true;
             end
         else
             v56 = true;
         end
         if (v56) then
             local v58 = false;
             if (v42) then
                 v57 = v42.Z.K;
                 if (not v57) then
                     v58 = true;
                 end
             else
                 v58 = true;
             end
             if (v58) then
                 v57 = 25;
             end
         end
         local v59 = false;
         local v60;
         if (v43) then
             v60 = u9.CurrentWeapon.CameraShake.AngleZ.D.Value;
             if (not v60) then
                 v59 = true;
             end
         else
             v59 = true;
         end
         if (v59) then
             local v61 = false;
             if (v42) then
                 v60 = v42.Z.D;
                 if (not v60) then
                     v61 = true;
                 end
             else
                 v61 = true;
             end
             if (v61) then
                 v60 = 0.5;
             end
         end
         u13.CameraShakeSpringX._speed = v45;
         u13.CameraShakeSpringX._damper = v48;
         u13.CameraShakeSpringY._speed = v51;
         u13.CameraShakeSpringY._damper = v54;
         u13.CameraShakeSpringZ._speed = v57;
         u13.CameraShakeSpringZ._damper = v60;
         u13.CameraShakeSpringX:Impulse(0);
         u13.CameraShakeSpringY:Impulse(0);
         u13.CameraShakeSpringZ:Impulse(0);
         local v62 = (-u13.LastCameraSpringBounceX) + u13.CameraShakeSpringX.position;
         local v63 = (-u13.LastCameraSpringBounceY) + u13.CameraShakeSpringY.position;
         local v64 = (-u13.LastCameraSpringBounceZ) + u13.CameraShakeSpringZ.position;
         u13.LastCameraSpringBounceX = u13.CameraShakeSpringX.position;
         u13.LastCameraSpringBounceY = u13.CameraShakeSpringY.position;
         u13.LastCameraSpringBounceZ = u13.CameraShakeSpringZ.position;
         local v65 = u9.CurrentWeapon;
         if (v65) then
             v65 = u9.CurrentWeapon.Parent;
             if (v65) then
                 v65 = u9.CurrentWeaponData;
                 if (v65) then
                     v65 = u10[u9.CurrentWeaponData.Weapon];
                 end
             end
         end
         local v66 = v65;
         if (v66) then
             v66 = v65.FireType == "Single";
         end
         if (v65 and (not u3.Spectating)) then
             local v67 = false;
             local v68;
             if (v65.FOV) then
                 v68 = v65.FOV - 80;
                 if (not v68) then
                     v67 = true;
                 end
             else
                 v67 = true;
             end
             if (v67) then
                 v68 = 0;
             end
             local v69 = u9.AbilityInUse;
             if (v69) then
                 v69 = t_LocalPlayer_1.CharacterName.Value == "Zolt";
             end
             if (v69) then
                 u5.ZoltZoom.Target = 10;
             else
                 u5.ZoltZoom.Target = 0;
             end
             t_CurrentCamera_2.FieldOfView = (80 + (v68 * u5.CurrentAimLerp.position)) + u5.ZoltZoom.Position;
         end
         local v70 = false;
         local v71 = tick() - u13.LastCameraShakeTick;
         local v72;
         if (v65) then
             v72 = v65.CameraResetTime;
             if (not v72) then
                 v70 = true;
             end
         else
             v70 = true;
         end
         if (v70) then
             if (v66) then
                 v72 = 0.15;
             else
                 if (u13.IsFiring) then
                     v72 = 0.4;
                 else
                     v72 = 0.1;
                 end
             end
         end
         if (v72 < v71) then
             local v73 = false;
             local v74;
             if (v65) then
                 v74 = v65.CameraReturnMultiplier;
                 if (not v74) then
                     v73 = true;
                 end
             else
                 v73 = true;
             end
             if (v73) then
                 v74 = 0.8;
             end
             local v75 = u13;
             v75.TotalCameraX = v75.TotalCameraX * math.clamp(v74, 0, 1);
             local v76 = u13;
             v76.TotalCameraY = v76.TotalCameraY * math.clamp(v74, 0, 1);
         end
         if (v65 and v65.RecoilResetTime) then
             local v77 = tick() - u13.LastCameraShakeTick;
             local t_RecoilResetTime_3 = v65.RecoilResetTime;
             if (t_RecoilResetTime_3 < v77) then
                 u4:ResetRecoil();
             end
         end
         local v78 = false;
         local v79 = u13.TotalCameraX - u13.CurrentCameraX;
         local v80;
         if (v65) then
             v80 = v65.CameraBeginMultiplier;
             if (not v80) then
                 v78 = true;
             end
         else
             v78 = true;
         end
         if (v78) then
             v80 = 0.2;
         end
         local v81 = false;
         local v82 = (v79 * math.clamp(v80, 0, 1)) + u13.CurrentCameraX;
         local v83 = u13.TotalCameraY - u13.CurrentCameraY;
         local v84;
         if (v65) then
             v84 = v65.CameraBeginMultiplier;
             if (not v84) then
                 v81 = true;
             end
         else
             v81 = true;
         end
         if (v81) then
             v84 = 0.2;
         end
         local v85 = (v83 * math.clamp(v84, 0, 1)) + u13.CurrentCameraY;
         u13.CurrentCameraX = v82;
         u13.CurrentCameraY = v85;
         local v86 = u13.TotalCameraX - v82;
         local v87 = u13.TotalCameraY - v85;
         if (not u3.Spectating) then
             t_CurrentCamera_2.CFrame = t_CurrentCamera_2.CFrame * CFrame.Angles(math.rad((v87 + v63) + v40), math.rad(-((v86 + v62) + v39)), math.rad(v64 + v41));
         end
     end);
     local v88 = u11;
     local u14 = p8;
     v88:OnClientEvent("AimPunch", function(p10) -- [line 220] anonymous function
         --[[
             Upvalues: 
                 [1] = u14
                 [2] = u12
         --]]
         local v89 = false;
         local v90 = game.ReplicatedStorage:FindFirstChild("CameraShake");
         local v91 = v90;
         local v92;
         if (v90) then
             v92 = v91.AngleX.Shake.Value;
             if (not v92) then
                 v89 = true;
             end
         else
             v89 = true;
         end
         if (v89) then
             v92 = 0;
         end
         local v93 = false;
         local v94;
         if (v91) then
             v94 = v91.AngleY.Shake.Value;
             if (not v94) then
                 v93 = true;
             end
         else
             v93 = true;
         end
         if (v93) then
             v94 = 0;
         end
         local v95 = false;
         local v96;
         if (v91) then
             v96 = v91.AngleZ.Shake.Value;
             if (not v96) then
                 v95 = true;
             end
         else
             v95 = true;
         end
         if (v95) then
             v96 = 0;
         end
         local v97 = u14.AimPunchSpringX;
         v97.velocity = v97.velocity + (v92 * p10);
         local v98 = u14.AimPunchSpringY;
         v98.velocity = v98.velocity + (v94 * p10);
         local v99 = u14.AimPunchSpringZ;
         v99.velocity = v99.velocity + (v96 * p10);
         u12:PlaySound("Head Tapped");
     end);
 end;
 v1.Initialize = f_Initialize;
 return v1;
 