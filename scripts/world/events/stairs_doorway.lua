local StairsDoorway, super = Class(Event)

function StairsDoorway:init(data)
    super.init(self, data.x, data.y, 20, 20, data)

    self.data = data
    self:setScale(2)
    self:setOrigin(0.5, 1)
end

function StairsDoorway:update()
    if Game:getFlag("door_removed, false") then
        self:remove()
    end
end
return StairsDoorway
