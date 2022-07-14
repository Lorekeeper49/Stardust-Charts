local shoot
function onEvent(n,v1,v2)
    if n == 'Pico Fires' then
        if not lowQuality then
            if v1 == '' then
                shoot = getRandomInt(1,4);
            else
                shoot = v1
            end
            if shoot == 1 then
                --don't ask why I didn't just make shoot animations for picospeaker
                triggerEvent('Play Animation', 'singLEFT', 'gf');
            elseif shoot == 2 then
                triggerEvent('Play Animation', 'singDOWN', 'gf');
            elseif shoot == 3 then
                triggerEvent('Play Animation', 'singUP', 'gf');
            elseif shoot == 4 then
                triggerEvent('Play Animation', 'singRIGHT', 'gf');
            end
            runTimer('picowait', 0.3);
        end
    end
end

function onTimerCompleted(t)
    if t == 'picowait' then
        if shoot == 1 then
            --don't ask why I didn't just make shoot animations for picospeaker
            triggerEvent('Play Animation', 'singLEFT-loop', 'gf');
        elseif shoot == 2 then
            triggerEvent('Play Animation', 'singDOWN-loop', 'gf');
        elseif shoot == 3 then
            triggerEvent('Play Animation', 'singUP-loop', 'gf');
        elseif shoot == 4 then
            triggerEvent('Play Animation', 'singRIGHT-loop', 'gf');
        end
    end
end