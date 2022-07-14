function onEvent(name, value1, value2)
   if name == 'image alpha' then
    doTweenAlpha('byebye', 'image', value1, value2, 'linear');
    end
end