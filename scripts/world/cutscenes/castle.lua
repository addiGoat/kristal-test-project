return {
    intro = function (c, _event)
        print("test debug message")
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
        -- init
        local player = Game.world.player
        local keyReact = {
            {
                "(do I even have a key??)",
                "rightmid",
                "bottom",
                "concern_smile",
                "ralsei"
            }
        }

        local eyeX, eyeY = c:getMarker("sparkle_eye")
        local eye = Sprite("sparkle", eyeX, eyeY)
        eye.alpha = 0
        eye.layer = Game.world.player.layer
        Game.world:addChild(eye)
        local duration = 1
        local timer = 1
        c:setSpeaker("ralsei", true)

        -- Ralsei knocking
        Assets.playSound("impact", 0.5, 1.3)
        c:wait(4)
        Assets.playSound("impact", 0.5, 1.3)
        c:wait(3)
        Assets.playSound("impact", 0.5, 1.3)
        c:wait(0.2)
        Assets.playSound("impact", 0.5, 1.3)
        c:wait(3)
        c:text("* ...I guess I...[wait:15]\nLeft my key upstairs?[wait:10][react:1]", "surprise_neutral", "ralsei", { reactions = keyReact})

        -- eye flash
        Game.world.timer:tween(0.05, eye, {alpha = 1})
        c:playSound("bell", 0.5)
        Game.world.timer:after(0.1, function()
            Game.world.timer:tween(0.1, eye, {alpha = 0}, "linear", function()
                eye:remove()
            end)
        end)
        c:wait(0.25)
        c:playSound("escaped", 0.5, 0.75)
        c:wait(0.5)
        c:alert("ralsei")
        c:walkTo("ralsei", player.x, player.y, 0, "up")
        c:wait(0.25)
        c:wait(0.25)
        c:panTo("sparkle_eye", 1)
        c:wait(0.25)

        -- ralsei investigates door
        c:wait(c:walkTo("ralsei", "main_door", 0.25))
        c:wait(c:walkTo("ralsei", "ralsei_investigate", 0.75))
        c:walkTo("ralsei", player.x, player.y, 0, "up")
        c:attachCameraImmediate()
        c:wait(1.5)
        c:text("[face:shock_smile]* Hello?[wait:10] Is someone there?")
        c:wait(1)
        Game:setFlag("door_removed", true)
        local option = 0
        local secondChoiceText = "Investigate\nfurther?"
        local hasInvestigated = false
        while option ~= 1 do
            option = c:choicer({"Get key", secondChoiceText})

            if option == 1 then
                c:text("[face:stressed]* ...[wait:5]I'm sure it was...[wait:10]\njust my imagination.")
                c:wait(1.5)
                c:text("[face:surprise_smile]* I'll just... carry\non with what I was\njust doing!")
                c:text("[face:stressed]* Back upstairs, haha!")
                return
            end
            if not hasInvestigated then
                hasInvestigated = true
                secondChoiceText = "Investigate\neven further"
                c:text("[face:surprise_smile]* ...[wait:10]Helllooooo? There's no\nneed to be shy,[wait:5] I'm\nvery friendly!")
            else
                c:text("[face:concern_smile]* well here we go!")
                c:walkTo("ralsei", "cutscene_stairs_end", 1.5)
                c:wait(0.5)
                c:playSound("escaped", 0.75, 0.75)
                while timer > 0 do
                    timer = timer - DT
                    local t = timer / duration
                    t = math.max(t, 0)
                    player.alpha = Utils.lerp(0, 1, t)
                    c:wait()
                end
                c:wait(1)
                c:wait(c:fadeOut(2))
                c:loadMap("castle_basement")
                return
            end
        end
    end
}
