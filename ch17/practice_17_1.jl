using Printf
using Dates

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

function timetoint(time :: MyTime)
    time.hour * 3600 + time.minute * 60 + time.second
end

function inttotime(second_in :: Int64)
    minute, second = divrem(second_in, 60)
    hour, minute = divrem(minute, 60)

    MyTime(hour, minute, second)
end


"""
isafter(t1, t2)

* t2 is after t1 => true 
* t2 is after t1 => false
"""
function isafter(time_1 :: MyTime, time_2 :: MyTime)
    (time_1.hour, time_1.minute, time_1.second ) < (time_2.hour, time_2.minute, time_2.second )
end

function increment(time :: MyTime, seconds :: Int64)
    time_to_sec = timetoint(time)
    time_to_sec += seconds

    inttotime(time_to_sec)
end

my_time = MyTime(10, 11, 30)

printtime(my_time)
printtime(120)

sec = timetoint(my_time)
println(sec)
printtime(inttotime(sec))

second_time = MyTime(10, 11, 20)

println(isafter(second_time, my_time))