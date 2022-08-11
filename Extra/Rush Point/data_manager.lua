-- Decompiled with the Synapse X Luau decompiler.
 --NOTE: Currently in beta! Not representative of final product.
 local v1 = {};
 v1.DataLoaded = false;
 v1.OnLoadListeners = {};
 v1.OnUpdateListeners = {};
 local v2 = game.Players.LocalPlayer:GetMouse();
 local v3 = require(game.ReplicatedStorage.Modules.Shared.ModuleLoader);
 local u1 = v3:LoadModule("Network");
 local v4 = v3:LoadModule("Clean");
 local u2 = v3:LoadModule("SettingsManager");
 local f_OnLoad;
 f_OnLoad = function(p1, p2) -- [line 23] OnLoad
     table.insert(p1.OnLoadListeners, p2);
     if (p1.DataLoaded) then
         p2();
     end
 end;
 v1.OnLoad = f_OnLoad;
 local f_OnUpdate;
 f_OnUpdate = function(p3, p4, p5) -- [line 31] OnUpdate
     local v5 = typeof(p4);
     if (v5 ~= "table") then
         p4 = {
             p4
         };
     end
     local v6 = 1;
     local v7 = #p4;
     local v8 = v7;
     local v9 = v6;
     if (not (v7 <= v9)) then
         while true do
             local v10 = p4[v6];
             local v11 = v10;
             if (not p3.OnUpdateListeners[v10]) then
                 p3.OnUpdateListeners[v11] = {};
             end
             table.insert(p3.OnUpdateListeners[v11], p5);
             local v12 = v6 + 1;
             v6 = v12;
             local v13 = v8;
             if (v13 < v12) then
                 break;
             end
         end
     end
 end;
 v1.OnUpdate = f_OnUpdate;
 local f_LoadData;
 f_LoadData = function(p6, p7) -- [line 48] LoadData
     --[[
         Upvalues: 
             [1] = u2
     --]]
     if (p6.DataLoaded) then
         return;
     end
     print("Loaded data");
     u2:LoadSettings(p7.Settings, p7.Keybinds);
     p6.Data = p7;
     p6.DataLoaded = true;
     local v14 = 1;
     local v15 = #p6.OnLoadListeners;
     local v16 = v15;
     local v17 = v14;
     if (not (v15 <= v17)) then
         while true do
             p6.OnLoadListeners[v14]();
             local v18 = v14 + 1;
             v14 = v18;
             local v19 = v16;
             if (v19 < v18) then
                 break;
             end
         end
     end
 end;
 v1.LoadData = f_LoadData;
 local f_Initialize;
 f_Initialize = function(p8) -- [line 66] Initialize
     --[[
         Upvalues: 
             [1] = u1
     --]]
     warn("Initialized Data Manager");
     local v20 = u1;
     local u3 = p8;
     v20:OnClientEvent("LoadData", function(p9) -- [line 69] anonymous function
         --[[
             Upvalues: 
                 [1] = u3
         --]]
         u3:LoadData(p9);
     end);
     local v21 = u1;
     local u4 = p8;
     v21:OnClientEvent("UpdateData", function(p10) -- [line 73] anonymous function
         --[[
             Upvalues: 
                 [1] = u4
         --]]
         local v22, v23, v24 = pairs(p10);
         local v25 = v22;
         local v26 = v23;
         local v27 = v24;
         while true do
             local v28, v29 = v25(v26, v27);
             local v30 = v28;
             local v31 = v29;
             if (v28) then
                 break;
             end
             v27 = v30;
             u4.Data[v30] = v31;
             if (u4.OnUpdateListeners[v30]) then
                 local v32 = 1;
                 local v33 = #u4.OnUpdateListeners[v30];
                 local v34 = v33;
                 local v35 = v32;
                 if (not (v33 <= v35)) then
                     while true do
                         u4.OnUpdateListeners[v30][v32]();
                         local v36 = v32 + 1;
                         v32 = v36;
                         local v37 = v34;
                         if (v37 < v36) then
                             break;
                         end
                     end
                 end
             end
         end
     end);
     local v38 = u1:InvokeServer("GetData");
     local v39 = v38;
     if (v38) then
         p8:LoadData(v39);
     end
 end;
 v1.Initialize = f_Initialize;
 return v1;
 