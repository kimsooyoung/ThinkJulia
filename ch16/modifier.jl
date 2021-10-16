using Printf

"""
Represensts the time of the day.

fields : hour, minute, second

"""

mutable struct MyTime
    hour
    minute
    second
end

function printtime(my_time)
    @printf("%02d:%02d:%02d\n", my_time.hour, my_time.minute, my_time.second)
end

function isafter(t1, t2)
    tuple_t1 = (t1.hour, t1.minute, t1.second)
    tuple_t2 = (t2.hour, t2.minute, t2.second)

    tuple_t1 > tuple_t2
end

function addtime(t1, t2)
    hour = t1.hour + t2.hour    
    minute = t1.minute + t2.minute    
    second = t1.second + t2.second
    
    if second ≥ 60
        minute += 1
        second -= 60
    end
    if minute ≥ 60
        hour += 1
        minute -= 60
    end

    MyTime(hour, minute, second)
end

function increment!(t1, seconds)
    t1.second += seconds
    if t1.second ≥ 60
        t1.minute += 1
        t1.second -= 60
    end

    if t1.minute ≥ 60
        t1.hour += 1
        t1.minute -= 60
    end
end

t1 = MyTime(2, 30, 17)
t2 = MyTime(2, 30, 27)
printtime(t1)
printtime(t2)

println(isafter(t1, t2))

increment!(t1, 50)
printtime(t1)
