using StatsBase

open("day-6-data.txt") do file
    group, people = "", 0
    total = 0

    for ln in eachline(file)
        if ln != ""
            group = group*ln #append each person to the group
            people += 1 #each line counts as one person in the group
        else
            counts = countmap([c for c in group])
                        #Add the number of lettercounts that equal
                        #the number of people in the group
            total += sum(count == people for count in values(counts))

            #Initialize a new group, which has 0 people in it
            group, people = "", 0
        end
    end

    println(total)
end
