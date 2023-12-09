class CheckoutsController < ApplicationController
    before_action :load_template, only: [:new, :create]
  
    def new
      # Assuming you want to display information about the template on the new page
    end
  
    def create
        stripe_session = Stripe::Checkout::Session.create(
            ui_mode: 'embedded',
            line_items: [{
              price_data: {
                unit_amount: (@template.price * 100).to_i,
                currency: 'cad',
                product_data: {
                    name: @template.name,
                    images: [url_for(@template.thumbnails.first)]
                },
              },
              quantity: 1
            }],
            mode: 'payment',
            metadata: {
              product_id: @template.id,
            },
            return_url: templates_url,
        )
      render json: { clientSecret: stripe_session.client_secret}
    end
  
    private
  
    def load_template
      @template = Template.find(session[:cart].first)
    end
  end
  