local penis
local nd = 0;
local dadtimer = 0
function onCreate()
	--Iterate over all notes
	for i = 0, getProperty('unspawnNotes.length')-1 do
		--Check if the note is an Instakill Note
		if getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'Yukichi' then
			setPropertyFromGroup('unspawnNotes', i, 'noAnimation', true); --No Anim
			end
		end
	end
	--debugPrint('Script started!')


-- Function called when you hit a note (after note hit calculations)
-- id: The note member id, you can get whatever variable you want from this note, example: "getPropertyFromGroup('notes', id, 'strumTime')"
-- noteData: 0 = Left, 1 = Down, 2 = Up, 3 = Right
-- noteType: The note type string/tag
-- isSustainNote: If it's a hold note, can be either true or false
function  onTimerCompleted(t,l,ll)
	if t == 'hold' then
		objectPlayAnimation('yukichi','idle',true)
	end
end
function opponentNoteHit(id, noteData, noteType, isSustainNote)
	if noteType == 'Yukichi' then
		cancelTimer('hold')
		if noteData == 0 then
			objectPlayAnimation('yukichi','singLEFT',true)
		end
		if noteData == 1 then
			objectPlayAnimation('yukichi','singDOWN',true)
		end
		if noteData == 2 then
			objectPlayAnimation('yukichi','singUP',true)
		end
		if noteData == 3 then
			objectPlayAnimation('yukichi','singRIGHT',true)
		end
		runTimer('hold', 0.6, 1)
	end
end
function goodNoteHit(id, noteData, noteType, isSustainNote)
	if noteType == 'Yukichi' then
		cancelTimer('hold')
		if noteData == 0 then
			objectPlayAnimation('yukichi','singLEFT',true)
		end
		if noteData == 1 then
			objectPlayAnimation('yukichi','singDOWN',true)
		end
		if noteData == 2 then
			objectPlayAnimation('yukichi','singUP',true)
		end
		if noteData == 3 then
			objectPlayAnimation('yukichi','singRIGHT',true)
		end
		runTimer('hold', 0.6, 1)
	end
end