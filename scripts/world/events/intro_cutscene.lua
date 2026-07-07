local IntroCutscene, super = Class(Event)

function IntroCutscene:init(data)
    super.init(self, data.x, data.y, 20, 20, data)

    print(Utils.dump(data))
    self.data = data
end

function IntroCutscene.postLoad()
    if Game:getFlag("seen_intro", false) then
        return
    end
    Game:setFlag("seen_intro", true)
    Game.world:startCutscene("castle", "intro")
end

return IntroCutscene
