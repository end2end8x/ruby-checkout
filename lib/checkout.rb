require_relative 'basket'

module Checkout
  class Checkout
    attr_reader :products, :basket, :order

    def initialize(rules = nil, products: nil, basket: Basket)
      @products = products
      @basket = basket.new(rules, products: products)
      @order = Hash.new(0)
    end

    def scan(code)
      fail "#{code} product not found" unless filter_products?(code)
      @order[code] += 1
    end

    def total
      basket.total(order).round(2)
    end

    private

    def filter_products?(product_code)
      products.map{ |product| product.code }
          .include?(product_code)
    end
  end
end
