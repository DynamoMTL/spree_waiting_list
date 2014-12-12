Spree::UserMailer.class_eval do
  def back_in_stock(stock_request)
    @request = stock_request
    @product = stock_request.product
    @variant = stock_request.variant

    mail(:subject => Spree.t(:back_in_stock_subject, :product_name => @product.name),
         :from    => from_address,
         :to      => stock_request.email)
  end
end