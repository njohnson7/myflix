# config/initializers/stripe.rb

Stripe.api_key = ENV['stripe_api_key']

# StripeEvent.configure do |events|
#   events.subscribe 'charge.succeeded' do |event|
#     Payment.create
#   end

  # events.subscribe 'charge.failed' do |event|
  #   # Define subscriber behavior based on the event object
  #   event.class       #=> Stripe::Event
  #   event.type        #=> "charge.failed"
  #   event.data.object #=> #<Stripe::Charge:0x3fcb34c115f8>
  # end

  # events.all do |event|
  #   # Handle all event types - logging, etc.
  # end
# end
