-- Decompiled with the Synapse X Luau decompiler.
 --NOTE: Currently in beta! Not representative of final product.
 local v1 = {};
 local t_Assets_1 = game.ReplicatedStorage.Assets;
 local u1 = game:GetService("RunService");
 local u2 = game:GetService("TweenService");
 local u3 = require(game.ReplicatedStorage.Modules.Shared.ModuleLoader);
 local u4 = u3:LoadModule("Clean");
 local u5 = u3:LoadModule("WeaponInfo");
 local f_ApplyGlowEffect;
 f_ApplyGlowEffect = function(p1, p2) -- [line 16] ApplyGlowEffect
     --[[
         Upvalues: 
             [1] = u2
     --]]
     local v2 = TweenInfo.new(400, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, -1, false, 0);
     local v3, v4, v5 = pairs(p2:GetChildren());
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
         if (v12:IsA("Texture")) then
             v12.OffsetStudsU = 0;
             v12.OffsetStudsV = 0;
             local v13 = u2;
             local v14 = v12;
             local v15 = v2;
             local v16 = {};
             v16.OffsetStudsU = 200;
             local v17 = v13:Create(v14, v15, v16);
             local v18 = u2;
             local v19 = v12;
             local v20 = v2;
             local v21 = {};
             v21.OffsetStudsV = 200;
             local v22 = v18:Create(v19, v20, v21);
             v17:Play();
             v22:Play();
         end
     end
 end;
 v1.ApplyGlowEffect = f_ApplyGlowEffect;
 local f_MultiplyZeros;
 f_MultiplyZeros = function(p3, p4) -- [line 41] MultiplyZeros
     local v23 = "";
     local v24 = 1;
     local v25 = p4;
     local v26 = v25;
     local v27 = v24;
     if (not (v25 <= v27)) then
         while true do
             v23 = v23 .. "0";
             local v28 = v24 + 1;
             v24 = v28;
             local v29 = v26;
             if (v29 < v28) then
                 break;
             end
         end
     end
     return v23;
 end;
 v1.MultiplyZeros = f_MultiplyZeros;
 local f_CalculateStatTrak;
 f_CalculateStatTrak = function(p5, p6) -- [line 51] CalculateStatTrak
     local v30 = false;
     local v31;
     if (p6 >= 0) then
         v31 = #tostring(p6);
         if (not v31) then
             v30 = true;
         end
     else
         v30 = true;
     end
     if (v30) then
         v31 = 0;
     end
     local v32 = p5:MultiplyZeros(6 - v31) .. p6;
     local v33 = v32;
     if (tonumber(v32) >= 999999) then
         return 999999;
     end
     return v33;
 end;
 v1.CalculateStatTrak = f_CalculateStatTrak;
 local f_GetWeapon;
 f_GetWeapon = function(p7, p8, p9) -- [line 57] GetWeapon
     --[[
         Upvalues: 
             [1] = t_Assets_1
     --]]
     local v34 = false;
     local v35;
     if (p9) then
         v35 = t_Assets_1.Weapons[p8]:FindFirstChild(p9);
         if (not v35) then
             v34 = true;
         end
     else
         v34 = true;
     end
     if (v34) then
         v35 = t_Assets_1.Weapons[p8].Default;
     end
     return v35;
 end;
 v1.GetWeapon = f_GetWeapon;
 local f_GetCustomSkin;
 f_GetCustomSkin = function(p10, p11, p12) -- [line 61] GetCustomSkin
     --[[
         Upvalues: 
             [1] = t_Assets_1
     --]]
     local v36 = false;
     local v37;
     if ((p12 and t_Assets_1.Weapons[p11]:FindFirstChild(p12)) and t_Assets_1.Weapons[p11][p12].ViewModel:FindFirstChild("Animations")) then
         v37 = t_Assets_1.Weapons[p11][p12];
         if (not v37) then
             v36 = true;
         end
     else
         v36 = true;
     end
     if (v36) then
         v37 = t_Assets_1.Weapons[p11].Default;
     end
     return v37;
 end;
 v1.GetCustomSkin = f_GetCustomSkin;
 local f_GetEquippedWeaponSkin;
 f_GetEquippedWeaponSkin = function(p13, p14, p15, p16) -- [line 65] GetEquippedWeaponSkin
     --[[
         Upvalues: 
             [1] = u1
             [2] = u3
     --]]
     if (not u1:IsServer()) then
         return;
     end
     local v38 = u3:LoadModule("DataManagerServer").CurrentPlayerData[p14].Data.EquippedSkins[p15];
     local v39 = v38;
     local v40 = {};
     v40.Weapon = p15;
     local v41 = v38;
     if (v41) then
         v41 = v39.Skin;
     end
     v40.Skin = v41;
     local v42 = v39;
     if (v42) then
         v42 = v39.SkinId;
     end
     local v43 = false;
     v40.SkinId = v42;
     local v44;
     if (v39) then
         v44 = v39.Attributes;
         if (not v44) then
             v43 = true;
         end
     else
         v43 = true;
     end
     if (v43) then
         v44 = {};
     end
     v40.Attributes = v44;
     if (p16) then
         local v45, v46, v47 = pairs(p16);
         local v48 = v45;
         local v49 = v46;
         local v50 = v47;
         while true do
             local v51, v52 = v48(v49, v50);
             local v53 = v51;
             local v54 = v52;
             if (v51) then
                 break;
             end
             v50 = v53;
             v40[v53] = v54;
         end
     end
     return v40;
 end;
 v1.GetEquippedWeaponSkin = f_GetEquippedWeaponSkin;
 local f_ApplyAttributes;
 f_ApplyAttributes = function(p17, p18, p19, p20, p21) -- [line 97] ApplyAttributes
     --[[
         Upvalues: 
             [1] = u5
             [2] = t_Assets_1
             [3] = u4
     --]]
     if (not p21) then
         return;
     end
     local v55 = u5[p19];
     local v56 = {};
     v56.Sentinel = "UpperReceiver";
     v56.Eclipse = "Body1";
     local v57, v58, v59 = pairs(p21);
     local v60 = v57;
     local v61 = v58;
     local v62 = v59;
     while true do
         local v63, v64 = v60(v61, v62);
         local v65 = v63;
         local v66 = v64;
         if (v63) then
             break;
         end
         v62 = v65;
         if (v65 == "Stat Trak") then
             local v67 = false;
             local v68;
             if (t_Assets_1.Weapons[p19]:FindFirstChild(p20)) then
                 v68 = t_Assets_1.Weapons[p19][p20].ViewModel:FindFirstChild("AttributeOffsets");
                 if (not v68) then
                     v67 = true;
                 end
             else
                 v67 = true;
             end
             if (v67) then
                 v68 = t_Assets_1.Weapons[p19].Default.ViewModel.AttributeOffsets;
             end
             local v69 = false;
             local t_Class_2 = v55.Class;
             local v70;
             if (t_Class_2 == "Pistol") then
                 v70 = p18.Slide;
                 if (not v70) then
                     v69 = true;
                 end
             else
                 v69 = true;
             end
             if (v69) then
                 local v71 = false;
                 if (v56[p19]) then
                     v70 = p18[v56[p19]];
                     if (not v70) then
                         v71 = true;
                     end
                 else
                     v71 = true;
                 end
                 if (v71) then
                     v70 = p18.Body;
                 end
             end
             local v72 = t_Assets_1.Attributes.StatTrak:Clone();
             u4:Weld(v72, v72.PrimaryPart);
             v72.PrimaryPart.CFrame = v70.CFrame * ((v68["Stat Trak"].Value - v68["Stat Trak"].Value.p) + (v68["Stat Trak"].Value.p * (v70.Size.X / p17:GetWeapon(p19, p20).ViewModel.Object[v70.Name].Size.X)));
             v72.Number.SurfaceGui.Frame.TextLabel.Text = p17:CalculateStatTrak(v66.Kills);
             u4:Anchor(v72, false);
             u4:SetCanCollide(v72, false);
             u4:WeldBetween(v72.PrimaryPart, v70);
             v72.Parent = p18;
         end
     end
 end;
 v1.ApplyAttributes = f_ApplyAttributes;
 return v1;
 