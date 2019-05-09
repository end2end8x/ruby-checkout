require_relative '../../lib/checkout'

describe 'Integration Specs' do
  let(:products_total_price_over) do
    {
        001 => Product.new('Lavender heart', 9.25),
        002 => Product.new('Personalised cufflinks', 45.0),
        003 => Product.new('Kids T-shirt', 19.95)
    }
  end
  subject(:checkout_total) { Checkout.new products: products_total_price_over }

  let(:products_buy_more_lavender) do
    {
        001 => Product.new('Lavender heart', 9.25),
        003 => Product.new('Kids T-shirt', 19.95),
        001 => Product.new('Lavender heart', 9.25)
    }
  end
  subject(:checkout_more_lavender) { Checkout.new products: products_buy_more_lavender }

  it 'Test spend over £60 get 10% off' do
    checkout_total.scan 001
    checkout_total.scan 002
    checkout_total.scan 003

    expect(checkout_total.total).to eq '£66.78'
  end

  it 'Test buy 2 or more lavender hearts' do
    checkout_more_lavender.scan 001
    checkout_more_lavender.scan 003
    checkout_more_lavender.scan 001

    expect(checkout_more_lavender.total).to eq '£36.95'
  end
end