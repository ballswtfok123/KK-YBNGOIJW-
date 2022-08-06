local Utilities = {};
Utilities.__index = Utilities;

Utilities.Service = function(Service)
    return game:GetService(Service) or game[Service];
end;

local Players = Utilities.Service('Players');
local RunService = Utilities.Service('RunService');

local Player = Players.LocalPlayer;

local Mouse = Player:GetMouse();
local Camera = workspace.CurrentCamera;

local IPairs = ipairs;
local HookMetaMethod = hookmetamethod;
local HookFunction = hookfunction;
local Type = type;
local TypeOf = typeof;
local Find = table.find;
local Insert = table.insert;
local Remove = table.remove;
local FindFirstChild = game.FindFirstChild;
local FindFirstChildOfClass = game.FindFirstChildOfClass;
local GetDescendants = game.GetDescendants;
local GetChildren = game.GetChildren;
local GetConnections = getconnections;
local NameCallMethod = getnamecallmethod;
local Sort = table.sort;
local GetGenv = getgenv;
local ToString = tostring;
local GetUpValues = debug.getupvalues or getupvalues;
local GetProtos = debug.getprotos or getprotos;
local GetConstants = debug.getconstants or getconstants;
local GetInfo = debug.getinfo;
local ForEach = table.foreach;
local IsFile = isfile;
local LoadFile = loadfile;
local WriteFile = writefile;
local MakeFolder = makefolder;
local LoadString = loadstring;
local PCall = pcall;

GetGenv().Utilites = Utilities;

local Index, Value, L_Character, BodyParts, Settings, OldNameCall, OldIndex, Args, Method, Targets, _, __, worldPoint, vector, onScreen, magnitude, String, Returned, FunctionInfo, Success, Error, Drawing, Type, Properties, OldNewIndex

Utilities.SpoofedValues = {};
Utilities.BlockedRemotes = {};
Utilities.Connections = {};
Utilities.Drawings = {};
Utilites.SpoofedIndexes = {};

Utilities.GetCharacter = function(Player)
    return Player.Character ~= nil and Player.Character;
end;

Utilities.ReturnBodyParts = function(Player, Settings)

    L_Character = Utilities.GetCharacter(Player);

    if (not L_Character) then 
        return BodyParts
    end;

    BodyParts = {};
    Settings = Settings ~= nil and Settings or {};

    for Index, Value in IPairs((Settings['Descedants'] ~= nil and GetDescendants(L_Character)) or (GetChildren(L_Character))) do 
        BodyParts[Value.Name] = Value;
    end;

    return BodyParts;
end;

Utilities.Draw = function(Type, Properties)
    Drawing = Drawing.new(Type);

    for Index, Value in next, Properties do 
        Drawing[Index] = Value;
    end;

    Insert(Utilities.Drawings, Drawing);

    return Drawing;
end;

Utilities.Find = function(Table, Index)
    for _, __ in next, Table do 
        if (Index == _) or (Index == __) then 
            return true 
        end;
    end;

    return false;
end;

Utilities.UpdateCamera = function()
    Camera = workspace.CurrentCamera;    
end;

Utilities.BlockRemote = function(Index, Method, Callback)
    if (TypeOf(Index) == 'Instance') then 
        Insert(Utilities.BlockedRemotes, {['Remote'] = Index, ['Callback'] = (Callback ~= nil and Callback or false)});
    elseif (TypeOf(Index) == 'string') then     
        Insert(Utilities.BlockedRemotes, {['Index'] = Index; ['Method'] = Method; ['Callback'] = (Callback ~= nil and Callback or false)});
    end;

    return true;
end;

Utilities.UnblockRemote = function(Index)
    for _, __ in next, Utilities.BlockedRemotes do 
        if (Utilities.Find(__, Index)) then 
            __ = nil;
        end;
    end;

    return true;
end;

Utilities.AntiAFK = function()
    for Index, Value in next, GetConnections(Player.Idled) do 
        Value:Disable();
    end;
