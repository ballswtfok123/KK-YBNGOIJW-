--[[VARIABLE DEFINITION ANOMALY DETECTED, DECOMPILATION OUTPUT POTENTIALLY INCORRECT]]--
-- Decompiled with the Synapse X Luau decompiler.

local v1 = {
	CachedFunctions = {}
};
local l__LocalPlayer__2 = game.Players.LocalPlayer;
local l__RunService__3 = game:GetService("RunService");
local v4 = l__RunService__3:IsServer() and require(game.ReplicatedStorage.Modules.Shared.ModuleLoader):LoadModule("AntiCheatServer");
function v1.TraceCallBack(p1, p2)
	warn(debug.traceback(p2, 3));
end;
local l__Remotes__1 = game.ReplicatedStorage.Modules.Remotes;
function v1.FireServer(p3, ...)
	if l__RunService__3:IsServer() then
		p3:TraceCallBack("Attempt to call FireServer on the Server");
		return;
	end;
	l__Remotes__1.RemoteEvent:FireServer(...);
end;
task.spawn(function()
	while task.wait(2) do
		if debug.info(v1.FireServer, "l") == 0 then
			while true do
			
			end;
		end;	
	end;
end);
function v1.InvokeServer(p4, ...)
	if l__RunService__3:IsServer() then
		p4:TraceCallBack("Attempt to call InvokeServer on the Server");
		return;
	end;
	return l__Remotes__1.RemoteFunction:InvokeServer(...);
end;
function v1.OnClientEvent(p5, p6, p7)
	if l__RunService__3:IsServer() then
		p5:TraceCallBack("Attempt to call OnClientEvent on the Server");
		return;
	end;
	if not p5.CachedFunctions[p6] then
		p5.CachedFunctions[p6] = p7;
		return;
	end;
	p5:TraceCallBack(p6 .. " is already cached");
end;
function v1.OnClientInvoke(p8, p9, p10)
	if l__RunService__3:IsServer() then
		p8:TraceCallBack("Attempt to call OnClientInvoke on the Server");
		return;
	end;
	if not p8.CachedFunctions[p9] then
		p8.CachedFunctions[p9] = p10;
		return;
	end;
	p8:TraceCallBack(p9 .. " is already cached");
end;
function v1.FireClient(p11, ...)
	if l__RunService__3:IsClient() then
		p11:TraceCallBack("Attempt to call FireClient on the Client");
		return;
	end;
	l__Remotes__1.RemoteEvent:FireClient(...);
end;
function v1.FireAllClients(p12, ...)
	if l__RunService__3:IsClient() then
		p12:TraceCallBack("Attempt to call FireAllClients on the Client");
		return;
	end;
	l__Remotes__1.RemoteEvent:FireAllClients(...);
end;
function v1.InvokeClient(p13, ...)
	if l__RunService__3:IsClient() then
		p13:TraceCallBack("Attempt to call InvokeClient on the Client");
		return;
	end;
	return l__Remotes__1.RemoteFunction:InvokeClient(...);
end;
function v1.OnServerEvent(p14, p15, p16)
	if l__RunService__3:IsClient() then
		p14:TraceCallBack("Attempt to call OnServerEvent on the Client");
		return;
	end;
	if not p14.CachedFunctions[p15] then
		p14.CachedFunctions[p15] = p16;
		return;
	end;
	p14:TraceCallBack(p15 .. " is already cached");
end;
function v1.OnServerInvoke(p17, p18, p19)
	if l__RunService__3:IsClient() then
		p17:TraceCallBack("Attempt to call OnServerInvoke on the Client");
		return;
	end;
	if not p17.CachedFunctions[p18] then
		p17.CachedFunctions[p18] = p19;
		return;
	end;
	p17:TraceCallBack(p18 .. " is already cached");
end;
function v1.BindableFire(p20, ...)
	l__Remotes__1.BindableEvent:Fire(...);
end;
function v1.BindableInvoke(p21, ...)
	return l__Remotes__1.BindableFunction:Invoke(...);
end;
function v1.OnBindableFire(p22, p23, p24)
	if not p22.CachedFunctions[p23] then
		p22.CachedFunctions[p23] = p24;
		return;
	end;
	p22:TraceCallBack(p23 .. " is already cached");
end;
function v1.OnBindableInvoke(p25, p26, p27)
	if not p25.CachedFunctions[p26] then
		p25.CachedFunctions[p26] = p27;
		return;
	end;
	p25:TraceCallBack(p26 .. " is already cached");
end;
function v1.Initialize(p28)
	if l__RunService__3:IsServer() then
		l__Remotes__1.RemoteEvent.OnServerEvent:Connect(function(p29, p30, ...)
			if p30 == "DamagePlayer" or p30 == "MeleeHit" or p30 == "FireBullet" then
				v4:CheckPlayer(p29);
			end;
			if not p28.CachedFunctions[p30] then
				warn("OnServerEvent function", p30, "is not cached");
				return;
			end;
			p28.CachedFunctions[p30](p29, ...);
		end);
		l__Remotes__1.RemoteFunction.OnServerInvoke = function(p31, p32, ...)
			v4:CheckPlayer(p31);
			if not p28.CachedFunctions[p32] then
				warn("OnServerInvoke function", p32, "is not cached");
				return;
			end;
			return p28.CachedFunctions[p32](p31, ...);
		end;
	else
		l__Remotes__1.RemoteEvent.OnClientEvent:Connect(function(p33, ...)
			if not p28.CachedFunctions[p33] then
				warn("OnClientEvent function", p33, "is not cached");
				return;
			end;
			p28.CachedFunctions[p33](...);
		end);
		l__Remotes__1.RemoteFunction.OnClientInvoke = function(p34, ...)
			if not p28.CachedFunctions[p34] then
				warn("OnClientInvoke function", p34, "is not cached");
				return;
			end;
			return p28.CachedFunctions[p34](...);
		end;
	end;
	l__Remotes__1.BindableEvent.Event:Connect(function(p35, ...)
		if not p28.CachedFunctions[p35] then
			warn("OnBindableFire function", p35, "is not cached");
			return;
		end;
		p28.CachedFunctions[p35](...);
	end);
	l__Remotes__1.BindableFunction.OnInvoke = function(p36, ...)
		if p28.CachedFunctions[p36] then
			return p28.CachedFunctions[p36](...);
		end;
		warn("OnBindableInvoke function", p36, "is not cached", l__RunService__3:IsServer());
	end;
end;
return v1;
