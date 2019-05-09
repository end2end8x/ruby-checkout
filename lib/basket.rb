class Basket
  attr_reader :prices, :rules

  def initialize(rules, products: nil)
    @rules = rules
    @prices = get_prices(products)
  end

  def total(order)
    discount(total_origin(order), order)
  end

  private

  def get_prices(products)
    products.map { |product| [product.code, product.price] }
        .to_h
  end

  def discount(origin_prices, order)
    rules.reduce(origin_prices) do |current_total, rule|
      current_total - rule.apply(current_total, order)
    end
  end

  def total_origin(order)
    order.reduce(0) do | sum, (product, quantity)|
      sum += prices_with_quantity(product, quantity)
    end
  end

  def prices_with_quantity(product, quantity)
    prices[product] * quantity
  end
end
