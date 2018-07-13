# app/models/stripe_wrapper.rb

module StripeWrapper
  class Charge
    def self.create options = {}
      Stripe::Charge.create(
        amount:      options[:amount],
        currency:    'usd',
        card:        options[:card],
        description: options[:description]
      )
    end
  end
end
