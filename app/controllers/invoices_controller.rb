class InvoicesController < ApplicationController
  respond_to :json
  helper_method :invoices, :invoice

  def index
    respond_with invoices
  end

  def create
    raise invoice.inspect
    invoice.save
    respond_with invoice.to_json, :location => :invoices
  end

  def show
    respond_with invoice
  end

  def update
    respond_with invoice.update_attributes(params[:invoice])
  end

  def destroy
    respond_with invoice
  end

protected
    def invoices
      @invoices ||= Invoice.all
    end
    def invoice
      @invoice ||= params[:id].present? ? Invoice.find(params[:id]) : Invoice.new(params[:invoice])
    end
end
