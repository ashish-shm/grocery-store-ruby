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
            final_price = (sale_price_quantity * 5) + (left_quantity * grocery_price_list(item))  
        end
        
    when "bread"
        if(quantity > 1)
            sale_price_quantity = quantity/3
            left_quantity = quantity%3
            final_price = (sale_price_quantity * 6) + (left_quantity * grocery_price_list(item))
        end
        
    else 
        final_price = (quantity * grocery_price_list(item))
    end
        
end

def items_purchased
    puts "Please enter all the items purchased separated by a comma"
    items = gets.chomp
    items = items.split(',').collect{|element| element.strip}
    print items
end

items_purchased