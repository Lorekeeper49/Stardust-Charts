function onCreate()
	--Iterate over all notes
	for i = 0, getProperty('unspawnNotes.length')-1 do
		--Check if the note is an Instakill Note
		if getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'other' then
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
function opponentNoteHit(id, noteData, noteType, isSustainNote)
	if noteType == 'other' then
		if noteData == 0 then
			triggerEvent('Play Animation', 'singLEFT', 'bf');
		end
		if noteData == 1 then
			triggerEvent('Play Animation', 'singDOWN', 'bf');
		end
		if noteData == 2 then
			triggerEvent('Play Animation', 'singUP', 'bf');
		end
		if noteData == 3 then
			triggerEvent('Play Animation', 'singRIGHT', 'bf');
		end
	end
end
function goodNoteHit(id, noteData, noteType, isSustainNote)
	if noteType == 'other' then
		if noteData == 0 then
			triggerEvent('Play Animation', 'singLEFT', 'dad');
		end
		if noteData == 1 then
			triggerEvent('Play Animation', 'singDOWN', 'dad');
		end
		if noteData == 2 then
			triggerEvent('Play Animation', 'singUP', 'dad');
		end
		if noteData == 3 then
			triggerEvent('Play Animation', 'singRIGHT', 'dad');
		end
	end
end
function noteMiss(id, noteData, noteType, isSustainNote)
	if noteType == 'other' then
		characterPlayAnim('bf','idle',true);
	end
end