class StockRequestsController < Spree::BaseController 
  def new
    @stock_request = StockRequest.new(params[:stock_request])
  end

  def create
    @stock_request = StockRequest.create(params[:stock_request])

    if @stock_request.valid?
      respond_to do |format|
        format.html { redirect_to root_path, :notice => t(:successful_stock_request) }
        format.js
      end
    else
      render :action => 'new'
    end
  end
end
