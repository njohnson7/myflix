# spec/models/stripe_wrapper_spec.rb

describe StripeWrapper do
  describe StripeWrapper::Charge do
    describe '.create' do
      it 'makes a successful charge', :vcr do
        Stripe.api_key = ENV['stripe_api_key']
        token = Stripe::Token.create(
          card: {
            number:    '4242424242424242',
            exp_month: 7,
            exp_year:  2019,
            cvc:       '314'
          },
        ).id

        response = StripeWrapper::Charge.create(
          amount:      999,
          card:        token,
          description: 'a valid charge'
        )

        expect(response.amount).to eq 999
        expect(response.currency).to eq 'usd'
      end
    end
  end
end
