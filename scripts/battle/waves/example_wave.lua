local ExampleWave, super = Class(Wave)

function ExampleWave:init()
    super.init(self)

    self.time = 5
end

function ExampleWave:onStart()
    local dummy = self:getAttackers()[1]

    self.timer:every(1 / 3, function ()
        local x = MathUtils.random(Game.battle.arena.left, Game.battle.arena.right)
        local y = 20
        local bullet = self:spawnBullet("bullets/smallbullet", x, y)
        bullet.physics.direction = math.rad(90)
        bullet.physics.speed = 8
    end)

    self.timer:everyInstant(1, function ()
        ---@diagnostic disable-next-line: unused-local
        for i = 1, 10 do
            local x, y = dummy:getRelativePos(dummy.width/2, dummy.height/2)
            local bullet = self:spawnBullet("bullets/smallbullet", x, y)
            bullet.rotation = math.rad(180)
            bullet.physics.match_rotation = true
            local target_angle = MathUtils.angle(x, y, Game.battle.soul.x, Game.battle.soul.y)
            bullet.rotation = target_angle + math.rad(MathUtils.random(-30, 30))
            bullet.physics.speed = 5
        end
    end)

end

function ExampleWave:update()
    super.update(self)
end

return ExampleWave
