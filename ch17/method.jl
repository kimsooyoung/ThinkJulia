using Printf

struct MyTime
    hour :: Int64
    minute :: Int64
    second :: Int64
end

function printtime(time)
    println("I don't know what you want")    
end

function printtime(time :: MyTime)
    @printf("%02d:%02d:%02d\n", time.hour, time.minute, time.second)
end

my_time = MyTime(10, 11, 30)

printtime(my_time)
printtime(120)