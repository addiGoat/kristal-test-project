return {
    intro = function (c, _event)
        -- setup ralsei fade in
        local player = Game.world.player
        player.alpha = 0
        local duration = 0.5
        local timer = 0.0

        c:panTo("exit", 0)
        c:fadeOut(0)

        c:panTo("spawn", 4)
        c:wait(2.5)
        c:fadeIn(3)
        c:wait(2.5)

        Assets.playSound("escaped", 0.7, 0.75)
        c:walkTo("ralsei", "intro_end_pos", 1)
        while timer < duration do
            timer = timer + DT
            local t = timer / duration
            t = math.min(t, 1)
            player.alpha = Utils.lerp(0, 1, t)
            c:wait()
        end

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
        c:attachCameraImmediate()
        Game.world.player.alpha = 1
    end

}
