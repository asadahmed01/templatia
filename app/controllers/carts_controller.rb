# app/controllers/carts_controller.rb
class CartsController < ApplicationController
    before_action :load_cart
  
    def add_to_cart
        debugger
      template = Template.find(params[:template_id])
      @cart << { template_id: template.id, quantity: 1 }
      redirect_back fallback_location: root_path, notice: 'Template added to cart successfully.'
    end
  
    def view_cart
        @cart_items = load_cart_items
    end
  
    private
  
    def load_cart
      session[:cart] ||= []
      @cart = session[:cart]
    end
  end
  