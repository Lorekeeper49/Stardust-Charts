local penis
local nd = 0;
local dadtimer = 0
function onCreate()
	--Iterate over all notes
	for i = 0, getProperty('unspawnNotes.length')-1 do
		--Check if the note is an Instakill Note
		if getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'other-hey' then
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
	if noteType == 'other-hey' then
		triggerEvent('Play Animation', 'hey', 'bf');
	end
end
function goodNoteHit(id, noteData, noteType, isSustainNote)
	if noteType == 'other-hey' then
		triggerEvent('Play Animation', 'hey', 'dad');
	end
end
function noteMiss(id, noteData, noteType, isSustainNote)
	if noteType == 'other-hey' then
		characterPlayAnim('bf','idle',true);
	end
end