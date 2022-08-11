-- Decompiled with the Synapse X Luau decompiler.
 --NOTE: Currently in beta! Not representative of final product.
 local u1 = {};
 local f_new;
 f_new = function(p1, p2) -- [line 45] new
     --[[
         Upvalues: 
             [1] = u1
     --]]
     local v1 = p1 or 0;
     local v2 = p2;
     if (not v2) then
         v2 = os.clock;
     end
     local v3 = v2;
     p2 = v3;
     local g_setmetatable_1 = setmetatable;
     local v4 = {};
     v4._clock = v3;
     v4._time0 = v3();
     v4._position0 = v1;
     v4._velocity0 = 0 * v1;
     v4._target = v1;
     v4._damper = 1;
     v4._speed = 1;
     v4._multiplier = 1;
     v4._previoustarget = 0;
     return g_setmetatable_1(v4, u1);
 end;
 u1.new = f_new;
 local f_TargetImpulse;
 f_TargetImpulse = function(p3, p4) -- [line 63] TargetImpulse
     p3.Velocity = p3.Velocity + ((p4 - p3._previoustarget) * p3._multiplier);
     p3._previoustarget = p4;
 end;
 u1.TargetImpulse = f_TargetImpulse;
 local f_Impulse;
 f_Impulse = function(p5, p6) -- [line 70] Impulse
     p5.Velocity = p5.Velocity + (p6 * p5._multiplier);
 end;
 u1.Impulse = f_Impulse;
 local f_TimeSkip;
 f_TimeSkip = function(p7, p8) -- [line 76] TimeSkip
     local v5 = p7._clock();
     local v6, v7 = p7:_positionVelocity(v5 + p8);
     p7._position0 = v6;
     p7._velocity0 = v7;
     p7._time0 = v5;
 end;
 u1.TimeSkip = f_TimeSkip;
 local f_Update;
 f_Update = function(p9) -- [line 84] Update
     local v8, v9 = p9:_positionVelocity(p9._clock());
 end;
 u1.Update = f_Update;
 local f___index;
 f___index = function(p10, p11) -- [line 89] __index
     --[[
         Upvalues: 
             [1] = u1
     --]]
     if (u1[p11]) then
         return u1[p11];
     end
     if (((p11 == "Value") or (p11 == "Position")) or (p11 == "p")) then
         local v10, v11 = p10:_positionVelocity(p10._clock());
         return v10;
     end
     if ((p11 == "Velocity") or (p11 == "v")) then
         local v12, v13 = p10:_positionVelocity(p10._clock());
         return v13;
     end
     if ((p11 == "Target") or (p11 == "t")) then
         return p10._target;
     end
     if ((p11 == "Damper") or (p11 == "d")) then
         return p10._damper;
     end
     if ((p11 == "Speed") or (p11 == "s")) then
         return p10._speed;
     end
     if (p11 == "Clock") then
         return p10._clock;
     end
     if (p11 == "position") then
         return p10._position0;
     end
     error(("%q is not a valid member of Spring"):format(tostring(p11)), 2);
 end;
 u1.__index = f___index;
 local f___newindex;
 f___newindex = function(p12, p13, p14) -- [line 113] __newindex
     local v14 = p12._clock();
     if (((p13 == "Value") or (p13 == "Position")) or (p13 == "p")) then
         local v15, v16 = p12:_positionVelocity(v14);
         p12._position0 = p14;
         p12._velocity0 = v16;
         p12._time0 = v14;
         return;
     end
     if ((p13 == "Velocity") or (p13 == "v")) then
         local v17, v18 = p12:_positionVelocity(v14);
         p12._position0 = v17;
         p12._velocity0 = p14;
         p12._time0 = v14;
         return;
     end
     if ((p13 == "Target") or (p13 == "t")) then
         local v19, v20 = p12:_positionVelocity(v14);
         p12._position0 = v19;
         p12._velocity0 = v20;
         p12._target = p14;
         p12._time0 = v14;
         return;
     end
     if ((p13 == "Damper") or (p13 == "d")) then
         local v21, v22 = p12:_positionVelocity(v14);
         p12._position0 = v21;
         p12._velocity0 = v22;
         p12._damper = p14;
         p12._time0 = v14;
         return;
     end
     if ((p13 == "Speed") or (p13 == "s")) then
         local v23, v24 = p12:_positionVelocity(v14);
         p12._position0 = v23;
         p12._velocity0 = v24;
         local v25;
         if (p14 <= 0) then
             v25 = 0;
         else
             v25 = p14;
         end
         p12._speed = v25;
         p12._time0 = v14;
         return;
     end
     if (p13 ~= "Clock") then
         error(("%q is not a valid member of Spring"):format(tostring(p13)), 2);
         return;
     end
     local v26, v27 = p12:_positionVelocity(v14);
     p12._position0 = v26;
     p12._velocity0 = v27;
     p12._clock = p14;
     p12._time0 = p14();
 end;
 u1.__newindex = f___newindex;
 local f__positionVelocity;
 f__positionVelocity = function(p15, p16) -- [line 155] _positionVelocity
     local t__position0_2 = p15._position0;
     local t__velocity0_3 = p15._velocity0;
     local t__target_4 = p15._target;
     local v28 = p15._damper;
     local t__damper_5 = v28;
     local v29 = p15._speed;
     local t__speed_6 = v29;
     local v30 = v29 * (p16 - p15._time0);
     local v31 = v28 * v28;
     local v32, v37, v36;
     if (v31 <= 1) then
         v32 = math.sqrt(1 - v31);
         local v33 = math.exp((-t__damper_5) * v30) / v32;
         local v34 = v33 * math.cos(v32 * v30);
         local v35 = v33 * math.sin(v32 * v30);
         v36 = v34;
         v37 = v35;
     else
         if (v31 == 1) then
             v32 = 1;
             local v38 = math.exp((-t__damper_5) * v30) / v32;
             local v39 = v38 * v30;
             v36 = v38;
             v37 = v39;
         else
             v32 = math.sqrt(v31 - 1);
             local v40 = math.exp(((-t__damper_5) + v32) * v30) / (2 * v32);
             local v41 = math.exp(((-t__damper_5) - v32) * v30) / (2 * v32);
             local v42 = v40 + v41;
             local v43 = v40 - v41;
             v36 = v42;
             v37 = v43;
         end
     end
     return ((((v32 * v36) + (t__damper_5 * v37)) * t__position0_2) + ((1 - ((v32 * v36) + (t__damper_5 * v37))) * t__target_4)) + ((v37 / t__speed_6) * t__velocity0_3), ((((-t__speed_6) * v37) * t__position0_2) + ((t__speed_6 * v37) * t__target_4)) + (((v32 * v36) - (t__damper_5 * v37)) * t__velocity0_3);
 end;
 u1._positionVelocity = f__positionVelocity;
 return u1;
 