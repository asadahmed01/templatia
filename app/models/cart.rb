# app/models/cart.rb
class Cart < ApplicationRecord
    has_many :cart_items
  end
  