end;

Utilities.VerifyChar = function(Player)
    if (not Utilities.GetCharacter(Player)) then 
        return;
    end;

    L_Character = Utilities.GetCharacter(Player);

    if (not FindFirstChildOfClass(L_Character, 'Humanoid')) then return false end;
    if (not FindFirstChild(L_Character, 'Head')) then return false end;
    if (not FindFirstChild(L_Character, 'HumanoidRootPart')) then return false end;
    if (FindFirstChildOfClass(L_Character, 'Humanoid'):GetState() == Enum.HumanoidStateType.Dead) then return false end;

    return true;
end;

Utilities.GetTeam = function(Player)
    return Player.Team;
end;

Utilities.GetNearest = function(Settings)
    if (Settings == nil) then 
        Settings = {
            ['UseFOV'] = false;
            ['FOV'] = 100;
            ['MaxDistance'] = 1000;
            ['SortTable'] = true;
            ['BodyPart'] = 'HumanoidRootPart';
            ['TeamCheck'] = false;
        };
    end;

    Targets = {};

    for Index, Value in IPairs(Players:GetPlayers()) do 
        if (Value ~= Player) and (Utilities.GetCharacter(Value)) and (Utilities.VerifyChar(Player)) and (Player:DistanceFromCharacter(Value.Character[Settings['BodyPart']].Position) <= Settings['MaxDistance']) then 

            if (Settings['TeamCheck'] and Utilities.GetTeam(Player) == Utilities.GetTeam(Value)) then 
                continue;
            end;
            
            if (Settings['UseFOV']) then 
                worldPoint = Value.Character:WaitForChild(Settings['BodyPart']).Position;
                vector, onScreen = Camera:WorldToScreenPoint(worldPoint);
                magnitude = (Vector2.new(Mouse.X, Mouse.Y) - Vector2.new(vector.X, vector.Y)).magnitude;

                if (onScreen and magnitude <= Settings['FOV'] and Value.Character) then
                    Insert(Targets, {Value, Player:DistanceFromCharacter(FindFirstChild(Value.Character, Settings['BodyPart']).Position)});
                    continue;
                else
                    return  nil;
                end;
            end;

            Insert(Targets, {Value, Player:DistanceFromCharacter(FindFirstChild(Value.Character, Settings['BodyPart']).Position)});
        end;
    end;

    if (#Targets == 0) then
        return nil;
    end;

    if (#Targets > 1) and (Settings['SortTable']) then 
        Sort(Targets, function(A, B)
            return A < B;
        end);
    end;

    return Targets[1][1];
end;

Utilities.SpoofValue = function(Index, Value, Callback)
    if (TypeOf(Index) == 'Instance') then 
        Insert(Utilities.SpoofedValues, {
            ['Instance'] = Index;
            ['Value'] = Value;
            ['Callback'] = (Callback ~= nil and Callback) or (false);
        });
    elseif (Type(Index) == 'string') then 
        Insert(Utilities.SpoofedValues, {
            ['Index'] = Index;
            ['Value'] = Value;
            ['Callback'] = (Callback ~= nil and Callback) or (false);
        });
    end;
end;

Utilities.UpdateSpoof = function(Index, Value)
    for _, __ in next, Utilities.SpoofedValues do 
        if (Utilities.Find(__, Index)) then 
            __['Value'] = Value;
        end;
    end;
end;

Utilities.UnSpoof = function(Index)
    for  _, __ in next, Utilities.SpoofedValues do 
        if (Utilities.Find(__, Index)) then 
            __ = nil;
        end;
    end;
end;

Utilites.SpoofIndex = function(Index, Value, Callback)
    Insert(Utilities.SpoofedValues, {
        ['Index'] = Index;
        ['Value'] = Value;
        ['Callback'] = (Callback ~= nil and Callback) or (false);
    });
end;

Utilites.UnSpoofIndex = function(Index)
    for _, __ in next, Utilites.SpoofedIndexes do 
        if (Utilites.Find(__, Index)) then 
            __ = nil;
        end;
    end;
end;

Utilities.TableToString = function(Table)

    String = '';

    for Index, Value in next, Table do 
        String ..= ToString(Index) .. ': ' .. ToString(Value) .. '\n'
    end;

    return String;
end;

Utilities.DeepCopy = function(Table)
    Returned = {};

    local function GoThrough(Table)
        for Index, Value in next, Table do 
            if (Type(Index) == 'table') then 
                GoThrough(Index);
            elseif (Value) == 'table' then 
                GoThrough(Value);
            end;

            Returned[Index] = Value;
        end;
    end;    

    for Index, Value in next, Table do 
        if (Type(Value) == 'table') then 
            GoThrough(Value);
        elseif (Type(Index) == 'table') then 
            GoThrough(Index);
        end;
    end;

    return Returned
end;

Utilities.DumpInfo = function(Function, Print)
    if (not Type(Function) == 'function') then 
        return;
    end;

    FunctionInfo = {};

    local Info = GetInfo(Function);
    local Upvalues = GetUpValues(Function);
    local Constants = GetConstants(Function);
    local Protos = GetProtos(Function);

    FunctionInfo['Upvalues'] = Upvalues;
    FunctionInfo['Info'] = Info;
    FunctionInfo['Constants'] = Constants;
    FunctionInfo['Protos'] = Protos;

    if (Print ~= nil) and (Print) then 

        print('[INFO]:\n');
        ForEach(Info, print);
        print('\n\n');

        print('[UPVALUES]:\n');
        ForEach(Upvalues, print);
        print('\n\n');

        print('[CONSTANTS]:\n');
        ForEach(Constants, print);
        print('\n\n');

        print('[PROTOS]:\n');
        ForEach(Protos, print);
        print('\n\n');

    end;

    return FunctionInfo;
end;

Utilities.Load = function(Index, Type)
    if (Type:lower() == 'link') then 

        return LoadString(game:HttpGet(Index))();

    elseif (Type:lower() == 'file') then 
        if (not IsFile(Index)) then 
            return warn('[UTILS] File does not exist.')
        end;
        
        return  LoadFile(Index)();
    else
        return warn('[UTILS] Type cannot be nil ([2])');
    end;
end;

OldNameCall = HookMetaMethod(game, '__namecall', newcclosure(function(self, ...)

    Args = { ... };
    Method = NameCallMethod();

    for _, __ in next, Utilities.BlockedRemotes do 
        if (__['Remote'] ~= nil) and (self == __['Remote']) then 

            if (__['Callback'])and (Type(__['Callback']) == 'function') then 
                __['Callback'](self, Args, Method);
            end;

            return;
        end;

        if (__['Index'] ~= nil) and (self.Name == __['Index']) then 

            if (__['Method'] ~= nil) and (__['Method']:lower() ~= Method:lower()) then 
                return OldNameCall(self, ...);
            end;

            if (__['Callback']) and (Type(__['Callback']) == 'function') then 
                __['Callback'](self, Args, Method);
            end;

            return;
        end;
    end;

    return OldNameCall(self, ...);
end));


OldNewIndex = HookMetaMethod(game, '__newindex', newcclosure(function(self, Index, Value)
     
     for _, __ in next, Utilities.SpoofedValues do 
        if (__['Instance'] ~= nil) and (__['Instance'] == self) then 
            if (__['Callback'] ~= nil) and (Type(__['Callback']) ==  'function') then 
                __['Callback'](self, Index, Value);
            end;

            return OldIndex(self, Index, __['Value']);
        end;

        if (__['Index'] ~= nil) and (__['Index'] == Index) then 
            if (__['Callback'] ~= nil) and (Type(__['Callback']) ==  'function') then 
                __['Callback'](self, Index, Value);
            end;

            return OldIndex(self, Index, __['Value']);
        end;    
     end;

     return OldIndex(self, Index, Value);
end));

return Utilites