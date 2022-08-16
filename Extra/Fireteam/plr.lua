-- Decompiled with the Synapse X Luau decompiler.

local u1 = {
	initialize = function(p1)
		local v1 = nil;
		local l__Utility__2 = p1.Utility;
		local v3 = {};
		local v4 = {
			torso = {
				part0 = "HumanoidRootPart", 
				part1 = "Torso", 
				C0 = CFrame.new(0, -1, 0), 
				C1 = CFrame.new(0, 1, 0)
			}, 
			head = {
				part0 = "Torso", 
				part1 = "Head", 
				C0 = CFrame.new(0, 1, 0), 
				C1 = CFrame.new(0, 0.5, 0)
			}, 
			leftArm = {
				part0 = "Torso", 
				part1 = "Left Arm", 
				C0 = CFrame.new(-1.5, 0.5, 0), 
				C1 = CFrame.new(0, -0.5, 0)
			}, 
			rightArm = {
				part0 = "Torso", 
				part1 = "Right Arm", 
				C0 = CFrame.new(1.5, 0.5, 0), 
				C1 = CFrame.new(0, -0.5, 0)
			}, 
			leftLeg = {
				part0 = "Torso", 
				part1 = "Left Leg", 
				C0 = CFrame.new(-0.5, -1, 0), 
				C1 = CFrame.new(0, -1, 0)
			}, 
			rightLeg = {
				part0 = "Torso", 
				part1 = "Right Leg", 
				C0 = CFrame.new(0.5, -1, 0), 
				C1 = CFrame.new(0, -1, 0)
			}
		};
		for v5, v6 in pairs(v4) do
			v3[v6.part1] = v5;
		end;
		local u2 = {};
		local function u3(p2, p3)
			local v7 = {};
			local l__CFrame__8 = p2.HumanoidRootPart.CFrame;
			local v9 = l__CFrame__8 - l__CFrame__8.Position;
			u2[p3] = v7;
			for v10, v11 in pairs(p2:GetChildren()) do
				if v11:IsA("BasePart") then
					local v12 = v3[v11.Name];
					local v13 = v4[v12];
					if v13 then
						local v14 = nil;
						v14 = p2[v13.part0];
						if v12 ~= "torso" then
							local v15 = v9 + v14.CFrame * v13.C0.Position;
							local v16 = v14.CFrame:ToObjectSpace(v15);
						else
							v15 = v9 + v11.CFrame * v13.C0.Position;
							v16 = v14.CFrame:ToObjectSpace(v15);
						end;
						v7[v12] = {
							C0 = v16, 
							C1 = v15:ToObjectSpace(v11.CFrame):Inverse()
						};
					end;
				end;
			end;
		end;
		local u4 = {
			HumanoidRootPart = true, 
			Torso = true, 
			HeadCollisionBox = true, 
			CollisionBox = true, 
			CollisionTorso = true, 
			Middle = true, 
			["Left Arm"] = true, 
			["Right Arm"] = true, 
			["Left Leg"] = true, 
			["Right Leg"] = true
		};
		local v17 = RaycastParams.new();
		v17.CollisionGroup = "MedicalInteract";
		u1.medicalRaycastParams = v17;
		local u5 = nil;
		local l__Players__6 = game:GetService("Players");
		local l__ReplicatedStorage__7 = game:GetService("ReplicatedStorage");
		local u8 = nil;
		local u9 = nil;
		local u10 = nil;
		local u11 = nil;
		local u12 = nil;
		local l__Weapon__13 = p1.Weapon;
		local u14 = nil;
		local u15 = nil;
		local u16 = nil;
		local u17 = nil;
		local l__Lighting__18 = game:GetService("Lighting");
		local u19 = nil;
		local u20 = nil;
		v1 = function()
			u5 = l__Players__6.LocalPlayer.PlayerGui;
			local l__UI__18 = l__ReplicatedStorage__7.Assets.UI;
			u8 = l__UI__18.Map:Clone();
			u8.Parent = u5;
			for v19, v20 in pairs(l__ReplicatedStorage__7.Stances:GetChildren()) do
				u3(v20, v20.Name);
			end;
			local l__GameSettings__21 = p1.ServerDataConstants.GameSettings;
			u9 = l__GameSettings__21.DefaultLayerProperties.DefaultLayer;
			u10 = l__GameSettings__21.DefaultLayerProperties[u9].SoundGroup;
			u11 = l__GameSettings__21.DefaultLayerProperties[u9].BackgroundAudio;
			u12 = l__Weapon__13.weaponCollisionParams;
			u14 = workspace.Players;
			local l__LaserBlind__22 = l__UI__18.LaserBlind;
			l__LaserBlind__22.Parent = u5;
			u15 = l__LaserBlind__22.Frame;
			local l__FlashlightBlind__23 = l__UI__18.FlashlightBlind;
			l__FlashlightBlind__23.Parent = u5;
			u16 = l__FlashlightBlind__23.Frame;
			u17 = l__Lighting__18.NV_ColorCorrection.TintColor;
			local l__Teams__24 = l__ReplicatedStorage__7.Assets.Teams;
			u19 = l__Teams__24.TeamColor.Value;
			u20 = l__Teams__24.FireteamColor.Value;
		end;
		if not game:IsLoaded() then
			game.Loaded:Connect(v1);
		else
			v1();
		end;
		local l__Mathf__25 = l__Utility__2.Mathf;
		local u21 = nil;
		local l__PlayerList__22 = p1.PlayerList;
		function u1.setMyPlayer(p4)
			u21 = l__PlayerList__22[l__Players__6.LocalPlayer.Name];
		end;
		local l__Schedule__23 = l__Utility__2.Schedule;
		local l__Loadout__24 = p1.Loadout;
		local l__Audio__25 = p1.Audio;
		local l__FX__26 = p1.FX;
		local l__UI__27 = p1.UI;
		local u28 = CFrame.new();
		local u29 = Vector3.new();
		local u30 = {
			RoleType = "Unassigned", 
			Role = "Unassigned", 
			RoleTeam = 0
		};
		local l__SmoothValue__31 = l__Utility__2.SmoothValue;
		local l__LerpedValue__32 = l__Utility__2.LerpedValue;
		local l__Spring__33 = l__Utility__2.Spring;
		local l__CollectionService__34 = game:GetService("CollectionService");
		local l__Network__35 = p1.Network;
		local l__Menu__36 = p1.Menu;
		local function u37(p5, p6, p7)
			for v26, v27 in pairs(p6:GetChildren()) do
				if (not (not v27:IsA("Texture")) or not (not v27:IsA("BasePart")) or v27:IsA("Decal")) and not u4[v27.Name] and p5.weapon and not v27:IsDescendantOf(p5.weapon.model) then
					v27.Transparency = p7;
				end;
			end;
		end;
		local l__CurrentCamera__38 = workspace.CurrentCamera;
		local l__lerp__39 = l__Mathf__25.lerp;
		local l__FireteamList__40 = p1.FireteamList;
		local l__NoRallyZones__41 = p1.NoRallyZones;
		local l__BuildableObjectTables__42 = p1.BuildableObjectTables;
		local l__PhysicsService__43 = game:GetService("PhysicsService");
		local u44 = Color3.new(1, 0, 0);
		local u45 = Color3.new(1, 1, 1);
		local l__MaterialsTable__46 = p1.MaterialsTable;
		local l__Physics__47 = l__Utility__2.Physics;
		local l__CropZones__48 = p1.CropZones;
		local u49 = Color3.new(1, 1, 1);
		local u50 = Vector3.new(0, -0.75, 0);
		local u51 = os.clock();
		local l__smoothLerp__52 = l__Mathf__25.smoothLerp;
		local l__fromAxisAngle__53 = l__Utility__2.Cframe.fromAxisAngle;
		function u1.new(p8)
			local v28 = {
				Keys = {}, 
				Ticks = {}, 
				mainSchedule = l__Schedule__23.new(), 
				weapons = {}, 
				gear = {}
			};
			local v29 = p8 == l__Players__6.LocalPlayer;
			v28.isMain = v29;
			v28.realPlayer = p8;
			v28.name = p8.Name;
			v28.thirdPerson = not v29;
			v28.gearFolder = l__Loadout__24:createGearFolder();
			v28.audioHandler = l__Audio__25.new(v28);
			v28.fxHandler = l__FX__26.new(v28);
			if v29 then
				v28.mapHandler = l__UI__27.newMap(u8, false);
				v28.audioHandler:loadWhizSounds();
				v28.audioHandler:loadRadioSounds();
			end;
			v28.audioHandler:loadEnviromentSounds();
			v28.audioHandler:loadCharacterSounds();
			v28.projectiles = {};
			v28.Health = 100;
			v28.BleedoutTimer = 120;
			v28.NoGoZoneTimer = 10;
			v28.inCrops = false;
			v28.faceInCrops = false;
			v28.DarkAmount = math.cos(l__Lighting__18.ClockTime / 3.819718634207) * 24;
			v28.suppressed = false;
			v28.suppressionValue = 0;
			v28.maxSuppressionValue = 4;
			v28.hurtEffectValue = 0;
			v28.tinnitusValue = 0;
			v28.rootCF = u28;
			v28.FloorMaterial = "Dirt";
			v28.groundMaterial = nil;
			v28.walkingSpeed = "Stopped";
			v28.grabbing = false;
			v28.reloading = false;
			v28.animating = false;
			v28.sprinting = false;
			v28.tacticalPacing = false;
			v28.equipping = false;
			v28.unequipping = false;
			v28.aiming = false;
			v28.usingBipod = false;
			v28.wasAiming = false;
			v28.nightvision = false;
			v28.laser = false;
			v28.laserPosition = u29;
			v28.ir = false;
			v28.flashlight = false;
			v28.flashlightPosition = u29;
			v28.mapShown = false;
			v28.inMainMenu = false;
			v28.viewingRearmMenu = false;
			v28.canViewRearmMenu = false;
			v28.isStaff = false;
			v28.chatType = 1;
			v28.onGround = true;
			v28.humanoid = nil;
			v28.weapon = nil;
			v28.auto = false;
			v28.bulletsDue = 0;
			v28.equipNumber = 0;
			v28.angleX = 0;
			v28.angleY = 0;
			v28.targetAngleX = 0;
			v28.targetAngleY = 0;
			v28.lastSuppresion = 0;
			v28.Layer = u9;
			v28.SoundGroup = u10;
			v28.BackgroundAudio = u11;
			v28.team = 0;
			v28.fireteam = {
				FireteamID = 0, 
				FireteamTeam = 0, 
				FireteamType = "", 
				FireteamName = ""
			};
			v28.class = u30;
			v28.stance = 0;
			v28.animationTime = 0;
			v28.weightMult = 1;
			v28.freeLookX = 0;
			v28.freeLookY = 0;
			v28.targetFreeLookX = 0;
			v28.targetFreeLookY = 0;
			v28.mainRotXZ = 0;
			v28.freeAimY = 0;
			v28.freeAimX = 0;
			v28.stamina = 60;
			v28.aimFOV = 1.5;
			v28.vibration = u29;
			v28.mainCF = u28;
			v28.freeLook = false;
			v28.walkSpeed = 8;
			v28.glActive = false;
			local v30 = l__SmoothValue__31.new(0);
			v30.r = 3.2;
			v28.aimSpring = v30;
			local v31 = l__SmoothValue__31.new(0);
			v31.r = 3.2;
			v28.nvAimSpring = v31;
			local v32 = l__SmoothValue__31.new(0);
			v32.r = 1.25;
			v28.glSpring = v32;
			local v33 = l__SmoothValue__31.new(0);
			v33.r = 1;
			v28.sprintSpring = v33;
			local v34 = l__SmoothValue__31.new(0);
			v34.r = 0.5;
			v28.equipSpring = v34;
			local v35 = l__SmoothValue__31.new(0);
			v35.r = 2;
			v28.tacPaceSpring = v35;
			local v36 = l__SmoothValue__31.new(0);
			v36.r = 15;
			v28.coverSpring = v36;
			local v37 = l__LerpedValue__32.new(0);
			v37.r = 5;
			v28.leanSpring = v37;
			local v38 = l__SmoothValue__31.new(0);
			v38.r = 1.5;
			v28.stanceSpring = v38;
			local v39 = l__LerpedValue__32.new(0);
			v39.r = 30;
			v28.bobSpring = v39;
			local v40 = l__LerpedValue__32.new(0);
			v40.r = 30;
			v28.speedSpring = v40;
			local v41 = l__Spring__33.new(u29);
			v41.s = 10;
			v41.d = 0.75;
			v28.swingSpring = v41;
			local v42 = l__Spring__33.new(0);
			v42.s = 12;
			v42.d = 0.7;
			v28.vibrationSpring = v42;
			local v43 = l__Spring__33.new(u29);
			v43.s = 12;
			v43.d = 0.7;
			v28.jumpOffsetSpring = v43;
			local v44 = l__Spring__33.new(u29);
			v44.s = 10;
			v44.d = 0.8;
			v28.walkOffsetSpring = v44;
			local v45 = l__Spring__33.new(u29);
			v45.s = 22;
			v45.d = 0.8;
			v28.recoilPos = v45;
			local v46 = l__Spring__33.new(u29);
			v46.s = 22;
			v46.d = 0.8;
			v28.recoilRot = v46;
			v28.Ticks.sendCharacter = os.clock();
			v28.Ticks.updateCharacter = os.clock();
			local v47 = l__SmoothValue__31.new(0);
			v47.r = 0.2;
			local u54 = {};
			local u55 = false;
			local u56 = "Ready";
			local u57 = false;
			local u58 = "Patrol";
			local u59 = false;
			local u60 = "Sprint";
			local u61 = false;
			local u62 = "Crouch";
			local u63 = false;
			local u64 = "Prone";
			local u65 = nil;
			local u66 = nil;
			local u67 = nil;
			local u68 = nil;
			local u69 = nil;
			local u70 = nil;
			local u71 = nil;
			local u72 = nil;
			local u73 = nil;
			local u74 = nil;
			local u75 = nil;
			local u76 = nil;
			local u77 = nil;
			local u78 = nil;
			local u79 = nil;
			local u80 = nil;
			local u81 = nil;
			local u82 = nil;
			local u83 = nil;
			local u84 = nil;
			local u85 = u28;
			local u86 = {};
			function v28.initializeCharacter(p9, p10)
				u65 = p10;
				p9.character = p10;
				u66 = p10:WaitForChild("Head");
				u67 = p10:WaitForChild("Torso");
				u68 = p10:WaitForChild("Left Arm");
				u69 = p10:WaitForChild("Right Arm");
				u70 = p10:WaitForChild("Left Leg");
				u71 = p10:WaitForChild("Right Leg");
				l__CollectionService__34:AddTag(u65, "WeaponCollisionIgnoreList");
				p9.usernameTag = u66.UsernameGui;
				p9.usernameTag.TextLabel.TextColor3 = p9.fireteam.FireteamID == u21.fireteam.FireteamID and u20 or u19;
				u72 = p10:WaitForChild("HumanoidRootPart", 30);
				if not u72 then
					return;
				end;
				u73 = u72.RootJoint;
				u73.C0 = v4.torso.C0;
				u73.C1 = v4.torso.C1;
				u73.Part0 = p10[v4.torso.part0];
				u74 = {
					C0 = u73.C0, 
					C1 = u73.C1
				};
				u54.torso = {
					part = u67, 
					weld = u74, 
					baseC0 = v4.torso.C0, 
					baseTransparency = 0
				};
				u75 = u67["Right Shoulder"];
				u75.C0 = v4.rightArm.C0;
				u75.C1 = v4.rightArm.C1;
				u75.Part0 = u72;
				u76 = {
					C0 = u75.C0, 
					C1 = u75.C1
				};
				u54.rightArm = {
					part = u69, 
					weld = u76, 
					baseC0 = v4.rightArm.C0, 
					baseTransparency = 0
				};
				p9.rightArmWeld = u76;
				u77 = u67["Left Shoulder"];
				u77.C0 = v4.leftArm.C0;
				u77.C1 = v4.leftArm.C1;
				u77.Part0 = u72;
				u78 = {
					C0 = u77.C0, 
					C1 = u77.C1
				};
				p9.leftArmWeld = u78;
				u54.leftArm = {
					part = u68, 
					weld = u78, 
					baseC0 = v4.leftArm.C0, 
					baseTransparency = 0
				};
				u79 = u67["Right Hip"];
				u79.C0 = v4.rightLeg.C0;
				u79.C1 = v4.rightLeg.C1;
				u79.Part0 = p10[v4.rightLeg.part0];
				u80 = {
					C0 = u79.C0, 
					C1 = u79.C1
				};
				u54.rightLeg = {
					part = u71, 
					weld = u80, 
					baseC0 = v4.rightLeg.C0, 
					baseTransparency = 0
				};
				u81 = u67["Left Hip"];
				u81.C0 = v4.leftLeg.C0;
				u81.C1 = v4.leftLeg.C1;
				u81.Part0 = p10[v4.leftLeg.part0];
				u82 = {
					C0 = u81.C0, 
					C1 = u81.C1
				};
				u54.leftLeg = {
					part = u70, 
					weld = u82, 
					baseC0 = v4.leftLeg.C0, 
					baseTransparency = 0
				};
				u83 = u67.Neck;
				u83.C0 = v4.head.C0;
				u83.C1 = v4.head.C1;
				u83.Part0 = p10[v4.head.part0];
				u84 = {
					C0 = u83.C0, 
					C1 = u83.C1
				};
				u54.head = {
					part = u66, 
					weld = u84, 
					baseC0 = v4.head.C0, 
					baseTransparency = 0
				};
				p9.humanoidRootPart = u72;
				p9.torso = u67;
				u85 = u72.CFrame;
				p9.rootCF = u85;
				local l__Humanoid__48 = u65:WaitForChild("Humanoid");
				l__Humanoid__48.BreakJointsOnDeath = false;
				l__Humanoid__48.AutoRotate = false;
				l__Humanoid__48.UseJumpPower = false;
				l__Humanoid__48.JumpHeight = 3;
				l__Humanoid__48.AutoJumpEnabled = false;
				l__Humanoid__48.HealthDisplayType = Enum.HumanoidHealthDisplayType.AlwaysOff;
				l__Humanoid__48.NameOcclusion = Enum.NameOcclusion.OccludeAll;
				l__Humanoid__48.DisplayDistanceType = Enum.HumanoidDisplayDistanceType.None;
				p9.humanoid = l__Humanoid__48;
				if v29 then
					p9.humanoid:SetStateEnabled(Enum.HumanoidStateType.Dead, false);
					if u86.FloorState then
						u86.FloorState:Disconnect();
					end;
					u86.FloorState = p9.humanoid.Running:Connect(function(p11)
						if math.round(p11) < 2 or p9.incapped then
							p9.walkingSpeed = "Stopped";
						elseif math.round(p11) >= 2 and math.round(p11) < 5 then
							p9.walkingSpeed = "Crawl";
						elseif math.round(p11) >= 5 and math.round(p11) < 7 then
							p9.walkingSpeed = "Creep";
						elseif math.round(p11) >= 7 and math.round(p11) < 12 then
							p9.walkingSpeed = "Walk";
						elseif math.round(p11) >= 12 and math.round(p11) < 15 then
							p9.walkingSpeed = "TacPace";
						elseif math.round(p11) >= 15 then
							p9.walkingSpeed = "Sprint";
						end;
						if p9.walkingSpeed ~= p9.walkingSpeed then
							p9.audioHandler:playFootstepSound(p9.groundMaterial, p9.walkingSpeed, p9.inCrops);
							l__Network__35:updateSendData("WalkingSpeed", p9.walkingSpeed);
						end;
					end);
					if u86.StateChanged then
						u86.StateChanged:Disconnect();
					end;
					u86.StateChanged = p9.humanoid.StateChanged:Connect(p9.jumpLandCheck);
					if p9.mapHandler.mapIcons[p9.name] then
						p9.mapHandler:removePlayerIcon(p9.name);
					end;
					if p9.menuMapHandler.mapIcons[p9.name] then
						p9.menuMapHandler:removePlayerIcon(p9.name);
						return;
					end;
				else
					p9.humanoid:SetStateEnabled(Enum.HumanoidStateType.FallingDown, false);
					p9.humanoid:SetStateEnabled(Enum.HumanoidStateType.Running, false);
					p9.humanoid:SetStateEnabled(Enum.HumanoidStateType.Climbing, false);
					p9.humanoid:SetStateEnabled(Enum.HumanoidStateType.Ragdoll, false);
					p9.humanoid:SetStateEnabled(Enum.HumanoidStateType.GettingUp, false);
					p9.humanoid:SetStateEnabled(Enum.HumanoidStateType.Jumping, false);
					p9.humanoid:SetStateEnabled(Enum.HumanoidStateType.Landed, false);
					p9.humanoid:SetStateEnabled(Enum.HumanoidStateType.Flying, false);
					p9.humanoid:SetStateEnabled(Enum.HumanoidStateType.Freefall, false);
					p9.humanoid:SetStateEnabled(Enum.HumanoidStateType.Seated, false);
					p9.humanoid:SetStateEnabled(Enum.HumanoidStateType.PlatformStanding, false);
					p9.humanoid:SetStateEnabled(Enum.HumanoidStateType.Dead, false);
					p9.humanoid:SetStateEnabled(Enum.HumanoidStateType.Swimming, false);
					p9.humanoid:SetStateEnabled(Enum.HumanoidStateType.Physics, true);
					p9.humanoid:ChangeState(Enum.HumanoidStateType.Physics);
				end;
			end;
			local u87 = false;
			function v28.ragdoll(p12, p13)
				if u87 == p13 then
					return;
				end;
				u87 = p13;
				if v29 and p13 then
					p12:setStance(0);
					p12:equip(0);
				end;
			end;
			function v28.loadCharacter(p14, p15, p16, p17, p18, p19, p20, p21, p22, p23, p24)
				p14:initializeCharacter(p15);
				p14:initializeLoadout(p16);
				p14.audioHandler:addSounds();
				p14.audioHandler:addCharacterSounds();
				p14.audioHandler:addEnviromentSounds();
				p14:equip(p17, p24);
				p14:setFiremode(p18);
				p14:setLaser(p19 == 1);
				p14:setFlashlight(p20 == 1);
				p14:setGLActive(p21 == 1);
				p14:setFire(p22 == 1);
				p14:toggleNightVision(p23 == 1);
				if p24 then
					p14:spawn();
				end;
			end;
			function v28.loadPlayer(p25, p26, p27, p28, p29, p30, p31, p32, p33, p34, p35, p36, p37, p38, p39, p40, p41, p42, p43, p44, p45, p46, p47, p48, p49, p50)
				p25.dead = false;
				p25.incapped = false;
				p25.audioHandler:clear();
				p25.fxHandler:clear();
				p25.character = nil;
				task.defer(function()
					p25:loadCharacter(u14:WaitForChild(p25.name, 30), p26, p31, p33, p34, p35, p37, p40, p36, p50);
				end);
				p25:changeHealth(p42);
				p25.BleedoutTimer = p43;
				p25.suppressed = false;
				p25.suppressionValue = 0;
				p25.tinnitusValue = 0;
				p25.hurtEffectValue = 0;
				p25:ragdoll(false);
				p25.reloading = false;
				p25.animating = false;
				p25.equipping = false;
				p25.sprinting = p29 > 0;
				p25.sprintSpring.t = p29;
				p25.tacticalPacing = p30 > 0;
				p25.tacPaceSpring.t = p30;
				p25.aiming = p28 > 0;
				p25.aimSpring.t = p28;
				p25.leanSpring.t = p41;
				p25.coverSpring.t = p32;
				p25.nvAimSpring.t = 0;
				p25.stance = p27;
				p25.stanceSpring.t = p27;
				p25.laser = false;
				p25.flashlight = false;
				p25.laserPosition = p45;
				p25.flashlightPosition = p46;
				p25.ir = false;
				p25.walkingSpeed = p47;
				p25.mapShown = false;
				p25.viewingRearmMenu = false;
				p25.canViewRearmMenu = false;
				p25.lastSuppresion = 0;
				p25.stamina = 60;
				p25.lastSupply = nil;
				p25.targetAngleX = p44;
				p25.targetFreeLookX = p48;
				p25.targetFreeLookY = p49;
				if p39 == 1 then
					p25:kill();
				end;
				if v29 then
					l__UI__27:resetNoGoZone();
					l__UI__27:dead(false);
					l__UI__27:incapped(false);
					l__UI__27:promptRadialMenuUse(false);
					l__UI__27:showRadialMenu(false);
					l__UI__27:fillStamina();
					p25:setIncapped(p38 == 1);
				end;
			end;
			local u88 = false;
			function v28.setIncapped(p51, p52, p53, p54)
				p51.incapped = p52;
				p51:ragdoll(p52);
				if v29 then
					l__UI__27:incapped(p52);
					p51.mapHandler:showMap(false);
					if p52 and u88 then
						p51:setFire(false);
					end;
					if not p52 and p53 then
						p51:setStance(2);
						p51:equip(1);
					end;
				end;
				if p52 then
					p51.audioHandler:onIncapped(p54);
				end;
			end;
			function v28.revive(p55, p56)
				if v29 then
					l__Network__35:sendData("Revive", p56);
				end;
			end;
			function v28.heal(p57, p58, p59)
				if v29 then
					l__Network__35:sendData("Heal", p58, p59);
				end;
			end;
			function v28.tookDamageFX(p60, p61, p62)
				p60.hurtEffectValue = p61;
				p60.vibrationSpring:add(p61);
				p60.audioHandler:onDamage(p62);
			end;
			local u89 = false;
			function v28.spawn(p63)
				u89 = true;
				p63:updateMapIcon();
				p63:updateCompassIcons();
			end;
			function v28.changeHealth(p64, p65)
				p64.Health = p65;
				if u66 then
					local l__Face__49 = u66:FindFirstChild("Face");
					if l__Face__49 then
						if p65 <= 25 then
							l__Face__49.Texture = "rbxassetid://8004773363";
							return;
						end;
						if p65 <= 50 then
							l__Face__49.Texture = "rbxassetid://8004712537";
							return;
						end;
						if p65 <= 75 then
							l__Face__49.Texture = "rbxassetid://8004710861";
							return;
						end;
						if p65 <= 100 then
							l__Face__49.Texture = "rbxassetid://8004772322";
						end;
					end;
				end;
			end;
			local u90 = false;
			function v28.kill(p66, p67)
				u89 = false;
				p66.dead = true;
				p66:ragdoll(true);
				u90 = false;
				if v29 then
					l__Menu__36.spawning = false;
					u21.mapHandler:clearPings();
					if u88 then
						p66:setFire(false);
					end;
					l__UI__27:dead(true);
					p66.audioHandler:onDeath(p67);
					p66.mapHandler:showMap(false);
					if p66.ammoBag then
						p66.ammoBag:requestDestroy();
					end;
					task.delay(5, function()
						l__Menu__36:SetMenuVisibility(true);
						l__UI__27:dead(false);
					end);
				end;
			end;
			function v28.reset(p68)
				if v29 and not p68.dead then
					l__Network__35:sendData("Reset");
				end;
			end;
			function v28.mapUIAASObjectivesUpdate(p69)
				if v29 then
					u21.mapHandler:updateObjectivesInPlay();
					u21.menuMapHandler:updateObjectivesInPlay();
				end;
			end;
			function v28.setGLActive(p70, p71)
				if p70.weapon and p70.weapon.glPossible then
					p70.glActive = p71;
					p70.weapon:setGLActive(p71);
					if v29 then
						l__Network__35:updateSendData("SetGL", p70.weapon.glActive);
					end;
				end;
			end;
			function v28.changeGLSegment(p72, p73)
				if p72.weapon then
					p72.weapon:changeGLSegment(p73);
				end;
			end;
			function v28.setThirdPerson(p74, p75)
				p74.thirdPerson = p75;
				u37(p74, u65, p75);
				local l__equipNumber__50 = p74.equipNumber;
				p74:loadPlayer(u65, p74.weapons);
				if l__equipNumber__50 > 0 then
					p74.weapons[l__equipNumber__50]:setEquip(true);
				end;
			end;
			function v28.initializeLoadout(p76, p77)
				if v29 and l__CurrentCamera__38:FindFirstChild("BuildablePlaceHolographic") then
					l__CurrentCamera__38.BuildablePlaceHolographic:Destroy();
				end;
				l__Loadout__24:loadWeapons(p76, p77);
				l__Loadout__24:loadGear(p76, u54, p76.thirdPerson);
				if v29 then
					l__UI__27:setupRadialMenuLoadout(p76.weapons);
				end;
			end;
			function v28.updateWalkSpeed(p78, p79)
				local v51 = nil;
				local l__stance__52 = p78.stance;
				if p78.weapon and p78.weapon.bipodMounted then
					local v53 = 0;
				elseif p78.aiming then
					v53 = 6;
				elseif p78.sprinting then
					v53 = 19;
				elseif p78.tacticalPacing then
					v53 = 13;
				else
					v53 = 8;
				end;
				if l__stance__52 == 2 then
					local v54 = 0.5;
				elseif l__stance__52 == 1 then
					v54 = 0.8;
				else
					v54 = 1;
				end;
				if p78.inCrops then
					local v55 = 0.75;
				else
					v55 = 1;
				end;
				v51 = v53 * v54 * v55;
				if not p78.humanoid then
					p78.walkSpeed = l__lerp__39(p78.walkSpeed, v51, p79 / 0.25);
					return;
				end;
				p78.humanoid.WalkSpeed = l__lerp__39(p78.humanoid.WalkSpeed, v51, p79 / 0.25);
			end;
			local l__Name__91 = p8.Name;
			function v28.updateMapIcon(p80)
				if p80.humanoidRootPart and p80.team == u21.team then
					u21.mapHandler:addPlayerIcon(l__Name__91);
					u21.menuMapHandler:addPlayerIcon(l__Name__91);
					return;
				end;
				u21.mapHandler:removePlayerIcon(l__Name__91);
				u21.menuMapHandler:removePlayerIcon(l__Name__91);
			end;
			function v28.updateCompassIcons(p81)
				if p81.humanoidRootPart and p81.team == u21.team then
					return;
				end;
			end;
			function v28.setTeam(p82, p83)
				p82.team = p83;
				p82.audioHandler:loadCharacterSpeechSounds();
				if v29 then
					p82:setClass(u30);
					for v56, v57 in pairs(l__PlayerList__22) do
						if v57.usernameTag then
							v57.usernameTag.TextLabel.TextColor3 = v57.fireteam.FireteamID == u21.fireteam.FireteamID and u20 or u19;
						end;
					end;
					l__Menu__36:switchTeams(p83);
					l__UI__27:switchTeamsGamemodeUI();
				else
					if p82.usernameTag then
						p82.usernameTag.TextLabel.TextColor3 = p82.fireteam.FireteamID == u21.fireteam.FireteamID and u20 or u19;
					end;
					l__Menu__36:UIupdateTeams();
				end;
				p82:updateMapIcon();
			end;
			function v28.setFireteam(p84, p85)
				local v58 = l__FireteamList__40.Fireteams[p85];
				p84.fireteamID = p85;
				if not v58 then
					return;
				end;
				local l__fireteam__59 = p84.fireteam;
				p84.fireteam = v58;
				if v29 then
					p84:setClass(u30);
					l__Menu__36:destroyViewportWeapon();
					for v60, v61 in pairs(l__PlayerList__22) do
						if v61.usernameTag then
							v61.usernameTag.TextLabel.TextColor3 = v61.fireteam.FireteamID == p85 and u20 or u19;
						end;
					end;
					l__Menu__36:unlockRolePanel(p85 == 0);
					p84.mapHandler:getMapMarkers();
				elseif p84.usernameTag then
					p84.usernameTag.TextLabel.TextColor3 = p85 == u21.fireteam.FireteamID and u20 or u19;
				end;
				if p85 ~= 0 then
					l__Menu__36:appendFireteam(v58);
				end;
				if v29 and l__fireteam__59.FireteamID ~= 0 then
					l__Menu__36:updateJoinLeaveButton(l__fireteam__59);
					l__Menu__36:updateFireteamMembers(l__fireteam__59);
				end;
				p84:updateMapIcon();
			end;
			function v28.setClass(p86, p87, p88)
				p86.class = p87;
				if v29 then
					local v62 = true;
					if p87.Role ~= "Medic" then
						v62 = p87.Role == "Corpsman";
					end;
					l__UI__27:revivePrompt(v62);
					local v63 = not p87.Role;
					if not v63 then
						v63 = true;
						if p87.Role ~= "Unassigned" then
							v63 = p87.RoleTeam == 0;
						end;
					end;
					l__Menu__36:unlockLoadoutPanel(v63, p88);
				end;
				if p86.fireteam.FireteamID ~= 0 then
					l__Menu__36:appendFireteam(p86.fireteam);
				end;
			end;
			function v28.changeChatType(p89, p90)
				p89.chatType = p90;
				if v29 then
					l__UI__27:changeChatType(p90);
					l__Audio__25:changeChatType();
				end;
			end;
			local u92 = false;
			local u93 = false;
			local function u94()
				for v64, v65 in pairs(l__PlayerList__22) do
					if v65.character and v65 ~= v28 and v65.fireteam.FireteamID == v28.fireteam.FireteamID and not v65.dead and not v65.incapped and (u85.Position - v65.rootCF.Position).Magnitude <= 20 then
						return true;
					end;
				end;
			end;
			local u95 = false;
			local function u96()
				for v66, v67 in pairs(l__PlayerList__22) do
					if v67.character and v67.team ~= v28.team and not v67.dead and not v67.incapped and (u85.Position - v67.rootCF.Position).Magnitude <= 45 then
						return true;
					end;
				end;
			end;
			local u97 = 60;
			function v28.initiatePlaceRally(p91)
				local v68 = nil;
				local v69 = l__NoRallyZones__41.grid:getObjects(u85.Position);
				if v69 then
					for v70, v71 in pairs(v69) do
						if l__Utility__2.isPositionAt2D(u85.Position, v71[1], v71[2]) and (not v68 or v68[3] < v71[3]) then
							v68 = v71;
						end;
					end;
				end;
				if not p91.inCrops then
					if v68 then
						if v68[4] and p91.team ~= v68[5] then
							u92 = true;
						else
							u92 = false;
						end;
					else
						u92 = true;
					end;
				else
					u92 = false;
				end;
				u93 = u94();
				u95 = u96();
				if u92 and u93 and not u95 and not u90 and not p91.incapped and not p91.dead then
					u90 = true;
					if v29 then
						local v72 = workspace:Raycast(u85.Position, u85.UpVector * -10, u12);
						if v72 then
							l__Network__35:sendData("BuildObject", p91.team, "Rally", l__ReplicatedStorage__7.Assets.Buildable["Team" .. p91.team][p91.fireteam.FireteamType].RallyPoint, CFrame.lookAt(v72.Position, v72.Position + v72.Normal), p91.fireteam.FireteamID);
						end;
					end;
					task.defer(function()
						while true do
							task.wait(1);
							u97 = u97 - 1;
							if u97 == 0 then
								break;
							end;						
						end;
						u90 = false;
						u97 = 60;
					end);
					return;
				end;
				if v29 then
					if not u92 then
						l__UI__27:AddNotification("Cannot place rally: Rally placing is prohibited here");
						return;
					end;
					if p91.incapped then
						l__UI__27:AddNotification("Cannot place rally: Incapacitated");
						return;
					end;
					if not u90 then
						if u95 then
							l__UI__27:AddNotification("Cannot place rally: Hostiles nearby");
							return;
						else
							if not u93 then
								l__UI__27:AddNotification("Cannot place rally: Need to be within 20 studs of a fireteam member");
							end;
							return;
						end;
					end;
				else
					return;
				end;
				l__UI__27:AddNotification("Cannot place rally: Rally placing on cooldown (" .. u97 .. ")");
			end;
			function v28.updateAmmoBagSupplies(p92, p93, p94)
				local v73 = l__BuildableObjectTables__42[p93];
				if not v73 then
					return;
				end;
				v73:updateSupplies(p94);
				l__UI__27:updateAmmoBagTableSupplies(p93, v73.Supplies);
			end;
			function v28.setStance(p95, p96)
				if p95.stanceSpring.t == p96 then
					return;
				end;
				p95.stance = p96;
				p95.stanceSpring.t = p96;
				p95.audioHandler:changeStance(p95.stanceSpring.t, p96);
				if v29 then
					if u67 and u66 then
						if p96 == 1 or p96 == 2 then
							l__PhysicsService__43:SetPartCollisionGroup(u67, "Noninteract");
						else
							l__PhysicsService__43:SetPartCollisionGroup(u67, "Players");
						end;
					end;
					if p95.tacticalPacing and p96 == 2 then
						p95:setTacPace(false);
					end;
					l__Network__35:updateSendData("Stance", p96);
				end;
			end;
			function v28.setAim(p97, p98)
				if not (not p97.reloading) or p97.weapon == nil or not (not p97.animating) or p97.weapon and (p97.weapon.weaponCoverAmountTriggered or p97.weapon.aimingDisabled) then
					p98 = false;
				end;
				if not p97.nightvision then
					if p98 then
						local v74 = 1;
					else
						v74 = 0;
					end;
					local v75 = v74;
				elseif p97.weapon and p97.weapon.hasNVAim then
					if p98 then
						local v76 = 1;
					else
						v76 = 0;
					end;
					v75 = v76;
				else
					v75 = 0;
				end;
				if p98 then
					p98 = v75 == 1;
				end;
				p97.aiming = p98;
				if p97.weapon then
					v30.r = 3.2 * (9.8 / math.clamp(p97.weapon.weight, 9.8, 40));
				end;
				v30.t = v75;
				if p97.aiming then
					local v77 = 0;
				elseif p97.tacticalPacing then
					v77 = 1;
				else
					v77 = 0;
				end;
				v35.t = v77;
				if v29 then
					l__Network__35:updateSendData("Aim", v75);
					if not p97.aiming and not p97.sprinting and p97.Keys.LeftShift then
						p97:setSprint(true);
					elseif p97.aiming then
						p97:setSprint(false);
					end;
				end;
				if p97.weapon then
					p97.weapon:setAim(p97.aiming);
				end;
			end;
			function v28.toggleAltAim(p99)
				if p99.weapon then
					p99.weapon:toggleAltAim();
				end;
			end;
			function v28.toggleMagnifier(p100)
				if p100.weapon then
					p100.weapon:toggleMagnifier();
				end;
			end;
			function v28.toggleBipod(p101)
				if p101.weapon and p101.weapon.hasBipod then
					if p101.usingBipod then
						p101.weapon:toggleBipod(false);
						p101.usingBipod = false;
						return;
					end;
				else
					return;
				end;
				p101.weapon:toggleBipod(true);
				p101.usingBipod = true;
			end;
			function v28.setLean(p102, p103)
				if p102.leanSpring.t == p103 then
					return;
				end;
				p102.leanSpring.t = p103;
				p102.audioHandler:changeLean();
				if v29 then
					l__Network__35:updateSendData("Lean", p103);
				end;
			end;
			function v28.setSprint(p104, p105)
				if p104.stamina > 0 and p105 then
					p104.sprinting = true;
					p104.sprintSpring.t = 1;
					if v29 then
						l__Network__35:updateSendData("Sprint", 1);
						p104:setStance(0);
						if p104.aiming then
							p104:setAim(false);
							return;
						end;
					end;
				elseif p104.sprinting then
					p104.sprinting = false;
					p104.sprintSpring.t = 0;
					if v29 then
						l__Network__35:updateSendData("Sprint", 0);
						if p104.Keys.MouseButton2 and p104.weapon then
							p104:setAim(true);
						end;
					end;
				end;
			end;
			local u98 = v38.p;
			function v28.setTacPace(p106, p107)
				if p106.weapon == nil or u98 > 1 then
					return;
				end;
				if p107 then
					local v78 = 1;
				else
					v78 = 0;
				end;
				p106.tacticalPacing = p107;
				p106.tacPaceSpring.t = v78;
				if v29 then
					l__Network__35:updateSendData("TacPace", v78);
				end;
			end;
			function v28.reload(p108)
				if p108.weapon then
					p108.weapon:reload();
				end;
			end;
			function v28.setFire(p109, p110)
				if p109.weapon then
					u88 = p110;
					p109.weapon:setFire(p110 and (u89 and not p109.equipping));
				end;
			end;
			function v28.nextFiremode(p111)
				if p111.weapon then
					p111.weapon:nextFiremode();
				end;
			end;
			function v28.setFiremode(p112, p113)
				if p112.weapon then
					p112.weapon:setFiremode(p113);
				end;
			end;
			function v28.equip(p114, p115, p116)
				local v79 = p114.weapons[p115];
				if not v29 then
					if v79 then
						p114.laser = false;
						p114:setLaser(false);
						p114.flashlight = false;
						p114:setFlashlight(false);
						v79:setEquip(true);
						p114.equipNumber = p115;
					else
						if p114.weapon then
							p114.weapon:setEquip(false);
						end;
						p114.equipNumber = 0;
					end;
					if p116 then
						p114.weapon = v79;
					end;
					return;
				end;
				if p114.equipping or p114.unequipping then
					return;
				end;
				local v80 = v79 and v79:canEquip();
				if p114.equipNumber ~= p115 and v80 then
					p114.laser = false;
					p114:setLaser(false);
					p114.flashlight = false;
					p114:setFlashlight(false);
					v79:setEquip(true);
					p114.equipNumber = p115;
					if v29 then
						l__Network__35:updateSendData("Equip", p115);
						return;
					end;
				elseif p114.equipNumber ~= 0 and not v80 then
					if p114.weapon then
						p114.weapon:setEquip(false);
					end;
					p114.equipNumber = 0;
					if v29 then
						l__Network__35:updateSendData("Equip", 0);
					end;
				end;
			end;
			function v28.toggleNightVision(p117, p118, p119)
				if v29 then
					if p118 then
						local v81 = 4.8;
					else
						v81 = 0;
					end;
					l__Lighting__18.ExposureCompensation = v81;
					l__Lighting__18.NV_ColorCorrection.Enabled = p118;
					l__Lighting__18.NV_Bloom.Enabled = p118;
					l__Lighting__18.NV_DoF.Enabled = p119 and p118 or false;
					l__UI__27:showNightVision(p118);
					p117.audioHandler:toggleNightVision();
					u15.BackgroundColor3 = p118 and u17 or u44;
					u16.BackgroundColor3 = p118 and u17 or u45;
					l__Network__35:updateSendData("NV", p118);
				elseif p117.NightVisionOn then
					if p118 then
						for v82, v83 in pairs(p117.NightVisionOn) do
							v83.Transparency = 0;
						end;
						for v84, v85 in pairs(p117.NightVisionOff) do
							v85.Transparency = 1;
						end;
					else
						for v86, v87 in pairs(p117.NightVisionOn) do
							v87.Transparency = 1;
						end;
						for v88, v89 in pairs(p117.NightVisionOff) do
							v89.Transparency = 0;
						end;
					end;
				end;
				p117.nightvision = p118;
				if p118 then
					local v90 = 1;
				else
					v90 = 0;
				end;
				v31.t = v90;
				for v91, v92 in pairs(p117.weapons) do
					v92:setNV(p117.aiming, p118);
				end;
				if p117.weapon then
					p117.weapon:setNVAim(p117.aiming, p118);
				end;
			end;
			function v28.setWeaponMuzzleFlash(p120, p121)
				if p120.weapon then
					p120.weapon.showMuzzleFlash = p121;
				end;
			end;
			function v28.setLaser(p122, p123)
				p122.laser = p123;
				if p122.weapon then
					p122.weapon:setLaser(p123);
					if v29 then
						l__Network__35:updateSendData("Laser", p123);
					end;
				end;
			end;
			function v28.setFlashlight(p124, p125)
				p124.flashlight = p125;
				if p124.weapon then
					p124.weapon:setFlashlight(p125);
					if v29 then
						l__Network__35:updateSendData("Flashlight", p125);
					end;
				end;
			end;
			function v28.setPostProcessEffect(p126, p127, p128)
				game.Lighting[p127].Enabled = p128;
			end;
			function v28.updateGraphicSettings(p129, p130)
				for v93, v94 in pairs(p130) do
					if game.Lighting:FindFirstChild(v93) then
						game.Lighting[v93].Enabled = v94;
					end;
				end;
			end;
			function v28.jumpLandCheck(p131, p132)
				if p132 == Enum.HumanoidStateType.Jumping then
					v28.onGround = false;
					v28.audioHandler:onJump(v28.groundMaterial);
					l__Network__35:sendData("Jump", v28.groundMaterial);
					v43:add(5 * Vector3.new(-0.12217304763960307, 0.08726646259971647 * ((math.random(0, 1) - 0.5) * 2), 0.20943951023931956 * ((math.random(0, 1) - 0.5) * 2)));
					return;
				end;
				if p132 ~= Enum.HumanoidStateType.Landed then
					if p132 == Enum.HumanoidStateType.Climbing then
						v28.onGround = false;
						return;
					else
						if p131 == Enum.HumanoidStateType.Climbing then
							v28.onGround = true;
						end;
						return;
					end;
				end;
				v28.onGround = true;
				if v29 then
					local v95 = workspace:Raycast(u85.Position, u85.UpVector * -10, u12);
					if v95 then
						v28.audioHandler:onLand(l__MaterialsTable__46[v95.Material.Name]);
						l__Network__35:sendData("Land", l__MaterialsTable__46[v95.Material.Name]);
					end;
				end;
				v43:add(5 * Vector3.new(-0.2617993877991494, 0.06981317007977318 * ((math.random(0, 1) - 0.5) * 2), 0.20943951023931956 * ((math.random(0, 1) - 0.5) * 2)));
			end;
			local u99 = os.clock();
			function v28.update(p133, p134, p135, p136)
				if u65 then
					local v96 = p134 - u99;
					p133:updateValues(p134, v96, p136);
					if p136 then
						u99 = p134;
						p133:updateRig(v96);
					else
						u85 = u72.CFrame;
						p133.rootCF = u85;
					end;
					if v29 and u89 then
						p133:updateCamera();
						p133:updateMap();
						l__Physics__47.update();
					end;
					if p133.weapon then
						p133.weapon:updateMain(p134, p135);
						if p136 then
							p133.weapon:updateRig(p134, v96);
						end;
						p133.weapon:updateLaser(p135);
						p133.weapon:updateFlashlight(p135);
					end;
					p133.mainSchedule:update();
				end;
			end;
			local u100 = false;
			function v28.holdingBCheck(p137, p138)
				u100 = p138;
			end;
			local u101 = v39.p;
			local u102 = 0;
			local u103 = v30.p;
			local u104 = v46.p;
			local u105 = 0;
			local u106 = v35.p;
			local u107 = v33.p;
			local u108 = v34.p;
			local u109 = v36.p;
			function v28.updateCamera(p139)
				local l__vibration__97 = p139.vibration;
				local l__animationTime__98 = p139.animationTime;
				local l__thirdPerson__99 = p139.thirdPerson;
				local v100 = CFrame.new(u66.Position);
				local v101 = CFrame.new(math.sin(l__animationTime__98) * u101, math.cos(l__animationTime__98 * 2) * u101, 0);
				local v102 = u102 + l__vibration__97.Y * l__lerp__39(1.5, 0.65, u103) - u104.Y * l__lerp__39(0.3, 0.2, u103);
				local v103 = u105 + l__vibration__97.X * l__lerp__39(1, 0.4, u103) - u104.X * l__lerp__39(0.4, 0.25, u103) + math.sin(l__animationTime__98 * 2) * u101 * 0.1;
				local v104 = -math.sin(l__animationTime__98 * 1.2) * u101 * 0.04 - 0 + u104.Z * 3 + l__vibration__97.Z * 7.6 + math.sin(l__animationTime__98 * 2) * u101 * 0.02;
				p139.mainRotXZ = CFrame.Angles(v103, 0, v104);
				p139.mainCF = v100 * CFrame.Angles(0, v102, 0) * v101 * CFrame.Angles(v103, 0, v104) * CFrame.new(0, 0.26, -0.485);
				if l__thirdPerson__99 then
					local v105 = 2;
				else
					v105 = 0;
				end;
				if l__thirdPerson__99 then
					local v106 = 4;
				else
					v106 = -0.485;
				end;
				l__CurrentCamera__38.CFrame = v100 * CFrame.Angles(0, v102 + math.rad(p139.freeLookY), 0) * v101 * CFrame.Angles(v103 + math.rad(p139.freeLookX), 0, v104) * CFrame.new(v105, 0.26, v106);
				l__CurrentCamera__38.FieldOfView = l__lerp__39(l__lerp__39(l__lerp__39(l__lerp__39(l__lerp__39(85, 88, u106), 91, u107), 85 / p139.aimFOV, u103 * (1 - u108)), 85, 1 - (1 - u108) ^ 5), 85, u109);
			end;
			function v28.updateMap(p140)
				if u21.mapHandler then
					u21.mapHandler:update();
				end;
			end;
			local u110 = 0;
			local u111 = 0;
			local u112 = 0;
			local u113 = v37.p;
			local u114 = v32.p;
			local u115 = 0;
			local u116 = 0;
			local u117 = 0;
			local u118 = v40.p;
			local u119 = 0;
			local u120 = v28.angleX;
			local u121 = v28.angleY;
			local u122 = 1;
			function v28.updateValues(p141, p142, p143, p144)
				if not u72 then
					return;
				end;
				if v29 then
					u105 = p141.angleX;
					u102 = p141.angleY;
					u110 = p141.freeLookX;
					u111 = p141.freeLookY;
					u85 = CFrame.new(u72.CFrame.Position) * CFrame.Angles(0, p141.angleY, 0);
					u72.CFrame = u85;
					l__Network__35:updateSendData("AngleX", u105);
					l__Network__35:updateSendData("FreeLookX", u110);
					l__Network__35:updateSendData("FreeLookY", u111);
					if p141.FloorMaterial ~= p141.humanoid.FloorMaterial.Name then
						p141.FloorMaterial = p141.humanoid.FloorMaterial.Name;
						l__Network__35:sendData("FloorMaterial", p141.humanoid.FloorMaterial.Name);
					end;
					local v107 = nil;
					local v108 = l__NoRallyZones__41.grid:getObjects(u85.Position);
					if v108 then
						for v109, v110 in pairs(v108) do
							if l__Utility__2.isPositionAt2D(u85.Position, v110[1], v110[2]) and (not v107 or v107[3] < v110[3]) then
								v107 = v110;
							end;
						end;
					end;
					if v107 and not p141.dead then
						if v107[4] and p141.team ~= v107[5] then
							if not u92 then
								l__UI__27:noGoZone(false);
								p141.NoGoZoneTimer = 10;
								u92 = true;
							end;
						else
							if u92 then
								l__UI__27:noGoZone(true);
								u92 = false;
							end;
							if p142 - u112 > 1 then
								u112 = os.clock();
								p141.NoGoZoneTimer = p141.NoGoZoneTimer - 1;
								if p141.NoGoZoneTimer == 0 then
									l__Network__35:sendData("Reset");
								end;
							end;
						end;
					elseif not u92 then
						l__UI__27:noGoZone(false);
						p141.NoGoZoneTimer = 10;
						u92 = true;
					end;
					local v111 = nil;
					local v112 = l__CropZones__48.grid:getObjects(l__CurrentCamera__38.CFrame.Position);
					if v112 then
						for v113, v114 in pairs(v112) do
							if l__Utility__2.isPositionAt(l__CurrentCamera__38.CFrame.Position, v114[1], v114[2]) and (not v111 or v111[3] < v114[3]) then
								v111 = v114;
							end;
						end;
					end;
					if v111 and not p141.faceInCrops then
						p141.faceInCrops = true;
						l__UI__27:coverScreen(true, v111[4] or u49);
					elseif not v111 and p141.faceInCrops then
						p141.faceInCrops = false;
						l__UI__27:coverScreen(false);
					end;
				elseif p144 then
					u105 = l__lerp__39(p141.angleX, p141.targetAngleX, math.clamp(p143 / 0.17, 0, 1));
					u102 = l__lerp__39(p141.angleY, p141.targetAngleY, math.clamp(p143 / 0.17, 0, 1));
					p141.angleX = u105;
					p141.angleY = u102;
					u110 = l__lerp__39(p141.freeLookX, p141.targetFreeLookX, math.clamp(p143 / 0.17, 0, 1));
					u111 = l__lerp__39(p141.freeLookY, p141.targetFreeLookY, math.clamp(p143 / 0.17, 0, 1));
					p141.freeLookX = u110;
					p141.freeLookY = u111;
					u85 = u72.CFrame;
				end;
				p141.rootCF = u85;
				local v115 = nil;
				local v116 = l__Audio__25.grid:getObjects(u85.Position);
				if v116 then
					for v117, v118 in pairs(v116) do
						if l__Utility__2.isPositionAt(u85.Position, v118[1], v118[2]) and (not v115 or v115[3] < v118[3]) then
							v115 = v118;
						end;
					end;
				end;
				local v119 = nil;
				local v120 = l__CropZones__48.grid:getObjects(u85.Position + u50);
				if v120 then
					for v121, v122 in pairs(v120) do
						if l__Utility__2.isPositionAt(u85.Position + u50, v122[1], v122[2]) and (not v119 or v119[3] < v122[3]) then
							v119 = v122;
						end;
					end;
				end;
				if p141.humanoid then
					if v119 and not p141.inCrops then
						p141.inCrops = true;
					elseif not v119 and p141.inCrops then
						p141.inCrops = false;
					end;
					local v123 = p141.SoundGroup ~= (v115 and v115[5] or "Standard");
					local v124 = p141.groundMaterial ~= l__MaterialsTable__46[p141.FloorMaterial];
					if not (not v123) or not (not v124) or p141.inCrops ~= p141.inCrops then
						if v123 then
							if v115 then
								p141.SoundGroup = v115[5];
							else
								p141.SoundGroup = "Standard";
							end;
						end;
						if v124 then
							p141.groundMaterial = l__MaterialsTable__46[p141.FloorMaterial];
						end;
						p141.audioHandler:playFootstepSound(p141.groundMaterial, p141.walkingSpeed, p141.inCrops);
					end;
				end;
				local v125 = v115 and v115[4] or u9;
				if p141.Layer ~= v125 then
					p141.audioHandler:changeGunEnvLayer(v125);
				end;
				if v115 then
					p141.Layer = v115[4];
					p141.BackgroundAudio = v115[6];
				else
					p141.Layer = u9;
					p141.BackgroundAudio = u11;
				end;
				if v29 or p144 then
					local v126 = u85:VectorToObjectSpace(u72.AssemblyLinearVelocity);
					u103 = v30.p;
					u107 = v33.p;
					u113 = v37.p;
					u106 = v35.p;
					u108 = v34.p;
					u98 = v38.p;
					u104 = v46.p;
					u109 = v36.p;
					u114 = v32.p;
					if u107 > 0.1 then
						if p142 - u115 > 1 and p141.stamina > 0 then
							p141.stamina = p141.stamina - 1;
							u115 = os.clock();
							u116 = os.clock();
							p141.audioHandler:updateStaminaSound(p141.stamina / 60);
							if v29 then
								l__UI__27:updateStamina(p141.stamina + 1, true);
								if p141.stamina == 0 then
									p141:setSprint(false);
								end;
							end;
						end;
					elseif p142 - u116 > 2.5 and p142 - u115 > 0.75 and p141.stamina < 60 then
						p141.stamina = p141.stamina + 1;
						u115 = os.clock();
						if p141.stamina == 10 and p142 - u116 > 5 then
							p141.audioHandler:recoverBreath();
							u117 = os.clock();
						elseif p142 - u117 > 8 then
							p141.audioHandler:updateStaminaSound(p141.stamina / 60);
						end;
						if v29 then
							l__UI__27:updateStamina(p141.stamina, false);
						end;
					end;
					local l__Z__127 = v126.Z;
					local l__X__128 = v126.X;
					v40.t = Vector3.new(l__X__128, 0, l__Z__127).Magnitude;
					u118 = v40.p;
					u119 = l__lerp__39(u119, math.atan2(l__Z__127 > 0 and l__X__128 or -l__X__128, math.abs(l__Z__127)), p143 / 0.15);
					local v129 = u118 * 1.3 / 16;
					p141.animationTime = p141.animationTime + v129 * 6.981317007977318 * p143;
					if not p141.thirdPerson then
						v39.t = v129 * l__lerp__39(l__lerp__39(l__lerp__39(0.01, 0.015, u106), 0.02, u107), 0.002, u103) * p141.weightMult;
						u101 = v39.p;
						u120 = u105;
						u121 = u102;
						v41.t = Vector3.new(-math.min(math.max((u105 - u120) / p143, -18), 18), -math.min(math.max((u102 - u121) / p143, -18), 18), 0);
						p141.vibration = Vector3.new(math.noise((p142 - u51) * 10), math.noise((p142 - u51) * 10 + 22.5), math.noise((p142 - u51) * 10 + 63.726)) * v42.p;
						local v130 = 1 - math.min(1, u103 + u107 + u106 + u114);
						if v130 < 0.999 then
							p141.freeAimY = p141.freeAimY * v130;
							p141.freeAimX = p141.freeAimX * v130;
						end;
						v44.t = Vector3.new(0, 0.03490658503988659, 0.13962634015954636) * -v126.X / 16;
						u122 = l__Lighting__18.ClockTime;
						p141.DarkAmount = math.cos(u122 / 3.819718634207) * 24;
					end;
				end;
				p141:updateWalkSpeed(p143);
			end;
			v28.canInteractWithPatient = false;
			local u123 = nil;
			local u124 = false;
			local u125 = 7;
			function v28.attemptRevive(p145)
				if not u123 or not u123.incapped or u123.dead then
					return;
				end;
				task.defer(function()
					if not u124 then
						u124 = true;
						u125 = 7;
						l__UI__27:showReviveBar(true);
						while true do
							if u100 then
								l__UI__27:reviveTimerProgress(1 / u125 and 1);
								u125 = u125 - 1;
							end;
							task.wait(1);
							if not u100 then
								break;
							end;
							if u125 == 0 then
								break;
							end;
							if not u123 then
								break;
							end;
							if u123.dead then
								break;
							end;						
						end;
						l__UI__27:reviveTimerReset();
						l__UI__27:showReviveBar(false);
						if u100 and u125 == 0 and u123 then
							p145:revive(u123.character);
						end;
						u125 = 7;
						u124 = false;
					end;
				end);
			end;
			v28.leanMultiplier = 1;
			local v131 = RaycastParams.new();
			v131.CollisionGroup = "Interactable";
			local function u126(p146)
				if p146 > 0 then
					u55 = p146 >= 1;
					local v132, v133, v134 = pairs(u2[u56]);
					while true do
						local v135, v136 = v132(v133, v134);
						if not v135 then
							break;
						end;
						local l__weld__137 = u54[v135].weld;
						l__weld__137.C0 = u55 and v136.C0 or l__weld__137.C0:Lerp(v136.C0, p146);
						l__weld__137.C1 = u55 and v136.C1 or l__weld__137.C1:Lerp(v136.C1, p146);					
					end;
				end;
			end;
			local function u127(p147)
				if p147 > 0 then
					u57 = p147 >= 1;
					local v138, v139, v140 = pairs(u2[u58]);
					while true do
						local v141, v142 = v138(v139, v140);
						if not v141 then
							break;
						end;
						local l__weld__143 = u54[v141].weld;
						l__weld__143.C0 = u57 and v142.C0 or l__weld__143.C0:Lerp(v142.C0, p147);
						l__weld__143.C1 = u57 and v142.C1 or l__weld__143.C1:Lerp(v142.C1, p147);					
					end;
				end;
			end;
			local function u128(p148)
				if p148 > 0 then
					u59 = p148 >= 1;
					local v144, v145, v146 = pairs(u2[u60]);
					while true do
						local v147, v148 = v144(v145, v146);
						if not v147 then
							break;
						end;
						local l__weld__149 = u54[v147].weld;
						l__weld__149.C0 = u59 and v148.C0 or l__weld__149.C0:Lerp(v148.C0, p148);
						l__weld__149.C1 = u59 and v148.C1 or l__weld__149.C1:Lerp(v148.C1, p148);					
					end;
				end;
			end;
			local function u129(p149)
				if p149 > 0 then
					u61 = p149 >= 1;
					local v150, v151, v152 = pairs(u2[u62]);
					while true do
						local v153, v154 = v150(v151, v152);
						if not v153 then
							break;
						end;
						local l__weld__155 = u54[v153].weld;
						l__weld__155.C0 = u61 and v154.C0 or l__weld__155.C0:Lerp(v154.C0, p149);
						l__weld__155.C1 = u61 and v154.C1 or l__weld__155.C1:Lerp(v154.C1, p149);					
					end;
				end;
			end;
			local function u130(p150)
				if p150 > 0 then
					u63 = p150 >= 1;
					local v156, v157, v158 = pairs(u2[u64]);
					while true do
						local v159, v160 = v156(v157, v158);
						if not v159 then
							break;
						end;
						local l__weld__161 = u54[v159].weld;
						l__weld__161.C0 = u63 and v160.C0 or l__weld__161.C0:Lerp(v160.C0, p150);
						l__weld__161.C1 = u63 and v160.C1 or l__weld__161.C1:Lerp(v160.C1, p150);					
					end;
				end;
			end;
			local u131 = nil;
			function v28.updateRig(p151)
				local v162 = nil;
				if p151.weapon then
					local v163 = 0;
				else
					v163 = 1;
				end;
				if v163 ~= v47.t then
					v47.t = v163;
					v47.p = 1 - v163;
				end;
				local l__p__164 = v47.p;
				local v165 = math.clamp(2 - u98, 0, 1);
				local v166 = math.clamp(1 - u107 * 2, 0, 1);
				local v167 = u98 * v165;
				local v168 = math.clamp(u98 - 1, 0, 1);
				p151.leanMultiplier = 1 + v167 - v168 * (0.5 + v167);
				local v169 = 1 - (1 - u107);
				local v170 = math.clamp(u105, -4 * v165, 4);
				u126(1 - math.min(u108 + u98 + u107, 1));
				local v171 = math.sin(p151.animationTime * 1.5) * 0.4363323129985824 * u118 / 16;
				local v172 = math.sin(p151.animationTime * 1.5 - math.pi) * 0.4363323129985824 * u118 / 16;
				local v173 = CFrame.Angles(0, u119, 0);
				local v174 = CFrame.Angles(0, -u119, 0);
				local v175 = CFrame.Angles(0, 0, u113 * (-0.3490658503988659 * p151.leanMultiplier));
				local v176 = CFrame.Angles(0, 0, -u113 * (-0.3490658503988659 * p151.leanMultiplier));
				local v177 = CFrame.Angles(-v170 * l__smoothLerp__52(0.6, 0.2, v169), 0, 0) * v176;
				if l__p__164 > 0 then
					u127(l__p__164);
				end;
				if u107 > 0 then
					u128(u107);
				end;
				if v167 > 0 then
					u129(v167 * v166);
				end;
				if v168 > 0 then
					u130(v168 * v166);
				end;
				v162 = CFrame.new(0, -1, 0) * CFrame.new(u113 * 1.25, 0, 0) * CFrame.Angles(v170 * l__smoothLerp__52(0.6, 0.2, v169), 0, u113 * (-0.3490658503988659 * p151.leanMultiplier)) * CFrame.new(0, 1, 0);
				if v29 then
					u73.C0 = u74.C0 * v162;
				else
					u73.C0 = u74.C0;
					u73.Transform = v162;
				end;
				u73.C1 = u74.C1;
				if v29 then
					p151.humanoid.HipHeight = 0 - (1 * v168 + 1 * v167 * v165) * v166;
					local l__Position__178 = l__CurrentCamera__38.CFrame.Position;
					local l__LookVector__179 = l__CurrentCamera__38.CFrame.LookVector;
					if not p151.incapped and not p151.dead then
						u131 = workspace:Raycast(l__Position__178, l__LookVector__179 * 10, v17);
						if u131 then
							u123 = l__PlayerList__22[u131.Instance.Name];
							if u123 then
								local v180 = u123.incapped;
								if v180 then
									v180 = false;
									if u123.team == p151.team then
										v180 = not u123.dead;
									end;
								end;
								l__UI__27:medicalPrompt(v180);
							else
								l__UI__27:medicalPrompt(false);
							end;
						else
							l__UI__27:medicalPrompt(false);
						end;
					else
						u123 = nil;
					end;
					local v181 = workspace:Raycast(l__Position__178, l__LookVector__179 * 10, v131);
					local v182 = v181 and l__BuildableObjectTables__42[tonumber(v181.Instance.Name)];
					if not p151.canViewRearmMenu and v182 and v182.Team == p151.team then
						p151.canViewRearmMenu = true;
						l__UI__27:promptRadialMenuUse(true);
						l__UI__27:updateAmmoBagTable(l__BuildableObjectTables__42[tonumber(v181.Instance.Name)]);
					elseif p151.canViewRearmMenu and (not v182 or v182.Team ~= p151.team) then
						p151.canViewRearmMenu = false;
						l__UI__27:promptRadialMenuUse(false);
						l__UI__27:showRadialMenu(false);
					end;
				end;
				if p151.weapon and p151.weapon.model then
					local v183 = v175 * l__fromAxisAngle__53(u105 * l__smoothLerp__52(l__smoothLerp__52(0.4, 0.8, v169), 1, 0) + math.rad(u110), math.rad(u111), -u103 * 0.17453292519943295) * v176;
				else
					v183 = v175 * l__fromAxisAngle__53(u105 * l__smoothLerp__52(l__smoothLerp__52(0.4, 0.8, v169), 1, 0) + math.rad(u110), math.rad(u111), 0) * v176;
				end;
				if v29 then
					u83.C0 = u84.C0 * v183;
				else
					u83.C0 = u84.C0;
					u83.Transform = v183;
				end;
				u83.C1 = u84.C1;
				local v184 = v173 * CFrame.Angles(v171 * v165, 0, 0) * CFrame.new(0, 0, v171 * v168) * v174;
				local v185 = v173 * CFrame.Angles(v172 * v165, 0, 0) * CFrame.new(0, 0, v172 * v168) * v174;
				if v29 then
					u79.C0 = u80.C0 * v177 * v184;
					u81.C0 = u82.C0 * v177 * v185;
				else
					u81.C0 = u82.C0;
					u79.C0 = u80.C0;
					u81.Transform = v177 * v185;
					u79.Transform = v177 * v184;
				end;
				u79.C1 = u80.C1;
				u81.C1 = u82.C1;
				if not p151.weapon then
					local v186 = nil;
					v186 = u85:Inverse() * u67.CFrame;
					if v29 then
						u77.C0 = u77.C0:Lerp(v186 * u78.C0 * v185, l__p__164);
						u75.C0 = u75.C0:Lerp(v186 * u76.C0 * v184, l__p__164);
					else
						u77.C0 = u77.C0:Lerp(v186 * u78.C0, l__p__164);
						u75.C0 = u75.C0:Lerp(v186 * u76.C0, l__p__164);
						u77.Transform = u77.Transform:Lerp(v185, l__p__164);
						u75.Transform = u75.Transform:Lerp(v184, l__p__164);
					end;
					u77.C1 = u77.C1:Lerp(u78.C1, l__p__164);
					u75.C1 = u75.C1:Lerp(u76.C1, l__p__164);
				end;
			end;
			function v28.Destroy(p152)
				if not p152.playerUpdateConnection then
					return;
				end;
				p152.playerUpdateConnection();
				if u21.mapHandler and u21.mapHandler.mapIcons[p152.name] then
					u21.mapHandler:removePlayerIcon(p152.name);
				end;
				if u21.menuMapHandler and u21.menuMapHandler.mapIcons[p152.name] then
					u21.menuMapHandler:removePlayerIcon(p152.name);
				end;
				p152:setTeam(0);
				for v187, v188 in pairs(p152.weapons) do
					v188:Destroy();
				end;
				p152.audioHandler:Destroy();
				p152.fxHandler:clear();
				p152.gearFolder:Destroy();
			end;
			return v28;
		end;
	end
};
return u1;
