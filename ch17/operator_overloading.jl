using Printf
import Base.+

struct MyTime
    hour :: Int64
    minute :: Int64
    second :: Int64
    function MyTime(hour::Int64 = 0, minute::Int64 = 0, second::Int64 = 0)
        @assert(0 ≤ minute ≤ 60, "Minutes out of range." )
        @assert(0 ≤ second ≤ 60, "Seconds out of range." )
        new(hour, minute, second)
    end
end

function MyTime(time::MyTime)
    MyTime(time.hour, time.minute, time.second)
end

function inttotime(seconds::Int64)
    minute, second = divrem(seconds, 60)
    hour, minute   = divrem(minute, 60)    
    
    MyTime(hour, minute, second)
end

function timetoint(time::MyTime)
    seconds = 3600 * time.hour + 60 * time.minute + time.second
    seconds
end

function increment(time::MyTime, second_in::Int64)
    int_time = timetoint(time)
    int_time += second_in
    inttotime(int_time)
end

function Base.show(io::IO, time::MyTime)
    @printf(io, "%02d:%02d:%02d", time.hour, time.minute, time.second)
end

function +(t1::MyTime, t2::MyTime)
    inttotime(timetoint(t1) + timetoint(t2))
end

function +(time::MyTime, seconds::Int64)
    increment(time, seconds)
end

function +(seconds::Int64, time::MyTime)
    time + seconds
end

my_time = MyTime(3, 14, 50)
println(my_time)

println(my_time + 25)

t1 = MyTime(1,0,0)
t2 = MyTime(1,0,0)
t3 = MyTime(1,0,0)
println(sum((t1, t2, t3)))

println(methods(increment))