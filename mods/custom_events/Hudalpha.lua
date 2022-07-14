function onEvent(name,value1,value2)
	if name == 'Hudalpha' then
		doTweenAlpha('GUItween', 'camHUD', value1, value2, 'none');
	end
end	