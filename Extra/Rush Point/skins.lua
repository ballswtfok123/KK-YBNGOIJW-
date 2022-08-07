-- Decompiled with the Synapse X Luau decompiler.
 --NOTE: Currently in beta! Not representative of final product.
 local v1 = {};
 v1.TotalSkins = 0;
 v1.Skins = {};
 v1.AllSkins = {};
 v1.SkinsToCase = {};
 local v2 = {};
 local v3 = {};
 v3.Chance = 5;
 v2.StatTrak = v3;
 local v4 = {};
 v4.Chance = 5;
 local v5 = {};
 v5["Red Effect"] = Color3.fromRGB(255, 0, 0);
 v5["Blue Effect"] = Color3.fromRGB(0, 0, 255);
 v5["Black Effect"] = Color3.fromRGB(73, 73, 73);
 v5["Purple Effect"] = Color3.fromRGB(255, 0, 255);
 v5["Green Effect"] = Color3.fromRGB(0, 255, 0);
 v4.Types = v5;
 v2.BulletEffects = v4;
 v1.Attributes = v2;
 local v6 = {};
 local v7 = {};
 v7.Rarity = "Common";
 v7.Color = Color3.fromRGB(175, 183, 195);
 local v8 = {};
 v8.Rarity = "Uncommon";
 v8.Color = Color3.fromRGB(85, 185, 72);
 local v9 = {};
 v9.Rarity = "Rare";
 v9.Color = Color3.fromRGB(80, 105, 177);
 local v10 = {};
 v10.Rarity = "Epic";
 v10.Color = Color3.fromRGB(111, 65, 153);
 local v11 = {};
 v11.Rarity = "Legendary";
 v11.Color = Color3.fromRGB(201, 171, 45);
 local v12 = {};
 v12.Rarity = "Mythic";
 v12.Color = Color3.fromRGB(234, 74, 76);
 local v13 = {};
 v13.Rarity = "Ethereal";
 v13.Color = Color3.fromRGB(75, 227, 227);
 v6[1] = v7;
 v6[2] = v8;
 v6[3] = v9;
 v6[4] = v10;
 v6[5] = v11;
 v6[6] = v12;
 v6[7] = v13;
 v1.Rarities = v6;
 if (not v1.Initialized) then
     local v14 = false;
     v1.Initialized = true;
     local v15 = require(game.ReplicatedStorage.Modules.Shared.ModuleLoader);
     local v16 = v15;
     local v17 = v15:LoadModule("Clean");
     local t_PlaceId_1 = game.PlaceId;
     local v18;
     if (t_PlaceId_1 == 5993942214) then
         v14 = true;
     else
         v18 = false;
         local t_PlaceId_2 = game.PlaceId;
         if (t_PlaceId_2 == 6967119260) then
             v14 = true;
         end
     end
     if (v14) then
         v18 = v16:LoadModule("CaseData");
     end
     local v19, v20, v21 = pairs(script:GetChildren());
     local v22 = v19;
     local v23 = v20;
     local v24 = v21;
     while true do
         local v25, v26 = v22(v23, v24);
         local v27 = v25;
         local v28 = v26;
         if (v25) then
             break;
         end
         v24 = v27;
         local t_ClassName_3 = v28.ClassName;
         if (t_ClassName_3 == "ModuleScript") then
             local v29 = require(v28);
             local v30 = v29;
             v1.Skins[v28.Name] = v29;
             local v31 = v17:DeepCopyTable(v29);
             local v32 = v31;
             v31.Default = nil;
             local v33, v34, v35 = pairs(v31);
             local v36 = v33;
             local v37 = v34;
             local v38 = v35;
             while true do
                 local v39, v40 = v36(v37, v38);
                 local v41 = v39;
                 local v42 = v40;
                 if (v39) then
                     break;
                 end
                 v38 = v41;
                 local v43 = {};
                 v43.Rarity = v42.Rarity;
                 v32[v41] = v43;
             end
             v1.AllSkins[v28.Name] = v32;
             v1.TotalSkins = v1.TotalSkins + (v17:GetDictionaryLength(v30) - 1);
         end
     end
     if (v18) then
         local v44, v45, v46 = pairs(v18);
         local v47 = v44;
         local v48 = v45;
         local v49 = v46;
         while true do
             local v50, v51 = v47(v48, v49);
             local v52 = v50;
             local v53 = v51;
             if (v50) then
                 break;
             end
             v49 = v52;
             local v54 = 1;
             local v55 = #v53.Skins;
             local v56 = v55;
             local v57 = v54;
             if (not (v55 <= v57)) then
                 while true do
                     local v58 = v53.Skins[v54];
                     v1.SkinsToCase[v58.Weapon .. ("_" .. v58.Skin)] = v52;
                     local v59 = v54 + 1;
                     v54 = v59;
                     local v60 = v56;
                     if (v60 < v59) then
                         break;
                     end
                 end
             end
         end
     end
     v1.RaritiesDictionary = {};
     local v61 = 1;
     local v62 = #v1.Rarities;
     local v63 = v62;
     local v64 = v61;
     if (not (v62 <= v64)) then
         while true do
             local v65 = v1.Rarities[v61];
             v65.Tier = v61;
             v1.RaritiesDictionary[v65.Rarity] = v65;
             local v66 = v61 + 1;
             v61 = v66;
             local v67 = v63;
             if (v67 < v66) then
                 break;
             end
         end
     end
 end
 return v1;
 