local penis
local nd = 0;
local dadtimer = 0
function onCreate()
	--Iterate over all notes
	for i = 0, getProperty('unspawnNotes.length')-1 do
		--Check if the note is an Instakill Note
		if getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'KOU' then
			setPropertyFromGroup('unspawnNotes', i, 'noAnimation', true); --No Anim
		end
	end
	--debugPrint('Script started!')
end

-- Function called when you hit a note (after note hit calculations)
-- id: The note member id, you can get whatever variable you want from this note, example: "getPropertyFromGroup('notes', id, 'strumTime')"
-- noteData: 0 = Left, 1 = Down, 2 = Up, 3 = Right
-- noteType: The note type string/tag
-- isSustainNote: If it's a hold note, can be either true or false
function  onTimerCompleted(t,l,ll)
	if t == 'hold' then
		objectPlayAnimation('kou','idle',true)
		setProperty('kou.offset.x', 0);
		setProperty('kou.offset.y', 0);
	end
end
function opponentNoteHit(id, noteData, noteType, isSustainNote)
	if noteType == 'KOU' then
		cancelTimer('hold')
		if noteData == 0 then
			objectPlayAnimation('kou','singLEFT',true)
			setProperty('kou.offset.x', 8)
	 		setProperty('kou.offset.y', -5)
		end
		if noteData == 1 then
			objectPlayAnimation('kou','singDOWN',true)
			setProperty('kou.offset.x', 3)
	 		setProperty('kou.offset.y', -69)
		end
		if noteData == 2 then
			objectPlayAnimation('kou','singUP',true)
			setProperty('kou.offset.x', -2)
	 		setProperty('kou.offset.y', 4)
		end
		if noteData == 3 then
			objectPlayAnimation('kou','singRIGHT',true)
			setProperty('kou.offset.x', -63)
	 		setProperty('kou.offset.y', -44)
		end
		runTimer('hold', 0.6, 1)
	end
end
function goodNoteHit(id, noteData, noteType, isSustainNote)
	if noteType == 'KOU' then
		cancelTimer('hold')
		if noteData == 0 then
			objectPlayAnimation('kou','singLEFT',true)
			setProperty('kou.offset.x', 8)
	 		setProperty('kou.offset.y', -5)
		end
		if noteData == 1 then
			objectPlayAnimation('kou','singDOWN',true)
			setProperty('kou.offset.x', 3)
	 		setProperty('kou.offset.y', -69)
		end
		if noteData == 2 then
			objectPlayAnimation('kou','singUP',true)
			setProperty('kou.offset.x', -2)
	 		setProperty('kou.offset.y', 4)
		end
		if noteData == 3 then
			objectPlayAnimation('kou','singRIGHT',true)
			setProperty('kou.offset.x', -63)
	 		setProperty('kou.offset.y', -44)
		end
		runTimer('hold', 0.6, 1)
	end
end