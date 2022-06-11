shared.ExecutionSettings = {
    ['Silent Load'] = false; -- // Loads without notifications
    ['Execute On Teleport'] = true; -- // Executes the script on teleport
    ['Execution Delay'] = 0; -- // Delay for the script
    ['Auto Load Config'] = true; -- // Load the set auto load config
    ['Auto Load Theme'] = true; -- // Load the set auto load theme
    ['Debug'] = false; -- // Enabled debug tab (not recommended)
};

Client = game:GetService('Players').LocalPlayer;

function LoadFromGithub(Owner, Name, FolderName, FileName)
    loadstring(game:HttpGet(string.format('https://raw.githubusercontent.com/%s/%s/main/%s/%s', Owner, Name, FolderName, FileName)))();
end;

local Success, Error = pcall(LoadFromGithub('ballswtfok123', 'Xenny-Ware', 'Main', 'source.lua'));

if (not Success) then 
    Client:Kick(string.format('Failed To Load Script.\nContents:%s', Error));
end;