class ProductDiscount
  attr_reader :code, :require_quantity, :discount, :price

  def initialize(code:, require_quantity:, discount:, price:)
    @code = code
    @require_quantity = require_quantity
    @discount = discount
    @price = price
  end

  def apply(total_origin, order)
    is_valid_rule(order) ? apply_discount(order) : 0
  end

  private

  def is_valid_rule(order)
    order[code] >= require_quantity
  end

  def apply_discount(order)
    order[code] * (price - discount)
  end
end
