local LocalizationService = game:GetService("LocalizationService")
--[[
    Xenny-Ware Rewrite Started 6/5/2022

    
    Credits:

        Inori: Created The Ui Library
        Wally: Created the save manager for the UI library, very useful and just a cool "guy"
        Infinite Yield Creators: cfly
        Kiriot22: ESP lib (i still suck at math :cry:)
        Averiias, Stefanuk12, xaxa: Help with silent aim (by help i mean i kinda just learned off of their universal silent aim because i was too lazy to learn it and its like 4 am rn im sorry)
        Quenty: maid module
        arson: hydroxide (i love you)
        xenny#0001: everything else

        if you find anything that you made that you want credit for that i mightve used without crediting you, just dm me on discord (sometimes i forget or dont know the original creator sorry)
]]

local Start = os.time();

-- // Wait Until The Game Is Loaded

repeat task.wait() until (game ~= nil) and (game:IsLoaded()) and (game.Players ~= nil) and (game.Players.LocalPlayer ~= nil);

-- // Service Function (QOL)

local function Service(Service)
    return game:GetService(Service) or game[Service];
end;


-- // Check for needed functions

local NeededFunctions = {
    hookmetamethod,
    Drawing,
    makefolder,
    isfolder,
    isfile,
    writefile,
    getsenv,
    setclipboard,
    getconnections,
    getgenv,
    setupvalue;
    getupvalues;
    getconstants;
    firetouchinterest;
};


for Index, Value in next, NeededFunctions do 
    assert(Value, function()
        Service('Players').LocalPlayer:Kick('Unsupported function detected: ' .. Value);
    end);
end;

-- // Load Iris Compat if synapse is not being used

if (not syn) then 
    loadstring(game:HttpGet('https://irisapp.ca/api/Scripts/IrisBetterCompat.lua'))();
end;


-- // Needed Folders

local RequiredFiles = {
    ['Xenny-Ware/Required'] = 'folder';
    ['Xenny-Ware/Modules'] = 'folder';
    ['Xenny-Ware/Luas'] = 'folder';
    ['Xenny-Ware/Debug'] = 'folder';
    ['Xenny-Ware/Extra'] = 'folder';
};

-- // Create needed folders and files

for Index, Value in next, RequiredFiles do 
    if (Value == 'folder') and (not isfolder(Index)) then 
        makefolder(Index);
    end;

    if (Value == 'file') and (not isfile(Index)) then 
        writefile(Index);
    end;
end;

-- // Write the required files

if (not isfile('Xenny-Ware/Required/Library.lua')) then 
    writefile('Xenny-Ware/Required/Library.lua', game:HttpGet('https://raw.githubusercontent.com/ballswtfok123/Xenny-Ware/main/Required/library.lua'));
end;

if (not isfile('Xenny-Ware/Required/SaveManager.lua')) then 
    writefile('Xenny-Ware/Required/SaveManager.lua', game:HttpGet('https://raw.githubusercontent.com/ballswtfok123/Xenny-Ware/main/Required/modified_save_manager.lua'));
end;

if (not isfile('Xenny-Ware/Required/Maid.lua')) then
    writefile('Xenny-Ware/Required/Maid.lua', game:HttpGet('https://raw.githubusercontent.com/ballswtfok123/Xenny-Ware/main/Required/maid.lua'));
end;

if (not isfile('Xenny-Ware/Required/ESP.lua')) then 
    writefile('Xenny-Ware/Required/ESP.lua', game:HttpGet('https://raw.githubusercontent.com/ballswtfok123/Xenny-Ware/main/Required/esp.lua'));
end;

if (not isfile('Xenny-Ware/Required/ThemeManager.lua')) then 
    writefile('Xenny-Ware/Required/ThemeManager.lua', game:HttpGet('https://raw.githubusercontent.com/ballswtfok123/Xenny-Ware/main/Required/theme_manager.lua'));
end;

if (not isfile('Xenny-Ware/Required/Utilities.lua')) then 
    writefile('Xenny-Ware/Required/Utilities.lua', game:HttpGet('https://raw.githubusercontent.com/ballswtfok123/Xenny-Ware/main/Required/Utilities.lua'));
end;

if (not isfile('Xenny-Ware/Required/Signal.lua')) then 
    writefile('Xenny-Ware/Required/Signal.lua', game:HttpGet('https://raw.githubusercontent.com/ballswtfok123/Xenny-Ware/main/Required/Signal.lua'));
end;

local Version, UpdateDate = loadstring(game:HttpGet('https://raw.githubusercontent.com/ballswtfok123/Xenny-Ware/main/Extra/version.lua'))() or 'Unknown', 'Unknown';
local Credits = loadstring(game:HttpGet('https://raw.githubusercontent.com/ballswtfok123/Xenny-Ware/main/Extra/credits.lua'))();

if (not isfile('Xenny-Ware/Extra/Version.lua')) then 
    writefile('Xenny-Ware/Extra/Version.lua', Version);
end;

-- // Check if a new update has happened

if (readfile('Xenny-Ware/Extra/Version.lua') ~= Version) then 
    writefile('Xenny-Ware/Required/Library.lua', game:HttpGet('https://raw.githubusercontent.com/ballswtfok123/Xenny-Ware/main/Required/library.lua'));
    writefile('Xenny-Ware/Required/SaveManager.lua', game:HttpGet('https://raw.githubusercontent.com/ballswtfok123/Xenny-Ware/main/Required/modified_save_manager.lua'));
    writefile('Xenny-Ware/Required/Maid.lua', game:HttpGet('https://raw.githubusercontent.com/ballswtfok123/Xenny-Ware/main/Required/maid.lua'));
    writefile('Xenny-Ware/Required/ESP.lua', game:HttpGet('https://raw.githubusercontent.com/ballswtfok123/Xenny-Ware/main/Required/esp.lua'));
    writefile('Xenny-Ware/Required/ThemeManager.lua', game:HttpGet('https://raw.githubusercontent.com/ballswtfok123/Xenny-Ware/main/Required/theme_manager.lua'));
    writefile('Xenny-Ware/Required/Utilities.lua', game:HttpGet('https://raw.githubusercontent.com/ballswtfok123/Xenny-Ware/main/Required/Utilities.lua'));
    writefile('Xenny-Ware/Extra/Version.lua', Version);
end;

-- // Define core tables

shared.__XennyWare = {};
shared.__XennyWare.Connections = {};
shared.__XennyWare.Functions = {};
shared.__XennyWare.Values = {};
shared.__XennyWare.Modules = {};
shared.__XennyWare.Instances = {};

shared.__XennyWare.Users = {};
shared.__XennyWare.Note = 'Hello person printing shared (or looking at the src), hope you are doing well.';

-- // Declare Library

local Library = loadfile('Xenny-Ware/Required/Library.lua')(); -- // Credits to inori
local SaveManager = loadfile('Xenny-Ware/Required/SaveManager.lua')(); -- // Credits to wally for this
local ThemeManager = loadfile('Xenny-Ware/Required/ThemeManager.lua')() -- // Credits to wally for this
local Maid = loadfile('Xenny-Ware/Required/Maid.lua')(); -- // Credit to quenty
local ESPLib = loadfile('Xenny-Ware/Required/ESP.lua')(); -- // Credit to kiriot22

ESPLib.Init();

ESPLib.options.enabled = false;
ESPLib.options.boxes = false;
ESPLib.options.names = false;
ESPLib.options.healthBars = false;
ESPLib.options.distance = false;
ESPLib.options.healthText = false;
ESPLib.options.tracers = false;
ESPLib.options.chams = false;
ESPLib.options.outOfViewArrows = false;
ESPLib.options.outOfViewArrowsOutline = false;

local function Unload()
    game.CoreGui:FindFirstChild('ScreenGui'):Destroy();

    for Index, Value in next, shared.__XennyWare.Connections do 
        Value:Disconnect();
    end;

    ESPLib['MainLoop']:Disconnect();
    ESPLib = {};
    HighlightFolder:ClearAllChildren();

end;

shared.__XennyWare.Functions.Unload = Unload;

SaveManager:SetLibrary(Library)
SaveManager:SetFolder('Xenny-Ware');

ThemeManager:SetFolder('Xenny-Ware');
ThemeManager:SetLibrary(Library);

getgenv().Functions = shared.__XennyWare.Functions;
getgenv().Core = shared.__XennyWare.Core;

-- // Declare Services

local Players = Service('Players');
local ReplicatedStorage = Service('ReplicatedStorage');
local Lighting = Service('Lighting');
local Chat = Service('Chat');
local TweenService = Service('TweenService');
local Input = Service('UserInputService');
local RunService = Service('RunService');
local TeleportService = Service('TeleportService');
local VIM = Service('VirtualInputManager');
local GETOUTOOFMYHEAD;

local CoreGui = game.CoreGui;
local Camera = workspace.CurrentCamera;

-- // Declare Player and mouse

local Player = Players.LocalPlayer;
local Mouse = Player:GetMouse();

-- // Misc declrations

local PlaceId = game.PlaceId;
local JobId = game.JobId;

local Modules = shared.__XennyWare.Modules;
local Functions = shared.__XennyWare.Functions; -- // >w<

-- // Declare used variables

local Window, Main, Settings, AimbotBox, LocalBox, Visuals, Misc, Debug, OldNmaeCall, PlayerInfo, Luas, TabH, TabB, Rage, OldNameCall, Themes

local function GetCharacter(Target)
    if (Target.Character ~= nil) then 
        return Target.Character;
    end;

    return nil;
end;

-- // Function for checking if certain ui features are enabled (QOL)

local function IsEnabled(Index)
    if (Toggles[Index] == nil) then return print(Index) end;
    return Toggles[Index].Value
end;

-- // Returns property of index from options table (QOL)

local function GetProperty(Index)
    if (Options[Index] == nil) then return print(Index) end;
    return Options[Index].Value;
end;

-- // Get nearest function

Functions.GetTeam = function(Player)
    return Player.Team
end;

Functions.GetNearest = function(TeamCheck)
    if (Character == nil) or (RootPart == nil) or (Humanoid == nil) then 
        return;
    end;

    for Index, Value in next, Players:GetPlayers() do 
        if (Value ~= Player) and (GetCharacter(Value) ~= nil) and (GetCharacter(Value):FindFirstChild('HumanoidRootPart')) and (Player:DistanceFromCharacter(GetCharacter(Value):FindFirstChild('HumanoidRootPart').Position) <= 40) then 

            if (TeamCheck ~= nil) and (TeamCheck == true) and (Functions.GetTeam(Player) == Functions.GetTeam(Value)) then 
                continue;
            end;

            return Value, GetCharacter(Value), GetCharacter(Value).PrimaryPart, GetCharacter(Value).PrimaryPart.Position;
        end;
    end; 

    return nil;
end;

Functions.Chat = function(Message)
    ReplicatedStorage:WaitForChild('DefaultChatSystemChatEvents'):WaitForChild('SayMessageRequest'):FireServer(Message, 'All');
end;

Functions.GoTo = function(Position)
    if (Character == nil) or (RootPart == nil) or (Humanoid == nil) then 
        return;
    end;
    
    RootPart.Position = Position;
end;

Functions.IsVisible = function(Part)
    
end;

Functions.CharCheck = function()
    if (Character == nil) or (RootPart == nil) or (Humanoid == nil) then 
        return false;
    end;

    return true;
end;


Functions.IsDebug = function()
    return shared.Debug == true;
end;

Functions.IsEnabled = IsEnabled;
Functions.IsKeyDown = IsKeyDown;
Functions.GetProperty = GetProperty;

-- // Module Function

local function LoadModule(Module: string)

    if (not isfile(('Xenny-Ware/Modules/%s.lua'):format(Module))) then
        return 'Error: File does not exist';
    end;

    local Loaded = loadfile(('Xenny-Ware/Modules/%s.lua'):format(Module))();

    if (Loaded) then -- // If the module loaded successfullly
        local LoadedModule = Modules[Module];

        Modules[Module] = {}; 
        Modules[Module].LoadedFile = Loaded;
        Modules[Module].Loaded = true;

        Modules[Module].Unload = function()
            Modules[Module] = nil;
        end;

        return Modules[Module].LoadedFile, Modules[Module];
    end;

    return 'Error loading module';
end;

local function UnloadModule(Module: string)
    if (not isfile(('Xenny-Ware/Modules/%s.lua'):format(Module))) then
        return 'Error: File does not exist';
    end;

    if (Modules[Module] == nil) then 
        return 'Module is not loaded';
    end;

    if (Modules[Module].Unload == nil) or (not type(Modules[Module].Unload) == 'function') then 
        return 'Module does not exist';
    end;

    Modules[Modules].Unload();

    return 'Error unloading module.';
end;

local function CleanupModules()
    for Index, Value in next, Modules do 
        if (Value.Loaded ~= nil) and (Value.Loaded == false) then 
            Value = nil; -- // Remove the module table entirely
        end;
    end;

    return 'Successfully cleaned up modules';
end;

local function AA(angleX, angleY)
    if (Character and RootPart) then
        RootPart.CFrame = CFrame.new(RootPart.Position, RootPart.Position + Vector3.new(Camera.CFrame.lookVector.X, 0, Camera.CFrame.lookVector.Z)) * CFrame.Angles(math.rad(angleX), math.rad(angleY), 0);
    end
end;

Functions.SetYaw = function(YAW)
    AA(0, YAW);
end;

Functions.LoadModule = LoadModule;
Functions.UnloadModule = UnloadModule;
Functions.CleanupModules = CleanupModules;

-- // Get character function 

-- // Template function for ease of use

local function Create(Name, LoadRage)

    Window = Library:CreateWindow('Xenny-Ware | ' .. Name, {AutoShow = true});
    Main = Window:AddTab('Main');

    if (LoadRage ~= nil) and (LoadRage == true) then 
        Rage = Window:AddTab('Rage');
    end;

    Visuals = Window:AddTab('Visuals');
    Misc = Window:AddTab('Misc');
    Settings = Window:AddTab('Settings');

    SaveManager:BuildConfigSection(Settings);
    SaveManager:LoadAutoloadConfig();

    Themes = Settings:AddLeftGroupbox('Themes');

    ThemeManager:CreateThemeManager(Themes);
    ThemeManager:LoadDefault();

end;

Functions.LoadConfig = function(Name)
    SaveManager:Load(Name);
end;

Functions.SaveConfig = function(Name)
    SaveManager:Save(Name);
end;

Functions.MakeTab = function(Name)
    return Window:AddTab(Name);
end;

Functions.MakeSection = function(Tab, Name, Side)

    -- // im sorry
    if (Side:lower() == 'right') then 
        return Tab:AddRightGroupbox(Name)
    elseif (Side:lower() == 'left') then 
        return Tab:AddLeftGroupbox(Name);
    end;
end;

Functions.MakeToggle = function(Section, Name, Callback)
    return Section:AddToggle(Name, {
        Text = Name;
    }):OnChanged(function()
        if (Callback ~= nil) and (type(Callback) == 'function') then 
            Callback(IsEnabled(Name));
        end;
    end);
end;

Functions.MakeButton = function(Section, Name, Callback)
    return Section:AddButton(Name, function()
        if (Callback ~= nil) and (type(Callback) == 'function') then 
            Callback();
        end;
    end);
end;

Functions.MakeSlider = function(Section, Name, Min, Max, Default, Rounding, Callback)

    Min = Min or 0;
    Max = Max or 100;
    Default = Deault or 0;
    Rounding = Rounding or 1;
    
    return Section:AddSlider(Name, {
        Text = Name;
        Min = Min;
        Max = Max;
        Default = Default;
        Rounding = Rounding;
    }):OnChanged(function()
        if (Callback ~= nil) and (type(Callback) == 'function') then 
            Callback(GetProperty(Name));
        end;
    end);
end;

Functions.MakeDrop = function(Section, Name, Values, Multi, Callback)
    Values = Values or {};

    return Section:AddDropdown(Name, {
        Text = Name;
        Values = Values;
        Multi = Multi ~= nil and Multi or false;
    }):OnChanged(function()
        if (Callback ~= nil) and (type(Callback) == 'function') then 
            Callback(GetProperty(Name));
        end;
    end);
end;

-- // Init xenny ware functions


-- // Tween teleport functions

local function TweenTP(Target)
    
    local Info = TweenInfo.new(1, Enum.EasingStyle.Linear);
    local Tween = TweenService:Create(RootPart, Info, {CFrame = Target});
    Tween:Play();
    Tween.Completed:Wait();
    
end;


-- // Camera objects thing (QOL)

local function GetFunction(Args, Part)
    if (Args == 'GetChildren') then
        return Part:GetChildren();
    else
        return Part:GetDescendants();
    end;
end;

-- // Function for calculating actual account age

local function CalculateAccountAge(Age)

    local Years = 0;
    local Days = Age;
    local Months = 0;

    if (Age >= 365) then 
        repeat task.wait() Days -= 365 Years += 1 until Days < 365;
    end;

    if (Days >= 30) then 
        repeat task.wait() Days -= 30 Months += 1 until Days < 30;
    end;

    return Years .. 'y ' .. Months .. 'm ' .. Days .. 'd';
end;


-- // Replcaement for table.find because the original is so fucking dogshit

setreadonly(table, false);

table.find = function(Table, Index)
    assert(Table, '[1] Table cannot be nil!');
    assert(Index, '[2] Index cannot be nil!');
    assert(type(Table) == 'table', 'Table must be a table!');
    
    for _, __ in next, Table do 
        if (__ == Index) then 
            return true;
        end;

        if (_ == Index) then 
            return true;
        end;
    end;
    
    return false;
end;

-- // Check if a key is being held via the library toggled property (QOL)

local function IsKeyDown(Index)
    return Options[Index].Toggled;
end;

-- // Press key function

