require_relative '../lib/basket'

describe Basket do
  let(:product_001) { double :Product, code: "001", price: 9.25 }
  let(:product_002) { double :Product, code: "002", price: 45.0 }
  let(:products) { [product_001, product_002] }
  let(:total_discount) { TotalDiscount.new(percent: 10, require_total: 60) }
  let(:rules) { [total_discount] }

  subject(:basket) { described_class.new(rules, products: products) }

  describe '#total' do
    it 'is expected total price of basket origin' do
      order = { "001" => 1, "002" => 1 }
      expect(basket.total(order)).to eq 54.25
    end

    it 'is expected total price of basket after applied total discount' do
      allow(total_discount).to receive(:apply).and_return 0
      order = { "001" => 2 }
      expect(basket.total(order)).to eq 18.5
    end
  end
end
