-- Decompiled with the Synapse X Luau decompiler.

local u1 = {
	initialize = function(p1)
		local l__Utility__1 = p1.Utility;
		local l__Mathf__2 = l__Utility__1.Mathf;
		local l__Cframe__3 = l__Utility__1.Cframe;
		local l__Lighting__4 = game:GetService("Lighting");
		local l__TweenService__5 = game:GetService("TweenService");
		local l__ReplicatedStorage__6 = game:GetService("ReplicatedStorage");
		local l__CollectionService__7 = game:GetService("CollectionService");
		local v8 = os.clock();
		local v9 = NumberSequence.new(0);
		local v10 = NumberSequence.new(1);
		local v11 = Vector3.new();
		local v12 = CFrame.new();
		local v13 = TweenInfo.new(0.25);
		local l__fromAxisAngle__14 = l__Cframe__3.fromAxisAngle;
		local l__BlindTables__15 = p1.BlindTables;
		local v16 = l__CollectionService__7:GetTagged("WeaponCollisionIgnoreList");
		local v17 = RaycastParams.new();
		v17.FilterType = Enum.RaycastFilterType.Blacklist;
		v17.FilterDescendantsInstances = v16;
		l__CollectionService__7:GetInstanceAddedSignal("WeaponCollisionIgnoreList"):Connect(function()
			v17.FilterDescendantsInstances = l__CollectionService__7:GetTagged("WeaponCollisionIgnoreList");
		end);
		l__CollectionService__7:GetInstanceRemovedSignal("WeaponCollisionIgnoreList"):Connect(function()
			v17.FilterDescendantsInstances = l__CollectionService__7:GetTagged("WeaponCollisionIgnoreList");
		end);
		u1.weaponCollisionParams = v17;
		local u2 = nil;
		local u3 = nil;
		local u4 = nil;
		local l__Projectiles__5 = p1.Projectiles;
		local u6 = v16;
		local u7 = nil;
		if not game:IsLoaded() then
			game.Loaded:Connect(function()
				u2 = game:GetService("Players").LocalPlayer.PlayerGui;
				u3 = workspace.Ignore.ParticleOrigin;
				u4 = l__Projectiles__5.projectileRayParams;
				u6 = l__CollectionService__7:GetTagged("WeaponCollisionIgnoreList");
				u7 = l__Lighting__4.NV_ColorCorrection.TintColor;
			end);
		else
			u2 = game:GetService("Players").LocalPlayer.PlayerGui;
			u3 = workspace.Ignore.ParticleOrigin;
			u4 = l__Projectiles__5.projectileRayParams;
			u6 = l__CollectionService__7:GetTagged("WeaponCollisionIgnoreList");
			u7 = l__Lighting__4.NV_ColorCorrection.TintColor;
		end;
		local u8 = nil;
		local u9 = nil;
		local u10 = nil;
		local u11 = Color3.new(1, 0, 0);
		local u12 = Color3.new(1, 1, 1);
		function u1.setMyPlayer(p2, p3)
			u8 = p3;
			if u2 then
				u9 = u2.LaserBlind.Frame;
				u10 = u2.FlashlightBlind.Frame;
				u9.BackgroundColor3 = u8.nightvision and u7 or u11;
				u10.BackgroundColor3 = u8.nightvision and u7 or u12;
			end;
		end;
		local l__Loadout__13 = p1.Loadout;
		local l__Schedule__14 = l__Utility__1.Schedule;
		local l__CurrentCamera__15 = workspace.CurrentCamera;
		local l__lerp__16 = l__Mathf__2.lerp;
		local l__SmoothValue__17 = l__Utility__1.SmoothValue;
		local l__cframeLerper__18 = l__Cframe__3.cframeLerper;
		local l__GameSettings__19 = p1.ServerDataConstants.GameSettings;
		local function u20(p4)
			for v18, v19 in pairs(p4) do
				if v19.clone then
					p4[v18] = nil;
					v19.weld:Destroy();
					v19.part:Destroy();
				else
					v19.weld.C0 = v19.baseC0;
					if v19.part then
						v19.part.Transparency = v19.baseTransparency;
					end;
				end;
			end;
		end;
		local l__UI__21 = p1.UI;
		local u22 = {
			ADSImage = true, 
			ADSDecal = true, 
			Muzzle = true, 
			GLMuzzle = true, 
			CasingCFrame = true, 
			LinkCFrame = true, 
			C_Default = true, 
			C_Aim = true, 
			C_AimPeriscope = true, 
			C_AimMuzzleZeroPivot = true, 
			C_AltAim = true, 
			C_NVAim = true, 
			C_GLAim = true, 
			EyeReliefGuide = true, 
			AttachPoint = true, 
			AttachOptic = true, 
			AttachTop = true, 
			AttachBottom = true, 
			AttachLeft = true, 
			AttachRight = true, 
			LeftArmGrip = true, 
			RightArmGrip = true, 
			RMRLens = true, 
			RMRWhite = true, 
			LeftArmGLActive = true, 
			RightArmGLActive = true, 
			GLSegmentModel = true, 
			LaserPoint = true, 
			FlashlightPoint = true, 
			SlideA = true, 
			SlideB = true, 
			BipodArmLeft = true, 
			BipodArmRight = true, 
			BipodAttachmentSetup = true
		};
		local u23 = {
			BipodExtended = true, 
			BipodRetracted = true, 
			C_GLAimSegments = true, 
			GLSegmentModelPositions = true, 
			Belt = true, 
			Belt2 = true
		};
		local l__Network__24 = p1.Network;
		local l__percentBetween__25 = l__Mathf__2.percentBetween;
		local l__Animation__26 = p1.Animation;
		local l__PlayerList__27 = p1.PlayerList;
		local u28 = {
			Auto = true, 
			Burst = true
		};
		local l__lerpTowards__29 = l__Mathf__2.lerpTowards;
		local u30 = {
			FrontSight = true
		};
		local u31 = {
			InsideTube = true, 
			OutsideTube = true, 
			RMRLens = true, 
			RMRWhite = true
		};
		local l__smoothLerp__32 = l__Mathf__2.smoothLerp;
		local u33 = l__fromAxisAngle__14(math.pi / 2, 0, 0);
		function u1.new(p5, p6, p7, p8, p9)
			local v20, v21, v22, v23 = l__Loadout__13:loadWeapon(p6, p8);
			local l__isMain__24 = p5.isMain;
			local l__realPlayer__25 = p5.realPlayer;
			local v26 = {};
			if l__isMain__24 then
				v20.Parent = l__realPlayer__25;
			end;
			v26.model = v21;
			v26.config = v20;
			v26.audioFolder = v20.Audio;
			v26.name = v20.Name;
			v26.index = p9;
			v26.attachments = p6.attachments;
			local l__aimSpring__27 = p5.aimSpring;
			local l__nvAimSpring__28 = p5.nvAimSpring;
			local l__sprintSpring__29 = p5.sprintSpring;
			local l__tacPaceSpring__30 = p5.tacPaceSpring;
			local l__leanSpring__31 = p5.leanSpring;
			local l__stanceSpring__32 = p5.stanceSpring;
			local l__equipSpring__33 = p5.equipSpring;
			local l__coverSpring__34 = p5.coverSpring;
			local l__glSpring__35 = p5.glSpring;
			local v36 = l__Schedule__14.new();
			local l__CFrame__37 = l__CurrentCamera__15.CFrame;
			local l__CFrame__38 = l__CurrentCamera__15.CFrame;
			local v39 = require(v20.Animations);
			v26.aimingDisabled = v23.AimingDisabled;
			v26.cannotRearm = v23.CannotRearm;
			v26.buildable = v23.Buildable;
			local v40 = nil;
			if l__isMain__24 and v26.buildable then
				v26.buildableBuildObject = l__ReplicatedStorage__6.Assets.Buildable["Team" .. u8.team][v23.Buildable];
				local u34 = nil;
				local u35 = nil;
				v40 = function(p10)
					if p10 == u34 then
						return;
					end;
					u34 = p10;
					for v41, v42 in pairs(u35:GetDescendants()) do
						if v42:IsA("BasePart") then
							if v42:IsA("UnionOperation") then
								v42.UsePartColor = true;
							end;
							v42.Color = u34 and Color3.new(1, 0.85, 0) or Color3.new(1, 0, 0);
						end;
					end;
				end;
			end;
			local v43 = {};
			for v44, v45 in pairs(v23.Firemodes.FiremodeTables) do
				v43[v44] = {
					name = v45.Name, 
					rps = v45.RateOfFire / 60, 
					maxShots = v45.MaxShots, 
					minShots = v45.MinShots
				};
			end;
			v26.weaponCoverAmountTriggered = false;
			local v46 = nil;
			v26.fireMode = v43[1];
			v26.firemodeRPS = v26.fireMode.rps;
			v26.bipod = false;
			v26.bipodMounted = false;
			v26.shellType = v23.ShellCasing;
			v26.casingCFrame = v21:FindFirstChild("CasingCFrame");
			v26.linkType = v23.BeltLink;
			v26.linkCFrame = v21:FindFirstChild("LinkCFrame");
			local v47 = 1 / v26.firemodeRPS;
			local v48 = v47 / 2;
			v26.belt = v21:FindFirstChild("Belt");
			v26.belt2 = v21:FindFirstChild("Belt2");
			local v49 = v26.belt and v26.belt2;
			local v50 = {};
			local v51 = {};
			if v49 then
				for v52, v53 in pairs(v26.belt:GetChildren()) do
					local v54 = {};
					if v53:IsA("Model") then
						for v55, v56 in pairs(v53:GetDescendants()) do
							if v56:IsA("BasePart") then
								table.insert(v54, v56);
							end;
						end;
					elseif v53:IsA("BasePart") then
						table.insert(v54, v53);
					end;
					v50[tonumber(v53.Name)] = v54;
				end;
				for v57, v58 in pairs(v26.belt2:GetChildren()) do
					local v59 = {};
					if v58:IsA("Model") then
						for v60, v61 in pairs(v58:GetDescendants()) do
							if v61:IsA("BasePart") then
								table.insert(v59, v61);
							end;
						end;
					elseif v58:IsA("BasePart") then
						table.insert(v59, v58);
					end;
					v51[tonumber(v58.Name)] = v59;
				end;
			end;
			v26.showMuzzleFlash = 0;
			v26.Disposable = v23.Disposable;
			v26.Disposed = false;
			v26.glPossible = v23.GrenadeLauncher;
			v26.grenadeLauncherName = v23.GrenadeLauncherName;
			v26.grenadeLauncherSupplyCost = v23.GrenadeLauncherSupplyCost;
			local v62 = v26.glPossible and v23.GrenadeLauncher or 0;
			v26.totalGlGrenades = v62;
			v26.glGrenades = v62;
			v26.glActive = false;
			local l__MagSize__63 = v23.MagSize;
			v26.inMag = l__MagSize__63;
			local v64 = CFrame.Angles(0, math.rad(360 / l__MagSize__63), 0);
			v26.mags = p7;
			v26.totalMags = v26.mags;
			v26.supplyCost = v23.SupplyCost and v23.SupplyCost or 0;
			if v23.PatternNumber then
				local v65 = true;
			else
				v65 = false;
			end;
			if v65 then
				local v66 = v23.PatternNumber;
			else
				v66 = 0;
			end;
			local l__Weight__67 = v23.Weight;
			local v68 = l__lerp__16(0.8, 2, l__Weight__67 / 24);
			if v23.PistolSway then
				local v69 = 1.3;
			else
				v69 = 0.7;
			end;
			if v23.PistolSway then
				local v70 = 1.5;
			else
				v70 = 0.9;
			end;
			if v23.PistolSway then
				local v71 = 2.8;
			else
				v71 = 0.1;
			end;
			v26.weight = l__Weight__67;
			local l__BipodAttachmentSetup__72 = v21:FindFirstChild("BipodAttachmentSetup");
			v26.hasBipod = l__BipodAttachmentSetup__72 ~= nil;
			local l__BipodDeployed__73 = v21:FindFirstChild("BipodDeployed");
			local l__BipodRetracted__74 = v21:FindFirstChild("BipodRetracted");
			local l__C_AltAim__75 = v21:FindFirstChild("C_AltAim");
			local v76 = v21:FindFirstChild("C_GLAim") or v21:FindFirstChild("C_GLAimSegments");
			local l__C_AimPeriscope__77 = v21:FindFirstChild("C_AimPeriscope");
			local l__C_GLAimSegments__78 = v21:FindFirstChild("C_GLAimSegments");
			local l__GLSegmentModelPositions__79 = v21:FindFirstChild("GLSegmentModelPositions");
			local v80 = 0;
			local v81 = {};
			local v82 = {};
			local v83 = {};
			if l__C_GLAimSegments__78 then
				v80 = #v21.C_GLAimSegments:GetChildren();
			end;
			local l__GLSightUp__84 = v21:FindFirstChild("GLSightUp");
			local l__GLSightDown__85 = v21:FindFirstChild("GLSightDown");
			if l__GLSightUp__84 and l__GLSightDown__85 then
				if l__GLSightUp__84:IsA("BasePart") then
					l__GLSightUp__84.Transparency = 1;
				elseif l__GLSightUp__84:IsA("Model") then
					for v86, v87 in pairs(l__GLSightUp__84:GetChildren()) do
						if v87:IsA("BasePart") then
							v87.Transparency = 1;
						end;
					end;
				end;
				if l__GLSightDown__85:IsA("BasePart") then
					l__GLSightDown__85.Transparency = 0;
				elseif l__GLSightDown__85:IsA("Model") then
					for v88, v89 in pairs(l__GLSightDown__85:GetChildren()) do
						if v89:IsA("BasePart") then
							v89.Transparency = 0;
						end;
					end;
				end;
			end;
			local v90 = v23.Tritium or true;
			if v21:FindFirstChild("LaserPoint") then
				local v91 = true;
			else
				v91 = false;
			end;
			v26.hasLaser = v91;
			local v92 = nil;
			if v26.hasLaser then
				v92 = {
					MainPart = v21.LaserPoint
				};
				v92.OriginAttach = v92.MainPart:FindFirstChild("OriginAttach");
				v92.IRBeam = v92.MainPart:FindFirstChild("IRLaserBeam");
				v92.VISFlare = v92.MainPart:FindFirstChild("EmitterFlare");
				v92.IRFlare = v92.MainPart:FindFirstChild("IREmitterFlare");
				if v92.MainPart:FindFirstChild("HitAttach") then
					v92.HitAttach = v92.MainPart.HitAttach;
					v92.VISLaserDot = v92.HitAttach:FindFirstChild("Laser");
					v92.IRLaserDot = v92.HitAttach:FindFirstChild("IRLaser");
				end;
			end;
			local l__Laser__93 = v23.Laser;
			if v21:FindFirstChild("FlashlightPoint") then
				local v94 = true;
			else
				v94 = false;
			end;
			v26.hasFlashlight = v94;
			local v95 = nil;
			local v96 = nil;
			if v26.hasFlashlight then
				v95 = {
					MainPart = v21.FlashlightPoint
				};
				v96 = v21:FindFirstChild("FlashlightLens");
				v95.MainLight = v95.MainPart:FindFirstChild("MainLight");
				v95.Flare = v95.MainPart:FindFirstChild("EmitterFlare");
				v95.IRFlare = v95.MainPart:FindFirstChild("IREmitterFlare");
				if v95.MainPart:FindFirstChild("HitAttach") then
					v95.HitAttach = v95.MainPart.HitAttach;
					v95.HitLight = v95.HitAttach:FindFirstChild("PointLight");
				end;
			end;
			local l__C_NVAim__97 = v21:FindFirstChild("C_NVAim");
			v26.hasNVAim = l__C_NVAim__97;
			local l__Scope__98 = v21:FindFirstChild("Scope");
			local v99 = nil;
			local v100 = nil;
			if l__Scope__98 then
				v99 = l__Scope__98:GetDescendants();
				v100 = l__Scope__98:FindFirstChild("ADSModel");
			end;
			local l__MagnifierObjects__101 = v21:FindFirstChild("MagnifierObjects");
			if l__MagnifierObjects__101 then
				local v102 = true;
			else
				v102 = false;
			end;
			local v103 = v23.ShowGunWithScope;
			local l__ShowAllWithScope__104 = v23.ShowAllWithScope;
			if l__ShowAllWithScope__104 then
				v103 = true;
			end;
			local l__Muzzle__105 = v21:FindFirstChild("Muzzle");
			local l__GLMuzzle__106 = v21:FindFirstChild("GLMuzzle");
			if l__GLMuzzle__106 then
				local v107 = true;
			else
				v107 = false;
			end;
			local v108 = l__SmoothValue__17.new(0);
			v108.r = 3.2;
			local v109 = l__SmoothValue__17.new(0);
			v109.r = 3.2;
			local l__C_AimMuzzleZeroPivot__110 = v21:FindFirstChild("C_AimMuzzleZeroPivot");
			local v111 = l__C_AimMuzzleZeroPivot__110 and (l__C_AimMuzzleZeroPivot__110.Position - v21.C_Aim.Position).Magnitude;
			local v112 = nil;
			local v113 = nil;
			local v114 = Instance.new("CFrameValue");
			local v115 = nil;
			local v116 = nil;
			local v117 = nil;
			local v118 = nil;
			local v119 = nil;
			local v120 = nil;
			local v121 = nil;
			local v122 = nil;
			local v123 = nil;
			local v124 = nil;
			if p8 then
				local v125 = v21.G_Ready;
				local v126 = v125.CFrame;
				local v127 = v12;
				local v128 = v126:ToObjectSpace(v21.G_Aim.CFrame):Inverse();
				v21.G_Aim:Destroy();
				local v129 = v126:ToObjectSpace(v21.G_Sprint.CFrame):Inverse();
				v21.G_Sprint:Destroy();
				local v130 = v126:ToObjectSpace(v21.G_TacPace.CFrame):Inverse();
				v21.G_TacPace:Destroy();
				local v131 = v126:ToObjectSpace(v21.Middle.CFrame):Inverse();
				v21.Middle:Destroy();
			else
				v125 = v21.C_Default;
				v126 = v125.CFrame;
				v127 = v126:ToObjectSpace(v21.C_Ready.CFrame):Inverse();
				v21.C_Ready:Destroy();
				if v23.MuzzleZeroAngle then
					local v132 = l__C_AimMuzzleZeroPivot__110 and l__C_AimMuzzleZeroPivot__110.CFrame * CFrame.Angles(math.rad(-v23.MuzzleZeroAngle), 0, 0) * CFrame.new(0, 0, v111) or (v21.C_Aim.CFrame * CFrame.Angles(math.rad(-v23.MuzzleZeroAngle), 0, 0) or v21.C_Aim.CFrame);
				else
					v132 = v21.C_Aim.CFrame;
				end;
				v128 = v126:ToObjectSpace(v132):Inverse();
				if l__C_AimPeriscope__77 then
					v112 = v126:ToObjectSpace(v23.MuzzleZeroAngle and v21.C_AimPeriscope.CFrame * CFrame.Angles(math.rad(-v23.MuzzleZeroAngle), 0, 0) or v21.C_AimPeriscope.CFrame):Inverse();
				end;
				if v76 and not l__C_GLAimSegments__78 then
					v114.Value = v126:ToObjectSpace(v21.C_GLAim.CFrame):Inverse();
					v21.C_GLAim:Destroy();
				elseif l__C_GLAimSegments__78 then
					v114.Value = v126:ToObjectSpace(v21.C_GLAimSegments["1"].CFrame):Inverse();
					local v133 = nil;
					if l__GLSegmentModelPositions__79 then
						v115 = v22.GLSegmentModel;
						v133 = v21.GLSegmentModelAttachRef.CFrame;
					end;
					for v134 = 1, v80 do
						v81[v134] = v126:ToObjectSpace(v21.C_GLAimSegments[v134].CFrame):Inverse();
						v82[v134] = v21.C_GLAimSegments[v134].RangeDisplay.Value;
						if l__GLSegmentModelPositions__79 then
							v83[v134] = v133:ToObjectSpace(v21.GLSegmentModelPositions[v134].CFrame);
						end;
					end;
				else
					v114.Value = v12;
				end;
				if l__C_NVAim__97 then
					v116 = v126:ToObjectSpace(v21.C_NVAim.CFrame):Inverse();
					v21.C_NVAim:Destroy();
				else
					v116 = v127;
				end;
				if l__C_AltAim__75 then
					v117 = v126:ToObjectSpace(v21.C_AltAim.CFrame * CFrame.new(0, 0, v23.AimIsAltAim and 0)):Inverse();
				else
					v117 = v12;
				end;
				v119 = v21:FindFirstChild("EyeRelief");
				if v119 then
					v119.Parent = u2;
					v122 = v119.Frame.ViewportFrame;
					v122.CurrentCamera = l__CurrentCamera__15;
					v120 = v122.EyeReliefEffect;
					v120.Transparency = 0;
					v120.Parent = v122;
					if v21:FindFirstChild("EyeReliefGuide") then
						v121 = v21.EyeReliefGuide;
					end;
				end;
				v129 = v126:ToObjectSpace(v21.C_Sprint.CFrame):Inverse();
				v21.C_Sprint:Destroy();
				v113 = v126:ToObjectSpace(v21.C_Patrol.CFrame):Inverse();
				v21.C_Patrol:Destroy();
				v130 = v126:ToObjectSpace(v21.C_Tac_Pace.CFrame):Inverse();
				v21.C_Tac_Pace:Destroy();
				v131 = CFrame.new(0, -2, 3) * CFrame.Angles(0, 1.5707963267948966, 0) * CFrame.Angles(-1.5707963267948966, 0, 0.3490658503988659);
			end;
			if v26.hasBipod then
				v118 = CFrame.new(v126:Inverse() * ((l__BipodAttachmentSetup__72.BipodEnd1.WorldPosition + l__BipodAttachmentSetup__72.BipodEnd2.WorldPosition) / 2)):Inverse();
			end;
			local v135 = p8 and v21:FindFirstChild("RightGrip") or v21:FindFirstChild("Right Arm");
			local v136 = v135 and v126:ToObjectSpace(v135.CFrame) or v12;
			if v135 then
				v135:Destroy();
			end;
			local v137 = p8 and v21:FindFirstChild("LeftGrip") or v21:FindFirstChild("Left Arm");
			local v138 = v137 and v126:ToObjectSpace(v137.CFrame) or v12;
			if v137 then
				v137:Destroy();
			end;
			local l__Rocket__139 = v21:FindFirstChild("Rocket");
			local l__Slide__140 = v22.Slide;
			local v141 = nil;
			if v22.WeldToSlide then
				v141 = v22.WeldToSlide.weld;
			end;
			local v142 = nil;
			if l__Slide__140 then
				v142 = l__cframeLerper__18(v22.SlideA.baseC0, v22.SlideB.baseC0);
			end;
			local v143 = nil;
			local v144 = nil;
			local v145 = nil;
			if not v23.QuietBoltADS then

			end;
			v26.layerPitches = (v23.LayerPitches and 1) * 1;
			v26.tailLayerPitches = (v23.TailLayerPitches or v26.layerPitches) * 1;
			v26.pitchShiftTails = v23.PitchShiftTails and false;
			v26.layerSoundSetup = v23.LayerSoundSetup or "Rifles";
			local v146 = {};
			for v147, v148 in pairs(l__GameSettings__19.LayerRanges[v26.layerSoundSetup]) do
				local v149 = {};
				for v150, v151 in pairs(v148) do
					v149[v150] = v151;
				end;
				v146[v147] = v149;
			end;
			local v152 = {};
			for v153, v154 in pairs(l__GameSettings__19.LayerRanges.GrenadeLaunchers) do
				local v155 = {};
				for v156, v157 in pairs(v154) do
					v155[v156] = v157;
				end;
				v152[v153] = v155;
			end;
			v26.layerSoundSetupTable = v146;
			v26.glLayerSoundSetupTable = v152;
			v26.layerVolumeReduction = v23.LayerVolumeReduction and 0;
			local u36 = nil;
			local u37 = nil;
			local u38 = nil;
			local u39 = v137;
			local u40 = nil;
			local u41 = v135;
			local u42 = nil;
			local u43 = {};
			local u44 = nil;
			local u45 = false;
			local u46 = 0;
			local u47 = false;
			local u48 = 0;
			local u49 = 0;
			local u50 = 1;
			local u51 = l__CFrame__37;
			local u52 = l__CFrame__37.Position;
			local u53 = l__CFrame__38;
			local u54 = l__CFrame__38.Position;
			local u55 = l__CFrame__38.LookVector;
			local u56 = false;
			local u57 = false;
			local u58 = false;
			local u59 = 1;
			local u60 = v64;
			local u61 = v23.Firemodes.FirstFiremode;
			local u62 = nil;
			local u63 = nil;
			local l__audioHandler__64 = p5.audioHandler;
			local l__fxHandler__65 = p5.fxHandler;
			function v26.setupCharacter(p11)
				u36 = p5.character;
				u37 = u36.Torso;
				u38 = p5.humanoidRootPart;
				u39 = u36["Left Arm"];
				u39.Size = Vector3.new(1, 2, 1);
				u40 = u37["Left Shoulder"];
				u41 = u36["Right Arm"];
				u41.Size = Vector3.new(1, 2, 1);
				u42 = u37["Right Shoulder"];
				u43[u39] = true;
				u43[u41] = true;
				u44 = Instance.new("Motor6D");
				u44.Part0 = p8 and u37 or u38;
				u44.Part1 = v125;
				u44.C0 = p8 and v131 or v127;
				u44.Name = "Tool";
				u44.Parent = u38;
				u45 = false;
				u46 = 0;
				u47 = false;
				u48 = 0;
				u49 = 0;
				u50 = 1;
				u51 = l__CurrentCamera__15.CFrame;
				u52 = u51.Position;
				u53 = l__CurrentCamera__15.CFrame;
				u54 = u53.Position;
				u55 = u53.LookVector;
				u56 = false;
				u57 = false;
				u58 = false;
				p11.showMuzzleFlash = 0;
				p11.Disposed = false;
				p11.totalGlGrenades = v62;
				p11.glGrenades = v62;
				u59 = 1;
				p11.glActive = false;
				p11.inMag = l__MagSize__63;
				u60 = CFrame.Angles(0, math.rad(360 / l__MagSize__63), 0);
				p11.mags = p7;
				p11.totalMags = p11.mags;
				u61 = v23.Firemodes.FirstFiremode;
				p11.weaponCoverAmountTriggered = false;
				p11.fireMode = v43[1];
				p11.firemodeRPS = p11.fireMode.rps;
				v108.t = 0;
				v108.p = 0;
				v109.t = 0;
				v109.p = 0;
				if l__isMain__24 and p11.buildable then
					u62 = p11.buildableBuildObject:Clone();
					u63 = false;
					if u62 then
						u62.Name = "BuildablePlaceHolographic";
						for v158, v159 in pairs(u62:GetDescendants()) do
							if v159:IsA("BasePart") then
								v159.Material = Enum.Material.SmoothPlastic;
								if v159.Name == "Center" then
									local v160 = 1;
								else
									v160 = 0.25;
								end;
								v159.Transparency = v160;
							elseif v159:IsA("Texture") then
								v159.Transparency = 1;
							end;
						end;
						v40(false);
						if not u62.PrimaryPart then
							u62.PrimaryPart = u62.Center;
						end;
						u62.PrimaryPart.Anchored = true;
						u62.Parent = l__CurrentCamera__15;
					end;
				end;
				l__audioHandler__64:addWeapon(p11, 1);
				l__fxHandler__65:addWeapon(p11);
				p11:stopFire();
				p11:setFlashlight(false);
				p11:setLaser(false);
			end;
			v21.Parent = p8 and p5.gearFolder.Folder or l__realPlayer__25;
			v22.Main = {
				part = v125, 
				weld = {
					C0 = p8 and v131 or v127
				}, 
				baseC0 = p8 and v131 or v127, 
				baseTransparency = 1
			};
			v22.leftArm = {
				part = nil, 
				weld = {
					C0 = v138
				}, 
				baseC0 = v138, 
				baseTransparency = 0
			};
			v22.rightArm = {
				part = nil, 
				weld = {
					C0 = v136
				}, 
				baseC0 = v136, 
				baseTransparency = 0
			};
			local v161 = nil;
			local v162 = nil;
			if v26.glPossible and v22.LeftArmGLActive then
				v22.LeftArmGLActive.baseC0 = v126:ToObjectSpace(v22.LeftArmGLActive.part.CFrame);
				v22.LeftArmGLActive.weld.C0 = v22.LeftArmGLActive.baseC0;
				v161 = l__cframeLerper__18(v22.leftArm.baseC0, v22.LeftArmGLActive.baseC0);
				v162 = l__cframeLerper__18(v22.LeftArmGLActive.baseC0, v22.leftArm.baseC0);
			end;
			u20(v22);
			u39.Size = Vector3.new(1, 2, 1);
			u41.Size = Vector3.new(1, 2, 1);
			if l__isMain__24 then
				v143 = l__UI__21.scopeUI.ScopeFrame;
				v144 = v143.Reticle;
				v145 = v143.AltReticle;
				v46 = (v125.Position - v21.Muzzle.Position).Magnitude + 0.05;
				v123 = v126:ToObjectSpace(l__Muzzle__105.CFrame);
				v124 = v126:ToObjectSpace(CFrame.new(l__Muzzle__105.Position + -(l__Muzzle__105.CFrame.LookVector * v46)));
			end;
			if l__Scope__98 then
				for v163, v164 in pairs(v21:GetDescendants()) do
					if (not (not v164:IsA("BasePart")) or not (not v164:IsA("Decal")) or v164:IsA("Texture")) and (u22[v164.Name] or v100 and v164:IsDescendantOf(v100)) then
						u43[v164] = true;
					end;
				end;
				for v165, v166 in pairs(v21:GetDescendants()) do
					if v166:IsA("Model") and u23[v166.Name] then
						for v167, v168 in pairs(v166:GetDescendants()) do
							if not (not v168:IsA("BasePart")) or not (not v168:IsA("Decal")) or v168:IsA("Texture") then
								u43[v168] = true;
							end;
						end;
					end;
				end;
			end;
			local u66 = 0;
			local u67 = 0;
			local u68 = 0;
			function v26.stopFire(p12)
				u66 = 0;
				u67 = 0;
				u68 = 0;
			end;
			local u69 = v92;
			local u70 = v95;
			function v26.Destroy(p13)
				if p13.audioFolder then
					p13.audioFolder:Destroy();
				end;
				v20:Destroy();
				v21:Destroy();
				v36:clear();
				u44:Destroy();
				if u69 and u69.HitAttach then
					u69.HitAttach:Destroy();
					u69 = nil;
				end;
				if u70 and u70.HitAttach then
					u70.HitAttach:Destroy();
					u70 = nil;
				end;
				for v169, v170 in pairs(v22) do
					if v170.weld and typeof(v170.weld) == "Instance" then
						v170.weld:Destroy();
					end;
				end;
				if p5.weapon == p13 then
					p5.weapon = nil;
				end;
				l__audioHandler__64:removeWeapon(p13);
				l__fxHandler__65:removeWeapon(p13);
			end;
			local u71 = l__Laser__93 == "IR";
			local u72 = false;
			function v26.setLaser(p14, p15)
				if p14.hasLaser then
					p5.laser = p15;
					if u69.HitAttach then
						u69.HitAttach.Parent = p15 and u3 or nil;
						if p15 and ((u71 or l__Laser__93 == "Both") and u69.OriginAttach and u69.IRBeam) then
							u69.IRBeam.Attachment0 = u69.OriginAttach;
							u69.IRBeam.Attachment1 = u69.HitAttach;
						end;
					end;
					if p15 then
						if not u71 then
							local v171 = false;
							if l__Laser__93 == "Both" then
								v171 = p5.nightvision;
							end;
						else
							v171 = p5.nightvision;
						end;
						u72 = v171;
					else
						u72 = false;
						if u69.VISLaserDot then
							u69.VISLaserDot.Transparency = v10;
						end;
						if u69.IRLaserDot then
							u69.IRLaserDot.Transparency = v10;
						end;
					end;
					if u69.VISLaserDot then
						u69.VISLaserDot.Enabled = p5.laser and not u72;
						if p8 and u69.VISFlare then
							u69.VISFlare.Enabled = p5.laser and not u72;
						end;
					end;
				end;
			end;
			function v26.setFlashlight(p16, p17)
				if p16.hasFlashlight then
					p5.flashlight = p17;
					if u70.MainLight then
						u70.MainLight.Enabled = p17;
					end;
					if u70.HitAttach then
						u70.HitAttach.Parent = p17 and u3 or nil;
						if u70.HitLight then
							u70.HitLight.Enabled = p17;
						end;
					end;
					if v96 then
						v96.Material = p17 and Enum.Material.Neon or Enum.Material.SmoothPlastic;
					end;
				end;
			end;
			local u73 = 300;
			function v26.updateLaser(p18, p19)
				if p18.hasLaser and u69.HitAttach then
					local v172 = u72 and u8.nightvision;
					if u69.IRBeam and u69.IRLaserDot then
						u69.IRBeam.Enabled = v172;
						u69.IRLaserDot.Enabled = v172;
						if v172 then
							u69.IRLaserDot.Transparency = v9;
						else
							u69.IRLaserDot.Transparency = v10;
						end;
						if p8 and u69.IRFlare then
							u69.IRFlare.Enabled = v172;
						end;
					end;
					if p5.laser then
						local v173 = nil;
						local v174 = nil;
						local v175 = nil;
						local v176 = nil;
						local v177 = nil;
						local v178 = nil;
						local v179 = nil;
						local l__Position__180 = u69.MainPart.CFrame.Position;
						v173 = u69.MainPart.CFrame.LookVector;
						local v181 = p5.laserPosition;
						if l__isMain__24 then
							local v182 = workspace:Raycast(l__Position__180, v173 * u73, u4);
							if v182 then
								v181 = v182.Position;
							else
								v181 = l__Position__180 + v173 * u73;
							end;
							l__Network__24:updateSendData("LaserPosition", v181);
							p5.laserPosition = v181;
						else
							local v183 = math.clamp((0.04363323129985824 - math.abs((math.acos(v173:Dot((u54 - l__Position__180).Unit))))) * 6.283185307179586 / 0.08726646259971647 / 3.141592653589793, 0, 1);
							if u72 and u69.IRFlare then
								u69.IRFlare.Flare.Size = UDim2.new(v183, 0, v183, 0);
							elseif u69.VISFlare then
								u69.VISFlare.Flare.Size = UDim2.new(v183, 0, v183, 0);
							end;
						end;
						local l__Magnitude__184 = (v181 - l__Position__180).Magnitude;
						local v185 = l__Magnitude__184 / u73;
						u69.HitAttach.Position = v181;
						if u72 then
							if u69.IRLaserDot and u69.IRBeam then
								u69.IRLaserDot.Size = NumberSequence.new(v185 * u73 / 150);
								u69.IRLaserDot.Transparency = v172 and NumberSequence.new(v185) or v10;
								u69.IRBeam.Transparency = NumberSequence.new(0.2, v185 * 0.2);
								return;
							end;
							v174 = u69;
							v175 = "VISLaserDot";
							v176 = v174;
							v177 = v175;
							v178 = v176[v177];
							v179 = v178;
							if v179 then
								u69.VISLaserDot.Size = NumberSequence.new(math.clamp((l__Magnitude__184 + 30) / u73 * u73 / 600, 0.02, 100));
								u69.VISLaserDot.Transparency = NumberSequence.new(v185);
							end;
						else
							v174 = u69;
							v175 = "VISLaserDot";
							v176 = v174;
							v177 = v175;
							v178 = v176[v177];
							v179 = v178;
							if v179 then
								u69.VISLaserDot.Size = NumberSequence.new(math.clamp((l__Magnitude__184 + 30) / u73 * u73 / 600, 0.02, 100));
								u69.VISLaserDot.Transparency = NumberSequence.new(v185);
							end;
						end;
					end;
				end;
			end;
			function v26.updateFlashlight(p20, p21)
				if p20.hasFlashlight then
					if p5.flashlight and u70.HitAttach and u70.HitLight then
						local v186 = nil;
						local l__Position__187 = u70.MainPart.CFrame.Position;
						v186 = u70.MainPart.CFrame.LookVector;
						local v188 = p5.flashlightPosition;
						if l__isMain__24 then
							local v189 = workspace:Raycast(l__Position__187, v186 * 60, u4);
							if v189 then
								v188 = v189.Position;
							else
								v188 = l__Position__187 + v186 * 60;
							end;
							l__Network__24:updateSendData("FlashlightPosition", v188);
							p5.flashlightPosition = v188;
						else
							local v190 = math.clamp((0.4363323129985824 - math.abs((math.acos(v186:Dot((u54 - l__Position__187).Unit))))) * 6.283185307179586 / 0.8726646259971648 / 3.141592653589793, 0, 1);
							local v191 = l__percentBetween__25(v190, 0.66, 1);
							local v192 = l__percentBetween__25(v190, 0.33, 0.66) - l__percentBetween__25(v190, 0.66, 1);
							local v193 = l__percentBetween__25(v190, 0, 0.33) - l__percentBetween__25(v190, 0.33, 0.66);
							if u70.Flare and u70.IRFlare then
								u70.Flare.DirectFlare.ImageTransparency = v191;
								u70.Flare.DirectishFlare.ImageTransparency = v192;
								u70.Flare.IndirectFlare.ImageTransparency = v193;
								local v194 = UDim2.new(v190, 0, v190, 0);
								u70.Flare.DirectFlare.Size = v194;
								u70.Flare.DirectishFlare.Size = v194;
								u70.Flare.IndirectFlare.Size = v194;
								u70.IRFlare.DirectFlare.Size = v194;
								u70.IRFlare.DirectishFlare.Size = v194;
								u70.IRFlare.IndirectFlare.Size = v194;
							end;
						end;
						local v195 = (v188 - l__Position__187).Magnitude / 60;
						u70.HitAttach.Position = v188;
						u70.HitLight.Brightness = (1 - v195) * 5;
						u70.HitLight.Range = (v195 + 0.16) * 25;
					end;
					if p8 and u70.Flare and u70.IRFlare then
						u70.Flare.Enabled = p5.flashlight and not u8.nightvision;
						u70.IRFlare.Enabled = p5.flashlight and u8.nightvision;
					end;
				end;
			end;
			function v26.canEquip(p22)
				return (not p22.Disposable or not p22.Disposed) and (not p22.buildable or p22.inMag ~= 0);
			end;
			local l__mainSchedule__74 = p5.mainSchedule;
			local function u75(p23)
				for v196, v197 in pairs(u62:GetDescendants()) do
					if v197:IsA("BasePart") then
						if p23 then
							local v198 = 0.25;
						else
							v198 = 1;
						end;
						v197.Transparency = v198;
					end;
				end;
			end;
			local l__Scope__76 = v23.Scope;
			local u77 = v102;
			local u78 = v23.AimFOV;
			local u79 = v23.FiberOptic or true;
			local l__AltScope__80 = v23.AltScope;
			local l__Keys__81 = p5.Keys;
			local u82 = l__equipSpring__33.p;
			function v26.setEquip(p24, p25, p26)
				if p25 and (not l__isMain__24 or (not u47 or not p5.equipping) and not p5.unequipping and p24:canEquip()) then
					p5.equipping = true;
					p5.reloading = false;
					l__mainSchedule__74:clear();
					local l__weapon__199 = p5.weapon;
					if l__weapon__199 and l__weapon__199 ~= p24 then
						l__weapon__199:setEquip(false, p24);
					end;
					u39.Size = p8 and Vector3.new(1, 2, 1) or Vector3.new(0.65, 3, 0.65);
					u41.Size = p8 and Vector3.new(1, 2, 1) or Vector3.new(0.65, 3, 0.65);
					if l__isMain__24 and u62 then
						u75(true);
					end;
					l__audioHandler__64:setWeapon(p24);
					l__mainSchedule__74:append(function()
						p24:stopFire();
						l__fxHandler__65:setWeapon(p24);
						l__audioHandler__64:changeGunEnvLayer(p5.Layer);
						l__audioHandler__64:deploy();
						p5.weapon = p24;
						p5.weightMult = v68;
						u20(v22);
						if p24.inMag == 0 and l__Rocket__139 then
							for v200, v201 in pairs(l__Rocket__139:GetChildren()) do
								v201.Transparency = 1;
							end;
						end;
						if l__isMain__24 then
							v144:ClearAllChildren();
							v145:ClearAllChildren();
							if l__Scope__76 then
								for v202, v203 in pairs(v23.Scope.Reticle) do
									v203:Clone().Parent = v144;
								end;
								if l__MagnifierObjects__101 then
									if u77 then
										l__MagnifierObjects__101.Parent = v21;
										u78 = v23.MagnifierAimFOV * 2.361111111111111;
										v144.Size = UDim2.new(v23.Scope.ImageSize * v23.MagnifierAimFOV, 0, v23.Scope.ImageSize * v23.MagnifierAimFOV, 0);
									else
										l__MagnifierObjects__101.Parent = nil;
										u78 = v23.AimFOV;
										v144.Size = UDim2.new(v23.Scope.ImageSize, 0, v23.Scope.ImageSize, 0);
									end;
								else
									v144.Size = UDim2.new(v23.Scope.ImageSize, 0, v23.Scope.ImageSize, 0);
								end;
								if v90 then
									v144.ReticleTritium.ZIndex = 10;
								elseif u79 then
									v144.ReticleFiberOptic.ZIndex = 10;
								end;
							end;
							if l__AltScope__80 then
								for v204, v205 in pairs(v23.AltScope.Reticle) do
									v205:Clone().Parent = v145;
								end;
								v145.Size = UDim2.new(v23.AltScope.ImageSize, 0, v23.AltScope.ImageSize, 0);
							end;
							if l__Keys__81.MouseButton2 and p24.aimingDisabled then
								p5:setAim(false);
							end;
							if not p24.Disposable then
								l__UI__21:updateAmmo(p24.mags, p24.totalMags);
							else
								l__UI__21:updateAmmo(0, 1);
							end;
							l__UI__21:updateFiremode(p24.fireMode.name);
						end;
						if not l__weapon__199 then
							u82 = 1;
							l__equipSpring__33.p = u82;
						end;
						if not l__isMain__24 then
							u40.C0 = v12;
							u42.C0 = v12;
						end;
						u40.C1 = v12;
						u42.C1 = v12;
						v22.leftArm.baseC0 = v138;
						v22.rightArm.baseC0 = v136;
						if p8 then
							if v21.Parent == l__realPlayer__25 then
								p24.Disposed = false;
								v21.Parent = p5.gearFolder.Folder;
							end;
							u44.Part0 = u38;
							u44.C0 = v127;
						else
							v21.Parent = p5.gearFolder.Folder;
						end;
						p5.equipping = false;
						u47 = true;
						if p5.aiming then
							local v206 = 1;
						else
							v206 = 0;
						end;
						p5.aimSpring.t = v206;
						if l__isMain__24 then
							l__Network__24:updateSendData("FireMode", u61);
						end;
					end);
				elseif not p25 and (not l__isMain__24 or u47 and not p5.unequipping) then
					p5.wasAiming = p5.aiming;
					p5.aimSpring.t = 0;
					p5.unequipping = true;
					p5.auto = false;
					p5.reloading = false;
					p5.glActive = false;
					p24.glActive = false;
					l__glSpring__35.t = 0;
					v109.t = 0;
					p24:stopFire();
					l__audioHandler__64:holster();
					l__equipSpring__33.t = 1;
					if l__isMain__24 and u62 then
						u75(false);
					end;
					l__mainSchedule__74:clear();
					l__mainSchedule__74:append(l__Animation__26:reset(v22, 0.75));
					if p24.inMag == 0 and l__Rocket__139 then
						for v207, v208 in pairs(l__Rocket__139:GetChildren()) do
							v208.Transparency = 1;
						end;
					end;
					l__mainSchedule__74:append(function()
						if p26 then
							u39.Size = p8 and Vector3.new(1, 2, 1) or Vector3.new(0.65, 3, 0.65);
							u41.Size = p8 and Vector3.new(1, 2, 1) or Vector3.new(0.65, 3, 0.65);
						else
							u39.Size = Vector3.new(1, 2, 1);
							u41.Size = Vector3.new(1, 2, 1);
						end;
						if p8 and not p24.Disposed then
							u44.Part0 = u37;
							u44.C0 = v131;
						else
							v21.Parent = l__realPlayer__25;
						end;
						p5.animating = false;
						u56 = false;
						u57 = false;
						if v119 then
							v122.Visible = false;
						end;
						p5.weapon = p26;
						if l__isMain__24 and not p26 then
							l__UI__21:updateAmmo(1, 1);
							l__UI__21:updateFiremode();
						end;
						if l__isMain__24 and l__Scope__76 then
							p24:deactivateScope();
							if l__AltScope__80 then
								p24:deactivateAltScope();
							end;
						end;
						l__equipSpring__33.t = 0;
						p5.unequipping = false;
						u47 = false;
					end);
				end;
				return u47;
			end;
			local l__vibrationSpring__83 = p5.vibrationSpring;
			function v26.setAim(p27, p28)
				if p28 then
					local v209 = 0.15;
				else
					v209 = 0.1;
				end;
				task.delay(v209 * (math.clamp(l__Weight__67, 9.8, 40) / 9.8), function()
					if p28 and l__Weight__67 < 10 then
						l__vibrationSpring__83:add(v68 / (v68 + 1) / 9);
					end;
				end);
				if not p5.nightvision then
					local v210 = p28;
				elseif not p28 then
					v210 = false;
				else
					if l__C_NVAim__97 then
						local v211 = true;
					else
						v211 = false;
					end;
					v210 = v211;
				end;
				p27:setRecoilMultipliers(v210, p5.nightvision);
			end;
			local u84 = 1.5;
			local u85 = 1.35;
			function v26.setRecoilMultipliers(p29, p30, p31)
				if not p30 then
					u84 = 1.5;
					u85 = 1.35;
					return;
				end;
				if p31 then
					u84 = 1;
					u85 = 1.25;
					return;
				end;
				u84 = 0.65;
				u85 = 1;
			end;
			local u86 = p8 and v39.thirdPerson or v39.firstPerson;
			function v26.playAnimation(p32, p33)
				if not p5.reloading and not p5.equipping then
					l__mainSchedule__74:clear();
					if p5.animating then
						l__mainSchedule__74:append(l__Animation__26:reset(v22, 0.05));
					end;
					if l__isMain__24 and p5.aiming then
						p5:setAim(false);
					end;
					p5.animating = true;
					p32:stopFire();
					l__mainSchedule__74:append(l__Animation__26:play(v22, u86[p33]));
					l__mainSchedule__74:append(function()
						l__mainSchedule__74:append(l__Animation__26:reset(v22, u86[p33].resetTime));
						if l__isMain__24 then
							l__mainSchedule__74:append(function()
								p5.animating = false;
								if l__Keys__81.MouseButton2 then
									p5:setAim(true);
								end;
							end);
						end;
					end);
				end;
			end;
			function v26.stopReload(p34)
				if p5.reloading then
					l__mainSchedule__74:clear();
					l__mainSchedule__74:append(l__Animation__26:reset(v22, 0.2));
					p5.reloading = false;
					p5.animating = false;
					if l__isMain__24 then
						l__mainSchedule__74:append(function()
							if l__Keys__81.MouseButton2 then
								p5:setAim(true);
							end;
						end);
					end;
				end;
			end;
			local u87 = l__glSpring__35.p;
			function v26.reload(p35)
				if not u56 and not p35.Disposable and not p35.buildable and not p5.equipping and not p5.reloading and (u87 < 0.01 and p35.mags > 0 or p35.glGrenades > 0) then
					if p5.animating then
						l__mainSchedule__74:clear();
						l__mainSchedule__74:append(l__Animation__26:reset(v22, 0.2));
					end;
					p5.animating = true;
					p5.reloading = true;
					if l__isMain__24 then
						l__Network__24:sendData("Reload", true);
						if p5.aiming then
							p5:setAim(false);
						end;
					end;
					p35:stopFire();
					l__audioHandler__64:reload();
					l__mainSchedule__74:append(l__Animation__26:play(v22, u86.reload));
					l__mainSchedule__74:append(function()
						if l__isMain__24 then
							if u87 < 0.01 then
								if p35.mags <= 0 then
									local v212 = 0;
								else
									v212 = l__MagSize__63;
								end;
								p35.inMag = v212;
								p35.mags = p35.mags - 1;
								l__UI__21:updateAmmo(p35.mags, p35.totalMags);
								l__UI__21:updateRadialWeaponMagazineAmounts(p35);
							else
								if p35.glGrenades <= 0 then
									local v213 = 0;
								else
									v213 = 1;
								end;
								u59 = v213;
								p35.glGrenades = p35.glGrenades - 1;
								l__UI__21:updateAmmo(p35.glGrenades, v62);
								l__UI__21:updateGLMagCount(p35);
								l__UI__21:updateRadialWeaponMagazineAmounts({
									isGL = true, 
									name = p35.grenadeLauncherName, 
									supplyCost = p35.grenadeLauncherSupplyCost, 
									mags = p35.glGrenades, 
									totalMags = v62
								});
							end;
						end;
						if v49 then
							for v214, v215 in pairs(v50) do
								for v216, v217 in pairs(v215) do
									v22[v217.Name].part.Transparency = 0;
									v22[v217.Name].baseTransparency = 0;
								end;
							end;
						end;
						if l__Slide__140 then
							v22.Slide.baseC0 = v142(0);
						end;
						if l__Rocket__139 then
							for v218, v219 in pairs(l__Rocket__139:GetChildren()) do
								v219.Transparency = 0;
							end;
						end;
						l__mainSchedule__74:append(l__Animation__26:resetLerps(v22, u86.reload.resetTime));
						l__mainSchedule__74:append(function()
							p5.reloading = false;
							p5.animating = false;
							if l__isMain__24 and l__Keys__81.MouseButton2 then
								p5:setAim(true);
							end;
						end);
					end);
				end;
			end;
			local l__IsMedkit__88 = v23.IsMedkit;
			function v26.setFire(p36, p37)
				if u45 == p37 then
					return;
				end;
				if not p36.fireMode then
					return;
				end;
				if p37 and not p5.animating and not p36.buildable then
					u66 = math.clamp(u87 < 0.01 and (os.clock() - u48) * p36.firemodeRPS or (os.clock() - u48) * 1, 0, u87 < 0.01 and math.min(p36.inMag, 1) or math.min(u59, 1));
					u68 = math.clamp(u87 < 0.01 and p36.fireMode.minShots or 1, 0, u87 < 0.01 and p36.inMag or u59);
					u67 = math.clamp(u87 < 0.01 and p36.fireMode.maxShots or 1, 0, u87 < 0.01 and p36.inMag or u59);
				end;
				u45 = p37;
				if l__isMain__24 then
					l__Network__24:sendData("Fire", u45 and u67 > 0);
					l__audioHandler__64:pullTrigger(not p37);
					if p36.buildable then
						if u63 and p36.inMag > 0 then
							p36:buildObject();
							p36.inMag = p36.inMag - 1;
							if p36.inMag == 0 then
								p5:equip(0);
							end;
						end;
						return;
					end;
					if l__IsMedkit__88 and p37 then
						p36:medkitHeal();
					end;
					if p5.sprinting then
						p5:setSprint(false);
					end;
					if p5.tacticalPacing then
						p5:setTacPace(false);
					end;
				end;
			end;
			function v26.medkitHeal(p38)
				local v220 = workspace:Raycast(u54, u55 * 10, p1.PlayerModule.medicalRaycastParams);
				if v220 then
					local v221 = l__PlayerList__27[v220.Instance.Name];
					if v221 and v221.team == u8.team and not v221.dead and not v221.incapped then
						u8:heal(v221.name, 25);
					end;
				end;
			end;
			local u89 = nil;
			function v26.buildObject(p39)
				l__Network__24:sendData("BuildObject", u8.team, "AmmoSource", p39.buildableBuildObject, CFrame.lookAt(u89.Position, u89.Position + u89.Normal), p39.index);
			end;
			function v26.nextFiremode(p40)
				if not u45 then
					p40:setFiremode(u61 % #v43 + 1);
				end;
			end;
			local u90 = v47;
			function v26.setFiremode(p41, p42)
				u61 = p42;
				p41.fireMode = v43[p42];
				if not p41.fireMode then
					return;
				end;
				p41.firemodeRPS = p41.fireMode.rps;
				u90 = 1 / p41.firemodeRPS;
				if l__isMain__24 then
					l__audioHandler__64:switchFiremode();
					l__Network__24:updateSendData("FireMode", u61);
					l__UI__21:updateFiremode(p41.fireMode.name);
				end;
			end;
			function v26.toggleBipod(p43, p44)
				if l__BipodAttachmentSetup__72 and p44 then
					p43.bipod = true;
					if l__BipodDeployed__73 then
						for v222, v223 in pairs(l__BipodDeployed__73:GetDescendants()) do
							if v223:IsA("BasePart") then
								v223.Transparency = 0;
							end;
						end;
					end;
					if l__BipodRetracted__74 then
						for v224, v225 in pairs(l__BipodRetracted__74:GetDescendants()) do
							if v225:IsA("BasePart") then
								v225.Transparency = 1;
							end;
						end;
						return;
					end;
				else
					p43.bipod = false;
					p43.bipodMounted = false;
					if l__BipodDeployed__73 then
						for v226, v227 in pairs(l__BipodDeployed__73:GetDescendants()) do
							if v227:IsA("BasePart") then
								v227.Transparency = 1;
							end;
						end;
					end;
					if l__BipodRetracted__74 then
						for v228, v229 in pairs(l__BipodRetracted__74:GetDescendants()) do
							if v229:IsA("BasePart") then
								v229.Transparency = 0;
							end;
						end;
					end;
				end;
			end;
			function v26.toggleAltAim(p45)
				if not l__C_AltAim__75 then
					v108.t = 0;
					return;
				end;
				if v108.t == 0 then
					local v230 = 1;
				else
					v230 = 0;
				end;
				v108.t = v230;
			end;
			function v26.toggleMagnifier(p46)
				if l__MagnifierObjects__101 and not u56 and not p5.equipping and not p5.reloading then
					if p5.animating then
						l__mainSchedule__74:clear();
						l__mainSchedule__74:append(l__Animation__26:reset(v22, 0.2));
					end;
					if l__isMain__24 and p5.aiming then
						p5:setAim(false);
					end;
					p5.animating = true;
					p5.equipping = true;
					u77 = not u77;
					p46:stopFire();
					l__audioHandler__64:toggleMagnifier(u77);
					l__mainSchedule__74:append(l__Animation__26:play(v22, u86.toggleMagnifier));
					l__mainSchedule__74:append(function()
						if u77 then
							l__MagnifierObjects__101.Parent = v21;
							u78 = v23.MagnifierAimFOV * 2.361111111111111;
							v144.Size = UDim2.new(v23.Scope.ImageSize * v23.MagnifierAimFOV, 0, v23.Scope.ImageSize * v23.MagnifierAimFOV, 0);
						else
							l__MagnifierObjects__101.Parent = nil;
							u78 = v23.AimFOV;
							v144.Size = UDim2.new(v23.Scope.ImageSize, 0, v23.Scope.ImageSize, 0);
						end;
						l__mainSchedule__74:append(l__Animation__26:resetLerps(v22, u86.toggleMagnifier.resetTime));
						l__mainSchedule__74:append(function()
							p5.animating = false;
							p5.equipping = false;
							if l__isMain__24 and l__Keys__81.MouseButton2 then
								p5:setAim(true);
							end;
						end);
					end);
				end;
			end;
			function v26.setNV(p47, p48, p49)
				if p49 then
					u73 = 2000;
					local v231 = p5.laser;
					if v231 then
						if not u71 then
							v231 = false;
							if l__Laser__93 == "Both" then
								v231 = true;
							end;
						else
							v231 = true;
						end;
					end;
					u72 = v231;
					if u69 and u69.VISLaserDot then
						u69.VISLaserDot.Enabled = false;
						if p8 and u69.VISFlare then
							u69.VISFlare.Enabled = false;
							return;
						end;
					end;
				else
					u73 = 300;
					u72 = false;
					if u69 and u69.VISLaserDot then
						u69.VISLaserDot.Enabled = p5.laser;
						if p8 and u69.VISFlare then
							u69.VISFlare.Enabled = p5.laser;
						end;
					end;
				end;
			end;
			function v26.setNVAim(p50, p51, p52)
				if l__C_NVAim__97 then
					p50:setRecoilMultipliers(p51, p52);
					return;
				end;
				l__aimSpring__27.t = 0;
				p50:setRecoilMultipliers(false, false);
			end;
			function v26.setGLActive(p53, p54)
				if not u45 and v107 then
					l__audioHandler__64:setEnvironmentSoundProperties(p54, p5.Layer);
					p53.glActive = p53.glPossible and p54 or false;
					if p53.glActive then
						local v232 = 1;
					else
						v232 = 0;
					end;
					l__glSpring__35.t = v232;
					if l__isMain__24 then
						if p54 then
							l__UI__21:updateAmmo(p53.glGrenades, v62);
							l__UI__21:updateFiremode("GrenadeLauncher");
							if l__GLSightUp__84 and l__GLSightDown__85 then
								if l__GLSightUp__84:IsA("BasePart") then
									l__GLSightUp__84.Transparency = 0;
								elseif l__GLSightUp__84:IsA("Model") then
									for v233, v234 in pairs(l__GLSightUp__84:GetChildren()) do
										if v234:IsA("BasePart") then
											v234.Transparency = 0;
										end;
									end;
								end;
								if l__GLSightDown__85:IsA("BasePart") then
									l__GLSightDown__85.Transparency = 1;
								elseif l__GLSightDown__85:IsA("Model") then
									for v235, v236 in pairs(l__GLSightDown__85:GetChildren()) do
										if v236:IsA("BasePart") then
											v236.Transparency = 1;
										end;
									end;
								end;
							end;
						else
							if not p53.Disposable then
								l__UI__21:updateAmmo(p53.mags, p53.totalMags);
							else
								l__UI__21:updateAmmo(0, 1);
							end;
							l__UI__21:updateFiremode(p53.fireMode.name);
							if l__GLSightUp__84 and l__GLSightDown__85 then
								if l__GLSightUp__84:IsA("BasePart") then
									l__GLSightUp__84.Transparency = 1;
								elseif l__GLSightUp__84:IsA("Model") then
									for v237, v238 in pairs(l__GLSightUp__84:GetChildren()) do
										if v238:IsA("BasePart") then
											v238.Transparency = 1;
										end;
									end;
								end;
								if l__GLSightDown__85:IsA("BasePart") then
									l__GLSightDown__85.Transparency = 0;
								elseif l__GLSightDown__85:IsA("Model") then
									for v239, v240 in pairs(l__GLSightDown__85:GetChildren()) do
										if v240:IsA("BasePart") then
											v240.Transparency = 0;
										end;
									end;
								end;
							end;
						end;
					end;
					if v161 and v162 then
						if p54 then
							v36:append(function(p55)
								if u87 > 1 then
									local v241 = v161(1);
									v22.leftArm.weld.C0 = v241;
									v22.leftArm.baseC0 = v241;
									return true;
								end;
								v22.leftArm.weld.C0 = v161(u87);
								v22.leftArm.baseC0 = v161(u87);
								return false;
							end);
						else
							v36:append(function(p56)
								local v242 = 1 - u87;
								if v242 > 1 then
									local v243 = v162(1);
									v22.leftArm.weld.C0 = v243;
									v22.leftArm.baseC0 = v243;
									return true;
								end;
								v22.leftArm.weld.C0 = v162(v242);
								v22.leftArm.baseC0 = v162(v242);
								return false;
							end);
						end;
					end;
					if v76 then
						v109.t = l__glSpring__35.t;
						return;
					end;
					v109.t = 0;
				end;
			end;
			local u91 = 1;
			function v26.changeGLSegment(p57, p58)
				if v109.t == 1 and l__C_GLAimSegments__78 and l__aimSpring__27.t == 1 then
					if p58 > 0 and u91 ~= v80 then
						u91 = u91 + 1;
					elseif p58 < 0 and u91 ~= 1 then
						u91 = u91 - 1;
					end;
					if l__isMain__24 then
						l__UI__21:displayRange(v82[u91]);
					end;
					l__TweenService__5:Create(v114, v13, {
						Value = v81[u91]
					}):Play();
					if l__GLSegmentModelPositions__79 then
						local v244 = {
							C0 = v83[u91]
						};
						v115.baseC0 = v244.C0;
						l__TweenService__5:Create(v115.weld, v13, v244):Play();
					end;
				end;
			end;
			local u92 = v48 / 3;
			local u93 = l__stanceSpring__32.p;
			local u94 = false;
			local l__PanMagazine__95 = v22.PanMagazine;
			local l__SlideLock__96 = v23.SlideLock;
			local l__OpenBolt__97 = v23.OpenBolt;
			local function u98()
				for v245, v246 in pairs(v50) do
					for v247, v248 in pairs(v246) do
						v22[v248.Name].part.Transparency = 1;
						v22[v248.Name].baseTransparency = 1;
					end;
				end;
				for v249, v250 in pairs(v51) do
					if v249 < v26.inMag then
						for v251, v252 in pairs(v250) do
							v22[v252.Name].part.Transparency = 0;
							v22[v252.Name].baseTransparency = 0;
						end;
					end;
				end;
				task.wait(u92);
				for v253, v254 in pairs(v50) do
					if v253 < v26.inMag then
						for v255, v256 in pairs(v254) do
							v22[v256.Name].part.Transparency = 0;
							v22[v256.Name].baseTransparency = 0;
						end;
					end;
				end;
				for v257, v258 in pairs(v51) do
					for v259, v260 in pairs(v258) do
						v22[v260.Name].part.Transparency = 1;
						v22[v260.Name].baseTransparency = 1;
					end;
				end;
			end;
			local l__Round__99 = v23.Round;
			local l__GLRound__100 = v23.GLRound;
			local l__MuzzleVelocity__101 = v23.MuzzleVelocity;
			local l__GLMuzzleVelocity__102 = v23.GLMuzzleVelocity;
			local l__recoilPos__103 = p5.recoilPos;
			local l__RecoilBack__104 = v23.RecoilBack;
			local l__recoilRot__105 = p5.recoilRot;
			local l__RecoilRot__106 = v23.RecoilRot;
			local u107 = false;
			function v26.singleShot(p59, p60)
				if p59.bipodMounted then
					local v261 = 0.1;
				else
					v261 = (3 - u93 / 2) / 3;
				end;
				u48 = p60;
				v36:clear();
				u66 = u66 - 1;
				u67 = u67 - 1;
				u68 = u68 - 1;
				if u87 < 0.01 then
					if v65 then
						if u50 == v66 then
							u50 = 1;
							u94 = true;
						else
							u50 = u50 + 1;
							u94 = false;
						end;
					end;
					if l__PanMagazine__95 then
						v22.PanMagazine.weld.C0 = v22.PanMagazine.weld.C0:ToWorldSpace(u60);
					end;
					if l__Slide__140 then
						if p59.inMag == 1 and l__SlideLock__96 then
							v36:append(function(p61)
								u49 = u49 + p61;
								local v262 = u49 / u90;
								if not (v262 > 0.5) then
									local v263 = v142(v262);
									v22.Slide.weld.C0 = v263;
									if v141 then
										v141.C0 = v263;
									end;
									return false;
								end;
								local v264 = v142(1);
								v22.Slide.weld.C0 = v264;
								v22.Slide.baseC0 = v264;
								if v141 then
									v141.C0 = v264;
								end;
								u49 = 0;
								return true;
							end);
						else
							v36:append(function(p62)
								u49 = u49 + p62;
								local v265 = l__OpenBolt__97 and u49 / u90 or u49 / u90;
								if v265 > 1 then
									local v266 = v142(0);
									v22.Slide.weld.C0 = v266;
									v22.Slide.baseC0 = v266;
									if v141 then
										v141.C0 = v266;
									end;
									u49 = 0;
									return true;
								end;
								if not (p62 > 0.5) then
									local v267 = v142(v265);
									v22.Slide.weld.C0 = v267;
									if v141 then
										v141.C0 = v267;
									end;
									return false;
								end;
								p62 = 1 - p62;
								local v268 = v142(v265);
								v22.Slide.weld.C0 = v268;
								if v141 then
									v141.C0 = v268;
								end;
								return false;
							end);
						end;
					end;
				else
					u94 = true;
				end;
				if v49 then
					task.defer(u98);
				end;
				if l__OpenBolt__97 and u87 < 0.01 then
					task.wait(v48);
				end;
				if l__isMain__24 then
					local v269 = u87 < 0.01 and l__Muzzle__105.CFrame or l__GLMuzzle__106.CFrame;
					l__Projectiles__5:addProjectile(u36, u87 < 0.01 and l__Round__99 or l__GLRound__100, u94, v269.Position, v269.LookVector, u87 < 0.01 and l__MuzzleVelocity__101 or l__GLMuzzleVelocity__102, nil);
					p59.showMuzzleFlash = math.random(1, 10) <= 5;
					l__Network__24:sendData("ShowMuzzleFlash", p59.showMuzzleFlash);
					if u87 < 0.01 then
						p59.inMag = p59.inMag - 1;
					else
						u59 = u59 - 1;
					end;
					if l__Rocket__139 then
						for v270, v271 in pairs(l__Rocket__139:GetChildren()) do
							v271.Transparency = 1;
						end;
					end;
				end;
				u46 = math.clamp(u46 + 0.1, 0, 1);
				if not p5.aiming then
					local v272 = 50;
				else
					v272 = 45;
				end;
				l__recoilPos__103:add(Vector3.new(0, 0, 0.25 * l__lerp__16(1, 1.25, u46 ^ 2) * l__RecoilBack__104 * v272));
				if not p8 then
					l__vibrationSpring__83:add(not p5.aiming and 0.014 * l__lerp__16(1, 1.2, u46 ^ 2) or 0.01 * l__lerp__16(1, 1.2, u46 ^ 2));
				end;
				l__recoilRot__105:add(Vector3.new(0.008726646259971648 * (u85 * v261), (math.random() - 0.5) * 0.008726646259971648 * (u84 * v261), (math.random() - 0.5) * 0.008726646259971648) * l__RecoilRot__106 * 50 * l__lerp__16(1, 2.5, u46 ^ 2));
				if l__isMain__24 then
					p5.angleX = math.clamp(p5.angleX + math.rad(l__RecoilRot__106.X * (u85 * v261)), -1.3962634015954636, 1.3962634015954636);
				end;
				l__fxHandler__65:fire();
				l__audioHandler__64:fire();
				if u87 < 0.01 and u28[p59.fireMode.name] and not u107 then
					u107 = true;
					l__audioHandler__64:fullAutoFire(true);
				end;
				if p59.Disposable then
					p59.Disposed = true;
					if l__isMain__24 then
						l__UI__21:updateRadialWeaponMagazineAmounts(p59);
						p5:equip(0);
					end;
				end;
			end;
			local u108 = l__aimSpring__27.p;
			local u109 = l__sprintSpring__29.p;
			local u110 = l__tacPaceSpring__30.p;
			local u111 = v108.p;
			local u112 = v109.p;
			local u113 = l__nvAimSpring__28.p;
			local u114 = nil;
			local u115 = nil;
			local u116 = nil;
			local u117 = 0;
			local u118 = l__coverSpring__34.p;
			function v26.updateMain(p63, p64, p65)
				u53 = l__CurrentCamera__15.CFrame;
				u54 = u53.Position;
				u55 = u53.LookVector;
				u108 = l__aimSpring__27.p;
				u109 = l__sprintSpring__29.p;
				u82 = l__equipSpring__33.p;
				u110 = l__tacPaceSpring__30.p;
				u87 = l__glSpring__35.p;
				u111 = v108.p;
				u112 = v109.p;
				u113 = l__nvAimSpring__28.p;
				local v273 = u78 + (1.5 - u78) * u111;
				local v274 = v273 + (1.5 - v273) * u112;
				p5.aimFOV = v274 + (1.5 - v274) * u113 and 1.5;
				u114 = p5.rootCF:Inverse();
				u115 = p5.animationTime;
				u116 = p5.angleX;
				u117 = u110 + u118;
				if u67 >= 0 and (u45 or u68 > 0) then
					u66 = math.clamp(u66 + p65 * (u87 < 0.01 and p63.firemodeRPS or 1), 0, u67);
				end;
				if u117 > 0.01 then
					u66 = 0;
					u68 = 0;
				end;
				if not p5.reloading and u66 >= 1 and u118 < 0.01 and u110 < 0.01 and u109 * (1 - u108) < 0.01 and (u87 < 0.01 or u87 > 0.99) and (u87 < 0.01 and p63.inMag > 0 or u59 > 0) then
					for v275 = 1, math.min(math.floor(u66), u67, u87 < 0.01 and p63.inMag or u59) do
						p63:singleShot(p64);
					end;
				else
					u66 = math.clamp(u66, 0, 1);
				end;
				if 1 / p63.firemodeRPS < p64 - u48 and u107 then
					u107 = false;
					l__audioHandler__64:fullAutoFire(false);
				end;
				if p64 - u48 > 0.1 or not u45 then
					u46 = l__lerpTowards__29(u46, 0, p65 / 0.2);
				end;
			end;
			function v26.deactivateScope(p66)
				u57 = false;
				if v119 then
					v122.Visible = false;
				end;
				v144.Visible = false;
				for v276, v277 in pairs(v99) do
					if v277:IsA("BasePart") and v277.Name == "ADSImage" then
						v277.ADSDecal.Transparency = 1;
					end;
				end;
				if v103 and v100 then
					for v278, v279 in pairs(v99) do
						if not (not v279:IsA("BasePart")) or not (not v279:IsA("Decal")) or v279:IsA("Texture") then
							if v279.Name == "InsideTube" or v279.Name == "OutsideTube" then
								v279.Transparency = 0.7;
							elseif v279.Name == "RMRWhite" then
								v279.Transparency = 0.65;
							elseif v279.Name == "RMRLens" then
								v279.Transparency = 0.75;
							elseif not u43[v279] and not v279:FindFirstChild("StayTransparent") then
								v279.Transparency = 0;
							end;
							if v279:IsDescendantOf(v100) then
								if v279.Name == "Lens" and v279:FindFirstChild("LensTransparency") then
									v279.Transparency = v279.LensTransparency.Value;
								else
									v279.Transparency = 1;
								end;
							end;
						end;
					end;
					local v280, v281, v282 = pairs(v21:GetDescendants());
					while true do
						local v283, v284 = v280(v281, v282);
						if not v283 then
							break;
						end;
						if not (not u30[v284.Name]) and not (not v284:IsA("BasePart")) or not (not v284:IsA("Decal")) or v284:IsA("Texture") then
							v284.Transparency = 0;
						end;					
					end;
					if l__MagnifierObjects__101 then
						for v285, v286 in pairs(l__MagnifierObjects__101.Magnifier:GetDescendants()) do
							if not (not v286:IsA("BasePart")) or not (not v286:IsA("Decal")) or v286:IsA("Texture") then
								v286.Transparency = 0;
							end;
						end;
						for v287, v288 in pairs(l__MagnifierObjects__101.ADSMagnifier:GetDescendants()) do
							if not (not v288:IsA("BasePart")) or not (not v288:IsA("Decal")) or v288:IsA("Texture") then
								v288.Transparency = 1;
							end;
						end;
						return;
					end;
				else
					for v289, v290 in pairs(v21:GetDescendants()) do
						if not (not v290:IsA("BasePart")) or not (not v290:IsA("Decal")) or v290:IsA("Texture") then
							if v290.Name == "InsideTube" or v290.Name == "OutsideTube" then
								v290.Transparency = 0.7;
							elseif v290.Name == "RMRWhite" then
								v290.Transparency = 0.65;
							elseif v290.Name == "RMRLens" then
								v290.Transparency = 0.75;
							elseif not u43[v290] then
								v290.Transparency = 0;
							end;
							u39.Transparency = 0;
							u41.Transparency = 0;
						end;
					end;
				end;
			end;
			function v26.deactivateAltScope(p67)
				u58 = false;
				v145.Visible = false;
			end;
			local u119 = v90 and v23.ReticleTritiumAlt;
			function v26.updateScope(p68)
				if v23.MuzzleZeroAngle then
					local v291 = l__C_AimMuzzleZeroPivot__110 and l__C_AimMuzzleZeroPivot__110.CFrame * CFrame.Angles(math.rad(-v23.MuzzleZeroAngle), 0, 0) * CFrame.new(0, 0, v111) or (v21.C_Aim.CFrame * CFrame.Angles(math.rad(-v23.MuzzleZeroAngle), 0, 0) or v21.C_Aim.CFrame);
				else
					v291 = v21.C_Aim.CFrame;
				end;
				local v292 = l__CurrentCamera__15:WorldToViewportPoint(u52 + v291.LookVector * 1000);
				v143.Position = UDim2.new(0, v292.X, 0, v292.Y);
				v143.Rotation = -v21.C_Aim.Orientation.Z;
				if v121 then
					v120.CFrame = v121.CFrame * CFrame.Angles(0, 0, math.rad(-v21.C_Aim.Orientation.Z));
				end;
				if u119 then
					v144.ReticleTritiumAlt.ImageTransparency = u8.DarkAmount;
					v144.ReticleTritium.ImageTransparency = 1 - u8.DarkAmount;
				elseif v90 then
					v144.ReticleTritium.ImageTransparency = 1 - u8.DarkAmount;
				elseif u79 then
					v144.ReticleFiberOptic.ImageTransparency = u8.DarkAmount;
				end;
				if not p8 then
					if l__Scope__76 and u112 < 0.01 and u113 < 0.01 and u108 >= 0.99 and u111 < 0.99 then
						if not u57 then
							u57 = true;
							if v119 then
								v122.Visible = true;
							end;
							v144.Visible = true;
							for v293, v294 in pairs(v99) do
								if v294:IsA("BasePart") and v294.Name == "ADSImage" then
									v294.ADSDecal.Transparency = 0;
								end;
							end;
							if v103 and v100 then
								for v295, v296 in pairs(v99) do
									if not (not v296:IsA("BasePart")) or not (not v296:IsA("Decal")) or v296:IsA("Texture") then
										if v296:IsDescendantOf(v100) then
											if not v296:FindFirstChild("StayTransparent") then
												v296.Transparency = 0;
											end;
											if v296.Name == "Lens" and v296:FindFirstChild("LensTransparency") then
												v296.Transparency = v296.LensTransparency.Value;
											end;
										elseif not u43[v296] then
											v296.Transparency = 1;
										end;
									end;
								end;
								if not l__ShowAllWithScope__104 then
									local v297, v298, v299 = pairs(v21:GetDescendants());
									while true do
										local v300, v301 = v297(v298, v299);
										if not v300 then
											break;
										end;
										if not (not u30[v301.Name]) and not (not v301:IsA("BasePart")) or not (not v301:IsA("Decal")) or v301:IsA("Texture") then
											v301.Transparency = 1;
										end;									
									end;
								end;
								if l__MagnifierObjects__101 then
									for v302, v303 in pairs(l__MagnifierObjects__101.Magnifier:GetDescendants()) do
										if not (not v303:IsA("BasePart")) or not (not v303:IsA("Decal")) or v303:IsA("Texture") then
											v303.Transparency = 1;
										end;
									end;
									for v304, v305 in pairs(l__MagnifierObjects__101.ADSMagnifier:GetDescendants()) do
										if not (not v305:IsA("BasePart")) or not (not v305:IsA("Decal")) or v305:IsA("Texture") then
											v305.Transparency = 0;
										end;
									end;
								end;
							else
								for v306, v307 in pairs(v21:GetDescendants()) do
									if (not (not v307:IsA("BasePart")) or not (not v307:IsA("Decal")) or v307:IsA("Texture")) and (not u43[v307] or u31[v307.Name]) then
										v307.Transparency = 1;
									end;
								end;
								u39.Transparency = 1;
								u41.Transparency = 1;
							end;
						end;
					elseif u57 then
						p68:deactivateScope();
					end;
					if l__AltScope__80 and u112 < 0.1 and u113 < 0.1 and u108 >= 0.9 and u111 >= 0.9 then
						if not u58 then
							u58 = true;
							v145.Visible = true;
							return;
						end;
					elseif u58 then
						p68:deactivateAltScope();
					end;
				end;
			end;
			local u120 = l__leanSpring__31.p;
			local l__bobSpring__121 = p5.bobSpring;
			local u122 = v70 * v68 / 2;
			local l__jumpOffsetSpring__123 = p5.jumpOffsetSpring;
			local l__walkOffsetSpring__124 = p5.walkOffsetSpring;
			local u125 = v11;
			local u126 = v11;
			local u127 = 0;
			local l__swingSpring__128 = p5.swingSpring;
			local u129 = v68 * 30;
			function v26.updateRig(p69, p70, p71)
				if not u47 then
					return;
				end;
				u93 = l__stanceSpring__32.pRaw;
				u120 = l__leanSpring__31.pRaw;
				u118 = l__coverSpring__34.p;
				if not p8 then
					local l__p__308 = l__bobSpring__121.p;
					local l__rootCF__309 = p5.rootCF;
					u51 = p5.mainCF;
					u52 = u51.Position;
					local l__vibration__310 = p5.vibration;
					local v311 = u109 * (1 - u108);
					local v312 = 1 - (1 - (1 - u109) * (1 - u110)) * (1 - u108) * 0.4;
					local v313 = l__smoothLerp__32(-1, 1, (-u116 / 1.4835298641951802 + 1) / 2);
					local v314 = l__lerp__16(Vector3.new(0.02 * v313, 0.1 * v313, 0.1 * v313) * Vector3.new(1 - u108, 1 - u108, 0), Vector3.new(0.04 * (-(v313 - 0.5) * 2) - 0.05, 0.05 * v313, 0.1 * v313), (l__lerp__16(0, 1, 1 - (v312 - 0.6) / 0.4)));
					if p69.bipodMounted then
						local v315 = 0.01;
					else
						v315 = l__smoothLerp__32(1, l__smoothLerp__32(0.5, 0.15, math.clamp(u93 - 1, 0, 1)), math.clamp(u93, 0, 1)) + p5.suppressionValue + 60 / math.clamp(p5.stamina, 5, 60) / 4.5;
					end;
					local v316 = (math.noise((p70 - v8) * 17) + math.noise((p70 - v8) * 12 + 21.5)) / 15 * v315 * (0.0030543261909900766 * v69);
					local v317 = (math.noise((p70 - v8) * 17 + 34.275) + math.noise((p70 - v8) * 12 + 34.275 + 5.5)) / 15 * v315 * (0.003926990816987242 * v69);
					local v318 = (math.noise((p70 - v8) * 1.5) + math.noise((p70 - v8) * 2 + 21.5)) / 5 * v315 * (0.007853981633974483 * u122);
					local v319 = (math.noise((p70 - v8) * 1.5 + 34.275) + math.noise((p70 - v8) * 2 + 34.275 + 5.5)) / 5 * v315 * (0.008726646259971648 * u122);
					local v320 = 0.5 * l__lerp__16(1, 1.8, u108);
					local v321 = 0.7 * l__lerp__16(1, 1.8, u108);
					local v322 = 0.5 * l__lerp__16(1, 0.2, 1 - (1 - u108) * (1 - u109));
					local v323 = (l__fromAxisAngle__14(l__smoothLerp__32(Vector3.new(math.sin(u115 * 2) * v321, math.sin(u115) * v321, 0), Vector3.new(math.sin(u115 * 2) * v320, math.sin(u115) * 1 / v68 * 3 * l__lerp__16(1, 1.8, u108), 0), v311) * l__p__308) + Vector3.new(math.sin(u115) * v322 * (1 + v311 * 2), math.cos(u115 * 2) * v322, 0) * l__p__308) * l__fromAxisAngle__14(l__recoilRot__105.p + l__vibration__310 * Vector3.new(0.1, 0.1, -7.6) + l__jumpOffsetSpring__123.p + l__walkOffsetSpring__124.p + Vector3.new(0, 0, u120 * (-0.3490658503988659 * u8.leanMultiplier))) + (l__vibration__310 * Vector3.new(1, 1, 0) + l__recoilPos__103.p);
					local v324 = l__lerp__16(l__lerp__16(v11, v11, math.clamp(u93, 0, 1)), Vector3.new(0, 0, -0.15), math.clamp(u93 - 1, 0, 1));
					local v325 = CFrame.new(v324.X, -0.1 * u87 + v324.Y, v324.Z) * v22.Main.weld.C0;
					if not p5.animating then
						v325 = v325:Lerp(v130, u110):Lerp(v129, u109);
					end;
					if not v112 then
						local v326 = v325:Lerp(v128:Lerp(v117, u111):Lerp(v114.Value, u112):Lerp(v116, u113), u108);
					elseif u108 < 0.9 then
						v326 = v325:Lerp(v128:Lerp(v117, u111):Lerp(v114.Value, u112):Lerp(v116, u113), u108);
					else
						v326 = v325:Lerp(v112:Lerp(v117, u111):Lerp(v114.Value, u112):Lerp(v116, u113), u108);
					end;
					local v327 = v326:Lerp(v113, u118):Lerp(v131, u82);
					local l__Position__328 = (u51 * v124).Position;
					local v329 = workspace:Raycast(l__Position__328, (u51 * v123).LookVector * v46, v17);
					local v330 = v329 and (l__Position__328 - v329.Position).Magnitude or v46;
					if v329 then
						local v331 = true;
					else
						v331 = false;
					end;
					if v331 ~= p69.weaponCoverAmountTriggered then
						p69.weaponCoverAmountTriggered = v331;
						if v331 then
							if p5.aiming then
								p5.wasAiming = true;
							end;
							p5:setAim(false);
						elseif p5.wasAiming then
							p5:setAim(true);
							p5.wasAiming = false;
						end;
					end;
					if v329 and v330 <= v46 / 1.5 and not p5.reloading then
						local v332 = 1;
					else
						v332 = 0;
					end;
					l__coverSpring__34.t = v332;
					if l__coverSpring__34.t ~= l__coverSpring__34.t then
						l__Network__24:updateSendData("Cover", l__coverSpring__34.t);
						if l__coverSpring__34.t == 1 and u45 then
							p69:setFire(false);
						end;
					end;
					if not p69.bipodMounted and p69.bipod and p5.onGround and l__coverSpring__34.t == 0 then
						for v333 = 0, 0.2, 0.1 do
							local v334 = u51.LookVector * v333;
							local v335 = workspace:Raycast(l__BipodAttachmentSetup__72.BipodEnd1.WorldPosition + Vector3.new(0, 0.5, 0) + v334, -Vector3.new(0, 0.6, 0), v17);
							local v336 = workspace:Raycast(l__BipodAttachmentSetup__72.BipodEnd2.WorldPosition + Vector3.new(0, 0.5, 0) + v334, -Vector3.new(0, 0.6, 0), v17);
							if v335 and v336 then
								local v337 = (v335.Normal + v336.Normal) / 2;
								local v338 = (v335.Position + v336.Position) / 2;
								local v339 = l__rootCF__309.Position.Y - v338.Y;
								if v337:Dot(Vector3.new(0, 1, 0)) > 0.707 and not (v339 > 0.2) and not (v339 < -0.2) then
									p69.bipodMounted = true;
									p5:updateWalkSpeed(0.25);
									u125 = v338;
									u126 = v337;
									u127 = p5.angleX;
									p5.audioHandler:playFootstepSound(p5.groundMaterial, "Stopped", p5.inCrops);
									break;
								end;
							end;
						end;
					end;
					if p69.bipod and p69.bipodMounted then
						u51 = CFrame.fromMatrix(u125, u51.LookVector:Cross(Vector3.new(0, 1, 0)), Vector3.new(0, 1, 0)) * p5.mainRotXZ;
						v327 = v118;
					end;
					local v340 = u114 * u51 * CFrame.new(v314.X + v316 * 1.25 + v318 * v71, v314.Y + v317 * 1.25 + v319 * v71, v314.Z) * l__fromAxisAngle__14(0, 0, u108 * 0) * l__fromAxisAngle__14(-u116 * (1 - v312), 0, 0) * l__fromAxisAngle__14(l__swingSpring__128.v * Vector3.new(0.0005, 0.0005, 0)) * ((l__coverSpring__34.t == 1 or v329 == nil) and v12 or CFrame.new(0, -(v46 - v330) / 2, v46 - v330) * l__fromAxisAngle__14(0, 0, (v46 - v330) / 4)) * v323 * v327 * CFrame.Angles(-math.rad(p5.freeAimX * u129), -math.rad(p5.freeAimY * u129), 0) * CFrame.Angles(v316, v317, 0) * CFrame.Angles(v318, v319, 0);
					u44.C0 = v340;
					u40.C0 = v340 * v22.leftArm.weld.C0;
					u42.C0 = v340 * v22.rightArm.weld.C0;
					if l__Scope__76 or l__AltScope__80 then
						p69:updateScope();
					end;
					if u62 and u62.PrimaryPart then
						u89 = workspace:Raycast(u52, u51.LookVector * 5, v17);
						if u89 then
							u62:SetPrimaryPartCFrame(CFrame.lookAt(u89.Position, u89.Position + u89.Normal) * CFrame.Angles(-1.5707963267948966, 0, 0) * CFrame.new(0, u62.PrimaryPart.Size.Y / 2, 0));
						else
							u62:SetPrimaryPartCFrame(CFrame.new(u52 - u51.LookVector * -5));
						end;
						v40(u89 and u89.Normal:Dot(Vector3.new(0, 1, 0)) > 0.707);
					end;
				else
					local v341 = nil;
					local v342 = nil;
					local l__rootCF__343 = p5.rootCF;
					u51 = CFrame.new(u37.CFrame * Vector3.new(0, 1.5, 0)) * (l__rootCF__343 - l__rootCF__343.Position) * l__fromAxisAngle__14(u116 * (1 - u109 * (1 - u108)), 0, 0);
					u52 = u51.Position;
					local v344 = u114 * u51:Lerp(u37.CFrame, u82);
					local v345 = v12;
					if u117 > 0 and not p5.reloading then
						v345 = v345:Lerp(v130, u117);
					end;
					if u109 > 0 and not p5.reloading then
						v345 = v345:Lerp(v129, u109);
					end;
					if u108 > 0 then
						v345 = v345:Lerp(v128, u108);
					end;
					if u82 > 0 then
						v345 = v345:Lerp(v131, u82);
					end;
					local v346 = 0.007 * (1 + 0.8 * u108);
					local v347 = v344 * l__fromAxisAngle__14(0, 0, -(u108 * 0.3490658503988659) + u120 * (-0.3490658503988659 * u8.leanMultiplier)) * l__fromAxisAngle__14((Vector3.new(math.sin(u115 * 2) * v346, math.sin(u115) * v346, 0))) * CFrame.new(l__recoilPos__103.p + Vector3.new(0, -0.1 * u87, 0)) * l__fromAxisAngle__14(l__recoilRot__105.p + Vector3.new(0.17453292519943295 * u87, 0, 0)) * v345;
					u44.C0 = v347;
					local v348 = u114 * u37.CFrame;
					local v349 = v347 * v22.leftArm.weld.C0.Position;
					local v350 = v347 * v22.rightArm.weld.C0.Position;
					local v351 = CFrame.new(v350, 2 * v350 - v348 * Vector3.new(1.5, 0.5, 0));
					v341 = CFrame.new(v349, 2 * v349 - v348 * Vector3.new(-1.5, 0.5, 0)) * u33 * CFrame.new(0, 1.5, 0);
					v342 = v351 * u33 * CFrame.new(0, 1.5, 0);
					if l__isMain__24 then
						u40.C0 = v341;
						u42.C0 = v342;
					else
						u40.Transform = v341;
						u42.Transform = v342;
					end;
				end;
				v36:update();
			end;
			return v26;
		end;
	end
};
return u1;
