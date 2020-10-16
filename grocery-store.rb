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
        else
            final_price = quantity * grocery_price_list(item)
        end   
        
    else 
        final_price = quantity * grocery_price_list(item)
    end
        
end

def items_purchased
    available_items = ['apple','banana','bread','milk']
    items_to_purchase = []
    puts "Please enter all the items purchased separated by a comma"
    items = gets.chomp
    items.split(',').each{|element| 
        items_to_purchase.push(element) if available_items.include?(element.strip.downcase)
        puts "#{element} is not present in grocery store" unless available_items.include?(element.strip.downcase) }
    items_to_purchase.tally
end

def print_bill
    items = items_purchased
    total_price = 0
    saved = 0
    puts "Item\t  Quantity\tPrice"
    puts'------------------------------------'           
    items.each{ |item,quantity| 
    puts "#{item.capitalize}\t   #{quantity}\t\t$#{final_price(item,quantity).round(2)}"
    total_price += final_price(item,quantity)
    saved += (grocery_price_list(item) * quantity) - final_price(item,quantity)
    }
    puts "Total Price: $#{total_price.round(2)}"
    puts "You saved $#{saved.round(2)} today."
    
end

print_bill