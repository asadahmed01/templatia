class TemplatesController < ApplicationController
    before_action :load_cart, only: [:add_to_cart, :remove_from_cart, :cart]
    before_action :set_template, only: [:add_to_cart]

    def index
      @templates = Template.all
    end
  
    def show
      @template = Template.find(params[:id])
    end
  
    def new
      @template = Template.new
    end
  
    def create
      @template = Template.new(template_params)
      if @template.save
        redirect_to @template
      else
        render :new
      end
    end
  
    def edit
      @template = Template.find(params[:id])
    end
  
    def update
      @template = Template.find(params[:id])
      if @template.update(template_params)
        redirect_to @template
      else
        render :edit
      end
    end
  
    def destroy
      @template = Template.find(params[:id])
      @template.destroy
      redirect_to templates_path
    end

    def add_to_cart
      respond_to do |format|
        if !@cart.include?(params[:id].to_i)
          @cart << params[:id].to_i
          format.html { redirect_to template_path(@template), notice: 'Item added to cart successfully.' }
        else
          format.html { redirect_to template_path(@template), alert: 'Item already in cart!' }
        end
      end
    end

    def remove_from_cart
      template_id = params[:id].to_i

      respond_to do |format|
        if @cart.include?(template_id)
          @cart.delete(template_id)
          format.html { redirect_to cart_templates_path(@template), notice: 'Item removed!' }
        else
          format.html { redirect_to cart_templates_path(@template), notice: 'Error!' }
        end
      end
    end

    def cart
        @cart_items = Template.find(load_cart_items)
    end

    
    private

    def load_cart_items
      session[:cart] ||= []
      @cart = session[:cart]
    end
  
    def set_template
      @template = Template.find(params[:id])
    end

    def template_params
      params.require(:template).permit(:name, :description, :price, :template_file, thumbnails: [])
    end
  end
  