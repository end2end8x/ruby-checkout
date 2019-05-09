require_relative '../lib/basket'

describe Basket do
  it { is_expected.to respond_to :total }
end