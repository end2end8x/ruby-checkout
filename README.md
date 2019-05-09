# Introduction
Our client is an online marketplace, here is a sample of some of the products available on our site:

Product code	|   Name					|	Price
----------------------------------------------------------
001				|   Lavender heart			|	£9.25

002				|   Personalised cufflinks	|	£45.00

003				|   Kids T-shirt			|	£19.95

This is just an example of products, your system should be ready to accept any kind of product.

Our marketing team wants to offer promotions as an incentive for our customers to purchase these items.

If you spend over £60, then you get 10% off of your purchase. If you buy 2 or more lavender hearts then the price drops to £8.50.

Our check-out can scan items in any order, and because our promotions will change, it needs to be flexible regarding our promotional rules.

The interface to our checkout looks like this (shown in Ruby):


co = Checkout.new(promotional_rules)    
co.scan(item)   
co.scan(item)   
price = co.total    

Implement a checkout system that fulfills these requirements. Do this outside of any frameworks.  
We’re looking for candidates to demonstrate their knowledge of TDD.

Test data
---------
Basket: 001,002,003  
Total price expected: £66.78    


Basket: 001,003,001  
Total price expected: £36.95    


Basket: 001,002,001,003  
Total price expected: £73.76    


# Checkout

Welcome to your new gem! In this directory, you'll find the files you need to be able to package up your Ruby library into a gem. Put your Ruby code in the file `lib/checkout`. To experiment with that code, run `bin/console` for an interactive prompt.

TODO: Delete this and the text above, and describe your gem

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'checkout'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install checkout

## Usage

TODO: Write usage instructions here

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/end2end8x/ruby-checkout. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Checkout project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/checkout/blob/master/CODE_OF_CONDUCT.md).
