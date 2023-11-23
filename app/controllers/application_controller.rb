class ApplicationController < ActionController::Base
  before_action :load_cart

  private

  def load_cart
    session[:cart] ||= []
    @cart = session[:cart]
  end
end
