# spec/requests/create_payment_on_successful_charge_spec.rb

describe 'Create payment on successful charge' do
  let(:event_data) do
    {
      "id": "evt_1CnRQmEXB5cAsLlf2GZqJBRG",
      "object": "event",
      "api_version": "2018-05-21",
      "created": 1531488932,
      "data": {
        "object": {
          "id": "ch_1CnRQmEXB5cAsLlfdSS86Wxi",
          "object": "charge",
          "amount": 999,
          "amount_refunded": 0,
          "application": nil,
          "application_fee": nil,
          "balance_transaction": "txn_1CnRQmEXB5cAsLlfIkoX2q4a",
          "captured": true,
          "created": 1531488932,
          "currency": "usd",
          "customer": nil,
          "description": "Sign up charge for fff@ff.com",
          "destination": nil,
          "dispute": nil,
          "failure_code": nil,
          "failure_message": nil,
          "fraud_details": {
          },
          "invoice": nil,
          "livemode": false,
          "metadata": {
          },
          "on_behalf_of": nil,
          "order": nil,
          "outcome": {
            "network_status": "approved_by_network",
            "reason": nil,
            "risk_level": "normal",
            "seller_message": "Payment complete.",
            "type": "authorized"
          },
          "paid": true,
          "receipt_email": nil,
          "receipt_number": nil,
          "refunded": false,
          "refunds": {
            "object": "list",
            "data": [

            ],
            "has_more": false,
            "total_count": 0,
            "url": "/v1/charges/ch_1CnRQmEXB5cAsLlfdSS86Wxi/refunds"
          },
          "review": nil,
          "shipping": nil,
          "source": {
            "id": "card_1CnRQlEXB5cAsLlfktJn8WUB",
            "object": "card",
            "address_city": nil,
            "address_country": nil,
            "address_line1": nil,
            "address_line1_check": nil,
            "address_line2": nil,
            "address_state": nil,
            "address_zip": nil,
            "address_zip_check": nil,
            "brand": "Visa",
            "country": "US",
            "customer": nil,
            "cvc_check": "pass",
            "dynamic_last4": nil,
            "exp_month": 7,
            "exp_year": 2019,
            "fingerprint": "K3ctpQO2s8le0BrR",
            "funding": "credit",
            "last4": "4242",
            "metadata": {
            },
            "name": nil,
            "tokenization_method": nil
          },
          "source_transfer": nil,
          "statement_descriptor": nil,
          "status": "succeeded",
          "transfer_group": nil
        }
      },
      "livemode": false,
      "pending_webhooks": 1,
      "request": {
        "id": "req_YxDO7fl64VWs1O",
        "idempotency_key": nil
      },
      "type": "charge.succeeded"
    }
  end

  it 'creates a payment with the webhook from stripe for charge succeeded', :vcr do
    # headers = { "CONTENT_TYPE" => "application/json" }
    # payload = File.read '/home/one/launchschool/5310/myflix/spec/requests/event_data.json'

    # post "/stripe_events", params: { body: event_data.to_s }, headers: headers
    #  # post "/widgets", params: '{ "widget": { "name":"My Widget" } }', :headers => headers
    #    # expect(response).to redirect_to(assigns(:widget))

    # post '/stripe_events', event_data
    # expect(Payment.count).to eq 1
  end
end
