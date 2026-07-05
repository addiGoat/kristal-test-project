return {
    dummy = function(c, event)
        if Game:getFlag("encounter#dummy:done", false) then
            return
        end
        if Game:getFlag("saw_dummy", false) then
            c:text("[voice:ralsei][face:ralsei/determined_up]* (I can't get by until I've taken care of that dummy)")
            c:wait(c:walkTo("ralsei", "disengage", 0.5))
            return
        end
        c:text("* ...")
        c:wait(2)
        c:text("* Don't you see there's a dummy in the way?")
        c:text("* You couldn't possibly get past.")
        c:wait(c:walkTo("ralsei", "disengage", 1))

        Game:setFlag("saw_dummy", true)
    end
}
