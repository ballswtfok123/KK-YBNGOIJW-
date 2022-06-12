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
        xenny#0001 (everything else)

        if you find anything that you made that you want credit for that i mightve used without crediting you, just dm me on discord (sometimes i forget or dont know the original creator sorry)
]]

local Start = os.time();

-- // Wait Until The Game Is Loaded

repeat task.wait() until (game ~= nil) and (game:IsLoaded()) and (game.Players ~= nil) and (game.Players.LocalPlayer ~= nil)

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
    ['Xenny-Ware/Required'] = 'folder'
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
    writefile('Xenny-Ware/Required/Library.lua', game:HttpGet('https://raw.githubusercontent.com/xennyy/Scripts/main/Library.lua'));
end;

if (not isfile('Xenny-Ware/Required/SaveManager.lua')) then 
    writefile('Xenny-Ware/Required/SaveManager.lua', game:HttpGet('https://raw.githubusercontent.com/xennyy/Scripts/main/ModifiedSaveManager.lua'));
end;

if (not isfile('Xenny-Ware/Required/Maid.lua')) then
    writefile('Xenny-Ware/Required/Maid.lua', game:HttpGet('https://raw.githubusercontent.com/xennyy/Scripts/main/Maid.lua'));
end;

if (not isfile('Xenny-Ware/Required/ESP.lua')) then 
    writefile('Xenny-Ware/Required/ESP.lua', game:HttpGet('https://raw.githubusercontent.com/xennyy/Scripts/main/ESP.lua'));
end;

if (not isfile('Xenny-Ware/Required/ThemeManager.lua')) then 
    writefile('Xenny-Ware/Required/ThemeManager.lua', game:HttpGet('https://raw.githubusercontent.com/xennyy/Scripts/main/theme_manager.lua'));
end;


-- // Declare Library

local Library = loadfile('Xenny-Ware/Required/Library.lua')(); -- // Credits to inori
local SaveManager = loadfile('Xenny-Ware/Required/SaveManager.lua')(); -- // Credits to wally for this
local ThemeManager = loadfile('Xenny-Ware/Required/ThemeManager.lua')() -- // Credits to wally for this
local Maid = loadfile('Xenny-Ware/Required/Maid.lua')(); -- // Credit to quenty
local ESPLib = loadfile('Xenny-Ware/Required/ESP.lua')(); -- // Credit to kiriot22

SaveManager:SetLibrary(Library)
SaveManager:SetFolder('Xenny-Ware');

ThemeManager:SetFolder('Xenny-Ware');
ThemeManager:SetLibrary(Library);

-- // Declare Services

local Players = Service('Players');
local ReplicatedStorage = Service('ReplicatedStorage');
local Lighting = Service('Lighting');
local Chat = Service('Chat');
local TweenService = Service('TweenService');
local Input = Service('UserInputService');
local RunService = Service('RunService');
local TeleportService = Service('TeleportService');

local CoreGui = game.CoreGui;
local Camera = workspace.CurrentCamera;

-- // Declare Player and mouse

local Player = Players.LocalPlayer;
local Mouse = Player:GetMouse();

-- // Misc declrations

local PlaceId = game.PlaceId;
local JobId = game.JobId;


-- // Declare Character & Character Parts

local Character = Player.Character or Player.CharacterAdded:Wait();
local Humanoid = Character:WaitForChild('Humanoid', 9e9);
local RootPart = Character:WaitForChild('HumanoidRootPart', 9e9);


-- // Check if UI is already loaded



if (CoreGui:FindFirstChild('ScreenGui')) and (shared.__XennyWare ~= nil) then 
    CoreGui:FindFirstChild('ScreenGui'):Destroy();
end;

-- // Declare used variables

local Window, Main, Settings, AimbotBox, LocalBox, Visuals, Misc, Debug, OldNmaeCall, PlayerInfo, Luas, TabH, TabB, Rage, OldNameCall, Themes


-- // Template function for ease of use

local function Create(Name, LoadRage)


    Window = Library:CreateWindow('Xenny-Ware | ' .. Name);
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

