class CustomersController < ApplicationController
    respond_to :json, :html
    helper_method :customers, :customer
    #before_filter :remove_id

    def index
      respond_with customers
    end
    
    def new
      respond_with customer
    end
    
    def create
      customer.save
      respond_with customer, :location => :customers
    end
    
    def show
      render :action => :new
    end
    
    def update
      customer.update_attributes(params[:customer])
      respond_with customer
    end
    
    def destroy
      customer.destroy
      respond_with customer
    end

  protected

    def customer
      @customer ||= params[:id].present? ? Customer.find(params[:id]) : Customer.new(params[:customer])
    end
    
    def customers
      @customers ||= Customer.all
    end
    
    def remove_id
      params[:customer].delete("id") if (params[:customer] || {}).has_key? "id"
    end
end
