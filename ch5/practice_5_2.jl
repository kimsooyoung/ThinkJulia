function timeCalculator(cur_time)
    min = 60
    hour = min * 60
    day = hour * 24

    past_day = cur_time ÷ day

    past_hour = cur_time % day ÷ hour
    past_min = cur_time % hour ÷ min
    past_sec = cur_time % min

    println("Past Day : $past_day \nPast Hour : $past_hour \nPast Min : $past_min \nPast Sec : $past_sec")

    if cur_time == past_day * day + past_hour * hour + past_min * min + past_sec
        println("Test Pass")
    end
end

timeCalculator(time())