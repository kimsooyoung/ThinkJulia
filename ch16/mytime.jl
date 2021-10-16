"""
Represensts the time of the day.

fields : hour, minute, second

"""

struct MyTime
    hour
    minute
    second
end

m_time = MyTime(2, 30, 17)
println(m_time)