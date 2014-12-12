Spree::Admin::ReportsController.add_available_report! :stock_requests

Spree::Admin::ReportsController.class_eval do

  def stock_requests
    @search = Spree::StockRequest.search(params[:search])

    respond_to do |format|
      format.html do
        @stock_requests = @search.page(params[:page])
      end
      format.csv do
        @stock_requests = @search.all
      end
    end
  end

end
