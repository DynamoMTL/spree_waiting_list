Admin::ReportsController::AVAILABLE_REPORTS[:stock_requests] = {:name => 'Stock Requests', :description => 'Out of stock product requests'}

Admin::ReportsController.class_eval do

  def stock_requests
    @search = StockRequest.search(params[:search])

    respond_to do |format|
      format.html do
        @stock_requests = @search.paginate(:page => params[:page])
      end
      format.csv do
        @stock_requests = @search.all
      end
    end
  end

end
