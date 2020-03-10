
class CashRegister
  attr_accessor :total, :discount, :items, :prices

  def initialize(discount=0)
    @total = 0
    @discount = discount
    @items = []
    @prices = []
  end

  def add_item(item, price, quantity=1)
    @total += price*quantity
    @discounts = price*quantity*(discount.to_f/100)
    quantity.times {@items << item; @prices << price}
  end

  def apply_discount
    message = ""
    if @discount != 0
      @total -= @discounts
      message = "After the discount, the total comes to $#{@total.to_i}."
    else
      message = "There is no discount to apply."
    end
    message
  end

  def void_last_transaction
    last_item = @items[-1]
    last_price = @prices[-1]
    first_target_item = @items.find_index(last_item)
    quantity = @items.length-first_target_item
    @total -= last_price * quantity
  end

end
