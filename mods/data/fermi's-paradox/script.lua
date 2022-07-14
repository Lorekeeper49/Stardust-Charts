function onCreate()
    setProperty('skipCountdown', true);
end
function onCreatePost()
    doTweenAlpha('hideHud', 'camHUD', 0, 0.001, 'linear');
end