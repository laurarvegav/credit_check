# I need to create a method where the card number is converted to an array
# and multiply by 2 the elements stored in the uneven indexes of that
# array. Then evaluate the elements that are >=10, add both digits and
# store that result in the same index. Then sum all the elements of
# the last array and find if that sum result is divisible by 10.

# # Your Luhn Algorithm Here
def Luhn_Algorithm(card_number)
    #Convert that string to an array, making each number an index
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
    
    #Evaluate if that sum result is divisible by 10.
    if (card_addition%10) == 0
        puts "The number #{card_number} is valid!"
    else puts "The number #{card_number} is invalid!"
    end
end

card_number = "5541808923795240"
Luhn_Algorithm(card_number)

card_number = "4024007136512380"
Luhn_Algorithm(card_number)

card_number = "6011797668867828"
Luhn_Algorithm(card_number)

card_number = "5541801923795240"
Luhn_Algorithm(card_number)

card_number = "4024007106512380"
Luhn_Algorithm(card_number)

card_number = "6011797668868728"
Luhn_Algorithm(card_number)
