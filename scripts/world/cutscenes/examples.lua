return {
    dummy = function(cutscene, event)
        if Game:getFlag("encounter#dummy:done", false) then
            return
        end
        if Game:getFlag("saw_dummy", false) then
            cutscene:text("* You can't get by until you've taken care of that dummy")
            cutscene:wait(cutscene:walkTo("ralsei", "disengage", 0.5))
            return
        end
        cutscene:text("* ...")
        cutscene:wait(2)
        cutscene:text("* Don't you see there's a dummy in the way?")
        cutscene:text("* You couldn't possibly get past.")
        cutscene:wait(cutscene:walkTo("ralsei", "disengage", 1))

        Game:setFlag("saw_dummy", true)
    end
}
