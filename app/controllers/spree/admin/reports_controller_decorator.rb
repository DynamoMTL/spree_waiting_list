Spree::Admin::ReportsController.class_eval do
  Spree::Admin::ReportsController::AVAILABLE_REPORTS[:stock_requests] = {:name => 'Stock Requests', :description => 'Out of stock product requests'}
  def stock_requests
    @search = Spree::StockRequest.ransack(params[:search])
    @stock_requests = @search.result
  end
end
