require_relative '../lib/checkout'

describe Checkout::Checkout do

  let(:basket_klass) { double :Basket_klass, new: basket }
  let(:basket) { double :Basket }

  let(:products) do
    [
        Product.new(code: '001', name: 'Lavender heart', price: 9.25),
        Product.new(code: '002', name: 'Personalised cufflinks', price: 45.0),
        Product.new(code: '003', name: 'Kids T-shirt', price: 19.95)
    ]
  end

  subject(:checkout) { described_class.new(products: products, basket: basket_klass) }

  describe '#scan' do
    it 'is expected return quantity of product' do
      expect(checkout.scan('003')).to eq 1
    end
    it 'is expected raise error 004 product not found' do
      expect{ checkout.scan('004') }.to raise_error '004 product not found'
    end
  end

  describe '#total' do
    it 'is expected return prices after applied rules' do
      checkout.scan('001')
      checkout.scan('001')
      allow(basket).to receive(:total).with({'001' => 2}).and_return(17)
      expect(checkout.total).to eq 17
    end
  end
end
