--custom opponent note skin <3
--credit to vCherry.kAI.16 <3 if you remove this text then you're not allowed to use this

function onCreate()
if difficulty == 3 then
	setPropertyFromGroup('unspawnNotes', i, 'missHealth', '-5000');
end
	
	for i = 0, getProperty('unspawnNotes.length')-1 do
		if getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'teeth_note' then --"NOTE_NAME" must be the EXACT same as this lua file's name
			setPropertyFromGroup('unspawnNotes', i, 'texture', 'TEETH_NOTE_assets'); --"NOTES_TEXTURE" must exactly match the .png and .xml file you want to use(located in custom_notetypes)
			setPropertyFromGroup('unspawnNotes', i, 'hitHealth', '-0.023'); --Default value is: 0.023, health gained on hit
			setPropertyFromGroup('unspawnNotes', i, 'missHealth', '0.2'); --Default value is: 0.0475, health lost on miss || nerf the teeth note on other difficulty expect teeth difficulty
			setPropertyFromGroup('unspawnNotes', i, 'hitCausesMiss', false);

			if getPropertyFromGroup('unspawnNotes', i, 'mustPress') then --Doesn't let Dad/Opponent notes get ignored
				setPropertyFromGroup('unspawnNotes', i, 'ignoreNote', false); --Miss has no penalties
			end
		end
	end
	--debugPrint('Script started!')
end

-- Function called when you hit a note (after note hit calculations)
-- id: The note member id, you can get whatever variable you want from this note, example: "getPropertyFromGroup('notes', id, 'strumTime')"
-- noteData: 0 = Left, 1 = Down, 2 = Up, 3 = Right
-- noteType: The note type string/tag
-- isSustainNote: If it's a hold note, can be either true or false
function goodNoteHit(id, noteData, noteType, isSustainNote)
	if noteType == 'teeth_note' then
		-- put something here if you want
	end
end

-- Called after the note miss calculations
-- Player missed a note by letting it go offscreen
function noteMiss(id, noteData, noteType, isSustainNote)
	if noteType == 'teeth_note' then
		-- put something here if you want
	end
end

function onGameOver()
	setPropertyFromClass('GameOverSubstate', 'characterName', 'teeth-death'); --Character json file for the death animation
	setPropertyFromClass('GameOverSubstate', 'deathSoundName', 'fnf_loss_sfx'); --put in mods/sounds/
end