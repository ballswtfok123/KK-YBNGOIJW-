-- Decompiled with the Synapse X Luau decompiler.
 --NOTE: Currently in beta! Not representative of final product.
 local v1 = game:GetService("Players");
 local v2 = require(game:GetService("ReplicatedStorage"):WaitForChild("WeaponModule"));
 local u1 = nil;
 local v3 = {};
 v3.Player = v1.LocalPlayer;
 v3.Character = nil;
 v3.Camera = workspace.CurrentCamera;
 v3.Tool = script.Parent;
 v3.characterLookAt = nil;
 v3.isVibrationSupported = nil;
 v3.hapticLargeMotor = nil;
 v3.hapticSmallMotor = nil;
 v3.hapticLTriggerMotor = nil;
 v3.hapticRTriggerMotor = nil;
 v3.hapticLeftHand = nil;
 v3.hapticRightHand = nil;
 v3.Sounds = nil;
 v3.currentShots = 0;
 v3.lastClick = tick();
 v3.RecoilPattern = {};
 local v4 = {};
 v4.Perspective = {
     true,
     Enum.KeyCode.E,
     Enum.KeyCode.DPadUp
 };
 v4.Aim = {
     true,
     Enum.UserInputType.MouseButton2,
     Enum.KeyCode.Q,
     Enum.KeyCode.ButtonL2
 };
 v4.Shoot = {
     true,
     Enum.UserInputType.MouseButton1,
     Enum.KeyCode.ButtonR2
 };
 v4.Reload = {
     true,
     Enum.KeyCode.R,
     Enum.KeyCode.ButtonX
 };
 v3.actionBinds = v4;
 v3.animationList = {};
 v3.LoadedAnimations = false;
 v3.LoadedEvents = false;
 local v5 = {};
 v5.shootHoldRepeat = false;
 v3.resetBool = v5;
 v3.clientCanFire = true;
 local u2 = v2;
 local f_handleAction;
 f_handleAction = function(p1, p2, p3) -- [line 44] handleAction
     --[[
         Upvalues: 
             [1] = u1
             [2] = u2
     --]]
     local t_Parent_1 = u1.Tool.Parent;
     if (t_Parent_1 ~= u1.Character) then
         return;
     end
     if (p2 == Enum.UserInputState.Begin) then
         if (p1 == "Perspective") then
             u2.Perspective(u1);
             return;
         end
         if (p1 == "Aim") then
             u2.Aim(u1);
             return;
         end
         if (p1 == "Shoot") then
             local t_clientCanFire_2 = u1.clientCanFire;
             if (t_clientCanFire_2 == true) then
                 u2.Shoot(u1);
                 return;
             end
         else
             if (p1 == "Reload") then
                 u2.Reload(u1);
                 return;
             end
         end
     else
         if (p2 == Enum.UserInputState.End) then
             if (p1 == "Aim") then
                 u2.Aim(u1, "End");
                 return;
             end
             if (p1 == "Shoot") then
                 u1.resetBool.shootHoldRepeat = false;
             end
         end
     end
 end;
 v3.handleAction = f_handleAction;
 u1 = v3;
 local v6 = u1.Tool.Equipped;
 local u3 = v2;
 local v7 = v6:Connect(function() -- [line 70] anonymous function
     --[[
         Upvalues: 
             [1] = u3
             [2] = u1
     --]]
     u3.Equip(u1, "Equip");
 end);
 local v8 = u1.Tool.Unequipped;
 local u4 = v2;
 local v9 = v8:Connect(function() -- [line 73] anonymous function
     --[[
         Upvalues: 
             [1] = u4
             [2] = u1
     --]]
     u4.Equip(u1, "Unequip");
 end);
 