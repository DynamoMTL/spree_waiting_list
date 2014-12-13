Spree::Admin::ReportsController.class_eval do

  add_available_report! :stock_requests

  def stock_requests
    @search = Spree::StockRequest.ransack(params[:search])
    @stock_requests = @search.result
  end

end
