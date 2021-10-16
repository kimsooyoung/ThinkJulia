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
    @printf("%02d:%02d:%02d", my_time.hour, my_time.minute, my_time.second)
end

m_time = MyTime(2, 30, 17)
printtime(m_time)