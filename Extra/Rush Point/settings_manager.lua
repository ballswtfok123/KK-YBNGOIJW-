-- Decompiled with the Synapse X Luau decompiler.
 --NOTE: Currently in beta! Not representative of final product.
 local v1 = {};
 v1.EditingKeybind = false;
 v1.SettingsLoaded = false;
 v1.SettingsUI = {};
 v1.DefaultSettings = {};
 v1.Settings = {};
 v1.Keybinds = {};
 v1.VisibleBinds = {};
 v1.SettingBinds = {};
 local v2 = game.Players.LocalPlayer;
 local v3 = v2:GetMouse();
 local v4 = v2:GetMouse();
 local u1 = nil;
 local u2 = nil;
 local v5 = game:GetService("RunService");
 local v6 = game:GetService("UserInputService");
 local v7 = game:GetService("TweenService");
 local v8 = require(game.ReplicatedStorage.Modules.Shared.ModuleLoader);
 local v9 = v8:LoadModule("Network");
 local v10 = v8:LoadModule("Clean");
 local u3 = v8:LoadModule("SettingsInfo");
 local v11 = v8:LoadModule("UIAnimations");
 local v12 = v8:LoadModule("SharedMemory");
 local v13 = v8:LoadModule("WeaponInfo");
 local u4 = nil;
 local u5 = nil;
 local u6 = nil;
 local u7 = nil;
 local f_SetVisible;
 f_SetVisible = function(p1, p2) -- [line 41] SetVisible
     --[[
         Upvalues: 
             [1] = u1
             [2] = u4
     --]]
     p1.UIVisible = p2;
     u1.Enabled = p2;
     local v14 = 1;
     local v15 = #p1.VisibleBinds;
     local v16 = v15;
     local v17 = v14;
     if (not (v15 <= v17)) then
         while true do
             p1.VisibleBinds[v14](p2);
             local v18 = v14 + 1;
             v14 = v18;
             local v19 = v16;
             if (v19 < v18) then
                 break;
             end
         end
     end
     u4:MoveSoundtrack(p2 and "Muffle");
 end;
 v1.SetVisible = f_SetVisible;
 local f_UpdateSettingBinds;
 f_UpdateSettingBinds = function(p3, p4) -- [line 54] UpdateSettingBinds
     if (p3.SettingBinds[p4]) then
         local v20 = 1;
         local v21 = #p3.SettingBinds[p4];
         local v22 = v21;
         local v23 = v20;
         if (not (v21 <= v23)) then
             while true do
                 local v24 = p3.SettingBinds[p4][v20];
                 local v25 = p3.Settings[p4];
                 if (not v25) then
                     v25 = p3.Keybinds[p4];
                 end
                 v24(v25);
                 local v26 = v20 + 1;
                 v20 = v26;
                 local v27 = v22;
                 if (v27 < v26) then
                     break;
                 end
             end
         end
     end
 end;
 v1.UpdateSettingBinds = f_UpdateSettingBinds;
 local f_BindVisibleButton;
 f_BindVisibleButton = function(p5, p6) -- [line 64] BindVisibleButton
     table.insert(p5.VisibleBinds, p6);
 end;
 v1.BindVisibleButton = f_BindVisibleButton;
 local f_BindSettingChanged;
 f_BindSettingChanged = function(p7, p8, p9) -- [line 68] BindSettingChanged
     if (not p7.SettingBinds[p8]) then
         p7.SettingBinds[p8] = {};
     end
     table.insert(p7.SettingBinds[p8], p9);
 end;
 v1.BindSettingChanged = f_BindSettingChanged;
 local f_SelectTab;
 f_SelectTab = function(p10, p11) -- [line 76] SelectTab
     --[[
         Upvalues: 
             [1] = u2
     --]]
     local v28 = p11;
     if (not v28) then
         v28 = p10.SelectedTab;
         if (not v28) then
             v28 = "General";
         end
     end
     local v29 = v28;
     p11 = v29;
     p10.SelectedTab = v29;
     local v30, v31, v32 = pairs(u2:GetChildren());
     local v33 = v30;
     local v34 = v31;
     local v35 = v32;
     while true do
         local v36, v37 = v33(v34, v35);
         local v38 = v36;
         local v39 = v37;
         if (v36) then
             break;
         end
         v35 = v38;
         local t_ClassName_1 = v39.ClassName;
         if (t_ClassName_1 == "Frame") then
             local t_Name_2 = v39.Name;
             if (t_Name_2 ~= "TabsFrame") then
                 v39.Visible = false;
             end
         end
     end
     u2[p11 .. "Frame"].Visible = true;
 end;
 v1.SelectTab = f_SelectTab;
 local u8 = v12;
 local u9 = v13;
 local u10 = v9;
 local f_UpdateSetting;
 f_UpdateSetting = function(p12, p13, p14) -- [line 89] UpdateSetting
     --[[
         Upvalues: 
             [1] = u8
             [2] = u6
             [3] = u9
             [4] = u5
             [5] = u10
     --]]
     p12:UpdateSettingBinds(p13);
     if ((u8.CurrentWeaponData and u8.CurrentWeaponData.Weapon) and u6) then
         local v40 = false;
         local v41 = u9[u8.CurrentWeaponData.Weapon];
         if (p13 == "Scope Aim Type") then
             local t_Class_3 = v41.Class;
             if ((t_Class_3 == "Sniper") and (p14 == "Toggle")) then
                 u6.ToggleAim = false;
             else
                 v40 = true;
             end
         else
             v40 = true;
         end
         if (v40) then
             if (p13 == "Aim Type") then
                 local t_Class_4 = v41.Class;
                 if ((not (t_Class_4 == "Sniper")) and (p14 == "Toggle")) then
                     u6.ToggleAim = false;
                 end
             end
         end
     end
     local v42 = p13:sub((#p13) - 5, #p13);
     if (v42 == "Volume") then
         u5:UpdateVolume();
     end
     u10:FireServer("UpdateSetting", p13, p14);
 end;
 v1.UpdateSetting = f_UpdateSetting;
 local f_UpdateSlider;
 f_UpdateSlider = function(p15, p16, p17, p18, p19) -- [line 109] UpdateSlider
     local g_pcall_5 = pcall;
     local u11 = p19;
     local u12 = p16;
     local u13 = p17;
     local v44, v45 = g_pcall_5(function() -- [line 110] anonymous function
         --[[
             Upvalues: 
                 [1] = u11
                 [2] = u12
                 [3] = p18
                 [4] = u13
         --]]
         if (not u11) then
             u12.Amount.Text = math.floor(p18) + tonumber(tostring(p18 - math.floor(p18)):sub(1, u13.Precision + 2));
         end
         p18 = p18 - u13.Min;
         local v43 = u13.Max - u13.Min;
         u12.Frame.Fill.Size = UDim2.new(p18 / v43, 0, 1, 0);
         u12.Frame.Slider.Position = UDim2.new(p18 / v43, 0, 0.5, 0);
     end);
     local v46 = v45;
     if (not v44) then
         print(p17, p18);
         print(v46);
     end
 end;
 v1.UpdateSlider = f_UpdateSlider;
 local f_UpdateDependencies;
 f_UpdateDependencies = function(p20) -- [line 128] UpdateDependencies
     --[[
         Upvalues: 
             [1] = u3
     --]]
     local v47, v48, v49 = pairs(u3.Options);
     local v50 = v47;
     local v51 = v48;
     local v52 = v49;
     while true do
         local v53, v54 = v50(v51, v52);
         local v55 = v53;
         local v56 = v54;
         if (v53) then
             break;
         end
         v52 = v55;
         if (v55 ~= "Keybinds") then
             local v57, v58, v59 = pairs(v56);
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
                 local v67 = 1;
                 local v68 = #v66;
                 local v69 = v68;
                 local v70 = v67;
                 if (not (v68 <= v70)) then
                     while true do
                         local v71 = v66[v67];
                         local v72 = v71;
                         if (v71.ReliesOn) then
                             local t_Warn_6 = p20.SettingsUI[v72.Name].Warn;
                             local t_Name_7 = p20.DefaultSettings[v72.ReliesOn.Name].Type.Name;
                             local v73;
                             if ((t_Name_7 == "Switch") and (not p20.Settings[v72.ReliesOn.Name])) then
                                 v73 = true;
                             else
                                 v73 = false;
                             end
                             t_Warn_6.Visible = v73;
                             p20.SettingsUI[v72.Name].Warn.Text = "Depends On " .. v72.ReliesOn.Name;
                         else
                             p20.SettingsUI[v72.Name].Warn.Visible = false;
                         end
                         local v74 = v67 + 1;
                         v67 = v74;
                         local v75 = v69;
                         if (v75 < v74) then
                             break;
                         end
                     end
                 end
             end
         end
     end
 end;
 v1.UpdateDependencies = f_UpdateDependencies;
 local u14 = u3;
 local u15 = v11;
 local u16 = v5;
 local u17 = v4;
 local u18 = v6;
 local u19 = v10;
 local u20 = v7;
 local u21 = v12;
 local u22 = v13;
 local f_LoadSettings;
 f_LoadSettings = function(p21, p22, p23) -- [line 147] LoadSettings
     --[[
         Upvalues: 
             [1] = u14
             [2] = u2
             [3] = u15
             [4] = u16
             [5] = u17
             [6] = u18
             [7] = u19
             [8] = u20
             [9] = u21
             [10] = u6
             [11] = u22
             [12] = u5
     --]]
     warn("LOADED SETTINGS");
     local t_CurrentParent_8 = p21.CurrentParent;
     p21.Keybinds = p23;
     p21.Settings = p22;
     local v76 = {};
     local v77, v78, v79 = pairs(u14.Options);
     local v80 = v77;
     local v81 = v78;
     local v82 = v79;
     while true do
         local v83, v84 = v80(v81, v82);
         local v85 = v83;
         local v86 = v84;
         if (v83) then
             break;
         end
         v82 = v85;
         local v87, v88, v89 = pairs(v86);
         local v90 = v87;
         local v91 = v88;
         local v92 = v89;
         while true do
             local v93, v94 = v90(v91, v92);
             local v95 = v93;
             local v96 = v94;
             if (v93) then
                 break;
             end
             v92 = v95;
             local v97 = 1;
             local v98 = #v96;
             local v99 = v98;
             local v100 = v97;
             if (not (v98 <= v100)) then
                 while true do
                     local v101 = false;
                     local v102 = v96[v97];
                     local v103 = v102;
                     local v104 = u2[v85 .. "Frame"][v95];
                     local v105 = t_CurrentParent_8.OptionTemplates[v102.Type.Name .. "Template"]:Clone();
                     local v106 = v105;
                     local t_Setting_9 = v105.Setting;
                     local t_Name_10 = v102.Name;
                     local v107;
                     if (v102.Tip) then
                         v107 = " (" .. (v103.Tip .. ")");
                         if (not v107) then
                             v101 = true;
                         end
                     else
                         v101 = true;
                     end
                     if (v101) then
                         v107 = "";
                     end
                     t_Setting_9.Text = t_Name_10 .. v107;
                     v106.Parent = v104;
                     p21.SettingsUI[v103.Name] = v106;
                     local t_Name_11 = v103.Type.Name;
                     if (t_Name_11 ~= "Keybind") then
                         table.insert(v76, v103.Name);
                     end
                     local v108 = false;
                     local t_Name_12 = v103.Type.Name;
                     if (t_Name_12 == "Drop Down") then
                         local v109 = false;
                         v106.Button.Text = p22[v103.Name];
                         v106.ZIndex = v106.ZIndex + ((#v96) - v97);
                         local t_Setting_13 = v106.Setting;
                         local v110;
                         if (v103.ReliesOn) then
                             v110 = UDim2.new(0.25, 0, 0, 20);
                             if (not v110) then
                                 v109 = true;
                             end
                         else
                             v109 = true;
                         end
                         if (v109) then
                             v110 = UDim2.new(0.5, 0, 0, 20);
                         end
                         t_Setting_13.Size = v110;
                         u15:AddClickAnimation(v106.Button);
                         local v111 = u15;
                         local v112 = {};
                         local v113 = {};
                         v113.Button = v106.Button;
                         v113.Intensity = 18;
                         v112.Gradient = v113;
                         v111:AddHoverAnimation(v112);
                         local v114, v115, v116 = pairs(v103.Type.Options);
                         local v117 = v114;
                         local v118 = v115;
                         local v119 = v116;
                         while true do
                             local v120, v121 = v117(v118, v119);
                             local v122 = v120;
                             if (v120) then
                                 break;
                             end
                             v119 = v122;
                             local v123 = t_CurrentParent_8.OptionTemplates.DropDownButton:Clone();
                             v123.Text = v122;
                             v123.Parent = v106.Frame;
                             u15:AddClickAnimation(v123);
                             local v124 = u15;
                             local v125 = {};
                             local v126 = {};
                             v126.Button = v123;
                             v126.Intensity = 18;
                             v125.Gradient = v126;
                             v124:AddHoverAnimation(v125);
                             local v127 = v123.MouseButton1Down;
                             local u23 = v106;
                             local u24 = v122;
                             local u25 = p22;
                             local u26 = v103;
                             local u27 = p21;
                             v127:Connect(function() -- [line 198] anonymous function
                                 --[[
                                     Upvalues: 
                                         [1] = u23
                                         [2] = u24
                                         [3] = u25
                                         [4] = u26
                                         [5] = u27
                                 --]]
                                 u23.Button.Text = u24;
                                 u23.Frame.Visible = false;
                                 u25[u26.Name] = u24;
                                 u27:UpdateSetting(u26.Name, u24);
                             end);
                         end
                         local v128 = v106.Button.MouseButton1Down;
                         local u28 = v106;
                         v128:Connect(function() -- [line 208] anonymous function
                             --[[
                                 Upvalues: 
                                     [1] = u28
                             --]]
                             u28.Frame.Visible = not u28.Frame.Visible;
                         end);
                         v108 = true;
                     else
                         local t_Name_14 = v103.Type.Name;
                         if (t_Name_14 == "Slider") then
                             p21:UpdateSlider(v106.Background, v103.Type, p22[v103.Name]);
                             local u29 = false;
                             local u30 = p21;
                             local u31 = v103;
                             local u32 = p22;
                             local u33 = v106;
                             local f_SliderClick;
                             f_SliderClick = function() -- [line 215] SliderClick
                                 --[[
                                     Upvalues: 
                                         [1] = u29
                                         [2] = u16
                                         [3] = u30
                                         [4] = u31
                                         [5] = u32
                                         [6] = u33
                                         [7] = u17
                                 --]]
                                 u29 = true;
                                 local u34 = nil;
                                 u34 = u16.RenderStepped:Connect(function() -- [line 219] anonymous function
                                     --[[
                                         Upvalues: 
                                             [1] = u29
                                             [2] = u34
                                             [3] = u30
                                             [4] = u31
                                             [5] = u32
                                             [6] = u33
                                             [7] = u17
                                     --]]
                                     if (not u29) then
                                         u34:Disconnect();
                                         u30:UpdateSetting(u31.Name, u32[u31.Name]);
                                         return;
                                     end
                                     local v129 = u33.Background.Frame.Click.AbsolutePosition.X + u33.Background.Frame.Click.AbsoluteSize.X;
                                     local v130 = u33.Background.Frame.Click.AbsolutePosition.X;
                                     u32[u31.Name] = ((math.clamp(u17.X - v130, 0, v129 - v130) / (v129 - v130)) * (u31.Type.Max - u31.Type.Min)) + u31.Type.Min;
                                     u30:UpdateSlider(u33.Background, u31.Type, u32[u31.Name]);
                                 end);
                             end;
                             local v131 = v106.Background.Frame.Click.MouseButton1Down;
                             local u35 = p21;
                             local u36 = v103;
                             local u37 = p22;
                             local u38 = v106;
                             v131:Connect(function() -- [line 235] anonymous function
                                 --[[
                                     Upvalues: 
                                         [1] = u29
                                         [2] = u16
                                         [3] = u35
                                         [4] = u36
                                         [5] = u37
                                         [6] = u38
                                         [7] = u17
                                 --]]
                                 u29 = true;
                                 local u39 = nil;
                                 u39 = u16.RenderStepped:Connect(function() -- [line 219] anonymous function
                                     --[[
                                         Upvalues: 
                                             [1] = u29
                                             [2] = u39
                                             [3] = u35
                                             [4] = u36
                                             [5] = u37
                                             [6] = u38
                                             [7] = u17
                                     --]]
                                     if (not u29) then
                                         u39:Disconnect();
                                         u35:UpdateSetting(u36.Name, u37[u36.Name]);
                                         return;
                                     end
                                     local v132 = u38.Background.Frame.Click.AbsolutePosition.X + u38.Background.Frame.Click.AbsoluteSize.X;
                                     local v133 = u38.Background.Frame.Click.AbsolutePosition.X;
                                     u37[u36.Name] = ((math.clamp(u17.X - v133, 0, v132 - v133) / (v132 - v133)) * (u36.Type.Max - u36.Type.Min)) + u36.Type.Min;
                                     u35:UpdateSlider(u38.Background, u36.Type, u37[u36.Name]);
                                 end);
                             end);
                             local v134 = v106.Background.Frame.Slider.MouseButton1Down;
                             local u40 = p21;
                             local u41 = v103;
                             local u42 = p22;
                             local u43 = v106;
                             v134:Connect(function() -- [line 239] anonymous function
                                 --[[
                                     Upvalues: 
                                         [1] = u29
                                         [2] = u16
                                         [3] = u40
                                         [4] = u41
                                         [5] = u42
                                         [6] = u43
                                         [7] = u17
                                 --]]
                                 u29 = true;
                                 local u44 = nil;
                                 u44 = u16.RenderStepped:Connect(function() -- [line 219] anonymous function
                                     --[[
                                         Upvalues: 
                                             [1] = u29
                                             [2] = u44
                                             [3] = u40
                                             [4] = u41
                                             [5] = u42
                                             [6] = u43
                                             [7] = u17
                                     --]]
                                     if (not u29) then
                                         u44:Disconnect();
                                         u40:UpdateSetting(u41.Name, u42[u41.Name]);
                                         return;
                                     end
                                     local v135 = u43.Background.Frame.Click.AbsolutePosition.X + u43.Background.Frame.Click.AbsoluteSize.X;
                                     local v136 = u43.Background.Frame.Click.AbsolutePosition.X;
                                     u42[u41.Name] = ((math.clamp(u17.X - v136, 0, v135 - v136) / (v135 - v136)) * (u41.Type.Max - u41.Type.Min)) + u41.Type.Min;
                                     u40:UpdateSlider(u43.Background, u41.Type, u42[u41.Name]);
                                 end);
                             end);
                             u18.InputEnded:Connect(function(p24) -- [line 243] anonymous function
                                 --[[
                                     Upvalues: 
                                         [1] = u29
                                 --]]
                                 local t_UserInputType_15 = p24.UserInputType;
                                 if (t_UserInputType_15 == Enum.UserInputType.MouseButton1) then
                                     u29 = false;
                                 end
                             end);
                             local v137 = v106.Background.Amount:GetPropertyChangedSignal("Text");
                             local u45 = p22;
                             local u46 = v103;
                             local u47 = v106;
                             local u48 = p21;
                             v137:Connect(function() -- [line 249] anonymous function
                                 --[[
                                     Upvalues: 
                                         [1] = u45
                                         [2] = u46
                                         [3] = u19
                                         [4] = u47
                                         [5] = u48
                                 --]]
                                 local v138 = false;
                                 local v139 = u45;
                                 local t_Name_16 = u46.Name;
                                 local v140;
                                 if (u19:ToNumber(u47.Background.Amount.Text)) then
                                     v140 = math.clamp(u19:ToNumber(u47.Background.Amount.Text), u46.Type.Min, u46.Type.Max);
                                     if (not v140) then
                                         v138 = true;
                                     end
                                 else
                                     v138 = true;
                                 end
                                 if (v138) then
                                     v140 = u46.Type.Min;
                                 end
                                 v139[t_Name_16] = v140;
                                 u48:UpdateSlider(u47.Background, u46.Type, u45[u46.Name], true);
                             end);
                             local v141 = v106.Background.Amount.FocusLost;
                             local u49 = p22;
                             local u50 = v103;
                             local u51 = v106;
                             local u52 = p21;
                             v141:Connect(function() -- [line 255] anonymous function
                                 --[[
                                     Upvalues: 
                                         [1] = u49
                                         [2] = u50
                                         [3] = u19
                                         [4] = u51
                                         [5] = u52
                                 --]]
                                 local v142 = false;
                                 local v143 = u49;
                                 local t_Name_17 = u50.Name;
                                 local v144;
                                 if (u19:ToNumber(u51.Background.Amount.Text)) then
                                     v144 = math.clamp(u19:ToNumber(u51.Background.Amount.Text), u50.Type.Min, u50.Type.Max);
                                     if (not v144) then
                                         v142 = true;
                                     end
                                 else
                                     v142 = true;
                                 end
                                 if (v142) then
                                     v144 = u50.Type.Min;
                                 end
                                 v143[t_Name_17] = v144;
                                 u52:UpdateSetting(u50.Name, u49[u50.Name]);
                                 u52:UpdateSlider(u51.Background, u50.Type, u49[u50.Name]);
                             end);
                             v108 = true;
                         else
                             local t_Name_18 = v103.Type.Name;
                             if (t_Name_18 == "Color") then
                                 p21:UpdateSlider(v106.Background.R, v103.Type, p22[v103.Name].R);
                                 p21:UpdateSlider(v106.Background.G, v103.Type, p22[v103.Name].G);
                                 p21:UpdateSlider(v106.Background.B, v103.Type, p22[v103.Name].B);
                                 local v145, v146, v147 = pairs(v106.Background:GetChildren());
                                 local v148 = v145;
                                 local v149 = v146;
                                 local v150 = v147;
                                 while true do
                                     local v151, v152 = v148(v149, v150);
                                     local v153 = v151;
                                     local v154 = v152;
                                     if (v151) then
                                         break;
                                     end
                                     v150 = v153;
                                     local t_ClassName_19 = v154.ClassName;
                                     if (t_ClassName_19 == "Frame") then
                                         local u53 = false;
                                         local u54 = p21;
                                         local u55 = v103;
                                         local u56 = p22;
                                         local u57 = v154;
                                         local f_SliderClick;
                                         f_SliderClick = function() -- [line 270] SliderClick
                                             --[[
                                                 Upvalues: 
                                                     [1] = u53
                                                     [2] = u16
                                                     [3] = u54
                                                     [4] = u55
                                                     [5] = u56
                                                     [6] = u57
                                                     [7] = u17
                                             --]]
                                             u53 = true;
                                             local u58 = nil;
                                             u58 = u16.RenderStepped:Connect(function() -- [line 274] anonymous function
                                                 --[[
                                                     Upvalues: 
                                                         [1] = u53
                                                         [2] = u58
                                                         [3] = u54
                                                         [4] = u55
                                                         [5] = u56
                                                         [6] = u57
                                                         [7] = u17
                                                 --]]
                                                 if (not u53) then
                                                     u58:Disconnect();
                                                     u54:UpdateSetting(u55.Name, u56[u55.Name]);
                                                     return;
                                                 end
                                                 local v155 = u57.Frame.Click.AbsolutePosition.X + u57.Frame.Click.AbsoluteSize.X;
                                                 local v156 = u57.Frame.Click.AbsolutePosition.X;
                                                 u56[u55.Name][u57.Name] = ((math.clamp(u17.X - v156, 0, v155 - v156) / (v155 - v156)) * (u55.Type.Max - u55.Type.Min)) + u55.Type.Min;
                                                 u54:UpdateSlider(u57, u55.Type, u56[u55.Name][u57.Name]);
                                             end);
                                         end;
                                         local v157 = v154.Frame.Click.MouseButton1Down;
                                         local u59 = p21;
                                         local u60 = v103;
                                         local u61 = p22;
                                         local u62 = v154;
                                         v157:Connect(function() -- [line 290] anonymous function
                                             --[[
                                                 Upvalues: 
                                                     [1] = u53
                                                     [2] = u16
                                                     [3] = u59
                                                     [4] = u60
                                                     [5] = u61
                                                     [6] = u62
                                                     [7] = u17
                                             --]]
                                             u53 = true;
                                             local u63 = nil;
                                             u63 = u16.RenderStepped:Connect(function() -- [line 274] anonymous function
                                                 --[[
                                                     Upvalues: 
                                                         [1] = u53
                                                         [2] = u63
                                                         [3] = u59
                                                         [4] = u60
                                                         [5] = u61
                                                         [6] = u62
                                                         [7] = u17
                                                 --]]
                                                 if (not u53) then
                                                     u63:Disconnect();
                                                     u59:UpdateSetting(u60.Name, u61[u60.Name]);
                                                     return;
                                                 end
                                                 local v158 = u62.Frame.Click.AbsolutePosition.X + u62.Frame.Click.AbsoluteSize.X;
                                                 local v159 = u62.Frame.Click.AbsolutePosition.X;
                                                 u61[u60.Name][u62.Name] = ((math.clamp(u17.X - v159, 0, v158 - v159) / (v158 - v159)) * (u60.Type.Max - u60.Type.Min)) + u60.Type.Min;
                                                 u59:UpdateSlider(u62, u60.Type, u61[u60.Name][u62.Name]);
                                             end);
                                         end);
                                         local v160 = v154.Frame.Slider.MouseButton1Down;
                                         local u64 = p21;
                                         local u65 = v103;
                                         local u66 = p22;
                                         local u67 = v154;
                                         v160:Connect(function() -- [line 294] anonymous function
                                             --[[
                                                 Upvalues: 
                                                     [1] = u53
                                                     [2] = u16
                                                     [3] = u64
                                                     [4] = u65
                                                     [5] = u66
                                                     [6] = u67
                                                     [7] = u17
                                             --]]
                                             u53 = true;
                                             local u68 = nil;
                                             u68 = u16.RenderStepped:Connect(function() -- [line 274] anonymous function
                                                 --[[
                                                     Upvalues: 
                                                         [1] = u53
                                                         [2] = u68
                                                         [3] = u64
                                                         [4] = u65
                                                         [5] = u66
                                                         [6] = u67
                                                         [7] = u17
                                                 --]]
                                                 if (not u53) then
                                                     u68:Disconnect();
                                                     u64:UpdateSetting(u65.Name, u66[u65.Name]);
                                                     return;
                                                 end
                                                 local v161 = u67.Frame.Click.AbsolutePosition.X + u67.Frame.Click.AbsoluteSize.X;
                                                 local v162 = u67.Frame.Click.AbsolutePosition.X;
                                                 u66[u65.Name][u67.Name] = ((math.clamp(u17.X - v162, 0, v161 - v162) / (v161 - v162)) * (u65.Type.Max - u65.Type.Min)) + u65.Type.Min;
                                                 u64:UpdateSlider(u67, u65.Type, u66[u65.Name][u67.Name]);
                                             end);
                                         end);
                                         u18.InputEnded:Connect(function(p25) -- [line 298] anonymous function
                                             --[[
                                                 Upvalues: 
                                                     [1] = u53
                                             --]]
                                             local t_UserInputType_20 = p25.UserInputType;
                                             if (t_UserInputType_20 == Enum.UserInputType.MouseButton1) then
                                                 u53 = false;
                                             end
                                         end);
                                         local v163 = v154.Amount:GetPropertyChangedSignal("Text");
                                         local u69 = p22;
                                         local u70 = v103;
                                         local u71 = v154;
                                         local u72 = p21;
                                         v163:Connect(function() -- [line 304] anonymous function
                                             --[[
                                                 Upvalues: 
                                                     [1] = u69
                                                     [2] = u70
                                                     [3] = u71
                                                     [4] = u19
                                                     [5] = u72
                                             --]]
                                             local v164 = false;
                                             local v165 = u69[u70.Name];
                                             local t_Name_21 = u71.Name;
                                             local v166;
                                             if (u19:ToNumber(u71.Amount.Text)) then
                                                 v166 = math.clamp(u19:ToNumber(u71.Amount.Text), u70.Type.Min, u70.Type.Max);
                                                 if (not v166) then
                                                     v164 = true;
                                                 end
                                             else
                                                 v164 = true;
                                             end
                                             if (v164) then
                                                 v166 = u70.Type.Min;
                                             end
                                             v165[t_Name_21] = v166;
                                             u72:UpdateSlider(u71, u70.Type, u69[u70.Name][u71.Name], true);
                                         end);
                                         local v167 = v154.Amount.FocusLost;
                                         local u73 = p22;
                                         local u74 = v103;
                                         local u75 = v154;
                                         local u76 = p21;
                                         v167:Connect(function() -- [line 309] anonymous function
                                             --[[
                                                 Upvalues: 
                                                     [1] = u73
                                                     [2] = u74
                                                     [3] = u75
                                                     [4] = u19
                                                     [5] = u76
                                             --]]
                                             local v168 = false;
                                             local v169 = u73[u74.Name];
                                             local t_Name_22 = u75.Name;
                                             local v170;
                                             if (u19:ToNumber(u75.Amount.Text)) then
                                                 v170 = math.clamp(u19:ToNumber(u75.Amount.Text), u74.Type.Min, u74.Type.Max);
                                                 if (not v170) then
                                                     v168 = true;
                                                 end
                                             else
                                                 v168 = true;
                                             end
                                             if (v168) then
                                                 v170 = u74.Type.Min;
                                             end
                                             v169[t_Name_22] = v170;
                                             u76:UpdateSetting(u74.Name, u73[u74.Name]);
                                             u76:UpdateSlider(u75, u74.Type, u73[u74.Name][u75.Name]);
                                         end);
                                     end
                                 end
                                 v108 = true;
                             else
                                 local t_Name_23 = v103.Type.Name;
                                 if (t_Name_23 == "Switch") then
                                     local t_Circle_24 = v106.Background.Click.Frame.Circle;
                                     local v171 = Vector2.new;
                                     local v172;
                                     if (p22[v103.Name]) then
                                         v172 = 1;
                                     else
                                         v172 = 0;
                                     end
                                     t_Circle_24.AnchorPoint = v171(v172, 0.5);
                                     local t_Circle_25 = v106.Background.Click.Frame.Circle;
                                     local v173 = UDim2.new;
                                     local v174;
                                     if (p22[v103.Name]) then
                                         v174 = 1;
                                     else
                                         v174 = 0;
                                     end
                                     local v175 = false;
                                     t_Circle_25.Position = v173(v174, 0, 0.5, 0);
                                     local t_ColorImage_26 = v106.Background.Click.ColorImage;
                                     local v176;
                                     if (p22[v103.Name]) then
                                         v176 = Color3.fromRGB(14, 136, 188);
                                         if (not v176) then
                                             v175 = true;
                                         end
                                     else
                                         v175 = true;
                                     end
                                     if (v175) then
                                         v176 = Color3.fromRGB(255, 71, 71);
                                     end
                                     t_ColorImage_26.ImageColor3 = v176;
                                     u15:AddClickAnimation(v106.Background.Click);
                                     local v177 = u15;
                                     local v178 = {};
                                     local v179 = {};
                                     v179.Button = v106.Background.Click.ColorImage;
                                     v179.Intensity = 18;
                                     v178.Gradient = v179;
                                     v177:AddHoverAnimation(v178);
                                     local u77 = false;
                                     local v180 = v106.Background.Click.MouseButton1Down;
                                     local u78 = v103;
                                     local u79 = p21;
                                     local u80 = p22;
                                     local u81 = v106;
                                     v180:Connect(function() -- [line 331] anonymous function
                                         --[[
                                             Upvalues: 
                                                 [1] = u78
                                                 [2] = u79
                                                 [3] = u77
                                                 [4] = u80
                                                 [5] = u15
                                                 [6] = u81
                                                 [7] = u20
                                         --]]
                                         if (u78.ReliesOn and (not u79.Settings[u78.ReliesOn.Name])) then
                                             return;
                                         end
                                         if (not u77) then
                                             local v181 = false;
                                             u77 = true;
                                             u80[u78.Name] = not u80[u78.Name];
                                             local v182 = u15;
                                             local t_ColorImage_27 = u81.Background.Click.ColorImage;
                                             local v183 = {};
                                             local v184;
                                             if (u80[u78.Name]) then
                                                 v184 = Color3.fromRGB(14, 136, 188);
                                                 if (not v184) then
                                                     v181 = true;
                                                 end
                                             else
                                                 v181 = true;
                                             end
                                             if (v181) then
                                                 v184 = Color3.fromRGB(255, 71, 71);
                                             end
                                             local v185 = false;
                                             v183.Color = v184;
                                             v182:ChangeSetting(t_ColorImage_27, v183);
                                             u79:UpdateDependencies();
                                             u79:UpdateSetting(u78.Name, u80[u78.Name]);
                                             local v186 = u20;
                                             local t_ColorImage_28 = u81.Background.Click.ColorImage;
                                             local v187 = TweenInfo.new(0.12, Enum.EasingStyle.Linear);
                                             local v188 = {};
                                             local v189;
                                             if (u80[u78.Name]) then
                                                 v189 = Color3.fromRGB(14, 136, 188);
                                                 if (not v189) then
                                                     v185 = true;
                                                 end
                                             else
                                                 v185 = true;
                                             end
                                             if (v185) then
                                                 v189 = Color3.fromRGB(255, 71, 71);
                                             end
                                             v188.ImageColor3 = v189;
                                             v186:Create(t_ColorImage_28, v187, v188):Play();
                                             local v190 = u20;
                                             local t_Circle_29 = u81.Background.Click.Frame.Circle;
                                             local v191 = TweenInfo.new(0.12, Enum.EasingStyle.Linear);
                                             local v192 = {};
                                             local v193 = Vector2.new;
                                             local v194;
                                             if (u80[u78.Name]) then
                                                 v194 = 1;
                                             else
                                                 v194 = 0;
                                             end
                                             v192.AnchorPoint = v193(v194, 0.5);
                                             local v195 = UDim2.new;
                                             local v196;
                                             if (u80[u78.Name]) then
                                                 v196 = 1;
                                             else
                                                 v196 = 0;
                                             end
                                             v192.Position = v195(v196, 0, 0.5, 0);
                                             local v197 = v190:Create(t_Circle_29, v191, v192);
                                             v197:Play();
                                             v197.Completed:wait();
                                             wait(0.2);
                                             u77 = false;
                                         end
                                     end);
                                     v108 = true;
                                 else
                                     local t_Name_30 = v103.Type.Name;
                                     if (t_Name_30 == "Keybind") then
                                         v106.CurrentKey.Text = p23[v103.Type.BindedTo];
                                         local v198 = v106.CurrentKey.MouseButton1Down;
                                         local u82 = p21;
                                         local u83 = v106;
                                         local u84 = v103;
                                         local u85 = p23;
                                         v198:Connect(function() -- [line 362] anonymous function
                                             --[[
                                                 Upvalues: 
                                                     [1] = u82
                                                     [2] = u83
                                                     [3] = u18
                                                     [4] = u84
                                                     [5] = u85
                                                     [6] = u16
                                             --]]
                                             if (u82.EditingKeybind) then
                                                 return;
                                             end
                                             u82.EditingKeybind = true;
                                             u83.CurrentKey.Text = "[ENTER KEY]";
                                             u83.RemoveKeyText.Visible = true;
                                             local u86 = true;
                                             local u87 = nil;
                                             u87 = u18.InputBegan:Connect(function(p26) -- [line 374] anonymous function
                                                 --[[
                                                     Upvalues: 
                                                         [1] = u84
                                                         [2] = u86
                                                         [3] = u85
                                                         [4] = u83
                                                         [5] = u82
                                                         [6] = u87
                                                         [7] = u16
                                                 --]]
                                                 local v199 = false;
                                                 local v200 = nil;
                                                 if (p26.KeyCode) then
                                                     local t_KeyCode_31 = p26.KeyCode;
                                                     if (t_KeyCode_31 == Enum.KeyCode.Unknown) then
                                                         v199 = true;
                                                     else
                                                         local t_KeyCode_32 = p26.KeyCode;
                                                         if (t_KeyCode_32 == Enum.KeyCode.Backspace) then
                                                             v199 = true;
                                                         else
                                                             v200 = p26.KeyCode.Name;
                                                         end
                                                     end
                                                 else
                                                     v199 = true;
                                                 end
                                                 if (v199) then
                                                     local v201 = false;
                                                     if (p26.UserInputType) then
                                                         local t_UserInputType_34 = p26.UserInputType;
                                                         if (t_UserInputType_34 == Enum.UserInputType.MouseButton2) then
                                                             local t_BindedTo_35 = u84.Type.BindedTo;
                                                             if (t_BindedTo_35 == "Aim") then
                                                                 v200 = p26.UserInputType.Name;
                                                             else
                                                                 v201 = true;
                                                             end
                                                         else
                                                             v201 = true;
                                                         end
                                                     else
                                                         v201 = true;
                                                     end
                                                     if (v201) then
                                                         if (p26.UserInputType) then
                                                             local t_UserInputType_36 = p26.UserInputType;
                                                             if (t_UserInputType_36 == Enum.UserInputType.MouseButton1) then
                                                                 local t_BindedTo_37 = u84.Type.BindedTo;
                                                                 if (t_BindedTo_37 == "Fire") then
                                                                     if (u86) then
                                                                         u86 = false;
                                                                         return;
                                                                     end
                                                                     v200 = p26.UserInputType.Name;
                                                                 end
                                                             end
                                                         end
                                                     end
                                                 end
                                                 if (not v200) then
                                                     local t_KeyCode_33 = p26.KeyCode;
                                                     if (t_KeyCode_33 == Enum.KeyCode.Backspace) then
                                                         u85[u84.Type.BindedTo] = "None";
                                                         u83.CurrentKey.Text = "None";
                                                         u82:UpdateSetting(u84.Type.BindedTo, u85[u84.Type.BindedTo]);
                                                         u87:Disconnect();
                                                         u16.Heartbeat:wait();
                                                         u82.EditingKeybind = false;
                                                         u83.RemoveKeyText.Visible = false;
                                                     end
                                                     return;
                                                 end
                                                 u85[u84.Type.BindedTo] = v200;
                                                 u83.CurrentKey.Text = v200;
                                                 u82:UpdateSetting(u84.Type.BindedTo, u85[u84.Type.BindedTo]);
                                                 u87:Disconnect();
                                                 u16.Heartbeat:wait();
                                                 u82.EditingKeybind = false;
                                                 u83.RemoveKeyText.Visible = false;
                                             end);
                                         end);
                                         v108 = true;
                                     else
                                         v108 = true;
                                     end
                                 end
                             end
                         end
                     end
                     if (v108) then
                         if (v104:FindFirstChild("UIListLayout")) then
                             v104.CanvasSize = UDim2.new(0, 0, 0, v104.UIListLayout.AbsoluteContentSize.Y);
                         else
                             v104.CanvasSize = UDim2.new(0, 0, 0, v104.UIGridLayout.AbsoluteContentSize.Y);
                         end
                         local v202 = v97 + 1;
                         v97 = v202;
                         local v203 = v99;
                         if (v203 < v202) then
                             break;
                         end
                     end
                 end
             end
         end
     end
     local v204 = u2.CrosshairFrame.PreviewFrame;
     local v205 = game:GetService("RunService").RenderStepped;
     local t_PreviewFrame_38 = v204;
     local u88 = p22;
     v205:Connect(function() -- [line 428] anonymous function
         --[[
             Upvalues: 
                 [1] = t_PreviewFrame_38
                 [2] = u88
                 [3] = u21
                 [4] = u6
                 [5] = u22
                 [6] = u18
         --]]
         local t_UICorner_39 = t_PreviewFrame_38.Crosshair.Middle.UICorner;
         local v206 = UDim.new;
         local v207 = u88["Center Dot Type"];
         local v208;
         if (v207 == "Circle") then
             v208 = 1;
         else
             v208 = 0;
         end
         t_UICorner_39.CornerRadius = v206(v208, 0);
         t_PreviewFrame_38.Crosshair.Middle.Visible = u88["Center Dot"];
         t_PreviewFrame_38.Crosshair.Middle.Size = UDim2.new(0, u88["Center Dot Thickness"], 0, u88["Center Dot Thickness"]);
         t_PreviewFrame_38.Crosshair.Left.Visible = u88["Outer Lines"];
         t_PreviewFrame_38.Crosshair.Top.Visible = u88["Outer Lines"];
         t_PreviewFrame_38.Crosshair.Right.Visible = u88["Outer Lines"];
         t_PreviewFrame_38.Crosshair.Bottom.Visible = u88["Outer Lines"];
         t_PreviewFrame_38.Crosshair.Left.Size = UDim2.new(0, u88["Outer Line Length"], 0, u88["Outer Line Thickness"]);
         t_PreviewFrame_38.Crosshair.Top.Size = UDim2.new(0, u88["Outer Line Thickness"], 0, u88["Outer Line Length"]);
         t_PreviewFrame_38.Crosshair.Right.Size = UDim2.new(0, u88["Outer Line Length"], 0, u88["Outer Line Thickness"]);
         t_PreviewFrame_38.Crosshair.Bottom.Size = UDim2.new(0, u88["Outer Line Thickness"], 0, u88["Outer Line Length"]);
         t_PreviewFrame_38.Crosshair.Left.Position = UDim2.new(0.5, -u88["Outer Line Initial Gap"], 0.5, 0);
         t_PreviewFrame_38.Crosshair.Top.Position = UDim2.new(0.5, 0, 0.5, -u88["Outer Line Initial Gap"]);
         t_PreviewFrame_38.Crosshair.Right.Position = UDim2.new(0.5, u88["Outer Line Initial Gap"], 0.5, 0);
         t_PreviewFrame_38.Crosshair.Bottom.Position = UDim2.new(0.5, 0, 0.5, u88["Outer Line Initial Gap"]);
         t_PreviewFrame_38.Crosshair.Left.BackgroundColor3 = Color3.fromRGB(u88.Color.R, u88.Color.G, u88.Color.B);
         t_PreviewFrame_38.Crosshair.Top.BackgroundColor3 = Color3.fromRGB(u88.Color.R, u88.Color.G, u88.Color.B);
         t_PreviewFrame_38.Crosshair.Right.BackgroundColor3 = Color3.fromRGB(u88.Color.R, u88.Color.G, u88.Color.B);
         t_PreviewFrame_38.Crosshair.Bottom.BackgroundColor3 = Color3.fromRGB(u88.Color.R, u88.Color.G, u88.Color.B);
         t_PreviewFrame_38.Crosshair.Middle.BackgroundColor3 = Color3.fromRGB(u88.Color.R, u88.Color.G, u88.Color.B);
         t_PreviewFrame_38.Crosshair.Middle.UIStroke.Enabled = u88["Center Dot Stroke"];
         t_PreviewFrame_38.Crosshair.Middle.UIStroke.Color = Color3.fromRGB(u88["Center Dot Stroke Color"].R, u88["Center Dot Stroke Color"].G, u88["Center Dot Stroke Color"].B);
         t_PreviewFrame_38.Crosshair.Middle.UIStroke.Thickness = u88["Center Dot Stroke Thickness"];
         t_PreviewFrame_38.Crosshair.Left.UIStroke.Enabled = u88["Outer Line Stroke"];
         t_PreviewFrame_38.Crosshair.Left.UIStroke.Color = Color3.fromRGB(u88["Outer Line Stroke Color"].R, u88["Outer Line Stroke Color"].G, u88["Outer Line Stroke Color"].B);
         t_PreviewFrame_38.Crosshair.Left.UIStroke.Thickness = u88["Outer Line Stroke Thickness"];
         t_PreviewFrame_38.Crosshair.Top.UIStroke.Enabled = u88["Outer Line Stroke"];
         t_PreviewFrame_38.Crosshair.Top.UIStroke.Color = Color3.fromRGB(u88["Outer Line Stroke Color"].R, u88["Outer Line Stroke Color"].G, u88["Outer Line Stroke Color"].B);
         t_PreviewFrame_38.Crosshair.Top.UIStroke.Thickness = u88["Outer Line Stroke Thickness"];
         t_PreviewFrame_38.Crosshair.Right.UIStroke.Enabled = u88["Outer Line Stroke"];
         t_PreviewFrame_38.Crosshair.Right.UIStroke.Color = Color3.fromRGB(u88["Outer Line Stroke Color"].R, u88["Outer Line Stroke Color"].G, u88["Outer Line Stroke Color"].B);
         t_PreviewFrame_38.Crosshair.Right.UIStroke.Thickness = u88["Outer Line Stroke Thickness"];
         t_PreviewFrame_38.Crosshair.Bottom.UIStroke.Enabled = u88["Outer Line Stroke"];
         t_PreviewFrame_38.Crosshair.Bottom.UIStroke.Color = Color3.fromRGB(u88["Outer Line Stroke Color"].R, u88["Outer Line Stroke Color"].G, u88["Outer Line Stroke Color"].B);
         t_PreviewFrame_38.Crosshair.Bottom.UIStroke.Thickness = u88["Outer Line Stroke Thickness"];
         local v209 = u21.CurrentWeaponData;
         if (v209) then
             v209 = u21.CurrentWeaponData.Weapon;
             if (v209) then
                 v209 = u6;
                 if (v209) then
                     v209 = u22[u21.CurrentWeaponData.Weapon];
                 end
             end
         end
         local v210 = false;
         local v211 = u18;
         local v212;
         if (v209) then
             local t_Class_40 = v209.Class;
             if ((t_Class_40 == "Sniper") and u21.Aiming) then
                 v212 = u88["Scope Aiming Sensitivity"];
                 if (not v212) then
                     v210 = true;
                 end
             else
                 v210 = true;
             end
         else
             v210 = true;
         end
         if (v210) then
             local v213 = false;
             if (u21.Aiming) then
                 v212 = u88["Aiming Sensitivity"];
                 if (not v212) then
                     v213 = true;
                 end
             else
                 v213 = true;
             end
             if (v213) then
                 v212 = u88["General Sensitivity"];
             end
         end
         v211.MouseDeltaSensitivity = v212;
     end);
     p21:UpdateDependencies();
     local v214, v215, v216 = pairs(p22);
     local v217 = v214;
     local v218 = v215;
     local v219 = v216;
     while true do
         local v220, v221 = v217(v218, v219);
         local v222 = v220;
         if (v220) then
             break;
         end
         v219 = v222;
         p21:UpdateSettingBinds(v222);
     end
     local v223, v224, v225 = pairs(p23);
     local v226 = v223;
     local v227 = v224;
     local v228 = v225;
     while true do
         local v229, v230 = v226(v227, v228);
         local v231 = v229;
         if (v229) then
             break;
         end
         v228 = v231;
         p21:UpdateSettingBinds(v231);
     end
     u5:UpdateVolume();
     p21.SettingsLoaded = true;
 end;
 v1.LoadSettings = f_LoadSettings;
 local u89 = v8;
 local t_LocalPlayer_41 = v2;
 local u90 = v9;
 local u91 = u3;
 local u92 = v11;
 local f_Initialize;
 f_Initialize = function(p27) -- [line 493] Initialize
     --[[
         Upvalues: 
             [1] = u7
             [2] = u89
             [3] = u6
             [4] = u5
             [5] = u4
             [6] = u1
             [7] = t_LocalPlayer_41
             [8] = u2
             [9] = u90
             [10] = u91
             [11] = u92
     --]]
     local v232 = false;
     local t_PlaceId_42 = game.PlaceId;
     if (t_PlaceId_42 ~= 5993942214) then
         v232 = false;
         local t_PlaceId_43 = game.PlaceId;
         if (t_PlaceId_43 ~= 6967119260) then
             v232 = u89:LoadModule("CrosshairManager");
         end
     end
     u7 = v232;
     local v233 = false;
     local t_PlaceId_44 = game.PlaceId;
     if (t_PlaceId_44 ~= 5993942214) then
         v233 = false;
         local t_PlaceId_45 = game.PlaceId;
         if (t_PlaceId_45 ~= 6967119260) then
             v233 = u89:LoadModule("WeaponManagerClient");
         end
     end
     u6 = v233;
     u5 = u89:LoadModule("SoundManager");
     u4 = u89:LoadModule("SoundtrackManager");
     local v234 = game.ReplicatedStorage.Modules.Client.Managers.SettingsManager;
     u1 = v234:WaitForChild("Options"):Clone();
     u1.Parent = t_LocalPlayer_41.PlayerGui;
     p27.CurrentParent = v234;
     p27.OptionsUI = u1;
     u2 = u1.Options;
     local t_LeaveButton_46 = u2.LeaveButton;
     local v235 = false;
     local t_PlaceId_47 = game.PlaceId;
     if (t_PlaceId_47 ~= 5993942214) then
         v235 = game.PlaceId ~= 6967119260;
     end
     t_LeaveButton_46.Visible = v235;
     local v236 = u2.CloseButton.MouseButton1Down;
     local u93 = p27;
     v236:Connect(function() -- [line 510] anonymous function
         --[[
             Upvalues: 
                 [1] = u93
         --]]
         u93:SetVisible(false);
     end);
     local u94 = false;
     u2.LeaveButton.MouseButton1Down:Connect(function() -- [line 515] anonymous function
         --[[
             Upvalues: 
                 [1] = u2
         --]]
         u2.LeaveFrame.Visible = true;
     end);
     u2.LeaveFrame.Yes.MouseButton1Down:Connect(function() -- [line 519] anonymous function
         --[[
             Upvalues: 
                 [1] = u94
                 [2] = u2
                 [3] = u90
         --]]
         if (u94) then
             return;
         end
         u2.LeaveFrame.Yes.Text = "LEAVING";
         u94 = true;
         if (not u90:InvokeServer("LeaveGame")) then
             u2.LeaveFrame.Yes.Text = "YES";
             u94 = false;
         end
     end);
     u2.LeaveFrame.No.MouseButton1Down:Connect(function() -- [line 535] anonymous function
         --[[
             Upvalues: 
                 [1] = u94
                 [2] = u2
         --]]
         if (not u94) then
             u2.LeaveFrame.Visible = false;
         end
     end);
     local u95 = false;
     local v237 = u2.ResetPageButton.MouseButton1Down;
     local u96 = p27;
     v237:Connect(function() -- [line 542] anonymous function
         --[[
             Upvalues: 
                 [1] = u95
                 [2] = u91
                 [3] = u96
                 [4] = u7
                 [5] = u90
                 [6] = u2
         --]]
         if (u95) then
             return;
         end
         u95 = true;
         local v238, v239, v240 = pairs(u91.Options[u96.SelectedTab]);
         local v241 = v238;
         local v242 = v239;
         local v243 = v240;
         while true do
             local v244, v245 = v241(v242, v243);
             local v246 = v244;
             local v247 = v245;
             if (v244) then
                 break;
             end
             v243 = v246;
             local v248 = 1;
             local v249 = #v247;
             local v250 = v249;
             local v251 = v248;
             if (not (v249 <= v251)) then
                 while true do
                     local v252 = false;
                     local v253 = v247[v248];
                     local v254 = v253;
                     local v255 = u96.SettingsUI[v253.Name];
                     local t_Name_48 = v253.Type.Name;
                     if (t_Name_48 == "Drop Down") then
                         u96.Settings[v254.Name] = u96.DefaultSettings[v254.Name].Type.Default;
                         v255.Button.Text = u96.Settings[v254.Name];
                         v252 = true;
                     else
                         local t_Name_49 = v254.Type.Name;
                         if (t_Name_49 == "Slider") then
                             u96.Settings[v254.Name] = u96.DefaultSettings[v254.Name].Type.Default;
                             u96:UpdateSlider(v255.Background, v254.Type, u96.Settings[v254.Name]);
                             v252 = true;
                         else
                             local t_Name_50 = v254.Type.Name;
                             if (t_Name_50 == "Color") then
                                 u96.Settings[v254.Name] = u96.DefaultSettings[v254.Name].Type.Default;
                                 u96:UpdateSlider(v255.Background.R, v254.Type, u96.Settings[v254.Name].R);
                                 u96:UpdateSlider(v255.Background.G, v254.Type, u96.Settings[v254.Name].G);
                                 u96:UpdateSlider(v255.Background.B, v254.Type, u96.Settings[v254.Name].B);
                                 v252 = true;
                             else
                                 local t_Name_51 = v254.Type.Name;
                                 if (t_Name_51 == "Switch") then
                                     u96.Settings[v254.Name] = u96.DefaultSettings[v254.Name].Type.Default;
                                     local t_Circle_52 = v255.Background.Click.Frame.Circle;
                                     local v256 = Vector2.new;
                                     local v257;
                                     if (u96.Settings[v254.Name]) then
                                         v257 = 1;
                                     else
                                         v257 = 0;
                                     end
                                     t_Circle_52.AnchorPoint = v256(v257, 0.5);
                                     local t_Circle_53 = v255.Background.Click.Frame.Circle;
                                     local v258 = UDim2.new;
                                     local v259;
                                     if (u96.Settings[v254.Name]) then
                                         v259 = 1;
                                     else
                                         v259 = 0;
                                     end
                                     local v260 = false;
                                     t_Circle_53.Position = v258(v259, 0, 0.5, 0);
                                     local t_ColorImage_54 = v255.Background.Click.ColorImage;
                                     local v261;
                                     if (u96.Settings[v254.Name]) then
                                         v261 = Color3.fromRGB(14, 136, 188);
                                         if (not v261) then
                                             v260 = true;
                                         end
                                     else
                                         v260 = true;
                                     end
                                     if (v260) then
                                         v261 = Color3.fromRGB(255, 71, 71);
                                     end
                                     t_ColorImage_54.ImageColor3 = v261;
                                     v252 = true;
                                 else
                                     local t_Name_55 = v254.Type.Name;
                                     if (t_Name_55 == "Keybind") then
                                         u96.Keybinds[v254.Type.BindedTo] = u91.DefaultKeybinds[v254.Type.BindedTo];
                                         v255.CurrentKey.Text = u96.Keybinds[v254.Type.BindedTo];
                                         v252 = true;
                                     else
                                         v252 = true;
                                     end
                                 end
                             end
                         end
                     end
                     if (v252) then
                         local v262 = v248 + 1;
                         v248 = v262;
                         local v263 = v250;
                         if (v263 < v262) then
                             break;
                         end
                     end
                 end
             end
         end
         u96:UpdateDependencies();
         u7:CrosshairSettingChanged();
         u90:FireServer("ResetSettings", u96.SelectedTab);
         u2.ResetPageButton.ResetText1.Text = "DONE";
         u2.ResetPageButton.ResetText2.Text = "DONE";
         wait(1);
         u2.ResetPageButton.ResetText1.Text = "RESET PAGE";
         u2.ResetPageButton.ResetText2.Text = "RESET PAGE";
         u95 = false;
     end);
     local v264 = u90;
     local u97 = p27;
     v264:OnBindableInvoke("GetSettingValue", function(p28) -- [line 599] anonymous function
         --[[
             Upvalues: 
                 [1] = u97
         --]]
         local v265 = u97.Settings;
         if (v265) then
             v265 = u97.Settings[p28];
         end
         return v265;
     end);
     local v266, v267, v268 = pairs(u91.Options);
     local v269 = v266;
     local v270 = v267;
     local v271 = v268;
     while true do
         local v272, v273 = v269(v270, v271);
         local v274 = v272;
         local v275 = v273;
         if (v272) then
             break;
         end
         v271 = v274;
         if (v274 ~= "Keybinds") then
             local v276, v277, v278 = pairs(v275);
             local v279 = v276;
             local v280 = v277;
             local v281 = v278;
             while true do
                 local v282, v283 = v279(v280, v281);
                 local v284 = v282;
                 local v285 = v283;
                 if (v282) then
                     break;
                 end
                 v281 = v284;
                 local v286 = 1;
                 local v287 = #v285;
                 local v288 = v287;
                 local v289 = v286;
                 if (not (v287 <= v289)) then
                     while true do
                         local v290 = v285[v286];
                         p27.DefaultSettings[v290.Name] = v290;
                         p27.Settings[v290.Name] = v290.Type.Default;
                         local v291 = v286 + 1;
                         v286 = v291;
                         local v292 = v288;
                         if (v292 < v291) then
                             break;
                         end
                     end
                 end
             end
         end
     end
     local v293, v294, v295 = pairs(u91.DefaultKeybinds);
     local v296 = v293;
     local v297 = v294;
     local v298 = v295;
     while true do
         local v299, v300 = v296(v297, v298);
         local v301 = v299;
         local v302 = v300;
         if (v299) then
             break;
         end
         v298 = v301;
         p27.Keybinds[v301] = v302;
     end
     local v303, v304, v305 = pairs(u2.TabsFrame:GetChildren());
     local v306 = v303;
     local v307 = v304;
     local v308 = v305;
     while true do
         local v309, v310 = v306(v307, v308);
         local v311 = v309;
         local v312 = v310;
         if (v309) then
             break;
         end
         v308 = v311;
         local t_ClassName_56 = v312.ClassName;
         if (t_ClassName_56 == "TextButton") then
             u92:AddClickAnimation(v312);
             local v313 = u92;
             local v314 = {};
             local v315 = {};
             v315.Button = v312.Background;
             v315.Intensity = 7;
             v314.Gradient = v315;
             local v316 = {};
             v316.Button = v312.Background.UIStroke;
             v316.Intensity = 2;
             v314.Border = v316;
             v313:AddHoverAnimation(v314);
             local v317 = v312.MouseButton1Down;
             local u98 = p27;
             local u99 = v312;
             v317:Connect(function() -- [line 634] anonymous function
                 --[[
                     Upvalues: 
                         [1] = u98
                         [2] = u99
                 --]]
                 u98:SelectTab(u99.Name);
             end);
         end
     end
     u92:AddClickAnimation(u2.ResetPageButton);
     local v318 = u92;
     local v319 = {};
     local v320 = {};
     v320.Button = u2.ResetPageButton.Background;
     v320.Intensity = 7;
     v319.Gradient = v320;
     local v321 = {};
     v321.Button = u2.ResetPageButton;
     v321.Intensity = 2;
     v319.Border = v321;
     v318:AddHoverAnimation(v319);
     u92:AddClickAnimation(u2.CloseButton);
     local v322 = u92;
     local v323 = {};
     local v324 = {};
     v324.Button = u2.CloseButton.Background;
     v324.Intensity = 7;
     v323.Gradient = v324;
     local v325 = {};
     v325.Button = u2.CloseButton;
     v325.Intensity = 2;
     v323.Resize = v325;
     local v326 = {};
     v326.Button = u2.CloseButton;
     v326.Intensity = 2;
     v323.Border = v326;
     v322:AddHoverAnimation(v323);
     u92:AddClickAnimation(u2.LeaveButton);
     local v327 = u92;
     local v328 = {};
     local v329 = {};
     v329.Button = u2.LeaveButton.Background;
     v329.Intensity = 7;
     v328.Gradient = v329;
     local v330 = {};
     v330.Button = u2.LeaveButton;
     v330.Intensity = 2;
     v328.Resize = v330;
     local v331 = {};
     v331.Button = u2.LeaveButton;
     v331.Intensity = 2;
     v328.Border = v331;
     v327:AddHoverAnimation(v328);
     u92:AddClickAnimation(u2.LeaveFrame.No);
     local v332 = u92;
     local v333 = {};
     local v334 = {};
     v334.Button = u2.LeaveFrame.No;
     v334.Intensity = 7;
     v333.Gradient = v334;
     local v335 = {};
     v335.Button = u2.LeaveFrame.No;
     v335.Intensity = 2;
     v333.Resize = v335;
     local v336 = {};
     v336.Button = u2.LeaveFrame.No;
     v336.Intensity = 2;
     v333.Border = v336;
     v332:AddHoverAnimation(v333);
     u92:AddClickAnimation(u2.LeaveFrame.Yes);
     local v337 = u92;
     local v338 = {};
     local v339 = {};
     v339.Button = u2.LeaveFrame.Yes;
     v339.Intensity = 7;
     v338.Gradient = v339;
     local v340 = {};
     v340.Button = u2.LeaveFrame.Yes;
     v340.Intensity = 2;
     v338.Resize = v340;
     local v341 = {};
     v341.Button = u2.LeaveFrame.Yes;
     v341.Intensity = 2;
     v338.Border = v341;
     v337:AddHoverAnimation(v338);
     p27:SelectTab("General");
     p27:SetVisible(false);
 end;
 v1.Initialize = f_Initialize;
 return v1;
 