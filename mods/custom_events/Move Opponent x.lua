function onEvent(name, value1, value2)
    if name == 'Move Opponent x' then
        doTweenX('movedadx', 'dad', value1, value2, 'sineOut');
    end
end