function PressKey(Key, Hold)
	VIM:SendKeyEvent(true, Key, Hold, GETOUTOOFMYHEAD);
end;

-- // Get lua files

local function GetLuaFiles()
    -- // thanks wally :troll:

    local list = listfiles('Xenny-Ware/Luas/')

		local out = {}
		for i = 1, #list do
			local file = list[i]
			if file:sub(-4) == '.lua' then
				-- i hate this but it has to be done ...

				local pos = file:find('.lua', 1, true)
				local start = pos

				local char = file:sub(pos, pos)
				while char ~= '/' and char ~= '\\' and char ~= '' do
					pos = pos - 1
					char = file:sub(pos, pos)
				end

				if char == '/' or char == '\\' then
					table.insert(out, file:sub(pos + 1, start - 1))
				end
			end
		end

    return out;
end;

Functions.Rejoin = function()
    TeleportService:Teleport(PlaceId);
end;

-- // List character parts

local function ListCharacterParts()

    local Parts = {};

    if (Character ~= nil) and (RootPart ~= nil) then 
        for Index, Value in next, Character:GetChildren() do 
            if (Value:IsA('BasePart')) or (Value:IsA('Part')) then 
                Parts[Value.Name] = Value.Name;
            end;
        end;
    end;

    return Parts;
end;

Functions.ListParts = ListCharacterParts;

-- // World to screen function (returns vector2 of a vector3)

local function WTS(Object)
    local Screen = Camera:WorldToViewportPoint(Object)
    return Vector2.new(Screen.x, Screen.y);
end;

-- // Character set up

local function SetUpCharacter(Character)

    Character = Character;
    Humanoid = Character:WaitForChild('Humanoid', 9e9);
    RootPart = Character:WaitForChild('HumanoidRootPart', 9e9);

    if (Functions.OnCharAdded ~= nil) then 
        Functions.OnCharAdded(Character);
    end;

    if (Options.SelfHighlight ~= nil) and (IsEnabled('SelfHighlight')) and (HighlightFolder:FindFirstChild(Player.Name)) then 
        HighlightFolder:FindFirstChild(Player.Name).Adornee = Character;
    end;
end;

-- // Returns a table of all players

local function FetchPlayers()
    
    local Selected = {};

    for Index, Value in next, Players:GetPlayers() do 
        if (Value ~= Player) then 
            Selected[Value.Name] = Value.Name;
        end;
    end;

    return Selected;
end;

Functions.FetchPlayers = FetchPlayers;

-- // Server hop function (not mine)

AllIDs = {};
local File =
        pcall(
        function()
    AllIDs = game:GetService("HttpService"):JSONDecode(readfile("NotSameServers.json"))
end
    )
if not File then
    table.insert(AllIDs, actualHour)
    writefile("NotSameServers.json", game:GetService("HttpService"):JSONEncode(AllIDs))
end
function TPReturner()
    local Site
    if foundAnything == "" then
        Site =
                game.HttpService:JSONDecode(
                game:HttpGet("https://games.roblox.com/v1/games/" .. PlaceID .. "/servers/Public?sortOrder=Asc&limit=100")
            )
    else
        Site =
                game.HttpService:JSONDecode(
                game:HttpGet(
                    "https://games.roblox.com/v1/games/" ..
                        PlaceID .. "/servers/Public?sortOrder=Asc&limit=100&cursor=" .. foundAnything
                )
            )
    end
    local ID = ""
    if Site.nextPageCursor and Site.nextPageCursor ~= "null" and Site.nextPageCursor ~= nil then
        foundAnything = Site.nextPageCursor
    end
    local num = 0
    for i, v in pairs(Site.data) do
        local Possible = true
        ID = tostring(v.id)
        if tonumber(v.maxPlayers) > tonumber(v.playing) then
            for _, Existing in pairs(AllIDs) do
                if num ~= 0 then
                    if ID == tostring(Existing) then
                        Possible = false
                    end
                else
                    if tonumber(actualHour) ~= tonumber(Existing) then
                        local delFile =
                                pcall(
                                function()
                            delfile("NotSameServers.json")
                            AllIDs = {}
                            table.insert(AllIDs, actualHour)
                        end
                            )
                    end
                end
                num = num + 1
            end
            if Possible == true then
                table.insert(AllIDs, ID)
                wait()
                pcall(
                        function()
                    writefile("NotSameServers.json", game:GetService("HttpService"):JSONEncode(AllIDs))
                    wait()
                    game:GetService("TeleportService"):TeleportToPlaceInstance(
                                PlaceID,
                                ID,
                                game.Players.LocalPlayer
                            )
                end
                    )
                wait(4)
            end
        end
    end
end
function Teleport()
    while wait() do
        pcall(
                function()
            TPReturner()
            if foundAnything ~= "" then
                TPReturner()
            end
        end
            )
    end
end

Functions.ServerHop = Teleport;

-- // Load universal features

