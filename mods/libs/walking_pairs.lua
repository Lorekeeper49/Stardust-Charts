local wpairs = {};

function wpairs.init(self, py, scrollFact)
	self.pairs = {
		'mausten and swirl', 'zuih and zynux', 'ruvstyle and dragshot', 'sharv and hexadust', 'bendy and benly'
	};
	self.flip = {
		true, false, true, false, true
	}
	self.currPair = 0;
	local scales = { 0.95, 0.95, 1.15, 0.8, 0.85 };
	local offy = { 10, 170, -30, 130, 150 };
	--local offy = { 0, 150, 40, 50, 100 };
	for j = 0, 1 do
		for i = 1, #self.pairs do
			local objName = 'wpair_'..i;
			local imgSrc = 'dateweek/walking_pairs';
			if (j == 1) then
				objName = objName..'_alt';
				imgSrc = imgSrc..'_alt';
			end
			makeAnimatedLuaSprite(objName, imgSrc, 0, 0);
			setLuaSpriteScrollFactor(objName, scrollFact, scrollFact);
			addAnimationByPrefix(objName, self.pairs[i], self.pairs[i], 24, true);
			objectPlayAnimation(objName, self.pairs[i], true);
			scaleObject(objName, scales[i], scales[i]);
			addLuaSprite(objName, false);
			--setProperty(objName..'.x', -300 + (250 * (i-1)));
			setProperty(objName..'.x', -1000);
			setProperty(objName..'.y', py + offy[i]);
		end
	end
end

function wpairs.beat(self)
	if (curBeat % 24 == 0) then
		--local pair = math.random(1, #self.pairs);
		self.currPair = self.currPair + 1;
		if (self.currPair > #self.pairs) then self.currPair = 1; end
		local pair = self.currPair;
		local wlkRight = math.random(1, 100) > 50;
		local startPos, endPos;
		if (wlkRight) then
			startPos = -1000;
			endPos = 2000;
		else
			startPos = 2000;
			endPos = -1000;
		end
		local flip = self.flip[pair];
		if (not wlkRight) then flip = not flip; end
		local sufx = '';
		if (math.random(1, 100) < 20) then
			sufx = '_alt';
		end
		setProperty('wpair_'..pair..sufx..'.flipX', flip);
		setProperty('wpair_'..pair..sufx..'.x', startPos);
		doTweenX('anim:wpair_'..pair..sufx, 'wpair_'..pair..sufx, endPos, 10, 'linear');
	end
end

return wpairs;