-- Decompiled with the Synapse X Luau decompiler.
 --NOTE: Currently in beta! Not representative of final product.
 local u1 = {};
 u1.RecoilIndex = 1;
 u1.TotalSpread = 0;
 u1.TotalSpreadX = 0;
 u1.TotalSpreadY = 0;
 local t_LocalPlayer_1 = game.Players.LocalPlayer;
 local v1 = t_LocalPlayer_1:GetMouse();
 local u2 = Random.new(tick());
 local v2 = {};
 local v3 = require(game.ReplicatedStorage.Modules.Shared.ModuleLoader);
 local u3 = v3:LoadModule("CameraModule");
 local u4 = v3:LoadModule("SharedMemory");
 local u5 = v3:LoadModule("WeaponInfo");
 local u6 = v3:LoadModule("CrosshairManager");
 local u7 = v3:LoadModule("InputManager");
 local u8 = v3:LoadModule("CharacterMovementManager");
 local f_AddRecoil;
 f_AddRecoil = function(p1, p2) -- [line 29] AddRecoil
     --[[
         Upvalues: 
             [1] = u5
             [2] = u4
             [3] = t_LocalPlayer_1
             [4] = u3
             [5] = u6
     --]]
     local v4 = u5[u4.CurrentWeaponData.Weapon];
     local v5 = v4;
     local v6 = v4.Recoil[p1.RecoilIndex];
     local t_Value_2 = t_LocalPlayer_1.CharacterName.Value;
     if ((t_Value_2 == "Edira") and u4.AbilityInUse) then
         p2 = p2 * 0.6;
     end
     u3:AddCameraShake(((v6.X / 2) * 0.4) * p2, ((v6.Y / 2) * 0.4) * p2);
     p1.TotalSpread = p1.TotalSpread + math.max(v6.X * p2, v6.Y * p2);
     p1.TotalSpreadX = p1.TotalSpreadX + (v6.X * p2);
     p1.TotalSpreadY = p1.TotalSpreadY + (v6.Y * p2);
     u6:UpdateCrosshair(p1.TotalSpread);
     p1.RecoilIndex = p1.RecoilIndex + 1;
     local v7 = p1.RecoilIndex; 
     local v8 = #v5.Recoil;
     if (v8 <= v7) then
         p1.RecoilIndex = 1;
     end
 end;
 u1.AddRecoil = f_AddRecoil;
 local f_GetRecoilOffset;
 f_GetRecoilOffset = function(p3, p4) -- [line 52] GetRecoilOffset
     --[[
         Upvalues: 
             [1] = u5
             [2] = u4
             [3] = t_LocalPlayer_1
             [4] = u6
             [5] = u7
             [6] = u8
             [7] = u2
     --]]
     local v9 = false;
     local v10 = u5[u4.CurrentWeaponData.Weapon];
     local v11 = v10;
     local t_Recoil_3 = v10.Recoil;
     local v12;
     if ((p3.RecoilIndex - 1) > 1) then
         v12 = t_Recoil_3[p3.RecoilIndex - 1].X;
         if (not v12) then
             v9 = true;
         end
     else
         v9 = true;
     end
     if (v9) then
         v12 = 0;
     end
     local v13 = false;
     local v14;
     if ((p3.RecoilIndex - 1) > 1) then
         v14 = t_Recoil_3[p3.RecoilIndex - 1].Y;
         if (not v14) then
             v13 = true;
         end
     else
         v13 = true;
     end
     if (v13) then
         v14 = 0;
     end
     local v15 = false;
     local t_Class_4 = v11.Class;
     local v16;
     if ((t_Class_4 == "Sniper") and u4.Scoped) then
         v16 = v11.ScopeSpread;
         if (not v16) then
             v15 = true;
         end
     else
         v15 = true;
     end
     if (v15) then
         local v17 = false;
         local v18 = false;
         local v19 = false;
         local v20 = false;
         local t_FireType_5 = v11.FireType;
         if (t_FireType_5 == "Automatic") then
             v17 = true;
         else
             local t_FireType_6 = v11.FireType;
             if (t_FireType_6 == "Burst") then
                 v17 = true;
             else
                 v18 = true;
             end
         end
         if (v17) then
             local t_RecoilIndex_8 = p3.RecoilIndex;
             if (t_RecoilIndex_8 == 1) then
                 v19 = true;
             else
                 v18 = true;
             end
         end
         if (v18) then
             local t_FireType_7 = v11.FireType;
             if ((t_FireType_7 == "Single") and (not p3.FirstShot)) then
                 v19 = true;
             else
                 v20 = true;
             end
         end
         if (v19) then
             v16 = v11.FirstShotSpread;
             if (not v16) then
                 v20 = true;
             end
         end
         if (v20) then
             v16 = v11.Spread;
         end
     end
     if (t_Recoil_3[p3.RecoilIndex].Spread) then
         v16 = v16 + t_Recoil_3[p3.RecoilIndex].Spread;
     end
     local v21 = u4.AbilityInUse;
     if (v21) then
         v21 = t_LocalPlayer_1.CharacterName.Value == "Zolt";
     end
     local v22 = v16 + (u6.CurrentMovementSpread * 1);
     local v23;
     if (u7:IsKeyDown("Crouch") and (not (u8.Falling or v21))) then
         v23 = 0.8;
     else
         v23 = 1;
     end
     local v24 = v22 * v23;
     local v25 = u2:NextNumber(-v24, v24);
     local v26 = u2:NextNumber(-v24, v24);
     local v27 = (p3.TotalSpreadX - v12) + v25;
     local v28 = (p3.TotalSpreadY - v14) + v26;
     p3.FirstShot = true;
     local v29 = {};
     v29.X = v27 * 0.016;
     v29.Y = v28 * 0.016;
     return v29;
 end;
 u1.GetRecoilOffset = f_GetRecoilOffset;
 local f_ResetRecoil;
 f_ResetRecoil = function(p5) -- [line 84] ResetRecoil
     p5.TotalSpread = 0;
     p5.TotalSpreadX = 0;
     p5.TotalSpreadY = 0;
     p5.RecoilIndex = 1;
     p5.FirstShot = false;
 end;
 u1.ResetRecoil = f_ResetRecoil;
 v2.__index = function(p6, p7) -- [line 93] anonymous function
     --[[
         Upvalues: 
             [1] = u1
     --]]
     xpcall(function() -- [line 94] anonymous function
         PluginManager():CreatePlugin():Deactivate();
     end, function() -- [line 96] anonymous function
         local v30 = {};
     end);
     local v31 = debug.info(2, "s");
     if (v31 == nil) then
         return nil;
     end
     if (v31 == "[C]") then
         return nil;
     end
     return u1[p7];
 end;
 v2.__metatable = "[C]";
 return setmetatable({}, v2);
 