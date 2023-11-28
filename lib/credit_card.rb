
class CreditCard 
    attr_reader :card_number, :limit
def initialize (card_number, limit)
    @card_number = card_number
    @limit = limit
    #Convert Card Number string to an array, making each number an index
    card_numbers = @card_number.split('')
    #Convert each element on the array to an integer
    @card_numbers = card_numbers.map{|x| x.to_i}
end

def is_valid?
    # Multiply every other element by 2, starting by the first, 2*(even index's element)
    n = @card_number.length
    card_multiplication = Array.new
    n.times {|x| 
        if x.even?
            card_multiplication[x] = @card_numbers[x] * 2
        else
            card_multiplication[x] = @card_numbers[x]
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
   
    #Evaluate if that sum result is divisible by 10.
    ((card_additions.sum)%10) == 0  
end

def last_four
   lfour_dig = @card_numbers.last(4).join("")
end
end