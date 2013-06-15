class Spree::StockRequestsController < Spree::BaseController
  def new
    @stock_request = StockRequest.new(params[:stock_request])
  end

  def create
    @stock_request = StockRequest.new(params[:stock_request])
    @stock_request.email = current_user.email if current_user

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
