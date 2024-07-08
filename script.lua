--hide vanilla armor model
vanilla_model.PLAYER:setVisible(false)
--hide vanilla armor model
vanilla_model.ARMOR:setVisible(true)
--re-enable the helmet model
vanilla_model.HELMET:setVisible(false)

--hide vanilla cape model
vanilla_model.CAPE:setVisible(true)
--hide vanilla elytra model
vanilla_model.ELYTRA:setVisible(false)

--entity init event, used for when the avatar entity is loaded for the first time
function events.entity_init()
  --makes the model's eyes emissive, yay (they glow in the dark omg!!!).
  models.weebmaster.Head.Eyes:setPrimaryRenderType("EYES")
  models.weebmaster.Head.Eyes:setSecondaryRenderType("EMISSIVE")
end

--tick event, called 20 times a second
function events.tick()
  blink()
end

frames = {
  vec(0,0),     -- open eyes
  vec(8/24,0),  -- half closed eyes
  vec(16/24,0), -- closed eys
  vec(8/24,0)   -- half closed eyes
}

time = 1
nextBlink = 0

--this makes the model, well, blink.
--credits: https://manuel-3.github.io/animated-texture
function blink()
  if time > 4 then
    time = 1
    nextBlink = world.getTime() + math.random(30,50)
  end
    models.weebmaster.Head.Eyes:setUV(frames[time])
    if nextBlink < world.getTime() then
      time = time + 1
    end
    if(math.random(0,100) > 99) then
      nextBlink = world.getTime()
  end
end