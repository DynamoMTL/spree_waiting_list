class Spree::StockRequestsController < Spree::BaseController
  layout false
  def new
    @stock_request = Spree::StockRequest.new(params[:stock_request])
  end

  def create
    @stock_request = Spree::StockRequest.new(params[:stock_request])

    if @stock_request.save
      respond_to do |format|
        format.html { redirect_to root_path, :notice => t(:successful_stock_request) }
        format.js
      end
    else
      render :action => 'new'
    end
  end
end
