open("day-1-data.txt") do file
    data = [parse(Int, ln) for ln in eachline(file)]

#Part 1
    for i in 1:length(data)
        for j in i:length(data)
            if data[i] + data[j] != 2020
                continue
            elseif data[i]+data[j] == 2020
                println("Product of the two that add to 2020: ",
                    data[i]*data[j])
                break
            end
        end
    end

#Part 2:
    for i in 1:length(data)
        for j in i:length(data)
            for k in j:length(data)
                if data[i]+data[j]+data[k]!= 2020
                    continue
                elseif data[i]+data[j]+data[k] == 2020
                    println("Product of the three that add to 2020: ",
                        data[i]*data[j]*data[k])
                    break
                end
            end
        end
    end
end
