-- Decompiled with the Synapse X Luau decompiler.
 --NOTE: Currently in beta! Not representative of final product.
 local u1 = require(game.ReplicatedStorage.Modules.Shared.ModuleLoader):LoadModule("NewSpring");
 local f_CreateSpring;
 f_CreateSpring = function(p1, p2, p3, p4, p5, p6, p7) -- [line 4] CreateSpring
     --[[
         Upvalues: 
             [1] = u1
     --]]
     local v1 = false;
     local t_new_1 = u1.new;
     local v2;
     if (p7) then
         v2 = Vector3.new();
         if (not v2) then
             v1 = true;
         end
     else
         v1 = true;
     end
     if (v1) then
         v2 = 0;
     end
     p1[p2] = t_new_1(v2);
     if (p6) then
         return;
     end
     local u2, u4, u3;
     if (game.ReplicatedStorage.SpringValues:FindFirstChild(p2)) then
         u2 = game.ReplicatedStorage.SpringValues[p2].Damper;
         u3 = game.ReplicatedStorage.SpringValues[p2].Speed;
         u4 = game.ReplicatedStorage.SpringValues[p2].Multiplier;
     else
         local v3 = Instance.new("Folder");
         v3.Name = p2;
         v3.Parent = game.ReplicatedStorage.SpringValues;
         u2 = Instance.new("NumberValue");
         u2.Name = "Damper";
         u2.Value = p3;
         u2.Parent = v3;
         u3 = Instance.new("NumberValue");
         u3.Name = "Speed";
         u3.Value = p4;
         u3.Parent = v3;
         u4 = Instance.new("NumberValue");
         u4.Name = "Multiplier";
         u4.Value = p5;
         u4.Parent = v3;
     end
     local u5 = p1;
     local u6 = p2;
     local f_ValueChanged;
     f_ValueChanged = function() -- [line 40] ValueChanged
         --[[
             Upvalues: 
                 [1] = u5
                 [2] = u6
                 [3] = u2
                 [4] = u3
                 [5] = u4
         --]]
         u5[u6]._damper = u2.Value;
         u5[u6]._speed = u3.Value;
         u5[u6]._multiplier = u4.Value;
     end;
     local u7 = p1;
     local u8 = p2;
     local f_ConnectValue;
     f_ConnectValue = function(p8) -- [line 46] ConnectValue
         --[[
             Upvalues: 
                 [1] = u7
                 [2] = u8
                 [3] = u2
                 [4] = u3
                 [5] = u4
         --]]
         p8.Changed:Connect(function() -- [line 47] anonymous function
             --[[
                 Upvalues: 
                     [1] = u7
                     [2] = u8
                     [3] = u2
                     [4] = u3
                     [5] = u4
             --]]
             u7[u8]._damper = u2.Value;
             u7[u8]._speed = u3.Value;
             u7[u8]._multiplier = u4.Value;
         end);
     end;
     local v4 = u2.Changed;
     local u9 = p1;
     local u10 = p2;
     v4:Connect(function() -- [line 47] anonymous function
         --[[
             Upvalues: 
                 [1] = u9
                 [2] = u10
                 [3] = u2
                 [4] = u3
                 [5] = u4
         --]]
         u9[u10]._damper = u2.Value;
         u9[u10]._speed = u3.Value;
         u9[u10]._multiplier = u4.Value;
     end);
     local v5 = u3.Changed;
     local u11 = p1;
     local u12 = p2;
     v5:Connect(function() -- [line 47] anonymous function
         --[[
             Upvalues: 
                 [1] = u11
                 [2] = u12
                 [3] = u2
                 [4] = u3
                 [5] = u4
         --]]
         u11[u12]._damper = u2.Value;
         u11[u12]._speed = u3.Value;
         u11[u12]._multiplier = u4.Value;
     end);
     local v6 = u4.Changed;
     local u13 = p1;
     local u14 = p2;
     v6:Connect(function() -- [line 47] anonymous function
         --[[
             Upvalues: 
                 [1] = u13
                 [2] = u14
                 [3] = u2
                 [4] = u3
                 [5] = u4
         --]]
         u13[u14]._damper = u2.Value;
         u13[u14]._speed = u3.Value;
         u13[u14]._multiplier = u4.Value;
     end);
     p1[p2]._damper = u2.Value;
     p1[p2]._speed = u3.Value;
     p1[p2]._multiplier = u4.Value;
 end;
 CreateSpring = f_CreateSpring;
 return CreateSpring;
 