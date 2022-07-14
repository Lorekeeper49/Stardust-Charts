local totalSicks = 0;
local totalGoods = 0;
local totalBads = 0;
local totalShits = 0;
local highestCombo = 0;
local lastEvent = '';
local lastV1 = '';
local lastV2 = '';
function onUpdate()
	if not lowQuality then
		setPropertyFromClass('openfl.Lib', 'application.window.title', songName .. ' - Highest Combo:' .. highestCombo .. ' Sicks:' .. totalSicks .. ' Goods:' .. totalGoods .. ' Bads:' .. totalBads .. ' Shits:' .. totalShits .. ' Hits:' .. hits .. ' Step:' .. curStep .. ' Beat:' .. curBeat .. ' BPM:' .. curBpm .. ' Last Event:' .. lastEvent .. ' V1:' .. lastV1 .. ' V2:' .. lastV2);
	end
end
function goodNoteHit(id, direction, noteType, isSustainNote)
	if not lowQuality then
		if not isSustainNote then
			--structure
			strumTime = getPropertyFromGroup('notes', id, 'strumTime');
			local rating = getRating(strumTime - getSongPosition() + getPropertyFromClass('ClientPrefs','ratingOffset'));
        	if rating == 'sick' then
				totalSicks = totalSicks + 1;
			elseif rating == 'good' then
				totalGoods = totalGoods + 1;
			elseif rating == 'bad' then
				totalBads = totalBads + 1;
			else 
				totalShits = totalShits + 1;
			end
			if getProperty('combo') > highestCombo then
				highestCombo = getProperty('combo');
			end
    	end
	end
end
function getRating(diff)
	diff = math.abs(diff);
	if diff <= getPropertyFromClass('ClientPrefs', 'badWindow') then
		if diff <= getPropertyFromClass('ClientPrefs', 'goodWindow') then
			if diff <= getPropertyFromClass('ClientPrefs', 'sickWindow') then
				return 'sick';
			end
			return 'good';
		end
		return 'bad';
	end
	return 'shit';
end
function onEvent(n, v1, v2)
	lastEvent = n;
	lastV1 = v1;
	lastV2 = v2;
end