-- Decompiled with the Synapse X Luau decompiler.
 --NOTE: Currently in beta! Not representative of final product.
 local v1 = {};
 v1.DisabledShadows = {};
 v1.Messages = {};
 v1.NewMessageTick = 0;
 v1.NewMessages = 0;
 local v2 = game.Players.LocalPlayer;
 local v3 = v2:GetMouse();
 local u1 = workspace:WaitForChild("ServerFolder");
 local u2 = nil;
 local u3 = nil;
 local u4 = nil;
 local u5 = nil;
 local v4 = game:GetService("RunService");
 local v5 = require(game.ReplicatedStorage.Modules.Shared.ModuleLoader);
 local v6 = v5:LoadModule("Network");
 local v7 = v5:LoadModule("Clean");
 local v8 = v5:LoadModule("DataManager");
 local v9 = v5:LoadModule("UIAnimations");
 local u6 = nil;
 local f_SetVisible;
 f_SetVisible = function(p1, p2) -- [line 32] SetVisible
     --[[
         Upvalues: 
             [1] = u5
     --]]
     if (p2) then
         p1:UpdateTime();
     end
     u5.Visible = p2;
     p1.UIVisible = p2;
 end;
 v1.SetVisible = f_SetVisible;
 local f_GetTime;
 f_GetTime = function(p3, p4) -- [line 42] GetTime
     --[[
         Upvalues: 
             [1] = u1
     --]]
     local v10 = (u1.SyncedTime.Value - p4) / 1000;
     local v11 = {};
     local v12 = {};
     v12.Name = "Year";
     v12.Amount = 31540000;
     local v13 = {};
     v13.Name = "Month";
     v13.Amount = 2628000;
     local v14 = {};
     v14.Name = "Week";
     v14.Amount = 604800;
     local v15 = {};
     v15.Name = "Day";
     v15.Amount = 86400;
     local v16 = {};
     v16.Name = "Hour";
     v16.Amount = 3600;
     local v17 = {};
     v17.Name = "Minute";
     v17.Amount = 60;
     local v18 = {};
     v18.Name = "Second";
     v18.Amount = 1;
     v11[1] = v12;
     v11[2] = v13;
     v11[3] = v14;
     v11[4] = v15;
     v11[5] = v16;
     v11[6] = v17;
     v11[7] = v18;
     local v19 = v11;
     local v20 = 1;
     local v21 = #v11;
     local v22 = v21;
     local v23 = v20;
     if (not (v21 <= v23)) then
         local v25;
         while true do
             local v24 = v19[v20];
             v25 = v24;
             if (((v10 / v24.Amount) >= 1) or (v20 == (#v19))) then
                 break;
             end
             local v26 = v20 + 1;
             v20 = v26;
             local v27 = v22;
             if (v27 < v26) then
                 break;
             end
         end
         local v28 = math.ceil(v10 / v25.Amount);
         local v29 = v28;
         local t_Name_1 = v25.Name;
         local v30;
         if (v28 > 2) then
             v30 = "s";
         else
             v30 = "";
         end
         return v29 .. (" " .. (t_Name_1 .. v30));
     end
 end;
 v1.GetTime = f_GetTime;
 local f_IsMenu;
 f_IsMenu = function(p5) -- [line 86] IsMenu
     local v31 = true;
     local t_PlaceId_2 = game.PlaceId;
     if (t_PlaceId_2 ~= 5993942214) then
         v31 = game.PlaceId == 6967119260;
     end
     return v31;
 end;
 v1.IsMenu = f_IsMenu;
 local u7 = v8;
 local u8 = v9;
 local u9 = v6;
 local f_AddMessages;
 f_AddMessages = function(p6, p7) -- [line 90] AddMessages
     --[[
         Upvalues: 
             [1] = u5
             [2] = u7
             [3] = u8
             [4] = u9
             [5] = u3
             [6] = u2
     --]]
     local v32, v33, v34 = pairs(u5.MessagesList:GetChildren());
     local v35 = v32;
     local v36 = v33;
     local v37 = v34;
     while true do
         local v38, v39 = v35(v36, v37);
         local v40 = v38;
         local v41 = v39;
         if (v38) then
             break;
         end
         v37 = v40;
         local t_ClassName_3 = v41.ClassName;
         if (t_ClassName_3 == "Frame") then
             v41:Destroy();
         end
     end
     p6.Messages = {};
     local u10 = 0;
     local v42 = 1;
     local v43 = #u7.Data.Messages;
     local v44 = v43;
     local v45 = v42;
     if (not (v43 <= v45)) then
         while true do
             local v46 = u7.Data.Messages[v42];
             local v47 = v46;
             if (v46.New) then
                 u10 = u10 + 1;
             end
             local v48 = false;
             local v49 = false;
             local v50 = p6.CurrentParent.Templates.MessageTemplate:Clone();
             local v51 = v50;
             v50.Title.Text = v47.Title;
             v50.Time.Text = p6:GetTime(v47.Timestamp) .. " Ago";
             v50.LayoutOrder = (#u7.Data.Messages) - v42;
             local v52;
             if (v47.New) then
                 v52 = Color3.fromRGB(227, 63, 63);
                 if (v52) then
                     v49 = true;
                 else
                     v48 = true;
                 end
             else
                 v48 = true;
             end
             if (v48) then
                 v52 = Color3.fromRGB(95, 95, 95);
                 v49 = true;
             end
             if (v49) then
                 v51.BackgroundColor3 = v52;
                 v51.Parent = u5.MessagesList;
                 u8:AddClickAnimation(v51.Select);
                 local v53 = u8;
                 local v54 = {};
                 local v55 = {};
                 v55.Button = v51;
                 v55.Intensity = 7;
                 v54.Gradient = v55;
                 v53:AddHoverAnimation(v54);
                 local v56 = p6.Messages;
                 local v57 = {};
                 v57.Data = v47;
                 v57.Template = v51;
                 table.insert(v56, 1, v57);
                 local v58 = v51.Select.MouseButton1Down;
                 local u11 = v47;
                 local u12 = v42;
                 local u13 = p6;
                 v58:Connect(function() -- [line 128] anonymous function
                     --[[
                         Upvalues: 
                             [1] = u5
                             [2] = u11
                             [3] = u10
                             [4] = u9
                             [5] = u12
                             [6] = u13
                     --]]
                     u5.MessagesList.Visible = false;
                     u5.Content.Visible = true;
                     u5.Content.Title.Text = u11.Title;
                     u5.Content.ScrollingFrame.Description.Text = u11.MessageContent;
                     if (u10 >= 0) then
                         u11.New = nil;
                         u9:FireServer("ReadMessage", u12);
                         u13:AddMessages(true);
                     end
                 end);
                 local v59 = v42 + 1;
                 v42 = v59;
                 local v60 = v44;
                 if (v60 < v59) then
                     break;
                 end
             end
         end
     end
     u5.MessagesList.CanvasSize = UDim2.new(0, 0, 0, (#u7.Data.Messages) * 30);
     if (p6:IsMenu()) then
         u3.MainMenu.ViewMessages.UpdatedSignal.Visible = 0 < u10;
     else
         u2.CharacterFrame.Information.MessagesMenu.UpdatedSignal.Visible = 0 < u10;
     end
     if ((u10 >= 0) and (not p7)) then
         p6.NewMessageTick = tick();
         p6.NewMessages = u10;
     else
         p6.NewMessages = 0;
     end
 end;
 v1.AddMessages = f_AddMessages;
 local f_UpdateTime;
 f_UpdateTime = function(p8) -- [line 160] UpdateTime
     local v61 = 1;
     local v62 = #p8.Messages;
     local v63 = v62;
     local v64 = v61;
     if (not (v62 <= v64)) then
         while true do
             local v65 = p8.Messages[v61];
             v65.Template.Time.Text = p8:GetTime(v65.Data.Timestamp) .. " Ago";
             local v66 = v61 + 1;
             v61 = v66;
             local v67 = v63;
             if (v67 < v66) then
                 break;
             end
         end
     end
 end;
 v1.UpdateTime = f_UpdateTime;
 local t_LocalPlayer_4 = v2;
 local u14 = v5;
 local u15 = v8;
 local u16 = v4;
 local u17 = v9;
 local f_Initialize;
 f_Initialize = function(p9) -- [line 168] Initialize
     --[[
         Upvalues: 
             [1] = u3
             [2] = t_LocalPlayer_4
             [3] = u6
             [4] = u14
             [5] = u2
             [6] = u4
             [7] = u5
             [8] = u15
             [9] = u16
             [10] = u17
     --]]
     if (p9:IsMenu()) then
         u3 = t_LocalPlayer_4:WaitForChild("PlayerGui"):WaitForChild("Menu");
         u6 = u14:LoadModule("UIManager");
     else
         u2 = t_LocalPlayer_4:WaitForChild("PlayerGui"):WaitForChild("MainUI");
     end
     local v68 = game.ReplicatedStorage.Modules.Client.Managers.MessagesManager;
     u4 = v68:WaitForChild("MessagesMenu"):Clone();
     u4.Parent = t_LocalPlayer_4.PlayerGui;
     u5 = u4.Messages;
     p9.CurrentParent = v68;
     local v69 = u5.XButton.MouseButton1Down;
     local u18 = p9;
     v69:Connect(function() -- [line 184] anonymous function
         --[[
             Upvalues: 
                 [1] = u5
                 [2] = u18
         --]]
         if (not u5.Content.Visible) then
             u18:SetVisible(false);
             return;
         end
         u5.Content.Visible = false;
         u5.MessagesList.Visible = true;
     end);
     local v70 = u15;
     local u19 = p9;
     v70:OnUpdate("Messages", function() -- [line 193] anonymous function
         --[[
             Upvalues: 
                 [1] = u19
         --]]
         u19:AddMessages();
     end);
     local v71 = u15;
     local u20 = p9;
     v71:OnLoad(function() -- [line 197] anonymous function
         --[[
             Upvalues: 
                 [1] = u20
         --]]
         u20:AddMessages();
     end);
     local v72 = u16.RenderStepped;
     local u21 = p9;
     v72:Connect(function() -- [line 201] anonymous function
         --[[
             Upvalues: 
                 [1] = u21
                 [2] = u6
                 [3] = u4
                 [4] = u5
         --]]
         if ((u21:IsMenu() and (not u6.IntroFinished)) and (u21.NewMessages >= 0)) then
             u21.NewMessageTick = tick();
         end
         u4.Display.NewMessage.Visible = (tick() - u21.NewMessageTick) <= 5;
         local t_NewMessage_5 = u4.Display.NewMessage;
         local t_NewMessages_6 = u21.NewMessages;
         local v73;
         if (u21.NewMessages > 2) then
             v73 = "s";
         else
             v73 = "";
         end
         t_NewMessage_5.Text = "YOU HAVE " .. (t_NewMessages_6 .. (" NEW MESSAGE" .. v73));
         u5.Content.ScrollingFrame.CanvasSize = UDim2.new(0, 0, 0, u5.Content.ScrollingFrame.Description.TextBounds.Y + 16);
     end);
     u17:AddClickAnimation(u5.XButton);
     local v74 = u17;
     local v75 = {};
     local v76 = {};
     v76.Button = u5.XButton.Background;
     v75.Gradient = v76;
     local v77 = {};
     v77.Button = u5.XButton.Background.UIStroke;
     v75.Border = v77;
     v74:AddHoverAnimation(v75);
     p9:SetVisible(false);
 end;
 v1.Initialize = f_Initialize;
 return v1;
 