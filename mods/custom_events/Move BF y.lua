function onEvent(name, value1, value2)
    if name == 'Move BF y' then
        doTweenY('movebfy', 'boyfriend', value1, value2, 'sineOut');
    end
end