function onEvent(name, value1, value2)
    if name == 'Move Opponent y' then
        doTweenY('movedady', 'dad', value1, value2, 'backOut');
    end
end