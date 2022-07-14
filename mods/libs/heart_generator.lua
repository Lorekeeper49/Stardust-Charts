local heartGen = { py = 0, behindIt = nil };

function heartGen.init(self, py, behindIt)
	self.py = py or 0;
	self.behindIt = behindIt;
	precacheImage('dateweek/heartthingy');
end

function heartGen.spawnHeart(self, px, height, tweenTime)
	local i = getPropertyFromClass('Conductor', 'songPosition');
	local objName = 'heart_'..i;
	makeAnimatedLuaSprite(objName,'dateweek/heartthingy', px, self.py);
	addAnimationByPrefix(objName, 'beat','heartthing', 24, true)
	objectPlayAnimation(objName, 'beat', true)
	addLuaSprite(objName, false);
	if (self.behindIt) then
		setObjectOrder(objName, getObjectOrder(self.behindIt));
	end
	setProperty(objName..'.alpha', 0.9);
	setLuaSpriteScrollFactor(objName, 0.8, 0.8);
	doTweenY('float:'..objName, objName, height, tweenTime);
	doTweenAlpha('alpha:'..objName, objName, 0, tweenTime);
	--debugPrint('Pushing heart: '..objName);
end

function heartGen.evalTweenEnd(self, tag)
	if (startsWith(tag, 'float:heart_')) then
		local objName = tag:sub(7);
		removeLuaSprite(objName, true);
	end
end

-- Thank you, @filmor from StackOverflow
function startsWith(String, Start)
   return string.sub(String, 1, string.len(Start))==Start
end

return heartGen;