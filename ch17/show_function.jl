using Printf

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

function Base.show(io::IO, time::MyTime)
    @printf(io, "%02d:%02d:%02d", time.hour, time.minute, time.second)
end

my_time = MyTime(3, 0, 1)
println(my_time)