class CashRegister
  attr_reader :discount
  attr_writer :total
  attr_accessor :items, :last_transaction_total

  def initialize(discount = 0)
    @discount = discount
    @total = 0
    @items = []
  end

  # getter method for @total
  def total
    @total
  end

  def add_item(title, price, quantity = 1)
     if quantity > 1
      @total += price * quantity
      quantity.times { |i| @items << title }
      @last_transaction_total = price * quantity
     else
      @total += price
      @items << title
      @last_transaction_total = price
     end
  end

  def apply_discount
    if discount != 0
      percent_disc = @discount.to_f/100.0
      @total = @total - (percent_disc * @total)
      "After the discount, the total comes to $#{self.total.to_i}."
    else
      "There is no discount to apply."
    end
  end

  def void_last_transaction
    self.items.pop()
    @total = @total - @last_transaction_total
  end
end
