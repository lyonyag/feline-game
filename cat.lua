Cat = {
    x = 0,
    y = 0,
    z = 0,
    speed = 10,
    headPos = { 0, 0 },
    new = function(self, name)
        local o = {}
        self.__index = self
        setmetatable(o, self)
        objects["name"] = o
        o.animator = Animator:new(o)
        o.headSprite = Sprite:new()
        o.bodySprite = Sprite:new()
        o.headSprite.order = 1
        o.name = name
        --[[        o.headSprite.spriteSet = spriteSets.placeholder
                o.bodySprite.spriteSet = spriteSets.placeholder
                o.headSprite.name = "placeholder"
                o.bodySprite.name = "placeholder"]]
        o.headPos = { 0, 0 }
        return o
    end,
    update = function(self)
        self.bodySprite.x = self.x
        self.bodySprite.y = self.y

        self.headSprite.x = self.bodySprite.x + self.headPos[1]
        self.headSprite.y = self.bodySprite.y + self.headPos[2]
    end,
    walkTo = function(x, y)

    end
}
