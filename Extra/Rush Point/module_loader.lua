-- Decompiled with the Synapse X Luau decompiler.
 --NOTE: Currently in beta! Not representative of final product.
 local v1 = {};
 v1.Modules = {};
 v1.LoadedModules = {};
 v1.Loaded = false;
 local v2 = game:GetService("ScriptContext");
 local u1 = game:GetService("RunService");
 local t_Client_1 = game.ReplicatedStorage.Modules.Client;
 local u2 = nil;
 local f_LoadAllModules;
 f_LoadAllModules = function(p1) -- [line 13] LoadAllModules
     --[[
         Upvalues: 
             [1] = u1
             [2] = t_Client_1
     --]]
     local v3, v4, v5 = pairs(game.ReplicatedStorage.Modules:GetDescendants());
     local v6 = v3;
     local v7 = v4;
     local v8 = v5;
     while true do
         local v9, v10 = v6(v7, v8);
         local v11 = v9;
         local v12 = v10;
         if (v9) then
             break;
         end
         v8 = v11;
         if ((v12:IsA("ModuleScript") and (not (v12 == script))) and ((u1:IsServer() and (not v12:IsDescendantOf(t_Client_1))) or u1:IsClient())) then
             p1.Modules[v12.Name] = v12;
         end
     end
     if (u1:IsServer()) then
         local v13, v14, v15 = pairs(game.ServerStorage.Modules:GetDescendants());
         local v16 = v13;
         local v17 = v14;
         local v18 = v15;
         while true do
             local v19, v20 = v16(v17, v18);
             local v21 = v19;
             local v22 = v20;
             if (v19) then
                 break;
             end
             v18 = v21;
             if (v22:IsA("ModuleScript")) then
                 p1.Modules[v22.Name] = v22;
             end
         end
     end
     p1.ModulesLoaded = true;
 end;
 v1.LoadAllModules = f_LoadAllModules;
 local f_CopyTable;
 f_CopyTable = function(p2) -- [line 31] CopyTable
     local v23 = type(p2);
     if (v23 ~= "table") then
         return p2;
     end
     local v24 = {};
     local v25, v26, v27 = pairs(p2);
     local v28 = v25;
     local v29 = v26;
     local v30 = v27;
     while true do
         local v31, v32 = v28(v29, v30);
         local v33 = v31;
         local v34 = v32;
         if (v31) then
             break;
         end
         v30 = v33;
         v24[v33] = v34;
     end
     return v24;
 end;
 local f_SetValues;
 f_SetValues = function(p3) -- [line 46] SetValues
     --[[
         Upvalues: 
             [1] = u2
     --]]
     local v35 = p3;
     local v36 = v35;
     local v37 = typeof(v35);
     if (v37 ~= "table") then
         return;
     end
     local f_CheckValues;
     f_CheckValues = function(p4) -- [line 51] CheckValues
         --[[
             Upvalues: 
                 [1] = u2
         --]]
         local v38 = string.split(debug.traceback(), "\n");
         local v39 = v38;
         local v40 = 1;
         local v41 = #v38;
         local v42 = v41;
         local v43 = v40;
         if (not (v41 <= v43)) then
             while true do
                 local v44 = false;
                 local v45 = string.split(v39[v40], ".");
                 local v46 = game;
                 if ((#v39[v40]) > 1) then
                     local v47 = 1;
                     local v48 = #v45;
                     local v49 = v48;
                     local v50 = v47;
                     if (v48 <= v50) then
                         v44 = true;
                     else
                         while true do
                             local v51 = string.split(v45[v47], ":")[1];
                             local v52 = v51;
                             if (v46:FindFirstChild(v51)) then
                                 v46 = v46[v52];
                                 local v53 = v47 + 1;
                                 v47 = v53;
                                 local v54 = v49;
                                 if (v54 < v53) then
                                     v44 = true;
                                     break;
                                 end
                             else
                                 break;
                             end
                         end
                         u2:FireServer("Yeet");
                         wait();
                         while true do
                         end
                     end
                 else
                     v44 = true;
                 end
                 if (v44) then
                     local v55 = v40 + 1;
                     v40 = v55;
                     local v56 = v42;
                     if (v56 < v55) then
                         break;
                     end
                 end
             end
         end
     end;
     local f_CheckValues = f_CheckValues;
     local u3 = p3;
     local u4 = v36;
     local f_AddMetatable;
     f_AddMetatable = function() -- [line 76] AddMetatable
         --[[
             Upvalues: 
                 [1] = f_CheckValues
                 [2] = u3
                 [3] = u4
         --]]
         local v57 = {};
         local f___index;
         f___index = function(p5, p6) -- [line 78] __index
             --[[
                 Upvalues: 
                     [1] = f_CheckValues
                     [2] = u3
                     [3] = u4
             --]]
             local v58 = f_CheckValues();
             setmetatable(u3, nil);
             local v59 = p5[p6];
             u4();
             if (v58) then
                 return;
             end
             return v59;
         end;
         v57.__index = f___index;
         local f___newindex;
         f___newindex = function(p7, p8, p9) -- [line 93] __newindex
             --[[
                 Upvalues: 
                     [1] = f_CheckValues
                     [2] = u3
                     [3] = u4
             --]]
             local v60 = f_CheckValues();
             setmetatable(u3, nil);
             if (not v60) then
                 p7[p8] = p9;
             end
             u4();
         end;
         v57.__newindex = f___newindex;
         setmetatable(u3, v57);
     end;
     if (game.Players.LocalPlayer) then
         f_AddMetatable();
     end
 end;
 local f_LoadModule;
 f_LoadModule = function(p10, p11) -- [line 114] LoadModule
     --[[
         Upvalues: 
             [1] = u2
     --]]
     local v61;
     if (p10.LoadedModules[p11]) then
         v61 = p10.LoadedModules[p11];
     else
         v61 = require(p10.Modules[p11]);
         p10.LoadedModules[p11] = v61;
     end
     if (p11 == "Network") then
         u2 = v61;
     end
     return v61;
 end;
 v1.LoadModule = f_LoadModule;
 if (not v1.Loaded) then
     v1.Loaded = true;
     f_SetValues(v1);
 end
 return v1;
 