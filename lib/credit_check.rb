# I need to create a method where the card number is converted to an array
# that stores integers, then multiply by 2 the elements stored in the uneven 
# indexes of that array. Then evaluate the elements that are >=10, add both 
# digits and store that result in the same index. Then sum all the elements
# of the last array and find if that sum result is divisible by 10.

# LONG Luhn Algorithm 
# def Luhn_Algorithm(card_number) 
#     #Convert that string to an array, making each number an index
#     card_numbers = card_number.split("")
#     #Convert each element on the array to an integer
       
#     card_numbs = card_numbers.map{|x| x.to_i} 
#     p card_numbs

#     n = card_number.length
#     n.times { |x|
#         card_numbers[x] = (card_numbers[x].to_i)
#     }
    
#     # Multiply every other element by 2, starting by the first, (2* uneven element)
#     card_multiplication = Array.new
#     n.times {|x| 
#         if x.even?
#             card_multiplication[x] = card_numbers[x] * 2
#         else
#             card_multiplication[x] = card_numbers[x]
#         end
#         x += 1
#     }

#     # Evaluate the elements that are >=10, add both digits and store that result 
#     # in the same index.
#     card_additions = Array.new
#     n.times {|x|
#         if card_multiplication[x] >= 10
#             card_additions[x] = ((card_multiplication[x]/10) + (card_multiplication[x]%10))
#             x += 1
#         else 
#             card_additions[x] = card_multiplication[x]
#         end
#     }
#     # sum all the elements of the last array 
#     card_addition = card_additions.sum
    
#     #Evaluate if that sum result is divisible by 10.
#     if (card_addition%10) == 0
#         puts "The number #{card_number} is valid!"
#     else
#         puts "The number #{card_number} is invalid!"
#     end
# end


# # SHORT Luhn Algorithm 
def Luhn_Algorithm(card_number) 
    #Convert that string to an integer
    card_number = card_number.to_i
    #Store integer in an array 
    card_numbers = card_number.digits.reverse
         
    # Multiply every other element by 2, starting by the first, 
    # (2* even-index element)
    card_multiplication = []
    card_numbers.each_index do |i|
        if i.even?
            card_multiplication << (card_numbers[i] *2)
        else
            card_multiplication << card_numbers[i]
        end
    end

    # Evaluate the elements that are >=10, add both digits and store that result 
    # in the same index.
    card_additions = Array.new
    card_multiplication.each do |n|
        if n >= 10
            card_additions << n.digits.sum
        else
            card_additions << n
        end
    end
   
    # sum all the elements of the last array 
    card_addition = card_additions.sum
    
    #Evaluate if that sum result is divisible by 10.
    if (card_addition%10) == 0
        puts "The number #{card_number} is valid!"
        true
    else
        puts "The number #{card_number} is invalid!"
        false
    end
end

Luhn_Algorithm("5541808923795240")

Luhn_Algorithm("4024007136512380")

Luhn_Algorithm("6011797668867828")

Luhn_Algorithm("5541801923795240")

Luhn_Algorithm("4024007106512380")

Luhn_Algorithm("6011797668868728")

# Iteration 4 - Extensions
# Create a command line interface that allows the user to validate a number
user_input = ARGV
   Luhn_Algorithm(user_input[0])

# Add functionality to calculate the check sum digit. I need to receive a
# payload number and calculate a checksum number that, when added at the end
# of the payload number, makes the credir card number valid.



# Can you make it work for American Express numbers? 342804633855673 is valid but 342801633855673 is invalid
