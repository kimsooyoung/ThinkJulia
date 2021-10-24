using Printf

struct MyTime
    hour :: Int64
    minute :: Int64
    second :: Int64

    function MyTime(hour_in::Int64=0, minute_in::Int64=0, second_in::Int64=0)
        @assert( 0 ≤ minute_in ≤ 60, "Minutes must btw 0 to 60" )
        @assert( 0 ≤ second_in ≤ 60, "Seconds must btw 0 to 60" )
        new(hour_in, minute_in, second_in)
    end
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

function isafter(t1::MyTime, t2::MyTime)
    (t1.hour, t1.minute, t1.second) > (t2.hour, t2.minute, t2.second)
end

function printtime(time::MyTime)
    @printf("%02d:%02d:%02d\n", time.hour, time.minute, time.second)
end 

my_time = MyTime(2, 53, 54)
printtime(my_time)

println(inttotime(timetoint(my_time)))

my_time = increment(my_time, 10)
printtime(my_time)