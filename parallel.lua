parallel = {
    deltaTime = 1,
    startCoroutine = function(f, name)
        local co = coroutine.create(f)
        parallel.coroutines[name] = co
    end,
    waitForSeconds = function(time)
        local remaining = time
        while remaining > 0 do
            remaining = remaining - parallel.deltaTime
            print(remaining)
            coroutine.yield()
        end
    end,
    stopCoroutine = function(name)

    end,
    update = function(dt)
        parallel.deltaTime = dt
        --if #coroutine == 0 then
        --return
        --end
        for i, co in pairs(parallel.coroutines) do
            if not coroutine.resume(co) then
                table[i] = nil
            end
        end
    end,
    coroutines = {}
}
