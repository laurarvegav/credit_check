class CreditCard (card_number,limit)
attr_reader :card_number, :limit

    #Convert Card Number string to an array, making each number an index
    card_numbers = card_number.split('')
    #Convert each element on the array to an integer
    card_numbers = card_numbers.map{|x| x.to_i}

    # Multiply every other element by 2, starting by the first, (2* uneven element)
    n = card_number.length
    card_multiplication = Array.new
    n.times {|x| 
        if x.even?
            card_multiplication[x] = card_numbers[x] * 2
        else
            card_multiplication[x] = card_numbers[x]
        end
        x += 1
        }

    # Evaluate the elements that are >=10, add both digits and  store that result 
    # in the same index.
    card_additions = Array.new
    n.times {|x|
        if card_multiplication[x] >= 10
        card_additions[x] = ((card_multiplication[x]/10) + (card_multiplication[x]%10))
        x += 1
        else card_additions[x] = card_multiplication[x]
        end
        }
    # sum all the elements of the last array 
    card_addition = card_additions.sum

def is_valid?
        
    #Evaluate if that sum result is divisible by 10.
    if (card_addition%10) == 0
        puts "True"
    else puts "False"
    end
end

def last_four (card_number)
    puts card_numbers[-4 .. -1]
end

end