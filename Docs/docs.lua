local Core = shared.__XennyWare; -- // Define the core table
local Functions = Core.Functions -- // Define the functions

-- Functions.MakeTab(Name <string>)
local Tab = Functions.MakeTab('Name');  -- // Create a tab with the chosen name

-- Functions.MakeSection(Tab <variable>, Name <string>, Side <string>)

local Holder = Functions.MakeSection(Tab, 'Holder', 'left'); -- Create a section for features Sides: Left, Right (if you actually need this i have no words)

-- Functions.MakeToggle(Section <variable>, Name <string>, Callback <function>)

local Aimbot = Functions.MakeToggle(Holder, 'Aimbot', function(Bool) -- // Creating a toggle, the callback is the third arg and passes in true or false depending on the toggles state
    print(Bool);
end):AddColorPicker('WhateverName', { -- // Creates a color picker with the set default color (can have up to 2 color pickers on a toggle)
    Text = 'WhatEver';
    Default = Color3.fromRGB(255, 255, 255);
});

-- Functions.MakeDrop(Section <variable>, Name <string>, Values <table>, Multi <boolean>, Callback <function>)

local BodyPart = Functions.MakeDrop(Holder, 'Body Part', {'Head'; 'Ok'}, false, function(Value) -- // Creates a dropdown, to make the dropdown multi select change the false to true
    print(Value);
end);	
                                                              -- 0: Min
                                                              -- 150: Max
                                                              -- 15: Default
                                                              -- 2: Rounding

-- Functions.MakeSlider(Section <variable>, Name <string>, Min <number>, Max <number>, Default <number>, Rounding <number>)

local Smoothness = Functions.MakeSlider(Holder, 'Smoothness', 0, 150, 15, 2, function(Value) -- // Creates a slider
    print(Value);
end);

-- Functions.MakeButton(Section <variable>, Name <string>, Callback <function>)

local Button = Functions.MakeButton(Holder, 'Print', function() -- // Creates a button with the third arg as the callback
    print'Hello World!';
end);

-- // Functions.IsEnabled(Index <string>) checks if something is enabled through the name of the set object
-- // For example, we named the aimbot toggle Aimbot so we need to check through the name
-- // Note: this only is meant for toggles

print(Functions.IsEnabled('Aimbot')) --> false 

-- // Functions.GetProperty is like Functions.IsEnabled but is meant for sliders, dropdowns, colorpickers, etc.
-- // Like Functions.IsEnabled(Index <string>) we check through the name of the object, we named the color picker for Aimbot WhateverName so we will use that

print(Functions.GetProperty('WhatEverName')) --> Color3.fromRGB(255, 255, 255);

-- // Functions.CharCheck() checks if the current chracter for the player exists, it will return true if it does and false if it doesnt

if (Functions.CharCheck()) then 
    print'The Character Exists!'
else
    print'The Character Does Not Exist!';
end;

-- // Functions.GoTo(Location <cframe>) goes to the set cframe and is just settings the HumanoidRootParts cframe to the set argument

Functions.GoTo(CFrame.new(-1, -1, -1));

-- // Functions.Chat(Message <string>) simply chats the message provided however only works on games using default chat, if the game uses custom chat you will need to make your own functions

Functions.Chat('Hello!');

-- // Functions.GetNearest(Bool <boolean>) gets the nearest player the first arg is team check

Functions.GetNearest(false);

-- // Functions.FetchPlayers returns a table with all the players in the game

Functions.FetchPlayers();

-- // Functions.ServerHop hops servers

Functions.ServerHop();

-- // Functions.GetAimbotTarget gets the current aimbot target (if it exists, if it doesnt nil will be returned)

Functions.GetAimbotTarget();

-- // Functions.SetYaw(Number <number>) will set the current players yaw to the number provided

Functions.SetYaw(-200);

-- // Functions.SaveConfig(Name <string>) will save the current settings with the name provided

Functions.SaveConfig('Test');

-- // Functions.LoadConfig(Name <string>) will load the config with the name provided, if it exists

Functions.LoadConfig('Test');

-- // Functions.IsDebug will return whether the current user is in debug mode or not

Functions.IsDebug();

-- // Functions.Unload() will unload the script and all of its features

Functions.Unload();

-- // Functions.Rejoin() will rejoin the game

Functions.Rejoin();

-- // Functions.ListParts() will return a table will all the parts in the current character

Functions.ListParts();

-- // Functions.LoadModule(Name <string>) will load the module only if it exists in the Module Folder (Xenny-Ware/Modules/) (.lua file extension is ignored, only use the name of the file)

Functions.LoadModule('MetaHandler')

-- Functions.UnloadModule(Name <string> will unload the module with the name)

Functions.UnloadModule('MetaHandler');

-- Functions.CleanupModules() clears all nil modules

Functions.CleanupModules();