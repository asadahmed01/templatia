class WebhooksController < ApplicationController
    skip_before_action :verify_authenticity_token
  
    def create
      # Parse the request body as JSON
      user_hash = {}

      payload = request.body.read
      sig_header = request.env['HTTP_STRIPE_SIGNATURE']
      event = nil
  
      # Verify the signature header
      begin
        event = Stripe::Webhook.construct_event(
          payload, sig_header, ENV["STRIPE_WEBHOOK"]
        )
      rescue JSON::ParserError => e
        # Invalid payload
        render json: { message: e.message }, status: 400
        return
      rescue Stripe::SignatureVerificationError => e
        # Invalid signature
        render json: { message: e.message }, status: 401
        return
      end
  
      # Handle the event type

      if event.type == 'checkout.session.completed'
        stripe_session = event.data.object
        user_info = stripe_session['customer_details']
        # Create a hash to store user information
        user_hash[:name] = user_info['name']
        user_hash[:email] = user_info['email']
        product_id = stripe_session['metadata']['product_id']

        user_hash[:template_id] = product_id
        TemplateMailer.with(user_hash: user_hash).template_sent.deliver_now

      else
        puts "Unhandled event type: #{event.type}"
      end
  

      # Return a 200 response
      render json: { message: 'Success' }
    end
  end