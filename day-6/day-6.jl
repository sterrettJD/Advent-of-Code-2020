using StatsBase

open("day-6-data.txt") do file
    group = ""
    total = 0

    for ln in eachline(file)
        if ln != ""
            group = group*ln #append group with the new line
        else
            counts = countmap([c for c in group]) #returns dict with char count
            total += length(keys(counts)) #The number of unique characters

            #Initialize a new group after each empty line
            group = ""
        end
    end
    println(total)
end
