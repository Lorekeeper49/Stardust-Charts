function onEvent(name, value1, value2)
    if name == 'Move GF x' then
        doTweenX('movegfx', 'girlfriend', value1, value2, 'sineOut');
    end
end