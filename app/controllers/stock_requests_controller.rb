class StockRequestsController < Spree::BaseController 
  def new
    @stock_request = StockRequest.new
  end
end
