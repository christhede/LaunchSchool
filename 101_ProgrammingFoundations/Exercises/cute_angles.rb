DEGREE = "\xC2\xB0"



def dms(degree)
    degree_whole = degree.round.abs
    div, rem = degree.divmod(1)

    min, sec = (rem * 60).divmod(1)
    seconds = (sec * 60).round

    puts "#{div}#{DEGREE}#{min}'#{seconds}"
end



dms(-30) == %(30°00'00")
dms(-76.73) == %(76°43'48")
dms(254.6) == %(254°36'00")
dms(93.034773) == %(93°02'05")
dms(0) == %(0°00'00")
dms(360) == %(360°00'00") || dms(360) == %(0°00'00")