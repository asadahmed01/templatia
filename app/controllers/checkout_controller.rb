class CheckoutController < ApplicationController

    def index

    end

    def create
        TemplateMailer.template_sent.deliver_later
    end
end
