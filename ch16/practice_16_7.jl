# https://docs.julialang.org/en/v1/stdlib/Dates/#Dates-and-Time-Types
# https://en.wikibooks.org/wiki/Introducing_Julia/Working_with_dates_and_times
# add Dates in julia interpreter

using Printf
using Dates

# 1
function gettoday(cur_year, cur_month, cur_date)
    today = DateTime(cur_year, cur_month, cur_date)
    Dates.dayname(today)
end

# 2
function nextbday(b_month, b_date)
    t_now = Dates.now()
    b_day = DateTime(Dates.year(t_now), b_month, b_date)
    next_b_day = b_day + Dates.Year(1)

    dt = Dates.value(next_b_day - Dates.now())

    dt_sec, dt_millisec = divrem(dt, 1000)
    dt_min, dt_sec = divrem(dt_sec, 60)
    dt_hour, dt_min = divrem(dt_min, 60)
    dt_day, dt_hour = divrem(dt_hour, 24)

    output = Dates.canonicalize(Dates.CompoundPeriod(next_b_day - Dates.now()))
    @show output

    println("$(dt_day)-$(dt_hour):$(dt_min):$(dt_sec):$(dt_millisec)")
end

# 3
function finddoubleday(b_1, b_2)
    t_now = now()

    if b_2 < b_1
        b_1, b_2 = b_2, b_1
    end

    date_now = DateTime(Dates.year(t_now), Dates.month(t_now), Dates.day(t_now))

    lifeday_1 = Dates.value(convert(Dates.Day, date_now - b_1))
    lifeday_2 = Dates.value(convert(Dates.Day, date_now - b_2))

    if lifeday_1 ≥ lifeday_2 * 2
        extra_day = lifeday_1 - 2 * lifeday_2
        return date_now + Dates.Day(extra_day)
    else
        return nothing
    end
end

# 4
function findnday(b_1, b_2, n)
    t_now = now()

    if b_2 < b_1
        b_1, b_2 = b_2, b_1
    end

    date_now = DateTime(Dates.year(t_now), Dates.month(t_now), Dates.day(t_now))

    lifeday_1 = Dates.value(convert(Dates.Day, date_now - b_1))
    lifeday_2 = Dates.value(convert(Dates.Day, date_now - b_2))

    if lifeday_1 ≥ lifeday_2 * n
        extra_day = lifeday_1 - n * lifeday_2
        return date_now + Dates.Day(extra_day)
    else
        println("No Answer...")
        return nothing
    end
end


cur_year = 2021
cur_month = 10
cur_date = 18

# 1
println(gettoday(cur_year, cur_month, cur_date))
# 2 
nextbday(cur_month, cur_date)
# 3
b_1 = DateTime(2021, 9, 20)
b_2 = DateTime(2021, 10, 8)
println(finddoubleday(b_1, b_2))
# 4
b_1 = DateTime(2021, 9, 1)
b_2 = DateTime(2021, 10, 8)
println(findnday(b_1, b_2, 3))