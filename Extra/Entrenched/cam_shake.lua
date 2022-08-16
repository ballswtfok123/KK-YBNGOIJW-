-- Decompiled with the Synapse X Luau decompiler.
 --NOTE: Currently in beta! Not representative of final product.
 local u1 = {};
 u1.__index = u1;
 local u2 = debug.profilebegin;
 local u3 = debug.profileend;
 local v1 = Vector3.new;
 local u4 = CFrame.new;
 local u5 = CFrame.Angles;
 local u6 = math.rad;
 local u7 = v1();
 local u8 = require(script.CameraShakeInstance);
 local t_CameraShakeState_1 = u8.CameraShakeState;
 local u9 = v1(0.15, 0.15, 0.15);
 local u10 = v1(1, 1, 1);
 u1.CameraShakeInstance = u8;
 u1.Presets = require(script.CameraShakePresets);
 local f_new;
 f_new = function(p1, p2) -- [line 87] new
     --[[
         Upvalues: 
             [1] = u7
             [2] = u1
     --]]
     assert(type(p1) == "number", "RenderPriority must be a number (e.g.: Enum.RenderPriority.Camera.Value)");
     assert(type(p2) == "function", "Callback must be a function");
     local g_setmetatable_2 = setmetatable;
     local v2 = {};
     v2._running = false;
     v2._renderName = "CameraShaker";
     v2._renderPriority = p1;
     v2._posAddShake = u7;
     v2._rotAddShake = u7;
     v2._camShakeInstances = {};
     v2._removeInstances = {};
     v2._callback = p2;
     return g_setmetatable_2(v2, u1);
 end;
 u1.new = f_new;
 local f_Start;
 f_Start = function(p3) -- [line 108] Start
     --[[
         Upvalues: 
             [1] = u2
             [2] = u3
     --]]
     if (p3._running) then
         return;
     end
     p3._running = true;
     local v3 = p3._callback;
     local v4 = game:GetService("RunService");
     local v5 = p3._renderName;
     local v6 = p3._renderPriority;
     local u11 = p3;
     local t__callback_3 = v3;
     v4:BindToRenderStep(v5, v6, function(p4) -- [line 112] anonymous function
         --[[
             Upvalues: 
                 [1] = u2
                 [2] = u11
                 [3] = u3
                 [4] = t__callback_3
         --]]
         u2("CameraShakerUpdate");
         local v7 = u11:Update(p4);
         u3();
         t__callback_3(v7);
     end);
 end;
 u1.Start = f_Start;
 local f_Stop;
 f_Stop = function(p5) -- [line 121] Stop
     if (not p5._running) then
         return;
     end
     game:GetService("RunService"):UnbindFromRenderStep(p5._renderName);
     p5._running = false;
 end;
 u1.Stop = f_Stop;
 local f_StopSustained;
 f_StopSustained = function(p6, p7) -- [line 128] StopSustained
     local v8, v9, v10 = pairs(p6._camShakeInstances);
     local v11 = v8;
     local v12 = v9;
     local v13 = v10;
     while true do
         local v14, v15 = v11(v12, v13);
         local v16 = v14;
         local v17 = v15;
         if (v14) then
             break;
         end
         v13 = v16;
         local t_fadeOutDuration_4 = v17.fadeOutDuration;
         if (t_fadeOutDuration_4 == 0) then
             local v18 = p7;
             if (not v18) then
                 v18 = v17.fadeInDuration;
             end
             v17:StartFadeOut(v18);
         end
     end
 end;
 u1.StopSustained = f_StopSustained;
 local f_Update;
 f_Update = function(p8, p9) -- [line 137] Update
     --[[
         Upvalues: 
             [1] = u7
             [2] = t_CameraShakeState_1
             [3] = u4
             [4] = u5
             [5] = u6
     --]]
     local v19 = u7;
     local v20 = u7;
     local v21 = p8._camShakeInstances;
     local t__camShakeInstances_5 = v21;
     local v22 = 1;
     local v23 = #v21;
     local v24 = v23;
     local v25 = v22;
     if (not (v23 <= v25)) then
         while true do
             local v26 = t__camShakeInstances_5[v22];
             local v27 = v26;
             local v28 = v26:GetState();
             if ((v28 == t_CameraShakeState_1.Inactive) and v26.DeleteOnInactive) then
                 p8._removeInstances[(#p8._removeInstances) + 1] = v22;
             else
                 if (v28 ~= t_CameraShakeState_1.Inactive) then
                     local v29 = v27:UpdateShake(p9);
                     v19 = v19 + (v29 * v27.PositionInfluence);
                     v20 = v20 + (v29 * v27.RotationInfluence);
                 end
             end
             local v30 = v22 + 1;
             v22 = v30;
             local v31 = v24;
             if (v31 < v30) then
                 break;
             end
         end
     end
     local v32 = #p8._removeInstances;
     local v33 = v32;
     if (not (v33 <= 1)) then
         while true do
             table.remove(t__camShakeInstances_5, p8._removeInstances[v32]);
             p8._removeInstances[v32] = nil;
             local v34 = v32 + -1;
             v32 = v34;
             if (v34 < 1) then
                 break;
             end
         end
     end
     return (u4(v19) * u5(0, u6(v20.Y), 0)) * u5(u6(v20.X), 0, u6(v20.Z));
 end;
 u1.Update = f_Update;
 local f_Shake;
 f_Shake = function(p10, p11) -- [line 174] Shake
     local v35 = false;
     local v36 = type(p11);
     if (v36 == "table") then
         v35 = p11._camShakeInstance;
     end
     assert(v35, "ShakeInstance must be of type CameraShakeInstance");
     p10._camShakeInstances[(#p10._camShakeInstances) + 1] = p11;
     return p11;
 end;
 u1.Shake = f_Shake;
 local f_ShakeSustain;
 f_ShakeSustain = function(p12, p13) -- [line 181] ShakeSustain
     local v37 = false;
     local v38 = type(p13);
     if (v38 == "table") then
         v37 = p13._camShakeInstance;
     end
     assert(v37, "ShakeInstance must be of type CameraShakeInstance");
     p12._camShakeInstances[(#p12._camShakeInstances) + 1] = p13;
     p13:StartFadeIn(p13.fadeInDuration);
     return p13;
 end;
 u1.ShakeSustain = f_ShakeSustain;
 local f_ShakeOnce;
 f_ShakeOnce = function(p14, p15, p16, p17, p18, p19, p20) -- [line 189] ShakeOnce
     --[[
         Upvalues: 
             [1] = u8
             [2] = u9
             [3] = u10
     --]]
     local v39 = false;
     local v40 = u8.new(p15, p16, p17, p18);
     local v41 = typeof(p19);
     local v42;
     if (v41 == "Vector3") then
         v42 = p19;
         if (not v42) then
             v39 = true;
         end
     else
         v39 = true;
     end
     if (v39) then
         v42 = u9;
     end
     local v43 = false;
     v40.PositionInfluence = v42;
     local v44 = typeof(p20);
     local v45;
     if (v44 == "Vector3") then
         v45 = p20;
         if (not v45) then
             v43 = true;
         end
     else
         v43 = true;
     end
     if (v43) then
         v45 = u10;
     end
     v40.RotationInfluence = v45;
     p14._camShakeInstances[(#p14._camShakeInstances) + 1] = v40;
     return v40;
 end;
 u1.ShakeOnce = f_ShakeOnce;
 local f_StartShake;
 f_StartShake = function(p21, p22, p23, p24, p25, p26) -- [line 198] StartShake
     --[[
         Upvalues: 
             [1] = u8
             [2] = u9
             [3] = u10
     --]]
     local v46 = false;
     local v47 = u8.new(p22, p23, p24);
     local v48 = typeof(p25);
     local v49;
     if (v48 == "Vector3") then
         v49 = p25;
         if (not v49) then
             v46 = true;
         end
     else
         v46 = true;
     end
     if (v46) then
         v49 = u9;
     end
     local v50 = false;
     v47.PositionInfluence = v49;
     local v51 = typeof(p26);
     local v52;
     if (v51 == "Vector3") then
         v52 = p26;
         if (not v52) then
             v50 = true;
         end
     else
         v50 = true;
     end
     if (v50) then
         v52 = u10;
     end
     v47.RotationInfluence = v52;
     v47:StartFadeIn(p24);
     p21._camShakeInstances[(#p21._camShakeInstances) + 1] = v47;
     return v47;
 end;
 u1.StartShake = f_StartShake;
 return u1;
 