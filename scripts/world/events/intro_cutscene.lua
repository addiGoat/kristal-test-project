local IntroCutscene, super = Class(Event)

function IntroCutscene:init(data)
    super.init(self, data.x, data.y, 20, 20, data)

    print(Utils.dump(data))
    self.data = data
end

function IntroCutscene.postLoad()
    ---@diagnostic disable-next-line: unnecessary-if
    if Game:getFlag("seen_intro", true) then
        return
    end
    Game:setFlag("seen_intro", true)
    Game.world:startCutscene("castle", "intro")
end

return IntroCutscene
