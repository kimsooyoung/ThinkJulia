using Printf
import Base.+

struct MyTime
    second_from_midnight::Int64
    function MyTime(second_in::Int64)
        temp, second_in = divrem(second_in, 3600)
        new(second_in)
    end
end

function MyTime(time::MyTime)
    MyTime(time.second_from_midnight)
end

function increment(time::MyTime, second_in::Int64)
    temp, new_second = divrem(time.second_from_midnight + second_in, 3600)
    MyTime(new_second)
end

function Base.show(io::IO, time::MyTime)
    @printf(io, "%02d", time.second_from_midnight)
end

function +(t1::MyTime, t2::MyTime)
    MyTime(t1.second_from_midnight + t2.second_from_midnight)
end

function +(time::MyTime, seconds::Int64)
    increment(time, seconds)
end

function +(seconds::Int64, time::MyTime)
    time + seconds
end

my_time = MyTime(4500)
println(my_time)

println(my_time + 4000)
