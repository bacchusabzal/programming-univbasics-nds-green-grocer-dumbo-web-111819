def find_item_by_name_in_collection(name, collection)
  # Implement me first!
  #
  # Consult README for inputs and outputs
  
  
end

def consolidate_cart(cart)
  # Consult README for inputs and outputs
  #
  # REMEMBER: This returns a new Array that represents the cart. Don't merely
  # change `cart` (i.e. mutate) it. It's easier to return a new thing.
  
   consolidated_cart = {}
  
  cart.each do |item|
    item_name = item.keys[0]
    
    consolidated_cart[item_name] = item.values[0]

    if consolidated_cart[item_name][:count] 
      consolidated_cart[item_name][:count] += 1
    else
      consolidated_cart[item_name][:count] = 1
    end
  end

  consolidated_cart
  
end

def apply_coupons(cart, coupons)
  # Consult README for inputs and outputs
  #
  # REMEMBER: This method **should** update cart
  coupons.each do |coupon|
    coupon_name = coupon[:item]
    coupon_item_num = coupon[:num]
    cart_item = cart[coupon_name]

    next if cart_item.nil? || cart_item[:count] < coupon_item_num

    cart_item[:count] -= coupon_item_num

    coupon_in_cart = cart["#{coupon_name} W/COUPON"]

    if coupon_in_cart
      coupon_in_cart[:count] += 1
    else
      cart["#{coupon_name} W/COUPON"] = { 
        price: coupon[:cost], 
        clearance: cart_item[:clearance], 
        count: 1
      }
    end
  end

  cart
end

def apply_clearance(cart)
  # Consult README for inputs and outputs
  #
  # REMEMBER: This method **should** update cart
  cart.each do |item_name, item_data|
    if item_data[:clearance]
      item_data[:price] = (item_data[:price] * 0.8).round(1)
    end
  end
end

def checkout(cart, coupons)
  # Consult README for inputs and outputs
  #
  # This method should call
  # * consolidate_cart
  # * apply_coupons
  # * apply_clearance
  #
  # BEFORE it begins the work of calculating the total (or else you might have
  # some irritated customers
end
