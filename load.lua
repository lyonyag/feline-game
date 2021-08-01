animations = {}
spriteSets = {}

function loadSprites()
    local img = love.graphics.newImage("/textures/cat.png")
    spriteSets["cat"] = {
        image = img,
        stand = love.graphics.newQuad(0, 0, 32, 32, img),
        walk1 = love.graphics.newQuad(32, 0, 32, 32, img),
        walk2 = love.graphics.newQuad(64, 0, 32, 32, img),
        lie = love.graphics.newQuad(96, 0, 32, 32, img),
        sit = love.graphics.newQuad(128, 0, 32, 32, img),
        poke1 = love.graphics.newQuad(160, 0, 32, 32, img),
        poke2 = love.graphics.newQuad(192, 0, 32, 32, img),
        happy = love.graphics.newQuad(0, 32, 32, 32, img),
        tongue = love.graphics.newQuad(32, 32, 32, 32, img),
        sleep = love.graphics.newQuad(64, 32, 32, 32, img),
        angry = love.graphics.newQuad(96, 32, 32, 32, img)
    }
    spriteSets["placeholder"] = {
        image = love.graphics.newImage("/textures/placeholder.png")
    }
    spriteSets["placeholder"].placeholder = love.graphics.newQuad(0, 0, 32, 32, spriteSets.placeholder.image)
end

function loadAnimations()
    animations["defaultCat"] = {
        stand = {
            part = "body",
            {
                execute = function(owner)
                    owner.bodySprite.name = "stand"
                    owner.headPos = { 12, 4 }
                end,
                duration = 0.2 }
        },
        walk = { part = "body", {

            execute = function(owner)
                owner.bodySprite.name = "walk1"
                owner.headPos = { 12, 4 }
            end,
            duration = 0.2 },
                 {
                     execute = function(owner)
                         owner.bodySprite.name = "walk2"
                         owner.headPos = { 12, 4 }
                     end,
                     duration = 0.2 }
        },
        sit = { part = "body", {

            execute = function(owner)
                owner.bodySprite.name = "sit"
                owner.headPos = { 12, 4 }
            end,
            duration = 0.2 }
        },
        lie = { part = "body", {

            execute = function(owner)
                owner.bodySprite.name = "lie"
                owner.headPos = { 12, 4 }
            end,
            duration = 0.2 }
        },
        poke = {
            part = "body",
            {
                execute = function(owner)
                    owner.bodySprite.name = "poke1"
                    owner.headPos = { 12, 4 }
                end,
                duration = 0.2 },
            {
                execute = function(owner)
                    owner.bodySprite.name = "poke2"
                    owner.headPos = { 12, 4 }
                end,
                duration = 0.2 }
        },
        happy = { part = "head", {
            execute = function(owner)
                owner.headSprite.name = "happy"
            end,
            duration = 0.2 }
        },
        tongue = { part = "head", {
            execute = function(owner)
                owner.headSprite.name = "tongue"
            end,
            duration = 0.2 }
        },
        sleep = { part = 'head', {
            execute = function(owner)
                owner.headSprite.name = "sleep"
            end,
            duration = 0.2 }
        },
        angry = { part = 'head', {
            execute = function(owner)
                owner.headSprite.name = "angry"
            end,
            duration = 0.2 }
        },
    }
end
