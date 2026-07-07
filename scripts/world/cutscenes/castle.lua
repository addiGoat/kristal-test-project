return {
    intro = function (c, _event)
        -- setup ralsei fade in
        local player = Game.world.player
        player.alpha = 0
        local duration = 0.5
        local timer = 0.0

        local x, y = 820, 190
        Game.world.player:setPosition(x, y)

        c:panTo("exit", 0)
        c:fadeOut(0)

        c:panTo("spawn", 4)
        c:wait(2.5)
        c:fadeIn(3)
        c:wait(2.5)

        Assets.playSound("escaped", 0.7, 0.75)
        c:walkTo("ralsei", "spawn", 1)
        while timer < duration do
            timer = timer + DT
            local t = timer / duration
            t = math.min(t, 1)
            player.alpha = Utils.lerp(0, 1, t)
            c:wait()
        end

        c:attachCameraImmediate()
        c:setSpeaker("ralsei", true)

        c:text("[face:pleased]* There we go![wait:5]\nAll tidied up!")
        c:wait(2)
        c:look("ralsei", "left")
        c:wait(1)
        c:look("ralsei", "right")
        c:wait(1)
        c:look("ralsei", "down")
        c:wait(2)

        c:text("[face:small_smile]* ...[wait:5]The festival must be\nwinding down soon.")
        c:text("[face:small_smile_side]* Kris and Susie could be\nhere anytime now.")
        c:wait(2)
        c:text("[face:pleased]* I'd better go get ready\nfor them!")
        c:look("ralsei", "left")
        Game.world.player.alpha = 1
    end,



    stairs = function (c, _event)
        c:setSpeaker("ralsei", true)
        c:text("[face:small_smile_side_b]* I don't think I need to\ngo up there right now...")
        local x, y = Game.world.player.x, Game.world.player.y

        if not x or not y then
            c:walkTo("ralsei", "spawn", 0.1)
        else
            c:walkTo("ralsei", x, y + 15, 0.1)
        end
    end,

    locked = function(c, _event)
        c:setSpeaker("ralsei", true)
        -- Assets.playSound("impact", 0.5, 1.3)
        -- c:wait(4)
        -- Assets.playSound("impact", 0.5, 1.3)
        -- c:wait(3)
        -- Assets.playSound("impact", 0.5, 1.3)
        -- c:wait(0.2)
        -- Assets.playSound("impact", 0.5, 1.3)
        -- c:wait(1)
        -- Assets.playSound("impact", 0.5, 1.3)
        -- c:wait(0.5)
        -- Assets.playSound("impact", 0.5, 1.3)
        -- c:wait(3)
        local keyReact = {
            text = "* (did I even have a key??)",
            x = 0,
            y = 0,
            face = "concern_smile",
            actor = "ralsei"
        }
        c:text("[face:surprise_neutral]* ...I guess I...[wait:15]\nLeft my key upstairs?[react:keyReact]")
    end


}
