-- Decompiled with the Synapse X Luau decompiler.

local u1 = {
	initialize = function(p1)
		local v1 = nil;
		local l__Utility__2 = p1.Utility;
		local l__CollectionService__3 = game:GetService("CollectionService");
		local l__ReplicatedStorage__4 = game:GetService("ReplicatedStorage");
		local l__LocalPlayer__5 = game:GetService("Players").LocalPlayer;
		local l__Mathf__6 = l__Utility__2.Mathf;
		local l__BindableScheduler__7 = l__Utility__2.BindableScheduler;
		local v8 = NumberSequence.new(0);
		local v9 = NumberSequence.new(1);
		local v10 = CFrame.new(0, -100, 0);
		local v11 = l__BindableScheduler__7.new(50);
		local v12 = l__BindableScheduler__7.new(1000);
		local v13 = l__CollectionService__3:GetTagged("ProjectileIgnoreList");
		local v14 = {};
		for v15, v16 in pairs(v13) do
			v14[v16] = true;
		end;
		local v17 = RaycastParams.new();
		v17.FilterDescendantsInstances = v13;
		v17.FilterType = Enum.RaycastFilterType.Blacklist;
		local u2 = v13;
		l__CollectionService__3:GetInstanceAddedSignal("ProjectileIgnoreList"):Connect(function(p2)
			if not v14[p2] then
				v14[p2] = true;
				table.insert(u2, p2);
				v17.FilterDescendantsInstances = u2;
			end;
		end);
		l__CollectionService__3:GetInstanceRemovedSignal("ProjectileIgnoreList"):Connect(function(p3)
			if v14[p3] then
				v14[p3] = nil;
				table.clear(u2);
				for v18 in pairs(v14) do
					table.insert(u2, v18);
				end;
				v17.FilterDescendantsInstances = u2;
			end;
		end);
		local u3 = nil;
		local u4 = {};
		local l__GameSettings__5 = p1.ServerDataConstants.GameSettings;
		local u6 = {};
		local u7 = {};
		local u8 = nil;
		local u9 = {};
		local u10 = {};
		local u11 = {};
		local u12 = nil;
		local u13 = nil;
		local u14 = {};
		local u15 = nil;
		local u16 = nil;
		local u17 = nil;
		local u18 = nil;
		local u19 = nil;
		local u20 = nil;
		v1 = function()
			u3 = l__ReplicatedStorage__4.Events.AddProjectile;
			for v19, v20 in pairs(workspace.TerrainParts:GetDescendants()) do
				if v20:IsA("BasePart") then
					u4[v20] = true;
				end;
			end;
			for v21, v22 in pairs(l__GameSettings__5.Ballistics.Penetration) do
				u6[v21] = v22 / 288;
			end;
			for v23, v24 in pairs(l__GameSettings__5.Ballistics.Ricochet) do
				u7[v23] = v24;
			end;
			u3.OnClientEvent:Connect(function(p4, p5, p6, p7, p8, p9)
				u1:addProjectile(p4, p5, p6, p7.Position, p7.LookVector, p8, p9);
			end);
			u8 = l__ReplicatedStorage__4.Events.ProjectileHit;
			for v25, v26 in pairs(l__ReplicatedStorage__4.Assets.Tracers:GetChildren()) do
				u9[v26.Name .. "C"] = {};
				u9[v26.Name .. "G"] = {};
			end;
			for v27, v28 in pairs(l__ReplicatedStorage__4.Assets.TracerImages.Team1:GetChildren()) do
				u10[v27] = v28.Value;
			end;
			for v29, v30 in pairs(l__ReplicatedStorage__4.Assets.TracerImages.Team2:GetChildren()) do
				u11[v29] = v30.Value;
			end;
			u12 = #u10;
			u13 = #u11;
			local v31, v32, v33 = pairs(p1.ServerDataConstants.ProjectilesData);
			while true do
				local v34, v35 = v31(v32, v33);
				if not v34 then
					break;
				end;
				local v36 = {};
				for v37, v38 in pairs(v35) do
					v36[v37] = v38;
				end;
				local v39 = {
					projectileLength = v36.ProjectileLength / 304.8
				};
				local v40 = v36.ProjectileDiameter / 25.4;
				v39.mass = v36.Mass / 453.6;
				v39.whizType = v36.WhizType;
				v39.explode = v36.Explode;
				v39.explodeRadius = v36.ExplosionKillRadius;
				local l__Tracer__41 = v36.Tracer;
				v39.clientTracerType = l__Tracer__41 .. "C";
				v39.serverTracerType = l__Tracer__41 .. "G";
				v39.clientTracerTemplate = l__ReplicatedStorage__4.Assets.Tracers[l__Tracer__41].Client[l__Tracer__41];
				v39.globalTracerTemplate = l__ReplicatedStorage__4.Assets.Tracers[l__Tracer__41].Global[l__Tracer__41];
				if v39.clientTracerTemplate:FindFirstChild("Propellant") then
					local v42 = true;
				else
					v42 = false;
				end;
				v39.clientPropellantFX = v42;
				if v39.globalTracerTemplate:FindFirstChild("Propellant") then
					local v43 = true;
				else
					v43 = false;
				end;
				v39.globalPropellantFX = v43;
				v39.UXOTemplate = l__ReplicatedStorage__4.Assets.UXO:FindFirstChild(l__Tracer__41) and nil;
				v39.suppressVal = v36.SuppressionVal / 40;
				v39.suppressDistance = v36.SuppressionDistance;
				v39.armingDistance = v36.ArmingDistance;
				v39.fuze = v36.Fuze and 0;
				v39.burnTime = v36.BurnTime and 0;
				v39.rocketMotorThrust = v36.RocketMotorThrust and 0;
				v39.rocketMotorEnableDistance = v36.RocketMotorEnableDistance and 0;
				local v44 = v36.OgiveRadius / v40;
				v39.bulletCoefficient = v39.mass / v40 ^ 2 / (2 / v44 * math.sqrt((v44 * 4 - 1) / v44)) * 0.5;
				u14[v34] = v39;			
			end;
			u15 = workspace.Ignore;
			u16 = u15.Particles;
			u17 = u15.ParticleOrigin;
			u2 = l__CollectionService__3:GetTagged("ProjectileIgnoreList");
			for v45, v46 in pairs(u2) do
				v14[v46] = true;
			end;
			u18 = l__GameSettings__5.StudsPerFeet;
			u19 = 32.17405 * u18;
			u20 = Vector3.new(0, -u19, 0);
		end;
		if not game:IsLoaded() then
			game.Loaded:Connect(v1);
		else
			v1();
		end;
		local l__CurrentCamera__47 = workspace.CurrentCamera;
		local v48 = RaycastParams.new();
		v48.FilterType = Enum.RaycastFilterType.Whitelist;
		u1.projectileRayParams = v17;
		local l__PlayerList__21 = p1.PlayerList;
		local u22 = 1;
		local u23 = l__CurrentCamera__47.CFrame.Position;
		local u24 = nil;
		local l__Audio__25 = p1.Audio;
		local l__ProjectileMaterialValues__26 = p1.ProjectileMaterialValues;
		local l__MaterialsTable__27 = p1.MaterialsTable;
		local l__FX__28 = p1.FX;
		local l__MaterialSharesFX__29 = p1.MaterialSharesFX;
		local function u30(p10, p11)
			local v49 = p10:Clone();
			if v49.ClassName == "Model" then
				v49:SetPrimaryPartCFrame(p11);
			else
				v49.CFrame = p11;
			end;
			v49.Parent = u16;
			task.delay(5, function()
				v49:Destroy();
			end);
		end;
		function u1.addProjectile(p12, p13, p14, p15, p16, p17, p18, p19)
			local v50 = l__PlayerList__21[p13.Name];
			if not v50 then
				return;
			end;
			local l__isMain__51 = v50.isMain;
			local v52 = u14[p14];
			local v53 = l__isMain__51 and v52.clientTracerType or v52.serverTracerType;
			local l__explodeRadius__54 = v52.explodeRadius;
			local l__fuze__55 = v52.fuze;
			local v56 = os.clock();
			local v57 = nil;
			local v58 = l__isMain__51 and v52.clientPropellantFX or v52.globalPropellantFX;
			local v59 = nil;
			local v60 = nil;
			local v61 = nil;
			if l__isMain__51 then
				if not p19 then
					u22 = u22 % 100000 + 1;
					p19 = u22;
				end;
				u3:FireServer(p14, p18, p15, CFrame.lookAt(p16, p16 + p17), p19);
			end;
			local v62 = #u9[v53];
			if p15 then
				if v62 == 0 then
					local v63 = (l__isMain__51 and v52.clientTracerTemplate or v52.globalTracerTemplate):Clone();
					local l__ClassName__64 = v63.ClassName;
					v59 = v58 and v63.Propellant;
					if nil == "Beam" then
						v60 = Instance.new("Attachment");
						v60.Parent = u17;
						v61 = Instance.new("Attachment");
						v61.Parent = u17;
						(nil).Attachment0 = v60;
						(nil).Attachment1 = v61;
						(nil).Transparency = v8;
						(nil).Parent = u15.Tracers;
					elseif nil == "BillboardGui" then
						v60 = Instance.new("Attachment");
						v60.Parent = u17;
						(nil).Enabled = true;
						(nil).Parent = v60;
					else
						(nil).Parent = u15.Tracers;
					end;
					v57 = {
						object = nil, 
						class = nil
					};
				else
					local v65 = table.remove(u9[v53], v62);
					local l__class__66 = v65.class;
					v59 = v58 and v65.object.Propellant;
					if nil == "Beam" then
						v60 = (nil).Attachment0;
						v61 = (nil).Attachment1;
						(nil).Transparency = v8;
					elseif nil == "BillboardGui" then
						v60 = (nil).Parent;
						(nil).Enabled = true;
					end;
				end;
				if nil == "Beam" then
					if v50.team == 1 then
						(nil).Texture = u10[math.random(1, u12)];
					else
						(nil).Texture = u11[math.random(1, u13)];
					end;
				end;
			end;
			local v67 = {
				hasRicocheted = false, 
				hasPenetrated = false
			};
			if not l__isMain__51 then
				local u31 = nil;
				local u32 = false;
				local u33 = nil;
				local u34 = nil;
				local u35 = false;
				v50.projectiles[p19] = function(p20, p21, p22, p23, p24, p25, p26, p27, p28)
					u31 = {
						Instance = p20, 
						Normal = p21, 
						Position = p22
					};
					u32 = p25;
					u33 = p23;
					u34 = p24;
					u35 = p26;
					v67.hasRicocheted = p27;
					v67.hasPenetrated = p28;
				end;
			end;
			local u36 = nil;
			local u37 = nil;
			local u38 = p16;
			local u39 = v56;
			local u40 = nil;
			local u41 = p18;
			local u42 = p17 * p18 * u18;
			local l__burnTime__43 = v52.burnTime;
			local u44 = 0;
			local u45 = false;
			local u46 = 0;
			local u47 = v52.rocketMotorEnableDistance;
			local l__rocketMotorThrust__48 = v52.rocketMotorThrust;
			local u49 = p18 * u18;
			local u50 = v52.bulletCoefficient;
			local u51 = nil;
			local u52 = not l__isMain__51;
			local u53 = false;
			local l__whizType__54 = v52.whizType;
			local u55 = false;
			local u56 = l__fuze__55 > 0;
			local u57 = nil;
			local u58 = nil;
			local u59 = false;
			local l__explode__60 = v52.explode;
			local l__armingDistance__61 = v52.armingDistance;
			local u62 = v52.mass * 0.03108095;
			local l__projectileLength__63 = v52.projectileLength;
			local u64 = l__explodeRadius__54 >= 20;
			local u65 = l__explodeRadius__54 * 6.67;
			local u66 = l__explodeRadius__54 * 2;
			local l__UXOTemplate__67 = v52.UXOTemplate;
			local u68 = nil;
			u68 = (l__isMain__51 and v12 or v11):Connect(function(p29)
				local v68 = u23 - u38;
				local l__Magnitude__69 = v68.Magnitude;
				local v70 = p29 - u39;
				if not l__isMain__51 and v70 < 1 / (60 - math.clamp(l__Magnitude__69 * 0.025, 0, 30)) and not u40 then
					return false;
				end;
				local v71 = false;
				local v72 = false;
				local v73 = p29 - v56;
				u39 = p29;
				u41 = u42.Magnitude;
				if l__burnTime__43 < v73 then
					u44 = 0;
				elseif not u45 and u47 < u46 then
					u44 = l__rocketMotorThrust__48;
					u45 = true;
				end;
				local v74 = 0.006707 * u41 - 5.517273;
				if u41 < 1000 then
					v74 = 0.00119 * u41;
				end;
				u42 = u42 + (-u42.Unit * (v74 * 32 * u18 / u50 - u44) + u20) * v70;
				u41 = u42.Magnitude;
				local v75 = u41 / u49;
				u46 = u46 + u41 * v70;
				local v76 = u38 + u42 * v70;
				local v77 = v76 - u38;
				if l__isMain__51 then
					u40 = workspace:Raycast(u38, v77, v17);
				end;
				u51 = v76;
				if u52 and not u53 then
					local l__X__78 = v77.X;
					local l__Y__79 = v77.Y;
					local l__Z__80 = v77.Z;
					local l__X__81 = v68.X;
					local l__Y__82 = v68.Y;
					local l__Z__83 = v68.Z;
					local v84 = l__X__81 * l__X__78 + l__Y__82 * l__Y__79 + l__Z__83 * l__Z__80;
					local v85 = l__X__78 * l__X__78 + l__Y__79 * l__Y__79 + l__Z__80 * l__Z__80;
					if v84 <= 0 then
						u53 = true;
					elseif v84 <= v85 then
						local v86 = l__X__81 * l__X__81 + l__Y__82 * l__Y__82 + l__Z__83 * l__Z__83 - v84 * v84 / v85;
						local v87 = math.sqrt(v86);
						if v87 <= v52.suppressDistance then
							if not u24.suppressed then
								u24.suppressed = true;
							end;
							u24.lastSuppresion = p29;
							u24.vibrationSpring:add((v52.suppressDistance - l__Magnitude__69) * (v52.suppressVal * 0.5));
							u24.suppressionValue = math.clamp(u24.suppressionValue + (1 - math.clamp(v87 / v52.suppressDistance, 0, 1)), 0, u24.maxSuppressionValue);
						end;
						if v86 <= 5 then
							u53 = true;
							l__Audio__25:whiz(l__whizType__54, u41, u55, "OhNo");
						elseif v86 <= 56.25 then
							u53 = true;
							l__Audio__25:whiz(l__whizType__54, u41, u55, "SuperClose");
						elseif v86 <= 506.25 then
							u53 = true;
							l__Audio__25:whiz(l__whizType__54, u41, u55, "Close");
						elseif v86 <= 10000 then
							u53 = true;
							l__Audio__25:whiz(l__whizType__54, u41, u55, "Near");
						end;
					end;
				end;
				local l__Y__88 = u51.Y;
				if not (not u40) or u46 >= 5000 or l__Y__88 > 5000 or l__Y__88 < -50 or u56 and l__fuze__55 <= v73 then
					if u40 then
						u51 = u40.Position;
						local l__Instance__89 = u40.Instance;
						local l__Normal__90 = u40.Normal;
						if l__isMain__51 then
							u57 = l__ProjectileMaterialValues__26[l__Instance__89] or l__MaterialsTable__27[l__Instance__89.Material.Name];
							u58 = l__Instance__89 and Color3.fromRGB(l__Instance__89.Color.r * 255 - 15, l__Instance__89.Color.g * 255 - 15, l__Instance__89.Color.b * 255 - 15);
							u59 = l__explode__60 and l__armingDistance__61 <= u46;
							local v91 = u62 * u41 ^ 2 / (u19 * 2);
							v48.FilterDescendantsInstances = { l__Instance__89 };
							if l__CollectionService__3:HasTag(l__Instance__89, "BodyPart") then
								u57 = "Flesh";
							end;
							local v92 = u6[u57];
							local v93 = v91 * v92;
							local l__Unit__94 = v77.Unit;
							local v95 = math.abs(l__Normal__90:Dot(l__Unit__94)) * 90;
							if not u59 then
								if not u4[l__Instance__89] then
									local v96 = workspace:Raycast(u51 + l__Unit__94 * v93, -l__Unit__94 * v93, v48);
									if v96 then
										local l__Position__97 = v96.Position;
										local v98 = (l__Position__97 - u51).Magnitude;
										if v98 >= 0.01 then
											v72 = true;
											u51 = l__Position__97;
										else
											v98 = v93 * (v95 / 90);
										end;
									else
										v98 = v93 * (v95 / 90);
									end;
								else
									v98 = v93 * (v95 / 90);
								end;
								if v72 then
									u42 = u42 * (1 - v98 / v93);
									v75 = u42.Magnitude / u49;
									if v75 <= 0.925 and u62 / (v91 / 2636028) * v92 < 1 then
										u55 = true;
										u50 = u50 / 2;
										u62 = u62 * 0.65;
									end;
								end;
								if not v72 and v98 < l__projectileLength__63 / 3 then
									local v99 = u42 - 1.5 * (u42:Dot(l__Normal__90) / l__Normal__90:Dot(l__Normal__90)) * l__Normal__90;
									if v75 > 0.1 and v95 <= u7[u57] * (300 / (u41 / 2)) then
										v71 = true;
										u55 = true;
										u50 = u50 / 2;
										u42 = v99 * (0.65 * v99.Magnitude / u42.Magnitude);
									end;
								end;
							end;
							if u55 then
								local v100 = 1;
							else
								v100 = 0;
							end;
							if u59 then
								local v101 = 1;
							else
								v101 = 0;
							end;
							if v71 then
								local v102 = 1;
							else
								v102 = 0;
							end;
							if local v103 then
								local v104 = 1;
							else
								v104 = 0;
							end;
							u8:FireServer(l__Instance__89, string.pack("i3i3i3i3i3i3sI1I1I1I3I2I1I1I1I1", l__Normal__90.X * 1000, l__Normal__90.Y * 1000, l__Normal__90.Z * 1000, u51.X * 1000, u51.Y * 1000, u51.Z * 1000, u57, math.abs(u58.R) * 255, math.abs(u58.G) * 255, math.abs(u58.B) * 255, p19, v75 * 100, v100, v101, v102, v104));
						else
							if not u58 then
								u58 = Color3.new(1, 1, 1);
							end;
							local l__hasRicocheted__105 = v67.hasRicocheted;
							v67.hasRicocheted = false;
							v67.hasPenetrated = false;
							u40 = nil;
						end;
						local l__Magnitude__106 = (u23 - u51).Magnitude;
						if not u59 then
							l__FX__28:projectileHit(u57, l__MaterialSharesFX__29[u57] or u57, u58, u51, l__Instance__89, l__Normal__90, l__hasRicocheted__105, u41 < 500);
							if u52 and l__Magnitude__106 <= v52.suppressDistance and not u24.dead then
								if not u24.suppressed then
									u24.suppressed = true;
								end;
								u24.lastSuppresion = p29;
								u24.suppressionValue = math.clamp(u24.suppressionValue + (1 - l__Magnitude__106 * (v52.suppressDistance * 0.001) * 2.25) * (v52.suppressVal * 5), 0, u24.maxSuppressionValue);
							end;
						else
							l__FX__28:explode(u57, l__MaterialSharesFX__29[u57] or u57, u58, u51, l__Normal__90, u64);
							if l__Magnitude__106 <= u65 and not u24.dead then
								if not u24.suppressed then
									u24.suppressed = true;
								end;
								u24.lastSuppresion = p29;
								u24.suppressionValue = math.clamp(u24.suppressionValue + (u65 - l__Magnitude__106) * 0.025, 0, u24.maxSuppressionValue);
								u24.tinnitusValue = u24.tinnitusValue + (u66 - l__Magnitude__106) * 0.5;
								u24.vibrationSpring:add((u65 - l__Magnitude__106) * 0.05);
							end;
						end;
						if not l__hasRicocheted__105 and not v67.hasPenetrated then
							if not u59 and l__UXOTemplate__67 then
								u30(l__UXOTemplate__67, CFrame.lookAt(u51, v77));
							end;
							if p15 then
								if u36 == "Beam" then
									u37.Transparency = v9;
								elseif u36 == "BillboardGui" then
									u37.Enabled = false;
								elseif u36 == "Model" then
									u37:SetPrimaryPartCFrame(v10);
								else
									u37.CFrame = v10;
								end;
								table.insert(u9[v53], v57);
							end;
							u68();
						end;
					elseif u56 and l__fuze__55 <= v73 then
						local l__Magnitude__107 = (u23 - u51).Magnitude;
						if l__explode__60 then
							if l__isMain__51 then
								if u55 then
									local v108 = 1;
								else
									v108 = 0;
								end;
								u8:FireServer(nil, string.pack("i3i3i3i3i3i3sI1I1I1I3I2I1I1I1I1", 0, 1, 0, u51.X * 1000, u51.Y * 1000, u51.Z * 1000, "Concrete", 255, 255, 255, p19, v75 * 100, v108, 1, 0, 0));
							end;
							l__FX__28:explode("Concrete", "Concrete", nil, u51, nil, u64);
							if l__Magnitude__107 <= u65 and not u24.dead then
								if not u24.suppressed then
									u24.suppressed = true;
								end;
								u24.lastSuppresion = p29;
								u24.suppressionValue = math.clamp(u24.suppressionValue + (u65 - l__Magnitude__107) * 0.025, 0, u24.maxSuppressionValue);
								u24.tinnitusValue = u24.tinnitusValue + (u66 - l__Magnitude__107) * 0.5;
								u24.vibrationSpring:add((u65 - l__Magnitude__107) * 0.05);
							end;
						end;
						if p15 then
							if u36 == "Beam" then
								u37.Transparency = v9;
							elseif u36 == "BillboardGui" then
								u37.Enabled = false;
							elseif u36 == "Model" then
								u37:SetPrimaryPartCFrame(v10);
							else
								u37.CFrame = v10;
							end;
							table.insert(u9[v53], v57);
						end;
						u68();
					else
						if p15 then
							if u36 == "Beam" then
								u37.Transparency = v9;
							elseif u36 == "BillboardGui" then
								u37.Enabled = false;
							elseif u36 == "Model" then
								u37:SetPrimaryPartCFrame(v10);
							else
								u37.CFrame = v10;
							end;
							table.insert(u9[v53], v57);
						end;
						u68();
					end;
				elseif p15 then
					if u36 == "Beam" then
						v60.Position = v76;
						v61.Position = u38;
					elseif u36 == "BillboardGui" then
						v60.Position = v76;
					elseif u36 == "Model" then
						u37:SetPrimaryPartCFrame(CFrame.lookAt(u38, v76) * CFrame.Angles(0, 0, math.rad(u37.PrimaryPart.Orientation.Z - 4.5)));
					else
						u37.CFrame = CFrame.lookAt(u38, v76) * CFrame.Angles(0, 0, math.rad(u37.Orientation.Z - 4.4));
					end;
					if v58 then
						v59.Enabled = v73 <= l__burnTime__43;
					end;
				end;
				u38 = u51;
				return true;
			end);
		end;
		function u1.update(p30)
			local v109 = os.clock();
			if v109 - u24.lastSuppresion >= 2 then
				u24.suppressed = false;
			end;
			u23 = l__CurrentCamera__47.CFrame.Position;
			v12:update(v109);
			v11:update(v109);
		end;
		function u1.setMyPlayer(p31)
			u24 = l__PlayerList__21[l__LocalPlayer__5.Name];
		end;
	end
};
return u1;