-- // Function for checking if certain ui features are enabled (QOL)

local function IsEnabled(Index)
    return Toggles[Index].Value;
end;

-- // Returns property of index from options table (QOL)

local function GetProperty(Index)
    return Options[Index].Value;
end;

-- // Check if a key is being held via the library toggled property (QOL)

local function IsKeyDown(Index)
    return Options[Index].Toggled;
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


-- // Load universal features

local function LoadUniversal()

    -- // Declare groupboxes

    TabB = Main:AddLeftTabbox();
    AimbotBox = TabB:AddTab('Aimbot');
    TabH = Main:AddRightTabbox('');
    LocalBox = TabH:AddTab('Local');

    local CircleSettings = Main:AddLeftGroupbox('Circle Settings');
    local HitboxExpander = Main:AddRightGroupbox('Hitbox Expander');
    TabHolder = Visuals:AddLeftTabbox('ESP');
    local ESP = TabHolder:AddTab('ESP');
    local Chams = TabHolder:AddTab('Chams');

    local World = Visuals:AddRightGroupbox('World');
    local TabHolder = Visuals:AddLeftTabbox();

    local Self = TabHolder:AddTab('Self');
    local Render  = TabHolder:AddTab('Render');

    local PlayerBox = Misc:AddRightGroupbox('Players Info');
    local Server = Misc:AddLeftGroupbox('Server');

    Luas = Settings:AddLeftGroupbox('Luas');

    -- // Define targets and other tables

    Targets = {};   
    local Original = {};
    local WhitelistedClasses = {'Part'; 'MeshPart';};
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
    });

    local CustomJumpPower = LocalBox:AddToggle('CustomJumpPower', {
        Text = 'Custom JumpPower';
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
        if (not IsEnabled('Fly')) or (not IsKeyDown('BindFly')) and (Character ~= nil) and (RootPart ~= nil) then 
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
        Max = 450;
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
        Text = 'Ambient Color';
        Default = Lighting.OutdoorAmbient;
    });

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
        if (not IsEnabled('SelfChams')) then 
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
        Text = 'Chams Mataerial';
        Multi = false;
        Default = 1;
        Values = {'ForceField'; 'Foil'; 'Concrete'; 'SmoothPlastic'; 'Plastic'; 'Wood'; 'Neon'};
    });

    local SelfChamsTransparency = Self:AddSlider('SelfChamsTransparency', {
        Text = 'Chams Transparency';
        Min = 0;
        Max = 1;
        Default = 0.3;
        Rounding = 0.3;
    });

    local SelfChamsBrightness = Self:AddSlider('SelfChamsBrightness', {
        Text = 'Chams Brightness';
        Min = 0;
        Max = 650;
        Default = RootPart.Reflectance;
        Rounding = 0.3;
    });


    local CamFOV = Render:AddSlider('CamFOV', {
        Text = 'Field of View';
        Min = 0;
        Max = 140;
        Default = Camera.FieldOfView;
        Rounding = 3;
    });

    local ThirdPerson = Render:AddToggle('ThirdPerson', {
        Text = 'Third Person'
    });

    local ThirdPersonDistance = Render:AddSlider('ThirdPersonDistance', {
        Text = 'Third Person Distance';
        Min = 0;
        Max = 200;
        Default = 200;
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
        ESPLib.Enabled = IsEnabled('EnableESP');
    end);

    local Boxes = ESP:AddToggle('Boxes', {
        Text = 'Boxes';
    }):OnChanged(function()
        ESPLib.Boxes = IsEnabled('Boxes');
    end);

    local Tracers = ESP:AddToggle('Tracers', {
        Text = 'Tracers';
    }):OnChanged(function()
        ESPLib.Tracers = IsEnabled('Tracers');
    end);

    ESP:AddToggle("FaceCamera", {
        Text = 'Face Camera'
    }):OnChanged(function()
        ESPLib.FaceCamera = IsEnabled('FaceCamera');
    end);
    ESP:AddToggle("Names", {
        Text = 'Names'
    }):OnChanged(function()
        ESPLib.Names = IsEnabled('Names');
    end);
    ESP:AddToggle("TeamColor", {
        Text = 'Team Color'
    }):OnChanged(function()
        ESPLib.TeamColor = IsEnabled('TeamColor');
    end);
    ESP:AddToggle("DontShow", {
        Text = 'Dont Show Team'
    }):OnChanged(function()
        ESPLib.TeamMates = not IsEnabled('DontShow');
    end);
    ESP:AddSlider('ESPThick', {
        Text = 'ESP Thickness',
        Default = 2,
        Min = 0,
        Max = 10,
        Rounding = 2
    }):OnChanged(function()
        ESPLib.Thickness = GetProperty('ESPThick');
    end);

    local ChamsEnable = Chams:AddToggle('ChamsEnable', {
        Text = 'Toggle';
    }):AddColorPicker('ChamsColor', {
        Text = 'Chams Color';
        Default = Color3.fromRGB(255, 255, 255);
    }):OnChanged(function()
        if (not IsEnabled('ChamsEnable')) then 
            for Index, Value in next, Players:GetPlayers() do
                if (Value.Character ~= nil) and (Value.Character:FindFirstChild('HumanoidRootPart')) then 
                    for _, __ in next, Value.Character:GetChildren() do 
                        if (table.find(ValidParts, __.Name)) then 
                            if (__:FindFirstChildOfClass('BoxHandleAdornment')) then 
                                __:FindFirstChildOfClass('BoxHandleAdornment'):Destroy();
                            end;
                        end;
                    end;
                end;
            end;
        end;
    end);


    local ChamsTeam = Chams:AddToggle('ChamsTeam', {
        Text = 'Team Check';
    });

    local ChamsTeamColor = Chams:AddToggle('ChamsTeamColor', {
        Text = 'Chams Team Color';
    });

    local ChamsTransparency = Chams:AddSlider('ChamsTransparency', {
        Text = 'Chams Transparency';
        Min = 0;
        Max = 1;
        Default = 0;
        Rounding = 3;
    });

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
        if (IsEnabled('Spectate')) and (Character ~= nil) and (Humanoid ~= nil) and (GetProperty('PlrTarget') ~= nil) and (Players:FindFirstChild(GetProperty('PlrTarget'))) and (Players:FindFirstChild(GetProperty('PlrTarget')) ~= nil) and (Players:FindFirstChild(GetProperty('PlrTarget')).Character:FindFirstChildOfClass('Humanoid')) then 
            Camera.CameraSubject = Players:FindFirstChild(GetProperty('PlrTarget')).Character:FindFirstChildOfClass('Humanoid');
        end;

        if (not IsEnabled('Spectate')) and (Humanoid ~= nil) and (Character ~= nil) then 
            Camera.CameraSubject = Humanoid;
        end;
    end);

    PlayerInfo = PlayerBox:AddDropdown('PlrTarget', {
        Text = 'Players';
        Multi = false;
        Values = FetchPlayers();
    }):OnChanged(function() 

        if (GetProperty('PlrTarget') == false) then 
            return;
        end;

        local TargetPlayer = Players:FindFirstChild(GetProperty('PlrTarget')) or 'nil';
        local TargetTeam = TargetPlayer.Team ~= nil and TargetPlayer.Team ~= '' and TargetPlayer.Team or 'Not Found';
        local StudsAway = TargetPlayer.Character ~= nil and TargetPlayer.Character:FindFirstChild('HumanoidRootPart') ~= nil and Player:DistanceFromCharacter(TargetPlayer.Character:FindFirstChild('HumanoidRootPart').Position) or 'Not Found';
        local CurrentHealth = TargetPlayer ~= nil and TargetPlayer.Character:FindFirstChildOfClass('Humanoid') and TargetPlayer.Character:FindFirstChildOfClass('Humanoid').Health or 0;
        local CurrentTool = TargetPlayer.Character ~= nil and TargetPlayer.Character:FindFirstChildOfClass('Tool') and TargetPlayer.Character:FindFirstChildOfClass('Tool').Name or 'None';

        DisplayName:SetText('Display Name: ' .. TargetPlayer.DisplayName);
        UserId:SetText('User ID: ' .. TargetPlayer.UserId);
        AccountAge:SetText('Account Age: ' .. TargetPlayer.AccountAge);
        PlrTeam:SetText('Team: ' .. TargetTeam);
        Studs:SetText('Studs Away: ' .. StudsAway);
        TargetHealth:SetText('Health: ' .. CurrentHealth);
        HeldTool:SetText('Held Tool: ' .. CurrentTool);
    end);

    local TeleportTarget = PlayerBox:AddButton('Teleport', function()
        if (Character ~= nil) and (RootPart ~= nil) and (GetProperty('PlrTarget') ~= false) and (Players:FindFirstChild(GetProperty('PlrTarget'))) and (Players:FindFirstChild(GetProperty('PlrTarget')).Character ~= nil) and (Players:FindFirstChild(GetProperty('PlrTarget')).Character:FindFirstChild('HumanoidRootPart')) then 
            RootPart.CFrame = Players:FindFirstChild(GetProperty('PlrTarget')).Character:FindFirstChild('HumanoidRootPart').CFrame;
        end;
    end);

    local CopyProfile = PlayerBox:AddButton('Copy Profile Link', function()
        if (GetProperty('PlrTarget') ~= false) and (Players:FindFirstChild(GetProperty('PlrTarget'))) then 
            setclipboard(string.format('https://www.roblox.com/users/%s/profile', Players:FindFirstChild(GetProperty('PlrTarget')).UserId));
        end;
    end);

    local CopyUserId = PlayerBox:AddButton('Copy User Id', function()
        if (GetProperty('PlrTarget') ~= false) and (Players:FindFirstChild(GetProperty('PlrTarget'))) then 
            setclipboard(Players:FindFirstChild(GetProperty('PlrTarget')).UserId);
        end;
    end);

    -- // Grab the aimbot target via a function

    local function GetAimbotTarget()

        Targets = {};

        for Index, Value in next, Players:GetPlayers() do 
            if (Value ~= Player) and (Value.Character ~= nil) and (Value.Character:FindFirstChildOfClass('Humanoid')) and (Value.Character:FindFirstChild('HumanoidRootPart')) then 

                -- // Distance check

                if ((Player:DistanceFromCharacter(Value.Character['HumanoidRootPart'].Position)) > GetProperty('AimbotDistance')) then 
                    continue;
                end;

                -- // Aimbot whitelist check

                if (AimbotWhitelist[Player.Name] ~= nil) then 
                    continue;
                end;

                -- // Check if teamcheck is enabled

                if (Checks.Value['Team'] ~= nil) and (Player.Team == Value.Team) then
                    continue;
                end;

                -- // Check for forcefield

                if (Checks.Value['ForceField'] ~= nil) and (Value.Character:FindFirstChildOfClass('ForceField')) then 
                    continue;
                end;

                -- // Check if the player is dead

                if (Checks.Value['Dead'] ~= nil) and (Value.Character:FindFirstChildOfClass('Humanoid'):GetState() == Enum.HumanoidStateType.Dead) then 
                    continue;
                end;

                -- // Check if the player is sitting

                if (Checks.Value['Sitting'] ~= nil) and (Value.Character:FindFirstChildOfClass('Humanoid'):GetState() == Enum.HumanoidStateType.Seated) then 
                    continue;
                end;

                -- // Jump check

                if (Checks.Value['Jumping'] ~= nil) and (Value.Character:FindFirstChildOfClass('Humanoid'):GetState() == Enum.HumanoidStateType.Jumping) then 
                    continue;
                end;

                -- // Friend check

                if (Checks.Value['Friend'] ~= nil) and (Player:IsFriendsWith(Value.UserId)) then 
                    continue;
                end;

                -- // Stole this from old source (too lazy to make a new one)

                if (not Value.Character:FindFirstChild(BodyPart.Value)) then 
                    continue;
                end;

                if (PlaceId == 142823291) then 
                    if (IsEnabled('IgnoreInnocents')) and (ReplicatedStorage.GetPlayerData:InvokeServer()[Value.Name] ~= nil) and (ReplicatedStorage.GetPlayerData:InvokeServer()[Value.Name].Role ~= nil) and (ReplicatedStorage.GetPlayerData:InvokeServer()[Value.Name].Role == 'Innocent') then 
                        continue;
                    end;
                end;

                local worldPoint = Value.Character:WaitForChild(BodyPart.Value).Position;
                local vector, onScreen = Camera:WorldToScreenPoint(worldPoint);
                local magnitude = (Vector2.new(Mouse.X, Mouse.Y) - Vector2.new(vector.X, vector.Y)).magnitude;

                if (onScreen and magnitude <= GetProperty('AimbotFOV') and Value.Character) then
                    table.insert(Targets, {
                        Value;
                        Value.Character;
                        Value.Character.Humanoid.Health;
                        Player:DistanceFromCharacter(Value.Character[BodyPart.Value].Position);
                    });
                end;

            end;
        end;
    end;

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

    Input.JumpRequest:Connect(function()
        if (IsEnabled('InfiniteJump')) then 
            Humanoid:ChangeState('Jumping');
        end;
    end);

    Input.InputBegan:Connect(function(Key)
        if (Key.KeyCode == Enum.KeyCode.LeftAlt) and (IsEnabled('ClickTeleport') and (Character ~= nil) and (RootPart ~= nil) and (Humanoid ~= nil)) then 
            local EndPos = Mouse.Hit
            RootPart.CFrame = EndPos + Vector3.new(0, 3, 0)
        end;
    end);

   workspace.DescendantAdded:Connect(function(Value)
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

    Players.PlayerAdded:Connect(function()
        Options.PlrTarget:SetValues(FetchPlayers());    
    end);

    -- // Index hook

    local mt = getrawmetatable(game);
    local oldNewIndex  = mt.__newindex;
    setreadonly(mt, false);
    mt.__newindex = newcclosure(function(t, idx, val)
        if idx == "WalkSpeed" and not checkcaller() and (IsEnabled('CustomWalkSpeed')) then
            return oldNewIndex(t, idx, GetProperty('WalkSpeedAmount'));
        end;
        if idx == "JumpPower" and not checkcaller() and IsEnabled('CustomJumpPower') then
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

        --[[
        if (Method:lower() == 'kick') then 
            return false;
        end;
        ]]
        return OldNmaeCall(self, ...);
    end));

    --[[
    for _, __ in next, getconnections(Player.Idled) do 
        __:Disable();
    end;
]]

   RunService.RenderStepped:Connect(function()
         
        -- // Call Main Functions

        if (IsEnabled('AimbotEnabled')) and (Character ~= nil) then  -- // Only check for performance reasons
            GetAimbotTarget();
        end;

        -- // Handle FOV Circles

        AimbotFOVCircle.Visible = IsEnabled('ShowFOV');
        AimbotFOVCircle.Color = GetProperty('AimbotFOVColor');
        AimbotFOVCircle.Radius = GetProperty('AimbotFOV');
        AimbotFOVCircle.Position = WTS(Mouse.hit.p);
        AimbotFOVCircle.NumSides = GetProperty('AimbotSides');
        AimbotFOVCircle.Thickness = GetProperty('AimbotThickness');

        -- // Aimbot handler

        if (IsEnabled('AimbotEnabled')) and (Character ~= nil) and (Input:IsMouseButtonPressed(1)) and (#Targets > 0) and (Targets[1][1] ~= nil) and (Targets[1][1].Character ~= nil) then 


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

            if (Targets[1][1] ~= nil) and (Targets[1][1].Character ~= nil) then 
                -- // Get position of the part

                local worldPoint = Targets[1][1].Character[BodyPart.Value].Position;
                local vector, onScreen = Camera:WorldToScreenPoint(worldPoint);
                local magnitude = (Vector2.new(Mouse.X, Mouse.Y) - Vector2.new(vector.X, vector.Y)).magnitude;
                local dist = (Vector2.new(vector.X, vector.Y) - Vector2.new(Mouse.X, Mouse.Y)).Magnitude;
                local magnitudeX = Mouse.X - vector.X;
                local magnitudeY = Mouse.Y - vector.Y;
                local xsmooth = magnitudeX / GetProperty('AimbotSmoothness');
                local ysmooth = magnitudeY / GetProperty('AimbotSmoothness');

                -- // Check for prediction

                if (IsEnabled('AimbotPrediction')) then
                    worldPoint = Targets[1][1].Character[BodyPart.Value].Position + (Targets[1][1].Character[BodyPart.Value].Velocity * GetProperty('AimbotPredictionAmount'))
                end;

                -- // Lock on the the part if the character isnt nil

                if (Targets[1][1].Character ~= nil) then 
                    mousemoverel(-xsmooth, -ysmooth);
                end;

            end;
        end;

        if (IsEnabled('ChamsEnable')) then 
            for Index, Value in next, Players:GetPlayers() do 


                if (IsEnabled('ChamsTeam')) and (Value.Team == Player.Team) then 
                    continue;
                end;
                
                if (Value ~= Player) and (Value.Character ~= nil) and (Value.Character:FindFirstChild('HumanoidRootPart')) then 

                    for _, __ in next, Value.Character:GetChildren() do 

                        if (not table.find(ValidParts, __.Name)) then 
                            continue;
                        end;

                        if (__:FindFirstChildOfClass('BoxHandleAdornment')) then  

                            if (not IsEnabled('ChamsTeamColor')) then
                                __:FindFirstChildOfClass('BoxHandleAdornment').Color3 = GetProperty('ChamsColor');
                            elseif (Value.Team ~= nil) and (IsEnabled('ChamsTeamColor')) then 
                                __:FindFirstChildOfClass('BoxHandleAdornment').Color3 = Value.TeamColor.Color;
                            end;

                            __:FindFirstChildOfClass('BoxHandleAdornment').Transparency = GetProperty('ChamsTransparency');

                            if (IsEnabled('ChamsTeam')) and (Value.Team == Player.Team) and (Value.Team ~= nil) then 
                                __:Destroy();
                                continue;
                            end;
                        else
                            local Cham = Instance.new('BoxHandleAdornment', __);
                            Cham.Adornee = __;
                            Cham.Size = __.Size;
                            Cham.Transparency = GetProperty('ChamsTransparency');
                            Cham.Color3 = GetProperty('ChamsColor');
                            Cham.AlwaysOnTop = true;
                            Cham.ZIndex = 0;
                        end;
                    end;
                end;
            end;
        end;

        if (IsEnabled('ChatSpam')) then 
            ReplicatedStorage:WaitForChild('DefaultChatSystemChatEvents'):WaitForChild('SayMessageRequest'):FireServer(GetProperty('ChatMsg'), 'All');
            task.wait(GetProperty('ChatDelay'));
        end;

        -- // Walkspeed and jumppower handler

        if (Character ~= nil) then 
            
                        -- // Hitbox expander handler

                        if (IsEnabled('Hitbox')) then 
                            for Index, Value in next, Players:GetPlayers() do 
                                if (Value ~= Player) and (Value.Character ~= nil) and (Value.Character:FindFirstChild('HumanoidRootPart')) then 
            
                                    -- // Checks 
            
                                    table.foreach(HitboxChecks.Value, print);
            
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
                                        if (Value.Character:FindFirstChild(_)) then 
                                            
                                            local Part = Value.Character:FindFirstChild(_);
            
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

            if (IsEnabled('Fly')) or (IsKeyDown('BindFly')) and (GetProperty('FlyMethod') == 'CFrame') then 
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

            if (IsEnabled('SelfChams')) and (RootPart ~= nil) then 
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

Player.CharacterAdded:Connect(SetUpCharacter);

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

    RunService.RenderStepped:Connect(function()

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
            if (Value ~= Player) and (Value.Character ~= nil) then 
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
            if (Value ~= Player) and (Value.Character ~= nil) and (Value.Character:FindFirstChild('HumanoidRootPart')) and (Value.Character:FindFirstChildOfClass('Humanoid')) and (Player:DistanceFromCharacter(Value.Character:FindFirstChild('HumanoidRootPart').Position) <= 300) then
                  
                  if (IsEnabled('SilentFriends')) and (Player:IsFriendsWith(Value.UserId)) then 
                      continue;
                  end;

                  print(Value.Name);
                  
                  local worldPoint = Value.Character[GetProperty('SilentBodyPart')].Position;
                  local vector, onScreen = Camera:WorldToScreenPoint(worldPoint);
                  local magnitude = (Vector2.new(Mouse.X, Mouse.Y) - Vector2.new(vector.X, vector.Y)).magnitude;

                  if (magnitude <= GetProperty('SilentFOV')) and (Value.Character ~= nil) then 
                      return Value;
                  end;
            end;
        end;
    end;

      OldNameCall = hookmetamethod(game, '__namecall', newcclosure(function(self, ...)
           local Args = { ... };
           local Method = getnamecallmethod();

           if (Method == 'InvokeServer') and (tostring(self) == 'ShootGun') then
            if (IsEnabled('SilentAim'))  and (GetSilentAimTarget() ~= nil) and (GetSilentAimTarget().Character ~= nil) and (GetSilentAimTarget().Character:FindFirstChild(GetProperty('SilentBodyPart')))  then 


               local FinalPart = 'HumanoidRootPart';

               if (IsEnabled('AutoAdjust')) then 
                    if (GetSilentAimTarget().Character.Humanoid:GetState() == Enum.HumanoidStateType.Jumping) then 
                        FinalPart = 'Right Leg';
                    end;

                    if (GetSilentAimTarget().Character.Humanoid:GetState() == Enum.HumanoidStateType.FallingDown) then 
                        FinalPart = 'Right Foot';
                    end;

                    if (GetSilentAimTarget().Character.Humanoid:GetState() == Enum.HumanoidStateType.Freefall) then 
                        FinalPart = 'Left Foot';
                    end;
               end;

               Args[2] = GetSilentAimTarget().Character[FinalPart].Position + GetSilentAimTarget().Character[FinalPart].AssemblyLinearVelocity / GetProperty('SilentPrediction');

               return OldNameCall(self, unpack(Args));
           end;
        end;
           return OldNameCall(self, unpack(Args));
      end));

      RunService.RenderStepped:Connect(function()

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
                        if (Value ~= Player) and (Value.Character ~= nil) and (Value.Character:FindFirstChild('HumanoidRootPart')) and (Value.Character:FindFirstChildOfClass('Humanoid')) then 

                            if (Player:DistanceFromCharacter(Value.Character:FindFirstChild('HumanoidRootPart').Position) > GetProperty('KillAuraDistance')) then 
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
                                local Velocity = Value.Character:FindFirstChild('HumanoidRootPart').AssemblyLinearVelocity / 50;
                                Shoot(Value.Character:FindFirstChild('HumanoidRootPart').Position + Velocity);
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
    local Functions = Client:WaitForChild('Functions', 9e9);
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
        if (Value:IsA('IntValue')) or (Value:IsA('BoolValue')) then 
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


        local function AA(angleX, angleY)
            if (Character and RootPart) then
                RootPart.CFrame = CFrame.new(RootPart.Position, RootPart.Position + Vector3.new(Camera.CFrame.lookVector.X, 0, Camera.CFrame.lookVector.Z)) * CFrame.Angles(math.rad(angleX), math.rad(angleY), 0);
            end
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

        -- // Hook stuff

        local Old, Old2;

        Old = hookfunction(require(StepModules:WaitForChild('GunMechanics')).work, function(...)

            if (IsEnabled('NoHeat')) then 
                return;
            end;

            return Old(...);
        end);

        Old2 = require(Functions.General).applyvelocity

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

                if (Value ~= Player) and (Value.Character ~= nil) and (Value.Character:FindFirstChild('HumanoidRootPart')) and (Value.Character:FindFirstChildOfClass('Humanoid'))  and (Value.Character:FindFirstChild(GetProperty('SilentBody'))) then

                      local worldPoint = Value.Character[GetProperty('SilentBody')].Position;
                      local vector, onScreen = Camera:WorldToScreenPoint(worldPoint);

                      if (not onScreen) then 
                          continue;
                      end;

                      local magnitude = (Vector2.new(Mouse.X, Mouse.Y) - Vector2.new(vector.X, vector.Y)).magnitude;
    
                      if (magnitude <= GetProperty('SilentFOV')) and (Value.Character ~= nil) and (onScreen) then 
                          return Value.Character[GetProperty('SilentBody')];
                      end;
                end;
            end;

            return nil;
        end;

        local function getDirection(Origin, Position)
            return (Position - Origin).Unit * 1000; -- // https://raw.githubusercontent.com/Averiias/Universal-SilentAim/main/main.lua
        end;
        


        
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

            
            if (IsEnabled('SilentAim')) and (Method:lower() == 'findpartonraywithignorelist') and (GetSilentAimTarget() ~= nil)  then 


                local Closest = GetSilentAimTarget();

                if (Closest ~= nil) then 
                    Args[1] = Ray.new(Camera.CFrame.Position, (Closest.Position - Camera.CFrame.Position).Unit * 1000);
                    return OldNameCall(self, unpack(Args));
                end;
            end;

            return OldNameCall(self, ...);
        end));

        local function Stab(Part)
            ReplicatedStorage.Events[utf8.char(8203, 72, 105, 116, 80, 97, 114, 116)]:FireServer(Part, "\0\0Knife\0D0¡ý\"µ\f'8±gÆÑd‚Q\fœœ", 'swagg');
        end;

        Debris.ChildAdded:Connect(function(Object)
            if (Object.Name == 'DeadHP') then
                if (IsEnabled('AutoHeal')) and (RootPart ~= nil) then 
                    firetouchinterest(Object:WaitForChild('TouchInterest'), RootPart, 1);
                    firetouchinterest(Object:WaitForChild('TouchInterest'), RootPart, 0);
                end;

                if (IsEnabled('HealthESP')) then 
                    local __ = Object -- // sowwy ><
                    local Cham = Instance.new('BoxHandleAdornment', __);
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

       
        RunService.RenderStepped:Connect(function()

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

            if (IsEnabled('Backtrack')) then 
                for Index, Value in next, Players:GetPlayers() do 
                    if (Value ~= Player) and (Value.Team ~= nil) and (Value.Team ~= Player.Team) and (Value.Character ~= nil) and (Value.Character:FindFirstChild('HeadHB')) then 
                        local Clone = Instance.new('Part', Value.Character);
                        Clone.Color = GetProperty('BackColor');
                        Clone.Transparency = 0.5;
                        Clone.Position = Value.Character:FindFirstChild('HeadHB').Position;
                        Clone.Size = Value.Character:FindFirstChild('HeadHB').Size;
                        Clone.Material = 'ForceField';
                        Clone.Name = 'Backtrack';
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

                if (IsEnabled('CustomArms')) then 
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

                if (IsEnabled('CustomGun')) then 
                    for Index, Value in next, Camera:FindFirstChild('Arms'):GetChildren() do 
                        if (Value:IsA('Part')) or (Value:IsA('MeshPart')) then 
                            Value.Color = GetProperty('GunColor');
                            Value.Material = GetProperty('GunMaterial');
                            Value.Transparency = GetProperty('GunTrans');
                        end;
                    end;
                end;
            end;

            if (Character ~= nil) then 
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
            end;
      end);
        

else -- // Universal

    Create('Universal');
    LoadUniversal();
end;

    Library:Notify('Xenny-Ware | Created by xenny#0001 (642209011994722304) | https://youtube.com/c/xenny | enjoy!');
    Library:Notify('Successfully Loaded in: ' .. os.time() - Start .. '.');

Start = nil -- // :3