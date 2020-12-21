open("day-2-data.txt") do file
    data = [split(ln) for ln in eachline(file)]
    passedone = 0
    passedtwo = 0

    for i in 1:length(data)
        data[i][2] = data[i][2][1:end-1]
        rule = [parse(Int,x) for x in split(data[i][1],"-")]

        minlet, maxlet = rule[1], rule[2]

        if (count(data[i][2], data[i][3]) >= minlet) & (count(data[i][2], data[i][3]) <= maxlet)
            passedone += 1
        end

        if (string(data[i][3][rule[1]]) == String(data[i][2])) ⊻ (string(data[i][3][rule[2]]) == String(data[i][2]))
            passedtwo += 1
        end
    end
    
    println("This many passwords passed for part 1: ", passedone)
    println("This many passwords passed for part 2: ", passedtwo)
end
