function onEvent(name, value1, value2)
   if name == 'imageflash nofade' then
    makeLuaSprite(value2, value1, -560, -100);
    addLuaSprite(value2, true);
    scaleObject(value2, 10, 10);
    
    
    end
end