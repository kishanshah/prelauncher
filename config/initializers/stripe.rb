Rails.configuration.stripe = {
  :publishable_key => ENV['pk_test_SDoVjFWbeWXuw2B3p2w4pc77'],
  :secret_key      => ENV['sk_test_0yscYk9kpAKJb58Bhv604ZXs']
}

Stripe.api_key = Rails.configuration.stripe[:secret_key]