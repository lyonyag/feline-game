Sprite = {
    x = 0,
    y = 0,
    z = 0,
    order = 0,
    originX = 0,
    originY = 0,
    scaleX = 1,
    new = function(self)
        local o = { }
        self.__lt = function(a, b)
            if a.z < b.z then
                return true
            elseif a.z == b.z and a.order < b.order
            then
                return true
            else
                return false
            end
        end
        self.spriteSet = spriteSets["placeholder"]
        self.name = "placeholder"
        self.__le = self.__lt
        self.__index = self
        setmetatable(o, self)
        table.insert(drawList, o)
        return o
    end,
    --[[    setZ = function(self, z)
            self.z = z
        end]]
}

