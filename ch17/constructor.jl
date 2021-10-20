using Printf
 
mutable struct MyTime
    hour :: Int64
    minute :: Int64
    second :: Int64
    function MyTime(hour::Int64 = 0, minute::Int64 = 0, second::Int64 = 0)
        @assert(0 ≤ minute ≤ 60, "Minutes out of range." )
        @assert(0 ≤ second ≤ 60, "Seconds out of range." )
        m_time = new()
        m_time.hour = hour
        m_time.minute = minute
        m_time.second = second
        m_time
    end
end

function printtime(time::MyTime)
    @printf("%02d:%02d:%02d", time.hour, time.minute, time.second)
end

my_time = MyTime(10, 12, 30)
printtime(my_time)