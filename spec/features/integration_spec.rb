require_relative '../../lib/checkout'
require_relative '../../lib/product'
require_relative '../../lib/rules/product_discount'
require_relative '../../lib/rules/total_discount'

describe 'Integration Specs' do
  let(:products) do
    [
        Product.new(code: '001', name: 'Lavender heart', price: 9.25),
        Product.new(code: '002', name: 'Personalised cufflinks', price: 45.0),
        Product.new(code: '003', name: 'Kids T-shirt', price: 19.95)
    ]
  end

  let(:total_discount) { TotalDiscount.new(percent: 10, require_total: 60) }
  let(:product_discount) { ProductDiscount.new(code: "001", require_quantity: 2, discount: 8.5, price: 9.25) }
  let(:rules) { [product_discount, total_discount] }

  subject(:checkout) { Checkout.new(rules, products: products) }
  subject(:checkout_total) { Checkout.new([total_discount], products: products) }
  subject(:checkout_more_lavender) { Checkout.new([product_discount], products: products) }

  it 'Test spend over £60 get 10% off. Expected 66.78' do
    checkout_total.scan '001'
    checkout_total.scan '002'
    checkout_total.scan '003'

    expect(checkout_total.total).to eq 66.78
  end

  it 'Test buy 2 or more lavender hearts. Expected 36.95' do
    checkout_more_lavender.scan '001'
    checkout_more_lavender.scan '003'
    checkout_more_lavender.scan '001'

    expect(checkout_more_lavender.total).to eq 36.95
  end

  it 'Combine rules discount applied. Expected 73.76' do
    checkout.scan '001'
    checkout.scan '002'
    checkout.scan '001'
    checkout.scan '003'

    expect(checkout.total).to eq 73.76
  end

end