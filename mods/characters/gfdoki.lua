function onCountdownTick(swagCounter)
  if not lowQuality then
    if swagCounter == 0 then
	    characterPlayAnim('gf', 'countdown0', true);
    end
    if swagCounter == 1 then
	    characterPlayAnim('gf', 'countdown1', true);
    end
    if swagCounter == 2 then
	    characterPlayAnim('gf', 'countdown2', true);
    end
    if swagCounter == 3 then
	    characterPlayAnim('gf', 'countdown3', true);
    end
  end
end