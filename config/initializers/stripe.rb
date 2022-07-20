require 'stripe'
Stripe.api_key = ENV["stripe_api_key"]
STRIPE_PUBLIC_KEY = ENV["stripe_publishable_key"]

#Stripe::Product.create({name: 'Basic Plan', id: '1'})
#Stripe::Product.create({name: 'Pro Plan', id: '2'})