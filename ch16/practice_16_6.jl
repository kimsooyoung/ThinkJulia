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
    if my_time.second isa Int
        @printf("%02d:%02d:%02d\n", my_time.hour, my_time.minute, my_time.second)
    else
        @printf("%02d:%02d:%02.2f\n", my_time.hour, my_time.minute, my_time.second)
    end
end

function isafter(t1, t2)
    tuple_t1 = (t1.hour, t1.minute, t1.second)
    tuple_t2 = (t2.hour, t2.minute, t2.second)

    tuple_t1 > tuple_t2
end

function addtime(t1, t2)
    second = timetoint(t1) + timetoint(t2)
    inttotime(second)
end

function timetoint(my_time)
    my_time.hour * 3600 + my_time.minute * 60 + my_time.second
end

function inttotime(second_in)
    minute, second = divrem(second_in, 60)
    hour, minute = divrem(minute, 60)

    MyTime(hour, minute, second)
end

function copytime(t_src, t_des)
    t_src.hour = t_des.hour
    t_src.minute = t_des.minute
    t_src.second = t_des.second
end

function increment!(t1, seconds)
    t_sec = timetoint(t1)
    t_sec += seconds
    new_t = inttotime(t_sec)

    copytime(t1, new_t)
end

function increment(t1, seconds)
    t_sec = timetoint(t1)
    t_sec += seconds
    inttotime(t_sec)
end

function multime(t1, operand)
    t1_sec = timetoint(t1)
    t1_sec *= operand

    inttotime(t1_sec)
end

function getpace(t1, distance)
    t1_sec = timetoint(t1)
    pace_int = t1_sec / distance
    inttotime(pace_int)
end

t1 = MyTime(2, 30, 17)
printtime(t1)

pace = getpace(t1, 30)
println(pace)