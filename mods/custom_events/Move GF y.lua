function onEvent(name, value1, value2)
    if name == 'Move GF y' then
        doTweenY('movegfy', 'girlfriend', value1, value2, 'sineOut');
    end
end