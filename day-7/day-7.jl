open("day-7-data.txt") do file
  data = Dict{String,Array}()

  for ln in eachline(file)
    key, val = split(ln, " bags contain ")[1], split(ln, " bags contain")[2][1:end-1]
    data[key] = [String(strip(v[3:end-4])) for v in split(val, ",")]
  end

  current = ["shiny gold"]
  possible_bags = Array{String,1}()

  while length(current) > 0
    new = Array{String,1}()

    for (k, v) in pairs(data) #If a bag in our current set of outer bags is in
                              #one of the inner bag lists, append its housing bag
      for bag in current
        if bag in v
          push!(possible_bags, k)
          push!(new, k)
        end
      end
    end
    current = new   #Now just deal with the new outer bags from the last round
  end

  println("There are ", length(unique(possible_bags)), " possible outer bags.")
end