local function LoadUniversal(LoadRage, UseDefault)

    Character = GetCharacter(Player) ~= nil and GetCharacter(Player) or nil;
    Humanoid = Character ~= nil and Character:FindFirstChildOfClass('Humanoid') ~= nil and Character:FindFirstChildOfClass('Humanoid') or nil;
    RootPart = Character ~= nil and Character.PrimaryPart ~= nil and Character.PrimaryPart or nil;

    TabB = Main:AddLeftTabbox();
    AimbotBox = TabB:AddTab('Aimbot');
    TabH = Main:AddRightTabbox('');
    LocalBox = TabH:AddTab('Local');

    CircleSettings = Main:AddLeftGroupbox('Circle Settings');
    HitboxExpander = Main:AddRightGroupbox('Hitbox Expander');
    TabHolder = Visuals:AddLeftTabbox('ESP');
    ESP = TabHolder:AddTab('ESP');
    Chams = TabHolder:AddTab('Chams');

    World = Visuals:AddRightGroupbox('World');
    TabHolder = Visuals:AddLeftTabbox();

    Self = TabHolder:AddTab('Self');
    Render  = TabHolder:AddTab('Render');

    PlayerBox = Misc:AddRightGroupbox('Players Info');
    Server = Misc:AddLeftGroupbox('Server');

    Luas = Settings:AddLeftGroupbox('Luas');

    HighlightFolder = Instance.new('Folder', CoreGui);
    HighlightFolder.Name = 'ESP';
    table.insert(shared.__XennyWare.Instances, HighlightFolder);

    CreditsSection = Settings:AddRightGroupbox('Credits');
    Core = Misc:AddLeftGroupbox('Core');

    -- // Auto load lua

    if (isfile('Xenny-Ware/Luas/autoload.LUA')) and (isfile(('Xenny-Ware/Luas/%s.lua'):format(readfile('Xenny-Ware/Luas/autoload.LUA')))) then 
        loadfile(('Xenny-Ware/Luas/%s.lua'):format(readfile('Xenny-Ware/Luas/autoload.LUA')));
        Library:Notify('Successfully auto loaded LUA: ' .. readfile('Xenny-Ware/Luas/autoload.LUA'));
    end;

    -- // Define targets and other tables

    Targets = {};   
    local Original = {};
    local WhitelistedClasses = {'Part'; 'MeshPart'};
    local ValidParts = {
        "RightLowerArm",
        "RightUpperArm",
        "RightFoot",
        "RightLowerLeg",
        "RightUpperLeg",
        "LeftFoot",
        "LeftLowerLeg",
        "LeftUpperLeg",
        "UpperTorso",
        "LowerTorso",
        "Head",
        "LeftUpperArm",
        "LeftLowerArm",
        "LeftHand",
        "RightHand",
        'Right Arm';
        'Left Arm';
        'Left Leg';
        'Right Leg';
        'Torso';
    };

    -- // Declare FOV Circles

    local AimbotFOVCircle = Drawing.new('Circle');
    AimbotFOVCircle.Radius = 150;
    AimbotFOVCircle.Visible = false;
    AimbotFOVCircle.Color = Color3.fromRGB(244, 244, 244);
    AimbotFOVCircle.Thickness = 1;

    local SilentAimFOVCircle = Drawing.new('Circle');
    SilentAimFOVCircle.Radius = 150;
    SilentAimFOVCircle.Visible = false;
    SilentAimFOVCircle.Color = Color3.fromRGB(244, 244, 244);
    SilentAimFOVCircle.Thickness = 1;

    local ColorCorrection = Instance.new('ColorCorrectionEffect', Lighting);

    table.insert(shared.__XennyWare.Instances, ColorCorrection);

    -- // Declare UI library features

    local Aimbot = AimbotBox:AddToggle('AimbotEnabled', {
        Text = 'Toggle';
    });


    local ShowFOV = AimbotBox:AddToggle('ShowFOV', {
        Text = 'Visualize Field of View';
    }):AddColorPicker('AimbotFOVColor', {Title = 'Field of View Color', Default = Color3.fromRGB(255, 255, 255)}) ;

    local Prediction = AimbotBox:AddToggle('AimbotPrediction', {
        Text = 'Use Prediction';
    });

    local Checks = AimbotBox:AddDropdown('AimbotChecks', {
        Text = 'Checks';
        AllowNull = true;
        Default = 4;
        Multi = true;
        Values = {'Visible', 'ForceField', 'Sitting', 'Dead', 'Jumping', 'Team', 'Friend',};
    });

    local Priority = AimbotBox:AddDropdown('AimbotPriority', {
        Text = 'Priority';
        Default = 1;
        AllowNull = true;
        Multi = false;
        Values = {'Distance'; 'Health'; 'Mouse'};
    });

    local MouseKey = AimbotBox:AddDropdown('MouseButton', {
        Text = 'Mouse Button';
        Values = {'MouseButton1'; 'MouseButton2'};
        Default = 2;
    });

    local BodyPart = AimbotBox:AddDropdown('AimbotPart', {
        Text = 'Body Part';
        AllowNull = false;
        Multi = false;
        Values = ListCharacterParts();
        Default = 1;
    });

    local AimbotWhitelist = AimbotBox:AddDropdown('Whitelist', {
        Text = 'Whitelist';
        AllowNull = true;
        Multi = true;
        Values = FetchPlayers();
    });

    local Smoothness = AimbotBox:AddSlider('AimbotSmoothness', {
        Text = 'Smoothness';
        Min = 1;
        Max = 25;
        Default = 1;
        Rounding = 0.5;
    });

    local PredictionAmount = AimbotBox:AddSlider('AimbotPredictionAmount', {
        Text = 'Prediction Interval';
        Min = 0;
        Max = 1000;
        Default = 150;
        Rounding = 0.5;
    });

    local FieldofView = AimbotBox:AddSlider('AimbotFOV', {
        Text = 'Field of View';
        Min = 0;
        Max = 850;
        Default = 150;
        Rounding = 0.5;
    });
 
    local MaxDistance = AimbotBox:AddSlider('AimbotDistance', {
        Text = 'Max Distance';
        Min = 0;
        Max = 10000;
        Default = 1000;
        Rounding = 0.5;
    });

    local Thickness = CircleSettings:AddSlider('AimbotThickness', {
        Text = 'Thickness';
        Min = 0;
        Max = 10;
        Default = 1;
        Rounding = 0.5
    });

    local Sides = CircleSettings:AddSlider('AimbotSides', {
        Text = 'Sides';
        Min = 0;
        Max = 150;
        Default = 20;
        Rounding = 0.5;
    });

    local CustomWalkSpeed = LocalBox:AddToggle('CustomWalkSpeed', {
        Text = 'Custom WalkSpeed';
    }):AddKeyPicker('CustWS', {
        Text = 'Custom WalkSpeed';
        Default = 'NONE';
    });

    local CustomJumpPower = LocalBox:AddToggle('CustomJumpPower', {
        Text = 'Custom JumpPower';
    }):AddKeyPicker('CustJP', {
        Text = 'Custom JumpPower';
        Default = 'NONE';
    });

    local WalkSpeedAmount = LocalBox:AddSlider('WalkSpeedAmount', {
        Text = 'WalkSpeed Amount';
        Min = 0;
        Max = 500;
        Rounding = 0.5;
        Default = 16;
    });

    local JumpPowerAmount = LocalBox:AddSlider('JumpPowerAmount', {
        Text = 'JumpPower Amount';
        Min = 0;
        Max = 500;
        Rounding = 0.5;
        Default = 16;
    });

    local InfiniteJump = LocalBox:AddToggle('InfiniteJump', {
        Text = 'Infinite Jump';
    });

    local ClickTeleport = LocalBox:AddToggle('ClickTeleport', {
        Text = 'Click Teleport [L-ALT]';
    });

    local Fly = LocalBox:AddToggle('Fly', {
        Text = 'Fly';
    }):AddKeyPicker('BindFly', {
        Text = 'Fly';
        Default = 'NONE';
    }):OnChanged(function()
        if (not IsEnabled('Fly')) and (Character ~= nil) and (RootPart ~= nil)   then 
            RootPart.Anchored = false
        end;
    end);

    local FlyMethod = LocalBox:AddDropdown('FlyMethod', {
        Text = 'Fly Method';
        Multi = false;
        Values = {'CFrame'; 'BodyVelocity'};
    });

    local FlySpeed = LocalBox:AddSlider('FlySpeed', {
        Text = 'Fly Speed';
        Min = 0;
        Max = 40;
        Rounding = 0.5;
        Default = 10;
    });

    local HitboxToggle = HitboxExpander:AddToggle('Hitbox', {
        Text = 'Toggle';
    }):AddColorPicker('HitboxColor', {
        Text = 'Hitbox Color';
        Default = Color3.fromRGB(255, 255, 255);
    });

    local HitboxChecks = HitboxExpander:AddDropdown('HitboxChecks', {
        Text = 'Checks';
        Default = 1;
        Multi = true;
        Values = {'Team'; 'Friend';}
    });

    local HitboxPart = HitboxExpander:AddDropdown('HitboxPart', {
        Text = 'Body Parts';
        Multi = true;
        Values = ListCharacterParts();
    });

    local HitboxWhitelist = HitboxExpander:AddDropdown('HitboxWhitelist', {
        Text = 'Blacklist';
        AllowNull = true;
        Multi = true;
        Values = FetchPlayers();
    });

    local HitboxMaterial = HitboxExpander:AddDropdown('HitboxMaterial', {
        Text = 'Hitbox Material';
        Default = 4;
        Multi = false;
        Values = {'ForceField'; 'Carpet'; 'Foil'; 'SmoothPlastic'};
    });

    local HitboxSize = HitboxExpander:AddSlider('HitboxSize', {
        Text = 'Hitbox Size';
        Min = 0;
        Max = 100;
        Default = 1;
        Rounding = 3;
    });

    local HitboxTransparency = HitboxExpander:AddSlider('HitboxTransparency', {
        Text = 'Hitbox Transparency';
        Min = 0;
        Max = 1;
        Default = 0.33;
        Rounding = 3;
    });

    local GlobalShadows = World:AddToggle('GlobalShadows', {
        Text = 'Global Shadows';
        Default = Lighting.GlobalShadows;
    });

    local Brightness = World:AddSlider('Brightness', {
        Text = 'Brightness';
        Min = 0;
        Max = 1000;
        Default = Lighting.Brightness;
        Rounding = 3;
    });

    local ClockTime = World:AddSlider('ClockTime', {
        Text = 'Clock Time';
        Min = -24;
        Max = 24;
        Default = Lighting.ClockTime; 
        Rounding = 3; 
    }); 
 
    local CustomColorShift = World:AddToggle('CustomColorShift', {Text = 'Custom Color Shift'}):AddColorPicker('ColorShiftBottom', {
        Text = 'Color Shift Bottom';
        Default = Lighting.ColorShift_Bottom;
    }):AddColorPicker('ColorShiftTop', {
        Text = 'Color Shift Top';
        Default = Lighting.ColorShift_Top;
    });

    local FogColor = World:AddToggle('FogColor', {
        Text = 'Fog Color';
    }):AddColorPicker('FogColor', {
        Text = 'Fog Color';
        Default = Lighting.FogColor;
    });

    local Ambient = World:AddToggle('CustomAmbient', {
        Text = 'Custom Ambient';
    }):AddColorPicker('AmbientColor', {
        Text = 'Outdoor Ambient Color';
        Default = Lighting.OutdoorAmbient;
    }):AddColorPicker('TintColor', {
        Text = 'Tint Color';
        Default = Lighting.Ambient;
    }):OnChanged(function()
        if (not IsEnabled('CustomAmbient')) then 
            Lighting.OutdoorAmbient = Color3.fromRGB(255, 255,255);
            ColorCorrection.TintColor = Color3.fromRGB(255, 255, 255);
        end;
    end);

    World:AddSlider('Contrast', {
        Text = 'Contrast';
        Min = 0;
        Max = 100;
        Default = 0;
        Rounding = 2;
    });

    World:AddSlider('Saturation', {
        Text = 'Saturation';
        Min = 0;
        Max = 100;
        Default = 0;
        Rounding = 2;
    })


    local NoFog = World:AddToggle('NoFog', {
        Text = 'No Fog';
    });

    local Technology = World:AddToggle('Technology', {
        Text = 'Technology';
    }):OnChanged(function()
        local Result = IsEnabled('Technology') and 1 or not IsEnabled('Technology') and 0;

        sethiddenproperty(Lighting, 'Technology', Result);
    end);

    local LowGraphics = World:AddToggle('LowGraphics', {
        Text = 'Low Graphics';
    }):OnChanged(function()
        if (IsEnabled('LowGraphics')) then 
            for Index, Value in next, workspace:GetDescendants() do 
                if (table.find(WhitelistedClasses, Value.ClassName)) then 
                    Original[Value] = {['ClassName'] = Value.ClassName; ['Material'] = Value.Material; ['Reflectance'] = Value.Reflectance;}; 
                    Value.Material = 'SmoothPlastic'
                end;

                if (Value:IsA('Texture')) then 
                    Value:Destroy();
                end;

                if (Value:IsA('Shirt') or (Value:IsA('ShirtGraphic')) or (Value:IsA('Pants')))  then 
                    Value:Destroy();
                end;

                if (Value:IsA('Accessory')) then 
                    Value:Destroy();
                end;

            end;
        else
            for Index, Value in next, workspace:GetDescendants() do 
                if (Original[Value] ~= nil) and (type(Original[Value]) == 'table') then 
                    Value.Material = Original[Value].Material;
                    Value.Reflectance = Original[Value].Reflectance;
                    table.remove(Original, table.find(Original, Value));
                end;
            end;
        end;
    end);

    local SelfChams = Self:AddToggle('SelfChams', {
        Text = 'Self Chams';
    }):AddColorPicker('SelfChamsColor', {
        Text = 'Self Chams Color';
        Default = Color3.fromRGB(255, 255, 255);
    }):OnChanged(function()
        if (not IsEnabled('SelfChams')) and (Character ~= nil) then 
            for Index, Value in next, Character:GetChildren() do 
                if (table.find(WhitelistedClasses, Value.ClassName)) then 
                    Value.Material = 'SmoothPlastic';
                end;
            end;
        end;
    end);
    
    local DeleteAccessories = Self:AddToggle('DeleteAccessories', {
        Text = 'Delete Accessories';
    });

    local SelfChamsMaterial = Self:AddDropdown('SelfChamsMaterial', {
        Text = 'Chams Material';
        Multi = false;
        Default = 1;
        Values = {'ForceField'; 'Foil'; 'Concrete'; 'SmoothPlastic'; 'Plastic'; 'Wood'; 'Neon'};
    });

    local SelfChamsTransparency = Self:AddSlider('SelfChamsTransparency', {
        Text = 'Chams Transparency';
        Min = 0;
        Max = 1;
        Default = 0.3;
        Rounding = 3;
    });

    local SelfChamsBrightness = Self:AddSlider('SelfChamsBrightness', {
        Text = 'Chams Brightness';
        Min = 0;
        Max = 650;
        Default = 0;
        Rounding = 0.3;
    });


    local SelfHighlight = Self:AddToggle('SelfHighlight', {
        Text = 'Self Highlight';
    }):AddColorPicker('SelfHighOut', {
        Text = 'Self Highlight Outline Color';
        Default = Color3.fromRGB(255, 255, 255);
    }):AddColorPicker('SelfHighFill', {
        Text = 'Self Highlight Fill Color';
        Default = Color3.fromRGB(255, 255, 255);
    }):OnChanged(function()
        if (IsEnabled('SelfHighlight')) then 
            local Highlight = Instance.new('Highlight', HighlightFolder);
            Highlight.Name = Player.Name;
            Highlight.OutlineTransparency = GetProperty('SelfTrans');
            Highlight.FillTransparency = GetProperty('FillTrans');
            Highlight.OutlineColor = GetProperty('SelfHighOut');
            Highlight.FillColor = GetProperty('SelfHighFill');

            if (Character ~= nil) then 
                Highlight.Adornee = Character;
            end;
        elseif (HighlightFolder:FindFirstChild(Player.Name)) then 
                HighlightFolder:FindFirstChild(Player.Name):Destroy();
        end;    
    end);

    local SelfOutlineTransparency = Self:AddSlider('SelfTrans', {
        Text = 'Outline Transparency';
        Min = 0;
        Max = 1;
        Default = 0;
        Rounding = 3;
    }):OnChanged(function()
        if (IsEnabled('SelfHighlight')) and (HighlightFolder:FindFirstChild(Player.Name)) then 
            HighlightFolder:FindFirstChild(Player.Name).OutlineTransparency = GetProperty('SelfTrans');
        end;
    end);

    local SelfFillTransparency = Self:AddSlider('FillTrans', {
        Text = 'Fill Transparency';
        Min = 0;
        Max = 1;
        Default = 0;
        Rounding  = 3;
    }):OnChanged(function()
        if (IsEnabled('SelfHighlight')) and (HighlightFolder:FindFirstChild(Player.Name)) then 
            HighlightFolder:FindFirstChild(Player.Name).FillTransparency = GetProperty('FillTrans');
        end;
    end);


    local CamFOV = Render:AddSlider('CamFOV', {
        Text = 'Field of View';
        Min = 0;
        Max = 140;
        Default = 80;
        Rounding = 3;
    });

    local ThirdPerson = Render:AddToggle('ThirdPerson', {
        Text = 'Third Person'
    });

    local ThirdPersonDistance = Render:AddSlider('ThirdPersonDistance', {
        Text = 'Third Person Distance';
        Min = 0;
        Max = 80;
        Default = 15;
        Rounding = 3;
    });

    local CustomCamera = Render:AddToggle('CustomCam', {
        Text = 'Custom Camera Objects';
    }):AddColorPicker('CamColor', {
        Text = 'Camera Object Color';
        Default = Color3.fromRGB(255, 255, 255);
    });

    local DestroyCam = Render:AddToggle('DestroyCam', {
        Text = 'Destroy Camera Objects';
    });


    local CamMaterial = Render:AddDropdown('CamMaterial', {
        Text = 'Camera Object Material';
        Multi = false;
        Values = {'ForceField'; 'Foil'; 'Concrete'; 'SmoothPlastic'; 'Plastic'; 'Wood'; 'Neon'};
    });

    local CamTransparency = Render:AddSlider('CamTransparency', {
        Text = 'Camera Object Transparency';
        Min = 0;
        Max = 1;
        Default = 0;
        Rounding = 3;
    });

    local CamReflectance = Render:AddSlider('CamReflectance',{
        Text = 'Camera Object Reflectance';
        Min = 0;
        Max = 100;
        Default = 20;
        Rounding = 3;
    });

    local EnableESP = ESP:AddToggle('EnableESP', {
        Text = 'Enable';
    }):OnChanged(function()
        ESPLib.options.enabled = IsEnabled('EnableESP');
    end);

    local Boxes = ESP:AddToggle('Boxes', {
        Text = 'Boxes';
    }):AddColorPicker('BoxColor', {
        Text = 'Box Color';
        Default = Color3.fromRGB(255, 255, 255);
    }):OnChanged(function()
        ESPLib.options.boxes = IsEnabled('Boxes');
    end);

    ESP:AddToggle('BoxFill', {
        Text = 'Box Fill';
    }):AddColorPicker('BoxFillColor', {
        Text = 'Fill Color';
        Default = Color3.fromRGB(255, 255, 255);
    }):OnChanged(function()
        ESPLib.options.boxFill = IsEnabled('BoxFill');
        ESPLib.options.BoxFillColor = GetProperty('BoxFillColor');
    end)

    
    ESP:AddSlider('BoxFillTransparency', {
        Text = 'Fill Transparency';
        Min = 0;
        Max = 1;
        Default = 1;
        Rounding = 2;
    }):OnChanged(function()
        ESPLib.options.boxFillTransparency = GetProperty('BoxFillTransparency');
    end);

    ESP:AddToggle('HealthBars', {
        Text = 'Health Bars';
    }):AddColorPicker('HealthBarColor', {
        Text = 'Bar Color';
        Default = Color3.fromRGB(0 ,255, 0);
    }):OnChanged(function()
        ESPLib.options.healthBars = IsEnabled('HealthBars');
        ESPLib.options.healthBarsColor = GetProperty('HealthBarColor');
    end);

    ESP:AddSlider('HealthBarTransparency', {
        Text = 'Bar Transparency';
        Min = 0;
        Max = 1;
        Default = 1;
        Rounding = 2;
    }):OnChanged(function()
        ESPLib.options.healthBarsTransparency = GetProperty('HealthBarTransparency');
    end);

    ESP:AddToggle('HealthAmt', {
        Text = 'Health Amount';
    }):AddColorPicker('HealthAmtColor', {
        Text = 'Health Color';
        Default = Color3.fromRGB(255, 255, 255);
    }):OnChanged(function()
        ESPLib.options.healthText = IsEnabled('HealthAmt');
        ESPLib.options.healthTextColor = GetProperty('HealthAmtColor');
    end);

    ESP:AddToggle('DistanceE', {
        Text = 'Distance Text';
    }):AddColorPicker('DistanceEColor', {
        Text = 'Color';
        Default = Color3.fromRGB(255, 0, 0);
    }):OnChanged(function()
        ESPLib.options.distance = IsEnabled('DistanceE');
        ESPLib.options.distanceColor = GetProperty('DistanceEColor');
    end);

    local Tracers = ESP:AddToggle('Tracers', {
        Text = 'Tracers';
    }):AddColorPicker('TracerColor', {
        Text = 'Color';
        Default = Color3.fromRGB(255, 255, 255);
    }):OnChanged(function()
        ESPLib.options.tracers = IsEnabled('Tracers');
        ESPLib.options.tracerColor = GetProperty('TracerColor');
    end);

    ESP:AddSlider('TracerTrans', {
        Text = 'Transprency';
        Min = 0;
        Max = 1;
        Default = 1;
        Rounding = 2;
    }):OnChanged(function()
        ESPLib.options.tracerTransparency = GetProperty('TracerTrans');
    end);

    ESP:AddDropdown('TracerOrigin', {
        Text = 'Tracer Origin';
        Values = {'Mouse'; 'Top'; 'Bottom'};
        Default = 3;
    }):OnChanged(function()
        ESPLib.options.tracerOrigin = GetProperty('TracerOrigin');
    end);

    ESP:AddToggle("Names", {
        Text = 'Names'
    }):AddColorPicker('NameColor', {
        Text  = 'NameColor';
        Default = Color3.fromRGB(255, 255, 255);
    }):OnChanged(function()
        ESPLib.options.names = IsEnabled('Names');
        ESPLib.options.nameColor = GetProperty('NameColor');

    end);
    ESP:AddToggle("TeamColor", {
        Text = 'Team Color'
    }):OnChanged(function()
        ESPLib.options.teamColor = IsEnabled('TeamColor');
    end);
    ESP:AddToggle("DontShow", {
        Text = 'Dont Show Team'
    }):OnChanged(function()
        ESPLib.options.teamCheck = not IsEnabled('DontShow');
    end);


    ESP:AddToggle('Outofview', {
        Text = 'Out Of View Arrows';
    }):AddColorPicker('OutClr', {
        Text = 'Color';
        Default = Color3.fromRGB(255, 255, 255);
    }):AddColorPicker('LineClr', {
        Text = 'Outline Color';
        Default = Color3.fromRGB(1, 1, 1);
    }):OnChanged(function()
        ESPLib.options.outOfViewArrows = IsEnabled('Outofview');

    end);

    ESP:AddSlider('OutTrans', {
        Text = 'Transparency';
        Min = 0;
        Max = 1;
        Rounding = 2;
        Default = 1;
    }):OnChanged(function()
        ESPLib.options.outOfViewArrowsTransparency = GetProperty('OutTrans');
    end);

    local ChamsEnable = Chams:AddToggle('ChamsEnable', {
        Text = 'Toggle';
    }):AddColorPicker('ChamsFillColor', {
        Text = 'Fill Color';
        Default = Color3.fromRGB(255, 255, 255);
    }):AddColorPicker('ChamsOutlineColor', {
        Text = 'Outline Color';
        Default = Color3.fromRGB(1, 1, 1);
    }):OnChanged(function()
        ESPLib.options.chams = IsEnabled('ChamsEnable');
    end);


    local ChamsTeam = Chams:AddToggle('ChamsTeam', {
        Text = 'Team Check';
    }):OnChanged(function()
        ESPLib.options.chamsTeamCheck = IsEnabled('ChamsTeam');
    end);   

    local ChamsTransparency = Chams:AddSlider('ChamFillTrans', {
        Text = 'Fill Transparency';
        Min = 0;
        Max = 1;
        Default = 0;
        Rounding = 3;
    }):OnChanged(function()
        ESPLib.options.chamsFillTransparency = GetProperty('ChamFillTrans')
    end);


    Chams:AddSlider('ChamsOutTrans', {
        Text = 'Outline Transparency';
        Min = 0;
        Max = 1;
        Default = 0;
        Rounding = 3;
    }):OnChanged(function()
        ESPLib.options.chamsOutlineTransparency = GetProperty('ChamsOutTrans')
    end);


    local DisplayName = PlayerBox:AddLabel('Display Name: ');
    local UserId = PlayerBox:AddLabel('User ID: ')
    local AccountAge = PlayerBox:AddLabel('Account Age: ');
    local PlrTeam = PlayerBox:AddLabel('Team: ');
    local Studs = PlayerBox:AddLabel('Studs Away: ');
    local TargetHealth = PlayerBox:AddLabel('Health: ');
    local HeldTool = PlayerBox:AddLabel('Held Tool: ');
    
    local Spectate = PlayerBox:AddToggle('Spectate', {
        Text = 'Spectate';
    }):OnChanged(function()
        if (IsEnabled('Spectate')) and (Character ~= nil) and (Humanoid ~= nil) and (GetProperty('PlrTarget') ~= nil) and (Players:FindFirstChild(GetProperty('PlrTarget'))) and (Players:FindFirstChild(GetProperty('PlrTarget')) ~= nil) and (GetCharacter(Players:FindFirstChild(GetProperty('PlrTarget'))):FindFirstChildOfClass('Humanoid')) then 
            Camera.CameraSubject = GetCharacter(Players:FindFirstChild(GetProperty('PlrTarget'))):FindFirstChildOfClass('Humanoid');
        end;

        if (not IsEnabled('Spectate')) and (Humanoid ~= nil) and (Character ~= nil) then 
            Camera.CameraSubject = Humanoid;
        end;
    end);

    local LoopTeleport = PlayerBox:AddToggle('LoopTeleport', {
        Text = 'Loop Teleport';
    });

    PlayerInfo = PlayerBox:AddDropdown('PlrTarget', {
        Text = 'Players';
        Multi = false;
        Values = FetchPlayers();
    }):OnChanged(function() 

        if (GetProperty('PlrTarget') == false) then 
            return;
        end;

        TargetPlayer = Players:FindFirstChild(GetProperty('PlrTarget')) or 'nil';
        TargetTeam =  TargetPlayer.Team ~= nil and type(TargetPlayer.Team.Name) == 'string' and TargetPlayer.Team.Name or 'None';
        StudsAway = GetCharacter(TargetPlayer) ~= nil and GetCharacter(TargetPlayer):FindFirstChild('HumanoidRootPart') ~= nil and Player:DistanceFromCharacter(GetCharacter(TargetPlayer):FindFirstChild('HumanoidRootPart').Position) or 'Not Found';
        CurrentHealth = TargetPlayer ~= nil and GetCharacter(TargetPlayer) ~= nil and GetCharacter(TargetPlayer):FindFirstChildOfClass('Humanoid') and GetCharacter(TargetPlayer):FindFirstChildOfClass('Humanoid').Health or 0;
        CurrentTool = GetCharacter(TargetPlayer) ~= nil and GetCharacter(TargetPlayer):FindFirstChildOfClass('Tool') and GetCharacter(TargetPlayer):FindFirstChildOfClass('Tool').Name or 'None';

        HealthColor = GetCharacter(TargetPlayer) ~= nil and GetCharacter(TargetPlayer):FindFirstChildOfClass('Humanoid').Health and GetCharacter(TargetPlayer):FindFirstChildOfClass('Humanoid').Health >= 75 and Color3.fromRGB(0, 255, 0) or GetCharacter(TargetPlayer):FindFirstChildOfClass('Humanoid').Health <= 75 and GetCharacter(TargetPlayer):FindFirstChildOfClass('Humanoid').Health >= 35 and Color3.fromRGB(255, 127, 0) or GetCharacter(TargetPlayer):FindFirstChildOfClass('Humanoid').Health < 34 and Color3.fromRGB(255, 0, 0);
        TeamColor = TargetPlayer.Team ~= nil and TargetPlayer.Team.Name ~= nil and TargetPlayer.Team.TeamColor ~= nil and TargetPlayer.Team.TeamColor or Color3.fromRGB(255, 255, 255);

        
        DisplayName:SetText('Display Name: ' .. TargetPlayer.DisplayName);
        UserId:SetText('User ID: ' .. TargetPlayer.UserId);
        AccountAge:SetText('Account Age: ' .. CalculateAccountAge(TargetPlayer.AccountAge));
        PlrTeam:SetText(('Team: ' .. '<font color="rgb(%s,%s,%s)">%s</font>'):format(math.floor(TeamColor.r * 255), math.floor(TeamColor.g * 255), math.floor(TeamColor.b * 255), TargetTeam));
        Studs:SetText('Studs Away: ' .. StudsAway);
        TargetHealth:SetText(('Health: ' .. '<font color="rgb(%s,%s,%s)">%s</font>'):format(math.floor(HealthColor.R * 255), math.floor(HealthColor.G * 255), math.floor(HealthColor.B * 255), CurrentHealth));
        HeldTool:SetText('Held Tool: ' .. CurrentTool);
    end);

    local TeleportTarget = PlayerBox:AddButton('Teleport', function()
        if (Character ~= nil) and (RootPart ~= nil) and (GetProperty('PlrTarget') ~= false) and (Players:FindFirstChild(GetProperty('PlrTarget'))) and (GetCharacter(Players:FindFirstChild(GetProperty('PlrTarget'))) ~= nil) and (GetCharacter(Players:FindFirstChild(GetProperty('PlrTarget'))):FindFirstChild('HumanoidRootPart')) then 
            RootPart.CFrame = GetCharacter(Players:FindFirstChild(GetProperty('PlrTarget'))):FindFirstChild('HumanoidRootPart').CFrame;
        end;
    end);

    local CopyProfile = PlayerBox:AddButton('Copy Profile Link', function()
        if (GetProperty('PlrTarget') ~= false) and (Players:FindFirstChild(GetProperty('PlrTarget'))) then 
            setclipboard(string.format('https://www.roblox.com/users/%s/profile', Players:FindFirstChild(GetProperty('PlrTarget')).UserId));
            Library:Notify('Successfully copied profile link.');
        end;
    end);

    local CopyUserId = PlayerBox:AddButton('Copy User Id', function()
        if (GetProperty('PlrTarget') ~= false) and (Players:FindFirstChild(GetProperty('PlrTarget'))) then 
            setclipboard(Players:FindFirstChild(GetProperty('PlrTarget')).UserId);
            Library:Notify('Successfully copied user id.');
        end;
    end);


    -- // Add credits

    for Index, Value in next, Credits do 
        CreditsSection:AddLabel(Index .. ': ' .. Value);
    end;

    -- // Lua system

    local LuaFiles = Luas:AddDropdown('LuaFile', {
        Text = 'File';
        Values = GetLuaFiles();
        Default = 1;
    });

    local LoadLua = Luas:AddButton('Load Lua', function()
        if (isfile(('Xenny-Ware/Luas/%s.lua'):format(GetProperty('LuaFile')))) then 
            loadfile(('Xenny-Ware/Luas/%s.lua'):format(GetProperty('LuaFile')))();
            Library:Notify('Successfully loaded lua file: ' .. GetProperty('LuaFile'));
        else
            Library:Notify('Error: File does not exist. Try refreshing?');
        end;
    end):AddButton('Delete Lua', function()
        if (isfile(('Xenny-Ware/Luas/%s.lua'):format(GetProperty('LuaFile')))) then 
            delfile(('Xenny-Ware/Luas/%s.lua'):format(GetProperty('LuaFile')));
            Library:Notify('Successfully deleted lua: ' .. GetProperty('LuaFile'));
        else
            Library:Notify('Error: file does not exist');
        end;
    end);
    
    Luas:AddButton('Auto Load Lua', function()
        if (isfile(('Xenny-Ware/Luas/%s.lua'):format(GetProperty('LuaFile')))) then 
            writefile('Xenny-Ware/Luas/autoload.LUA', GetProperty('LuaFile')); -- // :trol:
            Library:Notify('Successfully set auto load lua to: ' .. GetProperty('LuaFile'));
        else
            Library:Notify('Error: file does not exist');
        end;
    end)
    
    Luas:AddButton('Delete Auto Load Lua', function()
        if (isfile('Xenny-Ware/Luas/autoload.LUA')) then 
            delfile('Xenny-Ware/Luas/autoload.LUA');
            Library:Notify('Successfully deleted auto-load lua.');
        else
            Library:Notify('Error: there is no auto loaded lua set');
        end;
    end);

    Core:AddButton('Unload', function()
        CoreGui:FindFirstChild('ScreenGui'):Destroy();
        Unload();
    end);

    -- // Grab the aimbot target via a function

    local function GetAimbotTarget()

        Targets = {};

        for Index, Value in next, Players:GetPlayers() do 
            if (Value ~= Player) and (GetCharacter(Value) ~= nil) and (GetCharacter(Value):FindFirstChildOfClass('Humanoid')) and (GetCharacter(Value):FindFirstChild('HumanoidRootPart')) then 

                -- // Distance check

                if ((Player:DistanceFromCharacter(GetCharacter(Value)['HumanoidRootPart'].Position)) > GetProperty('AimbotDistance')) then 
                    continue;
                end;

                -- // Aimbot whitelist check

                if (table.find(Options.Whitelist.Value, Player.Name) ~= nil) then 
                    continue;
                end;

                -- // Check if teamcheck is enabled

                if (Checks.Value['Team'] ~= nil) and (Player.Team == Value.Team) then
                    continue;
                end;

                -- // Check for forcefield

                if (Checks.Value['ForceField'] ~= nil) and (GetCharacter(Value):FindFirstChildOfClass('ForceField')) then 
                    continue;
                end;

                -- // Check if the player is dead

                if (Checks.Value['Dead'] ~= nil) and (GetCharacter(Value):FindFirstChildOfClass('Humanoid'):GetState() == Enum.HumanoidStateType.Dead) then 
                    continue;
                end;

                -- // Check if the player is sitting

                if (Checks.Value['Sitting'] ~= nil) and (GetCharacter(Value):FindFirstChildOfClass('Humanoid'):GetState() == Enum.HumanoidStateType.Seated) then 
                    continue;
                end;

                -- // Jump check

                if (Checks.Value['Jumping'] ~= nil) and (GetCharacter(Value):FindFirstChildOfClass('Humanoid'):GetState() == Enum.HumanoidStateType.Jumping) then 
                    continue;
                end;

                -- // Friend check

                if (Checks.Value['Friend'] ~= nil) and (Player:IsFriendsWith(Value.UserId)) then 
                    continue;
                end;

                -- // Stole this from old source (too lazy to make a new one)

                if (not GetCharacter(Value):FindFirstChild(BodyPart.Value)) then 
                    continue;
                end;

                if (PlaceId == 142823291) then 
                    if (IsEnabled('IgnoreInnocents')) and (ReplicatedStorage.GetPlayerData:InvokeServer()[Value.Name] ~= nil) and (ReplicatedStorage.GetPlayerData:InvokeServer()[Value.Name].Role ~= nil) and (ReplicatedStorage.GetPlayerData:InvokeServer()[Value.Name].Role == 'Innocent') then 
                        continue;
                    end;
                end;

                local worldPoint = GetCharacter(Value):FindFirstChild(BodyPart.Value).Position;
                local vector, onScreen = Camera:WorldToScreenPoint(worldPoint);
                local magnitude = (Vector2.new(Mouse.X, Mouse.Y) - Vector2.new(vector.X, vector.Y)).magnitude;

                if (onScreen and magnitude <= GetProperty('AimbotFOV') and GetCharacter(Value) ~= nil) then
                    table.insert(Targets, {
                        Value;
                        GetCharacter(Value);
                        GetCharacter(Value).Humanoid.Health;
                        Player:DistanceFromCharacter(GetCharacter(Value)[BodyPart.Value].Position);
                    });
                end;

            end;
        end;
    end;

    Functions.GetAimbotTarget = GetAimbotTarget;

    local Rejoin = Server:AddButton('Rejoin', function()
        TeleportService:Teleport(PlaceId);
    end);

    local ServerHop = Server:AddButton('Server Hop', function()
        Teleport();
    end);

    local CopyJobId = Server:AddButton('Copy Job ID', function()
        setclipboard(tostring(JobId)) -- // just in case :3
    end);

    local JobIdJoin = Server:AddInput('JobId', {
        Text = 'Job ID';
    });

    local JoinJob = Server:AddButton('Join Server By Job ID', function()
        TeleportService:TeleportToPlaceInstance(PlaceId, GetProperty('JobId'), Player);
    end);

    local ChatMsg = Server:AddInput('ChatMsg', {
        Text = 'Message Here'
    });

    local ChatDelay = Server:AddSlider('ChatDelay', {
        Text = 'Chat Spam Delay';
        Min = 0;
        Max = 10;
        Default = 1;
        Rounding = 3;
    });

    local ChatSpam = Server:AddToggle('ChatSpam', {
        Text = 'Chat Spam';
    });

    -- // Connections

    shared.__XennyWare.Connections['JumpRequest'] = Input.JumpRequest:Connect(function()
        if (IsEnabled('InfiniteJump')) then 
            Humanoid:ChangeState('Jumping');
        end;
    end);

    shared.__XennyWare.Connections['InputBegan'] = Input.InputBegan:Connect(function(Key)
        if (Key.KeyCode == Enum.KeyCode.LeftAlt) and (IsEnabled('ClickTeleport') and (Character ~= nil) and (RootPart ~= nil) and (Humanoid ~= nil)) then 
            local EndPos = Mouse.Hit
            RootPart.CFrame = EndPos + Vector3.new(0, 3, 0)
        end;
    end);

    shared.__XennyWare.Connections['GraphicsConnection'] = workspace.DescendantAdded:Connect(function(Value)
        if (IsEnabled('LowGraphics')) then 
            if (table.find(WhitelistedClasses, Value.ClassName)) then 
                Original[Value] = {['ClassName'] = Value.ClassName; ['Material'] = Value.Material; ['Reflectance'] = Value.Reflectance;}; 
                Value.Material = 'SmoothPlastic'
            end;

            if (Value:IsA('Texture')) then 
                Value:Destroy();
            end;

            if (Value:IsA('Shirt') or (Value:IsA('ShirtGraphic')) or (Value:IsA('Pants')))  then 
                Value:Destroy();
            end;

            if (Value:IsA('Accessory')) then 
                Value:Destroy();
            end;
        end;
    end);

    shared.__XennyWare.Connections['PlayerAdded'] = Players.PlayerAdded:Connect(function(Player)
        Options.PlrTarget.Values = FetchPlayers();
        Options.Whitelist.Values = FetchPlayers();
        Options.HitboxWhitelist.Values = FetchPlayers();

        Options.PlrTarget:SetValues();
        Options.Whitelist:SetValues();
        Options.HitboxWhitelist:SetValues();
    end);

    shared.__XennyWare.Connections['PlayerRemoving'] = Players.PlayerRemoving:Connect(function(Player)

        Options.PlrTarget.Values = FetchPlayers();
        Options.Whitelist.Values = FetchPlayers();
        Options.HitboxWhitelist.Values = FetchPlayers();

        Options.PlrTarget:SetValues();
        Options.Whitelist:SetValues();
        Options.HitboxWhitelist:SetValues();

        for Index, Value in next, shared.__XennyWare.Connections do 
            if (string.find(Index:lower(), Player.Name:lower())) then 
                Value:Disconnect();
                Value = nil;
                Index = nil;
            end;
        end;

        if (HighlightFolder:FindFirstChild(Player.Name)) then 
            HighlightFolder:FindFirstChild(Player.Name):Destroy();
        end;
    end);

    -- // Index hook

    local mt = getrawmetatable(game);
    local oldNewIndex  = mt.__newindex;
    setreadonly(mt, false);
    mt.__newindex = newcclosure(function(t, idx, val)
        if idx == "WalkSpeed" and not checkcaller() and (IsEnabled('CustomWalkSpeed')) or idx == "WalkSpeed" and not checkcaller()  and (IsKeyDown('CustWS')) then
            return oldNewIndex(t, idx, GetProperty('WalkSpeedAmount'));
        end;
        if idx == "JumpPower" and not checkcaller() and IsEnabled('CustomJumpPower') or idx == "JumpPower" and not checkcaller() and (IsKeyDown('CustJP')) then
            return oldNewIndex(t, idx, IsEnabled('CustomJumpPower'));
        end;
        if (idx == 'CameraMode' and not checkcaller() and IsEnabled('ThirdPerson')) then
            return oldNewIndex(t, idx, 'Classic');
        end;
        if (idx == 'FieldOfView' and not checkcaller()) then
            return oldNewIndex(t, idx, CamFOV.Value);
        end;
        if (idx == 'ClockTime' and not checkcaller()) then
            return oldNewIndex(t, idx, GetProperty('ClockTime'))
        end;
        return oldNewIndex(t, idx, val);
    end);
    --setreadonly(mt, true);


    -- // Namecall hook

    OldNmaeCall = hookmetamethod(game, '__namecall', newcclosure(function(self, ...)
        local Method = getnamecallmethod();
        local Args = { ... };

        
        if (Method:lower() == 'kick') then 
            return false;
        end;
        
        return OldNmaeCall(self, ...);
    end));

    
    for _, __ in next, getconnections(Player.Idled) do 
        __:Disable();
    end;


    shared.__XennyWare.Connections['MainLoop'] = RunService.RenderStepped:Connect(function(Time)
         
        -- // Call Main Functions

        if (IsEnabled('AimbotEnabled')) and (Character ~= nil) then  -- // Only check for performance reasons
            GetAimbotTarget();
        end;

        Camera = workspace.CurrentCamera;

        -- // Handle color correction

        ColorCorrection.Contrast = GetProperty('Contrast');
        ColorCorrection.Saturation = GetProperty('Saturation');
        
        -- // Handle FOV Circles

        AimbotFOVCircle.Visible = IsEnabled('ShowFOV');
        AimbotFOVCircle.Color = GetProperty('AimbotFOVColor');
        AimbotFOVCircle.Radius = GetProperty('AimbotFOV');
        AimbotFOVCircle.Position = WTS(Mouse.hit.p);
        AimbotFOVCircle.NumSides = GetProperty('AimbotSides');
        AimbotFOVCircle.Thickness = GetProperty('AimbotThickness');

        ESPLib.options.BoxFillColor = GetProperty('BoxFillColor');
        ESPLib.options.healthBarsColor = GetProperty('HealthBarColor');
        ESPLib.options.healthTextColor = GetProperty('HealthAmtColor');
        ESPLib.options.distanceColor = GetProperty('DistanceEColor');
        ESPLib.options.tracerColor = GetProperty('TracerColor');
        ESPLib.options.nameColor = GetProperty('NameColor');
        ESPLib.options.boxesColor = GetProperty('BoxColor')
        ESPLib.options.outOfViewArrowsColor = GetProperty('OutClr');
        ESPLib.options.outOfViewArrowsOutlineColor = GetProperty('LineClr');

        -- // Watermark handler

        ESPLib.options.chamsFillColor = GetProperty('ChamsFillColor');
        ESPLib.options.chamsOutlineColor = GetProperty('ChamsOutlineColor');
        
        FPS = 1 / Time
        Library:SetWatermark(('Xenny-Ware | %s FPS | %s MS | Build %s | %s'):format(math.ceil(FPS), math.ceil(Player:GetNetworkPing()), Version, os.date()));
        -- // Aimbot handler

        if (IsEnabled('AimbotEnabled')) and (Character ~= nil) and (Input:IsMouseButtonPressed(Enum.UserInputType[GetProperty('MouseButton')])) and (#Targets > 0) and (Targets[1][1] ~= nil) and (GetCharacter(Targets[1][1]) ~= nil) then 


            -- // Sort through the targets table by distance or health

            if (Priority.Value == 'Distance') then
                table.sort(Targets, function(a, b)
                    return a[4] < b[4];
                end);
            elseif (Priority.Value == 'Health') then
                table.sort(Targets, function(a, b)
                    return a[3] < b[3];
                end);
            end;

            if (Targets[1][1] ~= nil) and (GetCharacter(Targets[1][1]) ~= nil) then 
                -- // Get position of the part

                local worldPoint = GetCharacter(Targets[1][1])[BodyPart.Value].Position;
                local vector, onScreen = Camera:WorldToScreenPoint(worldPoint);
                local magnitude = (Vector2.new(Mouse.X, Mouse.Y) - Vector2.new(vector.X, vector.Y)).magnitude;
                local dist = (Vector2.new(vector.X, vector.Y) - Vector2.new(Mouse.X, Mouse.Y)).Magnitude;
                local magnitudeX = Mouse.X - vector.X;
                local magnitudeY = Mouse.Y - vector.Y;
                local xsmooth = magnitudeX / GetProperty('AimbotSmoothness');
                local ysmooth = magnitudeY / GetProperty('AimbotSmoothness');

                -- // Check for prediction

                if (IsEnabled('AimbotPrediction')) then
                    worldPoint = GetCharacter(Targets[1][1])[BodyPart.Value].Position + (GetCharacter(Targets[1][1])[BodyPart.Value].Velocity * GetProperty('AimbotPredictionAmount'))
                end;

                -- // Lock on the the part if the character isnt nil

                if (GetCharacter(Targets[1][1]) ~= nil) then 
                    mousemoverel(-xsmooth, -ysmooth);
                end;

            end;
        end;

        if (Options.BindFly.Toggled == false) and (RootPart ~= nil) then 
            RootPart.Anchored = false;
        end;

        if (IsEnabled('LoopTeleport')) and (Character ~= nil) and (RootPart ~= nil) and (GetProperty('PlrTarget') ~= false) and (Players:FindFirstChild(GetProperty('PlrTarget'))) and (GetCharacter(Players:FindFirstChild(GetProperty('PlrTarget'))) ~= nil) and (GetCharacter(Players:FindFirstChild(GetProperty('PlrTarget'))):FindFirstChild('HumanoidRootPart')) then 
            RootPart.CFrame = GetCharacter(Players:FindFirstChild(GetProperty('PlrTarget'))):FindFirstChild('HumanoidRootPart').CFrame;
        end;

        if (IsEnabled('SelfHighlight')) and (HighlightFolder:FindFirstChild(Player.Name)) then 
            HighlightFolder:FindFirstChild(Player.Name).FillColor = GetProperty('SelfHighFill');
            HighlightFolder:FindFirstChild(Player.Name).OutlineColor = GetProperty('SelfHighOut');
        end;

        if (IsEnabled('ChatSpam')) then 
            ReplicatedStorage:WaitForChild('DefaultChatSystemChatEvents'):WaitForChild('SayMessageRequest'):FireServer(GetProperty('ChatMsg'), 'All');
            task.wait(GetProperty('ChatDelay'));
        end;

        -- // Auto save handler

        if (shared.__XennyWare.Values.AutoSave) then 
            SaveManager:Save(GetProperty('SaveManager_ConfigList'));
            task.wait(shared.__XennyWare.Values.AutoSaveDelay);
        end;

        -- // Walkspeed and jumppower handler

        if (Character ~= nil) then 
            
                        -- // Hitbox expander handler

                        if (IsEnabled('Hitbox')) then 
                            for Index, Value in next, Players:GetPlayers() do 
                                if (Value ~= Player) and (GetCharacter(Value) ~= nil) and (GetCharacter(Value):FindFirstChild('HumanoidRootPart')) then 
            
                                    -- // Checks 
            
            
                                    if (HitboxChecks.Value['Team'] ~= nil) and (Player.Team == Value.Team) then 
                                        continue;
                                    end;
            
                                    if (HitboxChecks.Value['Friend'] ~= nil) and (Player:IsFriendsWith(Value.UserId)) then 
                                        continue;
                                    end;
            
                                    if (HitboxWhitelist.Value[Player.Name] ~= nil) then 
                                        continue;
                                    end;
            
                                    
                                    for _, __ in next, HitboxPart.Value do 
                                        if (GetCharacter(Value):FindFirstChild(_)) then 
                                            
                                            local Part = GetCharacter(Value):FindFirstChild(_);
            
                                            Part.Size = Vector3.new(GetProperty('HitboxSize'), GetProperty('HitboxSize'), GetProperty('HitboxSize'));
                                            Part.Transparency = GetProperty('HitboxTransparency');
                                            Part.Material = GetProperty('HitboxMaterial');
                                            Part.Color = GetProperty('HitboxColor');
                                            Part.Massless = true;
                                            Part.CanCollide = false;
                                        

                                        end;
                                    end;
                                end;    
                            end;
                        
                        end;

            if (IsEnabled('CustomWalkSpeed')) then 
                Humanoid.WalkSpeed = GetProperty('WalkSpeedAmount');
            end;

            if (IsEnabled('CustomJumpPower')) then 
                Humanoid.JumpPower = GetProperty('JumpPowerAmount');
            end;

            -- // Stolen from old src, too lazy

            if (IsEnabled('Fly')) or (Options.BindFly.Toggled == true) and (GetProperty('FlyMethod') == 'CFrame') then 
               local  HRP = RootPart -- // sowwy ><
                HRP.Anchored = true;
                local Keys, v3, cf = Enum.KeyCode, Vector3.new(), CFrame.new()
                local SPI = GetProperty('FlySpeed');
                local UIS = Input; -- // sowwy
                HRP.CFrame = CFrame.new(HRP.Position, HRP.Position + Camera.CFrame.LookVector) * (UIS:GetFocusedTextBox() and cf or CFrame.new((UIS:IsKeyDown(Keys.D) and SPI) or (UIS:IsKeyDown(Keys.A) and -SPI) or 0, (UIS:IsKeyDown(Keys.E) and SPI / 2) or (UIS:IsKeyDown(Keys.Q) and -SPI / 2) or 0, (UIS:IsKeyDown(Keys.S) and SPI) or (UIS:IsKeyDown(Keys.W) and -SPI) or 0))
            end;


           
            -- // Visuals stuff

            if (IsEnabled('CustomAmbient')) then 
                Lighting.OutdoorAmbient = GetProperty('AmbientColor');
                ColorCorrection.TintColor = GetProperty('TintColor');
            end;

            if (IsEnabled('CustomColorShift')) then 
                Lighting.ColorShift_Bottom = GetProperty('ColorShiftBottom');
                Lighting.ColorShift_Top = GetProperty('ColorShiftTop');
            end;

            if (IsEnabled('NoFog')) then 
                Lighting.FogStart = 9e9;
                Lighting.FogEnd = 9e9;
            end;

            Lighting.Brightness = GetProperty('Brightness');
            Lighting.ClockTime = GetProperty('ClockTime');
            Lighting.GlobalShadows = IsEnabled('GlobalShadows');
            Camera.FieldOfView = CamFOV.Value;

            if (IsEnabled('SelfChams')) and (Character ~= nil) then 
                for Index, Value in next, Character:GetChildren() do 

                    if (IsEnabled('DeleteAccessories')) and (Value:IsA('Accessory')) or (Value:IsA('Hat')) or (Value:IsA('Shirt')) or (Value:IsA('Pants')) then 
                        Value:Destroy();
                    end;

                    if (table.find(ValidParts, Value.Name)) and (table.find(WhitelistedClasses, Value.ClassName)) and (Value.Name ~= 'HumanoidRootPart') then

                        Value.Transparency = GetProperty('SelfChamsTransparency');
                        Value.Material = GetProperty('SelfChamsMaterial');
                        Value.Color = GetProperty('SelfChamsColor');
                    end;    
                end;
            end;


            if (IsEnabled('CustomCam')) and (Camera ~= nil) then 
                for Index, Value in next, Camera:GetDescendants() do 
                    if (Value:IsA('MeshPart')) or (Value:IsA('Part')) then 

                        if (IsEnabled('DestroyCam')) then 
                            Value:Destroy();
                            continue;
                        end;

                        Value.Material = GetProperty('CamMaterial');
                        Value.Transparency = GetProperty('CamTransparency');
                        Value.Color = GetProperty('CamColor');
                        Value.Reflectance = GetProperty('CamReflectance');
                    end;
                end;
             end;

             if (IsEnabled('ThirdPerson')) then 
                 Player.CameraMode = 'Classic';
                 Player.CameraMaxZoomDistance = GetProperty('ThirdPersonDistance');
                 Player.CameraMinZoomDistance = GetProperty('ThirdPersonDistance');
             end;
        end;

    end);

end;

shared.__XennyWare.Connections['SetUpPlrChar'] = Player.CharacterAdded:Connect(SetUpCharacter);

if (PlaceId == 301549746) then -- // Counter blox


    Create('Counter Blox');
    LoadUniversal();
    local Original = {};


    -- // Game related variables

    local Client = getsenv(Player.PlayerGui:WaitForChild('Client'));
    -- // Groupboxes

    local GunMods = TabH:AddTab('Gun Mods');

    local Weapons = ReplicatedStorage:WaitForChild('Weapons', 9e9);
    local GameEffects = Visuals:AddRightGroupbox('Game Effects');
    
    for Index, Value in next, Weapons:GetDescendants() do 
        if (Value:IsA('IntValue')) or (Value:IsA('BoolValue')) then 
            for _, __ in next, getconnections(Value.Changed) do 
                __:Disable();
            end;
        end;
    end;

        -- // Change Weapon Value Function

        local function ChangeWeaponVal(Index, Value, Descendants)
            for _, __ in next, Weapons:GetDescendants() do 
                if (__.Name == Index) then 
                    Original[__] = {['Value'] = __.Value};
                    __.Value = Value;

                    if (Descendants ~= nil) and (Descendants == true) then 
                        for _, Descendant in next, __:GetDescendants() do 
                            Original[Descendant] = {['Value'] = Descendant.Value};
                            Descendant.Value = Value;
                        end;
                    end;
                end;
            end;
        end;

        local function RestoreWeaponVal(Index, Descendants)
            for _, __ in next, Weapons:GetDescendants() do 
                if (__.Name == Index) and (Original[__] ~= nil) and (type(Original[__]) == 'table') then 
                    __.Value = Original[__].Value;
                    table.remove(Original, table.find(Original, __));

                    if (Descendants ~= nil) and (Descendants == true) then 
                        for _, Descendant in next, __:GetDescendants() do 
                            if (Original[Descendant] ~= nil) and (type(Original[Descendant]) == 'table') then 
                                Descendant.Value = Original[Descendant];
                                table.remove(Original, table.find(Original, Descendant));
                            end;
                        end;
                    end;
                end;
            end;
        end;

        

    -- // Gun Mods

    local InfiniteAmmo = GunMods:AddToggle('InfAmmo', {
        Text = 'Infinite Ammo';
    }):OnChanged(function()
        if (IsEnabled('InfAmmo')) then 
            ChangeWeaponVal('Ammo', 9999999999999999);
            ChangeWeaponVal('StoredAmmo', 99999999999999999);
        else
            RestoreWeaponVal('Ammo');
            RestoreWeaponVal('StoredAmmo');
        end;
    end);

    local NoRecoil = GunMods:AddToggle('NoRecoil', {
        Text = 'No Recoil';
    }):OnChanged(function()
        if (IsEnabled('NoRecoil')) then 
            ChangeWeaponVal('Recoil', 0, true);
            ChangeWeaponVal('AccuracyDivisor', 0);
            ChangeWeaponVal('AccuracyOffset', 0);
        else
            RestoreWeaponVal('Recoil', true);
            RestoreWeaponVal('AccuracyDivisor');
            RestoreWeaponVal('AccuracyOffset');
        end;
    end);

    local NoSpread = GunMods:AddToggle('NoSpread', {
        Text = 'No Spread';
    }):OnChanged(function()
        if (IsEnabled('NoSpread')) then 
            ChangeWeaponVal('Spread', 0, true);
        else 
            RestoreWeaponVal('Spread', true);
        end;
    end)

    local InfinitePen = GunMods:AddToggle('InfPen', {
        Text = 'Infinite Penetration';
    }):OnChanged(function()
        if (IsEnabled('InfPen')) then 
            ChangeWeaponVal('Penetration', 99999999999999);
        else
            RestoreWeaponVal('Penetration');
        end;
    end);

    local FullAuto = GunMods:AddToggle('FullAuto', {
        Text = 'All Guns Full Auto';
    }):OnChanged(function()
        if (IsEnabled('FullAuto')) then 
            ChangeWeaponVal('Auto', true);
        else
            RestoreWeaponVal('Auto');
        end;
    end)

    local FastFireRate = GunMods:AddToggle('FastFire', {
        Text = 'Fast Fire Rate';
    }):OnChanged(function()
        if (IsEnabled('FastFire')) then 
            ChangeWeaponVal('FireRate', -99);
        else
            RestoreWeaponVal('FireRate');
        end;
    end);

    local CustomBullets = GunMods:AddToggle('CustomBullets', {
        Text = 'Custom Bullet Amount';
    }):OnChanged(function()
        if (not IsEnabled('CustomBullets')) then 
            RestoreWeaponVal('Bullets');
        end;
    end);

    local NumBullets = GunMods:AddSlider('NumBullets', {
        Text = 'Number of Bullets';
        Min = 0;
        Max = 500;
        Default = 100;
        Rounding = 3;
    }):OnChanged(function()
        if (IsEnabled('CustomBullets')) then 
            ChangeWeaponVal('Bullets', GetProperty('NumBullets'));
        end;
    end);

    local OneShot = GunMods:AddToggle('OneShot', {
        Text = 'One Shot';
    }):OnChanged(function()
        if (IsEnabled('OneShot')) then 
            ChangeWeaponVal('DMG', 999999);
        else
            RestoreWeaponVal('DMG');
        end;
    end);

    local NoFlash = GameEffects:AddToggle('NoFlash', {
        Text = 'No Blind Effects';
    })

    local NoDeafen = GameEffects:AddToggle('NoDeaf', {
        Text = 'No Deafen Effects';
    })

    shared.__XennyWare.Connections['CBROLoop'] = RunService.RenderStepped:Connect(function()

        if (IsEnabled('NoDeaf')) then 
            Player.PlayerGui:WaitForChild('Deafen').Disabled = true;
        end;

        if (IsEnabled('NoFlash')) then 
            Player.PlayerGui:WaitForChild('Blind').Disabled = true;
            Player.PlayerGui:WaitForChild('Blnd').Enabled = false;
        end;

        if (IsEnabled('NoRecoil')) and (Client ~= nil) and (type(Client.resetaccuracy) == 'function') then 
            Client.resetaccuracy();
            Client.RecoilX = 0;
            Client.RecoilY = 0;
        end;
    end);

elseif (PlaceId == 142823291) then 

      Create('Murder Mystery 2');
      LoadUniversal();

      -- // Create silent aim circle

      local SilentAimCircle = Drawing.new('Circle');
      SilentAimCircle.Radius = 100;
      SilentAimCircle.Color = Color3.fromRGB(255, 255, 255);
      SilentAimCircle.Visible = false;

      -- // Remotes

      local PlayerData = ReplicatedStorage:WaitForChild('GetPlayerData', 9e9);
      local Farm = Misc:AddLeftGroupbox('Farm');
      local KillAura = TabH:AddTab('Kill-Aura');
      local SilentAim = TabB:AddTab('Silent Aim');

      -- // Game functions

      local PlrRoles = {
          ['Murderer'] = 'None';
          ['Sheriff'] = 'None';
      };

  

      local function UpdateRoles()
        for Index, Value in next, Players:GetPlayers() do 
            if (Value ~= Player) and (GetCharacter(Value) ~= nil) then 
                local Data = PlayerData:InvokeServer()[Player.Name];

                if (Data == nil) then 
                    continue;
                end;

                if (Data.Role == nil) then continue end;

                if (PlrRoles[Data.Role] ~= nil) then 
                    PlrRoles[Data.Role] = Value.Name;
                end;
            end;
        end;
      end;

      local function Stab()
          local Strings = {'Down'; 'Slash'}
          if (Character ~= nil) and (Character:FindFirstChildOfClass('Tool')) and (Character:FindFirstChildOfClass('Tool'):FindFirstChild('Stab')) then 
             Character:FindFirstChildOfClass('Tool'):FindFirstChild('Stab'):FireServer(Strings[math.random(1, #Strings)]);
          end;
      end;

      local function Shoot(Location)
         if (Character ~= nil) and (Character:FindFirstChild('Gun')) and (Character:FindFirstChild('Gun'):FindFirstChild('KnifeServer')) and (Character:FindFirstChild('Gun'):FindFirstChild('KnifeServer'):FindFirstChild('ShootGun')) then 
            Character:FindFirstChild('Gun'):FindFirstChild('KnifeServer'):FindFirstChild('ShootGun'):InvokeServer(1, Location, 'AH');
         end;
      end;


      local EnableSilent = SilentAim:AddToggle('SilentAim', {
          Text = 'Toggle';
      });

      local VisualizeSilent = SilentAim:AddToggle('VisualizeSilent', {
          Text = 'Visualize Field of View';
      }):AddColorPicker('SilentColor', {
          Text = 'Circle Color';
          Default = Color3.fromRGB(255, 255, 255);
      });

      local AutoAdjust = SilentAim:AddToggle('AutoAdjust', {
          Text = 'Auto Adjust';
      });

      local SilentBody = SilentAim:AddDropdown('SilentBodyPart', {
          Text = 'Body Part';
          Multi = false;
          Values = ListCharacterParts();
      });

      
      local SilentPrediction = SilentAim:AddSlider('SilentPrediction', {
          Text = 'Prediction Interval';
          Min = 0;
          Max = 250;
          Default = 150;
          Rounding = 3;
      });

      local SilentFOV = SilentAim:AddSlider('SilentFOV', {
          Text = 'Field of View';
          Min = 0;
          Max = 500;
          Default = 100;
          Rounding = 3;
      });

      local SilentFriends  = SilentAim:AddToggle('SilentFriends', {
          Text = 'Ignore Friends';
      });

      local EnableKillAura = KillAura:AddToggle('KillAura', {
          Text = 'Toggle';
      });

      local KillAuraDistance = KillAura:AddSlider('KillAuraDistance', {
          Text = 'Max Distance';
          Min = 0;
          Max = 15;
          Default = 10;
          Rounding = 3;
      });

      local KillAuraIgnore = KillAura:AddToggle('IgnoreFriends', {
          Text = 'Ignore Friends';
      });

      local KillAuraWeps = KillAura:AddDropdown('KillAuraWeapons', {
          Text = 'Weapons';
          Multi = true;
          Values = {'Gun'; 'Knife'};
          Default = 2;
      });

      local KillAuraWhitelist = KillAura:AddDropdown('KillAuraWl', {
          Text = 'Whitelist';
          Multi = true;
          Values = FetchPlayers();
          AllowNull = true;
      });
      

      local IgnoreInnocents = AimbotBox:AddToggle('IgnoreInnocents', {
          Text = 'Ignore Innocents When Sheriff'
      });
      
      
      ESPLib.Overrides.GetColor = function(Object)
          local Roles = {
            ['Murderer'] = Color3.fromRGB(47, 0, 255);
            ['Innocent'] = Color3.fromRGB(81, 255, 0);
            ['Sheriff'] = Color3.fromRGB(255, 0, 0);
            ['Hero'] = Color3.fromRGB(173, 255, 21);
          };

          for _, __ in next, PlrRoles do
              if (__ == Object.Name) then 
                  return Roles[_];
              end;
          end;

          return Color3.fromRGB(232, 255, 23);
      end;

      local function GetSilentAimTarget()
        for Index, Value in next, Players:GetPlayers() do 
            if (Value ~= Player) and (GetCharacter(Value) ~= nil) and (GetCharacter(Value):FindFirstChild('HumanoidRootPart')) and (GetCharacter(Value):FindFirstChildOfClass('Humanoid')) and (Player:DistanceFromCharacter(GetCharacter(Value):FindFirstChild('HumanoidRootPart').Position) <= 300) and (Value:FindFirstChild(GetProperty('SilentBodyPart'))) then
                  
                  if (IsEnabled('SilentFriends')) and (Player:IsFriendsWith(Value.UserId)) then 
                      continue;
                  end;

                  
                  local worldPoint = GetCharacter(Value):FindFirstChild(GetProperty('SilentBodyPart')).Position;
                  local vector, onScreen = Camera:WorldToScreenPoint(worldPoint);
                  local magnitude = (Vector2.new(Mouse.X, Mouse.Y) - Vector2.new(vector.X, vector.Y)).magnitude;

                  if (magnitude <= GetProperty('SilentFOV')) and (GetCharacter(Value) ~= nil) then 
                      return Value;
                  end;
            end;
        end;
    end;

      OldNameCall = hookmetamethod(game, '__namecall', newcclosure(function(self, ...)
           local Args = { ... };
           local Method = getnamecallmethod();

           if (Method == 'InvokeServer') and (tostring(self) == 'ShootGun') then
            if (IsEnabled('SilentAim'))  and (GetSilentAimTarget() ~= nil) and (GetCharacter(GetSilentAimTarget()) ~= nil) and (GetCharacter(GetSilentAimTarget()):FindFirstChild(GetProperty('SilentBodyPart')))  then 


               local FinalPart = 'HumanoidRootPart';

               if (IsEnabled('AutoAdjust')) then 
                    if (GetCharacter(GetSilentAimTarget()).Humanoid:GetState() == Enum.HumanoidStateType.Jumping) then 
                        FinalPart = 'Right Leg';
                    end;

                    if (GetCharacter(GetSilentAimTarget()).Humanoid:GetState() == Enum.HumanoidStateType.FallingDown) then 
                        FinalPart = 'Right Foot';
                    end;

                    if (GetCharacter(GetSilentAimTarget()).Humanoid:GetState() == Enum.HumanoidStateType.Freefall) then 
                        FinalPart = 'Left Foot';
                    end;
               end;

               Args[2] = GetCharacter(GetSilentAimTarget())[FinalPart].Position + GetCharacter(GetSilentAimTarget())[FinalPart].AssemblyLinearVelocity / GetProperty('SilentPrediction');

               return OldNameCall(self, unpack(Args));
           end;
        end;
           return OldNameCall(self, unpack(Args));
      end));

      shared.__XennyWare.Connections['MM2Loop'] = RunService.RenderStepped:Connect(function()

           UpdateRoles();
           GetSilentAimTarget();

           SilentAimCircle.Visible = IsEnabled('VisualizeSilent');
           SilentAimCircle.Radius = GetProperty('SilentFOV');
           SilentAimCircle.Color = GetProperty('SilentColor')
            
           if (IsEnabled('VisualizeSilent')) then 
               SilentAimCircle.Position = WTS(Mouse.hit.p);
           end;

           if (Character ~= nil) and (RootPart ~= nil) and (Humanoid ~= nil) then 
               if (IsEnabled('KillAura')) and (Character:FindFirstChildOfClass('Tool')) then 
                    if (GetProperty('KillAuraWeapons')[Character:FindFirstChildOfClass('Tool').Name] == nil) then 
                        return;
                    end;

                    for Index, Value in next, Players:GetPlayers() do 
                        if (Value ~= Player) and (GetCharacter(Value) ~= nil) and (GetCharacter(Value):FindFirstChild('HumanoidRootPart')) and (GetCharacter(Value):FindFirstChildOfClass('Humanoid')) then 

                            if (Player:DistanceFromCharacter(GetCharacter(Value):FindFirstChild('HumanoidRootPart').Position) > GetProperty('KillAuraDistance')) then 
                                continue;
                            end;

                            if (IsEnabled('IgnoreFriends')) and (Player:IsFriendsWith(Value.UserId)) then 
                                continue;
                            end;

                            if (GetProperty('KillAuraWl')[Value.Name] ~= nil) then 
                                continue;
                            end;
                            if (Character:FindFirstChildOfClass('Tool').Name == 'Knife') then 
                                Stab();
                            elseif (Character:FindFirstChildOfClass('Tool').Name == 'Gun') then 
                                local Velocity = GetCharacter(Value):FindFirstChild('HumanoidRootPart').AssemblyLinearVelocity / 50;
                                Shoot(GetCharacter(Value):FindFirstChild('HumanoidRootPart').Position + Velocity);
                            end;
                        end;
                    end;
               end;
           end;
      end);

    elseif (PlaceId == 286090429) then -- // Arsenal 


    Create('Arsenal', true);
    LoadUniversal();
    
    -- // Create silent aim circle

    local SilentAimCircle = Drawing.new('Circle');
    SilentAimCircle.Radius = 100;
    SilentAimCircle.Color = Color3.fromRGB(255, 255, 255);
    SilentAimCircle.Visible = false;
    SilentAimCircle.Thickness = 1;

    local Client = Player.PlayerGui:WaitForChild('GUI', 9e9):WaitForChild('Client', 9e9);
    local ClientEnv = getsenv(Client);
    local Variables = Client:WaitForChild('Variables', 9e9);
    local OFunctions = Client:WaitForChild('Functions', 9e9);
    local Weapons = ReplicatedStorage:WaitForChild('Weapons', 9e9);
    local StepModules = Client:WaitForChild('StepModules', 9e9);

    local MeleesPath = ReplicatedStorage:WaitForChild('Melees', 9e9);
    local MeleeValue = Player:WaitForChild('Data'):WaitForChild('Melee');

    local Melees = {};

    local Debris = workspace:WaitForChild('Debris');
    
    local GameFuncs = Misc:AddLeftGroupbox('Game Functions');
    local VizTab = Visuals:AddRightTabbox();
    local GameVisuals = VizTab:AddTab('Game Visuals');
    local CameraVisuals = VizTab:AddTab('Camera Visuals');

    local SilentTab = TabB:AddTab('Silent Aim');
    local RageStuff = Rage:AddRightTabbox();
    local AntiAim = RageStuff:AddTab('Anti-Aim');
    local Exploits = RageStuff:AddTab('Exploits');

    local Original = {};

    local GunMods = TabH:AddTab('Gun Mods');

    local KillAura = TabH:AddTab('Kill Aura');
    local SkinChanger = Misc:AddRightGroupbox('Skin Changer');
    local Viewmodel = TabHolder:AddTab('Viewmodel');

    for Index, Value in next, Weapons:GetDescendants() do 
        if (Value:IsA('IntValue')) or (Value:IsA('BoolValue')) or (Value:IsA('NuberValue')) then 
            for _, __ in next, getconnections(Value.Changed) do 
                __:Disable();
            end;
        end;
    end;

    for Index, Value in next, Client:GetDescendants() do
        if (Value:IsA('IntValue')) or (Value:IsA('BoolValue')) or (Value:IsA('NumberValue')) then 
            for _, __ in next, getconnections(Value.Changed) do  
                __:Disable();
            end;
        end;
    end;

    for Index, Value in next, Player:WaitForChild('Data'):GetDescendants() do 
        if (Value:IsA('IntValue')) or (Value:IsA('BoolValue')) or (Value:IsA('NumberValue')) then 
            for _, __ in next, getconnections(Value.Changed) do 
                __:Disable();
            end;
        end;    
    end;

    ClientEnv.UnforseenConsequences = function() end;

    for Index, Value in next, MeleesPath:GetChildren() do 
        Melees[Value.Name] = Value.Name;
    end;

        -- // Change Weapon Value Function

        local function ChangeWeaponVal(Index, Value, Descendants)
            for _, __ in next, Weapons:GetDescendants() do 
                if (__.Name == Index) and (__:IsA('IntValue')) or (__:IsA('NumberValue')) or (__:IsA('BoolValue')) then 
                    Original[__] = {['Value'] = __.Value};
                    __.Value = Value;

                    if (Descendants ~= nil) and (Descendants == true) then 
                        for _, Descendant in next, __:GetDescendants() do 
                            Original[Descendant] = {['Value'] = Descendant.Value};
                            Descendant.Value = Value;
                        end;
                    end;
                end;
            end;
        end;

        local function RestoreWeaponVal(Index, Descendants)
            for _, __ in next, Weapons:GetDescendants() do 
                if (__.Name == Index) and (Original[__] ~= nil) and (type(Original[__]) == 'table') then 
                    __.Value = Original[__].Value;
                    table.remove(Original, table.find(Original, __));

                    if (Descendants ~= nil) and (Descendants == true) then 
                        for _, Descendant in next, __:GetDescendants() do 
                            if (Original[Descendant] ~= nil) and (type(Original[Descendant]) == 'table') then 
                                Descendant.Value = Original[Descendant];
                                table.remove(Original, table.find(Original, Descendant));
                            end;
                        end;
                    end;
                end;
            end;
        end;


        local InfAmmo = GunMods:AddToggle('InfAmmo', {
            Text = 'Infinite Ammo';
        });

        local NoSpread = GunMods:AddToggle('NoSpread', {
            Text = 'No Spread';
        }):OnChanged(function()
            if (IsEnabled('NoSpread')) then 
                ChangeWeaponVal('Spread', 0.02);
                ChangeWeaponVal('SpreadRecovery', 0.02);
                ChangeWeaponVal('MaxSpread', 0.02);
            else
                RestoreWeaponVal('Spread');
                RestoreWeaponVal('SpreadRecovery');
                RestoreWeaponVal('MaxSpread');
            end;

        end);

        local NoRecoil = GunMods:AddToggle('NoRecoil', {
            Text = 'No Recoil';
        }):OnChanged(function()
            if (IsEnabled('NoRecoil')) then
                ChangeWeaponVal('RecoilControl', 0.02);
            else
                RestoreWeaponVal('RecoilControl');
            end;
        end);

        local AlwaysAuto = GunMods:AddToggle('AlwaysAuto', {
            Text = 'Always Auto';
        }):OnChanged(function()
                if (IsEnabled('AlwaysAuto')) then
                ChangeWeaponVal('Auto', true);
            else
                RestoreWeaponVal('Auto');
            end;
        end);

        local CustomFireRate = GunMods:AddToggle('CustomFire', {
            Text = 'Custom Fire Rate';
        }):OnChanged(function()
            if (not IsEnabled('CustomFire')) then 
                RestoreWeaponVal('FireRate');
            end;
        end);

        local FireRate = GunMods:AddSlider('FireRate', {
            Text = 'Fire Rate';
            Min = 0.04;
            Max = 5;
            Default = 1;
            Rounding = 3;
        }):OnChanged(function()
            if (IsEnabled('CustomFire')) then 
                ChangeWeaponVal('FireRate', GetProperty('FireRate'));
            end;
        end);

        local NoRampup = GunMods:AddToggle('InstantEquip', {
            Text = 'InstantEquip';
        }):OnChanged(function()
            if (IsEnabled('InstantEquip')) then 
                ChangeWeaponVal('EquipTime', 0.02);
            else
                RestoreWeaponVal('EquipTime');
            end;
        end);

        local CustomBulletAmt = GunMods:AddToggle('CustomBulletAmt', {
            Text = 'Custom Bullet Amount';
        }):OnChanged(function()
            if (not IsEnabled('CustomBulletAmt')) then 
                RestoreWeaponVal('Bullets');
            end;
        end);

        local BulletAmt = GunMods:AddSlider('BulletAmt', {
            Text = 'Bullet Amount';
            Min = 1;
            Max = 200;
            Default = 15;
            Rounding = 3;
        }):OnChanged(function()
            if (IsEnabled('CustomBulletAmt')) then  
                ChangeWeaponVal('Bullets', GetProperty('BulletAmt'));
            end;
        end);

        local AutoHeal = GameFuncs:AddToggle('AutoHeal', {
            Text = 'Auto Heal';
        });

        local AutoPickupAmmo = GameFuncs:AddToggle('AutoAmmo', {
            Text = 'Auto Pickup Ammo';
        });

        local HealthESP = GameVisuals:AddToggle('HealthESP', {
            Text = 'Dead Health ESP';
        });

        local AmmoESP = GameVisuals:AddToggle('AmmoESP', {
            Text = 'Dead Ammo ESP';
        });

        local CustomRagdoll = GameVisuals:AddToggle('CustomRag', {
            Text = 'Custom Ragdolls';
        }):AddColorPicker('RagColor', {
            Text = 'Ragdoll Color';
            Default = Color3.fromRGB(255, 255, 255);
        });

        local RagdollMaterial = GameVisuals:AddDropdown('RagMat', {
            Text = 'Ragdoll Material';
            AllowNull = false;
            Default = 1;
            Values = {'ForceField'; 'Neon'; 'Wood'};
        });

        local RagdollTrans = GameVisuals:AddSlider('RagTrans', {
            Text = 'Ragdoll Transparency';
            Min = 0;
            Max = 1;
            Default = 0;
            Rounding = 3;
        });

        local RagdollClear = GameVisuals:AddToggle('RagClear', {
            Text = 'Clear Ragdoll Accessories';
        });

        local CustomGun = CameraVisuals:AddToggle('CustomGun', {
            Text = 'Custom Gun';
        }):AddColorPicker('GunColor', {
            Text = 'Gun Color';
            Default = Color3.fromRGB(255, 255, 255);
        });

        local GunMaterial = CameraVisuals:AddDropdown('GunMaterial', {
            Text = 'Gun Material';
            Default = 1;
            Values = {'ForceField'; 'Neon'; 'Foil'};
        });

        local GunTransparency = CameraVisuals:AddSlider('GunTrans', {
            Text = 'Gun Transparency';
            Min = 0;
            Max = 1;
            Default = 0;
            Rounding = 3;
        });

        local CustomArms = CameraVisuals:AddToggle('CustomArms', {
            Text = 'Custom Arms';
        }):AddColorPicker('ArmColor', {
            Text = 'Gun Color';
            Default = Color3.fromRGB(255, 255, 255);
        });

        local GunMaterial = CameraVisuals:AddDropdown('ArmMaterial', {
            Text = 'Arm Material';
            Default = 1;
            Values = {'ForceField'; 'Neon'; 'Foil'};
        });

        local GunTransparency = CameraVisuals:AddSlider('ArmTrans', {
            Text = 'Arms Transparency';
            Min = 0;
            Max = 1;
            Default = 0.7;
            Rounding = 3;
        });

        local HighlightArms = CameraVisuals:AddToggle('HighlightArms', {
            Text = 'Highlight Arms';
        }):AddColorPicker('ArmOutline', {
            Text = 'Outline Color';
            Default = Color3.fromRGB(255, 255, 255);
        }):AddColorPicker('ArmFill', {
            Text = 'Fill Color';
            Default = Color3.fromRGB(255, 255, 255);
        }):OnChanged(function()
            if (IsEnabled('HighlightArms')) and (Camera:FindFirstChild('Arms')) then 
                local Highlight = Instance.new('Highlight', HighlightFolder);
                Highlight.Name = 'ARMZ_$$$';
                Highlight.Adornee = Camera:FindFirstChild('Arms');
                Highlight.FillColor = GetProperty('ArmFill');
                Highlight.OutlineColor = GetProperty('ArmOutline');
                Highlight.OutlineTransparency = GetProperty('ArmFillOutTrans');
                Highlight.FillTransparency = GetProperty('ArmFillTrans');
                
            elseif (HighlightFolder:FindFirstChild('ARMZ_$$$')) then 
                HighlightFolder:FindFirstChild('ARMZ_$$$'):Destroy();
            end;    
        end);

        local ArmsFillTrans = CameraVisuals:AddSlider('ArmFillOutTrans', {
            Text = 'Outline Transparency';
            Min = 0;
            Max = 1;
            Default = 0;
            Rounding = 3;
        }):OnChanged(function()
            if (IsEnabled('HighlightArms')) and (HighlightFolder:FindFirstChild('ARMZ_$$$')) then 
                HighlightFolder:FindFirstChild('ARMZ_$$$').OutlineTransparency = GetProperty('ArmFillOutTrans');
            end;
        end);

        local ArmsFillTrans = CameraVisuals:AddSlider('ArmFillTrans', {
            Text = 'Fill Transparency';
            Min = 0;
            Max = 1;
            Default = 0;
            Rounding = 3;
        }):OnChanged(function()
            if (IsEnabled('HighlightArms')) and (HighlightFolder:FindFirstChild('ARMZ_$$$')) then 
                HighlightFolder:FindFirstChild('ARMZ_$$$').FillTransparency = GetProperty('ArmFillTrans');
            end;
        end);

        local EnableAA = AntiAim:AddToggle('EnableAA', {
            Text = 'Enable';
        });

        local CustomPitch = AntiAim:AddToggle('CustomPitch', {
            Text = 'Custom Pitch';
        });

        local Pitch = AntiAim:AddSlider('Pitch', {
            Text = 'Pitch';
            Min = -99999999;
            Max = 99999999;
            Default = 1;
            Rounding = 1;
        });

        local CustomYAW = AntiAim:AddToggle('CustomYAW', {
            Text = 'Custom YAW';
        });

        local CustomYAWValue = AntiAim:AddSlider('YAW', {
            Text = 'YAW';
            Min = -360;
            Max = 360;
            Default = 360;
            Rounding = 1;
        });

        local Spin = AntiAim:AddToggle('Spin', {
            Text = 'Spin';
        });

        local CustomStance = AntiAim:AddToggle('CustomStance', {
            Text = 'Custom Stance';
        });

        local Stance = AntiAim:AddDropdown('Stance', {
            Text = 'Stance';
            Default = 1;
            Values = {'Crouch';};
        });


        local CustomHip = AntiAim:AddToggle('CustomHip', {
            Text = 'Custom Hip-Height';
        });

        local HipHeight = AntiAim:AddSlider('HipHeight', {
            Text = 'Hip Height';
            Min = -10;
            Max = 25;
            Default = Humanoid ~= nil and Humanoid.HipHeight or 2;
            Rounding = 3;
        });

        local NoHeadshot = Exploits:AddToggle('AntiHeadshot', {
            Text = 'Anti-Headshot';
        });

        local SilentAim = SilentTab:AddToggle('SilentAim', {
            Text = 'Toggle';
        });

        local VisualizeFOV = SilentTab:AddToggle('SilentVis', {
            Text = 'Visualize FOV';
        }):AddColorPicker('SilentColor', {
            Text = 'FOV Circle Color';
            Default = Color3.fromRGB(255, 255, 255);
        });

        local SilentFOV = SilentTab:AddSlider('SilentFOV', {
            Text = 'Field of View';
            Min = 0;
            Max = 350;
            Default = 150;
            Rounding = 3;
        });

        local Part = SilentTab:AddDropdown('SilentBody', {
            Text = 'Silent Body Part';
            Values = ListCharacterParts();
        });

        local Backtrack = GameFuncs:AddToggle('Backtrack', {
            Text = 'Backtrack';
        }):AddColorPicker('BackColor', {
            Text = 'Backtrack Color';
            Default = Color3.fromRGB(255, 255, 255);
        });

        local Backtrackms = GameFuncs:AddSlider('BacktrackMS', {
            Text = 'Backtrack MS';
            Min = 0;
            Max = 10000;
            Default = 1000;
            Rounding = 3;
        });

        local NoHead = Exploits:AddToggle('NoHead', {
            Text = 'No Head';
        });

        local NoLegs = Exploits:AddToggle('NoLegs', {
            Text = 'No Legs';
        });

        local NoArms = Exploits:AddToggle('NoArms', {
            Text = 'No Arms';
        });

        local NoOverheat = Exploits:AddToggle('NoHeat', {
            Text = 'No Overheat';
        });



        local KillAuraEnable = KillAura:AddToggle('KillAura', {
            Text = 'Toggle';
        });

        local KillAuraDistance = KillAura:AddSlider('KillAuraDistance', {
            Text = 'Max Distance';
            Min = 1;
            Max = 25;
            Default = 15;
            Rounding = 3;
        });

        local KillAuraPart = KillAura:AddDropdown('KillAuraPart', {
            Text = 'Hit Part';
            Values = {'Head'; 'HumanoidRootPart'};
            Defualt = 1;
        });
 
        SkinChanger:AddToggle('SkinChange', {
            Text = 'Toggle';
        });

        SkinChanger:AddDropdown('CustomMelee', {
            Text = 'Melee';
            Values = Melees;
            AllowNull = true;
        });

        SkinChanger:AddButton('Apply Melee', function()
            if (IsEnabled('SkinChange')) and (GetProperty('CustomMelee') ~= nil) then 
                MeleeValue.Value = GetProperty('CustomMelee');
            end;
        end);

        Viewmodel:AddToggle('CustomView', {
            Text = 'Custom Viewmodel';
        });

        Viewmodel:AddSlider('ViewmodelX', {
            Text = 'X';
            Min = -25;
            Max = 25;
            Default = 15;
            Rounding = 3;
        });

        Viewmodel:AddSlider('ViewmodelY', {
            Text = 'Y';
            Min = -25;
            Max = 25;
            Default = 15;
            Rounding = 3;
        });

        Viewmodel:AddSlider('ViewmodelZ', {
            Text = 'Z';
            Min = -25;
            Max = 25;
            Default = 15;
            Rounding = 3;
        });

        local VelocityOverride = Exploits:AddToggle('VelocityOverride', {
            Text = 'Velocity Override';
        });

        local BHop = GameFuncs:AddToggle('BHop', {
            Text = 'Bunny Hop';
        });


        -- // Hook stuff

        local Old, Old2;

        Old = hookfunction(require(StepModules:WaitForChild('GunMechanics')).work, function(...)

            if (IsEnabled('NoHeat')) then 
                return;
            end;

            return Old(...);
        end);

        Old2 = require(OFunctions.General).applyvelocity

        Old2 = function(...)

            if (IsEnabled('VelocityOverride')) then 
                return;
            end;

            return Old2(...);
        end;

        local function getPositionOnScreen(Vector)
            local Vec3, OnScreen = Camera.WorldToScreen(Camera, Vector)
            return Vector2.new(Vec3.X, Vec3.Y), OnScreen
        end

        local function GetSilentAimTarget()
            for Index, Value in next, Players:GetPlayers() do 

                if (Value ~= Player) and (GetCharacter(Value) ~= nil) and (GetCharacter(Value):FindFirstChild('HumanoidRootPart')) and (GetCharacter(Value):FindFirstChildOfClass('Humanoid'))  and (GetCharacter(Value.Character):FindFirstChild(GetProperty('SilentBody'))) and (Value.Team ~= Player.Team) then

                      local worldPoint = GetCharacter(Value):FindFirstChild(GetProperty('SilentBody')).Position;
                      local vector, onScreen = Camera:WorldToScreenPoint(worldPoint);

                      if (not onScreen) then 
                          continue;
                      end;

                      local magnitude = (Vector2.new(Mouse.X, Mouse.Y) - Vector2.new(vector.X, vector.Y)).magnitude;
    
                      if (magnitude <= GetProperty('SilentFOV')) and (GetCharacter(Value) ~= nil) and (onScreen) then 
                          return GetCharacter(Value)[GetProperty('SilentBody')];
                      end;
                end;
            end;
        end;
    
        shared.__XennyWare.Connections['CameraChild'] = Camera.ChildAdded:Connect(function(Object)
            if (IsEnabled('HighlightArms')) and (Object.Name == 'Arms') and (HighlightFolder:FindFirstChild('ARMZ_$$$')) then 
                HighlightFolder:FindFirstChild('ARMZ_$$$').Adornee = Object;
            end;
        end);

        OldNameCall = hookmetamethod(game, '__namecall', newcclosure(function(self, ...)
            local Args = { ... };
            local Method = getnamecallmethod();

            if (Method:lower() == 'fireserver') and (tostring(self):lower() == 'controlturn') and (IsEnabled('EnableAA')) and (IsEnabled('CustomPitch')) then 
                Args[1] = GetProperty('Pitch');

               return OldNameCall(self, unpack(Args));
            end;

            if (Method:lower() == 'fireserver') and (tostring(self) == 'HitPart') then 

                if (Args[1].Name == 'Backtrack') and (IsEnabled('Backtrack')) then 
                    Args[1] = Args[1].Parent['Head'];

                    return OldNameCall(self, unpack(Args));
                end;
            end;

            
            if (Method == 'FindPartOnRayWithIgnoreList') and (IsEnabled('SilentAim')) and (GetSilentAimTarget() ~= nil) and (self == workspace)  then 
                    Args[1] = Ray.new(Camera.CFrame.Position, (GetSilentAimTarget().Position - Camera.CFrame.Position).Unit * 1000);
                    return OldNameCall(self, unpack(Args));
            end;

            return OldNameCall(self, ...);
        end));

        local function Stab(Part)
            ReplicatedStorage.Events[utf8.char(8203, 72, 105, 116, 80, 97, 114, 116)]:FireServer(Part, "\0\0Knife\0D0¡ý\"µ\f'8±gÆÑd‚Q\fœœ", 'swagg');
        end;

        shared.__XennyWare.Connections['DebrisAdded'] = Debris.ChildAdded:Connect(function(Object)
            if (Object.Name == 'DeadHP') then
                if (IsEnabled('AutoHeal')) and (RootPart ~= nil) then 
                    firetouchinterest(Object:WaitForChild('TouchInterest'), RootPart, 1);
                    firetouchinterest(Object:WaitForChild('TouchInterest'), RootPart, 0);
                end;

                if (IsEnabled('HealthESP')) then 
                    local __ = Object -- // sowwy ><
                    local Cham = Instance.new('BoxHandleAdornment', __);

                    table.insert(shared.__XennyWare.Instances, Cham);
                    Cham.Adornee = __;
                    Cham.Size = __.Size;
                    Cham.Transparency = 0.5;
                    Cham.AlwaysOnTop = true;
                    Cham.ZIndex = 0;
                    Cham.Color3 = Color3.fromRGB(0, 255, 55)
                end;
            end;

            if (Object.Name == 'DeadAmmo') then
                if (IsEnabled('AutoAmmo')) and (RootPart ~= nil) then 
                    firetouchinterest(Object:WaitForChild('TouchInterest'), RootPart, 1);
                    firetouchinterest(Object:WaitForChild('TouchInterest'), RootPart, 0);
                end;

                if (IsEnabled('AmmoESP')) then 
                    local __ = Object -- // sowwy ><
                    local Cham = Instance.new('BoxHandleAdornment', __);
                    table.insert(shared.__XennyWare.Instances, HighlightFolder);
                    Cham.Adornee = __;
                    Cham.Size = __.Size;
                    Cham.Transparency = 0.5;
                    Cham.AlwaysOnTop = true;
                    Cham.ZIndex = 0;
                    Cham.Color3 = Color3.fromRGB(167, 255, 2)
                end;
            end;

            if (Object:IsA('Model')) and (IsEnabled('CustomRag')) then 
                local RP = Object:WaitForChild('HumanoidRootPart');
                
                for Index, Value in next, Object:GetChildren() do 

                    if (Value:IsA('Accessory')) or (Value:IsA('Hat')) and (IsEnabled('ClearRag')) then 
                        Value:Destroy();
                    end;

                    if (Value:IsA('MeshPart')) or (Value:IsA('Part')) then 
                        Value.Color = GetProperty('RagColor');
                        Value.Material = GetProperty('RagMat');
                        Value.Transparency = GetProperty('RagTrans');
                    end;
                end;
            end;
        end);

       
        shared.__XennyWare.Connections['ArsenalLoop'] = RunService.RenderStepped:Connect(function()

            SilentAimCircle.Visible = IsEnabled('SilentVis');
            SilentAimCircle.Radius = GetProperty('SilentFOV');
            SilentAimCircle.Color = GetProperty('SilentColor');
            SilentAimCircle.Position = WTS(Mouse.hit.p);

            if (Character:FindFirstChild('HeadHB')) and (IsEnabled('AntiHeadshot')) then 
                Character:FindFirstChild('HeadHB'):Destroy();
            end;

            if (IsEnabled('InfAmmo')) then
                Variables.ammocount.Value = 999;
                Variables.ammocount2.Value = 999;
            end;

            if (IsEnabled('CustomStance')) then 
                if (GetProperty('Stance') == 'Crouch') then 
                    Variables.ctrlcrouch.Value = true;
                end;
            end;

            if (IsEnabled('CustomHip')) and (Humanoid ~= nil) then 
                Humanoid.HipHeight = GetProperty('HipHeight');
            end;

            if (IsEnabled('HighlightArms')) and (HighlightFolder:FindFirstChild('ARMZ_$$$')) then 
                HighlightFolder:FindFirstChild('ARMZ_$$$').FillColor = GetProperty('ArmFill');
                HighlightFolder:FindFirstChild('ARMZ_$$$').OutlineColor = GetProperty('ArmOutline');
            end;

            if (IsEnabled('Backtrack')) then 
                for Index, Value in next, Players:GetPlayers() do 
                    if (Value ~= Player) and (Value.Team ~= nil) and (Value.Team ~= Player.Team) and (GetCharacter(Value) ~= nil) and (GetCharacter(Value):FindFirstChild('HeadHB')) then 
                        local Clone = Instance.new('Part', GetCharacter(Value));
                        Clone.Color = GetProperty('BackColor');
                        Clone.Transparency = 0.5;
                        Clone.Position = GetCharacter(Value):FindFirstChild('HeadHB').Position;
                        Clone.Size = GetCharacter(Value):FindFirstChild('HeadHB').Size;
                        Clone.Material = 'ForceField';
                        Clone.Name = 'HeadHB';
                        Clone.Anchored = true;
                        Clone.CanCollide = false;

                        task.defer(function()
                            task.wait(GetProperty('BacktrackMS') / 1000);
                            if (Clone.Parent ~= nil) then Clone:Destroy() end;
                        end)

                    end;
                end;    
            end;

            if (IsEnabled('EnableAA'))  then 

                if (IsEnabled('CustomYAW')) and (not IsEnabled('Spin')) then 
                    AA(0, GetProperty('YAW'));
                end;

                if (IsEnabled('Spin')) then 
                    AA(0, math.random(-360, 360));
                end;
            end;

            if (IsEnabled('CustomArms')) or (IsEnabled('CustomGun')) or (IsEnabled('CustomView')) and (Camera:FindFirstChild('Arms')) and (Camera:FindFirstChild('Arms'):FindFirstChild('CSSArms')) and (Camera ~= nil) then 

                if (IsEnabled('CustomView')) and (Camera:FindFirstChild('Arms')) and (Camera:FindFirstChild('Arms'):FindFirstChild('Offset')) then 
                    Camera:FindFirstChild('Arms'):FindFirstChild('Offset').Value = Vector3.new(GetProperty('ViewmodelX'), GetProperty('ViewmodelY'), GetProperty('ViewmodelZ'));
                end;

                if (IsEnabled('CustomArms')) and (Camera:FindFirstChild('Arms')) and (Camera:FindFirstChild('Arms'):FindFirstChild('CSSArms')) then 
                    for Index, Value in next, Camera:FindFirstChild('Arms'):FindFirstChild('CSSArms'):GetChildren() do 
                        if (Value:IsA('Part')) then 
                            Value.Color = GetProperty('ArmColor');
                            Value.Material = GetProperty('ArmMaterial');
                            Value.Transparency = GetProperty('ArmTrans');

                            for _, __ in next, Value:GetChildren() do 
                                if (string.find(__.Name:lower(), 'sleeve')) then 
                                    __:Destroy();
                                end;
                            end;
                        end;
                    end;
                end;

                if (IsEnabled('CustomGun')) and (Camera:FindFirstChild('Arms')) then 
                    for Index, Value in next, Camera:FindFirstChild('Arms'):GetChildren() do 
                        if (Value:IsA('Part')) or (Value:IsA('MeshPart')) then 
                            Value.Color = GetProperty('GunColor');
                            Value.Material = GetProperty('GunMaterial');
                            Value.Transparency = GetProperty('GunTrans');
                        end;
                    end;
                end;
            end;

            if (Character ~= nil) and (Humanoid ~= nil) then 
                for Index, Value in next, Character:GetChildren() do 
                    if (IsEnabled('NoArms')) and (string.find(Value.Name:lower(), 'arm')) then 
                        Value:Destroy();
                    end;

                    if (IsEnabled('NoLegs')) and (string.find(Value.Name:lower(), 'leg')) then 
                        Value:Destroy();
                    end;

                    if (IsEnabled('NoHead')) and (Value.Name == 'FakeHead') then 
                        Value:Destroy();
                    end;
                end;

                if (IsEnabled('BHop')) then 
                    Humanoid.Jump = true;
                end;
            end;
      end);
        
    elseif (PlaceID == 2000064164) then -- // State of anarchy
        
        Create('State of Anarchy');
        LoadUniversal();

        local Connections = ReplicatedStorage:WaitForChild('Connections', 9e9);
        local Interactables = workspace:WaitForChild('Interactable', 9e9);

        local PickUps = Interactables.PickUps;
        local ContainersPath = Interactables.Containers;

        local SilentTab = TabB:AddTab('Silent Aim');
        local Containers = {};
        local PickUp = {};

        local GameFunctions = Misc:AddLeftGroupbox('Game Functions');

        local function GetEquippedGun(Inst)
            if (Inst ~= nil) then 
                for Index, Value in next, Inst:GetChildren() do 
                    if (Value:IsA('Model')) and (Value.Name ~= 'Clothing') then 
                        return Value.Name;
                    end;
                end;
            end;

            return nil;
        end;

        local SilentAimCircle = Drawing.new('Circle');
        SilentAimCircle.Radius = 100;
        SilentAimCircle.Color = Color3.fromRGB(255, 255, 255);
        SilentAimCircle.Visible = false;

        local function Hit(Plr)

            if (Plr == nil) or (GetCharacter(Plr) == nil) or (not GetCharacter(Plr):FindFirstChild('Head')) then print'Check Failed'; return end;

            -- // found DA KILL REMOTE EZAZZZZZ (:scream:) (:cream:

            local ohString1 = "Head"
            local ohVector32 = Vector3.new(-2627.53662109375, 199.0116424560547, 285.17047119140625)
            local ohVector33 = Vector3.new(-2625.343994140625, 198.93568420410156, 283.556396484375)
            local ohInstance4 = Plr
            local ohString5 = '.22 Long Rifle';
            local ohVector36 = Vector3.new(-2884.3603515625, 199.69235229492188, 395.09503173828125)
            local ohTable7 = {
                [1] =  -2884.88916015625, 200.12826538085938, 384.3685302734375,
                [2] = GetCharacter(Plr).Head,
                [3] =  -2885.21142578125, 200.39219665527344, 377.8313293457031,
                [4] =  -0.9473804831504822, 0.24329611659049988, 0.20803231000900269,
                [5] = 318,
                [6] = Plr
            }
            
            ReplicatedStorage.Connections.HitEvent:FireServer(ohString1, ohVector32, ohVector33, ohInstance4, ohString5, ohVector36, ohTable7)
        end;
        
        for Index, Value in next, ContainersPath:GetChildren() do 
            Containers[Value] = Value.Name; 
        end;

        for Index, Value in next, PickUps:GetChildren() do 
            PickUp[Value] = Value.Name;
        end;

        local Containerz = GameFunctions:AddDropdown('Container', {
            Text = 'Containers';
            Values = Containers;
            AllowNull = true;
        });

        local PickUpz = GameFunctions:AddDropdown('PickUp', {
            Text = 'Pick Ups';
            Values = PickUp;
            AllowNull = true;
        });

        local SilentAim = SilentTab:AddToggle('SilentAim', {
            Text = 'Toggle';
        });

        local VisualizeFOV = SilentTab:AddToggle('SilentVis', {
            Text = 'Visualize FOV';
        }):AddColorPicker('SilentColor', {
            Text = 'FOV Circle Color';
            Default = Color3.fromRGB(255, 255, 255);
        });

        local SilentFOV = SilentTab:AddSlider('SilentFOV', {
            Text = 'Field of View';
            Min = 0;
            Max = 350;
            Default = 150;
            Rounding = 3;
        });

        local Part = SilentTab:AddDropdown('SilentBody', {
            Text = 'Silent Body Part';
            Values = ListCharacterParts();
        });

        local GoToContainer = GameFunctions:AddButton('Teleport To Container', function()
            if (Character ~= nil) and (Character:FindFirstChild('Head')) and (GetProperty('Container') ~= nil) then 
                RootPart.CFrame = ContainerPath:FindFirstChild(GetProperty('Container')):FindFirstChildOfClass('MeshPart').CFrame;
            end;
        end);

        local GoToPickup = GameFunctions:AddButton('Teleport To Pick Up', function()
            if (Character ~= nil) and (Character:FindFirstChild('Head')) and (GetProperty('PickUp') ~= nil) then 
                RootPart.CFrame = PickUps:FindFirstChild(GetProperty('PickUp')):FindFirstChildOfClass('Part').CFrame;
            end;
        end);


        local KillPlayer = PlayerBox:AddButton('Kill Player', function()
            if (TargetPlayer ~= nil) and (GetCharacter(TargetPlayer) ~= nil) and (GetCharacter(TargetPlayer):FindFirstChild('Head')) and (GetEquippedGun(Character) ~= nil) then 
                Hit(TargetPlayer);
            end;
        end);

        local LoopKill = PlayerBox:AddToggle('LoopKill', {
            Text = 'Loop Kill';
        });

        local KillAll = GameFunctions:AddToggle('KillAll', {
            Text = 'Kill All';
        });

        local function GetSilentAimTarget()
            for Index, Value in next, Players:GetPlayers() do 

                if (Value ~= Player) and (GetCharacter(Value) ~= nil) and (GetCharacter(Value):FindFirstChildOfClass('Humanoid'))  and (GetCharacter(Value):FindFirstChild(GetProperty('SilentBody'))) then

                      local worldPoint = GetCharacter(TargetPlayer):FindFirstChild(GetProperty('SilentBody')).Position;
                      local vector, onScreen = Camera:WorldToScreenPoint(worldPoint);

                      if (not onScreen) then 
                          continue;
                      end;

                    

                      local magnitude = (Vector2.new(Mouse.X, Mouse.Y) - Vector2.new(vector.X, vector.Y)).magnitude;
    
                      if (magnitude <= GetProperty('SilentFOV')) and (GetCharacter(Value) ~= nil) and (onScreen) then 
                          return GetCharacter(Value)[GetProperty('SilentBody')];
                      end;
                end;
            end;
        end;

        OldNameCall = hookmetamethod(game, '__namecall', newcclosure(function(self, ...)
            
            local Args = { ... };
            local Method = getnamecallmethod();


            
            if (IsEnabled('SilentAim')) and (Method:lower() == 'fireserver') and (tostring(self) == 'HitEvent') and (GetSilentAimTarget() ~= nil) then 
                local Closest = GetSilentAimTarget();

                Args[1] = GetProperty('SilentBody');
                Args[4] = Players:FindFirstChild(GetSilentAimTarget().Parent.Name);
                if (Args[7] ~= nil) and (type(Args[7] == 'table')) and (Args[7][2] ~= nil) and (Args[7][6] ~= nil) then 
                    Args[7][2] = GetSilentAimTarget();
                    Args[7][6] = Players:FindFirstChild(GetSilentAimTarget().Parent.Name);
                end;

                return OldNameCall(self, unpack(Args));
            end;

            return OldNameCall(self, ...);
        end))

        shared.__XennyWare.Connections['SOALoop'] = RunService.RenderStepped:Connect(function()

            SilentAimCircle.Visible = IsEnabled('SilentVis');
            SilentAimCircle.Radius = GetProperty('SilentFOV');
            SilentAimCircle.Color = GetProperty('SilentColor');
            SilentAimCircle.Position = WTS(Mouse.hit.p);
            SilentAimCircle.Thickness = 1;

            if (IsEnabled('LoopKill')) and (TargetPlayer ~= nil) and (GetCharacter(TargetPlayer) ~= nil) and (GetCharacter(TargetPlayer):FindFirstChild('Head')) then 
                Hit(TargetPlayer);
            end;
        end);
    elseif (game.PlaceId == 7113341058) then 
        Create('Rush Point');
        LoadUniversal();
        
        repeat task.wait() until ReplicatedStorage:FindFirstChild('BAC');

        local Characters;
        local Helpers = ReplicatedStorage.Modules.Client.Helpers
        local Skins = game:GetService("ReplicatedStorage"):WaitForChild('Modules'):WaitForChild('Shared'):WaitForChild('SkinData');
        local SkinData = {};
        local Weapons = {};
        local SkinsNames = {};
        
        for Index, Value in next, Skins:GetChildren() do 
            if (not Value:IsA('ModuleScript')) then continue end;
            Weapons[Value.Name] = Value.Name;
            SkinData[Value.Name] = {['Skins'] = require(Value); ['Current'] = ''; ['Name'] = Value.Name};
            SkinsNames[Value.Name] = {};

            for _, __ in next, require(Value) do 
                table.insert(SkinsNames[Value.Name], _);
            end;
        end;

        for Index, Value in next, getgc(true) do
            if (type(Value) == 'function') and (islclosure(Value)) and (debug.getinfo(Value).name == 'NewChar') then
                Characters = getupvalue(Value, 1); --> [1] = table [2] (real-chars) = table (in-game chars)
            end;
         end;

        --local ResetRecoil = require(Helpers.RecoilHandler).ResetRecoil;

        
        function ESPLib.GetTeam(Player)
            return Player:FindFirstChild('SelectedTeam').Value;
        end;

        function ESPLib.GetCharacter(Player)
            if (Characters[Player] == nil) or (not Characters[Player]:FindFirstChild('HumanoidRootPart')) then return nil, nil end;
            return Characters[Player], Characters[Player]:FindFirstChild('HumanoidRootPart');
        end;
        
        local SilentAimCircle = Drawing.new('Circle');
        SilentAimCircle.Radius = 150;
        SilentAimCircle.Visible = false;
        SilentAimCircle.Thickness = 3;
        SilentAimCircle.Color = Color3.fromRGB(255, 255, 255);

        local SilentAim = TabB:AddTab('Silent Aim');
        local GunMods = TabH:AddTab('Gun Mods');
        local Viewmodel = Visuals:AddRightGroupbox('Viewmodel');
        local SkinMods = Misc:AddLeftGroupbox('Skins');
        local GameFuncs = Misc:AddRightGroupbox('Game Funcs');

        SilentAim:AddToggle('SilentAim', {
            Text = 'Enable';
        }):AddColorPicker('SilentColor', {
            Text = 'FOV Color';
            Default = Color3.fromRGB(255, 255, 255);
        });

        SilentAim:AddDropdown('Silent_Body', {
            Text = 'Body Part';
            Default = 1;
            AllowNull = true;
            Multi = false;
            Values = {'Head'; 'UpperTorso'; 'HumanoidRootPart'};
            Default = 1;
        });

        SilentAim:AddSlider('SilentFOV', {
            Text = 'FOV';
            Default = 150;
            Min = 1;
            Max = 400;
            Rounding = 0.2;
        });

        SilentAim:AddSlider('SilentMaxDistance', {
            Text = 'Max Distance';
            Default = 1500;
            Min = 1;
            Max = 5000;
            Rounding = 0.2
        });

        SilentAim:AddSlider('SilentHitChance', {
            Text = 'Hit Chance';
            Default = 100;
            Min = 1;
            Max = 100;
            Rounding = 0.2
        });

        GunMods:AddToggle('NoRecoil', {
            Text = 'No Recoil';
        });

        GunMods:AddToggle('NoSpread', {
            Text = 'No Spread';
        });

        GunMods:AddToggle('NoCamShake', {
            Text = 'No Cam Shake';
        });

        GunMods:AddToggle('FastFire', {
            Text = 'Fast Fire Rate';
        });

        GunMods:AddToggle('AlwaysAuto', {
            Text = 'Always Auto';
        });

        Viewmodel:AddToggle('CustomArms', {
            Text = 'Custom Arms';
        }):AddColorPicker('ArmColor', {
            Text = 'Arm Color';
            Default = Color3.fromRGB(255, 255, 255);
        });

        Viewmodel:AddDropdown('ArmMaterial', {
            Text = 'Arm Material';
            Values = {'ForceField'; 'SmoothPlastic'; 'Neon'};
            Default = 1;
        });

        Viewmodel:AddSlider('ArmTrans', {
            Text = 'Arm Transparency';
            Min = 0;
            Max = 1;
            Rounding = 2;
            Default = 0;
        });

        Viewmodel:AddToggle('CustomGun', {
            Text = 'Custom Gun';
        }):AddColorPicker('GunColor', {
            Text = 'Arm Color';
            Default = Color3.fromRGB(255, 255, 255);
        });

        Viewmodel:AddDropdown('GunMaterial', {
            Text = 'Gun Material';
            Values = {'ForceField'; 'SmoothPlastic'; 'Neon'};
            Default = 1;
        });

        Viewmodel:AddSlider('GunTrans', {
            Text = 'Gun Transparency';
            Min = 0;
            Max = 1;
            Rounding = 2;
            Default = 0;
        });

        Viewmodel:AddToggle('CustomOffset', {
            Text = 'Offset';
        });

        Viewmodel:AddSlider('OffsetX', {
            Text = 'X';
            Min = -50;
            Max = 50;
            Default = 1;
            Rounding = 0.2;
        });

        Viewmodel:AddSlider('OffsetY', {
            Text = 'Y';
            Min = -50;
            Max = 50;
            Default = 1;
            Rounding = 0.2;
        });

        Viewmodel:AddSlider('OffsetZ', {
            Text = 'Z';
            Min = -50;
            Max = 50;
            Default = 1;
            Rounding = 0.2;
        });

        GameFuncs:AddToggle('AntiSpectate', {
            Text = 'AntiSpectate';
        });

        SkinMods:AddToggle('SkinChanger', {
            Text = 'Skin Changer';
        });


        SkinMods:AddDropdown('Skin', {
            Text = 'Skin';
            Values = {};
            AllowNull = true;
        }):OnChanged(function()
            if (GetProperty('SkinWeapon') == nil) then return end;
            SkinData[GetProperty('SkinWeapon')].Current = GetProperty('Skin');
        end);

        SkinMods:AddDropdown('SkinWeapon', {
            Text = 'Weapon';
            Values = Weapons;
        }):OnChanged(function()
            if (GetProperty('SkinWeapon') == nil) then return end;
            Options['Skin'].Values = SkinsNames[GetProperty('SkinWeapon')];
            Options['Skin']:SetValues();
            Options['Skin']:SetValue(nil);
        end);

        GetCharacter = function(Player)
            return Characters[Player];
        end;

        Functions.GetTeam = function(Player)

            local TeamColor;

            if (Player.SelectedTeam.Value == 'Attackers') then 
                TeamColor = Color3.fromRGB(255, 0, 0);
            else
                TeamColor = Color3.fromRGB(0,0 ,255);
            end;

            return Player.SelectedTeam.Value, TeamColor;
        end;

        ModuleLoader = require(game:GetService("ReplicatedStorage").Modules.Shared.ModuleLoader);
        LoadedModules = ModuleLoader.LoadedModules;
        local WeaponInfo = LoadedModules.WeaponInfo;
        local Memory = LoadedModules.SharedMemory;
        Network = LoadedModules.Network;
        local Old = Network.FireServer;
        local OldIndex;

        local OldGet = LoadedModules.AttributesHandler.GetWeapon;
        hookfunction(LoadedModules.AttributesHandler.GetWeapon, function(p7, p8, p9)

            if (IsEnabled('SkinChanger')) and (GetProperty('Skin') ~= nil) then     
                local SkinName = SkinData[p8].Current;

                if (SkinName == nil) or (SkinName == '') then print'skin is nil'; return ReplicatedStorage.Assets.Weapons[p8].Default end;

                ReplicatedStorage.Assets.Weapons[p8][SkinName];
            else
                return ReplicatedStorage.Assets.Weapons[p8].Default;
            end;
        end);

        --print(Old, Network.FireSever);
        
        --table.foreach(LoadedModules, print);
        
        
        local function GetNearest()
        
           Targets = {};
        
           for Index, Value in next, Players:GetPlayers() do
                   if (Value ~= Player) and (Value.SelectedTeam.Value ~= Player.SelectedTeam.Value) then
                   if (not Characters[Value]) then continue end;
                   local Char = Characters[Value];
                   if (not Char:FindFirstChild(GetProperty('Silent_Body'))) then continue end;
                   if (Char:FindFirstChild('Humanoid').Health <= 0) or (Char:FindFirstChild('Humanoid'):GetState() == Enum.HumanoidStateType.Dead) then continue end;

                   Distance = (Char.HumanoidRootPart.CFrame.p - Camera.CFrame.p).Magnitude;
                   worldPoint = Char.Head.Position;
                   vector, onScreen = Camera:WorldToScreenPoint(worldPoint);
                   magnitude = (Vector2.new(Mouse.X, Mouse.Y) - Vector2.new(vector.X, vector.Y)).Magnitude;
           
                   if (magnitude > GetProperty('SilentFOV')) then continue end;
        
                   table.insert(Targets, {Value, Distance, Char:FindFirstChild(GetProperty('Silent_Body'))});
               end;
           end;
        
           if (#Targets > 1) then
            table.sort(Targets, function(a, b)
                return a[2] < b[2];
               end);
           end;
        
           if (#Targets == 0) then
               return nil;
           end;
        
           return Targets[1][3];
        end;
        
        local function ResolveRotation(Target)
          return CFrame.new(Camera.CFrame['p'], Target.CFrame['p']);
        end;
        
       


        Network.FireServer = function(...)
           local Args = {...};
            
            if (Args[2] == 'UpdateCamera') and (IsEnabled('AntiSpectate')) then 
                return 
            end;

            if IsEnabled('SilentAim') and (Args[2] == 'FireBullet') then
        
               local Nearest = GetNearest()
        
               if (not Nearest) then
                   return Old(...);
               end;
        
               if (math.random(1, 100) > GetProperty('SilentHitChance')) then
                    return Old(...);
               end;

               ResolvedRotation = ResolveRotation(Nearest);
               Args[3][1].OriginCFrame = ResolvedRotation;
               Args[3][1].RotationMatrix = ResolvedRotation - ResolvedRotation['p'];
        
               Old(unpack(Args));
           end;
        
           return Old(...);
        end;
        
      --  local Old = require(Helpers.RecoilHandler).AddRecoil

        
        RunService.RenderStepped:Connect(function()

            -- // suck my nuts
            
            SilentAimCircle.Visible = IsEnabled('SilentAim');
            SilentAimCircle.Color = GetProperty('SilentColor');
            SilentAimCircle.Position = WTS(Mouse.hit.p);

            for Index, Value in next, WeaponInfo do task.wait()
                if (type(Value) == 'table') then 

                    if (IsEnabled('NoSpread')) then 
                        Value['Spread'] = 0;
                        Value['MovementSpreadTime'] = 0;
                        Value['MovementSpreadPenalty'] = 0;
                        Value['FirstShotSpread'] = 0;
                        Value['ScopeSpread'] = 0;
                    end;

                    if (IsEnabled('NoRecoil')) and (rawget(Value, 'Recoil')) and (Value.Recoil[1] ~= nil) then 
                        Value.RecoilResetTime = 0;
                         for _, __ in next, Value.Recoil do 
                             __.X = 0;
                             __.Y = 0;
                         end;
                    end;

                    if (IsEnabled('FastFire')) then 
                        Value.FireRate = 0;
                    end;

                    if (IsEnabled('AlwaysAuto')) then 
                        Value.FireType = 'Automatic';
                    end;
                end;
            end;

            if (IsEnabled('CustomOffset')) and (Camera:FindFirstChild('Weapon')) and (Camera:FindFirstChild('Weapon'):FindFirstChild('Offset')) then 
                Camera:FindFirstChild('Weapon'):FindFirstChild('Offset').Value = Vector3.new(GetProperty('OffsetX'), GetProperty('OffsetY'), GetProperty('OffsetZ'))
            end;

            if (IsEnabled('CustomArms')) or (IsEnabled('CustomGun')) then 
                if (not Camera:FindFirstChild('Weapon')) then return end;

                    local WeaponObject = Camera:FindFirstChild('Weapon'):FindFirstChild('Object');
                    local OtherWeapon = Camera:FindFirstChild('Weapon'):FindFirstChild('MainGunParts');
                    local Arms = Camera:FindFirstChild('Weapon'):FindFirstChild('Arms');

                    if (not WeaponObject) or (not OtherWeapon) or (not Arms) then return end;

                    if (IsEnabled('CustomArms')) then 
                        for _, __ in next, Arms:GetDescendants() do 
                            if (__:IsA('SurfaceAppearance')) then __:Destroy() end;
                            if (__:IsA('MeshPart'))  then 

                                if (__:IsA('MeshPart')) then __.TextureID = '0' end;

                                __.Color = GetProperty('ArmColor');
                                __.Material = GetProperty('ArmMaterial');
                                __.Transparency = GetProperty('ArmTrans');
                            end;
                        end;
                    end;

                    if (IsEnabled('CustomGun')) then 
                        for _, __ in next,  WeaponObject:GetDescendants() do 

                                if (__:IsA('SurfaceAppearance')) then __:Destroy() end;
                                
                            if (__:IsA('MeshPart')) then
                                if (__:IsA('MeshPart')) then __.TextureID = '0' end;
                                
                                __.Color = GetProperty('GunColor');
                                __.Material = GetProperty('GunMaterial');
                                __.Transparency = GetProperty('GunTrans');
                            end;
                        end;
                    end;
            end;
        end)
        
        OldIndex = hookmetamethod(game, '__index', newcclosure(function(self, Index, Value)
            
            if (Index == 'CameraShakeMultiplier') and (IsEnabled('NoCamShake')) then 
                return OldIndex(self, Index, 0);
            end;

            return OldIndex(self, Index, Value);
        end));

    elseif (game.PlaceId == 2474168535) then 
        Create('Westbound');
        LoadUniversal();
        
else -- // Universal

    Create('Universal');
    LoadUniversal();
end;

Library:Notify('Xenny-Ware | Created by xenny#0001 (642209011994722304) | https://youtube.com/c/xenny | enjoy!');
Library:Notify('Successfully Loaded in: ' .. os.time() - Start .. 'seconds(s).');

Start = nil -- // :3
Library:SetWatermarkVisibility(true);