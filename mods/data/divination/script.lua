local resetHideHud = false
local sickScore = 350
local goodScore = 200
local badScore = 100
local shitScore = 50
local addedScore = 0
function onCreatePost()
	resetHideHud = not hideHud;
	if resetHideHud then
		setPropertyFromClass('ClientPrefs', 'hideHud', true);

		-- disable debug keys SORRY ;(
		-- exiting with these will fuck up your hide HUD setting
		-- if you wanna use em enable hide hud first!!!!

		setProperty('debugKeysChart', null);
		setProperty('debugKeysCharacter', null);
	end

	makeLuaText('rating', '', 1, 0, -30)
	setScrollFactor('rating', 0, 0);
	setTextAlignment('rating', 'center');
	makeLuaText('addScore', '', 1, 0, 20)
	setScrollFactor('addScore', 0, 0);
	setTextAlignment('addScore', 'center');
	makeLuaText('addedScore', '', 1, 0, 70)
	setScrollFactor('addedScore', 0, 0);
	setTextAlignment('addedScore', 'center');
	doTweenAlpha('hideScore', 'addScore', 0, 0.001, 'linear');
end	
function goodNoteHit(id, direction, noteType, isSustainNote)
	-- Hotline's unique score system
	cancelTimer('waitToAdd');
	if not isSustainNote and resetHideHud then
		--structure
		strumTime = getPropertyFromGroup('notes', id, 'strumTime');
		local rating = getRating(strumTime - getSongPosition() + getPropertyFromClass('ClientPrefs','ratingOffset'));
		
		setTextString('rating', rating .. ' X' .. getProperty('combo'));
		if rating == 'SICK' then
			setTextString('addScore', '+' .. sickScore);
			addedScore = addedScore + sickScore
		elseif rating == 'GOOD' then
			setTextString('addScore', '+' .. goodScore);
			addedScore = addedScore + goodScore
		elseif rating == 'BAD' then
			setTextString('addScore', '+' .. badScore);
			addedScore = addedScore + badScore
		else 
			setTextString('addScore', '+' .. shitScore);
			addedScore = addedScore + shitScore
		end
		setTextString('addedScore', addedScore);
		
		addLuaText('rating', true);
		addLuaText('addScore', true);
		doTweenAlpha('showAddScore', 'addScore', 1, 0.1, 'linear');
		addLuaText('addedScore', true);
	end
	runTimer('waitToAdd', 1);
end

function getRating(diff)
	diff = math.abs(diff);
	if diff <= getPropertyFromClass('ClientPrefs', 'badWindow') then
		if diff <= getPropertyFromClass('ClientPrefs', 'goodWindow') then
			if diff <= getPropertyFromClass('ClientPrefs', 'sickWindow') then
				return 'SICK';
			end
			return 'GOOD';
		end
		return 'BAD';
	end
	return 'SHIT';
end

-- there is no hook for playstate closing so i have to cover all exiting options!!!
-- closing the game dont matter cuz this doesnt save the pref to save data anyway
-- the ONLY WAY this fucks up to my knowledge is if u use chart/character debug key
-- to exit playstate so those are disabled now. if u wanna use em, enable hide hud!

function onGameOver()
	if resetHideHud then
		setPropertyFromClass('ClientPrefs', 'hideHud', false);
	end
end
function onEndSong()
	if resetHideHud then
		setPropertyFromClass('ClientPrefs', 'hideHud', false);
	end
end
function onPause()
	if resetHideHud then
		setPropertyFromClass('ClientPrefs', 'hideHud', false);
	end
end
function onResume() -- lol put it back on
	if resetHideHud then
		setPropertyFromClass('ClientPrefs', 'hideHud', true);
	end
end
function onTweenCompleted(tag)
	if tag == 'showAddScore' then
		doTweenAlpha('hideAddScore', 'addScore', 0, 0.1, 'linear');
	end
	if tag == 'hideRating0' then
		doTweenAlpha('showRating0', 'rating', 1, 0.001, 'linear');
	end
	if tag == 'showRating0' then
		doTweenAlpha('hideRating1', 'rating', 0, 0.001, 'linear');
	end
	if tag == 'hideRating1' then
		doTweenAlpha('showRating1', 'rating', 1, 0.001, 'linear');
	end
	if tag == 'showRating1' then
		doTweenAlpha('hideRating2', 'rating', 0, 0.001, 'linear');
	end
	if tag == 'showRating2' then
		setTextString('rating', '0');
	end
end
function onTimerCompleted(tag)
	if tag == 'waitToAdd' then
		setProperty('combo', 0);
		doTweenAlpha('hideRating0', 'rating', 0, 0.001, 'linear');
		if not shits == 0 then
			setTextString('rating', 'WHOOPS!');
		elseif not bads == 0 then
			setTextString('rating', 'EH');
		elseif not goods == 0 then
			setTextString('rating', 'GREAT');
		else 
			setTextString('rating', 'PERFECT');
		end
		while not addedScore == 0 do
			doTweenAlpha('hideScore', 'addedScore', 0, 0.001, 'linear');
			addedScore = addedScore - 10
			doTweenAlpha('hideScore', 'addedScore', 0, 0.001, 'linear');
		end
	end
end