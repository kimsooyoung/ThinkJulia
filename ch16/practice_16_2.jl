using Printf

"""
Represensts the time of the day.

fields : hour, minute, second

"""

struct MyTime
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

t1 = MyTime(2, 30, 17)
t2 = MyTime(2, 30, 27)
printtime(t1)
printtime(t2)

println(isafter(t1, t2))