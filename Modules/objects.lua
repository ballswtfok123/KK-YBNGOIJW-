
Obj = {};
Objects = {};
Cache = {};
Trash = {};

function Obj.new(Name, Props)

    assert(Name or Props, 'An argument is nil.');
    CreatedObject = setmetatable(Props, Objects);
    CreatedObject['Name'] = Name;
    Objects[CreatedObject] = CreatedObject;
    
    return CreatedObject
end;

function Obj.exists(Object)
    return Objects[Object] ~= nil;
end;

function Obj.remove(Object)
    if (Obj.exists(Object)) then 
        Objects[Object] = nil;
    end;
end;

function Obj:Cleanup()
    if (Obj.exists(self)) then 
        for _, __ in next, self do 
            if (_ == nil) or (__ == nil) then 
                self[_] = nil;
            end;
        end;
    end;
end;

function Obj.setvalue(Object, Index, Value)
    if (Obj.exists(Object)) then 
        Object[Index] = Value;
    end;
end;

function Trash.clear()
    table.clear(Trash);
end;


