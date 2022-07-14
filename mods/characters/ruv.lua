function opponentNoteHit(i, d, t, l)
    if difficulty <= 2 then
        triggerEvent('Screen Shake', '0.07, 0.03', '0.07, 0.03');
        characterPlayAnim('gf', 'scared', true);
        characterPlayAnim('bf', 'scared', true);
    end
end
function goodNoteHit(i, d, t, l)
    if difficulty >= 3 then
        triggerEvent('Screen Shake', '0.07, 0.03', '0.07, 0.03');
        characterPlayAnim('gf', 'scared', true);
        characterPlayAnim('bf', 'scared', true);
    end
end