require_relative '../../lib/rules/total_discount'

describe TotalDiscount do
  subject(:total_discount) { described_class.new(percent: 10, require_total: 60) }

  describe '#apply' do
    it 'is expected apply the total discount' do
      expect(total_discount.apply(70, {})).to eq 7
    end

    it 'is expected without discount on prices less than require_total' do
      expect(total_discount.apply(50, {})).to eq 0
    end
  end
end
