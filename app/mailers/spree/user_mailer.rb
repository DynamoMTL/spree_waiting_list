module Spree
  UserMailer.class_eval do
    def back_in_stock(request)
      @request = request
      @product = request.product
      @variant = request.variant

      mail(:subject => t("back_in_stock_subject", :product_name => @product.name),
           :from    => Spree::Config[:order_from],
           :to      => request.email)
    end
  end
end
