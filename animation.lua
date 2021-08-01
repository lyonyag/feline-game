Animator = {
    animations = {},
    new = function(self, owner)
        o = { owner = owner }
        self.__index = self
        setmetatable(o, self)
        return o
    end,
    currentAnimations = {},
    setAnimation = function(self, name)
        local animation = self.animations[name]
        parallel.startCoroutine(function()
            while (true) do
                for i, frame in ipairs(animation) do
                    frame.execute(self.owner)
                    local t = frame.duration
                    while t > 0 do
                        t = t - parallel.deltaTime
                        coroutine.yield()
                    end
                end
            end
        end, (self.owner.name) .. animation.part)
    end
}
