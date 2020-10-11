def grocery_price_list(item) 
    groceries = {'Milk' => 3.97, 'Bread' => 2.17, 'Banana' => 0.99, 'Apple' => 0.89}
    groceries[item]
end

# def sale_price(item)
#     if (item == 'Milk' || item == 'Bread')
#         grocery_price_list(item)
 
#     end
    


puts grocery_price_list('Milk')