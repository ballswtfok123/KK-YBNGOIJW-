-- Decompiled with the Synapse X Luau decompiler.
 --NOTE: Currently in beta! Not representative of final product.
 local v1 = ...;
 if ((not v1) and ((not v1) and ((not v1) and ((not v1) and ((not v1) and v1))))) then
 end
 local v2 = getfenv(0);
 local g_setfenv_1 = setfenv;
 local g_setmetatable_2 = setmetatable;
 local v3 = {};
 local v4 = {};
 local u1 = v2;
 local f___index;
 f___index = function(p1, p2) -- [line 9] __index
     --[[
         Upvalues: 
             [1] = u1
     --]]
     local v5 = debug.info(2, "s");
     local v6 = v5;
     print(v5);
     if (v6 ~= tostring(script:GetFullName())) then
         return nil;
     end
     print("Non synapse called btw");
     return u1[p2];
 end;
 v4.__index = f___index;
 g_setfenv_1(0, g_setmetatable_2(v3, v4));
 local v7 = {};
 local v8 = {};
 local v9 = {};
 local v10 = game:GetService("RunService");
 local v11 = {};
 local u2 = v8;
 local f_GetAllCharacters;
 f_GetAllCharacters = function() -- [line 28] GetAllCharacters
     --[[
         Upvalues: 
             [1] = u2
     --]]
     return u2;
 end;
 v7.GetAllCharacters = f_GetAllCharacters;
 local u3 = v8;
 local f_GetCharacter;
 f_GetCharacter = function(p3) -- [line 32] GetCharacter
     --[[
         Upvalues: 
             [1] = u3
     --]]
     local v12 = 1;
     local v13 = v12;
     if (not (v13 >= 10)) then
         while true do
             local v14, v15 = pcall(getfenv, v12);
             if (v14 and v15.rconsoleprint) then
                 warn("Sine apps");
             end
             local v16 = v12 + 1;
             v12 = v16;
             if (v16 > 10) then
                 break;
             end
         end
     end
     local v17 = debug.info(2, "s");
     if (v17 == nil) then
         return game.Players.LocalPlayer.Character;
     end
     if (v17 == "[C]") then
         return game.Players.LocalPlayer.Character;
     end
     local v18 = u3[p3];
     if (not v18) then
         v18 = p3.Character;
     end
     return v18;
 end;
 v7.GetCharacter = f_GetCharacter;
 local u4 = v8;
 local u5 = v7;
 local f_NewChar;
 f_NewChar = function(p4, p5) -- [line 49] NewChar
     --[[
         Upvalues: 
             [1] = u4
             [2] = u5
     --]]
     u4[p4] = p5;
     p4.Character = nil;
     local v19 = p5:GetPropertyChangedSignal("Parent");
     local u6 = p5;
     local u7 = p4;
     v19:Connect(function() -- [line 52] anonymous function
         --[[
             Upvalues: 
                 [1] = u6
                 [2] = u5
                 [3] = u7
         --]]
         local t_Parent_3 = u6.Parent;
         if (t_Parent_3 == nil) then
             print("Char removed");
             u5.DisconnectedChar(u7, u6);
         end
     end);
 end;
 NewChar = f_NewChar;
 local u8 = v9;
 local f_GetCharRemoving;
 f_GetCharRemoving = function(p6) -- [line 60] GetCharRemoving
     --[[
         Upvalues: 
             [1] = u8
     --]]
     if (p6 == game.Players.LocalPlayer) then
         return game.Players.LocalPlayer.CharacterRemoving;
     end
     if (not u8[p6]) then
         while true do
             wait();
             if (u8[p6]) then
                 break;
             end
         end
     end
     return u8[p6].Event;
 end;
 v7.GetCharRemoving = f_GetCharRemoving;
 local u9 = v9;
 local f_CreateNewDisCon;
 f_CreateNewDisCon = function(p7) -- [line 70] CreateNewDisCon
     --[[
         Upvalues: 
             [1] = u9
     --]]
     local v20 = Instance.new("BindableEvent");
     v20.Name = p7.Name .. "_Connection";
     v20.Parent = script;
     u9[p7] = v20;
 end;
 local u10 = v9;
 local f_RemoveDisCon;
 f_RemoveDisCon = function(p8) -- [line 77] RemoveDisCon
     --[[
         Upvalues: 
             [1] = u10
     --]]
     if (u10[p8]) then
         u10[p8]:Destroy();
         u10[p8] = nil;
     end
 end;
 local u11 = v7;
 local f_GetPlayer;
 f_GetPlayer = function(p9) -- [line 84] GetPlayer
     --[[
         Upvalues: 
             [1] = u11
     --]]
     local v21 = {};
     local u12 = p9;
     v21.__index = function(p10, p11) -- [line 86] anonymous function
         --[[
             Upvalues: 
                 [1] = u11
                 [2] = u12
         --]]
         local v22 = tostring(p11);
         if (v22 == "Character") then
             return u11.GetCharacter(u12);
         end
         return u12[p11];
     end;
     return setmetatable({}, v21);
 end;
 v7.GetPlayer = f_GetPlayer;
 local u13 = v9;
 local f_DisconnectedChar;
 f_DisconnectedChar = function(p12, p13) -- [line 96] DisconnectedChar
     --[[
         Upvalues: 
             [1] = u13
     --]]
     local v23, v24, v25 = pairs(u13);
     local v26 = v23;
     local v27 = v24;
     local v28 = v25;
     while true do
         local v29, v30 = v26(v27, v28);
         local v31 = v29;
         local v32 = v30;
         if (v29) then
             return;
         end
         v28 = v31;
         if (v31 == p12) then
             v32:Fire(p13);
             return;
         end
     end
 end;
 v7.DisconnectedChar = f_DisconnectedChar;
 local u14 = v8;
 local f_GetPlayerFromCharacter;
 f_GetPlayerFromCharacter = function(p14) -- [line 105] GetPlayerFromCharacter
     --[[
         Upvalues: 
             [1] = u14
     --]]
     local v33, v34, v35 = pairs(u14);
     local v36 = v33;
     local v37 = v34;
     local v38 = v35;
     while true do
         local v39, v40 = v36(v37, v38);
         local v41 = v39;
         local v42 = v40;
         if (v39) then
             return game.Players:GetPlayerFromCharacter(p14);
         end
         v38 = v41;
         if (v42 == p14) then
             return v41;
         end
     end
 end;
 v7.GetPlayerFromCharacter = f_GetPlayerFromCharacter;
 local v43 = game.Players.PlayerAdded;
 local f_CreateNewDisCon = f_CreateNewDisCon;
 v43:Connect(function(p15) -- [line 114] anonymous function
     --[[
         Upvalues: 
             [1] = f_CreateNewDisCon
     --]]
     f_CreateNewDisCon(p15);
     local v44 = p15.CharacterAdded;
     local u15 = p15;
     v44:Connect(function(p16) -- [line 116] anonymous function
         --[[
             Upvalues: 
                 [1] = u15
         --]]
         NewChar(u15, p16);
     end);
 end);
 local v45 = game.Players.PlayerRemoving;
 local f_RemoveDisCon = f_RemoveDisCon;
 v45:Connect(function(p17) -- [line 121] anonymous function
     --[[
         Upvalues: 
             [1] = f_RemoveDisCon
     --]]
     f_RemoveDisCon(p17);
 end);
 local v46, v47, v48 = pairs(game.Players:GetPlayers());
 local v49 = v46;
 local v50 = v47;
 local v51 = v48;
 while true do
     local v52, v53 = v49(v50, v51);
     local v54 = v52;
     local v55 = v53;
     if (v52) then
         break;
     end
     v51 = v54;
     if (v55 ~= game.Players.LocalPlayer) then
         f_CreateNewDisCon(v55);
         if (v55.Character) then
             local t_Parent_4 = v55.Character.Parent;
             if (t_Parent_4 ~= nil) then
                 NewChar(v55, v55.Character);
             end
         end
         local v56 = v55.CharacterAdded;
         local u16 = v55;
         v56:Connect(function(p18) -- [line 131] anonymous function
             --[[
                 Upvalues: 
                     [1] = u16
             --]]
             NewChar(u16, p18);
         end);
     end
 end
 local u17 = v7;
 v11.__index = function(p19, p20) -- [line 137] anonymous function
     --[[
         Upvalues: 
             [1] = u17
     --]]
     xpcall(function() -- [line 138] anonymous function
         PluginManager():CreatePlugin():Deactivate();
     end, function() -- [line 140] anonymous function
         local v57 = {};
     end);
     local v58 = debug.info(2, "s");
     if (v58 == nil) then
         return nil;
     end
     if (v58 == "[C]") then
         return nil;
     end
     return u17[p20];
 end;
 v11.__metatable = "[C]";
 return setmetatable({}, v11);
 