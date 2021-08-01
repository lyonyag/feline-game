require("animation")
require("parallel")
require("cat")
require("sprite")
require("load")


--[[
_________________77777777777777777777777777______________________
___________777777__________________________7777__________________
_______7777____________________________________7777______________
_____757______________77___777777777777777777______777___________
____6_________________________________________________717________
___57_______________________777777_______________________57______
__4________________________________77777777777777_________57_____
_57________________________________________________________37____
73___________________77777777777777_________________777777774____
6__________________77_________________7____________7_______711___
9______________________________________77_______17___________73__
3______________________777777777777777________________________4__
5__79777777111115111114077777777____77141_________15111111111144_
6__107________________16_74__48889577___891777153105714693____330
_3___7________________16__77754433171___87_______597750946____678
_74___________________1977_____________70________33_____7______68
__75___________7__________771111111111177______477511115515111559
____57____777594________________________________17___________17_6
_____75_______451_________________________________71__________765
_______4_____7705___________________47____________75________7763_
_______37_____77957__________________777__77___7711______77_747__
_______37_____7746317_________777_____77737717777___7____77767___
_______37_______79661_________5____50643191197351895_3___797_____
_______6________777_907_______71__588888888888888889_7_7797______
______47________7__731901_________708888888888888897__7144_______
_____71_______________7661477______798888888888805__74951________
____15__________________7_45_1_______10888880657__7695___________
___47________7777__________7401_67_____7717______4967____________
777________75_________________749647674771015049177______________]]


drawList = {}
objects = {}

function love.load()
    loadSprites()
    loadAnimations()
    --[[    test = {}
        test.spriteSet = spriteSets.cat
        test.headSprite = test.spriteSet.happy
        test.bodySprite = test.spriteSet.sit
        test.headPos = { 16, 8 }
        test.animator = Animator:new(test)
        test.animator.animations = animations["defaultCat"]
        test.name = "test"]]
    --parallel.startCoroutine(function()
    --for i = 1, 100, 1 do
    --print(i)
    --parallel.waitForSeconds(1.0)
    --end
    --end, "test1")
    --test.animator:setAnimation("walk")
    --[[    parallel.startCoroutine(function()
            while (true) do
                for k, animation in pairs(test.animator.animations) do
                    print(k)
                    test.animator:setAnimation(k)

                    local t = 2
                    while t > 0 do
                        t = t - parallel.deltaTime
                        coroutine.yield()
                    end
                end

            end
        end, "test")]]
    cat = Cat:new("sneed")
    cat.headSprite.spriteSet = spriteSets["cat"]
    cat.bodySprite.spriteSet = spriteSets["cat"]
    cat.animator = Animator:new(cat)
    cat.animator.animations = animations["defaultCat"]
    cat.animator:setAnimation("walk")
    cat.animator:setAnimation("happy")
end

function love.update(dt)
    parallel.update(dt)
    for name, o in pairs(objects) do
        o:update()
    end
end

function love.draw()
    table.sort(drawList)
    for i, s in ipairs(drawList) do
        --[[        print(s.spriteSet.image)
                print(s.name)
                print(s.spriteSet[s.name])]]
        love.graphics.draw(s.spriteSet.image, s.spriteSet[s.name], s.x, s.y, 0, s.scaleX, 1, s.originX, s.originY)
    end
    --[[    love.graphics.draw(test.spriteSet.image, test.bodySprite, 0, 0)
        love.graphics.draw(test.spriteSet.image, test.headSprite, test.headPos[1], test.headPos[2])]]
end
