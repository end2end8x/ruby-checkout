require_relative '../../lib/rules/product_discount'

describe ProductDiscount do
  subject(:product_discount) { described_class.new(code: "001", require_quantity: 2, discount: 8.5, price: 9.25) }

  describe '#apply' do
    it 'is expected apply quantity of product discount' do
      expect(product_discount.apply(37, { "001" => 4 })).to eq 3
    end

    it 'is expected without discount on quantity less than require_quantity' do
      expect(product_discount.apply(9.25, { "001" => 1 })).to eq 0
    end
  end
end