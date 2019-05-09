require_relative '../lib/product'

describe Product do
  subject(:product) { described_class.new(code: '001', name: 'Lavender heart', price: 9.25) }

  describe '#code' do
    it 'is expected to return code' do
      expect(product.code).to eq '001'
    end
  end

  describe '#name' do
    it 'is expected to return name' do
      expect(product.name).to eq 'Lavender heart'
    end
  end

  describe '#price' do
    it 'is expected to return price' do
      expect(product.price).to eq 9.25
    end
  end

end
