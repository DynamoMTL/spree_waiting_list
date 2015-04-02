module Spree
  class StockRequestsController < StoreController
    layout false

    def new
      @stock_request = StockRequest.new(stock_request_params)
    end

    def create
      @stock_request = StockRequest.new(stock_request_params)
      @stock_request.email = try_spree_current_user.email if try_spree_current_user

      respond_to do |format|
        if @stock_request.save
          format.html { redirect_to root_path, notice: Spree.t(:successful_stock_request) }
          format.js
          format.json { render json: { status: 201, message: Spree.t(:successful_stock_request) } }
        else
          format.html { render action: 'new'}
          format.json { render json: @stock_request.errors, status: :unprocessable_entity }
        end
      end
    end

    private

    def stock_request_params
      params.require(:stock_request).permit(permitted_attributes.stock_request_attributes)
    end
  end
end
