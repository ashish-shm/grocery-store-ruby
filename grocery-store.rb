def grocery_price_list(item) 
    groceries = {'milk' => 3.97, 'bread' => 2.17, 'banana' => 0.99, 'apple' => 0.89}
    groceries[item]
end

def sale_price(item)
    sale_price = {'milk' => 5, 'bread' => 6}
    sale_price[item]
end

def final_price(item, quantity)
    case item
    when "milk"
        if (quantity > 1)
            sale_price_quantity = quantity/2
            left_quantity = quantity%2
            final_price = (sale_price_quantity * sale_price(item)) + (left_quantity * grocery_price_list(item))  

        else
            final_price = quantity * grocery_price_list(item)
        end
        
    when "bread"
        if(quantity > 1)
            sale_price_quantity = quantity/3
            left_quantity = quantity%3
            final_price = (sale_price_quantity * sale_price(item)) + (left_quantity * grocery_price_list(item))
        else    print items

            final_price = quantity * grocery_price_list(item)
        end
        
    else 
        final_price = (quantity * grocery_price_list(item))
    end
        
end

def items_purchased
    puts "Please enter all the items purchased separated by a comma"
    items = gets.chomp
    items = items.split(',').collect{|element| element.strip.downcase}.tally
end


def print_bill
    items = items_purchased
    total_price = 0
    puts ' Item         Quantity        Price'
    puts'--------------------------------------'           
    items.each{ |item,quantity| 
    puts "#{item.capitalize}           #{quantity}          $#{final_price(item,quantity)}"
    total_price += final_price(item,quantity)

    }
    
end

print_bill


